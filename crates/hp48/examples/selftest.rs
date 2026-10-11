//! Boot, then press ON-E (hold ON, tap E, release ON), which starts the
//! ROM's continuous self-test (code at #80000), and report the CRC its ROM
//! check (#804C0) computes. The test reads one half of the ROM through the
//! CRC circuit and expects #FFFF; tools/sasm.py's CRC directive keeps it so
//! after edits. (The test reads the lower half; it goes on to the upper half
//! only when the lower half fails.)
//!
//! cargo run --release -p hp48 --example selftest -- [ROM]
//!
//! The check is found by what it does, not by address, so it also works on
//! ROMs whose self-test code has moved: clearing the CRC register (#00104)
//! starts a half, and reading the register back ends it, if a whole half of
//! the ROM (#80000 nibbles) was read in between (other tests use the CRC
//! register too).
use hp48::{Key, Machine, CPU_HZ};
use saturn::Op;

const CRC: u32 = 0x00104;

fn main() {
    let path = std::env::args().nth(1).unwrap_or_else(|| "ROM/gxrom-r".into());
    let mut m = Machine::new(&std::fs::read(&path).expect("ROM"));
    m.run(3 * CPU_HZ);
    m.tap(Key::F);
    m.run(4 * CPU_HZ);
    m.key(Key::On, true);
    m.run(CPU_HZ / 4);
    m.key(Key::E, true);
    m.run(CPU_HZ / 4);
    m.key(Key::E, false);
    m.run(CPU_HZ / 4);
    m.key(Key::On, false);
    let start = m.time;
    let mut checks = 0;
    let mut half: Option<u32> = None;
    let mut reading = false;
    let mut read = 0u32;
    let mut bad = false;
    while m.time < start + 30 * CPU_HZ && checks < 2 {
        if !m.cpu.shutdown {
            let (op, _) = m.cpu.peek(&mut m.hw);
            if let Op::Mem { store, d, .. } = op {
                let at = if d == 0 { m.cpu.d0 } else { m.cpu.d1 };
                if at == CRC && store {
                    reading = true;
                    half = None;
                    read = 0;
                } else if at == CRC && reading && read >= 0x80000 {
                    reading = false;
                    checks += 1;
                    let crc = m.peek_value(CRC, 4);
                    bad |= crc != 0xFFFF;
                    let h = half.map_or("?".into(), |h| format!("#{:05X}", h & 0x80000));
                    println!("ROM half at {h}: CRC #{crc:04X} ({})", if crc == 0xFFFF { "ok" } else { "bad, expects #FFFF" });
                    if crc != 0xFFFF {
                        break; // the test stops at the first bad half
                    }
                } else if reading && !store && m.hw.mmu.select(at).is_none() {
                    half.get_or_insert(at);
                    read += 16;
                }
            }
        }
        m.run(1);
    }
    if checks == 0 {
        println!("the ROM CRC check did not run");
    }
    if checks == 0 || bad {
        std::process::exit(1);
    }
}
