//! Magnetism.

use super::*;

/// A label with a subscript, as `r` and `w` make rw: `main` centred in `mx`..`mx + mw`,
/// and the subscript, smaller and lower, right after it. The bitmap writes
/// the subscript full size in `sx`..`sx + sw`, so an empty box covers it.
#[allow(clippy::too_many_arguments)]
fn sub_label(s: &mut Vec<Shape>, main: &'static str, mx: f32, mw: f32, sub: &'static str, sx: f32, sw: f32, baseline: f32, cap: f32) {
    let small = cap * 0.7;
    let at = mx + (mw + width(main, cap)) / 2.0 + cap * 0.05;
    s.push(text(main, mx, mw, baseline, cap));
    s.push(text(sub, at, width(sub, small) * 1.1, baseline + cap * 0.15, small));
    s.push(text("", sx, sw, baseline, cap));
}

/// About how wide DejaVu Sans sets `text` with capitals `cap` tall.
fn width(text: &str, cap: f32) -> f32 {
    let em = cap / 0.729;
    text.chars().map(|c| em * if "Iil".contains(c) { 0.28 } else if c == 'r' { 0.41 } else { 0.62 }).sum()
}

/// Corner-cutting: a smooth line near the points, through both ends.
fn smooth(points: &[[f32; 2]], rounds: usize) -> Vec<[f32; 2]> {
    let mut p = points.to_vec();
    for _ in 0..rounds {
        let mut q = vec![p[0]];
        for w in p.windows(2) {
            let at = |t: f32| [w[0][0] + (w[1][0] - w[0][0]) * t, w[0][1] + (w[1][1] - w[0][1]) * t];
            q.extend([at(0.25), at(0.75)]);
        }
        q.push(p[p.len() - 1]);
        p = q;
    }
    p
}

/// A point on the circle around (`cx`, `cy`) of radius `r`, at `angle`
/// degrees (0 right, 90 down).
fn on_circle(cx: f32, cy: f32, r: f32, angle: f32) -> [f32; 2] {
    let a = angle.to_radians();
    [cx + r * a.cos(), cy + r * a.sin()]
}

/// The field B around a wire of radius rw carrying a current I out of the
/// page, at a distance r from its axis.
fn straight_wire() -> Diagram {
    let (cx, cy) = (25.5, 16.5);
    // The wire, in section: a heavy ring.
    let mut s: Vec<Shape> = [-0.55, 0.0, 0.55].iter().map(|d| ellipse(cx, 17.0, 10.5 + d, 10.0 + d)).collect();
    s.push(dot(cx, cy, 0.8));

    // Its radius rw.
    s.push(line(&[[0.5, 5.5], [29.0, 5.5]]));
    s.push(line(&[[1.0, 16.5], [cx, cy]]));
    s.extend(arrow([4.5, 0.0], [4.5, 5.2]));
    s.extend(arrow([4.5, 22.0], [4.5, 16.8]));
    sub_label(&mut s, "r", 0.5, 5.0, "w", 6.5, 6.0, 14.0, 7.0);

    // The distance r, to a field line.
    s.push(line(&[[cx, cy], [16.3, 25.7]]));
    s.extend(arrow([9.0, 33.0], [5.0, 37.0]));
    s.push(text("r", 9.5, 6.0, 32.0, 7.0));
    s.push(Shape::Stroke(Polyline {
        points: smooth(&[[1.5, 30.0], [1.7, 32.5], [2.7, 34.5], [3.7, 36.4], [5.2, 38.2], [7.2, 39.6], [10.0, 40.6]], 2),
        closed: false,
    }));

    // A field line, and its direction.
    s.push(line(&(0..=34).map(|i| on_circle(25.0, 16.5, 22.6, 39.0 - 2.0 * i as f32)).collect::<Vec<_>>()));
    s.extend(arrow(on_circle(25.0, 16.5, 22.6, -30.0), on_circle(25.0, 16.5, 22.3, -38.0)));
    s.push(text("B", 50.5, 6.0, 20.0, 7.0));

    // The current, out of the page.
    s.push(line(&[[cx, 21.0], [cx, 32.0]]));
    s.push(text("I", 16.5, 5.0, 41.0, 7.0));
    s.push(text(":", 22.0, 3.5, 41.0, 7.0));
    s.push(circle(31.5, 37.5, 3.0));
    s.push(dot(31.5, 37.5, 0.8));
    Diagram::new("StraightWire", 40, 10, include_bytes!("../../../../firmware/images/F9596-packed.png"), s)
}

