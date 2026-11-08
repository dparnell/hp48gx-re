//! Equation Library pictures redrawn as vector art.
//!
//! The ROM holds these pictures as bitmaps of at most about 120x53 pixels
//! and copies them to the LCD (`~PCunpack XYGROBDISP`), so nothing in it can
//! draw them larger. The art here is drawn in the bitmap's place instead, at
//! the window's resolution. The ROM is left alone: it still draws its bitmap,
//! so `→PICT` and SOLVEQN behave as before. Its picture viewer also sends the
//! grob to the hi-res display (`hp48::hires`), which is how the app knows to
//! draw this art. A picture that reaches the LCD another way (PICT, with the
//! PICTURE cursor on it) isn't sent, and shows as traced pixels, and so does
//! every picture on a ROM without that word, such as the original.
//!
//! Coordinates are in the bitmap's pixels: pixel (x, y) covers x..x+1, y..y+1.
//! The tests hold the art to the bitmap, so a drawing can't drift from what
//! the ROM shows or leave part of it out.
//!
//! The pictures are in a file per subject, named as the ROM names them
//! (`EqPicElasticBuckling` in `firmware/upper/F3F3C-lib0E2.s` is
//! `ElasticBuckling`), with the drawing helpers they share here.
//! `hp48-app --diagram NAME --screenshot OUT.png` draws one of them whatever
//! the calculator shows, and `--diagram-under` adds its bitmap, faintly.

mod circuits;
mod columns;
mod devices;
mod electricity;
mod fluids;
mod forces;
mod gases;
mod heat;
mod magnetism;
mod motion;
mod optics;
mod oscillations;
mod plane;
mod solid;
mod stress;

use crate::{draw_polyline, CAP, CAP_TOP, LCD_BG, LCD_INK};
use eframe::egui::{self, Color32, FontId, Pos2, Stroke};
use hp48::hires::{Content, Item};
use hp48::{LCD_HEIGHT, LCD_WIDTH};
use hp48_vector::Polyline;

/// LCD rows above the menu, the area a picture is fitted to.
pub const AREA_ROWS: usize = 56;
/// Stroke width of thin lines, in bitmap pixels.
const LINE: f32 = 0.7;

enum Shape {
    Stroke(Polyline),
    /// A convex polygon, filled with ink or with the LCD's background.
    Fill { points: Vec<[f32; 2]>, light: bool },
    /// Text in the box `x`..`x + w`, standing on `baseline`, its capitals
    /// `cap` tall.
    Text { text: &'static str, x: f32, w: f32, baseline: f32, cap: f32 },
}

pub struct Diagram {
    /// The ROM's name for the picture, without `EqPic`.
    pub name: &'static str,
    /// Where the ROM puts the bitmap, and the bitmap by rows.
    x: usize,
    y: usize,
    bitmap: Vec<Vec<bool>>,
    /// `hp48::hires::hash` of the bitmap.
    hash: u64,
    shapes: Vec<Shape>,
}

impl Diagram {
    /// The art for the picture `name`, which the ROM puts at (`x`, `y`).
    fn new(name: &'static str, x: usize, y: usize, png: &[u8], shapes: Vec<Shape>) -> Self {
        let bitmap = decode(png);
        Diagram { name, x, y, hash: hp48::hires::hash(&bitmap), bitmap, shapes }
    }

    fn size(&self) -> (usize, usize) {
        (self.bitmap[0].len(), self.bitmap.len())
    }

    /// Whether this is the picture on the hi-res display.
    pub fn is(&self, item: &Item) -> bool {
        item.content == Content::Grob && item.hash == self.hash && (item.x, item.y) == (self.x, self.y)
    }

    /// Whether the LCD shows this picture and nothing else above the menu.
    pub fn shown_on(&self, lcd: &[[bool; LCD_WIDTH]; LCD_HEIGHT]) -> bool {
        let (w, h) = self.size();
        lcd[..AREA_ROWS].iter().enumerate().all(|(y, row)| {
            row.iter().enumerate().all(|(x, &on)| {
                let inside = (self.x..self.x + w).contains(&x) && (self.y..self.y + h).contains(&y);
                on == (inside && self.bitmap[y - self.y][x - self.x])
            })
        })
    }

    /// Remove the picture from the LCD's pixels.
    pub fn erase(&self, lcd: &mut [[bool; LCD_WIDTH]; LCD_HEIGHT]) {
        lcd[..AREA_ROWS].iter_mut().for_each(|row| row.fill(false));
    }

