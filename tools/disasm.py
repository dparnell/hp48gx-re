"""Write ROM rev R as commented source that sasm.py reassembles byte for byte.

Output (out/src, git-ignored because it is derived from HP's ROM):
  rom.s          top file: includes everything in address order
  equates.s      names for RAM and I/O addresses
  lower/, upper/ one file per region (data/rom-layout.txt, library parts)
  images/        GROB objects as PNG
  fonts/         the system fonts as glyph sheets (PNG)

Labels come from data/annotations.txt, then EDB/VBL names, then library
command names, then generated names (SUB_xxxxx for call targets, L_xxxxx,
OBJ_xxxxx). Every line is checked by assembling it; a line the assembler
cannot reproduce exactly is written as NIBHEX with the original text in a
comment. The whole tree is then assembled and compared with the ROM.

Usage: python disasm.py [--no-check]       (needs out/analysis.pickle)
"""
import bisect
import pickle
import re
import shutil
import sys
from collections import defaultdict
from pathlib import Path

import analyze  # noqa: F401  (needed to unpickle analyze.Item etc.)
import sasm
from rom import Rom
from rpl import Decoder as RplDecoder, DecodeError, PROLOGS, FIXED_BODY, LENGTH_PREFIXED, COMPOSITE
from symbols import Symbols

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "out"
SRC = OUT / "src"
DATA = ROOT / "data"
LOWER_END = 0x80000
SPLIT = 0x3000            # split regions into files of about this many nibbles
HARDWARE = 0x7E000        # D0=/D1= from here up are I/O windows (bank switcher at #7F000)
FILL_TO = 32              # zero fill at least this long between entries becomes FILLTO
COMMENT_COL = 48
MAX_XREFS = 6

# (start, rows, first code, count, with width nibble, file, description)
FONT_TABLES = [
    (0x7A2B3, 10, 0x1F, 0xE1, False, "font10", "10-row font (used when XM=1): code c at #7A047 + 20*c"),
    (0x7B447, 8, 0x1F, 0xE1, False, "font8", "8-row font (used when XM=0): code c at #7B257 + 16*c"),
    (0x7C257, 5, 0x1F, 0x66, True, "minifont", "minifont: index i at #7C102 + 11*i, an advance-width nibble then 5 rows"),
]
MINI_REMAP = (0x7C793, 0x7C855)    # minifont index for codes #9F-#FF, one byte each

# Upper ROM is covered by RAM; the library access handlers (#726A1, #72386,
# #70B38) uncover one window at a time to read library parts from it. A part
# may move within its window but not out of it, so each window starts with
# an ORG and ends with a FILLTO.
WINDOWS = (0x80000, 0x90000, 0xC0000)

# The self-test (#804D3) checks that each half of the ROM has CRC #FFFF; the
# last four nibbles of each half are the correction word (sasm's CRC).
CRC_WORDS = (0x7FFFC, 0xFFFFC)

# EDB names below this that end in "err" or "msg" are message numbers, not
# addresses (constuniterr = #B02 "Inconsistent Units").
MESSAGE_MAX = 0x1000

# Code that must stay where it is, whatever else moves.
PINNED = {
    0x0000F: "the CPU jumps here on an interrupt",
    0x028FC: "PRLG: every prolog starts with D=D-1 A, HST=0 0, whose nibbles CF820 "
             "read as the address #028FC, so running a prolog as an object comes here",
}

PROLOG_ADDRS = set(sasm.PROLOG.values())

OPENER = {"DOCOL": "::", "DOLIST": "{", "DOSYMB": "SYMBOL", "DOEXT": "UNIT"}


class Ref:
    """An address in a line, written as a name when one fits.
    kind: "ptr" (pointer or branch target), "rom" (a ROM address even when
    it is in upper ROM), "const" (an LC/LA value: named only when it is a
    known entry), "dptr" (a D0=/D1= address: I/O names allowed), "addr"
    (a constant data/operands.txt says is an address)."""
    __slots__ = ("addr", "src", "kind")

    def __init__(self, addr, src, kind="ptr"):
        self.addr, self.src, self.kind = addr & 0xFFFFF, src, kind


class Line:
    __slots__ = ("pc", "size", "parts", "comment", "mode", "after", "verify", "indent", "pre", "gap", "head")

    def __init__(self, pc, size, parts, comment="", mode=None, indent=0, verify=True, after=None):
        self.pc, self.size = pc, size
        self.parts = parts if isinstance(parts, list) else [parts]
        self.comment, self.mode, self.indent = comment, mode, indent
        self.verify, self.after = verify, after
        self.pre = []
        self.gap = False      # blank line before
        self.head = None      # print the comments for this address before the line


HP_TRANS = {0x80 + i: c for i, c in enumerate(sasm.HP_CHARS)}


def hp_map(text):
    """Names and comments are Latin-1 text with HP characters at #80-#9F
    (which include U+0085, a line break to Python); show them as the
    characters they are on the calculator."""
    return text.translate(HP_TRANS)


def hexs(nibs):
    return "".join("%X" % x for x in nibs)


def op(mnemonic, *operands):
    """Format `MNEMONIC operand`, operands being text or Refs."""
    parts = ["%-8s" % mnemonic if operands else mnemonic]
    for i, o in enumerate(operands):
        if i:
            parts.append(" ")
        parts.append(o)
    return parts


