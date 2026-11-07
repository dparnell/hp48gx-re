//! The hi-res display: a second display, over the LCD, that isn't part of
//! the calculator.
//!
//! The LCD stays as it was, for everything that doesn't know about this one,
//! such as external programs. The ROM's own code is moved to the hi-res
//! display one call at a time: instead of only drawing on the LCD, it sends a
//! command here, and the host draws the result at its own resolution. Nothing
//! of this display lives in the calculator's memory, and programs can't read
//! it back.
//!
//! A command is one nibble written to [`reg::HIRES`](crate::hardware::reg),
//! after `SAVPTR`: its arguments are on the RPL stack, at `DSKTOP`. The ROM's
//! `Hi` words draw on the LCD as well, so code that reads the display (→PICT)
//! still works.
//!
//! A menu label needs two commands, because no one routine knows both its
//! text and its place: `MakeLabel` turns text into a grob, and `Grob>Menu`
//! puts a grob in a column, sometimes much later. The display remembers which
//! text made which grob, and looks the grob up when it reaches a menu.
//!
//! The edit line's cursor blinks by overwriting one character cell, which the
//! ROM does with no command, so a row of the edit line ignores that cell when
//! it is compared with the LCD. A difference there means the cursor is on.
//!
//! The LCD wins. An item shows only while the LCD under it shows what it
//! replaced ([`Hires::sync`]), so clearing the screen, switching to another
//! display or an external program writing straight to memory all hide it, and
//! none of them has to know about this display. It shows again if those
//! pixels come back, as when the interactive stack's marker moves on: the same
//! pixels mean the same text.

use crate::hardware::Hardware;
use crate::machine::{LCD_HEIGHT, LCD_WIDTH};

// Commands. Each leaves the stack as it is.
/// `#x #y grob`: a grob on the display.
const GROB: u8 = 1;
/// `$ #w #x grob`: this text, centred on `x` in a box `w` wide, made this label.
const LABEL: u8 = 2;
/// `grob buffer #x #y`: a grob in the menu.
const MENU: u8 = 3;
/// `$ #row`: a row of text in the big font has just been drawn.
const ROW: u8 = 4;
/// `#n`: `n` rows are about to move up one row, over the top one.
const SCROLL_UP: u8 = 5;
/// `#n`: the top `n` rows are about to move down one row.
const SCROLL_DOWN: u8 = 6;
/// `$ #row`: a row of the edit line has just been drawn.
const EDIT_ROW: u8 = 7;
/// `chr #row`: a character has just been drawn before the cursor.
const EDIT_CHAR: u8 = 8;

/// RAM word with the address of stack level 1, after `SAVPTR`.
const DSKTOP: u32 = 0x806F8;
/// RAM word with the address of the stack's display grob.
const ADISP: u32 = 0x806D5;
const DOGROB: u32 = 0x02B1E;
const DOCSTR: u32 = 0x02A2C;
const DOCHAR: u32 = 0x029BF;
/// RAM word with the cursor's column on the edit line's row.
const CURSOROFFSET: u32 = 0x8088C;
/// RAM words with where the cursor is on the LCD, in pixels.
const CURSORX: u32 = 0x808B9;
const CURSORY: u32 = 0x808BE;

/// First LCD line of each row of big text, and how tall a row is.
const ROW_LINES: [usize; 4] = [16, 26, 36, 46];
const ROW_HEIGHT: usize = 10;
/// How wide a character of the big font is.
pub const CELL_WIDTH: usize = 6;
/// The first LCD line of the menu.
const MENU_LINE: usize = 56;
/// Labels remembered, before starting again.
const LABELS: usize = 512;
/// Items kept, most of them hidden.
const ITEMS: usize = 64;