    /// Draw the picture as large as it fits above the menu. `pt` maps LCD
    /// pixels to the screen, and `pixel` is an LCD pixel's size on it.
    pub fn draw(&self, painter: &egui::Painter, pt: &dyn Fn(f32, f32) -> Pos2, pixel: f32) {
        let (left, top, scale) = self.place();
        let at = |x: f32, y: f32| pt(left + x * scale, top + y * scale);
        let unit = pixel * scale;
        for shape in &self.shapes {
            match shape {
                Shape::Stroke(line) => draw_polyline(painter, line, LINE * unit, LCD_INK, &at),
                Shape::Fill { points, light } => {
                    let points = points.iter().map(|p| at(p[0], p[1])).collect();
                    let color = if *light { LCD_BG } else { LCD_INK };
                    painter.add(egui::Shape::convex_polygon(points, color, Stroke::NONE));
                }
                Shape::Text { text, x, w, baseline, cap } => {
                    draw_text(painter, text, at(*x, *baseline), w * unit, cap * unit);
                }
            }
        }
    }
}

impl Diagram {
    /// Where the picture goes, in LCD pixels: its left and top, and how many
    /// LCD pixels a bitmap pixel takes.
    fn place(&self) -> (f32, f32, f32) {
        let (w, h) = self.size();
        let (w, h) = (w as f32, h as f32);
        let (area_w, area_h) = (LCD_WIDTH as f32, AREA_ROWS as f32);
        let scale = ((area_w - 2.0) / w).min((area_h - 2.0) / h);
        ((area_w - w * scale) / 2.0, (area_h - h * scale) / 2.0, scale)
    }

