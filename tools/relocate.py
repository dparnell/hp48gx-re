"""Relocation test for the source tree: does the ROM still work when code moves?

Copies firmware/ to out/reloc and inserts zero nibbles at the start of the chosen
files. FILLTO lines become BSS of their original size, so everything after an
insertion moves, up to the free space at the end of its half of the ROM (or,
in upper ROM, of its window; see disasm.WINDOWS).
Then it assembles out/reloc.bin. Boot it with the emulator, e.g.

    cargo run --release -p hp48-cli -- --rom out/reloc.bin --seconds 3 --keys "F wait:3 1 Enter 2 Plus" --wait 1

An address still written as a number shows up as a crash or a glitch.

Usage: python relocate.py [--pad N] [FILE-PREFIX ...]   (default: pad 16 in 04003-*.s;
       a prefix such as C0000 pads inside an upper-ROM library part)
       --compare   also list the nibbles that differ from the ROM outside the
                   moved range (pointers that moved with their targets are
                   expected; anything else is suspicious)
"""
import re
import shutil
import sys
from pathlib import Path

import sasm
from disasm import WINDOWS, CRC_WORDS

ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / "firmware"
DST = ROOT / "out" / "reloc"
# Fills that absorb the shift: before the version object, the CRC words and
# the upper-ROM windows.
KEEP_FILLTO = {0x7FFA0, *WINDOWS, *CRC_WORDS}


ENDS_FLOW = {"RTN", "RTNSXM", "RTNCC", "RTNSC", "RTI", "GOTO", "GOLONG", "GOVLNG",
             "PC=(A)", "PC=(C)", "PC=A", "PC=C", ";", "}"}


def padding_point(lines):
    """Index of the first label that nothing falls into (the line before it
    ends the flow), and its address in the original ROM."""
    prev = None
    for k, ln in enumerate(lines):
        t = ln.split()
        if not t or t[0].startswith("*"):
            continue
        if t[0].endswith(":") and prev in ENDS_FLOW:
            for j in range(k + 1, len(lines)):
                m = re.search(r"\*\s+([0-9A-F]{5})", lines[j])
                if m and not lines[j].split()[0].endswith(":"):
                    return k, int(m.group(1), 16)
        if not t[0].endswith(":") and t[0] not in ("RPL", "ASSEMBLE"):
            # an RPL line may hold several objects: its last one ends it
            code = sasm.split_line(ln)
            prev = code[-1] if code and code[-1] in (";", "}") else t[0]
    raise SystemExit("no place to pad")


def main(argv):
    pad = 16
    if "--pad" in argv:
        i = argv.index("--pad")
        pad = int(argv[i + 1])
        del argv[i:i + 2]
    prefixes = [a for a in argv[1:] if not a.startswith("--")] or ["04003"]
    if DST.exists():
        shutil.rmtree(DST)
    shutil.copytree(SRC, DST)
    done = []
    for f in sorted(DST.glob("[lu]*/*.s")):
        text = f.read_text(encoding="utf-8").split("\n")
        out = []
        for line in text:
            m = re.match(r"(\s+)FILLTO\s+#([0-9A-F]+)\s+\*\s+[0-9A-F]{5}\s+(\d+) zero", line)
            if m and int(m.group(2), 16) not in KEEP_FILLTO:
                line = "%sBSS     %s" % (m.group(1), m.group(3))
            out.append(line)
        if any(f.name.startswith(p) for p in prefixes):
            i, at = padding_point(out)
            out.insert(i, "        BSS     %d                * relocation test padding" % pad)
            done.append("%s (#%05X)" % (f.name, at))
        f.write_text("\n".join(out), encoding="utf-8", newline="\n")
    print("padded", pad, "nibbles at:", ", ".join(done))
    return sasm.main(["sasm", str(DST / "rom.s"), "-o", str(ROOT / "out" / "reloc.bin")]
                     + (["--check", str(ROOT / "ROM" / "gxrom-r")] if "--compare" in argv else []))


if __name__ == "__main__":
    sys.exit(main(sys.argv))
