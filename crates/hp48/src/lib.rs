//! HP 48GX hardware emulation around the Saturn CPU core.

pub mod hardware;
pub mod hle;
pub mod keyboard;
pub mod machine;
pub mod memory;
pub mod state;
pub mod typing;

pub use keyboard::Key;
pub use machine::{Jump, Lcd, Machine, Native, CPU_HZ, LCD_HEIGHT, LCD_WIDTH};
pub use state::StateError;

/// The ROM image to use when none is given: `$HP48_ROM` if set (e.g. a ROM
/// built from firmware/ by tools/build.py), else `ROM/gxrom-r`. A relative
/// path that does not exist here is taken from the repository root.
pub fn default_rom_path() -> std::path::PathBuf {
    let p = std::env::var_os("HP48_ROM").map_or_else(|| "ROM/gxrom-r".into(), std::path::PathBuf::from);
    if p.is_absolute() || p.exists() {
        return p;
    }
    // A relative path from the repository root (cargo test runs in the crate)
    std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("../..").join(p)
}

/// A 64-bit FNV-1a hash of a ROM image, to tell images apart.
pub fn rom_hash(image: &[u8]) -> u64 {
    image.iter().fold(0xcbf2_9ce4_8422_2325, |h, &b| (h ^ u64::from(b)).wrapping_mul(0x100_0000_01b3))
}

/// `rom_hash` of the original ROM, revision R.
pub const ROM_R_HASH: u64 = 0x163f_84fd_f57b_1e8e;
