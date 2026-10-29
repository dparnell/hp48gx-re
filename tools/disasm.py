"""Write ROM rev R as commented source that sasm.py reassembles byte for byte.

Output (out/src by default):
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

Usage: python disasm.py [--no-check] [--out DIR]   (needs out/analysis.pickle)

firmware/ in the repository is the source to edit; it was written by this
program. Regenerating into it would overwrite edits, so the default output
is out/src, for comparison.
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
from symbols import Symbols, fake_number

ROOT = Path(__file__).resolve().parent.parent
OUT = ROOT / "out"
SRC = OUT / "src"          # --out DIR writes elsewhere (firmware/ holds the edited copy)
GENERATED = ("rom.s", "equates.s", "lower", "upper", "images", "fonts")
DATA = ROOT / "data"
LOWER_END = 0x80000
SPLIT = 0x3000            # split regions into files of about this many nibbles
HARDWARE = 0x7E000        # D0=/D1= from here up are I/O windows (bank switcher at #7F000)
FILL_TO = 32              # zero fill at least this long between entries becomes FILLTO
COMMENT_COL = 48
# The Equation Library (library 0E2): its equations are packed strings, its
# pictures packed hex strings.
EQLIB = (0xE384B, 0x100000)

# RPL bodies are written several objects to a line, up to this width.
RPL_WIDTH = 76
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

# The self-test runs with RAM not yet configured, so its own data is
# visible: D0=/D1=/LC/LA values inside it are addresses.
SELFTEST = (0x80000, 0x82000)

# Code that must stay where it is, whatever else moves.
PINNED = {
    0x0000F: "the CPU jumps here on an interrupt",
    0x028FC: "PRLG: every prolog starts with D=D-1 A, HST=0 0, whose nibbles CF820 "
             "read as the address #028FC, so running a prolog as an object comes here",
}

PROLOG_ADDRS = set(sasm.PROLOG.values())
UNITS_TABLE = 0x75675      # hex string of unit names and definitions

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
    __slots__ = ("pc", "size", "parts", "comment", "mode", "after", "verify", "indent", "pre", "gap", "head", "value")

    def __init__(self, pc, size, parts, comment="", mode=None, indent=0, verify=True, after=None):
        self.pc, self.size = pc, size
        self.parts = parts if isinstance(parts, list) else [parts]
        self.comment, self.mode, self.indent = comment, mode, indent
        self.verify, self.after = verify, after
        self.pre = []
        self.gap = False      # blank line before
        self.head = None      # print the comments for this address before the line
        self.value = None     # a pointer's target, or a binary integer's value: ("ptr" | "bint", v)


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
    parts = ["%-7s " % mnemonic if operands else mnemonic]
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
        self.romp_addr = {(lib, cmd): a for a, (lib, cmd, _) in self.libcmd.items()}
        self.eq_strings = set()     # Equation Library strings (packed equations)
        self.eq_vars = {}           # its variable-name strings -> a comment naming them
        self.eq_names = self.id_array(self.romp_addr.get((0xE2, 0x29)))
        # Hex strings outside the Equation Library unpacked by ~PCunpack (MINEHUNT)
        self.pc_strings = {0xCDE97, 0xCDFA0}
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
        if s and s.vbl_only and a in getattr(self, "ptr_slots", ()):
            # A VBL name on a pointer inside another object: in places the
            # VBL's conversion to revision R is one object off
            # (PwrExpFIT? at #2CB52 is the code at #2CC06).
            note = "The Very Big List names this address %s, but it is a pointer inside an object; the name is not used" % s.name
            if note not in self.notes[a]:
                self.notes[a].append(note)
            return None
        if s and fake_number(self.rom, s):
            return None
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

    # Units whose references count as uses by a caller (not library
    # structures that only list or describe a command).
    CALLER_KINDS = {"obj", "code", "pco", "codeptr"}
    IGNORED_KINDS = {"libhdr", "liblink", "libhash", "libtab", "cmdhdr"}

    def derive_names(self):
        """Names for objects and routines with no known name, from where they
        are used: `GETAB1~jump` for a veneer (one jump to GETAB1),
        `xSUB~grob,list,list` for the case of a dispatch table
        (the command and the argument types), and `ROMPOLL~1` for the first
        helper (by address) only ROMPOLL uses. Repeated, so helpers of named
        helpers get names too. These are our names, not HP's or the entry
        lists' (no known name contains ~)."""
        self.derived = {}
        starts = sorted(self.unit_kind)
        romp_addr = {(lib, cmd): a for a, (lib, cmd, _) in self.libcmd.items()}

        def unit_of(x):
            i = bisect.bisect_right(starts, x) - 1
            if i < 0:
                return None
            u = starts[i]
            # a primitive code object's code belongs to the object
            if self.unit_kind[u] == "code" and i > 0 and self.unit_kind[starts[i - 1]] in ("pco", "codeptr"):
                u = starts[i - 1]
            return u

        dispatch = {a for a in self.sym.by_addr if self.symbol_name(a) in self.DISPATCH}
        uses = defaultdict(set)      # target -> {(unit, from)}
        for target, refs in self.xrefs.items():
            if isinstance(target, int):
                for f, _ in refs:
                    if isinstance(f, int):
                        uses[target].add((unit_of(f), f))
        cases = defaultdict(set)     # target -> {(unit, types)}
        for start, _, lines in self.blocks:
            table = None
            for ln in lines:
                if ln.value and ln.value[0] == "romp" and ln.value[1] in romp_addr:
                    uses[romp_addr[ln.value[1]]].add((unit_of(ln.pc), ln.pc))
                if ln.mode != "RPL":
                    continue
                is_dispatch = bool(ln.value and ln.value[0] == "ptr" and ln.value[1] in dispatch)
                if table is not None and ln.indent < table[0]:
                    table = None
                if table is not None and ln.indent == table[0]:
                    if table[1] is None:
                        code = self.type_code(ln)
                        table[1] = "any" if code is None else self.describe_types(code)
                    else:
                        if ln.value and ln.value[0] == "ptr":
                            cases[ln.value[1]].add((unit_of(ln.pc), table[1]))
                        table[1] = None
                elif is_dispatch:
                    table = [ln.indent, None]

        def wanted(a):
            return a in self.starts_set and not self.symbol_name(a) and a not in self.messages

        self.starts_set = {ln.pc for ln in self.lines if ln.size}
        # Veneers: subroutines that are one long jump to a named routine
        # (a library part's way to reach lower ROM) are named after it.
        veneers = {a: i.target for a, i in self.insns.items()
                   if self.s["labels"].get(a) == "sub" and i.target is not None
                   and i.text.split()[0] in ("GOVLNG", "GOLONG", "GOTO")}
        count = defaultdict(int)
        changed = True
        while changed:
            changed = False
            for a, t in sorted(veneers.items()):
                target = self.symbol_name(t) or self.derived.get(t)
                if a not in self.derived and wanted(a) and target:
                    self.derived[a] = "%s~jump" % target
                    changed = True
            for a in sorted(uses):
                if a in self.derived or not wanted(a):
                    continue
                own = unit_of(a)
                refs = {(u, f) for u, f in uses[a]
                        if u is not None and u != own and self.unit_kind.get(u) not in self.IGNORED_KINDS}
                us = {u for u, _ in refs}
                if len(us) != 1:
                    continue
                u = next(iter(us))
                if self.unit_kind.get(u) not in self.CALLER_KINDS:
                    continue
                parent = self.symbol_name(u) or self.derived.get(u)
                if parent is None:
                    continue
                cs = {t for x, t in cases.get(a, ()) if x == u}
                if len(cs) == 1 and len(refs) == 1:
                    name = "%s~%s" % (parent, next(iter(cs)).replace(" ", ","))
                else:
                    count[parent] += 1
                    name = "%s~%d" % (parent, count[parent])
                self.derived[a] = name
                changed = True

    def label_for(self, a):
        if a in self.label:
            return self.label[a]
        nm = self.symbol_name(a) or self.derived.get(a) or self.hints.get(a)
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
                in_selftest = SELFTEST[0] <= a < SELFTEST[1] and SELFTEST[0] < v < SELFTEST[1]
                if given == "addr" or (given is None and (in_selftest or mn[0] == "D" and 0x140 <= v < HARDWARE)):
                    # "rom": an upper-ROM value here is ROM (the self-test area), not RAM
                    parts = op(mn, Ref(v, a, "rom" if v >= LOWER_END else "addr"))
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
            ln = Line(a, 5, self.ptr_parts(o.value, a), mode="RPL", indent=depth)
            ln.value = ("ptr", o.value)
            return [ln]
        if k in COMPOSITE:
            if k == "DOLIST" and EQLIB[0] <= a < EQLIB[1] and len(o.children) == 4                     and o.children[0].kind == "DOCSTR" and o.children[3].kind == "DOCSTR"                     and self.small_bint(o.children[1]) is not None and self.small_bint(o.children[2]) is not None:
                # a set's variables { $names # first # count $units }: the
                # names are indexes into the name array (ROMPTR 0E2 029)
                nb = [self.n[x] | self.n[x + 1] << 4 for x in range(o.children[0].addr + 10, o.children[0].addr + o.children[0].size, 2)]
                names = [self.eq_names[b - 1] if 0 < b <= len(self.eq_names) and b != 0xEE else "-" for b in nb]
                self.eq_vars[o.children[0].addr] = "variables " + " ".join(names)
            if k == "DOLIST" and EQLIB[0] <= a < EQLIB[1] and o.children and self.small_bint(o.children[0]) in (0, 1, 2, 3):
                # an equation entry { BINT1..3 ... }: its strings are packed
                todo = list(o.children)
                while todo:
                    c = todo.pop()
                    if c.kind == "DOCSTR":
                        self.eq_strings.add(c.addr)
                    todo += c.children
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
        romp = None
        if k == "DOHSTR" and (EQLIB[0] <= a < EQLIB[1] or a in self.pc_strings):
            pic = self.pc_picture_lines(o, depth)
            if pic:
                return pic
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
            if a in self.eq_strings:
                e = sasm.eq_expand(nb)
                if sasm.eq_compress(e) == nb:
                    text = op("EQ$", sasm.escape(e))
            comment = self.eq_vars.get(a, "")
        elif k == "DOHSTR" and a == UNITS_TABLE:
            return self.units_table_lines(o, depth)
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
            romp = o.value
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
        elif k == "DOLNKARRY":
            arr = self.linked_array_lines(o, depth)
            if arr:
                return arr
        if text is not None:
            ln = Line(a, o.size, text, comment=comment, mode="RPL", indent=depth)
            if k == "DOBINT":
                ln.value = ("bint", o.value)
            elif romp is not None:
                ln.value = ("romp", romp)
            return [ln]
        return self.raw_object(o, depth)

    def units_table_lines(self, o, depth):
        """The units table (a hex string): for each name length 1-8 the
        offset to its first entry, then the entries. An entry is a link
        byte (offset from itself to the next name of the same length, 0 at
        the end), the name, and two fields read by #0C3A3: a nibble n, then
        a pointer if n is 0, else n digits (the second field has an exponent
        byte before its digits)."""
        r = self.rom
        a = o.addr
        out = [Line(a, 5, op("CON(5)", Ref(r.addr(a), a, "rom")), comment="units table", indent=depth),
               self.length(a + 5, depth)]
        base = a + 10
        names = {}            # name address -> (length, link address)
        heads = []
        for n in range(1, 9):
            slot = base + 4 * (n - 1)
            off = r.read(slot, 4)
            heads.append((slot, slot + off if off else None, n))
            p = slot + off if off else None
            while p is not None:
                names[p] = (n, p - 2)
                step = r.byte(p - 2)
                p = p - 2 + step if step else None
        for p, (n, _) in names.items():
            nb = [r.byte(p + 2 * i) for i in range(n)]
            t = "".join(sasm.hp_char(b) or "\0" for b in nb)
            self.hints[p] = "U.%s" % t if "\0" not in t else "U_%05X" % p
        for slot, first, n in heads:
            parts = op("CON(4)", "0") if first is None else ["CON(4)  ", Ref(first, slot, "rom"), "-(*)"]
            out.append(Line(slot, 4, parts, comment="names of %d character%s" % (n, "s" * (n > 1)), indent=depth))
        for p in sorted(names):
            n, link = names[p]
            step = r.byte(link)
            parts = ["CON(2)  ", Ref(link + step, link, "rom"), "-(*)"] if step else op("CON(2)", "0")
            out.append(Line(link, 2, parts, comment="next name of this length" if step else "last of this length",
                            indent=depth))
            nb = [r.byte(p + 2 * i) for i in range(n)]
            out.append(Line(p, 2 * n, op("NIBASC", sasm.escape(nb)), indent=depth))
            q = p + 2 * n
            for second in (False, True):
                k = self.n[q]
                out.append(Line(q, 1, op("CON(1)", "%d" % k),
                                comment=("pointer follows" if k == 0 else "%d digits" % k), indent=depth))
                q += 1
                if k == 0:
                    out.append(Line(q, 5, op("CON(5)", Ref(r.addr(q), q, "rom")), indent=depth))
                    q += 5
                    continue
                if second:
                    e = int("%02X" % r.byte(q)) if r.byte(q) < 0xA0 and r.byte(q) & 15 < 10 else None
                    note = "exponent" if e is None else "exponent %d" % (e - 100 if e >= 50 else e)
                    out.append(Line(q, 2, op("CON(2)", "#%02X" % r.byte(q)), comment=note, indent=depth))
                    q += 2
                out.append(Line(q, k, op("NIBHEX", hexs(self.n[q:q + k])), indent=depth))
                q += k
        if sum(ln.size for ln in out) != o.size:
            return self.raw_object(o, depth)
        return out

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
        if PROLOGS[ep] == "DOROMP":
            return self.romptr_array_lines(o, depth, dims, p)
        if PROLOGS[ep] == "DOIDNT":
            return self.id_array_lines(o, depth, dims, p)
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

    def id_array(self, a):
        """The names in an array of identifiers at a, or []."""
        if a is None or self.rom.addr(a) != sasm.PROLOG["DOARRY"] or self.rom.addr(a + 10) != sasm.PROLOG["DOIDNT"]:
            return []
        out, p = [], a + 25
        for _ in range(self.rom.addr(a + 20)):
            n = self.rom.byte(p)
            out.append(self.name_text([self.rom.byte(p + 2 + 2 * k) for k in range(n)]))
            p += 2 + 2 * n
        return out

    def small_bint(self, o):
        """The value of a binary integer object or a pointer to one."""
        if o.kind == "PTR":
            v = o.value
            if v < len(self.n) - 10 and self.word(v) == sasm.PROLOG["DOBINT"]:
                return self.word(v + 5)
            return None
        return o.value if o.kind == "DOBINT" else None

    def romptr_name(self, lib, cmd):
        """What a ROMPTR names, for a comment: the command's name, or the
        label of a menu key (the first string in the object)."""
        a = self.romp_addr.get((lib, cmd))
        if a is None:
            return ""
        nm = self.libcmd[a][2] or self.symbol_name(a)
        if nm:
            return nm
        try:
            o = self.rd.decode(a)
        except DecodeError:
            return ""
        todo = [(o, 0)]
        while todo:
            x, d = todo.pop(0)
            if x.kind == "DOCSTR":
                body = list(self.n[x.addr + 10:x.addr + x.size])
                return "key " + sasm.escape([body[i] | body[i + 1] << 4 for i in range(0, len(body) - 1, 2)])
            if d < 3:
                todo += [(c, d + 1) for c in x.children]
        return ""

    def romptr_array_lines(self, o, depth, dims, p):
        """An array of ROMPTRs (a menu: one element per soft key), each a
        library and command number without prolog."""
        count = 1
        for d in dims:
            count *= d
        if p + 6 * count != o.addr + o.size:
            return None
        out = self.array_head(o, depth, dims)
        for _ in range(count):
            lib, cmd = self.rom.read(p, 3), self.rom.read(p + 3, 3)
            out.append(Line(p, 6, op("ROMPBODY", "%03X" % lib, "%03X" % cmd), comment=self.romptr_name(lib, cmd),
                            indent=depth))
            p += 6
        return out

    def id_array_lines(self, o, depth, dims, p):
        """An array of identifiers (the Equation Library's variable names):
        each a length byte and the characters, without prolog."""
        count = 1
        for d in dims:
            count *= d
        out = self.array_head(o, depth, dims)
        for i in range(count):
            n = self.rom.byte(p)
            nb = [self.rom.byte(p + 2 + 2 * k) for k in range(n)]
            out.append(Line(p, 2 + 2 * n, op("IDBODY", self.name_text(nb)), comment="%d" % (i + 1), indent=depth))
            p += 2 + 2 * n
        return out if p == o.addr + o.size else None

    def pc_picture_lines(self, o, depth):
        """A hex string holding a picture packed for ~PCunpack, as a PNG.
        PCGROB when HP's packer's rule (sasm.pc_split) gives the same
        commands, else PCGROBS with the commands."""
        a, end = o.addr, o.addr + o.size
        if o.size < 30:
            return None
        h, w = self.rom.byte(a + 10), self.rom.byte(a + 12)
        if not h or not w:
            return None
        p, stream, split = a + 14, [], []
        while p < end:
            c = self.rom.byte(p)
            p += 2
            k = (c & 0x7F) + 1
            if c & 0x80:
                stream += [self.n[p]] * k
                split.append("R%d" % k)
                p += 1
            else:
                stream += list(self.n[p:p + k])
                split.append("L%d" % k)
                p += k
        stride = (w + 7) // 8 * 2
        if p != end or len(stream) not in (h * stride, h * stride - 1):
            return None
        full = stream + [0] * (h * stride - len(stream))
        rows = sasm.grob_png_rows(h, w, sasm.pc_stream(full))
        if rows is None:
            return None
        fname = "images/%05X-packed.png" % a
        (SRC / "images").mkdir(parents=True, exist_ok=True)
        sasm.png_write(SRC / fname, rows)
        default = ["%s%d" % t for t in sasm.pc_split(sasm.pc_stream(sasm.grob_nibs(rows, w)))]
        if default == split:
            text = op("PCGROB", '"%s"' % fname)
        else:
            text = op("PCGROBS", '"%s"' % fname, ",".join(split))
        return [Line(a, o.size, text, comment="%d x %d, packed" % (w, h), mode="RPL", indent=depth)]

    def linked_array_lines(self, o, depth):
        """A linked array of strings (a library's message table): offsets,
        each from its own address to an element (0 for none), then the
        elements as length and characters without prolog."""
        a, r = o.addr, self.rom
        ep, nd = r.addr(a + 10), r.addr(a + 15)
        if ep not in PROLOGS or PROLOGS[ep] != "DOCSTR" or nd != 1:
            return None
        n = r.addr(a + 20)
        offs = a + 25
        index = {}                  # element address -> number
        for i in range(n):
            f = offs + 5 * i
            v = r.addr(f)
            if v:
                index[(f + v) & 0xFFFFF] = i + 1
        lib = next((l.num for l in self.s["libs"] if l.message == a), None)
        names = {}
        for t, i in index.items():
            names[t] = ("msg~%02X%02X" % (lib, i)) if lib is not None and lib < 0x100 and i < 0x100 else "msg~%d" % i
            self.hints.setdefault(t, names[t])
        out = [Line(a, 5, op("CON(5)", Ref(0x02A0A, a, "rom")), comment="linked array %d" % n, indent=depth),
               self.length(a + 5, depth),
               Line(a + 10, 5, op("CON(5)", Ref(ep, a, "rom")), comment="element type", indent=depth),
               Line(a + 15, 5, op("CON(5)", "1"), comment="dimensions", indent=depth),
               Line(a + 20, 5, op("CON(5)", str(n)), indent=depth)]
        for i in range(n):
            f = offs + 5 * i
            v = r.addr(f)
            if v:
                out.append(Line(f, 5, op("REL(5)", Ref((f + v) & 0xFFFFF, f, "addr")), indent=depth))
            else:
                out.append(Line(f, 5, op("CON(5)", "0"), comment="no element %d" % (i + 1), indent=depth))
        p = offs + 5 * n
        end = a + o.size
        while p < end:
            ln = r.addr(p)
            if ln < 5 or ln % 2 == 0 or p + ln > end or p not in index:
                return None
            nb = [r.byte(p + 5 + 2 * k) for k in range((ln - 5) // 2)]
            out.append(Line(p, ln, op("$BODY", sasm.escape(nb)), comment="%d" % index[p], indent=depth))
            p += ln
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
            note = "" if k == prev else "end of table" if f == "end" else "entries" if f == "count" else "entry %d" % k
            prev = k
            if f in ("a", "c") and self.rom.addr(a):
                parts = op("CON(5)", Ref(self.rom.addr(a), a, "addr"))
            elif f in ("n", "count") or f in ("a", "c"):
                parts = op("CON(%d)" % w, "#%0*X" % (w, self.rom.read(a, w)) if w > 1 else "%X" % self.rom.read(a, w))
            elif f == "t":
                parts = op("NIBASC", sasm.escape([self.rom.byte(a + 2 * i) for i in range(w // 2)]))
            elif f == "s":
                out.append(Line(a, 2, op("CON(2)", "%d" % ((w - 2) // 2)), comment=note))
                if w > 2:
                    out.append(Line(a + 2, w - 2, op("NIBASC", sasm.escape([self.rom.byte(a + 2 + 2 * i)
                                                                            for i in range((w - 2) // 2)]))))
                continue
            else:
                parts = op("CON(%d)" % w, "0")
            out.append(Line(a, w, parts, comment=note))
        return out

    def rule_lines(self, it):
        """A rule stream after a call to the algebra's rule interpreter
        (analyze.rule_streams)."""
        out = []
        for kind, p, size in it.info["parts"]:
            if kind == "pattern":
                w = self.rom.read(p, 5)
                tests = " ".join("arg" if d == "0" else "op%d" % (int(d, 16) - 1)
                                 for d in ("%05X" % w)[::-1].rstrip("0") or "0") if w else "always"
                out.append(Line(p, 5, op("NIBHEX", hexs(self.n[p:p + 5])), comment="pattern: " + tests))
            elif kind == "ptr":
                out.append(Line(p, 5, op("CON(5)", Ref(self.rom.addr(p), p, "addr")), comment="run if it matches"))
            elif kind == "romptr":
                lines = self.obj_lines(self.rd.decode(p), 0)
                lines[0].comment = "run if it matches"
                out += lines
            else:
                out.append(Line(p, 1, op("NIBHEX", "F"), comment="end of the rules"))
        out[0].pre.append("* rewrite rules, read by the interpreter called just before (SUB_5F6F2)")
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
        if kind == "rules":
            return self.rule_lines(x)
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
        self.unit_kind = {}   # start -> unit kind
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
            self.unit_kind[start] = kind
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
        self.ptr_slots = {ln.pc for ln in self.lines if ln.value and ln.value[0] == "ptr" and ln.indent > 0}
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

    # Words that act on the objects after them in the runstream: a line
    # ends after them and that many objects (`DUP#0=case DROP`).
    RUNSTREAM = {"IT": 1, "RPIT": 1, "COLA": 1, "?SKIP": 1, "ITE": 2, "RPITE": 2,
                 "?SEMI": 0, "NOT?SEMI": 0, "?SEMIDROP": 0, "NOT?DROP": 0}

    def takes(self, word):
        """How many following objects `word` acts on, if it is a
        runstream word."""
        if word in self.RUNSTREAM:
            return self.RUNSTREAM[word]
        return 1 if "case" in word else None

    # Argument type codes of the dispatch words (CK&DISPATCH1), from the
    # ROM's tables at #19123 and #1916E: one digit per stack level from
    # level 1 up (0 for any object); F with the digit before it makes a
    # two-digit code.
    DISPATCH = {"CK&DISPATCH0", "CK&DISPATCH1", "CK1&Dispatch", "CK2&Dispatch", "CK3&Dispatch",
                "CK4&Dispatch", "CK5&Dispatch"}
    TYPES = {0x0: "any", 0x1: "real", 0x2: "complex", 0x3: "string", 0x4: "array", 0x5: "list", 0x6: "name",
             0x7: "local", 0x8: "program", 0x9: "algebraic", 0xA: "name|local|algebraic",
             0xB: "binary", 0xC: "grob", 0xD: "tagged", 0xE: "unit"}
    EXT_TYPES = {0x0: "romptr", 0x1: "bint", 0x2: "directory", 0x3: "%%", 0x4: "C%%", 0x5: "linked-array",
                 0x6: "char", 0x7: "code", 0x8: "library", 0x9: "backup", 0xA: "library-data",
                 0xB: "ext1", 0xC: "ext2", 0xD: "ext3", 0xE: "ext4"}

    def word(self, a):
        return sum(self.n[a + i] << (4 * i) for i in range(5))

    def type_code(self, ln):
        """The dispatch type code a line holds (a binary integer), if any."""
        if ln.value is None:
            return None
        kind, v = ln.value
        if kind == "romp":
            return None
        if kind == "ptr":
            if v >= len(self.n) - 10 or self.word(v) != sasm.PROLOG["DOBINT"]:
                return None
            v = self.word(v + 5)
        return v

    def describe_types(self, code):
        """`real real`: the argument types a dispatch code accepts, deepest
        stack level first."""
        out = []
        # the ROM checks from level 1 up until the rest of the code is 0;
        # a 0 digit accepts any object at its level
        while code:
            d = code & 0xF
            if d == 0xF:
                out.append(self.EXT_TYPES.get((code >> 4) & 0xF, "?"))
                code >>= 8
            else:
                out.append(self.TYPES.get(d, "?"))
                code >>= 4
        return " ".join(reversed(out)) or "any"

    def pack(self, lines):
        """Join RPL lines into lines of several objects, RPLCOMP style: a
        composite starts a line, its closer ends the line before, and lines
        break after runstream words and the objects they act on. Lines with
        a label, comments of their own or anything else to say stay apart."""
        out = []
        cur = None          # the line being built, and its objects' text
        take = {}           # indent -> objects left after a runstream word there
        table = None        # [indent, next is a type code] in a dispatch table

        def weak(c):
            # a binary integer's decimal value: dropped when the line is shared
            return not c or c.isdigit()

        def finish():
            if cur is not None:
                cur[0].parts = [cur[1]]
                if weak(cur[0].comment) and len(sasm.rpl_objects(sasm.split_line(cur[1]))) > 1:
                    cur[0].comment = ""

        def alone(ln):
            """Never shares its line."""
            return (ln.mode != "RPL" or not ln.size or ln.after or not ln.verify
                    or ln.parts[0].split()[0] in ("CODE", "GROB", "TAG"))

        def starts(ln):
            """Starts a line: something is written before it."""
            return (ln.pc in self.label or ln.pre or ln.gap or ln.head is not None or self.notes.get(ln.pc)
                    or self.ends.get(ln.pc) or self.major(ln.pc))

        for ln in lines:
            toks = sasm.split_line(ln.parts[0])
            text = " ".join(toks)
            word = toks[0] if toks else ""
            opener, closer = word in sasm.OPENERS, word in (";", "}")
            fits = cur is not None and len(" " * (8 + 2 * cur[0].indent) + cur[1] + " " + text) <= RPL_WIDTH
            # In a dispatch table each type code starts a line, which its
            # case joins; the code's types become the line's comment.
            if table is not None and (ln.indent < table[0] or closer and ln.indent == table[0] - 1):
                table = None
            is_code = table is not None and ln.indent == table[0] and table[1]
            code = self.type_code(ln) if is_code else None
            if is_code:
                if code is not None:
                    ln.comment = self.describe_types(code) + ("  " + ln.comment if not weak(ln.comment) else "")
                table[1] = False
            join = (cur is not None and not alone(ln) and not starts(ln) and not opener and (fits or closer)
                    and not is_code and (weak(cur[0].comment) or weak(ln.comment)))
            if join:
                cur[0].size += ln.size
                if weak(cur[0].comment):
                    cur[0].comment = ln.comment if not weak(ln.comment) else cur[0].comment or ln.comment
                cur[1] += " " + text
            else:
                finish()
                cur = None if alone(ln) else [ln, text]
                out.append(ln)
                if cur is None:
                    continue
            if word in self.DISPATCH:
                table = [ln.indent, True]
                finish()
                cur = None
                continue
            if table is not None and ln.indent == table[0] and not is_code and not opener:
                # a case complete: its line ends
                table[1] = True
                finish()
                cur = None
                continue
            # Break after a runstream word and the objects it acts on, and
            # after a composite that began on an earlier line.
            brk = False
            if ln.indent in take and not opener:
                take[ln.indent] -= 1
                if take[ln.indent] <= 0:
                    del take[ln.indent]
                    brk = True
            if closer:
                for i in [i for i in take if i > ln.indent]:
                    del take[i]
                toks_now = sasm.split_line(cur[1])
                if sum(t in sasm.OPENERS for t in toks_now) < sum(t in (";", "}") for t in toks_now):
                    brk = True
            n = self.takes(word)
            if n is not None:
                if n:
                    take[ln.indent] = n
                else:
                    brk = True
            if brk:
                finish()
                cur = None
        finish()
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
        top = ["* HP 48GX ROM revision R (Copyright HP 1993) as reassemblable source.",
               "* Reconstructed by tools/disasm.py; see firmware/README.md.",
               "* Build: python tools/build.py",
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
               "* Addresses in the right-hand comments are those of the original ROM."]
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
            for k, ln in enumerate(self.pack(lines)):
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
        # Replace only what this writes (the directory may hold a README)
        for name in GENERATED:
            p = SRC / name
            if p.is_dir():
                shutil.rmtree(p)
            elif p.exists():
                p.unlink()
        SRC.mkdir(parents=True, exist_ok=True)
        self.render()
        self.derive_names()
        self.name_labels()
        self.resolve_all()
        self.verify()
        files = self.write()
        print("wrote %d files, %d lines, %d labels (%d derived from where they are used), %d equates" % (
            len(files) + 2, len(self.lines), len(self.label), len(self.derived), len(self.eq)))
        if self.fallbacks:
            print("written as NIBHEX:", ", ".join("%s %d" % kv for kv in sorted(self.fallbacks.items())))
        if check:
            return sasm.main(["sasm", str(SRC / "rom.s"), "-o", str(OUT / "rom.bin"),
                              "--check", str(ROOT / "ROM" / "gxrom-r")])
        return 0


def main(argv):
    global SRC
    if "--out" in argv:
        SRC = Path(argv[argv.index("--out") + 1]).resolve()
    return Generator().run(check="--no-check" not in argv)


if __name__ == "__main__":
    import disasm
    sys.exit(disasm.main(sys.argv))
