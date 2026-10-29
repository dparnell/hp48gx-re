* HP 48GX ROM revision R, #760C9-#78001: Hash table of library 002
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #760C9 in the original ROM).
        ENDLENGTH                                * 760C9

* refs (1): 0C2C2
OBJ_760C9:
        CON(5)  DOHSTR                           * 760C9  DOHSTR
        LENGTH                                   * 760CE  length, to #7612D
        NIBHEX  51D679B6305B49D4603689E619749086 * 760D3  .mρk.µηM.cσnγG.h
        NIBHEX  20469944104521078805516658548116 * 760F3  .dτD.T.p∂P.fΣE.a
        NIBHEX  28B4308420A512A79795429767       * 76113  ∇K.H.Z!zyY$yv
        ENDLENGTH                                * 7612D

L_7612D:
        CON(5)  DOHSTR                           * 7612D  hash table of library 700
* a branch also enters #76132, where the nibbles decode as addrslot
        LENGTH                                   * 76132  length, to #7633B
        REL(5)  H700.'                           * 76137  names of length 1
        REL(5)  H700.C$                          * 7613C  names of length 2
        REL(5)  H700.DIR                         * 76141  names of length 3
        REL(5)  H700.CASE                        * 76146  names of length 4
        REL(5)  H700.IFERR                       * 7614B  names of length 5
        REL(5)  H700.PROMPT                      * 76150  names of length 6
        CON(5)  0                                * 76155  names of length 7
        CON(5)  0                                * 7615A  names of length 8
        CON(5)  0                                * 7615F  names of length 9
        CON(5)  0                                * 76164  names of length 10
        CON(5)  0                                * 76169  names of length 11
        CON(5)  0                                * 7616E  names of length 12
        CON(5)  0                                * 76173  names of length 13
        CON(5)  0                                * 76178  names of length 14
        CON(5)  0                                * 7617D  names of length 15
        CON(5)  0                                * 76182  names of length 16
        REL(5)  L_762AA                          * 76187  end of the names
H700.':
        CON(2)  1                                * 7618C
        NIBASC  "'"                              * 7618E
        CON(3)  #014                             * 76190  command
H700.→:
        CON(2)  1                                * 76193
        NIBASC  "→"                              * 76195
        CON(3)  #004                             * 76197  command
H700.«:
        CON(2)  1                                * 7619A
        NIBASC  "«"                              * 7619C
        CON(3)  #012                             * 7619E  command
H700.»:
        CON(2)  1                                * 761A1
        NIBASC  "»"                              * 761A3
        CON(3)  #011                             * 761A5  command
H700.C$:
        CON(2)  2                                * 761A8
        NIBASC  "C$"                             * 761AA
        CON(3)  #01B                             * 761AE  command
H700.DO:
        CON(2)  2                                * 761B1
        NIBASC  "DO"                             * 761B3
        CON(3)  #007                             * 761B7  command
H700.IF:
        CON(2)  2                                * 761BA
        NIBASC  "IF"                             * 761BC
        CON(3)  #000                             * 761C0  command
H700.DIR:
        CON(2)  3                                * 761C3
* a branch also enters #761C5, where the nibbles decode as addrslot
        NIBASC  "DIR"                            * 761C5
        CON(3)  #01B                             * 761CB  command
H700.END:
        CON(2)  3                                * 761CE
* a branch also enters #761D0, where the nibbles decode as addrslot
        NIBASC  "END"                            * 761D0
        CON(3)  #003                             * 761D6  command
H700.FOR:
        CON(2)  3                                * 761D9
* a branch also enters #761DB, where the nibbles decode as addrslot
        NIBASC  "FOR"                            * 761DB
        CON(3)  #00A                             * 761E1  command
H700.CASE:
        CON(2)  4                                * 761E4
* a branch also enters #761E6, where the nibbles decode as addrslot
        NIBASC  "CASE"                           * 761E6
        CON(3)  #019                             * 761EE  command
H700.ELSE:
        CON(2)  4                                * 761F1
* a branch also enters #761F3, where the nibbles decode as addrslot
        NIBASC  "ELSE"                           * 761F3
        CON(3)  #002                             * 761FB  command
        CON(2)  4                                * 761FE
* a branch also enters #76200, where the nibbles decode as addrslot
        NIBASC  "GROB"                           * 76200
        CON(3)  #01B                             * 76208  command
H700.HALT:
        CON(2)  4                                * 7620B
* a branch also enters #7620D, where the nibbles decode as addrslot
        NIBASC  "HALT"                           * 7620D
        CON(3)  #00E                             * 76215  command
H700.NEXT:
        CON(2)  4                                * 76218
        NIBASC  "NEXT"                           * 7621A
        CON(3)  #00B                             * 76222  command
H700.STEP:
        CON(2)  4                                * 76225
* a branch also enters #76227, where the nibbles decode as addrslot
        NIBASC  "STEP"                           * 76227
        CON(3)  #00C                             * 7622F  command
H700.THEN:
        CON(2)  4                                * 76232
* a branch also enters #76234, where the nibbles decode as addrslot
        NIBASC  "THEN"                           * 76234
        CON(3)  #001                             * 7623C  command
        CON(2)  4                                * 7623F
        NIBASC  "XLIB"                           * 76241
        CON(3)  #01B                             * 76249  command
H700.IFERR:
        CON(2)  5                                * 7624C
* a branch also enters #7624E, where the nibbles decode as addrslot
        NIBASC  "IFERR"                          * 7624E
        CON(3)  #00D                             * 76258  command
H700.START:
        CON(2)  5                                * 7625B
* a branch also enters #7625D, where the nibbles decode as addrslot
        NIBASC  "START"                          * 7625D
        CON(3)  #009                             * 76267  command
H700.UNTIL:
        CON(2)  5                                * 7626A
* a branch also enters #7626C, where the nibbles decode as addrslot
        NIBASC  "UNTIL"                          * 7626C
        CON(3)  #008                             * 76276  command
H700.WHILE:
        CON(2)  5                                * 76279
        NIBASC  "WHILE"                          * 7627B
        CON(3)  #005                             * 76285  command
H700.PROMPT:
        CON(2)  6                                * 76288
        NIBASC  "PROMPT"                         * 7628A
        CON(3)  #01C                             * 76296  command
H700.REPEAT:
        CON(2)  6                                * 76299
        NIBASC  "REPEAT"                         * 7629B
        CON(3)  #006                             * 762A7  command
L_762AA:
        CON(5)  (*)-H700.IF                      * 762AA  name of command 000
        CON(5)  (*)-H700.THEN                    * 762AF  name of command 001
        CON(5)  (*)-H700.ELSE                    * 762B4  name of command 002
        CON(5)  (*)-H700.END                     * 762B9  name of command 003
        CON(5)  (*)-H700.→                       * 762BE  name of command 004
        CON(5)  (*)-H700.WHILE                   * 762C3  name of command 005
        CON(5)  (*)-H700.REPEAT                  * 762C8  name of command 006
        CON(5)  (*)-H700.DO                      * 762CD  name of command 007
        CON(5)  (*)-H700.UNTIL                   * 762D2  name of command 008
        CON(5)  (*)-H700.START                   * 762D7  name of command 009
        CON(5)  (*)-H700.FOR                     * 762DC  name of command 00A
        CON(5)  (*)-H700.NEXT                    * 762E1  name of command 00B
        CON(5)  (*)-H700.STEP                    * 762E6  name of command 00C
        CON(5)  (*)-H700.IFERR                   * 762EB  name of command 00D
        CON(5)  (*)-H700.HALT                    * 762F0  name of command 00E
        CON(5)  0                                * 762F5  command 00F has no name
        CON(5)  (*)-H700.→                       * 762FA  name of command 010
        CON(5)  (*)-H700.»                       * 762FF  name of command 011
* a branch also enters #76304, where the nibbles decode as addrslot
        CON(5)  (*)-H700.«                       * 76304  name of command 012
* a branch also enters #76309, where the nibbles decode as addrslot
        CON(5)  (*)-H700.»                       * 76309  name of command 013
        CON(5)  (*)-H700.'                       * 7630E  name of command 014
        CON(5)  (*)-H700.'                       * 76313  name of command 015
        CON(5)  (*)-H700.END                     * 76318  name of command 016
        CON(5)  (*)-H700.END                     * 7631D  name of command 017
        CON(5)  (*)-H700.THEN                    * 76322  name of command 018
        CON(5)  (*)-H700.CASE                    * 76327  name of command 019
        CON(5)  (*)-H700.THEN                    * 7632C  name of command 01A
        CON(5)  (*)-H700.DIR                     * 76331  name of command 01B
        CON(5)  (*)-H700.PROMPT                  * 76336  name of command 01C
        ENDLENGTH                                * 7633B

L_7633B:
        CON(5)  DOHSTR                           * 7633B  hash table of library 002
* a branch also enters #76340, where the nibbles decode as addrslot
        LENGTH                                   * 76340  length, to #77E62
        REL(5)  H002.%                           * 76345  names of length 1
        REL(5)  H002.%T                          * 7634A  names of length 2
* a branch also enters #7634F, where the nibbles decode as addrslot
        REL(5)  H002.%CH                         * 7634F  names of length 3
* a branch also enters #76354, where the nibbles decode as addrslot
        REL(5)  H002.ACOS                        * 76354  names of length 4
* a branch also enters #76359, where the nibbles decode as addrslot
        REL(5)  H002.ACOSH                       * 76359  names of length 5
* a branch also enters #7635E, where the nibbles decode as addrslot
        REL(5)  H002.ACKALL                      * 7635E  names of length 6
        REL(5)  H002.ARCHIVE                     * 76363  names of length 7
* a branch also enters #76368, where the nibbles decode as addrslot
        REL(5)  H002.DELALARM                    * 76368  names of length 8
* a branch also enters #7636D, where the nibbles decode as addrslot
        REL(5)  H002.FINDALARM                   * 7636D  names of length 9
        REL(5)  H002.PARAMETRIC                  * 76372  names of length 10
        CON(5)  0                                * 76377  names of length 11
        CON(5)  0                                * 7637C  names of length 12
        CON(5)  0                                * 76381  names of length 13
        CON(5)  0                                * 76386  names of length 14
        CON(5)  0                                * 7638B  names of length 15
        CON(5)  0                                * 76390  names of length 16
        REL(5)  L_776DD                          * 76395  end of the names
H002.%:
        CON(2)  1                                * 7639A
        NIBASC  "%"                              * 7639C
        CON(3)  #07C                             * 7639E  command
H002.*:
        CON(2)  1                                * 763A1
        NIBASC  "*"                              * 763A3
        CON(3)  #047                             * 763A5  command
H002.+:
        CON(2)  1                                * 763A8
        NIBASC  "+"                              * 763AA
        CON(3)  #044                             * 763AC  command
H002.-:
        CON(2)  1                                * 763AF
        NIBASC  "-"                              * 763B1
        CON(3)  #046                             * 763B3  command
H002./:
        CON(2)  1                                * 763B6
        NIBASC  "/"                              * 763B8
        CON(3)  #048                             * 763BA  command
H002.<:
        CON(2)  1                                * 763BD
        NIBASC  "<"                              * 763BF
        CON(3)  #0EB                             * 763C1  command
H002.=:
        CON(2)  1                                * 763C4
        NIBASC  "="                              * 763C6
        CON(3)  #03B                             * 763C8  command
H002.>:
        CON(2)  1                                * 763CB
        NIBASC  ">"                              * 763CD
        CON(3)  #0EC                             * 763CF  command
H002.!:
        CON(2)  1                                * 763D2
        NIBASC  "!"                              * 763D4
        CON(3)  #063                             * 763D6  command
H002.√:
        CON(2)  1                                * 763D9
        NIBASC  "√"                              * 763DB
        CON(3)  #04F                             * 763DD  command
H002.∫:
        CON(2)  1                                * 763E0
        NIBASC  "∫"                              * 763E2
        CON(3)  #0FC                             * 763E4  command
H002.Σ:
        CON(2)  1                                * 763E7
        NIBASC  "Σ"                              * 763E9
        CON(3)  #0FE                             * 763EB  command
H002.π:
        CON(2)  1                                * 763EE
        NIBASC  "π"                              * 763F0
        CON(3)  #03F                             * 763F2  command
H002.∂:
        CON(2)  1                                * 763F5
        NIBASC  "∂"                              * 763F7
        CON(3)  #0F7                             * 763F9  command
H002.≤:
        CON(2)  1                                * 763FC
        NIBASC  "≤"                              * 763FE
        CON(3)  #0ED                             * 76400  command
H002.≥:
        CON(2)  1                                * 76403
        NIBASC  "≥"                              * 76405
        CON(3)  #0EE                             * 76407  command
H002.≠:
        CON(2)  1                                * 7640A
        NIBASC  "≠"                              * 7640C
        CON(3)  #0EA                             * 7640E  command
H002.^:
        CON(2)  1                                * 76411
        NIBASC  "^"                              * 76413
        CON(3)  #049                             * 76415  command
H002._:
        CON(2)  1                                * 76418
        NIBASC  "_"                              * 7641A
        CON(3)  #10B                             * 7641C  command
H002.e:
        CON(2)  1                                * 7641F
        NIBASC  "e"                              * 76421
        CON(3)  #042                             * 76423  command
H002.i:
        CON(2)  1                                * 76426
        NIBASC  "i"                              * 76428
        CON(3)  #043                             * 7642A  command
H002.|:
        CON(2)  1                                * 7642D
        NIBASC  "|"                              * 7642F
        CON(3)  #0FF                             * 76431  command
H002.%T:
        CON(2)  2                                * 76434
        NIBASC  "%T"                             * 76436
        CON(3)  #07D                             * 7643A  command
H002.*H:
        CON(2)  2                                * 7643D
        NIBASC  "*H"                             * 7643F
        CON(3)  #0BD                             * 76443  command
H002.*W:
        CON(2)  2                                * 76446
        NIBASC  "*W"                             * 76448
        CON(3)  #0BE                             * 7644C  command
H002.==:
        CON(2)  2                                * 7644F
        NIBASC  "=="                             * 76451
        CON(3)  #0E9                             * 76455  command
H002.CF:
        CON(2)  2                                * 76458
        NIBASC  "CF"                             * 7645A
        CON(3)  #084                             * 7645E  command
H002.CR:
        CON(2)  2                                * 76461
        NIBASC  "CR"                             * 76463
        CON(3)  #0F3                             * 76467  command
H002.FP:
        CON(2)  2                                * 7646A
        NIBASC  "FP"                             * 7646C
        CON(3)  #066                             * 76470  command
H002.IM:
        CON(2)  2                                * 76473
        NIBASC  "IM"                             * 76475
        CON(3)  #09B                             * 76479  command
H002.IP:
        CON(2)  2                                * 7647C
        NIBASC  "IP"                             * 7647E
        CON(3)  #065                             * 76482  command
H002.LN:
        CON(2)  2                                * 76485
        NIBASC  "LN"                             * 76487
        CON(3)  #05E                             * 7648B  command
H002.LR:
        CON(2)  2                                * 7648E
        NIBASC  "LR"                             * 76490
        CON(3)  #12E                             * 76494  command
H002.NΣ:
        CON(2)  2                                * 76497
        NIBASC  "NΣ"                             * 76499
        CON(3)  #120                             * 7649D  command
H002.OR:
        CON(2)  2                                * 764A0
        NIBASC  "OR"                             * 764A2
        CON(3)  #0E6                             * 764A6  command
H002.RE:
        CON(2)  2                                * 764A9
        NIBASC  "RE"                             * 764AB
        CON(3)  #09A                             * 764AF  command
