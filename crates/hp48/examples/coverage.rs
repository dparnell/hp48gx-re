//! How much of the ROM's work the natives in hle.rs already cover.
//!
//! Runs the same tour as execmap and lockstep with the jump natives (the RPL
//! inner loop) installed, and the called natives left to the ROM:
//! - every call to a routine that has a native counts as covered, from its
//!   entry to its return, including anything it calls;
//! - every time a jump native does the work, the ROM code it stands for
//!   counts as covered (jump natives charge the ROM's exact cycles).
//!
//! The result is that share of the busy CPU cycles (SHUTDN sleep excluded)
//! and of the ROM instructions, overall and per native: the progress figure
//! for replacing emulation with native code.
//!
//! cargo run --release -p hp48 --example coverage -- [ROM]
//!
//! Interrupts taken inside a covered routine count as covered. `hp48-cli
//! --profile` shows where the remaining cycles go.

use hp48::{hle, Key, Machine, CPU_HZ};
use std::collections::{BTreeMap, HashMap};

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
    /// Entry addresses of the called natives whose routines are in this ROM.
    entries: Vec<(usize, u32)>,
    active: Vec<Frame>,
    /// Jump native names by address.
    sites: HashMap<u32, &'static str>,
    /// ROM instructions each jump site stands for when its native runs.
    site_instructions: HashMap<u32, u64>,
    total: Count,
    covered: Count,
    per_native: Vec<Count>,
    per_jump: BTreeMap<&'static str, Count>,
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
            let jump = self.sites.get(&pc).copied();
            if jump.is_some() && !self.site_instructions.contains_key(&pc) {
                if let Some(n) = rom_instructions(&self.m) {
                    self.site_instructions.insert(pc, n);
                }
            }
            let (time, runs) = (self.m.time, self.m.jump_runs);
            self.m.step(end);
            let mut c = Count { cycles: self.m.time - time, instructions: 1, calls: 0 };
            if let (Some(name), true) = (jump, self.m.jump_runs > runs) {
                c.instructions = self.site_instructions[&pc];
                add(&mut self.covered, c);
                let j = self.per_jump.entry(name).or_default();
                add(j, c);
                j.calls += 1;
            } else if !self.active.is_empty() {
                add(&mut self.covered, c);
            }
            add(&mut self.total, c);
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

/// How many ROM instructions the jump native at PC stands for, if it runs
/// from this state.
fn rom_instructions(m: &Machine) -> Option<u64> {
    let f = m.jumps[&m.cpu.pc];
    let cycles = f(&mut m.cpu.clone(), &mut m.hw.clone())?;
    let mut rom = m.clone();
    let (mut spent, mut n) = (0, 0);
    while spent < cycles {
        spent += rom.cpu.step(&mut rom.hw);
        n += 1;
    }
    Some(n)
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
    let mut m = Machine::new(&rom);
    let entries = hle::NATIVES.iter().enumerate()
        .filter(|&(_, &(addr, _, _))| hle::routine_present(&m, addr))
        .map(|(i, &(addr, _, _))| (i, addr))
        .collect();
    let mut sites = HashMap::new();
    let mut site_counts = BTreeMap::<&str, usize>::new();
    for (addr, name, f) in hle::jump_sites(&m) {
        m.jumps.insert(addr, f);
        sites.insert(addr, name);
        *site_counts.entry(name).or_default() += 1;
    }
    let mut t = Coverage { m, entries, active: Vec::new(), sites, site_instructions: HashMap::new(),
                           total: Count::default(), covered: Count::default(),
                           per_native: vec![Count::default(); hle::NATIVES.len()], per_jump: BTreeMap::new() };
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
    let Coverage { total, covered, per_native, per_jump, entries, .. } = t;
    println!("Tour: {seconds:.0} s emulated, {} busy cycles ({:.0}%), {} instructions", total.cycles,
             100.0 * total.cycles as f64 / (seconds * CPU_HZ as f64), total.instructions);
    println!("{:<12} {:>9} {:>10} {:>8} {:>8}", "native", "at", "runs", "cycles", "instr");
    let row = |name: &str, at: String, c: Count| {
        println!("{name:<12} {at:>9} {:>10} {:>7.3}% {:>7.3}%", c.calls,
                 percent(c.cycles, total.cycles), percent(c.instructions, total.instructions));
    };
    for &(i, entry) in &entries {
        row(hle::NATIVES[i].1, format!("#{entry:05X}"), per_native[i]);
    }
    for &(addr, name, _) in hle::NATIVES {
        if !entries.iter().any(|&(_, e)| e == addr) {
            println!("{name:<12} #{addr:05X}  (not at this address in this ROM)");
        }
    }
    for (name, n) in site_counts {
        let at = if n == 1 { "1 site".to_string() } else { format!("{n} sites") };
        row(name, at, per_jump.get(name).copied().unwrap_or_default());
    }
    println!("Covered by natives: {:.3}% of cycles, {:.3}% of instructions",
             percent(covered.cycles, total.cycles), percent(covered.instructions, total.instructions));
}
