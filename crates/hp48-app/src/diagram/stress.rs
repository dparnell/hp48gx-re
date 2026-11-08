//! Stress Analysis.

use super::*;

/// Text whose letters fill the bitmap's rows `top`..`top + h`, between `x0` and `x1`.
fn label(s: &'static str, x0: f32, x1: f32, top: f32, h: f32) -> Shape {
    text(s, x0, x1 - x0, top + h, h)
}

/// A subscript to text that fills the rows `top`..`top + h`: smaller, and set lower.
fn subscript(s: &'static str, x0: f32, x1: f32, top: f32, h: f32) -> Shape {
    text(s, x0, x1 - x0, top + h + 0.4, h - 1.0)
}

/// A lower-case Greek letter (σ, τ) whose body fills the rows
/// `top + 1`..`top + 5`, with a subscript from `split` to `x1`, in the small font.
fn greek(main: &'static str, sub: &'static str, x0: f32, split: f32, x1: f32, top: f32) -> [Shape; 2] {
    [text(main, x0, split - x0, top + 5.0, 5.3), subscript(sub, split, x1, top, 5.0)]
}

/// A lower-case letter (x, y, r) filling the rows `top`..`top + 5`.
fn small(s: &'static str, x0: f32, x1: f32, top: f32) -> Shape {
    text(s, x0, x1 - x0, top + 5.0, 6.5)
}

/// A line drawn as dashes `on` long with gaps `off`, the first starting at `from`.
fn dashed(from: [f32; 2], to: [f32; 2], on: f32, off: f32) -> Vec<Shape> {
    let (dx, dy) = (to[0] - from[0], to[1] - from[1]);
    let len = dx.hypot(dy);
    let (ux, uy) = (dx / len, dy / len);
    let mut shapes = Vec::new();
    let mut t = 0.0;
    while t < len {
        let (a, b) = (t + 0.2, (t + on - 0.2).min(len));
        shapes.push(line(&[[from[0] + ux * a, from[1] + uy * a], [from[0] + ux * b, from[1] + uy * b]]));
        t += on + off;
    }
    shapes
}

/// A dotted line: dots a pixel long, two pixels apart.
fn dotted(from: [f32; 2], to: [f32; 2]) -> Vec<Shape> {
    dashed(from, to, 1.0, 1.0)
}

/// A dimension between the lines `x0` and `x1`, at `y`: arrows from the
/// label's sides, `gap0`..`gap1`, out to the lines.
fn dimension(x0: f32, x1: f32, y: f32, gap0: f32, gap1: f32) -> Vec<Shape> {
    let mut s = vec![line(&[[x0, y - 3.5], [x0, y + 3.5]]), line(&[[x1, y - 3.5], [x1, y + 3.5]])];
    s.extend(arrow([gap0, y], [x0 + 0.2, y]));
    s.extend(arrow([gap1, y], [x1 - 0.2, y]));
    s
}

/// A bar of length L pulled by the forces P, which stretch it by δ.
fn normal_stress() -> Diagram {
    let mut s = vec![closed(&[[19.5, 0.5], [60.5, 0.5], [60.5, 13.5], [19.5, 13.5]])];
    // The stretched end, dashed.
    s.extend(dashed([62.0, 0.5], [70.0, 0.5], 2.0, 1.0));
    s.extend(dashed([62.0, 13.5], [70.0, 13.5], 2.0, 1.0));
    s.extend(dashed([69.5, 0.0], [69.5, 14.0], 2.0, 1.0));
    // The forces.
    s.extend(arrow([19.5, 7.5], [8.9, 7.5]));
    s.extend(arrow([69.5, 7.5], [80.1, 7.5]));
    s.extend([label("P", 1.5, 7.0, 4.0, 7.0), label("P", 81.5, 87.0, 4.0, 7.0)]);
    // The length, and the stretch.
    s.extend(dimension(19.5, 60.5, 20.5, 33.9, 45.0));
    s.push(label("L", 36.5, 42.0, 17.0, 7.0));
    s.push(line(&[[69.5, 17.0], [69.5, 24.0]]));
    s.extend(arrow([75.9, 20.5], [69.7, 20.5]));
    s.push(label("δ", 62.5, 67.5, 17.0, 7.0));
    Diagram::new("NormalStress", 24, 16, include_bytes!("../../../../firmware/images/FEC8B-packed.png"), s)
}

