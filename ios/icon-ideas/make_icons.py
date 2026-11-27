"""Example app icons for the iOS app: SVG designs rendered to 1024x1024 PNG.

    python3 ios/icon-ideas/make_icons.py

Writes NAME.svg and NAME.png for each design, and preview.png (all of them
at App Store, home screen and Settings sizes). The PNGs are opaque, as App
Store Connect requires. Rendering uses macOS Quick Look (qlmanage), so this
runs on a Mac with nothing to install.

The colours are the app's own (crates/hp48-app/src/lib.rs). LCD text is drawn
in a 5x7 dot-matrix font defined here, so it needs no installed font.
"""

import os
import struct
import subprocess
import sys
import tempfile
import zlib

HERE = os.path.dirname(os.path.abspath(__file__))
SIZE = 1024

BODY = "#2A2B30"
BEZEL = "#1B1C20"
KEY = "#464850"
KEY_NUM = "#5A5C66"
LEFT = "#B086D6"
RIGHT = "#63C29A"
ALPHA = "#E8C24A"
LEGEND = "#F2F2F2"
LCD = "#BCC6A9"
INK = "#1E241C"

# 5x7 dot-matrix glyphs, rows top to bottom.
FONT = {
    "0": ["01110", "10001", "10011", "10101", "11001", "10001", "01110"],
    "1": ["00100", "01100", "00100", "00100", "00100", "00100", "01110"],
    "2": ["01110", "10001", "00001", "00010", "00100", "01000", "11111"],
    "3": ["11111", "00010", "00100", "00010", "00001", "10001", "01110"],
    "4": ["00010", "00110", "01010", "10010", "11111", "00010", "00010"],
    "5": ["11111", "10000", "11110", "00001", "00001", "10001", "01110"],
    "6": ["00110", "01000", "10000", "11110", "10001", "10001", "01110"],
    "7": ["11111", "00001", "00010", "00100", "01000", "01000", "01000"],
    "8": ["01110", "10001", "10001", "01110", "10001", "10001", "01110"],
    "9": ["01110", "10001", "10001", "01111", "00001", "00010", "01100"],
    ":": ["00000", "01100", "01100", "00000", "01100", "01100", "00000"],
    ".": ["00000", "00000", "00000", "00000", "00000", "01100", "01100"],
    "π": ["00000", "11111", "01010", "01010", "01010", "01010", "10011"],
    "X": ["10001", "10001", "01010", "00100", "01010", "10001", "10001"],
    "'": ["00100", "00100", "01000", "00000", "00000", "00000", "00000"],
    "^": ["00100", "01010", "10001", "00000", "00000", "00000", "00000"],
    "+": ["00000", "00100", "00100", "11111", "00100", "00100", "00000"],
    " ": ["00000"] * 7,
}


def dots(text, x, y, pitch, ink, round_dots=False, gap=0.12):
    """Text in the dot-matrix font: the top left of the first glyph at
    (x, y), `pitch` from one dot to the next."""
    out = []
    size = pitch * (1 - gap)
    for i, ch in enumerate(text):
        glyph = FONT[ch]
        gx = x + i * 6 * pitch
        for r, row in enumerate(glyph):
            for c, bit in enumerate(row):
                if bit == "1":
                    px, py = gx + c * pitch, y + r * pitch
                    if round_dots:
                        out.append(f'<circle cx="{px + pitch / 2:.1f}" cy="{py + pitch / 2:.1f}" r="{size / 2:.1f}" fill="{ink}"/>')
                    else:
                        out.append(f'<rect x="{px:.1f}" y="{py:.1f}" width="{size:.1f}" height="{size:.1f}" rx="{size * 0.18:.1f}" fill="{ink}"/>')
    return "".join(out)


def text_width(text, pitch):
    return (len(text) * 6 - 1) * pitch


def svg(body, defs=""):
    return (
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{SIZE}" height="{SIZE}" viewBox="0 0 {SIZE} {SIZE}">'
        f"<defs>{defs}</defs>{body}</svg>"
    )


