//! Calculator faceplate: key layout and legends.
//!
//! Legends are the HP48G/GX ones (cross-checked with x48ng's 48gx table and
//! with the ROM: right-shift 7 opens the SOLVE application, left-shift 7 the
//! SOLVE menu). `left` is the purple left-shift legend, `right` the green
//! right-shift legend, `alpha` the letter typed in alpha mode.
//!
//! While a shift or alpha mode is on, the keys show what they do in it
//! (`Mode`, `KeyCap::legend`).

use eframe::egui;
use hp48::Key;

pub struct KeyCap {
    pub key: Key,
    pub label: &'static str,
    pub left: &'static str,
    pub right: &'static str,
    pub alpha: &'static str,
    /// Width in key-columns (ENTER is double width).
    pub span: f32,
    pub style: Style,
}

#[derive(Clone, Copy, PartialEq, Eq)]
pub enum Style {
    Menu,
    Normal,
    Shift(ShiftColor),
    Number,
}

#[derive(Clone, Copy, PartialEq, Eq)]
pub enum ShiftColor {
    Left,
    Right,
    Alpha,
}

const fn k(
    key: Key,
    label: &'static str,
    left: &'static str,
    right: &'static str,
    alpha: &'static str,
    style: Style,
) -> KeyCap {
    KeyCap { key, label, left, right, alpha, span: 1.0, style }
}

const fn wide(mut c: KeyCap) -> KeyCap {
    c.span = 2.0;
    c
}

/// What the next key press means, from the LCD's annunciators.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Mode {
    Normal,
    Left,
    Right,
    Alpha,
    AlphaLeft,
    AlphaRight,
}

impl Mode {
    pub fn from_annunciators(bits: u8) -> Mode {
        const ON: u8 = 0x80;
        const LEFT: u8 = 0x01;
        const RIGHT: u8 = 0x02;
        const ALPHA: u8 = 0x04;
        if bits & ON == 0 {
            return Mode::Normal;
        }
        match (bits & ALPHA != 0, bits & LEFT != 0, bits & RIGHT != 0) {
            (false, false, false) => Mode::Normal,
            (false, true, _) => Mode::Left,
            (false, false, true) => Mode::Right,
            (true, false, false) => Mode::Alpha,
            (true, true, _) => Mode::AlphaLeft,
            (true, false, true) => Mode::AlphaRight,
        }
    }

    /// Whether this is the mode's own key, which turns it off.
    pub fn is_on(self, key: Key) -> bool {
        match key {
            Key::LeftShift => matches!(self, Mode::Left | Mode::AlphaLeft),
            Key::RightShift => matches!(self, Mode::Right | Mode::AlphaRight),
            Key::Alpha => matches!(self, Mode::Alpha | Mode::AlphaLeft | Mode::AlphaRight),
            _ => false,
        }
    }
}

impl KeyCap {
    /// What the key does in a mode, if the mode gives it something.
    pub fn legend(&self, mode: Mode) -> Option<&'static str> {
        let text = match mode {
            Mode::Normal => self.label,
            // One legend names both: the left shift opens the menu of what
            // the right shift opens the application of.
            Mode::Left if self.left.is_empty() && self.style == Number => self.right,
            Mode::Left => self.left,
            Mode::Right => self.right,
            Mode::Alpha => self.alpha,
            Mode::AlphaLeft => alpha_shifted(self.key).0,
            Mode::AlphaRight => alpha_shifted(self.key).1,
        };
        (!text.is_empty()).then_some(text)
    }
}