    /// Debug: the bitmap, faintly, where the art goes.
    pub fn draw_bitmap(&self, painter: &egui::Painter, pt: &dyn Fn(f32, f32) -> Pos2) {
        let (left, top, scale) = self.place();
        let faint = Color32::from_rgba_unmultiplied(255, 0, 0, 70);
        for (y, row) in self.bitmap.iter().enumerate() {
            for (x, _) in row.iter().enumerate().filter(|(_, &on)| on) {
                let (x, y) = (x as f32, y as f32);
                let r = egui::Rect::from_min_max(pt(left + x * scale, top + y * scale), pt(left + (x + 1.0) * scale, top + (y + 1.0) * scale));
                painter.rect_filled(r, 0.0, faint);
            }
        }
    }
}

/// Text centred in a box of width `room`, standing on `corner`, the box's
/// lower left corner. It shrinks to fit.
fn draw_text(painter: &egui::Painter, text: &str, corner: Pos2, room: f32, cap: f32) {
    let layout = |size: f32| painter.layout_no_wrap(text.to_string(), FontId::proportional(size), LCD_INK);
    let mut size = cap / CAP;
    let mut galley = layout(size);
    if galley.size().x > room {
        size *= room / galley.size().x;
        galley = layout(size);
    }
    let pos = Pos2::new(corner.x + (room - galley.size().x) / 2.0, corner.y - (CAP + CAP_TOP) * size);
    painter.galley(pos, galley, Color32::PLACEHOLDER);
}

/// The bitmap's dark pixels. `firmware/images` has them as 8-bit grayscale.
fn decode(png: &[u8]) -> Vec<Vec<bool>> {
    let mut reader = png::Decoder::new(std::io::Cursor::new(png)).read_info().expect("picture PNG");
    let mut data = vec![0; reader.output_buffer_size().expect("picture size")];
    let info = reader.next_frame(&mut data).expect("picture PNG");
    data[..info.buffer_size()].chunks(info.line_size).map(|row| row.iter().map(|&v| v == 0).collect()).collect()
}

// Drawing helpers.

fn line(points: &[[f32; 2]]) -> Shape {
    Shape::Stroke(Polyline { points: points.to_vec(), closed: false })
}

fn fill(points: &[[f32; 2]]) -> Shape {
    Shape::Fill { points: points.to_vec(), light: false }
}

fn rect(x0: f32, y0: f32, x1: f32, y1: f32) -> Shape {
    fill(&[[x0, y0], [x1, y0], [x1, y1], [x0, y1]])
}

/// A line with a filled arrowhead at `tip`, the line coming from `from`.
fn arrow(from: [f32; 2], tip: [f32; 2]) -> Vec<Shape> {
    let (dx, dy) = (tip[0] - from[0], tip[1] - from[1]);
    let len = dx.hypot(dy);
    let (ux, uy) = (dx / len, dy / len);
    let (bx, by) = (tip[0] - 3.0 * ux, tip[1] - 3.0 * uy);
    vec![line(&[from, [bx, by]]), fill(&[tip, [bx - 1.6 * uy, by + 1.6 * ux], [bx + 1.6 * uy, by - 1.6 * ux]])]
}

/// An open line along an ellipse centred on (`cx`, `cy`), from angle `from`
/// to `to` in degrees: 0 points right and 90 down (y grows down).
fn arc(cx: f32, cy: f32, rx: f32, ry: f32, from: f32, to: f32) -> Shape {
    Shape::Stroke(Polyline { points: arc_points(cx, cy, rx, ry, from, to), closed: false })
}

fn arc_points(cx: f32, cy: f32, rx: f32, ry: f32, from: f32, to: f32) -> Vec<[f32; 2]> {
    let steps = (((to - from).abs() / 360.0) * 48.0).ceil().max(2.0) as usize;
    (0..=steps)
        .map(|i| {
            let a = (from + (to - from) * i as f32 / steps as f32).to_radians();
            [cx + rx * a.cos(), cy + ry * a.sin()]
        })
        .collect()
}

/// A whole ellipse, as a closed line.
fn ellipse(cx: f32, cy: f32, rx: f32, ry: f32) -> Shape {
    let mut points = arc_points(cx, cy, rx, ry, 0.0, 360.0);
    points.pop();
    Shape::Stroke(Polyline { points, closed: true })
}

/// A circle, as a closed line.
fn circle(cx: f32, cy: f32, r: f32) -> Shape {
    ellipse(cx, cy, r, r)
}

/// A filled dot.
fn dot(cx: f32, cy: f32, r: f32) -> Shape {
    let mut points = arc_points(cx, cy, r, r, 0.0, 360.0);
    points.pop();
    fill(&points)
}

/// A closed line through the points.
fn closed(points: &[[f32; 2]]) -> Shape {
    Shape::Stroke(Polyline { points: points.to_vec(), closed: true })
}

/// Text centred in the box `x`..`x + w`, standing on `baseline`, its
/// capitals `cap` tall. It shrinks to fit the box.
fn text(text: &'static str, x: f32, w: f32, baseline: f32, cap: f32) -> Shape {
    Shape::Text { text, x, w, baseline, cap }
}

/// A dashed horizontal line: dashes of 3 pixels, gaps of 2.
fn dashes(x0: f32, x1: f32, y: f32) -> Vec<Shape> {
    let mut shapes = Vec::new();
    let mut x = x0;
    while x < x1 {
        shapes.push(line(&[[x + 0.3, y], [(x + 2.7).min(x1 - 0.3), y]]));
        x += 5.0;
    }
    shapes
}

/// A wall: a line from `from` to `to` with hatching on one side, offset by
/// (`dx`, `dy`) from the line.
fn wall(from: [f32; 2], to: [f32; 2], dx: f32, dy: f32) -> Vec<Shape> {
    let mut shapes = vec![line(&[from, to])];
    // The ticks lean along the wall: start them so that all end within it.
    let (wx, wy) = (to[0] - from[0], to[1] - from[1]);
    let lean = (dx * wx + dy * wy) / (wx * wx + wy * wy);
    let (first, last) = ((-lean).max(0.0), 1.0 - lean.max(0.0));
    let ticks = 5;
    for i in 0..ticks {
        let t = first + (last - first) * i as f32 / (ticks - 1) as f32;
        let p = [from[0] + wx * t, from[1] + wy * t];
        shapes.push(line(&[p, [p[0] + dx, p[1] + dy]]));
    }
    shapes
}

/// A pin: a ring, with the LCD's background inside.
fn pin(x: f32, y: f32) -> Vec<Shape> {
    let r = 1.3;
    let points: Vec<[f32; 2]> = (0..24)
        .map(|i| {
            let a = i as f32 * std::f32::consts::TAU / 24.0;
            [x + r * a.cos(), y + r * a.sin()]
        })
        .collect();
    vec![Shape::Fill { points: points.clone(), light: true }, Shape::Stroke(Polyline { points, closed: true })]
}

/// Every picture with art, by subject.
pub fn all() -> Vec<Diagram> {
    [
        columns::all(),
        circuits::all(),
        electricity::all(),
        fluids::all(),
        forces::all(),
        gases::all(),
        heat::all(),
        magnetism::all(),
        motion::all(),
        optics::all(),
        oscillations::all(),
        plane::all(),
        solid::all(),
        devices::all(),
        stress::all(),
    ]
    .into_iter()
    .flatten()
    .collect()
}

#[cfg(test)]
mod tests {
    use super::*;
    use hp48::{Key, CPU_HZ};

    /// How far art may stray from the bitmap's ink, in pixels. Art is smooth
    /// where the bitmap has stairs and hatching, so it can't follow it exactly.
    const SLACK: f32 = 2.0;

    /// Points along a polyline, about a quarter of a pixel apart.
    fn along(points: &[[f32; 2]], closed: bool) -> Vec<[f32; 2]> {
        let mut out = vec![points[0]];
        let last = points.len() - usize::from(!closed);
        for i in 0..last {
            let (a, b) = (points[i], points[(i + 1) % points.len()]);
            let steps = ((b[0] - a[0]).hypot(b[1] - a[1]) * 4.0).ceil().max(1.0) as usize;
            for s in 1..=steps {
                let t = s as f32 / steps as f32;
                out.push([a[0] + (b[0] - a[0]) * t, a[1] + (b[1] - a[1]) * t]);
            }
        }
        out
    }