/// Two parallel wires a distance d apart, carrying currents Ia and Ib, pulled
/// together by the force Fba.
fn force_between_wires() -> Diagram {
    let mut s = vec![rect(33.0, 0.0, 35.0, 35.0), rect(48.0, 0.0, 50.0, 35.0)];
    s.extend(arrow([41.5, 10.5], [35.2, 10.5]));
    s.extend(arrow([41.5, 10.5], [47.8, 10.5]));
    s.push(text("d", 38.5, 6.0, 7.0, 7.0));

    s.extend(arrow([23.0, 17.5], [33.0, 17.5]));
    s.extend(arrow([60.0, 17.5], [50.0, 17.5]));
    sub_label(&mut s, "F", 2.5, 6.0, "ba", 8.5, 11.5, 20.0, 7.0);
    sub_label(&mut s, "F", 62.5, 6.0, "ba", 68.5, 11.5, 21.0, 7.0);

    s.extend(arrow([34.5, 44.0], [34.5, 38.0]));
    s.extend(arrow([48.5, 44.0], [48.5, 38.0]));
    sub_label(&mut s, "I", 18.5, 4.0, "a", 23.5, 6.0, 43.0, 7.0);
    sub_label(&mut s, "I", 54.5, 4.0, "b", 58.5, 6.0, 43.0, 7.0);
    Diagram::new("ForceBetweenWires", 24, 6, include_bytes!("../../../../firmware/images/F97B4-packed.png"), s)
}

/// A solenoid with n turns per unit length round a core of relative
/// permeability μr, carrying the current I, and the field B along its axis.
fn b_field_in_solenoid() -> Diagram {
    let mut s = vec![closed(&[[17.5, 12.5], [81.5, 12.5], [81.5, 28.5], [17.5, 28.5]])];
    // The turns: in front of the core, then over its top and behind it.
    for k in 0..10 {
        let x = 21.5 + 6.0 * k as f32;
        s.push(line(&[[x, 12.5], [x, 28.5]]));
        let mut over = vec![[x, 12.5]];
        over.extend(arc_points(x + 1.5, 10.0, 1.5, 1.5, 180.0, 360.0));
        over.push([x + 3.0, 12.5]);
        s.push(line(&over));
    }
    // Under the core, from behind to the next turn in front.
    for k in 0..9 {
        let x = 24.5 + 6.0 * k as f32;
        let mut under = vec![[x, 28.5]];
        under.extend(arc_points(x + 1.5, 31.0, 1.5, 1.5, 180.0, 0.0));
        under.push([x + 3.0, 28.5]);
        s.push(line(&under));
    }
    // The leads, and the current.
    s.push(line(&[[21.5, 28.5], [21.5, 32.5], [15.0, 32.5]]));
    s.push(line(&[[78.5, 28.5], [78.5, 36.5], [15.0, 36.5]]));
    s.extend(arrow([6.0, 36.5], [11.8, 36.5]));
    s.push(text("I", -0.5, 4.0, 40.0, 7.0));
    sub_label(&mut s, "μ", 2.5, 6.0, "r", 8.5, 6.0, 23.0, 7.0);

    // The turns per unit length.
    s.push(line(&[[36.5, 0.0], [36.5, 5.0]]));
    s.push(line(&[[60.5, 0.0], [60.5, 5.0]]));
    s.extend(arrow([42.9, 2.5], [36.8, 2.5]));
    s.extend(arrow([54.0, 2.5], [60.2, 2.5]));
    s.push(text("n", 45.5, 6.0, 5.0, 7.0));

    // The field.
    s.extend(arrow([85.0, 20.5], [93.2, 20.5]));
    s.push(text("B", 95.5, 6.0, 24.0, 7.0));
    Diagram::new("BFieldInSolenoid", 16, 9, include_bytes!("../../../../firmware/images/F9A04-packed.png"), s)
}

/// A circle smooth at any size, as a closed line.
fn round(cx: f32, cy: f32, r: f32) -> Shape {
    let points = (0..120).map(|i| on_circle(cx, cy, r, i as f32 * 3.0)).collect();
    Shape::Stroke(Polyline { points, closed: true })
}

