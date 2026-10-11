//! Objects as text, the way the calculator writes them (`→STR` and the
//! stack display).
//!
//! The rules come from the ROM: `crates/hp48/tests/show.rs` compares this
//! module with `→STR` on the emulated calculator. Command names are read from
//! the running ROM's libraries (`Names`), so a rebuilt ROM is covered too.

use crate::plot::system_flag;
use crate::{prolog, Memory, Object};
use std::collections::HashMap;

/// `ROMPTAB` (RAM): a 3-nibble count, then 16-nibble entries that start with
/// the library number (3) and the address of its header (5).
const ROMPTAB: u32 = 0x809A3;

/// Names of the commands in the libraries the calculator has attached.
#[derive(Clone, Debug, Default)]
pub struct Names {
    /// Command address -> name.
    pub commands: HashMap<u32, String>,
    /// (library, command) -> name, for `XLIB` pointers.
    pub xlib: HashMap<(u16, u16), String>,
}

impl Names {
    /// Read every library in `ROMPTAB`. `ram` is the calculator's address
    /// space as the CPU sees it; `rom` is the ROM image, which holds the
    /// libraries that bank switching hides from `ram`.
    pub fn read(ram: &impl Memory, rom: &impl Memory) -> Self {
        let mut names = Names::default();
        let count = ram.value(ROMPTAB, 3) as u32;
        for i in 0..count.min(256) {
            let entry = ROMPTAB + 3 + 16 * i;
            let lib = ram.value(entry, 3) as u16;
            let h = ram.addr(entry + 3);
            if rom.value(h, 3) == u64::from(lib) {
                names.add_library(rom, rom, lib, h);
            } else if ram.value(h, 3) == u64::from(lib) {
                names.add_library(ram, rom, lib, h);
            }
        }
        names
    }

    /// `h`: the library number field of a library header, followed by
    /// self-relative offsets to the hash, message, link and config tables.
    /// A table may be an access pointer (`DOACPTR`) to banked ROM.
    fn add_library(&mut self, mem: &impl Memory, rom: &impl Memory, lib: u16, h: u32) {
        let table = |field: u32| {
            let off = mem.addr(field);
            let t = (field + off) & 0xF_FFFF;
            (off != 0 && mem.addr(t) == prolog::DOHSTR).then_some(t)
        };
        let mut by_cmd = HashMap::new();
        let hash = {
            let off = mem.addr(h + 3);
            let t = (h + 3 + off) & 0xF_FFFF;
            match mem.addr(t) {
                _ if off == 0 => None,
                prolog::DOHSTR => Some((t, false)),
                prolog::DOACPTR if rom.addr(mem.addr(t + 5)) == prolog::DOHSTR => Some((mem.addr(t + 5), true)),
                _ => None,
            }
        };
        if let Some((ht, banked)) = hash {
            if banked {
                read_names(rom, ht, &mut by_cmd);
            } else {
                read_names(mem, ht, &mut by_cmd);
            }
        }
        if let Some(lt) = table(h + 13) {
            let n = (mem.addr(lt + 5).saturating_sub(5)) / 5;
            for cmd in 0..n.min(4096) {
                let slot = lt + 10 + 5 * cmd;
                let addr = (slot + mem.addr(slot)) & 0xF_FFFF;
                if let Some(name) = by_cmd.get(&(cmd as u16)) {
                    self.commands.entry(addr).or_insert_with(|| name.clone());
                }
            }
        }
        for (cmd, name) in by_cmd {
            // the algebraic form of XROOT is the next command, without a name
            if lib == 2 && name == "XROOT" {
                if let Some(lt) = table(h + 13) {
                    let slot = lt + 10 + 5 * (u32::from(cmd) + 1);
                    let addr = (slot + mem.addr(slot)) & 0xF_FFFF;
                    self.commands.entry(addr).or_insert_with(|| name.clone());
                }
            }
            self.xlib.insert((lib, cmd), name);
        }
    }

    pub fn command(&self, addr: u32) -> Option<&str> {
        self.commands.get(&addr).map(String::as_str)
    }
}