H002.RL:
        CON(2)  2                                * 764B2
        NIBASC  "RL"                             * 764B4
        CON(3)  #001                             * 764B8  command
H002.RR:
        CON(2)  2                                * 764BB
        NIBASC  "RR"                             * 764BD
        CON(3)  #003                             * 764C1  command
H002.SF:
        CON(2)  2                                * 764C4
        NIBASC  "SF"                             * 764C6
        CON(3)  #083                             * 764CA  command
H002.SL:
        CON(2)  2                                * 764CD
        NIBASC  "SL"                             * 764CF
        CON(3)  #005                             * 764D3  command
H002.SQ:
        CON(2)  2                                * 764D6
        NIBASC  "SQ"                             * 764D8
        CON(3)  #050                             * 764DC  command
H002.SR:
        CON(2)  2                                * 764DF
        NIBASC  "SR"                             * 764E1
        CON(3)  #007                             * 764E5  command
H002.V→:
        CON(2)  2                                * 764E8
        NIBASC  "V→"                             * 764EA
        CON(3)  #0B4                             * 764EE  command
H002.Σ+:
        CON(2)  2                                * 764F1
        NIBASC  "Σ+"                             * 764F3
        CON(3)  #11E                             * 764F7  command
H002.Σ-:
        CON(2)  2                                * 764FA
        NIBASC  "Σ-"                             * 764FC
        CON(3)  #11F                             * 76500  command
H002.ΣX:
        CON(2)  2                                * 76503
        NIBASC  "ΣX"                             * 76505
        CON(3)  #123                             * 76509  command
H002.ΣY:
        CON(2)  2                                * 7650C
        NIBASC  "ΣY"                             * 7650E
        CON(3)  #124                             * 76512  command
H002.→Q:
        CON(2)  2                                * 76515
        NIBASC  "→Q"                             * 76517
        CON(3)  #107                             * 7651B  command
H002.%CH:
        CON(2)  3                                * 7651E
        NIBASC  "%CH"                            * 76520
        CON(3)  #07E                             * 76526  command
H002.ABS:
        CON(2)  3                                * 76529
* a branch also enters #7652B, where the nibbles decode as addrslot
        NIBASC  "ABS"                            * 7652B
        CON(3)  #03D                             * 76531  command
H002.ACK:
        CON(2)  3                                * 76534
        NIBASC  "ACK"                            * 76536
        CON(3)  #015                             * 7653C  command
H002.AND:
        CON(2)  3                                * 7653F
* a branch also enters #76541, where the nibbles decode as addrslot
        NIBASC  "AND"                            * 76541
        CON(3)  #0E5                             * 76547  command
H002.ARC:
        CON(2)  3                                * 7654A
* a branch also enters #7654C, where the nibbles decode as addrslot
        NIBASC  "ARC"                            * 7654C
        CON(3)  #0D8                             * 76552  command
H002.ARG:
        CON(2)  3                                * 76555
* a branch also enters #76557, where the nibbles decode as addrslot
        NIBASC  "ARG"                            * 76557
        CON(3)  #04D                             * 7655D  command
H002.ASN:
        CON(2)  3                                * 76560
* a branch also enters #76562, where the nibbles decode as addrslot
        NIBASC  "ASN"                            * 76562
        CON(3)  #17B                             * 76568  command
H002.ASR:
        CON(2)  3                                * 7656B
* a branch also enters #7656D, where the nibbles decode as addrslot
        NIBASC  "ASR"                            * 7656D
        CON(3)  #000                             * 76573  command
H002.BAR:
        CON(2)  3                                * 76576
* a branch also enters #76578, where the nibbles decode as addrslot
        NIBASC  "BAR"                            * 76578
        CON(3)  #0E3                             * 7657E  command
H002.BIN:
        CON(2)  3                                * 76581
* a branch also enters #76583, where the nibbles decode as addrslot
        NIBASC  "BIN"                            * 76583
        CON(3)  #090                             * 76589  command
H002.BOX:
        CON(2)  3                                * 7658C
        NIBASC  "BOX"                            * 7658E
        CON(3)  #0D0                             * 76594  command
H002.B→R:
        CON(2)  3                                * 76597
* a branch also enters #76599, where the nibbles decode as addrslot
        NIBASC  "B→R"                            * 76599
        CON(3)  #00A                             * 7659F  command
H002.CHR:
        CON(2)  3                                * 765A2
* a branch also enters #765A4, where the nibbles decode as addrslot
        NIBASC  "CHR"                            * 765A4
        CON(3)  #0A5                             * 765AA  command
H002.CLΣ:
        CON(2)  3                                * 765AD
* a branch also enters #765AF, where the nibbles decode as addrslot
        NIBASC  "CLΣ"                            * 765AF
        CON(3)  #11C                             * 765B5  command
H002.CON:
        CON(2)  3                                * 765B8
* a branch also enters #765BA, where the nibbles decode as addrslot
        NIBASC  "CON"                            * 765BA
        CON(3)  #0AD                             * 765C0  command
H002.COS:
        CON(2)  3                                * 765C3
* a branch also enters #765C5, where the nibbles decode as addrslot
        NIBASC  "COS"                            * 765C5
        CON(3)  #052                             * 765CB  command
H002.COV:
        CON(2)  3                                * 765CE
* a branch also enters #765D0, where the nibbles decode as addrslot
        NIBASC  "COV"                            * 765D0
        CON(3)  #122                             * 765D6  command
H002.C→R:
        CON(2)  3                                * 765D9
* a branch also enters #765DB, where the nibbles decode as addrslot
        NIBASC  "C→R"                            * 765DB
        CON(3)  #09F                             * 765E1  command
H002.DEC:
        CON(2)  3                                * 765E4
* a branch also enters #765E6, where the nibbles decode as addrslot
        NIBASC  "DEC"                            * 765E6
        CON(3)  #091                             * 765EC  command
H002.DEG:
        CON(2)  3                                * 765EF
* a branch also enters #765F1, where the nibbles decode as addrslot
        NIBASC  "DEG"                            * 765F1
        CON(3)  #087                             * 765F7  command
H002.DET:
        CON(2)  3                                * 765FA
* a branch also enters #765FC, where the nibbles decode as addrslot
        NIBASC  "DET"                            * 765FC
        CON(3)  #078                             * 76602  command
H002.DOT:
        CON(2)  3                                * 76605
* a branch also enters #76607, where the nibbles decode as addrslot
        NIBASC  "DOT"                            * 76607
        CON(3)  #079                             * 7660D  command
H002.DUP:
        CON(2)  3                                * 76610
* a branch also enters #76612, where the nibbles decode as addrslot
        NIBASC  "DUP"                            * 76612
        CON(3)  #10D                             * 76618  command
H002.D→R:
        CON(2)  3                                * 7661B
* a branch also enters #7661D, where the nibbles decode as addrslot
        NIBASC  "D→R"                            * 7661D
        CON(3)  #070                             * 76623  command
H002.ENG:
        CON(2)  3                                * 76626
* a branch also enters #76628, where the nibbles decode as addrslot
        NIBASC  "ENG"                            * 76628
        CON(3)  #08C                             * 7662E  command
H002.EQ→:
        CON(2)  3                                * 76631
* a branch also enters #76633, where the nibbles decode as addrslot
        NIBASC  "EQ→"                            * 76633
        CON(3)  #0A8                             * 76639  command
H002.EXP:
        CON(2)  3                                * 7663C
* a branch also enters #7663E, where the nibbles decode as addrslot
        NIBASC  "EXP"                            * 7663E
        CON(3)  #05D                             * 76644  command
H002.FC?:
        CON(2)  3                                * 76647
* a branch also enters #76649, where the nibbles decode as addrslot
        NIBASC  "FC?"                            * 76649
        CON(3)  #086                             * 7664F  command
H002.FIX:
        CON(2)  3                                * 76652
        NIBASC  "FIX"                            * 76654
        CON(3)  #08A                             * 7665A  command
H002.FS?:
        CON(2)  3                                * 7665D
* a branch also enters #7665F, where the nibbles decode as addrslot
        NIBASC  "FS?"                            * 7665F
        CON(3)  #085                             * 76665  command
H002.GET:
        CON(2)  3                                * 76668
* a branch also enters #7666A, where the nibbles decode as addrslot
        NIBASC  "GET"                            * 7666A
        CON(3)  #0B2                             * 76670  command
H002.GOR:
        CON(2)  3                                * 76673
* a branch also enters #76675, where the nibbles decode as addrslot
        NIBASC  "GOR"                            * 76675
        CON(3)  #0D3                             * 7667B  command
H002.HEX:
        CON(2)  3                                * 7667E
        NIBASC  "HEX"                            * 76680
        CON(3)  #092                             * 76686  command
H002.IDN:
        CON(2)  3                                * 76689
* a branch also enters #7668B, where the nibbles decode as addrslot
        NIBASC  "IDN"                            * 7668B
        CON(3)  #0AE                             * 76691  command
H002.IFT:
        CON(2)  3                                * 76694
* a branch also enters #76696, where the nibbles decode as addrslot
        NIBASC  "IFT"                            * 76696
        CON(3)  #030                             * 7669C  command
H002.INV:
        CON(2)  3                                * 7669F
* a branch also enters #766A1, where the nibbles decode as addrslot
        NIBASC  "INV"                            * 766A1
        CON(3)  #04C                             * 766A7  command
H002.KEY:
        CON(2)  3                                * 766AA
        NIBASC  "KEY"                            * 766AC
        CON(3)  #039                             * 766B2  command
H002.LOG:
        CON(2)  3                                * 766B5
* a branch also enters #766B7, where the nibbles decode as addrslot
        NIBASC  "LOG"                            * 766B7
        CON(3)  #05F                             * 766BD  command
H002.MAX:
        CON(2)  3                                * 766C0
        NIBASC  "MAX"                            * 766C2
        CON(3)  #06A                             * 766C8  command
H002.MEM:
        CON(2)  3                                * 766CB
* a branch also enters #766CD, where the nibbles decode as addrslot
        NIBASC  "MEM"                            * 766CD
        CON(3)  #158                             * 766D3  command
H002.MIN:
        CON(2)  3                                * 766D6
* a branch also enters #766D8, where the nibbles decode as addrslot
        NIBASC  "MIN"                            * 766D8
        CON(3)  #06B                             * 766DE  command
H002.MOD:
        CON(2)  3                                * 766E1
* a branch also enters #766E3, where the nibbles decode as addrslot
        NIBASC  "MOD"                            * 766E3
        CON(3)  #06E                             * 766E9  command
H002.NEG:
        CON(2)  3                                * 766EC
* a branch also enters #766EE, where the nibbles decode as addrslot
        NIBASC  "NEG"                            * 766EE
        CON(3)  #03C                             * 766F4  command
H002.NOT:
        CON(2)  3                                * 766F7
* a branch also enters #766F9, where the nibbles decode as addrslot
        NIBASC  "NOT"                            * 766F9
        CON(3)  #0E7                             * 766FF  command
H002.NUM:
        CON(2)  3                                * 76702
* a branch also enters #76704, where the nibbles decode as addrslot
        NIBASC  "NUM"                            * 76704
        CON(3)  #0A4                             * 7670A  command
H002.OCT:
        CON(2)  3                                * 7670D
* a branch also enters #7670F, where the nibbles decode as addrslot
        NIBASC  "OCT"                            * 7670F
        CON(3)  #093                             * 76715  command
H002.OFF:
        CON(2)  3                                * 76718
* a branch also enters #7671A, where the nibbles decode as addrslot
        NIBASC  "OFF"                            * 7671A
        CON(3)  #029                             * 76720  command
H002.PKT:
        CON(2)  3                                * 76723
* a branch also enters #76725, where the nibbles decode as addrslot
        NIBASC  "PKT"                            * 76725
        CON(3)  #179                             * 7672B  command
H002.POS:
        CON(2)  3                                * 7672E
* a branch also enters #76730, where the nibbles decode as addrslot
        NIBASC  "POS"                            * 76730
        CON(3)  #0A1                             * 76736  command
H002.PR1:
        CON(2)  3                                * 76739
* a branch also enters #7673B, where the nibbles decode as addrslot
        NIBASC  "PR1"                            * 7673B
        CON(3)  #0F0                             * 76741  command
H002.PUT:
        CON(2)  3                                * 76744
* a branch also enters #76746, where the nibbles decode as addrslot
        NIBASC  "PUT"                            * 76746
        CON(3)  #0B0                             * 7674C  command
H002.RAD:
        CON(2)  3                                * 7674F
* a branch also enters #76751, where the nibbles decode as addrslot
        NIBASC  "RAD"                            * 76751
        CON(3)  #088                             * 76757  command
H002.RCL:
        CON(2)  3                                * 7675A
* a branch also enters #7675C, where the nibbles decode as addrslot
        NIBASC  "RCL"                            * 7675C
        CON(3)  #154                             * 76762  command
H002.RDM:
        CON(2)  3                                * 76765
* a branch also enters #76767, where the nibbles decode as addrslot
        NIBASC  "RDM"                            * 76767
        CON(3)  #0AC                             * 7676D  command
H002.RDZ:
        CON(2)  3                                * 76770
        NIBASC  "RDZ"                            * 76772
        CON(3)  #080                             * 76778  command
H002.RES:
        CON(2)  3                                * 7677B
* a branch also enters #7677D, where the nibbles decode as addrslot
        NIBASC  "RES"                            * 7677D
        CON(3)  #0BC                             * 76783  command
H002.RLB:
        CON(2)  3                                * 76786
* a branch also enters #76788, where the nibbles decode as addrslot
        NIBASC  "RLB"                            * 76788
        CON(3)  #002                             * 7678E  command
H002.RND:
        CON(2)  3                                * 76791
* a branch also enters #76793, where the nibbles decode as addrslot
        NIBASC  "RND"                            * 76793
        CON(3)  #06C                             * 76799  command
H002.ROT:
        CON(2)  3                                * 7679C
* a branch also enters #7679E, where the nibbles decode as addrslot
        NIBASC  "ROT"                            * 7679E
        CON(3)  #112                             * 767A4  command
H002.RRB:
        CON(2)  3                                * 767A7
* a branch also enters #767A9, where the nibbles decode as addrslot
        NIBASC  "RRB"                            * 767A9
        CON(3)  #004                             * 767AF  command
H002.RSD:
        CON(2)  3                                * 767B2
* a branch also enters #767B4, where the nibbles decode as addrslot
        NIBASC  "RSD"                            * 767B4
        CON(3)  #07B                             * 767BA  command
H002.R→B:
        CON(2)  3                                * 767BD
* a branch also enters #767BF, where the nibbles decode as addrslot
        NIBASC  "R→B"                            * 767BF
        CON(3)  #009                             * 767C5  command
H002.R→C:
        CON(2)  3                                * 767C8
* a branch also enters #767CA, where the nibbles decode as addrslot
        NIBASC  "R→C"                            * 767CA
        CON(3)  #099                             * 767D0  command
H002.R→D:
        CON(2)  3                                * 767D3
* a branch also enters #767D5, where the nibbles decode as addrslot
        NIBASC  "R→D"                            * 767D5
        CON(3)  #071                             * 767DB  command
H002.SCI:
        CON(2)  3                                * 767DE
        NIBASC  "SCI"                            * 767E0
        CON(3)  #08B                             * 767E6  command
H002.SIN:
        CON(2)  3                                * 767E9
* a branch also enters #767EB, where the nibbles decode as addrslot
        NIBASC  "SIN"                            * 767EB
        CON(3)  #051                             * 767F1  command
H002.SLB:
        CON(2)  3                                * 767F4
* a branch also enters #767F6, where the nibbles decode as addrslot
        NIBASC  "SLB"                            * 767F6
        CON(3)  #006                             * 767FC  command
