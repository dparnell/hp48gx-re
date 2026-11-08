//! Optics.

use super::*;

/// A filled arrowhead `len` long and `2 * half` wide at `tip`, pointing
/// away from `from`.
fn head(from: [f32; 2], tip: [f32; 2], len: f32, half: f32) -> Shape {
    let (dx, dy) = (tip[0] - from[0], tip[1] - from[1]);
    let d = dx.hypot(dy);
    let (ux, uy) = (dx / d, dy / d);
    let (bx, by) = (tip[0] - len * ux, tip[1] - len * uy);
    fill(&[tip, [bx - half * uy, by + half * ux], [bx + half * uy, by - half * ux]])
}

/// A ray from `from` to `tip`, with an arrowhead `len` long and `2 * half`
/// wide at its end.
fn ray(from: [f32; 2], tip: [f32; 2], len: f32, half: f32) -> Vec<Shape> {
    let (dx, dy) = (tip[0] - from[0], tip[1] - from[1]);
    let d = dx.hypot(dy);
    let back = [tip[0] - dx / d * (len - 0.5), tip[1] - dy / d * (len - 0.5)];
    vec![line(&[from, back]), head(from, tip, len, half)]
}

/// The point `t` of the way from `a` to `b`.
fn lerp(a: [f32; 2], b: [f32; 2], t: f32) -> [f32; 2] {
    [a[0] + (b[0] - a[0]) * t, a[1] + (b[1] - a[1]) * t]
}

/// How far `p` is from the segment `a`..`b`.
fn distance(p: [f32; 2], a: [f32; 2], b: [f32; 2]) -> f32 {
    let (dx, dy) = (b[0] - a[0], b[1] - a[1]);
    let t = (((p[0] - a[0]) * dx + (p[1] - a[1]) * dy) / (dx * dx + dy * dy)).clamp(0.0, 1.0);
    (p[0] - a[0] - t * dx).hypot(p[1] - a[1] - t * dy)
}

/// A denser medium, stippled: one-pixel dots every 3 pixels from (`x0`, `y0`)
/// up to `x1`, `y1`, leaving out those where `clear` keeps lines and labels clear.
fn stipple(x0: f32, x1: f32, y0: f32, y1: f32, clear: impl Fn([f32; 2]) -> bool) -> Vec<Shape> {
    let mut shapes = Vec::new();
    let mut y = y0;
    while y <= y1 {
        let mut x = x0;
        while x <= x1 {
            if !clear([x, y]) {
                shapes.push(dot(x, y, 0.45));
            }
            x += 3.0;
        }
        y += 3.0;
    }
    shapes
}

/// Light crossing from one medium into a denser one: the incident ray, the
/// reflected ray and the refracted ray, at θ1 and θ2 to the normal.
fn law_of_refraction() -> Diagram {
    let at = [30.5, 12.5];
    let mut s = vec![line(&[[1.3, 12.5], [59.7, 12.5]]), line(&[[30.5, 1.3], [30.5, 32.7]])];

    // The incident ray, with its arrowhead part way along.
    let from = [1.3, 1.4];
    s.push(line(&[from, at]));
    s.push(head(from, [12.7, 5.75], 3.3, 3.3));
    s.extend(ray(at, [60.0, 1.4], 6.0, 2.3));
    let refracted = [50.8, 32.8];
    s.extend(ray(at, refracted, 4.5, 2.0));

    s.extend(stipple(1.5, 28.5, 14.5, 32.5, |_| false));
    s.extend(stipple(32.5, 59.5, 14.5, 32.5, |p| distance(p, at, refracted) < 1.2 || (33.0..42.0).contains(&p[0]) && (24.0..31.0).contains(&p[1])));

    s.extend([text("θ₁", 21.0, 7.0, 7.0, 5.0), text("θ₁", 33.0, 7.0, 7.0, 5.0), text("θ₂", 34.0, 7.0, 30.0, 5.0)]);
    s.extend([text("n₁", 63.0, 10.0, 9.0, 7.0), text("n₂", 63.0, 12.0, 26.0, 7.0)]);
    Diagram::new("LawOfRefraction", 32, 11, include_bytes!("../../../../firmware/images/FA3FD-packed.png"), s)
}

