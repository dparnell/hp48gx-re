# HP48GX ROM revision R: structure and memory map

These notes come from analysing `ROM/gxrom-r` with the tools in `tools/`. Each
claim below cites the ROM address where it was observed, so you can check it
with `python tools/hpdis.py func|code|rpl ADDR`.

## Image

- The file is 524,288 bytes packed two nibbles per byte, low nibble first.
  That gives 1M nibbles, which covers the full 20-bit Saturn address space.
  The first nibbles are `2369B108DADF…`.
- The version strings are `Version HP48-R` / `Copyright HP 1993` at
  #7FFBF/#7FFD5. A second copy, `… HP48-R` / `Copyright HP 1989`, is at
  #8195D inside the self-test area.

## Run-time memory map

| Range | Contents at run time | Evidence |
|---|---|---|
| #00000–#7FFFF | Lower ROM, executed in place | reset at #00000; boot runs code at #7018C |
| #00100–#0013F | I/O registers (HDW), overlaying ROM | CONFIG #00100 at #02241 |
| #7F000–#7FFFF | 4K-nibble bank switcher (CE1) | CONFIG at #0AD6D–#0AD77; `saturn.txt` §4.4 |
| #80000–#BFFFF | 128KB RAM. The first 64K nibbles (#80000–#8FFFF) on 32KB models | RAM probe/CONFIG at #0224F |
| #C0000–#FFFFF | Port 1 card (128KB or 32KB) when one is present | #09B26 |

