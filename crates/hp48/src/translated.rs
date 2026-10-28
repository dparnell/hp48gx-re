//! Running ROM code translated ahead of time into Rust (crate `hp48-rom`).
//!
//! The translator turns each ROM instruction into a Rust function, a
//! [`Block`], that executes it without fetching or decoding it and goes on
//! with the function of the instruction that follows, as long as execution
//! falls through. So a function runs the straight run of code from its
//! address on. [`Machine::step`](crate::Machine::step) runs the function at
//! PC, when there is one and ROM is visible all along its run.
//!
//! A run stops at every point where the interpreter would notice a
//! difference between instructions: a branch taken, the next timer tick or
//! the end of the run (the budget), an interrupt, wake-up or MP request
//! from the hardware, and SHUTDN. Each instruction also sees the LCD scan
//! line the interpreter would show it. So a machine running blocks goes
//! through exactly the same states as one that interprets the ROM.

use crate::hardware::Hardware;
use saturn::{Cpu, Op};

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

    /// Execute the instruction at `addr`, `len` nibbles long. Returns
    /// whether the block may go on with the next one.
    #[inline]
    pub fn op(&mut self, addr: u32, len: u32, op: Op) -> bool {
        self.hw.scan_line = crate::machine::scan_line(self.now + u64::from(self.spent));
        let next = (addr + len) & 0xF_FFFF;
        self.cpu.pc = next;
        let c = self.cpu.exec(op, len, self.hw);
        self.cpu.cycles += u64::from(c);
        self.spent += c;
        self.cpu.pc == next
            && self.spent < self.budget
            && !self.cpu.shutdown
            && !(self.hw.irq || self.hw.wake || self.hw.set_mp)
    }
}

/// Translated code by address, with the last address its run can reach.
pub type Blocks = std::sync::Arc<Vec<Option<(Block, u32)>>>;