H002.SRB:
        CON(2)  3                                * 767FF
* a branch also enters #76801, where the nibbles decode as addrslot
        NIBASC  "SRB"                            * 76801
        CON(3)  #008                             * 76807  command
H002.STD:
        CON(2)  3                                * 7680A
* a branch also enters #7680C, where the nibbles decode as addrslot
        NIBASC  "STD"                            * 7680C
        CON(3)  #08D                             * 76812  command
H002.STO:
        CON(2)  3                                * 76815
* a branch also enters #76817, where the nibbles decode as addrslot
        NIBASC  "STO"                            * 76817
        CON(3)  #155                             * 7681D  command
H002.SUB:
        CON(2)  3                                * 76820
* a branch also enters #76822, where the nibbles decode as addrslot
        NIBASC  "SUB"                            * 76822
        CON(3)  #09C                             * 76828  command
H002.TAN:
        CON(2)  3                                * 7682B
* a branch also enters #7682D, where the nibbles decode as addrslot
        NIBASC  "TAN"                            * 7682D
        CON(3)  #053                             * 76833  command
H002.TOT:
        CON(2)  3                                * 76836
* a branch also enters #76838, where the nibbles decode as addrslot
        NIBASC  "TOT"                            * 76838
        CON(3)  #12C                             * 7683E  command
H002.TRN:
        CON(2)  3                                * 76841
* a branch also enters #76843, where the nibbles decode as addrslot
        NIBASC  "TRN"                            * 76843
        CON(3)  #0AF                             * 76849  command
H002.VAR:
        CON(2)  3                                * 7684C
* a branch also enters #7684E, where the nibbles decode as addrslot
        NIBASC  "VAR"                            * 7684E
        CON(3)  #12D                             * 76854  command
H002.XOR:
        CON(2)  3                                * 76857
* a branch also enters #76859, where the nibbles decode as addrslot
        NIBASC  "XOR"                            * 76859
        CON(3)  #0E8                             * 7685F  command
H002.→Qπ:
        CON(2)  3                                * 76862
* a branch also enters #76864, where the nibbles decode as addrslot
        NIBASC  "→Qπ"                            * 76864
        CON(3)  #108                             * 7686A  command
H002.→V2:
        CON(2)  3                                * 7686D
* a branch also enters #7686F, where the nibbles decode as addrslot
        NIBASC  "→V2"                            * 7686F
        CON(3)  #0B5                             * 76875  command
H002.→V3:
        CON(2)  3                                * 76878
* a branch also enters #7687A, where the nibbles decode as addrslot
        NIBASC  "→V3"                            * 7687A
        CON(3)  #0B6                             * 76880  command
H002.ACOS:
        CON(2)  4                                * 76883
* a branch also enters #76885, where the nibbles decode as addrslot
        NIBASC  "ACOS"                           * 76885
        CON(3)  #058                             * 7688D  command
H002.ALOG:
        CON(2)  4                                * 76890
* a branch also enters #76892, where the nibbles decode as addrslot
        NIBASC  "ALOG"                           * 76892
        CON(3)  #060                             * 7689A  command
H002.ASIN:
        CON(2)  4                                * 7689D
        NIBASC  "ASIN"                           * 7689F
        CON(3)  #057                             * 768A7  command
H002.ATAN:
        CON(2)  4                                * 768AA
* a branch also enters #768AC, where the nibbles decode as addrslot
        NIBASC  "ATAN"                           * 768AC
        CON(3)  #059                             * 768B4  command
H002.AUTO:
        CON(2)  4                                * 768B7
* a branch also enters #768B9, where the nibbles decode as addrslot
        NIBASC  "AUTO"                           * 768B9
        CON(3)  #0C0                             * 768C1  command
H002.AXES:
        CON(2)  4                                * 768C4
* a branch also enters #768C6, where the nibbles decode as addrslot
        NIBASC  "AXES"                           * 768C6
        CON(3)  #0BA                             * 768CE  command
H002.BAUD:
        CON(2)  4                                * 768D1
* a branch also enters #768D3, where the nibbles decode as addrslot
        NIBASC  "BAUD"                           * 768D3
        CON(3)  #172                             * 768DB  command
H002.BEEP:
        CON(2)  4                                * 768DE
* a branch also enters #768E0, where the nibbles decode as addrslot
        NIBASC  "BEEP"                           * 768E0
        CON(3)  #034                             * 768E8  command
H002.BINS:
        CON(2)  4                                * 768EB
* a branch also enters #768ED, where the nibbles decode as addrslot
        NIBASC  "BINS"                           * 768ED
        CON(3)  #13B                             * 768F5  command
H002.CEIL:
        CON(2)  4                                * 768F8
        NIBASC  "CEIL"                           * 768FA
        CON(3)  #068                             * 76902  command
H002.CKSM:
        CON(2)  4                                * 76905
* a branch also enters #76907, where the nibbles decode as addrslot
        NIBASC  "CKSM"                           * 76907
        CON(3)  #171                             * 7690F  command
H002.CNRM:
        CON(2)  4                                * 76912
* a branch also enters #76914, where the nibbles decode as addrslot
        NIBASC  "CNRM"                           * 76914
        CON(3)  #077                             * 7691C  command
H002.COLΣ:
        CON(2)  4                                * 7691F
* a branch also enters #76921, where the nibbles decode as addrslot
        NIBASC  "COLΣ"                           * 76921
        CON(3)  #138                             * 76929  command
H002.COMB:
        CON(2)  4                                * 7692C
* a branch also enters #7692E, where the nibbles decode as addrslot
        NIBASC  "COMB"                           * 7692E
        CON(3)  #081                             * 76936  command
H002.CONJ:
        CON(2)  4                                * 76939
* a branch also enters #7693B, where the nibbles decode as addrslot
        NIBASC  "CONJ"                           * 7693B
        CON(3)  #03E                             * 76943  command
H002.CONT:
        CON(2)  4                                * 76946
* a branch also enters #76948, where the nibbles decode as addrslot
        NIBASC  "CONT"                           * 76948
        CON(3)  #03A                             * 76950  command
H002.CORR:
        CON(2)  4                                * 76953
* a branch also enters #76955, where the nibbles decode as addrslot
        NIBASC  "CORR"                           * 76955
        CON(3)  #121                             * 7695D  command
H002.COSH:
        CON(2)  4                                * 76960
* a branch also enters #76962, where the nibbles decode as addrslot
        NIBASC  "COSH"                           * 76962
        CON(3)  #055                             * 7696A  command
H002.C→PX:
        CON(2)  4                                * 7696D
* a branch also enters #7696F, where the nibbles decode as addrslot
        NIBASC  "C→PX"                           * 7696F
        CON(3)  #0C7                             * 76977  command
H002.DATE:
        CON(2)  4                                * 7697A
* a branch also enters #7697C, where the nibbles decode as addrslot
        NIBASC  "DATE"                           * 7697C
        CON(3)  #011                             * 76984  command
H002.DECR:
        CON(2)  4                                * 76987
* a branch also enters #76989, where the nibbles decode as addrslot
        NIBASC  "DECR"                           * 76989
        CON(3)  #14C                             * 76991  command
H002.DISP:
        CON(2)  4                                * 76994
* a branch also enters #76996, where the nibbles decode as addrslot
        NIBASC  "DISP"                           * 76996
        CON(3)  #032                             * 7699E  command
H002.DRAW:
        CON(2)  4                                * 769A1
* a branch also enters #769A3, where the nibbles decode as addrslot
        NIBASC  "DRAW"                           * 769A3
        CON(3)  #0BF                             * 769AB  command
H002.DRAX:
        CON(2)  4                                * 769AE
* a branch also enters #769B0, where the nibbles decode as addrslot
        NIBASC  "DRAX"                           * 769B0
        CON(3)  #0C1                             * 769B8  command
H002.DROP:
        CON(2)  4                                * 769BB
* a branch also enters #769BD, where the nibbles decode as addrslot
        NIBASC  "DROP"                           * 769BD
        CON(3)  #110                             * 769C5  command
H002.DTAG:
        CON(2)  4                                * 769C8
* a branch also enters #769CA, where the nibbles decode as addrslot
        NIBASC  "DTAG"                           * 769CA
        CON(3)  #180                             * 769D2  command
H002.DUP2:
        CON(2)  4                                * 769D5
* a branch also enters #769D7, where the nibbles decode as addrslot
        NIBASC  "DUP2"                           * 769D7
        CON(3)  #10E                             * 769DF  command
H002.DUPN:
        CON(2)  4                                * 769E2
* a branch also enters #769E4, where the nibbles decode as addrslot
        NIBASC  "DUPN"                           * 769E4
        CON(3)  #116                             * 769EC  command
H002.ERR0:
        CON(2)  4                                * 769EF
* a branch also enters #769F1, where the nibbles decode as addrslot
        NIBASC  "ERR0"                           * 769F1
        CON(3)  #02B                             * 769F9  command
H002.ERRM:
        CON(2)  4                                * 769FC
* a branch also enters #769FE, where the nibbles decode as addrslot
        NIBASC  "ERRM"                           * 769FE
        CON(3)  #02D                             * 76A06  command
H002.ERRN:
        CON(2)  4                                * 76A09
* a branch also enters #76A0B, where the nibbles decode as addrslot
        NIBASC  "ERRN"                           * 76A0B
        CON(3)  #02C                             * 76A13  command
H002.EVAL:
        CON(2)  4                                * 76A16
* a branch also enters #76A18, where the nibbles decode as addrslot
        NIBASC  "EVAL"                           * 76A18
        CON(3)  #02E                             * 76A20  command
H002.EXPM:
        CON(2)  4                                * 76A23
* a branch also enters #76A25, where the nibbles decode as addrslot
        NIBASC  "EXPM"                           * 76A25
        CON(3)  #062                             * 76A2D  command
H002.FACT:
        CON(2)  4                                * 76A30
* a branch also enters #76A32, where the nibbles decode as addrslot
        NIBASC  "FACT"                           * 76A32
        CON(3)  #064                             * 76A3A  command
H002.FC?C:
        CON(2)  4                                * 76A3D
* a branch also enters #76A3F, where the nibbles decode as addrslot
        NIBASC  "FC?C"                           * 76A3F
        CON(3)  #08F                             * 76A47  command
H002.FREE:
        CON(2)  4                                * 76A4A
* a branch also enters #76A4C, where the nibbles decode as addrslot
        NIBASC  "FREE"                           * 76A4C
        CON(3)  #163                             * 76A54  command
H002.FS?C:
        CON(2)  4                                * 76A57
* a branch also enters #76A59, where the nibbles decode as addrslot
        NIBASC  "FS?C"                           * 76A59
        CON(3)  #08E                             * 76A61  command
H002.GETI:
        CON(2)  4                                * 76A64
* a branch also enters #76A66, where the nibbles decode as addrslot
        NIBASC  "GETI"                           * 76A66
        CON(3)  #0B3                             * 76A6E  command
H002.GRAD:
        CON(2)  4                                * 76A71
* a branch also enters #76A73, where the nibbles decode as addrslot
        NIBASC  "GRAD"                           * 76A73
        CON(3)  #089                             * 76A7B  command
H002.GXOR:
        CON(2)  4                                * 76A7E
* a branch also enters #76A80, where the nibbles decode as addrslot
        NIBASC  "GXOR"                           * 76A80
        CON(3)  #0D4                             * 76A88  command
H002.HMS+:
        CON(2)  4                                * 76A8B
* a branch also enters #76A8D, where the nibbles decode as addrslot
        NIBASC  "HMS+"                           * 76A8D
        CON(3)  #074                             * 76A95  command
H002.HMS-:
        CON(2)  4                                * 76A98
* a branch also enters #76A9A, where the nibbles decode as addrslot
        NIBASC  "HMS-"                           * 76A9A
        CON(3)  #075                             * 76AA2  command
H002.HMS→:
        CON(2)  4                                * 76AA5
* a branch also enters #76AA7, where the nibbles decode as addrslot
        NIBASC  "HMS→"                           * 76AA7
        CON(3)  #073                             * 76AAF  command
H002.HOME:
        CON(2)  4                                * 76AB2
* a branch also enters #76AB4, where the nibbles decode as addrslot
        NIBASC  "HOME"                           * 76AB4
        CON(3)  #022                             * 76ABC  command
H002.IFTE:
        CON(2)  4                                * 76ABF
* a branch also enters #76AC1, where the nibbles decode as addrslot
        NIBASC  "IFTE"                           * 76AC1
        CON(3)  #02F                             * 76AC9  command
H002.INCR:
        CON(2)  4                                * 76ACC
* a branch also enters #76ACE, where the nibbles decode as addrslot
        NIBASC  "INCR"                           * 76ACE
        CON(3)  #14B                             * 76AD6  command
H002.ISOL:
        CON(2)  4                                * 76AD9
* a branch also enters #76ADB, where the nibbles decode as addrslot
        NIBASC  "ISOL"                           * 76ADB
        CON(3)  #150                             * 76AE3  command
H002.KGET:
        CON(2)  4                                * 76AE6
* a branch also enters #76AE8, where the nibbles decode as addrslot
        NIBASC  "KGET"                           * 76AE8
        CON(3)  #16C                             * 76AF0  command
H002.KILL:
        CON(2)  4                                * 76AF3
* a branch also enters #76AF5, where the nibbles decode as addrslot
        NIBASC  "KILL"                           * 76AF5
        CON(3)  #028                             * 76AFD  command
        CON(2)  4                                * 76B00
* a branch also enters #76B02, where the nibbles decode as addrslot
        NIBASC  "LAST"                           * 76B02
        CON(3)  #036                             * 76B0A  command
H002.LCD→:
        CON(2)  4                                * 76B0D
* a branch also enters #76B0F, where the nibbles decode as addrslot
        NIBASC  "LCD→"                           * 76B0F
        CON(3)  #0D5                             * 76B17  command
H002.LIBS:
        CON(2)  4                                * 76B1A
* a branch also enters #76B1C, where the nibbles decode as addrslot
        NIBASC  "LIBS"                           * 76B1C
        CON(3)  #164                             * 76B24  command
H002.LINE:
        CON(2)  4                                * 76B27
* a branch also enters #76B29, where the nibbles decode as addrslot
        NIBASC  "LINE"                           * 76B29
        CON(3)  #0CE                             * 76B31  command
H002.LNP1:
        CON(2)  4                                * 76B34
* a branch also enters #76B36, where the nibbles decode as addrslot
        NIBASC  "LNP1"                           * 76B36
        CON(3)  #061                             * 76B3E  command
H002.MANT:
        CON(2)  4                                * 76B41
* a branch also enters #76B43, where the nibbles decode as addrslot
        NIBASC  "MANT"                           * 76B43
        CON(3)  #06F                             * 76B4B  command
H002.MAXR:
        CON(2)  4                                * 76B4E
        NIBASC  "MAXR"                           * 76B50
        CON(3)  #040                             * 76B58  command
H002.MAXΣ:
        CON(2)  4                                * 76B5B
        NIBASC  "MAXΣ"                           * 76B5D
        CON(3)  #128                             * 76B65  command
H002.MEAN:
        CON(2)  4                                * 76B68
* a branch also enters #76B6A, where the nibbles decode as addrslot
        NIBASC  "MEAN"                           * 76B6A
        CON(3)  #129                             * 76B72  command
H002.MENU:
        CON(2)  4                                * 76B75
* a branch also enters #76B77, where the nibbles decode as addrslot
        NIBASC  "MENU"                           * 76B77
        CON(3)  #15C                             * 76B7F  command
H002.MINR:
        CON(2)  4                                * 76B82
