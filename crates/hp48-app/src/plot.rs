//! Native, resizable plot window.
//!
//! Instead of the calculator's 131x64 PICT, the equation in EQ is evaluated
//! natively (hp48-rpl) over the ranges in PPAR and drawn at the window's
//! full resolution. The view can be zoomed and panned without touching the
//! calculator; it refreshes when EQ or PPAR change.

use eframe::egui::{self, Align2, Color32, FontId, Pos2, Rect, Sense, Stroke, Vec2};
use hp48::Machine;
use hp48_rpl::expr::{self, Angle, Expr};
use hp48_rpl::{decode, lookup_var, Memory, Object};

struct Ram<'a>(&'a Machine);

impl Memory for Ram<'_> {
    fn nib(&self, a: u32) -> u8 {
        self.0.hw.peek(a)
    }
}

/// System flags live in RAM at #80843 (64 bits; flag -n is bit n-1),
/// as read by TestSysFlag (#53784).
const SYSTEM_FLAGS: u32 = 0x80843;

fn system_flag(mem: &impl Memory, n: u32) -> bool {
    let bit = n - 1;
    mem.nib(SYSTEM_FLAGS + bit / 4) & (1 << (bit % 4)) != 0
}

#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Kind {
    Function,
    Polar,
}

#[derive(Clone, Debug, PartialEq)]
pub struct Spec {
    pub curves: Vec<Expr>,
    pub label: String,
    pub indep: String,
    /// Independent variable range when PPAR gives one (polar sweeps).
    pub indep_range: Option<(f64, f64)>,
    pub x: (f64, f64),
    pub y: (f64, f64),
    pub axes: (f64, f64),
    pub kind: Kind,
    pub angle: Angle,
}

fn real(o: &Object) -> Option<f64> {
    match o {
        Object::Real(v) => Some(*v),
        Object::Bint(v) => Some(f64::from(*v)),
        _ => None,
    }
}

/// Read EQ and PPAR from the calculator.
pub fn read_spec(machine: &Machine) -> Result<Spec, String> {
    let mem = Ram(machine);
    let eq_addr = lookup_var(&mem, "EQ").ok_or("No EQ variable: store an equation in EQ (e.g. via PLOT)")?;
    let eq = decode(&mem, eq_addr).map_err(|e| e.to_string())?;
    let items = match &eq {
        Object::List(l) => l.clone(),
        o => vec![o.clone()],
    };
    let mut curves = Vec::new();
    let mut labels = Vec::new();
    for it in &items {
        let e = expr::compile(it).map_err(|e| e.to_string())?;
        labels.push(e.to_string());
        curves.extend(e.sides().into_iter().cloned());
    }

    let angle = if system_flag(&mem, 17) {
        Angle::Radians
    } else if system_flag(&mem, 18) {
        Angle::Grads
    } else {
        Angle::Degrees
    };
    // HP defaults when PPAR does not exist yet.
    let mut spec = Spec {
        curves,
        label: labels.join(", "),
        indep: "X".into(),
        indep_range: None,
        x: (-6.5, 6.5),
        y: (-3.1, 3.2),
        axes: (0.0, 0.0),
        kind: Kind::Function,
        angle,
    };
    if let Some(addr) = lookup_var(&mem, "PPAR") {
        if let Ok(Object::List(p)) = decode(&mem, addr) {
            if let (Some(Object::Complex(x0, y0)), Some(Object::Complex(x1, y1))) = (p.first(), p.get(1)) {
                spec.x = (*x0, *x1);
                spec.y = (*y0, *y1);
            }
            match p.get(2) {
                Some(Object::Id(n)) => spec.indep = n.clone(),
                Some(Object::List(l)) => {
                    if let Some(Object::Id(n)) = l.first() {
                        spec.indep = n.clone();
                    }
                    if let (Some(a), Some(b)) = (l.get(1).and_then(real), l.get(2).and_then(real)) {
                        spec.indep_range = Some((a, b));
                    }
                }
                _ => {}
            }
            match p.get(4) {
                Some(Object::Complex(a, b)) => spec.axes = (*a, *b),
                Some(Object::List(l)) => {
                    if let Some(Object::Complex(a, b)) = l.first() {
                        spec.axes = (*a, *b);
                    }
                }
                _ => {}
            }
            // Plot type: a ROMPTR into the plot library 0F1 (FUNCTION = 033,
            // POLAR = 035), as named by that library's hash table.
            match p.get(5) {
                Some(Object::RomPtr { lib: 0xF1, cmd: 0x33 }) | None => {}
                Some(Object::RomPtr { lib: 0xF1, cmd: 0x35 }) => spec.kind = Kind::Polar,
                Some(Object::RomPtr { lib: 0xF1, cmd }) => {
                    let name = match cmd {
                        0x34 => "CONIC",
                        0x36 => "PARAMETRIC",
                        0x37 => "TRUTH",
                        0x38 => "SCATTER",
                        0x39 => "HISTOGRAM",
                        0x3A => "BAR",
                        _ => "this",
                    };
                    return Err(format!("{name} plots are not supported in the plot window yet"));
                }
                Some(_) => {}
            }
        }
    }
    if spec.x.0 == spec.x.1 || spec.y.0 == spec.y.1 {
        return Err("PPAR has an empty plot range".into());
    }
    Ok(spec)
}

