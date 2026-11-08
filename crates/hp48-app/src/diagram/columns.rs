//! Columns and Beams.

use super::*;

/// The pinned foot of a column: a triangle on hatched ground, under a pin.
fn pinned_foot(x: f32) -> Vec<Shape> {
    let mut shapes = vec![line(&[[x, 38.0], [x - 3.2, 41.5]]), line(&[[x, 38.0], [x + 3.2, 41.5]])];
    shapes.extend(wall([x - 3.5, 41.5], [x + 3.5, 41.5], -2.5, 3.0));
    shapes.extend(pin(x, 38.0));
    shapes
}

/// A column, as thick as the bitmap's.
fn column(x: f32, top: f32, bottom: f32) -> Shape {
    rect(x - 1.5, top, x + 1.5, bottom)
}

/// A label under the column at `x`.
fn k_label(text: &'static str, x: f32) -> Shape {
    Shape::Text { text, x: x - 9.0, w: 18.0, baseline: 52.0, cap: 5.0 }
}

/// Euler's four cases of a column under load, with their factors K.
fn elastic_buckling() -> Diagram {
    let (c1, c2, c3, c4) = (22.5, 44.5, 69.5, 91.5);
    let (top, foot) = (9.5, 37.5);
    let mut s = vec![Shape::Text { text: "Pcr", x: 0.0, w: 15.0, baseline: 7.0, cap: 7.0 }];

    // The load on each column.
    s.extend(arrow([c1, 0.2], [c1, 5.0]));
    s.extend(arrow([c2, 0.2], [c2, 5.0]));
    s.extend(arrow([c3, 2.2], [c3, 7.0]));
    s.extend(arrow([c4, 3.2], [c4, 8.0]));

    // The lines through the ends of the columns.
    for (from, to, y) in [(28.0, 40.0, top), (50.0, 67.0, top), (79.0, 87.0, top), (28.0, 40.0, foot), (48.0, 66.0, foot), (73.0, 86.0, foot)] {
        s.extend(dashes(from, to, y));
    }

    // K=.5: fixed at both ends.
    s.push(column(c1, top, foot));
    s.extend(wall([c1 - 3.5, top], [c1 + 3.5, top], -2.5, -3.0));
    s.extend(wall([c1 - 3.5, foot], [c1 + 3.5, foot], -2.5, 3.0));
    // K=.7: fixed at the top, pinned at the foot.
    s.push(column(c2, top, foot - 0.5));
    s.extend(wall([c2 - 3.5, top], [c2 + 3.5, top], -2.5, -3.0));
    s.extend(pinned_foot(c2));
    // K=1: pinned at both ends, the top held from the side.
    s.push(column(c3, top, foot - 0.5));
    s.push(line(&[[c3, top], [74.0, 6.5]]));
    s.push(line(&[[c3, top], [74.0, 12.5]]));
    s.extend(wall([74.5, 6.0], [74.5, 13.0], 3.0, -2.0));
    s.extend(pin(c3, top));
    s.extend(pinned_foot(c3));
    // K=2: fixed at the foot, free at the top.
    s.push(column(c4, top, foot));
    s.extend(wall([c4 - 3.5, foot], [c4 + 3.5, foot], -2.5, 3.0));

    // The column's length.
    s.push(line(&[[97.3, top], [103.7, top]]));
    s.push(line(&[[97.3, foot], [103.7, foot]]));
    s.extend(arrow([100.5, 16.0], [100.5, top + 0.4]));
    s.extend(arrow([100.5, 30.0], [100.5, foot - 0.4]));
    s.push(Shape::Text { text: "L", x: 97.0, w: 7.0, baseline: 27.0, cap: 7.0 });

    s.extend([k_label("K=.5", c1), k_label("K=.7", c2), k_label("K=1", c3), k_label("K=2", c4)]);
    Diagram::new("ElasticBuckling", 8, 2, include_bytes!("../../../../firmware/images/F50DC-packed.png"), s)
}

