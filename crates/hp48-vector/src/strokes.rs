//! Centreline vectorisation of 1-pixel line art.
//!
//! Pixels become graph nodes at their centres. Orthogonal neighbours are
//! linked; diagonal neighbours only when neither shared orthogonal pixel is
//! set, so an L-shaped corner stays a corner instead of a triangle. Chains of
//! degree-2 nodes become polylines; then straight runs are collapsed and
//! gentle (45 degree) turns are rounded with Chaikin subdivision, while sharp
//! turns stay as corners.

use crate::Bitmap;
use std::collections::HashMap;

#[derive(Clone, Debug, PartialEq)]
pub struct Polyline {
    /// Points in LCD pixel coordinates. A single point is a dot.
    pub points: Vec<[f32; 2]>,
    pub closed: bool,
}

type P = (i32, i32);

fn neighbours(b: &Bitmap, (x, y): P) -> Vec<P> {
    let on = |x: i32, y: i32| b.at(x as isize, y as isize);
    let mut n = Vec::with_capacity(8);
    for (dx, dy) in [(1, 0), (-1, 0), (0, 1), (0, -1)] {
        if on(x + dx, y + dy) {
            n.push((x + dx, y + dy));
        }
    }
    for (dx, dy) in [(1, 1), (1, -1), (-1, 1), (-1, -1)] {
        if on(x + dx, y + dy) && !on(x + dx, y) && !on(x, y + dy) {
            n.push((x + dx, y + dy));
        }
    }
    n
}

fn edge_key(a: P, b: P) -> (P, P) {
    if a <= b {
        (a, b)
    } else {
        (b, a)
    }
}

/// Trace all set pixels of `b` into smoothed centreline polylines.
pub fn centerlines(b: &Bitmap) -> Vec<Polyline> {
    let mut adj: HashMap<P, Vec<P>> = HashMap::new();
    for y in 0..b.h as i32 {
        for x in 0..b.w as i32 {
            if b.get(x as usize, y as usize) {
                adj.insert((x, y), neighbours(b, (x, y)));
            }
        }
    }
    let mut used: std::collections::HashSet<(P, P)> = std::collections::HashSet::new();
    let mut paths: Vec<(Vec<P>, bool)> = Vec::new();

    // Deterministic order: scan pixels row by row.
    let mut nodes: Vec<P> = adj.keys().copied().collect();
    nodes.sort_by_key(|&(x, y)| (y, x));

    let walk = |start: P, first: P, used: &mut std::collections::HashSet<(P, P)>| -> (Vec<P>, bool) {
        let mut path = vec![start, first];
        used.insert(edge_key(start, first));
        let mut prev = start;
        let mut cur = first;
        loop {
            let ns = &adj[&cur];
            if ns.len() != 2 {
                return (path, false);
            }
            let next = if ns[0] == prev { ns[1] } else { ns[0] };
            // A chain that comes back to its start is a closed cycle only when
            // the start is itself a degree-2 node. A loop hanging off a
            // junction (the bowl of an e) stays an open chain whose two ends
            // are the junction, so the junction is not simplified away.
            let start_is_cycle_node = adj[&start].len() == 2;
            if used.contains(&edge_key(cur, next)) {
                let closed = next == path[0] && start_is_cycle_node;
                return (path, closed);
            }
            used.insert(edge_key(cur, next));
            path.push(next);
            if next == start {
                return (path, start_is_cycle_node);
            }
            prev = cur;
            cur = next;
        }
    };

    // Open chains start at endpoints and junctions.
    for &n in &nodes {
        let ns = adj[&n].clone();
        if ns.is_empty() {
            paths.push((vec![n], false));
            continue;
        }
        if ns.len() == 2 {
            continue;
        }
        for m in ns {
            if !used.contains(&edge_key(n, m)) {
                paths.push(walk(n, m, &mut used));
            }
        }
    }
    // What is left are cycles of degree-2 nodes.
    for &n in &nodes {
        for m in adj[&n].clone() {
            if !used.contains(&edge_key(n, m)) {
                let (mut p, _) = walk(n, m, &mut used);
                if p.last() == p.first() && p.len() > 1 {
                    p.pop();
                }
                paths.push((p, true));
            }
        }
    }

    paths
        .into_iter()
        .map(|(p, closed)| {
            let pts: Vec<[f32; 2]> = p.iter().map(|&(x, y)| [x as f32 + 0.5, y as f32 + 0.5]).collect();
            smooth(simplify(pts, closed), closed)
        })
        .collect()
}

/// Remove points in the middle of straight runs.
fn simplify(pts: Vec<[f32; 2]>, closed: bool) -> Vec<[f32; 2]> {
    if pts.len() < 3 {
        return pts;
    }
    let n = pts.len();
    let keep = |i: usize| -> bool {
        if !closed && (i == 0 || i == n - 1) {
            return true;
        }
        let a = pts[(i + n - 1) % n];
        let b = pts[i];
        let c = pts[(i + 1) % n];
        let cross = (b[0] - a[0]) * (c[1] - b[1]) - (b[1] - a[1]) * (c[0] - b[0]);
        cross.abs() > 1e-6
    };
    pts.iter().enumerate().filter(|&(i, _)| keep(i)).map(|(_, &p)| p).collect()
}

/// Turn angle at b in degrees (0 = straight on).
fn turn(a: [f32; 2], b: [f32; 2], c: [f32; 2]) -> f32 {
    let (ux, uy) = (b[0] - a[0], b[1] - a[1]);
    let (vx, vy) = (c[0] - b[0], c[1] - b[1]);
    let dot = ux * vx + uy * vy;
    let cross = ux * vy - uy * vx;
    cross.atan2(dot).abs().to_degrees()
}