/// A band `width` wide along the segment `a`..`b`: a heavy line.
fn band(a: [f32; 2], b: [f32; 2], width: f32) -> Shape {
    let (dx, dy) = (b[0] - a[0], b[1] - a[1]);
    let d = dx.hypot(dy);
    let (nx, ny) = (-dy / d * width / 2.0, dx / d * width / 2.0);
    fill(&[[a[0] + nx, a[1] + ny], [b[0] + nx, b[1] + ny], [b[0] - nx, b[1] - ny], [a[0] - nx, a[1] - ny]])
}

/// Rays from a point in the denser medium meeting the surface at three
/// angles: under the critical angle θc the ray is refracted and partly
/// reflected, at θc it runs along the surface (the heavy ray), and beyond it
/// it is wholly reflected.
fn critical_angle() -> Diagram {
    let source = [8.5, 35.3];
    let (a, b, c) = ([26.5, 10.5], [57.5, 10.5], [85.5, 10.5]);
    let mut s = vec![line(&[[6.3, 10.5], [102.7, 10.5]])];
    for x in [a[0], b[0], c[0]] {
        s.push(line(&[[x, 0.3], [x, 36.7]]));
    }

    // Under the critical angle.
    s.push(line(&[source, a]));
    let (a_out, a_back) = ([45.3, 0.6], [33.6, 18.6]);
    s.extend(ray(a, a_out, 4.0, 2.0));
    s.extend(ray(a, a_back, 3.5, 1.8));
    // At the critical angle, with the right angle between the normal and the ray along the surface.
    s.push(band(source, b, 1.5));
    let (b_out, b_back) = ([72.8, 9.5], [82.0, 23.0]);
    s.extend(ray([b[0], 9.5], b_out, 3.0, 2.0));
    s.push(line(&[[b[0], 6.5], [60.5, 6.5], [60.5, 9.5]]));
    s.extend(ray(b, b_back, 3.5, 1.8));
    // Beyond it.
    s.push(line(&[source, c]));
    let c_back = [102.8, 18.0];
    s.extend(ray(c, c_back, 3.5, 1.8));

    let rays = [(source, a), (a, a_back), (source, b), (b, b_back), (source, c), (c, c_back)];
    let labels = [(48.0, 57.0, 15.0, 22.0), (88.0, 101.5, 26.0, 34.5)];
    // The dots stand on a grid that starts afresh 2 pixels right of each
    // normal, and keep clear of the rays and of where two rays cross.
    let crossing = [68.35, 15.96];
    for (x0, x1) in [(6.5, 24.5), (28.5, 55.5), (59.5, 83.5), (87.5, 102.5)] {
        s.extend(stipple(x0, x1, 12.5, 36.5, |p| {
            rays.iter().any(|&(from, to)| distance(p, from, to) < 1.8)
                || (p[0] - crossing[0]).hypot(p[1] - crossing[1]) < 2.7
                || labels.iter().any(|&(x0, x1, y0, y1)| (x0..x1).contains(&p[0]) && (y0..y1).contains(&p[1]))
        }));
    }

    s.extend([text("θ", 49.0, 3.0, 21.0, 5.0), text("c", 52.5, 3.5, 21.5, 4.0)]);
    s.extend([text("n₁", 89.0, 10.0, 7.0, 7.0), text("n₂", 89.0, 12.0, 34.0, 7.0)]);
    Diagram::new("CriticalAngle", 8, 10, include_bytes!("../../../../firmware/images/FA626-packed.png"), s)
}

/// Unpolarised light at `c` on a ray running down to the right: a ring (the
/// vibration across the page) on a double arrow (the vibration in it).
fn unpolarised(c: [f32; 2]) -> Vec<Shape> {
    let (a, b) = ([c[0] - 4.0, c[1] + 4.0], [c[0] + 4.0, c[1] - 4.0]);
    let mut shapes = vec![line(&[lerp(a, b, 0.15), lerp(a, b, 0.85)]), head(b, a, 2.2, 1.6), head(a, b, 2.2, 1.6)];
    shapes.extend(pin(c[0], c[1]));
    shapes
}

