//! Text in the ROM's minifont, recognised so it can be drawn with a real font.
//!
//! The minifont (status line, path, menu labels) is only 5 pixels tall, too
//! small for centreline tracing to give readable shapes. Its glyphs are known
//! exactly, though, and the ROM draws them unscaled and on a clear background:
//! each glyph's advance includes a blank column, and the rows just above and
//! below the text are blank. [`MiniFont::find`] looks for runs of glyphs with
//! that layout, dark on light or light on dark (inside inverted labels).

use crate::Bitmap;

/// Rows in a minifont glyph.
pub const ROWS: usize = 5;

/// One glyph: advance width in pixels and its rows, bit 0 the leftmost pixel.
#[derive(Clone, Debug)]
pub struct Glyph {
    pub ch: char,
    pub width: usize,
    pub rows: [u8; ROWS],
}

impl Glyph {
    fn ink(&self, x: usize, y: usize) -> bool {
        x < 8 && (self.rows[y] >> x) & 1 != 0
    }

    fn pixels(&self) -> usize {
        self.rows.iter().map(|r| r.count_ones() as usize).sum()
    }

    /// Columns up to the last one with ink.
    fn ink_width(&self) -> usize {
        self.rows.iter().map(|&r| 8 - r.leading_zeros() as usize).max().unwrap_or(0)
    }
}

/// A run of minifont text: its ink covers columns `x..x + w` and rows
/// `y..y + 5`.
#[derive(Clone, Debug, PartialEq)]
pub struct Text {
    pub x: f32,
    pub y: f32,
    pub w: f32,
    pub text: String,
    /// Light text on a dark fill (an inverted menu label).
    pub light: bool,
}

#[derive(Clone, Debug, Default)]
pub struct MiniFont {
    /// Glyphs with ink, indexed by the pattern of their first column.
    by_column: Vec<Vec<Glyph>>,
}

/// Width of the minifont's space, for the gaps between recognised glyphs.
const SPACE: usize = 4;
/// Glyphs further apart than this start a new run.
const MAX_GAP: usize = 2 * SPACE;

impl MiniFont {
    /// Glyphs in order of preference: when two characters share a bitmap
    /// (`I` and `|`), the first one is used.
    pub fn new(glyphs: impl IntoIterator<Item = Glyph>) -> Self {
        let mut by_column = vec![Vec::new(); 1 << ROWS];
        let mut seen = Vec::new();
        for g in glyphs {
            if g.pixels() == 0 || g.width <= g.ink_width() || seen.contains(&(g.width, g.rows)) {
                continue;
            }
            seen.push((g.width, g.rows));
            by_column[column(|y| g.ink(0, y))].push(g);
        }
        // Prefer the glyph that explains the most ink.
        for list in &mut by_column {
            list.sort_by_key(|g| std::cmp::Reverse(g.pixels()));
        }
        MiniFont { by_column }
    }

    /// Runs of minifont text in `bmp`, dark and light.
    pub fn find(&self, bmp: &Bitmap) -> Vec<Text> {
        self.find_ink(bmp).into_iter().map(|(t, _)| t).collect()
    }

    /// Runs of text with the pixels their glyphs cover.
    pub(crate) fn find_ink(&self, bmp: &Bitmap) -> Vec<(Text, Vec<(usize, usize)>)> {
        let mut found = Vec::new();
        for light in [false, true] {
            for y in 0..bmp.h.saturating_sub(ROWS - 1) {
                self.find_row(bmp, y, light, &mut found);
            }
        }
        found
    }

