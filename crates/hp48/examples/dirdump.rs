//! Store a few variables, then dump the HOME directory object.
use hp48::{Key, Machine, CPU_HZ};

fn main() {
    let rom = std::fs::read("ROM/gxrom-r").unwrap();
    let mut m = Machine::new(&rom);
    m.run(3 * CPU_HZ);
    m.tap(Key::F);
    m.run(4 * CPU_HZ);
    // 1 'A' STO   then   2 'BC' STO
    for k in [Key::N1, Key::Quote, Key::Alpha, Key::A, Key::Enter, Key::Sto] {
        m.tap(k);
    }
    for k in [Key::N2, Key::Quote, Key::Alpha, Key::B, Key::Alpha, Key::C, Key::Enter, Key::Sto] {
        m.tap(k);
    }
    m.run(CPU_HZ);
    let home = m.peek_value(0x80711, 5) as u32;
    println!("USEROB -> {home:05X}");
    let hex: String = (0..240).map(|i| format!("{:X}", m.hw.peek(home + i))).collect();
    for (i, chunk) in hex.as_bytes().chunks(40).enumerate() {
        println!("{:05X} {}", home as usize + i * 40, std::str::from_utf8(chunk).unwrap());
    }
}
