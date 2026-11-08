//! The HP 48GX calculator as an iOS app.
//!
//! Xcode (`ios/HP48GX.xcodeproj`) builds this crate as a static library and
//! links it into a small Objective-C program (`ios/HP48GX/main.m`), which
//! calls `hp48_main`. The ROM is built into the app: it is the one the
//! repository builds from `firmware/` (`ROM/gxrom-hires`).
//!
//! The functions are plain C, so that `main.m` can call them; `ios/build-rust.sh`
//! builds the library for the target Xcode asks for.

/// The ROM the app runs.
static ROM: &[u8] = include_bytes!("../../../ROM/gxrom-hires");

/// Warnings and errors from eframe, wgpu and winit, on stderr (Xcode's
/// console). eframe reports a failure to start this way, then exits.
struct Logger;

impl log::Log for Logger {
    fn enabled(&self, meta: &log::Metadata) -> bool {
        meta.level() <= log::Level::Warn
    }

    fn log(&self, record: &log::Record) {
        if self.enabled(record.metadata()) {
            eprintln!("{} {}: {}", record.level(), record.target(), record.args());
        }
    }

    fn flush(&self) {}
}

/// Run the app. It never returns: UIKit's run loop takes over the main
/// thread, and the system ends the app.
#[no_mangle]
pub extern "C" fn hp48_main() {
    if log::set_logger(&Logger).is_ok() {
        log::set_max_level(log::LevelFilter::Warn);
    }
    if let Err(e) = hp48_app::mobile::run(ROM.to_vec()) {
        eprintln!("HP 48GX: {e}");
        std::process::exit(1);
    }
}

/// The app is going to the background: save continuous memory.
#[no_mangle]
pub extern "C" fn hp48_suspend() {
    hp48_app::mobile::suspend();
}

/// The app is back in the foreground: catch the clock up.
#[no_mangle]
pub extern "C" fn hp48_resume() {
    hp48_app::mobile::resume();
}
