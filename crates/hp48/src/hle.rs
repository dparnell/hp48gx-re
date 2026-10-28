//! High-level emulation: native Rust replacements for ROM routines.
//!
//! Each native reproduces the routine's complete effect on the machine (all
//! registers, flags, P, memory), not just its documented result, so it can
//! be swapped in transparently. [`verify`] checks a native against the ROM
//! code it replaces by running both from the same state.
//!
//! This is the path from emulating the ROM to translating it: routines move
//! here one at a time, each checked against the original.

use crate::hardware::Hardware;
use crate::machine::{Jump, Machine, Native};
use crate::memory::ModuleKind;
use saturn::cpu::SB;
use saturn::{Bus, Cpu, Reg};

/// `MUL#` (#03991): B.A = A.A * C.A by shift-and-add.
///
/// Returns with carry set on 20-bit overflow, leaving A and C part-shifted
/// exactly as the loop left them; otherwise carry is clear.
pub fn mul_bint(cpu: &mut Cpu, _hw: &mut Hardware) {
    const MASK: u32 = 0xF_FFFF;
    let mut a = cpu.a.a();
    let mut c = cpu.c.a();
    let mut b = 0u32;
    let carry = loop {
        if a == 0 {
            break false;
        }
        if c & 1 != 0 {
            b += a;
            if b > MASK {
                b &= MASK;
                break true;
            }
            c &= !1;
        }
        if c == 0 {
            break false;
        }
        c >>= 1;
        a <<= 1;
        if a > MASK {
            a &= MASK;
            break true;
        }
    };
    cpu.a.set_a(a);
    cpu.b.set_a(b);
    cpu.c.set_a(c);
    cpu.carry = carry;
}

/// `DIV5` (#06A8E): C.A = C.A / 5 (rounded down).
///
/// Works in the 11-nibble WP field with P=10: C*0x333334 / 16^6. Leaves
/// 3*C in A(WP), C.A in D(WP), P=0, carry clear, and sets SB if a non-zero
/// nibble was shifted out.
pub fn div5(cpu: &mut Cpu, _hw: &mut Hardware) {
    const WP: u64 = (1 << 44) - 1; // nibbles 0-10
    let c0 = u64::from(cpu.c.a());
    let three = (3 * c0) & WP;
    let mut c = three;
    for _ in 0..5 {
        c = ((c << 4) & WP) + three;
        c &= WP;
    }
    c = (c + c0) & WP;
    if c & 0xFF_FFFF != 0 {
        cpu.hst |= SB;
    }
    c >>= 24;
    let keep = |r: Reg, v: u64| Reg((r.0 & !WP) | v);
    cpu.a = keep(cpu.a, three);
    cpu.c = keep(cpu.c, c);
    cpu.d = keep(cpu.d, c0);
    cpu.p = 0;
    cpu.carry = false;
}

// ------------------------------------------------------------ RPL inner loop
//
// RPL keeps its state in CPU registers: D0 is the instruction pointer (the
// next word of the runstream), B.A the top of the return stack, D1 the data
// stack pointer and D.A the free room in 5-nibble words. Every primitive ends
// with NEXT (`A=DAT0 A; D0=D0+5; PC=(A)`): fetch the next object pointer
// and jump through its first word, which is the object's prolog (or, for a
// primitive code object, its body).
//
// These natives replace NEXT and the prologs that only move pointers. Each
// does what its ROM code does to registers, carry, memory and the CRC (data
// reads in the same order), and declines where the ROM would take a slow
// path: garbage collection when D runs out, or decimal mode.

const MASK: u32 = 0xF_FFFF;

/// `A=DAT0 A; D0=D0+5; PC=(A)`.
const NEXT_CODE: &str = "142164808C";
/// DOBINT, DOREAL, ... DOEXT4: `D=D-1 A; HST=0 0; GOC gc; D1=D1-5;
/// DAT1=A A`, then NEXT.
const PUSH_CODE: &str = "CF8204??1C4141142164808C";
/// DOCOL (#02D9D): `D=D-1 A; HST=0 0; GOC gc; C=B A; CD0EX; DAT0=C A;
/// D0=D0+5; AD0EX; B=A A; D0=D0+5`, then NEXT.
const DOCOL_CODE: &str = "CF820427D9136144164132D8164142164808C";
/// The body of SEMI (#03130): `C=B A; CD0EX; D0=D0-5; A=DAT0 A; AD0EX;
/// B=A A; D=D+1 A`, then NEXT.
const SEMI_CODE: &str = "D9136184142132D8E7142164808C";