/// A short arrow of a distributed load, its small head ending at `tip`.
fn load_arrow(x: f32, top: f32, tip: f32) -> Vec<Shape> {
    vec![line(&[[x, top], [x, tip - 2.0]]), fill(&[[x, tip], [x - 1.4, tip - 2.3], [x + 1.4, tip - 2.3]])]
}

/// A beam under a distributed load w, a point load P at a and a moment M at
/// c, with its dimensions measured from the left end at column `l`. The
/// cantilever's and the simple beam's pictures differ only in the supports,
/// and in where the left end is.
fn loaded_beam(l: f32) -> Vec<Shape> {
    let d = l - 4.0;
    let left = l + 0.5;
    let mut s = Vec::new();

    // The point load P, at a.
    s.extend(arrow([49.5, 1.0], [49.5, 13.0]));
    s.push(text("P", 52.0, 7.0, 7.0, 7.0));
    s.extend(arrow([21.5 + d, 4.5], [left + 0.5, 4.5]));
    s.extend(arrow([33.5 + d, 4.5], [49.2, 4.5]));
    s.push(text("a", 25.0 + d, 5.0, 7.0, 7.0));

    // The distributed load w.
    s.push(line(&[[left, 13.5], [63.5, 13.5]]));
    let first = if l < 4.0 { 3.5 } else { 9.5 };
    let mut x = first;
    while x < 64.0 {
        s.extend(load_arrow(x, 13.5, 18.0));
        x += 6.0;
    }
    s.push(text("w", 66.0, 6.0, 19.0, 7.0));

    // The beam, with a gap where the moment's arrow passes in front of it,
    // and the point the moment acts on.
    s.push(rect(l, 18.0, 29.8, 23.0));
    s.push(rect(31.2, 18.0, 64.0, 23.0));
    // The beam's middle, hidden in it, so that the test sees it filled.
    s.push(line(&[[left, 20.5], [29.4, 20.5]]));
    s.push(line(&[[31.6, 20.5], [63.5, 20.5]]));
    let centre: Vec<[f32; 2]> = (0..16).map(|i| (i as f32 * std::f32::consts::TAU / 16.0).sin_cos()).map(|(y, x)| [37.5 + 1.3 * x, 20.5 + 1.3 * y]).collect();
    s.push(Shape::Fill { points: centre, light: true });

    // The moment M, an arrow curling round that point.
    s.push(arc(37.5, 14.5, 7.0, 6.0, 180.0, 322.0));
    s.push(line(&[[30.5, 14.5], [30.5, 23.5]]));
    s.push(arc(37.5, 23.5, 7.0, 5.0, 60.0, 180.0));
    s.extend(arrow([41.0, 27.8], [44.0, 27.5]));
    s.push(text("M", 46.5, 6.5, 32.0, 7.0));

    // x: from the left end to the section.
    s.push(line(&[[left, 29.5], [9.5 + d, 29.5]]));
    s.push(text("x", 13.0 + d, 5.0, 32.0, 7.0));
    s.extend(arrow([20.5 + d, 29.5], [27.2 + d, 29.5]));
    s.push(line(&[[27.5 + d, 26.0], [27.5 + d, 33.0]]));

    // c: from the left end to the moment.
    s.extend(arrow([15.5 + d, 37.5], [left + 0.5, 37.5]));
    s.push(text("c", 19.0 + d, 5.0, 40.0, 7.0));
    s.extend(arrow([27.5 + d, 37.5], [37.2, 37.5]));
    s.push(line(&[[37.5, 34.0], [37.5, 41.0]]));

    // L: the whole beam.
    s.extend(arrow([27.5, 45.5], [left + 0.5, 45.5]));
    s.push(text("L", 31.0, 5.0, 49.0, 7.0));
    s.extend(arrow([39.5, 45.5], [63.2, 45.5]));
    s.push(line(&[[63.5, 42.0], [63.5, 49.0]]));
    s
}