/// Visible region (x0, x1, y0, y1) in plot coordinates.
type View = (f64, f64, f64, f64);

pub struct PlotWindow {
    spec: Result<Spec, String>,
    view: Option<View>,
    last_read: Option<std::time::Instant>,
}

impl Default for PlotWindow {
    fn default() -> Self {
        PlotWindow { spec: Err("Reading EQ and PPAR...".into()), view: None, last_read: None }
    }
}

const BG: Color32 = Color32::from_rgb(0xF7, 0xF8, 0xF4);
const GRID: Color32 = Color32::from_rgb(0xE2, 0xE5, 0xDC);
const AXIS: Color32 = Color32::from_rgb(0x55, 0x5B, 0x50);
const TEXT: Color32 = Color32::from_rgb(0x3A, 0x3F, 0x36);
const CURVES: [Color32; 4] = [
    Color32::from_rgb(0x1F, 0x5F, 0xBF),
    Color32::from_rgb(0xC0, 0x3B, 0x2B),
    Color32::from_rgb(0x2E, 0x8B, 0x57),
    Color32::from_rgb(0x8E, 0x44, 0xAD),
];

/// A "nice" step (1, 2 or 5 times a power of ten) near `raw`.
fn nice_step(raw: f64) -> f64 {
    let p = 10f64.powf(raw.log10().floor());
    let m = raw / p;
    p * if m < 1.5 {
        1.0
    } else if m < 3.5 {
        2.0
    } else if m < 7.5 {
        5.0
    } else {
        10.0
    }
}

fn fmt_tick(v: f64, step: f64) -> String {
    let decimals = (-step.log10().floor()).max(0.0) as usize;
    let s = format!("{v:.decimals$}");
    if s == "-0" {
        "0".into()
    } else {
        s
    }
}

impl PlotWindow {
    /// Re-read EQ/PPAR at most twice a second; reset the view if PPAR moved.
    pub fn refresh(&mut self, machine: &Machine) {
        if self.last_read.is_some_and(|t| t.elapsed().as_millis() < 500) {
            return;
        }
        self.last_read = Some(std::time::Instant::now());
        let new = read_spec(machine);
        let ranges_changed = match (&self.spec, &new) {
            (Ok(a), Ok(b)) => a.x != b.x || a.y != b.y,
            _ => true,
        };
        if ranges_changed {
            self.view = None;
        }
        self.spec = new;
    }