const NEXT_CYCLES: u32 = 19 + 5 + 23;
const PUSH_CYCLES: u32 = 4 + 5 + 5 + 5 + 19 + NEXT_CYCLES;
const SEMI_CYCLES: u32 = 4 + 5 + 5 + 19 + 5 + 4 + 4 + NEXT_CYCLES;

/// Does the code at `addr` match `hex` (nibbles in address order, `?` for
/// any nibble)?
fn code_at(hw: &mut Hardware, addr: u32, hex: &str) -> bool {
    hex.chars().zip(addr..).all(|(h, a)| h == '?' || h.to_digit(16) == Some(u32::from(hw.fetch(a & MASK))))
}

/// Read 5 nibbles as `A=DAT0 A` does: from the lowest address up.
fn read_a(hw: &mut Hardware, addr: u32) -> u32 {
    (0..5).fold(0, |v, i| v | u32::from(hw.read((addr + i) & MASK)) << (4 * i))
}

/// Read the target of `PC=(A)`, which reads from the highest address down.
fn read_pc(hw: &mut Hardware, addr: u32) -> u32 {
    (0..5).rev().fold(0, |v, i| (v << 4) | u32::from(hw.read((addr + i) & MASK)))
}

fn write_a(hw: &mut Hardware, addr: u32, v: u32) {
    for i in 0..5 {
        hw.write((addr + i) & MASK, ((v >> (4 * i)) & 0xF) as u8);
    }
}

/// NEXT, run natively; returns its cycles.
fn next(cpu: &mut Cpu, hw: &mut Hardware) -> u32 {
    let ob = read_a(hw, cpu.d0);
    cpu.a.set_a(ob);
    let d0 = cpu.d0 + 5;
    cpu.carry = d0 > MASK;
    cpu.d0 = d0 & MASK;
    cpu.pc = read_pc(hw, ob);
    NEXT_CYCLES
}

/// NEXT at any address that holds its code.
pub fn next_site(cpu: &mut Cpu, hw: &mut Hardware) -> Option<u32> {
    code_at(hw, cpu.pc, NEXT_CODE).then(|| next(cpu, hw))
}

/// A prolog that pushes its object (A.A) on the data stack.
pub fn push_prolog(cpu: &mut Cpu, hw: &mut Hardware) -> Option<u32> {
    let room = cpu.d.a();
    if cpu.dec || room == 0 {
        return None;
    }
    cpu.d.set_a(room - 1);
    cpu.d1 = cpu.d1.wrapping_sub(5) & MASK;
    write_a(hw, cpu.d1, cpu.a.a());
    Some(PUSH_CYCLES - NEXT_CYCLES + next(cpu, hw))
}

/// DOCOL: push the instruction pointer on the return stack and run the
/// secondary's body.
pub fn docol(cpu: &mut Cpu, hw: &mut Hardware) -> Option<u32> {
    let room = cpu.d.a();
    if cpu.dec || room == 0 {
        return None;
    }
    cpu.d.set_a(room - 1);
    Some(4 + 5 + 5 + enter_secondary(cpu, hw))
}

/// The common tail of DOCOL and an embedded secondary, from `C=B A`: push
/// D0 on the return stack, then NEXT in the body of the secondary at A.A.
fn enter_secondary(cpu: &mut Cpu, hw: &mut Hardware) -> u32 {
    let (ip, top) = (cpu.d0, cpu.b.a());
    cpu.c.set_a(ip);
    write_a(hw, top, ip);
    let top = (top + 5) & MASK;
    cpu.d0 = (cpu.a.a() + 5) & MASK;
    cpu.a.set_a(top);
    cpu.b.set_a(top);
    4 + 5 + 19 + 5 + 5 + 4 + 5 + next(cpu, hw)
}