/// A hash table's names: 16 offsets (one per name length), then the size
/// of the name area and the names, each followed by its command number.
fn read_names(mem: &impl Memory, ht: u32, by_cmd: &mut HashMap<u16, String>) {
    let area = ht + 10 + 16 * 5;
    let stop = area + mem.addr(area);
    let end = ht + 5 + mem.addr(ht + 5);
    let mut q = area + 5;
    while q < stop.min(end) {
        let n = u32::from(mem.byte(q));
        if n == 0 || n > 40 {
            break;
        }
        let name: String = (0..n).map(|i| crate::hp_char(mem.byte(q + 2 + 2 * i))).collect();
        let cmd = mem.value(q + 2 + 2 * n, 3) as u16;
        by_cmd.insert(cmd, name);
        q += 2 + 2 * n + 3;
    }
}

/// Number display mode (flags -49 and -50, digits in -45..-48).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Mode {
    Std,
    Fix(u8),
    Sci(u8),
    Eng(u8),
}

/// Base for binary integers (flags -11 and -12).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Base {
    Dec,
    Bin,
    Oct,
    Hex,
}

/// The display settings that change how objects are written.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct Format {
    pub mode: Mode,
    /// Flag -51: comma as the fraction mark (and `;` between parts).
    pub comma: bool,
    pub base: Base,
    /// Binary integer word size in bits, 1..64 (flags -5..-10 hold it minus one).
    pub wordsize: u32,
}

impl Default for Format {
    fn default() -> Self {
        Format { mode: Mode::Std, comma: false, base: Base::Hex, wordsize: 64 }
    }
}

impl Format {
    /// The settings in the calculator's system flags.
    pub fn from_flags(mem: &impl Memory) -> Self {
        let f = |n| system_flag(mem, n);
        let digits = (45..=48).enumerate().map(|(i, n)| u8::from(f(n)) << i).sum::<u8>();
        let mode = match (f(49), f(50)) {
            (false, false) => Mode::Std,
            (true, false) => Mode::Fix(digits),
            (false, true) => Mode::Sci(digits),
            (true, true) => Mode::Eng(digits),
        };
        let base = match (f(11), f(12)) {
            (false, false) => Base::Dec,
            (true, false) => Base::Oct,
            (false, true) => Base::Bin,
            (true, true) => Base::Hex,
        };
        let wordsize = 1 + (5..=10).enumerate().map(|(i, n)| u32::from(f(n)) << i).sum::<u32>();
        Format { mode, comma: f(51), base, wordsize }
    }

    /// A real number.
    pub fn real(&self, v: f64) -> String {
        let s = self.real_dot(v);
        if self.comma {
            s.replace('.', ",")
        } else {
            s
        }
    }

    /// A number inside an algebraic or a unit: whole numbers below 1000
    /// are written as in STD (`'X^2'` in FIX 3), others in the display mode.
    pub fn inline_real(&self, v: f64) -> String {
        if v.fract() == 0.0 && v.abs() < 1000.0 {
            Format { mode: Mode::Std, ..*self }.real(v)
        } else {
            self.real(v)
        }
    }

    fn real_dot(&self, v: f64) -> String {
        if !v.is_finite() {
            return format!("{v}");
        }
        let sign = if v < 0.0 { "-" } else { "" };
        let Some((d, e)) = digits(v) else {
            return match self.mode {
                Mode::Fix(n) => format!("0.{}", "0".repeat(usize::from(n))),
                Mode::Sci(n) | Mode::Eng(n) => format!("0.{}E0", "0".repeat(usize::from(n))),
                Mode::Std => "0".into(),
            };
        };
        let body = match self.mode {
            Mode::Std => std(&d, e),
            Mode::Fix(n) => fix(&d, e, n),
            Mode::Sci(n) => {
                let (d, e) = round(&d, e, i32::from(n) + 1);
                sci(&d, e, usize::from(n) + 1)
            }
            Mode::Eng(n) => {
                let (d, e) = round(&d, e, i32::from(n) + 1);
                eng(&d, e, usize::from(n) + 1)
            }
        };
        format!("{sign}{body}")
    }

    fn separator(&self) -> char {
        if self.comma {
            ';'
        } else {
            ','
        }
    }

    /// A binary integer (`# 1Fh`), cut to the word size.
    pub fn binary(&self, v: u64) -> String {
        let v = if self.wordsize >= 64 { v } else { v & ((1u64 << self.wordsize) - 1) };
        match self.base {
            Base::Dec => format!("# {v}d"),
            Base::Bin => format!("# {v:b}b"),
            Base::Oct => format!("# {v:o}o"),
            Base::Hex => format!("# {v:X}h"),
        }
    }
}

