//! The CPU against the frozen nibble-by-nibble reference
//! (`reference/cpu.rs`): random instructions on random states must leave
//! the same CPU state, memory and bus traffic.

mod op {
    pub use saturn::op::*;
}
mod reg {
    pub use saturn::reg::*;
}
#[path = "reference/cpu.rs"]
#[allow(dead_code)]
mod reference;

/// 4K nibbles of memory (addresses wrap), and a log of the bus traffic.
#[derive(Clone, PartialEq, Debug)]
struct Mem {
    nibs: Vec<u8>,
    log: Vec<(char, u32)>,
}

impl Mem {
    fn fetch(&mut self, a: u32) -> u8 {
        self.nibs[(a & 0xFFF) as usize]
    }
    fn read(&mut self, a: u32) -> u8 {
        self.log.push(('r', a));
        self.nibs[(a & 0xFFF) as usize]
    }
    fn write(&mut self, a: u32, v: u8) {
        self.log.push(('w', a));
        self.nibs[(a & 0xFFF) as usize] = v;
    }
    fn input(&mut self, out: u16) -> u16 {
        out.wrapping_mul(0x9E37)
    }
    fn keys_down(&mut self, out: u16) -> bool {
        out & 1 != 0
    }
}

macro_rules! bus {
    ($tr:path) => {
        impl $tr for Mem {
            fn fetch(&mut self, a: u32) -> u8 {
                Mem::fetch(self, a)
            }
            fn read(&mut self, a: u32) -> u8 {
                Mem::read(self, a)
            }
            fn write(&mut self, a: u32, v: u8) {
                Mem::write(self, a, v)
            }
            fn config(&mut self, v: u32) {
                self.log.push(('c', v));
            }
            fn unconfig(&mut self, v: u32) {
                self.log.push(('u', v));
            }
            fn reset_config(&mut self) {
                self.log.push(('x', 0));
            }
            fn chip_id(&mut self) -> u32 {
                0x12345
            }
            fn input(&mut self, out: u16) -> u16 {
                Mem::input(self, out)
            }
            fn keys_down(&mut self, out: u16) -> bool {
                Mem::keys_down(self, out)
            }
        }
    };
}
bus!(saturn::Bus);
bus!(reference::Bus);

struct Rng(u64);

impl Rng {
    fn next(&mut self) -> u64 {
        self.0 ^= self.0 << 13;
        self.0 ^= self.0 >> 7;
        self.0 ^= self.0 << 17;
        self.0
    }

    /// A register value: random, all decimal digits, or mostly 0s and 9s/Fs,
    /// so carries, BCD and invalid digits all come up.
    fn reg(&mut self) -> u64 {
        match self.next() % 4 {
            0 => self.next(),
            1 => (0..16).fold(0, |v, _| (v << 4) | (self.next() % 10)),
            2 => (0..16).fold(0, |v, _| (v << 4) | [0, 9, 0xF, 1][(self.next() % 4) as usize]),
            _ => self.next() & 0xF_FFFF,
        }
    }
}

macro_rules! set_state {
    ($cpu:expr, $s:expr) => {{
        let (regs, scratch, d0, d1, p, pc, st, hst, carry, dec, out, rstk, int) = $s;
        let cpu = &mut $cpu;
        (cpu.a.0, cpu.b.0, cpu.c.0, cpu.d.0) = (regs[0], regs[1], regs[2], regs[3]);
        for i in 0..5 {
            cpu.r[i].0 = scratch[i];
        }
        (cpu.d0, cpu.d1, cpu.p, cpu.pc, cpu.st, cpu.hst, cpu.carry, cpu.dec, cpu.out) = (d0, d1, p, pc, st, hst, carry, dec, out);
        cpu.set_rstk(&rstk);
        (cpu.interruptible, cpu.int_pending) = int;
    }};
}

#[test]
fn instructions_match_the_nibble_by_nibble_reference() {
    let mut rng = Rng(0x2545_F491_4F6C_DD1D);
    for trial in 0..300_000 {
        let mut nibs: Vec<u8> = (0..0x1000).map(|_| (rng.next() & 0xF) as u8).collect();
        let pc = (rng.next() & 0xFF0) as u32;
        // Bias the first nibbles towards the arithmetic groups' prefixes
        // now and then, so field operations come up often.
        if trial % 3 == 0 {
            nibs[pc as usize] = [0xA, 0xB, 0xC, 0xD, 0xE, 0xF, 0x8, 0x1][(rng.next() % 8) as usize];
        }
        let regs = [rng.reg(), rng.reg(), rng.reg(), rng.reg()];
        let scratch = [rng.reg(), rng.reg(), rng.reg(), rng.reg(), rng.reg()];
        let rstk: Vec<u32> = (0..rng.next() % 9).map(|_| (rng.next() & 0xF_FFFF) as u32).collect();
        let state = (
            regs,
            scratch,
            (rng.next() & 0xF_FFFF) as u32,
            (rng.next() & 0xF_FFFF) as u32,
            (rng.next() & 0xF) as u8,
            pc,
            rng.next() as u16,
            (rng.next() & 0xF) as u8,
            rng.next() & 1 != 0,
            rng.next().is_multiple_of(3),
            (rng.next() & 0xFFF) as u16,
            rstk,
            (rng.next() & 1 != 0, rng.next() & 1 != 0),
        );
        let mut new = saturn::Cpu::new();
        let mut old = reference::Cpu::new();
        set_state!(new, state.clone());
        set_state!(old, state);
        let mut mem_new = Mem { nibs: nibs.clone(), log: Vec::new() };
        let mut mem_old = Mem { nibs, log: Vec::new() };
        let (op, _) = new.peek(&mut mem_new);
        let c_new = new.step(&mut mem_new);
        let c_old = old.step(&mut mem_old);
        let (a, b) = (format!("{new:?}"), format!("{old:?}"));
        assert_eq!(a, b, "trial {trial}: {op}");
        assert_eq!(c_new, c_old, "trial {trial}: cycles of {op}");
        assert!(mem_new == mem_old, "trial {trial}: memory or bus traffic of {op}");
    }
}
