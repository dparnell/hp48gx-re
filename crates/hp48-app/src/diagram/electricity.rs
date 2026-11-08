//! Electricity: transients, capacitors and inductors.

use super::*;

/// A coil of `loops` turns along the line from `from` to `to`, drawn as a
/// stretched spring seen from the side: the loops stand `width` to the right
/// of the line (left for a negative width), `rise` is how far each turn
/// doubles back. It leaves `from` and reaches `to` on the line.
fn coil(from: [f32; 2], to: [f32; 2], loops: usize, width: f32, rise: f32) -> Shape {
    use std::f32::consts::{FRAC_PI_2, TAU};
    let (dx, dy) = (to[0] - from[0], to[1] - from[1]);
    let len = dx.hypot(dy);
    let (ux, uy) = (dx / len, dy / len);
    let (vx, vy) = (-uy, ux);
    let pitch = (len - 2.0 * rise) / (loops as f32 + 0.5);
    let end = TAU * (loops as f32 + 0.5);
    let steps = (loops + 1) * 24;
    let points = (0..=steps)
        .map(|i| {
            let t = FRAC_PI_2 + end * i as f32 / steps as f32;
            let along = pitch * (t - FRAC_PI_2) / TAU + rise * (1.0 - t.sin());
            let side = -width * t.cos();
            [from[0] + ux * along + vx * side, from[1] + uy * along + vy * side]
        })
        .collect();
    Shape::Stroke(Polyline { points, closed: false })
}

/// A line drawn in the LCD's background colour, across something dark.
fn light_line(a: [f32; 2], b: [f32; 2]) -> Shape {
    let (dx, dy) = (b[0] - a[0], b[1] - a[1]);
    let len = dx.hypot(dy);
    let (nx, ny) = (-dy / len * 0.45, dx / len * 0.45);
    Shape::Fill { points: vec![[a[0] + nx, a[1] + ny], [b[0] + nx, b[1] + ny], [b[0] - nx, b[1] - ny], [a[0] - nx, a[1] - ny]], light: true }
}

/// A dark ring between the radii `inner` and `outer`, as sectors.
fn ring(cx: f32, cy: f32, inner: f32, outer: f32) -> Vec<Shape> {
    let n = 96;
    // Each sector overlaps the next a little, so no seams show between them,
    // and a line along each edge keeps it smooth.
    let at = |r: f32, i: f32| {
        let a = i * std::f32::consts::TAU / n as f32;
        [cx + r * a.cos(), cy + r * a.sin()]
    };
    let mut shapes: Vec<Shape> = (0..n)
        .map(|i| {
            let (a, b) = (i as f32 - 0.2, i as f32 + 1.2);
            fill(&[at(outer, a), at(outer, b), at(inner, b), at(inner, a)])
        })
        .collect();
    shapes.extend([round(cx, cy, outer - LINE / 2.0), round(cx, cy, inner + LINE / 2.0)]);
    shapes
}

/// A circle smoother than `circle`'s, for a large one.
fn round(cx: f32, cy: f32, r: f32) -> Shape {
    let points = (0..120)
        .map(|i| {
            let a = i as f32 * std::f32::consts::TAU / 120.0;
            [cx + r * a.cos(), cy + r * a.sin()]
        })
        .collect();
    Shape::Stroke(Polyline { points, closed: true })
}

/// Hatching in the box (`x0`, `y0`)..(`x1`, `y1`): lines falling to the left,
/// where x + y is each of `sums`.
fn hatch(x0: f32, y0: f32, x1: f32, y1: f32, sums: &[f32]) -> Vec<Shape> {
    sums.iter()
        .map(|&c| {
            // Where the line x + y = c enters and leaves the box.
            let top = [(c - y0).min(x1), c - (c - y0).min(x1)];
            let bottom = [(c - y1).max(x0), c - (c - y1).max(x0)];
            line(&[top, bottom])
        })
        .collect()
}