    fn find_row(&self, bmp: &Bitmap, y: usize, light: bool, found: &mut Vec<(Text, Vec<(usize, usize)>)>) {
        // Outside the bitmap counts as background.
        let ink = |x: isize, yy: isize| -> bool {
            if x < 0 || yy < 0 || x >= bmp.w as isize || yy >= bmp.h as isize {
                return false;
            }
            bmp.at(x, yy) != light
        };
        let yi = y as isize;
        let band = |x: isize| column(|r| ink(x, yi + r as isize));
        let mut run: Vec<(usize, &Glyph)> = Vec::new();
        let mut x = 0;
        while x < bmp.w {
            let xi = x as isize;
            let col = band(xi);
            let fits = |g: &Glyph| {
                (0..g.width).all(|dx| {
                    let xx = xi + dx as isize;
                    !ink(xx, yi - 1) && !ink(xx, yi + ROWS as isize) && (0..ROWS).all(|r| ink(xx, yi + r as isize) == g.ink(dx, r))
                })
            };
            let hit = if col != 0 && band(xi - 1) == 0 && !ink(xi - 1, yi - 1) && !ink(xi - 1, yi + ROWS as isize) {
                self.by_column[col].iter().find(|g| fits(g))
            } else {
                None
            };
            match hit {
                Some(g) => {
                    if let Some(&(px, pg)) = run.last() {
                        if x - (px + pg.width) > MAX_GAP {
                            push_run(&mut run, y, light, found);
                        }
                    }
                    run.push((x, g));
                    x += g.width;
                }
                None => {
                    // Anything else between glyphs ends the run (the edge
                    // of the next menu label, say).
                    if col != 0 || ink(xi, yi - 1) || ink(xi, yi + ROWS as isize) {
                        push_run(&mut run, y, light, found);
                    }
                    x += 1;
                }
            }
        }
        push_run(&mut run, y, light, found);
    }
}

fn column(f: impl Fn(usize) -> bool) -> usize {
    (0..ROWS).filter(|&r| f(r)).fold(0, |acc, r| acc | 1 << r)
}

fn push_run(run: &mut Vec<(usize, &Glyph)>, y: usize, light: bool, found: &mut Vec<(Text, Vec<(usize, usize)>)>) {
    let glyphs = std::mem::take(run);
    let pixels: usize = glyphs.iter().map(|(_, g)| g.pixels()).sum();
    // A lone small glyph is more likely a few pixels of a plot.
    if glyphs.is_empty() || (glyphs.len() < 2 && pixels < 6) {
        return;
    }
    let mut text = String::new();
    let mut end = glyphs[0].0;
    for &(x, g) in &glyphs {
        for _ in 0..(x - end + SPACE / 2) / SPACE {
            text.push(' ');
        }
        text.push(g.ch);
        end = x + g.width;
    }
    let ink = glyphs
        .iter()
        .flat_map(|&(x, g)| (0..ROWS).flat_map(move |r| (0..g.width).filter(move |&dx| g.ink(dx, r)).map(move |dx| (x + dx, y + r))))
        .collect();
    let (x0, _) = glyphs[0];
    let (xl, gl) = glyphs[glyphs.len() - 1];
    let t = Text { x: x0 as f32, y: y as f32, w: (xl + gl.ink_width() - x0) as f32, text, light };
    found.push((t, ink));
}

#[cfg(test)]
mod tests {
    use super::*;

    fn font() -> MiniFont {
        let g = |ch, width, rows| Glyph { ch, width, rows };
        MiniFont::new([
            g('H', 4, [0b101, 0b101, 0b111, 0b101, 0b101]),
            g('I', 2, [1, 1, 1, 1, 1]),
            g('|', 2, [1, 1, 1, 1, 1]),
            g('.', 2, [0, 0, 0, 0, 1]),
        ])
    }

    fn bitmap(rows: &[&str]) -> Bitmap {
        let rows: Vec<Vec<bool>> = rows.iter().map(|r| r.chars().map(|c| c == '#').collect()).collect();
        Bitmap::from_rows(&rows)
    }

    #[test]
    fn dark_text_with_a_space() {
        let b = bitmap(&[
            "..............",
            ".#.#.#.....#..",
            ".#.#.#.....#..",
            ".###.#.....#..",
            ".#.#.#.....#..",
            ".#.#.#.....#..",
            "..............",
        ]);
        assert_eq!(font().find(&b), vec![Text { x: 1.0, y: 1.0, w: 11.0, text: "HI I".into(), light: false }]);
    }

    #[test]
    fn light_labels_stay_apart() {
        // Two inverted labels side by side, separated by one light column.
        let b = bitmap(&[
            "######.######",
            "#.#.##.#.#.##",
            "#.#.##.#.#.##",
            "#...##.#...##",
            "#.#.##.#.#.##",
            "#.#.##.#.#.##",
            "######.######",
        ]);
        let found = font().find(&b);
        assert_eq!(found.iter().map(|t| t.text.as_str()).collect::<Vec<_>>(), ["H", "H"]);
        assert!(found.iter().all(|t| t.light));
    }

    #[test]
    fn lone_dot_is_not_text() {
        let b = bitmap(&["...", "...", "...", "...", "...", ".#.", "..."]);
        assert!(font().find(&b).is_empty());
    }
}
