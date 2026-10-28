//! CPU state and instruction execution.

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
    //
    // In hex mode a field is worked on as one binary number, which is the
    // same as nibble by nibble with base 16. Decimal mode goes nibble by
    // nibble, because digits above 9 have their own carry rules.

    #[inline]
    fn field_range(&self, f: Field) -> (usize, usize) {
        f.range(self.p)
    }

    /// The bits of nibbles lo..=hi.
    #[inline]
    fn mask(lo: usize, hi: usize) -> u64 {
        let n = hi - lo + 1;
        let m = if n == 16 { !0 } else { (1u64 << (4 * n)) - 1 };
        m << (4 * lo)
    }

    #[inline]
    fn field_mask(&self, f: Field) -> u64 {
        let (lo, hi) = self.field_range(f);
        Self::mask(lo, hi)
    }

    #[inline]
    fn add_into(&mut self, dst: R, x: Reg, y: Reg, f: Field) {
        let (lo, hi) = self.field_range(f);
        let mut out = self.reg(dst);
        if !self.dec {
            let (m, sh, n) = (Self::mask(lo, hi), 4 * lo, hi - lo + 1);
            let (s, over) = ((x.0 & m) >> sh).overflowing_add((y.0 & m) >> sh);
            self.carry = if n == 16 { over } else { s >> (4 * n) != 0 };
            out.0 = (out.0 & !m) | ((s << sh) & m);
            *self.reg_mut(dst) = out;
            return;
        }
        let mut c = 0u8;
        for i in lo..=hi {
            let t = x.nib(i) + y.nib(i) + c;
            if t < 10 {
                out.set_nib(i, t);
                c = 0;
            } else {
                out.set_nib(i, t - 10);
                c = 1;
            }
        }
        *self.reg_mut(dst) = out;
        self.carry = c != 0;
    }

    #[inline]
    fn sub_into(&mut self, dst: R, x: Reg, y: Reg, f: Field) {
        let (lo, hi) = self.field_range(f);
        let mut out = self.reg(dst);
        if !self.dec {
            let (m, sh) = (Self::mask(lo, hi), 4 * lo);
            let (d, borrow) = ((x.0 & m) >> sh).overflowing_sub((y.0 & m) >> sh);
            self.carry = borrow;
            out.0 = (out.0 & !m) | ((d << sh) & m);
            *self.reg_mut(dst) = out;
            return;
        }
        let mut c = 0i16;
        for i in lo..=hi {
            let t = i16::from(x.nib(i)) - i16::from(y.nib(i)) - c;
            if t >= 0 {
                out.set_nib(i, t as u8);
                c = 0;
            } else {
                out.set_nib(i, (t + 10) as u8);
                c = 1;
            }
        }
        *self.reg_mut(dst) = out;
        self.carry = c != 0;
    }

    /// Add `k` (1..=16) to the field, propagating carry; `base` 16 or 10.
    #[inline]
    fn add_const(&mut self, r: R, f: Field, k: u8, base: u8) {
        let (lo, hi) = self.field_range(f);
        let mut v = self.reg(r);
        if base == 16 {
            let (m, sh, n) = (Self::mask(lo, hi), 4 * lo, hi - lo + 1);
            let (s, over) = ((v.0 & m) >> sh).overflowing_add(u64::from(k));
            self.carry = if n == 16 { over } else { s >> (4 * n) != 0 };
            v.0 = (v.0 & !m) | ((s << sh) & m);
            *self.reg_mut(r) = v;
            return;
        }
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

    #[inline]
    fn sub_const(&mut self, r: R, f: Field, k: u8, base: u8) {
        let (lo, hi) = self.field_range(f);
        let mut v = self.reg(r);
        if base == 16 {
            let (m, sh) = (Self::mask(lo, hi), 4 * lo);
            let (d, borrow) = ((v.0 & m) >> sh).overflowing_sub(u64::from(k));
            self.carry = borrow;
            v.0 = (v.0 & !m) | ((d << sh) & m);
            *self.reg_mut(r) = v;
            return;
        }
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

    /// Branch or return when `cond` holds, setting carry to it. RTNYES
    /// (`goyes: None`) returns.
    #[inline]
    fn branch_if(&mut self, cond: bool, goyes: Option<u32>) {
        self.carry = cond;
        if cond {
            self.pc = match goyes {
                Some(t) => t,
                None => self.pop(),
            };
        }
    }

    #[inline]
    fn copy_field(&mut self, dst: R, src: Reg, f: Field) {
        let m = self.field_mask(f);
        let v = self.reg_mut(dst);
        v.0 = (v.0 & !m) | (src.0 & m);
    }

    #[inline]
    fn set_d(&mut self, d: u8, v: u32) {
        if d == 0 {
            self.d0 = v & 0xF_FFFF;
        } else {
            self.d1 = v & 0xF_FFFF;
        }
    }

    #[inline]
    fn get_d(&self, d: u8) -> u32 {
        if d == 0 {
            self.d0
        } else {
            self.d1
        }
    }

    // ------------------------------------------------------------ instructions
    //
    // One method per instruction. `exec` calls them for the interpreter, and
    // translated ROM code (crate hp48-rom) calls them directly with constant
    // operands. Instructions that use or change PC expect it to be past the
    // instruction already.

    /// RTN, RTNSXM, RTNSC, RTNCC, RTI.
    #[inline]
    pub fn rtn(&mut self, k: RtnKind) {
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
                    return;
                }
                self.interruptible = true;
            }
        }
        self.pc = self.pop();
    }

    /// RSTK=C
    #[inline]
    pub fn push_c(&mut self) {
        let v = self.c.a();
        self.push(v);
    }

    /// C=RSTK
    #[inline]
    pub fn pop_c(&mut self) {
        let v = self.pop();
        self.c.set_a(v);
    }

    /// CLRST
    #[inline]
    pub fn clr_st(&mut self) {
        self.st &= 0xF000;
    }

    /// C=ST
    #[inline]
    pub fn c_from_st(&mut self) {
        self.c.0 = (self.c.0 & !0xFFF) | u64::from(self.st & 0xFFF);
    }

    /// ST=C
    #[inline]
    pub fn st_from_c(&mut self) {
        self.st = (self.st & 0xF000) | (self.c.0 & 0xFFF) as u16;
    }

    /// CSTEX
    #[inline]
    pub fn c_st_ex(&mut self) {
        let old = self.st & 0xFFF;
        self.st = (self.st & 0xF000) | (self.c.0 & 0xFFF) as u16;
        self.c.0 = (self.c.0 & !0xFFF) | u64::from(old);
    }

    /// P=P+1
    #[inline]
    pub fn p_inc(&mut self) {
        self.carry = self.p == 15;
        self.p = (self.p + 1) & 0xF;
    }

    /// P=P-1
    #[inline]
    pub fn p_dec(&mut self) {
        self.carry = self.p == 0;
        self.p = self.p.wrapping_sub(1) & 0xF;
    }

    /// dst=dst&src
    #[inline]
    pub fn and(&mut self, dst: R, src: R, f: Field) {
        let (m, s) = (self.field_mask(f), self.reg(src).0);
        self.reg_mut(dst).0 &= s | !m;
    }

    /// dst=dst!src
    #[inline]
    pub fn or(&mut self, dst: R, src: R, f: Field) {
        let (m, s) = (self.field_mask(f), self.reg(src).0);
        self.reg_mut(dst).0 |= s & m;
    }

    /// Rn=r, r=Rn, rRnEX
    #[inline]
    pub fn scratch(&mut self, op: ScratchOp, r: R, n: u8, f: Field) {
        let (m, n) = (self.field_mask(f), usize::from(n));
        let (x, s) = (self.reg(r).0, self.r[n].0);
        if op != ScratchOp::FromScratch {
            self.r[n].0 = (s & !m) | (x & m);
        }
        if op != ScratchOp::ToScratch {
            self.reg_mut(r).0 = (x & !m) | (s & m);
        }
    }

    /// Dd=r (A field) or Dd=rS (low 4 nibbles).
    #[inline]
    pub fn d_from_r(&mut self, d: u8, r: R, short: bool) {
        let v = self.reg(r).a();
        let new = if short { (self.get_d(d) & 0xF_0000) | (v & 0xFFFF) } else { v };
        self.set_d(d, new);
    }

    /// rDdEX, rDdXS
    #[inline]
    pub fn d_ex_r(&mut self, d: u8, r: R, short: bool) {
        let rv = self.reg(r).a();
        let dv = self.get_d(d);
        if short {
            self.set_d(d, (dv & 0xF_0000) | (rv & 0xFFFF));
            self.reg_mut(r).set_a((rv & 0xF_0000) | (dv & 0xFFFF));
        } else {
            self.set_d(d, rv);
            self.reg_mut(r).set_a(dv);
        }
    }

    /// r=DATd f
    #[inline]
    pub fn load(&mut self, d: u8, r: R, f: Field, bus: &mut impl Bus) {
        let mut addr = self.get_d(d);
        let (lo, hi) = self.field_range(f);
        let mut v = self.reg(r);
        for i in lo..=hi {
            v.set_nib(i, bus.read(addr));
            addr = (addr + 1) & 0xF_FFFF;
        }
        *self.reg_mut(r) = v;
    }

    /// DATd=r f
    #[inline]
    pub fn store(&mut self, d: u8, r: R, f: Field, bus: &mut impl Bus) {
        let mut addr = self.get_d(d);
        let (lo, hi) = self.field_range(f);
        let v = self.reg(r);
        for i in lo..=hi {
            bus.write(addr, v.nib(i));
            addr = (addr + 1) & 0xF_FFFF;
        }
    }

    /// Cycles of a memory access over the field.
    #[inline]
    pub fn mem_cycles(&self, f: Field) -> u32 {
        let (lo, hi) = self.field_range(f);
        15 + (hi - lo) as u32
    }

    /// Dd=Dd+n
    #[inline]
    pub fn d_add(&mut self, d: u8, n: u8) {
        let v = self.get_d(d) + u32::from(n);
        self.carry = v > 0xF_FFFF;
        self.set_d(d, v);
    }

    /// Dd=Dd-n
    #[inline]
    pub fn d_sub(&mut self, d: u8, n: u8) {
        let cur = self.get_d(d);
        self.carry = cur < u32::from(n);
        self.set_d(d, cur.wrapping_sub(u32::from(n)));
    }

    /// Dd=(len) val
    #[inline]
    pub fn d_load(&mut self, d: u8, len: u8, val: u32) {
        let mask = (1u32 << (4 * u32::from(len))) - 1;
        let cur = self.get_d(d);
        self.set_d(d, (cur & !mask) | val);
    }

    /// LC / LA: `len` nibbles of `val` from nibble P on, wrapping.
    #[inline]
    pub fn load_const(&mut self, r: R, len: u8, val: u64) {
        let mut v = self.reg(r);
        for i in 0..usize::from(len) {
            let pos = (usize::from(self.p) + i) & 0xF;
            v.set_nib(pos, ((val >> (4 * i)) & 0xF) as u8);
        }
        *self.reg_mut(r) = v;
    }

    /// RTNC, RTNNC
    #[inline]
    pub fn rtn_if(&mut self, c: Cond) {
        if self.cond(c) {
            self.pc = self.pop();
        }
    }

    /// GOC, GONC
    #[inline]
    pub fn jump_if(&mut self, c: Cond, t: u32) {
        if self.cond(c) {
            self.pc = t;
        }
    }

    /// GOSUB and friends: PC must already be the return address.
    #[inline]
    pub fn call(&mut self, t: u32) {
        self.push(self.pc);
        self.pc = t;
    }

    /// ?r=s, ?r#0 ... with GOYES or RTNYES.
    #[inline]
    pub fn test(&mut self, t: Test, f: Field, goyes: Option<u32>) {
        let m = self.field_mask(f);
        let cond = match t {
            Test::Zero(r) => self.reg(r).0 & m == 0,
            Test::NonZero(r) => self.reg(r).0 & m != 0,
            Test::Regs(c, x, y) => {
                let (x, y) = (self.reg(x).0 & m, self.reg(y).0 & m);
                match c {
                    Cmp::Eq => x == y,
                    Cmp::Ne => x != y,
                    Cmp::Gt => x > y,
                    Cmp::Lt => x < y,
                    Cmp::Ge => x >= y,
                    Cmp::Le => x <= y,
                }
            }
        };
        self.branch_if(cond, goyes);
    }

    /// ?ST=1 n, ?ST=0 n
    #[inline]
    pub fn st_test(&mut self, bit: u8, set: bool, goyes: Option<u32>) {
        let r = ((self.st >> bit) & 1 != 0) == set;
        self.branch_if(r, goyes);
    }

    /// ?P= n, ?P# n
    #[inline]
    pub fn p_test(&mut self, n: u8, equal: bool, goyes: Option<u32>) {
        let r = (self.p == n) == equal;
        self.branch_if(r, goyes);
    }

    /// ?HS=0 mask
    #[inline]
    pub fn hs_test(&mut self, mask: u8, goyes: Option<u32>) {
        let r = self.hst & mask == 0;
        self.branch_if(r, goyes);
    }

    /// ?rBIT=1 n, ?rBIT=0 n
    #[inline]
    pub fn bit_test(&mut self, r: R, bit: u8, set: bool, goyes: Option<u32>) {
        let v = (self.reg(r).0 >> bit) & 1 != 0;
        self.branch_if(v == set, goyes);
    }

    /// rBIT=1 n, rBIT=0 n
    #[inline]
    pub fn bit_set(&mut self, r: R, bit: u8, set: bool) {
        let x = self.reg_mut(r);
        if set {
            x.0 |= 1 << bit;
        } else {
            x.0 &= !(1 << bit);
        }
    }

    /// OUT=CS
    #[inline]
    pub fn out_cs(&mut self) {
        self.out = (self.out & 0xFF0) | (self.c.0 & 0xF) as u16;
    }

    /// OUT=C
    #[inline]
    pub fn out_c(&mut self) {
        self.out = (self.c.0 & 0xFFF) as u16;
    }

    /// r=IN
    #[inline]
    pub fn input(&mut self, r: R, bus: &mut impl Bus) {
        self.input = bus.input(self.out);
        let inp = u64::from(self.input);
        let x = self.reg_mut(r);
        x.0 = (x.0 & !0xFFFF) | inp;
    }

    /// C=ID
    #[inline]
    pub fn c_id(&mut self, bus: &mut impl Bus) {
        let id = bus.chip_id();
        self.c.set_a(id);
    }

    /// RSI: PC must already be past it.
    #[inline]
    pub fn rsi(&mut self, bus: &mut impl Bus) {
        self.kbd_int_enabled = true;
        if bus.keys_down(self.out) {
            self.interrupt();
        }
    }

    /// SREQ?
    #[inline]
    pub fn sreq(&mut self) {
        self.c.set_nib(0, 0);
        self.hst &= !SR;
    }

    /// PC=(r)
    #[inline]
    pub fn pc_indirect(&mut self, r: R, bus: &mut impl Bus) {
        let a = self.reg(r).a();
        self.pc = (0..5).rev().fold(0u32, |acc, i| (acc << 4) | u32::from(bus.read((a + i) & 0xF_FFFF)));
    }

    /// C=C+P+1
    #[inline]
    pub fn c_plus_p1(&mut self) {
        let v = self.c.a() + u32::from(self.p) + 1;
        self.carry = v > 0xF_FFFF;
        self.c.set_a(v);
    }

    /// C=P n
    #[inline]
    pub fn c_from_p(&mut self, n: u8) {
        let p = self.p;
        self.c.set_nib(usize::from(n), p);
    }

    /// P=C n
    #[inline]
    pub fn p_from_c(&mut self, n: u8) {
        self.p = self.c.nib(usize::from(n));
    }

    /// CPEX n
    #[inline]
    pub fn cp_ex(&mut self, n: u8) {
        let old = self.p;
        self.p = self.c.nib(usize::from(n));
        self.c.set_nib(usize::from(n), old);
    }

    /// rSLC, rSRC
    #[inline]
    pub fn rotate(&mut self, r: R, left: bool) {
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

    /// rSRB
    #[inline]
    pub fn srb(&mut self, r: R) {
        let v = self.reg(r).0;
        if v & 1 != 0 {
            self.hst |= SB;
        }
        self.reg_mut(r).0 = v >> 1;
    }

    /// rSRB.F f
    #[inline]
    pub fn srb_field(&mut self, r: R, f: Field) {
        let (lo, hi) = self.field_range(f);
        let m = Self::mask(lo, hi);
        let v = self.reg(r).0;
        if (v >> (4 * lo)) & 1 != 0 {
            self.hst |= SB;
        }
        self.reg_mut(r).0 = (v & !m) | (((v & m) >> 1) & m);
    }

    /// r=r+n f (always hex)
    #[inline]
    pub fn add_con(&mut self, r: R, f: Field, n: u8) {
        self.add_const(r, f, n, 16);
    }

    /// r=r-n f (always hex)
    #[inline]
    pub fn sub_con(&mut self, r: R, f: Field, n: u8) {
        self.sub_const(r, f, n, 16);
    }

    /// PC=r
    #[inline]
    pub fn pc_from(&mut self, r: R) {
        self.pc = self.reg(r).a();
    }

    /// r=PC: PC must already be past it.
    #[inline]
    pub fn pc_to(&mut self, r: R) {
        let pc = self.pc;
        self.reg_mut(r).set_a(pc);
    }

    /// rPCEX: PC must already be past it.
    #[inline]
    pub fn pc_ex(&mut self, r: R) {
        let pc = self.pc;
        self.pc = self.reg(r).a();
        self.reg_mut(r).set_a(pc);
    }

    /// HS=0 mask
    #[inline]
    pub fn hst_clear(&mut self, m: u8) {
        self.hst &= !m;
    }

    /// ST=1 n, ST=0 n
    #[inline]
    pub fn st_set(&mut self, bit: u8, set: bool) {
        if set {
            self.st |= 1 << bit;
        } else {
            self.st &= !(1 << bit);
        }
    }

    /// dst=dst+src
    #[inline]
    pub fn add(&mut self, dst: R, src: R, f: Field) {
        let (x, y) = (self.reg(dst), self.reg(src));
        self.add_into(dst, x, y, f);
    }

    /// r=r+1
    #[inline]
    pub fn inc(&mut self, r: R, f: Field) {
        let base = self.base();
        self.add_const(r, f, 1, base);
    }

    /// r=r-1
    #[inline]
    pub fn dec(&mut self, r: R, f: Field) {
        let base = self.base();
        self.sub_const(r, f, 1, base);
    }

    /// dst=a-b
    #[inline]
    pub fn sub(&mut self, dst: R, a: R, b: R, f: Field) {
        let (x, y) = (self.reg(a), self.reg(b));
        self.sub_into(dst, x, y, f);
    }

    /// r=0
    #[inline]
    pub fn zero(&mut self, r: R, f: Field) {
        self.copy_field(r, Reg(0), f);
    }

    /// dst=src
    #[inline]
    pub fn copy(&mut self, dst: R, src: R, f: Field) {
        let s = self.reg(src);
        self.copy_field(dst, s, f);
    }

    /// abEX
    #[inline]
    pub fn exch(&mut self, a: R, b: R, f: Field) {
        let (x, y) = (self.reg(a), self.reg(b));
        self.copy_field(a, y, f);
        self.copy_field(b, x, f);
    }

    /// rSL
    #[inline]
    pub fn shl(&mut self, r: R, f: Field) {
        let m = self.field_mask(f);
        let v = self.reg_mut(r);
        v.0 = (v.0 & !m) | (((v.0 & m) << 4) & m);
    }

    /// rSR
    #[inline]
    pub fn shr(&mut self, r: R, f: Field) {
        let (lo, hi) = self.field_range(f);
        let m = Self::mask(lo, hi);
        let v = self.reg(r).0;
        if (v >> (4 * lo)) & 0xF != 0 {
            self.hst |= SB;
        }
        self.reg_mut(r).0 = (v & !m) | (((v & m) >> 4) & m);
    }

    /// r=-r
    #[inline]
    pub fn neg(&mut self, r: R, f: Field) {
        let x = self.reg(r);
        let nonzero = x.0 & self.field_mask(f) != 0;
        self.sub_into(r, Reg(0), x, f);
        self.carry = nonzero;
    }

    /// r=-r-1
    #[inline]
    pub fn not(&mut self, r: R, f: Field) {
        let (lo, hi) = self.field_range(f);
        if !self.dec {
            self.reg_mut(r).0 ^= Self::mask(lo, hi);
        } else {
            let mut v = self.reg(r);
            for i in lo..=hi {
                v.set_nib(i, 9u8.wrapping_sub(v.nib(i)) & 0xF);
            }
            *self.reg_mut(r) = v;
        }
        self.carry = false;
    }

    // ------------------------------------------------------------ execute

    /// Execute a decoded instruction whose PC has already been advanced
    /// past it. Returns the cycle count; `step` adds it to `cycles`.
    pub fn exec(&mut self, op: Op, len: u32, bus: &mut impl Bus) -> u32 {
        use Op::*;
        let cycles = op.cycles(len).unwrap_or_else(|| match op {
            Mem { f, .. } => self.mem_cycles(f),
            _ => unreachable!(),
        });
        match op {
            Rtn(k) => self.rtn(k),
            SetHex => self.dec = false,
            SetDec => self.dec = true,
            PushC => self.push_c(),
            PopC => self.pop_c(),
            ClrSt => self.clr_st(),
            CFromSt => self.c_from_st(),
            StFromC => self.st_from_c(),
            CStEx => self.c_st_ex(),
            PInc => self.p_inc(),
            PDec => self.p_dec(),
            Logic { and: true, dst, src, f } => self.and(dst, src, f),
            Logic { and: false, dst, src, f } => self.or(dst, src, f),
            Scratch { op, r, n, f } => self.scratch(op, r, n, f),
            DFromR { d, r, short } => self.d_from_r(d, r, short),
            DExR { d, r, short } => self.d_ex_r(d, r, short),
            Mem { store: false, d, r, f } => self.load(d, r, f, bus),
            Mem { store: true, d, r, f } => self.store(d, r, f, bus),
            DAdd { d, n } => self.d_add(d, n),
            DSub { d, n } => self.d_sub(d, n),
            DLoad { d, len, val } => self.d_load(d, len, val),
            PSet(n) => self.p = n,
            LoadConst { r, len, val } => self.load_const(r, len, val),
            CondRtn(c) => self.rtn_if(c),
            CondJump(c, t) => self.jump_if(c, t),
            Jump(t) => self.pc = t,
            Call(t) => self.call(t),
            Nop | BusCb | BusCc | BusCd | Illegal => {}
            Test { test, f, goyes } => self.test(test, f, goyes),
            StTest { bit, set, goyes } => self.st_test(bit, set, goyes),
            PTest { n, equal, goyes } => self.p_test(n, equal, goyes),
            HsTest { mask, goyes } => self.hs_test(mask, goyes),
            BitTest { r, bit, set, goyes } => self.bit_test(r, bit, set, goyes),
            BitSet { r, bit, set } => self.bit_set(r, bit, set),
            OutCs => self.out_cs(),
            OutC => self.out_c(),
            In(r) => self.input(r, bus),
            Uncnfg => bus.unconfig(self.c.a()),
            Config => bus.config(self.c.a()),
            CId => self.c_id(bus),
            Shutdn => self.shutdown = true,
            IntOn => self.kbd_int_enabled = true,
            IntOff => self.kbd_int_enabled = false,
            Rsi => self.rsi(bus),
            Sreq => self.sreq(),
            PcIndirect(r) => self.pc_indirect(r, bus),
            CPlusP1 => self.c_plus_p1(),
            Reset => bus.reset_config(),
            CFromP(n) => self.c_from_p(n),
            PFromC(n) => self.p_from_c(n),
            CpEx(n) => self.cp_ex(n),
            Rotate { r, left } => self.rotate(r, left),
            Srb(r) => self.srb(r),
            SrbField { r, f } => self.srb_field(r, f),
            AddCon { r, f, n } => self.add_con(r, f, n),
            SubCon { r, f, n } => self.sub_con(r, f, n),
            PcFrom(r) => self.pc_from(r),
            PcTo(r) => self.pc_to(r),
            PcEx(r) => self.pc_ex(r),
            HstClear(m) => self.hst_clear(m),
            StSet { bit, set } => self.st_set(bit, set),
            Add { dst, src, f } => self.add(dst, src, f),
            Inc { r, f } => self.inc(r, f),
            Dec { r, f } => self.dec(r, f),
            Sub { dst, a, b, f } => self.sub(dst, a, b, f),
            Zero { r, f } => self.zero(r, f),
            Copy { dst, src, f } => self.copy(dst, src, f),
            Exch { a, b, f } => self.exch(a, b, f),
            Shl { r, f } => self.shl(r, f),
            Shr { r, f } => self.shr(r, f),
            Neg { r, f } => self.neg(r, f),
            Not { r, f } => self.not(r, f),
        }
        cycles
    }

    #[inline]
    fn cond(&self, c: Cond) -> bool {
        match c {
            Cond::Carry => self.carry,
            Cond::NoCarry => !self.carry,
        }
    }
}