* a branch also enters #76B84, where the nibbles decode as addrslot
        NIBASC  "MINR"                           * 76B84
        CON(3)  #041                             * 76B8C  command
H002.MINΣ:
        CON(2)  4                                * 76B8F
* a branch also enters #76B91, where the nibbles decode as addrslot
        NIBASC  "MINΣ"                           * 76B91
        CON(3)  #12A                             * 76B99  command
H002.OBJ→:
        CON(2)  4                                * 76B9C
        NIBASC  "OBJ→"                           * 76B9E
        CON(3)  #0A9                             * 76BA6  command
H002.OVER:
        CON(2)  4                                * 76BA9
* a branch also enters #76BAB, where the nibbles decode as addrslot
        NIBASC  "OVER"                           * 76BAB
        CON(3)  #113                             * 76BB3  command
H002.PATH:
        CON(2)  4                                * 76BB6
* a branch also enters #76BB8, where the nibbles decode as addrslot
        NIBASC  "PATH"                           * 76BB8
        CON(3)  #021                             * 76BC0  command
H002.PDIM:
        CON(2)  4                                * 76BC3
        NIBASC  "PDIM"                           * 76BC5
        CON(3)  #0C3                             * 76BCD  command
H002.PERM:
        CON(2)  4                                * 76BD0
* a branch also enters #76BD2, where the nibbles decode as addrslot
        NIBASC  "PERM"                           * 76BD2
        CON(3)  #082                             * 76BDA  command
H002.PICK:
        CON(2)  4                                * 76BDD
* a branch also enters #76BDF, where the nibbles decode as addrslot
        NIBASC  "PICK"                           * 76BDF
        CON(3)  #117                             * 76BE7  command
H002.PICT:
        CON(2)  4                                * 76BEA
* a branch also enters #76BEC, where the nibbles decode as addrslot
        NIBASC  "PICT"                           * 76BEC
        CON(3)  #0D2                             * 76BF4  command
H002.PIX?:
        CON(2)  4                                * 76BF7
        NIBASC  "PIX?"                           * 76BF9
        CON(3)  #0CD                             * 76C01  command
H002.PMAX:
        CON(2)  4                                * 76C04
* a branch also enters #76C06, where the nibbles decode as addrslot
        NIBASC  "PMAX"                           * 76C06
        CON(3)  #0B9                             * 76C0E  command
H002.PMIN:
        CON(2)  4                                * 76C11
        NIBASC  "PMIN"                           * 76C13
        CON(3)  #0B8                             * 76C1B  command
H002.PRST:
        CON(2)  4                                * 76C1E
* a branch also enters #76C20, where the nibbles decode as addrslot
        NIBASC  "PRST"                           * 76C20
        CON(3)  #0F2                             * 76C28  command
H002.PUTI:
        CON(2)  4                                * 76C2B
* a branch also enters #76C2D, where the nibbles decode as addrslot
        NIBASC  "PUTI"                           * 76C2D
        CON(3)  #0B1                             * 76C35  command
H002.PX→C:
        CON(2)  4                                * 76C38
* a branch also enters #76C3A, where the nibbles decode as addrslot
        NIBASC  "PX→C"                           * 76C3A
        CON(3)  #0C6                             * 76C42  command
H002.QUAD:
        CON(2)  4                                * 76C45
* a branch also enters #76C47, where the nibbles decode as addrslot
        NIBASC  "QUAD"                           * 76C47
        CON(3)  #151                             * 76C4F  command
H002.RAND:
        CON(2)  4                                * 76C52
* a branch also enters #76C54, where the nibbles decode as addrslot
        NIBASC  "RAND"                           * 76C54
        CON(3)  #07F                             * 76C5C  command
H002.RCEQ:
        CON(2)  4                                * 76C5F
* a branch also enters #76C61, where the nibbles decode as addrslot
        NIBASC  "RCEQ"                           * 76C61
        CON(3)  #0F9                             * 76C69  command
H002.RCLF:
        CON(2)  4                                * 76C6C
* a branch also enters #76C6E, where the nibbles decode as addrslot
        NIBASC  "RCLF"                           * 76C6E
        CON(3)  #096                             * 76C76  command
H002.RCLΣ:
        CON(2)  4                                * 76C79
* a branch also enters #76C7B, where the nibbles decode as addrslot
        NIBASC  "RCLΣ"                           * 76C7B
        CON(3)  #11D                             * 76C83  command
H002.RCWS:
        CON(2)  4                                * 76C86
* a branch also enters #76C88, where the nibbles decode as addrslot
        NIBASC  "RCWS"                           * 76C88
        CON(3)  #095                             * 76C90  command
H002.RECN:
        CON(2)  4                                * 76C93
* a branch also enters #76C95, where the nibbles decode as addrslot
        NIBASC  "RECN"                           * 76C95
        CON(3)  #16D                             * 76C9D  command
H002.RECV:
        CON(2)  4                                * 76CA0
* a branch also enters #76CA2, where the nibbles decode as addrslot
        NIBASC  "RECV"                           * 76CA2
        CON(3)  #16E                             * 76CAA  command
H002.REPL:
        CON(2)  4                                * 76CAD
* a branch also enters #76CAF, where the nibbles decode as addrslot
        NIBASC  "REPL"                           * 76CAF
        CON(3)  #09D                             * 76CB7  command
H002.RNRM:
        CON(2)  4                                * 76CBA
* a branch also enters #76CBC, where the nibbles decode as addrslot
        NIBASC  "RNRM"                           * 76CBC
        CON(3)  #076                             * 76CC4  command
H002.ROLL:
        CON(2)  4                                * 76CC7
* a branch also enters #76CC9, where the nibbles decode as addrslot
        NIBASC  "ROLL"                           * 76CC9
        CON(3)  #118                             * 76CD1  command
H002.ROOT:
        CON(2)  4                                * 76CD4
* a branch also enters #76CD6, where the nibbles decode as addrslot
        NIBASC  "ROOT"                           * 76CD6
        CON(3)  #0FB                             * 76CDE  command
H002.SAME:
        CON(2)  4                                * 76CE1
* a branch also enters #76CE3, where the nibbles decode as addrslot
        NIBASC  "SAME"                           * 76CE3
        CON(3)  #0E4                             * 76CEB  command
H002.SBRK:
        CON(2)  4                                * 76CEE
* a branch also enters #76CF0, where the nibbles decode as addrslot
        NIBASC  "SBRK"                           * 76CF0
        CON(3)  #178                             * 76CF8  command
H002.SCLΣ:
        CON(2)  4                                * 76CFB
* a branch also enters #76CFD, where the nibbles decode as addrslot
        NIBASC  "SCLΣ"                           * 76CFD
        CON(3)  #139                             * 76D05  command
H002.SDEV:
        CON(2)  4                                * 76D08
* a branch also enters #76D0A, where the nibbles decode as addrslot
        NIBASC  "SDEV"                           * 76D0A
        CON(3)  #12B                             * 76D12  command
H002.SEND:
        CON(2)  4                                * 76D15
* a branch also enters #76D17, where the nibbles decode as addrslot
        NIBASC  "SEND"                           * 76D17
        CON(3)  #16B                             * 76D1F  command
H002.SHOW:
        CON(2)  4                                * 76D22
* a branch also enters #76D24, where the nibbles decode as addrslot
        NIBASC  "SHOW"                           * 76D24
        CON(3)  #152                             * 76D2C  command
H002.SIGN:
        CON(2)  4                                * 76D2F
* a branch also enters #76D31, where the nibbles decode as addrslot
        NIBASC  "SIGN"                           * 76D31
        CON(3)  #04E                             * 76D39  command
H002.SINH:
        CON(2)  4                                * 76D3C
* a branch also enters #76D3E, where the nibbles decode as addrslot
        NIBASC  "SINH"                           * 76D3E
        CON(3)  #054                             * 76D46  command
H002.SINV:
        CON(2)  4                                * 76D49
* a branch also enters #76D4B, where the nibbles decode as addrslot
        NIBASC  "SINV"                           * 76D4B
        CON(3)  #144                             * 76D53  command
H002.SIZE:
        CON(2)  4                                * 76D56
        NIBASC  "SIZE"                           * 76D58
        CON(3)  #0A0                             * 76D60  command
H002.SNEG:
        CON(2)  4                                * 76D63
* a branch also enters #76D65, where the nibbles decode as addrslot
        NIBASC  "SNEG"                           * 76D65
        CON(3)  #145                             * 76D6D  command
H002.STEQ:
        CON(2)  4                                * 76D70
* a branch also enters #76D72, where the nibbles decode as addrslot
        NIBASC  "STEQ"                           * 76D72
        CON(3)  #0FA                             * 76D7A  command
H002.STO*:
        CON(2)  4                                * 76D7D
* a branch also enters #76D7F, where the nibbles decode as addrslot
        NIBASC  "STO*"                           * 76D7F
        CON(3)  #14A                             * 76D87  command
H002.STO+:
        CON(2)  4                                * 76D8A
* a branch also enters #76D8C, where the nibbles decode as addrslot
        NIBASC  "STO+"                           * 76D8C
        CON(3)  #147                             * 76D94  command
H002.STO-:
        CON(2)  4                                * 76D97
* a branch also enters #76D99, where the nibbles decode as addrslot
        NIBASC  "STO-"                           * 76D99
        CON(3)  #148                             * 76DA1  command
H002.STO/:
        CON(2)  4                                * 76DA4
* a branch also enters #76DA6, where the nibbles decode as addrslot
        NIBASC  "STO/"                           * 76DA6
        CON(3)  #149                             * 76DAE  command
H002.STOF:
        CON(2)  4                                * 76DB1
* a branch also enters #76DB3, where the nibbles decode as addrslot
        NIBASC  "STOF"                           * 76DB3
        CON(3)  #097                             * 76DBB  command
H002.STOΣ:
        CON(2)  4                                * 76DBE
* a branch also enters #76DC0, where the nibbles decode as addrslot
        NIBASC  "STOΣ"                           * 76DC0
        CON(3)  #11B                             * 76DC8  command
H002.STR→:
        CON(2)  4                                * 76DCB
* a branch also enters #76DCD, where the nibbles decode as addrslot
        NIBASC  "STR→"                           * 76DCD
        CON(3)  #0A3                             * 76DD5  command
H002.STWS:
        CON(2)  4                                * 76DD8
* a branch also enters #76DDA, where the nibbles decode as addrslot
        NIBASC  "STWS"                           * 76DDA
        CON(3)  #094                             * 76DE2  command
H002.SWAP:
        CON(2)  4                                * 76DE5
* a branch also enters #76DE7, where the nibbles decode as addrslot
        NIBASC  "SWAP"                           * 76DE7
        CON(3)  #10F                             * 76DEF  command
H002.TANH:
        CON(2)  4                                * 76DF2
* a branch also enters #76DF4, where the nibbles decode as addrslot
        NIBASC  "TANH"                           * 76DF4
        CON(3)  #056                             * 76DFC  command
H002.TEXT:
        CON(2)  4                                * 76DFF
        NIBASC  "TEXT"                           * 76E01
        CON(3)  #0D9                             * 76E09  command
H002.TIME:
        CON(2)  4                                * 76E0C
* a branch also enters #76E0E, where the nibbles decode as addrslot
        NIBASC  "TIME"                           * 76E0E
        CON(3)  #010                             * 76E16  command
H002.TRNC:
        CON(2)  4                                * 76E19
* a branch also enters #76E1B, where the nibbles decode as addrslot
        NIBASC  "TRNC"                           * 76E1B
        CON(3)  #06D                             * 76E23  command
H002.TSTR:
        CON(2)  4                                * 76E26
* a branch also enters #76E28, where the nibbles decode as addrslot
        NIBASC  "TSTR"                           * 76E28
        CON(3)  #01D                             * 76E30  command
H002.TYPE:
        CON(2)  4                                * 76E33
* a branch also enters #76E35, where the nibbles decode as addrslot
        NIBASC  "TYPE"                           * 76E35
        CON(3)  #0A6                             * 76E3D  command
H002.UTPC:
        CON(2)  4                                * 76E40
* a branch also enters #76E42, where the nibbles decode as addrslot
        NIBASC  "UTPC"                           * 76E42
        CON(3)  #134                             * 76E4A  command
H002.UTPF:
        CON(2)  4                                * 76E4D
* a branch also enters #76E4F, where the nibbles decode as addrslot
        NIBASC  "UTPF"                           * 76E4F
        CON(3)  #136                             * 76E57  command
H002.UTPN:
        CON(2)  4                                * 76E5A
* a branch also enters #76E5C, where the nibbles decode as addrslot
        NIBASC  "UTPN"                           * 76E5C
        CON(3)  #135                             * 76E64  command
H002.UTPT:
        CON(2)  4                                * 76E67
* a branch also enters #76E69, where the nibbles decode as addrslot
        NIBASC  "UTPT"                           * 76E69
        CON(3)  #137                             * 76E71  command
H002.UVAL:
        CON(2)  4                                * 76E74
* a branch also enters #76E76, where the nibbles decode as addrslot
        NIBASC  "UVAL"                           * 76E76
        CON(3)  #00C                             * 76E7E  command
H002.VARS:
        CON(2)  4                                * 76E81
* a branch also enters #76E83, where the nibbles decode as addrslot
        NIBASC  "VARS"                           * 76E83
        CON(3)  #024                             * 76E8B  command
H002.WAIT:
        CON(2)  4                                * 76E8E
        NIBASC  "WAIT"                           * 76E90
        CON(3)  #037                             * 76E98  command
H002.XCOL:
        CON(2)  4                                * 76E9B
* a branch also enters #76E9D, where the nibbles decode as addrslot
        NIBASC  "XCOL"                           * 76E9D
        CON(3)  #132                             * 76EA5  command
H002.XMIT:
        CON(2)  4                                * 76EA8
        NIBASC  "XMIT"                           * 76EAA
        CON(3)  #167                             * 76EB2  command
H002.XPON:
        CON(2)  4                                * 76EB5
* a branch also enters #76EB7, where the nibbles decode as addrslot
        NIBASC  "XPON"                           * 76EB7
        CON(3)  #069                             * 76EBF  command
H002.XRNG:
        CON(2)  4                                * 76EC2
* a branch also enters #76EC4, where the nibbles decode as addrslot
        NIBASC  "XRNG"                           * 76EC4
        CON(3)  #0DA                             * 76ECC  command
H002.YCOL:
        CON(2)  4                                * 76ECF
* a branch also enters #76ED1, where the nibbles decode as addrslot
        NIBASC  "YCOL"                           * 76ED1
        CON(3)  #133                             * 76ED9  command
H002.YRNG:
        CON(2)  4                                * 76EDC
* a branch also enters #76EDE, where the nibbles decode as addrslot
        NIBASC  "YRNG"                           * 76EDE
        CON(3)  #0DB                             * 76EE6  command
H002.ΣX*Y:
        CON(2)  4                                * 76EE9
        NIBASC  "ΣX*Y"                           * 76EEB
        CON(3)  #127                             * 76EF3  command
H002.ΣX^2:
        CON(2)  4                                * 76EF6
* a branch also enters #76EF8, where the nibbles decode as addrslot
        NIBASC  "ΣX^2"                           * 76EF8
        CON(3)  #125                             * 76F00  command
H002.ΣY^2:
        CON(2)  4                                * 76F03
* a branch also enters #76F05, where the nibbles decode as addrslot
        NIBASC  "ΣY^2"                           * 76F05
        CON(3)  #126                             * 76F0D  command
H002.→HMS:
        CON(2)  4                                * 76F10
* a branch also enters #76F12, where the nibbles decode as addrslot
        NIBASC  "→HMS"                           * 76F12
        CON(3)  #072                             * 76F1A  command
