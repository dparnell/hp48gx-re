* HP 48GX ROM revision R, #78002-#7A2B2: not yet identified
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #78002 in the original ROM).
        GOSUB   L_787E6                          * 78002
        GOSUB   RCCD0~jump_787ED                 * 78006
        GOSUB   L_78760                          * 7800A
        GOSUB   STAB0~jump_78751                 * 7800E
        GOSUB   SUB_786C7                        * 78012
        GOSUB   SUB_785D6                        * 78016
        GOSUB   SUB_78772                        * 7801A
        GOSUBL  EXAB2~jump                       * 7801E
        GOSUB   SUB_78688                        * 78024
        GOSUB   SUB_78605                        * 78028
        GOSUB   L_787E6                          * 7802C
        GOSUB   RCCD2~jump_7870C                 * 78030
        GOSUB   L_78760                          * 78034
        GOSUB   STAB2~jump_786FD                 * 78038
        GOTO    L_77FB5                          * 7803C
        NIBHEX  7F15                             * 78040  ÷Q

* refs (1): 785A7
SUB_78044:
        GOLONG  L_789E8                          * 78044

* refs (1): 77EC0
SUB_7804A:
        GOSUB   SUB_7806A                        * 7804A
        GOSUB   SUB_78740                        * 7804E
        P=      0                                * 78052
        LC(16)  #0398942280401432                * 78054
        GOTO    L_78519                          * 78066

* refs (3): 77F0C 7804A 78947
SUB_7806A:
        C=B     W                                * 7806A
        D=C     W                                * 7806D
        C=A     W                                * 78070
        GOTO    L_78776                          * 78073

* refs (2): 2C1A9 782A4
SUB_78077:
        ST=1    1                                * 78077
        GOSUB   SUB_78591                        * 7807A
        GOSUBL  SUB_7897B                        * 7807E
        GOSUB   STAB2~jump_786FD                 * 78084
        GOSUB   SUB_787F4                        * 78088
        GOSUB   SUB_78534                        * 7808C
        A=R4                                     * 78090
        GOSUB   SUB_78524                        * 78093
        C=0     A                                * 78097
        GOSUBL  SUB_788AA                        * 78099
        GOC     L_78108                          * 7809F
        A=0     A                                * 780A2
        D1=A                                     * 780A4
L_780A7:
        GOSUB   SUB_7878C                        * 780A7
        C=C-1   A                                * 780AB
        GOSUB   SUB_787B7                        * 780AD
        GOSUB   SUB_786ED                        * 780B1
        GOSUB   SUB_786C7                        * 780B5
        GOSUB   SUB_787BF                        * 780B9
        GOSUB   SUB_787C7                        * 780BD
        GOSUB   SUB_786ED                        * 780C1
        GOSUB   STAB2~jump_786FD                 * 780C5
        GOSUB   SUB_78820                        * 780C9
        GOSUB   SUB_786C7                        * 780CD
        GOSUB   SUB_7857E                        * 780D1
        GOSUB   SUB_78717                        * 780D5
        GONC    L_780A7                          * 780D9
        GOSUB   SUB_78820                        * 780DC
        GOSUB   SUB_78865                        * 780E0
        GOSUB   SUB_78838                        * 780E4
        CD1EX                                    * 780E8
        ?C=0    A                                * 780EB
        GOYES   L_780FC                          * 780EE
        GOSUB   SUB_787DA                        * 780F0
        GOSUB   SUB_78505                        * 780F4
        GOTO    L_78100                          * 780F8
L_780FC:
        GOSUB   L_7856F                          * 780FC
L_78100:
        GOSUB   DIV2~jump~jump                   * 78100
        GOTO    L_77F83                          * 78104
L_78108:
        GOSUBL  SUB_78943                        * 78108
        GOSUB   SQRF~jump                        * 7810E
        GOSUB   SUB_7874D                        * 78112
        GOSUB   SUB_7887F                        * 78116
        C=C-1   A                                * 7811A
        ?C#0    A                                * 7811C
        GOYES   L_78125                          * 7811F
        GOSUB   SUB_78534                        * 78121
L_78125:
        GOSUB   SUB_78838                        * 78125
        CD1EX                                    * 78129
        ?C=0    A                                * 7812C
        GOYES   L_78153                          * 7812F
        GOSUBL  L_7893C                          * 78131
        ST=1    9                                * 78137
        ST=0    4                                * 7813A
        GOSUBL  L_79AF5                          * 7813D
        GOSUB   SUB_787C7                        * 78143
        GOSUB   SUB_78405                        * 78147
        GOSUB   SUB_78505                        * 7814B
        GOTO    L_78157                          * 7814F
L_78153:
        GOSUB   SUB_787DA                        * 78153
L_78157:
        ?ST=1   0                                * 78157
        GOYES   L_7815F                          * 7815A
        A=-A-1  S                                * 7815C
L_7815F:
        GOSUB   RADD1~jump                       * 7815F

* refs (1): 78100
DIV2~jump~jump:
        GOTO    DIV2~jump                        * 78163

* refs (1): 2C14E
utpn(2r)~1:
        GOSUB   SUB_78411                        * 78167
        GOSUB   SUB_78797                        * 7816B
        GOSUB   SUB_77EBC                        * 7816F
        GOSUBL  SUB_78A18                        * 78173
        GOSUB   STAB0~jump_78751                 * 78179
        GOSUB   SUB_7862F                        * 7817D
        GOSUB   SUB_7868E                        * 78181
        GOSUB   XYEX~jump_78438                  * 78185
        GOSUB   SUB_78664                        * 78189
        GOSUB   SUB_78829                        * 7818D
        GONC    L_78198                          * 78191
L_78194:
        GOTO    L_7856F                          * 78194
L_78198:
        GOSUB   SUB_78591                        * 78198
        A=C     W                                * 7819C
        GOSUB   SUB_78531                        * 7819F
        GOSUB   SUB_787F4                        * 781A3
        LC(1)   #4                               * 781A7
        GOSUB   SUB_788AA                        * 781AA
        GONC    L_78194                          * 781AE
        GOSUB   SUB_7890D                        * 781B1
        GOSUB   SUB_788A7                        * 781B5
        GONC    L_781EE                          * 781B9
        GOSUB   SUB_78809                        * 781BC
        C=0     A                                * 781C0
        GOC     L_781C7                          * 781C2
        C=C+1   A                                * 781C5
L_781C7:
        D1=C                                     * 781C7
        GOSUB   SUB_7873C                        * 781CA
        GOSUB   SUB_7874D                        * 781CE
L_781D2:
        GOSUB   SUB_7878C                        * 781D2
        GOSUB   SUB_78820                        * 781D6
        CAEX    W                                * 781DA
        GOSUB   SUB_78453                        * 781DD
        ?C<=A   A                                * 781E1
        GOYES   L_7822B                          * 781E4
        GOSUB   SUB_7824E                        * 781E6
        GOTO    L_781D2                          * 781EA
L_781EE:
        GOSUB   SUB_7887F                        * 781EE
        GOSUB   SUB_783AA                        * 781F2
L_781F6:
        GOSUB   SUB_784F1                        * 781F6
        A=0     A                                * 781FA
        A=A+1   A                                * 781FC
        ?C<=A   A                                * 781FE
        GOYES   L_78217                          * 78201
        GOSUB   L_7856F                          * 78203
        GOSUB   SUB_783AA                        * 78207
        GOSUB   STAB2~jump_786FD                 * 7820B
        GOSUB   SUB_7824E                        * 7820F
        GOTO    L_781F6                          * 78213
L_78217:
        GOSUB   L_7856F                          * 78217
        GOSUB   STAB2~jump_786FD                 * 7821B
        GOSUB   SUB_7873C                        * 7821F
        GOSUB   SUB_786ED                        * 78223
        GOSUB   STAB0~jump_78751                 * 78227
L_7822B:
        GOSUB   SUB_78809                        * 7822B
        GOSUB   L_7856F                          * 7822F
        RTNC                                     * 78233
        GOSUB   SUB_78899                        * 78236
        GOSUB   SUB_78505                        * 7823A
        GOSUB   SUB_787DE                        * 7823E

* refs (2): 78305 78329
SUB_78242:
        GOSUB   SUB_7862F                        * 78242
        GOTO    L_78760                          * 78246

* refs (1): 77E97
SPLITA~jump~jump:
        GOTO    SPLITA~jump_788A0                * 7824A

* refs (2): 781E6 7820F
SUB_7824E:
        GOSUB   SUB_78899                        * 7824E
        GOSUB   SUB_786C7                        * 78252
        GOSUB   SUB_786E9                        * 78256
        GOSUB   STAB2~jump_786FD                 * 7825A
        GOSUB   SUB_7875C                        * 7825E
        GOTO    STAB0~jump_78751                 * 78262

* refs (1): 7880D
SUB_78266:
        GOSUB   SPLITA~jump_788A0                * 78266

* refs (2): 78163 78740
DIV2~jump:
        GOVLNG  DIV2                             * 7826A
L_78271:
        GOSUB   SUB_78396                        * 78271
        GOSUB   SUB_784FD                        * 78275
        GOTO    L_78350                          * 78279

* refs (1): 2C179
utpf(3r)~1:
        GOSUB   SUB_785BE                        * 7827D
        GOSUBL  SUB_78987                        * 78281
        GOSUB   SUB_78670                        * 78287
        A=B     M                                * 7828B
        R1=A                                     * 7828E
        GOSUB   SUB_78411                        * 78291
        GOSUB   SUB_78829                        * 78295
        GONC    L_782B7                          * 78299
        GOSUB   SUB_78955                        * 7829C
        GOSUB   SUB_78797                        * 782A0
        GOSUB   SUB_78077                        * 782A4
        ST=0    1                                * 782A8
        GOSUB   SUB_786F5                        * 782AB
        GOSUB   SUB_78955                        * 782AF
        GOTO    L_7893C                          * 782B3
L_782B7:
        ST=0    1                                * 782B7
        GOSUB   SUB_7880D                        * 782BA
        GOC     L_78271                          * 782BE
        A=R1                                     * 782C1
        GOSUB   SUB_7880D                        * 782C4
        GOC     L_7832D                          * 782C8
        GOSUB   SUB_788E4                        * 782CB
        GOC     L_782D6                          * 782CF
        GOTO    L_78473                          * 782D2
L_782D6:
        GOSUB   SUB_7888E                        * 782D6
        ST=1    9                                * 782DA
        ST=0    4                                * 782DD
        GOSUBL  L_79AF5                          * 782E0
        GOSUB   SUB_7868E                        * 782E6
        GOSUB   SUB_784E2                        * 782EA
        GOSUB   SUB_7882D                        * 782EE
        GONC    L_782F9                          * 782F2
        GOSUB   SUB_78531                        * 782F5
L_782F9:
        GOSUB   SUB_78838                        * 782F9
        GOSUB   SUB_7888E                        * 782FD
        GOSUB   SUB_784A2                        * 78301
        GOSUB   SUB_78242                        * 78305
        GOSUB   SUB_78505                        * 78309
        GOSUB   L_7838C                          * 7830D
        GOSUB   SUB_7868E                        * 78311
        GOSUB   SUB_78396                        * 78315
        GOSUB   SUB_785BE                        * 78319
        GOSUB   SUB_787E2                        * 7831D
        GOSUB   STAB0~jump_78751                 * 78321
        GOSUB   L_78492                          * 78325
        GOTO    SUB_78242                        * 78329
L_7832D:
        GOSUB   SUB_788E4                        * 7832D
        GOC     L_78380                          * 78331
        GOSUB   SUB_784B2                        * 78334
        GOSUB   SUB_7885E                        * 78338
        GOSUB   L_7839A                          * 7833C

* refs (1): 78388
SUB_78340:
        GOSUB   SUB_7843F                        * 78340
        GOSUB   STAB2~jump_786FD                 * 78344
        GOSUB   RADD1~jump                       * 78348
        GOSUB   SUB_78582                        * 7834C
L_78350:
        C=R0                                     * 78350
        R4=C                                     * 78353
        GOSUB   XYEX~jump_78438                  * 78356
        GOSUB   SUB_785B8                        * 7835A
        ?ST=1   3                                * 7835E
        GOYES   L_78367                          * 78361
        GOSUB   SUB_785BE                        * 78363
L_78367:
        GOSUB   XYEX~jump_78438                  * 78367
        GOSUBL  L_79303                          * 7836B
        GOSUB   SQRF~jump                        * 78371
        GOSUB   RCCD0~jump_787ED                 * 78375
        C=R4                                     * 78379
        GOTO    L_787E6                          * 7837C
L_78380:
        GOSUB   SUB_784E2                        * 78380
        GOSUB   L_7839A                          * 78384
        GOSUB   SUB_78340                        * 78388
L_7838C:
        A=-A-1  S                                * 7838C

* refs (3): 7815F 78348 787CF
RADD1~jump:
        GOVLNG  RADD1                            * 7838F

* refs (2): 78271 78315
SUB_78396:
        GOSUB   SUB_78878                        * 78396
L_7839A:
        GOSUB   SUB_787A3                        * 7839A
        GOSUB   SUB_7853C                        * 7839E
        GOSUB   SUB_783B6                        * 783A2
        GOTO    L_7839A                          * 783A6

* refs (4): 781F2 78207 784E5 78878
SUB_783AA:
        GOSUB   SUB_787F4                        * 783AA
        GOSUB   SUB_78534                        * 783AE
        GOTO    L_78870                          * 783B2

* refs (2): 783A2 7848A
SUB_783B6:
        GOSUB   XYEX~jump_78438                  * 783B6
        ?ST=1   3                                * 783BA
        GOYES   L_783C7                          * 783BD
        GOSUB   SUB_785BE                        * 783BF
        GOTO    L_783CB                          * 783C3
L_783C7:
        GOSUB   SUB_785B8                        * 783C7
L_783CB:
        GOSUB   L_78760                          * 783CB

* refs (1): 78856
SUB_783CF:
        GOSUB   SUB_786C7                        * 783CF
        GOSUB   SUB_787BF                        * 783D3
        GOSUB   SUB_787E2                        * 783D7
        GOSUB   STAB0~jump_78751                 * 783DB
        ?ST=1   1                                * 783DF
        GOYES   L_783FD                          * 783E2
        ?ST=1   3                                * 783E4
        GOYES   L_783F5                          * 783E7
        GOSUB   SUB_7843F                        * 783E9
        GOSUB   SUB_787E2                        * 783ED
        GOSUB   STAB0~jump_78751                 * 783F1
L_783F5:
        GOSUB   SUB_7843F                        * 783F5
        GOTO    L_78401                          * 783F9
L_783FD:
        GOSUB   SUB_78943                        * 783FD
L_78401:
        GOSUB   SUB_787CF                        * 78401

* refs (1): 78147
SUB_78405:
        GOSUB   SUB_787E2                        * 78405
        GOSUB   SUB_78576                        * 78409
        GOTO    STAB0~jump_78751                 * 7840D

