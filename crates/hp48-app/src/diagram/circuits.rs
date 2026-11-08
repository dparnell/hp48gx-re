//! Electricity: dividers, and series and parallel circuits.

use super::*;

/// A resistor's zigzag along a wire, from `start`, three pixels to each side.
/// `along` is the wire's direction and `side` the way the first bend goes.
fn zigzag(start: [f32; 2], along: [f32; 2], side: [f32; 2]) -> Vec<[f32; 2]> {
    [(0.0, 0.0), (3.0, 3.0), (9.0, -3.0), (15.0, 3.0), (21.0, -3.0), (24.0, 0.0)]
        .iter()
        .map(|&(a, s)| [start[0] + a * along[0] + s * side[0], start[1] + a * along[1] + s * side[1]])
        .collect()
}

/// A wire down from (`x`, `top`) to (`x`, `bottom`), with a resistor whose
/// zigzag starts at `from`.
fn resistor_down(x: f32, top: f32, from: f32, bottom: f32) -> Shape {
    let mut points = vec![[x, top]];
    points.extend(zigzag([x, from], [0.0, 1.0], [-1.0, 0.0]));
    points.push([x, bottom]);
    line(&points)
}

/// A coil of two loops along a wire. `o` is the first loop's centre on the
/// coil's axis, `along` the wire's direction and `out` the side the loops
/// stand on; `lead` is how far before and after the coil the wire runs on
/// its axis. The coil is a prolate cycloid.
fn coil(o: [f32; 2], along: [f32; 2], out: [f32; 2], lead: f32) -> Shape {
    let (k, b) = (2.0 / std::f32::consts::PI, 2.5);
    let at = |a: f32, s: f32| [o[0] + a * along[0] + s * out[0], o[1] + a * along[1] + s * out[1]];
    let mut points = Vec::new();
    // In from the wire, a quarter ellipse down to the coil's first bottom.
    for i in 0..=6 {
        let t = (180.0 + 15.0 * i as f32).to_radians();
        points.push(at(-2.0 + lead * t.cos(), 0.5 + 3.0 * t.sin()));
    }
    let pi = std::f32::consts::PI;
    for i in 1..64 {
        let t = -pi + 4.0 * pi * i as f32 / 64.0;
        points.push(at(k * t - b * t.sin(), b * t.cos()));
    }
    for i in 0..=6 {
        let t = (270.0 + 15.0 * i as f32).to_radians();
        points.push(at(6.0 + lead * t.cos(), 0.5 + 3.0 * t.sin()));
    }
    line(&points)
}

/// A capacitor on a wire running down at `x`, its straight plate at `plate`
/// and the curved one below it. The wire runs from `top` to `bottom`.
fn capacitor_down(x: f32, top: f32, plate: f32, bottom: f32) -> Vec<Shape> {
    vec![
        line(&[[x, top], [x, plate]]),
        line(&[[x - 4.0, plate], [x + 4.0, plate]]),
        arc(x, plate + 7.0, 5.0, 5.0, 216.87, 323.13),
        line(&[[x, plate + 2.0], [x, bottom]]),
    ]
}

/// The arrow pointing into a circuit from the left, at `x`, `y`: what the
/// equivalent value is seen from.
fn into(x: f32, y: f32) -> Vec<Shape> {
    arrow([x + 0.2, y], [x + 11.0, y])
}

/// Two resistors R1 and R2 in series across a voltage V, with the voltage V1
/// across R1.
fn voltage_divider() -> Diagram {
    let mut top = vec![[1.5, 3.5]];
    top.extend(zigzag([13.5, 3.5], [1.0, 0.0], [0.0, 1.0]));
    top.push([48.5, 3.5]);
    top.extend(zigzag([48.5, 8.5], [0.0, 1.0], [-1.0, 0.0]));
    top.extend([[48.5, 37.5], [1.5, 37.5]]);
    let mut s = vec![line(&top), line(&[[48.5, 3.5], [62.5, 3.5]]), line(&[[48.5, 37.5], [62.5, 37.5]])];
    s.push(text("R₂", 19.0, 11.0, 16.0, 7.0));
    s.push(text("R₁", 33.0, 11.0, 24.0, 7.0));

    // The voltages, as arrows out to the wires they are between.
    for x in [4.5, 59.5] {
        s.extend(arrow([x, 13.5], [x, 4.0]));
        s.extend(arrow([x, 27.0], [x, 37.0]));
    }
    s.push(text("V", 2.0, 5.0, 24.0, 7.0));
    s.push(text("V₁", 54.0, 10.0, 24.0, 7.0));
    Diagram::new("VoltageDivider", 32, 8, include_bytes!("../../../../firmware/images/F5759-packed.png"), s)
}

/// A current I shared by two resistors R1 and R2 in parallel, with the
/// current I1 through R1.
fn current_divider() -> Diagram {
    let mut s = into(0.3, 2.5);
    s.push(text("I", 3.5, 4.0, 15.0, 7.0));
    s.push(line(&[[28.5, 2.5], [14.5, 2.5]]));
    s.push(resistor_down(28.5, 2.5, 7.5, 36.5));
    s.push(line(&[[28.5, 2.5], [54.5, 2.5]]));
    s.push(resistor_down(54.5, 2.5, 7.5, 36.5));
    s.push(line(&[[14.5, 36.5], [54.5, 36.5]]));
    s.push(text("I₁", 13.0, 9.0, 16.0, 7.0));
    s.extend(arrow([17.5, 19.0], [17.5, 30.0]));
    s.push(text("R₁", 35.0, 10.0, 23.0, 7.0));
    s.push(text("R₂", 61.0, 11.0, 23.0, 7.0));
    Diagram::new("CurrentDivider", 32, 9, include_bytes!("../../../../firmware/images/F5945-packed.png"), s)
}