H002.→LCD:
        CON(2)  4                                * 76F1D
* a branch also enters #76F1F, where the nibbles decode as addrslot
        NIBASC  "→LCD"                           * 76F1F
        CON(3)  #0D6                             * 76F27  command
H002.→NUM:
        CON(2)  4                                * 76F2A
* a branch also enters #76F2C, where the nibbles decode as addrslot
        NIBASC  "→NUM"                           * 76F2C
        CON(3)  #035                             * 76F34  command
H002.→STR:
        CON(2)  4                                * 76F37
* a branch also enters #76F39, where the nibbles decode as addrslot
        NIBASC  "→STR"                           * 76F39
        CON(3)  #0A2                             * 76F41  command
H002.→TAG:
        CON(2)  4                                * 76F44
* a branch also enters #76F46, where the nibbles decode as addrslot
        NIBASC  "→TAG"                           * 76F46
        CON(3)  #17F                             * 76F4E  command
H002.ACOSH:
        CON(2)  5                                * 76F51
* a branch also enters #76F53, where the nibbles decode as addrslot
        NIBASC  "ACOSH"                          * 76F53
        CON(3)  #05B                             * 76F5D  command
H002.APPLY:
        CON(2)  5                                * 76F60
* a branch also enters #76F62, where the nibbles decode as addrslot
        NIBASC  "APPLY"                          * 76F62
        CON(3)  #102                             * 76F6C  command
H002.ARRY→:
        CON(2)  5                                * 76F6F
* a branch also enters #76F71, where the nibbles decode as addrslot
        NIBASC  "ARRY→"                          * 76F71
        CON(3)  #0AB                             * 76F7B  command
H002.ASINH:
        CON(2)  5                                * 76F7E
        NIBASC  "ASINH"                          * 76F80
        CON(3)  #05A                             * 76F8A  command
H002.ATANH:
        CON(2)  5                                * 76F8D
* a branch also enters #76F8F, where the nibbles decode as addrslot
        NIBASC  "ATANH"                          * 76F8F
        CON(3)  #05C                             * 76F99  command
H002.BLANK:
        CON(2)  5                                * 76F9C
* a branch also enters #76F9E, where the nibbles decode as addrslot
        NIBASC  "BLANK"                          * 76F9E
        CON(3)  #0D1                             * 76FA8  command
H002.BYTES:
        CON(2)  5                                * 76FAB
* a branch also enters #76FAD, where the nibbles decode as addrslot
        NIBASC  "BYTES"                          * 76FAD
        CON(3)  #026                             * 76FB7  command
H002.CENTR:
        CON(2)  5                                * 76FBA
* a branch also enters #76FBC, where the nibbles decode as addrslot
        NIBASC  "CENTR"                          * 76FBC
        CON(3)  #0BB                             * 76FC6  command
H002.CLEAR:
        CON(2)  5                                * 76FC9
* a branch also enters #76FCB, where the nibbles decode as addrslot
        NIBASC  "CLEAR"                          * 76FCB
        CON(3)  #11A                             * 76FD5  command
H002.CLLCD:
        CON(2)  5                                * 76FD8
* a branch also enters #76FDA, where the nibbles decode as addrslot
        NIBASC  "CLLCD"                          * 76FDA
        CON(3)  #038                             * 76FE4  command
        CON(2)  5                                * 76FE7
* a branch also enters #76FE9, where the nibbles decode as addrslot
        NIBASC  "CLUSR"                          * 76FE9
        CON(3)  #15A                             * 76FF3  command
H002.CLVAR:
        CON(2)  5                                * 76FF6
* a branch also enters #76FF8, where the nibbles decode as addrslot
        NIBASC  "CLVAR"                          * 76FF8
        CON(3)  #15A                             * 77002  command
H002.COLCT:
        CON(2)  5                                * 77005
* a branch also enters #77007, where the nibbles decode as addrslot
        NIBASC  "COLCT"                          * 77007
        CON(3)  #14D                             * 77011  command
H002.CONIC:
        CON(2)  5                                * 77014
* a branch also enters #77016, where the nibbles decode as addrslot
        NIBASC  "CONIC"                          * 77016
        CON(3)  #0DD                             * 77020  command
H002.CRDIR:
        CON(2)  5                                * 77023
* a branch also enters #77025, where the nibbles decode as addrslot
        NIBASC  "CRDIR"                          * 77025
        CON(3)  #020                             * 7702F  command
H002.CROSS:
        CON(2)  5                                * 77032
* a branch also enters #77034, where the nibbles decode as addrslot
        NIBASC  "CROSS"                          * 77034
        CON(3)  #07A                             * 7703E  command
H002.DATE+:
        CON(2)  5                                * 77041
* a branch also enters #77043, where the nibbles decode as addrslot
        NIBASC  "DATE+"                          * 77043
        CON(3)  #01F                             * 7704D  command
H002.DDAYS:
        CON(2)  5                                * 77050
* a branch also enters #77052, where the nibbles decode as addrslot
        NIBASC  "DDAYS"                          * 77052
        CON(3)  #01E                             * 7705C  command
H002.DELAY:
        CON(2)  5                                * 7705F
* a branch also enters #77061, where the nibbles decode as addrslot
        NIBASC  "DELAY"                          * 77061
        CON(3)  #0F5                             * 7706B  command
H002.DEPND:
        CON(2)  5                                * 7706E
* a branch also enters #77070, where the nibbles decode as addrslot
        NIBASC  "DEPND"                          * 77070
        CON(3)  #0C4                             * 7707A  command
H002.DEPTH:
        CON(2)  5                                * 7707D
* a branch also enters #7707F, where the nibbles decode as addrslot
        NIBASC  "DEPTH"                          * 7707F
        CON(3)  #114                             * 77089  command
H002.DOERR:
        CON(2)  5                                * 7708C
* a branch also enters #7708E, where the nibbles decode as addrslot
        NIBASC  "DOERR"                          * 7708E
        CON(3)  #02A                             * 77098  command
H002.DROP2:
        CON(2)  5                                * 7709B
* a branch also enters #7709D, where the nibbles decode as addrslot
        NIBASC  "DROP2"                          * 7709D
        CON(3)  #111                             * 770A7  command
H002.DROPN:
        CON(2)  5                                * 770AA
* a branch also enters #770AC, where the nibbles decode as addrslot
        NIBASC  "DROPN"                          * 770AC
        CON(3)  #115                             * 770B6  command
H002.ERASE:
        CON(2)  5                                * 770B9
* a branch also enters #770BB, where the nibbles decode as addrslot
        NIBASC  "ERASE"                          * 770BB
        CON(3)  #0C5                             * 770C5  command
H002.EXPAN:
        CON(2)  5                                * 770C8
* a branch also enters #770CA, where the nibbles decode as addrslot
        NIBASC  "EXPAN"                          * 770CA
        CON(3)  #14E                             * 770D4  command
H002.FLOOR:
        CON(2)  5                                * 770D7
* a branch also enters #770D9, where the nibbles decode as addrslot
        NIBASC  "FLOOR"                          * 770D9
        CON(3)  #067                             * 770E3  command
        CON(2)  5                                * 770E6
* a branch also enters #770E8, where the nibbles decode as addrslot
        NIBASC  "GRAPH"                          * 770E8
        CON(3)  #0C8                             * 770F2  command
H002.INDEP:
        CON(2)  5                                * 770F5
* a branch also enters #770F7, where the nibbles decode as addrslot
        NIBASC  "INDEP"                          * 770F7
        CON(3)  #0B7                             * 77101  command
H002.INPUT:
        CON(2)  5                                * 77104
* a branch also enters #77106, where the nibbles decode as addrslot
        NIBASC  "INPUT"                          * 77106
        CON(3)  #17A                             * 77110  command
H002.KERRM:
        CON(2)  5                                * 77113
* a branch also enters #77115, where the nibbles decode as addrslot
        NIBASC  "KERRM"                          * 77115
        CON(3)  #175                             * 7711F  command
H002.LABEL:
        CON(2)  5                                * 77122
* a branch also enters #77124, where the nibbles decode as addrslot
        NIBASC  "LABEL"                          * 77124
        CON(3)  #0C9                             * 7712E  command
H002.LIST→:
        CON(2)  5                                * 77131
* a branch also enters #77133, where the nibbles decode as addrslot
        NIBASC  "LIST→"                          * 77133
        CON(3)  #09E                             * 7713D  command
H002.MERGE:
        CON(2)  5                                * 77140
* a branch also enters #77142, where the nibbles decode as addrslot
        NIBASC  "MERGE"                          * 77142
        CON(3)  #162                             * 7714C  command
H002.NEWOB:
        CON(2)  5                                * 7714F
* a branch also enters #77151, where the nibbles decode as addrslot
        NIBASC  "NEWOB"                          * 77151
        CON(3)  #027                             * 7715B  command
H002.ORDER:
        CON(2)  5                                * 7715E
* a branch also enters #77160, where the nibbles decode as addrslot
        NIBASC  "ORDER"                          * 77160
        CON(3)  #159                             * 7716A  command
H002.PGDIR:
        CON(2)  5                                * 7716D
* a branch also enters #7716F, where the nibbles decode as addrslot
        NIBASC  "PGDIR"                          * 7716F
        CON(3)  #15F                             * 77179  command
H002.PIXON:
        CON(2)  5                                * 7717C
        NIBASC  "PIXON"                          * 7717E
        CON(3)  #0CB                             * 77188  command
H002.POLAR:
        CON(2)  5                                * 7718B
* a branch also enters #7718D, where the nibbles decode as addrslot
        NIBASC  "POLAR"                          * 7718D
        CON(3)  #0DE                             * 77197  command
H002.PREDV:
        CON(2)  5                                * 7719A
* a branch also enters #7719C, where the nibbles decode as addrslot
        NIBASC  "PREDV"                          * 7719C
        CON(3)  #12F                             * 771A6  command
H002.PREDX:
        CON(2)  5                                * 771A9
* a branch also enters #771AB, where the nibbles decode as addrslot
        NIBASC  "PREDX"                          * 771AB
        CON(3)  #131                             * 771B5  command
H002.PREDY:
        CON(2)  5                                * 771B8
* a branch also enters #771BA, where the nibbles decode as addrslot
        NIBASC  "PREDY"                          * 771BA
        CON(3)  #130                             * 771C4  command
H002.PRLCD:
        CON(2)  5                                * 771C7
* a branch also enters #771C9, where the nibbles decode as addrslot
        NIBASC  "PRLCD"                          * 771C9
        CON(3)  #0F6                             * 771D3  command
H002.PRSTC:
        CON(2)  5                                * 771D6
* a branch also enters #771D8, where the nibbles decode as addrslot
        NIBASC  "PRSTC"                          * 771D8
        CON(3)  #0F1                             * 771E2  command
H002.PRVAR:
        CON(2)  5                                * 771E5
* a branch also enters #771E7, where the nibbles decode as addrslot
        NIBASC  "PRVAR"                          * 771E7
        CON(3)  #0F4                             * 771F1  command
H002.PURGE:
        CON(2)  5                                * 771F4
* a branch also enters #771F6, where the nibbles decode as addrslot
        NIBASC  "PURGE"                          * 771F6
        CON(3)  #157                             * 77200  command
H002.PVARS:
        CON(2)  5                                * 77203
* a branch also enters #77205, where the nibbles decode as addrslot
        NIBASC  "PVARS"                          * 77205
        CON(3)  #15E                             * 7720F  command
H002.PVIEW:
        CON(2)  5                                * 77212
        NIBASC  "PVIEW"                          * 77214
        CON(3)  #0CA                             * 7721E  command
H002.QUOTE:
        CON(2)  5                                * 77221
* a branch also enters #77223, where the nibbles decode as addrslot
        NIBASC  "QUOTE"                          * 77223
        CON(3)  #101                             * 7722D  command
H002.RATIO:
        CON(2)  5                                * 77230
* a branch also enters #77232, where the nibbles decode as addrslot
        NIBASC  "RATIO"                          * 77232
        CON(3)  #10C                             * 7723C  command
H002.ROLLD:
        CON(2)  5                                * 7723F
* a branch also enters #77241, where the nibbles decode as addrslot
        NIBASC  "ROLLD"                          * 77241
        CON(3)  #119                             * 7724B  command
H002.RULES:
        CON(2)  5                                * 7724E
* a branch also enters #77250, where the nibbles decode as addrslot
        NIBASC  "RULES"                          * 77250
        CON(3)  #14F                             * 7725A  command
H002.SCALE:
        CON(2)  5                                * 7725D
* a branch also enters #7725F, where the nibbles decode as addrslot
        NIBASC  "SCALE"                          * 7725F
        CON(3)  #0C2                             * 77269  command
H002.SCONJ:
        CON(2)  5                                * 7726C
* a branch also enters #7726E, where the nibbles decode as addrslot
        NIBASC  "SCONJ"                          * 7726E
        CON(3)  #146                             * 77278  command
H002.SRECV:
        CON(2)  5                                * 7727B
* a branch also enters #7727D, where the nibbles decode as addrslot
        NIBASC  "SRECV"                          * 7727D
        CON(3)  #168                             * 77287  command
H002.STIME:
        CON(2)  5                                * 7728A
        NIBASC  "STIME"                          * 7728C
        CON(3)  #177                             * 77296  command
H002.TAYLR:
        CON(2)  5                                * 77299
        NIBASC  "TAYLR"                          * 7729B
        CON(3)  #153                             * 772A5  command
H002.TICKS:
        CON(2)  5                                * 772A8
* a branch also enters #772AA, where the nibbles decode as addrslot
        NIBASC  "TICKS"                          * 772AA
        CON(3)  #012                             * 772B4  command
H002.TLINE:
        CON(2)  5                                * 772B7
        NIBASC  "TLINE"                          * 772B9
        CON(3)  #0CF                             * 772C3  command
H002.TMENU:
        CON(2)  5                                * 772C6
* a branch also enters #772C8, where the nibbles decode as addrslot
        NIBASC  "TMENU"                          * 772C8
        CON(3)  #15B                             * 772D2  command
H002.TRUTH:
        CON(2)  5                                * 772D5
* a branch also enters #772D7, where the nibbles decode as addrslot
        NIBASC  "TRUTH"                          * 772D7
        CON(3)  #0E0                             * 772E1  command
H002.TVARS:
        CON(2)  5                                * 772E4
* a branch also enters #772E6, where the nibbles decode as addrslot
        NIBASC  "TVARS"                          * 772E6
        CON(3)  #025                             * 772F0  command
H002.UBASE:
        CON(2)  5                                * 772F3
* a branch also enters #772F5, where the nibbles decode as addrslot
        NIBASC  "UBASE"                          * 772F5
        CON(3)  #00E                             * 772FF  command
H002.UFACT:
        CON(2)  5                                * 77302
* a branch also enters #77304, where the nibbles decode as addrslot
        NIBASC  "UFACT"                          * 77304
        CON(3)  #00F                             * 7730E  command
H002.UPDIR:
        CON(2)  5                                * 77311
* a branch also enters #77313, where the nibbles decode as addrslot
        NIBASC  "UPDIR"                          * 77313
        CON(3)  #023                             * 7731D  command
H002.VTYPE:
        CON(2)  5                                * 77320
        NIBASC  "VTYPE"                          * 77322
        CON(3)  #0A7                             * 7732C  command
H002.WSLOG:
        CON(2)  5                                * 7732F
* a branch also enters #77331, where the nibbles decode as addrslot
        NIBASC  "WSLOG"                          * 77331
        CON(3)  #013                             * 7733B  command
H002.XROOT:
        CON(2)  5                                * 7733E
