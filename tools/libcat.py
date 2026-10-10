"""Catalogue of the ROM libraries listed in the ROM library table (#702C4).

Usage: python libcat.py      (needs out/analysis.pickle) -> out/libraries.txt
"""
import pickle
from pathlib import Path

import analyze  # noqa: F401  (unpickling)
from rom import Rom
from rpl import Decoder as RplDecoder, DecodeError
from symbols import Symbols

OUT = Path(__file__).resolve().parent.parent / "out"


def main():
    with open(OUT / "analysis.pickle", "rb") as f:
        s = pickle.load(f)
    rom = Rom()
    sym = Symbols()
    rd = RplDecoder(rom)
    names = s["romptr_names"]
    lines = ["; ROM libraries of HP48GX rev R (from the table at #702C4)", ""]
    lines.append("LIB  HEADER  ACCESS  CMDS  NAMED  WHERE")
    for lib in s["libs"]:
        where = "lower ROM" if lib.hdr < 0x80000 else (
            "covered by RAM" if lib.hdr < 0xC0000 else "behind port 1")
        named = sum(1 for c in range(len(lib.commands)) if (lib.num, c) in names)
        lines.append("%03X  %05X   %05X   %4d  %5d  %s" % (
            lib.num, lib.hdr, lib.access, len(lib.commands), named, where))
    for lib in s["libs"]:
        lines += ["", "=" * 72,
                  "Library %03X  header #%05X  access #%05X" % (lib.num, lib.hdr, lib.access)]
        for key in ("hash", "message", "link", "config"):
            v = getattr(lib, key)
            lines.append("  %-8s %s" % (key, "#%05X" % v if v is not None else "-"))
        for cmd, a in enumerate(lib.commands):
            nm = names.get((lib.num, cmd)) or ""
            alt = sym.name(a) or ""
            try:
                kind = rd.decode(a).kind if rd.is_object(a) else ("PCO" if rd.is_pco(a) else "?")
            except DecodeError:
                kind = "?"
            lines.append("  %03X %03X  #%05X  %-7s %-20s %s" % (
                lib.num, cmd, a, kind, nm, alt if alt != nm else ""))
    (OUT / "libraries.txt").write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