/// SEMI: pop the instruction pointer from the return stack.
pub fn semi(cpu: &mut Cpu, hw: &mut Hardware) -> Option<u32> {
    if cpu.dec {
        return None;
    }
    cpu.c.set_a(cpu.d0);
    let top = cpu.b.a().wrapping_sub(5) & MASK;
    cpu.d0 = read_a(hw, top);
    cpu.a.set_a(top);
    cpu.b.set_a(top);
    cpu.d.set_a((cpu.d.a() + 1) & MASK);
    Some(SEMI_CYCLES - NEXT_CYCLES + next(cpu, hw))
}

// ------------------------------------------------------------ embedded objects
//
// An object can sit inside a secondary instead of being pointed to. NEXT then
// fetches its prolog address and jumps through the prolog's first word,
// whose code nibbles `CF820` read as #028FC: PRLG. PRLG jumps through the
// word 10 nibbles before the prolog, the type's handler for an embedded
// object. The handler pushes the object (or runs it, for a secondary) and
// continues after it. The word 5 nibbles before the prolog is the type's
// handler in SKIPOB, which skips an object of any type.

const PRLG: u32 = 0x028FC;
const SEMI_BODY: u32 = 0x03130;

/// PRLG (#028FC): `LC(2) #0A; A=A-C B; PC=(A)`.
const PRLG_CODE: &str = "31A0B6A808C";
/// Handlers of embedded objects of fixed size: `D0=D0-5; AD0EX; D0=A`, one
/// or more `D0=D0+n`, then the push and NEXT of a prolog.
const BINT_CODE: &str = "184132130169CF4A51C4141142164808C";
const REAL_CODE: &str = "18413213016416FCF4631C4141142164808C";
const EREL_CODE: &str = "18413213016916FCF4211C4141142164808C";
const CMP_CODE: &str = "18413213016416F16FCF47E1C4141142164808C";
const ECMP_CODE: &str = "18413213016E16F16FCF40C1C4141142164808C";
const CHAR_CODE: &str = "184132130166CF4F91C4141142164808C";
/// Objects with a length field (strings, arrays, grobs, ...): `C=DAT0 A;
/// D0=D0-5; AD0EX; C=C+A A; D0=C; D0=D0+5`, then push and NEXT.
const LENGTH_CODE: &str = "146184132C2134164CF4A31C4141142164808C";
/// Composites (lists, symbolics, ...): `D0=D0-5; CD0EX; D0=C; RSTK=C;
/// GOSUB SKIPOB; C=RSTK; A=C A`, then push and NEXT.
const COMPOSITE_CODE: &str = "1841361340670E207DACF4211C4141142164808C";
/// A secondary: skipped as a composite, then entered as by DOCOL.
const SECONDARY_CODE: &str = "184136134067A2207DACF4F1D9136144164132D8164142164808C";
/// SKIPOB (#03019) and its type handlers, up to the tagged-object handler.
const SKIPOB_CODE: &str = "84113706D90620D18718014216413114334CF8208A6C01C4133808C34031308A670CD4218ADAC07D5071350318451FE554B16F16F5ED16F16416F1645FC16559C146132C21345BBD214EC6132C213416156A1841321301641F117081478A6E014616CA3E59F1621468AA1A132C2134D214E8AAF0C6132C21341611616C1FD214EC6132C2134161660F";

/// PRLG: jump to the embedded-object handler of the prolog at A.A.
pub fn prlg(cpu: &mut Cpu, hw: &mut Hardware) -> Option<u32> {
    if cpu.dec || cpu.p != 0 {
        return None;
    }
    cpu.c.0 = (cpu.c.0 & !0xFF) | 0x0A;
    let low = cpu.a.0 & 0xFF;
    cpu.carry = low < 0x0A;
    cpu.a.0 = (cpu.a.0 & !0xFF) | (low.wrapping_sub(0x0A) & 0xFF);
    cpu.pc = read_pc(hw, cpu.a.a());
    Some(6 + 5 + 23)
}