    pub fn ui(&mut self, ui: &mut egui::Ui) {
        let rect = ui.max_rect();
        let painter = ui.painter_at(rect);
        painter.rect_filled(rect, 0.0, BG);
        let spec = match &self.spec {
            Ok(s) => s.clone(),
            Err(msg) => {
                painter.text(rect.center(), Align2::CENTER_CENTER, msg, FontId::proportional(16.0), TEXT);
                return;
            }
        };
        let (mut x0, mut x1, mut y0, mut y1) = self.view.unwrap_or((spec.x.0, spec.x.1, spec.y.0, spec.y.1));

        // Interaction: drag to pan, wheel to zoom about the pointer,
        // double-click to return to PPAR.
        let resp = ui.interact(rect, ui.id().with("plot"), Sense::click_and_drag());
        let to_plot = |p: Pos2, v: View| {
            (
                v.0 + (p.x - rect.left()) as f64 / rect.width() as f64 * (v.1 - v.0),
                v.3 - (p.y - rect.top()) as f64 / rect.height() as f64 * (v.3 - v.2),
            )
        };
        if resp.dragged() {
            let d = resp.drag_delta();
            let dx = -(d.x as f64) / rect.width() as f64 * (x1 - x0);
            let dy = (d.y as f64) / rect.height() as f64 * (y1 - y0);
            x0 += dx;
            x1 += dx;
            y0 += dy;
            y1 += dy;
        }
        if let Some(p) = resp.hover_pos() {
            let scroll = ui.input(|i| i.smooth_scroll_delta.y);
            if scroll != 0.0 {
                let f = (-(scroll as f64) / 400.0).exp();
                let (px, py) = to_plot(p, (x0, x1, y0, y1));
                x0 = px + (x0 - px) * f;
                x1 = px + (x1 - px) * f;
                y0 = py + (y0 - py) * f;
                y1 = py + (y1 - py) * f;
            }
        }
        if resp.double_clicked() {
            self.view = None;
            (x0, x1, y0, y1) = (spec.x.0, spec.x.1, spec.y.0, spec.y.1);
        } else {
            self.view = Some((x0, x1, y0, y1));
        }

        let sx = |x: f64| rect.left() + ((x - x0) / (x1 - x0)) as f32 * rect.width();
        let sy = |y: f64| rect.bottom() - ((y - y0) / (y1 - y0)) as f32 * rect.height();
        let font = FontId::proportional(12.0);

        // Grid and tick labels.
        let xs = nice_step((x1 - x0) / (rect.width() as f64 / 90.0));
        let ys = nice_step((y1 - y0) / (rect.height() as f64 / 60.0));
        let mut gx = (x0 / xs).ceil() * xs;
        while gx <= x1 {
            painter.line_segment([Pos2::new(sx(gx), rect.top()), Pos2::new(sx(gx), rect.bottom())], Stroke::new(1.0, GRID));
            let ty = sy(spec.axes.1).clamp(rect.top() + 4.0, rect.bottom() - 18.0);
            painter.text(Pos2::new(sx(gx) + 3.0, ty + 3.0), Align2::LEFT_TOP, fmt_tick(gx, xs), font.clone(), TEXT);
            gx += xs;
        }
        let mut gy = (y0 / ys).ceil() * ys;
        while gy <= y1 {
            painter.line_segment([Pos2::new(rect.left(), sy(gy)), Pos2::new(rect.right(), sy(gy))], Stroke::new(1.0, GRID));
            let tx = sx(spec.axes.0).clamp(rect.left() + 4.0, rect.right() - 40.0);
            painter.text(Pos2::new(tx + 3.0, sy(gy) - 2.0), Align2::LEFT_BOTTOM, fmt_tick(gy, ys), font.clone(), TEXT);
            gy += ys;
        }
        // Axes.
        painter.line_segment([Pos2::new(rect.left(), sy(spec.axes.1)), Pos2::new(rect.right(), sy(spec.axes.1))], Stroke::new(1.4, AXIS));
        painter.line_segment([Pos2::new(sx(spec.axes.0), rect.top()), Pos2::new(sx(spec.axes.0), rect.bottom())], Stroke::new(1.4, AXIS));

        // Curves.
        let height = (y1 - y0).abs();
        for (i, e) in spec.curves.iter().enumerate() {
            let color = CURVES[i % CURVES.len()];
            let points: Vec<Option<(f64, f64)>> = match spec.kind {
                Kind::Function => {
                    let n = (rect.width() * 2.0) as usize;
                    (0..=n)
                        .map(|k| {
                            let x = x0 + (x1 - x0) * k as f64 / n as f64;
                            let y = e.eval(&|v| (v == spec.indep).then_some(x), spec.angle);
                            y.is_finite().then_some((x, y))
                        })
                        .collect()
                }
                Kind::Polar => {
                    let full = match spec.angle {
                        Angle::Degrees => 360.0,
                        Angle::Radians => std::f64::consts::TAU,
                        Angle::Grads => 400.0,
                    };
                    let (t0, t1) = spec.indep_range.unwrap_or((0.0, full));
                    let n = 2000;
                    (0..=n)
                        .map(|k| {
                            let t = t0 + (t1 - t0) * k as f64 / n as f64;
                            let r = e.eval(&|v| (v == spec.indep).then_some(t), spec.angle);
                            let rad = match spec.angle {
                                Angle::Degrees => t.to_radians(),
                                Angle::Radians => t,
                                Angle::Grads => t * std::f64::consts::PI / 200.0,
                            };
                            r.is_finite().then_some((r * rad.cos(), r * rad.sin()))
                        })
                        .collect()
                }
            };
            // Split into runs at undefined points and at jumps across
            // asymptotes (tan, 1/x).
            let mut run: Vec<Pos2> = Vec::new();
            let mut prev: Option<(f64, f64)> = None;
            let flush = |run: &mut Vec<Pos2>| {
                if run.len() > 1 {
                    painter.add(egui::Shape::line(std::mem::take(run), Stroke::new(2.2, color)));
                }
                run.clear();
            };
            for p in points {
                match p {
                    Some((x, y)) => {
                        if let Some((_, py)) = prev {
                            if (y - py).abs() > height * 4.0 {
                                flush(&mut run);
                            }
                        }
                        run.push(Pos2::new(sx(x), sy(y.clamp(y0 - height * 10.0, y1 + height * 10.0))));
                        prev = Some((x, y));
                    }
                    None => {
                        flush(&mut run);
                        prev = None;
                    }
                }
            }
            flush(&mut run);
        }

        // Equation and pointer read-out.
        let label = format!("{}: {}", if spec.kind == Kind::Polar { "Polar" } else { "Function" }, spec.label);
        painter.text(rect.right_top() + Vec2::new(-10.0, 8.0), Align2::RIGHT_TOP, label, FontId::proportional(14.0), TEXT);
        if let Some(p) = resp.hover_pos() {
            let (px, py) = to_plot(p, (x0, x1, y0, y1));
            painter.text(
                rect.left_top() + Vec2::new(10.0, 8.0),
                Align2::LEFT_TOP,
                format!("{} = {:.6}   y = {:.6}", spec.indep, px, py),
                FontId::monospace(13.0),
                TEXT,
            );
        }
        let hint = "drag: pan   wheel: zoom   double-click: reset";
        painter.text(rect.left_bottom() + Vec2::new(10.0, -8.0), Align2::LEFT_BOTTOM, hint, FontId::proportional(11.0), GRID.gamma_multiply(0.5));
        let _ = Rect::NOTHING;
    }
}