/// What an item shows, beyond its pixels.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum Content {
    /// A picture. The host draws what it has for its hash, if anything.
    Grob,
    /// A menu label: text centred on `center`, in a box `width` wide.
    Label { text: Vec<u8>, center: usize, width: usize },
    /// A row of text in the big font.
    Row { text: Vec<u8> },
    /// A row of the edit line: text in the big font, a character to a cell.
    Edit { text: Vec<u8> },
}

impl Content {
    /// Whether this is a row of big text, which moves when the stack scrolls.
    fn is_row(&self) -> bool {
        matches!(self, Content::Row { .. } | Content::Edit { .. })
    }
}

/// The edit line's cursor, while it shows on a row.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct Cursor {
    /// The character cell it is in.
    pub column: usize,
    /// Replacing, shown as a block. Otherwise inserting, shown as an arrow.
    pub block: bool,
}

/// Something on the display, in place of these pixels on the LCD.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Item {
    pub x: usize,
    pub y: usize,
    /// The LCD's pixels by rows (dark is true).
    pub rows: Vec<Vec<bool>>,
    /// [`hash`] of `rows`.
    pub hash: u64,
    pub content: Content,
    /// The cursor, on a row of the edit line.
    pub cursor: Option<Cursor>,
    /// The LCD shows the item's pixels. A command may come before the drawing.
    on_lcd: bool,
}

impl Item {
    /// Whether the LCD shows this item's pixels at its place, but for the
    /// columns in `skip`.
    fn shown_on(&self, lcd: &[[bool; LCD_WIDTH]; LCD_HEIGHT], skip: std::ops::Range<usize>) -> bool {
        self.rows.iter().enumerate().all(|(y, row)| {
            let line = lcd.get(self.y + y);
            row.iter().enumerate().all(|(x, &on)| {
                skip.contains(&(self.x + x)) || line.and_then(|l| l.get(self.x + x)).is_none_or(|&pixel| pixel == on)
            })
        })
    }

    /// Bring the item up to date with the LCD, with the cursor's cell at
    /// `cursor` (its left and top, in pixels).
    fn sync(&mut self, lcd: &[[bool; LCD_WIDTH]; LCD_HEIGHT], cursor: (usize, usize)) {
        self.cursor = None;
        let (left, top) = cursor;
        if !matches!(self.content, Content::Edit { .. }) || top != self.y {
            self.on_lcd = self.shown_on(lcd, 0..0);
            return;
        }
        let cell = left..left + CELL_WIDTH;
        self.on_lcd = self.shown_on(lcd, cell.clone());
        if self.on_lcd && !self.shown_on(lcd, 0..0) {
            // The block fills the cell's corner, and the arrow doesn't.
            self.cursor = Some(Cursor { column: left / CELL_WIDTH, block: lcd[top][left] });
        }
    }
}

/// What the display shows, last drawn last.
#[derive(Clone, Debug, Default)]
pub struct Hires {
    pub items: Vec<Item>,
    /// The text that made each label, by the [`hash`] of the label, plain
    /// and inverted, as `MakeStdLabel` inverts what `MakeLabel` gives it.
    labels: std::collections::HashMap<u64, Content>,
}

impl Hires {
    /// The items to draw: those the LCD shows.
    pub fn on_lcd(&self) -> impl Iterator<Item = &Item> {
        self.items.iter().filter(|item| item.on_lcd)
    }

    /// Move the rows of text from line `first`, `count` of them, by one row
    /// up or down, like the ROM's ScreenUpN and ScreenDnN. A row they land on
    /// is gone.
    fn scroll(&mut self, first: usize, count: usize, up: bool) {
        let moved = first..first + count * ROW_HEIGHT;
        let lost = if up { first - ROW_HEIGHT } else { moved.end };
        self.items.retain(|item| !(item.content.is_row() && item.y == lost));
        for item in &mut self.items {
            if item.content.is_row() && moved.contains(&item.y) {
                item.y = if up { item.y - ROW_HEIGHT } else { item.y + ROW_HEIGHT };
            }
        }
    }

