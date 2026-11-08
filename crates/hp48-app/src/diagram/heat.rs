//! Heat Transfer.

use super::*;

/// Hatching in the box `x0`..`x1`, `y0`..`y1`, where `inside` holds. The
/// lines run through the centres of the pixels whose x + y (`rising`, "/")
/// or x - y ("\") is `phase` modulo `every`, as the bitmap's do.
#[allow(clippy::too_many_arguments)]
fn hatch(x0: f32, y0: f32, x1: f32, y1: f32, every: i32, phase: i32, rising: bool, inside: &dyn Fn(f32, f32) -> bool) -> Vec<Shape> {
    let mut shapes = Vec::new();
    let (lo, hi) = if rising { ((x0 + y0) as i32 - 2, (x1 + y1) as i32 + 2) } else { ((x0 - y1) as i32 - 2, (x1 - y0) as i32 + 2) };
    let steps = ((x1 - x0) / 0.05).ceil() as usize;
    for s in (lo..=hi).filter(|s| (s - phase).rem_euclid(every) == 0) {
        // Pixel (px, py) has its centre at (px + 0.5, py + 0.5).
        let y_at = |x: f32| if rising { s as f32 + 1.0 - x } else { x - s as f32 };
        let mut run: Option<([f32; 2], [f32; 2])> = None;
        for i in 0..=steps + 1 {
            let x = x0 + (x1 - x0) * i as f32 / steps as f32;
            let y = y_at(x);
            if i <= steps && (y0..=y1).contains(&y) && inside(x, y) {
                run = Some((run.map_or([x, y], |r| r.0), [x, y]));
            } else if let Some((a, b)) = run.take() {
                if (b[0] - a[0]).hypot(b[1] - a[1]) > 1.0 {
                    shapes.push(line(&[a, b]));
                }
            }
        }
    }
    shapes
}

/// Whether (`x`, `y`) is outside the box `x0`..`x1`, `y0`..`y1`: hatching
/// leaves room for a label.
fn outside(x: f32, y: f32, x0: f32, y0: f32, x1: f32, y1: f32) -> bool {
    !((x0..x1).contains(&x) && (y0..y1).contains(&y))
}

/// A label with a subscript, as `T` and `h` make Th: `main` centred in `mx`..`mx + mw`,
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

/// A bar of length L, and dashed, as long as it grows by δ when heated by ΔT.
fn thermal_expansion() -> Diagram {
    let mut s = vec![closed(&[[4.5, 0.5], [46.5, 0.5], [46.5, 12.5], [4.5, 12.5]])];
    // The bar grown, dashed.
    s.push(line(&[[54.2, 0.5], [55.5, 0.5], [55.5, 2.8]]));
    s.push(line(&[[55.5, 10.2], [55.5, 12.5], [54.2, 12.5]]));
    for x in [49.0, 52.0] {
        s.push(line(&[[x - 0.8, 0.5], [x + 0.8, 0.5]]));
        s.push(line(&[[x - 0.8, 12.5], [x + 0.8, 12.5]]));
    }
    for y in [5.0, 8.0] {
        s.push(line(&[[55.5, y - 0.8], [55.5, y + 0.8]]));
    }
    s.push(text("ΔT", 18.5, 12.0, 10.0, 7.0));

    // The lengths.
    for x in [4.5, 46.5, 55.5] {
        s.push(line(&[[x, 16.0], [x, 23.0]]));
    }
    s.extend(arrow([20.0, 19.5], [4.8, 19.5]));
    s.extend(arrow([31.0, 19.5], [46.2, 19.5]));
    s.extend(arrow([62.0, 19.5], [55.8, 19.5]));
    s.push(text("L", 22.5, 6.0, 23.0, 7.0));
    s.push(text("δ", 48.5, 6.0, 23.0, 7.0));
    Diagram::new("ThermalExpansion", 40, 21, include_bytes!("../../../../firmware/images/F8A4A-packed.png"), s)
}