/// The 12 significant digits and the decimal exponent of `v` (None for 0).
fn digits(v: f64) -> Option<(Vec<u8>, i32)> {
    if v == 0.0 {
        return None;
    }
    let s = format!("{:.11e}", v.abs());
    let (m, e) = s.split_once('e')?;
    let d = m.bytes().filter(u8::is_ascii_digit).map(|b| b - b'0').collect();
    Some((d, e.parse().ok()?))
}

/// Round to `keep` significant digits (half up), keeping 12 digits.
fn round(d: &[u8], e: i32, keep: i32) -> (Vec<u8>, i32) {
    let keep = keep.clamp(0, 12) as usize;
    let mut out = d.to_vec();
    let up = d.get(keep).is_some_and(|&x| x >= 5);
    out[keep..].iter_mut().for_each(|x| *x = 0);
    if up {
        let mut i = keep;
        loop {
            if i == 0 {
                out.insert(0, 1);
                out.truncate(12);
                return (out, e + 1);
            }
            i -= 1;
            if out[i] == 9 {
                out[i] = 0;
            } else {
                out[i] += 1;
                break;
            }
        }
    }
    (out, e)
}

fn digit_str(d: &[u8]) -> String {
    d.iter().map(|x| char::from(b'0' + x)).collect()
}

/// Significant digits with trailing zeros removed.
fn trimmed(d: &[u8]) -> &[u8] {
    let n = d.iter().rposition(|&x| x != 0).map_or(1, |i| i + 1);
    &d[..n]
}

/// STD: as many digits as needed; positional if that fits in 12 digits.
fn std(d: &[u8], e: i32) -> String {
    let d = trimmed(d);
    let n = d.len() as i32;
    if (0..12).contains(&e) {
        let int = (e + 1) as usize;
        let mut s = digit_str(&d[..int.min(d.len())]);
        s.push_str(&"0".repeat(int.saturating_sub(d.len())));
        if d.len() > int {
            s.push('.');
            s.push_str(&digit_str(&d[int..]));
        }
        s
    } else if e < 0 && -e - 1 + n <= 12 {
        format!(".{}{}", "0".repeat((-e - 1) as usize), digit_str(d))
    } else {
        sci(d, e, d.len())
    }
}

/// `d.ddd` with `n` digits, then the exponent.
fn sci(d: &[u8], e: i32, n: usize) -> String {
    let n = n.clamp(1, 12);
    format!("{}.{}E{e}", d[0], digit_str(&d[1..n]))
}

/// SCI with the exponent a multiple of three.
fn eng(d: &[u8], e: i32, n: usize) -> String {
    let n = n.clamp(1, 12);
    let shift = e.rem_euclid(3) as usize;
    let int = shift + 1;
    let mut s = digit_str(&d[..int.min(n)]);
    s.push_str(&"0".repeat(int.saturating_sub(n)));
    s.push('.');
    if n > int {
        s.push_str(&digit_str(&d[int..n]));
    }
    format!("{s}E{}", e - shift as i32)
}

/// FIX n: `n` decimals; SCI n when the number is too large, or nonzero but
/// rounds to zero.
fn fix(d: &[u8], e: i32, n: u8) -> String {
    let keep = e + 1 + i32::from(n);
    if e >= 12 {
        let (d, e) = round(d, e, i32::from(n) + 1);
        return sci(&d, e, usize::from(n) + 1);
    }
    let (r, e2) = if keep >= 0 { round(d, e, keep) } else { (vec![0; 12], e) };
    if keep < 0 || (keep == 0 && e2 == e) || r.iter().all(|&x| x == 0) {
        let (d, e) = round(d, e, i32::from(n) + 1);
        return sci(&d, e, usize::from(n) + 1);
    }
    if e2 >= 12 {
        return sci(&r, e2, usize::from(n) + 1);
    }
    // digits of the integer part, then n decimals
    let mut s = if e2 >= 0 {
        let int = (e2 + 1) as usize;
        let mut s = digit_str(&r[..int.min(12)]);
        s.push_str(&"0".repeat(int.saturating_sub(12)));
        s
    } else {
        "0".into()
    };
    s.push('.');
    // at most 12 digits in all: 123456789012 in FIX 3 is "123456789012."
    let decimals = i32::from(n).min(11 - e2.max(0));
    for i in 0..decimals {
        // digit at position 10^-(i+1)
        let idx = e2 + 1 + i;
        s.push(if (0..12).contains(&idx) { char::from(b'0' + r[idx as usize]) } else { '0' });
    }
    s
}

