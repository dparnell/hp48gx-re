# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This repository has two parts:

1. **ROM analysis (Python, `tools/`).** It reverse engineers the HP 48GX ROM, revision R (`ROM/gxrom-r`). The findings are in `docs/rom-map.md`. Read that first: it covers the memory map, boot path, ROM library table, covered upper ROM, and the code idioms the analyser handles.
2. **HP 48GX desktop calculator (Rust, `crates/`).** An emulator that runs the real ROM, with a vector-rendered UI and a native, resizable plot window. The long-term plan is to replace ROM routines one by one with native Rust (high-level emulation), checking each replacement against the emulated original.

## Commands

### Rust

Run these from the repo root. Rust 1.80+ is enough; Cargo fetches the dependencies.

```
cargo run --release -p hp48-app                    # the desktop calculator
cargo test --release --workspace                   # all tests (boot tests need ROM/gxrom-r)
cargo test --release -p hp48 --test boot adds_two_numbers   # one test
cargo clippy --workspace --release                 # keep clean
cargo run --release -p hp48-cli -- --seconds 3 --keys "F wait:3 1 Enter 2 Plus" --wait 1
cargo run --release -p hp48-cli -- --seconds 3 --keys "F wait:3" --type "RAD 'SIN(X)' STEQ ERASE DRAW PICTURE" --wait 3
cargo run --release -p hp48 --example stack -- "'X^2' 'Y' STO"   # print the decoded stack
```

`hp48-cli` boots the ROM headless and prints the LCD as text. Keys are `Key` variant names (`N7`, `LeftShift`, `Enter`, ...); `KEY:SECONDS` holds a key and `wait:S` just runs. `--type TEXT` (repeatable) types an RPL command line after the keys and presses ENTER. Other options: `--profile` (PC hot spots with ROM symbols), `--png`, `--dump` (raw 0/1 rows), `--vector-png`, `--svg`.

Typing (`hp48::typing`, `Machine::type_text`) turns text into keystrokes. Letters go through alpha mode, and brackets and quotes insert a pair whose closer is typed as ▶. `-5` is typed as 5 +/-, because in immediate mode `-` subtracts. Symbols such as `<`, `≤` and `→` use their alpha-shift keys (`examples/alphachars.rs`), because the plain `→` key adds spaces. `Σ` has no key, so build names like `ΣDAT` with `133 CHR "DAT" + STR→`.

`hp48-app` options: `--screenshot OUT.png --keys "..." --type "..."` runs a key script (the keys, then each typed line with ENTER), saves the window and exits; `wait` in the script is one second. When the first typed key is a shift, wait about 5 s after `F`. `--plot-only` shows the plot view in the main window, `--pixels` starts in pixel mode, and `--persist` keeps state in scripted runs. State lives in `%APPDATA%/HP48GX/state.bin` (`$XDG_DATA_HOME/HP48GX` elsewhere); set `HP48GX_STATE` to use another file.

After a fresh boot, the ROM shows "Try To Recover Memory?". Answer NO (key F), then wait about 3 s before pressing a shift key: the calculator drops shifts pressed while it is still clearing memory.

### Python

Python 3.10+, standard library only. Run these from `tools/`, because the modules import each other by name.

```
python analyze.py                 # whole-ROM traversal -> ../out/analysis.pickle + coverage summary
python listing.py [lo hi]         # annotated listing -> ../out/rom-r.lst (needs analysis.pickle)
python libcat.py                  # library/command catalogue -> ../out/libraries.txt
python fonts.py --png DIR         # render the three ROM fonts
python hpdis.py code|func|rpl|auto ADDR|NAME   # disassemble / decompile on demand
```

Run the Python tests from the repo root with `python -m unittest discover -s tests`. `out/` is generated and git-ignored; re-run `analyze.py` after changing `saturn.py`, `rpl.py`, `symbols.py` or the data files.

## Rust architecture

- **`crates/saturn`: the CPU.**
  - `op.rs` decodes into a typed `Op` with SASM-style `Display`. It is the single decoder for execution and disassembly, and it agrees with `tools/saturn.py` at every lower-ROM address (`examples/declens.rs`).
  - `cpu.rs` executes, talking to memory through the `Bus` trait. Registers are `Reg(u64)` with nibble helpers, and the ALU works nibble by nibble in hex or decimal mode, matching the semantics in `tests/cpu.rs`.
  - Interrupts: `interruptible`/`int_pending` model being inside the handler (RTI re-enters if one is pending), and `kbd_int_enabled` is INTON/INTOFF.
- **`crates/hp48`: the machine.**
  - `memory.rs`: the daisy-chain controller. Modules are configured in the order HDW, RAM, CE1, CE2, NCE3, matched by `(addr & mask) == base`, read with priority HDW > RAM > CE2 > CE1 > NCE3 > ROM. C=ID returns the IDs the ROM checks at #099C0.
  - `hardware.rs`: the I/O page, CRC, timers (SRQ mirrors the sign bit; INT fires when a timer goes negative; WAKE ends SHUTDN) and the bank switcher. It implements `Bus`.
  - `machine.rs`: time is counted in CPU cycles at 4 MHz. TIMER2 ticks at 8192 Hz and TIMER1 at 16 Hz. SHUTDN fast-forwards to the next timer tick, which is why the emulator runs far faster than real time when idle.
  - `machine.rs` also builds the LCD frame from the display/menu address registers. `keyboard.rs` holds the matrix codes ((OUT line, IN bit); ON is IN bit 15), and `state.rs` does snapshots.
