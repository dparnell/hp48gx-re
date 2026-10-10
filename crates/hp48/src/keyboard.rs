//! HP48G keyboard matrix.
//!
//! Each key connects one OUT line (0-8) to one IN line (0-5). The ON key is
//! wired to IN bit 15 and reads as pressed whatever OUT holds.

#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum Key {
    A,
    B,
    C,
    D,
    E,
    F,
    Mth,
    Prg,
    Cst,
    Var,
    Up,
    Nxt,
    Quote,
    Sto,
    Eval,
    Left,
    Down,
    Right,
    Sin,
    Cos,
    Tan,
    Sqrt,
    Power,
    Inv,
    Enter,
    Neg,
    Eex,
    Del,
    Backspace,
    Alpha,
    N7,
    N8,
    N9,
    Div,
    LeftShift,
    N4,
    N5,
    N6,
    Mul,
    RightShift,
    N1,
    N2,
    N3,
    Minus,
    On,
    N0,
    Dot,
    Space,
    Plus,
}

impl Key {
    /// All keys from top left to bottom right.
    pub const ALL: [Key; 49] = [
        Key::A, Key::B, Key::C, Key::D, Key::E, Key::F,
        Key::Mth, Key::Prg, Key::Cst, Key::Var, Key::Up, Key::Nxt,
        Key::Quote, Key::Sto, Key::Eval, Key::Left, Key::Down, Key::Right,
        Key::Sin, Key::Cos, Key::Tan, Key::Sqrt, Key::Power, Key::Inv,
        Key::Enter, Key::Neg, Key::Eex, Key::Del, Key::Backspace,
        Key::Alpha, Key::N7, Key::N8, Key::N9, Key::Div,
        Key::LeftShift, Key::N4, Key::N5, Key::N6, Key::Mul,
        Key::RightShift, Key::N1, Key::N2, Key::N3, Key::Minus,
        Key::On, Key::N0, Key::Dot, Key::Space, Key::Plus,
    ];

    /// (OUT line, IN line). `None` for ON, which is wired to IN bit 15.
    pub fn matrix(self) -> Option<(u8, u8)> {
        use Key::*;
        let code: u8 = match self {
            A => 0x14, B => 0x84, C => 0x83, D => 0x82, E => 0x81, F => 0x80,
            Mth => 0x24, Prg => 0x74, Cst => 0x73, Var => 0x72, Up => 0x71, Nxt => 0x70,
            Quote => 0x04, Sto => 0x64, Eval => 0x63, Left => 0x62, Down => 0x61, Right => 0x60,
            Sin => 0x34, Cos => 0x54, Tan => 0x53, Sqrt => 0x52, Power => 0x51, Inv => 0x50,
            Enter => 0x44, Neg => 0x43, Eex => 0x42, Del => 0x41, Backspace => 0x40,
            Alpha => 0x35, N7 => 0x33, N8 => 0x32, N9 => 0x31, Div => 0x30,
            LeftShift => 0x25, N4 => 0x23, N5 => 0x22, N6 => 0x21, Mul => 0x20,
            RightShift => 0x15, N1 => 0x13, N2 => 0x12, N3 => 0x11, Minus => 0x10,
            On => return None,
            N0 => 0x03, Dot => 0x02, Space => 0x01, Plus => 0x00,
        };
        Some((code >> 4, code & 0xF))
    }
}

/// Which keys are currently held, as the matrix sees them.
#[derive(Clone, Debug, Default)]
pub struct Keyboard {
    /// IN bits per OUT line.
    lines: [u16; 9],
    on: bool,
}

impl Keyboard {
    pub fn set(&mut self, key: Key, down: bool) {
        match key.matrix() {
            None => self.on = down,
            Some((out, inp)) => {
                let bit = 1u16 << inp;
                if down {
                    self.lines[usize::from(out)] |= bit;
                } else {
                    self.lines[usize::from(out)] &= !bit;
                }
            }
        }
    }

    /// IN register value for the given OUT register value.
    pub fn input(&self, out: u16) -> u16 {
        let mut v = (0..9)
            .filter(|i| out & (1 << i) != 0)
            .fold(0u16, |acc, i| acc | self.lines[i]);
        if self.on {
            v |= 0x8000;
        }
        v
    }

    pub fn any_down(&self) -> bool {
        self.on || self.lines.iter().any(|&l| l != 0)
    }

    pub fn on_down(&self) -> bool {
        self.on
    }
}