/// A loop of wire standing out from `base` towards angle `dir` (degrees, 90
/// down): two legs `w` apart, rounded off `h` from the base.
fn bump(base: [f32; 2], dir: f32, w: f32, h: f32) -> Shape {
    let (ux, uy) = (dir.to_radians().cos(), dir.to_radians().sin());
    let (vx, vy) = (-uy, ux);
    let r = w / 2.0;
    let at = |along: f32, side: f32| [base[0] + ux * along + vx * side, base[1] + uy * along + vy * side];
    let mut points = vec![at(0.0, -r)];
    points.extend((0..=12).map(|i| {
        let a = (-90.0 + 15.0 * i as f32).to_radians();
        at(h - r + r * a.cos(), r * a.sin())
    }));
    points.push(at(0.0, r));
    line(&points)
}

/// The voltage source of the transients: a step from `Vi` up to `Vf`.
fn step() -> Vec<Shape> {
    vec![line(&[[13.5, 28.5], [18.5, 28.5], [18.5, 14.5], [23.5, 14.5]])]
}

/// A resistor in a horizontal wire: a zigzag of two teeth from `x`.
fn zigzag(x: f32) -> Vec<[f32; 2]> {
    vec![[x, 3.5], [x + 3.0, 6.5], [x + 9.0, 0.5], [x + 15.0, 6.5], [x + 21.0, 0.5], [x + 24.0, 3.5]]
}

/// A capacitor's curved plate, its middle at (`x`, `y`), bowed towards
/// angle `dir` (degrees, 90 down).
fn curved_plate(x: f32, y: f32, dir: f32) -> Shape {
    let (cx, cy) = (x - 5.0 * dir.to_radians().cos(), y - 5.0 * dir.to_radians().sin());
    arc(cx, cy, 5.0, 5.0, dir - 50.0, dir + 50.0)
}

/// The phase of the current in a series and in a parallel RLC circuit.
fn rlc_current_delay() -> Diagram {
    let mut s = vec![
        // Series: R in the top wire, L down the side, C in the bottom wire.
        line(&[[0.0, 3.5], [11.5, 3.5], [14.5, 0.5], [20.5, 6.5], [26.5, 0.5], [29.5, 3.5], [36.5, 3.5], [36.5, 9.0]]),
        coil([36.5, 9.0], [36.5, 26.0], 3, 2.5, 2.0),
        line(&[[36.5, 26.0], [36.5, 31.5], [21.5, 31.5]]),
        curved_plate(21.5, 31.5, 180.0),
        line(&[[19.5, 27.0], [19.5, 36.0]]),
        line(&[[0.0, 31.5], [19.5, 31.5]]),
        text("R", 18.5, 4.0, 14.0, 5.0),
        text("L", 27.5, 4.0, 20.0, 5.0),
        text("C", 13.5, 4.0, 29.0, 5.0),
        text("φ", 0.0, 5.0, 16.0, 5.0),
        text("s", 5.0, 5.0, 16.5, 4.0),
        // Parallel: R, L and C side by side.
        line(&[[47.0, 3.5], [99.5, 3.5], [99.5, 16.5]]),
        line(&[[67.5, 3.5], [67.5, 8.5], [64.5, 11.5], [70.5, 17.5], [64.5, 23.5], [67.5, 26.5], [67.5, 31.5]]),
        line(&[[83.5, 3.5], [83.5, 9.0]]),
        coil([83.5, 9.0], [83.5, 26.0], 3, 2.5, 2.0),
        line(&[[83.5, 26.0], [83.5, 31.5]]),
        line(&[[95.0, 16.5], [104.0, 16.5]]),
        curved_plate(99.5, 18.5, 270.0),
        line(&[[47.0, 31.5], [99.5, 31.5], [99.5, 18.5]]),
        text("R", 61.5, 4.0, 20.0, 5.0),
        text("L", 74.5, 4.0, 20.0, 5.0),
        text("C", 89.5, 4.0, 20.0, 5.0),
        text("φ", 47.0, 5.0, 16.0, 5.0),
        text("p", 52.0, 5.0, 17.0, 5.0),
    ];
    s.extend(arrow([0.0, 22.5], [11.0, 22.5]));
    s.extend(arrow([47.0, 22.5], [58.0, 22.5]));
    Diagram::new("RLCCurrentDelay", 16, 10, include_bytes!("../../../../firmware/images/F660D-packed.png"), s)
}