/// A wrap of a turn round the edge of a toroid's core: a half circle on the
/// circle of radius `r` round (`cx`, `cy`), from angle `a0` to `a1`, bulging
/// out of the core (`outwards`) or into its hole.
fn wrap(cx: f32, cy: f32, r: f32, a0: f32, a1: f32, outwards: bool) -> Shape {
    let m = (a0 + a1) / 2.0;
    let half_angle = ((a1 - a0) / 2.0).to_radians();
    let half = r * half_angle.sin().abs();
    let [px, py] = on_circle(cx, cy, r * half_angle.cos(), m);
    let turn = (a1 - a0).signum();
    let end = if outwards { m + 90.0 * turn } else { m - 270.0 * turn };
    arc(px, py, half, half, m - 90.0 * turn, end)
}

/// A toroid round a core of relative permeability μr, its inner radius ri
/// and outer radius ro, with eleven turns carrying the current I, and the
/// field B going round inside it.
fn b_field_in_toroid() -> Diagram {
    let (cx, cy, inner, outer) = (40.4, 23.5, 12.9, 19.9);
    let at = |r: f32, angle: f32| on_circle(cx, cy, r, angle);
    let mut s = vec![round(cx, cy, outer), round(cx, cy, inner)];
    // Each turn crosses the face of the core, from the angle at its inner
    // edge to the angle at its outer edge, and some show where they wrap
    // round the outer and the inner edge.
    type Wrap = Option<(f32, f32)>;
    let turns: [(f32, f32, Wrap, Wrap); 11] = [
        (351.0, 354.3, Some((354.3, 346.0)), None),
        (26.4, 26.4, Some((26.4, 20.0)), None),
        (57.0, 59.0, Some((59.0, 50.0)), None),
        (85.0, 86.8, Some((90.0, 81.0)), Some((94.0, 84.0))),
        (116.0, 120.0, Some((120.0, 110.0)), None),
        (156.0, 155.0, Some((155.0, 145.0)), Some((166.0, 150.0))),
        (188.8, 191.6, None, None),
        (225.0, 223.0, Some((227.0, 212.0)), Some((225.0, 238.0))),
        (258.0, 258.0, Some((256.0, 245.0)), Some((261.0, 275.0))),
        (292.0, 291.5, Some((293.0, 278.0)), Some((293.0, 303.0))),
        (321.0, 321.5, Some((321.5, 311.0)), None),
    ];
    for (a_in, a_out, round_out, round_in) in turns {
        s.push(line(&[at(inner, a_in), at(outer, a_out)]));
        if let Some((a0, a1)) = round_out {
            s.push(wrap(cx, cy, outer, a0, a1, true));
        }
        if let Some((a0, a1)) = round_in {
            s.push(wrap(cx, cy, inner, a0, a1, false));
        }
    }
    s.push(line(&[[25.5, 32.5], [29.5, 36.5]]));

    // The leads and the current.
    s.push(line(&[[15.0, 19.5], [21.0, 19.5]]));
    s.push(line(&[[15.0, 27.5], [20.8, 27.5]]));
    s.extend(arrow([7.0, 19.5], [13.2, 19.5]));
    s.push(text("I", 1.5, 4.0, 23.0, 7.0));
    // The core.
    s.push(line(&[[15.0, 4.5], [27.8, 4.5], [32.5, 9.5]]));
    sub_label(&mut s, "μ", 0.5, 6.0, "r", 6.5, 6.0, 7.0, 7.0);
    // The field in it.
    s.extend(arrow([23.5, 28.0], [23.5, 21.6]));
    s.extend(arrow([20.3, 41.7], [27.0, 37.5]));
    s.push(text("B", 12.5, 6.0, 47.0, 7.0));

    // The radii, from the centre.
    s.push(line(&[[34.0, 3.5], [78.0, 3.5]]));
    s.extend(arrow([78.0, 23.5], [39.2, 23.5]));
    s.push(line(&[[36.0, 36.5], [78.0, 36.5]]));
    s.extend(arrow([72.5, 9.0], [72.5, 3.8]));
    s.extend(arrow([72.5, 17.5], [72.5, 23.2]));
    s.extend(arrow([72.5, 42.0], [72.5, 36.8]));
    sub_label(&mut s, "r", 66.5, 5.0, "o", 72.5, 6.0, 16.0, 7.0);
    sub_label(&mut s, "r", 66.5, 5.0, "i", 73.0, 4.5, 33.0, 7.0);
    Diagram::new("BFieldInToroid", 24, 5, include_bytes!("../../../../firmware/images/F9CEC-packed.png"), s)
}

pub(super) fn all() -> Vec<Diagram> {
    vec![straight_wire(), force_between_wires(), b_field_in_solenoid(), b_field_in_toroid()]
}
