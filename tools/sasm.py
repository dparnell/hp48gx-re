"""Assembler for the ROM source tree written by disasm.py.

The input mixes Saturn assembly (SASM mnemonics, as printed by saturn.py)
and RPL objects (RPLCOMP-like), and assembles a 1M-nibble image.

Usage: python sasm.py SOURCE [-o OUT.bin] [--check ROM]
       SOURCE is the top file (out/src/rom.s); OUT is packed two nibbles per
       byte, low nibble first, like ROM/gxrom-r. --check compares the result
       with ROM and reports the first differences.

Source format
-------------
* Comments: a line whose first non-blank character is `*`, or the rest of a
  line from a `*` token that follows whitespace ("A=0 A  * clear").
* `name:` at the start of a line defines a label. `name EQU expr` defines a
  constant. Names may hold any non-blank characters except `"`.
* Expressions: a symbol, `#hex`, decimal, `(*)` (this address), optionally
  followed by `+n`/`-n` ("L_0097B+1", "(*)+5").
* Directives, in either mode:
    ORG expr          the address of the next line (must not move backward)
    INCLUDE "path"    relative to the including file
    ASSEMBLE / RPL    switch to Saturn or RPL mode
    CON(n) expr       n nibbles, little-endian
    REL(n) expr       expr minus this address, n nibbles
    NIBHEX hex        nibbles in memory order
    NIBASC "text"     bytes, low nibble first (escape: \\xx hex, \\" and \\\\)
    $BODY "text"      a string body without prolog: length (5), then bytes
    BSS n             n zero nibbles
    GLYPHS "png" rows first count [widths]   font glyphs from a sheet (16 per
                      row, gray gutters): one byte per row, bit 0 at the
                      left; with widths (hex, one per glyph), each glyph
                      starts with its width nibble (minifont)
* Saturn mode: one instruction per line, e.g. `A=DAT1 A`, `LC(5) DOBINT`,
  `GOSBVL POP#`, `?C=0 A` then `GOYES label` / `RTNYES` on the next line.
* RPL mode: `::` `;` `{` `}` `SYMBOL` `UNIT`, `# hex`, `% real`, `%% real`,
  `C% re im`, `C%% re im`, `CHR "c"` or `CHR #xx`, `$ "text"`, `HXS hex`,
  `ID name`, `LAM name`, `TAG "text"`, `ROMPTR lib cmd`, `ACPTR expr expr`,
  `GROB "png"`, `CODE` ... `ENDCODE` (Saturn lines in between). Any other
  token is a pointer to that symbol; `PTR expr` says so explicitly.
"""
import re
import struct
import sys
import zlib
from pathlib import Path

from saturn import Decoder

ROM_SIZE = 0x100000

PROLOG = {
    "DOBINT": 0x02911, "DOREAL": 0x02933, "DOEREL": 0x02955, "DOCMP": 0x02977,
    "DOECMP": 0x0299D, "DOCHAR": 0x029BF, "DOARRY": 0x029E8, "DOLNKARRY": 0x02A0A,
    "DOCSTR": 0x02A2C, "DOHSTR": 0x02A4E, "DOLIST": 0x02A74, "DORRP": 0x02A96,
    "DOSYMB": 0x02AB8, "DOEXT": 0x02ADA, "DOTAG": 0x02AFC, "DOGROB": 0x02B1E,
    "DOLIB": 0x02B40, "DOBAK": 0x02B62, "DOEXT0": 0x02B88, "DOACPTR": 0x02BAA,
    "DOEXT2": 0x02BCC, "DOEXT3": 0x02BEE, "DOEXT4": 0x02C10, "DOCOL": 0x02D9D,
    "DOCODE": 0x02DCC, "DOIDNT": 0x02E48, "DOLAM": 0x02E6D, "DOROMP": 0x02E92,
}
SEMI = 0x0312B
OPENERS = {"::": "DOCOL", "{": "DOLIST", "SYMBOL": "DOSYMB", "UNIT": "DOEXT"}
RPL_WORDS = set(OPENERS) | {";", "}", "#", "%", "%%", "C%", "C%%", "CHR", "$", "HXS",
                            "ID", "LAM", "TAG", "ROMPTR", "ACPTR", "GROB", "CODE",
                            "ENDCODE", "PTR"}
