//! Debug aid: log interrupts and keyboard reads around a key tap.
//! cargo run --release -p hp48 --example keytrace -- KEY HOLD_SECONDS
use hp48::{Key, Machine, CPU_HZ};
use saturn::Op;

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let name = args.get(1).map(String::as_str).unwrap_or("LeftShift");
    let hold: f64 = args.get(2).map(|s| s.parse().unwrap()).unwrap_or(0.3);
    let key = Key::ALL.into_iter().find(|k| format!("{k:?}") == name).expect("key");
    let rom = std::fs::read("ROM/gxrom-r").unwrap();
    let mut m = Machine::new(&rom);
    m.run(3 * CPU_HZ);
    m.tap(Key::F);
    m.run(3 * CPU_HZ);
    let t0 = m.time;
    let log = |m: &mut Machine, until: u64| {
        while m.time < until {
            let pc = m.cpu.pc;
            let (op, _) = m.cpu.peek(&mut m.hw);
            let sd = m.cpu.shutdown;
            m.run(1);
            let t = (m.time - t0) as f64 / CPU_HZ as f64;
            if m.cpu.pc == 0xF && pc != 0xF && !sd {
                println!("{t:8.4} IRQ from {pc:05X}  T1={:X} T1CTL={:X} T2CTL={:X}", m.hw.timer1, m.hw.io[0x2E], m.hw.io[0x2F]);
            }
            if matches!(op, Op::In(_)) {
                println!("{t:8.4} {pc:05X} IN  OUT={:03X} -> {:04X}", m.cpu.out, m.cpu.input);
            }
        }
    };
    println!("-- press {name}");
    m.key(key, true);
    let until = m.time + (hold * CPU_HZ as f64) as u64;
    log(&mut m, until);
    println!("-- release");
    m.key(key, false);
    let until = m.time + CPU_HZ / 2;
    log(&mut m, until);
    println!("annunciators {:02X}", m.hw.annunciators());
}
