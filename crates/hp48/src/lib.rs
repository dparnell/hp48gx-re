//! HP 48GX hardware emulation around the Saturn CPU core.

pub mod hardware;
pub mod keyboard;
pub mod machine;
pub mod memory;

pub use keyboard::Key;
pub use machine::{Lcd, Machine, CPU_HZ, LCD_HEIGHT, LCD_WIDTH};
