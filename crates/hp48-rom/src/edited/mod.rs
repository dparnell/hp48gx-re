//! Routines edited by hand. Each replaces the generated routine of the same
//! name when a machine runs `hp48_rom::install` (`install_generated` keeps
//! the generated ones).
//!
//! To start one, run
//!
//! ```text
//! cargo run --release -p hp48 --example translate -- --edit NAME
//! ```
//!
//! which copies the generated routine here as a file of its own and lists
//! it in [`EDITS`]. The generator never touches these files afterwards.
//!
//! The copy runs exactly like the generated code, so edit from there:
//!
//! - A routine is entered at PC, which may be any of its instructions,
//!   because a run can stop between any two (at a timer tick, say) and go
//!   on later. An edit that only handles some entry points can hand the
//!   others to the generated routine: `return crate::gen::NAME(r);`.
//! - The run must stop where the interpreter would: keep the `op!`, `io!`,
//!   `branch!` and `jump!` steps (or the checks they make) after each
//!   instruction. Then `tests/lockstep.rs` checks the edit against the
//!   interpreter as it checks the generated code.
//! - An edit that changes what the ROM does on purpose (fixing a ROM bug)
//!   will no longer match the interpreter; say so in its comments, and
//!   leave the inputs that show the difference out of the lockstep tests.
//! - The routine keeps the range of ROM addresses of the generated one:
//!   the machine runs it only when that range is ROM.

use crate::prelude::Block;

// One module per edited routine:
mod over;

/// Routines that replace their generated version, by name.
pub(crate) const EDITS: &[(&str, Block)] = &[
    ("OVER", over::OVER),
];
