//! Oscillations.

use super::*;

/// A ceiling: a line along `y` from `x0` to `x1`, hatched above with ticks
/// leaning right, 3 pixels apart, the first starting at `x0`.
fn ceiling(x0: f32, x1: f32, y: f32) -> Vec<Shape> {
    let mut shapes = vec![line(&[[x0, y], [x1, y]])];
    let mut x = x0 + 0.5;
    while x + 3.0 <= x1 + 0.5 {
        shapes.push(line(&[[x, y - 0.3], [x + 2.7, y - 3.0]]));
        x += 3.0;
    }
    shapes
}

/// Add points to a polyline built from arcs, leaving out repeated ones.
fn push_points(points: &mut Vec<[f32; 2]>, more: Vec<[f32; 2]>) {
    for p in more {
        if points.last().is_none_or(|q| (q[0] - p[0]).hypot(q[1] - p[1]) > 0.01) {
            points.push(p);
        }
    }
}

/// A mass on a spring, fixed to a wall, on the ground: one frame of the
/// animation the picture viewer plays. `s` stretches the spring, from 0.5 in
/// the first frame (coils 4 pixels apart) to 1 in the last (8 apart), and the
/// mass moves with its end.
fn spring(name: &'static str, png: &[u8], s: f32) -> Diagram {
    // The wall and the ground, hatched.
    let mut out = vec![line(&[[3.5, 3.0], [3.5, 21.5], [70.0, 21.5]])];
    for i in 0..6 {
        let y = 3.5 + 3.0 * i as f32;
        out.push(line(&[[3.5, y], [0.5, y + 3.0]]));
    }
    for i in 0..23 {
        let x = 3.5 + 3.0 * i as f32;
        out.push(line(&[[x, 21.5], [x - 3.0, 24.5]]));
    }

    // The spring, seen from the side: five arches over the top, joined by
    // four loops hanging below. Arch i peaks at x = t0 + 8s·i, and each loop
    // sits halfway between two arches.
    let t0 = 11.5 + 2.0 * s;
    let end = 12.5 + 36.0 * s;
    let (reach, half) = (4.62 * s, 1.0 + 2.0 * s);
    let mut points = vec![[3.5, 14.5], [10.5, 14.5]];
    push_points(&mut points, arc_points(t0, 12.5, half, 2.0, 180.0, 270.0));
    for i in 0..4 {
        let t = t0 + 8.0 * s * i as f32;
        push_points(&mut points, arc_points(t, 12.5, reach, 2.0, 270.0, 330.0));
        push_points(&mut points, arc_points(t + 4.0 * s, 14.5, 2.0 * s, 3.0, -90.0, 270.0));
        push_points(&mut points, arc_points(t + 8.0 * s, 12.5, reach, 2.0, 210.0, 270.0));
    }
    push_points(&mut points, arc_points(t0 + 32.0 * s, 12.5, half, 2.0, 270.0, 360.0));
    push_points(&mut points, vec![[end, 14.5], [end + 7.0, 14.5]]);
    out.push(Shape::Stroke(Polyline { points, closed: false }));

    // The mass.
    let left = end + 7.0;
    out.push(closed(&[[left, 8.5], [left + 12.0, 8.5], [left + 12.0, 20.5], [left, 20.5]]));
    out.push(text("m", left + 2.5, 7.0, 17.0, 7.0));
    out.push(text("k", 22.5, 5.0, 7.0, 7.0));
    Diagram::new(name, 32, 14, png, out)
}

/// The spring at rest.
fn spring1() -> Diagram {
    spring("Spring1", include_bytes!("../../../../firmware/images/FB811-packed.png"), 0.5)
}

/// The spring half stretched.
fn spring2() -> Diagram {
    spring("Spring2", include_bytes!("../../../../firmware/images/FB9A5-packed.png"), 0.75)
}

/// The spring stretched.
fn spring3() -> Diagram {
    spring("Spring3", include_bytes!("../../../../firmware/images/FBB32-packed.png"), 1.0)
}

/// A bob on a string of length L, hanging from the ceiling and swung to the left.
fn simple_pendulum() -> Diagram {
    let mut s = ceiling(13.0, 32.0, 3.5);
    let bob = [9.5, 38.5];
    s.push(line(&[[22.6, 3.5], [10.4, 36.1]]));
    s.push(dot(bob[0], bob[1], 2.5));
    s.push(dot(bob[0], bob[1], 1.0));
    s.push(text("m", 0.0, 5.0, 41.0, 7.0));
    // L, along the string: from the ceiling to the level of the bob's centre.
    s.extend(arrow([25.4, 15.5], [29.4, 4.0]));
    s.extend(arrow([20.5, 28.0], [16.6, 38.2]));
    s.push(line(&[[14.0, 38.5], [19.0, 38.5]]));
    s.push(text("L", 22.0, 5.0, 25.0, 7.0));
    Diagram::new("SimplePendulum", 48, 7, include_bytes!("../../../../firmware/images/FBCAE-packed.png"), s)
}