BODY_GRADIENT = (
    '<linearGradient id="body" x1="0" y1="0" x2="0" y2="1">'
    '<stop offset="0" stop-color="#3A3C44"/><stop offset="1" stop-color="#1E1F24"/></linearGradient>'
    '<linearGradient id="lcd" x1="0" y1="0" x2="0" y2="1">'
    '<stop offset="0" stop-color="#C9D2B6"/><stop offset="1" stop-color="#AEB99A"/></linearGradient>'
)


def key(x, y, w, h, fill, label="", label_fill=LEGEND, font=0, r=34):
    """A key with a darker lip below it, and an optional legend."""
    out = (
        f'<rect x="{x}" y="{y + 14}" width="{w}" height="{h}" rx="{r}" fill="#121316"/>'
        f'<rect x="{x}" y="{y}" width="{w}" height="{h}" rx="{r}" fill="{fill}"/>'
        f'<rect x="{x + 6}" y="{y + 6}" width="{w - 12}" height="{h * 0.42:.0f}" rx="{r - 6}" fill="#FFFFFF" opacity="0.10"/>'
    )
    if label:
        out += (
            f'<text x="{x + w / 2}" y="{y + h / 2 + font * 0.36:.0f}" font-family="Helvetica Neue, Helvetica, Arial" '
            f'font-weight="700" font-size="{font}" text-anchor="middle" fill="{label_fill}">{label}</text>'
        )
    return out


def lcd_panel(x, y, w, h, r=46):
    return (
        f'<rect x="{x - 26}" y="{y - 26}" width="{w + 52}" height="{h + 52}" rx="{r + 22}" fill="{BEZEL}"/>'
        f'<rect x="{x}" y="{y}" width="{w}" height="{h}" rx="{r}" fill="url(#lcd)"/>'
    )


def stack_display():
    """The stack, level 1 holding π, with menu tabs: the LCD close up."""
    body = f'<rect width="{SIZE}" height="{SIZE}" fill="url(#body)"/>'
    x, y, w, h = 150, 190, 724, 644
    body += lcd_panel(x, y, w, h)
    pitch = 14
    rows = [("3:", ""), ("2:", "48"), ("1:", "3.14")]
    for i, (label, value) in enumerate(rows):
        ry = y + 70 + i * 140
        body += dots(label, x + 46, ry, pitch, INK)
        if value:
            body += dots(value, x + w - 46 - text_width(value, pitch), ry, pitch, INK)
    # Menu tabs along the bottom, inverted like the calculator's.
    tw = (w - 92 - 3 * 18) / 4
    for i in range(4):
        tx = x + 46 + i * (tw + 18)
        body += f'<rect x="{tx:.0f}" y="{y + h - 112}" width="{tw:.0f}" height="62" rx="10" fill="{INK}"/>'
        body += f'<rect x="{tx + tw * 0.25:.0f}" y="{y + h - 92}" width="{tw * 0.5:.0f}" height="22" rx="6" fill="{LCD}" opacity="0.75"/>'
    return svg(body, BODY_GRADIENT)


def shift_keys():
    """The three mode keys and ENTER: what an RPN calculator's hands know."""
    body = f'<rect width="{SIZE}" height="{SIZE}" fill="url(#body)"/>'
    s, g = 300, 64
    x0 = (SIZE - 2 * s - g) / 2
    y0 = (SIZE - 2 * s - g) / 2 - 10
    body += key(x0, y0, s, s, LEFT, r=60)
    body += key(x0 + s + g, y0, s, s, RIGHT, r=60)
    body += key(x0, y0 + s + g, s, s, ALPHA, "α", INK, 190, r=60)
    body += key(x0 + s + g, y0 + s + g, s, s, KEY, "ENTER", LEGEND, 70, r=60)
    # Shift arrows on the shift keys.
    for kx, colour in ((x0, "#5E3F80"), (x0 + s + g, "#2F7457")):
        cx, cy = kx + s / 2, y0 + s / 2 + 8
        body += (
            f'<path d="M {cx - 70} {cy + 40} L {cx - 70} {cy - 10} L {cx - 110} {cy - 10} L {cx} {cy - 100} '
            f'L {cx + 110} {cy - 10} L {cx + 70} {cy - 10} L {cx + 70} {cy + 40} Z" fill="{colour}"/>'
        )
    return svg(body, BODY_GRADIENT)


