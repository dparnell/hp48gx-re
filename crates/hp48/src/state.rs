//! Saving and restoring the whole machine (continuous memory).
//!
//! The format is a small versioned binary blob; the ROM is not included.

use crate::hardware::RAM_NIBBLES;
use crate::machine::Machine;
use saturn::Reg;

const MAGIC: &[u8; 8] = b"HP48GXS1";

#[derive(Debug)]
pub enum StateError {
    BadMagic,
    Truncated,
}

impl std::fmt::Display for StateError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            StateError::BadMagic => f.write_str("not an HP48GX state file"),
            StateError::Truncated => f.write_str("state file is truncated"),
        }
    }
}

impl std::error::Error for StateError {}

struct Writer(Vec<u8>);

impl Writer {
    fn u8(&mut self, v: u8) {
        self.0.push(v);
    }
    fn u16(&mut self, v: u16) {
        self.0.extend_from_slice(&v.to_le_bytes());
    }
    fn u32(&mut self, v: u32) {
        self.0.extend_from_slice(&v.to_le_bytes());
    }
    fn u64(&mut self, v: u64) {
        self.0.extend_from_slice(&v.to_le_bytes());
    }
    fn bool(&mut self, v: bool) {
        self.u8(u8::from(v));
    }
    /// Nibbles packed two per byte.
    fn nibbles(&mut self, n: &[u8]) {
        self.0.extend(n.chunks(2).map(|c| c[0] | (c.get(1).copied().unwrap_or(0) << 4)));
    }
}

struct Reader<'a>(&'a [u8]);

impl Reader<'_> {
    fn take(&mut self, n: usize) -> Result<&[u8], StateError> {
        if self.0.len() < n {
            return Err(StateError::Truncated);
        }
        let (a, b) = self.0.split_at(n);
        self.0 = b;
        Ok(a)
    }
    fn u8(&mut self) -> Result<u8, StateError> {
        Ok(self.take(1)?[0])
    }
    fn u16(&mut self) -> Result<u16, StateError> {
        Ok(u16::from_le_bytes(self.take(2)?.try_into().unwrap()))
    }
    fn u32(&mut self) -> Result<u32, StateError> {
        Ok(u32::from_le_bytes(self.take(4)?.try_into().unwrap()))
    }
    fn u64(&mut self) -> Result<u64, StateError> {
        Ok(u64::from_le_bytes(self.take(8)?.try_into().unwrap()))
    }
    fn bool(&mut self) -> Result<bool, StateError> {
        Ok(self.u8()? != 0)
    }
    fn nibbles(&mut self, out: &mut [u8]) -> Result<(), StateError> {
        let bytes = self.take(out.len().div_ceil(2))?;
        for (i, n) in out.iter_mut().enumerate() {
            let b = bytes[i / 2];
            *n = if i % 2 == 0 { b & 0xF } else { b >> 4 };
        }
        Ok(())
    }
}

impl Machine {
    pub fn save_state(&self) -> Vec<u8> {
        let mut w = Writer(Vec::with_capacity(RAM_NIBBLES / 2 + 512));
        w.0.extend_from_slice(MAGIC);
        let c = &self.cpu;
        for r in [c.a, c.b, c.c, c.d].iter().chain(c.r.iter()) {
            w.u64(r.0);
        }
        w.u32(c.d0);
        w.u32(c.d1);
        w.u8(c.p);
        w.u32(c.pc);
        w.u16(c.st);
        w.u8(c.hst);
        w.bool(c.carry);
        w.bool(c.dec);
        w.u16(c.out);
        w.u16(c.input);
        w.u8(c.rstk().len() as u8);
        for &a in c.rstk() {
            w.u32(a);
        }
        w.bool(c.interruptible);
        w.bool(c.int_pending);
        w.bool(c.kbd_int_enabled);
        w.bool(c.shutdown);

        let hw = &self.hw;
        w.nibbles(&hw.ram);
        w.nibbles(&hw.io);
        w.u16(hw.crc);
        w.u8(hw.timer1);
        w.u32(hw.timer2);
        w.u32(hw.bank);
        for m in &hw.mmu.modules {
            let (rem, mask, base) = m.raw();
            w.u8(rem);
            w.u32(mask);
            w.u32(base);
        }
        w.u64(self.time);
        w.0
    }

    pub fn load_state(&mut self, data: &[u8]) -> Result<(), StateError> {
        let mut r = Reader(data);
        if r.take(MAGIC.len())? != MAGIC {
            return Err(StateError::BadMagic);
        }
        let mut regs = [0u64; 9];
        for v in &mut regs {
            *v = r.u64()?;
        }
        let c = &mut self.cpu;
        c.a = Reg(regs[0]);
        c.b = Reg(regs[1]);
        c.c = Reg(regs[2]);
        c.d = Reg(regs[3]);
        for i in 0..5 {
            c.r[i] = Reg(regs[4 + i]);
        }
        c.d0 = r.u32()?;
        c.d1 = r.u32()?;
        c.p = r.u8()?;
        c.pc = r.u32()?;
        c.st = r.u16()?;
        c.hst = r.u8()?;
        c.carry = r.bool()?;
        c.dec = r.bool()?;
        c.out = r.u16()?;
        c.input = r.u16()?;
        let n = r.u8()?;
        let rstk = (0..n).map(|_| r.u32()).collect::<Result<Vec<_>, _>>()?;
        c.set_rstk(&rstk);
        c.interruptible = r.bool()?;
        c.int_pending = r.bool()?;
        c.kbd_int_enabled = r.bool()?;
        c.shutdown = r.bool()?;

        let hw = &mut self.hw;
        r.nibbles(&mut hw.ram)?;
        r.nibbles(&mut hw.io)?;
        hw.crc = r.u16()?;
        hw.timer1 = r.u8()?;
        hw.timer2 = r.u32()?;
        hw.bank = r.u32()?;
        for m in &mut hw.mmu.modules {
            let rem = r.u8()?;
            let mask = r.u32()?;
            let base = r.u32()?;
            m.set_raw(rem, mask, base);
        }
        let time = r.u64()?;
        self.set_time(time);
        Ok(())
    }

    /// Advance the calculator's clock by real time that passed while the
    /// emulator was not running (TIMER2 counts down at 8192 Hz).
    pub fn advance_clock(&mut self, seconds: f64) {
        if seconds > 0.0 {
            let ticks = (seconds * 8192.0) as u64;
            self.hw.timer2 = self.hw.timer2.wrapping_sub(ticks as u32);
        }
    }
}
