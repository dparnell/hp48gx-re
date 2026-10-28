* HP 48GX ROM revision R, #06000-#08000: EVAL, COLA, ?SKIP and other control words
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ' COLA EVAL SAVPTR ?SKIP ABND LOOP INDEX@ BEGIN GETPTR POP# RDROP
* Follows on from the previous file (at #06000 in the original ROM).
        GONC    L_05FED                          * 06000
        D1=(5)  TEMPENV                          * 06003
        C=DAT1  A                                * 0600A
        D1=C                                     * 0600D
        GOC     L_06042                          * 06010
L_06013:
        D0=A                                     * 06013
        D0=D0-  15                               * 06016
        D1=D1+  10                               * 06019
L_0601C:
        C=DAT1  A                                * 0601C
        ?B>C    A                                * 0601F
        GOYES   L_06029                          * 06022
        ?D>C    A                                * 06024
        RTNYES                                   * 06027
L_06029:
        D1=D1+  5                                * 06029
        C=DAT1  A                                * 0602C
        ?B>C    A                                * 0602F
        GOYES   L_06039                          * 06032
        ?D>C    A                                * 06034
        RTNYES                                   * 06037
L_06039:
        D1=D1+  5                                * 06039
        D0=D0-  10                               * 0603C
        GONC    L_0601C                          * 0603F
L_06042:
        A=DAT1  A                                * 06042
        ?A#0    A                                * 06045
        GOYES   L_06013                          * 06048
        D1=(5)  TOUCHTAB                         * 0604A
        C=DAT1  A                                * 06051
        D1=C                                     * 06054
        D1=D1-  2                                * 06057
L_0605A:
        D1=D1+  5                                * 0605A
        C=DAT1  A                                * 0605D
        ?C=0    A                                * 06060
        GOYES   L_06071                          * 06063
        ?B>C    A                                * 06065
        GOYES   L_0605A                          * 06068
        ?D<=C   A                                * 0606A
        GOYES   L_0605A                          * 0606D
        RTNSC                                    * 0606F
L_06071:
        ST=0    0                                * 06071
        RTNCC                                    * 06074

* refs (6): 061C1 061E0 06213 06243 0624D 0628A
SUB_06076:
        D=C     A                                * 06076
        C=RSTK                                   * 06078
        DCEX    A                                * 0607A
        ?B<=C   A                                * 0607C
        GOYES   L_06086                          * 0607F
        ?C>=A   A                                * 06081
        GOYES   L_0608C                          * 06084
L_06086:
        C=D     A                                * 06086
        RSTK=C                                   * 06088
        RTN                                      * 0608A
L_0608C:
        D0=C                                     * 0608C
L_0608F:
        GOSBVL  SKIPOB                           * 0608F
L_06096:
        LC(5)   SEMI                             * 06096
        A=DAT0  A                                * 0609D
        ?C#A    A                                * 060A0
        GOYES   L_060AB                          * 060A3
        D0=D0+  5                                * 060A5
        GONC    L_06096                          * 060A8
L_060AB:
        P=      4                                * 060AB
        LC(1)   #2                               * 060AD
        A=A+C   P                                * 060B0
        P=      0                                * 060B3
        GONC    L_0608F                          * 060B5
        P=      4                                * 060B8
        LC(1)   #F                               * 060BA
        A=C     P                                * 060BD
        P=      0                                * 060C0
        DAT0=A  A                                * 060C2
        C=D     A                                * 060C5
        RSTK=C                                   * 060C7
        D0=(5)  TEMPOB                           * 060C9
        A=DAT0  A                                * 060D0
        RTN                                      * 060D3

* refs (6): 0631F 0633E 06371 063A1 063AB 063E6
SUB_060D5:
        ?C<=A   A                                * 060D5
        RTNYES                                   * 060D8
        D0=(5)  TEMPTOP                          * 060DA
        A=DAT0  A                                * 060E1
        ?C>=A   A                                * 060E4
        GOYES   L_06132                          * 060E7
        D0=C                                     * 060E9
        C=RSTK                                   * 060EC
        D=C     A                                * 060EE
L_060F0:
        GOSBVL  SKIPOB                           * 060F0
        LC(5)   SEMI                             * 060F7
L_060FE:
        A=DAT0  A                                * 060FE
        ?C#A    A                                * 06101
        GOYES   L_0610C                          * 06104
        D0=D0+  5                                * 06106
        GONC    L_060FE                          * 06109
L_0610C:
        P=      4                                * 0610C
        LC(1)   #2                               * 0610E
        A=A+C   P                                * 06111
        P=      0                                * 06114
        GONC    L_060F0                          * 06116
        P=      4                                * 06119
        D0=D0+  5                                * 0611B
        A=DAT0  P                                * 0611E
        P=      0                                * 06122
        A=A-B   A                                * 06124
        C=DAT1  A                                * 06126
        C=C+A   A                                * 06129
        DAT1=C  A                                * 0612B
        C=D     A                                * 0612E
        RSTK=C                                   * 06130
L_06132:
        D0=(5)  TEMPOB                           * 06132
        A=DAT0  A                                * 06139
        RTN                                      * 0613C

* Garbage collection does not use R1..R4
* refs (35): 02D6B 03426 039D1 03A47 03AA4 04C02 ...
GARBAGECOL:
        C=RSTK                                   * 0613E
        D0=(5)  GARBSCRATCH1                     * 06140
        DAT0=C  A                                * 06147
        ST=0    0                                * 0614A
        ?ST=0   1                                * 0614D
        GOYES   L_06155                          * 06150
        ST=1    0                                * 06152
L_06155:
        D1=(5)  TEMPTOP                          * 06155
        C=DAT1  A                                * 0615C
        D1=C                                     * 0615F
        P=      15                               * 06162
        LC(1)   #E                               * 06164
        P=      0                                * 06167
        D1=D1-  5                                * 06169
L_0616C:
        C=DAT1  A                                * 0616C
        ?C=0    A                                * 0616F
        GOYES   L_06193                          * 06172
        B=C     A                                * 06174
        P=C     15                               * 06176
        CPEX    4                                * 0617A
        CPEX    5                                * 0617E
        P=      0                                * 06182
        DAT1=C  6                                * 06184
        CD1EX                                    * 06188
        C=C-B   A                                * 0618B
        D1=C                                     * 0618D
        GONC    L_0616C                          * 06190
L_06193:
        P=      0                                * 06193
        D0=(5)  TEMPTOP                          * 06195
        A=DAT0  A                                * 0619C
        B=A     A                                * 0619F
        D0=(5)  TEMPOB                           * 061A1
        A=DAT0  A                                * 061A8
        C=C+1   S                                * 061AB
        B=C     S                                * 061AE
        D1=(5)  DSKTOP                           * 061B1
        C=DAT1  A                                * 061B8
        D1=C                                     * 061BB
        GONC    L_061C8                          * 061BE
L_061C1:
        GOSUB   SUB_06076                        * 061C1
        D1=D1+  5                                * 061C5
L_061C8:
        C=DAT1  A                                * 061C8
        ?C#0    A                                * 061CB
        GOYES   L_061C1                          * 061CE
        D1=(5)  RSKTOP                           * 061D0
        C=DAT1  A                                * 061D7
        D1=C                                     * 061DA
        GONC    L_061E4                          * 061DD
L_061E0:
        GOSUB   SUB_06076                        * 061E0
L_061E4:
        D1=D1-  5                                * 061E4
        C=DAT1  A                                * 061E7
        CPEX    0                                * 061EA
        ?C=0    A                                * 061EE
        GOYES   L_061FA                          * 061F1
        CPEX    0                                * 061F3
        GONC    L_061E0                          * 061F7
L_061FA:
        P=      0                                * 061FA
        D1=(5)  INTRPPTR                         * 061FC
        LC(2)   #24                              * 06203
        CSRC                                     * 06207
        D=C     S                                * 0620A
        CSRC                                     * 0620D
L_06210:
        C=DAT1  A                                * 06210
        GOSUB   SUB_06076                        * 06213
        D1=D1+  5                                * 06217
        D=D-1   S                                * 0621A
        GONC    L_06210                          * 0621D
        C=C-1   S                                * 06220
        GONC    L_06210                          * 06223
        D1=(5)  TEMPENV                          * 06226
        C=DAT1  A                                * 0622D
        D1=C                                     * 06230
        GOC     L_06268                          * 06233
L_06236:
        D0=(5)  GARBSCRATCH2                     * 06236
        DAT0=C  A                                * 0623D
        C=DAT1  A                                * 06240
        GOSUB   SUB_06076                        * 06243
        D1=D1+  5                                * 06247
        C=DAT1  A                                * 0624A
        GOSUB   SUB_06076                        * 0624D
        D1=D1+  5                                * 06251
        D0=(5)  GARBSCRATCH2                     * 06254
        C=DAT0  A                                * 0625B
        P=      9                                * 0625E
L_06260:
        C+P+1                                    * 06260
        P=      0                                * 06263
        GONC    L_06236                          * 06265
L_06268:
        C=DAT1  A                                * 06268
        D1=D1+  10                               * 0626B
        P=      14                               * 0626E
        C=-C    A                                * 06270
        GOC     L_06260                          * 06272
        P=      0                                * 06275
        D1=(5)  TOUCHTAB                         * 06277
        C=DAT1  A                                * 0627E
        D1=C                                     * 06281
        D1=D1+  3                                * 06284
        GONC    L_06291                          * 06287
L_0628A:
        GOSUB   SUB_06076                        * 0628A
        D1=D1+  5                                * 0628E
L_06291:
        C=DAT1  A                                * 06291
        ?C#0    A                                * 06294
        GOYES   L_0628A                          * 06297
        A=B     A                                * 06299
        D0=A                                     * 0629B
        B=0     A                                * 0629E
        P=      4                                * 062A0
        LC(1)   #E                               * 062A2
        D=C     P                                * 062A5
        D0=D0-  5                                * 062A8
L_062AB:
        C=DAT0  6                                * 062AB
        ?C=0    A                                * 062AF
        GOYES   L_062FD                          * 062B2
        AD0EX                                    * 062B4
        D1=A                                     * 062B7
        P=      4                                * 062BA
        C=C!D   P                                * 062BC
        C=C-D   P                                * 062C0
        CPEX    4                                * 062C3
        CPEX    5                                * 062C7
        CPEX    4                                * 062CB
        A=A-C   A                                * 062CF
        D0=A                                     * 062D1
        P=      5                                * 062D4
        ?C=0    P                                * 062D6
        GOYES   L_062F8                          * 062D9
        C=B     A                                * 062DB
        CPEX    4                                * 062DD
        CPEX    5                                * 062E1
        CPEX    4                                * 062E5
        P=      4                                * 062E9
        C=D     P                                * 062EB
        C=C+1   P                                * 062EE
        DAT1=C  6                                * 062F1
        GONC    L_062AB                          * 062F5
L_062F8:
        B=B+C   A                                * 062F8
        GONC    L_062AB                          * 062FA
L_062FD:
        C=0     W                                * 062FD
        A=0     W                                * 06300
        D0=(5)  TEMPOB                           * 06303
        A=DAT0  A                                * 0630A
        P=      0                                * 0630D
        D1=(5)  DSKTOP                           * 0630F
        C=DAT1  A                                * 06316
        D1=C                                     * 06319
        GOC     L_06326                          * 0631C
L_0631F:
        GOSUB   SUB_060D5                        * 0631F
        D1=D1+  5                                * 06323
L_06326:
        C=DAT1  A                                * 06326
        ?C#0    A                                * 06329
        GOYES   L_0631F                          * 0632C
        D1=(5)  RSKTOP                           * 0632E
        C=DAT1  A                                * 06335
        D1=C                                     * 06338
        GONC    L_06342                          * 0633B
L_0633E:
        GOSUB   SUB_060D5                        * 0633E
L_06342:
        D1=D1-  5                                * 06342
        C=DAT1  A                                * 06345
        CPEX    0                                * 06348
        ?C=0    A                                * 0634C
        GOYES   L_06358                          * 0634F
        CPEX    0                                * 06351
        GONC    L_0633E                          * 06355
L_06358:
        P=      0                                * 06358
        D1=(5)  INTRPPTR                         * 0635A
        LC(2)   #24                              * 06361
        CSRC                                     * 06365
        D=C     S                                * 06368
        CSRC                                     * 0636B
L_0636E:
        C=DAT1  A                                * 0636E
        GOSUB   SUB_060D5                        * 06371
        D1=D1+  5                                * 06375
        D=D-1   S                                * 06378
        GONC    L_0636E                          * 0637B
        C=C-1   S                                * 0637E
        GONC    L_0636E                          * 06381
        D1=(5)  TEMPENV                          * 06384
        C=DAT1  A                                * 0638B
        D1=C                                     * 0638E
        GOC     L_063C4                          * 06391
L_06394:
        D0=(5)  GARBSCRATCH2                     * 06394
        DAT0=C  A                                * 0639B
        C=DAT1  A                                * 0639E
        GOSUB   SUB_060D5                        * 063A1
        D1=D1+  5                                * 063A5
        C=DAT1  A                                * 063A8
        GOSUB   SUB_060D5                        * 063AB
        D1=D1+  5                                * 063AF
        D0=(5)  GARBSCRATCH2                     * 063B2
        C=DAT0  A                                * 063B9
        P=      9                                * 063BC
L_063BE:
        C+P+1                                    * 063BE
        GONC    L_06394                          * 063C1
L_063C4:
        C=DAT1  A                                * 063C4
        D1=D1+  10                               * 063C7
        P=      14                               * 063CA
        C=-C    A                                * 063CC
        GOC     L_063BE                          * 063CE
        P=      0                                * 063D1
        D1=(5)  TOUCHTAB                         * 063D3
        C=DAT1  A                                * 063DA
        D1=C                                     * 063DD
        D1=D1+  3                                * 063E0
        GONC    L_063ED                          * 063E3
L_063E6:
        GOSUB   SUB_060D5                        * 063E6
        D1=D1+  5                                * 063EA
L_063ED:
        C=DAT1  A                                * 063ED
        ?C#0    A                                * 063F0
        GOYES   L_063E6                          * 063F3
        D0=(5)  TEMPOB                           * 063F5
        C=DAT0  A                                * 063FC
        C=C+CON A,5                              * 063FF
        D0=C                                     * 06405
        D1=C                                     * 06408
L_0640B:
        C=DAT0  A                                * 0640B
        CPEX    0                                * 0640E
        ?C=0    A                                * 06412
        GOYES   L_0646B                          * 06415
        CPEX    0                                * 06417
        CD0EX                                    * 0641B
        B=C     A                                * 0641E
        D0=C                                     * 06420
        D0=D0+  1                                * 06423
L_06426:
        GOSBVL  SKIPOB                           * 06426
        D0=D0+  4                                * 0642D
        A=DAT0  1                                * 06430
        LC(1)   #2                               * 06434
        C=C+A   P                                * 06437
        C=A     P                                * 0643A
        GOC     L_06446                          * 0643D
        D0=D0-  4                                * 06440
        GONC    L_06426                          * 06443
L_06446:
        D0=D0+  1                                * 06446
        ?CBIT=0 0                                * 06449
        GOYES   L_0640B                          * 0644E
        CD0EX                                    * 06450
        D0=C                                     * 06453
        C=C-B   A                                * 06456
        D0=D0-  5                                * 06458
        DAT0=C  A                                * 0645B
        A=B     A                                * 0645E
        D0=A                                     * 06460
        GOSUB   MOVEDOWN                         * 06463
        GOTO    L_0640B                          * 06467
L_0646B:
        P=      0                                * 0646B
        DAT0=C  1                                * 0646D
        LC(5)   TEMPTOP                          * 06471
        CD1EX                                    * 06478
        DAT1=C  A                                * 0647B
        D1=(5)  RSKTOP                           * 0647E
        A=DAT1  A                                * 06485
        B=C     A                                * 06488
        CD0EX                                    * 0648A
        D0=C                                     * 0648D
        C=C-B   A                                * 06490
        A=A-C   A                                * 06492
        DAT1=A  A                                * 06494
        C=B     A                                * 06497
        D1=C                                     * 06499
        C=A-C   A                                * 0649C
        GOSUB   MOVEDOWN                         * 0649E
        D0=(5)  GARBSCRATCH1                     * 064A2
        C=DAT0  A                                * 064A9
        RSTK=C                                   * 064AC
        ST=0    1                                * 064AE
        ?ST=0   0                                * 064B1
        GOYES   L_064B9                          * 064B4
        ST=1    1                                * 064B6
L_064B9:
        GOTO    ADJMEM                           * 064B9
        RPL

* ob -> ob ob'
* refs (5): 08C95 1DBDD 20949 36246 37B6C
TOTEMPOBADJ:
        :: DUP TOTEMPSWAP DOADJ ;                * 064BD

* ob1 ob2 -> ob1 ob'
* refs (1): 097D4
DOADJ1:
        CON(5)  (*)+5                            * 064D6  primitive code object
        ASSEMBLE
        ST=0    1                                * 064DB
        GOTO    L_064EA                          * 064DE

* ob1 ob2 -> ob1 ob'
* refs (1): 064CC
DOADJ:
        CON(5)  (*)+5                            * 064E2  primitive code object
        ST=1    1                                * 064E7
L_064EA:
        A=DAT1  A                                * 064EA
        D1=D1+  5                                * 064ED
        GOSUB   SAVPTR                           * 064F0
        B=A     A                                * 064F4
        D0=A                                     * 064F6
        D0=D0+  5                                * 064F9
        ?ST=0   1                                * 064FC
        GOYES   L_0650A                          * 064FF
        D0=D0-  5                                * 06501
        GOSUBL  SKIPOB                           * 06504
L_0650A:
        C=DAT1  A                                * 0650A
        C=C-B   A                                * 0650D
        AD0EX                                    * 0650F
        ABEX    A                                * 06512
        GOSUB   SUB_06863                        * 06514
        GOSUB   GETPTR                           * 06518
        D1=D1-  5                                * 0651C
        A=DAT0  A                                * 0651F
        D0=D0+  5                                * 06522
        PC=(A)                                   * 06525

* <REF>GETPTR , Push R0 & R1 as #
* refs (17): 03F14 04DF7 08CF8 137CB 26F07 314BE ...
PUSH2#:
        GOSUB   PUSH#                            * 06529
        GOSUB   SAVPTR                           * 0652D
        A=R1                                     * 06531
        R0=A                                     * 06534

* <REF>GETPTR , Push R0 as #
* refs (45): 03171 0357F 036F7 03DD0 04767 04CFE ...
PUSH#:
        ST=0    10                               * 06537
L_0653A:
        LC(5)   #0002C                           * 0653A
        A=R0                                     * 06541
        ?C>A    A                                * 06544
        GOYES   L_065B4                          * 06547
        LC(5)   #00010                           * 06549
        B=C     A                                * 06550
        LC(1)   #5                               * 06552
        D=C     A                                * 06555
        D1=(5)  DSKTOP                           * 06557
        C=DAT1  A                                * 0655E
        D1=(5)  RSKTOP                           * 06561
        A=DAT1  A                                * 06568
        C=C-A   A                                * 0656B
        C=C-D   A                                * 0656D
        GOC     L_0659B                          * 0656F
        GOSUB   SUB_06B00                        * 06572
        AD0EX                                    * 06576
        D0=A                                     * 06579
        LC(5)   DOBINT                           * 0657C
        DAT0=C  A                                * 06583
        D0=D0+  5                                * 06586
        C=R0                                     * 06589
        DAT0=C  A                                * 0658C
        GOSUB   GETPTR                           * 0658F
L_06593:
        D1=D1-  5                                * 06593
        DAT1=A  A                                * 06596
        RTN                                      * 06599
L_0659B:
        ?ST=1   10                               * 0659B
        GOYES   GPMEMERR                         * 0659E
        GOSUB   GARBAGECOL                       * 065A0  inline data follows
        ST=1    10                               * 065A4
        GONC    L_0653A                          * 065A7

* <REF>GETPTR <REF>DOMEMERR
* refs (10): 05560 0659B 066A7 12D7E 16342 70738 ...
GPMEMERR:
        GOSUB   GETPTR                           * 065AA
        GOLONG  DOMEMERR                         * 065AE
L_065B4:
        A=A+A   A                                * 065B4
        C=A     A                                * 065B6
        A=A+A   A                                * 065B8
        A=A+A   A                                * 065BA
        A=A+C   A                                * 065BC
        LC(5)   BINT0                            * 065BE
        A=A+C   A                                * 065C5
        GOSUB   GETPTR                           * 065C7
        D=D-1   A                                * 065CB
        GONC    L_06593                          * 065CD
        D=D+1   A                                * 065D0
        GOSUB   SAVPTR                           * 065D2
        GONC    L_0659B                          * 065D6

* ob -> ob flag
* refs (1): 0977F
PTRREFD?:
        B=C-B   A                                * 065D9
        GONC    L_065E1+1                        * 065DB
        ST=0    1                                * 065DE
* a branch also enters #065E2, where the nibbles decode as A=A-B P
L_065E1:
        GOTO    L_065ED                          * 065E1

* ob -> ob flag
* refs (9): 06BC7 08C54 08C86 17E9D 180A6 1DBCE ...
REFERENCED?:
        CON(5)  (*)+5                            * 065E5  primitive code object
        ST=1    1                                * 065EA
L_065ED:
        A=DAT1  A                                * 065ED
L_065F0:
        D1=D1+  5                                * 065F0
        GOSUB   SAVPTR                           * 065F3
        B=A     A                                * 065F7
        D0=A                                     * 065F9
        A=DAT0  A                                * 065FC
        D0=D0+  5                                * 065FF
        CD0EX                                    * 06602
        ?C=A    A                                * 06605
        GOYES   L_0661B                          * 06608
        ?ST=0   1                                * 0660A
        GOYES   L_0661B                          * 0660D
        D0=C                                     * 0660F
        GOSUBL  SUB_03012                        * 06612
        CD0EX                                    * 06618
L_0661B:
        D=C     A                                * 0661B
        GOSUB   SUB_05F91                        * 0661D
        GOSUB   GETPTR                           * 06621
        D1=D1-  5                                * 06625
        LC(5)   FALSE                            * 06628
        ?ST=0   0                                * 0662F
        GOYES   L_0663B                          * 06632
        LC(5)   TRUE                             * 06634
L_0663B:
        A=C     A                                * 0663B
        PC=(A)                                   * 0663D

* Pop # to A.A
* refs (188): 03273 0332A 033A3 0457A 04A18 04A5E ...
POP#:
        C=DAT1  A                                * 06641
        CD1EX                                    * 06644
        D1=D1+  5                                * 06647
        A=DAT1  A                                * 0664A
        D1=C                                     * 0664D
        D1=D1+  5                                * 06650
        D=D+1   A                                * 06653
        RTN                                      * 06655

* ob -> ob'
* refs (99): 04DAA 09793 0AAC6 0AB8C 0B076 0DC45 ...
TOTEMPOB:
        CON(5)  (*)+5                            * 06657  primitive code object
        ST=0    10                               * 0665C
        GOSUB   SAVPTR                           * 0665F
        C=DAT1  A                                * 06663
        B=C     A                                * 06666
        D0=C                                     * 06668
        GOSUBL  SKIPOB                           * 0666B
        CD0EX                                    * 06671
        RSTK=C                                   * 06674
        C=C-B   A                                * 06676
        GOSUB   CREATETEMP                       * 06678
        D0=C                                     * 0667C
        C=RSTK                                   * 0667F
        GOC     L_066A2                          * 06681
        D0=D0-  6                                * 06684
        CD0EX                                    * 06687
        GOSUB   MOVEUP                           * 0668A
        AD1EX                                    * 0668E
        GOSUB   GETPTR                           * 06691
        DAT1=A  A                                * 06695
        A=DAT0  A                                * 06698
        D0=D0+  5                                * 0669B
        PC=(A)                                   * 0669E
L_066A2:
        ?ST=0   10                               * 066A2
        GOYES   L_066AB                          * 066A5
        GOTO    GPMEMERR                         * 066A7
L_066AB:
        ST=1    10                               * 066AB
        GOSUB   GARBAGECOL                       * 066AE  inline data follows
        NIBHEX  7C1158A                          * 066B2  Ç.Σ

* Copy upwards C.A nibbles from D0 to D1 D0 D1 will point to start of area Used: A.W C.A P Use this to move downwards
* refs (42): 0320E 0668A 069F3 06A86 06B2D 06C92 ...
MOVEUP:
        C=C-1   A                                * 066B9
        GOC     L_06708                          * 066BB
        P=C     0                                * 066BE
        CSR     A                                * 066C2
        C=C-1   A                                * 066C4
        GOC     L_066EB                          * 066C6
L_066C9:
        D0=D0-  16                               * 066C9
        D1=D1-  16                               * 066CC
        A=DAT0  W                                * 066CF
        DAT1=A  W                                * 066D3
        C=C-1   B                                * 066D7
        GONC    L_066C9                          * 066DA
        C=C-1   XS                               * 066DD
        GONC    L_066C9                          * 066E0
        C=C+1   X                                * 066E3
        C=C-1   A                                * 066E6
        GONC    L_066C9                          * 066E8
L_066EB:
        C=0     A                                * 066EB
        C+P+1                                    * 066ED
        AD0EX                                    * 066F0
        A=A-C   A                                * 066F3
        D0=A                                     * 066F5
        AD1EX                                    * 066F8
        A=A-C   A                                * 066FB
        D1=A                                     * 066FD
        A=DAT0  WP                               * 06700
        DAT1=A  WP                               * 06704
L_06708:
        P=      0                                * 06708
        RTNCC                                    * 0670A

* Copy downwards C.A nibbles from D0 to D1, D0 and D1 will point to the next locations Used: A.W C.A P Use this to move upwards
* refs (66): 03547 037CD 05219 0540D 05807 05C18 ...
MOVEDOWN:
        C=C-1   A                                * 0670C
        GOC     L_06758                          * 0670E
        P=C     0                                * 06711
        CSR     A                                * 06715
        C=C-1   A                                * 06717
        GOC     L_0673E                          * 06719
L_0671C:
        A=DAT0  W                                * 0671C
        DAT1=A  W                                * 06720
        D0=D0+  16                               * 06724
        D1=D1+  16                               * 06727
        C=C-1   B                                * 0672A
        GONC    L_0671C                          * 0672D
        C=C-1   XS                               * 06730
        GONC    L_0671C                          * 06733
        C=C+1   X                                * 06736
        C=C-1   A                                * 06739
        GONC    L_0671C                          * 0673B
L_0673E:
        A=DAT0  WP                               * 0673E
        DAT1=A  WP                               * 06742
        CD0EX                                    * 06746
        C+P+1                                    * 06749
        D0=C                                     * 0674C
        CD1EX                                    * 0674F
        C+P+1                                    * 06752
        D1=C                                     * 06755
L_06758:
        P=      0                                * 06758
        RTNCC                                    * 0675A

* Zeroes C.A nibbles at D1 Uses A.W C.A P
* refs (10): 01F91 02426 11639 12CA7 12E50 134D9 ...
WIPEOUT:
        A=0     W                                * 0675C
L_0675F:
        C=C-1   A                                * 0675F
        GOC     L_06797                          * 06761
        P=C     0                                * 06764
        CSR     A                                * 06768
        C=C-1   A                                * 0676A
        GOC     L_0678A                          * 0676C
L_0676F:
        DAT1=A  W                                * 0676F
        D1=D1+  16                               * 06773
        C=C-1   B                                * 06776
        GONC    L_0676F                          * 06779
        C=C-1   XS                               * 0677C
        GONC    L_0676F                          * 0677F
        C=C+1   X                                * 06782
        C=C-1   A                                * 06785
        GONC    L_0676F                          * 06787
L_0678A:
        DAT1=A  WP                               * 0678A
        CD1EX                                    * 0678E
        C+P+1                                    * 06791
        D1=C                                     * 06794
L_06797:
        P=      0                                * 06797
        RTNCC                                    * 06799

* D0 to RPLTOP D1 to DSKTOP B to RETTOP D to FREETOP Clear carry
* refs (336): 01307 01730 01AD0 021CF 02D5B 03151 ...
SAVPTR:
        CD0EX                                    * 0679B
        D0=(5)  INTRPPTR                         * 0679E
        DAT0=C  A                                * 067A5
        D0=(5)  DSKTOP                           * 067A8
        CD1EX                                    * 067AF
        D1=C                                     * 067B2
        DAT0=C  A                                * 067B5
        D0=(5)  RSKTOP                           * 067B8
        C=B     A                                * 067BF
        DAT0=C  A                                * 067C1
        D0=(5)  AVMEM                            * 067C4
        C=D     A                                * 067CB
        DAT0=C  A                                * 067CD
        RTNCC                                    * 067D0

* <REF>SAVPTR in reverse \ Clears Carry.
* refs (198): 021AA 02D80 0342C 03553 03672 0370A ...
GETPTR:
        D0=(5)  AVMEM                            * 067D2
        C=DAT0  A                                * 067D9
        D=C     A                                * 067DC
        D0=(5)  RSKTOP                           * 067DE
        C=DAT0  A                                * 067E5
        B=C     A                                * 067E8
        D0=(5)  DSKTOP                           * 067EA
        C=DAT0  A                                * 067F1
        D1=C                                     * 067F4
        D0=(5)  INTRPPTR                         * 067F7
        C=DAT0  A                                * 067FE
        D0=C                                     * 06801
        RTNCC                                    * 06804

* -> C.A = @DSKTOP-@RETTOP Uses A.A D0
* refs (28): 03A33 04BEE 04C11 05B8D 06A21 06A57 ...
ROOM:
        D0=(5)  DSKTOP                           * 06806
        C=DAT0  A                                * 0680D
        D0=(5)  RSKTOP                           * 06810
        A=DAT0  A                                * 06817
        C=C-A   A                                * 0681A
        RTNCC                                    * 0681C

* refs (6): 068B0 068CF 068F8 06902 06934 06957
SUB_0681E:
        ?C<A    A                                * 0681E
        GOYES   L_0682F                          * 06821
        ?B<=C   A                                * 06823
        GOYES   L_0682F                          * 06826
        C=C+D   A                                * 06828
        DAT1=C  A                                * 0682A
        RTNSC                                    * 0682D
L_0682F:
        ?ST=0   2                                * 0682F
        RTNYES                                   * 06832
        AR1EX                                    * 06834
        ABEX    A                                * 06837
        AR0EX                                    * 06839
        ?C<A    A                                * 0683C
        GOYES   L_06859                          * 0683F
        ?B<=C   A                                * 06841
        GOYES   L_06859                          * 06844
        DCEX    A                                * 06846
        CD0EX                                    * 06848
        DCEX    A                                * 0684B
        C=C+D   A                                * 0684D
        DAT1=C  A                                * 0684F
        C=D     A                                * 06852
        CD0EX                                    * 06854
        D=C     A                                * 06857
L_06859:
        AR0EX                                    * 06859
        ABEX    A                                * 0685C
        AR1EX                                    * 0685E
        RTNSC                                    * 06861

* refs (8): 06514 069A2 069D3 06A3A 06A72 08AE8 ...
SUB_06863:
        D=C     A                                * 06863
        C=ST                                     * 06865
        ST=0    2                                * 06867
        GOTO    L_06875                          * 0686A

* refs (5): 06C06 06CFD 088FF 08B14 64AAA
SUB_0686E:
        D=C     A                                * 0686E
        C=ST                                     * 06870
        ST=1    2                                * 06872
L_06875:
        D1=(5)  PADJSAVE1                        * 06875
        DAT1=C  1                                * 0687C
        C=RSTK                                   * 06880
        D1=(5)  PADJSAVE2                        * 06882
        DAT1=C  A                                * 06889
        D1=D1+  5                                * 0688C
        C=RSTK                                   * 0688F
        DAT1=C  A                                * 06891
        D1=(5)  DSKTOP                           * 06894
        C=DAT1  A                                * 0689B
        D1=C                                     * 0689E
        GOTO    L_068A8                          * 068A1
L_068A5:
        D1=D1+  5                                * 068A5
L_068A8:
        C=DAT1  A                                * 068A8
        ?C=0    A                                * 068AB
        GOYES   L_068B7                          * 068AE
        GOSUB   SUB_0681E                        * 068B0
        GOC     L_068A5                          * 068B4
L_068B7:
        D1=(5)  RSKTOP                           * 068B7
        C=DAT1  A                                * 068BE
        D1=C                                     * 068C1
L_068C4:
        D1=D1-  5                                * 068C4
        C=DAT1  A                                * 068C7
        ?C=0    A                                * 068CA
        GOYES   L_068D6                          * 068CD
        GOSUB   SUB_0681E                        * 068CF
        GOC     L_068C4                          * 068D3
L_068D6:
        D1=(5)  TEMPENV                          * 068D6
        C=DAT1  A                                * 068DD
        D1=C                                     * 068E0
        GOTO    L_06919                          * 068E3
L_068E7:
        CD0EX                                    * 068E7
        D0=D0-  10                               * 068EA
        CD0EX                                    * 068ED
        D1=D1+  10                               * 068F0
L_068F3:
        RSTK=C                                   * 068F3
        C=DAT1  A                                * 068F5
        GOSUB   SUB_0681E                        * 068F8
        D1=D1+  5                                * 068FC
        C=DAT1  A                                * 068FF
        GOSUB   SUB_0681E                        * 06902
        D1=D1+  5                                * 06906
        C=RSTK                                   * 06909
        CD0EX                                    * 0690B
        D0=D0-  10                               * 0690E
        CD0EX                                    * 06911
        ?C#0    A                                * 06914
        GOYES   L_068F3                          * 06917
L_06919:
        C=DAT1  A                                * 06919
        ?C#0    A                                * 0691C
        GOYES   L_068E7                          * 0691F
        D1=(5)  TOUCHTAB                         * 06921
        C=DAT1  A                                * 06928
        D1=C                                     * 0692B
        D1=D1+  3                                * 0692E
        GONC    L_0693B                          * 06931
L_06934:
        GOSUB   SUB_0681E                        * 06934
        D1=D1+  5                                * 06938
L_0693B:
        C=DAT1  A                                * 0693B
        ?C#0    A                                * 0693E
        GOYES   L_06934                          * 06941
        D1=(5)  VDISP                            * 06943
        P=      14                               * 0694A
        LC(2)   #35                              * 0694C
        P=C     14                               * 06950
L_06954:
        C=DAT1  A                                * 06954
        GOSUB   SUB_0681E                        * 06957
        D1=D1+  5                                * 0695B
        P=P-1                                    * 0695E
        GONC    L_06954                          * 06960
        C=C-1   S                                * 06963
        GONC    L_06954                          * 06966
        P=      0                                * 06969
        C=ST                                     * 0696B
        D1=(5)  PADJSAVE1                        * 0696D
        C=DAT1  1                                * 06974
        ST=C                                     * 06978
        D1=(5)  #808E8                           * 0697A
        C=DAT1  A                                * 06981
        RSTK=C                                   * 06984
        D1=D1-  5                                * 06986
        C=DAT1  A                                * 06989
        RSTK=C                                   * 0698C
        C=D     A                                * 0698E
        RTNCC                                    * 06990

* Delete a block below RSK A.A=end C.A=nibbles Adjusts all refs, then <REF>ADJMEM Uses A.W B.A C.W D.10 D0 D1 P
* refs (13): 088B9 088D9 0B115 0B3E7 130A5 1312A ...
MOVERSD:
        B=C     A                                * 06992
        D0=(5)  RSKTOP                           * 06994
        C=DAT0  A                                * 0699B
        BCEX    A                                * 0699E
        C=-C    A                                * 069A0
        GOSUB   SUB_06863                        * 069A2
        C=C+A   A                                * 069A6
        D1=C                                     * 069A8
        BCEX    A                                * 069AB
        C=C+D   A                                * 069AD
        D0=(5)  RSKTOP                           * 069AF
        DAT0=C  A                                * 069B6
        D0=A                                     * 069B9
        C=C-B   A                                * 069BC
        GOSUB   MOVEDOWN                         * 069BE
        GONC    ADJMEM                           * 069C2

* Delete a block above stack A.A=start C.A=nibbles Adjusts all refs, then <REF>ADJMEM Uses A.W B.A C.10 D.10 D0 D1 P
* refs (13): 03A03 04F58 04F9E 076FF 08A9E 08AB5 ...
MOVEDSU:
        D0=(5)  DSKTOP                           * 069C5
        B=A     A                                * 069CC
        A=DAT0  A                                * 069CE
        A=A+1   A                                * 069D1
        GOSUB   SUB_06863                        * 069D3
        A=A-1   A                                * 069D7
        D0=(5)  DSKTOP                           * 069D9
        A=A+C   A                                * 069E0
        DAT0=A  A                                * 069E2
        C=C+B   A                                * 069E5
        D1=C                                     * 069E7
        BCEX    A                                * 069EA
        D0=C                                     * 069EC
        A=B-A   A                                * 069EF
        C=A     A                                * 069F1
        GOSUB   MOVEUP                           * 069F3

* D= @FREETOP=<REF>ROOM / 5 Uses A.10 B.10 C.10 D.10 <REF>DIV5
* refs (13): 0243D 064B9 069C2 06A50 06A8A 0731B ...
ADJMEM:
        D0=(5)  DSKTOP                           * 069F7
        C=DAT0  A                                * 069FE
        D0=(5)  RSKTOP                           * 06A01
        A=DAT0  A                                * 06A08
        C=C-A   A                                * 06A0B
        GOSUB   DIV5                             * 06A0D
        D0=(5)  AVMEM                            * 06A11
        DAT0=C  A                                * 06A18
        RTNCC                                    * 06A1B

* Open a block above stack A.A=end C.A=nibbles Adjusts all refs, then <REF>ADJMEM Uses A.W B.A C.10 D.10 D0 D1 P
* refs (12): 03A28 04C37 04CC3 07735 0774F 087DD ...
MOVEDSD:
        D=C     A                                * 06A1D
        B=A     A                                * 06A1F
        GOSUB   ROOM                             * 06A21
        DCEX    A                                * 06A25
        A=B     A                                * 06A27
        ?D<C    A                                * 06A29
        RTNYES                                   * 06A2C
        D0=(5)  DSKTOP                           * 06A2E
        A=DAT0  A                                * 06A35
        C=-C    A                                * 06A38
        GOSUB   SUB_06863                        * 06A3A
        D0=A                                     * 06A3E
        A=A+C   A                                * 06A41
        D1=A                                     * 06A43
        B=B+C   A                                * 06A46
        A=B-A   A                                * 06A48
        C=A     A                                * 06A4A
        GOSUB   MOVEDOWN                         * 06A4C
        GONC    ADJMEM                           * 06A50

* Open a block below RSK A.A=start C.A=nibbles Adjusts all refs, then <REF>ADJMEM Uses A.W B.A C.10 D.10 D0 D1 P
* refs (11): 08BE9 0ACF1 12C67 12E2D 1300C 380C0 ...
MOVERSU:
        D=C     A                                * 06A53
        B=A     A                                * 06A55
        GOSUB   ROOM                             * 06A57
        DCEX    A                                * 06A5B
        A=B     A                                * 06A5D
        ?D<C    A                                * 06A5F
        RTNYES                                   * 06A62
        D0=(5)  RSKTOP                           * 06A64
        A=DAT0  A                                * 06A6B
        ABEX    A                                * 06A6E
        B=B+1   A                                * 06A70
        GOSUB   SUB_06863                        * 06A72
        B=B-1   A                                * 06A76
        ABEX    A                                * 06A78
        D0=A                                     * 06A7A
        C=C+A   A                                * 06A7D
        D1=C                                     * 06A7F
        A=A-B   A                                * 06A82
        C=A     A                                * 06A84
        GOSUB   MOVEUP                           * 06A86
        GOTO    ADJMEM                           * 06A8A

* C.A = C.A/5 Uses A.10 C.10 D.10 P
* refs (6): 03166 06A0D 06B00 3F549 61D69 6750C
DIV5:
        P=      10                               * 06A8E
        D=0     WP                               * 06A90
        D=C     A                                * 06A93
        C=D     WP                               * 06A95
        C=C+C   WP                               * 06A98
        C=C+D   WP                               * 06A9B
        A=C     WP                               * 06A9E
        CSL     WP                               * 06AA1
        C=C+A   WP                               * 06AA4
        CSL     WP                               * 06AA7
        C=C+A   WP                               * 06AAA
        CSL     WP                               * 06AAD
        C=C+A   WP                               * 06AB0
        CSL     WP                               * 06AB3
        C=C+A   WP                               * 06AB6
        CSL     WP                               * 06AB9
        C=C+A   WP                               * 06ABC
        C=C+D   WP                               * 06ABF
        CSR     WP                               * 06AC2
        CSR     WP                               * 06AC5
        CSR     WP                               * 06AC8
        CSR     WP                               * 06ACB
        CSR     WP                               * 06ACE
        CSR     WP                               * 06AD1
        P=      0                                * 06AD4
        RTNCC                                    * 06AD6

* Allocates C.A nibbles carry if not enough memory -> D0=bottom, D1=top of area -> B.A = C.A = @D1 = offset to previous tempob = #nibbles+6
* refs (20): 039C3 053B1 057D7 058CE 05BBB 06678 ...
CREATETEMP:
        P=      0                                * 06AD8
        C=C+CON A,6                              * 06ADA
        RTNC                                     * 06AE0
        B=C     A                                * 06AE3
        D1=(5)  DSKTOP                           * 06AE5
        C=DAT1  A                                * 06AEC
        D1=(5)  RSKTOP                           * 06AEF
        A=DAT1  A                                * 06AF6
        C=C-A   A                                * 06AF9
        C=C-B   A                                * 06AFB
        RTNC                                     * 06AFD

* refs (1): 06572
SUB_06B00:
        GOSUB   DIV5                             * 06B00
        D0=(5)  AVMEM                            * 06B04
        DAT0=C  A                                * 06B0B
        D0=(5)  TEMPTOP                          * 06B0E
        C=DAT0  A                                * 06B15
        C=C+B   A                                * 06B18
        DAT0=C  A                                * 06B1A
        A=DAT1  A                                * 06B1D
        D0=A                                     * 06B20
        A=A+B   A                                * 06B23
        DAT1=A  A                                * 06B25
        D1=A                                     * 06B28
        C=A-C   A                                * 06B2B
        GOSUB   MOVEUP                           * 06B2D
        D0=D0+  1                                * 06B31
        D1=D1-  5                                * 06B34
        C=B     A                                * 06B37
        DAT1=C  A                                * 06B39
        RTNCC                                    * 06B3C

* ob -> ob flag
* refs (2): 0B06C 5E184
FREEINTEMP?:
        CON(5)  (*)+5                            * 06B3E  primitive code object
        LC(5)   TRUE                             * 06B43
        GOTO    L_06B5A                          * 06B4A

* ob -> ob flag
* refs (5): 36188 37B49 62317 6232B 9FD0F
INTEMNOTREF?:
        CON(5)  (*)+5                            * 06B4E  primitive code object
        LC(5)   NOTREF?                          * 06B53
L_06B5A:
        R2=C.F  A                                * 06B5A
        GOSUBL  SAVPTR                           * 06B60
        A=DAT1  A                                * 06B66
        B=A     A                                * 06B69
        D0=(5)  TEMPOB                           * 06B6B
        C=DAT0  A                                * 06B72
        ?B>=C   A                                * 06B75
        GOYES   L_06B8B                          * 06B78
L_06B7A:
        GOSUBL  GETPTR                           * 06B7A
        LC(5)   FALSE                            * 06B80
        GOTO    L_0663B                          * 06B87
L_06B8B:
        D0=(5)  TEMPTOP                          * 06B8B
        C=DAT0  A                                * 06B92
        ?B>=C   A                                * 06B95
        GOYES   L_06B7A                          * 06B98
        B=B-1   A                                * 06B9A
L_06B9C:
        D0=C                                     * 06B9C
        D0=D0-  5                                * 06B9F
        A=DAT0  A                                * 06BA2
        ?A=0    A                                * 06BA5
        GOYES   L_06B7A                          * 06BA8
        C=C-A   A                                * 06BAA
        ?B#C    A                                * 06BAC
        GOYES   L_06B9C                          * 06BAF
        GOSBVL  GETPTR                           * 06BB1
        A=R2.F  A                                * 06BB8
        PC=(A)                                   * 06BBE
        RPL

* ob -> ob flag
* refs (1): 06B53
NOTREF?:
        :: REFERENCED? NOT ;                     * 06BC2
        ASSEMBLE

* refs (3): 06E50 0B101 0B88F
SUB_06BD6:
        R2=A.F  A                                * 06BD6
        D=C     A                                * 06BDC
        AD1EX                                    * 06BDE
        R1=A.F  A                                * 06BE1
        AD0EX                                    * 06BE7
        C=C+A   A                                * 06BEA
        B=C     A                                * 06BEC
        R0=C.F  A                                * 06BEE
        AD0EX                                    * 06BF4
        C=A-C   A                                * 06BF7
        AD0EX                                    * 06BF9
        D0=C                                     * 06BFC
        C=D     A                                * 06BFF
        C=-C    A                                * 06C01
        CD0EX                                    * 06C03
        GOSUBL  SUB_0686E                        * 06C06
        CD0EX                                    * 06C0C
        C=-C    A                                * 06C0F
        A=C     A                                * 06C11
        CR2EX.F A                                * 06C13
        D=C     A                                * 06C19
        D0=(5)  DSKTOP                           * 06C1B
        C=DAT0  A                                * 06C22
        C=C+A   A                                * 06C25
        R0=C.F  A                                * 06C27
        A=R1.F  A                                * 06C2D
        A=A-C   A                                * 06C33
        R3=A.F  A                                * 06C35
        D0=(5)  RSKTOP                           * 06C3B
        C=DAT0  A                                * 06C42
        A=R2.F  A                                * 06C45
        A=A+C   A                                * 06C4B
        A=A-B   A                                * 06C4D
        R4=A.F  A                                * 06C4F
        C=R2.F  A                                * 06C55
L_06C5B:
        ?D<C    A                                * 06C5B
        GOYES   L_06C62                          * 06C5E
        D=C     A                                * 06C60
L_06C62:
        C=R0.F  A                                * 06C62
        D0=C                                     * 06C68
        C=C-D   A                                * 06C6B
        R0=C.F  A                                * 06C6D
        D1=C                                     * 06C73
        C=R3.F  A                                * 06C76
        GOSUBL  MOVEDOWN                         * 06C7C
        A=B     A                                * 06C82
        D0=A                                     * 06C84
        C=R1.F  A                                * 06C87
        D1=C                                     * 06C8D
        C=D     A                                * 06C90
        GOSUBL  MOVEUP                           * 06C92
        C=B     A                                * 06C98
        CD0EX                                    * 06C9A
        B=C     A                                * 06C9D
        CD1EX                                    * 06C9F
        R1=C.F  A                                * 06CA2
        C=R4.F  A                                * 06CA8
        GOSUBL  MOVEDOWN                         * 06CAE
        C=R2.F  A                                * 06CB4
        C=C-D   A                                * 06CBA
        R2=C.F  A                                * 06CBC
        ?C#0    A                                * 06CC2
        GOYES   L_06C5B                          * 06CC5
        C=R1.F  A                                * 06CC7
        D1=C                                     * 06CCD
        C=B     A                                * 06CD0
        D0=C                                     * 06CD2
        RTN                                      * 06CD5

* refs (2): 06E70 0B841
SUB_06CD7:
        R2=A.F  A                                * 06CD7
        D=C     A                                * 06CDD
        CD0EX                                    * 06CDF
        R1=C.F  A                                * 06CE2
        AD1EX                                    * 06CE8
        R0=A.F  A                                * 06CEB
        CAEX    A                                * 06CF1
        DCEX    A                                * 06CF3
        C=C+A   A                                * 06CF5
        B=C     A                                * 06CF7
        C=D     A                                * 06CF9
        C=C-A   A                                * 06CFB
        GOSUBL  SUB_0686E                        * 06CFD
        B=A     A                                * 06D03
        A=R0.F  A                                * 06D05
        R1=A.F  A                                * 06D0B
        CD0EX                                    * 06D11
        A=C     A                                * 06D14
        CR2EX.F A                                * 06D16
        D=C     A                                * 06D1C
        D0=(5)  DSKTOP                           * 06D1E
        C=DAT0  A                                * 06D25
        C=C-A   A                                * 06D28
        A=B     A                                * 06D2A
        A=A-C   A                                * 06D2C
        R3=A.F  A                                * 06D2E
        D0=(5)  RSKTOP                           * 06D34
        C=DAT0  A                                * 06D3B
        A=R2.F  A                                * 06D3E
        A=A-C   A                                * 06D44
        A=-A    A                                * 06D46
        R0=A.F  A                                * 06D48
        C=R1.F  A                                * 06D4E
        A=A-C   A                                * 06D54
        R4=A.F  A                                * 06D56
        C=R2.F  A                                * 06D5C
L_06D62:
        ?D<C    A                                * 06D62
        GOYES   L_06D69                          * 06D65
        D=C     A                                * 06D67
L_06D69:
        C=R0.F  A                                * 06D69
        D0=C                                     * 06D6F
        C=C+D   A                                * 06D72
        R0=C.F  A                                * 06D74
        D1=C                                     * 06D7A
        C=R4.F  A                                * 06D7D
        GOSUBL  MOVEUP                           * 06D83
        A=B     A                                * 06D89
        D0=A                                     * 06D8B
        C=R1.F  A                                * 06D8E
        D1=C                                     * 06D94
        C=D     A                                * 06D97
        GOSUBL  MOVEDOWN                         * 06D99
        C=B     A                                * 06D9F
        CD0EX                                    * 06DA1
        B=C     A                                * 06DA4
        CD1EX                                    * 06DA6
        R1=C.F  A                                * 06DA9
        C=R3.F  A                                * 06DAF
        GOSUBL  MOVEUP                           * 06DB5
        C=R2.F  A                                * 06DBB
        C=C-D   A                                * 06DC1
        R2=C.F  A                                * 06DC3
        ?C#0    A                                * 06DC9
        GOYES   L_06D62                          * 06DCC
        C=B     A                                * 06DCE
        D0=C                                     * 06DD0
        C=R1.F  A                                * 06DD3
        D1=C                                     * 06DD9
        RTN                                      * 06DDC

* ob -> ob'
* refs (3): 5E193 5E19D 5E1CF
>TOPTEMP:
        CON(5)  (*)+5                            * 06DDE  primitive code object
        GOSUBL  SAVPTR                           * 06DE3
        GOSUBL  ROOM                             * 06DE9
        A=C     A                                * 06DEF
        C=0     P                                * 06DF1
        ?C#0    A                                * 06DF4
        GOYES   L_06E06                          * 06DF7
        GOSUBL  GETPTR                           * 06DF9
        GOVLNG  DOMEMERR                         * 06DFF
L_06E06:
        B=A     A                                * 06E06
        D0=(5)  INITEN                           * 06E08
        C=DAT1  S                                * 06E0F
        R4=C.F  S                                * 06E13
        C=0     S                                * 06E19
        DAT0=C  S                                * 06E1C
        C=DAT1  A                                * 06E20
        D0=C                                     * 06E23
        D=C     A                                * 06E26
        GOSBVL  SKIPOB                           * 06E28
        C=D     A                                * 06E2F
        CD0EX                                    * 06E31
        C=C-D   A                                * 06E34
        D0=D0-  1                                * 06E36
        C=C+CON A,6                              * 06E39
        RSTK=C                                   * 06E3F
        D1=(5)  TEMPENV                          * 06E41
        A=DAT1  A                                * 06E48
        D1=A                                     * 06E4B
        A=B     A                                * 06E4E
        GOSUBL  SUB_06BD6                        * 06E50
        GOSUBL  ROOM                             * 06E56
        A=C     A                                * 06E5C
        D0=(5)  TEMPTOP                          * 06E5E
        C=DAT0  A                                * 06E65
        CD1EX                                    * 06E68
        D0=C                                     * 06E6B
        C=RSTK                                   * 06E6E
        GOSUBL  SUB_06CD7                        * 06E70
        D0=(5)  INITEN                           * 06E76
        A=R4.F  S                                * 06E7D
        DAT0=A  S                                * 06E83
        GOVLNG  GETPTRLOOP                       * 06E87

* ->
* refs (136): 0F7A1 0F837 146F9 14D82 14DE6 14E22 ...
NOP:
        CON(5)  (*)+5                            * 06E8E  primitive code object
        GOTO    L_071BE                          * 06E93

* -> nob (nextob)
* refs (970): 02F56 04D96 04DA5 04DAF 04DC3 05602 ...
':
        CON(5)  (*)+5                            * 06E97  primitive code object
        C=DAT0  A                                * 06E9C
        CD0EX                                    * 06E9F
        RSTK=C                                   * 06EA2
        A=DAT0  A                                * 06EA4
        D0=(5)  PRLG                             * 06EA7
        CD0EX                                    * 06EAE
        ?C#A    A                                * 06EB1
        GOYES   L_06EC3                          * 06EB4
        GOSUBL  SKIPOB                           * 06EB6
        C=RSTK                                   * 06EBC
        A=C     A                                * 06EBE
        GONC    L_06EC9                          * 06EC0
L_06EC3:
        A=DAT0  A                                * 06EC3
        D0=D0+  5                                * 06EC6
L_06EC9:
        D=D-1   A                                * 06EC9
        GOC     L_06EDE                          * 06ECB
L_06ECE:
        D1=D1-  5                                * 06ECE
        DAT1=A  A                                * 06ED1
        A=DAT0  A                                * 06ED4
        D0=D0+  5                                * 06ED7
        PC=(A)                                   * 06EDA
L_06EDE:
        LC(5)   L_06ECE                          * 06EDE
        GOLONG  L_02D59                          * 06EE5

* -> ob
* refs (123): 14730 148CA 14A64 14B27 14C49 14C80 ...
'R:
        CON(5)  (*)+5                            * 06EEB  primitive code object
        C=B     A                                * 06EF0
        CD0EX                                    * 06EF2
        RSTK=C                                   * 06EF5
        GOSUB   SUB_06F30                        * 06EF7
        ?C#A    A                                * 06EFB
        GOYES   L_06F0C                          * 06EFE
        AD0EX                                    * 06F00
L_06F03:
        C=RSTK                                   * 06F03
        D0=C                                     * 06F05
        GOTO    L_06EC9                          * 06F08
L_06F0C:
        LC(5)   L_03130                          * 06F0C
        ?C=A    A                                * 06F13
        GOYES   L_06F1E                          * 06F16
        A=DAT0  A                                * 06F18
        GONC    L_06F03                          * 06F1B
L_06F1E:
        C=RSTK                                   * 06F1E
        D0=C                                     * 06F20
        LC(5)   NULL::                           * 06F23
        A=C     A                                * 06F2A
        PC=(A)                                   * 06F2C

* refs (2): 06EF7 06F72
SUB_06F30:
        D0=D0-  5                                * 06F30
        C=DAT0  A                                * 06F33
        RSTK=C                                   * 06F36
        D0=C                                     * 06F38
        GOSUBL  SKIPOB                           * 06F3B
        C=B     A                                * 06F41
        CD0EX                                    * 06F43
        D0=D0-  5                                * 06F46
        DAT0=C  A                                * 06F49
        C=RSTK                                   * 06F4C
        D0=C                                     * 06F4E
        A=DAT0  A                                * 06F51
        D0=A                                     * 06F54
        A=DAT0  A                                * 06F57
        D0=(5)  PRLG                             * 06F5A
        CD0EX                                    * 06F61
        RTN                                      * 06F64

* -> ?
* refs (12): 0F63D 0F7C9 0F7EC 0F80A 0FD59 3695D ...
'REVAL:
        CON(5)  (*)+5                            * 06F66  primitive code object
        C=B     A                                * 06F6B
        CD0EX                                    * 06F6D
        RSTK=C                                   * 06F70
        GOSUB   SUB_06F30                        * 06F72
        ?C#A    A                                * 06F76
        GOYES   L_06F82                          * 06F79
        AD0EX                                    * 06F7B
        GOTO    L_06F85                          * 06F7E
L_06F82:
        A=DAT0  A                                * 06F82
L_06F85:
        C=RSTK                                   * 06F85
        D0=C                                     * 06F87
        PC=(A)                                   * 06F8A

* ob ->
* refs (346): 03008 0E15A 14146 14776 14B54 14B86 ...
EVAL:
        CON(5)  (*)+5                            * 06F8E  primitive code object
        A=DAT1  A                                * 06F93
        D1=D1+  5                                * 06F96
        D=D+1   A                                * 06F99
        PC=(A)                                   * 06F9B

* :: ->
* refs (28): 0F21D 0F94F 0FE6C 14622 14CBC 14DB9 ...
>R:
        CON(5)  (*)+5                            * 06F9F  primitive code object
        A=DAT1  A                                * 06FA4
        D1=D1+  5                                * 06FA7
        LC(5)   #00005                           * 06FAA
        A=A+C   A                                * 06FB1
        GOTO    L_0717B                          * 06FB3

* ->
* refs (185): 145B5 145FA 1465E 146D6 14744 14974 ...
RDROP:
        CON(5)  (*)+5                            * 06FB7  primitive code object
L_06FBC:
        LC(5)   #00005                           * 06FBC
        B=B-C   A                                * 06FC3
        D=D+1   A                                * 06FC5
        A=DAT0  A                                * 06FC7
        D0=D0+  5                                * 06FCA
        PC=(A)                                   * 06FCD

* Evals next obj and drops rest of this stream.
* refs (438): 02F60 03003 08C3B 08C59 093FC 0BCAE ...
COLA:
        CON(5)  (*)+5                            * 06FD1  primitive code object
L_06FD6:
        A=DAT0  A                                * 06FD6
        AD0EX                                    * 06FD9
        C=DAT0  A                                * 06FDC
        D0=(5)  PRLG                             * 06FDF
        AD0EX                                    * 06FE6
        ?C#A    A                                * 06FE9
        GOYES   L_06FF7                          * 06FEC
        AD0EX                                    * 06FEE
        D0=A                                     * 06FF1
        GONC    L_06FFA                          * 06FF4
L_06FF7:
        A=DAT0  A                                * 06FF7
L_06FFA:
        ABEX    A                                * 06FFA
        AD0EX                                    * 06FFC
        D0=D0-  5                                * 06FFF
        C=DAT0  A                                * 07002
        CD0EX                                    * 07005
        BCEX    A                                * 07008
        D=D+1   A                                * 0700A
        A=C     A                                * 0700C
        PC=(A)                                   * 0700E

* -> ::
R@:
        CON(5)  (*)+5                            * 07012  primitive code object
        GOSUB   SUB_07035                        * 07017
        GOTO    L_06EC9                          * 0701B

* -> ::
* refs (2): 3EDFC 3EE29
R>:
        CON(5)  (*)+5                            * 0701F  primitive code object
        GOSUB   SUB_07035                        * 07024
        LC(5)   #00005                           * 07028
        B=B-C   A                                * 0702F
        GOTO    L_06ECE                          * 07031

* refs (2): 07017 07024
SUB_07035:
        C=B     A                                * 07035
        CD0EX                                    * 07037
        D0=D0-  5                                * 0703A
        A=DAT0  A                                * 0703D
        D0=C                                     * 07040
        GOSUBL  SAVPTR                           * 07043
        B=A     A                                * 07049
        D0=(5)  DOCOL                            * 0704B
        AD0EX                                    * 07052
        GOSUBL  SUB_03012                        * 07055
        D0=D0+  5                                * 0705B
        CD0EX                                    * 0705E
        C=C-B   A                                * 07061
        R3=C                                     * 07063
        ST=0    10                               * 07066
L_07069:
        GOSUBL  CREATETEMP                       * 07069
        GONC    L_0707F                          * 0706F
        GOSBVL  St10Gb                           * 07072
        C=R3                                     * 07079
        GONC    L_07069                          * 0707C
L_0707F:
        LC(5)   DOCOL                            * 0707F
        DAT0=C  A                                * 07086
        AD0EX                                    * 07089
        D1=A                                     * 0708C
        D1=D1+  5                                * 0708F
        D0=(5)  RSKTOP                           * 07092
        C=DAT0  A                                * 07099
        D0=C                                     * 0709C
        D0=D0-  5                                * 0709F
        C=DAT0  A                                * 070A2
        D0=C                                     * 070A5
        AR3EX                                    * 070A8
        LC(5)   #00005                           * 070AB
        C=A-C   A                                * 070B2
        GOSUBL  MOVEDOWN                         * 070B4
        A=R3                                     * 070BA
        GOLONG  GETPTR                           * 070BD

* T ob1 ob2 -> :: ob1 <ob1> <rest> ; F ob1 ob2 -> ob2 <ob1> <rest> ;
* refs (22): 04DB9 04DCD 16FB6 17568 1B009 1B0FA ...
RPITE:
        CON(5)  (*)+5                            * 070C3  primitive code object
        C=DAT1  A                                * 070C8
        RSTK=C                                   * 070CB
        D1=D1+  5                                * 070CD
        C=DAT1  A                                * 070D0
        RSTK=C                                   * 070D3
        D1=D1+  5                                * 070D5
        A=DAT1  A                                * 070D8
        D1=D1+  5                                * 070DB
        LC(5)   #00003                           * 070DE
        D=D+C   A                                * 070E5
        LC(5)   TRUE                             * 070E7
        ?C=A    A                                * 070EE
        GOYES   L_070F5                          * 070F1
        C=RSTK                                   * 070F3
L_070F5:
        C=RSTK                                   * 070F5

* refs (1): 07273
SUB_070F7:
        A=C     A                                * 070F7
        PC=(A)                                   * 070F9

* T ob -> :: ob <ob1> <rest> ; F ob -> :: <ob1> <rest> ;
* refs (3): 02F65 08C40 08CA4
RPIT:
        CON(5)  (*)+5                            * 070FD  primitive code object
        C=DAT1  A                                * 07102
        RSTK=C                                   * 07105
        D1=D1+  5                                * 07107
        D=D+1   A                                * 0710A
        A=DAT1  A                                * 0710C
        D1=D1+  5                                * 0710F
        D=D+1   A                                * 07112
        LC(5)   TRUE                             * 07114
        ?C=A    A                                * 0711B
        GOYES   L_070F5                          * 0711E
        A=DAT0  A                                * 07120
        D0=D0+  5                                * 07123
        PC=(A)                                   * 07126

* T -> :: <ob2> <rest> ; F -> :: <ob1> <rest> ;
* refs (310): 02FE0 02FF9 097CA 0B071 0B08A 0BB12 ...
?SKIP:
        CON(5)  (*)+5                            * 0712A  primitive code object
        A=DAT1  A                                * 0712F
        D1=D1+  5                                * 07132
        D=D+1   A                                * 07135
        LC(5)   TRUE                             * 07137
        ?C=A    A                                * 0713E
        GOYES   L_07152                          * 07141
        A=DAT0  A                                * 07143
        D0=D0+  5                                * 07146
        PC=(A)                                   * 07149

* Skips 1 obj in the runstream.
* refs (71): 0BC8D 0BD94 1DD8D 1DDA1 1DE3C 20BEF ...
SKIP:
        CON(5)  (*)+5                            * 0714D  primitive code object
L_07152:
        GOSUBL  SKIPOB                           * 07152
        GOTO    L_071BE                          * 07158

* Skips 2 objs in the runstream.
* refs (1): 6EFB9
2SKIP:
        CON(5)  (*)+5                            * 0715C  primitive code object
        GOSUBL  SKIPOB                           * 07161
        GOTO    L_07152                          * 07167

* ->
IDUP:
        CON(5)  (*)+5                            * 0716B  primitive code object
L_07170:
        AD0EX                                    * 07170
        D0=A                                     * 07173
        D=D-1   A                                * 07176
        GOC     L_07195                          * 07178
L_0717B:
        C=B     A                                * 0717B
        CD0EX                                    * 0717D
        DAT0=A  A                                * 07180
        D0=D0+  5                                * 07183
        CD0EX                                    * 07186
        B=C     A                                * 07189
        A=DAT0  A                                * 0718B
        D0=D0+  5                                * 0718E
        PC=(A)                                   * 07191
L_07195:
        LC(5)   L_0717B                          * 07195
        GOLONG  L_02D59                          * 0719C

* ->
* refs (261): 08E24 08FD5 0980E 09854 0B157 0B69C ...
BEGIN:
        CON(5)  (*)+5                            * 071A2  primitive code object
        GOTO    L_07170                          * 071A7

* ->
* refs (40): 34F39 385DE 576AD 57A98 57E67 58077 ...
AGAIN:
        CON(5)  (*)+5                            * 071AB  primitive code object
L_071B0:
        C=B     A                                * 071B0
* a branch also enters #071B4, where the nibbles decode as GOTO #07636
L_071B2:
        CD0EX                                    * 071B2
* the rest of GOTO #07636 at #071B4
* a branch also enters #071B5, where the nibbles decode as D0=D0- 5
        NIBHEX  184                              * 071B5  ā
        A=DAT0  A                                * 071B8
        D0=A                                     * 071BB
L_071BE:
        A=DAT0  A                                * 071BE
        D0=D0+  5                                * 071C1
        PC=(A)                                   * 071C4

* flag ->
* refs (97): 09895 098AE 0B16B 0B6B0 0DDB7 101F3 ...
UNTIL:
        CON(5)  (*)+5                            * 071C8  primitive code object
        A=DAT1  A                                * 071CD
        D1=D1+  5                                * 071D0
        D=D+1   A                                * 071D3
        LC(5)   FALSE                            * 071D5
        ?C=A    A                                * 071DC
        GOYES   L_071B0                          * 071DF
        GOTO    L_06FBC                          * 071E1

* ->
* refs (106): 08E4C 09011 0B70A 0C898 0C8D4 10365 ...
REPEAT:
        CON(5)  (*)+5                            * 071E5  primitive code object
        GOTO    L_071B0                          * 071EA

* flag ->
* refs (92): 08E2E 08FE4 0C884 0C8B1 10338 1048C ...
WHILE:
        CON(5)  (*)+5                            * 071EE  primitive code object
        A=DAT1  A                                * 071F3
        D1=D1+  5                                * 071F6
        D=D+1   A                                * 071F9
        LC(5)   FALSE                            * 071FB
        ?C=A    A                                * 07202
        GOYES   L_07211                          * 07205
        A=DAT0  A                                * 07207
        D0=D0+  5                                * 0720A
        PC=(A)                                   * 0720D
L_07211:
        GOSUBL  SKIPOB                           * 07211
        GOSUBL  SKIPOB                           * 07217
        GOTO    L_06FBC                          * 0721D

* -> #
* refs (273): 10C7C 10C90 153E8 1545F 1D0B5 2C405 ...
INDEX@:
        CON(5)  (*)+5                            * 07221  primitive code object
        GOSUB   SUB_072D7                        * 07226
L_0722A:
        C=DAT0  A                                * 0722A
        D0=A                                     * 0722D
        R0=C                                     * 07230
        GOSUBL  SAVPTR                           * 07233
        GOSUBL  PUSH#                            * 07239
        A=DAT0  A                                * 0723F
        D0=D0+  5                                * 07242
        PC=(A)                                   * 07245

* -> #
* refs (42): 20E5C 39D7E 41AF1 4BB9D 4BBDE 51834 ...
ISTOP@:
        CON(5)  (*)+5                            * 07249  primitive code object
        GOSUB   SUB_072D7                        * 0724E
L_07252:
        D0=D0+  5                                * 07252
        GONC    L_0722A                          * 07255  always taken

* -> #
* refs (15): 36557 41C6B 7D166 7D22E 8DAF6 9352B ...
JINDEX@:
        CON(5)  (*)+5                            * 07258  primitive code object
        GOSUB   SUB_072EC                        * 0725D
        GONC    L_0722A                          * 07261

* -> #
JSTOP@:
        ?C=A    B                                * 07264
        GOYES   L_0726D+1                        * 07267
        GOSUB   SUB_072EC                        * 07269
* a branch also enters #0726E, where the nibbles decode as GOC #072CD
L_0726D:
        GONC    L_07252                          * 0726D

* # ->
* refs (1): CB810
* the rest of GOC #072CD at #0726E
* a branch also enters #07270, where the nibbles decode as GONC #07298
INDEXSTO:
        NIBHEX  5                                * 07270
* the rest of GONC #07298 at #07270
        NIBHEX  72                               * 07271  '
        GOSUB   SUB_070F7                        * 07273
        GOTO    L_071B2+2                        * 07277
        NIBHEX  1007550                          * 0727B  .pU
L_07282:
        C=R0                                     * 07282
        DAT0=C  A                                * 07285
        D0=A                                     * 07288
        A=DAT0  A                                * 0728B
        D0=D0+  5                                * 0728E
        PC=(A)                                   * 07291

* # ->
* refs (12): 53424 64019 68C3D 68CA6 68CD8 6EED3 ...
ISTOPSTO:
        CON(5)  (*)+5                            * 07295  primitive code object
        GOSUBL  POP#                             * 0729A
        R0=A                                     * 072A0
        GOSUB   SUB_072D7                        * 072A3
L_072A7:
        D0=D0+  5                                * 072A7
        GONC    L_07282                          * 072AA

* # ->
JINDEXSTO:
        P=      11                               * 072AD
        P=      7                                * 072AF
        CLRST                                    * 072B1
        C=C-B   A                                * 072B3
        ?HST=0  15                               * 072B5
* a branch also enters #072B9, where the nibbles decode as RTNSXM
L_072B8:
        GOYES   L_072B8+1                        * 072B8
* the rest of RTNSXM at #072B9
* a branch also enters #072BA, where the nibbles decode as C=RSTK
        NIBHEX  0                                * 072BA
* the rest of C=RSTK at #072BA
        NIBHEX  7                                * 072BB
        C=0     A                                * 072BC
        SETDEC                                   * 072BE
        P=      12                               * 072C0

* # ->
JSTOPSTO:
        GOSUB   SUB_079F2                        * 072C2
        CLRST                                    * 072C6
        A=A+1   A                                * 072C8
        NIBHEX  73F                              * 072CA  7
        R0=A                                     * 072CD
        GOSUB   SUB_072EC                        * 072D0
        GONC    L_072A7                          * 072D4

* refs (6): 07226 0724E 072A3 07326 07339 073B3
SUB_072D7:
        AD0EX                                    * 072D7
        D0=(5)  DOLPENV                          * 072DA
        C=DAT0  A                                * 072E1
        D0=C                                     * 072E4
        D0=D0+  10                               * 072E7
        RTN                                      * 072EA

* refs (3): 0725D 07269 072D0
SUB_072EC:
        AD0EX                                    * 072EC
        D0=(5)  DOLPENV                          * 072EF
        C=DAT0  A                                * 072F6
        D0=C                                     * 072F9
        D0=D0+  15                               * 072FC
        D0=D0+  10                               * 072FF
        RTN                                      * 07302

* refs (4): 07397 07489 074C5 07558
SUB_07304:
        D0=(5)  DSKTOP                           * 07304
L_0730B:
        A=DAT0  A                                * 0730B
        A=A+C   A                                * 0730E
        DAT0=A  A                                * 07310
        D0=D0+  5                                * 07313
        P=P-1                                    * 07316
        GONC    L_0730B                          * 07318
        GOLONG  ADJMEM                           * 0731B

* ->
STOPLOOP:
        CON(5)  (*)+5                            * 07321  primitive code object
        GOSUB   SUB_072D7                        * 07326
        D0=D0+  5                                * 0732A
        R0=A                                     * 0732D
        GOTO    L_07360                          * 07330

* ->
* refs (284): 02232 0B68D 12BA8 152E6 15478 178AB ...
LOOP:
        CON(5)  (*)+5                            * 07334  primitive code object
L_07339:
        GOSUB   SUB_072D7                        * 07339
        C=DAT0  A                                * 0733D
        R0=A                                     * 07340
        C=C+1   A                                * 07343
L_07345:
        D0=D0+  5                                * 07345
        A=DAT0  A                                * 07348
        ?C>=A   A                                * 0734B
        GOYES   L_07360                          * 0734E
        D0=D0-  5                                * 07350
        DAT0=C  A                                * 07353
        A=R0                                     * 07356
        D0=A                                     * 07359
        GOTO    L_071B0                          * 0735C
L_07360:
        D0=D0-  15                               * 07360
        C=DAT0  A                                * 07363
        C=C-1   A                                * 07366
        DAT0=C  A                                * 07368
        D0=D0+  5                                * 0736B
        A=R0                                     * 0736E
        AD0EX                                    * 07371
        GOSUBL  SAVPTR                           * 07374
        CD1EX                                    * 0737A
        C=A-C   A                                * 0737D
        D0=A                                     * 0737F
        D1=A                                     * 07382
        D1=D1+  15                               * 07385
        GOSUBL  MOVEUP                           * 07388
        LC(5)   #0000F                           * 0738E
        P=      3                                * 07395
        GOSUB   SUB_07304                        * 07397
        GOSUBL  GETPTR                           * 0739B
        GOTO    L_06FBC                          * 073A1

* # ->
* refs (9): 36598 369C1 369D5 39C52 45439 45632 ...
+LOOP:
        CON(5)  (*)+5                            * 073A5  primitive code object
        GOSUBL  POP#                             * 073AA
        R0=A                                     * 073B0
        GOSUB   SUB_072D7                        * 073B3
        C=DAT0  A                                * 073B7
        AR0EX                                    * 073BA
        C=C+A   A                                * 073BD
        GOTO    L_07345                          * 073BF

* #stop ->
* refs (145): 02219 12B9E 1871A 1F3BD 1F48E 21010 ...
ZERO_DO:
        CON(5)  (*)+5                            * 073C3  primitive code object
        A=0     A                                * 073C8
        GOTO    L_07402                          * 073CA

* #stop ->
* refs (61): 152D7 153E3 2D951 3A0FD 3A23D 3A681 ...
ONE_DO:
        CON(5)  (*)+5                            * 073CE  primitive code object
        A=0     A                                * 073D3
        A=A+1   A                                * 073D5
        GOTO    L_07402                          * 073D7

* #stop ->
* refs (82): 20E46 2C3EC 2C643 2DC57 35E6D 36548 ...
#1+_ONE_DO:
        CON(5)  (*)+5                            * 073DB  primitive code object
        GOSBVL  POP#                             * 073E0
        A=A+1   A                                * 073E7
        R3=A                                     * 073E9
        A=0     A                                * 073EC
        A=A+1   A                                * 073EE
        R2=A                                     * 073F0
        GOTO    L_0740E                          * 073F3

* #stop #start ->
* refs (85): 0B66A 17874 36994 3A06C 3A4E7 3F5C5 ...
DO:
        CON(5)  (*)+5                            * 073F7  primitive code object
        GOSUBL  POP#                             * 073FC
L_07402:
        R2=A                                     * 07402
        GOSUBL  POP#                             * 07405
        R3=A                                     * 0740B
L_0740E:
        GOSUBL  SAVPTR                           * 0740E
        ST=0    10                               * 07414
L_07417:
        GOSUBL  ROOM                             * 07417
        D=C     A                                * 0741D
        LC(5)   #0000F                           * 0741F
        ?D>=C   A                                * 07426
        GOYES   L_07435                          * 07429
        GOSBVL  St10Gb                           * 0742B
        GONC    L_07417                          * 07432
L_07435:
        D0=(5)  DOLPENV                          * 07435
        A=DAT0  A                                * 0743C
        D0=(5)  DSKTOP                           * 0743F
        C=DAT0  A                                * 07446
        D0=C                                     * 07449
        D1=C                                     * 0744C
        D1=D1-  15                               * 0744F
        C=A-C   A                                * 07452
        P=      4                                * 07454
        C+P+1                                    * 07456
        GOSUBL  MOVEDOWN                         * 07459
        D1=D1+  5                                * 0745F
        A=R2                                     * 07462
        DAT1=A  A                                * 07465
        D1=D1+  5                                * 07468
        A=R3                                     * 0746B
        DAT1=A  A                                * 0746E
        D1=D1-  15                               * 07471
        A=0     M                                * 07474
        A=DAT1  A                                * 07477
        A=A+1   A                                * 0747A
        DAT1=A  10                               * 0747C
        LC(5)   #FFFF1                           * 07480
        P=      3                                * 07487
        GOSUB   SUB_07304                        * 07489
        GOSUBL  GETPTR                           * 0748D
        GOTO    L_07170                          * 07493

* ->
* refs (305): 0E4D4 0F8EB 0FA2B 14465 14CE4 14E63 ...
ABND:
        CON(5)  (*)+5                            * 07497  primitive code object
        GOSUBL  SAVPTR                           * 0749C
        D0=(5)  TEMPENV                          * 074A2
        A=DAT0  A                                * 074A9
        D0=A                                     * 074AC
        C=DAT0  A                                * 074AF
        D=C     A                                * 074B2
        C=C+A   A                                * 074B4
        CD1EX                                    * 074B6
        C=A-C   A                                * 074B9
        GOSUBL  MOVEUP                           * 074BB
        C=D     A                                * 074C1
        P=      2                                * 074C3
        GOSUB   SUB_07304                        * 074C5
        GOVLNG  GETPTRLOOP                       * 074C9
        RPL

* obn..ob1 {lamn..lam1} ->
* refs (169): 0E491 0F88C 0F977 143B1 155FE 19A1B ...
BIND:
        :: INNERCOMP DOBIND ;                    * 074D0

* obn..ob1 lamn..lam1 #n ->
* refs (13): 074DA 23452 234E4 23ECA 28B69 4B94F ...
DOBIND:
        CON(5)  (*)+5                            * 074E4  primitive code object
        ASSEMBLE
        A=0     M                                * 074E9
        GOSUBL  POP#                             * 074EC
        GOSUBL  SAVPTR                           * 074F2
        R0=A                                     * 074F8
        A=A+1   A                                * 074FB
        A=A+A   A                                * 074FD
        B=A     A                                * 074FF
        A=A+A   A                                * 07501
        A=A+A   A                                * 07503
        A=A+B   A                                * 07505
        R1=A                                     * 07507
        ST=0    10                               * 0750A
L_0750D:
        GOSUBL  ROOM                             * 0750D
        A=R1                                     * 07513
        ?C>=A   A                                * 07516
        GOYES   L_07525                          * 07519
        GOSBVL  St10Gb                           * 0751B
        GONC    L_0750D                          * 07522
L_07525:
        B=A     A                                * 07525
        D0=(5)  TEMPENV                          * 07527
        C=DAT0  A                                * 0752E
        D0=(5)  DSKTOP                           * 07531
        A=DAT0  A                                * 07538
        D0=A                                     * 0753B
        C=C-A   A                                * 0753E
        A=A-B   A                                * 07540
        D1=A                                     * 07542
        B=A     A                                * 07545
        GOSUBL  MOVEDOWN                         * 07547
        C=R1                                     * 0754D
        DAT1=C  10                               * 07550
        C=-C    A                                * 07554
        P=      2                                * 07556
        GOSUB   SUB_07304                        * 07558
        A=B     A                                * 0755C
        D0=A                                     * 0755E
        AD1EX                                    * 07561
        D1=A                                     * 07564
        GOSUB   SUB_0758C                        * 07567
        D1=A                                     * 0756B
        D1=D1+  5                                * 0756E
        GOSUB   SUB_0758C                        * 07571
        AD0EX                                    * 07575
        GOSUBL  GETPTR                           * 07578
        D1=A                                     * 0757E
        C=R0                                     * 07581
        C=C+C   A                                * 07584
        D=D+C   A                                * 07586
        GOTO    L_071BE                          * 07588

* refs (2): 07567 07571
SUB_0758C:
        C=R0                                     * 0758C
        B=C     A                                * 0758F
L_07591:
        B=B-1   A                                * 07591
        RTNC                                     * 07593
        C=DAT0  A                                * 07596
        D0=D0+  5                                * 07599
        D1=D1+  10                               * 0759C
        DAT1=C  A                                * 0759F
        GONC    L_07591                          * 075A2  always taken

* #n -> ob
* refs (52): 456EF 46964 47222 4724F 477BD 47D42 ...
GETLAM:
        CON(5)  (*)+5                            * 075A5  primitive code object
        C=DAT1  A                                * 075AA
        CD1EX                                    * 075AD
        RSTK=C                                   * 075B0
        D1=D1+  5                                * 075B2
        A=DAT1  A                                * 075B5
        A=A+A   A                                * 075B8
        C=A     A                                * 075BA
        A=A+A   A                                * 075BC
        A=A+A   A                                * 075BE
        A=A+C   A                                * 075C0
        D1=(5)  TEMPENV                          * 075C2
        C=DAT1  A                                * 075C9
        C=C+A   A                                * 075CC
        D1=C                                     * 075CE
        D1=D1+  5                                * 075D1
        A=DAT1  A                                * 075D4
        C=RSTK                                   * 075D7
        D1=C                                     * 075D9
        DAT1=A  A                                * 075DC
        A=DAT0  A                                * 075DF
        D0=D0+  5                                * 075E2
        PC=(A)                                   * 075E5

* ob #n ->
* refs (48): 45BD4 46396 463AA 468FB 476EC 4777C ...
PUTLAM:
        CON(5)  (*)+5                            * 075E9  primitive code object
        C=DAT1  A                                * 075EE
        CD1EX                                    * 075F1
        RSTK=C                                   * 075F4
        D1=D1+  5                                * 075F6
        A=DAT1  A                                * 075F9
        D1=C                                     * 075FC
        D1=D1+  5                                * 075FF
        C=DAT1  A                                * 07602
        RSTK=C                                   * 07605
        A=A+A   A                                * 07607
        C=A     A                                * 07609
        A=A+A   A                                * 0760B
        A=A+A   A                                * 0760D
        A=A+C   A                                * 0760F
        D1=(5)  TEMPENV                          * 07611
        C=DAT1  A                                * 07618
        C=C+A   A                                * 0761B
        D1=C                                     * 0761D
        D1=D1+  5                                * 07620
        C=RSTK                                   * 07623
        DAT1=C  A                                * 07625
        C=RSTK                                   * 07628
        D1=C                                     * 0762A
        D1=D1+  10                               * 0762D
        D=D+1   A                                * 07630
        D=D+1   A                                * 07632
* a branch also enters #07636, where the nibbles decode as ?B<=C A
        GOTO    L_071BE                          * 07634

* #libnum hxs ->
* the rest of ?B<=C A at #07636
SETHASH:
        NIBHEX  D36                              * 07638  =
* a branch also enters #0763D, where the nibbles decode as A=DAT1 A
        GOSUB   SUB_07A4F                        * 0763B
* the rest of A=DAT1 A at #0763D
* a branch also enters #0763F, where the nibbles decode as LC(2) #47
        NIBHEX  3                                * 0763F
* the rest of LC(2) #47 at #0763F
        NIBHEX  174                              * 07640  q
        D=D+1   A                                * 07643
        R3=A                                     * 07645
        ST=0    11                               * 07648
        GONC    SET                              * 0764B

* [$] #libnum ->
SETMESG:
        LC(6)   #341076                          * 0764E
        D1=D1+  5                                * 07656
        D=D+1   A                                * 07659
        R3=A                                     * 0765B
        ST=1    11                               * 0765E

* refs (1): 0764B
SET:
        GOVLNG  L_70E0C                          * 07661
L_07668:
        C=DAT0  A                                * 07668
        ?C#A    X                                * 0766B
        GOYES   L_07690                          * 0766E
        C=R3                                     * 07670
        ?ST=1   11                               * 07673
        GOYES   L_07684                          * 07676
        D0=D0+  3                                * 07678
        DAT0=C  A                                * 0767B
        D0=D0+  10                               * 0767E
        GONC    L_07698                          * 07681
L_07684:
        D0=D0+  8                                * 07684
        DAT0=C  A                                * 07687
        D0=D0+  5                                * 0768A
        GONC    L_07698                          * 0768D
L_07690:
        ?C>A    X                                * 07690
        GOYES   L_0769E                          * 07693
        D0=D0+  13                               * 07695
L_07698:
        B=B-1   X                                * 07698
* a branch also enters #0769C, where the nibbles decode as A=A-1 A
        GONC    L_07668                          * 0769B
L_0769E:
        GOSUBL  GETPTR                           * 0769E
        A=DAT0  A                                * 076A4
        D0=D0+  5                                * 076A7
        PC=(A)                                   * 076AA

* # ->
* refs (1): 21CFE
OFFSRRP:
        CON(5)  (*)+5                            * 076AE  primitive code object
        GOSUB   SUB_077B2                        * 076B3
        D=0     A                                * 076B7
        GONC    L_076DC                          * 076B9
L_076BC:
        C=DAT0  A                                * 076BC
        ?C#A    X                                * 076BF
        GOYES   L_076D4                          * 076C2
        ?D#0    A                                * 076C4
        GOYES   L_076D2                          * 076C7
        CD0EX                                    * 076C9
        R0=C                                     * 076CC
        CD0EX                                    * 076CF
L_076D2:
        D=D+1   A                                * 076D2
L_076D4:
        ?C>A    X                                * 076D4
        GOYES   L_076E2                          * 076D7
        D0=D0+  13                               * 076D9
L_076DC:
        B=B-1   X                                * 076DC
        GONC    L_076BC                          * 076DF
L_076E2:
        ?D=0    A                                * 076E2
        GOYES   L_0769E                          * 076E5
        D1=D1+  5                                * 076E7
        C=DAT1  A                                * 076EA
        C=C-D   A                                * 076ED
        DAT1=C  A                                * 076EF
        C=D     A                                * 076F2
        D=D+D   A                                * 076F4
        D=D+C   A                                * 076F6
        CSL     A                                * 076F8
        C=C-D   A                                * 076FA
        A=R0                                     * 076FC
        GOSUBL  MOVEDSU                          * 076FF
        GOTO    L_0769E                          * 07705

* # ->
* refs (5): 18A0B 21CA1 268CC C081B E387D
TOSRRP:
        CON(5)  (*)+5                            * 07709  primitive code object
        GOSUB   SUB_077B2                        * 0770E
        GOVLNG  L_71014                          * 07712
L_07719:
        B=B-1   X                                * 07719
        GOC     L_0772D                          * 0771C
        C=DAT1  A                                * 0771F
        ?C>=A   X                                * 07722
        GOYES   L_0772D                          * 07725
        D1=D1+  13                               * 07727
        GONC    L_07719                          * 0772A
L_0772D:
        AD1EX                                    * 0772D
        C=0     A                                * 07730
        LC(1)   #D                               * 07732
        GOSUBL  MOVEDSD                          * 07735
        GONC    L_0775E                          * 0773B
        R2=A                                     * 0773E
        GOSUBL  GARBAGECOL                       * 07741  inline data follows
        A=R2                                     * 07747
        C=0     A                                * 0774A
        LC(1)   #D                               * 0774C
        GOSUBL  MOVEDSD                          * 0774F
        GONC    L_0775E                          * 07755
        GOLONG  L_08755                          * 07758
L_0775E:
        A=R3                                     * 0775E
        D0=A                                     * 07761
        A=B     A                                * 07764
        D1=A                                     * 07766
        C=DAT0  13                               * 07769
        DAT1=C  13                               * 0776D
        D1=(5)  USEROB                           * 07771
        C=DAT1  A                                * 07778
        D1=C                                     * 0777B
        D1=D1+  5                                * 0777E
        C=DAT1  A                                * 07781
        C=C+1   A                                * 07784
        DAT1=C  A                                * 07786
        GOTO    L_0769E                          * 07789

* # -> flag
* refs (1): 21C92
ONSRRP?:
        CON(5)  (*)+5                            * 0778D  primitive code object
        GOSUB   SUB_077B2                        * 07792
        GONC    L_077A4                          * 07796
L_07799:
        C=DAT0  A                                * 07799
        ?C=A    X                                * 0779C
        GOYES   L_077AE                          * 0779F
        D0=D0+  13                               * 077A1
L_077A4:
        B=B-1   X                                * 077A4
        GONC    L_07799                          * 077A7
        GOTO    L_07C6F                          * 077AA
L_077AE:
        GOTO    L_07C24                          * 077AE

* refs (4): 076B3 0770E 07792 70E57
SUB_077B2:
        GOSUBL  POP#                             * 077B2
        GOSUBL  SAVPTR                           * 077B8
        D0=(5)  USEROB                           * 077BE
        C=DAT0  A                                * 077C5
        D0=C                                     * 077C8
        D1=C                                     * 077CB
        D0=D0+  5                                * 077CE
        C=DAT0  A                                * 077D1
        B=C     A                                * 077D4
        D0=D0+  3                                * 077D6
        LC(3)   #7FF                             * 077D9
        A=A&C   X                                * 077DE
        RTNCC                                    * 077E2

* #libnum -> rrp
* refs (1): 08E01
MAKERRP:
        CON(5)  (*)+5                            * 077E4  primitive code object
        GOSUB   SUB_07BF9                        * 077E9
        R2=A                                     * 077ED
* a branch also enters #077F3, where the nibbles decode as RTNSXM
        LC(5)   #0000D                           * 077F0
        GOSUBL  GETTEMP                          * 077F7
        LC(5)   DORRP                            * 077FD
        DAT0=C  A                                * 07804
        D0=D0+  5                                * 07807
        A=R2                                     * 0780A
        DAT0=A  A                                * 0780D
        D0=D0+  3                                * 07810
        A=0     A                                * 07813
        DAT0=A  A                                * 07815
        D0=D0-  8                                * 07818
        AD0EX                                    * 0781B
        GOSUBL  GETPTR                           * 0781E
        DAT1=A  A                                * 07824
        A=DAT0  A                                * 07827
        D0=D0+  5                                * 0782A
        PC=(A)                                   * 0782D

* refs (4): 078B1 07DD9 07E3C 08F61
SUB_07831:
        A=DAT0  B                                * 07831
        C=DAT1  B                                * 07834
        ?C#A    B                                * 07837
        RTNYES                                   * 0783A
        D0=D0+  2                                * 0783C
        D1=D1+  2                                * 0783F
        C=0     XS                               * 07842
        C=C+C   X                                * 07845
        P=C     0                                * 07848
        CSR     X                                * 0784C
        B=C     B                                * 0784F
L_07852:
        B=B-1   B                                * 07852
        GOC     L_0786F                          * 07855
        A=DAT0  W                                * 07858
        C=DAT1  W                                * 0785C
        D0=D0+  16                               * 07860
        D1=D1+  16                               * 07863
        ?C=A    W                                * 07866
        GOYES   L_07852                          * 07869
L_0786B:
        P=      0                                * 0786B
        RTNSC                                    * 0786D
L_0786F:
        P=P-1                                    * 0786F
        GOC     L_0788A                          * 07871
        A=DAT0  WP                               * 07874
        C=DAT1  WP                               * 07878

* refs (1): 078F8
* a branch also enters #0787D, where the nibbles decode as D0=D0+ 13
SUB_0787C:
        ?C#A    WP                               * 0787C
        GOYES   L_0786B                          * 0787F
        CD0EX                                    * 07881
        C+P+1                                    * 07884
        D0=C                                     * 07887
L_0788A:
        P=      0                                * 0788A
        RTNCC                                    * 0788C

* refs (2): 079BF 07C1D
SUB_0788E:
        A=R1                                     * 0788E
        GOSUBL  SUB_08503                        * 07891
        A=DAT0  A                                * 07897
        A=-A    A                                * 0789A
L_0789C:
        ?A=0    A                                * 0789C
        RTNYES                                   * 0789F
        CD0EX                                    * 078A1

D01<>WP:
        C=C-A   A                                * 078A4
        D0=C                                     * 078A6
        D=C     A                                * 078A9
        C=R0                                     * 078AB
        D1=C                                     * 078AE
        GOSUB   SUB_07831                        * 078B1
        C=D     A                                * 078B5
        D0=C                                     * 078B7
        GOC     GrclR01A                         * 078BA
        GOLONG  SUB_08400                        * 078BD

* refs (1): 078BA
GrclR01A:
        D0=D0-  5                                * 078C3
        A=DAT0  A                                * 078C6
        GONC    L_0789C                          * 078C9

* refs (2): 079CC 07C68
SUB_078CC:
        A=R1                                     * 078CC
        D0=(5)  STOPSIGN                         * 078CF
        C=DAT0  A                                * 078D6
        ?C=A    A                                * 078D9
        RTNYES                                   * 078DC
        GOSUBL  GETRRP                           * 078DE
        R1=A                                     * 078E4
        RTN                                      * 078E7

* lam -> ob T -> F
* refs (3): 3F260 54760 609F5
FIRST@LAM:
        CON(5)  (*)+5                            * 078E9  primitive code object
        A=0     A                                * 078EE
        A=A+1   A                                * 078F0
        GONC    L_078FF+2                        * 078F2

* lam #n -> ob T -> F
NTH@LAM:
        B=A     W                                * 078F5
        GOSUB   SUB_0787C                        * 078F8
        C=DAT0  A                                * 078FC
* a branch also enters #07901, where the nibbles decode as R2=A.F A
L_078FF:
        GOTO    L_07A7E+2                        * 078FF
* the rest of R2=A.F A at #07901
        NIBHEX  AF02                             * 07903  ú 
        ST=1    0                                * 07907
        GOTO    L_0794B                          * 0790A
L_0790E:
        GOSUBL  SAVPTR                           * 0790E
        C=DAT1  A                                * 07914
        P=      4                                * 07917
        C+P+1                                    * 07919
        P=      0                                * 0791C
        R0=C                                     * 0791E
        D0=(5)  CONTEXT                          * 07921
        C=DAT0  A                                * 07928
        R1=C                                     * 0792B
        GOTO    L_07C1D                          * 0792E
        BSS     17                               * 07932

* -> -> F
* refs (18): 2623E 27F12 459B0 45B30 45B5F 5E60C ...
undo:
        CON(5)  (*)+5                            * 07943  primitive code object
        ST=0    0                                * 07948
L_0794B:
        GOSUBL  SAVPTR                           * 0794B
        C=DAT1  A                                * 07951
        D1=C                                     * 07954
        A=DAT1  A                                * 07957
        D1=D1+  5                                * 0795A
        CD1EX                                    * 0795D
        R0=C                                     * 07960
        ?ST=0   0                                * 07963
        GOYES   L_079A4                          * 07966
        A=R2.F  A                                * 07968
        B=A     A                                * 0796E
        GOSUB   SUB_07DF3                        * 07970
        GONC    L_079AB                          * 07974
        GOTO    L_079D3                          * 07977

* ob -> -> F ->
* refs (22): 02FDB 08C2C 14410 14498 14542 1507A ...
DRPExitAtLOOP:
        CON(5)  (*)+5                            * 0797B  primitive code object
        GOSUBL  SAVPTR                           * 07980
        C=DAT1  A                                * 07986
        D1=C                                     * 07989
        A=DAT1  A                                * 0798C
        D1=D1+  5                                * 0798F
        CD1EX                                    * 07992
        R0=C                                     * 07995
        LC(5)   DOIDNT                           * 07998
        ?C=A    A                                * 0799F
        GOYES   L_079B2                          * 079A2
L_079A4:
        GOSUB   LrclR0A                          * 079A4
        GOC     L_079D3                          * 079A8
L_079AB:
        A=DAT0  A                                * 079AB
L_079AE:
        GOTO    L_08060                          * 079AE
L_079B2:
        D0=(5)  CONTEXT                          * 079B2
        A=DAT0  A                                * 079B9
        R1=A                                     * 079BC
L_079BF:
        GOSUB   SUB_0788E                        * 079BF
        GOC     L_079CC                          * 079C3
        AD0EX                                    * 079C6
        GONC    L_079AE                          * 079C9
L_079CC:
        GOSUB   SUB_078CC                        * 079CC
        GONC    L_079BF                          * 079D0
L_079D3:
        GOTO    L_07EBE                          * 079D3

* refs (2): 08C4F 08C81
OBJ_079D7:
        CON(5)  (*)+5                            * 079D7  primitive code object
        C=DAT1  A                                * 079DC
        CD1EX                                    * 079DF
        A=DAT1  A                                * 079E2
        D1=C                                     * 079E5
        LC(5)   DORRP                            * 079E8
        ?C#A    A                                * 079EF

* refs (1): 072C2
* a branch also enters #079F2, where the nibbles decode as B=B+C M
SUB_079F2:
        GOYES   L_07A4C                          * 079F2
* the rest of B=B+C M at #079F2
* a branch also enters #079F4, where the nibbles decode as A=DAT1 A
        NIBHEX  1                                * 079F4
* the rest of A=DAT1 A at #079F4
        NIBHEX  43                               * 079F5  4
        GOSUBL  SAVPTR                           * 079F7
        B=A     A                                * 079FD
        D0=A                                     * 079FF
        GOSUBL  SKIPOB                           * 07A02
        CD0EX                                    * 07A08
        D1=(5)  USEROB                           * 07A0B
        D0=(5)  CONTEXT                          * 07A12
        A=DAT0  A                                * 07A19
        ?A<B    A                                * 07A1C
        GOYES   L_07A2C                          * 07A1F
        ?C<=A   A                                * 07A21
        GOYES   L_07A2C                          * 07A24
        A=DAT1  A                                * 07A26
        DAT0=A  A                                * 07A29
L_07A2C:
        D0=(5)  STOPSIGN                         * 07A2C
        A=DAT0  A                                * 07A33
        ?A<B    A                                * 07A36
        GOYES   L_07A46                          * 07A39
        ?C<=A   A                                * 07A3B
        GOYES   L_07A46                          * 07A3E
        A=DAT1  A                                * 07A40
        DAT0=A  A                                * 07A43
L_07A46:
        GOSUBL  GETPTR                           * 07A46
L_07A4C:
        A=DAT0  A                                * 07A4C

* refs (1): 0763B
SUB_07A4F:
        D0=D0+  5                                * 07A4F
        PC=(A)                                   * 07A52

* refs (2): 07C61 07CBC
SUB_07A56:
        A=R0                                     * 07A56
        D1=A                                     * 07A59
        C=0     A                                * 07A5C
        A=DAT1  B                                * 07A5E
        ?A=0    B                                * 07A61
        RTNYES                                   * 07A64
        LC(2)   #10                              * 07A66
        ?C<=A   B                                * 07A6A
        GOYES   L_07A72                          * 07A6D
        C=A     B                                * 07A6F
L_07A72:
        RSTK=C                                   * 07A72
        D1=D1+  2                                * 07A74
        C=DAT1  W                                * 07A77
        D=C     W                                * 07A7B
* a branch also enters #07A80, where the nibbles decode as BSL A
L_07A7E:
        D1=D1+  16                               * 07A7E
* the rest of BSL A at #07A80
* a branch also enters #07A81, where the nibbles decode as C=DAT1 W
        NIBHEX  1                                * 07A81
* the rest of C=DAT1 W at #07A81
        NIBHEX  577                              * 07A82  u
        B=C     W                                * 07A85
        ST=0    1                                * 07A88
        A=DAT0  A                                * 07A8B
        LC(5)   DOEXT1                           * 07A8E
        ?C#A    A                                * 07A95
        GOYES   L_07AC8                          * 07A98
        D0=D0+  5                                * 07A9A
        A=DAT0  A                                * 07A9D
        D0=D0+  5                                * 07AA0
        C=DAT0  A                                * 07AA3
        ?C=0    A                                * 07AA6
        GOYES   L_07AC5                          * 07AA9
        GONC    L_07ABB                          * 07AAB

* refs (1): 07AC1
SUB_07AAE:
        D1=C                                     * 07AAE
        C=DAT1  A                                * 07AB1
        D1=C                                     * 07AB4

* refs (4): 07B71 07F2A 07F73 08254
SUB_07AB7:
        PC=C                                     * 07AB7
L_07ABB:
        ST=1    1                                * 07ABB
        CD0EX                                    * 07ABE
        GOSUB   SUB_07AAE                        * 07AC1
L_07AC5:
        D0=A                                     * 07AC5
L_07AC8:
        P=      0                                * 07AC8
        C=RSTK                                   * 07ACA
        CD1EX                                    * 07ACC
        RSTK=C                                   * 07ACF
        CD1EX                                    * 07AD1
        D1=C                                     * 07AD4
        C=C+1   A                                * 07AD7
        A=C     A                                * 07AD9
        C=C+C   A                                * 07ADB
        C=C+C   A                                * 07ADD
        C=C+A   A                                * 07ADF
        AD0EX                                    * 07AE1
        C=C+A   A                                * 07AE4
        D0=C                                     * 07AE6
        A=DAT0  A                                * 07AE9
        ?A=0    A                                * 07AEC
        GOYES   L_07B51                          * 07AEF
        A=A+C   A                                * 07AF1
L_07AF3:
        D0=D0+  5                                * 07AF3
        C=DAT0  A                                * 07AF6
        ?C=0    A                                * 07AF9
        GOYES   L_07AF3                          * 07AFC
        AD0EX                                    * 07AFE
        A=A+C   A                                * 07B01
        ST=0    10                               * 07B03
        CD1EX                                    * 07B06
        C=C-1   A                                * 07B09
        C=C+C   P                                * 07B0B
        P=C     0                                * 07B0E
        GONC    L_07B21                          * 07B12
        ST=1    10                               * 07B15
        BCEX    W                                * 07B18
        DCEX    W                                * 07B1B
        BCEX    W                                * 07B1E
L_07B21:
        P=P+1                                    * 07B21
        D0=D0+  2                                * 07B23
L_07B26:
        ?ST=0   10                               * 07B26
        GOYES   L_07B37                          * 07B29
        C=DAT0  W                                * 07B2B
        D0=D0+  16                               * 07B2F
        ?B#C    W                                * 07B32
        GOYES   L_07B40                          * 07B35
L_07B37:
        C=DAT0  WP                               * 07B37
        ?D=C    WP                               * 07B3B
        GOYES   L_07B59                          * 07B3E
L_07B40:
        D0=D0+  5                                * 07B40
        CD0EX                                    * 07B43
        C+P+1                                    * 07B46
        D0=C                                     * 07B49
        ?C<A    A                                * 07B4C
        GOYES   L_07B26                          * 07B4F
L_07B51:
        C=RSTK                                   * 07B51
        GOSUB   SUB_07B6A                        * 07B53
        RTNSC                                    * 07B57
L_07B59:
        CD0EX                                    * 07B59
        C+P+1                                    * 07B5C
        D0=C                                     * 07B5F
        A=DAT0  A                                * 07B62
        R3=A                                     * 07B65
        C=RSTK                                   * 07B68

* refs (2): 07B53 082D7
SUB_07B6A:
        P=      1                                * 07B6A
        ?ST=0   1                                * 07B6C
        GOYES   L_07B75                          * 07B6F
        GOSUB   SUB_07AB7                        * 07B71
L_07B75:
        P=      0                                * 07B75
        RTNCC                                    * 07B77

* refs (2): 07CE4 07E65
SUB_07B79:
        LC(5)   #0000B                           * 07B79
        GOSUBL  GETTEMP                          * 07B80
        LC(5)   DOROMP                           * 07B86
        DAT0=C  A                                * 07B8D
        D0=D0+  5                                * 07B90
        A=R2                                     * 07B93
        DAT0=A  A                                * 07B96
        D0=D0+  3                                * 07B99
        A=R3                                     * 07B9C
        DAT0=A  X                                * 07B9F
        D0=D0-  8                                * 07BA3
        AD0EX                                    * 07BA6
        GOLONG  GETPTR                           * 07BA9

* refs (2): 081B4 082F8
SUB_07BAF:
        C=0     A                                * 07BAF
        C=DAT0  B                                * 07BB1
        C=C+C   A                                * 07BB4
        P=      6                                * 07BB6
        C+P+1                                    * 07BB8
        P=      0                                * 07BBB
        AD0EX                                    * 07BBD
        R2=A                                     * 07BC0
        GOSUBL  GETTEMP                          * 07BC3
        D=C     A                                * 07BC9
        LC(5)   DOIDNT                           * 07BCB
        DAT0=C  A                                * 07BD2
        C=D     A                                * 07BD5
        CD0EX                                    * 07BD7
        D0=D0-  5                                * 07BDA
        B=C     A                                * 07BDD
        D1=C                                     * 07BDF
        D1=D1+  5                                * 07BE2
        C=R2                                     * 07BE5
        CD0EX                                    * 07BE8
        GOSUBL  MOVEDOWN                         * 07BEB
        A=B     A                                * 07BF1
        GOLONG  GETPTR                           * 07BF3

* refs (9): 077E9 07E5E 08097 080C4 080DF 0811A ...
SUB_07BF9:
        GOSUBL  SAVPTR                           * 07BF9
        C=DAT1  A                                * 07BFF
        D1=C                                     * 07C02
        D1=D1+  5                                * 07C05
        A=DAT1  A                                * 07C08
        LC(5)   #007FF                           * 07C0B
        A=A&C   A                                * 07C12
        RTN                                      * 07C16

* id -> id T -> ROMPTR T -> F
* refs (9): 0F1B9 0FFF7 24564 24E5B 27472 27F3F ...
COMPILEID:
        CON(5)  L_0790E                          * 07C18  code object: the address of its machine code
L_07C1D:
        GOSUB   SUB_0788E                        * 07C1D
        GOC     L_07C37                          * 07C21
L_07C24:
        GOSUBL  GETPTR                           * 07C24
L_07C2A:
        LC(5)   TRUE                             * 07C2A
        A=C     A                                * 07C31
        PC=(A)                                   * 07C33
L_07C37:
        D0=(5)  USEROB                           * 07C37
        C=DAT0  A                                * 07C3E
        A=R1                                     * 07C41
        ?C=A    A                                * 07C44
        GOYES   L_07C82                          * 07C47
        D0=A                                     * 07C49
        D0=D0+  5                                * 07C4C
        A=DAT0  A                                * 07C4F
        R2=A                                     * 07C52
        ST=0    11                               * 07C55
        GOSUBL  SUB_084B2                        * 07C58
        GOC     L_07C68                          * 07C5E
        GOSUB   SUB_07A56                        * 07C61
        GONC    L_07CC3                          * 07C65
L_07C68:
        GOSUB   SUB_078CC                        * 07C68
        GONC    L_07C1D                          * 07C6C
L_07C6F:
        GOSUBL  GETPTR                           * 07C6F
        LC(5)   FALSE                            * 07C75
        A=C     A                                * 07C7C
        PC=(A)                                   * 07C7E
L_07C82:
        GOSUBL  SUB_08503                        * 07C82
        CD0EX                                    * 07C88
        R4=C                                     * 07C8B
L_07C8E:
        A=R4                                     * 07C8E
        LC(5)   #0000D                           * 07C91
        A=A-C   A                                * 07C98
        C=R1                                     * 07C9A
        ?C>A    A                                * 07C9D
        GOYES   L_07C68                          * 07CA0
        R4=A                                     * 07CA2
        D0=A                                     * 07CA5
        A=DAT0  A                                * 07CA8
        R2=A                                     * 07CAB
        D0=D0+  3                                * 07CAE
        A=DAT0  A                                * 07CB1
        ?A=0    A                                * 07CB4
        GOYES   L_07C8E                          * 07CB7
        D0=A                                     * 07CB9
        GOSUB   SUB_07A56                        * 07CBC
        GOC     L_07C8E                          * 07CC0
L_07CC3:
        A=R2                                     * 07CC3
        LC(3)   #0A0                             * 07CC6
        ?C>A    X                                * 07CCB
        GOYES   L_07CEC                          * 07CCE
        LC(3)   #700                             * 07CD0
        ?C>A    X                                * 07CD5
        GOYES   L_07CE4                          * 07CD8
        LC(3)   #700                             * 07CDA
        ?C>=A   X                                * 07CDF
        GOYES   L_07CEC                          * 07CE2
L_07CE4:
        GOSUB   SUB_07B79                        * 07CE4
        GOTO    L_08060                          * 07CE8
L_07CEC:
        ST=0    11                               * 07CEC
        GOSUBL  SUB_084F5                        * 07CEF
        A=R3                                     * 07CF5
        A=0     M                                * 07CF8
        A=A+1   A                                * 07CFB
        A=A+1   A                                * 07CFD
        C=A     A                                * 07CFF
        A=A+A   A                                * 07D01
        A=A+A   A                                * 07D03
        A=A+C   A                                * 07D05
        CD0EX                                    * 07D07
        C=C+A   A                                * 07D0A
        D0=C                                     * 07D0C
        A=DAT0  A                                * 07D0F
        A=A+C   A                                * 07D12
        GOTO    L_08060                          * 07D14
        NIBHEX  000                              * 07D18  .

* ob lam ->
* refs (89): 26275 262D4 54783 56791 567F5 568FE ...
STOLAM:
        CON(5)  (*)+5                            * 07D1B  primitive code object
        ST=1    0                                * 07D20
        GOTO    L_07D2F                          * 07D23

* ob id/lam ->
* refs (141): 15667 1D7B5 20999 20A04 20D09 24B39 ...
STO:
        CON(5)  (*)+5                            * 07D27  primitive code object
        ST=0    0                                * 07D2C
L_07D2F:
        GOSUBL  SAVPTR                           * 07D2F
        A=DAT1  A                                * 07D35
        D1=D1+  5                                * 07D38
        C=DAT1  A                                * 07D3B
        RSTK=C                                   * 07D3E
        D1=A                                     * 07D40
        A=DAT1  A                                * 07D43
        D1=D1+  5                                * 07D46
        CD1EX                                    * 07D49
        R0=C                                     * 07D4C
        ?ST=1   0                                * 07D4F
        GOYES   L_07D60                          * 07D52
        LC(5)   DOIDNT                           * 07D54
        ?C=A    A                                * 07D5B
        GOYES   L_07D8F                          * 07D5E
L_07D60:
        GOSUB   LrclR0A                          * 07D60
        GOC     L_07D83                          * 07D64
        C=RSTK                                   * 07D67
        DAT0=C  A                                * 07D69
        GOSUBL  GETPTR                           * 07D6C
        D1=D1+  10                               * 07D72
        D=D+1   A                                * 07D75
        D=D+1   A                                * 07D77
        A=DAT0  A                                * 07D79
        D0=D0+  5                                * 07D7C
        PC=(A)                                   * 07D7F
L_07D83:
        GOSUBL  GETPTR                           * 07D83
        GOLONG  DoErrULN                         * 07D89
L_07D8F:
        GOSUBL  GETPTR                           * 07D8F
        LC(5)   OBJ_08C68                        * 07D95
        A=C     A                                * 07D9C
        PC=(A)                                   * 07D9E

* refs (4): 079A4 07D60 8C445 8C4FB
LrclR0A:
        D0=(5)  TEMPENV                          * 07DA2
        A=DAT0  A                                * 07DA9
        D0=A                                     * 07DAC
L_07DAF:
        A=DAT0  A                                * 07DAF
        ?A=0    A                                * 07DB2
        RTNYES                                   * 07DB5
        CD0EX                                    * 07DB7
        D0=C                                     * 07DBA
        C=C+A   A                                * 07DBD
        D=C     A                                * 07DBF
        D0=D0+  10                               * 07DC1
L_07DC4:
        A=DAT0  A                                * 07DC4
        D0=D0+  10                               * 07DC7
        AD0EX                                    * 07DCA
        R1=A                                     * 07DCD
        D0=D0+  5                                * 07DD0
        A=R0                                     * 07DD3
        D1=A                                     * 07DD6
        GOSUB   SUB_07831                        * 07DD9
        C=R1                                     * 07DDD
        D0=C                                     * 07DE0
        GONC    L_07DEE                          * 07DE3
        ?D>C    A                                * 07DE6
        GOYES   L_07DC4                          * 07DE9
        GONC    L_07DAF                          * 07DEB
L_07DEE:
        D0=D0-  5                                * 07DEE
        RTNCC                                    * 07DF1

* refs (1): 07970
SUB_07DF3:
        D0=(5)  TEMPENV                          * 07DF3
        A=DAT0  A                                * 07DFA
        D0=A                                     * 07DFD
        B=B-1   A                                * 07E00
L_07E02:
        A=DAT0  A                                * 07E02
        ?A=0    A                                * 07E05
        RTNYES                                   * 07E08
        B=B-1   A                                * 07E0A
        GOC     L_07E1A                          * 07E0C
        CD0EX                                    * 07E0F
        C=C+A   A                                * 07E12
        D0=C                                     * 07E14
        GONC    L_07E02                          * 07E17
L_07E1A:
        CD0EX                                    * 07E1A
        D0=C                                     * 07E1D
        C=C+A   A                                * 07E20
        D=C     A                                * 07E22
        D0=D0+  10                               * 07E24
L_07E27:
        A=DAT0  A                                * 07E27
        D0=D0+  10                               * 07E2A
        AD0EX                                    * 07E2D
        R1=A                                     * 07E30
        D0=D0+  5                                * 07E33
        A=R0                                     * 07E36
        D1=A                                     * 07E39
        GOSUB   SUB_07831                        * 07E3C
        C=R1                                     * 07E40
        D0=C                                     * 07E43
        GONC    L_07DEE                          * 07E46
        ?D>C    A                                * 07E49
        GOYES   L_07E27                          * 07E4C
        RTNSC                                    * 07E4E

* #lib #cmd -> ROMPTR
* refs (3): 3F5D4 416D3 C0E26
#>ROMPTR:
        CON(5)  (*)+5                            * 07E50  primitive code object
        GOSUBL  POP#                             * 07E55
        R3=A                                     * 07E5B
        GOSUB   SUB_07BF9                        * 07E5E
L_07E62:
        R2=A                                     * 07E62
        GOSUB   SUB_07B79                        * 07E65
        DAT1=A  A                                * 07E69
        A=DAT0  A                                * 07E6C
        D0=D0+  5                                * 07E6F
        PC=(A)                                   * 07E72

* ob -> ROMPTR T -> F
* refs (6): 24DCA 388E5 39A74 54B4B 62A7A 72EB4
PTR>ROMPTR:
        CON(5)  (*)+5                            * 07E76  primitive code object
        A=DAT1  A                                * 07E7B
        GOSUBL  SAVPTR                           * 07E7E
        AD0EX                                    * 07E84
        D0=D0-  3                                * 07E87
        A=DAT0  A                                * 07E8A
        R3=A                                     * 07E8D
        D0=D0-  3                                * 07E90
        A=DAT0  A                                * 07E93
        GONC    L_07E62                          * 07E96  always taken

* ROMPTR -> ob T -> F
* refs (17): 02FF4 0F1DC 1001A 3834F 3A6D6 3FB24 ...
ROMPTR@:
        CON(5)  (*)+5                            * 07E99  primitive code object
        A=DAT1  A                                * 07E9E
        GOSUBL  SAVPTR                           * 07EA1
        GOSUB   SUB_07ED8                        * 07EA7
        GOC     L_07EBE                          * 07EAB
        ?ST=0   1                                * 07EAE
        GOYES   L_07EBA                          * 07EB1
        GOVLNG  L_70F85                          * 07EB3
L_07EBA:
        GOTO    L_08060                          * 07EBA
L_07EBE:
        GOSUBL  GETPTR                           * 07EBE
        LC(5)   FALSE                            * 07EC4
        DAT1=C  A                                * 07ECB
        A=DAT0  A                                * 07ECE
        D0=D0+  5                                * 07ED1
        PC=(A)                                   * 07ED4

* refs (12): 07EA7 32CDF 3A7B5 61FEC 70E98 70EA6 ...
SUB_07ED8:
        ST=0    1                                * 07ED8
        D0=A                                     * 07EDB

PushXlib:
        A=0     W                                * 07EDE
        A=DAT0  11                               * 07EE1
        R3=A                                     * 07EE5
        D0=D0+  8                                * 07EE8
        A=0     A                                * 07EEB
        A=DAT0  X                                * 07EED
        B=A     A                                * 07EF1
        D0=D0-  3                                * 07EF3
        A=DAT0  X                                * 07EF6
        ST=0    11                               * 07EFA
        GOSUB   SUB_084F5                        * 07EFD
        RTNC                                     * 07F01
        LC(5)   IRAMBUFF                         * 07F04
        ?C#A    A                                * 07F0B
        GOYES   L_07F31                          * 07F0E
        ST=1    1                                * 07F10
        D0=D0+  5                                * 07F13
        A=DAT0  A                                * 07F16
        AD1EX                                    * 07F19
        DAT0=A  A                                * 07F1C
        D0=D0+  5                                * 07F1F
        A=DAT0  A                                * 07F22
        C=A     A                                * 07F25
        AD1EX                                    * 07F27
        GOSUB   SUB_07AB7                        * 07F2A
        D0=A                                     * 07F2E
L_07F31:
        B=B+1   A                                * 07F31
        A=B     A                                * 07F33
        A=A+A   A                                * 07F35
        A=A+A   A                                * 07F37
        A=A+B   A                                * 07F39
        D0=D0+  5                                * 07F3B
        C=DAT0  A                                * 07F3E
        ?C<=A   A                                * 07F41
        GOYES   L_07F69                          * 07F44
        CD0EX                                    * 07F46
        A=A+C   A                                * 07F49
        D0=A                                     * 07F4B
        A=DAT0  A                                * 07F4E
        ?A=0    A                                * 07F51
        GOYES   L_07F69                          * 07F54
        CD0EX                                    * 07F56
        A=A+C   A                                * 07F59
        ?ST=0   1                                * 07F5B
        GOYES   L_07F67                          * 07F5E
        GOSUB   SUB_07F6E                        * 07F60
        DAT0=A  A                                * 07F64
L_07F67:
        RTNCC                                    * 07F67
L_07F69:
        ?ST=0   1                                * 07F69
        RTNYES                                   * 07F6C

* refs (1): 07F60
SUB_07F6E:
        P=      1                                * 07F6E
        CD1EX                                    * 07F70
        GOSUB   SUB_07AB7                        * 07F73
        D0=(5)  #800FA                           * 07F77
        C=DAT0  A                                * 07F7E
        D1=C                                     * 07F81
        RTNSC                                    * 07F84

* rrp -> {#lib1..#libn} T ROMPTR -> #libnum
* refs (2): 21D08 856FA
ROMPART:
        CON(5)  (*)+5                            * 07F86  primitive code object
        A=DAT1  A                                * 07F8B
        GOSUBL  SAVPTR                           * 07F8E
        D0=(5)  USEROB                           * 07F94
        C=DAT0  A                                * 07F9B
        ?C=A    A                                * 07F9E
        GOYES   L_07FE3                          * 07FA1
        D0=A                                     * 07FA3
        D0=D0+  5                                * 07FA6
        A=0     A                                * 07FA9
        A=DAT0  X                                * 07FAB
        LC(3)   #7FF                             * 07FAF
        ?C#A    X                                * 07FB4
        GOYES   L_07FBD                          * 07FB7
        GOTO    L_07EBE                          * 07FB9
L_07FBD:
        R0=A                                     * 07FBD
        GOSUBL  PUSH#                            * 07FC0
        LC(5)   TRUE                             * 07FC6
        DAT1=C  A                                * 07FCD
        D1=D1+  5                                * 07FD0
        DAT1=A  A                                * 07FD3
        D1=D1-  5                                * 07FD6
        A=DAT0  A                                * 07FD9
        D0=D0+  5                                * 07FDC
        PC=(A)                                   * 07FDF
L_07FE3:
        D0=C                                     * 07FE3
        D0=D0+  5                                * 07FE6
        C=0     A                                * 07FE9
        C=DAT0  X                                * 07FEB
        C=C+1   A                                * 07FEF
        C=C+C   A                                * 07FF1
        A=C     A                                * 07FF3
        C=C+C   A                                * 07FF5
        C=C+C   A                                * 07FF7
        C=C+A   A                                * 07FF9
        AD0EX                                    * 07FFB
        R2=A                                     * 07FFE
