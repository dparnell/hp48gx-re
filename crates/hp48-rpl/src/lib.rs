//! Reading RPL objects out of HP48 memory.
//!
//! Every object starts with a 5-nibble prolog address naming its type
//! (docs/rom-map.md, tools/rpl.py). Inside composites, anything that is not a
//! prolog is a pointer to an object elsewhere (usually in ROM).

pub mod expr;
pub mod plot;
pub mod show;

/// Prolog addresses (ROM rev R; all are supported entry points).
pub mod prolog {
    pub const DOBINT: u32 = 0x02911;
    pub const DOREAL: u32 = 0x02933;
    pub const DOEREL: u32 = 0x02955;
    pub const DOCMP: u32 = 0x02977;
    pub const DOECMP: u32 = 0x0299D;
    pub const DOCHAR: u32 = 0x029BF;
    pub const DOARRY: u32 = 0x029E8;
    pub const DOLNKARRY: u32 = 0x02A0A;
    pub const DOCSTR: u32 = 0x02A2C;
    pub const DOHSTR: u32 = 0x02A4E;
    pub const DOLIST: u32 = 0x02A74;
    pub const DORRP: u32 = 0x02A96;
    pub const DOSYMB: u32 = 0x02AB8;
    pub const DOEXT: u32 = 0x02ADA;
    pub const DOTAG: u32 = 0x02AFC;
    pub const DOGROB: u32 = 0x02B1E;
    pub const DOLIB: u32 = 0x02B40;
    pub const DOBAK: u32 = 0x02B62;
    pub const DOEXT0: u32 = 0x02B88;
    pub const DOACPTR: u32 = 0x02BAA;
    pub const DOEXT2: u32 = 0x02BCC;
    pub const DOEXT3: u32 = 0x02BEE;
    pub const DOEXT4: u32 = 0x02C10;
    pub const DOCOL: u32 = 0x02D9D;
    pub const DOCODE: u32 = 0x02DCC;
    pub const DOIDNT: u32 = 0x02E48;
    pub const DOLAM: u32 = 0x02E6D;
    pub const DOROMP: u32 = 0x02E92;
    pub const SEMI: u32 = 0x0312B;
}

/// RAM variables (EDB names).
pub const USEROB: u32 = 0x80711;
pub const CONTEXT: u32 = 0x8071B;

/// RAM: address of stack level 1's slot, and of the command line, whose
/// pointer sits just past the stack's last slot and its end marker.
pub const DSKTOP: u32 = 0x806F8;
pub const EDITLINE: u32 = 0x806FD;

/// The objects on the data stack, level 1 first. The depth is counted as
/// `SAVESTACK` (#61D41) counts it.
pub fn stack(mem: &impl Memory) -> Vec<u32> {
    let top = mem.addr(DSKTOP);
    let end = mem.addr(EDITLINE);
    let depth = (end.wrapping_sub(top) / 5).saturating_sub(1).min(10_000);
    (0..depth).map(|i| mem.addr(top + 5 * i)).take_while(|&a| a != 0).collect()
}

/// Read access to the calculator's address space.
pub trait Memory {
    fn nib(&self, addr: u32) -> u8;

    fn value(&self, addr: u32, count: u32) -> u64 {
        (0..count).rev().fold(0u64, |a, i| (a << 4) | u64::from(self.nib((addr + i) & 0xF_FFFF)))
    }

    fn addr(&self, addr: u32) -> u32 {
        self.value(addr, 5) as u32
    }

    fn byte(&self, addr: u32) -> u8 {
        self.value(addr, 2) as u8
    }
}

impl<F: Fn(u32) -> u8> Memory for F {
    fn nib(&self, addr: u32) -> u8 {
        self(addr)
    }
}

