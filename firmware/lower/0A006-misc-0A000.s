* HP 48GX ROM revision R, #0A006-#0C000: not yet identified
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: TrueTrue !*triand tok8trior failed !*trior tok8cktrior PORTSTATUS SAFESKIPOB NEXTLIBBAK CKLBCRC sto0!(bk) purge(bk,s)
* Follows on from the previous file (at #0A006 in the original ROM).
        D=C     A                                * 0A006
        GOLONG  L_0AADF                          * 0A008

* Check CRC of library at D0 CC: Ok  CS: CRC is wrong Uses A.A C.W D0 P
* refs (5): 09248 09616 0AF1F 0AF3B 2174F
CKLBCRC:
        ST=0    15                               * 0A00E
        GOSUB   SUB_0A01C                        * 0A011
        GOVLNG  AllowIntr                        * 0A015

* refs (2): 0A011 0A11A
SUB_0A01C:
        P=      0                                * 0A01C
        D0=D0+  5                                * 0A01E
        C=DAT0  A                                * 0A021
        CD0EX                                    * 0A024
        D0=D0-  9                                * 0A027
        RTNC                                     * 0A02A
        D0=D0+  5                                * 0A02D
        AD0EX                                    * 0A030
        A=A+C   A                                * 0A033
        RTNC                                     * 0A035
        RSTK=C                                   * 0A038
        A=A-C   A                                * 0A03A
        C=0     A                                * 0A03C
        D0=(5)  #00104                           * 0A03E
        DAT0=C  4                                * 0A045
        C=A     B                                * 0A049
        P=C     0                                * 0A04C
        ASR     A                                * 0A050
        C=RSTK                                   * 0A052
        RSTK=C                                   * 0A054
        D0=C                                     * 0A056
        P=P-1                                    * 0A059
        GOC     L_0A06B                          * 0A05B
        C=DAT0  WP                               * 0A05E
        CD0EX                                    * 0A062
        C+P+1                                    * 0A065
        D0=C                                     * 0A068
L_0A06B:
        P=      0                                * 0A06B
        A=A-1   A                                * 0A06D
        GOC     L_0A07E                          * 0A06F
L_0A072:
        C=DAT0  W                                * 0A072
        D0=D0+  16                               * 0A076
        A=A-1   A                                * 0A079
        GONC    L_0A072                          * 0A07B
L_0A07E:
        A=0     A                                * 0A07E
        CD0EX                                    * 0A080
        D0=(5)  #00104                           * 0A083
        A=DAT0  4                                * 0A08A
        D0=C                                     * 0A08E
        C=0     A                                * 0A091
        C=DAT0  4                                * 0A093
        A=A-C   A                                * 0A097
        C=RSTK                                   * 0A099
        ?A#0    A                                * 0A09B
        RTNYES                                   * 0A09E
        RTNCC                                    * 0A0A0
L_0A0A2:
        GOSBVL  SUB_0249F                        * 0A0A2
        P=      0                                * 0A0A9
        D0=(5)  USEROB                           * 0A0AB
        C=0     A                                * 0A0B2
        DAT0=C  A                                * 0A0B4
        D0=(5)  ROMPARTS                         * 0A0B7
        C=DAT0  A                                * 0A0BE
        LA(5)   #00023                           * 0A0C1
        C=C-A   A                                * 0A0CB
        D0=C                                     * 0A0CD
        D1=(5)  TEMPOB                           * 0A0D0
        A=DAT1  A                                * 0A0D7
        LC(5)   #0016D                           * 0A0DA
        A=A+C   A                                * 0A0E1
        B=A     A                                * 0A0E3
L_0A0E5:
        LC(5)   DOLIB                            * 0A0E5
        D=C     A                                * 0A0EC
        LC(5)   DOBAK                            * 0A0EE
L_0A0F5:
        D0=D0-  1                                * 0A0F5
        AD0EX                                    * 0A0F8
        ?A<=B   A                                * 0A0FB
        GOYES   L_0A145                          * 0A0FE
        D0=A                                     * 0A100
        A=DAT0  A                                * 0A103
        ?C=A    A                                * 0A106
        GOYES   L_0A112                          * 0A109
        DCEX    A                                * 0A10B
        ?C#A    A                                * 0A10D
        GOYES   L_0A0F5                          * 0A110
L_0A112:
        CD0EX                                    * 0A112
        D=C     A                                * 0A115
        D0=C                                     * 0A117
        GOSUB   SUB_0A01C                        * 0A11A
        C=D     A                                * 0A11E
        D0=C                                     * 0A120
        GOC     L_0A0E5                          * 0A123
        GOSBVL  SKIPOB                           * 0A126
        D1=(5)  ROMPARTS                         * 0A12D
        A=DAT1  A                                * 0A134
        C=D     A                                * 0A137
        CD0EX                                    * 0A139
        ?C>A    A                                * 0A13C
        GOYES   L_0A0E5                          * 0A13F
        GOTO    L_0A2D2                          * 0A141
L_0A145:
        D0=(5)  ROMPARTS                         * 0A145
        A=DAT0  A                                * 0A14C
        D1=A                                     * 0A14F
        LC(5)   #00021                           * 0A152
        A=A-C   A                                * 0A159
        D0=A                                     * 0A15B
L_0A15E:
        LC(5)   DORRP                            * 0A15E
L_0A165:
        D0=D0-  1                                * 0A165
        AD0EX                                    * 0A168
        ?A<=B   A                                * 0A16B
        GOYES   L_0A17F                          * 0A16E
        D0=A                                     * 0A170
        A=DAT0  A                                * 0A173
        ?C#A    A                                * 0A176
        GOYES   L_0A165                          * 0A179
        GOTO    L_0A2F5                          * 0A17B
L_0A17F:
        D0=(5)  ROMPARTS                         * 0A17F
        A=DAT0  A                                * 0A186
        B=A     A                                * 0A189
        D0=(5)  CONTEXT                          * 0A18B
        C=0     A                                * 0A192
        DAT0=C  A                                * 0A194
        D0=(5)  TEMPOB                           * 0A197
        A=DAT0  A                                * 0A19E
        LC(5)   #0016D                           * 0A1A1
        C=C+A   A                                * 0A1A8
        D0=(5)  USEROB                           * 0A1AA
        DAT0=C  A                                * 0A1B1
        D0=C                                     * 0A1B4
L_0A1B7:
        D1=(5)  USEROB                           * 0A1B7
        A=DAT1  A                                * 0A1BE
        LC(5)   #00011                           * 0A1C1
        A=A+C   A                                * 0A1C8
        GONC    L_0A1D1                          * 0A1CA
        GOTO    L_0A200                          * 0A1CD
L_0A1D1:
        CD0EX                                    * 0A1D1
        D0=C                                     * 0A1D4
        ?C>A    A                                * 0A1D7
        GOYES   L_0A1DF                          * 0A1DA
        D0=A                                     * 0A1DC
L_0A1DF:
        LC(5)   DORRP                            * 0A1DF
L_0A1E6:
        D0=D0+  1                                * 0A1E6
        AD0EX                                    * 0A1E9
        ?A>=B   A                                * 0A1EC
        GOYES   L_0A200                          * 0A1EF
        D0=A                                     * 0A1F1
        A=DAT0  A                                * 0A1F4
        ?C#A    A                                * 0A1F7
        GOYES   L_0A1E6                          * 0A1FA
        GOTO    L_0A315                          * 0A1FC
L_0A200:
        D0=(5)  CONTEXT                          * 0A200
        A=DAT0  A                                * 0A207
        ?A=0    A                                * 0A20A
        GOYES   L_0A278                          * 0A20D
        D1=(5)  TEMPOB                           * 0A20F
        A=DAT1  A                                * 0A216
        LC(5)   #0016D                           * 0A219
        A=A+C   A                                * 0A220
        D1=A                                     * 0A222
        C=0     A                                * 0A225
        D1=D1-  5                                * 0A227
        DAT1=C  A                                * 0A22A
        D1=D1-  5                                * 0A22D
        D0=(5)  OSAVE                            * 0A230
        C=DAT0  A                                * 0A237
        AD1EX                                    * 0A23A
        D1=A                                     * 0A23D
        C=C-A   A                                * 0A240
        DAT1=C  A                                * 0A242
        D0=(5)  USEROB                           * 0A245
        C=DAT0  A                                * 0A24C
        C=C-CON A,5                              * 0A24F
        D0=C                                     * 0A255
        C=C-A   A                                * 0A258
        D1=(5)  ROMPARTS                         * 0A25A
        A=DAT1  A                                * 0A261
        D1=A                                     * 0A264
        GOSBVL  MOVEUP                           * 0A267
        AD1EX                                    * 0A26E
        D0=A                                     * 0A271
        GOTO    L_0A28D                          * 0A274
L_0A278:
        D0=(5)  ROMPARTS                         * 0A278
        C=DAT0  A                                * 0A27F
        D0=C                                     * 0A282
        D0=D0-  5                                * 0A285
        A=0     A                                * 0A288
        GONC    L_0A290                          * 0A28A
L_0A28D:
        A=DAT0  A                                * 0A28D
L_0A290:
        DAT0=A  A                                * 0A290
        D0=D0-  3                                * 0A293
        C=0     X                                * 0A296
        DAT0=C  X                                * 0A299
        D0=D0-  5                                * 0A29D
        LC(5)   DORRP                            * 0A2A0
        DAT0=C  A                                * 0A2A7
        LC(5)   USEROB                           * 0A2AA
        CD0EX                                    * 0A2B1
        DAT0=C  A                                * 0A2B4
        D1=(5)  CONTEXT                          * 0A2B7
        DAT1=C  A                                * 0A2BE
        D0=(5)  STOPSIGN                         * 0A2C1
        DAT0=C  A                                * 0A2C8
        GOVLNG  L_02402                          * 0A2CB
L_0A2D2:
        D1=A                                     * 0A2D2
        AD0EX                                    * 0A2D5
        D0=C                                     * 0A2D8
        C=C-A   A                                * 0A2DB
        GOSBVL  MOVEUP                           * 0A2DD
        LC(5)   ROMPARTS                         * 0A2E4
        CD1EX                                    * 0A2EB
        DAT1=C  A                                * 0A2EE
        GOTO    L_0A0E5                          * 0A2F1
L_0A2F5:
        CD0EX                                    * 0A2F5
        D1=C                                     * 0A2F8
        D0=C                                     * 0A2FB
        C=B     A                                * 0A2FE
        D=C     A                                * 0A300
        GOSUB   SUB_0A491                        * 0A302
        GOC     L_0A30D                          * 0A306
        GOTO    L_0A3F2                          * 0A309
L_0A30D:
        C=D     A                                * 0A30D
        B=C     A                                * 0A30F
        GOTO    L_0A15E                          * 0A311
L_0A315:
        CD0EX                                    * 0A315
        D0=C                                     * 0A318
        D1=C                                     * 0A31B
        C=B     A                                * 0A31E
        D=C     A                                * 0A320
        GOSUB   SUB_0A45D                        * 0A322
        C=D     A                                * 0A326
        B=C     A                                * 0A328
        GONC    L_0A331                          * 0A32A
        GOTO    L_0A1B7                          * 0A32D
L_0A331:
        GOSUB   SUB_0A71C                        * 0A331
        D1=(5)  USEROB                           * 0A335
        A=DAT1  A                                * 0A33C
        D1=(5)  OSAVE                            * 0A33F
        DAT1=A  A                                * 0A346
        D1=A                                     * 0A349
        LC(2)   #04                              * 0A34C
        DAT1=C  B                                * 0A350
        D1=D1+  2                                * 0A353
        LC(4)   #2E44                            * 0A356
        DAT1=C  4                                * 0A35C
        D1=D1+  4                                * 0A360
        LC(5)   CONTEXT                          * 0A363
        CD1EX                                    * 0A36A
        A=DAT1  A                                * 0A36D
        SETDEC                                   * 0A370
        A=A+1   A                                * 0A372
        SETHEX                                   * 0A374
        DAT1=A  A                                * 0A376
        D1=C                                     * 0A379
        C=0     A                                * 0A37C
        C=A     B                                * 0A37E
        CPEX    0                                * 0A381
        CPEX    2                                * 0A385
        CSR     B                                * 0A389
        LA(4)   #3030                            * 0A38C
        A=A+C   A                                * 0A395
        DAT1=A  4                                * 0A397
        D1=D1+  4                                * 0A39B
        LC(2)   #04                              * 0A39E
        DAT1=C  B                                * 0A3A2
        D1=D1+  2                                * 0A3A5
        CD0EX                                    * 0A3A8
        D0=C                                     * 0A3AB
        D=C     A                                * 0A3AE
        GOSBVL  SKIPOB                           * 0A3B0
        C=D     A                                * 0A3B7
        CD0EX                                    * 0A3B9
        C=C-D   A                                * 0A3BC
        D=C     A                                * 0A3BE
        GOSBVL  MOVEDOWN                         * 0A3C0
        C=D     A                                * 0A3C7
        C=C+CON A,12                             * 0A3C9
        DAT1=C  A                                * 0A3CF
        D1=D1+  5                                * 0A3D2
        LC(5)   USEROB                           * 0A3D5
        CD1EX                                    * 0A3DC
        DAT1=C  A                                * 0A3DF
        D1=(5)  ROMPARTS                         * 0A3E2
        A=DAT1  A                                * 0A3E9
        B=A     A                                * 0A3EC
        GOTO    L_0A1B7                          * 0A3EE
L_0A3F2:
        D0=D0+  5                                * 0A3F2
        C=0     A                                * 0A3F5
        C=DAT0  X                                * 0A3F7
        A=C     A                                * 0A3FB
        CSL     A                                * 0A3FD
        C=C-A   A                                * 0A3FF
        C=C-A   A                                * 0A401
        C=C-A   A                                * 0A403
        AD0EX                                    * 0A405
        A=A+C   A                                * 0A408
        D0=A                                     * 0A40A
        C=0     X                                * 0A40D
        DAT0=C  X                                * 0A410
        D0=D0-  5                                * 0A414
        LC(5)   DORRP                            * 0A417
        DAT0=C  A                                * 0A41E
        GOSUB   SUB_0A71C                        * 0A421
        CD0EX                                    * 0A425
        D0=C                                     * 0A428
        D=C     A                                * 0A42B
        GOSBVL  SKIPOB                           * 0A42D
        D1=(5)  ROMPARTS                         * 0A434
        A=DAT1  A                                * 0A43B
        D1=A                                     * 0A43E
        CD0EX                                    * 0A441
        D0=C                                     * 0A444
        C=C-D   A                                * 0A447
        GOSBVL  MOVEUP                           * 0A449
        CD1EX                                    * 0A450
        D0=C                                     * 0A453
        D0=D0+  8                                * 0A456
        GOTO    L_0A28D                          * 0A459

* refs (2): 0A322 0AA03
SUB_0A45D:
        D1=D1+  8                                * 0A45D
        GOTO    L_0A4B7                          * 0A460

* refs (2): 020E4 0423A
SUB_0A464:
        P=      0                                * 0A464
        D1=(5)  USEROB                           * 0A466
        C=DAT1  A                                * 0A46D
        D1=(5)  RAMEND                           * 0A470
        A=DAT1  A                                * 0A477
        ?C>A    A                                * 0A47A
        RTNYES                                   * 0A47D
        D1=C                                     * 0A47F
        A=DAT1  A                                * 0A482
        LC(5)   DORRP                            * 0A485
        ?C#A    A                                * 0A48C
        RTNYES                                   * 0A48F

* refs (1): 0A302
SUB_0A491:
        D1=D1+  5                                * 0A491
        C=0     A                                * 0A494
        C=DAT1  X                                * 0A496
        ?C=0    X                                * 0A49A
        RTNYES                                   * 0A49D
        D1=D1+  3                                * 0A49F
        A=C     A                                * 0A4A2
        CSL     A                                * 0A4A4
        C=C-A   A                                * 0A4A6
        C=C-A   A                                * 0A4A8
        C=C-A   A                                * 0A4AA
        AD1EX                                    * 0A4AC
        A=A+C   A                                * 0A4AF
        RTNC                                     * 0A4B1
        D1=A                                     * 0A4B4
L_0A4B7:
        C=DAT1  A                                * 0A4B7
        ?C#0    A                                * 0A4BA
        GOYES   L_0A4D6                          * 0A4BD
        D1=D1+  5                                * 0A4BF
        LC(5)   ROMPARTS                         * 0A4C2
        CD1EX                                    * 0A4C9
        A=DAT1  A                                * 0A4CC
        ?C#A    A                                * 0A4CF
        RTNYES                                   * 0A4D2
        RTNCC                                    * 0A4D4
L_0A4D6:
        AD1EX                                    * 0A4D6
        B=A     A                                * 0A4D9
        C=C+A   A                                * 0A4DB
        RTNC                                     * 0A4DD
        D1=(5)  ROMPARTS                         * 0A4E0
        A=DAT1  A                                * 0A4E7
        ?C>=A   A                                * 0A4EA
        RTNYES                                   * 0A4ED
        D1=C                                     * 0A4EF
L_0A4F2:
        D1=D1-  5                                * 0A4F2
        C=DAT1  A                                * 0A4F5
        ?C=0    A                                * 0A4F8
        GOYES   L_0A51E                          * 0A4FB
        LA(5)   #00009                           * 0A4FD
        ?C<A    A                                * 0A507
        RTNYES                                   * 0A50A
        AD1EX                                    * 0A50C
        A=A-C   A                                * 0A50F
        RTNC                                     * 0A511
        D1=A                                     * 0A514
        ?A>B    A                                * 0A517
        GOYES   L_0A4F2                          * 0A51A
        RTNSC                                    * 0A51C
L_0A51E:
        D1=D1-  5                                * 0A51E
        AD1EX                                    * 0A521
        ?A#B    A                                * 0A524
        RTNYES                                   * 0A527
        RTNCC                                    * 0A529
        NIBHEX  8516600                          * 0A52B  Xa.

* refs (6): 01400 015E6 0A9C0 0E895 306AD D4608
SAFESKIPOB:
        ST=0    1                                * 0A532
        CD1EX                                    * 0A535
        RSTK=C                                   * 0A538
        C=B     A                                * 0A53A
        RSTK=C                                   * 0A53C
        P=      0                                * 0A53E
        B=0     A                                * 0A540
        ?ST=1   1                                * 0A542
        GOYES   L_0A554                          * 0A545
L_0A547:
        A=DAT0  A                                * 0A547
        D0=D0+  5                                * 0A54A
        GONC    L_0A554                          * 0A54D
        GOTO    L_0A597                          * 0A550
L_0A554:
        D1=A                                     * 0A554
        A=DAT1  A                                * 0A557
        LC(5)   PRLG                             * 0A55A
        ?C#A    A                                * 0A561
        GOYES   L_0A570                          * 0A564
        D1=D1-  5                                * 0A566
        GOC     L_0A597                          * 0A569
        GOTO    L_0A67B                          * 0A56C
L_0A570:
        LC(5)   SEMILOOP~1                       * 0A570
        ?C#A    A                                * 0A577
        GOYES   L_0A581                          * 0A57A
        B=B-1   A                                * 0A57C
        GOC     L_0A591                          * 0A57E
L_0A581:
        ?B#0    A                                * 0A581
        GOYES   L_0A547                          * 0A584
L_0A586:
        C=RSTK                                   * 0A586
        B=C     A                                * 0A588
        C=RSTK                                   * 0A58A
        D1=C                                     * 0A58C
        RTNCC                                    * 0A58F
L_0A591:
        D0=D0-  5                                * 0A591
        GONC    L_0A586                          * 0A594
L_0A597:
        C=RSTK                                   * 0A597
        B=C     A                                * 0A599
        C=RSTK                                   * 0A59B
        D1=C                                     * 0A59D
        RTNSC                                    * 0A5A0
L_0A5A2:
        B=B+1   A                                * 0A5A2
        GOC     L_0A597                          * 0A5A4
        GONC    L_0A547                          * 0A5A7
L_0A5AA:
        D0=D0+  16                               * 0A5AA
        GOC     L_0A597                          * 0A5AD
L_0A5B0:
        D0=D0+  16                               * 0A5B0
        GONC    L_0A581                          * 0A5B3
        GOC     L_0A597                          * 0A5B6
L_0A5B9:
        D0=D0+  16                               * 0A5B9
        GOC     L_0A597                          * 0A5BC
        D0=D0+  5                                * 0A5BF
        GOC     L_0A597                          * 0A5C2
L_0A5C5:
        D0=D0+  16                               * 0A5C5
        GOC     L_0A597                          * 0A5C8
L_0A5CB:
        D0=D0+  5                                * 0A5CB
        GONC    L_0A581                          * 0A5CE
        GOC     L_0A597                          * 0A5D1
L_0A5D4:
        D0=D0+  6                                * 0A5D4
        GONC    L_0A581                          * 0A5D7
        GOC     L_0A597                          * 0A5DA
L_0A5DD:
        C=DAT0  A                                * 0A5DD
        C=C-CON A,5                              * 0A5E0
        GOC     L_0A597                          * 0A5E6
        C=C+CON A,5                              * 0A5E9
        AD0EX                                    * 0A5EF
        C=C+A   A                                * 0A5F2
        D0=C                                     * 0A5F4
        GONC    L_0A581                          * 0A5F7
        GOTO    L_0A597                          * 0A5FA
L_0A5FE:
        C=0     A                                * 0A5FE
        C=DAT0  B                                * 0A600
        C=C+C   A                                * 0A603
        AD0EX                                    * 0A605
        C=C+A   A                                * 0A608
        D0=C                                     * 0A60A
L_0A60D:
        D0=D0+  2                                * 0A60D
        GOC     L_0A597                          * 0A610
        GOTO    L_0A581                          * 0A613
L_0A617:
        GOTO    L_0A597                          * 0A617
L_0A61B:
        D0=D0+  3                                * 0A61B
        GOC     L_0A617                          * 0A61E
        C=DAT0  A                                * 0A621
        ?C=0    A                                * 0A624
        GOYES   L_0A5CB                          * 0A627
        AD0EX                                    * 0A629
        C=C+A   A                                * 0A62C
        GOC     L_0A617                          * 0A62E
        D0=C                                     * 0A631
        C=0     A                                * 0A634
        C=DAT0  B                                * 0A636
        ?C=0    A                                * 0A639
        GOYES   L_0A651                          * 0A63C
        C=C+C   A                                * 0A63E
        AD0EX                                    * 0A640
        C=C+A   A                                * 0A643
        GOC     L_0A617                          * 0A645
        D0=C                                     * 0A648
        D0=D0+  2                                * 0A64B
        GOC     L_0A617                          * 0A64E
L_0A651:
        D0=D0+  2                                * 0A651
        GOC     L_0A65B                          * 0A654
        GOTO    L_0A547                          * 0A657
L_0A65B:
        GOTO    L_0A597                          * 0A65B
L_0A65F:
        C=0     A                                * 0A65F
        C=DAT0  B                                * 0A661
        C=C+C   A                                * 0A664
        AD0EX                                    * 0A666
        C=C+A   A                                * 0A669
        GOC     L_0A65B                          * 0A66B
        D0=C                                     * 0A66E
        D0=D0+  2                                * 0A671
        GOC     L_0A65B                          * 0A674
        GOTO    L_0A547                          * 0A677
L_0A67B:
        A=DAT1  A                                * 0A67B
        D1=(5)  L_0A698+2                        * 0A67E  table walked 5 nibbles at a time
L_0A685:
        D1=D1+  5                                * 0A685
        C=DAT1  A                                * 0A688
        D1=D1+  5                                * 0A68B
        ?C=0    A                                * 0A68E
        GOYES   L_0A65B                          * 0A691
        ?C#A    A                                * 0A693
        GOYES   L_0A685                          * 0A696
L_0A698:
        AD1EX                                    * 0A698
        PC=(A)                                   * 0A69B

* Object types: SKIPOB's size handler and the handler to use for that type (read at #0A67E, from the address before)
        CON(5)  L_03077                          * 0A69F  entry 0
        CON(5)  L_0A5A2                          * 0A6A4
        CON(5)  L_0307C                          * 0A6A9  entry 1
        CON(5)  L_0A5AA                          * 0A6AE
        CON(5)  L_0307F                          * 0A6B3  entry 2
        CON(5)  L_0A5B0                          * 0A6B8
        CON(5)  L_03085                          * 0A6BD  entry 3
        CON(5)  L_0A5B9                          * 0A6C2
        CON(5)  L_0308B                          * 0A6C7  entry 4
        CON(5)  L_0A5C5                          * 0A6CC
        CON(5)  L_0308E                          * 0A6D1  entry 5
        CON(5)  L_0A5CB                          * 0A6D6
        CON(5)  L_03094                          * 0A6DB  entry 6
        CON(5)  L_0A5D4                          * 0A6E0
        CON(5)  L_0309A                          * 0A6E5  entry 7
        CON(5)  L_0A5DD                          * 0A6EA
        CON(5)  L_030A8                          * 0A6EF  entry 8
        CON(5)  L_0A5FE                          * 0A6F4
        CON(5)  L_030B7                          * 0A6F9  entry 9
        CON(5)  L_0A60D                          * 0A6FE
        CON(5)  L_030BD                          * 0A703  entry 10
        CON(5)  L_0A61B                          * 0A708
        CON(5)  L_03115                          * 0A70D  entry 11
        CON(5)  L_0A65F                          * 0A712
        CON(5)  0                                * 0A717  end of table

* refs (2): 0A331 0A421
SUB_0A71C:
        P=      0                                * 0A71C
        D1=(5)  ROMPARTS                         * 0A71E
        A=DAT1  A                                * 0A725
        D1=A                                     * 0A728
        A=DAT0  8                                * 0A72B
        LC(5)   USEROB                           * 0A72F
        CD0EX                                    * 0A736
        A=DAT0  A                                * 0A739
        DAT0=C  A                                * 0A73C
        D0=C                                     * 0A73F
        P=      7                                * 0A742
        R4=A.F  WP                               * 0A744
        P=      0                                * 0A74A
        D0=D0+  5                                * 0A74C
        C=0     X                                * 0A74F
        DAT0=C  X                                * 0A752
        ST=0    4                                * 0A756
        D0=D0+  3                                * 0A759
        C=DAT0  A                                * 0A75C
        ?C#0    A                                * 0A75F
        GOYES   L_0A768                          * 0A762
        GOTO    L_0A7E4                          * 0A764
L_0A768:
        AD0EX                                    * 0A768
        A=A+C   A                                * 0A76B
L_0A76D:
        D0=A                                     * 0A76D
        GOSUB   SUB_0A92C                        * 0A770
        GONC    L_0A77B                          * 0A774
        GOTO    L_0A80C                          * 0A777
L_0A77B:
        A=DAT0  A                                * 0A77B
        D0=D0+  8                                * 0A77E
        LC(5)   DORRP                            * 0A781
        ?C#A    A                                * 0A788
        GOYES   L_0A7C7                          * 0A78B
        C=DAT0  A                                * 0A78D
        ?C=0    A                                * 0A790
        GOYES   L_0A7C7                          * 0A793
        C=DAT0  A                                * 0A795
        GONC    L_0A768                          * 0A798
L_0A79B:
        ST=1    4                                * 0A79B
        D0=D0-  5                                * 0A79E
L_0A7A1:
        C=DAT0  A                                * 0A7A1
        ?C#0    A                                * 0A7A4
        GOYES   L_0A800                          * 0A7A7
        D0=D0-  5                                * 0A7A9
L_0A7AC:
        LC(5)   USEROB                           * 0A7AC
        CD0EX                                    * 0A7B3
        A=DAT0  A                                * 0A7B6
        D0=C                                     * 0A7B9
        A=A+CON A,8                              * 0A7BC
        ?C=A    A                                * 0A7C2
        GOYES   L_0A7E4                          * 0A7C5
L_0A7C7:
        D0=D0-  10                               * 0A7C7
        C=0     A                                * 0A7CA
        C=DAT0  B                                * 0A7CC
        ?C=0    A                                * 0A7CF
        GOYES   L_0A79B                          * 0A7D2
        C=C+1   A                                * 0A7D4
        C=C+C   A                                * 0A7D6
        AD0EX                                    * 0A7D8
        A=A-C   A                                * 0A7DB
        D0=A                                     * 0A7DD
        GOTO    L_0A79B                          * 0A7E0
L_0A7E4:
        D0=(5)  USEROB                           * 0A7E4
        C=DAT0  A                                * 0A7EB
        A=R4                                     * 0A7EE
        DAT0=A  A                                * 0A7F1
        D0=C                                     * 0A7F4
        A=DAT0  A                                * 0A7F7
        DAT0=A  7                                * 0A7FA
        RTN                                      * 0A7FE
L_0A800:
        AD0EX                                    * 0A800
        D1=A                                     * 0A803
        A=A-C   A                                * 0A806
        GOTO    L_0A76D                          * 0A808
L_0A80C:
        ?ST=0   4                                * 0A80C
        GOYES   L_0A815                          * 0A80F
        GOTO    L_0A845                          * 0A811
L_0A815:
        D0=D0-  5                                * 0A815
        C=DAT0  A                                * 0A818
        ?C#0    A                                * 0A81B
        GOYES   L_0A82A                          * 0A81E
        D0=D0-  5                                * 0A820
        DAT0=C  A                                * 0A823
        GOTO    L_0A7AC                          * 0A826
L_0A82A:
        AD0EX                                    * 0A82A
        A=A-C   A                                * 0A82D
        D0=A                                     * 0A82F
        GOSUB   SUB_0A914                        * 0A832
        CD0EX                                    * 0A836
        D0=C                                     * 0A839
        C=A-C   A                                * 0A83C
        DAT0=C  A                                * 0A83E
        GOTO    L_0A76D                          * 0A841
L_0A845:
        AD0EX                                    * 0A845
        D0=A                                     * 0A848
        R3=A.F  A                                * 0A84B
        D1=D1+  5                                * 0A851
        CD1EX                                    * 0A854
        D1=C                                     * 0A857
        C=C-A   A                                * 0A85A
        B=C     A                                * 0A85C
        GOSUB   SUB_0A914                        * 0A85E
        C=DAT0  A                                * 0A862
        AD0EX                                    * 0A865
        D0=A                                     * 0A868
        A=A+C   A                                * 0A86B
        CR3EX.F A                                * 0A86D
        C=0     S                                * 0A873
        ?C=A    A                                * 0A876
        GOYES   L_0A8E6                          * 0A879
        CR3EX.F A                                * 0A87B
        C=C-B   A                                * 0A881
        DAT0=C  A                                * 0A883
L_0A886:
        R3=C.F  S                                * 0A886
        D0=D0-  8                                * 0A88C
        ST=0    5                                * 0A88F
        C=B     A                                * 0A892
        GOSBVL  SUB_0852C                        * 0A894
        D0=(5)  USEROB                           * 0A89B
        A=DAT0  A                                * 0A8A2
        CD1EX                                    * 0A8A5
        D1=C                                     * 0A8A8
        CR3EX.F A                                * 0A8AB
        D0=C                                     * 0A8B1
        C=C-A   A                                * 0A8B4
        GOSBVL  MOVEUP                           * 0A8B6
        LC(5)   USEROB                           * 0A8BD
        CD1EX                                    * 0A8C4
        DAT1=C  A                                * 0A8C7
        C=R3.F  A                                * 0A8CA
        D0=C                                     * 0A8D0
        C=R3.F  S                                * 0A8D3
        ?C=0    S                                * 0A8D9
        GOYES   L_0A8E2                          * 0A8DC
        GOTO    L_0A7A1                          * 0A8DE
L_0A8E2:
        GOTO    L_0A79B                          * 0A8E2
L_0A8E6:
        C=C-CON A,5                              * 0A8E6
        D1=D1-  5                                * 0A8EC
        CD1EX                                    * 0A8EF
        A=DAT1  A                                * 0A8F2
        CD1EX                                    * 0A8F5
        CR3EX.F A                                * 0A8F8
        ?A=0    A                                * 0A8FE
        GOYES   L_0A90D                          * 0A901
        C=C-A   A                                * 0A903
        C=C-CON A,5                              * 0A905
        A=C     A                                * 0A90B
L_0A90D:
        DAT0=A  A                                * 0A90D
        GOTO    L_0A886                          * 0A910

* refs (3): 0A832 0A85E 0A922
SUB_0A914:
        D0=D0-  5                                * 0A914
        C=DAT0  A                                * 0A917
        AD0EX                                    * 0A91A
        A=A-C   A                                * 0A91D
        AD0EX                                    * 0A91F
        ?C#0    A                                * 0A922
        GOYES   SUB_0A914                        * 0A925
        D0=D0-  5                                * 0A927
        RTN                                      * 0A92A

* refs (1): 0A770
SUB_0A92C:
        A=0     A                                * 0A92C
        A=DAT0  B                                * 0A92E
        ?A=0    B                                * 0A931
        RTNYES                                   * 0A934
        A=A+A   A                                * 0A936
        CD0EX                                    * 0A938
        D=C     A                                * 0A93B
        C=C+A   A                                * 0A93D
        GOC     L_0A94B                          * 0A93F
        C=C+CON A,2                              * 0A942
        GONC    L_0A952                          * 0A948
L_0A94B:
        C=D     A                                * 0A94B
        D0=C                                     * 0A94D
        RTNSC                                    * 0A950
L_0A952:
        D0=C                                     * 0A952
        C=DAT0  B                                * 0A955
        ASRB.F  A                                * 0A958
        ?C#A    B                                * 0A95D
        GOYES   L_0A94B                          * 0A960
        C=D     A                                * 0A962
        CD0EX                                    * 0A964
        AD1EX                                    * 0A967
        D1=A                                     * 0A96A
        A=A-CON A,11                             * 0A96D
        ?C>A    A                                * 0A973
        RTNYES                                   * 0A976
        A=DAT0  B                                * 0A978
        A=A-1   B                                * 0A97B
L_0A97E:
        D0=D0+  2                                * 0A97E
        C=DAT0  B                                * 0A981
        ?C#0    B                                * 0A984
        GOYES   L_0A990                          * 0A987
        LC(2)   #5A                              * 0A989
        DAT0=C  B                                * 0A98D
L_0A990:
        A=A-1   B                                * 0A990
        GONC    L_0A97E                          * 0A993
        D0=D0+  4                                * 0A996
        C=DAT0  A                                * 0A999
        LA(5)   DORRP                            * 0A99C
        ?C=A    A                                * 0A9A6
        GOYES   L_0A9FA                          * 0A9A9
        CD0EX                                    * 0A9AB
        A=DAT0  A                                * 0A9AE
        D0=C                                     * 0A9B1
        LC(5)   PRLG                             * 0A9B4
        ?C#A    A                                * 0A9BB
        GOYES   L_0A9C7                          * 0A9BE
        GOSUB   SAFESKIPOB                       * 0A9C0
        GONC    L_0A9CB                          * 0A9C4
L_0A9C7:
        GOTO    L_0A94B                          * 0A9C7
L_0A9CB:
        CD0EX                                    * 0A9CB
        AD1EX                                    * 0A9CE
        D1=A                                     * 0A9D1
        ?C>A    A                                * 0A9D4
        GOYES   L_0A9C7                          * 0A9D7
        ?ST=0   4                                * 0A9D9
        GOYES   L_0A9E3                          * 0A9DC
        ?C#A    A                                * 0A9DE
        GOYES   L_0A9C7                          * 0A9E1
L_0A9E3:
        C=D     A                                * 0A9E3
        D0=C                                     * 0A9E5
        A=0     A                                * 0A9E8
        A=DAT0  B                                * 0A9EA
        A=A+1   A                                * 0A9ED
        A=A+1   A                                * 0A9EF
        A=A+A   A                                * 0A9F1
        C=C+A   A                                * 0A9F3
        D0=C                                     * 0A9F5
        RTNCC                                    * 0A9F8
L_0A9FA:
        CD0EX                                    * 0A9FA
        CD1EX                                    * 0A9FD
        D0=C                                     * 0AA00
        GOSUB   SUB_0A45D                        * 0AA03
        CD0EX                                    * 0AA07
        D1=C                                     * 0AA0A
        GOC     L_0A9C7                          * 0AA0D
        GONC    L_0A9E3                          * 0AA10
        AD0EX                                    * 0AA13
        D1=A                                     * 0AA16
        AD0EX                                    * 0AA19
        B=A     A                                * 0AA1C
        A=A+A   A                                * 0AA1E
        A=B     A                                * 0AA20
        GONC    L_0AA27                          * 0AA22
        A=-A    A                                * 0AA25
L_0AA27:
        C=C-1   A                                * 0AA27
        ?C#0    A                                * 0AA29
        GOYES   L_0AA32                          * 0AA2C
        GOTO    L_0AA87                          * 0AA2E
L_0AA32:
        ASR     A                                * 0AA32
        A=A-1   A                                * 0AA34
        R0=A.F  A                                * 0AA36
        D=C     A                                * 0AA3C
        RSTK=C                                   * 0AA3E
L_0AA40:
        A=DAT1  W                                * 0AA40
L_0AA44:
        AD0EX                                    * 0AA44
        A=A+B   A                                * 0AA47
        AD0EX                                    * 0AA49
        C=DAT0  W                                * 0AA4C
        CAEX    W                                * 0AA50
        DAT0=C  W                                * 0AA53
        D=D-1   A                                * 0AA57
        GONC    L_0AA44                          * 0AA59
        C=RSTK                                   * 0AA5C
        D=C     A                                * 0AA5E
        RSTK=C                                   * 0AA60
        DAT1=A  W                                * 0AA62
        D1=D1+  16                               * 0AA66
        CD1EX                                    * 0AA69
        D1=C                                     * 0AA6C
        D0=C                                     * 0AA6F
        C=R0.F  A                                * 0AA72
        C=C-1   A                                * 0AA78
        R0=C.F  A                                * 0AA7A
        GONC    L_0AA40                          * 0AA80
        C=RSTK                                   * 0AA83
        RTN                                      * 0AA85
L_0AA87:
        AD0EX                                    * 0AA87
        A=A+B   A                                * 0AA8A
        AD0EX                                    * 0AA8C
        B=A     A                                * 0AA8F
        BSR     A                                * 0AA91
        B=B-1   A                                * 0AA93
L_0AA95:
        C=DAT1  W                                * 0AA95
        A=DAT0  W                                * 0AA99
        DAT1=A  W                                * 0AA9D
        DAT0=C  W                                * 0AAA1
        D0=D0+  16                               * 0AAA5
        D1=D1+  16                               * 0AAA8
        B=B-1   A                                * 0AAAB
        GONC    L_0AA95                          * 0AAAD
        RTN                                      * 0AAB0
        RPL

* #port -> present? writeable? merged? #size #addr
* refs (8): 08FAD 0929E 09348 0B5FC 21875 21945 ...
PORTSTATUS:
        :: FalseFalse FALSE PORTSTATUS~2 TOTEMPOB OBJ_7028A 6ROLL * 0AAB2
          PORTSTATUS~1 ;                         * 0AAD5
        ASSEMBLE
L_0AADF:
        A=0     A                                * 0AADF
        ?B=0    A                                * 0AAE1
        GOYES   L_0AAFD                          * 0AAE4
        C=B     A                                * 0AAE6
        B=B+B   A                                * 0AAE8
        B=B+B   A                                * 0AAEA
        B=B+C   A                                * 0AAEC
        LC(5)   LIB00D.message+10                * 0AAEE  table indexed by 4*B+C
        C=C+B   A                                * 0AAF5
        D0=C                                     * 0AAF7
        A=DAT0  A                                * 0AAFA
L_0AAFD:
        C=DAT1  A                                * 0AAFD
        D1=C                                     * 0AB00
        D1=D1+  5                                * 0AB03
        C=D     A                                * 0AB06
        DAT1=C  A                                * 0AB08
        D1=D1+  5                                * 0AB0B
        DAT1=A  A                                * 0AB0E
L_0AB11:
        GOSBVL  GETPTR                           * 0AB11
        A=DAT0  A                                * 0AB18
        D0=D0+  5                                * 0AB1B
        PC=(A)                                   * 0AB1E
        RPL

* #port -> #addr
* refs (1): 218E6
PORTEND:
        :: OBJ_7028A SWAP PORTEND~1 ;            * 0AB22

* refs (1): 0AB31
PORTEND~1:
        CON(5)  (*)+5                            * 0AB3B  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 0AB40
        GOSBVL  SAVPTR                           * 0AB47
        B=A     A                                * 0AB4E
        B=B-1   A                                * 0AB50
        GONC    L_0AB57                          * 0AB52
        B=0     A                                * 0AB55
L_0AB57:
        C=A     A                                * 0AB57
        A=A+A   A                                * 0AB59
        A=A+A   A                                * 0AB5B
        A=A+C   A                                * 0AB5D
        LC(5)   PORT0EOS                         * 0AB5F
        A=A+C   A                                * 0AB66
        D0=A                                     * 0AB68
        C=DAT0  A                                * 0AB6B
        D=C     A                                * 0AB6E
        GOTO    L_0AADF                          * 0AB70
        BSS     14                               * 0AB74  zeros
        RPL

* #addr -> backup/library #nextaddr
* refs (5): 08FDF 093D9 17E70 17E84 21981
NEXTLIBBAK:
        :: NEXTLIBBAK~1 TOTEMPOB TRUE NEXTLIBBAK~2 ; * 0AB82
        ASSEMBLE

* refs (2): 02173 7DFDD
SUB_0ABA0:
        ST=0    1                                * 0ABA0
        ST=0    0                                * 0ABA3
        ST=0    5                                * 0ABA6
        C=0     A                                * 0ABA9
        R1=C.F  A                                * 0ABAB
        D0=(5)  ROMPARTS                         * 0ABB1
        C=DAT0  A                                * 0ABB8
        GOSUB   SUB_0AE6B                        * 0ABBB
        CD0EX                                    * 0ABBF
        GOSUB   SUB_0B017                        * 0ABC2
        GOSUB   SUB_0AFEE                        * 0ABC6
        GOC     L_0AC06                          * 0ABCA
        ?ABIT=1 1                                * 0ABCD
        GOYES   L_0ABDF                          * 0ABD2
        GOSUB   SUB_0AE71                        * 0ABD4
        CD0EX                                    * 0ABD8
        GOSUB   SUB_0B023                        * 0ABDB
L_0ABDF:
        GOSUB   SUB_0ABE6                        * 0ABDF
        GONC    L_0AC06                          * 0ABE3

* refs (4): 0ABDF 0AC30 0AD24 0AD4B
SUB_0ABE6:
        LC(5)   #C0000                           * 0ABE6
        UNCNFG                                   * 0ABED
        LC(5)   #FF000                           * 0ABF0
        CONFIG                                   * 0ABF7
        LC(5)   #7E000                           * 0ABFA
        CONFIG                                   * 0AC01
        RTNCC                                    * 0AC04
L_0AC06:
        A=0     W                                * 0AC06
        R3=A                                     * 0AC09
        GOSUB   SUB_0AFF9                        * 0AC0C
        GOC     L_0AC34                          * 0AC10
        GOSUB   SUB_0AD94                        * 0AC13
L_0AC17:
        LC(5)   #C0000                           * 0AC17
        GOSUB   SUB_0AE71                        * 0AC1E
        CD0EX                                    * 0AC22
        GOSUB   SUB_0B02F                        * 0AC25
        GOSUB   SUB_0AD94                        * 0AC29
        GONC    L_0AC17                          * 0AC2D
        GOSUB   SUB_0ABE6                        * 0AC30
L_0AC34:
        LC(5)   RomLibTable                      * 0AC34
        GOSUB   SUB_0AE62                        * 0AC3B
        GOSUB   L_0AD4F                          * 0AC3F
        GOSUB   SUB_0AFDD                        * 0AC43
        LC(1)   #8                               * 0AC47
        D0=D0-  11                               * 0AC4A
L_0AC4D:
        D0=D0+  16                               * 0AC4D
        B=B-1   A                                * 0AC50
        GOC     L_0AC64                          * 0AC52
        A=DAT0  B                                * 0AC55
        A=A+C   P                                * 0AC58
        DAT0=A  B                                * 0AC5B
        GOC     L_0AC4D                          * 0AC5E
        ST=1    1                                * 0AC61
L_0AC64:
        GOLONG  L_0B5AF                          * 0AC64

* refs (1): 0217A
* Warm start: rebuild ROMPTAB from the ROM library table, reconfigure the bank switcher and ports
SUB_0AC6A:
        GOSBVL  SUB_0249F                        * 0AC6A
        GOSBVL  SUB_02593                        * 0AC71
        GOSBVL  SUB_0266F                        * 0AC78
        D0=(5)  USEROB                           * 0AC7F
        A=DAT0  A                                * 0AC86
        D0=A                                     * 0AC89
        D0=D0+  5                                * 0AC8C
        C=0     A                                * 0AC8F
        C=DAT0  X                                * 0AC91
        A=0     A                                * 0AC95
        DAT0=A  X                                * 0AC97
        D0=D0+  3                                * 0AC9B
        AD0EX                                    * 0AC9E
        D=C     A                                * 0ACA1
        D=D+D   A                                * 0ACA3
        D=D+C   A                                * 0ACA5
        CSL     A                                * 0ACA7
        C=C-D   A                                * 0ACA9
        GOSUBL  MOVEDSU                          * 0ACAB
        GOSUBL  ROOM                             * 0ACB1
        A=R1.F  A                                * 0ACB7
L_0ACBD:
        B=A     A                                * 0ACBD
        ASL     A                                * 0ACBF
        ABEX    A                                * 0ACC1
        ?B<=C   A                                * 0ACC3
        GOYES   L_0ACD7                          * 0ACC6
        ST=1    0                                * 0ACC8
        A=A-1   A                                * 0ACCB
        R1=A.F  A                                * 0ACCD
        GOTO    L_0ACBD                          * 0ACD3
L_0ACD7:
        D0=(5)  ROMPTAB                          * 0ACD7
        DAT0=A  X                                * 0ACDE
        D0=D0+  3                                * 0ACE2
        C=B     A                                * 0ACE5
        GOSBVL  SUB_02541                        * 0ACE7
        AD0EX                                    * 0ACEE
        GOSUBL  MOVERSU                          * 0ACF1
        B=0     A                                * 0ACF7
* Address of the ROM library table
        LC(5)   RomLibTable                      * 0ACF9
        GOSUB   SUB_0AE06                        * 0AD00
        D1=(5)  ROMPARTS                         * 0AD04
        C=DAT1  A                                * 0AD0B
        GOSUB   SUB_0AE0F                        * 0AD0E
        GOSUB   SUB_0AFEE                        * 0AD12
        GOC     L_0AD28                          * 0AD16
        ?ABIT=1 1                                * 0AD19
        GOYES   L_0AD24                          * 0AD1E
        GOSUB   SUB_0AE0F                        * 0AD20
L_0AD24:
        GOSUB   SUB_0ABE6                        * 0AD24
L_0AD28:
        A=0     W                                * 0AD28
        R3=A                                     * 0AD2B
        GOSUB   SUB_0AFF9                        * 0AD2E
        GOC     L_0AD4F                          * 0AD32
        GOSUB   SUB_0AD94                        * 0AD35
L_0AD39:
        LC(5)   #C0000                           * 0AD39
        GOSUB   SUB_0AE15                        * 0AD40
        GOSUB   SUB_0AD94                        * 0AD44
        GONC    L_0AD39                          * 0AD48
        GOSUB   SUB_0ABE6                        * 0AD4B
L_0AD4F:
        LC(5)   #7F000                           * 0AD4F
        UNCNFG                                   * 0AD56
        LC(5)   #7E000                           * 0AD59
        UNCNFG                                   * 0AD60
        UNCNFG                                   * 0AD63
        LC(5)   #FF000                           * 0AD66
        CONFIG                                   * 0AD6D
        LC(5)   #7F000                           * 0AD70
        CONFIG                                   * 0AD77
        LC(5)   #7E000                           * 0AD7A
        D0=(5)  #80530                           * 0AD81
        GOSUBL  SUB_09B26                        * 0AD88
        GOLONG  SUB_09B26                        * 0AD8E

* refs (4): 0AC13 0AC29 0AD35 0AD44
SUB_0AD94:
        C=R3                                     * 0AD94
        P=      13                               * 0AD97
        C=C+1   P                                * 0AD99
        GONC    L_0ADA4                          * 0AD9C
        P=      14                               * 0AD9F
        C=C+1   P                                * 0ADA1
L_0ADA4:
        P=      0                                * 0ADA4
        RTNC                                     * 0ADA6
        R3=C                                     * 0ADA9
        C=0     A                                * 0ADAC
        P=C     14                               * 0ADAE
        CPEX    1                                * 0ADB2
        P=C     13                               * 0ADB6
        CPEX    0                                * 0ADBA
        D0=(5)  #80533                           * 0ADBE
        A=DAT0  B                                * 0ADC5
        ?C>A    B                                * 0ADC8
        RTNYES                                   * 0ADCB
        D0=C                                     * 0ADCD
        A=C     A                                * 0ADD0
        C=C+C   A                                * 0ADD2
        C=C+C   A                                * 0ADD4
        A=A+C   A                                * 0ADD6
        LC(5)   LIB00D.message+10                * 0ADD8  same table
        C=C+A   A                                * 0ADDF
        CD0EX                                    * 0ADE1
        A=DAT0  A                                * 0ADE4
        P=      9                                * 0ADE7
        ASL     WP                               * 0ADE9
        ASL     WP                               * 0ADEC
        ASL     WP                               * 0ADEF
        ASL     WP                               * 0ADF2
        ASL     WP                               * 0ADF5
        R3=A.F  WP                               * 0ADF8
        P=      0                                * 0ADFE
        GOLONG  L_09CFA                          * 0AE00

* refs (1): 0AD00
SUB_0AE06:
        C=0     S                                * 0AE06
        C=C-1   S                                * 0AE09
        GOC     L_0AE18                          * 0AE0C

* refs (2): 0AD0E 0AD20
SUB_0AE0F:
        A=0     W                                * 0AE0F
        R3=A                                     * 0AE12

* refs (1): 0AD40
SUB_0AE15:
        C=0     S                                * 0AE15
L_0AE18:
        P=      0                                * 0AE18
        A=R1.F  A                                * 0AE1A
        ?A=B    A                                * 0AE20
        RTNYES                                   * 0AE23
        GOSUB   SUB_0AEBE                        * 0AE25
        GOSUB   SUB_0AF72                        * 0AE29
        C=B     A                                * 0AE2D
        RSTK=C                                   * 0AE2F
        D0=(5)  #80996                           * 0AE31
L_0AE38:
        D0=D0+  16                               * 0AE38
        B=B-1   A                                * 0AE3B
        GOC     L_0AE49                          * 0AE3D
        C=DAT0  13                               * 0AE40
        ?C<=A   X                                * 0AE44
        GOYES   L_0AE38                          * 0AE47
L_0AE49:
        DAT0=A  13                               * 0AE49
        A=C     W                                * 0AE4D
        GONC    L_0AE38                          * 0AE50
        C=RSTK                                   * 0AE53
        B=C     A                                * 0AE55
        B=B+1   A                                * 0AE57
        C=R3.F  A                                * 0AE59
        GONC    L_0AE18                          * 0AE5F

* refs (1): 0AC3B
SUB_0AE62:
        C=0     S                                * 0AE62
        C=C-1   S                                * 0AE65
        GOC     L_0AE83                          * 0AE68

* refs (1): 0ABBB
SUB_0AE6B:
        A=0     W                                * 0AE6B
        R3=A                                     * 0AE6E

* refs (2): 0ABD4 0AC1E
SUB_0AE71:
        C=0     S                                * 0AE71
        GOTO    L_0AE83                          * 0AE74
L_0AE78:
        ST=1    1                                * 0AE78
L_0AE7B:
        P=      0                                * 0AE7B
        C=R3.F  A                                * 0AE7D
L_0AE83:
        GOSUB   SUB_0AEBE                        * 0AE83
        C=R1.F  A                                * 0AE87
        C=C+1   A                                * 0AE8D
        R1=C.F  A                                * 0AE8F
        GOSUB   SUB_0AF72                        * 0AE95
        GOSUB   SUB_0AFDD                        * 0AE99
        P=      12                               * 0AE9D
        D0=D0-  13                               * 0AE9F
L_0AEA2:
        D0=D0+  16                               * 0AEA2
        B=B-1   A                                * 0AEA5
        GOC     L_0AE78                          * 0AEA7
        C=DAT0  WP                               * 0AEAA
        ?C#A    WP                               * 0AEAE
        GOYES   L_0AEA2                          * 0AEB1
        CBIT=1  11                               * 0AEB3
        DAT0=C  A                                * 0AEB8
        GONC    L_0AE7B                          * 0AEBB

* refs (2): 0AE25 0AE83
SUB_0AEBE:
        ?C=0    S                                * 0AEBE
        GOYES   L_0AEC7                          * 0AEC1
        GOTO    L_0AF50                          * 0AEC3
L_0AEC7:
        D0=C                                     * 0AEC7
        A=DAT0  A                                * 0AECA
        ?A#0    A                                * 0AECD
        GOYES   L_0AF07                          * 0AED0
L_0AED2:
        P=      0                                * 0AED2
        C=RSTK                                   * 0AED4
        C=0     S                                * 0AED6
        RTNCC                                    * 0AED9
L_0AEDB:
        C=C+A   A                                * 0AEDB
        R3=C.F  A                                * 0AEDD
        D0=D0+  5                                * 0AEE3
        GOSUBL  SKIPVARNAME                      * 0AEE6
        A=R3                                     * 0AEEC
        AD0EX                                    * 0AEEF
        D0=A                                     * 0AEF2
        ASL     W                                * 0AEF5
        ASL     W                                * 0AEF8
        ASL     W                                * 0AEFB
        A=DAT0  X                                * 0AEFE
        C=0     S                                * 0AF02
        RTN                                      * 0AF05
L_0AF07:
        LC(5)   DOBAK                            * 0AF07
        ?C=A    A                                * 0AF0E
        GOYES   L_0AF3B                          * 0AF11
        LC(5)   DOLIB                            * 0AF13
        ?C#A    A                                * 0AF1A
        GOYES   L_0AF34                          * 0AF1D
        GOSUBL  CKLBCRC                          * 0AF1F
        D0=C                                     * 0AF25
        GOC     L_0AF31                          * 0AF28
        A=DAT0  A                                * 0AF2B
        GONC    L_0AEDB                          * 0AF2E
L_0AF31:
        D0=D0-  5                                * 0AF31
L_0AF34:
        ST=1    5                                * 0AF34
        GOTO    L_0AED2                          * 0AF37
L_0AF3B:
        GOSUBL  CKLBCRC                          * 0AF3B
        D0=C                                     * 0AF41
        GOC     L_0AF31                          * 0AF44
        A=DAT0  A                                * 0AF47
        C=C+A   A                                * 0AF4A
        GOTO    L_0AEC7                          * 0AF4C
L_0AF50:
        P=      0                                * 0AF50
        D0=C                                     * 0AF52
        A=DAT0  13                               * 0AF55
        D0=D0+  13                               * 0AF59
        CD0EX                                    * 0AF5C
        R3=C.F  A                                * 0AF5F
        A=A+1   X                                * 0AF65
        GONC    L_0AF6D                          * 0AF68
        C=RSTK                                   * 0AF6B
L_0AF6D:
        A=A-1   X                                * 0AF6D
        RTNCC                                    * 0AF70

* refs (2): 0AE29 0AE95
SUB_0AF72:
        P=      7                                * 0AF72
        C=A     WP                               * 0AF74
        P=      0                                * 0AF77
        D0=(5)  #80535                           * 0AF79
        C=DAT0  1                                * 0AF80
        C=C-1   P                                * 0AF84
        GOC     L_0AF95                          * 0AF87
        C=C+1   P                                * 0AF8A
        C=C+1   P                                * 0AF8D
        GOC     L_0AFB8                          * 0AF90
        RTN                                      * 0AF93
L_0AF95:
        C=A     P                                * 0AF95
        P=      8                                * 0AF98
        LC(5)   L_72386                          * 0AF9A  access handler, put into the library table entries
        P=      12                               * 0AFA1
        ?C#A    WP                               * 0AFA3
        GOYES   L_0AFB6                          * 0AFA6
        P=      8                                * 0AFA8
        LC(5)   #00000                           * 0AFAA
        P=      12                               * 0AFB1
        A=C     WP                               * 0AFB3
L_0AFB6:
        P=      0                                * 0AFB6
L_0AFB8:
        C=A     P                                * 0AFB8
        P=      8                                * 0AFBB
        LC(5)   L_70B38                          * 0AFBD  access handler
        P=      12                               * 0AFC4
        ?C#A    WP                               * 0AFC6
        GOYES   L_0AFD9                          * 0AFC9
        P=      8                                * 0AFCB
        LC(5)   #00000                           * 0AFCD
        P=      12                               * 0AFD4
        A=C     WP                               * 0AFD6
L_0AFD9:
        P=      0                                * 0AFD9
        RTN                                      * 0AFDB

* refs (2): 0AC43 0AE99
SUB_0AFDD:
        D0=(5)  ROMPTAB                          * 0AFDD
        C=0     A                                * 0AFE4
        C=DAT0  X                                * 0AFE6
        B=C     A                                * 0AFEA
        RTN                                      * 0AFEC

* refs (2): 0ABC6 0AD12
SUB_0AFEE:
        D0=(5)  #8052F                           * 0AFEE
        GOTO    L_0B000                          * 0AFF5

* refs (2): 0AC0C 0AD2E
SUB_0AFF9:
        D0=(5)  #80531                           * 0AFF9
L_0B000:
        LC(5)   #C0000                           * 0B000
        A=DAT0  1                                * 0B007
        D0=D0+  1                                * 0B00B
        ?ABIT=0 3                                * 0B00E
        RTNYES                                   * 0B013
        RTN                                      * 0B015

* refs (1): 0ABC2
SUB_0B017:
        D0=(5)  PORT0EOS                         * 0B017
        DAT0=C  A                                * 0B01E
        RTN                                      * 0B021

* refs (1): 0ABDB
SUB_0B023:
        D0=(5)  PORT1EOS                         * 0B023
        DAT0=C  A                                * 0B02A
        RTN                                      * 0B02D

* refs (1): 0AC25
SUB_0B02F:
        CR3EX                                    * 0B02F
        C=0     A                                * 0B032
        P=C     14                               * 0B034
        CPEX    1                                * 0B038
        P=C     13                               * 0B03C
        CPEX    0                                * 0B040
        C=C-1   A                                * 0B044
        A=C     A                                * 0B046
        A=A+A   A                                * 0B048
        A=A+A   A                                * 0B04A
        A=A+C   A                                * 0B04C
        LC(5)   PORT2EOS                         * 0B04E
        C=C+A   A                                * 0B055
        D0=C                                     * 0B057
        CR3EX                                    * 0B05A
        DAT0=C  A                                * 0B05D
        RTN                                      * 0B060
        RPL

* refs (2): 0928F 21ADA
sto0!(bk):
        :: GARBAGE FREEINTEMP? ?SKIP TOTEMPOB    * 0B062
          OBJ_0B09E MEM #< ?SKIP SETMEMERR       * 0B07B
          sto0!(lb)NoChk ;                       * 0B094

* refs (2): 0B07B 0B638
OBJ_0B09E:
        # 36                                     * 0B09E  54

* refs (1): 0B094
sto0!(lb)NoChk:
        CON(5)  (*)+5                            * 0B0A8  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 0B0AD
        D1=D1+  5                                * 0B0B0
        D=D+1   A                                * 0B0B3
        GOSBVL  SAVPTR                           * 0B0B5
        D0=A                                     * 0B0BC
        CD1EX                                    * 0B0BF
        C=C-B   A                                * 0B0C2
        D1=(5)  INITEN                           * 0B0C4
        C=DAT1  S                                * 0B0CB
        R4=C.F  S                                * 0B0CF
        C=0     S                                * 0B0D5
        DAT1=C  S                                * 0B0D8
        D1=(5)  ROMPARTS                         * 0B0DC
        A=DAT1  A                                * 0B0E3
        A=A-1   A                                * 0B0E6
        DAT1=A  A                                * 0B0E8
        A=A+1   A                                * 0B0EB
        D1=A                                     * 0B0ED
        D0=D0+  5                                * 0B0F0
        A=DAT0  A                                * 0B0F3
        D0=D0-  5                                * 0B0F6
        A=A+CON A,5                              * 0B0F9
        CAEX    A                                * 0B0FF
        GOSBVL  SUB_06BD6                        * 0B101
        A=B     A                                * 0B108
        LC(5)   #00006                           * 0B10A
        A=A+C   A                                * 0B111
        A=A-1   A                                * 0B113
        GOSBVL  MOVERSD                          * 0B115
        D1=(5)  ROMPARTS                         * 0B11C
        A=DAT1  A                                * 0B123
        A=A+1   A                                * 0B126
        DAT1=A  A                                * 0B128
        D1=(5)  INITEN                           * 0B12B
        C=R4.F  S                                * 0B132
        DAT1=C  S                                * 0B138
        GOSBVL  GETPTR                           * 0B13C
        A=DAT0  A                                * 0B143
        D0=D0+  5                                * 0B146
        PC=(A)                                   * 0B149
        RPL

* refs (2): 0946A 17EDE
purge(bk,s):
        ::                                       * 0B14D

* refs (1): 0B22C
OBJ_0B152:
          :: BEGIN DUP purge(bk,s)~1 NOT UNTIL ; Purge!(lb,s) ; * 0B152

* refs (1): 0B175
Purge!(lb,s):
        CON(5)  (*)+5                            * 0B17F  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 0B184
        D1=D1+  5                                * 0B187
        D=D+1   A                                * 0B18A
        GOSBVL  SAVPTR                           * 0B18C
        B=A     A                                * 0B193
        D0=A                                     * 0B195
        GOSBVL  SKIPOB                           * 0B198
        LC(5)   DSKTOP                           * 0B19F
        CD0EX                                    * 0B1A6
        C=C-B   A                                * 0B1A9
        R1=C.F  A                                * 0B1AB
        A=DAT0  A                                * 0B1B1
        GOSUB   SUB_0B2D1                        * 0B1B4
        C=R1.F  A                                * 0B1B8
        GOSUB   SUB_0B343                        * 0B1BE
        D1=(5)  INITEN                           * 0B1C2
        C=DAT1  S                                * 0B1C9
        R0=C.F  S                                * 0B1CD
        C=0     S                                * 0B1D3
        DAT1=C  S                                * 0B1D6
        A=B     A                                * 0B1DA
        D0=(5)  ROMPARTS                         * 0B1DC
        C=DAT0  A                                * 0B1E3
        C=C-CON A,5                              * 0B1E6
        DAT0=C  A                                * 0B1EC
        C=R1.F  A                                * 0B1EF
        GOSBVL  MOVEDSU                          * 0B1F5
        D0=(5)  ROMPARTS                         * 0B1FC
        C=DAT0  A                                * 0B203
        C=C+CON A,5                              * 0B206
        DAT0=C  A                                * 0B20C
        D1=(5)  INITEN                           * 0B20F
        C=R0.F  S                                * 0B216
        DAT1=C  S                                * 0B21C
        GOVLNG  GETPTRLOOP                       * 0B220
        RPL

* refs (1): 0944C
PurgeBkp12(nm,s)~5:
        :: OBJ_0B152 OBJ_0B23B ;                 * 0B227

* refs (1): 0B231
OBJ_0B23B:
        CON(5)  L_71324                          * 0B23B  code object: the address of its machine code
        ASSEMBLE
L_0B240:
        GOSUB   SUB_0B2D5                        * 0B240
        ?ST=1   1                                * 0B244
        GOYES   L_0B266                          * 0B247
        C=R0.F  A                                * 0B249
        GOSUB   SUB_0B347                        * 0B24F
        C=R0.F  A                                * 0B253
        GOSBVL  SUB_06863                        * 0B259
        ST=0    1                                * 0B260
        GONC    L_0B270                          * 0B263
L_0B266:
        C=R3.F  A                                * 0B266
        GOSUB   SUB_0B2AF                        * 0B26C
L_0B270:
        A=R1.F  A                                * 0B270
        D0=A                                     * 0B276
        C=R2.F  A                                * 0B279
        D1=C                                     * 0B27F
        C=B     A                                * 0B282
        C=C-A   A                                * 0B284
        GOSBVL  MOVEDOWN                         * 0B286
        C=R3.F  S                                * 0B28D
        DAT1=C  S                                * 0B293
        ?ST=0   1                                * 0B297
        GOYES   L_0B2A8                          * 0B29A
        C=R3.F  A                                * 0B29C
        P=      1                                * 0B2A2
        GOSUB   SUB_0B2AF                        * 0B2A4
L_0B2A8:
        GOVLNG  GETPTRLOOP                       * 0B2A8

* refs (2): 0B26C 0B2A4
SUB_0B2AF:
        RSTK=C                                   * 0B2AF
        RTN                                      * 0B2B1

* refs (4): 0B2C4 0B2D1 0B336 0B343
SUB_0B2B3:
        CD0EX                                    * 0B2B3
        C=A     A                                * 0B2B6
        P=      10                               * 0B2B8
        A=0     WP                               * 0B2BA
        A=C     A                                * 0B2BD
        CD0EX                                    * 0B2BF
        RTN                                      * 0B2C2

* refs (1): 0B80C
SUB_0B2C4:
        GOSUB   SUB_0B2B3                        * 0B2C4
        C=0     S                                * 0B2C8
        C=C-1   S                                * 0B2CB
        GOC     L_0B2D8                          * 0B2CE

* refs (4): 0B1B4 0B4F9 0B57E 0B753
SUB_0B2D1:
        GOSUB   SUB_0B2B3                        * 0B2D1

* refs (2): 0B240 0B94E
SUB_0B2D5:
        C=0     S                                * 0B2D5
L_0B2D8:
        GOVLNG  L_7141B                          * 0B2D8
L_0B2DF:
        C=A     A                                * 0B2DF
        ?C#A    WP                               * 0B2E1
        RTNYES                                   * 0B2E4
        C=DAT0  A                                * 0B2E6
        ?C<A    A                                * 0B2E9
        GOYES   L_0B2FA                          * 0B2EC
        ?B<=C   A                                * 0B2EE
        GOYES   L_0B2FA                          * 0B2F1
        C=C+D   A                                * 0B2F3
        DAT0=C  A                                * 0B2F5
        RTN                                      * 0B2F8
L_0B2FA:
        ?C=0    S                                * 0B2FA
        RTNYES                                   * 0B2FD
        ABEX    A                                * 0B2FF
        AR1EX.F A                                * 0B301
        ABEX    A                                * 0B307
        AR0EX.F A                                * 0B309
        ?C<A    A                                * 0B30F
        GOYES   L_0B324                          * 0B312
        ?B<=C   A                                * 0B314
        GOYES   L_0B324                          * 0B317
        AR2EX                                    * 0B319
        C=C+A   A                                * 0B31C
        AR2EX                                    * 0B31E
        DAT0=C  A                                * 0B321
L_0B324:
        ABEX    A                                * 0B324
        AR1EX.F A                                * 0B326
        ABEX    A                                * 0B32C
        AR0EX.F A                                * 0B32E
        RTN                                      * 0B334

* refs (1): 0B814
SUB_0B336:
        GOSUB   SUB_0B2B3                        * 0B336
        C=0     S                                * 0B33A
        C=C-1   S                                * 0B33D
        GOC     L_0B34A                          * 0B340

* refs (5): 0B1BE 0B3DA 0B4F3 0B584 0B759
SUB_0B343:
        GOSUB   SUB_0B2B3                        * 0B343

* refs (2): 0B24F 0B956
SUB_0B347:
        C=0     S                                * 0B347
L_0B34A:
        GOVLNG  L_714F1                          * 0B34A

* refs (1): 0B161
purge(bk,s)~1:
        CON(5)  purge(bk,s)~2                    * 0B351  code object: the address of its machine code
L_0B356:
        C=R3.F  A                                * 0B356
        D1=C                                     * 0B35C
        C=R0.F  A                                * 0B35F
        B=C     A                                * 0B365
        D0=(5)  ROMPTAB                          * 0B367
        C=0     A                                * 0B36E
        C=DAT0  X                                * 0B370
        C=C-1   A                                * 0B374
        GOC     L_0B3A4                          * 0B376
        D=C     A                                * 0B379
        D0=D0-  5                                * 0B37B
L_0B37E:
        D0=D0+  11                               * 0B37E
        C=DAT0  A                                * 0B381
        D0=D0+  5                                * 0B384
        ?B>C    A                                * 0B387
        GOYES   L_0B39F                          * 0B38A
        ?C>A    A                                * 0B38C
        GOYES   L_0B39F                          * 0B38F
        C=DAT0  A                                * 0B391
        AD1EX                                    * 0B394
        ?C=A    A                                * 0B397
        GOYES   L_0B3AB                          * 0B39A
        AD1EX                                    * 0B39C
L_0B39F:
        D=D-1   A                                * 0B39F
        GONC    L_0B37E                          * 0B3A1
L_0B3A4:
        GOVLNG  GETPTRFALSE                      * 0B3A4
L_0B3AB:
        P=      0                                * 0B3AB
        D1=(5)  ROMPTAB                          * 0B3AD
        C=DAT1  X                                * 0B3B4
        C=C-1   X                                * 0B3B8
        DAT1=C  X                                * 0B3BB
        D0=D0+  8                                * 0B3BF
        AD0EX                                    * 0B3C2
        D1=(5)  RSKTOP                           * 0B3C5
        C=DAT1  A                                * 0B3CC
        B=C     A                                * 0B3CF
        LC(5)   #00010                           * 0B3D1
        C=-C    A                                * 0B3D8
        GOSUBL  SUB_0B343                        * 0B3DA
        LC(5)   #00010                           * 0B3E0
        GOSBVL  MOVERSD                          * 0B3E7
        LC(5)   #00010                           * 0B3EE
        GOSBVL  SUB_02537                        * 0B3F5
        GOSBVL  disprange                        * 0B3FC
        P=      0                                * 0B403
        GOVLNG  GETPTRTRUE                       * 0B405

* refs (2): 213C0 C0937
OBJ_0B40C:
        CON(5)  (*)+5                            * 0B40C  primitive code object
        GOSBVL  POP#                             * 0B411
        GOSBVL  SAVPTR                           * 0B418
        A=A-1   A                                * 0B41F
        ST=1    5                                * 0B421
        ?A=0    A                                * 0B424
        GOYES   L_0B42D                          * 0B427
        GOTO    L_0B45D                          * 0B429
L_0B42D:
        GOSBVL  DisableIntr                      * 0B42D
        D1=(5)  #8052F                           * 0B434
        A=DAT1  B                                * 0B43B
        R0=A                                     * 0B43E
        ?ABIT=0 3                                * 0B441
        GOYES   L_0B456                          * 0B446
        ?ABIT=0 2                                * 0B448
        GOYES   L_0B456                          * 0B44D
        ?ABIT=0 1                                * 0B44F
        GOYES   L_0B471                          * 0B454
L_0B456:
        GOSBVL  AllowIntr                        * 0B456
L_0B45D:
        GOSBVL  GETPTR                           * 0B45D
        LC(5)   SETPORTNOTAV                     * 0B464
        A=C     A                                * 0B46B
        PC=(A)                                   * 0B46D
L_0B471:
        NOP4                                     * 0B471
        D1=(5)  #8052F                           * 0B475
        LC(1)   #E                               * 0B47C
        DAT1=C  1                                * 0B47F
        LC(5)   #C0000                           * 0B483
        A=C     A                                * 0B48A
        C=DAT1  B                                * 0B48C
        P=      1                                * 0B48F
        C=C-1   P                                * 0B491
        C=C-1   P                                * 0B494
        LC(5)   #F0000                           * 0B497
        GOC     L_0B4A8                          * 0B49E
        LC(5)   #C0000                           * 0B4A1
L_0B4A8:
        P=      5                                * 0B4A8
        CSR     WP                               * 0B4AA
        P=      0                                * 0B4AD
        R2=C.F  A                                * 0B4AF
        R3=A.F  A                                * 0B4B5
        D1=(5)  ROMPARTS                         * 0B4BB
        C=DAT1  A                                * 0B4C2
        D=C     A                                * 0B4C5
        C=C-CON A,5                              * 0B4C7
        DAT1=C  A                                * 0B4CD
        D1=(5)  RAMEND                           * 0B4D0
        C=DAT1  A                                * 0B4D7
        B=C     A                                * 0B4DA
        D1=(5)  PORT0EOS                         * 0B4DC
        A=DAT1  A                                * 0B4E3
        DAT1=C  A                                * 0B4E6
        C=C-A   A                                * 0B4E9
        CAEX    A                                * 0B4EB
        RSTK=C                                   * 0B4ED
        C=D     A                                * 0B4EF
        CAEX    A                                * 0B4F1
        GOSUB   SUB_0B343                        * 0B4F3
        C=D     A                                * 0B4F7
        GOSUB   SUB_0B2D1                        * 0B4F9
        C=RSTK                                   * 0B4FD
        A=C     A                                * 0B4FF
        C=D     A                                * 0B501
        GOSBVL  MOVEDSU                          * 0B503
        D1=(5)  ROMPARTS                         * 0B50A
        C=DAT1  A                                * 0B511
        C=C+CON A,5                              * 0B514
        DAT1=C  A                                * 0B51A
        C=R2.F  A                                * 0B51D
        C=-C    A                                * 0B523
        A=R3.F  A                                * 0B525
        A=A+C   A                                * 0B52B
        GONC    L_0B538                          * 0B52D
        A=0     A                                * 0B530
        A=A-CON A,5                              * 0B532
L_0B538:
        D1=(5)  RAMEND                           * 0B538
        DAT1=A  A                                * 0B53F
        D1=(5)  PORT1EOS                         * 0B542
        ?ST=1   5                                * 0B549
        GOYES   L_0B555                          * 0B54C
        D1=(5)  PORT2EOS                         * 0B54E
L_0B555:
        C=DAT1  A                                * 0B555
        D1=(5)  PORT0EOS                         * 0B558
        DAT1=C  A                                * 0B55F
        CAEX    A                                * 0B562
        A=A+CON A,5                              * 0B564
        GOC     L_0B593                          * 0B56A
        B=A     A                                * 0B56D
        C=C-A   A                                * 0B56F
        GOC     L_0B593                          * 0B571
        D1=(5)  ROMPARTS                         * 0B574
        A=DAT1  A                                * 0B57B
        GOSUB   SUB_0B2D1                        * 0B57E
        C=D     A                                * 0B582
        GOSUB   SUB_0B343                        * 0B584
        A=B     A                                * 0B588
        C=D     A                                * 0B58A
        GOSBVL  MOVEDSU                          * 0B58C
L_0B593:
        GOSUBL  COMPCONFCRC                      * 0B593
        DAT0=C  4                                * 0B599
        GOSUB   L_0B5AF                          * 0B59D
        GOSBVL  AllowIntr                        * 0B5A1
        GOVLNG  GETPTRLOOP                       * 0B5A8
L_0B5AF:
        D0=(5)  PORT0EOS                         * 0B5AF
        A=DAT0  A                                * 0B5B6
        AD0EX                                    * 0B5B9
        C=0     A                                * 0B5BC
        DAT0=C  A                                * 0B5BE
        AD0EX                                    * 0B5C1
        D0=D0+  5                                * 0B5C4
        C=DAT0  A                                * 0B5C7
        ?C>A    A                                * 0B5CA
        GOYES   L_0B5D2                          * 0B5CD
        DAT0=A  A                                * 0B5CF
L_0B5D2:
        RTN                                      * 0B5D2
        RPL

* refs (2): 85682 856EB
free(li,r)~2:
        :: ZEROOVER #0=?SKIP free(li,r)~3 OVER #3+ ROLL DUP PORTSTATUS DROP * 0B5D4
          4UNROLL3DROP ROT2DUP BINT10 #+ #<case SETNOROOM * 0B606
          #- GARBAGE MEM SWAP OBJ_0B09E #+ #<case SETMEMERR * 0B624
          free(li,r)~4 ;                         * 0B64C

* refs (1): 0B5E3
free(li,r)~3:
        :: SWAP DUP BINT0 DO get1 DUP OSIZE 4ROLL #+ ROT LOOP SWAP pshm1 * 0B656
          BEGIN pullrev psh1& DUP#0= UNTIL DROP #1-SWAP ; * 0B69C

* refs (1): 0B64C
free(li,r)~4:
        :: free(li,r)~5 OVER#2+UNROL             * 0B6C4

* refs (1): 0B6F6
OBJ_0B6D3:
          { } OVER#2+UNROL DROP GARBAGE BEGIN DUP OBJ_0B6D3 EQ NOT_WHILE * 0B6D3
          free(li,r)~6 REPEAT DROP free(li,r)~7 ; * 0B705

* refs (1): 0B6C9
free(li,r)~5:
        CON(5)  (*)+5                            * 0B71E  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 0B723
        GOSBVL  DisableIntr                      * 0B72A
        ST=1    5                                * 0B731
        D1=(5)  RAMEND                           * 0B734
        A=DAT1  A                                * 0B73B
        B=A     A                                * 0B73E
        D1=(5)  ROMPARTS                         * 0B740
        A=DAT1  A                                * 0B747
        LC(5)   #00005                           * 0B74A
        C=-C    A                                * 0B751
        GOSUB   SUB_0B2D1                        * 0B753
        C=D     A                                * 0B757
        GOSUB   SUB_0B343                        * 0B759
        A=B     A                                * 0B75D
        LC(5)   #00005                           * 0B75F
        GOSBVL  MOVEDSD                          * 0B766
        A=B     A                                * 0B76D
        D0=(5)  PORT1EOS                         * 0B76F
        DAT0=A  A                                * 0B776
        D0=(5)  RAMEND                           * 0B779
        DAT0=A  A                                * 0B780
        AD0EX                                    * 0B783
        C=0     A                                * 0B786
        DAT0=C  A                                * 0B788
        GOSBVL  AllowIntr                        * 0B78B
        GOVLNG  GETPTRLOOP                       * 0B792

* refs (1): 0B705
free(li,r)~6:
        CON(5)  (*)+5                            * 0B799  primitive code object
        GOSBVL  SAVPTR                           * 0B79E
        D0=(5)  ROMPARTS                         * 0B7A5
        A=DAT0  A                                * 0B7AC
        A=A-CON A,5                              * 0B7AF
        DAT0=A  A                                * 0B7B5
        A=DAT1  A                                * 0B7B8
        R0=A.F  A                                * 0B7BB
        GOSBVL  DisableIntr                      * 0B7C1
        A=R0.F  A                                * 0B7C8
        D0=A                                     * 0B7CE
        D0=D0+  5                                * 0B7D1
        C=DAT0  A                                * 0B7D4
        R3=C.F  A                                * 0B7D7
        AD0EX                                    * 0B7DD
        C=C+A   A                                * 0B7E0
        R1=C.F  A                                * 0B7E2
        D0=(5)  RAMEND                           * 0B7E8
        A=DAT0  A                                * 0B7EF
        B=A     A                                * 0B7F2
        A=A-C   A                                * 0B7F4
        R2=A.F  A                                * 0B7F6
        A=C     A                                * 0B7FC
        C=R3.F  A                                * 0B7FE
        C=C+CON A,5                              * 0B804
        C=-C    A                                * 0B80A
        GOSUBL  SUB_0B2C4                        * 0B80C
        C=D     A                                * 0B812
        GOSUB   SUB_0B336                        * 0B814
        GOSBVL  ROOM                             * 0B818
        B=C     A                                * 0B81F
        A=R0.F  A                                * 0B821
        D0=A                                     * 0B827
        C=R1.F  A                                * 0B82A
        C=C-A   A                                * 0B830
        D1=(5)  TEMPTOP                          * 0B832
        A=DAT1  A                                * 0B839
        D1=A                                     * 0B83C
        A=B     A                                * 0B83F
        GOSBVL  SUB_06CD7                        * 0B841
        GOSBVL  ROOM                             * 0B848
        B=C     A                                * 0B84F
        D0=(5)  DSKTOP                           * 0B851
        A=DAT0  A                                * 0B858
        D0=A                                     * 0B85B
        A=DAT0  A                                * 0B85E
        D0=A                                     * 0B861
        D0=D0+  5                                * 0B864
        C=DAT0  A                                * 0B867
        D0=D0-  5                                * 0B86A
        C=C+CON A,5                              * 0B86D
        D=C     A                                * 0B873
        D1=(5)  RAMEND                           * 0B875
        C=DAT1  A                                * 0B87C
        RSTK=C                                   * 0B87F
        C=C-D   A                                * 0B881
        DAT1=C  A                                * 0B883
        C=RSTK                                   * 0B886
        D1=C                                     * 0B888
        A=B     A                                * 0B88B
        C=D     A                                * 0B88D
        GOSBVL  SUB_06BD6                        * 0B88F
        GOSBVL  AllowIntr                        * 0B896
        D0=(5)  ROMPARTS                         * 0B89D
        A=DAT0  A                                * 0B8A4
        A=A+CON A,5                              * 0B8A7
        DAT0=A  A                                * 0B8AD
        GOSBVL  GETPTR                           * 0B8B0
        LC(5)   DROP                             * 0B8B7
        A=C     A                                * 0B8BE
        PC=(A)                                   * 0B8C0

* refs (1): 0B714
free(li,r)~7:
        CON(5)  (*)+5                            * 0B8C4  primitive code object
        GOSBVL  POP#                             * 0B8C9
        ST=1    5                                * 0B8D0
        GOSBVL  SAVPTR                           * 0B8D3
        GOSBVL  DisableIntr                      * 0B8DA
        ST=0    6                                * 0B8E1
        D0=(5)  #8052F                           * 0B8E4
        LC(5)   #C0000                           * 0B8EB
        B=C     A                                * 0B8F2
        A=DAT0  B                                * 0B8F4
        P=      1                                * 0B8F7
        A=A-1   P                                * 0B8F9
        A=A-1   P                                * 0B8FC
        P=      0                                * 0B8FF
        LC(5)   #F0000                           * 0B901
        GOC     L_0B912                          * 0B908
        LC(5)   #C0000                           * 0B90B
L_0B912:
        B=B-C   A                                * 0B912
        P=      5                                * 0B914
        CSL     WP                               * 0B916
        P=      6                                * 0B919
        LC(5)   #C0000                           * 0B91B
        P=      0                                * 0B922
        R0=C                                     * 0B924
        A=R0                                     * 0B927
        P=      5                                * 0B92A
        ASR     WP                               * 0B92C
        P=      0                                * 0B92F
        A=A+B   A                                * 0B931
        D0=(5)  RAMEND                           * 0B933
        C=DAT0  A                                * 0B93A
        DAT0=A  A                                * 0B93D
        C=A-C   A                                * 0B940
        D0=(5)  ROMPARTS                         * 0B942
        A=DAT0  A                                * 0B949
        B=B-1   A                                * 0B94C
        GOSUBL  SUB_0B2D5                        * 0B94E
        C=D     A                                * 0B954
        GOSUBL  SUB_0B347                        * 0B956
        C=D     A                                * 0B95C
        C=-C    A                                * 0B95E
        A=B     A                                * 0B960
        D0=A                                     * 0B962
        A=DAT0  S                                * 0B965
        R0=A.F  S                                * 0B969
        GOSBVL  MOVEDSD                          * 0B96F
        A=B     A                                * 0B976
        D0=A                                     * 0B978
        A=R0.F  S                                * 0B97B
        DAT0=A  S                                * 0B981
        D0=(5)  #8052F                           * 0B985
        LC(1)   #C                               * 0B98C
        DAT0=C  1                                * 0B98F
        GOTO    L_0B593                          * 0B993
        RPL

* refs (3): 0BB08 640C3 640D7
OBJ_0B997:
        :: FALSE OBJ_0B9AB ;                     * 0B997

* refs (1): 0B9A1
OBJ_0B9AB:
        CON(5)  (*)+5                            * 0B9AB  primitive code object
        ASSEMBLE
        GOSUB   SUB_0BA00                        * 0B9B0
        CD1EX                                    * 0B9B4
        A=DAT1  A                                * 0B9B7
        ?A#0    A                                * 0B9BA
        GOYES   L_0B9CC                          * 0B9BD
L_0B9BF:
        D1=C                                     * 0B9BF
L_0B9C2:
        A=DAT0  A                                * 0B9C2
        D0=D0+  5                                * 0B9C5
        PC=(A)                                   * 0B9C8
L_0B9CC:
        D1=D1+  10                               * 0B9CC
        A=DAT1  B                                * 0B9CF
        ?A#0    B                                * 0B9D2
        GOYES   L_0B9BF                          * 0B9D5
        D1=D1+  2                                * 0B9D7
        A=DAT1  A                                * 0B9DA
        CD1EX                                    * 0B9DD
        RSTK=C                                   * 0B9E0
        LC(5)   DORRP                            * 0B9E2
        ?C#A    A                                * 0B9E9
        GOYES   L_0B9C2                          * 0B9EC
        C=RSTK                                   * 0B9EE
        DAT1=C  A                                * 0B9F0
        LC(5)   TRUE                             * 0B9F3
        A=C     A                                * 0B9FA
        PC=(A)                                   * 0B9FC

* refs (2): 0B9B0 0BA8B
SUB_0BA00:
        LC(5)   USEROB                           * 0BA00
        CD1EX                                    * 0BA07
        A=DAT1  A                                * 0BA0A
        D1=A                                     * 0BA0D
        D1=D1+  5                                * 0BA10
        A=0     A                                * 0BA13
        A=DAT1  X                                * 0BA15
        D1=D1+  3                                * 0BA19
        CD1EX                                    * 0BA1C
        C=C-A   A                                * 0BA1F
        C=C-A   A                                * 0BA21
        C=C-A   A                                * 0BA23
        ASL     A                                * 0BA25
        C=C+A   A                                * 0BA27
        RTN                                      * 0BA29
        C=0     A                                * 0BA2B
        C=DAT0  X                                * 0BA2D
        A=C     A                                * 0BA31
        CSL     A                                * 0BA33
        C=C-A   A                                * 0BA35
        C=C-A   A                                * 0BA37
        C=C-A   A                                * 0BA39
        AD0EX                                    * 0BA3B
        A=A+C   A                                * 0BA3E

* refs (2): 0BB17 640D2
OBJ_0BA40:
        CON(5)  (*)+5                            * 0BA40  primitive code object
        GOSBVL  SAVPTR                           * 0BA45
        GOSBVL  ROOM                             * 0BA4C
        A=C     A                                * 0BA53
        LC(5)   #00014                           * 0BA55
        A=A-C   A                                * 0BA5C
        GONC    L_0BA8B                          * 0BA5E
        GOSBVL  GARBAGECOL                       * 0BA61
        GOSBVL  ROOM                             * 0BA68
        A=C     A                                * 0BA6F
        LC(5)   #00014                           * 0BA71
        A=A-C   A                                * 0BA78
        GONC    L_0BA8B                          * 0BA7A
        GOSBVL  GETPTR                           * 0BA7D
        GOVLNG  DOMEMERR                         * 0BA84
L_0BA8B:
        GOSUB   SUB_0BA00                        * 0BA8B
        D1=C                                     * 0BA8F
        A=DAT1  A                                * 0BA92
        LC(5)   #00014                           * 0BA95
        B=C     A                                * 0BA9C
        ?A#0    A                                * 0BA9E
        GOYES   L_0BAB3                          * 0BAA1
        LC(5)   portnotaverr                     * 0BAA3
        DAT1=C  A                                * 0BAAA
        D1=D1+  5                                * 0BAAD
        GONC    L_0BAC5                          * 0BAB0
L_0BAB3:
        A=A+C   A                                * 0BAB3
        DAT1=A  A                                * 0BAB5
        D1=D1+  5                                * 0BAB8
        LC(5)   #0000F                           * 0BABB
        DAT1=C  A                                * 0BAC2
L_0BAC5:
        C=B     A                                * 0BAC5
        AD1EX                                    * 0BAC7
        GOSBVL  MOVEDSD                          * 0BACA
        C=B     A                                * 0BAD1
        D1=C                                     * 0BAD3
        A=0     W                                * 0BAD6
        DAT1=A  7                                * 0BAD9
        D1=D1+  7                                * 0BADD
        LC(5)   DORRP                            * 0BAE0
        DAT1=C  A                                * 0BAE7
        D1=D1+  5                                * 0BAEA
        LC(3)   #7FF                             * 0BAED
        DAT1=C  X                                * 0BAF2
        D1=D1+  3                                * 0BAF6
        DAT1=A  A                                * 0BAF9
        GOVLNG  GETPTRLOOP                       * 0BAFC
        RPL

* refs (1): 028E5
LIB000.config:
        :: OBJ_0B997 DUP ?SKIP OBJ_0BA40         * 0BB03
          IT DROP                                * 0BB1C
        ;                                        * 0BB26

* refs (1): 0942E
PurgeBkp12(nm,s)~2:
        CON(5)  PurgeBkp12(nm,s)~3               * 0BB2B  code object: the address of its machine code
        ASSEMBLE
L_0BB30:
        D0=D0+  8                                * 0BB30
        GOSUB   SUB_0BB58                        * 0BB33
        GOC     L_0BB51                          * 0BB37
        D0=D0+  5                                * 0BB3A
        GOSUB   SUB_0BB58                        * 0BB3D
        GOC     L_0BB51                          * 0BB41
        D1=D1-  1                                * 0BB44
        GONC    L_0BB30                          * 0BB47
        GOVLNG  GETPTRFALSE                      * 0BB4A
L_0BB51:
        GOVLNG  GETPTRTRUE                       * 0BB51

* refs (2): 0BB33 0BB3D
SUB_0BB58:
        C=DAT0  A                                * 0BB58
        CD0EX                                    * 0BB5B
        RSTK=C                                   * 0BB5E
        C=DAT0  A                                * 0BB60
        ?D#C    A                                * 0BB63
        GOYES   L_0BB7E                          * 0BB66
        D0=D0+  10                               * 0BB68
        C=DAT0  A                                * 0BB6B
        RSTK=C                                   * 0BB6E
        D0=D0-  5                                * 0BB70
        C=DAT0  A                                * 0BB73
        D0=C                                     * 0BB76
        C=RSTK                                   * 0BB79
        GONC    L_0BB80                          * 0BB7B
L_0BB7E:
        C=0     A                                * 0BB7E
L_0BB80:
        AR1EX.F A                                * 0BB80
        ?C=A    A                                * 0BB86
        GOYES   L_0BB8B                          * 0BB89
L_0BB8B:
        AR1EX.F A                                * 0BB8B
        C=RSTK                                   * 0BB91
        CD0EX                                    * 0BB93
        RTNNC                                    * 0BB96
        ?B>C    A                                * 0BB99
        GOYES   L_0BBA0                          * 0BB9C
        RTN                                      * 0BB9E
L_0BBA0:
        ?C>=A   A                                * 0BBA0
        RTNYES                                   * 0BBA3
        RTN                                      * 0BBA5
        RPL

* refs (1): 09E40
OBJ_0BBA7:
        :: OBJ_7028A SWAP                        * 0BBA7

Code:
          CODE                                   * 0BBB6  35 nibbles
            GOSBVL  POP#                         * 0BBC0
            C=DAT1  A                            * 0BBC7
            CD1EX                                * 0BBCA
            D1=D1+  5                            * 0BBCD
            DAT1=A  A                            * 0BBD0
            D1=C                                 * 0BBD3
            LC(5)   DUP                          * 0BBD6
            A=C     A                            * 0BBDD
            PC=(A)                               * 0BBDF
          ENDCODE                                * 0BBE3
        ;                                        * 0BBE3
        BSS     5                                * 0BBE8  zeros

* -> T T
* refs (113): 09877 0BC33 0BC5B 11179 1877E 234B0 ...
TrueTrue:
        :: TRUE TRUE ;                           * 0BBED

* -> F T
* refs (42): 237CB 23BFA 23D35 23E5C 23F0B 23FA1 ...
failed:
        :: FALSE TRUE ;                          * 0BC01

* refs (2): 247DF 276C0
OBJ_0BC15:
        :: OBJ_0BC47 !*trior                     * 0BC15
          :: DROP GetNextToken TrueTrue ; FALSE ; * 0BC24

* refs (3): 0BC1A 28922 2894F
OBJ_0BC47:
        :: OVER EQUAL ' TrueTrue FALSE COLARPITE ; * 0BC47

* F -> <SKIP> T T -> <COLA>
* refs (15): 0BC1F 23A47 23A56 23A79 2435C 2436B ...
!*trior:
        CODE                                     * 0BC6F  86 nibbles
          A=DAT1  A                              * 0BC79
          D1=D1+  5                              * 0BC7C
          D=D+1   A                              * 0BC7F
          LC(5)   FALSE                          * 0BC81
          ?C#A    A                              * 0BC88
          GOYES   L_0BC9A                        * 0BC8B
          LC(5)   SKIP                           * 0BC8D
          A=C     A                              * 0BC94
          PC=(A)                                 * 0BC96
L_0BC9A:
          LC(5)   TRUE                           * 0BC9A
          A=DAT1  A                              * 0BCA1
          D1=D1+  5                              * 0BCA4
          D=D+1   A                              * 0BCA7
          ?C#A    A                              * 0BCA9
          GOYES   L_0BCBB                        * 0BCAC
          LC(5)   COLA                           * 0BCAE
          A=C     A                              * 0BCB5
          PC=(A)                                 * 0BCB7
L_0BCBB:
          D1=D1-  10                             * 0BCBB
          D=D-1   A                              * 0BCBE
          D=D-1   A                              * 0BCC0
          LC(5)   SEMI                           * 0BCC2
          A=C     A                              * 0BCC9
          PC=(A)                                 * 0BCCB
        ENDCODE                                  * 0BCCF

* T T -> F T -> F T <SEMI>
* refs (70): 0BD4A 239F2 23A1A 23AFB 23B4B 23B78 ...
!*triand:
        :: DUP NOT DUP NOT?DROP                  * 0BCCF
          COLA                                   * 0BCE8
          CODE                                   * 0BCED  53 nibbles
            LC(5)   TRUE                         * 0BCF7
            D1=D1+  5                            * 0BCFE
            D=D+1   A                            * 0BD01
            A=DAT1  A                            * 0BD03
            ?C#A    A                            * 0BD06
            GOYES   L_0BD1A                      * 0BD09
            D1=D1+  5                            * 0BD0B
            D=D+1   A                            * 0BD0E
            A=DAT0  A                            * 0BD10
            D0=D0+  5                            * 0BD13
            PC=(A)                               * 0BD16
L_0BD1A:
            D1=D1-  5                            * 0BD1A
            D=D-1   A                            * 0BD1D
            LC(5)   SEMI                         * 0BD1F
            A=C     A                            * 0BD26
            PC=(A)                               * 0BD28
          ENDCODE                                * 0BD2C
        ;                                        * 0BD2C

        :: ?SKIP TRUE                            * 0BD31
          TRUE COLA !*triand                     * 0BD40
        ;                                        * 0BD4F

* $1 $1 -> :: $1 <Ob1> ; $1 $2 -> :: $1 <Ob2> <Rest> ;
* refs (10): 23A38 241D1 243AC 243E8 243F7 24406 ...
tok8cktrior:
        CON(5)  (*)+5                            * 0BD54  primitive code object
        ASSEMBLE
        ST=1    0                                * 0BD59
        GOTO    L_0BD68                          * 0BD5C

* GNT data $1 $1 -> :: GNT data GetNextToken ; GNT data $1 $2 -> :: $1 <Ob1> <Rest> ;
* refs (59): 23B2D 23B3C 23BAF 23C04 23C5E 23C6D ...
tok8trior:
        CON(5)  (*)+5                            * 0BD60  primitive code object
        ST=0    0                                * 0BD65
L_0BD68:
        C=DAT1  A                                * 0BD68
        CD1EX                                    * 0BD6B
        D1=D1+  5                                * 0BD6E
        A=DAT1  A                                * 0BD71
        D1=C                                     * 0BD74
        D1=D1+  5                                * 0BD77
        D=D+1   A                                * 0BD7A
        C=DAT1  A                                * 0BD7C
        CD1EX                                    * 0BD7F
        RSTK=C                                   * 0BD82
        D1=D1+  5                                * 0BD84
        C=DAT1  A                                * 0BD87
        ?C=A    A                                * 0BD8A
        GOYES   L_0BDA1                          * 0BD8D
L_0BD8F:
        C=RSTK                                   * 0BD8F
        D1=C                                     * 0BD91
        LC(5)   SKIP                             * 0BD94
        A=C     A                                * 0BD9B
        PC=(A)                                   * 0BD9D
L_0BDA1:
        D1=D1+  5                                * 0BDA1
        CD1EX                                    * 0BDA4
        D1=D1-  6                                * 0BDA7
        CD1EX                                    * 0BDAA
        P=C     0                                * 0BDAD
        A=DAT1  WP                               * 0BDB1
        C=RSTK                                   * 0BDB5
        RSTK=C                                   * 0BDB7
        D1=C                                     * 0BDB9
        D1=D1-  5                                * 0BDBC
        C=DAT1  A                                * 0BDBF
        D1=C                                     * 0BDC2
        D1=D1+  10                               * 0BDC5
        C=DAT1  WP                               * 0BDC8
        ?C=A    WP                               * 0BDCC
        GOYES   L_0BDD6                          * 0BDCF
        P=      0                                * 0BDD1
        GONC    L_0BD8F                          * 0BDD3
L_0BDD6:
        P=      0                                * 0BDD6
        C=RSTK                                   * 0BDD8
        D1=C                                     * 0BDDA
        LC(5)   ~DROP;GetNextToken;COLACOLA      * 0BDDD
        ?ST=0   0                                * 0BDE4
        GOYES   L_0BDF0                          * 0BDE7
        LC(5)   COLA                             * 0BDE9
L_0BDF0:
        A=C     A                                * 0BDF0
        PC=(A)                                   * 0BDF2
        RPL

* refs (1): 0BDDD
~DROP;GetNextToken;COLACOLA:
        :: DROP GetNextToken COLACOLA ;          * 0BDF6
        ENDLENGTH                                * 0BE0F

        LENGTH                                   * 0BE0F  library object without its prolog (its place is the end of the link table before): length, to #0CAB9
        CON(2)  0                                * 0BE14  no title

LIB019:
        CON(3)  #019                             * 0BE16  library number
        CON(5)  0                                * 0BE19  hash table
        CON(5)  0                                * 0BE1E  message table
        CON(5)  0                                * 0BE23  link table
        CON(5)  0                                * 0BE28  config
        ASSEMBLE

* refs (2): 0C015 0C07C
SUB_0BE2D:
        SETHEX                                   * 0BE2D
        C=0     A                                * 0BE2F
        CPEX    0                                * 0BE31
        B=C     P                                * 0BE35
        P=      4                                * 0BE38
        A=0     A                                * 0BE3A
        D1=(5)  IRAM@                            * 0BE3C
        A=DAT1  P                                * 0BE43
        D1=A                                     * 0BE47
        C=B     A                                * 0BE4A
        C=0     X                                * 0BE4C
        C=-C-1  A                                * 0BE4F
        C=C+A   A                                * 0BE51
        ST=0    1                                * 0BE53
        D1=(4)  #068D                            * 0BE56
        A=DAT1  A                                * 0BE5C
        ?C#A    P                                * 0BE5F
        GOYES   L_0BE6C                          * 0BE62
        ?C<A    A                                * 0BE64
        GOYES   L_0BE6C                          * 0BE67
        ST=1    1                                * 0BE69
L_0BE6C:
        ST=0    2                                * 0BE6C
        D1=(4)  #0695                            * 0BE6F
        A=DAT1  A                                * 0BE75
        ?C#A    P                                * 0BE78
        GOYES   L_0BE85                          * 0BE7B
        ?C<A    A                                * 0BE7D
        GOYES   L_0BE85                          * 0BE80
        ST=1    2                                * 0BE82
L_0BE85:
        A=C     A                                * 0BE85
        C=B     B                                * 0BE87
        P=C     0                                * 0BE8A
        B=0     B                                * 0BE8E
        C=0     A                                * 0BE91
        C=P     4                                * 0BE93
        P=      4                                * 0BE97
        CAEX    P                                * 0BE99
        ABEX    A                                * 0BE9C
        D1=(4)  #0005                            * 0BE9E
        DAT1=A  A                                * 0BEA4
        ?ST=0   0                                * 0BEA7
        GOYES   L_0BEEF                          * 0BEAA
        D1=(4)  #069A                            * 0BEAC
        C=DAT1  B                                * 0BEB2
        B=C     B                                * 0BEB5
        P=      0                                * 0BEB8
        LC(2)   #3F                              * 0BEBA
        B=B&C   B                                * 0BEBE
        LC(2)   #3F                              * 0BEC2
        B=B-C   B                                * 0BEC6
        LC(2)   #3F                              * 0BEC9
        B=B&C   B                                * 0BECD
        P=      4                                * 0BED1
        D1=(5)  LINECOUNT                        * 0BED3
L_0BEDA:
        C=DAT1  B                                * 0BEDA
        CBIT=0  7                                * 0BEDD
        CBIT=0  6                                * 0BEE2
        ?B#C    B                                * 0BEE7
        GOYES   L_0BEDA                          * 0BEEA
        C=0     B                                * 0BEEC
L_0BEEF:
        D1=(2)  #1F                              * 0BEEF
        DAT1=C  1                                * 0BEF3
        D1=(2)  #24                              * 0BEF7
        UNCNFG                                   * 0BEFB
        BCEX    P                                * 0BEFE
        ?ST=0   1                                * 0BF01
        GOYES   L_0BF0A                          * 0BF04
        DAT1=C  P                                * 0BF06
L_0BF0A:
        ?ST=0   2                                * 0BF0A
        GOYES   L_0BF17                          * 0BF0D
        D1=(2)  #34                              * 0BF0F
        DAT1=C  P                                * 0BF13
L_0BF17:
        CAEX    A                                * 0BF17
        CONFIG                                   * 0BF19
        CAEX    A                                * 0BF1C
        CONFIG                                   * 0BF1E
        D1=(2)  #1F                              * 0BF21
        DAT1=C  P                                * 0BF25
        D1=C                                     * 0BF29
        ?ST=0   1                                * 0BF2C
        GOYES   L_0BF3B                          * 0BF2F
        D1=(4)  #0691                            * 0BF31
        DAT1=C  P                                * 0BF37
L_0BF3B:
        ?ST=0   2                                * 0BF3B
        GOYES   L_0BF4A                          * 0BF3E
        D1=(4)  #0699                            * 0BF40
        DAT1=C  P                                * 0BF46
L_0BF4A:
        P=C     4                                * 0BF4A
        C=0     A                                * 0BF4E
        ?P#     8                                * 0BF50
        GOYES   L_0BF68                          * 0BF53
        P=      0                                * 0BF55
        D1=(4)  #000A                            * 0BF57
        C=DAT1  A                                * 0BF5D
        ?C#A    A                                * 0BF60
        GOYES   L_0BF68                          * 0BF63
        C=-C-1  P                                * 0BF65
L_0BF68:
        D1=(4)  #065A                            * 0BF68
        DAT1=C  1                                * 0BF6E
        P=      0                                * 0BF72
        RTNCC                                    * 0BF74

* refs (2): 0C12D 0C615
SUB_0BF76:
        P=      0                                * 0BF76
        LC(5)   #FE000                           * 0BF78
        B=C     A                                * 0BF7F
        ST=0    15                               * 0BF81
        INTOFF                                   * 0BF84
        C=B     A                                * 0BF88
        RSTK=C                                   * 0BF8A
        D1=(5)  IRAM@                            * 0BF8C
        C=0     A                                * 0BF93
        P=      4                                * 0BF95
        C=DAT1  P                                * 0BF97
        B=C     A                                * 0BF9B
        D1=C                                     * 0BF9D
        D1=(4)  #0005                            * 0BFA0
        C=DAT1  A                                * 0BFA6
        CSR     A                                * 0BFA9
        C=B     P                                * 0BFAB
        CSR     A                                * 0BFAE
        CSR     A                                * 0BFB0
        D1=(4)  #00E8                            * 0BFB2
        DAT1=C  3                                * 0BFB8
        D1=(4)  #0645                            * 0BFBC
        C=DAT1  A                                * 0BFC2
        ?B#C    P                                * 0BFC5
        GOYES   L_0C02D                          * 0BFC8
        C=RSTK                                   * 0BFCA
        RSTK=C                                   * 0BFCC
        C=-C-1  A                                * 0BFCE
        B=B!C   A                                * 0BFD0
        D1=(4)  #064A                            * 0BFD4
        C=DAT1  A                                * 0BFDA
        ?B>=C   A                                * 0BFDD
        GOYES   L_0C02D                          * 0BFE0
        C=RSTK                                   * 0BFE2
        D1=(4)  #05DB                            * 0BFE4
        DAT1=A  A                                * 0BFEA
        C=ST                                     * 0BFED
        D1=D1+  5                                * 0BFEF
        DAT1=C  3                                * 0BFF2
        D1=(4)  #0005                            * 0BFF6
        A=DAT1  A                                * 0BFFC
        ABEX    A                                * 0BFFF
