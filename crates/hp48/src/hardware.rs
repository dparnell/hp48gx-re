//! Everything on the bus: ROM, RAM, I/O registers, timers and keyboard.

use crate::keyboard::Keyboard;
use crate::memory::{Controller, ModuleKind};
use saturn::Bus;

pub const ROM_NIBBLES: usize = 0x10_0000;
pub const RAM_NIBBLES: usize = 0x4_0000; // 128KB

/// I/O register offsets within the 64-nibble HDW page (docs/saturn.txt §4).
pub mod reg {
    pub const DISPIO: usize = 0x00;
    pub const CONTRAST: usize = 0x01;
    pub const CRC: usize = 0x04;
    pub const ANNUNC: usize = 0x0B;
    pub const CARDCTL: usize = 0x0E;
    pub const CARDSTAT: usize = 0x0F;
    pub const RCS: usize = 0x11;
    pub const TCS: usize = 0x12;
    pub const CRER: usize = 0x13;
    pub const TBR: usize = 0x16;
    pub const DISPADDR: usize = 0x20;
    pub const LINEOFFS: usize = 0x25;
    pub const LINECOUNT: usize = 0x28;
    pub const T1CTRL: usize = 0x2E;
    pub const T2CTRL: usize = 0x2F;
    pub const MENUADDR: usize = 0x30;
    pub const TIMER1: usize = 0x37;
    pub const TIMER2: usize = 0x38;
}

/// Timer control bits.
pub const TC_EXTRA_OR_RUN: u8 = 1;
pub const TC_INT: u8 = 2;
pub const TC_WAKE: u8 = 4;
pub const TC_SRQ: u8 = 8;

pub struct Hardware {
    pub rom: Box<[u8]>,
    pub ram: Box<[u8]>,
    pub mmu: Controller,
    /// Raw I/O register nibbles (timers and CRC live in their own fields).
    pub io: [u8; 64],
    pub crc: u16,
    pub timer1: u8,
    pub timer2: u32,
    pub keyboard: Keyboard,
    /// Last bank selected through CE1.
    pub bank: u32,
    /// Display scan line, advanced by the machine.
    pub scan_line: u8,
    /// Interrupt requested by hardware; taken by the machine after each step.
    pub irq: bool,
    /// Wake-up from SHUTDN requested (timer WKE) without an interrupt.
    pub wake: bool,
    /// Set the MP hardware status bit (card control "set module pulled").
    pub set_mp: bool,
}

impl Hardware {
    /// `rom` is the packed image: two nibbles per byte, low nibble first.
    pub fn new(rom_packed: &[u8]) -> Self {
        let mut rom = vec![0u8; ROM_NIBBLES].into_boxed_slice();
        for (i, b) in rom_packed.iter().take(ROM_NIBBLES / 2).enumerate() {
            rom[2 * i] = b & 0xF;
            rom[2 * i + 1] = b >> 4;
        }
        Hardware {
            rom,
            ram: vec![0u8; RAM_NIBBLES].into_boxed_slice(),
            mmu: Controller::default(),
            io: [0; 64],
            crc: 0,
            timer1: 0,
            timer2: 0,
            keyboard: Keyboard::default(),
            bank: 0,
            scan_line: 0,
            irq: false,
            wake: false,
            set_mp: false,
        }
    }

    fn io_get(&self, off: usize, count: usize) -> u32 {
        (0..count).rev().fold(0, |a, i| (a << 4) | u32::from(self.io[off + i]))
    }

    pub fn display_address(&self) -> u32 {
        self.io_get(reg::DISPADDR, 5) & !1
    }

    pub fn menu_address(&self) -> u32 {
        self.io_get(reg::MENUADDR, 5)
    }

    /// Signed 12-bit line offset (extra nibbles per display row).
    pub fn line_offset(&self) -> i32 {
        let v = self.io_get(reg::LINEOFFS, 3) as i32;
        if v & 0x800 != 0 {
            v - 0x1000
        } else {
            v
        }
    }

    /// Rows drawn from the main display address before switching to the menu.
    pub fn line_count(&self) -> u8 {
        (self.io_get(reg::LINECOUNT, 2) & 0x3F) as u8
    }

    pub fn display_on(&self) -> bool {
        self.io[reg::DISPIO] & 8 != 0
    }

    pub fn bit_offset(&self) -> u32 {
        u32::from(self.io[reg::DISPIO] & 7)
    }

    pub fn contrast(&self) -> u8 {
        self.io[reg::CONTRAST] | ((self.io[reg::CONTRAST + 1] & 1) << 4)
    }

    pub fn annunciators(&self) -> u8 {
        self.io[reg::ANNUNC] | (self.io[reg::ANNUNC + 1] << 4)
    }

    /// Read without side effects (for the display and debuggers).
    pub fn peek(&self, addr: u32) -> u8 {
        let addr = addr & 0xF_FFFF;
        match self.mmu.select(addr) {
            None => self.rom[addr as usize],
            Some(m) => match m.kind {
                ModuleKind::Io => self.io_read_value((addr - m.base) as usize),
                ModuleKind::Ram => self.ram[((addr - m.base) as usize) & (RAM_NIBBLES - 1)],
                _ => 0,
            },
        }
    }

