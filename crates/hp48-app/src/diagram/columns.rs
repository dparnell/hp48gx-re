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

pub(super) fn all() -> Vec<Diagram> {
    vec![elastic_buckling()]
}
