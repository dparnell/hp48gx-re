//! Continuous memory: the machine state is saved on exit and restored on
//! launch, with the calculator clock advanced by the time spent closed.

use hp48::Machine;
use std::path::PathBuf;
use std::time::{SystemTime, UNIX_EPOCH};

/// `HP48GX_STATE` overrides the location (used by tests).
pub fn state_path() -> Option<PathBuf> {
    if let Some(p) = std::env::var_os("HP48GX_STATE") {
        return Some(PathBuf::from(p));
    }
    let base = if cfg!(windows) {
        std::env::var_os("APPDATA").map(PathBuf::from)
    } else {
        std::env::var_os("XDG_DATA_HOME")
            .map(PathBuf::from)
            .or_else(|| std::env::home_dir().map(|h| h.join(".local").join("share")))
    }?;
    Some(base.join("HP48GX").join("state.bin"))
}

fn now_secs() -> f64 {
    SystemTime::now().duration_since(UNIX_EPOCH).map_or(0.0, |d| d.as_secs_f64())
}

/// File layout: 8-byte little-endian f64 save time, then the machine state.
pub fn save(machine: &Machine) -> std::io::Result<()> {
    let Some(path) = state_path() else { return Ok(()) };
    if let Some(dir) = path.parent() {
        std::fs::create_dir_all(dir)?;
    }
    let mut data = now_secs().to_le_bytes().to_vec();
    data.extend(machine.save_state());
    let tmp = path.with_extension("tmp");
    std::fs::write(&tmp, data)?;
    std::fs::rename(tmp, path)
}

/// Restore a saved state into `machine`; returns false if there was none.
pub fn load(machine: &mut Machine) -> bool {
    let Some(path) = state_path() else { return false };
    let Ok(data) = std::fs::read(&path) else { return false };
    if data.len() < 8 {
        return false;
    }
    let saved_at = f64::from_le_bytes(data[..8].try_into().unwrap());
    match machine.load_state(&data[8..]) {
        Ok(()) => {
            machine.advance_clock(now_secs() - saved_at);
            true
        }
        Err(e) => {
            eprintln!("ignoring {}: {e}", path.display());
            false
        }
    }
}