ROM is configured over the whole space at lowest priority, so it shows through
only where nothing else is mapped. The upper half of the image
(#80000–#FFFFF) is therefore **covered**: by RAM always, and by port cards when
they are present. It holds only:

1. **Self-test code at #80000–#82006.** It calls lower ROM directly (e.g.
   `GOSBVL ClrScrMn` at #80005), so it runs while RAM is unconfigured. Nothing
   in the image jumps to it directly.
2. **Library parts** (#82007–#FF959), described below. Every pointer inside
   these objects targets lower ROM. Cross-references within or between
   libraries go through ROMPTRs, so an object can be fetched into RAM and run
   there.

## Boot path

`Reset #00000: P=3; GOTO #001BC` → `GOVLNG #01FC6` → … `RESET` (#01FEA) →
`GOVLNG #7018C`. That code:

- configures the I/O page (#02241);
- probes RAM by writing #80000 and checking for a mirror at #90000. It then
  configures RAM at #80000 with size #C0000 (128KB) or #F0000 (32KB), and
  stores the base nibble in `IRAM@` (#0011F) (#0224F);
- returns to warm/cold start at #01FF4.

Later, #0AC6A rebuilds `ROMPTAB` (RAM #809A3) from the ROM library table and
reconfigures the bank switcher and ports (#0AD4F–#0AD8E).

The interrupt handler entry is #0000F.

## ROM library table (#702C4)

The table's address is loaded with `LC(5) #702C4` at #0ACF9. It has 52
records of 13 nibbles each, terminated by lib number `FFF`:

```
lib#   (3 nibbles)
header (5)   address of the library's lib# field
access (5)   0 = directly visible; otherwise an access handler
```

| Access handler | Used for |
|---|---|
| `00000` | parts in lower ROM: libs 000–00D, 019, 0A1–0A7, 700 |
| `#726A1` | parts at #8xxxx: 0F0 0C0 0F1 0EA |
| `#72386` | parts at #90000–#BFFFF: 0C2 0E6 0E3 0E4 0E1 0B4 0B5 0B3 |
| `#70B38` | parts at #C0000–#FFFFF: 0AB 0A9 0AA 0A8 0C1 0C4 0C3 0E7 0E0 0E8 0B0 0B2 0B1 0BF–0B9 0E2 |

`ROMPTAB` in RAM holds a 3-nibble count followed by 16-nibble entries. It is
searched by lib number at #0843A (used by `ROMPART>ADDR`).

Right after the table come `DOACPTR` objects (#7056B onward). These are the
message tables of libs 000–00D.

### Library header

The header pointed to by the table is the same layout that follows the name in
a `DOLIB` object:

```
lib#     (3)
hash     (5)  self-relative offset, 0 = none
message  (5)
link     (5)
config   (5)
```

A field may point to a `DOACPTR` (prolog #02BAA, body = target address (5) +
access handler (5)) instead of the table itself. Lib 002 does this for its hash
table (→ #7633B) and its message table.

- **Link table:** a `DOHSTR` of 5-nibble self-relative offsets, one per command.
- **Hash table:** a `DOHSTR` holding 16 offsets (one per name length 1–16),
  then a 5-nibble names-area size, then entries of the form
  `len(2) chars(2·len) cmd#(3)`. After the names comes one 5-nibble
  word per command, in command order: the distance back to that command's
  name entry, or 0 if the command has no name (e.g. lib 002 at #776DD).
- **Command headers.** 514 commands of libs 002, 0AB, 0F1 and 700 are
  preceded by 7 nibbles: a flag nibble, then the lib# (3) and command# (3).
  The flag is mostly 8; values 0–E occur and their meaning is not yet
  known. Example: `8 002 0C0` right before `xAUTO` at #1E1AB.
- **Message tables** (`MsgTab(n)`, #740E1…) are arrays of strings (`DOARRY`
  with element type `DOCSTR`): each element is a length and the characters,
  without a prolog.
- **Version strings.** They form a `::` object at #7FFA0 that holds two
  strings. The image ends with the nibbles `DEFD` at #7FFFC.

`out/libraries.txt` lists every library and command. Commands are named from
the hash tables, with Dominik's EDB used as a fallback for ROMPTRs.

## Fixed points and data that holds addresses

These are the places the reassemblable source (`tools/disasm.py`) must handle so that code can move.

- **PRLG must stay at #028FC.** Every prolog starts with `D=D-1 A; HST=0 0`. Its nibbles `CF820`, read as an address, are #028FC. So `PC=(A)` on a prolog address (running a prolog as an object, e.g. in SKIPOB #03019) jumps to PRLG. The zero fill at #02848 absorbs changes before it.
- **Bank switcher and ports:** `D0=(5) #7F000` (#723C1) and `LC(5) #7E000` are I/O windows (CE1/CE2/NCE3), not ROM.
- **Code-pointer objects:** an RPL object can be just the address of machine code elsewhere, run through the inner loop like a PCO. Example: `DUP#0=case` #61891 → #641CC.
- **Inline tables after GOSUB:** e.g. `GOSUB SUB_15C5F` at #15B48 is followed by 15-nibble entries (prolog, two handler addresses) that the callee reads.
- **RPL pointer runs after code:** e.g. #315EF after CLOSEUART holds a pointer and SEMI, run by the inner loop after the code.
- **Units table:** the hex string at #75675–#760C9. It mixes names and numbers with pointers to constants such as `%%1` at arbitrary offsets (e.g. #756A7).
- **Font and table bases** are loaded as addresses before the first entry: `LC(5) #7A047` is Font10 − 620 (code 0 of a table that starts at code #1F), and `LC(5) #26DBF` (#26D7D) is indexed by 5·n.

## RPL object layer

- Prolog addresses are listed in `tools/rpl.py`; they match EDB. Each prolog's
  code starts with `D=D-1 A` / `HST=0 0`, whose encoding is the `PRLG`
  signature #028FC, then `GOC` to the garbage-collect path.
- Each prolog is preceded by two 5-nibble words. For DOBINT (#02911) these are
  #02C28 and #0308E.
- A **PCO** (primitive code object) is a 5-nibble word that points to itself
  +5. The inner loop jumps through it straight into the code that follows.
- Tables of prolog addresses used for type dispatch sit at #15B6A… and
  #19128…; they are not objects.

## Code idioms the analyser has to handle

- **Overlapping instructions.** A branch can target the tail of another
  instruction. For example, at #0097B the fall-through decodes as `RTNCC`
  (`03`), while #0097C is reached by `GOYES` and decodes as `LC(3) #1FF`. Only
  about 10 such sites remain.
- **`GOC`/`GONC` as an unconditional short jump.** This is used after a test
  (whose fall-through leaves carry clear) or after an operation that never
  carries. The analyser tracks carry along paths. Where a conditional branch
  falls through into an RPL object, the branch is marked "always taken".
- **Inline data after `GOSUB`.** The callee starts with `C=RSTK` and reads the
  bytes after the call site.
- **Computed jumps.** The bank-select stubs at #7073F (`D0=(5) #7F040+2n`;
  `GOTO`) and the self-test are reached only through `PC=(A)`/`PC=C`. The gap
  pass finds them and marks them speculative.

## Other identified areas

| Range | What |
|---|---|
| #7A2B3–#7B446 | 10-row font, codes #1F–#FF (glyph = #7A047 + 20·code, used when XM=1; see `tools/fonts.py`) |
| #7B447–#7C256 | 8-row font, codes #1F–#FF (glyph = #7B257 + 16·code, XM=0) |
| #7C257–#7C6B8 | Minifont, indexes #1F–#84 (glyph = #7C102 + 11·index: width nibble, 5 rows) |
| #7C793–#7C854 | Minifont index for codes #9F–#FF, one byte each |
| #7E001–#7FF9F | Zero fill up to the version object (under the bank switcher at run time) |
| #FF959–#FFFFF | Zero fill after the last library |

## Coverage (run `python tools/analyze.py`)

| | code | RPL objects + PCOs | library structures | fill | unclassified data |
|---|---|---|---|---|---|
| Lower ROM | ~28.7% | ~61.4% | ~2.5% | 2.5% | ~4.7% |
| Upper ROM | 4.6% (incl. code objects) | 88.8% | 4.0% | 1.5% | 1.0% |

## Sources

- `docs/cpu.txt`: HP 1LT8 CPU spec (instruction encodings).
- `docs/saturn.txt`: Mastracci, *Guide to the Saturn Processor*.
- Carsten Dominik's entry database, EDB 2.11
  (https://staff.fnwi.uva.nl/c.dominik/hpcalc/entries/). Its 48G addresses
  refer to ROM R. Extracted to `data/entries48g.txt`.
- AnarcHP's *HP48 Very Big List* (1996, freeware,
  https://www.hpcalc.org/details/3214), rev R addresses, extracted to
  `data/vbl48gx-r.txt`.
- Mika Heiskanen's `entries.srt` (https://www.hpcalc.org/details/1782) was used
  for background only.
