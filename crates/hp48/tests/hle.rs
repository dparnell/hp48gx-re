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
    let rom = std::fs::read(concat!(env!("CARGO_MANIFEST_DIR"), "/../../ROM/gxrom-r")).ok()?;
    Some(Machine::new(&rom))
}

#[test]
fn natives_match_rom() {
    let Some(base) = machine() else { return };
    let mut rng = Rng(0x48_6458_2025);
    for &(entry, name, f) in NATIVES {
        for case in 0..5000 {
            let mut m = base.clone();
            m.cpu.a = Reg(rng.value());
            m.cpu.b = Reg(rng.value());
            m.cpu.c = Reg(rng.value());
            m.cpu.d = Reg(rng.value());
            m.cpu.p = (rng.next() % 16) as u8;
            m.cpu.carry = rng.next() % 2 == 0;
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
