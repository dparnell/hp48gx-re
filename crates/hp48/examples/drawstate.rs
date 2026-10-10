//! Watch the display pointers while the ROM draws a plot.
use hp48::{Key, Machine, CPU_HZ};

const VDISP: u32 = 0x806DA;
const GDISP: u32 = 0x806E4;
const ADISP: u32 = 0x806D5;

fn show(m: &Machine, what: &str) {
    let p = |a| m.peek_value(a, 5) as u32;
    println!(
        "{what:>12}: VDISP={:05X} GDISP={:05X} ADISP={:05X} dispaddr={:05X} annunc={:02X}",
        p(VDISP),
        p(GDISP),
        p(ADISP),
        m.hw.display_address(),
        m.hw.annunciators()
    );
}

fn main() {
    let rom = std::fs::read("ROM/gxrom-r").unwrap();
    let mut m = Machine::new(&rom);
    m.run(3 * CPU_HZ);
    m.tap(Key::F);
    m.run(4 * CPU_HZ);
    show(&m, "boot");
    m.type_text("'SIN(X)+1' 'EQ' STO RAD ERASE").unwrap();
    m.tap(Key::Enter);
    m.run(CPU_HZ);
    show(&m, "stack");
    m.type_text("DRAW").unwrap();
    m.tap(Key::Enter);
    for i in 0..12 {
        m.run(CPU_HZ / 4);
        show(&m, &format!("draw +{}ms", 250 * (i + 1)));
    }
    m.tap(Key::On);
    m.run(CPU_HZ);
    show(&m, "after ON");
    // Left-shift ◀ = PICTURE.
    m.tap(Key::LeftShift);
    m.tap(Key::Left);
    m.run(CPU_HZ);
    show(&m, "PICTURE");
    m.tap(Key::On);
    m.run(CPU_HZ);
    show(&m, "after ON");
}
