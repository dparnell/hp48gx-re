* HP 48GX ROM revision R, #86FE4-#8998D: Library 0C0: polynomial root finder for PROOT, in machine code, with one copy for complex and one for real coefficients
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: Get2ABR0 Save2ABR0 D0Back2%% PUTAB0Back MulD0%% Get2ABR0b SubCDTestb SubCDTest HypotABR0 D1Back2%%b Get2Tail MulD0%%a
* Follows on from the previous file (at #86FE4 in the original ROM).

* Library 0C0: PROOT polynomial root finder (machine code), its error message and its RPL entry
LIB0C0:
        CON(3)  #0C0                             * 86FE4  library number
        REL(5)  LIB0C0.hash                      * 86FE7  hash table
        REL(5)  LIB0C0.message                   * 86FEC  message table
        REL(5)  LIB0C0.link                      * 86FF1  link table
        CON(5)  0                                * 86FF6  config

LIB0C0.message:
        CON(5)  DOARRY                           * 86FFB  array 1
        LENGTH                                   * 87000  length, to #8703F
        CON(5)  DOCSTR                           * 87005  element type
        CON(5)  1                                * 8700A  dimensions
        CON(5)  1                                * 8700F
        $BODY   "Unable to find root"            * 87014  1
        ENDLENGTH                                * 8703F
        RPL

* ROMPTR 0C0 000
* refs (1): 86FE4
* [coefficients] [roots] hxs -> : PROOT core for complex coefficients. The first line sizes the workspace (54 nibbles per coefficient plus #272); R4 points at it. Header: +0 degree left, +5 degree, +10 flags, +12 result pointer. Coefficients are unpacked to extended reals
PolyRootsC:
        :: # 54 #* # 272 #+ !MAKEHXS             * 8703F
          CODE                                   * 87067  4726 nibbles
            HST=0   3                            * 87071
            D1=D1+  10                           * 87074
            D=D+1   A                            * 87077
            D=D+1   A                            * 87079
            GOSBVL  SAVPTR                       * 8707B
            D1=D1-  10                           * 87082
            A=DAT1  A                            * 87085
            D0=A                                 * 87088
            D0=D0+  10                           * 8708B
            AD0EX                                * 8708E
            R4=A                                 * 87091
            D1=D1+  10                           * 87094
            A=DAT1  A                            * 87097
            D0=A                                 * 8709A
            D0=D0+  15                           * 8709D
            D0=D0+  5                            * 870A0
            A=DAT0  A                            * 870A3
            R1=A                                 * 870A6
            D0=D0+  5                            * 870A9
            AD0EX                                * 870AC
            R3=A                                 * 870AF
            D1=D1-  5                            * 870B2
            A=DAT1  A                            * 870B5
            D0=A                                 * 870B8
            D0=D0+  15                           * 870BB
            A=DAT0  A                            * 870BE
            D0=D0+  10                           * 870C1
            A=A-1   A                            * 870C4
            ?A=0    A                            * 870C6
            GOYES   PolyRootsC.L1                * 870C9
            D0=D0+  5                            * 870CB
PolyRootsC.L1:
            AD0EX                                * 870CE
            R2=A                                 * 870D1
            A=R4                                 * 870D4
            D1=A                                 * 870D7
            A=R1                                 * 870DA
            DAT1=A  A                            * 870DD
            D1=D1+  5                            * 870E0
            DAT1=A  A                            * 870E3
            A=A+A   A                            * 870E6
            A=A+1   A                            * 870E8
            R1=A                                 * 870EA
            D1=D1+  7                            * 870ED
            A=R3                                 * 870F0
            DAT1=A  A                            * 870F3
            AD1EX                                * 870F6
            LC(5)   #00266                       * 870F9
            A=A+C   A                            * 87100
            D1=A                                 * 87102
            LC(5)   #90000                       * 87105
            CR2EX                                * 8710C
            D0=C                                 * 8710F
* Unpack each coefficient, noting the largest exponent in R2
PolyRootsC.loop2:
            A=DAT0  W                            * 87112
            D0=D0+  16                           * 87116
            GOSBVL  SPLITA                       * 87119
            GOSUBL  PutAB%1~jump                 * 87120
            C=R2                                 * 87126
            P=      4                            * 87129
            ?C=A    P                            * 8712B
            GOYES   PolyRootsC.L3                * 8712E
            ?C#0    P                            * 87130
            GOYES   PolyRootsC.L4                * 87133
            GONC    PolyRootsC.L5                * 87135
PolyRootsC.L3:
            ?C>=A   A                            * 87138
            GOYES   PolyRootsC.L5                * 8713B
PolyRootsC.L4:
            R2=A                                 * 8713D
PolyRootsC.L5:
            GOSBVL  CkATTNcode                   * 87140
            A=R1                                 * 87147
            A=A-1   A                            * 8714A
            R1=A                                 * 8714C
            GONC    PolyRootsC.loop2             * 8714F
            P=      0                            * 87152
            C=0     S                            * 87154
* Remove roots at infinity and at 0, then scale all coefficients if the exponents are too far apart
            GOSUBL  PRStripTop                   * 87157
            C=0     S                            * 8715D
            GOSUBL  PRStripEnd                   * 87160
            A=R2                                 * 87166
            LC(5)   #00480                       * 87169
            P=      4                            * 87170
            ?A#0    P                            * 87172
            GOYES   PolyRootsC.L6                * 87175
            ?C<=A   A                            * 87177
            GOYES   PolyRootsC.loop11            * 8717A
PolyRootsC.L6:
            SETDEC                               * 8717C
            C=C-A   A                            * 8717E
            GOTO    PolyRootsC.L8                * 87180
PolyRootsC.loop7:
            P=      0                            * 87184
            LC(5)   #99988                       * 87186
PolyRootsC.L8:
            R0=C                                 * 8718D
            GOSUB   PRCoefBase                   * 87190
            C=DAT1  A                            * 87194
            SETHEX                               * 87197
            C=C+C   A                            * 87199
            C=C+1   A                            * 8719B
            R1=C                                 * 8719D
            D1=A                                 * 871A0
PolyRootsC.loop9:
            GOSUBL  GETAB1~jump                  * 871A3
            ?B=0    W                            * 871A9
            GOYES   PolyRootsC.L10               * 871AC
            SETDEC                               * 871AE
            C=R0                                 * 871B0
            A=A+C   A                            * 871B3
            GOSUBL  PRExpLimit                   * 871B5
            GOSUBL  PutAB%1Back                  * 871BB
PolyRootsC.L10:
            GOSBVL  CkATTNcode                   * 871C1
            C=R1                                 * 871C8
            C=C-1   A                            * 871CB
            R1=C                                 * 871CD
            GONC    PolyRootsC.loop9             * 871D0
            C=0     S                            * 871D3
            C=C+1   S                            * 871D6
            GOSUBL  PRStripTop                   * 871D9
* Degree 1 and 2 are solved directly; anything else starts iterating
PolyRootsC.loop11:
            C=0     S                            * 871DF
            C=C+1   S                            * 871E2
            GOSUBL  PRStripEnd                   * 871E5
            C=R4                                 * 871EB
            D1=C                                 * 871EE
            C=DAT1  A                            * 871F1
            C=C-1   A                            * 871F4
            C=C-1   A                            * 871F6
            GOC     PolyRootsC.L12               * 871F8
            C=C-1   A                            * 871FB
            GONC    PolyRootsC.L13               * 871FD
            GOSUBL  PRSaveLow3                   * 87200
            GOSUBL  SUB_8813B                    * 87206
            GOSUB   PRRoot                       * 8720C
            GOSUBL  PRGet026                     * 87210
            GOSUBL  Get2Tail                     * 87216
            GOTO    PRRoot                       * 8721C
* Degree 1: root = -a1/a0
PolyRootsC.L12:
            GOSUB   PRCoefBase                   * 87220
            D1=A                                 * 87224
            GOSUBL  D1Fwd2%%                     * 87227
            GOSUBL  Get2ABR0                     * 8722D
            GOSUBL  Save2ABR0                    * 87233
            GOSUBL  D1Back4%%                    * 87239
            GOSUBL  Get2ABR0                     * 8723F
            GOSUBL  CNeg                         * 87245
            GOSUBL  CDivSaved                    * 8724B
            GOTO    PRRoot                       * 87251
PolyRootsC.L13:
            A=DAT1  A                            * 87255
            GOSBVL  Hex>15                       * 87258
            GOSUBL  PRPut1CA                     * 8725F
            GOSUBL  PRSaveLow3                   * 87265
            GOSUBL  SUB_8804A                    * 8726B
            GOSUBL  GETAB1~jump                  * 87271
            GOSUB   STAB2~jump_6                 * 87277
            C=0     A                            * 8727B
            GOSUBL  PRGetCoef                    * 8727D
            GOSUBL  Get2Tail                     * 87283
            GOSUBL  Save2ABR0                    * 87289
            C=R4                                 * 8728F
            D1=C                                 * 87292
            C=DAT1  A                            * 87295
            GOSUBL  PRGetCoef                    * 87298
            GOSUBL  Get2Tail                     * 8729E
            GOSUBL  CDivSaved                    * 872A4
            GOSUBL  HypotABR0                    * 872AA
            GOSUBL  STAB0~jump_6                 * 872B0
            GOSUBL  PRGet1CA                     * 872B6
            GOSUB   STAB2~jump_6                 * 872BC
            SETDEC                               * 872C0
            GOSUB   RCAB0~jump                   * 872C2
            GOSBVL  aLN                          * 872C6
            GOSUB   RCCD2~jump_6                 * 872CD
            GOSUB   DIVF~jump_3                  * 872D1
            GOSBVL  aEXP                         * 872D5
            GOSUBL  PRKeepMin                    * 872DC
            GOSUBL  GETAB1Back                   * 872E2
            C=0     W                            * 872E8
            D=0     W                            * 872EB
            P=      14                           * 872EE
            D=D+1   P                            * 872F0
            D=D+1   M                            * 872F3
            GOSUB   MULTF~jump_5                 * 872F6
            GOSUBL  PutAB%1Back                  * 872FA
            GOSUBL  PRPut050                     * 87300
            D0=C                                 * 87306
PolyRootsC.loop14:
            GOSUB   PRCoefBase                   * 87309
            C=DAT1  A                            * 8730D
            C=C-1   A                            * 87310
            R3=C                                 * 87312
            D1=A                                 * 87315
            A=0     W                            * 87318
            B=0     W                            * 8731B
            GOSUBL  PUTAB0Backa                  * 8731E
            GOSUBL  Get2ABR0                     * 87324
            SETDEC                               * 8732A
            GOSUBL  HypotABR0                    * 8732C
            D0=D0-  16                           * 87332
            D0=D0-  5                            * 87335
            GOSUBL  PUTAB0Backa                  * 87338
PolyRootsC.loop15:
            GOSUBL  GETAB0~jump                  * 8733E
            SETDEC                               * 87344
            GOSUB   MulD0%%a                     * 87346
            GOSUBL  D0Back3%%                    * 8734A
            GOSUBL  GETCD0~jump                  * 87350
            GOSUB   AddR0.L1                     * 87356
            GOSUBL  PUTAB0~jump_2                * 8735A
            GOSUB   Get2ABR0                     * 87360
            GOSUBL  HypotABR0                    * 87364
            CR3EX                                * 8736A
            ?C#0    A                            * 8736D
            GOYES   PolyRootsC.L16               * 87370
            A=-A-1  S                            * 87372
PolyRootsC.L16:
            CR3EX                                * 87375
            GOSUBL  STAB0~jump_6                 * 87378
            GOSUBL  GETAB0~jump                  * 8737E
            GOSUBL  D0Back3%%                    * 87384
            GOSUB   MulD0%%a                     * 8738A
            GOSUB   RCCD0~jump_6                 * 8738E
            GOSUB   AddR0.L1                     * 87392
            GOSUBL  PUTAB0Backa                  * 87396
            GOSBVL  CkATTNcode                   * 8739C
            C=R3                                 * 873A3
            C=C-1   A                            * 873A6
            R3=C                                 * 873A8
            GONC    PolyRootsC.loop15            * 873AB
            SETDEC                               * 873AE
            GOSUBL  GETCD0~jump                  * 873B0
            GOSUB   DIVF~jump_3                  * 873B6
            A=-A-1  S                            * 873BA
            GOSUBL  GETCD0~jump                  * 873BD
            GOSBVL  STCD0                        * 873C3
            GOSUB   AddR0.L1                     * 873CA
            GOSUBL  PUTAB0Backa                  * 873CE
            D0=D0-  16                           * 873D4
            D0=D0-  5                            * 873D7
            GOSUB   RCCD0~jump_6                 * 873DA
            GOSUB   SubCDTest                    * 873DE
            GOC     PolyRootsC.L17               * 873E2
            GOTO    PolyRootsC.loop14            * 873E5
PolyRootsC.L17:
            GOSUB   RCAB0~jump                   * 873E9
            C=0     W                            * 873ED
            C=C-1   A                            * 873F0
            D=0     W                            * 873F2
            D=D-1   M                            * 873F5
            GOSUB   MULTF~jump_5                 * 873F8
            GOSUBL  PRPut1DF                     * 873FC
            GOSUB   D1Back2%%                    * 87402
            GOSUBL  GETAB1~jump                  * 87406
            SETDEC                               * 8740C
            GOSUB   MulD0%%a                     * 8740E
            D=0     W                            * 87412
            C=0     W                            * 87415
            P=      11                           * 87418
            LC(4)   #1445                        * 8741A
            DCEX    W                            * 87420
            GOSUB   MULTF~jump_5                 * 87423
            GOSUBL  PRKeepMin                    * 87427
            GOSUBL  GETAB1Back                   * 8742D
            GOSUBL  PRPut122                     * 87433
            A=0     W                            * 87439
            B=0     W                            * 8743C
            GOSUB   PutAB%1~jump                 * 8743F
            GOSUB   PutAB%1~jump                 * 87443
            C=0     A                            * 87447
            GOSUBL  PRGetCoef                    * 87449
            GOSUB   Get2Tail                     * 8744F
            SETDEC                               * 87453
            GOSUBL  HypotABR0                    * 87455
            GOSUBL  PRPut18B                     * 8745B
            C=R4                                 * 87461
            D1=C                                 * 87464
            D1=D1+  10                           * 87467
            C=0     B                            * 8746A
            DAT1=C  B                            * 8746D
PolyRootsC.L18:
            GOSUBL  PRGet122                     * 87470
            GOSUBL  STAB0~jump_6                 * 87476
            GOSUB   D1Fwd5%%                     * 8747C
            GOSUB   Get1%CD~jump                 * 87480
            GOSBVL  STCD2                        * 87484
            GOSUB   SubCDTest                    * 8748B
            GOC     PolyRootsC.L19               * 8748F
            GOTO    PolyRootsC.L32               * 87492
PolyRootsC.L19:
            GOSUB   RCAB0~jump                   * 87496
            GOSUB   SUB_879A0                    * 8749A
            GOSUBL  STAB0~jump_6                 * 8749E
            GOSUB   RCCD2~jump_6                 * 874A4
            GOSUB   SubCDTest                    * 874A8
            GOC     PolyRootsC.L21               * 874AC
            C=R4                                 * 874AF
            D1=C                                 * 874B2
            D1=D1+  10                           * 874B5
            C=DAT1  B                            * 874B8
            ?C#0    B                            * 874BB
            GOYES   PolyRootsC.L20               * 874BE
            GOSUBL  PRGet1DF                     * 874C0
            GOSUB   ABtoCD                       * 874C6
            GOSUB   RCAB0~jump                   * 874CA
            GOSUB   SubCDTest                    * 874CE
            GONC    PolyRootsC.L21               * 874D2
PolyRootsC.L20:
            GOSUB   RCAB0~jump                   * 874D5
            GOSUBL  PRPut1A0                     * 874D9
            SETDEC                               * 874DF
            GOSUB   RCCD2~jump_6                 * 874E1
            GOSUB   DIVF~jump_3                  * 874E5
            GOSUB   D1Back4%%                    * 874E9
            GOSUB   PRScale2.L1                  * 874ED
PolyRootsC.L21:
            C=R4                                 * 874F1
            D1=C                                 * 874F4
            D1=D1+  10                           * 874F7
            C=0     S                            * 874FA
            C=C+1   S                            * 874FD
            DAT1=C  S                            * 87500
            P=      0                            * 87504
            LC(3)   #0A4                         * 87506
            GOSUBL  PRField                      * 8750B
            D0=C                                 * 87511
            GOSUB   D1Fwd6%%                     * 87514
            D1=D1+  16                           * 87518
            D1=D1+  5                            * 8751B
            LC(1)   #6                           * 8751E
PolyRootsC.loop22:
            A=DAT1  A                            * 87521
            D1=D1+  5                            * 87524
            DAT0=A  A                            * 87527
            D0=D0+  5                            * 8752A
            A=DAT1  W                            * 8752D
            D1=D1+  16                           * 87531
            DAT0=A  W                            * 87534
            D0=D0+  16                           * 87538
            C=C-1   P                            * 8753B
            GONC    PolyRootsC.loop22            * 8753E
PolyRootsC.loop23:
            GOSUB   PRGet0A4                     * 87541
            GOSUB   ABtoCD                       * 87545
            GOSUB   GETAB1~jump                  * 87549
            GOSUB   STAB2~jump_6                 * 8754D
            GOSUB   Get2ABR0                     * 87551
            SETDEC                               * 87555
            GOSUB   AddR0.L1                     * 87557
            GOSUB   EXAB0~jump_3                 * 8755B
            GOSUB   RCCD2~jump_6                 * 8755F
            GOSUB   AddR0.L1                     * 87563
            GOSUB   EXAB0~jump_3                 * 87567
            GOSUB   D1Fwd3%%                     * 8756B
            GOSUB   Put2ABR0D1                   * 8756F
PolyRootsC.loop24:
            GOSUB   PRGet10D                     * 87573
            SETDEC                               * 87577
            C=0     W                            * 87579
            C=C-1   A                            * 8757C
            D=0     W                            * 8757E
            P=      14                           * 87581
            D=D+1   P                            * 87583
            D=D+1   P                            * 87586
            GOSUB   MULTF~jump_5                 * 87589
            GOSUBL  STAB0~jump_6                 * 8758D
            D1=D1+  16                           * 87593
            D1=D1+  5                            * 87596
            GOSUB   Get1%CD~jump                 * 87599
            C=0     S                            * 8759D
            GOSUB   SubCDTest                    * 875A0
            GONC    PolyRootsC.L25               * 875A4
            A=0     W                            * 875A7
            B=0     W                            * 875AA
            GOSUB   PutAB%1Back                  * 875AD
            D1=D1+  16                           * 875B1
            D1=D1+  5                            * 875B4
            GOTO    PolyRootsC.L26               * 875B7
PolyRootsC.L25:
            GOSUB   RCAB0~jump                   * 875BB
            GOSUB   Get1%CD~jump                 * 875BF
            C=0     S                            * 875C3
            GOSUB   SubCDTest                    * 875C6
            GONC    PolyRootsC.L26               * 875CA
            A=0     W                            * 875CD
            B=0     W                            * 875D0
            GOSUB   PutAB%1Back                  * 875D3
PolyRootsC.L26:
            GOSUB   D1Back2%%                    * 875D7
            GOSUB   Get2ABR0                     * 875DB
            GOSUB   PRPut07A                     * 875DF
            GOSUB   PutR0D1                      * 875E3
            GOSUB   D1Back6%%                    * 875E7
            A=0     W                            * 875EB
            B=0     W                            * 875EE
            GOSUB   PutAB%1~jump                 * 875F1
            GOSUB   PutAB%1~jump                 * 875F5
            CD1EX                                * 875F9
            D0=C                                 * 875FC
            GOSUB   PRCoefBase                   * 875FF
            C=DAT1  A                            * 87603
            C=C-1   A                            * 87606
            RSTK=C                               * 87608
            C=C+1   A                            * 8760A
            D1=A                                 * 8760C
            GOSUB   Get2ABR0                     * 8760F
            CD1EX                                * 87613
            RSTK=C                               * 87616
            CD1EX                                * 87618
            GOSUB   Put2ABR0                     * 8761B
            GOSUB   PRPutAux                     * 8761F
            GOSUB   PutR0D1                      * 87623
            GOTO    PolyRootsC.L30               * 87627
PolyRootsC.loop27:
            RSTK=C                               * 8762B
            C=D     A                            * 8762D
            RSTK=C                               * 8762F
            CD1EX                                * 87631
            RSTK=C                               * 87634
            GOSUB   PRGet026                     * 87636
            GOSUB   Get2Tail                     * 8763A
            GOSUB   Save2ABR0                    * 8763E
            GOSUB   D1Fwd2%%                     * 87642
            GOSUB   Get2ABR0                     * 87646
            GOSUBL  CMulSaved                    * 8764A
            GOSUB   Save2ABR0                    * 87650
            GOSUB   D1Back4%%                    * 87654
            GOSUB   Get2ABR0                     * 87658
            GOSUB   CAddSaved                    * 8765C
            GOSUB   D1Back4%%                    * 87660
            GOSUB   PRExpLimit                   * 87664
            GOC     PolyRootsC.loop28            * 87668
            GOSUB   PutAB%1~jump                 * 8766B
            GOSUB   RCAB0~jump                   * 8766F
            GOSUB   PRExpLimit                   * 87673
            GOC     PolyRootsC.loop28            * 87677
            GOSUB   PutAB%1~jump                 * 8767A
            GOSUB   Get2ABR0                     * 8767E
            GOSUB   Save2ABR0                    * 87682
            GOSUB   Get2ABR0                     * 87686
            GOSUB   CMulSaved                    * 8768A
            GOSUB   Save2ABR0                    * 8768E
            GOSUB   D1Back4%%                    * 87692
            C=RSTK                               * 87696
            CD1EX                                * 87698
            RSTK=C                               * 8769B
            GOSUB   D1Back2%%                    * 8769D
            GOSUB   Get2ABR0                     * 876A1
            GOSUB   CAddSaved                    * 876A5
            C=RSTK                               * 876A9
            D0=C                                 * 876AB
            GOSUB   PRExpLimit                   * 876AE
            GOC     PolyRootsC.loop28            * 876B2
            GOSUB   PUTAB0~jump_2                * 876B5
            GOSUB   RCAB0~jump                   * 876B9
            GOSUB   PRExpLimit                   * 876BD
            GONC    PolyRootsC.L29               * 876C1
PolyRootsC.loop28:
            GOTO    PolyRootsC.loop7             * 876C4
PolyRootsC.L29:
            GOSUB   PUTAB0~jump_2                * 876C8
PolyRootsC.L30:
            GOSUB   Get2ABR0D0                   * 876CC
            GOSUB   Save2ABR0                    * 876D0
            GOSUB   D1Back2%%                    * 876D4
            GOSUB   Get2ABR0                     * 876D8
            GOSUB   CMulSaved                    * 876DC
            GOSUB   Save2ABR0                    * 876E0
            C=RSTK                               * 876E4
            D0=C                                 * 876E6
            GOSUB   Get2ABR0D0                   * 876E9
            CD0EX                                * 876ED
            RSTK=C                               * 876F0
            GOSUB   CAddSaved                    * 876F2
            GOSUB   PRExpLimit                   * 876F6
            GOC     PolyRootsC.loop28            * 876FA
            GOSUB   PutAB%1~jump                 * 876FD
            GOSUB   EXAB0~jump_3                 * 87701
            GOSUB   PRExpLimit                   * 87705
            GOC     PolyRootsC.loop28            * 87709
            GOSUB   PutAB%1~jump                 * 8770C
            GOSUB   EXAB0~jump_3                 * 87710
            GOSBVL  CkATTNcode                   * 87714
            C=RSTK                               * 8771B
            D=C     A                            * 8771D
            C=RSTK                               * 8771F
            C=C-1   A                            * 87721
            GOC     PolyRootsC.L31               * 87723
            GOTO    PolyRootsC.loop27            * 87726
PolyRootsC.L31:
            GOSUB   PRPut07A                     * 8772A
            GOSUB   PutR0D1                      * 8772E
            SETDEC                               * 87732
            GOSUBL  HypotABR0                    * 87734
            GOSUB   PRPut18B                     * 8773A
            GOLONG  PRSaveLow3.L2                * 8773E
PolyRootsC.L32:
            C=R4                                 * 87744
            D1=C                                 * 87747
            D1=D1+  10                           * 8774A
            C=DAT1  S                            * 8774D
            ?C#0    S                            * 87751
            GOYES   PolyRootsC.L33               * 87754
            GOTO    PolyRootsC.L36               * 87756
PolyRootsC.L33:
            SETDEC                               * 8775A
            A=0     W                            * 8775C
            A=A-1   A                            * 8775F
            B=0     W                            * 87761
            P=      14                           * 87764
            LC(1)   #5                           * 87766
            B=C     P                            * 87769
            P=      0                            * 8776C
            LC(3)   #0CE                         * 8776E
            GOSUB   PRScale2                     * 87773
            D1=D1+  16                           * 87777
            D1=D1+  5                            * 8777A
            GOSUB   GETAB1~jump                  * 8777D
            GOSUB   MulR0                        * 87781
            GOSUB   PutAB%1Back                  * 87785
            GOSUB   STAB2~jump_6                 * 87789
            D1=D1+  16                           * 8778D
            D1=D1+  5                            * 87790
            GOSUB   Get2ABR0                     * 87793
            GOSUBL  HypotABR0                    * 87797
            GOSUB   STAB0~jump_6                 * 8779D
            GOSUB   RCCD2~jump_6                 * 877A1
            GOSUB   AddR0.L1                     * 877A5
            GOSUB   RCCD0~jump_6                 * 877A9
            GOSUB   SubCDTest                    * 877AD
            ?B=0    WP                           * 877B1
            GOYES   PolyRootsC.L34               * 877B4
            GOTO    PolyRootsC.loop23            * 877B6
PolyRootsC.L34:
            GOSUB   D1Fwd2%%                     * 877BA
            GOSUB   GETAB1~jump                  * 877BE
            GOSUB   STAB0~jump_6                 * 877C2
            GOSUB   D1Fwd2%%                     * 877C6
            GOSUB   GETAB1~jump                  * 877CA
            GOSUB   SquareAB                     * 877CE
            GOSUB   STAB2~jump_6                 * 877D2
            GOSUB   PRGet011                     * 877D6
            SETDEC                               * 877DA
            GOSUB   RCCD2~jump_6                 * 877DC
            GOSUB   MULTF~jump_5                 * 877E0
            GOSUB   RCCD0~jump_6                 * 877E4
            GOSUB   XYEX~jump_4                  * 877E8
            GOSUB   SubCDTest                    * 877EC
            GOC     PolyRootsC.L35               * 877F0
            GOTO    PolyRootsC.L38               * 877F3
* No root found: error #C001, library 0C0 message 1, "Unable to find root"
PolyRootsC.L35:
            P=      0                            * 877F7
            LC(5)   #0C001                       * 877F9
            GOVLNG  GPErrjmpC                    * 87800
PolyRootsC.L36:
            D1=D1+  1                            * 87807
            C=DAT1  S                            * 8780A
            ?C#0    S                            * 8780E
            GOYES   PolyRootsC.L37               * 87811
            C=C+1   S                            * 87813
            DAT1=C  S                            * 87816
            GOSUB   PRGet1CA                     * 8781A
            SETDEC                               * 8781E
            GOSUB   SquareAB                     * 87820
            GOSUB   ABtoCD                       * 87824
            GOSUB   GETAB1~jump                  * 87828
            GOSUB   STAB2~jump_6                 * 8782C
            GOSUB   DIVF~jump_3                  * 87830
            GOSUB   PRPut10D                     * 87834
            GOSUB   D1Fwd3%%                     * 87838
            GOSUB   Get2ABR0                     * 8783C
            GOSUB   D1Back4%%                    * 87840
            GOSUB   Put2ABR0D1                   * 87844
            GOSUB   D1Fwd3%%                     * 87848
            GOSUB   Get1%CD~jump                 * 8784C
            SETDEC                               * 87850
            GOSUB   RCAB2~jump_3                 * 87852
            GOSUB   DIVF~jump_3                  * 87856
            GOSUB   D1Back6%%                    * 8785A
            GOSUB   PRScale2.L1                  * 8785E
            GOTO    PolyRootsC.loop24            * 87862
PolyRootsC.L37:
            GOSUB   PRGet137                     * 87866
            GOSUB   Get2Tail                     * 8786A
            GOSUB   Save2ABR0                    * 8786E
            GOSUB   D1Fwd5%%                     * 87872
            GOSUB   GETAB1~jump                  * 87876
            C=0     W                            * 8787A
            P=      12                           * 8787D
            LC(3)   #125                         * 8787F
            D=C     W                            * 87884
            C=0     M                            * 87887
            C=-C-1  S                            * 8788A
            GOSUB   XYEX~jump_4                  * 8788D
            GOSUB   DIVF~jump_3                  * 87891
            GOSUB   STAB0~jump_6                 * 87895
            A=0     W                            * 87899
            B=0     W                            * 8789C
            P=      14                           * 8789F
            B=B+1   P                            * 878A1
            GOSUB   EXAB0~jump_3                 * 878A4
            GOSUB   CMulSaved                    * 878A8
            GOSUB   PRPut137                     * 878AC
            GOSUB   PutR0D1                      * 878B0
            GOSBVL  CkATTNcode                   * 878B4
            GOTO    PolyRootsC.loop24            * 878BB
* Root accepted: store it and deflate the polynomial
PolyRootsC.L38:
            GOSUB   PRGet137                     * 878BF
            GOSUB   Get2Tail                     * 878C3
            GOSUB   PRRoot                       * 878C7
            C=C-1   A                            * 878CB
            R0=C                                 * 878CD
            GOSUB   PRCoefAddr                   * 878D0
            D0=C                                 * 878D4
            C=R0                                 * 878D7
            GOSUB   PRAuxAddr                    * 878DA
            C=R0                                 * 878DE
            C=C+1   A                            * 878E1
            C=C+C   A                            * 878E3
            C=C-1   A                            * 878E5
            B=C     A                            * 878E7
PolyRootsC.loop39:
            A=DAT1  A                            * 878E9
            D1=D1+  5                            * 878EC
            DAT0=A  A                            * 878EF
            D0=D0+  5                            * 878F2
            A=DAT1  W                            * 878F5
            D1=D1+  16                           * 878F9
            DAT0=A  W                            * 878FC
            D0=D0+  16                           * 87900
            GOSBVL  CkATTNcode                   * 87903
            B=B-1   A                            * 8790A
            GONC    PolyRootsC.loop39            * 8790C
            GOTO    PolyRootsC.loop11            * 8790F

* refs (6): 874C6 87545 87824 8798A 87FC7 88024
* AB -> CD: copies the extended real in AB to CD; A and B are kept
ABtoCD:
            C=B     W                            * 87913
            D=C     W                            * 87916
            C=A     W                            * 87919
            RTN                                  * 8791C

* refs (4): 87190 87220 87309 875FF
* -> A.A = R4+#272, the coefficients in the workspace; D1 = R4, its header; hex mode
PRCoefBase:
            SETHEX                               * 8791E
            A=R4                                 * 87920
            D1=A                                 * 87923
            P=      0                            * 87926
            LC(5)   #00272                       * 87928
            A=A+C   A                            * 8792F
            RTN                                  * 87931

* refs (4): 877E8 8788D 87FF7 8825D
XYEX~jump_4:
            GOVLNG  XYEX                         * 87933

* refs (15): 87277 872BC 8754D 87789 877D2 8782C ...
STAB2~jump_6:
            GOVLNG  STAB2                        * 8793A

* refs (11): 872C2 873E9 87496 874CA 874D5 875BB ...
RCAB0~jump:
            GOVLNG  RCAB0                        * 87941

* refs (4): 87852 87EE1 88091 880A7
RCAB2~jump_3:
            GOVLNG  RCAB2                        * 87948

* refs (8): 8738E 873DA 877A9 877E4 8795D 87977 ...
RCCD0~jump_6:
            GOVLNG  RCCD0                        * 8794F

* refs (15): 872CD 874A4 874E1 8755F 877A1 877DC ...
RCCD2~jump_6:
            GOVLNG  RCCD2                        * 87956

* refs (2): 881B9 882E1
* AB -> AB+(R0,R1); D0 is kept. The entry .L1 adds CD instead
AddR0:
            GOSUB   RCCD0~jump_6                 * 8795D
AddR0.L1:
            CD0EX                                * 87961
            RSTK=C                               * 87964
            CD0EX                                * 87966
            GOSBVL  RADDF                        * 87969
            C=RSTK                               * 87970
            D0=C                                 * 87972
            RTN                                  * 87975

* refs (3): 87781 87B71 880AB
* AB -> AB*(R0,R1): extended multiply
MulR0:
            GOSUB   RCCD0~jump_6                 * 87977

* refs (9): 872F6 873F8 87423 87589 877E0 87986 ...
MULTF~jump_5:
            GOVLNG  MULTF                        * 8797B

* refs (9): 87346 8738A 8740E 87E64 87E87 87E9B ...
* AB -> AB*(%% at D0), D0 advancing
MulD0%%a:
            GOSUB   GETCD0~jump                  * 87982
            GOTO    MULTF~jump_5                 * 87986

* refs (6): 877CE 87820 882A0 882AA 882D1 882DB
* AB -> AB*AB
SquareAB:
            GOSUB   ABtoCD                       * 8798A
            GOTO    MULTF~jump_5                 * 8798E

* refs (10): 872D1 873B6 874E5 87830 87856 87891 ...
DIVF~jump_3:
            GOVLNG  DIVF                         * 87992

* refs (2): 87FAC 8824D
SUB_87999:
            GOVLNG  DIV2.L3                      * 87999

* refs (3): 8749A 880AF 8823F
SUB_879A0:
            GOVLNG  DIV2.L1                      * 879A0

* refs (6): 8720C 8721C 87251 878C7 87A66 87AA6
* AB R0R1 -> : packs the complex root into the result array at the pointer in R4+12 and lowers the degree at R4+0. Carry set while roots remain; at degree 0 it ends the code object through GETPTRLOOP
PRRoot:
            SETDEC                               * 879A7
            GOSBVL  PACK                         * 879A9
            GOSUB   EXAB0~jump_3                 * 879B0
            GOSBVL  PACK                         * 879B4
            AR0EX                                * 879BB
            C=R4                                 * 879BE
            D1=C                                 * 879C1
            D1=D1+  12                           * 879C4
            C=DAT1  A                            * 879C7
            D0=C                                 * 879CA
            DAT0=A  W                            * 879CD
            D0=D0+  16                           * 879D1
            A=R0                                 * 879D4
            DAT0=A  W                            * 879D7
            D0=D0+  16                           * 879DB
            GOSBVL  CkATTNcode                   * 879DE
            CD0EX                                * 879E5
            DAT1=C  A                            * 879E8
            D1=D1-  12                           * 879EB
            C=DAT1  A                            * 879EE
            C=C-1   A                            * 879F1
            DAT1=C  A                            * 879F3
            ?C#0    A                            * 879F6
            RTNYES                               * 879F9
            P=      0                            * 879FB
            GOVLNG  GETPTRLOOP                   * 879FD

* refs (2): 87157 871D9
* C.S = pass: removes zero leading coefficients, moving the array down, and stores a root at infinity for each (MAXR on the first pass)
PRStripTop:
            A=R4                                 * 87A04
            A=C     S                            * 87A07
            R4=A                                 * 87A0A
            D1=A                                 * 87A0D
            C=DAT1  A                            * 87A10
PRStripTop.loop1:
            R0=C                                 * 87A13
            GOSUB   PRGetCoef                    * 87A16
            ?B#0    W                            * 87A1A
            RTNYES                               * 87A1D
            GOSUB   GETAB1~jump                  * 87A1F
            ?B#0    W                            * 87A23
            RTNYES                               * 87A26
            CD1EX                                * 87A28
            D0=C                                 * 87A2B
            C=R0                                 * 87A2E
            GOSBVL  C*42>D                       * 87A31
            C=D     A                            * 87A38
            GOSBVL  MOVEDOWN                     * 87A3A
            A=0     W                            * 87A41
            C=R4                                 * 87A44
            ?C=0    S                            * 87A47
            GOYES   PRStripTop.L2                * 87A4A
            A=A+1   M                            * 87A4C
            P=      14                           * 87A4F
            B=B+1   P                            * 87A51
            GONC    PRStripTop.L3                * 87A54
PRStripTop.L2:
            SETDEC                               * 87A57
            GOSBVL  FltExc.L2                    * 87A59
            SETHEX                               * 87A60
PRStripTop.L3:
            GOSUB   STAB0~jump_6                 * 87A62
            GOSUB   PRRoot                       * 87A66
            GOTO    PRStripTop.loop1             * 87A6A

* refs (2): 87160 871E5
* C.S = pass: removes zero constant terms, storing a root at 0 for each (a very small number on the second pass)
PRStripEnd:
            A=R4                                 * 87A6E
            A=C     S                            * 87A71
            R4=A                                 * 87A74
PRStripEnd.loop1:
            C=0     A                            * 87A77
            GOSUB   PRGetCoef                    * 87A79
            ?B#0    W                            * 87A7D
            RTNYES                               * 87A80
            GOSUB   GETAB1~jump                  * 87A82
            ?B#0    W                            * 87A86
            RTNYES                               * 87A89
            A=0     W                            * 87A8B
            C=R4                                 * 87A8E
            ?C=0    S                            * 87A91
            GOYES   PRStripEnd.L2                * 87A94
            P=      14                           * 87A96
            B=B+1   P                            * 87A98
            SETDEC                               * 87A9B
            A=A-1   A                            * 87A9D
            A=0     X                            * 87A9F
PRStripEnd.L2:
            GOSUB   STAB0~jump_6                 * 87AA2
            GOSUB   PRRoot                       * 87AA6
            GOC     PRStripEnd.loop1             * 87AAA

* refs (7): 871B5 87664 87673 876AE 876BD 876F6 ...
* A.A = exponent -> carry set if it is above 5000. Below -5000 clears AB, to avoid underflow
PRExpLimit:
            SETDEC                               * 87AAD
            C=A     A                            * 87AAF
            C=C+C   A                            * 87AB1
            P=      0                            * 87AB3
            LC(5)   #05000                       * 87AB5
            GOC     PRExpLimit.L1                * 87ABC
            ?C<=A   A                            * 87ABF
            RTNYES                               * 87AC2
            RTN                                  * 87AC4
PRExpLimit.L1:
            C=-C    A                            * 87AC6
            ?C>A    A                            * 87AC8
            GOYES   PRExpLimit.L2                * 87ACB
            RTN                                  * 87ACD
PRExpLimit.L2:
            A=0     W                            * 87ACF
            B=0     W                            * 87AD2
            RTNCC                                * 87AD5

* refs (12): 873DE 8748B 874A8 874CE 875A0 875C6 ...
* A/B = A/B - C/D; carry set when the result is >= 0; decimal mode
SubCDTest:
            SETDEC                               * 87AD7
            C=-C-1  S                            * 87AD9
            GOSUB   AddR0.L1                     * 87ADC
            P=      14                           * 87AE0
            ?B=0    WP                           * 87AE2
            RTNYES                               * 87AE5
            ?A=0    S                            * 87AE7
            RTNYES                               * 87AEA
            RTN                                  * 87AEC

* refs (3): 8761B 8816B 88195
* AB R0R1 -> : stores both extended reals at D0, advancing it
Put2ABR0:
            GOSUB   PUTAB0~jump_2                * 87AEE
Put2ABR0.L1:
            GOSUB   EXAB0~jump_3                 * 87AF2
            GOSUB   PUTAB0~jump_2                * 87AF6

* refs (23): 8755B 87567 87701 87710 878A4 879B0 ...
EXAB0~jump_3:
            GOVLNG  EXAB0                        * 87AFA

* refs (16): 87233 87289 8763E 87650 87682 8768E ...
* Store A/B, then R0/R1, as two %% at R4+#1F4 (R4: the library's workspace hex string); A/B and R0/R1 come back unchanged
Save2ABR0:
            GOSUB   PRPut1F4                     * 87B01
            GOTO    Put2ABR0.L1                  * 87B05

* refs (1): 881F7
* AB R0R1 -> : exchanges the complex number with the saved one at #1F4
CSwapSaved:
            GOSUB   PRGet1F4                     * 87B09
            GOSUB   PUTAB0Backa                  * 87B0D
            GOSUB   GETAB0~jump                  * 87B11
            GOSUB   EXAB0~jump_3                 * 87B15
            GOSUB   PUTAB0Backa                  * 87B19
            A=C     W                            * 87B1D
            C=D     W                            * 87B20
            B=C     W                            * 87B23
            RTN                                  * 87B26

* refs (5): 8756F 87844 880EC 881EB 88203
* AB R0R1 -> : stores both extended reals at D1, advancing it
Put2ABR0D1:
            GOSUB   PutAB%1~jump                 * 87B28

* refs (5): 875E3 87623 8772E 878B0 88062
* R0R1 -> : stores the extended real of R0,R1 at D1, advancing it
PutR0D1:
            GOSUB   EXAB0~jump_3                 * 87B2C
            GOSUB   PutAB%1~jump                 * 87B30
            GOTO    EXAB0~jump_3                 * 87B34

* refs (4): 876CC 876E9 88183 881C6
* -> AB R0R1: reads two extended reals at D0, advancing it
Get2ABR0D0:
            GOSUB   GETAB0~jump                  * 87B38
            GOSUB   STAB0~jump_6                 * 87B3C
            GOSUB   GETAB0~jump                  * 87B40
            GOTO    EXAB0~jump_3                 * 87B44

* refs (25): 8722D 8723F 87324 87360 87551 875DB ...
* D1 -> two unsplit %%: first into A/B, second into R0/R1, D1 past both
Get2ABR0:
            GOSUB   GETAB1~jump                  * 87B48

* refs (10): 87216 87283 8729E 8744F 8763A 8786A ...
* AB -> AB R0R1: second half of a two-number read: reads the next number at D1 into R0,R1
Get2Tail:
            GOSUB   STAB0~jump_6                 * 87B4C
            GOSUB   GETAB1~jump                  * 87B50
            GOTO    EXAB0~jump_3                 * 87B54

* refs (2): 8813F 88147
* Doubles the two extended reals at D1
PRDouble2:
            GOSUB   AB%%2                        * 87B58
            GONC    PRScale2.L1                  * 87B5C

* refs (2): 87773 880A3
* AB C.X = field -> : multiplies the two extended reals at the workspace field by AB
PRScale2:
            GOSUB   PRField                      * 87B5F
PRScale2.L1:
            SETDEC                               * 87B63
            GOSUB   STAB0~jump_6                 * 87B65
            GOSUB   PRScale1                     * 87B69

* refs (1): 87B69
* (R0,R1) -> : multiplies the extended real at D1 by R0,R1, in place
PRScale1:
            GOSUB   GETAB1~jump                  * 87B6D
            GOSUB   MulR0                        * 87B71
            GOTO    PutAB%1Back                  * 87B75

* refs (2): 87B58 88077
* -> AB = extended 2
AB%%2:
            A=0     W                            * 87B79
            B=0     W                            * 87B7C
            P=      14                           * 87B7F
            B=B+1   P                            * 87B81
            B=B+1   P                            * 87B84
            RTN                                  * 87B87

* refs (6): 875E7 8785A 88018 88089 880E8 8814B
* D1 back six extended reals (21 nibbles each)
D1Back6%%:
            D1=D1-  16                           * 87B89
            D1=D1-  5                            * 87B8C

* refs (1): 87F49
* D1 back five extended reals
D1Back5%%:
            D1=D1-  16                           * 87B8F
            D1=D1-  5                            * 87B92

* refs (9): 87239 874E9 87654 87660 87692 87840 ...
* D1 back four extended reals
D1Back4%%:
            D1=D1-  16                           * 87B95
            D1=D1-  5                            * 87B98
            D1=D1-  16                           * 87B9B
            D1=D1-  5                            * 87B9E

* refs (8): 87402 875D7 8769D 876D4 8800C 88118 ...
* D1 back two extended reals
D1Back2%%:
            D1=D1-  16                           * 87BA1
            D1=D1-  16                           * 87BA4
            D1=D1-  10                           * 87BA7
            RTN                                  * 87BAA

* refs (1): 87514
* D1 forward six extended reals
D1Fwd6%%:
            D1=D1+  16                           * 87BAC
            D1=D1+  5                            * 87BAF

* refs (2): 8747C 87872
* D1 forward five extended reals
D1Fwd5%%:
            D1=D1+  16                           * 87BB2
            D1=D1+  5                            * 87BB5
            D1=D1+  16                           * 87BB8
            D1=D1+  5                            * 87BBB

* refs (4): 8756B 87838 87848 88066
* D1 forward three extended reals
D1Fwd3%%:
            D1=D1+  16                           * 87BBE
            D1=D1+  5                            * 87BC1

* refs (7): 87227 87642 877BA 877C6 88143 88157 ...
* D1 forward two extended reals
D1Fwd2%%:
            D1=D1+  16                           * 87BC4
            D1=D1+  16                           * 87BC7
            D1=D1+  10                           * 87BCA
            RTN                                  * 87BCD
            NIBHEX  18F18418F184                 * 87BCF  ā.Hā.H

* refs (1): 88167
* D0 back four extended reals
D0Back4%%:
            D0=D0-  16                           * 87BDB
            D0=D0-  5                            * 87BDE

* refs (2): 8734A 87384
* D0 back three extended reals
D0Back3%%:
            D0=D0-  16                           * 87BE1
            D0=D0-  5                            * 87BE4

* refs (5): 87E60 87E8F 87ED9 87EF1 881C2
* D0 back two extended reals
D0Back2%%a:
            D0=D0-  16                           * 87BE7
            D0=D0-  16                           * 87BEA
            D0=D0-  10                           * 87BED
            RTN                                  * 87BF0

* refs (1): 87E97
* D0 forward four extended reals
D0Fwd4%%:
            D0=D0+  16                           * 87BF2
            D0=D0+  5                            * 87BF5
            D0=D0+  16                           * 87BF8
            D0=D0+  5                            * 87BFB
            D0=D0+  16                           * 87BFE
            D0=D0+  16                           * 87C01
            D0=D0+  10                           * 87C04
            RTN                                  * 87C07

* refs (7): 871BB 872FA 875AD 875D3 87785 87B75 ...
* AB -> : D1 back one extended real, then stores AB there and advances
PutAB%1Back:
            D1=D1-  16                           * 87C09
            D1=D1-  5                            * 87C0C

* refs (15): 87120 8743F 87443 875F1 875F5 8766B ...
PutAB%1~jump:
            GOVLNG  PutAB%1                      * 87C0F

* refs (6): 8731E 87338 87396 873CE 87B0D 87B19
* AB -> : D0 back one extended real, then stores AB there and advances
PUTAB0Backa:
            D0=D0-  16                           * 87C16
            D0=D0-  5                            * 87C19

* refs (7): 8735A 876B5 876C8 87AEE 87AF6 87C62 ...
PUTAB0~jump_2:
            GOVLNG  PUTAB0                       * 87C1C

* refs (2): 872E2 8742D
* -> AB: D1 back one extended real, then reads it and advances
GETAB1Back:
            D1=D1-  16                           * 87C23
            D1=D1-  5                            * 87C26

* refs (19): 871A3 87271 87406 87549 8777D 877BE ...
GETAB1~jump:
            GOVLNG  GETAB1                       * 87C29

* refs (7): 8733E 8737E 87B11 87B38 87B40 87E93 ...
GETAB0~jump:
            GOVLNG  GETAB0                       * 87C30

* refs (5): 87480 87599 875BF 8784C 8806A
Get1%CD~jump:
            GOVLNG  Get1%CD                      * 87C37

* refs (2): 87E4C 87EA7
* AB -> : stores AB in the workspace at #25D, with D0 left after it. The first operand of a complex operation goes here and at #272
PRPut25D:
            P=      0                            * 87C3E
            LC(5)   #0025D                       * 87C40
            GOTO    PRPut1F4.L1                  * 87C47

* refs (3): 87B01 87F57 8821F
* AB -> : stores AB in the workspace at #1F4, with D0 left after it. A saved complex number lives here and at #209
PRPut1F4:
            P=      0                            * 87C4B
            LC(5)   #001F4                       * 87C4D
PRPut1F4.L1:
            D=C     A                            * 87C54
            C=R4                                 * 87C56
            SETHEX                               * 87C59
            C=C+D   A                            * 87C5B
            SETDEC                               * 87C5D
            D0=C                                 * 87C5F
            GOTO    PUTAB0~jump_2                * 87C62

* refs (1): 87E50
* -> CD: reads the workspace at #209
PRGet209:
            P=      0                            * 87C66
            LC(5)   #00209                       * 87C68
            GOTO    PRGet1F4.L1                  * 87C6F

* refs (2): 87B09 87E34
* -> CD: reads the workspace at #1F4
PRGet1F4:
            P=      0                            * 87C73
            LC(5)   #001F4                       * 87C75
PRGet1F4.L1:
            D=C     A                            * 87C7C
            C=R4                                 * 87C7E
            SETHEX                               * 87C81
            C=C+D   A                            * 87C83
            SETDEC                               * 87C85
            D0=C                                 * 87C87

* refs (7): 87350 873B0 873BD 87982 87E40 87EF5 ...
GETCD0~jump:
            GOVLNG  GETCD0                       * 87C8A

* refs (1): 87FBB
* AB -> : stores AB in the workspace field #011 (D1 ends after it)
PRPut011:
            P=      0                            * 87C91
            LC(3)   #011                         * 87C93
            GOTO    PRGet1DF.L1                  * 87C98

* refs (1): 87300
* AB -> : stores AB in the workspace field #050 (D1 ends after it)
PRPut050:
            P=      0                            * 87C9C
            LC(3)   #050                         * 87C9E
            GOTO    PRGet1DF.L1                  * 87CA3

* refs (2): 875DF 8772A
* AB -> : stores AB in the workspace field #07A (D1 ends after it)
PRPut07A:
            P=      0                            * 87CA7
            LC(3)   #07A                         * 87CA9
            GOTO    PRGet1DF.L1                  * 87CAE

* refs (1): 87834
* AB -> : stores AB in the workspace field #10D (D1 ends after it)
PRPut10D:
            P=      0                            * 87CB2
            LC(3)   #10D                         * 87CB4
            GOTO    PRGet1DF.L1                  * 87CB9

* refs (1): 87433
* AB -> : stores AB in the workspace field #122 (D1 ends after it)
PRPut122:
            P=      0                            * 87CBD
            LC(3)   #122                         * 87CBF
            GOTO    PRGet1DF.L1                  * 87CC4

* refs (1): 878AC
* AB -> : stores AB in the workspace field #137 (D1 ends after it)
PRPut137:
            P=      0                            * 87CC8
            LC(3)   #137                         * 87CCA
            GOTO    PRGet1DF.L1                  * 87CCF

* refs (1): 8805E
* AB -> : stores AB in the workspace field #161 (D1 ends after it)
PRPut161:
            P=      0                            * 87CD3
            LC(3)   #161                         * 87CD5
            GOTO    PRGet1DF.L1                  * 87CDA

* refs (2): 8745B 8773A
* AB -> : stores AB in the workspace field #18B (D1 ends after it)
PRPut18B:
            P=      0                            * 87CDE
            LC(3)   #18B                         * 87CE0
            GOTO    PRGet1DF.L1                  * 87CE5

* refs (1): 874D9
* AB -> : stores AB in the workspace field #1A0 (D1 ends after it)
PRPut1A0:
            P=      0                            * 87CE9
            LC(3)   #1A0                         * 87CEB
            GOTO    PRGet1DF.L1                  * 87CF0

* refs (1): 8725F
* AB -> : stores AB in the workspace field #1CA (D1 ends after it)
PRPut1CA:
            P=      0                            * 87CF4
            LC(3)   #1CA                         * 87CF6
            GOTO    PRGet1DF.L1                  * 87CFB

* refs (1): 873FC
* AB -> : stores AB in the workspace field #1DF (D1 ends after it)
PRPut1DF:
            P=      0                            * 87CFF
            LC(3)   #1DF                         * 87D01
            GOTO    PRGet1DF.L1                  * 87D06

* refs (1): 877D6
* -> AB: reads the workspace field #011 (D1 ends after it)
PRGet011:
            P=      0                            * 87D0A
            LC(3)   #011                         * 87D0C
            GOTO    PRGet1DF.L2                  * 87D11

* refs (2): 87210 87636
* -> AB: reads the workspace field #026 (D1 ends after it)
PRGet026:
            P=      0                            * 87D15
            LC(3)   #026                         * 87D17
            GOTO    PRGet1DF.L2                  * 87D1C

* refs (1): 8804A
* -> AB: reads the workspace field #050 (D1 ends after it)
PRGet050:
            P=      0                            * 87D20
            LC(3)   #050                         * 87D22
            GOTO    PRGet1DF.L2                  * 87D27

* refs (1): 87541
* -> AB: reads the workspace field #0A4 (D1 ends after it)
PRGet0A4:
            P=      0                            * 87D2B
            LC(3)   #0A4                         * 87D2D
            GOTO    PRGet1DF.L2                  * 87D32

* refs (1): 87FEF
* -> AB: reads the workspace field #0F8 (D1 ends after it)
PRGet0F8:
            P=      0                            * 87D36
            LC(3)   #0F8                         * 87D38
            GOTO    PRGet1DF.L2                  * 87D3D

* refs (1): 87573
* -> AB: reads the workspace field #10D (D1 ends after it)
PRGet10D:
            P=      0                            * 87D41
            LC(3)   #10D                         * 87D43
            GOTO    PRGet1DF.L2                  * 87D48

* refs (1): 87470
* -> AB: reads the workspace field #122 (D1 ends after it)
PRGet122:
            P=      0                            * 87D4C
            LC(3)   #122                         * 87D4E
            GOTO    PRGet1DF.L2                  * 87D53

* refs (2): 87866 878BF
* -> AB: reads the workspace field #137 (D1 ends after it)
PRGet137:
            P=      0                            * 87D57
            LC(3)   #137                         * 87D59
            GOTO    PRGet1DF.L2                  * 87D5E

* refs (1): 880BF
* -> AB: reads the workspace field #161 (D1 ends after it)
PRGet161:
            P=      0                            * 87D62
            LC(3)   #161                         * 87D64
            GOTO    PRGet1DF.L2                  * 87D69

* refs (1): 87FC3
* -> AB: reads the workspace field #18B (D1 ends after it)
PRGet18B:
            P=      0                            * 87D6D
            LC(3)   #18B                         * 87D6F
            GOTO    PRGet1DF.L2                  * 87D74

* refs (1): 88124
* -> AB: reads the workspace field #1B5 (D1 ends after it)
PRGet1B5:
            P=      0                            * 87D78
            LC(3)   #1B5                         * 87D7A
            GOTO    PRGet1DF.L2                  * 87D7F

* refs (3): 872B6 8781A 880CF
* -> AB: reads the workspace field #1CA (D1 ends after it)
PRGet1CA:
            P=      0                            * 87D83
            LC(3)   #1CA                         * 87D85
            GOTO    PRGet1DF.L2                  * 87D8A

* refs (1): 874C0
* -> AB: reads the workspace field #1DF (D1 ends after it)
PRGet1DF:
            P=      0                            * 87D8E
            LC(3)   #1DF                         * 87D90
            GOTO    PRGet1DF.L2                  * 87D95
PRGet1DF.L1:
            GOSUB   PRField                      * 87D99
            GOTO    PutAB%1~jump                 * 87D9D
PRGet1DF.L2:
            GOSUB   PRField                      * 87DA1
            GOTO    GETAB1~jump                  * 87DA5

* refs (2): 87F14 8813B
* D1 = workspace field #026
PRField026:
            P=      0                            * 87DA9
            LC(3)   #026                         * 87DAB

* refs (4): 8750B 87B5F 87D99 87DA1
* C.X = offset -> D1 = R4+offset; C.A = that address; hex mode
PRField:
            SETHEX                               * 87DB0
            P=      3                            * 87DB2
            LC(2)   #00                          * 87DB4
            P=      0                            * 87DB8
            D=C     A                            * 87DBA
            C=R4                                 * 87DBC
            C=C+D   A                            * 87DBF
            D1=C                                 * 87DC1
            RTN                                  * 87DC4

* refs (5): 8727D 87298 87449 87A16 87A79
* C.A = n -> AB = coefficient of power n
PRGetCoef:
            GOSUB   PRCoefAddr                   * 87DC6
            GOTO    GETAB1~jump                  * 87DCA

* refs (3): 878D0 87DC6 87F20
* C.A = n -> D1 = address of the coefficient of power n
PRCoefAddr:
            SETHEX                               * 87DCE
            D=C     A                            * 87DD0
            C=R4                                 * 87DD2
            D1=C                                 * 87DD5
            C=DAT1  A                            * 87DD8
            C=C-D   A                            * 87DDB
            GOSBVL  C*42>D                       * 87DDD
            P=      0                            * 87DE4
            LC(5)   #00272                       * 87DE6
PRCoefAddr.L1:
            D=D+C   A                            * 87DED
            CD1EX                                * 87DEF
            C=C+D   A                            * 87DF2
            D1=C                                 * 87DF4
            RTN                                  * 87DF7

* refs (1): 8761F
* AB C.A = n -> : stores into the auxiliary array after the coefficients
PRPutAux:
            GOSUB   PRAuxAddr                    * 87DF9
            GOTO    PutAB%1~jump                 * 87DFD

* refs (1): 87F6C
* C.A = n -> AB: reads the auxiliary array after the coefficients
PRGetAux:
            GOSUB   PRAuxAddr                    * 87E01
            GOTO    GETAB1~jump                  * 87E05

* refs (3): 878DA 87DF9 87E01
* C.A = n -> D1 = address of entry n of the auxiliary array
PRAuxAddr:
            SETHEX                               * 87E09
            D=C     A                            * 87E0B
            C=R4                                 * 87E0D
            D1=C                                 * 87E10
            C=DAT1  A                            * 87E13
            D=C-D   A                            * 87E16
            D1=D1+  5                            * 87E18
            C=DAT1  A                            * 87E1B
            C=C+D   A                            * 87E1E
            GOSBVL  C*42>D                       * 87E20
            P=      0                            * 87E27
            LC(5)   #00297                       * 87E29
            GOTO    PRCoefAddr.L1                * 87E30

* refs (5): 8765C 876A5 876F2 88187 881D3
* AB R0R1 -> sum: adds the saved complex number at #1F4
CAddSaved:
            GOSUB   PRGet1F4                     * 87E34
            GOSUB   AddR0.L1                     * 87E38
            GOSUB   EXAB0~jump_3                 * 87E3C
            GOSUB   GETCD0~jump                  * 87E40
            GOSUB   AddR0.L1                     * 87E44
            GOTO    EXAB0~jump_3                 * 87E48

* refs (7): 8764A 8768A 876DC 878A8 880C7 8815F ...
* AB R0R1 -> product with the saved complex number at #1F4
CMulSaved:
            GOSUB   PRPut25D                     * 87E4C

* refs (1): 87EED
* Complex multiply of the numbers at #25D and #1F4: the real part in AB, the imaginary part in R0,R1
CMul:
            GOSUB   PRGet209                     * 87E50
            GOSUB   MULTF~jump_5                 * 87E54
            GOSUB   STAB2~jump_6                 * 87E58
            GOSUB   RCAB0~jump                   * 87E5C
            GOSUB   D0Back2%%a                   * 87E60
            GOSUB   MulD0%%a                     * 87E64
            GOSUB   RCCD2~jump_6                 * 87E68
            CD0EX                                * 87E6C
            RSTK=C                               * 87E6F
            CD0EX                                * 87E71
            GOSBVL  RADDF                        * 87E74
            C=RSTK                               * 87E7B
            D0=C                                 * 87E7D
            GOSUB   EXAB0~jump_3                 * 87E80
            A=-A-1  S                            * 87E84
            GOSUB   MulD0%%a                     * 87E87
            GOSUB   STAB2~jump_6                 * 87E8B
            GOSUB   D0Back2%%a                   * 87E8F
            GOSUB   GETAB0~jump                  * 87E93
            GOSUB   D0Fwd4%%                     * 87E97
            GOSUB   MulD0%%a                     * 87E9B
            GOSUB   RCCD2~jump_6                 * 87E9F
            GOTO    AddR0.L1                     * 87EA3

* refs (6): 8724B 872A4 8805A 880E4 881E3 881FB
* Complex divide with the saved number at #1F4 and AB R0R1, operands placed as for CMul. A zero divisor gives a large result rather than an error
CDivSaved:
            GOSUB   PRPut25D                     * 87EA7
            GOSUB   EXAB0~jump_3                 * 87EAB
            A=-A-1  S                            * 87EAF
            GOSUB   STAB2~jump_6                 * 87EB2
            GOSUB   Norm2ABR0                    * 87EB6
            P=      14                           * 87EBA
            ?B#0    WP                           * 87EBC
            GOYES   STAB0~jump_6.L1              * 87EBF
            B=0     S                            * 87EC1
            B=B+1   P                            * 87EC4
            C=0     W                            * 87EC7
            P=      3                            * 87ECA
            LC(1)   #5                           * 87ECC
            A=C     W                            * 87ECF

* refs (17): 872B0 87378 87476 8749E 8758D 8779D ...
STAB0~jump_6:
            GOVLNG  STAB0                        * 87ED2
STAB0~jump_6.L1:
            GOSUB   D0Back2%%a                   * 87ED9
            GOSUB   PUTAB0~jump_2                * 87EDD
            GOSUB   RCAB2~jump_3                 * 87EE1
            GOSUB   STAB0~jump_6                 * 87EE5
            GOSUB   GETAB0~jump                  * 87EE9
            GOSUB   CMul                         * 87EED
            GOSUB   D0Back2%%a                   * 87EF1
            GOSUB   GETCD0~jump                  * 87EF5
            GOSBVL  STCD2                        * 87EF9
            GOSUB   DIVF~jump_3                  * 87F00
            GOSUB   EXAB0~jump_3                 * 87F04
            GOSUB   RCCD2~jump_6                 * 87F08
            GOSUB   DIVF~jump_3                  * 87F0C
            GOTO    EXAB0~jump_3                 * 87F10

* refs (2): 87200 87265
* Copies the coefficients of powers 0, 1 and 2 to the workspace at #026, for the local expansion around the current point
PRSaveLow3:
            GOSUB   PRField026                   * 87F14
            D0=C                                 * 87F18
            C=0     A                            * 87F1B
            LC(1)   #2                           * 87F1D
            GOSUB   PRCoefAddr                   * 87F20
            LC(1)   #5                           * 87F24
PRSaveLow3.loop1:
            A=DAT1  A                            * 87F27
            D1=D1+  5                            * 87F2A
            DAT0=A  A                            * 87F2D
            D0=D0+  5                            * 87F30
            A=DAT1  W                            * 87F33
            D1=D1+  16                           * 87F37
            DAT0=A  W                            * 87F3A
            D0=D0+  16                           * 87F3E
            C=C-1   P                            * 87F41
            GONC    PRSaveLow3.loop1             * 87F44
            RTN                                  * 87F47
PRSaveLow3.L2:
            GOSUB   D1Back5%%                    * 87F49
            GOSUB   Get2ABR0                     * 87F4D
            SETDEC                               * 87F51
            GOSUB   HypotABR0                    * 87F53
            GOSUB   PRPut1F4                     * 87F57
            C=R4                                 * 87F5B
            D1=C                                 * 87F5E
            C=DAT1  A                            * 87F61
            SETHEX                               * 87F64
            C=C-1   A                            * 87F66
            RSTK=C                               * 87F68
            C=C+1   A                            * 87F6A
            GOSUB   PRGetAux                     * 87F6C
            GOSUB   Get2Tail                     * 87F70
            SETDEC                               * 87F74
            GOSUB   HypotABR0                    * 87F76
PRSaveLow3.loop3:
            SETDEC                               * 87F7A
            D0=D0-  16                           * 87F7C
            D0=D0-  5                            * 87F7F
            GOSUB   MulD0%%a                     * 87F82
            GOSUB   STAB2~jump_6                 * 87F86
            GOSUB   Get2ABR0                     * 87F8A
            GOSUB   HypotABR0                    * 87F8E
            GOSUB   RCCD2~jump_6                 * 87F92
            GOSUB   AddR0.L1                     * 87F96
            GOSBVL  CkATTNcode                   * 87F9A
            C=RSTK                               * 87FA1
            C=C-1   A                            * 87FA3
            RSTK=C                               * 87FA5
            GONC    PRSaveLow3.loop3             * 87FA7
            SETDEC                               * 87FAA
            GOSUB   SUB_87999                    * 87FAC
            P=      0                            * 87FB0
            LC(5)   #00013                       * 87FB2
            A=A-C   A                            * 87FB9
            GOSUB   PRPut011                     * 87FBB
            GOSUB   STAB2~jump_6                 * 87FBF
            GOSUB   PRGet18B                     * 87FC3
            GOSUB   ABtoCD                       * 87FC7
            GOSBVL  EXAB2                        * 87FCB
            GOSUB   SubCDTest                    * 87FD2
            GONC    PRSaveLow3.L4                * 87FD6
            GOTO    PolyRootsC.L38               * 87FD9
PRSaveLow3.L4:
            C=R4                                 * 87FDD
            D1=C                                 * 87FE0
            D1=D1+  10                           * 87FE3
            C=DAT1  S                            * 87FE6
            ?C=0    S                            * 87FEA
            GOYES   PRSaveLow3.L5                * 87FED
            GOSUB   PRGet0F8                     * 87FEF
            GOSUB   RCCD2~jump_6                 * 87FF3
            GOSUB   XYEX~jump_4                  * 87FF7
            GOSUB   SubCDTest                    * 87FFB
            GONC    PRSaveLow3.L5                * 87FFF
            GOLONG  PolyRootsC.L32               * 88002
PRSaveLow3.L5:
            GOSUB   SUB_8804A                    * 88008
            GOSUB   D1Back2%%                    * 8800C
            GOSUB   GETAB1~jump                  * 88010
            GOSUB   STAB2~jump_6                 * 88014
            GOSUB   D1Back6%%                    * 88018
            GOSUB   Get2ABR0                     * 8801C
            GOSUB   HypotABR0                    * 88020
            GOSUB   ABtoCD                       * 88024
            GOSBVL  EXAB2                        * 88028
            GOSUB   AddR0.L1                     * 8802F
            GOSUB   RCCD2~jump_6                 * 88033
            GOSUB   SubCDTest                    * 88037
            ?B#0    WP                           * 8803B
            GOYES   PRSaveLow3.L6                * 8803E
            GOTO    PolyRootsC.L38               * 88040
PRSaveLow3.L6:
            GOLONG  PolyRootsC.L18               * 88044

* refs (2): 8726B 88008
SUB_8804A:
            GOSUB   PRGet050                     * 8804A
            GOSUB   Get2Tail                     * 8804E
            GOSUB   Save2ABR0                    * 88052
            GOSUB   Get2ABR0                     * 88056
            GOSUB   CDivSaved                    * 8805A
            GOSUB   PRPut161                     * 8805E
            GOSUB   PutR0D1                      * 88062
            GOSUB   D1Fwd3%%                     * 88066
            GOSUB   Get1%CD~jump                 * 8806A
            GOSBVL  STCD2                        * 8806E
            SETDEC                               * 88075
            GOSUB   AB%%2                        * 88077
            GOSUB   DIVF~jump_3                  * 8807B
            A=-A-1  S                            * 8807F
            GOSBVL  RADD1                        * 88082
            GOSUB   D1Back6%%                    * 88089
            GOSUB   PRScale2.L1                  * 8808D
            GOSUB   RCAB2~jump_3                 * 88091
            GOSBVL  RSUB1                        * 88095
            P=      0                            * 8809C
            LC(3)   #050                         * 8809E
            GOSUB   PRScale2                     * 880A3
            GOSUB   RCAB2~jump_3                 * 880A7
            GOSUB   MulR0                        * 880AB
            GOSUB   SUB_879A0                    * 880AF
            GOSUB   PRScale2.L1                  * 880B3
            GOSUB   SUB_8813B                    * 880B7
            GOSUB   Save2ABR0                    * 880BB
            GOSUB   PRGet161                     * 880BF
            GOSUB   Get2Tail                     * 880C3
            GOSUB   CMulSaved                    * 880C7
            GOSUB   STAB2~jump_6                 * 880CB
            GOSUB   PRGet1CA                     * 880CF
            SETDEC                               * 880D3
            GOSBVL  RSUB1                        * 880D5
            GOSUB   RCCD2~jump_6                 * 880DC
            GOSUB   AddR0.L1                     * 880E0
            GOSUB   CDivSaved                    * 880E4
            GOSUB   D1Back6%%                    * 880E8
            GOSUB   Put2ABR0D1                   * 880EC
            GOSUB   HypotABR0                    * 880F0
            D1=D1+  16                           * 880F4
            D1=D1+  5                            * 880F7
            GOSUB   PutAB%1~jump                 * 880FA
            GOSUB   STAB2~jump_6                 * 880FE
            D1=D1+  16                           * 88102
            D1=D1+  5                            * 88105
            GOSUB   GETAB1~jump                  * 88108
            GOSUB   SQRF~jump_2                  * 8810C
            GOSUB   RCCD2~jump_6                 * 88110
            GOSUB   MULTF~jump_5                 * 88114
            GOSUB   D1Back2%%                    * 88118
            GOTO    PutAB%1~jump                 * 8811C

* refs (2): 872DC 87427
* AB -> : workspace field #1B5 becomes the smaller of itself and AB
PRKeepMin:
            GOSUB   STAB0~jump_6                 * 88120
            GOSUB   PRGet1B5                     * 88124
            GOSUB   RCCD0~jump_6                 * 88128
            GOSUB   SubCDTest                    * 8812C
            RTNNC                                * 88130
            GOSUB   RCAB0~jump                   * 88133
            GOTO    PutAB%1Back                  * 88137

* refs (2): 87206 880B7
SUB_8813B:
            GOSUB   PRField026                   * 8813B
            GOSUB   PRDouble2                    * 8813F
            GOSUB   D1Fwd2%%                     * 88143
            GOSUB   PRDouble2                    * 88147
            GOSUB   D1Back6%%                    * 8814B
            GOSUB   Get2ABR0                     * 8814F
            GOSUB   Save2ABR0                    * 88153
            GOSUB   D1Fwd2%%                     * 88157
            GOSUB   Get2ABR0                     * 8815B
            GOSUB   CMulSaved                    * 8815F
            GOSUB   CNeg                         * 88163
            GOSUB   D0Back4%%                    * 88167
            GOSUB   Put2ABR0                     * 8816B
            GOSUB   D1Back4%%                    * 8816F
            GOSUB   Get2ABR0                     * 88173
            GOSUB   Save2ABR0                    * 88177
            GOSUB   CMulSaved                    * 8817B
            GOSUB   Save2ABR0                    * 8817F
            GOSUB   Get2ABR0D0                   * 88183
            GOSUB   CAddSaved                    * 88187
            GOSUB   CSqrt                        * 8818B
            D0=D0+  16                           * 8818F
            D0=D0+  5                            * 88192
            GOSUB   Put2ABR0                     * 88195
            GOSUB   D1Back2%%                    * 88199
            GOSUB   Get2ABR0                     * 8819D
            GOSUB   CNeg                         * 881A1
            GOSUB   Save2ABR0                    * 881A5
            GOSUBL  MulD0%%a                     * 881A9
            GOSUB   EXAB0~jump_3                 * 881AF
            GOSUBL  MulD0%%a                     * 881B3
            GOSUBL  AddR0                        * 881B9
            C=A     S                            * 881BF
            GOSUB   D0Back2%%a                   * 881C2
            GOSUB   Get2ABR0D0                   * 881C6
            ?C=0    S                            * 881CA
            GOYES   SUB_8813B.L1                 * 881CD
            GOSUB   CNeg                         * 881CF
SUB_8813B.L1:
            GOSUB   CAddSaved                    * 881D3
            GOSUB   Save2ABR0                    * 881D7
            GOSUB   D1Back4%%                    * 881DB
            GOSUB   Get2ABR0                     * 881DF
            GOSUB   CDivSaved                    * 881E3
            GOSUB   D1Back2%%                    * 881E7
            GOSUB   Put2ABR0D1                   * 881EB
            GOSUB   D1Fwd2%%                     * 881EF
            GOSUB   Get2ABR0                     * 881F3
            GOSUB   CSwapSaved                   * 881F7
            GOSUB   CDivSaved                    * 881FB
            GOSUB   D1Back4%%                    * 881FF
            GOTO    Put2ABR0D1                   * 88203

* refs (4): 87245 88163 881A1 881CF
* AB R0R1 -> -AB -R0R1: complex negate
CNeg:
            A=-A-1  S                            * 88207
            C=R0                                 * 8820A
            C=-C-1  S                            * 8820D
            R0=C                                 * 88210
            RTN                                  * 88213

* refs (1): 8818B
* AB R0R1 -> complex square root, from the modulus
CSqrt:
            GOSUBL  STAB2~jump_6                 * 88215
            GOSUB   EXAB0~jump_3                 * 8821B
            GOSUB   PRPut1F4                     * 8821F
            GOSUB   HypotABR0                    * 88223
            ?B#0    W                            * 88227
            GOYES   CSqrt.L1                     * 8822A
            GOTO    STAB0~jump_6                 * 8822C
CSqrt.L1:
            GOSUBL  RCCD2~jump_6                 * 88230
            C=0     S                            * 88236
            GOSUBL  AddR0.L1                     * 88239
            GOSUBL  SUB_879A0                    * 8823F
            GOSUB   SQRF~jump_2                  * 88245
            GOSUB   STAB0~jump_6                 * 88249
            GOSUBL  SUB_87999                    * 8824D
            D0=D0-  16                           * 88253
            D0=D0-  5                            * 88256
            GOSUB   GETCD0~jump                  * 88259
            GOSUBL  XYEX~jump_4                  * 8825D
            GOSUBL  DIVF~jump_3                  * 88263
            C=R2                                 * 88269
            ?C=0    S                            * 8826C
            GOYES   CSqrt.L2                     * 8826F
            C=R0                                 * 88271
            C=A     S                            * 88274
            R0=C                                 * 88277
            A=0     S                            * 8827A
            RTN                                  * 8827D
CSqrt.L2:
            GOTO    EXAB0~jump_3                 * 8827F

* refs (12): 872AA 8732C 87364 87455 87734 87797 ...
* A/B = sqrt(x^2+y^2) for x in A/B and y in R0/R1 (the modulus of a complex number held as two %%)
* AB R0R1 -> AB = modulus SQRT(AB^2+R0R1^2), short-cut when either part is zero
HypotABR0:
            P=      14                           * 88283
            C=R1                                 * 88285
            ?C#0    WP                           * 88288
            GOYES   HypotABR0.L2                 * 8828B
HypotABR0.loop1:
            A=0     S                            * 8828D
            RTN                                  * 88290
HypotABR0.L2:
            ?B#0    WP                           * 88292
            GOYES   HypotABR0.L3                 * 88295
            GOSUBL  RCAB0~jump                   * 88297
            GONC    HypotABR0.loop1              * 8829D
HypotABR0.L3:
            GOSUBL  SquareAB                     * 882A0
            GOSUB   EXAB0~jump_3                 * 882A6
            GOSUBL  SquareAB                     * 882AA
            GOSUBL  RCCD0~jump_6                 * 882B0
            CD0EX                                * 882B6
            RSTK=C                               * 882B9
            CD0EX                                * 882BB
            GOSBVL  RADDF                        * 882BE
            C=RSTK                               * 882C5
            D0=C                                 * 882C7

* refs (2): 8810C 88245
SQRF~jump_2:
            GOVLNG  SQRF                         * 882CA

* refs (1): 87EB6
* AB R0R1 -> AB = squared modulus
Norm2ABR0:
            GOSUBL  SquareAB                     * 882D1
            GOSUB   EXAB0~jump_3                 * 882D7
            GOSUBL  SquareAB                     * 882DB
            GOLONG  AddR0                        * 882E1
          ENDCODE                                * 882E7
        ;                                        * 882E7

* ROMPTR 0C0 001
* refs (1): 86FE4
* [coefficients] -> [roots]: Invalid Dimension with fewer than two coefficients. Makes the complex result array and picks PolyRootsR or PolyRootsC; a result without imaginary parts becomes a real array
PROOTcore:
        :: DUP ARSIZE DUPTWO #< casedrop doerr501 * 882EC
          DUP#1- ONE{}N C%0 MAKEARRY 3UNROLL OVER CArry0Im? ITE * 8830F
          XLIB PolyRootsR XLIB PolyRootsC        * 88337
          DUP CArry0Im? case MATRE               * 8834D
        ;                                        * 88361

* ROMPTR 0C0 002
* refs (1): 86FE4
* [coefficients] [roots] hxs -> : PROOT core for real coefficients, a copy of PolyRootsC that stores one extended real per coefficient and uses real arithmetic where it can
PolyRootsR:
        :: # 2A #* # 272 #+ !MAKEHXS             * 88366
          CODE                                   * 8838E  5492 nibbles
            HST=0   3                            * 88398
            D1=D1+  10                           * 8839B
            D=D+1   A                            * 8839E
            D=D+1   A                            * 883A0
            GOSBVL  SAVPTR                       * 883A2
            D1=D1-  10                           * 883A9
            A=DAT1  A                            * 883AC
            D0=A                                 * 883AF
            D0=D0+  10                           * 883B2
            AD0EX                                * 883B5
            R4=A                                 * 883B8
            D1=D1+  10                           * 883BB
            A=DAT1  A                            * 883BE
            D0=A                                 * 883C1
            D0=D0+  15                           * 883C4
            D0=D0+  5                            * 883C7
            A=DAT0  A                            * 883CA
            R1=A                                 * 883CD
            D0=D0+  5                            * 883D0
            AD0EX                                * 883D3
            R3=A                                 * 883D6
            D1=D1-  5                            * 883D9
            A=DAT1  A                            * 883DC
            D0=A                                 * 883DF
            D0=D0+  10                           * 883E2
            A=DAT0  A                            * 883E5
            ST=0    0                            * 883E8
            LC(5)   DOREAL                       * 883EB
            ?C=A    A                            * 883F2
            GOYES   PolyRootsR.L1                * 883F5
            ST=1    0                            * 883F7
PolyRootsR.L1:
            D0=D0+  5                            * 883FA
            A=DAT0  A                            * 883FD
            D0=D0+  10                           * 88400
            A=A-1   A                            * 88403
            ?A=0    A                            * 88405
            GOYES   PolyRootsR.L2                * 88408
            D0=D0+  5                            * 8840A
PolyRootsR.L2:
            AD0EX                                * 8840D
            R2=A                                 * 88410
            A=R4                                 * 88413
            D1=A                                 * 88416
            A=R1                                 * 88419
            DAT1=A  A                            * 8841C
            D1=D1+  5                            * 8841F
            DAT1=A  A                            * 88422
            D1=D1+  7                            * 88425
            A=R3                                 * 88428
            DAT1=A  A                            * 8842B
            AD1EX                                * 8842E
            LC(5)   #00266                       * 88431
            A=A+C   A                            * 88438
            D1=A                                 * 8843A
            LC(5)   #90000                       * 8843D
            CR2EX                                * 88444
            D0=C                                 * 88447
PolyRootsR.loop3:
            A=DAT0  W                            * 8844A
            D0=D0+  16                           * 8844E
            ?ST=0   0                            * 88451
            GOYES   PolyRootsR.L4                * 88454
            D0=D0+  16                           * 88456
PolyRootsR.L4:
            GOSBVL  SPLITA                       * 88459
            GOSUBL  PutAB%1~jump_2               * 88460
            C=R2                                 * 88466
            P=      4                            * 88469
            ?C=A    P                            * 8846B
            GOYES   PolyRootsR.L5                * 8846E
            ?C#0    P                            * 88470
            GOYES   PolyRootsR.L6                * 88473
            GONC    PolyRootsR.L7                * 88475
PolyRootsR.L5:
            ?C>=A   A                            * 88478
            GOYES   PolyRootsR.L7                * 8847B
PolyRootsR.L6:
            R2=A                                 * 8847D
PolyRootsR.L7:
            GOSBVL  CkATTNcode                   * 88480
            A=R1                                 * 88487
            A=A-1   A                            * 8848A
            R1=A                                 * 8848C
            GONC    PolyRootsR.loop3             * 8848F
            P=      0                            * 88492
            C=0     S                            * 88494
            GOSUBL  PRStripTopb                  * 88497
            C=0     S                            * 8849D
            GOSUBL  PRStripEndb                  * 884A0
            A=R2                                 * 884A6
            LC(5)   #00480                       * 884A9
            P=      4                            * 884B0
            ?A#0    P                            * 884B2
            GOYES   PolyRootsR.L8                * 884B5
            ?C<=A   A                            * 884B7
            GOYES   PolyRootsR.loop13            * 884BA
PolyRootsR.L8:
            SETDEC                               * 884BC
            C=C-A   A                            * 884BE
            GOTO    PolyRootsR.L10               * 884C0
PolyRootsR.loop9:
            P=      0                            * 884C4
            LC(5)   #99988                       * 884C6
PolyRootsR.L10:
            R0=C                                 * 884CD
            GOSUBL  PRCoefBaseb                  * 884D0
            C=DAT1  A                            * 884D6
            R1=C                                 * 884D9
            D1=A                                 * 884DC
PolyRootsR.loop11:
            GOSUBL  GETAB1~jump_2                * 884DF
            ?B=0    W                            * 884E5
            GOYES   PolyRootsR.L12               * 884E8
            SETDEC                               * 884EA
            C=R0                                 * 884EC
            A=A+C   A                            * 884EF
            GOSUBL  PRExpLimitb                  * 884F1
            GOSUBL  PutAB%1Backb                 * 884F7
PolyRootsR.L12:
            GOSBVL  CkATTNcode                   * 884FD
            C=R1                                 * 88504
            C=C-1   A                            * 88507
            R1=C                                 * 88509
            GONC    PolyRootsR.loop11            * 8850C
            C=0     S                            * 8850F
            C=C+1   S                            * 88512
            GOSUBL  PRStripTopb                  * 88515
PolyRootsR.loop13:
            C=0     S                            * 8851B
            C=C+1   S                            * 8851E
            GOSUBL  PRStripEndb                  * 88521
            C=R4                                 * 88527
            D1=C                                 * 8852A
            C=DAT1  A                            * 8852D
            C=C-1   A                            * 88530
            C=C-1   A                            * 88532
            GOC     PolyRootsR.L14               * 88534
            C=C-1   A                            * 88537
            GONC    PolyRootsR.L15               * 88539
            GOSUBL  PRSaveLow3b                  * 8853C
            GOSUBL  SUB_89760                    * 88542
            GOSUBL  PRRootb                      * 88548
            GOSUBL  PRGet026b                    * 8854E
            GOSUBL  Get2Tailb                    * 88554
            GOLONG  PRRootb                      * 8855A
PolyRootsR.L14:
            GOSUBL  PRCoefBaseb                  * 88560
            D1=A                                 * 88566
            GOSUBL  Get1%CD~jump_2               * 88569
            GOSUBL  GETAB1~jump_2                * 8856F
            SETDEC                               * 88575
            A=-A-1  S                            * 88577
            GOSUBL  DIVF~jump_4                  * 8857A
            C=0     W                            * 88580
            R0=C                                 * 88583
            R1=C                                 * 88586
            GOLONG  PRRootb                      * 88589
PolyRootsR.L15:
            A=DAT1  A                            * 8858F
            GOSBVL  Hex>15                       * 88592
            GOSUBL  PRPut1CAb                    * 88599
            GOSUBL  PRSaveLow3b                  * 8859F
            GOSUBL  SUB_89667                    * 885A5
            GOSUBL  GETAB1~jump_2                * 885AB
            GOSUBL  STAB2~jump_7                 * 885B1
            C=R4                                 * 885B7
            D1=C                                 * 885BA
            C=DAT1  A                            * 885BD
            GOSUBL  PRGetCoefb                   * 885C0
            GOSUBL  STAB0~jump_7                 * 885C6
            C=0     A                            * 885CC
            GOSUBL  PRGetCoefb                   * 885CE
            SETDEC                               * 885D4
            GOSUBL  RCCD0~jump_7                 * 885D6
            GOSUBL  DIVF~jump_4                  * 885DC
            A=0     S                            * 885E2
            GOSBVL  aLN                          * 885E5
            GOSUBL  RCCD2~jump_7                 * 885EC
            GOSUBL  DIVF~jump_4                  * 885F2
            GOSBVL  aEXP                         * 885F8
            GOSUBL  PRKeepMinb                   * 885FF
            GOSUBL  GETAB1Backb                  * 88605
            C=0     W                            * 8860B
            D=0     W                            * 8860E
            P=      14                           * 88611
            D=D+1   P                            * 88613
            D=D+1   M                            * 88616
            GOSUBL  MULTF~jump_6                 * 88619
            GOSUBL  PutAB%1Backb                 * 8861F
            GOSUBL  PRPut050b                    * 88625
            D0=C                                 * 8862B
PolyRootsR.loop16:
            GOSUBL  PRCoefBaseb                  * 8862E
            C=DAT1  A                            * 88634
            C=C-1   A                            * 88637
            D1=A                                 * 88639
            A=0     W                            * 8863C
            B=0     W                            * 8863F
            GOSUBL  PUTAB0Back                   * 88642
            GOSUBL  GETAB1~jump_2                * 88648
            A=0     S                            * 8864E
            D0=D0-  16                           * 88651
            D0=D0-  5                            * 88654
            GOSUBL  PUTAB0Back                   * 88657
PolyRootsR.loop17:
            R3=C                                 * 8865D
            GOSUBL  GETAB0~jump_2                * 88660
            SETDEC                               * 88666
            GOSUBL  MulD0%%                      * 88668
            GOSUBL  D0Back3%%b                   * 8866E
            GOSUBL  GETCD0~jump_2                * 88674
            GOSUBL  AddR0b.L1                    * 8867A
            GOSUBL  PUTAB0~jump_3                * 88680
            GOSUBL  GETAB0~jump_2                * 88686
            GOSUBL  D0Back3%%b                   * 8868C
            GOSUBL  MulD0%%                      * 88692
            GOSUBL  Get1%CD~jump_2               * 88698
            C=0     S                            * 8869E
            AR3EX                                * 886A1
            ?A#0    A                            * 886A4
            GOYES   PolyRootsR.L18               * 886A7
            C=-C-1  S                            * 886A9
PolyRootsR.L18:
            AR3EX                                * 886AC
            GOSUBL  AddR0b.L1                    * 886AF
            GOSUBL  PUTAB0Back                   * 886B5
            GOSBVL  CkATTNcode                   * 886BB
            C=R3                                 * 886C2
            C=C-1   A                            * 886C5
            GONC    PolyRootsR.loop17            * 886C7
            SETDEC                               * 886CA
            GOSUBL  GETCD0~jump_2                * 886CC
            GOSUBL  DIVF~jump_4                  * 886D2
            A=-A-1  S                            * 886D8
            GOSUBL  GETCD0~jump_2                * 886DB
            GOSBVL  STCD0                        * 886E1
            GOSUBL  AddR0b.L1                    * 886E8
            GOSUBL  PUTAB0Back                   * 886EE
            D0=D0-  16                           * 886F4
            D0=D0-  5                            * 886F7
            GOSUBL  RCCD0~jump_7                 * 886FA
            GOSUBL  SubCDTestb                   * 88700
            GOC     PolyRootsR.L19               * 88706
            GOTO    PolyRootsR.loop16            * 88709
PolyRootsR.L19:
            GOSUBL  RCAB0~jump_2                 * 8870D
            C=0     W                            * 88713
            C=C-1   A                            * 88716
            D=0     W                            * 88718
            D=D-1   M                            * 8871B
            GOSUBL  MULTF~jump_6                 * 8871E
            GOSUBL  PRPut1DFb                    * 88724
            GOSUBL  D1Back2%%b                   * 8872A
            GOSUBL  GETAB1~jump_2                * 88730
            SETDEC                               * 88736
            GOSUBL  MulD0%%                      * 88738
            D=0     W                            * 8873E
            C=0     W                            * 88741
            P=      11                           * 88744
            LC(4)   #1445                        * 88746
            DCEX    W                            * 8874C
            GOSUBL  MULTF~jump_6                 * 8874F
            GOSUBL  PRKeepMinb                   * 88755
            GOSUBL  GETAB1Backb                  * 8875B
            GOSUBL  PRPut122b                    * 88761
            A=0     W                            * 88767
            B=0     W                            * 8876A
            GOSUBL  PutAB%1~jump_2               * 8876D
            GOSUBL  PutAB%1~jump_2               * 88773
            C=0     A                            * 88779
            GOSUBL  PRGetCoefb                   * 8877B
            A=0     S                            * 88781
            GOSUBL  PRPut18Bb                    * 88784
            C=R4                                 * 8878A
            D1=C                                 * 8878D
            D1=D1+  10                           * 88790
            C=0     B                            * 88793
            DAT1=C  B                            * 88796
PolyRootsR.L20:
            GOSUBL  PRGet122b                    * 88799
            GOSUBL  STAB0~jump_7                 * 8879F
            GOSUBL  D1Fwd5%%b                    * 887A5
            GOSUBL  Get1%CD~jump_2               * 887AB
            GOSBVL  STCD2                        * 887B1
            GOSUBL  SubCDTestb                   * 887B8
            GOC     PolyRootsR.L21               * 887BE
            GOTO    PolyRootsR.L45               * 887C1
PolyRootsR.L21:
            GOSUB   RCAB0~jump_2                 * 887C5
            GOSUB   SUB_88FB7                    * 887C9
            GOSUBL  STAB0~jump_7                 * 887CD
            GOSUB   RCCD2~jump_7                 * 887D3
            GOSUBL  SubCDTestb                   * 887D7
            GOC     PolyRootsR.L23               * 887DD
            C=R4                                 * 887E0
            D1=C                                 * 887E3
            D1=D1+  10                           * 887E6
            C=DAT1  B                            * 887E9
            ?C#0    B                            * 887EC
            GOYES   PolyRootsR.L22               * 887EF
            GOSUBL  PRGet1DFb                    * 887F1
            GOSUB   ABtoCDb                      * 887F7
            GOSUB   RCAB0~jump_2                 * 887FB
            GOSUBL  SubCDTestb                   * 887FF
            GONC    PolyRootsR.L23               * 88805
PolyRootsR.L22:
            GOSUB   RCAB0~jump_2                 * 88808
            GOSUBL  PRPut1A0b                    * 8880C
            SETDEC                               * 88812
            GOSUB   RCCD2~jump_7                 * 88814
            GOSUB   DIVF~jump_4                  * 88818
            GOSUBL  D1Back4%%b                   * 8881C
            GOSUBL  PRScale2b.L1                 * 88822
PolyRootsR.L23:
            C=R4                                 * 88828
            D1=C                                 * 8882B
            D1=D1+  10                           * 8882E
            C=0     S                            * 88831
            C=C+1   S                            * 88834
            DAT1=C  S                            * 88837
            P=      0                            * 8883B
            LC(3)   #0A4                         * 8883D
            GOSUBL  PRFieldb                     * 88842
            D0=C                                 * 88848
            GOSUBL  D1Fwd6%%b                    * 8884B
            D1=D1+  16                           * 88851
            D1=D1+  5                            * 88854
            LC(1)   #6                           * 88857
PolyRootsR.loop24:
            A=DAT1  A                            * 8885A
            D1=D1+  5                            * 8885D
            DAT0=A  A                            * 88860
            D0=D0+  5                            * 88863
            A=DAT1  W                            * 88866
            D1=D1+  16                           * 8886A
            DAT0=A  W                            * 8886D
            D0=D0+  16                           * 88871
            C=C-1   P                            * 88874
            GONC    PolyRootsR.loop24            * 88877
PolyRootsR.loop25:
            GOSUBL  PRGet0A4b                    * 8887A
            GOSUB   ABtoCDb                      * 88880
            GOSUBL  GETAB1~jump_2                * 88884
            GOSUB   STAB2~jump_7                 * 8888A
            GOSUBL  Get2ABR0b                    * 8888E
            SETDEC                               * 88894
            GOSUB   AddR0b.L1                    * 88896
            GOSUBL  EXAB0~jump_4                 * 8889A
            GOSUB   RCCD2~jump_7                 * 888A0
            GOSUB   AddR0b.L1                    * 888A4
            GOSUBL  EXAB0~jump_4                 * 888A8
            GOSUBL  D1Fwd3%%b                    * 888AE
            GOSUBL  Put2ABR0D1b                  * 888B4
PolyRootsR.loop26:
            GOSUBL  PRGet10Db                    * 888BA
            SETDEC                               * 888C0
            C=0     W                            * 888C2
            C=C-1   A                            * 888C5
            D=0     W                            * 888C7
            P=      14                           * 888CA
            D=D+1   P                            * 888CC
            D=D+1   P                            * 888CF
            GOSUB   MULTF~jump_6                 * 888D2
            GOSUBL  STAB0~jump_7                 * 888D6
            GOSUBL  D1Fwd2%%b                    * 888DC
            GOSUBL  Get1%CD~jump_2               * 888E2
            C=0     S                            * 888E8
            GOSUB   SubCDTestb                   * 888EB
            GOC     PolyRootsR.L28               * 888EF
            GOSUB   RCAB0~jump_2                 * 888F2
            GOSUBL  D1Back2%%b                   * 888F6
            GOSUBL  Get1%CD~jump_2               * 888FC
            C=0     S                            * 88902
            GOSUB   SubCDTestb                   * 88905
            GONC    PolyRootsR.L27               * 88909
            A=0     W                            * 8890C
            B=0     W                            * 8890F
            GOSUBL  PutAB%1Backb                 * 88912
PolyRootsR.L27:
            D1=D1+  16                           * 88918
            D1=D1+  5                            * 8891B
            GOTO    PolyRootsR.L34               * 8891E
PolyRootsR.L28:
            GOSUBL  D1Back2%%b                   * 88922
            GOSUBL  GETAB1~jump_2                * 88928
            GOSUBL  STAB0~jump_7                 * 8892E
            A=0     W                            * 88934
            B=0     W                            * 88937
            GOSUBL  PutAB%1~jump_2               * 8893A
            GOSUBL  PRPut03Bb                    * 88940
            D0=C                                 * 88946
            GOSUB   PRCoefBaseb                  * 88949
            C=DAT1  A                            * 8894D
            C=C-1   A                            * 88950
            R2=C                                 * 88952
            C=C+1   A                            * 88955
            D1=A                                 * 88957
            GOSUBL  GETAB1~jump_2                * 8895A
            CD1EX                                * 88960
            R3=C                                 * 88963
            CD1EX                                * 88966
            GOSUBL  PUTAB0Back                   * 88969
            GOSUBL  PRPutAuxb                    * 8896F
            GOTO    PolyRootsR.L32               * 88975
PolyRootsR.loop29:
            GOSUBL  GETAB0~jump_2                * 88979
            SETDEC                               * 8897F
            GOSUB   MulR0b                       * 88981
            GOSUBL  D0Back2%%                    * 88985
            GOSUBL  GETCD0~jump_2                * 8898B
            GOSUB   AddR0b.L1                    * 88991
            GOSUB   PRExpLimitb                  * 88995
            GOC     PolyRootsR.loop30            * 88999
            GOSUBL  PUTAB0~jump_3                * 8899C
            GOSUBL  D0Back2%%                    * 889A2
            GOSUBL  GETAB0~jump_2                * 889A8
            GOSUB   MulR0b                       * 889AE
            D1=D1-  16                           * 889B2
            D1=D1-  5                            * 889B5
            GOSUBL  Get1%CD~jump_2               * 889B8
            GOSUB   AddR0b.L1                    * 889BE
            GOSUB   PRExpLimitb                  * 889C2
            GONC    PolyRootsR.L31               * 889C6
PolyRootsR.loop30:
            GOTO    PolyRootsR.loop9             * 889C9
PolyRootsR.L31:
            GOSUBL  PUTAB0Back                   * 889CD
PolyRootsR.L32:
            GOSUBL  GETAB1Backb                  * 889D3
            SETDEC                               * 889D9
            GOSUB   MulR0b                       * 889DB
            AR3EX                                * 889DF
            AD1EX                                * 889E2
            GOSUBL  Get1%CD~jump_2               * 889E5
            AD1EX                                * 889EB
            AR3EX                                * 889EE
            GOSUB   AddR0b.L1                    * 889F1
            GOSUB   PRExpLimitb                  * 889F5
            GOC     PolyRootsR.loop30            * 889F9
            GOSUBL  PutAB%1~jump_2               * 889FC
            GOSBVL  CkATTNcode                   * 88A02
            C=R2                                 * 88A09
            C=C-1   A                            * 88A0C
            R2=C                                 * 88A0E
            GOC     PolyRootsR.L33               * 88A11
            GOTO    PolyRootsR.loop29            * 88A14
PolyRootsR.L33:
            C=0     W                            * 88A18
            R0=C                                 * 88A1B
            R1=C                                 * 88A1E
            GOSUB   STAB2~jump_7                 * 88A21
            GOSUBL  GETAB0~jump_2                * 88A25
            GOSUB   D0Back2%%                    * 88A2B
            GOSUBL  GETCD0~jump_2                * 88A2F
            D0=D0-  16                           * 88A35
            D0=D0-  5                            * 88A38
            GOSUB   Put2ABR0b                    * 88A3B
            GOSUB   SUB_89126                    * 88A3F
            GOSUB   Put2ABR0b                    * 88A43
            GOSUB   RCAB2~jump_4                 * 88A47
            GOSUB   Put2ABR0b                    * 88A4B
            A=0     S                            * 88A4F
            GOSUBL  PRPut18Bb                    * 88A52
            ST=0    0                            * 88A58
            GOLONG  PRSaveLow3b.L2               * 88A5B
PolyRootsR.L34:
            GOSUB   D1Back2%%b                   * 88A61
            GOSUB   Get2ABR0b                    * 88A65
            GOSUB   STAB2~jump_7                 * 88A69
            GOSUBL  Norm2ABR0b                   * 88A6D
            GOSUBL  STAB0~jump_7                 * 88A73
            GOSUB   RCAB2~jump_4                 * 88A79
            GOSUB   SUB_88FB0                    * 88A7D
            GOSUBL  PRPut07Ab                    * 88A81
            D0=C                                 * 88A87
            GOSUB   PutR0D1b                     * 88A8A
            GOSUB   PRCoefBaseb                  * 88A8E
            C=DAT1  A                            * 88A92
            D1=A                                 * 88A95
            A=C     A                            * 88A98
            C=C-1   A                            * 88A9A
            R2=C                                 * 88A9C
            C=C-1   A                            * 88A9F
            RSTK=C                               * 88AA1
            C=A     A                            * 88AA3
            GOSUB   GETAB1~jump_2                * 88AA5
            AD1EX                                * 88AA9
            R3=A                                 * 88AAC
            AD1EX                                * 88AAF
            GOSUBL  PRPutAuxb                    * 88AB2
            GOSUB   D0Back4%%b                   * 88AB8
            C=0     W                            * 88ABC
            DAT0=C  W                            * 88ABF
            D0=D0+  16                           * 88AC3
            DAT0=C  W                            * 88AC6
            D0=D0+  16                           * 88ACA
            DAT0=C  W                            * 88ACD
            D0=D0+  10                           * 88AD1
            GOSUB   PUTAB0~jump_3                * 88AD4
            DAT0=C  W                            * 88AD8
            D0=D0+  16                           * 88ADC
            DAT0=C  A                            * 88ADF
            D0=D0+  5                            * 88AE2
            GOSUB   D0Fwd2%%                     * 88AE5
PolyRootsR.loop35:
            A=R2                                 * 88AE9
            ?A#0    A                            * 88AEC
            GOYES   PolyRootsR.L36               * 88AEF
            CD1EX                                * 88AF1
            R0=C                                 * 88AF4
            GOSUBL  PRGet137b                    * 88AF7
            C=R0                                 * 88AFD
            D1=C                                 * 88B00
            GOSUB   D0Back2%%                    * 88B03
            GOSUB   PUTAB0~jump_3                * 88B07
            GOTO    PolyRootsR.L38               * 88B0B
PolyRootsR.L36:
            C=RSTK                               * 88B0F
            RSTK=C                               * 88B11
            ?C>A    A                            * 88B13
            GOYES   PolyRootsR.L37               * 88B16
            GOSUB   D0Back2%%                    * 88B18
            D1=D1-  16                           * 88B1C
            D1=D1-  5                            * 88B1F
            GOTO    PolyRootsR.L41               * 88B22
PolyRootsR.L37:
            D0=D0-  16                           * 88B26
            D0=D0-  5                            * 88B29
PolyRootsR.L38:
            GOSUB   GETCD0~jump_2                * 88B2C
            GOSUB   D0Back6%%                    * 88B30
            GOSUB   Get2ABR0D0b                  * 88B34
            GOSUB   PUTAB0Back                   * 88B38
            SETDEC                               * 88B3C
            GOSUB   EXAB0~jump_4                 * 88B3E
            GOSUB   MULTF~jump_6                 * 88B42
            GOSUB   EXAB0~jump_4                 * 88B46
            GOSUB   D0Fwd2%%                     * 88B4A
            GOSUB   MulD0%%                      * 88B4E
            A=-A-1  S                            * 88B52
            GOSUB   AddR0b                       * 88B55
            A=-A-1  S                            * 88B59
            GOSUB   D0Back2%%                    * 88B5C
            GOSUB   GETCD0~jump_2                * 88B60
            GOSUB   AddR0b.L1                    * 88B64
            GOSUB   D0Back4%%b                   * 88B68
            GOSUB   PRExpLimitb                  * 88B6C
            GONC    PolyRootsR.L39               * 88B70
            GOTO    PolyRootsR.loop9             * 88B73
PolyRootsR.L39:
            GOSUB   PUTAB0~jump_3                * 88B77
            D0=D0+  16                           * 88B7B
            D0=D0+  5                            * 88B7E
            GOSUB   Get2ABR0D0b                  * 88B81
            GOSUB   PUTAB0Back                   * 88B85
            GOSUB   EXAB0~jump_4                 * 88B89
            D0=D0+  16                           * 88B8D
            D0=D0+  5                            * 88B90
            GOSUB   MulD0%%                      * 88B93
            GOSUB   EXAB0~jump_4                 * 88B97
            GOSUB   D0Back2%%                    * 88B9B
            GOSUB   MulD0%%                      * 88B9F
            A=-A-1  S                            * 88BA3
            GOSUB   AddR0b                       * 88BA6
            A=-A-1  S                            * 88BAA
            GOSUB   D1Back2%%b                   * 88BAD
            GOSUB   Get1%CD~jump_2               * 88BB1
            GOSUB   AddR0b.L1                    * 88BB5
            GOSUB   D0Back3%%b                   * 88BB9
            GOSUB   PRExpLimitb                  * 88BBD
            GONC    PolyRootsR.L40               * 88BC1
            GOTO    PolyRootsR.loop9             * 88BC4
PolyRootsR.L40:
            GOSUB   PUTAB0~jump_3                * 88BC8
            D0=D0+  16                           * 88BCC
            D0=D0+  5                            * 88BCF
PolyRootsR.L41:
            GOSUB   GETAB1~jump_2                * 88BD2
            SETDEC                               * 88BD6
            GOSUB   MulD0%%                      * 88BD8
            AR3EX                                * 88BDC
            AD1EX                                * 88BDF
            GOSUB   Get1%CD~jump_2               * 88BE2
            AD1EX                                * 88BE6
            AR3EX                                * 88BE9
            GOSUB   AddR0b.L1                    * 88BEC
            GOSUB   GETCD0~jump_2                * 88BF0
            GOSBVL  STCD0                        * 88BF4
            C=RSTK                               * 88BFB
            RSTK=C                               * 88BFD
            D=C     A                            * 88BFF
            C=R2                                 * 88C01
            ?D<C    A                            * 88C04
            GOYES   PolyRootsR.L42               * 88C07
            GOSUB   EXAB0~jump_4                 * 88C09
            GOSUB   D1Back2%%b                   * 88C0D
            GOSUB   Get1%CD~jump_2               * 88C11
            D1=D1+  16                           * 88C15
            D1=D1+  5                            * 88C18
            GOSUB   MULTF~jump_6                 * 88C1B
            A=-A-1  S                            * 88C1F
            GOSUB   AddR0b                       * 88C22
PolyRootsR.L42:
            GOSUB   PRExpLimitb                  * 88C26
            GONC    PolyRootsR.L43               * 88C2A
            GOTO    PolyRootsR.loop9             * 88C2D
PolyRootsR.L43:
            GOSUB   PutAB%1~jump_2               * 88C31
            GOSBVL  CkATTNcode                   * 88C35
            C=R2                                 * 88C3C
            C=C-1   A                            * 88C3F
            R2=C                                 * 88C41
            GOC     PolyRootsR.L44               * 88C44
            GOTO    PolyRootsR.loop35            * 88C47
PolyRootsR.L44:
            C=RSTK                               * 88C4B
            GOSUB   D0Back2%%                    * 88C4D
            GOSUB   PUTAB0~jump_3                * 88C51
            GOSUB   D1Back2%%b                   * 88C55
            GOSUB   GETAB1~jump_2                * 88C59
            GOSUBL  STAB0~jump_7                 * 88C5D
            GOSUB   PRGet14Cb                    * 88C63
            GOSUB   STAB2~jump_7                 * 88C67
            GOSUB   PRPutF1F4b                   * 88C6B
            GOSUB   PutR0D1b                     * 88C6F
            SETDEC                               * 88C73
            GOSUB   MulR0b                       * 88C75
            GOSUB   PUTAB0~jump_3                * 88C79
            GOSUB   RCAB2~jump_4                 * 88C7D
            GOSUB   SquareABb                    * 88C81
            GOSUB   STAB2~jump_7                 * 88C85
            GOSUB   SUB_88FB0                    * 88C89
            GOSUB   SUB_88FB0                    * 88C8D
            A=-A-1  S                            * 88C91
            GOSUB   D0Back6%%                    * 88C94
            CD0EX                                * 88C98
            D0=C                                 * 88C9B
            D1=C                                 * 88C9E
            GOSUB   PRScale2b.L1                 * 88CA1
            GOSUB   GETAB1~jump_2                * 88CA5
            GOSUB   GETCD0~jump_2                * 88CA9
            GOSUB   AddR0b.L1                    * 88CAD
            GOSUB   PUTAB0Back                   * 88CB1
            GOSUB   GETAB1~jump_2                * 88CB5
            C=0     W                            * 88CB9
            D=0     W                            * 88CBC
            P=      14                           * 88CBF
            LC(1)   #3                           * 88CC1
            DCEX    P                            * 88CC4
            GOSUB   MULTF~jump_6                 * 88CC7
            GOSUB   GETCD0~jump_2                * 88CCB
            GOSUB   AddR0b.L1                    * 88CCF
            GOSUB   PRGet1F4b                    * 88CD3
            GOSUB   MULTF~jump_6                 * 88CD7
            CD1EX                                * 88CDB
            CD0EX                                * 88CDE
            CD1EX                                * 88CE1
            GOSUB   D0Back2%%                    * 88CE4
            GOSUB   PUTAB0Back                   * 88CE8
            GOSUB   RCAB2~jump_4                 * 88CEC
            GOSUB   SUB_88FB0                    * 88CF0
            A=-A-1  S                            * 88CF4
            D0=D0+  16                           * 88CF7
            D0=D0+  5                            * 88CFA
            GOSUB   MulD0%%                      * 88CFD
            GOSUB   Get1%CD~jump_2               * 88D01
            GOSUB   AddR0b.L1                    * 88D05
            GOSUB   D0Back2%%                    * 88D09
            GOSUB   GETCD0~jump_2                * 88D0D
            GOSUB   PUTAB0Back                   * 88D11
            GOSUB   D1Back2%%b                   * 88D15
            GOSUB   GETAB1~jump_2                * 88D19
            GOSUB   MULTF~jump_6                 * 88D1D
            GOSUB   SUB_88FB0                    * 88D21
            GOSUB   PUTAB0~jump_3                * 88D25
            GOSUB   Get2ABR0D0b                  * 88D29
            GOSUBL  HypotABR0b                   * 88D2D
            GOSUB   PRPut18Bb                    * 88D33
            ST=1    0                            * 88D37
            GOLONG  PRSaveLow3b.L2               * 88D3A
PolyRootsR.L45:
            C=R4                                 * 88D40
            D1=C                                 * 88D43
            D1=D1+  10                           * 88D46
            C=DAT1  S                            * 88D49
            ?C#0    S                            * 88D4D
            GOYES   PolyRootsR.L46               * 88D50
            GOTO    PolyRootsR.L49               * 88D52
PolyRootsR.L46:
            SETDEC                               * 88D56
            A=0     W                            * 88D58
            A=A-1   A                            * 88D5B
            B=0     W                            * 88D5D
            P=      14                           * 88D60
            LC(1)   #5                           * 88D62
            B=C     P                            * 88D65
            P=      0                            * 88D68
            LC(3)   #0CE                         * 88D6A
            GOSUB   PRScale2b                    * 88D6F
            D1=D1+  16                           * 88D73
            D1=D1+  5                            * 88D76
            GOSUB   GETAB1~jump_2                * 88D79
            GOSUB   MulR0b                       * 88D7D
            GOSUB   PutAB%1Backb                 * 88D81
            GOSUB   STAB2~jump_7                 * 88D85
            D1=D1+  16                           * 88D89
            D1=D1+  5                            * 88D8C
            GOSUB   Get2ABR0b                    * 88D8F
            GOSUBL  HypotABR0b                   * 88D93
            GOSUB   STAB0~jump_7                 * 88D99
            GOSUB   RCCD2~jump_7                 * 88D9D
            GOSUB   AddR0b.L1                    * 88DA1
            GOSUB   RCCD0~jump_7                 * 88DA5
            GOSUB   SubCDTestb                   * 88DA9
            ?B=0    WP                           * 88DAD
            GOYES   PolyRootsR.L47               * 88DB0
            GOTO    PolyRootsR.loop25            * 88DB2
PolyRootsR.L47:
            GOSUB   D1Fwd2%%b                    * 88DB6
            GOSUB   GETAB1~jump_2                * 88DBA
            GOSUB   STAB0~jump_7                 * 88DBE
            GOSUB   D1Fwd2%%b                    * 88DC2
            GOSUB   GETAB1~jump_2                * 88DC6
            GOSUB   SquareABb                    * 88DCA
            GOSUB   STAB2~jump_7                 * 88DCE
            GOSUB   PRGet011b                    * 88DD2
            SETDEC                               * 88DD6
            GOSUB   RCCD2~jump_7                 * 88DD8
            GOSUB   MULTF~jump_6                 * 88DDC
            GOSUB   RCCD0~jump_7                 * 88DE0
            GOSUB   XYEX~jump_5                  * 88DE4
            GOSUB   SubCDTestb                   * 88DE8
            GOC     PolyRootsR.L48               * 88DEC
            GOTO    PolyRootsR.L51               * 88DEF
PolyRootsR.L48:
            P=      0                            * 88DF3
            LC(5)   #0C001                       * 88DF5
            GOVLNG  GPErrjmpC                    * 88DFC
PolyRootsR.L49:
            D1=D1+  1                            * 88E03
            C=DAT1  S                            * 88E06
            ?C#0    S                            * 88E0A
            GOYES   PolyRootsR.L50               * 88E0D
            C=C+1   S                            * 88E0F
            DAT1=C  S                            * 88E12
            GOSUB   PRGet1CAb                    * 88E16
            SETDEC                               * 88E1A
            GOSUB   SquareABb                    * 88E1C
            GOSUB   ABtoCDb                      * 88E20
            GOSUB   GETAB1~jump_2                * 88E24
            GOSUB   STAB2~jump_7                 * 88E28
            GOSUB   DIVF~jump_4                  * 88E2C
            GOSUB   PRPut10Db                    * 88E30
            GOSUB   D1Fwd3%%b                    * 88E34
            GOSUB   Get2ABR0b                    * 88E38
            GOSUB   D1Back4%%b                   * 88E3C
            GOSUB   Put2ABR0D1b                  * 88E40
            GOSUB   D1Fwd3%%b                    * 88E44
            GOSUB   Get1%CD~jump_2               * 88E48
            SETDEC                               * 88E4C
            GOSUB   RCAB2~jump_4                 * 88E4E
            GOSUB   DIVF~jump_4                  * 88E52
            GOSUB   D1Back6%%b                   * 88E56
            GOSUB   PRScale2b.L1                 * 88E5A
            GOTO    PolyRootsR.loop26            * 88E5E
PolyRootsR.L50:
            GOSUB   PRGet137b                    * 88E62
            GOSUB   Get2Tailb                    * 88E66
            GOSUB   SUB_8910A                    * 88E6A
            GOSUB   D1Fwd5%%b                    * 88E6E
            GOSUB   GETAB1~jump_2                * 88E72
            C=0     W                            * 88E76
            P=      12                           * 88E79
            LC(3)   #125                         * 88E7B
            D=C     W                            * 88E80
            C=0     M                            * 88E83
            C=-C-1  S                            * 88E86
            GOSUB   XYEX~jump_5                  * 88E89
            GOSUB   DIVF~jump_4                  * 88E8D
            GOSUB   STAB0~jump_7                 * 88E91
            A=0     W                            * 88E95
            B=0     W                            * 88E98
            P=      14                           * 88E9B
            B=B+1   P                            * 88E9D
            GOSUB   EXAB0~jump_4                 * 88EA0
            GOSUB   CMulSavedb                   * 88EA4
            GOSUB   PRPut137b                    * 88EA8
            GOSUB   PutR0D1b                     * 88EAC
            GOSBVL  CkATTNcode                   * 88EB0
            GOTO    PolyRootsR.loop26            * 88EB7
PolyRootsR.L51:
            GOSUB   PRGet137b                    * 88EBB
            GOSUB   Get2Tailb                    * 88EBF
            C=R1                                 * 88EC3
            ?C=0    W                            * 88EC6
            GOYES   PolyRootsR.L52               * 88EC9
            C=R0                                 * 88ECB
            SETDEC                               * 88ECE
            C=-C-1  S                            * 88ED0
            R0=C                                 * 88ED3
            GOSUB   PRRootb                      * 88ED6
            GOSUB   PRGet137b                    * 88EDA
            GOSUB   Get2Tailb                    * 88EDE
PolyRootsR.L52:
            GOSUB   PRRootb                      * 88EE2
            C=C-1   A                            * 88EE6
            R0=C                                 * 88EE8
            GOSUB   PRCoefAddrb                  * 88EEB
            D0=C                                 * 88EEF
            C=R0                                 * 88EF2
            GOSUB   PRAuxAddrb                   * 88EF5
            C=R0                                 * 88EF9
            B=C     A                            * 88EFC
PolyRootsR.loop53:
            A=DAT1  A                            * 88EFE
            D1=D1+  5                            * 88F01
            DAT0=A  A                            * 88F04
            D0=D0+  5                            * 88F07
            A=DAT1  W                            * 88F0A
            D1=D1+  16                           * 88F0E
            DAT0=A  W                            * 88F11
            D0=D0+  16                           * 88F15
            GOSBVL  CkATTNcode                   * 88F18
            B=B-1   A                            * 88F1F
            GONC    PolyRootsR.loop53            * 88F21
            GOLONG  PolyRootsR.loop13            * 88F24

* refs (6): 887F7 88880 88E20 88FA1 895E4 89641
* Real-coefficient copy of ABtoCD
ABtoCDb:
            C=B     W                            * 88F2A
            D=C     W                            * 88F2D
            C=A     W                            * 88F30
            RTN                                  * 88F33

* refs (5): 884D0 88560 8862E 88949 88A8E
* Real-coefficient copy of PRCoefBase
PRCoefBaseb:
            SETHEX                               * 88F35
            A=R4                                 * 88F37
            D1=A                                 * 88F3A
            P=      0                            * 88F3D
            LC(5)   #00272                       * 88F3F
            A=A+C   A                            * 88F46
            RTN                                  * 88F48

* refs (4): 88DE4 88E89 89614 89882
XYEX~jump_5:
            GOVLNG  XYEX                         * 88F4A

* refs (17): 885B1 8888A 88A21 88A69 88C67 88C85 ...
STAB2~jump_7:
            GOVLNG  STAB2                        * 88F51

* refs (8): 8870D 887C5 887FB 88808 888F2 89491 ...
RCAB0~jump_2:
            GOVLNG  RCAB0                        * 88F58

* refs (8): 88A47 88A79 88C7D 88CEC 88E4E 89516 ...
RCAB2~jump_4:
            GOVLNG  RCAB2                        * 88F5F

* refs (8): 885D6 886FA 88DA5 88DE0 88F74 88F8E ...
RCCD0~jump_7:
            GOVLNG  RCCD0                        * 88F66

* refs (14): 885EC 887D3 88814 888A0 88D9D 88DD8 ...
RCCD2~jump_7:
            GOVLNG  RCCD2                        * 88F6D

* refs (5): 88B55 88BA6 88C22 897DE 89906
* Real-coefficient copy of AddR0
AddR0b:
            GOSUB   RCCD0~jump_7                 * 88F74
AddR0b.L1:
            CD0EX                                * 88F78
            RSTK=C                               * 88F7B
            CD0EX                                * 88F7D
            GOSBVL  RADDF                        * 88F80
            C=RSTK                               * 88F87
            D0=C                                 * 88F89
            RTN                                  * 88F8C

* refs (8): 88981 889AE 889DB 88C75 88D7D 8917A ...
* Real-coefficient copy of MulR0
MulR0b:
            GOSUB   RCCD0~jump_7                 * 88F8E

* refs (14): 88619 8871E 8874F 888D2 88B42 88C1B ...
MULTF~jump_6:
            GOVLNG  MULTF                        * 88F92

* refs (13): 88668 88692 88738 88B4E 88B93 88B9F ...
* A/B *= the %% at D0 (GETCD0, MULTF); D0 past it
MulD0%%:
            GOSUB   GETCD0~jump_2                * 88F99
            GOTO    MULTF~jump_6                 * 88F9D

* refs (7): 88C81 88DCA 88E1C 898C5 898CF 898F6 ...
* Real-coefficient copy of SquareAB
SquareABb:
            GOSUB   ABtoCDb                      * 88FA1
            GOTO    MULTF~jump_6                 * 88FA5

* refs (12): 8857A 885DC 885F2 886D2 88818 88E2C ...
DIVF~jump_4:
            GOVLNG  DIVF                         * 88FA9

* refs (7): 88A7D 88C89 88C8D 88CF0 88D21 895C9 ...
SUB_88FB0:
            GOVLNG  DIV2.L3                      * 88FB0

* refs (3): 887C9 896CC 89864
SUB_88FB7:
            GOVLNG  DIV2.L1                      * 88FB7

* refs (7): 88548 8855A 88589 88ED6 88EE2 89076 ...
* Real-coefficient copy of PRRoot
PRRootb:
            SETDEC                               * 88FBE
            GOSBVL  PACK                         * 88FC0
            GOSUB   EXAB0~jump_4                 * 88FC7
            GOSBVL  PACK                         * 88FCB
            AR0EX                                * 88FD2
            C=R4                                 * 88FD5
            D1=C                                 * 88FD8
            D1=D1+  12                           * 88FDB
            C=DAT1  A                            * 88FDE
            D0=C                                 * 88FE1
            DAT0=A  W                            * 88FE4
            D0=D0+  16                           * 88FE8
            A=R0                                 * 88FEB
            DAT0=A  W                            * 88FEE
            D0=D0+  16                           * 88FF2
            GOSBVL  CkATTNcode                   * 88FF5
            CD0EX                                * 88FFC
            DAT1=C  A                            * 88FFF
            D1=D1-  12                           * 89002
            C=DAT1  A                            * 89005
            C=C-1   A                            * 89008
            DAT1=C  A                            * 8900A
            ?C#0    A                            * 8900D
            RTNYES                               * 89010
            P=      0                            * 89012
            GOVLNG  GETPTRLOOP                   * 89014

* refs (2): 88497 88515
* Real-coefficient copy of PRStripTop
PRStripTopb:
            A=R4                                 * 8901B
            A=C     S                            * 8901E
            R4=A                                 * 89021
            D1=A                                 * 89024
            C=DAT1  A                            * 89027
PRStripTopb.loop1:
            R0=C                                 * 8902A
            GOSUB   PRGetCoefb                   * 8902D
            ?B#0    W                            * 89031
            RTNYES                               * 89034
            CD1EX                                * 89036
            D0=C                                 * 89039
            C=R0                                 * 8903C
            GOSBVL  C*21>D                       * 8903F
            C=D     A                            * 89046
            GOSBVL  MOVEDOWN                     * 89048
            A=0     W                            * 8904F
            R0=A                                 * 89052
            R1=A                                 * 89055
            C=R4                                 * 89058
            ?C=0    S                            * 8905B
            GOYES   PRStripTopb.L2               * 8905E
            A=A+1   M                            * 89060
            P=      14                           * 89063
            B=B+1   P                            * 89065
            GONC    PRStripTopb.L3               * 89068
PRStripTopb.L2:
            SETDEC                               * 8906B
            GOSBVL  FltExc.L2                    * 8906D
            SETHEX                               * 89074
PRStripTopb.L3:
            GOSUB   PRRootb                      * 89076
            GOTO    PRStripTopb.loop1            * 8907A

* refs (2): 884A0 88521
* Real-coefficient copy of PRStripEnd
PRStripEndb:
            A=R4                                 * 8907E
            A=C     S                            * 89081
            R4=A                                 * 89084
PRStripEndb.loop1:
            C=0     A                            * 89087
            GOSUB   PRGetCoefb                   * 89089
            ?B#0    W                            * 8908D
            RTNYES                               * 89090
            A=0     W                            * 89092
            R0=A                                 * 89095
            R1=A                                 * 89098
            C=R4                                 * 8909B
            ?C=0    S                            * 8909E
            GOYES   PRStripEndb.L2               * 890A1
            P=      14                           * 890A3
            B=B+1   P                            * 890A5
            SETDEC                               * 890A8
            A=A-1   A                            * 890AA
            A=0     X                            * 890AC
PRStripEndb.L2:
            GOSUB   PRRootb                      * 890AF
            GOC     PRStripEndb.loop1            * 890B3

* refs (7): 884F1 88995 889C2 889F5 88B6C 88BBD ...
* Real-coefficient copy of PRExpLimit
PRExpLimitb:
            SETDEC                               * 890B6
            C=A     A                            * 890B8
            C=C+C   A                            * 890BA
            P=      0                            * 890BC
            LC(5)   #05000                       * 890BE
            GOC     PRExpLimitb.L1               * 890C5
            ?C<=A   A                            * 890C8
            RTNYES                               * 890CB
            RTN                                  * 890CD
PRExpLimitb.L1:
            C=-C    A                            * 890CF
            ?C>A    A                            * 890D1
            GOYES   PRExpLimitb.L2               * 890D4
            RTN                                  * 890D6
PRExpLimitb.L2:
            A=0     W                            * 890D8
            B=0     W                            * 890DB
            RTNCC                                * 890DE

* refs (12): 88700 887B8 887D7 887FF 888EB 88905 ...
* A copy of SubCDTest in the library's second code part
SubCDTestb:
            SETDEC                               * 890E0
            C=-C-1  S                            * 890E2
            GOSUB   AddR0b.L1                    * 890E5
            P=      14                           * 890E9
            ?B=0    WP                           * 890EB
            RTNYES                               * 890EE
            ?A=0    S                            * 890F0
            RTNYES                               * 890F3
            RTN                                  * 890F5

* refs (6): 88A3B 88A43 88A4B 89569 89790 897BA
* Real-coefficient copy of Put2ABR0
Put2ABR0b:
            GOSUB   PUTAB0~jump_3                * 890F7
Put2ABR0b.L1:
            GOSUB   EXAB0~jump_4                 * 890FB
            GOSUB   PUTAB0~jump_3                * 890FF

* refs (26): 8889A 888A8 88B3E 88B46 88B89 88B97 ...
EXAB0~jump_4:
            GOVLNG  EXAB0                        * 89103

* refs (8): 88E6A 8966F 896D8 89778 8979C 897A4 ...
SUB_8910A:
            GOSUB   PRPut1F4b                    * 8910A
            GOTO    Put2ABR0b.L1                 * 8910E

* refs (1): 8981C
* Real-coefficient copy of CSwapSaved
CSwapSavedb:
            GOSUB   PRGet1F4b                    * 89112
            GOSUB   PUTAB0Back                   * 89116
            GOSUB   GETAB0~jump_2                * 8911A
            GOSUB   EXAB0~jump_4                 * 8911E
            GOSUB   PUTAB0Back                   * 89122

* refs (1): 88A3F
SUB_89126:
            A=C     W                            * 89126
            C=D     W                            * 89129
            B=C     W                            * 8912C
            RTN                                  * 8912F

* refs (5): 888B4 88E40 89709 89810 89828
* Real-coefficient copy of Put2ABR0D1
Put2ABR0D1b:
            GOSUB   PutAB%1~jump_2               * 89131

* refs (4): 88A8A 88C6F 88EAC 8967F
* Real-coefficient copy of PutR0D1
PutR0D1b:
            GOSUB   EXAB0~jump_4                 * 89135
            GOSUB   PutAB%1~jump_2               * 89139
            GOTO    EXAB0~jump_4                 * 8913D

* refs (5): 88B34 88B81 88D29 897A8 897EB
* Real-coefficient copy of Get2ABR0D0
Get2ABR0D0b:
            GOSUB   GETAB0~jump_2                * 89141
            GOSUB   STAB0~jump_7                 * 89145
            GOSUB   GETAB0~jump_2                * 89149
            GOTO    EXAB0~jump_4                 * 8914D

* refs (13): 8888E 88A65 88D8F 88E38 89578 89639 ...
* A copy of Get2ABR0 in the library's second code part
Get2ABR0b:
            GOSUB   GETAB1~jump_2                * 89151

* refs (7): 88554 88E66 88EBF 88EDE 8966B 896E0 ...
* Real-coefficient copy of Get2Tail
Get2Tailb:
            GOSUB   STAB0~jump_7                 * 89155
            GOSUB   GETAB1~jump_2                * 89159
            GOTO    EXAB0~jump_4                 * 8915D

* refs (2): 89764 8976C
* Real-coefficient copy of PRDouble2
PRDouble2b:
            GOSUB   AB%%2b                       * 89161
            GONC    PRScale2b.L1                 * 89165

* refs (2): 88D6F 896C0
* Real-coefficient copy of PRScale2
PRScale2b:
            GOSUB   PRFieldb                     * 89168
PRScale2b.L1:
            SETDEC                               * 8916C
            GOSUB   STAB0~jump_7                 * 8916E
            GOSUB   PRScale1b                    * 89172

* refs (1): 89172
* Real-coefficient copy of PRScale1
PRScale1b:
            GOSUB   GETAB1~jump_2                * 89176
            GOSUB   MulR0b                       * 8917A
            GOTO    PutAB%1Backb                 * 8917E

* refs (2): 89161 89694
* Real-coefficient copy of AB%%2
AB%%2b:
            A=0     W                            * 89182
            B=0     W                            * 89185
            P=      14                           * 89188
            B=B+1   P                            * 8918A
            B=B+1   P                            * 8918D
            RTN                                  * 89190

* refs (5): 88E56 89635 896A6 89705 89770
* Real-coefficient copy of D1Back6%%
D1Back6%%b:
            D1=D1-  16                           * 89192
            D1=D1-  5                            * 89195

* refs (1): 89574
* Real-coefficient copy of D1Back5%%
D1Back5%%b:
            D1=D1-  16                           * 89198
            D1=D1-  5                            * 8919B

* refs (5): 8881C 88E3C 89794 89800 89824
* Real-coefficient copy of D1Back4%%
D1Back4%%b:
            D1=D1-  16                           * 8919E
            D1=D1-  5                            * 891A1
            D1=D1-  16                           * 891A4
            D1=D1-  5                            * 891A7

* refs (11): 8872A 888F6 88922 88A61 88BAD 88C0D ...
* Real-coefficient copy of D1Back2%%
D1Back2%%b:
            D1=D1-  16                           * 891AA
            D1=D1-  16                           * 891AD
            D1=D1-  10                           * 891B0
            RTN                                  * 891B3

* refs (1): 8884B
* Real-coefficient copy of D1Fwd6%%
D1Fwd6%%b:
            D1=D1+  16                           * 891B5
            D1=D1+  5                            * 891B8

* refs (2): 887A5 88E6E
* Real-coefficient copy of D1Fwd5%%
D1Fwd5%%b:
            D1=D1+  16                           * 891BB
            D1=D1+  5                            * 891BE
            D1=D1+  16                           * 891C1
            D1=D1+  5                            * 891C4

* refs (4): 888AE 88E34 88E44 89683
* Real-coefficient copy of D1Fwd3%%
D1Fwd3%%b:
            D1=D1+  16                           * 891C7
            D1=D1+  5                            * 891CA

* refs (6): 888DC 88DB6 88DC2 89768 8977C 89814
* Real-coefficient copy of D1Fwd2%%
D1Fwd2%%b:
            D1=D1+  16                           * 891CD
            D1=D1+  16                           * 891D0
            D1=D1+  10                           * 891D3
            RTN                                  * 891D6

* refs (2): 88B30 88C94
* D0 back six extended reals
D0Back6%%:
            D0=D0-  16                           * 891D8
            D0=D0-  5                            * 891DB
            D0=D0-  16                           * 891DE
            D0=D0-  5                            * 891E1

* refs (3): 88AB8 88B68 8978C
* D0 back four extended reals
D0Back4%%b:
            D0=D0-  16                           * 891E4
            D0=D0-  5                            * 891E7

* refs (3): 8866E 8868C 88BB9
* D0 back three extended reals
D0Back3%%b:
            D0=D0-  16                           * 891EA
            D0=D0-  5                            * 891ED

* refs (15): 88985 889A2 88A2B 88B03 88B18 88B5C ...
* D0 -= 42: back two extended reals
D0Back2%%:
            D0=D0-  16                           * 891F0
            D0=D0-  16                           * 891F3
            D0=D0-  10                           * 891F6
            RTN                                  * 891F9

* refs (1): 894CC
* D0 forward four extended reals
D0Fwd4%%b:
            D0=D0+  16                           * 891FB
            D0=D0+  5                            * 891FE
            D0=D0+  16                           * 89201
            D0=D0+  5                            * 89204

* refs (2): 88AE5 88B4A
* D0 forward two extended reals
D0Fwd2%%:
            D0=D0+  16                           * 89207
            D0=D0+  16                           * 8920A
            D0=D0+  10                           * 8920D
            RTN                                  * 89210

* refs (6): 884F7 8861F 88912 88D81 8917E 8975C
* Real-coefficient copy of PutAB%1Back
PutAB%1Backb:
            D1=D1-  16                           * 89212
            D1=D1-  5                            * 89215

* refs (11): 88460 8876D 88773 8893A 889FC 88C31 ...
PutAB%1~jump_2:
            GOVLNG  PutAB%1                      * 89218

* refs (13): 88642 88657 886B5 886EE 88969 889CD ...
* D0 -= 21, then PUTAB0: store A/B as the %% before D0, leaving D0 there
PUTAB0Back:
            D0=D0-  16                           * 8921F
            D0=D0-  5                            * 89222

* refs (13): 88680 8899C 88AD4 88B07 88B77 88BC8 ...
PUTAB0~jump_3:
            GOVLNG  PUTAB0                       * 89225

* refs (3): 88605 8875B 889D3
* Real-coefficient copy of GETAB1Back
GETAB1Backb:
            D1=D1-  16                           * 8922C
            D1=D1-  5                            * 8922F

* refs (28): 884DF 8856F 885AB 88648 88730 88884 ...
GETAB1~jump_2:
            GOVLNG  GETAB1                       * 89232

* refs (10): 88660 88686 88979 889A8 88A25 8911A ...
GETAB0~jump_2:
            GOVLNG  GETAB0                       * 89239

* refs (14): 88569 88698 887AB 888E2 888FC 889B8 ...
Get1%CD~jump_2:
            GOVLNG  Get1%CD                      * 89240

* refs (2): 89481 894DC
* Real-coefficient copy of PRPut25D
PRPut25Db:
            P=      0                            * 89247
            LC(5)   #0025D                       * 89249
            GOTO    PRPut1F4b.L1                 * 89250

* refs (2): 8910A 89844
* Real-coefficient copy of PRPut1F4
PRPut1F4b:
            P=      0                            * 89254
            LC(5)   #001F4                       * 89256
PRPut1F4b.L1:
            D=C     A                            * 8925D
            C=R4                                 * 8925F
            SETHEX                               * 89262
            C=C+D   A                            * 89264
            SETDEC                               * 89266
            D0=C                                 * 89268
            GOTO    PUTAB0~jump_3                * 8926B

* refs (1): 89485
* Real-coefficient copy of PRGet209
PRGet209b:
            P=      0                            * 8926F
            LC(5)   #00209                       * 89271
            GOTO    PRGet1F4b.L1                 * 89278

* refs (3): 88CD3 89112 89469
* Real-coefficient copy of PRGet1F4
PRGet1F4b:
            P=      0                            * 8927C
            LC(5)   #001F4                       * 8927E
PRGet1F4b.L1:
            D=C     A                            * 89285
            C=R4                                 * 89287
            SETHEX                               * 8928A
            C=C+D   A                            * 8928C
            SETDEC                               * 8928E
            D0=C                                 * 89290

* refs (15): 88674 886CC 886DB 8898B 88A2F 88B2C ...
GETCD0~jump_2:
            GOVLNG  GETCD0                       * 89293

* refs (1): 895D8
* AB -> : stores AB in the workspace field #011 (D1 ends after it)
PRPut011b:
            P=      0                            * 8929A
            LC(3)   #011                         * 8929C
            GOTO    PRGet1DFb.L1                 * 892A1

* refs (1): 88940
* AB -> : stores AB in the workspace field #03B (D1 ends after it)
PRPut03Bb:
            P=      0                            * 892A5
            LC(3)   #03B                         * 892A7
            GOTO    PRGet1DFb.L1                 * 892AC

* refs (1): 88625
* AB -> : stores AB in the workspace field #050 (D1 ends after it)
PRPut050b:
            P=      0                            * 892B0
            LC(3)   #050                         * 892B2
            GOTO    PRGet1DFb.L1                 * 892B7

* refs (1): 88A81
* AB -> : stores AB in the workspace field #07A (D1 ends after it)
PRPut07Ab:
            P=      0                            * 892BB
            LC(3)   #07A                         * 892BD
            GOTO    PRGet1DFb.L1                 * 892C2

* refs (1): 88E30
* AB -> : stores AB in the workspace field #10D (D1 ends after it)
PRPut10Db:
            P=      0                            * 892C6
            LC(3)   #10D                         * 892C8
            GOTO    PRGet1DFb.L1                 * 892CD

* refs (1): 88761
* AB -> : stores AB in the workspace field #122 (D1 ends after it)
PRPut122b:
            P=      0                            * 892D1
            LC(3)   #122                         * 892D3
            GOTO    PRGet1DFb.L1                 * 892D8

* refs (1): 88EA8
* AB -> : stores AB in the workspace field #137 (D1 ends after it)
PRPut137b:
            P=      0                            * 892DC
            LC(3)   #137                         * 892DE
            GOTO    PRGet1DFb.L1                 * 892E3

* refs (1): 8967B
* AB -> : stores AB in the workspace field #161 (D1 ends after it)
PRPut161b:
            P=      0                            * 892E7
            LC(3)   #161                         * 892E9
            GOTO    PRGet1DFb.L1                 * 892EE

* refs (3): 88784 88A52 88D33
* AB -> : stores AB in the workspace field #18B (D1 ends after it)
PRPut18Bb:
            P=      0                            * 892F2
            LC(3)   #18B                         * 892F4
            GOTO    PRGet1DFb.L1                 * 892F9

* refs (1): 8880C
* AB -> : stores AB in the workspace field #1A0 (D1 ends after it)
PRPut1A0b:
            P=      0                            * 892FD
            LC(3)   #1A0                         * 892FF
            GOTO    PRGet1DFb.L1                 * 89304

* refs (1): 8972D
* AB -> : stores AB in the workspace field #1B5 (D1 ends after it)
PRPut1B5b:
            P=      0                            * 89308
            LC(3)   #1B5                         * 8930A
            GOTO    PRGet1DFb.L1                 * 8930F

* refs (1): 88599
* AB -> : stores AB in the workspace field #1CA (D1 ends after it)
PRPut1CAb:
            P=      0                            * 89313
            LC(3)   #1CA                         * 89315
            GOTO    PRGet1DFb.L1                 * 8931A

* refs (1): 88724
* AB -> : stores AB in the workspace field #1DF (D1 ends after it)
PRPut1DFb:
            P=      0                            * 8931E
            LC(3)   #1DF                         * 89320
            GOTO    PRGet1DFb.L1                 * 89325

* refs (1): 88C6B
* AB -> : stores AB in the workspace field #1F4 (D1 ends after it)
PRPutF1F4b:
            P=      0                            * 89329
            LC(3)   #1F4                         * 8932B
            GOTO    PRGet1DFb.L1                 * 89330

* refs (1): 88DD2
* -> AB: reads the workspace field #011 (D1 ends after it)
PRGet011b:
            P=      0                            * 89334
            LC(3)   #011                         * 89336
            GOTO    PRGet1DFb.L2                 * 8933B

* refs (1): 8854E
* -> AB: reads the workspace field #026 (D1 ends after it)
PRGet026b:
            P=      0                            * 8933F
            LC(3)   #026                         * 89341
            GOTO    PRGet1DFb.L2                 * 89346

* refs (2): 89667 8971F
* -> AB: reads the workspace field #050 (D1 ends after it)
PRGet050b:
            P=      0                            * 8934A
            LC(3)   #050                         * 8934C
            GOTO    PRGet1DFb.L2                 * 89351

* refs (1): 8887A
* -> AB: reads the workspace field #0A4 (D1 ends after it)
PRGet0A4b:
            P=      0                            * 89355
            LC(3)   #0A4                         * 89357
            GOTO    PRGet1DFb.L2                 * 8935C

* refs (1): 8960C
* -> AB: reads the workspace field #0F8 (D1 ends after it)
PRGet0F8b:
            P=      0                            * 89360
            LC(3)   #0F8                         * 89362
            GOTO    PRGet1DFb.L2                 * 89367

* refs (1): 888BA
* -> AB: reads the workspace field #10D (D1 ends after it)
PRGet10Db:
            P=      0                            * 8936B
            LC(3)   #10D                         * 8936D
            GOTO    PRGet1DFb.L2                 * 89372

* refs (1): 88799
* -> AB: reads the workspace field #122 (D1 ends after it)
PRGet122b:
            P=      0                            * 89376
            LC(3)   #122                         * 89378
            GOTO    PRGet1DFb.L2                 * 8937D

* refs (4): 88AF7 88E62 88EBB 88EDA
* -> AB: reads the workspace field #137 (D1 ends after it)
PRGet137b:
            P=      0                            * 89381
            LC(3)   #137                         * 89383
            GOTO    PRGet1DFb.L2                 * 89388

* refs (1): 88C63
* -> AB: reads the workspace field #14C (D1 ends after it)
PRGet14Cb:
            P=      0                            * 8938C
            LC(3)   #14C                         * 8938E
            GOTO    PRGet1DFb.L2                 * 89393

* refs (1): 896DC
* -> AB: reads the workspace field #161 (D1 ends after it)
PRGet161b:
            P=      0                            * 89397
            LC(3)   #161                         * 89399
            GOTO    PRGet1DFb.L2                 * 8939E

* refs (1): 895E0
* -> AB: reads the workspace field #18B (D1 ends after it)
PRGet18Bb:
            P=      0                            * 893A2
            LC(3)   #18B                         * 893A4
            GOTO    PRGet1DFb.L2                 * 893A9

* refs (1): 89747
* -> AB: reads the workspace field #1B5 (D1 ends after it)
PRGet1B5b:
            P=      0                            * 893AD
            LC(3)   #1B5                         * 893AF
            GOTO    PRGet1DFb.L2                 * 893B4

* refs (2): 88E16 896EC
* -> AB: reads the workspace field #1CA (D1 ends after it)
PRGet1CAb:
            P=      0                            * 893B8
            LC(3)   #1CA                         * 893BA
            GOTO    PRGet1DFb.L2                 * 893BF

* refs (1): 887F1
* -> AB: reads the workspace field #1DF (D1 ends after it)
PRGet1DFb:
            P=      0                            * 893C3
            LC(3)   #1DF                         * 893C5
            GOTO    PRGet1DFb.L2                 * 893CA
PRGet1DFb.L1:
            GOSUB   PRFieldb                     * 893CE
            GOTO    PutAB%1~jump_2               * 893D2
PRGet1DFb.L2:
            GOSUB   PRFieldb                     * 893D6
            GOTO    GETAB1~jump_2                * 893DA

* refs (2): 89549 89760
* Real-coefficient copy of PRField026
PRField026b:
            P=      0                            * 893DE
            LC(3)   #026                         * 893E0

* refs (4): 88842 89168 893CE 893D6
* Real-coefficient copy of PRField
PRFieldb:
            SETHEX                               * 893E5
            P=      3                            * 893E7
            LC(2)   #00                          * 893E9
            P=      0                            * 893ED
            D=C     A                            * 893EF
            C=R4                                 * 893F1
            C=C+D   A                            * 893F4
            D1=C                                 * 893F6
            RTN                                  * 893F9

* refs (5): 885C0 885CE 8877B 8902D 89089
* Real-coefficient copy of PRGetCoef
PRGetCoefb:
            GOSUB   PRCoefAddrb                  * 893FB
            GOTO    GETAB1~jump_2                * 893FF

* refs (3): 88EEB 893FB 89555
* Real-coefficient copy of PRCoefAddr
PRCoefAddrb:
            SETHEX                               * 89403
            D=C     A                            * 89405
            C=R4                                 * 89407
            D1=C                                 * 8940A
            C=DAT1  A                            * 8940D
            C=C-D   A                            * 89410
            GOSBVL  C*21>D                       * 89412
            P=      0                            * 89419
            LC(5)   #00272                       * 8941B
PRCoefAddrb.L1:
            D=D+C   A                            * 89422
            CD1EX                                * 89424
            C=C+D   A                            * 89427
            D1=C                                 * 89429
            RTN                                  * 8942C

* refs (2): 8896F 88AB2
* Real-coefficient copy of PRPutAux
PRPutAuxb:
            GOSUB   PRAuxAddrb                   * 8942E
            GOTO    PutAB%1~jump_2               * 89432

* refs (1): 89598
* Real-coefficient copy of PRGetAux
PRGetAuxb:
            GOSUB   PRAuxAddrb                   * 89436
            GOTO    GETAB1~jump_2                * 8943A

* refs (3): 88EF5 8942E 89436
* Real-coefficient copy of PRAuxAddr
PRAuxAddrb:
            SETHEX                               * 8943E
            D=C     A                            * 89440
            C=R4                                 * 89442
            D1=C                                 * 89445
            C=DAT1  A                            * 89448
            D=C-D   A                            * 8944B
            D1=D1+  5                            * 8944D
            C=DAT1  A                            * 89450
            C=C+D   A                            * 89453
            GOSBVL  C*21>D                       * 89455
            P=      0                            * 8945C
            LC(5)   #00282                       * 8945E
            GOTO    PRCoefAddrb.L1               * 89465

* refs (2): 897AC 897F8
* Real-coefficient copy of CAddSaved
CAddSavedb:
            GOSUB   PRGet1F4b                    * 89469
            GOSUB   AddR0b.L1                    * 8946D
            GOSUB   EXAB0~jump_4                 * 89471
            GOSUB   GETCD0~jump_2                * 89475
            GOSUB   AddR0b.L1                    * 89479
            GOTO    EXAB0~jump_4                 * 8947D

* refs (4): 88EA4 896E4 89784 897A0
* Real-coefficient copy of CMulSaved
CMulSavedb:
            GOSUB   PRPut25Db                    * 89481

* refs (1): 89522
* Real-coefficient copy of CMul
CMulb:
            GOSUB   PRGet209b                    * 89485
            GOSUB   MULTF~jump_6                 * 89489
            GOSUB   STAB2~jump_7                 * 8948D
            GOSUB   RCAB0~jump_2                 * 89491
            GOSUB   D0Back2%%                    * 89495
            GOSUB   MulD0%%                      * 89499
            GOSUB   RCCD2~jump_7                 * 8949D
            CD0EX                                * 894A1
            RSTK=C                               * 894A4
            CD0EX                                * 894A6
            GOSBVL  RADDF                        * 894A9
            C=RSTK                               * 894B0
            D0=C                                 * 894B2
            GOSUB   EXAB0~jump_4                 * 894B5
            A=-A-1  S                            * 894B9
            GOSUB   MulD0%%                      * 894BC
            GOSUB   STAB2~jump_7                 * 894C0
            GOSUB   D0Back2%%                    * 894C4
            GOSUB   GETAB0~jump_2                * 894C8
            GOSUB   D0Fwd4%%b                    * 894CC
            GOSUB   MulD0%%                      * 894D0
            GOSUB   RCCD2~jump_7                 * 894D4
            GOTO    AddR0b.L1                    * 894D8

* refs (4): 89677 89701 89808 89820
* Real-coefficient copy of CDivSaved
CDivSavedb:
            GOSUB   PRPut25Db                    * 894DC
            GOSUB   EXAB0~jump_4                 * 894E0
            A=-A-1  S                            * 894E4
            GOSUB   STAB2~jump_7                 * 894E7
            GOSUB   Norm2ABR0b                   * 894EB
            P=      14                           * 894EF
            ?B#0    WP                           * 894F1
            GOYES   STAB0~jump_7.L1              * 894F4
            B=0     S                            * 894F6
            B=B+1   P                            * 894F9
            C=0     W                            * 894FC
            P=      3                            * 894FF
            LC(1)   #5                           * 89501
            A=C     W                            * 89504

* refs (18): 885C6 8879F 887CD 888D6 8892E 88A73 ...
STAB0~jump_7:
            GOVLNG  STAB0                        * 89507
STAB0~jump_7.L1:
            GOSUB   D0Back2%%                    * 8950E
            GOSUB   PUTAB0~jump_3                * 89512
            GOSUB   RCAB2~jump_4                 * 89516
            GOSUB   STAB0~jump_7                 * 8951A
            GOSUB   GETAB0~jump_2                * 8951E
            GOSUB   CMulb                        * 89522
            GOSUB   D0Back2%%                    * 89526
            GOSUB   GETCD0~jump_2                * 8952A
            GOSBVL  STCD2                        * 8952E
            GOSUB   DIVF~jump_4                  * 89535
            GOSUB   EXAB0~jump_4                 * 89539
            GOSUB   RCCD2~jump_7                 * 8953D
            GOSUB   DIVF~jump_4                  * 89541
            GOTO    EXAB0~jump_4                 * 89545

* refs (2): 8853C 8859F
* Real-coefficient copy of PRSaveLow3; imaginary parts are written as zero
PRSaveLow3b:
            GOSUB   PRField026b                  * 89549
            D0=C                                 * 8954D
            C=0     A                            * 89550
            LC(1)   #2                           * 89552
            GOSUB   PRCoefAddrb                  * 89555
            C=0     W                            * 89559
            R0=C                                 * 8955C
            R1=C                                 * 8955F
            LC(1)   #2                           * 89562
PRSaveLow3b.loop1:
            GOSUB   GETAB1~jump_2                * 89565
            GOSUB   Put2ABR0b                    * 89569
            C=C-1   A                            * 8956D
            GONC    PRSaveLow3b.loop1            * 8956F
            RTN                                  * 89572
PRSaveLow3b.L2:
            GOSUB   D1Back5%%b                   * 89574
            GOSUB   Get2ABR0b                    * 89578
            SETDEC                               * 8957C
            GOSUB   HypotABR0b                   * 8957E
            GOSUB   STAB0~jump_7                 * 89582
            C=R4                                 * 89586
            D1=C                                 * 89589
            C=DAT1  A                            * 8958C
            SETHEX                               * 8958F
            C=C-1   A                            * 89591
            R2=C                                 * 89593
            C=C+1   A                            * 89596
            GOSUB   PRGetAuxb                    * 89598
            A=0     S                            * 8959C
PRSaveLow3b.loop3:
            SETDEC                               * 8959F
            GOSUB   MulR0b                       * 895A1
            GOSUB   Get1%CD~jump_2               * 895A5
            C=0     S                            * 895A9
            GOSUB   AddR0b.L1                    * 895AC
            GOSBVL  CkATTNcode                   * 895B0
            C=R2                                 * 895B7
            C=C-1   A                            * 895BA
            R2=C                                 * 895BC
            GONC    PRSaveLow3b.loop3            * 895BF
            SETDEC                               * 895C2
            ?ST=0   0                            * 895C4
            GOYES   PRSaveLow3b.L4               * 895C7
            GOSUB   SUB_88FB0                    * 895C9
PRSaveLow3b.L4:
            P=      0                            * 895CD
            LC(5)   #00013                       * 895CF
            A=A-C   A                            * 895D6
            GOSUB   PRPut011b                    * 895D8
            GOSUB   STAB2~jump_7                 * 895DC
            GOSUB   PRGet18Bb                    * 895E0
            GOSUB   ABtoCDb                      * 895E4
            GOSBVL  EXAB2                        * 895E8
            GOSUB   SubCDTestb                   * 895EF
            GONC    PRSaveLow3b.L5               * 895F3
            GOTO    PolyRootsR.L51               * 895F6
PRSaveLow3b.L5:
            C=R4                                 * 895FA
            D1=C                                 * 895FD
            D1=D1+  10                           * 89600
            C=DAT1  S                            * 89603
            ?C=0    S                            * 89607
            GOYES   PRSaveLow3b.L6               * 8960A
            GOSUB   PRGet0F8b                    * 8960C
            GOSUB   RCCD2~jump_7                 * 89610
            GOSUB   XYEX~jump_5                  * 89614
            GOSUB   SubCDTestb                   * 89618
            GONC    PRSaveLow3b.L6               * 8961C
            GOLONG  PolyRootsR.L45               * 8961F
PRSaveLow3b.L6:
            GOSUB   SUB_89667                    * 89625
            GOSUB   D1Back2%%b                   * 89629
            GOSUB   GETAB1~jump_2                * 8962D
            GOSUB   STAB2~jump_7                 * 89631
            GOSUB   D1Back6%%b                   * 89635
            GOSUB   Get2ABR0b                    * 89639
            GOSUB   HypotABR0b                   * 8963D
            GOSUB   ABtoCDb                      * 89641
            GOSBVL  EXAB2                        * 89645
            GOSUB   AddR0b.L1                    * 8964C
            GOSUB   RCCD2~jump_7                 * 89650
            GOSUB   SubCDTestb                   * 89654
            ?B#0    WP                           * 89658
            GOYES   PRSaveLow3b.L7               * 8965B
            GOTO    PolyRootsR.L51               * 8965D
PRSaveLow3b.L7:
            GOLONG  PolyRootsR.L20               * 89661

* refs (2): 885A5 89625
SUB_89667:
            GOSUB   PRGet050b                    * 89667
            GOSUB   Get2Tailb                    * 8966B
            GOSUB   SUB_8910A                    * 8966F
            GOSUB   Get2ABR0b                    * 89673
            GOSUB   CDivSavedb                   * 89677
            GOSUB   PRPut161b                    * 8967B
            GOSUB   PutR0D1b                     * 8967F
            GOSUB   D1Fwd3%%b                    * 89683
            GOSUB   Get1%CD~jump_2               * 89687
            GOSBVL  STCD2                        * 8968B
            SETDEC                               * 89692
            GOSUB   AB%%2b                       * 89694
            GOSUB   DIVF~jump_4                  * 89698
            A=-A-1  S                            * 8969C
            GOSBVL  RADD1                        * 8969F
            GOSUB   D1Back6%%b                   * 896A6
            GOSUB   PRScale2b.L1                 * 896AA
            GOSUB   RCAB2~jump_4                 * 896AE
            GOSBVL  RSUB1                        * 896B2
            P=      0                            * 896B9
            LC(3)   #050                         * 896BB
            GOSUB   PRScale2b                    * 896C0
            GOSUB   RCAB2~jump_4                 * 896C4
            GOSUB   MulR0b                       * 896C8
            GOSUB   SUB_88FB7                    * 896CC
            GOSUB   PRScale2b.L1                 * 896D0
            GOSUB   SUB_89760                    * 896D4
            GOSUB   SUB_8910A                    * 896D8
            GOSUB   PRGet161b                    * 896DC
            GOSUB   Get2Tailb                    * 896E0
            GOSUB   CMulSavedb                   * 896E4
            GOSUB   STAB2~jump_7                 * 896E8
            GOSUB   PRGet1CAb                    * 896EC
            SETDEC                               * 896F0
            GOSBVL  RSUB1                        * 896F2
            GOSUB   RCCD2~jump_7                 * 896F9
            GOSUB   AddR0b.L1                    * 896FD
            GOSUB   CDivSavedb                   * 89701
            GOSUB   D1Back6%%b                   * 89705
            GOSUB   Put2ABR0D1b                  * 89709
            GOSUB   HypotABR0b                   * 8970D
            D1=D1+  16                           * 89711
            D1=D1+  5                            * 89714
            GOSUB   PutAB%1~jump_2               * 89717
            GOSUB   STAB2~jump_7                 * 8971B
            GOSUB   PRGet050b                    * 8971F
            GOSUB   Get2Tailb                    * 89723
            SETDEC                               * 89727
            GOSUB   HypotABR0b                   * 89729
            GOSUB   PRPut1B5b                    * 8972D
            GOSUB   GETAB1~jump_2                * 89731
            SETDEC                               * 89735
            GOSUB   SQRF~jump_3                  * 89737
            GOSUB   RCCD2~jump_7                 * 8973B
            GOSUB   MULTF~jump_6                 * 8973F

* refs (2): 885FF 88755
* Real-coefficient copy of PRKeepMin
PRKeepMinb:
            GOSUB   STAB0~jump_7                 * 89743
            GOSUB   PRGet1B5b                    * 89747
            GOSUB   RCCD0~jump_7                 * 8974B
            GOSUB   SubCDTestb                   * 8974F
            RTNNC                                * 89753
            GOSUBL  RCAB0~jump_2                 * 89756
            GOTO    PutAB%1Backb                 * 8975C

* refs (2): 88542 896D4
SUB_89760:
            GOSUB   PRField026b                  * 89760
            GOSUB   PRDouble2b                   * 89764
            GOSUB   D1Fwd2%%b                    * 89768
            GOSUB   PRDouble2b                   * 8976C
            GOSUB   D1Back6%%b                   * 89770
            GOSUB   Get2ABR0b                    * 89774
            GOSUB   SUB_8910A                    * 89778
            GOSUB   D1Fwd2%%b                    * 8977C
            GOSUB   Get2ABR0b                    * 89780
            GOSUB   CMulSavedb                   * 89784
            GOSUB   CNegb                        * 89788
            GOSUB   D0Back4%%b                   * 8978C
            GOSUB   Put2ABR0b                    * 89790
            GOSUB   D1Back4%%b                   * 89794
            GOSUB   Get2ABR0b                    * 89798
            GOSUB   SUB_8910A                    * 8979C
            GOSUB   CMulSavedb                   * 897A0
            GOSUB   SUB_8910A                    * 897A4
            GOSUB   Get2ABR0D0b                  * 897A8
            GOSUB   CAddSavedb                   * 897AC
            GOSUB   CSqrtb                       * 897B0
            D0=D0+  16                           * 897B4
            D0=D0+  5                            * 897B7
            GOSUB   Put2ABR0b                    * 897BA
            GOSUB   D1Back2%%b                   * 897BE
            GOSUB   Get2ABR0b                    * 897C2
            GOSUB   CNegb                        * 897C6
            GOSUB   SUB_8910A                    * 897CA
            GOSUBL  MulD0%%                      * 897CE
            GOSUB   EXAB0~jump_4                 * 897D4
            GOSUBL  MulD0%%                      * 897D8
            GOSUBL  AddR0b                       * 897DE
            C=A     S                            * 897E4
            GOSUB   D0Back2%%                    * 897E7
            GOSUB   Get2ABR0D0b                  * 897EB
            ?C=0    S                            * 897EF
            GOYES   SUB_89760.L1                 * 897F2
            GOSUB   CNegb                        * 897F4
SUB_89760.L1:
            GOSUB   CAddSavedb                   * 897F8
            GOSUB   SUB_8910A                    * 897FC
            GOSUB   D1Back4%%b                   * 89800
            GOSUB   Get2ABR0b                    * 89804
            GOSUB   CDivSavedb                   * 89808
            GOSUB   D1Back2%%b                   * 8980C
            GOSUB   Put2ABR0D1b                  * 89810
            GOSUB   D1Fwd2%%b                    * 89814
            GOSUB   Get2ABR0b                    * 89818
            GOSUB   CSwapSavedb                  * 8981C
            GOSUB   CDivSavedb                   * 89820
            GOSUB   D1Back4%%b                   * 89824
            GOTO    Put2ABR0D1b                  * 89828

* refs (3): 89788 897C6 897F4
* Real-coefficient copy of CNeg
CNegb:
            A=-A-1  S                            * 8982C
            C=R0                                 * 8982F
            C=-C-1  S                            * 89832
            R0=C                                 * 89835
            RTN                                  * 89838

* refs (1): 897B0
* Real-coefficient copy of CSqrt
CSqrtb:
            GOSUBL  STAB2~jump_7                 * 8983A
            GOSUB   EXAB0~jump_4                 * 89840
            GOSUB   PRPut1F4b                    * 89844
            GOSUB   HypotABR0b                   * 89848
            ?B#0    W                            * 8984C
            GOYES   CSqrtb.L1                    * 8984F
            GOTO    STAB0~jump_7                 * 89851
CSqrtb.L1:
            GOSUBL  RCCD2~jump_7                 * 89855
            C=0     S                            * 8985B
            GOSUBL  AddR0b.L1                    * 8985E
            GOSUBL  SUB_88FB7                    * 89864
            GOSUB   SQRF~jump_3                  * 8986A
            GOSUB   STAB0~jump_7                 * 8986E
            GOSUBL  SUB_88FB0                    * 89872
            D0=D0-  16                           * 89878
            D0=D0-  5                            * 8987B
            GOSUB   GETCD0~jump_2                * 8987E
            GOSUBL  XYEX~jump_5                  * 89882
            GOSUBL  DIVF~jump_4                  * 89888
            C=R2                                 * 8988E
            ?C=0    S                            * 89891
            GOYES   CSqrtb.L2                    * 89894
            C=R0                                 * 89896
            C=A     S                            * 89899
            R0=C                                 * 8989C
            A=0     S                            * 8989F
            RTN                                  * 898A2
CSqrtb.L2:
            GOTO    EXAB0~jump_4                 * 898A4

* refs (7): 88D2D 88D93 8957E 8963D 8970D 89729 ...
* Real-coefficient copy of HypotABR0
HypotABR0b:
            P=      14                           * 898A8
            C=R1                                 * 898AA
            ?C#0    WP                           * 898AD
            GOYES   HypotABR0b.L2                * 898B0
HypotABR0b.loop1:
            A=0     S                            * 898B2
            RTN                                  * 898B5
HypotABR0b.L2:
            ?B#0    WP                           * 898B7
            GOYES   HypotABR0b.L3                * 898BA
            GOSUBL  RCAB0~jump_2                 * 898BC
            GONC    HypotABR0b.loop1             * 898C2
HypotABR0b.L3:
            GOSUBL  SquareABb                    * 898C5
            GOSUB   EXAB0~jump_4                 * 898CB
            GOSUBL  SquareABb                    * 898CF
            GOSUBL  RCCD0~jump_7                 * 898D5
            CD0EX                                * 898DB
            RSTK=C                               * 898DE
            CD0EX                                * 898E0
            GOSBVL  RADDF                        * 898E3
            C=RSTK                               * 898EA
            D0=C                                 * 898EC

* refs (2): 89737 8986A
SQRF~jump_3:
            GOVLNG  SQRF                         * 898EF

* refs (2): 88A6D 894EB
* Real-coefficient copy of Norm2ABR0
Norm2ABR0b:
            GOSUBL  SquareABb                    * 898F6
            GOSUB   EXAB0~jump_4                 * 898FC
            GOSUBL  SquareABb                    * 89900
            GOLONG  AddR0b                       * 89906
          ENDCODE                                * 8990C
        ;                                        * 8990C

LIB0C0.hash:
        CON(5)  DOHSTR                           * 89911  hash table of library 0C0
        LENGTH                                   * 89916  length, to #89975
        CON(5)  0                                * 8991B  names of length 1
        CON(5)  0                                * 89920  names of length 2
        CON(5)  0                                * 89925  names of length 3
        CON(5)  0                                * 8992A  names of length 4
        CON(5)  0                                * 8992F  names of length 5
        CON(5)  0                                * 89934  names of length 6
        CON(5)  0                                * 89939  names of length 7
        CON(5)  0                                * 8993E  names of length 8
        CON(5)  0                                * 89943  names of length 9
        CON(5)  0                                * 89948  names of length 10
        CON(5)  0                                * 8994D  names of length 11
        CON(5)  0                                * 89952  names of length 12
        CON(5)  0                                * 89957  names of length 13
        CON(5)  0                                * 8995C  names of length 14
        CON(5)  0                                * 89961  names of length 15
        CON(5)  0                                * 89966  names of length 16
        REL(5)  LIB0C0.hash.L1                   * 8996B  end of the names
LIB0C0.hash.L1:
        CON(5)  0                                * 89970  command 000 has no name
        ENDLENGTH                                * 89975

LIB0C0.link:
        CON(5)  DOHSTR                           * 89975  link table of library 0C0
        LENGTH                                   * 8997A  length, to #8998E
        REL(5)  PolyRootsC                       * 8997F  000 
        REL(5)  PROOTcore                        * 89984  001 
        REL(5)  PolyRootsR                       * 89989  002 