#[derive(Clone, Debug, PartialEq)]
pub enum Object {
    Bint(u32),
    Real(f64),
    Complex(f64, f64),
    Char(u8),
    String(String),
    Id(String),
    Lam(String),
    List(Vec<Object>),
    Symbolic(Vec<Object>),
    Program(Vec<Object>),
    /// RPN: the number, then names, prefixes and exponents combined by the
    /// unit operators (kept as `Builtin`), ending with `umEND`.
    Unit(Vec<Object>),
    Tagged(String, Box<Object>),
    /// Real or complex array; `items` in row-major order.
    Array { dims: Vec<u32>, items: Vec<Object> },
    RomPtr { lib: u16, cmd: u16 },
    /// Pointer to a ROM command (a PCO or secondary), e.g. xSIN.
    Builtin(u32),
    /// Anything not decoded further.
    Other { prolog: u32, addr: u32, size: u32 },
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Error {
    NotAnObject(u32),
    Malformed(u32),
    TooDeep,
}

impl std::fmt::Display for Error {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Error::NotAnObject(a) => write!(f, "no RPL object at #{a:05X}"),
            Error::Malformed(a) => write!(f, "malformed object at #{a:05X}"),
            Error::TooDeep => f.write_str("object nesting too deep"),
        }
    }
}

impl std::error::Error for Error {}

pub fn is_prolog(p: u32) -> bool {
    use prolog::*;
    matches!(
        p,
        DOBINT | DOREAL | DOEREL | DOCMP | DOECMP | DOCHAR | DOARRY | DOLNKARRY | DOCSTR | DOHSTR | DOLIST
            | DORRP | DOSYMB | DOEXT | DOTAG | DOGROB | DOLIB | DOBAK | DOEXT0 | DOACPTR | DOEXT2 | DOEXT3
            | DOEXT4 | DOCOL | DOCODE | DOIDNT | DOLAM | DOROMP
    )
}

fn text(mem: &impl Memory, addr: u32, chars: u32) -> String {
    (0..chars).map(|i| hp_char(mem.byte(addr + 2 * i))).collect()
}

/// Characters 128-159 of the calculator's character set; the rest is
/// ISO 8859-1. x-bar (129) has no single Unicode character: ẋ stands in.
const HIGH: [char; 32] = [
    '∡', 'ẋ', '∇', '√', '∫', 'Σ', '▶', 'π', '∂', '≤', '≥', '≠', 'α', '→', '←', '↓', //
    '↑', 'γ', 'δ', 'ε', 'η', 'θ', 'λ', 'ρ', 'σ', 'τ', 'ω', 'Δ', 'Π', 'Ω', '■', '∞',
];

/// The Unicode character for a byte of the calculator's character set.
pub fn hp_char(b: u8) -> char {
    match b {
        128..=159 => HIGH[usize::from(b - 128)],
        _ => char::from(b),
    }
}

/// The calculator byte for a Unicode character, if it has one.
pub fn hp_byte(c: char) -> Option<u8> {
    match c {
        '\0'..='\x7F' | '\u{A0}'..='\u{FF}' => Some(c as u8),
        _ => HIGH.iter().position(|&h| h == c).map(|i| 128 + i as u8),
    }
}

/// Decode a BCD real: exponent (`exp_n` nibbles, 10's complement), mantissa
/// (`mant_n` digits, most significant first in value), sign nibble (9 = -).
pub fn bcd_real(mem: &impl Memory, addr: u32, exp_n: u32, mant_n: u32) -> f64 {
    let mut exp: i64 = 0;
    for i in (0..exp_n).rev() {
        exp = exp * 10 + i64::from(mem.nib(addr + i));
    }
    let lim = 10i64.pow(exp_n);
    if exp >= lim / 2 {
        exp -= lim;
    }
    // Build "d.ddddE+x" and let the float parser round it exactly.
    let digits: String = (0..mant_n)
        .rev()
        .map(|i| char::from(b'0' + mem.nib(addr + exp_n + i).min(9)))
        .collect();
    let sign = if mem.nib(addr + exp_n + mant_n) >= 5 { "-" } else { "" };
    format!("{sign}{}.{}e{exp}", &digits[..1], &digits[1..]).parse().unwrap_or(f64::NAN)
}

