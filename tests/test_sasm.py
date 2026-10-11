"""Assembler tests (tools/sasm.py), and the full round trip ROM -> source
-> ROM (skipped when ROM/gxrom-r is missing).
Run: python -m unittest discover -s tests"""
import random
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

import sasm  # noqa: E402
from saturn import Decoder  # noqa: E402


def decode(nibs, pc=0):
    mem = bytearray(0x100000)
    mem[pc:pc + len(nibs)] = bytes(nibs)
    return Decoder(bytes(mem)).decode(pc)


def assemble_insn(text, pc=0):
    asm = sasm.Assembler()
    out = []
    for line in text.split("\n"):
        out += asm.encode(sasm.split_line(line), pc + len(out), {"mode": "ASM", "code": []})
    return out


class Instructions(unittest.TestCase):
    def test_random_round_trip(self):
        """decode -> text -> assemble -> decode gives the same text."""
        rng = random.Random(48)
        for _ in range(20000):
            nibs = [rng.randrange(16) for _ in range(21)]
            pc = 0x40000
            ins = decode(nibs, pc)
            if ins.flow == "stop":
                continue
            # Some texts have two encodings (DAT0=A B is 148 or 1506); the
            # assembler picks the short one, so only the text must agree.
            again = assemble_insn(ins.text, pc)
            self.assertEqual(decode(again, pc).text, ins.text)

    def test_branches(self):
        self.assertEqual(assemble_insn("GOTO #10010", 0x10000), [6, 0xF, 0, 0])
        self.assertEqual(assemble_insn("GOSBVL #0679B"), [8, 0xF, 0xB, 9, 7, 6, 0])
        self.assertEqual(assemble_insn("?A=0 A\nGOYES #00010", 0x0), [8, 0xA, 8, 0xD, 0])
        self.assertEqual(assemble_insn("?A=0 A\nRTNYES"), [8, 0xA, 8, 0, 0])
        with self.assertRaises(sasm.AsmError):
            assemble_insn("GOC #10200", 0x10000)

    def test_constants(self):
        self.assertEqual(assemble_insn("LC(5) #0312B"), [3, 4, 0xB, 2, 1, 3, 0])
        self.assertEqual(assemble_insn("D0=(5) #80711"), [1, 0xB, 1, 1, 7, 0, 8])
        self.assertEqual(assemble_insn("A=A+CON A,4"), [8, 1, 8, 0xF, 0, 3])


class Values(unittest.TestCase):
    def test_expressions(self):
        a = sasm.Assembler()
        a.symbols.update({"x+": 10, "L": 100, "a-b": 7})
        for expr, v in [("x+", 10), ("x++3", 13), ("L-2", 98), ("(*)-L", 900), ("a-b-1", 6),
                        ("#10+L-x+", 106)]:
            self.assertEqual(a.value(expr, 1000), v, expr)

    def test_reals(self):
        for text in ["0E0", "1E0", "-1.5E-3", "3.14159265359E0", "9.99999999999E499", "1E-499"]:
            nibs = sasm.encode_real(text, 3, 12)
            self.assertEqual(sasm.format_real(nibs, 3, 12), text)
        self.assertEqual(sasm.encode_real("1E1", 3, 12), [1, 0, 0] + [0] * 11 + [1, 0])
        self.assertIsNone(sasm.format_real([0xA] + [0] * 15, 3, 12))

    def test_strings(self):
        bs = list(range(256))
        self.assertEqual(sasm.unescape(sasm.escape(bs)[1:-1]), bs)
        self.assertEqual(sasm.escape([0x8D, 0x41, 0x22]), '"→A\\""')


class Images(unittest.TestCase):
    def test_grob_png_round_trip(self):
        rng = random.Random(1)
        w, h = 13, 5
        rows = [[rng.randrange(2) for _ in range(w)] for _ in range(h)]
        nibs = sasm.grob_nibs(rows, w)
        self.assertEqual(sasm.grob_png_rows(h, w, nibs), rows)
        with tempfile.TemporaryDirectory() as d:
            sasm.png_write(Path(d) / "g.png", rows)
            self.assertEqual(sasm.png_read(Path(d) / "g.png"), rows)

    def test_glyph_sheet(self):
        glyphs = [[(i * 7 + y) & 0xFF for y in range(8)] for i in range(40)]
        img = sasm.glyph_sheet(glyphs, 8)
        self.assertEqual(sasm.sheet_glyphs(img, 8, 40), glyphs)


