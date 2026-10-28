//! Differential tests: every native routine must leave the machine exactly as
//! the ROM code it replaces. Skipped when ROM/gxrom-r is not present.

use hp48::hle::{self, NATIVES};
use hp48::Machine;
use saturn::Reg;

/// Small deterministic PRNG (xorshift64*), so failures are reproducible.
struct Rng(u64);
impl Rng {
    fn next(&mut self) -> u64 {
        self.0 ^= self.0 >> 12;
        self.0 ^= self.0 << 25;
        self.0 ^= self.0 >> 27;
        self.0.wrapping_mul(0x2545_F491_4F6C_DD1D)
    }
    /// Mostly small values, sometimes full-width, to hit both loop exits
    /// and overflow paths.
    fn value(&mut self) -> u64 {
        match self.next() % 4 {
            0 => self.next() % 16,
            1 => self.next() % 0x1000,
            2 => self.next() % 0x10_0000,
            _ => self.next(),
        }
    }
}

fn machine() -> Option<Machine> {
    let rom = std::fs::read(hp48::default_rom_path()).ok()?;
    Some(Machine::new(&rom))
}

#[test]
fn natives_match_rom() {
    let Some(base) = machine() else { return };
    let mut rng = Rng(0x48_6458_2025);
    for &(entry, name, f) in NATIVES {
        if !hle::routine_present(&base, entry) {
            eprintln!("{name}: not in this ROM, skipped");
            continue;
        }
        for case in 0..5000 {
            let mut m = base.clone();
            m.cpu.a = Reg(rng.value());
            m.cpu.b = Reg(rng.value());
            m.cpu.c = Reg(rng.value());
            m.cpu.d = Reg(rng.value());
            m.cpu.p = (rng.next() % 16) as u8;
            m.cpu.carry = rng.next().is_multiple_of(2);
            m.cpu.hst = (rng.next() % 16) as u8;
            if let Err(e) = hle::verify(&m, entry, f, 100_000) {
                panic!("{name} case {case}: {e}");
            }
        }
    }
}

#[test]
fn verify_detects_a_wrong_native() {
    let Some(mut m) = machine() else { return };
    m.cpu.a = Reg(7);
    m.cpu.c = Reg(1234);
    // MUL#'s native is not a replacement for DIV5.
    assert!(hle::verify(&m, 0x06A8E, hle::mul_bint, 10_000).is_err());
}

#[test]
fn calculator_works_with_natives_installed() {
    let Some(mut m) = machine() else { return };
    hle::install(&mut m);
    m.run(3 * hp48::CPU_HZ);
    // Still reaches the memory-recovery prompt and sleeps waiting for a key.
    assert!(m.cpu.shutdown);
}

/// Runs a machine with every native installed and checks the jump natives
/// against the ROM as they are reached: every call at first, then a sample.
struct Checked {
    m: Machine,
    names: std::collections::HashMap<u32, &'static str>,
    /// Calls and checks per native.
    counts: std::collections::BTreeMap<&'static str, (u64, u64)>,
    /// Check every call (HLE_CHECK_ALL=1), not a sample.
    all: bool,
}

impl Checked {
    fn run(&mut self, cycles: u64) {
        let end = self.m.time + cycles;
        while self.m.time < end {
            let pc = self.m.cpu.pc;
            if let (false, Some(&f)) = (self.m.cpu.shutdown, self.m.jumps.get(&pc)) {
                let count = self.counts.entry(self.names[&pc]).or_default();
                count.0 += 1;
                if self.all || count.0 <= 2000 || count.0.is_multiple_of(97) {
                    count.1 += 1;
                    if let Err(e) = hle::verify_jump(&self.m, f, end) {
                        panic!("{} (call {}): {e}", self.names[&pc], count.0);
                    }
                }
            }
            self.m.step(end);
        }
    }

    fn tap(&mut self, k: hp48::Key) {
        self.m.key(k, true);
        self.run(hp48::CPU_HZ / 20);
        self.m.key(k, false);
        self.run(hp48::CPU_HZ / 10);
    }

    fn enter(&mut self, line: &str) {
        for k in hp48::typing::keystrokes(line).unwrap_or_else(|c| panic!("cannot type {c:?}")) {
            self.tap(k);
        }
        self.tap(hp48::Key::Enter);
        self.run(hp48::CPU_HZ);
    }
}

