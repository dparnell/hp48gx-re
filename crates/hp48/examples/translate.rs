//! Translate the ROM's machine code into Rust: writes crates/hp48-rom/src/gen/.
//!
//! cargo run --release -p hp48 --example translate -- [ROM]
//!
//! The code translated is every instruction the ROM analysis found
//! (out/code.txt, written by tools/analyze.py) and every instruction in
//! data/executed.txt (recorded by execmap over the tour).
//!
//! The code is cut into routines the way the firmware source (firmware/)
//! labels it: a routine starts at a label that isn't local (`L_...`) and
//! runs on while the code is contiguous. Each becomes a Rust function named
//! after its label, with the comments above the label. Its basic blocks
//! are the arms of a `match` on the address to run next, inside a loop, so
//! branches within the routine stay in the function. Each instruction is a
//! call of the CPU's method for it with constant operands, commented with
//! the firmware's text. See hp48::translated for how the functions run.

use hp48::Machine;
use saturn::op::decode;
use saturn::{Field, Op, R};
use std::collections::{BTreeMap, BTreeSet};
use std::fmt::Write;

/// Instructions after which the run stops and the machine takes over:
/// they change the configuration or interrupts, or stop the CPU.
fn breaks(op: &Op) -> bool {
    matches!(
        op,
        Op::Shutdn
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
            | Op::Illegal
    )
}

/// Where a branch can go, if it can be known.
fn target(op: &Op) -> Option<u32> {
    match *op {
        Op::CondJump(_, t) | Op::Jump(t) | Op::Call(t) => Some(t),
        Op::Test { goyes, .. }
        | Op::StTest { goyes, .. }
        | Op::PTest { goyes, .. }
        | Op::HsTest { goyes, .. }
        | Op::BitTest { goyes, .. } => goyes,
        _ => None,
    }
}

/// Instructions that use or change PC: PC is set past them first, and
/// the run goes on only if they fell through.
fn uses_pc(op: &Op) -> bool {
    matches!(
        op,
        Op::Rtn(_)
            | Op::CondRtn(_)
            | Op::CondJump(..)
            | Op::Jump(_)
            | Op::Call(_)
            | Op::Test { .. }
            | Op::StTest { .. }
            | Op::PTest { .. }
            | Op::HsTest { .. }
            | Op::BitTest { .. }
            | Op::Rsi
            | Op::PcIndirect(_)
            | Op::PcFrom(_)
            | Op::PcTo(_)
            | Op::PcEx(_)
    )
}

/// Instructions that use the bus: they see the scan line, and the
/// hardware is checked after them.
fn uses_bus(op: &Op) -> bool {
    matches!(op, Op::Mem { .. } | Op::In(_) | Op::CId | Op::Rsi | Op::PcIndirect(_) | Op::Config | Op::Uncnfg | Op::Reset)
}

fn r(x: R) -> String {
    format!("R::{x:?}")
}

fn f(x: Field) -> String {
    format!("Field::{x:?}")
}

fn goyes(g: Option<u32>) -> String {
    g.map_or("None".into(), |t| format!("Some(0x{t:05X})"))
}

