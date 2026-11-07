//! Putting an object from a computer on the calculator's stack.
//!
//! HP 48 binary files, as Kermit and Xmodem transfer them, are the header
//! `HPHP48-` and a version letter, then the object's nibbles, two to a byte,
//! low nibble first. There is no serial link here, so the ROM is asked to make
//! a hex string of the same size, which gives the object room in its own
//! memory with everything around it in order, and the object is written over
//! it. The size must be exact, to the nibble: the garbage collector looks for
//! a temporary object's link right after the object, and libraries can have
//! an odd number of nibbles, which a character string can't.

use crate::{Key, Machine, CPU_HZ};

const HEADER: &[u8] = b"HPHP48-";
/// The header, and the version letter after it.
const HEADER_SIZE: usize = 8;
/// RAM word with the address of stack level 1.
const DSKTOP: u32 = 0x806F8;
const DOHXS: u64 = 0x02A4E;
/// A hex string's prolog and length.
const HXS_HEADER: usize = 10;
/// Objects that hold their own length after their prolog.
const SIZED: [u64; 6] = [0x02A2C, DOHXS, 0x02B1E, 0x02B40, 0x02B62, 0x02DCC];
/// `% -> #` and `#nibs -> hxs`, called by address.
const COERCE: u32 = 0x18CEA;
const MAKEHXS: u32 = 0x0EDE1;

/// Press ENTER and let the line run.
fn enter(machine: &mut Machine, line: &str) -> Result<(), String> {
    machine.type_text(line).map_err(|c| format!("cannot type {c:?}"))?;
    machine.tap(Key::Enter);
    machine.run(2 * CPU_HZ);
    Ok(())
}

/// A file's object as nibbles.
fn object_nibbles(file: &[u8]) -> Result<Vec<u8>, String> {
    if !file.starts_with(HEADER) || file.len() <= HEADER_SIZE {
        return Err("not an HP 48 binary file: no HPHP48- header".into());
    }
    let mut nibbles: Vec<u8> = file[HEADER_SIZE..].iter().flat_map(|&b| [b & 15, b >> 4]).collect();
    // A file holds whole bytes, so it may end in a spare nibble.
    let word = |at: usize| nibbles.get(at..at + 5).map(|n| n.iter().rev().fold(0u64, |v, &d| v << 4 | u64::from(d)));
    if let (Some(prolog), Some(length)) = (word(0), word(5)) {
        if SIZED.contains(&prolog) && length as usize + 5 <= nibbles.len() {
            nibbles.truncate(length as usize + 5);
        }
    }
    Ok(nibbles)
}

impl Machine {
    /// Put the object in an HP 48 binary file on stack level 1.
    pub fn push_object(&mut self, file: &[u8]) -> Result<(), String> {
        let nibbles = object_nibbles(file)?;
        let body = nibbles.len().checked_sub(HXS_HEADER).ok_or("the object is too short")?;
        enter(self, &format!("{body} # {COERCE:X}h SYSEVAL # {MAKEHXS:X}h SYSEVAL"))?;
        let slot = self.peek_value(DSKTOP, 5) as u32;
        let room = self.peek_value(slot, 5) as u32;
        let size = self.peek_value(room + 5, 5) as usize + 5;
        if self.peek_value(room, 5) != DOHXS || size != nibbles.len() {
            return Err(format!("no room made for the object: {size} nibbles for {}", nibbles.len()));
        }
        let start = room as usize - 0x80000;
        self.hw.ram[start..start + nibbles.len()].copy_from_slice(&nibbles);
        // Stack level 1 has changed under the ROM's feet.
        self.run(CPU_HZ / 10);
        Ok(())
    }

    /// Turn the calculator off and on, which attaches libraries stored in
    /// ports.
    pub fn power_cycle(&mut self) -> Result<(), String> {
        enter(self, "OFF")?;
        self.tap(Key::On);
        self.run(5 * CPU_HZ);
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn a_file_needs_its_header() {
        assert!(object_nibbles(b"not this").is_err());
        assert_eq!(object_nibbles(b"HPHP48-X\x2B\x40").unwrap(), [0xB, 2, 0, 4]);
    }

    #[test]
    fn a_spare_nibble_at_the_end_of_a_file_is_dropped() {
        // A library of 11 nibbles: the prolog, a length of 6, and a nibble.
        let file = b"HPHP48-X\x40\x2B\x60\x00\x00\x07";
        assert_eq!(object_nibbles(file).unwrap().len(), 11);
    }
}
