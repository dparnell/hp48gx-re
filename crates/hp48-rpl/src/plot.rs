//! Plot specifications and geometry, independent of any renderer.
//!
//! [`read_spec`] reads what the calculator's PLOT application would draw
//! (EQ, PPAR, ΣDAT, ΣPAR and the angle mode) and [`Spec::trace`] turns it
//! into marks in plot coordinates for any view and resolution. The rules
//! follow what the ROM draws (checked against its PICT in
//! `crates/hp48/tests/plot.rs`):
//!
//! - FUNCTION plots each expression (both sides of an equation) over x.
//! - POLAR sweeps the independent variable over its PPAR range, by default
//!   one full turn.
//! - PARAMETRIC evaluates a complex `x(t) + i*y(t)`; t runs over its PPAR
//!   range, by default the x range.
//! - CONIC plots the zero set of `lhs - rhs` in x and the dependent variable.
//! - TRUTH shades the points where the expression is non-zero.
//! - SCATTER marks each (x, y) row of ΣDAT (columns from ΣPAR).
//! - BAR draws one bar per row from xmin, each `res` wide (default 1).
//! - HISTOGRAM counts the x column into bins from xmin, each `res` wide
//!   (default 1/13 of the x range).

use crate::expr::{self, Angle, Expr};
use crate::{decode, lookup_var, Memory, Object};

/// System flags in RAM (64 bits; flag -n is bit n-1), as read by
/// TestSysFlag (#53784).
pub const SYSTEM_FLAGS: u32 = 0x80843;

pub fn system_flag(mem: &impl Memory, n: u32) -> bool {
    let bit = n - 1;
    mem.nib(SYSTEM_FLAGS + bit / 4) & (1 << (bit % 4)) != 0
}

/// Character 133 in the calculator's character set, as decoded.
const SIGMA: char = 'Σ';

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Kind {
    Function,
    Conic,
    Polar,
    Parametric,
    Truth,
    Scatter,
    Histogram,
    Bar,
}

impl Kind {
    /// The plot type's command in library 0F1 (PPAR's sixth element).
    fn from_romptr(cmd: u16) -> Option<Kind> {
        Some(match cmd {
            0x33 => Kind::Function,
            0x34 => Kind::Conic,
            0x35 => Kind::Polar,
            0x36 => Kind::Parametric,
            0x37 => Kind::Truth,
            0x38 => Kind::Scatter,
            0x39 => Kind::Histogram,
            0x3A => Kind::Bar,
            _ => return None,
        })
    }

    pub fn name(self) -> &'static str {
        match self {
            Kind::Function => "Function",
            Kind::Conic => "Conic",
            Kind::Polar => "Polar",
            Kind::Parametric => "Parametric",
            Kind::Truth => "Truth",
            Kind::Scatter => "Scatter",
            Kind::Histogram => "Histogram",
            Kind::Bar => "Bar",
        }
    }

    pub fn is_statistical(self) -> bool {
        matches!(self, Kind::Scatter | Kind::Histogram | Kind::Bar)
    }
}

#[derive(Clone, Debug, PartialEq)]
pub struct Spec {
    pub kind: Kind,
    /// Expressions to plot (one per curve). Empty for statistical plots.
    pub curves: Vec<Expr>,
    pub label: String,
    pub indep: String,
    pub depend: String,
    /// Independent variable range when PPAR gives one.
    pub indep_range: Option<(f64, f64)>,
    pub x: (f64, f64),
    pub y: (f64, f64),
    pub axes: (f64, f64),
    /// PPAR resolution in user units (0 = default).
    pub res: f64,
    pub angle: Angle,
    /// Statistical data: (x, y) for each ΣDAT row.
    pub data: Vec<(f64, f64)>,
}

fn real(o: &Object) -> Option<f64> {
    match o {
        Object::Real(v) => Some(*v),
        Object::Bint(v) => Some(f64::from(*v)),
        _ => None,
    }
}

