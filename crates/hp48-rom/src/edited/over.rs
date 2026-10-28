//! OVER, edited by hand. `hp48_rom::install` runs it in place of the
//! generated routine (`crate::gen::OVER`), which `install_generated` keeps.
//!
//! An example of an edit: the same instructions as the generated routine,
//! written as straight-line code for the usual entry, with each step
//! explained. Any other entry point goes to the generated code.

#![allow(non_snake_case, clippy::no_effect)]

use crate::prelude::*;

/// OVER's first instruction, after its code object's header.
const START: u32 = 0x032C7;

// 1 2 -> 1 2 1
// OVER: firmware/lower/02002-rpl-core.s:1645
pub(super) fn OVER(r: &mut Run) {
    let at = r.cpu.pc;
    if at != START {
        // Going on after a stop inside OVER, or coming back from the
        // garbage collection below.
        return crate::gen::OVER(r);
    }

    // One more stack level: D counts the free room in 5-nibble words.
    op!(r, at, 0x032C7..0x032C9, 4, r.cpu.dec(R::D, Field::A)); // D=D-1 A
    // No room left: L_032BB collects garbage, then goes on at L_032CC.
    r.cpu.pc = 0x032CC;
    r.cpu.jump_if(Cond::Carry, 0x032BB); // GOC L_032BB
    if !r.go(5) || r.cpu.pc != 0x032CC {
        return;
    }

    // Level 2 is the pointer at D1+5; push a copy of it as the new level 1.
    op!(r, at, 0x032CC..0x032CF, 5, r.cpu.d_add(1, 5)); // D1=D1+ 5
    io!(r, at, 0x032CF..0x032D2, 19, r.cpu.load(1, R::C, Field::A, r.hw)); // C=DAT1 A
    op!(r, at, 0x032D2..0x032D5, 5, r.cpu.d_sub(1, 10)); // D1=D1- 10
    io!(r, at, 0x032D5..0x032D8, 19, r.cpu.store(1, R::C, Field::A, r.hw)); // DAT1=C A

    // On to the program's next object: the RPL inner loop (D0 points into
    // the program).
    io!(r, at, 0x032D8..0x032DB, 19, r.cpu.load(0, R::A, Field::A, r.hw)); // A=DAT0 A
    op!(r, at, 0x032DB..0x032DE, 5, r.cpu.d_add(0, 5)); // D0=D0+ 5
    r.sync();
    r.cpu.pc_indirect(R::A, r.hw); // PC=(A)
    r.go_io(23);
}