* refs (2): 78167 78291
SUB_78411:
        GOSUB   SUB_78591                        * 78411
        GOSUB   SUB_7868E                        * 78415
        GOSUB   SUB_785B8                        * 78419
        GOSUB   SUB_78987                        * 7841D
        GOSUB   SUB_7866A                        * 78421
        C=R4                                     * 78425
        ?C=0    M                                * 78428
        GOYES   L_78432                          * 7842B
        ?ST=0   0                                * 7842D
        RTNYES                                   * 78430
L_78432:
        C=RSTK                                   * 78432
        GOSUB   SUB_78466                        * 78434

* refs (8): 77FD0 78185 78356 78367 783B6 78586 ...
XYEX~jump_78438:
        GOVLNG  XYEX                             * 78438

* refs (6): 78340 783E9 783F5 784FD 7888E 78903
SUB_7843F:
        GOSUB   SUB_785B8                        * 7843F
        GOSUB   SUB_78611                        * 78443
        GOSUB   L_7858A                          * 78447
        GOSUB   SUB_78605                        * 7844B
        GOTO    L_787E6                          * 7844F

* refs (2): 781DD 78886
SUB_78453:
        P=      0                                * 78453
        CPEX    0                                * 78455
        CSLC                                     * 78459
L_7845C:
        CSLC                                     * 7845C
        P=P-1                                    * 7845F
        GONC    L_7845C                          * 78461
        RTN                                      * 78464

* refs (1): 78434
SUB_78466:
        C=0     W                                * 78466
        P=      14                               * 78469
        LC(1)   #1                               * 7846B
        D=C     W                                * 7846E
        RTN                                      * 78471
L_78473:
        GOSUB   SUB_784B2                        * 78473
        GOSUB   SUB_7886D                        * 78477
        GOSUB   SUB_7887C                        * 7847B
L_7847F:
        GOSUB   SUB_784F1                        * 7847F
        GOC     L_78492                          * 78483
        GOSUB   SUB_787B7                        * 78486
        GOSUB   SUB_783B6                        * 7848A
        GOTO    L_7847F                          * 7848E
L_78492:
        GOSUB   SUB_7885E                        * 78492
        GOSUB   SUB_78838                        * 78496
        GOSUB   SUB_7888E                        * 7849A
        GOSUB   SUB_78505                        * 7849E

* refs (1): 78301
SUB_784A2:
        GOSUB   SUB_787E2                        * 784A2
        GOSUB   STAB0~jump_78751                 * 784A6
        GOSUB   SUB_784FD                        * 784AA
        GOTO    SUB_787E2                        * 784AE

* refs (2): 78334 78473
SUB_784B2:
        GOSUB   SUB_784E2                        * 784B2
L_784B6:
        GOSUB   SUB_785B8                        * 784B6
        GOSUB   SUB_786C7                        * 784BA
        GOSUB   SUB_78782                        * 784BE
        R4=C                                     * 784C2
        GOSUB   SUB_784FD                        * 784C5
        GOSUB   SUB_786ED                        * 784C9
        GOSUB   SUB_786C3                        * 784CD
        GOSUB   SUB_787BF                        * 784D1
        GOSUB   SUB_7876F                        * 784D5
        GOSUB   SUB_78713                        * 784D9
        GONC    L_784B6                          * 784DD
        RTN                                      * 784E0

* refs (3): 782EA 78380 784B2
SUB_784E2:
        ST=1    3                                * 784E2
        GOSUB   SUB_783AA                        * 784E5
        GOSUB   SUB_78818                        * 784E9
        GOTO    L_78883                          * 784ED

* refs (3): 781F6 7847F 787A3
SUB_784F1:
        CD1EX                                    * 784F1
        C=C-1   A                                * 784F4
        C=C-1   A                                * 784F6
L_784F8:
        D1=C                                     * 784F8
        RTN                                      * 784FB

* refs (3): 78275 784AA 784C5
SUB_784FD:
        GOSUB   SUB_7843F                        * 784FD
        GOTO    SUB_787CF                        * 78501

* refs (5): 780F4 7814B 7823A 78309 7849E
SUB_78505:
        P=      0                                * 78505
        LC(16)  #0636619772367581                * 78507
L_78519:
        D=C     W                                * 78519
        C=0     A                                * 7851C
        C=C-1   A                                * 7851E
        GOTO    L_78776                          * 78520

* refs (5): 77F67 78093 78936 78987 789A1
SUB_78524:
        C=0     W                                * 78524
        P=      14                               * 78527
        LC(1)   #5                               * 78529
        C=C-1   X                                * 7852C
        RTN                                      * 7852F

* refs (3): 7819F 782F5 78847
SUB_78531:
        C=0     W                                * 78531

* refs (3): 7808C 78121 783AE
SUB_78534:
        R0=C                                     * 78534
        R1=C                                     * 78537
        RTN                                      * 7853A

* refs (1): 7839E
SUB_7853C:
        GOSUB   SUB_7890D                        * 7853C
        C=-C-1  S                                * 78540
L_78543:
        GOTO    L_7854E                          * 78543
        NIBHEX  BCC                              * 78547  Ë

* refs (1): 7857E
SUB_7854A:
        GOSUB   SPLITA~jump_788A0                * 7854A
L_7854E:
        GOSUB   SUB_78556                        * 7854E
        GOTO    L_78760                          * 78552

* refs (6): 7854E 78567 78772 78782 787BF 7898B
SUB_78556:
        GOVLNG  SUB_2BCAC                        * 78556
        C=R4                                     * 7855D
        A=C     W                                * 78560
        GOSUB   SPLITA~jump_788A0                * 78563
        GOSUB   SUB_78556                        * 78567
        GOTO    L_787E6                          * 7856B
L_7856F:
        GOVLNG  RCAB0                            * 7856F

* refs (1): 78409
SUB_78576:
        GOSUB   RCCD2~jump_7870C                 * 78576
        GOTO    L_78760                          * 7857A

* refs (1): 780D1
SUB_7857E:
        GOSUB   SUB_7854A                        * 7857E

* refs (1): 7834C
SUB_78582:
        GOSUB   RCCD2~jump_7870C                 * 78582
        GOSUB   XYEX~jump_78438                  * 78586
L_7858A:
        GOVLNG  DIVF                             * 7858A

* refs (4): 77EBC 7807A 78198 78411
SUB_78591:
        GOSUB   L_785B2                          * 78591
        ST=0    0                                * 78595
        ?A=0    S                                * 78598
        GOYES   L_785A3                          * 7859B
        A=0     S                                * 7859D
        ST=1    0                                * 785A0
L_785A3:
        GOSUB   STAB2~jump_786FD                 * 785A3
        GOSUB   SUB_78044                        * 785A7
        R4=C                                     * 785AB
        GOTO    SUB_78664                        * 785AE
L_785B2:
        P=      0                                * 785B2
        GOTO    L_785EA                          * 785B4

* refs (12): 7835A 783C7 78419 7843F 784B6 78820 ...
SUB_785B8:
        P=      1                                * 785B8
        GOTO    L_785EA                          * 785BA

* refs (8): 7827D 78319 78363 783BF 78818 9941B ...
SUB_785BE:
        P=      2                                * 785BE
        GOTO    L_785EA                          * 785C0

* refs (1): 99406
SUB_785C4:
        P=      3                                * 785C4
        GOTO    L_785EA                          * 785C6

* refs (4): 993B3 995E2 9977F 99A45
SUB_785CA:
        P=      4                                * 785CA
        GOTO    L_785EA                          * 785CC

* refs (1): 77FEC
SUB_785D0:
        P=      5                                * 785D0
        GOTO    L_785EA                          * 785D2

* refs (1): 78016
SUB_785D6:
        P=      6                                * 785D6
        GOTO    L_785EA                          * 785D8
        NIBHEX  286B002965002A                   * 785DC  ∇¶.δV.¢
L_785EA:
        D0=(5)  #800E0                           * 785EA
L_785F1:
        D0=D0+  16                               * 785F1
        D0=D0+  5                                * 785F4
        P=P-1                                    * 785F7
        GONC    L_785F1                          * 785F9
        P=      0                                * 785FC
        GOVLNG  GETAB0                           * 785FE

* refs (11): 77EF8 77FFE 78028 7844B 7DA24 99640 ...
SUB_78605:
        P=      0                                * 78605
        GOTO    L_78649                          * 78607

* refs (5): 7894D 998A0 99B78 99B9A 99BFD
SUB_7860B:
        P=      1                                * 7860B
        GOTO    L_78649                          * 7860D

* refs (10): 78443 78959 994D6 995F0 99683 998C7 ...
SUB_78611:
        P=      2                                * 78611
        GOTO    L_78649                          * 78613

* refs (7): 77FC8 7DAC5 994AC 998B5 9993B 99A12 ...
SUB_78617:
        P=      3                                * 78617
        GOTO    L_78649                          * 78619

* refs (6): 77FB9 99490 99977 99A9C 99D84 99E49
SUB_7861D:
        P=      4                                * 7861D
        GOTO    L_78649                          * 7861F

* refs (4): 7DA32 994C1 99749 999F4
SUB_78623:
        P=      5                                * 78623
        GOTO    L_78649                          * 78625

* refs (4): 998DA 99913 99B58 99B6D
SUB_78629:
        P=      6                                * 78629
        GOTO    L_78649                          * 7862B

* refs (2): 7817D 78242
SUB_7862F:
        P=      7                                * 7862F
        GOTO    L_78649                          * 78631
        NIBHEX  286110296B002A65002B             * 78635  ∇..δ¶.¢V.²
L_78649:
        D0=(5)  #800E0                           * 78649
L_78650:
        D0=D0+  16                               * 78650
        D0=D0+  5                                * 78653
        P=P-1                                    * 78656
        GONC    L_78650                          * 78658
        P=      0                                * 7865B
        GOVLNG  GETCD0                           * 7865D

* refs (8): 78189 785AE 7879F 993EE 995FE 997FA ...
SUB_78664:
        P=      0                                * 78664
        GOTO    L_786A8                          * 78666

* refs (5): 78421 78965 78983 993FF 99883
SUB_7866A:
        P=      1                                * 7866A
        GOTO    L_786A8                          * 7866C

* refs (7): 78287 7895D 99426 994EB 99778 99AAE ...
SUB_78670:
        P=      2                                * 78670
        GOTO    L_786A8                          * 78672

* refs (3): 77FAD 77FCC 99414
SUB_78676:
        P=      3                                * 78676
        GOTO    L_786A8                          * 78678

* refs (6): 77FB1 77FD4 99433 9949E 99793 99AA3
SUB_7867C:
        P=      4                                * 7867C
        GOTO    L_786A8                          * 7867E

* refs (3): 77F94 77FFA 994CF
SUB_78682:
        P=      5                                * 78682
        GOTO    L_786A8                          * 78684

* refs (6): 77FA1 78024 9988E 998E5 9992C 99B13
SUB_78688:
        P=      6                                * 78688
        GOTO    L_786A8                          * 7868A

* refs (4): 78181 782E6 78311 78415
SUB_7868E:
        P=      7                                * 7868E
        GOTO    L_786A8                          * 78690
        NIBHEX  286110296B002A65002B             * 78694  ∇..δ¶.¢V.²
L_786A8:
        D0=(5)  #800E0                           * 786A8
L_786AF:
        D0=D0+  16                               * 786AF
        D0=D0+  5                                * 786B2
        P=P-1                                    * 786B5
        GONC    L_786AF                          * 786B7
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
SUB_786CD:
        P=      15                               * 786CD
        D=C     A                                * 786CF
        C=0     W                                * 786D1
        C=D     A                                * 786D4
L_786D6:
        CSRC                                     * 786D6
        P=P+1                                    * 786D9
        ?C#0    A                                * 786DB
        GOYES   L_786D6                          * 786DE
        CSR     W                                * 786E0
        CPEX    0                                * 786E3
        RTN                                      * 786E7

* refs (2): 77F26 78256
SUB_786E9:
        GOSUB   SUB_787BF                        * 786E9

* refs (4): 780B1 780C1 78223 784C9
SUB_786ED:
        GOSUB   RCCD2~jump_7870C                 * 786ED
        GOTO    L_787E6                          * 786F1

* refs (1): 782AB
SUB_786F5:
        GOSUB   SUB_7890D                        * 786F5
        GOSUB   SUB_78772                        * 786F9

* refs (12): 77F2E 78038 78084 780C5 7820B 7821B ...
STAB2~jump_786FD:
        GOVLNG  STAB2                            * 786FD
        NIBHEX  7A817360                         * 78704  §.7.

* refs (6): 77F2A 77F7B 78030 78576 78582 786ED
RCCD2~jump_7870C:
        GOVLNG  RCCD2                            * 7870C

* refs (1): 784D9
SUB_78713:
        GOSUB   STAB2~jump_786FD                 * 78713

* refs (1): 780D5
SUB_78717:
        GOSUB   SUB_7875C                        * 78717
        GOSUB   EXAB0~jump                       * 7871B
        GOSUB   RCCD0~jump_787ED                 * 7871F
        ?C#A    A                                * 78723
        GOYES   L_7873A                          * 78726
        ?C#A    S                                * 78728
        GOYES   L_7873A                          * 7872B
        DCEX    M                                * 7872D
        ?B=C    M                                * 78730
        GOYES   L_78735                          * 78733
L_78735:
        DCEX    M                                * 78735
        RTN                                      * 78738
L_7873A:
        RTNCC                                    * 7873A

* refs (2): 781CA 7821F
SUB_7873C:
        GOSUB   SUB_78899                        * 7873C

* refs (1): 7804E
SUB_78740:
        GOSUB   DIV2~jump                        * 78740
        A=-A-1  S                                * 78744
        GOLONG  L_78FCB                          * 78747

* refs (3): 77F02 78112 781CE
SUB_7874D:
        GOSUB   STAB2~jump_786FD                 * 7874D

* refs (11): 77EC4 7800E 78179 78227 78262 78321 ...
STAB0~jump_78751:
        GOVLNG  STAB0                            * 78751
        NIBHEX  7610                             * 78758  g.

* refs (2): 7825E 78717
SUB_7875C:
        GOSUB   RCCD0~jump_787ED                 * 7875C
L_78760:
        GOVLNG  RADDF                            * 78760
        NIBHEX  76EF7EED                         * 78767  gþçÞ

* refs (1): 784D5
SUB_7876F:
        C=R4                                     * 7876F

* refs (3): 77FF0 7801A 786F9
SUB_78772:
        GOSUB   SUB_78556                        * 78772
L_78776:
        GOTO    L_787E6                          * 78776

* refs (1): 78865
SUB_7877A:
        GOSUB   SUB_7890D                        * 7877A
        GOSUB   SPLITA~jump_788A0                * 7877E

