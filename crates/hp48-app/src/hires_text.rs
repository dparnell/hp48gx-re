//! Text on the hi-res display, drawn with real fonts.
//!
//! The ROM says what the text is, so nothing is read back from the pixels:
//! lower case stays lower case, unlike recognised minifont text. The LCD's
//! pixels under the text are taken out, so that only what isn't text (a menu
//! label's frame) is traced.

use crate::{draw_fitted_text, LCD_BG, LCD_INK};
use eframe::egui::{self, FontFamily, Pos2};
use hp48::hires::{Content, Item};
use hp48::{LCD_HEIGHT, LCD_WIDTH};

/// A character cell of the big font, and its capitals' height.
const CELL: usize = 6;
const ROW_CHARS: usize = 22;
const ROW_CAP: f32 = 7.0;
/// Where the big font's capitals are centred, below the top of a row.
const ROW_MIDDLE: f32 = 4.5;
/// Where a label's capitals are centred, below its top.
const LABEL_MIDDLE: f32 = 4.5;
/// The lines of a label that hold text.
const LABEL_LINES: std::ops::Range<usize> = 1..8;

fn text(bytes: &[u8]) -> String {
    bytes.iter().map(|&b| hp48_rpl::hp_char(b)).collect()
}

/// The columns of a label's text box, relative to the label.
fn label_box(center: usize, width: usize) -> std::ops::Range<usize> {
    let left = center.saturating_sub(width / 2);
    left..left + width
}

/// A label's background: the pixel in the corner of its text box.
fn dark_label(item: &Item, columns: &std::ops::Range<usize>) -> bool {
    item.rows[LABEL_LINES.start][columns.start.min(item.rows[0].len() - 1)]
}

/// Take the text out of the LCD's pixels.
pub fn erase(item: &Item, lcd: &mut [[bool; LCD_WIDTH]; LCD_HEIGHT]) {
    match &item.content {
        Content::Grob => {}
        Content::Label { center, width, .. } => {
            let columns = label_box(*center, *width);
            let dark = dark_label(item, &columns);
            let columns = columns.start..columns.end.min(item.rows[0].len());
            for y in LABEL_LINES.take_while(|y| *y < item.rows.len()) {
                let row = &mut lcd[item.y + y];
                columns.clone().filter(|x| item.x + x < LCD_WIDTH).for_each(|x| row[item.x + x] = dark);
            }
        }
        Content::Row { .. } => {
            for y in 0..item.rows.len() {
                lcd[item.y + y].fill(false);
            }
        }
    }
}

/// Draw the item's text, if it has any. `pt` maps LCD pixels to the screen.
pub fn draw(painter: &egui::Painter, item: &Item, pt: &dyn Fn(f32, f32) -> Pos2) {
    match &item.content {
        Content::Grob => {}
        Content::Label { text: bytes, center, width } => {
            let columns = label_box(*center, *width);
            let color = if dark_label(item, &columns) { LCD_BG } else { LCD_INK };
            let middle = [(item.x + center) as f32, item.y as f32 + LABEL_MIDDLE];
            let family = FontFamily::Name("mini".into());
            draw_fitted_text(painter, &text(bytes), middle, *width as f32 - 1.5, 5.0, family, false, pt, color);
        }
        Content::Row { text: bytes } => {
            let shown = &bytes[..bytes.len().min(ROW_CHARS)];
            // Words keep to the font's grid, so that columns line up. Stack
            // levels are set against the right side of the display.
            for (start, word) in words(shown) {
                let room = (word.len() * CELL) as f32;
                let middle = [item.x as f32 + (start * CELL) as f32 + room / 2.0, item.y as f32 + ROW_MIDDLE];
                let right = start + word.len() == ROW_CHARS;
                draw_fitted_text(painter, &text(word), middle, room, ROW_CAP, FontFamily::Proportional, right, pt, LCD_INK);
            }
        }
    }
}

/// The runs of characters between spaces, with where each starts.
fn words(bytes: &[u8]) -> impl Iterator<Item = (usize, &[u8])> {
    let mut start = 0;
    bytes.split(|&b| b == b' ').filter_map(move |word| {
        let at = start;
        start += word.len() + 1;
        (!word.is_empty()).then_some((at, word))
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn words_keep_their_columns() {
        let found: Vec<_> = words(b"1:   2.5 x").collect();
        assert_eq!(found, [(0, &b"1:"[..]), (5, &b"2.5"[..]), (9, &b"x"[..])]);
    }

    #[test]
    fn a_label_box_is_centred() {
        assert_eq!(label_box(11, 20), 1..21);
        assert_eq!(label_box(9, 16), 1..17);
    }
}
