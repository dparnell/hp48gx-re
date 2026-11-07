//! Print what the hi-res display holds after a key script.
//!
//! cargo run --release -p hp48 --example hiresdump -- "1 Enter 0 Div"

use hp48::{Key, Machine, CPU_HZ};

fn main() {
    let script = std::env::args().nth(1).unwrap_or_default();
    let rom = std::fs::read(hp48::default_rom_path()).unwrap();
    let mut m = Machine::new(&rom);
    m.run(3 * CPU_HZ);
    m.tap(Key::F);
    m.run(4 * CPU_HZ);
    for name in script.split_whitespace() {
        let key = Key::ALL.into_iter().find(|k| format!("{k:?}").eq_ignore_ascii_case(name) || format!("{k:?}").eq_ignore_ascii_case(&format!("N{name}")));
        m.tap(key.unwrap_or_else(|| panic!("unknown key {name}")));
    }
    m.run(CPU_HZ);
    let lcd = m.sync_hires();
    let shown: Vec<_> = m.hw.hires.on_lcd().collect();
    for item in &m.hw.hires.items {
        let (w, h) = (item.rows[0].len(), item.rows.len());
        let state = if shown.iter().any(|&s| std::ptr::eq(s, item)) { "shown " } else { "hidden" };
        println!("{state} {:3},{:2} {w:3}x{h:2} {:?}", item.x, item.y, item.content);
        if state == "hidden" {
            for (y, row) in item.rows.iter().enumerate() {
                let want: String = row.iter().map(|&on| if on { '#' } else { '.' }).collect();
                let got: String = (0..w).map(|x| lcd.pixels.get(item.y + y).and_then(|l| l.get(item.x + x)).map_or('?', |&on| if on { '#' } else { '.' })).collect();
                println!("  {want}\n  {got}");
            }
        }
    }
}
