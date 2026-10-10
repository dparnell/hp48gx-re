//! Native, resizable plot window.
//!
//! Instead of the calculator's 131x64 PICT, the plot described by EQ, PPAR
//! and ΣDAT is computed natively (hp48_rpl::plot, checked against the ROM's
//! own drawing) and drawn at the window's full resolution. The view can be
//! zoomed and panned without touching the calculator; it refreshes when the
//! plot changes.

use eframe::egui::{self, Align2, Color32, FontId, Pos2, Rect, Sense, Shape, Stroke, Vec2};
use hp48::Machine;
use hp48_rpl::plot::{read_spec, Kind, Mark, Spec, View};
use hp48_rpl::Memory;

struct Ram<'a>(&'a Machine);

impl Memory for Ram<'_> {
    fn nib(&self, a: u32) -> u8 {
        self.0.hw.peek(a)
    }
}

/// Marks computed for one view and size, reused until either changes.
struct Traced {
    view: View,
    size: Vec2,
    layers: Vec<Vec<Mark>>,
}

pub struct PlotWindow {
    spec: Result<Spec, String>,
    view: Option<View>,
    last_read: Option<std::time::Instant>,
    traced: Option<Traced>,
}

impl Default for PlotWindow {
    fn default() -> Self {
        PlotWindow { spec: Err("Reading the plot...".into()), view: None, last_read: None, traced: None }
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

fn lerp_color(a: Color32, b: Color32, t: f32) -> Color32 {
    let mix = |x: u8, y: u8| (f32::from(x) + (f32::from(y) - f32::from(x)) * t).round() as u8;
    Color32::from_rgb(mix(a.r(), b.r()), mix(a.g(), b.g()), mix(a.b(), b.b()))
}

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
    /// Re-read the plot at most twice a second (or now, if `force`); reset
    /// the view when the plot ranges move.
    pub fn refresh(&mut self, machine: &Machine, force: bool) {
        if !force && self.last_read.is_some_and(|t| t.elapsed().as_millis() < 500) {
            return;
        }
        self.last_read = Some(std::time::Instant::now());
        let new = read_spec(&Ram(machine));
        if new == self.spec {
            return;
        }
        let ranges_changed = match (&self.spec, &new) {
            (Ok(a), Ok(b)) => a.x != b.x || a.y != b.y,
            _ => true,
        };
        if ranges_changed {
            self.view = None;
        }
        self.spec = new;
        self.traced = None;
    }

    pub fn ui(&mut self, ui: &mut egui::Ui) {
        let rect = ui.max_rect();
        let painter = ui.painter_at(rect);
        painter.rect_filled(rect, 0.0, BG);
        let spec = match &self.spec {
            Ok(s) => s,
            Err(msg) => {
                painter.text(rect.center(), Align2::CENTER_CENTER, msg, FontId::proportional(16.0), TEXT);
                return;
            }
        };
        let mut v = self.view.unwrap_or(spec.view());

        // Interaction: drag to pan, wheel to zoom about the pointer,
        // double-click to return to PPAR.
        let resp = ui.interact(rect, ui.id().with("plot"), Sense::click_and_drag());
        let to_plot = |p: Pos2, v: View| {
            (
                v.x0 + (p.x - rect.left()) as f64 / rect.width() as f64 * (v.x1 - v.x0),
                v.y1 - (p.y - rect.top()) as f64 / rect.height() as f64 * (v.y1 - v.y0),
            )
        };
        if resp.dragged() {
            let d = resp.drag_delta();
            let dx = -(d.x as f64) / rect.width() as f64 * (v.x1 - v.x0);
            let dy = (d.y as f64) / rect.height() as f64 * (v.y1 - v.y0);
            v = View { x0: v.x0 + dx, x1: v.x1 + dx, y0: v.y0 + dy, y1: v.y1 + dy };
        }
        if let Some(p) = resp.hover_pos() {
            let scroll = ui.input(|i| i.smooth_scroll_delta.y);
            if scroll != 0.0 {
                let f = (-(scroll as f64) / 400.0).exp();
                let (px, py) = to_plot(p, v);
                v = View { x0: px + (v.x0 - px) * f, x1: px + (v.x1 - px) * f, y0: py + (v.y0 - py) * f, y1: py + (v.y1 - py) * f };
            }
        }
        if resp.double_clicked() {
            self.view = None;
            v = spec.view();
        } else {
            self.view = Some(v);
        }

        let sx = |x: f64| rect.left() + ((x - v.x0) / (v.x1 - v.x0)) as f32 * rect.width();
        let sy = |y: f64| rect.bottom() - ((y - v.y0) / (v.y1 - v.y0)) as f32 * rect.height();
        let font = FontId::proportional(12.0);

        // Plot marks, recomputed only when the view or size changes. Filled
        // areas go under the grid and axes, lines and dots over them.
        if !self.traced.as_ref().is_some_and(|t| t.view == v && t.size == rect.size()) {
            let layers = spec.trace(v, rect.width() as f64, rect.height() as f64);
            self.traced = Some(Traced { view: v, size: rect.size(), layers });
        }
        let layers = &self.traced.as_ref().expect("traced above").layers;
        let truth = spec.kind == Kind::Truth;
        for (i, layer) in layers.iter().enumerate() {
            let color = CURVES[i % CURVES.len()];
            // Truth rows meet edge to edge: one opaque mesh, rows overlapping
            // slightly, so no seams show.
            let mut mesh = egui::Mesh::default();
            let shade = lerp_color(BG, color, 0.45);
            for mark in layer {
                if let Mark::Rect(x0, y0, x1, y1) = *mark {
                    let r = Rect::from_two_pos(Pos2::new(sx(x0), sy(y0)), Pos2::new(sx(x1), sy(y1)));
                    if truth {
                        mesh.add_colored_rect(r.expand2(Vec2::new(0.0, 0.5)), shade);
                    } else {
                        painter.rect_filled(r, 0.0, color.gamma_multiply(0.55));
                        painter.rect_stroke(r, 0.0, Stroke::new(1.2, color), egui::StrokeKind::Inside);
                    }
                }
            }
            if !mesh.is_empty() {
                painter.add(Shape::mesh(mesh));
            }
        }
        // Grid (over filled areas); tick labels are drawn last.
        let mut ticks: Vec<(Pos2, Align2, String)> = Vec::new();
        let xs = nice_step((v.x1 - v.x0) / (rect.width() as f64 / 90.0));
        let ys = nice_step((v.y1 - v.y0) / (rect.height() as f64 / 60.0));
        let mut gx = (v.x0 / xs).ceil() * xs;
        while gx <= v.x1 {
            painter.line_segment([Pos2::new(sx(gx), rect.top()), Pos2::new(sx(gx), rect.bottom())], Stroke::new(1.0, GRID));
            let ty = sy(spec.axes.1).clamp(rect.top() + 4.0, rect.bottom() - 18.0);
            ticks.push((Pos2::new(sx(gx) + 3.0, ty + 3.0), Align2::LEFT_TOP, fmt_tick(gx, xs)));
            gx += xs;
        }
        let mut gy = (v.y0 / ys).ceil() * ys;
        while gy <= v.y1 {
            painter.line_segment([Pos2::new(rect.left(), sy(gy)), Pos2::new(rect.right(), sy(gy))], Stroke::new(1.0, GRID));
            let tx = sx(spec.axes.0).clamp(rect.left() + 4.0, rect.right() - 40.0);
            ticks.push((Pos2::new(tx + 3.0, sy(gy) - 2.0), Align2::LEFT_BOTTOM, fmt_tick(gy, ys)));
            gy += ys;
        }

        painter.line_segment([Pos2::new(rect.left(), sy(spec.axes.1)), Pos2::new(rect.right(), sy(spec.axes.1))], Stroke::new(1.4, AXIS));
        painter.line_segment([Pos2::new(sx(spec.axes.0), rect.top()), Pos2::new(sx(spec.axes.0), rect.bottom())], Stroke::new(1.4, AXIS));
        for (i, layer) in layers.iter().enumerate() {
            let color = CURVES[i % CURVES.len()];
            for mark in layer {
                match mark {
                    Mark::Line(pts) => {
                        let pts: Vec<Pos2> = pts.iter().map(|&(x, y)| Pos2::new(sx(x), sy(y))).collect();
                        painter.add(Shape::line(pts, Stroke::new(2.2, color)));
                    }
                    Mark::Dot(x, y) => {
                        let r = if spec.kind == Kind::Scatter { 4.0 } else { 1.6 };
                        painter.circle_filled(Pos2::new(sx(*x), sy(*y)), r, color);
                    }
                    Mark::Rect(..) => {}
                }
            }
        }

        for (pos, align, text) in ticks {
            painter.text(pos, align, text, font.clone(), TEXT);
        }

        // Plot description and pointer read-out.
        let label = format!("{}: {}", spec.kind.name(), spec.label);
        let galley = painter.layout_no_wrap(label, FontId::proportional(14.0), TEXT);
        let at = rect.right_top() + Vec2::new(-10.0 - galley.size().x, 8.0);
        painter.rect_filled(Rect::from_min_size(at, galley.size()).expand(4.0), 4.0, BG.gamma_multiply(0.9));
        painter.galley(at, galley, TEXT);
        if let Some(p) = resp.hover_pos() {
            let (px, py) = to_plot(p, v);
            let xname = if matches!(spec.kind, Kind::Function | Kind::Conic | Kind::Truth) { spec.indep.as_str() } else { "x" };
            let yname = if matches!(spec.kind, Kind::Conic | Kind::Truth) { spec.depend.as_str() } else { "y" };
            painter.text(
                rect.left_top() + Vec2::new(10.0, 8.0),
                Align2::LEFT_TOP,
                format!("{xname} = {px:.6}   {yname} = {py:.6}"),
                FontId::monospace(13.0),
                TEXT,
            );
        }
        let hint = "drag: pan   wheel: zoom   double-click: reset";
        painter.text(rect.left_bottom() + Vec2::new(10.0, -8.0), Align2::LEFT_BOTTOM, hint, FontId::proportional(11.0), GRID.gamma_multiply(0.5));
    }
}
