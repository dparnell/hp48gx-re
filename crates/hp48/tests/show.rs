//! `hp48_rpl::show` writes objects as the calculator does: compare it with
//! the ROM's own `→STR` for each kind of object and display mode.
//! Skipped when the ROM is not present.

use hp48::{Key, Machine, CPU_HZ};
use hp48_rpl::show::{Format, Names, Writer};
use hp48_rpl::{decode, stack, Object};

fn machine() -> Option<Machine> {
    let rom = std::fs::read(hp48::default_rom_path()).ok()?;
    let mut m = Machine::new(&rom);
    m.run(3 * CPU_HZ);
    m.tap(Key::F);
    m.run(4 * CPU_HZ);
    Some(m)
}

fn enter(m: &mut Machine, line: &str) {
    m.type_text(line).unwrap_or_else(|c| panic!("cannot type {c:?}"));
    m.tap(Key::Enter);
    m.run(CPU_HZ);
}

/// Line breaks are layout; compare the text.
fn flat(s: &str) -> String {
    s.split_whitespace().collect::<Vec<_>>().join(" ")
}

#[test]
fn writes_objects_like_the_rom() {
    let Some(mut m) = machine() else { return };
    let rom = m.hw.rom.clone();
    let names = {
        let ram = |a: u32| m.hw.peek(a);
        let rom = |a: u32| rom[(a & 0xF_FFFF) as usize];
        Names::read(&ram, &rom)
    };
    assert!(names.commands.values().any(|n| n == "SIN"), "library names read");
    // (setup, object)
    let cases: &[(&str, &str)] = &[
        ("STD", "1"),
        ("STD", "1E12"),
        ("STD", "-2.5E-13"),
        ("STD", ".00001234"),
        ("STD", "1.23456789012E-5"),
        ("STD", "(1,2)"),
        ("STD", "{ 1 X \"a\" { } }"),
        ("STD", "« DUP SIN 1 + »"),
        ("STD", "[[1 2][3 4]]"),
        ("STD", "[1 2.5]"),
        ("STD", "[(1,2) (3,4)]"),
        ("STD", "'X+Y'"),
        ("STD", "'X-(Y+Z)'"),
        ("STD", "'(X+Y)*(X-Y)'"),
        ("STD", "'2*X/(Y*Z)'"),
        ("STD", "'X/(Y/Z)'"),
        ("STD", "'X^Y^Z'"),
        ("STD", "'X^(1/2)'"),
        ("STD", "'-X^2'"),
        ("STD", "'(-X)^2'"),
        ("STD", "'-(X*Y)'"),
        ("STD", "'X*-Y'"),
        ("STD", "'X+-1'"),
        ("STD", "'2^-X'"),
        ("STD", "'X+(Y+Z)'"),
        ("STD", "'SIN(X+Y)^2'"),
        ("STD", "'F(X,Y)+SQ(Z)-π'"),
        ("STD", "'MAX(X,1)*IP(X)'"),
        ("STD", "'XROOT(3,X)'"),
        ("STD", "'IFTE(X,1,2)'"),
        ("STD", "'2*i'"),
        ("STD", "'X=-Y'"),
        ("STD", "'NOT A AND B'"),
        ("STD", "'NOT(A AND B)'"),
        ("STD", "'A OR B AND C'"),
        ("STD", "'A AND (B OR C)'"),
        ("STD", "'(A AND B)+1'"),
        ("STD", "'X<Y AND Y<Z'"),
        ("STD", "'X<(Y<Z)'"),
        ("STD", "'NOT X<Y'"),
        ("2 FIX", ".5"),
        ("2 FIX", ".004"),
        ("2 FIX", "1234567.891"),
        ("2 FIX", "1E15"),
        ("2 FIX", "0"),
        ("0 FIX", "2.5"),
        ("3 SCI", "1234.5"),
        ("0 SCI", "2.5"),
        ("2 ENG", "12345"),
        ("2 ENG", ".00012"),
        ("3 FIX", "'X^2-1.23456'"),
        ("3 FIX", "'X+1E15'"),
        ("3 FIX", "'X+123456789012'"),
        ("3 FIX", "1.23456_km"),
        ("3 FIX", "99999999999"),
        ("3 FIX", "1_m 2 ^"),
        ("3 FIX", "{ 1 2.5 }"),
        ("3 SCI", "'X^2'"),
        ("3 SCI", "'X+999'"),
        ("3 SCI", "'X+1000'"),
        ("3 SCI", "'X+-100'"),
        ("STD -51 SF", "(1.5,2)"),
        ("-51 CF HEX", "#1Fh"),
        ("BIN", "#5d"),
        ("OCT", "#9d"),
        ("DEC", "#1Fh"),
        ("HEX 8 STWS", "#1FFh"),
        ("64 STWS", "3 \"T\" →TAG"),
        ("", ":T:3"),
        ("", "'X'"),
        ("", "1_m 2_s /"),
        ("", "1_km 2 ^"),
        ("", "1_kg 1_m * 1_s 2 ^ /"),
        ("", "3_°C"),
        ("", "\"text\""),
    ];
    let mut failures = Vec::new();
    for (setup, obj) in cases {
        enter(&mut m, &format!("CLEAR {setup}"));
        enter(&mut m, obj);
        enter(&mut m, "DUP →STR");
        let mem = |a: u32| m.hw.peek(a);
        let levels = stack(&mem);
        // an operator key ends the line itself, so ENTER may add a copy
        assert!(levels.len() >= 2, "{setup} {obj}: stack depth");
        let Ok(Object::String(rom_text)) = decode(&mem, levels[0]) else { panic!("{obj}: no string") };
        let o = match decode(&mem, levels[1]) {
            Ok(o) => o,
            Err(e) => {
                failures.push(format!("{setup:12} {obj:24} {e}"));
                continue;
            }
        };
        let w = Writer { mem: &mem, names: &names, format: Format::from_flags(&mem) };
        let ours = w.show(&o);
        // →STR leaves a string as it is and quotes a unit; the stack shows
        // the string quoted and the unit bare.
        let want = match o {
            Object::String(_) => format!("\"{rom_text}\""),
            Object::Unit(_) => rom_text.trim_matches('\'').to_string(),
            _ => rom_text,
        };
        if flat(&ours) != flat(&want) {
            failures.push(format!("{setup:12} {obj:24} ROM {want:?}  ours {ours:?}"));
        }
    }
    assert!(failures.is_empty(), "differences:\n{}", failures.join("\n"));
}
