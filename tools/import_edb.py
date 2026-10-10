"""Extract HP48G (ROM rev R) symbols from Carsten Dominik's entry database.

Usage: python import_edb.py path/to/entries.db > ../data/entries48g.txt

The database is from https://staff.fnwi.uva.nl/c.dominik/hpcalc/entries/
(edb.zip, EDB version 2.11). Its 48G addresses refer to ROM revision R.

Output, one entry per line, tab separated:
    ADDR  NAME  FLAGS  STACK
ADDR is 5 hex digits for a ROM/RAM address or 6 digits for a ROMPTR
(3-digit command number + 3-digit library number). FLAGS is a comma list
such as U (unsupported), UBS (unsupported but stable), ML, Usr, RAM.
AKA names are emitted as extra lines with the same address and flag "aka".
"""
import re
import sys

ESCAPES = {r"\->": "->", r"\GS": "SIGMA", r"\<<": "<<", r"\>>": ">>", r"\oo": "inf",
           r"\.S": "INTEG", r"\.d": "DERIV", r"\v/": "SQRT", r"\pi": "pi", r"\<)": "ANG",
           r"\>=": ">=", r"\<=": "<=", r"\=/": "<>", r"\GD": "DELTA", r"\Gm": "mu",
           r"\^o": "deg", r"\GW": "OMEGA", r"\Ga": "alpha", r"\Gb": "beta",
           r"\Gl": "lambda", r"\Gs": "sigma", r"\Gr": "rho", r"\Gt": "tau",
           r"\GW": "OMEGA", r"\Gq": "theta", r"\Gx": "xi", r"\Gg": "gamma",
           r"\Gf": "phi", r"\Gc": "chi", r"\Gn": "nu", r"\Ge": "epsilon"}


def unescape(s):
    for k, v in ESCAPES.items():
        s = s.replace(k, v)
    return s


def main(path):
    sys.stdout.reconfigure(encoding="utf-8", newline="\n")
    name = stack = None
    akas = []
    out = []

    def flush(addr_line):
        if name is None or addr_line is None:
            return
        m = re.match(r"([0-9A-F]{5,6})\s*(\\[^\\]*\\)?\s*(.*)", addr_line)
        if not m:
            return
        addr, fmt, rest = m.group(1), m.group(2), m.group(3)
        flags = ",".join(re.findall(r"\[([^\]]+)\]", rest))
        real = name
        if fmt:
            real = fmt.strip("\\").replace("%s", name)
        out.append((addr, unescape(real), flags, unescape(stack or "")))
        for a in akas:
            out.append((addr, unescape(a.strip("()")), "aka", ""))

    addr48 = None
    with open(path, encoding="latin-1") as f:
        lines = f.read().split("\n")
    # join continuation lines ending with backslash in stack diagrams
    for line in lines:
        if not line or line.startswith("*") or line.startswith("@"):
            continue
        if line.startswith("."):
            body = line[1:].strip()
            if body.startswith("48G:"):
                addr48 = body[4:].strip()
            elif body.startswith("AKA:"):
                akas = body[4:].split()
            continue
        if line.startswith(";") or line[0].isspace():
            if line[0].isspace() and stack is not None and not line.startswith(";"):
                stack += " " + line.strip().rstrip("\\").strip()
            continue
        # new entry line
        flush(addr48)
        parts = line.split(None, 1)
        name = parts[0]
        stack = parts[1].rstrip("\\").strip() if len(parts) > 1 else ""
        addr48 = None
        akas = []
    flush(addr48)

    out.sort(key=lambda e: (len(e[0]), e[0], e[1]))
    print("# HP48G ROM rev R symbols, from Carsten Dominik's EDB 2.11")
    print("# ADDR\tNAME\tFLAGS\tSTACK")
    for e in out:
        print("\t".join(e))


if __name__ == "__main__":
    main(sys.argv[1])