/// Light meeting a surface at Brewster's angle θB: the reflected ray, at
/// right angles to the refracted one, keeps only the vibration across the page.
fn brewster_s_law() -> Diagram {
    let at = [25.5, 23.5];
    let mut s = vec![line(&[[5.3, 23.5], [at[0], 23.5]]), line(&[[32.6, 23.5], [45.7, 23.5]]), line(&[[at[0], 0.3], [at[0], 46.7]])];

    // The incident ray, unpolarised.
    let from = [5.3, 3.3];
    s.extend(ray(from, [24.6, 22.6], 3.0, 2.3));
    for c in [[9.5, 7.5], [13.5, 11.5], [17.5, 15.5]] {
        s.extend(unpolarised(c));
    }
    // The reflected ray, polarised across the page.
    s.extend(ray(at, [45.6, 3.4], 3.0, 2.3));
    for c in [[32.5, 16.5], [36.5, 12.5], [40.5, 8.5]] {
        s.extend(pin(c[0], c[1]));
    }
    // The refracted ray, at right angles to it.
    let refracted = [42.6, 40.6];
    s.extend(ray(at, refracted, 3.0, 2.3));
    s.push(line(&[[28.5, 20.5], [31.5, 23.5], [28.5, 26.5]]));

    s.extend(stipple(5.5, 23.5, 25.5, 46.5, |_| false));
    s.extend(stipple(27.5, 45.5, 25.5, 46.5, |p| {
        distance(p, at, refracted) < 1.8 || (p[0] < 32.0 && p[1] < 28.0) || (26.0..35.0).contains(&p[0]) && (33.0..40.0).contains(&p[1])
    }));

    s.extend([text("θ", 17.0, 3.0, 5.0, 5.0), text("B", 20.5, 3.5, 5.3, 4.0), text("θ", 27.0, 3.0, 5.0, 5.0), text("B", 30.5, 3.5, 5.3, 4.0)]);
    s.extend([text("θ₂", 27.0, 7.0, 39.0, 5.0), text("n₁", 49.0, 10.0, 16.0, 7.0), text("n₂", 49.0, 12.0, 38.0, 7.0)]);
    Diagram::new("BrewsterSLaw", 40, 4, include_bytes!("../../../../firmware/images/FA9C4-packed.png"), s)
}

/// A concave mirror facing left: an arc of radius `r` through (`vertex`,
/// `axis`), `half` above and below the axis, with short ticks behind it every
/// 3 pixels in from its ends.
fn mirror(vertex: f32, axis: f32, r: f32, half: f32) -> Vec<Shape> {
    let x_at = |dy: f32| vertex - r + (r * r - dy * dy).sqrt();
    let points: Vec<[f32; 2]> = (0..=40).map(|i| -half + 2.0 * half * i as f32 / 40.0).map(|dy| [x_at(dy), axis + dy]).collect();
    let mut shapes = vec![line(&points)];
    let mut dy = half;
    while dy > 1.0 {
        let x = x_at(dy);
        shapes.push(line(&[[x, axis - dy], [x + 2.3, axis - dy]]));
        shapes.push(line(&[[x, axis + dy], [x + 2.3, axis + dy]]));
        dy -= 3.0;
    }
    shapes
}

/// A dotted line from `a` to `b`.
fn dotted(a: [f32; 2], b: [f32; 2]) -> Vec<Shape> {
    let n = ((b[0] - a[0]).hypot(b[1] - a[1]) / 1.6).round().max(1.0) as usize;
    (0..=n).map(|i| lerp(a, b, i as f32 / n as f32)).map(|p| dot(p[0], p[1], 0.4)).collect()
}

