//! Fluids, and helpers the Forces and Gases pictures share: labels with
//! subscripts, smooth curves and the stipple that marks a fluid.

use super::*;

/// Advance widths of DejaVu Sans, in capital heights.
fn advance(text: &str) -> f32 {
    text.chars()
        .map(|c| match c {
            'A' | 'Δ' => 0.938,
            'P' => 0.827,
            'M' => 1.184,
            'W' => 1.356,
            'F' => 0.789,
            'v' | 'x' | 'y' => 0.812,
            'k' => 0.794,
            'm' => 1.336,
            'h' => 0.869,
            'a' => 0.841,
            'f' => 0.483,
            'g' | 'ρ' => 0.871,
            'i' => 0.381,
            '=' | '<' | '>' => 1.149,
            _ => 0.873,
        })
        .sum()
}

/// A label written over the bitmap's, whose glyphs fill the box `ink`
/// (left, top, right, bottom), standing on `baseline` with capitals `cap`
/// tall. What follows a `_` is a subscript: smaller and set lower. The
/// label is centred on the bitmap's, and the box is kept as an empty text,
/// so the tests excuse the bitmap's glyphs (subscripts there are as tall as
/// the rest, and descenders go below the baseline).
pub(super) fn label(text: &'static str, ink: [f32; 4], baseline: f32, cap: f32) -> Vec<Shape> {
    let (main, sub) = text.split_once('_').unwrap_or((text, ""));
    let sub_cap = 0.7 * cap;
    let (main_w, sub_w) = (advance(main) * cap, advance(sub) * sub_cap);
    let left = (ink[0] + ink[2] - main_w - sub_w) / 2.0;
    let mut shapes = vec![
        Shape::Text { text: "", x: ink[0], w: ink[2] - ink[0], baseline: ink[3], cap: ink[3] - ink[1] },
        Shape::Text { text: main, x: left - 0.2, w: main_w + 0.4, baseline, cap },
    ];
    if !sub.is_empty() {
        shapes.push(Shape::Text { text: sub, x: left + main_w - 0.2, w: sub_w + 0.4, baseline: baseline + 0.22 * cap, cap: sub_cap });
    }
    shapes
}

/// A smooth curve through the knots, left to right, that rises or falls only
/// where they do (monotone cubic interpolation of y over x).
pub(super) fn smooth(knots: &[[f32; 2]]) -> Vec<[f32; 2]> {
    let n = knots.len();
    let slope: Vec<f32> = knots.windows(2).map(|k| (k[1][1] - k[0][1]) / (k[1][0] - k[0][0])).collect();
    let tangent: Vec<f32> = (0..n)
        .map(|i| match (i.checked_sub(1).map(|j| slope[j]), slope.get(i).copied()) {
            (Some(a), Some(b)) if a * b > 0.0 => 2.0 / (1.0 / a + 1.0 / b),
            (Some(_), Some(_)) => 0.0,
            (a, b) => a.or(b).unwrap_or(0.0),
        })
        .collect();
    let mut out = vec![knots[0]];
    for i in 0..n - 1 {
        let ([x0, y0], [x1, y1]) = (knots[i], knots[i + 1]);
        let h = x1 - x0;
        let steps = (h * 4.0).ceil() as usize;
        for s in 1..=steps {
            let t = s as f32 / steps as f32;
            let (t2, t3) = (t * t, t * t * t);
            let y = (2.0 * t3 - 3.0 * t2 + 1.0) * y0 + (t3 - 2.0 * t2 + t) * h * tangent[i] + (3.0 * t2 - 2.0 * t3) * y1 + (t3 - t2) * h * tangent[i + 1];
            out.push([x0 + h * t, y]);
        }
    }
    out
}

/// Whether (`x`, `y`) is inside the polygon.
pub(super) fn inside(polygon: &[[f32; 2]], x: f32, y: f32) -> bool {
    let mut odd = false;
    for i in 0..polygon.len() {
        let (a, b) = (polygon[i], polygon[(i + 1) % polygon.len()]);
        if (a[1] > y) != (b[1] > y) && x < a[0] + (y - a[1]) / (b[1] - a[1]) * (b[0] - a[0]) {
            odd = !odd;
        }
    }
    odd
}

/// The polygon between two walls drawn the same way.
pub(super) fn between(a: &[[f32; 2]], b: &[[f32; 2]]) -> Vec<[f32; 2]> {
    a.iter().chain(b.iter().rev()).copied().collect()
}

