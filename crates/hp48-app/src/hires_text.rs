//! Text on the hi-res display, drawn with real fonts.
//!
//! The ROM says what the text is, so nothing is read back from the pixels:
//! lower case stays lower case, unlike recognised minifont text. The LCD's
//! pixels under the text are taken out, so that only what isn't text (a menu
//! label's frame) is traced.

use crate::{draw_fitted_text, LCD_BG, LCD_INK};
use eframe::egui::{self, Align, FontFamily, Pos2, Rect, Stroke};
use hp48::hires::{Content, Cursor, Font, Item, CELL_WIDTH as CELL};
use hp48::{Key, LCD_HEIGHT, LCD_WIDTH};

/// The characters on a row of the big font, and its capitals' height.
const ROW_CHARS: usize = 22;
const ROW_CAP: f32 = 7.0;
/// Where the big font's capitals are centred, below the top of a row.
const ROW_MIDDLE: f32 = 4.5;
/// The same for the 8-line font.
const SMALL_CAP: f32 = 6.0;
const SMALL_MIDDLE: f32 = 3.5;
/// The same for the minifont.
const MINI_CAP: f32 = 5.0;
const MINI_MIDDLE: f32 = 2.5;
const MINI_ROOM: f32 = 1.25;
/// Where a label's capitals are centred, below its top.
const LABEL_MIDDLE: f32 = 4.5;
/// The lines of a label that hold text.
const LABEL_LINES: std::ops::Range<usize> = 1..8;

/// The ROM marks text cut short with character 31.
fn character(b: u8) -> char {
    if b == 31 { '…' } else { hp48_rpl::hp_char(b) }
}

fn text(bytes: &[u8]) -> String {
    bytes.iter().map(|&b| character(b)).collect()
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

/// Take the text out of the LCD's pixels, last drawn last. A box puts back
/// what was taken from under it.
pub fn erase_all(items: &[Item], lcd: &mut [[bool; LCD_WIDTH]; LCD_HEIGHT]) {
    let original = *lcd;
    for item in items {
        if item.content == Content::Box {
            let [left, top, right, bottom] = item.area();
            for y in top..bottom.min(LCD_HEIGHT) {
                let columns = left.min(LCD_WIDTH)..right.min(LCD_WIDTH);
                lcd[y][columns.clone()].copy_from_slice(&original[y][columns]);
            }
        } else {
            erase(item, lcd);
        }
    }
}

/// Take an item's text out of the LCD's pixels.
fn erase(item: &Item, lcd: &mut [[bool; LCD_WIDTH]; LCD_HEIGHT]) {
    match &item.content {
        Content::Grob | Content::Box => {}
        Content::Label { center, width, .. } => {
            let columns = label_box(*center, *width);
            let dark = dark_label(item, &columns);
            let columns = columns.start..columns.end.min(item.rows[0].len());
            for y in LABEL_LINES.take_while(|y| *y < item.rows.len()) {
                let row = &mut lcd[item.y + y];
                columns.clone().filter(|x| item.x + x < LCD_WIDTH).for_each(|x| row[item.x + x] = dark);
            }
        }
        Content::Row { .. } | Content::Edit { .. } => {
            for y in 0..item.rows.len() {
                lcd[item.y + y].fill(false);
            }
        }
        Content::ListRow { .. } => {
            let dark = item.rows[0][0];
            for line in lcd.iter_mut().skip(item.y).take(item.rows.len()) {
                line.iter_mut().skip(item.x).take(item.rows[0].len()).for_each(|pixel| *pixel = dark);
            }
        }
        Content::Text { .. } => {
            for line in lcd.iter_mut().skip(item.y).take(item.rows.len()) {
                line.iter_mut().skip(item.x).take(item.rows[0].len()).for_each(|pixel| *pixel = false);
            }
        }
    }
}

/// The keys that do what a click at this point of a list means: a row is
/// chosen, and an arrow turns the page. Nothing else in a list is a target.
pub fn list_keys<'a>(items: impl Iterator<Item = &'a Item>, x: f32, y: f32) -> Option<Vec<Key>> {
    // Arrows are small, so they take clicks close by.
    const ARROW_MARGIN: f32 = 2.0;
    let holds = |item: &Item, margin: f32| {
        let [left, top, right, bottom] = item.area().map(|edge| edge as f32);
        (left - margin..right + margin).contains(&x) && (top - margin..bottom + margin).contains(&y)
    };
    // In a box over a box, only the top one counts.
    let items: Vec<&Item> = items.filter(|item| item.covers.is_empty()).collect();
    let mut rows: Vec<&Item> = items.iter().copied().filter(|item| matches!(item.content, Content::ListRow { .. })).collect();
    rows.sort_by_key(|item| item.y);
    if rows.is_empty() {
        return None;
    }
    let arrow = |item: &Item| match &item.content {
        Content::Text { text, font: Font::Small } if text.len() == 1 => match hp48_rpl::hp_char(text[0]) {
            '↑' => Some(Key::Up),
            '↓' => Some(Key::Down),
            _ => None,
        },
        _ => None,
    };
    if let Some(key) = items.iter().filter(|item| holds(item, ARROW_MARGIN)).find_map(|item| arrow(item)) {
        return Some(vec![Key::LeftShift, key]);
    }
    let clicked = rows.iter().position(|item| holds(item, 0.0))?;
    let highlighted = rows.iter().position(|item| item.rows[0][0])?;
    let key = if clicked < highlighted { Key::Up } else { Key::Down };
    let mut keys = vec![key; clicked.abs_diff(highlighted)];
    keys.push(Key::Enter);
    Some(keys)
}

