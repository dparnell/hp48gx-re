* HP 48GX ROM revision R, #00000-#02001: Reset and interrupt entries, keyboard, timers, low-level system code
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: AllowIntr FLUSHKEYS DisableIntr D0->Sft1 D0->Row1 ClrScrMn TryToRM? GetTimChk RCKBp OnKeyDown? Flush CINRTN

        ORG     #00000

* refs (1): 81E80
* Reset entry: P=3, then on to RESET (#01FEA) and the boot code at #7018C
Reset:
        P=      3                                * 00000
        GOTO    L_001BC                          * 00002
        CLRST                                    * 00006
        A=C     A                                * 00008
        DCEX    A                                * 0000A
        R0=A                                     * 0000C

* Interrupt handler entry
        PIN     #0000F                           * the CPU jumps here on an interrupt
Interrupt:
        ST=1    14                               * 0000F
        GOC     L_00022                          * 00012
        ?ST=0   15                               * 00015
        GOYES   L_00020                          * 00018
L_0001A:
        RSTK=C                                   * 0001A
        GOTO    L_0003E                          * 0001C
L_00020:
        RTNCC                                    * 00020
L_00022:
        ?ST=1   15                               * 00022
        GOYES   L_0001A                          * 00025
        RTNSC                                    * 00027
        BSS     15                               * 00029
L_00038:
        P=      8                                * 00038
        GOTO    L_001BC                          * 0003A
L_0003E:
        CD1EX                                    * 0003E
        D1=(5)  =D1-low-nib_save                 * 00041
        DAT1=C  1                                * 00048
        D1=(5)  IRAM@                            * 0004C
        C=DAT1  1                                * 00053
        CPEX    0                                * 00057
        CPEX    4                                * 0005B
        D1=C                                     * 0005F
        D1=(4)  #05DB                            * 00062
        CPEX    4                                * 00068
        CPEX    0                                * 0006C
        DAT1=C  W                                * 00070
        C=0     A                                * 00074
        C=P     3                                * 00076
        P=      2                                * 0007A
        GOC     L_00082                          * 0007C
        C=C+1   P                                * 0007F
L_00082:
        P=      1                                * 00082
        C=-C-1  P                                * 00084
        SETHEX                                   * 00087
        P=      0                                * 00089
        ?SB=0                                    * 0008B
        GOYES   L_00093                          * 0008E
        C=C+1   P                                * 00090
L_00093:
        D1=D1+  16                               * 00093
        DAT1=C  A                                * 00096
        D1=D1+  5                                * 00099
        C=RSTK                                   * 0009C
        DAT1=C  A                                * 0009E
        D1=D1+  5                                * 000A1
        DAT1=A  W                                * 000A4
        D1=D1+  16                               * 000A8
        C=ST                                     * 000AB
        DAT1=C  A                                * 000AD
        D1=D1+  3                                * 000B0
        C=B     W                                * 000B3
        DAT1=C  W                                * 000B6
        D1=D1+  16                               * 000BA
        C=D     W                                * 000BD
        DAT1=C  W                                * 000C0
        D1=D1+  16                               * 000C4
        C=R0                                     * 000C7
        DAT1=C  W                                * 000CA
        D1=D1+  16                               * 000CE
        C=RSTK                                   * 000D1
        DAT1=C  A                                * 000D3
        D1=D1+  5                                * 000D6
        CD0EX                                    * 000D9
        DAT1=C  A                                * 000DC
        GOTO    L_00140                          * 000DF
        FILLTO  #00140                           * 000E3  93 zero nibbles: the next entry stays at #00140
L_00140:
        ST=1    13                               * 00140
        D0=(5)  TIMER2CTRL                       * 00143
        A=DAT0  1                                * 0014A
        ?ABIT=1 0                                * 0014E
        GOYES   L_0015B                          * 00153
        GOLONG  L_01315                          * 00155
L_0015B:
        D0=(5)  NOP1MASK14                       * 0015B
        A=DAT0  1                                * 00162
        LC(1)   #C                               * 00166
        DAT0=C  1                                * 00169
        ?MP=0                                    * 0016D
        GOYES   L_0017C                          * 00170
        GOSUB   SUB_002DA                        * 00172
L_00176:
        P=      11                               * 00176
        GOTO    L_001BC                          * 00178
L_0017C:
        D0=(2)  #09                              * 0017C
        LC(1)   #4                               * 00180
        DAT0=C  1                                * 00183
        D0=(2)  #08                              * 00187
        C=DAT0  1                                * 0018B
        ?CBIT=0 0                                * 0018F
        GOYES   L_001A3                          * 00194
        ST=1    0                                * 00196
        GOSUB   SUB_002FF                        * 00199
        P=      1                                * 0019D
        GOTO    L_001BC                          * 0019F
L_001A3:
        D1=(4)  #0000                            * 001A3
        A=DAT1  A                                * 001A9
        P=      0                                * 001AC
        LC(5)   #A5C3F                           * 001AE
        ?C=A    A                                * 001B5
        GOYES   L_001C3                          * 001B8
        P=      7                                * 001BA
L_001BC:
        GOVLNG  L_01FC6                          * 001BC
L_001C3:
        GOSUB   SUB_003C0                        * 001C3
        D0=(5)  #0011C                           * 001C7
        C=DAT0  1                                * 001CE
        ?CBIT=0 2                                * 001D2
        GOYES   L_001E2                          * 001D7
        CBIT=0  2                                * 001D9
        DAT0=C  1                                * 001DE
L_001E2:
        D0=(2)  #1A                              * 001E2
        C=DAT0  1                                * 001E6
        ?CBIT=0 1                                * 001EA
        GOYES   L_001FA                          * 001EF
        CBIT=0  1                                * 001F1
        DAT0=C  1                                * 001F6
L_001FA:
        D1=(4)  #00E1                            * 001FA
        C=DAT1  1                                * 00200
        D0=(5)  #0010F                           * 00204
        A=DAT0  1                                * 0020B
L_0020F:
        ?C=A    P                                * 0020F
        GOYES   L_00218                          * 00212
        GOTO    L_00176                          * 00214
L_00218:
        GOSBVL  srvc_timer2                      * 00218
        GOSUB   SUB_005EC                        * 0021F
        GOSUB   SUB_00672                        * 00223
        GOSUBL  OnKeyDown?                       * 00227
        GONC    L_00236                          * 0022D
        GOLONG  L_00E38                          * 00230
L_00236:
        GOSUB   L_00768                          * 00236
L_0023A:
        GOSUB   SUB_008D8                        * 0023A
        D1=(4)  #0608                            * 0023E
        C=DAT1  W                                * 00244
        B=C     W                                * 00248
        D1=D1+  16                               * 0024B
        C=DAT1  W                                * 0024E
        D=C     W                                * 00252
        D1=D1+  16                               * 00255
        C=DAT1  W                                * 00258
        R0=C                                     * 0025C
        D1=D1+  16                               * 0025F
        C=DAT1  A                                * 00262
        RSTK=C                                   * 00265
        D1=D1+  5                                * 00267
        C=DAT1  A                                * 0026A
        D0=C                                     * 0026D
        D1=(4)  #0642                            * 00270
        C=DAT1  X                                * 00276
        OUT=C                                    * 0027A
        GOSUBL  CINRTN                           * 0027D
        D1=(4)  #0605                            * 00283
        C=DAT1  A                                * 00289
        ST=C                                     * 0028C
        D1=D1-  16                               * 0028E
        A=DAT1  W                                * 00291
        D1=D1-  5                                * 00295
        C=DAT1  A                                * 00298
        RSTK=C                                   * 0029B
        D1=D1-  5                                * 0029D
        C=DAT1  A                                * 002A0
        SB=0                                     * 002A3
        CSR     A                                * 002A6
        P=      0                                * 002A8
        C=C+1   P                                * 002AA
        GOC     L_002B2                          * 002AD
        SETDEC                                   * 002B0
L_002B2:
        P=      1                                * 002B2
        C=C-1   P                                * 002B4
        P=C     2                                * 002B7
        D1=(4)  #05DB                            * 002BB
        C=DAT1  W                                * 002C1
        D1=(5)  =D1-low-nib_save                 * 002C5
        C=DAT1  1                                * 002CC
        D1=C                                     * 002D0
        C=RSTK                                   * 002D3
        ST=0    14                               * 002D5
        RTI                                      * 002D8

* refs (2): 00172 043E0
SUB_002DA:
        P=      0                                * 002DA
        D0=(5)  NOP1MASK14                       * 002DC
L_002E3:
        MP=0                                     * 002E3
        C=0     A                                * 002E6
        C=C+1   XS                               * 002E8
L_002EB:
        C=C-1   A                                * 002EB
        GONC    L_002EB                          * 002ED
        LC(1)   #C                               * 002F0
        DAT0=C  1                                * 002F3
        ?MP=0                                    * 002F7
        RTNYES                                   * 002FA
        GONC    L_002E3                          * 002FC

* refs (2): 00199 01097
SUB_002FF:
        GOVLNG  L_70250                          * 002FF
L_00306:
        D0=(2)  #2E                              * 00306
        C=DAT0  B                                * 0030A
        RSTK=C                                   * 0030D
        P=      0                                * 0030F
        C=0     A                                * 00311
        ?ST=0   0                                * 00313
        GOYES   L_0031C                          * 00316
        LC(2)   #10                              * 00318
L_0031C:
        DAT0=C  B                                * 0031C
        GOSUBL  SUB_00DF8                        * 0031F
        INTOFF                                   * 00325
        D0=(2)  #1C                              * 00329
        C=0     A                                * 0032D
        DAT0=C  1                                * 0032F
        D0=(2)  #0E                              * 00333
        LC(1)   #8                               * 00337
        DAT0=C  1                                * 0033A
L_0033E:
        C=0     A                                * 0033E
        D0=(2)  #09                              * 00340
        DAT0=C  1                                * 00344
        GOVLNG  L_043B7                          * 00348
L_0034F:
        D0=(2)  #09                              * 0034F
        LC(1)   #4                               * 00353
        DAT0=C  1                                * 00356
        D0=(2)  #2E                              * 0035A
        C=DAT0  B                                * 0035E
        RSTK=C                                   * 00361
        LC(2)   #10                              * 00363
        DAT0=C  B                                * 00367
        D0=(2)  #38                              * 0036A
        A=DAT0  1                                * 0036E
        LC(1)   #A                               * 00372
        A=A-C   P                                * 00375
L_00378:
        C=DAT0  1                                * 00378
        ?C#A    P                                * 0037C
        GOYES   L_00378                          * 0037F
        C=RSTK                                   * 00381
        D0=(2)  #2E                              * 00383
        DAT0=C  B                                * 00387
        GOSBVL  ScrOn+                           * 0038A
        GOSBVL  SUB_019DA                        * 00391
        D0=(2)  #08                              * 00398
        C=DAT0  1                                * 0039C
        ?CBIT=1 0                                * 003A0
        GOYES   L_0033E                          * 003A5
        D0=(2)  #0E                              * 003A7
        LC(1)   #C                               * 003AB
        DAT0=C  1                                * 003AE
        C=RSTK                                   * 003B2
        D0=(2)  #2E                              * 003B4
        DAT0=C  B                                * 003B8
        RTNCC                                    * 003BB
        NIBHEX  000                              * 003BD  .

* refs (1): 001C3
SUB_003C0:
        P=      0                                * 003C0
        D0=(5)  IOC                              * 003C2
        A=DAT0  1                                * 003C9
        ?ABIT=0 3                                * 003CD
        RTNYES                                   * 003D2
        ABIT=0  2                                * 003D4
        DAT0=A  1                                * 003D9
        ABIT=0  3                                * 003DD
        ?A=0    P                                * 003E2
        RTNYES                                   * 003E5
        D0=(2)  #11                              * 003E7
        A=DAT0  XS                               * 003EB
        ABIT=0  11                               * 003EF
        ?A=0    XS                               * 003F4
        RTNYES                                   * 003F7
        INTOFF                                   * 003F9
        D0=(2)  #0C                              * 003FD
        C=DAT0  1                                * 00401
        D1=(4)  #0654                            * 00405
        DAT1=C  1                                * 0040B
        CBIT=1  1                                * 0040F
        DAT0=C  1                                * 00414
L_00418:
        GOSBVL  SUB_7011B                        * 00418
        GOC     L_0049F                          * 0041F
        D0=(2)  #0D                              * 00422
        A=0     A                                * 00426
        A=DAT0  1                                * 00428
        ABIT=0  3                                * 0042C
        C=A     A                                * 00431
        A=A+A   A                                * 00433
        A=A+C   A                                * 00435
        LC(5)   L_00487                          * 00437  table of 3-nibble entries, indexed by 3*A
        C=C+A   A                                * 0043E
        D0=C                                     * 00440
        A=DAT0  X                                * 00443
        D0=(5)  TIMER2                           * 00447
        C=DAT0  X                                * 0044E
        C=C-A   X                                * 00452
L_00455:
        D0=(2)  #38                              * 00455
        A=DAT0  X                                * 00459
        ?C=A    X                                * 0045D
        GOYES   L_0046F                          * 00460
        GOSBVL  SUB_7011B                        * 00462
        GOC     L_0049F                          * 00469
        GONC    L_00455                          * 0046C
L_0046F:
        D1=(4)  #0654                            * 0046F
        C=DAT1  1                                * 00475
        D0=(2)  #0C                              * 00479
        DAT0=C  1                                * 0047D
        INTON                                    * 00481
        RTNSC                                    * 00485

* Time-out ticks by baud code 0-7 (read at #00437)
L_00487:
        CON(3)  #12C                             * 00487  entry 0
        CON(3)  #0BC                             * 0048A  entry 1
        CON(3)  #096                             * 0048D  entry 2
        CON(3)  #05E                             * 00490  entry 3
        CON(3)  #04B                             * 00493  entry 4
        CON(3)  #02F                             * 00496  entry 5
        CON(3)  #026                             * 00499  entry 6
        CON(3)  #017                             * 0049C  entry 7
L_0049F:
        ?ABIT=0 8                                * 0049F
        GOYES   L_004AF                          * 004A4
        D0=(2)  #14                              * 004A6
        A=DAT0  B                                * 004AA
        B=A     A                                * 004AD
L_004AF:
        D1=(4)  #0519                            * 004AF
        C=DAT1  7                                * 004B5
        ?ABIT=0 10                               * 004B9
        GOYES   L_004D0                          * 004BE
        D0=(2)  #13                              * 004C0
        DAT0=A  1                                * 004C4
        CBIT=1  8                                * 004C8
        GONC    L_00537                          * 004CD
L_004D0:
        P=      5                                * 004D0
        A=C     P                                * 004D2
        A=A+A   P                                * 004D5
        P=      0                                * 004D8
        GONC    L_00537                          * 004DA
        D=C     W                                * 004DD
        LA(2)   #13                              * 004E0
        GOSBVL  SUB_70134                        * 004E7
        C=D     W                                * 004EE
        ?A=B    B                                * 004F1
        GOYES   L_0051B                          * 004F4
        LA(2)   #11                              * 004F6
        GOSBVL  SUB_70134                        * 004FD
        C=D     W                                * 00504
        ?A#B    B                                * 00507
        GOYES   L_00537                          * 0050A
        P=      5                                * 0050C
        A=C     P                                * 0050E
        LC(1)   #B                               * 00511
        C=C&A   P                                * 00514
        GONC    L_00527                          * 00518
L_0051B:
        P=      5                                * 0051B
        A=C     P                                * 0051D
        LC(1)   #4                               * 00520
        C=C!A   P                                * 00523
L_00527:
        D1=(4)  #051E                            * 00527
        DAT1=C  P                                * 0052D
        P=      0                                * 00531
        GOTO    L_00418                          * 00533
L_00537:
        ?C#0    XS                               * 00537
        GOYES   L_0054A                          * 0053A
        C=C+1   B                                * 0053C
        GONC    L_0054A                          * 0053F
        C=C-1   B                                * 00542
        CBIT=1  11                               * 00545
L_0054A:
        D1=(4)  #0519                            * 0054A
        DAT1=C  7                                * 00550
        ?C#0    XS                               * 00554
        GOYES   L_0057C                          * 00557
        A=C     A                                * 00559
        ASR     A                                * 0055B
        ASR     A                                * 0055D
        ASR     A                                * 0055F
        A=A+C   B                                * 00561
        A=A-1   B                                * 00564
        A=A+A   A                                * 00567
        D1=(4)  #0319                            * 00569
        CD1EX                                    * 0056F
        C=C+A   A                                * 00572
        CD1EX                                    * 00574
        A=B     A                                * 00577
        DAT1=A  B                                * 00579
L_0057C:
        D1=(4)  #0519                            * 0057C
        A=DAT1  X                                * 00582
        LC(2)   #DF                              * 00586
        ?C<=A   B                                * 0058A
        GOYES   L_00594                          * 0058D
        ?A=0    XS                               * 0058F
        GOYES   L_005E5                          * 00592
L_00594:
        D1=(4)  #051E                            * 00594
        A=DAT1  1                                * 0059A
        LC(1)   #3                               * 0059E
        A=A&C   P                                * 005A1
        LC(1)   #2                               * 005A5
        ?C#A    P                                * 005A8
        GOYES   L_005E5                          * 005AB
        D0=(2)  #12                              * 005AD
        A=DAT0  1                                * 005B1
        ?ABIT=1 0                                * 005B5
        GOYES   L_005D5                          * 005BA
        LA(2)   #13                              * 005BC
        GOSBVL  SUB_3114C                        * 005C3
        GOSBVL  SUB_7015D                        * 005CA
        GOTO    L_00418                          * 005D1
L_005D5:
        D1=D1+  1                                * 005D5
        A=DAT1  1                                * 005D8
        ABIT=1  3                                * 005DC
        DAT1=A  1                                * 005E1
L_005E5:
        GOTO    L_00418                          * 005E5
        NIBHEX  000                              * 005E9  .

* refs (1): 0021F
SUB_005EC:
        P=      0                                * 005EC
        SETHEX                                   * 005EE
        D0=(5)  TIMER1CTRL                       * 005F0
        A=DAT0  1                                * 005F7
        ?ABIT=1 3                                * 005FB
        GOYES   L_00604                          * 00600
        RTNCC                                    * 00602
L_00604:
        GOSUB   SUB_008DF                        * 00604
        D1=(4)  #08CC                            * 00608
        C=DAT1  1                                * 0060E
        C=C-1   P                                * 00612
        GOC     L_0061C                          * 00615
        DAT1=C  1                                * 00618
L_0061C:
        LA(4)   #0801                            * 0061C
        LC(3)   #205                             * 00625
        A=C     B                                * 0062A
        D1=A                                     * 0062D
        A=DAT1  XS                               * 00630
        A=A&C   XS                               * 00634
        ?A#0    XS                               * 00638
        GOYES   SUB_00655                        * 0063B
        D1=(4)  #065C                            * 0063D
        C=0     W                                * 00643
        C=DAT1  13                               * 00646
        ?C#0    W                                * 0064A
        GOYES   SUB_00655                        * 0064D
        DAT0=C  1                                * 0064F
        RTNSC                                    * 00653

* refs (5): 00638 0064A 008C9 01F5D 04214
SUB_00655:
        D0=(5)  TIMER1CTRL                       * 00655
        P=      0                                * 0065C
        LC(1)   #6                               * 0065E
        DAT0=C  1                                * 00661
        D0=(2)  #37                              * 00665
        LC(1)   #0                               * 00669
        DAT0=C  1                                * 0066C
        RTNSC                                    * 00670

* refs (6): 00223 02141 041F9 043F8 04550 0E1C5
SUB_00672:
        GOSUB   SUB_00735                        * 00672
        CSR     A                                * 00676
        CSR     A                                * 00678
        C=C+C   A                                * 0067A
        C=C+C   A                                * 0067C
        CBIT=1  1                                * 0067E
        GOSUB   SUB_006ED                        * 00683
        B=A     B                                * 00687
        BSR     A                                * 0068A
        GOSUB   SUB_008D8                        * 0068C
        D1=(4)  #0840                            * 00690
        C=DAT1  1                                * 00696
        C=C&B   P                                * 0069A
        A=A!C   P                                * 0069E
        D1=(4)  #0833                            * 006A2
        A=DAT1  XS                               * 006A8
        D1=(4)  #0832                            * 006AC
        C=DAT1  XS                               * 006B2
        A=A!C   XS                               * 006B6
        ?A=0    XS                               * 006BA
        GOYES   L_006C1                          * 006BD
        A=A+1   A                                * 006BF
L_006C1:
        D1=(4)  #0840                            * 006C1
        DAT1=A  1                                * 006C7
        D1=(4)  #0841                            * 006CB
        C=DAT1  B                                * 006D1
        CBIT=0  3                                * 006D4
        ?A=0    P                                * 006D9
        GOYES   L_006E3                          * 006DC
        CBIT=1  3                                * 006DE
L_006E3:
        DAT1=C  B                                * 006E3
        GOVLNG  L_01E79                          * 006E6

* refs (2): 00683 325B1
SUB_006ED:
        B=C     A                                * 006ED
        D0=(5)  DA1BadMASK                       * 006EF
        LC(1)   #C                               * 006F6
        DAT0=C  1                                * 006F9
        D0=(2)  #08                              * 006FD
        LC(3)   #50F                             * 00701
        A=C     A                                * 00706
L_00708:
        C=DAT0  1                                * 00708
        C=C&B   P                                * 0070C
        A=A&C   P                                * 00710
        CSL     B                                * 00714
        A=A!C   B                                * 00717
        C=C-1   XS                               * 0071B
        GONC    L_00708                          * 0071E
        D0=(2)  #09                              * 00721
        LC(1)   #4                               * 00725
        DAT0=C  1                                * 00728
        ?ABIT=1 1                                * 0072C
        RTNYES                                   * 00731
        RTN                                      * 00733

* refs (6): 00672 0443A 81099 810A6 81102 81183
SUB_00735:
        P=      0                                * 00735
        SETHEX                                   * 00737
        D0=(5)  NOP1MASK14                       * 00739
        LC(1)   #C                               * 00740
        DAT0=C  1                                * 00743
        D0=(2)  #38                              * 00747
        A=DAT0  1                                * 0074B
        LC(1)   #5                               * 0074F
        A=A-C   P                                * 00752
L_00755:
        C=DAT0  1                                * 00755
        ?C#A    P                                * 00759
        GOYES   L_00755                          * 0075C
        D0=(2)  #0F                              * 0075E
        C=DAT0  XS                               * 00762
        RTNCC                                    * 00766
L_00768:
        GOSUB   SUB_008D8                        * 00768
        D1=(4)  #065B                            * 0076C
        C=DAT1  S                                * 00772
        ?C=0    S                                * 00776
        GOYES   L_0077F                          * 00779
        P=      0                                * 0077B
        RTNCC                                    * 0077D
L_0077F:
        GOSUB   BITMAP                           * 0077F
        B=A     W                                * 00783
        ?A#0    W                                * 00786
        GOYES   L_007A6                          * 00789
        D1=(4)  #065C                            * 0078B
        C=0     W                                * 00791
        C=DAT1  13                               * 00794
        ?C#0    W                                * 00798
        GOYES   L_007A6                          * 0079B
L_0079D:
        RSI                                      * 0079D
        P=      0                                * 007A2
        RTNCC                                    * 007A4
L_007A6:
        GOSUB   Debounce                         * 007A6  inline data follows
        ?ABIT=0 0                                * 007AA
        GOYES   SrvcKbdAB                        * 007AF
        GOTO    L_008C4                          * 007B1

* ( A.W -> ) Sets KEYSTATE and KEYBUFFER
* refs (2): 007AA 02818
SrvcKbdAB:
        GOSUB   SUB_008D8                        * 007B5
        LC(1)   #3                               * 007B9
L_007BC:
        ?B=0    W                                * 007BC
        GOYES   L_007DC                          * 007BF
L_007C1:
        ?B#0    P                                * 007C1
        GOYES   L_007CC                          * 007C4
        BSR     W                                * 007C6
        GONC    L_007BC                          * 007C9
L_007CC:
        B=B+B   P                                * 007CC
        GONC    L_007CC                          * 007CF
        C=C-1   P                                * 007D2
        GONC    L_007C1                          * 007D5
        GOTO    L_008C9                          * 007D8
L_007DC:
        GOSUB   SUB_009E1                        * 007DC
        D=C     S                                * 007E0
        D1=(4)  #065C                            * 007E3
        C=0     W                                * 007E9
        C=DAT1  13                               * 007EC
        DAT1=A  13                               * 007F0
        ?A#0    W                                * 007F4
        GOYES   L_007FD                          * 007F7
        GOTO    L_0079D                          * 007F9
L_007FD:
        ?C#A    W                                * 007FD
        GOYES   L_00806                          * 00800
        GOTO    L_008C9                          * 00802
L_00806:
        P=      12                               * 00806
        C=-C-1  WP                               * 00808
        A=A&C   WP                               * 0080B
        ?A#0    W                                * 0080F
        GOYES   L_00818                          * 00812
        GOTO    L_008C9                          * 00814
L_00818:
        GOSUB   SUB_009E1                        * 00818
        B=C     S                                * 0081C
        LC(6)   #7DF7FF                          * 0081F
        P=      5                                * 00827
        A=A&C   WP                               * 00829
        P=      0                                * 0082D
        ASRB                                     * 0082F
        ?A#0    W                                * 00832
        GOYES   L_0084B                          * 00835
        C=B     S                                * 00837
        GOSUB   SUB_00A09                        * 0083A
        GONC    L_00845                          * 0083E
        GOTO    L_008C0                          * 00841
L_00845:
        B=C     W                                * 00845
        GONC    L_00892                          * 00848
L_0084B:
        C=D     S                                * 0084B
        GOSUB   SUB_00A09                        * 0084E
        D=C     A                                * 00852
        GOC     L_008C0                          * 00854
        D0=(5)  L_00A82+1                        * 00857
        B=0     W                                * 0085E
        GONC    L_00867                          * 00861
L_00864:
        ASR     W                                * 00864
L_00867:
        D0=D0+  8                                * 00867
L_0086A:
        ?A=0    P                                * 0086A
        GOYES   L_00864                          * 0086D
        SB=0                                     * 0086F
        ASRB                                     * 00872
        ?SB=0                                    * 00875
        GOYES   L_0088A                          * 00878
        BSL     W                                * 0087A
        BSL     W                                * 0087D
        C=DAT0  B                                * 00880
        C=C!D   B                                * 00883
        B=C     B                                * 00887
L_0088A:
        D0=D0+  2                                * 0088A
        ?A#0    W                                * 0088D
        GOYES   L_0086A                          * 00890
L_00892:
        C=B     A                                * 00892
        GOSUB   SUB_00D9F                        * 00894
        GOC     L_008A9                          * 00898
        BSR     W                                * 0089B
        BSR     W                                * 0089E
        ?B#0    W                                * 008A1
        GOYES   L_00892                          * 008A4
        GONC    L_008C9                          * 008A6
L_008A9:
        GOSBVL  getBPOFF                         * 008A9
        ?ST=1   4                                * 008B0
        GOYES   L_008C0                          * 008B3
        LC(2)   #F9                              * 008B5
        GOSBVL  RCKBp                            * 008B9
L_008C0:
        GOSUB   SUB_00D3B                        * 008C0
L_008C4:
        RSI                                      * 008C4
L_008C9:
        GOSUB   SUB_00655                        * 008C9
        GOSUB   SUB_00A37                        * 008CD
        RTNC                                     * 008D1
        GOTO    L_00768                          * 008D4

* refs (11): 0023A 0068C 00768 007B5 00D8E 00FF8 ...
SUB_008D8:
        GOVLNG  SUB_0C198                        * 008D8

* refs (1): 00604
SUB_008DF:
        GOVLNG  SUB_0C1B6                        * 008DF

* refs (4): 0077F 009C5 00E73 0ED47
BITMAP:
        P=      0                                * 008E6
        LC(3)   #001                             * 008E8
        CAEX    W                                * 008ED
        C=A     X                                * 008F0
        OUT=C                                    * 008F3
        C=IN                                     * 008F6
        CSRC                                     * 008F9
        SB=0                                     * 008FC
        CSRB                                     * 008FF
        ?SB=0                                    * 00902
        GOYES   L_0091C                          * 00905
        CPEX    15                               * 00907
        C=P     0                                * 0090B
        CBIT=1  3                                * 0090F
        P=C     0                                * 00914
        CPEX    15                               * 00918
L_0091C:
        ?ABIT=1 3                                * 0091C
        GOYES   L_0093F                          * 00921
        A=A+A   X                                * 00923
        C=A     X                                * 00926
        OUT=C                                    * 00929
        C=IN                                     * 0092C
        CSRC                                     * 0092F
        CSRC                                     * 00932
        C=C+C   W                                * 00935
        C=C+C   W                                * 00938
        GOTO    L_0091C                          * 0093B
L_0093F:
        ?ABIT=1 8                                * 0093F
        GOYES   L_0097C                          * 00944
        A=A+A   X                                * 00946
        C=A     X                                * 00949
        OUT=C                                    * 0094C
        C=0     X                                * 0094F
        C=IN                                     * 00952
        CSRC                                     * 00955
        SB=0                                     * 00958
        CSRB                                     * 0095B
        ?SB=0                                    * 0095E
        GOYES   L_0093F                          * 00961
        CPEX    15                               * 00963
        C=P     0                                * 00967
        CBIT=1  3                                * 0096B
        P=C     0                                * 00970
        CPEX    15                               * 00974
        GONC    L_0093F                          * 00978
        NIBHEX  0                                * 0097B
L_0097C:
        LC(3)   #1FF                             * 0097C
        OUT=C                                    * 00981
        C=IN                                     * 00984
        CSR     W                                * 00987
        CSR     W                                * 0098A
        CSR     W                                * 0098D
        CSRB                                     * 00990
        CSRB                                     * 00993
        CSRB                                     * 00996
        CAEX    W                                * 00999
        ?ABIT=1 0                                * 0099C
        RTNYES                                   * 009A1
        RTNCC                                    * 009A3

* Scans keyboard until no more instabilities detected returns a map of the pressed keys in A.W Uses A.W B.W C.W D.A D0 P
* refs (2): 007A6 00C80
Debounce:
        C=RSTK                                   * 009A5
        D=C     A                                * 009A7
        D0=(5)  #00139                           * 009A9
L_009B0:
        C=DAT0  S                                * 009B0
        P=      14                               * 009B4
        LC(1)   #5                               * 009B6
L_009B9:
        A=DAT0  S                                * 009B9
        ?C=A    S                                * 009BD
        GOYES   L_009B9                          * 009C0
        C=A     S                                * 009C2
        GOSUB   BITMAP                           * 009C5
        ABEX    W                                * 009C9
        ?A#B    W                                * 009CC
        GOYES   L_009B0                          * 009CF
        P=      14                               * 009D1
        C=C-1   P                                * 009D3
        GONC    L_009B9                          * 009D6
        P=      0                                * 009D9
        C=D     A                                * 009DB
        PC=C                                     * 009DD

* refs (2): 007DC 00818
SUB_009E1:
        C=A     W                                * 009E1
        CSR     W                                * 009E4
        CSL     X                                * 009E7
        P=      3                                * 009EA
        C=C+C   P                                * 009EC
        C=C+C   P                                * 009EF
        P=      13                               * 009F2
L_009F4:
        C=C+C   S                                * 009F4
        C=C+C   XS                               * 009F7
        GONC    L_00A00                          * 009FA
        C=C+1   S                                * 009FD
L_00A00:
        CSR     A                                * 00A00
        P=P+1                                    * 00A02
        GONC    L_009F4                          * 00A04
        RTNCC                                    * 00A07

* refs (2): 0083A 0084E
SUB_00A09:
        D0=(5)  L_00A2F                          * 00A09
        P=C     15                               * 00A10
        C=0     W                                * 00A14
L_00A17:
        C=DAT0  1                                * 00A17
        D0=D0+  1                                * 00A1B
        P=P-1                                    * 00A1E
        GONC    L_00A17                          * 00A20
        P=      0                                * 00A23
        C=C+1   P                                * 00A25
        C=C-1   P                                * 00A28
        CSL     A                                * 00A2B
        RTN                                      * 00A2D
L_00A2F:
        NIBHEX  084FCFFF                         * 00A2F  ∡ôüÿ

* refs (1): 008CD
SUB_00A37:
        D0=(5)  TIMER1CTRL                       * 00A37
        A=DAT0  1                                * 00A3E
        P=      0                                * 00A42
        LC(1)   #6                               * 00A44
        A=A&C   P                                * 00A47
        ?C=A    P                                * 00A4B
        GOYES   L_00A52                          * 00A4E
        RTNCC                                    * 00A50
L_00A52:
        D0=(2)  #37                              * 00A52
        C=0     A                                * 00A56
        C=DAT0  1                                * 00A58
        ?CBIT=1 3                                * 00A5C
        RTNYES                                   * 00A61
        ?C=0    A                                * 00A63
        GOYES   L_00A6A                          * 00A66
        RTNCC                                    * 00A68
L_00A6A:
        LC(3)   #1FF                             * 00A6A
        A=C     A                                * 00A6F
        D0=(2)  #38                              * 00A71
        C=DAT0  X                                * 00A75
        A=A&C   X                                * 00A79
        LC(3)   #137                             * 00A7D
L_00A82:
        ?C>=A   X                                * 00A82
        RTNYES                                   * 00A85
        RTNCC                                    * 00A87
        C=0     A                                * 00A89
        D0=A                                     * 00A8B
        LC(16)  #001292A2B2C0D2E2                * 00A8E
        D=D+D   A                                * 00AA0
        P=      6                                * 00AA2
        P=      5                                * 00AA4
        P=      4                                * 00AA6
        P=      7                                * 00AA8
        RTNSXM                                   * 00AAA
        NIBHEX  4221202F13108D1C1                * 00AAC  $..ò1.ØÁ
        NIBHEX  B1A1918171615141211101F0E0C0B0A0 * 00ABD  ................
        NIBHEX  90806050                         * 00ADD  ....
L_00AE5:
        NIBHEX  403020                           * 00AE5  ...

* Key matrix by keycode 1-49: OUT mask and IN mask (read at #00CD3); key 45 (ON) is 0
        CON(3)  #002                             * 00AEB  entry 0
        CON(3)  #010                             * 00AEE
        CON(3)  #100                             * 00AF1  entry 1
        CON(3)  #010                             * 00AF4
        CON(3)  #100                             * 00AF7  entry 2
        CON(3)  #008                             * 00AFA
        CON(3)  #100                             * 00AFD  entry 3
        CON(3)  #004                             * 00B00
        CON(3)  #100                             * 00B03  entry 4
        CON(3)  #002                             * 00B06
        CON(3)  #100                             * 00B09  entry 5
        CON(3)  #001                             * 00B0C
        CON(3)  #004                             * 00B0F  entry 6
        CON(3)  #010                             * 00B12
        CON(3)  #080                             * 00B15  entry 7
        CON(3)  #010                             * 00B18
        CON(3)  #080                             * 00B1B  entry 8
        CON(3)  #008                             * 00B1E
        CON(3)  #080                             * 00B21  entry 9
        CON(3)  #004                             * 00B24
        CON(3)  #080                             * 00B27  entry 10
        CON(3)  #002                             * 00B2A
        CON(3)  #080                             * 00B2D  entry 11
        CON(3)  #001                             * 00B30
        CON(3)  #001                             * 00B33  entry 12
        CON(3)  #010                             * 00B36
        CON(3)  #040                             * 00B39  entry 13
        CON(3)  #010                             * 00B3C
        CON(3)  #040                             * 00B3F  entry 14
        CON(3)  #008                             * 00B42
        CON(3)  #040                             * 00B45  entry 15
        CON(3)  #004                             * 00B48
        CON(3)  #040                             * 00B4B  entry 16
        CON(3)  #002                             * 00B4E
        CON(3)  #040                             * 00B51  entry 17
        CON(3)  #001                             * 00B54
        CON(3)  #008                             * 00B57  entry 18
        CON(3)  #010                             * 00B5A
        CON(3)  #020                             * 00B5D  entry 19
        CON(3)  #010                             * 00B60
        CON(3)  #020                             * 00B63  entry 20
        CON(3)  #008                             * 00B66
        CON(3)  #020                             * 00B69  entry 21
        CON(3)  #004                             * 00B6C
        CON(3)  #020                             * 00B6F  entry 22
        CON(3)  #002                             * 00B72
        CON(3)  #020                             * 00B75  entry 23
        CON(3)  #001                             * 00B78
        CON(3)  #010                             * 00B7B  entry 24
        CON(3)  #010                             * 00B7E
        CON(3)  #010                             * 00B81  entry 25
        CON(3)  #008                             * 00B84
        CON(3)  #010                             * 00B87  entry 26
        CON(3)  #004                             * 00B8A
        CON(3)  #010                             * 00B8D  entry 27
        CON(3)  #002                             * 00B90
        CON(3)  #010                             * 00B93  entry 28
        CON(3)  #001                             * 00B96
        CON(3)  #008                             * 00B99  entry 29
        CON(3)  #020                             * 00B9C
        CON(3)  #008                             * 00B9F  entry 30
        CON(3)  #008                             * 00BA2
        CON(3)  #008                             * 00BA5  entry 31
        CON(3)  #004                             * 00BA8
        CON(3)  #008                             * 00BAB  entry 32
        CON(3)  #002                             * 00BAE
        CON(3)  #008                             * 00BB1  entry 33
        CON(3)  #001                             * 00BB4
        CON(3)  #004                             * 00BB7  entry 34
        CON(3)  #020                             * 00BBA
        CON(3)  #004                             * 00BBD  entry 35
        CON(3)  #008                             * 00BC0
        CON(3)  #004                             * 00BC3  entry 36
        CON(3)  #004                             * 00BC6
        CON(3)  #004                             * 00BC9  entry 37
        CON(3)  #002                             * 00BCC
        CON(3)  #004                             * 00BCF  entry 38
        CON(3)  #001                             * 00BD2
        CON(3)  #002                             * 00BD5  entry 39
        CON(3)  #020                             * 00BD8
        CON(3)  #002                             * 00BDB  entry 40
        CON(3)  #008                             * 00BDE
        CON(3)  #002                             * 00BE1  entry 41
        CON(3)  #004                             * 00BE4
        CON(3)  #002                             * 00BE7  entry 42
        CON(3)  #002                             * 00BEA
        CON(3)  #002                             * 00BED  entry 43
        CON(3)  #001                             * 00BF0
        CON(3)  #000                             * 00BF3  entry 44
        CON(3)  #000                             * 00BF6
        CON(3)  #001                             * 00BF9  entry 45
        CON(3)  #008                             * 00BFC
        CON(3)  #001                             * 00BFF  entry 46
L_00C02:
        CON(3)  #004                             * 00C02
L_00C05:
        CON(3)  #001                             * 00C05  entry 47
        CON(3)  #002                             * 00C08
        CON(3)  #001                             * 00C0B  entry 48
        CON(3)  #001                             * 00C0E
        NIBHEX  102                              * 00C11  .
        NIBHEX  030405060708090A0B0C0D0E0F001112 * 00C14  0@P`p∡↑.°ÀÐàð..!
        NIBHEX  131415161718191A1B1C1D108F102122 * 00C34  1AQaqāγ¡±ÁÑ.ø.."
        NIBHEX  204425262720C92A2B2C2E2F20313000 * 00C54  .DRbr.Π¢²Ââò....

* Carry if true
* refs (6): 00227 0441D 30F42 328D9 D448A D4518
OnKeyDown?:
        C=IN                                     * 00C74
        ?CBIT=1 15                               * 00C77
        RTNYES                                   * 00C7C
        RTN                                      * 00C7E

* Carry if true
* refs (2): 0280E 04382
OnKeyStable?:
        GOSUB   Debounce                         * 00C80  inline data follows
        ?ABIT=1 0                                * 00C84
        RTNYES                                   * 00C89
        RTN                                      * 00C8B

* refs (2): 04805 814BE
SUB_00C8D:
        P=      0                                * 00C8D
        LC(2)   #80                              * 00C8F
        ?C#A    B                                * 00C93
        GOYES   L_00C9F                          * 00C96
        LC(2)   #1E                              * 00C98
        A=C     B                                * 00C9C
L_00C9F:
        LC(2)   #40                              * 00C9F
        ?C#A    B                                * 00CA3
        GOYES   L_00CAF                          * 00CA6
        LC(2)   #23                              * 00CA8
        A=C     B                                * 00CAC
L_00CAF:
        LC(2)   #2D                              * 00CAF
        ?C=A    B                                * 00CB3
        GOYES   L_00D12                          * 00CB6
        ?A=0    B                                * 00CB8
        GOYES   L_00D12                          * 00CBB
        LC(2)   #31                              * 00CBD
        ?C<A    B                                * 00CC1
        GOYES   L_00D12                          * 00CC4
        C=0     A                                * 00CC6
        C=A     B                                * 00CC8
        C=C+C   A                                * 00CCB
        A=C     A                                * 00CCD
        C=C+C   A                                * 00CCF
        A=A+C   A                                * 00CD1
        LC(5)   L_00AE5                          * 00CD3  table of 6-nibble entries, indexed by 6*B
        A=A+C   A                                * 00CDA
        D1=A                                     * 00CDC
        C=DAT1  X                                * 00CDF
        D1=D1+  3                                * 00CE3
        A=DAT1  X                                * 00CE6
        P=      4                                * 00CEA
        D1=(5)  IRAM@                            * 00CEC
        C=DAT1  P                                * 00CF3
        D1=C                                     * 00CF7
        P=      0                                * 00CFA
        GOSUB   SUB_00E21                        * 00CFC
        A=A&C   X                                * 00D00
        LC(3)   #1FF                             * 00D04
        GOSUB   SUB_00E21                        * 00D09
        ?A#0    X                                * 00D0D
        RTNYES                                   * 00D10
L_00D12:
        RTNCC                                    * 00D12

* refs (1): 01E95
SUB_00D14:
        LC(3)   #004                             * 00D14
        GOTO    L_00D2B                          * 00D19

* refs (1): 01EA7
SUB_00D1D:
        LC(3)   #002                             * 00D1D
        GOTO    L_00D2B                          * 00D22

* refs (1): 01E83
SUB_00D26:
        LC(3)   #008                             * 00D26
L_00D2B:
        OUT=C                                    * 00D2B
        GOSUB   CINRTN                           * 00D2E
        ?CBIT=1 5                                * 00D32
        RTNYES                                   * 00D37
        RTN                                      * 00D39

* refs (6): 008C0 04369 047AB 80031 80EFA 80FBA
SUB_00D3B:
        D1=(5)  =IR_16Hz_Clock                   * 00D3B
        C=DAT1  A                                * 00D42
        D1=C                                     * 00D45

addrKEYSTATE:
        D1=(4)  #065C                            * 00D48
        C=0     W                                * 00D4E
        DAT1=C  13                               * 00D51
        RTN                                      * 00D55

* Flushes key buffer.
* refs (5): 00D7B 020C7 04362 8106F 81E19
Flush:
        D1=(5)  =IR_16Hz_Clock                   * 00D57
        C=DAT1  A                                * 00D5E
        D1=C                                     * 00D61
        D1=(4)  #0669                            * 00D64
        C=0     A                                * 00D6A
        DAT1=C  A                                * 00D6C
        RTNCC                                    * 00D6F

* ->
* refs (16): 0DD9E 2D9DC 2DD8D 2E054 2E081 33C6A ...
FLUSHKEYS:
        CON(5)  (*)+5                            * 00D71  primitive code object
        CD1EX                                    * 00D76
        RSTK=C                                   * 00D79
        GOSUB   Flush                            * 00D7B
        C=RSTK                                   * 00D7F
        D1=C                                     * 00D81
        A=DAT0  A                                * 00D84
        D0=D0+  5                                * 00D87
        PC=(A)                                   * 00D8A

* Flushes attn counter.
* refs (4): 02053 027BF 0442C 81061
FlushAttn:
        GOSUB   SUB_008D8                        * 00D8E
        D1=(4)  #07F7                            * 00D92
        C=0     A                                * 00D98
        DAT1=C  A                                * 00D9A
        RTN                                      * 00D9D

* refs (1): 00894
SUB_00D9F:
        A=C     A                                * 00D9F
        D1=(5)  =IR_16Hz_Clock                   * 00DA1
        C=DAT1  A                                * 00DA8
        D1=C                                     * 00DAB
        C=A     B                                * 00DAE
        CSL     A                                * 00DB1
        D1=(4)  #0669                            * 00DB3
        A=DAT1  1                                * 00DB9
        D1=D1+  1                                * 00DBD
        C=DAT1  1                                * 00DC0
        P=      0                                * 00DC4
        A=A-C   P                                * 00DC6
        A=A-1   P                                * 00DC9
        ?A=0    P                                * 00DCC
        RTNYES                                   * 00DCF
        C=C+1   P                                * 00DD1
        DAT1=C  1                                * 00DD4
        P=C     0                                * 00DD8
        P=P-1                                    * 00DDC
        CSR     A                                * 00DDE
        A=C     B                                * 00DE0
        CD1EX                                    * 00DE3
        C+P+1                                    * 00DE6
        C+P+1                                    * 00DE9
        C=C-1   A                                * 00DEC
        CD1EX                                    * 00DEE
        P=      0                                * 00DF1
        DAT1=A  B                                * 00DF3
        RTNCC                                    * 00DF6

* refs (2): 0031F 0435B
SUB_00DF8:
        D1=(5)  =IR_16Hz_Clock                   * 00DF8
        C=DAT1  A                                * 00DFF
        D1=C                                     * 00E02
        C=0     A                                * 00E05
        GOTO    SUB_00E21                        * 00E07

* refs (8): 019AF 04377 04929 80838 80A45 80A67 ...
SUB_00E0B:
        D1=(5)  =IR_16Hz_Clock                   * 00E0B
        C=DAT1  A                                * 00E12
        D1=C                                     * 00E15
        P=      0                                * 00E18
        C=0     A                                * 00E1A
        LC(3)   #1FF                             * 00E1C

* refs (3): 00CFC 00D09 00E07
SUB_00E21:
        D1=(4)  #0642                            * 00E21
        DAT1=C  X                                * 00E27
        OUT=C                                    * 00E2B
        C=IN                                     * 00E2E
        ?C#0    A                                * 00E31
        RTNYES                                   * 00E34
        RTN                                      * 00E36
L_00E38:
        P=      0                                * 00E38
        LC(5)   L_00FF8                          * 00E3A  return address, pushed with RSTK=C
        RSTK=C                                   * 00E41
        D1=(4)  #065A                            * 00E43
        A=DAT1  S                                * 00E49
        B=A     S                                * 00E4D
L_00E50:
        P=      0                                * 00E50
        LC(3)   #1FF                             * 00E52
        OUT=C                                    * 00E57
        LC(5)   #0004E                           * 00E5A
        A=0     A                                * 00E61
L_00E63:
        GOSUB   AINRTN                           * 00E63
        ?A#0    A                                * 00E67
        GOYES   L_00E73                          * 00E6A
        C=C-1   A                                * 00E6C
        GONC    L_00E63                          * 00E6E
        RTN                                      * 00E71
L_00E73:
        GOSBVL  BITMAP                           * 00E73
        D1=(5)  L_00ED5                          * 00E7A
        P=      12                               * 00E81
L_00E83:
        C=DAT1  S                                * 00E83
        C=C-1   S                                * 00E87
        GOC     L_00E50                          * 00E8A
        D1=D1+  1                                * 00E8D
        C=DAT1  13                               * 00E90
        D1=D1+  13                               * 00E94
        ?C=A    WP                               * 00E97
        GOYES   L_00EA2                          * 00E9A
        D1=D1+  5                                * 00E9C
        GONC    L_00E83                          * 00E9F
L_00EA2:
        P=      0                                * 00EA2
        C=C-1   S                                * 00EA4
        GONC    L_00EB3                          * 00EA7
        C=RSTK                                   * 00EAA
        AD1EX                                    * 00EAC
        PC=(A)                                   * 00EAF
L_00EB3:
        A=DAT1  A                                * 00EB3
        C=C-1   S                                * 00EB6
        GONC    L_00ECB                          * 00EB9
        ?B#0    S                                * 00EBC
        GOYES   L_00ECB                          * 00EBF
        LA(5)   L_0023A                          * 00EC1  return address, pushed with RSTK=C
L_00ECB:
        C=RSTK                                   * 00ECB
        C=A     A                                * 00ECD
L_00ECF:
        RSTK=C                                   * 00ECF
        GOTO    L_00E50                          * 00ED1

* ON-key combinations (read at #00E7A): kind (1 jump, 2 and 3 other actions), 13-nibble key bitmap, handler
L_00ED5:
        CON(1)  1                                * 00ED5  entry 0
        CON(13) #0000000000003                   * 00ED6
        CON(5)  L_00F94                          * 00EE3
        CON(1)  1                                * 00EE8  entry 1
        CON(13) #0000000000041                   * 00EE9
        CON(5)  L_00F9A                          * 00EF6
        CON(1)  3                                * 00EFB  entry 2
        CON(13) #1000000000001                   * 00EFC
        CON(5)  L_0023A                          * 00F09
        CON(1)  3                                * 00F0E  entry 3
        CON(13) #0100000000401                   * 00F0F
        CON(5)  Coldstart                        * 00F1C
        CON(1)  3                                * 00F21  entry 4
        CON(13) #0000000000201                   * 00F22
        CON(5)  L_01011                          * 00F2F
        CON(1)  3                                * 00F34  entry 5
        CON(13) #0000000008001                   * 00F35
        CON(5)  L_010CE                          * 00F42
        CON(1)  2                                * 00F47  entry 6
        CON(13) #0800000000001                   * 00F48
        CON(5)  Warmstart                        * 00F55
        CON(1)  2                                * 00F5A  entry 7
        CON(13) #0400000000001                   * 00F5B
        CON(5)  L_01176                          * 00F68
        CON(1)  2                                * 00F6D  entry 8
        CON(13) #0200000000001                   * 00F6E
        CON(5)  L_01165                          * 00F7B
        CON(1)  2                                * 00F80  entry 9
        CON(13) #0000000000005                   * 00F81
        CON(5)  L_01087                          * 00F8E
        CON(1)  0                                * 00F93  end of table
L_00F94:
        P=      1                                * 00F94
        GOTO    L_00F9C                          * 00F96
L_00F9A:
        P=      0                                * 00F9A
L_00F9C:
        D1=(5)  CONTRAST                         * 00F9C
        A=DAT1  B                                * 00FA3
        P=P-1                                    * 00FA6
        P=      0                                * 00FA8
        LC(2)   #1F                              * 00FAA
        A=A&C   B                                * 00FAE
        GOC     L_00FC4                          * 00FB2
        A=A+1   B                                * 00FB5
        LC(2)   #18                              * 00FB8
        ?C<A    B                                * 00FBC
        GOYES   L_00FE5                          * 00FBF
        GONC    L_00FD3                          * 00FC1
L_00FC4:
        A=A-1   B                                * 00FC4
        GOC     L_00FE5                          * 00FC7
        LC(2)   #09                              * 00FCA
        ?C>A    B                                * 00FCE
        GOYES   L_00FE5                          * 00FD1
L_00FD3:
        C=DAT1  B                                * 00FD3
        C=0     P                                * 00FD6
        CBIT=0  4                                * 00FD9
        A=A!C   B                                * 00FDE
        DAT1=A  B                                * 00FE2
L_00FE5:
        GOSUB   SUB_01145                        * 00FE5
        GOSUB   SUB_01145                        * 00FE9
        LC(5)   L_0023A                          * 00FED
        GOTO    L_00ECF                          * 00FF4
L_00FF8:
        GOSUB   SUB_008D8                        * 00FF8
        D1=(4)  #07F7                            * 00FFC
        C=DAT1  A                                * 01002
        C=C+1   A                                * 01005
        GOC     L_0100D                          * 01007
        DAT1=C  A                                * 0100A
L_0100D:
        GOTO    L_01081                          * 0100D
L_01011:
        GOSUB   SUB_008D8                        * 01011
        D1=(4)  #069C                            * 01015
        P=      10                               * 0101B
L_0101D:
        C=RSTK                                   * 0101D
        DAT1=C  A                                * 0101F
        D1=D1+  5                                * 01022
        P=P+1                                    * 01025
        GONC    L_0101D                          * 01027
        C=R2                                     * 0102A
        CSLC                                     * 0102D
        GOSBVL  CSLW5                            * 01030
        C=R1.F  A                                * 01037
        DAT1=C  11                               * 0103D
        GOSBVL  SUB_32A4D                        * 01041
        GOSUB   SUB_008D8                        * 01048
        D1=(4)  #06BA                            * 0104C
        C=DAT1  11                               * 01052
        R1=C.F  A                                * 01056
        GOSBVL  CSRW5                            * 0105C
        CSRC                                     * 01063
        R2=C.F  S                                * 01066
        R2=C.F  A                                * 0106C
        P=      10                               * 01072
L_01074:
        D1=D1-  5                                * 01074
        C=DAT1  A                                * 01077
        RSTK=C                                   * 0107A
        P=P+1                                    * 0107C
        GONC    L_01074                          * 0107E
L_01081:
        GOLONG  L_0023A                          * 01081
L_01087:
        P=      0                                * 01087
        LC(2)   #E4                              * 01089
        GOSBVL  RCKBp                            * 0108D
        ST=0    0                                * 01094
        GOSUBL  SUB_002FF                        * 01097
        GOSUB   SUB_010A9                        * 0109D
        P=      0                                * 010A1
        GOLONG  L_001BC                          * 010A3

* refs (2): 0109D 80C9A
SUB_010A9:
        GOSUBL  SUB_008D8                        * 010A9
        D1=(4)  #0010                            * 010AF
        C=0     W                                * 010B5
        P=      12                               * 010B8
L_010BA:
        DAT1=C  W                                * 010BA
        D1=D1+  16                               * 010BE
        DAT1=C  B                                * 010C1
        D1=D1+  2                                * 010C4
        P=P+1                                    * 010C7
        GONC    L_010BA                          * 010C9
        RTN                                      * 010CC
L_010CE:
        GOSUBL  SUB_008D8                        * 010CE
        D1=(4)  #0834                            * 010D4
        LC(1)   #F                               * 010DA
        DAT1=C  1                                * 010DD
        GOTO    L_01081                          * 010E1

* Allow interrupts.
* refs (33): 01199 01300 0173E 01E6E 02165 04557 ...
AllowIntr:
        ST=1    15                               * 010E5
        INTON                                    * 010E8
        GOC     L_01101                          * 010EC
        ?ST=0   14                               * 010EF
        GOYES   L_010F9                          * 010F2
        RSI                                      * 010F4
L_010F9:
        ?ST=0   15                               * 010F9
        GOYES   L_01110                          * 010FC
        GONC    L_01110                          * 010FE
L_01101:
        ?ST=0   14                               * 01101
        GOYES   L_01110                          * 01104
        RSI                                      * 01106
        ?ST=1   15                               * 0110B
        GOYES   L_01110                          * 0110E
L_01110:
        ST=0    14                               * 01110
        RTI                                      * 01113

* Disable interrupts.
* refs (10): 0B42D 0B72A 0B7C1 0B8DA 2D190 2D1EF ...
DisableIntr:
        ST=0    15                               * 01115
        CD0EX                                    * 01118
        RSTK=C                                   * 0111B
        D0=(5)  NOP1MASK14                       * 0111D
        C=DAT0  1                                * 01124
        CBIT=1  0                                * 01128
        DAT0=C  1                                * 0112D
        CBIT=0  0                                * 01131
        DAT0=C  1                                * 01136
        C=RSTK                                   * 0113A
        D0=C                                     * 0113C
        INTOFF                                   * 0113F
        RTNCC                                    * 01143

* refs (2): 00FE5 00FE9
SUB_01145:
        AD1EX                                    * 01145
        D1=(5)  #0597F                           * 01148  loop count, swapped into A
        AD1EX                                    * 0114F
L_01152:
        A=A-1   A                                * 01152
        GONC    L_01152                          * 01154
        RTNCC                                    * 01157
        NIBHEX  0                                * 01159

* A=IN see also <REF>CINRTN For hardware reasons (bug) A=IN must be at even addr
* refs (1): 00E63
AINRTN:
        A=IN                                     * 0115A
        RTN                                      * 0115D
        NIBHEX  0                                * 0115F

* C=IN see also <REF>AINRTN For hardware reasons (bug) C=IN must be at even addr
* refs (5): 0027D 00D2E 01EEF 0479F 32A0F
CINRTN:
        C=IN                                     * 01160
        RTN                                      * 01163
L_01165:
        ST=0    8                                * 01165
        ST=0    10                               * 01168
L_0116B:
        GOSUB   SUB_0119D                        * 0116B
        ST=1    6                                * 0116F
        GOTO    L_0117D                          * 01172
L_01176:
        GOSUB   SUB_0119D                        * 01176
        ST=0    6                                * 0117A
L_0117D:
        GOSUBL  SUB_008D8                        * 0117D
        D1=(4)  #065A                            * 01183
        LC(1)   #F                               * 01189
        DAT1=C  1                                * 0118C
        LC(5)   CMOS                             * 01190
        RSTK=C                                   * 01197
        GOTO    AllowIntr                        * 01199

* refs (2): 0116B 01176
SUB_0119D:
        GOSUB   L_011AC                          * 0119D
        GOSUB   SUB_011CA                        * 011A1
        GOVLNG  SUB_01929                        * 011A5
L_011AC:
        ST=0    15                               * 011AC
        RESET                                    * 011AF
        MP=0                                     * 011B2
        GOSBVL  SUB_02241                        * 011B5
        GOSBVL  SUB_022D9                        * 011BC
        GOVLNG  L_701C3                          * 011C3

* refs (1): 011A1
SUB_011CA:
        P=      0                                * 011CA
        D1=(5)  =IR_16Hz_Clock                   * 011CC
        A=DAT1  A                                * 011D3
        LA(4)   #0801                            * 011D6
        LC(3)   #205                             * 011DF
        A=C     B                                * 011E4
        D1=A                                     * 011E7
        A=DAT1  XS                               * 011EA
        C=-C-1  XS                               * 011EE
        A=A&C   XS                               * 011F1
        DAT1=A  XS                               * 011F5
        RTNCC                                    * 011F9
        NIBHEX  0                                * 011FB

* refs (7): 012EE 012FC 0133A 0148C 01A3E 0275A ...
SUB_011FC:
        SETHEX                                   * 011FC
        D1=(5)  TIMER2CTRL                       * 011FE
        C=DAT1  1                                * 01205
        D=0     S                                * 01209
        ?CBIT=1 0                                * 0120C
        GOYES   L_01216                          * 01211
        D=D+1   S                                * 01213
L_01216:
        D1=(2)  #1B                              * 01216
        A=DAT1  A                                * 0121A
        D1=(2)  #04                              * 0121D
        C=0     A                                * 01221
        DAT1=C  4                                * 01223
        D1=A                                     * 01227
        D1=(4)  #0058                            * 0122A
        C=DAT1  13                               * 01230
        D1=(5)  #00104                           * 01234
        C=0     A                                * 0123B
        C=DAT1  4                                * 0123D
        D1=A                                     * 01241
        D1=(4)  #0065                            * 01244
        A=0     A                                * 0124A
        A=DAT1  4                                * 0124C
        ?C=A    A                                * 01250
        GOYES   L_01258                          * 01253
        D=D+1   S                                * 01255
L_01258:
        D1=(4)  #0058                            * 01258
        A=0     W                                * 0125E
        A=DAT1  13                               * 01261
        B=A     W                                * 01265
        D1=(5)  TIMER2                           * 01268
        C=0     W                                * 0126F
        P=      0                                * 01272
        ?D#0    S                                * 01274
        GOYES   L_0128A                          * 01277
        A=DAT1  1                                * 01279
L_0127D:
        C=DAT1  1                                * 0127D
        ?C=A    P                                * 01281
        GOYES   L_0127D                          * 01284
        C=DAT1  8                                * 01286
L_0128A:
        A=B     W                                * 0128A
        P=      7                                * 0128D
        B=C     P                                * 0128F
        B=B+B   P                                * 01292
        GONC    L_0129E                          * 01295
        C=-C    W                                * 01298
        C=-C    WP                               * 0129B
L_0129E:
        DCEX    W                                * 0129E
        P=C     15                               * 012A1
        C=A     W                                * 012A5
        C=C-D   W                                * 012A8
        ?P=     0                                * 012AB
        GOYES   L_012B4                          * 012AE
        P=      0                                * 012B0
        RTNSC                                    * 012B2
L_012B4:
        B=C     W                                * 012B4
        C=0     W                                * 012B7
        P=      5                                * 012BA
        LC(8)   #1D41E89A                        * 012BC
        P=      0                                * 012C6
        BCEX    W                                * 012C8
        ?B>C    W                                * 012CB
        RTNYES                                   * 012CE
        BCEX    W                                * 012D0
        C=0     W                                * 012D3
        P=      5                                * 012D6
        LC(8)   #1EBA1AC1                        * 012D8
        P=      0                                * 012E2
        BCEX    W                                * 012E4
        ?B<=C   W                                * 012E7
        RTNYES                                   * 012EA
        RTNCC                                    * 012EC

* refs (7): 027D3 0CD8E 0CDB8 0CDDC 0CE73 0E37A ...
GetTimChk:
        GOSUB   SUB_011FC                        * 012EE
        RTNNC                                    * 012F2
        GOTO    L_01315                          * 012F5

* refs (5): 0130E 0D39E 0EF8E 80167 8173A
SUB_012F9:
        ST=0    15                               * 012F9
        GOSUB   SUB_011FC                        * 012FC
        GOVLNG  AllowIntr                        * 01300

* refs (2): 0D2E9 0EB95
SavPtrTime*:
        GOSBVL  SAVPTR                           * 01307

* refs (3): 1A813 1A82C 80B52
GetTime++:
        GOSUB   SUB_012F9                        * 0130E
        RTNNC                                    * 01312
L_01315:
        P=      4                                * 01315
        GOLONG  L_001BC                          * 01317

* refs (2): 00218 043F2
srvc_timer2:
        P=      0                                * 0131D
        D1=(5)  TIMER2CTRL                       * 0131F
        A=DAT1  1                                * 01326
        ?ABIT=1 1                                * 0132A
        GOYES   L_01333                          * 0132F
L_01331:
        RTNCC                                    * 01331
L_01333:
        ?ABIT=0 3                                * 01333
        GOYES   L_01331                          * 01338
        GOSBVL  SUB_011FC                        * 0133A
        GONC    L_01348                          * 01341
        GOTO    L_014AB                          * 01344
L_01348:
        ST=0    2                                * 01348
        B=C     W                                * 0134B
        GOSUB   SUB_016DB                        * 0134E
        D1=(4)  #0835                            * 01352
        C=DAT1  P                                * 01358
        ?C#0    P                                * 0135C
        GOYES   L_01382                          * 0135F
        D1=(4)  #065A                            * 01361
        C=DAT1  1                                * 01367
        ?C=0    P                                * 0136B
        GOYES   L_0137F                          * 0136E
        D0=(5)  ALARMS                           * 01370
        A=DAT0  A                                * 01377
        ?A#0    A                                * 0137A
        GOYES   L_01386                          * 0137D
L_0137F:
        ST=1    12                               * 0137F
L_01382:
        GOTO    L_01453                          * 01382
L_01386:
        C=RSTK                                   * 01386
        GOSBVL  CSLW5                            * 01388
        C=RSTK                                   * 0138F
        R0=C                                     * 01391
        D0=A                                     * 01394
        A=DAT0  A                                * 01397
        GOSBVL  SUB_0E914                        * 0139A
        GOC     L_0140A                          * 013A1
L_013A4:
        D0=D0+  5                                * 013A4
        GOSBVL  SUB_0E8F3                        * 013A7
        GONC    L_0140E                          * 013AE
        GOSBVL  SUB_0E914                        * 013B1
        GOC     L_0140A                          * 013B8
        D0=D0+  5                                * 013BB
        GOSBVL  SUB_0E8FE                        * 013BE
        GOC     L_0140A                          * 013C5
        D0=D0+  5                                * 013C8
        GOSBVL  SUB_0E909                        * 013CB
        GOC     L_0140A                          * 013D2
        D0=D0+  5                                * 013D5
        C=0     W                                * 013D8
        C=DAT0  13                               * 013DB
        D0=D0+  13                               * 013DF
        D0=D0+  10                               * 013E2
        ?B<C    W                                * 013E5
        GOYES   L_0140E                          * 013E8
        C=DAT0  1                                * 013EA
        ?C#0    P                                * 013EE
        GOYES   L_013FD                          * 013F1
        ST=1    2                                * 013F3
        LC(1)   #1                               * 013F6
        DAT0=C  1                                * 013F9
L_013FD:
        D0=D0+  1                                * 013FD
        GOSBVL  SAFESKIPOB                       * 01400
        GONC    L_013A4                          * 01407
L_0140A:
        GOTO    TryToRM?                         * 0140A
L_0140E:
        ?ST=0   2                                * 0140E
        GOYES   L_01445                          * 01411
        ST=1    12                               * 01413
        D1=(5)  ALARMSDUE                        * 01416
        LC(1)   #F                               * 0141D
        DAT1=C  1                                * 01420
        D1=(5)  ANNUNCIATORS                     * 01424
        A=DAT1  B                                * 0142B
        ABIT=1  3                                * 0142E
        DAT1=A  B                                * 01433
        C=B     A                                * 01436
        D=C     A                                * 01438
        GOSBVL  L_01E79                          * 0143A  inline data follows
        NIBHEX  DBD5                             * 01441  ½]
L_01445:
        C=R0                                     * 01445
        RSTK=C                                   * 01448
        GOSBVL  CSRW5                            * 0144A
        RSTK=C                                   * 01451
L_01453:
        GOSUB   SUB_016DB                        * 01453
        D1=(4)  #0069                            * 01457
        C=0     W                                * 0145D
        C=DAT1  13                               * 01460
        ?C=0    W                                * 01464
        GOYES   SUB_01485                        * 01467
        ?B<C    W                                * 01469
        GOYES   SUB_01485                        * 0146C
        C=0     W                                * 0146E
        D1=(4)  #0076                            * 01471
        DAT1=C  1                                * 01477
        D1=(4)  #0069                            * 0147B
        DAT1=C  13                               * 01481

* refs (7): 01464 01469 0173A 04411 046DF 0CF03 ...
SUB_01485:
        GOSBVL  SUB_0D877                        * 01485

* refs (1): 042F6
SUB_0148C:
        GOSBVL  SUB_011FC                        * 0148C
        GOC     L_014AB                          * 01493

* refs (1): 0CEA0
SUB_01496:
        B=C     W                                * 01496
        D0=(5)  TIMER2CTRL                       * 01499
        C=DAT0  1                                * 014A0
        ?CBIT=1 0                                * 014A4
        GOYES   L_014B2                          * 014A9
L_014AB:
        GOVLNG  L_01315                          * 014AB
L_014B2:
        P=      0                                * 014B2
        C=0     W                                * 014B4
        LC(8)   #7E900000                        * 014B7
        A=C     W                                * 014C1
        A=A+B   W                                * 014C4
        GOSUB   SUB_016E2                        * 014C7
        D0=(4)  #0077                            * 014CB
        C=DAT0  1                                * 014D1
        ?C=0    P                                * 014D5
        GOYES   L_014EC                          * 014D8
        C=0     W                                * 014DA
        LC(7)   #1C20000                         * 014DD
        A=C     W                                * 014E6
        A=A+B   W                                * 014E9
L_014EC:
        D0=(4)  #0069                            * 014EC
        C=0     W                                * 014F2
        C=DAT0  13                               * 014F5
        ?C=0    W                                * 014F9
        GOYES   L_0150E                          * 014FC
        ?C>=A   W                                * 014FE
        GOYES   L_0150E                          * 01501
        A=C     W                                * 01503
        ?A>=B   W                                * 01506
        GOYES   L_0150E                          * 01509
        A=B     W                                * 0150B
L_0150E:
        D0=(4)  #0835                            * 0150E
        C=DAT0  1                                * 01514
        ?C#0    P                                * 01518
        GOYES   L_0154E                          * 0151B
        D0=(4)  #072A                            * 0151D
        C=DAT0  A                                * 01523
        ?C=0    A                                * 01526
        GOYES   L_0153A                          * 01529
        D0=(4)  #065A                            * 0152B
        C=DAT0  1                                * 01531
        ?C#0    P                                * 01535
        GOYES   L_01552                          * 01538
L_0153A:
        C=0     W                                * 0153A
        LC(4)   #2000                            * 0153D
        C=C+B   W                                * 01543
        ?C>=A   W                                * 01546
        GOYES   L_0154E                          * 01549
        A=C     W                                * 0154B
L_0154E:
        GOTO    L_01607                          * 0154E
L_01552:
        C=RSTK                                   * 01552
        GOSBVL  CSLW5                            * 01554
        C=RSTK                                   * 0155B
        R0=C                                     * 0155D
        D0=(5)  ALARMS                           * 01560
        C=DAT0  A                                * 01567
        D0=C                                     * 0156A
        D1=A                                     * 0156D
        GOSBVL  SUB_0E914                        * 01570
        GOC     TryToRM?                         * 01577
L_0157A:
        D0=D0+  5                                * 0157A
        GOSBVL  SUB_0E8F3                        * 0157D
        GOC     L_0158D                          * 01584
        AD1EX                                    * 01587
        GONC    L_015F9                          * 0158A
L_0158D:
        GOSBVL  SUB_0E914                        * 0158D
        GOC     TryToRM?                         * 01594
        D0=D0+  5                                * 01597
        GOSBVL  SUB_0E8FE                        * 0159A
        GOC     TryToRM?                         * 015A1
        D0=D0+  5                                * 015A4
        GOSBVL  SUB_0E909                        * 015A7
        GOC     TryToRM?                         * 015AE
        D0=D0+  5                                * 015B1
        C=0     W                                * 015B4
        C=DAT0  13                               * 015B7
        AD1EX                                    * 015BB
        D1=A                                     * 015BE
        ?C>A    W                                * 015C1
        GOYES   L_015F9                          * 015C4
        D0=D0+  13                               * 015C6
        D0=D0+  10                               * 015C9
        C=DAT0  1                                * 015CC
        ?C#0    P                                * 015D0
        GOYES   L_015E3                          * 015D3
        A=C     W                                * 015D5
        ?A>=B   W                                * 015D8
        GOYES   L_015F9                          * 015DB
        A=B     W                                * 015DD
        GONC    L_015F9                          * 015E0
L_015E3:
        D0=D0+  1                                * 015E3
        GOSBVL  SAFESKIPOB                       * 015E6
        GONC    L_0157A                          * 015ED

* refs (7): 0140A 01577 01594 015A1 015AE 0CBA7 ...
TryToRM?:
        P=      9                                * 015F0
        GOVLNG  L_01FC6                          * 015F2
L_015F9:
        C=R0                                     * 015F9
        RSTK=C                                   * 015FC
        GOSBVL  CSRW5                            * 015FE
        RSTK=C                                   * 01605
L_01607:
        ?ST=0   0                                * 01607
        GOYES   L_01634                          * 0160A
        ABEX    W                                * 0160C
        D0=A                                     * 0160F
        C=0     W                                * 01612
        P=      3                                * 01615
        LC(1)   #1                               * 01617
        A=A&C   P                                * 0161A
        C=C+C   A                                * 0161E
        C=C-A   WP                               * 01620
        AD0EX                                    * 01623
        C=C+A   W                                * 01626
        ABEX    W                                * 01629
        ?C>=A   W                                * 0162C
        GOYES   L_01634                          * 0162F
        A=C     W                                * 01631
L_01634:
        GOSUB   SUB_016E2                        * 01634
        GOSUB   SUB_01750                        * 01638
        ?C<A    W                                * 0163C
        GOYES   L_01660                          * 0163F
        GOSUB   SUB_01763                        * 01641
        ?C>A    W                                * 01645
        GOYES   L_01655                          * 01648
        ?B>=C   W                                * 0164A
        GOYES   L_01698                          * 0164D
        B=C     W                                * 0164F
        GONC    L_01698                          * 01652
L_01655:
        GOSUB   SUB_01776                        * 01655
        C=-C    W                                * 01659
        GOTO    L_0166F                          * 0165C
L_01660:
        ?B>=C   W                                * 01660
        GOYES   L_0166B                          * 01663
        A=C     W                                * 01665
        GONC    L_01698                          * 01668
L_0166B:
        GOSUB   SUB_01776                        * 0166B
L_0166F:
        A=A-C   W                                * 0166F
        B=B-C   W                                * 01672
        R0=A                                     * 01675
        D0=(4)  #0069                            * 01678
        A=0     W                                * 0167E
        A=DAT0  13                               * 01681
        ?A=0    W                                * 01685
        GOYES   L_01691                          * 01688
        A=A-C   W                                * 0168A
        DAT0=A  13                               * 0168D
L_01691:
        A=R0                                     * 01691
        GOTO    L_014B2                          * 01694
L_01698:
        GOSUB   SUB_016E9                        * 01698
        C=A     W                                * 0169C
        C=C-B   W                                * 0169F
        C=C-D   W                                * 016A2
        A=C     W                                * 016A5
        D0=(5)  TIMER2                           * 016A8
        P=      7                                * 016AF
        A=DAT0  S                                * 016B1
L_016B5:
        C=DAT0  S                                * 016B5
        ?C=A    S                                * 016B9
        GOYES   L_016B5                          * 016BC
        C=DAT0  8                                * 016BE
        C=C+A   WP                               * 016C2
        DAT0=C  8                                * 016C5
        D0=(2)  #2F                              * 016C9
        P=      0                                * 016CD
        LC(1)   #7                               * 016CF
        DAT0=C  1                                * 016D2
        C=B     W                                * 016D6
        RTNSC                                    * 016D9

* refs (2): 0134E 01453
SUB_016DB:
        GOVLNG  SUB_0C198                        * 016DB

* refs (2): 014C7 01634
SUB_016E2:
        GOVLNG  SUB_0C1A7                        * 016E2

* refs (3): 01698 01A82 027EA
SUB_016E9:
        D0=A                                     * 016E9
        D1=(5)  =IR_16Hz_Clock                   * 016EC
        A=DAT1  A                                * 016F3
        D1=A                                     * 016F6
        D1=(4)  #0058                            * 016F9
        AD0EX                                    * 016FF

* refs (1): 80BD5
SUB_01702:
        DAT1=A  13                               * 01702
        D0=(5)  #00104                           * 01706
        A=0     A                                * 0170D
        DAT0=A  4                                * 0170F
        A=DAT1  13                               * 01713
        A=DAT0  4                                * 01717
        D1=D1+  13                               * 0171B
        DAT1=A  4                                * 0171E
        D1=D1-  13                               * 01722
        A=DAT1  13                               * 01725
        RTN                                      * 01729

* refs (6): 0DCC7 0DD8F 0DE48 0E71A 0E760 0E7A1
OBJ_0172B:
        CON(5)  (*)+5                            * 0172B  primitive code object
        GOSBVL  SAVPTR                           * 01730
        ST=0    15                               * 01737
        GOSUB   SUB_01485                        * 0173A
        GOSBVL  AllowIntr                        * 0173E
        P=      0                                * 01745
        SETHEX                                   * 01747
        GOVLNG  GETPTRLOOP                       * 01749

* refs (1): 01638
SUB_01750:
        C=0     W                                * 01750
        P=      5                                * 01753
        LC(8)   #1EBA1AC1                        * 01755
        P=      0                                * 0175F
        RTN                                      * 01761

* refs (2): 01641 01A6E
SUB_01763:
        C=0     W                                * 01763
        P=      5                                * 01766
        LC(8)   #1D41E89A                        * 01768
        P=      0                                * 01772
        RTN                                      * 01774

* refs (2): 01655 0166B
SUB_01776:
        C=0     W                                * 01776
        P=      5                                * 01779
        LC(8)   #01783227                        * 0177B
        P=      0                                * 01785
        RTN                                      * 01787

* refs (2): 01A4B 01A78
SUB_01789:
        P=      0                                * 01789
        C=0     W                                * 0178B
        LC(5)   #78000                           * 0178E
        RTN                                      * 01795

* refs (2): 027E0 423C5
SUB_01797:
        P=      0                                * 01797
        C=0     W                                * 01799
        LC(6)   #4B0000                          * 0179C
        RTN                                      * 017A4

* C = msec, D = Hz Checks BEEP flag.
* refs (2): 141D3 141FC
makebeep:
        D0=(5)  #80850                           * 017A6
        A=DAT0  B                                * 017AD
        ?ABIT=1 3                                * 017B0
        RTNYES                                   * 017B5
        ?D=0    A                                * 017B7
        RTNYES                                   * 017BA
        B=C     A                                * 017BC
        C=0     W                                * 017BE
        C=B     A                                * 017C1
        R1=C                                     * 017C3
        C=D     A                                * 017C6
        D0=(5)  CSPEED                           * 017C8
        A=0     W                                * 017CF
        A=DAT0  A                                * 017D2
        ASL     W                                * 017D5
        R2=A                                     * 017D8
        A=A+C   W                                * 017DB
        C=C+C   W                                * 017DE
        GOSBVL  SUB_65807                        * 017E1
        C=0     W                                * 017E8
        P=      0                                * 017EB
        LC(2)   #7C                              * 017ED
        A=A-C   W                                * 017F1
        GONC    L_017FA                          * 017F4
        A=0     W                                * 017F7
L_017FA:
        LC(2)   #1A                              * 017FA
        GOSBVL  SUB_65807                        * 017FE
        C=0     W                                * 01805
        C=C-1   X                                * 01808
        ?C>=A   W                                * 0180B
        GOYES   L_01813                          * 0180E
        A=C     W                                * 01810
L_01813:
        R3=A                                     * 01813
        A=R2                                     * 01816
        C=R1                                     * 01819
        GOSBVL  MPY                              * 0181C
        R0=A                                     * 01823
        A=R3                                     * 01826
        C=0     W                                * 01829
        LC(4)   #6590                            * 0182C
        GOSBVL  MPY                              * 01832
        C=0     W                                * 01839
        LC(5)   #21728                           * 0183C
        C=C+A   W                                * 01843
        D=C     W                                * 01846
        CSRB                                     * 01849
        A=R0                                     * 0184C
        A=A+C   W                                * 0184F
        C=D     W                                * 01852
        GOSBVL  SUB_65807                        * 01855
        A=A-1   W                                * 0185C
        GONC    L_01865                          * 0185F
        A=0     W                                * 01862
L_01865:
        C=A     W                                * 01865
        D=C     W                                * 01868
        C=R3                                     * 0186B
        B=C     X                                * 0186E
        INTOFF                                   * 01871
        D1=(5)  TIMER1CTRL                       * 01875
        C=DAT1  S                                * 0187C
        C=0     A                                * 01880
        DAT1=C  1                                * 01882
        D0=(5)  ATTNFLG                          * 01886

addrORghost:
        D1=(5)  SAVE_OR                          * 0188D
        C=DAT1  X                                * 01894
        CBIT=1  11                               * 01898
        P=C     2                                * 0189D
        CBIT=0  11                               * 018A1
        NOP4                                     * 018A6
L_018AA:
        A=DAT0  A                                * 018AA
        ?A#0    A                                * 018AD
        GOYES   L_018C8                          * 018B0
        OUT=C                                    * 018B2
        A=B     X                                * 018B5
L_018B8:
        A=A-1   X                                * 018B8
        GONC    L_018B8                          * 018BB
        CPEX    2                                * 018BE
        D=D-1   W                                * 018C2
        GONC    L_018AA                          * 018C5
L_018C8:
        C=DAT1  X                                * 018C8
        OUT=C                                    * 018CC
        D1=(5)  TIMER1CTRL                       * 018CF
        DAT1=C  S                                * 018D6
        P=      0                                * 018DA
        INTON                                    * 018DC
        RTNCC                                    * 018E0

* Measure CPU clock speed Interrupts off on entry and exit -> A.A=spd/16 B.A=loops/16s Uses C.A D0 P CRY
* refs (2): 0212A 8036E
clkspd:
        SETHEX                                   * 018E2
        B=0     A                                * 018E4
        D0=(5)  #00139                           * 018E6
        A=DAT0  B                                * 018ED
L_018F0:
        C=DAT0  B                                * 018F0
        ?C=A    P                                * 018F3
        GOYES   L_018F0                          * 018F6
        P=      1                                * 018F8
        C=C-1   P                                * 018FA
        C=C-1   P                                * 018FD
L_01900:
        B=B+1   A                                * 01900
        A=DAT0  B                                * 01902
        ?C#A    B                                * 01905
        GOYES   L_01900                          * 01908
        A=0     A                                * 0190A
        P=      0                                * 0190C
        C=0     A                                * 0190E
        LC(2)   #35                              * 01910
L_01914:
        A=A+B   A                                * 01914
        C=C-1   A                                * 01916
        GONC    L_01914                          * 01918
        C=0     A                                * 0191B
        LC(1)   #9                               * 0191D
        A=A+C   A                                * 01920
        RTNCC                                    * 01922
        NIBHEX  00000                            * 01924  ..

* refs (2): 011A5 02045
SUB_01929:
        ST=0    15                               * 01929
        P=      0                                * 0192C
        SETHEX                                   * 0192E
        D0=(5)  CONTRAST                         * 01930
        A=DAT0  B                                * 01937
        LC(3)   #01F                             * 0193A
        A=A&C   X                                * 0193F
        LC(2)   #09                              * 01943
        ?C>A    B                                * 01947
        GOYES   L_01955                          * 0194A
        LC(2)   #18                              * 0194C
        ?C>=A   B                                * 01950
        GOYES   L_0195C                          * 01953
L_01955:
        LC(2)   #0E                              * 01955
        A=C     B                                * 01959
L_0195C:
        DAT0=A  X                                * 0195C
        D0=(2)  #09                              * 01960
        LC(1)   #4                               * 01964
        DAT0=C  1                                * 01967
        D0=(2)  #0B                              * 0196B
        LC(2)   #80                              * 0196F
        DAT0=C  B                                * 01973
        GOSBVL  SUB_30E7D                        * 01976
        D0=(5)  #0011C                           * 0197D
        C=0     A                                * 01984
        DAT0=C  1                                * 01986
        GOSUB   L_01C7F                          * 0198A
        GOSUB   SUB_01CEC                        * 0198E
        D0=(5)  TIMER1CTRL                       * 01992
        LC(2)   #10                              * 01999
        DAT0=C  B                                * 0199D
        D0=(2)  #0E                              * 019A0
        LC(1)   #C                               * 019A4
        DAT0=C  1                                * 019A7
        GOSUB   SUB_01A33                        * 019AB
        GOSBVL  SUB_00E0B                        * 019AF
        INTON                                    * 019B6
        GOSBVL  SUB_0C1A7                        * 019BA
        D0=(4)  #065B                            * 019C1
        C=0     A                                * 019C7
        DAT0=C  1                                * 019C9
        GOSUBL  ClrScrMn                         * 019CD
        GOSBVL  ScrOn+                           * 019D3

* refs (2): 00391 01D4B
SUB_019DA:
        D0=(5)  TIMER1CTRL                       * 019DA
        C=DAT0  B                                * 019E1
        D=C     B                                * 019E4
        P=      0                                * 019E7
        LC(2)   #15                              * 019E9
        DAT0=C  B                                * 019ED
        D0=(2)  #37                              * 019F0
        LC(1)   #1                               * 019F4
        DAT0=C  1                                * 019F7
L_019FB:
        SHUTDN                                   * 019FB
        D0=(2)  #08                              * 019FE
        C=DAT0  1                                * 01A02
        ?CBIT=1 0                                * 01A06
        GOYES   L_01A1C                          * 01A0B
        D0=(2)  #37                              * 01A0D
        C=DAT0  1                                * 01A11
        ?CBIT=0 3                                * 01A15
        GOYES   L_019FB                          * 01A1A
L_01A1C:
        D0=(2)  #37                              * 01A1C
        LC(1)   #7                               * 01A20
        DAT0=C  1                                * 01A23
        D0=(2)  #2E                              * 01A27
        C=D     B                                * 01A2B
        DAT0=C  B                                * 01A2E
        RTNCC                                    * 01A31

* refs (1): 019AB
SUB_01A33:
        A=0     W                                * 01A33
        GOSUB   SUB_01A96                        * 01A36
        GOSUB   SUB_01ABD                        * 01A3A
        GOSBVL  SUB_011FC                        * 01A3E
        GOC     L_01A65                          * 01A45
        B=C     W                                * 01A48
        GOSBVL  SUB_01789                        * 01A4B
        DCEX    W                                * 01A52
        C=-C    W                                * 01A55
        C=C+D   W                                * 01A58
        A=A+C   W                                * 01A5B
        C=D     W                                * 01A5E
        GOTO    L_01A82                          * 01A61
L_01A65:
        P=      4                                * 01A65
        GOSBVL  SUB_02708                        * 01A67
        GOSBVL  SUB_01763                        * 01A6E
        A=C     W                                * 01A75
        GOSBVL  SUB_01789                        * 01A78
        A=A+C   W                                * 01A7F
L_01A82:
        GOSBVL  SUB_016E9                        * 01A82
        D1=(5)  TIMER2                           * 01A89
        DAT1=C  8                                * 01A90
        RTN                                      * 01A94

* refs (3): 01A36 042E3 423D6
SUB_01A96:
        D1=(5)  =IR_16Hz_Clock                   * 01A96
        C=DAT1  A                                * 01A9D
        D1=C                                     * 01AA0
        D1=(4)  #0069                            * 01AA3
        DAT1=A  13                               * 01AA9
        D1=(4)  #0076                            * 01AAD
        C=0     A                                * 01AB3
        C=C-1   A                                * 01AB5
        DAT1=C  1                                * 01AB7
        RTN                                      * 01ABB

* refs (3): 01A3A 042EF 0440B
SUB_01ABD:
        GOSBVL  SUB_0C1B6                        * 01ABD
        D1=(4)  #0077                            * 01AC4
        DAT1=C  1                                * 01ACA
        RTN                                      * 01ACE

* refs (2): 01E63 01FAC
SAVPTR~jump:
        GOVLNG  SAVPTR                           * 01AD0

* refs (6): 008B9 0108D 0238E 0E88E 32A06 802D8
RCKBp:
        B=C     A                                * 01AD7
        GOSUB   SUB_01B66                        * 01AD9
        INTOFF                                   * 01ADD
        AD1EX                                    * 01AE1
        D1=(5)  TIMER1CTRL                       * 01AE4
        CSL     A                                * 01AEB
        CSL     A                                * 01AED
        C=DAT1  B                                * 01AEF
        RSTK=C                                   * 01AF2
        C=0     B                                * 01AF4
        DAT1=C  1                                * 01AF7
        AD1EX                                    * 01AFB
        CSR     A                                * 01AFE
        CSR     A                                * 01B00
        BCEX    A                                * 01B02
        CSL     A                                * 01B04
        P=C     2                                * 01B06
        C=P     4                                * 01B0A
        BCEX    X                                * 01B0E
        NOP5                                     * 01B11
L_01B16:
        OUT=C                                    * 01B16
        P=C     4                                * 01B19
        ?CBIT=1 11                               * 01B1D
        GOYES   L_01B30                          * 01B22
        CBIT=1  11                               * 01B24
        ?CBIT=1 11                               * 01B29
        GOYES   L_01B3C                          * 01B2E
L_01B30:
        CBIT=0  11                               * 01B30
        ?CBIT=1 11                               * 01B35
        GOYES   L_01B3C                          * 01B3A
L_01B3C:
        DSLC                                     * 01B3C
        DSRC                                     * 01B3F
        CSTEX                                    * 01B42
        CSTEX                                    * 01B44
        P=P-1                                    * 01B46
        GONC    L_01B3C                          * 01B48
        B=B+1   B                                * 01B4B
        GONC    L_01B16                          * 01B4E
        P=      0                                * 01B51
        AD1EX                                    * 01B53
        D1=(5)  TIMER1CTRL                       * 01B56
        C=RSTK                                   * 01B5D
        DAT1=C  1                                * 01B5F
        AD1EX                                    * 01B63

* refs (1): 01AD9
SUB_01B66:
        AD1EX                                    * 01B66
        D1=(5)  =IR_16Hz_Clock                   * 01B69
        C=DAT1  A                                * 01B70
        D1=C                                     * 01B73
        D1=(4)  #0642                            * 01B76
        C=DAT1  X                                * 01B7C
        OUT=C                                    * 01B80
        INTON                                    * 01B83
        D1=A                                     * 01B87
        A=IN                                     * 01B8A
        RTNCC                                    * 01B8D

* Turns display on <REF>Dispoff
* refs (2): 01BA5 8037C
DispOn:
        D0=(5)  DISPIO                           * 01B8F
        C=DAT0  1                                * 01B96
        CBIT=1  3                                * 01B9A
        DAT0=C  1                                * 01B9F
        RTN                                      * 01BA3

* refs (4): 0038A 019D3 04432 81E37
ScrOn+:
        GOSUB   DispOn                           * 01BA5
        D0=(5)  ANNCTRL                          * 01BA9
        C=DAT0  B                                * 01BB0
        CBIT=1  7                                * 01BB3
        DAT0=C  B                                * 01BB8
        RTN                                      * 01BBB

* Turns display off <REF>Dispon
* refs (3): 01BD3 01D4F 80367
DispOff:
        D0=(5)  DISPIO                           * 01BBD
        C=DAT0  1                                * 01BC4
        CBIT=0  3                                * 01BC8
        DAT0=C  1                                * 01BCD
        RTN                                      * 01BD1

* refs (1): 043B7
ScrOff+:
        GOSUB   DispOff                          * 01BD3
        D0=(5)  ANNCTRL                          * 01BD7
        C=DAT0  B                                * 01BDE
        CBIT=0  7                                * 01BE1
        DAT0=C  B                                * 01BE6
        RTN                                      * 01BE9

* refs (1): 0204C
SUB_01BEB:
        D0=(5)  ANNCTRL                          * 01BEB
        C=DAT0  B                                * 01BF2
        CBIT=1  4                                * 01BF5
        DAT0=C  B                                * 01BFA
        RTN                                      * 01BFD

* refs (8): 019CD 01FB0 02395 80005 8020E 8040D ...
ClrScrMn:
        P=      0                                * 01BFF
        SETHEX                                   * 01C01
        GOSUB   D0->Row1                         * 01C03
        LC(5)   #00076                           * 01C07
        A=0     W                                * 01C0E
        GOSUB   SUB_01C23                        * 01C11

* refs (1): 81D37
ClrMenu:
        GOSUB   D0->Sft1                         * 01C15
        LC(5)   #00010                           * 01C19
        A=0     W                                * 01C20

* refs (2): 01C11 01C2C
SUB_01C23:
        DAT0=A  W                                * 01C23
        D0=D0+  16                               * 01C27
        C=C-1   A                                * 01C2A
        GONC    SUB_01C23                        * 01C2C
        RTNCC                                    * 01C2F

* ( --> D0 ) Gets addr of current display
* refs (9): 01C03 01C7F 80414 80456 80A10 814C5 ...
D0->Row1:
        GOSBVL  SUB_0C1C5                        * 01C31
        RSTK=C                                   * 01C38
        D0=(4)  #06DA                            * 01C3A
        A=DAT0  4                                * 01C40
        P=      0                                * 01C44
        LC(5)   #00014                           * 01C46
        SETHEX                                   * 01C4D
        A=A+C   A                                * 01C4F
        C=RSTK                                   * 01C51
        D0=A                                     * 01C53
        RTNCC                                    * 01C56

* ( --> D0 ) Gets address of menu grob
* refs (9): 01C15 01C96 12851 80425 80467 814D9 ...
D0->Sft1:
        GOSBVL  SUB_0C1C5                        * 01C58
        RSTK=C                                   * 01C5F
        D0=(4)  #06D0                            * 01C61
        A=DAT0  4                                * 01C67
        P=      0                                * 01C6B
        LC(5)   #00014                           * 01C6D
        SETHEX                                   * 01C74
        A=A+C   A                                * 01C76
        C=RSTK                                   * 01C78
        D0=A                                     * 01C7A
        RTNCC                                    * 01C7D
L_01C7F:
        GOSUB   D0->Row1                         * 01C7F
        D1=(5)  DISPADDR                         * 01C83
        DAT1=A  A                                * 01C8A
        D0=(4)  #068D                            * 01C8D
        DAT0=A  A                                * 01C93
        GOSUB   D0->Sft1                         * 01C96
        D1=(2)  #30                              * 01C9A
        DAT1=A  A                                * 01C9E
        D0=(4)  #0695                            * 01CA1
        DAT0=A  A                                * 01CA7
        A=0     A                                * 01CAA
        D1=(2)  #25                              * 01CAC
        DAT1=A  X                                * 01CB0
        D0=(4)  #0692                            * 01CB4
        GOSBVL  SUB_7DFB6                        * 01CBA
        D0=(4)  #069A                            * 01CC1
        A=DAT0  B                                * 01CC7
        LC(2)   #B7                              * 01CCA
        ?ABIT=1 7                                * 01CCE
        GOYES   L_01CD9                          * 01CD3
        LC(2)   #37                              * 01CD5
L_01CD9:
        D1=(2)  #28                              * 01CD9
        DAT1=C  B                                * 01CDD
        DAT0=C  B                                * 01CE0
        GOVLNG  disprange                        * 01CE3
        NIBHEX  00                               * 01CEA  .

* refs (1): 0198E
SUB_01CEC:
        GOSBVL  SUB_0C1A7                        * 01CEC
        C=0     A                                * 01CF3
        D0=(4)  #06C5                            * 01CF5
        DAT0=C  1                                * 01CFB
        D0=(4)  #06C8                            * 01CFF
        DAT0=C  X                                * 01D05
        D0=(4)  #06CB                            * 01D09
        DAT0=C  A                                * 01D0F
        D0=(4)  #069A                            * 01D12
        GOVLNG  L_7DF9D                          * 01D18
        FILLTO  #01D44                           * 01D1F  37 zero nibbles: the next entry stays at #01D44
L_01D44:
        GOSBVL  SUB_12690                        * 01D44
        GOSUB   SUB_019DA                        * 01D4B
        GOSUB   DispOff                          * 01D4F
        GOSBVL  SUB_0C1A7                        * 01D53
        D0=(4)  #068D                            * 01D5A
        D1=(5)  DISPADDR                         * 01D60
        C=DAT0  A                                * 01D67
        DAT1=C  A                                * 01D6A
        D0=(4)  #0692                            * 01D6D
        C=DAT0  X                                * 01D73
        D1=(2)  #25                              * 01D77
        DAT1=C  X                                * 01D7B
        D1=(2)  #00                              * 01D7F
        CSLC                                     * 01D83
        CBIT=0  3                                * 01D86
        DAT1=C  1                                * 01D8B
        D0=(4)  #069A                            * 01D8F
        C=DAT0  B                                * 01D95
        D1=(2)  #28                              * 01D98
        DAT1=C  B                                * 01D9C
        RTN                                      * 01D9F

* refs (4): 09BC4 8068F 8112A 8199D
SUB_01DA1:
        P=      0                                * 01DA1
        LC(5)   #3FFFB                           * 01DA3
        GOSUB   SUB_01E2A                        * 01DAA
        GONC    L_01DFB                          * 01DAE
        GOSUB   SUB_01DFD                        * 01DB1
        R3=A                                     * 01DB5
        GOSUB   SUB_01E08                        * 01DB8
        R4=A                                     * 01DBC
        A=R3                                     * 01DBF
        A=-A-1  A                                * 01DC2
        GOSUB   SUB_01E19                        * 01DC4
        GOSUB   SUB_01DFD                        * 01DC8
        C=R3                                     * 01DCC
        DAT0=C  A                                * 01DCF
        ?C#A    A                                * 01DD2
        GOYES   L_01DEC                          * 01DD5
        A=R4                                     * 01DD7
        GOSUB   SUB_01E19                        * 01DDA
        LC(8)   #4B383231                        * 01DDE
        GOTO    L_01DF6                          * 01DE8
L_01DEC:
        LC(8)   #4B323320                        * 01DEC
L_01DF6:
        D0=D0+  5                                * 01DF6
        RTNCC                                    * 01DF9
L_01DFB:
        RTNSC                                    * 01DFB

* refs (2): 01DB1 01DC8
SUB_01DFD:
        LC(5)   #0FFFB                           * 01DFD
        GOTO    L_01E0F                          * 01E04

* refs (1): 01DB8
SUB_01E08:
        LC(5)   #3FFFB                           * 01E08
L_01E0F:
        C=C+B   A                                * 01E0F
        D0=C                                     * 01E11
        A=DAT0  A                                * 01E14
        RTN                                      * 01E17

* refs (2): 01DC4 01DDA
SUB_01E19:
        LC(5)   #3FFFB                           * 01E19
        C=C+B   A                                * 01E20
        D0=C                                     * 01E22
        DAT0=A  A                                * 01E25
        RTN                                      * 01E28

* refs (1): 01DAA
SUB_01E2A:
        C=C+B   A                                * 01E2A
        D0=C                                     * 01E2C
        C=DAT0  A                                * 01E2F
        RSTK=C                                   * 01E32
        C=0     A                                * 01E34
        C=C-1   A                                * 01E36
        DAT0=C  A                                * 01E38
        A=DAT0  A                                * 01E3B
        ?C#A    A                                * 01E3E
        GOYES   L_01E5A                          * 01E41
        C=0     A                                * 01E43
        DAT0=C  A                                * 01E45
        A=DAT0  A                                * 01E48
        ?C#A    A                                * 01E4B
        GOYES   L_01E5A                          * 01E4E
        C=RSTK                                   * 01E50
        DAT0=C  A                                * 01E52
        D0=D0+  5                                * 01E55
        RTNSC                                    * 01E58
L_01E5A:
        C=RSTK                                   * 01E5A
        RTNCC                                    * 01E5C

* refs (3): 04895 113A3 17BA4
OBJ_01E5E:
        CON(5)  (*)+5                            * 01E5E  primitive code object
        GOSUB   SAVPTR~jump                      * 01E63
        ST=0    15                               * 01E67
        GOSUB   L_01E79                          * 01E6A  inline data follows
        GOSBVL  AllowIntr                        * 01E6E
        GOTO    L_01FB6                          * 01E75
L_01E79:
        C=RSTK                                   * 01E79
        B=C     A                                * 01E7B
        P=      0                                * 01E7D
        SETHEX                                   * 01E7F
        A=0     A                                * 01E81
        GOSBVL  SUB_00D26                        * 01E83
        GONC    L_01E95                          * 01E8A
        ABIT=1  6                                * 01E8D
        A=A+1   XS                               * 01E92
L_01E95:
        GOSBVL  SUB_00D14                        * 01E95
        GONC    L_01EA7                          * 01E9C
        ABIT=1  4                                * 01E9F
        A=A+1   XS                               * 01EA4
L_01EA7:
        GOSBVL  SUB_00D1D                        * 01EA7
        GONC    L_01EB9                          * 01EAE
        ABIT=1  5                                * 01EB1
        A=A+1   XS                               * 01EB6
L_01EB9:
        ASRB.F  XS                               * 01EB9
        ?A=0    XS                               * 01EBE
        GOYES   L_01EC5                          * 01EC1
        A=0     A                                * 01EC3
L_01EC5:
        GOSUB   SUB_01EF6                        * 01EC5
        D1=(4)  #0841                            * 01EC9
        C=DAT1  B                                * 01ECF
        A=A!C   B                                * 01ED2
        GOSUB   SUB_01EFD                        * 01ED6
        C=B     A                                * 01EDA
        RSTK=C                                   * 01EDC
        GOSUB   SUB_01EF6                        * 01EDE
        D1=(4)  #0642                            * 01EE2
        C=DAT1  X                                * 01EE8

OUT=CC=in:
        OUT=C                                    * 01EEC
        GOVLNG  CINRTN                           * 01EEF

* refs (2): 01EC5 01EDE
SUB_01EF6:
        GOVLNG  SUB_0C198                        * 01EF6

* refs (2): 01ED6 804B9
SUB_01EFD:
        D1=(5)  L_01F41                          * 01EFD
        C=B     A                                * 01F04
        RSTK=C                                   * 01F06
        B=0     A                                * 01F08
L_01F0A:
        D1=D1+  2                                * 01F0A
        A=A+A   B                                * 01F0D
        GONC    L_01F1D                          * 01F10
        C=DAT1  B                                * 01F13
        B=B!C   B                                * 01F16
        GOC     L_01F0A                          * 01F1A
L_01F1D:
        ?A#0    B                                * 01F1D
        GOYES   L_01F0A                          * 01F20
        D1=(5)  ANNCTRL                          * 01F22
        A=DAT1  B                                * 01F29
        P=      0                                * 01F2C
        LC(2)   #C0                              * 01F2E
        A=A&C   B                                * 01F32
        A=A!B   B                                * 01F36
        DAT1=A  B                                * 01F3A
        C=RSTK                                   * 01F3D
        B=C     A                                * 01F3F
L_01F41:
        RTNCC                                    * 01F41

* Annunciator bit for each bit of the annunciator byte (read at #01F13)
        CON(2)  #10                              * 01F43  entry 0
        CON(2)  #04                              * 01F45  entry 1
        CON(2)  #02                              * 01F47  entry 2
        CON(2)  #01                              * 01F49  entry 3
        CON(2)  #08                              * 01F4B  entry 4
        CON(2)  #00                              * 01F4D  entry 5
        CON(2)  #20                              * 01F4F  entry 6
        CON(2)  #00                              * 01F51  entry 7

* refs (1): 423F3
GETKEY~6~1:
        CON(5)  (*)+5                            * 01F53  primitive code object
        CD0EX                                    * 01F58
        RSTK=C                                   * 01F5B
        GOSBVL  SUB_00655                        * 01F5D
        C=RSTK                                   * 01F64
        D0=C                                     * 01F66
        GOTO    L_01F9D                          * 01F69

* ->
* refs (4): 8D396 9CA6B 9D0D1 CF5EE
CLCD10:
        CON(5)  (*)+5                            * 01F6D  primitive code object
        CD1EX                                    * 01F72
        RSTK=C                                   * 01F75
        D1=(5)  VDISP                            * 01F77
        C=DAT1  A                                * 01F7E
        D1=C                                     * 01F81
        D1=D1+  10                               * 01F84
        D1=D1+  10                               * 01F87
        LC(5)   #00770                           * 01F8A
        GOSBVL  WIPEOUT                          * 01F91
        C=RSTK                                   * 01F98
        D1=C                                     * 01F9A
L_01F9D:
        A=DAT0  A                                * 01F9D
        D0=D0+  5                                * 01FA0
        PC=(A)                                   * 01FA3

* ->
* refs (2): 385ED 9C655
CLEARLCD:
        CON(5)  (*)+5                            * 01FA7  primitive code object
        GOSUB   SAVPTR~jump                      * 01FAC
        GOSUBL  ClrScrMn                         * 01FB0
L_01FB6:
        GOVLNG  GETPTRLOOP                       * 01FB6

* refs (4): 00F55 04244 131C1 21B53
Warmstart:
        ST=1    6                                * 01FBD
        GOTO    L_01FC9                          * 01FC0
        NIBHEX  2F                               * 01FC4  ò
L_01FC6:
        ST=0    6                                * 01FC6
L_01FC9:
        ST=0    2                                * 01FC9
        ST=1    7                                * 01FCC
        GOTO    L_01FE3                          * 01FCF

* refs (3): 00F1C 0202F 020B1
Coldstart:
        ST=1    7                                * 01FD3
        GOTO    L_01FDD                          * 01FD6

norecCSseq:
        ST=0    7                                * 01FDA
L_01FDD:
        ST=1    2                                * 01FDD
        ST=1    6                                * 01FE0
L_01FE3:
        C=P     15                               * 01FE3
        ST=0    15                               * 01FE7
        RESET                                    * 01FEA
        GOVLNG  L_7018C                          * 01FED
L_01FF4:
        ?ST=1   6                                * 01FF4
        GOYES   L_02033                          * 01FF7
        P=C     15                               * 01FF9
        ?P=     3                                * 01FFD
        GOYES   L_02007                          * 02000
