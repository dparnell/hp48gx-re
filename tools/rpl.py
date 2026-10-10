"""RPL object decoding for the HP48 ROM.

An RPL object starts with a 5-nibble prolog address that identifies its type.
Anything else found in a composite is a pointer to an object elsewhere.
Object layouts follow the EDB prolog descriptions (data/entries48g.txt).
"""
from dataclasses import dataclass, field

PRLG = 0x028FC

PROLOGS = {
    0x02911: "DOBINT", 0x02933: "DOREAL", 0x02955: "DOEREL", 0x02977: "DOCMP",
    0x0299D: "DOECMP", 0x029BF: "DOCHAR", 0x029E8: "DOARRY", 0x02A0A: "DOLNKARRY",
    0x02A2C: "DOCSTR", 0x02A4E: "DOHSTR", 0x02A74: "DOLIST", 0x02A96: "DORRP",
    0x02AB8: "DOSYMB", 0x02ADA: "DOEXT", 0x02AFC: "DOTAG", 0x02B1E: "DOGROB",
    0x02B40: "DOLIB", 0x02B62: "DOBAK", 0x02B88: "DOEXT0", 0x02BAA: "DOACPTR",
    0x02BCC: "DOEXT2", 0x02BEE: "DOEXT3", 0x02C10: "DOEXT4", 0x02D9D: "DOCOL",
    0x02DCC: "DOCODE", 0x02E48: "DOIDNT", 0x02E6D: "DOLAM", 0x02E92: "DOROMP",
}
SEMI = 0x0312B

FIXED_BODY = {"DOBINT": 5, "DOREAL": 16, "DOEREL": 21, "DOCMP": 32, "DOECMP": 42,
              "DOCHAR": 2, "DOROMP": 6, "DOACPTR": 10}
LENGTH_PREFIXED = {"DOARRY", "DOLNKARRY", "DOCSTR", "DOHSTR", "DOGROB", "DOLIB",
                   "DOBAK", "DOEXT0", "DOCODE", "DOEXT2", "DOEXT3", "DOEXT4"}
COMPOSITE = {"DOCOL", "DOLIST", "DOSYMB", "DOEXT"}


class DecodeError(Exception):
    pass


@dataclass
class Obj:
    addr: int
    kind: str             # prolog name, or "PTR" for a pointer in a composite
    size: int             # total size in nibbles
    value: object = None  # decoded payload
    children: list = field(default_factory=list)  # for composites / tags


def bcd_real(rom, a, exp_n, mant_n):
    """Decode a BCD real body at a: exponent (exp_n nibs), mantissa, sign."""
    e = int(rom.hexs(a, exp_n)[::-1], 10) if all(x < 10 for x in rom.n[a:a + exp_n]) else None
    m = rom.hexs(a + exp_n, mant_n)[::-1]
    s = rom.n[a + exp_n + mant_n]
    if e is None or not m.isdigit():
        return None
    lim = 10 ** exp_n
    if e >= lim // 2:
        e -= lim
    txt = "%s%s.%sE%d" % ("-" if s == 9 else "", m[0], m[1:].rstrip("0") or "0", e)
    return txt.replace(".0E", "E").replace(".E", "E")


