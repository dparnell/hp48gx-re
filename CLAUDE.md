# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This repository reverse engineers the HP 48GX ROM, revision R (`ROM/gxrom-r`). The findings are written up in `docs/rom-map.md`. Read that first: it covers the memory map, boot path, ROM library table, covered upper ROM, and the code idioms the analyser handles.

## Commands

Everything is plain Python 3 (3.10+, standard library only). Run commands from `tools/`, because the modules import each other by name.

```
python analyze.py                 # whole-ROM traversal -> ../out/analysis.pickle + coverage summary
python listing.py [lo hi]         # annotated listing -> ../out/rom-r.lst (needs analysis.pickle)
python libcat.py                  # library/command catalogue -> ../out/libraries.txt
python hpdis.py code ADDR|NAME [n]   # linear disassembly
python hpdis.py func ADDR|NAME       # all code reachable via jumps/branches, in address order
python hpdis.py rpl  ADDR|NAME       # decompile an RPL object
python hpdis.py auto ADDR|NAME       # object, PCO or code, whichever is there
```

Run the tests from the repo root with `python -m unittest discover -s tests`. To run a single test, use `python -m unittest tests.test_saturn.Encodings.test_group8`.

`out/` is generated and git-ignored. Re-run `analyze.py` after changing `saturn.py`, `rpl.py`, `symbols.py` or the data files, because `listing.py` and `libcat.py` read the pickle.

To regenerate the symbol tables in `data/`, download the sources named in `docs/rom-map.md` and run `import_edb.py entries.db > ../data/entries48g.txt` and `import_vbl.py MEMO.LST > ../data/vbl48gx-r.txt`.

## Architecture

- `rom.py` loads the image as a `bytes` of nibbles (low nibble of each byte first). Use `Rom.addr(a)` for little-endian 5-nibble reads.
- `saturn.py` decodes one Saturn instruction into an `Insn` with its size, SASM-style text, a `flow` kind (next/jump/call/ret/cjump/cret/ijump/stop) and `target`/`const`. Encodings follow `docs/cpu.txt` §5.3.2. Branch offsets are relative to different bases (GOC/GONC/GOTO/GOYES: the offset field; GOSUB: pc+4; GOLONG: pc+2; GOSUBL: pc+6), and the tests pin each one down.
- `rpl.py` decodes RPL objects by prolog (`PROLOGS`), parses library headers and hash tables, and detects PCOs (`addr(a) == a+5`).
- `symbols.py` merges EDB names (preferred) with the Very Big List. VBL names marked IOR/SYS are I/O or RAM names and are only used for addresses #00100–#0013F and #80000 and up, never as labels for ROM code.
- `analyze.py` is the core. It marks every nibble as an `Item` (code, obj, pco, codebody, lib*, ptrdata, fill, data):
  - Seeds: the ROM library table at #702C4 and each library's link table, then reset, the interrupt vector, prologs, symbols, and the access handlers.
  - The work queue drains RPL objects before code, so code decoding stops at real objects.
  - Code may overlap code only at branch targets. Fall-through into the middle of an instruction is rejected.
  - The carry flag is tracked so that `GOC`/`GONC` after a test become unconditional.
  - Calls to routines that start with `C=RSTK` are treated as inline-data calls.
  - `gap_pass` then speculatively decodes unreferenced gaps (marked in `speculative`) and classifies the rest as fill or data.
- Memory model rule: pointers from lower ROM to #80000 and up mean RAM and are not followed. Code in upper ROM is only allowed inside `DOCODE` bodies and in the self-test area #80000–#82006 (`UNCOVERED_CODE`).

## Contents

- `docs/cpu.txt`: HP's 1LT8 (Saturn) CPU spec. It is authoritative for instruction semantics and encodings (§5.3, from about line 424). Bit 3 of field nibbles marked "X" is don't-care.
- `docs/saturn.txt`: Mastracci's Saturn/HP48 hardware guide (I/O registers §4.1, bank switching §4.4, keyboard §4.9, CONFIG and daisy chain §2.4).
- `data/entries48g.txt` and `data/vbl48gx-r.txt`: symbol tables derived from third-party lists. Both use ROM R addresses.
- `ROM/gxrom-r` is proprietary HP firmware. Don't redistribute or publish it, or listings generated from it.

## Domain notes

- Memory is addressed in 4-bit nibbles. Addresses are 20 bits (5 nibbles), and registers are 64 bits (16 nibbles).
- When the two docs disagree, trust `cpu.txt` for CPU behaviour and `saturn.txt` for HP48 board and peripheral behaviour.
- Addresses in output are hex with a `#` prefix, matching HP convention.