* refs (1): 784BE
SUB_78782:
        GOSUB   SUB_78556                        * 78782
        GOLONG  L_7896C                          * 78786

* refs (3): 780A7 781D2 786C3
SUB_7878C:
        CD1EX                                    * 7878C
        C=C+1   A                                * 7878F
        C=C+1   A                                * 78791
        GOTO    L_784F8                          * 78793

* refs (2): 7816B 782A0
SUB_78797:
        GOSUB   L_785B2                          * 78797
        GOSUB   SQRF~jump                        * 7879B
        GOTO    SUB_78664                        * 7879F

* refs (2): 7839A 7884B
SUB_787A3:
        GOSUB   SUB_784F1                        * 787A3
        GOC     L_787B3                          * 787A7
        A=0     A                                * 787AA
        A=A+1   A                                * 787AC
        ?C>A    A                                * 787AE
        GOYES   SUB_787B7                        * 787B1
L_787B3:
        C=RSTK                                   * 787B3
        RTN                                      * 787B5

* refs (3): 780AD 78486 787AE
SUB_787B7:
        GOSUB   SUB_786CD                        * 787B7
        GOTO    L_7889D                          * 787BB

* refs (4): 780B9 783D3 784D1 786E9
SUB_787BF:
        GOSUB   SUB_78556                        * 787BF
        GOTO    L_7858A                          * 787C3

* refs (2): 780BD 78143
SUB_787C7:
        GOSUB   STAB2~jump_786FD                 * 787C7

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
        GOSUB   RCCD0~jump_787ED                 * 787E2
L_787E6:
        GOVLNG  MULTF                            * 787E6

* refs (6): 77F3A 78006 78375 7871F 7875C 787E2
RCCD0~jump_787ED:
        GOVLNG  RCCD0                            * 787ED

* refs (5): 77F98 78088 781A3 783AA 7882D
SUB_787F4:
        C=0     W                                * 787F4
        P=      14                               * 787F7
        LC(1)   #1                               * 787F9
        P=      0                                * 787FC
        RTN                                      * 787FE

* refs (1): 788F6
SUB_78800:
        GOSUB   SUB_7890D                        * 78800
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
        GOSUB   SUB_785BE                        * 78818
        GOTO    L_78824                          * 7881C

* refs (6): 780C9 780DC 781D6 78809 78829 7887F
SUB_78820:
        GOSUB   SUB_785B8                        * 78820
L_78824:
        A=B     M                                * 78824
        RTN                                      * 78827

* refs (2): 7818D 78295
SUB_78829:
        GOSUB   SUB_78820                        * 78829

* refs (1): 782EE
SUB_7882D:
        GOSUB   SUB_787F4                        * 7882D
        ?C=A    W                                * 78831
        RTNYES                                   * 78834
        RTN                                      * 78836

* refs (5): 780E4 78125 782F9 78496 7885A
SUB_78838:
        A=R0                                     * 78838
        A=A+A   A                                * 7883B
        GONC    L_7884B                          * 7883D
        P=      4                                * 78840
        ?A#0    P                                * 78842
        GOYES   L_7884B                          * 78845
        GOSUB   SUB_78531                        * 78847
L_7884B:
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
L_78870:
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
L_78883:
        C=A     W                                * 78883

* refs (1): 78869
SUB_78886:
        GOSUB   SUB_78453                        * 78886
        GOTO    L_784F8                          * 7888A

* refs (3): 782D6 782FD 7849A
SUB_7888E:
        GOSUB   SUB_7843F                        * 7888E

* refs (5): 7810E 78371 7879B 787DE 78917
SQRF~jump:
        GOVLNG  SQRF                             * 78892

* refs (3): 78236 7824E 7873C
SUB_78899:
        GOTO    L_785B2                          * 78899
L_7889D:
        A=C     W                                * 7889D

* refs (5): 7824A 78266 7854A 78563 7877E
SPLITA~jump_788A0:
        GOVLNG  SPLITA                           * 788A0

* refs (2): 77EE4 781B5
SUB_788A7:
        CAEX    W                                * 788A7

* refs (4): 78099 781AA 788EB 788FC
SUB_788AA:
        ?A#0    S                                * 788AA
        RTNYES                                   * 788AD
        ?C#0    S                                * 788AF
        GOYES   L_788DA                          * 788B2
        P=      0                                * 788B4
        BCEX    A                                * 788B6
        LC(3)   #500                             * 788B8
        BCEX    A                                * 788BD
        C=C+B   X                                * 788BF
        A=A+B   X                                * 788C2
        ?C>A    X                                * 788C5
        GOYES   L_788DC                          * 788C8
        ?C<A    X                                * 788CA
        GOYES   L_788D4                          * 788CD
        ?C>A    M                                * 788CF
        GOYES   L_788DC                          * 788D2
L_788D4:
        A=A-B   X                                * 788D4
        C=C-B   X                                * 788D7
L_788DA:
        RTNCC                                    * 788DA
L_788DC:
        A=A-B   X                                * 788DC
        C=C-B   X                                * 788DF
        RTNSC                                    * 788E2

* refs (2): 782CB 7832D
SUB_788E4:
        A=R4                                     * 788E4
        GOSUB   SUB_7890D                        * 788E7
        GOSUB   SUB_788AA                        * 788EB
        RTNC                                     * 788EF
        GOSUB   SUB_78818                        * 788F2
        GOSUB   SUB_78800                        * 788F6
        C=C+1   A                                * 788FA
        GOSUB   SUB_788AA                        * 788FC
        RTNNC                                    * 78900
        GOSUB   SUB_7843F                        * 78903
        C=A     A                                * 78907
        C=C+C   A                                * 78909
        RTN                                      * 7890B

* refs (6): 781B1 7853C 786F5 7877A 78800 788E7
SUB_7890D:
        C=0     W                                * 7890D
        P=      14                               * 78910
        LC(1)   #2                               * 78912
        RTN                                      * 78915
        GOSUB   SQRF~jump                        * 78917
        GOSUB   L_789E8                          * 7891B
        R4=C                                     * 7891F
        RTNCC                                    * 78922

* refs (4): 77F10 77F16 77FF4 7871B
EXAB0~jump:
        GOVLNG  EXAB0                            * 78924

* refs (2): 77F1C 7801E
EXAB2~jump:
        GOVLNG  EXAB2                            * 7892B
        GOSUB   STAB0~jump_78751                 * 78932
        GOSUB   SUB_78524                        * 78936
        P=      10                               * 7893A
L_7893C:
        GOVLNG  RCAB2                            * 7893C

* refs (3): 78108 783FD 787CB
SUB_78943:
        GOSUB   L_785B2                          * 78943
        GOSUBL  SUB_7806A                        * 78947
        GOSUB   SUB_7860B                        * 7894D
        GOTO    L_7858A                          * 78951

* refs (2): 7829C 782AF
SUB_78955:
        GOSUB   SUB_785B8                        * 78955
        GOSUB   SUB_78611                        * 78959
        GOSUB   SUB_78670                        * 7895D
        GOSUB   XYEX~jump_78438                  * 78961
        GOTO    SUB_7866A                        * 78965
        NIBHEX  BCC                              * 78969  Ë
L_7896C:
        GOSUB   RADDF~jump_789E1                 * 7896C
        GOTO    L_789E8                          * 78970
        NIBHEX  BCE64FF                          * 78974  Ënô

* refs (1): 7807E
SUB_7897B:
        GOSUB   SUB_785B8                        * 7897B
        GOSUB   SUB_78987                        * 7897F
        GOTO    SUB_7866A                        * 78983

* refs (3): 78281 7841D 7897F
SUB_78987:
        GOSUB   SUB_78524                        * 78987
        GOSUB   SUB_78556                        * 7898B
        GOSUB   RADDF~jump_789E1                 * 7898F
        GOSUB   CLRFRC~jump                      * 78993
        ?B=0    M                                * 78997
        GOYES   L_789BA                          * 7899A
        ?A#0    S                                * 7899C
        GOYES   L_789BA                          * 7899F
        GOSUB   SUB_78524                        * 789A1
        C=0     A                                * 789A5
        C=C+1   A                                * 789A7
        C=C+1   A                                * 789A9
        ?C<A    A                                * 789AB
        GOYES   L_789BA                          * 789AE
        ?C>A    A                                * 789B0
        RTNYES                                   * 789B3
        ?B<C    M                                * 789B5
        RTNYES                                   * 789B8
L_789BA:
        P=      0                                * 789BA
        LC(5)   #00203                           * 789BC
L_789C3:
        A=C     A                                * 789C3
        P=      0                                * 789C5
        SETHEX                                   * 789C7
        GOSBVL  GETPTR                           * 789C9
        GOVLNG  Errjmp                           * 789D0

* refs (2): 77FBF 77FDA
TST15~jump_789D7:
        GOVLNG  TST15                            * 789D7
        NIBHEX  BCE                              * 789DE  Ë

* refs (2): 7896C 7898F
RADDF~jump_789E1:
        GOVLNG  RADDF                            * 789E1
L_789E8:
        C=B     W                                * 789E8
        D=C     W                                * 789EB
        D0=A                                     * 789EE
        GOSBVL  SUB_29F76                        * 789F1
        CD0EX                                    * 789F8
        C=A     S                                * 789FB
        GOLONG  XYEX~jump_78438                  * 789FE
        NIBHEX  789E8CBF301107FEFBCC             * 78A04  πéÈû..pï¿Ì

* refs (1): 78173
SUB_78A18:
        GOVLNG  L_2BBD9                          * 78A18

* refs (1): 79BE8
SUB_78A1F:
        C=0     W                                * 78A1F
        C=-C-1  S                                * 78A22
        GONC    L_78A2B                          * 78A25

* refs (5): 78DCE 79151 7915B 7991E 79BDE
SUB_78A28:
        C=0     W                                * 78A28
L_78A2B:
        P=      14                               * 78A2B
        D=0     W                                * 78A2D
        D=D+1   P                                * 78A30

* refs (2): 79D0A 79D19
SUB_78A33:
        GOVLNG  L_2B7D3                          * 78A33

* refs (2): 2B674 79F78
SUB_78A3A:
        GOSUBL  SUB_7962B                        * 78A3A
        GONC    L_78A4F                          * 78A40
        ?A#0    B                                * 78A43
        RTNYES                                   * 78A46
        A=0     A                                * 78A48
        B=0     W                                * 78A4A
        RTN                                      * 78A4D
L_78A4F:
        GOSBVL  SUB_2BBFC                        * 78A4F
        P=P+1                                    * 78A56
L_78A58:
        P=P+1                                    * 78A58
        GOC     L_78A66                          * 78A5A
        BSL     W                                * 78A5D
        A=A-1   A                                * 78A60
        GOTO    L_78A58                          * 78A62
L_78A66:
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
        GOYES   L_78A84                          * 78A7F
        ST=0    9                                * 78A81
L_78A84:
        R0=C                                     * 78A84
        R1=A                                     * 78A87
        BCEX    W                                * 78A8A
        A=A-B   A                                * 78A8D
        ?D<=C   W                                * 78A8F
        GOYES   L_78A99                          * 78A92
        A=A-1   A                                * 78A94
        CSL     W                                * 78A96
L_78A99:
        B=A     A                                * 78A99
        B=B+B   A                                * 78A9B
        B=C     W                                * 78A9D
        DCEX    W                                * 78AA0
        GONC    L_78AC6                          * 78AA3
        A=R1                                     * 78AA6
        ?B=0    S                                * 78AA9
        GOYES   L_78AB1                          * 78AAC
        BSR     W                                * 78AAE
L_78AB1:
        D=C     W                                * 78AB1
        C=R0                                     * 78AB4
        ?ST=1   9                                * 78AB7
        RTNYES                                   * 78ABA
        GOVLNG  L_2B7D0                          * 78ABC
L_78AC3:
        BSL     W                                * 78AC3
L_78AC6:
        B=B-C   W                                * 78AC6
        GONC    L_78AC6                          * 78AC9
        B=B+C   W                                * 78ACC
        A=A-1   A                                * 78ACF
        GONC    L_78AC3                          * 78AD1
        ?ST=1   9                                * 78AD4
        GOYES   L_78AE1                          * 78AD7
        ?B=0    W                                * 78AD9
        GOYES   L_78AE1                          * 78ADC
        B=C-B   W                                * 78ADE
L_78AE1:
        A=R0                                     * 78AE1

* refs (2): 78A66 79CF8
SUB_78AE4:
        GOVLNG  L_2BC7E                          * 78AE4
L_78AEB:
        A=0     S                                * 78AEB
        B=0     S                                * 78AEE
        C=0     A                                * 78AF1
        C=C+1   A                                * 78AF3
        C=C+1   A                                * 78AF5
        ?C>=A   A                                * 78AF7
        GOYES   L_78B0D                          * 78AFA
        A=0     W                                * 78AFC
        A=A+1   M                                * 78AFF
        B=0     W                                * 78B02
        B=B+1   A                                * 78B05
        BSR     A                                * 78B07
        GOTO    L_78BB4                          * 78B09
L_78B0D:
        BSR     W                                * 78B0D
L_78B10:
        A=A-1   A                                * 78B10
        GOC     L_78B1B                          * 78B12
        BSL     W                                * 78B15
        GONC    L_78B10                          * 78B18
L_78B1B:
        SB=0                                     * 78B1B
        D=0     W                                * 78B1E
        C=0     W                                * 78B21
        P=      14                               * 78B24
        C=C+1   P                                * 78B26
        BCEX    W                                * 78B29
L_78B2C:
        ?B=0    S                                * 78B2C
        GOYES   L_78B41                          * 78B2F
        C=C+1   A                                * 78B31
        P=      0                                * 78B33
        B=B+B   P                                * 78B35
        BSR     W                                * 78B38
        GONC    L_78B41                          * 78B3B
        B=B+1   W                                * 78B3E
L_78B41:
        A=0     W                                * 78B41
        P=      13                               * 78B44
        D=D-C   P                                * 78B46
        GONC    L_78B55                          * 78B49
L_78B4C:
        A=A+B   W                                * 78B4C
        D=D+1   P                                * 78B4F
        GONC    L_78B4C                          * 78B52
L_78B55:
        P=      14                               * 78B55
        D=D-C   P                                * 78B57
        GONC    L_78B67                          * 78B5A
        DSL     W                                * 78B5D
        GOSUB   SUB_78BB9                        * 78B60
        GOC     L_78B71                          * 78B64
L_78B67:
        ?C=0    S                                * 78B67
        GOYES   L_78B7B                          * 78B6A
        ASR     W                                * 78B6C
        C=C+1   A                                * 78B6F
L_78B71:
        D=D-C   S                                * 78B71
        GONC    L_78B7B                          * 78B74
        GOSUB   SUB_78BB9                        * 78B77