/// The stipple of a fluid: dots on every other pixel of the bitmap's dot
/// grid (columns `xs`, rows `ys`, every second one of each), staggered, where
/// `wanted` says so and clear of the ink and text already in `shapes`.
pub(super) fn stipple(shapes: &[Shape], xs: (i32, i32), ys: (i32, i32), wanted: impl Fn(f32, f32) -> bool) -> Vec<Shape> {
    let mut ink = Vec::new();
    for shape in shapes {
        let (points, closed) = match shape {
            Shape::Stroke(Polyline { points, closed }) => (points, *closed),
            Shape::Fill { points, .. } => (points, true),
            Shape::Text { .. } => continue,
        };
        for (a, b) in points.iter().zip(points.iter().skip(1).chain(points.first().filter(|_| closed))) {
            let steps = ((b[0] - a[0]).hypot(b[1] - a[1]) * 4.0).ceil().max(1.0) as usize;
            ink.extend((0..=steps).map(|s| {
                let t = s as f32 / steps as f32;
                [a[0] + (b[0] - a[0]) * t, a[1] + (b[1] - a[1]) * t]
            }));
        }
    }
    let clear = |x: f32, y: f32| {
        ink.iter().all(|p| (p[0] - x).hypot(p[1] - y) >= 1.4)
            && shapes.iter().all(|s| match s {
                Shape::Text { x: tx, w, baseline, cap, .. } => !(tx - 1.0..tx + w + 1.0).contains(&x) || !(baseline - cap - 1.0..baseline + 1.0).contains(&y),
                _ => true,
            })
    };
    let grid: Vec<(bool, [f32; 2])> = (ys.0..=ys.1)
        .step_by(2)
        .flat_map(|y| (xs.0..=xs.1).step_by(2).map(move |x| (((x - xs.0) / 2 + (y - ys.0) / 2) % 2 == 0, [x as f32 + 0.5, y as f32 + 0.5])))
        .filter(|&(_, [x, y])| wanted(x, y) && clear(x, y))
        .collect();
    let mut dots: Vec<[f32; 2]> = grid.iter().filter(|g| g.0).map(|g| g.1).collect();
    // Where walls cut the pattern off, fill the gaps from the whole grid.
    for &(_, p) in &grid {
        if !dots.iter().any(|d| (d[0] - p[0]).hypot(d[1] - p[1]) <= 2.0) {
            dots.push(p);
        }
    }
    dots.iter().map(|d| dot(d[0], d[1], 0.45)).collect()
}

/// A height marked on a pipe's centre line: a short bar across it, and an
/// arrow from the bar down to `bottom`, broken at `gap` for its label.
fn height(x: f32, bar: (f32, f32), top: f32, gap: (f32, f32), bottom: f32) -> Vec<Shape> {
    let mut s = vec![line(&[[bar.0, top], [bar.1, top]])];
    s.extend(arrow([x, gap.0], [x, top + 0.5]));
    s.extend(arrow([x, gap.1], [x, bottom]));
    s
}

/// A tank of liquid open at the top, with the pressure P₀ on its surface and
/// P at the depth h.
fn pressure_at_depth() -> Diagram {
    let mut s = vec![rect(1.0, 3.0, 3.0, 49.0), rect(48.0, 3.0, 50.0, 49.0), rect(1.0, 47.0, 50.0, 49.0)];
    // The surface, rippled.
    let surface: Vec<[f32; 2]> = (0..=180)
        .map(|i| {
            let x = 3.0 + i as f32 * 0.25;
            [x, 10.5 - (std::f32::consts::TAU * (x - 4.5) / 4.0).cos()]
        })
        .collect();
    s.push(line(&surface));
    // The depth h, from the surface's level to the point's.
    s.push(line(&[[50.0, 10.5], [61.5, 10.5]]));
    s.push(line(&[[31.5, 33.5], [61.5, 33.5]]));
    s.push(line(&[[56.5, 10.5], [56.5, 16.0]]));
    s.extend(arrow([56.5, 27.5], [56.5, 33.2]));
    s.extend(label("P_0", [20.0, 0.0, 31.0, 7.0], 7.0, 7.0));
    s.extend(label("h", [54.0, 18.0, 59.0, 25.0], 25.0, 7.0));
    s.extend(label("P", [25.0, 30.0, 30.0, 37.0], 37.0, 7.0));
    s.extend(label("ρ", [9.0, 22.0, 14.0, 29.0], 26.0, 5.5));
    let liquid = stipple(&s, (4, 46), (13, 45), |_, _| true);
    s.extend(liquid);
    Diagram::new("PressureAtDepth", 40, 3, include_bytes!("../../../../firmware/images/F79D2-packed.png"), s)
}