/// A dimension's end: a short upright line at `x`, from `y0` to `y1`, with an
/// arrowhead on the line at `y` coming from `from`.
fn dimension_end(x: f32, y0: f32, y1: f32, from: f32, y: f32) -> Vec<Shape> {
    vec![line(&[[x, y0], [x, y1]]), line(&[[from, y], [x, y]]), head([from, y], [x, y], 2.6, 2.0)]
}

/// A concave mirror: on the left, rays parallel to the axis reflected through
/// the focus F, half way to the centre C, with the focal length f and the
/// radius r; on the right, an object inside F and its virtual image behind
/// the mirror, at distances u and v.
fn spherical_reflection() -> Diagram {
    let axis = 20.5;
    let mut s = vec![line(&[[4.8, axis], [20.2, axis]]), line(&[[22.8, axis], [49.5, axis]])];
    s.extend(mirror(49.5, axis, 46.0, 20.0));
    s.extend(pin(3.5, axis));
    s.extend(pin(21.5, axis));

    // Rays parallel to the axis, reflected through F; the lower one passes behind the label f.
    let focus = [21.5, axis];
    for (y, out) in [(2.5, [10.5, 28.6]), (38.5, [10.5, 12.4])] {
        s.push(line(&[[0.3, y], [45.6, y]]));
        s.push(head([0.3, y], [20.2, y], 2.6, 2.1));
        s.extend(ray(focus, out, 3.2, 2.2));
    }
    let lower = [45.6, 38.5];
    s.push(line(&[[45.6, 2.5], focus]));
    s.push(line(&[lerp(focus, lower, 0.38), focus]));
    s.push(line(&[lerp(focus, lower, 0.79), lower]));

    // f and r.
    s.extend(dimension_end(21.5, 28.8, 35.2, 29.7, 32.5));
    s.push(line(&[[38.8, 32.5], [49.5, 32.5]]));
    s.push(line(&[[49.5, 22.0], [49.5, 49.7]]));
    s.extend(dimension_end(3.5, 42.8, 49.7, 20.7, 46.5));
    s.push(line(&[[31.8, 46.5], [49.5, 46.5]]));
    s.extend([text("f", 32.5, 4.5, 36.0, 7.0), text("r", 23.5, 5.5, 49.0, 7.0)]);

    // The object, the image, and the rays between them.
    s.push(line(&[[56.3, axis], [111.7, axis]]));
    s.extend(mirror(95.5, axis, 50.0, 20.0));
    s.extend(pin(57.5, axis));
    s.extend(pin(64.5, axis));
    let (top, image) = ([72.5, 11.6], [106.5, 4.0]);
    s.extend(ray([72.5, axis], [72.5, 10.8], 2.6, 2.0));
    s.extend(ray([106.5, axis], image, 2.6, 2.0));
    let (m1, m2) = ([94.3, 15.0], [95.0, 23.6]);
    s.push(line(&[top, m1]));
    s.push(line(&[top, m2]));
    s.extend(ray(m1, [72.6, 32.6], 3.2, 2.2));
    s.extend(ray(m2, [86.6, 36.6], 3.2, 2.2));
    s.extend(dotted(lerp(m1, image, 0.15), lerp(m1, image, 0.85)));
    s.extend(dotted(lerp(m2, image, 0.2), lerp(m2, image, 0.85)));

    // u and v.
    s.extend(dimension_end(72.5, 42.8, 49.7, 78.7, 46.5));
    s.extend(dimension_end(96.5, 42.8, 49.7, 89.8, 46.5));
    s.extend(dimension_end(106.5, 42.8, 49.7, 111.7, 46.5));
    s.extend([text("u", 81.5, 6.0, 49.0, 7.0), text("v", 98.5, 6.0, 49.0, 7.0)]);
    Diagram::new("SphericalReflection", 8, 3, include_bytes!("../../../../firmware/images/FAC42-packed.png"), s)
}

/// A curve drawn heavy, `width` wide, as a run of short bands.
fn heavy(points: &[[f32; 2]], width: f32) -> Vec<Shape> {
    points.windows(2).map(|w| band(lerp(w[1], w[0], 1.1), lerp(w[0], w[1], 1.1), width)).collect()
}