def plot():
    """A damped sine on the LCD, with axes: graphing."""
    import math

    body = f'<rect width="{SIZE}" height="{SIZE}" fill="url(#body)"/>'
    x, y, w, h = 150, 170, 724, 684
    body += lcd_panel(x, y, w, h)
    ax_y = y + h * 0.52
    ax_x = x + 90
    grid = "".join(
        f'<line x1="{x + 40}" y1="{y + h * f:.0f}" x2="{x + w - 40}" y2="{y + h * f:.0f}" stroke="{INK}" stroke-width="3" opacity="0.12"/>'
        for f in (0.2, 0.36, 0.68, 0.84)
    )
    body += grid
    body += f'<line x1="{x + 40}" y1="{ax_y:.0f}" x2="{x + w - 40}" y2="{ax_y:.0f}" stroke="{INK}" stroke-width="8" opacity="0.55"/>'
    body += f'<line x1="{ax_x}" y1="{y + 50}" x2="{ax_x}" y2="{y + h - 50}" stroke="{INK}" stroke-width="8" opacity="0.55"/>'
    pts = []
    for i in range(400):
        t = i / 399
        xx = ax_x + t * (x + w - 70 - ax_x)
        v = math.sin(t * 4.2 * math.pi) * math.exp(-2.4 * t)
        pts.append(f"{xx:.1f},{ax_y - v * h * 0.40:.1f}")
    body += f'<polyline points="{" ".join(pts)}" fill="none" stroke="{INK}" stroke-width="30" stroke-linecap="round" stroke-linejoin="round"/>'
    return svg(body, BODY_GRADIENT)


def dot_48():
    """A big dot-matrix 48 lit on the LCD."""
    body = f'<rect width="{SIZE}" height="{SIZE}" fill="url(#body)"/>'
    x, y, w, h = 130, 220, 764, 584
    body += lcd_panel(x, y, w, h, r=56)
    pitch = 56
    tw = text_width("48", pitch)
    tx, ty = (SIZE - tw) / 2, y + (h - 7 * pitch) / 2
    # The unlit dots of the matrix, faintly, then the lit ones.
    for i in range(2):
        for r in range(7):
            for c in range(5):
                px, py = tx + i * 6 * pitch + c * pitch, ty + r * pitch
                body += f'<circle cx="{px + pitch / 2:.0f}" cy="{py + pitch / 2:.0f}" r="{pitch * 0.42:.0f}" fill="{INK}" opacity="0.07"/>'
    body += dots("48", tx, ty, pitch, INK, round_dots=True, gap=0.16)
    return svg(body, BODY_GRADIENT)


def rpn_stack():
    """Four stack levels, level 1 lit: RPN as a picture."""
    defs = (
        '<linearGradient id="bg" x1="0" y1="0" x2="1" y2="1">'
        '<stop offset="0" stop-color="#2E2440"/><stop offset="1" stop-color="#14261F"/></linearGradient>'
    )
    body = f'<rect width="{SIZE}" height="{SIZE}" fill="url(#bg)"/>'
    x, w, h, g = 170, 684, 128, 40
    y0 = (SIZE - 4 * h - 3 * g) / 2
    colours = ["#3B3D46", "#4A4C56", "#5C5F6B", LCD]
    for i in range(4):
        y = y0 + i * (h + g)
        body += f'<rect x="{x}" y="{y + 12}" width="{w}" height="{h}" rx="34" fill="#0C0D10" opacity="0.6"/>'
        body += f'<rect x="{x}" y="{y}" width="{w}" height="{h}" rx="34" fill="{colours[i]}"/>'
        ink = INK if i == 3 else "#9DA0AC"
        body += dots(f"{4 - i}:", x + 44, y + (h - 7 * 11) / 2, 11, ink)
    # Level 1's value.
    y = y0 + 3 * (h + g)
    body += dots("48", x + w - 44 - text_width("48", 11), y + (h - 7 * 11) / 2, 11, INK)
    # The shift colours as two dots, top right.
    body += f'<circle cx="{x + w - 70}" cy="{y0 - 70}" r="24" fill="{LEFT}"/><circle cx="{x + w - 10}" cy="{y0 - 70}" r="24" fill="{RIGHT}"/>'
    return svg(body, defs)