/// A pipe that narrows and rises, with the pressure, speed and section at
/// each end, and the heights of its centre line above a datum.
fn bernoulli_equation() -> Diagram {
    let top = smooth(&[
        [18.0, 28.5],
        [32.0, 28.5],
        [38.0, 25.0],
        [43.0, 19.5],
        [46.0, 14.5],
        [49.0, 9.0],
        [52.0, 6.0],
        [57.0, 3.6],
        [64.0, 1.8],
        [72.0, 0.6],
        [77.0, 0.5],
    ]);
    let bottom = smooth(&[
        [18.0, 36.5],
        [35.0, 36.5],
        [39.5, 35.0],
        [43.0, 31.5],
        [47.0, 25.0],
        [50.0, 20.8],
        [53.0, 18.4],
        [57.0, 16.7],
        [62.0, 15.4],
        [67.0, 14.6],
        [71.0, 14.5],
        [77.0, 14.5],
    ]);
    let pipe = between(&top, &bottom);
    let mut s = vec![line(&top), line(&bottom), line(&[[18.0, 42.5], [77.0, 42.5]])];
    s.extend(height(32.5, (29.0, 36.0), 32.5, (37.5, 37.5), 42.0));
    s.extend(height(69.5, (66.0, 73.0), 7.5, (19.0, 33.0), 42.0));
    s.extend(label("A_1", [0.0, 30.0, 7.0, 35.0], 35.0, 5.0));
    s.extend(label("P_1", [9.0, 27.0, 16.0, 32.0], 32.0, 5.0));
    s.extend(label("v_1", [9.0, 34.0, 16.0, 39.0], 38.0, 5.0));
    s.extend(label("y_1", [44.0, 32.0, 54.0, 40.0], 38.0, 6.0));
    s.extend(label("y_2", [64.0, 22.0, 75.0, 30.0], 28.0, 6.0));
    s.extend(label("P_2", [79.0, 2.0, 86.0, 7.0], 7.0, 5.0));
    s.extend(label("v_2", [79.0, 9.0, 86.0, 14.0], 13.0, 5.0));
    s.extend(label("A_2", [88.0, 5.0, 95.0, 10.0], 10.0, 5.0));
    let fluid = stipple(&s, (18, 76), (2, 36), |x, y| inside(&pipe, x, y));
    s.extend(fluid);
    Diagram::new("BernoulliEquation", 16, 6, include_bytes!("../../../../firmware/images/F7C51-packed.png"), s)
}

/// A pipe that comes in low from the left, rises through a pump and leaves
/// high to the right.
struct Pump {
    /// Its four walls, each from the pump's casing out to an open end.
    walls: Vec<Vec<[f32; 2]>>,
    /// The inside of the pipe below the pump and above it.
    lower: Vec<[f32; 2]>,
    upper: Vec<[f32; 2]>,
}

/// Where a riser's wall at `dx` from the pump's centre meets its casing.
fn on_pump(c: [f32; 2], r: f32, dx: f32, below: bool) -> [f32; 2] {
    let dy = (r * r - dx * dx).sqrt();
    [c[0] + dx, if below { c[1] + dy } else { c[1] - dy }]
}

/// Points, lines and arcs joined into one line.
fn path(parts: &[&[[f32; 2]]]) -> Vec<[f32; 2]> {
    parts.iter().flat_map(|p| p.iter().copied()).collect()
}

/// The pipe through a pump, as the two Flow pictures draw it. `c`, `r`: the
/// pump; `low`: the low pipe's left end, top and bottom; `riser_low`: the
/// left and right sides of the riser below the pump, and the radius of its
/// outer bend; `riser_high`: the same above it; `high`: the high pipe's top,
/// bottom and right end. The inner bends are tight.
fn pump_pipe(c: [f32; 2], r: f32, low: (f32, f32, f32), riser_low: (f32, f32, f32), riser_high: (f32, f32, f32), high: (f32, f32, f32)) -> Pump {
    let (left, low_top, low_bottom) = low;
    let (a, b, low_bend) = riser_low;
    let (d, e, high_bend) = riser_high;
    let (high_top, high_bottom, right) = high;
    let inner_bend = 2.0;
    // Below: the inner wall bends left into the low pipe's top, the outer
    // into its bottom.
    let p = on_pump(c, r, a - c[0], true);
    let inner_low = path(&[&[p], &arc_points(a - inner_bend, low_top - inner_bend, inner_bend, inner_bend, 0.0, 90.0), &[[left, low_top]]]);
    let p = on_pump(c, r, b - c[0], true);
    let outer_low = path(&[&[p], &arc_points(b - low_bend, low_bottom - low_bend, low_bend, low_bend, 0.0, 90.0), &[[left, low_bottom]]]);
    // Above: the outer wall bends right into the high pipe's top, the inner
    // into its bottom.
    let p = on_pump(c, r, d - c[0], false);
    let outer_high = path(&[&[p], &arc_points(d + high_bend, high_top + high_bend, high_bend, high_bend, 180.0, 270.0), &[[right, high_top]]]);
    let p = on_pump(c, r, e - c[0], false);
    let inner_high =
        path(&[&[p], &arc_points(e + inner_bend, high_bottom + inner_bend, inner_bend, inner_bend, 180.0, 270.0), &[[right, high_bottom]]]);
    Pump {
        lower: between(&inner_low, &outer_low),
        upper: between(&outer_high, &inner_high),
        walls: vec![inner_low, outer_low, outer_high, inner_high],
    }
}

