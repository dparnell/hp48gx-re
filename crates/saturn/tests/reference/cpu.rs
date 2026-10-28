//! The CPU as it was before the instructions became methods with whole-word
//! hex arithmetic: every field operation nibble by nibble. Kept frozen as
//! the reference for tests/reference.rs.

use crate::op::{decode, Cmp, Cond, Op, RtnKind, ScratchOp, Test};
use crate::reg::{Field, Reg, R};

/// Everything outside the CPU: memory, I/O and the bus commands.
pub trait Bus {
    /// Instruction fetch (no side effects).
    fn fetch(&mut self, addr: u32) -> u8;
    /// Data read (updates the CRC, may have I/O side effects).
    fn read(&mut self, addr: u32) -> u8;
    fn write(&mut self, addr: u32, val: u8);
    fn config(&mut self, val: u32);
    fn unconfig(&mut self, val: u32);
    fn reset_config(&mut self);
    /// ID of the next unconfigured module (the C=ID instruction).
    fn chip_id(&mut self) -> u32;
    /// Keyboard input lines for the given OUT register value.
    fn input(&mut self, out: u16) -> u16;
    /// Whether any key is down on the lines selected by OUT (used by RSI).
    fn keys_down(&mut self, out: u16) -> bool;
}

/// Hardware status bits.
pub const XM: u8 = 1;
pub const SB: u8 = 2;
pub const SR: u8 = 4;
pub const MP: u8 = 8;

const RSTK_DEPTH: usize = 8;
pub const INTERRUPT_VECTOR: u32 = 0x0000F;

#[derive(Clone, Debug)]
pub struct Cpu {
    pub a: Reg,
    pub b: Reg,
    pub c: Reg,
    pub d: Reg,
    pub r: [Reg; 5],
    pub d0: u32,
    pub d1: u32,
    pub p: u8,
    pub pc: u32,
    pub st: u16,
    pub hst: u8,
    pub carry: bool,
    pub dec: bool,
    pub out: u16,
    pub input: u16,
    rstk: Vec<u32>,
    /// Not inside an interrupt handler (cleared on entry, set by RTI).
    pub interruptible: bool,
    /// An interrupt arrived while in the handler; RTI re-enters it.
    pub int_pending: bool,
    /// Keyboard interrupts enabled (INTON / INTOFF).
    pub kbd_int_enabled: bool,
    /// Set by SHUTDN; the machine clears it when something wakes the CPU.
    pub shutdown: bool,
    pub cycles: u64,
}

impl Default for Cpu {
    fn default() -> Self {
        Cpu {
            a: Reg(0),
            b: Reg(0),
            c: Reg(0),
            d: Reg(0),
            r: [Reg(0); 5],
            d0: 0,
            d1: 0,
            p: 0,
            pc: 0,
            st: 0,
            hst: 0,
            carry: false,
            dec: false,
            out: 0,
            input: 0,
            rstk: Vec::with_capacity(RSTK_DEPTH),
            interruptible: true,
            int_pending: false,
            kbd_int_enabled: false,
            shutdown: false,
            cycles: 0,
        }
    }
}

impl Cpu {
    pub fn new() -> Self {
        Self::default()
    }

    pub fn rstk(&self) -> &[u32] {
        &self.rstk
    }

    /// Replace the return stack (keeps at most the 8 most recent entries).
    pub fn set_rstk(&mut self, entries: &[u32]) {
        let start = entries.len().saturating_sub(RSTK_DEPTH);
        self.rstk = entries[start..].iter().map(|a| a & 0xF_FFFF).collect();
    }

    /// Push a return address (GOSUB / RSTK=C).
    pub fn push(&mut self, addr: u32) {
        if self.rstk.len() == RSTK_DEPTH {
            self.rstk.remove(0);
        }
        self.rstk.push(addr & 0xF_FFFF);
    }

    /// Pop a return address (RTN / C=RSTK); an empty stack yields 0.
    pub fn pop(&mut self) -> u32 {
        self.rstk.pop().unwrap_or(0)
    }

    fn reg(&self, r: R) -> Reg {
        match r {
            R::A => self.a,
            R::B => self.b,
            R::C => self.c,
            R::D => self.d,
        }
    }

    fn reg_mut(&mut self, r: R) -> &mut Reg {
        match r {
            R::A => &mut self.a,
            R::B => &mut self.b,
            R::C => &mut self.c,
            R::D => &mut self.d,
        }
    }

    fn base(&self) -> u8 {
        if self.dec {
            10
        } else {
            16
        }
    }

