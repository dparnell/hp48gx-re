//! Calculator faceplate: key layout and legends.
//!
//! Legends are the HP48G/GX ones (cross-checked with x48ng's 48gx table and
//! with the ROM: right-shift 7 opens the SOLVE application, left-shift 7 the
//! SOLVE menu). `left` is the purple left-shift legend, `right` the green
//! right-shift legend, `alpha` the letter typed in alpha mode.

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