    /// The ink of everything but text, as points.
    fn ink(d: &Diagram) -> Vec<[f32; 2]> {
        let mut out = Vec::new();
        for shape in &d.shapes {
            match shape {
                Shape::Stroke(l) => out.extend(along(&l.points, l.closed)),
                Shape::Fill { points, light: false } => {
                    out.extend(along(points, true));
                    out.extend(inside(points));
                }
                _ => {}
            }
        }
        out
    }

    /// Points inside a convex polygon, half a pixel apart.
    fn inside(points: &[[f32; 2]]) -> Vec<[f32; 2]> {
        let (mut lo, mut hi) = ([f32::MAX; 2], [f32::MIN; 2]);
        for p in points {
            for i in 0..2 {
                lo[i] = lo[i].min(p[i]);
                hi[i] = hi[i].max(p[i]);
            }
        }
        // Inside: on the same side of every edge.
        let side = |q: [f32; 2], i: usize| {
            let (a, b) = (points[i], points[(i + 1) % points.len()]);
            (b[0] - a[0]) * (q[1] - a[1]) - (b[1] - a[1]) * (q[0] - a[0])
        };
        let within = |q: [f32; 2]| {
            let sides: Vec<f32> = (0..points.len()).map(|i| side(q, i)).collect();
            sides.iter().all(|&v| v >= 0.0) || sides.iter().all(|&v| v <= 0.0)
        };
        let mut out = Vec::new();
        let mut y = lo[1];
        while y <= hi[1] {
            let mut x = lo[0];
            while x <= hi[0] {
                if within([x, y]) {
                    out.push([x, y]);
                }
                x += 0.5;
            }
            y += 0.5;
        }
        out
    }

    fn near(a: [f32; 2], b: [f32; 2]) -> bool {
        (a[0] - b[0]).hypot(a[1] - b[1]) <= SLACK
    }

    fn dark_pixels(d: &Diagram) -> Vec<[f32; 2]> {
        let mut out = Vec::new();
        for (y, row) in d.bitmap.iter().enumerate() {
            for (x, &on) in row.iter().enumerate() {
                if on {
                    out.push([x as f32 + 0.5, y as f32 + 0.5]);
                }
            }
        }
        out
    }

    /// Fails with every problem `check` finds, by picture. `DIAGRAM=NAME`
    /// checks only that picture.
    fn each(check: impl Fn(&Diagram) -> Option<String>) {
        let only = std::env::var("DIAGRAM").ok();
        let wanted = |d: &&Diagram| only.as_deref().is_none_or(|name| name == d.name);
        let problems: Vec<String> = all().iter().filter(wanted).filter_map(|d| check(d).map(|p| format!("{}: {p}", d.name))).collect();
        assert!(problems.is_empty(), "{}", problems.join("\n"));
    }

    /// The Equation Library's pictures in the firmware source: each label
    /// `EqPicName:` and the position on the line after it, `{ BINTx BINTy`.
    fn rom_pictures() -> Vec<(String, usize, usize)> {
        let dir = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("../../firmware/upper");
        let mut found = Vec::new();
        for entry in std::fs::read_dir(dir).expect("firmware/upper") {
            let path = entry.unwrap().path();
            if !path.to_string_lossy().ends_with("-lib0E2.s") {
                continue;
            }
            let source = std::fs::read_to_string(&path).unwrap();
            let mut lines = source.lines();
            while let Some(line) = lines.next() {
                let Some(name) = line.strip_prefix("EqPic").and_then(|rest| rest.strip_suffix(':')) else { continue };
                let words: Vec<&str> = lines.next().unwrap().split_whitespace().collect();
                let bint = |word: &str| word.strip_prefix("BINT").and_then(|n| n.parse().ok()).unwrap_or_else(|| panic!("{name}: {word}"));
                assert_eq!(words[0], "{", "{name}");
                found.push((name.to_string(), bint(words[1]), bint(words[2])));
            }
        }
        found
    }

    #[test]
    fn every_picture_has_art_where_the_rom_puts_it() {
        let rom = rom_pictures();
        assert_eq!(rom.len(), 63);
        let art = all();
        let missing: Vec<_> = rom.iter().filter(|(name, ..)| !art.iter().any(|d| d.name == name)).map(|p| &p.0).collect();
        assert!(missing.is_empty(), "no art for {missing:?}");
        for d in &art {
            let place = rom.iter().find(|(name, ..)| name == d.name).map(|&(_, x, y)| (x, y));
            assert_eq!(place, Some((d.x, d.y)), "{}", d.name);
        }
    }