/// Total size in nibbles of the object at `addr`.
pub fn size(mem: &impl Memory, addr: u32) -> Result<u32, Error> {
    size_depth(mem, addr, 0)
}

fn size_depth(mem: &impl Memory, addr: u32, depth: u32) -> Result<u32, Error> {
    use prolog::*;
    if depth > 64 {
        return Err(Error::TooDeep);
    }
    let p = mem.addr(addr);
    let b = addr + 5;
    Ok(match p {
        DOBINT => 10,
        DOREAL => 21,
        DOEREL => 26,
        DOCMP => 37,
        DOECMP => 47,
        DOCHAR => 7,
        DOROMP => 11,
        DOACPTR => 15,
        DOARRY | DOLNKARRY | DOCSTR | DOHSTR | DOGROB | DOLIB | DOBAK | DOEXT0 | DOCODE | DOEXT2 | DOEXT3 | DOEXT4 => {
            5 + mem.addr(b)
        }
        DOIDNT | DOLAM => 7 + 2 * u32::from(mem.byte(b)),
        DOTAG => {
            let n = u32::from(mem.byte(b));
            let inner = b + 2 + 2 * n;
            // the tagged object may be a pointer, e.g. to %3 in ROM
            let len = if is_prolog(mem.addr(inner)) { size_depth(mem, inner, depth + 1)? } else { 5 };
            inner + len - addr
        }
        DOCOL | DOLIST | DOSYMB | DOEXT => {
            let mut q = b;
            loop {
                let v = mem.addr(q);
                if v == SEMI {
                    break q + 5 - addr;
                }
                q += if is_prolog(v) { size_depth(mem, q, depth + 1)? } else { 5 };
                if q - addr > 0x4_0000 {
                    return Err(Error::Malformed(addr));
                }
            }
        }
        DORRP => {
            // The directory ends after its last entry.
            let last_field = dir_last_field(mem, addr);
            let off = mem.addr(last_field);
            if off == 0 {
                last_field + 5 - addr
            } else {
                let last = last_field + off;
                let obj = entry_object(mem, last);
                obj + size_depth(mem, obj, depth + 1)? - addr
            }
        }
        _ => return Err(Error::NotAnObject(addr)),
    })
}

/// Address of the "offset to last entry" field of a directory.
/// The 3 nibbles after the prolog count attached libraries (HOME has lib
/// 002, 0AB and 700 attached); #7FF means none.
fn dir_last_field(mem: &impl Memory, dir: u32) -> u32 {
    let libs = mem.value(dir + 5, 3) as u32;
    let libs = if libs == 0x7FF { 0 } else { libs };
    dir + 8 + 13 * libs
}

/// Object address of a directory entry whose name starts at `name`.
fn entry_object(mem: &impl Memory, name: u32) -> u32 {
    let n = u32::from(mem.byte(name));
    if n == 0 {
        name + 2
    } else {
        name + 2 + 2 * n + 2
    }
}

/// Variables of a directory as (name, object address), oldest first.
///
/// Layout: DORRP, attached library count (3) and 13-nibble library
/// entries, offset to the last entry (5); entries are then chained
/// backwards: each name is preceded by a 5-nibble field holding the
/// distance from that field back to the previous entry's name (0 for the
/// first entry).
pub fn dir_entries(mem: &impl Memory, dir: u32) -> Vec<(String, u32)> {
    let field = dir_last_field(mem, dir);
    let off = mem.addr(field);
    let mut out = Vec::new();
    if off == 0 {
        return out;
    }
    let mut name = field + off;
    for _ in 0..4096 {
        let n = u32::from(mem.byte(name));
        out.push((text(mem, name + 2, n), entry_object(mem, name)));
        // The 5-nibble field before each name holds the distance from that
        // field back to the previous entry's name.
        let back = mem.addr(name - 5);
        if back == 0 {
            break;
        }
        name = name - 5 - back;
    }
    out.reverse();
    out
}

