//! The calculator runs on a thread of its own, in real time, so that the
//! window is only drawn again when what it shows has changed: the LCD, the
//! annunciators, or the stack (which the desktop panel shows).

use eframe::egui;
use hp48::{Machine, CPU_HZ};
use std::hash::{Hash, Hasher};
use std::sync::atomic::{AtomicBool, Ordering};
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

/// The running thread; stopped when dropped.
pub struct Runner {
    stop: Arc<AtomicBool>,
    thread: Option<std::thread::JoinHandle<()>>,
}

impl Runner {
    /// Run `machine` in real time, asking `ctx` for a repaint whenever what
    /// it shows changes. `persistent`: save its state now and then.
    pub fn start(machine: Arc<Mutex<Machine>>, ctx: egui::Context, persistent: bool) -> Runner {
        let stop = Arc::new(AtomicBool::new(false));
        let flag = stop.clone();
        let thread = std::thread::spawn(move || {
            let (mut last, mut last_save, mut seen) = (Instant::now(), Instant::now(), 0);
            while !flag.load(Ordering::Relaxed) {
                std::thread::sleep(TICK);
                let now = Instant::now();
                // A long pause (the computer asleep) is not caught up here.
                let dt = (now - last).as_secs_f64().min(0.1);
                last = now;
                let mut m = machine.lock().unwrap();
                m.run((dt * CPU_HZ as f64) as u64);
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