/// Read the plot the calculator would draw.
pub fn read_spec(mem: &impl Memory) -> Result<Spec, String> {
    let angle = if system_flag(mem, 17) {
        Angle::Radians
    } else if system_flag(mem, 18) {
        Angle::Grads
    } else {
        Angle::Degrees
    };
    // HP defaults when PPAR does not exist yet.
    let mut spec = Spec {
        kind: Kind::Function,
        curves: Vec::new(),
        label: String::new(),
        indep: "X".into(),
        depend: "Y".into(),
        indep_range: None,
        x: (-6.5, 6.5),
        y: (-3.1, 3.2),
        axes: (0.0, 0.0),
        res: 0.0,
        angle,
        data: Vec::new(),
    };
    if let Some(addr) = lookup_var(mem, "PPAR") {
        if let Ok(Object::List(p)) = decode(mem, addr) {
            read_ppar(&mut spec, &p)?;
        }
    }
    if spec.x.0 == spec.x.1 || spec.y.0 == spec.y.1 {
        return Err("PPAR has an empty plot range".into());
    }
    if spec.kind.is_statistical() {
        read_stat(mem, &mut spec)?;
    } else {
        read_eq(mem, &mut spec)?;
    }
    Ok(spec)
}

/// PPAR: { (xmin,ymin) (xmax,ymax) indep res axes ptype depend }.
fn read_ppar(spec: &mut Spec, p: &[Object]) -> Result<(), String> {
    if let (Some(Object::Complex(x0, y0)), Some(Object::Complex(x1, y1))) = (p.first(), p.get(1)) {
        spec.x = (*x0, *x1);
        spec.y = (*y0, *y1);
    }
    let name_and_range = |o: Option<&Object>| -> (Option<String>, Option<(f64, f64)>) {
        match o {
            Some(Object::Id(n)) => (Some(n.clone()), None),
            Some(Object::List(l)) => {
                let name = match l.first() {
                    Some(Object::Id(n)) => Some(n.clone()),
                    _ => None,
                };
                let range = match (l.get(1).and_then(real), l.get(2).and_then(real)) {
                    (Some(a), Some(b)) => Some((a, b)),
                    _ => None,
                };
                (name, range)
            }
            _ => (None, None),
        }
    };
    let (name, range) = name_and_range(p.get(2));
    if let Some(n) = name {
        spec.indep = n;
    }
    spec.indep_range = range;
    if let Some(r) = p.get(3).and_then(real) {
        spec.res = r.max(0.0);
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
    match p.get(5) {
        Some(Object::RomPtr { lib: 0xF1, cmd }) => {
            spec.kind = Kind::from_romptr(*cmd).ok_or("this plot type is not supported in the plot window")?;
        }
        None => {}
        Some(_) => return Err("this plot type is not supported in the plot window".into()),
    }
    if let (Some(n), _) = name_and_range(p.get(6)) {
        spec.depend = n;
    }
    Ok(())
}

fn read_eq(mem: &impl Memory, spec: &mut Spec) -> Result<(), String> {
    let eq_addr = lookup_var(mem, "EQ").ok_or("No EQ variable: store an equation in EQ (e.g. via PLOT)")?;
    let eq = decode(mem, eq_addr).map_err(|e| e.to_string())?;
    let items = match &eq {
        Object::List(l) => l.clone(),
        o => vec![o.clone()],
    };
    let mut labels = Vec::new();
    for it in &items {
        let e = expr::compile_in(it, &expr::Commands::from_memory(mem)).map_err(|e| e.to_string())?;
        labels.push(e.to_string());
        match spec.kind {
            // A function plot draws both sides of an equation.
            Kind::Function => spec.curves.extend(e.sides().into_iter().cloned()),
            Kind::Conic => spec.curves.push(e.as_zero()),
            _ => spec.curves.push(e),
        }
    }
    spec.label = labels.join(", ");
    Ok(())
}

/// ΣDAT (a matrix, or a vector of single values) and the columns chosen by
/// ΣPAR { xcol ycol intercept slope model }.
fn read_stat(mem: &impl Memory, spec: &mut Spec) -> Result<(), String> {
    let name = format!("{SIGMA}DAT");
    let addr = lookup_var(mem, &name).ok_or("No statistics data: store a matrix in \u{3A3}DAT")?;
    let (rows, cols, items) = match decode(mem, addr).map_err(|e| e.to_string())? {
        Object::Array { dims, items } if dims.len() == 2 => (dims[0], dims[1], items),
        Object::Array { dims, items } => (dims[0], 1, items),
        _ => return Err("\u{3A3}DAT is not a real matrix".into()),
    };
    let (mut xcol, mut ycol) = (1u32, 2u32);
    if let Some(a) = lookup_var(mem, &format!("{SIGMA}PAR")) {
        if let Ok(Object::List(p)) = decode(mem, a) {
            xcol = p.first().and_then(real).map_or(xcol, |v| v as u32);
            ycol = p.get(1).and_then(real).map_or(ycol, |v| v as u32);
        }
    }
    let at = |r: u32, c: u32| -> f64 {
        if c == 0 || c > cols {
            return f64::NAN;
        }
        items.get((r * cols + c - 1) as usize).and_then(real).unwrap_or(f64::NAN)
    };
    spec.data = (0..rows).map(|r| (at(r, xcol), at(r, ycol))).collect();
    spec.label = format!("\u{3A3}DAT ({rows}\u{D7}{cols})");
    Ok(())
}

/// Visible region in plot coordinates.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct View {
    pub x0: f64,
    pub x1: f64,
    pub y0: f64,
    pub y1: f64,
}

