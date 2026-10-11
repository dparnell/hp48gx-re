# Known bugs in ROM revision R

These are the bugs that the HP 48 FAQ lists as present in revision R
([section 3.5](https://www.hpcalc.org/hp48/docs/faq/48faq-3.html), with
details in [appendix C](https://www.hpcalc.org/hp48/docs/faq/48faq-11.html)).
Each entry says whether the bug reproduces in this repository's emulator and
where it is in `firmware/`. Addresses are those of the original ROM, as in the
source's address comments.

`knownbugs` checks a ROM image for the bugs it can reproduce:

```
python tools/build.py
cargo run --release -p hp48 --example knownbugs -- out/rom.bin      # all checks
cargo run --release -p hp48 --example knownbugs -- out/rom.bin dtag # one check
```

Each check prints PRESENT, fixed or unknown. The exit status is 1 while any
bug is present.

`firmware/` deliberately keeps these bugs, so it still builds the original ROM.
They are to be fixed in the emulator's native (Rust) replacements of the
routines involved, as those are written.

| Check | Bug | Reproduces here |
|---|---|---|
| `dtag` | DTAG with an empty stack reports "XLIB 0 0 Error" | yes |
| `rpm` | rpm → r/s depends on the angle mode | yes |
| `hz` | r/s + Hz depends on the angle mode | yes |
| `eqlib` | MUSER with flag 63 set, then DROP, clears memory | yes |
| `mw` | MatrixWriter: turning GO→ off and on breaks the row | yes |
| `fft` | Repeated FFT on a matrix loses memory | not yet |
| — | `{ port dir … var }` RCL/EVAL fails for port ≥ 2 | no port-2 cards in the emulator |

## DTAG reports "XLIB 0 0 Error" (`dtag`)

**Reproduce:** `CLEAR DTAG`. The calculator shows "XLIB 0 0 Error: Too Few
Arguments" instead of "DTAG Error: Too Few Arguments".

**Cause:** `xDTAG` (`lower/22005-programs.s`, #22633) is `:: OBJ_214FB ;`, and
`OBJ_214FB` (`lower/1F01F-user-commands.s`, #214FB) is `:: CK1 STRIPTAGS ;`.
`CK1` checks the arguments and records the program it is running in
(`LASTROMWDOB`, #807D9). Errors are reported under the command whose header
(library and command number) precedes that program. `OBJ_214FB` has no
header, so the error names "XLIB 0 0".

**Fix (tested):** move the check into the command. After this change, `knownbugs` reports `dtag` fixed and the calculator shows "DTAG Error". `OBJ_214FB` has no other users, so it can be removed.

```
xDTAG:
        ::
          CK1
          STRIPTAGS
        ;
```

## Rotation rates depend on the angle mode (`rpm`, `hz`)

**Reproduce:**
- `RAD 60_rpm 1_r 1_s / CONVERT` gives `1_r/s`, but 60 rpm is 2π r/s.
- In DEG mode it gives 0.01745 r/s.
- `DEG 6.2832_r 1_s / 1_Hz +` gives 361 Hz instead of 2 Hz.

**Cause (from the FAQ, consistent with the tables):**
- Conversions go through base units. On the G/GX, the base unit for angles is
  the current angle mode, so a revolution's worth of angle is not fixed.
- In the units table (`lower/740E1-messages.s`), the angle units `U.r` and `U.°` carry the angle
  dimension through the array #384D0.
- `U.Hz` (#75868) has dimension 1/s and no angle. So does `rpm`, which is
  defined in library 0AB (`upper/C0000-lib0AB.s`, `rpm:` #C24DF) as `1_1/min`.
- A conversion between rotation rates (rpm, Hz) and angular rates (r/s, °/s) must therefore
  invent the angle from the mode.

**Where to start:**
- The unit records above.
- The conversion code that reads them: `#0C3A3` reads a unit's definition, and the
  `units`/`units-grob` files hold the arithmetic.

The FAQ's workaround defines rpm with an explicit angle (`6_°/s`, in DEG mode). A fix
needs to decide what Hz and rpm should mean when an angle is involved.

## Equation Library solver: MUSER with flag 63 clears memory (`eqlib`)

**Reproduce:**
1. `CLEAR 63 CF`.
2. EQ LIB (right-shift 3), ↓, ENTER, ↓, SOLV (first menu key), NXT.
3. `63 SF`.
4. Right-shift MUSER (first menu key).
5. `DROP`.

The calculator then shows "Try To Recover Memory?".

**What happens (traced in the emulator):**
1. `SAVESTACK` (`lower/6001C-rpl-utils.s`, #61D41) saves the stack for undo.
   It counts the levels as (end of stack − stack pointer) / 5 − 1, at #61D67.
2. Here the stack pointer equals the end of the stack, one level below empty,
   so the count is −1 (#FFFFF).
3. The copy loop at #61E83 runs off the end of RAM. D1 wraps to the I/O registers.
4. The write at #61E86 hits the card control register (#0010E) and sets
   "module pulled".
5. The next interrupt sees MP set (#0016D) and warmstarts.

What drops the extra level is not traced yet. Flag 63 is vectored ENTER, so
the command line is executed differently while it is set. That path, MUSER
(in the Multiple Equation Solver's library in upper ROM) and the `DROP` are
the places to look.

## MatrixWriter: GO→ off and on breaks the row (`mw`)

**Reproduce:**
1. Open the MatrixWriter (right-shift ENTER). GO→ is active.
2. `1 ENTER`.
3. Press GO→ twice, turning it off and on again.
4. `2 ENTER 3 ENTER`.

3 goes to row 2, and the result is a 2×2 matrix. Without the GO→ presses, the
result is `[1 2 3]`.

**Where to look:** the MatrixWriter is in the upper-ROM libraries. Toggling GO→
seems to fix the row width at the current column; the code is not located yet.

## FFT on a matrix can lose memory (`fft`)

**Report:** repeated FFT or IFFT on a matrix with more than one row and column
can lose memory. The FAQ blames a return stack overflow during an interrupt.
Vectors are not affected.

**In the emulator:**
- 3000 FFTs of `[[1 2][3 4]]` ran without memory loss.
- FFT does run with all 8 return stack levels in use. Entries are pushed off
  the bottom several times per FFT, for example at #79802, #79D58 and #7A221.
  A badly timed interrupt there would lose a return address.
- The emulator raises interrupts at instruction boundaries on its own
  schedule, which may not match the hardware's timing.

## `{ port dir … var }` RCL/EVAL fails for port ≥ 2

**Report:** RCL or EVAL of a tagged port path fails when the port number is 2
or more. Ports 2 and up are the banks of a RAM card in slot 2. The emulator
has no slot-2 card, so this cannot be checked here.

## Not bugs in revision R

- `"X" TAIL` gave Invalid Dimension in revision M. In R it returns `""`.
- The EquationWriter showing an EQ library equation's name next to an
  unrelated algebraic is listed for revisions M and P. It does not happen in R:
  following the FAQ's steps shows only the algebraic.
