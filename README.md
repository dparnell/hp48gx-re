# HP 48GX: emulator and ROM source

This repository holds three things:

- **`firmware/`**: the complete HP 48GX ROM (revision R) as commented,
  editable assembler and RPL source. It builds to a ROM image that runs on the
  calculator's emulators. Built unchanged, it is identical to the original
  ROM. Use it to fix ROM bugs or to study how the calculator works. Start with
  [`firmware/README.md`](firmware/README.md).
- **`crates/`**: an HP 48GX emulator in Rust. It has a desktop calculator with
  a vector-drawn display and a resizable plot window, and a headless
  command-line runner.
- **`tools/`, `docs/`, `data/`**: the reverse-engineering tools that produced
  the source (an analyser, a disassembler and an assembler), and notes on the
  ROM's structure ([`docs/rom-map.md`](docs/rom-map.md)).

## Quick start

You need Python 3.10 or later, and Rust 1.80 or later.

```
python tools/build.py                                   # firmware/ -> out/rom.bin
cargo run --release -p hp48-app -- --rom out/rom.bin    # run it
```

Without `--rom`, the emulator runs `ROM/gxrom-r`, the original ROM.

To test a rebuilt ROM, set `HP48_ROM` and run the emulator's test suite and the Python tests:

```
HP48_ROM=out/rom.bin cargo test --release --workspace
python -m unittest discover -s tests
```

The tests boot the ROM, calculate, and compare plots with the ROM's own drawing.

The firmware is Hewlett-Packard's (Copyright HP 1993). HP has made the HP 48
ROM images freely available for use with emulators.
