//! Emulation of HP's Saturn (1LT8 / Yorke) 4-bit CPU.
//!
//! Memory is addressed in 4-bit nibbles over a 20-bit address space. The CPU
//! talks to memory and peripherals through the [`Bus`] trait.

pub mod cpu;
pub mod op;
pub mod reg;

pub use cpu::{Bus, Cpu};
pub use op::{decode, Op};
pub use reg::{Field, Reg, R};