DIRECTIVES = {"ORG", "INCLUDE", "ASSEMBLE", "RPL", "NIBHEX", "NIBASC", "BSS", "EQU",
              "GLYPHS", "$BODY"}
KEYWORDS = RPL_WORDS | DIRECTIVES


class AsmError(Exception):
    pass


# ---------------------------------------------------------------- encoding
_TABLE = None


def _table():
    """Encodings of every instruction without an address or hex operand,
    found by running the decoder over all opcode prefixes. The first (lowest)
    encoding of a text wins, so don't-care bits come out as zero."""
    global _TABLE
    if _TABLE is not None:
        return _TABLE
    t = {}

    def visit(nibs):
        d = Decoder(bytes(nibs) + bytes(8))
        ins = d.decode(0)
        first = ins.text.split("\n")[0]
        if ins.flow == "stop" or any(t.startswith("#") for t in first.split()[1:]):
            return
        size = ins.size - (2 if "\n" in ins.text else 0)
        if size == len(nibs):
            t.setdefault(" ".join(first.split()), list(nibs))

    def prefixes(n, head=()):
        if len(head) == n:
            yield head
            return
        for x in range(16):
            yield from prefixes(n, head + (x,))

    for n in (2, 3, 4):
        for p in prefixes(n):
            visit(p)
    for p in prefixes(5, (8,)):
        visit(p)
    for head in ((8, 1, 8), (8, 1, 0xA)):
        for p in prefixes(6, head):
            visit(p)
    t["NOP5"] = [6, 4, 0, 0, 0]
    _TABLE = t
    return t


def digits(v, n):
    """n nibbles of v, least significant first."""
    return [(v >> (4 * i)) & 0xF for i in range(n)]