/// Light from a point in one medium refracted at a convex spherical surface
/// of radius r into a denser one, where it comes to an image: the object and
/// the image are u and v from the surface.
fn spherical_refraction() -> Diagram {
    let axis = 20.5;
    let mut s = vec![line(&[[0.3, axis], [66.3, axis]]), line(&[[68.7, axis], [95.7, axis]])];
    s.extend(pin(67.5, axis));

    // The surface, centred on C at 30 pixels.
    let surface = |dy: f32| 74.5 - (900.0 - dy * dy).sqrt();
    let points: Vec<[f32; 2]> = (0..=40).map(|i| -20.0 + i as f32).map(|dy| [surface(dy), axis + dy]).collect();
    s.extend(heavy(&points, 2.6));

    // Two rays from the object, crossing at the image and going on.
    let (object, image) = ([1.0, axis], [85.5, axis]);
    let mut rays = Vec::new();
    for dy in [-17.0, 17.0] {
        let at = [surface(dy), axis + dy];
        s.push(line(&[object, at]));
        s.push(head(object, lerp(object, at, 0.735), 3.2, 2.2));
        let past = lerp(at, image, 1.283);
        s.push(line(&[at, image]));
        s.extend(ray(image, past, 3.2, 2.2));
        rays.extend([(at, image), (image, past)]);
    }

    // r, from the surface to C.
    s.push(line(&[[45.8, 26.5], [50.8, 26.5]]));
    s.extend(dimension_end(67.5, 23.8, 29.2, 61.8, 26.5));
    s.push(text("r", 53.5, 5.5, 29.0, 7.0));

    // The denser medium, stippled behind the surface, in rows that keep 2 pixels clear of the axis.
    let clear = |p: [f32; 2]| {
        p[0] < surface(p[1] - axis) + 2.0
            || rays.iter().any(|&(from, to)| distance(p, from, to) < 1.8)
            || (p[0] - 67.5).hypot(p[1] - axis) < 2.0
            || (80.0..92.5).contains(&p[0]) && (2.0..10.5).contains(&p[1])
            || (45.0..69.0).contains(&p[0]) && (23.0..30.0).contains(&p[1])
            || p[1] > 39.0 && ((61.0..69.0).contains(&p[0]) || (82.0..88.0).contains(&p[0]))
    };
    s.extend(stipple(47.5, 95.5, 0.5, 18.5, clear));
    s.extend(stipple(47.5, 95.5, 22.5, 40.5, clear));

    // u and v.
    s.extend(dimension_end(4.5, 40.8, 45.7, 19.7, 43.5));
    s.extend(dimension_end(45.5, 40.8, 45.7, 31.3, 43.5));
    s.push(line(&[[45.8, 43.5], [60.7, 43.5]]));
    s.push(head([60.7, 43.5], [45.8, 43.5], 2.6, 2.0));
    s.extend(dimension_end(86.5, 40.8, 45.7, 70.3, 43.5));
    s.extend([text("u", 22.5, 6.0, 46.0, 7.0), text("v", 62.5, 6.0, 46.0, 7.0)]);
    s.extend([text("n₁", 0.0, 10.5, 10.0, 7.0), text("n₂", 80.5, 12.0, 10.0, 7.0)]);
    Diagram::new("SphericalRefraction", 16, 4, include_bytes!("../../../../firmware/images/FB0EE-packed.png"), s)
}

/// A light line across something dark, from `a` to `b`.
fn light(a: [f32; 2], b: [f32; 2]) -> Shape {
    match band(a, b, 1.0) {
        Shape::Fill { points, .. } => Shape::Fill { points, light: true },
        shape => shape,
    }
}

/// A bold upright arrow from the axis at `y0` to `tip`: an object or its image.
fn bold_arrow(x: f32, y0: f32, tip: f32) -> Vec<Shape> {
    let dir = (tip - y0).signum();
    let base = tip - 5.6 * dir;
    vec![band([x, y0], [x, base + 1.5 * dir], 2.0), fill(&[[x, tip], [x - 4.8, base + 0.6 * dir], [x + 4.8, base + 0.6 * dir]])]
}

