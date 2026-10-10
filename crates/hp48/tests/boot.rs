//! Boot the real ROM and check calculator results by reading RPL objects
//! from emulated RAM. Skipped when ROM/gxrom-r is not present.

use hp48::{Key, Machine, CPU_HZ};

/// RAM variable holding the address of stack level 1 (EDB: DSKTOP).
const DSKTOP: u32 = 0x806F8;
const DOREAL: u64 = 0x02933;

fn machine() -> Option<Machine> {
    let rom = std::fs::read(concat!(env!("CARGO_MANIFEST_DIR"), "/../../ROM/gxrom-r")).ok()?;
    let mut m = Machine::new(&rom);
    m.run(3 * CPU_HZ);
    // "Try To Recover Memory?" -> NO
    m.tap(Key::F);
    m.run(4 * CPU_HZ);
    Some(m)
}

/// Decode the real number on stack level 1 as a string like "3E0".
fn level1_real(m: &Machine) -> Option<String> {
    let slot = m.peek_value(DSKTOP, 5) as u32;
    let obj = m.peek_value(slot, 5) as u32;
    if m.peek_value(obj, 5) != DOREAL {
        return None;
    }
    let exp = m.peek_value(obj + 5, 3);
    let mant = m.peek_value(obj + 8, 12);
    let sign = m.peek_value(obj + 20, 1);
    let exp = if exp >= 500 { exp as i64 - 1000 } else { exp as i64 };
    let digits = format!("{mant:012X}");
    let digits = digits.trim_end_matches('0');
    Some(format!("{}{}E{}", if sign == 9 { "-" } else { "" }, if digits.is_empty() { "0" } else { digits }, exp))
}

#[test]
fn adds_two_numbers() {
    let Some(mut m) = machine() else { return };
    for k in [Key::N1, Key::Enter, Key::N2, Key::Plus] {
        m.tap(k);
    }
    m.run(CPU_HZ / 2);
    assert_eq!(level1_real(&m).as_deref(), Some("3E0"));
}

#[test]
fn divides_with_full_precision() {
    let Some(mut m) = machine() else { return };
    for k in [Key::N7, Key::Enter, Key::N3, Key::Div] {
        m.tap(k);
    }
    m.run(CPU_HZ / 2);
    assert_eq!(level1_real(&m).as_deref(), Some("233333333333E0"));
}
