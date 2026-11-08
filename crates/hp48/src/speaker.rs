//! The speaker: bit 11 of the CPU's OUT register (docs/saturn.txt §4.8).
//!
//! The ROM makes a tone by switching that bit on and off in a timed loop
//! (`makebeep`), so the sound is the times of those switches. While
//! recording, each change of the bit is logged with the CPU cycle it
//! happened at, for the host to play. The cycle count, not the machine's
//! time, keeps the pitch right when the CPU runs faster than the real one.
//!
//! The host plays cycles at `clock` per second rather than at `CPU_HZ`.
//! `makebeep` times its tone from `CSPEED`, the CPU speed that `clkspd`
//! measures at start-up by counting a loop that reads the timer, and it
//! takes each turn of its own register-only loop to be 26 units of
//! `CSPEED * 16` per second. Our cycle counts (cpu.txt's table) make the
//! timer-reading loop cheaper, relative to the register loop, than the real
//! calculator does, so `CSPEED` comes out low and the ROM's tones play about
//! 28% high and short at 4 MHz. Playing at the clock the ROM's own figures
//! imply gives every ROM sound (BEEP, error beeps, alarms) the pitch and
//! length it asked for.

/// OUT's speaker bit.
pub const SPEAKER_BIT: u16 = 1 << 11;

/// Where `clkspd` leaves the measured CPU speed.
const CSPEED: u32 = 0x80655;

/// `makebeep`'s inner loop (`A=A-1 X`, `GONC` taken): our cycles, and the
/// units of `CSPEED * 16` per second that the ROM counts for it.
const BEEP_LOOP_CYCLES: f64 = 10.0;
const BEEP_LOOP_UNITS: f64 = 26.0;

/// The rate to play the speaker's cycle stamps at, in cycles per second:
/// the clock the ROM's own `CSPEED` figures imply (see the module notes), or
/// the real CPU's 4 MHz before `CSPEED` is measured.
pub fn clock(m: &crate::Machine) -> f64 {
    let cspeed = m.peek_value(CSPEED, 5);
    if cspeed == 0 {
        return crate::CPU_HZ as f64;
    }
    (cspeed * 16) as f64 * BEEP_LOOP_CYCLES / BEEP_LOOP_UNITS
}

/// Changes kept at most until the host takes them: a beep's worth and more
/// (a 4 kHz tone for 2 s is 16,000), so a host that stops taking them loses
/// sound, not memory.
const MAX_EDGES: usize = 1 << 16;

#[derive(Clone, Debug, Default)]
pub struct Speaker {
    /// The bit as last seen.
    pub level: bool,
    /// Log changes (off by default: the tests and the CLI make no sound).
    pub record: bool,
    /// Logged changes: the CPU cycle (`Cpu::cycles`) and the new level.
    pub edges: Vec<(u64, bool)>,
}

impl Speaker {
    /// The CPU's OUT register is `out` at CPU cycle `cycle`.
    #[inline]
    pub fn out(&mut self, out: u16, cycle: u64) {
        let level = out & SPEAKER_BIT != 0;
        if level != self.level {
            self.level = level;
            if self.record && self.edges.len() < MAX_EDGES {
                self.edges.push((cycle, level));
            }
        }
    }

    /// Take the changes logged so far.
    pub fn take(&mut self) -> Vec<(u64, bool)> {
        std::mem::take(&mut self.edges)
    }
}
