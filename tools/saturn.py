"""Saturn (1LT8) instruction decoder.

Encodings follow docs/cpu.txt section 5.3.2. Mnemonics follow HP SASM
conventions (as used in the 48 SDK), e.g. "A=DAT0 A", "GOSBVL #0679B",
"?C=0 A / GOYES".

decode(mem, pc) returns an Insn; `mem` is anything indexable by nibble
address (the bytes returned by rom.load()).
"""
from dataclasses import dataclass

FIELDS = ["P", "WP", "XS", "X", "S", "M", "B", "W"]
REG = "ABCD"

# Flow kinds
NEXT = "next"          # falls through only
JUMP = "jump"          # unconditional jump to target
CALL = "call"          # subroutine call to target, then falls through
RET = "ret"            # unconditional return
CJUMP = "cjump"        # conditional jump to target or fall through
CRET = "cret"          # conditional return or fall through
IJUMP = "ijump"        # indirect/computed jump (target unknown)
STOP = "stop"          # invalid opcode / data


@dataclass
class Insn:
    addr: int
    size: int
    text: str
    flow: str = NEXT
    target: int | None = None
    # Address constant loaded by the insn (LC/LA/D0=/D1=), useful for xrefs.
    const: int | None = None


def _field(f):
    """Field code used by 0E, 818, 819, 81A: F = A, otherwise the low three
    bits select P..W (cpu.txt marks bit 3 as don't-care for X000-X110)."""
    if f == 0xF:
        return "A"
    return FIELDS[f & 7]


def _signed(v, bits):
    return v - (1 << bits) if v & (1 << (bits - 1)) else v


