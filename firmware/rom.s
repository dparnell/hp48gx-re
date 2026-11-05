* HP 48GX ROM revision R (Copyright HP 1993) as reassemblable source.
* Reconstructed by tools/disasm.py; see firmware/README.md.
* Build: python tools/build.py

        INCLUDE "equates.s"
        INCLUDE "lower/00000-hardware.s"                  * Reset and interrupt entries, serial and keyboard service, ON-key combinations, timers and wake-ups, battery check, beeper, display and annunciator control
        INCLUDE "lower/02002-rpl-core.s"                  * Boot and memory-lost sequence, RAM and I/O configuration, warm-start log, object prologs, the RPL inner loop, array element access and stack primitives
        INCLUDE "lower/04003-bints.s"                     * Power off and wake-up, card and config checks, the low-battery text, lite sleep, TOUCHTAB key assignments, error traps, built-in binary integers and stack words
        INCLUDE "lower/06000-rpl-control.s"               * Garbage collection, moving memory and adjusting references, EVAL, COLA and return-stack words, DO loops, temporary environments, identifier and library name lookup
        INCLUDE "lower/08001-memory.s"                    * Directories, variables and memory management; ports, cards and bank switching; libraries and backup objects in ports
        INCLUDE "lower/0A006-recovery.s"                  * Library and backup CRC checks, recovery of lost memory, ROMPTAB rebuilt at warm start, ports: status, MERGE and FREE, the hidden directory, parser token tests, and moving RAM at run time
        INCLUDE "lower/0C001-time.s"                      * Reading ROM covered by RAM, unit prefix lookup, array element fetch, some plot helpers, clock and date arithmetic, alarm handling
        INCLUDE "lower/0E006-units.s"                     * Alarm lists, status bits and the alarm beep; hxs helpers; unit objects: parsing a unit into number, factor and dimensions, conversion and unit arithmetic
        INCLUDE "lower/10029-units-grob.s"                * Unit expressions as metas: simplifying and raising them, dimension vectors; sign and exponent keys on the command line; annunciator words; editor and display counters; grob size, clipping and text in grobs
        INCLUDE "lower/12002-graphics.s"                  * Minifont text, grob subgrobs and resizing, display grobs and switching to PICT, pixels, inverting character cells, the cursor and its counters
        INCLUDE "lower/14001-decompile.s"                 * Error words, HALT and the single-step debugger (SST, SST↓, NEXT, DBUG), parts of the SOLVR menu, EQ access, and the front of the object decompiler
        INCLUDE "lower/16000-strings.s"                   * Conversion of objects to text: strings for each type, number formatting, the line-at-a-time decompiler that wraps programs and lists, and the out-of-memory (VLM) dialog
        INCLUDE "lower/1802E-dispatch.s"                  * Out-of-memory dialog (continued), last arguments, the argument-count checks, type dispatch, string logic operators, and the InputForm engine's outer loop
        INCLUDE "lower/1A002-user-arith.s"                * Input-form helpers, then the user commands of library 002 from the directory commands through +, -, *, / to the powers and the scientific functions
        INCLUDE "lower/1C017-user-commands.s"             * User commands of library 002: variables and memory, type tests, GET/PUT/GETI/PUTI, vector commands, stats setup, comparison and logic
        INCLUDE "lower/1F01F-user-commands.s"             * User commands of library 002: APPLY and symbolic support, →Q, STO arithmetic, conversion commands, PURGE and ORDER, memory and port commands (ARCHIVE, RESTORE, FREE, MERGE)
        INCLUDE "lower/22005-programs.s"                  * Commands of library 002 for ports and I/O settings, then library 700: the program structures, each with its compile routine and its SST handler (the slots after the command), and the start of their compile routines
        INCLUDE "lower/24028-parser.s"                    * The compiler: compile routines of program structures, literal objects by their first token, the tokenizer (GetNextToken) with its character class tables, and access to command header flags and trailer slots
        INCLUDE "lower/27029-parser.s"                    * The algebraic parser (an operator-precedence parser), the parser of unit expressions, the decompiler of algebraics to text, and the rounding and packing of long reals
        INCLUDE "lower/2A002-reals.s"                     * Real number arithmetic: entries for each % and %% operation, stack access for the numbers, real constants, and the floating point core (add, multiply, divide, square root, rounding) on 15-digit numbers split across A:B and C:D
        INCLUDE "lower/2C000-statistics.s"                * Probability tails (UTPN and friends), statistics (ΣDAT, ΣPAR, column sums and fits) in library 006, and the start of Kermit in library 00C: sending, server loop
        INCLUDE "lower/2E0A9-io.s"                        * Serial I/O and Kermit: receiving packets, send and get commands, IOPAR and PRTPAR, packet encoding and decoding
        INCLUDE "lower/30000-io-print.s"                  * Kermit: file translation, parameter negotiation, packet encoding. UART driver, printing (PR1, PRST, PRVAR, PRLCD, HP 82240 codes) and I/O error handling
        INCLUDE "lower/33012-io-print.s"                  * Numeric root finder: the engine of ROOT and the solver (library 00A), bracket search and secant steps
        INCLUDE "lower/34006-arrays.s"                    * End of the root finder; text of complex numbers, lists and arrays for display; then library 005: array element access and arithmetic
        INCLUDE "lower/36039-long-reals.s"                * Array and matrix operations with long reals: inverse, LU, products, determinant and system solving
        INCLUDE "lower/38000-display.s"                   * Unit-dimension vectors, the system outer loop and its error trap, the parameterized outer loop, status area, stack display
        INCLUDE "lower/3A00D-menus.s"                     * Edit-line display, menu building, and the key-action libraries: 0A6 (alpha right-shift), 0A4 (alpha), 0A1 (unshifted), 0A5 (alpha left-shift), 0A7 (built-in menus)
        INCLUDE "lower/3D00E-menus.s"                     * Last of the unit menus, then the key-action libraries 0A2 (left-shift) and 0A3 (right-shift)
        INCLUDE "lower/3E005-keys.s"                      * End of the right-shift keys, edit-line delete keys, unit and directory menu helpers, LIB and PORT menus, VAR menu, key to object lookup
        INCLUDE "lower/40002-outer-loop.s"                * Parameterized outer loop and menus
        INCLUDE "lower/42023-input.s"                     * GETKEY, busy annunciator, cursor and edit-line echo, INPUT, the interactive stack
        INCLUDE "lower/4400C-editor.s"                    * Command line editor: end of the interactive stack, edit buffer access, MatrixWriter key table, EquationWriter glue, AXES arguments, DRAX, and the PICTURE keys of the 3D plots
        INCLUDE "lower/46007-plot.s"                      * Plotting: PICTURE environment, tracing and cursor keys, the GRAPH menus, ZOOM and box drawing
        INCLUDE "lower/49017-plot.s"                      * Plotting: AUTOSCALE sampling, the FCN menu (root, slope, area, extremum), REVIEW displays, the setup for drawing and the plot loops
        INCLUDE "lower/4C082-plot.s"                      * Plotting: plot loops and pixel drawing per plot type, PICTURE scrolling and key handlers, cursor, mark and crosshair drawing
        INCLUDE "lower/4F0AC-plot.s"                      * Plotting: pixel and coordinate conversion, LINE, BOX, GOR, GXOR, REPL, SUB, ARC, grob utilities, line drawing in machine code, plot parameters; complex division
        INCLUDE "lower/52017-flags.s"                     * Complex functions, numerical integration (∫), user and system flags, the flags in the system nibbles, word-size and binary integer arithmetic
        INCLUDE "lower/54000-algebra.s"                   * Binary integer display and conversion, symbolic function dispatch (SYMxxx and Metaxxx), WHERE, derivative steps, IFTE, ∫ and Σ
        INCLUDE "lower/57004-algebra.s"                   * Symbolic algebra: user-function derivatives, ISOL, EXPAN, COLCT, SHOW, QUAD, TAYLR and the RULES menu commands
        INCLUDE "lower/5A01D-algebra.s"                   * Symbolic algebra: the argument forms of ∂, ∫, Σ, | and APPLY, →Q and →Qπ, symbolic integration by patterns, and the RULES transformations
        INCLUDE "lower/5D01D-algebra.s"                   * Symbolic algebra: flattening sums and products for RULES, the meta stack toolkit (psh, top&, larg, ...), operator tests, the rewrite rule interpreter, start of the pattern matcher
        INCLUDE "lower/6001C-rpl-utils.s"                 * End of the pattern matcher (match'), then the RPL utility words: stack shuffles, lams, case and test words, CACHE and DUMP, types, flags
        INCLUDE "lower/63029-rpl-utils.s"                 * RPL utility words, list and string search, built-in integers and dispatch codes, tokens and characters, then the first EquationWriter routines
        INCLUDE "lower/660FC-equationwriter.s"            * EquationWriter: root and sum handlers, size and placement of the box tree, drawing, bracket and bar grobs, RAM accessors, box record fields, work-stack frames, handler tables, start of the expression parser
        INCLUDE "lower/69142-equationwriter.s"            * EquationWriter: expression parser (operators, separators, precedence), the subexpression selection environment and its menu (RULES EDIT EXPR SUB REPL EXIT), rule application, entry points and the main key loop
        INCLUDE "lower/6C186-equationwriter.s"            * EquationWriter: key actions, start-up (local variables and work area), cursor, text input, the rendering handlers of the operators (slot 0 of the command trailers), box building helpers, size-level values
        INCLUDE "lower/6F360-equationwriter.s"            * EquationWriter: stepping back over arguments, cursor movement in the selection environment, highlighting a subexpression, hook tests and key lookup tables; ends with a few plot helpers
        INCLUDE "lower/70039-libraries.s"                 * Odds and ends moved here for space: boot code (#7018C), ROM library table (#702C4), library message pointers, the bank-switch stubs and the access handlers for covered ROM, access pointers and backups in ports, ROMPTR handling
        INCLUDE "lower/73088-libraries.s"                 * PICTURE environment: the menus of the plotter (ZOOM, (X,Y), TRACE, FCN, EDIT, CANCL), and helpers for its cursor modes, trace and coordinate display
        INCLUDE "lower/740E1-messages.s"                  * Message tables of the ROM libraries (MsgTab), then the start of the units table (#75675)
        INCLUDE "lower/760C9-hash.s"                      * End of the units table, hash tables of libraries 700 and 002, then, from #77E62, the probability functions UTPN, UTPF and UTPT (continued in the next file)
        INCLUDE "lower/78002-numerics.s"                  * Numerics at 15 digits: the UTPC/UTPF/UTPT and UTPN series, the 21-nibble temporaries in IRAMBUFF, then the core transcendental routines in machine code: FP, MOD, factorial, COMB, PERM, LN, EXP, y^x, SIN, COS, TAN, their inverses and the hyperbolics; at the end hex-to-BCD conversion and the copying of font glyphs for the display
        INCLUDE "lower/7A2B3-fonts.s"                     * System fonts (10-row, 8-row, minifont) and the minifont remap table
        INCLUDE "lower/7C855-array-primitives.s"          * Array primitives in machine code and RPL (inner products in 15 digits, LU decomposition and solving, conversion between real and extended arrays, norms), the TVM variable names and the TVM solver's numeric helpers, then pointers to the symbolic rules: derivatives (D/D...), integrals, WHERE, and the rule tables' ROMPTRs
        INCLUDE "lower/7E001-version.s"                   * Fill and version strings
        INCLUDE "upper/80000-selftest.s"                  * Self-test (ON+D): a menu of hardware tests with their messages, run before RAM is set up; the screens of memory recovery
        INCLUDE "upper/82007-lib0F0.s"                    * Library 0F0: integral pattern tables per function, and the bodies of the rewrite rules (RULES menu)
        INCLUDE "upper/8501B-lib0F0.s"                    * Library 0F0: WHERE handlers, port object access, argument builders, derivative rules, rule menus and ISOL inverses
        INCLUDE "upper/86FE4-lib0C0.s"                    * Library 0C0: polynomial root finder for PROOT, in machine code, with one copy for complex and one for real coefficients
        INCLUDE "upper/8998E-lib0F1.s"                    * Library 0F1: drawing of WIREFRAME, GRIDMAP, PARSURFACE, YSLICE, SLOPEFIELD and PCONTOUR plots, VPAR reading, trace input and output tags, then the FUNCTION and CONIC plot types
        INCLUDE "upper/8C9F6-lib0F1.s"                    * Library 0F1: the POLAR, PARAMETRIC, TRUTH, SCATTER, HISTOGRAM and BAR plot types, PPAR checks and the plot environment's exit code
        INCLUDE "upper/8D27C-lib0EA.s"                    * Library 0EA: the MatrixWriter: key handling, cell display, scrolling, the EDIT, GO, +ROW, -ROW, +COL, -COL and WID menu keys; then PINIT
        INCLUDE "upper/90000-lib0C2.s"                    * Library 0C2: eigenvalues: EGV, EGVL, SCHUR and SRAD, Householder reduction to Hessenberg form, QR iteration for real and complex matrices, and eigenvector back-substitution
        INCLUDE "upper/93079-lib0C2.s"                    * Library 0C2: balancing, QR and LQ factoring, LSQ, the SVD's bidiagonal reduction and iteration, SNRM, RANK, SVL and SVD
        INCLUDE "upper/96268-lib0C2.s"                    * Library 0C2: SVD steps, TRACE, COND, LU, DET, matrix division and inverse, RREF
        INCLUDE "upper/98E02-lib0E6.s"                    * Library 0E6: TVM messages, TVM variables and menu support, AMORT and the five TVM solvers in machine code
        INCLUDE "upper/99FE9-lib0E3.s"                    * Library 0E3: the Equation Library browser: its locals, subject and title screens, menus, starting the solver, and the equation viewer
        INCLUDE "upper/9CFFD-lib0E3.s"                    * Library 0E3: the Equation Library's picture viewer, ~PCunpack, SOLVEQN and the library's messages
        INCLUDE "upper/9DA13-lib0E4.s"                    * Library 0E4: the Multiple-Equation Solver: the Mpar variable, the solver menu, solving by chaining single equations, the results browser, and the user commands
        INCLUDE "upper/A07E9-lib0E1.s"                    * Library 0E1: the Constants Library: browser, tables of 39 constants, and CONST
        INCLUDE "upper/A2437-lib0B4.s"                    * Library 0B4: the Solve applications (equation, differential equation, polynomial, linear system, TVM and amortization) and the start of Plot
        INCLUDE "upper/A54DB-lib0B4.s"                    * Library 0B4: the Plot form for each plot type, its keys and fields, and the options forms for 2D plots
        INCLUDE "upper/A8521-lib0B4.s"                    * Library 0B4: Plot options for 2D plots, Zoom Factors, plot type handling and reset, and the forms for 3D plots
        INCLUDE "upper/AB534-lib0B4.s"                    * Library 0B4: end of the 3D plot options, the Symbolic applications, and setting alarms and the time and date
        INCLUDE "upper/AE566-lib0B4.s"                    * Library 0B4: the alarm browser, the Statistics applications, and I/O (send, print, transfer)
        INCLUDE "upper/B1606-lib0B4.s"                    * Library 0B4: end of Transfer, Calculator Modes, the system flag browser, the Memory variable browser, and the library's hash and link tables
        INCLUDE "upper/B4B32-lib0B4.s"                    * End of library 0B4's link table; the length field in front of library 0B5
        INCLUDE "upper/B4B39-lib0B5.s"                    * Form data, part 1: Solve, TVM, plot parameters and PPAR fields, VPAR, Symbolic forms, Time and Alarm items
        INCLUDE "upper/B7B7D-lib0B5.s"                    * Form data, part 2: alarm browser, Statistics, I/O and Kermit, Modes, Flags browser, Var browser; library tables
        INCLUDE "upper/BA576-lib0B3.s"                    * Library 0B3: the Choose box: POL, keys, scrolling, messages, drawing and the pre-drawn frames
        INCLUDE "upper/BD8E9-lib0B3.s"                    * Library 0B3: the last pre-drawn frames, the CHOOSE command's body, and the hash and link tables
        INCLUDE "upper/C0000-lib0AB.s"                    * 48G user commands (3D plot setup, ANIMATE, matrix, list, TVM, INFORM, ...) with their dispatch tables, then hash and link tables
        INCLUDE "upper/C31BE-lib0AB.s"                    * End of library 0AB, and the start of the block holding 0A9, 0AA and 0A8
        INCLUDE "upper/C31C5-lib0A9.s"                    * Menus by MENU number, mostly as arrays of ROMPTR keys
        INCLUDE "upper/C4E26-lib0AA.s"                    * Key lists of the PLOT, STAT and I/O menus
        INCLUDE "upper/C5332-lib0A8.s"                    * Soft-key definitions of the built-in menus
        INCLUDE "upper/C78DB-lib0C1.s"                    * Diff Eq plotting, Runge-Kutta-Fehlberg steps for scalars and vectors, adaptive step control and Rosenbrock steps
        INCLUDE "upper/CA95B-lib0C1.s"                    * RRK command, argument check for the Rosenbrock commands, angle factors for units, library tables
        INCLUDE "upper/CADC4-lib0C4.s"                    * FFT and IFFT in machine code, then NDIST, the population statistics, PCOEF and PEVAL
        INCLUDE "upper/CBACE-lib0C3.s"                    * Row and column operations on arrays: the RPL commands, then row delete, row insert and row copy in machine code
        INCLUDE "upper/CCA9F-lib0E7.s"                    * ZFACTOR, FANNING, DARCY, F0λ, SIDENS, TDELTA and TINC, shared argument errors, then MINEHUNT with its messages and pictures
        INCLUDE "upper/CF380-lib0E0.s"                    * The browser: stores and recalls for its 16 locals, key handlers, list movement, search by letter, and drawing of rows, scroll arrows and the view of a long item
        INCLUDE "upper/D1362-lib0E8.s"                    * List commands, SUB and REPL on arrays, TEACH and its example programs and plots, ATICK, and Xmodem in machine code
        INCLUDE "upper/D4806-lib0E8.s"                    * Hash and link tables of library 0E8
        INCLUDE "upper/D49CE-lib0B0.s"                    * Input forms: error handling, menus, redisplay, then one routine for each message with its default action, and the key tables
        INCLUDE "upper/D79FD-lib0B0.s"                    * Input forms: field movement, decompiling a value, pictures, alerts, validation, and access to the locals of labels and fields
        INCLUDE "upper/D9A51-lib0B2.s"                    * CMD, the CHARS form with its keys and menu, pictures of the character pages and the table of key sequences
        INCLUDE "upper/DCA82-lib0B2.s"                    * Hash and link tables of library 0B2
        INCLUDE "upper/DCB83-lib0B1.s"                    * Message box, the outer loop that lets the user work on the stack from a form, and INFORM
        INCLUDE "upper/DE45F-lib0BF.s"                    * Message table of the SOLVE applications
        INCLUDE "upper/DF08C-lib0BE.s"                    * Message table of the PLOT applications, as a linked array of strings
        INCLUDE "upper/E04FF-lib0BD.s"                    * Message table of the SYMBOLIC applications
        INCLUDE "upper/E0AFF-lib0BC.s"                    * Message table of the TIME applications
        INCLUDE "upper/E114B-lib0BB.s"                    * Message table of the STAT applications
        INCLUDE "upper/E1A57-lib0BA.s"                    * Message table of the I/O applications
        INCLUDE "upper/E228B-lib0B9.s"                    * Message table of the input forms and of MODES, with the descriptions of the system flags
        INCLUDE "upper/E384B-lib0E2.s"                    * Library header, subject names, text tables for Columns and Beams to Gases
        INCLUDE "upper/E6DA5-lib0E2.s"                    * Equation Library text tables for Heat Transfer to Stress Analysis
        INCLUDE "upper/E9E0F-lib0E2.s"                    * Equation Library text table for Waves, tables of units, and the equations of Columns and Beams and Electricity
        INCLUDE "upper/EDBBA-lib0E2.s"                    * Equation Library: equations of Fluids to Motion
        INCLUDE "upper/F0DC0-lib0E2.s"                    * Equation Library: equations of Optics to Stress Analysis
        INCLUDE "upper/F3F3C-lib0E2.s"                    * Equation Library: equations of Waves, shared variable lists, the names of all variables, first pictures
        INCLUDE "upper/F6FB8-lib0E2.s"                    * Equation Library: pictures for Electricity to Magnetism
        INCLUDE "upper/FA04D-lib0E2.s"                    * Equation Library: pictures for Magnetism to Plane Geometry
        INCLUDE "upper/FD2DB-lib0E2.s"                    * Equation Library: pictures for Solid Geometry and Stress Analysis, the end of the ROM
