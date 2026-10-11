//! Check a ROM for the known bugs of revision R (firmware/BUGS.md), so a fix
//! built from firmware/ can be confirmed. Each check boots the ROM, does what
//! the bug report describes, and says whether the bug is present or fixed.
//!
//! cargo run --release -p hp48 --example knownbugs -- [ROM] [NAME...]
use hp48::{Key, Machine, CPU_HZ};
use hp48_rpl::{decode, lookup_var, Memory, Object};

const DSKTOP: u32 = 0x806F8;
/// RAM: the object whose argument check (CK0, CK1, ...) ran last; errors
/// are reported under the command whose header precedes it.
const LASTROMWDOB: u32 = 0x807D9;

fn boot(rom: &[u8]) -> Machine {
    let mut m = Machine::new(rom);
    m.run(3 * CPU_HZ);
    m.tap(Key::F);
    m.run(4 * CPU_HZ);
    m
}

fn enter(m: &mut Machine, line: &str, seconds: u64) {
    m.type_text(line).unwrap_or_else(|c| panic!("cannot type {c:?}"));
    m.tap(Key::Enter);
    m.run(seconds * CPU_HZ);
}

/// Tap each key, then run for the given seconds.
fn keys(m: &mut Machine, seq: &[(Key, u64)]) {
    for &(k, s) in seq {
        m.tap(k);
        m.run(s * CPU_HZ);
    }
}

fn level1(m: &Machine) -> Option<Object> {
    let mem = |a: u32| m.hw.peek(a);
    let obj = mem.addr(mem.addr(DSKTOP));
    (obj != 0).then(|| decode(&mem, obj).ok()).flatten()
}

/// The number in a unit object (`60_rpm` -> 60).
fn unit_value(o: &Option<Object>) -> Option<f64> {
    match o {
        Some(Object::Unit(items)) => match items.first() {
            Some(Object::Real(v)) => Some(*v),
            _ => None,
        },
        _ => None,
    }
}

fn close(a: f64, b: f64) -> bool {
    (a - b).abs() <= 1e-3 * b.abs().max(1.0)
}

/// Present, fixed, or could not tell (with what was seen).
enum Verdict {
    Present(String),
    Fixed(String),
    Unknown(String),
}

/// DTAG with an empty stack reports "XLIB 0 0 Error" instead of "DTAG
/// Error": its argument check runs in a helper without a command header.
fn dtag(rom: &[u8]) -> Verdict {
    let mut m = boot(rom);
    m.type_text("CLEAR DTAG").expect("typable");
    m.key(Key::Enter, true);
    // LASTROMWDOB is set again by later argument checks, so look at every
    // value it takes: is one of them preceded by DTAG's header (002 180)?
    let end = m.time + 2 * CPU_HZ;
    let mut last = m.peek_value(LASTROMWDOB, 5);
    let mut named = false;
    let release = m.time + CPU_HZ / 20;
    while m.time < end {
        if m.time >= release {
            m.key(Key::Enter, false);
        }
        m.run(1);
        let ob = m.peek_value(LASTROMWDOB, 5);
        if ob != last {
            let ob32 = ob as u32;
            named |= (m.peek_value(ob32 - 6, 3), m.peek_value(ob32 - 3, 3)) == (0x002, 0x180);
            last = ob;
        }
    }
    if named {
        Verdict::Fixed("the check runs in xDTAG, so errors name DTAG".into())
    } else {
        Verdict::Present("the check runs outside xDTAG, so errors name XLIB 0 0".into())
    }
}

/// 60_rpm converted to r/s gives 1 (RAD) instead of 2*pi: rotations are
/// converted as if they were in the current angle mode.
fn rpm(rom: &[u8]) -> Verdict {
    let mut m = boot(rom);
    enter(&mut m, "RAD 60_rpm 1_r 1_s / CONVERT", 2);
    match unit_value(&level1(&m)) {
        Some(v) if close(v, std::f64::consts::TAU) => Verdict::Fixed(format!("{v} r/s")),
        Some(v) => Verdict::Present(format!("{v} r/s, expected 6.28318530718")),
        None => Verdict::Unknown(format!("{:?}", level1(&m))),
    }
}

/// 6.2832_r/s + 1_Hz gives 361 Hz in DEG mode instead of 2 Hz.
fn hz(rom: &[u8]) -> Verdict {
    let mut m = boot(rom);
    enter(&mut m, "DEG 6.2832_r 1_s / 1_Hz +", 2);
    match unit_value(&level1(&m)) {
        Some(v) if close(v, 2.0) => Verdict::Fixed(format!("{v} Hz")),
        Some(v) => Verdict::Present(format!("{v} Hz, expected 2")),
        None => Verdict::Unknown(format!("{:?}", level1(&m))),
    }
}