/// Push the object at A.A and NEXT: the end of every embedded handler.
fn push_and_next(cpu: &mut Cpu, hw: &mut Hardware) -> u32 {
    cpu.d.set_a(cpu.d.a() - 1);
    cpu.d1 = cpu.d1.wrapping_sub(5) & MASK;
    write_a(hw, cpu.d1, cpu.a.a());
    4 + 5 + 5 + 19 + next(cpu, hw)
}

/// An embedded object of `SIZE` nibbles, skipped with `ADDS` additions to D0.
pub fn embedded<const SIZE: u32, const ADDS: u32>(cpu: &mut Cpu, hw: &mut Hardware) -> Option<u32> {
    if cpu.dec || cpu.d.a() == 0 {
        return None;
    }
    let ob = cpu.d0.wrapping_sub(5) & MASK;
    cpu.a.set_a(ob);
    cpu.d0 = (ob + SIZE) & MASK;
    Some(5 + 5 + 5 + 5 * ADDS + push_and_next(cpu, hw))
}

/// An embedded object with a length field after its prolog.
pub fn embedded_length(cpu: &mut Cpu, hw: &mut Hardware) -> Option<u32> {
    if cpu.dec || cpu.d.a() == 0 {
        return None;
    }
    let len = read_a(hw, cpu.d0);
    let ob = cpu.d0.wrapping_sub(5) & MASK;
    let end = (len + ob) & MASK;
    cpu.c.set_a(end);
    cpu.a.set_a(ob);
    cpu.d0 = (end + 5) & MASK;
    Some(19 + 5 + 5 + 4 + 5 + 5 + push_and_next(cpu, hw))
}

/// Data reads of a dry run. Values come from `peek`; the addresses are kept
/// so that the committed run makes the same reads (for the CRC). Only ROM
/// and RAM may be read: elsewhere a read can have side effects.
struct DryReads<'a> {
    hw: &'a Hardware,
    addrs: Vec<u32>,
}

impl DryReads<'_> {
    fn nib(&mut self, addr: u32) -> Option<u32> {
        let addr = addr & MASK;
        if self.hw.mmu.select(addr).is_some_and(|m| m.kind != ModuleKind::Ram) {
            return None;
        }
        self.addrs.push(addr);
        Some(u32::from(self.hw.peek(addr)))
    }

    /// `A=DAT0 A`: lowest address first.
    fn a(&mut self, addr: u32) -> Option<u32> {
        (0..5).try_fold(0, |v, i| Some(v | self.nib(addr + i)? << (4 * i)))
    }

    /// `C=DAT0 B`.
    fn b(&mut self, addr: u32) -> Option<u32> {
        Some(self.nib(addr)? | self.nib(addr + 1)? << 4)
    }

    /// `PC=(A)`: highest address first.
    fn pc(&mut self, addr: u32) -> Option<u32> {
        (0..5).rev().try_fold(0, |v, i| Some((v << 4) | self.nib(addr + i)?))
    }
}

/// What SKIPOB does from a given D0: where it leaves D0 and A.A, its cycles
/// (its RTNCC included) and its data reads.
struct Skip {
    d0: u32,
    a: u32,
    cycles: u32,
    reads: Vec<u32>,
}

