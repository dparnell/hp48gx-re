//! How much of the ROM's work the natives in hle.rs already cover.
//!
//! Boots the ROM without natives and runs the same tour as execmap and
//! lockstep. Every call to a routine that has a native counts as covered,
//! from its entry to its return, including anything it calls. The result is
//! that share of the busy CPU cycles (SHUTDN sleep excluded) and of the
//! instructions executed, overall and per native: the progress figure for
//! replacing emulation with native code.
//!
//! cargo run --release -p hp48 --example coverage -- [ROM]
//!
//! Interrupts taken inside a covered routine count as covered. `hp48-cli
//! --profile` shows where the remaining cycles go.

use hp48::{hle, Key, Machine, CPU_HZ};

#[path = "common/tour.rs"]
mod tour;
use tour::{KEYS, TOUR};

/// A call to a replaced routine in progress.
struct Frame {
    native: usize,
    ret: u32,
    depth: usize,
}

#[derive(Default, Clone, Copy)]
struct Count {
    cycles: u64,
    instructions: u64,
    calls: u64,
}

struct Coverage {
    m: Machine,
    /// Entry addresses of the natives whose routines are in this ROM.
    entries: Vec<(usize, u32)>,
    active: Vec<Frame>,
    total: Count,
    covered: Count,
    per_native: Vec<Count>,
}

impl Coverage {
    fn run(&mut self, cycles: u64) {
        let end = self.m.time + cycles;
        while self.m.time < end {
            if self.m.cpu.shutdown {
                self.m.step(end);
                continue;
            }
            let pc = self.m.cpu.pc;
            for &(i, entry) in &self.entries {
                if pc == entry {
                    let rstk = self.m.cpu.rstk();
                    let ret = rstk.last().copied().unwrap_or(0);
                    self.active.push(Frame { native: i, ret, depth: rstk.len() });
                    self.per_native[i].calls += 1;
                }
            }
            let before = self.m.time;
            self.m.step(end);
            let c = Count { cycles: self.m.time - before, instructions: 1, calls: 0 };
            add(&mut self.total, c);
            if !self.active.is_empty() {
                add(&mut self.covered, c);
            }
            // A routine nested in another one counts for both.
            let mut seen = vec![false; self.per_native.len()];
            for f in &self.active {
                if !std::mem::replace(&mut seen[f.native], true) {
                    add(&mut self.per_native[f.native], c);
                }
            }
            let (pc, depth) = (self.m.cpu.pc, self.m.cpu.rstk().len());
            while self.active.last().is_some_and(|f| pc == f.ret && depth < f.depth) {
                self.active.pop();
            }
        }
    }

    fn tap(&mut self, k: Key) {
        self.m.key(k, true);
        self.run(CPU_HZ / 20);
        self.m.key(k, false);
        self.run(CPU_HZ / 10);
    }
}

fn add(to: &mut Count, c: Count) {
    to.cycles += c.cycles;
    to.instructions += c.instructions;
}

fn percent(part: u64, whole: u64) -> f64 {
    100.0 * part as f64 / whole.max(1) as f64
}

fn main() {
    let path = std::env::args().nth(1).unwrap_or_else(|| "ROM/gxrom-r".into());
    let rom = std::fs::read(&path).unwrap_or_else(|e| panic!("{path}: {e}"));
    let m = Machine::new(&rom);
    let entries = hle::NATIVES.iter().enumerate()
        .filter(|&(_, &(addr, _, _))| hle::routine_present(&m, addr))
        .map(|(i, &(addr, _, _))| (i, addr))
        .collect();
    let mut t = Coverage { m, entries, active: Vec::new(), total: Count::default(), covered: Count::default(),
                           per_native: vec![Count::default(); hle::NATIVES.len()] };
    t.run(3 * CPU_HZ);
    t.tap(Key::F);
    t.run(4 * CPU_HZ);
    for line in TOUR {
        let keys = hp48::typing::keystrokes(line).unwrap_or_else(|c| panic!("cannot type {c:?} in {line}"));
        for k in keys {
            t.tap(k);
        }
        t.tap(Key::Enter);
        t.run(2 * CPU_HZ);
        t.tap(Key::On);
        t.run(CPU_HZ / 2);
    }
    for &k in KEYS {
        t.tap(k);
        t.run(CPU_HZ);
    }

    let seconds = t.m.time as f64 / CPU_HZ as f64;
    let Coverage { total, covered, per_native, entries, .. } = t;
    println!("Tour: {seconds:.0} s emulated, {} busy cycles ({:.0}%), {} instructions", total.cycles,
             100.0 * total.cycles as f64 / (seconds * CPU_HZ as f64), total.instructions);
    println!("{:<12} {:>8} {:>10} {:>8} {:>8}", "native", "entry", "calls", "cycles", "instr");
    for &(i, entry) in &entries {
        let (_, name, _) = hle::NATIVES[i];
        let c = per_native[i];
        println!("{name:<12} #{entry:05X} {:>10} {:>7.3}% {:>7.3}%", c.calls,
                 percent(c.cycles, total.cycles), percent(c.instructions, total.instructions));
    }
    for &(addr, name, _) in hle::NATIVES {
        if !entries.iter().any(|&(_, e)| e == addr) {
            println!("{name:<12} #{addr:05X}  (not at this address in this ROM)");
        }
    }
    println!("Covered by natives: {:.3}% of cycles, {:.3}% of instructions",
             percent(covered.cycles, total.cycles), percent(covered.instructions, total.instructions));
}