* a branch also enters #77340, where the nibbles decode as addrslot
        NIBASC  "XROOT"                          * 77340
        CON(3)  #04A                             * 7734A  command
H002.ΣLINE:
        CON(2)  5                                * 7734D
        NIBASC  "ΣLINE"                          * 7734F
        CON(3)  #13A                             * 77359  command
H002.→ARRY:
        CON(2)  5                                * 7735C
* a branch also enters #7735E, where the nibbles decode as addrslot
        NIBASC  "→ARRY"                          * 7735E
        CON(3)  #0AA                             * 77368  command
H002.→GROB:
        CON(2)  5                                * 7736B
* a branch also enters #7736D, where the nibbles decode as addrslot
        NIBASC  "→GROB"                          * 7736D
        CON(3)  #0D7                             * 77377  command
H002.→LIST:
        CON(2)  5                                * 7737A
        NIBASC  "→LIST"                          * 7737C
        CON(3)  #098                             * 77386  command
H002.→UNIT:
        CON(2)  5                                * 77389
        NIBASC  "→UNIT"                          * 7738B
        CON(3)  #00D                             * 77395  command
H002.→DATE:
        CON(2)  5                                * 77398
        NIBASC  "→DATE"                          * 7739A
        CON(3)  #016                             * 773A4  command
H002.→TIME:
        CON(2)  5                                * 773A7
        NIBASC  "→TIME"                          * 773A9
        CON(3)  #017                             * 773B3  command
H002.ACKALL:
        CON(2)  6                                * 773B6
        NIBASC  "ACKALL"                         * 773B8
        CON(3)  #014                             * 773C4  command
H002.ATTACH:
        CON(2)  6                                * 773C7
        NIBASC  "ATTACH"                         * 773C9
        CON(3)  #165                             * 773D5  command
H002.BUFLEN:
        CON(2)  6                                * 773D8
        NIBASC  "BUFLEN"                         * 773DA
        CON(3)  #176                             * 773E6  command
H002.CLKADJ:
        CON(2)  6                                * 773E9
        NIBASC  "CLKADJ"                         * 773EB
        CON(3)  #018                             * 773F7  command
H002.DEFINE:
        CON(2)  6                                * 773FA
        NIBASC  "DEFINE"                         * 773FC
        CON(3)  #156                             * 77408  command
H002.DETACH:
        CON(2)  6                                * 7740B
        NIBASC  "DETACH"                         * 7740D
        CON(3)  #166                             * 77419  command
H002.EXPFIT:
        CON(2)  6                                * 7741C
        NIBASC  "EXPFIT"                         * 7741E
        CON(3)  #141                             * 7742A  command
H002.FINISH:
        CON(2)  6                                * 7742D
        NIBASC  "FINISH"                         * 7742F
        CON(3)  #16F                             * 7743B  command
H002.FREEZE:
        CON(2)  6                                * 7743E
        NIBASC  "FREEZE"                         * 77440
        CON(3)  #033                             * 7744C  command
H002.LINFIT:
        CON(2)  6                                * 7744F
        NIBASC  "LINFIT"                         * 77451
        CON(3)  #13F                             * 7745D  command
H002.LOGFIT:
        CON(2)  6                                * 77460
        NIBASC  "LOGFIT"                         * 77462
        CON(3)  #140                             * 7746E  command
H002.OLDPRT:
        CON(2)  6                                * 77471
        NIBASC  "OLDPRT"                         * 77473
        CON(3)  #0EF                             * 7747F  command
H002.OPENIO:
        CON(2)  6                                * 77482
        NIBASC  "OPENIO"                         * 77484
        CON(3)  #169                             * 77490  command
H002.PARITY:
        CON(2)  6                                * 77493
        NIBASC  "PARITY"                         * 77495
        CON(3)  #173                             * 774A1  command
H002.PIXOFF:
        CON(2)  6                                * 774A4
        NIBASC  "PIXOFF"                         * 774A6
        CON(3)  #0CC                             * 774B2  command
H002.PWRFIT:
        CON(2)  6                                * 774B5
        NIBASC  "PWRFIT"                         * 774B7
        CON(3)  #142                             * 774C3  command
H002.SERVER:
        CON(2)  6                                * 774C6
        NIBASC  "SERVER"                         * 774C8
        CON(3)  #170                             * 774D4  command
H002.↓MATCH:
        CON(2)  6                                * 774D7
        NIBASC  "↓MATCH"                         * 774D9
        CON(3)  #10A                             * 774E5  command
H002.↑MATCH:
        CON(2)  6                                * 774E8
        NIBASC  "↑MATCH"                         * 774EA
        CON(3)  #109                             * 774F6  command
H002.ARCHIVE:
        CON(2)  7                                * 774F9
* a branch also enters #774FB, where the nibbles decode as addrslot
        NIBASC  "ARCHIVE"                        * 774FB
        CON(3)  #160                             * 77509  command
H002.BARPLOT:
        CON(2)  7                                * 7750C
* a branch also enters #7750E, where the nibbles decode as addrslot
        NIBASC  "BARPLOT"                        * 7750E
        CON(3)  #13C                             * 7751C  command
H002.BESTFIT:
        CON(2)  7                                * 7751F
* a branch also enters #77521, where the nibbles decode as addrslot
        NIBASC  "BESTFIT"                        * 77521
        CON(3)  #143                             * 7752F  command
H002.CLOSEIO:
        CON(2)  7                                * 77532
* a branch also enters #77534, where the nibbles decode as addrslot
        NIBASC  "CLOSEIO"                        * 77534
        CON(3)  #16A                             * 77542  command
H002.CONVERT:
        CON(2)  7                                * 77545
* a branch also enters #77547, where the nibbles decode as addrslot
        NIBASC  "CONVERT"                        * 77547
        CON(3)  #00B                             * 77555  command
H002.DELKEYS:
        CON(2)  7                                * 77558
        NIBASC  "DELKEYS"                        * 7755A
        CON(3)  #17D                             * 77568  command
H002.LASTARG:
        CON(2)  7                                * 7756B
        NIBASC  "LASTARG"                        * 7756D
        CON(3)  #036                             * 7757B  command
H002.PICTURE:
        CON(2)  7                                * 7757E
        NIBASC  "PICTURE"                        * 77580
        CON(3)  #0C8                             * 7758E  command
H002.RCLKEYS:
        CON(2)  7                                * 77591
        NIBASC  "RCLKEYS"                        * 77593
        CON(3)  #17E                             * 775A1  command
H002.RCLMENU:
        CON(2)  7                                * 775A4
        NIBASC  "RCLMENU"                        * 775A6
        CON(3)  #15D                             * 775B4  command
H002.RESTORE:
        CON(2)  7                                * 775B7
        NIBASC  "RESTORE"                        * 775B9
        CON(3)  #161                             * 775C7  command
H002.SCATTER:
        CON(2)  7                                * 775CA
        NIBASC  "SCATTER"                        * 775CC
        CON(3)  #0E1                             * 775DA  command
H002.STOKEYS:
        CON(2)  7                                * 775DD
        NIBASC  "STOKEYS"                        * 775DF
        CON(3)  #17C                             * 775ED  command
H002.SYSEVAL:
        CON(2)  7                                * 775F0
        NIBASC  "SYSEVAL"                        * 775F2
        CON(3)  #031                             * 77600  command
H002.TRANSIO:
        CON(2)  7                                * 77603
        NIBASC  "TRANSIO"                        * 77605
        CON(3)  #174                             * 77613  command
H002.DELALARM:
        CON(2)  8                                * 77616
* a branch also enters #77618, where the nibbles decode as addrslot
        NIBASC  "DELALARM"                       * 77618
        CON(3)  #01C                             * 77628  command
H002.FUNCTION:
        CON(2)  8                                * 7762B
* a branch also enters #7762D, where the nibbles decode as addrslot
        NIBASC  "FUNCTION"                       * 7762D
        CON(3)  #0DC                             * 7763D  command
H002.HISTPLOT:
        CON(2)  8                                * 77640
        NIBASC  "HISTPLOT"                       * 77642
        CON(3)  #13D                             * 77652  command
H002.RCLALARM:
        CON(2)  8                                * 77655
        NIBASC  "RCLALARM"                       * 77657
        CON(3)  #01A                             * 77667  command
H002.STOALARM:
        CON(2)  8                                * 7766A
        NIBASC  "STOALARM"                       * 7766C
        CON(3)  #019                             * 7767C  command
H002.FINDALARM:
        CON(2)  9                                * 7767F
        NIBASC  "FINDALARM"                      * 77681
        CON(3)  #01B                             * 77693  command
H002.HISTOGRAM:
        CON(2)  9                                * 77696
        NIBASC  "HISTOGRAM"                      * 77698
        CON(3)  #0E2                             * 776AA  command
H002.SCATRPLOT:
        CON(2)  9                                * 776AD
        NIBASC  "SCATRPLOT"                      * 776AF
        CON(3)  #13E                             * 776C1  command
H002.PARAMETRIC:
        CON(2)  10                               * 776C4
        NIBASC  "PARAMETRIC"                     * 776C6
        CON(3)  #0DF                             * 776DA  command
L_776DD:
        CON(5)  (*)-H002.ASR                     * 776DD  name of command 000
        CON(5)  (*)-H002.RL                      * 776E2  name of command 001
        CON(5)  (*)-H002.RLB                     * 776E7  name of command 002
        CON(5)  (*)-H002.RR                      * 776EC  name of command 003
        CON(5)  (*)-H002.RRB                     * 776F1  name of command 004
        CON(5)  (*)-H002.SL                      * 776F6  name of command 005
        CON(5)  (*)-H002.SLB                     * 776FB  name of command 006
        CON(5)  (*)-H002.SR                      * 77700  name of command 007
        CON(5)  (*)-H002.SRB                     * 77705  name of command 008
* a branch also enters #7770A, where the nibbles decode as addrslot
        CON(5)  (*)-H002.R→B                     * 7770A  name of command 009
        CON(5)  (*)-H002.B→R                     * 7770F  name of command 00A
        CON(5)  (*)-H002.CONVERT                 * 77714  name of command 00B
        CON(5)  (*)-H002.UVAL                    * 77719  name of command 00C
        CON(5)  (*)-H002.→UNIT                   * 7771E  name of command 00D
        CON(5)  (*)-H002.UBASE                   * 77723  name of command 00E
        CON(5)  (*)-H002.UFACT                   * 77728  name of command 00F
        CON(5)  (*)-H002.TIME                    * 7772D  name of command 010
        CON(5)  (*)-H002.DATE                    * 77732  name of command 011
        CON(5)  (*)-H002.TICKS                   * 77737  name of command 012
        CON(5)  (*)-H002.WSLOG                   * 7773C  name of command 013
        CON(5)  (*)-H002.ACKALL                  * 77741  name of command 014
        CON(5)  (*)-H002.ACK                     * 77746  name of command 015
        CON(5)  (*)-H002.→DATE                   * 7774B  name of command 016
        CON(5)  (*)-H002.→TIME                   * 77750  name of command 017
        CON(5)  (*)-H002.CLKADJ                  * 77755  name of command 018
        CON(5)  (*)-H002.STOALARM                * 7775A  name of command 019
        CON(5)  (*)-H002.RCLALARM                * 7775F  name of command 01A
        CON(5)  (*)-H002.FINDALARM               * 77764  name of command 01B
        CON(5)  (*)-H002.DELALARM                * 77769  name of command 01C
        CON(5)  (*)-H002.TSTR                    * 7776E  name of command 01D
        CON(5)  (*)-H002.DDAYS                   * 77773  name of command 01E
        CON(5)  (*)-H002.DATE+                   * 77778  name of command 01F
        CON(5)  (*)-H002.CRDIR                   * 7777D  name of command 020
        CON(5)  (*)-H002.PATH                    * 77782  name of command 021
* a branch also enters #77787, where the nibbles decode as addrslot
        CON(5)  (*)-H002.HOME                    * 77787  name of command 022
        CON(5)  (*)-H002.UPDIR                   * 7778C  name of command 023
        CON(5)  (*)-H002.VARS                    * 77791  name of command 024
        CON(5)  (*)-H002.TVARS                   * 77796  name of command 025
        CON(5)  (*)-H002.BYTES                   * 7779B  name of command 026
        CON(5)  (*)-H002.NEWOB                   * 777A0  name of command 027
        CON(5)  (*)-H002.KILL                    * 777A5  name of command 028
        CON(5)  (*)-H002.OFF                     * 777AA  name of command 029
        CON(5)  (*)-H002.DOERR                   * 777AF  name of command 02A
        CON(5)  (*)-H002.ERR0                    * 777B4  name of command 02B
        CON(5)  (*)-H002.ERRN                    * 777B9  name of command 02C
        CON(5)  (*)-H002.ERRM                    * 777BE  name of command 02D
        CON(5)  (*)-H002.EVAL                    * 777C3  name of command 02E
        CON(5)  (*)-H002.IFTE                    * 777C8  name of command 02F
        CON(5)  (*)-H002.IFT                     * 777CD  name of command 030
        CON(5)  (*)-H002.SYSEVAL                 * 777D2  name of command 031
        CON(5)  (*)-H002.DISP                    * 777D7  name of command 032
        CON(5)  (*)-H002.FREEZE                  * 777DC  name of command 033
        CON(5)  (*)-H002.BEEP                    * 777E1  name of command 034
        CON(5)  (*)-H002.→NUM                    * 777E6  name of command 035
        CON(5)  (*)-H002.LASTARG                 * 777EB  name of command 036
        CON(5)  (*)-H002.WAIT                    * 777F0  name of command 037
        CON(5)  (*)-H002.CLLCD                   * 777F5  name of command 038
        CON(5)  (*)-H002.KEY                     * 777FA  name of command 039
        CON(5)  (*)-H002.CONT                    * 777FF  name of command 03A
* a branch also enters #77804, where the nibbles decode as addrslot
        CON(5)  (*)-H002.=                       * 77804  name of command 03B
        CON(5)  (*)-H002.NEG                     * 77809  name of command 03C
* a branch also enters #7780E, where the nibbles decode as addrslot
        CON(5)  (*)-H002.ABS                     * 7780E  name of command 03D
        CON(5)  (*)-H002.CONJ                    * 77813  name of command 03E
        CON(5)  (*)-H002.π                       * 77818  name of command 03F
        CON(5)  (*)-H002.MAXR                    * 7781D  name of command 040
        CON(5)  (*)-H002.MINR                    * 77822  name of command 041
        CON(5)  (*)-H002.e                       * 77827  name of command 042
        CON(5)  (*)-H002.i                       * 7782C  name of command 043
* a branch also enters #77831, where the nibbles decode as addrslot
        CON(5)  (*)-H002.+                       * 77831  name of command 044
        CON(5)  (*)-H002.+                       * 77836  name of command 045
* a branch also enters #7783B, where the nibbles decode as addrslot
        CON(5)  (*)-H002.-                       * 7783B  name of command 046
* a branch also enters #77840, where the nibbles decode as addrslot
        CON(5)  (*)-H002.*                       * 77840  name of command 047
* a branch also enters #77845, where the nibbles decode as addrslot
        CON(5)  (*)-H002./                       * 77845  name of command 048
* a branch also enters #7784A, where the nibbles decode as addrslot
        CON(5)  (*)-H002.^                       * 7784A  name of command 049
        CON(5)  (*)-H002.XROOT                   * 7784F  name of command 04A
        CON(5)  (*)-H002.XROOT                   * 77854  name of command 04B
        CON(5)  (*)-H002.INV                     * 77859  name of command 04C
        CON(5)  (*)-H002.ARG                     * 7785E  name of command 04D
        CON(5)  (*)-H002.SIGN                    * 77863  name of command 04E
        CON(5)  (*)-H002.√                       * 77868  name of command 04F
        CON(5)  (*)-H002.SQ                      * 7786D  name of command 050
