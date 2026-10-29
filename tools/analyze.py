"""Whole-ROM analysis: classify every nibble of the rev R image as Saturn
code, RPL object, library structure or unknown data, by recursive traversal
from known entry points.

Memory model (see docs/rom-map.md):
  * #00000-#7FFFF lower ROM, always visible and executed in place.
  * #80000-#FFFFF upper ROM. At run time it is covered by RAM (#80000-#BFFFF)
    and port cards (#C0000-#FFFFF), so it only holds library parts, reached
    through the ROM library table at #702C4 and access handlers. Objects in
    it point only into lower ROM; they are fetched before use.
Pointers from lower ROM into #80000+ therefore refer to RAM, not ROM, and
are not followed.

Usage: python analyze.py            writes out/analysis.pickle and a summary
"""
import bisect
import pickle
import re
import sys
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path

from rom import Rom
from rpl import Decoder as RplDecoder, DecodeError, PROLOGS, SEMI
from saturn import Decoder as CodeDecoder
from symbols import Symbols, fake_number

OUT = Path(__file__).resolve().parent.parent / "out"
DATA = Path(__file__).resolve().parent.parent / "data"
LOWER_END = 0x80000
ROM_LIB_TABLE = 0x702C4   # loaded by LC(5) at #0ACF9 during warmstart
DOACPTR = 0x02BAA
# Upper ROM below the first library part holds self-test code that runs with
# RAM unconfigured (it calls lower ROM directly and shows "Version HP48-R").
UNCOVERED_CODE = (0x80000, 0x82007)
DOHSTR = 0x02A4E
DOROMP = 0x02E92
RPL_GOTOS = {0x619CB, 0x619E0, 0x619F3}     # GOTO ?GOTO NOT?GOTO: an address follows
# Entries of the algebra's rule interpreter: the call is followed by a rule
# stream, not by code (see Analyzer.rule_streams).
RULE_INTERPRETERS = {0x5F6F2, 0x5F6F9}

# Callees that start with C=RSTK only to save their return address, and
# return to it: no inline data follows a call to them.
RETURNS_NORMALLY = {
    0x0613E,    # GARBAGECOL: keeps it in GARBSCRATCH1
}


def read_tables(rom=None):
    """data/tables.txt as dicts: start, size, desc, and words: (address,
    width, field, entry) for every field of every entry, where field is
    "a" (address of an object or data), "c" (address of machine code), "n"
    (a number), "t" (ASCII text), "s" (a counted string: length byte, then
    the bytes), "count" (the table's own entry count) or "end" (the zero
    terminator)."""
    rom = rom or Rom()
    out = []
    path = DATA / "tables.txt"
    if not path.exists():
        return out
    for line in path.read_text(encoding="utf-8").splitlines():
        if line.startswith("#") or not line.strip():
            continue
        a, spec, count, desc = (line.split("\t") + ["", "", ""])[:4]
        fields = []
        for f in re.findall(r"\(\d+\)|t\d+|[acs]|\d", spec):
            if f in ("a", "c"):
                fields.append((f, 5))
            elif f == "s":
                fields.append(("s", None))
            elif f.startswith("t"):
                fields.append(("t", 2 * int(f[1:])))
            else:
                fields.append(("n", int(f.strip("()"))))
        a = p = int(a, 16)
        words = []
        if count.startswith("#"):
            # the count is the table's first field, of that many nibbles
            w = int(count[1:])
            count = rom.read(p, w)
            words.append((p, w, "count", -1))
            p += w
        else:
            count = int(count)
        k = 0
        while count == 0 or k < count:
            first = fields[0][1] or 2
            if count == 0 and rom.read(p, first) == 0:
                words.append((p, first, "end", k))
                p += first
                break
            for f, w in fields:
                if f == "s":
                    w = 2 + 2 * rom.read(p, 2)
                words.append((p, w, f, k))
                p += w
            k += 1
        out.append({"start": a, "size": p - a, "desc": desc, "words": words})
    return out


@dataclass
class Item:
    start: int
    size: int
    kind: str          # "code", "obj", "pco", "libtab", "libpart", "data"
    info: dict = field(default_factory=dict)


@dataclass
class Library:
    num: int
    hdr: int           # address of the lib# field (what the ROM table points to)
    access: int        # access handler (0 = directly visible)
    hash: int | None = None
    message: int | None = None
    link: int | None = None
    config: int | None = None
    names: dict = field(default_factory=dict)    # cmd -> name
    commands: list = field(default_factory=list)  # cmd -> address
    obj_start: int | None = None                  # enclosing DOLIB, if any


