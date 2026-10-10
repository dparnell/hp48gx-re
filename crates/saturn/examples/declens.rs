//! Print "len target" for an instruction decoded at every ROM address
//! (used to cross-check against tools/saturn.py).
use std::io::Write;

fn main() {
    let path = std::env::args().nth(1).expect("rom path");
    let bytes = std::fs::read(path).unwrap();
    let nibs: Vec<u8> = bytes.iter().flat_map(|b| [b & 0xF, b >> 4]).collect();
    let mut out = std::io::BufWriter::new(std::io::stdout());
    for pc in 0..0x80000u32 {
        let (op, len) = saturn::decode(pc, |a| nibs[a as usize]);
        let t = match op {
            saturn::Op::Jump(t) | saturn::Op::Call(t) | saturn::Op::CondJump(_, t) => t as i64,
            saturn::Op::Test { goyes: Some(t), .. }
            | saturn::Op::StTest { goyes: Some(t), .. }
            | saturn::Op::PTest { goyes: Some(t), .. }
            | saturn::Op::HsTest { goyes: Some(t), .. }
            | saturn::Op::BitTest { goyes: Some(t), .. } => t as i64,
            _ => -1,
        };
        writeln!(out, "{len} {t}").unwrap();
    }
}