* a branch also enters #77872, where the nibbles decode as addrslot
        CON(5)  (*)-H002.SIN                     * 77872  name of command 051
        CON(5)  (*)-H002.COS                     * 77877  name of command 052
* a branch also enters #7787C, where the nibbles decode as addrslot
        CON(5)  (*)-H002.TAN                     * 7787C  name of command 053
        CON(5)  (*)-H002.SINH                    * 77881  name of command 054
        CON(5)  (*)-H002.COSH                    * 77886  name of command 055
        CON(5)  (*)-H002.TANH                    * 7788B  name of command 056
        CON(5)  (*)-H002.ASIN                    * 77890  name of command 057
        CON(5)  (*)-H002.ACOS                    * 77895  name of command 058
        CON(5)  (*)-H002.ATAN                    * 7789A  name of command 059
        CON(5)  (*)-H002.ASINH                   * 7789F  name of command 05A
        CON(5)  (*)-H002.ACOSH                   * 778A4  name of command 05B
        CON(5)  (*)-H002.ATANH                   * 778A9  name of command 05C
        CON(5)  (*)-H002.EXP                     * 778AE  name of command 05D
        CON(5)  (*)-H002.LN                      * 778B3  name of command 05E
        CON(5)  (*)-H002.LOG                     * 778B8  name of command 05F
        CON(5)  (*)-H002.ALOG                    * 778BD  name of command 060
        CON(5)  (*)-H002.LNP1                    * 778C2  name of command 061
        CON(5)  (*)-H002.EXPM                    * 778C7  name of command 062
        CON(5)  (*)-H002.!                       * 778CC  name of command 063
        CON(5)  (*)-H002.FACT                    * 778D1  name of command 064
        CON(5)  (*)-H002.IP                      * 778D6  name of command 065
        CON(5)  (*)-H002.FP                      * 778DB  name of command 066
        CON(5)  (*)-H002.FLOOR                   * 778E0  name of command 067
        CON(5)  (*)-H002.CEIL                    * 778E5  name of command 068
        CON(5)  (*)-H002.XPON                    * 778EA  name of command 069
        CON(5)  (*)-H002.MAX                     * 778EF  name of command 06A
        CON(5)  (*)-H002.MIN                     * 778F4  name of command 06B
        CON(5)  (*)-H002.RND                     * 778F9  name of command 06C
        CON(5)  (*)-H002.TRNC                    * 778FE  name of command 06D
        CON(5)  (*)-H002.MOD                     * 77903  name of command 06E
        CON(5)  (*)-H002.MANT                    * 77908  name of command 06F
        CON(5)  (*)-H002.D→R                     * 7790D  name of command 070
        CON(5)  (*)-H002.R→D                     * 77912  name of command 071
        CON(5)  (*)-H002.→HMS                    * 77917  name of command 072
        CON(5)  (*)-H002.HMS→                    * 7791C  name of command 073
        CON(5)  (*)-H002.HMS+                    * 77921  name of command 074
        CON(5)  (*)-H002.HMS-                    * 77926  name of command 075
        CON(5)  (*)-H002.RNRM                    * 7792B  name of command 076
        CON(5)  (*)-H002.CNRM                    * 77930  name of command 077
        CON(5)  (*)-H002.DET                     * 77935  name of command 078
* a branch also enters #7793A, where the nibbles decode as addrslot
        CON(5)  (*)-H002.DOT                     * 7793A  name of command 079
* a branch also enters #7793F, where the nibbles decode as addrslot
        CON(5)  (*)-H002.CROSS                   * 7793F  name of command 07A
        CON(5)  (*)-H002.RSD                     * 77944  name of command 07B
        CON(5)  (*)-H002.%                       * 77949  name of command 07C
        CON(5)  (*)-H002.%T                      * 7794E  name of command 07D
        CON(5)  (*)-H002.%CH                     * 77953  name of command 07E
        CON(5)  (*)-H002.RAND                    * 77958  name of command 07F
        CON(5)  (*)-H002.RDZ                     * 7795D  name of command 080
        CON(5)  (*)-H002.COMB                    * 77962  name of command 081
        CON(5)  (*)-H002.PERM                    * 77967  name of command 082
        CON(5)  (*)-H002.SF                      * 7796C  name of command 083
        CON(5)  (*)-H002.CF                      * 77971  name of command 084
        CON(5)  (*)-H002.FS?                     * 77976  name of command 085
        CON(5)  (*)-H002.FC?                     * 7797B  name of command 086
        CON(5)  (*)-H002.DEG                     * 77980  name of command 087
        CON(5)  (*)-H002.RAD                     * 77985  name of command 088
        CON(5)  (*)-H002.GRAD                    * 7798A  name of command 089
        CON(5)  (*)-H002.FIX                     * 7798F  name of command 08A
        CON(5)  (*)-H002.SCI                     * 77994  name of command 08B
        CON(5)  (*)-H002.ENG                     * 77999  name of command 08C
        CON(5)  (*)-H002.STD                     * 7799E  name of command 08D
        CON(5)  (*)-H002.FS?C                    * 779A3  name of command 08E
        CON(5)  (*)-H002.FC?C                    * 779A8  name of command 08F
        CON(5)  (*)-H002.BIN                     * 779AD  name of command 090
        CON(5)  (*)-H002.DEC                     * 779B2  name of command 091
        CON(5)  (*)-H002.HEX                     * 779B7  name of command 092
        CON(5)  (*)-H002.OCT                     * 779BC  name of command 093
        CON(5)  (*)-H002.STWS                    * 779C1  name of command 094
        CON(5)  (*)-H002.RCWS                    * 779C6  name of command 095
        CON(5)  (*)-H002.RCLF                    * 779CB  name of command 096
        CON(5)  (*)-H002.STOF                    * 779D0  name of command 097
* a branch also enters #779D5, where the nibbles decode as addrslot
        CON(5)  (*)-H002.→LIST                   * 779D5  name of command 098
        CON(5)  (*)-H002.R→C                     * 779DA  name of command 099
        CON(5)  (*)-H002.RE                      * 779DF  name of command 09A
        CON(5)  (*)-H002.IM                      * 779E4  name of command 09B
        CON(5)  (*)-H002.SUB                     * 779E9  name of command 09C
        CON(5)  (*)-H002.REPL                    * 779EE  name of command 09D
        CON(5)  (*)-H002.LIST→                   * 779F3  name of command 09E
        CON(5)  (*)-H002.C→R                     * 779F8  name of command 09F
        CON(5)  (*)-H002.SIZE                    * 779FD  name of command 0A0
        CON(5)  (*)-H002.POS                     * 77A02  name of command 0A1
        CON(5)  (*)-H002.→STR                    * 77A07  name of command 0A2
        CON(5)  (*)-H002.STR→                    * 77A0C  name of command 0A3
        CON(5)  (*)-H002.NUM                     * 77A11  name of command 0A4
        CON(5)  (*)-H002.CHR                     * 77A16  name of command 0A5
* a branch also enters #77A1B, where the nibbles decode as addrslot
        CON(5)  (*)-H002.TYPE                    * 77A1B  name of command 0A6
        CON(5)  (*)-H002.VTYPE                   * 77A20  name of command 0A7
        CON(5)  (*)-H002.EQ→                     * 77A25  name of command 0A8
        CON(5)  (*)-H002.OBJ→                    * 77A2A  name of command 0A9
* a branch also enters #77A2F, where the nibbles decode as addrslot
        CON(5)  (*)-H002.→ARRY                   * 77A2F  name of command 0AA
        CON(5)  (*)-H002.ARRY→                   * 77A34  name of command 0AB
        CON(5)  (*)-H002.RDM                     * 77A39  name of command 0AC
        CON(5)  (*)-H002.CON                     * 77A3E  name of command 0AD
        CON(5)  (*)-H002.IDN                     * 77A43  name of command 0AE
        CON(5)  (*)-H002.TRN                     * 77A48  name of command 0AF
        CON(5)  (*)-H002.PUT                     * 77A4D  name of command 0B0
        CON(5)  (*)-H002.PUTI                    * 77A52  name of command 0B1
        CON(5)  (*)-H002.GET                     * 77A57  name of command 0B2
        CON(5)  (*)-H002.GETI                    * 77A5C  name of command 0B3
* a branch also enters #77A61, where the nibbles decode as addrslot
        CON(5)  (*)-H002.V→                      * 77A61  name of command 0B4
* a branch also enters #77A66, where the nibbles decode as addrslot
        CON(5)  (*)-H002.→V2                     * 77A66  name of command 0B5
* a branch also enters #77A6B, where the nibbles decode as addrslot
        CON(5)  (*)-H002.→V3                     * 77A6B  name of command 0B6
        CON(5)  (*)-H002.INDEP                   * 77A70  name of command 0B7
        CON(5)  (*)-H002.PMIN                    * 77A75  name of command 0B8
        CON(5)  (*)-H002.PMAX                    * 77A7A  name of command 0B9
        CON(5)  (*)-H002.AXES                    * 77A7F  name of command 0BA
        CON(5)  (*)-H002.CENTR                   * 77A84  name of command 0BB
        CON(5)  (*)-H002.RES                     * 77A89  name of command 0BC
        CON(5)  (*)-H002.*H                      * 77A8E  name of command 0BD
        CON(5)  (*)-H002.*W                      * 77A93  name of command 0BE
        CON(5)  (*)-H002.DRAW                    * 77A98  name of command 0BF
        CON(5)  (*)-H002.AUTO                    * 77A9D  name of command 0C0
        CON(5)  (*)-H002.DRAX                    * 77AA2  name of command 0C1
        CON(5)  (*)-H002.SCALE                   * 77AA7  name of command 0C2
        CON(5)  (*)-H002.PDIM                    * 77AAC  name of command 0C3
        CON(5)  (*)-H002.DEPND                   * 77AB1  name of command 0C4
        CON(5)  (*)-H002.ERASE                   * 77AB6  name of command 0C5
        CON(5)  (*)-H002.PX→C                    * 77ABB  name of command 0C6
        CON(5)  (*)-H002.C→PX                    * 77AC0  name of command 0C7
        CON(5)  (*)-H002.PICTURE                 * 77AC5  name of command 0C8
        CON(5)  (*)-H002.LABEL                   * 77ACA  name of command 0C9
        CON(5)  (*)-H002.PVIEW                   * 77ACF  name of command 0CA
        CON(5)  (*)-H002.PIXON                   * 77AD4  name of command 0CB
        CON(5)  (*)-H002.PIXOFF                  * 77AD9  name of command 0CC
        CON(5)  (*)-H002.PIX?                    * 77ADE  name of command 0CD
        CON(5)  (*)-H002.LINE                    * 77AE3  name of command 0CE
        CON(5)  (*)-H002.TLINE                   * 77AE8  name of command 0CF
        CON(5)  (*)-H002.BOX                     * 77AED  name of command 0D0
        CON(5)  (*)-H002.BLANK                   * 77AF2  name of command 0D1
* a branch also enters #77AF7, where the nibbles decode as addrslot
        CON(5)  (*)-H002.PICT                    * 77AF7  name of command 0D2
        CON(5)  (*)-H002.GOR                     * 77AFC  name of command 0D3
        CON(5)  (*)-H002.GXOR                    * 77B01  name of command 0D4
        CON(5)  (*)-H002.LCD→                    * 77B06  name of command 0D5
        CON(5)  (*)-H002.→LCD                    * 77B0B  name of command 0D6
        CON(5)  (*)-H002.→GROB                   * 77B10  name of command 0D7
        CON(5)  (*)-H002.ARC                     * 77B15  name of command 0D8
        CON(5)  (*)-H002.TEXT                    * 77B1A  name of command 0D9
        CON(5)  (*)-H002.XRNG                    * 77B1F  name of command 0DA
        CON(5)  (*)-H002.YRNG                    * 77B24  name of command 0DB
        CON(5)  (*)-H002.FUNCTION                * 77B29  name of command 0DC
        CON(5)  (*)-H002.CONIC                   * 77B2E  name of command 0DD
        CON(5)  (*)-H002.POLAR                   * 77B33  name of command 0DE
        CON(5)  (*)-H002.PARAMETRIC              * 77B38  name of command 0DF
        CON(5)  (*)-H002.TRUTH                   * 77B3D  name of command 0E0
        CON(5)  (*)-H002.SCATTER                 * 77B42  name of command 0E1
        CON(5)  (*)-H002.HISTOGRAM               * 77B47  name of command 0E2
        CON(5)  (*)-H002.BAR                     * 77B4C  name of command 0E3
        CON(5)  (*)-H002.SAME                    * 77B51  name of command 0E4
        CON(5)  (*)-H002.AND                     * 77B56  name of command 0E5
        CON(5)  (*)-H002.OR                      * 77B5B  name of command 0E6
        CON(5)  (*)-H002.NOT                     * 77B60  name of command 0E7
        CON(5)  (*)-H002.XOR                     * 77B65  name of command 0E8
        CON(5)  (*)-H002.==                      * 77B6A  name of command 0E9
        CON(5)  (*)-H002.≠                       * 77B6F  name of command 0EA
        CON(5)  (*)-H002.<                       * 77B74  name of command 0EB
        CON(5)  (*)-H002.>                       * 77B79  name of command 0EC
        CON(5)  (*)-H002.≤                       * 77B7E  name of command 0ED
        CON(5)  (*)-H002.≥                       * 77B83  name of command 0EE
        CON(5)  (*)-H002.OLDPRT                  * 77B88  name of command 0EF
        CON(5)  (*)-H002.PR1                     * 77B8D  name of command 0F0
        CON(5)  (*)-H002.PRSTC                   * 77B92  name of command 0F1
        CON(5)  (*)-H002.PRST                    * 77B97  name of command 0F2
        CON(5)  (*)-H002.CR                      * 77B9C  name of command 0F3
        CON(5)  (*)-H002.PRVAR                   * 77BA1  name of command 0F4
        CON(5)  (*)-H002.DELAY                   * 77BA6  name of command 0F5
        CON(5)  (*)-H002.PRLCD                   * 77BAB  name of command 0F6
        CON(5)  (*)-H002.∂                       * 77BB0  name of command 0F7
        CON(5)  (*)-H002.∂                       * 77BB5  name of command 0F8
        CON(5)  (*)-H002.RCEQ                    * 77BBA  name of command 0F9
        CON(5)  (*)-H002.STEQ                    * 77BBF  name of command 0FA
        CON(5)  (*)-H002.ROOT                    * 77BC4  name of command 0FB
        CON(5)  (*)-H002.∫                       * 77BC9  name of command 0FC
        CON(5)  (*)-H002.∫                       * 77BCE  name of command 0FD
        CON(5)  (*)-H002.Σ                       * 77BD3  name of command 0FE
        CON(5)  (*)-H002.|                       * 77BD8  name of command 0FF
        CON(5)  (*)-H002.|                       * 77BDD  name of command 100
        CON(5)  (*)-H002.QUOTE                   * 77BE2  name of command 101
        CON(5)  (*)-H002.APPLY                   * 77BE7  name of command 102
        CON(5)  (*)-H002.APPLY                   * 77BEC  name of command 103
        CON(5)  0                                * 77BF1  command 104 has no name
        CON(5)  0                                * 77BF6  command 105 has no name
        CON(5)  0                                * 77BFB  command 106 has no name
        CON(5)  (*)-H002.→Q                      * 77C00  name of command 107
        CON(5)  (*)-H002.→Qπ                     * 77C05  name of command 108
        CON(5)  (*)-H002.↑MATCH                  * 77C0A  name of command 109
        CON(5)  (*)-H002.↓MATCH                  * 77C0F  name of command 10A
        CON(5)  (*)-H002._                       * 77C14  name of command 10B
        CON(5)  (*)-H002.RATIO                   * 77C19  name of command 10C
        CON(5)  (*)-H002.DUP                     * 77C1E  name of command 10D
        CON(5)  (*)-H002.DUP2                    * 77C23  name of command 10E