/// Work out SKIPOB without side effects. None where the ROM code would do
/// anything unusual: a type without a handler here (directories, access
/// pointers), an address that wraps, a read outside ROM and RAM.
fn skip_plan(hw: &Hardware, d0: u32) -> Option<Skip> {
    let mut r = DryReads { hw, addrs: Vec::new() };
    let add = |d0: u32, n: u32| Some(d0 + n).filter(|&v| v <= MASK);
    // ST=0 1; CD1EX; RSTK=C; C=B A; RSTK=C; P=0; B=0 A; ?ST=1 1 (not taken)
    let mut cycles = 5 + 5 + 4 + 4 + 4 + 4 + 4 + 7;
    let (mut d0, mut depth) = (d0, 0);
    let mut a;
    loop {
        // A=DAT0 A; D0=D0+5; D1=A; A=DAT1 A; LC(5) PRLG; ?C#A A
        let word = r.a(d0)?;
        d0 = add(d0, 5)?;
        a = r.a(word)?;
        cycles += 19 + 5 + 5 + 19 + 9 + 7;
        // Whether the handler goes straight on to the next object.
        let mut inner = false;
        if a == PRLG {
            // An embedded object: D1=D1-5; AD1EX; PC=(A) to the type's handler.
            a = word.wrapping_sub(5) & MASK;
            let handler = r.pc(a)?;
            cycles += 5 + 5 + 23;
            // D0=D0+n for each n, then GONC.
            let mut fixed = |adds: &[u32]| -> Option<u32> {
                for &n in adds {
                    d0 = add(d0, n)?;
                }
                Some(5 * adds.len() as u32 + 5)
            };
            cycles += match handler {
                // B=B+1 A; GONC: one level deeper
                0x03077 => {
                    depth = add(depth, 1)?;
                    inner = true;
                    4 + 5
                }
                0x0307C => fixed(&[16, 16])?,
                0x0307F => fixed(&[16])?,
                0x03085 => fixed(&[16, 5, 16, 5])?,
                0x0308B => fixed(&[16, 5])?,
                0x0308E => fixed(&[5])?,
                0x03094 => fixed(&[6])?,
                0x030B7 => fixed(&[2])?,
                // C=DAT0 A; AD0EX; C=C+A A; D0=C; GONC
                0x0309A => {
                    let len = r.a(d0)?;
                    a = d0;
                    d0 = add(len, d0)?;
                    19 + 5 + 4 + 5 + 5
                }
                // C=0 A; C=DAT0 B; C=C+C A; AD0EX; C=C+A A; D0=C; D0=D0+2;
                // then GONC (names), or GOTO the next object (a tag's object).
                0x030A8 | 0x03115 => {
                    let chars = r.b(d0)?;
                    a = d0;
                    d0 = add(add(2 * chars, d0)?, 2)?;
                    inner = handler == 0x03115;
                    4 + 16 + 4 + 5 + 4 + 5 + 5 + if inner { 6 } else { 5 }
                }
                _ => return None,
            };
        } else {
            // LC(5) SEMI; ?C#A A
            cycles += 9 + 7;
            if a == SEMI_BODY {
                // B=B-1 A; GOC
                cycles += 4 + 5;
                if depth == 0 {
                    // The object was SEMI itself: D0=D0-5; GONC to the exit.
                    d0 = d0.checked_sub(5)?;
                    cycles += 5 + 5;
                    break;
                }
                depth -= 1;
            }
        }
        if !inner {
            // ?B#0 A
            cycles += 7;
            if depth == 0 {
                break;
            }
        }
    }
    // C=RSTK; B=C A; C=RSTK; D1=C; RTNCC
    cycles += 4 + 4 + 4 + 5 + 9;
    Some(Skip { d0, a, cycles, reads: r.addrs })
}

/// Commit a planned SKIPOB, its RTNCC included; returns the return address.
fn apply_skip(cpu: &mut Cpu, hw: &mut Hardware, skip: &Skip) -> u32 {
    for &addr in &skip.reads {
        hw.read(addr);
    }
    // It saves D1 and B.A on the return stack and restores them.
    let (d1, b) = (cpu.d1, cpu.b.a());
    cpu.push(d1);
    cpu.push(b);
    cpu.pop();
    cpu.pop();
    cpu.st &= !2;
    cpu.p = 0;
    cpu.a.set_a(skip.a);
    cpu.c.set_a(d1);
    cpu.d0 = skip.d0;
    cpu.carry = false;
    cpu.pop()
}

/// SKIPOB (#03019): D0 = the address after the object at D0.
pub fn skipob(cpu: &mut Cpu, hw: &mut Hardware) -> Option<u32> {
    if cpu.dec {
        return None;
    }
    let skip = skip_plan(hw, cpu.d0)?;
    cpu.pc = apply_skip(cpu, hw, &skip);
    Some(skip.cycles)
}