/// A thin convex lens: a ray parallel to the axis from the top of the object
/// is refracted through the far focus F, and one through the near focus
/// comes out parallel; they meet at the inverted image. u and v are the
/// distances of the object and the image, and r1 and r2 the radii of the faces.
fn thin_lens() -> Diagram {
    let axis = 19.5;
    let mut s = vec![line(&[[0.3, axis], [105.7, axis]])];
    s.extend(pin(16.5, axis));
    s.extend(pin(88.5, axis));
    s.extend(bold_arrow(5.0, axis, 9.0));
    s.extend(bold_arrow(101.0, axis, 29.3));

    // The lens, with a line down its middle for the ink inside it. The rays
    // cross it as light lines from face to face.
    let (lens_x, lens_y) = (51.5, 21.0);
    let face = |y: f32| 3.6 * (1.0 - ((y - lens_y) / 21.0).powi(2)).sqrt();
    let outline: Vec<[f32; 2]> = (0..48).map(|i| i as f32 * std::f32::consts::TAU / 48.0).map(|a| [lens_x + 3.6 * a.cos(), lens_y + 21.0 * a.sin()]).collect();
    s.push(fill(&outline));
    s.push(line(&[[lens_x, 2.5], [lens_x, 39.5]]));
    let through = |y0: f32, y1: f32| ([lens_x - face(y0), y0], [lens_x + face(y1), y1]);

    // The ray parallel to the axis, and on through F.
    let top = [5.0, 9.5];
    let (into, out) = through(9.5, 10.6);
    s.push(line(&[top, into]));
    s.push(head(top, [38.0, 9.5], 2.6, 2.1));
    s.push(light(into, out));
    s.extend(ray(out, [111.6, 36.0], 3.2, 2.2));
    // The ray through the near focus, and on parallel to the axis.
    let (into, out) = through(27.1, 29.5);
    s.push(line(&[top, into]));
    s.push(head(top, lerp(top, into, 0.946), 2.8, 2.2));
    s.push(light(into, out));
    s.extend(ray(out, [111.6, 29.5], 2.6, 2.1));
    s.push(head(out, [81.2, 29.5], 2.6, 2.1));

    // r2 and r1, from the middle of the lens.
    s.extend(dimension_end(16.5, 27.8, 33.7, 25.7, 31.5));
    let (r2, r1) = ([lens_x - face(31.5), 31.5], [lens_x + face(37.5), 37.5]);
    s.push(line(&[[42.8, 31.5], r2]));
    s.extend([light(r2, [lens_x + 0.5, 31.5]), light([lens_x, 29.8], [lens_x, 38.0]), light([lens_x - 0.5, 37.5], r1)]);
    s.push(line(&[r1, [60.7, 37.5]]));
    s.extend(dimension_end(88.5, 33.8, 40.7, 76.8, 37.5));
    s.extend([text("r₂", 28.5, 11.5, 35.0, 7.0), text("r₁", 63.5, 11.0, 40.0, 7.0)]);

    // u and v.
    s.extend(dimension_end(4.5, 43.8, 48.7, 22.7, 46.5));
    s.extend(dimension_end(lens_x, 43.8, 48.7, 33.8, 46.5));
    s.push(line(&[[lens_x, 46.5], [75.7, 46.5]]));
    s.push(head([75.7, 46.5], [lens_x + 0.2, 46.5], 2.6, 2.0));
    s.extend(dimension_end(101.5, 43.8, 48.7, 84.8, 46.5));
    s.extend([text("u", 25.5, 6.0, 49.0, 7.0), text("v", 77.5, 6.0, 49.0, 7.0)]);
    Diagram::new("ThinLens", 8, 2, include_bytes!("../../../../firmware/images/FB472-packed.png"), s)
}

pub(super) fn all() -> Vec<Diagram> {
    vec![law_of_refraction(), critical_angle(), brewster_s_law(), spherical_reflection(), spherical_refraction(), thin_lens()]
}
