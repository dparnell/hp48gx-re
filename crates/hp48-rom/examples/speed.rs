//! How fast the machine runs busy ROM code: the interpreter, the translated
//! code, and the translated code with the hand-written natives.
//!
//! cargo run --release -p hp48-rom --example speed -- [SECONDS]
//!
//! Each mode boots, then runs a program that keeps the CPU busy for the
//! given emulated time (default 100 s), and reports emulated MHz.

use hp48::{hle, Key, Machine, CPU_HZ};
use std::time::Instant;

const PROGRAM: &str = "« 1 100000 FOR I I SIN I SQ + DROP NEXT » EVAL";

fn tap(m: &mut Machine, k: Key) {
    m.key(k, true);
    m.run(CPU_HZ / 20);
    m.key(k, false);
    m.run(CPU_HZ / 10);
}

fn main() {
    let seconds: u64 = std::env::args().nth(1).map_or(100, |s| s.parse().expect("SECONDS"));
    let rom = std::fs::read(hp48::default_rom_path()).expect("ROM");
    for mode in ["interpreter", "translated", "translated + natives"] {
        let mut m = Machine::new(&rom);
        if mode != "interpreter" {
            assert!(hp48_rom::install(&mut m), "translated from this ROM");
        }
        if mode.ends_with("natives") {
            hle::install(&mut m);
        }
        m.run(3 * CPU_HZ);
        tap(&mut m, Key::F);
        m.run(4 * CPU_HZ);
        for k in hp48::typing::keystrokes(PROGRAM).expect("typable") {
            tap(&mut m, k);
        }
        tap(&mut m, Key::Enter);
        let (start, cycles) = (Instant::now(), m.cpu.cycles);
        m.run(seconds * CPU_HZ);
        let wall = start.elapsed().as_secs_f64();
        let busy = (m.cpu.cycles - cycles) as f64;
        println!("{mode:22} {:7.1} MHz  ({:.0}% busy, {wall:.2} s)", busy / wall / 1e6, 100.0 * busy / (seconds * CPU_HZ) as f64);
    }
}