/// A pipe with a pump in it, rising Δy between its ends, with the pressure,
/// speed and section at each end and the pump's power W.
fn flow_with_losses() -> Diagram {
    let (c, r) = ([40.5, 22.5], 6.0);
    let pipe = pump_pipe(c, r, (19.0, 35.5, 41.5), (37.5, 43.5, 2.0), (35.5, 45.5, 6.0), (0.5, 10.5, 62.0));
    let mut s: Vec<Shape> = pipe.walls.iter().map(|w| line(w)).collect();
    s.push(circle(c[0], c[1], r));
    s.extend(arrow([25.0, 22.5], [c[0] - r, 22.5]));
    s.extend(height(54.5, (51.0, 58.0), 5.5, (17.5, 30.0), 38.0));
    s.push(line(&[[47.0, 38.5], [58.0, 38.5]]));
    s.extend(label("W", [18.0, 19.0, 23.0, 26.0], 26.0, 7.0));
    s.extend(label("Δy", [49.0, 21.0, 60.0, 27.0], 25.5, 5.0));
    s.extend(label("P_2", [64.0, 0.0, 71.0, 5.0], 5.0, 5.0));
    s.extend(label("v_2", [64.0, 7.0, 71.0, 12.0], 11.0, 5.0));
    s.extend(label("A_2", [73.0, 3.0, 80.0, 8.0], 8.0, 5.0));
    s.extend(label("P_1", [10.0, 33.0, 17.0, 38.0], 38.0, 5.0));
    s.extend(label("A_1", [1.0, 36.0, 8.0, 41.0], 41.0, 5.0));
    s.extend(label("v_1", [10.0, 40.0, 17.0, 45.0], 43.8, 5.0));
    let mut fluid = stipple(&s, (37, 61), (2, 14), |x, y| inside(&pipe.upper, x, y));
    fluid.extend(stipple(&s, (19, 41), (29, 39), |x, y| inside(&pipe.lower, x, y)));
    s.extend(fluid);
    Diagram::new("FlowWithLosses", 24, 5, include_bytes!("../../../../firmware/images/F7F10-packed.png"), s)
}

/// A pipe with a pump in it, rising Δy between its ends, with the pressure
/// and average speed at each end, the section A and the pump's power W.
fn flow_in_full_pipes() -> Diagram {
    let (c, r) = ([47.5, 22.5], 7.0);
    let pipe = pump_pipe(c, r, (27.0, 37.5, 45.5), (43.5, 51.5, 6.5), (43.5, 51.5, 6.0), (1.5, 9.5, 70.0));
    let mut s: Vec<Shape> = pipe.walls.iter().map(|w| line(w)).collect();
    s.push(circle(c[0], c[1], r));
    s.extend(arrow([31.5, 22.5], [c[0] - r, 22.5]));
    s.extend(height(62.5, (59.0, 66.0), 5.5, (19.0, 31.0), 41.0));
    s.push(line(&[[54.0, 41.5], [67.0, 41.5]]));
    s.extend(label("W", [25.0, 19.0, 30.0, 26.0], 26.0, 7.0));
    s.extend(label("Δy", [58.0, 22.0, 69.0, 28.0], 26.5, 5.0));
    s.extend(label("P_2", [81.0, 0.0, 88.0, 5.0], 5.0, 5.0));
    s.extend(label("A", [91.0, 3.0, 94.0, 8.0], 8.0, 5.0));
    s.extend(label("v_avg", [72.0, 7.0, 88.0, 12.0], 11.0, 5.0));
    s.extend(label("P_1", [9.0, 35.0, 16.0, 40.0], 39.6, 5.0));
    s.extend(label("A", [3.0, 39.0, 6.0, 44.0], 44.0, 5.0));
    s.extend(label("v_avg", [9.0, 42.0, 25.0, 47.0], 45.0, 5.0));
    let mut fluid = stipple(&s, (45, 69), (3, 13), |x, y| inside(&pipe.upper, x, y));
    fluid.extend(stipple(&s, (27, 49), (31, 43), |x, y| inside(&pipe.lower, x, y)));
    s.extend(fluid);
    Diagram::new("FlowInFullPipes", 16, 4, include_bytes!("../../../../firmware/images/F818C-packed.png"), s)
}

pub(super) fn all() -> Vec<Diagram> {
    vec![pressure_at_depth(), bernoulli_equation(), flow_with_losses(), flow_in_full_pipes()]
}
