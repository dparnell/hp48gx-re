"""Interactive helper: disassemble code or decode RPL at an address.

    python hpdis.py code ADDR|NAME [count]    Saturn disassembly
    python hpdis.py rpl  ADDR|NAME            RPL object decode
    python hpdis.py func ADDR|NAME            code reachable via jumps, in address order
    python hpdis.py auto ADDR|NAME            pick based on what is there
"""
import sys

from rom import Rom
from rpl import Decoder as RplDecoder, DecodeError, PROLOGS
from saturn import Decoder as CodeDecoder
from symbols import Symbols


class Printer:
    def __init__(self):
        self.rom = Rom()
        self.sym = Symbols()
        self.cd = CodeDecoder(self.rom.n)
        self.rd = RplDecoder(self.rom)

    def code(self, a, count=40, stop_at_ret=True):
        out = []
        for _ in range(count):
            i = self.cd.decode(a)
            lbl = self.sym.name(a)
            if lbl:
                out.append("%s:" % lbl)
            txt = i.text
            if i.target is not None:
                nm = self.sym.name(i.target)
                if nm:
                    txt += "\t; " + nm
            if i.const is not None:
                nm = self.sym.name(i.const)
                if nm:
                    txt += "\t; =" + nm
            for k, line in enumerate(txt.split("\n")):
                out.append("%05X  %-16s %s" % (a, self.rom.hexs(a, i.size) if k == 0 else "", line.strip()))
            a += i.size
            if stop_at_ret and i.flow in ("ret", "jump", "ijump", "stop"):
                break
        return "\n".join(out)

    def func(self, start, limit=3000):
        """All code reachable from start via jumps/branches (not calls),
        printed in address order, with local labels for branch targets."""
        seen = {}
        targets = {start}
        work = [start]
        while work and len(seen) < limit:
            a = work.pop()
            while a not in seen and len(seen) < limit:
                i = self.cd.decode(a)
                seen[a] = i
                if i.target is not None and i.flow in ("jump", "cjump"):
                    targets.add(i.target)
                    work.append(i.target)
                if i.flow in ("ret", "jump", "ijump", "stop"):
                    break
                a += i.size
        out = []
        prev_end = None
        for a in sorted(seen):
            i = seen[a]
            if prev_end is not None and a != prev_end:
                out.append("        ...")
            nm = self.sym.name(a)
            if nm or a in targets:
                out.append("%s:" % (nm or "L%05X" % a))
            txt = i.text
            for ref in (i.target, i.const):
                if ref is not None and self.sym.name(ref):
                    txt += "\t; " + self.sym.name(ref)
            for k, line in enumerate(txt.split("\n")):
                out.append("%05X  %-16s %s" % (a, self.rom.hexs(a, i.size) if k == 0 else "", line.strip()))
            prev_end = a + i.size
        return "\n".join(out)

    def rpl(self, a, indent=0):
        o = self.rd.decode(a)
        lines = []
        self._fmt(o, indent, lines)
        return "\n".join(lines)

    def _fmt(self, o, ind, lines):
        pad = "  " * ind
        if o.kind == "PTR":
            lines.append("%05X %s%s" % (o.addr, pad, self.sym.label(o.value)))
            return
        if o.kind in ("DOCOL", "DOLIST", "DOSYMB", "DOEXT"):
            opener = {"DOCOL": "::", "DOLIST": "{", "DOSYMB": "SYMBOL", "DOEXT": "UNIT"}[o.kind]
            closer = {"DOCOL": ";", "DOLIST": "}"}.get(o.kind, ";")
            lines.append("%05X %s%s" % (o.addr, pad, opener))
            for c in o.children:
                self._fmt(c, ind + 1, lines)
            lines.append("%05X %s%s" % (o.addr + o.size - 5, pad, closer))
            return
        if o.kind == "DOTAG":
            lines.append("%05X %sTAG %r" % (o.addr, pad, o.value))
            self._fmt(o.children[0], ind + 1, lines)
            return
        val = o.value
        if o.kind == "DOBINT":
            s = "# %X" % val
        elif o.kind == "DOROMP":
            nm = self.sym.romptrs.get(val)
            s = "ROMPTR %X %X" % val + (("  ; " + nm) if nm else "")
        elif o.kind == "DOCODE":
            s = "CODE (%d nibbles)" % o.size
        elif o.kind == "DOLIB":
            s = "LIBRARY %s" % {k: ("%05X" % v if isinstance(v, int) and k != "libnum" else v)
                                for k, v in val.items()}
        else:
            s = "%s %r" % (o.kind, val)
        lines.append("%05X %s%s" % (o.addr, pad, s))
        if o.kind == "DOCODE":
            lines.append(self.code(o.addr + 10, (o.size - 10), stop_at_ret=False))

    def auto(self, a):
        if self.rom.addr(a) in PROLOGS:
            return self.rpl(a)
        if self.rd.is_pco(a):
            return "%05X  PCO -> code\n" % a + self.code(a + 5)
        return self.code(a)


def main(argv):
    p = Printer()
    mode, where = argv[1], argv[2]
    a = p.sym.lookup(where)
    if mode == "code":
        print(p.code(a, int(argv[3]) if len(argv) > 3 else 40))
    elif mode == "func":
        print(p.func(a))
    elif mode == "rpl":
        print(p.rpl(a))
    else:
        print(p.auto(a))


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8")
    main(sys.argv)
