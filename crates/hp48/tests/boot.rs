//! Boot the real ROM and check calculator results by reading RPL objects
//! from emulated RAM. Skipped when ROM/gxrom-r is not present.

use hp48::{Key, Machine, CPU_HZ};

/// RAM variable holding the address of stack level 1 (EDB: DSKTOP).
const DSKTOP: u32 = 0x806F8;
const DOREAL: u64 = 0x02933;

fn machine() -> Option<Machine> {
    let rom = std::fs::read(hp48::default_rom_path()).ok()?;
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

#[test]
fn state_round_trip_keeps_the_stack() {
    let Some(mut m) = machine() else { return };
    for k in [Key::N4, Key::N2, Key::Enter] {
        m.tap(k);
    }
    m.run(CPU_HZ / 2);
    let snap = m.save_state();

    let rom = std::fs::read(hp48::default_rom_path()).unwrap();
    let mut restored = Machine::new(&rom);
    restored.load_state(&snap).expect("load");
    assert_eq!(level1_real(&restored).as_deref(), Some("42E1"));
    // The restored machine keeps working: 42 8 + = 50.
    for k in [Key::N8, Key::Plus] {
        restored.tap(k);
    }
    restored.run(CPU_HZ / 2);
    assert_eq!(level1_real(&restored).as_deref(), Some("5E1"));
}

/// `Machine::set_speed` makes the CPU faster while the timers keep real
/// time: a busy program finishes sooner, and TIMER2 counts real time.
#[test]
fn a_faster_cpu_keeps_the_clock() {
    let Some(slow) = machine() else { return };
    let mut fast = slow.clone();
    fast.set_speed(256);
    let line = "« 1 2000 FOR I I SIN DROP NEXT » EVAL";
    let mut busy = Vec::new();
    for mut m in [slow, fast] {
        for k in hp48::typing::keystrokes(line).unwrap() {
            m.tap(k);
        }
        m.tap(Key::Enter);
        let (time, timer2) = (m.time, m.hw.timer2);
        m.run(2 * CPU_HZ);
        assert!((2 * CPU_HZ..2 * CPU_HZ + 64).contains(&(m.time - time)));
        if m.speed() > 1 {
            // Idle once the program is done, the ROM leaves TIMER2 alone
            // (while it runs, it may reload it).
            assert_eq!(timer2.wrapping_sub(m.hw.timer2), 2 * 8192, "TIMER2 counts real time");
        }
        busy.push(m.lcd().annunciators & 0x10 != 0);
    }
    assert_eq!(busy, [true, false], "BUSY after 2 s at 4 MHz, done at 1 GHz");
}
