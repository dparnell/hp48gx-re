//! Solid State Devices.

use super::*;

/// Text whose letters fill the bitmap's rows `top`..`top + h`, between `x0` and `x1`.
fn label(s: &'static str, x0: f32, x1: f32, top: f32, h: f32) -> Shape {
    text(s, x0, x1 - x0, top + h, h)
}

/// A subscript to text that fills the rows `top`..`top + h`: smaller, and set lower.
fn subscript(s: &'static str, x0: f32, x1: f32, top: f32, h: f32) -> Shape {
    text(s, x0, x1 - x0, top + h + 0.4, h - 1.0)
}

/// A name with a subscript, such as V with GS, in the small font (capitals 5 pixels tall).
fn name(main: &'static str, sub: &'static str, x0: f32, split: f32, x1: f32, top: f32) -> [Shape; 2] {
    [label(main, x0, split, top, 5.0), subscript(sub, split, x1, top, 5.0)]
}

/// Parallel lines across the convex polygon `poly`, along `dir`: one through
/// `through`, and the others offset from it by multiples of `gap`.
fn hatch(poly: &[[f32; 2]], dir: [f32; 2], through: [f32; 2], gap: [f32; 2]) -> Vec<Shape> {
    let len = dir[0].hypot(dir[1]);
    let d = [dir[0] / len, dir[1] / len];
    let normal = [-d[1], d[0]];
    let dot = |a: [f32; 2], b: [f32; 2]| a[0] * b[0] + a[1] * b[1];
    let rel = |p: [f32; 2]| [p[0] - through[0], p[1] - through[1]];
    let step = dot(gap, normal);
    let offsets: Vec<f32> = poly.iter().map(|&p| dot(rel(p), normal) / step).collect();
    let lo = offsets.iter().cloned().fold(f32::MAX, f32::min).ceil() as i32;
    let hi = offsets.iter().cloned().fold(f32::MIN, f32::max).floor() as i32;
    let n = poly.len() as f32;
    let centre = [poly.iter().map(|p| p[0]).sum::<f32>() / n, poly.iter().map(|p| p[1]).sum::<f32>() / n];
    let mut shapes = Vec::new();
    for k in lo..=hi {
        let p0 = [through[0] + gap[0] * k as f32, through[1] + gap[1] * k as f32];
        // Clip the line p0 + t·d to every edge's inner side.
        let (mut t0, mut t1) = (f32::MIN, f32::MAX);
        for i in 0..poly.len() {
            let (a, b) = (poly[i], poly[(i + 1) % poly.len()]);
            let mut inward = [a[1] - b[1], b[0] - a[0]];
            if dot(inward, [centre[0] - a[0], centre[1] - a[1]]) < 0.0 {
                inward = [-inward[0], -inward[1]];
            }
            let (num, den) = (dot(inward, [p0[0] - a[0], p0[1] - a[1]]), dot(inward, d));
            if den.abs() < 1e-6 {
                if num < 0.0 {
                    t1 = f32::MIN;
                }
            } else if den > 0.0 {
                t0 = t0.max(-num / den);
            } else {
                t1 = t1.min(-num / den);
            }
        }
        if t1 - t0 > 0.3 {
            shapes.push(line(&[[p0[0] + d[0] * t0, p0[1] + d[1] * t0], [p0[0] + d[0] * t1, p0[1] + d[1] * t1]]));
        }
    }
    shapes
}

/// A terminal: a small dot where a wire ends.
fn terminal(x: f32, y: f32) -> Shape {
    dot(x, y, 1.15)
}

/// A rounded rectangle's points, convex, from (`x0`, `y0`) to (`x1`, `y1`),
/// with the lower corners rounded by `left` and `right`.
fn rounded_below(x0: f32, y0: f32, x1: f32, y1: f32, left: f32, right: f32) -> Vec<[f32; 2]> {
    let mut points = vec![[x0, y0], [x1, y0]];
    points.extend(arc_points(x1 - right, y1 - right, right, right, 0.0, 90.0));
    points.extend(arc_points(x0 + left, y1 - left, left, left, 90.0, 180.0));
    points
}

/// A well diffused into the substrate: down from the surface at `top`, its
/// lower corners rounded by `r`.
fn well(x0: f32, x1: f32, top: f32, bottom: f32, r: f32) -> Shape {
    let mut points = vec![[x0, top]];
    points.extend(arc_points(x0 + r, bottom - r, r, r, 180.0, 90.0));
    points.extend(arc_points(x1 - r, bottom - r, r, r, 90.0, 0.0));
    points.push([x1, top]);
    line(&points)
}