/// The start of an embedded composite or secondary: `D0=D0-5; CD0EX; D0=C;
/// RSTK=C; GOSUB SKIPOB; C=RSTK; A=C A`, with the GOSUB at `call`.
fn skip_embedded(cpu: &mut Cpu, hw: &mut Hardware, call: u32) -> Option<u32> {
    if cpu.dec || cpu.d.a() == 0 {
        return None;
    }
    let ob = cpu.d0.checked_sub(5)?;
    let skip = skip_plan(hw, ob)?;
    cpu.d0 = ob;
    cpu.push(ob);
    cpu.push(call + 4);
    apply_skip(cpu, hw, &skip);
    let ob = cpu.pop();
    cpu.c.set_a(ob);
    cpu.a.set_a(ob);
    Some(5 + 5 + 5 + 4 + 6 + skip.cycles + 4 + 4)
}

/// An embedded list, symbolic, unit, tagged object or other composite.
pub fn embedded_composite(cpu: &mut Cpu, hw: &mut Hardware) -> Option<u32> {
    let c = skip_embedded(cpu, hw, 0x02D35)?;
    Some(c + push_and_next(cpu, hw))
}

/// An embedded secondary: run it.
pub fn embedded_secondary(cpu: &mut Cpu, hw: &mut Hardware) -> Option<u32> {
    let c = skip_embedded(cpu, hw, 0x02DEB)?;
    cpu.d.set_a(cpu.d.a() - 1);
    Some(c + 4 + 5 + enter_secondary(cpu, hw))
}

/// Every jump native that applies to this machine's ROM, by address: NEXT
/// wherever lower ROM holds its code, the pushing prologs, DOCOL, SEMI,
/// PRLG, the handlers of embedded objects and SKIPOB.
pub fn jump_sites(machine: &Machine) -> Vec<(u32, &'static str, Jump)> {
    let mut hw = machine.hw.clone();
    let mut sites = Vec::new();
    let io = 0x00100..0x00140;
    for addr in (0..0x7F000).filter(|a| !io.contains(a)) {
        if code_at(&mut hw, addr, NEXT_CODE) {
            sites.push((addr, "NEXT", next_site as Jump));
        }
    }
    // The prologs lie between PRLG and DOCOL.
    for addr in 0x028FC..0x02D9D {
        if code_at(&mut hw, addr, PUSH_CODE) {
            sites.push((addr, "push prolog", push_prolog as Jump));
        }
    }
    let routines: [(u32, &str, Jump, &str); 13] = [
        (0x02D9D, "DOCOL", docol, DOCOL_CODE),
        (0x03130, "SEMI", semi, SEMI_CODE),
        (PRLG, "PRLG", prlg, PRLG_CODE),
        (0x02C28, "embedded", embedded::<10, 1>, BINT_CODE),
        (0x02C49, "embedded", embedded::<21, 2>, REAL_CODE),
        (0x02C6D, "embedded", embedded::<26, 2>, EREL_CODE),
        (0x02C95, "embedded", embedded::<37, 3>, CMP_CODE),
        (0x02CBC, "embedded", embedded::<47, 3>, ECMP_CODE),
        (0x02CE3, "embedded", embedded::<7, 1>, CHAR_CODE),
        (0x02D04, "embedded", embedded_length, LENGTH_CODE),
        (0x02D2A, "embedded", embedded_composite, COMPOSITE_CODE),
        (0x02DE0, "embedded", embedded_secondary, SECONDARY_CODE),
        (0x03019, "SKIPOB", skipob, SKIPOB_CODE),
    ];
    for (addr, name, f, code) in routines {
        if code_at(&mut hw, addr, code) {
            sites.push((addr, name, f));
        }
    }
    sites
}

/// All natives with their ROM entry points.
pub const NATIVES: &[(u32, &str, Native)] = &[(0x03991, "MUL#", mul_bint), (0x06A8E, "DIV5", div5)];

/// The first 16 nibbles of each replaced routine in ROM revision R. A ROM
/// built from firmware/ may have moved or changed a routine; its native is
/// then not used.
const SIGNATURES: &[(u32, u64)] = &[(0x03991, 0x0C0A_8081_004C_A81D), (0x06A8E, 0xB1A6_1AB9_A7D3_9AA2)];