    /// Request an interrupt (timer, keyboard, ON key...).
    pub fn interrupt(&mut self) {
        self.shutdown = false;
        if self.interruptible {
            self.push(self.pc);
            self.pc = INTERRUPT_VECTOR;
            self.interruptible = false;
        } else {
            self.int_pending = true;
        }
    }

    /// Decode the instruction at PC without executing it.
    pub fn peek(&self, bus: &mut impl Bus) -> (Op, u32) {
        decode(self.pc, |a| bus.fetch(a))
    }

    /// Execute one instruction. Returns the approximate cycle count.
    pub fn step(&mut self, bus: &mut impl Bus) -> u32 {
        let pc = self.pc;
        let (op, len) = decode(pc, |a| bus.fetch(a));
        self.pc = (pc + len) & 0xF_FFFF;
        let cycles = self.exec(op, len, bus);
        self.cycles += u64::from(cycles);
        cycles
    }

    // ------------------------------------------------------------ ALU

    fn field_range(&self, f: Field) -> (usize, usize) {
        f.range(self.p)
    }

    fn add_into(&mut self, dst: R, x: Reg, y: Reg, f: Field) {
        let (lo, hi) = self.field_range(f);
        let base = self.base();
        let mut out = self.reg(dst);
        let mut c = 0u8;
        for i in lo..=hi {
            let t = x.nib(i) + y.nib(i) + c;
            if t < base {
                out.set_nib(i, t);
                c = 0;
            } else {
                out.set_nib(i, t - base);
                c = 1;
            }
        }
        *self.reg_mut(dst) = out;
        self.carry = c != 0;
    }

    fn sub_into(&mut self, dst: R, x: Reg, y: Reg, f: Field) {
        let (lo, hi) = self.field_range(f);
        let base = i16::from(self.base());
        let mut out = self.reg(dst);
        let mut c = 0i16;
        for i in lo..=hi {
            let t = i16::from(x.nib(i)) - i16::from(y.nib(i)) - c;
            if t >= 0 {
                out.set_nib(i, t as u8);
                c = 0;
            } else {
                out.set_nib(i, (t + base) as u8);
                c = 1;
            }
        }
        *self.reg_mut(dst) = out;
        self.carry = c != 0;
    }

    /// Add `k` (1..=16) to the field, propagating carry; `base` 16 or 10.
    fn add_const(&mut self, r: R, f: Field, k: u8, base: u8) {
        let (lo, hi) = self.field_range(f);
        let mut v = self.reg(r);
        let mut c = k;
        for i in lo..=hi {
            let t = v.nib(i) + c;
            if t < base {
                v.set_nib(i, t);
                c = 0;
                break;
            }
            v.set_nib(i, t - base);
            c = 1;
        }
        *self.reg_mut(r) = v;
        self.carry = c != 0;
    }

    fn sub_const(&mut self, r: R, f: Field, k: u8, base: u8) {
        let (lo, hi) = self.field_range(f);
        let mut v = self.reg(r);
        let mut c = i16::from(k);
        for i in lo..=hi {
            let t = i16::from(v.nib(i)) - c;
            if t >= 0 {
                v.set_nib(i, t as u8);
                c = 0;
                break;
            }
            v.set_nib(i, (t + i16::from(base)) as u8);
            c = 1;
        }
        *self.reg_mut(r) = v;
        self.carry = c != 0;
    }

    fn compare(&self, x: Reg, y: Reg, f: Field) -> std::cmp::Ordering {
        let (lo, hi) = self.field_range(f);
        for i in (lo..=hi).rev() {
            match x.nib(i).cmp(&y.nib(i)) {
                std::cmp::Ordering::Equal => continue,
                o => return o,
            }
        }
        std::cmp::Ordering::Equal
    }

    fn is_zero(&self, x: Reg, f: Field) -> bool {
        let (lo, hi) = self.field_range(f);
        (lo..=hi).all(|i| x.nib(i) == 0)
    }

    fn eval_test(&self, t: Test, f: Field) -> bool {
        use std::cmp::Ordering::*;
        match t {
            Test::Zero(r) => self.is_zero(self.reg(r), f),
            Test::NonZero(r) => !self.is_zero(self.reg(r), f),
            Test::Regs(c, x, y) => {
                let o = self.compare(self.reg(x), self.reg(y), f);
                match c {
                    Cmp::Eq => o == Equal,
                    Cmp::Ne => o != Equal,
                    Cmp::Gt => o == Greater,
                    Cmp::Lt => o == Less,
                    Cmp::Ge => o != Less,
                    Cmp::Le => o != Greater,
                }
            }
        }
    }