/// What a key types in alpha mode after the left and right shifts, from the
/// ROM (`examples/alphachars.rs`).
fn alpha_shifted(key: Key) -> (&'static str, &'static str) {
    match key {
        Key::A => ("a", "α"),
        Key::B => ("b", "ß"),
        Key::C => ("c", "Δ"),
        Key::D => ("d", "δ"),
        Key::E => ("e", "ε"),
        Key::F => ("f", "θ"),
        Key::Mth => ("g", "γ"),
        Key::Prg => ("h", "η"),
        Key::Cst => ("i", "∞"),
        Key::Var => ("j", "|"),
        Key::Up => ("k", "↑"),
        Key::Nxt => ("l", "λ"),
        Key::Quote => ("m", "'"),
        Key::Sto => ("n", "µ"),
        Key::Eval => ("o", "Ω"),
        Key::Left => ("p", "←"),
        Key::Down => ("q", "↓"),
        Key::Right => ("r", "ρ"),
        Key::Sin => ("s", "σ"),
        Key::Cos => ("t", "τ"),
        Key::Tan => ("u", "%"),
        Key::Sqrt => ("v", "~"),
        Key::Power => ("w", "ω"),
        Key::Inv => ("x", "ẋ"),
        Key::Neg => ("y", "±"),
        Key::Eex => ("z", "Π"),
        Key::Div => ("( )", "#"),
        Key::N4 => ("$", "¢"),
        Key::N5 => ("£", "¥"),
        Key::N6 => ("¤", "°"),
        Key::Mul => ("[ ]", "_"),
        Key::N1 => ("==", "≠"),
        Key::N2 => ("<", ">"),
        Key::N3 => ("≤", "≥"),
        Key::Minus => ("« »", "\" \""),
        Key::N0 => ("=", "→"),
        Key::Dot => (",", "↵"),
        Key::Space => ("π", "∡"),
        Key::Plus => ("{ }", ":"),
        _ => ("", ""),
    }
}

use Style::*;

/// Rows from top to bottom. The top four rows have six keys; the rest five.
pub const ROWS: [&[KeyCap]; 9] = [
    &[
        k(Key::A, "", "", "", "A", Menu),
        k(Key::B, "", "", "", "B", Menu),
        k(Key::C, "", "", "", "C", Menu),
        k(Key::D, "", "", "", "D", Menu),
        k(Key::E, "", "", "", "E", Menu),
        k(Key::F, "", "", "", "F", Menu),
    ],
    &[
        k(Key::Mth, "MTH", "RAD", "POLAR", "G", Normal),
        k(Key::Prg, "PRG", "CHARS", "", "H", Normal),
        k(Key::Cst, "CST", "MODES", "", "I", Normal),
        k(Key::Var, "VAR", "MEMORY", "", "J", Normal),
        k(Key::Up, "▲", "STACK", "", "K", Normal),
        k(Key::Nxt, "NXT", "PREV", "MENU", "L", Normal),
    ],
    &[
        k(Key::Quote, "'", "UP", "HOME", "M", Normal),
        k(Key::Sto, "STO", "DEF", "RCL", "N", Normal),
        k(Key::Eval, "EVAL", "→NUM", "UNDO", "O", Normal),
        k(Key::Left, "◀", "PICTURE", "", "P", Normal),
        k(Key::Down, "▼", "VIEW", "", "Q", Normal),
        k(Key::Right, "▶", "SWAP", "", "R", Normal),
    ],
    &[
        k(Key::Sin, "SIN", "ASIN", "∂", "S", Normal),
        k(Key::Cos, "COS", "ACOS", "∫", "T", Normal),
        k(Key::Tan, "TAN", "ATAN", "Σ", "U", Normal),
        k(Key::Sqrt, "√x", "x²", "ˣ√y", "V", Normal),
        k(Key::Power, "yˣ", "10ˣ", "LOG", "W", Normal),
        k(Key::Inv, "1/x", "eˣ", "LN", "X", Normal),
    ],
    &[
        wide(k(Key::Enter, "ENTER", "EQUATION", "MATRIX", "", Normal)),
        k(Key::Neg, "+/-", "EDIT", "CMD", "Y", Normal),
        k(Key::Eex, "EEX", "PURG", "ARG", "Z", Normal),
        k(Key::Del, "DEL", "CLEAR", "", "", Normal),
        k(Key::Backspace, "⬅", "DROP", "", "", Normal),
    ],
    &[
        k(Key::Alpha, "α", "USER", "ENTRY", "", Shift(ShiftColor::Alpha)),
        k(Key::N7, "7", "", "SOLVE", "", Number),
        k(Key::N8, "8", "", "PLOT", "", Number),
        k(Key::N9, "9", "", "SYMBOLIC", "", Number),
        k(Key::Div, "÷", "( )", "#", "", Number),
    ],
    &[
        k(Key::LeftShift, "", "", "", "", Shift(ShiftColor::Left)),
        k(Key::N4, "4", "", "TIME", "", Number),
        k(Key::N5, "5", "", "STAT", "", Number),
        k(Key::N6, "6", "", "UNITS", "", Number),
        k(Key::Mul, "×", "[ ]", "_", "", Number),
    ],
    &[
        k(Key::RightShift, "", "", "", "", Shift(ShiftColor::Right)),
        k(Key::N1, "1", "", "I/O", "", Number),
        k(Key::N2, "2", "", "LIBRARY", "", Number),
        k(Key::N3, "3", "", "EQ LIB", "", Number),
        k(Key::Minus, "-", "« »", "\" \"", "", Number),
    ],
    &[
        k(Key::On, "ON", "CONT", "OFF", "", Normal),
        k(Key::N0, "0", "=", "→", "", Number),
        k(Key::Dot, ".", ",", "↵", "", Number),
        k(Key::Space, "SPC", "π", "∡", "", Number),
        k(Key::Plus, "+", "{ }", ": :", "", Number),
    ],
];

