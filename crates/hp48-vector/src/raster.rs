//! Software rasteriser for scenes: anti-aliased round-capped strokes and
//! rectangles, for high-resolution exports and tests.

use crate::Scene;

/// Render `scene` (LCD size `w` x `h` pixels) at `scale` output pixels per
/// LCD pixel. Returns RGB8 data, row-major.
pub fn render_rgb(scene: &Scene, w: usize, h: usize, scale: f32, stroke: f32, bg: [u8; 3], ink: [u8; 3]) -> (usize, usize, Vec<u8>) {
    let (ow, oh) = ((w as f32 * scale).round() as usize, (h as f32 * scale).round() as usize);
    // Coverage of ink per output pixel, 0..1.
    let mut cov = vec![0f32; ow * oh];
    let paint = |cov: &mut Vec<f32>, x: usize, y: usize, a: f32, ink_on: bool| {
        let c = &mut cov[y * ow + x];
        if ink_on {
            *c = c.max(a);
        } else {
            *c = c.min(1.0 - a);
        }
    };
    for r in &scene.fills {
        let (x0, y0) = ((r.x * scale) as usize, (r.y * scale) as usize);
        let (x1, y1) = (((r.x + r.w) * scale).ceil() as usize, ((r.y + r.h) * scale).ceil() as usize);
        for y in y0..y1.min(oh) {
            for x in x0..x1.min(ow) {
                paint(&mut cov, x, y, 1.0, true);
            }
        }
    }
    for d in &scene.dots {
        let (cx, cy, r) = (d.x * scale, d.y * scale, d.r * scale);
        let (x0, y0) = ((cx - r - 1.0).max(0.0) as usize, (cy - r - 1.0).max(0.0) as usize);
        for y in y0..((cy + r + 1.0) as usize).min(oh) {
            for x in x0..((cx + r + 1.0) as usize).min(ow) {
                let d = ((x as f32 + 0.5 - cx).powi(2) + (y as f32 + 0.5 - cy).powi(2)).sqrt();
                let a = (r + 0.5 - d).clamp(0.0, 1.0);
                if a > 0.0 {
                    paint(&mut cov, x, y, a, true);
                }
            }
        }
    }
    let half = stroke * scale / 2.0;
    for (lines, ink_on) in [(&scene.dark, true), (&scene.light, false)] {
        for pl in lines.iter() {
            let pts: Vec<[f32; 2]> = pl.points.iter().map(|p| [p[0] * scale, p[1] * scale]).collect();
            let mut segs: Vec<([f32; 2], [f32; 2])> = pts.windows(2).map(|w| (w[0], w[1])).collect();
            if pl.closed && pts.len() > 2 {
                segs.push((pts[pts.len() - 1], pts[0]));
            }
            if pts.len() == 1 {
                segs.push((pts[0], pts[0]));
            }
            for (a, b) in segs {
                let minx = (a[0].min(b[0]) - half - 1.0).max(0.0) as usize;
                let maxx = ((a[0].max(b[0]) + half + 1.0) as usize).min(ow.saturating_sub(1));
                let miny = (a[1].min(b[1]) - half - 1.0).max(0.0) as usize;
                let maxy = ((a[1].max(b[1]) + half + 1.0) as usize).min(oh.saturating_sub(1));
                for y in miny..=maxy {
                    for x in minx..=maxx {
                        let p = [x as f32 + 0.5, y as f32 + 0.5];
                        let d = seg_dist(p, a, b);
                        let alpha = (half + 0.5 - d).clamp(0.0, 1.0);
                        if alpha > 0.0 {
                            paint(&mut cov, x, y, alpha, ink_on);
                        }
                    }
                }
            }
        }
    }
    let mut out = Vec::with_capacity(ow * oh * 3);
    for c in cov {
        for k in 0..3 {
            out.push((bg[k] as f32 + (ink[k] as f32 - bg[k] as f32) * c).round() as u8);
        }
    }
    (ow, oh, out)
}

fn seg_dist(p: [f32; 2], a: [f32; 2], b: [f32; 2]) -> f32 {
    let (abx, aby) = (b[0] - a[0], b[1] - a[1]);
    let (apx, apy) = (p[0] - a[0], p[1] - a[1]);
    let len2 = abx * abx + aby * aby;
    let t = if len2 > 0.0 { ((apx * abx + apy * aby) / len2).clamp(0.0, 1.0) } else { 0.0 };
    let (dx, dy) = (apx - t * abx, apy - t * aby);
    (dx * dx + dy * dy).sqrt()
}