/// The Rust statement that executes `op`.
fn statement(op: &Op) -> String {
    use Op::*;
    match *op {
        Rtn(k) => format!("r.cpu.rtn(RtnKind::{k:?});"),
        SetHex => "r.cpu.dec = false;".into(),
        SetDec => "r.cpu.dec = true;".into(),
        PushC => "r.cpu.push_c();".into(),
        PopC => "r.cpu.pop_c();".into(),
        ClrSt => "r.cpu.clr_st();".into(),
        CFromSt => "r.cpu.c_from_st();".into(),
        StFromC => "r.cpu.st_from_c();".into(),
        CStEx => "r.cpu.c_st_ex();".into(),
        PInc => "r.cpu.p_inc();".into(),
        PDec => "r.cpu.p_dec();".into(),
        Logic { and, dst, src, f: x } => format!("r.cpu.{}({}, {}, {});", if and { "and" } else { "or" }, r(dst), r(src), f(x)),
        Scratch { op, r: x, n, f: y } => format!("r.cpu.scratch(ScratchOp::{op:?}, {}, {n}, {});", r(x), f(y)),
        DFromR { d, r: x, short } => format!("r.cpu.d_from_r({d}, {}, {short});", r(x)),
        DExR { d, r: x, short } => format!("r.cpu.d_ex_r({d}, {}, {short});", r(x)),
        Mem { store, d, r: x, f: y } => format!("r.cpu.{}({d}, {}, {}, r.hw);", if store { "store" } else { "load" }, r(x), f(y)),
        DAdd { d, n } => format!("r.cpu.d_add({d}, {n});"),
        DSub { d, n } => format!("r.cpu.d_sub({d}, {n});"),
        DLoad { d, len, val } => format!("r.cpu.d_load({d}, {len}, 0x{val:X});"),
        PSet(n) => format!("r.cpu.p = {n};"),
        LoadConst { r: x, len, val } => format!("r.cpu.load_const({}, {len}, 0x{val:X});", r(x)),
        CondRtn(c) => format!("r.cpu.rtn_if(Cond::{c:?});"),
        CondJump(c, t) => format!("r.cpu.jump_if(Cond::{c:?}, 0x{t:05X});"),
        Jump(t) => format!("r.cpu.pc = 0x{t:05X};"),
        Call(t) => format!("r.cpu.call(0x{t:05X});"),
        Nop | BusCb | BusCc | BusCd | Illegal => String::new(),
        Test { test, f: y, goyes: g } => {
            let t = match test {
                saturn::op::Test::Regs(c, a, b) => format!("Test::Regs(Cmp::{c:?}, {}, {})", r(a), r(b)),
                saturn::op::Test::Zero(a) => format!("Test::Zero({})", r(a)),
                saturn::op::Test::NonZero(a) => format!("Test::NonZero({})", r(a)),
            };
            format!("r.cpu.test({t}, {}, {});", f(y), goyes(g))
        }
        StTest { bit, set, goyes: g } => format!("r.cpu.st_test({bit}, {set}, {});", goyes(g)),
        PTest { n, equal, goyes: g } => format!("r.cpu.p_test({n}, {equal}, {});", goyes(g)),
        HsTest { mask, goyes: g } => format!("r.cpu.hs_test({mask}, {});", goyes(g)),
        BitTest { r: x, bit, set, goyes: g } => format!("r.cpu.bit_test({}, {bit}, {set}, {});", r(x), goyes(g)),
        BitSet { r: x, bit, set } => format!("r.cpu.bit_set({}, {bit}, {set});", r(x)),
        OutCs => "r.cpu.out_cs();".into(),
        OutC => "r.cpu.out_c();".into(),
        In(x) => format!("r.cpu.input({}, r.hw);", r(x)),
        Uncnfg => "r.hw.unconfig(r.cpu.c.a());".into(),
        Config => "r.hw.config(r.cpu.c.a());".into(),
        CId => "r.cpu.c_id(r.hw);".into(),
        Shutdn => "r.cpu.shutdown = true;".into(),
        IntOn => "r.cpu.kbd_int_enabled = true;".into(),
        IntOff => "r.cpu.kbd_int_enabled = false;".into(),
        Rsi => "r.cpu.rsi(r.hw);".into(),
        Sreq => "r.cpu.sreq();".into(),
        PcIndirect(x) => format!("r.cpu.pc_indirect({}, r.hw);", r(x)),
        CPlusP1 => "r.cpu.c_plus_p1();".into(),
        Reset => "r.hw.reset_config();".into(),
        CFromP(n) => format!("r.cpu.c_from_p({n});"),
        PFromC(n) => format!("r.cpu.p_from_c({n});"),
        CpEx(n) => format!("r.cpu.cp_ex({n});"),
        Rotate { r: x, left } => format!("r.cpu.rotate({}, {left});", r(x)),
        Srb(x) => format!("r.cpu.srb({});", r(x)),
        SrbField { r: x, f: y } => format!("r.cpu.srb_field({}, {});", r(x), f(y)),
        AddCon { r: x, f: y, n } => format!("r.cpu.add_con({}, {}, {n});", r(x), f(y)),
        SubCon { r: x, f: y, n } => format!("r.cpu.sub_con({}, {}, {n});", r(x), f(y)),
        PcFrom(x) => format!("r.cpu.pc_from({});", r(x)),
        PcTo(x) => format!("r.cpu.pc_to({});", r(x)),
        PcEx(x) => format!("r.cpu.pc_ex({});", r(x)),
        HstClear(m) => format!("r.cpu.hst_clear({m});"),
        StSet { bit, set } => format!("r.cpu.st_set({bit}, {set});"),
        Add { dst, src, f: y } => format!("r.cpu.add({}, {}, {});", r(dst), r(src), f(y)),
        Inc { r: x, f: y } => format!("r.cpu.inc({}, {});", r(x), f(y)),
        Dec { r: x, f: y } => format!("r.cpu.dec({}, {});", r(x), f(y)),
        Sub { dst, a, b, f: y } => format!("r.cpu.sub({}, {}, {}, {});", r(dst), r(a), r(b), f(y)),
        Zero { r: x, f: y } => format!("r.cpu.zero({}, {});", r(x), f(y)),
        Copy { dst, src, f: y } => format!("r.cpu.copy({}, {}, {});", r(dst), r(src), f(y)),
        Exch { a, b, f: y } => format!("r.cpu.exch({}, {}, {});", r(a), r(b), f(y)),
        Shl { r: x, f: y } => format!("r.cpu.shl({}, {});", r(x), f(y)),
        Shr { r: x, f: y } => format!("r.cpu.shr({}, {});", r(x), f(y)),
        Neg { r: x, f: y } => format!("r.cpu.neg({}, {});", r(x), f(y)),
        Not { r: x, f: y } => format!("r.cpu.not({}, {});", r(x), f(y)),
    }
}


