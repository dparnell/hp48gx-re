//! Motion.

use super::*;

/// A letter with a subscript: `main` in the box `x`..`x + w` standing on
/// `baseline`, capitals `cap` tall, and `sub` smaller and lower in its box.
fn subscripted((main, x, w): (&'static str, f32, f32), (sub, sx, sw): (&'static str, f32, f32), baseline: f32, cap: f32) -> [Shape; 2] {
    [text(main, x, w, baseline, cap), text(sub, sx, sw, baseline + 0.3, cap * 0.7)]
}

/// A projectile launched from the origin at θ0 with speed v0, its velocity
/// split into vx and vy, its parabolic path and its range R.
fn projectile_motion() -> Diagram {
    let (x0, ground) = (12.5, 44.5);
    let mut s = arrow([x0, 52.0], [x0, 0.0]);
    s.extend(arrow([x0, ground], [81.0, ground]));
    s.push(text("y", 2.5, 6.0, 4.6, 6.0));
    s.push(text("x", 82.5, 6.0, 47.0, 7.0));

    // The path: a parabola from the origin, its top at (`apex`, `top`), and
    // the line of launch, its tangent at the origin.
    let (apex, top) = (42.5, 0.3);
    let half = apex - x0;
    let path: Vec<[f32; 2]> = (0..=60)
        .map(|i| {
            let x = x0 + 2.0 * half * i as f32 / 60.0;
            [x, top + (ground - top) * ((x - apex) / half).powi(2)]
        })
        .collect();
    s.push(line(&path));
    let slope = 2.0 * (ground - top) / half;
    s.push(line(&[[x0, ground], [x0 + ground / slope, 0.0]]));
    s.extend(subscripted(("θ", 18.5, 4.0), ("0", 22.5, 4.0), 41.6, 5.0));

    // The velocity and its parts.
    let foot = [34.5, 32.5];
    s.extend(arrow(foot, [34.5, 22.0]));
    s.extend(arrow(foot, [45.0, 32.5]));
    s.extend(arrow(foot, [45.0, 22.0]));
    s.extend(subscripted(("v", 30.5, 4.0), ("y", 34.5, 4.0), 20.0, 6.0));
    s.extend(subscripted(("v", 46.5, 4.0), ("0", 50.5, 4.0), 20.0, 6.0));
    s.extend(subscripted(("v", 46.5, 4.0), ("x", 50.5, 4.0), 35.0, 6.0));

    // The range.
    s.extend(arrow([36.5, 49.5], [13.0, 49.5]));
    s.extend(arrow([46.0, 49.5], [72.0, 49.5]));
    s.push(line(&[[72.5, 47.0], [72.5, 52.0]]));
    s.push(text("R", 39.5, 5.0, 52.0, 5.0));
    Diagram::new("ProjectileMotion", 24, 3, include_bytes!("../../../../firmware/images/FA05C-packed.png"), s)
}

pub(super) fn all() -> Vec<Diagram> {
    vec![projectile_motion()]
}
