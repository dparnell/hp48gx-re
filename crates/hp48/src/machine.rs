//! The complete calculator: CPU + hardware + time.

use crate::hardware::Hardware;
use crate::keyboard::Key;
use saturn::cpu::MP;
use saturn::Cpu;

/// Approximate Yorke clock rate of the 48GX.
pub const CPU_HZ: u64 = 4_000_000;
pub const LCD_WIDTH: usize = 131;
pub const LCD_HEIGHT: usize = 64;
/// Nibbles in one display row (136 pixels; 131 visible).
const ROW_NIBBLES: u32 = 34;

/// Annunciator bits as returned by [`Lcd::annunciators`].
pub mod annunciator {
    pub const LEFT_SHIFT: u8 = 0x01;
    pub const RIGHT_SHIFT: u8 = 0x02;
    pub const ALPHA: u8 = 0x04;
    pub const ALARM: u8 = 0x08;
    pub const BUSY: u8 = 0x10;
    pub const IO: u8 = 0x20;
    /// Annunciators are shown only while this is set.
    pub const ENABLE: u8 = 0x80;
}

/// One frame of the LCD.
#[derive(Clone)]
pub struct Lcd {
    pub pixels: [[bool; LCD_WIDTH]; LCD_HEIGHT],
    pub annunciators: u8,
    pub on: bool,
    pub contrast: u8,
}

pub struct Machine {
    pub cpu: Cpu,
    pub hw: Hardware,
    /// Elapsed emulated time in CPU cycles.
    pub time: u64,
    next_t1: u64,
    next_t2: u64,
    t2_count: u64,
    t1_count: u64,
}

fn period(hz: u64, n: u64) -> u64 {
    n * CPU_HZ / hz
}

impl Machine {
    /// Create a machine from a packed ROM image and power it on.
    pub fn new(rom_packed: &[u8]) -> Self {
        Machine {
            cpu: Cpu::new(),
            hw: Hardware::new(rom_packed),
            time: 0,
            next_t1: period(16, 1),
            next_t2: period(8192, 1),
            t2_count: 1,
            t1_count: 1,
        }
    }

    /// Run for about `cycles` CPU cycles of emulated time.
    pub fn run(&mut self, cycles: u64) {
        let end = self.time + cycles;
        while self.time < end {
            if self.cpu.shutdown {
                // Sleep until the next timer tick.
                let next = self.next_t1.min(self.next_t2).min(end);
                self.time = next;
                self.advance_timers();
                self.service();
                continue;
            }
            let c = self.cpu.step(&mut self.hw);
            self.time += u64::from(c);
            self.advance_timers();
            self.service();
        }
    }

    /// Run until the CPU reaches `addr` or `max_cycles` elapse; true if reached.
    pub fn run_until(&mut self, addr: u32, max_cycles: u64) -> bool {
        let end = self.time + max_cycles;
        while self.time < end {
            if self.cpu.pc == addr && !self.cpu.shutdown {
                return true;
            }
            self.run(1);
        }
        false
    }

    fn advance_timers(&mut self) {
        while self.time >= self.next_t2 {
            self.hw.tick_timer2();
            self.t2_count += 1;
            self.next_t2 = period(8192, self.t2_count);
        }
        while self.time >= self.next_t1 {
            self.hw.tick_timer1();
            self.t1_count += 1;
            self.next_t1 = period(16, self.t1_count);
        }
        // 64 lines refreshed 64 times a second.
        self.hw.scan_line = ((self.time * 64 * 64 / CPU_HZ) % 64) as u8;
    }

    /// Deliver interrupts and wake-ups requested by the hardware.
    fn service(&mut self) {
        if std::mem::take(&mut self.hw.set_mp) {
            self.cpu.hst |= MP;
        }
        if std::mem::take(&mut self.hw.wake) {
            self.cpu.shutdown = false;
        }
        if std::mem::take(&mut self.hw.irq) {
            self.cpu.interrupt();
        }
    }

    pub fn key(&mut self, key: Key, down: bool) {
        let was_down = self.hw.keyboard.input(0x1FF) != 0;
        self.hw.keyboard.set(key, down);
        if !down {
            return;
        }
        if key == Key::On {
            self.cpu.interrupt();
        } else if self.cpu.kbd_int_enabled && !was_down {
            self.cpu.interrupt();
        }
        if self.cpu.shutdown && self.hw.keyboard.input(self.cpu.out) != 0 {
            self.cpu.shutdown = false;
        }
    }

    /// Assemble the current LCD contents from display memory.
    pub fn lcd(&self) -> Lcd {
        let hw = &self.hw;
        let mut lcd = Lcd {
            pixels: [[false; LCD_WIDTH]; LCD_HEIGHT],
            annunciators: hw.annunciators(),
            on: hw.display_on(),
            contrast: hw.contrast(),
        };
        let lines = match hw.line_count() {
            0 => 63,
            n => n,
        };
        let offset = hw.bit_offset();
        let stride = (ROW_NIBBLES as i32 + hw.line_offset() + if offset > 3 { 2 } else { 0 }) as u32;
        for (y, row) in lcd.pixels.iter_mut().enumerate() {
            let y = y as u32;
            let (start, bit0) = if y <= u32::from(lines) {
                (hw.display_address().wrapping_add(y.wrapping_mul(stride)), offset)
            } else {
                (hw.menu_address() + (y - u32::from(lines) - 1) * ROW_NIBBLES, 0)
            };
            for (x, px) in row.iter_mut().enumerate() {
                let bit = bit0 + x as u32;
                let nib = hw.peek(start.wrapping_add(bit / 4));
                *px = nib & (1 << (bit % 4)) != 0;
            }
        }
        lcd
    }
}