L_78B7B:
        ABEX    W                                * 78B7B
        P=      13                               * 78B7E
        C=C-1   P                                * 78B80
        GONC    L_78B2C                          * 78B83
        P=      14                               * 78B86
        C=C-1   P                                * 78B88
        GONC    L_78B2C                          * 78B8B
        C=C-1   S                                * 78B8E
        GONC    L_78B2C                          * 78B91
        B=0     W                                * 78B94
        ABEX    WP                               * 78B97
        A=C     A                                * 78B9A
        P=      0                                * 78B9C
        LC(5)   #00300                           * 78B9E
        ?C=A    A                                * 78BA5
        GOYES   L_78BB4                          * 78BA8
        LC(3)   #234                             * 78BAA
        ?C#A    A                                * 78BAF
        RTNYES                                   * 78BB2
L_78BB4:
        B=B-1   M                                * 78BB4
        RTNSC                                    * 78BB7

* refs (2): 78B60 78B77
SUB_78BB9:
        C=C+1   A                                * 78BB9
        P=      0                                * 78BBB
        A=A+A   P                                * 78BBD
        ASR     W                                * 78BC0
        GONC    L_78BC9                          * 78BC3
        A=A+1   W                                * 78BC6
L_78BC9:
        A=A+B   W                                * 78BC9
        D=D+1   S                                * 78BCC
        GONC    L_78BC9                          * 78BCF
        RTN                                      * 78BD2
L_78BD4:
        ST=1    9                                * 78BD4
        GOTO    L_78BDE                          * 78BD7
L_78BDB:
        ST=0    9                                * 78BDB
L_78BDE:
        HST=0   3                                * 78BDE
        GOSBVL  STCD0                            * 78BE1
        GOSUB   SUB_78D1D                        * 78BE8
        GOC     L_78BF9                          * 78BEC
L_78BEF:
        P=      0                                * 78BEF
        LC(2)   #18                              * 78BF1
        GOTO    L_78DFE                          * 78BF5
L_78BF9:
        GOSUBL  EXAB0~jump_79616                 * 78BF9
        GOSUB   SUB_78D1D                        * 78BFF
        GONC    L_78BEF                          * 78C03
        GOSUBL  EXAB0~jump_79616                 * 78C06
        GOSUBL  STAB2~jump_795EC                 * 78C0C
        GOSUBL  RCCD0~jump_79608                 * 78C12
        P=      1                                * 78C18
        GOSUBL  TST15~jump_79632                 * 78C1A
        GOC     L_78BEF                          * 78C20
        ?ST=0   9                                * 78C23
        GOYES   L_78C4F                          * 78C26
        ?P=     2                                * 78C28
        GOYES   L_78C4B                          * 78C2B
        C=-C-1  S                                * 78C2D
        GOSBVL  RADDF                            * 78C30
        GOSBVL  RSUB1                            * 78C37
        P=      14                               * 78C3E
        ?B#0    P                                * 78C40
        GOYES   L_78C4F                          * 78C43
        GOSUBL  RCAB2~jump_79601                 * 78C45
L_78C4B:
        GOTO    L_78AEB                          * 78C4B
L_78C4F:
        GOSUBL  RCAB2~jump_79601                 * 78C4F
        P=      0                                * 78C55
        LC(5)   #00012                           * 78C57
        ?C<=A   A                                * 78C5E
        GOYES   L_78BEF                          * 78C61
        GOSUBL  RCCD0~jump_79608                 * 78C63
        C=-C-1  S                                * 78C69
        GOSBVL  RADDF                            * 78C6C
        GOSUBL  RCCD0~jump_79608                 * 78C73
        ?ST=1   9                                * 78C79
        GOYES   L_78C8F                          * 78C7C
        P=      6                                * 78C7E
        GOSUBL  TST15~jump_79632                 * 78C80
        GOC     L_78C8F                          * 78C86
        GOSUBL  XYEX~jump_79624                  * 78C89
L_78C8F:
        GOSUBL  STCD0~jump                       * 78C8F
        A=B     M                                * 78C95
        R3=A                                     * 78C98
        GOSUBL  EXAB0~jump_79616                 * 78C9B
        A=B     M                                * 78CA1
        R2=A                                     * 78CA4
        A=0     W                                * 78CA7
        B=0     W                                * 78CAA
        P=      14                               * 78CAD
        B=B+1   P                                * 78CAF
        R4=A                                     * 78CB2
L_78CB5:
        GOSUBL  STAB0~jump_795E5                 * 78CB5
        A=R4                                     * 78CBB
        C=R2                                     * 78CBE
        ?C#A    W                                * 78CC1
        GOYES   L_78CCC                          * 78CC4
        GOLONG  L_795FA                          * 78CC6
L_78CCC:
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
        GOYES   L_78D07                          * 78CF5
        C=R4                                     * 78CF7
        D=0     W                                * 78CFA
        DCEX    M                                * 78CFD
        GOSBVL  DIVF                             * 78D00
L_78D07:
        GOSUBL  RCCD0~jump_79608                 * 78D07
        GOSBVL  MULTF                            * 78D0D
        P=      3                                * 78D14
        ?A=0    P                                * 78D16
        GOYES   L_78CB5                          * 78D19
        RTN                                      * 78D1B

* refs (2): 78BE8 78BFF
SUB_78D1D:
        P=      14                               * 78D1D
        ?B#0    P                                * 78D1F
        GOYES   L_78D2A                          * 78D22
        A=0     W                                * 78D24
        B=0     W                                * 78D27
L_78D2A:
        ?A=0    S                                * 78D2A
        GOYES   L_78D31                          * 78D2D
        RTNCC                                    * 78D2F
L_78D31:
        GOSBVL  SUB_2BC09                        * 78D31
        ?P=     15                               * 78D38
        RTNYES                                   * 78D3B
        ?B=0    WP                               * 78D3D
        RTNYES                                   * 78D40
        RTNCC                                    * 78D42
L_78D44:
        XM=0                                     * 78D44
        GOSUB   SUB_79510                        * 78D47
        GONC    L_78D53                          * 78D4B
        A=0     S                                * 78D4E
        RTNCC                                    * 78D51
L_78D53:
        HST=0   3                                * 78D53
        B=0     S                                * 78D56
        ?B#0    W                                * 78D59
        GOYES   L_78D70                          * 78D5C
        A=0     S                                * 78D5E
        A=-A-1  S                                * 78D61
        P=      0                                * 78D64
        LC(2)   #03                              * 78D66
        GOSUB   L_7949A                          * 78D6A
        RTNCC                                    * 78D6E
L_78D70:
        B=0     W                                * 78D70
        B=A     A                                * 78D73
        A=A+A   A                                * 78D75
        A=0     W                                * 78D77
        GONC    L_78D82                          * 78D7A
        A=-A-1  S                                * 78D7D
        B=-B    A                                * 78D80
L_78D82:
        BSRC                                     * 78D82
        A=A+1   A                                * 78D85
        ?B#0    A                                * 78D87
        GOYES   L_78D82                          * 78D8A
        BSR     W                                * 78D8C
        A=A-1   A                                * 78D8F
        SB=0                                     * 78D91
        RTNCC                                    * 78D94

* refs (2): 78DE1 7913F
SUB_78D96:
        C=B     W                                * 78D96
        D=C     W                                * 78D99
        B=A     A                                * 78D9C
L_78D9E:
        DSR     W                                * 78D9E
        ?D=0    W                                * 78DA1
        GOYES   L_78DB7                          * 78DA4
        B=B+1   A                                * 78DA6
        GONC    L_78D9E                          * 78DA8
        P=      14                               * 78DAB
        D=D+1   P                                * 78DAD
L_78DB0:
        GOVLNG  L_2B9C4                          * 78DB0
L_78DB7:
        B=C     W                                * 78DB7
        RTN                                      * 78DBA
L_78DBC:
        HST=0   3                                * 78DBC
        ST=0    10                               * 78DBF
        B=0     S                                * 78DC2
        C=A     A                                * 78DC5
        C=C+1   A                                * 78DC7
        C=C+C   A                                * 78DC9
        GOC     L_78DD6                          * 78DCB
        GOSUB   SUB_78A28                        * 78DCE
        GOTO    L_78E08                          * 78DD2
L_78DD6:
        ?A=0    S                                * 78DD6
        GOYES   L_78DE1                          * 78DD9
        ST=1    10                               * 78DDB
        GONC    L_78DE5                          * 78DDE
L_78DE1:
        GOSUB   SUB_78D96                        * 78DE1
L_78DE5:
        GOTO    L_78E5E                          * 78DE5

* refs (2): 7920A 79377
SUB_78DE9:
        XM=0                                     * 78DE9
        GOSUB   SUB_79510                        * 78DEC
        GONC    L_78E08                          * 78DF0
        ?A=0    S                                * 78DF3
        RTNYES                                   * 78DF6
L_78DF8:
        P=      0                                * 78DF8
        LC(2)   #0D                              * 78DFA
L_78DFE:
        GOVLNG  L_2BB8C                          * 78DFE
L_78E05:
        HST=0   3                                * 78E05
L_78E08:
        ST=0    10                               * 78E08
        C=0     W                                * 78E0B
        B=0     S                                * 78E0E
        ?B#0    W                                * 78E11
        GOYES   L_78E26                          * 78E14
        P=      0                                * 78E16
        LC(2)   #0C                              * 78E18
        A=0     S                                * 78E1C
        A=-A-1  S                                * 78E1F
        GOTO    L_7949A                          * 78E22
L_78E26:
        ?A#0    S                                * 78E26
        GOYES   L_78DF8                          * 78E29
        C=A     A                                * 78E2B
        ?C#0    A                                * 78E2D
        GOYES   L_78E81                          * 78E30
        P=      14                               * 78E32
        C=B     W                                * 78E34
        D=C     W                                * 78E37
        C=C-1   P                                * 78E3A
        ?C#0    W                                * 78E3D
        GOYES   L_78E4C                          * 78E40
        SB=0                                     * 78E42
        B=0     W                                * 78E45
        GOTO    L_78F6D                          * 78E48
L_78E4C:
        ?C#0    P                                * 78E4C
        GOYES   L_78E5A                          * 78E4F
        A=A-1   A                                * 78E51
        CSL     W                                * 78E53
        GOTO    L_78E4C                          * 78E56
L_78E5A:
        GOSUB   L_78DB0                          * 78E5A
L_78E5E:
        P=      14                               * 78E5E
        C=0     W                                * 78E60
        R0=C                                     * 78E63
        C=A     A                                * 78E66
        A=C     W                                * 78E68
        GOTO    L_78E79                          * 78E6B
L_78E6F:
        ?P=     8                                * 78E6F
        GOYES   L_78EED                          * 78E72
        P=P-1                                    * 78E74
        C=C+1   S                                * 78E76
L_78E79:
        C=C+1   A                                * 78E79
        GONC    L_78E6F                          * 78E7B
        GOC     L_78E96                          * 78E7E
L_78E81:
        A=A+C   A                                * 78E81
        GONC    L_78E8B                          * 78E83
        C=-C-1  A                                * 78E86
        ST=1    10                               * 78E88
L_78E8B:
        P=      14                               * 78E8B
        B=-B    WP                               * 78E8D
        C=C-1   P                                * 78E90
L_78E93:
        C=C+1   P                                * 78E93
L_78E96:
        A=B     W                                * 78E96
        D=C     S                                * 78E99
        GOTO    L_78EA3                          * 78E9C
L_78EA0:
        BSR     W                                * 78EA0
L_78EA3:
        D=D-1   S                                * 78EA3
        GONC    L_78EA0                          * 78EA6
        B=B+A   W                                * 78EA9
        B=B-1   S                                * 78EAC
        GONC    L_78E93                          * 78EAF
        C=C+1   S                                * 78EB2
        B=A     W                                * 78EB5
        BSL     W                                * 78EB8
        P=P-1                                    * 78EBB
        ?P#     6                                * 78EBD
        GOYES   L_78E96                          * 78EC0
        A=C     W                                * 78EC2
        C=0     W                                * 78EC5
        P=      0                                * 78EC8
        LC(5)   #99992                           * 78ECA
        ?A#0    A                                * 78ED1
        GOYES   L_78F00                          * 78ED4
        R0=A                                     * 78ED6
        CAEX    W                                * 78ED9
        ?C#0    M                                * 78EDC
        GOYES   L_78EEA                          * 78EDF
        A=A-1   A                                * 78EE1
        GOSUB   L_78F6D                          * 78EE3
        GONC    L_78EED                          * 78EE7
L_78EEA:
        BSR     W                                * 78EEA
L_78EED:
        GOSUB   SUB_78F86                        * 78EED
        C=A     W                                * 78EF1
        D=C     W                                * 78EF4
        A=R0                                     * 78EF7
        P=      7                                * 78EFA
        GOTO    L_78F0D                          * 78EFC
L_78F00:
        P=      6                                * 78F00
        A=A+1   P                                * 78F02
        P=      7                                * 78F05
        D=C     W                                * 78F07
L_78F0A:
        BSR     W                                * 78F0A
L_78F0D:
        GOSUBL  SUB_799F8                        * 78F0D
        GOSUB   SUB_78F77                        * 78F13
        ?A=0    M                                * 78F17
        GOYES   L_78F54                          * 78F1A
        ?P#     15                               * 78F1C
        GOYES   L_78F0A                          * 78F1F
        C=0     W                                * 78F21
        P=      0                                * 78F24
        C=B     P                                * 78F26
        B=B+C   W                                * 78F29
        BSR     W                                * 78F2C
        GOSUBL  SUB_799F6                        * 78F2F
        P=      0                                * 78F35
        ?ST=1   10                               * 78F37
        GOYES   L_78F3F                          * 78F3A
        B=C-B   W                                * 78F3C
L_78F3F:
        GOSUB   SUB_78F77                        * 78F3F
        ?A=0    A                                * 78F43
        GOYES   L_78F54                          * 78F46
        BSR     W                                * 78F48
        GONC    L_78F3F                          * 78F4B
L_78F4E:
        BSR     W                                * 78F4E
        GOC     L_78F5B                          * 78F51
L_78F54:
        ?B#0    S                                * 78F54
        GOYES   L_78F4E                          * 78F57
        D=D-1   A                                * 78F59
L_78F5B:
        GOSUB   SUB_795CB                        * 78F5B
        C=D     W                                * 78F5F
        A=C     W                                * 78F62
        ?ST=0   10                               * 78F65
        GOYES   L_78F6D                          * 78F68
        A=-A-1  S                                * 78F6A
L_78F6D:
        GOVLNG  L_2B95E                          * 78F6D
L_78F74:
        B=B+C   W                                * 78F74

* refs (2): 78F13 78F3F
SUB_78F77:
        A=A-1   P                                * 78F77
        GONC    L_78F74                          * 78F7A
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
L_78F97:
        DSR     W                                * 78F97
        ?D=0    W                                * 78F9A
        GOYES   L_78FB0                          * 78F9D
        B=B+1   A                                * 78F9F
        GONC    L_78F97                          * 78FA1
        D=-D    W                                * 78FA4
        D=0     S                                * 78FA7
        A=A+1   A                                * 78FAA
        GOTO    L_78DB0                          * 78FAC
