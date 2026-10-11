* HP 48GX ROM revision R (Copyright HP 1993) as reassemblable source.
* Reconstructed by tools/disasm.py; see firmware/README.md.
* Build: python tools/build.py

        INCLUDE "equates.s"
        INCLUDE "lower/00000-hardware.s"                  * Reset and interrupt entries, keyboard, timers, low-level system code
        INCLUDE "lower/02002-rpl-core.s"                  * Object prologs, the RPL inner loop and stack primitives
        INCLUDE "lower/04003-bints.s"                     * Built-in binary integers and stack words
        INCLUDE "lower/06000-rpl-control.s"               * EVAL, COLA, ?SKIP and other control words
        INCLUDE "lower/08001-memory.s"                    * Directories, variables and memory management
        INCLUDE "lower/0A006-misc-0A000.s"
        INCLUDE "lower/0C001-time.s"                      * Clock and alarms
        INCLUDE "lower/0E006-units.s"                     * Unit objects and conversion
        INCLUDE "lower/10029-units-grob.s"                * Unit arithmetic and graphics objects
        INCLUDE "lower/12002-graphics.s"                  * Display buffers and graphics
        INCLUDE "lower/14001-decompile.s"                 * Decompiling and displaying objects
        INCLUDE "lower/16000-strings.s"                   * Conversion of objects to strings
        INCLUDE "lower/1802E-dispatch.s"                  * Argument checks and type dispatch
        INCLUDE "lower/1A002-user-arith.s"                * User arithmetic commands (x+, x*, ...)
        INCLUDE "lower/1C017-user-commands.s"             * User commands
        INCLUDE "lower/1F01F-user-commands.s"             * User commands
        INCLUDE "lower/22005-programs.s"                  * Program structures and library 700
        INCLUDE "lower/24028-parser.s"                    * Parser and compiler
        INCLUDE "lower/27029-parser.s"                    * Parser and compiler
        INCLUDE "lower/2A002-reals.s"                     * Real number arithmetic
        INCLUDE "lower/2C000-misc-2C000.s"
        INCLUDE "lower/2E0A9-io.s"                        * Serial I/O and Kermit
        INCLUDE "lower/30000-io-print.s"                  * I/O and printing
        INCLUDE "lower/33012-io-print.s"                  * I/O and printing
        INCLUDE "lower/34006-arrays.s"                    * Arrays
        INCLUDE "lower/36039-long-reals.s"                * Extended real arithmetic
        INCLUDE "lower/38000-display.s"                   * Status area and annunciators
        INCLUDE "lower/3A00D-menus.s"                     * Menus and the built-in libraries 0A1-0A7
        INCLUDE "lower/3D00E-menus.s"                     * Menus and the built-in libraries 0A1-0A7
        INCLUDE "lower/3E005-keys.s"                      * Key handling
        INCLUDE "lower/40002-outer-loop.s"                * Parameterized outer loop and menus
        INCLUDE "lower/42023-input.s"                     * Key input and the cursor
        INCLUDE "lower/4400C-editor.s"                    * Command line editor
        INCLUDE "lower/46007-plot.s"                      * Plotting
        INCLUDE "lower/49017-plot.s"                      * Plotting
        INCLUDE "lower/4C082-plot.s"                      * Plotting
        INCLUDE "lower/4F0AC-plot.s"                      * Plotting
        INCLUDE "lower/52017-flags.s"                     * System and user flags
        INCLUDE "lower/54000-algebra.s"                   * Symbolic algebra
        INCLUDE "lower/57004-algebra.s"                   * Symbolic algebra
        INCLUDE "lower/5A01D-algebra.s"                   * Symbolic algebra
        INCLUDE "lower/5D01D-algebra.s"                   * Symbolic algebra
        INCLUDE "lower/6001C-rpl-utils.s"                 * Control structures and stack utilities
        INCLUDE "lower/63029-rpl-utils.s"                 * Control structures and stack utilities
        INCLUDE "lower/660FC-misc-66000.s"
        INCLUDE "lower/69142-misc-66000.s"
        INCLUDE "lower/6C186-misc-66000.s"
        INCLUDE "lower/6F360-misc-66000.s"
        INCLUDE "lower/70039-libraries.s"                 * Library table, access pointers, bank switching
        INCLUDE "lower/73088-libraries.s"                 * Library table, access pointers, bank switching
        INCLUDE "lower/740E1-messages.s"                  * Message tables
        INCLUDE "lower/760C9-hash.s"                      * Hash table of library 002
        INCLUDE "lower/78002-misc-78000.s"
        INCLUDE "lower/7A2B3-fonts.s"                     * System fonts (10-row, 8-row, minifont) and the minifont remap table
        INCLUDE "lower/7C855-misc-7C855.s"
        INCLUDE "lower/7E001-version.s"                   * Fill and version strings
        INCLUDE "upper/80000-selftest.s"                  * Self-test code (runs with RAM unconfigured)
        INCLUDE "upper/82007-lib0F0.s"                    * Library part 0F0
        INCLUDE "upper/8501B-lib0F0.s"                    * Library part 0F0
        INCLUDE "upper/86FE4-lib0C0.s"                    * Library part 0C0
        INCLUDE "upper/8998E-lib0F1.s"                    * Library part 0F1
        INCLUDE "upper/8C9F6-lib0F1.s"                    * Library part 0F1
        INCLUDE "upper/8D27C-lib0EA.s"                    * Library part 0EA
        INCLUDE "upper/90000-lib0C2.s"                    * Library part 0C2
        INCLUDE "upper/93079-lib0C2.s"                    * Library part 0C2
        INCLUDE "upper/96268-lib0C2.s"                    * Library part 0C2
        INCLUDE "upper/98E02-lib0E6.s"                    * Library part 0E6
        INCLUDE "upper/99FE9-lib0E3.s"                    * Library part 0E3
        INCLUDE "upper/9CFFD-lib0E3.s"                    * Library part 0E3
        INCLUDE "upper/9DA13-lib0E4.s"                    * Library part 0E4
        INCLUDE "upper/A07E9-lib0E1.s"                    * Library part 0E1
        INCLUDE "upper/A2437-lib0B4.s"                    * Library part 0B4
        INCLUDE "upper/A54DB-lib0B4.s"                    * Library part 0B4
        INCLUDE "upper/A8521-lib0B4.s"                    * Library part 0B4
        INCLUDE "upper/AB534-lib0B4.s"                    * Library part 0B4
        INCLUDE "upper/AE566-lib0B4.s"                    * Library part 0B4
        INCLUDE "upper/B1606-lib0B4.s"                    * Library part 0B4
        INCLUDE "upper/B4B32-lib0B4.s"                    * Library part 0B4
        INCLUDE "upper/B4B39-lib0B5.s"                    * Library part 0B5
        INCLUDE "upper/B7B7D-lib0B5.s"                    * Library part 0B5
        INCLUDE "upper/BA576-lib0B3.s"                    * Library part 0B3
        INCLUDE "upper/BD8E9-lib0B3.s"                    * Library part 0B3
        INCLUDE "upper/C0000-lib0AB.s"                    * Library part 0AB
        INCLUDE "upper/C31BE-lib0AB.s"                    * Library part 0AB
        INCLUDE "upper/C31C5-lib0A9.s"                    * Library part 0A9
        INCLUDE "upper/C4E26-lib0AA.s"                    * Library part 0AA
        INCLUDE "upper/C5332-lib0A8.s"                    * Library part 0A8
        INCLUDE "upper/C78DB-lib0C1.s"                    * Library part 0C1
        INCLUDE "upper/CA95B-lib0C1.s"                    * Library part 0C1
        INCLUDE "upper/CADC4-lib0C4.s"                    * Library part 0C4
        INCLUDE "upper/CBACE-lib0C3.s"                    * Library part 0C3
        INCLUDE "upper/CCA9F-lib0E7.s"                    * Library part 0E7
        INCLUDE "upper/CF380-lib0E0.s"                    * Library part 0E0
        INCLUDE "upper/D1362-lib0E8.s"                    * Library part 0E8
        INCLUDE "upper/D4806-lib0E8.s"                    * Library part 0E8
        INCLUDE "upper/D49CE-lib0B0.s"                    * Library part 0B0
        INCLUDE "upper/D79FD-lib0B0.s"                    * Library part 0B0
        INCLUDE "upper/D9A51-lib0B2.s"                    * Library part 0B2
        INCLUDE "upper/DCA82-lib0B2.s"                    * Library part 0B2
        INCLUDE "upper/DCB83-lib0B1.s"                    * Library part 0B1
        INCLUDE "upper/DE45F-lib0BF.s"                    * Library part 0BF
        INCLUDE "upper/DF08C-lib0BE.s"                    * Library part 0BE
        INCLUDE "upper/E04FF-lib0BD.s"                    * Library part 0BD
        INCLUDE "upper/E0AFF-lib0BC.s"                    * Library part 0BC
        INCLUDE "upper/E114B-lib0BB.s"                    * Library part 0BB
        INCLUDE "upper/E1A57-lib0BA.s"                    * Library part 0BA
        INCLUDE "upper/E228B-lib0B9.s"                    * Library part 0B9
        INCLUDE "upper/E384B-lib0E2.s"                    * Library part 0E2
        INCLUDE "upper/E6DA5-lib0E2.s"                    * Library part 0E2
        INCLUDE "upper/E9E0F-lib0E2.s"                    * Library part 0E2
        INCLUDE "upper/EDBBA-lib0E2.s"                    * Library part 0E2
        INCLUDE "upper/F0DC0-lib0E2.s"                    * Library part 0E2
        INCLUDE "upper/F3F3C-lib0E2.s"                    * Library part 0E2
        INCLUDE "upper/F6FB8-lib0E2.s"                    * Library part 0E2
        INCLUDE "upper/FA04D-lib0E2.s"                    * Library part 0E2
        INCLUDE "upper/FD2DB-lib0E2.s"                    * Library part 0E2
