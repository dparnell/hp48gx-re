//! Does BYTES, which uses the CRC hardware, agree with the CRC of an object's
//! nibbles, worked out from memory? Tries strings of growing size.
//!
//! cargo run --release -p hp48 --example crccheck

use hp48::{Key, Machine, CPU_HZ};

const DSKTOP: u32 = 0x806F8;

fn crc(nibbles: impl Iterator<Item = u8>) -> u64 {
    nibbles.fold(0u64, |c, v| (c >> 4) ^ (((c ^ u64::from(v)) & 15) * 0x1081))
}

fn level(m: &Machine, n: u32) -> u32 {
    let stack = m.peek_value(DSKTOP, 5) as u32;
    m.peek_value(stack + 5 * (n - 1), 5) as u32
}

fn enter(m: &mut Machine, line: &str) {
    m.type_text(line).unwrap();
    m.tap(Key::Enter);
    m.run(2 * CPU_HZ);
}

fn main() {
    let rom = std::fs::read(hp48::default_rom_path()).unwrap();
    let mut m = Machine::new(&rom);
    m.run(3 * CPU_HZ);
    m.tap(Key::F);
    m.run(4 * CPU_HZ);
    for doublings in [0, 2, 4, 6, 8, 10, 12, 13] {
        enter(&mut m, &format!("\"x\"{}", " DUP +".repeat(doublings)));
        let object = level(&m, 1);
        let size = m.peek_value(object + 5, 5) as u32 + 5;
        let want = crc((0..size).map(|i| m.hw.peek(object + i)));
        enter(&mut m, "BYTES DROP");
        let got = m.peek_value(level(&m, 1) + 10, 4);
        println!("{size:6} nibbles: BYTES #{got:04X}, from memory #{want:04X} {}", if got == want { "ok" } else { "DIFFERENT" });
        enter(&mut m, "DROP");
    }
}