/// Turns up to this angle are treated as a curve and rounded.
const GENTLE: f32 = 50.0;

/// Chaikin subdivision on runs between sharp corners.
fn smooth(pts: Vec<[f32; 2]>, closed: bool) -> Polyline {
    let n = pts.len();
    if n < 3 {
        return Polyline { points: pts, closed };
    }
    let sharp: Vec<bool> = (0..n)
        .map(|i| {
            if !closed && (i == 0 || i == n - 1) {
                return true;
            }
            turn(pts[(i + n - 1) % n], pts[i], pts[(i + 1) % n]) > GENTLE
        })
        .collect();
    // Split into runs anchored at sharp points.
    let anchors: Vec<usize> = (0..n).filter(|&i| sharp[i]).collect();
    if anchors.is_empty() {
        // A closed curve with no corners (e.g. the letter O).
        let mut p = pts;
        for _ in 0..2 {
            p = chaikin_closed(&p);
        }
        return Polyline { points: p, closed: true };
    }
    let mut out = Vec::new();
    let segs = if closed { anchors.len() } else { anchors.len() - 1 };
    for k in 0..segs {
        let s = anchors[k];
        let e = anchors[(k + 1) % anchors.len()];
        let mut run = vec![pts[s]];
        let mut i = s;
        while i != e {
            i = (i + 1) % n;
            run.push(pts[i]);
        }
        for _ in 0..2 {
            run = chaikin_open(&run);
        }
        if !out.is_empty() {
            run.remove(0);
        }
        out.extend(run);
    }
    if closed && out.len() > 1 && out.first() == out.last() {
        out.pop();
    }
    Polyline { points: out, closed }
}

fn lerp(a: [f32; 2], b: [f32; 2], t: f32) -> [f32; 2] {
    [a[0] + (b[0] - a[0]) * t, a[1] + (b[1] - a[1]) * t]
}

/// One Chaikin step keeping both endpoints.
fn chaikin_open(p: &[[f32; 2]]) -> Vec<[f32; 2]> {
    if p.len() < 3 {
        return p.to_vec();
    }
    let mut out = vec![p[0]];
    for w in p.windows(2) {
        out.push(lerp(w[0], w[1], 0.25));
        out.push(lerp(w[0], w[1], 0.75));
    }
    out[1] = p[0];
    let last = out.len() - 1;
    out[last] = p[p.len() - 1];
    out.dedup();
    out
}

fn chaikin_closed(p: &[[f32; 2]]) -> Vec<[f32; 2]> {
    let n = p.len();
    let mut out = Vec::with_capacity(2 * n);
    for i in 0..n {
        let (a, b) = (p[i], p[(i + 1) % n]);
        out.push(lerp(a, b, 0.25));
        out.push(lerp(a, b, 0.75));
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    fn bmp(rows: &[&str]) -> Bitmap {
        let r: Vec<Vec<bool>> = rows.iter().map(|s| s.chars().map(|c| c == '#').collect()).collect();
        Bitmap::from_rows(&r)
    }

    #[test]
    fn straight_line_is_one_segment() {
        let lines = centerlines(&bmp(&["#####"]));
        assert_eq!(lines.len(), 1);
        assert_eq!(lines[0].points, vec![[0.5, 0.5], [4.5, 0.5]]);
    }

    #[test]
    fn l_corner_stays_sharp() {
        let lines = centerlines(&bmp(&["#...", "#...", "####"]));
        assert_eq!(lines.len(), 1);
        let p = &lines[0].points;
        assert!(p.contains(&[0.5, 2.5]), "corner point kept: {p:?}");
        assert_eq!(p.len(), 3);
    }

    #[test]
    fn diagonal_has_no_triangles() {
        // A staircase of single pixels becomes one chain.
        let lines = centerlines(&bmp(&["#...", ".#..", "..#.", "...#"]));
        assert_eq!(lines.len(), 1);
        assert_eq!(lines[0].points.first(), Some(&[0.5, 0.5]));
        assert_eq!(lines[0].points.last(), Some(&[3.5, 3.5]));
    }

    #[test]
    fn ring_is_closed_and_smooth() {
        let lines = centerlines(&bmp(&[".###.", "#...#", "#...#", "#...#", ".###."]));
        assert_eq!(lines.len(), 1);
        assert!(lines[0].closed);
        assert!(lines[0].points.len() > 8);
    }

    #[test]
    fn letter_e_keeps_its_crossbar() {
        let lines = centerlines(&bmp(&[".###.", "#...#", "#####", "#....", ".###."]));
        let all: Vec<[f32; 2]> = lines.iter().flat_map(|l| l.points.clone()).collect();
        // Both ends of the crossbar and its middle must be covered.
        for p in [[0.5, 2.5], [4.5, 2.5]] {
            assert!(all.contains(&p), "missing {p:?} in {lines:?}");
        }
        let covers_mid = lines.iter().any(|l| {
            l.points.windows(2).any(|w| w[0][1] == 2.5 && w[1][1] == 2.5 && w[0][0].min(w[1][0]) <= 2.5 && w[0][0].max(w[1][0]) >= 2.5)
        });
        assert!(covers_mid, "crossbar segment missing: {lines:?}");
    }

    #[test]
    fn isolated_pixel_is_a_dot() {
        let lines = centerlines(&bmp(&["...", ".#.", "..."]));
        assert_eq!(lines, vec![Polyline { points: vec![[1.5, 1.5]], closed: false }]);
    }
}
