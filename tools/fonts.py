"""Extract the HP48GX rev R system fonts.

Glyph addressing comes from the string renderer SUB_11F28 (#11F28):
  * XM=1: glyph = #7A047 + 20*code  (10 rows, one byte per row)
  * XM=0: glyph = #7B257 + 16*code  (8 rows, one byte per row)
Codes below #20 use the placeholder glyph at #7AC9F / #7BC37.
Each row byte is stored low nibble first; bit 0 is the leftmost pixel.

The minifont (menu labels, status line) is drawn by #7A1FA:
  * glyph = #7C102 + 11*index: one nibble of advance width, then 5 rows of
    one byte each
  * codes above #9F are first remapped through the byte table at #7C793;
    then index = code for #20-#60, code-#20 for a-z (lowercase is shown as
    uppercase) and code-#1A from #7B (see mini_index); codes below #20 use
    the placeholder at #7C6AE.

Usage: python fonts.py [--png DIR] [--ascii FONT]
"""
import sys
import zlib
import struct
from pathlib import Path

from rom import Rom

FONTS = {
    # name: (base, rows, first_code)
    "font10": (0x7A047, 10, 0x20),
    "font8": (0x7B257, 8, 0x20),
}


MINI_BASE = 0x7C102
MINI_REMAP = 0x7C793
MINI_CTRL = 0x7C6AE


def mini_index(rom, code):
    """Glyph index for the minifont, following #7A214-#7A292."""
    if code > 0x9F:
        code = rom.byte(MINI_REMAP + 2 * (code - 0x9F))
    if code < 0x61:
        return code
    if code < 0x7B:
        return code - 0x20
    return code - 0x1A


def mini_glyph(rom, code):
    """(advance width, [5 row bytes]) for a minifont character >= #20."""
    a = MINI_BASE + 11 * mini_index(rom, code)
    return rom.n[a], [rom.byte(a + 1 + 2 * r) for r in range(5)]


def glyph(rom, base, rows, code):
    a = base + 2 * rows * code
    return [rom.byte(a + 2 * r) for r in range(rows)]


def glyphs(rom, name):
    base, rows, first = FONTS[name]
    return {c: glyph(rom, base, rows, c) for c in range(first, 256)}


def ascii_art(g, width=8):
    return ["".join("#" if (row >> x) & 1 else "." for x in range(width)) for row in g]


def write_png(path, pixels, w, h):
    """Minimal grayscale PNG writer (pixels: list of rows of 0/1)."""
    raw = b"".join(b"\x00" + bytes(0 if p else 255 for p in row) for row in pixels)
    def chunk(t, d):
        return struct.pack(">I", len(d)) + t + d + struct.pack(">I", zlib.crc32(t + d) & 0xFFFFFFFF)
    png = b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 0, 0, 0, 0))
    png += chunk(b"IDAT", zlib.compress(raw)) + chunk(b"IEND", b"")
    Path(path).write_bytes(png)


def sheet(rom, name, scale=4):
    """16x14 grid of glyphs #20-#FF, each cell 9 px wide, rows+2 tall."""
    base, rows, first = FONTS[name]
    cw, ch = 9, rows + 2
    W, H = 16 * cw, 14 * ch
    img = [[0] * W for _ in range(H)]
    for code in range(first, 256):
        g = glyph(rom, base, rows, code)
        gx, gy = (code % 16) * cw, (code // 16 - 2) * ch
        for y, row in enumerate(g):
            for x in range(8):
                if (row >> x) & 1:
                    img[gy + 1 + y][gx + x] = 1
    big = [[p for p in row for _ in range(scale)] for row in img for _ in range(scale)]
    return big, W * scale, H * scale


def mini_sheet(rom, scale=4):
    cw, ch = 9, 7
    W, H = 16 * cw, 14 * ch
    img = [[0] * W for _ in range(H)]
    for code in range(0x20, 256):
        w, g = mini_glyph(rom, code)
        gx, gy = (code % 16) * cw, (code // 16 - 2) * ch
        for y, row in enumerate(g):
            for x in range(8):
                if (row >> x) & 1:
                    img[gy + 1 + y][gx + x] = 1
    big = [[p for p in row for _ in range(scale)] for row in img for _ in range(scale)]
    return big, W * scale, H * scale


def main(argv):
    rom = Rom()
    if "--png" in argv:
        out = Path(argv[argv.index("--png") + 1])
        out.mkdir(parents=True, exist_ok=True)
        px, w, h = mini_sheet(rom)
        write_png(out / "mini.png", px, w, h)
        for name in FONTS:
            px, w, h = sheet(rom, name)
            write_png(out / ("%s.png" % name), px, w, h)
            print("wrote", out / ("%s.png" % name))
    if "--ascii" in argv:
        name = argv[argv.index("--ascii") + 1]
        for code, g in glyphs(rom, name).items():
            if 0x21 <= code < 0x7F:
                print("%02X %r" % (code, chr(code)))
                print("\n".join(ascii_art(g)))


if __name__ == "__main__":
    main(sys.argv)