/// A label in the firmware source, with the comment lines above it.
#[derive(Clone)]
struct Label {
    name: String,
    doc: Vec<String>,
    /// file:line
    at: String,
}

/// What the firmware source says about each address.
#[derive(Default)]
struct Source {
    /// An instruction's text, as written there.
    text: BTreeMap<u32, String>,
    labels: BTreeMap<u32, Vec<Label>>,
}

/// Split off the original address the firmware writes in the right-hand
/// comment (`* 032C9`), if the line has one.
fn split_addr(line: &str) -> (&str, Option<u32>) {
    for (pos, _) in line.match_indices('*').collect::<Vec<_>>().into_iter().rev() {
        let rest = line[pos + 1..].trim_start();
        let hex = rest.get(..5).filter(|h| h.bytes().all(|b| b.is_ascii_hexdigit()));
        if let Some(h) = hex {
            if rest.len() == 5 || rest.as_bytes()[5] == b' ' {
                return (&line[..pos], u32::from_str_radix(h, 16).ok());
            }
        }
    }
    (line, None)
}

fn read_source(path: &std::path::Path, src: &mut Source) {
    let text = std::fs::read_to_string(path).unwrap_or_else(|e| panic!("{}: {e}", path.display()));
    let name = path.to_string_lossy().replace('\\', "/");
    let (mut comments, mut pending) = (Vec::<String>::new(), Vec::<Label>::new());
    for (no, line) in text.lines().enumerate() {
        let line = line.trim_end_matches('\r');
        let trimmed = line.trim();
        if trimmed.is_empty() {
            comments.clear();
            continue;
        }
        if let Some(c) = trimmed.strip_prefix('*') {
            comments.push(c.trim().to_string());
            continue;
        }
        if let Some(inc) = trimmed.strip_prefix("INCLUDE") {
            let file = inc.split('"').nth(1).expect("INCLUDE \"file\"");
            read_source(&path.parent().unwrap().join(file), src);
            continue;
        }
        let (code, addr) = split_addr(line);
        let mut code = code.trim();
        if !line.starts_with([' ', '\t']) {
            let (first, rest) = code.split_once(char::is_whitespace).unwrap_or((code, ""));
            if let Some(label) = first.strip_suffix(':') {
                let doc = comments.drain(..).filter(|c| !c.starts_with("refs (")).collect();
                pending.push(Label { name: label.to_string(), doc, at: format!("{name}:{}", no + 1) });
                code = rest.trim();
            }
        }
        comments.clear();
        let Some(addr) = addr else { continue };
        if code.is_empty() {
            continue;
        }
        let text = code.split_whitespace().collect::<Vec<_>>().join(" ");
        // A code object's header: its label belongs to the code after it.
        if text.starts_with("CODE") || (text.starts_with("CON(5)") && text.contains("(*)+5")) {
            continue;
        }
        if !pending.is_empty() {
            src.labels.entry(addr).or_default().append(&mut pending);
        }
        src.text.insert(addr, text);
    }
}

