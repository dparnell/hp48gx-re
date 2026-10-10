//! Compare fine-grained and coarse run() calls for a shift tap.
use hp48::{Key, Machine, CPU_HZ};

fn trial(slice: u64, hold: f64) -> u8 {
    let rom = std::fs::read("ROM/gxrom-r").unwrap();
    let mut m = Machine::new(&rom);
    m.run(3 * CPU_HZ);
    m.tap(Key::F);
    m.run(3 * CPU_HZ);
    let go = |m: &mut Machine, cycles: u64| {
        let end = m.time + cycles;
        while m.time < end {
            m.run(slice.min(end - m.time));
        }
    };
    m.key(Key::LeftShift, true);
    go(&mut m, (hold * CPU_HZ as f64) as u64);
    m.key(Key::LeftShift, false);
    go(&mut m, CPU_HZ / 2);
    m.hw.annunciators()
}

fn main() {
    for slice in [1u64, 100, 1000, 10_000, 40_000] {
        for hold in [0.1, 0.3] {
            println!("slice {slice:>6} hold {hold}: annunciators {:02X}", trial(slice, hold));
        }
    }
}
