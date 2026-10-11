"""Build a ROM image from the firmware source and say what changed.

Usage: python tools/build.py [-o OUT] [--src DIR] [--compare ROM]

  --src      the source tree (default firmware/); its top file is rom.s
  -o         the image to write (default out/rom.bin), packed two nibbles
             per byte, low nibble first, like ROM/gxrom-r
  --compare  an image to compare with (default ROM/gxrom-r, if present)

Assembler notes (code that grew past a FILLTO, so what follows moved) are
printed first. Then, if there is an image to compare with:
  - which code moved, and by how much (each label's address in the original
    ROM is the address comment on the line after it);
  - the regions that differ once moves, and pointers and offsets that
    changed only because their target moved, are taken out, each named by
    the label at or before it.
Try the result in the emulator:

  cargo run --release -p hp48-app -- --rom out/rom.bin
  cargo run --release -p hp48 --example selftest -- out/rom.bin
"""
import argparse
import bisect
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import sasm  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent


def nibbles(data):
    return [x for b in data for x in (b & 15, b >> 4)]




ORIGIN = re.compile(r"\s\*\s+([0-9A-F]{5})(?:\s|$)")
LABEL = re.compile(r"^(\S+):(?:\s|$)")


def origins(src):
    """{label: address in the original ROM}, from the address comments."""
    out = {}
    for f in sorted(Path(src).rglob("*.s")):
        pending = []
        for line in f.read_text(encoding="utf-8").split("\n"):
            m = LABEL.match(line)
            if m:
                pending.append(m.group(1))
            m = ORIGIN.search(line)
            if m and line.strip() and not line.lstrip().startswith("*"):
                for name in pending:
                    out[name] = int(m.group(1), 16)
                pending = []
    return out


class Moves:
    """Where code moved: piecewise constant shifts, keyed by the labels
    whose address changed."""

    def __init__(self, symbols, orig):
        pairs = sorted((symbols[k], v) for k, v in orig.items() if k in symbols and 0 <= v < sasm.ROM_SIZE)
        self.new = [n for n, _ in pairs]
        self.delta = [n - o for n, o in pairs]
        by_old = sorted((o, n - o) for n, o in pairs)
        self.old = [o for o, _ in by_old]
        self.odelta = [d for _, d in by_old]
        self.labels = {symbols[k]: k for k in orig if k in symbols}

    def shift_at_new(self, a):
        i = bisect.bisect_right(self.new, a) - 1
        return self.delta[i] if i >= 0 else 0

    def to_new(self, old):
        i = bisect.bisect_right(self.old, old) - 1
        return old + (self.odelta[i] if i >= 0 else 0)

    def segments(self):
        """[(new start, new end, shift)] of runs with the same shift."""
        out = []
        for i, (n, d) in enumerate(zip(self.new, self.delta)):
            if out and out[-1][2] == d:
                continue
            if out:
                out[-1][1] = n
            out.append([n, sasm.ROM_SIZE, d])
        return out


def word(m, a, n=5):
    return sum(m[a + i] << (4 * i) for i in range(n)) if 0 <= a and a + n <= len(m) else None


def real_changes(old, new, mv):
    """Addresses in the new image whose nibble differs from the moved
    original, except in words that differ only because they point (or are
    an offset) to something that moved."""
    diff = []
    for a in range(len(new)):
        o = a - mv.shift_at_new(a)
        if not 0 <= o < len(old) or old[o] != new[a]:
            diff.append(a)
    keep = []
    for a in diff:
        explained = False
        o0 = a - mv.shift_at_new(a)
        for start in range(a - 4, a + 1):
            for n in (5, 4, 3, 2):
                if not start <= a < start + n:
                    continue
                wn, wo = word(new, start, n), word(old, o0 - (a - start), n)
                if wn is None or wo is None:
                    continue
                if mv.to_new(wo) == wn:                       # absolute pointer
                    explained = True
                else:                                         # self-relative offset
                    base_o, base_n = o0 - (a - start), start
                    for bias in (0, 1, 2, 4, 6):
                        span = 1 << (4 * n)
                        to = (base_o + bias + (wo if wo < span // 2 else wo - span))
                        tn = (base_n + bias + (wn if wn < span // 2 else wn - span))
                        if mv.to_new(to) == tn and wo != wn:
                            explained = True
                            break
                if explained:
                    break
            if explained:
                break
        if not explained:
            keep.append(a)
    return keep


def main(argv):
    ap = argparse.ArgumentParser(description="Build a ROM image from the firmware source.")
    ap.add_argument("--src", default=str(ROOT / "firmware"))
    ap.add_argument("-o", "--out", default=str(ROOT / "out" / "rom.bin"))
    ap.add_argument("--compare", default=None)
    a = ap.parse_args(argv[1:])
    try:
        asm = sasm.Assembler().run(Path(a.src) / "rom.s")
    except sasm.AsmError as e:
        print("error:", e)
        return 1
    for n in asm.notes:
        print("note:", n)
    out = Path(a.out)
    out.parent.mkdir(parents=True, exist_ok=True)
    img = asm.image()
    out.write_bytes(img)
    print("wrote", out)
    ref = Path(a.compare) if a.compare else ROOT / "ROM" / "gxrom-r"
    if not ref.exists():
        return 0
    old = nibbles(ref.read_bytes())
    if old == list(asm.mem):
        print("identical to", ref)
        return 0
    labels = sorted((v, k) for k, v in asm.symbols.items() if 0 <= v < sasm.ROM_SIZE)
    addrs = [v for v, _ in labels]
    new = list(asm.mem)
    mv = Moves(asm.symbols, origins(a.src))
    moved = [sg for sg in mv.segments() if sg[2]]
    if moved:
        print("moved (addresses in the new build):")
        for s, e, d in moved[:20]:
            print("  #%05X-#%05X  %+d nibbles  from %s" % (s, e - 1, d, mv.labels.get(s, "")))
    changed = real_changes(old, new, mv)
    diff = []
    for x in changed:
        if diff and x - diff[-1][1] < 16:
            diff[-1][1] = x + 1
        else:
            diff.append([x, x + 1])
    total = len(changed)
    print("%d nibbles differ from %s apart from moves, in %d regions:" % (total, ref, len(diff)))
    for s, e in diff[:20]:
        i = bisect.bisect_right(addrs, s) - 1
        where = "%s+%d" % (labels[i][1], s - labels[i][0]) if i >= 0 else ""
        print("  #%05X-#%05X  %6d nibbles  %s" % (s, e - 1, e - s, where))
    if len(diff) > 20:
        print("  ... and %d more" % (len(diff) - 20))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
