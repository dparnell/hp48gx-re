//! Translate the ROM's machine code into Rust: writes crates/hp48-rom/src/gen/.
//!
//! cargo run --release -p hp48 --example translate -- [ROM]
//!
//! The code translated is every instruction the ROM analysis found
//! (out/code.txt, written by tools/analyze.py) and every instruction in
//! data/executed.txt (recorded by execmap over the tour). Each becomes a
//! function that calls the CPU's method for it with constant operands and,
//! if execution falls through to another translated instruction, calls that
//! one's function. An instruction that changes the machine's configuration
//! or interrupts, or calls a subroutine, ends the run. See hp48::translated
//! for how the functions run.

use hp48::Machine;
use saturn::op::decode;
use saturn::{Field, Op, R};
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

/// The body of the function for `op` at `a`: the statement with what must
/// come before and after it. `follow` is the instruction it falls through
/// to, if that is translated and the run may go on.
fn body(a: u32, op: &Op, len: u32, follow: Option<u32>) -> String {
    let next = (a + len) & 0xF_FFFF;
    let cycles = match op.cycles(len) {
        Some(c) => c.to_string(),
        None => match op {
            Op::Mem { f: y, .. } => format!("r.cpu.mem_cycles({})", f(*y)),
            _ => unreachable!("{op}"),
        },
    };
    let mut out = String::new();
    // Instructions that always set PC don't need it set first.
    if uses_pc(op) && !matches!(op, Op::Rtn(_) | Op::Jump(_) | Op::PcFrom(_) | Op::PcIndirect(_)) {
        writeln!(out, "    r.cpu.pc = 0x{next:05X};").unwrap();
    }
    if uses_bus(op) {
        out.push_str("    r.sync();\n");
    }
    match statement(op) {
        stmt if stmt.is_empty() => writeln!(out, "    // {op}").unwrap(),
        stmt => writeln!(out, "    {stmt} // {op}").unwrap(),
    }
    let check = if uses_pc(op) {
        "next_pc"
    } else if uses_bus(op) {
        "next_io"
    } else {
        "next"
    };
    match follow {
        Some(f) => writeln!(out, "    if r.{check}(0x{next:05X}, {cycles}) {{\n        i{f:05x}(r)\n    }}").unwrap(),
        None if uses_pc(op) => writeln!(out, "    r.spend({cycles});").unwrap(),
        None => writeln!(out, "    r.end(0x{next:05X}, {cycles});").unwrap(),
    }
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
        file.push_str(&body(a, op, *len, follows(a, op, *len)));
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