/// A shaft of length L twisted by the torque T: a line along it turns
/// through the angle γ, the end through Ø, and the surface carries the shear
/// stress τ at the radius r.
fn shear_stress() -> Diagram {
    // The shaft, its near end on the left, its far end whole.
    let mut s = vec![line(&[[14.5, 0.5], [54.5, 0.5]]), line(&[[14.5, 22.5], [40.8, 22.5]]), line(&[[46.6, 22.5], [54.5, 22.5]])];
    s.push(arc(14.5, 11.5, 6.0, 11.0, 90.0, 270.0));
    s.push(ellipse(54.5, 11.5, 7.0, 11.0));

    // The torque, round the near end.
    s.push(arc(6.5, 11.5, 6.0, 11.0, 118.0, 235.0));
    s.extend(arrow([3.06, 2.49], [6.0, 0.4]));
    s.push(label("T", 0.5, 4.5, 24.0, 5.0));

    // A line along the shaft, and where the twist takes it, dotted.
    s.extend(dotted([9.0, 11.5], [47.5, 11.5]));
    s.extend(dotted([12.5, 12.02], [48.2, 17.3]));
    // The end's radius before and after, with the angle between them.
    s.push(line(&[[47.5, 11.5], [54.5, 11.5]]));
    s.push(line(&[[54.5, 11.5], [48.4, 17.6]]));
    s.push(line(&[[50.5, 13.5], [63.5, 26.5]]));
    s.push(label("Ø", 66.5, 72.0, 25.0, 5.0));

    // The radius.
    s.extend(arrow([54.5, 11.5], [54.5, 0.9]));
    s.push(line(&[[54.5, 6.5], [63.8, 6.5]]));
    s.push(small("r", 66.5, 71.5, 4.0));

    // The shear stress, round the surface.
    s.push(arc(47.5, 13.0, 8.0, 11.5, 248.0, 128.0));
    s.extend(arrow([42.57, 22.06], [46.0, 25.8]));
    s.push(small("τ", 34.5, 38.5, 3.0));

    // The length.
    s.extend(dimension(15.5, 54.5, 30.5, 28.9, 40.0));
    s.push(label("L", 31.5, 37.0, 27.0, 7.0));
    Diagram::new("ShearStress", 32, 13, include_bytes!("../../../../firmware/images/FEE25-packed.png"), s)
}

/// An element under the stresses σx, σy and τxy, and the same element turned
/// through θ, under σx1, σy1 and τx1y1.
fn stress_on_an_element() -> Diagram {
    // The element, on its axes.
    let mut s = vec![closed(&[[8.5, 19.5], [28.5, 19.5], [28.5, 39.5], [8.5, 39.5]])];
    s.push(line(&[[18.5, 0.0], [18.5, 4.6]]));
    s.extend(arrow([18.5, 29.5], [18.5, 5.8]));
    s.extend(arrow([17.5, 29.5], [41.9, 29.5]));
    s.push(line(&[[43.0, 29.5], [47.5, 29.5]]));
    s.extend([small("y", 11.5, 15.5, 0.0), small("x", 50.5, 54.5, 27.0)]);
    s.extend(greek("σ", "y", 22.5, 27.5, 31.0, 5.0));
    s.extend(greek("σ", "x", 37.5, 42.5, 46.0, 33.0));
    // The shear stress along each side.
    s.extend(arrow([12.0, 14.5], [25.0, 14.5]));
    s.extend(arrow([33.5, 35.9], [33.5, 22.7]));
    s.extend(arrow([3.5, 23.0], [3.5, 36.2]));
    s.extend(arrow([25.0, 44.5], [12.0, 44.5]));
    s.extend(greek("τ", "xy", 30.5, 35.5, 43.0, 16.0));

    // The element turned through θ, on the axes x1 and y1.
    s.push(closed(&[[68.5, 29.5], [80.5, 17.5], [92.5, 29.5], [80.5, 41.5]]));
    s.push(line(&[[80.5, 0.0], [80.5, 17.5]]));
    s.push(line(&[[93.0, 29.5], [105.6, 29.5]]));
    s.extend([small("y", 73.5, 77.5, 0.0), small("x", 108.5, 112.0, 27.0)]);
    s.push(line(&[[79.5, 30.5], [101.5, 8.5]]));
    s.push(line(&[[81.5, 30.5], [58.5, 7.5]]));
    s.extend([small("x", 103.5, 107.5, 4.0), subscript("1", 107.5, 111.0, 4.0, 5.0)]);
    s.extend([small("y", 49.5, 53.5, 1.0), subscript("1", 53.5, 57.0, 1.0, 5.0)]);
    // The angle.
    s.push(line(&[[95.0, 26.5], [100.6, 26.5]]));
    s.push(line(&[[95.3, 26.5], [99.6, 22.4]]));
    s.push(label("θ", 102.5, 106.5, 22.0, 5.0));
    // The normal stresses on the turned element.
    s.extend(arrow([86.5, 23.5], [97.1, 12.9]));
    s.extend(arrow([74.5, 23.5], [63.9, 12.9]));
    s.extend(greek("σ", "x1", 98.5, 103.5, 111.5, 13.0));
    s.extend(greek("σ", "y1", 49.5, 54.5, 62.0, 13.0));
    // The shear stress along its sides.
    s.extend(arrow([66.5, 23.5], [75.0, 15.0]));
    s.extend(arrow([94.5, 23.5], [86.0, 15.0]));
    s.extend(arrow([67.5, 35.5], [76.0, 44.0]));
    s.extend(arrow([93.5, 35.5], [85.0, 44.0]));
    s.extend(greek("τ", "x1y1", 81.5, 86.5, 102.0, 0.0));
    s.push(line(&[[88.5, 5.8], [88.5, 13.0]]));
    Diagram::new("StressOnAnElement", 8, 5, include_bytes!("../../../../firmware/images/FF07F-packed.png"), s)
}