/// Look a variable up in `dir`.
pub fn dir_lookup(mem: &impl Memory, dir: u32, name: &str) -> Option<u32> {
    dir_entries(mem, dir).into_iter().find(|(n, _)| n == name).map(|(_, a)| a)
}

/// Look a variable up in the current directory, then in HOME.
pub fn lookup_var(mem: &impl Memory, name: &str) -> Option<u32> {
    let cur = mem.addr(CONTEXT);
    let home = mem.addr(USEROB);
    dir_lookup(mem, cur, name).or_else(|| dir_lookup(mem, home, name))
}

/// Decode the object at `addr`.
pub fn decode(mem: &impl Memory, addr: u32) -> Result<Object, Error> {
    decode_depth(mem, addr, 0)
}

fn decode_depth(mem: &impl Memory, addr: u32, depth: u32) -> Result<Object, Error> {
    use prolog::*;
    if depth > 64 {
        return Err(Error::TooDeep);
    }
    let p = mem.addr(addr);
    let b = addr + 5;
    Ok(match p {
        DOBINT => Object::Bint(mem.addr(b)),
        DOREAL => Object::Real(bcd_real(mem, b, 3, 12)),
        DOEREL => Object::Real(bcd_real(mem, b, 5, 15)),
        DOCMP => Object::Complex(bcd_real(mem, b, 3, 12), bcd_real(mem, b + 16, 3, 12)),
        DOECMP => Object::Complex(bcd_real(mem, b, 5, 15), bcd_real(mem, b + 21, 5, 15)),
        DOCHAR => Object::Char(mem.byte(b)),
        DOCSTR => Object::String(text(mem, b + 5, (mem.addr(b).saturating_sub(5)) / 2)),
        DOIDNT => Object::Id(text(mem, b + 2, u32::from(mem.byte(b)))),
        DOLAM => Object::Lam(text(mem, b + 2, u32::from(mem.byte(b)))),
        DOARRY => array(mem, addr)?,
        DOROMP => Object::RomPtr { lib: mem.value(b, 3) as u16, cmd: mem.value(b + 3, 3) as u16 },
        DOTAG => {
            let n = u32::from(mem.byte(b));
            let inner = b + 2 + 2 * n;
            let obj = if is_prolog(mem.addr(inner)) {
                decode_depth(mem, inner, depth + 1)?
            } else {
                pointer(mem, mem.addr(inner), depth)?
            };
            Object::Tagged(text(mem, b + 2, n), Box::new(obj))
        }
        DOCOL | DOLIST | DOSYMB | DOEXT => {
            let mut items = Vec::new();
            let mut q = b;
            loop {
                let v = mem.addr(q);
                if v == SEMI {
                    break;
                }
                if is_prolog(v) {
                    items.push(decode_depth(mem, q, depth + 1)?);
                    q += size_depth(mem, q, depth + 1)?;
                } else if p == DOEXT {
                    // unit operators (um*, umEND, ...) are empty lists in
                    // ROM, told apart only by address
                    let target = mem.addr(v);
                    items.push(if target == DOCSTR || target == DOCHAR || target == DOREAL {
                        decode_depth(mem, v, depth + 1)?
                    } else {
                        Object::Builtin(v)
                    });
                    q += 5;
                } else {
                    items.push(pointer(mem, v, depth)?);
                    q += 5;
                }
                if q - addr > 0x4_0000 {
                    return Err(Error::Malformed(addr));
                }
            }
            match p {
                DOCOL => Object::Program(items),
                DOLIST => Object::List(items),
                DOSYMB => Object::Symbolic(items),
                _ => Object::Unit(items),
            }
        }
        _ if is_prolog(p) => Object::Other { prolog: p, addr, size: size_depth(mem, addr, depth)? },
        _ => return Err(Error::NotAnObject(addr)),
    })
}