class Source(unittest.TestCase):
    def test_mixed_source(self):
        src = "\n".join([
            "* a comment",
            "        ORG     #00010",
            "start:  CON(5)  DOCOL                * a pointer",
            "DOCOL   EQU     #02D9D",
            "        RPL",
            "        ::",
            "          # 3F",
            "          $ \"Hi\"",
            "          PTR start",
            "          CODE",
            "loop:       A=A+1   A",
            "            GOTO    loop",
            "          ENDCODE",
            "        ;",
        ])
        with tempfile.TemporaryDirectory() as d:
            f = Path(d) / "t.s"
            f.write_text(src, encoding="utf-8")
            asm = sasm.Assembler().run(f)
        got = list(asm.mem[0x10:0x10 + 5])
        self.assertEqual(got, [0xD, 9, 0xD, 2, 0])
        p = 0x15
        expect = ([0xD, 9, 0xD, 2, 0] + [1, 1, 9, 2, 0, 0xF, 3, 0, 0, 0]
                  + [0xC, 2, 0xA, 2, 0, 9, 0, 0, 0, 0, 8, 4, 9, 6]
                  + [0, 1, 0, 0, 0]
                  + [0xC, 0xC, 0xD, 2, 0, 0xB, 0, 0, 0, 0, 0xE, 4, 6, 0xD, 0xF, 0xF]
                  + [0xB, 2, 1, 3, 0])
        self.assertEqual(list(asm.mem[p:p + len(expect)]), expect)

    def assemble(self, *lines):
        with tempfile.TemporaryDirectory() as d:
            f = Path(d) / "t.s"
            f.write_text("\n".join(lines), encoding="utf-8")
            return sasm.Assembler().run(f)

    def test_fillto_gives_way(self):
        """FILLTO pads up to its address, or, once the code has passed it,
        writes nothing and lets what follows move."""
        asm = self.assemble("        NIBHEX  123", "        FILLTO  #00008", "a:      NIBHEX  4")
        self.assertEqual(asm.symbols["a"], 8)
        self.assertEqual(asm.notes, [])
        asm = self.assemble("        NIBHEX  1234567890", "        FILLTO  #00008", "a:      NIBHEX  4")
        self.assertEqual(asm.symbols["a"], 10)
        self.assertEqual(len(asm.notes), 1)

    def test_input_register_at_even_address(self):
        self.assemble("        NIBHEX  12", "        C=IN")
        with self.assertRaises(sasm.AsmError):
            self.assemble("        NIBHEX  1", "        A=IN")

    def test_crc_word(self):
        """The CRC word makes each half of the ROM read as #FFFF by the
        self-test, whatever else is there."""
        asm = self.assemble("        NIBHEX  0123456789", "        ORG     #40020", "        NIBHEX  F00D",
                            "        ORG     #7FFFC", "        CRC", "        ORG     #C0000", "        NIBHEX  77",
                            "        ORG     #FFFF0", "        CRC")
        for half in (0, 0x80000):
            c = 0
            for a in sasm.crc_order(half):
                c = sasm.crc_step(c, asm.mem[a])
            self.assertEqual(c, 0xFFFF)


@unittest.skipUnless((ROOT / "ROM" / "gxrom-r").exists(), "needs ROM/gxrom-r")
class RomRoundTrip(unittest.TestCase):
    def test_source_reassembles_to_the_rom(self):
        import analyze
        import disasm
        an = analyze.Analyzer()
        an.analyze()
        an.save()
        self.assertEqual(disasm.Generator().run(check=True), 0)

    def test_crc_words_match_the_rom(self):
        from rom import Rom
        mem = bytearray(Rom().n)
        for a in (0x7FFFC, 0xFFFFC):
            self.assertEqual(sasm.crc_fix(mem, a), list(mem[a:a + 4]))


if __name__ == "__main__":
    unittest.main()
