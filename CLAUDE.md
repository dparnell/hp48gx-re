# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository state

This repository holds reference material for HP 48 (Saturn CPU) work. It has no source code, build system or tests yet. When code is added, put its build, test and run commands in this file.

## Contents

- `ROM/gxrom-r`: HP 48GX ROM image, revision R. It is 524,288 bytes, which is 1M nibbles packed two per byte and covers the Saturn's full 20-bit nibble address space. Treat it as read-only input. Check the nibble order within each byte before you depend on it. The ROM is proprietary HP firmware, so don't redistribute or publish it.
- `docs/cpu.txt`: HP's internal spec for the 1LT8 CPU (the Saturn core). It covers registers, field selection (§5.2.2.1), the carry bit, pointer registers, the return stack, status bits, memory load/store, HEX/DEC modes, the full instruction set with encodings (§5.3, from about line 424) and the interrupt system (§5.4). Use it as the authoritative source for instruction semantics.
- `docs/saturn.txt`: Matthew Mastracci's "Guide to the Saturn Processor (With HP48 Applications)". Use it for HP48-specific hardware: memory-mapped I/O registers at `#00100–#0013F` (§4.1), the display driver and LCD (131×64), plug-in cards and bank switching (§4.3–4.4), UART/serial/IR, the speaker, the keyboard matrix (§4.9), timers and interrupts (§2.3). It also has practical recipes (§6) for greyscale, tones and direct keyboard reads.

## Domain notes

- Memory is addressed in 4-bit nibbles, not bytes. Addresses are 20 bits (5 nibbles). Registers are 64 bits (16 nibbles), and instructions act on field-selected sub-ranges of them.
- When the two docs disagree, trust `cpu.txt` for CPU behaviour and `saturn.txt` for HP48 board and peripheral behaviour.
