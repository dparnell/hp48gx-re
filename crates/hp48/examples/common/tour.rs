//! The tour of calculator features shared by examples/execmap.rs (which
//! records what the ROM executes), examples/lockstep.rs (which runs it on
//! an original and a relocated ROM side by side) and examples/coverage.rs
//! (which measures how much of it the natives cover).
use hp48::Key;

/// Command lines typed after boot; each is followed by ENTER, two seconds,
/// and ON (to leave graphics or clear an error).
pub const TOUR: &[&str] = &[
    "1 2 + 3 * 7 / 2 ^ 1 - ABS LN EXP",
    "RAD 1 SIN COS TAN ASIN ACOS ATAN DEG 30 SIN",
    "\"HELLO\" \"WORLD\" + SIZE",
    "{ 1 2 3 } { 4 5 } + REVLIST SORT 2 GET",
    "[[1 2][3 4]] DUP INV * DET",
    "[[1 2][3 4]] TRN [1 2] *",
    "(1,2) (3,4) * ABS",
    "1_m 1_ft + 1_in CONVERT",
    "« 1 5 FOR I I NEXT » EVAL",
    "'A' 5 STO A 'A' PURGE",
    "12 FACT 5 3 COMB",
    "#FFh #10h AND R→B B→R",
    "'X^2+3*X' 'X' 2 TAYLR",
    "'2*X+3=7' 'X' ISOL",
    "MEM VARS TIME DATE",
    "1 0 /",
    "CLEAR 'SIN(X)' STEQ RAD FUNCTION ERASE DRAW",
    "CLEAR '2*COS(2*X)' STEQ POLAR ERASE DRAW",
    "CLEAR 1.5 2.5 3.5 →LIST →STR STR→",
    "CLEAR 2 3 4 5 →ARRY RANM",
    "CLEAR 5 RAND DROP 2 3 RND",
    // numbers and modes
    "CLEAR 7 3 MOD 7.5 IP 7.5 FP 2.5 FLOOR 2.5 CEIL 3.14159 2 TRNC 10 3 PERM 27 3 XROOT",
    "CLEAR 8 LOG 2 ALOG 0.1 LNP1 0.1 EXPM 2 SQ 1 SINH 1 COSH 1 TANH 0.5 ASINH 2 ACOSH 0.5 ATANH",
    "CLEAR 3 FIX 1.23456 2 SCI 1 ENG STD 30 →RAD 1 R→D 1.5 →HMS 1.3 HMS→ 1.3 2.4 HMS+",
    "CLEAR 5 2 MAX 5 2 MIN 1.5 MANT 1500 XPON -3 SIGN 7 INV",
    "CLEAR MAXR MINR 1 2 3 DROP2 1 2 SWAP OVER DUP2 ROT 3 PICK 2 ROLL 2 ROLLD DEPTH DROPN",
    // strings and lists
    "CLEAR \"ABCDEF\" 2 4 SUB \"ABC\" \"B\" POS \"ABC\" NUM 65 CHR \"HELLO\" 2 \"J\" REPL",
    "CLEAR \"1 2 +\" STR→ 123 →STR SIZE \"abc\" HEAD \"abc\" TAIL",
    "CLEAR { 1 2 3 } « 2 * » DOLIST { 1 2 3 4 } « + » STREAM { 1 2 3 } 1 2 SUB 'X^2' 'X' 1 5 1 SEQ",
    "CLEAR { 3 1 2 } SORT { 1 2 3 } { 4 5 6 } ADD { 1 2 } 2 + { 5 6 7 } 2 9 PUT 1 2 2 →LIST LIST→",
    "CLEAR { 1 2 3 4 } 2 « + » DOSUBS { 1 2 3 } HEAD { 1 2 3 } TAIL { 1 2 3 } REVLIST",
    // binary integers, complex numbers
    "CLEAR HEX #1234h #FFh + 16 STWS #F0h SL RR ASR NOT #Fh #3h OR #Fh #3h XOR DEC #255d B→R RCWS",
    "CLEAR (3,4) ARG (1,2) C→R 1 2 R→C (1,2) CONJ (1,2) SQ (1,1) LN (1,1) SIN (0,1) EXP",
    "CLEAR CYLIN (1,1) RECT (2,3) 2 * (1,1) /",
    // matrices and vectors
    "CLEAR [[1 2][3 4]] RREF [[2 1][1 3]] EGV [[1 2][3 4]] LU [1 2 3] [4 5 6] CROSS [1 2 3] [4 5 6] DOT",
    "CLEAR [[4 1][1 3]] SVD [[1 2][3 4]] QR [[1 2][3 4]] RANK [[1 2][3 4]] TRACE 3 IDN [[1 2][3 4]] CNRM",
    "CLEAR [[1 2][3 4]] { 2 2 } RDM [[1 2][3 4]] 1 COL- [[1 2][3 4]] 1 ROW- [1 2 3] ABS [3 4] 2 GET",
    "CLEAR [[2 1][1 3]] [5 10] SWAP / [1 2 3] V→ 1 2 3 →V3 { 2 2 } 3 CON",
    // units
    "CLEAR 1_km UBASE 1_N UBASE 1_J 1_s / 1_W CONVERT 1_ft UVAL 2_m 3_m * 1_m^2 UFACT",
    "CLEAR 1_m 2_s / 3_s * 100_°C 1_K + 1_m 2 ^",
    // symbolic algebra
    "CLEAR '(X+1)^2' EXPAN 'X+X+2*X' COLCT 'X^2-4' 'X' QUAD 'A=B+C' 'B' ISOL 'SIN(X)' 'X' 3 TAYLR",
    "CLEAR 'X^2-2' 'X' 1 ROOT 'X^3-X' 'X' 0.5 ROOT '2*X+1' →NUM 'F(X)=X^2' DEFINE 3 F",
    "CLEAR 'X^2' SHOW 'X*(1+X)' EXPAN",
    // program structures, local variables, errors
    "CLEAR « → A B « A B + A B * » » 2 3 ROT EVAL",
    "CLEAR « 1 10 START 1 NEXT » EVAL « 5 WHILE DUP REPEAT 1 - END » EVAL « 0 DO 1 + UNTIL DUP 3 > END » EVAL",
    "CLEAR « IFERR 1 0 / THEN ERRM ERRN END » EVAL « 2 CASE DUP 1 == THEN 10 END DUP 2 == THEN 20 END 30 END » EVAL",
    "CLEAR « 1 IF 1 THEN 2 ELSE 3 END » EVAL « 10 1 FOR K K STEP » EVAL 1 2 « + » EVAL",
    "CLEAR 5 'A' STO 2 'A' STO+ 3 'A' STO* 'A' INCR 'A' DECR A 'A' PURGE",
    // directories and memory
    "CLEAR 'DD' CRDIR DD 7 'Q' STO Q VARS UPDIR 'DD' PGDIR HOME PATH MEM BYTES",
    "CLEAR -40 SF -40 CF 1 SF 1 CF RCLF STOF",
    // time
    "CLEAR TICKS DATE TIME TSTR 12.31 1 DATE+ 1.01 2.01 DDAYS",
    // graphics
    "CLEAR ERASE (0,0) (1,1) LINE (0,0) PIXON (0,0) (2,2) BOX (0,0) 1 0 3 ARC PICT RCL",
    "CLEAR \"AB\" 1 →GROB #20d #10d BLANK →LCD LCD→ SIZE",
    // more plot types
    "CLEAR 'SIN(T)+i*COS(T)' STEQ PARAMETRIC ERASE DRAW",
    "CLEAR 'X^2+Y^2-4' STEQ CONIC ERASE DRAW",
    "CLEAR 'X>Y' STEQ TRUTH ERASE DRAW",
    "CLEAR 'X+Y' STEQ SLOPEFIELD ERASE DRAW",
    "CLEAR 'X*Y' STEQ WIREFRAME ERASE DRAW",
    // statistics
    // an undefined name evaluates to itself, so this makes 'ΣDAT' (Σ has no key)
    "CLEAR [[1 2][3 5][5 6][7 9]] 133 CHR \"DAT\" + STR→ STO MEAN SDEV TOT VAR CORR COV LR",
    "CLEAR SCATTER ERASE DRAW",
    "CLEAR BAR ERASE DRAW",
    "CLEAR 1 2 3 3 →LIST VERSION MINEHUNT",
    // every unit in the units table (#75675) that can be typed
    "CLEAR 1_m UBASE 1_l UBASE 1_g UBASE 1_s UBASE 1_N UBASE 1_J UBASE 1_W UBASE 1_A UBASE 1_C UBASE 1_T UBASE 1_H UBASE 1_V UBASE",
    "CLEAR 1_S UBASE 1_F UBASE 1_r UBASE 1_a UBASE 1_° UBASE 1_P UBASE 1_R UBASE 1_h UBASE 1_d UBASE 1_b UBASE 1_t UBASE 1_u UBASE",
    "CLEAR 1_c UBASE 1_K UBASE 1_Hz UBASE 1_Pa UBASE 1_Wb UBASE 1_lb UBASE 1_in UBASE 1_ft UBASE 1_st UBASE 1_Bq UBASE 1_Ci UBASE 1_ga UBASE",
    "CLEAR 1_gf UBASE 1_St UBASE 1_Gy UBASE 1_Sv UBASE 1_eV UBASE 1_cd UBASE 1_sr UBASE 1_mi UBASE 1_yr UBASE 1_pc UBASE 1_qt UBASE 1_oz UBASE",
    "CLEAR 1_yd UBASE 1_pt UBASE 1_°C UBASE 1_°F UBASE 1_°R UBASE 1_lm UBASE 1_sb UBASE 1_cu UBASE 1_rd UBASE 1_lx UBASE 1_ct UBASE 1_bu UBASE",
    "CLEAR 1_pk UBASE 1_hp UBASE 1_ph UBASE 1_au UBASE 1_fc UBASE 1_dyn UBASE 1_erg UBASE 1_bar UBASE 1_mho UBASE 1_cal UBASE 1_fbm UBASE 1_rad UBASE",
    "CLEAR 1_rem UBASE 1_Fdy UBASE 1_mol UBASE 1_gal UBASE 1_tsp UBASE 1_lbt UBASE 1_ozt UBASE 1_min UBASE 1_mph UBASE 1_kph UBASE 1_atm UBASE 1_mil UBASE",
    "CLEAR 1_lyr UBASE 1_nmi UBASE 1_Btu UBASE 1_bbl UBASE 1_ton UBASE 1_lbf UBASE 1_kip UBASE 1_pdl UBASE 1_psi UBASE 1_lam UBASE 1_acre UBASE 1_ozfl UBASE",
    "CLEAR 1_tbsp UBASE 1_inHg UBASE 1_mmHg UBASE 1_torr UBASE 1_grad UBASE 1_ftUS UBASE 1_miUS UBASE 1_fath UBASE 1_ozUK UBASE 1_knot UBASE 1_flam UBASE 1_slug UBASE",
    "CLEAR 1_arcs UBASE 1_galC UBASE 1_galUK UBASE 1_tonUK UBASE 1_chain UBASE 1_therm UBASE 1_inH2O UBASE 1_fermi UBASE 1_grain UBASE 1_arcmin UBASE",
];

/// Keys pressed on their own (menus and shifts), each followed by a second.
pub const KEYS: &[Key] = &[
    Key::Mth, Key::Nxt, Key::Nxt, Key::Prg, Key::Nxt, Key::Cst, Key::Var, Key::A, Key::On,
    Key::LeftShift, Key::Mth, Key::RightShift, Key::Prg, Key::On,
];