/// Heat q flowing through a slab of thickness L and conductivity k, from
/// the side at Th to the side at Tc.
fn conduction() -> Diagram {
    let mut s = Vec::new();
    for x in [18.5, 33.5] {
        s.push(line(&[[x, 0.0], [x, 7.0]]));
        s.push(line(&[[x, 10.0], [x, 37.0]]));
    }
    s.extend(hatch(18.5, 10.0, 33.5, 37.0, 3, 0, true, &|x, y| outside(x, y, 22.0, 18.0, 30.0, 31.0)));
    s.push(text("k", 23.5, 5.0, 28.0, 7.0));

    // The thickness.
    s.extend(arrow([12.0, 3.5], [18.2, 3.5]));
    s.extend(arrow([39.0, 3.5], [33.8, 3.5]));
    s.push(text("L", 23.5, 6.0, 7.0, 7.0));

    // The heat flow.
    s.push(line(&[[4.0, 23.5], [18.5, 23.5]]));
    s.extend(arrow([33.5, 23.5], [48.2, 23.5]));
    s.push(text("q", 50.5, 6.0, 25.6, 5.5));

    sub_label(&mut s, "T", 3.5, 6.0, "h", 9.5, 6.0, 36.0, 7.0);
    sub_label(&mut s, "T", 36.5, 6.0, "c", 42.5, 6.0, 36.0, 7.0);
    Diagram::new("Conduction", 40, 7, include_bytes!("../../../../firmware/images/F8B99-packed.png"), s)
}

/// Heat q leaving a wall at Th into a fluid at Tc, with the heat transfer
/// coefficient h.
fn convection() -> Diagram {
    let mut s = hatch(0.0, 0.0, 9.5, 25.0, 3, 0, true, &|_, _| true);
    s.push(line(&[[9.5, 0.0], [9.5, 25.0]]));
    s.extend(arrow([9.5, 12.5], [28.2, 12.5]));
    s.push(text("h", 22.5, 6.0, 7.0, 7.0));
    s.push(text("q", 30.5, 6.0, 14.6, 5.5));
    sub_label(&mut s, "T", 16.5, 6.0, "c", 22.5, 6.0, 25.0, 7.0);
    sub_label(&mut s, "T", 3.5, 6.0, "h", 9.5, 6.0, 34.2, 7.0);
    Diagram::new("Convection", 56, 13, include_bytes!("../../../../firmware/images/F8D5B-packed.png"), s)
}

/// Heat q flowing from a fluid at Th through a wall of three layers (lengths
/// L1..L3, conductivities k1..k3) into a fluid at Tc, with heat transfer
/// coefficients h1 and h3 on the two faces.
fn conduction_convection() -> Diagram {
    let mut s = Vec::new();
    for x in [13.5, 30.5, 50.5, 67.5] {
        s.push(line(&[[x, 0.0], [x, 5.0]]));
        s.push(line(&[[x, 7.0], [x, 38.0]]));
    }
    s.extend(hatch(13.5, 7.0, 30.5, 38.0, 4, 3, true, &|x, y| outside(x, y, 16.0, 26.0, 28.0, 35.0)));
    s.extend(hatch(30.5, 7.0, 50.5, 38.0, 4, 1, false, &|x, y| outside(x, y, 34.0, 26.0, 45.8, 35.0)));
    s.extend(hatch(50.5, 7.0, 67.5, 38.0, 4, 3, true, &|x, y| outside(x, y, 54.0, 26.0, 64.8, 35.0)));
    sub_label(&mut s, "k", 17.5, 5.0, "1", 22.5, 3.5, 33.0, 5.0);
    sub_label(&mut s, "k", 35.5, 5.0, "2", 40.5, 3.5, 33.0, 5.0);
    sub_label(&mut s, "k", 54.5, 5.0, "3", 59.5, 3.5, 33.0, 5.0);

    // The layers' lengths.
    s.extend(arrow([8.0, 2.5], [13.2, 2.5]));
    s.extend(arrow([34.9, 2.5], [30.8, 2.5]));
    s.extend(arrow([46.0, 2.5], [50.2, 2.5]));
    s.extend(arrow([72.9, 2.5], [67.8, 2.5]));
    sub_label(&mut s, "L", 18.5, 4.0, "1", 22.5, 3.5, 5.0, 5.0);
    sub_label(&mut s, "L", 36.5, 4.0, "2", 40.5, 3.5, 5.0, 5.0);
    sub_label(&mut s, "L", 54.5, 4.0, "3", 58.5, 3.5, 5.0, 5.0);

    // The heat flow, and the two fluids.
    s.extend(arrow([0.0, 22.5], [81.2, 22.5]));
    s.push(text("q", 82.5, 6.0, 24.6, 5.5));
    sub_label(&mut s, "h", 0.5, 6.0, "1", 7.0, 4.5, 17.0, 7.0);
    sub_label(&mut s, "h", 69.5, 6.0, "3", 75.5, 6.0, 17.0, 7.0);
    sub_label(&mut s, "T", -0.5, 6.0, "h", 5.5, 6.0, 34.0, 7.0);
    sub_label(&mut s, "T", 69.5, 6.0, "c", 75.5, 6.0, 34.0, 7.0);
    Diagram::new("ConductionConvection", 24, 9, include_bytes!("../../../../firmware/images/F8EB4-packed.png"), s)
}

