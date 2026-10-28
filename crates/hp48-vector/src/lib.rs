//! Turn the HP48's 1-bit LCD frames into resolution-independent vector scenes.
//!
//! The ROM draws everything (text in its three bitmap fonts, menu labels,
//! plots, icons) as 1-pixel strokes and solid fills. [`vectorize`] splits a
//! frame into
//!
//! * **fills**: dense regions such as inverted menu labels and the cursor,
//!   emitted as rectangles;
//! * **dark strokes**: centrelines through ordinary 1-pixel line art, with
//!   staircases smoothed into curves and real corners kept sharp;
//! * **light strokes**: the same for light pixels enclosed by a fill (the
//!   text of inverted labels);
//! * **text**: with [`vectorize_with`], runs of the 5-pixel minifont (path,
//!   menu labels), recognised so they can be drawn with a real font.
//!
//! Coordinates are in LCD pixels with (0, 0) at the top-left corner of the
//! top-left pixel, so a pixel centre is at (x + 0.5, y + 0.5).

mod bitmap;
mod raster;
mod strokes;
mod text;

pub use bitmap::Bitmap;
pub use raster::render_rgb;
pub use strokes::{centerlines, Polyline};
pub use text::{Glyph, MiniFont, Text};

/// A filled axis-aligned rectangle in pixel units.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Rect {
    pub x: f32,
    pub y: f32,
    pub w: f32,
    pub h: f32,
}

/// A round dot: centre and radius in pixel units.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Dot {
    pub x: f32,
    pub y: f32,
    pub r: f32,
}

#[derive(Clone, Debug, Default)]
pub struct Scene {
    pub fills: Vec<Rect>,
    /// 2x2 pixel blocks (the dots of `:` `.` `;`), drawn round.
    pub dots: Vec<Dot>,
    pub dark: Vec<Polyline>,
    pub light: Vec<Polyline>,
    /// Minifont text, drawn with a font instead of strokes.
    pub text: Vec<Text>,
}

/// Components at least this many pixels in both directions whose bounding
/// box is mostly ink are drawn as fills.
const FILL_MIN_SIDE: usize = 4;
const FILL_MIN_DENSITY: f32 = 0.55;
/// Small shapes (cursor, arrows) are fills at a lower density.
const SMALL_SIDE: usize = 7;
const SMALL_MIN_DENSITY: f32 = 0.45;
const SMALL_MIN_PIXELS: usize = 6;

pub fn vectorize(bmp: &Bitmap) -> Scene {
    vectorize_with(bmp, None)
}

/// [`vectorize`], also recognising text in `font`. Recognised dark glyphs
/// are left out of the strokes, and light ones are filled in, so their
/// label becomes a plain fill under the text.
pub fn vectorize_with(bmp: &Bitmap, font: Option<&MiniFont>) -> Scene {
    let mut scene = Scene::default();
    let mut rest;
    let bmp = match font {
        Some(font) => {
            rest = bmp.clone();
            for (t, ink) in font.find_ink(bmp) {
                for (x, y) in ink {
                    rest.set(x, y, t.light);
                }
                scene.text.push(t);
            }
            &rest
        }
        None => bmp,
    };
    let mut line_art = Bitmap::new(bmp.w, bmp.h);
    for comp in bmp.components() {
        let (x0, y0, x1, y1) = comp.bbox;
        let (w, h) = (x1 - x0 + 1, y1 - y0 + 1);
        let n = comp.pixels.len();
        let density = n as f32 / (w * h) as f32;
        if w == 2 && h == 2 && n == 4 {
            scene.dots.push(Dot { x: x0 as f32 + 1.0, y: y0 as f32 + 1.0, r: 1.0 });
            continue;
        }
        let big = w >= FILL_MIN_SIDE && h >= FILL_MIN_SIDE && density >= FILL_MIN_DENSITY;
        let small = w <= SMALL_SIDE && h <= SMALL_SIDE && w >= 3 && h >= 3
            && n >= SMALL_MIN_PIXELS && density >= SMALL_MIN_DENSITY;
        if big || small {
            let mut solid = Bitmap::new(bmp.w, bmp.h);
            for &(x, y) in &comp.pixels {
                solid.set(x, y, true);
            }
            scene.fills.extend(solid.rectangles());
            // Light pixels enclosed by the fill: the text of inverted labels.
            // Ink belonging to other components inside (the middle of an
            // inverted O) is not part of the hole; it is drawn on its own.
            let mut holes = solid.surrounded_holes(x0, y0, x1, y1);
            for y in y0..=y1 {
                for x in x0..=x1 {
                    if bmp.get(x, y) {
                        holes.set(x, y, false);
                    }
                }
            }
            scene.light.extend(centerlines(&holes));
        } else {
            for &(x, y) in &comp.pixels {
                line_art.set(x, y, true);
            }
        }
    }
    scene.dark = centerlines(&line_art);
    scene
}

impl Scene {
    /// Render as an SVG document, `scale` output units per LCD pixel.
    pub fn to_svg(&self, w: usize, h: usize, scale: f32, stroke: f32) -> String {
        use std::fmt::Write;
        let mut s = String::new();
        let _ = writeln!(
            s,
            r##"<svg xmlns="http://www.w3.org/2000/svg" width="{}" height="{}" viewBox="0 0 {w} {h}">"##,
            w as f32 * scale,
            h as f32 * scale
        );
        let _ = writeln!(s, r##"<rect width="{w}" height="{h}" fill="#bcc6a9"/>"##);
        for r in &self.fills {
            let _ = writeln!(s, r##"<rect x="{}" y="{}" width="{}" height="{}" fill="#1e241c"/>"##, r.x, r.y, r.w, r.h);
        }
        for d in &self.dots {
            let _ = writeln!(s, r##"<circle cx="{}" cy="{}" r="{}" fill="#1e241c"/>"##, d.x, d.y, d.r);
        }
        for (lines, color) in [(&self.dark, "#1e241c"), (&self.light, "#bcc6a9")] {
            let _ = write!(
                s,
                r##"<g fill="none" stroke="{color}" stroke-width="{stroke}" stroke-linecap="round" stroke-linejoin="round">"##
            );
            for pl in lines.iter() {
                s.push_str("<path d=\"");
                for (i, p) in pl.points.iter().enumerate() {
                    let _ = write!(s, "{}{:.3} {:.3}", if i == 0 { "M" } else { " L" }, p[0], p[1]);
                }
                if pl.closed {
                    s.push_str(" Z");
                }
                s.push_str("\"/>");
            }
            s.push_str("</g>\n");
        }
        for t in &self.text {
            let color = if t.light { "#bcc6a9" } else { "#1e241c" };
            let text = t.text.replace('&', "&amp;").replace('<', "&lt;").replace('>', "&gt;");
            let _ = writeln!(
                s,
                r##"<text x="{}" y="{}" textLength="{}" font-family="DejaVu Sans Condensed, sans-serif" font-weight="bold" font-size="{}" text-anchor="middle" fill="{color}" xml:space="preserve">{text}</text>"##,
                t.x + t.w / 2.0,
                t.y + 5.0,
                t.w,
                5.0 / 0.73,
            );
        }
        s.push_str("</svg>\n");
        s
    }
}