class Generator:
    def __init__(self):
        with open(OUT / "analysis.pickle", "rb") as f:
            self.s = pickle.load(f)
        self.rom = Rom()
        self.n = self.rom.n
        self.sym = Symbols()
        self.rd = RplDecoder(self.rom)
        self.items = self.s["items"]
        self.insns = self.s["insns"]
        self.xrefs = self.s["xrefs"]
        self.libcmd = {}
        for lib in self.s["libs"]:
            for cmd, a in enumerate(lib.commands):
                nm = lib.names.get(cmd) or self.s["romptr_names"].get((lib.num, cmd))
                self.libcmd[a] = (lib.num, cmd, nm)
        self.notes = defaultdict(list)      # addr -> annotation comments
        self.ann_names = {}
        for line in (DATA / "annotations.txt").read_text(encoding="utf-8").splitlines():
            if line.startswith("#") or not line.strip():
                continue
            a, name, comment = (line.split("\t") + ["", ""])[:3]
            a = int(a, 16)
            if name:
                self.ann_names[a] = name
            if comment:
                self.notes[a].append(comment)
        self.hints = {}                     # addr -> preferred generated name
        self.operands = {}                  # insn addr -> ("addr" or expression, note)
        for line in (DATA / "operands.txt").read_text(encoding="utf-8").splitlines():
            if line.startswith("#") or not line.strip():
                continue
            a, v, note = (line.split("	") + ["", ""])[:3]
            self.operands[int(a, 16)] = (v, note)
        for a, (lib, cmd, nm) in self.libcmd.items():
            self.hints[a] = "ROMP_%03X_%03X" % (lib, cmd)
        self.ref_targets = {a for a in self.xrefs if isinstance(a, int)} | set(self.s["data_refs"])
        # Words the emulator saw used as addresses (also inside objects such
        # as the hex string at #75675); data is written around them.
        self.slots = set(self.s.get("addr_slots", ()))
        self.ref_targets |= self.slots
        self.fallbacks = defaultdict(int)
        self.messages = {a for a, sy in self.sym.by_addr.items()
                         if a < MESSAGE_MAX and not sy.flags and re.search(r"(err|msg)$", sy.name or "")}

    # ================================================================ names
    @staticmethod
    def clean(name):
        name = "".join(sasm.HP_CHARS[ord(c) - 0x80] if 0x80 <= ord(c) < 0xA0 else c for c in name)
        name = re.sub(r'[\s"]', "_", name)
        return name

    def usable(self, name):
        return bool(name) and name not in sasm.KEYWORDS and name not in (":", "(*)") \
            and not sasm.NUM.fullmatch(name) and not name.startswith("*") \
            and not re.fullmatch(r"(CON|REL|LC|LA)\(\d+\)", name)

    def symbol_name(self, a):
        """A known name for ROM address a, or None."""
        if a in self.ann_names:
            return self.ann_names[a]
        if a in self.messages:
            return None
        s = self.sym.by_addr.get(a)
        if s and s.name and "RAM" not in s.flags and (a >= 0x140 or s.usage == "ASM") and a < LOWER_END:
            n = s.name
            if not re.fullmatch(r"<\w+h>|\[.*\]|.*\s.*", n):
                return n
        if a in self.libcmd and self.libcmd[a][2]:
            return self.libcmd[a][2]
        return None

    def assign(self, a, base):
        base = self.clean(base)
        if base.startswith("*"):
            base = "_" + base     # a leading * starts a comment
        if not self.usable(base):
            base = base + "_%05X" % a if base else "L_%05X" % a
        name = base
        if self.used.get(name, a) != a:
            name = "%s_%05X" % (base, a)
        self.used[name] = a
        self.label[a] = name
        return name

    def label_for(self, a):
        if a in self.label:
            return self.label[a]
        nm = self.symbol_name(a) or self.hints.get(a)
        if nm is None:
            kind = self.s["labels"].get(a)
            nm = {"sub": "SUB_", "obj": "OBJ_"}.get(kind, "L_") + "%05X" % a
        return self.assign(a, nm)

    def equate(self, a):
        if a in self.eq:
            return self.eq[a]
        s = self.sym.by_addr.get(a)
        nm = s.name if s and s.name else None
        if nm is None or re.search(r"\s", nm):
            nm = self.sym.ram.get(a)
        if nm is None or re.search(r"\s|\.\.", nm):
            return None
        nm = self.clean(nm)
        if not self.usable(nm):
            return None
        if self.used.get(nm, None) is not None:
            nm = "%s_%05X" % (nm, a)
        self.used[nm] = a
        self.eq[a] = nm
        return nm

    def resolve(self, r):
        a, k = r.addr, r.kind
        lit = "#%05X" % a
        if k == "const" and a in self.messages:
            return self.equate(a) or lit
        if a >= LOWER_END and r.src < LOWER_END and k != "rom":
            return self.equate(a) or lit           # RAM, as seen from lower ROM
        if a < 0x140:
            if k == "dptr" and a >= 0x100:
                return self.equate(a) or lit
            if k in ("const", "dptr"):
                return lit
        known = self.symbol_name(a) or a in self.s["labels"] or (
            a in self.items and self.items[a].kind in ("addrslot", "rplptr", "codeptr"))
        if k in ("const", "dptr") and not (a in self.line_start and known):
            return lit
        if a in self.line_start:
            return self.label_for(a)
        i = bisect.bisect_right(self.starts, a) - 1
        if i >= 0 and (a - self.starts[i] < 0x100 or k == "addr"):
            b = self.starts[i]
            return "%s+%d" % (self.label_for(b), a - b)
        return lit

    # ================================================================ data
    def data_lines(self, lo, hi, indent=0, mode=None):
        """NIBHEX lines (or BSS for zero runs), broken where something points."""
        out = []
        p = lo
        while p < hi:
            if p in self.slots and p + 5 <= hi and not any(p < e < p + 5 for e in self.ends):
                out.append(Line(p, 5, op("CON(5)", Ref(self.rom.addr(p), p, "addr")), comment="address",
                                indent=indent))
                p += 5
                continue
            q = p
            while q < hi and self.n[q] == 0 and (q == p or q not in self.ends):
                q += 1
            if q == hi and indent == 0 and mode is None and q > p and (
                    q - p >= FILL_TO or hi in WINDOWS or hi in CRC_WORDS):
                out.append(self.fill_line(p, q, force=True))
                p = q
                continue
            if q - p >= 16 or (q == hi and q - p >= 6) or (q < hi and q in self.ends and q > p):
                out.append(Line(p, q - p, op("BSS", str(q - p)), indent=indent, mode=mode))
                p = q
                continue
            q = min(hi, p + 32)
            for t in range(p + 1, q):
                if t in self.ref_targets or t in self.ends:
                    q = t
                    break
            # stop before a long zero run
            z = p
            while z < q:
                if z + 16 <= hi and not any(self.n[z:z + 16]):
                    q = max(z, p + 1)
                    break
                z += 1
            nb = self.n[p:q]
            txt = "".join(sasm.hp_char(nb[i] | nb[i + 1] << 4) or "." for i in range(0, len(nb) - 1, 2))
            out.append(Line(p, q - p, op("NIBHEX", hexs(nb)), comment=txt, indent=indent, mode=mode))
            p = q
        return out

    # ================================================================ code
    def insn_lines(self, a, indent=0):
        ins = self.insns[a]
        out = []
        texts = ins.text.split("\n")
        notes = []
        if a in self.s["presumed_uncond"]:
            notes.append("always taken")
        if getattr(ins, "info_never", False):
            notes.append("never taken")
        if a in self.s["inline_callers"]:
            notes.append("inline data follows")
        pc = a
        for k, t in enumerate(texts):
            size = ins.size - 2 if (len(texts) == 2 and k == 0) else (2 if k == 1 else ins.size)
            tok = t.split()
            mn = tok[0]
            if mn in sasm.BRANCHES or mn in sasm.ABSOLUTE or mn == "GOYES":
                parts = op(mn, Ref(int(tok[1][1:], 16), a))
            elif re.fullmatch(r"(LC|LA|D0=|D1=)\(5\)", mn):
                v = int(tok[1][1:], 16)
                given, why = self.operands.get(a, (None, ""))
                if why:
                    notes.append(why)
                # D0=/D1= of a ROM address is a pointer, but #7E000-#7FFFF
                # holds the bank switcher and port controls (CE1/CE2/NCE3)
                if given == "addr" or (given is None and mn[0] == "D" and 0x140 <= v < HARDWARE):
                    parts = op(mn, Ref(v, a, "addr"))
                elif given == "num":
                    parts = op(mn, tok[1])
                elif given:
                    parts = op(mn, given)
                else:
                    parts = op(mn, Ref(v, a, "dptr" if mn[0] == "D" else "const"))
            else:
                parts = op(mn, " ".join(tok[1:])) if len(tok) > 1 else [mn]
            out.append(Line(pc, size, parts, comment=", ".join(notes) if k == len(texts) - 1 else "",
                            mode="ASM", indent=indent))
            pc += size
        return out

    def code_body(self, lo, hi, indent):
        out = []
        p = lo
        while p < hi:
            if p in self.insns and p + self.insns[p].size <= hi:
                out += self.insn_lines(p, indent)
                p += self.insns[p].size
            else:
                q = p + 1
                while q < hi and q not in self.insns:
                    q += 1
                out += self.data_lines(p, q, indent, mode="ASM")
                p = q
        return out

    # ================================================================ RPL
    def obj_lines(self, o, depth):
        a = o.addr
        k = o.kind
        if k == "PTR":
            return [Line(a, 5, self.ptr_parts(o.value, a), mode="RPL", indent=depth)]
        if k in COMPOSITE:
            out = [Line(a, 5, OPENER[k], mode="RPL", indent=depth)]
            for c in o.children:
                out += self.obj_lines(c, depth + 1)
            out.append(Line(a + o.size - 5, 5, "}" if k == "DOLIST" else ";", mode="RPL", indent=depth))
            return out
        if k == "DOTAG":
            nb = [self.rom.byte(a + 7 + 2 * i) for i in range(self.rom.byte(a + 5))]
            head = Line(a, o.size - o.children[0].size, op("TAG", sasm.escape(nb)), mode="RPL", indent=depth)
            return [head] + self.obj_lines(o.children[0], depth + 1)
        body = list(self.n[a + 5:a + o.size])
        text = None
        comment = ""
        if k == "DOBINT":
            given, why = self.operands.get(a, (None, ""))
            if given == "addr" or (given is None and o.value in PROLOG_ADDRS):
                # an address held in a binary integer (TYPEREAL = DOREAL)
                text = ["#       ", Ref(o.value, a, "addr")]
                comment = why or "address"
            else:
                text = op("#", "%X" % o.value)
                comment = "%d" % o.value
        elif k in ("DOREAL", "DOEREL"):
            r = sasm.format_real(body, *((3, 12) if k == "DOREAL" else (5, 15)))
            if r:
                text = op("%" if k == "DOREAL" else "%%", r)
        elif k in ("DOCMP", "DOECMP"):
            sz = (3, 12) if k == "DOCMP" else (5, 15)
            h = len(body) // 2
            re_, im = sasm.format_real(body[:h], *sz), sasm.format_real(body[h:], *sz)
            if re_ and im:
                text = op("C%" if k == "DOCMP" else "C%%", re_, im)
        elif k == "DOCHAR":
            text = op("CHR", sasm.escape([body[0] | body[1] << 4]))
        elif k == "DOCSTR" and len(body) % 2 == 1:
            nb = [body[i] | body[i + 1] << 4 for i in range(5, len(body), 2)]
            text = op("$", sasm.escape(nb))
        elif k == "DOHSTR" and len(body) <= 69 and not any(a + 10 <= t < a + o.size for t in self.slots):
            text = op("HXS", hexs(body[5:]) or "")
            if len(body) == 5:
                text = None
        elif k in ("DOIDNT", "DOLAM"):
            nb = [body[2 + 2 * i] | body[3 + 2 * i] << 4 for i in range(body[0] | body[1] << 4)]
            text = op("ID" if k == "DOIDNT" else "LAM", self.name_text(nb))
        elif k == "DOROMP":
            lib, cmd = o.value
            text = op("ROMPTR", "%03X" % lib, "%03X" % cmd)
            comment = self.s["romptr_names"].get(o.value) or ""
        elif k == "DOACPTR":
            text = op("ACPTR", Ref(o.value[0], a, "rom"), Ref(o.value[1], a, "rom"))
        elif k == "DOGROB":
            return self.grob_lines(o, depth)
        elif k == "DOCODE":
            out = [Line(a, 10, "CODE", comment="%d nibbles" % (o.size - 10), mode="RPL", indent=depth,
                        verify=False, after="ASM")]
            out += self.code_body(a + 10, a + o.size, depth + 1)
            out.append(Line(a + o.size, 0, "ENDCODE", mode="ASM", indent=depth, verify=False, after="RPL"))
            return out
        elif k == "DOARRY":
            arr = self.array_lines(o, depth)
            if arr:
                return arr
        if text is not None:
            return [Line(a, o.size, text, comment=comment, mode="RPL", indent=depth)]
        return self.raw_object(o, depth)

    def ptr_parts(self, v, src):
        r = Ref(v, src)
        return [r]   # PTR is added at write time when the name needs it

    def name_text(self, nb):
        t = "".join(sasm.hp_char(b) or "\0" for b in nb)
        if t and "\0" not in t and not re.search(r'[\s"\\]', t) and not t.startswith("*"):
            return t
        return sasm.escape(nb)

    def length(self, p, indent=0):
        """The length field at p: LENGTH here, ENDLENGTH where it ends."""
        end = p + self.rom.addr(p)
        self.ends[end] += 1
        return Line(p, 5, "LENGTH", comment="length, to #%05X" % end, indent=indent, verify=False)

    def raw_object(self, o, depth):
        """Prolog, length if any, and the body as NIBHEX."""
        a = o.addr
        out = [Line(a, 5, op("CON(5)", Ref(self.rom.addr(a), a, "rom")), comment=o.kind, indent=depth)]
        p = a + 5
        if o.kind in LENGTH_PREFIXED:
            out.append(self.length(p, depth))
            p += 5
        out += self.data_lines(p, a + o.size, depth)
        return out

    def array_lines(self, o, depth):
        a = o.addr
        r = self.rom
        ln = r.addr(a + 5)
        ep, nd = r.addr(a + 10), r.addr(a + 15)
        if ep not in PROLOGS or not 1 <= nd <= 2:
            return None
        dims = [r.addr(a + 20 + 5 * i) for i in range(nd)]
        count = 1
        for d in dims:
            count *= d
        p = a + 20 + 5 * nd
        if PROLOGS[ep] == "DOCSTR":
            return self.string_array_lines(o, depth, dims, p)
        esize = {"DOREAL": 16, "DOCMP": 32, "DOBINT": 5, "DOEREL": 21, "DOECMP": 42}.get(PROLOGS[ep])
        if esize is None or p + count * esize != a + o.size:
            return None
        out = self.array_head(o, depth, dims)
        for i in range(count):
            nb = list(self.n[p:p + esize])
            kind = PROLOGS[ep]
            if kind == "DOREAL":
                v = sasm.format_real(nb, 3, 12)
            elif kind == "DOCMP":
                v = "(%s, %s)" % (sasm.format_real(nb[:16], 3, 12), sasm.format_real(nb[16:], 3, 12))
            elif kind == "DOBINT":
                v = "#%X" % self.rom.addr(p)
            else:
                v = ""
            out.append(Line(p, esize, op("NIBHEX", hexs(nb)), comment=v or "", indent=depth))
            p += esize
        return out

    def array_head(self, o, depth, dims):
        a = o.addr
        ep = self.rom.addr(a + 10)
        out = [Line(a, 5, op("CON(5)", Ref(0x029E8, a, "rom")), comment="array %s" % "x".join(map(str, dims)), indent=depth),
               self.length(a + 5, depth),
               Line(a + 10, 5, op("CON(5)", Ref(ep, a, "rom")), comment="element type", indent=depth),
               Line(a + 15, 5, op("CON(5)", str(len(dims))), comment="dimensions", indent=depth)]
        for i, d in enumerate(dims):
            out.append(Line(a + 20 + 5 * i, 5, op("CON(5)", str(d)), indent=depth))
        return out

    def string_array_lines(self, o, depth, dims, p):
        """An array of strings (the message tables): each element is a
        length and the characters, without a prolog."""
        if len(dims) != 1:
            return None
        out = self.array_head(o, depth, dims)
        for i in range(dims[0]):
            ln = self.rom.addr(p)
            if ln < 5 or ln % 2 == 0 or p + ln > o.addr + o.size:
                return None
            nb = [self.rom.byte(p + 5 + 2 * k) for k in range((ln - 5) // 2)]
            out.append(Line(p, ln, op("$BODY", sasm.escape(nb)), comment="%d" % (i + 1), indent=depth))
            p += ln
        return out if p == o.addr + o.size else None

    def grob_lines(self, o, depth):
        a = o.addr
        h, w = o.value
        body = list(self.n[a + 20:a + o.size])
        stride = (w + 7) // 8 * 2
        rows = sasm.grob_png_rows(h, w, body) if h and w and len(body) == h * stride else None
        if rows is None:
            return self.raw_object(o, depth)
        nm = self.symbol_name(a)
        fname = "images/%05X%s.png" % (a, "-" + re.sub(r"[^\w.-]", "_", nm) if nm else "")
        (SRC / "images").mkdir(parents=True, exist_ok=True)
        sasm.png_write(SRC / fname, rows)
        return [Line(a, o.size, op("GROB", '"%s"' % fname), comment="%d x %d" % (w, h), mode="RPL", indent=depth)]

    # ================================================================ structures
    def lib_header_lines(self, it):
        a = it.start
        lib = it.info["lib"]
        self.hints[a] = "LIB%03X" % lib
        out = [Line(a, 3, op("CON(3)", "#%03X" % self.rom.read(a, 3)), comment="library number")]
        for i, key in enumerate(("hash table", "message table", "link table", "config")):
            q = a + 3 + 5 * i
            off = self.rom.addr(q)
            if off:
                self.hints.setdefault((q + off) & 0xFFFFF, "LIB%03X.%s" % (lib, key.split()[0]))
            parts = op("REL(5)", Ref(q + off, q, "rom")) if off else op("CON(5)", "0")
            out.append(Line(q, 5, parts, comment=key))
        return out

    def link_table_lines(self, it):
        a = it.start
        lib = it.info["lib"]
        out = [Line(a, 5, op("CON(5)", Ref(0x02A4E, a, "rom")), comment="link table of library %03X" % lib),
               self.length(a + 5)]
        p = a + 10
        cmd = 0
        while p < a + it.size:
            t = p + self.rom.addr(p)
            nm = self.libcmd.get(t & 0xFFFFF, (0, 0, None))[2]
            out.append(Line(p, 5, op("REL(5)", Ref(t, p, "rom")),
                            comment="%03X %s" % (cmd, nm or "")))
            p += 5
            cmd += 1
        return out

    def hash_table_lines(self, it):
        r = self.rom
        a = it.start
        lib = it.info["lib"]
        end = a + it.size
        out = [Line(a, 5, op("CON(5)", Ref(0x02A4E, a, "rom")), comment="hash table of library %03X" % lib),
               self.length(a + 5)]
        p = a + 10
        for n in range(1, 17):
            off = r.addr(p)
            parts = op("REL(5)", Ref(p + off, p, "rom")) if off else op("CON(5)", "0")
            out.append(Line(p, 5, parts, comment="names of length %d" % n))
            p += 5
        names_end = p + r.addr(p)
        out.append(Line(p, 5, op("REL(5)", Ref(names_end, p, "rom")), comment="end of the names"))
        p += 5
        while p < names_end:
            nl = r.byte(p)
            if nl == 0 or p + 5 + 2 * nl > names_end:
                return None
            nb = [r.byte(p + 2 + 2 * i) for i in range(nl)]
            cmd = r.read(p + 2 + 2 * nl, 3)
            self.hints[p] = "H%03X.%s" % (lib, "".join(sasm.hp_char(b) or "_" for b in nb))
            out.append(Line(p, 2, op("CON(2)", str(nl))))
            out.append(Line(p + 2, 2 * nl, op("NIBASC", sasm.escape(nb))))
            out.append(Line(p + 2 + 2 * nl, 3, op("CON(3)", "#%03X" % cmd), comment="command"))
            p += 5 + 2 * nl
        cmd = 0
        while p + 5 <= end:
            v = r.addr(p)
            if v:
                out.append(Line(p, 5, ["CON(5)  (*)-", Ref(p - v, p, "rom")], comment="name of command %03X" % cmd))
            else:
                out.append(Line(p, 5, op("CON(5)", "0"), comment="command %03X has no name" % cmd))
            p += 5
            cmd += 1
        if p != end:
            out += self.data_lines(p, end)
        return out

    def lib_table_lines(self, it):
        r = self.rom
        out = []
        p = it.start
        while p + 13 <= it.start + it.size:
            num, hdr, acc = r.read(p, 3), r.addr(p + 3), r.addr(p + 8)
            out.append(Line(p, 3, op("CON(3)", "#%03X" % num), comment="library"))
            out.append(Line(p + 3, 5, op("CON(5)", Ref(hdr, p, "rom")), comment="header"))
            out.append(Line(p + 8, 5, op("CON(5)", Ref(acc, p, "rom")) if acc else op("CON(5)", "0"),
                            comment="access handler" if acc else "directly visible"))
            p += 13
        out += self.data_lines(p, it.start + it.size)
        return out

    def table_lines(self, it):
        """A table declared in data/tables.txt: one line per field."""
        t = it.info
        if t["desc"] and t["desc"] not in self.notes[it.start]:
            self.notes[it.start].append(t["desc"])
        out = []
        prev = None
        for a, w, f, k in t["words"]:
            if f == "a":
                parts = op("CON(5)", Ref(self.rom.addr(a), a, "addr"))
            elif f == "n":
                parts = op("CON(%d)" % w, "#%0*X" % (w, self.rom.read(a, w)))
            else:
                parts = op("CON(%d)" % w, "0")
            note = "" if k == prev else "end of table" if f == "end" else "entry %d" % k
            out.append(Line(a, w, parts, comment=note))
            prev = k
        return out

    def trailer_lines(self, it):
        """The slots after a built-in function (analyze.command_trailers)."""
        out = []
        for k, (kind, p, size) in enumerate(it.info["slots"]):
            note = "slot %d" % k
            if kind == "ptr":
                out.append(Line(p, 5, op("CON(5)", Ref(self.rom.addr(p), p, "addr")), comment=note))
            elif kind == "none":
                out.append(Line(p, 5, op("CON(5)", "0"), comment=note + ": none"))
            else:
                lines = self.obj_lines(self.rd.decode(p), 0)
                lines[0].comment = (note + ": " + lines[0].comment).rstrip(": ")
                out += lines
        if it.info["byte"]:
            b = it.start + it.size - 2
            out.append(Line(b, 2, op("CON(2)", "#%02X" % self.rom.read(b, 2)),
                            comment="end of the slots: property byte (meaning not yet known)"))
        out[0].pre.append("* slots of %03X %03X (derivative, inverse, ...: used by the symbolic code)"
                          % (it.info["lib"], it.info["cmd"]))
        return out

    def library_object_lines(self, lib):
        """The DOLIB prolog, length and title before a library part's header."""
        r = self.rom
        a = lib.obj_start
        out = [Line(a, 5, op("CON(5)", Ref(0x02B40, a, "rom")), comment="library object"),
               self.length(a + 5)]
        p = a + 10
        nl = r.byte(p)
        out.append(Line(p, 2, op("CON(2)", str(nl)), comment="title length"))
        p += 2
        if nl:
            nb = [r.byte(p + 2 * i) for i in range(nl)]
            out.append(Line(p, 2 * nl, op("NIBASC", sasm.escape(nb))))
            p += 2 * nl
            out.append(Line(p, 2, op("CON(2)", str(nl))))
            p += 2
        if p != lib.hdr:
            out += self.data_lines(p, lib.hdr)
        return out

    def font_lines(self, start, rows, first, count, widths, name, desc):
        step = 2 * rows + (1 if widths else 0)
        glyphs, ws = [], []
        for i in range(count):
            g = start + step * i
            if widths:
                ws.append(self.n[g])
                g += 1
            glyphs.append([self.rom.byte(g + 2 * y) for y in range(rows)])
        (SRC / "fonts").mkdir(parents=True, exist_ok=True)
        sasm.png_write(SRC / "fonts" / (name + ".png"), sasm.glyph_sheet(glyphs, rows))
        args = ['"fonts/%s.png"' % name, str(rows), "#%02X" % first, str(count)]
        if widths:
            args.append(hexs(ws))
        ln = Line(start, step * count, op("GLYPHS", *args), comment="%s, codes #%02X-#%02X" % (desc, first, first + count - 1))
        return [ln]

    def remap_lines(self):
        lo, hi = MINI_REMAP
        out = []
        for i, p in enumerate(range(lo, hi, 2)):
            code = 0x9F + i
            out.append(Line(p, 2, op("CON(2)", "#%02X" % self.rom.byte(p)),
                            comment="code #%02X %s" % (code, sasm.hp_char(code) or "")))
        return out

    # ================================================================ units
    def units(self):
        """Rendering units in address order: (start, end, kind, payload)."""
        special = []
        for f in FONT_TABLES:
            step = 2 * f[1] + (1 if f[4] else 0)
            special.append((f[0], f[0] + step * f[3], "font", f))
        special.append((MINI_REMAP[0], MINI_REMAP[1], "remap", None))
        special += [(a, a + 4, "crc", None) for a in CRC_WORDS]
        for lib in self.s["libs"]:
            if lib.obj_start is not None:
                special.append((lib.obj_start, lib.hdr, "libobj", lib))
        for a, (lib, cmd, _) in self.libcmd.items():
            h = a - 7
            if (self.rom.read(h + 1, 3) == lib and self.rom.read(h + 4, 3) == cmd
                    and all(self.owner(h + i) in (None, "data", "fill") for i in range(7))):
                special.append((h, a, "cmdhdr", (lib, cmd, a)))
        spans = sorted(special)
        covered = []
        for s0, s1, _, _ in spans:
            covered.append((s0, s1))
        cs = [c[0] for c in covered]

        def inside(a):
            i = bisect.bisect_right(cs, a) - 1
            return i >= 0 and a < covered[i][1]

        out = [(s0, s1, k, x) for s0, s1, k, x in spans]
        for a, it in self.items.items():
            if it.kind == "codebody" or inside(a):
                continue
            end = a + it.size
            if it.kind in ("data", "fill"):
                i = bisect.bisect_right(cs, a)
                if i < len(cs):
                    end = min(end, cs[i])
            out.append((a, end, it.kind, it))
        out.sort(key=lambda u: (u[0], -u[1]))
        return out

    def owner(self, a):
        """Kind of the analysis item covering a, or None."""
        if not hasattr(self, "_owner"):
            self._owner = {}
            for s0, it in self.items.items():
                if it.kind in ("data", "fill"):
                    for i in range(it.size):
                        self._owner[s0 + i] = it.kind
                else:
                    for i in range(it.size):
                        self._owner.setdefault(s0 + i, "item")
        return self._owner.get(a)

    def fill_line(self, start, end, force=False):
        """FILLTO for a zero run between entries (or, with force, for the
        zero run that data_lines found), or None."""
        if not force and (end - start < FILL_TO and end not in WINDOWS and end not in CRC_WORDS
                          or any(self.n[start:end]) or any(start < e <= end for e in self.ends)):
            return None
        return Line(start, end - start, op("FILLTO", "#%05X" % end),
                    comment="%d zero nibbles: the next entry stays at #%05X" % (end - start, end), verify=False)

    def render_unit(self, start, end, kind, x):
        if kind in ("fill", "data"):
            ln = self.fill_line(start, end)
            if ln:
                return [ln]
        if kind == "table":
            return self.table_lines(x)
        if kind == "trailer":
            return self.trailer_lines(x)
        if kind == "crc":
            return [Line(start, 4, ["CRC"], comment="self-test CRC correction (computed by the assembler)",
                         verify=False)]
        if kind == "cmdhdr":
            lib, cmd, a = x
            ln = [Line(start, 1, op("CON(1)", "%d" % self.n[start]), comment="command header: flags (meaning not yet known)"),
                  Line(start + 1, 3, op("CON(3)", "#%03X" % lib), comment="library"),
                  Line(start + 4, 3, op("CON(3)", "#%03X" % cmd), comment="command")]
            ln[0].head = a
            return ln
        if kind == "font":
            return self.font_lines(*x)
        if kind == "remap":
            return self.remap_lines()
        if kind == "libobj":
            return self.library_object_lines(x)
        if kind == "code":
            return self.insn_lines(start)
        if kind == "addrslot":
            return [Line(start, 5, op("CON(5)", Ref(self.rom.addr(start), start, "addr")),
                         comment="address (the code jumps or points through it)")]
        if kind == "rplptr":
            return [Line(start, 5, [Ref(self.rom.addr(start), start)], mode="RPL")]
        if kind == "codeptr":
            return [Line(start, 5, op("CON(5)", Ref(self.rom.addr(start), start, "rom")),
                         comment="code object: the address of its machine code")]
        if kind == "pco":
            return [Line(start, 5, op("CON(5)", "(*)+5"), comment="primitive code object")]
        if kind == "obj":
            try:
                return self.obj_lines(self.rd.decode(start), 0)
            except DecodeError:
                return None
        if kind == "libhdr":
            return self.lib_header_lines(x)
        if kind == "liblink":
            return self.link_table_lines(x)
        if kind == "libhash":
            return self.hash_table_lines(x)
        if kind == "libtab":
            return self.lib_table_lines(x)
        if kind == "ptrdata":
            return [Line(start, 5, op("CON(5)", Ref(self.rom.addr(start), start, "rom"))),
                    Line(start + 5, 5, op("CON(5)", Ref(self.rom.addr(start + 5), start + 5, "rom")))]
        return self.data_lines(start, end)

    def render(self):
        """Lines for the whole ROM, grouped into top-level units."""
        self.blocks = []      # (start, end, lines)
        self.ends = defaultdict(int)   # address -> number of ENDLENGTHs there
        p = 0
        prev_kind = None
        for start, end, kind, x in self.units():
            if start < p:
                # An instruction that starts inside one already written: the
                # ROM branches into the middle of an instruction to reuse
                # its nibbles. Say so where it starts, and write its tail.
                desc = " ".join(self.insns[start].text.split("\n")[0].split()) if start in self.insns else kind
                host = next((ln for _, _, b in reversed(self.blocks[-4:]) for ln in reversed(b)
                             if ln.pc <= start < ln.pc + max(ln.size, 1)), None)
                if host is not None:
                    host.pre.append("* a branch also enters #%05X, where the nibbles decode as %s" % (start, desc))
                if end > p:
                    tail = self.data_lines(p, end)
                    tail[0].pre.append("* the rest of %s at #%05X" % (desc, start))
                    self.blocks.append((p, end, tail))
                    p = end
                continue
            if start > p:
                fill = self.fill_line(p, start)
                self.blocks.append((p, start, [fill] if fill else self.data_lines(p, start)))
            lines = self.render_unit(start, end, kind, x)
            if lines is None or sum(ln.size for ln in lines) != end - start or lines[0].pc != start:
                self.fallbacks["unit " + kind] += 1
                lines = self.data_lines(start, end)
            if kind not in ("code", "data", "fill") and prev_kind != "cmdhdr":
                lines[0].gap = True
            prev_kind = kind
            self.blocks.append((start, end, lines))
            p = end
        if p < sasm.ROM_SIZE:
            self.blocks.append((p, sasm.ROM_SIZE, self.data_lines(p, sasm.ROM_SIZE)))
        self.lines = [ln for _, _, b in self.blocks for ln in b]
        self.line_start = {ln.pc for ln in self.lines if ln.size}
        self.starts = sorted(self.line_start)

    # ================================================================ output
    def text(self, ln):
        parts = []
        for p in ln.parts:
            parts.append(self.resolve(p) if isinstance(p, Ref) else p)
        t = "".join(parts)
        if ln.parts[0] == "#       " and isinstance(ln.parts[-1], Ref) and sasm.HEX.fullmatch(t[8:]):
            t += "+0"           # a name that reads as hex: keep it a name
        if ln.mode == "RPL" and len(ln.parts) == 1 and isinstance(ln.parts[0], Ref):
            if not self.rpl_safe(t):
                t = "PTR     " + t
        return t

    def rpl_safe(self, t):
        return (t not in sasm.KEYWORDS and not t.endswith(":") and not t.startswith(("*", '"'))
                and not sasm.NUM.fullmatch(t) and not re.fullmatch(r"(CON|REL)\(\d+\)", t))

    def name_labels(self):
        self.label = {}
        self.used = {}
        self.eq = {}
        for a in self.starts:
            if self.symbol_name(a):
                self.label_for(a)

    def resolve_all(self):
        for ln in self.lines:
            ln.parts = [self.text(ln)]

    def verify(self):
        asm = sasm.Assembler()
        asm.root = SRC
        asm.symbols = dict(self.used)
        for ln in self.lines:
            if not ln.verify or not ln.size:
                continue
            t = ln.parts[0]
            want = list(self.n[ln.pc:ln.pc + ln.size])
            try:
                got = asm.encode(sasm.split_line(t), ln.pc, {"mode": ln.mode or "ASM", "code": []})
            except (sasm.AsmError, ValueError, IndexError, KeyError) as e:
                got = str(e)
            if got != want:
                self.fallbacks[t.split()[0] if t.split() else "?"] += 1
                ln.comment = ("= " + " ".join(t.split()) + ("  " + ln.comment if ln.comment else ""))
                ln.parts = ["%-8s%s" % ("NIBHEX", hexs(want))]
                ln.mode = None

    def comment_block(self, a, top):
        out = []
        nm = self.label.get(a)
        s = self.sym.by_addr.get(a)
        if top:
            out.append("")
        if s and s.stack and nm == self.clean(s.name) and a < LOWER_END:
            out.append("* %s" % s.stack)
        if a in self.libcmd:
            lib, cmd, cn = self.libcmd[a]
            out.append("* ROMPTR %03X %03X%s" % (lib, cmd, " " + cn if cn and self.clean(cn) != nm else ""))
        xs = sorted(f for f, h in self.xrefs.get(a, ()) if isinstance(f, int) and f != a)
        if xs and top:
            more = " ..." if len(xs) > MAX_XREFS else ""
            out.append("* refs (%d): %s%s" % (len(xs), " ".join("%05X" % x for x in xs[:MAX_XREFS]), more))
        return out

    def major(self, a):
        """Labels that get a blank line and a comment block: named entries,
        subroutines, objects and library commands (not branch targets)."""
        return a in self.label and (self.symbol_name(a) is not None or a in self.libcmd
                                    or self.s["labels"].get(a) in ("sub", "obj"))

    def format(self, ln, top):
        out = []
        a = ln.pc
        heads = [h for h in (ln.head, a if ln.size else None) if h is not None and h not in self.done]
        for h in heads:
            if self.major(h):
                self.done.add(h)
                out.append("")
                out += self.comment_block(h, True)[1:]
        if ln.gap and not out:
            out.append("")
        for c in ln.pre:
            out.append(c)
        if ln.size:
            out += ["* " + c for c in self.notes.get(a, ())]
        if a in PINNED and ln.size:
            out.append("%-*s * %s" % (COMMENT_COL, "        PIN     #%05X" % a, PINNED[a]))
        if a in self.label and ln.size:
            out.append(self.label[a] + ":")
        body = " " * (8 + 2 * ln.indent) + ln.parts[0]
        com = "%05X" % a + ("  " + ln.comment if ln.comment else "")
        out.append("%-*s * %s" % (COMMENT_COL, body, com))
        return out

    def regions(self):
        """(start, name, description) for every source file region."""
        regs = []
        for line in (DATA / "rom-layout.txt").read_text(encoding="utf-8").splitlines():
            if line.startswith("#") or not line.strip():
                continue
            a, name, desc = (line.split("\t") + ["", ""])[:3]
            regs.append((int(a, 16), name, desc))
        for lib in self.s["libs"]:
            if lib.hdr >= 0x82000:
                st = lib.obj_start if lib.obj_start is not None else lib.hdr
                regs.append((st, "lib%03X" % lib.num, "Library part %03X" % lib.num))
        regs.sort()
        # The first file of a window starts at the window (with its ORG)
        for w in WINDOWS:
            i = bisect.bisect_left(regs, (w,))
            if i < len(regs) and regs[i][0] - w < 16:
                regs[i] = (w,) + regs[i][1:]
        return regs

    def files(self):
        """Assign blocks to files: [(path, description, blocks)]."""
        regs = self.regions()
        bstarts = [b[0] for b in self.blocks]
        cut = []      # (block index, name, desc)
        for a, name, desc in regs:
            i = bisect.bisect_left(bstarts, a)
            if cut and cut[-1][0] == i:
                cut[-1] = (i, name, desc)
            else:
                cut.append((i, name, desc))
        out = []
        for k, (i, name, desc) in enumerate(cut):
            j = cut[k + 1][0] if k + 1 < len(cut) else len(self.blocks)
            chunk = []
            first = True
            for b in self.blocks[i:j]:
                if chunk and (b[0] - chunk[0][0] >= SPLIT or b[0] in WINDOWS):
                    out.append((name, desc, chunk, first))
                    chunk = []
                    first = False
                chunk.append(b)
            if chunk:
                out.append((name, desc, chunk, first))
        res = []
        for name, desc, chunk, first in out:
            st = chunk[0][0]
            # Fixed addresses: the start of the ROM and of each upper-ROM
            # window. Everything else flows on from the previous file.
            pinned = st == 0 or st in WINDOWS
            res.append(("%s/%05X-%s.s" % ("lower" if st < LOWER_END else "upper", st, name), desc, chunk, pinned))
        return res

    def write(self):
        files = self.files()
        top = ["* HP 48GX ROM revision R as reassemblable source, generated by tools/disasm.py.",
               "* HP's firmware: keep it private, do not redistribute.",
               "* Build: python tools/sasm.py out/src/rom.s -o out/rom.bin --check ROM/gxrom-r",
               "", "        INCLUDE \"equates.s\""]
        for path, desc, blocks, pinned in files:
            top.append("        INCLUDE \"%s\"%s" % (path, " " * max(1, 40 - len(path)) + "* " + desc if desc else ""))
            self.write_file(path, desc, blocks, pinned)
        if self.ends:
            raise RuntimeError("LENGTH without an end at %s" % ", ".join("#%05X" % a for a in self.ends))
        (SRC / "rom.s").write_text("\n".join(top) + "\n", encoding="utf-8", newline="\n")
        eq = ["* RAM and I/O addresses named in the source (EDB/VBL names)."]
        for a in sorted(self.eq):
            eq.append("%-24s EQU #%05X" % (self.eq[a], a))
        # The assembler writes prologs by these names (sasm.PROLOG)
        for name, a in list(sasm.PROLOG.items()) + [("SEMI", sasm.SEMI)]:
            if name not in self.used and a in self.label:
                eq.append("%-24s EQU %s" % (name, self.label[a]))
        (SRC / "equates.s").write_text("\n".join(eq) + "\n", encoding="utf-8", newline="\n")
        return files

    def write_file(self, path, desc, blocks, pinned):
        lo, hi = blocks[0][0], blocks[-1][1]
        out = ["* HP 48GX ROM revision R, #%05X-#%05X: %s" % (lo, hi - 1, desc or "not yet identified"),
               "* Generated by tools/disasm.py. HP's firmware: keep it private, do not redistribute."]
        named = sorted(((len(self.xrefs.get(a, ())), self.label[a]) for a in self.label
                        if lo <= a < hi and self.symbol_name(a)), reverse=True)[:12]
        if named:
            out.append("* Most referenced: " + " ".join(n for _, n in named))
        if pinned:
            out += ["", "        ORG     #%05X" % lo]
        else:
            out += ["* Follows on from the previous file (at #%05X in the original ROM)." % lo]
        mode = "ASM"
        self.done = set()
        for _, _, lines in blocks:
            for k, ln in enumerate(lines):
                if ln.size:
                    for _ in range(self.ends.pop(ln.pc, 0)):
                        out.append("%-*s * %05X" % (COMMENT_COL, "        ENDLENGTH", ln.pc))
                if ln.mode and ln.mode != mode:
                    out.append("        %s" % ("RPL" if ln.mode == "RPL" else "ASSEMBLE"))
                    mode = ln.mode
                out += self.format(ln, k == 0)
                if ln.after:
                    mode = ln.after
        f = SRC / path
        f.parent.mkdir(parents=True, exist_ok=True)
        f.write_text(hp_map("\n".join(out)) + "\n", encoding="utf-8", newline="\n")

    def run(self, check=True):
        if SRC.exists():
            for p in SRC.iterdir():
                shutil.rmtree(p) if p.is_dir() else p.unlink()
        SRC.mkdir(parents=True, exist_ok=True)
        self.render()
        self.name_labels()
        self.resolve_all()
        self.verify()
        files = self.write()
        print("wrote %d files, %d lines, %d labels, %d equates" % (
            len(files) + 2, len(self.lines), len(self.label), len(self.eq)))
        if self.fallbacks:
            print("written as NIBHEX:", ", ".join("%s %d" % kv for kv in sorted(self.fallbacks.items())))
        if check:
            return sasm.main(["sasm", str(SRC / "rom.s"), "-o", str(OUT / "rom.bin"),
                              "--check", str(ROOT / "ROM" / "gxrom-r")])
        return 0


def main(argv):
    return Generator().run(check="--no-check" not in argv)


if __name__ == "__main__":
    import disasm
    sys.exit(disasm.main(sys.argv))