/// Is the routine a native replaces at `addr` in this machine's ROM?
pub fn routine_present(machine: &Machine, addr: u32) -> bool {
    SIGNATURES.iter().any(|&(a, sig)| a == addr && machine.peek_value(addr, 16) == sig)
}

/// Route calls to every implemented native whose routine is in the ROM.
pub fn install(machine: &mut Machine) {
    for &(addr, _, f) in NATIVES {
        if routine_present(machine, addr) {
            machine.natives.insert(addr, f);
        }
    }
    for (addr, _, f) in jump_sites(machine) {
        machine.jumps.insert(addr, f);
    }
}

/// Snapshot of everything a routine can change in the CPU.
fn cpu_state(c: &Cpu) -> String {
    format!(
        "PC={:05X} A={:?} B={:?} C={:?} D={:?} R={:?} D0={:05X} D1={:05X} P={} ST={:04X} HST={:X} carry={} RSTK={:05X?}",
        c.pc,
        c.a,
        c.b,
        c.c,
        c.d,
        c.r,
        c.d0,
        c.d1,
        c.p,
        c.st,
        c.hst,
        c.carry,
        c.rstk()
    )
}

/// Run the ROM routine at `entry` and the native `f` from the same machine
/// state and compare the results. `max_steps` bounds the ROM run.
pub fn verify(machine: &Machine, entry: u32, f: Native, max_steps: usize) -> Result<(), String> {
    const RETURN: u32 = 0xFFFFE; // sentinel return address
    let mut rom = machine.clone();
    rom.natives.clear();
    rom.cpu.pc = entry;
    rom.cpu.push(RETURN);
    let depth = rom.cpu.rstk().len();
    let mut steps = 0;
    while !(rom.cpu.pc == RETURN && rom.cpu.rstk().len() == depth - 1) {
        rom.cpu.step(&mut rom.hw);
        steps += 1;
        if steps > max_steps {
            return Err(format!("ROM routine at #{entry:05X} did not return in {max_steps} steps"));
        }
    }
    let mut native = machine.clone();
    native.cpu.push(RETURN);
    f(&mut native.cpu, &mut native.hw);
    native.cpu.pc = native.cpu.pop();

    compare(&rom, &native).map_err(|e| format!("#{entry:05X} {e}"))
}

/// Everything a routine can change: the CPU, RAM and the CRC register.
fn compare(rom: &Machine, native: &Machine) -> Result<(), String> {
    let (a, b) = (cpu_state(&rom.cpu), cpu_state(&native.cpu));
    if a != b {
        return Err(format!("differs\n  rom:    {a}\n  native: {b}"));
    }
    if rom.hw.ram != native.hw.ram {
        let i = rom.hw.ram.iter().zip(native.hw.ram.iter()).position(|(x, y)| x != y).unwrap();
        return Err(format!("RAM differs at offset {i:05X}"));
    }
    if rom.hw.crc != native.hw.crc {
        return Err(format!("CRC differs: rom {:04X}, native {:04X}", rom.hw.crc, native.hw.crc));
    }
    Ok(())
}

/// Run the jump native `f` and the ROM code at PC from the same machine
/// state. A native that declines must leave the machine untouched; one that
/// runs must match the ROM after the same number of cycles. Returns whether
/// the native ran.
pub fn verify_jump(machine: &Machine, f: Jump) -> Result<bool, String> {
    let pc = machine.cpu.pc;
    let mut native = machine.clone();
    let Some(cycles) = f(&mut native.cpu, &mut native.hw) else {
        return compare(machine, &native).map(|()| false).map_err(|e| format!("#{pc:05X} declined but {e}"));
    };
    let mut rom = machine.clone();
    let mut spent = 0;
    while spent < cycles {
        spent += rom.cpu.step(&mut rom.hw);
    }
    if spent != cycles {
        return Err(format!("#{pc:05X}: the ROM took {spent} cycles, the native {cycles}"));
    }
    compare(&rom, &native).map(|()| true).map_err(|e| format!("#{pc:05X} {e}"))
}