/// A bob swinging round a circle on a string of length L, the string at θ to
/// the vertical, the circle's plane h below the ceiling.
fn conical_pendulum() -> Diagram {
    let mut s = ceiling(21.0, 46.0, 3.5);
    let (cx, cy) = (33.5, 39.0);

    // The axis down to the circle's centre, and the circle it turns on,
    // with the way the bob goes round.
    for (from, to) in [(8.0, 10.0), (12.0, 14.0), (16.0, 18.0), (20.0, 22.0), (24.0, 26.0), (27.5, 29.0), (30.5, 32.0), (34.0, 36.0)] {
        s.push(line(&[[cx, from + 0.2], [cx, to - 0.2]]));
    }
    s.push(circle(cx, 38.5, 1.0));
    s.extend(dotted(arc_points(cx, cy, 20.0, 9.5, 0.0, 360.0)));
    s.push(arc(cx, cy, 15.0, 5.5, 80.0, 40.0));
    s.extend(arrow(ellipse_point(cx, cy, 15.0, 5.5, 40.0), [48.8, 39.2]));

    // The string and the bob.
    s.push(line(&[[cx, 3.5], [13.5, 38.0]]));
    s.push(dot(13.5, 38.5, 2.5));
    s.push(dot(13.5, 38.5, 1.0));
    s.push(text("θ", 27.5, 4.0, 22.0, 5.0));

    // L, along the string, ending at a line square to it through the bob.
    s.extend(arrow([19.4, 13.6], [24.6, 4.0]));
    s.extend(arrow([13.6, 23.0], [7.8, 33.4]));
    s.push(line(&[[4.3, 32.3], [9.0, 35.8]]));
    s.push(text("L", 15.0, 5.0, 21.0, 7.0));

    // h, from the ceiling down to the circle's plane.
    s.push(line(&[[57.0, 3.5], [64.0, 3.5]]));
    s.push(line(&[[57.0, 38.5], [64.0, 38.5]]));
    s.extend(arrow([60.5, 13.5], [60.5, 3.9]));
    s.extend(arrow([60.5, 27.5], [60.5, 38.1]));
    s.push(text("h", 57.5, 6.0, 24.0, 7.0));
    Diagram::new("ConicalPendulum", 32, 3, include_bytes!("../../../../firmware/images/FBE0D-packed.png"), s)
}

/// The point at `angle` degrees on an ellipse, as `arc` measures it.
fn ellipse_point(cx: f32, cy: f32, rx: f32, ry: f32, angle: f32) -> [f32; 2] {
    let a = angle.to_radians();
    [cx + rx * a.cos(), cy + ry * a.sin()]
}

/// A dotted line along the points: dots 1.2 pixels long, 2.4 apart.
fn dotted(points: Vec<[f32; 2]>) -> Vec<Shape> {
    let (dash, period) = (1.2, 2.4);
    let mut shapes = Vec::new();
    let mut run: Vec<[f32; 2]> = Vec::new();
    let mut at = 0.0f32;
    for pair in points.windows(2) {
        let (a, b) = (pair[0], pair[1]);
        let len = (b[0] - a[0]).hypot(b[1] - a[1]);
        let steps = (len * 8.0).ceil().max(1.0) as usize;
        for i in 0..steps {
            let t = i as f32 / steps as f32;
            let p = [a[0] + (b[0] - a[0]) * t, a[1] + (b[1] - a[1]) * t];
            if at % period < dash {
                run.push(p);
            } else if run.len() > 1 {
                shapes.push(line(&run));
                run.clear();
            } else {
                run.clear();
            }
            at += len / steps as f32;
        }
    }
    if run.len() > 1 {
        shapes.push(line(&run));
    }
    shapes
}

/// A disc on a wire of length L, twisting back and forth: the wire's G and J,
/// the disc's I.
fn torsional_pendulum() -> Diagram {
    let mut s = ceiling(11.0, 24.0, 3.5);
    s.push(rect(16.0, 3.5, 19.0, 29.0));
    s.push(line(&[[12.0, 9.5], [16.0, 9.5]]));
    s.push(line(&[[12.0, 17.5], [16.0, 17.5]]));
    s.push(text("G", 5.5, 5.0, 12.0, 5.0));
    s.push(text("J", 6.0, 4.5, 19.0, 5.0));

    // The disc: its top face, its rim, and lines down the rim.
    let (cx, top, depth, rx, ry) = (17.5, 29.5, 4.0, 11.0, 6.0);
    s.push(ellipse(cx, top, rx, ry));
    s.push(line(&[[cx - rx, top], [cx - rx, top + depth]]));
    s.push(line(&[[cx + rx, top], [cx + rx, top + depth]]));
    s.push(arc(cx, top + depth, rx, ry, 0.0, 180.0));
    for x in [8.5, 10.5, 13.5, 17.5, 21.5, 24.5, 26.5] {
        let y = top + ry * (1.0 - ((x - cx) / rx).powi(2)).sqrt();
        s.push(line(&[[x, y + 0.3], [x, y + depth - 0.3]]));
    }
    s.push(text("I", 10.5, 4.0, 32.0, 5.0));

    // The way it turns.
    s.push(arc(cx, 33.5, 15.0, 9.5, 92.0, 40.0));
    s.extend(arrow(ellipse_point(cx, 33.5, 15.0, 9.5, 40.0), [33.8, 36.9]));

    // L, from the ceiling to the disc.
    s.push(line(&[[31.0, 4.5], [38.0, 4.5]]));
    s.push(line(&[[31.0, 28.5], [38.0, 28.5]]));
    s.extend(arrow([34.5, 9.5], [34.5, 4.9]));
    s.extend(arrow([34.5, 23.0], [34.5, 28.1]));
    s.push(text("L", 31.5, 6.0, 20.0, 7.0));
    Diagram::new("TorsionalPendulum", 48, 6, include_bytes!("../../../../firmware/images/FC0D4-packed.png"), s)
}

pub(super) fn all() -> Vec<Diagram> {
    vec![spring1(), spring2(), spring3(), simple_pendulum(), conical_pendulum(), torsional_pendulum()]
}