/// The parts of the LCD outside the boxes.
fn outside(covers: &[[usize; 4]]) -> Vec<[usize; 4]> {
    let mut parts = vec![[0, 0, LCD_WIDTH, LCD_HEIGHT]];
    for &[left, top, right, bottom] in covers {
        parts = parts
            .iter()
            .flat_map(|&[l, t, r, b]| {
                let (t2, b2) = (t.max(top), b.min(bottom));
                [[l, t, r, b.min(top)], [l, b2.max(t), r, b], [l, t2, r.min(left), b2], [l.max(right), t2, r, b2]]
            })
            .filter(|&[l, t, r, b]| l < r && t < b)
            .collect();
    }
    parts
}

/// Draw the item's text, if it has any, around the boxes over it. `pt` maps
/// LCD pixels to the screen.
pub fn draw(painter: &egui::Painter, item: &Item, pt: &dyn Fn(f32, f32) -> Pos2) {
    if item.covers.is_empty() {
        return draw_item(painter, item, pt);
    }
    for [left, top, right, bottom] in outside(&item.covers) {
        let part = Rect::from_min_max(pt(left as f32, top as f32), pt(right as f32, bottom as f32));
        draw_item(&painter.with_clip_rect(part), item, pt);
    }
}

fn draw_item(painter: &egui::Painter, item: &Item, pt: &dyn Fn(f32, f32) -> Pos2) {
    match &item.content {
        Content::Grob | Content::Box => {}
        Content::Label { text: bytes, center, width } => {
            let columns = label_box(*center, *width);
            let color = if dark_label(item, &columns) { LCD_BG } else { LCD_INK };
            let middle = [(item.x + center) as f32, item.y as f32 + LABEL_MIDDLE];
            let family = FontFamily::Name("mini".into());
            let label = crate::menu_word(text(bytes));
            draw_fitted_text(painter, &label, middle, *width as f32 - 1.5, 5.0, family, Align::Center, pt, color);
        }
        Content::Row { text: bytes } => {
            draw_words(painter, item, bytes, ROW_CAP, ROW_MIDDLE, pt);
        }
        Content::ListRow { text: bytes, indent } => {
            let shown = text(bytes);
            let shown = shown.trim_end();
            let room = (shown.chars().count() * CELL) as f32;
            let left = (item.x + indent) as f32;
            let middle = [left + room / 2.0, item.y as f32 + SMALL_MIDDLE];
            let color = if item.rows[0][0] { LCD_BG } else { LCD_INK };
            draw_fitted_text(painter, shown, middle, room, SMALL_CAP, FontFamily::Proportional, Align::Min, pt, color);
        }
        Content::Text { text: bytes, font: Font::Small } => {
            // A message reads as a sentence, in the font's own spacing.
            let shown = text(&bytes[..bytes.len().min(ROW_CHARS)]);
            let shown = shown.trim_end();
            let room = (shown.chars().count() * CELL) as f32;
            let middle = [item.x as f32 + room / 2.0, item.y as f32 + SMALL_MIDDLE];
            draw_fitted_text(painter, shown, middle, room, SMALL_CAP, FontFamily::Proportional, Align::Min, pt, LCD_INK);
        }
        Content::Text { text: bytes, font: Font::Mini } => {
            let room = item.rows[0].len() as f32;
            let middle = [item.x as f32 + room / 2.0, item.y as f32 + MINI_MIDDLE];
            // A real font needs more room than the minifont took.
            let room = room * MINI_ROOM;
            draw_fitted_text(painter, &text(bytes), middle, room, MINI_CAP, FontFamily::Proportional, Align::Center, pt, LCD_INK);
        }
        Content::Edit { text: bytes } => {
            // A character to a cell, so that the cursor lines up with them.
            let under_cursor = item.cursor.map(|cursor| cursor.column);
            for (column, &b) in bytes.iter().enumerate().take(ROW_CHARS) {
                if b != b' ' && Some(column) != under_cursor {
                    let middle = [item.x as f32 + ((column * CELL) as f32) + CELL as f32 / 2.0, item.y as f32 + ROW_MIDDLE];
                    let family = FontFamily::Proportional;
                    draw_fitted_text(painter, &character(b).to_string(), middle, CELL as f32, ROW_CAP, family, Align::Center, pt, LCD_INK);
                }
            }
            if let Some(cursor) = item.cursor {
                draw_cursor(painter, cursor, item.y as f32, pt);
            }
        }
    }
}