    #[test]
    fn names_are_unique() {
        let mut names: Vec<_> = all().iter().map(|d| d.name).collect();
        names.sort_unstable();
        let count = names.len();
        names.dedup();
        assert_eq!(names.len(), count);
    }

    #[test]
    fn art_lies_on_the_bitmap() {
        each(|d| {
            let dark = dark_pixels(d);
            let stray: Vec<_> = ink(d).into_iter().filter(|&p| !dark.iter().any(|&q| near(p, q))).collect();
            (!stray.is_empty()).then(|| format!("{} points of art with no ink near them in the bitmap, first {:?}", stray.len(), stray[0]))
        });
    }

    #[test]
    fn art_covers_the_bitmap() {
        each(|d| {
            let art = ink(d);
            let in_text = |p: [f32; 2]| {
                d.shapes.iter().any(|s| match s {
                    Shape::Text { x, w, baseline, cap, .. } => {
                        (*x - 1.0..x + w + 1.0).contains(&p[0]) && (baseline - cap - 1.0..baseline + 1.0).contains(&p[1])
                    }
                    _ => false,
                })
            };
            let missed: Vec<_> = dark_pixels(d).into_iter().filter(|&p| !in_text(p) && !art.iter().any(|&q| near(p, q))).collect();
            (!missed.is_empty()).then(|| format!("{} bitmap pixels not in the art, first {:?}", missed.len(), missed[0]))
        });
    }

    /// An LCD showing the picture over a menu.
    fn lcd(d: &Diagram) -> [[bool; LCD_WIDTH]; LCD_HEIGHT] {
        let mut lcd = [[false; LCD_WIDTH]; LCD_HEIGHT];
        for (y, row) in d.bitmap.iter().enumerate() {
            for (x, &on) in row.iter().enumerate() {
                lcd[d.y + y][d.x + x] = on;
            }
        }
        lcd[AREA_ROWS..].iter_mut().for_each(|row| row.fill(true));
        lcd
    }

    #[test]
    fn recognises_the_picture_alone() {
        each(|d| {
            let shown = lcd(d);
            let (w, h) = d.size();
            let mut inside = shown;
            inside[d.y + h / 2][d.x + w / 2] ^= true;
            let mut beside = shown;
            beside[55][130] = true;
            if !d.shown_on(&shown) {
                Some("not recognised".to_string())
            } else if d.shown_on(&inside) {
                Some("recognised with a changed pixel inside".to_string())
            } else if d.shown_on(&beside) {
                Some("recognised with something else above the menu".to_string())
            } else {
                None
            }
        });
    }

    /// A booted machine, with or without the
    /// natives and the translated code. None without the ROM.
    fn machine(natives: bool) -> Option<hp48::Machine> {
        let rom = std::fs::read(hp48::default_rom_path()).ok()?;
        let mut m = hp48::Machine::new(&rom);
        if natives {
            hp48::hle::install(&mut m);
            hp48_rom::install(&mut m);
        }
        m.run(3 * CPU_HZ);
        m.tap(Key::F); // "Try To Recover Memory?" NO
        m.run(4 * CPU_HZ);
        Some(m)
    }

    /// The pictures on the hi-res display of a machine, without menu labels.
    fn pictures(m: &hp48::Machine) -> impl Iterator<Item = &Item> {
        m.hw.hires.on_lcd().filter(|item| item.y < AREA_ROWS && item.content == Content::Grob)
    }

    fn enter_line(m: &mut hp48::Machine, line: &str) {
        m.type_text(line).unwrap();
        m.tap(Key::Enter);
        m.run(2 * CPU_HZ);
    }

    #[test]
    fn the_viewer_sends_the_picture_it_draws() {
        for natives in [false, true] {
            let Some(mut m) = machine(natives) else { return };
            enter_line(&mut m, "EQNLIB");
            for key in [Key::Enter, Key::Enter] {
                m.tap(key);
                m.run(2 * CPU_HZ);
            }
            assert!(!pictures(&m).any(|_| true), "no picture before the picture");
            m.tap(Key::D); // PIC
            m.run(2 * CPU_HZ);
            let d = all().into_iter().find(|d| d.name == "ElasticBuckling").unwrap();
            let lcd = m.sync_hires();
            let item = pictures(&m).next().expect("the viewer sent the picture");
            assert!(d.is(item));
            assert_eq!(item.rows, d.bitmap);
            assert!(d.shown_on(&lcd.pixels));
            m.tap(Key::C); // VARS: the picture goes
            m.run(2 * CPU_HZ);
            m.sync_hires();
            assert!(!pictures(&m).any(|_| true), "the LCD changed, so the item went");
        }
    }