    /// Add an item, in place of what is at the same place.
    fn show(&mut self, x: usize, y: usize, rows: Vec<Vec<bool>>, content: Content) {
        let (width, height) = (rows[0].len(), rows.len());
        let same_place = |item: &Item| (item.x, item.y, item.rows[0].len(), item.rows.len()) == (x, y, width, height);
        self.items.retain(|item| !same_place(item));
        if self.items.len() >= ITEMS {
            self.items.remove(0);
        }
        let hash = hash(&rows);
        self.items.push(Item { x, y, rows, hash, content, cursor: None, on_lcd: false });
    }

    /// Show the items whose pixels the LCD shows, and hide the rest. `cursor`
    /// is the left and top of the edit line's cursor, in pixels.
    pub fn sync(&mut self, lcd: &[[bool; LCD_WIDTH]; LCD_HEIGHT], cursor: (usize, usize)) {
        self.items.iter_mut().for_each(|item| item.sync(lcd, cursor));
    }
}

/// A hash of a grob's pixels, whose rows hold whole bytes.
pub fn hash(rows: &[Vec<bool>]) -> u64 {
    let pixels: Vec<u8> = rows.iter().flatten().map(|&on| u8::from(on)).collect();
    crate::rom_hash(&pixels)
}

fn word(hw: &Hardware, addr: u32) -> u32 {
    (0..5).rev().fold(0, |value, i| (value << 4) | u32::from(hw.peek(addr + i)))
}

/// The grob at `addr`, or None if there is no grob there.
fn read_rows(hw: &Hardware, addr: u32) -> Option<Vec<Vec<bool>>> {
    read_area(hw, addr, 0, usize::MAX, usize::MAX)
}

/// `count` lines of the grob at `addr` from line `first`, at most `width`
/// pixels wide. None if there is no grob there, or nothing in that area.
fn read_area(hw: &Hardware, addr: u32, first: usize, count: usize, width: usize) -> Option<Vec<Vec<bool>>> {
    if word(hw, addr) != DOGROB {
        return None;
    }
    let (height, full_width) = (word(hw, addr + 10) as usize, word(hw, addr + 15) as usize);
    let stride = full_width.div_ceil(8) * 2;
    let pixel = |y: usize, x: usize| {
        let nibble = hw.peek(addr + 20 + (y * stride + x / 4) as u32);
        nibble >> (x % 4) & 1 != 0
    };
    let width = width.min(full_width);
    let lines = first..first.saturating_add(count).min(height);
    (width > 0 && !lines.is_empty()).then(|| lines.map(|y| (0..width).map(|x| pixel(y, x)).collect()).collect())
}

/// The string at `addr`, in the calculator's character set.
fn read_text(hw: &Hardware, addr: u32) -> Option<Vec<u8>> {
    if word(hw, addr) != DOCSTR {
        return None;
    }
    let bytes = word(hw, addr + 5).saturating_sub(5) / 2;
    let byte = |i: u32| hw.peek(addr + 10 + 2 * i) | hw.peek(addr + 11 + 2 * i) << 4;
    Some((0..bytes.min(256)).map(byte).collect())
}

/// The character of a character object, or the first of a string.
fn read_char(hw: &Hardware, addr: u32) -> Option<u8> {
    let byte = |at: u32| hw.peek(at) | hw.peek(at + 1) << 4;
    match word(hw, addr) {
        DOCHAR => Some(byte(addr + 5)),
        _ => read_text(hw, addr)?.first().copied(),
    }
}

/// The cursor's place on the LCD, for [`Hires::sync`].
pub(crate) fn cursor_place(hw: &Hardware) -> (usize, usize) {
    (word(hw, CURSORX) as usize, word(hw, CURSORY) as usize)
}

/// A row of the display's grob at `line`, as the LCD will show it.
fn read_row(hw: &Hardware, line: usize) -> Option<Vec<Vec<bool>>> {
    read_area(hw, word(hw, ADISP), line, ROW_HEIGHT, LCD_WIDTH)
}

