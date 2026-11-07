//! Does the customised ROM still look like revision R to everything else?
//!
//! External programs know nothing of the hi-res display: they read the LCD,
//! call the ROM by address, and write to display memory and the display
//! registers directly. These tests run the same things on ROM/gxrom-r and on
//! the customised ROM and require the same LCD, and check that the hi-res
//! display steps aside. Skipped without both images.

use hp48::hires::Content;
use hp48::{Key, Machine, CPU_HZ};

#[allow(dead_code)]
#[path = "../examples/common/tour.rs"]
mod tour;

/// RAM word with the address of stack level 1.
const DSKTOP: u32 = 0x806F8;
const RAM: u32 = 0x80000;
const DOCODE: u64 = 0x02DCC;
const CURSORX: u32 = 0x808B9;
const CURSORY: u32 = 0x808BE;

/// Fills LCD line 46 of the stack's display grob, straight in memory, spins
/// for a few seconds and returns. The only ROM calls are SAVPTR and the
/// return to RPL.
///
///     GOSBVL SAVPTR; D1=(5) ADISP; C=DAT1 A; D1=C; LC(5) 1584; A=C A; CD1EX
///     C=C+A A; D1=C; LC(2) 33; A=0 W; A=A-1 W
///     loop: DAT1=A 1; D1=D1+ 1; C=C-1 B; GONC loop
///     LC(5) #FFFFF; spin: C=C-1 A; GONC spin; GOVLNG GETPTRLOOP
const SCRIBBLE: &str = "8FB97601F5D6081471353403600DA137C21353112AF0A7C1590170A6E55F34FFFFFCE5DF8D34150";

/// Fills PICT's pixels with a pattern, points the display hardware at them,
/// spins for a few seconds, and restores the display address, as a game does.
///
///     GOSBVL SAVPTR; D1=(5) GDISP; C=DAT1 A; D1=C; D1=D1+ 15; D1=D1+ 5; CD1EX
///     D1=C; A=C A; LC(5) 1904
///     fill: B=C A; LC(1) 5; DAT1=C 1; C=B A; D1=D1+ 1; C=C-1 A; GONC fill
///     D1=(5) DISPADDR; C=A A; DAT1=C A
///     LC(5) #FFFFF; spin: C=C-1 A; GONC spin
///     D1=(5) DISP1CTLg; C=DAT1 A; D1=(5) DISPADDR; DAT1=C A; GOVLNG GETPTRLOOP
const OWN_SCREEN: &str = "8FB97601F4E60814713517E174137135DA3407700D530515D0D9170CE5FE1F02100D614534FFFFFCE5DF1FD86081471F021001458D34150";

fn boot(path: &str) -> Option<Machine> {
    let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("../..");
    let rom = std::fs::read(root.join(path)).ok()?;
    let mut m = Machine::new(&rom);
    m.run(3 * CPU_HZ);
    m.tap(Key::F);
    m.run(4 * CPU_HZ);
    Some(m)
}

fn both() -> Option<(Machine, Machine)> {
    Some((boot("ROM/gxrom-r")?, boot("ROM/gxrom-hires")?))
}

fn enter(m: &mut Machine, line: &str) {
    m.type_text(line).unwrap_or_else(|c| panic!("cannot type {c:?}"));
    m.tap(Key::Enter);
    m.run(2 * CPU_HZ);
}

/// How many LCD pixels differ, but for the edit line's cursor: it blinks, and
/// the two ROMs don't take the same time to get to a place.
fn differing_pixels(a: &Machine, b: &Machine) -> usize {
    let (left, top) = (a.peek_value(CURSORX, 5) as usize, a.peek_value(CURSORY, 5) as usize);
    let cursor = |x: usize, y: usize| (left..left + 6).contains(&x) && (top..top + 10).contains(&y);
    let (a, b) = (a.lcd().pixels, b.lcd().pixels);
    let mut n = 0;
    for y in 0..a.len() {
        for x in 0..a[y].len() {
            n += usize::from(a[y][x] != b[y][x] && !cursor(x, y));
        }
    }
    n
}