* a branch also enters #77C28, where the nibbles decode as addrslot
        CON(5)  (*)-H002.SWAP                    * 77C28  name of command 10F
        CON(5)  (*)-H002.DROP                    * 77C2D  name of command 110
        CON(5)  (*)-H002.DROP2                   * 77C32  name of command 111
        CON(5)  (*)-H002.ROT                     * 77C37  name of command 112
        CON(5)  (*)-H002.OVER                    * 77C3C  name of command 113
        CON(5)  (*)-H002.DEPTH                   * 77C41  name of command 114
        CON(5)  (*)-H002.DROPN                   * 77C46  name of command 115
        CON(5)  (*)-H002.DUPN                    * 77C4B  name of command 116
        CON(5)  (*)-H002.PICK                    * 77C50  name of command 117
        CON(5)  (*)-H002.ROLL                    * 77C55  name of command 118
        CON(5)  (*)-H002.ROLLD                   * 77C5A  name of command 119
        CON(5)  (*)-H002.CLEAR                   * 77C5F  name of command 11A
        CON(5)  (*)-H002.STOΣ                    * 77C64  name of command 11B
        CON(5)  (*)-H002.CLΣ                     * 77C69  name of command 11C
        CON(5)  (*)-H002.RCLΣ                    * 77C6E  name of command 11D
        CON(5)  (*)-H002.Σ+                      * 77C73  name of command 11E
        CON(5)  (*)-H002.Σ-                      * 77C78  name of command 11F
        CON(5)  (*)-H002.NΣ                      * 77C7D  name of command 120
        CON(5)  (*)-H002.CORR                    * 77C82  name of command 121
        CON(5)  (*)-H002.COV                     * 77C87  name of command 122
        CON(5)  (*)-H002.ΣX                      * 77C8C  name of command 123
        CON(5)  (*)-H002.ΣY                      * 77C91  name of command 124
        CON(5)  (*)-H002.ΣX^2                    * 77C96  name of command 125
        CON(5)  (*)-H002.ΣY^2                    * 77C9B  name of command 126
        CON(5)  (*)-H002.ΣX*Y                    * 77CA0  name of command 127
        CON(5)  (*)-H002.MAXΣ                    * 77CA5  name of command 128
        CON(5)  (*)-H002.MEAN                    * 77CAA  name of command 129
        CON(5)  (*)-H002.MINΣ                    * 77CAF  name of command 12A
        CON(5)  (*)-H002.SDEV                    * 77CB4  name of command 12B
        CON(5)  (*)-H002.TOT                     * 77CB9  name of command 12C
        CON(5)  (*)-H002.VAR                     * 77CBE  name of command 12D
        CON(5)  (*)-H002.LR                      * 77CC3  name of command 12E
        CON(5)  (*)-H002.PREDV                   * 77CC8  name of command 12F
        CON(5)  (*)-H002.PREDY                   * 77CCD  name of command 130
        CON(5)  (*)-H002.PREDX                   * 77CD2  name of command 131
        CON(5)  (*)-H002.XCOL                    * 77CD7  name of command 132
        CON(5)  (*)-H002.YCOL                    * 77CDC  name of command 133
        CON(5)  (*)-H002.UTPC                    * 77CE1  name of command 134
        CON(5)  (*)-H002.UTPN                    * 77CE6  name of command 135
        CON(5)  (*)-H002.UTPF                    * 77CEB  name of command 136
        CON(5)  (*)-H002.UTPT                    * 77CF0  name of command 137
        CON(5)  (*)-H002.COLΣ                    * 77CF5  name of command 138
        CON(5)  (*)-H002.SCLΣ                    * 77CFA  name of command 139
        CON(5)  (*)-H002.ΣLINE                   * 77CFF  name of command 13A
        CON(5)  (*)-H002.BINS                    * 77D04  name of command 13B
        CON(5)  (*)-H002.BARPLOT                 * 77D09  name of command 13C
        CON(5)  (*)-H002.HISTPLOT                * 77D0E  name of command 13D
        CON(5)  (*)-H002.SCATRPLOT               * 77D13  name of command 13E
        CON(5)  (*)-H002.LINFIT                  * 77D18  name of command 13F
        CON(5)  (*)-H002.LOGFIT                  * 77D1D  name of command 140
        CON(5)  (*)-H002.EXPFIT                  * 77D22  name of command 141
        CON(5)  (*)-H002.PWRFIT                  * 77D27  name of command 142
        CON(5)  (*)-H002.BESTFIT                 * 77D2C  name of command 143
        CON(5)  (*)-H002.SINV                    * 77D31  name of command 144
        CON(5)  (*)-H002.SNEG                    * 77D36  name of command 145
        CON(5)  (*)-H002.SCONJ                   * 77D3B  name of command 146
        CON(5)  (*)-H002.STO+                    * 77D40  name of command 147
        CON(5)  (*)-H002.STO-                    * 77D45  name of command 148
        CON(5)  (*)-H002.STO/                    * 77D4A  name of command 149
        CON(5)  (*)-H002.STO*                    * 77D4F  name of command 14A
        CON(5)  (*)-H002.INCR                    * 77D54  name of command 14B
        CON(5)  (*)-H002.DECR                    * 77D59  name of command 14C
        CON(5)  (*)-H002.COLCT                   * 77D5E  name of command 14D
        CON(5)  (*)-H002.EXPAN                   * 77D63  name of command 14E
        CON(5)  (*)-H002.RULES                   * 77D68  name of command 14F
        CON(5)  (*)-H002.ISOL                    * 77D6D  name of command 150
        CON(5)  (*)-H002.QUAD                    * 77D72  name of command 151
        CON(5)  (*)-H002.SHOW                    * 77D77  name of command 152
        CON(5)  (*)-H002.TAYLR                   * 77D7C  name of command 153
        CON(5)  (*)-H002.RCL                     * 77D81  name of command 154
* a branch also enters #77D86, where the nibbles decode as addrslot
        CON(5)  (*)-H002.STO                     * 77D86  name of command 155
        CON(5)  (*)-H002.DEFINE                  * 77D8B  name of command 156
        CON(5)  (*)-H002.PURGE                   * 77D90  name of command 157
        CON(5)  (*)-H002.MEM                     * 77D95  name of command 158
        CON(5)  (*)-H002.ORDER                   * 77D9A  name of command 159
        CON(5)  (*)-H002.CLVAR                   * 77D9F  name of command 15A
        CON(5)  (*)-H002.TMENU                   * 77DA4  name of command 15B
        CON(5)  (*)-H002.MENU                    * 77DA9  name of command 15C
        CON(5)  (*)-H002.RCLMENU                 * 77DAE  name of command 15D
        CON(5)  (*)-H002.PVARS                   * 77DB3  name of command 15E
        CON(5)  (*)-H002.PGDIR                   * 77DB8  name of command 15F
        CON(5)  (*)-H002.ARCHIVE                 * 77DBD  name of command 160
        CON(5)  (*)-H002.RESTORE                 * 77DC2  name of command 161
        CON(5)  (*)-H002.MERGE                   * 77DC7  name of command 162
        CON(5)  (*)-H002.FREE                    * 77DCC  name of command 163
        CON(5)  (*)-H002.LIBS                    * 77DD1  name of command 164
        CON(5)  (*)-H002.ATTACH                  * 77DD6  name of command 165
        CON(5)  (*)-H002.DETACH                  * 77DDB  name of command 166
        CON(5)  (*)-H002.XMIT                    * 77DE0  name of command 167
        CON(5)  (*)-H002.SRECV                   * 77DE5  name of command 168
        CON(5)  (*)-H002.OPENIO                  * 77DEA  name of command 169
        CON(5)  (*)-H002.CLOSEIO                 * 77DEF  name of command 16A
        CON(5)  (*)-H002.SEND                    * 77DF4  name of command 16B
        CON(5)  (*)-H002.KGET                    * 77DF9  name of command 16C
        CON(5)  (*)-H002.RECN                    * 77DFE  name of command 16D
        CON(5)  (*)-H002.RECV                    * 77E03  name of command 16E
        CON(5)  (*)-H002.FINISH                  * 77E08  name of command 16F
        CON(5)  (*)-H002.SERVER                  * 77E0D  name of command 170
        CON(5)  (*)-H002.CKSM                    * 77E12  name of command 171
        CON(5)  (*)-H002.BAUD                    * 77E17  name of command 172
        CON(5)  (*)-H002.PARITY                  * 77E1C  name of command 173
        CON(5)  (*)-H002.TRANSIO                 * 77E21  name of command 174
        CON(5)  (*)-H002.KERRM                   * 77E26  name of command 175
        CON(5)  (*)-H002.BUFLEN                  * 77E2B  name of command 176
        CON(5)  (*)-H002.STIME                   * 77E30  name of command 177
        CON(5)  (*)-H002.SBRK                    * 77E35  name of command 178
        CON(5)  (*)-H002.PKT                     * 77E3A  name of command 179
        CON(5)  (*)-H002.INPUT                   * 77E3F  name of command 17A
        CON(5)  (*)-H002.ASN                     * 77E44  name of command 17B
        CON(5)  (*)-H002.STOKEYS                 * 77E49  name of command 17C
        CON(5)  (*)-H002.DELKEYS                 * 77E4E  name of command 17D
        CON(5)  (*)-H002.RCLKEYS                 * 77E53  name of command 17E
        CON(5)  (*)-H002.→TAG                    * 77E58  name of command 17F
        CON(5)  (*)-H002.DTAG                    * 77E5D  name of command 180
        ENDLENGTH                                * 77E62

* refs (3): 2C147 2C172 2C1A2
SUB_77E62:
        D1=D1+  15                               * 77E62
        D=D+1   A                                * 77E65
        D=D+1   A                                * 77E67
        D=D+1   A                                * 77E69
        GOSBVL  SAVPTR                           * 77E6B
        D0=(5)  IRAMBUFF                         * 77E72
        LC(5)   #00002                           * 77E79
        D=C     A                                * 77E80
        SETDEC                                   * 77E82
L_77E84:
        D1=D1-  5                                * 77E84
        C=DAT1  A                                * 77E87
        CD1EX                                    * 77E8A
        D1=D1+  5                                * 77E8D
        A=DAT1  W                                * 77E90
        D1=C                                     * 77E94
        GOSUB   SPLITA~jump~jump                 * 77E97
        GOSUBL  PUTAB0~jump                      * 77E9B
        D=D-1   A                                * 77EA1
        GONC    L_77E84                          * 77EA3
        RTN                                      * 77EA6

* refs (1): 2C10D
utpn(3r)~1:
        GOSBVL  POP1%%                           * 77EA8
        D0=(5)  IRAMBUFF                         * 77EAF
        GOLONG  PUTAB0~jump                      * 77EB6

* refs (2): 2C114 7816F
SUB_77EBC:
        GOSUB   SUB_78591                        * 77EBC
        GOSUB   SUB_7804A                        * 77EC0
        GOSUBL  STAB0~jump_78751                 * 77EC4
        A=R4                                     * 77ECA
        C=0     W                                * 77ECD
        D1=C                                     * 77ED0
        P=      12                               * 77ED3
        LC(3)   #232                             * 77ED5
        ?ST=0   0                                * 77EDA
        GOYES   L_77EE4                          * 77EDD
        LC(3)   #350                             * 77EDF
L_77EE4:
        GOSUBL  SUB_788A7                        * 77EE4
        GONC    L_77EF1                          * 77EEA
        GOTO    L_77F8E                          * 77EED
L_77EF1:
        D1=D1+  1                                * 77EF1
        GOSUB   L_7856F                          * 77EF4
        GOSUB   SUB_78605                        * 77EF8
        GOSUBL  L_787E6                          * 77EFC
        GOSUBL  SUB_7874D                        * 77F02
        GOSUB   L_785B2                          * 77F08
        GOSUB   SUB_7806A                        * 77F0C
        GOSUBL  EXAB0~jump                       * 77F10
L_77F16:
        GOSUBL  EXAB0~jump                       * 77F16
        GOSUBL  EXAB2~jump                       * 77F1C
        GOSUB   SUB_786C3                        * 77F22
        GOSUB   SUB_786E9                        * 77F26
        GOSUB   RCCD2~jump_7870C                 * 77F2A
        GOSUB   STAB2~jump_786FD                 * 77F2E
        RSTK=C                                   * 77F32
        C=D     W                                * 77F34
        R4=C                                     * 77F37
        GOSUBL  RCCD0~jump_787ED                 * 77F3A
        GOSUBL  L_78760                          * 77F40
        B=0     S                                * 77F46
        C=R4                                     * 77F49
        CR1EX                                    * 77F4C
        C=0     S                                * 77F4F
        D=C     W                                * 77F52
        C=RSTK                                   * 77F55
        CR0EX                                    * 77F57
        ?C#A    A                                * 77F5A
        GOYES   L_77F16                          * 77F5D
        C=D     W                                * 77F5F
        ?B#C    W                                * 77F62
        GOYES   L_77F16                          * 77F65
        GOSUB   SUB_78524                        * 77F67
        ?ST=1   0                                * 77F6B
        GOYES   L_77F73                          * 77F6E
        A=-A-1  S                                * 77F70
L_77F73:
        GOTO    L_78543                          * 77F73

* refs (3): 77FB5 77FC5 77FE0
SUB_77F77:
        GOSUB   L_7856F                          * 77F77
        GOSUB   RCCD2~jump_7870C                 * 77F7B
        GOSUB   L_7858A                          * 77F7F
L_77F83:
        ?ST=0   0                                * 77F83
        RTNYES                                   * 77F86
        GOLONG  L_7838C                          * 77F88
L_77F8E:
        A=0     W                                * 77F8E
        B=0     W                                * 77F91
        GOSUB   SUB_78682                        * 77F94
        GOSUBL  SUB_787F4                        * 77F98
        BCEX    M                                * 77F9E
        GOSUB   SUB_78688                        * 77FA1
        ?ST=1   0                                * 77FA5
        GOYES   L_77FAD                          * 77FA8
        BCEX    M                                * 77FAA
L_77FAD:
        GOSUB   SUB_78676                        * 77FAD
        GOSUB   SUB_7867C                        * 77FB1
L_77FB5:
        GOSUB   SUB_77F77                        * 77FB5
        GOSUB   SUB_7861D                        * 77FB9
        P=      2                                * 77FBD
        GOSUBL  TST15~jump_789D7                 * 77FBF
        GOC     SUB_77F77                        * 77FC5
        GOSUB   SUB_78617                        * 77FC8
        GOSUB   SUB_78676                        * 77FCC
        GOSUB   XYEX~jump_78438                  * 77FD0
        GOSUB   SUB_7867C                        * 77FD4
        P=      2                                * 77FD8
        GOSUBL  TST15~jump_789D7                 * 77FDA
        GOC     SUB_77F77                        * 77FE0
        CD1EX                                    * 77FE3
        C=C+1   A                                * 77FE6
        GOSUB   SUB_786CA                        * 77FE8
        GOSUB   SUB_785D0                        * 77FEC
        GOSUB   SUB_78772                        * 77FF0
        GOSUBL  EXAB0~jump                       * 77FF4
        GOSUB   SUB_78682                        * 77FFA
        GOSUB   SUB_78605                        * 77FFE