def calculator():
    """The whole calculator, a little turned, on a coloured ground."""
    defs = (
        '<linearGradient id="bg" x1="0" y1="0" x2="1" y2="1">'
        '<stop offset="0" stop-color="#5B3F86"/><stop offset="1" stop-color="#1F6B53"/></linearGradient>'
        + BODY_GRADIENT
    )
    body = f'<rect width="{SIZE}" height="{SIZE}" fill="url(#bg)"/>'
    w, h = 470, 860
    x, y = (SIZE - w) / 2, (SIZE - h) / 2
    inner = (
        f'<rect x="{x + 18}" y="{y + 30}" width="{w}" height="{h}" rx="70" fill="#000" opacity="0.35"/>'
        f'<rect x="{x}" y="{y}" width="{w}" height="{h}" rx="70" fill="url(#body)"/>'
        f'<rect x="{x + 40}" y="{y + 46}" width="{w - 80}" height="230" rx="26" fill="{BEZEL}"/>'
        f'<rect x="{x + 62}" y="{y + 68}" width="{w - 124}" height="186" rx="16" fill="url(#lcd)"/>'
    )
    inner += dots("1:", x + 86, y + 196, 7, INK)
    inner += dots("π", x + w - 86 - text_width("π", 7), y + 196, 7, INK)
    inner += dots("2:", x + 86, y + 112, 7, INK)
    cols, rows = 4, 5
    kw, kh = (w - 80 - 3 * 22) / cols, 74
    for r in range(rows):
        for c in range(cols):
            kx = x + 40 + c * (kw + 22)
            ky = y + 312 + r * (kh + 32)
            fill = KEY_NUM if r >= 2 and c < 3 else KEY
            if r == 2 and c == 3:
                fill = ALPHA
            if r == 3 and c == 3:
                fill = LEFT
            if r == 4 and c == 3:
                fill = RIGHT
            inner += f'<rect x="{kx:.0f}" y="{ky + 7:.0f}" width="{kw:.0f}" height="{kh}" rx="16" fill="#111215"/>'
            inner += f'<rect x="{kx:.0f}" y="{ky:.0f}" width="{kw:.0f}" height="{kh}" rx="16" fill="{fill}"/>'
    body += f'<g transform="rotate(-10 {SIZE / 2} {SIZE / 2})">{inner}</g>'
    return svg(body, defs)


DESIGNS = [
    ("1-stack-display", stack_display),
    ("2-shift-keys", shift_keys),
    ("3-plot", plot),
    ("4-dot-matrix-48", dot_48),
    ("5-rpn-stack", rpn_stack),
    ("6-calculator", calculator),
]


def read_png_rgba(path):
    """Decode an 8-bit RGB or RGBA PNG (what Quick Look writes) to RGBA rows."""
    data = open(path, "rb").read()
    assert data[:8] == b"\x89PNG\r\n\x1a\n", path
    pos, idat, w = 8, b"", 0
    while pos < len(data):
        n, kind = struct.unpack(">I4s", data[pos : pos + 8])
        chunk = data[pos + 8 : pos + 8 + n]
        if kind == b"IHDR":
            w, h, depth, ctype = struct.unpack(">IIBB", chunk[:10])
            assert depth == 8 and ctype in (2, 6), f"{path}: unsupported PNG"
            bpp = 4 if ctype == 6 else 3
        elif kind == b"IDAT":
            idat += chunk
        pos += 12 + n
    raw = zlib.decompress(idat)
    stride = w * bpp
    rows, prev = [], bytearray(stride)
    for r in range(h):
        f = raw[r * (stride + 1)]
        line = bytearray(raw[r * (stride + 1) + 1 : (r + 1) * (stride + 1)])
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
                p = a + b - c
                pa, pb, pc = abs(p - a), abs(p - b), abs(p - c)
                line[i] = (line[i] + (a if pa <= pb and pa <= pc else b if pb <= pc else c)) & 255
        rows.append((bytes(line), bpp))
        prev = line
    return w, h, rows


