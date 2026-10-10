"""Write an annotated listing of the whole ROM from out/analysis.pickle.

Usage: python listing.py [lo hi]     (hex addresses, default whole ROM)
Output: out/rom-r.lst
"""
import pickle
import sys
from pathlib import Path

import analyze  # noqa: F401  (needed to unpickle analyze.Item etc.)
from rom import Rom
from rpl import Decoder as RplDecoder, DecodeError
from symbols import Symbols

OUT = Path(__file__).resolve().parent.parent / "out"
MAX_XREFS = 6


class Lister:
    def __init__(self):
        with open(OUT / "analysis.pickle", "rb") as f:
            self.s = pickle.load(f)
        self.rom = Rom()
        self.sym = Symbols()
        self.rd = RplDecoder(self.rom)
        self.items = self.s["items"]
        self.insns = self.s["insns"]
        self.xrefs = self.s["xrefs"]
        self.romptr_names = self.s["romptr_names"]
        self.libcmd = {}
        for lib in self.s["libs"]:
            for cmd, a in enumerate(lib.commands):
                nm = lib.names.get(cmd) or self.romptr_names.get((lib.num, cmd))
                self.libcmd[a] = (lib.num, cmd, nm)

    # ------------------------------------------------------------ names
    def name(self, a):
        n = self.sym.name(a)
        if n:
            return n
        if a in self.libcmd:
            lib, cmd, nm = self.libcmd[a]
            return nm or "ROMPTR_%03X_%03X" % (lib, cmd)
        return None

    def ref(self, a):
        return self.name(a) or "#%05X" % a

    def label_line(self, a):
        n = self.name(a)
        if n is None and a in self.s["labels"]:
            n = {"sub": "SUB", "loc": "L", "obj": "OBJ"}[self.s["labels"][a]] + "_%05X" % a
        if n is None:
            return []
        out = ["", "%s:" % n]
        s = self.sym.by_addr.get(a)
        if s and s.stack:
            out.append("\t\t\t\t; ( %s )" % s.stack)
        if a in self.libcmd:
            lib, cmd, _ = self.libcmd[a]
            out.append("\t\t\t\t; ROMPTR %03X %03X" % (lib, cmd))
        xs = sorted(f for f, h in self.xrefs.get(a, ()) if isinstance(f, int))
        if xs:
            more = " ..." if len(xs) > MAX_XREFS else ""
            out.append("\t\t\t\t; refs (%d): %s%s" % (
                len(xs), " ".join("%05X" % x for x in xs[:MAX_XREFS]), more))
        return out

    # ------------------------------------------------------------ code
    def code_line(self, a):
        ins = self.insns[a]
        lines = ins.text.split("\n")
        notes = []
        if ins.target is not None and self.name(ins.target):
            notes.append(self.name(ins.target))
        if ins.const is not None and self.name(ins.const):
            notes.append("=" + self.name(ins.const))
        if a in self.s["overlaps"]:
            notes.append("overlaps previous insn")
        if a in self.s["presumed_uncond"]:
            notes.append("always taken")
        if getattr(ins, "info_never", False):
            notes.append("never taken")
        if a in self.s["inline_callers"]:
            notes.append("inline data follows")
        out = []
        for k, t in enumerate(lines):
            c = ("\t; " + ", ".join(notes)) if (notes and k == len(lines) - 1) else ""
            out.append("%05X  %-14s  %s%s" % (a, self.rom.hexs(a, ins.size) if k == 0 else "",
                                             t.strip(), c))
        return out

    # ------------------------------------------------------------ RPL
    def rpl_lines(self, o, ind, out):
        pad = "  " * ind
        a = o.addr
        if ind and (self.name(a) or a in self.s["labels"]):
            out.extend(self.label_line(a))
        if o.kind == "PTR":
            out.append("%05X  %s%s" % (a, pad, self.ref(o.value) if o.value < 0x80000
                                       else "#%05X\t; RAM" % o.value))
            return
        if o.kind in ("DOCOL", "DOLIST", "DOSYMB", "DOEXT"):
            op, cl = {"DOCOL": ("::", ";"), "DOLIST": ("{", "}"),
                      "DOSYMB": ("SYMBOL", ";"), "DOEXT": ("UNIT", ";")}[o.kind]
            out.append("%05X  %s%s" % (a, pad, op))
            for c in o.children:
                self.rpl_lines(c, ind + 1, out)
            out.append("%05X  %s%s" % (a + o.size - 5, pad, cl))
            return
        if o.kind == "DOTAG":
            out.append("%05X  %sTAG %s" % (a, pad, o.value))
            self.rpl_lines(o.children[0], ind + 1, out)
            return
        v = o.value
        if o.kind == "DOBINT":
            s = "# %X" % v
            nm = self.sym.name(a)
        elif o.kind == "DOREAL" or o.kind == "DOEREL":
            s = ("%" if o.kind == "DOREAL" else "%%") + " %s" % v
        elif o.kind in ("DOCMP", "DOECMP"):
            s = "C%% %s %s" % v
        elif o.kind == "DOCHAR":
            s = "CHR %r" % v
        elif o.kind == "DOCSTR":
            s = "$ %s" % repr(v)
        elif o.kind == "DOHSTR":
            s = "HXS %d %s" % (len(v), v if len(v) <= 40 else v[:40] + "...")
        elif o.kind == "DOIDNT":
            s = "ID %s" % v
        elif o.kind == "DOLAM":
            s = "LAM %s" % v
        elif o.kind == "DOROMP":
            nm = self.romptr_names.get(v)
            s = "ROMPTR %03X %03X" % v + ("\t; %s" % nm if nm else "")
        elif o.kind == "DOGROB":
            s = "GROB %d x %d" % (v[1], v[0])
        elif o.kind == "DOACPTR":
            s = "ACPTR %05X %05X" % v
        elif o.kind == "DOCODE":
            out.append("%05X  %sCODE\t; %d nibbles" % (a, pad, o.size - 10))
            p = a + 10
            end = a + o.size
            while p < end:
                if p in self.insns:
                    if p != a + 10:
                        out.extend(self.label_line(p))
                    out.extend("       " + pad + l for l in self.code_line(p))
                    p += self.insns[p].size
                else:
                    q = p
                    while q < end and q not in self.insns:
                        q += 1
                    out.extend("       " + pad + l for l in self.hexdump(p, q))
                    p = q
            out.append("%05X  %sENDCODE" % (end, pad))
            return
        elif o.kind == "DOARRY":
            s = "ARRY (%d nibbles)" % o.size
        else:
            s = "%s (%d nibbles)" % (o.kind, o.size)
        out.append("%05X  %s%s" % (a, pad, s))

    # ------------------------------------------------------------ data
    def hexdump(self, lo, hi, width=32):
        out = []
        p = lo
        while p < hi:
            n = min(width, hi - p)
            txt = "".join(chr(c) if 32 <= c < 127 else "." for c in
                          (self.rom.byte(p + 2 * i) for i in range(n // 2)))
            out.append("%05X  NIBHEX %-32s  ; %s" % (p, self.rom.hexs(p, n), txt))
            p += n
        return out

    def lib_lines(self, it):
        a = it.start
        k = it.kind
        lib = it.info.get("lib")
        if k == "libhdr":
            return ["%05X  LIBRARY HEADER %03X  (hash/msg/link/config offsets)" % (a, lib)]
        if k == "liblink":
            out = ["%05X  LINK TABLE lib %03X" % (a, lib)]
            p = a + 10
            n = 0
            while p < a + it.size:
                t = (p + self.rom.addr(p)) & 0xFFFFF
                out.append("%05X    REL(5) %-24s ; %03X" % (p, self.ref(t), n))
                p += 5
                n += 1
            return out
        if k == "libhash":
            return ["%05X  HASH TABLE lib %03X (%d nibbles)" % (a, lib, it.size)]
        if k == "libtab":
            out = ["%05X  ROM LIBRARY TABLE (%d parts)" % (a, it.info["count"])]
            p = a
            while p + 13 <= a + it.size - 3:
                out.append("%05X    lib %03X hdr %05X access %05X" % (
                    p, self.rom.read(p, 3), self.rom.addr(p + 3), self.rom.addr(p + 8)))
                p += 13
            return out
        return []

    # ------------------------------------------------------------ main
    def write(self, lo, hi, path):
        starts = sorted(s for s in self.items if lo <= s < hi)
        with open(path, "w", encoding="utf-8", newline="\n") as f:
            f.write("; HP48GX ROM revision R - generated listing (tools/listing.py)\n")
            p = lo
            for s in starts:
                it = self.items[s]
                if it.kind == "codebody":
                    continue
                if s < p:
                    if it.kind == "code" and s in self.insns:
                        # overlapping instruction
                        for l in self.label_line(s) + self.code_line(s):
                            f.write(l + "\n")
                    continue
                if s > p:
                    f.write("\n; ---- unclassified %05X-%05X (%d nibbles)\n" % (p, s - 1, s - p))
                    for l in self.hexdump(p, s):
                        f.write(l + "\n")
                lines = self.label_line(s)
                if it.kind == "code":
                    lines += self.code_line(s)
                elif it.kind == "pco":
                    lines += ["%05X  %-14s  CON(5) (*)+5\t; primitive code object" % (
                        s, self.rom.hexs(s, 5))]
                elif it.kind == "obj":
                    try:
                        o = self.rd.decode(s)
                        self.rpl_lines(o, 0, lines)
                    except DecodeError as e:
                        lines.append("%05X  ; decode error %s" % (s, e))
                else:
                    lines += self.lib_lines(it)
                for l in lines:
                    f.write(l + "\n")
                p = max(p, s + it.size)
            if p < hi:
                f.write("\n; ---- unclassified %05X-%05X (%d nibbles)\n" % (p, hi - 1, hi - p))
                for l in self.hexdump(p, hi):
                    f.write(l + "\n")


def main(argv):
    lo = int(argv[1], 16) if len(argv) > 1 else 0
    hi = int(argv[2], 16) if len(argv) > 2 else 0x100000
    Lister().write(lo, hi, OUT / "rom-r.lst")


if __name__ == "__main__":
    main(sys.argv)