class Decoder:
    def __init__(self, mem):
        self.m = mem
        self.size = len(mem)

    def n(self, a):
        return self.m[a & 0xFFFFF] if (a & 0xFFFFF) < self.size else 0

    def val(self, a, count):
        v = 0
        for i in reversed(range(count)):
            v = (v << 4) | self.n(a + i)
        return v

    def hexdigits(self, a, count):
        """Nibbles at a..a+count-1 written most significant first."""
        return "".join("%X" % self.n(a + i) for i in reversed(range(count)))

    # ------------------------------------------------------------------
    def decode(self, pc):
        n = self.n
        o0 = n(pc)
        handler = getattr(self, "_op%X" % o0)
        ins = handler(pc)
        if ins is None:
            return Insn(pc, 1, "?? %X" % o0, STOP)
        return ins

    # ---- test helpers: tests are followed by a 2-nibble GOYES/RTNYES
    def _test(self, pc, size_before, text):
        off_addr = pc + size_before
        off = self.val(off_addr, 2)
        size = size_before + 2
        if off == 0:
            return Insn(pc, size, text + "\n\tRTNYES", CRET)
        tgt = (off_addr + _signed(off, 8)) & 0xFFFFF
        return Insn(pc, size, text + "\n\tGOYES #%05X" % tgt, CJUMP, tgt)

    # 0x: misc
    def _op0(self, pc):
        o1 = self.n(pc + 1)
        simple = {
            0x0: ("RTNSXM", RET), 0x1: ("RTN", RET), 0x2: ("RTNSC", RET),
            0x3: ("RTNCC", RET), 0x4: ("SETHEX", NEXT), 0x5: ("SETDEC", NEXT),
            0x6: ("RSTK=C", NEXT), 0x7: ("C=RSTK", NEXT), 0x8: ("CLRST", NEXT),
            0x9: ("C=ST", NEXT), 0xA: ("ST=C", NEXT), 0xB: ("CSTEX", NEXT),
            0xC: ("P=P+1", NEXT), 0xD: ("P=P-1", NEXT), 0xF: ("RTI", RET),
        }
        if o1 in simple:
            t, fl = simple[o1]
            return Insn(pc, 2, t, fl)
        # 0Eft logical
        f = _field(self.n(pc + 2))
        t = self.n(pc + 3)
        if f is None:
            return None
        ops = ["A=A&B", "B=B&C", "C=C&A", "D=D&C", "B=B&A", "C=C&B", "A=A&C", "C=C&D"]
        op = ops[t & 7]
        if t & 8:
            op = op.replace("&", "!")
        return Insn(pc, 4, "%s %s" % (op, f))

    # 1x: scratch registers, D0/D1
    def _op1(self, pc):
        n = self.n
        o1 = n(pc + 1)
        if o1 <= 2:
            s = n(pc + 2)
            r = "C" if s & 8 else "A"
            rn = "R%d" % ((s & 7) if (s & 7) < 5 else (s & 7) - 4)
            t = ["%s=%s" % (rn, r), "%s=%s" % (r, rn), "%s%sEX" % (r, rn)][o1]
            return Insn(pc, 3, t)
        if o1 == 3:
            t = n(pc + 2)
            ops = ["D0=A", "D1=A", "AD0EX", "AD1EX", "D0=C", "D1=C", "CD0EX", "CD1EX",
                   "D0=AS", "D1=AS", "AD0XS", "AD1XS", "D0=CS", "D1=CS", "CD0XS", "CD1XS"]
            return Insn(pc, 3, ops[t])
        if o1 == 4:
            t = n(pc + 2)
            ops = ["DAT0=A", "DAT1=A", "A=DAT0", "A=DAT1",
                   "DAT0=C", "DAT1=C", "C=DAT0", "C=DAT1"]
            return Insn(pc, 3, "%s %s" % (ops[t & 7], "B" if t & 8 else "A"))
        if o1 == 5:
            t = n(pc + 2)
            x = n(pc + 3)
            ops = ["DAT0=A", "DAT1=A", "A=DAT0", "A=DAT1",
                   "DAT0=C", "DAT1=C", "C=DAT0", "C=DAT1"]
            if t & 8:
                return Insn(pc, 4, "%s %d" % (ops[t & 7], x + 1))
            # bit 3 of the field nibble is don't-care (cpu.txt 15tn)
            return Insn(pc, 4, "%s %s" % (ops[t & 7], FIELDS[x & 7]))
        if o1 in (6, 7, 8, 0xC):
            d = {6: "D0=D0+", 7: "D1=D1+", 8: "D0=D0-", 0xC: "D1=D1-"}[o1]
            return Insn(pc, 3, "%s %d" % (d, n(pc + 2) + 1))
        # 19/1A/1B D0=, 1D/1E/1F D1=
        reg = "D0" if o1 in (9, 0xA, 0xB) else "D1"
        cnt = {9: 2, 0xA: 4, 0xB: 5, 0xD: 2, 0xE: 4, 0xF: 5}[o1]
        v = self.val(pc + 2, cnt)
        txt = "%s=(%d)\t#%s" % (reg, cnt, self.hexdigits(pc + 2, cnt))
        return Insn(pc, 2 + cnt, txt, const=v if cnt == 5 else None)

    def _op2(self, pc):
        return Insn(pc, 2, "P=\t%d" % self.n(pc + 1))

    def _op3(self, pc):
        cnt = self.n(pc + 1) + 1
        v = self.val(pc + 2, cnt)
        txt = "LC(%d)\t#%s" % (cnt, self.hexdigits(pc + 2, cnt))
        return Insn(pc, 2 + cnt, txt, const=v if cnt == 5 else None)

    def _branch(self, pc, name, retname, carry):
        off = self.val(pc + 1, 2)
        if off == 0:
            return Insn(pc, 3, retname, CRET)
        if carry and off == 2:
            return Insn(pc, 3, "NOP3")
        tgt = (pc + 1 + _signed(off, 8)) & 0xFFFFF
        return Insn(pc, 3, "%s\t#%05X" % (name, tgt), CJUMP, tgt)

    def _op4(self, pc):
        return self._branch(pc, "GOC", "RTNC", True)

    def _op5(self, pc):
        return self._branch(pc, "GONC", "RTNNC", False)

    def _op6(self, pc):
        off = self.val(pc + 1, 3)
        if off == 3:
            return Insn(pc, 4, "NOP4")
        if off == 4:
            return Insn(pc, 5, "NOP5")
        tgt = (pc + 1 + _signed(off, 12)) & 0xFFFFF
        return Insn(pc, 4, "GOTO\t#%05X" % tgt, JUMP, tgt)

    def _op7(self, pc):
        off = self.val(pc + 1, 3)
        tgt = (pc + 4 + _signed(off, 12)) & 0xFFFFF
        return Insn(pc, 4, "GOSUB\t#%05X" % tgt, CALL, tgt)

    # 8x: extended
    def _op8(self, pc):
        n = self.n
        o1 = n(pc + 1)
        if o1 == 0:
            return self._op80(pc)
        if o1 == 1:
            return self._op81(pc)
        if o1 == 2:
            m = n(pc + 2)
            names = {1: "XM=0", 2: "SB=0", 4: "SR=0", 8: "MP=0", 0xF: "CLRHST"}
            return Insn(pc, 3, names.get(m, "HST=0\t%d" % m))
        if o1 == 3:
            m = n(pc + 2)
            names = {1: "?XM=0", 2: "?SB=0", 4: "?SR=0", 8: "?MP=0"}
            return self._test(pc, 3, names.get(m, "?HST=0\t%d" % m))
        if o1 in (4, 5):
            return Insn(pc, 3, "ST=%d\t%d" % (o1 - 4, n(pc + 2)))
        if o1 in (6, 7):
            return self._test(pc, 3, "?ST=%d\t%d" % (o1 - 6, n(pc + 2)))
        if o1 == 8:
            return self._test(pc, 3, "?P#\t%d" % n(pc + 2))
        if o1 == 9:
            return self._test(pc, 3, "?P=\t%d" % n(pc + 2))
        if o1 in (0xA, 0xB):
            t = n(pc + 2)
            grp = (["?A=B", "?B=C", "?C=A", "?D=C", "?A#B", "?B#C", "?C#A", "?D#C",
                    "?A=0", "?B=0", "?C=0", "?D=0", "?A#0", "?B#0", "?C#0", "?D#0"]
                   if o1 == 0xA else
                   ["?A>B", "?B>C", "?C>A", "?D>C", "?A<B", "?B<C", "?C<A", "?D<C",
                    "?A>=B", "?B>=C", "?C>=A", "?D>=C", "?A<=B", "?B<=C", "?C<=A", "?D<=C"])
            return self._test(pc, 3, "%s A" % grp[t])
        if o1 == 0xC:
            off = self.val(pc + 2, 4)
            tgt = (pc + 2 + _signed(off, 16)) & 0xFFFFF
            return Insn(pc, 6, "GOLONG\t#%05X" % tgt, JUMP, tgt)
        if o1 == 0xD:
            tgt = self.val(pc + 2, 5)
            return Insn(pc, 7, "GOVLNG\t#%05X" % tgt, JUMP, tgt)
        if o1 == 0xE:
            off = self.val(pc + 2, 4)
            tgt = (pc + 6 + _signed(off, 16)) & 0xFFFFF
            return Insn(pc, 6, "GOSUBL\t#%05X" % tgt, CALL, tgt)
        tgt = self.val(pc + 2, 5)
        return Insn(pc, 7, "GOSBVL\t#%05X" % tgt, CALL, tgt)

    def _op80(self, pc):
        n = self.n
        o2 = n(pc + 2)
        simple = {0: "OUT=CS", 1: "OUT=C", 2: "A=IN", 3: "C=IN", 4: "UNCNFG",
                  5: "CONFIG", 6: "C=ID", 7: "SHUTDN", 9: "C+P+1", 0xA: "RESET",
                  0xB: "BUSCC", 0xE: "SREQ?"}
        if o2 in simple:
            return Insn(pc, 3, simple[o2])
        if o2 == 0xC:
            return Insn(pc, 4, "C=P\t%d" % n(pc + 3))
        if o2 == 0xD:
            return Insn(pc, 4, "P=C\t%d" % n(pc + 3))
        if o2 == 0xF:
            return Insn(pc, 4, "CPEX\t%d" % n(pc + 3))
        # 808x
        o3 = n(pc + 3)
        if o3 == 0:
            return Insn(pc, 4, "INTON")
        if o3 == 1:
            if n(pc + 4) == 0:
                return Insn(pc, 5, "RSI")
            return None
        if o3 == 2:
            cnt = n(pc + 4) + 1
            v = self.val(pc + 5, cnt)
            return Insn(pc, 5 + cnt, "LA(%d)\t#%s" % (cnt, self.hexdigits(pc + 5, cnt)),
                        const=v if cnt == 5 else None)
        if o3 == 3:
            return Insn(pc, 4, "BUSCB")
        if o3 in (4, 5):
            return Insn(pc, 5, "ABIT=%d\t%d" % (o3 - 4, n(pc + 4)))
        if o3 in (6, 7):
            return self._test(pc, 5, "?ABIT=%d\t%d" % (o3 - 6, n(pc + 4)))
        if o3 in (8, 9):
            return Insn(pc, 5, "CBIT=%d\t%d" % (o3 - 8, n(pc + 4)))
        if o3 in (0xA, 0xB):
            return self._test(pc, 5, "?CBIT=%d\t%d" % (o3 - 0xA, n(pc + 4)))
        if o3 == 0xC:
            return Insn(pc, 4, "PC=(A)", IJUMP)
        if o3 == 0xD:
            return Insn(pc, 4, "BUSCD")
        if o3 == 0xE:
            return Insn(pc, 4, "PC=(C)", IJUMP)
        return Insn(pc, 4, "INTOFF")

    def _op81(self, pc):
        n = self.n
        o2 = n(pc + 2)
        if o2 < 8:
            return Insn(pc, 3, "%sS%s" % (REG[o2 & 3], "LC" if o2 < 4 else "RC"))
        if o2 >= 0xC:
            return Insn(pc, 3, "%sSRB" % REG[o2 & 3])
        if o2 == 8:
            f = _field(n(pc + 3))
            r = n(pc + 4)
            c = n(pc + 5) + 1
            if f is None:
                return None
            return Insn(pc, 6, "%s=%s%sCON\t%s,%d" % (REG[r & 3], REG[r & 3],
                                                       "-" if r & 8 else "+", f, c))
        if o2 == 9:
            f = _field(n(pc + 3))
            if f is None:
                return None
            return Insn(pc, 5, "%sSRB.F\t%s" % (REG[n(pc + 4) & 3], f))
        if o2 == 0xA:
            f = _field(n(pc + 3))
            op = n(pc + 4)
            s = n(pc + 5)
            if f is None or op > 2:
                return None
            r = "C" if s & 8 else "A"
            rn = "R%d" % ((s & 7) if (s & 7) < 5 else (s & 7) - 4)
            t = ["%s=%s.F" % (rn, r), "%s=%s.F" % (r, rn), "%s%sEX.F" % (r, rn)][op]
            return Insn(pc, 6, "%s\t%s" % (t, f))
        # 81B
        o3 = n(pc + 3)
        tbl = {2: ("PC=A", IJUMP), 3: ("PC=C", IJUMP), 4: ("A=PC", NEXT),
               5: ("C=PC", NEXT), 6: ("APCEX", IJUMP), 7: ("CPCEX", IJUMP)}
        if o3 in tbl:
            t, fl = tbl[o3]
            return Insn(pc, 4, t, fl)
        return None

    # 9x: field tests
    def _op9(self, pc):
        f = self.n(pc + 1)
        t = self.n(pc + 2)
        grp = (["?A=B", "?B=C", "?C=A", "?D=C", "?A#B", "?B#C", "?C#A", "?D#C",
                "?A=0", "?B=0", "?C=0", "?D=0", "?A#0", "?B#0", "?C#0", "?D#0"]
               if f < 8 else
               ["?A>B", "?B>C", "?C>A", "?D>C", "?A<B", "?B<C", "?C<A", "?D<C",
                "?A>=B", "?B>=C", "?C>=A", "?D>=C", "?A<=B", "?B<=C", "?C<=A", "?D<=C"])
        return self._test(pc, 3, "%s %s" % (grp[t], FIELDS[f & 7]))

    GROUP_C = ["A=A+B", "B=B+C", "C=C+A", "D=D+C", "A=A+A", "B=B+B", "C=C+C", "D=D+D",
               "B=B+A", "C=C+B", "A=A+C", "C=C+D", "A=A-1", "B=B-1", "C=C-1", "D=D-1"]
    GROUP_D = ["A=0", "B=0", "C=0", "D=0", "A=B", "B=C", "C=A", "D=C",
               "B=A", "C=B", "A=C", "C=D", "ABEX", "BCEX", "CAEX", "DCEX"]
    GROUP_E = ["A=A-B", "B=B-C", "C=C-A", "D=D-C", "A=A+1", "B=B+1", "C=C+1", "D=D+1",
               "B=B-A", "C=C-B", "A=A-C", "C=C-D", "A=B-A", "B=C-B", "C=A-C", "D=C-D"]
    GROUP_F = ["ASL", "BSL", "CSL", "DSL", "ASR", "BSR", "CSR", "DSR",
               "A=-A", "B=-B", "C=-C", "D=-D", "A=-A-1", "B=-B-1", "C=-C-1", "D=-D-1"]

    def _opA(self, pc):
        f = self.n(pc + 1)
        t = self.n(pc + 2)
        grp = self.GROUP_D if f & 8 else self.GROUP_C
        return Insn(pc, 3, "%s %s" % (grp[t], FIELDS[f & 7]))

    def _opB(self, pc):
        f = self.n(pc + 1)
        t = self.n(pc + 2)
        grp = self.GROUP_F if f & 8 else self.GROUP_E
        return Insn(pc, 3, "%s %s" % (grp[t], FIELDS[f & 7]))

    def _opC(self, pc):
        return Insn(pc, 2, "%s A" % self.GROUP_C[self.n(pc + 1)])

    def _opD(self, pc):
        return Insn(pc, 2, "%s A" % self.GROUP_D[self.n(pc + 1)])

    def _opE(self, pc):
        return Insn(pc, 2, "%s A" % self.GROUP_E[self.n(pc + 1)])

    def _opF(self, pc):
        return Insn(pc, 2, "%s A" % self.GROUP_F[self.n(pc + 1)])
