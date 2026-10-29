# HP 48GX ROM revision R, as source

This directory holds the complete firmware of the HP 48GX (ROM revision R,
Copyright HP 1993) as commented assembler and RPL source. Built unchanged,
it gives back the original ROM bit for bit. It is meant to be edited: to fix
bugs in the ROM, to try out changes, or just to read how the calculator works.

The source was reconstructed from the ROM image by `tools/disasm.py`. It is now
the master copy, so edit it here. Running `disasm.py` again writes to
`out/src`, not here.

## Building

Run this from the repository root. It needs Python 3.10 or later, and nothing else.

```
python tools/build.py                  # firmware/ -> out/rom.bin
```

Building does not need the original ROM. If `ROM/gxrom-r` is present,
`build.py` compares the result with it. It lists which code moved and by how
much, and which bytes really changed, leaving out pointers and offsets that
changed only because their target moved.

Try the result in the emulator in this repository:

```
cargo run --release -p hp48-app -- --rom out/rom.bin          # the calculator
cargo run --release -p hp48-cli -- --rom out/rom.bin --seconds 3 --keys "F wait:3" --type "1 0 /" --wait 2
cargo run --release -p hp48 --example selftest -- out/rom.bin  # the ROM's own self-test CRC check
```

The image is packed two nibbles per byte, low nibble first, the format most
HP 48 emulators use.

## Known bugs

`BUGS.md` lists the bugs the HP 48 FAQ reports for revision R, with steps
to reproduce, where each is in the source and what is known about its cause.
`cargo run --release -p hp48 --example knownbugs -- out/rom.bin` checks a
build for each bug.

## Layout

| Path | Contents |
|---|---|
| `rom.s` | The top file. It includes everything in address order. |
| `equates.s` | Names for RAM and I/O addresses. |
| `lower/` | #00000–#7FFFF: code that runs in place (kernel, RPL, built-in commands, messages, units, fonts). |
| `upper/` | #80000–#FFFFF: the self-test, and the library parts the ROM copies to RAM before use. |
| `images/` | Graphics objects (GROBs) as PNG files. Edit them with any paint program, keeping the size. |
| `fonts/` | The three system fonts as glyph sheets (PNG), one glyph per cell. |

Each file starts with its address range and a description. On each line, the
comment on the right gives that line's address in the original ROM (for a
line of several RPL objects, the first one's). These stay as they are after
edits, so you can still find things in the original.

## Source format

The format is described at the top of `tools/sasm.py`. In short:

- **Saturn assembly** uses SASM-style mnemonics: `A=DAT1 A`, `GOSBVL POP#`, `?C=0 A` and then `GOYES label` on the next line.
- **RPL** uses RPLCOMP-like syntax: `::` … `;`, `{ }`, `# 3F`, `% 1.5`, `$ "text"`, `ROMPTR 0AB 00F`, and `CODE` … `ENDCODE` for machine code inside RPL. Any other word is a pointer to that label. A line holds several objects. A nested `::` starts a line; a line ends after words that act on the objects that follow them (`IT`, `ITE`, `?SKIP`, the `…case` words) and those objects. Argument-type dispatch tables (`CK2&Dispatch`) put one case per line, with its argument types as the comment (`real real`; the codes are those of the ROM's tables at #19123).
- **Comments** start with `*`.
- **Data directives** are `CON(n)`, `REL(n)`, `NIBHEX`, `NIBASC` and `BSS`.

## Names

Labels come, in order of preference, from our notes (`data/annotations.txt`),
the published entry-point lists (`data/entries48g.txt`, `data/vbl48gx-r.txt`)
and the libraries' own command names. Where none of those names a piece of
code, the generator works one out from where it is used. These names are ours,
not HP's, and always contain `~`, which no published name does:

- `xSUB~grob,list,list`: the case of a command's argument dispatch for those argument types (deepest stack level first).
- `ROMPOLL~1`: a helper that only `ROMPOLL` uses (numbered in address order); `GETKEY~2~4` is a helper of a helper.

Everything else has a generated name that just gives its address: `OBJ_` for
an RPL object, `SUB_` for a subroutine, `L_` for a branch target, and
`ROMP_lib_cmd` for an unnamed library command.

Objects and tables are written with labels, never as fixed addresses, so code
can grow or shrink:

- **Object lengths** are `LENGTH` … `ENDLENGTH` blocks, and the assembler computes them.
- **Free space.** `FILLTO #addr` marks zero fill. It keeps what follows at its old address, or, once the code before it has grown past `#addr`, it gives way and the rest moves up. The assembler prints a note when that happens.
- **Library tables** (link tables, hash tables, command headers) are written with labels, so commands can be added or moved.
- **The units table** (`lower/740E1-messages.s`) is written entry by entry, with labels and links.
- **The self-test checksum** is the `CRC` lines at #7FFFC and #FFFFC. The assembler computes them, so the self-test still passes after edits.

## Things that must not move

The assembler checks all of these and stops with an error if an edit breaks one:

- `ORG #00000`: the CPU starts here.
- `PIN #0000F`: the interrupt entry.
- `PIN #028FC`: PRLG. Every object prolog begins with nibbles that also read as the address #028FC.
- The three upper-ROM windows. `ORG #80000`, `#90000` and `#C0000` start them, and a library part must not grow past the start of the next one.
- `A=IN`/`C=IN` must be at an even address, because of a hardware bug.
- Branches have limited range. If an edit pushes a target out of reach, the error suggests the long form (`GOLONG`, `GOSBVL`).
- Links in the units table are one byte, so each entry must stay within 255 nibbles of the next name of the same length.

## Checking a change

- **`tools/build.py`** reports moves and changed bytes, as described above. If a change you didn't make shows up there, look at it.
- **The emulator's test suite** boots the ROM and checks calculations, saved state and all eight plot types against the ROM's own drawing. Run it on your build with `HP48_ROM=out/rom.bin cargo test --release --workspace`.
- **The emulator adapts to a rebuilt ROM.** The desktop app keeps a separate saved state for each ROM image. It uses its native Rust replacements only for routines that are unchanged at their original address. The plot window finds the user commands through the ROM's own library tables.
- **`lockstep`** runs two ROMs side by side, one instruction at a time, and stops where they first differ:

  ```
  cargo run --release -p hp48 --example lockstep -- ROM/gxrom-r out/rom.bin LO HI DELTA --tour
  ```

  It is meant for ROMs that should behave identically, e.g. after reorganising code. For a real fix, it shows the first point where the fixed code behaves differently.

## Licence

The firmware is Hewlett-Packard's (Copyright HP 1993). HP has made the HP 48
ROM images freely available for use with emulators, and no longer makes
these calculators. This source is provided for study, repair and
preservation of the HP 48GX.
