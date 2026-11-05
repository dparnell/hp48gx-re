* HP 48GX ROM revision R, #78002-#7A2B2: Numerics at 15 digits: the UTPC/UTPF/UTPT and UTPN series, the 21-nibble temporaries in IRAMBUFF, then the core transcendental routines in machine code: FP, MOD, factorial, COMB, PERM, LN, EXP, y^x, SIN, COS, TAN, their inverses and the hyperbolics; at the end hex-to-BCD conversion and the copying of font glyphs for the display
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: RCLtmp1%% RCLCDtmp0%% RCLtmp0%% RCLCDtmp2%% STOtmp0%% RCLtmp2%% STOtmp2%% RCLCDtmp3%% RCAB0Long STOtmp6%% STOtmp4%% RCLCDtmp4%%
* Follows on from the previous file (at #78002 in the original ROM).
* Tail of the continued fraction of Utpn
        GOSUB   SUB_787E2.L1                     * 78002
        GOSUB   RCCD0~jump_3                     * 78006
        GOSUB   SUB_7875C.L1                     * 7800A
        GOSUB   STAB0~jump_3                     * 7800E
        GOSUB   SUB_786C7                        * 78012
        GOSUB   RCLtmp6%%                        * 78016
        GOSUB   SUB_78772                        * 7801A
        GOSUBL  EXAB2~jump                       * 7801E
        GOSUB   STOtmp6%%                        * 78024
        GOSUB   RCLCDtmp0%%                      * 78028
        GOSUB   SUB_787E2.L1                     * 7802C
        GOSUB   RCCD2~jump_3                     * 78030
        GOSUB   SUB_7875C.L1                     * 78034
        GOSUB   STAB2~jump_3                     * 78038
        GOTO    UtpnFrac.loop4                   * 7803C
        NIBHEX  7F15                             * 78040  ÷Q

* refs (1): 785A7
SUB_78044:
        GOLONG  RADDF~jump_3.L1                  * 78044

* refs (1): 77EC0
* A/B = x -> exp(-x*x/2)/sqrt(2 pi)
NormalPDF:
        GOSUB   Sq15                             * 7804A
        GOSUB   ExpNegHalf                       * 7804E
        P=      0                                * 78052
        LC(16)  #0398942280401432                * 78054
        GOTO    Mul2/Pi.L1                       * 78066

* refs (3): 77F0C 7804A 78947
* A/B -> A/B * A/B
Sq15:
        C=B     W                                * 7806A
        D=C     W                                * 7806D
        C=A     W                                * 78070
        GOTO    SUB_78772.L1                     * 78073

* refs (2): 2C1A9 782A4
* UTPT: upper tail of Student's t: x and degrees of freedom in the temporaries
UtptCore:
        ST=1    1                                * 78077
        GOSUB   UtpAbsX                          * 7807A
        GOSUBL  SUB_7897B                        * 7807E
        GOSUB   STAB2~jump_3                     * 78084
        GOSUB   LoadC1                           * 78088
        GOSUB   C>R0R1                           * 7808C
        A=R4                                     * 78090
        GOSUB   LoadC.5                          * 78093
        C=0     A                                * 78097
        GOSUBL  C>A?                             * 78099
        GOC     UtptCore.L4                      * 7809F
        A=0     A                                * 780A2
        D1=A                                     * 780A4
UtptCore.loop1:
        GOSUB   SUB_7878C                        * 780A7
        C=C-1   A                                * 780AB
        GOSUB   SUB_787B7                        * 780AD
        GOSUB   SUB_786ED                        * 780B1
        GOSUB   SUB_786C7                        * 780B5
        GOSUB   SUB_787BF                        * 780B9
        GOSUB   SUB_787C7                        * 780BD
        GOSUB   SUB_786ED                        * 780C1
        GOSUB   STAB2~jump_3                     * 780C5
        GOSUB   SUB_78820                        * 780C9
        GOSUB   SUB_786C7                        * 780CD
        GOSUB   SUB_7857E                        * 780D1
        GOSUB   SUB_78717                        * 780D5
        GONC    UtptCore.loop1                   * 780D9
        GOSUB   SUB_78820                        * 780DC
        GOSUB   SUB_78865                        * 780E0
        GOSUB   SUB_78838                        * 780E4
        CD1EX                                    * 780E8
        ?C=0    A                                * 780EB
        GOYES   UtptCore.L2                      * 780EE
        GOSUB   SUB_787DA                        * 780F0
        GOSUB   Mul2/Pi                          * 780F4
        GOTO    UtptCore.L3                      * 780F8
UtptCore.L2:
        GOSUB   RCAB0Long                        * 780FC
UtptCore.L3:
        GOSUB   DIV2~jump~jump                   * 78100
        GOTO    UtpnFrac.L1                      * 78104
UtptCore.L4:
        GOSUBL  SUB_78943                        * 78108
        GOSUB   SQRF~jump                        * 7810E
        GOSUB   SUB_7874D                        * 78112
        GOSUB   SUB_7887F                        * 78116
        C=C-1   A                                * 7811A
        ?C#0    A                                * 7811C
        GOYES   UtptCore.L5                      * 7811F
        GOSUB   C>R0R1                           * 78121
UtptCore.L5:
        GOSUB   SUB_78838                        * 78125
        CD1EX                                    * 78129
        ?C=0    A                                * 7812C
        GOYES   UtptCore.L6                      * 7812F
        GOSUBL  EXAB2~jump.L1                    * 78131
        ST=1    9                                * 78137
        ST=0    4                                * 7813A
        GOSUBL  ATAN15                           * 7813D
        GOSUB   SUB_787C7                        * 78143
        GOSUB   SUB_78405                        * 78147
        GOSUB   Mul2/Pi                          * 7814B
        GOTO    UtptCore.L7                      * 7814F
UtptCore.L6:
        GOSUB   SUB_787DA                        * 78153
UtptCore.L7:
        ?ST=1   0                                * 78157
        GOYES   UtptCore.L8                      * 7815A
        A=-A-1  S                                * 7815C
UtptCore.L8:
        GOSUB   RADD1~jump                       * 7815F

* refs (1): 78100
DIV2~jump~jump:
        GOTO    DIV2~jump                        * 78163

* refs (1): 2C14E
* UTPC: upper tail of the chi-square distribution: degrees of freedom and x in the temporaries
UtpcCore:
        GOSUB   SUB_78411                        * 78167
        GOSUB   SUB_78797                        * 7816B
        GOSUB   Utpn                             * 7816F
        GOSUBL  SUB_78A18                        * 78173
        GOSUB   STAB0~jump_3                     * 78179
        GOSUB   RCLCDtmp7%%                      * 7817D
        GOSUB   STOtmp7%%                        * 78181
        GOSUB   XYEX~jump_2                      * 78185
        GOSUB   STOtmp0%%                        * 78189
        GOSUB   SUB_78829                        * 7818D
        GONC    UtpcCore.L2                      * 78191
UtpcCore.loop1:
        GOTO    RCAB0Long                        * 78194
UtpcCore.L2:
        GOSUB   UtpAbsX                          * 78198
        A=C     W                                * 7819C
        GOSUB   Zero>R0R1                        * 7819F
        GOSUB   LoadC1                           * 781A3
        LC(1)   #4                               * 781A7
        GOSUB   C>A?                             * 781AA
        GONC    UtpcCore.loop1                   * 781AE
        GOSUB   LoadC2                           * 781B1
        GOSUB   SUB_788A7                        * 781B5
        GONC    UtpcCore.L5                      * 781B9
        GOSUB   SUB_78809                        * 781BC
        C=0     A                                * 781C0
        GOC     UtpcCore.L3                      * 781C2
        C=C+1   A                                * 781C5
UtpcCore.L3:
        D1=C                                     * 781C7
        GOSUB   SUB_7873C                        * 781CA
        GOSUB   SUB_7874D                        * 781CE
UtpcCore.loop4:
        GOSUB   SUB_7878C                        * 781D2
        GOSUB   SUB_78820                        * 781D6
        CAEX    W                                * 781DA
        GOSUB   SUB_78453                        * 781DD
        ?C<=A   A                                * 781E1
        GOYES   UtpcCore.L8                      * 781E4
        GOSUB   SUB_7824E                        * 781E6
        GOTO    UtpcCore.loop4                   * 781EA
UtpcCore.L5:
        GOSUB   SUB_7887F                        * 781EE
        GOSUB   SUB_783AA                        * 781F2
UtpcCore.loop6:
        GOSUB   SUB_784F1                        * 781F6
        A=0     A                                * 781FA
        A=A+1   A                                * 781FC
        ?C<=A   A                                * 781FE
        GOYES   UtpcCore.L7                      * 78201
        GOSUB   RCAB0Long                        * 78203
        GOSUB   SUB_783AA                        * 78207
        GOSUB   STAB2~jump_3                     * 7820B
        GOSUB   SUB_7824E                        * 7820F
        GOTO    UtpcCore.loop6                   * 78213
UtpcCore.L7:
        GOSUB   RCAB0Long                        * 78217
        GOSUB   STAB2~jump_3                     * 7821B
        GOSUB   SUB_7873C                        * 7821F
        GOSUB   SUB_786ED                        * 78223
        GOSUB   STAB0~jump_3                     * 78227
UtpcCore.L8:
        GOSUB   SUB_78809                        * 7822B
        GOSUB   RCAB0Long                        * 7822F
        RTNC                                     * 78233
        GOSUB   RCLtmp0%%~jump                   * 78236
        GOSUB   Mul2/Pi                          * 7823A
        GOSUB   SUB_787DE                        * 7823E

* refs (2): 78305 78329
SUB_78242:
        GOSUB   RCLCDtmp7%%                      * 78242
        GOTO    SUB_7875C.L1                     * 78246

* refs (1): 77E97
SPLITA~jump~jump:
        GOTO    SPLITA~jump_2                    * 7824A

* refs (2): 781E6 7820F
SUB_7824E:
        GOSUB   RCLtmp0%%~jump                   * 7824E
        GOSUB   SUB_786C7                        * 78252
        GOSUB   SUB_786E9                        * 78256
        GOSUB   STAB2~jump_3                     * 7825A
        GOSUB   SUB_7875C                        * 7825E
        GOTO    STAB0~jump_3                     * 78262

* refs (1): 7880D
SUB_78266:
        GOSUB   SPLITA~jump_2                    * 78266

* refs (2): 78163 78740
DIV2~jump:
        GOVLNG  DIV2                             * 7826A
DIV2~jump.L1:
        GOSUB   SUB_78396                        * 78271
        GOSUB   SUB_784FD                        * 78275
        GOTO    SUB_78340.L1                     * 78279

* refs (1): 2C179
* UTPF: upper tail of the F distribution: both degrees of freedom and x in the temporaries
UtpfCore:
        GOSUB   RCLtmp2%%                        * 7827D
        GOSUBL  UtpDegFree                       * 78281
        GOSUB   STOtmp2%%                        * 78287
        A=B     M                                * 7828B
        R1=A                                     * 7828E
        GOSUB   SUB_78411                        * 78291
        GOSUB   SUB_78829                        * 78295
        GONC    UtpfCore.L1                      * 78299
        GOSUB   SUB_78955                        * 7829C
        GOSUB   SUB_78797                        * 782A0
        GOSUB   UtptCore                         * 782A4
        ST=0    1                                * 782A8
        GOSUB   SUB_786F5                        * 782AB
        GOSUB   SUB_78955                        * 782AF
        GOTO    EXAB2~jump.L1                    * 782B3
UtpfCore.L1:
        ST=0    1                                * 782B7
        GOSUB   SUB_7880D                        * 782BA
        GOC     DIV2~jump.L1                     * 782BE
        A=R1                                     * 782C1
        GOSUB   SUB_7880D                        * 782C4
        GOC     UtpfCore.L4                      * 782C8
        GOSUB   SUB_788E4                        * 782CB
        GOC     UtpfCore.L2                      * 782CF
        GOTO    LoadCD1.L1                       * 782D2
UtpfCore.L2:
        GOSUB   SUB_7888E                        * 782D6
        ST=1    9                                * 782DA
        ST=0    4                                * 782DD
        GOSUBL  ATAN15                           * 782E0
        GOSUB   STOtmp7%%                        * 782E6
        GOSUB   SUB_784E2                        * 782EA
        GOSUB   SUB_7882D                        * 782EE
        GONC    UtpfCore.L3                      * 782F2
        GOSUB   Zero>R0R1                        * 782F5
UtpfCore.L3:
        GOSUB   SUB_78838                        * 782F9
        GOSUB   SUB_7888E                        * 782FD
        GOSUB   SUB_784A2                        * 78301
        GOSUB   SUB_78242                        * 78305
        GOSUB   Mul2/Pi                          * 78309
        GOSUB   SUB_78340.L4                     * 7830D
        GOSUB   STOtmp7%%                        * 78311
        GOSUB   SUB_78396                        * 78315
        GOSUB   RCLtmp2%%                        * 78319
        GOSUB   SUB_787E2                        * 7831D
        GOSUB   STAB0~jump_3                     * 78321
        GOSUB   LoadCD1.L3                       * 78325
        GOTO    SUB_78242                        * 78329
UtpfCore.L4:
        GOSUB   SUB_788E4                        * 7832D
        GOC     SUB_78340.L3                     * 78331
        GOSUB   SUB_784B2                        * 78334
        GOSUB   SUB_7885E                        * 78338
        GOSUB   SUB_78396.loop1                  * 7833C

* refs (1): 78388
SUB_78340:
        GOSUB   SUB_7843F                        * 78340
        GOSUB   STAB2~jump_3                     * 78344
        GOSUB   RADD1~jump                       * 78348
        GOSUB   SUB_78582                        * 7834C
SUB_78340.L1:
        C=R0                                     * 78350
        R4=C                                     * 78353
        GOSUB   XYEX~jump_2                      * 78356
        GOSUB   RCLtmp1%%                        * 7835A
        ?ST=1   3                                * 7835E
        GOYES   SUB_78340.L2                     * 78361
        GOSUB   RCLtmp2%%                        * 78363
SUB_78340.L2:
        GOSUB   XYEX~jump_2                      * 78367
        GOSUBL  Pow15                            * 7836B
        GOSUB   SQRF~jump                        * 78371
        GOSUB   RCCD0~jump_3                     * 78375
        C=R4                                     * 78379
        GOTO    SUB_787E2.L1                     * 7837C
SUB_78340.L3:
        GOSUB   SUB_784E2                        * 78380
        GOSUB   SUB_78396.loop1                  * 78384
        GOSUB   SUB_78340                        * 78388
SUB_78340.L4:
        A=-A-1  S                                * 7838C

* refs (3): 7815F 78348 787CF
RADD1~jump:
        GOVLNG  RADD1                            * 7838F

* refs (2): 78271 78315
SUB_78396:
        GOSUB   SUB_78878                        * 78396
SUB_78396.loop1:
        GOSUB   SUB_787A3                        * 7839A
        GOSUB   SUB_7853C                        * 7839E
        GOSUB   SUB_783B6                        * 783A2
        GOTO    SUB_78396.loop1                  * 783A6

* refs (4): 781F2 78207 784E5 78878
SUB_783AA:
        GOSUB   LoadC1                           * 783AA
        GOSUB   C>R0R1                           * 783AE
        GOTO    SUB_7886D.L1                     * 783B2

* refs (2): 783A2 7848A
SUB_783B6:
        GOSUB   XYEX~jump_2                      * 783B6
        ?ST=1   3                                * 783BA
        GOYES   SUB_783B6.L1                     * 783BD
        GOSUB   RCLtmp2%%                        * 783BF
        GOTO    SUB_783B6.L2                     * 783C3
SUB_783B6.L1:
        GOSUB   RCLtmp1%%                        * 783C7
SUB_783B6.L2:
        GOSUB   SUB_7875C.L1                     * 783CB

* refs (1): 78856
SUB_783CF:
        GOSUB   SUB_786C7                        * 783CF
        GOSUB   SUB_787BF                        * 783D3
        GOSUB   SUB_787E2                        * 783D7
        GOSUB   STAB0~jump_3                     * 783DB
        ?ST=1   1                                * 783DF
        GOYES   SUB_783CF.L2                     * 783E2
        ?ST=1   3                                * 783E4
        GOYES   SUB_783CF.L1                     * 783E7
        GOSUB   SUB_7843F                        * 783E9
        GOSUB   SUB_787E2                        * 783ED
        GOSUB   STAB0~jump_3                     * 783F1
SUB_783CF.L1:
        GOSUB   SUB_7843F                        * 783F5
        GOTO    SUB_783CF.L3                     * 783F9
SUB_783CF.L2:
        GOSUB   SUB_78943                        * 783FD
SUB_783CF.L3:
        GOSUB   SUB_787CF                        * 78401

* refs (1): 78147
SUB_78405:
        GOSUB   SUB_787E2                        * 78405
        GOSUB   SUB_78576                        * 78409
        GOTO    STAB0~jump_3                     * 7840D

* refs (2): 78167 78291
SUB_78411:
        GOSUB   UtpAbsX                          * 78411
        GOSUB   STOtmp7%%                        * 78415
        GOSUB   RCLtmp1%%                        * 78419
        GOSUB   UtpDegFree                       * 7841D
        GOSUB   STOtmp1%%                        * 78421
        C=R4                                     * 78425
        ?C=0    M                                * 78428
        GOYES   SUB_78411.L1                     * 7842B
        ?ST=0   0                                * 7842D
        RTNYES                                   * 78430
SUB_78411.L1:
        C=RSTK                                   * 78432
        GOSUB   LoadCD1                          * 78434

* refs (8): 77FD0 78185 78356 78367 783B6 78586 ...
XYEX~jump_2:
        GOVLNG  XYEX                             * 78438

* refs (6): 78340 783E9 783F5 784FD 7888E 78903
SUB_7843F:
        GOSUB   RCLtmp1%%                        * 7843F
        GOSUB   RCLCDtmp2%%                      * 78443
        GOSUB   DIVFLong                         * 78447
        GOSUB   RCLCDtmp0%%                      * 7844B
        GOTO    SUB_787E2.L1                     * 7844F

* refs (2): 781DD 78886
SUB_78453:
        P=      0                                * 78453
        CPEX    0                                * 78455
        CSLC                                     * 78459
SUB_78453.loop1:
        CSLC                                     * 7845C
        P=P-1                                    * 7845F
        GONC    SUB_78453.loop1                  * 78461
        RTN                                      * 78464

* refs (1): 78434
* C = D = 1 (P = 14 on return)
LoadCD1:
        C=0     W                                * 78466
        P=      14                               * 78469
        LC(1)   #1                               * 7846B
        D=C     W                                * 7846E
        RTN                                      * 78471
LoadCD1.L1:
        GOSUB   SUB_784B2                        * 78473
        GOSUB   SUB_7886D                        * 78477
        GOSUB   SUB_7887C                        * 7847B
LoadCD1.loop2:
        GOSUB   SUB_784F1                        * 7847F
        GOC     LoadCD1.L3                       * 78483
        GOSUB   SUB_787B7                        * 78486
        GOSUB   SUB_783B6                        * 7848A
        GOTO    LoadCD1.loop2                    * 7848E
LoadCD1.L3:
        GOSUB   SUB_7885E                        * 78492
        GOSUB   SUB_78838                        * 78496
        GOSUB   SUB_7888E                        * 7849A
        GOSUB   Mul2/Pi                          * 7849E

* refs (1): 78301
SUB_784A2:
        GOSUB   SUB_787E2                        * 784A2
        GOSUB   STAB0~jump_3                     * 784A6
        GOSUB   SUB_784FD                        * 784AA
        GOTO    SUB_787E2                        * 784AE

* refs (2): 78334 78473
SUB_784B2:
        GOSUB   SUB_784E2                        * 784B2
SUB_784B2.loop1:
        GOSUB   RCLtmp1%%                        * 784B6
        GOSUB   SUB_786C7                        * 784BA
        GOSUB   SUB_78782                        * 784BE
        R4=C                                     * 784C2
        GOSUB   SUB_784FD                        * 784C5
        GOSUB   SUB_786ED                        * 784C9
        GOSUB   SUB_786C3                        * 784CD
        GOSUB   SUB_787BF                        * 784D1
        GOSUB   SUB_7876F                        * 784D5
        GOSUB   SUB_78713                        * 784D9
        GONC    SUB_784B2.loop1                  * 784DD
        RTN                                      * 784E0

* refs (3): 782EA 78380 784B2
SUB_784E2:
        ST=1    3                                * 784E2
        GOSUB   SUB_783AA                        * 784E5
        GOSUB   SUB_78818                        * 784E9
        GOTO    SUB_7887F.L1                     * 784ED

* refs (3): 781F6 7847F 787A3
SUB_784F1:
        CD1EX                                    * 784F1
        C=C-1   A                                * 784F4
        C=C-1   A                                * 784F6
SUB_784F1.L1:
        D1=C                                     * 784F8
        RTN                                      * 784FB

* refs (3): 78275 784AA 784C5
SUB_784FD:
        GOSUB   SUB_7843F                        * 784FD
        GOTO    SUB_787CF                        * 78501

* refs (5): 780F4 7814B 7823A 78309 7849E
* A/B *= 2/pi
Mul2/Pi:
        P=      0                                * 78505
        LC(16)  #0636619772367581                * 78507
Mul2/Pi.L1:
        D=C     W                                * 78519
        C=0     A                                * 7851C
        C=C-1   A                                * 7851E
        GOTO    SUB_78772.L1                     * 78520

* refs (5): 77F67 78093 78936 78987 789A1
* C = .5 (P = 14 on return)
LoadC.5:
        C=0     W                                * 78524
        P=      14                               * 78527
        LC(1)   #5                               * 78529
        C=C-1   X                                * 7852C
        RTN                                      * 7852F

* refs (3): 7819F 782F5 78847
* R0 = R1 = 0
Zero>R0R1:
        C=0     W                                * 78531

* refs (3): 7808C 78121 783AE
* R0 = R1 = C
C>R0R1:
        R0=C                                     * 78534
        R1=C                                     * 78537
        RTN                                      * 7853A

* refs (1): 7839E
SUB_7853C:
        GOSUB   LoadC2                           * 7853C
        C=-C-1  S                                * 78540
SUB_7853C.L1:
        GOTO    SUB_7854A.L1                     * 78543
        NIBHEX  BCC                              * 78547  Ë

* refs (1): 7857E
SUB_7854A:
        GOSUB   SPLITA~jump_2                    * 7854A
SUB_7854A.L1:
        GOSUB   SPLITC~jump_2                    * 7854E
        GOTO    SUB_7875C.L1                     * 78552

* refs (6): 7854E 78567 78772 78782 787BF 7898B
SPLITC~jump_2:
        GOVLNG  SPLITC                           * 78556
        C=R4                                     * 7855D
        A=C     W                                * 78560
        GOSUB   SPLITA~jump_2                    * 78563
        GOSUB   SPLITC~jump_2                    * 78567
        GOTO    SUB_787E2.L1                     * 7856B

* refs (7): 77EF4 77F77 780FC 78194 78203 78217 ...
* Long jump to RCAB0
RCAB0Long:
        GOVLNG  RCAB0                            * 7856F

* refs (1): 78409
SUB_78576:
        GOSUB   RCCD2~jump_3                     * 78576
        GOTO    SUB_7875C.L1                     * 7857A

* refs (1): 780D1
SUB_7857E:
        GOSUB   SUB_7854A                        * 7857E

* refs (1): 7834C
SUB_78582:
        GOSUB   RCCD2~jump_3                     * 78582
        GOSUB   XYEX~jump_2                      * 78586

* refs (4): 77F7F 78447 787C3 78951
* Long jump to DIVF
DIVFLong:
        GOVLNG  DIVF                             * 7858A

* refs (4): 77EBC 7807A 78198 78411
* tmp0 -> tmp0 = |x|, ST 0 set when x was negative
UtpAbsX:
        GOSUB   RCLtmp0%%                        * 78591
        ST=0    0                                * 78595
        ?A=0    S                                * 78598
        GOYES   UtpAbsX.L1                       * 7859B
        A=0     S                                * 7859D
        ST=1    0                                * 785A0
UtpAbsX.L1:
        GOSUB   STAB2~jump_3                     * 785A3
        GOSUB   SUB_78044                        * 785A7
        R4=C                                     * 785AB
        GOTO    STOtmp0%%                        * 785AE

* refs (10): 77F08 78591 78797 78899 78943 993C8 ...
* -> A/B = %% temporary 0. The temporaries are 21 nibbles each, from IRAMBUFF
RCLtmp0%%:
        P=      0                                * 785B2
        GOTO    RCLtmp6%%.L1                     * 785B4

* refs (12): 7835A 783C7 78419 7843F 784B6 78820 ...
* A/B = the %% in scratch slot 1 of IRAMBUFF
RCLtmp1%%:
        P=      1                                * 785B8
        GOTO    RCLtmp6%%.L1                     * 785BA

* refs (8): 7827D 78319 78363 783BF 78818 9941B ...
* -> A/B = %% temporary 2
RCLtmp2%%:
        P=      2                                * 785BE
        GOTO    RCLtmp6%%.L1                     * 785C0

* refs (1): 99406
* -> A/B = %% temporary 3
RCLtmp3%%:
        P=      3                                * 785C4
        GOTO    RCLtmp6%%.L1                     * 785C6

* refs (4): 993B3 995E2 9977F 99A45
* -> A/B = %% temporary 4
RCLtmp4%%:
        P=      4                                * 785CA
        GOTO    RCLtmp6%%.L1                     * 785CC

* refs (1): 77FEC
* -> A/B = %% temporary 5
RCLtmp5%%:
        P=      5                                * 785D0
        GOTO    RCLtmp6%%.L1                     * 785D2

* refs (1): 78016
* -> A/B = %% temporary 6
RCLtmp6%%:
        P=      6                                * 785D6
        GOTO    RCLtmp6%%.L1                     * 785D8
        P=      8                                * 785DC
        GOTO    RCLtmp6%%.L1                     * 785DE
        NIBHEX  2965002A                         * 785E2  δV.¢
RCLtmp6%%.L1:
        D0=(5)  #800E0                           * 785EA
RCLtmp6%%.loop2:
        D0=D0+  16                               * 785F1
        D0=D0+  5                                * 785F4
        P=P-1                                    * 785F7
        GONC    RCLtmp6%%.loop2                  * 785F9
        P=      0                                * 785FC
        GOVLNG  GETAB0                           * 785FE

* refs (11): 77EF8 77FFE 78028 7844B 7DA24 99640 ...
* -> C/D = %% temporary 0
RCLCDtmp0%%:
        P=      0                                * 78605
        GOTO    RCLCDtmp7%%.L1                   * 78607

* refs (5): 7894D 998A0 99B78 99B9A 99BFD
* -> C/D = %% temporary 1
RCLCDtmp1%%:
        P=      1                                * 7860B
        GOTO    RCLCDtmp7%%.L1                   * 7860D

* refs (10): 78443 78959 994D6 995F0 99683 998C7 ...
* -> C/D = %% temporary 2
RCLCDtmp2%%:
        P=      2                                * 78611
        GOTO    RCLCDtmp7%%.L1                   * 78613

* refs (7): 77FC8 7DAC5 994AC 998B5 9993B 99A12 ...
* -> C/D = %% temporary 3
RCLCDtmp3%%:
        P=      3                                * 78617
        GOTO    RCLCDtmp7%%.L1                   * 78619

* refs (6): 77FB9 99490 99977 99A9C 99D84 99E49
* -> C/D = %% temporary 4
RCLCDtmp4%%:
        P=      4                                * 7861D
        GOTO    RCLCDtmp7%%.L1                   * 7861F

* refs (4): 7DA32 994C1 99749 999F4
* -> C/D = %% temporary 5
RCLCDtmp5%%:
        P=      5                                * 78623
        GOTO    RCLCDtmp7%%.L1                   * 78625

* refs (4): 998DA 99913 99B58 99B6D
* -> C/D = %% temporary 6
RCLCDtmp6%%:
        P=      6                                * 78629
        GOTO    RCLCDtmp7%%.L1                   * 7862B

* refs (2): 7817D 78242
* -> C/D = %% temporary 7
RCLCDtmp7%%:
        P=      7                                * 7862F
        GOTO    RCLCDtmp7%%.L1                   * 78631
        P=      8                                * 78635
        GOTO    RCLCDtmp7%%.L1                   * 78637
        NIBHEX  296B002A65002B                   * 7863B  δ¶.¢V.²
RCLCDtmp7%%.L1:
        D0=(5)  #800E0                           * 78649
RCLCDtmp7%%.loop2:
        D0=D0+  16                               * 78650
        D0=D0+  5                                * 78653
        P=P-1                                    * 78656
        GONC    RCLCDtmp7%%.loop2                * 78658
        P=      0                                * 7865B
        GOVLNG  GETCD0                           * 7865D

* refs (8): 78189 785AE 7879F 993EE 995FE 997FA ...
* A/B -> %% temporary 0
STOtmp0%%:
        P=      0                                * 78664
        GOTO    STOtmp7%%.L1                     * 78666

* refs (5): 78421 78965 78983 993FF 99883
* A/B -> %% temporary 1
STOtmp1%%:
        P=      1                                * 7866A
        GOTO    STOtmp7%%.L1                     * 7866C

* refs (7): 78287 7895D 99426 994EB 99778 99AAE ...
* A/B -> %% temporary 2
STOtmp2%%:
        P=      2                                * 78670
        GOTO    STOtmp7%%.L1                     * 78672

* refs (3): 77FAD 77FCC 99414
* A/B -> %% temporary 3
STOtmp3%%:
        P=      3                                * 78676
        GOTO    STOtmp7%%.L1                     * 78678

* refs (6): 77FB1 77FD4 99433 9949E 99793 99AA3
* A/B -> %% temporary 4
STOtmp4%%:
        P=      4                                * 7867C
        GOTO    STOtmp7%%.L1                     * 7867E

* refs (3): 77F94 77FFA 994CF
* A/B -> %% temporary 5
STOtmp5%%:
        P=      5                                * 78682
        GOTO    STOtmp7%%.L1                     * 78684

* refs (6): 77FA1 78024 9988E 998E5 9992C 99B13
* A/B -> %% temporary 6
STOtmp6%%:
        P=      6                                * 78688
        GOTO    STOtmp7%%.L1                     * 7868A

* refs (4): 78181 782E6 78311 78415
* A/B -> %% temporary 7
STOtmp7%%:
        P=      7                                * 7868E
        GOTO    STOtmp7%%.L1                     * 78690
        P=      8                                * 78694
        GOTO    STOtmp7%%.L1                     * 78696
        NIBHEX  296B002A65002B                   * 7869A  δ¶.¢V.²
STOtmp7%%.L1:
        D0=(5)  #800E0                           * 786A8
STOtmp7%%.loop2:
        D0=D0+  16                               * 786AF
        D0=D0+  5                                * 786B2
        P=P-1                                    * 786B5
        GONC    STOtmp7%%.loop2                  * 786B7
        P=      0                                * 786BA

* refs (2): 77E9B 77EB6
PUTAB0~jump:
        GOVLNG  PUTAB0                           * 786BC

* refs (2): 77F22 784CD
SUB_786C3:
        GOSUB   SUB_7878C                        * 786C3

* refs (6): 78012 780B5 780CD 78252 783CF 784BA
SUB_786C7:
        CD1EX                                    * 786C7

* refs (1): 77FE8
SUB_786CA:
        D1=C                                     * 786CA

* refs (1): 787B7
* C.A = a BCD integer -> C = the same as a 15-digit number, mantissa and exponent
Bcd>15:
        P=      15                               * 786CD
        D=C     A                                * 786CF
        C=0     W                                * 786D1
        C=D     A                                * 786D4
Bcd>15.loop1:
        CSRC                                     * 786D6
        P=P+1                                    * 786D9
        ?C#0    A                                * 786DB
        GOYES   Bcd>15.loop1                     * 786DE
        CSR     W                                * 786E0
        CPEX    0                                * 786E3
        RTN                                      * 786E7

* refs (2): 77F26 78256
SUB_786E9:
        GOSUB   SUB_787BF                        * 786E9

* refs (4): 780B1 780C1 78223 784C9
SUB_786ED:
        GOSUB   RCCD2~jump_3                     * 786ED
        GOTO    SUB_787E2.L1                     * 786F1

* refs (1): 782AB
SUB_786F5:
        GOSUB   LoadC2                           * 786F5
        GOSUB   SUB_78772                        * 786F9

* refs (12): 77F2E 78038 78084 780C5 7820B 7821B ...
STAB2~jump_3:
        GOVLNG  STAB2                            * 786FD
        NIBHEX  7A817360                         * 78704  §.7.

* refs (6): 77F2A 77F7B 78030 78576 78582 786ED
RCCD2~jump_3:
        GOVLNG  RCCD2                            * 7870C

* refs (1): 784D9
SUB_78713:
        GOSUB   STAB2~jump_3                     * 78713

* refs (1): 780D5
SUB_78717:
        GOSUB   SUB_7875C                        * 78717
        GOSUB   EXAB0~jump                       * 7871B
        GOSUB   RCCD0~jump_3                     * 7871F
        ?C#A    A                                * 78723
        GOYES   SUB_78717.L2                     * 78726
        ?C#A    S                                * 78728
        GOYES   SUB_78717.L2                     * 7872B
        DCEX    M                                * 7872D
        ?B=C    M                                * 78730
        GOYES   SUB_78717.L1                     * 78733
SUB_78717.L1:
        DCEX    M                                * 78735
        RTN                                      * 78738
SUB_78717.L2:
        RTNCC                                    * 7873A

* refs (2): 781CA 7821F
* exp(-x/2) of the value in tmp0
SUB_7873C:
        GOSUB   RCLtmp0%%~jump                   * 7873C

* refs (1): 7804E
* A/B -> exp(-A/B / 2)
ExpNegHalf:
        GOSUB   DIV2~jump                        * 78740
        A=-A-1  S                                * 78744
        GOLONG  EXP15                            * 78747

* refs (3): 77F02 78112 781CE
SUB_7874D:
        GOSUB   STAB2~jump_3                     * 7874D

* refs (11): 77EC4 7800E 78179 78227 78262 78321 ...
STAB0~jump_3:
        GOVLNG  STAB0                            * 78751
        NIBHEX  7610                             * 78758  g.

* refs (2): 7825E 78717
SUB_7875C:
        GOSUB   RCCD0~jump_3                     * 7875C
SUB_7875C.L1:
        GOVLNG  RADDF                            * 78760
        NIBHEX  76EF7EED                         * 78767  gþçÞ

* refs (1): 784D5
SUB_7876F:
        C=R4                                     * 7876F

* refs (3): 77FF0 7801A 786F9
SUB_78772:
        GOSUB   SPLITC~jump_2                    * 78772
SUB_78772.L1:
        GOTO    SUB_787E2.L1                     * 78776

* refs (1): 78865
SUB_7877A:
        GOSUB   LoadC2                           * 7877A
        GOSUB   SPLITA~jump_2                    * 7877E

* refs (1): 784BE
SUB_78782:
        GOSUB   SPLITC~jump_2                    * 78782
        GOLONG  SUB_78955.L1                     * 78786

* refs (3): 780A7 781D2 786C3
SUB_7878C:
        CD1EX                                    * 7878C
        C=C+1   A                                * 7878F
        C=C+1   A                                * 78791
        GOTO    SUB_784F1.L1                     * 78793

* refs (2): 7816B 782A0
SUB_78797:
        GOSUB   RCLtmp0%%                        * 78797
        GOSUB   SQRF~jump                        * 7879B
        GOTO    STOtmp0%%                        * 7879F

* refs (2): 7839A 7884B
SUB_787A3:
        GOSUB   SUB_784F1                        * 787A3
        GOC     SUB_787A3.L1                     * 787A7
        A=0     A                                * 787AA
        A=A+1   A                                * 787AC
        ?C>A    A                                * 787AE
        GOYES   SUB_787B7                        * 787B1
SUB_787A3.L1:
        C=RSTK                                   * 787B3
        RTN                                      * 787B5

* refs (3): 780AD 78486 787AE
SUB_787B7:
        GOSUB   Bcd>15                           * 787B7
        GOTO    RCLtmp0%%~jump.L1                * 787BB

* refs (4): 780B9 783D3 784D1 786E9
SUB_787BF:
        GOSUB   SPLITC~jump_2                    * 787BF
        GOTO    DIVFLong                         * 787C3

* refs (2): 780BD 78143
SUB_787C7:
        GOSUB   STAB2~jump_3                     * 787C7

* refs (1): 787DA
SUB_787CB:
        GOSUB   SUB_78943                        * 787CB

* refs (2): 78401 78501
SUB_787CF:
        GOSUB   RADD1~jump                       * 787CF
        GOVLNG  1/X15                            * 787D3

* refs (2): 780F0 78153
SUB_787DA:
        GOSUB   SUB_787CB                        * 787DA

* refs (1): 7823E
SUB_787DE:
        GOSUB   SQRF~jump                        * 787DE

* refs (6): 7831D 783D7 783ED 78405 784A2 784AE
SUB_787E2:
        GOSUB   RCCD0~jump_3                     * 787E2
SUB_787E2.L1:
        GOVLNG  MULTF                            * 787E6

* refs (6): 77F3A 78006 78375 7871F 7875C 787E2
RCCD0~jump_3:
        GOVLNG  RCCD0                            * 787ED

* refs (5): 77F98 78088 781A3 783AA 7882D
* C = 1 (mantissa only)
LoadC1:
        C=0     W                                * 787F4
        P=      14                               * 787F7
        LC(1)   #1                               * 787F9
        P=      0                                * 787FC
        RTN                                      * 787FE

* refs (1): 788F6
* C = 3 (P = 14 on return)
LoadC3:
        GOSUB   LoadC2                           * 78800
        LC(1)   #3                               * 78804
        RTN                                      * 78807

* refs (2): 781BC 7822B
SUB_78809:
        GOSUB   SUB_78820                        * 78809

* refs (2): 782BA 782C4
SUB_7880D:
        GOSUB   SUB_78266                        * 7880D

* refs (1): 78993
CLRFRC~jump:
        GOVLNG  CLRFRC                           * 78811

* refs (3): 784E9 78861 788F2
SUB_78818:
        GOSUB   RCLtmp2%%                        * 78818
        GOTO    SUB_78820.L1                     * 7881C

* refs (6): 780C9 780DC 781D6 78809 78829 7887F
SUB_78820:
        GOSUB   RCLtmp1%%                        * 78820
SUB_78820.L1:
        A=B     M                                * 78824
        RTN                                      * 78827

* refs (2): 7818D 78295
SUB_78829:
        GOSUB   SUB_78820                        * 78829

* refs (1): 782EE
SUB_7882D:
        GOSUB   LoadC1                           * 7882D
        ?C=A    W                                * 78831
        RTNYES                                   * 78834
        RTN                                      * 78836

* refs (5): 780E4 78125 782F9 78496 7885A
SUB_78838:
        A=R0                                     * 78838
        A=A+A   A                                * 7883B
        GONC    SUB_78838.L1                     * 7883D
        P=      4                                * 78840
        ?A#0    P                                * 78842
        GOYES   SUB_78838.L1                     * 78845
        GOSUB   Zero>R0R1                        * 78847
SUB_78838.L1:
        GOSUB   SUB_787A3                        * 7884B
        GOSBVL  RSUB1                            * 7884F
        GOSUB   SUB_783CF                        * 78856
        GOTO    SUB_78838                        * 7885A

* refs (2): 78338 78492
SUB_7885E:
        ST=1    3                                * 7885E
        GOSUB   SUB_78818                        * 78861

* refs (1): 780E0
SUB_78865:
        GOSUB   SUB_7877A                        * 78865
        GOSUB   SUB_78886                        * 78869

* refs (1): 78477
SUB_7886D:
        C=0     W                                * 7886D
SUB_7886D.L1:
        R2=C                                     * 78870
        R3=C                                     * 78873
        RTN                                      * 78876

* refs (1): 78396
SUB_78878:
        GOSUB   SUB_783AA                        * 78878

* refs (1): 7847B
SUB_7887C:
        ST=0    3                                * 7887C

* refs (2): 78116 781EE
SUB_7887F:
        GOSUB   SUB_78820                        * 7887F
SUB_7887F.L1:
        C=A     W                                * 78883

* refs (1): 78869
SUB_78886:
        GOSUB   SUB_78453                        * 78886
        GOTO    SUB_784F1.L1                     * 7888A

* refs (3): 782D6 782FD 7849A
SUB_7888E:
        GOSUB   SUB_7843F                        * 7888E

* refs (5): 7810E 78371 7879B 787DE 78917
SQRF~jump:
        GOVLNG  SQRF                             * 78892

* refs (3): 78236 7824E 7873C
RCLtmp0%%~jump:
        GOTO    RCLtmp0%%                        * 78899
RCLtmp0%%~jump.L1:
        A=C     W                                * 7889D

* refs (6): 7824A 78266 7854A 78563 7877E 78A04
SPLITA~jump_2:
        GOVLNG  SPLITA                           * 788A0

* refs (2): 77EE4 781B5
SUB_788A7:
        CAEX    W                                * 788A7

* refs (4): 78099 781AA 788EB 788FC
* A, C positive: carry set when C > A; used to pick which series to run. Exponents are offset by #500 for the comparison
C>A?:
        ?A#0    S                                * 788AA
        RTNYES                                   * 788AD
        ?C#0    S                                * 788AF
        GOYES   C>A?.L2                          * 788B2
        P=      0                                * 788B4
        BCEX    A                                * 788B6
        LC(3)   #500                             * 788B8
        BCEX    A                                * 788BD
        C=C+B   X                                * 788BF
        A=A+B   X                                * 788C2
        ?C>A    X                                * 788C5
        GOYES   C>A?.L3                          * 788C8
        ?C<A    X                                * 788CA
        GOYES   C>A?.L1                          * 788CD
        ?C>A    M                                * 788CF
        GOYES   C>A?.L3                          * 788D2
C>A?.L1:
        A=A-B   X                                * 788D4
        C=C-B   X                                * 788D7
C>A?.L2:
        RTNCC                                    * 788DA
C>A?.L3:
        A=A-B   X                                * 788DC
        C=C-B   X                                * 788DF
        RTNSC                                    * 788E2

* refs (2): 782CB 7832D
SUB_788E4:
        A=R4                                     * 788E4
        GOSUB   LoadC2                           * 788E7
        GOSUB   C>A?                             * 788EB
        RTNC                                     * 788EF
        GOSUB   SUB_78818                        * 788F2
        GOSUB   LoadC3                           * 788F6
        C=C+1   A                                * 788FA
        GOSUB   C>A?                             * 788FC
        RTNNC                                    * 78900
        GOSUB   SUB_7843F                        * 78903
        C=A     A                                * 78907
        C=C+C   A                                * 78909
        RTN                                      * 7890B

* refs (6): 781B1 7853C 786F5 7877A 78800 788E7
* C = 2 (P = 14 on return)
LoadC2:
        C=0     W                                * 7890D
        P=      14                               * 78910
        LC(1)   #2                               * 78912
        RTN                                      * 78915
        GOSUB   SQRF~jump                        * 78917
        GOSUB   RADDF~jump_3.L1                  * 7891B
        R4=C                                     * 7891F
        RTNCC                                    * 78922

* refs (4): 77F10 77F16 77FF4 7871B
EXAB0~jump:
        GOVLNG  EXAB0                            * 78924

* refs (2): 77F1C 7801E
EXAB2~jump:
        GOVLNG  EXAB2                            * 7892B
        GOSUB   STAB0~jump_3                     * 78932
        GOSUB   LoadC.5                          * 78936
        P=      10                               * 7893A
EXAB2~jump.L1:
        GOVLNG  RCAB2                            * 7893C

* refs (3): 78108 783FD 787CB
SUB_78943:
        GOSUB   RCLtmp0%%                        * 78943
        GOSUBL  Sq15                             * 78947
        GOSUB   RCLCDtmp1%%                      * 7894D
        GOTO    DIVFLong                         * 78951

* refs (2): 7829C 782AF
SUB_78955:
        GOSUB   RCLtmp1%%                        * 78955
        GOSUB   RCLCDtmp2%%                      * 78959
        GOSUB   STOtmp2%%                        * 7895D
        GOSUB   XYEX~jump_2                      * 78961
        GOTO    STOtmp1%%                        * 78965
        NIBHEX  BCC                              * 78969  Ë
SUB_78955.L1:
        GOSUB   RADDF~jump_3                     * 7896C
        GOTO    RADDF~jump_3.L1                  * 78970
        NIBHEX  BCE64FF                          * 78974  Ënô

* refs (1): 7807E
SUB_7897B:
        GOSUB   RCLtmp1%%                        * 7897B
        GOSUB   UtpDegFree                       * 7897F
        GOTO    STOtmp1%%                        * 78983

* refs (3): 78281 7841D 7897F
* A/B -> A/B = floor(x + .5): error #203 (Bad Argument Value) unless 1 <= n < 500, the range of the degrees of freedom
UtpDegFree:
        GOSUB   LoadC.5                          * 78987
        GOSUB   SPLITC~jump_2                    * 7898B
        GOSUB   RADDF~jump_3                     * 7898F
        GOSUB   CLRFRC~jump                      * 78993
        ?B=0    M                                * 78997
        GOYES   UtpDegFree.L1                    * 7899A
        ?A#0    S                                * 7899C
        GOYES   UtpDegFree.L1                    * 7899F
        GOSUB   LoadC.5                          * 789A1
        C=0     A                                * 789A5
        C=C+1   A                                * 789A7
        C=C+1   A                                * 789A9
        ?C<A    A                                * 789AB
        GOYES   UtpDegFree.L1                    * 789AE
        ?C>A    A                                * 789B0
        RTNYES                                   * 789B3
        ?B<C    M                                * 789B5
        RTNYES                                   * 789B8
UtpDegFree.L1:
        P=      0                                * 789BA
        LC(5)   #00203                           * 789BC

* refs (6): 99355 995CA 9972A 99D43 99DE0 99E92
* C.A = error number: back to hex mode, GETPTR, Errjmp
ErrC15:
        A=C     A                                * 789C3
        P=      0                                * 789C5
        SETHEX                                   * 789C7
        GOSBVL  GETPTR                           * 789C9
        GOVLNG  Errjmp                           * 789D0

* refs (2): 77FBF 77FDA
TST15~jump_2:
        GOVLNG  TST15                            * 789D7
        NIBHEX  BCE                              * 789DE  Ë

* refs (2): 7896C 7898F
RADDF~jump_3:
        GOVLNG  RADDF                            * 789E1
RADDF~jump_3.L1:
        C=B     W                                * 789E8
        D=C     W                                * 789EB
        D0=A                                     * 789EE
        GOSBVL  PACKq                            * 789F1
        CD0EX                                    * 789F8
        C=A     S                                * 789FB
        GOLONG  XYEX~jump_2                      * 789FE

* refs (1): 78A11
SUB_78A04:
        GOSUB   SPLITA~jump_2                    * 78A04
        GOLONG  LN15                             * 78A08
        A=R0                                     * 78A0E
        GOSUB   SUB_78A04                        * 78A11
        A=-A-1  S                                * 78A15

* refs (1): 78173
SUB_78A18:
        GOVLNG  DIV2.L3                          * 78A18

* refs (1): 79BE8
SUB_78A1F:
        C=0     W                                * 78A1F
        C=-C-1  S                                * 78A22
        GONC    SUB_78A28.L1                     * 78A25

* refs (5): 78DCE 79151 7915B 7991E 79BDE
SUB_78A28:
        C=0     W                                * 78A28
SUB_78A28.L1:
        P=      14                               * 78A2B
        D=0     W                                * 78A2D
        D=D+1   P                                * 78A30

* refs (2): 79D0A 79D19
SUB_78A33:
        GOVLNG  RADDF.L2                         * 78A33

* refs (2): 2B674 79F78
* A/B -> fractional part
FP15:
        GOSUBL  SpecA?~jump                      * 78A3A
        GONC    FP15.L1                          * 78A40
        ?A#0    B                                * 78A43
        RTNYES                                   * 78A46
        A=0     A                                * 78A48
        B=0     W                                * 78A4A
        RTN                                      * 78A4D
FP15.L1:
        GOSBVL  FracPosChk                       * 78A4F
        P=P+1                                    * 78A56
FP15.loop2:
        P=P+1                                    * 78A58
        GOC     FP15.L3                          * 78A5A
        BSL     W                                * 78A5D
        A=A-1   A                                * 78A60
        GOTO    FP15.loop2                       * 78A62
FP15.L3:
        GOTO    SUB_78AE4                        * 78A66
aMODF~1:
        HST=0   3                                * 78A6A
        P=      14                               * 78A6D
        ?D=0    P                                * 78A6F
        RTNYES                                   * 78A72
        ?B=0    P                                * 78A74
        RTNYES                                   * 78A77
        ST=1    9                                * 78A79
        ?C=A    S                                * 78A7C
        GOYES   aMODF~1.L1                       * 78A7F
        ST=0    9                                * 78A81
aMODF~1.L1:
        R0=C                                     * 78A84
        R1=A                                     * 78A87
        BCEX    W                                * 78A8A
        A=A-B   A                                * 78A8D
        ?D<=C   W                                * 78A8F
        GOYES   aMODF~1.L2                       * 78A92
        A=A-1   A                                * 78A94
        CSL     W                                * 78A96
aMODF~1.L2:
        B=A     A                                * 78A99
        B=B+B   A                                * 78A9B
        B=C     W                                * 78A9D
        DCEX    W                                * 78AA0
        GONC    aMODF~1.loop5                    * 78AA3
        A=R1                                     * 78AA6
        ?B=0    S                                * 78AA9
        GOYES   aMODF~1.L3                       * 78AAC
        BSR     W                                * 78AAE
aMODF~1.L3:
        D=C     W                                * 78AB1
        C=R0                                     * 78AB4
        ?ST=1   9                                * 78AB7
        RTNYES                                   * 78ABA
        GOVLNG  RADDF.L1                         * 78ABC
aMODF~1.loop4:
        BSL     W                                * 78AC3
aMODF~1.loop5:
        B=B-C   W                                * 78AC6
        GONC    aMODF~1.loop5                    * 78AC9
        B=B+C   W                                * 78ACC
        A=A-1   A                                * 78ACF
        GONC    aMODF~1.loop4                    * 78AD1
        ?ST=1   9                                * 78AD4
        GOYES   aMODF~1.L6                       * 78AD7
        ?B=0    W                                * 78AD9
        GOYES   aMODF~1.L6                       * 78ADC
        B=C-B   W                                * 78ADE
aMODF~1.L6:
        A=R0                                     * 78AE1

* refs (2): 78A66 79CF8
SUB_78AE4:
        GOVLNG  SplitNormA.L2                    * 78AE4

* refs (2): 2B716 78C4B
* A/B = integer n -> n!
FACT15:
        A=0     S                                * 78AEB
        B=0     S                                * 78AEE
        C=0     A                                * 78AF1
        C=C+1   A                                * 78AF3
        C=C+1   A                                * 78AF5
        ?C>=A   A                                * 78AF7
        GOYES   FACT15.L1                        * 78AFA
        A=0     W                                * 78AFC
        A=A+1   M                                * 78AFF
        B=0     W                                * 78B02
        B=B+1   A                                * 78B05
        BSR     A                                * 78B07
        GOTO    FACT15.L11                       * 78B09
FACT15.L1:
        BSR     W                                * 78B0D
FACT15.loop2:
        A=A-1   A                                * 78B10
        GOC     FACT15.L3                        * 78B12
        BSL     W                                * 78B15
        GONC    FACT15.loop2                     * 78B18
FACT15.L3:
        SB=0                                     * 78B1B
        D=0     W                                * 78B1E
        C=0     W                                * 78B21
        P=      14                               * 78B24
        C=C+1   P                                * 78B26
        BCEX    W                                * 78B29
FACT15.loop4:
        ?B=0    S                                * 78B2C
        GOYES   FACT15.L5                        * 78B2F
        C=C+1   A                                * 78B31
        P=      0                                * 78B33
        B=B+B   P                                * 78B35
        BSR     W                                * 78B38
        GONC    FACT15.L5                        * 78B3B
        B=B+1   W                                * 78B3E
FACT15.L5:
        A=0     W                                * 78B41
        P=      13                               * 78B44
        D=D-C   P                                * 78B46
        GONC    FACT15.L7                        * 78B49
FACT15.loop6:
        A=A+B   W                                * 78B4C
        D=D+1   P                                * 78B4F
        GONC    FACT15.loop6                     * 78B52
FACT15.L7:
        P=      14                               * 78B55
        D=D-C   P                                * 78B57
        GONC    FACT15.L8                        * 78B5A
        DSL     W                                * 78B5D
        GOSUB   SUB_78BB9                        * 78B60
        GOC     FACT15.L9                        * 78B64
FACT15.L8:
        ?C=0    S                                * 78B67
        GOYES   FACT15.L10                       * 78B6A
        ASR     W                                * 78B6C
        C=C+1   A                                * 78B6F
FACT15.L9:
        D=D-C   S                                * 78B71
        GONC    FACT15.L10                       * 78B74
        GOSUB   SUB_78BB9                        * 78B77
FACT15.L10:
        ABEX    W                                * 78B7B
        P=      13                               * 78B7E
        C=C-1   P                                * 78B80
        GONC    FACT15.loop4                     * 78B83
        P=      14                               * 78B86
        C=C-1   P                                * 78B88
        GONC    FACT15.loop4                     * 78B8B
        C=C-1   S                                * 78B8E
        GONC    FACT15.loop4                     * 78B91
        B=0     W                                * 78B94
        ABEX    WP                               * 78B97
        A=C     A                                * 78B9A
        P=      0                                * 78B9C
        LC(5)   #00300                           * 78B9E
        ?C=A    A                                * 78BA5
        GOYES   FACT15.L11                       * 78BA8
        LC(3)   #234                             * 78BAA
        ?C#A    A                                * 78BAF
        RTNYES                                   * 78BB2
FACT15.L11:
        B=B-1   M                                * 78BB4
        RTNSC                                    * 78BB7

* refs (2): 78B60 78B77
SUB_78BB9:
        C=C+1   A                                * 78BB9
        P=      0                                * 78BBB
        A=A+A   P                                * 78BBD
        ASR     W                                * 78BC0
        GONC    SUB_78BB9.loop1                  * 78BC3
        A=A+1   W                                * 78BC6
SUB_78BB9.loop1:
        A=A+B   W                                * 78BC9
        D=D+1   S                                * 78BCC
        GONC    SUB_78BB9.loop1                  * 78BCF
        RTN                                      * 78BD2

* refs (1): 2B71F
* n and r in A/B and C/D -> the number of permutations (ST 9 set)
PERM15:
        ST=1    9                                * 78BD4
        GOTO    COMB15.L1                        * 78BD7

* refs (1): 2B728
* n and r in A/B and C/D -> the number of combinations
COMB15:
        ST=0    9                                * 78BDB
COMB15.L1:
        HST=0   3                                * 78BDE
        GOSBVL  STCD0                            * 78BE1
        GOSUB   ?Int15                           * 78BE8
        GOC     COMB15.L3                        * 78BEC
COMB15.loop2:
        P=      0                                * 78BEF
        LC(2)   #18                              * 78BF1
        GOTO    SUB_78DE9.L2                     * 78BF5
COMB15.L3:
        GOSUBL  EXAB0~jump_2                     * 78BF9
        GOSUB   ?Int15                           * 78BFF
        GONC    COMB15.loop2                     * 78C03
        GOSUBL  EXAB0~jump_2                     * 78C06
        GOSUBL  STAB2~jump_4                     * 78C0C
        GOSUBL  RCCD0~jump_4                     * 78C12
        P=      1                                * 78C18
        GOSUBL  TST15~jump_3                     * 78C1A
        GOC     COMB15.loop2                     * 78C20
        ?ST=0   9                                * 78C23
        GOYES   COMB15.L5                        * 78C26
        ?P=     2                                * 78C28
        GOYES   COMB15.L4                        * 78C2B
        C=-C-1  S                                * 78C2D
        GOSBVL  RADDF                            * 78C30
        GOSBVL  RSUB1                            * 78C37
        P=      14                               * 78C3E
        ?B#0    P                                * 78C40
        GOYES   COMB15.L5                        * 78C43
        GOSUBL  RCAB2~jump_2                     * 78C45
COMB15.L4:
        GOTO    FACT15                           * 78C4B
COMB15.L5:
        GOSUBL  RCAB2~jump_2                     * 78C4F
        P=      0                                * 78C55
        LC(5)   #00012                           * 78C57
        ?C<=A   A                                * 78C5E
        GOYES   COMB15.loop2                     * 78C61
        GOSUBL  RCCD0~jump_4                     * 78C63
        C=-C-1  S                                * 78C69
        GOSBVL  RADDF                            * 78C6C
        GOSUBL  RCCD0~jump_4                     * 78C73
        ?ST=1   9                                * 78C79
        GOYES   COMB15.L6                        * 78C7C
        P=      6                                * 78C7E
        GOSUBL  TST15~jump_3                     * 78C80
        GOC     COMB15.L6                        * 78C86
        GOSUBL  XYEX~jump_3                      * 78C89
COMB15.L6:
        GOSUBL  STCD0~jump                       * 78C8F
        A=B     M                                * 78C95
        R3=A                                     * 78C98
        GOSUBL  EXAB0~jump_2                     * 78C9B
        A=B     M                                * 78CA1
        R2=A                                     * 78CA4
        A=0     W                                * 78CA7
        B=0     W                                * 78CAA
        P=      14                               * 78CAD
        B=B+1   P                                * 78CAF
        R4=A                                     * 78CB2
COMB15.loop7:
        GOSUBL  STAB0~jump_4                     * 78CB5
        A=R4                                     * 78CBB
        C=R2                                     * 78CBE
        ?C#A    W                                * 78CC1
        GOYES   COMB15.L8                        * 78CC4
        GOLONG  STCD0~jump.L1                    * 78CC6
COMB15.L8:
        B=0     W                                * 78CCC
        ABEX    M                                * 78CCF
        GOSBVL  RADD1                            * 78CD2
        C=A     W                                * 78CD9
        C=B     M                                * 78CDC
        R4=C                                     * 78CDF
        C=R3                                     * 78CE2
        D=0     W                                * 78CE5
        DCEX    M                                * 78CE8
        GOSBVL  RADDF                            * 78CEB
        ?ST=1   9                                * 78CF2
        GOYES   COMB15.L9                        * 78CF5
        C=R4                                     * 78CF7
        D=0     W                                * 78CFA
        DCEX    M                                * 78CFD
        GOSBVL  DIVF                             * 78D00
COMB15.L9:
        GOSUBL  RCCD0~jump_4                     * 78D07
        GOSBVL  MULTF                            * 78D0D
        P=      3                                * 78D14
        ?A=0    P                                * 78D16
        GOYES   COMB15.loop7                     * 78D19
        RTN                                      * 78D1B

* refs (2): 78BE8 78BFF
* A/B: carry set when a non-negative integer
?Int15:
        P=      14                               * 78D1D
        ?B#0    P                                * 78D1F
        GOYES   ?Int15.L1                        * 78D22
        A=0     W                                * 78D24
        B=0     W                                * 78D27
?Int15.L1:
        ?A=0    S                                * 78D2A
        GOYES   ?Int15.L2                        * 78D2D
        RTNCC                                    * 78D2F
?Int15.L2:
        GOSBVL  FracPos                          * 78D31
        ?P=     15                               * 78D38
        RTNYES                                   * 78D3B
        ?B=0    WP                               * 78D3D
        RTNYES                                   * 78D40
        RTNCC                                    * 78D42
?Int15.L3:
        XM=0                                     * 78D44
        GOSUB   SUB_79510                        * 78D47
        GONC    XPON15                           * 78D4B
        A=0     S                                * 78D4E
        RTNCC                                    * 78D51

* refs (2): 2B686 78D4B
* A/B -> the exponent of a number, as XPON
XPON15:
        HST=0   3                                * 78D53
        B=0     S                                * 78D56
        ?B#0    W                                * 78D59
        GOYES   XPON15.L1                        * 78D5C
        A=0     S                                * 78D5E
        A=-A-1  S                                * 78D61
        P=      0                                * 78D64
        LC(2)   #03                              * 78D66
        GOSUB   XRoot15.L8                       * 78D6A
        RTNCC                                    * 78D6E
XPON15.L1:
        B=0     W                                * 78D70
        B=A     A                                * 78D73
        A=A+A   A                                * 78D75
        A=0     W                                * 78D77
        GONC    XPON15.loop2                     * 78D7A
        A=-A-1  S                                * 78D7D
        B=-B    A                                * 78D80
XPON15.loop2:
        BSRC                                     * 78D82
        A=A+1   A                                * 78D85
        ?B#0    A                                * 78D87
        GOYES   XPON15.loop2                     * 78D8A
        BSR     W                                * 78D8C
        A=A-1   A                                * 78D8F
        SB=0                                     * 78D91
        RTNCC                                    * 78D94

* refs (2): 78DE1 7913F
SUB_78D96:
        C=B     W                                * 78D96
        D=C     W                                * 78D99
        B=A     A                                * 78D9C
SUB_78D96.loop1:
        DSR     W                                * 78D9E
        ?D=0    W                                * 78DA1
        GOYES   SUB_78D96.L3                     * 78DA4
        B=B+1   A                                * 78DA6
        GONC    SUB_78D96.loop1                  * 78DA8
        P=      14                               * 78DAB
        D=D+1   P                                * 78DAD
SUB_78D96.L2:
        GOVLNG  DIVF1.L5                         * 78DB0
SUB_78D96.L3:
        B=C     W                                * 78DB7
        RTN                                      * 78DBA

* refs (4): 2B68F 79E64 7DB12 996FD
* A/B -> ln(1 + x)
LNP115:
        HST=0   3                                * 78DBC
        ST=0    10                               * 78DBF
        B=0     S                                * 78DC2
        C=A     A                                * 78DC5
        C=C+1   A                                * 78DC7
        C=C+C   A                                * 78DC9
        GOC     LNP115.L1                        * 78DCB
        GOSUB   SUB_78A28                        * 78DCE
        GOTO    LN15.L1                          * 78DD2
LNP115.L1:
        ?A=0    S                                * 78DD6
        GOYES   LNP115.L2                        * 78DD9
        ST=1    10                               * 78DDB
        GONC    LNP115.L3                        * 78DDE
LNP115.L2:
        GOSUB   SUB_78D96                        * 78DE1
LNP115.L3:
        GOTO    LN15.L5                          * 78DE5

* refs (2): 7920A 79377
SUB_78DE9:
        XM=0                                     * 78DE9
        GOSUB   SUB_79510                        * 78DEC
        GONC    LN15.L1                          * 78DF0
        ?A=0    S                                * 78DF3
        RTNYES                                   * 78DF6
SUB_78DE9.L1:
        P=      0                                * 78DF8
        LC(2)   #0D                              * 78DFA
SUB_78DE9.L2:
        GOVLNG  SQRF.L27                         * 78DFE

* refs (6): 2B698 2D04B 2D0E2 78A08 7A020 99B88
* A/B -> ln x
LN15:
        HST=0   3                                * 78E05
LN15.L1:
        ST=0    10                               * 78E08
        C=0     W                                * 78E0B
        B=0     S                                * 78E0E
        ?B#0    W                                * 78E11
        GOYES   LN15.L2                          * 78E14
        P=      0                                * 78E16
        LC(2)   #0C                              * 78E18
        A=0     S                                * 78E1C
        A=-A-1  S                                * 78E1F
        GOTO    XRoot15.L8                       * 78E22
LN15.L2:
        ?A#0    S                                * 78E26
        GOYES   SUB_78DE9.L1                     * 78E29
        C=A     A                                * 78E2B
        ?C#0    A                                * 78E2D
        GOYES   LN15.L8                          * 78E30
        P=      14                               * 78E32
        C=B     W                                * 78E34
        D=C     W                                * 78E37
        C=C-1   P                                * 78E3A
        ?C#0    W                                * 78E3D
        GOYES   LN15.loop3                       * 78E40
        SB=0                                     * 78E42
        B=0     W                                * 78E45
        GOTO    LN15.L23                         * 78E48
LN15.loop3:
        ?C#0    P                                * 78E4C
        GOYES   LN15.L4                          * 78E4F
        A=A-1   A                                * 78E51
        CSL     W                                * 78E53
        GOTO    LN15.loop3                       * 78E56
LN15.L4:
        GOSUB   SUB_78D96.L2                     * 78E5A
LN15.L5:
        P=      14                               * 78E5E
        C=0     W                                * 78E60
        R0=C                                     * 78E63
        C=A     A                                * 78E66
        A=C     W                                * 78E68
        GOTO    LN15.L7                          * 78E6B
LN15.loop6:
        ?P=     8                                * 78E6F
        GOYES   LN15.L15                         * 78E72
        P=P-1                                    * 78E74
        C=C+1   S                                * 78E76
LN15.L7:
        C=C+1   A                                * 78E79
        GONC    LN15.loop6                       * 78E7B
        GOC     LN15.loop11                      * 78E7E
LN15.L8:
        A=A+C   A                                * 78E81
        GONC    LN15.L9                          * 78E83
        C=-C-1  A                                * 78E86
        ST=1    10                               * 78E88
LN15.L9:
        P=      14                               * 78E8B
        B=-B    WP                               * 78E8D
        C=C-1   P                                * 78E90
LN15.loop10:
        C=C+1   P                                * 78E93
LN15.loop11:
        A=B     W                                * 78E96
        D=C     S                                * 78E99
        GOTO    LN15.L13                         * 78E9C
LN15.loop12:
        BSR     W                                * 78EA0
LN15.L13:
        D=D-1   S                                * 78EA3
        GONC    LN15.loop12                      * 78EA6
        B=B+A   W                                * 78EA9
        B=B-1   S                                * 78EAC
        GONC    LN15.loop10                      * 78EAF
        C=C+1   S                                * 78EB2
        B=A     W                                * 78EB5
        BSL     W                                * 78EB8
        P=P-1                                    * 78EBB
        ?P#     6                                * 78EBD
        GOYES   LN15.loop11                      * 78EC0
        A=C     W                                * 78EC2
        C=0     W                                * 78EC5
        P=      0                                * 78EC8
        LC(5)   #99992                           * 78ECA
        ?A#0    A                                * 78ED1
        GOYES   LN15.L16                         * 78ED4
        R0=A                                     * 78ED6
        CAEX    W                                * 78ED9
        ?C#0    M                                * 78EDC
        GOYES   LN15.L14                         * 78EDF
        A=A-1   A                                * 78EE1
        GOSUB   LN15.L23                         * 78EE3
        GONC    LN15.L15                         * 78EE7
LN15.L14:
        BSR     W                                * 78EEA
LN15.L15:
        GOSUB   SUB_78F86                        * 78EED
        C=A     W                                * 78EF1
        D=C     W                                * 78EF4
        A=R0                                     * 78EF7
        P=      7                                * 78EFA
        GOTO    LN15.L18                         * 78EFC
LN15.L16:
        P=      6                                * 78F00
        A=A+1   P                                * 78F02
        P=      7                                * 78F05
        D=C     W                                * 78F07
LN15.loop17:
        BSR     W                                * 78F0A
LN15.L18:
        GOSUBL  SUB_799F8                        * 78F0D
        GOSUB   SUB_78F77                        * 78F13
        ?A=0    M                                * 78F17
        GOYES   LN15.L21                         * 78F1A
        ?P#     15                               * 78F1C
        GOYES   LN15.loop17                      * 78F1F
        C=0     W                                * 78F21
        P=      0                                * 78F24
        C=B     P                                * 78F26
        B=B+C   W                                * 78F29
        BSR     W                                * 78F2C
        GOSUBL  SUB_799F6                        * 78F2F
        P=      0                                * 78F35
        ?ST=1   10                               * 78F37
        GOYES   LN15.loop19                      * 78F3A
        B=C-B   W                                * 78F3C
LN15.loop19:
        GOSUB   SUB_78F77                        * 78F3F
        ?A=0    A                                * 78F43
        GOYES   LN15.L21                         * 78F46
        BSR     W                                * 78F48
        GONC    LN15.loop19                      * 78F4B
LN15.loop20:
        BSR     W                                * 78F4E
        GOC     LN15.L22                         * 78F51
LN15.L21:
        ?B#0    S                                * 78F54
        GOYES   LN15.loop20                      * 78F57
        D=D-1   A                                * 78F59
LN15.L22:
        GOSUB   SUB_795CB                        * 78F5B
        C=D     W                                * 78F5F
        A=C     W                                * 78F62
        ?ST=0   10                               * 78F65
        GOYES   LN15.L23                         * 78F68
        A=-A-1  S                                * 78F6A
LN15.L23:
        GOVLNG  MULTF.L5                         * 78F6D
LN15.L24:
        B=B+C   W                                * 78F74

* refs (2): 78F13 78F3F
SUB_78F77:
        A=A-1   P                                * 78F77
        GONC    LN15.L24                         * 78F7A
        A=0     P                                * 78F7D
        D=D+1   A                                * 78F80
        P=P+1                                    * 78F82
        RTN                                      * 78F84

* refs (2): 78EED 790B2
SUB_78F86:
        C=B     W                                * 78F86
        D=C     W                                * 78F89
        B=A     A                                * 78F8C
        D=D+D   W                                * 78F8E
        D=D+D   W                                * 78F91
        D=D+C   W                                * 78F94
SUB_78F86.loop1:
        DSR     W                                * 78F97
        ?D=0    W                                * 78F9A
        GOYES   SUB_78F86.L2                     * 78F9D
        B=B+1   A                                * 78F9F
        GONC    SUB_78F86.loop1                  * 78FA1
        D=-D    W                                * 78FA4
        D=0     S                                * 78FA7
        A=A+1   A                                * 78FAA
        GOTO    SUB_78D96.L2                     * 78FAC
SUB_78F86.L2:
        B=C     W                                * 78FB0
        RTN                                      * 78FB3
SUB_78F86.L3:
        GOSUB   SUB_79510                        * 78FB5
        GONC    EXPM115.L2                       * 78FB9
        ?A=0    S                                * 78FBC
        GOYES   SUB_78F86.L4                     * 78FBF
        A=0     W                                * 78FC1
        B=0     W                                * 78FC4
SUB_78F86.L4:
        GOTO    EXPM115.L22                      * 78FC7

* refs (2): 2B6AA 78747
* A/B -> e^x. The constants after this routine are ln 2, ln 1.1, ln 1.01, ... and ln 10
EXP15:
        HST=0   3                                * 78FCB
        ST=0    11                               * 78FCE
        GOTO    EXPM115.L2                       * 78FD1

* refs (3): 2B6B3 79DAF 7DB29
* A/B -> e^x - 1
EXPM115:
        HST=0   3                                * 78FD5
        ST=1    11                               * 78FD8
EXPM115.L1:
        XM=0                                     * 78FDB
EXPM115.L2:
        C=0     W                                * 78FDE
        R0=C                                     * 78FE1
        ST=1    10                               * 78FE4
        ?A#0    S                                * 78FE7
        GOYES   EXPM115.L3                       * 78FEA
        ST=0    10                               * 78FEC
EXPM115.L3:
        A=0     S                                * 78FEF
        D=0     W                                * 78FF2
EXPM115.loop4:
        C=A     A                                * 78FF5
        C=0     S                                * 78FF7
        C=C+C   A                                * 78FFA
        GONC    EXPM115.L8                       * 78FFC
        C=A     A                                * 78FFF
        ?B=0    S                                * 79001
        GOYES   EXPM115.L5                       * 79004
        A=A+1   A                                * 79006
        BSR     W                                * 79008
        GOTO    EXPM115.loop4                    * 7900B
EXPM115.L5:
        P=      15                               * 7900F
EXPM115.loop6:
        P=P-1                                    * 79011
        ?P=     6                                * 79013
        GOYES   EXPM115.L7                       * 79016
        C=C+1   A                                * 79018
        GONC    EXPM115.loop6                    * 7901A
        GOTO    EXPM115.L14                      * 7901D
EXPM115.L7:
        GOTO    EXPM115.L15                      * 79021
EXPM115.L8:
        AR0EX                                    * 79025
        ABEX    W                                * 79028
        C=0     W                                * 7902B
        P=      12                               * 7902E
        LC(4)   #5684                            * 79030
        D=C     W                                * 79036
        GOSUBL  SUB_799F6                        * 79039
        C=C-1   A                                * 7903F
        BCEX    W                                * 79041
        C=0     A                                * 79044
        P=      5                                * 79046
        C=C-1   A                                * 79048
EXPM115.loop9:
        C=C+1   A                                * 7904A
EXPM115.loop10:
        GOSUBL  SUB_79A1F                        * 7904C
        GONC    EXPM115.loop9                    * 79052
        GOSUBL  SUB_79A88                        * 79055
        AR0EX                                    * 7905B
        A=A-1   A                                * 7905E
        AR0EX                                    * 79060
        GOC     EXPM115.L11                      * 79063
        ?C=0    P                                * 79066
        GOYES   EXPM115.loop10                   * 79069
        GOTO    SUB_79226.loop2                  * 7906B
EXPM115.L11:
        CSR     WP                               * 7906F
        B=A     W                                * 79072
        A=R0                                     * 79075
        D=0     W                                * 79078
        D=C     A                                * 7907B
        GOSUB   SUB_79226                        * 7907D
        GONC    EXPM115.L14                      * 79081
        RTN                                      * 79084
EXPM115.loop12:
        D=D+1   P                                * 79086
EXPM115.loop13:
        B=B-C   W                                * 79089
        GONC    EXPM115.loop12                   * 7908C
        B=B+C   W                                * 7908F
        ?P=     7                                * 79092
        GOYES   EXPM115.L15                      * 79095
        BSL     W                                * 79097
        A=A-1   A                                * 7909A
        P=P-1                                    * 7909C
EXPM115.L14:
        GOSUBL  SUB_799F8                        * 7909E
        GONC    EXPM115.loop13                   * 790A4
EXPM115.L15:
        ?ST=0   11                               * 790A7
        GOYES   EXPM115.L16                      * 790AA
        C=D     W                                * 790AC
        R0=C                                     * 790AF
        GOSUB   SUB_78F86                        * 790B2
        C=R0                                     * 790B6
        D=C     W                                * 790B9
EXPM115.L16:
        C=A     A                                * 790BC
        P=      15                               * 790BE
        LC(1)   #7                               * 790C0
        P=      6                                * 790C3
        ?D=0    A                                * 790C5
        GOYES   EXPM115.loop17                   * 790C8
        D=D+1   P                                * 790CA
EXPM115.loop17:
        ?D=0    M                                * 790CD
        GOYES   EXPM115.L24                      * 790D0
        P=P+1                                    * 790D2
EXPM115.loop18:
        ?D=0    P                                * 790D4
        GOYES   EXPM115.L21                      * 790D7
        D=D-1   P                                * 790D9
        A=B     W                                * 790DC
        D=C     S                                * 790DF
        GONC    EXPM115.L20                      * 790E2
EXPM115.loop19:
        ASR     W                                * 790E5
EXPM115.L20:
        C=C-1   S                                * 790E8
        GONC    EXPM115.loop19                   * 790EB
        B=B+A   W                                * 790EE
        B=B+1   S                                * 790F1
        C=D     S                                * 790F4
        GOTO    EXPM115.loop18                   * 790F7
EXPM115.L21:
        C=C+1   A                                * 790FB
        BSR     W                                * 790FD
        C=C-1   S                                * 79100
        GONC    EXPM115.loop17                   * 79103
        C=D     A                                * 79106
        B=B+1   P                                * 79108
        A=C     A                                * 7910B
        A=0     S                                * 7910D
        ?ST=0   10                               * 79110
        GOYES   EXPM115.L22                      * 79113
        GOSBVL  1/X15a                           * 79115
EXPM115.L22:
        ?ST=0   11                               * 7911C
        GOYES   EXPM115.L23                      * 7911F
        GOSUB   STAB0~jump_4                     * 79121
        GOSBVL  RSUB1                            * 79125
        GOSUB   EXAB0~jump_2                     * 7912C
EXPM115.L23:
        RTNCC                                    * 79130
EXPM115.L24:
        A=0     S                                * 79132
        A=C     A                                * 79135
        ?ST=0   10                               * 79137
        GOYES   EXPM115.L25                      * 7913A
        A=-A-1  S                                * 7913C
        GOSUB   SUB_78D96                        * 7913F
EXPM115.L25:
        ?ST=0   11                               * 79143
        GOYES   EXPM115.L26                      * 79146
        GOSUB   STAB0~jump_4                     * 79148
EXPM115.L26:
        ?B=0    W                                * 7914C
        GOYES   EXPM115.L27                      * 7914F
        GOSUBL  SUB_78A28                        * 79151
        GOTO    SUB_795CB                        * 79157
EXPM115.L27:
        GOSUBL  SUB_78A28                        * 7915B
        RTNCC                                    * 79161

* ln(1+10^-k) for k = 0..7, then ln 10: BCD mantissas (read by SUB_799F8.L1)
        CON(16) #0693147180559945                * 79163  entry 0
        CON(16) #0953101798043249                * 79173  entry 1
        CON(16) #0995033085316808                * 79183  entry 2
        CON(16) #0999500333083533                * 79193  entry 3
        CON(16) #0999950003333083                * 791A3  entry 4
        CON(16) #0999995000033333                * 791B3  entry 5
        CON(16) #0999999500000333                * 791C3  entry 6
        CON(16) #0999999950000003                * 791D3  entry 7
        CON(16) #0230258509299405                * 791E3  entry 8

* refs (1): 2B6A1
* A/B -> log x
LOG15:
        GOSBVL  SplitNormA                       * 791F3
        ?A#0    S                                * 791FA
        GOYES   LOG15.L1                         * 791FD
        GOSUB   SUB_795D6                        * 791FF
        GONC    LOG15.L1                         * 79203
        GOTO    ?Int15.L3                        * 79206
LOG15.L1:
        GOSUB   SUB_78DE9                        * 7920A
        ?XM=0                                    * 7920E
        GOYES   LOG15.L2                         * 79211
        RTN                                      * 79213
LOG15.L2:
        GOSUB   SUB_799F6                        * 79215
        D=0     W                                * 79219
        DCEX    W                                * 7921C
        GOVLNG  DIVFchk.L1                       * 7921F

* refs (2): 7907D 792A9
SUB_79226:
        P=      4                                * 79226
        ?D=0    P                                * 79228
        GOYES   SUB_79226.L1                     * 7922B
        D=D-1   P                                * 7922D
        ?D#0    P                                * 79230
        GOYES   SUB_79226.loop2                  * 79233
        D=D+1   P                                * 79235
SUB_79226.L1:
        P=      14                               * 79238
        RTNCC                                    * 7923A
SUB_79226.loop2:
        A=0     S                                * 7923C
        P=      0                                * 7923F
SUB_79226.L3:
        LC(5)   #19999                           * 79241
        A=C     A                                * 79248
        C=0     W                                * 7924A
        P=      14                               * 7924D
        ?ST=1   10                               * 7924F
        GOYES   SUB_79226.L4                     * 79252
        C=C-1   WP                               * 79254
        GOC     SUB_79226.L5                     * 79257
SUB_79226.L4:
        A=-A    A                                * 7925A
        C=C+1   P                                * 7925C
SUB_79226.L5:
        B=C     W                                * 7925F
        ?ST=0   11                               * 79262
        RTNYES                                   * 79265
        GOSUB   STAB0~jump_4                     * 79267
        GOSBVL  RSUB1                            * 7926B
        GOSUB   EXAB0~jump_2                     * 79272
        RTNSC                                    * 79276
SUB_79226.L6:
        GOSUB   ?Int15.L3                        * 79278
        GOSBVL  MULTFchk                         * 7927C
        ST=0    10                               * 79283
        ?A=0    S                                * 79286
        GOYES   SUB_79226.L7                     * 79289
        ST=1    10                               * 7928B
SUB_79226.L7:
        C=0     A                                * 7928E
        P=      0                                * 79290
        LC(1)   #4                               * 79292
        ?C<A    A                                * 79295
        GOYES   SUB_79226.loop2                  * 79298
        BSLC                                     * 7929A
SUB_79226.loop8:
        BSLC                                     * 7929D
        A=A-1   A                                * 792A0
        GONC    SUB_79226.loop8                  * 792A2
        C=B     A                                * 792A5
        D=C     A                                * 792A7
        GOSUB   SUB_79226                        * 792A9
        RTNC                                     * 792AD
        C=D     A                                * 792B0
        A=C     A                                * 792B2
        ?ST=0   10                               * 792B4
        GOYES   SUB_79226.L9                     * 792B7
        A=-A    A                                * 792B9
SUB_79226.L9:
        A=0     S                                * 792BB
        B=0     W                                * 792BE
        B=B+1   P                                * 792C1
        GOTO    EXPM115.L22                      * 792C4

* refs (2): 79306 7952C
SUB_792C8:
        GOSUB   SpecA?~jump                      * 792C8
        GONC    SUB_792C8.L3                     * 792CC
        ?C#A    XS                               * 792CF
        GOYES   SUB_792C8.L1                     * 792D2
        ?A=0    B                                * 792D4
        GOYES   SUB_792C8.L4                     * 792D7
        ?C=0    B                                * 792D9
        RTNYES                                   * 792DC
        GOSBVL  SQRF.L25                         * 792DE
        RTNSC                                    * 792E5
SUB_792C8.L1:
        ?A#0    B                                * 792E7
        RTNYES                                   * 792EA
SUB_792C8.loop2:
        RTNCC                                    * 792EC
SUB_792C8.L3:
        GOSBVL  SpecC?                           * 792EE
        RTNNC                                    * 792F5
SUB_792C8.L4:
        ?C=0    B                                * 792F8
        GOYES   SUB_792C8.loop2                  * 792FB
        GOSUB   XYEX~jump_3                      * 792FD
        RTNSC                                    * 79301

* refs (3): 2B6BC 7836B 7DA8D
* Y in A/B, X in C/D -> y^x
Pow15:
        HST=0   3                                * 79303
        GOSUB   SUB_792C8                        * 79306
        RTNC                                     * 7930A
Pow15.L1:
        ST=0    11                               * 7930D
        ST=0    8                                * 79310
        B=0     S                                * 79313
        D=0     S                                * 79316
        GOSBVL  SplitNormA                       * 79319
        GONC    Pow15.L2                         * 79320
        ST=1    8                                * 79323
Pow15.L2:
        GOSBVL  SplitNormC                       * 79326
        GOSBVL  STCD2                            * 7932D
        ?A=0    S                                * 79334
        GOYES   Pow15.loop3                      * 79337
        GOTO    Pow15.L10                        * 79339
Pow15.loop3:
        ?B#0    W                                * 7933D
        GOYES   Pow15.L4                         * 79340
        GOTO    Pow15.L18                        * 79342
Pow15.L4:
        GOSUB   SUB_795D6                        * 79346
        GONC    Pow15.L5                         * 7934A
        GOSUB   RCCD2~jump_4                     * 7934D
        GOSBVL  SpecC?                           * 79351
        GOC     Pow15.L5                         * 79358
        GOSUB   XYEX~jump_3                      * 7935B
        D=C     A                                * 7935F
        GOSBVL  CLRFRC                           * 79361
        C=D     A                                * 79368
        D=0     A                                * 7936A
        GOSUB   XYEX~jump_3                      * 7936C
        GONC    Pow15.L5                         * 79370
        GOTO    SUB_79226.L6                     * 79373
Pow15.L5:
        GOSUB   SUB_78DE9                        * 79377
        GOSUB   RCCD2~jump_4                     * 7937B
        GOSBVL  MULTFchk                         * 7937F
        ?XM=0                                    * 79386
        GOYES   Pow15.L8                         * 79389
        P=      0                                * 7938B
        C=0     A                                * 7938D
        LC(2)   #12                              * 7938F
        ?ST=1   8                                * 79393
        GOYES   Pow15.loop7                      * 79396
Pow15.L6:
        LC(2)   #11                              * 79398
        GOTO    Pow15.L12                        * 7939C
Pow15.loop7:
        A=0     W                                * 793A0
        B=0     W                                * 793A3
        P=      14                               * 793A6
        B=B+1   P                                * 793A8
        RTNSXM                                   * 793AB
Pow15.L8:
        ?D#0    S                                * 793AD
        GOYES   Pow15.L9                         * 793B0
        GOTO    SUB_78F86.L3                     * 793B2
Pow15.L9:
        A=A-1   A                                * 793B6
        C=D     W                                * 793B8
        BCEX    W                                * 793BB
        GOTO    EXPM115.L1                       * 793BE
Pow15.L10:
        GOSUB   EXAB2~jump_2                     * 793C2
        C=A     A                                * 793C6
        C=C+C   A                                * 793C8
        GONC    Pow15.L13                        * 793CA
Pow15.loop11:
        GOSUB   EXAB2~jump_2                     * 793CD
        ?B=0    W                                * 793D1
        GOYES   Pow15.L18                        * 793D4
        P=      0                                * 793D6
        LC(2)   #09                              * 793D8
Pow15.L12:
        GOLONG  SUB_78DE9.L2                     * 793DC
Pow15.L13:
        GOSBVL  FracPosChk                       * 793E2
        ?P#     15                               * 793E9
        GOYES   Pow15.L14                        * 793EC
        ?C#0    A                                * 793EE
        GOYES   Pow15.L16                        * 793F1
        GONC    Pow15.L15                        * 793F3
Pow15.L14:
        ?B#0    WP                               * 793F6
        GOYES   Pow15.loop11                     * 793F9
Pow15.L15:
        P=P+1                                    * 793FB
        GOSUB   SUB_794FD                        * 793FD
Pow15.L16:
        GOSUB   EXAB2~jump_2                     * 79401
        A=0     S                                * 79405
        GONC    Pow15.L17                        * 79408
        GOTO    Pow15.loop3                      * 7940B
Pow15.L17:
        GOSUB   Pow15.loop3                      * 7940F
        A=-A-1  S                                * 79413
        RTN                                      * 79416
Pow15.L18:
        GOSUB   RCCD2~jump_4                     * 79418
        P=      0                                * 7941C
        ?D#0    W                                * 7941E
        GOYES   Pow15.L19                        * 79421
        C=0     A                                * 79423
        LC(2)   #06                              * 79425
        GOTO    Pow15.loop7                      * 79429
Pow15.L19:
        ?C=0    S                                * 7942D
        GOYES   Pow15.L20                        * 79430
        LC(2)   #05                              * 79432
        GOTO    XRoot15.L8                       * 79436
Pow15.L20:
        GOTO    EXPM115.L22                      * 7943A

* refs (1): 2B6CE
* Y in A/B, X in C/D -> the x-th root of y (1/x with the sign kept for odd roots)
XRoot15:
        HST=0   3                                * 7943E
        P=      14                               * 79441
        ?D#0    P                                * 79443
        GOYES   XRoot15.L9                       * 79446
        ST=0    6                                * 79448
        ?C=0    S                                * 7944B
        GOYES   XRoot15.L1                       * 7944E
        ST=1    6                                * 79450
XRoot15.L1:
        ?B#0    P                                * 79453
        GOYES   XRoot15.L2                       * 79456
        ?ST=0   6                                * 79458
        GOYES   XRoot15.L5                       * 7945B
        P=      0                                * 7945D
        LC(2)   #05                              * 7945F
        GOTO    XRoot15.L7                       * 79463
XRoot15.L2:
        ?A#0    A                                * 79467
        GOYES   XRoot15.L3                       * 7946A
        GOSUB   SUB_795D6                        * 7946C
        GONC    XRoot15.L3                       * 79470
        GOTO    Pow15.L6                         * 79473
XRoot15.L3:
        A=A+A   A                                * 79477
        GOC     XRoot15.L4                       * 79479
        ?ST=0   6                                * 7947C
        GOYES   XRoot15.L6                       * 7947F
        GONC    XRoot15.L5                       * 79481
XRoot15.L4:
        ?ST=1   6                                * 79484
        GOYES   XRoot15.L6                       * 79487
XRoot15.L5:
        A=0     W                                * 79489
        B=0     W                                * 7948C
        RTNCC                                    * 7948F
XRoot15.L6:
        P=      0                                * 79491
        LC(2)   #17                              * 79493
XRoot15.L7:
        A=0     S                                * 79497
XRoot15.L8:
        GOVLNG  DIVF1.L3                         * 7949A
XRoot15.L9:
        GOSUB   STAB0~jump_4                     * 794A1
        GOSUB   XYEX~jump_3                      * 794A5
        ?C#0    S                                * 794A9
        GOYES   XRoot15.L11                      * 794AC
XRoot15.loop10:
        GOSBVL  1/X15                            * 794AE
        GOSUB   RCCD0~jump_4                     * 794B5
        GOSUB   XYEX~jump_3                      * 794B9
        GOTO    Pow15.L1                         * 794BD
XRoot15.L11:
        GOSBVL  FracPosChk                       * 794C1
        ?P#     15                               * 794C8
        GOYES   XRoot15.L12                      * 794CB
        ?C#0    A                                * 794CD
        GOYES   XRoot15.loop10                   * 794D0
        GONC    XRoot15.L13                      * 794D2
XRoot15.L12:
        ?B#0    WP                               * 794D5
        GOYES   XRoot15.loop10                   * 794D8
XRoot15.L13:
        P=P+1                                    * 794DA
        GOSUB   SUB_794FD                        * 794DC
        GOC     XRoot15.loop10                   * 794E0
        C=R0                                     * 794E3
        C=0     S                                * 794E6
        R0=C                                     * 794E9
        GOSUB   XRoot15.loop10                   * 794EC
        GOC     XRoot15.L14                      * 794F0
        A=-A-1  S                                * 794F3
        RTNCC                                    * 794F6
XRoot15.L14:
        A=-A-1  S                                * 794F8
        RTNSC                                    * 794FB

* refs (2): 793FD 794DC
SUB_794FD:
        C=B     P                                * 794FD
        C=C+C   P                                * 79500
        C=C+C   P                                * 79503
        C=C+B   P                                * 79506
        ?C=0    P                                * 79509
        RTNYES                                   * 7950C
        RTN                                      * 7950E

* refs (4): 78D47 78DEC 78FB5 79B2E
SUB_79510:
        SB=0                                     * 79510
        SETHEX                                   * 79513
        A=A+1   XS                               * 79515
        A=A-1   XS                               * 79518
        SETDEC                                   * 7951B
        RTNNC                                    * 7951D
        ?A=0    B                                * 79520
        RTNYES                                   * 79523
        C=RSTK                                   * 79525
        RTNCC                                    * 79527

* refs (1): 2B6D7
* X, Y -> the angle of the point, with the quadrant, for %ANGLE
Angle15:
        HST=0   3                                * 79529
        GOSUB   SUB_792C8                        * 7952C
        RTNC                                     * 79530
        R0=A                                     * 79533
        R1=C                                     * 79536
        GOSUB   SpecA?~jump                      * 79539
        GOSUB   XYEX~jump_3                      * 7953D
        GONC    Angle15.L1                       * 79541
        ?C#A    XS                               * 79544
        GOYES   Angle15.L2                       * 79547
        GOTO    TAN15.L2                         * 79549
Angle15.L1:
        GOSUB   SpecA?~jump                      * 7954D
        GOC     Angle15.L2                       * 79551
        ?D#0    W                                * 79554
        GOYES   Angle15.L2                       * 79557
        ?B#0    W                                * 79559
        GOYES   Angle15.L2                       * 7955C
        RTN                                      * 7955E
Angle15.L2:
        GOSBVL  DIVFchk                          * 79560
        GOSUB   SUB_795B9                        * 79567
        GOSUB   SUB_79B1C                        * 7956B
        GOSUB   SUB_795C6                        * 7956F
        C=R0                                     * 79573
        ?C=0    S                                * 79576
        RTNYES                                   * 79579
        C=R1                                     * 7957B
        P=      14                               * 7957E
        C=0     WP                               * 79580
        D=C     W                                * 79583
        ?ST=1   4                                * 79586
        GOYES   Angle15.L3                       * 79589
        ?ST=1   9                                * 7958B
        GOYES   Angle15.L5                       * 7958E
        P=      13                               * 79590
        LC(2)   #18                              * 79592
        GOTO    Angle15.L4                       * 79596
Angle15.L3:
        P=      14                               * 7959A
        LC(1)   #2                               * 7959C
Angle15.L4:
        D=D+1   A                                * 7959F
        D=D+1   A                                * 795A1
        DCEX    W                                * 795A3
        GONC    Angle15.L6                       * 795A6
Angle15.L5:
        GOSUB   SUB_79AB5                        * 795A9
        D=D+D   W                                * 795AD
        D=D-1   A                                * 795B0
Angle15.L6:
        GOVLNG  ADDF                             * 795B2

* refs (1): 79567
SUB_795B9:
        ST=0    5                                * 795B9
        ?SB=0                                    * 795BC
        RTNYES                                   * 795BF
        ST=1    5                                * 795C1
        RTN                                      * 795C4

* refs (1): 7956F
SUB_795C6:
        ?ST=0   5                                * 795C6
        RTNYES                                   * 795C9

* refs (3): 78F5B 79157 79D58
SUB_795CB:
        C=0     S                                * 795CB
        C=C+1   S                                * 795CE
        CSR     S                                * 795D1
        RTN                                      * 795D4

* refs (7): 791FF 79346 7946C 79B67 79B99 79C2C ...
SUB_795D6:
        C=0     W                                * 795D6
        P=      14                               * 795D9
        C=C+1   P                                * 795DB
        ?B=C    W                                * 795DE
        RTNYES                                   * 795E1
        RTN                                      * 795E3

* refs (7): 78CB5 79121 79148 79267 794A1 7990F ...
STAB0~jump_4:
        GOVLNG  STAB0                            * 795E5

* refs (2): 78C0C 79BDA
STAB2~jump_4:
        GOVLNG  STAB2                            * 795EC

* refs (1): 78C8F
STCD0~jump:
        GOVLNG  STCD0                            * 795F3
STCD0~jump.L1:
        GOVLNG  RCAB0                            * 795FA

* refs (2): 78C45 78C4F
RCAB2~jump_2:
        GOVLNG  RCAB2                            * 79601

* refs (7): 78C12 78C63 78C73 78D07 794B5 79913 ...
RCCD0~jump_4:
        GOVLNG  RCCD0                            * 79608

* refs (4): 7934D 7937B 79418 79C03
RCCD2~jump_4:
        GOVLNG  RCCD2                            * 7960F

* refs (6): 78BF9 78C06 78C9B 7912C 79272 79BE4
EXAB0~jump_2:
        GOVLNG  EXAB0                            * 79616

* refs (3): 793C2 793CD 79401
EXAB2~jump_2:
        GOVLNG  EXAB2                            * 7961D

* refs (8): 78C89 792FD 7935B 7936C 794A5 794B9 ...
XYEX~jump_3:
        GOVLNG  XYEX                             * 79624

* refs (4): 78A3A 792C8 79539 7954D
SpecA?~jump:
        GOVLNG  SpecA?                           * 7962B

* refs (2): 78C1A 78C80
TST15~jump_3:
        GOVLNG  TST15                            * 79632

* refs (1): 7968D
SUB_79639:
        P=      14                               * 79639
        ?B=0    P                                * 7963B
        RTNYES                                   * 7963E
        C=B     W                                * 79640
        C=C+C   W                                * 79643
        C=C+C   W                                * 79646
        C=C+C   W                                * 79649
        B=B+C   W                                * 7964C
        A=A-1   A                                * 7964F
        ?B=0    S                                * 79651
        RTNYES                                   * 79654
        BSR     W                                * 79656
        A=A+1   A                                * 79659
        RTNSC                                    * 7965B

* refs (1): 2B6E0
* A/B -> sin x, radians
SIN15:
        ST=1    8                                * 7965D
        GOTO    COS15.L1                         * 79660

* refs (1): 2B6E9
* A/B -> cos x
COS15:
        ST=0    8                                * 79664
COS15.L1:
        ST=1    6                                * 79667
        GOTO    TAN15.L1                         * 7966A

* refs (1): 2B6F2
* A/B -> tan x
TAN15:
        ST=0    8                                * 7966E
        ST=0    6                                * 79671
TAN15.L1:
        HST=0   3                                * 79674
        GOTO    TAN15.L3                         * 79677
TAN15.L2:
        P=      0                                * 7967B
        LC(2)   #0B                              * 7967D
        GOTO    Pow15.L12                        * 79681
TAN15.L3:
        B=0     S                                * 79685
        ?ST=0   4                                * 79688
        GOYES   TAN15.L4                         * 7968B
        GOSUB   SUB_79639                        * 7968D
        ST=0    9                                * 79691
TAN15.L4:
        C=0     W                                * 79694
        R0=C                                     * 79697
        ST=0    10                               * 7969A
        ST=0    11                               * 7969D
        ?ST=1   8                                * 796A0
        GOYES   TAN15.L5                         * 796A3
        C=C+1   S                                * 796A5
TAN15.L5:
        R1=C                                     * 796A8
        ST=0    7                                * 796AB
        ?B=0    W                                * 796AE
        GOYES   TAN15.L6                         * 796B1
        ST=1    7                                * 796B3
TAN15.L6:
        ?A=0    S                                * 796B6
        GOYES   TAN15.L7                         * 796B9
        ST=1    11                               * 796BB
        ?ST=0   8                                * 796BE
        GOYES   TAN15.L7                         * 796C1
        ST=1    10                               * 796C3
TAN15.L7:
        A=0     S                                * 796C6
        P=      5                                * 796C9
        A=0     P                                * 796CB
        C=A     A                                * 796CE
        C=C+C   A                                * 796D0
        GONC    TAN15.L8                         * 796D2
        A=A-1   P                                * 796D5
TAN15.L8:
        C=A     W                                * 796D8
        A=B     W                                * 796DB
        ?ST=1   9                                * 796DE
        GOYES   TAN15.L9                         * 796E1
        C=C-1   WP                               * 796E3
        ?C#0    P                                * 796E6
        GOYES   TAN15.L14                        * 796E9
        C=C-1   WP                               * 796EB
        GONC    TAN15.L9                         * 796EE
        C=C+1   WP                               * 796F1
        CR0EX                                    * 796F4
        GOSUB   SUB_79A93                        * 796F7
        CR0EX                                    * 796FB
TAN15.L9:
        ?C#0    P                                * 796FE
        GOYES   TAN15.L14                        * 79701
        GOSUB   SUB_79A3E                        * 79703
        GOSUB   SUB_79A7A                        * 79707
        GOSUB   SUB_79A7A                        * 7970B
        GOSUB   SUB_79A7A                        * 7970F
        GOSUB   SUB_79A9E                        * 79713
TAN15.loop10:
        CR0EX                                    * 79717
TAN15.loop11:
        GOSUB   SUB_79A1F                        * 7971A
        GONC    TAN15.loop11                     * 7971E
        GOSUB   SUB_79A88                        * 79721
        CR0EX                                    * 79725
        C=C-1   WP                               * 79728
        GONC    TAN15.loop10                     * 7972B
        C=0     WP                               * 7972E
        CR0EX                                    * 79731
        GOSUB   SUB_79A3E                        * 79734
        GOSUB   SUB_79A7A                        * 79738
        ?ST=0   9                                * 7973C
        GOYES   TAN15.loop12                     * 7973F
        GOSUB   SUB_79A9E                        * 79741
        GOSUB   SUB_79A93                        * 79745
TAN15.loop12:
        GOSUB   SUB_79A1F                        * 79749
        GOC     TAN15.L13                        * 7974D
        GOSUB   ST11Flip                         * 79750
        GOSUB   SUB_79AC8                        * 79754
        GOC     TAN15.loop12                     * 79758
        GOSUB   SUB_79AD7                        * 7975B
        GOTO    TAN15.loop12                     * 7975F
TAN15.L13:
        CR0EX                                    * 79763
TAN15.L14:
        ?ST=0   9                                * 79766
        GOYES   TAN15.L16                        * 79769
        ?C#0    WP                               * 7976B
        GOYES   TAN15.L15                        * 7976E
        CR0EX                                    * 79770
        GOSUB   SUB_79A88                        * 79773
        CR0EX                                    * 79777
        GONC    TAN15.L16                        * 7977A
TAN15.L15:
        C=C+1   WP                               * 7977D
TAN15.L16:
        ?C#0    P                                * 79780
        GOYES   TAN15.L19                        * 79783
        CR0EX                                    * 79785
        GOSUB   SUB_79A3E                        * 79788
        GOSUB   SUB_79A1F                        * 7978C
        GOC     TAN15.L17                        * 79790
        ABEX    W                                * 79793
        DCEX    W                                * 79796
        GOSUB   SUB_79A1F                        * 79799
        GOSUB   SUB_79AC8                        * 7979D
TAN15.L17:
        P=      14                               * 797A1
        CR0EX                                    * 797A3
        B=C     W                                * 797A6
        CR0EX                                    * 797A9
        ?A#0    W                                * 797AC
        GOYES   TAN15.loop18                     * 797AF
        ?C=0    W                                * 797B1
        GOYES   TAN15.L20                        * 797B4
TAN15.loop18:
        ?A#0    P                                * 797B6
        GOYES   TAN15.L20                        * 797B9
        GOSUB   SUB_79A88                        * 797BB
        B=B-1   A                                * 797BF
        GOTO    TAN15.loop18                     * 797C1
TAN15.L19:
        B=C     W                                * 797C5
TAN15.L20:
        ABEX    W                                * 797C8
        ?ST=1   9                                * 797CB
        GOYES   TAN15.L23                        * 797CE
        ?B=0    W                                * 797D0
        GOYES   TAN15.L22                        * 797D3
        ?A#0    A                                * 797D5
        GOYES   TAN15.L23                        * 797D8
        C=0     W                                * 797DA
        P=      13                               * 797DD
        LC(2)   #45                              * 797DF
        ?ST=0   6                                * 797E3
        GOYES   TAN15.L21                        * 797E6
        ?ST=0   8                                * 797E8
        GOYES   TAN15.L23                        * 797EB
        LC(2)   #30                              * 797ED
TAN15.L21:
        ?B#C    W                                * 797F1
        GOYES   TAN15.L23                        * 797F4
TAN15.L22:
        ST=0    7                                * 797F6
TAN15.L23:
        A=A-1   A                                * 797F9
        ?ST=1   9                                * 797FB
        GOYES   TAN15.L24                        * 797FE
        P=      7                                * 79800
        GOSUB   SUB_799E0                        * 79802
        D=C     W                                * 79806
        C=0     A                                * 79809
        GOSBVL  MULTF                            * 7980B
TAN15.L24:
        C=A     A                                * 79812
        C=C+1   A                                * 79814
        GONC    TAN15.L25                        * 79816
        BSL     W                                * 79819
        P=      14                               * 7981C
        GOC     TAN15.L28                        * 7981E
TAN15.L25:
        C=0     A                                * 79821
        P=      0                                * 79823
        LC(1)   #8                               * 79825
        C=C+A   A                                * 79828
        GOC     TAN15.L27                        * 7982A
        ?ST=0   8                                * 7982D
        GOYES   TAN15.L26                        * 79830
        GOSBVL  1/X15                            * 79832
TAN15.L26:
        GOTO    TAN15.L37                        * 79839
TAN15.L27:
        C=A     B                                * 7983D
        P=      5                                * 79840
        C+P+1                                    * 79842
        P=C     0                                * 79845
TAN15.L28:
        A=0     W                                * 79849
TAN15.loop29:
        GOSUB   SUB_799E0                        * 7984C
        GONC    TAN15.L31                        * 79850
TAN15.loop30:
        A=A+1   S                                * 79853
TAN15.L31:
        B=B-C   W                                * 79856
        GONC    TAN15.loop30                     * 79859
        B=B+C   W                                * 7985C
        P=P-1                                    * 7985F
        ASR     W                                * 79861
        BSL     W                                * 79864
        ?P#     7                                * 79867
        GOYES   TAN15.loop29                     * 7986A
        BSR     W                                * 7986C
        BSR     W                                * 7986F
        C=A     W                                * 79872
        P=      15                               * 79875
        LC(2)   #77                              * 79877
        A=C     W                                * 7987B
        D=0     W                                * 7987E
        P=      14                               * 79881
        D=D+1   P                                * 79883
        C=B     W                                * 79886
        GONC    TAN15.loop34                     * 79889
TAN15.loop32:
        CSR     WP                               * 7988C
        CSR     WP                               * 7988F
TAN15.loop33:
        C=C-1   S                                * 79892
        GONC    TAN15.loop32                     * 79895
        C=0     S                                * 79898
        DCEX    W                                * 7989B
        D=C-D   W                                * 7989E
        C=C+B   W                                * 798A1
TAN15.loop34:
        B=C     W                                * 798A4
        C=A     S                                * 798A7
        A=A-1   P                                * 798AA
        GONC    TAN15.loop33                     * 798AD
        ASL     M                                * 798B0
        ?A=0    M                                * 798B3
        GOYES   TAN15.L35                        * 798B6
        A=A-1   S                                * 798B8
        A=A-1   B                                * 798BB
        C=0     S                                * 798BE
        CSR     W                                * 798C1
        GOTO    TAN15.loop34                     * 798C4
TAN15.L35:
        A=0     S                                * 798C8
        C=0     S                                * 798CB
        D=D-1   W                                * 798CE
        A=-A    A                                * 798D1
        B=0     A                                * 798D3
        ?ST=0   8                                * 798D5
        GOYES   TAN15.L36                        * 798D8
        A=-A    A                                * 798DA
        DCEX    W                                * 798DC
TAN15.L36:
        GOSBVL  DIVF1                            * 798DF
TAN15.L37:
        ?ST=1   6                                * 798E6
        GOYES   TAN15.L38                        * 798E9
        ?XM=0                                    * 798EB
        GOYES   TAN15.L40                        * 798EE
        A=-A-1  S                                * 798F0
        P=      0                                * 798F3
        LC(2)   #04                              * 798F5
        P=      3                                * 798F9
        GONC    TAN15.L41                        * 798FB
TAN15.L38:
        C=R1                                     * 798FE
        ?C=0    S                                * 79901
        GOYES   TAN15.L39                        * 79904
        ?XM=0                                    * 79906
        GOYES   TAN15.L39                        * 79909
        GOSUB   SUB_79AD7                        * 7990B
TAN15.L39:
        GOSUB   STAB0~jump_4                     * 7990F
        GOSUB   RCCD0~jump_4                     * 79913
        GOSBVL  MULTFchk                         * 79917
        GOSBVL  SUB_78A28                        * 7991E
        GOSBVL  SQRFchk                          * 79925
        GOSBVL  1/X15                            * 7992C
TAN15.L40:
        GOSUB   SUB_79D58                        * 79933
        ?ST=1   6                                * 79937
        GOYES   TAN15.L43                        * 7993A
TAN15.L41:
        ?ST=0   11                               * 7993C
        RTNYES                                   * 7993F
TAN15.loop42:
        A=-A-1  S                                * 79941
        RTN                                      * 79944
TAN15.L43:
        ?ST=0   10                               * 79946
        RTNYES                                   * 79949
        GONC    TAN15.loop42                     * 7994B

* atan(10^-k) for k = 1..7, then pi/180 and pi/4: BCD mantissas (read by SUB_799F8.L1)
        CON(16) #0996686524911620                * 7994E  entry 0
        CON(16) #0999966668666524                * 7995E  entry 1
        CON(16) #0999999666666867                * 7996E  entry 2
        CON(16) #0999999996666667                * 7997E  entry 3
        CON(16) #0999999999966667                * 7998E  entry 4
        CON(16) #0999999999999667                * 7999E  entry 5
        CON(16) #0999999999999997                * 799AE  entry 6
        CON(16) #0174532925199433                * 799BE  entry 7
        CON(16) #0785398163397448                * 799CE  entry 8

* refs (3): 79A46 79AB5 79C41
SUB_799DE:
        P=      6                                * 799DE

* refs (4): 79802 7984C 79CCA 79D2B
SUB_799E0:
        C=0     A                                * 799E0
        CPEX    1                                * 799E2
        DCEX    A                                * 799E6
        D0=C                                     * 799E8
        LC(5)   SUB_79A1F.L1+1                   * 799EB
        GOTO    SUB_799F8.L1                     * 799F2

* refs (3): 78F2F 79039 79215
SUB_799F6:
        P=      6                                * 799F6

* refs (2): 78F0D 7909E
SUB_799F8:
        C=0     A                                * 799F8
        CPEX    1                                * 799FA
        DCEX    A                                * 799FE
        D0=C                                     * 79A00
        LC(5)   SUB_79226.L3+2                   * 79A03
SUB_799F8.L1:
        SETHEX                                   * 79A0A
        C=C-D   A                                * 79A0C
        SETDEC                                   * 79A0E
        CD0EX                                    * 79A10
        DCEX    A                                * 79A13
        P=C     1                                * 79A15
        C=DAT0  W                                * 79A19
        RTNCC                                    * 79A1D

* refs (5): 7904C 7971A 79749 7978C 79799
SUB_79A1F:
        A=A-B   W                                * 79A1F
        GOC     SUB_79A1F.L2                     * 79A22
        C=C-D   W                                * 79A25
        GOC     SUB_79A1F.L1                     * 79A28
        RTNCC                                    * 79A2B
SUB_79A1F.L1:
        A=A-1   W                                * 79A2D
        RTNNC                                    * 79A30
        A=A+1   W                                * 79A33
        C=C+D   W                                * 79A36
SUB_79A1F.L2:
        A=A+B   W                                * 79A39
        RTNSC                                    * 79A3C

* refs (3): 79703 79734 79788
SUB_79A3E:
        B=C     W                                * 79A3E
        ?ST=0   9                                * 79A41
        GOYES   SUB_79A3E.L2                     * 79A44
        GOSUB   SUB_799DE                        * 79A46
        D=C     W                                * 79A4A
        P=      0                                * 79A4D
        LC(16)  #3096156608458199                * 79A4F
        DCEX    W                                * 79A61
SUB_79A3E.loop1:
        P=      5                                * 79A64
        BCEX    W                                * 79A66
        RTN                                      * 79A69
SUB_79A3E.L2:
        C=0     W                                * 79A6B
        D=0     W                                * 79A6E
        P=      13                               * 79A71
        LC(2)   #45                              * 79A73
        GOC     SUB_79A3E.loop1                  * 79A77

* refs (4): 79707 7970B 7970F 79738
SUB_79A7A:
        B=B+B   W                                * 79A7A
        D=D+D   W                                * 79A7D
        RTNNC                                    * 79A80
        B=B+1   W                                * 79A83
        RTN                                      * 79A86

* refs (4): 79055 79721 79773 797BB
SUB_79A88:
        A=C     S                                * 79A88
        ASLC                                     * 79A8B
        CSL     W                                * 79A8E
        RTN                                      * 79A91

* refs (2): 796F7 79745
SUB_79A93:
        CSR     W                                * 79A93
        ASRC                                     * 79A96
        CAEX    S                                * 79A99
        RTN                                      * 79A9C

* refs (2): 79713 79741
SUB_79A9E:
        DSR     W                                * 79A9E
        BSRC                                     * 79AA1
        BCEX    S                                * 79AA4
        D=C     S                                * 79AA7
        BCEX    S                                * 79AAA
        B=0     S                                * 79AAD
        RTN                                      * 79AB0

* refs (4): 79B3E 79D06 79D15 79D38
SUB_79AB2:
        D=0     S                                * 79AB2

* refs (1): 795A9
SUB_79AB5:
        GOSUB   SUB_799DE                        * 79AB5
        C=C+C   W                                * 79AB9
        CSR     W                                * 79ABC
        C=C+1   A                                * 79ABF
        DCEX    W                                * 79AC1
        C=0     A                                * 79AC4
        RTN                                      * 79AC6

* refs (4): 79754 7979D 79C1F 79C50
SUB_79AC8:
        ?ST=1   8                                * 79AC8
        GOYES   SUB_79AC8.L1                     * 79ACB
        ST=1    8                                * 79ACD
        RTNCC                                    * 79AD0
SUB_79AC8.L1:
        ST=0    8                                * 79AD2
        RTNSC                                    * 79AD5

* refs (2): 7975B 7990B
SUB_79AD7:
        ?ST=1   10                               * 79AD7
        GOYES   SUB_79AD7.L1                     * 79ADA
        ST=1    10                               * 79ADC
        RTNCC                                    * 79ADF
SUB_79AD7.L1:
        ST=0    10                               * 79AE1
        RTNSC                                    * 79AE4

* refs (1): 79750
* Toggle ST 11; carry set if it was set
ST11Flip:
        ?ST=1   11                               * 79AE6
        GOYES   ST11Flip~1                       * 79AE9
        ST=1    11                               * 79AEB
        RTNCC                                    * 79AEE
ST11Flip~1:
        ST=0    11                               * 79AF0
        RTNSC                                    * 79AF3

* refs (3): 2B6FB 7813D 782E0
* A/B -> atan x
ATAN15:
        ST=0    8                                * 79AF5
        ST=0    6                                * 79AF8
        GOTO    ACOS15.L2                        * 79AFB

* refs (1): 2B704
* A/B -> asin x
ASIN15:
        ST=0    8                                * 79AFF
        GOTO    ACOS15.L1                        * 79B02

* refs (1): 2B70D
* A/B -> acos x
ACOS15:
        ST=1    8                                * 79B06
ACOS15.L1:
        ST=1    6                                * 79B09
ACOS15.L2:
        HST=0   3                                * 79B0C
        ST=0    7                                * 79B0F
        ST=0    10                               * 79B12
        ST=0    11                               * 79B15
        GOTO    SUB_79B1C.L4                     * 79B18

* refs (1): 7956B
SUB_79B1C:
        ST=0    8                                * 79B1C
        ST=0    6                                * 79B1F
        XM=0                                     * 79B22
        ST=0    7                                * 79B25
        ST=0    10                               * 79B28
        ST=0    11                               * 79B2B
        GOSUB   SUB_79510                        * 79B2E
        GONC    SUB_79B1C.L4                     * 79B32
        ?ST=0   6                                * 79B35
        GOYES   SUB_79B1C.L2                     * 79B38
SUB_79B1C.loop1:
        GOTO    TAN15.L2                         * 79B3A
SUB_79B1C.L2:
        GOSUB   SUB_79AB2                        * 79B3E
        GOSUB   XYEX~jump_3                      * 79B42
        A=C     S                                * 79B46
        ?ST=1   4                                * 79B49
        GOYES   SUB_79B1C.L3                     * 79B4C
        ?ST=0   9                                * 79B4E
        GOYES   SUB_79B1C.L3                     * 79B51
        ST=1    7                                * 79B53
SUB_79B1C.L3:
        GOTO    SUB_79B1C.L33                    * 79B56
SUB_79B1C.L4:
        B=0     S                                * 79B5A
        ?ST=1   9                                * 79B5D
        GOYES   SUB_79B1C.L6                     * 79B60
        ?B=0    W                                * 79B62
        GOYES   SUB_79B1C.L9                     * 79B65
        GOSUB   SUB_795D6                        * 79B67
        GONC    SUB_79B1C.L5                     * 79B6B
        ?A=0    A                                * 79B6E
        GOYES   SUB_79B1C.L9                     * 79B71
SUB_79B1C.L5:
        ?ST=0   6                                * 79B73
        GOYES   SUB_79B1C.L8                     * 79B76
        LC(1)   #5                               * 79B78
        ?B#C    W                                * 79B7B
        GOYES   SUB_79B1C.L8                     * 79B7E
        C=C-1   A                                * 79B80
        ?C=A    A                                * 79B82
        GOYES   SUB_79B1C.L9                     * 79B85
        GONC    SUB_79B1C.L8                     * 79B87
SUB_79B1C.L6:
        ?ST=0   8                                * 79B8A
        GOYES   SUB_79B1C.L7                     * 79B8D
        ?A#0    S                                * 79B8F
        GOYES   SUB_79B1C.L8                     * 79B92
        ?A#0    A                                * 79B94
        GOYES   SUB_79B1C.L8                     * 79B97
        GOSUB   SUB_795D6                        * 79B99
        GONC    SUB_79B1C.L8                     * 79B9D
        GOC     SUB_79B1C.L9                     * 79BA0
SUB_79B1C.L7:
        ?B=0    W                                * 79BA3
        GOYES   SUB_79B1C.L9                     * 79BA6
SUB_79B1C.L8:
        ST=1    7                                * 79BA8
SUB_79B1C.L9:
        ?A=0    S                                * 79BAB
        GOYES   SUB_79B1C.L10                    * 79BAE
        ST=1    10                               * 79BB0
        ?ST=0   8                                * 79BB3
        GOYES   SUB_79B1C.L10                    * 79BB6
        ST=0    8                                * 79BB8
        ST=1    11                               * 79BBB
        ST=0    10                               * 79BBE
SUB_79B1C.L10:
        ?B#0    W                                * 79BC1
        GOYES   SUB_79B1C.L11                    * 79BC4
        GOTO    SUB_79B1C.L31                    * 79BC6
SUB_79B1C.L11:
        C=A     A                                * 79BCA
        C=C+C   A                                * 79BCC
        GONC    SUB_79B1C.L14                    * 79BCE
        ?ST=0   6                                * 79BD1
        GOYES   SUB_79B1C.L13                    * 79BD4
        GOSUB   STAB0~jump_4                     * 79BD6
        GOSUB   STAB2~jump_4                     * 79BDA
        GOSUBL  SUB_78A28                        * 79BDE
        GOSUB   EXAB0~jump_2                     * 79BE4
        GOSUBL  SUB_78A1F                        * 79BE8
        GOSUB   RCCD0~jump_4                     * 79BEE
        GOSBVL  MULTF                            * 79BF2
        A=0     S                                * 79BF9
        GOSBVL  SQRF                             * 79BFC
        GOSUB   RCCD2~jump_4                     * 79C03
        GOSBVL  Y/X                              * 79C07
        A=0     S                                * 79C0E
        C=A     A                                * 79C11
        C=C+C   A                                * 79C13
        GOC     SUB_79B1C.L13                    * 79C15
SUB_79B1C.loop12:
        GOSBVL  1/X15                            * 79C18
        GOSUB   SUB_79AC8                        * 79C1F
SUB_79B1C.L13:
        GOTO    SUB_79B1C.L20                    * 79C23
SUB_79B1C.L14:
        ?A#0    A                                * 79C27
        GOYES   SUB_79B1C.L15                    * 79C2A
        GOSUB   SUB_795D6                        * 79C2C
        GOC     SUB_79B1C.L16                    * 79C30
SUB_79B1C.L15:
        ?ST=0   6                                * 79C33
        GOYES   SUB_79B1C.loop12                 * 79C36
        GOTO    SUB_79B1C.loop1                  * 79C38
SUB_79B1C.L16:
        ?ST=1   6                                * 79C3C
        GOYES   SUB_79B1C.L18                    * 79C3F
SUB_79B1C.loop17:
        GOSUB   SUB_799DE                        * 79C41
        B=C     W                                * 79C45
        A=0     W                                * 79C48
        A=A-1   A                                * 79C4B
        GOC     SUB_79B1C.loop19                 * 79C4D
SUB_79B1C.L18:
        GOSUB   SUB_79AC8                        * 79C50
        A=0     W                                * 79C54
        B=0     W                                * 79C57
SUB_79B1C.loop19:
        GOTO    SUB_79B1C.L31                    * 79C5A
SUB_79B1C.L20:
        ?A=0    A                                * 79C5E
        GOYES   SUB_79B1C.loop17                 * 79C61
        GOSUB   SUB_795D6                        * 79C63
        D=C     W                                * 79C67
        C=0     P                                * 79C6A
        C=A     A                                * 79C6D
SUB_79B1C.loop21:
        C=C+1   A                                * 79C6F
        GOC     SUB_79B1C.L22                    * 79C71
        C=C+1   S                                * 79C74
        P=P-1                                    * 79C77
        ?P#     7                                * 79C79
        GOYES   SUB_79B1C.loop21                 * 79C7C
        GONC    SUB_79B1C.loop19                 * 79C7E
SUB_79B1C.L22:
        DCEX    W                                * 79C81
        GOC     SUB_79B1C.loop25                 * 79C84
SUB_79B1C.loop23:
        D=D+1   P                                * 79C87
        C=D     S                                * 79C8A
SUB_79B1C.loop24:
        ASR     W                                * 79C8D
        ASR     W                                * 79C90
        C=C-1   S                                * 79C93
        GONC    SUB_79B1C.loop24                 * 79C96
        C=0     S                                * 79C99
        C=C+A   W                                * 79C9C
SUB_79B1C.loop25:
        A=B     W                                * 79C9F
        B=B-C   W                                * 79CA2
        GONC    SUB_79B1C.loop23                 * 79CA5
        B=A     W                                * 79CA8
        D=D+1   S                                * 79CAB
        BSL     W                                * 79CAE
        P=P-1                                    * 79CB1
        ?P#     7                                * 79CB3
        GOYES   SUB_79B1C.loop25                 * 79CB6
        DCEX    W                                * 79CB8
        BCEX    W                                * 79CBB
        A=B     W                                * 79CBE
        GOSBVL  DIVF1.L6                         * 79CC1
        P=      8                                * 79CC8
SUB_79B1C.loop26:
        GOSUB   SUB_799E0                        * 79CCA
        GOTO    SUB_79B1C.L28                    * 79CCE
SUB_79B1C.loop27:
        B=B+C   W                                * 79CD2
SUB_79B1C.L28:
        A=A-1   P                                * 79CD5
        GONC    SUB_79B1C.loop27                 * 79CD8
        A=0     P                                * 79CDB
        BSR     W                                * 79CDE
        ?A=0    M                                * 79CE1
        GOYES   SUB_79B1C.L30                    * 79CE4
        P=P+1                                    * 79CE6
        GOTO    SUB_79B1C.loop26                 * 79CE8
SUB_79B1C.loop29:
        P=P+1                                    * 79CEC
SUB_79B1C.L30:
        A=A-1   A                                * 79CEE
        ?P#     14                               * 79CF0
        GOYES   SUB_79B1C.loop29                 * 79CF3
SUB_79B1C.L31:
        A=0     S                                * 79CF5
        GOSUBL  SUB_78AE4                        * 79CF8
        ?ST=0   8                                * 79CFE
        GOYES   SUB_79B1C.L32                    * 79D01
        A=-A-1  S                                * 79D03
        GOSUB   SUB_79AB2                        * 79D06
        GOSUBL  SUB_78A33                        * 79D0A
SUB_79B1C.L32:
        ?ST=0   11                               * 79D10
        GOYES   SUB_79B1C.L33                    * 79D13
        GOSUB   SUB_79AB2                        * 79D15
        GOSUBL  SUB_78A33                        * 79D19
SUB_79B1C.L33:
        ?ST=1   4                                * 79D1F
        GOYES   SUB_79B1C.L34                    * 79D22
        ?ST=1   9                                * 79D24
        GOYES   SUB_79B1C.L36                    * 79D27
        P=      7                                * 79D29
        GOSUB   SUB_799E0                        * 79D2B
        D=C     W                                * 79D2F
        C=0     A                                * 79D32
        GOTO    SUB_79B1C.L35                    * 79D34
SUB_79B1C.L34:
        GOSUB   SUB_79AB2                        * 79D38
SUB_79B1C.L35:
        C=C-1   A                                * 79D3C
        C=C-1   A                                * 79D3E
        BCEX    W                                * 79D40
        GOSBVL  DIVF1.L4                         * 79D43
SUB_79B1C.L36:
        GOSUB   SUB_79D58                        * 79D4A
        ?ST=0   10                               * 79D4E
        GOYES   SUB_79B1C.L37                    * 79D51
        A=-A-1  S                                * 79D53
SUB_79B1C.L37:
        RTNCC                                    * 79D56

* refs (2): 79933 79D4A
SUB_79D58:
        GOSUB   SUB_795CB                        * 79D58
        ?ST=1   7                                * 79D5C
        RTNYES                                   * 79D5F
        SB=0                                     * 79D61
        B=B+B   X                                * 79D64
        B=0     X                                * 79D67
        RTNNC                                    * 79D6A
        B=-B-1  X                                * 79D6D
        P=      14                               * 79D70
        B=B+1   WP                               * 79D72
        RTNNC                                    * 79D75
        A=A+1   A                                * 79D78
        B=B+1   P                                * 79D7A
        RTNCC                                    * 79D7D

* refs (5): 79DC8 79E02 79E51 79EB8 79F6D
MULTF~jump_4:
        GOVLNG  MULTF                            * 79D7F

* refs (3): 79F5C 79F93 79FA9
CLRFRC~jump_2:
        GOVLNG  CLRFRC                           * 79D86

* refs (7): 79DC4 79DE6 79DFE 79E4D 79E5C 79E93 ...
RCCD0~jump_5:
        GOVLNG  RCCD0                            * 79D8D

* refs (2): 79DD7 79E19
RCCD2~jump_5:
        GOVLNG  RCCD2                            * 79D94

* refs (5): 79DD0 79DFA 79E30 79E73 79F58
STAB0~jump_5:
        GOVLNG  STAB0                            * 79D9B

* refs (2): 79DBC 79E06
STAB2~jump_5:
        GOVLNG  STAB2                            * 79DA2

* refs (2): 2B731 79DE2
* A/B = x -> A/B = cosh x, register 0 (RCAB0) = sinh x
SINHCOSH15:
        R4=A                                     * 79DA9
        A=0     S                                * 79DAC
        GOSUBL  EXPM115                          * 79DAF
        GOSBVL  1/X15                            * 79DB5
        GOSUB   STAB2~jump_5                     * 79DBC
        GOSUB   RADD1~jump_2                     * 79DC0
        GOSUB   RCCD0~jump_5                     * 79DC4
        GOSUB   MULTF~jump_4                     * 79DC8
        GOSUB   SUB_79EA8                        * 79DCC
        GOSUB   STAB0~jump_5                     * 79DD0
        A=0     S                                * 79DD4
        GOSUB   RCCD2~jump_5                     * 79DD7

* refs (2): 79E60 79F8C
RADDF~jump_4:
        GOVLNG  RADDF                            * 79DDB

* refs (1): 2B73A
* A/B -> tanh x
TANH15:
        GOSUB   SINHCOSH15                       * 79DE2
        GOSUB   RCCD0~jump_5                     * 79DE6

* refs (2): 79E1D 79E97
Y/X~jump:
        GOVLNG  Y/X                              * 79DEA

* refs (1): 2B743
* A/B -> asinh x
ASINH15:
        HST=0   3                                * 79DF1
        R4=A                                     * 79DF4
        A=0     S                                * 79DF7
        GOSUB   STAB0~jump_5                     * 79DFA
        GOSUB   RCCD0~jump_5                     * 79DFE
        GOSUB   MULTF~jump_4                     * 79E02
        GOSUB   STAB2~jump_5                     * 79E06
        GOSUB   RADD1~jump_2                     * 79E0A
        GOSBVL  SQRF                             * 79E0E
        GOSUB   RADD1~jump_2                     * 79E15
        GOSUB   RCCD2~jump_5                     * 79E19
        GOSUB   Y/X~jump                         * 79E1D
        GOSUB   SUB_79E5C                        * 79E21
        C=R4                                     * 79E25
        A=C     S                                * 79E28
        RTN                                      * 79E2B

* refs (1): 2B74C
* A/B -> acosh x
ACOSH15:
        HST=0   3                                * 79E2D
        GOSUB   STAB0~jump_5                     * 79E30
        GOSUB   RSUB1~jump                       * 79E34
        ?B=0    M                                * 79E38
        GOYES   ACOSH15.L1                       * 79E3B
        ?A#0    S                                * 79E3D
        GOYES   ATANH15.L1                       * 79E40
ACOSH15.L1:
        GOSBVL  EXAB0                            * 79E42
        GOSUB   RADD1~jump_2                     * 79E49
        GOSUB   RCCD0~jump_5                     * 79E4D
        GOSUB   MULTF~jump_4                     * 79E51
        GOSBVL  SQRF                             * 79E55

* refs (1): 79E21
SUB_79E5C:
        GOSUB   RCCD0~jump_5                     * 79E5C

* refs (1): 79EA4
SUB_79E60:
        GOSUB   RADDF~jump_4                     * 79E60
        GOLONG  LNP115                           * 79E64

* refs (1): 2B755
* A/B -> atanh x
ATANH15:
        HST=0   3                                * 79E6A
        R4=A                                     * 79E6D
        A=0     S                                * 79E70
        GOSUB   STAB0~jump_5                     * 79E73
        A=-A-1  S                                * 79E77
        GOSUB   RADD1~jump_2                     * 79E7A
        ?B=0    M                                * 79E7E
        GOYES   ATANH15.L2                       * 79E81
        ?A=0    S                                * 79E83
        GOYES   ATANH15.L3                       * 79E86
ATANH15.L1:
        P=      4                                * 79E88
        RTNSXM                                   * 79E8A
ATANH15.L2:
        A=R4                                     * 79E8C
        P=      3                                * 79E8F
        RTNSXM                                   * 79E91
ATANH15.L3:
        GOSUB   RCCD0~jump_5                     * 79E93
        GOSUB   Y/X~jump                         * 79E97
        C=B     W                                * 79E9B
        D=C     W                                * 79E9E
        C=A     W                                * 79EA1
        GOSUB   SUB_79E60                        * 79EA4

* refs (1): 79DCC
SUB_79EA8:
        C=0     W                                * 79EA8
        D=0     W                                * 79EAB
        P=      14                               * 79EAE
        LC(1)   #5                               * 79EB0
        DCEX    P                                * 79EB3
        C=-C-1  A                                * 79EB6
        GOSUB   MULTF~jump_4                     * 79EB8
        C=R4                                     * 79EBC
        A=C     S                                * 79EBF
        RTN                                      * 79EC2

* refs (1): 2AF2C
%%H>HMS~1:
        GOSBVL  POP1%%                           * 79EC4
        GOSUB   SUB_79EE1                        * 79ECB
        GOSBVL  PACKSB                           * 79ECF
        GOSBVL  SPLITA                           * 79ED6
        GOSUB   SUB_79F34                        * 79EDD

* refs (1): 79ECB
SUB_79EE1:
        HST=0   3                                * 79EE1
        P=      14                               * 79EE4
        ?B=0    P                                * 79EE6
        RTNYES                                   * 79EE9
        A=A+1   A                                * 79EEB
        A=A+1   A                                * 79EED
        GOSBVL  FracPosChk                       * 79EEF
        ?P=     15                               * 79EF6
        GOYES   SUB_79EE1.L3                     * 79EF9
        P=P+1                                    * 79EFB
        ?P#     15                               * 79EFD
        GOYES   SUB_79EE1.L1                     * 79F00
        GOSUB   SUB_79F23                        * 79F02
        GOTO    SUB_79EE1.L2                     * 79F06
SUB_79EE1.L1:
        P=P+1                                    * 79F0A
        GOSUB   SUB_79F23                        * 79F0C
        P=P-1                                    * 79F10
SUB_79EE1.L2:
        P=P-1                                    * 79F12
        GOSUB   SUB_79F23                        * 79F14
SUB_79EE1.L3:
        A=A-1   A                                * 79F18
        A=A-1   A                                * 79F1A
        GOVLNG  MULTF.L5                         * 79F1C

* refs (3): 79F02 79F0C 79F14
SUB_79F23:
        C=B     WP                               * 79F23
        CSR     WP                               * 79F26
        C=C+C   WP                               * 79F29
        C=C+C   WP                               * 79F2C
        B=B-C   WP                               * 79F2F
        RTN                                      * 79F32

* refs (1): 79EDD
SUB_79F34:
        GOSUB   HMS>H15                          * 79F34

* refs (1): 35C04
SUB_79F38:
        C=0     W                                * 79F38
        P=      13                               * 79F3B
        LC(2)   #36                              * 79F3D
        D=C     W                                * 79F41
        C=C+1   A                                * 79F44
        C=C+1   A                                * 79F46
        C=C+1   A                                * 79F48
        GOVLNG  DIVF                             * 79F4A

* refs (2): 2B779 79F34
* A/B = H.MMSS -> decimal hours
HMS>H15:
        HST=0   3                                * 79F51
        GOSUB   SUB_79F58                        * 79F54

* refs (1): 79F54
SUB_79F58:
        GOSUB   STAB0~jump_5                     * 79F58
        GOSUB   CLRFRC~jump_2                    * 79F5C
        C=0     W                                * 79F60
        P=      14                               * 79F63
        LC(1)   #6                               * 79F65
        D=C     W                                * 79F68
        C=C+1   A                                * 79F6B
        GOSUB   MULTF~jump_4                     * 79F6D
        GOSBVL  EXAB0                            * 79F71
        GOSBVL  FP15                             * 79F78
        ?B=0    M                                * 79F7F
        GOYES   SUB_79F58.L1                     * 79F82
        A=A+1   A                                * 79F84
        A=A+1   A                                * 79F86
SUB_79F58.L1:
        GOSUB   RCCD0~jump_5                     * 79F88
        GOTO    RADDF~jump_4                     * 79F8C

* refs (1): 2B75E
* A/B -> ceiling
CEIL15:
        HST=0   3                                * 79F90
        GOSUB   CLRFRC~jump_2                    * 79F93
        RTNC                                     * 79F97
        ?A#0    S                                * 79F9A
        RTNYES                                   * 79F9D

* refs (5): 79DC0 79E0A 79E15 79E49 79E7A
RADD1~jump_2:
        GOVLNG  RADD1                            * 79F9F

* refs (1): 2B767
* A/B -> floor
FLOOR15:
        HST=0   3                                * 79FA6
        GOSUB   CLRFRC~jump_2                    * 79FA9
        RTNC                                     * 79FAD
        ?A=0    S                                * 79FB0
        RTNYES                                   * 79FB3

* refs (1): 79E34
RSUB1~jump:
        GOVLNG  RSUB1                            * 79FB5
        BSS     22                               * 79FBC

* refs (2): 2D19A 2D1F9
SUB_79FD2:
        CR2EX                                    * 79FD2
        P=C     15                               * 79FD5
        CR2EX                                    * 79FD9
        ?P#     15                               * 79FDC
        GOYES   SUB_79FD2.L1                     * 79FDF
        ?ST=0   0                                * 79FE1
        GOYES   SUB_79FD2.L3                     * 79FE4
        GONC    SUB_79FD2.L2                     * 79FE6
SUB_79FD2.L1:
        ?ST=0   1                                * 79FE9
        GOYES   SUB_79FD2.L3                     * 79FEC
SUB_79FD2.L2:
        RSTK=C                                   * 79FEE
        D0=(5)  =IR_16Hz_Clock                   * 79FF0
        C=DAT0  A                                * 79FF7
        D0=C                                     * 79FFA
        D0=(4)  #01DF                            * 79FFD
        C=RSTK                                   * 7A003
        DAT0=C  A                                * 7A005
        D0=D0+  5                                * 7A008
        D=C     S                                * 7A00B
        C=D     W                                * 7A00E
        DAT0=C  W                                * 7A011
        C=R0                                     * 7A015
        RSTK=C                                   * 7A018
        R4=C.F  S                                * 7A01A
        GOSBVL  LN15                             * 7A020
        C=R4                                     * 7A027
        C=RSTK                                   * 7A02A
        R0=C                                     * 7A02C
        D0=(5)  =IR_16Hz_Clock                   * 7A02F
        C=DAT0  A                                * 7A036
        D0=C                                     * 7A039
        D0=(4)  #01E4                            * 7A03C
        C=DAT0  W                                * 7A042
        D=C     W                                * 7A046
        D=0     S                                * 7A049
        D0=D0-  5                                * 7A04C
        C=DAT0  A                                * 7A04F
SUB_79FD2.L3:
        C=-C-1  S                                * 7A052
        GOSBVL  RADDF                            * 7A055
        C=R2                                     * 7A05C
        P=C     15                               * 7A05F
        ?P=     15                               * 7A063
        RTNYES                                   * 7A066
        GOSBVL  RCCD2                            * 7A068

* refs (1): 2D10B
* A/B * C/D is added to register 0
MulAcc15:
        GOSBVL  MULTF                            * 7A06F

* refs (1): 2D05A
* A/B is added to register 0
Acc15:
        GOSBVL  RCCD0                            * 7A076
        GOSBVL  RADDF                            * 7A07D
        GOVLNG  STAB0                            * 7A084

* refs (2): 2CCAF 902CF
* A.A -> A/B: a binary integer as a normalised 15-digit number
Hex>%%:
        GOSUB   Hex>BCD                          * 7A08B
        A=A-1   X                                * 7A08F
Hex>%%.loop1:
        A=A+1   X                                * 7A092
        BSRC                                     * 7A095
        ?B#0    WP                               * 7A098
        GOYES   Hex>%%.loop1                     * 7A09B
        BSR     W                                * 7A09D
        A=B     M                                * 7A0A0
        A=0     S                                * 7A0A3
        P=      0                                * 7A0A6
        RTN                                      * 7A0A8

* refs (5): 2CE52 87258 88592 CB065 CB0F8
* A.A -> A/B: as Hex>%%, exponent fixed at 14 before normalising
Hex>15:
        GOSUB   Hex>BCD                          * 7A0AA
        P=      0                                * 7A0AE
        LC(2)   #14                              * 7A0B0
        A=C     B                                * 7A0B4
        GOVLNG  SplitNormA.L2                    * 7A0B7

* refs (2): 7A08B 7A0AA
* C.A -> B = the same value in BCD; A.A used as the running power of two
Hex>BCD:
        SETDEC                                   * 7A0BE
        C=0     W                                * 7A0C0
        C=A     A                                * 7A0C3
        A=0     W                                * 7A0C5
        B=0     W                                * 7A0C8
        A=A+1   A                                * 7A0CB
        P=      6                                * 7A0CD
Hex>BCD.loop1:
        ?C=0    A                                * 7A0CF
        GOYES   Hex>BCD.L3                       * 7A0D2
        SB=0                                     * 7A0D4
        CSRB                                     * 7A0D7
        ?SB=0                                    * 7A0DA
        GOYES   Hex>BCD.L2                       * 7A0DD
        B=B+A   WP                               * 7A0DF
Hex>BCD.L2:
        A=A+A   WP                               * 7A0E2
        GONC    Hex>BCD.loop1                    * 7A0E5
Hex>BCD.L3:
        A=0     WP                               * 7A0E8
        RTN                                      * 7A0EB
        BSS     16                               * 7A0ED

* refs (1): 11E36
* A.A = two characters -> copy their glyphs of the current font (XM picks 10 or 8 rows) to the buffer at #1E1 and #1CD of the page in IRAM@
CharGlyph2:
        C=A     A                                * 7A0FD
        RSTK=C                                   * 7A0FF
        ASR     A                                * 7A101
        ASR     A                                * 7A103
        LC(4)   #01E1                            * 7A105
        GOSUB   CopyGlyph                        * 7A10B
        C=RSTK                                   * 7A10F
        A=C     A                                * 7A111
        GOSUB   CharGlyph1                       * 7A113
        B=C     A                                * 7A117
        LC(5)   #00014                           * 7A119
        C=C+B   A                                * 7A120
        BCEX    A                                * 7A122
        RTN                                      * 7A124

* refs (3): 11DD0 11EB1 7A113
* A.B = character -> copy its glyph to the buffer at #1CD of the page in IRAM@
CharGlyph1:
        LC(4)   #01CD                            * 7A126

* refs (1): 7A10B
* C.X = buffer offset, A.B = character: copy 20 nibbles of its glyph; codes below #1F use a fixed glyph
CopyGlyph:
        B=0     A                                * 7A12C
        B=A     B                                * 7A12E
        AD1EX                                    * 7A131
        ABEX    A                                * 7A134
        D1=(5)  IRAM@                            * 7A136
        P=      4                                * 7A13D
        C=DAT1  P                                * 7A13F
        D1=C                                     * 7A143
        P=      0                                * 7A146
        ?XM=0                                    * 7A148
        GOYES   CopyGlyph.L2                     * 7A14B
        LC(2)   #1F                              * 7A14D
        ?C<=A   B                                * 7A151
        GOYES   CopyGlyph.L1                     * 7A154
        LC(5)   Font10+2540                      * 7A156
        GONC    CopyGlyph.L4                     * 7A15D
CopyGlyph.L1:
        C=A     A                                * 7A160
        C=C+C   A                                * 7A162
        C=C+C   A                                * 7A164
        ASL     A                                * 7A166
        A=A+C   A                                * 7A168
        LC(5)   Font10-620                       * 7A16A
        C=C+A   A                                * 7A171
        GONC    CopyGlyph.L4                     * 7A173
CopyGlyph.L2:
        LC(2)   #1F                              * 7A176
        ?C<=A   B                                * 7A17A
        GOYES   CopyGlyph.L3                     * 7A17D
        LC(5)   Font8+2032                       * 7A17F
        GONC    CopyGlyph.L4                     * 7A186
CopyGlyph.L3:
        ASL     A                                * 7A189
        LC(5)   Font8-496                        * 7A18B
        C=C+A   A                                * 7A192
CopyGlyph.L4:
        A=C     A                                * 7A194
        AD1EX                                    * 7A196
        C=DAT1  A                                * 7A199
        D1=D1+  5                                * 7A19C
        AD1EX                                    * 7A19F
        DAT1=C  A                                * 7A1A2
        D1=D1+  5                                * 7A1A5
        AD1EX                                    * 7A1A8
        C=DAT1  A                                * 7A1AB
        D1=D1+  5                                * 7A1AE
        AD1EX                                    * 7A1B1
        DAT1=C  A                                * 7A1B4
        D1=D1+  5                                * 7A1B7
        AD1EX                                    * 7A1BA
        C=DAT1  A                                * 7A1BD
        D1=D1+  5                                * 7A1C0
        AD1EX                                    * 7A1C3
        DAT1=C  A                                * 7A1C6
        D1=D1+  5                                * 7A1C9
        AD1EX                                    * 7A1CC
        C=DAT1  A                                * 7A1CF
        D1=D1+  5                                * 7A1D2
        AD1EX                                    * 7A1D5
        DAT1=C  A                                * 7A1D8
        D1=D1-  15                               * 7A1DB
        C=B     A                                * 7A1DE
        CD1EX                                    * 7A1E0
        RTN                                      * 7A1E3
CopyGlyph.L5:
        LC(4)   #00F5                            * 7A1E5
        A=C     A                                * 7A1EB
        C=RSTK                                   * 7A1ED
        D1=C                                     * 7A1EF
        RTN                                      * 7A1F2

* refs (1): 12046
* A.B = character: one minifont glyph
MiniGlyph1:
        C=0     S                                * 7A1F4
        C=C+1   S                                * 7A1F7

* refs (1): 12146
* Minifont renderer: glyph = #7C102 + 11*index, codes above #9F remapped through the table at #7C793
* A = characters, C.S = how many: copy their minifont glyphs to the display line buffer
MiniGlyphs:
        P=      0                                * 7A1FA
        LC(5)   #0011B                           * 7A1FC
        CD1EX                                    * 7A203
        RSTK=C                                   * 7A206
        C=DAT1  A                                * 7A208
        LC(4)   #00F5                            * 7A20B
        D1=C                                     * 7A211
MiniGlyphs.loop1:
        C=C-1   S                                * 7A214
        GOC     CopyGlyph.L5                     * 7A217
        C=A     A                                * 7A21A
        A=0     A                                * 7A21C
        A=C     B                                * 7A21E
        RSTK=C                                   * 7A221
        LC(2)   #1F                              * 7A223
        ?C<=A   B                                * 7A227
        GOYES   MiniGlyphs.L2                    * 7A22A
        LC(5)   Minifont+1111                    * 7A22C  minifont glyph for codes below #20
        A=C     A                                * 7A233
        GONC    MiniGlyphs.L6                    * 7A235
MiniGlyphs.L2:
        LC(2)   #9F                              * 7A238
        ?C>=A   B                                * 7A23C
        GOYES   MiniGlyphs.L3                    * 7A23F
        A=A-C   B                                * 7A241
        LC(5)   MiniRemap                        * 7A244
        C=C+A   A                                * 7A24B
        C=C+A   A                                * 7A24D
        CD1EX                                    * 7A24F
        A=DAT1  B                                * 7A252
        CD1EX                                    * 7A255
        GOTO    MiniGlyphs.L5                    * 7A258
MiniGlyphs.L3:
        LC(2)   #61                              * 7A25C
        ?C>A    B                                * 7A260
        GOYES   MiniGlyphs.L5                    * 7A263
        LC(2)   #7B                              * 7A265
        ?C>A    B                                * 7A269
        GOYES   MiniGlyphs.L4                    * 7A26C
        LC(2)   #1A                              * 7A26E
        A=A-C   B                                * 7A272
        GONC    MiniGlyphs.L5                    * 7A275
MiniGlyphs.L4:
        LC(2)   #20                              * 7A278
        A=A-C   B                                * 7A27C
MiniGlyphs.L5:
        C=A     A                                * 7A27F
        C=C+C   A                                * 7A281
        C=C+C   A                                * 7A283
        C=C+A   A                                * 7A285
        C=C+C   A                                * 7A287
        A=A+C   A                                * 7A289
        LC(5)   Minifont-341                     * 7A28B  minifont glyph i = #7C102 + 11*i
        A=A+C   A                                * 7A292
MiniGlyphs.L6:
        AD1EX                                    * 7A294
        C=DAT1  11                               * 7A297
        D1=A                                     * 7A29B
        DAT1=C  11                               * 7A29E
        D1=D1+  11                               * 7A2A2
        C=RSTK                                   * 7A2A5
        A=C     A                                * 7A2A7
        ASR     W                                * 7A2A9
        ASR     W                                * 7A2AC
        GOTO    MiniGlyphs.loop1                 * 7A2AF