L_78FB0:
        B=C     W                                * 78FB0
        RTN                                      * 78FB3
L_78FB5:
        GOSUB   SUB_79510                        * 78FB5
        GONC    L_78FDE                          * 78FB9
        ?A=0    S                                * 78FBC
        GOYES   L_78FC7                          * 78FBF
        A=0     W                                * 78FC1
        B=0     W                                * 78FC4
L_78FC7:
        GOTO    L_7911C                          * 78FC7
L_78FCB:
        HST=0   3                                * 78FCB
        ST=0    11                               * 78FCE
        GOTO    L_78FDE                          * 78FD1
L_78FD5:
        HST=0   3                                * 78FD5
        ST=1    11                               * 78FD8
L_78FDB:
        XM=0                                     * 78FDB
L_78FDE:
        C=0     W                                * 78FDE
        R0=C                                     * 78FE1
        ST=1    10                               * 78FE4
        ?A#0    S                                * 78FE7
        GOYES   L_78FEF                          * 78FEA
        ST=0    10                               * 78FEC
L_78FEF:
        A=0     S                                * 78FEF
        D=0     W                                * 78FF2
L_78FF5:
        C=A     A                                * 78FF5
        C=0     S                                * 78FF7
        C=C+C   A                                * 78FFA
        GONC    L_79025                          * 78FFC
        C=A     A                                * 78FFF
        ?B=0    S                                * 79001
        GOYES   L_7900F                          * 79004
        A=A+1   A                                * 79006
        BSR     W                                * 79008
        GOTO    L_78FF5                          * 7900B
L_7900F:
        P=      15                               * 7900F
L_79011:
        P=P-1                                    * 79011
        ?P=     6                                * 79013
        GOYES   L_79021                          * 79016
        C=C+1   A                                * 79018
        GONC    L_79011                          * 7901A
        GOTO    L_7909E                          * 7901D
L_79021:
        GOTO    L_790A7                          * 79021
L_79025:
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
L_7904A:
        C=C+1   A                                * 7904A
L_7904C:
        GOSUBL  SUB_79A1F                        * 7904C
        GONC    L_7904A                          * 79052
        GOSUBL  SUB_79A88                        * 79055
        AR0EX                                    * 7905B
        A=A-1   A                                * 7905E
        AR0EX                                    * 79060
        GOC     L_7906F                          * 79063
        ?C=0    P                                * 79066
        GOYES   L_7904C                          * 79069
        GOTO    L_7923C                          * 7906B
L_7906F:
        CSR     WP                               * 7906F
        B=A     W                                * 79072
        A=R0                                     * 79075
        D=0     W                                * 79078
        D=C     A                                * 7907B
        GOSUB   SUB_79226                        * 7907D
        GONC    L_7909E                          * 79081
        RTN                                      * 79084
L_79086:
        D=D+1   P                                * 79086
L_79089:
        B=B-C   W                                * 79089
        GONC    L_79086                          * 7908C
        B=B+C   W                                * 7908F
        ?P=     7                                * 79092
        GOYES   L_790A7                          * 79095
        BSL     W                                * 79097
        A=A-1   A                                * 7909A
        P=P-1                                    * 7909C
L_7909E:
        GOSUBL  SUB_799F8                        * 7909E
        GONC    L_79089                          * 790A4
L_790A7:
        ?ST=0   11                               * 790A7
        GOYES   L_790BC                          * 790AA
        C=D     W                                * 790AC
        R0=C                                     * 790AF
        GOSUB   SUB_78F86                        * 790B2
        C=R0                                     * 790B6
        D=C     W                                * 790B9
L_790BC:
        C=A     A                                * 790BC
        P=      15                               * 790BE
        LC(1)   #7                               * 790C0
        P=      6                                * 790C3
        ?D=0    A                                * 790C5
        GOYES   L_790CD                          * 790C8
        D=D+1   P                                * 790CA
L_790CD:
        ?D=0    M                                * 790CD
        GOYES   L_79132                          * 790D0
        P=P+1                                    * 790D2
L_790D4:
        ?D=0    P                                * 790D4
        GOYES   L_790FB                          * 790D7
        D=D-1   P                                * 790D9
        A=B     W                                * 790DC
        D=C     S                                * 790DF
        GONC    L_790E8                          * 790E2
L_790E5:
        ASR     W                                * 790E5
L_790E8:
        C=C-1   S                                * 790E8
        GONC    L_790E5                          * 790EB
        B=B+A   W                                * 790EE
        B=B+1   S                                * 790F1
        C=D     S                                * 790F4
        GOTO    L_790D4                          * 790F7
L_790FB:
        C=C+1   A                                * 790FB
        BSR     W                                * 790FD
        C=C-1   S                                * 79100
        GONC    L_790CD                          * 79103
        C=D     A                                * 79106
        B=B+1   P                                * 79108
        A=C     A                                * 7910B
        A=0     S                                * 7910D
        ?ST=0   10                               * 79110
        GOYES   L_7911C                          * 79113
        GOSBVL  SUB_2B78C                        * 79115
L_7911C:
        ?ST=0   11                               * 7911C
        GOYES   L_79130                          * 7911F
        GOSUB   STAB0~jump_795E5                 * 79121
        GOSBVL  RSUB1                            * 79125
        GOSUB   EXAB0~jump_79616                 * 7912C
L_79130:
        RTNCC                                    * 79130
L_79132:
        A=0     S                                * 79132
        A=C     A                                * 79135
        ?ST=0   10                               * 79137
        GOYES   L_79143                          * 7913A
        A=-A-1  S                                * 7913C
        GOSUB   SUB_78D96                        * 7913F
L_79143:
        ?ST=0   11                               * 79143
        GOYES   L_7914C                          * 79146
        GOSUB   STAB0~jump_795E5                 * 79148
L_7914C:
        ?B=0    W                                * 7914C
        GOYES   L_7915B                          * 7914F
        GOSUBL  SUB_78A28                        * 79151
        GOTO    SUB_795CB                        * 79157
L_7915B:
        GOSUBL  SUB_78A28                        * 7915B
        RTNCC                                    * 79161
        NIBHEX  54995508174139609423408971013590 * 79163  EτU∡q.ε.I2.σ..S.
        NIBHEX  80861358033059903353803330059990 * 79183  .h1Σ0.θ.35.3.Pτ.
        NIBHEX  38033330005999903333300005999990 * 791A3  √03..θτ.33..Pττ.
        NIBHEX  33300000599999903000000599999990 * 791C3  3...θττ....Pτττ.
        NIBHEX  5049929058520320                 * 791E3  .η).Σ%0.
L_791F3:
        GOSBVL  SUB_2BC62                        * 791F3
        ?A#0    S                                * 791FA
        GOYES   L_7920A                          * 791FD
        GOSUB   SUB_795D6                        * 791FF
        GONC    L_7920A                          * 79203
        GOTO    L_78D44                          * 79206
L_7920A:
        GOSUB   SUB_78DE9                        * 7920A
        ?XM=0                                    * 7920E
        GOYES   L_79215                          * 79211
        RTN                                      * 79213
L_79215:
        GOSUB   SUB_799F6                        * 79215
        D=0     W                                * 79219
        DCEX    W                                * 7921C
        GOVLNG  L_2B971                          * 7921F

* refs (2): 7907D 792A9
SUB_79226:
        P=      4                                * 79226
        ?D=0    P                                * 79228
        GOYES   L_79238                          * 7922B
        D=D-1   P                                * 7922D
        ?D#0    P                                * 79230
        GOYES   L_7923C                          * 79233
        D=D+1   P                                * 79235
L_79238:
        P=      14                               * 79238
        RTNCC                                    * 7923A
L_7923C:
        A=0     S                                * 7923C
        P=      0                                * 7923F
L_79241:
        LC(5)   #19999                           * 79241
        A=C     A                                * 79248
        C=0     W                                * 7924A
        P=      14                               * 7924D
        ?ST=1   10                               * 7924F
        GOYES   L_7925A                          * 79252
        C=C-1   WP                               * 79254
        GOC     L_7925F                          * 79257
L_7925A:
        A=-A    A                                * 7925A
        C=C+1   P                                * 7925C
L_7925F:
        B=C     W                                * 7925F
        ?ST=0   11                               * 79262
        RTNYES                                   * 79265
        GOSUB   STAB0~jump_795E5                 * 79267
        GOSBVL  RSUB1                            * 7926B
        GOSUB   EXAB0~jump_79616                 * 79272
        RTNSC                                    * 79276
L_79278:
        GOSUB   L_78D44                          * 79278
        GOSBVL  SUB_2B915                        * 7927C
        ST=0    10                               * 79283
        ?A=0    S                                * 79286
        GOYES   L_7928E                          * 79289
        ST=1    10                               * 7928B
L_7928E:
        C=0     A                                * 7928E
        P=      0                                * 79290
        LC(1)   #4                               * 79292
        ?C<A    A                                * 79295
        GOYES   L_7923C                          * 79298
        BSLC                                     * 7929A
L_7929D:
        BSLC                                     * 7929D
        A=A-1   A                                * 792A0
        GONC    L_7929D                          * 792A2
        C=B     A                                * 792A5
        D=C     A                                * 792A7
        GOSUB   SUB_79226                        * 792A9
        RTNC                                     * 792AD
        C=D     A                                * 792B0
        A=C     A                                * 792B2
        ?ST=0   10                               * 792B4
        GOYES   L_792BB                          * 792B7
        A=-A    A                                * 792B9
L_792BB:
        A=0     S                                * 792BB
        B=0     W                                * 792BE
        B=B+1   P                                * 792C1
        GOTO    L_7911C                          * 792C4

* refs (2): 79306 7952C
SUB_792C8:
        GOSUB   SUB_7962B                        * 792C8
        GONC    L_792EE                          * 792CC
        ?C#A    XS                               * 792CF
        GOYES   L_792E7                          * 792D2
        ?A=0    B                                * 792D4
        GOYES   L_792F8                          * 792D7
        ?C=0    B                                * 792D9
        RTNYES                                   * 792DC
        GOSBVL  L_2BB72                          * 792DE
        RTNSC                                    * 792E5
L_792E7:
        ?A#0    B                                * 792E7
        RTNYES                                   * 792EA
L_792EC:
        RTNCC                                    * 792EC
L_792EE:
        GOSBVL  SUB_2BD0E                        * 792EE
        RTNNC                                    * 792F5
L_792F8:
        ?C=0    B                                * 792F8
        GOYES   L_792EC                          * 792FB
        GOSUB   XYEX~jump_79624                  * 792FD
        RTNSC                                    * 79301
L_79303:
        HST=0   3                                * 79303
        GOSUB   SUB_792C8                        * 79306
        RTNC                                     * 7930A
L_7930D:
        ST=0    11                               * 7930D
        ST=0    8                                * 79310
        B=0     S                                * 79313
        D=0     S                                * 79316
        GOSBVL  SUB_2BC62                        * 79319
        GONC    L_79326                          * 79320
        ST=1    8                                * 79323
L_79326:
        GOSBVL  SUB_2BCC4                        * 79326
        GOSBVL  STCD2                            * 7932D
        ?A=0    S                                * 79334
        GOYES   L_7933D                          * 79337
        GOTO    L_793C2                          * 79339
L_7933D:
        ?B#0    W                                * 7933D
        GOYES   L_79346                          * 79340
        GOTO    L_79418                          * 79342
L_79346:
        GOSUB   SUB_795D6                        * 79346
        GONC    L_79377                          * 7934A
        GOSUB   RCCD2~jump_7960F                 * 7934D
        GOSBVL  SUB_2BD0E                        * 79351
        GOC     L_79377                          * 79358
        GOSUB   XYEX~jump_79624                  * 7935B
        D=C     A                                * 7935F
        GOSBVL  CLRFRC                           * 79361
        C=D     A                                * 79368
        D=0     A                                * 7936A
        GOSUB   XYEX~jump_79624                  * 7936C
        GONC    L_79377                          * 79370
        GOTO    L_79278                          * 79373
L_79377:
        GOSUB   SUB_78DE9                        * 79377
        GOSUB   RCCD2~jump_7960F                 * 7937B
        GOSBVL  SUB_2B915                        * 7937F
        ?XM=0                                    * 79386
        GOYES   L_793AD                          * 79389
        P=      0                                * 7938B
        C=0     A                                * 7938D
        LC(2)   #12                              * 7938F
        ?ST=1   8                                * 79393
        GOYES   L_793A0                          * 79396
L_79398:
        LC(2)   #11                              * 79398
        GOTO    L_793DC                          * 7939C
L_793A0:
        A=0     W                                * 793A0
        B=0     W                                * 793A3
        P=      14                               * 793A6
        B=B+1   P                                * 793A8
        RTNSXM                                   * 793AB
L_793AD:
        ?D#0    S                                * 793AD
        GOYES   L_793B6                          * 793B0
        GOTO    L_78FB5                          * 793B2
L_793B6:
        A=A-1   A                                * 793B6
        C=D     W                                * 793B8
        BCEX    W                                * 793BB
        GOTO    L_78FDB                          * 793BE
L_793C2:
        GOSUB   EXAB2~jump_7961D                 * 793C2
        C=A     A                                * 793C6
        C=C+C   A                                * 793C8
        GONC    L_793E2                          * 793CA
L_793CD:
        GOSUB   EXAB2~jump_7961D                 * 793CD
        ?B=0    W                                * 793D1
        GOYES   L_79418                          * 793D4
        P=      0                                * 793D6
        LC(2)   #09                              * 793D8
L_793DC:
        GOLONG  L_78DFE                          * 793DC
L_793E2:
        GOSBVL  SUB_2BBFC                        * 793E2
        ?P#     15                               * 793E9
        GOYES   L_793F6                          * 793EC
        ?C#0    A                                * 793EE
        GOYES   L_79401                          * 793F1
        GONC    L_793FB                          * 793F3
L_793F6:
        ?B#0    WP                               * 793F6
        GOYES   L_793CD                          * 793F9
L_793FB:
        P=P+1                                    * 793FB
        GOSUB   SUB_794FD                        * 793FD
L_79401:
        GOSUB   EXAB2~jump_7961D                 * 79401
        A=0     S                                * 79405
        GONC    L_7940F                          * 79408
        GOTO    L_7933D                          * 7940B
L_7940F:
        GOSUB   L_7933D                          * 7940F
        A=-A-1  S                                * 79413
        RTN                                      * 79416
L_79418:
        GOSUB   RCCD2~jump_7960F                 * 79418
        P=      0                                * 7941C
        ?D#0    W                                * 7941E
        GOYES   L_7942D                          * 79421
        C=0     A                                * 79423
        LC(2)   #06                              * 79425
        GOTO    L_793A0                          * 79429