    /// Apply a test result: set carry and branch/return if true.
    fn branch_if(&mut self, cond: bool, goyes: Option<u32>) {
        self.carry = cond;
        if cond {
            self.pc = match goyes {
                Some(t) => t,
                None => self.pop(),
            };
        }
    }

    fn copy_field(&mut self, dst: R, src: Reg, f: Field) {
        let (lo, hi) = self.field_range(f);
        let mut v = self.reg(dst);
        for i in lo..=hi {
            v.set_nib(i, src.nib(i));
        }
        *self.reg_mut(dst) = v;
    }

    fn scratch_field(&mut self, op: ScratchOp, r: R, n: u8, f: Field) {
        let (lo, hi) = self.field_range(f);
        let n = usize::from(n);
        let mut x = self.reg(r);
        let mut s = self.r[n];
        for i in lo..=hi {
            let (xv, sv) = (x.nib(i), s.nib(i));
            match op {
                ScratchOp::ToScratch => s.set_nib(i, xv),
                ScratchOp::FromScratch => x.set_nib(i, sv),
                ScratchOp::Exchange => {
                    s.set_nib(i, xv);
                    x.set_nib(i, sv);
                }
            }
        }
        *self.reg_mut(r) = x;
        self.r[n] = s;
    }

    fn mem(&mut self, store: bool, d: u8, r: R, f: Field, bus: &mut impl Bus) {
        let mut addr = if d == 0 { self.d0 } else { self.d1 };
        let (lo, hi) = self.field_range(f);
        let mut v = self.reg(r);
        for i in lo..=hi {
            if store {
                bus.write(addr, v.nib(i));
            } else {
                v.set_nib(i, bus.read(addr));
            }
            addr = (addr + 1) & 0xF_FFFF;
        }
        if !store {
            *self.reg_mut(r) = v;
        }
    }

    fn set_d(&mut self, d: u8, v: u32) {
        if d == 0 {
            self.d0 = v & 0xF_FFFF;
        } else {
            self.d1 = v & 0xF_FFFF;
        }
    }

    fn get_d(&self, d: u8) -> u32 {
        if d == 0 {
            self.d0
        } else {
            self.d1
        }
    }

    // ------------------------------------------------------------ execute