/// Geometry in plot coordinates.
#[derive(Clone, Debug, PartialEq)]
pub enum Mark {
    Line(Vec<(f64, f64)>),
    Dot(f64, f64),
    /// Filled rectangle (x0, y0, x1, y1).
    Rect(f64, f64, f64, f64),
}

impl Spec {
    pub fn view(&self) -> View {
        View { x0: self.x.0, x1: self.x.1, y0: self.y.0, y1: self.y.1 }
    }

    fn full_turn(&self) -> f64 {
        match self.angle {
            Angle::Degrees => 360.0,
            Angle::Radians => std::f64::consts::TAU,
            Angle::Grads => 400.0,
        }
    }

    /// The marks for each curve (statistical plots have one layer), for
    /// `view` drawn `w` x `h` pixels large.
    pub fn trace(&self, view: View, w: f64, h: f64) -> Vec<Vec<Mark>> {
        let w = w.max(1.0);
        let h = h.max(1.0);
        match self.kind {
            Kind::Scatter => vec![self.data.iter().map(|&(x, y)| Mark::Dot(x, y)).collect()],
            Kind::Bar => {
                let width = if self.res > 0.0 { self.res } else { 1.0 };
                let bars = self.data.iter().enumerate();
                vec![bars
                    .filter(|(_, d)| d.0.is_finite())
                    .map(|(k, d)| {
                        let left = self.x.0 + k as f64 * width;
                        Mark::Rect(left, 0f64.min(d.0), left + width, 0f64.max(d.0))
                    })
                    .collect()]
            }
            Kind::Histogram => {
                let width = if self.res > 0.0 { self.res } else { (self.x.1 - self.x.0) / 13.0 };
                let mut counts = std::collections::BTreeMap::<i64, u32>::new();
                for &(x, _) in &self.data {
                    if x.is_finite() && x >= self.x.0 && x < self.x.1 {
                        *counts.entry(((x - self.x.0) / width).floor() as i64).or_default() += 1;
                    }
                }
                let bars = counts.into_iter().map(|(bin, n)| {
                    let left = self.x.0 + bin as f64 * width;
                    Mark::Rect(left, 0.0, left + width, f64::from(n))
                });
                vec![bars.collect()]
            }
            _ => self.curves.iter().map(|e| self.trace_curve(e, view, w, h)).collect(),
        }
    }