L_7942D:
        ?C=0    S                                * 7942D
        GOYES   L_7943A                          * 79430
        LC(2)   #05                              * 79432
        GOTO    L_7949A                          * 79436
L_7943A:
        GOTO    L_7911C                          * 7943A
L_7943E:
        HST=0   3                                * 7943E
        P=      14                               * 79441
        ?D#0    P                                * 79443
        GOYES   L_794A1                          * 79446
        ST=0    6                                * 79448
        ?C=0    S                                * 7944B
        GOYES   L_79453                          * 7944E
        ST=1    6                                * 79450
L_79453:
        ?B#0    P                                * 79453
        GOYES   L_79467                          * 79456
        ?ST=0   6                                * 79458
        GOYES   L_79489                          * 7945B
        P=      0                                * 7945D
        LC(2)   #05                              * 7945F
        GOTO    L_79497                          * 79463
L_79467:
        ?A#0    A                                * 79467
        GOYES   L_79477                          * 7946A
        GOSUB   SUB_795D6                        * 7946C
        GONC    L_79477                          * 79470
        GOTO    L_79398                          * 79473
L_79477:
        A=A+A   A                                * 79477
        GOC     L_79484                          * 79479
        ?ST=0   6                                * 7947C
        GOYES   L_79491                          * 7947F
        GONC    L_79489                          * 79481
L_79484:
        ?ST=1   6                                * 79484
        GOYES   L_79491                          * 79487
L_79489:
        A=0     W                                * 79489
        B=0     W                                * 7948C
        RTNCC                                    * 7948F
L_79491:
        P=      0                                * 79491
        LC(2)   #17                              * 79493
L_79497:
        A=0     S                                * 79497
L_7949A:
        GOVLNG  L_2B9A3                          * 7949A
L_794A1:
        GOSUB   STAB0~jump_795E5                 * 794A1
        GOSUB   XYEX~jump_79624                  * 794A5
        ?C#0    S                                * 794A9
        GOYES   L_794C1                          * 794AC
L_794AE:
        GOSBVL  1/X15                            * 794AE
        GOSUB   RCCD0~jump_79608                 * 794B5
        GOSUB   XYEX~jump_79624                  * 794B9
        GOTO    L_7930D                          * 794BD
L_794C1:
        GOSBVL  SUB_2BBFC                        * 794C1
        ?P#     15                               * 794C8
        GOYES   L_794D5                          * 794CB
        ?C#0    A                                * 794CD
        GOYES   L_794AE                          * 794D0
        GONC    L_794DA                          * 794D2
L_794D5:
        ?B#0    WP                               * 794D5
        GOYES   L_794AE                          * 794D8
L_794DA:
        P=P+1                                    * 794DA
        GOSUB   SUB_794FD                        * 794DC
        GOC     L_794AE                          * 794E0
        C=R0                                     * 794E3
        C=0     S                                * 794E6
        R0=C                                     * 794E9
        GOSUB   L_794AE                          * 794EC
        GOC     L_794F8                          * 794F0
        A=-A-1  S                                * 794F3
        RTNCC                                    * 794F6
L_794F8:
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
L_79529:
        HST=0   3                                * 79529
        GOSUB   SUB_792C8                        * 7952C
        RTNC                                     * 79530
        R0=A                                     * 79533
        R1=C                                     * 79536
        GOSUB   SUB_7962B                        * 79539
        GOSUB   XYEX~jump_79624                  * 7953D
        GONC    L_7954D                          * 79541
        ?C#A    XS                               * 79544
        GOYES   L_79560                          * 79547
        GOTO    L_7967B                          * 79549
L_7954D:
        GOSUB   SUB_7962B                        * 7954D
        GOC     L_79560                          * 79551
        ?D#0    W                                * 79554
        GOYES   L_79560                          * 79557
        ?B#0    W                                * 79559
        GOYES   L_79560                          * 7955C
        RTN                                      * 7955E
L_79560:
        GOSBVL  SUB_2B96E                        * 79560
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
        GOYES   L_7959A                          * 79589
        ?ST=1   9                                * 7958B
        GOYES   L_795A9                          * 7958E
        P=      13                               * 79590
        LC(2)   #18                              * 79592
        GOTO    L_7959F                          * 79596
L_7959A:
        P=      14                               * 7959A
        LC(1)   #2                               * 7959C
L_7959F:
        D=D+1   A                                * 7959F
        D=D+1   A                                * 795A1
        DCEX    W                                * 795A3
        GONC    L_795B2                          * 795A6
L_795A9:
        GOSUB   SUB_79AB5                        * 795A9
        D=D+D   W                                * 795AD
        D=D-1   A                                * 795B0
L_795B2:
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
STAB0~jump_795E5:
        GOVLNG  STAB0                            * 795E5

* refs (2): 78C0C 79BDA
STAB2~jump_795EC:
        GOVLNG  STAB2                            * 795EC

* refs (1): 78C8F
STCD0~jump:
        GOVLNG  STCD0                            * 795F3
L_795FA:
        GOVLNG  RCAB0                            * 795FA

* refs (2): 78C45 78C4F
RCAB2~jump_79601:
        GOVLNG  RCAB2                            * 79601

* refs (7): 78C12 78C63 78C73 78D07 794B5 79913 ...
RCCD0~jump_79608:
        GOVLNG  RCCD0                            * 79608

* refs (4): 7934D 7937B 79418 79C03
RCCD2~jump_7960F:
        GOVLNG  RCCD2                            * 7960F

* refs (6): 78BF9 78C06 78C9B 7912C 79272 79BE4
EXAB0~jump_79616:
        GOVLNG  EXAB0                            * 79616

* refs (3): 793C2 793CD 79401
EXAB2~jump_7961D:
        GOVLNG  EXAB2                            * 7961D

* refs (8): 78C89 792FD 7935B 7936C 794A5 794B9 ...
XYEX~jump_79624:
        GOVLNG  XYEX                             * 79624

* refs (4): 78A3A 792C8 79539 7954D
SUB_7962B:
        GOVLNG  SUB_2BD02                        * 7962B

* refs (2): 78C1A 78C80
TST15~jump_79632:
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
L_7965D:
        ST=1    8                                * 7965D
        GOTO    L_79667                          * 79660
L_79664:
        ST=0    8                                * 79664
L_79667:
        ST=1    6                                * 79667
        GOTO    L_79674                          * 7966A
L_7966E:
        ST=0    8                                * 7966E
        ST=0    6                                * 79671
L_79674:
        HST=0   3                                * 79674
        GOTO    L_79685                          * 79677
L_7967B:
        P=      0                                * 7967B
        LC(2)   #0B                              * 7967D
        GOTO    L_793DC                          * 79681
L_79685:
        B=0     S                                * 79685
        ?ST=0   4                                * 79688
        GOYES   L_79694                          * 7968B
        GOSUB   SUB_79639                        * 7968D
        ST=0    9                                * 79691
L_79694:
        C=0     W                                * 79694
        R0=C                                     * 79697
        ST=0    10                               * 7969A
        ST=0    11                               * 7969D
        ?ST=1   8                                * 796A0
        GOYES   L_796A8                          * 796A3
        C=C+1   S                                * 796A5
L_796A8:
        R1=C                                     * 796A8
        ST=0    7                                * 796AB
        ?B=0    W                                * 796AE
        GOYES   L_796B6                          * 796B1
        ST=1    7                                * 796B3
L_796B6:
        ?A=0    S                                * 796B6
        GOYES   L_796C6                          * 796B9
        ST=1    11                               * 796BB
        ?ST=0   8                                * 796BE
        GOYES   L_796C6                          * 796C1
        ST=1    10                               * 796C3
L_796C6:
        A=0     S                                * 796C6
        P=      5                                * 796C9
        A=0     P                                * 796CB
        C=A     A                                * 796CE
        C=C+C   A                                * 796D0
        GONC    L_796D8                          * 796D2
        A=A-1   P                                * 796D5
L_796D8:
        C=A     W                                * 796D8
        A=B     W                                * 796DB
        ?ST=1   9                                * 796DE
        GOYES   L_796FE                          * 796E1
        C=C-1   WP                               * 796E3
        ?C#0    P                                * 796E6
        GOYES   L_79766                          * 796E9
        C=C-1   WP                               * 796EB
        GONC    L_796FE                          * 796EE
        C=C+1   WP                               * 796F1
        CR0EX                                    * 796F4
        GOSUB   SUB_79A93                        * 796F7
        CR0EX                                    * 796FB
L_796FE:
        ?C#0    P                                * 796FE
        GOYES   L_79766                          * 79701
        GOSUB   SUB_79A3E                        * 79703
        GOSUB   SUB_79A7A                        * 79707
        GOSUB   SUB_79A7A                        * 7970B
        GOSUB   SUB_79A7A                        * 7970F
        GOSUB   SUB_79A9E                        * 79713
L_79717:
        CR0EX                                    * 79717
L_7971A:
        GOSUB   SUB_79A1F                        * 7971A
        GONC    L_7971A                          * 7971E
        GOSUB   SUB_79A88                        * 79721
        CR0EX                                    * 79725
        C=C-1   WP                               * 79728
        GONC    L_79717                          * 7972B
        C=0     WP                               * 7972E
        CR0EX                                    * 79731
        GOSUB   SUB_79A3E                        * 79734
        GOSUB   SUB_79A7A                        * 79738
        ?ST=0   9                                * 7973C
        GOYES   L_79749                          * 7973F
        GOSUB   SUB_79A9E                        * 79741
        GOSUB   SUB_79A93                        * 79745
L_79749:
        GOSUB   SUB_79A1F                        * 79749
        GOC     L_79763                          * 7974D
        GOSUB   SUB_79AE6                        * 79750
        GOSUB   SUB_79AC8                        * 79754
        GOC     L_79749                          * 79758
        GOSUB   SUB_79AD7                        * 7975B
        GOTO    L_79749                          * 7975F
L_79763:
        CR0EX                                    * 79763
L_79766:
        ?ST=0   9                                * 79766
        GOYES   L_79780                          * 79769
        ?C#0    WP                               * 7976B
        GOYES   L_7977D                          * 7976E
        CR0EX                                    * 79770
        GOSUB   SUB_79A88                        * 79773
        CR0EX                                    * 79777
        GONC    L_79780                          * 7977A
L_7977D:
        C=C+1   WP                               * 7977D
L_79780:
        ?C#0    P                                * 79780
        GOYES   L_797C5                          * 79783
        CR0EX                                    * 79785
        GOSUB   SUB_79A3E                        * 79788
        GOSUB   SUB_79A1F                        * 7978C
        GOC     L_797A1                          * 79790
        ABEX    W                                * 79793
        DCEX    W                                * 79796
        GOSUB   SUB_79A1F                        * 79799
        GOSUB   SUB_79AC8                        * 7979D
L_797A1:
        P=      14                               * 797A1
        CR0EX                                    * 797A3
        B=C     W                                * 797A6
        CR0EX                                    * 797A9
        ?A#0    W                                * 797AC
        GOYES   L_797B6                          * 797AF
        ?C=0    W                                * 797B1
        GOYES   L_797C8                          * 797B4
L_797B6:
        ?A#0    P                                * 797B6
        GOYES   L_797C8                          * 797B9
        GOSUB   SUB_79A88                        * 797BB
        B=B-1   A                                * 797BF
        GOTO    L_797B6                          * 797C1
L_797C5:
        B=C     W                                * 797C5
L_797C8:
        ABEX    W                                * 797C8
        ?ST=1   9                                * 797CB
        GOYES   L_797F9                          * 797CE
        ?B=0    W                                * 797D0
        GOYES   L_797F6                          * 797D3
        ?A#0    A                                * 797D5
        GOYES   L_797F9                          * 797D8
        C=0     W                                * 797DA
        P=      13                               * 797DD
        LC(2)   #45                              * 797DF
        ?ST=0   6                                * 797E3
        GOYES   L_797F1                          * 797E6
        ?ST=0   8                                * 797E8
        GOYES   L_797F9                          * 797EB
        LC(2)   #30                              * 797ED
L_797F1:
        ?B#C    W                                * 797F1
        GOYES   L_797F9                          * 797F4
L_797F6:
        ST=0    7                                * 797F6
L_797F9:
        A=A-1   A                                * 797F9
        ?ST=1   9                                * 797FB
        GOYES   L_79812                          * 797FE
        P=      7                                * 79800
        GOSUB   SUB_799E0                        * 79802
        D=C     W                                * 79806
        C=0     A                                * 79809
        GOSBVL  MULTF                            * 7980B
L_79812:
        C=A     A                                * 79812
        C=C+1   A                                * 79814
        GONC    L_79821                          * 79816
        BSL     W                                * 79819
        P=      14                               * 7981C
        GOC     L_79849                          * 7981E
L_79821:
        C=0     A                                * 79821
        P=      0                                * 79823
        LC(1)   #8                               * 79825
        C=C+A   A                                * 79828
        GOC     L_7983D                          * 7982A
        ?ST=0   8                                * 7982D
        GOYES   L_79839                          * 79830
        GOSBVL  1/X15                            * 79832
L_79839:
        GOTO    L_798E6                          * 79839
L_7983D:
        C=A     B                                * 7983D
        P=      5                                * 79840
        C+P+1                                    * 79842
        P=C     0                                * 79845
L_79849:
        A=0     W                                * 79849
L_7984C:
        GOSUB   SUB_799E0                        * 7984C
        GONC    L_79856                          * 79850
L_79853:
        A=A+1   S                                * 79853
L_79856:
        B=B-C   W                                * 79856
        GONC    L_79853                          * 79859
        B=B+C   W                                * 7985C
        P=P-1                                    * 7985F
        ASR     W                                * 79861
        BSL     W                                * 79864
        ?P#     7                                * 79867
        GOYES   L_7984C                          * 7986A
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
        GONC    L_798A4                          * 79889
L_7988C:
        CSR     WP                               * 7988C
        CSR     WP                               * 7988F
L_79892:
        C=C-1   S                                * 79892
        GONC    L_7988C                          * 79895
        C=0     S                                * 79898
        DCEX    W                                * 7989B
        D=C-D   W                                * 7989E
        C=C+B   W                                * 798A1
L_798A4:
        B=C     W                                * 798A4
        C=A     S                                * 798A7
        A=A-1   P                                * 798AA
        GONC    L_79892                          * 798AD
        ASL     M                                * 798B0
        ?A=0    M                                * 798B3
        GOYES   L_798C8                          * 798B6
        A=A-1   S                                * 798B8
        A=A-1   B                                * 798BB
        C=0     S                                * 798BE
        CSR     W                                * 798C1
        GOTO    L_798A4                          * 798C4