/// Operator precedence in algebraics, from loosest to tightest.
const P_EQ: u8 = 1;
const P_OR: u8 = 2;
const P_AND: u8 = 3;
const P_NOT: u8 = 4;
const P_CMP: u8 = 5;
const P_ADD: u8 = 6;
const P_MUL: u8 = 7;
const P_NEG: u8 = 8;
const P_POW: u8 = 9;
const P_ATOM: u8 = 10;

fn infix(name: &str) -> Option<u8> {
    Some(match name {
        "=" => P_EQ,
        "OR" | "XOR" => P_OR,
        "AND" => P_AND,
        "<" | ">" | "≤" | "≥" | "==" | "≠" => P_CMP,
        "+" | "-" => P_ADD,
        "*" | "/" => P_MUL,
        "^" => P_POW,
        _ => return None,
    })
}

/// Arguments of functions that take more than one.
fn arity(name: &str) -> usize {
    match name {
        "π" | "e" | "i" | "MAXR" | "MINR" => 0,
        "MAX" | "MIN" | "MOD" | "XROOT" | "%" | "%T" | "%CH" | "COMB" | "PERM" | "RND" | "TRNC" | "∂" | "|"
        | "UTPC" | "UTPT" => 2,
        "IFTE" | "UTPN" => 3,
        "∫" | "Σ" | "UTPF" => 4,
        _ => 1,
    }
}

/// Everything needed to write objects: memory (for objects that are only
/// referenced), command names and the display settings.
pub struct Writer<'a, M: Memory> {
    pub mem: &'a M,
    pub names: &'a Names,
    pub format: Format,
}