/// An RC circuit switched from `Vi` to `Vf`, and the voltage across C.
fn rc_transient() -> Diagram {
    let mut top = vec![[38.0, 3.5]];
    top.extend(zigzag(43.5));
    top.push([96.0, 3.5]);
    let mut s = step();
    s.extend([
        line(&top),
        line(&[[79.5, 3.5], [79.5, 18.5]]),
        line(&[[75.0, 18.5], [84.0, 18.5]]),
        curved_plate(79.5, 20.5, 270.0),
        line(&[[79.5, 20.5], [79.5, 37.5]]),
        line(&[[39.0, 37.5], [96.0, 37.5]]),
        text("V", -0.5, 6.0, 32.0, 7.0),
        text("i", 6.0, 4.5, 32.5, 6.0),
        text("V", 26.5, 6.0, 18.0, 7.0),
        text("f", 33.0, 5.0, 18.5, 6.0),
        text("R", 52.5, 6.0, 17.0, 7.0),
        text("C", 66.5, 6.0, 24.0, 7.0),
        text("V", 89.5, 6.0, 24.0, 7.0),
    ]);
    s.extend(arrow([92.5, 14.0], [92.5, 4.0]));
    s.extend(arrow([92.5, 26.5], [92.5, 37.0]));
    Diagram::new("RCTransient", 8, 8, include_bytes!("../../../../firmware/images/F692A-packed.png"), s)
}

/// An RL circuit switched from `Vi` to `Vf`, and the current through it.
fn rl_transient() -> Diagram {
    let mut top = vec![[36.0, 3.5]];
    top.extend(zigzag(41.5));
    top.extend([[77.5, 3.5], [77.5, 13.0]]);
    let mut s = step();
    s.extend([
        line(&top),
        coil([77.5, 13.0], [77.5, 30.0], 3, 2.5, 2.0),
        line(&[[77.5, 30.0], [77.5, 37.5], [36.0, 37.5]]),
        text("V", -0.5, 6.0, 31.0, 7.0),
        text("i", 6.0, 4.5, 31.5, 6.0),
        text("V", 25.5, 6.0, 18.0, 7.0),
        text("f", 32.0, 5.0, 18.5, 6.0),
        text("R", 50.5, 6.0, 17.0, 7.0),
        text("L", 65.5, 6.0, 24.0, 7.0),
        text("I", 83.5, 4.0, 24.0, 7.0),
    ]);
    s.extend(arrow([85.5, 3.0], [85.5, 14.0]));
    Diagram::new("RLTransient", 16, 8, include_bytes!("../../../../firmware/images/F6BA4-packed.png"), s)
}

/// Two plates of area A, a distance d apart, with a dielectric εr between.
fn plate_capacitor() -> Diagram {
    let mut s = vec![
        closed(&[[11.5, 11.5], [71.5, 11.5], [71.5, 33.5], [11.5, 33.5]]),
        line(&[[16.5, 11.5], [16.5, 8.5], [66.5, 8.5], [66.5, 11.5]]),
        line(&[[16.5, 33.5], [16.5, 36.5], [66.5, 36.5], [66.5, 33.5]]),
        line(&[[41.5, 2.0], [41.5, 8.5]]),
        line(&[[41.5, 36.5], [41.5, 43.0]]),
        dot(41.5, 2.0, 1.3),
        dot(41.5, 43.0, 1.3),
        text("ε", 36.5, 5.0, 25.0, 6.5),
        text("r", 41.5, 5.5, 25.5, 5.5),
        // The distance between the plates.
        line(&[[1.0, 11.5], [8.0, 11.5]]),
        line(&[[1.0, 33.5], [8.0, 33.5]]),
        text("d", 1.5, 6.0, 26.0, 6.7),
        // The area of a plate.
        line(&[[64.0, 3.5], [59.5, 3.5], [58.5, 4.5]]),
        text("A", 66.5, 6.0, 7.0, 7.0),
    ];
    s.extend(arrow([4.5, 16.0], [4.5, 12.0]));
    s.extend(arrow([4.5, 29.0], [4.5, 33.0]));
    s.extend(arrow([58.5, 4.5], [58.5, 8.0]));
    Diagram::new("PlateCapacitor", 24, 6, include_bytes!("../../../../firmware/images/F6DC2-packed.png"), s)
}

