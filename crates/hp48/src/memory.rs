//! The Saturn daisy-chain memory controller as wired in the HP48GX.
//!
//! Modules are configured in chain order by CONFIG: first a size (written as
//! #100000 - size, which is the address mask) and then a base address. The
//! I/O page takes only an address. ROM is always present at the lowest
//! priority. When modules overlap, priority is HDW, RAM, CE2, CE1, NCE3, ROM
//! (docs/saturn.txt §2.4).

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ModuleKind {
    /// Memory-mapped I/O registers (HDW), 64 nibbles.
    Io,
    Ram,
    /// GX: bank switcher for port 2.
    Ce1,
    /// Port 1.
    Ce2,
    /// Port 2.
    Nce3,
}

#[derive(Clone, Debug)]
pub struct Module {
    pub kind: ModuleKind,
    configs: u8,
    remaining: u8,
    pub mask: u32,
    pub base: u32,
}

impl Module {
    fn new(kind: ModuleKind) -> Self {
        let configs = if kind == ModuleKind::Io { 1 } else { 2 };
        Module { kind, configs, remaining: configs, mask: 0, base: 0 }
    }

    /// (configs still needed, mask, base) for snapshots.
    pub fn raw(&self) -> (u8, u32, u32) {
        (self.remaining, self.mask, self.base)
    }

    pub fn set_raw(&mut self, remaining: u8, mask: u32, base: u32) {
        self.remaining = remaining.min(self.configs);
        self.mask = mask & 0xF_FFFF;
        self.base = base & 0xF_FFFF;
    }

    pub fn configured(&self) -> bool {
        self.remaining == 0
    }

    #[inline]
    pub fn contains(&self, addr: u32) -> bool {
        self.remaining == 0 && (addr & self.mask) == self.base
    }

    fn reset(&mut self) {
        self.remaining = self.configs;
        self.mask = 0;
        self.base = 0;
    }

    /// (ID before the size CONFIG, ID before the address CONFIG).
    fn ids(&self) -> (u32, u32) {
        match self.kind {
            ModuleKind::Io => (0x19, 0x19),
            ModuleKind::Ram => (0x03, 0xF4),
            ModuleKind::Ce1 => (0x05, 0xF6),
            ModuleKind::Ce2 => (0x07, 0xF8),
            ModuleKind::Nce3 => (0x01, 0xF2),
        }
    }
}

/// Chain order; also the order UNCNFG searches.
pub const CHAIN: [ModuleKind; 5] = [ModuleKind::Io, ModuleKind::Ram, ModuleKind::Ce1, ModuleKind::Ce2, ModuleKind::Nce3];
/// Read/write priority when windows overlap.
const PRIORITY: [usize; 5] = [0, 1, 3, 2, 4];

#[derive(Clone, Debug)]
pub struct Controller {
    pub modules: [Module; 5],
}

impl Default for Controller {
    fn default() -> Self {
        Controller { modules: CHAIN.map(Module::new) }
    }
}

impl Controller {
    pub fn config(&mut self, val: u32) {
        if let Some(m) = self.modules.iter_mut().find(|m| m.remaining > 0) {
            if m.kind == ModuleKind::Io {
                m.mask = 0xF_FFC0;
                m.base = val & m.mask;
                m.remaining = 0;
            } else if m.remaining == 2 {
                m.mask = val & 0xF_FFFF;
                m.remaining = 1;
            } else {
                m.base = val & m.mask;
                m.remaining = 0;
            }
        }
    }

    pub fn unconfig(&mut self, val: u32) {
        if let Some(m) = self.modules.iter_mut().find(|m| m.contains(val & 0xF_FFFF)) {
            m.reset();
        }
    }

    pub fn reset(&mut self) {
        for m in &mut self.modules {
            m.reset();
        }
    }

    pub fn chip_id(&self) -> u32 {
        match self.modules.iter().find(|m| m.remaining > 0) {
            Some(m) => {
                let (size_id, addr_id) = m.ids();
                if m.remaining == m.configs && m.configs == 2 {
                    size_id
                } else {
                    addr_id
                }
            }
            None => 0,
        }
    }

    /// Which module answers at `addr` (None = ROM).
    #[inline]
    pub fn select(&self, addr: u32) -> Option<&Module> {
        PRIORITY.iter().map(|&i| &self.modules[i]).find(|m| m.contains(addr))
    }
}