/// A PN step junction under the voltage Va, with its depletion region (width
/// xd) hatched; beside it the doping on each side, NA and ND, and the electric
/// field across the junction, peaking at Emax.
fn pn_step_junctions() -> Diagram {
    let mut s = vec![closed(&[[10.5, 13.5], [49.5, 13.5], [49.5, 25.5], [10.5, 25.5]])];
    // The depletion region: the P side hatched one way, the N side the other.
    for x in [20.5, 26.5, 38.5] {
        s.push(line(&[[x, 13.5], [x, 25.5]]));
    }
    s.extend(hatch(&[[20.5, 13.5], [26.5, 13.5], [26.5, 25.5], [20.5, 25.5]], [1.0, -1.0], [22.5, 14.5], [3.0, 0.0]));
    s.extend(hatch(&[[26.5, 13.5], [38.5, 13.5], [38.5, 25.5], [26.5, 25.5]], [1.0, 1.0], [27.5, 14.5], [3.0, 0.0]));
    s.extend([label("P", 13.5, 17.5, 17.0, 5.0), label("N", 41.5, 46.5, 17.0, 5.0)]);

    // The current in, and the wire out.
    s.extend(arrow([0.0, 19.5], [9.4, 19.5]));
    s.push(line(&[[49.5, 19.5], [58.8, 19.5]]));
    s.push(label("J", -0.5, 5.5, 9.0, 7.0));

    // The applied voltage across the device.
    s.extend(arrow([23.5, 6.5], [9.8, 6.5]));
    s.push(line(&[[41.0, 6.5], [50.5, 6.5]]));
    s.extend([label("V", 26.5, 32.5, 2.0, 7.0), subscript("a", 32.5, 38.5, 2.0, 7.0)]);

    // The depletion region's width, marked from outside.
    s.extend(arrow([15.0, 32.5], [20.3, 32.5]));
    s.extend(arrow([43.9, 32.5], [38.7, 32.5]));
    s.push(line(&[[20.5, 28.8], [20.5, 36.2]]));
    s.push(line(&[[38.5, 28.8], [38.5, 36.2]]));
    s.extend([text("x", 23.5, 6.0, 36.0, 6.5), subscript("d", 29.5, 35.5, 29.0, 7.0)]);

    // The doping, NA on the P side and ND on the N side, either side of the junction.
    s.push(line(&[[70.0, 2.5], [84.5, 2.5], [84.5, 18.5], [100.0, 18.5]]));
    s.push(line(&[[70.0, 13.5], [106.0, 13.5]]));
    s.extend(name("N", "A", 59.5, 64.5, 68.5, 0.0));
    s.extend(name("N", "D", 101.5, 106.5, 110.5, 16.0));
    // The edges of the depletion region, dotted.
    for x in [78.5, 96.5] {
        for y in (14..=26).step_by(2) {
            s.push(line(&[[x, y as f32 + 0.15], [x, y as f32 + 0.85]]));
        }
    }

    // The electric field, below its axis: a triangle peaking at the junction.
    s.push(line(&[[70.0, 27.5], [107.0, 27.5]]));
    s.push(line(&[[84.5, 23.6], [84.5, 42.0]]));
    s.push(line(&[[78.3, 27.5], [84.8, 38.7], [95.7, 27.5]]));
    s.extend(name("E", "max", 90.5, 94.5, 108.5, 37.0));
    Diagram::new("PNStepJunctions", 8, 7, include_bytes!("../../../../firmware/images/FDFEB-packed.png"), s)
}