    fn trace_curve(&self, e: &Expr, view: View, w: f64, h: f64) -> Vec<Mark> {
        let indep = self.indep.as_str();
        let height = (view.y1 - view.y0).abs();
        let width = (view.x1 - view.x0).abs();
        match self.kind {
            Kind::Function => {
                let n = (w * 2.0) as usize;
                let pts = (0..=n).map(|k| {
                    let x = view.x0 + (view.x1 - view.x0) * k as f64 / n as f64;
                    let y = e.eval(&|v| (v == indep).then_some(x), self.angle);
                    (x, y)
                });
                // Break at jumps across asymptotes (tan, 1/x).
                polylines(pts, |a, b| (a.1 - b.1).abs() > height * 4.0, view)
            }
            Kind::Polar => {
                let (t0, t1) = self.indep_range.unwrap_or((0.0, self.full_turn()));
                let n = 4000;
                let pts = (0..=n).map(|k| {
                    let t = t0 + (t1 - t0) * k as f64 / n as f64;
                    let r = e.eval(&|v| (v == indep).then_some(t), self.angle);
                    let rad = match self.angle {
                        Angle::Degrees => t.to_radians(),
                        Angle::Radians => t,
                        Angle::Grads => t * std::f64::consts::PI / 200.0,
                    };
                    (r * rad.cos(), r * rad.sin())
                });
                polylines(pts, |a, b| (a.0 - b.0).hypot(a.1 - b.1) > (width + height) * 2.0, view)
            }
            Kind::Parametric => {
                let (t0, t1) = self.indep_range.unwrap_or(self.x);
                let n = 4000;
                let pts = (0..=n).map(|k| {
                    let t = t0 + (t1 - t0) * k as f64 / n as f64;
                    let z = e.eval_complex(&|v| (v == indep).then_some(t), self.angle);
                    (z.re, z.im)
                });
                polylines(pts, |a, b| (a.0 - b.0).hypot(a.1 - b.1) > (width + height) * 2.0, view)
            }
            Kind::Conic => self.contour(e, view, w, h),
            Kind::Truth => self.truth(e, view, w, h),
            _ => Vec::new(),
        }
    }

    fn eval2(&self, e: &Expr, x: f64, y: f64) -> f64 {
        let (xi, yi) = (self.indep.as_str(), self.depend.as_str());
        e.eval(
            &|v| {
                if v == xi {
                    Some(x)
                } else if v == yi {
                    Some(y)
                } else {
                    None
                }
            },
            self.angle,
        )
    }

    /// Zero set of `e` by marching squares over 2-pixel cells.
    fn contour(&self, e: &Expr, view: View, w: f64, h: f64) -> Vec<Mark> {
        const CELL: f64 = 2.0;
        let nx = (w / CELL).ceil() as usize;
        let ny = (h / CELL).ceil() as usize;
        let gx = |i: usize| view.x0 + (view.x1 - view.x0) * i as f64 / nx as f64;
        let gy = |j: usize| view.y0 + (view.y1 - view.y0) * j as f64 / ny as f64;
        let grid: Vec<Vec<f64>> = (0..=ny).map(|j| (0..=nx).map(|i| self.eval2(e, gx(i), gy(j))).collect()).collect();
        let mut marks = Vec::new();
        let lerp = |p: (f64, f64), q: (f64, f64), a: f64, b: f64| {
            let t = a / (a - b);
            (p.0 + (q.0 - p.0) * t, p.1 + (q.1 - p.1) * t)
        };
        for j in 0..ny {
            for i in 0..nx {
                let corners = [(i, j), (i + 1, j), (i + 1, j + 1), (i, j + 1)];
                let v: Vec<f64> = corners.iter().map(|&(a, b)| grid[b][a]).collect();
                if v.iter().any(|f| !f.is_finite()) {
                    continue;
                }
                let p: Vec<(f64, f64)> = corners.iter().map(|&(a, b)| (gx(a), gy(b))).collect();
                let mut cross = Vec::new();
                for k in 0..4 {
                    let (a, b) = (v[k], v[(k + 1) % 4]);
                    if (a < 0.0) != (b < 0.0) {
                        cross.push(lerp(p[k], p[(k + 1) % 4], a, b));
                    }
                }
                // Four crossings (a saddle): pair them by the centre value.
                match cross.len() {
                    2 => marks.push(Mark::Line(cross)),
                    4 => {
                        let centre = v.iter().sum::<f64>() / 4.0;
                        if (centre < 0.0) == (v[0] < 0.0) {
                            marks.push(Mark::Line(vec![cross[0], cross[1]]));
                            marks.push(Mark::Line(vec![cross[2], cross[3]]));
                        } else {
                            marks.push(Mark::Line(vec![cross[0], cross[3]]));
                            marks.push(Mark::Line(vec![cross[1], cross[2]]));
                        }
                    }
                    _ => {}
                }
            }
        }
        marks
    }

