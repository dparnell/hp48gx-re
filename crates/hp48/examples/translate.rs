//! Translate the ROM's machine code into Rust: writes crates/hp48-rom/src/gen/.
//!
//! cargo run --release -p hp48 --example translate -- [ROM]
//!
//! The code translated is every instruction in data/executed.txt (recorded
//! by execmap over the tour). Each becomes a function that runs it and, if
//! execution falls through to another translated instruction, calls that
//! one's function. An instruction that changes the machine's configuration
//! or interrupts, or calls a subroutine, ends the run. See hp48::translated
//! for how the functions run.

use hp48::Machine;
use saturn::op::decode;
use saturn::Op;
use std::collections::{BTreeMap, BTreeSet};
use std::fmt::Write;

/// Instructions after which execution never falls through.
fn ends(op: &Op) -> bool {
    matches!(op, Op::Rtn(_) | Op::Jump(_) | Op::PcIndirect(_) | Op::PcFrom(_) | Op::PcEx(_) | Op::Illegal)
}

/// Instructions that end a block but may fall through: the next one starts
/// a block of its own.
fn breaks(op: &Op) -> bool {
    matches!(
        op,
        Op::Call(_)
            | Op::Shutdn
            | Op::Config
            | Op::Uncnfg
            | Op::Reset
            | Op::IntOn
            | Op::IntOff
            | Op::Rsi
            | Op::BusCb
            | Op::BusCc
            | Op::BusCd
            | Op::Sreq
    )
}

/// The enum that an unqualified variant name belongs to, from where it
/// stands in an `Op`'s Debug text.
fn qualify(word: &str, key: Option<&str>, parens: &[String], top: bool) -> String {
    if top {
        return format!("Op::{word}");
    }
    if matches!(word, "true" | "false" | "None" | "Some") {
        return word.to_string();
    }
    let ty = match parens.last().map(String::as_str) {
        Some("Rtn") => "RtnKind",
        Some("CondRtn" | "CondJump") => "Cond",
        Some("Regs") if matches!(word, "Eq" | "Ne" | "Gt" | "Lt" | "Ge" | "Le") => "Cmp",
        Some("Regs" | "Zero" | "NonZero" | "In" | "Srb" | "PcIndirect" | "PcFrom" | "PcTo" | "PcEx") => "R",
        _ => match key {
            Some("f") => "Field",
            Some("r" | "dst" | "src" | "a" | "b") => "R",
            Some("test") => "Test",
            Some("op") => "ScratchOp",
            k => panic!("cannot place {word} after {k:?}"),
        },
    };
    format!("{ty}::{word}")
}

/// An `Op` as a Rust expression.
fn rust(op: &Op) -> String {
    let text = format!("{op:?}");
    let chars: Vec<char> = text.chars().collect();
    let mut out = String::new();
    let (mut key, mut parens, mut i, mut top) = (None::<String>, Vec::<String>::new(), 0, true);
    let mut last_word = String::new();
    while i < chars.len() {
        let c = chars[i];
        if c.is_ascii_alphabetic() || c == '_' {
            let start = i;
            while i < chars.len() && (chars[i].is_ascii_alphanumeric() || chars[i] == '_') {
                i += 1;
            }
            let word: String = chars[start..i].iter().collect();
            if chars.get(i) == Some(&':') {
                out.push_str(&word);
                key = Some(word);
            } else {
                out.push_str(&qualify(&word, key.as_deref(), &parens, top));
                top = false;
                last_word = word;
            }
            continue;
        }
        if c.is_ascii_digit() {
            let start = i;
            while i < chars.len() && chars[i].is_ascii_digit() {
                i += 1;
            }
            let n: u64 = chars[start..i].iter().collect::<String>().parse().unwrap();
            if n > 9 {
                write!(out, "0x{n:X}").unwrap();
            } else {
                write!(out, "{n}").unwrap();
            }
            continue;
        }
        match c {
            '(' => parens.push(std::mem::take(&mut last_word)),
            ')' => {
                parens.pop();
            }
            '{' => parens.push(String::new()),
            '}' => {
                parens.pop();
            }
            _ => {}
        }
        out.push(c);
        i += 1;
    }
    out
}