/// An NMOS transistor in section: the gate on its oxide (εox) between the
/// source and drain diffusions, the channel length L, the substrate doping
/// NA, and the voltages at each terminal, measured from the source.
fn nmos_transistors() -> Diagram {
    let mut s = vec![closed(&[[0.5, 15.5], [66.5, 15.5], [66.5, 36.5], [0.5, 36.5]])];
    // The source and drain, each with the part that spreads under the gate.
    s.push(fill(&rounded_below(4.0, 16.0, 21.0, 22.0, 2.0, 0.01)));
    s.push(fill(&[[22.0, 16.0], [26.0, 16.0], [26.0, 20.0], [24.0, 22.0], [22.0, 22.0]]));
    s.push(fill(&[[41.0, 16.0], [45.0, 16.0], [45.0, 22.0], [43.0, 22.0], [41.0, 20.0]]));
    s.push(fill(&rounded_below(46.0, 16.0, 63.0, 22.0, 0.01, 2.0)));
    // (Lines along their middles, hidden by the fills, tell the tests they are solid.)
    s.push(line(&[[6.0, 19.0], [20.0, 19.0]]));
    s.push(line(&[[47.0, 19.0], [61.0, 19.0]]));

    // The gate, shaded, on the oxide; its edges carry down to mark the channel.
    let gate = [[26.5, 7.5], [40.5, 7.5], [45.5, 12.5], [21.5, 12.5]];
    s.push(closed(&gate));
    s.extend(hatch(&gate, [1.0, -1.0], [25.5, 8.5], [2.0, 0.0]));
    for x in [21.5, 45.5] {
        s.push(line(&[[x, 12.5], [x, 15.5]]));
        s.push(line(&[[x, 22.0], [x, 31.8]]));
    }
    s.push(line(&[[33.5, 13.6], [33.5, 18.2]]));
    s.extend([text("ε", 27.5, 4.0, 24.0, 6.5), text("ox", 31.5, 8.0, 24.5, 4.7)]);

    // The channel length.
    s.extend(arrow([28.9, 29.5], [21.7, 29.5]));
    s.extend(arrow([38.0, 29.5], [45.3, 29.5]));
    s.push(label("L", 31.5, 35.5, 27.0, 5.0));
    s.extend(name("N", "A", 51.5, 56.0, 60.0, 27.0));

    // The terminals: source, gate, drain and substrate.
    s.extend([terminal(14.5, 10.0), line(&[[14.5, 11.0], [14.5, 15.5]])]);
    s.extend([terminal(33.5, 1.0), line(&[[33.5, 2.0], [33.5, 7.5]])]);
    s.extend([terminal(52.5, 10.0), line(&[[52.5, 11.0], [52.5, 15.5]])]);
    s.extend([terminal(33.5, 43.0), line(&[[33.5, 36.5], [33.5, 42.0]])]);
    s.extend(name("V", "S", -0.5, 3.5, 7.0, 2.0));
    s.push(label("=0", 7.5, 15.5, 2.0, 5.0));
    s.extend(name("V", "GS", 36.5, 40.5, 49.0, 0.0));
    s.extend(name("V", "DS", 53.5, 57.5, 65.0, 2.0));
    s.extend(name("V", "BS", 17.5, 21.5, 29.0, 39.0));
    Diagram::new("NMOSTransistors", 32, 5, include_bytes!("../../../../firmware/images/FE318-packed.png"), s)
}

/// An NPN bipolar transistor, as its three layers and as its symbol, with
/// the currents into each terminal and the voltages VBE and VCE.
fn bipolar_transistors() -> Diagram {
    // The layers: emitter, base and collector.
    let mut s = vec![closed(&[[9.5, 10.5], [47.5, 10.5], [47.5, 28.5], [9.5, 28.5]])];
    for x in [23.5, 33.5] {
        s.push(line(&[[x, 10.5], [x, 28.5]]));
    }
    s.extend([label("E", 14.5, 18.5, 17.0, 5.0), label("B", 26.5, 30.5, 17.0, 5.0), label("C", 38.5, 42.5, 17.0, 5.0)]);
    s.extend([label("N", 13.5, 18.5, 32.0, 5.0), label("P", 26.5, 30.5, 32.0, 5.0), label("N", 38.5, 43.5, 32.0, 5.0)]);
    s.extend(arrow([0.0, 19.5], [9.0, 19.5]));
    s.extend(arrow([57.0, 19.5], [48.0, 19.5]));
    s.extend(arrow([28.5, 0.0], [28.5, 10.2]));
    s.extend(name("I", "E", 0.5, 3.5, 7.0, 9.0));
    s.extend(name("I", "C", 50.5, 53.5, 57.0, 9.0));
    s.extend(name("I", "B", 32.5, 35.5, 39.0, 0.0));

    // The symbol.
    s.push(line(&[[66.0, 18.5], [80.5, 18.5]]));
    s.push(line(&[[80.5, 12.8], [80.5, 24.2]]));
    s.push(line(&[[87.5, 0.0], [87.5, 9.5], [80.8, 16.2]]));
    s.extend(arrow([80.8, 20.8], [87.9, 27.4]));
    s.push(line(&[[87.5, 26.8], [87.5, 37.0]]));
    s.extend(name("I", "B", 66.5, 69.5, 73.0, 10.0));
    s.extend(name("I", "C", 78.5, 81.5, 85.0, 0.0));
    s.extend(name("I", "E", 90.5, 93.5, 97.0, 32.0));
    // The voltages: base to emitter, and collector to emitter.
    s.extend(arrow([74.5, 24.4], [74.5, 18.6]));
    s.push(line(&[[74.5, 32.6], [74.5, 37.0]]));
    s.extend(name("V", "BE", 67.5, 71.5, 79.5, 26.0));
    s.extend(arrow([99.5, 37.0], [99.5, 13.8]));
    s.extend(name("V", "CE", 92.5, 96.5, 104.0, 7.0));
    Diagram::new("BipolarTransistors", 16, 9, include_bytes!("../../../../firmware/images/FE5B4-packed.png"), s)
}

