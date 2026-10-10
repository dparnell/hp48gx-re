//! Headless runner: boot the ROM, optionally type keys, print the LCD.
//!
//! hp48-cli [--rom PATH] [--seconds S] [--keys "K1 K2 ..."] [--wait S] [--profile] [--png OUT] [--dump OUT.txt] [--vector-png OUT] [--svg OUT]
//!
//! Keys may be written KEY:SECONDS to hold them; "wait:S" just runs.

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
    let mut png_out: Option<String> = None;
    let mut dump_out: Option<String> = None;
    let mut vpng_out: Option<String> = None;
    let mut svg_out: Option<String> = None;
    while let Some(a) = args.next() {
        match a.as_str() {
            "--rom" => rom = args.next().expect("--rom PATH"),
            "--seconds" => seconds = args.next().expect("--seconds S").parse().expect("number"),
            "--keys" => keys = args.next().expect("--keys LIST").split_whitespace().map(String::from).collect(),
            "--profile" => profile = true,
            "--png" => png_out = args.next(),
            "--dump" => dump_out = args.next(),
            "--vector-png" => vpng_out = args.next(),
            "--svg" => svg_out = args.next(),
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
        // KEY or KEY:SECONDS (how long to hold it)
        let (name, hold) = match k.split_once(':') {
            Some((n, h)) => (n, h.parse::<f64>().expect("hold seconds")),
            None => (k.as_str(), 0.1),
        };
        if name.eq_ignore_ascii_case("wait") {
            run(&mut m, (hold * CPU_HZ as f64) as u64, &mut hist);
            continue;
        }
        let key = key_by_name(name).unwrap_or_else(|| panic!("unknown key {name}"));
        m.key(key, true);
        run(&mut m, (hold * CPU_HZ as f64) as u64, &mut hist);
        m.key(key, false);
        run(&mut m, CPU_HZ / 5, &mut hist);
    }
    run(&mut m, (wait * CPU_HZ as f64) as u64, &mut hist);

    print_lcd(&m);
    if let Some(path) = &dump_out {
        // One line per LCD row, '1' = dark pixel.
        let lcd = m.lcd();
        let text: String = lcd
            .pixels
            .iter()
            .map(|row| row.iter().map(|&p| if p { '1' } else { '0' }).collect::<String>() + "
")
            .collect();
        std::fs::write(path, text).expect("write dump");
    }
    if vpng_out.is_some() || svg_out.is_some() {
        let scene = hp48_vector::vectorize(&hp48_vector::Bitmap::from_rows(&m.lcd().pixels));
        if let Some(path) = &svg_out {
            std::fs::write(path, scene.to_svg(LCD_WIDTH, LCD_HEIGHT, 8.0, 0.92)).expect("write svg");
        }
        if let Some(path) = &vpng_out {
            let (w, h, rgb) =
                hp48_vector::render_rgb(&scene, LCD_WIDTH, LCD_HEIGHT, 8.0, 0.92, [188, 198, 169], [30, 36, 28]);
            write_rgb_png(path, w, h, &rgb);
        }
    }
    if let Some(path) = &png_out {
        write_lcd_png(&m, path, 6);
    }
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
        v.sort_by_key(|e| std::cmp::Reverse(e.1));
        for (pc, n) in v.into_iter().take(25) {
            let near = syms.range_name(pc);
            println!("{pc:05X} {n:>10}  {near}");
        }
    }
}

fn write_rgb_png(path: &str, w: usize, h: usize, rgb: &[u8]) {
    let file = std::fs::File::create(path).expect("create png");
    let mut enc = png::Encoder::new(std::io::BufWriter::new(file), w as u32, h as u32);
    enc.set_color(png::ColorType::Rgb);
    enc.set_depth(png::BitDepth::Eight);
    enc.write_header().and_then(|mut wr| wr.write_image_data(rgb)).expect("write png");
}

/// Write the LCD as a PNG, each pixel `scale` x `scale` with a 1px grid.
fn write_lcd_png(m: &Machine, path: &str, scale: usize) {
    let lcd = m.lcd();
    let (w, h) = (LCD_WIDTH * scale, LCD_HEIGHT * scale);
    let mut raw = vec![0u8; w * h * 3];
    for y in 0..h {
        for x in 0..w {
            let on = lcd.pixels[y / scale][x / scale];
            let grid = x % scale == 0 || y % scale == 0;
            let c: [u8; 3] = match (on, grid) {
                (true, _) => [30, 36, 28],
                (false, true) => [170, 180, 150],
                (false, false) => [188, 198, 169],
            };
            raw[(y * w + x) * 3..][..3].copy_from_slice(&c);
        }
    }
    let file = std::fs::File::create(path).expect("create png");
    let mut enc = png::Encoder::new(std::io::BufWriter::new(file), w as u32, h as u32);
    enc.set_color(png::ColorType::Rgb);
    enc.set_depth(png::BitDepth::Eight);
    enc.write_header().and_then(|mut wr| wr.write_image_data(&raw)).expect("write png");
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
