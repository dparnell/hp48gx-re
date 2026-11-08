//! Plane Geometry.

use super::*;

/// A letter with a subscript: `main` in the box `x`..`x + w` standing on
/// `baseline`, capitals `cap` tall, and `sub` smaller and lower in its box.
fn subscripted((main, x, w): (&'static str, f32, f32), (sub, sx, sw): (&'static str, f32, f32), baseline: f32, cap: f32) -> [Shape; 2] {
    [text(main, x, w, baseline, cap), text(sub, sx, sw, baseline + 0.5, cap * 0.75)]
}

/// The axes of a section through its centroid `[cx, cy]`: an arrow up to
/// `top` labelled y in the box `yx`..`yx + 6` above, and one right to
/// `right`, labelled x in the box `xx`..`xx + 6` beside it.
fn axes([cx, cy]: [f32; 2], left: f32, bottom: f32, top: f32, right: f32, yx: f32, xx: f32) -> Vec<Shape> {
    let mut s = arrow([cx, bottom], [cx, top]);
    s.extend(arrow([left, cy], [right, cy]));
    s.push(text("y", yx, 6.0, 4.6, 6.0));
    s.push(text("x", xx, 6.0, cy + 2.5, 7.0));
    s
}

/// The parallel axis at height `y`, from the y axis at `x0` to `x1`, and its
/// distance d from the x axis at `cy`, measured at `dx` by arrows that come
/// in from outside (`inward`) or point out from between the lines, with the
/// label d standing on `label`.
fn parallel_axis(x0: f32, x1: f32, y: f32, cy: f32, dx: f32, inward: bool, label: f32) -> Vec<Shape> {
    let mut s = vec![line(&[[x0, y], [x1, y]])];
    if inward {
        s.extend(arrow([dx, y - 6.5], [dx, y - 0.5]));
        s.extend(arrow([dx, cy + 5.5], [dx, cy + 0.5]));
    } else {
        s.extend(arrow([dx, y + 5.5], [dx, y + 0.5]));
        s.extend(arrow([dx, cy - 5.5], [dx, cy - 0.5]));
    }
    s.push(text("d", dx - 3.0, 6.0, label, 7.0));
    s
}

/// A circle of radius r about the axes, with the parallel axis at distance d.
fn circle_section() -> Diagram {
    let (cx, cy) = (24.5, 26.5);
    let mut s = axes([cx, cy], cx, cy, 0.0, 56.0, 14.0, 57.5);
    s.push(circle(cx, cy, 19.0));
    // The radius, from the circle to the centre.
    s.extend(arrow([11.0, cy], [5.6, cy]));
    s.push(line(&[[19.5, cy], [cx, cy]]));
    s.push(text("r", 12.5, 6.0, 29.0, 7.0));
    s.extend(parallel_axis(cx, 55.5, 12.5, cy, 48.5, true, 23.0));
    Diagram::new("Circle", 40, 5, include_bytes!("../../../../firmware/images/FC290-packed.png"), s)
}

/// An ellipse with semi-axes b and h about the axes, with the parallel axis
/// at distance d.
fn ellipse_section() -> Diagram {
    let (cx, cy) = (41.5, 28.5);
    let mut s = axes([cx, cy], 2.5, 49.5, 1.0, 81.0, 31.0, 82.5);
    s.push(ellipse(cx, cy, 32.0, 21.0));
    // h, from the centre line up to the ellipse.
    s.extend(arrow([34.5, 13.0], [34.5, 8.3]));
    s.extend(arrow([34.5, 23.0], [34.5, cy - 0.5]));
    s.push(text("h", 31.5, 6.0, 21.0, 7.0));
    // b, from the y axis out to the ellipse.
    s.extend(arrow([51.5, 39.5], [42.0, 39.5]));
    s.extend(arrow([63.5, 39.5], [73.5, 39.5]));
    s.push(line(&[[73.5, 36.0], [73.5, 43.0]]));
    s.push(text("b", 54.5, 6.0, 43.0, 7.0));
    s.extend(parallel_axis(cx, 80.5, 15.5, cy, 47.5, true, 25.0));
    Diagram::new("Ellipse", 24, 2, include_bytes!("../../../../firmware/images/FC4FB-packed.png"), s)
}

