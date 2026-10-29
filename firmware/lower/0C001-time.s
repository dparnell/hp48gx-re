* HP 48GX ROM revision R, #0C001-#0E005: Clock and alarms
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: CSRW5 CSLW5 HXDCW NewAlarm(li) DAY# rGETATELN WSLOGN DATE CKTIME ASLW5 Ticks>TOD Ticks>Date
* Follows on from the previous file (at #0C001 in the original ROM).
        LC(1)   #B                               * 0C001
        ?C<=A   P                                * 0C004
        GOYES   L_0C00C                          * 0C007
        LC(1)   #7                               * 0C009
L_0C00C:
        P=C     4                                * 0C00C
        P=P+1                                    * 0C010
        ST=1    0                                * 0C012
        GOSUB   SUB_0BE2D                        * 0C015
        D1=(4)  #05DB                            * 0C019
        A=DAT1  A                                * 0C01F
        D1=D1+  5                                * 0C022
        C=DAT1  3                                * 0C025
        ST=C                                     * 0C029
        RTNCC                                    * 0C02B
L_0C02D:
        C=RSTK                                   * 0C02D
        GOTO    L_0C096                          * 0C02F

* refs (1): 0C15C
SUB_0C033:
        D1=(5)  IRAM@                            * 0C033
        P=      4                                * 0C03A
        C=0     A                                * 0C03C
        C=DAT1  P                                * 0C03E
        B=C     A                                * 0C042
        D1=C                                     * 0C044
        D1=(4)  #00E6                            * 0C047
        C=DAT1  A                                * 0C04D
        C=0     B                                * 0C050
        ?B=C    P                                * 0C053
        GOYES   L_0C094                          * 0C056
        P=C     4                                * 0C058
        CSL     A                                * 0C05C
        B=C     A                                * 0C05E
        C=ST                                     * 0C060
        ST=1    0                                * 0C062
        ST=0    15                               * 0C065
        INTOFF                                   * 0C068
        D1=(4)  #05DB                            * 0C06C
        DAT1=A  A                                * 0C072
        D1=D1+  5                                * 0C075
        DAT1=C  3                                * 0C078
        GOSUB   SUB_0BE2D                        * 0C07C
        D1=(4)  #05DB                            * 0C080
        A=DAT1  A                                * 0C086
        D1=D1+  5                                * 0C089
        C=DAT1  3                                * 0C08C
        ST=C                                     * 0C090
        RTNCC                                    * 0C092
L_0C094:
        CSL     A                                * 0C094
L_0C096:
        B=C     A                                * 0C096
        D1=(5)  IRAM@                            * 0C098
        C=0     A                                * 0C09F
        P=      4                                * 0C0A1
        C=DAT1  P                                * 0C0A3
        ST=0    15                               * 0C0A7
        INTOFF                                   * 0C0AA
        DAT1=C  1                                * 0C0AE
        UNCNFG                                   * 0C0B2
        BCEX    A                                * 0C0B5
        CONFIG                                   * 0C0B7
        BCEX    A                                * 0C0BA
        CONFIG                                   * 0C0BC
        DAT1=C  P                                * 0C0BF
        D1=C                                     * 0C0C3
        D1=(4)  #065A                            * 0C0C6
        DAT1=C  1                                * 0C0CC
        P=C     4                                * 0C0D0
        ?P#     8                                * 0C0D4
        GOYES   L_0C0F5                          * 0C0D7
        P=      0                                * 0C0D9
        D1=(4)  #000A                            * 0C0DB
        C=DAT1  A                                * 0C0E1
        D1=(4)  #065A                            * 0C0E4
        ?B#C    A                                * 0C0EA
        GOYES   L_0C0F5                          * 0C0ED
        C=C+1   A                                * 0C0EF
        DAT1=C  1                                * 0C0F1
L_0C0F5:
        P=      0                                * 0C0F5
        D1=(4)  #0005                            * 0C0F7
        C=DAT1  A                                * 0C0FD
        BCEX    A                                * 0C100
        DAT1=C  A                                * 0C102
        RTNCC                                    * 0C105
        LC(5)   #00100                           * 0C107
        A=C     A                                * 0C10E
        GOTO    L_0C131                          * 0C110
        NIBHEX  3400100                          * 0C114  C..

* refs (1): 0C1F8
SUB_0C11B:
        SETHEX                                   * 0C11B
        P=      0                                * 0C11D
        A=C     A                                * 0C11F
        LC(5)   #00100                           * 0C121
        ?C<A    A                                * 0C128
        RTNYES                                   * 0C12B
        GOSUB   SUB_0BF76                        * 0C12D
L_0C131:
        LC(5)   IRAMBUFF                         * 0C131
        C=C+A   A                                * 0C138
        D1=C                                     * 0C13A
        GOSUB   L_0C169                          * 0C13D
        GOTO    L_0C14B                          * 0C141
        NIBHEX  006410                           * 0C145  .F.
L_0C14B:
        CD0EX                                    * 0C14B
        C=C+A   A                                * 0C14E
        D0=C                                     * 0C150
        C=A     A                                * 0C153
        GOSBVL  MOVEUP                           * 0C155
        GOSUB   SUB_0C033                        * 0C15C
        GOSBVL  AllowIntr                        * 0C160
        RTNCC                                    * 0C167
L_0C169:
        RSTK=C                                   * 0C169
        CD1EX                                    * 0C16B
        CPEX    4                                * 0C16E
        CPEX    0                                * 0C172
        CPEX    4                                * 0C176
        D1=(5)  IRAM@                            * 0C17A
        C=DAT1  1                                * 0C181
        CPEX    4                                * 0C185
        CPEX    0                                * 0C189
        CPEX    4                                * 0C18D
        D1=C                                     * 0C191
        C=RSTK                                   * 0C194
        RTN                                      * 0C196

* refs (11): 008D8 016DB 01EF6 04999 0CA67 133AF ...
SUB_0C198:
        D1=(5)  =IR_16Hz_Clock                   * 0C198
        C=DAT1  A                                * 0C19F
        D1=C                                     * 0C1A2
        RTN                                      * 0C1A5
L_0C1A7:
        D0=(5)  =IR_16Hz_Clock                   * 0C1A7
        C=DAT0  A                                * 0C1AE
        D0=C                                     * 0C1B1
        RTN                                      * 0C1B4

* refs (3): 008DF 01ABD 80EBC
SUB_0C1B6:
        D1=(5)  =IR_16Hz_Clock                   * 0C1B6
        A=DAT1  A                                * 0C1BD
        D1=A                                     * 0C1C0
        RTN                                      * 0C1C3

* refs (2): 01C31 01C58
SUB_0C1C5:
        D0=(5)  =IR_16Hz_Clock                   * 0C1C5
        A=DAT0  A                                * 0C1CC
        D0=A                                     * 0C1CF
        RTN                                      * 0C1D2
        D1=(5)  =IR_16Hz_Clock                   * 0C1D4
        A=DAT1  A                                * 0C1DB
        D1=A                                     * 0C1DE
        D1=(4)  #00F5                            * 0C1E1
        RTN                                      * 0C1E7
        D0=(5)  #7FFBF                           * 0C1E9
        P=      0                                * 0C1F0
        C=0     A                                * 0C1F2
        LC(2)   #0C                              * 0C1F4
        GOSUB   SUB_0C11B                        * 0C1F8
        D1=(4)  #00F5                            * 0C1FC
        RTN                                      * 0C202
        RPL

* refs (1): 6E91A
OBJ_0C204:
        :: palparse NOTcase2drop DROPFALSE       * 0C204
          OBJ_26BED NOTcasedrop TRUE             * 0C218
          3DROP FALSE ;                          * 0C227
        BSS     22                               * 0C236

* refs (2): 0FE9E 0FF7F
U>NCQ~1~7:
        CON(5)  (*)+5                            * 0C24C  primitive code object
        ASSEMBLE
        D1=D1+  5                                * 0C251
        D=D+1   A                                * 0C254
        GOSUB   SUB_0C2BB                        * 0C256
        GOSUB   SUB_0C2C2                        * 0C25A
        D0=D0+  12                               * 0C25E
        D1=D1-  5                                * 0C261
        A=DAT1  A                                * 0C264
        D1=A                                     * 0C267
        D1=D1+  5                                * 0C26A
        A=DAT1  B                                * 0C26D
L_0C270:
        C=DAT0  B                                * 0C270
        ?C=A    B                                * 0C273
        GOYES   L_0C27E                          * 0C276
        D0=D0+  4                                * 0C278
        GONC    L_0C270                          * 0C27B
L_0C27E:
        B=0     W                                * 0C27E
        P=      14                               * 0C281
        B=B+1   P                                * 0C283
        D0=D0+  2                                * 0C286
        A=DAT0  B                                * 0C289
        C=A     B                                * 0C28C
        SETDEC                                   * 0C28F
        A=A+A   B                                * 0C291
        A=0     A                                * 0C294
        GONC    L_0C29B                          * 0C296
        A=A-1   A                                * 0C299
L_0C29B:
        A=C     B                                * 0C29B
        A=0     S                                * 0C29E
        GOSBVL  SUB_2A24B                        * 0C2A1
        A=DAT0  A                                * 0C2A8
        D0=D0+  5                                * 0C2AB
        PC=(A)                                   * 0C2AE

* refs (3): 0C38A 0C39B 0C463
SUB_0C2B2:
        P=      0                                * 0C2B2
        GOVLNG  GETPTR                           * 0C2B4

* refs (4): 0C256 0C2D2 0C315 0C3A8
SUB_0C2BB:
        GOVLNG  SAVPTR                           * 0C2BB

* refs (2): 0C25A 0C2D6
SUB_0C2C2:
        D0=(5)  OBJ_760C9                        * 0C2C2
        SETHEX                                   * 0C2C9
        RTN                                      * 0C2CB

* refs (2): 0F09D 0FF70
OBJ_0C2CD:
        CON(5)  (*)+5                            * 0C2CD  primitive code object
        GOSUB   SUB_0C2BB                        * 0C2D2
        GOSUB   SUB_0C2C2                        * 0C2D6
        D0=D0+  10                               * 0C2DA
        A=DAT0  B                                * 0C2DD
        B=A     B                                * 0C2E0
        D0=D0+  2                                * 0C2E3
        A=DAT1  A                                * 0C2E6
        D1=A                                     * 0C2E9
        D1=D1+  5                                * 0C2EC
        A=DAT1  B                                * 0C2EF
L_0C2F2:
        C=DAT0  B                                * 0C2F2
        ?C#A    B                                * 0C2F5
        GOYES   L_0C2FE                          * 0C2F8
        GOTO    L_0C39B                          * 0C2FA
L_0C2FE:
        B=B-1   B                                * 0C2FE
        GONC    L_0C308                          * 0C301
        GOTO    L_0C38A                          * 0C304
L_0C308:
        D=C     A                                * 0C308
        D0=D0+  4                                * 0C30A
        GONC    L_0C2F2                          * 0C30D  always taken

* refs (2): 0F084 0F0B6
dup;stdunit(st)?:
        CON(5)  (*)+5                            * 0C310  primitive code object
        GOSUB   SUB_0C2BB                        * 0C315
        D0=(5)  L_7567F                          * 0C319
        A=DAT1  A                                * 0C320
        D1=A                                     * 0C323
        D1=D1+  5                                * 0C326
        A=DAT1  A                                * 0C329
        LC(5)   #00006                           * 0C32C
        C=A-C   A                                * 0C333
        R1=C                                     * 0C335
        D1=D1+  5                                * 0C338
        A=DAT1  W                                * 0C33B
        R2=A                                     * 0C33F
        C=R1                                     * 0C342
        CPEX    0                                * 0C345
        ?C#0    A                                * 0C349
        GOYES   L_0C38A                          * 0C34C
        C=P     0                                * 0C34E
        C=C-1   A                                * 0C352
        C=C+C   A                                * 0C354
        AD0EX                                    * 0C356
        C=C+A   A                                * 0C359
        D0=C                                     * 0C35B
        C=0     A                                * 0C35E
        C=DAT0  4                                * 0C360
        A=R2                                     * 0C364
L_0C367:
        ?C=0    A                                * 0C367
        GOYES   L_0C38A                          * 0C36A
        D=C     A                                * 0C36C
        CD0EX                                    * 0C36E
        C=C+D   A                                * 0C371
        D0=C                                     * 0C373
        C=DAT0  WP                               * 0C376
        ?C=A    WP                               * 0C37A
        GOYES   L_0C39B                          * 0C37D
        D0=D0-  2                                * 0C37F
        C=0     A                                * 0C382
        C=DAT0  B                                * 0C384
        GONC    L_0C367                          * 0C387
L_0C38A:
        GOSUB   SUB_0C2B2                        * 0C38A
        LC(5)   FALSE                            * 0C38E
        A=C     A                                * 0C395
        PC=(A)                                   * 0C397
L_0C39B:
        GOSUB   SUB_0C2B2                        * 0C39B
        GOTO    L_0C4D6                          * 0C39F

* refs (1): 0FEF8
U>NCQ~1~8:
        CON(5)  (*)+5                            * 0C3A3  primitive code object
        GOSUB   SUB_0C2BB                        * 0C3A8
        D0=(5)  L_7567F                          * 0C3AC
        A=DAT1  A                                * 0C3B3
        D1=A                                     * 0C3B6
        D1=D1+  5                                * 0C3B9
        A=DAT1  A                                * 0C3BC
        LC(5)   #00006                           * 0C3BF
        C=A-C   A                                * 0C3C6
        R1=C                                     * 0C3C8
        D1=D1+  5                                * 0C3CB
        A=DAT1  W                                * 0C3CE
        R2=A                                     * 0C3D2
        C=R1                                     * 0C3D5
        CPEX    0                                * 0C3D8
        ?C#0    A                                * 0C3DC
        GOYES   L_0C38A                          * 0C3DF
        C=P     0                                * 0C3E1
        C=C-1   A                                * 0C3E5
        C=C+C   A                                * 0C3E7
        AD0EX                                    * 0C3E9
        C=C+A   A                                * 0C3EC
        D0=C                                     * 0C3EE
        C=0     A                                * 0C3F1
        C=DAT0  4                                * 0C3F3
        A=R2                                     * 0C3F7
L_0C3FA:
        ?C#0    A                                * 0C3FA
        GOYES   L_0C403                          * 0C3FD
        GOTO    L_0C38A                          * 0C3FF
L_0C403:
        D=C     A                                * 0C403
        CD0EX                                    * 0C405
        C=C+D   A                                * 0C408
        D0=C                                     * 0C40A
        C=DAT0  WP                               * 0C40D
        ?C=A    WP                               * 0C411
        GOYES   L_0C421                          * 0C414
        D0=D0-  2                                * 0C416
        C=0     A                                * 0C419
        C=DAT0  B                                * 0C41B
        GONC    L_0C3FA                          * 0C41E
L_0C421:
        CD0EX                                    * 0C421
        C+P+1                                    * 0C424
        SETHEX                                   * 0C427
        D1=C                                     * 0C429
        C=DAT1  S                                * 0C42C
        D1=D1+  1                                * 0C430
        C=C-1   S                                * 0C433
        GOC     L_0C457                          * 0C436
        P=C     15                               * 0C439
        A=0     W                                * 0C43D
        A=DAT1  WP                               * 0C440
        CD1EX                                    * 0C444
        C+P+1                                    * 0C447
        R1=C                                     * 0C44A
        GOSBVL  SUB_10CDB                        * 0C44D
        GONC    L_0C467                          * 0C454
L_0C457:
        A=DAT1  A                                * 0C457
        D1=D1+  5                                * 0C45A
        CD1EX                                    * 0C45D
        R1=C                                     * 0C460
        GOSUB   SUB_0C2B2                        * 0C463
L_0C467:
        DAT1=A  A                                * 0C467
        C=R1                                     * 0C46A
        D0=C                                     * 0C46D
        C=DAT0  S                                * 0C470
        D0=D0+  1                                * 0C474
        C=C-1   S                                * 0C477
        GOC     L_0C4BE                          * 0C47A
        C=DAT0  B                                * 0C47D
        B=C     B                                * 0C480
        SETDEC                                   * 0C483
        B=B+B   B                                * 0C485
        B=0     A                                * 0C488
        GONC    L_0C48F                          * 0C48A
        B=B-1   A                                * 0C48D
L_0C48F:
        B=C     B                                * 0C48F
        D0=D0+  2                                * 0C492
        P=C     15                               * 0C495
        A=DAT0  WP                               * 0C499
        P=P+1                                    * 0C49D
L_0C49F:
        P=P+1                                    * 0C49F
        GOC     L_0C4AA                          * 0C4A1
        ASL     W                                * 0C4A4
        GONC    L_0C49F                          * 0C4A7
L_0C4AA:
        B=0     S                                * 0C4AA
        A=0     S                                * 0C4AD
        ABEX    W                                * 0C4B0
        GOSBVL  SUB_2A24B                        * 0C4B3
        GOTO    L_0C4D6                          * 0C4BA
L_0C4BE:
        A=DAT0  A                                * 0C4BE
        R1=A                                     * 0C4C1
        A=0     A                                * 0C4C4
        R0=A                                     * 0C4C6
        GOSBVL  PUSH#                            * 0C4C9
        A=R1                                     * 0C4D0
        DAT1=A  A                                * 0C4D3
L_0C4D6:
        LC(5)   TRUE                             * 0C4D6
        A=C     A                                * 0C4DD
        PC=(A)                                   * 0C4DF
        RPL

* refs (16): 69512 69DB6 69E06 69E42 6A019 6A055 ...
OBJ_0C4E3:
        :: OBJ_673E6 OBJ_673D6 #- ;              * 0C4E3
        NIBHEX  00000                            * 0C4FC  ..

* #i [] -> ob T -> F
* refs (1): 04DA0
GETEL:
        CON(5)  GETEL~1                          * 0C501  code object: the address of its machine code

* refs (4): 9A372 9A650 9A891 9AC15
rGETATELN:
        CON(5)  rGETATELN~1                      * 0C506  code object: the address of its machine code
        ASSEMBLE

* refs (2): 0C5BC 0C5E3
SUB_0C50B:
        RSTK=C                                   * 0C50B
        RTN                                      * 0C50D
L_0C50F:
        C=R1                                     * 0C50F
        GOSBVL  SUB_037F5                        * 0C512
        R2=A                                     * 0C519
        C=R1                                     * 0C51C
        D1=C                                     * 0C51F
        GOSBVL  LenArD1                          * 0C522
        C=R0                                     * 0C529
        ?C=0    A                                * 0C52C
        GOYES   L_0C54F                          * 0C52F
        ?C>A    A                                * 0C531
        GOYES   L_0C54F                          * 0C534
        A=C     A                                * 0C536
        C=R1                                     * 0C538
        GOSBVL  SUB_038A0                        * 0C53B
        ?ST=0   3                                * 0C542
        GOYES   L_0C562                          * 0C545
        A=DAT0  A                                * 0C547
        ?A#0    A                                * 0C54A
        GOYES   L_0C55A                          * 0C54D
L_0C54F:
        D1=(5)  FALSE                            * 0C54F
        GOTO    L_0C5D3                          * 0C556
L_0C55A:
        CD0EX                                    * 0C55A
        C=C+A   A                                * 0C55D
        D0=C                                     * 0C55F
L_0C562:
        AD0EX                                    * 0C562
        D0=A                                     * 0C565
        B=A     A                                * 0C568
        A=R2                                     * 0C56A
        GOSBVL  SUB_03012                        * 0C56D
        AD0EX                                    * 0C574
        D0=A                                     * 0C577
        A=A-B   A                                * 0C57A
        ?ST=1   4                                * 0C57C
        GOYES   L_0C59C                          * 0C57F
        LC(5)   IRAMBUFF                         * 0C581
        C=C+A   A                                * 0C588
        D1=C                                     * 0C58A
        D1=D1+  5                                * 0C58D
        C=A     A                                * 0C590
        GOSUBL  MOVEUP                           * 0C592
        GOTO    L_0C5CA                          * 0C598
L_0C59C:
        C=B     A                                * 0C59C
        R0=C.F  A                                * 0C59E
        LC(5)   #800FA                           * 0C5A4
        R1=C.F  A                                * 0C5AB
        C=0     S                                * 0C5B1
        P=      2                                * 0C5B4
        C=R3.F  A                                * 0C5B6
        GOSUB   SUB_0C50B                        * 0C5BC
        D1=(5)  #800FA                           * 0C5C0
        ST=0    4                                * 0C5C7
L_0C5CA:
        A=R2                                     * 0C5CA
        D1=D1-  5                                * 0C5CD
        DAT1=A  A                                * 0C5D0
L_0C5D3:
        AD1EX                                    * 0C5D3
        ?ST=0   4                                * 0C5D6
        GOYES   L_0C5E7                          * 0C5D9
        P=      1                                * 0C5DB
        C=R3.F  A                                * 0C5DD
        GOSUB   SUB_0C50B                        * 0C5E3
L_0C5E7:
        GOSUBL  GETPTR                           * 0C5E7
        DAT1=A  A                                * 0C5ED
        LC(5)   FALSE                            * 0C5F0
        ?C=A    A                                * 0C5F7
        GOYES   L_0C60B                          * 0C5FA
        LC(5)   TRUE                             * 0C5FC
        P=      0                                * 0C603
        A=C     A                                * 0C605
        PC=(A)                                   * 0C607
L_0C60B:
        A=DAT0  A                                * 0C60B
        D0=D0+  5                                * 0C60E
        PC=(A)                                   * 0C611
        NIBHEX  8EB59F8D5E010                    * 0C615  è[ùØå.
        RPL

* refs (1): 8CA39
OBJ_0C622:
        :: BINT3 EQcasedrop OBJ_7395E            * 0C622
          BINT4 EQcasedrop OBJ_7399A             * 0C636
          15GETLAM DUP 21GETLAM 4ROLL DUP#0=ITE 2DROP * 0C645

* refs (1): 0C6FE
OBJ_0C663:
          :: #1= ITE %+ %-                       * 0C663
          ;                                      * 0C67C
          OBJ_46955 NOTcase OBJ_46C1B            * 0C681
          DUPTYPEREAL? NOTcasedrop OBJ_46C1B     * 0C690
          DUP OBJ_468F1 15GETLAM %POL>%REC OBJ_46C43 ; * 0C69F

* refs (1): 8CB7D
OBJ_0C6BD:
        :: BINT3 EQcasedrop OBJ_7395E            * 0C6BD
          BINT4 EQcasedrop OBJ_7399A             * 0C6D1
          15GETLAM DUP 21GETLAM 4ROLL DUP#0=ITE 2DROP OBJ_0C663 OBJ_46955 * 0C6E0
          ITE                                    * 0C708
          :: DUP OBJ_468F1 ; OBJ_46C7A           * 0C70D
          DUPTYPECMP? NOTcasedrop OBJ_46C7A      * 0C726
          C%>% OBJ_46C43 ;                       * 0C735

        :: 1GETLAM TYPEBINT? ;                   * 0C744

* refs (1): 4B487
OBJ_0C758:
        :: OBJ_6F595 #1<> FALSE GOTO L_6F86F ;   * 0C758

* refs (1): 734E0
OBJ_0C77B:
        :: OBJ_0C7C6 NOTcase NULL$               * 0C77B

_STATL_:
          $ "STATL" ;                            * 0C78F

* refs (1): 734F4
OBJ_0C7A8:
        :: OBJ_0C7C6 NOTcase DoBadKey            * 0C7A8
          OBJ_48FB8 ;                            * 0C7BC

* refs (2): 0C780 0C7AD
OBJ_0C7C6:
        :: GETPTYPE 'IDSCATTER EQUAL NOTcaseFALSE Exist@äDAT? * 0C7C6
          NOTcaseFALSE DROPTRUE                  * 0C7E4
        ;                                        * 0C7EE

* refs (2): 0C81B 4BF67
OBJ_0C7F3:
        :: ' OBJ_47209 ' OBJ_47236 ;             * 0C7F3

* refs (2): 4D4DE 4D5CE
OBJ_0C811:
        :: NOT?SEMI                              * 0C811
          OBJ_0C7F3 SWAP ;                       * 0C81B

        :: TakeOver OBJ_470E9 OBJ_5102B IT       * 0C82A
          :: OBJ_47209 OBJ_47236 ;               * 0C843
          BINT16 REPKEY? NOT?SEMI                * 0C857
          OBJ_5102B NOTcase                      * 0C866
          :: BEGIN BINT16 REPKEY? WHILE          * 0C870
            :: OBJ_470E9 ; REPEAT ;              * 0C889
          BEGIN BINT16 REPKEY? WHILE             * 0C8A2
          ::                                     * 0C8B6
            :: OBJ_470E9 OBJ_47209 ; ;           * 0C8BB
          REPEAT ;                               * 0C8D4

        :: #1=case OBJ_4DDE6                     * 0C8DE
          OBJ_4DDAF ;                            * 0C8ED

* refs (1): 0C988
OBJ_0C8F7:
        :: CHECKMENU OBJ_73684 OBJ_48305 ' OBJ_47D93 InitMenu DispMenu ; * 0C8F7

* refs (1): 47DFA
OBJ_0C924:
        :: CHECKMENU CURRENTMARK? IT OBJ_48288   * 0C924
          BINT3 3PUTLAM OBJ_517B2 12PUTLAM 2PUTLAM * 0C93D
          { OBJ_456C2 OBJ_456C2 OBJ_456C2 OBJ_456C2 * 0C956

{CANCEL}:
            {                                    * 0C96F

_CANCL_:
              $ "(AN(L" OBJ_0C8F7 }              * 0C974

{ZOOM}:
            {                                    * 0C992

_ZOOM_:
              $ "ZOOM"                           * 0C997
              :: CHECKMENU OBJ_4EEBF 2GETLAM 12GETLAM OBJ_4E799 ; } * 0C9A9
          }                                      * 0C9D1
          InitMenu DispMenu.1 OBJ_4EE6F CROSS_OFF OBJ_517B2 PIXON3 * 0C9D6
          CROSS_HAIRS ;                          * 0C9F4

* refs (5): 48B57 48B89 49876 4A000 4A01E
OBJ_0C9FE:
        :: DispCoord1 BINT2 16PUTLAM ;           * 0C9FE

* refs (1): 4E293
CHECKMENU~1:
        :: 16GETLAM BINT0 #<> ;                  * 0CA17
        BSS     10                               * 0CA30
        ASSEMBLE
L_0CA3A:
        D0=D0+  2                                * 0CA3A
        D1=D1+  2                                * 0CA3D
        C=DAT1  B                                * 0CA40
        DAT0=C  B                                * 0CA43
        D0=D0-  2                                * 0CA46
        GOVLNG  L_09A4C                          * 0CA49
        BSS     16                               * 0CA50

* ATTN exit check with restoreiram
ATTNchk:
        SETHEX                                   * 0CA60
        CD1EX                                    * 0CA62
        D=C     A                                * 0CA65
        GOSBVL  SUB_0C198                        * 0CA67
        D1=(4)  #07F7                            * 0CA6E
        C=DAT1  A                                * 0CA74
        DCEX    A                                * 0CA77
        D1=C                                     * 0CA79
        ?D=0    A                                * 0CA7C
        RTNYES                                   * 0CA7F

* refs (20): 87140 871C1 8739C 87714 878B4 87903 ...
SUB_0CA81:
        SETHEX                                   * 0CA81
        CD0EX                                    * 0CA83
        D=C     A                                * 0CA86
        D0=(5)  ATTNFLG                          * 0CA88
        C=DAT0  A                                * 0CA8F
        DCEX    A                                * 0CA92
        D0=C                                     * 0CA94
        ?D=0    A                                * 0CA97
        RTNYES                                   * 0CA9A
        P=      0                                * 0CA9C
        GOSBVL  GETPTR                           * 0CA9E
        LC(5)   ?ATTNQUIT                        * 0CAA5
        A=C     A                                * 0CAAC
        PC=(A)                                   * 0CAAE
        NIBHEX  0000000E952000                   * 0CAB2  ...àY..

LIB00D:
        CON(3)  #00D                             * 0CAC0  library number
        CON(5)  0                                * 0CAC3  hash table
        REL(5)  LIB00D.message                   * 0CAC8  message table
        CON(5)  0                                * 0CACD  link table
        REL(5)  LIB00D.config                    * 0CAD2  config
        RPL

* refs (1): 0CAC0
LIB00D.config:
        :: OBJ_0CAF5 IT OBJ_0CB16                * 0CAD7
          OBJ_0CB48 ;                            * 0CAEB

* refs (1): 0CADC
OBJ_0CAF5:
        CON(5)  (*)+5                            * 0CAF5  primitive code object
        ASSEMBLE
        CD0EX                                    * 0CAFA
        D0=(5)  ALARMS                           * 0CAFD
        A=DAT0  A                                * 0CB04
        CD0EX                                    * 0CB07
        ?A=0    A                                * 0CB0A
        GOYES   L_0CB0F                          * 0CB0D
L_0CB0F:
        GOVLNG  PushT/FLoop                      * 0CB0F
        RPL

* refs (1): 0CAE6
OBJ_0CB16:
        :: RclAlarms? NOTcase                    * 0CB16

DelAlarms:
          :: NULL{} NewAlarm(li) ;               * 0CB25
          OBJ_0E219 DROP ;                       * 0CB39

* refs (1): 0CAEB
OBJ_0CB48:
        :: RclAlarms? NOTcase TRM?               * 0CB48
          ALARMS@ EQ NOTcase TRM?                * 0CB5C
          OBJ_0CB84 case TRM?                    * 0CB70
        ;                                        * 0CB7F

* refs (1): 0CB70
OBJ_0CB84:
        CON(5)  (*)+5                            * 0CB84  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 0CB89
        GOSBVL  SUB_0E89C                        * 0CB90
        GOSBVL  GETPTR                           * 0CB97
        GOTO    L_0CB0F                          * 0CB9E

* refs (3): 0CB57 0CB6B 0CB7A
TRM?:
        CON(5)  (*)+5                            * 0CBA2  primitive code object
        GOVLNG  TryToRM?                         * 0CBA7

* Error D04h
* refs (3): 0E3F3 0E756 B7ADF
NOALARMERR:
        CON(5)  (*)+5                            * 0CBAE  primitive code object
        GOTO    NOALARMERR~1                     * 0CBB3
L_0CBB7:
        GOSUB   SUB_0CBEF                        * 0CBB7
        LC(3)   #D01                             * 0CBBB
        GOTO    L_0CBE3                          * 0CBC0

* refs (3): 0D28D 0D953 0E68C
ErrTime:
        GOSUB   SUB_0CBEF                        * 0CBC4
        LC(3)   #D02                             * 0CBC8
        GOTO    L_0CBE3                          * 0CBCD
L_0CBD1:
        GOSUB   SUB_0CBEF                        * 0CBD1
        LC(3)   #D03                             * 0CBD5
        GOTO    L_0CBE3                          * 0CBDA
NOALARMERR~1:
        LC(3)   #D04                             * 0CBDE
L_0CBE3:
        A=0     A                                * 0CBE3
        A=C     X                                * 0CBE5
        GOVLNG  Errjmp                           * 0CBE8

* refs (3): 0CBB7 0CBC4 0CBD1
SUB_0CBEF:
        P=      0                                * 0CBEF
        SETHEX                                   * 0CBF1
        GOVLNG  GETPTR                           * 0CBF3

* -> %time
* refs (3): 19801 39AAB B6D08
TOD:
        CON(5)  (*)+5                            * 0CBFA  primitive code object
        GOSUB   SUB_0D2E9                        * 0CBFF
L_0CC03:
        GOSBVL  SUB_0DA87                        * 0CC03
        GOTO    L_0CC32                          * 0CC0A

* -> %date
* refs (4): 0E51A 1981C 39A88 B6EFA
DATE:
        CON(5)  (*)+5                            * 0CC0E  primitive code object
        GOSUB   SUB_0D2E9                        * 0CC13
L_0CC17:
        GOSBVL  SUB_0DB7B                        * 0CC17
        GOSUB   SUB_0CF23                        * 0CC1E
        ?A=0    W                                * 0CC22
        GOYES   L_0CC32                          * 0CC25
        GOSBVL  HXDCW                            * 0CC27
        GOSUB   SUB_0CF2A                        * 0CC2E
L_0CC32:
        GOVLNG  PUSH%LOOP                        * 0CC32

* %date1 %date2 -> %days
* refs (1): 199C1
DDAYS:
        CON(5)  (*)+5                            * 0CC39  primitive code object
        GOSBVL  POP2%                            * 0CC3E
        B=C     A                                * 0CC45
        GOSUB   SUB_0CF23                        * 0CC47
        C=B     A                                * 0CC4B
        GOSBVL  SUB_0D6FD                        * 0CC4D
        GONC    L_0CC32                          * 0CC54
        GOTO    L_0CCE2                          * 0CC57
        RPL

* %date %days -> %date'
* refs (1): 199E1
DATE+DAYS:
        :: # 1 OBJ_2B551 date+(r,n) ;            * 0CC5B

* refs (1): 0CC6F
date+(r,n):
        CON(5)  (*)+5                            * 0CC79  primitive code object
        ASSEMBLE
        GOSBVL  POP2%                            * 0CC7E
        B=C     A                                * 0CC85
        GOSUB   SUB_0CF23                        * 0CC87
        C=B     A                                * 0CC8B
        R0=A                                     * 0CC8D
        A=C     W                                * 0CC90
        B=A     S                                * 0CC93
        A=0     S                                * 0CC96
        P=      8                                * 0CC99
        C=0     W                                * 0CC9B
        LC(9)   #603074323                       * 0CC9E
        GOSBVL  Y<=X                             * 0CCA9
        GONC    L_0CCE9                          * 0CCB0
        C=A     W                                * 0CCB3
        A=B     S                                * 0CCB6
        P=C     0                                * 0CCB9
        C=0     A                                * 0CCBD
        CSL     W                                * 0CCBF
L_0CCC2:
        CSLC                                     * 0CCC2
        P=P-1                                    * 0CCC5
        GONC    L_0CCC2                          * 0CCC7
        ?B=0    S                                * 0CCCA
        GOYES   L_0CCD2                          * 0CCCD
        C=-C    W                                * 0CCCF
L_0CCD2:
        R1=C                                     * 0CCD2
        A=R0                                     * 0CCD5
        GOSBVL  SUB_0D36C                        * 0CCD8
        GONC    L_0CCF0                          * 0CCDF
L_0CCE2:
        GOVLNG  L_0CBB7                          * 0CCE2
L_0CCE9:
        GOVLNG  L_2AE89                          * 0CCE9
L_0CCF0:
        GOSBVL  DAY#                             * 0CCF0
        A=R1                                     * 0CCF7
        A=A+C   W                                * 0CCFA
        ?A#0    S                                * 0CCFD
        GOYES   L_0CCE9                          * 0CD00
        P=      0                                * 0CD02
        C=0     W                                * 0CD04
        LC(7)   #3652424                         * 0CD07
        ?C<A    W                                * 0CD10
        GOYES   L_0CCE9                          * 0CD13
        LC(7)   #0578101                         * 0CD15
        ?C>A    W                                * 0CD1E
        GOYES   L_0CCE9                          * 0CD21
        GOSUB   SUB_0CF2A                        * 0CD23
        GOTO    L_0CC32                          * 0CD27
        RPL

* %date ->
* refs (2): 198AD B6FD2
>DATE:
        :: ->date!(r) OBJ_0E164 ;                * 0CD2B

* %time ->
* refs (1): 198ED
CLKADJ:
        :: clkadj!(r) OBJ_0E164 ;                * 0CD3F

* %time ->
* refs (2): 198CD B6EEB
>TIME:
        :: ->time!(r) OBJ_0E164 ;                * 0CD53

* refs (1): 0CD30
->date!(r):
        CON(5)  (*)+5                            * 0CD67  primitive code object
        ASSEMBLE
        GOSBVL  POPDATE%                         * 0CD6C
        GOSBVL  SUB_0DB0B                        * 0CD73
        GONC    L_0CD81                          * 0CD7A
        GOTO    L_0CCE2                          * 0CD7D
L_0CD81:
        GOSBVL  YMD>Ticks                        * 0CD81
        R2=C                                     * 0CD88
        ST=0    15                               * 0CD8B
        GOSBVL  GetTimChk                        * 0CD8E
        GOSBVL  SUB_0DB6C                        * 0CD95
        C=R2                                     * 0CD9C
        C=C+B   W                                * 0CD9F
        GOTO    L_0CE80                          * 0CDA2

* refs (1): 0CD58
->time!(r):
        CON(5)  (*)+5                            * 0CDA6  primitive code object
        ST=0    15                               * 0CDAB
        GOSBVL  POPTIME%                         * 0CDAE
        R0=A                                     * 0CDB5
        GOSBVL  GetTimChk                        * 0CDB8
        GOSBVL  SUB_0DB6C                        * 0CDBF
        C=R0                                     * 0CDC6
        C=C+A   W                                * 0CDC9
        GOTO    L_0CE80                          * 0CDCC

a/pm!:
        CON(5)  (*)+5                            * 0CDD0  primitive code object
        GOSUB   SUB_0CF15                        * 0CDD5
        ST=0    15                               * 0CDD9
        GOSBVL  GetTimChk                        * 0CDDC
        GOSBVL  SUB_0DB6C                        * 0CDE3
        C=0     W                                * 0CDEA
        LC(8)   #15180000                        * 0CDED
        ?B<C    W                                * 0CDF7
        GOYES   L_0CE02                          * 0CDFA
        B=B-C   W                                * 0CDFC
        GONC    L_0CE05                          * 0CDFF
L_0CE02:
        B=B+C   W                                * 0CE02
L_0CE05:
        A=A+B   W                                * 0CE05
        C=A     W                                * 0CE08
        GOTO    L_0CE80                          * 0CE0B

* refs (1): 0CD44
clkadj!(r):
        CON(5)  (*)+5                            * 0CE0F  primitive code object
        GOSBVL  POP1%SPLITA                      * 0CE14
        R0=A                                     * 0CE1B
        A=0     S                                * 0CE1E
        GOSBVL  CLRFRC                           * 0CE21
        P=      14                               * 0CE28
        ?B=0    P                                * 0CE2A
        GOYES   L_0CEA7                          * 0CE2D
        C=0     W                                * 0CE2F
        D=0     W                                * 0CE32
        D=D+1   P                                * 0CE35
        P=      0                                * 0CE38
        LC(2)   #12                              * 0CE3A
        ?C>A    A                                * 0CE3E
        GOYES   L_0CE4A                          * 0CE41
        GOSBVL  XYEX                             * 0CE43
L_0CE4A:
        C=0     W                                * 0CE4A
        C=B     M                                * 0CE4D
        CSL     W                                * 0CE50
L_0CE53:
        CSLC                                     * 0CE53
        A=A-1   A                                * 0CE56
        GONC    L_0CE53                          * 0CE58
        GOSBVL  DCHXW                            * 0CE5B
        C=R0                                     * 0CE62
        ?C=0    S                                * 0CE65
        GOYES   L_0CE6D                          * 0CE68
        A=-A    W                                * 0CE6A
L_0CE6D:
        R0=A                                     * 0CE6D
        ST=0    15                               * 0CE70
        GOSBVL  GetTimChk                        * 0CE73
        A=R0                                     * 0CE7A
        C=C+A   W                                * 0CE7D
L_0CE80:
        DCEX    W                                * 0CE80
        R1=C                                     * 0CE83
        DCEX    W                                * 0CE86
        GOSBVL  SUB_0EA58                        * 0CE89
        GOSBVL  SUB_0D877                        * 0CE90
        C=R1                                     * 0CE97
        D=C     W                                * 0CE9A
        C=R0                                     * 0CE9D
        GOSBVL  SUB_01496                        * 0CEA0
L_0CEA7:
        GOSBVL  AllowIntr                        * 0CEA7
        P=      0                                * 0CEAE
        SETHEX                                   * 0CEB0
        GOVLNG  GETPTRLOOP                       * 0CEB2

        CON(5)  (*)+5                            * 0CEB9  primitive code object
        GOSUB   SUB_0CF15                        * 0CEBE
        D1=(5)  #8084C                           * 0CEC2
        A=0     A                                * 0CEC9
        C=DAT1  1                                * 0CECB
        ?CBIT=0 3                                * 0CECF
        GOYES   L_0CEF5                          * 0CED4
        GONC    L_0CEE4                          * 0CED6

* refs (1): 048E5
GETKEY~1~1~2:
        CON(5)  (*)+5                            * 0CED9  primitive code object
        GOSUB   SUB_0CF15                        * 0CEDE
        A=0     A                                * 0CEE2
L_0CEE4:
        A=A-1   A                                * 0CEE4
        GOTO    L_0CEF5                          * 0CEE6

* refs (2): 048CC 0DCE5
OBJ_0CEEA:
        CON(5)  (*)+5                            * 0CEEA  primitive code object
        GOSUB   SUB_0CF15                        * 0CEEF
        A=0     A                                * 0CEF3
L_0CEF5:
        D1=(5)  ClkOnNib                         * 0CEF5
        DAT1=A  1                                * 0CEFC
        ST=0    15                               * 0CF00
        GOSBVL  SUB_01485                        * 0CF03
        GOTO    L_0CEA7                          * 0CF0A

* refs (2): 0CF6D 0CFBD
SUB_0CF0E:
        GOVLNG  GETPTR                           * 0CF0E

* refs (7): 0CDD5 0CEBE 0CEDE 0CEEF 0CF60 0CF79 ...
SUB_0CF15:
        GOVLNG  SAVPTR                           * 0CF15

* refs (4): 0CF69 0CFED 0D099 0D1A5
SUB_0CF1C:
        GOVLNG  MAKE$                            * 0CF1C

* refs (4): 0CC1E 0CC47 0CC87 0D247
SUB_0CF23:
        GOVLNG  CLKUTL1                          * 0CF23

* refs (3): 0CC2E 0CD23 0D252
SUB_0CF2A:
        GOVLNG  Day>Date                         * 0CF2A
        NIBHEX  D4F4E445555475544445845564259435 * 0CF31  MONTUEWEDTHUFRIS
        NIBHEX  14453555E4                       * 0CF51  ATSUN

* hxs -> $weekday
* refs (1): 0D2FA
Ticks>wd$:
        CON(5)  (*)+5                            * 0CF5B  primitive code object
        GOSUB   SUB_0CF15                        * 0CF60
        C=0     A                                * 0CF64
        LC(1)   #3                               * 0CF66
        GOSUB   SUB_0CF1C                        * 0CF69
        GOSUB   SUB_0CF0E                        * 0CF6D
        A=DAT1  A                                * 0CF71
        D=D+1   A                                * 0CF74
        D1=D1+  5                                * 0CF76
        GOSUB   SUB_0CF15                        * 0CF79
        AD1EX                                    * 0CF7D
        D1=D1+  10                               * 0CF80
        C=0     W                                * 0CF83
        C=DAT1  13                               * 0CF86
        GOSBVL  dowutil                          * 0CF8A
        SETHEX                                   * 0CF91
        P=      0                                * 0CF93
        A=A+A   A                                * 0CF95
        C=A     A                                * 0CF97
        A=A+A   A                                * 0CF99
        A=A+C   A                                * 0CF9B
        D1=(5)  SUB_0CF2A+1                      * 0CF9D  table indexed by 3*A
        CD1EX                                    * 0CFA4
        C=C+A   A                                * 0CFA7
        D1=C                                     * 0CFA9
        A=R0                                     * 0CFAC
        D0=A                                     * 0CFAF
        D0=D0+  10                               * 0CFB2
        C=DAT1  6                                * 0CFB5
        DAT0=C  6                                * 0CFB9
L_0CFBD:
        GOSUB   SUB_0CF0E                        * 0CFBD
        D1=D1-  5                                * 0CFC1
        D=D-1   A                                * 0CFC4
        AR0EX                                    * 0CFC6
        DAT1=A  A                                * 0CFC9
        AR0EX                                    * 0CFCC
        A=DAT0  A                                * 0CFCF
        D0=D0+  5                                * 0CFD2
        PC=(A)                                   * 0CFD5

* %date -> $
* refs (2): 0D329 39A8D
Date>d$:
        CON(5)  (*)+5                            * 0CFD9  primitive code object
        GOSBVL  POPDATE%                         * 0CFDE
        R1=C                                     * 0CFE5
        C=0     A                                * 0CFE8
        LC(1)   #8                               * 0CFEA
        GOSUB   SUB_0CF1C                        * 0CFED
        C=R1                                     * 0CFF1
        GOSUB   SUB_0CFFC                        * 0CFF4
        GOTO    L_0CFBD                          * 0CFF8

* refs (2): 0CFF4 0D263
SUB_0CFFC:
        ?ST=1   1                                * 0CFFC
        GOYES   L_0D019                          * 0CFFF
        P=C     3                                * 0D001
        CPEX    1                                * 0D005
        C=P     3                                * 0D009
        P=C     2                                * 0D00D
        CPEX    0                                * 0D011
        C=P     2                                * 0D015
L_0D019:
        B=C     W                                * 0D019
        GOSUB   SUB_0D02C                        * 0D01C
        GOSUB   SUB_0D055                        * 0D020
        GOSUB   SUB_0D02C                        * 0D024
        GOSUB   SUB_0D055                        * 0D028

* refs (2): 0D01C 0D024
SUB_0D02C:
        C=B     A                                * 0D02C
        P=C     0                                * 0D02E
        CPEX    1                                * 0D032
        C=P     0                                * 0D036
        B=C     B                                * 0D03A
        P=      0                                * 0D03D
        GOSUB   SUB_0D043                        * 0D03F

* refs (7): 0D03F 0D0F0 0D0F4 0D102 0D106 0D114 ...
SUB_0D043:
        LC(2)   #30                              * 0D043
        C=B     P                                * 0D047
        BSR     W                                * 0D04A
        DAT0=C  B                                * 0D04D
        D0=D0+  2                                * 0D050
        RTN                                      * 0D053

* refs (2): 0D020 0D028
SUB_0D055:
        LC(2)   #2F                              * 0D055
        ?ST=0   1                                * 0D059
        GOYES   L_0D062                          * 0D05C
        LC(2)   #2E                              * 0D05E
L_0D062:
        DAT0=C  B                                * 0D062
        D0=D0+  2                                * 0D065
        RTN                                      * 0D068

* %time -> $
* refs (2): 0D309 39AB0
TOD>t$:
        CON(5)  (*)+5                            * 0D06A  primitive code object
        GOSBVL  mpop1%                           * 0D06F
        GOSBVL  CKTIME                           * 0D076
        GONC    L_0D084                          * 0D07D
        GOTO    L_0D28D                          * 0D080
L_0D084:
        GOSUB   SUB_0D0A8                        * 0D084
        GONC    L_0D08F                          * 0D088
        GOTO    L_0D28D                          * 0D08B
L_0D08F:
        R1=C                                     * 0D08F
        P=      0                                * 0D092
        C=0     A                                * 0D094
        LC(1)   #9                               * 0D096
        GOSUB   SUB_0CF1C                        * 0D099
        C=R1                                     * 0D09D
        GOSUB   SUB_0D0D9                        * 0D0A0
        GOTO    L_0CFBD                          * 0D0A4

* refs (2): 0D084 0D286
SUB_0D0A8:
        P=      0                                * 0D0A8
        LC(2)   #23                              * 0D0AA
        ?C<A    B                                * 0D0AE
        RTNYES                                   * 0D0B1
        ?ST=1   2                                * 0D0B3
        GOYES   L_0D0D2                          * 0D0B6
        LC(2)   #12                              * 0D0B8
        ST=0    9                                * 0D0BC
        ?C>A    B                                * 0D0BF
        GOYES   L_0D0CA                          * 0D0C2
        ST=1    9                                * 0D0C4
        A=A-C   B                                * 0D0C7
L_0D0CA:
        ?A#0    B                                * 0D0CA
        GOYES   L_0D0D2                          * 0D0CD
        A=C     B                                * 0D0CF
L_0D0D2:
        GOVLNG  L_0D46B                          * 0D0D2

* refs (2): 0D0A0 0D294
SUB_0D0D9:
        P=      5                                * 0D0D9
        GOSUB   SUB_0D133                        * 0D0DB
        P=      0                                * 0D0DF
        LC(2)   #20                              * 0D0E1
        ?ST=0   2                                * 0D0E5
        GOYES   L_0D0F0                          * 0D0E8
        DAT0=C  B                                * 0D0EA
        D0=D0+  2                                * 0D0ED
L_0D0F0:
        GOSUB   SUB_0D043                        * 0D0F0
        GOSUB   SUB_0D043                        * 0D0F4
        LC(2)   #3A                              * 0D0F8
        DAT0=C  B                                * 0D0FC
        D0=D0+  2                                * 0D0FF
        GOSUB   SUB_0D043                        * 0D102
        GOSUB   SUB_0D043                        * 0D106
        LC(2)   #3A                              * 0D10A
        DAT0=C  B                                * 0D10E
        D0=D0+  2                                * 0D111
        GOSUB   SUB_0D043                        * 0D114
        GOSUB   SUB_0D043                        * 0D118
        ?ST=1   2                                * 0D11C
        RTNYES                                   * 0D11F
        LC(2)   #41                              * 0D121
        ?ST=0   9                                * 0D125
        GOYES   L_0D12E                          * 0D128
        LC(2)   #50                              * 0D12A
L_0D12E:
        DAT0=C  B                                * 0D12E
        RTN                                      * 0D131

* refs (2): 0D0DB 0D13E
SUB_0D133:
        CSRC                                     * 0D133
        B=C     S                                * 0D136
        BSLC                                     * 0D139
        P=P-1                                    * 0D13C
        GONC    SUB_0D133                        * 0D13E
        RTN                                      * 0D141

* hxs -> %time
* refs (3): 0D35D 0E1F1 B7BB4
Ticks>TOD:
        CON(5)  (*)+5                            * 0D143  primitive code object
        GOSBVL  SUB_0D90A                        * 0D148
        C=R0                                     * 0D14F
        GOTO    L_0CC03                          * 0D152

* hxs -> %date
* refs (3): 0D353 0E1E7 B7BD3
Ticks>Date:
        CON(5)  (*)+5                            * 0D156  primitive code object
        GOSBVL  SUB_0D90A                        * 0D15B
        C=R0                                     * 0D162
        GOTO    L_0CC17                          * 0D165

* hxs -> %rpt
* refs (2): 0E1FB B7BF7
Ticks>Rpt:
        CON(5)  (*)+5                            * 0D169  primitive code object
        GOSBVL  Ticks>Rpt~1                      * 0D16E
        A=R0                                     * 0D175
        GOSBVL  HXDCW                            * 0D178
        GOSBVL  FLOAT                            * 0D17F
        GOTO    L_0CC32                          * 0D186

* #n -> $
* refs (4): 0D2AD 0D2B7 0D2C1 0D2CB
WSLOGN:
        CON(5)  (*)+5                            * 0D18A  primitive code object
        GOSBVL  POP#                             * 0D18F
        A=A-1   A                                * 0D196
        R4=A                                     * 0D198
        GOSUB   SUB_0CF15                        * 0D19B
        C=0     A                                * 0D19F
        LC(2)   #14                              * 0D1A1
        GOSUB   SUB_0CF1C                        * 0D1A5
        C=R0                                     * 0D1A9
        RSTK=C                                   * 0D1AC
        A=R4                                     * 0D1AE
        C=A     A                                * 0D1B1
        ASL     A                                * 0D1B3
        A=A+C   A                                * 0D1B5
        A=A+C   A                                * 0D1B7
        LC(5)   FAILSTK1                         * 0D1B9
        A=A+C   A                                * 0D1C0
        D1=A                                     * 0D1C2
        A=DAT1  1                                * 0D1C5
        LC(2)   #39                              * 0D1C9
        CAEX    P                                * 0D1CD
        ?C<=A   P                                * 0D1D0
        GOYES   L_0D1DC                          * 0D1D3
        P=      6                                * 0D1D5
        C+P+1                                    * 0D1D7
        P=      0                                * 0D1DA
L_0D1DC:
        DAT0=C  B                                * 0D1DC
        D0=D0+  2                                * 0D1DF
        LC(2)   #2D                              * 0D1E2
        DAT0=C  B                                * 0D1E6
        D0=D0+  2                                * 0D1E9
        CD0EX                                    * 0D1EC
        P=      13                               * 0D1EF
        ST=0    15                               * 0D1F1
        GOSBVL  SUB_0DBBC                        * 0D1F4
        GOSBVL  AllowIntr                        * 0D1FB
        D0=C                                     * 0D202
        P=      0                                * 0D205
        ASR     W                                * 0D207
        C=A     W                                * 0D20A
        GOC     L_0D215                          * 0D20D
        ?C#0    W                                * 0D210
        GOYES   L_0D231                          * 0D213
L_0D215:
        C=0     W                                * 0D215
        LC(2)   #11                              * 0D218
        A=C     A                                * 0D21C
        LC(2)   #30                              * 0D21E
L_0D222:
        DAT0=C  B                                * 0D222
        D0=D0+  2                                * 0D225
        A=A-1   A                                * 0D228
        GONC    L_0D222                          * 0D22A
        GOTO    L_0D298                          * 0D22D
L_0D231:
        AD0EX                                    * 0D231
        R2=A                                     * 0D234
        GOSBVL  SUB_0DB6C                        * 0D237
        A=B     W                                * 0D23E
        R1=A                                     * 0D241
        A=C     W                                * 0D244
        GOSUB   SUB_0CF23                        * 0D247
        GOSBVL  HXDCW                            * 0D24B
        GOSUB   SUB_0CF2A                        * 0D252
        GOSBVL  SUB_0D36C                        * 0D256
        A=R2                                     * 0D25D
        D0=A                                     * 0D260
        GOSUB   SUB_0CFFC                        * 0D263
        LC(2)   #20                              * 0D267
        DAT0=C  B                                * 0D26B
        D0=D0+  2                                * 0D26E
        A=R1                                     * 0D271
        P=      0                                * 0D274
        SETHEX                                   * 0D276
        GOSBVL  SUB_0DA8E                        * 0D278
        GOSBVL  CKTIME                           * 0D27F
        GOSUB   SUB_0D0A8                        * 0D286
        GONC    L_0D294                          * 0D28A
L_0D28D:
        GOVLNG  ErrTime                          * 0D28D
L_0D294:
        GOSUB   SUB_0D0D9                        * 0D294
L_0D298:
        SETHEX                                   * 0D298
        C=RSTK                                   * 0D29A
        R0=C                                     * 0D29C
        GOTO    L_0CFBD                          * 0D29F
        RPL

* -> $4 $3 $2 $1
* refs (1): 19852
WSLOG:
        :: BINT4 WSLOGN BINT3 WSLOGN BINT2 WSLOGN BINT1 WSLOGN ; * 0D2A3

* refs (1): 39AFB
clock?:
        :: BINT40 TestSysFlag ;                  * 0D2D5
        ASSEMBLE

* refs (2): 0CBFF 0CC13
SUB_0D2E9:
        GOVLNG  SavPtrTime*                      * 0D2E9
        RPL

* %date -> $weekday
* refs (1): 0D313
Date>wd$:
        :: Date>hxs13 Ticks>wd$ ;                * 0D2F0

* %dt %tm -> "dy dt tm"
* refs (3): 0D362 199A1 B7AFD
TIMESTR:
        :: TOD>t$ SWAPDUP Date>wd$               * 0D304

K_space:
          CHR " " >T$ SWAP Date>d$ &$            * 0D318

K_space_0D333:
          CHR " " >T$ SWAP&$ ;                   * 0D333

* refs (1): 0E00B
tstr(b):
        :: DUP Ticks>Date SWAP Ticks>TOD TIMESTR ; * 0D349
        ASSEMBLE

* refs (7): 0CCD8 0D256 0D700 0D711 0D937 0E64F ...
SUB_0D36C:
        ST=0    6                                * 0D36C
        P=      14                               * 0D36F
        ?A=0    P                                * 0D371
        RTNYES                                   * 0D374
        ?A#0    S                                * 0D376
        RTNYES                                   * 0D379
        ?A=0    X                                * 0D37B
        GOYES   L_0D38B                          * 0D37E
        A=A-1   X                                * 0D380
        ?A#0    X                                * 0D383
        RTNYES                                   * 0D386
        ASL     W                                * 0D388
L_0D38B:
        P=      7                                * 0D38B
        ?A#0    WP                               * 0D38D
        RTNYES                                   * 0D390
        P=      11                               * 0D392
        ?A#0    WP                               * 0D394
        GOYES   L_0D3D1                          * 0D397
        R4=A                                     * 0D399
        SETHEX                                   * 0D39C
        GOSBVL  SUB_012F9                        * 0D39E
        GOSBVL  SUB_0DB7B                        * 0D3A5
        GOSBVL  HXDCW                            * 0D3AC
        GOSUB   SUB_0D665                        * 0D3B3
        GOSUB   L_0D46B                          * 0D3B7
        CR4EX                                    * 0D3BB
        GOSUB   AslW4                            * 0D3BE
        GOSUB   AslW4                            * 0D3C2
        P=      11                               * 0D3C6
        C=A     WP                               * 0D3C8
        A=C     W                                * 0D3CB
        ST=1    6                                * 0D3CE
L_0D3D1:
        ASLC                                     * 0D3D1
        ASLC                                     * 0D3D4
        B=0     W                                * 0D3D7
        ABEX    A                                * 0D3DA
        ASLC                                     * 0D3DC
        ASLC                                     * 0D3DF
        C=0     W                                * 0D3E2
        CAEX    A                                * 0D3E5
        D=C     W                                * 0D3E7
        ASLC                                     * 0D3EA
        ASLC                                     * 0D3ED
        ASLC                                     * 0D3F0
        ASLC                                     * 0D3F3
        ?ST=0   1                                * 0D3F6
        GOYES   L_0D401                          * 0D3F9
        DCEX    A                                * 0D3FB
        BCEX    A                                * 0D3FD
        DCEX    A                                * 0D3FF
L_0D401:
        ?B=0    A                                * 0D401
        RTNYES                                   * 0D404
        P=      0                                * 0D406
        C=0     A                                * 0D408
        LC(2)   #12                              * 0D40A
        ?B>C    A                                * 0D40E
        RTNYES                                   * 0D411
        ?D=0    A                                * 0D413
        RTNYES                                   * 0D416
        GOSUB   SUB_0D4DA                        * 0D418
        C=0     A                                * 0D41C
        C=DAT0  B                                * 0D41E
        ?D<=C   A                                * 0D421
        GOYES   L_0D444                          * 0D424
        C=0     A                                * 0D426
        C=C+1   A                                * 0D428
        C=C+1   A                                * 0D42A
        ?B#C    A                                * 0D42C
        RTNYES                                   * 0D42F
        CSL     A                                * 0D431
        C=C-1   P                                * 0D433
        ?D#C    A                                * 0D436
        RTNYES                                   * 0D439
        GOSUB   SUB_0D485                        * 0D43B
        GOC     L_0D444                          * 0D43F
        RTNSC                                    * 0D442
L_0D444:
        GOSUB   L_0D46B                          * 0D444
        CAEX    W                                * 0D448
        RSTK=C                                   * 0D44B
        P=      0                                * 0D44D
        LC(8)   #15821015                        * 0D44F
        ?C>A    W                                * 0D459
        GOYES   L_0D45E                          * 0D45C
L_0D45E:
        C=0     W                                * 0D45E
        C=RSTK                                   * 0D461
        CAEX    W                                * 0D463
        RTNC                                     * 0D466  never taken
        RTNCC                                    * 0D469
L_0D46B:
        C=0     W                                * 0D46B
        C=A     A                                * 0D46E
        CSL     A                                * 0D470
        P=      7                                * 0D472
        CSL     WP                               * 0D474
        C=B     B                                * 0D477
        CSL     WP                               * 0D47A
        CSL     WP                               * 0D47D
        C=D     B                                * 0D480
        RTNCC                                    * 0D483

* refs (1): 0D43B
SUB_0D485:
        C=A     A                                * 0D485
        RSTK=C                                   * 0D487
        ?A#0    B                                * 0D489
        GOYES   L_0D494                          * 0D48C
        ASR     A                                * 0D48E
        ASR     A                                * 0D490
        C=A     A                                * 0D492
L_0D494:
        SB=0                                     * 0D494
        C=C+C   A                                * 0D497
        C=C+C   A                                * 0D499
        C=C+A   A                                * 0D49B
        CSR     A                                * 0D49D
        CSRB                                     * 0D49F
        C=RSTK                                   * 0D4A2
        A=C     A                                * 0D4A4
        ?SB=0                                    * 0D4A6
        RTNYES                                   * 0D4A9
        RTN                                      * 0D4AB

* refs (5): 0CCF0 0D62B 0D707 0D718 0D77E
DAY#:
        B=B+1   A                                * 0D4AD
        P=      0                                * 0D4AF
        C=0     A                                * 0D4B1
        LC(1)   #4                               * 0D4B3
        ?B>=C   B                                * 0D4B6
        GOYES   L_0D4C3                          * 0D4B9
        A=A-1   A                                * 0D4BB
        LC(2)   #12                              * 0D4BD
        B=B+C   A                                * 0D4C1
L_0D4C3:
        GOSUB   SUB_0D5D2                        * 0D4C3
        D=D+C   A                                * 0D4C7
        C=0     A                                * 0D4C9
        LC(2)   #63                              * 0D4CB
        D=D-C   A                                * 0D4CF
        GOSUB   SUB_0D562                        * 0D4D1
        C=C+D   W                                * 0D4D5
        RTNCC                                    * 0D4D8

* refs (1): 0D418
SUB_0D4DA:
        C=B     A                                * 0D4DA
        C=C-1   A                                * 0D4DC
        D0=(5)  L_0D4EA                          * 0D4DE
L_0D4E5:
        D0=D0+  5                                * 0D4E5
        C=C-1   A                                * 0D4E8
L_0D4EA:
        GONC    L_0D4E5                          * 0D4EA
        RTNCC                                    * 0D4ED
        NIBHEX  13000821301395003090130210315113 * 0D4EF  1.∡..1Y...1 ...1
        NIBHEX  1811321203342133720340313433     * 0D50F  ā.#!0C.3'0..C3

* refs (1): 0D665
SUB_0D52B:
        D=C     W                                * 0D52B
        A=C     W                                * 0D52E
        ASL     W                                * 0D531
        C=0     W                                * 0D534
        P=      0                                * 0D537
        LC(3)   #585                             * 0D539
        A=A-C   W                                * 0D53E
        GONC    L_0D549                          * 0D541
        A=0     W                                * 0D544
        RTN                                      * 0D547
L_0D549:
        ASL     W                                * 0D549
        ASL     W                                * 0D54C
        ASL     W                                * 0D54F
        LC(7)   #3652425                         * 0D552
        GOVLNG  SUB_65807                        * 0D55B

* refs (2): 0D4D1 0D669
SUB_0D562:
        C=0     W                                * 0D562
        P=      3                                * 0D565
        C=A     WP                               * 0D567
        P=      0                                * 0D56A
        ?C=A    W                                * 0D56C
        GOYES   L_0D57C                          * 0D56F
        LC(4)   #0366                            * 0D571
        C=-C    W                                * 0D577
        RTNCC                                    * 0D57A
L_0D57C:
        C=C+A   A                                * 0D57C
        C=C+A   A                                * 0D57E
        B=C     W                                * 0D580
        B=B+B   A                                * 0D583
        CSL     W                                * 0D585
        C=C+B   W                                * 0D588
        CSL     W                                * 0D58B
        C=C+B   W                                * 0D58E
        C=C-A   W                                * 0D591
        B=B+B   W                                * 0D594
        B=B+B   W                                * 0D597
        B=B+A   W                                * 0D59A
        BSR     W                                * 0D59D
        BSR     A                                * 0D5A0
        C=C+B   W                                * 0D5A2
        BSR     A                                * 0D5A5
        BSR     A                                * 0D5A7
        C=C+B   W                                * 0D5A9
        B=A     A                                * 0D5AC
        BSR     A                                * 0D5AE
        BSR     A                                * 0D5B0
        C=C-B   W                                * 0D5B2
        RTNCC                                    * 0D5B5

* refs (1): 0D66D
SUB_0D5B7:
        C=-C    W                                * 0D5B7
        C=C+D   W                                * 0D5BA
        B=C     W                                * 0D5BD
        C=0     W                                * 0D5C0
        P=      0                                * 0D5C3
        LC(2)   #59                              * 0D5C5
        ?B>C    W                                * 0D5C9
        RTNYES                                   * 0D5CC
        A=A-1   A                                * 0D5CE
        RTNCC                                    * 0D5D0

* refs (2): 0D4C3 0D6A6
SUB_0D5D2:
        C=B     W                                * 0D5D2
        C=C+C   A                                * 0D5D5
        C=C+B   A                                * 0D5D7
        B=C     A                                * 0D5D9
        B=B+B   A                                * 0D5DB
        BSR     A                                * 0D5DD
        CSL     A                                * 0D5DF
        C=C+B   A                                * 0D5E1
        RTN                                      * 0D5E3

* ASR.W 5 times
* refs (1): 80C42
ASRW5:
        ASR     W                                * 0D5E5

* refs (1): 80C49
AsrW4:
        ASR     W                                * 0D5E8

AsrW3:
        ASR     W                                * 0D5EB
        ASR     W                                * 0D5EE
        ASR     W                                * 0D5F1
        RTN                                      * 0D5F4

* ASL.W 5 times
* refs (4): 0DAA0 0DAA7 2CE93 2CE9E
ASLW5:
        ASL     W                                * 0D5F6

* refs (3): 0D3BE 0D3C2 0D698
AslW4:
        ASL     W                                * 0D5F9

AslW3:
        ASL     W                                * 0D5FC
        ASL     W                                * 0D5FF
        ASL     W                                * 0D602
        RTN                                      * 0D605

* CSR.W 5 times
* refs (13): 0105C 0144A 015FE 044C9 0923E 0D995 ...
CSRW5:
        CSR     W                                * 0D607

* refs (1): 0DA47
CsrW4:
        CSR     W                                * 0D60A

CsrW3:
        CSR     W                                * 0D60D
        CSR     W                                * 0D610
        CSR     W                                * 0D613
        RTN                                      * 0D616

* CSL.W 5 times
* refs (10): 01030 01388 01554 04480 09119 71215 ...
CSLW5:
        CSL     W                                * 0D618

* refs (3): 0D761 0D767 0D76B
CslW4:
        CSL     W                                * 0D61B

CslW3:
        CSL     W                                * 0D61E
        CSL     W                                * 0D621
        CSL     W                                * 0D624
        RTN                                      * 0D627

* refs (1): 0DB3A
YMD>Ticks~1:
        SETDEC                                   * 0D629
        GOSUB   DAY#                             * 0D62B

* Converts BCD in C.W to hex in A.W B.W C.W. See <REF>HXDCW Uses P CRY
* refs (3): 0CE5B 0D9BF 0EF17
DCHXW:
        SETHEX                                   * 0D62F
        P=      0                                * 0D631
        B=0     W                                * 0D633
L_0D636:
        A=0     W                                * 0D636
        A=C     S                                * 0D639
        ASLC                                     * 0D63C
        CSL     W                                * 0D63F
        B=B+A   W                                * 0D642
        P=P+1                                    * 0D645
        GONC    L_0D652                          * 0D647
        A=B     W                                * 0D64A
        C=B     W                                * 0D64D
        RTNCC                                    * 0D650
L_0D652:
        B=B+B   W                                * 0D652
        A=B     W                                * 0D655
        B=B+B   W                                * 0D658
        B=B+B   W                                * 0D65B
        B=B+A   W                                * 0D65E
        GOTO    L_0D636                          * 0D661

* refs (3): 0D3B3 0D747 0DB5E
SUB_0D665:
        GOSUB   SUB_0D52B                        * 0D665
L_0D669:
        GOSUB   SUB_0D562                        * 0D669
        GOSUB   SUB_0D5B7                        * 0D66D
        GONC    L_0D669                          * 0D671
        LC(2)   #63                              * 0D674
        C=C+B   W                                * 0D678
        D=C     W                                * 0D67B
        CAEX    W                                * 0D67E
        P=      11                               * 0D681
L_0D683:
        DSL     W                                * 0D683
        P=P+1                                    * 0D686
        GONC    L_0D683                          * 0D688
        D=C     A                                * 0D68B
        C=0     W                                * 0D68D
        LC(6)   #306001                          * 0D690
        GOSUB   AslW4                            * 0D698
        GOSBVL  SUB_65807                        * 0D69C
        B=A     W                                * 0D6A3
        GOSUB   SUB_0D5D2                        * 0D6A6
        B=A     W                                * 0D6AA
        A=C     W                                * 0D6AD
        C=0     W                                * 0D6B0
        C=D     A                                * 0D6B3
        CAEX    W                                * 0D6B5
        P=      11                               * 0D6B8
L_0D6BA:
        DSR     W                                * 0D6BA
        P=P+1                                    * 0D6BD
        GONC    L_0D6BA                          * 0D6BF
        D=D-C   W                                * 0D6C2
        B=B-1   B                                * 0D6C5
        LC(2)   #12                              * 0D6C8
        ?B<=C   B                                * 0D6CC
        RTNYES                                   * 0D6CF
        A=A+1   A                                * 0D6D1
        B=B-C   B                                * 0D6D3
        RTN                                      * 0D6D6

* refs (2): 0D17F 0D731
FLOAT:
        ?A#0    W                                * 0D6D8
        GOYES   FLOAT~1                          * 0D6DB
        RTN                                      * 0D6DD
FLOAT~1:
        ASL     W                                * 0D6DF
        ASL     W                                * 0D6E2
        A=A+1   A                                * 0D6E5
        ASL     W                                * 0D6E7
        A=A+1   A                                * 0D6EA
        P=      14                               * 0D6EC
        GONC    L_0D6F6                          * 0D6EE
L_0D6F1:
        ASL     M                                * 0D6F1
        A=A-1   A                                * 0D6F4
L_0D6F6:
        ?A=0    P                                * 0D6F6
        GOYES   L_0D6F1                          * 0D6F9
        RTNCC                                    * 0D6FB

* refs (1): 0CC4D
SUB_0D6FD:
        R0=C                                     * 0D6FD
        GOSUB   SUB_0D36C                        * 0D700
        RTNC                                     * 0D704
        GOSUB   DAY#                             * 0D707
        CR0EX                                    * 0D70B
        A=C     W                                * 0D70E
        GOSUB   SUB_0D36C                        * 0D711
        RTNC                                     * 0D715
        GOSUB   DAY#                             * 0D718
        A=C     W                                * 0D71C
        C=R0                                     * 0D71F
        ST=0    4                                * 0D722
        A=A-C   W                                * 0D725
        GONC    L_0D731                          * 0D728
        ST=1    4                                * 0D72B
        A=-A    W                                * 0D72E
L_0D731:
        GOSUB   FLOAT                            * 0D731
        ?A=0    W                                * 0D735
        GOYES   L_0D742                          * 0D738
        ?ST=0   4                                * 0D73A
        GOYES   L_0D742                          * 0D73D
        A=-A-1  S                                * 0D73F
L_0D742:
        RTNCC                                    * 0D742

* refs (1): 0CF2A
Day>Date:
        C=A     W                                * 0D744
        GOSUB   SUB_0D665                        * 0D747
        ?ST=0   1                                * 0D74B
        GOYES   L_0D756                          * 0D74E
        BCEX    A                                * 0D750
        DCEX    A                                * 0D752
        BCEX    A                                * 0D754
L_0D756:
        C=0     W                                * 0D756
        C=B     A                                * 0D759
        CSL     A                                * 0D75B
        CSL     A                                * 0D75D
        C=C+D   A                                * 0D75F
        GOSUB   CslW4                            * 0D761
        C=C+A   A                                * 0D765
        GOSUB   CslW4                            * 0D767
        GOSUB   CslW4                            * 0D76B
        A=C     W                                * 0D76F
        ?A=0    S                                * 0D772
        RTNYES                                   * 0D775
        ASR     W                                * 0D777
        A=A+1   A                                * 0D77A
        RTNCC                                    * 0D77C
L_0D77E:
        GOSUB   DAY#                             * 0D77E
        A=C     W                                * 0D782
        C=0     W                                * 0D785
        P=      0                                * 0D788
        LC(1)   #5                               * 0D78A
        A=A+C   W                                * 0D78D
        LC(1)   #7                               * 0D790
        GOSBVL  SUB_65807                        * 0D793
        A=B     W                                * 0D79A
        A=A+1   A                                * 0D79D
        RTNCC                                    * 0D79F

* refs (3): 0CF23 0D8B7 0E646
CLKUTL1:
        D1=(5)  #8084D                           * 0D7A1
        C=DAT1  1                                * 0D7A8
        ST=1    1                                * 0D7AC
        ?CBIT=1 1                                * 0D7AF
        RTNYES                                   * 0D7B4
        ST=0    1                                * 0D7B6
        RTN                                      * 0D7B9

* refs (1): 0D8BB
SUB_0D7BB:
        D1=(5)  #8084D                           * 0D7BB
        C=DAT1  1                                * 0D7C2
        ST=1    2                                * 0D7C6
        ?CBIT=1 0                                * 0D7C9
        RTNYES                                   * 0D7CE
        ST=0    2                                * 0D7D0
        RTN                                      * 0D7D3

* refs (2): 0D8C3 0E2C1
SUB_0D7D5:
        D1=(5)  #8084D                           * 0D7D5
        C=DAT1  1                                * 0D7DC
        ST=1    3                                * 0D7E0
        ?CBIT=1 2                                * 0D7E3
        RTNYES                                   * 0D7E8
        ST=0    3                                * 0D7EA
        RTN                                      * 0D7ED
L_0D7EF:
        D1=(5)  #8084D                           * 0D7EF
        C=DAT1  1                                * 0D7F6
        ST=1    4                                * 0D7FA
        ?CBIT=1 3                                * 0D7FD
        RTNYES                                   * 0D802
        ST=0    4                                * 0D804
        RTN                                      * 0D807

* refs (1): 008A9
getBPOFF:
        D1=(5)  IRAM@                            * 0D809
        C=DAT1  1                                * 0D810
        CPEX    0                                * 0D814
        CPEX    4                                * 0D818
        D1=C                                     * 0D81C
        CPEX    4                                * 0D81F
        CPEX    0                                * 0D823
        D1=(4)  #0850                            * 0D827
        C=DAT1  1                                * 0D82D
        ST=1    4                                * 0D831
        ?CBIT=1 3                                * 0D834
        RTNYES                                   * 0D839
        ST=0    4                                * 0D83B
        RTN                                      * 0D83E

* refs (2): 0D8C7 0ECA9
SUB_0D840:
        D1=(5)  IRAM@                            * 0D840
        C=DAT1  1                                * 0D847
        CPEX    0                                * 0D84B
        CPEX    4                                * 0D84F
        D1=C                                     * 0D853
        CPEX    4                                * 0D856
        CPEX    0                                * 0D85A
        D1=(4)  #0851                            * 0D85E
        C=DAT1  1                                * 0D864
        ST=1    5                                * 0D868
        ?CBIT=1 0                                * 0D86B
        RTNYES                                   * 0D870
        ST=0    5                                * 0D872
        RTN                                      * 0D875

* refs (5): 01485 0CE90 0D8BF 0E423 0E44F
SUB_0D877:
        D1=(5)  IRAM@                            * 0D877
        C=DAT1  1                                * 0D87E
        CPEX    0                                * 0D882
        CPEX    4                                * 0D886
        D1=C                                     * 0D88A
        CPEX    4                                * 0D88D
        CPEX    0                                * 0D891
        D1=(4)  #091B                            * 0D895
        C=DAT1  1                                * 0D89B
        ST=1    0                                * 0D89F
        P=      0                                * 0D8A2
        ?C#0    P                                * 0D8A4
        RTNYES                                   * 0D8A7
        ST=0    0                                * 0D8A9
        RTN                                      * 0D8AC

* refs (2): 0D06F 0D948
mpop1%:
        SETHEX                                   * 0D8AE
        GOSBVL  POP1%                            * 0D8B0

* refs (2): 0D933 B70FE
SUB_0D8B7:
        GOSUB   CLKUTL1                          * 0D8B7
        GOSUB   SUB_0D7BB                        * 0D8BB
        GOSUB   SUB_0D877                        * 0D8BF
        GOSUB   SUB_0D7D5                        * 0D8C3
        GOSUB   SUB_0D840                        * 0D8C7
        GOTO    L_0D7EF                          * 0D8CB

* refs (1): 0EF87
>ALRMLS~1:
        A=DAT1  A                                * 0D8CF
        D1=D1+  5                                * 0D8D2
        D=D+1   A                                * 0D8D5
        AD1EX                                    * 0D8D7
        D1=D1+  10                               * 0D8DA
        C=0     W                                * 0D8DD
        C=DAT1  10                               * 0D8E0
        R1=C                                     * 0D8E4
        GOTO    L_0D922                          * 0D8E7

* refs (1): 0D16E
Ticks>Rpt~1:
        A=DAT1  A                                * 0D8EB
        D1=D1+  5                                * 0D8EE
        D=D+1   A                                * 0D8F1
        AD1EX                                    * 0D8F3
        D1=D1+  10                               * 0D8F6
        D1=D1+  13                               * 0D8F9
        C=0     W                                * 0D8FC
        C=DAT1  10                               * 0D8FF
        R0=C                                     * 0D903
        GOTO    L_0D922                          * 0D906

* refs (5): 0D148 0D15B 0EC0C 0EE2B 0EF7C
SUB_0D90A:
        A=DAT1  A                                * 0D90A
        D1=D1+  5                                * 0D90D
        D=D+1   A                                * 0D910
        AD1EX                                    * 0D912
        D1=D1+  10                               * 0D915
        C=0     W                                * 0D918
        C=DAT1  13                               * 0D91B
        R0=C                                     * 0D91F
L_0D922:
        D1=A                                     * 0D922
        GOVLNG  SAVPTR                           * 0D925

* refs (3): 0CD6C 0CFDE 0EE69
POPDATE%:
        GOSBVL  POP1%                            * 0D92C
        GOSUB   SUB_0D8B7                        * 0D933
        GOSBVL  SUB_0D36C                        * 0D937
        RTNNC                                    * 0D93E
        GOVLNG  L_0CBB7                          * 0D941

* refs (1): 0CDAE
POPTIME%:
        GOSUB   mpop1%                           * 0D948
        GOSUB   CKTIME                           * 0D94C
        GONC    L_0D95A                          * 0D950
        GOVLNG  ErrTime                          * 0D953
L_0D95A:
        R0=C                                     * 0D95A
        GOSUB   SUB_0DA4E                        * 0D95D
        A=A+B   W                                * 0D961
        GOSUB   SUB_0DA4E                        * 0D964
        C=D     W                                * 0D968
        C=C+A   W                                * 0D96B
        GOSUB   SUB_0D9BF                        * 0D96E
        GOSUB   SUB_0D9B4                        * 0D972
        GOSUB   SUB_0DB9B                        * 0D976
        AR0EX                                    * 0D97A
        ?A=0    W                                * 0D97D
        GOYES   L_0D9A6                          * 0D980
        C=A     W                                * 0D982
        GOSUB   SUB_0D9BF                        * 0D985
        GOSUB   SUB_0D9B4                        * 0D989
        GOSUB   SUB_0DB9B                        * 0D98D
        GOSUB   HXDCW                            * 0D991
        GOSBVL  CSRW5                            * 0D995
        CSR     W                                * 0D99C
        CSR     W                                * 0D99F
        GOSUB   SUB_0D9BF                        * 0D9A2
L_0D9A6:
        C=R0                                     * 0D9A6
        A=A+C   W                                * 0D9A9
        C=A     W                                * 0D9AC
        B=A     W                                * 0D9AF
        RTN                                      * 0D9B2

* refs (3): 0D972 0D989 0DA8E
SUB_0D9B4:
        C=0     W                                * 0D9B4
        LC(4)   #2000                            * 0D9B7
        RTN                                      * 0D9BD

* refs (3): 0D96E 0D985 0D9A2
SUB_0D9BF:
        GOVLNG  DCHXW                            * 0D9BF
        NIBHEX  0                                * 0D9C6

* refs (4): 0D076 0D27F 0D94C 0E682
CKTIME:
        P=      0                                * 0D9C7
        ?A#0    S                                * 0D9C9
        RTNYES                                   * 0D9CC
        ?A=0    X                                * 0D9CE
        GOYES   L_0D9FD                          * 0D9D1
        C=A     X                                * 0D9D3
        A=A+A   X                                * 0D9D6
        A=0     X                                * 0D9D9
        GOC     L_0D9ED                          * 0D9DC
        ASL     W                                * 0D9DF
        C=C-1   X                                * 0D9E2
        ?C#0    X                                * 0D9E5
        RTNYES                                   * 0D9E8
        GONC    L_0D9FD                          * 0D9EA
L_0D9ED:
        ASR     M                                * 0D9ED
        C=C+1   X                                * 0D9F0
        ?C=0    X                                * 0D9F3
        GOYES   L_0D9FD                          * 0D9F6
        ?A#0    M                                * 0D9F8
        GOYES   L_0D9ED                          * 0D9FB
L_0D9FD:
        ASLC                                     * 0D9FD
        ASLC                                     * 0DA00
        B=0     W                                * 0DA03
        ABEX    A                                * 0DA06
        ASLC                                     * 0DA08
        ASLC                                     * 0DA0B
        C=0     W                                * 0DA0E
        CAEX    A                                * 0DA11
        D=C     W                                * 0DA13
        ASLC                                     * 0DA16
        ASLC                                     * 0DA19
        LC(2)   #59                              * 0DA1C
        ?C<A    B                                * 0DA20
        RTNYES                                   * 0DA23
        ?D>C    B                                * 0DA25
        RTNYES                                   * 0DA28
        LC(2)   #23                              * 0DA2A
        ?B>C    B                                * 0DA2E
        RTNYES                                   * 0DA31
        C=A     A                                * 0DA33
        A=0     A                                * 0DA35
        ABEX    W                                * 0DA37
        DCEX    W                                * 0DA3A
        BCEX    W                                * 0DA3D
        GOSBVL  CSRW5                            * 0DA40
        GOVLNG  CsrW4                            * 0DA47

* refs (2): 0D95D 0D964
SUB_0DA4E:
        A=A+A   W                                * 0DA4E
        C=A     W                                * 0DA51
        A=A+A   W                                * 0DA54
        A=A+C   W                                * 0DA57
        ASL     W                                * 0DA5A
        RTN                                      * 0DA5D

* refs (1): 0DABE
SUB_0DA5F:
        GOSUB   HXDCW                            * 0DA5F
        GOSUB   SUB_0DA77                        * 0DA63
        C=B     W                                * 0DA67
        D=C     W                                * 0DA6A
        GOSUB   SUB_0DA77                        * 0DA6D
        SETHEX                                   * 0DA71
        P=      0                                * 0DA73
        RTNCC                                    * 0DA75

* refs (2): 0DA63 0DA6D
SUB_0DA77:
        P=      0                                * 0DA77
        C=0     W                                * 0DA79
        LC(2)   #60                              * 0DA7C

* refs (2): 0DA92 0DAB7
SUB_0DA80:
        GOVLNG  SUB_65807                        * 0DA80

* refs (1): 0CC03
SUB_0DA87:
        GOSUB   SUB_0DB6C                        * 0DA87
        A=B     W                                * 0DA8B

* refs (1): 0D278
SUB_0DA8E:
        GOSUB   SUB_0D9B4                        * 0DA8E
        GOSUB   SUB_0DA80                        * 0DA92
        R0=A                                     * 0DA96
        A=B     W                                * 0DA99
        GOSUB   HXDCW                            * 0DA9C
        GOSBVL  ASLW5                            * 0DAA0
        GOSBVL  ASLW5                            * 0DAA7
        C=0     W                                * 0DAAE
        LC(4)   #8192                            * 0DAB1
        GOSUB   SUB_0DA80                        * 0DAB7
        AR0EX                                    * 0DABB
        GOSUB   SUB_0DA5F                        * 0DABE
        SETDEC                                   * 0DAC2
        C=D     W                                * 0DAC4
        CAEX    W                                * 0DAC7
        ASRC                                     * 0DACA
        ASRC                                     * 0DACD
        A=B     A                                * 0DAD0
        ASRC                                     * 0DAD2
        ASRC                                     * 0DAD5
        A=C     A                                * 0DAD8
        ASRC                                     * 0DADA
        ASRC                                     * 0DADD
        P=      9                                * 0DAE0
        A=0     WP                               * 0DAE2
        P=      0                                * 0DAE5
        C=R0                                     * 0DAE7
        A=A+C   W                                * 0DAEA
        A=0     X                                * 0DAED
        ?A=0    S                                * 0DAF0
        GOYES   L_0DAFE                          * 0DAF3
        ASR     W                                * 0DAF5
        A=0     X                                * 0DAF8
        A=A+1   X                                * 0DAFB
L_0DAFE:
        GOSBVL  SPLITA                           * 0DAFE
        A=B     M                                * 0DB05
        RTNCC                                    * 0DB08
        NIBHEX  0                                * 0DB0A

* refs (2): 0CD73 0E659
SUB_0DB0B:
        CAEX    W                                * 0DB0B
        RSTK=C                                   * 0DB0E
        P=      0                                * 0DB10
        LC(8)   #19910101                        * 0DB12
        ?C>A    W                                * 0DB1C
        GOYES   L_0DB30                          * 0DB1F
        LC(8)   #20901231                        * 0DB21
        ?C<A    W                                * 0DB2B
        GOYES   L_0DB30                          * 0DB2E
L_0DB30:
        C=0     W                                * 0DB30
        C=RSTK                                   * 0DB33
        CAEX    W                                * 0DB35
        RTN                                      * 0DB38

* refs (2): 0CD81 0EE70
YMD>Ticks:
        GOSBVL  YMD>Ticks~1                      * 0DB3A
        C=0     W                                * 0DB41
        P=      5                                * 0DB44
        LC(3)   #2A3                             * 0DB46
        P=      0                                * 0DB4B
        GOTO    SUB_0DB9B                        * 0DB4D

* refs (2): 0CF8A B71B9
dowutil:
        GOSUB   SUB_0DB7B                        * 0DB51
        ?A=0    W                                * 0DB55
        RTNYES                                   * 0DB58
        GOSUB   HXDCW                            * 0DB5A
        GOSBVL  SUB_0D665                        * 0DB5E
        GOVLNG  L_0D77E                          * 0DB65

* refs (5): 0CD95 0CDBF 0CDE3 0D237 0DA87
SUB_0DB6C:
        R1=C                                     * 0DB6C
        GOSUB   SUB_0DB7B                        * 0DB6F
        A=R1                                     * 0DB73
        A=A-B   W                                * 0DB76
        RTN                                      * 0DB79

* refs (4): 0CC17 0D3A5 0DB51 0DB6F
SUB_0DB7B:
        SETHEX                                   * 0DB7B
        A=C     W                                * 0DB7D
        C=0     W                                * 0DB80
        P=      5                                * 0DB83
        LC(3)   #2A3                             * 0DB85
        GOVLNG  SUB_65807                        * 0DB8A

* Converts hex in A.W to BCD in A.W B.W C.W. See <REF>DCHXW Uses P CRY
* refs (8): 0CC27 0D178 0D24B 0D3AC 0D991 0DA5F ...
HXDCW:
        C=A     W                                * 0DB91
        A=0     W                                * 0DB94
        A=A+1   A                                * 0DB97
        SETDEC                                   * 0DB99

* refs (5): 0D976 0D98D 0DB4D 12DCA 13430
SUB_0DB9B:
        B=0     W                                * 0DB9B
L_0DB9E:
        SB=0                                     * 0DB9E
        CSRB                                     * 0DBA1
        ?SB=0                                    * 0DBA4
        GOYES   L_0DBAC                          * 0DBA7
        B=B+A   W                                * 0DBA9
L_0DBAC:
        A=A+A   W                                * 0DBAC
        ?C#0    W                                * 0DBAF
        GOYES   L_0DB9E                          * 0DBB2
        A=B     W                                * 0DBB4
        C=A     W                                * 0DBB7
        RTNCC                                    * 0DBBA

* refs (1): 0D1F4
SUB_0DBBC:
        D0=(5)  #00104                           * 0DBBC
        A=0     A                                * 0DBC3
        DAT0=A  4                                * 0DBC5
        A=DAT1  WP                               * 0DBC9
        A=0     A                                * 0DBCD
        A=DAT0  4                                * 0DBCF
        D0=A                                     * 0DBD3
        CD1EX                                    * 0DBD6
        C+P+1                                    * 0DBD9
        CD1EX                                    * 0DBDC
        A=0     A                                * 0DBDF
        A=DAT1  4                                * 0DBE1
        CD0EX                                    * 0DBE5
        ?C=A    A                                * 0DBE8
        GOYES   L_0DBF3                          * 0DBEB
        GOSUB   L_0DBF3                          * 0DBED
        RTNSC                                    * 0DBF1
L_0DBF3:
        C=0     A                                * 0DBF3
        C=P     0                                * 0DBF5
        C=-C-1  A                                * 0DBF9
        AD1EX                                    * 0DBFB
        A=A+C   A                                * 0DBFE
        D1=A                                     * 0DC00
        A=0     W                                * 0DC03
        A=DAT1  WP                               * 0DC06
        CD0EX                                    * 0DC0A
        RTNCC                                    * 0DC0D

        CON(5)  (*)+5                            * 0DC0F  primitive code object
        BUSCB                                    * 0DC14
        GOTO    L_0DC31                          * 0DC18

        CON(5)  (*)+5                            * 0DC1C  primitive code object
        BUSCC                                    * 0DC21
        GOTO    L_0DC31                          * 0DC24

        CON(5)  (*)+5                            * 0DC28  primitive code object
        BUSCD                                    * 0DC2D
L_0DC31:
        A=DAT0  A                                * 0DC31
        D0=D0+  5                                * 0DC34
        PC=(A)                                   * 0DC37
        RPL

* refs (1): 42122
ALARMxcp~1:
        :: ALARMS@ TOTEMPOB DUP NextAlarm(li)? NOTcase DROPFALSE * 0DC3B
          DUP ALARMxcp~1~3 case                  * 0DC5E
          :: ALARMxcp~1~1 TRUE ;                 * 0DC6D
          ALARMxcp~1~2 FALSE ;                   * 0DC81

* refs (1): 0DC72
ALARMxcp~1~1:
        :: OBJ_0E802 OBJ_0E7F7 OBJ_0E820 OBJ_0DFD9 ITE OBJ_0DE61 DROP * 0DC90
          NewAlarm(li) OBJ_0E26D UNCOERCE OBJ_0172B OBJ_0E164 OBJ_47445 ; * 0DCB8

* refs (1): 0DC81
ALARMxcp~1~2:
        :: ALARMxcp~1~2~1 OBJ_0CEEA Save16 Clr16 SWAP DUP INCOMPDROP SWAP * 0DCDB
          DispTstr(b) DISPROW1*! OBJ_0E802 OBJ_0E820 ALARMxcp~1~2~3 IT * 0DD08
          :: OBJ_0E7F7 OBJ_0E836 ;               * 0DD26
          SWAP Restore16 OBJ_0DF84 ITE           * 0DD3A
          :: DROP OBJ_0E26D REMOVEN{} ;          * 0DD4E
          :: OBJ_0DFD9 ITE OBJ_0DE61 DROP        * 0DD67
          ;                                      * 0DD80
          NewAlarm(li) ALARMxcp~1~2~2 OBJ_0172B OBJ_0E164 OBJ_47445 * 0DD85
          FLUSHKEYS ;                            * 0DD9E

* ->
* refs (1): 1986D
ACKALLALMS:
        :: BEGIN ACKALM UNTIL ;                  * 0DDA8

* -> flag
* refs (2): 0DDB2 19888
ACKALM:
        :: ALARMS@ TOTEMPOB DUP OldestPastDue(li)? NOTcase DROPTRUE * 0DDC1
          IndexPastDue(li) OBJ_0E248 DROP OBJ_0E7F7 OBJ_0E836 OBJ_0E820 * 0DDE4
          OBJ_0DF84 ITE                          * 0DE02
          :: DROP OBJ_0E26D REMOVEN{} ;          * 0DE0C
          :: OBJ_0DFD9 ITE OBJ_0DE61 DROP        * 0DE25
          ;                                      * 0DE3E
          NewAlarm(li) OBJ_0172B OBJ_0E164 OBJ_47445 FALSE ; * 0DE43

* refs (3): 0DCAE 0DD76 0DE34
OBJ_0DE61:
        :: OBJ_0DFB1 TOTEMPSWAP OBJ_0E26D REMOVEN{} SWAP OBJ_0E836 OBJ_0E82B * 0DE61
          OBJ_0E820 OBJ_0E302 InsAlarm(2li) SWAP OBJ_0E248 DROP ; * 0DE89

* refs (2): 0DE93 0E70B
InsAlarm(2li):
        :: 2DUP InsAlarm(2li)~1 DUP 4UNROLL INSERTN{} ; * 0DEAC

* refs (7): 0CB2F 0DCB8 0DD85 0DE43 0E710 0E783 ...
NewAlarm(li):
        :: NewAlarm(li)~1 StoAlarms(_) RclAlarms? DROP OBJ_0E219 DROP ; * 0DECF

* refs (1): 0DED9
StoAlarms(_):
        :: '                                     * 0DEF7

Alarms:
          ID Alarms StoHiddenVar ;               * 0DF01

* refs (3): 0CB1B 0CB4D 0DEDE
RclAlarms?:
        :: '                                     * 0DF1E

Alarms_0DF28:
          ID Alarms RclHiddenVar ;               * 0DF28

* refs (1): 0DED4
NewAlarm(li)~1:
        CON(5)  (*)+5                            * 0DF45  primitive code object
        ASSEMBLE
        CD0EX                                    * 0DF4A
        D0=(5)  ALARMS                           * 0DF4D
        A=0     A                                * 0DF54
        DAT0=A  A                                * 0DF56
        CD0EX                                    * 0DF59
L_0DF5C:
        A=DAT0  A                                * 0DF5C
        D0=D0+  5                                * 0DF5F
        PC=(A)                                   * 0DF62
        RPL

* refs (1): 0DC63
ALARMxcp~1~3:
        :: BINT2 NTHCOMPDROP TYPECSTR? NOT ;     * 0DF66

* refs (2): 0DD44 0DE02
OBJ_0DF84:
        :: OBJ_0E7BB SWAP OBJ_0E2D1 NOT ROTAND OBJ_0E2A1 NOTAND ; * 0DF84

* refs (1): 0DE66
OBJ_0DFB1:
        :: OBJ_0ED95 IT                          * 0DFB1
          :: OBJ_0E80D ClrDouseAlm ;             * 0DFC0
        ;                                        * 0DFD4

* refs (3): 0DCA4 0DD6C 0DE2A
OBJ_0DFD9:
        :: OBJ_0E2D1 NOTcaseFALSE OBJ_0E7BB      * 0DFD9
          caseTRUE OBJ_0E2B9                     * 0DFED
          caseFALSE TRUE                         * 0DFF7
        ;                                        * 0E001