/// Mohr's circle: normal stress across, shear stress down. The points
/// (σx, τxy) and (σy, -τxy) lie at the ends of a diameter; the circle
/// crosses the axis at the principal stresses σ1 and σ2, centred on σavg,
/// and reaches τmax and τmin. The diameter is 2θp1 from the axis and 2θs
/// from the vertical.
fn mohr_s_circle() -> Diagram {
    let (cx, cy) = (65.5, 26.5);
    // The circle, broken for the label σavg.
    let mut s = vec![arc(cx, cy, 24.0, 24.0, 159.0, 492.0)];
    // The axes, and the line through the centre.
    s.extend(arrow([21.0, 26.5], [106.0, 26.5]));
    s.extend(arrow([24.5, 23.0], [24.5, 53.0]));
    s.push(line(&[[cx, 0.0], [cx, 53.0]]));
    s.extend(greek("σ", "x1", 107.5, 112.5, 120.0, 24.0));
    s.extend(greek("τ", "x1y1", -0.5, 4.5, 20.5, 48.0));

    // The points, and the diameter through two of them.
    s.push(line(&[[45.5, 12.5], [84.5, 40.5]]));
    for (x, y) in [(cx, 2.5), (cx, 50.5), (41.5, 26.5), (89.5, 26.5), (45.5, 12.5), (84.5, 40.5)] {
        s.push(dot(x, y, 1.5));
    }
    s.extend(greek("τ", "min", 77.5, 82.5, 95.5, 0.0));
    s.extend(greek("τ", "max", 77.5, 82.5, 96.5, 48.0));
    s.extend(greek("σ", "1", 91.5, 96.5, 100.0, 19.0));
    s.extend(greek("σ", "2", 30.5, 35.5, 39.0, 19.0));
    s.extend([label("(σ", 7.5, 15.0, 10.0, 5.0), subscript("y", 15.5, 19.0, 10.0, 5.0), label(",−τ", 19.0, 31.0, 10.0, 5.0)]);
    s.extend([subscript("xy", 31.5, 39.0, 10.0, 5.0), label(")", 39.0, 42.5, 10.0, 5.0)]);
    s.extend([label("(σ", 87.5, 95.0, 38.0, 5.0), subscript("x", 95.5, 99.0, 38.0, 5.0), label(",τ", 99.0, 107.0, 38.0, 5.0)]);
    s.extend([subscript("xy", 107.5, 115.0, 38.0, 5.0), label(")", 115.0, 118.5, 38.0, 5.0)]);

    // The angles: 2θp1 from the axis to the diameter, 2θs from the diameter to the vertical.
    s.push(arc(cx, cy, 13.7, 13.7, 35.0, 11.0));
    s.extend(arrow([78.95, 29.11], [79.2, 26.4]));
    s.extend([label("2θ", 67.5, 75.5, 16.0, 5.0), subscript("p1", 75.5, 83.0, 16.0, 5.0)]);
    s.push(arc(cx, cy, 9.6, 9.6, -19.0, 74.0));
    s.extend(arrow([68.15, 35.73], [65.2, 36.1]));
    s.extend([label("2θ", 67.5, 75.5, 40.0, 5.0), subscript("s", 75.5, 79.5, 40.0, 5.0)]);

    // The average stress, from the axis to the centre.
    s.extend(arrow([33.9, 39.5], [24.7, 39.5]));
    s.extend(arrow([55.0, 39.5], [65.3, 39.5]));
    s.extend(greek("σ", "avg", 35.5, 40.5, 53.0, 37.0));
    Diagram::new("MohrSCircle", 0, 1, include_bytes!("../../../../firmware/images/FF4DA-packed.png"), s)
}

pub(super) fn all() -> Vec<Diagram> {
    vec![normal_stress(), shear_stress(), stress_on_an_element(), mohr_s_circle()]
}