/// Each line starts from the same booted machines. Run one after another, a
/// key that lands a moment earlier on one ROM would change all that follows.
fn run_and_compare(lines: &[&str]) -> Vec<String> {
    let Some((old0, new0)) = both() else { return Vec::new() };
    let mut bad = Vec::new();
    for line in lines {
        let (mut old, mut new) = (old0.clone(), new0.clone());
        enter(&mut old, line);
        enter(&mut new, line);
        let n = differing_pixels(&old, &new);
        if n != 0 {
            bad.push(format!("{n} pixels differ after {line:?}"));
        }
        old.tap(Key::On);
        new.tap(Key::On);
        old.run(CPU_HZ);
        new.run(CPU_HZ);
        let n = differing_pixels(&old, &new);
        if n != 0 {
            bad.push(format!("{n} pixels differ after ON, after {line:?}"));
        }
    }
    bad
}

#[test]
fn the_lcd_is_the_same_over_the_tour() {
    // TIME shows the clock, and the two ROMs don't take the same time.
    let lines: Vec<&str> = tour::TOUR.iter().copied().filter(|line| !line.contains("TIME")).collect();
    let bad = run_and_compare(&lines);
    assert!(bad.is_empty(), "{}", bad.join("\n"));
}

#[test]
fn free_memory_is_the_same() {
    let bad = run_and_compare(&["MEM", "1 2 3 MEM", "{ 1 2 3 } 'L' STO MEM", "1000 ->STR MEM"]);
    assert!(bad.is_empty(), "{}", bad.join("\n"));
}

#[test]
fn what_programs_read_from_the_display_is_the_same() {
    let bad = run_and_compare(&[
        // BYTES prints a checksum of the grob: the LCD as a program reads it.
        "1 2 3 LCD→ BYTES",
        "\"HELLO\" 1 DISP LCD→ BYTES",
        "'X^2' 1.5 \"text\" LCD→ DUP →LCD 3 FREEZE",
        "CLLCD \"A\" 3 DISP 3 FREEZE",
        "ERASE { # 0d # 0d } PVIEW",
        "{ A B C } TMENU LCD→ BYTES",
        "PICT RCL BYTES",
        // A menu with a label made by a program.
        "{ { \"ab\" 1 } { \"cd\" 2 } } TMENU",
        "0 MENU",
    ]);
    assert!(bad.is_empty(), "{}", bad.join("\n"));
}

#[test]
fn calling_the_rom_by_address_is_the_same() {
    let bad = run_and_compare(&[
        // DISPROW1 and DISPN, as System RPL programs call them.
        "\"HELLO\" # 1245Bh SYSEVAL 3 FREEZE",
        "\"ROW 3\" # 1247Bh SYSEVAL 3 FREEZE",
        // The original entries of words we have wrapped.
        "1 2 3 # 3A1E8h SYSEVAL",
        "# 395BAh SYSEVAL LCD→ BYTES",
    ]);
    assert!(bad.is_empty(), "{}", bad.join("\n"));
}

fn crc(nibbles: impl Iterator<Item = u8>) -> u64 {
    nibbles.fold(0u64, |c, v| (c >> 4) ^ (((c ^ u64::from(v)) & 15) * 0x1081))
}

fn level(m: &Machine, n: u32) -> u32 {
    let stack = m.peek_value(DSKTOP, 5) as u32;
    m.peek_value(stack + 5 * (n - 1), 5) as u32
}

/// BYTES reads the CRC hardware: the ROM attaches libraries by it too.
#[test]
fn bytes_gives_the_crc_of_the_object() {
    let Some(mut m) = boot("ROM/gxrom-hires") else { return };
    for line in ["\"x\"", "\"HELLO\" DUP + DUP + DUP +", "{ 1 2 3 } 'X' + 1.5 +"] {
        enter(&mut m, line);
        let object = level(&m, 1);
        let mut size = 0;
        while m.peek_value(object + size, 5) != 0x0312B && size < 4000 {
            size += 1;
        }
        let is_string = m.peek_value(object, 5) == 0x02A2C;
        let size = if is_string { m.peek_value(object + 5, 5) as u32 + 5 } else { size + 5 };
        let want = crc((0..size).map(|i| m.hw.peek(object + i)));
        enter(&mut m, "BYTES DROP");
        assert_eq!(m.peek_value(level(&m, 1) + 10, 4), want, "BYTES of {line}");
        enter(&mut m, "DROP DROP");
    }
}

