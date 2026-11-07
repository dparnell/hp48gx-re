//! Telling the app which grobs the ROM draws on the screen.
//!
//! The ROM's programs put pictures on the display with XYGROBDISP. A jump
//! native on its first code body sees each call and always declines, so the
//! ROM runs as usual and the emulated machine doesn't change. It costs
//! nothing elsewhere: the machine looks up jump natives anyway.
//!
//! Grobs are told apart by their contents. Their address says nothing,
//! because objects from the covered upper ROM are copied to RAM to be used.

use crate::machine::Machine;
use crate::hardware::Hardware;
use saturn::Cpu;
use std::collections::HashSet;

/// XYGROBDISP's first code body, with `#x #y grob` rolled to `grob #x #y`.
const XYGROBDISP_CODE: u32 = 0x128C4;
/// The first 16 nibbles of that code in ROM R.
const SIGNATURE: u64 = 0x2D47_1066_41F8_6EA7;
const DOGROB: u32 = 0x02B1E;

/// A grob of a watched size, as XYGROBDISP was asked to draw it.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct DrawnGrob {
    pub x: u32,
    pub y: u32,
    pub width: u32,
    pub height: u32,
    /// [`hash`] of its pixels.
    pub hash: u64,
}

/// A hash of a grob's pixels (dark is true), rows padded as grobs are.
pub fn hash(rows: &[Vec<bool>]) -> u64 {
    let mut nibbles = Vec::new();
    for row in rows {
        let padded = row.len().div_ceil(8) * 8;
        for x in (0..padded).step_by(4) {
            let bit = |i: usize| u8::from(row.get(x + i).copied().unwrap_or(false)) << i;
            nibbles.push(bit(0) | bit(1) | bit(2) | bit(3));
        }
    }
    crate::rom_hash(&nibbles)
}

fn word(hw: &Hardware, addr: u32) -> u32 {
    (0..5).rev().fold(0, |value, i| (value << 4) | u32::from(hw.peek(addr + i)))
}

/// The jump native: note the grob and decline.
fn grob_drawn(cpu: &mut Cpu, hw: &mut Hardware, _budget: u32) -> Option<u32> {
    let level = |n: u32| word(hw, cpu.d1 + 5 * (n - 1));
    let grob = level(3);
    if word(hw, grob) != DOGROB {
        return None;
    }
    let (height, width) = (word(hw, grob + 10), word(hw, grob + 15));
    if !hw.watched_grobs.contains(&(width, height)) {
        return None;
    }
    let (x, y) = (word(hw, level(2) + 5), word(hw, level(1) + 5));
    let count = width.div_ceil(8) * 2 * height;
    let nibbles: Vec<u8> = (0..count).map(|i| hw.peek(grob + 20 + i)).collect();
    let drawn = DrawnGrob { x, y, width, height, hash: crate::rom_hash(&nibbles) };
    hw.drawn_grob = Some(drawn);
    None
}

/// Note the grobs of these sizes (width, height) that XYGROBDISP draws, in
/// `hw.drawn_grob`. Does nothing on a ROM with other code at that address.
pub fn install(machine: &mut Machine, sizes: HashSet<(u32, u32)>) {
    if machine.peek_value(XYGROBDISP_CODE, 16) == SIGNATURE {
        machine.hw.watched_grobs = sizes;
        machine.jumps.insert(XYGROBDISP_CODE, grob_drawn);
    }
}