impl<M: Memory> Writer<'_, M> {
    /// An object as the stack shows it.
    pub fn show(&self, obj: &Object) -> String {
        self.write(obj, true)
    }

    /// `top`: names are quoted on their own, bare inside composites.
    fn write(&self, obj: &Object, top: bool) -> String {
        match obj {
            Object::Real(v) => self.format.real(*v),
            Object::Complex(re, im) => {
                format!("({}{}{})", self.format.real(*re), self.format.separator(), self.format.real(*im))
            }
            Object::Bint(v) => {
                let b = self.format.binary(u64::from(*v));
                format!("<{}>", b.trim_start_matches("# "))
            }
            Object::Char(c) => format!("Character {}", crate::hp_char(*c)),
            Object::String(s) => format!("\"{s}\""),
            Object::Id(n) | Object::Lam(n) => {
                if top {
                    format!("'{n}'")
                } else {
                    n.clone()
                }
            }
            Object::List(items) => self.sequence("{", items, "}"),
            Object::Program(items) => {
                // user programs begin with the command « and end with »
                let inner = match items.first() {
                    Some(Object::Builtin(a)) if self.names.command(*a) == Some("«") => &items[1..items.len() - 1],
                    _ => items,
                };
                self.sequence("«", inner, "»")
            }
            Object::Symbolic(items) => format!("'{}'", self.algebraic(items)),
            Object::Unit(items) => self.unit(items),
            Object::Tagged(tag, inner) => format!(":{tag}: {}", self.write(inner, false)),
            Object::Array { dims, items } => self.array(dims, items),
            Object::RomPtr { lib, cmd } => match self.names.xlib.get(&(*lib, *cmd)) {
                Some(n) => n.clone(),
                None => format!("XLIB {lib} {cmd}"),
            },
            Object::Builtin(a) => self.names.command(*a).map_or_else(|| "External".into(), String::from),
            Object::Other { prolog, addr, size } => self.other(*prolog, *addr, *size),
        }
    }

    fn sequence(&self, open: &str, items: &[Object], close: &str) -> String {
        let mut s = String::from(open);
        for it in items {
            s.push(' ');
            s.push_str(&self.write(it, false));
        }
        s.push(' ');
        s.push_str(close);
        s
    }

    fn array(&self, dims: &[u32], items: &[Object]) -> String {
        let cell = |o: &Object| self.write(o, false);
        if dims.len() == 1 {
            let cells: Vec<String> = items.iter().map(cell).collect();
            return format!("[ {} ]", cells.join(" "));
        }
        let cols = dims[1].max(1) as usize;
        let rows: Vec<String> = items
            .chunks(cols)
            .map(|r| format!("[ {} ]", r.iter().map(cell).collect::<Vec<_>>().join(" ")))
            .collect();
        format!("[{}]", rows.join("\n "))
    }

    fn other(&self, p: u32, addr: u32, size: u32) -> String {
        use prolog::*;
        let m = self.mem;
        match p {
            DOHSTR => {
                let n = size.saturating_sub(10).min(16);
                self.format.binary(m.value(addr + 10, n))
            }
            DOGROB => format!("Graphic {} × {}", m.addr(addr + 15), m.addr(addr + 10)),
            DORRP => "Directory".into(),
            DOLIB => {
                let n = u32::from(m.byte(addr + 10));
                let name: String = (0..n).map(|i| crate::hp_char(m.byte(addr + 12 + 2 * i))).collect();
                let num_at = if n == 0 { addr + 12 } else { addr + 12 + 2 * n + 2 };
                format!("Library {}:  {name}", m.value(num_at, 3))
            }
            DOBAK => "Backup".into(),
            DOCODE => "Code".into(),
            DOLNKARRY => "Linked Array".into(),
            DOEXT0 => "Library Data".into(),
            DOEREL => format!("Long Real {}", self.format.real(crate::bcd_real(m, addr + 5, 5, 15))),
            DOECMP => "Long Complex".into(),
            _ => "External".into(),
        }
    }

    /// Unit objects: the number, then the unit in RPN with the operators
    /// `um*`, `um/`, `um^`, `umP`, ending with `umEND`. The five operators
    /// are consecutive 10-nibble objects, so `umEND` locates the others.
    fn unit(&self, items: &[Object]) -> String {
        let Some(Object::Builtin(end)) = items.last() else { return "Unit".into() };
        let end = *end;
        let mut stack: Vec<String> = Vec::new();
        let mut number = String::new();
        for (i, it) in items[..items.len() - 1].iter().enumerate() {
            match it {
                Object::Real(v) if i == 0 => number = self.format.inline_real(*v),
                Object::Real(v) => stack.push(self.format.inline_real(*v)),
                Object::String(s) => stack.push(s.clone()),
                Object::Char(c) => stack.push(crate::hp_char(*c).to_string()),
                Object::Builtin(a) => {
                    let (Some(b), Some(a2)) = (stack.pop(), stack.pop()) else { return "Unit".into() };
                    let op = match end.wrapping_sub(*a) {
                        40 => "*",
                        30 => "/",
                        20 => "^",
                        10 => "",
                        _ => return "Unit".into(),
                    };
                    stack.push(format!("{a2}{op}{b}"));
                }
                _ => return "Unit".into(),
            }
        }
        format!("{number}_{}", stack.join("*"))
    }

    /// An algebraic's items (RPN) as infix text.
    pub fn algebraic(&self, items: &[Object]) -> String {
        self.infix(items).unwrap_or_else(|| {
            let parts: Vec<String> = items.iter().map(|o| self.write(o, false)).collect();
            parts.join(" ")
        })
    }

    fn infix(&self, items: &[Object]) -> Option<String> {
        // (text, precedence)
        let mut stack: Vec<(String, u8)> = Vec::new();
        let paren = |(t, _): (String, u8), need: bool| if need { format!("({t})") } else { t };
        let mut i = 0;
        while i < items.len() {
            let it = &items[i];
            i += 1;
            match it {
                Object::Symbolic(inner) => {
                    let t = self.infix(inner)?;
                    let p = self.precedence_of(inner);
                    stack.push((t, p));
                }
                Object::Real(v) => stack.push((self.format.inline_real(*v), if *v < 0.0 { P_NEG } else { P_ATOM })),
                Object::Bint(n) if matches!(items.get(i), Some(Object::Builtin(_))) && self.is_fcnapply(&items[i]) => {
                    // user function: args..., 'F', count, FCNAPPLY
                    i += 1;
                    let (f, _) = stack.pop()?;
                    let n = *n as usize;
                    if stack.len() < n {
                        return None;
                    }
                    let args: Vec<String> = stack.split_off(stack.len() - n).into_iter().map(|a| a.0).collect();
                    stack.push((format!("{f}({})", args.join(&self.format.separator().to_string())), P_ATOM));
                }
                Object::Builtin(a) => {
                    let name = self.names.command(*a)?;
                    if let Some(p) = infix(name) {
                        let r = stack.pop()?;
                        let l = stack.pop()?;
                        let lp = l.1 < p;
                        let rp = r.1 <= p && r.1 != P_NEG;
                        let (l, r) = (paren(l, lp), paren(r, rp));
                        let word = name.chars().all(|c| c.is_ascii_alphabetic());
                        let t = match (word, rp) {
                            (true, true) => format!("{l} {name}{r}"),
                            (true, false) => format!("{l} {name} {r}"),
                            _ => format!("{l}{name}{r}"),
                        };
                        stack.push((t, p));
                    } else if name == "NEG" {
                        let a = stack.pop()?;
                        let need = a.1 < P_NEG;
                        stack.push((format!("-{}", paren(a, need)), P_NEG));
                    } else if name == "NOT" {
                        let a = stack.pop()?;
                        let need = a.1 < P_NOT;
                        let t = if need { format!("NOT({})", a.0) } else { format!("NOT {}", a.0) };
                        stack.push((t, P_NOT));
                    } else if name == "√" {
                        let a = stack.pop()?;
                        let need = a.1 < P_ATOM;
                        stack.push((format!("√{}", paren(a, need)), P_POW));
                    } else {
                        let n = arity(name);
                        if stack.len() < n {
                            return None;
                        }
                        let args: Vec<String> = stack.split_off(stack.len() - n).into_iter().map(|a| a.0).collect();
                        let t = if n == 0 {
                            name.to_string()
                        } else {
                            format!("{name}({})", args.join(&self.format.separator().to_string()))
                        };
                        stack.push((t, P_ATOM));
                    }
                }
                other => stack.push((self.write(other, false), P_ATOM)),
            }
        }
        (stack.len() == 1).then(|| stack.pop().unwrap().0)
    }

    /// `xFCNAPPLY`, which applies a user function, has no command name.
    fn is_fcnapply(&self, o: &Object) -> bool {
        matches!(o, Object::Builtin(a) if self.names.command(*a).is_none())
    }

    /// Precedence of a nested algebraic's top operator.
    fn precedence_of(&self, items: &[Object]) -> u8 {
        match items.last() {
            Some(Object::Builtin(a)) => match self.names.command(*a) {
                Some(n) if infix(n).is_some() => infix(n).unwrap(),
                Some("NEG") => P_NEG,
                Some("NOT") => P_NOT,
                _ => P_ATOM,
            },
            Some(Object::Real(v)) if *v < 0.0 && items.len() == 1 => P_NEG,
            _ => P_ATOM,
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn std(v: f64) -> String {
        Format::default().real(v)
    }

    #[test]
    fn standard_reals() {
        // as →STR writes them on revision R
        assert_eq!(std(1.0), "1");
        assert_eq!(std(1e12), "1.E12");
        assert_eq!(std(123456789012.0), "123456789012");
        assert_eq!(std(0.00001234), ".00001234");
        assert_eq!(std(0.5), ".5");
        assert_eq!(std(-2.5e-13), "-2.5E-13");
        assert_eq!(std(1e-12), ".000000000001");
        assert_eq!(std(1.23456789012e-5), "1.23456789012E-5");
        assert_eq!(std(1.23456789012e13), "1.23456789012E13");
    }

    #[test]
    fn modes() {
        let f = |mode| Format { mode, ..Format::default() };
        assert_eq!(f(Mode::Fix(2)).real(0.5), "0.50");
        assert_eq!(f(Mode::Fix(2)).real(-0.5), "-0.50");
        assert_eq!(f(Mode::Fix(2)).real(0.0), "0.00");
        assert_eq!(f(Mode::Fix(2)).real(0.004), "4.00E-3");
        assert_eq!(f(Mode::Fix(2)).real(0.001), "1.00E-3");
        assert_eq!(f(Mode::Fix(2)).real(1234567.891), "1234567.89");
        assert_eq!(f(Mode::Fix(2)).real(1e15), "1.00E15");
        assert_eq!(f(Mode::Fix(0)).real(2.5), "3.");
        assert_eq!(f(Mode::Fix(0)).real(123.0), "123.");
        assert_eq!(f(Mode::Sci(3)).real(1234.5), "1.235E3");
        assert_eq!(f(Mode::Sci(0)).real(2.5), "3.E0");
        assert_eq!(f(Mode::Eng(2)).real(12345.0), "12.3E3");
        assert_eq!(f(Mode::Eng(2)).real(0.00012), "120.E-6");
        let comma = Format { comma: true, ..Format::default() };
        assert_eq!(comma.real(1.5), "1,5");
    }
}
