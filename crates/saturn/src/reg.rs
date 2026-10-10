//! Working registers and field selection.

use std::fmt;

/// A 64-bit Saturn register viewed as 16 nibbles (nibble 0 least significant).
#[derive(Clone, Copy, Default, PartialEq, Eq)]
pub struct Reg(pub u64);

impl Reg {
    #[inline]
    pub fn nib(self, i: usize) -> u8 {
        ((self.0 >> (4 * i)) & 0xF) as u8
    }

    #[inline]
    pub fn set_nib(&mut self, i: usize, v: u8) {
        let sh = 4 * i;
        self.0 = (self.0 & !(0xF << sh)) | (u64::from(v & 0xF) << sh);
    }

    /// The low 20 bits (the A field) as an address.
    #[inline]
    pub fn a(self) -> u32 {
        (self.0 & 0xF_FFFF) as u32
    }

    #[inline]
    pub fn set_a(&mut self, v: u32) {
        self.0 = (self.0 & !0xF_FFFF) | u64::from(v & 0xF_FFFF);
    }
}

impl fmt::Debug for Reg {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:016X}", self.0)
    }
}

/// Field selector. `Nibbles(n)` is the "nibbles 0..n-1" form used by
/// `DATn=r n` / `r=DATn n` (n = 1..=16).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Field {
    P,
    WP,
    XS,
    X,
    S,
    M,
    B,
    W,
    A,
    Nibbles(u8),
}

impl Field {
    /// Field codes 0-7 as used by most instructions.
    pub fn from_code(c: u8) -> Field {
        [Field::P, Field::WP, Field::XS, Field::X, Field::S, Field::M, Field::B, Field::W][usize::from(c & 7)]
    }

    /// Field codes for 0E/818/819/81A: F = A, otherwise the low 3 bits.
    pub fn from_code_a(c: u8) -> Field {
        if c == 0xF {
            Field::A
        } else {
            Field::from_code(c)
        }
    }

    /// Inclusive nibble range (lo, hi) for the current P.
    #[inline]
    pub fn range(self, p: u8) -> (usize, usize) {
        match self {
            Field::P => (usize::from(p), usize::from(p)),
            Field::WP => (0, usize::from(p)),
            Field::XS => (2, 2),
            Field::X => (0, 2),
            Field::S => (15, 15),
            Field::M => (3, 14),
            Field::B => (0, 1),
            Field::W => (0, 15),
            Field::A => (0, 4),
            Field::Nibbles(n) => (0, usize::from(n.max(1)) - 1),
        }
    }
}

impl fmt::Display for Field {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Field::Nibbles(n) => write!(f, "{n}"),
            other => write!(f, "{other:?}"),
        }
    }
}

/// Working register names.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum R {
    A,
    B,
    C,
    D,
}

impl R {
    pub fn from_code(c: u8) -> R {
        [R::A, R::B, R::C, R::D][usize::from(c & 3)]
    }
}

impl fmt::Display for R {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{self:?}")
    }
}