class Analyzer:
    def __init__(self):
        self.rom = Rom()
        self.sym = Symbols()
        self.cd = CodeDecoder(self.rom.n)
        self.rd = RplDecoder(self.rom)
        self.owner = {}            # nibble -> item start (only item starts kept in items)
        self.items = {}            # start -> Item
        self.insns = {}            # code addr -> Insn
        self.labels = {}           # addr -> generated label kind ("sub", "loc", "obj")
        self.xrefs = defaultdict(set)   # target -> {(from_addr, how)}
        self.conflicts = []
        self.unresolved = defaultdict(set)  # addr -> {reasons}
        self.libs = []
        self.romptr_names = dict(self.sym.romptrs)  # (lib, cmd) -> name
        self.inline_callers = set()
        self.overlaps = set()      # code addresses whose insn shares nibbles with another
        self.work = []
        self.work_code = []
        self.presumed_uncond = set()   # conditional branches inferred to be always taken
        self.data_refs = defaultdict(set)  # address constants in code: target -> {insn}
        self.speculative = set()       # entry points found by the gap pass, not by references
        self.shallow = set()           # executed instructions not yet followed

    # ------------------------------------------------------------ marking
    def free(self, a, size):
        return all((a + i) not in self.owner for i in range(size))

    def mark(self, item):
        for i in range(item.size):
            self.owner[item.start + i] = item.start
        self.items[item.start] = item

    def owned_by(self, a):
        s = self.owner.get(a)
        return self.items.get(s) if s is not None else None

    # ------------------------------------------------------------ queueing
    def q(self, kind, a, src=None, how=None, carry=None):
        a &= 0xFFFFF
        if src is not None:
            self.xrefs[a].add((src, how or kind))
        if kind == "code":
            self.work_code.append((a, carry))
        else:
            self.work.append((kind, a))

    def run(self):
        # Structured RPL data first, so code decoding stops at real objects.
        while self.work or self.work_code:
            if self.work:
                kind, a = self.work.pop()
                getattr(self, "do_" + kind)(a)
            else:
                a, carry = self.work_code.pop()
                self.do_code(a, carry)

    # ------------------------------------------------------------ code
    @staticmethod
    def carry_after(ins, carry):
        """Carry flag after a non-branching instruction (None = unknown)."""
        t = ins.text
        if ins.flow == "call":
            return None
        if t.startswith(("LC", "LA", "D0=(", "D1=(")):
            return carry
        if "+" in t or "-" in t:
            return None
        return carry

    def do_code(self, a, carry=None):
        upper_ok = a >= LOWER_END and (self.owned_by(a) is not None or
                                       UNCOVERED_CODE[0] <= a < UNCOVERED_CODE[1])
        branch_target = True
        prev = None
        while True:
            if a in self.insns and a not in self.shallow:
                return
            if a >= LOWER_END and not upper_ok:
                self.unresolved[a].add("code in upper ROM")
                return
            ins = self.cd.decode(a)
            if ins.flow == "stop":
                self.conflicts.append((a, "invalid opcode"))
                return
            clash = None
            shared = False
            for i in range(ins.size):
                o = self.owned_by(a + i)
                if o is None or o.kind == "codebody" or (o.start == a and a in self.shallow):
                    continue
                if o.kind == "code":
                    shared = True
                else:
                    clash = o
                    break
            if clash is not None:
                if prev is not None and prev.text.startswith(("GOC", "GONC", "RTNC", "RTNNC")):
                    # e.g. "GONC" after an op that always clears carry, used
                    # as a short GOTO: the fall-through is not code.
                    self.presumed_uncond.add(prev.addr)
                    return
                self.conflicts.append((a, "code runs into %s at %05X" % (clash.kind, clash.start)))
                return
            # Code may overlap other code: the ROM saves nibbles by branching
            # into the tail of an instruction (e.g. #0097B RTNCC / #0097C LC).
            # Only a branch target may do that; a fall-through landing inside
            # another instruction means this path is not really code.
            if shared and not branch_target:
                self.conflicts.append((a, "fall-through misaligned with existing code"))
                return
            if shared:
                self.overlaps.add(a)
            self.shallow.discard(a)
            self.insns[a] = ins
            if self.owned_by(a) is None or self.owned_by(a).kind != "codebody":
                self.items[a] = Item(a, ins.size, "code")
                for i in range(ins.size):
                    self.owner.setdefault(a + i, a)
            branch_target = False
            prev = ins

            flow = ins.flow
            is_test = ins.text.startswith("?")
            if flow in ("cjump", "cret") and not is_test and carry is not None:
                # GOC/GONC/RTNC/RTNNC with a known carry are unconditional
                taken = (carry == 1) == ins.text.startswith(("GOC", "RTNC"))
                if flow == "cjump":
                    flow = "jump" if taken else "next"
                else:
                    flow = "ret" if taken else "next"
                if flow == "next":
                    ins.info_never = True
            if ins.target is not None and flow in ("jump", "cjump", "call"):
                t = ins.target
                self.labels.setdefault(t, "sub" if flow == "call" else "loc")
                tc = 1 if (is_test or ins.text.startswith("GOC")) else (
                    0 if ins.text.startswith("GONC") else None)
                if t < LOWER_END or upper_ok:
                    self.q("code", t, a, flow, carry=tc if flow != "call" else None)
                else:
                    self.xrefs[t].add((a, flow))
            if ins.const is not None:
                self.const_ref(a, ins.const)
            if flow == "call" and self.is_inline_data_call(ins.target):
                self.inline_callers.add(a)
                return
            if flow in ("ret", "jump", "ijump"):
                return
            # carry on fall-through
            if is_test or ins.text.startswith(("GOC", "RTNC")):
                carry = 0
            elif ins.text.startswith(("GONC", "RTNNC")):
                carry = 1
            else:
                carry = self.carry_after(ins, carry)
            a += ins.size

    def is_inline_data_call(self, t):
        """Callees that pop their return address to read inline data."""
        if t is None or t >= LOWER_END:
            return False
        return t in RULE_INTERPRETERS or (self.rom.n[t] == 0 and self.rom.n[t + 1] == 7  # C=RSTK
                                          and t not in RETURNS_NORMALLY)

    def const_ref(self, src, v):
        if v >= LOWER_END:
            return
        if v >= 0x00140:
            self.data_refs[v].add(src)
        if v in PROLOGS:
            self.q("code", v, src, "const")
        elif self.rd.is_object(v):
            self.q("obj", v, src, "const")
        elif self.rd.is_pco(v):
            self.q("ptr", v, src, "const")

    # ------------------------------------------------------------ RPL
    def unmark_slot(self, a):
        """Drop a dynamic pointer slot at a, so an object starting there can
        be decoded (its prolog word is read and jumped through too)."""
        it = self.items.get(a)
        if it is not None and it.kind in ("addrslot", "rplptr"):
            del self.items[a]
            for i in range(it.size):
                self.owner.pop(a + i, None)

    def do_ptr(self, a):
        if self.rd.is_object(a) or self.rd.is_pco(a):
            self.unmark_slot(a)
        if a in self.items:
            return
        if a < LOWER_END and a in PROLOGS:
            self.q("code", a)
            return
        if self.rd.is_object(a):
            self.q("obj", a)
        elif self.rd.is_pco(a):
            if self.free(a, 5):
                self.mark(Item(a, 5, "pco"))
                self.labels.setdefault(a, "obj")
            self.q("code", a + 5, a, "pco")
        elif self.is_code_pointer(a):
            # An object that is just the address of machine code elsewhere:
            # the inner loop's PC=(A) jumps through it like through a PCO
            # (e.g. DUP#0=case at #61891 -> #641CC).
            v = self.rom.addr(a)
            self.mark(Item(a, 5, "codeptr"))
            self.labels.setdefault(a, "obj")
            self.q("code", v, a, "codeptr")
        else:
            self.unresolved[a].add("pointer target is neither object nor PCO")

    def is_code_pointer(self, a):
        v = self.rom.addr(a)
        if a >= LOWER_END or v >= LOWER_END or v < 0x140 or not self.free(a, 5):
            return False
        return v in self.insns or self.try_code(v)

    def do_obj(self, a):
        self.unmark_slot(a)
        if a in self.items:
            return
        it = self.owned_by(a)
        if it is not None:
            # pointer into the middle of another object (embedded object)
            self.labels.setdefault(a, "obj")
            return
        try:
            o = self.rd.decode(a)
        except DecodeError as e:
            self.unresolved[a].add(str(e))
            return
        if a < LOWER_END and a + o.size > LOWER_END:
            self.unresolved[a].add("object would cross into upper ROM")
            return
        if not self.free(a, o.size):
            # Objects found earlier may be embedded in this one: absorb them.
            inner = {self.owner[a + i] for i in range(o.size) if (a + i) in self.owner}
            items = [self.items[s] for s in inner]
            # Code found earlier may be the body of one of this object's code
            # objects (TOD>Ticks: its CODE runs into code other routines use).
            bodies = []
            todo = [o]
            while todo:
                x = todo.pop()
                if x.kind == "DOCODE":
                    bodies.append((x.addr + 10, x.addr + x.size))
                todo += x.children

            def in_body(it):
                return it.kind == "code" and any(b0 <= it.start and it.start + it.size <= b1 for b0, b1 in bodies)
            if all((it.kind in ("obj", "pco", "codebody", "addrslot", "rplptr")
                    or (it.kind == "code" and it.start in self.shallow) or in_body(it))
                   and it.start + it.size <= a + o.size for it in items):
                for it in items:
                    if it.kind == "codebody":
                        continue
                    del self.items[it.start]
                    for i in range(it.size):
                        self.owner.pop(it.start + i, None)
            else:
                self.conflicts.append((a, "object of %d nibbles overlaps existing %s" % (
                    o.size, ",".join(sorted({it.kind for it in items})))))
                return
        self.mark(Item(a, o.size, "obj", {"type": o.kind}))
        self.labels.setdefault(a, "obj")
        self.scan_object(o, a)

    def scan_object(self, o, top):
        if o.kind == "PTR":
            v = o.value
            if v < LOWER_END:
                self.q("ptr", v, o.addr, "rpl")
            else:
                self.xrefs[v].add((o.addr, "rpl-ram"))
            return
        if o.kind == "DOROMP":
            self.xrefs[("romptr",) + o.value].add((o.addr, "romptr"))
        if o.kind == "DOCODE":
            body = o.addr + 10
            end = o.addr + o.size
            # code body lives inside the object; allow code there
            for i in range(body, end):
                self.owner.pop(i, None)
            self.mark(Item(body, end - body, "codebody", {"obj": top}))
            self.q("code", body, o.addr, "codeobj")
        for c in o.children:
            self.scan_object(c, top)

    # ------------------------------------------------------------ libraries
    def deref_acptr(self, a):
        if a is not None and self.rom.addr(a) == DOACPTR:
            return self.rom.addr(a + 5), self.rom.addr(a + 10)
        return a, None

    def read_library_table(self):
        r = self.rom
        p = ROM_LIB_TABLE
        while True:
            num, hdr, acc = r.read(p, 3), r.addr(p + 3), r.addr(p + 8)
            if num == 0xFFF or r.read(hdr, 3) != num:
                break
            lib = Library(num, hdr, acc)
            for i, key in enumerate(("hash", "message", "link", "config")):
                q = hdr + 3 + 5 * i
                off = r.addr(q)
                setattr(lib, key, (q + off) & 0xFFFFF if off else None)
            self.libs.append(lib)
            p += 13
        self.mark(Item(ROM_LIB_TABLE, p + 3 - ROM_LIB_TABLE, "libtab",
                       {"count": len(self.libs)}))
        return p + 3

    def process_libraries(self):
        r = self.rom
        for lib in self.libs:
            # DOLIB wrapper (upper ROM parts are complete library objects)
            for back in range(12, 64, 2):
                s = lib.hdr - back
                if r.addr(s) == 0x02B40 and r.addr(s + 5) > 0 and s + 5 + r.addr(s + 5) > lib.hdr:
                    lib.obj_start = s
                    break
            hdr_size = 23
            self.mark(Item(lib.hdr, hdr_size, "libhdr", {"lib": lib.num}))
            # link table
            link, _ = self.deref_acptr(lib.link)
            if link is not None and r.addr(link) == DOHSTR:
                ln = r.addr(link + 5)
                q = link + 10
                while q < link + 5 + ln:
                    lib.commands.append((q + r.addr(q)) & 0xFFFFF)
                    q += 5
                self.mark(Item(link, 5 + ln, "liblink", {"lib": lib.num}))
            # hash table (names)
            ht, _ = self.deref_acptr(lib.hash)
            if ht is not None and r.addr(ht) == DOHSTR:
                lib.names = self.rd.library_names({"hash": ht})
                self.mark(Item(ht, 5 + r.addr(ht + 5), "libhash", {"lib": lib.num}))
                for cmd, nm in lib.names.items():
                    self.romptr_names.setdefault((lib.num, cmd), nm)
            if lib.hash is not None and lib.hash != ht:
                self.q("obj", lib.hash)
            msg, _ = self.deref_acptr(lib.message)
            if lib.message is not None and lib.message != msg:
                self.q("obj", lib.message)
            if msg is not None and self.rd.is_object(msg):
                self.q("obj", msg)
            if lib.config is not None:
                self.q("ptr", lib.config, lib.hdr, "libconfig")
            for cmd, a in enumerate(lib.commands):
                self.labels.setdefault(a, "obj")
                self.xrefs[a].add((lib.hdr, "libcmd %03X:%03X" % (lib.num, cmd)))
                if self.rd.is_object(a):
                    self.q("obj", a)
                else:
                    self.q("ptr", a)

    # ------------------------------------------------------------ seeds
    def seed(self):
        self.q("code", 0x00000)      # reset
        self.q("code", 0x0000F)      # interrupt vector
        self.q("code", UNCOVERED_CODE[0])
        self.q("ptr", 0x7FFA0)       # version strings (VERSION has # 7FFA0)
        for p in PROLOGS:
            self.q("code", p)
        for a, s in self.sym.by_addr.items():
            if a >= LOWER_END or a < 0x00140:
                continue
            if "RAM" in s.flags or s.usage in ("SYS", "IOR"):
                continue
            if a < 0x1000 and not s.flags and s.name and s.name.endswith(("err", "msg")):
                continue    # a message number (posunferr = #301), not an address
            if fake_number(self.rom, s):
                continue
            if self.rd.is_object(a) or self.rd.is_pco(a):
                self.q("ptr", a)
            elif "ML" in s.flags or s.usage == "ASM":
                self.q("code", a)
            else:
                self.q("ptr", a)

    def mark_prolog_descriptors(self):
        """Each prolog is preceded by two 5-nibble words (pointers used by the
        object utilities, e.g. #02C28 #0308E before DOBINT)."""
        for p in PROLOGS:
            a = p - 10
            if self.free(a, 10):
                self.mark(Item(a, 10, "ptrdata", {"what": "prolog descriptor"}))

    def read_executed(self):
        """What the emulator saw the ROM do (crates/hp48/examples/execmap.rs):
        executed instructions, objects run through PC=(A), and the RPL
        pointer slots the inner loop fetched them from."""
        self.executed = {"": [], "O": [], "P": [], "A": []}
        path = DATA / "executed.txt"
        if path.exists():
            for line in path.read_text().splitlines():
                if line and not line.startswith("#"):
                    kind, _, a = line.rpartition(" ")
                    self.executed[kind].append(int(a, 16))

    def seed_executed(self):
        """Executed instructions are certainly code, even where nothing static
        leads to them (computed jumps, the self-test). Decoded first, so that
        bytes that merely look like an object cannot claim them."""
        self.read_executed()
        self.addr_slots = set(self.executed["A"])
        # Table words whose value the code put into PC, D0 or D1 are
        # addresses, whatever bytes around them look like. Mark them before
        # following code, so that falling through a GOSUB does not decode
        # an inline table as instructions (#15B4C after GOSUB SUB_15C5F).
        covered = set()
        for a in self.executed[""]:
            covered.update(range(a, a + self.cd.decode(a).size))
        for a in self.executed["A"]:
            # A prolog's first word reads as #028FC (PRLG): code, not a slot
            if a in PROLOGS:
                continue
            if self.free(a, 5) and not covered.intersection(range(a, a + 5)):
                self.mark(Item(a, 5, "addrslot"))
        # The executed instructions themselves, without following them yet:
        # objects are decoded first, so that a fall-through (a GONC whose
        # carry the analysis cannot know) stops at them (the PCO at #7D4C5).
        for a in self.executed[""]:
            ins = self.cd.decode(a)
            if ins.flow != "stop" and self.free(a, ins.size):
                self.insns[a] = ins
                self.mark(Item(a, ins.size, "code"))
                self.shallow.add(a)
        for a in self.executed["O"]:
            self.q("ptr", a)
        self.run()

    def follow_executed(self):
        for a in self.executed[""]:
            self.q("code", a)
        self.run()

    def seed_slots(self):
        """Pointer slots outside any known object: runs of RPL pointers that
        machine code hands to the inner loop (e.g. #315EF after CLOSEUART)."""
        for a in self.executed["P"]:
            if self.free(a, 5):
                self.mark(Item(a, 5, "rplptr"))
                self.q("ptr", self.rom.addr(a), a, "rpl")
        self.goto_targets()

    def goto_targets(self):
        """GOTO, ?GOTO and NOT?GOTO in a run of pointers take the next word
        as the address of the RPL to continue with (#1803D GOTO #17FBB,
        then SEMI)."""
        for a, it in list(self.items.items()):
            if it.kind in ("rplptr", "addrslot") and self.rom.addr(a) in RPL_GOTOS and self.free(a + 5, 5):
                self.mark(Item(a + 5, 5, "addrslot", {"static": True}))
                self.xrefs[self.rom.addr(a + 5)].add((a + 5, "rpl goto"))
                if self.rom.addr(a + 10) == SEMI and self.free(a + 10, 5):
                    self.mark(Item(a + 10, 5, "rplptr"))
        self.run()

    def declared_tables(self):
        """Tables listed in data/tables.txt, claimed before anything else."""
        for t in read_tables():
            self.mark(Item(t["start"], t["size"], "table", t))
            for w, _, fld, _ in t["words"]:
                if fld in ("a", "c") and self.rom.addr(w):
                    self.q("ptr" if fld == "a" else "code", self.rom.addr(w), w, "table")
        # Code no executed or followed path reaches: entered through
        # computed addresses, copied to RAM first, or from untaken handlers.
        path = DATA / "code-entries.txt"
        if path.exists():
            for line in path.read_text(encoding="utf-8").splitlines():
                if line.strip() and not line.startswith("#"):
                    self.q("code", int(line.split("\t")[0], 16))

    def analyze(self):
        self.declared_tables()
        self.mark_prolog_descriptors()
        self.seed_executed()
        self.read_library_table()
        self.process_libraries()
        self.run()
        for lib in self.libs:
            if lib.access:
                self.q("code", lib.access, lib.hdr, "libaccess")
        self.seed()
        self.run()
        self.follow_executed()
        self.seed_slots()
        self.command_trailers()
        self.rule_streams()
        self.gap_pass()
        self.command_trailers()

    # ------------------------------------------------------------ rule streams
    def rule_streams(self):
        """The algebra's rewrite rules (SUB_5F6F2) follow the call as data:
        pairs of a pattern word and the object to run when it matches (a
        pointer or an inline ROMPTR), ended by a word whose first nibble is
        F (only that nibble belongs to the stream) or by a zero word and its
        object. Each nibble of a pattern word is a test: k > 0 compares the
        expression with entry k-1 of an operator table, 0 descends into an
        argument."""
        for call in sorted(self.inline_callers):
            ins = self.insns.get(call)
            if ins is None or ins.target not in RULE_INTERPRETERS:
                continue
            start = call + ins.size
            parts = self.parse_rules(start)
            if parts is None:
                self.unresolved[start].add("rule stream does not parse")
                continue
            end = parts[-1][1] + parts[-1][2]
            inside = {self.owner[x] for x in range(start, end) if x in self.owner}
            if any(o < start or o + self.items[o].size > end for o in inside):
                self.unresolved[start].add("rule stream overlaps other items")
                continue
            for o in inside:
                del self.items[o]
                self.insns.pop(o, None)
            for x in range(start, end):
                self.owner.pop(x, None)
            self.mark(Item(start, end - start, "rules", {"parts": parts}))
            for kind, q, _ in parts:
                if kind == "ptr":
                    self.q("ptr", self.rom.addr(q), q, "rule")
        self.run()

    def parse_rules(self, p):
        """[(kind, address, size)] of a rule stream at p, or None."""
        parts = []
        for _ in range(64):
            if self.rom.n[p] == 0xF:
                parts.append(("end", p, 1))
                return parts
            w = self.rom.addr(p)
            parts.append(("pattern", p, 5))
            p += 5
            v = self.rom.addr(p)
            if v == DOROMP:
                parts.append(("romptr", p, 11))
                p += 11
            elif 0x140 <= v < LOWER_END and (v in self.items or v in self.insns or v in self.sym.by_addr):
                parts.append(("ptr", p, 5))
                p += 5
            else:
                return None
            if w == 0:
                return parts
        return None

    # ------------------------------------------------------------ trailers
    def command_trailers(self):
        """Many built-in functions are followed by slots that the symbolic
        code uses (x+ has D/D+, the derivative, and more): each slot is a
        pointer, 00000 (none) or an inline object, and in library 002 a
        byte ends the trailer (CC after SIN). Only commands with a 7-nibble
        header are tried, and a parse counts only if it ends exactly where
        the next command header starts."""
        heads = []
        for lib in self.libs:
            for cmd, a in enumerate(lib.commands):
                h = a - 7
                if self.rom.read(h + 1, 3) == lib.num and self.rom.read(h + 4, 3) == cmd:
                    heads.append((h, a, lib.num, cmd))
        heads.sort()
        starts = [h for h, _, _, _ in heads]
        for h, a, lib, cmd in heads:
            if not self.rd.is_object(a):
                continue
            try:
                end = a + self.rd.decode(a).size
            except DecodeError:
                continue
            if end in self.items and self.items[end].kind == "trailer":
                continue
            i = bisect.bisect_right(starts, end - 1)
            if i == len(starts) or not 2 <= starts[i] - end <= 600:
                continue
            nxt = starts[i]
            slots = self.parse_trailer(end, nxt - 2)
            byte = slots is not None
            if not byte:
                slots = self.parse_trailer(end, nxt)
            if not byte and (slots is None or all(k == "obj" for k, _, _ in slots)):
                continue    # nothing but objects: ordinary objects, not slots
            inside = {self.owner[x] for x in range(end, nxt) if x in self.owner}
            if any(self.items[o].kind not in ("addrslot", "rplptr", "data", "fill", "obj", "codeptr")
                   or o < end or o + self.items[o].size > nxt for o in inside):
                continue
            for o in inside:
                del self.items[o]
            for x in range(end, nxt):
                self.owner.pop(x, None)
            self.mark(Item(end, nxt - end, "trailer", {"slots": slots, "lib": lib, "cmd": cmd, "byte": byte}))
            for kind, p, _ in slots:
                if kind == "ptr":
                    self.q("ptr", self.rom.addr(p), p, "trailer")
        self.run()

    def parse_trailer(self, p, stop):
        """Slots from p up to stop: [(kind, address, size)], or None."""
        slots = []
        while p < stop:
            w = self.rom.addr(p)
            if w == 0:
                slots.append(("none", p, 5))
                p += 5
            elif self.rd.is_object(p):
                try:
                    size = self.rd.decode(p).size
                except DecodeError:
                    return None
                slots.append(("obj", p, size))
                p += size
            elif 0x140 <= w < LOWER_END and (w in self.items or w in self.insns or w in self.sym.by_addr):
                slots.append(("ptr", p, 5))
                p += 5
            else:
                return None
        return slots if p == stop else None

    # ------------------------------------------------------------ gaps
    def gaps(self, lo=0, hi=LOWER_END, minsize=4):
        a = lo
        while a < hi:
            if a in self.owner:
                a += 1
                continue
            b = a
            while b < hi and b not in self.owner:
                b += 1
            if b - a >= minsize:
                yield a, b
            a = b

    def try_code(self, a, limit=400):
        """Dry run: does code at a decode cleanly until it ends?"""
        seen = set()
        work = [a]
        n = 0
        while work:
            p = work.pop()
            first = True
            while p not in seen:
                if n > limit:
                    return True     # that many clean instructions: code
                if p >= LOWER_END:
                    return False
                if p in self.insns:
                    break           # known code from here on
                ins = self.cd.decode(p)
                if ins.flow == "stop":
                    return False
                for i in range(ins.size):
                    if self.owned_by(p + i) is not None:
                        return False   # runs into an object, data or another instruction
                seen.add(p)
                n += 1
                first = False
                if ins.flow in ("jump", "cjump") and ins.target is not None:
                    if ins.target < LOWER_END:
                        work.append(ins.target)
                if ins.flow in ("ret", "jump", "ijump"):
                    break
                if (p + ins.size) in self.insns:
                    break
                p += ins.size
        return n >= 3

    def address_tables(self):
        """In unclaimed areas, runs of two or more 5-nibble words that each
        hold the address of a named entry are address tables (e.g. #5F908:
        argument-check routines the code compares against). Random data
        does that rarely; without this the gap pass may decode them as code."""
        named = {a for a, sy in self.sym.by_addr.items()
                 if 0x140 <= a < LOWER_END and "RAM" not in sy.flags and sy.usage not in ("IOR", "SYS")}
        for a, b in list(self.gaps(0, LOWER_END, 10)):
            p = a
            while p + 10 <= b:
                q = p
                while q + 5 <= b and self.rom.addr(q) in named:
                    q += 5
                if q - p >= 10:
                    for w in range(p, q, 5):
                        self.mark(Item(w, 5, "addrslot", {"static": True}))
                        self.q("ptr", self.rom.addr(w), w, "table")
                    p = q
                else:
                    p += 1
        self.run()
        self.goto_targets()

    def gap_pass(self):
        """Classify unreferenced gaps: objects with a valid prolog first,
        then code that decodes cleanly. Entries found here are speculative
        (reached by computed jumps or not at all)."""
        self.address_tables()
        for rounds in range(4):
            found = 0
            for a, b in list(self.gaps()):
                if self.rd.is_object(a):
                    try:
                        o = self.rd.decode(a)
                    except DecodeError:
                        o = None
                    if o is not None and a + o.size <= b:
                        self.speculative.add(a)
                        self.q("obj", a)
                        self.run()
                        found += 1
                        continue
                if all(x == 0 for x in self.rom.n[a:b]):
                    continue
                if self.try_code(a):
                    self.speculative.add(a)
                    self.q("code", a)
                    self.run()
                    found += 1
            if not found:
                break
        # upper ROM: library bodies are runs of objects; decode unreferenced ones
        for rounds in range(8):
            found = 0
            for a, b in list(self.gaps(LOWER_END, 0x100000, 5)):
                if self.rd.is_object(a):
                    try:
                        o = self.rd.decode(a)
                    except DecodeError:
                        continue
                    if a + o.size <= b:
                        self.speculative.add(a)
                        self.q("obj", a)
                        self.run()
                        found += 1
            if not found:
                break
        # objects that follow zero fill inside a gap (e.g. the version
        # strings after the fill at #7E001)
        for a, b in list(self.gaps(0, 0x100000, 16)):
            p = a
            while p < b:
                z = p
                while z < b and self.rom.n[z] == 0:
                    z += 1
                if z - p >= 16 and z + 5 <= b and self.rd.is_object(z):
                    try:
                        o = self.rd.decode(z)
                    except DecodeError:
                        o = None
                    if o is not None and z + o.size <= b:
                        self.speculative.add(z)
                        self.q("obj", z)
                        self.run()
                        break
                p = z + 1
        # residual gaps: runs of zeros (>= 16 nibbles) are fill, the rest data
        for a, b in list(self.gaps(0, 0x100000, 1)):
            p = a
            while p < b:
                q = p
                while q < b and self.rom.n[q] == 0:
                    q += 1
                if q - p >= 16 or (q == b and p == a):
                    self.mark(Item(p, q - p, "fill"))
                    p = q
                    continue
                q = p
                while q < b:
                    z = q
                    while z < b and self.rom.n[z] == 0:
                        z += 1
                    if z - q >= 16:
                        break
                    q = z + 1 if z == q else z
                self.mark(Item(p, q - p, "data"))
                p = q

    # ------------------------------------------------------------ results
    def coverage(self, lo, hi):
        counts = defaultdict(int)
        for a in range(lo, hi):
            s = self.owner.get(a)
            counts[self.items[s].kind if s is not None else "unknown"] += 1
        return dict(counts)

    def save(self):
        OUT.mkdir(exist_ok=True)
        state = {k: getattr(self, k) for k in
                 ("items", "insns", "labels", "xrefs", "conflicts", "unresolved",
                  "libs", "romptr_names", "inline_callers", "overlaps", "presumed_uncond", "data_refs", "speculative",
                  "addr_slots")}
        with open(OUT / "analysis.pickle", "wb") as f:
            pickle.dump(state, f)
        # Every code address, for the Rust translator (examples/translate.rs).
        with open(OUT / "code.txt", "w") as f:
            f.writelines("%05X\n" % a for a in sorted(self.insns))


def main():
    an = Analyzer()
    an.analyze()
    an.save()
    for lo, hi in ((0, 0x80000), (0x80000, 0x100000)):
        cov = an.coverage(lo, hi)
        tot = hi - lo
        print("%05X-%05X: " % (lo, hi - 1) +
              ", ".join("%s %.1f%%" % (k, 100.0 * v / tot) for k, v in sorted(cov.items())))
    print("libraries:", len(an.libs), " items:", len(an.items),
          " instructions:", len(an.insns), " conflicts:", len(an.conflicts),
          " unresolved:", len(an.unresolved))


if __name__ == "__main__":
    # run via the module so pickled classes resolve as analyze.Item etc.
    import analyze
    analyze.main()
