//! The translated ROM code must take the machine through exactly the same
//! states as the interpreter: run a plain machine and one with the blocks
//! installed side by side and compare everything after each step of the
//! script. Skipped when the ROM is not present.

use hp48::{Key, Machine, CPU_HZ};

#[path = "../../hp48/examples/common/tour.rs"]
mod tour;

fn machine() -> Option<Machine> {
    let rom = std::fs::read(hp48::default_rom_path()).ok()?;
    Some(Machine::new(&rom))
}

/// Everything the two machines must agree on.
fn state(m: &Machine) -> String {
    let hw = &m.hw;
    format!(
        "time={} {:?} io={:?} crc={:04X} t1={} t2={} bank={} mmu={:?}",
        m.time, m.cpu, hw.io, hw.crc, hw.timer1, hw.timer2, hw.bank, hw.mmu
    )
}

struct Pair {
    plain: Machine,
    translated: Machine,
    checks: u32,
}

impl Pair {
    fn run(&mut self, cycles: u64) {
        // Compare often, so a difference is caught near where it arises.
        let slice = CPU_HZ / 50;
        let mut left = cycles;
        while left > 0 {
            let c = left.min(slice);
            self.plain.run(c);
            self.translated.run(c);
            left -= c;
            self.check();
        }
    }

    fn check(&mut self) {
        self.checks += 1;
        let (a, b) = (state(&self.plain), state(&self.translated));
        assert_eq!(a, b, "state differs at check {}", self.checks);
        assert!(self.plain.hw.ram == self.translated.hw.ram, "RAM differs at check {}", self.checks);
    }

    fn key(&mut self, k: Key, down: bool) {
        self.plain.key(k, down);
        self.translated.key(k, down);
    }

    fn tap(&mut self, k: Key) {
        self.key(k, true);
        self.run(CPU_HZ / 20);
        self.key(k, false);
        self.run(CPU_HZ / 10);
    }

    fn enter(&mut self, line: &str, wait: u64) {
        for k in hp48::typing::keystrokes(line).unwrap_or_else(|c| panic!("cannot type {c:?}")) {
            self.tap(k);
        }
        self.tap(Key::Enter);
        self.run(wait);
    }
}

fn pair() -> Option<Pair> {
    let plain = machine()?;
    let mut translated = plain.clone();
    assert!(hp48_rom::install(&mut translated), "translated from this ROM");
    let mut p = Pair { plain, translated, checks: 0 };
    p.run(3 * CPU_HZ);
    p.tap(Key::F);
    p.run(4 * CPU_HZ);
    Some(p)
}

#[test]
fn translated_code_matches_the_interpreter() {
    let Some(mut p) = pair() else { return };
    for line in ["1 2 + 3 *", "« 1 5 FOR I I NEXT » EVAL + + + +", "{ 1 \"A\" } 'X^2+1' 3 SQ", "RAD 'SIN(X)' STEQ ERASE DRAW"] {
        p.enter(line, 2 * CPU_HZ);
    }
    assert!(p.translated.block_runs > 100_000, "blocks ran: {}", p.translated.block_runs);
}

/// The whole tour (a few minutes).
/// cargo test --release -p hp48-rom -- --ignored
#[test]
#[ignore]
fn translated_code_matches_the_interpreter_on_tour() {
    let Some(mut p) = pair() else { return };
    for line in tour::TOUR {
        p.enter(line, 2 * CPU_HZ);
        p.tap(Key::On);
        p.run(CPU_HZ / 2);
    }
    for &k in tour::KEYS {
        p.tap(k);
        p.run(CPU_HZ);
    }
    eprintln!("{} blocks ran, {} checks", p.translated.block_runs, p.checks);
}
