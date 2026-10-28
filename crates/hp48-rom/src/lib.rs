//! The ROM's machine code translated into Rust.
//!
//! `src/gen/` is written by `cargo run --release -p hp48 --example
//! translate` (see hp48::translated): one function per routine of the
//! firmware source. [`install`] makes a machine run them in place of
//! interpreting that code.

mod gen;

/// What the generated code uses.
mod prelude {
    pub use hp48::translated::{Block, Run};
    pub use saturn::op::{Cmp, Cond, RtnKind, ScratchOp, Test};
    pub use saturn::reg::{Field, R};
    pub use saturn::Bus;

    /// An instruction from `a` to `next` taking `c` cycles, that leaves PC
    /// alone: skipped when the routine was entered after it.
    macro_rules! op {
        ($r:ident, $at:ident, $a:literal .. $next:literal, $c:expr, $s:expr) => {
            if $at <= $a {
                $s;
                if !$r.next($next, $c) {
                    return;
                }
            }
        };
    }

    /// `op!` for an instruction that uses the bus.
    macro_rules! io {
        ($r:ident, $at:ident, $a:literal .. $next:literal, $c:expr, $s:expr) => {
            if $at <= $a {
                $r.sync();
                $s;
                if !$r.next_io($next, $c) {
                    return;
                }
            }
        };
    }

    /// The last instruction of a block, which may branch: PC is set to
    /// `next` first, and the routine goes on wherever PC is after it.
    macro_rules! branch {
        ($r:ident, $at:ident, $next:literal, $c:expr, $s:expr) => {
            $r.cpu.pc = $next;
            $s;
            if !$r.go($c) {
                return;
            }
            $at = $r.cpu.pc;
        };
    }

    /// The last instruction of a block, which always sets PC.
    macro_rules! jump {
        ($r:ident, $at:ident, $c:expr, $s:expr) => {
            $s;
            if !$r.go($c) {
                return;
            }
            $at = $r.cpu.pc;
        };
    }

    /// `jump!` for an instruction that uses the bus.
    macro_rules! jump_io {
        ($r:ident, $at:ident, $c:expr, $s:expr) => {
            $r.sync();
            $s;
            if !$r.go_io($c) {
                return;
            }
            $at = $r.cpu.pc;
        };
    }

    pub(crate) use {branch, io, jump, jump_io, op};
}

/// Run the translated code on `machine`, if its ROM is the one the code was
/// translated from. Returns whether it was installed.
pub fn install(machine: &mut hp48::Machine) -> bool {
    let rom = &machine.hw.rom;
    if hp48::rom_hash(rom) != gen::ROM_HASH {
        return false;
    }
    let mut table = vec![None; 0x10_0000];
    for &(first, last, routine) in gen::ALL.iter().copied().flatten() {
        // A routine's instructions follow each other from `first`.
        let mut a = first;
        while a <= last {
            table[a as usize] = Some((routine, first, last));
            a += saturn::decode(a, |x| rom[(x & 0xF_FFFF) as usize]).1;
        }
    }
    machine.blocks = Some(std::sync::Arc::new(table));
    true
}

/// How many routines were translated.
pub fn routines() -> usize {
    gen::ALL.iter().map(|r| r.len()).sum()
}
