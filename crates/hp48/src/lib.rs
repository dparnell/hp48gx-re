//! HP 48GX hardware emulation around the Saturn CPU core.

pub mod hardware;
pub mod hle;
pub mod keyboard;
pub mod machine;
pub mod memory;
pub mod state;
pub mod typing;

pub use keyboard::Key;
pub use machine::{Lcd, Machine, Native, CPU_HZ, LCD_HEIGHT, LCD_WIDTH};
pub use state::StateError;