/// A rectangle b wide and h tall about the axes, with the parallel axis at
/// distance d.
fn rectangle() -> Diagram {
    let (cx, cy) = (17.5, 25.5);
    let mut s = axes([cx, cy], 16.5, cy, 0.0, 41.0, 7.0, 42.5);
    s.push(closed(&[[7.5, 9.5], [27.5, 9.5], [27.5, 44.5], [7.5, 44.5]]));
    // h, to the left.
    s.push(line(&[[0.0, 9.5], [5.0, 9.5]]));
    s.push(line(&[[0.0, 44.5], [5.0, 44.5]]));
    s.extend(arrow([2.5, 22.0], [2.5, 10.0]));
    s.extend(arrow([2.5, 34.0], [2.5, 44.0]));
    s.push(text("h", -0.5, 6.0, 31.0, 7.0));
    // b, across the rectangle.
    s.extend(arrow([12.5, 38.5], [8.0, 38.5]));
    s.extend(arrow([22.5, 38.5], [27.0, 38.5]));
    s.push(text("b", 14.5, 6.0, 42.0, 7.0));
    s.extend(parallel_axis(cx, 40.5, 13.5, cy, 33.5, true, 23.0));
    Diagram::new("Rectangle", 48, 5, include_bytes!("../../../../firmware/images/FC857-packed.png"), s)
}

/// A regular hexagon (n=6) with sides L: the distances rv from the centre
/// to a vertex and rs to a side, its interior angle θ and the angle β
/// between the radii to two vertices.
fn regular_polygon() -> Diagram {
    let (cx, cy) = (33.5, 22.5);
    let mut s = vec![closed(&[[cx, 1.5], [53.5, 11.0], [53.5, 33.5], [cx, 44.5], [13.5, 33.5], [13.5, 11.0]])];
    // rv, from the centre up to the top vertex.
    s.push(line(&[[2.0, 0.5], [cx, 0.5]]));
    s.push(line(&[[2.0, cy], [cx, cy]]));
    s.push(line(&[[cx, 1.5], [cx, 33.5]]));
    s.extend(arrow([5.5, 6.0], [5.5, 1.0]));
    s.extend(arrow([5.5, 17.0], [5.5, 22.0]));
    s.extend(subscripted(("r", -0.5, 5.5), ("v", 4.5, 5.5), 14.0, 7.0));
    // β, between the radii to two vertices.
    s.push(line(&[[cx, cy], [53.5, 11.0]]));
    s.push(text("β", 35.0, 5.5, 16.6, 6.5));
    // rs, from the left side to the centre.
    s.extend(arrow([8.0, 30.5], [13.5, 30.5]));
    s.extend(arrow([38.5, 30.5], [cx, 30.5]));
    s.extend(subscripted(("r", 17.5, 5.5), ("s", 22.5, 5.5), 33.0, 7.0));
    // L, the right side.
    s.push(line(&[[57.0, 11.5], [64.0, 11.5]]));
    s.push(line(&[[57.0, 33.5], [64.0, 33.5]]));
    s.extend(arrow([60.5, 17.0], [60.5, 12.0]));
    s.extend(arrow([60.5, 28.0], [60.5, 33.0]));
    s.push(text("L", 57.5, 6.0, 26.0, 7.0));
    s.push(text("θ", 46.5, 5.0, 34.0, 7.0));
    s.push(text("n=6", -0.5, 18.0, 45.0, 7.0));
    Diagram::new("RegularPolygon", 32, 5, include_bytes!("../../../../firmware/images/FCA75-packed.png"), s)
}

/// A line that hatching stops short of: at x = `at` if `vertical`, else at
/// y = `at`, from `from` to `to` along it.
struct Break {
    vertical: bool,
    at: f32,
    from: f32,
    to: f32,
}

/// Hatching across the ring between circles of radii `inner` and `outer`
/// about (`cx`, `cy`): lines going down to the right, where x - y is
/// `first` plus a multiple of `step`. Each stroke ends a little inside the
/// ring, so that it doesn't run over the circles, and stops short of the
/// lines in `breaks`.
fn ring_hatching(cx: f32, cy: f32, inner: f32, outer: f32, first: f32, step: f32, breaks: &[Break]) -> Vec<Shape> {
    // The room left between a stroke's end and a circle, and between a
    // stroke and a line it breaks for (along the stroke's height).
    const MARGIN: f32 = 0.6;
    const GAP: f32 = 1.2;
    // Along the line x = y + c, with u = y - cy, a circle of radius r is
    // crossed where 2u² + 2ku + k² - r² = 0, k = c - (cx - cy).
    let cross = |k: f32, r: f32| {
        let d = 2.0 * r * r - k * k;
        (d > 0.0).then(|| ((-k - d.sqrt()) / 2.0, (-k + d.sqrt()) / 2.0))
    };
    let (inner, outer) = (inner + MARGIN, outer - MARGIN);
    let mut shapes = Vec::new();
    let mut c = first;
    while c - (cx - cy) > -outer * std::f32::consts::SQRT_2 {
        c -= step;
    }
    while c - (cx - cy) < outer * std::f32::consts::SQRT_2 {
        let k = c - (cx - cy);
        if let Some((u0, u1)) = cross(k, outer) {
            let mut pieces = match cross(k, inner) {
                Some((v0, v1)) => vec![(u0, v0), (v1, u1)],
                None => vec![(u0, u1)],
            };
            for b in breaks {
                // Where the stroke meets the line: its u, and how far along
                // the line that is.
                let (u, along) = if b.vertical { (b.at - c - cy, b.at - c) } else { (b.at - cy, b.at + c) };
                if (b.from..=b.to).contains(&along) {
                    pieces = pieces.into_iter().flat_map(|(p, q)| [(p, q.min(u - GAP)), (p.max(u + GAP), q)]).collect();
                }
            }
            for (p, q) in pieces.into_iter().filter(|(p, q)| q - p > 0.6) {
                shapes.push(line(&[[cy + p + c, cy + p], [cy + q + c, cy + q]]));
            }
        }
        c += step;
    }
    shapes
}