    /// Where `e` is non-zero, as one-pixel-high row runs. Each row is
    /// sampled every few pixels and run edges are located by bisection, so
    /// boundaries stay smooth at any size.
    fn truth(&self, e: &Expr, view: View, w: f64, h: f64) -> Vec<Mark> {
        const STEP: f64 = 3.0;
        let nx = (w / STEP).ceil() as usize;
        let ny = h.ceil() as usize;
        let cw = (view.x1 - view.x0) / nx as f64;
        let ch = (view.y1 - view.y0) / ny as f64;
        let mut marks = Vec::new();
        for j in 0..ny {
            let y = view.y0 + ch * (j as f64 + 0.5);
            let on = |x: f64| {
                let v = self.eval2(e, x, y);
                v.is_finite() && v != 0.0
            };
            // Edge between samples a (state `from`) and b, refined.
            let edge = |mut a: f64, mut b: f64, from: bool| {
                for _ in 0..8 {
                    let m = (a + b) / 2.0;
                    if on(m) == from {
                        a = m;
                    } else {
                        b = m;
                    }
                }
                (a + b) / 2.0
            };
            let sample = |i: usize| view.x0 + cw * (i as f64 + 0.5);
            let mut start = on(sample(0)).then_some(view.x0);
            let mut prev = start.is_some();
            for i in 1..=nx {
                let now = i < nx && on(sample(i));
                if now != prev {
                    let x = if i < nx { edge(sample(i - 1), sample(i), prev) } else { view.x1 };
                    match start.take() {
                        Some(s) => marks.push(Mark::Rect(s, y - ch / 2.0, x, y + ch / 2.0)),
                        None => start = Some(x),
                    }
                    prev = now;
                }
            }
        }
        marks
    }
}

/// Split sampled points into polylines at undefined points and wherever
/// `jump` says two neighbours should not be joined. Far-off values are
/// clamped so lines still head off the edge of the view.
fn polylines(pts: impl Iterator<Item = (f64, f64)>, jump: impl Fn((f64, f64), (f64, f64)) -> bool, view: View) -> Vec<Mark> {
    let (dx, dy) = ((view.x1 - view.x0).abs() * 10.0, (view.y1 - view.y0).abs() * 10.0);
    let clamp = |(x, y): (f64, f64)| {
        (x.clamp(view.x0.min(view.x1) - dx, view.x0.max(view.x1) + dx), y.clamp(view.y0.min(view.y1) - dy, view.y0.max(view.y1) + dy))
    };
    let mut out = Vec::new();
    let mut run: Vec<(f64, f64)> = Vec::new();
    let mut flush = |run: &mut Vec<(f64, f64)>| {
        match run.len() {
            0 => {}
            1 => out.push(Mark::Dot(run[0].0, run[0].1)),
            _ => out.push(Mark::Line(std::mem::take(run))),
        }
        run.clear();
    };
    let mut prev: Option<(f64, f64)> = None;
    for p in pts {
        if !(p.0.is_finite() && p.1.is_finite()) {
            flush(&mut run);
            prev = None;
            continue;
        }
        if prev.is_some_and(|q| jump(q, p)) {
            flush(&mut run);
        }
        run.push(clamp(p));
        prev = Some(p);
    }
    flush(&mut run);
    out
}
