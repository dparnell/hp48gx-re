//! Solid Geometry.
//!
//! Each solid sits on axes x, y (going back) and z, with a line parallel to
//! x at distance d for the parallel axis theorem. Edges hidden behind a solid
//! are dotted, as in the bitmaps.

use super::*;

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

/// A line with a small filled arrowhead at `tip`, for slanting dimension lines.
fn small_arrow(from: [f32; 2], tip: [f32; 2]) -> Vec<Shape> {
    let (dx, dy) = (tip[0] - from[0], tip[1] - from[1]);
    let len = dx.hypot(dy);
    let (ux, uy) = (dx / len, dy / len);
    let (bx, by) = (tip[0] - 2.4 * ux, tip[1] - 2.4 * uy);
    vec![line(&[from, [bx, by]]), fill(&[tip, [bx - 1.1 * uy, by + 1.1 * ux], [bx + 1.1 * uy, by - 1.1 * ux]])]
}

/// A vertical dimension at `x` from `top` to `bottom`, between bars from
/// `x0` to `x1`, its arrows stopping at `from_top` and `from_bottom` to leave
/// room for the label.
fn height(x: f32, x0: f32, x1: f32, top: f32, bottom: f32, from_top: f32, from_bottom: f32) -> Vec<Shape> {
    let mut s = vec![line(&[[x0, top], [x1, top]]), line(&[[x0, bottom], [x1, bottom]])];
    s.extend(arrow([x, from_top], [x, top + 0.4]));
    s.extend(arrow([x, from_bottom], [x, bottom - 0.4]));
    s
}

/// A radius r from the centre (`cx`, `y`) to the left, out to `x`, broken
/// for its label: the centre as a ring.
fn radius(cx: f32, y: f32, x: f32) -> Vec<Shape> {
    let mut s = arrow([x + 5.3, y], [x + 0.2, y]);
    s.push(line(&[[cx - 3.0, y], [cx - 1.0, y]]));
    s.push(circle(cx, y, 1.0));
    s.push(text("r", x + 7.0, 6.0, y + 2.5, 7.0));
    s
}

/// The axes from the origin: z up, x to the right, y going back up to the
/// right, labelled at the ends, and the line parallel to x at distance d.
struct Axes {
    origin: [f32; 2],
    z_top: f32,
    x_end: f32,
    y_tip: [f32; 2],
    /// Where the line at distance d is, and how far it reaches.
    d_y: f32,
    d_end: f32,
}

impl Axes {
    fn shapes(&self) -> Vec<Shape> {
        let [ox, oy] = self.origin;
        let mut s = arrow([ox, oy + 0.5], [ox, self.z_top]);
        s.extend(arrow([ox + 0.5, oy], [self.x_end, oy]));
        s.extend(arrow([ox, oy - 0.5], self.y_tip));
        s.push(line(&[[ox, self.d_y], [self.d_end, self.d_y]]));
        s
    }
}

/// Where lines from `apex`, straight above the centre of an ellipse, touch
/// it: the two points as angles for `arc`.
fn tangent_angles(apex: [f32; 2], cy: f32, ry: f32) -> (f32, f32) {
    // Scaled to a unit circle, the apex is straight above the centre.
    let a = (ry / (apex[1] - cy)).asin().to_degrees();
    (a, 180.0 - a)
}

/// A right circular cone of radius r and height h, standing on its base.
fn cone() -> Diagram {
    let (cx, cy, rx, ry) = (25.5, 37.75, 16.0, 7.6);
    let apex = [cx, 8.0];
    let (right, left) = tangent_angles(apex, cy, ry);
    let point = |a: f32| [cx + rx * a.to_radians().cos(), cy + ry * a.to_radians().sin()];
    let mut s = vec![line(&[point(left), apex, point(right)]), arc(cx, cy, rx, ry, right, left)];
    s.extend(dotted(arc_points(cx, cy, rx, ry, left, 360.0 + right)));
    s.extend(radius(cx, cy, 9.5));

    let axes = Axes { origin: [cx, 27.5], z_top: 0.2, x_end: 73.0, y_tip: [72.8, 2.3], d_y: 15.5, d_end: 73.0 };
    s.extend(axes.shapes());
    s.extend(arrow([64.5, 10.0], [64.5, 14.8]));
    s.extend(height(2.5, 0.0, 5.0, 7.5, 37.5, 14.5, 29.0));
    s.extend([
        text("z", 14.5, 6.0, 5.0, 7.0),
        text("h", -0.5, 6.0, 26.0, 7.0),
        text("d", 60.5, 6.0, 25.0, 7.0),
        text("x", 74.5, 6.0, 30.0, 7.0),
        text("y", 74.5, 6.0, 5.6, 6.0),
    ]);
    Diagram::new("Cone", 40, 5, include_bytes!("../../../../firmware/images/FD2EA-packed.png"), s)
}

