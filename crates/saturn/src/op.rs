//! Instruction decoding and disassembly.
//!
//! Encodings follow HP's 1LT8 CPU specification (docs/cpu.txt §5.3.2).

use crate::reg::{Field, R};
use std::fmt;

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum RtnKind {
    Plain,
    SetXm,
    SetCarry,
    ClearCarry,
    Interrupt,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Cond {
    Carry,
    NoCarry,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Cmp {
    Eq,
    Ne,
    Gt,
    Lt,
    Ge,
    Le,
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Test {
    /// Compare two registers over the field.
    Regs(Cmp, R, R),
    Zero(R),
    NonZero(R),
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ScratchOp {
    ToScratch,
    FromScratch,
    Exchange,
}

/// One decoded instruction. Branch targets are absolute addresses.
/// `goyes: None` on a test means RTNYES.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Op {
    Rtn(RtnKind),
    SetHex,
    SetDec,
    PushC,
    PopC,
    ClrSt,
    CFromSt,
    StFromC,
    CStEx,
    PInc,
    PDec,
    Logic { and: bool, dst: R, src: R, f: Field },
    Scratch { op: ScratchOp, r: R, n: u8, f: Field },
    DFromR { d: u8, r: R, short: bool },
    DExR { d: u8, r: R, short: bool },
    Mem { store: bool, d: u8, r: R, f: Field },
    DAdd { d: u8, n: u8 },
    DSub { d: u8, n: u8 },
    DLoad { d: u8, len: u8, val: u32 },
    PSet(u8),
    /// LC / LA: `val` holds the constant's nibbles in instruction order.
    LoadConst { r: R, len: u8, val: u64 },
    CondRtn(Cond),
    CondJump(Cond, u32),
    Jump(u32),
    Call(u32),
    Nop,
    Test { test: Test, f: Field, goyes: Option<u32> },
    StTest { bit: u8, set: bool, goyes: Option<u32> },
    PTest { n: u8, equal: bool, goyes: Option<u32> },
    HsTest { mask: u8, goyes: Option<u32> },
    BitTest { r: R, bit: u8, set: bool, goyes: Option<u32> },
    BitSet { r: R, bit: u8, set: bool },
    OutCs,
    OutC,
    In(R),
    Uncnfg,
    Config,
    CId,
    Shutdn,
    IntOn,
    IntOff,
    Rsi,
    BusCb,
    BusCc,
    BusCd,
    Sreq,
    PcIndirect(R),
    CPlusP1,
    Reset,
    CFromP(u8),
    PFromC(u8),
    CpEx(u8),
    Rotate { r: R, left: bool },
    Srb(R),
    SrbField { r: R, f: Field },
    AddCon { r: R, f: Field, n: u8 },
    SubCon { r: R, f: Field, n: u8 },
    PcFrom(R),
    PcTo(R),
    PcEx(R),
    HstClear(u8),
    StSet { bit: u8, set: bool },
    Add { dst: R, src: R, f: Field },
    Inc { r: R, f: Field },
    Dec { r: R, f: Field },
    Sub { dst: R, a: R, b: R, f: Field },
    Zero { r: R, f: Field },
    Copy { dst: R, src: R, f: Field },
    Exch { a: R, b: R, f: Field },
    Shl { r: R, f: Field },
    Shr { r: R, f: Field },
    Neg { r: R, f: Field },
    Not { r: R, f: Field },
    Illegal,
}

/// Register pairs used by the arithmetic and test groups, indexed by t & 3.
const PAIRS: [(R, R); 4] = [(R::A, R::B), (R::B, R::C), (R::C, R::A), (R::D, R::C)];

fn signed(v: u32, bits: u32) -> i32 {
    let s = 32 - bits;
    ((v << s) as i32) >> s
}

fn rel(base: u32, off: u32, bits: u32) -> u32 {
    (base as i32).wrapping_add(signed(off, bits)) as u32 & 0xF_FFFF
}

/// Group C/D/E/F arithmetic operation selected by nibble `t`.
fn arith(group: u8, t: u8, f: Field) -> Op {
    let (x, y) = PAIRS[usize::from(t & 3)];
    let r = R::from_code(t);
    match (group, t >> 2) {
        // C: r=r+s, r=r+r, s=r+s, r=r-1
        (0, 0) => Op::Add { dst: x, src: y, f },
        (0, 1) => Op::Add { dst: r, src: r, f },
        (0, 2) => Op::Add { dst: y, src: x, f },
        (0, _) => Op::Dec { r, f },
        // D: r=0, r=s, s=r, rsEX
        (1, 0) => Op::Zero { r, f },
        (1, 1) => Op::Copy { dst: x, src: y, f },
        (1, 2) => Op::Copy { dst: y, src: x, f },
        (1, _) => Op::Exch { a: x, b: y, f },
        // E: r=r-s, r=r+1, s=s-r, r=s-r
        (2, 0) => Op::Sub { dst: x, a: x, b: y, f },
        (2, 1) => Op::Inc { r, f },
        (2, 2) => Op::Sub { dst: y, a: y, b: x, f },
        (2, _) => Op::Sub { dst: x, a: y, b: x, f },
        // F: rSL, rSR, r=-r, r=-r-1
        (_, 0) => Op::Shl { r, f },
        (_, 1) => Op::Shr { r, f },
        (_, 2) => Op::Neg { r, f },
        _ => Op::Not { r, f },
    }
}

fn test_op(group_b: bool, t: u8) -> Test {
    let (x, y) = PAIRS[usize::from(t & 3)];
    let r = R::from_code(t);
    if group_b {
        let cmp = [Cmp::Gt, Cmp::Lt, Cmp::Ge, Cmp::Le][usize::from(t >> 2)];
        Test::Regs(cmp, x, y)
    } else {
        match t >> 2 {
            0 => Test::Regs(Cmp::Eq, x, y),
            1 => Test::Regs(Cmp::Ne, x, y),
            2 => Test::Zero(r),
            _ => Test::NonZero(r),
        }
    }
}

/// Decode the instruction at `pc`. Returns the op and its length in nibbles.
pub fn decode(pc: u32, mut fetch: impl FnMut(u32) -> u8) -> (Op, u32) {
    let mut n = |i: u32| fetch((pc + i) & 0xF_FFFF);
    let val = |n: &mut dyn FnMut(u32) -> u8, start: u32, count: u32| -> u32 {
        (0..count).rev().fold(0u32, |acc, i| (acc << 4) | u32::from(n(start + i)))
    };
    // Tests carry a 2-nibble GOYES/RTNYES offset relative to its own address.
    let goyes = |n: &mut dyn FnMut(u32) -> u8, at: u32| -> Option<u32> {
        let off = val(n, at, 2);
        (off != 0).then(|| rel(pc + at, off, 8))
    };

    let o0 = n(0);
    match o0 {
        0x0 => {
            let o1 = n(1);
            let op = match o1 {
                0x0 => Op::Rtn(RtnKind::SetXm),
                0x1 => Op::Rtn(RtnKind::Plain),
                0x2 => Op::Rtn(RtnKind::SetCarry),
                0x3 => Op::Rtn(RtnKind::ClearCarry),
                0x4 => Op::SetHex,
                0x5 => Op::SetDec,
                0x6 => Op::PushC,
                0x7 => Op::PopC,
                0x8 => Op::ClrSt,
                0x9 => Op::CFromSt,
                0xA => Op::StFromC,
                0xB => Op::CStEx,
                0xC => Op::PInc,
                0xD => Op::PDec,
                0xF => Op::Rtn(RtnKind::Interrupt),
                _ => {
                    let f = Field::from_code_a(n(2));
                    let t = n(3);
                    let (dst, src) = [
                        (R::A, R::B),
                        (R::B, R::C),
                        (R::C, R::A),
                        (R::D, R::C),
                        (R::B, R::A),
                        (R::C, R::B),
                        (R::A, R::C),
                        (R::C, R::D),
                    ][usize::from(t & 7)];
                    return (Op::Logic { and: t < 8, dst, src, f }, 4);
                }
            };
            (op, 2)
        }
        0x1 => {
            let o1 = n(1);
            match o1 {
                0x0..=0x2 => {
                    let s = n(2);
                    let r = if s & 8 != 0 { R::C } else { R::A };
                    let reg = if s & 7 < 5 { s & 7 } else { (s & 7) - 4 };
                    let op = [ScratchOp::ToScratch, ScratchOp::FromScratch, ScratchOp::Exchange][usize::from(o1)];
                    (Op::Scratch { op, r, n: reg, f: Field::W }, 3)
                }
                0x3 => {
                    let t = n(2);
                    let d = t & 1;
                    let r = if t & 4 != 0 { R::C } else { R::A };
                    let short = t & 8 != 0;
                    let op = if t & 2 != 0 { Op::DExR { d, r, short } } else { Op::DFromR { d, r, short } };
                    (op, 3)
                }
                0x4 => {
                    let t = n(2);
                    let f = if t & 8 != 0 { Field::B } else { Field::A };
                    (mem_op(t & 7, f), 3)
                }
                0x5 => {
                    let t = n(2);
                    let x = n(3);
                    let f = if t & 8 != 0 { Field::Nibbles(x + 1) } else { Field::from_code(x) };
                    (mem_op(t & 7, f), 4)
                }
                0x6 => (Op::DAdd { d: 0, n: n(2) + 1 }, 3),
                0x7 => (Op::DAdd { d: 1, n: n(2) + 1 }, 3),
                0x8 => (Op::DSub { d: 0, n: n(2) + 1 }, 3),
                0xC => (Op::DSub { d: 1, n: n(2) + 1 }, 3),
                _ => {
                    let d = if o1 < 0xC { 0 } else { 1 };
                    let len = match o1 & 3 {
                        1 => 2,
                        2 => 4,
                        _ => 5,
                    };
                    let v = val(&mut n, 2, u32::from(len));
                    (Op::DLoad { d, len, val: v }, 2 + u32::from(len))
                }
            }
        }
        0x2 => (Op::PSet(n(1)), 2),
        0x3 => {
            let len = n(1) + 1;
            let v = (0..u32::from(len)).rev().fold(0u64, |a, i| (a << 4) | u64::from(n(2 + i)));
            (Op::LoadConst { r: R::C, len, val: v }, 2 + u32::from(len))
        }
        0x4 | 0x5 => {
            let cond = if o0 == 4 { Cond::Carry } else { Cond::NoCarry };
            let off = val(&mut n, 1, 2);
            let op = match (off, cond) {
                (0, _) => Op::CondRtn(cond),
                (2, Cond::Carry) => Op::Nop,
                _ => Op::CondJump(cond, rel(pc + 1, off, 8)),
            };
            (op, 3)
        }
        0x6 => {
            let off = val(&mut n, 1, 3);
            match off {
                3 => (Op::Nop, 4),
                4 => (Op::Nop, 5),
                _ => (Op::Jump(rel(pc + 1, off, 12)), 4),
            }
        }
        0x7 => {
            let off = val(&mut n, 1, 3);
            (Op::Call(rel(pc + 4, off, 12)), 4)
        }
        0x8 => decode8(pc, &mut n),
        0x9 => {
            let f = n(1);
            let t = n(2);
            let g = goyes(&mut n, 3);
            (Op::Test { test: test_op(f >= 8, t), f: Field::from_code(f), goyes: g }, 5)
        }
        0xA | 0xB => {
            let f = n(1);
            let t = n(2);
            let group = (o0 - 0xA) * 2 + u8::from(f >= 8);
            (arith(group, t, Field::from_code(f)), 3)
        }
        _ => (arith(o0 - 0xC, n(1), Field::A), 2),
    }
}

fn mem_op(t: u8, f: Field) -> Op {
    let d = t & 1;
    let r = if t & 4 != 0 { R::C } else { R::A };
    Op::Mem { store: t & 2 == 0, d, r, f }
}

fn decode8(pc: u32, n: &mut dyn FnMut(u32) -> u8) -> (Op, u32) {
    let val = |n: &mut dyn FnMut(u32) -> u8, start: u32, count: u32| -> u32 {
        (0..count).rev().fold(0u32, |acc, i| (acc << 4) | u32::from(n(start + i)))
    };
    let goyes = |n: &mut dyn FnMut(u32) -> u8, at: u32| -> Option<u32> {
        let off = val(n, at, 2);
        (off != 0).then(|| rel(pc + at, off, 8))
    };
    let o1 = n(1);
    match o1 {
        0x0 => {
            let o2 = n(2);
            let op = match o2 {
                0x0 => Op::OutCs,
                0x1 => Op::OutC,
                0x2 => Op::In(R::A),
                0x3 => Op::In(R::C),
                0x4 => Op::Uncnfg,
                0x5 => Op::Config,
                0x6 => Op::CId,
                0x7 => Op::Shutdn,
                0x9 => Op::CPlusP1,
                0xA => Op::Reset,
                0xB => Op::BusCc,
                0xE => Op::Sreq,
                0xC => return (Op::CFromP(n(3)), 4),
                0xD => return (Op::PFromC(n(3)), 4),
                0xF => return (Op::CpEx(n(3)), 4),
                _ => return decode808(pc, n),
            };
            (op, 3)
        }
        0x1 => {
            let o2 = n(2);
            match o2 {
                0x0..=0x7 => (Op::Rotate { r: R::from_code(o2), left: o2 < 4 }, 3),
                0xC..=0xF => (Op::Srb(R::from_code(o2)), 3),
                0x8 => {
                    let f = Field::from_code_a(n(3));
                    let rn = n(4);
                    let c = n(5) + 1;
                    let r = R::from_code(rn);
                    let op = if rn & 8 != 0 { Op::SubCon { r, f, n: c } } else { Op::AddCon { r, f, n: c } };
                    (op, 6)
                }
                0x9 => (Op::SrbField { r: R::from_code(n(4)), f: Field::from_code_a(n(3)) }, 5),
                0xA => {
                    let f = Field::from_code_a(n(3));
                    let k = n(4);
                    let s = n(5);
                    let r = if s & 8 != 0 { R::C } else { R::A };
                    let reg = if s & 7 < 5 { s & 7 } else { (s & 7) - 4 };
                    let op = match k {
                        0 => ScratchOp::ToScratch,
                        1 => ScratchOp::FromScratch,
                        2 => ScratchOp::Exchange,
                        _ => return (Op::Illegal, 6),
                    };
                    (Op::Scratch { op, r, n: reg, f }, 6)
                }
                _ => {
                    let op = match n(3) {
                        2 => Op::PcFrom(R::A),
                        3 => Op::PcFrom(R::C),
                        4 => Op::PcTo(R::A),
                        5 => Op::PcTo(R::C),
                        6 => Op::PcEx(R::A),
                        7 => Op::PcEx(R::C),
                        _ => Op::Illegal,
                    };
                    (op, 4)
                }
            }
        }
        0x2 => (Op::HstClear(n(2)), 3),
        0x3 => (Op::HsTest { mask: n(2), goyes: goyes(n, 3) }, 5),
        0x4 | 0x5 => (Op::StSet { bit: n(2), set: o1 == 5 }, 3),
        0x6 | 0x7 => (Op::StTest { bit: n(2), set: o1 == 7, goyes: goyes(n, 3) }, 5),
        0x8 | 0x9 => (Op::PTest { n: n(2), equal: o1 == 9, goyes: goyes(n, 3) }, 5),
        0xA | 0xB => {
            let t = n(2);
            (Op::Test { test: test_op(o1 == 0xB, t), f: Field::A, goyes: goyes(n, 3) }, 5)
        }
        0xC => (Op::Jump(rel(pc + 2, val(n, 2, 4), 16)), 6),
        0xD => (Op::Jump(val(n, 2, 5)), 7),
        0xE => (Op::Call(rel(pc + 6, val(n, 2, 4), 16)), 6),
        _ => (Op::Call(val(n, 2, 5)), 7),
    }
}

fn decode808(pc: u32, n: &mut dyn FnMut(u32) -> u8) -> (Op, u32) {
    let goyes = |n: &mut dyn FnMut(u32) -> u8, at: u32| -> Option<u32> {
        let off = u32::from(n(at)) | (u32::from(n(at + 1)) << 4);
        (off != 0).then(|| rel(pc + at, off, 8))
    };
    match n(3) {
        0x0 => (Op::IntOn, 4),
        0x1 => (if n(4) == 0 { Op::Rsi } else { Op::Illegal }, 5),
        0x2 => {
            let len = n(4) + 1;
            let v = (0..u32::from(len)).rev().fold(0u64, |a, i| (a << 4) | u64::from(n(5 + i)));
            (Op::LoadConst { r: R::A, len, val: v }, 5 + u32::from(len))
        }
        0x3 => (Op::BusCb, 4),
        o @ 0x4..=0x5 => (Op::BitSet { r: R::A, bit: n(4), set: o == 5 }, 5),
        o @ 0x6..=0x7 => (Op::BitTest { r: R::A, bit: n(4), set: o == 7, goyes: goyes(n, 5) }, 7),
        o @ 0x8..=0x9 => (Op::BitSet { r: R::C, bit: n(4), set: o == 9 }, 5),
        o @ 0xA..=0xB => (Op::BitTest { r: R::C, bit: n(4), set: o == 0xB, goyes: goyes(n, 5) }, 7),
        0xC => (Op::PcIndirect(R::A), 4),
        0xD => (Op::BusCd, 4),
        0xE => (Op::PcIndirect(R::C), 4),
        _ => (Op::IntOff, 4),
    }
}

// ---------------------------------------------------------------- display

fn yes(f: &mut fmt::Formatter<'_>, g: &Option<u32>) -> fmt::Result {
    match g {
        Some(t) => write!(f, " / GOYES #{t:05X}"),
        None => write!(f, " / RTNYES"),
    }
}

impl fmt::Display for Op {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        use Op::*;
        match *self {
            Rtn(k) => f.write_str(match k {
                RtnKind::Plain => "RTN",
                RtnKind::SetXm => "RTNSXM",
                RtnKind::SetCarry => "RTNSC",
                RtnKind::ClearCarry => "RTNCC",
                RtnKind::Interrupt => "RTI",
            }),
            SetHex => f.write_str("SETHEX"),
            SetDec => f.write_str("SETDEC"),
            PushC => f.write_str("RSTK=C"),
            PopC => f.write_str("C=RSTK"),
            ClrSt => f.write_str("CLRST"),
            CFromSt => f.write_str("C=ST"),
            StFromC => f.write_str("ST=C"),
            CStEx => f.write_str("CSTEX"),
            PInc => f.write_str("P=P+1"),
            PDec => f.write_str("P=P-1"),
            Logic { and, dst, src, f: fl } => {
                write!(f, "{dst}={dst}{}{src} {fl}", if and { "&" } else { "!" })
            }
            Scratch { op, r, n, f: fl } => {
                let sfx = if fl == Field::W { String::new() } else { format!(".F {fl}") };
                match op {
                    ScratchOp::ToScratch => write!(f, "R{n}={r}{sfx}"),
                    ScratchOp::FromScratch => write!(f, "{r}=R{n}{sfx}"),
                    ScratchOp::Exchange => write!(f, "{r}R{n}EX{sfx}"),
                }
            }
            DFromR { d, r, short } => write!(f, "D{d}={r}{}", if short { "S" } else { "" }),
            DExR { d, r, short } => write!(f, "{r}D{d}{}", if short { "XS" } else { "EX" }),
            Mem { store, d, r, f: fl } => {
                if store {
                    write!(f, "DAT{d}={r} {fl}")
                } else {
                    write!(f, "{r}=DAT{d} {fl}")
                }
            }
            DAdd { d, n } => write!(f, "D{d}=D{d}+ {n}"),
            DSub { d, n } => write!(f, "D{d}=D{d}- {n}"),
            DLoad { d, len, val } => write!(f, "D{d}=({len}) #{val:0w$X}", w = usize::from(len)),
            PSet(n) => write!(f, "P= {n}"),
            LoadConst { r, len, val } => write!(f, "L{r}({len}) #{val:0w$X}", w = usize::from(len)),
            CondRtn(Cond::Carry) => f.write_str("RTNC"),
            CondRtn(Cond::NoCarry) => f.write_str("RTNNC"),
            CondJump(Cond::Carry, t) => write!(f, "GOC #{t:05X}"),
            CondJump(Cond::NoCarry, t) => write!(f, "GONC #{t:05X}"),
            Jump(t) => write!(f, "GOTO #{t:05X}"),
            Call(t) => write!(f, "GOSUB #{t:05X}"),
            Nop => f.write_str("NOP"),
            Test { test, f: fl, goyes } => {
                match test {
                    self::Test::Regs(c, x, y) => {
                        let s = match c {
                            Cmp::Eq => "=",
                            Cmp::Ne => "#",
                            Cmp::Gt => ">",
                            Cmp::Lt => "<",
                            Cmp::Ge => ">=",
                            Cmp::Le => "<=",
                        };
                        write!(f, "?{x}{s}{y} {fl}")?
                    }
                    self::Test::Zero(r) => write!(f, "?{r}=0 {fl}")?,
                    self::Test::NonZero(r) => write!(f, "?{r}#0 {fl}")?,
                }
                yes(f, &goyes)
            }
            StTest { bit, set, goyes } => {
                write!(f, "?ST={} {bit}", u8::from(set))?;
                yes(f, &goyes)
            }
            PTest { n, equal, goyes } => {
                write!(f, "?P{} {n}", if equal { "=" } else { "#" })?;
                yes(f, &goyes)
            }
            HsTest { mask, goyes } => {
                write!(f, "?HST=0 {mask}")?;
                yes(f, &goyes)
            }
            BitTest { r, bit, set, goyes } => {
                write!(f, "?{r}BIT={} {bit}", u8::from(set))?;
                yes(f, &goyes)
            }
            BitSet { r, bit, set } => write!(f, "{r}BIT={} {bit}", u8::from(set)),
            OutCs => f.write_str("OUT=CS"),
            OutC => f.write_str("OUT=C"),
            In(r) => write!(f, "{r}=IN"),
            Uncnfg => f.write_str("UNCNFG"),
            Config => f.write_str("CONFIG"),
            CId => f.write_str("C=ID"),
            Shutdn => f.write_str("SHUTDN"),
            IntOn => f.write_str("INTON"),
            IntOff => f.write_str("INTOFF"),
            Rsi => f.write_str("RSI"),
            BusCb => f.write_str("BUSCB"),
            BusCc => f.write_str("BUSCC"),
            BusCd => f.write_str("BUSCD"),
            Sreq => f.write_str("SREQ?"),
            PcIndirect(r) => write!(f, "PC=({r})"),
            CPlusP1 => f.write_str("C+P+1"),
            Reset => f.write_str("RESET"),
            CFromP(n) => write!(f, "C=P {n}"),
            PFromC(n) => write!(f, "P=C {n}"),
            CpEx(n) => write!(f, "CPEX {n}"),
            Rotate { r, left } => write!(f, "{r}S{}C", if left { "L" } else { "R" }),
            Srb(r) => write!(f, "{r}SRB"),
            SrbField { r, f: fl } => write!(f, "{r}SRB.F {fl}"),
            AddCon { r, f: fl, n } => write!(f, "{r}={r}+CON {fl},{n}"),
            SubCon { r, f: fl, n } => write!(f, "{r}={r}-CON {fl},{n}"),
            PcFrom(r) => write!(f, "PC={r}"),
            PcTo(r) => write!(f, "{r}=PC"),
            PcEx(r) => write!(f, "{r}PCEX"),
            HstClear(m) => match m {
                1 => f.write_str("XM=0"),
                2 => f.write_str("SB=0"),
                4 => f.write_str("SR=0"),
                8 => f.write_str("MP=0"),
                0xF => f.write_str("CLRHST"),
                _ => write!(f, "HST=0 {m}"),
            },
            StSet { bit, set } => write!(f, "ST={} {bit}", u8::from(set)),
            Add { dst, src, f: fl } => write!(f, "{dst}={dst}+{src} {fl}"),
            Inc { r, f: fl } => write!(f, "{r}={r}+1 {fl}"),
            Dec { r, f: fl } => write!(f, "{r}={r}-1 {fl}"),
            Sub { dst, a, b, f: fl } => write!(f, "{dst}={a}-{b} {fl}"),
            Zero { r, f: fl } => write!(f, "{r}=0 {fl}"),
            Copy { dst, src, f: fl } => write!(f, "{dst}={src} {fl}"),
            Exch { a, b, f: fl } => write!(f, "{a}{b}EX {fl}"),
            Shl { r, f: fl } => write!(f, "{r}SL {fl}"),
            Shr { r, f: fl } => write!(f, "{r}SR {fl}"),
            Neg { r, f: fl } => write!(f, "{r}=-{r} {fl}"),
            Not { r, f: fl } => write!(f, "{r}=-{r}-1 {fl}"),
            Illegal => f.write_str("??"),
        }
    }
}