/// A run of contiguous code under one firmware label.
struct Routine {
    label: Option<Label>,
    /// Synthetic name when there is no label.
    name: String,
    insns: Vec<u32>,
}

/// A label as a Rust identifier, unique among `taken`.
fn ident(name: &str, a: u32, taken: &mut BTreeSet<String>) -> String {
    const KEYWORDS: &[&str] = &["as", "break", "const", "continue", "crate", "else", "enum", "extern", "false", "fn", "for", "if",
        "impl", "in", "let", "loop", "match", "mod", "move", "mut", "pub", "ref", "return", "self", "Self", "static", "struct",
        "super", "trait", "true", "type", "unsafe", "use", "where", "while", "async", "await", "dyn"];
    let mut s: String = name.chars().map(|c| if c.is_ascii_alphanumeric() { c } else { '_' }).collect();
    if s.starts_with(|c: char| c.is_ascii_digit()) || s.chars().all(|c| c == '_') || KEYWORDS.contains(&s.as_str()) {
        s.insert(0, 'r');
    }
    if !taken.insert(s.clone()) {
        s = format!("{s}_{a:05X}");
        taken.insert(s.clone());
    }
    s
}

/// The Rust for one routine.
fn routine(rt: &Routine, fname: &str, code: &BTreeMap<u32, (Op, u32)>, src: &Source) -> String {
    let members: BTreeSet<u32> = rt.insns.iter().copied().collect();
    // Basic blocks start at the routine's start, at labels, after
    // instructions that branch or stop the run, and at branch targets.
    let mut leaders = BTreeSet::from([rt.insns[0]]);
    for &a in &rt.insns {
        let (op, len) = &code[&a];
        if src.labels.contains_key(&a) {
            leaders.insert(a);
        }
        if uses_pc(op) || breaks(op) {
            leaders.insert((a + len) & 0xF_FFFF);
        }
        if let Some(t) = target(op).filter(|t| members.contains(t)) {
            leaders.insert(t);
        }
    }
    let mut blocks: Vec<Vec<u32>> = Vec::new();
    for &a in &rt.insns {
        match blocks.last_mut() {
            Some(b) if !leaders.contains(&a) => b.push(a),
            _ => blocks.push(vec![a]),
        }
    }

    let mut out = String::new();
    match &rt.label {
        Some(l) => {
            for d in &l.doc {
                writeln!(out, "// {d}").unwrap();
            }
            writeln!(out, "// {}: {}", l.name, l.at).unwrap();
        }
        None => writeln!(out, "// Unlabelled code at #{:05X}.", rt.insns[0]).unwrap(),
    }
    writeln!(out, "pub(super) fn {fname}(r: &mut Run) {{\n    let mut at = r.cpu.pc;\n    loop {{\n        match at {{").unwrap();
    for (i, b) in blocks.iter().enumerate() {
        let (first, last) = (b[0], *b.last().unwrap());
        if i > 0 {
            match src.labels.get(&first) {
                Some(ls) => {
                    for l in ls {
                        for d in &l.doc {
                            writeln!(out, "            // {d}").unwrap();
                        }
                        writeln!(out, "            // {}:", l.name).unwrap();
                    }
                }
                None => writeln!(out, "            // #{first:05X}:").unwrap(),
            }
        }
        writeln!(out, "            0x{first:05X}..=0x{last:05X} => {{").unwrap();
        for &a in b {
            let (op, len) = &code[&a];
            let next = (a + len) & 0xF_FFFF;
            let cycles = match op.cycles(*len) {
                Some(c) => c.to_string(),
                None => match op {
                    Op::Mem { f: y, .. } => format!("r.cpu.mem_cycles({})", f(*y)),
                    _ => unreachable!("{op}"),
                },
            };
            // The firmware writes a test's GOYES on a line of its own.
            let text = match src.text.get(&a) {
                Some(_) => src.text.range(a..a + len).map(|(_, t)| t.as_str()).collect::<Vec<_>>().join(" / "),
                None => op.to_string(),
            };
            let stmt = match statement(op) {
                s if s.is_empty() => "()".to_string(),
                s => s.trim_end_matches(';').to_string(),
            };
            let ind = "                ";
            if *op == Op::Rsi {
                // It may take an interrupt, which pushes PC.
                writeln!(out, "{ind}r.cpu.pc = 0x{next:05X};\n{ind}r.sync();\n{ind}{stmt}; // {text}\n{ind}r.spend({cycles});\n{ind}return;").unwrap();
            } else if breaks(op) {
                let sync = if uses_bus(op) { "r.sync();\n                " } else { "" };
                writeln!(out, "{ind}{sync}{stmt}; // {text}\n{ind}r.end(0x{next:05X}, {cycles});\n{ind}return;").unwrap();
            } else if uses_pc(op) {
                let always = matches!(op, Op::Rtn(_) | Op::Jump(_) | Op::PcFrom(_) | Op::PcIndirect(_));
                let mac = match (always, uses_bus(op)) {
                    (true, true) => "jump_io!(r, at, ".to_string(),
                    (true, false) => "jump!(r, at, ".to_string(),
                    (false, _) => format!("branch!(r, at, 0x{next:05X}, "),
                };
                writeln!(out, "{ind}{mac}{cycles}, {stmt}); // {text}").unwrap();
            } else {
                let mac = if uses_bus(op) { "io!" } else { "op!" };
                writeln!(out, "{ind}{mac}(r, at, 0x{a:05X}..0x{next:05X}, {cycles}, {stmt}); // {text}").unwrap();
                if a == last {
                    writeln!(out, "{ind}at = 0x{next:05X};").unwrap();
                }
            }
        }
        writeln!(out, "            }}").unwrap();
    }
    out.push_str("            _ => {\n                r.cpu.pc = at;\n                return;\n            }\n        }\n    }\n}\n\n");
    out
}

