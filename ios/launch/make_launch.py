"""The launch screen's picture: the calculator's face with its keys, the
screen black, and "i48 Next Gen" on it.

    python3 ios/launch/make_launch.py

Writes ios/HP48GX/Assets.xcassets/LaunchFace.imageset/launch-face@2x.png.
LaunchScreen.storyboard fits it into the safe area as the app fits the
calculator (`calculator_ui`), so the keys are where they will be when the
app starts. The face comes from the desktop app's own drawing (a scripted
screenshot), so it matches the app; the screen and title are drawn over it
in SVG and rendered with macOS Quick Look, as the icons are
(ios/icon-ideas/make_icons.py).
"""

import os
import subprocess
import sys
import tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(os.path.dirname(HERE))
sys.path.insert(0, os.path.join(ROOT, "ios", "icon-ideas"))
from make_icons import flatten, read_png_rgba, write_png_rgb  # noqa: E402

OUT = os.path.join(ROOT, "ios", "HP48GX", "Assets.xcassets", "LaunchFace.imageset", "launch-face@2x.png")

# The face is 60 x 112 units (lib.rs: FACE_W, FACE_H). At 7.25 points a
# unit the window is 435 x 812 points, which fits a Mac screen, and the
# face fills it exactly; screenshots are at 2x.
UNIT = 7.25 * 2
FACE_W, FACE_H = 60, 112
W, H = round(FACE_W * UNIT), round(FACE_H * UNIT)

# The screen inside the bezel (lib.rs: draw_lcd): x from MARGIN + 1 for
# LCD_W, y from LCD_TOP - 2.5 to LCD_TOP + LCD_H + 0.5.
MARGIN, LCD_TOP = 2.0, 5.0
LCD_W = FACE_W - 2 * MARGIN - 2
LCD_H = LCD_W * 64 / 131
# Half a unit more each side covers the screen's antialiased edge; the
# bezel around it is a unit and more.
SCREEN = (MARGIN + 0.5, LCD_TOP - 3.0, MARGIN + 1.5 + LCD_W, LCD_TOP + LCD_H + 1.0)

LCD_GREEN = "#BCC6A9"
TITLE = "i48 Next Gen"


def face(path):
    """The desktop app's calculator, with nothing typed."""
    subprocess.run(
        ["cargo", "run", "-q", "--release", "-p", "hp48-app", "--", "--screenshot", path,
         "--size", f"{W // 2}x{H // 2}", "--layout", "calculator", "--keys", "F wait wait wait"],
        cwd=ROOT, check=True, capture_output=True,
    )


def overlay(face_png):
    """A square SVG (Quick Look renders squares) with the face in the middle,
    the screen black and the title on it."""
    side = max(W, H)
    left = (side - W) / 2
    x0, y0, x1, y1 = (v * UNIT for v in SCREEN)
    sx, sw = left + x0, x1 - x0
    sh = y1 - y0
    title_y = y0 + sh / 2
    return (
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{side}" height="{side}" viewBox="0 0 {side} {side}">'
        f'<rect width="{side}" height="{side}" fill="#121214"/>'
        f'<image href="{face_png}" x="{left}" y="0" width="{W}" height="{H}"/>'
        f'<rect x="{sx:.1f}" y="{y0:.1f}" width="{sw:.1f}" height="{sh:.1f}" rx="{0.5 * UNIT:.1f}" fill="#000"/>'
        f'<text x="{sx + sw / 2:.1f}" y="{title_y:.1f}" dominant-baseline="central" text-anchor="middle" '
        f'font-family="-apple-system, Helvetica Neue, Helvetica" font-weight="600" font-size="{sh * 0.22:.0f}" '
        f'letter-spacing="2" fill="{LCD_GREEN}">{TITLE}</text>'
        "</svg>"
    ), side


def main():
    if sys.platform != "darwin":
        sys.exit("make_launch.py renders with macOS Quick Look (qlmanage)")
    with tempfile.TemporaryDirectory() as tmp:
        face_png = os.path.join(tmp, "face.png")
        face(face_png)
        fw, fh, _ = read_png_rgba(face_png)
        assert (fw, fh) == (W, H), f"the face came out {fw}x{fh}, not {W}x{H}"
        svg, side = overlay(face_png)
        svg_path = os.path.join(tmp, "launch.svg")
        with open(svg_path, "w") as f:
            f.write(svg)
        subprocess.run(["qlmanage", "-t", "-s", str(side), "-o", tmp, svg_path], check=True, capture_output=True)
        w, h, rows = read_png_rgba(os.path.join(tmp, "launch.svg.png"))
    assert (w, h) == (side, side), f"rendered {w}x{h}"
    # Cut the face back out of the square.
    left = (side - W) // 2
    rgb = flatten(rows, w)
    cut = [row[3 * left : 3 * (left + W)] for row in rgb[:H]]
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    write_png_rgb(OUT, W, H, cut)
    print(os.path.relpath(OUT, ROOT), f"{W}x{H}")


if __name__ == "__main__":
    main()
