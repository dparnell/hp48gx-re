//! Headless runner: boot the ROM, optionally type keys, print the LCD.
//!
//! hp48-cli [--rom PATH] [--seconds S] [--keys "K1 K2 ..."] [--wait S] [--profile]

use hp48::{Key, Machine, CPU_HZ, LCD_HEIGHT, LCD_WIDTH};
use std::collections::HashMap;

fn load_symbols() -> HashMap<u32, String> {
    let mut map = HashMap::new();
    for path in ["data/entries48g.txt", "../data/entries48g.txt", "../../data/entries48g.txt"] {
        if let Ok(text) = std::fs::read_to_string(path) {
            for line in text.lines().filter(|l| !l.starts_with('#')) {
                let mut it = line.split('\t');
                if let (Some(a), Some(n)) = (it.next(), it.next()) {
                    if a.len() == 5 {
                        if let Ok(v) = u32::from_str_radix(a, 16) {
                            map.entry(v).or_insert_with(|| n.to_string());
                        }
                    }
                }
            }
            break;
        }
    }
    map
}

fn key_by_name(name: &str) -> Option<Key> {
    let n = name.to_ascii_uppercase();
    Key::ALL.into_iter().find(|k| {
        let dbg = format!("{k:?}").to_ascii_uppercase();
        dbg == n || dbg.strip_prefix('N') == Some(n.as_str())
    })
}

fn print_lcd(m: &Machine) {
    let lcd = m.lcd();
    let a = lcd.annunciators;
    println!(
        "display {}  annunciators {:02X}  contrast {}",
        if lcd.on { "on" } else { "off" },
        a,
        lcd.contrast
    );
    println!("+{}+", "-".repeat(LCD_WIDTH));
    for y in (0..LCD_HEIGHT).step_by(2) {
        let row: String = (0..LCD_WIDTH)
            .map(|x| match (lcd.pixels[y][x], lcd.pixels[y + 1][x]) {
                (true, true) => '█',
                (true, false) => '▀',
                (false, true) => '▄',
                _ => ' ',
            })
            .collect();
        println!("|{row}|");
    }
    println!("+{}+", "-".repeat(LCD_WIDTH));
}

fn main() {
    let mut args = std::env::args().skip(1);
    let mut rom = String::from("ROM/gxrom-r");
    let mut seconds = 3.0f64;
    let mut keys: Vec<String> = Vec::new();
    let mut profile = false;
    let mut wait = 0.0f64;
    while let Some(a) = args.next() {
        match a.as_str() {
            "--rom" => rom = args.next().expect("--rom PATH"),
            "--seconds" => seconds = args.next().expect("--seconds S").parse().expect("number"),
            "--keys" => keys = args.next().expect("--keys LIST").split_whitespace().map(String::from).collect(),
            "--profile" => profile = true,
            "--wait" => wait = args.next().expect("--wait S").parse().expect("number"),
            other => panic!("unknown argument {other}"),
        }
    }
    let image = std::fs::read(&rom).unwrap_or_else(|e| panic!("reading {rom}: {e}"));
    let syms = load_symbols();
    let mut m = Machine::new(&image);

    let mut hist: HashMap<u32, u64> = HashMap::new();
    let total = (seconds * CPU_HZ as f64) as u64;
    let slice = CPU_HZ / 100;
    let run = |m: &mut Machine, cycles: u64, hist: &mut HashMap<u32, u64>| {
        if profile {
            let end = m.time + cycles;
            while m.time < end {
                *hist.entry(m.cpu.pc).or_default() += 1;
                m.run(1);
            }
        } else {
            let mut left = cycles;
            while left > 0 {
                let c = left.min(slice);
                m.run(c);
                left -= c;
            }
        }
    };
    run(&mut m, total, &mut hist);
    for k in &keys {
        let key = key_by_name(k).unwrap_or_else(|| panic!("unknown key {k}"));
        m.key(key, true);
        run(&mut m, CPU_HZ / 10, &mut hist);
        m.key(key, false);
        run(&mut m, CPU_HZ / 5, &mut hist);
    }
    run(&mut m, (wait * CPU_HZ as f64) as u64, &mut hist);

    print_lcd(&m);
    let c = &m.cpu;
    println!(
        "PC {:05X} {}  shutdown {}  P {}  ST {:04X}  carry {}  D0 {:05X} D1 {:05X}",
        c.pc,
        syms.get(&c.pc).map(String::as_str).unwrap_or(""),
        c.shutdown,
        c.p,
        c.st,
        c.carry,
        c.d0,
        c.d1
    );
    println!("A {:?} B {:?} C {:?} D {:?}", c.a, c.b, c.c, c.d);
    println!("RSTK {:05X?}", c.rstk());
    for md in &m.hw.mmu.modules {
        println!("  {:?} configured {} base {:05X} mask {:05X}", md.kind, md.configured(), md.base, md.mask);
    }
    if profile {
        let mut v: Vec<_> = hist.into_iter().collect();
        v.sort_by(|a, b| b.1.cmp(&a.1));
        for (pc, n) in v.into_iter().take(25) {
            let near = syms.range_name(pc);
            println!("{pc:05X} {n:>10}  {near}");
        }
    }
}

trait NearestSymbol {
    fn range_name(&self, pc: u32) -> String;
}

impl NearestSymbol for HashMap<u32, String> {
    fn range_name(&self, pc: u32) -> String {
        (0..0x200u32)
            .find_map(|d| pc.checked_sub(d).and_then(|a| self.get(&a)).map(|n| format!("{n}+{d:X}")))
            .unwrap_or_default()
    }
}
