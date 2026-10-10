"""Extract AnarcHP's "HP48 Very Big List" (rev R addresses) to a TSV.

Usage: python import_vbl.py path/to/MEMO.LST > ../data/vbl48gx-r.txt

Source: https://www.hpcalc.org/hp48/programming/entries/hp48-vbl.zip
(freeware, 1996). Output columns: ADDR NAME SINCE_SX USAGE TYPE.
NAME is empty where the list only has "[...]".
"""
import re
import sys

LINE = re.compile(r"^\$ ([0-9A-F]{5})h : (.{30}) (\S+)\s+(\S+)\s+(\S+)")


def main(path):
    sys.stdout.reconfigure(encoding="utf-8", newline="\n")
    print("# HP48GX rev R address list, from AnarcHP's Very Big List (1996)")
    print("# ADDR\tNAME\tSINCE_SX\tUSAGE\tTYPE")
    with open(path, encoding="latin-1") as f:
        for line in f:
            m = LINE.match(line)
            if not m:
                continue
            addr, name, since, usage, typ = m.groups()
            name = name.strip()
            if name == "[...]":
                name = ""
            print("\t".join((addr, name, since, usage, typ)))


if __name__ == "__main__":
    main(sys.argv[1])
