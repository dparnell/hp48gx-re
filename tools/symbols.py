"""Symbol table for ROM rev R, merged from data/entries48g.txt (EDB) and
data/vbl48gx-r.txt (Very Big List). EDB names take precedence.
"""
from dataclasses import dataclass
from pathlib import Path

DATA = Path(__file__).resolve().parent.parent / "data"


@dataclass
class Sym:
    addr: int
    name: str
    flags: str = ""     # EDB flags (U, UBS, ML, Usr, RAM, ...)
    stack: str = ""     # EDB stack diagram
    usage: str = ""     # VBL usage (RPL, ASM, IOR, SYS)
    vtype: str = ""     # VBL object type (Program, ASM-SRPL, String, ...)
    vbl_only: bool = False  # named by the VBL alone


class Symbols:
    def __init__(self):
        self.by_addr = {}       # addr -> Sym (primary)
        self.aliases = {}       # addr -> [names]
        self.by_name = {}
        self.romptrs = {}       # (lib, cmd) -> name
        self.ram = {}           # VBL names for I/O and RAM addresses
        self._load_edb(DATA / "entries48g.txt")
        self._load_vbl(DATA / "vbl48gx-r.txt")

    def _load_edb(self, path):
        for line in path.read_text(encoding="utf-8").splitlines():
            if line.startswith("#"):
                continue
            parts = (line.split("\t") + ["", "", ""])[:4]
            a, name, flags, stack = parts
            if len(a) == 6:
                self.romptrs[(int(a[3:], 16), int(a[:3], 16))] = name
                continue
            addr = int(a, 16)
            self.by_name.setdefault(name, addr)
            if flags == "aka" or addr in self.by_addr:
                self.aliases.setdefault(addr, []).append(name)
                continue
            self.by_addr[addr] = Sym(addr, name, flags, stack)

    def _load_vbl(self, path):
        for line in path.read_text(encoding="utf-8").splitlines():
            if line.startswith("#"):
                continue
            parts = (line.split("\t") + [""] * 5)[:5]
            a, name, since, usage, vtype = parts
            try:
                addr = int(a, 16)
            except ValueError:
                continue
            if usage in ("IOR", "SYS"):
                # I/O register or RAM names: not labels for ROM addresses
                self.ram.setdefault(addr, name)
                continue
            s = self.by_addr.get(addr)
            if s is None:
                s = self.by_addr[addr] = Sym(addr, name, vbl_only=bool(name))
                if name:
                    self.by_name.setdefault(name, addr)
            elif name and name != s.name:
                self.aliases.setdefault(addr, []).append(name)
            s.usage = s.usage or usage
            s.vtype = s.vtype or vtype

    def name(self, addr):
        s = self.by_addr.get(addr)
        if s and s.name:
            return s.name
        return self.ram.get(addr) if 0x100 <= addr < 0x140 or addr >= 0x80000 else None

    def label(self, addr):
        return self.name(addr) or "#%05X" % addr

    def lookup(self, text):
        """Resolve a name or hex address string."""
        if text in self.by_name:
            return self.by_name[text]
        return int(text.lstrip("#"), 16)
