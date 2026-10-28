//! The calculator runs on a thread of its own, in real time, so that the
//! window is only drawn again when what it shows has changed: the LCD, the
//! annunciators, or the stack (which the desktop panel shows).
//!
//! At full speed the CPU runs as fast as this computer allows, while the
//! timers, the clock and the LCD keep real time (`Machine::set_speed`).

use eframe::egui;
use hp48::{Machine, CPU_HZ};
use std::hash::{Hash, Hasher};
use std::sync::atomic::{AtomicBool, AtomicU32, Ordering};
use std::sync::{Arc, Mutex};
use std::time::{Duration, Instant};

/// How often the thread runs the calculator: about the LCD's refresh rate.
const TICK: Duration = Duration::from_micros(8_333);

/// Continuous memory is saved this often, besides on exit.
const SAVE_EVERY: Duration = Duration::from_secs(60);

/// What the window shows of the calculator, as a hash.
pub fn shown(m: &Machine) -> u64 {
    const DSKTOP: u32 = 0x806F8;
    let lcd = m.lcd();
    let mut h = std::collections::hash_map::DefaultHasher::new();
    (lcd.pixels, lcd.annunciators, lcd.on, m.peek_value(DSKTOP, 5)).hash(&mut h);
    h.finish()
}

/// The fastest the CPU may run at full speed, in times the real one.
const MAX_SPEED: f64 = 4096.0;

/// The share of each tick that the CPU may take at full speed.
const BUSY_SHARE: f64 = 0.5;

/// Full speed, shared with the window.
#[derive(Default)]
pub struct Speed {
    /// Run the CPU as fast as possible (else at the real 4 MHz).
    pub full: AtomicBool,
    /// The CPU's clock rate lately, in kHz.
    pub khz: AtomicU32,
}

/// The running thread; stopped when dropped.
pub struct Runner {
    stop: Arc<AtomicBool>,
    thread: Option<std::thread::JoinHandle<()>>,
}

impl Runner {
    /// Run `machine` in real time, asking `ctx` for a repaint whenever what
    /// it shows changes. `persistent`: save its state now and then.
    pub fn start(machine: Arc<Mutex<Machine>>, ctx: egui::Context, persistent: bool, speed: Arc<Speed>) -> Runner {
        let stop = Arc::new(AtomicBool::new(false));
        let flag = stop.clone();
        let thread = std::thread::spawn(move || {
            let (mut last, mut last_save, mut seen) = (Instant::now(), Instant::now(), 0);
            let mut factor = 1.0f64;
            while !flag.load(Ordering::Relaxed) {
                std::thread::sleep(TICK);
                let now = Instant::now();
                // A long pause (the computer asleep) is not caught up here.
                let dt = (now - last).as_secs_f64().min(0.1);
                last = now;
                let full = speed.full.load(Ordering::Relaxed);
                if !full {
                    factor = 1.0;
                }
                let mut m = machine.lock().unwrap();
                m.set_speed(factor as u32);
                let (busy, start) = (m.cpu.cycles, Instant::now());
                let cycles = (dt * CPU_HZ as f64) as u64;
                m.run(cycles);
                if full {
                    // When the CPU was busy for most of the tick, scale the
                    // speed so that running it takes BUSY_SHARE of a tick.
                    let busy = (m.cpu.cycles - busy) as f64;
                    let work = start.elapsed().as_secs_f64().max(1e-6);
                    if busy > 0.8 * cycles as f64 * factor {
                        let target = factor * BUSY_SHARE * TICK.as_secs_f64() / work;
                        factor = target.clamp(factor / 2.0, factor * 2.0).clamp(1.0, MAX_SPEED);
                    }
                }
                speed.khz.store((factor * CPU_HZ as f64 / 1000.0) as u32, Ordering::Relaxed);
                let shown = shown(&m);
                if persistent && last_save.elapsed() >= SAVE_EVERY {
                    if let Err(e) = crate::persist::save(&m) {
                        eprintln!("could not save calculator state: {e}");
                    }
                    last_save = now;
                }
                drop(m);
                if shown != seen {
                    seen = shown;
                    ctx.request_repaint();
                }
            }
        });
        Runner { stop, thread: Some(thread) }
    }
}

impl Drop for Runner {
    fn drop(&mut self) {
        self.stop.store(true, Ordering::Relaxed);
        if let Some(t) = self.thread.take() {
            let _ = t.join();
        }
    }
}