    fn io_read_value(&self, off: usize) -> u8 {
        match off {
            reg::CRC..=0x07 => ((self.crc >> (4 * (off - reg::CRC))) & 0xF) as u8,
            reg::CRER | reg::TBR | 0x17 => 0,
            reg::LINECOUNT => self.scan_line & 0xF,
            0x29 => (self.io[0x29] & 0xC) | ((self.scan_line >> 4) & 3),
            reg::TIMER1 => self.timer1,
            reg::TIMER2..=0x3F => ((self.timer2 >> (4 * (off - reg::TIMER2))) & 0xF) as u8,
            _ => self.io[off],
        }
    }

    fn io_write(&mut self, off: usize, val: u8) {
        match off {
            reg::CRC..=0x07 => {
                let sh = 4 * (off - reg::CRC);
                self.crc = (self.crc & !(0xF << sh)) | (u16::from(val) << sh);
            }
            reg::CARDCTL => {
                self.io[off] = val;
                if val & 2 != 0 {
                    self.set_mp = true;
                }
                if val & 1 != 0 {
                    self.irq = true;
                }
            }
            reg::CARDSTAT => {}
            reg::CRER => self.io[reg::RCS] &= 0xB,
            reg::TBR | 0x17 => {
                // Serial output is not connected: transmission completes at once.
                self.io[off] = val;
                self.io[reg::TCS] &= !1;
            }
            reg::TIMER1 => {
                self.timer1 = val & 0xF;
                self.check_timer1(true);
            }
            reg::TIMER2..=0x3F => {
                let sh = 4 * (off - reg::TIMER2);
                self.timer2 = (self.timer2 & !(0xF << sh)) | (u32::from(val) << sh);
                self.check_timer2(true);
            }
            _ => self.io[off] = val,
        }
    }

    /// SRQ mirrors the timer's sign bit. An interrupt is raised when the
    /// timer becomes negative (if INT is set); WAKE wakes from SHUTDN.
    fn check_timer1(&mut self, became_negative: bool) {
        let ctrl = &mut self.io[reg::T1CTRL];
        if self.timer1 & 8 != 0 {
            *ctrl |= TC_SRQ;
            if *ctrl & TC_WAKE != 0 {
                self.wake = true;
            }
            if became_negative && *ctrl & TC_INT != 0 {
                self.irq = true;
            }
        } else {
            *ctrl &= !TC_SRQ;
        }
    }

    fn check_timer2(&mut self, became_negative: bool) {
        let ctrl = &mut self.io[reg::T2CTRL];
        if self.timer2 & 0x8000_0000 != 0 {
            *ctrl |= TC_SRQ;
            if *ctrl & TC_WAKE != 0 {
                self.wake = true;
            }
            if became_negative && *ctrl & TC_INT != 0 {
                self.irq = true;
            }
        } else {
            *ctrl &= !TC_SRQ;
        }
    }

    /// One 1/16 s tick of TIMER1.
    pub fn tick_timer1(&mut self) {
        let was_neg = self.timer1 & 8 != 0;
        self.timer1 = self.timer1.wrapping_sub(1) & 0xF;
        let neg = self.timer1 & 8 != 0;
        self.check_timer1(neg && !was_neg);
    }

    /// One 1/8192 s tick of TIMER2 (only while TRUN is set).
    pub fn tick_timer2(&mut self) {
        if self.io[reg::T2CTRL] & TC_EXTRA_OR_RUN == 0 {
            return;
        }
        let was_neg = self.timer2 & 0x8000_0000 != 0;
        self.timer2 = self.timer2.wrapping_sub(1);
        let neg = self.timer2 & 0x8000_0000 != 0;
        self.check_timer2(neg && !was_neg);
    }
}

impl Bus for Hardware {
    #[inline]
    fn fetch(&mut self, addr: u32) -> u8 {
        self.peek(addr)
    }

    fn read(&mut self, addr: u32) -> u8 {
        let addr = addr & 0xF_FFFF;
        let v = match self.mmu.select(addr) {
            None => self.rom[addr as usize],
            Some(m) => {
                let off = addr - m.base;
                match m.kind {
                    ModuleKind::Io => self.io_read_value(off as usize),
                    ModuleKind::Ram => self.ram[(off as usize) & (RAM_NIBBLES - 1)],
                    ModuleKind::Ce1 => {
                        // Reading the bank switcher latches the bank number
                        // from the address bits (docs/saturn.txt §4.4).
                        self.bank = (off >> 1) & 0x3F;
                        0
                    }
                    ModuleKind::Ce2 | ModuleKind::Nce3 => 0,
                }
            }
        };
        self.crc = (self.crc >> 4) ^ (((self.crc ^ u16::from(v)) & 0xF) * 0x1081);
        v
    }

    fn write(&mut self, addr: u32, val: u8) {
        let addr = addr & 0xF_FFFF;
        if let Some(m) = self.mmu.select(addr) {
            let off = addr - m.base;
            match m.kind {
                ModuleKind::Io => self.io_write(off as usize, val & 0xF),
                ModuleKind::Ram => self.ram[(off as usize) & (RAM_NIBBLES - 1)] = val & 0xF,
                _ => {}
            }
        }
    }

    fn config(&mut self, val: u32) {
        self.mmu.config(val);
    }

    fn unconfig(&mut self, val: u32) {
        self.mmu.unconfig(val);
    }

    fn reset_config(&mut self) {
        self.mmu.reset();
    }

    fn chip_id(&mut self) -> u32 {
        self.mmu.chip_id()
    }

    fn input(&mut self, out: u16) -> u16 {
        self.keyboard.input(out)
    }

    fn keys_down(&mut self, out: u16) -> bool {
        self.keyboard.input(out) != 0
    }
}