fn main() {
    let path = std::env::args().nth(1).unwrap_or_else(|| "ROM/gxrom-r".into());
    let image = std::fs::read(&path).unwrap_or_else(|e| panic!("{path}: {e}"));
    let m = Machine::new(&image);
    let rom = &m.hw.rom;
    let fetch = |a: u32| rom[(a & 0xF_FFFF) as usize];

    // Instructions the tour ran, and every instruction the analysis found.
    let addrs = |path: &str| -> BTreeSet<u32> {
        std::fs::read_to_string(path)
            .unwrap_or_else(|e| panic!("{path}: {e} (run tools/analyze.py first)"))
            .lines()
            .filter(|l| l.len() == 5)
            .filter_map(|l| u32::from_str_radix(l, 16).ok())
            .collect()
    };
    let mut wanted = addrs("data/executed.txt");
    wanted.extend(addrs("out/code.txt"));
    let code: BTreeMap<u32, (Op, u32)> = wanted.iter().map(|&a| (a, decode(a, fetch))).collect();

    let mut src = Source::default();
    read_source(std::path::Path::new("firmware/rom.s"), &mut src);

    // Routines: contiguous code, cut at labels that aren't local. An
    // instruction that starts inside another (code that overlaps code) is a
    // routine of its own.
    let routine_label = |a: u32| src.labels.get(&a).and_then(|ls| ls.iter().find(|l| !l.name.starts_with("L_"))).cloned();
    let mut routines: Vec<Routine> = Vec::new();
    // The routine the contiguous code goes on in, and where it goes on.
    let (mut current, mut expected) = (0, None);
    for (&a, (_, len)) in &code {
        let label = routine_label(a);
        match expected {
            Some(e) if a == e && label.is_none() => {
                routines[current].insns.push(a);
                expected = Some(a + len);
                continue;
            }
            Some(e) if a < e => {
                let label = label.or_else(|| src.labels.get(&a).map(|ls| ls[0].clone()));
                routines.push(Routine { label, name: format!("overlap_{a:05X}"), insns: vec![a] });
                continue;
            }
            _ => {}
        }
        let label = label.or_else(|| src.labels.get(&a).map(|ls| ls[0].clone()));
        routines.push(Routine { label, name: format!("code_{a:05X}"), insns: vec![a] });
        current = routines.len() - 1;
        expected = Some(a + len);
    }

    // One file per 64K region.
    let mut taken = BTreeSet::new();
    let mut files: BTreeMap<u32, String> = BTreeMap::new();
    let mut tables: BTreeMap<u32, String> = BTreeMap::new();
    for rt in &routines {
        let first = rt.insns[0];
        let last = rt.insns.last().map(|a| a + code[a].1 - 1).unwrap();
        let fname = ident(rt.label.as_ref().map_or(&rt.name, |l| &l.name), first, &mut taken);
        let region = first >> 16;
        files.entry(region).or_default().push_str(&routine(rt, &fname, &code, &src));
        writeln!(tables.entry(region).or_default(), "    (0x{first:05X}, 0x{last:05X}, {fname}),").unwrap();
    }

    let dir = std::path::Path::new("crates/hp48-rom/src/gen");
    std::fs::create_dir_all(dir).unwrap();
    for old in std::fs::read_dir(dir).unwrap().flatten() {
        std::fs::remove_file(old.path()).unwrap();
    }
    let header = "// Generated by `cargo run --release -p hp48 --example translate` from ROM revision R\n// and the firmware source (firmware/). Don't edit: change the generator.\n";
    let mut module = format!("{header}\n");
    let mut all = String::from(
        "\n/// Every translated routine: the address of its first instruction, its\n/// last address, and its function.\npub const ALL: &[&[(u32, u32, Block)]] = &[\n",
    );
    for (region, file) in &files {
        let text = format!(
            "{header}\n#![allow(non_snake_case, clippy::no_effect)]\n\nuse super::super::prelude::*;\n\n{file}pub const ROUTINES: &[(u32, u32, Block)] = &[\n{}];\n",
            tables[region]
        );
        std::fs::write(dir.join(format!("r{region:x}.rs")), text).unwrap();
        writeln!(module, "mod r{region:x};").unwrap();
        writeln!(all, "    r{region:x}::ROUTINES,").unwrap();
    }
    writeln!(module, "\n/// `hp48::rom_hash` of the ROM's nibbles.\npub const ROM_HASH: u64 = 0x{:016X};", hp48::rom_hash(rom)).unwrap();
    module.push_str("\nuse hp48::translated::Block;\n");
    module.push_str(&all);
    module.push_str("];\n");
    std::fs::write(dir.join("mod.rs"), module).unwrap();
    let named = routines.iter().filter(|r| r.label.is_some()).count();
    println!("{} instructions in {} routines ({named} labelled), {} files", code.len(), routines.len(), files.len());
}
