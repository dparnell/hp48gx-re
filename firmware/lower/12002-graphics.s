* HP 48GX ROM revision R, #12002-#14000: Display buffers and graphics
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: HARDBUFF GBUFF TOADISP XYGROBDISP INVGROB HARDBUFF2 BLANKIT PIXON3 WINDOWXY DISPSTATUS2 DISPROW5 WINDOWCORNER
* Follows on from the previous file (at #12002 in the original ROM).
L_12002:
        A=DAT0  A                                * 12002
        D0=D0+  5                                * 12005
        PC=(A)                                   * 12008

* $ #n -> flag grob
* refs (2): 39A24 46879
RIGHT$3x6:
        CON(5)  (*)+5                            * 1200C  primitive code object
        GOSUB   SAVPTR~jump_7                    * 12011
        GOSUB   POP#~jump                        * 12015
        R0=A                                     * 12019
        A=DAT1  A                                * 1201C
        GOSUB   SUB_120CC                        * 1201F
        CD1EX                                    * 12023
        C=C+A   A                                * 12026
        C=C+A   A                                * 12028
        CD1EX                                    * 1202A
        C=A     A                                * 1202D
        D=C     A                                * 1202F
        A=0     A                                * 12031
        D0=A                                     * 12033
        A=R0                                     * 12036
        B=A     A                                * 12039
L_1203B:
        D=D-1   A                                * 1203B
        GOC     L_12079                          * 1203D
        D1=D1-  2                                * 12040
        A=DAT1  B                                * 12043
        GOSBVL  SUB_7A1F4                        * 12046
        AD1EX                                    * 1204D
        GOSBVL  L_0C169                          * 12050
        C=0     A                                * 12057
        C=DAT1  1                                * 12059
        D1=A                                     * 1205D
        B=B-C   A                                * 12060
        GOC     L_1206C                          * 12062
        D0=D0+  1                                * 12065
        GOTO    L_1203B                          * 12068
L_1206C:
        B=B+C   A                                * 1206C
        LC(5)   TRUE                             * 1206E
        GOTO    L_12080                          * 12075
L_12079:
        LC(5)   FALSE                            * 12079
L_12080:
        RSTK=C                                   * 12080
        A=R0                                     * 12082
        A=A-B   A                                * 12085
        R0=A                                     * 12087
        AD0EX                                    * 1208A
        R4=A                                     * 1208D
        C=0     A                                * 12090
        LC(1)   #6                               * 12092
        R1=C                                     * 12095
        GOSUBL  makegrob                         * 12098
        GOSBVL  D1=DSKTOP                        * 1209E
        C=RSTK                                   * 120A5
        D1=D1+  5                                * 120A7
        A=DAT1  A                                * 120AA
        DAT1=C  A                                * 120AD
        GOSUB   SUB_120CC                        * 120B0
        C=R4                                     * 120B4
        A=A-C   A                                * 120B7
        CD1EX                                    * 120B9
        C=C+A   A                                * 120BC
        C=C+A   A                                * 120BE
        CD1EX                                    * 120C0
        GOTO    L_11FD0                          * 120C3
        NIBHEX  00000                            * 120C7  ..

* refs (8): 11D0F 11D36 11F8F 1201F 120B0 1219A ...
SUB_120CC:
        D1=A                                     * 120CC
        D1=D1+  5                                * 120CF
        A=DAT1  A                                * 120D2
        A=A-CON A,5                              * 120D5
        ASRB.F  A                                * 120DB
        B=A     A                                * 120E0
        D1=D1+  5                                * 120E2
        RTN                                      * 120E5

* refs (3): 11919 11D18 11FFB
GETPTR~jump_3:
        GOVLNG  GETPTR                           * 120E7
        NIBHEX  8DF7530                          * 120EE  Ø.5

* refs (1): 11FA4
SUB_120F5:
        B=0     A                                * 120F5
        D=C     A                                * 120F7
        D=0     S                                * 120F9
L_120FC:
        D=D-1   S                                * 120FC
        GONC    L_1210F                          * 120FF
        GOSUB   SUB_1211E                        * 12102
        RTNC                                     * 12106
        AD1EX                                    * 12109
        D0=A                                     * 1210C
L_1210F:
        A=0     A                                * 1210F
        A=DAT0  1                                * 12111
        B=B+A   A                                * 12115
        D0=D0+  11                               * 12117
        GOTO    L_120FC                          * 1211A

* refs (3): 12102 121B3 12267
SUB_1211E:
        ?D=0    A                                * 1211E
        RTNYES                                   * 12121
        C=0     A                                * 12123
        LC(1)   #8                               * 12125
        ?D>=C   A                                * 12128
        GOYES   L_1212F                          * 1212B
        C=D     A                                * 1212D
L_1212F:
        D=D-C   A                                * 1212F
        P=C     0                                * 12131
        C=P     15                               * 12135
        D=C     S                                * 12139
        D=D-1   S                                * 1213C
        A=DAT1  W                                * 1213F
        D1=D1+  16                               * 12143
        GOSBVL  SUB_7A1FA                        * 12146
        AD1EX                                    * 1214D
        GOSBVL  L_0C169                          * 12150
        RTNCC                                    * 12157
        NIBHEX  00000                            * 12159  ..

* grob #x #y $ #w -> grob'
* refs (1): 3A4C4
CENTER$3x5:
        CON(5)  (*)+5                            * 1215E  primitive code object
        GOSUB   POP#~jump                        * 12163
        R0=A                                     * 12167
        A=DAT1  A                                * 1216A
        R1=A                                     * 1216D
        D1=D1+  5                                * 12170
        D=D+1   A                                * 12173
        GOSBVL  POP2#                            * 12175
        C=C-CON A,3                              * 1217C
        GONC    L_12187                          * 12182
        C=0     A                                * 12185
L_12187:
        R2=C                                     * 12187
        R3=A                                     * 1218A
        GOSUB   SAVPTR~jump_7                    * 1218D
        A=DAT1  A                                * 12191
        R4=A                                     * 12194
        A=R1                                     * 12197
        GOSUB   SUB_120CC                        * 1219A
        C=A     A                                * 1219E
        D=0     W                                * 121A0
        DCEX    A                                * 121A3
        A=R0                                     * 121A5
        B=A     A                                * 121A8
L_121AA:
        D=D-1   S                                * 121AA
        GONC    L_121C2                          * 121AD
        D0=C                                     * 121B0
        GOSUB   SUB_1211E                        * 121B3
        AD1EX                                    * 121B7
        C=A     A                                * 121BA
        CD0EX                                    * 121BC
        GOC     L_121D8                          * 121BF
L_121C2:
        A=0     A                                * 121C2
        A=DAT0  1                                * 121C4
        D0=D0+  11                               * 121C8
        B=B-A   A                                * 121CB
        GOC     L_121D6                          * 121CD
        C=C+1   A                                * 121D0
        GOTO    L_121AA                          * 121D2
L_121D6:
        B=B+A   A                                * 121D6
L_121D8:
        D=C     A                                * 121D8
        A=R0                                     * 121DA
        A=A-B   A                                * 121DD
        A=A+1   A                                * 121DF
        ASRB.F  A                                * 121E1
        C=R3                                     * 121E6
        C=C-A   A                                * 121E9
        GONC    L_121F0                          * 121EB
        C=0     A                                * 121EE
L_121F0:
        CR4EX                                    * 121F0
        D1=C                                     * 121F3
        GOSUB   SUB_11C58                        * 121F6
        D0=A                                     * 121FA
        A=B     A                                * 121FD
        C=R4                                     * 121FF
        B=C     A                                * 12202
        LC(1)   #3                               * 12204
        B=B&C   P                                * 12207
        C=R1                                     * 1220B
        D1=C                                     * 1220E
        D1=D1+  10                               * 12211
        C=D     A                                * 12214
        ST=0    2                                * 12216
        GOSUB   SUB_12223                        * 12219
        GOLONG  L_116AE                          * 1221D

* refs (2): 11FE9 12219
SUB_12223:
        SETHEX                                   * 12223
        D=0     S                                * 12225
        R1=C                                     * 12228
        C=A     A                                * 1222B
        D=C     A                                * 1222D
        BSRC                                     * 1222F
        A=B     S                                * 12232
        CD1EX                                    * 12235
        R2=C                                     * 12238
        P=      15                               * 1223B
L_1223D:
        LC(1)   #4                               * 1223D
L_12240:
        ?C>A    S                                * 12240
        GOYES   L_1224E                          * 12243
        A=A-C   S                                * 12245
        D0=D0+  1                                * 12248
        GONC    L_12240                          * 1224B
L_1224E:
        P=      0                                * 1224E
        D=D-1   S                                * 12250
        GONC    L_1227C                          * 12253
        B=A     S                                * 12256
        C=R2                                     * 12259
        D1=C                                     * 1225C
        C=R1                                     * 1225F
        DCEX    A                                * 12262
        R1=C                                     * 12264
        GOSUB   SUB_1211E                        * 12267
        RTNC                                     * 1226B
        R2=A                                     * 1226E
        C=R1                                     * 12271
        DCEX    A                                * 12274
        R1=C                                     * 12276
        A=B     S                                * 12279
L_1227C:
        C=0     W                                * 1227C
        C=DAT1  11                               * 1227F
        D1=D1+  11                               * 12283
        CSRC                                     * 12286
        B=C     W                                * 12289
        C=0     A                                * 1228C
        C=C-1   A                                * 1228E
        GOC     L_12295                          * 12290
L_12293:
        C=C+C   A                                * 12293
L_12295:
        C=C-1   S                                * 12295
        GONC    L_12293                          * 12298
        C=-C-1  A                                * 1229B
        C=A     S                                * 1229D
        A=A+B   S                                * 122A0
        GONC    L_122AB                          * 122A3
L_122A6:
        C=C+C   A                                * 122A6
        B=B+B   W                                * 122A8
L_122AB:
        C=C-1   S                                * 122AB
        GONC    L_122A6                          * 122AE
        C=-C-1  A                                * 122B1
        CD1EX                                    * 122B3
        RSTK=C                                   * 122B6
        CD0EX                                    * 122B8
        D0=C                                     * 122BB
        CD1EX                                    * 122BE
        P=      4                                * 122C1
        ?ST=0   2                                * 122C3
        GOYES   L_122CA                          * 122C6
        P=      5                                * 122C8
L_122CA:
        RSTK=C                                   * 122CA
        A=DAT1  A                                * 122CC
        A=A&C   X                                * 122CF
        C=-C-1  A                                * 122D3
        C=C&B   X                                * 122D5
        C=C!A   X                                * 122D9
        DAT1=C  X                                * 122DD
        BSR     W                                * 122E1
        BSR     W                                * 122E4
        CD1EX                                    * 122E7
        C=C+D   A                                * 122EA
        D1=C                                     * 122EC
        C=RSTK                                   * 122EF
        P=P-1                                    * 122F1
        GONC    L_122CA                          * 122F3
        C=RSTK                                   * 122F6
        D1=C                                     * 122F8
        GOTO    L_1223D                          * 122FB

* grob -> grob'
* refs (24): 3A380 3A3E2 3A444 4CDC0 4DBBD 4FC32 ...
INVGROB:
        CON(5)  (*)+5                            * 122FF  primitive code object
        GOSUB   SAVPTR~jump_7                    * 12304
        C=DAT1  A                                * 12308
        D1=C                                     * 1230B
        D1=D1+  5                                * 1230E
        A=DAT1  A                                * 12311
        C=0     A                                * 12314
        LC(2)   #10                              * 12316
        A=A-C   A                                * 1231A
        GONC    L_12323                          * 1231C
        GOTO    L_123C2                          * 1231F
L_12323:
        D1=D1+  5                                * 12323
        C=DAT1  A                                * 12326
        C=C-1   A                                * 12329
        RSTK=C                                   * 1232B
        D1=D1+  5                                * 1232D
        C=DAT1  A                                * 12330
        D1=D1+  5                                * 12333
        A=C     A                                * 12336
        GOSUBL  w->W                             * 12338
        B=A     A                                * 1233E
        B=B+B   A                                * 12340
        B=B+B   A                                * 12342
        B=B-C   A                                * 12344
        CSR     A                                * 12346
        CSRB.F  A                                * 12348
        CSRB.F  A                                * 1234D
        R0=C                                     * 12352
        CSL     A                                * 12355
        A=A-C   A                                * 12357
        R1=A                                     * 12359
        D=0     W                                * 1235C
        D=D-1   W                                * 1235F
        C=R1                                     * 12362
        C=C-1   A                                * 12365
        P=C     0                                * 12367
        GOTO    L_12374                          * 1236B
L_1236F:
        DSRB.F  WP                               * 1236F
L_12374:
        B=B-1   A                                * 12374
        GONC    L_1236F                          * 12376
        C=RSTK                                   * 12379
L_1237B:
        RSTK=C                                   * 1237B
        A=R0                                     * 1237D
        B=A     A                                * 12380
        GOTO    L_12394                          * 12382
L_12386:
        A=DAT1  W                                * 12386
        A=-A-1  W                                * 1238A
        DAT1=A  W                                * 1238D
        D1=D1+  16                               * 12391
L_12394:
        B=B-1   A                                * 12394
        GONC    L_12386                          * 12396
        C=R1                                     * 12399
        ?C=0    A                                * 1239C
        GOYES   L_123B9                          * 1239F
        C=DAT1  WP                               * 123A1
        C=-C-1  WP                               * 123A5
        C=C&D   WP                               * 123A8
        DAT1=C  WP                               * 123AC
        CD1EX                                    * 123B0
        C+P+1                                    * 123B3
        D1=C                                     * 123B6
L_123B9:
        C=RSTK                                   * 123B9
        C=C-1   A                                * 123BB
        GONC    L_1237B                          * 123BD
        P=      0                                * 123C0
L_123C2:
        GOLONG  L_116AE                          * 123C2

* refs (3): 39D97 39DD8 3A0C6
BigDisp(st,s):
        CON(5)  (*)+5                            * 123C8  primitive code object
        GOSUB   POP#~jump                        * 123CD
        A=A-1   A                                * 123D1
        A=A-1   A                                * 123D3
        GOC     L_1241A                          * 123D5
        A=A-1   A                                * 123D8
        GOC     L_1240A                          * 123DA
        A=A-1   A                                * 123DD
        GOC     L_123FA                          * 123DF
        GONC    L_123EA                          * 123E2

* refs (5): 8D6F7 8EE78 8F368 8F41F 8F4B7
BigDisp1(st):
        CON(5)  (*)+5                            * 123E5  primitive code object
L_123EA:
        LC(5)   #0002E                           * 123EA
        GOTO    L_12421                          * 123F1

BigDisp2(st):
        CON(5)  (*)+5                            * 123F5  primitive code object
L_123FA:
        LC(5)   #00024                           * 123FA
        GOTO    L_12421                          * 12401

BigDisp3(st):
        CON(5)  (*)+5                            * 12405  primitive code object
L_1240A:
        LC(5)   #0001A                           * 1240A
        GOTO    L_12421                          * 12411

BigDisp4(st):
        CON(5)  (*)+5                            * 12415  primitive code object
L_1241A:
        LC(5)   #00010                           * 1241A
L_12421:
        GOSUB   SUB_11CCC                        * 12421
        GOTO    L_124DA                          * 12425

* $ #row ->
* refs (7): 15469 3A532 3FBB0 413FA 4140E 492ED ...
DISPN:
        CON(5)  (*)+5                            * 12429  primitive code object
        GOSUB   POP#~jump                        * 1242E
        A=A-1   A                                * 12432
        A=A-1   A                                * 12434
        GOC     L_12460                          * 12436
        A=A-1   A                                * 12439
        GOC     L_12470                          * 1243B
        A=A-1   A                                * 1243E
        GOC     L_12480                          * 12440
        A=A-1   A                                * 12443
        GOC     L_12490                          * 12445
        A=A-1   A                                * 12448
        GOC     L_124A0                          * 1244A
        A=A-1   A                                * 1244D
        GOC     L_124B0                          * 1244F
        A=A-1   A                                * 12452
        GOC     L_124C0                          * 12454
        GOTO    L_124D0                          * 12457

* $ ->
* refs (10): 17BE5 22114 3409C 387AA 4798E 479BB ...
DISPROW1:
        CON(5)  (*)+5                            * 1245B  primitive code object
L_12460:
        LC(5)   #00000                           * 12460
        GOTO    L_124D7                          * 12467

* $ ->
* refs (7): 22152 2D744 340A6 387AF 479C0 9AE14 ...
DISPROW2:
        CON(5)  (*)+5                            * 1246B  primitive code object
L_12470:
        LC(5)   #00008                           * 12470
        GOTO    L_124D7                          * 12477

* $ ->
* refs (10): 17C79 2219A 45F40 46076 4A37C 4A54E ...
DISPROW3:
        CON(5)  (*)+5                            * 1247B  primitive code object
L_12480:
        LC(5)   #00010                           * 12480
        GOTO    L_124D7                          * 12487

* $ ->
* refs (9): 221D1 45F67 4609E 4A3C4 4A575 4A64B ...
DISPROW4:
        CON(5)  (*)+5                            * 1248B  primitive code object
L_12490:
        LC(5)   #00018                           * 12490
        GOTO    L_124D7                          * 12497

* $ ->
* refs (11): 17EF7 17F89 18187 222B2 45FB7 460C6 ...
DISPROW5:
        CON(5)  (*)+5                            * 1249B  primitive code object
L_124A0:
        LC(5)   #00020                           * 124A0
        GOTO    L_124D7                          * 124A7

* $ ->
* refs (10): 17F01 181B9 222C6 45FD5 460EE 4A4AF ...
DISPROW6:
        CON(5)  (*)+5                            * 124AB  primitive code object
L_124B0:
        LC(5)   #00028                           * 124B0
        GOTO    L_124D7                          * 124B7

* $ ->
* refs (8): 222DA 45FF8 46111 4A504 4A5E0 4A669 ...
DISPROW7:
        CON(5)  (*)+5                            * 124BB  primitive code object
L_124C0:
        LC(5)   #00030                           * 124C0
        GOTO    L_124D7                          * 124C7

* $ ->
DISPROW8:
        CON(5)  (*)+5                            * 124CB  primitive code object
L_124D0:
        LC(5)   #00038                           * 124D0
L_124D7:
        XM=0                                     * 124D7
L_124DA:
        RSTK=C                                   * 124DA
        A=DAT1  A                                * 124DC
        D1=D1+  5                                * 124DF
        D=D+1   A                                * 124E2
        GOSUBL  SAVPTR~jump_7                    * 124E4
        GOSUB   SUB_120CC                        * 124EA
        LC(5)   #00016                           * 124EE
        ST=0    1                                * 124F5
        ?C>=A   A                                * 124F8
        GOYES   L_12504                          * 124FB
        ST=1    1                                * 124FD
        A=C     A                                * 12500
        A=A-1   A                                * 12502
L_12504:
        R2=A                                     * 12504
        C=C-A   A                                * 12507
        CSRB.F  A                                * 12509
        R3=C.F  A                                * 1250E
        D0=(5)  ADISP                            * 12514
        A=DAT0  A                                * 1251B
        D0=A                                     * 1251E
        D0=D0+  15                               * 12521
        A=DAT0  A                                * 12524
        GOSUBL  w->W                             * 12527
        C=A     A                                * 1252D
        D=C     A                                * 1252F
        D0=D0+  5                                * 12531
        C=RSTK                                   * 12534
        GOSUBL  SUB_11642                        * 12536
        AD0EX                                    * 1253C
        A=A+B   A                                * 1253F
        D0=A                                     * 12541
        B=0     A                                * 12544
        C=R2                                     * 12546
        GOSBVL  SUB_11D92                        * 12549
        A=R2                                     * 12550
        C=0     A                                * 12553
        LC(2)   #16                              * 12555
        ?C#A    A                                * 12559
        GOYES   L_12562                          * 1255C
        GOTO    L_125E2                          * 1255E
L_12562:
        CD0EX                                    * 12562
        D0=C                                     * 12565
        ?ABIT=0 0                                * 12568
        GOYES   L_125A1                          * 1256D
        RSTK=C                                   * 1256F
        LC(3)   #703                             * 12571
        ?XM=0                                    * 12576
        GOYES   L_12580                          * 12579
        LC(3)   #903                             * 1257B
L_12580:
        A=DAT0  B                                * 12580
        A=A&C   B                                * 12583
        DAT0=A  B                                * 12587
        CD0EX                                    * 1258A
        C=C+D   A                                * 1258D
        CD0EX                                    * 1258F
        C=C-1   XS                               * 12592
        GONC    L_12580                          * 12595
        C=RSTK                                   * 12598
        C=C+1   A                                * 1259A
        C=C+1   A                                * 1259C
        D0=C                                     * 1259E
L_125A1:
        ?ST=1   1                                * 125A1
        GOYES   L_125ED                          * 125A4
        CR3EX.F A                                * 125A6
        C=C-1   A                                * 125AC
        CR3EX.F A                                * 125AE
        GOC     L_125E2                          * 125B4
        A=0     A                                * 125B7
        P=      7                                * 125B9
        ?XM=0                                    * 125BB
        GOYES   L_125C2                          * 125BE
        P=      9                                * 125C0
L_125C2:
        RSTK=C                                   * 125C2
        C=R3.F  A                                * 125C4
L_125CA:
        DAT0=A  X                                * 125CA
        D0=D0+  3                                * 125CE
        C=C-1   A                                * 125D1
        GONC    L_125CA                          * 125D3
        C=RSTK                                   * 125D6
        C=C+D   A                                * 125D8
        D0=C                                     * 125DA
        P=P-1                                    * 125DD
        GONC    L_125C2                          * 125DF
L_125E2:
        P=      0                                * 125E2
        XM=0                                     * 125E4
        GOLONG  L_116AE                          * 125E7
L_125ED:
        C=C-1   A                                * 125ED
        C=C-1   A                                * 125EF
        C=C+D   A                                * 125F1
        C=C+D   A                                * 125F3
        C=C+D   A                                * 125F5
        C=C+D   A                                * 125F7
        C=C+D   A                                * 125F9
        ?XM=0                                    * 125FB
        GOYES   L_12604                          * 125FE
        C=C+D   A                                * 12600
        C=C+D   A                                * 12602
L_12604:
        D0=C                                     * 12604
        A=0     A                                * 12607
        A=DAT0  P                                * 12609
        LC(2)   #54                              * 1260D
        A=A!C   B                                * 12611
        DAT0=A  B                                * 12615
        CD0EX                                    * 12618
        C=C+D   A                                * 1261B
        D0=C                                     * 1261D
        A=0     A                                * 12620
        A=DAT0  P                                * 12622
        LC(2)   #54                              * 12626
        A=A!C   B                                * 1262A
        DAT0=A  B                                * 1262E
        GOTO    L_125E2                          * 12631

* -> dispgrob
* refs (115): 0E12D 126E4 12950 12969 12982 12B5D ...
HARDBUFF:
        CON(5)  (*)+5                            * 12635  primitive code object

* refs (1): 12635
addrVDISP:
        LC(5)   VDISP                            * 1263A
        GOTO    L_12671                          * 12641

* -> menugrob
* refs (22): 3A29C 4712F 47148 47189 4E735 50415 ...
HARDBUFF2:
        CON(5)  (*)+5                            * 12645  primitive code object

* refs (1): 12645
addrVDISP2:
        LC(5)   VDISP2                           * 1264A
        GOTO    L_12671                          * 12651

* -> textgrob
* refs (4): 503E8 50442 5046F 6CC52
ABUFF:
        CON(5)  (*)+5                            * 12655  primitive code object

* refs (1): 12655
addrADISP:
        LC(5)   ADISP                            * 1265A
        GOTO    L_12671                          * 12661

* -> graphgrob
* refs (38): 17D9B 1CA9E 20CB7 45690 45721 4577B ...
GBUFF:
        CON(5)  (*)+5                            * 12665  primitive code object
        LC(5)   GDISP                            * 1266A
L_12671:
        RSTK=C                                   * 12671
        GOSBVL  SUB_0EDFA                        * 12673
        C=RSTK                                   * 1267A
        CD0EX                                    * 1267C
        A=DAT0  A                                * 1267F
        D0=C                                     * 12682
        D1=D1-  5                                * 12685
        D=D-1   A                                * 12688
        GOLONG  L_11FFF                          * 1268A

* refs (1): 01D44
SUB_12690:
        D1=(5)  LINECOUNTg                       * 12690
        C=DAT1  B                                * 12697
        ?CBIT=0 7                                * 1269A
        GOYES   L_126A1                          * 1269F
L_126A1:
        D1=(5)  DISPADDR                         * 126A1
        P=      0                                * 126A8
        LC(5)   #01D22                           * 126AA
        DAT1=C  A                                * 126B1
        D1=(2)  #25                              * 126B4
        LC(3)   #FDE                             * 126B8
        DAT1=C  X                                * 126BD
        D1=(2)  #00                              * 126C1
        C=DAT1  S                                * 126C5
        LC(1)   #8                               * 126C9
        DAT1=C  1                                * 126CC
        D1=(2)  #28                              * 126D0
        LC(2)   #3F                              * 126D4
        GOVLNG  L_72D12                          * 126D8
        RPL

* #startrow #rows ->
* refs (21): 39967 3A555 3A56E 3A587 3A5C3 A420C ...
BLANKIT:
        :: HARDBUFF BINT0 4ROLL BINT131 5ROLL 3PICK#+ GROB!ZERODRP ; * 126DF

* $ ->
* refs (11): 12B94 14ACD 14D9B 153D4 2386A 2D762 ...
DISPSTATUS2:
        :: SEP$NL DISPROW1* DISPROW2* ;          * 1270C

* $ ->
* refs (1): 12716
DISPROW1*:
        :: COERCE$22 $>GROB HBUFF_X_Y Clr8 GROB! ; * 12725

* $ ->
* refs (1): 1271B
DISPROW2*:
        :: COERCE$22 $>GROB HBUFF_X_Y #8+ Clr8-15 GROB! ; * 12748

* $ -> $'
* refs (3): 0E02E 1272A 1274D
COERCE$22:
        :: DUPLEN$ BINT22 #> NOT?SEMI            * 12770
          BINT1 BINT21 SUB$ CHR_... >T$ ;        * 12789

* $ -> $' $''
* refs (2): 12711 388C2
SEP$NL:
        :: DUP CHR_Newline BINT1 POS$ DUP#0= IT  * 127A7

* $ ob -> $ #len+1
DROPDUPLEN$1+:
          :: DROPDUP LEN$ #1+ ;                  * 127CA
          2DUP #1- ONESWAP SUB$ BINT3 UNROLL #1+ OVERLEN$ SUB$SWAP ; * 127E3

repl(go,2s,st):
        :: $>grob repl(go,2s,go) ;               * 12815

* refs (1): 1281F
repl(go,2s,go):
        :: 4UNROLL 3PICK 5UNROLL GROB! ;         * 12829

* refs (1): 3A206
DispMenu.1~1:
        CON(5)  (*)+5                            * 12847  primitive code object
        ASSEMBLE
        CD0EX                                    * 1284C
        RSTK=C                                   * 1284F
        GOSBVL  D0->Sft1                         * 12851
        D0=D0-  2                                * 12858
        LC(1)   #7                               * 1285B
        CSRC                                     * 1285E
        LA(2)   #7D                              * 12861
L_12868:
        D0=D0+  7                                * 12868
        GOSUB   SUB_12890                        * 1286B
        GOSUB   SUB_128A1                        * 1286F
        GOSUB   SUB_12890                        * 12873
        GOSUB   SUB_128A1                        * 12877
        GOSUB   SUB_12890                        * 1287B
        C=C-1   S                                * 1287F
        GONC    L_12868                          * 12882
        C=RSTK                                   * 12885
        CD0EX                                    * 12887
        GOLONG  L_12002                          * 1288A

* refs (4): 1286B 12873 1287B 128A4
SUB_12890:
        C=DAT0  P                                * 12890
        C=C&A   P                                * 12894
        DAT0=C  P                                * 12898
        D0=D0+  5                                * 1289C
        RTN                                      * 1289F

* refs (2): 1286F 12877
SUB_128A1:
        ASRC                                     * 128A1
        GOSUB   SUB_12890                        * 128A4
        ASLC                                     * 128A8
        D0=D0+  1                                * 128AB
        RTN                                      * 128AE
        RPL

* #x #y grob ->
* refs (28): 6680D 6AD57 6C37A 6C9A4 6CBFC 6CCA8 ...
XYGROBDISP:
        :: 3UNROLL                               * 128B0
          CODE                                   * 128BA  31 nibbles
            GOSUB   SAVPTR~jump_8                * 128C4
            GOSBVL  POP#                         * 128C8
            D1=D1+  5                            * 128CF
            C=0     A                            * 128D2
            LC(1)   #A                           * 128D4
            B=C     A                            * 128D7
            LC(5)   HEIGHTENHBUFF                * 128D9
            GONC    L_12907                      * 128E0  always taken
          ENDCODE                                * 128E3
          CODE                                   * 128E3  99 nibbles
            GOSUB   SAVPTR~jump_8                * 128ED
            D1=D1+  5                            * 128F1
            GOSBVL  POP#                         * 128F4
            B=0     A                            * 128FB
            B=B-1   P                            * 128FD
            LC(5)   BROADENHBUFF                 * 12900
L_12907:
            R1=C.F  A                            * 12907
            C=DAT1  A                            * 1290D
            C=C+B   A                            * 12910
            D1=C                                 * 12912
            C=DAT1  A                            * 12915
            A=A+C   A                            * 12918
            D1=(5)  VDISP                        * 1291A
            C=DAT1  A                            * 12921
            C=C+B   A                            * 12924
            D1=C                                 * 12926
            C=DAT1  A                            * 12929
            ?C<A    A                            * 1292C
            GOYES   L_12937                      * 1292F
            GOLONG  L_1305A                      * 12931
L_12937:
            A=A-C   A                            * 12937
            R0=A.F  A                            * 12939
            GOSBVL  PUSH#                        * 1293F
            A=R1.F  A                            * 12946
            PC=(A)                               * 1294C
          ENDCODE                                * 12950
          HARDBUFF 3UNROLL GROB! ;               * 12950

* #rows ->
* refs (1): 128D9
HEIGHTENHBUFF:
        :: HARDBUFF SWAP HEIGHTENGROB ;          * 12964

* #cols ->
* refs (1): 12900
BROADENHBUFF:
        :: HARDBUFF SWAP BROADENGROB ;           * 1297D

* (#n -> ) moves stk displ up #n lines
* refs (2): 39C11 43B4E
ScreenUpN:
        CON(5)  (*)+5                            * 12996  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 1299B
        GOSUB   SAVPTR~jump_8                    * 129A2
        A=A-1   A                                * 129A6
        D0=(5)  VDISP                            * 129A8
        C=DAT0  A                                * 129AF
        B=C     A                                * 129B2
        LC(5)   #00234                           * 129B4
        C=C+B   A                                * 129BB
        D0=C                                     * 129BD
        LC(5)   #00388                           * 129C0
        C=C+B   A                                * 129C7
        D1=C                                     * 129C9
        LC(1)   #6                               * 129CC
        D=C     A                                * 129CF
L_129D1:
        C=D     A                                * 129D1
        P=C     0                                * 129D3
L_129D7:
        C=DAT1  W                                * 129D7
        DAT0=C  W                                * 129DB
        D0=D0+  16                               * 129DF
        D1=D1+  16                               * 129E2
        C=DAT1  W                                * 129E5
        DAT0=C  W                                * 129E9
        D0=D0+  16                               * 129ED
        D1=D1+  16                               * 129F0
        C=DAT1  B                                * 129F3
        DAT0=C  B                                * 129F6
        D0=D0+  2                                * 129F9
        D1=D1+  2                                * 129FC
        P=P+1                                    * 129FF
        GONC    L_129D7                          * 12A01
        A=A-1   A                                * 12A04
        GONC    L_129D1                          * 12A06
        GOTO    L_1305A                          * 12A09

* moves stk displ up 1 line
ScreenUp:
        CON(5)  (*)+5                            * 12A0D  primitive code object
        GOSUB   SAVPTR~jump_8                    * 12A12
        C=0     A                                * 12A16
        LC(1)   #3                               * 12A18
        A=C     A                                * 12A1B
        D0=(5)  VDISP                            * 12A1D
        C=DAT0  A                                * 12A24
        B=C     A                                * 12A27
        LC(5)   #00234                           * 12A29
        C=C+B   A                                * 12A30
        D0=C                                     * 12A32
        LC(5)   #00344                           * 12A35
        C=C+B   A                                * 12A3C
        D1=C                                     * 12A3E
        LC(1)   #8                               * 12A41
        D=C     A                                * 12A44
        GOTO    L_129D1                          * 12A46

* (#n -> ) moves stk displ down #n lines
* refs (1): 43A81
ScreenDnN:
        CON(5)  (*)+5                            * 12A4A  primitive code object
        GOSBVL  POP#                             * 12A4F
        GOSUB   SAVPTR~jump_8                    * 12A56
        A=A-1   A                                * 12A5A
        B=A     A                                * 12A5C
        LC(5)   #00154                           * 12A5E
        D=0     A                                * 12A65
L_12A67:
        D=D+C   A                                * 12A67
        B=B-1   A                                * 12A69
        GONC    L_12A67                          * 12A6B
        D1=(5)  VDISP                            * 12A6E
        C=DAT1  A                                * 12A75
        B=C     A                                * 12A78
        LC(5)   #00234                           * 12A7A
        C=C+B   A                                * 12A81
        C=C+D   A                                * 12A83
        D1=C                                     * 12A85
        B=C     A                                * 12A88
        LC(5)   #00154                           * 12A8A
        B=B-C   A                                * 12A91
        C=B     A                                * 12A93
        D0=C                                     * 12A95
        LC(1)   #6                               * 12A98
        D=C     A                                * 12A9B
        LC(5)   #002A8                           * 12A9D
        R0=C                                     * 12AA4
L_12AA7:
        C=D     A                                * 12AA7
        P=C     0                                * 12AA9
L_12AAD:
        C=DAT0  W                                * 12AAD
        DAT1=C  W                                * 12AB1
        D0=D0+  16                               * 12AB5
        D1=D1+  16                               * 12AB8
        C=DAT0  W                                * 12ABB
        DAT1=C  W                                * 12ABF
        D0=D0+  16                               * 12AC3
        D1=D1+  16                               * 12AC6
        C=DAT0  B                                * 12AC9
        DAT1=C  B                                * 12ACC
        D0=D0+  2                                * 12ACF
        D1=D1+  2                                * 12AD2
        P=P+1                                    * 12AD5
        GONC    L_12AAD                          * 12AD7
        C=R0                                     * 12ADA
        AD0EX                                    * 12ADD
        A=A-C   A                                * 12AE0
        AD0EX                                    * 12AE2
        AD1EX                                    * 12AE5
        A=A-C   A                                * 12AE8
        AD1EX                                    * 12AEA
        A=A-1   A                                * 12AED
        GONC    L_12AA7                          * 12AEF
        GOTO    L_1305A                          * 12AF2

* moves stk displ down 1 line
ScreenDn:
        CON(5)  (*)+5                            * 12AF6  primitive code object
        GOSUB   SAVPTR~jump_8                    * 12AFB
        LA(5)   #00003                           * 12AFF
        B=A     A                                * 12B09
        LC(5)   #00110                           * 12B0B
        D=0     A                                * 12B12
L_12B14:
        D=D+C   A                                * 12B14
        B=B-1   A                                * 12B16
        GONC    L_12B14                          * 12B18
        D1=(5)  VDISP                            * 12B1B
        C=DAT1  A                                * 12B22
        B=C     A                                * 12B25
        LC(5)   #00234                           * 12B27
        C=C+B   A                                * 12B2E
        C=C+D   A                                * 12B30
        D1=C                                     * 12B32
        B=C     A                                * 12B35
        LC(5)   #00110                           * 12B37
        B=B-C   A                                * 12B3E
        C=B     A                                * 12B40
        D0=C                                     * 12B42
        LC(1)   #8                               * 12B45
        D=C     A                                * 12B48
        LC(5)   #00220                           * 12B4A
        R0=C                                     * 12B51
        GOTO    L_12AA7                          * 12B54
        RPL

* -> #width
* refs (1): 51712
HBUFFDIMw:
        :: HARDBUFF GROBDIMw ;                   * 12B58

* -> #height
* refs (2): 4E2D9 516B8
HARDHEIGHT:
        :: HARDBUFF GROBDIM DROP ;               * 12B6C

* $ ->
* refs (4): 4694B 6B902 6BA97 6BC3C
FlashMsg:
        :: Save16 SWAP DISPSTATUS2 BINT80 ZERO_DO SLOW LOOP Restore16 ; * 12B85

* grob #cols ->
* refs (2): 1298C 511CA
BROADENGROB:
        CON(5)  (*)+5                            * 12BB7  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 12BBC
        R4=A                                     * 12BC3
        ST=0    10                               * 12BC6
        GOSUB   SAVPTR~jump_8                    * 12BC9
L_12BCD:
        A=R4.F  A                                * 12BCD
        B=A     A                                * 12BD3
        C=DAT1  A                                * 12BD5
        D1=C                                     * 12BD8
        D1=D1+  15                               * 12BDB
        A=DAT1  A                                * 12BDE
        B=B+A   A                                * 12BE1
        GOC     L_12BF2                          * 12BE3
        LC(5)   #007FF                           * 12BE6
        ?B<=C   A                                * 12BED
        GOYES   L_12BF6                          * 12BF0
L_12BF2:
        GOTO    L_12D7E                          * 12BF2
L_12BF6:
        C=B     A                                * 12BF6
        R0=C.F  A                                * 12BF8
        GOSBVL  w->W                             * 12BFE
        R1=A.F  A                                * 12C05
        CAEX    A                                * 12C0B
        GOSBVL  w->W                             * 12C0D
        C=A-C   A                                * 12C14
        R2=C.F  A                                * 12C16
        ?C=0    A                                * 12C1C
        GOYES   L_12C34                          * 12C1F
        D1=D1-  5                                * 12C21
        A=DAT1  A                                * 12C24
        A=A-1   A                                * 12C27
        GONC    L_12C42                          * 12C29
        C=0     A                                * 12C2C
        R0=C.F  A                                * 12C2E
L_12C34:
        R4=C.F  A                                * 12C34
        GOSUB   SUB_12D85                        * 12C3A
        GOTO    L_12F85                          * 12C3E
L_12C42:
        R3=A.F  A                                * 12C42
        B=C     A                                * 12C48
        C=0     A                                * 12C4A
L_12C4C:
        C=C+B   A                                * 12C4C
        GOC     L_12BF2                          * 12C4E
        A=A-1   A                                * 12C51
        GONC    L_12C4C                          * 12C53
        D1=D1-  5                                * 12C56
        A=DAT1  A                                * 12C59
        B=A     A                                * 12C5C
        AD1EX                                    * 12C5E
        A=A+B   A                                * 12C61
        B=A     A                                * 12C63
        RSTK=C                                   * 12C65
        GOSBVL  MOVERSU                          * 12C67
        C=RSTK                                   * 12C6E
        GONC    L_12C7B                          * 12C70
        GOSUB   SUB_12D68                        * 12C73
        GOTO    L_12BCD                          * 12C77
L_12C7B:
        R4=C.F  A                                * 12C7B
        C=C+B   A                                * 12C81
        A=R2.F  A                                * 12C83
        C=C-A   A                                * 12C89
        D1=C                                     * 12C8B
        C=A     A                                * 12C8E
        D=C     A                                * 12C90
        A=R1.F  A                                * 12C92
        ABEX    A                                * 12C98
        D0=A                                     * 12C9A
        C=R3.F  A                                * 12C9D
L_12CA3:
        RSTK=C                                   * 12CA3
        C=D     A                                * 12CA5
        GOSBVL  WIPEOUT                          * 12CA7
        CD1EX                                    * 12CAE
        C=C-D   A                                * 12CB1
        D1=C                                     * 12CB3
        C=B     A                                * 12CB6
        GOSBVL  MOVEUP                           * 12CB8
        CD1EX                                    * 12CBF
        C=C-D   A                                * 12CC2
        D1=C                                     * 12CC4
        C=RSTK                                   * 12CC7
        C=C-1   A                                * 12CC9
        GONC    L_12CA3                          * 12CCB
        GOSUB   SUB_12D85                        * 12CCE
        CD1EX                                    * 12CD2
        D0=(5)  VDISP                            * 12CD5
        A=DAT0  A                                * 12CDC
        ?C=A    A                                * 12CDF
        GOYES   L_12D16                          * 12CE2
        D0=(5)  SAVE_OFFSET                      * 12CE4
        A=0     W                                * 12CEB
        A=DAT0  A                                * 12CEE
        GOSUB   SUB_12DB1                        * 12CF1
        A=DAT0  A                                * 12CF5
        A=A+C   A                                * 12CF8
        DAT0=A  A                                * 12CFA
        D0=(5)  SAVE_LN                          * 12CFD
        A=DAT0  X                                * 12D04
        C=R2                                     * 12D08
        A=A+C   X                                * 12D0B
        DAT0=A  X                                * 12D0E
        GOTO    L_12F85                          * 12D12
L_12D16:
        LC(5)   #00014                           * 12D16
        C=C+A   A                                * 12D1D
        D0=(5)  DISP1CTLg                        * 12D1F
        A=0     W                                * 12D26
        A=DAT0  A                                * 12D29
        A=A-C   A                                * 12D2C
        GOSUB   SUB_12DB1                        * 12D2E
        A=DAT0  A                                * 12D32
        A=A+C   A                                * 12D35
        DAT0=A  A                                * 12D37
        D0=(5)  DISPADDR                         * 12D3A
        DAT0=A  A                                * 12D41
        D0=(5)  LINENIBSg                        * 12D44
        A=DAT0  X                                * 12D4B
        C=R2                                     * 12D4F
        A=A+C   X                                * 12D52
        DAT0=A  X                                * 12D55
        D0=(5)  LINEOFFS                         * 12D59
        DAT0=A  X                                * 12D60
        GOTO    L_12F02                          * 12D64

* refs (7): 12C73 12E39 40C64 44520 446DC 5427E ...
SUB_12D68:
        ?ST=1   10                               * 12D68
        GOYES   L_12D7E                          * 12D6B
        GOSBVL  GARBAGECOL                       * 12D6D  inline data follows
        ST=1    10                               * 12D74
        GOVLNG  GETPTR                           * 12D77
L_12D7E:
        GOVLNG  GPMEMERR                         * 12D7E

* refs (2): 12C3A 12CCE
SUB_12D85:
        GOSUB   GETPTR~jump_4                    * 12D85
        C=DAT1  A                                * 12D89
        D1=C                                     * 12D8C
        D1=D1+  5                                * 12D8F
        C=DAT1  A                                * 12D92
        A=R4.F  A                                * 12D95
        A=A+C   A                                * 12D9B
        DAT1=A  A                                * 12D9D
        D1=D1+  10                               * 12DA0
        A=R0.F  A                                * 12DA3
        DAT1=A  A                                * 12DA9
        D1=D1-  15                               * 12DAC
        RTNCC                                    * 12DAF

* refs (2): 12CF1 12D2E
SUB_12DB1:
        C=0     W                                * 12DB1
        C=R1.F  A                                * 12DB4
        GOSBVL  IntDivW                          * 12DBA
        C=0     W                                * 12DC1
        C=R2.F  A                                * 12DC4
        GOVLNG  SUB_0DB9B                        * 12DCA

* grob #rows ->
* refs (2): 12973 51201
HEIGHTENGROB:
        CON(5)  (*)+5                            * 12DD1  primitive code object
        GOSBVL  POP#                             * 12DD6
        R4=A.F  A                                * 12DDD
        ST=0    10                               * 12DE3
        GOSUB   SAVPTR~jump_8                    * 12DE6
L_12DEA:
        B=A     A                                * 12DEA
        C=DAT1  A                                * 12DEC
        D1=C                                     * 12DEF
        D1=D1+  15                               * 12DF2
        A=DAT1  A                                * 12DF5
        ?A#0    A                                * 12DF8
        GOYES   L_12E01                          * 12DFB
        GOTO    L_12F85                          * 12DFD
L_12E01:
        GOSBVL  w->W                             * 12E01
        C=0     A                                * 12E08
        B=B-1   A                                * 12E0A
        GONC    L_12E13                          * 12E0C
        GOTO    L_12E57                          * 12E0F
L_12E13:
        C=C+A   A                                * 12E13
        B=B-1   A                                * 12E15
        GONC    L_12E13                          * 12E17
        D1=D1-  10                               * 12E1A
        A=DAT1  A                                * 12E1D
        CD1EX                                    * 12E20
        C=C+A   A                                * 12E23
        CD1EX                                    * 12E25
        RSTK=C                                   * 12E28
        AD1EX                                    * 12E2A
        GOSBVL  MOVERSU                          * 12E2D
        C=RSTK                                   * 12E34
        GONC    L_12E49                          * 12E36
        GOSUBL  SUB_12D68                        * 12E39
        A=R4.F  A                                * 12E3F
        GOTO    L_12DEA                          * 12E45
L_12E49:
        A=B     A                                * 12E49
        D1=A                                     * 12E4B
        RSTK=C                                   * 12E4E
        GOSBVL  WIPEOUT                          * 12E50
L_12E57:
        GOSUB   GETPTR~jump_4                    * 12E57
        C=RSTK                                   * 12E5B
        A=DAT1  A                                * 12E5D
        AD1EX                                    * 12E60
        R0=A.F  A                                * 12E63
        D1=D1+  5                                * 12E69
        A=DAT1  A                                * 12E6C
        A=A+C   A                                * 12E6F
        DAT1=A  A                                * 12E71
        D1=D1+  5                                * 12E74
        C=DAT1  A                                * 12E77
        A=R4.F  A                                * 12E7A
        A=A+C   A                                * 12E80
        DAT1=A  A                                * 12E82
        GOTO    L_12F02                          * 12E85

* refs (1): 12FA3
StoCurGrob(go):
        CON(5)  (*)+5                            * 12E89  primitive code object
        LC(5)   VDISP                            * 12E8E
        GOSUB   SUB_12FC0                        * 12E95
        D0=(5)  VDISP                            * 12E99
        C=DAT0  A                                * 12EA0
        D0=C                                     * 12EA3
        D0=D0+  15                               * 12EA6
        A=DAT0  A                                * 12EA9
        D0=D0+  5                                * 12EAC
        GOSBVL  w->W                             * 12EAF
        LC(5)   #00022                           * 12EB6
        A=A-C   A                                * 12EBD
        D1=(5)  LINENIBSg                        * 12EBF
        DAT1=A  X                                * 12EC6
        D1=(5)  LINEOFFS                         * 12ECA
        DAT1=A  X                                * 12ED1
        CD0EX                                    * 12ED5
        D1=(5)  DISP1CTLg                        * 12ED8
        DAT1=C  A                                * 12EDF
        D1=(5)  DISPADDR                         * 12EE2
        DAT1=C  A                                * 12EE9
        D1=(5)  DISPIO                           * 12EEC
        A=DAT1  1                                * 12EF3
        LC(1)   #8                               * 12EF7
        A=A&C   P                                * 12EFA
        DAT1=A  1                                * 12EFE
L_12F02:
        GOSUB   disprange                        * 12F02
        GOTO    L_12F85                          * 12F06

* refs (1): 12FA8
StoNoCurGrob(go):
        CON(5)  (*)+5                            * 12F0A  primitive code object
        LC(5)   VDISP3                           * 12F0F
        GOSUB   SUB_12FC0                        * 12F16
        D0=(5)  VDISP3                           * 12F1A
        C=DAT0  A                                * 12F21
        D0=C                                     * 12F24
        D0=D0+  15                               * 12F27
        A=DAT0  A                                * 12F2A
        GOSBVL  w->W                             * 12F2D
        LC(5)   #00022                           * 12F34
        A=A-C   A                                * 12F3B
        D1=(5)  SAVE_LN                          * 12F3D
        DAT1=A  X                                * 12F44
        C=0     A                                * 12F48
        D1=(5)  SAVE_OFFSET                      * 12F4A
        DAT1=C  A                                * 12F51
        D1=(5)  DISPIO                           * 12F54
        A=DAT1  1                                * 12F5B
        LC(1)   #8                               * 12F5F
        A=A&C   P                                * 12F62
        D1=(5)  SAVE_BO                          * 12F66
        DAT1=A  1                                * 12F6D
        D1=(5)  LINECOUNTg                       * 12F71
        A=DAT1  B                                * 12F78
        D1=(5)  SAVE_LC                          * 12F7B
        DAT1=A  B                                * 12F82
L_12F85:
        GOSUB   GETPTR~jump_4                    * 12F85
        D1=D1+  5                                * 12F89
        D=D+1   A                                * 12F8C
        GOLONG  L_137D2                          * 12F8E
        RPL

* grob ->
* refs (5): 4B35A 4F3B3 5119D 9D513 9D5F2
GROB>GDISP:
        :: GDISPON? ITE StoCurGrob(go) StoNoCurGrob(go) * 12F94
        ;                                        * 12FAD
        ASSEMBLE

* refs (22): 128C4 128ED 129A2 12A12 12A56 12AFB ...
SAVPTR~jump_8:
        GOVLNG  SAVPTR                           * 12FB2

* refs (5): 12D85 12E57 12F85 12FD5 1301A
GETPTR~jump_4:
        GOVLNG  GETPTR                           * 12FB9

* refs (2): 12E95 12F16
SUB_12FC0:
        R0=C.F  A                                * 12FC0
        GOSUB   SAVPTR~jump_8                    * 12FC6
        GOSUB   SUB_13075                        * 12FCA
        GOSBVL  GARBAGECOL                       * 12FCE  inline data follows
        GOSUB   GETPTR~jump_4                    * 12FD5
        A=DAT1  A                                * 12FD9
        R1=A.F  A                                * 12FDC
        A=R0.F  A                                * 12FE2
        D1=A                                     * 12FE8
        A=DAT1  A                                * 12FEB
        LC(5)   #00014                           * 12FEE
        A=A+C   A                                * 12FF5
        C=R1.F  A                                * 12FF7
        D1=C                                     * 12FFD
        D1=D1+  5                                * 13000
        C=DAT1  A                                * 13003
        C=C-CON A,15                             * 13006
        GOSBVL  MOVERSU                          * 1300C
        GONC    L_1301A                          * 13013
        GOTO    L_12D7E                          * 13016
L_1301A:
        GOSUB   GETPTR~jump_4                    * 1301A
        C=DAT1  A                                * 1301E
        D0=C                                     * 13021
        C=R0.F  A                                * 13024
        D1=C                                     * 1302A
        C=DAT1  A                                * 1302D
        D1=C                                     * 13030
        D1=D1+  5                                * 13033
        D0=D0+  5                                * 13036
        C=DAT0  A                                * 13039
        GOVLNG  MOVEDOWN                         * 1303C

* ->
* refs (1): 17DCB
KILLADISP:
        CON(5)  (*)+5                            * 13043  primitive code object
        GOSUB   SAVPTR~jump_8                    * 13048
        LC(5)   VDISP3                           * 1304C
L_13053:
        R0=C                                     * 13053
        GOSUB   SUB_13075                        * 13056
L_1305A:
        GOVLNG  GETPTRLOOP                       * 1305A

* ->
* refs (5): 20F99 4B350 4F3A9 9D4F5 9D5D4
KILLGDISP:
        CON(5)  (*)+5                            * 13061  primitive code object
        GOSUB   SAVPTR~jump_8                    * 13066
        LC(5)   GDISP                            * 1306A
        GOTO    L_13053                          * 13071

* refs (2): 12FCA 13056
SUB_13075:
        C=R0.F  A                                * 13075
        D1=C                                     * 1307B
        A=DAT1  A                                * 1307E
        D1=A                                     * 13081
        D1=D1+  5                                * 13084
        A=DAT1  A                                * 13087
        C=0     W                                * 1308A
        C=C-1   P                                * 1308D
        A=A-C   A                                * 13090
        ?A=0    A                                * 13092
        RTNYES                                   * 13095
        DAT1=C  15                               * 13097
        D1=D1+  15                               * 1309B
        CD1EX                                    * 1309E
        CAEX    A                                * 130A1
        A=A+C   A                                * 130A3
        GOVLNG  MOVERSD                          * 130A5
        RPL

* ->
* refs (10): 17B9A 492B6 6A905 6AE47 6B219 6C913 ...
RECLAIMDISP:
        :: TOADISP CLEARVDISP REDISPHBUFF RSZVDISP ; * 130AC

* ->
* refs (1): 130C0
RSZVDISP:
        CON(5)  (*)+5                            * 130CA  primitive code object
        ASSEMBLE
        GOSUB   SAVPTR~jump_8                    * 130CF
        LC(5)   VDISP                            * 130D3
        NOP4                                     * 130DA
        A=0     A                                * 130DE
        D1=(5)  LINENIBSg                        * 130E0
        DAT1=A  X                                * 130E7
        D1=(5)  LINEOFFS                         * 130EB
        DAT1=A  X                                * 130F2
        D1=C                                     * 130F6
        A=DAT1  A                                * 130F9
        D1=A                                     * 130FC
        D1=D1+  5                                * 130FF
        A=DAT1  A                                * 13102
        LC(15)  #00083000380077F                 * 13105
        ?C>=A   A                                * 13116
        GOYES   L_13161                          * 13119
        B=A     A                                * 1311B
        A=A-C   A                                * 1311D
        DAT1=C  15                               * 1311F
        CD1EX                                    * 13123
        CAEX    A                                * 13126
        A=A+B   A                                * 13128
        GOSBVL  MOVERSD                          * 1312A
        GOTO    L_13218                          * 13131

* ->
* refs (4): 47D7F 4CF32 4F093 C0A90
TOGDISP:
        CON(5)  (*)+5                            * 13135  primitive code object
        GOSUB   SAVPTR~jump_8                    * 1313A
        GOSUB   SUB_13197                        * 1313E
        GOC     L_13161                          * 13142
        GOSUB   SUB_132C5                        * 13145
        GOTO    L_1305A                          * 13149

* ->
* refs (31): 130B1 19CCC 2DDF1 2EB1E 387A0 38912 ...
TOADISP:
        CON(5)  (*)+5                            * 1314D  primitive code object
        GOSUB   SAVPTR~jump_8                    * 13152
        GOSUB   SUB_13197                        * 13156
        GONC    L_13161                          * 1315A
        GOSUB   SUB_132C5                        * 1315D
L_13161:
        GOLONG  L_1305A                          * 13161

* -> flag
* refs (3): 12F99 4E2B6 9DDF7
GDISPON?:
        CON(5)  (*)+5                            * 13167  primitive code object
        CD1EX                                    * 1316C
        R0=C                                     * 1316F
        GOSUB   SUB_13197                        * 13172
        C=R0                                     * 13176
        CD1EX                                    * 13179
        GOC     L_1318C                          * 1317C
        LC(5)   FALSE                            * 1317F
L_13186:
        A=C     A                                * 13186
        PC=(A)                                   * 13188
L_1318C:
        LC(5)   TRUE                             * 1318C
        GOTO    L_13186                          * 13193

* refs (3): 1313E 13156 13172
SUB_13197:
        D1=(5)  GDISP                            * 13197
        C=DAT1  A                                * 1319E
        D1=(5)  VDISP                            * 131A1
        A=DAT1  A                                * 131A8
        ?C=A    A                                * 131AB
        RTNYES                                   * 131AE
        D1=(5)  VDISP3                           * 131B0
        A=DAT1  A                                * 131B7
        ?C#A    A                                * 131BA
        GOYES   L_131C1                          * 131BD
        RTN                                      * 131BF
L_131C1:
        GOVLNG  Warmstart                        * 131C1

* ->
* refs (4): 4824C 4D146 4D41B 4DD00
WINDOWUP:
        CON(5)  (*)+5                            * 131C8  primitive code object
        GOSUB   SAVPTR~jump_8                    * 131CD
        D0=(5)  VDISP                            * 131D1
        A=DAT0  A                                * 131D8
        LC(5)   #00014                           * 131DB
        C=C+A   A                                * 131E2
        D0=C                                     * 131E4
        RSTK=C                                   * 131E7
        D0=D0-  5                                * 131E9
        A=DAT0  A                                * 131EC
        GOSBVL  w->W                             * 131EF
        D0=(5)  DISP1CTLg                        * 131F6
        C=DAT0  A                                * 131FD
        C=C-A   A                                * 13200
        A=C     A                                * 13202
        C=RSTK                                   * 13204
        ?C>A    A                                * 13206
        GOYES   L_13218                          * 13209
L_1320B:
        DAT0=A  A                                * 1320B
        D0=(5)  DISPADDR                         * 1320E
        DAT0=A  A                                * 13215
L_13218:
        GOSUB   disprange                        * 13218
        GOTO    L_1305A                          * 1321C

* ->
* refs (4): 481ED 4D182 4D736 4DD87
WINDOWDOWN:
        CON(5)  (*)+5                            * 13220  primitive code object
        GOSUB   SAVPTR~jump_8                    * 13225
        D0=(5)  VDISP                            * 13229
        A=DAT0  A                                * 13230
        D0=A                                     * 13233
        D0=D0+  5                                * 13236
        C=DAT0  A                                * 13239
        AD0EX                                    * 1323C
        C=C+A   A                                * 1323F
        B=C     A                                * 13241
        D0=A                                     * 13243
        D0=D0+  10                               * 13246
        A=DAT0  A                                * 13249
        GOSBVL  w->W                             * 1324C
        D0=(5)  LINECOUNTg                       * 13253
        LC(2)   #37                              * 1325A
        D=C     B                                * 1325E
        C=0     A                                * 13261
        C=DAT0  B                                * 13263
        CBIT=0  6                                * 13266
        CBIT=0  7                                * 1326B
        ?D=C    B                                * 13270
        GOYES   L_13283                          * 13273
        D=C     A                                * 13275
        C=0     A                                * 13277
L_13279:
        C=C+A   A                                * 13279
        D=D-1   A                                * 1327B
        GONC    L_13279                          * 1327D
        GOC     L_13295                          * 13280
L_13283:
        C=A     A                                * 13283
        C=C+C   A                                * 13285
        C=C+C   A                                * 13287
        C=C+C   A                                * 13289
        D=C     A                                * 1328B
        C=C+C   A                                * 1328D
        C=C+C   A                                * 1328F
        C=C+C   A                                * 13291
        C=C-D   A                                * 13293
L_13295:
        D=C     A                                * 13295
        D0=(5)  DISP1CTLg                        * 13297
        C=DAT0  A                                * 1329E
        D=D+C   A                                * 132A1
        LC(5)   #00022                           * 132A3
        C=C+D   A                                * 132AA
        ?B>=C   A                                * 132AC
        GOYES   L_132B5                          * 132AF
        GOTO    L_13218                          * 132B1
L_132B5:
        D0=(5)  DISP1CTLg                        * 132B5
        C=DAT0  A                                * 132BC
        A=A+C   A                                * 132BF
        GOTO    L_1320B                          * 132C1

* refs (2): 13145 1315D
SUB_132C5:
        P=      0                                * 132C5
        SETHEX                                   * 132C7
        D0=(5)  VDISP                            * 132C9
        A=DAT0  A                                * 132D0
        LC(5)   #00014                           * 132D3
        A=A+C   A                                * 132DA
        D0=(5)  DISP1CTLg                        * 132DC
        C=DAT0  A                                * 132E3
        C=C-A   A                                * 132E6
        GONC    L_132ED                          * 132E8
        C=0     A                                * 132EB
L_132ED:
        D1=(5)  SAVE_OFFSET                      * 132ED
        A=DAT1  A                                * 132F4
        B=A     A                                * 132F7
        DAT1=C  A                                * 132F9
        D1=(5)  VDISP                            * 132FC
        D0=(5)  VDISP3                           * 13303
        C=DAT1  A                                * 1330A
        A=DAT0  A                                * 1330D
        DAT1=A  A                                * 13310
        DAT0=C  A                                * 13313
        D1=(5)  LINECOUNTg                       * 13316
        D0=(5)  SAVE_LC                          * 1331D
        C=DAT1  B                                * 13324
        A=DAT0  B                                * 13327
        DAT1=A  B                                * 1332A
        D1=(5)  LINECOUNT                        * 1332D
        DAT1=A  B                                * 13334
        DAT0=C  B                                * 13337
        D1=(2)  #00                              * 1333A
        D0=(5)  SAVE_BO                          * 1333E
        C=DAT1  1                                * 13345
        A=DAT0  1                                * 13349
        DAT1=A  1                                * 1334D
        DAT0=C  1                                * 13351
        D1=(5)  LINENIBSg                        * 13355
        D0=(5)  SAVE_LN                          * 1335C
        C=DAT1  X                                * 13363
        A=DAT0  X                                * 13367
        DAT1=A  X                                * 1336B
        D1=(5)  LINEOFFS                         * 1336F
        DAT1=A  X                                * 13376
        DAT0=C  X                                * 1337A
        D0=(5)  VDISP                            * 1337E
        A=DAT0  A                                * 13385
        P=      0                                * 13388
        LC(5)   #00014                           * 1338A
        SETHEX                                   * 13391
        A=A+C   A                                * 13393
        A=A+B   A                                * 13395
        D1=(5)  DISP1CTLg                        * 13397
        DAT1=A  A                                * 1339E
        D1=(5)  DISPADDR                         * 133A1
        DAT1=A  A                                * 133A8

* refs (6): 01CE3 0B3FC 12F02 13218 137B2 4E3BC
disprange:
        SETHEX                                   * 133AB
        P=      0                                * 133AD
        GOSBVL  D1=IRAM                          * 133AF
        D1=(4)  #0692                            * 133B6
        C=0     W                                * 133BC
        C=DAT1  X                                * 133BF
        CBIT=0  0                                * 133C3
        ?CBIT=0 11                               * 133C8
        GOYES   L_133D5                          * 133CD
        C=-C    W                                * 133CF
        C=-C    X                                * 133D2
L_133D5:
        A=C     W                                * 133D5
        D1=(4)  #069A                            * 133D8
        C=0     W                                * 133DE
        C=DAT1  B                                * 133E1
        CBIT=0  6                                * 133E4
        CBIT=0  7                                * 133E9
        B=C     W                                * 133EE
        LC(2)   #3F                              * 133F1
        ST=0    3                                * 133F5
        ?B<C    A                                * 133F8
        GOYES   L_13400                          * 133FB
        ST=1    3                                * 133FD
L_13400:
        D0=(5)  DISPIO                           * 13400
        C=0     W                                * 13407
        C=DAT0  1                                * 1340A
        CBIT=0  3                                * 1340E
        ?CBIT=1 2                                * 13413
        GOYES   L_1341A                          * 13418
L_1341A:
        LC(2)   #22                              * 1341A
        GONC    L_13425                          * 1341E
        NIBHEX  3142                             * 13421  .$
L_13425:
        D=C     A                                * 13425
        C=C+A   W                                * 13427
        A=B     W                                * 1342A
        A=A+1   W                                * 1342D
        GOSBVL  SUB_0DB9B                        * 13430
        D1=(4)  #068D                            * 13437
        A=DAT1  A                                * 1343D
        C=C+A   A                                * 13440
        ?C>=A   A                                * 13442
        GOYES   L_13449                          * 13445
        A=C     A                                * 13447
L_13449:
        RSTK=C                                   * 13449
        ?ST=1   3                                * 1344B
        GOYES   L_13460                          * 1344E
        D1=(4)  #0695                            * 13450
        C=DAT1  A                                * 13456
        ?C>=A   A                                * 13459
        GOYES   L_13460                          * 1345C
        A=C     A                                * 1345E
L_13460:
        D1=(4)  #0645                            * 13460
        DAT1=A  A                                * 13466
        C=RSTK                                   * 13469
        CAEX    A                                * 1346B
        RSTK=C                                   * 1346D
        D1=(4)  #068D                            * 1346F
        C=DAT1  A                                * 13475
        C=C+D   A                                * 13478
        ?C<A    A                                * 1347A
        GOYES   L_13481                          * 1347D
        A=C     A                                * 1347F
L_13481:
        ?ST=1   3                                * 13481
        GOYES   L_134A1                          * 13484
        LC(5)   #00110                           * 13486
        B=C     A                                * 1348D
        D1=(4)  #0695                            * 1348F
        C=DAT1  A                                * 13495
        C=C+B   A                                * 13498
        ?C<A    A                                * 1349A
        GOYES   L_134A1                          * 1349D
        A=C     A                                * 1349F
L_134A1:
        D1=(4)  #064A                            * 134A1
        DAT1=A  A                                * 134A7
        C=RSTK                                   * 134AA
        RTNCC                                    * 134AC

* ->
* refs (8): 130B6 2DA6D 69CF7 6A154 6AAEB 6B4A7 ...
CLEARVDISP:
        CON(5)  (*)+5                            * 134AE  primitive code object
        LA(5)   VDISP                            * 134B3
        GOSUB   SAVPTR~jump_8                    * 134BD
        D1=A                                     * 134C1
        A=DAT1  A                                * 134C4
        D1=A                                     * 134C7
        D1=D1+  5                                * 134CA
        C=DAT1  A                                * 134CD
        C=C-CON A,15                             * 134D0
        D1=D1+  15                               * 134D6
        GOSBVL  WIPEOUT                          * 134D9
        GOTO    L_1305A                          * 134E0

* ->
* refs (4): 470F8 48832 4D164 4DDC3
WINDOWLEFT:
        CON(5)  (*)+5                            * 134E4  primitive code object
        GOSUB   SAVPTR~jump_8                    * 134E9
        D0=(5)  DISPIO                           * 134ED
        A=DAT0  1                                * 134F4
        B=A     A                                * 134F8
        LC(1)   #8                               * 134FA
        B=B&C   P                                * 134FD
        ABIT=0  3                                * 13501
        A=A-1   P                                * 13506
        GOC     L_13530                          * 13509
        LC(1)   #3                               * 1350C
        ?C=A    P                                * 1350F
        GOYES   L_13520                          * 13512
        A=A!B   P                                * 13514
        DAT0=A  1                                * 13518
        GOTO    L_13602                          * 1351C
L_13520:
        A=A!B   P                                * 13520
        DAT0=A  1                                * 13524
        GOSUB   SUB_13642                        * 13528
        GOTO    L_13602                          * 1352C
L_13530:
        GOSUB   SUB_13606                        * 13530
        C=0     W                                * 13534
        C=R0.F  A                                * 13537
        GOSBVL  IntDivW                          * 1353D
        ?B#0    W                                * 13544
        GOYES   L_1354D                          * 13547
        GOTO    L_1305A                          * 13549
L_1354D:
        A=R1                                     * 1354D
        A=A-1   A                                * 13550
        A=A-1   A                                * 13552
        DAT0=A  A                                * 13554
        D0=(5)  DISPADDR                         * 13557
        DAT0=A  A                                * 1355E
        D0=(5)  DISPIO                           * 13561
        A=DAT0  1                                * 13568
        LC(1)   #7                               * 1356C
        A=A!C   P                                * 1356F
        DAT0=A  1                                * 13573
        GOSUB   SUB_13657                        * 13577
        GOTO    L_13602                          * 1357B

* ->
* refs (4): 470C6 48440 4D1A0 4DDFA
WINDOWRIGHT:
        CON(5)  (*)+5                            * 1357F  primitive code object
        GOSUB   SAVPTR~jump_8                    * 13584
        GOSUB   corner                           * 13588
        B=B-C   A                                * 1358C
        C=0     A                                * 1358E
        LC(2)   #83                              * 13590
        ?B>C    A                                * 13594
        GOYES   L_1359D                          * 13597
        GOTO    L_1305A                          * 13599
L_1359D:
        C=D     A                                * 1359D
        A=C     A                                * 1359F
        B=A     A                                * 135A1
        LC(1)   #8                               * 135A3
        B=B&C   P                                * 135A6
        ABIT=0  3                                * 135AA
        LC(1)   #7                               * 135AF
        ?C=A    P                                * 135B2
        GOYES   L_135DD                          * 135B5
        A=A+1   A                                * 135B7
        LC(1)   #4                               * 135B9
        ?C=A    P                                * 135BC
        GOYES   L_135CD                          * 135BF
        A=A!B   P                                * 135C1
        DAT0=A  1                                * 135C5
        GOTO    L_13602                          * 135C9
L_135CD:
        A=A!B   P                                * 135CD
        DAT0=A  1                                * 135D1
        GOSUB   SUB_13657                        * 135D5
        GOTO    L_13602                          * 135D9
L_135DD:
        A=B     A                                * 135DD
        DAT0=A  1                                * 135DF
        D0=(5)  DISP1CTLg                        * 135E3
        A=DAT0  A                                * 135EA
        A=A+1   A                                * 135ED
        A=A+1   A                                * 135EF
        DAT0=A  A                                * 135F1
        D0=(5)  DISPADDR                         * 135F4
        DAT0=A  A                                * 135FB
        GOSUB   SUB_13642                        * 135FE
L_13602:
        GOTO    L_13218                          * 13602

* refs (2): 13530 137DC
SUB_13606:
        D0=(5)  VDISP                            * 13606
        C=DAT0  A                                * 1360D
        D0=C                                     * 13610
        D0=D0+  15                               * 13613
        A=0     W                                * 13616
        A=DAT0  A                                * 13619
        B=A     A                                * 1361C
        GOSBVL  w->W                             * 1361E
        R0=A                                     * 13625
        D0=D0+  5                                * 13628
        CD0EX                                    * 1362B
        D0=(5)  DISP1CTLg                        * 1362E
        A=0     W                                * 13635
        A=DAT0  A                                * 13638
        R1=A                                     * 1363B
        A=A-C   A                                * 1363E
        RTN                                      * 13640

* refs (2): 13528 135FE
SUB_13642:
        D0=(5)  LINENIBSg                        * 13642
        A=DAT0  X                                * 13649
        A=A+1   X                                * 1364D
        A=A+1   X                                * 13650
        GOTO    L_13668                          * 13653

* refs (2): 13577 135D5
SUB_13657:
        D0=(5)  LINENIBSg                        * 13657
        A=DAT0  X                                * 1365E
        A=A-1   X                                * 13662
        A=A-1   X                                * 13665
L_13668:
        DAT0=A  X                                * 13668
        D0=(5)  LINEOFFS                         * 1366C
        DAT0=A  X                                * 13673
        RTN                                      * 13677

* #y #x ->
* refs (15): 4CF37 4E324 4F09D 516A4 516DB 516F9 ...
WINDOWXY:
        CON(5)  (*)+5                            * 13679  primitive code object
        GOSBVL  POP2#                            * 1367E
        RSTK=C                                   * 13685
        GOSUB   SAVPTR~jump_8                    * 13687
        C=RSTK                                   * 1368B
        GOSUB   WindowXY                         * 1368D
        GOTO    L_1305A                          * 13691

* ->
* refs (9): 130BB 2DDF6 2EB23 387A5 69CFC 6B4CA ...
REDISPHBUFF:
        CON(5)  (*)+5                            * 13695  primitive code object
        GOSUB   SAVPTR~jump_8                    * 1369A
        A=0     A                                * 1369E
        C=0     A                                * 136A0
        GOSUB   WindowXY                         * 136A2
        GOTO    L_1305A                          * 136A6

* refs (2): 1368D 136A2
WindowXY:
        RSTK=C                                   * 136AA

addrLINECNTg:
        D0=(5)  LINECOUNTg                       * 136AC
        C=0     A                                * 136B3
        C=DAT0  B                                * 136B5
        CBIT=0  6                                * 136B8
        CBIT=0  7                                * 136BD
        C=C+A   A                                * 136C2
        C=C+1   A                                * 136C4
        B=C     A                                * 136C6
        D0=(5)  VDISP                            * 136C8
        C=DAT0  A                                * 136CF
        D0=C                                     * 136D2
        D0=D0+  10                               * 136D5
        C=DAT0  A                                * 136D8
        ?B>C    A                                * 136DB
        GOYES   L_136FB                          * 136DE
        C=RSTK                                   * 136E0
        CAEX    A                                * 136E2
        RSTK=C                                   * 136E4
        C=0     A                                * 136E6
        LC(2)   #83                              * 136E8
        C=C+A   A                                * 136EC
        B=C     A                                * 136EE
        D0=D0+  5                                * 136F0
        C=DAT0  A                                * 136F3
        ?B<=C   A                                * 136F6
        GOYES   L_136FF                          * 136F9
L_136FB:
        C=RSTK                                   * 136FB
        RTNSC                                    * 136FD
L_136FF:
        CAEX    A                                * 136FF
        GOSBVL  w->W                             * 13701
        R0=A                                     * 13708
        A=C     A                                * 1370B
        ASRB.F  A                                * 1370D
        ASRB.F  A                                * 13712
        ASRB.F  A                                * 13717
        CBIT=0  3                                * 1371C
        B=C     A                                * 13721
        AR0EX                                    * 13723
        ?CBIT=1 2                                * 13726
        GOYES   L_1372D                          * 1372B
L_1372D:
        C=0     A                                * 1372D
        LC(2)   #22                              * 1372F
        GONC    L_1373A                          * 13733
        NIBHEX  3142                             * 13736  .$
L_1373A:
        C=A-C   A                                * 1373A
        D0=(5)  LINEOFFS                         * 1373C
        DAT0=C  X                                * 13743
        D0=(5)  LINENIBSg                        * 13747
        DAT0=C  X                                * 1374E
        AR0EX                                    * 13752
        D0=(5)  DISPIO                           * 13755
        C=DAT0  1                                * 1375C
        D=C     A                                * 13760
        LC(1)   #8                               * 13762
        C=C&D   P                                * 13765
        C=C!B   P                                * 13769
        DAT0=C  1                                * 1376D
        A=A+A   A                                * 13771
        AR0EX                                    * 13773
        C=RSTK                                   * 13776
        B=0     A                                * 13778
        GOTO    L_13780                          * 1377A
L_1377E:
        B=B+A   A                                * 1377E
L_13780:
        C=C-1   A                                * 13780
        GONC    L_1377E                          * 13782
        A=R0                                     * 13785
        A=A+B   A                                * 13788
        D0=(5)  VDISP                            * 1378A
        C=DAT0  A                                * 13791
        A=A+C   A                                * 13794
        C=0     A                                * 13796
        LC(2)   #14                              * 13798
        A=A+C   A                                * 1379C
        D0=(5)  DISPADDR                         * 1379E
        DAT0=A  A                                * 137A5
        D0=(5)  DISP1CTLg                        * 137A8
        DAT0=A  A                                * 137AF
        GOTO    disprange                        * 137B2

* -> #y #x
* refs (10): 0E132 49F65 4D1FA 4E2E3 515A5 515FF ...
WINDOWCORNER:
        CON(5)  (*)+5                            * 137B6  primitive code object
        GOSUBL  SAVPTR~jump_8                    * 137BB
        GOSUB   corner                           * 137C1
        R1=C                                     * 137C5
        R0=A                                     * 137C8
        GOSBVL  PUSH2#                           * 137CB
L_137D2:
        A=DAT0  A                                * 137D2
        D0=D0+  5                                * 137D5
        PC=(A)                                   * 137D8

* refs (2): 13588 137C1
corner:
        GOSUB   SUB_13606                        * 137DC
        C=B     A                                * 137E0
        RSTK=C                                   * 137E2
        C=R0                                     * 137E4
        GOSBVL  IntDivW                          * 137E7
        B=B+B   A                                * 137EE
        B=B+B   A                                * 137F0
        D0=(5)  DISPIO                           * 137F2
        C=0     A                                * 137F9
        C=DAT0  1                                * 137FB
        D=C     P                                * 137FF
        CBIT=0  3                                * 13802
        B=B+C   A                                * 13807
        C=RSTK                                   * 13809
        BCEX    A                                * 1380B
        RTNCC                                    * 1380D

* #x #y ->
* refs (3): 4DBA4 4F480 4F499
PIXOFF3:
        CON(5)  (*)+5                            * 1380F  primitive code object
        ST=1    0                                * 13814
        ST=0    1                                * 13817
        LC(5)   GDISP                            * 1381A
        GOTO    L_1385C                          * 13821

* #x #y ->
* refs (20): 0C9EF 48A76 4C1BB 4C373 4C3AA 4C3D7 ...
PIXON3:
        CON(5)  (*)+5                            * 13825  primitive code object
        ST=0    0                                * 1382A
        ST=0    1                                * 1382D
        LC(5)   GDISP                            * 13830
        GOTO    L_1385C                          * 13837

* #x #y ->
PIXOFF:
        CON(5)  (*)+5                            * 1383B  primitive code object
        ST=1    0                                * 13840
        ST=1    1                                * 13843
        GOTO    L_13855                          * 13846

* #x #y ->
PIXON:
        CON(5)  (*)+5                            * 1384A  primitive code object
        ST=0    0                                * 1384F
        ST=1    1                                * 13852
L_13855:
        LC(5)   ADISP                            * 13855
L_1385C:
        CD1EX                                    * 1385C
        A=DAT1  A                                * 1385F
        D1=A                                     * 13862
        D1=D1+  15                               * 13865
        A=DAT1  A                                * 13868
        R2=A.F  A                                * 1386B
        D1=D1-  5                                * 13871
        A=DAT1  A                                * 13874
        R1=A.F  A                                * 13877
        D1=C                                     * 1387D
        GOSBVL  POP#                             * 13880
        C=R1.F  A                                * 13887
        ?C<=A   A                                * 1388D
        GOYES   L_138E4                          * 13890
        R0=A.F  A                                * 13892
        GOSBVL  POP#                             * 13898
        C=R2.F  A                                * 1389F
        ?C<=A   A                                * 138A5
        GOYES   L_138C0                          * 138A8
        GOSBVL  SAVPTR                           * 138AA
        GOSUB   GETPIX3                          * 138B1
        GOSUB   pixon2                           * 138B5
        GOSBVL  GETPTR                           * 138B9
L_138C0:
        A=DAT0  A                                * 138C0
        D0=D0+  5                                * 138C3
        PC=(A)                                   * 138C6

* refs (2): 138B5 50C05
pixon2:
        ?ST=0   0                                * 138CA
        GOYES   pixon2~1                         * 138CD
        B=-B-1  P                                * 138CF
        A=A&B   P                                * 138D2
        GOTO    L_138DE                          * 138D6
pixon2~1:
        A=A!B   P                                * 138DA
L_138DE:
        DAT0=A  1                                * 138DE
        RTN                                      * 138E2
L_138E4:
        GOSBVL  POP#                             * 138E4
        GOTO    L_138C0                          * 138EB

* refs (1): 139BF
GETPIX:
        ST=1    1                                * 138EF

* refs (3): 138B1 139B7 50BE7
GETPIX3:
        B=A     P                                * 138F2
        BSRC                                     * 138F5
        ASRB.F  A                                * 138F8
        ASRB.F  A                                * 138FD
        ?ST=0   1                                * 13902
        GOYES   L_13912                          * 13905
        D0=(5)  ADISP                            * 13907
        GOTO    L_13919                          * 1390E
L_13912:
        D0=(5)  GDISP                            * 13912
L_13919:
        C=DAT0  A                                * 13919
        D0=C                                     * 1391C
        D0=D0+  15                               * 1391F
        C=DAT0  A                                * 13922
        D0=D0+  5                                * 13925
        CAEX    A                                * 13928
        GOSBVL  w->W                             * 1392A
        CAEX    A                                * 13931
        B=C     A                                * 13933
        B=B-1   A                                * 13935
        C=R0.F  A                                * 13937
        D=0     A                                * 1393D
        DCEX    A                                * 1393F
L_13941:
        C=C+D   A                                * 13941
        B=B-1   A                                * 13943
        GONC    L_13941                          * 13945
        A=A+C   A                                * 13948
        CD0EX                                    * 1394A
        C=C+A   A                                * 1394D
        D0=C                                     * 1394F
        LC(1)   #3                               * 13952
        BSLC                                     * 13955
        A=B     P                                * 13958
        A=A&C   P                                * 1395B
        B=0     P                                * 1395F
        B=B+1   P                                * 13962
        A=A-1   P                                * 13965
        GOC     L_13980                          * 13968
        B=B+B   P                                * 1396B
        A=A-1   P                                * 1396E
        GOC     L_13980                          * 13971
        B=B+B   P                                * 13974
        A=A-1   P                                * 13977
        GOC     L_13980                          * 1397A
        B=B+B   P                                * 1397D
L_13980:
        A=DAT0  P                                * 13980
        RTN                                      * 13984

* #x #y -> flag
* refs (1): 4F511
PIXON?3:
        CON(5)  (*)+5                            * 13986  primitive code object
        ST=0    1                                * 1398B
        GOTO    L_1399A                          * 1398E

* #x #y -> flag
PIXON?:
        CON(5)  (*)+5                            * 13992  primitive code object
        ST=1    1                                * 13997
L_1399A:
        GOSBVL  POP#                             * 1399A
        R0=A                                     * 139A1
        GOSBVL  POP#                             * 139A4
        GOSBVL  SAVPTR                           * 139AB
        ?ST=1   1                                * 139B2
        GOYES   L_139BF                          * 139B5
        GOSUB   GETPIX3                          * 139B7
        GOTO    L_139C3                          * 139BB
L_139BF:
        GOSUB   GETPIX                           * 139BF
L_139C3:
        A=A&B   P                                * 139C3
        GOSBVL  GETPTR                           * 139C7
        LC(5)   FALSE                            * 139CE
        ?A=0    P                                * 139D5
        GOYES   L_139E1                          * 139D8
        LC(5)   TRUE                             * 139DA
L_139E1:
        A=C     A                                * 139E1
        PC=(A)                                   * 139E3

* refs (1): 40B9C
DispBadToken~1:
        CON(5)  (*)+5                            * 139E7  primitive code object
        GOSBVL  POP#                             * 139EC
        R0=A                                     * 139F3
        GOSBVL  POP#                             * 139F6
        R1=A                                     * 139FD
        GOSBVL  POP#                             * 13A00
        GOSBVL  SAVPTR                           * 13A07
        C=R1                                     * 13A0E
        GOSUB   SUB_13AF8                        * 13A11
        B=0     S                                * 13A15
        ?ST=0   0                                * 13A18
        GOYES   L_13A20                          * 13A1B
        B=B+1   S                                * 13A1D
L_13A20:
        D1=(5)  VDISP                            * 13A20
        C=DAT1  A                                * 13A27
        A=A+C   A                                * 13A2A
        LC(5)   #00014                           * 13A2C
        A=A+C   A                                * 13A33
        R2=A                                     * 13A35
        LC(5)   #00022                           * 13A38
        R3=C                                     * 13A3F
        D1=A                                     * 13A42
        A=R0.F  B                                * 13A45
        B=A     B                                * 13A4B
        ?B=0    B                                * 13A4E
        GOYES   L_13AC5                          * 13A51
        P=      2                                * 13A53
        LC(1)   #9                               * 13A55
        B=C     XS                               * 13A58
L_13A5B:
        B=B-1   B                                * 13A5B
        GOC     L_13A93                          * 13A5E
        A=DAT1  B                                * 13A61
        ?ST=1   0                                * 13A64
        GOYES   L_13ACE                          * 13A67
        P=      1                                * 13A69
        LC(1)   #C                               * 13A6B
        C=C&A   P                                * 13A6E
        C=-C-1  P                                * 13A72
        ABIT=1  6                                * 13A75
        ABIT=1  7                                * 13A7A
        A=A&C   P                                * 13A7F
        A=-A-1  B                                * 13A83
        DAT1=A  B                                * 13A86
        D1=D1+  1                                * 13A89
        ST=1    0                                * 13A8C
        GOTO    L_13A5B                          * 13A8F
L_13A93:
        B=B-1   XS                               * 13A93
        GOC     L_13AC5                          * 13A96
        C=R2.F  A                                * 13A99
        A=R3.F  A                                * 13A9F
        C=C+A   A                                * 13AA5
        R2=C                                     * 13AA7
        D1=C                                     * 13AAA
        A=R0.F  B                                * 13AAD
        B=A     B                                * 13AB3
        ST=0    0                                * 13AB6
        ?B=0    S                                * 13AB9
        GOYES   L_13A5B                          * 13ABC
        ST=1    0                                * 13ABE
        GOTO    L_13A5B                          * 13AC1
L_13AC5:
        P=      0                                * 13AC5
        GOVLNG  GETPTRLOOP                       * 13AC7
L_13ACE:
        P=      0                                * 13ACE
        LC(1)   #3                               * 13AD0
        C=C&A   P                                * 13AD3
        C=-C-1  P                                * 13AD7
        ABIT=1  0                                * 13ADA
        ABIT=1  1                                * 13ADF
        A=A&C   P                                * 13AE4
        A=-A-1  B                                * 13AE8
        DAT1=A  B                                * 13AEB
        D1=D1+  2                                * 13AEE
        ST=0    0                                * 13AF1
        GOTO    L_13A5B                          * 13AF4

* refs (1): 13A11
SUB_13AF8:
        D=C     A                                * 13AF8
        C=C+C   A                                * 13AFA
        D=D+C   A                                * 13AFC
        ST=0    0                                * 13AFE
        SB=0                                     * 13B01
        DSRB.F  A                                * 13B04
        ?SB=0                                    * 13B09
        GOYES   L_13B11                          * 13B0C
        ST=1    0                                * 13B0E
L_13B11:
        A=A-1   A                                * 13B11
        C=A     A                                * 13B13
        ASL     A                                * 13B15
        ASL     A                                * 13B17
        C=C+C   A                                * 13B19
        C=C+C   A                                * 13B1B
        A=A+C   A                                * 13B1D
        CSL     A                                * 13B1F
        A=A+C   A                                * 13B21
        CSRB.F  A                                * 13B23
        CSRB.F  A                                * 13B28
        A=A+C   A                                * 13B2D
        C=D     A                                * 13B2F
        A=A+C   A                                * 13B31
        LC(5)   #00220                           * 13B33
        A=A+C   A                                * 13B3A
        D1=A                                     * 13B3C
        RTN                                      * 13B3F

        CON(5)  (*)+5                            * 13B41  primitive code object
        LC(5)   NULL$                            * 13B46
        PC=(A)                                   * 13B4D
        RPL

* refs (2): 42976 42B4D
DISPCHAR+PC:
        :: SWAP 3->grob(s) HARDBUFF CURSOR_OFF #1- #6* 4PICK #1- #10* BINT16 * 13B51
          #+ GROB! OBJ_13B9C ;                   * 13B88

* refs (2): 13B92 42854
OBJ_13B9C:
        :: OBJ_13BB5 OBJ_13BF1 OBJ_13E22 ;       * 13B9C

* refs (1): 13BA1
OBJ_13BB5:
        CON(5)  (*)+5                            * 13BB5  primitive code object
        ASSEMBLE
        GOSUB   SAVPTR~jump_9                    * 13BBA
        GOSBVL  SUB_42AC4                        * 13BBE
        D0=C                                     * 13BC5
        A=DAT0  B                                * 13BC8
        ?A=0    B                                * 13BCB
        GOYES   L_13BD9                          * 13BCE
        LC(2)   #0A                              * 13BD0
        ?C#A    B                                * 13BD4
        GOYES   L_13BE0                          * 13BD7
L_13BD9:
        LC(2)   #20                              * 13BD9
        A=C     B                                * 13BDD
L_13BE0:
        D0=(5)  CURSORCHR                        * 13BE0
        DAT0=A  B                                * 13BE7
L_13BEA:
        GOVLNG  GETPTRLOOP                       * 13BEA

* refs (1): 13BA6
OBJ_13BF1:
        CON(5)  (*)+5                            * 13BF1  primitive code object
        GOSBVL  POP#                             * 13BF6
        GOSUB   SAVPTR~jump_9                    * 13BFD
        A=A-1   A                                * 13C01
        A=A+A   A                                * 13C03
        C=A     A                                * 13C05
        A=A+A   A                                * 13C07
        A=A+A   A                                * 13C09
        A=A+C   A                                * 13C0B
        LC(5)   #00010                           * 13C0D
        A=A+C   A                                * 13C14
        D1=(5)  CURSORY                          * 13C16
        DAT1=A  A                                * 13C1D
        D1=(5)  CURSOROFFSET                     * 13C20
        A=0     A                                * 13C27
        A=DAT1  B                                * 13C29
        C=A     A                                * 13C2C
        A=A+A   A                                * 13C2E
        A=A+C   A                                * 13C30
        A=A+A   A                                * 13C32
        D1=(5)  CURSORX                          * 13C34
        DAT1=A  A                                * 13C3B
        D1=(5)  CURSORCHR                        * 13C3E
        A=DAT1  B                                * 13C45
        GOSBVL  SUB_13C5A                        * 13C48
        GOTO    L_13BEA                          * 13C4F
        NIBHEX  00000                            * 13C53  ..

* refs (1): 13C5A
SUB_13C58:
        RTNSXM                                   * 13C58

* refs (1): 13C48
SUB_13C5A:
        GOSUB   SUB_13C58                        * 13C5A
        GOSBVL  SUB_11F28                        * 13C5E
        D0=C                                     * 13C65
        GOSBVL  D1=IRAM                          * 13C68
        D1=(4)  #0891                            * 13C6F
        LC(5)   DOGROB                           * 13C75
        DAT1=C  A                                * 13C7C
        D1=D1+  5                                * 13C7F
        C=0     W                                * 13C82
        LC(11)  #60000A00023                     * 13C85
        DAT1=C  15                               * 13C92
        D1=D1+  15                               * 13C96
        C=DAT0  W                                * 13C99
        DAT1=C  W                                * 13C9D
        D0=D0+  16                               * 13CA1
        D1=D1+  16                               * 13CA4
        C=DAT0  A                                * 13CA7
        DAT1=C  4                                * 13CAA
        RTN                                      * 13CAE
        RPL

* refs (2): 42186 421B8
GETKEY~1:
        :: GETKEY~4 case                         * 13CB0
          :: GETKEY~11 GETKEY~2 ;                * 13CBF
          GETKEY~12 OBJ_13E22 ;                  * 13CD3

* refs (1): 13CC4
GETKEY~11:
        :: OBJ_13D14 NOT?SEMI                    * 13CE2
          cursorblink+ ;                         * 13CF1

* refs (1): 13CD3
GETKEY~12:
        :: OBJ_13D14 NOT?SEMI                    * 13CFB
          cursorblink- ;                         * 13D0A

* refs (2): 13CE7 13D00
OBJ_13D14:
        :: OBJ_13E05 OBJ_53906 ;                 * 13D14

* refs (5): 13CF1 427FA 42999 429C1 42B52
cursorblink+:
        CON(5)  (*)+5                            * 13D28  primitive code object
        ASSEMBLE
        GOSUB   SAVPTR~jump_9                    * 13D2D
        LC(3)   #203                             * 13D31
        GOSBVL  L_53AF2                          * 13D36
        GOSUB   SUB_13DDC                        * 13D3D
        D0=(5)  CURSOR1                          * 13D41
        GOC     L_13D69                          * 13D48
        D0=(5)  CURSOR2                          * 13D4B
        GONC    L_13D69                          * 13D52

* refs (5): 13D0A 40922 427E1 42944 42B43
cursorblink-:
        CON(5)  (*)+5                            * 13D55  primitive code object
        GOSUB   SAVPTR~jump_9                    * 13D5A
        GOSUB   SUB_13DDC                        * 13D5E
        D0=(5)  CURSORGROB                       * 13D62
L_13D69:
        GOSBVL  grob!                            * 13D69
        D0=(5)  CURSORSTATE                      * 13D70
        C=DAT0  S                                * 13D77
        C=0     A                                * 13D7B
        ?C#0    S                                * 13D7D
        GOYES   L_13D84                          * 13D80
        C=C-1   A                                * 13D82
L_13D84:
        DAT0=C  1                                * 13D84
        GOTO    L_13BEA                          * 13D88
        RPL

* -> grob
* refs (1): 13D41
CURSOR1:
        GROB    "images/13D8C-CURSOR1.png"       * 13D8C  6 x 10

* -> grob
* refs (1): 13D4B
CURSOR2:
        GROB    "images/13DB4-CURSOR2.png"       * 13DB4  6 x 10
        ASSEMBLE

* refs (2): 13D3D 13D5E
SUB_13DDC:
        D1=(5)  VDISP                            * 13DDC
        C=DAT1  A                                * 13DE3
        D1=C                                     * 13DE6
        D0=(5)  CURSORY                          * 13DE9
        C=DAT0  A                                * 13DF0
        R0=C                                     * 13DF3
        D0=(5)  CURSORX                          * 13DF6
        C=DAT0  A                                * 13DFD
        R1=C                                     * 13E00
        RTN                                      * 13E03

* refs (1): 13D19
OBJ_13E05:
        CON(5)  (*)+5                            * 13E05  primitive code object
        AD1EX                                    * 13E0A
        D1=(5)  T1COUNT                          * 13E0D
        LC(1)   #8                               * 13E14
        DAT1=C  1                                * 13E17
        D1=A                                     * 13E1B
        GOTO    L_13FD4                          * 13E1E

* refs (3): 13BAB 13CD8 42181
OBJ_13E22:
        CON(5)  (*)+5                            * 13E22  primitive code object
        ST=1    0                                * 13E27
        GOTO    L_13E36                          * 13E2A

* refs (1): 13CC9
GETKEY~2:
        CON(5)  (*)+5                            * 13E2E  primitive code object
        ST=0    0                                * 13E33
L_13E36:
        LC(5)   CURSORSTATE                      * 13E36
        CD0EX                                    * 13E3D
        C=0     S                                * 13E40
        ?ST=0   0                                * 13E43
        GOYES   L_13E4B                          * 13E46
        C=C-1   S                                * 13E48
L_13E4B:
        DAT0=C  S                                * 13E4B
        GOTO    L_13FD1                          * 13E4F

* refs (1): 421AE
GETKEY~3:
        CON(5)  (*)+5                            * 13E53  primitive code object
        LC(5)   T1COUNT                          * 13E58
        GOTO    L_13E6F                          * 13E5F

* refs (1): 13CB5
GETKEY~4:
        CON(5)  (*)+5                            * 13E63  primitive code object
        LC(5)   CURSORSTATE                      * 13E68
L_13E6F:
        CD0EX                                    * 13E6F
        C=DAT0  S                                * 13E72
        D0=C                                     * 13E76
        ?C#0    S                                * 13E79
        GOYES   L_13E7E                          * 13E7C
L_13E7E:
        GOVLNG  PushT/FLoop                      * 13E7E

* -> #
* refs (9): 13B65 40B8D 4257F 42624 426C9 42719 ...
CURSOR_OFF:
        CON(5)  (*)+5                            * 13E85  primitive code object
        GOSUB   SAVPTR~jump_9                    * 13E8A
        D0=(5)  CURSOROFFSET                     * 13E8E
        A=0     A                                * 13E95
        A=DAT0  B                                * 13E97
        GOTO    L_13F5F                          * 13E9A

* refs (3): 425AC 42827 42912
OBJ_13E9E:
        CON(5)  (*)+5                            * 13E9E  primitive code object
        LC(5)   CURSOROFFSET                     * 13EA3
        RSTK=C                                   * 13EAA
        GOSBVL  POP#                             * 13EAC
        C=RSTK                                   * 13EB3
        CD0EX                                    * 13EB5
        GOTO    L_13EEA                          * 13EB8

* ->
* refs (3): 425C5 428DB 42B89
CURSOR_OFF0:
        CON(5)  (*)+5                            * 13EBC  primitive code object
        LC(5)   CURSOROFFSET                     * 13EC1
        CD0EX                                    * 13EC8
        A=0     B                                * 13ECB
        GOTO    L_13EEA                          * 13ECE

* ->
* refs (2): 42642 42651
CURSOR_OFF+:
        CON(5)  (*)+5                            * 13ED2  primitive code object
        LC(5)   CURSOROFFSET                     * 13ED7
        CD0EX                                    * 13EDE
        A=DAT0  B                                * 13EE1
        A=A+1   B                                * 13EE4
        GOC     L_13EED                          * 13EE7
L_13EEA:
        DAT0=A  B                                * 13EEA
L_13EED:
        GOTO    L_13FD1                          * 13EED

* -> #
* refs (7): 3B5CD 3B618 3E639 424EE 42746 42769 ...
CURSOR@:
        CON(5)  (*)+5                            * 13EF1  primitive code object
        LC(5)   CURSOR                           * 13EF6
        GOTO    L_13F53                          * 13EFD

* refs (2): 4261A 428CC
CURSOR+:
        CON(5)  (*)+5                            * 13F01  primitive code object
        LC(5)   CURSOR                           * 13F06
        GOTO    L_13F75                          * 13F0D

* refs (1): 4257A
LCursor~2:
        CON(5)  (*)+5                            * 13F11  primitive code object
        LC(5)   CURSOR                           * 13F16
        CD0EX                                    * 13F1D
        A=DAT0  A                                * 13F20
        A=A-1   A                                * 13F23
        GOTO    L_13FCE                          * 13F25

* refs (6): 3B5D7 3B5EB 4253E 425C0 4268D 4292B
SETCURSOR:
        CON(5)  (*)+5                            * 13F29  primitive code object
        LC(5)   CURSOR                           * 13F2E
        RSTK=C                                   * 13F35
        GOSBVL  POP#                             * 13F37
        C=RSTK                                   * 13F3E
        CD0EX                                    * 13F40
        GOTO    L_13FCE                          * 13F43

* refs (6): 426F6 42732 42840 4286D 42890 448A8
CurrentRow:
        CON(5)  (*)+5                            * 13F47  primitive code object
        LC(5)   CURSORPART                       * 13F4C
L_13F53:
        A=C     A                                * 13F53
        GOSUB   SAVPTR~jump_9                    * 13F55
        D0=A                                     * 13F59
        A=DAT0  A                                * 13F5C
L_13F5F:
        R0=A                                     * 13F5F
        GOVLNG  PUSH#LOOP                        * 13F62

* refs (3): 4250C 428D1 42B8E
OBJ_13F69:
        CON(5)  (*)+5                            * 13F69  primitive code object
        LC(5)   CURSORPART                       * 13F6E
L_13F75:
        CD0EX                                    * 13F75
        A=DAT0  A                                * 13F78
        GOTO    L_13FC9                          * 13F7B

* refs (1): 4267E
UCursor~1:
        CON(5)  (*)+5                            * 13F7F  primitive code object
        LC(5)   CURSORPART                       * 13F84
        CD0EX                                    * 13F8B
        A=DAT0  A                                * 13F8E
        A=A-1   A                                * 13F91
        ?A=0    A                                * 13F93
        GOYES   L_13FD1                          * 13F96
        GONC    L_13FCE                          * 13F98

* refs (1): 426A6
ToTheFirstRow~1:
        CON(5)  (*)+5                            * 13F9B  primitive code object
        LC(5)   CURSORPART                       * 13FA0
        CD0EX                                    * 13FA7
        A=0     A                                * 13FAA
        GOTO    L_13FC9                          * 13FAC

* refs (1): 4252A
ToTheLastRow~1:
        CON(5)  (*)+5                            * 13FB0  primitive code object
        LC(5)   CR_COUNT                         * 13FB5
        CD0EX                                    * 13FBC
        A=DAT0  A                                * 13FBF
        D0=(5)  CURSORPART                       * 13FC2
L_13FC9:
        A=A+1   A                                * 13FC9
        GOC     L_13FD1                          * 13FCB
L_13FCE:
        DAT0=A  A                                * 13FCE
L_13FD1:
        D0=C                                     * 13FD1
L_13FD4:
        A=DAT0  A                                * 13FD4
        D0=D0+  5                                * 13FD7
        PC=(A)                                   * 13FDA

* refs (6): 13BBA 13BFD 13D2D 13D5A 13E8A 13F55
SAVPTR~jump_9:
        GOVLNG  SAVPTR                           * 13FDE

* ->
* refs (1): 3888B
SAVEERRN:
        CON(5)  (*)+5                            * 13FE5  primitive code object
        LC(5)   ERROR                            * 13FEA
        CD0EX                                    * 13FF1
        A=DAT0  A                                * 13FF4
L_13FF7:
        D0=(5)  LASTERROR                        * 13FF7
        DAT0=A  A                                * 13FFE