/// FFT on a matrix (more than one row and column), repeated, can overflow
/// the return stack during an interrupt and lose memory.
fn fft(rom: &[u8]) -> Verdict {
    let mut m = boot(rom);
    enter(&mut m, "0 'N' STO", 1);
    enter(&mut m, "« 1 3000 START [[1 2][3 4]] FFT DROP 'N' INCR DROP NEXT »", 1);
    enter(&mut m, "EVAL", 300);
    let mem = |a: u32| m.hw.peek(a);
    let n = lookup_var(&mem, "N").and_then(|o| decode(&mem, o).ok());
    match n {
        Some(Object::Real(n)) => Verdict::Unknown(format!(
            "{n} FFTs ran without memory loss (the emulator may not time interrupts like the hardware)"
        )),
        other => Verdict::Present(format!("memory lost: N is {other:?}")),
    }
}

/// CLEAR, 63 CF, EQ LIB, down, ENTER, down, SOLV, NXT, 63 SF, right-shift
/// MUSER, DROP: memory clear. SAVESTACK (#61D41) is then entered with the
/// stack one level below empty; its copy loop runs off the end of RAM into
/// the I/O registers and sets "module pulled", which forces a warmstart.
fn eqlib(rom: &[u8]) -> Verdict {
    let mut m = boot(rom);
    enter(&mut m, "42 'KEEP' STO CLEAR 63 CF", 1);
    keys(&mut m, &[(Key::RightShift, 0), (Key::N3, 2), (Key::Down, 0), (Key::Enter, 2), (Key::Down, 1),
                   (Key::A, 3), (Key::Nxt, 1)]);
    enter(&mut m, "63 SF", 1);
    keys(&mut m, &[(Key::RightShift, 0), (Key::A, 2)]);
    enter(&mut m, "DROP", 5);
    // after a crash the ROM asks "Try To Recover Memory?"; NO clears memory
    keys(&mut m, &[(Key::F, 4)]);
    let mem = |a: u32| m.hw.peek(a);
    match lookup_var(&mem, "KEEP") {
        Some(_) => Verdict::Fixed("memory kept".into()),
        None => Verdict::Present("memory cleared".into()),
    }
}

/// MatrixWriter: 1 ENTER, GO-> off and on again, 2 ENTER 3 ENTER puts 3 on
/// a new row instead of after the 2.
fn matrixwriter(rom: &[u8]) -> Verdict {
    let mut m = boot(rom);
    keys(&mut m, &[(Key::RightShift, 0), (Key::Enter, 2), (Key::N1, 0), (Key::Enter, 1), (Key::E, 1), (Key::E, 1),
                   (Key::N2, 0), (Key::Enter, 1), (Key::N3, 0), (Key::Enter, 1), (Key::Enter, 2)]);
    match level1(&m) {
        Some(Object::Array { dims, .. }) if dims == [3] || dims == [1, 3] => Verdict::Fixed(format!("dims {dims:?}")),
        Some(Object::Array { dims, .. }) => Verdict::Present(format!("dims {dims:?}, expected [3]")),
        other => Verdict::Unknown(format!("{other:?}")),
    }
}

/// (name, description, check)
type Check = (&'static str, &'static str, fn(&[u8]) -> Verdict);

const CHECKS: &[Check] = &[
    ("dtag", "DTAG with an empty stack says XLIB 0 0 Error", dtag),
    ("rpm", "60_rpm -> r/s depends on the angle mode", rpm),
    ("hz", "r/s + Hz depends on the angle mode", hz),
    ("eqlib", "MUSER with flag 63 set, then DROP, clears memory", eqlib),
    ("mw", "MatrixWriter: GO-> off and on breaks the row", matrixwriter),
    ("fft", "repeated FFT on a matrix loses memory", fft),
];

fn main() {
    let args: Vec<String> = std::env::args().skip(1).collect();
    let (path, names) = match args.first() {
        Some(p) if !CHECKS.iter().any(|c| c.0 == p) => (p.clone(), &args[1..]),
        _ => (hp48::default_rom_path().display().to_string(), &args[..]),
    };
    let rom = std::fs::read(&path).unwrap_or_else(|e| panic!("reading {path}: {e}"));
    println!("{path}");
    let mut present = 0;
    for &(name, what, check) in CHECKS {
        if !names.is_empty() && !names.iter().any(|n| n == name) {
            continue;
        }
        let (tag, detail) = match check(&rom) {
            Verdict::Present(s) => {
                present += 1;
                ("PRESENT", s)
            }
            Verdict::Fixed(s) => ("fixed  ", s),
            Verdict::Unknown(s) => ("unknown", s),
        };
        println!("  {tag}  {name:5} {what}: {detail}");
    }
    std::process::exit(i32::from(present > 0));
}