fn main() {
    let path = std::env::args().nth(1).unwrap_or_else(|| "ROM/gxrom-r".into());
    let image = std::fs::read(&path).unwrap_or_else(|e| panic!("{path}: {e}"));
    let m = Machine::new(&image);
    let rom = &m.hw.rom;
    let fetch = |a: u32| rom[(a & 0xF_FFFF) as usize];

    let executed: BTreeSet<u32> = std::fs::read_to_string("data/executed.txt")
        .expect("data/executed.txt")
        .lines()
        .filter(|l| l.len() == 5)
        .filter_map(|l| u32::from_str_radix(l, 16).ok())
        .collect();
    let code: BTreeMap<u32, (Op, u32)> = executed.iter().map(|&a| (a, decode(a, fetch))).collect();

    // Where execution goes on after each instruction, if it falls through
    // to translated code, and the last address of the run from each one.
    let follows = |a: u32, op: &Op, len: u32| {
        let next = (a + len) & 0xF_FFFF;
        (!ends(op) && !breaks(op) && next > a && code.contains_key(&next)).then_some(next)
    };
    let mut last: BTreeMap<u32, u32> = BTreeMap::new();
    for (&a, (op, len)) in code.iter().rev() {
        let end = match follows(a, op, *len) {
            Some(next) => last[&next],
            None => a + len - 1,
        };
        last.insert(a, end);
    }

    let names: BTreeMap<u32, String> = std::fs::read_to_string("data/entries48g.txt")
        .unwrap_or_default()
        .lines()
        .filter_map(|l| {
            let mut it = l.split('\t');
            let (a, name) = (it.next()?, it.next()?);
            Some((u32::from_str_radix(a, 16).ok().filter(|_| a.len() == 5)?, name.to_string()))
        })
        .collect();


    // One file per 64K region.
    let mut files: BTreeMap<u32, String> = BTreeMap::new();
    let mut tables: BTreeMap<u32, String> = BTreeMap::new();
    for (&a, (op, len)) in &code {
        let region = a >> 16;
        let file = files.entry(region).or_default();
        if let Some(name) = names.get(&a) {
            writeln!(file, "/// {name}").unwrap();
        }
        writeln!(file, "fn i{a:05x}(r: &mut Run) {{").unwrap();
        let step = format!("op!(r, 0x{a:05X}, {len}, {}); // {op}", rust(op));
        match follows(a, op, *len) {
            Some(next) => writeln!(file, "    {step}\n    i{next:05x}(r)").unwrap(),
            None => writeln!(file, "    {step}").unwrap(),
        }
        file.push_str("}\n\n");
        writeln!(tables.entry(region).or_default(), "    (0x{a:05X}, 0x{:05X}, i{a:05x}),", last[&a]).unwrap();
    }

    let dir = std::path::Path::new("crates/hp48-rom/src/gen");
    std::fs::create_dir_all(dir).unwrap();
    for old in std::fs::read_dir(dir).unwrap().flatten() {
        std::fs::remove_file(old.path()).unwrap();
    }
    let header = "// Generated by `cargo run --release -p hp48 --example translate` from ROM revision R.\n";
    let mut module = format!("{header}\n");
    let mut all = String::from("\n/// Every translated instruction: address, last address of its run, function.\npub const ALL: &[&[(u32, u32, Block)]] = &[\n");
    for (region, file) in &files {
        let text = format!(
            "{header}\nuse super::super::prelude::*;\n\n{file}pub const BLOCKS: &[(u32, u32, Block)] = &[\n{}];\n",
            tables[region]
        );
        std::fs::write(dir.join(format!("r{region:x}.rs")), text).unwrap();
        writeln!(module, "mod r{region:x};").unwrap();
        writeln!(all, "    r{region:x}::BLOCKS,").unwrap();
    }
    writeln!(module, "\n/// `hp48::rom_hash` of the ROM's nibbles.\npub const ROM_HASH: u64 = 0x{:016X};", hp48::rom_hash(rom)).unwrap();
    module.push_str("\nuse hp48::translated::Block;\n");
    module.push_str(&all);
    module.push_str("];\n");
    std::fs::write(dir.join("mod.rs"), module).unwrap();
    println!("{} instructions translated, {} files", code.len(), files.len());
}
