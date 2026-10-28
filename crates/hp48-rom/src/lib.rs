//! The ROM's machine code translated into Rust.
//!
//! `src/gen/` is written by `cargo run --release -p hp48 --example
//! translate` (see hp48::translated): one function per instruction.
//! [`install`] makes a machine run them in place of interpreting that code.

mod gen;

/// What the generated code uses.
mod prelude {
    pub use hp48::translated::{Block, Run};
    pub use saturn::op::{Cmp, Cond, RtnKind, ScratchOp, Test};
    pub use saturn::reg::{Field, R};
    pub use saturn::Bus;
}

/// Run the translated code on `machine`, if its ROM is the one the code was
/// translated from. Returns whether it was installed.
pub fn install(machine: &mut hp48::Machine) -> bool {
    if hp48::rom_hash(&machine.hw.rom) != gen::ROM_HASH {
        return false;
    }
    let mut table = vec![None; 0x10_0000];
    for &(addr, last, block) in gen::ALL.iter().copied().flatten() {
        table[addr as usize] = Some((block, last));
    }
    machine.blocks = Some(std::sync::Arc::new(table));
    true
}

/// How many instructions were translated.
pub fn blocks() -> usize {
    gen::ALL.iter().map(|r| r.len()).sum()
}
