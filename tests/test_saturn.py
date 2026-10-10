"""Decoder tests against encodings from docs/cpu.txt section 5.3.2 and
known ROM rev R code. Run: python -m unittest discover -s tests"""
import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools"))

from saturn import Decoder  # noqa: E402


def dec(hexstr, pc=0x10000):
    mem = bytearray(0x100000)
    for i, ch in enumerate(hexstr):
        mem[pc + i] = int(ch, 16)
    return Decoder(bytes(mem)).decode(pc)


class Encodings(unittest.TestCase):
    def check(self, hexstr, text, size=None):
        i = dec(hexstr)
        self.assertEqual(" ".join(i.text.split()), text, hexstr)
        self.assertEqual(i.size, size if size is not None else len(hexstr), hexstr)

    def test_group0(self):
        self.check("01", "RTN")
        self.check("03", "RTNCC")
        self.check("06", "RSTK=C")
        self.check("0E00", "A=A&B P")
        self.check("0E06", "A=A&C P")
        self.check("0EF8", "A=A!B A")
        self.check("0E77", "C=C&D W")
        self.check("0F", "RTI")

    def test_group1(self):
        self.check("100", "R0=A")
        self.check("10C", "R4=C")
        self.check("115", "A=R1")     # 5-7 alias R1-R3
        self.check("12A", "CR2EX")
        self.check("134", "D0=C")
        self.check("13E", "CD0XS")
        self.check("142", "A=DAT0 A")
        self.check("14D", "DAT1=C B")
        self.check("1553", "DAT1=C X")
        self.check("1573", "C=DAT1 X")
        self.check("155B", "DAT1=C X")  # bit 3 of n is don't-care
        self.check("15E4", "C=DAT0 5")
        self.check("164", "D0=D0+ 5")
        self.check("1C4", "D1=D1- 5")
        self.check("1B3A908", "D0=(5) #809A3")
        self.check("1E0000", "D1=(4) #0000")

    def test_load_constants(self):
        self.check("3400100", "LC(5) #00100")
        self.check("31F3", "LC(2) #3F")
        self.check("80824ABCDE", "LA(5) #EDCBA")

    def test_relative_branches(self):
        # GOC: offset relative to the offset field (pc+1)
        i = dec("4F0")
        self.assertEqual(i.target, 0x10001 + 0x0F)
        self.check("400", "RTNC")
        self.check("420", "NOP3")
        self.check("500", "RTNNC")
        # GOTO: relative to pc+1; GOSUB: relative to pc+4
        self.assertEqual(dec("6FFF").target, 0x10000)
        self.assertEqual(dec("7000").target, 0x10004)
        self.check("6300", "NOP4")
        self.check("64000", "NOP5")
        # GOLONG relative to pc+2, GOSUBL relative to pc+6
        self.assertEqual(dec("8C0000").target, 0x10002)
        self.assertEqual(dec("8E0000").target, 0x10006)
        self.check("8D6CF10", "GOVLNG #01FC6")
        self.check("8FC5760", "GOSBVL #0675C")

    def test_tests(self):
        i = dec("8A600")
        self.assertEqual(i.flow, "cret")
        self.assertEqual(" ".join(i.text.split()), "?C#A A RTNYES")
        i = dec("9B200")
        self.assertEqual(" ".join(i.text.split()), "?C>A X RTNYES")
        i = dec("86F80")    # ?ST=0 15, GOYES relative to pc+3
        self.assertEqual(i.target, 0x10003 + 0x08)
        i = dec("8087883")  # ?ABIT=1 8, GOYES relative to pc+5
        self.assertEqual(i.target, 0x10005 + 0x38)

    def test_group8(self):
        self.check("805", "CONFIG")
        self.check("804", "UNCNFG")
        self.check("80A", "RESET")
        self.check("8080", "INTON")
        self.check("808F", "INTOFF")
        self.check("80810", "RSI")
        self.check("808C", "PC=(A)")
        self.check("80CF", "C=P 15")
        self.check("80DF", "P=C 15")
        self.check("81AF08", "R0=C.F A")
        self.check("81AF19", "C=R1.F A")
        self.check("818F24", "C=C+CON A,5")
        self.check("818FA4", "C=C-CON A,5")
        self.check("81B4", "A=PC")
        self.check("81C", "ASRB")
        self.check("828", "MP=0")
        self.check("85E", "ST=1 14")

    def test_arith(self):
        self.check("A07", "D=D+D P")
        self.check("AF0", "A=0 W")
        self.check("AB7", "D=C X")
        self.check("A3F", "D=D-1 X")
        self.check("B06", "C=C+1 P")
        self.check("B8E", "C=-C-1 P")
        self.check("BF6", "CSR W")
        self.check("CF", "D=D-1 A")
        self.check("DA", "A=C A")
        self.check("E6", "C=C+1 A")
        self.check("F8", "A=-A A")


if __name__ == "__main__":
    unittest.main()
