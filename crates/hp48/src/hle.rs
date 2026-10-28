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
const DOCOL_CYCLES: u32 = 4 + 5 + 5 + 4 + 5 + 19 + 5 + 5 + 4 + 5 + NEXT_CYCLES;
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
    let (ip, top) = (cpu.d0, cpu.b.a());
    cpu.c.set_a(ip);
    write_a(hw, top, ip);
    let top = (top + 5) & MASK;
    cpu.d0 = cpu.a.a();
    cpu.a.set_a(top);
    cpu.b.set_a(top);
    cpu.d0 = (cpu.d0 + 5) & MASK;
    Some(DOCOL_CYCLES - NEXT_CYCLES + next(cpu, hw))
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

/// Every jump native that applies to this machine's ROM, by address: NEXT
/// wherever lower ROM holds its code, the pushing prologs, DOCOL and SEMI.
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
    for (addr, name, f, code) in [(0x02D9D, "DOCOL", docol as Jump, DOCOL_CODE), (0x03130, "SEMI", semi, SEMI_CODE)] {
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