/// Array body: length, element prolog, dimension count, dimensions, then
/// the elements without their prologs.
fn array(mem: &impl Memory, addr: u32) -> Result<Object, Error> {
    use prolog::*;
    let b = addr + 5;
    let elem = mem.addr(b + 5);
    let ndims = mem.addr(b + 10);
    if ndims == 0 || ndims > 2 {
        return Err(Error::Malformed(addr));
    }
    let dims: Vec<u32> = (0..ndims).map(|i| mem.addr(b + 15 + 5 * i)).collect();
    let count = dims.iter().product::<u32>();
    let data = b + 15 + 5 * ndims;
    let width = match elem {
        DOREAL => 16,
        DOCMP => 32,
        _ => return Ok(Object::Other { prolog: DOARRY, addr, size: 5 + mem.addr(b) }),
    };
    if data + count * width > b + mem.addr(b) {
        return Err(Error::Malformed(addr));
    }
    let items = (0..count)
        .map(|i| {
            let e = data + i * width;
            match elem {
                DOREAL => Object::Real(bcd_real(mem, e, 3, 12)),
                _ => Object::Complex(bcd_real(mem, e, 3, 12), bcd_real(mem, e + 16, 3, 12)),
            }
        })
        .collect();
    Ok(Object::Array { dims, items })
}

/// A pointer inside a composite: data objects are followed, commands
/// (programs and primitive code objects) are kept as references.
fn pointer(mem: &impl Memory, target: u32, depth: u32) -> Result<Object, Error> {
    let p = mem.addr(target);
    if is_prolog(p) && p != prolog::DOCOL && p != prolog::DOCODE {
        decode_depth(mem, target, depth + 1)
    } else {
        Ok(Object::Builtin(target))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Memory built from a hex string of nibbles at `base`.
    fn mem(base: u32, hex: &str) -> impl Fn(u32) -> u8 + '_ {
        move |a: u32| {
            a.checked_sub(base)
                .and_then(|i| hex.as_bytes().get(i as usize))
                .map(|c| (*c as char).to_digit(16).unwrap() as u8)
                .unwrap_or(0)
        }
    }

    #[test]
    #[allow(clippy::approx_constant)] // 12-digit pi as the calculator stores it
    fn reals() {
        // 1.0, -2.5E-3, 3.14159265359
        let m = mem(0, "339200000000000000010");
        assert_eq!(decode(&m, 0), Ok(Object::Real(1.0)));
        let m = mem(0, "339207990000000000529");
        assert_eq!(decode(&m, 0), Ok(Object::Real(-2.5e-3)));
        let m = mem(0, "339200009535629514130");
        assert_eq!(decode(&m, 0), Ok(Object::Real(3.14159265359)));
    }

    #[test]
    fn directory_entries() {
        // Captured from the emulator: HOME with its hidden directory and
        // A=1, BC=2 (attached-library entries elided: count 0).
        let hex = concat!(
            "69A20", "000", "A2000", // DORRP, no libraries, offset #2A to the last name
            "00000", "10", "14", "10", "33920", "0000000000000010", // A = 1
            "B1000", "20", "2434", "20", "33920", "0000000000000020", // BC = 2
        );
        let m = mem(0x100, hex);
        let e = dir_entries(&m, 0x100);
        let names: Vec<&str> = e.iter().map(|(n, _)| n.as_str()).collect();
        assert_eq!(names, ["A", "BC"]);
        assert_eq!(decode(&m, e[1].1), Ok(Object::Real(2.0)));
        assert_eq!(size(&m, 0x100), Ok(hex.len() as u32));
    }

    #[test]
    fn symbolic_compiles() {
        // 'SIN(X)+1': X xSIN %1 x+
        let obj = Object::Symbolic(vec![
            Object::Id("X".into()),
            Object::Builtin(0x1B4AC),
            Object::Real(1.0),
            Object::Builtin(0x1AB67),
        ]);
        let e = expr::compile(&obj).unwrap();
        let v = e.eval(&|n| (n == "X").then_some(90.0), expr::Angle::Degrees);
        assert!((v - 2.0).abs() < 1e-12);
    }
}