    /// Execute a decoded instruction whose PC has already been advanced
    /// past it. Returns the cycle count; `step` adds it to `cycles`.
    pub fn exec(&mut self, op: Op, len: u32, bus: &mut impl Bus) -> u32 {
        use Op::*;
        let mut cycles = 2 + len;
        match op {
            Rtn(k) => {
                match k {
                    RtnKind::Plain => {}
                    RtnKind::SetXm => self.hst |= XM,
                    RtnKind::SetCarry => self.carry = true,
                    RtnKind::ClearCarry => self.carry = false,
                    RtnKind::Interrupt => {
                        if self.int_pending {
                            // Another interrupt arrived meanwhile: run the handler again.
                            self.int_pending = false;
                            self.pc = INTERRUPT_VECTOR;
                            return 9;
                        }
                        self.interruptible = true;
                    }
                }
                self.pc = self.pop();
                cycles = 9;
            }
            SetHex => self.dec = false,
            SetDec => self.dec = true,
            PushC => {
                let v = self.c.a();
                self.push(v);
            }
            PopC => {
                let v = self.pop();
                self.c.set_a(v);
            }
            ClrSt => self.st &= 0xF000,
            CFromSt => {
                let mut c = self.c;
                for i in 0..3 {
                    c.set_nib(i, ((self.st >> (4 * i)) & 0xF) as u8);
                }
                self.c = c;
            }
            StFromC => self.st = (self.st & 0xF000) | (self.c.0 & 0xFFF) as u16,
            CStEx => {
                let old = self.st & 0xFFF;
                self.st = (self.st & 0xF000) | (self.c.0 & 0xFFF) as u16;
                self.c.0 = (self.c.0 & !0xFFF) | u64::from(old);
            }
            PInc => {
                self.carry = self.p == 15;
                self.p = (self.p + 1) & 0xF;
            }
            PDec => {
                self.carry = self.p == 0;
                self.p = self.p.wrapping_sub(1) & 0xF;
            }
            Logic { and, dst, src, f } => {
                let (lo, hi) = self.field_range(f);
                let s = self.reg(src);
                let mut v = self.reg(dst);
                for i in lo..=hi {
                    let x = if and { v.nib(i) & s.nib(i) } else { v.nib(i) | s.nib(i) };
                    v.set_nib(i, x);
                }
                *self.reg_mut(dst) = v;
            }
            Scratch { op, r, n, f } => self.scratch_field(op, r, n, f),
            DFromR { d, r, short } => {
                let v = self.reg(r).a();
                let new = if short { (self.get_d(d) & 0xF_0000) | (v & 0xFFFF) } else { v };
                self.set_d(d, new);
            }
            DExR { d, r, short } => {
                let rv = self.reg(r).a();
                let dv = self.get_d(d);
                if short {
                    self.set_d(d, (dv & 0xF_0000) | (rv & 0xFFFF));
                    let x = self.reg_mut(r);
                    x.set_a((rv & 0xF_0000) | (dv & 0xFFFF));
                } else {
                    self.set_d(d, rv);
                    self.reg_mut(r).set_a(dv);
                }
            }
            Mem { store, d, r, f } => {
                self.mem(store, d, r, f, bus);
                let (lo, hi) = self.field_range(f);
                cycles = 14 + (hi - lo) as u32 + 1;
            }
            DAdd { d, n } => {
                let v = self.get_d(d) + u32::from(n);
                self.carry = v > 0xF_FFFF;
                self.set_d(d, v);
            }
            DSub { d, n } => {
                let cur = self.get_d(d);
                self.carry = cur < u32::from(n);
                self.set_d(d, cur.wrapping_sub(u32::from(n)));
            }
            DLoad { d, len, val } => {
                let mask = (1u32 << (4 * u32::from(len))) - 1;
                let cur = self.get_d(d);
                self.set_d(d, (cur & !mask) | val);
            }
            PSet(n) => self.p = n,
            LoadConst { r, len, val } => {
                let mut v = self.reg(r);
                for i in 0..usize::from(len) {
                    let pos = (usize::from(self.p) + i) & 0xF;
                    v.set_nib(pos, ((val >> (4 * i)) & 0xF) as u8);
                }
                *self.reg_mut(r) = v;
            }
            CondRtn(c) => {
                if self.cond(c) {
                    self.pc = self.pop();
                }
            }
            CondJump(c, t) => {
                if self.cond(c) {
                    self.pc = t;
                }
            }
            Jump(t) => self.pc = t,
            Call(t) => {
                self.push(self.pc);
                self.pc = t;
            }
            Nop => {}
            Test { test, f, goyes } => {
                let r = self.eval_test(test, f);
                self.branch_if(r, goyes);
            }
            StTest { bit, set, goyes } => {
                let r = ((self.st >> bit) & 1 != 0) == set;
                self.branch_if(r, goyes);
            }
            PTest { n, equal, goyes } => {
                let r = (self.p == n) == equal;
                self.branch_if(r, goyes);
            }
            HsTest { mask, goyes } => {
                let r = self.hst & mask == 0;
                self.branch_if(r, goyes);
            }
            BitTest { r, bit, set, goyes } => {
                let v = (self.reg(r).0 >> bit) & 1 != 0;
                self.branch_if(v == set, goyes);
            }
            BitSet { r, bit, set } => {
                let x = self.reg_mut(r);
                if set {
                    x.0 |= 1 << bit;
                } else {
                    x.0 &= !(1 << bit);
                }
            }
            OutCs => self.out = (self.out & 0xFF0) | (self.c.0 & 0xF) as u16,
            OutC => self.out = (self.c.0 & 0xFFF) as u16,
            In(r) => {
                self.input = bus.input(self.out);
                let inp = u64::from(self.input);
                let x = self.reg_mut(r);
                x.0 = (x.0 & !0xFFFF) | inp;
            }
            Uncnfg => bus.unconfig(self.c.a()),
            Config => bus.config(self.c.a()),
            CId => {
                let id = bus.chip_id();
                self.c.set_a(id);
            }
            Shutdn => self.shutdown = true,
            IntOn => self.kbd_int_enabled = true,
            IntOff => self.kbd_int_enabled = false,
            Rsi => {
                self.kbd_int_enabled = true;
                if bus.keys_down(self.out) {
                    self.interrupt();
                }
            }
            BusCb | BusCc | BusCd => {}
            Sreq => {
                self.c.set_nib(0, 0);
                self.hst &= !SR;
            }
            PcIndirect(r) => {
                let a = self.reg(r).a();
                let target = (0..5).rev().fold(0u32, |acc, i| (acc << 4) | u32::from(bus.read((a + i) & 0xF_FFFF)));
                self.pc = target;
                cycles = 23;
            }
            CPlusP1 => {
                let v = self.c.a() + u32::from(self.p) + 1;
                self.carry = v > 0xF_FFFF;
                self.c.set_a(v);
            }
            Reset => bus.reset_config(),
            CFromP(n) => {
                let p = self.p;
                self.c.set_nib(usize::from(n), p);
            }
            PFromC(n) => self.p = self.c.nib(usize::from(n)),
            CpEx(n) => {
                let old = self.p;
                self.p = self.c.nib(usize::from(n));
                self.c.set_nib(usize::from(n), old);
            }
            Rotate { r, left } => {
                let v = self.reg(r).0;
                let nv = if left {
                    v.rotate_left(4)
                } else {
                    if v & 0xF != 0 {
                        self.hst |= SB;
                    }
                    v.rotate_right(4)
                };
                self.reg_mut(r).0 = nv;
            }
            Srb(r) => {
                let v = self.reg(r).0;
                if v & 1 != 0 {
                    self.hst |= SB;
                }
                self.reg_mut(r).0 = v >> 1;
            }
            SrbField { r, f } => {
                let (lo, hi) = self.field_range(f);
                let mut v = self.reg(r);
                let mut carry_bit = 0u8;
                for i in (lo..=hi).rev() {
                    let n = v.nib(i);
                    v.set_nib(i, (n >> 1) | (carry_bit << 3));
                    carry_bit = n & 1;
                }
                if carry_bit != 0 {
                    self.hst |= SB;
                }
                *self.reg_mut(r) = v;
            }
            AddCon { r, f, n } => self.add_const(r, f, n, 16),
            SubCon { r, f, n } => self.sub_const(r, f, n, 16),
            PcFrom(r) => self.pc = self.reg(r).a(),
            PcTo(r) => {
                let pc = self.pc;
                self.reg_mut(r).set_a(pc);
            }
            PcEx(r) => {
                let pc = self.pc;
                self.pc = self.reg(r).a();
                self.reg_mut(r).set_a(pc);
            }
            HstClear(m) => self.hst &= !m,
            StSet { bit, set } => {
                if set {
                    self.st |= 1 << bit;
                } else {
                    self.st &= !(1 << bit);
                }
            }
            Add { dst, src, f } => {
                let (x, y) = (self.reg(dst), self.reg(src));
                self.add_into(dst, x, y, f);
            }
            Inc { r, f } => {
                let base = self.base();
                self.add_const(r, f, 1, base);
            }
            Dec { r, f } => {
                let base = self.base();
                self.sub_const(r, f, 1, base);
            }
            Sub { dst, a, b, f } => {
                let (x, y) = (self.reg(a), self.reg(b));
                self.sub_into(dst, x, y, f);
            }
            Zero { r, f } => self.copy_field(r, Reg(0), f),
            Copy { dst, src, f } => {
                let s = self.reg(src);
                self.copy_field(dst, s, f);
            }
            Exch { a, b, f } => {
                let (x, y) = (self.reg(a), self.reg(b));
                self.copy_field(a, y, f);
                self.copy_field(b, x, f);
            }
            Shl { r, f } => {
                let (lo, hi) = self.field_range(f);
                let mut v = self.reg(r);
                for i in (lo + 1..=hi).rev() {
                    v.set_nib(i, v.nib(i - 1));
                }
                v.set_nib(lo, 0);
                *self.reg_mut(r) = v;
            }
            Shr { r, f } => {
                let (lo, hi) = self.field_range(f);
                let mut v = self.reg(r);
                if v.nib(lo) != 0 {
                    self.hst |= SB;
                }
                for i in lo..hi {
                    v.set_nib(i, v.nib(i + 1));
                }
                v.set_nib(hi, 0);
                *self.reg_mut(r) = v;
            }
            Neg { r, f } => {
                let x = self.reg(r);
                let nonzero = !self.is_zero(x, f);
                self.sub_into(r, Reg(0), x, f);
                self.carry = nonzero;
            }
            Not { r, f } => {
                let (lo, hi) = self.field_range(f);
                let top = self.base() - 1;
                let mut v = self.reg(r);
                for i in lo..=hi {
                    v.set_nib(i, top.wrapping_sub(v.nib(i)) & 0xF);
                }
                *self.reg_mut(r) = v;
                self.carry = false;
            }
            Illegal => {}
        }
        cycles
    }

    fn cond(&self, c: Cond) -> bool {
        match c {
            Cond::Carry => self.carry,
            Cond::NoCarry => !self.carry,
        }
    }
}