def rel(target, base, n, signed=True):
    off = target - base
    lim = 1 << (4 * n)
    if signed and not -(lim // 2) <= off < lim // 2:
        off = (target - base) & 0xFFFFF
        if off >= 0x80000:
            off -= 0x100000
        if not -(lim // 2) <= off < lim // 2:
            raise AsmError("branch out of range (%d)" % off)
    return digits(off & (lim - 1), n)


BRANCHES = {
    # mnemonic: (opcode nibbles, offset nibbles, offset base relative to pc)
    "GOC": ([4], 2, 1), "GONC": ([5], 2, 1), "GOTO": ([6], 3, 1),
    "GOSUB": ([7], 3, 4), "GOLONG": ([8, 0xC], 4, 2), "GOSUBL": ([8, 0xE], 4, 6),
}
ABSOLUTE = {"GOVLNG": [8, 0xD], "GOSBVL": [8, 0xF]}
POINTER_LOADS = {"D0=(2)": [1, 9], "D0=(4)": [1, 0xA], "D0=(5)": [1, 0xB],
                 "D1=(2)": [1, 0xD], "D1=(4)": [1, 0xE], "D1=(5)": [1, 0xF]}


# ---------------------------------------------------------------- reals
def encode_real(text, exp_n, mant_n):
    """BCD body of a real: exponent (tens complement), mantissa, sign."""
    m = re.fullmatch(r"(-?)(\d)(?:\.(\d*))?E(-?\d+)", text)
    if not m:
        raise AsmError("bad real %r" % text)
    sign, lead, frac, exp = m.groups()
    mant = (lead + (frac or "")).ljust(mant_n, "0")
    if len(mant) > mant_n:
        raise AsmError("too many digits in %r" % text)
    e = int(exp) % (10 ** exp_n)
    out = [int(c) for c in reversed("%0*d" % (exp_n, e))]
    out += [int(c) for c in reversed(mant)]
    out.append(9 if sign else 0)
    return out


def format_real(nibs, exp_n, mant_n):
    """Inverse of encode_real, or None when the body is not canonical."""
    e = nibs[:exp_n]
    mant = nibs[exp_n:exp_n + mant_n]
    s = nibs[exp_n + mant_n]
    if any(x > 9 for x in e + mant) or s not in (0, 9):
        return None
    ev = int("".join(str(x) for x in reversed(e)))
    if ev >= 10 ** exp_n // 2:
        ev -= 10 ** exp_n
    md = "".join(str(x) for x in reversed(mant))
    frac = md[1:].rstrip("0")
    txt = "%s%s%sE%d" % ("-" if s == 9 else "", md[0], "." + frac if frac else "", ev)
    return txt if encode_real(txt, exp_n, mant_n) == list(nibs) else None


# ---------------------------------------------------------------- strings
# The HP 48 character set: ASCII, then these at #80-#9F, then Latin-1.
HP_CHARS = "∡ā∇√∫Σ▶π∂≤≥≠α→←↓↑γδεηθλρστωΔΠΩ■∞"  # x̄ is written ā
HP_BYTE = {c: 0x80 + i for i, c in enumerate(HP_CHARS)}


def hp_char(b):
    """Readable text for HP character b, or None when it needs an escape."""
    if 0x20 <= b < 0x7F:
        return chr(b)
    if 0x80 <= b < 0xA0:
        return HP_CHARS[b - 0x80]
    if b > 0xA0 and b != 0xAD:
        return chr(b)
    return None


def char_byte(c):
    if c in HP_BYTE:
        return HP_BYTE[c]
    if ord(c) > 255:
        raise AsmError("%r is not in the HP character set" % c)
    return ord(c)


def unescape(s):
    out = []
    i = 0
    while i < len(s):
        c = s[i]
        if c == "\\":
            if s[i + 1] in "\\\"":
                out.append(ord(s[i + 1]))
                i += 2
            else:
                out.append(int(s[i + 1:i + 3], 16))
                i += 3
        else:
            out.append(char_byte(c))
            i += 1
    return out


def escape(bs):
    out = []
    for b in bs:
        if b in (0x22, 0x5C):
            out.append("\\" + chr(b))
        else:
            out.append(hp_char(b) or "\\%02X" % b)
    return '"' + "".join(out) + '"'


def bytes_nibs(bs):
    return [x for b in bs for x in (b & 0xF, b >> 4)]


# ---------------------------------------------------------------- PNG
def png_write(path, rows, gray=None):
    """Write rows of pixel values: 1 = black, 0 = white, 2 = gray."""
    shade = {0: 255, 1: 0, 2: 200}
    w = len(rows[0])
    raw = b"".join(b"\x00" + bytes(shade[p] for p in r) for r in rows)

    def chunk(t, d):
        return struct.pack(">I", len(d)) + t + d + struct.pack(">I", zlib.crc32(t + d))
    png = b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack(">IIBBBBB", w, len(rows), 8, 0, 0, 0, 0))
    png += chunk(b"IDAT", zlib.compress(raw, 9)) + chunk(b"IEND", b"")
    Path(path).write_bytes(png)


def png_read(path):
    """Rows of 0/1 (dark = 1) from an 8-bit or 1-bit gray, RGB or RGBA PNG."""
    data = Path(path).read_bytes()
    if data[:8] != b"\x89PNG\r\n\x1a\n":
        raise AsmError("%s is not a PNG" % path)
    p = 8
    idat = b""
    while p < len(data):
        ln, typ = struct.unpack(">I4s", data[p:p + 8])
        body = data[p + 8:p + 8 + ln]
        if typ == b"IHDR":
            w, h, depth, ctype, _, _, interlace = struct.unpack(">IIBBBBB", body)
        elif typ == b"IDAT":
            idat += body
        p += 12 + ln
    if interlace or (ctype, depth) not in ((0, 8), (0, 1), (2, 8), (6, 8), (4, 8)):
        raise AsmError("%s: unsupported PNG format" % path)
    chans = {0: 1, 2: 3, 4: 2, 6: 4}[ctype]
    bpp = max(1, chans * depth // 8)
    stride = (w * chans * depth + 7) // 8
    raw = zlib.decompress(idat)
    rows = []
    prev = bytearray(stride)
    for y in range(h):
        f = raw[y * (stride + 1)]
        line = bytearray(raw[y * (stride + 1) + 1:(y + 1) * (stride + 1)])
        for i in range(stride):
            a = line[i - bpp] if i >= bpp else 0
            b = prev[i]
            c = prev[i - bpp] if i >= bpp else 0
            if f == 1:
                line[i] = (line[i] + a) & 255
            elif f == 2:
                line[i] = (line[i] + b) & 255
            elif f == 3:
                line[i] = (line[i] + (a + b) // 2) & 255
            elif f == 4:
                pa, pb, pc = abs(b - c), abs(a - c), abs(a + b - 2 * c)
                pr = a if pa <= pb and pa <= pc else (b if pb <= pc else c)
                line[i] = (line[i] + pr) & 255
        prev = line
        if depth == 1:
            rows.append([0 if (line[x // 8] >> (7 - x % 8)) & 1 else 1 for x in range(w)])
        else:
            rows.append([1 if line[x * chans] < 100 else 0 for x in range(w)])
    return rows


def grob_png_rows(h, w, nibs):
    """PNG rows for a grob body; None if the row padding is not zero."""
    stride = (w + 7) // 8 * 2
    rows = []
    for y in range(h):
        row = nibs[y * stride:(y + 1) * stride]
        bits = [(row[x // 4] >> (x % 4)) & 1 for x in range(stride * 4)]
        if any(bits[w:]):
            return None
        rows.append(bits[:w])
    return rows


def grob_nibs(rows, w):
    stride = (w + 7) // 8 * 2
    out = []
    for r in rows:
        nib = [0] * stride
        for x, v in enumerate(r):
            if v:
                nib[x // 4] |= 1 << (x % 4)
        out += nib
    return out


# Font sheets: 16 glyphs per row, each 8 pixels wide, separated by gray lines.
def glyph_sheet(glyph_rows, rows):
    count = len(glyph_rows)
    cols = 16
    lines = (count + cols - 1) // cols
    W, H = cols * 9 + 1, lines * (rows + 1) + 1
    img = [[2 if (x % 9 == 0 or y % (rows + 1) == 0) else 0 for x in range(W)] for y in range(H)]
    for i, g in enumerate(glyph_rows):
        gx, gy = (i % cols) * 9 + 1, (i // cols) * (rows + 1) + 1
        for y, byte in enumerate(g):
            for x in range(8):
                if (byte >> x) & 1:
                    img[gy + y][gx + x] = 1
    return img


def sheet_glyphs(img, rows, count):
    out = []
    for i in range(count):
        gx, gy = (i % 16) * 9 + 1, (i // 16) * (rows + 1) + 1
        out.append([sum(1 << x for x in range(8) if img[gy + y][gx + x] == 1) for y in range(rows)])
    return out


# ---------------------------------------------------------------- lexing
def split_line(line):
    """Tokens of a line without its comment; quoted strings stay whole."""
    toks = []
    i = 0
    n = len(line)
    while i < n:
        c = line[i]
        if c in " \t":
            i += 1
            continue
        if c == "*" and (i + 1 == n or line[i + 1] in " \t") or (c == "*" and not toks):
            break
        j = i
        while j < n and line[j] not in " \t":
            if line[j] == '"':
                j += 1
                while j < n and line[j] != '"':
                    j += 2 if line[j] == "\\" else 1
            j += 1
        toks.append(line[i:j])
        i = j
    return toks


def unquote(tok):
    if len(tok) < 2 or tok[0] != '"' or tok[-1] != '"':
        raise AsmError("expected a quoted string, got %r" % tok)
    return tok[1:-1]


NUM = re.compile(r"#[0-9A-Fa-f]+|\d+")


class Assembler:
    def __init__(self):
        self.symbols = {}
        self.mem = bytearray(ROM_SIZE)
        self.written = bytearray(ROM_SIZE)
        self.pass_ = 2
        self.root = Path(".")   # images are relative to the top source file

    # ------------------------------------------------------------ values
    def atom(self, t, pc):
        if t in self.symbols:
            return self.symbols[t]
        if t == "(*)":
            return pc
        if NUM.fullmatch(t):
            return int(t[1:], 16) if t[0] == "#" else int(t)
        return None

    def value(self, expr, pc):
        """Evaluate `atom (+|- atom)*`. Symbol names may themselves contain
        + and -, so each split is tried, longest atom first."""
        def terms(pos, sign):
            for j in range(len(expr), pos, -1):
                if j < len(expr) and expr[j] not in "+-":
                    continue
                v = self.atom(expr[pos:j], pc)
                if v is None:
                    continue
                if j == len(expr):
                    return sign * v
                rest = terms(j + 1, 1 if expr[j] == "+" else -1)
                if rest is not None:
                    return sign * v + rest
            return None

        v = terms(0, 1)
        if v is not None:
            return v
        if self.pass_ == 1:
            return 0
        raise AsmError("undefined symbol in %r" % expr)

    # ------------------------------------------------------------ one line
    def encode(self, toks, pc, state):
        """Nibbles for one line (labels and comments removed)."""
        op = toks[0]
        args = toks[1:]

        def arg(i=0):
            if i >= len(args):
                raise AsmError("%s needs an operand" % op)
            return args[i]

        m = re.fullmatch(r"(CON|REL)\((\d+)\)", op)
        if m:
            n = int(m.group(2))
            v = self.value(arg(), pc)
            if m.group(1) == "REL":
                v -= pc
            return digits(v & ((1 << 4 * n) - 1), n)
        if op == "NIBHEX":
            return [int(c, 16) for c in "".join(args)]
        if op == "NIBASC":
            return bytes_nibs(unescape(unquote(" ".join(args))))
        if op == "$BODY":
            body = bytes_nibs(unescape(unquote(" ".join(args))))
            return digits(len(body) + 5, 5) + body
        if op == "BSS":
            return [0] * self.value(arg(), pc)
        if op == "GLYPHS":
            rows, first, count = (self.value(a, pc) for a in args[1:4])
            widths = [int(c, 16) for c in args[4]] if len(args) > 4 else None
            img = png_read(self.root / unquote(arg()))
            out = []
            for i, g in enumerate(sheet_glyphs(img, rows, count)):
                if widths:
                    out.append(widths[i])
                out += [x for b in g for x in (b & 0xF, b >> 4)]
            return out
        if state["mode"] == "RPL":
            return self.rpl(op, args, pc, state)
        return self.saturn(op, args, pc)

    def saturn(self, op, args, pc):
        if op in BRANCHES:
            code, n, base = BRANCHES[op]
            return code + rel(self.value(args[0], pc), pc + base, n) if self.pass_ == 2 else code + [0] * n
        if op in ABSOLUTE:
            return ABSOLUTE[op] + digits(self.value(args[0], pc), 5)
        if op == "GOYES":
            return rel(self.value(args[0], pc), pc, 2) if self.pass_ == 2 else [0, 0]
        if op == "RTNYES":
            return [0, 0]
        if op in POINTER_LOADS:
            n = int(op[4])
            return POINTER_LOADS[op] + digits(self.value(args[0], pc), n)
        m = re.fullmatch(r"(LC|LA)\((\d+)\)", op)
        if m:
            n = int(m.group(2))
            a = args[0]
            if a.startswith("#") and len(a) == n + 1:
                v = int(a[1:], 16)
            else:
                v = self.value(a, pc)
            code = [3, n - 1] if m.group(1) == "LC" else [8, 0, 8, 2, n - 1]
            return code + digits(v, n)
        key = " ".join([op] + args)
        enc = _table().get(key)
        if enc is None:
            raise AsmError("unknown instruction %r" % key)
        return list(enc)

    def rpl(self, op, args, pc, state):
        p = lambda name: digits(PROLOG[name], 5)  # noqa: E731
        if op in OPENERS:
            return p(OPENERS[op])
        if op in (";", "}"):
            return digits(SEMI, 5)
        if op == "#":
            return p("DOBINT") + digits(int(args[0], 16), 5)
        if op in ("%", "%%"):
            return p("DOREAL" if op == "%" else "DOEREL") + encode_real(args[0], *((3, 12) if op == "%" else (5, 15)))
        if op in ("C%", "C%%"):
            sz = (3, 12) if op == "C%" else (5, 15)
            return p("DOCMP" if op == "C%" else "DOECMP") + encode_real(args[0], *sz) + encode_real(args[1], *sz)
        if op == "CHR":
            a = args[0]
            b = unescape(unquote(a)) if a.startswith('"') else [int(a[1:], 16)]
            return p("DOCHAR") + bytes_nibs(b)
        if op == "$":
            body = bytes_nibs(unescape(unquote(" ".join(args))))
            return p("DOCSTR") + digits(len(body) + 5, 5) + body
        if op == "HXS":
            body = [int(c, 16) for c in "".join(args)]
            return p("DOHSTR") + digits(len(body) + 5, 5) + body
        if op in ("ID", "LAM", "TAG"):
            a = " ".join(args)
            name = unescape(unquote(a)) if a.startswith('"') else [char_byte(c) for c in a]
            pro = {"ID": "DOIDNT", "LAM": "DOLAM", "TAG": "DOTAG"}[op]
            return p(pro) + digits(len(name), 2) + bytes_nibs(name)
        if op == "ROMPTR":
            return p("DOROMP") + digits(int(args[0], 16), 3) + digits(int(args[1], 16), 3)
        if op == "ACPTR":
            return p("DOACPTR") + digits(self.value(args[0], pc), 5) + digits(self.value(args[1], pc), 5)
        if op == "GROB":
            rows = png_read(self.root / unquote(args[0]))
            h, w = len(rows), len(rows[0])
            body = digits(h, 5) + digits(w, 5) + grob_nibs(rows, w)
            return p("DOGROB") + digits(len(body) + 5, 5) + body
        if op == "CODE":
            state["code"].append(pc)
            state["mode"] = "ASM"
            return p("DOCODE") + [0] * 5
        if op == "PTR":
            return digits(self.value(args[0], pc), 5)
        if args:
            raise AsmError("unexpected operands after %r" % op)
        return digits(self.value(op, pc), 5)

    # ------------------------------------------------------------ files
    def run(self, path):
        self.root = Path(path).parent
        for self.pass_ in (1, 2):
            self.pc = 0
            self.mem[:] = bytes(ROM_SIZE)
            self.written[:] = bytes(ROM_SIZE)
            self.file(Path(path))
        return self

    def file(self, path):
        state = {"mode": "ASM", "code": [], "dir": path.parent}
        for no, line in enumerate(path.read_text(encoding="utf-8").split("\n"), 1):
            try:
                self.line(line, state)
            except AsmError as e:
                raise AsmError("%s:%d: %s" % (path, no, e)) from None
            except (ValueError, IndexError, KeyError) as e:
                raise AsmError("%s:%d: %s: %r" % (path, no, type(e).__name__, line)) from None

    def line(self, line, state):
        toks = split_line(line)
        if not toks:
            return
        if toks[0].endswith(":") and len(toks[0]) > 1 and not (state["mode"] == "RPL" and toks[0] == "::"):
            name = toks[0][:-1]
            if self.pass_ == 1:
                if name in self.symbols:
                    raise AsmError("duplicate label %r" % name)
                self.symbols[name] = self.pc
            toks = toks[1:]
            if not toks:
                return
        op = toks[0]
        if len(toks) >= 3 and toks[1] == "EQU":
            if self.pass_ == 1:
                self.symbols[op] = self.value(toks[2], self.pc)
            return
        if op == "INCLUDE":
            sub = state["dir"] / unquote(toks[1])
            self.file(sub)
            return
        if op == "ORG":
            a = self.value(toks[1], self.pc)
            if a < self.pc:
                raise AsmError("ORG #%05X moves back from #%05X" % (a, self.pc))
            self.pc = a
            return
        if op in ("ASSEMBLE", "RPL"):
            state["mode"] = "ASM" if op == "ASSEMBLE" else "RPL"
            return
        if op == "ENDCODE":
            start = state["code"].pop()
            self.put(start + 5, digits(self.pc - start - 5, 5), overwrite=True)
            state["mode"] = "RPL"
            return
        self.put(self.pc, self.encode(toks, self.pc, state))

    def put(self, a, nibs, overwrite=False):
        if a + len(nibs) > ROM_SIZE:
            raise AsmError("past the end of the ROM")
        for i, x in enumerate(nibs):
            if self.written[a + i] and not overwrite:
                raise AsmError("#%05X written twice" % (a + i))
            self.mem[a + i] = x
            self.written[a + i] = 1
        if not overwrite:
            self.pc = a + len(nibs)

    def image(self):
        m = self.mem
        return bytes(m[i] | (m[i + 1] << 4) for i in range(0, ROM_SIZE, 2))


def main(argv):
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("source")
    ap.add_argument("-o", "--out")
    ap.add_argument("--check")
    a = ap.parse_args(argv[1:])
    try:
        asm = Assembler().run(a.source)
    except AsmError as e:
        print("error:", e)
        return 1
    gaps = ROM_SIZE - sum(asm.written)
    img = asm.image()
    if a.out:
        Path(a.out).write_bytes(img)
    print("assembled %d nibbles, %d symbols, %d nibbles unwritten" % (ROM_SIZE - gaps, len(asm.symbols), gaps))
    if a.check:
        ref = Path(a.check).read_bytes()
        if ref == img:
            print("identical to", a.check)
            return 0
        diffs = [i for i in range(ROM_SIZE) if ((ref[i // 2] >> (4 * (i & 1))) & 15) != asm.mem[i]]
        print("%d nibbles differ; first at %s" % (len(diffs), " ".join("#%05X" % d for d in diffs[:10])))
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