/// A command from the ROM.
pub(crate) fn command(hw: &mut Hardware, code: u8) {
    let stack = word(hw, DSKTOP);
    let level = |n: u32| word(hw, stack + 5 * (n - 1));
    let number = |n: u32| word(hw, level(n) + 5) as usize;
    match code {
        GROB => {
            let Some(rows) = read_rows(hw, level(1)) else { return };
            let (x, y) = (number(3), number(2));
            hw.hires.show(x, y, rows, Content::Grob);
        }
        LABEL => {
            let (Some(rows), Some(text)) = (read_rows(hw, level(1)), read_text(hw, level(4))) else { return };
            let label = Content::Label { text, center: number(2), width: number(3) };
            let inverted: Vec<Vec<bool>> = rows.iter().map(|row| row.iter().map(|&on| !on).collect()).collect();
            let labels = &mut hw.hires.labels;
            if labels.len() >= LABELS {
                labels.clear();
            }
            labels.insert(hash(&rows), label.clone());
            labels.insert(hash(&inverted), label);
        }
        MENU => {
            let Some(rows) = read_rows(hw, level(4)) else { return };
            let content = hw.hires.labels.get(&hash(&rows)).cloned().unwrap_or(Content::Grob);
            let (x, y) = (number(2), MENU_LINE + number(1));
            hw.hires.show(x, y, rows, content);
        }
        ROW => {
            let Some(&line) = number(1).checked_sub(1).and_then(|row| ROW_LINES.get(row)) else { return };
            let (Some(text), Some(rows)) = (read_text(hw, level(2)), read_row(hw, line)) else { return };
            hw.hires.show(0, line, rows, Content::Row { text });
        }
        EDIT_ROW => {
            let Some(&line) = number(1).checked_sub(1).and_then(|row| ROW_LINES.get(row)) else { return };
            let (Some(text), Some(rows)) = (read_text(hw, level(2)), read_row(hw, line)) else { return };
            hw.hires.show(0, line, rows, Content::Edit { text });
        }
        EDIT_CHAR => {
            let Some(&line) = number(1).checked_sub(1).and_then(|row| ROW_LINES.get(row)) else { return };
            let (Some(chr), Some(rows)) = (read_char(hw, level(2)), read_row(hw, line)) else { return };
            // DISPCHAR+PC draws in the cell before the cursor's offset.
            let offset = hw.peek(CURSOROFFSET) as usize | (hw.peek(CURSOROFFSET + 1) as usize) << 4;
            let Some(column) = offset.checked_sub(1) else { return };
            let old = hw.hires.items.iter().find(|item| item.y == line).map(|item| &item.content);
            let mut text = match old {
                Some(Content::Edit { text }) => text.clone(),
                _ => Vec::new(),
            };
            if text.len() <= column {
                text.resize(column + 1, b' ');
            }
            text[column] = chr;
            hw.hires.show(0, line, rows, Content::Edit { text });
        }
        SCROLL_UP => {
            let count = number(1);
            hw.hires.scroll(ROW_LINES[1], count, true);
        }
        SCROLL_DOWN => {
            let count = number(1);
            hw.hires.scroll(ROW_LINES[0], count, false);
        }
        _ => {}
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const NO_CURSOR: (usize, usize) = (0, 0);

    #[test]
    fn the_cursor_cell_of_an_edit_row_may_differ() {
        let rows = vec![vec![false; 12]; ROW_HEIGHT];
        let item = Item { x: 0, y: 46, hash: hash(&rows), rows, content: Content::Edit { text: Vec::new() }, cursor: None, on_lcd: false };
        let mut hires = Hires { items: vec![item], ..Default::default() };
        let mut lcd = [[false; LCD_WIDTH]; LCD_HEIGHT];

        hires.sync(&lcd, (6, 46));
        assert_eq!(hires.on_lcd().next().unwrap().cursor, None, "blinked off");

        lcd[46][6] = true;
        hires.sync(&lcd, (6, 46));
        assert_eq!(hires.on_lcd().next().unwrap().cursor, Some(Cursor { column: 1, block: true }));

        lcd[46][6] = false;
        lcd[50][7] = true;
        hires.sync(&lcd, (6, 46));
        assert_eq!(hires.on_lcd().next().unwrap().cursor, Some(Cursor { column: 1, block: false }));

        lcd[50][1] = true;
        hires.sync(&lcd, (6, 46));
        assert_eq!(hires.on_lcd().count(), 0, "any other cell still counts");
    }

    fn grob() -> Item {
        let rows = vec![vec![true, false], vec![false, true]];
        Item { x: 3, y: 4, hash: hash(&rows), rows, content: Content::Grob, cursor: None, on_lcd: false }
    }

    fn lcd_with(item: &Item) -> [[bool; LCD_WIDTH]; LCD_HEIGHT] {
        let mut lcd = [[false; LCD_WIDTH]; LCD_HEIGHT];
        for (y, row) in item.rows.iter().enumerate() {
            for (x, &on) in row.iter().enumerate() {
                lcd[item.y + y][item.x + x] = on;
            }
        }
        lcd
    }

    fn rows(lines: &[usize]) -> Hires {
        let row = |&y: &usize| Item { x: 0, y, content: Content::Row { text: vec![y as u8] }, ..grob() };
        Hires { items: lines.iter().map(row).collect(), ..Default::default() }
    }

    fn lines(hires: &Hires) -> Vec<(u8, usize)> {
        let line = |item: &Item| match &item.content {
            Content::Row { text } => (text[0], item.y),
            _ => unreachable!(),
        };
        hires.items.iter().map(line).collect()
    }

    #[test]
    fn rows_follow_the_scroll() {
        let mut hires = rows(&ROW_LINES);
        hires.scroll(ROW_LINES[1], 3, true);
        assert_eq!(lines(&hires), [(26, 16), (36, 26), (46, 36)], "the top row is overwritten");

        let mut hires = rows(&ROW_LINES);
        hires.scroll(ROW_LINES[0], 3, false);
        assert_eq!(lines(&hires), [(16, 26), (26, 36), (36, 46)], "the bottom row is overwritten");
    }

    #[test]
    fn an_item_shows_only_while_the_lcd_does() {
        let mut hires = Hires { items: vec![grob()], ..Default::default() };
        let blank = [[false; LCD_WIDTH]; LCD_HEIGHT];
        hires.sync(&blank, NO_CURSOR);
        assert_eq!(hires.on_lcd().count(), 0, "the drawing comes after the command");

        let shown = lcd_with(&hires.items[0]);
        hires.sync(&shown, NO_CURSOR);
        assert_eq!(hires.on_lcd().count(), 1);

        let mut elsewhere = shown;
        elsewhere[40][100] = true;
        hires.sync(&elsewhere, NO_CURSOR);
        assert_eq!(hires.on_lcd().count(), 1, "a change outside the item leaves it");

        hires.sync(&blank, NO_CURSOR);
        assert_eq!(hires.on_lcd().count(), 0, "clearing the LCD hides it");

        hires.sync(&shown, NO_CURSOR);
        assert_eq!(hires.on_lcd().count(), 1, "the same pixels bring it back");
    }

    #[test]
    fn hidden_items_are_not_kept_for_ever() {
        let mut hires = Hires::default();
        for x in 0..2 * ITEMS {
            hires.show(x, 0, vec![vec![true]], Content::Grob);
        }
        assert_eq!(hires.items.len(), ITEMS);
        assert_eq!(hires.items.last().unwrap().x, 2 * ITEMS - 1, "the newest stays");
    }
}