/// An N-channel JFET in section: the N+ source and drain and the P gate
/// diffused into N material (doping ND), the channel's thickness a and its
/// length L, and the voltages measured from the source.
fn jfets() -> Diagram {
    let mut s = vec![closed(&[[1.5, 19.5], [95.5, 19.5], [95.5, 40.5], [1.5, 40.5]])];
    // The source and drain wells, and the gate's.
    s.push(well(6.5, 28.5, 19.5, 27.5, 3.0));
    s.push(well(32.5, 64.5, 19.5, 29.5, 4.5));
    s.push(well(68.5, 90.5, 19.5, 27.5, 3.0));
    s.extend([label("N+", 13.5, 22.5, 21.0, 5.0), label("P", 46.5, 50.5, 22.0, 5.0), label("N+", 76.5, 85.5, 21.0, 5.0)]);
    s.extend(name("N", "D", 43.5, 48.0, 52.0, 33.0));

    // The contacts on top: the source and drain stippled, the gate hatched,
    // with dark blocks between them.
    s.push(line(&[[5.5, 15.0], [5.5, 11.5], [9.5, 11.5], [10.5, 12.5], [22.5, 12.5], [23.5, 11.5], [28.5, 11.5], [28.5, 15.0]]));
    s.push(line(&[[32.5, 15.0], [32.5, 11.5], [38.0, 11.5], [38.5, 12.5], [57.0, 12.5], [57.5, 11.5], [64.5, 11.5], [64.5, 15.0]]));
    s.push(line(&[[68.5, 15.0], [68.5, 11.5], [73.5, 11.5], [74.5, 12.5], [86.5, 12.5], [87.5, 11.5], [91.5, 11.5], [91.5, 15.0]]));
    for x in [1.0, 25.0, 62.0, 87.0] {
        let w = if x == 1.0 || x == 87.0 { 9.0 } else { 10.0 };
        s.push(fill(&[[x + 1.0, 15.0], [x + w - 1.0, 15.0], [x + w, 16.0], [x + w, 19.0], [x, 19.0], [x, 16.0]]));
    }
    for (y, from, to) in [(13, 6, 26), (15, 10, 24), (17, 12, 22), (13, 70, 90), (15, 72, 86), (17, 74, 84)] {
        for x in (from..=to).step_by(2) {
            s.push(dot(x as f32 + 0.5, y as f32 + 0.5, 0.4));
        }
    }
    for (x0, top, x1, bottom) in [(32.5, 11.5, 38.3, 15.0), (38.3, 12.5, 57.3, 15.0), (57.3, 11.5, 64.5, 15.0), (35.0, 15.0, 62.0, 19.0)] {
        s.extend(hatch(&[[x0, top], [x1, top], [x1, bottom], [x0, bottom]], [1.0, 1.0], [34.5, 13.5], [3.0, 0.0]));
    }

    // The channel's thickness under the gate.
    s.push(line(&[[29.0, 29.5], [34.0, 29.5]]));
    s.extend(arrow([31.5, 34.5], [31.5, 29.9]));
    s.extend(arrow([31.5, 34.5], [31.5, 40.1]));
    s.push(text("a", 21.5, 6.0, 37.0, 6.5));

    // The gate's length.
    s.push(line(&[[32.5, 42.8], [32.5, 48.0]]));
    s.push(line(&[[63.5, 42.8], [63.5, 48.0]]));
    s.extend(arrow([43.9, 45.5], [32.7, 45.5]));
    s.extend(arrow([53.0, 45.5], [63.3, 45.5]));
    s.push(label("L", 46.5, 50.5, 43.0, 5.0));

    // The terminals.
    for x in [16.5, 48.5, 80.5] {
        s.extend([terminal(x, 8.0), line(&[[x, 9.0], [x, 12.5]])]);
    }
    s.extend(name("V", "S", 8.5, 12.5, 16.0, 0.0));
    s.push(label("=0", 16.5, 24.5, 0.0, 5.0));
    s.extend(name("V", "GS", 41.5, 45.5, 54.0, 0.0));
    s.extend(name("V", "DS", 74.5, 78.5, 86.0, 0.0));
    Diagram::new("JFETs", 16, 4, include_bytes!("../../../../firmware/images/FE8F1-packed.png"), s)
}

pub(super) fn all() -> Vec<Diagram> {
    vec![pn_step_junctions(), nmos_transistors(), bipolar_transistors(), jfets()]
}