/// The points where the outer tangents of two circles touch them, on the
/// side `side` (1 or -1) of the line from the first centre to the second.
fn tangent(c1: [f32; 2], r1: f32, c2: [f32; 2], r2: f32, side: f32) -> (f32, [f32; 2], [f32; 2]) {
    let (dx, dy) = (c2[0] - c1[0], c2[1] - c1[1]);
    let a = dy.atan2(dx) + side * ((r1 - r2) / dx.hypot(dy)).acos();
    let (cos, sin) = (a.cos(), a.sin());
    (a.to_degrees(), [c1[0] + r1 * cos, c1[1] + r1 * sin], [c2[0] + r2 * cos, c2[1] + r2 * sin])
}

/// Coaxial cylinders of length L: the inner one of radius ri, the outer one's
/// inside of radius ro, with a dielectric εr between. The near end is cut.
fn cylindrical_capacitor() -> Diagram {
    let (cx, cy) = (33.5, 31.5);
    let (r_out, r_o, r_i) = (11.5, 6.5, 3.5);
    let (far, r_far) = ([69.5, 22.2], 10.0);
    let (top_angle, top_near, top_far) = tangent([cx, cy], r_out, far, r_far, -1.0);
    let (bottom_angle, bottom_near, bottom_far) = tangent([cx, cy], r_out, far, r_far, 1.0);
    let mut s = vec![line(&[top_near, top_far]), line(&[bottom_near, bottom_far]), arc(far[0], far[1], r_far, r_far, top_angle, bottom_angle)];
    // The hidden half of the far end.
    for a in [120.0, 145.0, 170.0, 195.0, 220.0] {
        s.push(arc(far[0], far[1], r_far, r_far, a - 6.0, a + 6.0));
    }
    // The cut end: the outer conductor, the dielectric and the inner one.
    s.extend(ring(cx, cy, r_o, r_out));
    // The inner conductor, solid (the inner dot only marks its middle as ink).
    s.extend([dot(cx, cy, r_i), dot(cx, cy, 1.5)]);

    // A line from `x0` along row `y`, dark where the end is light and light
    // where it is dark, ending at `x1`.
    let edge = |r: f32, y: f32| cx - (r * r - (y - cy) * (y - cy)).max(0.0).sqrt();
    let mut across = |x0: f32, x1: f32, y: f32| {
        let cuts = [x0, edge(r_out, y).min(x1), edge(r_o, y).min(x1), edge(r_i, y).min(x1), x1];
        for (i, pair) in cuts.windows(2).enumerate() {
            if pair[1] > pair[0] {
                let (a, b) = ([pair[0], y], [pair[1], y]);
                s.push(if i % 2 == 0 { line(&[a, b]) } else { light_line(a, b) });
            }
        }
    };
    across(16.0, edge(r_i, 28.5), 28.5);
    across(3.0, cx, 31.5);
    across(3.0, edge(r_o, 37.5), 37.5);

    // The leader from εr into the dielectric, light across the outer conductor.
    let (from, to) = ([26.5, 8.0], [32.5, 26.5]);
    let at = |t: f32| [from[0] + (to[0] - from[0]) * t, from[1] + (to[1] - from[1]) * t];
    let hit = |r: f32| {
        // Where the leader crosses the circle of radius r.
        let (px, py, qx, qy) = (from[0] - cx, from[1] - cy, to[0] - from[0], to[1] - from[1]);
        let (a, b, c) = (qx * qx + qy * qy, 2.0 * (px * qx + py * qy), px * px + py * py - r * r);
        (-b - (b * b - 4.0 * a * c).sqrt()) / (2.0 * a)
    };
    let (t1, t2) = (hit(r_out), hit(r_o));
    s.extend([line(&[from, at(t1)]), light_line(at(t1), at(t2)), line(&[at(t2), to])]);

    s.extend([
        text("ε", 17.5, 5.0, 8.0, 6.5),
        text("r", 22.5, 5.5, 8.5, 5.5),
        text("r", 13.5, 5.5, 21.0, 6.5),
        text("i", 20.0, 4.5, 21.0, 5.5),
        text("r", -0.5, 5.5, 23.0, 6.5),
        text("o", 5.5, 6.0, 23.5, 5.5),
        text("L", 48.5, 6.0, 11.0, 7.0),
        // The length.
        line(&[[33.5, 8.0], [33.5, 15.0]]),
        line(&[[69.5, 0.0], [69.5, 7.0]]),
    ]);
    let slope = (4.5 - 11.5) / (69.3 - 33.8);
    let dim = |x: f32| [x, 11.5 + (x - 33.8) * slope];
    s.extend(arrow(dim(46.0), dim(33.8)));
    // The bitmap's head at this end is wider.
    let (tip, back) = (dim(69.3), dim(66.3));
    let (nx, ny) = (-slope * 2.2 / slope.hypot(1.0), 2.2 / slope.hypot(1.0));
    s.extend([line(&[dim(56.5), back]), fill(&[tip, [back[0] - nx, back[1] - ny], [back[0] + nx, back[1] + ny]])]);
    s.extend(arrow([18.5, 24.0], [18.5, 28.2]));
    s.extend(arrow([18.5, 36.0], [18.5, 31.9]));
    s.extend(arrow([5.5, 26.0], [5.5, 31.1]));
    s.extend(arrow([5.5, 43.0], [5.5, 37.9]));
    Diagram::new("CylindricalCapacitor", 16, 5, include_bytes!("../../../../firmware/images/F6FC7-packed.png"), s)
}

