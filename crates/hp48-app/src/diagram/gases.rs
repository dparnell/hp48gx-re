//! Gases.

use super::fluids::{between, inside, label, smooth, stipple};
use super::*;

/// Gas flowing through a converging-diverging nozzle: subsonic (M<1) as it
/// narrows, sonic (M=1) at the throat and supersonic (M>1) beyond.
fn isentropic_flow() -> Diagram {
    // The nozzle is symmetric about the middle of its throat, and about its
    // axis.
    let half = [[12.0, 0.5], [17.0, 0.6], [23.0, 2.5], [29.0, 5.5], [36.0, 8.4], [42.0, 10.1], [46.0, 10.5]];
    let knots: Vec<[f32; 2]> = half.iter().copied().chain(half.iter().rev().map(|p| [99.0 - p[0], p[1]])).collect();
    let top = smooth(&knots);
    let bottom: Vec<[f32; 2]> = top.iter().map(|p| [p[0], 33.0 - p[1]]).collect();
    let nozzle = between(&top, &bottom);
    let mut s = vec![line(&top), line(&bottom)];
    s.extend(arrow([0.0, 16.5], [9.0, 16.5]));
    s.extend(label("M<1", [20.0, 14.0, 33.0, 19.0], 19.0, 5.0));
    s.extend(label("M=1", [43.0, 14.0, 56.0, 19.0], 19.0, 5.0));
    s.extend(label("M>1", [66.0, 14.0, 79.0, 19.0], 19.0, 5.0));
    // The gas, with a clear window around each label.
    let windows = [(17.0, 35.0), (41.0, 57.0), (63.0, 82.0)];
    let gas = stipple(&s, (12, 86), (2, 30), |x, y| {
        inside(&nozzle, x, y) && !((11.0..21.0).contains(&y) && windows.iter().any(|w| (w.0..w.1).contains(&x)))
    });
    s.extend(gas);
    Diagram::new("IsentropicFlow", 16, 10, include_bytes!("../../../../firmware/images/F8814-packed.png"), s)
}

pub(super) fn all() -> Vec<Diagram> {
    vec![isentropic_flow()]
}