def write_png_rgb(path, w, h, rows):
    """Write opaque RGB rows as a PNG (no alpha channel)."""

    def chunk(kind, body):
        return struct.pack(">I", len(body)) + kind + body + struct.pack(">I", zlib.crc32(kind + body) & 0xFFFFFFFF)

    raw = b"".join(b"\x00" + r for r in rows)
    out = b"\x89PNG\r\n\x1a\n" + chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 2, 0, 0, 0))
    out += chunk(b"IDAT", zlib.compress(raw, 9)) + chunk(b"IEND", b"")
    open(path, "wb").write(out)


def flatten(rows, w):
    """RGBA or RGB rows to RGB, over black where anything is transparent."""
    out = []
    for line, bpp in rows:
        if bpp == 3:
            out.append(line)
            continue
        rgb = bytearray(w * 3)
        for i in range(w):
            r, g, b, a = line[4 * i : 4 * i + 4]
            rgb[3 * i : 3 * i + 3] = bytes((r * a // 255, g * a // 255, b * a // 255))
        out.append(bytes(rgb))
    return out


def render(svg_path, png_path):
    with tempfile.TemporaryDirectory() as tmp:
        subprocess.run(["qlmanage", "-t", "-s", str(SIZE), "-o", tmp, svg_path], check=True, capture_output=True)
        made = os.path.join(tmp, os.path.basename(svg_path) + ".png")
        w, h, rows = read_png_rgba(made)
    assert (w, h) == (SIZE, SIZE), f"{svg_path} rendered at {w}x{h}"
    write_png_rgb(png_path, w, h, flatten(rows, w))


def preview(names):
    """One square SVG (Quick Look renders squares) showing every design,
    three to a row: at 300 points, then 120 (home screen) and 58 (Settings),
    each with iOS's rounded mask."""
    cell_w, cell_h, pad, cols = 340, 500, 40, 3
    rows = (len(names) + cols - 1) // cols
    side = max(pad + cols * (cell_w + pad), pad + rows * (cell_h + pad))
    parts = [f'<rect width="{side}" height="{side}" fill="#F2F2F4"/>']
    for i, name in enumerate(names):
        x = pad + (i % cols) * (cell_w + pad)
        y = pad + (i // cols) * (cell_h + pad)
        for s, xx, yy in ((300, x + 20, y), (120, x + 40, y + 320), (58, x + 220, y + 351)):
            r = s * 0.2237
            parts.append(
                f'<clipPath id="c{i}_{s}"><rect x="{xx}" y="{yy}" width="{s}" height="{s}" rx="{r:.1f}"/></clipPath>'
                f'<image href="{name}.png" x="{xx}" y="{yy}" width="{s}" height="{s}" clip-path="url(#c{i}_{s})"/>'
            )
        parts.append(
            f'<text x="{x + cell_w / 2}" y="{y + 480}" font-family="Helvetica Neue, Helvetica" font-size="24" '
            f'text-anchor="middle" fill="#333">{name}</text>'
        )
    return (
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{side}" height="{side}" viewBox="0 0 {side} {side}">'
        + "".join(parts)
        + "</svg>"
    ), side


def main():
    if sys.platform != "darwin":
        sys.exit("make_icons.py renders with macOS Quick Look (qlmanage)")
    names = []
    for name, make in DESIGNS:
        svg_path = os.path.join(HERE, name + ".svg")
        with open(svg_path, "w") as f:
            f.write(make())
        render(svg_path, os.path.join(HERE, name + ".png"))
        names.append(name)
        print(f"{name}.png")
    sheet, width = preview(names)
    sheet_path = os.path.join(HERE, "preview.svg")
    with open(sheet_path, "w") as f:
        f.write(sheet)
    with tempfile.TemporaryDirectory() as tmp:
        subprocess.run(["qlmanage", "-t", "-s", str(width), "-o", tmp, sheet_path], check=True, capture_output=True)
        os.replace(os.path.join(tmp, "preview.svg.png"), os.path.join(HERE, "preview.png"))
    print("preview.png")


if __name__ == "__main__":
    main()
