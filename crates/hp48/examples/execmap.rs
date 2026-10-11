//! Record what the ROM does while booting and running a tour of calculator
//! features, for the static analysis (tools/analyze.py):
//!   ADDR     an instruction the CPU executed
//!   O ADDR   an object: PC=(A)/PC=(C) jumped through its first word
//!   P ADDR   an RPL pointer slot: the inner loop fetched the object it ran
//!            from here (A=DAT0 A, D0=D0+5, PC=(A))
//!   A ADDR   an address in a table: a 5-nibble ROM word, read shortly before
//!            its value went into PC, D0 or D1
//!
//! cargo run --release -p hp48 --example execmap -- data/executed.txt
//!
//! Only addresses read from ROM count (not RAM or the bank switcher), so the
//! self-test code that runs before RAM is configured is included.

use hp48::{Key, Machine, CPU_HZ};
use saturn::{Field, Op, R};
use std::collections::{BTreeSet, VecDeque};

#[path = "common/tour.rs"]
mod tour;
use tour::{KEYS, TOUR};

struct Tour {
    m: Machine,
    seen: BTreeSet<u32>,
    objects: BTreeSet<u32>,
    slots: BTreeSet<u32>,
    tables: BTreeSet<u32>,
    /// Recent 5-nibble reads from ROM: (address, value).
    reads: VecDeque<(u32, u32)>,
}

impl Tour {
    fn run(&mut self, cycles: u64) {
        let end = self.m.time + cycles;
        while self.m.time < end {
            let pc = self.m.cpu.pc;
            let rom = |m: &Machine, a: u32| a < 0x100000 && m.hw.mmu.select(a).is_none();
            if !self.m.cpu.shutdown && rom(&self.m, pc) {
                self.seen.insert(pc);
                let reg = |m: &Machine, r: R| {
                    (match r {
                        R::A => m.cpu.a.0,
                        R::B => m.cpu.b.0,
                        R::C => m.cpu.c.0,
                        R::D => m.cpu.d.0,
                    } & 0xFFFFF) as u32
                };
                let (op, _) = self.m.cpu.peek(&mut self.m.hw);
                // A value about to become PC, D0 or D1.
                let used = match op {
                    Op::PcIndirect(r) => {
                        let v = reg(&self.m, r);
                        if rom(&self.m, v) {
                            self.objects.insert(v);
                        }
                        let slot = self.m.cpu.d0.wrapping_sub(5) & 0xFFFFF;
                        if rom(&self.m, slot) && self.m.peek_value(slot, 5) == u64::from(v) {
                            self.slots.insert(slot);
                        }
                        Some(v)
                    }
                    Op::PcFrom(r) | Op::PcEx(r) => Some(reg(&self.m, r)),
                    Op::DFromR { r, short: false, .. } | Op::DExR { r, short: false, .. } => Some(reg(&self.m, r)),
                    _ => None,
                };
                if let Some(v) = used {
                    // Upper-ROM library parts are copied to RAM before use, so
                    // reads there are the copier's, not table lookups.
                    if rom(&self.m, v) {
                        if let Some(&(slot, _)) = self.reads.iter().rev().find(|e| e.0 < 0x82000 && e.1 >= 0x140 && v >= e.1 && v - e.1 <= 10) {
                            self.tables.insert(slot);
                        }
                    }
                }
                // A ROM word stored verbatim (e.g. pushed on the stack) whose
                // value is the address of an object (it points at a prolog):
                // a pointer, even if it is used much later.
                if let Op::Mem { store: true, r, f: Field::A | Field::Nibbles(5), .. } = op {
                    let v = reg(&self.m, r);
                    let is_object = |m: &Machine, v: u32| {
                        let p = m.peek_value(v, 5) as u32;
                        rom(m, v) && (0x02911..=0x02E92).contains(&p) && m.peek_value(p, 5) == 0x028FC
                    };
                    if is_object(&self.m, v) {
                        if let Some(&(slot, _)) = self.reads.iter().rev().find(|e| e.0 < 0x82000 && e.1 == v) {
                            self.tables.insert(slot);
                        }
                    }
                }
                if let Op::Mem { store: false, d, f, .. } = op {
                    // The field's nibbles come from consecutive addresses; a
                    // wide read (W, M, ...) may hold an address anywhere in it.
                    let len = match f {
                        Field::A => 5,
                        Field::W => 16,
                        Field::M => 12,
                        Field::WP => u32::from(self.m.cpu.p) + 1,
                        Field::Nibbles(n) => u32::from(n),
                        _ => 0,
                    };
                    let at = if d == 0 { self.m.cpu.d0 } else { self.m.cpu.d1 };
                    for k in (0..(len + 1).saturating_sub(5)).step_by(5) {
                        let w = (at + k) & 0xFFFFF;
                        if rom(&self.m, w) {
                            self.reads.push_back((w, self.m.peek_value(w, 5) as u32));
                            if self.reads.len() > 16 {
                                self.reads.pop_front();
                            }
                        }
                    }
                }
            }
            self.m.run(1);
        }
    }

    fn tap(&mut self, k: Key) {
        self.m.key(k, true);
        self.run(CPU_HZ / 20);
        self.m.key(k, false);
        self.run(CPU_HZ / 10);
    }
}

fn main() {
    let out = std::env::args().nth(1).unwrap_or_else(|| "data/executed.txt".into());
    for line in TOUR {
        if let Err(c) = hp48::typing::keystrokes(line) {
            panic!("cannot type {c:?} in {line}");
        }
    }
    if out == "--check" {
        return;
    }
    let rom = std::fs::read("ROM/gxrom-r").expect("ROM/gxrom-r");
    let mut t = Tour { m: Machine::new(&rom), seen: BTreeSet::new(), objects: BTreeSet::new(), slots: BTreeSet::new(),
                         tables: BTreeSet::new(), reads: VecDeque::new() };
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
        eprintln!("{line}: {} addresses", t.seen.len());
    }
    for &k in KEYS {
        t.tap(k);
        t.run(CPU_HZ);
    }
    let mut text: String = t.seen.iter().map(|a| format!("{a:05X}\n")).collect();
    text += &t.objects.iter().map(|a| format!("O {a:05X}\n")).collect::<String>();
    text += &t.slots.iter().map(|a| format!("P {a:05X}\n")).collect::<String>();
    text += &t.tables.iter().map(|a| format!("A {a:05X}\n")).collect::<String>();
    std::fs::write(&out, format!("# ROM addresses executed by crates/hp48/examples/execmap.rs\n{text}")).expect("write");
    println!("{} instructions, {} objects, {} pointer slots, {} table addresses -> {out}",
             t.seen.len(), t.objects.len(), t.slots.len(), t.tables.len());
}