    /// The rows of text on the hi-res display that have reached the LCD.
    fn text_rows(m: &mut hp48::Machine) -> Vec<String> {
        m.sync_hires();
        let row = |item: &Item| match &item.content {
            Content::Row { text } => Some(String::from_utf8_lossy(text).into_owned()),
            _ => None,
        };
        m.hw.hires.on_lcd().filter_map(row).collect()
    }

    fn labels(m: &mut hp48::Machine) -> Vec<String> {
        m.sync_hires();
        let label = |item: &Item| match &item.content {
            Content::Label { text, .. } => Some(String::from_utf8_lossy(text).into_owned()),
            _ => None,
        };
        m.hw.hires.on_lcd().filter_map(label).collect()
    }

    #[test]
    fn stack_levels_and_menu_labels_are_sent_as_text() {
        for natives in [false, true] {
            let Some(mut m) = machine(natives) else { return };
            enter_line(&mut m, "1.5 'abc' STO 7");
            m.tap(Key::Var);
            m.run(2 * CPU_HZ);
            let rows = text_rows(&mut m);
            assert!(rows.iter().any(|r| r.starts_with("1:") && r.ends_with('7')), "{rows:?}");
            let shown = labels(&mut m);
            assert!(shown.iter().any(|l| l == "abc"), "lower case stays: {shown:?}");
        }
    }

    #[test]
    fn stack_rows_survive_the_scroll_when_editing_starts() {
        for natives in [false, true] {
            let Some(mut m) = machine(natives) else { return };
            enter_line(&mut m, "1 2 3 4");
            assert_eq!(text_rows(&mut m).len(), 4);
            m.tap(Key::N5);
            m.run(CPU_HZ);
            let rows = text_rows(&mut m);
            assert_eq!(rows.len(), 3, "the top level has gone: {rows:?}");
            assert!(rows.iter().any(|r| r.starts_with("1:") && r.ends_with('4')), "{rows:?}");
            m.tap(Key::Enter);
            m.run(CPU_HZ);
            let rows = text_rows(&mut m);
            assert_eq!(rows.len(), 4, "{rows:?}");
            assert!(rows.iter().any(|r| r.starts_with("1:") && r.ends_with('5')), "{rows:?}");
        }
    }

    #[test]
    fn rows_come_back_when_the_interactive_stack_moves_on() {
        let Some(mut m) = machine(true) else { return };
        enter_line(&mut m, "1 2 3 4");
        for _ in 0..2 {
            m.tap(Key::Up);
            m.run(CPU_HZ);
        }
        // The marker has passed level 1, and now sits on level 2.
        let rows = text_rows(&mut m);
        assert!(rows.iter().any(|r| r.starts_with("1:")), "{rows:?}");
        assert!(!rows.iter().any(|r| r.starts_with("2:")), "the marker's row is on the LCD: {rows:?}");
    }

    /// The text of the edit line's rows on the hi-res display.
    fn edit_rows(m: &mut hp48::Machine) -> Vec<String> {
        m.sync_hires();
        let row = |item: &Item| match &item.content {
            Content::Edit { text } => Some(String::from_utf8_lossy(text).trim_end().to_string()),
            _ => None,
        };
        m.hw.hires.on_lcd().filter_map(row).collect()
    }

    fn tap_all(m: &mut hp48::Machine, keys: &[Key]) {
        for &key in keys {
            m.tap(key);
        }
        m.run(CPU_HZ / 2);
    }

    #[test]
    fn the_edit_line_follows_typing_and_deleting() {
        for natives in [false, true] {
            let Some(mut m) = machine(natives) else { return };
            tap_all(&mut m, &[Key::N1, Key::N2, Key::N3]);
            assert_eq!(edit_rows(&mut m), ["123"]);
            tap_all(&mut m, &[Key::Backspace]);
            assert_eq!(edit_rows(&mut m), ["12"]);
            tap_all(&mut m, &[Key::Left, Key::N9]);
            assert_eq!(edit_rows(&mut m), ["192"], "inserted before the 2");
            tap_all(&mut m, &[Key::Enter]);
            assert!(edit_rows(&mut m).is_empty(), "the row is the stack's again");
        }
    }

    #[test]
    fn the_blinking_cursor_leaves_the_edit_row_on_the_display() {
        let Some(mut m) = machine(true) else { return };
        tap_all(&mut m, &[Key::N1, Key::N2]);
        let (mut on, mut off) = (0, 0);
        for _ in 0..40 {
            m.run(CPU_HZ / 10);
            m.sync_hires();
            let item = m.hw.hires.on_lcd().find(|i| matches!(i.content, Content::Edit { .. })).expect("the row stays");
            match item.cursor {
                Some(cursor) => {
                    assert_eq!(cursor.column, 2);
                    on += 1;
                }
                None => off += 1,
            }
        }
        assert!(on > 0 && off > 0, "it blinks: on {on}, off {off}");
    }