/// A row of text, with words keeping to the font's grid so that columns line
/// up. Stack levels are set against the right side of the display.
fn draw_words(painter: &egui::Painter, item: &Item, bytes: &[u8], cap: f32, line: f32, pt: &dyn Fn(f32, f32) -> Pos2) {
    let shown = &bytes[..bytes.len().min(ROW_CHARS)];
    for (start, word) in words(shown) {
        let room = (word.len() * CELL) as f32;
        let middle = [item.x as f32 + (start * CELL) as f32 + room / 2.0, item.y as f32 + line];
        let align = if start + word.len() == ROW_CHARS { Align::Max } else { Align::Center };
        draw_fitted_text(painter, &text(word), middle, room, cap, FontFamily::Proportional, align, pt, LCD_INK);
    }
}

/// The edit line's cursor, in the shapes of the ROM's CURSOR1 and CURSOR2.
fn draw_cursor(painter: &egui::Painter, cursor: Cursor, top: f32, pt: &dyn Fn(f32, f32) -> Pos2) {
    let left = (cursor.column * CELL) as f32;
    let at = |x: f32, y: f32| pt(left + x, top + y);
    if cursor.block {
        painter.rect_filled(Rect::from_min_max(at(0.0, 0.0), at(5.0, 9.0)), 0.0, LCD_INK);
    } else {
        let shape = [(0.0, 4.5), (3.4, 1.0), (4.0, 1.0), (5.0, 3.0), (5.0, 6.0), (4.0, 8.0), (3.4, 8.0)];
        let points = shape.iter().map(|&(x, y)| at(x, y)).collect();
        painter.add(egui::Shape::convex_polygon(points, LCD_INK, Stroke::NONE));
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
    fn what_is_outside_a_box_goes_round_it() {
        let parts = outside(&[[10, 20, 30, 40]]);
        let area: usize = parts.iter().map(|[l, t, r, b]| (r - l) * (b - t)).sum();
        assert_eq!(area, LCD_WIDTH * LCD_HEIGHT - 20 * 20);
        let inside = |x, y| parts.iter().any(|&[l, t, r, b]| (l..r).contains(&x) && (t..b).contains(&y));
        assert!(inside(9, 25) && inside(30, 25) && inside(15, 19) && inside(15, 40));
        assert!(!inside(10, 20) && !inside(29, 39));
    }

    #[test]
    fn a_label_box_is_centred() {
        assert_eq!(label_box(11, 20), 1..21);
        assert_eq!(label_box(9, 16), 1..17);
    }
}