/// A solenoid of length h on a core of relative permeability μr.
fn solenoid_inductance() -> Diagram {
    let mut s = vec![closed(&[[11.5, 15.5], [73.5, 15.5], [73.5, 31.5], [11.5, 31.5]])];
    for k in 0..10 {
        let x = 14.5 + 6.0 * k as f32;
        // The front of a turn, and where it goes over the top.
        s.push(line(&[[x, 15.5], [x, 31.5]]));
        let mut over = vec![[x, 15.5]];
        over.extend(arc_points(x + 1.5, 13.0, 1.5, 1.5, 180.0, 360.0));
        over.push([x + 3.0, 15.5]);
        s.push(line(&over));
        // Where it comes round underneath to the next.
        if k < 9 {
            let mut under = vec![[x + 3.0, 31.5]];
            under.extend(arc_points(x + 4.5, 34.0, 1.5, 1.5, 180.0, 0.0));
            under.push([x + 6.0, 31.5]);
            s.push(line(&under));
        }
    }
    s.extend([
        // The leads.
        line(&[[14.5, 31.5], [14.5, 38.5], [9.0, 38.5]]),
        line(&[[71.5, 31.5], [71.5, 42.5], [9.0, 42.5]]),
        dot(9.0, 38.0, 1.0),
        dot(9.0, 43.0, 1.0),
        text("L", -0.5, 6.0, 44.0, 7.0),
        text("μ", 76.5, 6.0, 26.0, 6.5),
        text("r", 82.5, 5.5, 26.5, 5.5),
        // The length.
        line(&[[14.5, 1.0], [14.5, 8.0]]),
        line(&[[71.5, 1.0], [71.5, 8.0]]),
        text("h", 40.5, 6.0, 7.0, 6.7),
    ]);
    s.extend(arrow([38.0, 4.5], [14.8, 4.5]));
    s.extend(arrow([49.0, 4.5], [71.2, 4.5]));
    Diagram::new("SolenoidInductance", 24, 5, include_bytes!("../../../../firmware/images/F72BC-packed.png"), s)
}

