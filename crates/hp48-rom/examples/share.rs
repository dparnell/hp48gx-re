//! How the tour's busy cycles split between hand-written natives (hle.rs),
//! translated ROM code and the interpreter, and which ROM routines the
//! interpreter still runs.
//!
//! cargo run --release -p hp48-rom --example share -- [--no-natives] [--hot N]

use hp48::{hle, Key, Machine, CPU_HZ};
use std::collections::HashMap;

#[path = "../../hp48/examples/common/tour.rs"]
mod tour;

#[derive(Default)]
struct Share {
    native: u64,
    translated: u64,
    interpreted: u64,
    /// Interpreted cycles by PC.
    hot: HashMap<u32, u64>,
}

fn run(m: &mut Machine, s: &mut Share, cycles: u64) {
    let end = m.time + cycles;
    while m.time < end {
        if m.cpu.shutdown {
            m.step(end);
            continue;
        }
        let (pc, time, jumps, blocks) = (m.cpu.pc, m.time, m.jump_runs, m.block_runs);
        m.step(end);
        let c = m.time - time;
        if m.jump_runs > jumps || m.natives.contains_key(&pc) {
            s.native += c;
        } else if m.block_runs > blocks {
            s.translated += c;
        } else {
            s.interpreted += c;
            *s.hot.entry(pc).or_default() += c;
        }
    }
}

fn tap(m: &mut Machine, s: &mut Share, k: Key) {
    m.key(k, true);
    run(m, s, CPU_HZ / 20);
    m.key(k, false);
    run(m, s, CPU_HZ / 10);
}

fn main() {
    let mut args = std::env::args().skip(1);
    let (mut natives, mut hot) = (true, 20);
    while let Some(a) = args.next() {
        match a.as_str() {
            "--no-natives" => natives = false,
            "--hot" => hot = args.next().and_then(|n| n.parse().ok()).expect("--hot N"),
            other => panic!("unknown argument {other}"),
        }
    }
    let rom = std::fs::read(hp48::default_rom_path()).expect("ROM");
    let mut m = Machine::new(&rom);
    if natives {
        hle::install(&mut m);
    }
    assert!(hp48_rom::install(&mut m), "the translation is of another ROM");
    let mut s = Share::default();
    run(&mut m, &mut s, 3 * CPU_HZ);
    tap(&mut m, &mut s, Key::F);
    run(&mut m, &mut s, 4 * CPU_HZ);
    for line in tour::TOUR {
        for k in hp48::typing::keystrokes(line).unwrap() {
            tap(&mut m, &mut s, k);
        }
        tap(&mut m, &mut s, Key::Enter);
        run(&mut m, &mut s, 2 * CPU_HZ);
        tap(&mut m, &mut s, Key::On);
        run(&mut m, &mut s, CPU_HZ / 2);
    }
    for &k in tour::KEYS {
        tap(&mut m, &mut s, k);
        run(&mut m, &mut s, CPU_HZ);
    }
    let total = (s.native + s.translated + s.interpreted).max(1);
    let pct = |c: u64| 100.0 * c as f64 / total as f64;
    println!("{} routines translated; busy cycles over the tour:", hp48_rom::routines());
    println!("  hand-written natives {:6.2}%", pct(s.native));
    println!("  translated ROM code  {:6.2}%", pct(s.translated));
    println!("  interpreted          {:6.3}%", pct(s.interpreted));
    let mut v: Vec<_> = s.hot.into_iter().collect();
    v.sort_by_key(|e| std::cmp::Reverse(e.1));
    let covered = |pc: u32| m.hw.mmu.select(pc).map_or("ROM", |md| if md.kind == hp48::memory::ModuleKind::Ram { "RAM" } else { "other" });
    println!("Interpreted, hottest PCs:");
    for (pc, c) in v.into_iter().take(hot) {
        println!("  #{pc:05X} {:7.3}%  {}", pct(c), covered(pc));
    }
}
