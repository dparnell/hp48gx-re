//! Install libraries from HP 48 binary files and drive a program, on the
//! original and the customised ROM, comparing the LCD after each step.
//!
//! cargo run --release -p hp48 --example installlib -- OUT_DIR "ORG" "Right Down" FILE...
//!
//! Each library is stored in port 0, then the calculator restarts. The command
//! line is typed, then each word of the key script is pressed in turn. Writes
//! OUT_DIR/state-r.bin and state-hires.bin, in the app's format, for
//! `HP48GX_STATE=... hp48-app --persist`.

use hp48::{Key, Machine, CPU_HZ};
use hp48_rpl::{decode, Memory};

const DSKTOP: u32 = 0x806F8;

fn level1(m: &Machine) -> String {
    let mem = |a: u32| m.hw.peek(a);
    let slot = mem.addr(DSKTOP);
    let obj = mem.addr(slot);
    if obj == 0 {
        return "(empty)".into();
    }
    match decode(&mem, obj) {
        Ok(o) => format!("{o:?}").chars().take(100).collect(),
        Err(e) => e.to_string(),
    }
}

fn line(m: &mut Machine, text: &str) {
    m.type_text(text).unwrap_or_else(|c| panic!("cannot type {c:?}"));
    m.tap(Key::Enter);
    m.run(3 * CPU_HZ);
}

fn install(path: &str, files: &[String], state: &str) -> Machine {
    let rom = std::fs::read(path).unwrap_or_else(|e| panic!("{path}: {e}"));
    let mut m = Machine::new(&rom);
    m.run(3 * CPU_HZ);
    m.tap(Key::F);
    m.run(4 * CPU_HZ);
    for file in files {
        let data = std::fs::read(file).unwrap_or_else(|e| panic!("{file}: {e}"));
        m.push_object(&data).unwrap();
        println!("{path}: {file}: {}", level1(&m));
        line(&mut m, "DUP BYTES");
        println!("  BYTES: size {}", level1(&m));
        line(&mut m, "DROP");
        let slot = m.peek_value(DSKTOP, 5) as u32;
        let object = m.peek_value(slot, 5) as u32;
        println!("  BYTES: checksum #{:X}h", m.peek_value(object + 10, 4));
        line(&mut m, "DROP 0 STO");
    }
    m.power_cycle().unwrap();
    line(&mut m, "MEM");
    println!("{path}: MEM: {}", level1(&m));
    line(&mut m, "DROP");
    line(&mut m, "LIBS");
    println!("{path}: LIBS: {}", level1(&m));
    line(&mut m, "DROP");
    let now = std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_secs_f64();
    let mut data = now.to_le_bytes().to_vec();
    data.extend(m.save_state());
    std::fs::write(state, data).unwrap();
    m
}

fn differing_rows(a: &Machine, b: &Machine) -> Vec<usize> {
    let (a, b) = (a.lcd().pixels, b.lcd().pixels);
    (0..a.len()).filter(|&y| a[y] != b[y]).collect()
}

fn main() {
    let args: Vec<String> = std::env::args().skip(1).collect();
    let [out, command, keys, files @ ..] = args.as_slice() else { panic!("OUT_DIR COMMAND KEYS FILE...") };
    let mut old = install("ROM/gxrom-r", files, &format!("{out}/state-r.bin"));
    let mut new = install("ROM/gxrom-hires", files, &format!("{out}/state-hires.bin"));
    println!("after installing: rows differing {:?}", differing_rows(&old, &new));
    line(&mut old, command);
    line(&mut new, command);
    println!("after {command}: rows differing {:?}", differing_rows(&old, &new));
    for name in keys.split_whitespace() {
        let key = Key::ALL.into_iter().find(|k| format!("{k:?}").eq_ignore_ascii_case(name));
        let key = key.unwrap_or_else(|| panic!("unknown key {name}"));
        for m in [&mut old, &mut new] {
            m.tap(key);
            m.run(CPU_HZ);
        }
        let _ = new.sync_hires();
        println!("after {name}: rows differing {:?}, hi-res items {}", differing_rows(&old, &new), new.hw.hires.on_lcd().count());
    }
    let _ = new.sync_hires();
    println!("hi-res items showing: {}", new.hw.hires.on_lcd().count());
}
