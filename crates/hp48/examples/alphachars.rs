//! List the character each key types in alpha mode with each shift, by
//! typing them all into a string and reading it back from the stack.
use hp48::{Key, Machine, CPU_HZ};
use hp48_rpl::{decode, Memory, Object};

const DSKTOP: u32 = 0x806F8;

struct Ram<'a>(&'a Machine);
impl Memory for Ram<'_> {
    fn nib(&self, a: u32) -> u8 {
        self.0.hw.peek(a)
    }
}

fn main() {
    let rom = std::fs::read("ROM/gxrom-r").unwrap();
    let mut m = Machine::new(&rom);
    m.run(3 * CPU_HZ);
    m.tap(Key::F);
    m.run(4 * CPU_HZ);
    let skip = [Key::Alpha, Key::LeftShift, Key::RightShift, Key::On, Key::Enter, Key::Backspace, Key::Del];
    for shift in [None, Some(Key::LeftShift), Some(Key::RightShift)] {
        let mut out = Vec::new();
        for k in Key::ALL.into_iter().filter(|k| !skip.contains(k)) {
            m.tap(Key::RightShift);
            m.tap(Key::Minus); // ""
            m.tap(Key::Alpha);
            if let Some(s) = shift {
                m.tap(s);
            }
            m.tap(k);
            m.tap(Key::Enter);
            m.run(CPU_HZ / 2);
            let mem = Ram(&m);
            let slot = mem.addr(DSKTOP);
            let s = match decode(&mem, mem.addr(slot)) {
                Ok(Object::String(s)) => s,
                o => format!("?{o:?}"),
            };
            out.push(format!("{k:?}={s:?}"));
            m.tap(Key::Backspace); // DROP
        }
        println!("{shift:?}: {}", out.join(" "));
    }
}