/// The spectrum eb of a black body against wavelength λ: the whole area under
/// it is σT⁴, the part between λ1 and λ2 is eb12.
fn black_body_radiation() -> Diagram {
    // The bitmap's curve, smoothed.
    let curve = smooth(
        &[
            [10.0, 42.0], [13.3, 41.2], [15.5, 40.0], [17.8, 38.1], [19.8, 36.0], [21.7, 33.7], [23.5, 31.4], [25.1, 29.2], [26.6, 26.9],
            [28.3, 24.6], [29.9, 22.3], [31.3, 20.0], [32.7, 17.6], [34.3, 15.2], [35.9, 12.7], [37.6, 10.3], [39.2, 8.0], [40.8, 5.6], [42.6, 3.4],
            [44.9, 1.8], [47.6, 1.0], [50.4, 1.3], [53.0, 2.5], [55.3, 4.3], [57.4, 6.4], [59.4, 8.6], [61.1, 10.9], [62.6, 13.3], [63.9, 15.7],
            [65.3, 18.2], [66.8, 20.6], [68.3, 22.9], [70.2, 25.1], [72.3, 27.3], [74.5, 29.3], [76.8, 31.1], [79.4, 32.6], [82.2, 33.8],
            [85.0, 34.9], [87.8, 36.0], [90.6, 37.1], [93.4, 37.9], [96.3, 38.7], [99.3, 39.4], [102.2, 40.1], [105.1, 40.8], [107.7, 41.3],
            [111.0, 42.0],
        ],
        2,
    );
    // The curve's height at x.
    let height = |x: f32| {
        let i = curve.windows(2).position(|w| x <= w[1][0]).unwrap_or(curve.len() - 2);
        let (a, b) = (curve[i], curve[i + 1]);
        a[1] + (b[1] - a[1]) * ((x - a[0]) / (b[0] - a[0])).clamp(0.0, 1.0)
    };
    let (l1, l2) = (20.5, 41.5);
    let under = |x: f32, y: f32| y > height(x) && outside(x, y, 22.5, 31.5, 40.5, 39.5) && outside(x, y, 45.6, 20.6, 62.2, 32.6);

    let mut s = vec![line(&[[9.5, 0.0], [9.5, 42.5], [111.0, 42.5]]), Shape::Stroke(Polyline { points: curve.clone(), closed: false })];
    s.extend(hatch(9.5, 0.0, l1, 42.5, 3, 0, false, &|x, y| under(x, y)));
    s.extend(hatch(l1, 0.0, l2, 42.5, 3, 1, true, &|x, y| under(x, y)));
    s.extend(hatch(l2, 0.0, 111.0, 42.5, 3, 0, false, &|x, y| under(x, y)));
    s.push(line(&[[l1, 30.0], [l1, 42.5]]));
    s.push(line(&[[l2, 0.0], [l2, 42.5]]));

    sub_label(&mut s, "E", 23.5, 4.0, "b12", 27.5, 12.0, 38.0, 5.0);
    s.push(text("σT", 47.5, 9.0, 31.0, 5.0));
    s.push(text("4", 56.5, 3.5, 28.0, 3.5));
    s.push(text("", 56.5, 3.5, 28.0, 5.0));
    sub_label(&mut s, "E", -0.5, 4.0, "b", 3.5, 4.0, 5.0, 5.0);
    sub_label(&mut s, "λ", 15.5, 5.0, "1", 20.5, 4.0, 50.0, 5.0);
    sub_label(&mut s, "λ", 36.5, 5.0, "2", 41.5, 4.0, 50.0, 5.0);
    s.push(text("λ", 106.5, 6.0, 50.0, 5.0));
    Diagram::new("BlackBodyRadiation", 8, 3, include_bytes!("../../../../firmware/images/F91A2-packed.png"), s)
}

pub(super) fn all() -> Vec<Diagram> {
    vec![thermal_expansion(), conduction(), convection(), conduction_convection(), black_body_radiation()]
}
