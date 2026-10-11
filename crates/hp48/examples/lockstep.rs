//! Run the original ROM and a relocated build of it side by side, one
//! instruction at a time, and report where their control flow first differs.
//! Addresses in [LO, HI) of the original are at +DELTA in the relocated ROM
//! (see tools/relocate.py). After boot both machines get the same key presses:
//! F (do not recover memory), then each command line given, with ENTER.
//!
//! cargo run --release -p hp48 --example lockstep -- ROM/gxrom-r out/reloc.bin 041D9 7E001 16 ["1 2 +" ...]

use hp48::{Key, Machine, CPU_HZ};
use std::collections::VecDeque;

fn main() {
    let a: Vec<String> = std::env::args().skip(1).collect();
    let hex = |s: &str| u32::from_str_radix(s, 16).expect("hex address");
    let (lo, hi, delta) = (hex(&a[2]), hex(&a[3]), a[4].parse::<u32>().expect("delta"));
    let mut orig = Machine::new(&std::fs::read(&a[0]).expect("original ROM"));
    let mut moved = Machine::new(&std::fs::read(&a[1]).expect("relocated ROM"));
    // Only addresses the ROM answers moved (upper ROM is mostly covered by RAM).
    let unmap = |m: &Machine, pc: u32| {
        if pc >= lo + delta && pc < hi + delta && m.hw.mmu.select(pc).is_none() { pc - delta } else { pc }
    };

    // Key events (time, key, down): F after 3 s, then the typed lines.
    let mut events: Vec<(u64, Key, bool)> = Vec::new();
    let mut t = 3 * CPU_HZ;
    let mut press = |t: &mut u64, k: Key| {
        events.push((*t, k, true));
        events.push((*t + CPU_HZ / 20, k, false));
        *t += CPU_HZ / 20 + CPU_HZ / 10;
    };
    press(&mut t, Key::F);
    t += 4 * CPU_HZ;
    for line in &a[5..] {
        for k in hp48::typing::keystrokes(line).unwrap_or_else(|c| panic!("cannot type {c:?}")) {
            press(&mut t, k);
        }
        press(&mut t, Key::Enter);
        t += 3 * CPU_HZ;
        press(&mut t, Key::On);
        t += CPU_HZ / 2;
    }
    let end = t + CPU_HZ;

    // WATCH=ADDR (hex): report every change of the 5 nibbles there in both.
    let watch = std::env::var("WATCH").ok().map(|w| u32::from_str_radix(&w, 16).expect("WATCH address"));
    let mut watched = (0u64, 0u64);
    let mut hist: VecDeque<(u32, u32)> = VecDeque::new();
    let mut next = 0;
    let mut step = 0u64;
    while orig.time < end {
        while next < events.len() && orig.time >= events[next].0 {
            let (_, k, down) = events[next];
            orig.key(k, down);
            moved.key(k, down);
            next += 1;
        }
        let (p0, p1) = (orig.cpu.pc, moved.cpu.pc);
        if p0 != unmap(&moved, p1) || orig.cpu.shutdown != moved.cpu.shutdown {
            println!("diverged after {step} steps: original at #{p0:05X}, relocated at #{p1:05X} (= #{:05X} in the original)", unmap(&moved, p1));
            for (x, y) in &hist {
                println!("  #{x:05X}   #{y:05X}");
            }
            println!("original:  {:?}", orig.cpu);
            println!("relocated: {:?}", moved.cpu);
            std::process::exit(1);
        }
        if let Some(w) = watch {
            let now = (orig.peek_value(w, 5), moved.peek_value(w, 5));
            if now != watched {
                println!("step {step}: #{w:05X} = {:05X} (original, after #{:05X})  {:05X} (relocated, after #{:05X})",
                         now.0, hist.back().map_or(0, |h| h.0), now.1, hist.back().map_or(0, |h| h.1));
                watched = now;
            }
        }
        if let Ok(v) = std::env::var("WATCHD1") {
            if orig.cpu.d1 == u32::from_str_radix(&v, 16).expect("hex") {
                println!("D1 = {v} at step {step}; recent original PCs:");
                for (x, _) in &hist {
                    println!("  #{x:05X}");
                }
                std::process::exit(0);
            }
        }
        let wr: usize = std::env::var("WATCHR").ok().and_then(|v| v.parse().ok()).unwrap_or(9);
        if wr < 5 && (orig.cpu.r[wr].0 & 0xFFFFF, moved.cpu.r[wr].0 & 0xFFFFF) != watched {
            watched = (orig.cpu.r[wr].0 & 0xFFFFF, moved.cpu.r[wr].0 & 0xFFFFF);
            println!("step {step}: R{wr} = {:05X} / {:05X} after #{:05X} / #{:05X}", watched.0, watched.1,
                     hist.back().map_or(0, |h| h.0), hist.back().map_or(0, |h| h.1));
        }
        hist.push_back((p0, p1));
        if hist.len() > 40 {
            hist.pop_front();
        }
        orig.run(1);
        moved.run(1);
        step += 1;
    }
    println!("no divergence in {step} steps ({} s of emulated time, {} key events)", orig.time / CPU_HZ, events.len());
}