/// A cantilever built into a wall on the left, under a distributed load, a
/// point load and a moment.
fn cantilever() -> Diagram {
    let mut s = vec![line(&[[4.5, 1.0], [4.5, 49.0]])];
    // The wall's hatching, every three rows.
    for i in 0..15 {
        let y = 2.5 + 3.0 * i as f32;
        s.push(line(&[[4.2, y - 0.7], [0.5, y + 3.0]]));
    }
    s.extend(loaded_beam(4.0));
    Diagram::new("Cantilever", 32, 3, include_bytes!("../../../../firmware/images/F4AC7-packed.png"), s)
}

/// A beam on a pin at the left and a roller at the right, under a
/// distributed load, a point load and a moment.
fn simple_beam() -> Diagram {
    let mut s = vec![
        // The left end, carried down and up as the dimensions' start.
        line(&[[3.5, 1.0], [3.5, 8.0]]),
        line(&[[3.5, 23.0], [3.5, 49.0]]),
        // The pin's triangle and the roller.
        fill(&[[3.5, 22.6], [7.0, 27.0], [0.0, 27.0]]),
        dot(63.5, 25.5, 2.5),
        // Hidden in the roller, so that the test sees it filled.
        circle(63.5, 25.5, 0.8),
    ];
    s.extend(loaded_beam(3.0));
    Diagram::new("SimpleBeam", 32, 3, include_bytes!("../../../../firmware/images/F4DDE-packed.png"), s)
}

/// A pinned column under a load P off its axis by e, with its length L and
/// the distance c from its axis to its edge.
fn eccentric_columns() -> Diagram {
    let mut s = vec![text("P", 5.5, 5.5, 7.0, 7.0)];
    s.extend(arrow([14.5, 2.0], [14.5, 9.0]));
    s.push(closed(&[[12.5, 9.5], [22.5, 9.5], [22.5, 39.5], [12.5, 39.5]]));

    // The axis, and the load's line carried into the column.
    for (from, to) in [(10.0, 13.0), (14.0, 19.0), (21.0, 24.0), (26.0, 29.0), (31.0, 36.0)] {
        s.push(line(&[[17.5, from + 0.2], [17.5, to - 0.2]]));
    }
    s.push(line(&[[14.5, 10.2], [14.5, 12.8]]));
    s.push(line(&[[14.5, 14.2], [14.5, 18.8]]));

    // e, from the axis to the load's line, and c, from the axis to the edge.
    s.push(text("e", 1.5, 5.0, 19.0, 7.0));
    s.extend(arrow([8.5, 16.5], [14.3, 16.5]));
    s.extend(arrow([24.5, 16.5], [17.7, 16.5]));
    s.push(text("c", 0.0, 5.0, 36.0, 7.0));
    s.extend(arrow([7.5, 33.5], [12.3, 33.5]));
    s.extend(arrow([24.5, 33.5], [17.7, 33.5]));

    // L, between the column's ends.
    s.push(line(&[[25.2, 9.5], [31.8, 9.5]]));
    s.push(line(&[[25.2, 39.5], [31.8, 39.5]]));
    s.extend(arrow([28.5, 19.0], [28.5, 9.6]));
    s.extend(arrow([28.5, 31.0], [28.5, 39.4]));
    s.push(text("L", 25.5, 6.0, 28.0, 7.0));

    // The pinned foot.
    s.push(line(&[[17.5, 39.5], [12.2, 45.5]]));
    s.push(line(&[[17.5, 39.5], [22.8, 45.5]]));
    s.extend(wall([12.2, 45.5], [22.8, 45.5], -2.0, 3.0));
    s.extend(pin(17.5, 39.5));
    Diagram::new("EccentricColumns", 48, 5, include_bytes!("../../../../firmware/images/F55B2-packed.png"), s)
}

pub(super) fn all() -> Vec<Diagram> {
    vec![elastic_buckling(), cantilever(), simple_beam(), eccentric_columns()]
}
