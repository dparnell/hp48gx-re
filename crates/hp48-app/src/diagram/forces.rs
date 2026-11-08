//! Forces and Energy.

use super::fluids::label;
use super::*;

/// A spring of constant k fixed to a wall, stretched by the force F through
/// the distance x.
fn hookes_law() -> Diagram {
    // The wall, hatched on its left.
    let mut s = vec![line(&[[3.5, 3.0], [3.5, 25.0]])];
    for i in 0..7 {
        let y = 3.5 + 3.0 * i as f32;
        s.push(line(&[[3.5, y], [0.5, y + 3.0]]));
    }
    // The coils, drawn as a looped curve: each turn goes over the top to the
    // right and loops back under itself.
    let coil = |t: f32| [15.5 + 4.0 * t + 2.0 * (std::f32::consts::TAU * t).sin(), 14.0 - 3.5 * (std::f32::consts::TAU * t).cos()];
    let mut spring = vec![[3.5, 14.5], [13.5, 14.5]];
    spring.extend((0..=210).map(|i| coil(-0.13 + 5.26 * i as f32 / 210.0)));
    spring.extend([[37.5, 14.5], [46.0, 14.5]]);
    s.push(line(&spring));
    s.extend(arrow([55.0, 3.5], [48.0, 3.5]));
    s.extend(arrow([48.0, 14.5], [55.0, 14.5]));
    s.extend(label("k", [24.0, 0.0, 28.0, 7.0], 7.0, 7.0));
    s.extend(label("F", [58.0, 0.0, 63.0, 7.0], 7.0, 7.0));
    s.extend(label("x", [58.0, 12.0, 63.0, 17.0], 17.0, 6.5));
    Diagram::new("HookeSLaw", 40, 14, include_bytes!("../../../../firmware/images/F843B-packed.png"), s)
}

/// Two masses on a line before a head-on elastic collision, the second at
/// rest, and after it.
fn elastic_collisions_1d() -> Diagram {
    let mut s = vec![line(&[[0.0, 10.5], [95.0, 10.5]]), line(&[[0.0, 33.5], [95.0, 33.5]])];
    for (x, y) in [(24.5, 10.5), (45.5, 10.5), (55.5, 33.5), (72.5, 33.5)] {
        s.push(dot(x, y, 2.5));
    }
    s.extend(arrow([19.0, 3.5], [32.0, 3.5]));
    s.extend(arrow([52.0, 26.5], [60.0, 26.5]));
    s.extend(arrow([66.0, 26.5], [77.0, 26.5]));
    s.extend(label("v_1i", [0.0, 0.0, 16.0, 7.0], 7.0, 7.0));
    s.extend(label("v_2i", [50.0, 0.0, 66.0, 7.0], 7.0, 7.0));
    s.extend(label("=0", [67.0, 0.0, 79.0, 7.0], 7.0, 7.0));
    s.extend(label("m_1", [11.0, 14.0, 21.0, 21.0], 21.0, 7.0));
    s.extend(label("m_2", [48.0, 14.0, 60.0, 21.0], 21.0, 7.0));
    s.extend(label("v_1f", [33.0, 23.0, 49.0, 30.0], 30.0, 7.0));
    s.extend(label("v_2f", [79.0, 22.0, 96.0, 29.0], 29.0, 7.0));
    s.extend(label("m_1", [42.0, 37.0, 52.0, 44.0], 42.6, 7.0));
    s.extend(label("m_2", [73.0, 37.0, 84.0, 44.0], 42.6, 7.0));
    Diagram::new("1DElasticCollisions", 16, 6, include_bytes!("../../../../firmware/images/F8576-packed.png"), s)
}

pub(super) fn all() -> Vec<Diagram> {
    vec![hookes_law(), elastic_collisions_1d()]
}