/// PC keyboard bindings.
pub fn key_for(key: egui::Key) -> Option<Key> {
    use egui::Key as E;
    Some(match key {
        E::Num0 => Key::N0,
        E::Num1 => Key::N1,
        E::Num2 => Key::N2,
        E::Num3 => Key::N3,
        E::Num4 => Key::N4,
        E::Num5 => Key::N5,
        E::Num6 => Key::N6,
        E::Num7 => Key::N7,
        E::Num8 => Key::N8,
        E::Num9 => Key::N9,
        E::Plus | E::Equals => Key::Plus,
        E::Minus => Key::Minus,
        E::Slash => Key::Div,
        E::Period => Key::Dot,
        E::Space => Key::Space,
        E::Enter => Key::Enter,
        E::Backspace => Key::Backspace,
        E::Delete => Key::Del,
        E::ArrowUp => Key::Up,
        E::ArrowDown => Key::Down,
        E::ArrowLeft => Key::Left,
        E::ArrowRight => Key::Right,
        E::Escape => Key::On,
        E::Tab => Key::Alpha,
        E::PageUp => Key::LeftShift,
        E::PageDown => Key::RightShift,
        E::Quote => Key::Quote,
        E::F1 => Key::A,
        E::F2 => Key::B,
        E::F3 => Key::C,
        E::F4 => Key::D,
        E::F5 => Key::E,
        E::F6 => Key::F,
        E::F7 => Key::Mth,
        E::F8 => Key::Prg,
        E::F9 => Key::Cst,
        E::F10 => Key::Var,
        E::F11 => Key::Nxt,
        E::F12 => Key::Eval,
        E::Insert => Key::Sto,
        _ => {
            // Letters press the key that types them in alpha mode.
            let name = key.name();
            if name.len() == 1 {
                let ch = name.chars().next()?.to_ascii_uppercase();
                return ROWS
                    .iter()
                    .flat_map(|r| r.iter())
                    .find(|c| c.alpha.len() == 1 && c.alpha.starts_with(ch))
                    .map(|c| c.key);
            }
            return None;
        }
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    fn cap(key: Key) -> &'static KeyCap {
        ROWS.iter().flat_map(|row| row.iter()).find(|c| c.key == key).unwrap()
    }

    #[test]
    fn modes_come_from_the_annunciators() {
        assert_eq!(Mode::from_annunciators(0x80), Mode::Normal);
        assert_eq!(Mode::from_annunciators(0x81), Mode::Left);
        assert_eq!(Mode::from_annunciators(0x82), Mode::Right);
        assert_eq!(Mode::from_annunciators(0x84), Mode::Alpha);
        assert_eq!(Mode::from_annunciators(0x85), Mode::AlphaLeft);
        assert_eq!(Mode::from_annunciators(0x86), Mode::AlphaRight);
        assert_eq!(Mode::from_annunciators(0x04), Mode::Normal, "the annunciators are off");
    }

    #[test]
    fn keys_give_their_legend_for_the_mode() {
        let sin = cap(Key::Sin);
        let found = [Mode::Normal, Mode::Left, Mode::Right, Mode::Alpha, Mode::AlphaLeft, Mode::AlphaRight]
            .map(|mode| sin.legend(mode).unwrap());
        assert_eq!(found, ["SIN", "ASIN", "∂", "S", "s", "σ"]);
        assert_eq!(cap(Key::N7).legend(Mode::Left), Some("SOLVE"));
        assert_eq!(cap(Key::N7).legend(Mode::Alpha), None);
        assert_eq!(cap(Key::Prg).legend(Mode::Right), None);
    }
}
