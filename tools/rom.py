"""Load the HP48GX ROM image as a nibble array.

The image is packed two nibbles per byte, low nibble first: byte k holds
nibble 2k in bits 0-3 and nibble 2k+1 in bits 4-7.
"""
from pathlib import Path

ROM_PATH = Path(__file__).resolve().parent.parent / "ROM" / "gxrom-r"


def load(path=ROM_PATH):
    data = Path(path).read_bytes()
    nibs = bytearray(len(data) * 2)
    nibs[0::2] = bytes(b & 0xF for b in data)
    nibs[1::2] = bytes(b >> 4 for b in data)
    return bytes(nibs)


class Rom:
    def __init__(self, path=ROM_PATH):
        self.n = load(path)
        self.size = len(self.n)

    def nib(self, a):
        return self.n[a]

    def read(self, a, count):
        """Little-endian value of `count` nibbles at address a."""
        v = 0
        for i in reversed(range(count)):
            v = (v << 4) | self.n[a + i]
        return v

    def addr(self, a):
        return self.read(a, 5)

    def byte(self, a):
        return self.read(a, 2)

    def hexs(self, a, count):
        return "".join("%X" % x for x in self.n[a:a + count])

    def ascii(self, a, nbytes):
        return "".join(chr(self.byte(a + 2 * i)) for i in range(nbytes))

    def find_text(self, s):
        """Yield nibble addresses where ASCII string s occurs."""
        pat = bytes(x for c in s.encode("latin-1") for x in (c & 0xF, c >> 4))
        i = self.n.find(pat)
        while i >= 0:
            yield i
            i = self.n.find(pat, i + 1)