/// An object with an odd number of nibbles, as libraries can have, must
/// fill its temporary object exactly, or garbage collection loses it.
#[test]
fn an_object_of_an_odd_size_survives_garbage_collection() {
    let Some(mut m) = boot("ROM/gxrom-hires") else { return };
    // A code object of 11 nibbles: prolog, length 6, and one nibble of body.
    let file = b"HPHP48-X\xCC\x2D\x60\x00\x00\x07";
    m.push_object(file).unwrap();
    enter(&mut m, "MEM DROP");
    let object = level(&m, 1);
    assert_eq!(m.peek_value(object, 5), DOCODE);
    assert_eq!(m.peek_value(object + 5, 5), 6);
    assert_eq!(m.peek_value(object + 10, 1), 7);
}

/// Put a program in a string on the stack, as a code object, and run it. The
/// string's address is stable while nothing is typed that needs more memory.
fn start(m: &mut Machine, program: &str) {
    enter(m, &format!("\"{}\"", "x".repeat(100)));
    let slot = m.peek_value(DSKTOP, 5) as u32;
    let object = m.peek_value(slot, 5) as u32;
    let code = object + 10;
    let header = (0..5).map(|i| (DOCODE >> (4 * i) & 15) as u8);
    let length = program.len() as u64 + 5;
    let length = (0..5).map(|i| (length >> (4 * i) & 15) as u8);
    let body = program.chars().map(|c| c.to_digit(16).unwrap() as u8);
    for (i, nibble) in header.chain(length).chain(body).enumerate() {
        m.hw.ram[(code - RAM) as usize + i] = nibble;
    }
    m.type_text(&format!("# {code:X}h SYSEVAL")).unwrap();
    m.tap(Key::Enter);
    m.run(CPU_HZ);
}

fn shown_rows(m: &mut Machine) -> Vec<usize> {
    m.sync_hires();
    let row = |i: &&hp48::hires::Item| matches!(i.content, Content::Row { .. });
    m.hw.hires.on_lcd().filter(row).map(|i| i.y).collect()
}

fn run_on_both(program: &str, check: impl Fn(&mut Machine, &str)) {
    let Some((mut old, mut new)) = both() else { return };
    for m in [&mut old, &mut new] {
        enter(m, "1 2 3");
        start(m, program);
    }
    assert_eq!(differing_pixels(&old, &new), 0, "while the program runs");
    check(&mut new, "while the program runs");
    old.run(10 * CPU_HZ);
    new.run(10 * CPU_HZ);
    assert_eq!(differing_pixels(&old, &new), 0, "after the program");
}

#[test]
fn a_program_writing_to_display_memory_sees_the_same_lcd() {
    run_on_both(SCRIBBLE, |m, when| {
        assert!(m.lcd().pixels[46].iter().all(|&on| on), "it drew: {when}");
        let rows = shown_rows(m);
        assert!(!rows.contains(&46), "the row under it has gone {when}: {rows:?}");
        assert!(rows.contains(&36), "the rows beside it stay {when}: {rows:?}");
    });
}

#[test]
fn a_program_with_its_own_screen_sees_the_same_lcd() {
    run_on_both(OWN_SCREEN, |m, when| {
        let lcd = m.lcd().pixels;
        assert!(lcd[20][0] && !lcd[20][1], "its pattern shows: {when}");
        let rows = shown_rows(m);
        assert!(rows.is_empty(), "nothing of the stack shows {when}: {rows:?}");
    });
}

#[test]
fn the_display_comes_back_after_a_program_with_its_own_screen() {
    let Some(mut m) = boot("ROM/gxrom-hires") else { return };
    enter(&mut m, "1 2 3");
    let before = shown_rows(&mut m);
    assert!(!before.is_empty());
    start(&mut m, OWN_SCREEN);
    assert!(shown_rows(&mut m).is_empty());
    m.run(10 * CPU_HZ);
    assert_eq!(shown_rows(&mut m).len(), before.len(), "the rows are back");
}