const LINES: &[&str] = &[
    "1 2 + 3 *",
    "« 1 5 FOR I I NEXT » EVAL + + + +",
    "{ 1 2 3 } REVLIST \"AB\" \"C\" +",
    "'A' 5 STO A 'A' PURGE",
    // Programs holding embedded objects of each kind, and nested programs.
    "« 1.5 (1,2) #5h \"S\" { 1 { 2 } 'X' } 'X^2+1' :T:7 » EVAL",
    "« « 2 3 * » EVAL 4 + { « 5 » } 1 GET EVAL » EVAL",
    "{ 1 \"A\" { 2 3 } 'Y' :T:1 } DUP SIZE SWAP 3 GET",
];

#[test]
fn rpl_inner_loop_matches_rom() {
    let Some(mut m) = machine() else { return };
    hle::install(&mut m);
    let sites = hle::jump_sites(&m);
    let names = sites.iter().map(|&(a, n, _)| (a, n)).collect();
    for name in ["DOCOL", "SEMI"] {
        assert!(sites.iter().any(|s| s.1 == name), "{name} found");
    }
    assert!(sites.iter().filter(|s| s.1 == "push prolog").count() >= 20, "prologs found");
    let all = std::env::var_os("HLE_CHECK_ALL").is_some();
    let mut t = Checked { m, names, counts: Default::default(), all };
    t.run(3 * hp48::CPU_HZ);
    t.tap(hp48::Key::F);
    t.run(4 * hp48::CPU_HZ);
    for line in LINES {
        t.enter(line);
    }
    eprintln!("{:?}", t.counts);
    for name in ["NEXT", "push prolog", "DOCOL", "SEMI", "PRLG", "embedded", "SKIPOB", "wait timer", "wait count"] {
        assert!(t.counts.get(name).is_some_and(|c| c.1 > 20), "{name} ran: {:?}", t.counts);
    }
    // The same lines without natives leave the same objects on the stack.
    // Where they lie in RAM can differ: the ROM's memory layout depends on
    // timing (a plain run delayed by 777 cycles moves them too), and natives
    // take interrupts only between the units they replace.
    let Some(mut plain) = machine() else { return };
    plain.run(3 * hp48::CPU_HZ);
    plain.tap(hp48::Key::F);
    plain.run(4 * hp48::CPU_HZ);
    for line in LINES {
        plain.type_text(line).unwrap();
        plain.tap(hp48::Key::Enter);
        plain.run(hp48::CPU_HZ);
    }
    let objects = |m: &Machine| {
        let mem = |a: u32| m.hw.peek(a);
        let objects = hp48_rpl::stack(&mem).into_iter().map(|a| hp48_rpl::decode(&mem, a).unwrap());
        objects.map(|o| without_addresses(&format!("{o:?}"))).collect::<Vec<_>>()
    };
    let ours = objects(&t.m);
    assert!(ours.len() >= 5, "{ours:?}");
    assert_eq!(ours, objects(&plain));
}

/// A decoded object's text without the RAM addresses of undecoded objects.
fn without_addresses(text: &str) -> String {
    text.split("addr: ").enumerate().map(|(i, part)| if i == 0 { part } else { part.trim_start_matches(|c: char| c.is_ascii_digit()) }).collect()
}

#[test]
fn verify_jump_detects_a_wrong_native() {
    let Some(m) = machine() else { return };
    // At reset the CPU is not at SEMI.
    assert!(hle::verify_jump(&m, hle::semi, u64::MAX).is_err());
}

#[path = "../examples/common/tour.rs"]
mod tour;

/// The whole tour with the jump natives checked as they run (a few minutes;
/// HLE_CHECK_ALL=1 checks every call).
/// cargo test --release -p hp48 --test hle -- --ignored
#[test]
#[ignore]
fn rpl_inner_loop_matches_rom_on_tour() {
    let Some(mut m) = machine() else { return };
    hle::install(&mut m);
    m.natives.clear();
    let names = hle::jump_sites(&m).iter().map(|&(a, n, _)| (a, n)).collect();
    let all = std::env::var_os("HLE_CHECK_ALL").is_some();
    let mut t = Checked { m, names, counts: Default::default(), all };
    t.run(3 * hp48::CPU_HZ);
    t.tap(hp48::Key::F);
    t.run(4 * hp48::CPU_HZ);
    for line in tour::TOUR {
        for k in hp48::typing::keystrokes(line).unwrap() {
            t.tap(k);
        }
        t.tap(hp48::Key::Enter);
        t.run(2 * hp48::CPU_HZ);
        t.tap(hp48::Key::On);
        t.run(hp48::CPU_HZ / 2);
    }
    for &k in tour::KEYS {
        t.tap(k);
        t.run(hp48::CPU_HZ);
    }
    eprintln!("{:?}", t.counts);
}