    #[test]
    fn a_long_edit_stays_on_the_display() {
        let Some(mut m) = machine(true) else { return };
        // Long enough to scroll sideways.
        m.type_text("1234567890123456789012345678").unwrap();
        m.run(CPU_HZ / 2);
        let rows = edit_rows(&mut m);
        assert_eq!(rows.len(), 1, "{rows:?}");
        assert!(rows[0].ends_with("5678"), "{rows:?}");
    }

    #[test]
    fn a_multi_line_edit_stays_on_the_display() {
        let Some(mut m) = machine(true) else { return };
        enter_line(&mut m, "1 2 3 4");
        m.type_text("12").unwrap();
        // Newline is the right-shifted decimal point key.
        tap_all(&mut m, &[Key::RightShift, Key::Dot]);
        m.type_text("34").unwrap();
        m.run(CPU_HZ / 2);
        let rows = edit_rows(&mut m);
        assert_eq!(rows, ["12", "34"], "{rows:?}");
        assert_eq!(text_rows(&mut m).len(), 2, "two stack levels are left");
    }

    /// The text of the status area and messages on the hi-res display.
    fn status_text(m: &mut hp48::Machine) -> Vec<String> {
        m.sync_hires();
        let text = |item: &Item| match &item.content {
            Content::Text { text, .. } => Some(String::from_utf8_lossy(text).trim().to_string()),
            _ => None,
        };
        m.hw.hires.on_lcd().filter_map(text).collect()
    }

    #[test]
    fn the_status_area_is_sent_as_text() {
        for natives in [false, true] {
            let Some(mut m) = machine(natives) else { return };
            enter_line(&mut m, "RAD 7");
            let status = status_text(&mut m);
            assert!(status.iter().any(|t| t == "RAD"), "{status:?}");
            assert!(status.iter().any(|t| t.contains("HOME")), "{status:?}");
        }
    }

    #[test]
    fn a_warning_is_sent_as_text_and_gives_way_to_the_status_area() {
        let Some(mut m) = machine(true) else { return };
        enter_line(&mut m, "RAD 1 0");
        tap_all(&mut m, &[Key::Div]);
        let shown = status_text(&mut m);
        assert!(shown.iter().any(|t| t.contains("Error")), "{shown:?}");
        assert!(shown.iter().any(|t| t.contains("Infinite Result")), "{shown:?}");
        assert!(!shown.iter().any(|t| t == "RAD"), "the message is over it: {shown:?}");
        tap_all(&mut m, &[Key::On]);
        m.run(CPU_HZ);
        let shown = status_text(&mut m);
        assert!(!shown.iter().any(|t| t.contains("Infinite Result")), "{shown:?}");
        assert!(shown.iter().any(|t| t == "RAD"), "{shown:?}");
    }

    /// The rows of a list on the display, top first, with whether each is
    /// inverted.
    fn list_rows(m: &mut hp48::Machine) -> Vec<(String, bool)> {
        let _ = m.sync_hires();
        let mut rows: Vec<&Item> = m.hw.hires.on_lcd().filter(|item| matches!(item.content, Content::ListRow { .. })).collect();
        rows.sort_by_key(|item| item.y);
        let row = |item: &&Item| match &item.content {
            Content::ListRow { text, .. } => (String::from_utf8_lossy(text).trim_end().to_string(), item.inverted()),
            _ => unreachable!(),
        };
        rows.iter().map(row).collect()
    }

    #[test]
    fn a_choose_box_is_sent_as_text() {
        let Some(mut m) = machine(false) else { return };
        tap_all(&mut m, &[Key::RightShift, Key::N1]);
        m.run(CPU_HZ);
        let rows = list_rows(&mut m);
        assert!(rows.len() >= 4, "{rows:?}");
        assert_eq!(rows.iter().filter(|row| row.1).count(), 1, "one row is highlighted: {rows:?}");
        assert!(rows[0].1, "{rows:?}");
        tap_all(&mut m, &[Key::Down]);
        m.run(CPU_HZ / 2);
        let moved = list_rows(&mut m);
        assert_eq!(moved.iter().map(|r| &r.0).collect::<Vec<_>>(), rows.iter().map(|r| &r.0).collect::<Vec<_>>());
        assert!(moved[1].1 && !moved[0].1, "the highlight moves: {moved:?}");
    }

