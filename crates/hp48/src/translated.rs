//! Running ROM code translated ahead of time into Rust (crate `hp48-rom`).
//!
//! The translator turns each ROM routine into a Rust function, a [`Block`].
//! Each instruction becomes a call of the CPU's method for it (the one the
//! interpreter uses) with constant operands; branches within the routine
//! loop back to its basic blocks, and control leaving the routine returns
//! to [`Machine::step`](crate::Machine::step), which runs the function of
//! the routine at PC when ROM is visible over all of it. A routine can be
//! entered at any of its instructions (PC is the entry point), because a
//! run may stop between any two.
//!
//! A run stops at every point where the interpreter would notice a
//! difference between instructions: the next timer tick or the end of the
//! run (the budget), an interrupt, wake-up or MP request from the
//! hardware, and instructions that change the configuration, interrupts or
//! SHUTDN. Each instruction that uses the bus also sees the LCD scan line
//! the interpreter would show it. Only the checks an instruction can need
//! are made after it: the budget always, the hardware after bus access.
//! PC and `Cpu::cycles` are brought up to date when the run stops. So a
//! machine running translated code goes through exactly the same states as
//! one that interprets the ROM.

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
    /// Machine time when the block started, the CPU's speed, and the CPU
    /// cycles then not yet counted in the time (see `Machine::set_speed`).
    now: u64,
    speed: u32,
    spare: u32,
}

impl<'a> Run<'a> {
    pub fn new(cpu: &'a mut Cpu, hw: &'a mut Hardware, budget: u32, now: u64, speed: u32, spare: u32) -> Self {
        Run { cpu, hw, budget, spent: 0, now, speed, spare }
    }

    /// Cycles spent so far.
    pub fn spent(&self) -> u32 {
        self.spent
    }

    /// Show the hardware the LCD scan line of this moment, before an
    /// instruction that uses the bus.
    #[inline]
    pub fn sync(&mut self) {
        let cycles = u64::from(self.spare) + u64::from(self.spent);
        self.hw.scan_line = crate::machine::scan_line(self.now + cycles / u64::from(self.speed));
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

    /// After an instruction that set PC (a branch, taken or not): may the
    /// routine go on from PC?
    #[inline]
    pub fn go(&mut self, cycles: u32) -> bool {
        self.spent += cycles;
        self.spent < self.budget
    }

    /// `go` after an instruction that also used the bus.
    #[inline]
    pub fn go_io(&mut self, cycles: u32) -> bool {
        self.spent += cycles;
        self.spent < self.budget && !(self.hw.irq || self.hw.wake || self.hw.set_mp)
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

/// Translated code by instruction address: the routine and the first and
/// last addresses it covers.
pub type Blocks = std::sync::Arc<Vec<Option<(Block, u32, u32)>>>;
