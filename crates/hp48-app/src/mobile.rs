//! The calculator as a phone or tablet app (`crates/hp48-ios`).
//!
//! The host gives the ROM, there is no command line, and continuous memory
//! is saved whenever the app leaves the screen: a mobile system stops a
//! background app, and may end it, without telling it. The host calls
//! `suspend` when the app goes to the background and `resume` when it comes
//! back, which advances the calculator's clock by the time spent away.

use crate::{install_fonts, persist, App};
use eframe::{egui, egui_wgpu, wgpu};
use hp48::Machine;
use std::sync::{Arc, Mutex, OnceLock};
use std::time::{SystemTime, UNIX_EPOCH};

/// The running calculator, for `suspend` and `resume`.
static MACHINE: OnceLock<Arc<Mutex<Machine>>> = OnceLock::new();

/// When `suspend` was called, in seconds since the epoch.
static SUSPENDED_AT: Mutex<Option<f64>> = Mutex::new(None);

fn now_secs() -> f64 {
    SystemTime::now().duration_since(UNIX_EPOCH).map_or(0.0, |d| d.as_secs_f64())
}

/// Run the app on `rom`. On iOS this never returns: the system ends the app.
pub fn run(rom: Vec<u8>) -> eframe::Result {
    let options = eframe::NativeOptions {
        viewport: egui::ViewportBuilder::default().with_title("HP 48GX"),
        wgpu_options: wgpu_options(),
        ..Default::default()
    };
    eframe::run_native(
        "HP 48GX",
        options,
        Box::new(move |cc| {
            install_fonts(&cc.egui_ctx);
            // `App::new` restores the saved state, or answers the fresh
            // ROM's "Try To Recover Memory?" itself.
            let mut app = App::new(&rom, None, Vec::new(), true);
            let _ = MACHINE.set(app.machine.clone());
            app.start(&cc.egui_ctx);
            Ok(Box::new(app))
        }),
    )
}

/// Ask the GPU for no more than egui needs. wgpu's default limits are more
/// than some Metal devices give (the iOS simulator has 15 inter-stage
/// shader variables, not 16), and eframe then fails to start.
fn wgpu_options() -> egui_wgpu::WgpuConfiguration {
    let mut options = egui_wgpu::WgpuConfiguration::default();
    if let egui_wgpu::WgpuSetup::CreateNew(setup) = &mut options.wgpu_setup {
        setup.device_descriptor = Arc::new(|adapter| wgpu::DeviceDescriptor {
            label: Some("egui wgpu device"),
            required_limits: wgpu::Limits {
                max_texture_dimension_2d: adapter.limits().max_texture_dimension_2d.min(8192),
                ..wgpu::Limits::downlevel_defaults()
            },
            ..Default::default()
        });
    }
    options
}

/// The app is leaving the screen: save continuous memory now.
pub fn suspend() {
    let Some(machine) = MACHINE.get() else { return };
    if let Err(e) = persist::save(&machine.lock().unwrap()) {
        eprintln!("could not save calculator state: {e}");
    }
    *SUSPENDED_AT.lock().unwrap() = Some(now_secs());
}

/// The app is back on screen: catch the clock up with the time away (the
/// runner thread doesn't catch up long pauses).
pub fn resume() {
    let Some(machine) = MACHINE.get() else { return };
    if let Some(at) = SUSPENDED_AT.lock().unwrap().take() {
        machine.lock().unwrap().advance_clock((now_secs() - at).max(0.0));
    }
}