    #[test]
    fn a_choose_box_stays_on_the_display_while_it_scrolls() {
        let Some(mut m) = machine(false) else { return };
        m.type_text("\"T\" { A B C D E F G H I J } 1 CHOOSE").unwrap();
        m.tap(Key::Enter);
        m.run(2 * CPU_HZ);
        let page = list_rows(&mut m).len();
        assert!((3..10).contains(&page), "{page}");
        for _ in 0..page + 2 {
            tap_all(&mut m, &[Key::Down]);
            m.run(CPU_HZ / 2);
            assert_eq!(list_rows(&mut m).len(), page);
        }
        let rows = list_rows(&mut m);
        let highlighted: Vec<_> = rows.iter().filter(|row| row.1).collect();
        assert_eq!(highlighted.len(), 1, "{rows:?}");
        assert_eq!(highlighted[0].0, ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"][page + 2], "{rows:?}");
        tap_all(&mut m, &[Key::Up, Key::Up, Key::Up, Key::Up]);
        m.run(CPU_HZ / 2);
        assert_eq!(list_rows(&mut m).len(), page);
    }

    #[test]
    fn the_equation_library_browser_is_sent_as_text() {
        let Some(mut m) = machine(false) else { return };
        enter_line(&mut m, "EQNLIB");
        m.run(2 * CPU_HZ);
        let rows = list_rows(&mut m);
        assert_eq!(rows.len(), 6, "{rows:?}");
        assert_eq!(rows[0], ("Columns and Beams".to_string(), true));
        tap_all(&mut m, &[Key::Down, Key::Down]);
        m.run(CPU_HZ / 2);
        let rows = list_rows(&mut m);
        assert_eq!(rows[2], ("Fluids".to_string(), true), "{rows:?}");
        assert!(!rows[0].1, "{rows:?}");
        for _ in 0..6 {
            tap_all(&mut m, &[Key::Down]);
            m.run(CPU_HZ / 2);
            let rows = list_rows(&mut m);
            assert_eq!(rows.len(), 6, "{rows:?}");
            assert_eq!(rows.iter().filter(|row| row.1).count(), 1, "{rows:?}");
        }
    }

    #[test]
    fn the_browser_gives_way_to_a_picture() {
        let Some(mut m) = machine(false) else { return };
        enter_line(&mut m, "EQNLIB");
        m.run(2 * CPU_HZ);
        tap_all(&mut m, &[Key::Enter]);
        m.run(2 * CPU_HZ);
        tap_all(&mut m, &[Key::Enter]);
        m.run(2 * CPU_HZ);
        tap_all(&mut m, &[Key::D]);
        m.run(2 * CPU_HZ);
        assert!(list_rows(&mut m).is_empty());
        assert_eq!(pictures(&m).count(), 1);
    }

    #[test]
    fn what_a_box_covers_stays_on_the_display() {
        let Some(mut m) = machine(false) else { return };
        enter_line(&mut m, "1.5");
        let before = text_rows(&mut m);
        tap_all(&mut m, &[Key::RightShift, Key::N1]);
        m.run(CPU_HZ);
        assert_eq!(text_rows(&mut m), before, "the rows show around the box");
    }

    #[test]
    fn a_choose_box_leaves_the_stack_as_it_was() {
        let Some(mut m) = machine(false) else { return };
        enter_line(&mut m, "1.5");
        let before = text_rows(&mut m);
        tap_all(&mut m, &[Key::RightShift, Key::N1]);
        m.run(CPU_HZ);
        tap_all(&mut m, &[Key::On]);
        m.run(CPU_HZ);
        assert_eq!(text_rows(&mut m), before);
        assert!(list_rows(&mut m).is_empty());
    }

    #[test]
    fn clearing_the_lcd_removes_what_was_on_it() {
        let Some(mut m) = machine(true) else { return };
        enter_line(&mut m, "7");
        assert!(!text_rows(&mut m).is_empty());
        enter_line(&mut m, "CLLCD 3 FREEZE");
        assert!(text_rows(&mut m).is_empty(), "the ROM's own clear");
    }

    #[test]
    fn a_program_writing_to_the_display_removes_what_is_under_it() {
        let Some(mut m) = machine(true) else { return };
        enter_line(&mut m, "7");
        assert!(!text_rows(&mut m).is_empty());
        // As an external program would: straight to memory, with no ROM call.
        const RAM: u32 = 0x80000;
        let grob = m.peek_value(0x806D5, 5) as u32;
        let line = grob + 20 + 50 * 34; // in the last row of the stack
        (0..34).for_each(|i| m.hw.ram[(line + i - RAM) as usize] = 0xF);
        assert!(text_rows(&mut m).iter().all(|r| !r.starts_with("1:")));
    }

    #[test]
    fn a_picture_copied_to_pict_is_not_sent() {
        let Some(mut m) = machine(true) else { return };
        enter_line(&mut m, "1 1 1 SOLVEQN");
        assert!(!pictures(&m).any(|_| true));
    }

    #[test]
    fn erasing_leaves_the_menu() {
        let d = all().into_iter().next().unwrap();
        let mut shown = lcd(&d);
        d.erase(&mut shown);
        assert!(shown[..AREA_ROWS].iter().flatten().all(|&on| !on));
        assert!(shown[AREA_ROWS..].iter().flatten().all(|&on| on));
    }
}