- **`crates/hp48-vector`: LCD to vector scene.**
  - Dense components become rectangle fills, and the light pixels enclosed in them (inverted text) become light strokes. 2×2 blocks become round dots.
  - Everything else is traced as pixel-centre centrelines: diagonal links only where no orthogonal path exists, gentle (≤50°) turns smoothed with anchored Chaikin, sharp corners kept.
  - A loop that starts and ends at a junction stays an open chain. The tests cover this case (the bowl of an `e`).
- **`crates/hp48-rpl`: RPL objects in emulated memory.**
  - Covers object sizes, directories and variable lookup through `CONTEXT`/`USEROB`.
  - Directory layout: `DORRP`, library count (#7FF = none) with 13-nibble entries, offset to the last name, then names chained backwards. Each 5-nibble back-field measures from itself to the previous name.
  - `expr.rs` compiles symbolic objects (RPN order) to an `Expr` by mapping ROM user-command addresses (`x+` #1AB67, `xSIN` #1B4AC, `xi` #1AB45, comparisons, AND/OR, ...) to operators. It evaluates over the reals, or over the complex numbers for parametric plots.
  - `plot.rs` reads the plot setup (EQ, PPAR, ΣDAT/ΣPAR, angle mode) and traces all eight plot types into marks in plot coordinates for any view and size. Its rules come from what the ROM draws, and `crates/hp48/tests/plot.rs` checks every type against the ROM's own PICT: it runs DRAW, reads the grob at `GDISP` (#806E4), and requires a match within one pixel.
- **`crates/hp48-app`: the eframe/egui UI.**
  - `face.rs` holds the key layout and legends (left = purple left-shift, right = green right-shift). The faceplate is drawn with vector primitives scaled to the window.
  - The LCD is drawn either from the vector scene (the default, cached per frame contents) or as pixel rectangles.
  - `plot.rs` draws `hp48_rpl::plot` output in a separate resizable viewport, with zoom and pan. The viewport opens by itself when the calculator shows PICT (VDISP #806DA equals GDISP).
  - Ctrl+V types the clipboard into the calculator.
  - `persist.rs` gives the calculator continuous memory: save on exit, and advance TIMER2 by the wall-clock time spent closed.

### Translating ROM routines to Rust (HLE)

`crates/hp48/src/hle.rs` holds native replacements for machine-code ROM routines, registered in `NATIVES` by entry address. `Machine::run` calls a native in place of the routine and then performs the RTN.

- A native must reproduce the routine's full effect: every register (including scratch registers and P), carry, HST bits and memory. Read the ROM code (`python tools/hpdis.py func ADDR`) and mirror its early exits.
- `tests/hle.rs` runs every native against the ROM on 5000 random register states through `hle::verify`. Add new natives to `NATIVES` and they are tested automatically.
- RPL-level routines (secondaries) will need a similar harness that compares the data stack instead of registers.

Addresses you will need again: fonts at #7A047 (10-row), #7B257 (8-row) and #7C102 (minifont, with remap table #7C793); `DSKTOP` #806F8 (stack level 1 pointer); `USEROB` #80711; `CONTEXT` #8071B; system flags #80843; user flags #80853; ROM library table #702C4.

## Python architecture

- `rom.py` loads the image as nibbles (low nibble of each byte first). `saturn.py` is the reference decoder, and `rpl.py` decodes objects and library headers.
- `symbols.py` merges EDB names (preferred) with the Very Big List. VBL IOR/SYS names only label #00100–#0013F and #80000 and up.
- `analyze.py` marks every nibble as an `Item`:
  - Seeds: the library table and link tables, then reset, interrupt, prologs, symbols and access handlers.
  - RPL objects are decoded before code. Code may overlap code only at branch targets.
  - Carry is tracked so that `GOC`/`GONC` after a test become unconditional. Callees that start with `C=RSTK` take inline data.
  - `gap_pass` speculatively classifies the rest.
- Memory model rule: pointers from lower ROM to #80000 and up mean RAM. Code in upper ROM is only allowed inside `DOCODE` bodies and in the self-test area #80000–#82006.

## Contents

- `docs/cpu.txt`: HP's 1LT8 (Saturn) CPU spec. It is authoritative for instruction semantics and encodings (§5.3). Bit 3 of field nibbles marked "X" is don't-care.
- `docs/saturn.txt`: Mastracci's Saturn/HP48 hardware guide (I/O registers §4.1, bank switching §4.4, keyboard §4.9, CONFIG and daisy chain §2.4).
- `data/entries48g.txt` and `data/vbl48gx-r.txt`: symbol tables derived from third-party lists, using ROM R addresses.
- `crates/hp48-app/assets/`: DejaVu Sans (see `DejaVu-LICENSE`), used for faceplate symbols.
- `ROM/gxrom-r` is proprietary HP firmware. Don't redistribute or publish it, or listings, fonts or other data extracted from it. The Rust code reads the fonts and objects from the ROM at run time instead of shipping copies.

## Domain notes

- Memory is addressed in 4-bit nibbles. Addresses are 20 bits (5 nibbles), and registers are 64 bits (16 nibbles).
- When the two docs disagree, trust `cpu.txt` for CPU behaviour and `saturn.txt` for HP48 board and peripheral behaviour. x48ng (codeberg.org/gwh/x48ng) was used only as a cross-reference for I/O register behaviour and key legends.
- Addresses in output are hex with a `#` prefix, matching HP convention.