L_798C8:
        A=0     S                                * 798C8
        C=0     S                                * 798CB
        D=D-1   W                                * 798CE
        A=-A    A                                * 798D1
        B=0     A                                * 798D3
        ?ST=0   8                                * 798D5
        GOYES   L_798DF                          * 798D8
        A=-A    A                                * 798DA
        DCEX    W                                * 798DC
L_798DF:
        GOSBVL  SUB_2B97A                        * 798DF
L_798E6:
        ?ST=1   6                                * 798E6
        GOYES   L_798FE                          * 798E9
        ?XM=0                                    * 798EB
        GOYES   L_79933                          * 798EE
        A=-A-1  S                                * 798F0
        P=      0                                * 798F3
        LC(2)   #04                              * 798F5
        P=      3                                * 798F9
        GONC    L_7993C                          * 798FB
L_798FE:
        C=R1                                     * 798FE
        ?C=0    S                                * 79901
        GOYES   L_7990F                          * 79904
        ?XM=0                                    * 79906
        GOYES   L_7990F                          * 79909
        GOSUB   SUB_79AD7                        * 7990B
L_7990F:
        GOSUB   STAB0~jump_795E5                 * 7990F
        GOSUB   RCCD0~jump_79608                 * 79913
        GOSBVL  SUB_2B915                        * 79917
        GOSBVL  SUB_78A28                        * 7991E
        GOSBVL  SUB_2B9F3                        * 79925
        GOSBVL  1/X15                            * 7992C
L_79933:
        GOSUB   SUB_79D58                        * 79933
        ?ST=1   6                                * 79937
        GOYES   L_79946                          * 7993A
L_7993C:
        ?ST=0   11                               * 7993C
        RTNYES                                   * 7993F
L_79941:
        A=-A-1  S                                * 79941
        RTN                                      * 79944
L_79946:
        ?ST=0   10                               * 79946
        RTNYES                                   * 79949
        GONC    L_79941                          * 7994B
        NIBHEX  02611942568669904256668666699990 * 7994E   .γ$ehλ.$efhfλτ.
        NIBHEX  76866666699999907666666999999990 * 7996E  ghffλττ.gffλτττ.
        NIBHEX  76666999999999907669999999999990 * 7998E  gfλττττ.gλτττττ.
        NIBHEX  79999999999999903349915292354710 * 799AE  ρττττττ.3η.%)St.
        NIBHEX  8447933618935870                 * 799CE  Ht9cā9Σ.

* refs (3): 79A46 79AB5 79C41
SUB_799DE:
        P=      6                                * 799DE

* refs (4): 79802 7984C 79CCA 79D2B
SUB_799E0:
        C=0     A                                * 799E0
        CPEX    1                                * 799E2
        DCEX    A                                * 799E6
        D0=C                                     * 799E8
        LC(5)   L_79A2D+1                        * 799EB
        GOTO    L_79A0A                          * 799F2

* refs (3): 78F2F 79039 79215
SUB_799F6:
        P=      6                                * 799F6

* refs (2): 78F0D 7909E
SUB_799F8:
        C=0     A                                * 799F8
        CPEX    1                                * 799FA
        DCEX    A                                * 799FE
        D0=C                                     * 79A00
        LC(5)   L_79241+2                        * 79A03
L_79A0A:
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
        GOC     L_79A39                          * 79A22
        C=C-D   W                                * 79A25
        GOC     L_79A2D                          * 79A28
        RTNCC                                    * 79A2B
L_79A2D:
        A=A-1   W                                * 79A2D
        RTNNC                                    * 79A30
        A=A+1   W                                * 79A33
        C=C+D   W                                * 79A36
L_79A39:
        A=A+B   W                                * 79A39
        RTNSC                                    * 79A3C

* refs (3): 79703 79734 79788
SUB_79A3E:
        B=C     W                                * 79A3E
        ?ST=0   9                                * 79A41
        GOYES   L_79A6B                          * 79A44
        GOSUB   SUB_799DE                        * 79A46
        D=C     W                                * 79A4A
        P=      0                                * 79A4D
        LC(16)  #3096156608458199                * 79A4F
        DCEX    W                                * 79A61
L_79A64:
        P=      5                                * 79A64
        BCEX    W                                * 79A66
        RTN                                      * 79A69
L_79A6B:
        C=0     W                                * 79A6B
        D=0     W                                * 79A6E
        P=      13                               * 79A71
        LC(2)   #45                              * 79A73
        GOC     L_79A64                          * 79A77

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
        GOYES   L_79AD2                          * 79ACB
        ST=1    8                                * 79ACD
        RTNCC                                    * 79AD0
L_79AD2:
        ST=0    8                                * 79AD2
        RTNSC                                    * 79AD5

* refs (2): 7975B 7990B
SUB_79AD7:
        ?ST=1   10                               * 79AD7
        GOYES   L_79AE1                          * 79ADA
        ST=1    10                               * 79ADC
        RTNCC                                    * 79ADF
L_79AE1:
        ST=0    10                               * 79AE1
        RTNSC                                    * 79AE4

* refs (1): 79750
SUB_79AE6:
        ?ST=1   11                               * 79AE6
        GOYES   L_79AF0                          * 79AE9
        ST=1    11                               * 79AEB
        RTNCC                                    * 79AEE
L_79AF0:
        ST=0    11                               * 79AF0
        RTNSC                                    * 79AF3
L_79AF5:
        ST=0    8                                * 79AF5
        ST=0    6                                * 79AF8
        GOTO    L_79B0C                          * 79AFB
L_79AFF:
        ST=0    8                                * 79AFF
        GOTO    L_79B09                          * 79B02
L_79B06:
        ST=1    8                                * 79B06
L_79B09:
        ST=1    6                                * 79B09
L_79B0C:
        HST=0   3                                * 79B0C
        ST=0    7                                * 79B0F
        ST=0    10                               * 79B12
        ST=0    11                               * 79B15
        GOTO    L_79B5A                          * 79B18

* refs (1): 7956B
SUB_79B1C:
        ST=0    8                                * 79B1C
        ST=0    6                                * 79B1F
        XM=0                                     * 79B22
        ST=0    7                                * 79B25
        ST=0    10                               * 79B28
        ST=0    11                               * 79B2B
        GOSUB   SUB_79510                        * 79B2E
        GONC    L_79B5A                          * 79B32
        ?ST=0   6                                * 79B35
        GOYES   L_79B3E                          * 79B38
L_79B3A:
        GOTO    L_7967B                          * 79B3A
L_79B3E:
        GOSUB   SUB_79AB2                        * 79B3E
        GOSUB   XYEX~jump_79624                  * 79B42
        A=C     S                                * 79B46
        ?ST=1   4                                * 79B49
        GOYES   L_79B56                          * 79B4C
        ?ST=0   9                                * 79B4E
        GOYES   L_79B56                          * 79B51
        ST=1    7                                * 79B53
L_79B56:
        GOTO    L_79D1F                          * 79B56
L_79B5A:
        B=0     S                                * 79B5A
        ?ST=1   9                                * 79B5D
        GOYES   L_79B8A                          * 79B60
        ?B=0    W                                * 79B62
        GOYES   L_79BAB                          * 79B65
        GOSUB   SUB_795D6                        * 79B67
        GONC    L_79B73                          * 79B6B
        ?A=0    A                                * 79B6E
        GOYES   L_79BAB                          * 79B71
L_79B73:
        ?ST=0   6                                * 79B73
        GOYES   L_79BA8                          * 79B76
        LC(1)   #5                               * 79B78
        ?B#C    W                                * 79B7B
        GOYES   L_79BA8                          * 79B7E
        C=C-1   A                                * 79B80
        ?C=A    A                                * 79B82
        GOYES   L_79BAB                          * 79B85
        GONC    L_79BA8                          * 79B87
L_79B8A:
        ?ST=0   8                                * 79B8A
        GOYES   L_79BA3                          * 79B8D
        ?A#0    S                                * 79B8F
        GOYES   L_79BA8                          * 79B92
        ?A#0    A                                * 79B94
        GOYES   L_79BA8                          * 79B97
        GOSUB   SUB_795D6                        * 79B99
        GONC    L_79BA8                          * 79B9D
        GOC     L_79BAB                          * 79BA0
L_79BA3:
        ?B=0    W                                * 79BA3
        GOYES   L_79BAB                          * 79BA6
L_79BA8:
        ST=1    7                                * 79BA8
L_79BAB:
        ?A=0    S                                * 79BAB
        GOYES   L_79BC1                          * 79BAE
        ST=1    10                               * 79BB0
        ?ST=0   8                                * 79BB3
        GOYES   L_79BC1                          * 79BB6
        ST=0    8                                * 79BB8
        ST=1    11                               * 79BBB
        ST=0    10                               * 79BBE
L_79BC1:
        ?B#0    W                                * 79BC1
        GOYES   L_79BCA                          * 79BC4
        GOTO    L_79CF5                          * 79BC6
L_79BCA:
        C=A     A                                * 79BCA
        C=C+C   A                                * 79BCC
        GONC    L_79C27                          * 79BCE
        ?ST=0   6                                * 79BD1
        GOYES   L_79C23                          * 79BD4
        GOSUB   STAB0~jump_795E5                 * 79BD6
        GOSUB   STAB2~jump_795EC                 * 79BDA
        GOSUBL  SUB_78A28                        * 79BDE
        GOSUB   EXAB0~jump_79616                 * 79BE4
        GOSUBL  SUB_78A1F                        * 79BE8
        GOSUB   RCCD0~jump_79608                 * 79BEE
        GOSBVL  MULTF                            * 79BF2
        A=0     S                                * 79BF9
        GOSBVL  SQRF                             * 79BFC
        GOSUB   RCCD2~jump_7960F                 * 79C03
        GOSBVL  SUB_2B797                        * 79C07
        A=0     S                                * 79C0E
        C=A     A                                * 79C11
        C=C+C   A                                * 79C13
        GOC     L_79C23                          * 79C15
L_79C18:
        GOSBVL  1/X15                            * 79C18
        GOSUB   SUB_79AC8                        * 79C1F
L_79C23:
        GOTO    L_79C5E                          * 79C23
L_79C27:
        ?A#0    A                                * 79C27
        GOYES   L_79C33                          * 79C2A
        GOSUB   SUB_795D6                        * 79C2C
        GOC     L_79C3C                          * 79C30
L_79C33:
        ?ST=0   6                                * 79C33
        GOYES   L_79C18                          * 79C36
        GOTO    L_79B3A                          * 79C38
L_79C3C:
        ?ST=1   6                                * 79C3C
        GOYES   L_79C50                          * 79C3F
L_79C41:
        GOSUB   SUB_799DE                        * 79C41
        B=C     W                                * 79C45
        A=0     W                                * 79C48
        A=A-1   A                                * 79C4B
        GOC     L_79C5A                          * 79C4D
L_79C50:
        GOSUB   SUB_79AC8                        * 79C50
        A=0     W                                * 79C54
        B=0     W                                * 79C57
L_79C5A:
        GOTO    L_79CF5                          * 79C5A
L_79C5E:
        ?A=0    A                                * 79C5E
        GOYES   L_79C41                          * 79C61
        GOSUB   SUB_795D6                        * 79C63
        D=C     W                                * 79C67
        C=0     P                                * 79C6A
        C=A     A                                * 79C6D
L_79C6F:
        C=C+1   A                                * 79C6F
        GOC     L_79C81                          * 79C71
        C=C+1   S                                * 79C74
        P=P-1                                    * 79C77
        ?P#     7                                * 79C79
        GOYES   L_79C6F                          * 79C7C
        GONC    L_79C5A                          * 79C7E
L_79C81:
        DCEX    W                                * 79C81
        GOC     L_79C9F                          * 79C84
L_79C87:
        D=D+1   P                                * 79C87
        C=D     S                                * 79C8A
L_79C8D:
        ASR     W                                * 79C8D
        ASR     W                                * 79C90
        C=C-1   S                                * 79C93
        GONC    L_79C8D                          * 79C96
        C=0     S                                * 79C99
        C=C+A   W                                * 79C9C
L_79C9F:
        A=B     W                                * 79C9F
        B=B-C   W                                * 79CA2
        GONC    L_79C87                          * 79CA5
        B=A     W                                * 79CA8
        D=D+1   S                                * 79CAB
        BSL     W                                * 79CAE
        P=P-1                                    * 79CB1
        ?P#     7                                * 79CB3
        GOYES   L_79C9F                          * 79CB6
        DCEX    W                                * 79CB8
        BCEX    W                                * 79CBB
        A=B     W                                * 79CBE
        GOSBVL  L_2B9CE                          * 79CC1
        P=      8                                * 79CC8
L_79CCA:
        GOSUB   SUB_799E0                        * 79CCA
        GOTO    L_79CD5                          * 79CCE
L_79CD2:
        B=B+C   W                                * 79CD2
L_79CD5:
        A=A-1   P                                * 79CD5
        GONC    L_79CD2                          * 79CD8
        A=0     P                                * 79CDB
        BSR     W                                * 79CDE
        ?A=0    M                                * 79CE1
        GOYES   L_79CEE                          * 79CE4
        P=P+1                                    * 79CE6
        GOTO    L_79CCA                          * 79CE8
L_79CEC:
        P=P+1                                    * 79CEC
L_79CEE:
        A=A-1   A                                * 79CEE
        ?P#     14                               * 79CF0
        GOYES   L_79CEC                          * 79CF3
L_79CF5:
        A=0     S                                * 79CF5
        GOSUBL  SUB_78AE4                        * 79CF8
        ?ST=0   8                                * 79CFE
        GOYES   L_79D10                          * 79D01
        A=-A-1  S                                * 79D03
        GOSUB   SUB_79AB2                        * 79D06
        GOSUBL  SUB_78A33                        * 79D0A
L_79D10:
        ?ST=0   11                               * 79D10
        GOYES   L_79D1F                          * 79D13
        GOSUB   SUB_79AB2                        * 79D15
        GOSUBL  SUB_78A33                        * 79D19
L_79D1F:
        ?ST=1   4                                * 79D1F
        GOYES   L_79D38                          * 79D22
        ?ST=1   9                                * 79D24
        GOYES   L_79D4A                          * 79D27
        P=      7                                * 79D29
        GOSUB   SUB_799E0                        * 79D2B
        D=C     W                                * 79D2F
        C=0     A                                * 79D32
        GOTO    L_79D3C                          * 79D34
L_79D38:
        GOSUB   SUB_79AB2                        * 79D38
L_79D3C:
        C=C-1   A                                * 79D3C
        C=C-1   A                                * 79D3E
        BCEX    W                                * 79D40
        GOSBVL  L_2B9B9                          * 79D43
L_79D4A:
        GOSUB   SUB_79D58                        * 79D4A
        ?ST=0   10                               * 79D4E
        GOYES   L_79D56                          * 79D51
        A=-A-1  S                                * 79D53
L_79D56:
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
MULTF~jump_79D7F:
        GOVLNG  MULTF                            * 79D7F