/// A toroid of N turns, inner and outer radii ri and ro, thickness h, and
/// its cross-section.
fn toroid_inductance() -> Diagram {
    let (cx, cy) = (40.5, 23.5);
    let mut s = vec![round(cx, cy, 20.0), round(cx, cy, 13.0)];
    // The turns: where each goes over the outside, across the front, and
    // through the hole.
    for (base, dir, w, h) in [
        ([33.5, 4.0], -95.0, 2.0, 3.0),
        ([46.0, 4.0], -85.0, 3.0, 3.5),
        ([55.3, 9.3], -25.0, 3.0, 2.5),
        ([60.3, 19.7], 0.0, 3.0, 2.0),
        ([59.3, 31.5], 15.0, 3.0, 2.2),
        ([52.6, 40.0], 45.0, 3.0, 2.0),
        ([42.0, 43.3], 90.0, 3.0, 3.2),
        ([24.0, 33.6], 172.0, 3.0, 4.0),
        ([24.3, 11.3], -145.0, 3.5, 2.5),
    ] {
        s.push(bump(base, dir, w, h));
    }
    for (base, dir, w, h) in [
        ([40.0, 10.5], 90.0, 3.0, 3.2),
        ([46.5, 12.0], 90.0, 2.0, 2.5),
        ([40.5, 36.5], -90.0, 2.0, 3.2),
        ([28.6, 28.0], 0.0, 3.0, 2.0),
        ([33.4, 34.6], -75.0, 2.0, 2.6),
    ] {
        s.push(bump(base, dir, w, h));
    }
    for front in [
        &[[35.8, 4.3], [38.6, 10.6]][..],
        &[[47.5, 4.0], [45.6, 12.3]],
        &[[55.6, 10.5], [51.0, 14.8]],
        &[[60.0, 21.5], [51.5, 22.3]],
        &[[57.5, 32.5], [51.5, 28.6]],
        &[[51.0, 40.5], [46.5, 32.5]],
        &[[40.5, 43.0], [41.5, 37.0]],
        &[[25.0, 31.6], [28.8, 29.7]],
        &[[34.5, 35.0], [30.6, 42.8]],
        &[[25.8, 10.3], [33.0, 15.5], [34.3, 14.6], [34.5, 12.8]],
    ] {
        s.push(line(front));
    }
    s.extend([
        // The leads.
        line(&[[9.0, 19.5], [20.5, 19.5], [28.3, 21.5], [29.5, 20.3], [29.5, 18.8]]),
        line(&[[9.0, 27.5], [20.5, 27.5]]),
        dot(9.0, 19.0, 1.0),
        dot(9.0, 28.0, 1.0),
        text("L", -0.5, 6.0, 27.0, 7.0),
        // The core's relative permeability.
        line(&[[14.0, 42.5], [21.5, 42.5], [28.5, 35.2]]),
        text("μ", -0.5, 6.0, 44.0, 6.5),
        text("r", 5.5, 5.5, 44.5, 5.5),
        // The radii, measured from the axis.
        line(&[[34.0, 3.5], [84.0, 3.5]]),
        line(&[[36.0, 36.5], [84.0, 36.5]]),
        text("r", 65.5, 5.5, 16.0, 6.5),
        text("o", 70.5, 6.0, 16.5, 5.5),
        text("r", 65.5, 5.5, 33.0, 6.5),
        text("i", 71.5, 4.5, 33.0, 5.5),
        // The cross-section, and its thickness.
        closed(&[[86.5, 3.5], [98.5, 3.5], [98.5, 10.5], [86.5, 10.5]]),
        closed(&[[86.5, 36.5], [98.5, 36.5], [98.5, 43.5], [86.5, 43.5]]),
        line(&[[86.5, 13.0], [86.5, 20.0]]),
        line(&[[98.5, 13.0], [98.5, 20.0]]),
        text("h", 89.5, 6.0, 20.0, 6.7),
    ]);
    s.extend(hatch(86.5, 3.5, 98.5, 10.5, &[94.0, 97.0, 100.0, 103.0, 106.0]));
    s.extend(hatch(86.5, 36.5, 98.5, 43.5, &[127.0, 130.0, 133.0, 136.0, 139.0]));
    s.extend(arrow([91.5, 23.5], [39.0, 23.5]));
    s.extend(arrow([99.0, 23.5], [91.0, 23.5]));
    s.extend(arrow([71.5, 9.0], [71.5, 4.0]));
    s.extend(arrow([71.5, 17.5], [71.5, 23.0]));
    s.extend(arrow([71.5, 42.0], [71.5, 37.0]));
    s.extend(arrow([81.0, 16.5], [86.3, 16.5]));
    s.extend(arrow([104.0, 16.5], [98.7, 16.5]));
    Diagram::new("ToroidInductance", 16, 5, include_bytes!("../../../../firmware/images/F75D6-packed.png"), s)
}

pub(super) fn all() -> Vec<Diagram> {
    vec![
        rlc_current_delay(),
        rc_transient(),
        rl_transient(),
        plate_capacitor(),
        cylindrical_capacitor(),
        solenoid_inductance(),
        toroid_inductance(),
    ]
}