/// Two resistors in series, and two in parallel, with their equivalents Rs
/// and Rp.
fn series_and_parallel_r() -> Diagram {
    let mut series = vec![[5.5, 12.5]];
    series.extend(zigzag([10.5, 12.5], [1.0, 0.0], [0.0, 1.0]));
    series.push([40.5, 12.5]);
    series.extend(zigzag([40.5, 16.5], [0.0, 1.0], [-1.0, 0.0]));
    series.extend([[40.5, 44.5], [5.5, 44.5]]);
    let mut s = vec![line(&series)];
    s.push(text("R₁", 16.0, 11.0, 7.0, 7.0));
    s.push(text("R₂", 23.0, 11.0, 32.0, 7.0));
    s.extend(into(0.0, 19.5));
    s.push(text("Rₛ", 0.0, 11.0, 32.0, 7.0));

    s.push(line(&[[62.5, 12.5], [75.5, 12.5]]));
    s.push(resistor_down(75.5, 12.5, 16.5, 44.5));
    s.push(line(&[[62.5, 44.5], [75.5, 44.5]]));
    let mut right = vec![[75.5, 12.5], [100.5, 12.5]];
    right.extend(zigzag([100.5, 16.5], [0.0, 1.0], [-1.0, 0.0]));
    right.extend([[100.5, 44.5], [75.5, 44.5]]);
    s.push(line(&right));
    s.push(text("R₁", 81.0, 10.0, 23.0, 7.0));
    s.push(text("R₂", 107.0, 11.0, 32.0, 7.0));
    s.extend(into(54.0, 20.5));
    s.push(text("Rₚ", 54.0, 11.0, 32.0, 7.0));
    Diagram::new("SeriesAndParallelR", 8, 5, include_bytes!("../../../../firmware/images/F5B82-packed.png"), s)
}

/// Two capacitors in series, and two in parallel, with their equivalents Cs
/// and Cp.
fn series_and_parallel_c() -> Diagram {
    let mut s = vec![
        line(&[[4.5, 14.5], [19.5, 14.5]]),
        line(&[[19.5, 10.0], [19.5, 19.0]]),
        arc(26.5, 14.5, 5.0, 5.0, 126.87, 233.13),
        line(&[[21.5, 14.5], [39.5, 14.5]]),
        line(&[[39.5, 48.5], [4.5, 48.5]]),
    ];
    s.extend(capacitor_down(39.5, 14.5, 29.5, 48.5));
    s.push(text("C₁", 16.0, 10.0, 7.0, 7.0));
    s.push(text("C₂", 21.0, 11.0, 35.0, 7.0));
    s.extend(into(0.0, 22.5));
    s.push(text("Cₛ", 0.0, 11.0, 35.0, 7.0));

    s.push(line(&[[62.5, 14.5], [100.5, 14.5]]));
    s.push(line(&[[63.5, 48.5], [100.5, 48.5]]));
    s.extend(capacitor_down(78.5, 14.5, 30.5, 48.5));
    s.extend(capacitor_down(100.5, 14.5, 30.5, 48.5));
    s.push(text("C₁", 82.0, 10.0, 25.0, 7.0));
    s.push(text("C₂", 108.0, 11.0, 36.0, 7.0));
    s.extend(into(54.0, 22.5));
    s.push(text("Cₚ", 54.0, 11.0, 35.0, 7.0));
    Diagram::new("SeriesAndParallelC", 8, 3, include_bytes!("../../../../firmware/images/F5F01-packed.png"), s)
}

/// Two inductors in series, and two in parallel, with their equivalents Ls
/// and Lp.
fn series_and_parallel_l() -> Diagram {
    let (right, down) = ([1.0, 0.0], [0.0, 1.0]);
    let mut s = vec![
        line(&[[9.5, 12.5], [21.5, 12.5]]),
        coil([25.5, 13.0], right, [0.0, -1.0], 2.0),
        line(&[[33.5, 12.5], [44.5, 12.5], [44.5, 21.5]]),
        coil([44.0, 26.5], down, right, 3.0),
        line(&[[44.5, 35.5], [44.5, 44.5], [9.5, 44.5]]),
    ];
    s.push(text("L₁", 23.0, 10.0, 7.0, 7.0));
    s.push(text("L₂", 27.0, 11.0, 32.0, 7.0));
    s.extend(into(1.0, 19.5));
    s.push(text("Lₛ", 1.0, 11.0, 32.0, 7.0));

    s.push(line(&[[67.5, 12.5], [101.5, 12.5]]));
    s.push(line(&[[68.5, 44.5], [101.5, 44.5]]));
    for x in [79.5, 101.5] {
        s.push(line(&[[x, 12.5], [x, 21.5]]));
        s.push(coil([x - 0.5, 26.5], down, right, 3.0));
        s.push(line(&[[x, 35.5], [x, 44.5]]));
    }
    s.push(text("L₁", 83.0, 10.0, 23.0, 7.0));
    s.push(text("L₂", 107.0, 11.0, 32.0, 7.0));
    s.extend(into(59.0, 19.5));
    s.push(text("Lₚ", 59.0, 11.0, 32.0, 7.0));
    Diagram::new("SeriesAndParallelL", 8, 4, include_bytes!("../../../../firmware/images/F629F-packed.png"), s)
}

pub(super) fn all() -> Vec<Diagram> {
    vec![voltage_divider(), current_divider(), series_and_parallel_r(), series_and_parallel_c(), series_and_parallel_l()]
}