* refs (3): 79F5C 79F93 79FA9
CLRFRC~jump_79D86:
        GOVLNG  CLRFRC                           * 79D86

* refs (7): 79DC4 79DE6 79DFE 79E4D 79E5C 79E93 ...
RCCD0~jump_79D8D:
        GOVLNG  RCCD0                            * 79D8D

* refs (2): 79DD7 79E19
RCCD2~jump_79D94:
        GOVLNG  RCCD2                            * 79D94

* refs (5): 79DD0 79DFA 79E30 79E73 79F58
STAB0~jump_79D9B:
        GOVLNG  STAB0                            * 79D9B

* refs (2): 79DBC 79E06
STAB2~jump_79DA2:
        GOVLNG  STAB2                            * 79DA2
L_79DA9:
        R4=A                                     * 79DA9
        A=0     S                                * 79DAC
        GOSUBL  L_78FD5                          * 79DAF
        GOSBVL  1/X15                            * 79DB5
        GOSUB   STAB2~jump_79DA2                 * 79DBC
        GOSUB   RADD1~jump_79F9F                 * 79DC0
        GOSUB   RCCD0~jump_79D8D                 * 79DC4
        GOSUB   MULTF~jump_79D7F                 * 79DC8
        GOSUB   SUB_79EA8                        * 79DCC
        GOSUB   STAB0~jump_79D9B                 * 79DD0
        A=0     S                                * 79DD4
        GOSUB   RCCD2~jump_79D94                 * 79DD7

* refs (2): 79E60 79F8C
RADDF~jump_79DDB:
        GOVLNG  RADDF                            * 79DDB
L_79DE2:
        GOSUB   L_79DA9                          * 79DE2
        GOSUB   RCCD0~jump_79D8D                 * 79DE6

* refs (2): 79E1D 79E97
SUB_79DEA:
        GOVLNG  SUB_2B797                        * 79DEA
L_79DF1:
        HST=0   3                                * 79DF1
        R4=A                                     * 79DF4
        A=0     S                                * 79DF7
        GOSUB   STAB0~jump_79D9B                 * 79DFA
        GOSUB   RCCD0~jump_79D8D                 * 79DFE
        GOSUB   MULTF~jump_79D7F                 * 79E02
        GOSUB   STAB2~jump_79DA2                 * 79E06
        GOSUB   RADD1~jump_79F9F                 * 79E0A
        GOSBVL  SQRF                             * 79E0E
        GOSUB   RADD1~jump_79F9F                 * 79E15
        GOSUB   RCCD2~jump_79D94                 * 79E19
        GOSUB   SUB_79DEA                        * 79E1D
        GOSUB   SUB_79E5C                        * 79E21
        C=R4                                     * 79E25
        A=C     S                                * 79E28
        RTN                                      * 79E2B
L_79E2D:
        HST=0   3                                * 79E2D
        GOSUB   STAB0~jump_79D9B                 * 79E30
        GOSUB   RSUB1~jump                       * 79E34
        ?B=0    M                                * 79E38
        GOYES   L_79E42                          * 79E3B
        ?A#0    S                                * 79E3D
        GOYES   L_79E88                          * 79E40
L_79E42:
        GOSBVL  EXAB0                            * 79E42
        GOSUB   RADD1~jump_79F9F                 * 79E49
        GOSUB   RCCD0~jump_79D8D                 * 79E4D
        GOSUB   MULTF~jump_79D7F                 * 79E51
        GOSBVL  SQRF                             * 79E55

* refs (1): 79E21
SUB_79E5C:
        GOSUB   RCCD0~jump_79D8D                 * 79E5C

* refs (1): 79EA4
SUB_79E60:
        GOSUB   RADDF~jump_79DDB                 * 79E60
        GOLONG  L_78DBC                          * 79E64
L_79E6A:
        HST=0   3                                * 79E6A
        R4=A                                     * 79E6D
        A=0     S                                * 79E70
        GOSUB   STAB0~jump_79D9B                 * 79E73
        A=-A-1  S                                * 79E77
        GOSUB   RADD1~jump_79F9F                 * 79E7A
        ?B=0    M                                * 79E7E
        GOYES   L_79E8C                          * 79E81
        ?A=0    S                                * 79E83
        GOYES   L_79E93                          * 79E86
L_79E88:
        P=      4                                * 79E88
        RTNSXM                                   * 79E8A
L_79E8C:
        A=R4                                     * 79E8C
        P=      3                                * 79E8F
        RTNSXM                                   * 79E91
L_79E93:
        GOSUB   RCCD0~jump_79D8D                 * 79E93
        GOSUB   SUB_79DEA                        * 79E97
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
        GOSUB   MULTF~jump_79D7F                 * 79EB8
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
        GOSBVL  SUB_2BBFC                        * 79EEF
        ?P=     15                               * 79EF6
        GOYES   L_79F18                          * 79EF9
        P=P+1                                    * 79EFB
        ?P#     15                               * 79EFD
        GOYES   L_79F0A                          * 79F00
        GOSUB   SUB_79F23                        * 79F02
        GOTO    L_79F12                          * 79F06
L_79F0A:
        P=P+1                                    * 79F0A
        GOSUB   SUB_79F23                        * 79F0C
        P=P-1                                    * 79F10
L_79F12:
        P=P-1                                    * 79F12
        GOSUB   SUB_79F23                        * 79F14
L_79F18:
        A=A-1   A                                * 79F18
        A=A-1   A                                * 79F1A
        GOVLNG  L_2B95E                          * 79F1C

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
        GOSUB   SUB_79F51                        * 79F34

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
SUB_79F51:
        HST=0   3                                * 79F51
        GOSUB   SUB_79F58                        * 79F54

* refs (1): 79F54
SUB_79F58:
        GOSUB   STAB0~jump_79D9B                 * 79F58
        GOSUB   CLRFRC~jump_79D86                * 79F5C
        C=0     W                                * 79F60
        P=      14                               * 79F63
        LC(1)   #6                               * 79F65
        D=C     W                                * 79F68
        C=C+1   A                                * 79F6B
        GOSUB   MULTF~jump_79D7F                 * 79F6D
        GOSBVL  EXAB0                            * 79F71
        GOSBVL  SUB_78A3A                        * 79F78
        ?B=0    M                                * 79F7F
        GOYES   L_79F88                          * 79F82
        A=A+1   A                                * 79F84
        A=A+1   A                                * 79F86
L_79F88:
        GOSUB   RCCD0~jump_79D8D                 * 79F88
        GOTO    RADDF~jump_79DDB                 * 79F8C
L_79F90:
        HST=0   3                                * 79F90
        GOSUB   CLRFRC~jump_79D86                * 79F93
        RTNC                                     * 79F97
        ?A#0    S                                * 79F9A
        RTNYES                                   * 79F9D

* refs (5): 79DC0 79E0A 79E15 79E49 79E7A
RADD1~jump_79F9F:
        GOVLNG  RADD1                            * 79F9F
L_79FA6:
        HST=0   3                                * 79FA6
        GOSUB   CLRFRC~jump_79D86                * 79FA9
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
        GOYES   L_79FE9                          * 79FDF
        ?ST=0   0                                * 79FE1
        GOYES   L_7A052                          * 79FE4
        GONC    L_79FEE                          * 79FE6
L_79FE9:
        ?ST=0   1                                * 79FE9
        GOYES   L_7A052                          * 79FEC
L_79FEE:
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
        GOSBVL  L_78E05                          * 7A020
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
L_7A052:
        C=-C-1  S                                * 7A052
        GOSBVL  RADDF                            * 7A055
        C=R2                                     * 7A05C
        P=C     15                               * 7A05F
        ?P=     15                               * 7A063
        RTNYES                                   * 7A066
        GOSBVL  RCCD2                            * 7A068

* refs (1): 2D10B
SUB_7A06F:
        GOSBVL  MULTF                            * 7A06F

* refs (1): 2D05A
SUB_7A076:
        GOSBVL  RCCD0                            * 7A076
        GOSBVL  RADDF                            * 7A07D
        GOVLNG  STAB0                            * 7A084

* refs (2): 2CCAF 902CF
SUB_7A08B:
        GOSUB   SUB_7A0BE                        * 7A08B
        A=A-1   X                                * 7A08F
L_7A092:
        A=A+1   X                                * 7A092
        BSRC                                     * 7A095
        ?B#0    WP                               * 7A098
        GOYES   L_7A092                          * 7A09B
        BSR     W                                * 7A09D
        A=B     M                                * 7A0A0
        A=0     S                                * 7A0A3
        P=      0                                * 7A0A6
        RTN                                      * 7A0A8

* refs (5): 2CE52 87258 88592 CB065 CB0F8
SUB_7A0AA:
        GOSUB   SUB_7A0BE                        * 7A0AA
        P=      0                                * 7A0AE
        LC(2)   #14                              * 7A0B0
        A=C     B                                * 7A0B4
        GOVLNG  L_2BC7E                          * 7A0B7

* refs (2): 7A08B 7A0AA
SUB_7A0BE:
        SETDEC                                   * 7A0BE
        C=0     W                                * 7A0C0
        C=A     A                                * 7A0C3
        A=0     W                                * 7A0C5
        B=0     W                                * 7A0C8
        A=A+1   A                                * 7A0CB
        P=      6                                * 7A0CD
L_7A0CF:
        ?C=0    A                                * 7A0CF
        GOYES   L_7A0E8                          * 7A0D2
        SB=0                                     * 7A0D4
        CSRB                                     * 7A0D7
        ?SB=0                                    * 7A0DA
        GOYES   L_7A0E2                          * 7A0DD
        B=B+A   WP                               * 7A0DF
L_7A0E2:
        A=A+A   WP                               * 7A0E2
        GONC    L_7A0CF                          * 7A0E5
L_7A0E8:
        A=0     WP                               * 7A0E8
        RTN                                      * 7A0EB
        BSS     16                               * 7A0ED

* refs (1): 11E36
SUB_7A0FD:
        C=A     A                                * 7A0FD
        RSTK=C                                   * 7A0FF
        ASR     A                                * 7A101
        ASR     A                                * 7A103
        LC(4)   #01E1                            * 7A105
        GOSUB   SUB_7A12C                        * 7A10B
        C=RSTK                                   * 7A10F
        A=C     A                                * 7A111
        GOSUB   SUB_7A126                        * 7A113
        B=C     A                                * 7A117
        LC(5)   #00014                           * 7A119
        C=C+B   A                                * 7A120
        BCEX    A                                * 7A122
        RTN                                      * 7A124

* refs (3): 11DD0 11EB1 7A113
SUB_7A126:
        LC(4)   #01CD                            * 7A126

* refs (1): 7A10B
SUB_7A12C:
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
        GOYES   L_7A176                          * 7A14B
        LC(2)   #1F                              * 7A14D
        ?C<=A   B                                * 7A151
        GOYES   L_7A160                          * 7A154
        LC(5)   Font10+2540                      * 7A156
        GONC    L_7A194                          * 7A15D
L_7A160:
        C=A     A                                * 7A160
        C=C+C   A                                * 7A162
        C=C+C   A                                * 7A164
        ASL     A                                * 7A166
        A=A+C   A                                * 7A168
        LC(5)   Font10-620                       * 7A16A
        C=C+A   A                                * 7A171
        GONC    L_7A194                          * 7A173
L_7A176:
        LC(2)   #1F                              * 7A176
        ?C<=A   B                                * 7A17A
        GOYES   L_7A189                          * 7A17D
        LC(5)   Font8+2032                       * 7A17F
        GONC    L_7A194                          * 7A186
L_7A189:
        ASL     A                                * 7A189
        LC(5)   Font8-496                        * 7A18B
        C=C+A   A                                * 7A192
L_7A194:
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
L_7A1E5:
        LC(4)   #00F5                            * 7A1E5
        A=C     A                                * 7A1EB
        C=RSTK                                   * 7A1ED
        D1=C                                     * 7A1EF
        RTN                                      * 7A1F2

* refs (1): 12046
SUB_7A1F4:
        C=0     S                                * 7A1F4
        C=C+1   S                                * 7A1F7

* refs (1): 12146
* Minifont renderer: glyph = #7C102 + 11*index, codes above #9F remapped through the table at #7C793
SUB_7A1FA:
        P=      0                                * 7A1FA
        LC(5)   #0011B                           * 7A1FC
        CD1EX                                    * 7A203
        RSTK=C                                   * 7A206
        C=DAT1  A                                * 7A208
        LC(4)   #00F5                            * 7A20B
        D1=C                                     * 7A211
L_7A214:
        C=C-1   S                                * 7A214
        GOC     L_7A1E5                          * 7A217
        C=A     A                                * 7A21A
        A=0     A                                * 7A21C
        A=C     B                                * 7A21E
        RSTK=C                                   * 7A221
        LC(2)   #1F                              * 7A223
        ?C<=A   B                                * 7A227
        GOYES   L_7A238                          * 7A22A
        LC(5)   Minifont+1111                    * 7A22C  minifont glyph for codes below #20
        A=C     A                                * 7A233
        GONC    L_7A294                          * 7A235
L_7A238:
        LC(2)   #9F                              * 7A238
        ?C>=A   B                                * 7A23C
        GOYES   L_7A25C                          * 7A23F
        A=A-C   B                                * 7A241
        LC(5)   MiniRemap                        * 7A244
        C=C+A   A                                * 7A24B
        C=C+A   A                                * 7A24D
        CD1EX                                    * 7A24F
        A=DAT1  B                                * 7A252
        CD1EX                                    * 7A255
        GOTO    L_7A27F                          * 7A258
L_7A25C:
        LC(2)   #61                              * 7A25C
        ?C>A    B                                * 7A260
        GOYES   L_7A27F                          * 7A263
        LC(2)   #7B                              * 7A265
        ?C>A    B                                * 7A269
        GOYES   L_7A278                          * 7A26C
        LC(2)   #1A                              * 7A26E
        A=A-C   B                                * 7A272
        GONC    L_7A27F                          * 7A275
L_7A278:
        LC(2)   #20                              * 7A278
        A=A-C   B                                * 7A27C
L_7A27F:
        C=A     A                                * 7A27F
        C=C+C   A                                * 7A281
        C=C+C   A                                * 7A283
        C=C+A   A                                * 7A285
        C=C+C   A                                * 7A287
        A=A+C   A                                * 7A289
        LC(5)   Minifont-341                     * 7A28B  minifont glyph i = #7C102 + 11*i
        A=A+C   A                                * 7A292
L_7A294:
        AD1EX                                    * 7A294
        C=DAT1  11                               * 7A297
        D1=A                                     * 7A29B
        DAT1=C  11                               * 7A29E
        D1=D1+  11                               * 7A2A2
        C=RSTK                                   * 7A2A5
        A=C     A                                * 7A2A7
        ASR     W                                * 7A2A9
        ASR     W                                * 7A2AC
        GOTO    L_7A214                          * 7A2AF