/// A right circular cylinder of radius r and height h, standing on its base.
fn cylinder() -> Diagram {
    let (cx, top, bottom, rx, ry) = (25.5, 14.5, 40.5, 16.0, 8.0);
    let mut s = vec![
        ellipse(cx, top, rx, ry),
        line(&[[cx - rx, top], [cx - rx, bottom]]),
        line(&[[cx + rx, top], [cx + rx, bottom]]),
        arc(cx, bottom, rx, ry, 0.0, 180.0),
    ];
    s.extend(dotted(arc_points(cx, bottom, rx, ry, 180.0, 360.0)));
    s.extend(radius(cx, bottom, 9.5));

    let axes = Axes { origin: [cx, 29.5], z_top: 0.2, x_end: 73.0, y_tip: [72.8, 4.3], d_y: 24.5, d_end: 73.0 };
    s.extend(axes.shapes());
    s.extend(arrow([54.5, 19.0], [54.5, 23.8]));
    s.extend(arrow([54.5, 34.5], [54.5, 30.2]));
    s.extend(height(3.5, 0.0, 7.0, 15.5, 40.5, 21.5, 34.0));
    s.extend([
        text("z", 14.5, 6.0, 5.0, 7.0),
        text("h", 0.5, 6.0, 31.0, 7.0),
        text("d", 58.5, 6.0, 22.0, 7.0),
        text("x", 74.5, 6.0, 32.0, 7.0),
        text("y", 74.5, 6.0, 7.6, 6.0),
    ]);
    Diagram::new("Cylinder", 40, 3, include_bytes!("../../../../firmware/images/FD5EF-packed.png"), s)
}

/// A rectangular box b wide, t tall and h deep.
fn parallelepiped() -> Diagram {
    let (ftl, ftr, fbl, fbr) = ([8.5, 31.5], [52.5, 31.5], [8.5, 48.5], [52.5, 48.5]);
    let (btl, btr, bbl, bbr) = ([39.5, 8.5], [82.5, 8.5], [39.5, 25.5], [82.5, 25.5]);
    let mut s = vec![
        closed(&[ftl, ftr, fbr, fbl]),
        line(&[ftl, btl, btr]),
        line(&[ftr, btr, bbr, fbr]),
    ];
    for (a, b) in [(btl, bbl), (bbl, bbr), (bbl, fbl)] {
        s.extend(dotted(vec![a, b]));
    }

    let axes = Axes { origin: [47.5, 27.5], z_top: 0.8, x_end: 97.0, y_tip: [77.8, 1.2], d_y: 15.5, d_end: 96.5 };
    s.extend(axes.shapes());
    s.extend(arrow([88.5, 9.0], [88.5, 14.8]));
    s.extend(arrow([88.5, 33.5], [88.5, 28.2]));

    // b across the front, t up its side, h along the top going back.
    s.extend(arrow([24.5, 40.5], [8.9, 40.5]));
    s.extend(arrow([35.5, 40.5], [52.1, 40.5]));
    s.push(line(&[[0.0, 31.5], [6.0, 31.5]]));
    s.push(line(&[[0.0, 48.5], [6.0, 48.5]]));
    s.push(line(&[[28.0, 8.5], [34.0, 8.5]]));
    s.extend(small_arrow([13.2, 23.4], [2.6, 31.3]));
    s.extend(small_arrow([22.0, 15.4], [31.0, 8.8]));
    s.extend([
        text("b", 27.5, 6.0, 44.0, 7.0),
        text("t", 0.0, 5.0, 44.0, 7.0),
        text("h", 13.5, 6.0, 21.0, 7.0),
        text("z", 36.5, 6.0, 5.0, 7.0),
        text("d", 85.5, 6.0, 25.0, 7.0),
        text("x", 98.5, 6.0, 30.0, 7.0),
        text("y", 80.5, 6.0, 4.6, 6.0),
    ]);
    Diagram::new("Parallelepiped", 16, 3, include_bytes!("../../../../firmware/images/FD92A-packed.png"), s)
}

/// A sphere of radius r, with its equator.
fn sphere() -> Diagram {
    let (cx, cy, r) = (17.5, 25.5, 17.0);
    let mut s = vec![circle(cx, cy, r), arc(cx, cy, r, 9.0, 0.0, 180.0)];
    s.extend(dotted(arc_points(cx, cy, r, 9.0, 180.0, 360.0)));
    s.extend(arrow([6.5, cy], [0.7, cy]));
    s.push(line(&[[14.5, cy], [cx, cy]]));

    let axes = Axes { origin: [cx, 25.5], z_top: 0.2, x_end: 64.0, y_tip: [63.8, 0.5], d_y: 13.5, d_end: 63.0 };
    s.extend(axes.shapes());
    s.extend(arrow([55.5, 8.0], [55.5, 12.8]));
    s.extend(arrow([55.5, 30.8], [55.5, 26.2]));
    s.extend([
        text("r", 7.5, 6.0, 28.0, 7.0),
        text("z", 6.5, 6.0, 5.0, 7.0),
        text("d", 52.5, 6.0, 23.0, 7.0),
        text("x", 65.5, 6.0, 28.0, 7.0),
        text("y", 65.5, 6.0, 4.6, 6.0),
    ]);
    Diagram::new("Sphere", 48, 6, include_bytes!("../../../../firmware/images/FDD3B-packed.png"), s)
}

pub(super) fn all() -> Vec<Diagram> {
    vec![cone(), cylinder(), parallelepiped(), sphere()]
}
