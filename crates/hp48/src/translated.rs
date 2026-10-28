//! Running ROM code translated ahead of time into Rust (crate `hp48-rom`).
//!
//! The translator turns each ROM instruction into a Rust function, a
//! [`Block`], that executes it by calling the CPU's method for that
//! instruction (the one the interpreter uses) with constant operands, and
//! goes on with the function of the instruction that follows, as long as
//! execution falls through. So a function runs the straight run of code from its
//! address on. [`Machine::step`](crate::Machine::step) runs the function at
//! PC, when there is one and ROM is visible all along its run.
//!
//! A run stops at every point where the interpreter would notice a
//! difference between instructions: a branch taken, the next timer tick or
//! the end of the run (the budget), an interrupt, wake-up or MP request
//! from the hardware, and SHUTDN. Each instruction that uses the bus also
//! sees the LCD scan line the interpreter would show it. Only the checks an
//! instruction can need are made after it: the budget always, PC after
//! branches, the hardware after bus access. PC and `Cpu::cycles` are
//! brought up to date when the block stops. So a machine running blocks goes
//! through exactly the same states as one that interprets the ROM.

use crate::hardware::Hardware;
use saturn::Cpu;

/// Translated ROM code from one address on.
pub type Block = fn(&mut Run);

/// A block's view of the machine while it runs.
pub struct Run<'a> {
    pub cpu: &'a mut Cpu,
    pub hw: &'a mut Hardware,
    /// Cycles the block may run: it stops at the first instruction that
    /// reaches this.
    budget: u32,
    spent: u32,
    /// Machine time when the block started.
    now: u64,
}

impl<'a> Run<'a> {
    pub fn new(cpu: &'a mut Cpu, hw: &'a mut Hardware, budget: u32, now: u64) -> Self {
        Run { cpu, hw, budget, spent: 0, now }
    }

    /// Cycles spent so far.
    pub fn spent(&self) -> u32 {
        self.spent
    }

    /// Show the hardware the LCD scan line of this moment, before an
    /// instruction that uses the bus.
    #[inline]
    pub fn sync(&mut self) {
        self.hw.scan_line = crate::machine::scan_line(self.now + u64::from(self.spent));
    }

    /// After an instruction that touches neither PC nor the hardware: may
    /// the block go on to the one at `next`? If not, PC is left there.
    #[inline]
    pub fn next(&mut self, next: u32, cycles: u32) -> bool {
        self.spent += cycles;
        if self.spent < self.budget {
            return true;
        }
        self.cpu.pc = next;
        false
    }

    /// After an instruction that may branch or return (PC was set to
    /// `next` before it): go on only if it fell through.
    #[inline]
    pub fn next_pc(&mut self, next: u32, cycles: u32) -> bool {
        self.spent += cycles;
        self.cpu.pc == next && self.spent < self.budget
    }

    /// After an instruction that used the bus: go on unless the hardware
    /// now wants attention (an interrupt, wake-up or MP request).
    #[inline]
    pub fn next_io(&mut self, next: u32, cycles: u32) -> bool {
        self.spent += cycles;
        if self.spent < self.budget && !(self.hw.irq || self.hw.wake || self.hw.set_mp) {
            return true;
        }
        self.cpu.pc = next;
        false
    }

    /// The last instruction of a run, which leaves PC at `next`.
    #[inline]
    pub fn end(&mut self, next: u32, cycles: u32) {
        self.spent += cycles;
        self.cpu.pc = next;
    }

    /// The last instruction of a run, which set PC itself.
    #[inline]
    pub fn spend(&mut self, cycles: u32) {
        self.spent += cycles;
    }
}

/// Translated code by address, with the last address its run can reach.
pub type Blocks = std::sync::Arc<Vec<Option<(Block, u32)>>>;
