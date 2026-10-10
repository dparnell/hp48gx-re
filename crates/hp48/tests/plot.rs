//! The native plot geometry (hp48_rpl::plot) against what the ROM draws.
//!
//! Each case sets a plot up on the calculator, lets the ROM DRAW it into
//! PICT, and compares PICT with the native marks rasterised at the same
//! 131x64 resolution. Lines are joined differently, so pixels match within
//! one pixel. Skipped when ROM/gxrom-r is not present.

use hp48::{Key, Machine, CPU_HZ};
use hp48_rpl::plot::{read_spec, Mark, Spec};
use hp48_rpl::Memory;
use std::collections::HashSet;

/// RAM pointer to the graphics grob (PICT).
const GDISP: u32 = 0x806E4;
const BUSY: u8 = 0x10;

struct Ram<'a>(&'a Machine);

impl Memory for Ram<'_> {
    fn nib(&self, a: u32) -> u8 {
        self.0.hw.peek(a)
    }
}

type Pixels = HashSet<(i32, i32)>;

fn machine() -> Option<Machine> {
    let rom = std::fs::read(concat!(env!("CARGO_MANIFEST_DIR"), "/../../ROM/gxrom-r")).ok()?;
    let mut m = Machine::new(&rom);
    m.run(3 * CPU_HZ);
    m.tap(Key::F);
    m.run(4 * CPU_HZ);
    Some(m)
}

fn enter(m: &mut Machine, line: &str) {
    m.type_text(line).unwrap_or_else(|c| panic!("cannot type {c:?}"));
    m.tap(Key::Enter);
    m.run(CPU_HZ / 2);
}

/// The lit pixels of the grob at `addr`: prolog, length, height, width,
/// then rows padded to whole bytes, leftmost pixel in the low bit.
fn grob_pixels(mem: &impl Memory, addr: u32) -> Pixels {
    let h = mem.addr(addr + 10);
    let w = mem.addr(addr + 15);
    let stride = w.div_ceil(8) * 2;
    let mut out = Pixels::new();
    for y in 0..h {
        for x in 0..w {
            if mem.nib(addr + 20 + y * stride + x / 4) & (1 << (x % 4)) != 0 {
                out.insert((x as i32, y as i32));
            }
        }
    }
    out
}

/// Set up, let the ROM draw, and return the spec and the drawn pixels.
fn rom_draw(setup: &[&str]) -> Option<(Spec, Pixels)> {
    let mut m = machine()?;
    for line in setup {
        enter(&mut m, line);
    }
    enter(&mut m, "ERASE DRAW");
    for _ in 0..4000 {
        if m.hw.annunciators() & BUSY == 0 {
            break;
        }
        m.run(CPU_HZ / 4);
    }
    assert_eq!(m.hw.annunciators() & BUSY, 0, "DRAW did not finish");
    let mem = Ram(&m);
    let spec = read_spec(&mem).expect("plot spec");
    let pict = grob_pixels(&mem, mem.addr(GDISP));
    Some((spec, pict))
}