class Decoder:
    def __init__(self, rom, limit=None):
        self.rom = rom
        self.limit = limit or rom.size

    def prolog(self, a):
        return PROLOGS.get(self.rom.addr(a))

    def is_object(self, a):
        return self.prolog(a) is not None

    def is_pco(self, a):
        """Primitive code object: a body that points at its own code."""
        return self.rom.addr(a) == a + 5

    def text(self, a, nchars):
        return self.rom.ascii(a, nchars)

    def decode(self, a, depth=0):
        r = self.rom
        if a < 0 or a + 5 > self.limit:
            raise DecodeError("out of range %05X" % a)
        kind = self.prolog(a)
        if kind is None:
            raise DecodeError("no prolog at %05X" % a)
        b = a + 5
        if kind in FIXED_BODY:
            size = 5 + FIXED_BODY[kind]
            val = None
            if kind == "DOBINT":
                val = r.addr(b)
            elif kind == "DOREAL":
                val = bcd_real(r, b, 3, 12)
            elif kind == "DOEREL":
                val = bcd_real(r, b, 5, 15)
            elif kind == "DOCMP":
                val = (bcd_real(r, b, 3, 12), bcd_real(r, b + 16, 3, 12))
            elif kind == "DOECMP":
                val = (bcd_real(r, b, 5, 15), bcd_real(r, b + 21, 5, 15))
            elif kind == "DOCHAR":
                val = chr(r.byte(b))
            elif kind == "DOROMP":
                val = (r.read(b, 3), r.read(b + 3, 3))  # (lib, cmd)
            elif kind == "DOACPTR":
                val = (r.addr(b), r.addr(b + 5))
            return Obj(a, kind, size, val)
        if kind in LENGTH_PREFIXED:
            ln = r.addr(b)
            if ln < 5 or b + ln > self.limit:
                raise DecodeError("bad length %05X at %05X" % (ln, a))
            obj = Obj(a, kind, 5 + ln)
            if kind == "DOCSTR":
                obj.value = self.text(b + 5, (ln - 5) // 2)
            elif kind == "DOHSTR":
                obj.value = r.hexs(b + 5, ln - 5)[::-1]
            elif kind == "DOGROB":
                obj.value = (r.addr(b + 5), r.addr(b + 10))  # (height, width)
            elif kind == "DOLIB":
                obj.value = self.library_header(a)
            return obj
        if kind in ("DOIDNT", "DOLAM"):
            nc = r.byte(b)
            return Obj(a, kind, 7 + 2 * nc, self.text(b + 2, nc))
        if kind == "DOTAG":
            nc = r.byte(b)
            inner_a = b + 2 + 2 * nc
            inner = self.decode(inner_a, depth + 1)
            return Obj(a, kind, inner_a + inner.size - a, self.text(b + 2, nc), [inner])
        if kind in COMPOSITE:
            p = b
            kids = []
            while True:
                if p + 5 > self.limit or len(kids) > 20000:
                    raise DecodeError("unterminated composite at %05X" % a)
                v = r.addr(p)
                if v == SEMI:
                    p += 5
                    break
                if v in PROLOGS:
                    child = self.decode(p, depth + 1)
                else:
                    child = Obj(p, "PTR", 5, v)
                kids.append(child)
                p += child.size
            return Obj(a, kind, p - a, None, kids)
        if kind == "DORRP":
            raise DecodeError("directory decoding not implemented at %05X" % a)
        raise DecodeError("unhandled %s at %05X" % (kind, a))

    # ------------------------------------------------------------------
    def library_header(self, a):
        """Parse a library object header. Offsets are self-relative."""
        r = self.rom
        p = a + 10
        nl = r.byte(p)
        p += 2
        name = ""
        if nl:
            name = self.text(p, nl)
            p += 2 * nl + 2  # name, then the length repeated
        libnum = r.read(p, 3)
        p += 3
        hdr = {"name": name, "libnum": libnum}
        for key in ("hash", "message", "link", "config"):
            off = r.addr(p)
            hdr[key] = (p + off) & 0xFFFFF if off else None
            p += 5
        hdr["objects"] = p
        hdr["end"] = a + 5 + r.addr(a + 5)
        return hdr

    def library_links(self, hdr):
        """Command addresses from the link table (a DOHSTR of offsets)."""
        r = self.rom
        lt = hdr.get("link")
        if lt is None or r.addr(lt) != 0x02A4E:
            return []
        ln = r.addr(lt + 5)
        out = []
        p = lt + 10
        while p < lt + 5 + ln:
            out.append((p + r.addr(p)) & 0xFFFFF)
            p += 5
        return out

    def library_names(self, hdr):
        """Command names from the hash table: {cmd#: name}."""
        r = self.rom
        ht = hdr.get("hash")
        if ht is None or r.addr(ht) != 0x02A4E:
            return {}
        ln = r.addr(ht + 5)
        end = ht + 5 + ln
        # hash table: 16 offsets (one per name length 1..16), then the name
        # entries; the trailing part is a size + reverse table of offsets.
        names = {}
        p = ht + 10 + 16 * 5
        # name area length precedes the reverse table
        area_len = r.addr(p)
        q = p + 5
        stop = p + area_len
        while q < stop and q < end:
            nl = r.byte(q)
            if nl == 0 or nl > 40:
                break
            name = self.text(q + 2, nl)
            cmd = r.read(q + 2 + 2 * nl, 3)
            names[cmd] = name
            q += 2 + 2 * nl + 3
        return names
