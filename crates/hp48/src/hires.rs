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
//! after `SAVPTR`: its arguments are on the RPL stack, at `DSKTOP`. A ROM word
//! such as `HiGrobDisp` draws on the LCD as well, so code that reads the
//! display (→PICT) still works.
//!
//! The LCD wins. An item lasts only while the LCD under it shows what it
//! replaced ([`Hires::sync`]), so clearing the screen, scrolling, switching
//! to another display or an external program writing straight to memory all
//! remove it, and none of them has to know about this display.

use crate::hardware::Hardware;
use crate::machine::{LCD_HEIGHT, LCD_WIDTH};

/// Command: `#x #y grob ->`, with the stack left as it is.
const GROB: u8 = 1;

/// RAM word with the address of stack level 1, after `SAVPTR`.
const DSKTOP: u32 = 0x806F8;
const DOGROB: u32 = 0x02B1E;

/// A grob sent to the display. The host draws what it has for it, by
/// [`Grob::hash`], and otherwise leaves it to the LCD.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Grob {
    pub x: usize,
    pub y: usize,
    /// The grob's pixels by rows (dark is true).
    pub rows: Vec<Vec<bool>>,
    /// [`hash`] of `rows`.
    pub hash: u64,
    /// It has reached the LCD: the command comes before the drawing.
    on_lcd: bool,
}

impl Grob {
    /// Whether the LCD shows this grob at its place.
    fn shown_on(&self, lcd: &[[bool; LCD_WIDTH]; LCD_HEIGHT]) -> bool {
        self.rows.iter().enumerate().all(|(y, row)| {
            let line = lcd.get(self.y + y);
            row.iter().enumerate().all(|(x, &on)| line.and_then(|l| l.get(self.x + x)).is_none_or(|&pixel| pixel == on))
        })
    }
}

/// What the display shows, last drawn last.
#[derive(Clone, Debug, Default)]
pub struct Hires {
    pub items: Vec<Grob>,
}

impl Hires {
    /// Remove the items whose pixels the LCD no longer shows.
    pub fn sync(&mut self, lcd: &[[bool; LCD_WIDTH]; LCD_HEIGHT]) {
        self.items.retain_mut(|item| {
            let shown = item.shown_on(lcd);
            item.on_lcd |= shown;
            shown || !item.on_lcd
        });
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
    if word(hw, addr) != DOGROB {
        return None;
    }
    let (height, width) = (word(hw, addr + 10) as usize, word(hw, addr + 15) as usize);
    let stride = width.div_ceil(8) * 2;
    let pixel = |y: usize, x: usize| {
        let nibble = hw.peek(addr + 20 + (y * stride + x / 4) as u32);
        nibble >> (x % 4) & 1 != 0
    };
    Some((0..height).map(|y| (0..width).map(|x| pixel(y, x)).collect()).collect())
}

/// A command from the ROM.
pub(crate) fn command(hw: &mut Hardware, code: u8) {
    if code != GROB {
        return;
    }
    let stack = word(hw, DSKTOP);
    let level = |n: u32| word(hw, stack + 5 * (n - 1));
    let Some(rows) = read_rows(hw, level(1)) else { return };
    let (x, y) = (word(hw, level(3) + 5) as usize, word(hw, level(2) + 5) as usize);
    let (width, height) = (rows[0].len(), rows.len());
    let hash = hash(&rows);
    // A new frame of an animation takes the place of the last one.
    let same_place = |item: &Grob| (item.x, item.y, item.rows[0].len(), item.rows.len()) == (x, y, width, height);
    hw.hires.items.retain(|item| !same_place(item));
    hw.hires.items.push(Grob { x, y, rows, hash, on_lcd: false });
}

#[cfg(test)]
mod tests {
    use super::*;

    fn grob() -> Grob {
        let rows = vec![vec![true, false], vec![false, true]];
        Grob { x: 3, y: 4, hash: hash(&rows), rows, on_lcd: false }
    }

    fn lcd_with(item: &Grob) -> [[bool; LCD_WIDTH]; LCD_HEIGHT] {
        let mut lcd = [[false; LCD_WIDTH]; LCD_HEIGHT];
        for (y, row) in item.rows.iter().enumerate() {
            for (x, &on) in row.iter().enumerate() {
                lcd[item.y + y][item.x + x] = on;
            }
        }
        lcd
    }

    #[test]
    fn an_item_waits_for_the_lcd_then_lasts_while_it_shows() {
        let mut hires = Hires { items: vec![grob()] };
        let blank = [[false; LCD_WIDTH]; LCD_HEIGHT];
        hires.sync(&blank);
        assert_eq!(hires.items.len(), 1, "the drawing comes after the command");

        let shown = lcd_with(&hires.items[0]);
        hires.sync(&shown);
        hires.sync(&shown);
        assert_eq!(hires.items.len(), 1);

        let mut elsewhere = shown;
        elsewhere[40][100] = true;
        hires.sync(&elsewhere);
        assert_eq!(hires.items.len(), 1, "a change outside the item leaves it");

        hires.sync(&blank);
        assert!(hires.items.is_empty(), "clearing the LCD removes it");
    }
}
