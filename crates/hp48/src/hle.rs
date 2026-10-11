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
use crate::machine::{Machine, Native};
use saturn::cpu::SB;
use saturn::{Cpu, Reg};

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
}

/// Snapshot of everything a routine can change in the CPU.
fn cpu_state(c: &Cpu) -> String {
    format!(
        "A={:?} B={:?} C={:?} D={:?} R={:?} D0={:05X} D1={:05X} P={} ST={:04X} HST={:X} carry={} RSTK={:05X?}",
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

    let (a, b) = (cpu_state(&rom.cpu), cpu_state(&native.cpu));
    if a != b {
        return Err(format!("#{entry:05X} differs\n  rom:    {a}\n  native: {b}"));
    }
    if rom.hw.ram != native.hw.ram {
        let i = rom.hw.ram.iter().zip(native.hw.ram.iter()).position(|(x, y)| x != y).unwrap();
        return Err(format!("#{entry:05X}: RAM differs at offset {i:05X}"));
    }
    Ok(())
}