/// Rasterise the native marks the way the ROM maps plot coordinates to
/// PICT: x0..x1 onto columns 0..130, y1..y0 onto rows 0..63.
fn native_pixels(spec: &Spec) -> Pixels {
    let v = spec.view();
    let col = |x: f64| (x - v.x0) / (v.x1 - v.x0) * 130.0;
    let row = |y: f64| (v.y1 - y) / (v.y1 - v.y0) * 63.0;
    let on_screen = |p: &(i32, i32)| (0..131).contains(&p.0) && (0..64).contains(&p.1);
    let mut out = Pixels::new();
    for layer in spec.trace(v, 131.0, 64.0) {
        for mark in layer {
            match mark {
                Mark::Dot(x, y) => {
                    out.insert((col(x).round() as i32, row(y).round() as i32));
                }
                Mark::Line(pts) => {
                    for w in pts.windows(2) {
                        let (a, b) = ((col(w[0].0), row(w[0].1)), (col(w[1].0), row(w[1].1)));
                        let steps = ((b.0 - a.0).abs().max((b.1 - a.1).abs()) * 4.0).ceil().clamp(1.0, 4000.0) as usize;
                        for s in 0..=steps {
                            let t = s as f64 / steps as f64;
                            out.insert(((a.0 + (b.0 - a.0) * t).round() as i32, (a.1 + (b.1 - a.1) * t).round() as i32));
                        }
                    }
                }
                Mark::Rect(x0, y0, x1, y1) => {
                    let (c0, c1) = (col(x0).min(col(x1)), col(x0).max(col(x1)));
                    let (r0, r1) = (row(y0).min(row(y1)), row(y0).max(row(y1)));
                    for c in c0.ceil() as i32..=c1.floor() as i32 {
                        for r in r0.ceil() as i32..=r1.floor() as i32 {
                            out.insert((c, r));
                        }
                    }
                }
            }
        }
    }
    out.retain(on_screen);
    out
}

/// Fraction of `a` within one pixel of something in `b`.
fn covered(a: &Pixels, b: &Pixels) -> f64 {
    if a.is_empty() {
        return 1.0;
    }
    let near = |&(x, y): &(i32, i32)| (-1..=1).any(|dx| (-1..=1).any(|dy| b.contains(&(x + dx, y + dy))));
    a.iter().filter(|p| near(p)).count() as f64 / a.len() as f64
}

fn check(setup: &[&str], min: f64) {
    let Some((spec, rom)) = rom_draw(setup) else { return };
    let native = native_pixels(&spec);
    let (recall, precision) = (covered(&rom, &native), covered(&native, &rom));
    println!("{:?}: ROM {} px, native {} px, recall {recall:.3}, precision {precision:.3}", spec.kind, rom.len(), native.len());
    assert!(rom.len() >= 5, "the ROM drew almost nothing");
    assert!(recall >= min && precision >= min, "{:?} differs from the ROM: recall {recall:.3}, precision {precision:.3}", spec.kind);
}

#[test]
fn function_matches_rom() {
    check(&["RAD 'SIN(X)+1' STEQ FUNCTION"], 0.97);
}

#[test]
fn function_degrees_and_equation_sides() {
    check(&["DEG 'X/2=SIN(60*X)' STEQ FUNCTION"], 0.97);
}

#[test]
fn polar_matches_rom() {
    check(&["RAD '2*COS(2*X)' STEQ POLAR"], 0.95);
}

#[test]
fn parametric_matches_rom() {
    check(&["RAD '2*SIN(3*T)+i*SIN(2*T)' STEQ PARAMETRIC 'T' INDEP"], 0.95);
}

#[test]
fn conic_matches_rom() {
    check(&["RAD 'X^2/9+Y^2/4=1' STEQ CONIC"], 0.95);
}

#[test]
fn scatter_matches_rom() {
    check(&["[[1 2][-2 1.5][3 -1][-4 -2.5][5 0.5]] 133 CHR \"DAT\" + STR→ STO SCATTER"], 0.99);
}

#[test]
fn bar_matches_rom() {
    check(&["[[1 2][2 4][3 5][2.5 4][1.5 1]] 133 CHR \"DAT\" + STR→ STO BAR -1 6 XRNG -1 6 YRNG"], 0.97);
}

#[test]
fn histogram_matches_rom() {
    check(&["[[1 2][3.5 4][4 5][4.5 4][5 1][5.5 1][4.2 0]] 133 CHR \"DAT\" + STR→ STO HISTOGRAM 0 6 XRNG -1 4 YRNG"], 0.97);
}

#[test]
fn truth_matches_rom() {
    check(&["RAD 'X*Y>1 OR X^2+Y^2<1' STEQ TRUTH"], 0.97);
}
