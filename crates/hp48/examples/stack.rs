//! Type each argument as a command line, then print the decoded stack.
//!
//! cargo run --release -p hp48 --example stack -- "'SIN(T)+i*COS(T)'" "1 2"
use hp48::{Key, Machine, CPU_HZ};
use hp48_rpl::{decode, Memory};

const DSKTOP: u32 = 0x806F8;
/// Stack levels are 5-nibble pointers above DSKTOP's target; the list
/// ends with a zero pointer (the stack marker).
fn main() {
    let rom = std::fs::read("ROM/gxrom-r").unwrap();
    let mut m = Machine::new(&rom);
    m.run(3 * CPU_HZ);
    m.tap(Key::F);
    m.run(4 * CPU_HZ);
    for line in std::env::args().skip(1) {
        m.type_text(&line).unwrap_or_else(|c| panic!("cannot type {c:?}"));
        m.tap(Key::Enter);
        m.run(CPU_HZ);
    }
    let mem = |a: u32| m.hw.peek(a);
    let mut slot = mem.addr(DSKTOP);
    for level in 1..=8 {
        let obj = mem.addr(slot);
        if obj == 0 {
            break;
        }
        match decode(&mem, obj) {
            Ok(o) => println!("{level}: {o:?}"),
            Err(e) => println!("{level}: {e}"),
        }
        slot += 5;
    }
}