/// A ring with radii ri and ro about the axes, hatched, with the parallel
/// axis at distance d.
fn circular_ring() -> Diagram {
    let (cx, cy) = (33.5, 22.5);
    // The hatching stops short of the axes and of the lines of d and ri.
    let breaks = [
        Break { vertical: false, at: cy, from: 0.0, to: 72.0 },
        Break { vertical: true, at: cx, from: 0.0, to: 47.0 },
        Break { vertical: false, at: 9.5, from: cx, to: 64.5 },
        Break { vertical: false, at: 33.5, from: 4.0, to: cx },
    ];
    let mut s = ring_hatching(cx, cy, 11.0, 16.0, 1.0, 3.0, &breaks);
    s.extend(axes([cx, cy], 4.0, 47.0, 0.0, 65.0, 23.0, 66.5));
    s.push(circle(cx, cy, 16.0));
    s.push(circle(cx, cy, 11.0));
    // ri, from the x axis down to the inner circle.
    s.push(line(&[[4.0, 33.5], [cx, 33.5]]));
    s.extend(arrow([9.5, 17.0], [9.5, 22.0]));
    s.extend(arrow([9.5, 38.0], [9.5, 34.0]));
    s.extend(subscripted(("r", 3.5, 5.5), ("i", 9.0, 4.5), 31.0, 7.0));
    // ro, from the y axis out to the outer circle.
    s.push(line(&[[49.5, 23.0], [49.5, 47.0]]));
    s.extend(arrow([29.0, 44.5], [cx, 44.5]));
    s.extend(arrow([55.5, 44.5], [49.5, 44.5]));
    s.extend(subscripted(("r", 35.5, 5.5), ("o", 40.5, 5.5), 47.0, 7.0));
    s.extend(parallel_axis(cx, 64.5, 9.5, cy, 55.5, true, 19.0));
    Diagram::new("CircularRing", 32, 4, include_bytes!("../../../../firmware/images/FCD2D-packed.png"), s)
}

/// A triangle with base b, height h and its top v along from the left
/// corner, about axes through its centroid, with the parallel axis at
/// distance d.
fn triangle() -> Diagram {
    let (cx, cy) = (28.5, 31.5);
    let mut s = axes([cx, cy], 27.5, 32.5, 0.0, 71.0, 18.0, 74.5);
    s.push(closed(&[[10.5, 38.5], [22.5, 14.5], [53.5, 38.5]]));
    // v, from the left corner along to the top.
    s.push(line(&[[10.5, 8.0], [10.5, 13.0]]));
    s.push(line(&[[22.5, 8.0], [22.5, 13.0]]));
    s.extend(arrow([6.0, 10.5], [10.5, 10.5]));
    s.extend(arrow([27.0, 10.5], [22.5, 10.5]));
    s.push(text("v", 13.5, 6.0, 13.0, 7.0));
    // h, to the left.
    s.push(line(&[[0.0, 14.5], [7.0, 14.5]]));
    s.push(line(&[[0.0, 38.5], [7.0, 38.5]]));
    s.extend(arrow([3.5, 20.0], [3.5, 15.0]));
    s.extend(arrow([3.5, 33.0], [3.5, 38.0]));
    s.push(text("h", 0.5, 6.0, 30.0, 7.0));
    // b, under the base.
    s.push(line(&[[10.5, 42.0], [10.5, 49.0]]));
    s.push(line(&[[53.5, 42.0], [53.5, 49.0]]));
    s.extend(arrow([25.5, 45.5], [11.0, 45.5]));
    s.extend(arrow([37.5, 45.5], [53.0, 45.5]));
    s.push(text("b", 28.5, 6.0, 49.0, 7.0));
    s.extend(parallel_axis(cx, 70.5, 9.5, cy, 60.5, false, 24.0));
    Diagram::new("Triangle", 32, 4, include_bytes!("../../../../firmware/images/FD013-packed.png"), s)
}

pub(super) fn all() -> Vec<Diagram> {
    vec![circle_section(), ellipse_section(), rectangle(), regular_polygon(), circular_ring(), triangle()]
}
