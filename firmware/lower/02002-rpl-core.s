* HP 48GX ROM revision R, #02002-#04002: Object prologs, the RPL inner loop and stack primitives
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: SWAP DUP DROP BINT1 OVER TRUE ROT FALSE BINT0 #1+ #1- #+
* Follows on from the previous file (at #02002 in the original ROM).
        ?P#     8                                * 02002
        GOYES   L_02026                          * 02005
L_02007:
        D0=(5)  DA1BadMASK                       * 02007
        C=DAT0  1                                * 0200E
        ?CBIT=1 0                                * 02012
        GOYES   L_02020                          * 02017
        ?CBIT=0 1                                * 02019
        GOYES   L_02026                          * 0201E
L_02020:
        P=      12                               * 02020
        GOTO    L_01FC6                          * 02022
L_02026:
        GOSUB   SUB_02708                        * 02026
        ?P#     9                                * 0202A
        GOYES   L_02033                          * 0202D
        GOTO    Coldstart                        * 0202F
L_02033:
        D0=(5)  ALARMS                           * 02033
        C=0     A                                * 0203A
        DAT0=C  A                                * 0203C
        P=      0                                * 0203F
        GOSUB   SUB_0249F                        * 02041
        GOSBVL  SUB_01929                        * 02045
        GOSBVL  SUB_01BEB                        * 0204C
        GOSBVL  FlushAttn                        * 02053
        ST=1    5                                * 0205A
L_0205D:
        D0=(5)  #0010F                           * 0205D
        C=DAT0  1                                * 02064
        D0=(5)  PortStat                         * 02068
        DAT0=C  1                                * 0206F
        P=      0                                * 02073
        GOSBVL  SUB_098DB                        * 02075
        ?ST=0   3                                * 0207C
        GOYES   L_0208E                          * 0207F
        GOSBVL  SUB_09BED                        * 02081
        P=      14                               * 02088
        GOTO    L_01FC6                          * 0208A
L_0208E:
        ?ST=0   4                                * 0208E
        GOYES   L_020A0                          * 02091
        GOSBVL  SUB_09BED                        * 02093
        GOLONG  L_00038                          * 0209A
L_020A0:
        ?ST=0   0                                * 020A0
        GOYES   L_020DF                          * 020A3
        ?ST=1   5                                * 020A5
        GOYES   L_020B5                          * 020A8
        GOSBVL  SUB_09BED                        * 020AA
        GOTO    Coldstart                        * 020B1
L_020B5:
        LC(5)   L_81CA3+10                       * 020B5  in the self-test area (#80000-#82006): ROM, not RAM
        GOSUB   SUB_026CA                        * 020BC
L_020C0:
        GOSUB   SUB_027A2                        * 020C0
        GOC     L_020D5                          * 020C4
        GOSUBL  Flush                            * 020C7
        GOSUB   SUB_02388                        * 020CD
        GOTO    L_020C0                          * 020D1
L_020D5:
        ST=0    5                                * 020D5
        MP=0                                     * 020D8
        GOTO    L_0205D                          * 020DB
L_020DF:
        ?ST=1   2                                * 020DF
        GOYES   L_020EE                          * 020E2
        GOSBVL  SUB_0A464                        * 020E4
        GONC    L_020F2                          * 020EB
L_020EE:
        GOSUB   SUB_02313                        * 020EE
L_020F2:
        GOSUB   SUB_02593                        * 020F2
        GOSUB   SUB_0266F                        * 020F6
        D1=(5)  OSAVE                            * 020FA
        C=0     A                                * 02101
        DAT1=C  A                                * 02103
        P=      0                                * 02106
        D1=(4)  #0000                            * 02108
        LC(5)   #A5C3F                           * 0210E
        DAT1=C  A                                * 02115
        D1=(5)  TIMER2CTRL                       * 02118
        LC(1)   #7                               * 0211F
        DAT1=C  1                                * 02122
        INTOFF                                   * 02126
        GOSUBL  clkspd                           * 0212A
        GOSBVL  SUB_7017C                        * 02130
        D0=(5)  CSPEED                           * 02137
        DAT0=A  A                                * 0213E
        GOSUBL  SUB_00672                        * 02141
        D0=(5)  FIRSTPROC                        * 02147
        LC(5)   StartupProc                      * 0214E
        DAT0=C  A                                * 02155
        D0=(5)  INITEN                           * 02158
        C=0     A                                * 0215F
        DAT0=C  1                                * 02161
        GOSUBL  AllowIntr                        * 02165
        P=      0                                * 0216B
        SETHEX                                   * 0216D
        INTON                                    * 0216F
        GOSBVL  SUB_0ABA0                        * 02173
        GOSBVL  SUB_0AC6A                        * 0217A
        GOSBVL  L_01C7F                          * 02181
        ?ST=0   0                                * 02188
        GOYES   L_02198                          * 0218B
        LC(5)   L_81CC3+31                       * 0218D  in the self-test area
        GOSUB   SUB_026CA                        * 02194
L_02198:
        ?ST=0   5                                * 02198
        GOYES   L_021A8                          * 0219B
        LC(5)   L_81CE3+25                       * 0219D  in the self-test area
        GOSUB   SUB_026CA                        * 021A4
L_021A8:
        P=      0                                * 021A8
        GOSBVL  GETPTR                           * 021AA
        D0=(5)  OBJ_021C5                        * 021B1
        LC(5)   ROMPOLL                          * 021B8
        A=C     A                                * 021BF
        PC=(A)                                   * 021C1
        RPL

* refs (1): 021B1
OBJ_021C5:
        CODE                                     * 021C5  14 nibbles
          GOSBVL  SAVPTR                         * 021CF
          GOVLNG  L_04698                        * 021D6
        ENDCODE                                  * 021DD

* ->
* refs (1): 021B8
ROMPOLL:
        :: NULL{} BINT7 OBJ_04A4C RclKnownLibs INNERCOMP DUP#0=case DROP * 021DD
          RunConfig(s) ;                         * 02205

* refs (1): 02205
RunConfig(s):
        :: DUP ZERO_DO pullrev GETCONFIG IT RunConfig(s)~1 * 0220F
          LOOP DROP ;                            * 02232
        ASSEMBLE

* refs (2): 011B5 70193
* Boot: configure the I/O page
SUB_02241:
        P=      0                                * 02241
        LC(5)   #00100                           * 02243
        CONFIG                                   * 0224A
        RTNCC                                    * 0224D

* refs (3): 026F9 700CE 701A7
* Boot: probe RAM by writing #80000 and looking for a mirror at #90000, then configure 128K or 32K
SUB_0224F:
        P=      0                                * 0224F
        LC(5)   CMOS                             * 02251
        A=C     A                                * 02258
        LC(5)   #C0000                           * 0225A
        GOSUB   SUB_0229F                        * 02261
        D1=C                                     * 02265
        D0=(5)  HARDRAMEND                       * 02268
        A=DAT1  A                                * 0226F
        C=DAT0  A                                * 02272
        ?C#A    A                                * 02275
        RTNYES                                   * 02278
        A=-A-1  A                                * 0227A
        DAT1=A  A                                * 0227C
        A=DAT0  A                                * 0227F
        DAT1=C  A                                * 02282
        C=-C-1  A                                * 02285
        ?C#A    A                                * 02287
        RTNYES                                   * 0228A
        LC(5)   CMOS                             * 0228C
        UNCNFG                                   * 02293
        A=C     A                                * 02296
        LC(5)   #F0000                           * 02298

* refs (1): 02261
SUB_0229F:
        CONFIG                                   * 0229F
        CAEX    A                                * 022A2
        CONFIG                                   * 022A4
        D1=(5)  IRAMMASK                         * 022A7
        DAT1=A  A                                * 022AE
        D1=(4)  #000A                            * 022B1
        DAT1=A  A                                * 022B7
        P=      4                                * 022BA
        A=-A    A                                * 022BC
        A=A+C   A                                * 022BE
        D1=(4)  #000F                            * 022C0
        DAT1=A  P                                * 022C6
        D1=(5)  IRAM@                            * 022CA
        DAT1=C  P                                * 022D1
        P=      0                                * 022D5
        RTN                                      * 022D7

* refs (3): 011BC 026D4 700A6
SUB_022D9:
        P=      0                                * 022D9
        LC(5)   #F0000                           * 022DB
        CONFIG                                   * 022E2
        LC(5)   #C0000                           * 022E5
        CONFIG                                   * 022EC
        D1=(5)  IRAM@                            * 022EF
        P=      4                                * 022F6
        DAT1=C  P                                * 022F8
        P=      0                                * 022FC
        D1=C                                     * 022FE
        LC(5)   #F0000                           * 02301
        D1=(4)  #0005                            * 02308
        DAT1=C  A                                * 0230E
        RTNCC                                    * 02311

* refs (1): 020EE
SUB_02313:
        D1=(5)  CONTRAST                         * 02313
        P=      0                                * 0231A
        LC(2)   #0E                              * 0231C
        DAT1=C  B                                * 02320
        SETHEX                                   * 02323
        D1=(5)  RAMEND                           * 02325
        C=DAT1  A                                * 0232C
        RSTK=C                                   * 0232F
        D1=C                                     * 02331
        D1=D1-  5                                * 02334
        C=0     A                                * 02337
        DAT1=C  A                                * 02339
        CD1EX                                    * 0233C
        D1=(5)  ROMPARTS                         * 0233F
        DAT1=C  A                                * 02346
        ?ST=0   7                                * 02349
        GOYES   L_0239C                          * 0234C
        LC(5)   L_81D24                          * 0234E  memory-recovery code in the self-test area
        GOSUB   SUB_026CA                        * 02355
L_02359:
        GOSUB   SUB_027A2                        * 02359
        GOC     L_02380                          * 0235D
        GOSBVL  POPKEY                           * 02360
        GOC     L_02359                          * 02367
        B=C     A                                * 0236A
        C=0     A                                * 0236C
        LC(2)   #01                              * 0236E
        ?B=C    B                                * 02372
        GOYES   L_023ED                          * 02375
        LC(2)   #06                              * 02377
        ?B=C    B                                * 0237B
        GOYES   L_02395                          * 0237E
L_02380:
        GOSUB   SUB_02388                        * 02380
        GOTO    L_02359                          * 02384

* refs (2): 020CD 02380
SUB_02388:
        P=      0                                * 02388
        LC(2)   #F4                              * 0238A
        GOVLNG  RCKBp                            * 0238E
L_02395:
        GOSBVL  ClrScrMn                         * 02395
L_0239C:
        ST=0    7                                * 0239C
        D1=(5)  ROMPARTS                         * 0239F
        C=DAT1  A                                * 023A6
        D1=C                                     * 023A9
        C=0     A                                * 023AC
        D1=D1-  5                                * 023AE
        DAT1=C  A                                * 023B1
        D1=D1-  3                                * 023B4
        DAT1=C  3                                * 023B7
        D1=D1-  5                                * 023BB
        LC(5)   DORRP                            * 023BE
        DAT1=C  A                                * 023C5
        CD1EX                                    * 023C8
        D1=(5)  CONTEXT                          * 023CB
        DAT1=C  A                                * 023D2
        D1=(5)  STOPSIGN                         * 023D5
        DAT1=C  A                                * 023DC
        D1=(5)  USEROB                           * 023DF
        DAT1=C  A                                * 023E6
        GOTO    L_02402                          * 023E9
L_023ED:
        LC(5)   L_81CA3+25                       * 023ED  in the self-test area
        GOSUB   SUB_026CA                        * 023F4
        ST=1    7                                * 023F8
        GOVLNG  L_0A0A2                          * 023FB
L_02402:
        GOSUB   SUB_0249F                        * 02402
        GOSBVL  SUB_02593                        * 02406
        LC(5)   INTRPPTR                         * 0240D
        A=C     A                                * 02414
        LC(5)   ROMPTAB                          * 02416
        C=C-A   A                                * 0241D
        D1=(5)  INTRPPTR                         * 0241F
        GOSBVL  WIPEOUT                          * 02426
        GOSUB   SUB_0245E                        * 0242D
        D1=(5)  RAMEND                           * 02431
        C=RSTK                                   * 02438
        DAT1=C  A                                * 0243A
        GOSBVL  ADJMEM                           * 0243D
        D1=(5)  ERROR                            * 02444
        LC(5)   #00005                           * 0244B
        ?ST=0   7                                * 02452
        GOYES   L_02459                          * 02455
        C=0     A                                * 02457
L_02459:
        DAT1=C  A                                * 02459
        RTN                                      * 0245C

* refs (1): 0242D
SUB_0245E:
        D0=(5)  SystemFlags                      * 0245E
        P=      8                                * 02465
        LC(8)   #00000000                        * 02467
        P=      0                                * 02471
        LC(8)   #000003F0                        * 02473
        DAT0=C  W                                * 0247D
        LC(3)   #40A                             * 02481
        GOSUB   SUB_02498                        * 02486
        LC(3)   #105                             * 0248A
        GOSUB   SUB_02498                        * 0248F
        LC(3)   #103                             * 02493

* refs (2): 02486 0248F
SUB_02498:
        GOVLNG  setflag                          * 02498

* refs (4): 02041 02402 0A0A2 0AC6A
SUB_0249F:
        D1=(5)  ROMPTAB                          * 0249F
        C=0     A                                * 024A6
        DAT1=C  3                                * 024A8
        D1=D1+  3                                * 024AC
        CD1EX                                    * 024AF
        D1=(5)  VDISP2                           * 024B2
        LA(15)  #00083000080011F                 * 024B9
        GOSUB   SUB_02519                        * 024CD
        D1=(5)  VDISP                            * 024D1
        DAT1=C  A                                * 024D8
        D1=(5)  ADISP                            * 024DB
        LA(7)   #380077F                         * 024E2
        GOSUB   SUB_02519                        * 024EE
        D1=(5)  VDISP3                           * 024F2
        DAT1=C  A                                * 024F9
        D1=(5)  GDISP                            * 024FC
        A=0     W                                * 02503
        A=A-1   P                                * 02506
        GOSUB   SUB_02519                        * 02509
        D1=(5)  TEMPOB                           * 0250D
        DAT1=C  A                                * 02514
        RTN                                      * 02517

* refs (3): 024CD 024EE 02509
SUB_02519:
        DAT1=C  A                                * 02519
        D1=C                                     * 0251C
        LC(5)   DOGROB                           * 0251F
        DAT1=C  A                                * 02526
        D1=D1+  5                                * 02529
        DAT1=A  15                               * 0252C
        CD1EX                                    * 02530
        C=C+A   A                                * 02533
        RTN                                      * 02535

* refs (1): 0B3F5
SUB_02537:
        C=-C    A                                * 02537
        GOSUB   SUB_02541                        * 02539
        C=-C    A                                * 0253D
        RTNCC                                    * 0253F

* refs (4): 02539 0ACE7 70F48 711DE
SUB_02541:
        D1=(5)  ADISP                            * 02541
        A=DAT1  A                                * 02548
        A=A+C   A                                * 0254B
        DAT1=A  A                                * 0254D
        D1=(5)  DISP1CTLg                        * 02550
        A=DAT1  A                                * 02557
        A=A+C   A                                * 0255A
        DAT1=A  A                                * 0255C
        D1=(5)  DISPADDR                         * 0255F
        DAT1=A  A                                * 02566
        D1=(5)  VDISP2                           * 02569
        A=DAT1  A                                * 02570
        A=A+C   A                                * 02573
        DAT1=A  A                                * 02575
        D1=(5)  DISP2CTLg                        * 02578
        A=DAT1  A                                * 0257F
        A=A+C   A                                * 02582
        DAT1=A  A                                * 02584
        D1=(5)  MENUADDR                         * 02587
        DAT1=A  A                                * 0258E
        RTNCC                                    * 02591

* refs (3): 020F2 02406 0AC71
SUB_02593:
        P=      0                                * 02593
        D1=(5)  USEROB                           * 02595
        C=DAT1  A                                * 0259C
        D1=(5)  CONTEXT                          * 0259F
        DAT1=C  A                                * 025A6
        D1=(5)  STOPSIGN                         * 025A9
        DAT1=C  A                                * 025B0
        D1=C                                     * 025B3
        C=0     W                                * 025B6
        D1=D1-  8                                * 025B9
        DAT1=C  8                                * 025BC
        LC(5)   TOUCHTAB                         * 025C0
        CD1EX                                    * 025C7
        DAT1=C  A                                * 025CA
        D1=C                                     * 025CD
        D1=D1-  5                                * 025D0
        C=0     A                                * 025D3
        DAT1=C  A                                * 025D5
        LC(5)   DOLPENV                          * 025D8
        CD1EX                                    * 025DF
        DAT1=C  A                                * 025E2
        D1=C                                     * 025E5
        D1=D1-  5                                * 025E8
        C=0     A                                * 025EB
        DAT1=C  A                                * 025ED
        LC(5)   TEMPENV                          * 025F0
        CD1EX                                    * 025F7
        DAT1=C  A                                * 025FA
        D1=C                                     * 025FD
        D1=D1-  2                                * 02600
        LC(2)   #00                              * 02603
        DAT1=C  2                                * 02607
        LC(5)   EDITLINE                         * 0260B
        CD1EX                                    * 02612
        DAT1=C  A                                * 02615
        D1=C                                     * 02618
        D1=D1-  5                                * 0261B
        C=0     A                                * 0261E
        DAT1=C  A                                * 02620
        LC(5)   DSKTOP                           * 02623
        CD1EX                                    * 0262A
        DAT1=C  A                                * 0262D
        D1=(5)  TEMPOB                           * 02630
        C=DAT1  A                                * 02637
        D1=C                                     * 0263A
        C=0     A                                * 0263D
        DAT1=C  A                                * 0263F
        D1=D1+  5                                * 02642
        LC(5)   TEMPTOP                          * 02645
        CD1EX                                    * 0264C
        DAT1=C  A                                * 0264F
        D1=C                                     * 02652
        C=0     A                                * 02655
        DAT1=C  A                                * 02657
        D1=D1+  5                                * 0265A
        LC(5)   RSKTOP                           * 0265D
        CD1EX                                    * 02664
        DAT1=C  A                                * 02667
        D1=C                                     * 0266A
        RTN                                      * 0266D

* refs (2): 020F6 0AC78
SUB_0266F:
        P=      0                                * 0266F
        LC(5)   #00024                           * 02671
        RSTK=C                                   * 02678
        D1=(5)  TEMPOB                           * 0267A
        A=DAT1  A                                * 02681
        B=A     A                                * 02684
        D1=(5)  USEROB                           * 02686
        A=DAT1  A                                * 0268D
        D1=(5)  ROMPARTS                         * 02690
        C=DAT1  A                                * 02697
        D=C     A                                * 0269A
        D1=(5)  INTRPPTR                         * 0269C
L_026A3:
        C=DAT1  A                                * 026A3
        ?B>C    A                                * 026A6
        GOYES   L_026BA                          * 026A9
        ?C<A    A                                * 026AB
        GOYES   L_026B5                          * 026AE
        ?D>C    A                                * 026B0
        GOYES   L_026BA                          * 026B3
L_026B5:
        C=0     A                                * 026B5
        DAT1=C  A                                * 026B7
L_026BA:
        D1=D1+  5                                * 026BA
        C=RSTK                                   * 026BD
        C=C-1   A                                * 026BF
        RSTK=C                                   * 026C1
        GONC    L_026A3                          * 026C3
        C=RSTK                                   * 026C6
        RTN                                      * 026C8

* refs (5): 020BC 02194 021A4 02355 023F4
SUB_026CA:
        GOVLNG  L_700FE                          * 026CA
L_026D1:
        UNCNFG                                   * 026D1
        GOSUB   SUB_022D9                        * 026D4
        GOSUB   SUB_026FD                        * 026D8
        C=RSTK                                   * 026DC
        A=C     A                                * 026DE
        LC(5)   L_026ED                          * 026E0
        RSTK=C                                   * 026E7
        PC=A                                     * 026E9
L_026ED:
        P=      0                                * 026ED
        LC(5)   #C0000                           * 026EF
        UNCNFG                                   * 026F6
        GOSUB   SUB_0224F                        * 026F9

* refs (1): 026D8
SUB_026FD:
        GOVLNG  L_01C7F                          * 026FD
        NIBHEX  0000                             * 02704  ..

* refs (3): 01A67 02026 80CA3
SUB_02708:
        GOSBVL  L_0C1A7                          * 02708
        D0=(4)  #0036                            * 0270F
        D1=C                                     * 02715
        D1=(4)  #0048                            * 02718
        C=DAT0  W                                * 0271E
        DAT1=C  W                                * 02722
        D0=D0-  16                               * 02726
        D1=D1-  16                               * 02729
        C=DAT0  W                                * 0272C
        DAT1=C  W                                * 02730
        D0=D0-  16                               * 02734
        D1=D1-  16                               * 02737
        C=DAT0  W                                * 0273A
        DAT1=C  W                                * 0273E
        D0=D0-  6                                * 02742
        D1=D1-  6                                * 02745
        C=DAT0  6                                * 02748
        DAT1=C  6                                * 0274C
        C=P     0                                * 02750
        DAT0=C  1                                * 02754
        RSTK=C                                   * 02758
        GOSBVL  SUB_011FC                        * 0275A
        GONC    L_02767                          * 02761
        C=0     W                                * 02764
L_02767:
        A=C     W                                * 02767
        GOSBVL  L_0C1A7                          * 0276A
        D0=(4)  #0011                            * 02771
        DAT0=A  13                               * 02777
        D0=D0-  1                                * 0277B
        D1=(5)  #00104                           * 0277E
        C=0     A                                * 02785
        DAT1=C  4                                * 02787
        C=DAT0  14                               * 0278B
        C=DAT1  4                                * 0278F
        D0=D0+  14                               * 02793
        DAT0=C  4                                * 02796
        C=RSTK                                   * 0279A
        P=C     0                                * 0279C
        RTN                                      * 027A0

* refs (2): 020C0 02359
SUB_027A2:
        P=      0                                * 027A2
        LC(3)   #801                             * 027A4
        GOSBVL  setflag                          * 027A9
        D1=(5)  NOALARMSRV                       * 027B0
        C=0     A                                * 027B7
        C=C-1   A                                * 027B9
        DAT1=C  1                                * 027BB
        GOSBVL  FlushAttn                        * 027BF
        D1=(5)  DISABLE_KBD                      * 027C6
        C=0     A                                * 027CD
        DAT1=C  1                                * 027CF
L_027D3:
        GOSBVL  GetTimChk                        * 027D3
        B=C     W                                * 027DA
        A=B     W                                * 027DD
        GOSBVL  SUB_01797                        * 027E0
        A=A+C   W                                * 027E7
        GOSBVL  SUB_016E9                        * 027EA
        D1=(5)  TIMER2                           * 027F1
        DAT1=C  8                                * 027F8
        D1=(2)  #2F                              * 027FC
        LC(1)   #5                               * 02800
INPUT~1:
        DAT1=C  1                                * 02803
        GOSBVL  liteslp                          * 02807
        GOSBVL  OnKeyStable?                     * 0280E
        RTNC                                     * 02815
        GOSBVL  SrvcKbdAB                        * 02818
        GOSBVL  KeyInBuff?                       * 0281F
        GONC    L_0282B                          * 02826
        RTNCC                                    * 02829
L_0282B:
        D1=(5)  TIMER2CTRL                       * 0282B
        C=DAT1  1                                * 02832
        ?CBIT=0 3                                * 02836
        GOYES   L_027D3                          * 0283B
        GOSBVL  DeepSleep                        * 0283D
        GOTO    L_027D3                          * 02844
        FILLTO  #028DE                           * 02848  150 zero nibbles: the next entry stays at #028DE
        NIBHEX  1359000                          * 028DE  1θ.

LIB000:
        CON(3)  #000                             * 028E5  library number
        CON(5)  0                                * 028E8  hash table
        REL(5)  LIB000.message                   * 028ED  message table
        CON(5)  0                                * 028F2  link table
        REL(5)  LIB000.config                    * 028F7  config

        PIN     #028FC                           * PRLG: every prolog starts with D=D-1 A, HST=0 0, whose nibbles CF820 read as the address #028FC, so running a prolog as an object comes here
PRLG:
        LC(2)   #0A                              * 028FC
        A=A-C   B                                * 02900
        PC=(A)                                   * 02903

        CON(5)  L_02C28                          * 02907
        CON(5)  L_0308E                          * 0290C

* BINT prologue 5  number (hex)
* refs (21): 03639 03824 0387E 038DA 0657C 0803D ...
DOBINT:
        D=D-1   A                                * 02911
        HST=0   0                                * 02913
        GOC     L_0298F                          * 02916
        D1=D1-  5                                * 02919
        DAT1=A  A                                * 0291C
        A=DAT0  A                                * 0291F
        D0=D0+  5                                * 02922
        PC=(A)                                   * 02925

        CON(5)  L_02C49                          * 02929
        CON(5)  L_0307F                          * 0292E

* Real number prologue 3  exponent 12 mantissa 1  sign
* refs (35): 038E6 05D6F 05D93 10174 10D0E 15B4C ...
DOREAL:
        D=D-1   A                                * 02933
        HST=0   0                                * 02935
        GOC     L_0298F                          * 02938
        D1=D1-  5                                * 0293B
        DAT1=A  A                                * 0293E
        A=DAT0  A                                * 02941
        D0=D0+  5                                * 02944
        PC=(A)                                   * 02947

        CON(5)  L_02C6D                          * 0294B
        CON(5)  L_0308B                          * 02950

* Long real prologue 5  exponent 15 mantissa 1  sign
* refs (28): 038F2 05E11 05E3E 2A29B 3564B 35B76 ...
DOEREL:
        D=D-1   A                                * 02955
        HST=0   0                                * 02957
        GOC     L_0298F                          * 0295A
        D1=D1-  5                                * 0295D
        DAT1=A  A                                * 02960
        A=DAT0  A                                * 02963
        D0=D0+  5                                * 02966
        PC=(A)                                   * 02969

        CON(5)  L_02C95                          * 0296D
        CON(5)  L_0307C                          * 02972

* Complex number prologue 3  real exponent 12 real mantissa 1  real sign 3  complex exponent 12 complex mantissa 1  complex sign
* refs (11): 038FE 05C4A 15BA6 19247 192F7 3565B ...
DOCMP:
        D=D-1   A                                * 02977
        HST=0   0                                * 02979
        GOC     L_0298F                          * 0297C
        D1=D1-  5                                * 0297F
        DAT1=A  A                                * 02982
        A=DAT0  A                                * 02985
        D0=D0+  5                                * 02988
        PC=(A)                                   * 0298B
L_0298F:
        GOTO    L_02D52                          * 0298F

        CON(5)  L_02CBC                          * 02993
        CON(5)  L_03085                          * 02998

* Long complex prologue 5  real exponent 15 real mantissa 1  real sign 5  complex exponent 15 complex mantissa 1  complex sign
* refs (5): 0390A 05CA7 52BEA 7D52B 7D81F
DOECMP:
        D=D-1   A                                * 0299D
        HST=0   0                                * 0299F
        GOC     L_0298F                          * 029A2
        D1=D1-  5                                * 029A5
        DAT1=A  A                                * 029A8
        A=DAT0  A                                * 029AB
        D0=D0+  5                                * 029AE
        PC=(A)                                   * 029B1

        CON(5)  L_02CE3                          * 029B5
        CON(5)  L_030B7                          * 029BA

* Character prologue 2  character
* refs (7): 03916 05125 05A9C 10168 44455 6202A ...
DOCHAR:
        D=D-1   A                                * 029BF
        HST=0   0                                * 029C1
        GOC     L_0298F                          * 029C4
        D1=D1-  5                                * 029C7
        DAT1=A  A                                * 029CA
        A=DAT0  A                                * 029CD
        D0=D0+  5                                * 029D0
        PC=(A)                                   * 029D3
        BSS     7                                * 029D7

        CON(5)  L_02D04                          * 029DE
        CON(5)  L_0309A                          * 029E3

* Array prologue 5  size 5  prologue of objects 5  # of dimensions 5n dimensions .. objects (content only)
* refs (6): 034DB 03800 10CF4 15B6A 2D265 6219D
DOARRY:
        D=D-1   A                                * 029E8
        HST=0   0                                * 029EA
        GOC     L_02A66                          * 029ED
        D1=D1-  5                                * 029F0
        DAT1=A  A                                * 029F3
        A=DAT0  A                                * 029F6
        D0=D0+  5                                * 029F9
        PC=(A)                                   * 029FC

        CON(5)  L_02D04                          * 02A00
        CON(5)  L_0309A                          * 02A05

* Linked array prologue
DOLNKARRY:
        D=D-1   A                                * 02A0A
        HST=0   0                                * 02A0C
        GOC     L_02A66                          * 02A0F
        D1=D1-  5                                * 02A12
        DAT1=A  A                                * 02A15
        A=DAT0  A                                * 02A18
        D0=D0+  5                                * 02A1B
        PC=(A)                                   * 02A1E

        CON(5)  L_02D04                          * 02A22
        CON(5)  L_0309A                          * 02A27

* String prologue 5  length .. characters
* refs (6): 05BCB 1015C 15B97 16322 6215E 9C836
DOCSTR:
        D=D-1   A                                * 02A2C
        HST=0   0                                * 02A2E
        GOC     L_02A66                          * 02A31
        D1=D1-  5                                * 02A34
        DAT1=A  A                                * 02A37
        A=DAT0  A                                * 02A3A
        D0=D0+  5                                * 02A3D
        PC=(A)                                   * 02A40

        CON(5)  L_02D04                          * 02A44
        CON(5)  L_0309A                          * 02A49

* HXS prologue 5  length .. hex digits, reverse order
* refs (7): 059EF 0E8FE 15BD3 1915A 37421 52CD9 ...
DOHSTR:
        D=D-1   A                                * 02A4E
        HST=0   0                                * 02A50
        GOC     L_02A66                          * 02A53
        D1=D1-  5                                * 02A56
        DAT1=A  A                                * 02A59
        A=DAT0  A                                * 02A5C
        D0=D0+  5                                * 02A5F
        PC=(A)                                   * 02A62
L_02A66:
        GOTO    L_02D52                          * 02A66

        CON(5)  L_02D2A                          * 02A6A
        CON(5)  L_03077                          * 02A6F

* List prologue see <REF>DOCOL
* refs (11): 03613 08053 0E914 156AA 15B79 27249 ...
DOLIST:
        D=D-1   A                                * 02A74
        HST=0   0                                * 02A76
        GOC     L_02A66                          * 02A79
        D1=D1-  5                                * 02A7C
        DAT1=A  A                                * 02A7F
        A=DAT0  A                                * 02A82
        D0=D0+  5                                * 02A85
        PC=(A)                                   * 02A88

        CON(5)  L_02D2A                          * 02A8C
        CON(5)  L_030BD                          * 02A91

* Directory prologue
* refs (16): 023BE 02F82 077FD 079E8 0A15E 0A1DF ...
DORRP:
        D=D-1   A                                * 02A96
        HST=0   0                                * 02A98
        GOC     L_02A66                          * 02A9B
        D1=D1-  5                                * 02A9E
        DAT1=A  A                                * 02AA1
        A=DAT0  A                                * 02AA4
        D0=D0+  5                                * 02AA7
        PC=(A)                                   * 02AAA

        CON(5)  L_02D2A                          * 02AAE
        CON(5)  L_03077                          * 02AB3

* Symbolic prologue .. objects 5  SEMI
* refs (11): 156C2 15BB5 18E58 18E91 19098 1F060 ...
DOSYMB:
        D=D-1   A                                * 02AB8
        HST=0   0                                * 02ABA
        GOC     L_02A66                          * 02ABD
        D1=D1-  5                                * 02AC0
        DAT1=A  A                                * 02AC3
        A=DAT0  A                                * 02AC6
        D0=D0+  5                                * 02AC9
        PC=(A)                                   * 02ACC

        CON(5)  L_02D2A                          * 02AD0
        CON(5)  L_03077                          * 02AD5

* Unit object prologue .. object (usually a real) .. unit 5  SEMI
* refs (5): 0F148 15BE2 19169 29C12 62054
DOEXT:
        D=D-1   A                                * 02ADA
        HST=0   0                                * 02ADC
        GOC     L_02A66                          * 02ADF
        D1=D1-  5                                * 02AE2
        DAT1=A  A                                * 02AE5
        A=DAT0  A                                * 02AE8
        D0=D0+  5                                * 02AEB
        PC=(A)                                   * 02AEE

        CON(5)  L_02D2A                          * 02AF2
        CON(5)  L_03115                          * 02AF7

* Tagged object prologue 2  # of chars in tag .. tag .. object
* refs (6): 05EA4 15BF1 17AC3 190C0 19164 62230
DOTAG:
        D=D-1   A                                * 02AFC
        HST=0   0                                * 02AFE
        GOC     L_02B7A                          * 02B01
        D1=D1-  5                                * 02B04
        DAT1=A  A                                * 02B07
        A=DAT0  A                                * 02B0A
        D0=D0+  5                                * 02B0D
        PC=(A)                                   * 02B10

        CON(5)  L_02D04                          * 02B14
        CON(5)  L_0309A                          * 02B19

* GROB prologue 5  size 5  height 5  width .. pixels Rows must be byte-aligned
* refs (7): 0251F 115F4 13C75 15C2D 1915F 515DF ...
DOGROB:
        D=D-1   A                                * 02B1E
        HST=0   0                                * 02B20
        GOC     L_02B7A                          * 02B23
        D1=D1-  5                                * 02B26
        DAT1=A  A                                * 02B29
        A=DAT0  A                                * 02B2C
        D0=D0+  5                                * 02B2F
        PC=(A)                                   * 02B32

        CON(5)  L_02D04                          * 02B36
        CON(5)  L_0309A                          * 02B3B

* Library prologue
* refs (9): 08E64 09ECC 0A0E5 0AF13 15C0F 27239 ...
DOLIB:
        D=D-1   A                                * 02B40
        HST=0   0                                * 02B42
        GOC     L_02B7A                          * 02B45
        D1=D1-  5                                * 02B48
        DAT1=A  A                                * 02B4B
        A=DAT0  A                                * 02B4E
        D0=D0+  5                                * 02B51
        PC=(A)                                   * 02B54

        CON(5)  L_02D04                          * 02B58
        CON(5)  L_0309A                          * 02B5D

* Backup prologue 5  size 2  # of chars in name .. name .. object 5  DOBINT 5  CRC
* refs (10): 09130 09ED8 0A0EE 0AF07 15C1E 1919B ...
DOBAK:
        D=D-1   A                                * 02B62
        HST=0   0                                * 02B64
        GOC     L_02B7A                          * 02B67
        D1=D1-  5                                * 02B6A
        DAT1=A  A                                * 02B6D
        A=DAT0  A                                * 02B70
        D0=D0+  5                                * 02B73
        PC=(A)                                   * 02B76
L_02B7A:
        GOTO    L_02D52                          * 02B7A

        CON(5)  L_02D04                          * 02B7E
        CON(5)  L_0309A                          * 02B83

* refs (4): 191A0 9E16B CEFCC CF109
DOEXT0:
        D=D-1   A                                * 02B88
        HST=0   0                                * 02B8A
        GOC     L_02B7A                          * 02B8D
        D1=D1-  5                                * 02B90
        DAT1=A  A                                * 02B93
        A=DAT0  A                                * 02B96
        D0=D0+  5                                * 02B99
        PC=(A)                                   * 02B9C

        CON(5)  L_71532                          * 02BA0
        CON(5)  L_7155A                          * 02BA5

* refs (26): 07A8E 08231 09D7A 09E2B 706F3 70F61 ...
DOEXT1:
        D=D-1   A                                * 02BAA
        HST=0   0                                * 02BAC
        GOC     L_02B7A                          * 02BAF
        D1=D1-  5                                * 02BB2
        DAT1=A  A                                * 02BB5
        A=DAT0  A                                * 02BB8
        D0=D0+  5                                * 02BBB
        PC=(A)                                   * 02BBE

        CON(5)  L_02D04                          * 02BC2
        CON(5)  L_0309A                          * 02BC7

DOEXT2:
        D=D-1   A                                * 02BCC
        HST=0   0                                * 02BCE
        GOC     L_02B7A                          * 02BD1
        D1=D1-  5                                * 02BD4
        DAT1=A  A                                * 02BD7
        A=DAT0  A                                * 02BDA
        D0=D0+  5                                * 02BDD
        PC=(A)                                   * 02BE0

        CON(5)  L_02D04                          * 02BE4
        CON(5)  L_0309A                          * 02BE9

DOEXT3:
        D=D-1   A                                * 02BEE
        HST=0   0                                * 02BF0
        GOC     L_02B7A                          * 02BF3
        D1=D1-  5                                * 02BF6
        DAT1=A  A                                * 02BF9
        A=DAT0  A                                * 02BFC
        D0=D0+  5                                * 02BFF
        PC=(A)                                   * 02C02

        CON(5)  L_02D04                          * 02C06
        CON(5)  L_0309A                          * 02C0B

DOEXT4:
        D=D-1   A                                * 02C10
        HST=0   0                                * 02C12
        GOC     L_02C91                          * 02C15
        D1=D1-  5                                * 02C18
        DAT1=A  A                                * 02C1B
        A=DAT0  A                                * 02C1E
        D0=D0+  5                                * 02C21
        PC=(A)                                   * 02C24
L_02C28:
        D0=D0-  5                                * 02C28
        AD0EX                                    * 02C2B
        D0=A                                     * 02C2E
        D0=D0+  10                               * 02C31
        D=D-1   A                                * 02C34
        GOC     L_02C91                          * 02C36
        D1=D1-  5                                * 02C39
        DAT1=A  A                                * 02C3C
        A=DAT0  A                                * 02C3F
        D0=D0+  5                                * 02C42
        PC=(A)                                   * 02C45
L_02C49:
        D0=D0-  5                                * 02C49
        AD0EX                                    * 02C4C
        D0=A                                     * 02C4F
        D0=D0+  5                                * 02C52
        D0=D0+  16                               * 02C55
        D=D-1   A                                * 02C58
        GOC     L_02C91                          * 02C5A
        D1=D1-  5                                * 02C5D
        DAT1=A  A                                * 02C60
        A=DAT0  A                                * 02C63
        D0=D0+  5                                * 02C66
        PC=(A)                                   * 02C69
L_02C6D:
        D0=D0-  5                                * 02C6D
        AD0EX                                    * 02C70
        D0=A                                     * 02C73
        D0=D0+  10                               * 02C76
        D0=D0+  16                               * 02C79
        D=D-1   A                                * 02C7C
        GOC     L_02C91                          * 02C7E
        D1=D1-  5                                * 02C81
        DAT1=A  A                                * 02C84
        A=DAT0  A                                * 02C87
        D0=D0+  5                                * 02C8A
        PC=(A)                                   * 02C8D
L_02C91:
        GOTO    L_02D52                          * 02C91
L_02C95:
        D0=D0-  5                                * 02C95
        AD0EX                                    * 02C98
        D0=A                                     * 02C9B
        D0=D0+  5                                * 02C9E
        D0=D0+  16                               * 02CA1
        D0=D0+  16                               * 02CA4
        D=D-1   A                                * 02CA7
        GOC     L_02C91                          * 02CA9
        D1=D1-  5                                * 02CAC
        DAT1=A  A                                * 02CAF
        A=DAT0  A                                * 02CB2
        D0=D0+  5                                * 02CB5
        PC=(A)                                   * 02CB8
L_02CBC:
        D0=D0-  5                                * 02CBC
        AD0EX                                    * 02CBF
        D0=A                                     * 02CC2
        D0=D0+  15                               * 02CC5
        D0=D0+  16                               * 02CC8
        D0=D0+  16                               * 02CCB
        D=D-1   A                                * 02CCE
        GOC     L_02C91                          * 02CD0
        D1=D1-  5                                * 02CD3
        DAT1=A  A                                * 02CD6
        A=DAT0  A                                * 02CD9
        D0=D0+  5                                * 02CDC
        PC=(A)                                   * 02CDF
L_02CE3:
        D0=D0-  5                                * 02CE3
        AD0EX                                    * 02CE6
        D0=A                                     * 02CE9
        D0=D0+  7                                * 02CEC
        D=D-1   A                                * 02CEF
        GOC     L_02C91                          * 02CF1
        D1=D1-  5                                * 02CF4
        DAT1=A  A                                * 02CF7
        A=DAT0  A                                * 02CFA
        D0=D0+  5                                * 02CFD
        PC=(A)                                   * 02D00
L_02D04:
        C=DAT0  A                                * 02D04
        D0=D0-  5                                * 02D07
        AD0EX                                    * 02D0A
        C=C+A   A                                * 02D0D
        D0=C                                     * 02D0F
        D0=D0+  5                                * 02D12
        D=D-1   A                                * 02D15
        GOC     L_02D52                          * 02D17
        D1=D1-  5                                * 02D1A
        DAT1=A  A                                * 02D1D
        A=DAT0  A                                * 02D20
        D0=D0+  5                                * 02D23
        PC=(A)                                   * 02D26
L_02D2A:
        D0=D0-  5                                * 02D2A
        CD0EX                                    * 02D2D
        D0=C                                     * 02D30
        RSTK=C                                   * 02D33
        GOSUB   SKIPOB                           * 02D35
        C=RSTK                                   * 02D39
        A=C     A                                * 02D3B
        D=D-1   A                                * 02D3D
        GOC     L_02D52                          * 02D3F
L_02D42:
        D1=D1-  5                                * 02D42
        DAT1=A  A                                * 02D45
        A=DAT0  A                                * 02D48
        D0=D0+  5                                * 02D4B
        PC=(A)                                   * 02D4E
L_02D52:
        LC(5)   L_02D42                          * 02D52
L_02D59:
        RSTK=C                                   * 02D59
        GOSUBL  SAVPTR                           * 02D5B
        D0=(5)  OSAVE                            * 02D61
        DAT0=A  A                                * 02D68
        GOSUBL  GARBAGECOL                       * 02D6B  inline data follows
        D0=(5)  OSAVE                            * 02D71
        A=DAT0  A                                * 02D78
        C=0     A                                * 02D7B
        DAT0=C  A                                * 02D7D
        GOSUBL  GETPTR                           * 02D80
        D=D-1   A                                * 02D86
        RTNNC                                    * 02D88
        D=0     A                                * 02D8B
        GOLONG  DOMEMERR                         * 02D8D

        CON(5)  L_02DE0                          * 02D93
        CON(5)  L_03077                          * 02D98

* Secondary prologue .. objects 5  SEMI
* refs (18): 0704B 0707F 0EE83 156B6 15B88 18EC7 ...
DOCOL:
        D=D-1   A                                * 02D9D
        HST=0   0                                * 02D9F
        GOC     L_02E15                          * 02DA2
        C=B     A                                * 02DA5
        CD0EX                                    * 02DA7
        DAT0=C  A                                * 02DAA
        D0=D0+  5                                * 02DAD
        AD0EX                                    * 02DB0
        B=A     A                                * 02DB3
        D0=D0+  5                                * 02DB5
        A=DAT0  A                                * 02DB8
        D0=D0+  5                                * 02DBB
        PC=(A)                                   * 02DBE

        CON(5)  L_02E20                          * 02DC2
        CON(5)  L_0309A                          * 02DC7

* Code prologue 5  length .. machine code
* refs (1): 0EE92
DOCODE:
        D=D-1   A                                * 02DCC
        HST=0   0                                * 02DCE
        D=D+1   A                                * 02DD1
        LC(5)   portnotaverr                     * 02DD3
        C=C+A   A                                * 02DDA
        RSTK=C                                   * 02DDC
        RTN                                      * 02DDE
L_02DE0:
        D0=D0-  5                                * 02DE0
        CD0EX                                    * 02DE3
        D0=C                                     * 02DE6
        RSTK=C                                   * 02DE9
        GOSUB   SKIPOB                           * 02DEB
        C=RSTK                                   * 02DEF
        A=C     A                                * 02DF1
        D=D-1   A                                * 02DF3
        GOC     L_02E15                          * 02DF5
L_02DF8:
        C=B     A                                * 02DF8
        CD0EX                                    * 02DFA
        DAT0=C  A                                * 02DFD
        D0=D0+  5                                * 02E00
        AD0EX                                    * 02E03
        B=A     A                                * 02E06
        D0=D0+  5                                * 02E08
        A=DAT0  A                                * 02E0B
        D0=D0+  5                                * 02E0E
        PC=(A)                                   * 02E11
L_02E15:
        LC(5)   L_02DF8                          * 02E15
        GOTO    L_02D59                          * 02E1C
L_02E20:
        C=DAT0  A                                * 02E20
        D0=D0-  5                                * 02E23
        AD0EX                                    * 02E26
        C=C+A   A                                * 02E29
        D0=C                                     * 02E2B
        D0=D0+  5                                * 02E2E
        LC(5)   portnotaverr                     * 02E31
        C=C+A   A                                * 02E38
        RSTK=C                                   * 02E3A
        RTN                                      * 02E3C

        CON(5)  L_02ECE                          * 02E3E
        CON(5)  L_030A8                          * 02E43

* Global name (ID) prologue 2  # of characters .. characters
* refs (17): 05B54 05EF1 07998 07BCB 07D54 15B5B ...
DOIDNT:
        D=D-1   A                                * 02E48
        HST=0   0                                * 02E4A
        GOC     L_02EAD                          * 02E4D
        D1=D1-  5                                * 02E50
        DAT1=A  A                                * 02E53
        LC(5)   Eval(nm)                         * 02E56
        A=C     A                                * 02E5D
        PC=(A)                                   * 02E5F

        CON(5)  L_02EFB                          * 02E63
        CON(5)  L_030A8                          * 02E68

* Local name (LAM) prologue see <REF>DOIDNT
* refs (17): 15BC4 190B0 1F0AE 2356B 2357D 24664 ...
DOLAM:
        D=D-1   A                                * 02E6D
        HST=0   0                                * 02E6F
        GOC     L_02EB8                          * 02E72
        D1=D1-  5                                * 02E75
        DAT1=A  A                                * 02E78
        LC(5)   DoLam                            * 02E7B
        A=C     A                                * 02E82
        PC=(A)                                   * 02E84

        CON(5)  L_02F28                          * 02E88
        CON(5)  L_03094                          * 02E8D

* XLIB prologue 3  library ID 3  command #
* refs (15): 03922 07B86 15C3C 26FA0 27269 2937C ...
DOROMP:
        D=D-1   A                                * 02E92
        HST=0   0                                * 02E94
        GOC     L_02EC3                          * 02E97
        D1=D1-  5                                * 02E9A
        DAT1=A  A                                * 02E9D
        LC(5)   ROMSEC                           * 02EA0
        A=C     A                                * 02EA7
        PC=(A)                                   * 02EA9
L_02EAD:
        LC(5)   L_02EE8                          * 02EAD
        GOTO    L_02D59                          * 02EB4
L_02EB8:
        LC(5)   L_02F15                          * 02EB8
        GOTO    L_02D59                          * 02EBF
L_02EC3:
        LC(5)   L_02F39                          * 02EC3
        GOTO    L_02D59                          * 02ECA
L_02ECE:
        C=0     A                                * 02ECE
        C=DAT0  B                                * 02ED0
        D0=D0-  5                                * 02ED3
        AD0EX                                    * 02ED6
        C=C+C   A                                * 02ED9
        C=C+A   A                                * 02EDB
        D0=C                                     * 02EDD
        D0=D0+  7                                * 02EE0
        D=D-1   A                                * 02EE3
        GOC     L_02EAD                          * 02EE5
L_02EE8:
        D1=D1-  5                                * 02EE8
        DAT1=A  A                                * 02EEB
        LC(5)   Eval(nm)                         * 02EEE
        A=C     A                                * 02EF5
        PC=(A)                                   * 02EF7
L_02EFB:
        C=0     A                                * 02EFB
        C=DAT0  B                                * 02EFD
        D0=D0-  5                                * 02F00
        AD0EX                                    * 02F03
        C=C+C   A                                * 02F06
        C=C+A   A                                * 02F08
        D0=C                                     * 02F0A
        D0=D0+  7                                * 02F0D
        D=D-1   A                                * 02F10
        GOC     L_02EB8                          * 02F12
L_02F15:
        D1=D1-  5                                * 02F15
        DAT1=A  A                                * 02F18
        LC(5)   DoLam                            * 02F1B
        A=C     A                                * 02F22
        PC=(A)                                   * 02F24
L_02F28:
        D0=D0-  5                                * 02F28
        AD0EX                                    * 02F2B
        D0=A                                     * 02F2E
        D0=D0+  11                               * 02F31
        D=D-1   A                                * 02F34
        GOC     L_02EC3                          * 02F36
L_02F39:
        D1=D1-  5                                * 02F39
        DAT1=A  A                                * 02F3C
        LC(5)   ROMSEC                           * 02F3F
        A=C     A                                * 02F46
        PC=(A)                                   * 02F48
        RPL

* refs (2): 02E56 02EEE
Eval(nm):
        :: DUP@ ' Eval(nm)~1 COLA RPIT           * 02F4C
        ;                                        * 02F6A

* refs (1): 02F5B
Eval(nm)~1:
        CON(5)  (*)+5                            * 02F6F  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 02F74
        RSTK=C                                   * 02F77
        CD1EX                                    * 02F79
        A=DAT1  A                                * 02F7C
        D1=C                                     * 02F7F
        LC(5)   DORRP                            * 02F82
        ?C=A    A                                * 02F89
        GOYES   L_02FBF                          * 02F8C
        LC(5)   ATTNFLG                          * 02F8E
        CD0EX                                    * 02F95
        A=DAT0  A                                * 02F98
        D0=C                                     * 02F9B
        C=RSTK                                   * 02F9E
        ?A#0    A                                * 02FA0
        GOYES   L_02FB2                          * 02FA3
        A=C     A                                * 02FA5
        D1=D1+  10                               * 02FA7
        D=D+1   A                                * 02FAA
        D=D+1   A                                * 02FAC
        PC=(A)                                   * 02FAE
L_02FB2:
        LC(5)   ?ATTNQUIT                        * 02FB2
        A=C     A                                * 02FB9
        PC=(A)                                   * 02FBB
L_02FBF:
        C=RSTK                                   * 02FBF
        D1=D1+  5                                * 02FC1
        DAT1=C  A                                * 02FC4
        D=D+1   A                                * 02FC7
        LC(5)   CONTEXT!                         * 02FC9
        A=C     A                                * 02FD0
        PC=(A)                                   * 02FD2
        RPL

* lam -> ob -> !error!
* refs (2): 02E7B 02F1B
DoLam:
        :: DRPExitAtLOOP ?SKIP SETLAMERR         * 02FD6
        ;                                        * 02FEA

* ROMPTR -> ?
* refs (2): 02EA0 02F3F
ROMSEC:
        :: ROMPTR@ ?SKIP SETROMPERR              * 02FEF
          COLA EVAL                              * 03003
        ;                                        * 0300D
        ASSEMBLE

* refs (5): 03786 0395F 06612 07055 0C56D
SUB_03012:
        ST=1    1                                * 03012
        GOTO    L_0301C                          * 03015

* Skip object in D0, clears ST1, clears carry, P=0 --> D0  = addr past object Uses: A.A C.A P ST1 RSTK2
* refs (86): 02D35 02DEB 03455 03BF4 03C0A 04EC1 ...
SKIPOB:
        ST=0    1                                * 03019
L_0301C:
        CD1EX                                    * 0301C
        RSTK=C                                   * 0301F
        C=B     A                                * 03021
        RSTK=C                                   * 03023
        P=      0                                * 03025
        B=0     A                                * 03027
        ?ST=1   1                                * 03029
        GOYES   L_03034                          * 0302C
L_0302E:
        A=DAT0  A                                * 0302E
        D0=D0+  5                                * 03031
L_03034:
        D1=A                                     * 03034
        A=DAT1  A                                * 03037
        LC(5)   PRLG                             * 0303A
        ?C#A    A                                * 03041
        GOYES   L_03050                          * 03044
        D1=D1-  5                                * 03046
        AD1EX                                    * 03049
        PC=(A)                                   * 0304C
L_03050:
        LC(5)   SEMILOOP~1                       * 03050
        ?C#A    A                                * 03057
        GOYES   L_03061                          * 0305A
        B=B-1   A                                * 0305C
        GOC     L_03071                          * 0305E
L_03061:
        ?B#0    A                                * 03061
        GOYES   L_0302E                          * 03064
L_03066:
        C=RSTK                                   * 03066
        B=C     A                                * 03068
        C=RSTK                                   * 0306A
        D1=C                                     * 0306C
        RTNCC                                    * 0306F
L_03071:
        D0=D0-  5                                * 03071
        GONC    L_03066                          * 03074
L_03077:
        B=B+1   A                                * 03077
        GONC    L_0302E                          * 03079
L_0307C:
        D0=D0+  16                               * 0307C
L_0307F:
        D0=D0+  16                               * 0307F
        GONC    L_03061                          * 03082
L_03085:
        D0=D0+  16                               * 03085
        D0=D0+  5                                * 03088
L_0308B:
        D0=D0+  16                               * 0308B
L_0308E:
        D0=D0+  5                                * 0308E
        GONC    L_03061                          * 03091
L_03094:
        D0=D0+  6                                * 03094
        GONC    L_03061                          * 03097
L_0309A:
        C=DAT0  A                                * 0309A
        AD0EX                                    * 0309D
        C=C+A   A                                * 030A0
        D0=C                                     * 030A2
        GONC    L_03061                          * 030A5
L_030A8:
        C=0     A                                * 030A8
        C=DAT0  B                                * 030AA
        C=C+C   A                                * 030AD
        AD0EX                                    * 030AF
        C=C+A   A                                * 030B2
        D0=C                                     * 030B4
L_030B7:
        D0=D0+  2                                * 030B7
        GONC    L_03061                          * 030BA
L_030BD:
        D0=D0-  5                                * 030BD
        AD0EX                                    * 030C0
        D0=A                                     * 030C3
        D0=D0+  5                                * 030C6
        D1=(5)  USEROB                           * 030C9
        C=DAT1  A                                * 030D0
        ?C#A    A                                * 030D3
        GOYES   L_030E4                          * 030D6
        C=DAT0  A                                * 030D8
L_030DB:
        D0=D0+  13                               * 030DB
        C=C-1   X                                * 030DE
        GONC    L_030DB                          * 030E1
L_030E4:
        D0=D0+  3                                * 030E4
        C=DAT0  A                                * 030E7
        ?C=0    A                                * 030EA
        GOYES   L_0308E                          * 030ED
        AD0EX                                    * 030EF
        C=C+A   A                                * 030F2
        D0=C                                     * 030F4
        C=0     A                                * 030F7
        C=DAT0  B                                * 030F9
        ?C=0    A                                * 030FC
        GOYES   L_0310E                          * 030FF
        C=C+C   A                                * 03101
        AD0EX                                    * 03103
        C=C+A   A                                * 03106
        D0=C                                     * 03108
        D0=D0+  2                                * 0310B
L_0310E:
        D0=D0+  2                                * 0310E
        GOTO    L_0302E                          * 03111
L_03115:
        C=0     A                                * 03115
        C=DAT0  B                                * 03117
        C=C+C   A                                * 0311A
        AD0EX                                    * 0311C
        C=C+A   A                                * 0311F
        D0=C                                     * 03121
        D0=D0+  2                                * 03124
        GOTO    L_0302E                          * 03127

* ->
* refs (35): 03665 0383B 0509C 05416 054D5 055C8 ...
SEMI:
        CON(5)  (*)+5                            * 0312B  primitive code object
SEMILOOP~1:
        C=B     A                                * 03130
        CD0EX                                    * 03132
        D0=D0-  5                                * 03135
        A=DAT0  A                                * 03138
        AD0EX                                    * 0313B
        B=A     A                                * 0313E
        D=D+1   A                                * 03140
        A=DAT0  A                                * 03142
        D0=D0+  5                                * 03145
        PC=(A)                                   * 03148

* 1..n -> 1..n #n
* refs (66): 15846 17CB5 17E2F 18C5E 1F65E 1FC4E ...
DEPTH:
        CON(5)  (*)+5                            * 0314C  primitive code object
        GOSUBL  SAVPTR                           * 03151
        LC(5)   EDITLINE                         * 03157
        CD1EX                                    * 0315E
        A=DAT1  A                                * 03161
        C=A-C   A                                * 03164
        GOSUBL  DIV5                             * 03166
        C=C-1   A                                * 0316C
        R0=C                                     * 0316E
        GOSUBL  PUSH#                            * 03171
        A=DAT0  A                                * 03177
        D0=D0+  5                                * 0317A
        PC=(A)                                   * 0317D
L_03181:
        GOSUB   SUB_03416                        * 03181
        GONC    L_03192                          * 03185  always taken

* ob -> ob ob
* refs (1523): 02214 05224 064C2 08FDA 09757 0976B ...
DUP:
        CON(5)  (*)+5                            * 03188  primitive code object
        D=D-1   A                                * 0318D
        GOC     L_03181                          * 0318F
L_03192:
        A=DAT1  A                                * 03192
        D1=D1-  5                                * 03195
        DAT1=A  A                                * 03198
        A=DAT0  A                                * 0319B
        D0=D0+  5                                * 0319E
        PC=(A)                                   * 031A1
L_031A5:
        GOSUB   SafeGargb                        * 031A5
        GONC    L_031BD                          * 031A9  always taken

* 1 2 -> 1 2 1 2
* refs (256): 0DEB1 0E0B5 0E0DD 0E10A 0FB74 0FB92 ...
2DUP:
        CON(5)  (*)+5                            * 031AC  primitive code object
        LC(5)   #00002                           * 031B1
        D=D-C   A                                * 031B8
        GOC     L_031A5                          * 031BA
L_031BD:
        C=DAT1  10                               * 031BD
        D1=D1-  10                               * 031C1
        DAT1=C  10                               * 031C4
        A=DAT0  A                                * 031C8
        D0=D0+  5                                * 031CB
        PC=(A)                                   * 031CE
L_031D2:
        GOSUB   SafeGargb                        * 031D2
        GONC    L_031F7                          * 031D6  always taken

* 1..n #n -> 1..n 1..n
* refs (15): 1FC89 2508B 2547A 2C85A 2C887 2CA3A ...
NDUP:
        CON(5)  (*)+5                            * 031D9  primitive code object
        A=DAT1  A                                * 031DE
        AD1EX                                    * 031E1
        D1=D1+  5                                * 031E4
        C=DAT1  A                                * 031E7
        D1=A                                     * 031EA
        D1=D1+  5                                * 031ED
        D=D+1   A                                * 031F0
        D=D-C   A                                * 031F2
        GOC     L_031D2                          * 031F4
L_031F7:
        A=C     A                                * 031F7
        A=A+A   A                                * 031F9
        A=A+A   A                                * 031FB
        A=A+C   A                                * 031FD
        CD1EX                                    * 031FF
        D1=C                                     * 03202
        C=C+A   A                                * 03205
        CD0EX                                    * 03207
        RSTK=C                                   * 0320A
        C=A     A                                * 0320C
        GOSUBL  MOVEUP                           * 0320E
        C=RSTK                                   * 03214
        D0=C                                     * 03216
        A=DAT0  A                                * 03219
        D0=D0+  5                                * 0321C
        PC=(A)                                   * 0321F

* 1 2 -> 2 1
* refs (1570): 0531D 05AB8 05E8B 05EDD 08E06 09020 ...
SWAP:
        CON(5)  (*)+5                            * 03223  primitive code object
        C=DAT1  A                                * 03228
        D1=D1+  5                                * 0322B
        A=DAT1  A                                * 0322E
        DAT1=C  A                                * 03231
        D1=D1-  5                                * 03234
        DAT1=A  A                                * 03237
        A=DAT0  A                                * 0323A
        D0=D0+  5                                * 0323D
        PC=(A)                                   * 03240

* 1 ->
* refs (1153): 02200 02237 041E3 08CAE 0932F 09859 ...
DROP:
        CON(5)  (*)+5                            * 03244  primitive code object

* Pop stack, Loop
* refs (3): 03244 03321 30DBB
DropLoop:
        D1=D1+  5                                * 03249
        D=D+1   A                                * 0324C
        A=DAT0  A                                * 0324E
        D0=D0+  5                                * 03251
        PC=(A)                                   * 03254

* 1 2 ->
* refs (273): 0C65E 0C6F9 0F1AA 0F204 0F39E 0F420 ...
2DROP:
        CON(5)  (*)+5                            * 03258  primitive code object
        D1=D1+  10                               * 0325D
        D=D+1   A                                * 03260
        D=D+1   A                                * 03262
        A=DAT0  A                                * 03264
        D0=D0+  5                                * 03267
        PC=(A)                                   * 0326A

* meta ->
* refs (105): 098CC 10919 169AA 1F70D 1FC6E 1FCFA ...
NDROP:
        CON(5)  (*)+5                            * 0326E  primitive code object
        GOSUBL  POP#                             * 03273
        C=A     A                                * 03279
        A=A+A   A                                * 0327B
        A=A+A   A                                * 0327D
        A=A+C   A                                * 0327F
        CD1EX                                    * 03281
        C=C+A   A                                * 03284
        CD1EX                                    * 03286
        D=D+C   A                                * 03289
        A=DAT0  A                                * 0328B
        D0=D0+  5                                * 0328E
        PC=(A)                                   * 03291

* 1 2 3 -> 2 3 1
* refs (596): 08F8A 092D0 09433 0979D 0B688 0E470 ...
ROT:
        CON(5)  (*)+5                            * 03295  primitive code object
        A=DAT1  10                               * 0329A
        D1=D1+  10                               * 0329E
        C=DAT1  A                                * 032A1
        D1=D1-  5                                * 032A4
        DAT1=A  10                               * 032A7
        D1=D1-  5                                * 032AB
        DAT1=C  A                                * 032AE
        A=DAT0  A                                * 032B1
        D0=D0+  5                                * 032B4
        PC=(A)                                   * 032B7
L_032BB:
        GOSUB   SUB_03416                        * 032BB
        GONC    L_032CC                          * 032BF  always taken

* 1 2 -> 1 2 1
* refs (827): 052CB 052FF 08F99 09370 0939D 093C5 ...
OVER:
        CON(5)  (*)+5                            * 032C2  primitive code object
        D=D-1   A                                * 032C7
        GOC     L_032BB                          * 032C9
L_032CC:
        D1=D1+  5                                * 032CC
        C=DAT1  A                                * 032CF
        D1=D1-  10                               * 032D2
        DAT1=C  A                                * 032D5
        A=DAT0  A                                * 032D8
        D0=D0+  5                                * 032DB
        PC=(A)                                   * 032DE

* 1..n #n -> 1..n 1
* refs (79): 103B5 103C9 103D8 10464 1046E 1050E ...
PICK:
        CON(5)  (*)+5                            * 032E2  primitive code object
        C=DAT1  A                                * 032E7
        CD1EX                                    * 032EA
        D1=D1+  5                                * 032ED
        A=DAT1  A                                * 032F0
L_032F3:
        RSTK=C                                   * 032F3
        ?A=0    A                                * 032F5
        GOYES   L_0331C                          * 032F8
        C=A     A                                * 032FA
        A=A+A   A                                * 032FC
        A=A+A   A                                * 032FE
        A=A+C   A                                * 03300
        C=RSTK                                   * 03302
        A=A+C   A                                * 03304
        D1=A                                     * 03306
        A=DAT1  A                                * 03309
        D1=C                                     * 0330C
        DAT1=A  A                                * 0330F
        A=DAT0  A                                * 03312
        D0=D0+  5                                * 03315
        PC=(A)                                   * 03318
L_0331C:
        C=RSTK                                   * 0331C
        D1=C                                     * 0331E
        GOTO    DropLoop                         * 03321

* 1..n #n -> 2..n 1
* refs (113): 09809 0B5F2 107D4 109E1 1FCBF 219B3 ...
ROLL:
        CON(5)  (*)+5                            * 03325  primitive code object
        GOSUBL  POP#                             * 0332A
L_03330:
        A=A-1   A                                * 03330
        GOC     L_03394                          * 03332
        ?A=0    A                                * 03335
        GOYES   L_03394                          * 03338
        C=A     A                                * 0333A
        A=A+A   A                                * 0333C
        A=A+A   A                                * 0333E
        A=A+C   A                                * 03340
        CD1EX                                    * 03342
        C=C+A   A                                * 03345
        D1=C                                     * 03347
        C=DAT1  A                                * 0334A
        RSTK=C                                   * 0334D
        C=A     A                                * 0334F
        C=C-1   A                                * 03351
        CPEX    0                                * 03353
        CSR     A                                * 03357
L_03359:
        C=C-1   A                                * 03359
        GOC     L_03372                          * 0335B
        D1=D1-  16                               * 0335E
        A=DAT1  W                                * 03361
        D1=D1+  5                                * 03365
        DAT1=A  W                                * 03368
        D1=D1-  5                                * 0336C
        GONC    L_03359                          * 0336F
L_03372:
        AD1EX                                    * 03372
        C=0     A                                * 03375
        C+P+1                                    * 03377
        A=A-C   A                                * 0337A
        D1=A                                     * 0337C
        A=DAT1  WP                               * 0337F
        D1=D1+  5                                * 03383
        DAT1=A  WP                               * 03386
        P=      0                                * 0338A
        D1=D1-  5                                * 0338C
        C=RSTK                                   * 0338F
        DAT1=C  A                                * 03391
L_03394:
        A=DAT0  A                                * 03394
        D0=D0+  5                                * 03397
        PC=(A)                                   * 0339A

* 1..n #n -> n 1..n-1
* refs (53): 0E4BC 10A22 10A77 10A86 127FC 174FA ...
UNROLL:
        CON(5)  (*)+5                            * 0339E  primitive code object
        GOSUBL  POP#                             * 033A3
L_033A9:
        A=A-1   A                                * 033A9
        GOC     L_03394                          * 033AB
        ?A=0    A                                * 033AE
        GOYES   L_03394                          * 033B1
        CD1EX                                    * 033B3
        D1=C                                     * 033B6
        RSTK=C                                   * 033B9
        C=DAT1  A                                * 033BB
        RSTK=C                                   * 033BE
        D1=D1+  5                                * 033C0
        C=A     A                                * 033C3
        A=A+A   A                                * 033C5
        A=A+A   A                                * 033C7
        C=C+A   A                                * 033C9
        C=C-1   A                                * 033CB
        CPEX    0                                * 033CD
        CSR     A                                * 033D1
L_033D3:
        C=C-1   A                                * 033D3
        GOC     L_033EC                          * 033D5
        A=DAT1  W                                * 033D8
        D1=D1-  5                                * 033DC
        DAT1=A  W                                * 033DF
        D1=D1+  5                                * 033E3
        D1=D1+  16                               * 033E6
        GONC    L_033D3                          * 033E9
L_033EC:
        A=DAT1  WP                               * 033EC
        D1=D1-  5                                * 033F0
        DAT1=A  WP                               * 033F3
        CD1EX                                    * 033F7
        C+P+1                                    * 033FA
        D1=C                                     * 033FD
        P=      0                                * 03400
        C=RSTK                                   * 03402
        DAT1=C  A                                * 03404
        C=RSTK                                   * 03407
        D1=C                                     * 03409
        A=DAT0  A                                * 0340C
        D0=D0+  5                                * 0340F
        PC=(A)                                   * 03412

* refs (2): 03181 032BB
SUB_03416:
        LC(5)   #00001                           * 03416

* refs (2): 031A5 031D2
SafeGargb:
        R0=C                                     * 0341D
        GOSUBL  SAVPTR                           * 03420
        GOSUBL  GARBAGECOL                       * 03426  inline data follows
        GOSUBL  GETPTR                           * 0342C
        C=R0                                     * 03432
        D=D-C   A                                * 03435
        RTNNC                                    * 03437

D+ErrIM*:
        D=D+C   A                                * 0343A
        GOLONG  DOMEMERR                         * 0343C

* {#n #m} ob -> []
* refs (50): 1D077 1D217 1D33B 2C2FC 2C36F 2C4C8 ...
MAKEARRY:
        CON(5)  (*)+5                            * 03442  primitive code object
        GOSUBL  SAVPTR                           * 03447
        A=DAT1  A                                * 0344D
        B=A     A                                * 03450
        D0=A                                     * 03452
        GOSUBL  SKIPOB                           * 03455
        AD0EX                                    * 0345B
        A=A-B   A                                * 0345E
        LC(5)   #00005                           * 03460
        A=A-C   A                                * 03467
        R2=A                                     * 03469
        D1=D1+  5                                * 0346C
        A=DAT1  A                                * 0346F
        R3=A                                     * 03472
        GOSUBL  SUB_0381C                        * 03475
        C=D     A                                * 0347B
        A=C     A                                * 0347D
        AR3EX                                    * 0347F
        GOSUBL  SUB_0384F                        * 03482
        GONC    L_03491                          * 03488
L_0348B:
        GOLONG  RrErrIM                          * 0348B
L_03491:
        R4=A                                     * 03491
        C=R2                                     * 03494
        GOSUBL  MUL#                             * 03497
        GOC     L_0348B                          * 0349D
        A=R3                                     * 034A0
        B=B+A   A                                * 034A3
        GOC     L_0348B                          * 034A5
        A=A+A   A                                * 034A8
        GOC     L_0348B                          * 034AA
        A=A+A   A                                * 034AD
        GOC     L_0348B                          * 034AF
        A=A+B   A                                * 034B2
        GOC     L_0348B                          * 034B4
        LC(5)   #00014                           * 034B7
        C=C+A   A                                * 034BE
        GOC     L_0348B                          * 034C0
        GOSUBL  GETTEMP                          * 034C3
        AD0EX                                    * 034C9
        D1=A                                     * 034CC
        R0=A                                     * 034CF
        CD0EX                                    * 034D2
        D0=D0-  5                                * 034D5
        AD0EX                                    * 034D8
        LC(5)   DOARRY                           * 034DB
        DAT1=C  A                                * 034E2
        D1=D1+  5                                * 034E5
        DAT1=A  A                                * 034E8
        D1=D1+  5                                * 034EB
        D0=(5)  DSKTOP                           * 034EE
        A=DAT0  A                                * 034F5
        D0=A                                     * 034F8
        A=DAT0  A                                * 034FB
        D0=D0+  5                                * 034FE
        AD0EX                                    * 03501
        C=DAT0  A                                * 03504
        D0=D0+  5                                * 03507
        AD0EX                                    * 0350A
        B=A     A                                * 0350D
        DAT1=C  A                                * 0350F
        D1=D1+  5                                * 03512
        C=R3                                     * 03515
        DAT1=C  A                                * 03518
        D=C     A                                * 0351B
        A=DAT0  A                                * 0351D
        D0=A                                     * 03520
L_03523:
        D1=D1+  5                                * 03523
        D=D-1   A                                * 03526
        GOC     L_03535                          * 03528
        GOSUB   SUB_03878                        * 0352B
        DAT1=C  A                                * 0352F
        GONC    L_03523                          * 03532
L_03535:
        C=R4                                     * 03535
        D=C     A                                * 03538
L_0353A:
        D=D-1   A                                * 0353A
        GOC     L_03550                          * 0353C
        A=B     A                                * 0353F
        D0=A                                     * 03541
        C=R2                                     * 03544
        GOSUBL  MOVEDOWN                         * 03547
        GONC    L_0353A                          * 0354D
L_03550:
        A=R0                                     * 03550
L_03553:
        GOSUBL  GETPTR                           * 03553
        D1=D1+  5                                * 03559
        D=D+1   A                                * 0355C
        GOTO    L_03678                          * 0355E

* [] -> #
* refs (11): 1DA25 35E54 36958 37BD5 6314B 882F6 ...
ARSIZE:
        CON(5)  (*)+5                            * 03562  primitive code object
        A=DAT1  A                                * 03567
        D1=D1+  5                                * 0356A
        D=D+1   A                                * 0356D
        GOSUBL  SAVPTR                           * 0356F
        D1=A                                     * 03575
        GOSUB   LenArD1                          * 03578

* <REF>GETPTR , Push A as #, Loop
* refs (19): 05A46 05A6F 1018D 114C2 21C68 3082C ...
PUSH#ALOOP:
        R0=A                                     * 0357C

* <REF>GETPTR , Push R0 as #, Loop
* refs (26): 0456E 05546 0590B 0E29A 0EC6F 13F62 ...
PUSH#LOOP:
        GOSUBL  PUSH#                            * 0357F
L_03585:
        A=DAT0  A                                * 03585
        D0=D0+  5                                * 03588
        PC=(A)                                   * 0358B

* refs (8): 1697D 1701A 35CE0 37A13 37A54 90111 ...
prefix(ar):
        CON(5)  (*)+5                            * 0358F  primitive code object
        C=DAT1  A                                * 03594
        CD1EX                                    * 03597
        D1=D1+  10                               * 0359A
        A=DAT1  A                                * 0359D
        D1=C                                     * 035A0
        GOLONG  L_03C75                          * 035A3

* [] -> {#n #m}
* refs (17): 16991 1CA53 1D0C9 1DA39 35FAD 3605C ...
DIMLIMITS:
        CON(5)  (*)+5                            * 035A9  primitive code object
        GOSUBL  SAVPTR                           * 035AE
        A=DAT1  A                                * 035B4
        D1=A                                     * 035B7
        D1=D1+  15                               * 035BA
        C=DAT1  A                                * 035BD
        D=C     A                                * 035C0
        LC(5)   #0000F                           * 035C2
        B=C     A                                * 035C9
        LC(1)   #A                               * 035CB
        P=      4                                * 035CE
L_035D0:
        D=D-1   A                                * 035D0
        GOC     L_035E9                          * 035D2
        D1=D1+  5                                * 035D5
        A=DAT1  A                                * 035D8
        ?A<=B   A                                * 035DB
        GOYES   L_035E3                          * 035DE
        C+P+1                                    * 035E0
L_035E3:
        C+P+1                                    * 035E3
        GONC    L_035D0                          * 035E6
L_035E9:
        P=      0                                * 035E9
        GOSUB   GETTEMP                          * 035EB
        AD0EX                                    * 035EF
        D0=A                                     * 035F2
        R0=A                                     * 035F5
        D1=(5)  DSKTOP                           * 035F8
        C=DAT1  A                                * 035FF
        D1=C                                     * 03602
        A=DAT1  A                                * 03605
        D1=A                                     * 03608
        D1=D1+  15                               * 0360B
        C=DAT1  A                                * 0360E
        D=C     A                                * 03611
        LC(5)   DOLIST                           * 03613
        DAT0=C  A                                * 0361A
        D0=D0+  5                                * 0361D
        LC(5)   #0000F                           * 03620
        B=C     A                                * 03627
L_03629:
        D=D-1   A                                * 03629
        GOC     L_03665                          * 0362B
        D1=D1+  5                                * 0362E
        A=DAT1  A                                * 03631
        ?A<=B   A                                * 03634
        GOYES   L_0364F                          * 03637
        LC(5)   DOBINT                           * 03639
        DAT0=C  A                                * 03640
        D0=D0+  5                                * 03643
L_03646:
        DAT0=A  A                                * 03646
        D0=D0+  5                                * 03649
        GONC    L_03629                          * 0364C
L_0364F:
        A=A+A   A                                * 0364F
        C=A     A                                * 03651
        A=A+A   A                                * 03653
        A=A+A   A                                * 03655
        A=A+C   A                                * 03657
        LC(5)   BINT0                            * 03659
        A=A+C   A                                * 03660
        GONC    L_03646                          * 03662
L_03665:
        LC(5)   SEMI                             * 03665
        DAT0=C  A                                * 0366C

* <REF>GETPTR , OverWr R0, Loop
* refs (7): 160CA 162E3 16954 18485 30212 3046B ...
GPOverWrR0Lp:
        A=R0                                     * 0366F

* <REF>GETPTR , OverWr A, Loop
* refs (9): 0513D 0580F 05C21 2E285 2FF85 37457 ...
GPOverWrALp:
        GOSUBL  GETPTR                           * 03672
L_03678:
        DAT1=A  A                                * 03678
        A=DAT0  A                                * 0367B
        D0=D0+  5                                * 0367E
        PC=(A)                                   * 03681

* {#n #m} [] -> # T -> F
* refs (1): 1DC8C
ARRYEL?:
        CON(5)  (*)+5                            * 03685  primitive code object
        C=DAT1  A                                * 0368A
        RSTK=C                                   * 0368D
        D1=D1+  5                                * 0368F
        D=D+1   A                                * 03692
        A=DAT1  A                                * 03694
        D1=D1+  5                                * 03697
        D=D+1   A                                * 0369A
        GOSUBL  SAVPTR                           * 0369C
        C=A     A                                * 036A2
        RSTK=C                                   * 036A4
        GOSUB   SUB_0381C                        * 036A6
        C=RSTK                                   * 036AA
        D0=C                                     * 036AC
        C=RSTK                                   * 036AF
        D1=C                                     * 036B1
        D1=D1+  15                               * 036B4
        C=DAT1  A                                * 036B7
        ?D#C    A                                * 036BA
        GOYES   L_0370A                          * 036BD
        D=D-1   A                                * 036BF
        GOC     L_0370A                          * 036C1
        B=0     A                                * 036C4
        D1=D1+  5                                * 036C6
L_036C9:
        GOSUB   SUB_03878                        * 036C9
        A=DAT1  A                                * 036CD
        ?C>A    A                                * 036D0
        GOYES   L_0370A                          * 036D3
        C=C-1   A                                * 036D5
        GOC     L_0370A                          * 036D7
        B=B+C   A                                * 036DA
        D=D-1   A                                * 036DC
        GOC     L_036F0                          * 036DE
        D1=D1+  5                                * 036E1
        C=DAT1  A                                * 036E4
        A=B     A                                * 036E7
        GOSUB   MUL#                             * 036E9
        GONC    L_036C9                          * 036ED
L_036F0:
        B=B+1   A                                * 036F0
        A=B     A                                * 036F2
        R0=A                                     * 036F4

* <REF>GETPTR , Push R0 as #, Do TRUE
Push#TLoop:
        GOSUBL  PUSH#                            * 036F7
        LC(5)   TRUE                             * 036FD
        A=C     A                                * 03704
        PC=(A)                                   * 03706
L_0370A:
        GOSUBL  GETPTR                           * 0370A
        LC(5)   FALSE                            * 03710
        A=C     A                                * 03717
        PC=(A)                                   * 03719

* # [] -> ob T -> F
* refs (14): 1706D 8A906 8D0AD 8D152 9A3D9 9A479 ...
GETATELN:
        CON(5)  (*)+5                            * 0371D  primitive code object
        GOSUB   GETATELN~1                       * 03722
        R2=A                                     * 03726
        A=DAT1  A                                * 03729
        R1=A                                     * 0372C
        D1=D1+  5                                * 0372F
        C=DAT1  A                                * 03732
        CD1EX                                    * 03735
        D1=D1+  5                                * 03738
        A=DAT1  A                                * 0373B
        D1=C                                     * 0373E
        D1=D1-  5                                * 03741
        GOSUBL  SAVPTR                           * 03744
        C=R1                                     * 0374A
        GOSUB   SUB_038A0                        * 0374D
        ?ST=0   3                                * 03751
        GOYES   L_03773                          * 03754
        A=DAT0  A                                * 03756
        ?A#0    A                                * 03759
        GOYES   L_0376B                          * 0375C
        LC(5)   FALSE                            * 0375E
        A=C     A                                * 03765
        GOTO    L_03553                          * 03767
L_0376B:
        CD0EX                                    * 0376B
        C=C+A   A                                * 0376E
        D0=C                                     * 03770
L_03773:
        C=R1                                     * 03773
        AD0EX                                    * 03776
        C=A-C   A                                * 03779
        R3=C                                     * 0377B
        D0=A                                     * 0377E
        B=A     A                                * 03781
        A=R2                                     * 03783
        GOSUBL  SUB_03012                        * 03786
        D0=D0+  5                                * 0378C
        CD0EX                                    * 0378F
        C=C-B   A                                * 03792
        GOSUB   GETTEMP                          * 03794
        AD0EX                                    * 03798
        B=A     A                                * 0379B
        D1=A                                     * 0379D
        A=R2                                     * 037A0
        DAT1=A  A                                * 037A3
        D1=D1+  5                                * 037A6
        CD0EX                                    * 037A9
        D0=D0-  5                                * 037AC
        CD0EX                                    * 037AF
        D0=(5)  DSKTOP                           * 037B2
        A=DAT0  A                                * 037B9
        D0=A                                     * 037BC
        A=DAT0  A                                * 037BF
        CR3EX                                    * 037C2
        C=C+A   A                                * 037C5
        D0=C                                     * 037C7
        C=R3                                     * 037CA
        GOSUBL  MOVEDOWN                         * 037CD
        A=B     A                                * 037D3
        GOSUBL  GETPTR                           * 037D5
        LC(5)   TRUE                             * 037DB
        DAT1=C  A                                * 037E2
        D1=D1+  5                                * 037E5
        DAT1=A  A                                * 037E8
        D1=D1-  5                                * 037EB
        GOTO    L_03585                          * 037EE

* refs (1): 03722
GETATELN~1:
        C=DAT1  A                                * 037F2

* refs (1): 0C512
SUB_037F5:
        CD1EX                                    * 037F5
        RSTK=C                                   * 037F8
        A=DAT1  A                                * 037FA
        ST=0    3                                * 037FD
        LC(5)   DOARRY                           * 03800
        ?C=A    A                                * 03807
        GOYES   L_0380F                          * 0380A
        ST=1    3                                * 0380C
L_0380F:
        D1=D1+  10                               * 0380F
        A=DAT1  A                                * 03812
        C=RSTK                                   * 03815
        D1=C                                     * 03817
        RTNCC                                    * 0381A

* refs (2): 03475 036A6
SUB_0381C:
        D0=A                                     * 0381C
        D0=D0+  5                                * 0381F
        D=0     A                                * 03822
L_03824:
        LC(5)   DOBINT                           * 03824
L_0382B:
        A=DAT0  A                                * 0382B
        ?C#A    A                                * 0382E
        GOYES   L_0383B                          * 03831
        D0=D0+  10                               * 03833
        D=D+1   A                                * 03836
        GONC    L_0382B                          * 03838
L_0383B:
        LC(5)   SEMI                             * 0383B
        ?C=A    A                                * 03842
        RTNYES                                   * 03845
        D0=D0+  5                                * 03847
        D=D+1   A                                * 0384A
        GONC    L_03824                          * 0384C

* refs (1): 03482
SUB_0384F:
        D0=A                                     * 0384F
        A=0     A                                * 03852
        D=D-1   A                                * 03854
        GOC     L_03876                          * 03856
        GOSUB   SUB_03878                        * 03859
        B=C     A                                * 0385D
L_0385F:
        D=D-1   A                                * 0385F
        GOC     L_03874                          * 03861
        GOSUB   SUB_03878                        * 03864
        A=B     A                                * 03868
        GOSUB   MUL#                             * 0386A
        RTNC                                     * 0386E
        GONC    L_0385F                          * 03871
L_03874:
        A=B     A                                * 03874
L_03876:
        RTNCC                                    * 03876

* refs (4): 0352B 036C9 03859 03864
SUB_03878:
        D0=D0+  5                                * 03878
        A=DAT0  A                                * 0387B
        LC(5)   DOBINT                           * 0387E
        ?C=A    A                                * 03885
        GOYES   L_03898                          * 03888
        AD0EX                                    * 0388A
        D0=D0+  5                                * 0388D
        C=DAT0  A                                * 03890
        D0=A                                     * 03893
        RTN                                      * 03896
L_03898:
        D0=D0+  5                                * 03898
        C=DAT0  A                                * 0389B
        RTN                                      * 0389E

* refs (2): 0374D 0C53B
SUB_038A0:
        D0=C                                     * 038A0
        D0=D0+  15                               * 038A3
        C=DAT0  A                                * 038A6
        D=C     A                                * 038A9
L_038AB:
        D=D-1   A                                * 038AB
        GOC     L_038B6                          * 038AD
        D0=D0+  5                                * 038B0
        GONC    L_038AB                          * 038B3
L_038B6:
        A=A-1   A                                * 038B6
        RTNC                                     * 038B8
        D0=D0+  5                                * 038BB
        B=A     A                                * 038BE
        ?ST=0   3                                * 038C0
        GOYES   L_038D5                          * 038C3
L_038C5:
        B=B+B   A                                * 038C5
        B=B+B   A                                * 038C7
        B=B+A   A                                * 038C9
        AD0EX                                    * 038CB
        A=A+B   A                                * 038CE
        D0=A                                     * 038D0
        RTNSC                                    * 038D3
L_038D5:
        C=R2                                     * 038D5
        D=C     A                                * 038D8
        LC(5)   DOBINT                           * 038DA
        ?D=C    A                                * 038E1
        GOYES   L_038C5                          * 038E4
        LC(5)   DOREAL                           * 038E6
        ?D=C    A                                * 038ED
        GOYES   L_0394A                          * 038F0
        LC(5)   DOEREL                           * 038F2
        ?D=C    A                                * 038F9
        GOYES   L_0393B                          * 038FC
        LC(5)   DOCMP                            * 038FE
        ?D=C    A                                * 03905
        GOYES   L_03948                          * 03908
        LC(5)   DOECMP                           * 0390A
        ?D=C    A                                * 03911
        GOYES   L_03937                          * 03914
        LC(5)   DOCHAR                           * 03916
        ?D=C    A                                * 0391D
        GOYES   L_03932                          * 03920
        LC(5)   DOROMP                           * 03922
        ?D#C    A                                * 03929
        GOYES   L_03956                          * 0392C
        B=B+B   A                                * 0392E
        B=B+A   A                                * 03930
L_03932:
        B=B+B   A                                * 03932
        GONC    L_0394C                          * 03934
L_03937:
        B=B+B   A                                * 03937
        A=B     A                                * 03939
L_0393B:
        B=B+B   A                                * 0393B
        B=B+B   A                                * 0393D
        B=B+A   A                                * 0393F
        ASL     A                                * 03941
        B=B+A   A                                * 03943
        GONC    L_0394C                          * 03945
L_03948:
        B=B+B   A                                * 03948
L_0394A:
        BSL     A                                * 0394A
L_0394C:
        AD0EX                                    * 0394C
        A=A+B   A                                * 0394F
        D0=A                                     * 03951
        RTNSC                                    * 03954
L_03956:
        B=B-1   A                                * 03956
        RTNC                                     * 03958
        C=D     A                                * 0395B
        A=C     A                                * 0395D
        GOSUBL  SUB_03012                        * 0395F
        GONC    L_03956                          * 03965

* refs (2): 03578 0C522
LenArD1:
        D1=D1+  15                               * 03968
        C=DAT1  A                                * 0396B
        D=C     A                                * 0396E
        A=0     A                                * 03970
        D=D-1   A                                * 03972
        RTNC                                     * 03974
        D1=D1+  5                                * 03977
        A=DAT1  A                                * 0397A
L_0397D:
        D=D-1   A                                * 0397D
        RTNC                                     * 0397F
        D1=D1+  5                                * 03982
        C=DAT1  A                                * 03985
        GOSUB   MUL#                             * 03988
        A=B     A                                * 0398C
        GONC    L_0397D                          * 0398E

* B.A = A.A*C.A
* refs (4): 03497 036E9 0386A 03988
MUL#:
        B=0     A                                * 03991
        ?A#0    A                                * 03993
        GOYES   L_0399A                          * 03996
        RTN                                      * 03998
L_0399A:
        ?CBIT=0 0                                * 0399A
        GOYES   L_039AB                          * 0399F
        B=B+A   A                                * 039A1
        RTNC                                     * 039A3
        CBIT=0  0                                * 039A6
L_039AB:
        ?C#0    A                                * 039AB
        GOYES   L_039B2                          * 039AE
        RTN                                      * 039B0
L_039B2:
        CSRB.F  A                                * 039B2
        A=A+A   A                                * 039B7
        GONC    L_0399A                          * 039B9
        RTN                                      * 039BC

* <REF>CREATETEMP with <REF>GARBAGECOL if necessary <REF>GPMEMERR if not enough memory
* refs (20): 034C3 035EB 03794 0511F 05A90 05B30 ...
GETTEMP:
        ST=0    10                               * 039BE
L_039C1:
        RSTK=C                                   * 039C1
        GOSUBL  CREATETEMP                       * 039C3
        GONC    L_039DF                          * 039C9
        ?ST=1   10                               * 039CC
        GOYES   RrErrIM                          * 039CF
        GOSUBL  GARBAGECOL                       * 039D1  inline data follows
        ST=1    10                               * 039D7
        C=RSTK                                   * 039DA
        GONC    L_039C1                          * 039DC
L_039DF:
        C=RSTK                                   * 039DF
        RTNCC                                    * 039E1

* refs (2): 0348B 039CC
RrErrIM:
        GOSUBL  GETPTR                           * 039E3
L_039E9:
        GOLONG  DOMEMERR                         * 039E9

* refs (1): 0866E
ECUSER:
        ?ST=1   5                                * 039EF
        GOYES   ECUSER~1                         * 039F2
        R2=A                                     * 039F4
        GOSUBL  SUB_0852C                        * 039F7
        A=R2                                     * 039FD
        C=R0                                     * 03A00
        GOLONG  MOVEDSU                          * 03A03
ECUSER~1:
        R2=A                                     * 03A09
        AD0EX                                    * 03A0C
        R1=A                                     * 03A0F
        GOSUB   SUB_03A2E                        * 03A12
        A=R1                                     * 03A16
        D0=A                                     * 03A19
        GOSUBL  SUB_0852C                        * 03A1C
        A=R2                                     * 03A22
        C=R0                                     * 03A25
        GOLONG  MOVEDSD                          * 03A28

* refs (1): 03A12
SUB_03A2E:
        ST=0    10                               * 03A2E
L_03A31:
        D=C     A                                * 03A31
        GOSUBL  ROOM                             * 03A33
        DCEX    A                                * 03A39
        ?D>=C   A                                * 03A3B
        RTNYES                                   * 03A3E
        ?ST=1   10                               * 03A40
        GOYES   L_03A55                          * 03A43
        RSTK=C                                   * 03A45
        GOSUBL  GARBAGECOL                       * 03A47  inline data follows
        ST=1    10                               * 03A4D
        C=RSTK                                   * 03A50
        GONC    L_03A31                          * 03A52
L_03A55:
        GOSUBL  GETPTR                           * 03A55
        D1=D1+  5                                * 03A5B
        D=D+1   A                                * 03A5E
        GOTO    L_039E9                          * 03A60

* refs (2): 08534 0864D
SUB_03A64:
        D0=(5)  INITEN                           * 03A64
        A=DAT0  B                                * 03A6B
        ST=0    2                                * 03A6E
        ?A=0    P                                * 03A71
        RTNYES                                   * 03A74
        ST=1    2                                * 03A76
        A=0     P                                * 03A79
        DAT0=A  B                                * 03A7C
        RTN                                      * 03A7F

* -> T
* refs (630): 036FD 037DB 03B1A 03B88 03C59 0482F ...
TRUE:
        CON(5)  (*)+5                            * 03A81  primitive code object

* Push A, Loop
* refs (3): 03A81 3A9C6 B9839
PUSHA:
        D=D-1   A                                * 03A86
        GOC     L_03A9B                          * 03A88
L_03A8B:
        D1=D1-  5                                * 03A8B
        DAT1=A  A                                * 03A8E
        A=DAT0  A                                * 03A91
        D0=D0+  5                                * 03A94
        PC=(A)                                   * 03A97
L_03A9B:
        R2=A                                     * 03A9B
        GOSUBL  SAVPTR                           * 03A9E
        GOSUBL  GARBAGECOL                       * 03AA4  inline data follows
        GOSUBL  GETPTR                           * 03AAA
        A=R2                                     * 03AB0
        D=D-1   A                                * 03AB3
        GONC    L_03A8B                          * 03AB5
        D=0     A                                * 03AB8
        GOLONG  DOMEMERR                         * 03ABA

* -> F
* refs (580): 03710 0375E 03AFA 03B06 03B59 03BC7 ...
FALSE:
        CON(5)  (*)+5                            * 03AC0  primitive code object
        D=D-1   A                                * 03AC5
        GOC     L_03A9B                          * 03AC7
        D1=D1-  5                                * 03ACA
        DAT1=A  A                                * 03ACD
        A=DAT0  A                                * 03AD0
        D0=D0+  5                                * 03AD3
        PC=(A)                                   * 03AD6

* flag1 flag2 -> flag
* refs (3): 1E95A 47BAF D243F
XOR:
        CON(5)  (*)+5                            * 03ADA  primitive code object
        A=DAT1  A                                * 03ADF
        D1=D1+  5                                * 03AE2
        D=D+1   A                                * 03AE5
        C=DAT1  A                                * 03AE7
        ?C=A    A                                * 03AEA
        GOYES   L_03B06                          * 03AED
        GONC    L_03B1A                          * 03AEF

* flag -> flag'
* refs (150): 06BCC 092AD 0988B 0B166 0BCD9 0DF7A ...
NOT:
        CON(5)  (*)+5                            * 03AF2  primitive code object
        A=DAT1  A                                * 03AF7
        LC(5)   FALSE                            * 03AFA
L_03B01:
        ?C=A    A                                * 03B01
        GOYES   L_03B1A                          * 03B04
L_03B06:
        LC(5)   FALSE                            * 03B06
        DAT1=C  A                                * 03B0D
        A=DAT0  A                                * 03B10
        D0=D0+  5                                * 03B13
        PC=(A)                                   * 03B16
L_03B1A:
        LC(5)   TRUE                             * 03B1A
        DAT1=C  A                                * 03B21
        A=DAT0  A                                * 03B24
        D0=D0+  5                                * 03B27
        PC=(A)                                   * 03B2A

* ob1 ob2 -> flag
* refs (87): 0B6FB 0CB61 0F3F3 0F715 1010F 14884 ...
EQ:
        CON(5)  (*)+5                            * 03B2E  primitive code object
        A=DAT1  A                                * 03B33
        D1=D1+  5                                * 03B36
        D=D+1   A                                * 03B39
        C=DAT1  A                                * 03B3B
        ?C=A    A                                * 03B3E
        GOYES   L_03B1A                          * 03B41
        GONC    L_03B06                          * 03B43

* flag1 flag2 -> flag
* refs (99): 04908 16D5E 176BC 17BBD 19B3A 19BEB ...
AND:
        CON(5)  (*)+5                            * 03B46  primitive code object
        A=DAT1  A                                * 03B4B
        D1=D1+  5                                * 03B4E
        D=D+1   A                                * 03B51
        R0=A                                     * 03B53
        A=DAT1  A                                * 03B56
        LC(5)   FALSE                            * 03B59
        ?C=A    A                                * 03B60
        GOYES   L_03B68                          * 03B63
L_03B65:
        A=R0                                     * 03B65
L_03B68:
        DAT1=A  A                                * 03B68
        A=DAT0  A                                * 03B6B
        D0=D0+  5                                * 03B6E
        PC=(A)                                   * 03B71

* flag1 flag2 -> flag
* refs (88): 09438 16D59 16F61 19C65 1A797 1E877 ...
OR:
        CON(5)  (*)+5                            * 03B75  primitive code object
        A=DAT1  A                                * 03B7A
        D1=D1+  5                                * 03B7D
        D=D+1   A                                * 03B80
        R0=A                                     * 03B82
        A=DAT1  A                                * 03B85
        LC(5)   TRUE                             * 03B88
        ?C=A    A                                * 03B8F
        GOYES   L_03B68                          * 03B92
        GONC    L_03B65                          * 03B94

* ob1 ob2 -> flag
* refs (179): 0986D 0BC51 0C7D5 0FC05 0FC32 103BF ...
EQUAL:
        CON(5)  (*)+5                            * 03B97  primitive code object
        A=DAT1  A                                * 03B9C
        D1=D1+  5                                * 03B9F
        D=D+1   A                                * 03BA2
        C=A     A                                * 03BA4
        A=DAT1  A                                * 03BA6
        AD1EX                                    * 03BA9
        R2=A                                     * 03BAC
        A=DAT1  A                                * 03BAF
        CD0EX                                    * 03BB2
        R0=C                                     * 03BB5
        C=DAT0  A                                * 03BB8
        BCEX    A                                * 03BBB
        R1=C                                     * 03BBD
        ?A=B    A                                * 03BC0
        GOYES   L_03BEC                          * 03BC3
L_03BC5:
        P=      0                                * 03BC5
        LC(5)   FALSE                            * 03BC7
L_03BCE:
        A=R2                                     * 03BCE
        D1=A                                     * 03BD1
        A=R1                                     * 03BD4
        B=A     A                                * 03BD7
        A=R0                                     * 03BD9
        D0=A                                     * 03BDC
        DAT1=C  A                                * 03BDF
        A=DAT0  A                                * 03BE2
        D0=D0+  5                                * 03BE5
        PC=(A)                                   * 03BE8
L_03BEC:
        AD0EX                                    * 03BEC
        D0=A                                     * 03BEF
        B=A     A                                * 03BF2
        GOSBVL  SKIPOB                           * 03BF4
        A=B     A                                * 03BFB
        AD1EX                                    * 03BFD
        R3=A                                     * 03C00
        AD0EX                                    * 03C03
        A=A-B   A                                * 03C06
        B=A     A                                * 03C08
        GOSBVL  SKIPOB                           * 03C0A
        C=R3                                     * 03C11
        A=C     A                                * 03C14
        AD0EX                                    * 03C16
        C=A-C   A                                * 03C19
        ?B#C    A                                * 03C1B
        GOYES   L_03BC5                          * 03C1E
        BSR     A                                * 03C20
        P=C     0                                * 03C22
L_03C26:
        B=B-1   A                                * 03C26
        GOC     L_03C41                          * 03C28
        A=DAT0  W                                * 03C2B
        C=DAT1  W                                * 03C2F
        D0=D0+  16                               * 03C33
        D1=D1+  16                               * 03C36
        ?C#A    W                                * 03C39
        GOYES   L_03BC5                          * 03C3C
        GONC    L_03C26                          * 03C3E
L_03C41:
        P=P-1                                    * 03C41
        GOC     L_03C57                          * 03C43
        A=DAT0  WP                               * 03C46
        C=DAT1  WP                               * 03C4A
        ?C=A    WP                               * 03C4E
        GOYES   L_03C57                          * 03C51
        GOTO    L_03BC5                          * 03C53
L_03C57:
        P=      0                                * 03C57
        LC(5)   TRUE                             * 03C59
        GOTO    L_03BCE                          * 03C60

* ob -> #prolog
* refs (10): 05229 052DF 05304 173B0 1948E 35CD6 ...
TYPE:
        CON(5)  (*)+5                            * 03C64  primitive code object
        C=DAT1  A                                * 03C69
        CD1EX                                    * 03C6C
        A=DAT1  A                                * 03C6F
        D1=C                                     * 03C72
L_03C75:
        CD0EX                                    * 03C75
        RSTK=C                                   * 03C78
        D0=(5)  L_03F85+1                        * 03C7A  table, read 10 nibbles further on
L_03C81:
        D0=D0+  10                               * 03C81
        C=DAT0  A                                * 03C84
        ?C=A    A                                * 03C87
        GOYES   L_03C91                          * 03C8A
        ?C#0    A                                * 03C8C
        GOYES   L_03C81                          * 03C8F
L_03C91:
        D0=D0-  5                                * 03C91
        C=RSTK                                   * 03C94
        CD0EX                                    * 03C96
        DAT1=C  A                                * 03C99
        A=DAT0  A                                * 03C9C
        D0=D0+  5                                * 03C9F
        PC=(A)                                   * 03CA2

* # -> flag
* refs (71): 098A9 24B3E 27AD5 27B16 27BAC 27CD8 ...
#0=:
        CON(5)  (*)+5                            * 03CA6  primitive code object
        C=DAT1  A                                * 03CAB
        CD1EX                                    * 03CAE
        D1=D1+  5                                * 03CB1
        A=DAT1  A                                * 03CB4
        D1=C                                     * 03CB7
        ?A=0    A                                * 03CBA
        GOYES   L_03CC3                          * 03CBD
        GOTO    L_03B06                          * 03CBF
L_03CC3:
        GOTO    L_03B1A                          * 03CC3

* # -> flag
* refs (75): 14332 1434B 14364 1876F 19EA8 1F3A9 ...
#0<>:
        CON(5)  (*)+5                            * 03CC7  primitive code object
        C=DAT1  A                                * 03CCC
        CD1EX                                    * 03CCF
        D1=D1+  5                                * 03CD2
        A=DAT1  A                                * 03CD5
        D1=C                                     * 03CD8
        ?A#0    A                                * 03CDB
        GOYES   L_03CC3                          * 03CDE
        GOTO    L_03B06                          * 03CE0

* # #' -> flag
* refs (101): 0B085 0E55C 178CE 214CC 21541 279BD ...
#<:
        CON(5)  (*)+5                            * 03CE4  primitive code object
        A=DAT1  A                                * 03CE9
        AD1EX                                    * 03CEC
        D1=D1+  5                                * 03CEF
        C=DAT1  A                                * 03CF2
        D1=A                                     * 03CF5
        D1=D1+  5                                * 03CF8
        D=D+1   A                                * 03CFB
        RSTK=C                                   * 03CFD
        C=DAT1  A                                * 03CFF
        CD1EX                                    * 03D02
        D1=D1+  5                                * 03D05
        A=DAT1  A                                * 03D08
        D1=C                                     * 03D0B
        C=RSTK                                   * 03D0E
        ?C>A    A                                * 03D10
        GOYES   L_03CC3                          * 03D13
        GOTO    L_03B06                          * 03D15

* # #' -> flag
* refs (172): 143FC 1466D 14690 19FEE 1A774 1A783 ...
#=:
        CON(5)  (*)+5                            * 03D19  primitive code object
        A=DAT1  A                                * 03D1E
        AD1EX                                    * 03D21
        D1=D1+  5                                * 03D24
        C=DAT1  A                                * 03D27
        D1=A                                     * 03D2A
        D1=D1+  5                                * 03D2D
        D=D+1   A                                * 03D30
        RSTK=C                                   * 03D32
        C=DAT1  A                                * 03D34
        CD1EX                                    * 03D37
        D1=D1+  5                                * 03D3A
        A=DAT1  A                                * 03D3D
        D1=C                                     * 03D40
        C=RSTK                                   * 03D43
        ?C=A    A                                * 03D45
        GOYES   L_03DB8                          * 03D48
        GOTO    L_03B06                          * 03D4A

* # #' -> flag
* refs (40): 0CA26 21D17 27B7A 28625 2C3BA 2EACE ...
#<>:
        CON(5)  (*)+5                            * 03D4E  primitive code object
        A=DAT1  A                                * 03D53
        AD1EX                                    * 03D56
        D1=D1+  5                                * 03D59
        C=DAT1  A                                * 03D5C
        D1=A                                     * 03D5F
        D1=D1+  5                                * 03D62
        D=D+1   A                                * 03D65
        RSTK=C                                   * 03D67
        C=DAT1  A                                * 03D69
        CD1EX                                    * 03D6C
        D1=D1+  5                                * 03D6F
        A=DAT1  A                                * 03D72
        D1=C                                     * 03D75
        C=RSTK                                   * 03D78
        ?C#A    A                                * 03D7A
        GOYES   L_03DB8                          * 03D7D
        GOTO    L_03B06                          * 03D7F

* # #' -> flag
* refs (141): 0E575 0E74C 0EBBC 1038D 1277F 15F65 ...
#>:
        CON(5)  (*)+5                            * 03D83  primitive code object
        A=DAT1  A                                * 03D88
        AD1EX                                    * 03D8B
        D1=D1+  5                                * 03D8E
        C=DAT1  A                                * 03D91
        D1=A                                     * 03D94
        D1=D1+  5                                * 03D97
        D=D+1   A                                * 03D9A
        RSTK=C                                   * 03D9C
        C=DAT1  A                                * 03D9E
        CD1EX                                    * 03DA1
        D1=D1+  5                                * 03DA4
        A=DAT1  A                                * 03DA7
        D1=C                                     * 03DAA
        C=RSTK                                   * 03DAD
        ?C<A    A                                * 03DAF
        GOYES   L_03DB8                          * 03DB2
        GOTO    L_03B06                          * 03DB4
L_03DB8:
        GOTO    L_03B1A                          * 03DB8

* # #' -> #+#'
* refs (305): 05247 09066 09070 0B615 0B63D 0B683 ...
#+:
        CON(5)  (*)+5                            * 03DBC  primitive code object
        GOSUB   POP2#                            * 03DC1
        A=A+C   A                                * 03DC5

* <REF>SAVPTR , R0=A, <REF>PUSH# , Loop
* refs (9): 03DEB 03E0A 03E29 03E4A 03E6B 03E8A ...
Push#Loop:
        GOSUBL  SAVPTR                           * 03DC7
        R0=A                                     * 03DCD
L_03DD0:
        GOSUBL  PUSH#                            * 03DD0
        A=DAT0  A                                * 03DD6
        D0=D0+  5                                * 03DD9
        PC=(A)                                   * 03DDC

* # #' -> #-#'
* refs (202): 0B624 0C4F2 0E4B7 1DC1E 1DC3C 218F0 ...
#-:
        CON(5)  (*)+5                            * 03DE0  primitive code object
        GOSUB   POP2#                            * 03DE5
        A=A-C   A                                * 03DE9
        GOTO    Push#Loop                        * 03DEB

* # -> #+1
* refs (469): 052D5 0E4CA 10252 10973 127D9 12801 ...
#1+:
        CON(5)  (*)+5                            * 03DEF  primitive code object
        C=DAT1  A                                * 03DF4
        CD1EX                                    * 03DF7
        D1=D1+  5                                * 03DFA
        A=DAT1  A                                * 03DFD
        D1=C                                     * 03E00
        D1=D1+  5                                * 03E03
        D=D+1   A                                * 03E06
        A=A+1   A                                * 03E08
        GOTO    Push#Loop                        * 03E0A

* # -> #-1
* refs (305): 09836 0E501 10270 105C2 105CC 105F9 ...
#1-:
        CON(5)  (*)+5                            * 03E0E  primitive code object
        C=DAT1  A                                * 03E13
        CD1EX                                    * 03E16
        D1=D1+  5                                * 03E19
        A=DAT1  A                                * 03E1C
        D1=C                                     * 03E1F
        D1=D1+  5                                * 03E22
        D=D+1   A                                * 03E25
        A=A-1   A                                * 03E27
        GOTO    Push#Loop                        * 03E29

* # -> #+2
* refs (82): 0E4A9 100F1 101DF 106F8 10856 10A3B ...
#2+:
        CON(5)  (*)+5                            * 03E2D  primitive code object
        C=DAT1  A                                * 03E32
        CD1EX                                    * 03E35
        D1=D1+  5                                * 03E38
        A=DAT1  A                                * 03E3B
        D1=C                                     * 03E3E
        D1=D1+  5                                * 03E41
        D=D+1   A                                * 03E44
        A=A+1   A                                * 03E46
        A=A+1   A                                * 03E48
        GOTO    Push#Loop                        * 03E4A

* # -> #-2
* refs (64): 100C9 101F8 1072F 10AB8 17905 1F8E8 ...
#2-:
        CON(5)  (*)+5                            * 03E4E  primitive code object
        C=DAT1  A                                * 03E53
        CD1EX                                    * 03E56
        D1=D1+  5                                * 03E59
        A=DAT1  A                                * 03E5C
        D1=C                                     * 03E5F
        D1=D1+  5                                * 03E62
        D=D+1   A                                * 03E65
        A=A-1   A                                * 03E67
        A=A-1   A                                * 03E69
        GOTO    Push#Loop                        * 03E6B

* # -> #*2
* refs (26): 15E97 1A288 23004 234DA 35E68 36A07 ...
#2*:
        CON(5)  (*)+5                            * 03E6F  primitive code object
        C=DAT1  A                                * 03E74
        CD1EX                                    * 03E77
        D1=D1+  5                                * 03E7A
        A=DAT1  A                                * 03E7D
        D1=C                                     * 03E80
        D1=D1+  5                                * 03E83
        D=D+1   A                                * 03E86
        A=A+A   A                                * 03E88
        GOTO    Push#Loop                        * 03E8A

* # -> #/2
* refs (32): 1F489 44D3B 4AB85 4AC43 4AC4D 4AF54 ...
#2/:
        CON(5)  (*)+5                            * 03E8E  primitive code object
        C=DAT1  A                                * 03E93
        CD1EX                                    * 03E96
        D1=D1+  5                                * 03E99
        A=0     M                                * 03E9C
        A=DAT1  A                                * 03E9F
        D1=C                                     * 03EA2
        D1=D1+  5                                * 03EA5
        D=D+1   A                                * 03EA8
        ASRB                                     * 03EAA
        GOTO    Push#Loop                        * 03EAD

* # #' -> #''
* refs (26): 1432D 14346 1435F 1A896 386F6 9DF90 ...
#AND:
        CON(5)  (*)+5                            * 03EB1  primitive code object
        GOSUB   POP2#                            * 03EB6
        A=A&C   A                                * 03EBA
        GOTO    Push#Loop                        * 03EBE

* # #' -> #*#'
* refs (116): 17112 19A48 1DA66 298BE 2F1F8 36543 ...
#*:
        CON(5)  (*)+5                            * 03EC2  primitive code object
        GOSUB   POP2#                            * 03EC7
        RSTK=C                                   * 03ECB
        GOSUBL  SAVPTR                           * 03ECD
        C=RSTK                                   * 03ED3
        B=0     A                                * 03ED5
        BCEX    A                                * 03ED7
L_03ED9:
        B=B-1   P                                * 03ED9
        GOC     L_03EE5                          * 03EDC
        C=C+A   A                                * 03EDF
        GOTO    L_03ED9                          * 03EE1
L_03EE5:
        ASL     A                                * 03EE5
        P=P+1                                    * 03EE7
        ?P#     5                                * 03EE9
        GOYES   L_03ED9                          * 03EEC
        R0=C                                     * 03EEE
        P=      0                                * 03EF1
        GOTO    L_03DD0                          * 03EF3

* # #' -> #r #q
* refs (56): 152B4 1DAA7 1F39F 24B13 24CCB 2D6CC ...
#/:
        CON(5)  (*)+5                            * 03EF7  primitive code object
        GOSUB   POP2#                            * 03EFC
        RSTK=C                                   * 03F00
        GOSUBL  SAVPTR                           * 03F02
        C=RSTK                                   * 03F08
        GOSUB   IntDiv                           * 03F0A

* refs (1): 31363
PushAC<>®:
        R0=A                                     * 03F0E
        R1=C                                     * 03F11

* <REF>GETPTR , Push R0 & R1 as #, Loop
* refs (4): 4E0F9 4E209 627F1 B86DE
Push2#Loop:
        GOSUBL  PUSH2#                           * 03F14
        A=DAT0  A                                * 03F1A
        D0=D0+  5                                * 03F1D
        PC=(A)                                   * 03F20

* A.A/C.A -> A.A=remainder, C.A=quotient, uses D.A P SB
* refs (3): 03F0A 32368 3A8A6
IntDiv:
        ?C=0    A                                * 03F24
        GOYES   IntDiv~1                         * 03F27
        B=C     A                                * 03F29
        C=0     A                                * 03F2B
        D=0     A                                * 03F2D
        D=D+1   A                                * 03F2F
        P=      4                                * 03F31
L_03F33:
        ?B#0    P                                * 03F33
        GOYES   L_03F3F                          * 03F36
        BSL     A                                * 03F38
        DSL     A                                * 03F3A
        GONC    L_03F33                          * 03F3C
L_03F3F:
        A=A-B   A                                * 03F3F
        GOC     L_03F4A                          * 03F41
        C=C+D   A                                * 03F44
        GOTO    L_03F3F                          * 03F46
L_03F4A:
        A=A+B   A                                * 03F4A
        BSR     A                                * 03F4C
        DSR     A                                * 03F4E
        ?D#0    A                                * 03F50
        GOYES   L_03F3F                          * 03F53
        P=      0                                * 03F55
        RTN                                      * 03F57
IntDiv~1:
        A=0     A                                * 03F59
        RTN                                      * 03F5B

* ( #1 #2 --> ) Pop #1 to A.A and #2 to C.A
* refs (39): 03DC1 03DE5 03EB6 03EC7 03EFC 12175 ...
POP2#:
        A=DAT1  A                                * 03F5D
        AD1EX                                    * 03F60
        D1=D1+  5                                * 03F63
        C=DAT1  A                                * 03F66
        D1=A                                     * 03F69
        D1=D1+  5                                * 03F6C
        D=D+1   A                                * 03F6F
        RSTK=C                                   * 03F71
        C=DAT1  A                                * 03F73
        CD1EX                                    * 03F76
        D1=D1+  5                                * 03F79
        A=DAT1  A                                * 03F7C
        D1=C                                     * 03F7F
        D1=D1+  5                                * 03F82
L_03F85:
        D=D+1   A                                * 03F85
        C=RSTK                                   * 03F87
        RTN                                      * 03F89
        RPL

* 10547d 2933h
* refs (6): 16982 17024 193EE 56485 56502 57B86
TYPEREAL:
        # DOREAL                                 * 03F8B  address

* 10615d 2977h
* refs (1): 17033
TYPECMP:
        # DOCMP                                  * 03F95  address

* 10868d 2A74h
* refs (2): 0545E 173E7
TYPELIST:
        # DOLIST                                 * 03F9F  address

* 10568d 2948h
* refs (2): 05B06 20FF7
TYPEIDNT:
        # DOIDNT                                 * 03FA9  address

* 11677d 2D9Dh
* refs (3): 0544A 173D8 8D250
TYPECOL:
        # DOCOL                                  * 03FB3  address

* 10936d 2AB8h
* refs (1): 05472
TYPESYMB:
        # DOSYMB                                 * 03FBD  address

* 10902d 2A96h
* refs (1): 173F6
TYPERRP:
        # DORRP                                  * 03FC7  address

* 11885d 2E6Dh
* refs (1): 05AF2
TYPELAM:
        # DOLAM                                  * 03FD1  address

* 10581d 2955h
* refs (6): 3799B 37A18 37A59 90116 901D2 90406
TYPEEREL:
        # DOEREL                                 * 03FDB  address

* 10970d 2ADAh
* refs (1): 05486
TYPEEXT:
        # DOEXT                                  * 03FE5  address

* 0d 0h
* refs (565): 03659 065BE 08E1F 0B665 0CA21 0FA17 ...
BINT0:
        # 0                                      * 03FEF  0

* 1d 1h
* refs (972): 0D2C6 0EAC3 0F963 100AB 10590 1065D ...
BINT1:
        # 1                                      * 03FF9  1
