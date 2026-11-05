* HP 48GX ROM revision R, #30000-#33011: Kermit: file translation, parameter negotiation, packet encoding. UART driver, printing (PR1, PRST, PRVAR, PRLCD, HP 82240 codes) and I/O error handling
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: SUB$1# PRINT UARTIntOn root AllowPrlcdCl PrintRC(st) GetChkPRTPAR CHOOSE_INIT docr UARTTxFull? PrtStatus@ PrintWire?
* Follows on from the previous file (at #30000 in the original ROM).
SUB_2FFD0.L2:
        ?ST=0   4                                * 30000
        GOYES   SUB_2FFD0.loop4                  * 30003
        LC(2)   #0D                              * 30005
        ?C#A    B                                * 30009
        GOYES   SUB_2FFD0.L3                     * 3000C
        ST=1    3                                * 3000E
        P=      1                                * 30011
        GOTO    SUB_2FFD0.L12                    * 30013
SUB_2FFD0.L3:
        LC(2)   #0A                              * 30017
        ?C#A    B                                * 3001B
        GOYES   SUB_2FFD0.loop4                  * 3001E
        ?ST=0   3                                * 30020
        GOYES   SUB_2FFD0.L5                     * 30023
SUB_2FFD0.loop4:
        P=      1                                * 30025
        GOTO    SUB_2FFD0.L11                    * 30027
SUB_2FFD0.L5:
        LC(4)   #0A0D                            * 3002B
        GOTO    SUB_2FFD0.loop1                  * 30031
SUB_2FFD0.L6:
        LC(2)   #A0                              * 30035
        ?C<=A   B                                * 30039
        GOYES   SUB_2FFD0.L7                     * 3003C
        A=A+A   B                                * 3003E
        A=A+A   A                                * 30041
        LC(5)   SUB_2FFD0.L14                    * 30043
        C=C+A   A                                * 3004A
        D1=C                                     * 3004C
        C=DAT1  4                                * 3004F
        CSL     A                                * 30053
        CSL     W                                * 30055
        GONC    SUB_2FFD0.L9                     * 30058
SUB_2FFD0.L7:
        ?ST=0   2                                * 3005B
        GOYES   SUB_2FFD0.loop4                  * 3005E
        D1=(5)  SUB_2FFD0.L15                    * 30060
SUB_2FFD0.loop8:
        C=DAT1  6                                * 30067
        D1=D1+  6                                * 3006B
        ?C=0    B                                * 3006E
        GOYES   SUB_2FFD0.L13                    * 30071
        ?C#A    B                                * 30073
        GOYES   SUB_2FFD0.loop8                  * 30076
SUB_2FFD0.L9:
        LC(2)   #5C                              * 30078
        P=      5                                * 3007C
SUB_2FFD0.loop10:
        A=C     WP                               * 3007E
SUB_2FFD0.L11:
        ST=0    3                                * 30081
SUB_2FFD0.L12:
        C=RSTK                                   * 30084
        D1=C                                     * 30086
        RTNCC                                    * 30089
SUB_2FFD0.L13:
        C=B     W                                * 3008B
        R3=C                                     * 3008E
        A=0     M                                * 30091
        GOSBVL  SUB_657B9                        * 30094
        GOSBVL  CSRW5                            * 3009B
        CSR     W                                * 300A2
        A=R3                                     * 300A5
        B=A     W                                * 300A8
        LC(2)   #5C                              * 300AB
        P=      7                                * 300AF
        GOTO    SUB_2FFD0.loop10                 * 300B1

* TRANSIO: the ASCII pair for each character 128-159 (read at #30043)
SUB_2FFD0.L14:
        NIBASC  "<)"                             * 300B5  entry 0
        NIBASC  "x-"                             * 300B9  entry 1
        NIBASC  ".V"                             * 300BD  entry 2
        NIBASC  "v/"                             * 300C1  entry 3
        NIBASC  ".S"                             * 300C5  entry 4
        NIBASC  "GS"                             * 300C9  entry 5
        NIBASC  "|>"                             * 300CD  entry 6
        NIBASC  "pi"                             * 300D1  entry 7
        NIBASC  ".d"                             * 300D5  entry 8
        NIBASC  "<="                             * 300D9  entry 9
        NIBASC  ">="                             * 300DD  entry 10
        NIBASC  "=/"                             * 300E1  entry 11
        NIBASC  "Ga"                             * 300E5  entry 12
        NIBASC  "->"                             * 300E9  entry 13
        NIBASC  "<-"                             * 300ED  entry 14
        NIBASC  "|v"                             * 300F1  entry 15
        NIBASC  "|^"                             * 300F5  entry 16
        NIBASC  "Gg"                             * 300F9  entry 17
        NIBASC  "Gd"                             * 300FD  entry 18
        NIBASC  "Ge"                             * 30101  entry 19
        NIBASC  "Gn"                             * 30105  entry 20
        NIBASC  "Gh"                             * 30109  entry 21
        NIBASC  "Gl"                             * 3010D  entry 22
        NIBASC  "Gr"                             * 30111  entry 23
        NIBASC  "Gs"                             * 30115  entry 24
        NIBASC  "Gt"                             * 30119  entry 25
        NIBASC  "Gw"                             * 3011D  entry 26
        NIBASC  "GD"                             * 30121  entry 27
        NIBASC  "PI"                             * 30125  entry 28
        NIBASC  "GW"                             * 30129  entry 29
        NIBASC  "[]"                             * 3012D  entry 30
        NIBASC  "oo"                             * 30131  entry 31

* TRANSIO: end of the pairs for 128-159
        CON(2)  #00                              * 30135  entry 0

* TRANSIO: character and ASCII pair for characters from 160 up (read at #30060)
SUB_2FFD0.L15:
        CON(2)  #AB                              * 30137  entry 0
SUB_2FFD0.L16:
        NIBASC  "<<"                             * 30139
        CON(2)  #B0                              * 3013D  entry 1
        NIBASC  "^o"                             * 3013F
        CON(2)  #B5                              * 30143  entry 2
        NIBASC  "Gm"                             * 30145
        CON(2)  #BB                              * 30149  entry 3
        NIBASC  ">>"                             * 3014B
        CON(2)  #D7                              * 3014F  entry 4
        NIBASC  ".x"                             * 30151
        CON(2)  #DF                              * 30155  entry 5
        NIBASC  "Gb"                             * 30157
        CON(2)  #F7                              * 3015B  entry 6
        NIBASC  ":-"                             * 3015D
        CON(2)  #D8                              * 30161  entry 7
        NIBASC  "O/"                             * 30163
        CON(2)  0                                * 30167  end of table
        BSS     2                                * 30169  zeros
        RPL

* $ -> $' $''
* refs (4): 2DD83 2F5AB 2F67D 2FBAA
KINVISLF:
        :: CKREF ChkTransio                      * 3016B
          CODE                                   * 3017A  487 nibbles
            C=0     A                            * 30184
            R3=C                                 * 30186
            GOSBVL  SAVPTR                       * 30189
            GOSBVL  POP#                         * 30190
            GOSUB   KVISMode                     * 30197
            GONC    KINVISLF.L2                  * 3019B
            R0=C                                 * 3019E
            D0=C                                 * 301A1
            D0=D0+  10                           * 301A4
            GOSUB   KVISStr                      * 301A7
            D=C     A                            * 301AB
KINVISLF.loop1:
            D=D-1   A                            * 301AD
            GONC    KINVISLF.L5                  * 301AF
            C=R3                                 * 301B2
            D=C     A                            * 301B5
            D=D+D   A                            * 301B7
            AD1EX                                * 301B9
            CD0EX                                * 301BC
            C=A-C   A                            * 301BF
            C=C+D   A                            * 301C1
            R2=C                                 * 301C3
            D1=A                                 * 301C6
            A=DAT1  A                            * 301C9
            A=A-C   A                            * 301CC
            DAT1=A  A                            * 301CE
            AD1EX                                * 301D1
            GOSBVL  MOVERSD                      * 301D4
            A=R0                                 * 301DB
            D1=A                                 * 301DE
            D1=D1+  5                            * 301E1
            A=DAT1  A                            * 301E4
            C=R2                                 * 301E7
            A=A-C   A                            * 301EA
            DAT1=A  A                            * 301EC
KINVISLF.L2:
            C=R3                                 * 301EF
            GOSBVL  MAKE$                        * 301F2
            C=R4                                 * 301F9
            A=R3                                 * 301FC
            GONC    KINVISLF.L4                  * 301FF
KINVISLF.loop3:
            DAT0=C  B                            * 30202
            D0=D0+  2                            * 30205
            CSR     W                            * 30208
            CSR     A                            * 3020B
KINVISLF.L4:
            A=A-1   A                            * 3020D
            GONC    KINVISLF.loop3               * 3020F
            GOVLNG  GPOverWrR0Lp                 * 30212
KINVISLF.L5:
            A=DAT1  8                            * 30219
            CD1EX                                * 3021D
            RSTK=C                               * 30220
            C=A     A                            * 30222
            ?ST=0   1                            * 30224
            GOYES   KINVISLF.L13                 * 30227
            LC(2)   #5C                          * 30229
            ?C#A    B                            * 3022D
            GOYES   KINVISLF.L13                 * 30230
            ASRC                                 * 30232
            ASRC                                 * 30235
            ?C#A    B                            * 30238
            GOYES   KINVISLF.L6                  * 3023B
            D=D-1   A                            * 3023D
            GOC     KINVISLF.L10                 * 3023F
            GONC    KINVISLF.L14                 * 30242
KINVISLF.L6:
            D1=(5)  SUB_2FFD0.L14                * 30245
            LC(2)   #7F                          * 3024C
            B=C     A                            * 30250
            D=D-CON A,2                          * 30252
            GOC     KINVISLF.L9                  * 30258
            C=A     A                            * 3025B
KINVISLF.loop7:
            C=DAT1  4                            * 3025D
            D1=D1+  4                            * 30261
            B=B+1   B                            * 30264
            ?C=0    B                            * 30267
            GOYES   KINVISLF.L15                 * 3026A
            ?C#A    A                            * 3026C
            GOYES   KINVISLF.loop7               * 3026F
            A=B     A                            * 30271
            GOTO    KINVISLF.L17                 * 30273
KINVISLF.loop8:
            D=D+1   A                            * 30277
KINVISLF.L9:
            D=D+1   A                            * 30279
            ASLC                                 * 3027B
            ASLC                                 * 3027E
KINVISLF.L10:
            D=D+1   A                            * 30281
KINVISLF.loop11:
            R4=A                                 * 30283
            C=D     A                            * 30286
            C=C+1   A                            * 30288
            R3=C                                 * 3028A
KINVISLF.loop12:
            P=      1                            * 3028D
            GOTO    KINVISLF.loop18              * 3028F
KINVISLF.L13:
            LC(4)   #0A0D                        * 30293
            ?C#A    B                            * 30299
            GOYES   KINVISLF.loop12              * 3029C
            ?D=0    A                            * 3029E
            GOYES   KINVISLF.loop11              * 302A1
            ?C#A    A                            * 302A3
            GOYES   KINVISLF.loop12              * 302A6
            D=D-1   A                            * 302A8
            LC(2)   #0A                          * 302AA
            A=C     A                            * 302AE
KINVISLF.L14:
            P=      3                            * 302B0
            GOTO    KINVISLF.loop18              * 302B2
KINVISLF.L15:
            ?ST=0   2                            * 302B6
            GOYES   KINVISLF.L19                 * 302B9
            D1=(5)  SUB_2FFD0.L16                * 302BB
KINVISLF.loop16:
            C=DAT1  4                            * 302C2
            D1=D1+  6                            * 302C6
            ?C=0    B                            * 302C9
            GOYES   KINVISLF.L19                 * 302CC
            ?C#A    A                            * 302CE
            GOYES   KINVISLF.loop16              * 302D1
            D1=D1-  8                            * 302D3
            A=DAT1  B                            * 302D6
KINVISLF.L17:
            P=      5                            * 302D9
KINVISLF.loop18:
            C=RSTK                               * 302DB
            C+P+1                                * 302DD
            D1=C                                 * 302E0
            P=      0                            * 302E3
            DAT0=A  B                            * 302E5
            D0=D0+  2                            * 302E8
            GOTO    KINVISLF.loop1               * 302EB
KINVISLF.L19:
            D=D-1   A                            * 302EF
            GOC     KINVISLF.loop8               * 302F1
            B=0     A                            * 302F4
            LC(3)   #200                         * 302F6
KINVISLF.loop20:
            LC(2)   #30                          * 302FB
            ?C>A    B                            * 302FF
            GOYES   KINVISLF.L23                 * 30302
            LC(2)   #39                          * 30304
            ?C<A    B                            * 30308
            GOYES   KINVISLF.L23                 * 3030B
            BSL     A                            * 3030D
            B=A     P                            * 3030F
            P=      5                            * 30312
            ASR     WP                           * 30314
            P=      0                            * 30317
            ASR     A                            * 30319
            C=C-1   XS                           * 3031B
            GONC    KINVISLF.loop20              * 3031E
            LC(3)   #159                         * 30321
            ?ST=0   2                            * 30326
            GOYES   KINVISLF.L21                 * 30329
            LC(3)   #255                         * 3032B
KINVISLF.L21:
            ?B>C    X                            * 30330
            GOYES   KINVISLF.L23                 * 30333
            P=      13                           * 30335
            A=0     A                            * 30337
KINVISLF.loop22:
            A=A+A   A                            * 30339
            C=A     A                            * 3033B
            A=A+A   A                            * 3033D
            A=A+A   A                            * 3033F
            A=A+C   A                            * 30341
            GONC    KINVISLF.L25                 * 30343
KINVISLF.L23:
            D=D+CON A,3                          * 30346
            ASLC                                 * 3034C
            ASLC                                 * 3034F
            GOTO    KINVISLF.loop12              * 30352
KINVISLF.loop24:
            A=A+1   A                            * 30356
KINVISLF.L25:
            B=B-1   XS                           * 30358
            GONC    KINVISLF.loop24              * 3035B
            BSL     A                            * 3035E
            P=P+1                                * 30360
            GONC    KINVISLF.loop22              * 30362
            P=      7                            * 30365
            GOTO    KINVISLF.loop18              * 30367
          ENDCODE                                * 3036B
        ;                                        * 3036B

* refs (5): 2FECE 2FEE2 30175 303B1 3047C
ChkTransio:
        :: GetIOPAR                              * 30370

* $ -> $ flag
VERSTRING?:
          6UNROLL 5DROP IOCheckReal %IP># DUP BINT4 #< ?SEMI * 3037A
          SetIOPARerr ;                          * 303A2

* refs (2): 2F176 2F3E2
HeadIOString:
        :: ChkTransio                            * 303AC

HeadIOString(s):
          CODE                                   * 303B6  178 nibbles
            GOSBVL  SAVPTR                       * 303C0
            C=0     A                            * 303C7
            LC(1)   #D                           * 303C9
            GOSBVL  MAKE$                        * 303CC
            LC(6)   #285420                      * 303D3
            DAT0=C  6                            * 303DB
            D0=D0+  6                            * 303DF
            C=DAT1  A                            * 303E2
            D1=C                                 * 303E5
            D1=D1+  5                            * 303E8
            A=DAT1  A                            * 303EB
            LC(8)   #28412930                    * 303EE
            A=A-1   A                            * 303F8
            GOC     HeadIOString(s).L1           * 303FA
            C=C+1   A                            * 303FD
            A=A-1   A                            * 303FF
            GOC     HeadIOString(s).L1           * 30401
            C=C+1   A                            * 30404
            A=A-1   A                            * 30406
            GOC     HeadIOString(s).L1           * 30408
            C=C+1   A                            * 3040B
            A=A-1   A                            * 3040D
            GOC     HeadIOString(s).L1           * 3040F
            GOTO    HeadIOString~1               * 30412
HeadIOString(s).L1:
            DAT0=C  8                            * 30416
            D0=D0+  8                            * 3041A
            D1=(5)  #80847                       * 3041D
            A=DAT1  B                            * 30424
            LC(8)   #28462952                    * 30427
            ?ABIT=1 0                            * 30431
            GOYES   HeadIOString(s).L2           * 30436
            LC(2)   #44                          * 30438
            ?ABIT=0 1                            * 3043C
            GOYES   HeadIOString(s).L2           * 30441
            LC(2)   #47                          * 30443
HeadIOString(s).L2:
            DAT0=C  8                            * 30447
            D0=D0+  8                            * 3044B
            D1=D1+  8                            * 3044E
            A=DAT1  B                            * 30451
            LC(6)   #3B292E                      * 30454
            ?ABIT=0 2                            * 3045C
            GOYES   HeadIOString(s).L3           * 30461
            LC(2)   #2C                          * 30463
HeadIOString(s).L3:
            DAT0=C  4                            * 30467
            GOVLNG  GPOverWrR0Lp                 * 3046B
          ENDCODE                                * 30472
        ;                                        * 30472

* refs (2): 2F489 2F588
* Probably: the file translation for received text, undoing KVIS according to the TRANSIO setting
OBJ_30477:
        :: ChkTransio TOTEMPSWAP                 * 30477
          CODE                                   * 30486  299 nibbles
            GOSBVL  SAVPTR                       * 30490
            A=DAT1  A                            * 30497
            AD1EX                                * 3049A
            R1=A                                 * 3049D
            GOSUB   GetStrLen                    * 304A0
            B=C     A                            * 304A4
OBJ_30477.loop1:
            GOSUB   SUB_305ED                    * 304A6
            GOC     OBJ_30477.L2                 * 304AA
            A=DAT1  4                            * 304AD
            C=A     A                            * 304B1
            D1=D1+  4                            * 304B3
            B=B-1   A                            * 304B6
            GOC     OBJ_30477.L5                 * 304B8
            C=DAT1  4                            * 304BB
            D=C     A                            * 304BF
            LC(4)   #2846                        * 304C1
            ?C=A    A                            * 304C7
            GOYES   OBJ_30477.L3                 * 304CA
            LC(2)   #41                          * 304CC
            ?C=A    A                            * 304D0
            GOYES   HeadIOString~1.L1            * 304D3
            LC(2)   #54                          * 304D5
            ?C=A    A                            * 304D9
            GOYES   HeadIOString~1.L3            * 304DC
            LC(4)   #3A4F                        * 304DE
            ?C#A    A                            * 304E4
            GOYES   HeadIOString~1               * 304E7
OBJ_30477.L2:
            GOVLNG  GPOverWrTLp                  * 304E9
OBJ_30477.L3:
            D0=(5)  #8084F                       * 304F0
            A=DAT0  B                            * 304F7
            ABIT=0  2                            * 304FA
            LC(2)   #2E                          * 304FF
            ?D=C    B                            * 30503
            GOYES   OBJ_30477.L4                 * 30506
            LC(2)   #2C                          * 30508
            ?D#C    B                            * 3050C
            GOYES   HeadIOString~1               * 3050F
            ABIT=1  2                            * 30511
OBJ_30477.L4:
            DAT0=A  B                            * 30516
            D1=D1+  2                            * 30519
            B=B-CON A,2                          * 3051C
OBJ_30477.L5:
            GOC     HeadIOString~1               * 30522
            A=DAT1  B                            * 30525
            LC(2)   #29                          * 30528
            ?C#A    B                            * 3052C
            GOYES   HeadIOString~1               * 3052F
            D1=D1+  2                            * 30531
            GOTO    OBJ_30477.loop1              * 30534
HeadIOString~1:
            GOVLNG  GPOverWrFLp                  * 30538
HeadIOString~1.L1:
            GOTO    HeadIOString~1.L6            * 3053F
HeadIOString~1.loop2:
            GOTO    OBJ_30477.L4                 * 30543
HeadIOString~1.L3:
            C=R1                                 * 30547
            D0=C                                 * 3054A
            D0=D0+  5                            * 3054D
            A=DAT0  A                            * 30550
            D0=A                                 * 30553
            D0=D0+  5                            * 30556
            A=0     A                            * 30559
            LC(2)   #30                          * 3055B
            D=D-C   B                            * 3055F
            GOC     HeadIOString~1               * 30562
            D=D-1   B                            * 30565
            GOC     HeadIOString~1.loop2         * 30568
            A=A+1   A                            * 3056B
            D=D-1   B                            * 3056D
            GOC     HeadIOString~1.loop2         * 30570
            A=A+1   A                            * 30573
            D=D-1   B                            * 30575
            GOC     HeadIOString~1.loop2         * 30578
            A=A+1   A                            * 3057B
            D=D-1   B                            * 3057D
HeadIOString~1.loop4:
            GOC     HeadIOString~1.loop2         * 30580
HeadIOString~1.loop5:
            GOTO    HeadIOString~1               * 30583
HeadIOString~1.L6:
            D0=(5)  #80847                       * 30587
            A=DAT0  B                            * 3058E
            LC(2)   #FC                          * 30591
            A=A&C   B                            * 30595
            LC(2)   #44                          * 30599
            ?D=C    B                            * 3059D
            GOYES   HeadIOString~1.loop4         * 305A0
            A=A+1   A                            * 305A2
            LC(2)   #52                          * 305A4
            ?D=C    B                            * 305A8
            GOYES   HeadIOString~1.loop4         * 305AB
            A=A+1   A                            * 305AD
            LC(2)   #47                          * 305AF
            ?D=C    B                            * 305B3
            GOYES   HeadIOString~1.loop4         * 305B6
            GONC    HeadIOString~1.loop5         * 305B8
          ENDCODE                                * 305BB
          GetIOPAR DROP 7ROLL UNCOERCE BINT6 {}N OVER NOTcaseDROP StoIOPAR * 305BB
        ;                                        * 305E8
        ASSEMBLE

* refs (1): 304A6
SUB_305ED:
        LC(2)   #20                              * 305ED
        GOTO    SUB_305ED.L2                     * 305F1
SUB_305ED.loop1:
        D1=D1+  2                                * 305F5
SUB_305ED.L2:
        A=DAT1  B                                * 305F8
        B=B-1   A                                * 305FB
        RTNC                                     * 305FD
        ?C>=A   B                                * 30600
        GOYES   SUB_305ED.loop1                  * 30603
        RTNCC                                    * 30605
        RPL

* refs (2): 2F65F D45AB
OBJ_30607:
        :: HeaderMatch? NOT?SEMI                 * 30607
          DUPLEN$ VERSTRING LEN$ SWAPOVER#- #<3 caseDROP * 30616
          CODE                                   * 30634  237 nibbles
            GOSBVL  POP#                         * 3063E
            A=A+A   A                            * 30645
            R1=A                                 * 30647
            GOSBVL  SAVPTR                       * 3064A
            A=DAT1  A                            * 30651
            R2=A                                 * 30654
            D1=A                                 * 30657
            D1=D1+  5                            * 3065A
            C=DAT1  A                            * 3065D
            AD1EX                                * 30660
            C=C+A   A                            * 30663
            R0=C                                 * 30665
            C=R1                                 * 30668
            A=A+C   A                            * 3066B
            D0=A                                 * 3066D
            D0=D0+  5                            * 30670
            A=DAT0  A                            * 30673
            D1=A                                 * 30676
            A=DAT1  A                            * 30679
            LC(5)   PRLG                         * 3067C
            ?C=A    A                            * 30683
            GOYES   OBJ_30607.L2                 * 30686
            LC(5)   CMOS                         * 30688
            ?C<=A   A                            * 3068F
            GOYES   OBJ_30607.loop1              * 30692
            D1=A                                 * 30694
            A=DAT1  A                            * 30697
            LC(5)   PRLG                         * 3069A
            ?C=A    A                            * 306A1
            GOYES   OBJ_30607.L2                 * 306A4
OBJ_30607.loop1:
            GOVLNG  GPPushFLoop                  * 306A6
OBJ_30607.L2:
            GOSBVL  SAFESKIPOB                   * 306AD
            GOC     OBJ_30607.loop1              * 306B4
            CD0EX                                * 306B7
            A=R0                                 * 306BA
            A=A-C   A                            * 306BD
            R3=A                                 * 306BF
            C=0     A                            * 306C2
            C=C-1   B                            * 306C4
            ?C<A    A                            * 306C7
            GOYES   OBJ_30607.loop1              * 306CA
            C=R1                                 * 306CC
            A=A+C   A                            * 306CF
            A=A+CON A,10                         * 306D1
            C=R0                                 * 306D7
            R0=A                                 * 306DA
            A=R2                                 * 306DD
            D1=A                                 * 306E0
            C=C-A   A                            * 306E3
            B=C     A                            * 306E5
            C=R1                                 * 306E7
            A=A+C   A                            * 306EA
            D0=A                                 * 306EC
            D0=D0+  10                           * 306EF
            C=R0                                 * 306F2
            B=B-C   A                            * 306F5
            C=B     A                            * 306F7
            GOSBVL  MOVEDOWN                     * 306F9
            C=R3                                 * 30700
            AD0EX                                * 30703
            A=A+C   A                            * 30706
            C=R0                                 * 30708
            GOSBVL  MOVERSD                      * 3070B
            A=B     A                            * 30712
            D0=A                                 * 30714
            A=R0                                 * 30717
            C=DAT0  A                            * 3071A
            C=C-A   A                            * 3071D
            DAT0=C  A                            * 3071F
            GOVLNG  GPPushTLoop                  * 30722
            BSS     2                            * 30729  zeros
          ENDCODE                                * 3072B
          NOT?SEMI                               * 3072B
          ?ROMPTR> ;                             * 30730

* refs (2): 2F3D8 3060C
* $ -> $ flag: TRUE when the string starts with the first 6 characters of the ROM's version string, the header of a binary object
HeaderMatch?:
        :: VERSTRING BINT1 BINT6 SUB$ OVER BINT1 BINT6 SUB$ EQUAL ; * 3073A

* refs (2): 2F144 2F419
* -> flag: TRUE when flag -35 is clear (ASCII transfer)
ASCIIXfer?:
        CON(5)  (*)+5                            * 30771  primitive code object
        ASSEMBLE
        CD1EX                                    * 30776
        D1=(5)  #8084B                           * 30779
        A=DAT1  B                                * 30780
        D1=C                                     * 30783
        ?ABIT=0 2                                * 30786
        GOYES   ASCIIXfer?.L1                    * 3078B
ASCIIXfer?.L1:
        GOVLNG  PushT/FLoop                      * 3078D

* -> $
* refs (3): 2F1AD 3061B 3073F
VERSTRING:
        CON(5)  (*)+5                            * 30794  primitive code object
        GOSBVL  SAVPTR                           * 30799
        C=0     A                                * 307A0
        LC(1)   #8                               * 307A2
        GOSBVL  MAKE$                            * 307A5
        CD0EX                                    * 307AC
        D=C     A                                * 307AF
        GOSBVL  GetVersionId                     * 307B1
        A=DAT1  12                               * 307B8
        C=D     A                                * 307BC
        D0=C                                     * 307BE
        LC(4)   #5048                            * 307C1
        DAT0=C  4                                * 307C7
        D0=D0+  4                                * 307CB
        DAT0=A  12                               * 307CE
        A=R0                                     * 307D2
        GOSBVL  GPPushA                          * 307D5
        GOLONG  Loop                             * 307DC
        RPL

* refs (6): 2E10D 2E296 2E2B9 2F2D9 30BC3 30D3B
GETKP:
        :: ' LAMKP DRPExitAtLOOP NOTcase KermInitPar * 307E2
        ;                                        * 30800

* $ #pos -> #'
* refs (14): 2E2A0 2E2C3 6B34A 6C235 6CAEE 9A4F3 ...
SUB$1#:
        CON(5)  (*)+5                            * 30805  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 3080A
        A=A+A   A                                * 30811
        GOSUBL  PopSavptr                        * 30813
        D1=D1-  5                                * 30819
        C=DAT1  A                                * 3081C
        C=C+A   A                                * 3081F
        D1=C                                     * 30821
        D1=D1+  8                                * 30824
        A=0     A                                * 30827
        A=DAT1  B                                * 30829
        GOVLNG  PUSH#ALOOP                       * 3082C
        RPL

* refs (2): 2D613 30865
SEND_PACKET~1:
        :: LAMPACKET KermSendRaw KermRecvPkt caseTRUE LAMMaxR * 30833
          KermRetry? NOTcaseFALSE DROP           * 30851
          COLA SEND_PACKET~1                     * 30860
        ;                                        * 3086A
        ASSEMBLE

* refs (3): 2DE6E 308B1 30932
* Levels 1 and 2 are parameter strings -> D0, D1 at their seventh character (QBIN). Saves the RPL pointers
KermParPtrs:
        GOSUB   SAVPTR~jump_13                   * 3086F
        A=DAT1  A                                * 30873
        C=0     A                                * 30876
        LC(2)   #16                              * 30878
        A=A+C   A                                * 3087C
        D0=A                                     * 3087E
        D1=D1+  5                                * 30881
        A=DAT1  A                                * 30884
        A=A+C   A                                * 30887
        D1=A                                     * 30889
        RTNCC                                    * 3088C
        RPL

* refs (1): 2D503
* $ours $theirs -> $par flag: after the other side's Send-Init, checks its parameters and agrees on the 8th-bit quote and block check type: both sides must accept a value
KermMergePar:
        :: KermChkPar NOTcase drop(2);false      * 3088E
          SWAP                                   * 308A2
          CODE                                   * 308A7  94 nibbles
            GOSUB   KermParPtrs                  * 308B1
            A=DAT0  B                            * 308B5
            LC(2)   #59                          * 308B8
            ?C#A    B                            * 308BC
            GOYES   KermMergePar.L1              * 308BF
            A=DAT1  B                            * 308C1
            ?C#A    B                            * 308C4
            GOYES   KermMergePar.L4              * 308C7
            GONC    KermMergePar.L2              * 308C9
KermMergePar.L1:
            C=DAT1  B                            * 308CC
            ?C=A    B                            * 308CF
            GOYES   KermMergePar.L4              * 308D2
            A=C     B                            * 308D4
            LC(2)   #59                          * 308D7
            ?C=A    B                            * 308DB
            GOYES   KermMergePar.L3              * 308DE
KermMergePar.L2:
            LC(2)   #20                          * 308E0
            DAT1=C  B                            * 308E4
            GONC    KermMergePar.L4              * 308E7
KermMergePar.L3:
            A=DAT0  B                            * 308EA
            DAT1=A  B                            * 308ED
KermMergePar.L4:
            D0=D0+  2                            * 308F0
            D1=D1+  2                            * 308F3
            A=DAT0  B                            * 308F6
            C=DAT1  B                            * 308F9
            ?C=A    B                            * 308FC
            GOYES   KermMergePar.L5              * 308FF
            LC(2)   #31                          * 30901
            DAT1=C  B                            * 30905
KermMergePar.L5:
            GOVLNG  GPOverWrTLp                  * 30908
          ENDCODE                                * 3090F
        ;                                        * 3090F

* refs (2): 2DE46 2F70E
ACK_INIT:
        :: KermChkPar NOTcaseFALSE CHOOSE_INIT   * 30914
          CODE                                   * 30928  181 nibbles
            GOSUB   KermParPtrs                  * 30932
            D0=D0-  10                           * 30936
            D1=D1-  10                           * 30939
            A=DAT1  B                            * 3093C
            C=DAT0  B                            * 3093F
            ?C>A    B                            * 30942
            GOYES   ACK_INIT.L1                  * 30945
            A=A-C   B                            * 30947
            LC(2)   #03                          * 3094A
            ?C<A    B                            * 3094E
            GOYES   ACK_INIT.L3                  * 30951
            C=-C-1  B                            * 30953
            GOTO    ACK_INIT.L2                  * 30956
ACK_INIT.L1:
            CAEX    A                            * 3095A
            A=A-C   B                            * 3095C
            LC(2)   #03                          * 3095F
            ?C<A    B                            * 30963
            GOYES   ACK_INIT.L3                  * 30966
ACK_INIT.L2:
            A=DAT0  B                            * 30968
            A=A+C   B                            * 3096B
            DAT0=A  B                            * 3096E
ACK_INIT.L3:
            D0=D0+  10                           * 30971
            D1=D1+  10                           * 30974
            A=DAT1  B                            * 30977
            LC(2)   #20                          * 3097A
            ?C=A    B                            * 3097E
            GOYES   ACK_INIT.L6                  * 30981
            LC(2)   #59                          * 30983
            ?C=A    B                            * 30987
            GOYES   ACK_INIT.L4                  * 3098A
            DAT0=A  B                            * 3098C
            GOTO    ACK_INIT.L7                  * 3098F
ACK_INIT.L4:
            A=DAT0  B                            * 30993
            ?C=A    B                            * 30996
            GOYES   ACK_INIT.L5                  * 30999
            DAT1=A  B                            * 3099B
            GONC    ACK_INIT.L7                  * 3099E
ACK_INIT.L5:
            LC(2)   #20                          * 309A1
            DAT1=C  B                            * 309A5
ACK_INIT.L6:
            DAT0=C  B                            * 309A8
ACK_INIT.L7:
            D0=D0-  2                            * 309AB
            C=DAT0  B                            * 309AE
            D0=D0+  2                            * 309B1
            ?C=A    B                            * 309B4
            GOYES   ACK_INIT.L8                  * 309B7
            D1=D1-  2                            * 309B9
            C=DAT1  B                            * 309BC
            D1=D1+  2                            * 309BF
            ?C#A    B                            * 309C2
            GOYES   ACK_INIT.L9                  * 309C5
ACK_INIT.L8:
            LC(2)   #20                          * 309C7
            DAT0=C  B                            * 309CB
            DAT1=C  B                            * 309CE
ACK_INIT.L9:
            D0=D0+  2                            * 309D1
            D1=D1+  2                            * 309D4
            A=DAT1  B                            * 309D7
            DAT0=A  B                            * 309DA
KermChkPar~1:
            GOVLNG  GPPushTLoop                  * 309DD
            BSS     3                            * 309E4  zeros
          ENDCODE                                * 309E7
        ;                                        * 309E7

* refs (2): 30893 30919
* $ -> $' flag: completes a parameter string with our defaults and checks each field against its legal range. FALSE and "Protocol Error" when one is bad
KermChkPar:
        :: KermInitPar OVERLEN$ #1+LAST$ &$ CKREF * 309EC
          CODE                                   * 30A0A  218 nibbles
            GOSUB   SAVPTR~jump_13               * 30A14
            C=DAT1  A                            * 30A18
            D1=C                                 * 30A1B
            D1=D1+  10                           * 30A1E
            LC(4)   #7E2A                        * 30A21
            GOSUB   KermParRange                 * 30A27
            GONC    KermChkPar.L1                * 30A2B
            LC(2)   #20                          * 30A2E
            B=C     A                            * 30A32
            LC(2)   #70                          * 30A34
            GOSUB   KermParIs                    * 30A38
            GONC    KermChkPar.L1                * 30A3C
            LC(5)   PROTERR                      * 30A3F
            A=C     A                            * 30A46
            GOSBVL  GETPTR                       * 30A48
            DAT1=A  A                            * 30A4F
            GOVLNG  PushFLoop                    * 30A52
KermChkPar.L1:
            LC(4)   #3921                        * 30A59
            GOSUB   KermParRange                 * 30A5F
            GONC    KermChkPar.L2                * 30A63
            LC(2)   #25                          * 30A66
            GOSUB   KermParIs                    * 30A6A
            GONC    KermChkPar.L2                * 30A6E
            LC(2)   #39                          * 30A71
            GOSUB   KermParSet                   * 30A75
KermChkPar.L2:
            D1=D1+  2                            * 30A79
            LC(2)   #40                          * 30A7C
            GOSUB   KermParIs                    * 30A80
            GONC    KermChkPar.L3                * 30A84
            D1=D1+  2                            * 30A87
KermChkPar.L3:
            LC(2)   #2D                          * 30A8A
            GOSUB   KermParIs                    * 30A8E
            GONC    KermChkPar.L4                * 30A92
            D1=D1+  2                            * 30A95
KermChkPar.L4:
            LC(2)   #23                          * 30A98
            GOSUB   KermParIs                    * 30A9C
            GONC    KermChkPar.L5                * 30AA0
            D1=D1+  2                            * 30AA3
KermChkPar.L5:
            LC(4)   #3E21                        * 30AA6
            GOSUB   KermParRange                 * 30AAC
            GONC    KermChkPar.L6                * 30AB0
            LC(4)   #7E60                        * 30AB3
            GOSUB   KermParRange                 * 30AB9
            GONC    KermChkPar.L6                * 30ABD
            LC(4)   #5959                        * 30AC0
            GOSUB   KermParRange                 * 30AC6
            GONC    KermChkPar.L6                * 30ACA
            LC(2)   #20                          * 30ACD
            GOSUB   KermParSet                   * 30AD1
KermChkPar.L6:
            LC(4)   #3331                        * 30AD5
            GOSUB   KermParRange                 * 30ADB
            GONC    KermChkPar.L7                * 30ADF
            LC(2)   #31                          * 30AE2
            GOSUB   KermParSet                   * 30AE6
KermChkPar.L7:
            GOTO    KermChkPar~1                 * 30AEA
          ENDCODE                                * 30AEE
        ;                                        * 30AEE
        ASSEMBLE

* refs (6): 30A27 30A5F 30AAC 30AB9 30AC6 30ADB
* D1 = field, C.B = lowest, next byte of C = highest -> carry clear and D1 past the field if it is in range; otherwise carry set
KermParRange:
        A=DAT1  B                                * 30AF3
        ?C>A    B                                * 30AF6
        RTNYES                                   * 30AF9
        CSR     A                                * 30AFB
        CSR     A                                * 30AFD
        ?C>=A   B                                * 30AFF
        GOYES   KermParSet.L1                    * 30B02
        RTNSC                                    * 30B04

* refs (5): 30A38 30A6A 30A80 30A8E 30A9C
* D1 = field, B.B = value -> carry set if the field differs; otherwise goes on to store C.B there and step past it
KermParIs:
        A=DAT1  B                                * 30B06
        ?A#B    B                                * 30B09
        RTNYES                                   * 30B0C

* refs (3): 30A75 30AD1 30AE6
* D1 = field, C.B = value -> stores it and steps past the field
KermParSet:
        DAT1=C  B                                * 30B0E
KermParSet.L1:
        D1=D1+  2                                * 30B11
        RTNCC                                    * 30B14

* refs (5): 3086F 30A14 30B8A 30BDC 30D4A
SAVPTR~jump_13:
        GOVLNG  SAVPTR                           * 30B16
        RPL

* refs (7): 2D526 2D9FF 2DA95 2DE5F 2E713 30923 ...
CHOOSE_INIT:
        :: $ "~* @-#Y" TOTEMPOB GetIOPAR DROP 5UNROLL 4DROP IOCheckReal * 30B1D
          IO%1to3? NOTcase SetIOPARerr           * 30B58
          COERCE BINT48 #+ #>CHR >T$             * 30B67
          CODE                                   * 30B80  47 nibbles
            GOSUB   SAVPTR~jump_13               * 30B8A
            C=DAT1  A                            * 30B8E
            D1=C                                 * 30B91
            D1=D1+  10                           * 30B94
            D1=D1+  12                           * 30B97
            D0=(5)  uart_parity                  * 30B9A
            A=DAT0  XS                           * 30BA1
            A=A+A   XS                           * 30BA5
            GONC    CHOOSE_INIT.L1               * 30BA8
            LC(2)   #26                          * 30BAB
            DAT1=C  B                            * 30BAF
CHOOSE_INIT.L1:
            GOVLNG  GETPTRLOOP                   * 30BB2
          ENDCODE                                * 30BB9
        ;                                        * 30BB9

* refs (4): 2E0DB 2E935 2F234 2F907
ENCODE1PKT:
        :: GETKP ENCODE ?SEMIDROP                * 30BBE
        ;                                        * 30BD2

* refs (2): 2F2DE 30BC8
ENCODE:
        CON(5)  (*)+5                            * 30BD7  primitive code object
        ASSEMBLE
        GOSUB   SAVPTR~jump_13                   * 30BDC
        A=DAT1  A                                * 30BE0
        D0=A                                     * 30BE3
        D0=D0+  10                               * 30BE6
        A=0     A                                * 30BE9
        A=DAT0  B                                * 30BEB
        D0=D0+  14                               * 30BEE
        C=DAT0  B                                * 30BF1
        A=A-C   B                                * 30BF4
        LC(2)   #0E                              * 30BF7
        A=A+C   B                                * 30BFB
        R3=A                                     * 30BFE
        D0=D0-  4                                * 30C01
        GOSUB   KermQuotes                       * 30C04
        C=R3                                     * 30C08
        GOSBVL  MAKE$                            * 30C0B
        D1=D1+  5                                * 30C12
        GOSUBL  GetStrLenStk                     * 30C15
        D=C     A                                * 30C1B
        R4=C                                     * 30C1D
        C=R3                                     * 30C20
        B=C     A                                * 30C23
ENCODE.loop1:
        D=D-1   A                                * 30C25
        GONC    ENCODE.L3                        * 30C27
ENCODE.loop2:
        GOTO    ENCODE.L9                        * 30C2A
ENCODE.L3:
        B=B-1   A                                * 30C2E
        GOC     ENCODE.loop2                     * 30C30
        A=DAT1  B                                * 30C33
        B=0     S                                * 30C36
        LC(2)   #80                              * 30C39
        ?C>A    B                                * 30C3D
        GOYES   ENCODE.L4                        * 30C40
        C=R1                                     * 30C42
        ?C=0    B                                * 30C45
        GOYES   ENCODE.L4                        * 30C48
        C=0     A                                * 30C4A
        LC(1)   #2                               * 30C4C
        ?B<C    A                                * 30C4F
        GOYES   ENCODE.loop2                     * 30C52
        C=R1                                     * 30C54
        DAT0=C  B                                * 30C57
        D0=D0+  2                                * 30C5A
        B=B-1   A                                * 30C5D
        ABIT=0  7                                * 30C5F
ENCODE.L4:
        LC(2)   #20                              * 30C64
        ?C>A    B                                * 30C68
        GOYES   ENCODE.L6                        * 30C6B
        LC(2)   #7F                              * 30C6D
        ?C>A    B                                * 30C71
        GOYES   ENCODE.L5                        * 30C74
        LC(2)   #9F                              * 30C76
        ?C>=A   B                                * 30C7A
        GOYES   ENCODE.L6                        * 30C7D
        LC(2)   #FF                              * 30C7F
        ?C=A    B                                * 30C83
        GOYES   ENCODE.L6                        * 30C86
ENCODE.L5:
        C=R1                                     * 30C88
        ?C=A    B                                * 30C8B
        GOYES   ENCODE.L7                        * 30C8E
        CSR     A                                * 30C90
        CSR     A                                * 30C92
        ?C=A    B                                * 30C94
        GOYES   ENCODE.L7                        * 30C97
        GONC    ENCODE.L8                        * 30C99
ENCODE.L6:
        C=A     B                                * 30C9C
        ABIT=0  6                                * 30C9F
        ?CBIT=1 6                                * 30CA4
        GOYES   ENCODE.L7                        * 30CA9
        ABIT=1  6                                * 30CAB
ENCODE.L7:
        C=0     A                                * 30CB0
        C=C+1   A                                * 30CB2
        ?B<C    A                                * 30CB4
        GOYES   ENCODE.L9                        * 30CB7
        C=R1                                     * 30CB9
        CSR     A                                * 30CBC
        CSR     A                                * 30CBE
        DAT0=C  B                                * 30CC0
        D0=D0+  2                                * 30CC3
        B=B-1   A                                * 30CC6
ENCODE.L8:
        DAT0=A  B                                * 30CC8
        D0=D0+  2                                * 30CCB
        D1=D1+  2                                * 30CCE
        GOTO    ENCODE.loop1                     * 30CD1
ENCODE.L9:
        C=D     A                                * 30CD5
        C=C+1   A                                * 30CD7
        R2=C                                     * 30CD9
        GOSBVL  Shrink$                          * 30CDC
        GOSBVL  GETPTR                           * 30CE3
        D1=D1+  5                                * 30CEA
        D=D+1   A                                * 30CED
        C=R0                                     * 30CEF
        DAT1=C  A                                * 30CF2
        A=R2                                     * 30CF5
        ?A#0    A                                * 30CF8
        GOYES   ENCODE.L10                       * 30CFB
        GOVLNG  PushTLoop                        * 30CFD
ENCODE.L10:
        C=R4                                     * 30D04
        C=C-A   A                                * 30D07
        R0=C                                     * 30D09
        GOVLNG  KermRecvPkt.L3                   * 30D0C

* refs (2): 30C04 30D5A
* D0 = two parameter bytes -> R1 = both, with the low one 0 when it is a space (no 8th-bit quoting)
KermQuotes:
        A=DAT0  B                                * 30D13
        ASL     A                                * 30D16
        ASL     A                                * 30D18
        D0=D0+  2                                * 30D1A
        A=DAT0  B                                * 30D1D
        LC(2)   #20                              * 30D20
        ?C#A    B                                * 30D24
        GOYES   KermQuotes.L1                    * 30D27
        A=0     B                                * 30D29
KermQuotes.L1:
        R1=A                                     * 30D2C
        RTN                                      * 30D2F
        RPL

* refs (5): 2DB99 2EFF5 2F86C 2FA33 2FA74
DECODE:
        :: CKREF GETKP                           * 30D31
          CODE                                   * 30D40  245 nibbles
            GOSUB   SAVPTR~jump_13               * 30D4A
            A=DAT1  A                            * 30D4E
            D0=A                                 * 30D51
            D0=D0+  10                           * 30D54
            D0=D0+  10                           * 30D57
            GOSUB   KermQuotes                   * 30D5A
            D1=D1+  5                            * 30D5E
            GOSUBL  GetStrLenStk                 * 30D61
            D=C     A                            * 30D67
            AD1EX                                * 30D69
            R2=A                                 * 30D6C
            D0=A                                 * 30D6F
            D1=A                                 * 30D72
            GONC    DECODE.L2                    * 30D75
DECODE.loop1:
            DAT0=A  B                            * 30D78
            D0=D0+  2                            * 30D7B
DECODE.L2:
            GOSUB   KermDecodeCh                 * 30D7E
            GONC    DECODE.loop1                 * 30D82
            AD1EX                                * 30D85
            D1=A                                 * 30D88
            CD0EX                                * 30D8B
            C=A-C   A                            * 30D8E
            D=C     A                            * 30D90
            C=R2                                 * 30D92
            D0=C                                 * 30D95
            D0=D0-  5                            * 30D98
            C=DAT0  A                            * 30D9B
            C=C-D   A                            * 30D9E
            DAT0=C  A                            * 30DA0
            C=DAT1  A                            * 30DA3
            C=C-D   A                            * 30DA6
            DAT1=C  A                            * 30DA8
            C=D     A                            * 30DAB
            GOSBVL  MOVERSD                      * 30DAD
DECODE.L3:
            GOSBVL  GETPTR                       * 30DB4
            GOVLNG  DropLoop                     * 30DBB

* refs (1): 30D7E
* Decodes one character of packet data from D1, following the control and 8th-bit prefixes. D.A counts the bytes left; carry set when they run out
KermDecodeCh:
            D=D-1   A                            * 30DC2
            RTNC                                 * 30DC4
            A=0     A                            * 30DC7
            A=DAT1  B                            * 30DC9
            D1=D1+  2                            * 30DCC
            C=R1                                 * 30DCF
            ?C=0    B                            * 30DD2
            GOYES   KermDecodeCh.L1              * 30DD5
            ?C#A    B                            * 30DD7
            GOYES   KermDecodeCh.L1              * 30DDA
            A=A+1   XS                           * 30DDC
            D=D-1   A                            * 30DDF
            RTNC                                 * 30DE1
            A=DAT1  B                            * 30DE4
            D1=D1+  2                            * 30DE7
KermDecodeCh.L1:
            CSR     A                            * 30DEA
            CSR     A                            * 30DEC
            ?C#A    B                            * 30DEE
            GOYES   KermDecodeCh.L4              * 30DF1
            D=D-1   A                            * 30DF3
            RTNC                                 * 30DF5
            A=DAT1  B                            * 30DF8
            D1=D1+  2                            * 30DFB
            A=A+A   B                            * 30DFE
            GONC    KermDecodeCh.L2              * 30E01
            ?A#0    XS                           * 30E04
            GOYES   KermDecodeCh.L2              * 30E07
            A=A+1   XS                           * 30E09
KermDecodeCh.L2:
            ASRB.F  B                            * 30E0C
            LC(2)   #3F                          * 30E11
            ?C#A    B                            * 30E15
            GOYES   KermDecodeCh.L3              * 30E18
            ABIT=1  6                            * 30E1A
KermDecodeCh.L3:
            ?C>A    B                            * 30E1F
            GOYES   KermDecodeCh.L4              * 30E22
            LC(2)   #5F                          * 30E24
            ?C<A    B                            * 30E28
            GOYES   KermDecodeCh.L4              * 30E2B
            ABIT=0  6                            * 30E2D
KermDecodeCh.L4:
            ?A=0    XS                           * 30E32
            GOYES   KermDecodeCh.L5              * 30E35
            A=A+A   B                            * 30E37
            ASRB                                 * 30E3A
KermDecodeCh.L5:
            RTNCC                                * 30E3D
          ENDCODE                                * 30E3F
        ;                                        * 30E3F

* refs (2): 2E0FE 3083D
* $ ->: empties the receive buffer and writes the string to the serial port, raising any error. ATTN aborts
KermSendRaw:
        :: FLUSHRSBUF                            * 30E44

* refs (1): 323AF
PutSerialECk:
          PUTSERIAL ?SEMI                        * 30E4E
          SWAPDROP ~ATTNERR;#=casedrop;ABORT ERROROUT * 30E58
        ;                                        * 30E67

* refs (3): 2DBE9 2EFFA 2F4C0
* $ ->: stores the text of the other side's E packet for KERRM
KERMERRM!:
        CON(5)  (*)+5                            * 30E6C  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 30E71
        AD0EX                                    * 30E74
        GOLONG  CLOSEUART.L1                     * 30E77

* refs (1): 01976
* Sets the baud rate to 9600 and goes on into UARTSetBaud. Called from #01976
UARTInit:
        P=      0                                * 30E7D
        LC(1)   #6                               * 30E7F

* refs (1): 30EBC
* C low nibble = rate code -> turns the UART and IR off (IOC and IRC 0), writes the rate to BAUD and clears the buffer pointers from #80519. The tail, .L1, also turns the UART on with its receive interrupt
UARTSetBaud:
        D0=(5)  IOC                              * 30E82
        C=0     S                                * 30E89
        DAT0=C  S                                * 30E8C
        D0=(2)  #1A                              * 30E90
        DAT0=C  S                                * 30E94
        D0=(2)  #0D                              * 30E98
        DAT0=C  1                                * 30E9C
        D0=(5)  =IR_16Hz_Clock                   * 30EA0
        C=DAT0  A                                * 30EA7
        D0=C                                     * 30EAA
        D0=(4)  #0519                            * 30EAD
        C=0     W                                * 30EB3
        DAT0=C  10                               * 30EB6
        RTN                                      * 30EBA
SetBaud~1:
        GOSUB   UARTSetBaud                      * 30EBC
        D0=(5)  IOC                              * 30EC0
        P=      0                                * 30EC7
        LC(1)   #B                               * 30EC9
        DAT0=C  1                                * 30ECC
        RTN                                      * 30ED0

* refs (3): 314A8 325FB 81068
OUTUART:
        D0=(5)  ANNCTRL                          * 30ED2
        C=DAT0  B                                * 30ED9
        CBIT=1  5                                * 30EDC
        DAT0=C  B                                * 30EE1
        GOSUB   ChkXmit                          * 30EE4
        RTNC                                     * 30EE8
        GOSUB   IOParityOf                       * 30EEB
        B=A     B                                * 30EEF
        GOSUB   IOTicks                          * 30EF2
        GOSUB   IODeadline                       * 30EF6
        GOSUB   SUB_31085                        * 30EFA
        GONC    OUTUART.loop4                    * 30EFE
OUTUART.loop1:
        GOSUB   UARTTxFull?                      * 30F01
        GOC     OUTUART.loop1                    * 30F05
        GOSUB   UARTIntOff                       * 30F08
        GOSUB   UARTTxFull?                      * 30F0C
        GONC    OUTUART.L2                       * 30F10
        GOSUB   UARTIntOn                        * 30F13
        GOTO    OUTUART.loop1                    * 30F17
OUTUART.L2:
        GOSUB   SUB_31085                        * 30F1B
        GONC    OUTUART.L3                       * 30F1F
        LA(2)   #13                              * 30F22
        GOSUB   ByteParity                       * 30F29
        GOSBVL  SUB_7015D                        * 30F2D
OUTUART.L3:
        GOSUB   UARTIntOn                        * 30F34
OUTUART.loop4:
        D1=(4)  #07F7                            * 30F38
        GOSUB   IOChkATTN                        * 30F3E
        GOSBVL  OnKeyDown?                       * 30F42
        GONC    OUTUART.L5                       * 30F49
        GOTO    IOChkATTN.L1                     * 30F4C
OUTUART.L5:
        GOSUB   UARTTxFull?                      * 30F50
        GOC     OUTUART.loop4                    * 30F54
        GOSUB   SUB_310A5                        * 30F57
        GOC     OUTUART.L7                       * 30F5B
        GOSUB   UARTIntOff                       * 30F5E
        GOSUB   UARTTxFull?                      * 30F62
        GONC    OUTUART.L6                       * 30F66
        GOSUB   UARTIntOn                        * 30F69
        GOTO    OUTUART.loop4                    * 30F6D
OUTUART.L6:
        GOSUB   SUB_310A5                        * 30F71
        GONC    OUTUART.L8                       * 30F75
        GOSUB   UARTIntOn                        * 30F78
OUTUART.L7:
        D=D+1   W                                * 30F7C
        D=D-1   W                                * 30F7F
        GOC     OUTUART.loop4                    * 30F82
        GOSUB   IOTicks                          * 30F85
        P=      12                               * 30F89
        C=C-D   WP                               * 30F8B
        P=      0                                * 30F8E
        GOSBVL  D1=IRAM                          * 30F90
        GOC     OUTUART.loop4                    * 30F97
        LC(5)   timeouterr                       * 30F9A  "Timeout"
        RTNSC                                    * 30FA1
OUTUART.L8:
        D0=(2)  #16                              * 30FA3
        A=B     B                                * 30FA7
        DAT0=A  B                                * 30FAA
        GOSUB   UARTIntOn                        * 30FAD
        RTNCC                                    * 30FB1

* refs (2): 31623 31796
SAVPTR~jump_14:
        GOVLNG  SAVPTR                           * 30FB3
        BSS     8                                * 30FBA  zeros

* refs (1): 324FB
* D1 = ATTNFLG, then on to IOChkATTN
ChkATTN:
        D1=(5)  ATTNFLG                          * 30FC2

* refs (2): 30F3E 311E5
* D1 = ATTNFLG. With no ON press, returns. Otherwise clears the count and leaves the caller as well, with carry set and "Interrupted" in C.A
IOChkATTN:
        C=DAT1  A                                * 30FC9
        ?C=0    A                                * 30FCC
        RTNYES                                   * 30FCF
        C=RSTK                                   * 30FD1
        C=0     A                                * 30FD3
        DAT1=C  A                                * 30FD5
IOChkATTN.L1:
        LC(5)   intrptderr                       * 30FD8  "Interrupted"
        RTNSC                                    * 30FDF

* refs (4): 30F08 30F5E 311E9 312FF
* Saves IOC at #80523 and clears its two interrupt enable bits, so the buffers can be touched safely
UARTIntOff:
        D1=(5)  =IR_16Hz_Clock                   * 30FE1
        C=DAT1  A                                * 30FE8
        D1=C                                     * 30FEB
        D1=(4)  #0523                            * 30FEE
        D0=(5)  IOC                              * 30FF4
        C=DAT0  1                                * 30FFB
        DAT1=C  1                                * 30FFF
        CBIT=0  0                                * 31003
        GOTO    IOAnnOff.L2                      * 31008
        BSS     2                                * 3100C  zeros

* refs (10): 30F13 30F34 30F69 30F78 30FAD 311F4 ...
* Puts back the IOC value saved at #80523
UARTIntOn:
        D1=(5)  =IR_16Hz_Clock                   * 3100E
        C=DAT1  A                                * 31015
        D1=C                                     * 31018
        D1=(4)  #0523                            * 3101B
        D0=(5)  IOC                              * 31021
        C=DAT1  1                                * 31028
UARTIntOn.L1:
        DAT0=C  1                                * 3102C
        RTN                                      * 31030

* refs (2): 30EF6 31263
* C = time now in ticks -> D = time of the timeout. The timeout at #80521 is in tenths of a second: 0 means 10 s, FF means never (D all ones)
IODeadline:
        D=0     W                                * 31032
        P=      12                               * 31035
        D=C     WP                               * 31037
        P=      0                                * 3103A
        D1=(5)  =IR_16Hz_Clock                   * 3103C
        C=DAT1  A                                * 31043
        D1=C                                     * 31046
        D1=(4)  #0521                            * 31049
        C=0     W                                * 3104F
        C=DAT1  B                                * 31052
        ?C=0    B                                * 31055
        GOYES   IODeadline.L1                    * 31058
        C=C+1   B                                * 3105A
        C=C-1   B                                * 3105D
        GONC    IODeadline.L2                    * 31060
        D=0     W                                * 31063
        D=D-1   W                                * 31066
        RTNCC                                    * 31069
IODeadline.L1:
        LC(2)   #64                              * 3106B
IODeadline.L2:
        A=C     W                                * 3106F
        C=C+C   A                                * 31072
        C=C+A   A                                * 31074
        D=D+C   W                                * 31076
        CSL     A                                * 31079
        D=D+C   W                                * 3107B
        CSL     A                                * 3107E
        D=D+C   W                                * 31080
        RTNCC                                    * 31083

* refs (2): 30EFA 30F1B
* Probably: carry set when XON/XOFF applies: bit 3 of the nibble at #8051F
SUB_31085:
        D1=(5)  =IR_16Hz_Clock                   * 31085
        C=DAT1  A                                * 3108C
        D1=C                                     * 3108F
        D1=(4)  #051F                            * 31092
        C=DAT1  1                                * 31098
        ?CBIT=1 3                                * 3109C
        RTNYES                                   * 310A1
        RTNCC                                    * 310A3

* refs (2): 30F57 30F71
* Probably: carry set when both high bits of the nibble at #8051E are set: a handshake setting
SUB_310A5:
        D1=(5)  =IR_16Hz_Clock                   * 310A5
        C=DAT1  A                                * 310AC
        D1=C                                     * 310AF
        D1=(4)  #051E                            * 310B2
        A=DAT1  1                                * 310B8
        LC(1)   #C                               * 310BC
        A=A&C   P                                * 310BF
        ?C=A    P                                * 310C3
        RTNYES                                   * 310C6
        RTNCC                                    * 310C8

* refs (6): 30F01 30F0C 30F50 30F62 312F8 31303
* Carry set while bit 0 of TCS (#00112) is set: the transmit buffer is full
UARTTxFull?:
        D0=(5)  NOP1MASK18                       * 310CA
        A=DAT0  1                                * 310D1
        ?ABIT=1 0                                * 310D5
        RTNYES                                   * 310DA
        RTN                                      * 310DC

* refs (6): 30EF2 30F85 3125F 31270 317B0 317C3
* -> C = current time in ticks of 1/8192 s, from the RAM clock and TIMER2, without disturbing the timer
IOTicks:
        SETHEX                                   * 310DE
        D1=(5)  TIMER2CTRL                       * 310E0
        A=DAT1  S                                * 310E7
        C=0     S                                * 310EB
        C=C+1   S                                * 310EE
        DAT1=C  S                                * 310F1
        P=      7                                * 310F5
        D1=(2)  #38                              * 310F7
        C=DAT1  8                                * 310FB
        A=C     P                                * 310FF
        A=A+A   P                                * 31102
        P=      12                               * 31105
        A=0     WP                               * 31107
        GONC    IOTicks.L1                       * 3110A
        A=A-1   WP                               * 3110D
IOTicks.L1:
        P=      7                                * 31110
        A=C     WP                               * 31112
        D1=(2)  #1B                              * 31115
        C=DAT1  A                                * 31119
        D1=C                                     * 3111C
        D1=(4)  #0058                            * 3111F
        C=DAT1  13                               * 31125
        P=      12                               * 31129
        C=C-A   WP                               * 3112B
        P=      0                                * 3112E
        D1=(5)  TIMER2CTRL                       * 31130
        DAT1=A  S                                * 31137
        RTNCC                                    * 3113B

* refs (2): 30EEB 31211
* A.B = byte -> A.B with its parity bit set per the setting at #80520. Sets D1 first
IOParityOf:
        P=      0                                * 3113D
        D1=(5)  =IR_16Hz_Clock                   * 3113F
        C=DAT1  A                                * 31146
        D1=C                                     * 31149

* refs (4): 005C3 30F29 31318 70156
* D1 = page of the I/O settings (#80500), A.B = byte -> bit 7 of A.B set for the parity type at #80520. Uses a table of nibble parities. Also used at boot
ByteParity:
        D1=(4)  #0520                            * 3114C
        C=DAT1  S                                * 31152
        C=C+C   S                                * 31156
        RTNNC                                    * 31159
        ABIT=0  7                                * 3115C
        C=C+C   S                                * 31161
        C=C+C   S                                * 31164
        GOC     ByteParity.L1                    * 31167
        A=C     S                                * 3116A
        C=A     B                                * 3116D
        P=C     0                                * 31170
        LC(16)  #0880800880080880                * 31174
        A=A+C   S                                * 31186
        C=A     B                                * 31189
        P=C     1                                * 3118C
        LC(16)  #0880800880080880                * 31190
        C=C+A   S                                * 311A2
        P=      0                                * 311A5
ByteParity.L1:
        CSLC                                     * 311A7
        CSL     B                                * 311AA
        A=A!C   B                                * 311AD
        RTNCC                                    * 311B1

* refs (3): 30EE4 312F1 31614
ChkXmit:
        P=      0                                * 311B3
        D0=(5)  IOC                              * 311B5
        C=DAT0  XS                               * 311BC
        C=C+C   XS                               * 311C0
        GONC    ChkXmit.L1                       * 311C3
        RTNCC                                    * 311C6
ChkXmit.L1:
        LC(5)   #00C09                           * 311C8
        RTNSC                                    * 311CF

* refs (4): 2E2FF 2E33F 2E38A 3152C
* Takes a byte from the receive buffer -> A.B; carry set and an error number in D1 on failure. ON gives "Interrupted"; a parity mismatch gives #C05
IOGetByte:
        D=0     W                                * 311D1
IOGetByte.L1:
        P=      0                                * 311D4
        SETHEX                                   * 311D6
        GOSBVL  D1=IRAM                          * 311D8
        D1=(4)  #07F7                            * 311DF
        GOSUB   IOChkATTN                        * 311E5
        GOSUB   UARTIntOff                       * 311E9
        GOSUB   POPUART                          * 311ED
        GOC     IOGetByte.L3                     * 311F1
        GOSUB   UARTIntOn                        * 311F4
        D1=(4)  #0520                            * 311F8
        C=DAT1  XS                               * 311FE
        C=C+C   XS                               * 31202
        RTNNC                                    * 31205
        C=C+C   XS                               * 31208
        GONC    IOGetByte.L2                     * 3120B
        B=A     B                                * 3120E
        GOSUB   IOParityOf                       * 31211
        D1=(5)  #00C05                           * 31215  I/O error number #C05, returned in D1
        ?A#B    B                                * 3121C
        GOYES   IORecvErr.loop1                  * 3121F
IOGetByte.L2:
        ABIT=0  7                                * 31221
        RTNCC                                    * 31226
IOGetByte.L3:
        ?A=0    XS                               * 31228
        GOYES   IORecvErr.L2                     * 3122B
        C=A     A                                * 3122D
        C=0     XS                               * 3122F
        DAT1=C  A                                * 31232
        GOSUB   UARTIntOn                        * 31235

* refs (1): 32127
* D1 = the number of a receive error: #C04 "Receive Buffer Overrun" when the overrun bit is set in A, else #C03 "Receive Error"
IORecvErr:
        D1=(5)  #00C04                           * 31239  I/O error number #C04, returned in D1
        A=A+A   XS                               * 31240
        GOC     IORecvErr.loop1                  * 31243
        D1=(5)  #00C03                           * 31246  I/O error number #C03, returned in D1
IORecvErr.loop1:
        CD1EX                                    * 3124D
        RTNSC                                    * 31250
IORecvErr.L2:
        GOSUB   UARTIntOn                        * 31252
        GOSUB   SUB_312D8                        * 31256
        ?D#0    W                                * 3125A
        GOYES   IORecvErr.L3                     * 3125D
        GOSUB   IOTicks                          * 3125F
        GOSUB   IODeadline                       * 31263
IORecvErr.L3:
        D=D+1   W                                * 31267
        D=D-1   W                                * 3126A
        GOC     IORecvErr.L4                     * 3126D
        GOSUB   IOTicks                          * 31270
        D1=(5)  KeyBitCodes.L2                   * 31274
        P=      12                               * 3127B
        C=C-D   WP                               * 3127D
        P=      0                                * 31280
        GONC    IORecvErr.loop1                  * 31282
IORecvErr.L4:
        GOTO    IOGetByte.L1                     * 31285

* refs (2): 311ED 81076
POPUART:
        D1=(5)  =IR_16Hz_Clock                   * 31289
        A=DAT1  A                                * 31290
        D1=A                                     * 31293
        D1=(4)  #0519                            * 31296
        A=DAT1  A                                * 3129C
        ?A=0    B                                * 3129F
        RTNYES                                   * 312A2
        A=A+1   M                                * 312A4
        A=A-1   B                                * 312A7
        DAT1=A  A                                * 312AA
        A=A-1   M                                * 312AD
        ASR     A                                * 312B0
        ASR     A                                * 312B2
        ASR     A                                * 312B4
        A=A+A   A                                * 312B6
        D1=(4)  #0319                            * 312B8
        CD1EX                                    * 312BE
        C=C+A   A                                * 312C1
        CD1EX                                    * 312C3
        A=DAT1  B                                * 312C6
        RTNCC                                    * 312C9

* refs (1): 31378
SUB_312CB:
        D1=(5)  uart_buf_end                     * 312CB
        A=0     A                                * 312D2
        DAT1=A  X                                * 312D4

* refs (2): 31256 3151D
SUB_312D8:
        P=      0                                * 312D8

adr_uart_han:
        D1=(5)  uart_handshk                     * 312DA
        A=DAT1  1                                * 312E1
        LC(1)   #3                               * 312E5
        A=A&C   P                                * 312E8
        ?C#A    P                                * 312EC
        RTNYES                                   * 312EF
        GOSUB   ChkXmit                          * 312F1
        RTNC                                     * 312F5
adr_uart_han.loop1:
        GOSUB   UARTTxFull?                      * 312F8
        GOC     adr_uart_han.loop1               * 312FC
        GOSUB   UARTIntOff                       * 312FF
        GOSUB   UARTTxFull?                      * 31303
        GONC    adr_uart_han.L2                  * 31307
        GOSUB   UARTIntOn                        * 3130A
        GOC     adr_uart_han.loop1               * 3130E
adr_uart_han.L2:
        LA(2)   #11                              * 31311
        GOSUB   ByteParity                       * 31318
        D0=(2)  #16                              * 3131C
        DAT0=A  B                                * 31320
        D1=(4)  #051E                            * 31323
        A=DAT1  B                                * 31329
        LC(2)   #7E                              * 3132C
        A=A&C   B                                * 31330
        DAT1=A  B                                * 31334
        GOTO    UARTIntOn                        * 31337

* refs (1): 2EDE6
UARTBUFLEN:
        CON(5)  (*)+5                            * 3133B  primitive code object
        GOSBVL  SAVPTR                           * 31340
        D1=(5)  uart_buf_end                     * 31347
        A=0     A                                * 3134E
        C=0     A                                * 31350
        C=C+1   A                                * 31352
        A=DAT1  X                                * 31354
        ?A=0    XS                               * 31358
        GOYES   UARTBUFLEN.L1                    * 3135B
        GOSUBL  SUB_32120                        * 3135D
UARTBUFLEN.L1:
        GOVLNG  PushAC<>®                        * 31363
        BSS     2                                * 3136A  zeros

* refs (5): 17FF7 2E46E 30E49 315EF 4214A
FLUSHRSBUF:
        CON(5)  (*)+5                            * 3136C  primitive code object
        GOSBVL  SAVPTR                           * 31371
        GOSUB   SUB_312CB                        * 31378
FLUSHRSBUF.L1:
        GOVLNG  GETPTRLOOP                       * 3137C
FLUSHRSBUF.L2:
        D0=(5)  IRC                              * 31383
        C=DAT0  B                                * 3138A
        ?CBIT=0 2                                * 3138D
        RTNYES                                   * 31392
        D0=(2)  #10                              * 31394
        A=DAT0  1                                * 31398
        C=0     A                                * 3139C
        CBIT=1  3                                * 3139E
        C=C&A   B                                * 313A3
        DAT0=C  1                                * 313A7
        GOSBVL  D0=IRAM                          * 313AB
        D0=(4)  #0927                            * 313B2
        DAT0=A  1                                * 313B8
        RTN                                      * 313BC
        BSS     4                                * 313BE  zeros

* refs (4): 3147B 314BA 317DE 32B25
* Ends a transfer: if IR is on, waits for the transmitter to empty and restores the IRC settings; then turns the I/O annunciator off
IOAnnOff:
        D0=(5)  IRC                              * 313C2
        C=DAT0  B                                * 313C9
        ?CBIT=0 2                                * 313CC
        GOYES   IOAnnOff.L1                      * 313D1
        GOSBVL  D0=IRAM                          * 313D3
        D0=(4)  #0927                            * 313DA
        A=DAT0  1                                * 313E0
        GOSUB   WaitTbz0                         * 313E4
        D0=D0+  2                                * 313E8
        C=DAT0  B                                * 313EB
        D0=D0-  1                                * 313EE
        DAT0=C  1                                * 313F1
        D0=D0-  3                                * 313F5
        DAT0=A  1                                * 313F8
IOAnnOff.L1:
        D0=(2)  #0B                              * 313FC
        C=DAT0  B                                * 31400
        CBIT=0  5                                * 31403
        DAT0=C  B                                * 31408
        RTN                                      * 3140B
IOAnnOff.L2:
        CBIT=0  1                                * 3140D
        GOTO    UARTIntOn.L1                     * 31412

* refs (4): 313E4 315F9 3179A D4588
WaitTbz0:
        D0=(5)  NOP1MASK18                       * 31416
        LC(5)   #02400                           * 3141D
WaitTbz0.loop1:
        C=DAT0  1                                * 31424
        ?CBIT=0 1                                * 31428
        GOYES   WaitTbz0.L2                      * 3142D
        C=0     P                                * 3142F
        C=C-1   A                                * 31432
        GONC    WaitTbz0.loop1                   * 31434
WaitTbz0.L2:
        C=0     A                                * 31437
        LC(2)   #4A                              * 31439
WaitTbz0.loop3:
        C=C-1   A                                * 3143D
        GONC    WaitTbz0.loop3                   * 3143F
        RTN                                      * 31442
        RPL

* refs (2): 2EE7E 30E4E
PUTSERIAL:
        ::                                       * 31444
          CODE                                   * 31449  121 nibbles
            GOSBVL  SAVPTR                       * 31453
            GOSUB   FLUSHRSBUF.L2                * 3145A
            GOSUBL  GetStrLenStk                 * 3145E
            C=0     S                            * 31464
            R0=C                                 * 31467
            R1=C                                 * 3146A
            CD1EX                                * 3146D
            R2=C                                 * 31470
PUTSERIAL.loop1:
            C=R0                                 * 31473
            C=C-1   A                            * 31476
            GONC    PUTSERIAL.L2                 * 31478
            GOSUB   IOAnnOff                     * 3147B
            GOVLNG  GPPushTLoop                  * 3147F
PUTSERIAL.L2:
            C=C-1   S                            * 31486
            R0=C                                 * 31489
            GONC    PUTSERIAL.L3                 * 3148C
            GOSUBL  PUTSERIAL~1                  * 3148F
            GOC     PUTSERIAL.L4                 * 31495
PUTSERIAL.L3:
            C=R2                                 * 31498
            D0=C                                 * 3149B
            A=DAT0  B                            * 3149E
            C=C+1   A                            * 314A1
            C=C+1   A                            * 314A3
            R2=C                                 * 314A5
            GOSUB   OUTUART                      * 314A8
            GONC    PUTSERIAL.loop1              * 314AC
PUTSERIAL.L4:
            CR1EX                                * 314AF
            A=R0                                 * 314B2
            C=C-A   A                            * 314B5
            R0=C                                 * 314B7
            GOSUB   IOAnnOff                     * 314BA
            GOSBVL  PUSH2#                       * 314BE
            GOVLNG  PushFLoop                    * 314C5
          ENDCODE                                * 314CC
          casedrptru 3UNROLL                     * 314CC
          LAST$ swap;false ;                     * 314D6

* refs (1): 2EEAB
GETSERIAL:
        CON(5)  (*)+5                            * 314E5  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 314EA
        GOSBVL  POP#                             * 314F1
        R1=A                                     * 314F8
        C=A     A                                * 314FB
        GOSBVL  MAKE$                            * 314FD
        CD0EX                                    * 31504
        R2=C                                     * 31507
GETSERIAL.loop1:
        D1=(5)  uart_buf_end                     * 3150A
        A=DAT1  B                                * 31511
        LC(2)   #18                              * 31514
        ?C<A    B                                * 31518
        GOYES   GETSERIAL.L2                     * 3151B
        GOSUB   SUB_312D8                        * 3151D
GETSERIAL.L2:
        C=R1                                     * 31521
        C=C-1   A                                * 31524
        R1=C                                     * 31526
        GOC     GETSERIAL.L3                     * 31529
        GOSUB   IOGetByte                        * 3152C
        GOC     GETSERIAL.L4                     * 31530
        C=R2                                     * 31533
        D1=C                                     * 31536
        DAT1=A  B                                * 31539
        D1=D1+  2                                * 3153C
        CD1EX                                    * 3153F
        R2=C                                     * 31542
        GONC    GETSERIAL.loop1                  * 31545
GETSERIAL.L3:
        A=R0                                     * 31548
        GOVLNG  NTHELCOMP.loop3                  * 3154B
GETSERIAL.L4:
        CR2EX                                    * 31552
        D0=C                                     * 31555
        GOSBVL  Shrink$                          * 31558
        A=R0                                     * 3155F
        C=R2                                     * 31562
        R0=C                                     * 31565
        GOSBVL  GETPTR                           * 31568
        DAT1=A  A                                * 3156F
        GOVLNG  Push#FLoop                       * 31572

* refs (1): 2EE09
StimeSRecv(s):
        CON(5)  (*)+5                            * 31579  primitive code object
        LC(5)   XmitSrcvTOut                     * 3157E
        GOTO    StimeXmit(s).L1                  * 31585

* refs (2): 2E2D7 2EE0E
StimeXmit(s):
        CON(5)  (*)+5                            * 31589  primitive code object
        LC(5)   uart_timeout                     * 3158E
StimeXmit(s).L1:
        RSTK=C                                   * 31595
        GOSBVL  POP#                             * 31597
        C=0     A                                * 3159E
        C=C-1   B                                * 315A0
        ?A=0    A                                * 315A3
        GOYES   StimeXmit(s).L2                  * 315A6
        C=C-1   A                                * 315A8
        ?C>=A   A                                * 315AA
        GOYES   StimeXmit(s).L3                  * 315AD
StimeXmit(s).L2:
        A=C     A                                * 315AF
StimeXmit(s).L3:
        C=RSTK                                   * 315B1
        CD1EX                                    * 315B3
        DAT1=A  B                                * 315B6
        D1=C                                     * 315B9
CLOSEUART~1:
        A=DAT0  A                                * 315BC
        D0=D0+  5                                * 315BF
        PC=(A)                                   * 315C2
        RPL

* ->
* refs (2): 21EDF 2D35E
CLOSEUART:
        ::                                       * 315C6
          CODE                                   * 315CB  26 nibbles
            AD0EX                                * 315D5
            GOSUB   CloseUart                    * 315D8
            C=0     A                            * 315DC
CLOSEUART.L1:
            D0=(5)  KERMERRM                     * 315DE
            DAT0=C  A                            * 315E5
            D0=A                                 * 315E8
            GOTO    CLOSEUART~1                  * 315EB
          ENDCODE                                * 315EF
          FLUSHRSBUF ;                           * 315EF
        ASSEMBLE

* refs (2): 315D8 324BF
CloseUart:
        GOSUB   WaitTbz0                         * 315F9
        D0=D0-  2                                * 315FD
        C=0     A                                * 31600
        DAT0=C  1                                * 31602
        RTNCC                                    * 31606

* refs (1): 2EC07
OpenUart?Clr:
        CON(5)  (*)+5                            * 31608  primitive code object
        GOSBVL  SAVPTR                           * 3160D
        GOSUB   ChkXmit                          * 31614
        GOC     OpenUartClr.L1                   * 31618
        GONC    OpenUartClr.L2                   * 3161B

* refs (1): 2EB2D
OpenUartClr:
        CON(5)  (*)+5                            * 3161E  primitive code object
        GOSUB   SAVPTR~jump_14                   * 31623
OpenUartClr.L1:
        D0=(5)  IOC                              * 31627
        C=0     W                                * 3162E
        LC(1)   #B                               * 31631
        DAT0=C  4                                * 31634
        D0=(5)  uart_buf_end                     * 31638
        C=0     A                                * 3163F
        DAT0=C  8                                * 31641
OpenUartClr.L2:
        B=0     A                                * 31645
        GOSBVL  popflag                          * 31647
        GONC    OpenUartClr.L3                   * 3164E
        LC(1)   #8                               * 31651
        B=B+C   A                                * 31654
OpenUartClr.L3:
        GOSBVL  popflag                          * 31656
        GONC    OpenUartClr.L4                   * 3165D
        B=B+1   A                                * 31660
        B=B+1   A                                * 31662
OpenUartClr.L4:
        GOSBVL  POP2#                            * 31664
        CAEX    A                                * 3166B
        D=C     A                                * 3166D
        GOSUB   SUB_31692                        * 3166F
        GONC    OpenUartClr.L5                   * 31673
        LC(5)   portnotaverr                     * 31676  "Port Not Available"
        GOVLNG  GPErrjmpC                        * 3167D
OpenUartClr.L5:
        GOSBVL  GETPTR                           * 31684
        GOVLNG  4DropLoop                        * 3168B

* refs (2): 3166F 3233A
SUB_31692:
        GOSBVL  D0=IRAM                          * 31692
        D0=(4)  #084B                            * 31699
        C=DAT0  B                                * 3169F
        ST=C                                     * 316A2
        D0=(4)  #0802                            * 316A4
        C=DAT0  B                                * 316AA
        ?CBIT=1 1                                * 316AD
        RTNYES                                   * 316B2
        D0=(4)  #091C                            * 316B4
        C=DAT0  B                                * 316BA
        D0=(4)  #0521                            * 316BD
        DAT0=C  B                                * 316C3
        D0=D0-  1                                * 316C6
        C=0     A                                * 316C9
        ?A=0    A                                * 316CB
        GOYES   SUB_31692.L1                     * 316CE
        A=A-1   A                                * 316D0
        ABIT=1  3                                * 316D2
        C=A     A                                * 316D7
        CBIT=0  0                                * 316D9
        ?ABIT=1 0                                * 316DE
        GOYES   SUB_31692.L1                     * 316E3
        C=C+1   A                                * 316E5
SUB_31692.L1:
        DAT0=C  P                                * 316E7
        D0=D0-  2                                * 316EB
        A=DAT0  1                                * 316EE
        LC(1)   #5                               * 316F2
        A=A&C   P                                * 316F5
        A=A!B   P                                * 316F9
        ?ST=0   0                                * 316FD
        GOYES   SUB_31692.L2                     * 31700
        A=0     A                                * 31702
SUB_31692.L2:
        DAT0=A  1                                * 31704
        D0=(4)  #0924                            * 31708
        A=DAT0  A                                * 3170E
        ABIT=0  7                                * 31711
        C=0     A                                * 31716
        ?ST=0   0                                * 31718
        GOYES   SUB_31692.L3                     * 3171B
        LC(1)   #4                               * 3171D
        GONC    SUB_31692.L4                     * 31720
SUB_31692.L3:
        ?ST=0   1                                * 31723
        GOYES   SUB_31692.L5                     * 31726
SUB_31692.L4:
        ABIT=1  11                               * 31728
SUB_31692.L5:
        DAT0=A  A                                * 3172D
        D1=(5)  IRC                              * 31730
        DAT1=C  1                                * 31737
        C=0     W                                * 3173B
        LC(4)   #12C0                            * 3173E
        P=      2                                * 31744
        ?ST=1   0                                * 31746
        GOYES   SUB_31692.L7                     * 31749
        P=      5                                * 3174B
SUB_31692.loop6:
        P=P-1                                    * 3174D
        ?D=C    A                                * 3174F
        GOYES   SUB_31692.L7                     * 31752
        CSRB                                     * 31754
        P=P-1                                    * 31757
        GONC    SUB_31692.loop6                  * 31759
        P=      6                                * 3175C
SUB_31692.L7:
        C=0     A                                * 3175E
        CPEX    2                                * 31760
        D0=(5)  NOP1MASK13                       * 31764
        A=DAT0  XS                               * 3176B
        ABIT=0  11                               * 3176F
        D1=(5)  IOC                              * 31774
        ?C=A    XS                               * 3177B
        GOYES   SUB_31692.L8                     * 3177E
        DAT1=C  1                                * 31780
        DAT0=C  XS                               * 31784
SUB_31692.L8:
        LC(1)   #B                               * 31788
        DAT1=C  1                                * 3178B
        RTNCC                                    * 3178F

* refs (1): 2EE22
DOSBRK~1:
        CON(5)  (*)+5                            * 31791  primitive code object
        GOSUB   SAVPTR~jump_14                   * 31796
        GOSUB   WaitTbz0                         * 3179A
        GOSUB   FLUSHRSBUF.L2                    * 3179E
        D1=(5)  NOP1MASK18                       * 317A2
        LC(1)   #8                               * 317A9
        DAT1=C  P                                * 317AC
        GOSUB   IOTicks                          * 317B0
        D=C     W                                * 317B4
        C=0     W                                * 317B7
        LC(4)   #099A                            * 317BA
        D=D+C   W                                * 317C0
DOSBRK~1.loop1:
        GOSUB   IOTicks                          * 317C3
        P=      12                               * 317C7
        C=C-D   WP                               * 317C9
        P=      0                                * 317CC
        GOC     DOSBRK~1.loop1                   * 317CE
        D1=(5)  NOP1MASK18                       * 317D1
        C=0     A                                * 317D8
        DAT1=C  1                                * 317DA
        GOSUB   IOAnnOff                         * 317DE
        GOTO    FLUSHRSBUF.L1                    * 317E2
        RPL

* refs (4): 318C7 31976 319A3 319E4
* -> #: characters per print line: 24 over IR, PRTPAR's line length on the wire (flag -34)
PrintWidth:
        :: BINT34 TestSysFlag NOTcase BINT24     * 317E6  flag -34: Print via IR / Print via wire
          GetChkPRTPAR ROTROT2DROP ;             * 317FF

* refs (3): 318A9 31903 31A2A
* Selects ECMA-94; with an empty stack prints "Empty Stack" and leaves the caller. For PRST and PRSTC
?PrintEmpty:
        :: SetEcma94 DEPTH #0<> ?SEMI            * 3180E

* refs (2): 2D93D 43676
MessageC15:
          :: # C15 JstGetTHEMESG ; PRINT docr RDROP ; * 31827  "Empty Stack"

* refs (6): 1EF0F 31845 318E0 31921 31A9D 31DA1
docr:
        :: NULL$ PrintRC(st) ;                   * 31854

* ->
* refs (2): 1EEAE B83AA
DOCR:
        :: BINT34 TestSysFlag IT                 * 31868  flag -34: Print via IR / Print via wire

* refs (1): 32596
OpenIOPrt:
          :: OpenIO OpenIO_324C8 ;               * 3187C
          NULL$ FALSE PrintNoRC?(st,?) ;         * 31890

* refs (1): 1EE78
prstc:
        :: ?PrintEmpty DEPTH ZERO_DO ?ATTNQUIT ISTOP-INDEX DUP#1+PICK * 318A4
          PrintWidth #3- DoSt:(s,_,s) PRINT LOOP docr ; * 318C7

* refs (1): 31930
dup;print!(st):
        :: DUP PRINT ;                           * 318EA

* refs (2): 1EE5D B83AF
pr1:
        :: ?PrintEmpty DUPTYPECSTR? OVER NULL$? AND case docr * 318FE
          CK&DISPATCH1                           * 31926
          BINT3 dup;print!(st)                   * 3192B  string
          BINT12 PrintGrob                       * 31935  grob
          BINT0 OBJ_3194E                        * 3193F  any
        ;                                        * 31949

* refs (2): 31944 31D92
OBJ_3194E:
        :: BINT0                                 * 3194E

* refs (1): 31A89
prst~1:
          :: OVER dup;#nm? NOTcase               * 31958

* refs (1): 31999
OBJ_3196C:
            :: SWAPDROP PrintWidth #3- !DcompWidth 1stkdecomp$w PRINT ; * 3196C
            dup;r?:dq/sk OBJ_3196C NULL{} PrintWidth 4ROLL #- ERRSET * 31994
            :: BEGIN ?ATTNQUIT SetISF803 DclLine# SWAP PRINT OVERSWAP * 319B7
              DUPNULLCOMP? PrintWidth SWAP UNTIL ; * 319DF
            ERRTRAP                              * 319F8
            :: ClrISF803 ERRJMP ; ClrISF803 3DROP ; * 319FD
        ;                                        * 31A20

* refs (1): 1EE93
prst:
        :: ?PrintEmpty DEPTH ZERO_DO ISTOP-INDEX PICK ISTOP-INDEX #:>$ * 31A25
          DUPLEN$ SWAP PRINTxNLF OVER TYPEGROB? ITE * 31A4D
          :: DROP ->str1(go) PRINT ;             * 31A6B
          :: prst~1 DROP ;                       * 31A84
          LOOP docr ;                            * 31A98

* refs (2): 31B6F 31B92
* Sets or clears flag -64 from the saved local IWrap
IWrap!:
        :: BINT64 Π'IWrap case SetSysFlag        * 31AA7
          ClrSysFlag ;                           * 31AC0

* refs (1): 16A86
* Probably: the next print line while printing an array, called by the decompiler
DclLine19~1:
        :: ?ATTNQUIT DUPNULLCOMP? BINT34 TestSysFlag case * 31ACA  flag -34: Print via IR / Print via wire
          :: IT                                  * 31AE8
            :: SWAP PrArrayHead SWAP ;           * 31AF2
            DcompWidth@ ClrISF803 DclLine# ;     * 31B0B
          IT BindIWrap                           * 31B1F
          DUP INNER#1= ?SKIP SWAPDROP            * 31B29
          COERCE #>$ tok] &$ APPEND_SPACE 3UNROLL ERRSET geti(cp,lr) ERRTRAP * 31B3D
          :: IWrap! ERRJMP ; ROTDROP BINT64 TestSysFlag SWAP IWrap! * 31B6A
          PrRowText 4ROLL !insert$ 3UNROLL casedrop * 31B97
          :: NEWLINE$&$ NULL{} ABND ;            * 31BB0
          DUP INNER#1= caseDROP %1               * 31BC9
          EQ NOTcaseDROP COERCE                  * 31BDD
          #>$                                    * 31BEC

* refs (1): 31C90
* $ ... -> $': puts "Row " and the row number in front of a printed array row
PrRow$:
          # C16 JstGetTHEMESG !insert$ ROT NEWLINE$&$ NEWLINE$&$ SWAP &$SWAP ; * 31BF1  "Row "

* refs (1): 31B24
* Saves flag -64 in the local IWrap, because GETI changes it when walking an array
BindIWrap:
        :: BINT64 TestSysFlag                    * 31C23

{Π'IWrap}:
          {                                      * 31C32

* refs (1): 31AB1
Π'IWrap:
            LAM 'IWrap }                         * 31C37
          BIND DROP                              * 31C4F

* refs (1): 31AFC
* [] -> []: prints "Array" and the dimensions
PrArrayHead:
          :: # 127 JstGetTHEMESG APPEND_SPACE OVER size(ar) EDITDECOMP$ &$ * 31C59  "Array"
            PrintRC(st) ;                        * 31C86
          PrRow$ JstGetTHEMESG tok1 &$ PrintRC(st) * 31C90

{1}:
          { %1 } %1 3PICK Vector? caseDROP >TCOMP * 31CA9
        ;                                        * 31CD1

* refs (1): 31B97
* [] -> $: the text of an array row, wrapped to print width
PrRowText:
        :: dup;r?:dq/sk a%>$ DUP NULL{} DclCmp BEGIN DUPNULLCOMP? NOT_WHILE * 31CD6
          :: SWAP NEWLINE$&$ SWAP 3PICKSWAP DclCmp 3UNROLL $ "    " !insert$ * 31D03
            &$SWAP ;                             * 31D3D
          REPEAT DROPSWAPDROP ;                  * 31D47

* refs (2): 1EECE 1EED8
prvar(nm):
        :: DUPSAFE@ ?SKIP SETNONEXTERR           * 31D56
          SetEcma94 SWAP ID>$ PRINT              * 31D6A

* refs (2): 1EF05 1EF0A
xPRVAR~1:
          :: DUPTYPEGROB? ITE PrintGrob OBJ_3194E * 31D7E
            DROP ;                               * 31D97
          docr ;                                 * 31DA1

* refs (1): 1EE42
oldprt:
        :: ChkPRTPAR DUPROLL DROP                * 31DAB

_chr(128)_:
          $ "\A0\7F\7F√∫Σ▶π∂≤≥≠α→←v^\7F\7F\7F\7F\7F\7F\7F\7F\7F\7F\7F\7F\7Fü\7F ¸¿¯º¼|½«cùδ~-R°³þρσ¨↓ôò,1úε÷øõ¹¡à¢áØÐÓ´£Ü¤¥æå¦§ã¶èçßéÚ∇Ò\ADí®Û±ðÞÈÄÀâÌÔ×µÉÅÁÍÙÕÑÝä·ÊÆÂêÎāÖËÇÃÏ²ñï" * 31DBF
          OVER UNROLL {}N StoPRTPAR ;            * 31EC9

* refs (2): 1EF6D AFDC4
DOPRLCD:
        :: SetEcma94 GetChkPRTPAR 3DROP BINT0    * 31EE2
          CODE                                   * 31EFB  54 nibbles
            GOSBVL  SAVPTR                       * 31F05
            GOSUBL  ChkGrHook                    * 31F0C
            ST=1    10                           * 31F12
            GOSBVL  DisableIntr                  * 31F15
            GOSBVL  DOPRLCD~1                    * 31F1C
            GOSBVL  AllowIntr                    * 31F23
            GOC     DOPRLCD.L1                   * 31F2A
            GOVLNG  GETPTRLOOP                   * 31F2D
DOPRLCD.L1:
            GOVLNG  GPErrjmpC                    * 31F34
          ENDCODE                                * 31F3B
          DROP ;                                 * 31F3B

* refs (5): 31FD5 B8B7D B8B8C B8BAF B8BC3
Reset&BreakPRTPAR:
        ::                                       * 31F45

* refs (1): C752B
StdPRTPAR:
          {                                      * 31F4A

* refs (2): B01C5 B82DA
%1.8:
            % 1.8E0 NULL$ %80 CRLF$ }            * 31F4F
          DUP                                    * 31F78

* refs (4): 31ED8 32048 B8387 C7530
StoPRTPAR:
          :: '                                   * 31F7D

PRTPAR:
            ID PRTPAR SysSTO ;                   * 31F87
          INNERCOMP ;                            * 31FA4

* refs (4): 31DB0 32025 32061 4A51D
ChkPRTPAR:
        :: '                                     * 31FAE

PRTPAR_31FB8:
          ID PRTPAR Sys@ NOTcase Reset&BreakPRTPAR * 31FB8
          DUPTYPELIST? ChkPRTPAR~1 INNERDUP BINT3 #> ChkPRTPAR~1 ; * 31FDA

* % ->
* refs (2): 1EF52 B8293
DODELAY:
        :: %ABS DUP %10* COERCE BINT70 #> caseSIZEERR ChkPRTPAR * 31FFD
          get1 OVER #2+ROLL DROPOVER #1+UNROLL {}N StoPRTPAR GetChkPRTPAR * 3202A
          3DROP ;                                * 32052

* refs (7): 317FF 31EEC 3204D 32193 32288 32391 ...
GetChkPRTPAR:
        :: ChkPRTPAR #4- NDROP DUPTYPECSTR?      * 3205C
* The Very Big List names this address dropn(s-4), but it is a pointer inside an object; the name is not used
          3PICK TYPEREAL? AND 4PICK TYPECSTR? AND 5PICK TYPEREAL? AND GOTO * 32075
          ChkPRTPAR~1 NOP                        * 320A7

* 80
* refs (4): 31F69 B0395 B82C6 B834F
%80:
          % 8E1                                  * 320B1

* refs (5): 31FDF 31FF3 320A7 320F3 32111
ChkPRTPAR~1:
          :: ?SEMI                               * 320C6
            # C13 ERROROUT ;                     * 320D0  "Invalid PRTPAR"
          4UNROLL COERCEDUP #0<> ChkPRTPAR~1 ROT %10* COERCEDUP BINT70 #< * 320E4
          ChkPRTPAR~1 GetChkPRTPAR~1 ;           * 32111
        ASSEMBLE

* refs (1): 3135D
SUB_32120:
        D1=D1+  2                                * 32120
        DAT1=C  XS                               * 32123
        GOSUBL  IORecvErr                        * 32127
        D1=(5)  LASTERROR                        * 3212D
        DAT1=C  A                                * 32134
        C=0     A                                * 32137
        A=0     XS                               * 32139
        RTN                                      * 3213C

* refs (1): 3148F
PUTSERIAL~1:
        ST=0    15                               * 3213E
        GOSUB   ChkLowBat                        * 32141
        GOLONG  AllowIntr~jump_2                 * 32145

* refs (1): 32A5A
SUB_3214B:
        CBIT=0  7                                * 3214B
        DAT0=C  A                                * 32150
        GOSUB   PrintWire?                       * 32153
        RTNNC                                    * 32157
        A=0     A                                * 3215A
        GOTO    PrintRC(st)~1.L1                 * 3215C
        BSS     1                                * 32160  zeros
        RPL

* refs (12): 31840 318D6 318F4 3198A 319D5 31A7A ...
PRINT:
        :: BINT34 TestSysFlag NOTcase PrintRC(st) * 32161  flag -34: Print via IR / Print via wire
          KVIS BINT38 TestSysFlag                * 3217A  flag -38: Add linefeeds / No linefeeds
* The Very Big List names this address PopBufA, but it is a pointer inside an object; the name is not used
          case PrintRC(st)                       * 32189
          GetChkPRTPAR 4UNROLL 2DROP BEGIN ?ATTNQUIT DUP NEWLINE$ XEQPOS$ * 32193
          COERCE DUP#0=ITE PrintFirst# PRINT~1 DUPNULL$? UNTIL 2DROP ; * 321BB

* refs (2): 321C5 32233
* $ #w #pos -> $rest: prints the first #w characters of a too-long string and returns what follows
PrintFirst#:
        :: DROPDUP BINT1 4PICK SUB$ PrintRC(st) OVER #1+ DUP#0=IT #1- LAST$ ; * 321E3

* refs (1): 321CA
PRINT~1:
        :: DUP 4PICK #>case PrintFirst#          * 3221F
          2DUP 1_#1-SUB$ PrintRC(st) #1+LAST$ ;  * 32238

* refs (7): 3185E 31C86 31CA4 32175 3218E 321FC ...
PrintRC(st):
        :: BINT38 TestSysFlag                    * 32251  flag -38: Add linefeeds / No linefeeds

* refs (1): 3189A
PrintNoRC?(st,?):
          :: DUPUNROT ITE NULL$                  * 32260
            :: BINT34 SysITE                     * 32274  flag -34: Print via IR / Print via wire
              :: GetChkPRTPAR 2DROP BINT37 TestSysFlag IT * 32283  flag -37: Single-space prnt / Double-space prnt

dup;+(2st):
                :: DUP &$ ;                      * 322A1
              ;                                  * 322B5
              _chr(4)_ ;                         * 322BA
            !append$ PRINTxNLF ?SEMI             * 322C4
            BINT34 TestSysFlag NOT?SEMI          * 322D3  flag -34: Print via IR / Print via wire
            PrintRC(st)~1 BINT37 TestSysFlag NOT?SEMI * 322E2  flag -37: Single-space prnt / Double-space prnt
            PrintRC(st)~1 ;                      * 322F6
        ;                                        * 32300

* refs (2): 322E2 322F6
PrintRC(st)~1:
        CON(5)  (*)+5                            * 32305  primitive code object
        ASSEMBLE
        GOSUB   SAVPTR~jump_15                   * 3230A
        D1=(5)  uart_handshk                     * 3230E
        C=DAT1  XS                               * 32315
        C=C+C   XS                               * 32319
        GOC     GetChkPRTPAR~1.L2                * 3231C
        ST=1    5                                * 3231F
        ST=0    15                               * 32322
        GOSUB   SUB_328E0                        * 32325
        GOSUB   AllowIntr~jump_2                 * 32329
        GONC    GetChkPRTPAR~1.L2                * 3232D
        C=0     A                                * 32330
        GOTO    PSubErr.L1                       * 32332
PrintRC(st)~1.L1:
        B=0     A                                * 32336
        D=0     A                                * 32338
        GOLONG  SUB_31692                        * 3233A
        BSS     1                                * 32340  zeros
        RPL

* refs (1): 322BA
_chr(4)_:
        $ "\04"                                  * 32341

* refs (1): 32116
GetChkPRTPAR~1:
        CON(5)  (*)+5                            * 3234D  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 32352
        GOSUB   SAVPTR~jump_15                   * 32359
        ASL     A                                * 3235D
        A=A+1   A                                * 3235F
        A=A+1   A                                * 32361
        C=0     A                                * 32363
        LC(1)   #5                               * 32365
        GOSBVL  IntDiv                           * 32368
        D0=(5)  DelayCt                          * 3236F
        ?C#0    B                                * 32376
        GOYES   GetChkPRTPAR~1.L1                * 32379
        C=C+1   A                                * 3237B
GetChkPRTPAR~1.L1:
        DAT0=C  B                                * 3237D
GetChkPRTPAR~1.L2:
        GOVLNG  GETPTRLOOP                       * 32380
        RPL

* refs (2): 31A57 322C9
PRINTxNLF:
        :: CKREF GetChkPRTPAR DROPSWAPDROP REMAP BINT34 TestSysFlag ?GOTO * 32387  flag -34: Print via IR / Print via wire
          PutSerialECk                           * 323AF

IRprint(st):
          CODE                                   * 323B4  54 nibbles
            GOSUB   PopASavptr                   * 323BE
            D1=A                                 * 323C2
            GOSUB   SUB_3246B                    * 323C5
            GOSBVL  GetStrLen                    * 323C9
            GOSUB   PRINTxNLF~1                  * 323D0
            GOC     IRprint(st).L2               * 323D4
IRprint(st).L1:
            GOSUB   FixEIRU                      * 323D7
            GOTO    GetChkPRTPAR~1.L2            * 323DB
IRprint(st).L2:
            GOSUBL  SUB_32EC1                    * 323DF
            GOSUB   AllowIntr~jump_2             * 323E5

* refs (1): 32C28
PSubErr:
            GOSUB   ErrFixEIRU                   * 323E9
PSubErr.L1:
            GOVLNG  GPErrjmpC                    * 323ED
          ENDCODE                                * 323F4
        ;                                        * 323F4

* refs (1): 3239B
REMAP:
        CON(5)  (*)+5                            * 323F9  primitive code object
        ASSEMBLE
        GOSUB   PopASavptr                       * 323FE
        AD1EX                                    * 32402
        GOSBVL  GetStrLen                        * 32405
        AD1EX                                    * 3240C
        R0=A                                     * 3240F
        D=C     A                                * 32412
        GOSBVL  GetStrLenStk                     * 32414
        B=C     A                                * 3241B
        ST=0    1                                * 3241D
        GONC    REMAP.L5                         * 32420
REMAP.loop1:
        A=0     A                                * 32423
        A=DAT1  B                                * 32425
        C=0     A                                * 32428
        LC(2)   #80                              * 3242A
        C=A-C   A                                * 3242E
        GONC    REMAP.L2                         * 32430
        LC(2)   #1B                              * 32433
        ?C#A    B                                * 32437
        GOYES   REMAP.L3                         * 3243A
        ST=1    1                                * 3243C
        GONC    REMAP.L4                         * 3243F
REMAP.L2:
        ?D<=C   A                                * 32442
        GOYES   REMAP.L3                         * 32445
        ?ST=1   1                                * 32447
        GOYES   REMAP.L3                         * 3244A
        A=R0                                     * 3244C
        C=C+C   A                                * 3244F
        A=A+C   A                                * 32451
        D0=A                                     * 32453
        A=DAT0  B                                * 32456
        DAT1=A  B                                * 32459
REMAP.L3:
        ST=0    1                                * 3245C
REMAP.L4:
        D1=D1+  2                                * 3245F
REMAP.L5:
        B=B-1   A                                * 32462
        GONC    REMAP.loop1                      * 32464
        GOTO    GetChkPRTPAR~1.L2                * 32467

* refs (3): 323C5 32AC3 32B9A
SUB_3246B:
        GOSUB   PrintWire?                       * 3246B
        GONC    SUB_3246B.L1                     * 3246F
        GOLONG  FLUSHRSBUF.L2                    * 32472
SUB_3246B.L1:
        D0=(5)  IRC                              * 32478
        C=DAT0  B                                * 3247F
        A=C     A                                * 32482
        CBIT=0  2                                * 32484
        DAT0=C  B                                * 32489
        GOSUB   PrtStatus@                       * 3248C
        CBIT=0  10                               * 32490
        ?ABIT=0 2                                * 32495
        GOYES   SUB_3246B.L2                     * 3249A
        CBIT=1  10                               * 3249C
SUB_3246B.L2:
        DAT0=C  A                                * 324A1
        RTNCC                                    * 324A4

* refs (8): 2D8CF 2E068 2E08B 2E777 2E78B 2E86C ...
AllowPrlcdCl:
        CON(5)  (*)+5                            * 324A6  primitive code object
        AD0EX                                    * 324AB
        D0=(5)  #8084B                           * 324AE
        C=DAT0  B                                * 324B5
        ?CBIT=0 0                                * 324B8
        GOYES   OpenIO_324C8.L1                  * 324BD
        GOSUBL  CloseUart                        * 324BF
        GONC    OpenIO_324C8.L1                  * 324C5  always taken

* refs (5): 21EC4 2D372 2EE27 2EE4C 31886
OpenIO_324C8:
        CON(5)  (*)+5                            * 324C8  primitive code object
        AD0EX                                    * 324CD
OpenIO_324C8.L1:
        GOSUB   PrtStatus@                       * 324D0
        CBIT=0  11                               * 324D4
        DAT0=C  A                                * 324D9
        D0=A                                     * 324DC
        A=DAT0  A                                * 324DF
        D0=D0+  5                                * 324E2
        PC=(A)                                   * 324E5
OpenIO_324C8.L2:
        R1=C                                     * 324E9
        A=DAT1  B                                * 324EC
        D1=D1+  2                                * 324EF
        CD1EX                                    * 324F2
        R2=C                                     * 324F5
        ST=0    15                               * 324F8
        GOSUBL  ChkATTN                          * 324FB
        GOSUB   PrintByteA                       * 32501
        RTNC                                     * 32505
        GOSUB   AllowIntr~jump_2                 * 32508
        C=R2                                     * 3250C
        D1=C                                     * 3250F
        C=R1                                     * 32512

* refs (1): 323D0
PRINTxNLF~1:
        C=C-1   A                                * 32515
        GONC    OpenIO_324C8.L2                  * 32517
        RTNCC                                    * 3251A

* Pop to A.A, <REF>SAVPTR
* refs (4): 210A1 323BE 323FE D45FB
PopASavptr:
        A=DAT1  A                                * 3251C

* Pop <REF>SAVPTR
* refs (2): 2E18C 30813
PopSavptr:
        D1=D1+  5                                * 3251F
        D=D+1   A                                * 32522

* refs (4): 3230A 32359 32530 32B92
SAVPTR~jump_15:
        GOVLNG  SAVPTR                           * 32524

* refs (5): 1EF00 31813 31D6A 31EE7 9F863
SetEcma94:
        CON(5)  (*)+5                            * 3252B  primitive code object
        GOSUB   SAVPTR~jump_15                   * 32530
        GOSUB   PrtStatus@                       * 32534
        CBIT=0  7                                * 32538
        CBIT=0  9                                * 3253D
        DAT0=C  A                                * 32542
        ST=0    15                               * 32545
        GOSUB   ChkLowBat                        * 32548
        GOSUB   AllowIntr~jump_2                 * 3254C
        GOC     PrintGrob~1.L2                   * 32550
        GOSUB   PrintWire?                       * 32553
        GOC     PrintGrob~1.L4                   * 32557
        GOSUB   PrtStatusD0                      * 3255A
        ?CBIT=1 3                                * 3255E
        GOYES   PrintGrob~1.L3                   * 32563
        GOSUB   SUB_3246B.L1                     * 32565
        ST=0    15                               * 32569
        LC(2)   #1B                              * 3256C
        GOSUB   SUB_32634                        * 32570
        GOC     PrintGrob~1.L1                   * 32574
        LC(2)   #F9                              * 32577
        GOSUB   SUB_32634                        * 3257B
        GOC     PrintGrob~1.L1                   * 3257F
PrintGrob~1:
        GOSUB   AllowIntr~jump_2                 * 32582
        GOTO    IRprint(st).L1                   * 32586
PrintGrob~1.L1:
        GOTO    IRprint(st).L2                   * 3258A
PrintGrob~1.L2:
        GOTO    PSubErr.L1                       * 3258E
PrintGrob~1.L3:
        GOTO    GetChkPRTPAR~1.L2                * 32592
PrintGrob~1.L4:
        LC(5)   OpenIOPrt                        * 32596
        A=C     A                                * 3259D
        GOSBVL  GETPTR                           * 3259F
        PC=(A)                                   * 325A6

* refs (3): 32141 32548 32604
ChkLowBat:
        D=C     A                                * 325AA
        P=      0                                * 325AC
        LC(1)   #2                               * 325AE
        GOSBVL  ReadLowBat                       * 325B1
        GOSUB   SUB_32A2C                        * 325B8
        ?ST=1   7                                * 325BC
        GOYES   ChkLowBat.L1                     * 325BF
        ?ABIT=0 1                                * 325C1
        GOYES   ChkLowBat.L2                     * 325C6
        ST=1    7                                * 325C8
        C=ST                                     * 325CB
        DAT0=C  B                                * 325CD
ChkLowBat.L1:
        LC(5)   lowbaterr                        * 325D0  "Low Battery"
        RTNSC                                    * 325D7
ChkLowBat.L2:
        C=D     A                                * 325D9
        RTNCC                                    * 325DB

* refs (2): 32BC1 32C67
PrintGrob~2:
        GOSUB   PrintLFCode                      * 325DD
        GONC    PrintByteA                       * 325E1
        ?C=0    A                                * 325E4
        RTNYES                                   * 325E7
        LC(2)   #0D                              * 325E9
        GOSUB   PrintByte                        * 325ED
        RTNC                                     * 325F1
        LC(2)   #0A                              * 325F4
        GONC    PrintByte                        * 325F8
PrintGrob~2.L1:
        GOVLNG  OUTUART                          * 325FB

* refs (4): 32501 325E1 32E15 32E8C
* A.B = byte: on to PrintByte
PrintByteA:
        C=A     A                                * 32602

* refs (6): 325ED 325F8 32C5A 32D37 32D45 32E7D
* C.B = byte -> sends it to the printer, through the wire (flag -34) or by IR. Carry set and C.A = error on low battery or ON
PrintByte:
        GOSUB   ChkLowBat                        * 32604
        RTNC                                     * 32608
        A=C     A                                * 3260B
        GOSUB   OnKeyDown?~jump                  * 3260D
        LC(5)   intrptderr                       * 32611  "Interrupted"
        RTNC                                     * 32618
        GOSUB   D1=IRAM~jump_4                   * 3261B
        D1=(4)  #084B                            * 3261F
        C=DAT1  B                                * 32625
        ?CBIT=1 1                                * 32628
        GOYES   PrintGrob~2.L1                   * 3262D
        GONC    SUB_32634.L1                     * 3262F

* refs (2): 32EE2 32EF0
SUB_32632:
        C=0     A                                * 32632

* refs (3): 32570 3257B 32EFA
SUB_32634:
        A=C     A                                * 32634
        GOSUB   D0=IRAM~jump_2                   * 32636
SUB_32634.L1:
        ST=0    4                                * 3263A
        ST=0    5                                * 3263D
        B=A     A                                * 32640
        ST=1    8                                * 32642
SUB_32634.loop2:
        D0=(4)  #0928                            * 32645
        C=DAT0  B                                * 3264B
        C=C+1   A                                * 3264E
        DAT0=C  B                                * 32650
        D0=D0+  2                                * 32653
        A=DAT0  B                                * 32656
        A=A+C   B                                * 32659
        LC(2)   #C8                              * 3265C
        ?C>A    B                                * 32660
        GOYES   SUB_32634.L3                     * 32663
        GOSUB   SUB_328E0                        * 32665
SUB_32634.L3:
        A=B     A                                * 32669
        D0=(4)  #0920                            * 3266B
        ?ST=1   3                                * 32671
        GOYES   SUB_32634.L8                     * 32674
        ?ST=1   1                                * 32676
        GOYES   SUB_32634.L9                     * 32679
        LC(2)   #20                              * 3267B
        ?C<=A   B                                * 3267F
        GOYES   SUB_32634.L4                     * 32682
        LC(2)   #04                              * 32684
        ?C#A    B                                * 32688
        GOYES   SUB_32634.L5                     * 3268B
        GONC    SUB_32634.L6                     * 3268D
SUB_32634.L4:
        LC(2)   #07                              * 32690
        ST=1    0                                * 32694
        GOTO    SUB_32634.L17                    * 32697
SUB_32634.L5:
        LC(2)   #0A                              * 3269B
        ?C#A    B                                * 3269F
        GOYES   SUB_32634.L7                     * 326A2
SUB_32634.L6:
        ST=1    4                                * 326A4
        GOTO    SUB_32634.L13                    * 326A7
SUB_32634.L7:
        LC(2)   #1B                              * 326AB
        ?C#A    B                                * 326AF
        GOYES   SUB_32634.L13                    * 326B2
        ST=1    1                                * 326B4
        GONC    SUB_32634.L13                    * 326B7
SUB_32634.L8:
        GOTO    SUB_32634.L14                    * 326BA
SUB_32634.L9:
        ST=0    1                                * 326BE
        LC(2)   #A6                              * 326C1
        ?C>=A   B                                * 326C5
        GOYES   SUB_32634.L12                    * 326C8
        LC(2)   #FD                              * 326CA
        C=C-A   B                                * 326CE
        GOC     SUB_32634.L11                    * 326D1
        C=C-1   B                                * 326D4
        GONC    SUB_32634.L10                    * 326D7
        ST=1    2                                * 326DA
        GOC     SUB_32634.L13                    * 326DD
SUB_32634.L10:
        C=C-1   B                                * 326E0
        GONC    SUB_32634.L13                    * 326E3
SUB_32634.L11:
        ST=0    2                                * 326E6
        GOC     SUB_32634.L13                    * 326E9
SUB_32634.L12:
        ?A=0    B                                * 326EC
        GOYES   SUB_32634.L13                    * 326EF
        DAT0=A  B                                * 326F1
        ST=1    3                                * 326F4
SUB_32634.L13:
        C=0     A                                * 326F7
        ST=1    0                                * 326F9
        GOTO    SUB_32634.L19                    * 326FC
SUB_32634.L14:
        C=DAT0  B                                * 32700
        C=C-1   A                                * 32703
        GOC     SUB_32634.L15                    * 32705
        DAT0=C  B                                * 32708
        ?C#0    B                                * 3270B
        GOYES   SUB_32634.L16                    * 3270E
SUB_32634.L15:
        ST=0    3                                * 32710
SUB_32634.L16:
        LC(2)   #01                              * 32713
        ST=0    0                                * 32717
SUB_32634.L17:
        D0=(4)  #0922                            * 3271A
        A=DAT0  B                                * 32720
        ?A#0    B                                * 32723
        GOYES   SUB_32634.L18                    * 32726
        ?ST=0   0                                * 32728
        GOYES   SUB_32634.L18                    * 3272B
        C=C-1   B                                * 3272D
SUB_32634.L18:
        ?ST=0   2                                * 32730
        GOYES   SUB_32634.L19                    * 32733
        C=C+C   A                                * 32735
SUB_32634.L19:
        D=C     A                                * 32737
        D0=(4)  #0922                            * 32739
        ?C=0    B                                * 3273F
        GOYES   SUB_32634.L20                    * 32742
        A=DAT0  B                                * 32744
        A=A+C   A                                * 32747
        LC(2)   #A7                              * 32749
        C=A-C   B                                * 3274D
        GOC     SUB_32634.L22                    * 32750
        C=C-1   B                                * 32753
        GOC     SUB_32634.L21                    * 32756
        C=C-1   B                                * 32759
        GONC    SUB_32634.L24                    * 3275C
        C=D     A                                * 3275F
        ?CBIT=1 3                                * 32761
        GOYES   SUB_32634.L22                    * 32766
        GONC    SUB_32634.L24                    * 32768
SUB_32634.L20:
        C=0     A                                * 3276B
        ?ST=0   4                                * 3276D
        GOYES   SUB_32634.L23                    * 32770
        DAT0=C  B                                * 32772
        GONC    SUB_32634.L27                    * 32775
SUB_32634.L21:
        C=D     A                                * 32778
        ?CBIT=0 2                                * 3277A
        GOYES   SUB_32634.L24                    * 3277F
SUB_32634.L22:
        DAT0=A  B                                * 32781
SUB_32634.L23:
        GOTO    SUB_32634.L29                    * 32784
SUB_32634.L24:
        C=D     A                                * 32788
        ?ST=0   0                                * 3278A
        GOYES   SUB_32634.L25                    * 3278D
        C=C-1   A                                * 3278F
        ?ST=0   2                                * 32791
        GOYES   SUB_32634.L25                    * 32794
        C=C-1   A                                * 32796
SUB_32634.L25:
        DAT0=C  B                                * 32798
        ?ST=0   0                                * 3279B
        GOYES   SUB_32634.L26                    * 3279E
        GOSUB   NoLF?                            * 327A0
        GOC     SUB_32634.L26                    * 327A4
        LC(2)   #04                              * 327A7
        A=C     A                                * 327AB
        GOSUB   SUB_32832                        * 327AD
        GOSUB   DblSpace?                        * 327B1
        GONC    SUB_32634.L26                    * 327B5
        GOSUB   SUB_328E0                        * 327B8
        LC(2)   #04                              * 327BC
        A=C     A                                * 327C0
        GOSUB   SUB_32832                        * 327C2
        C=0     A                                * 327C6
        C=C+1   A                                * 327C8
        GOSUB   SUB_32891                        * 327CA
SUB_32634.L26:
        C=0     A                                * 327CE
        C=C+1   A                                * 327D0
SUB_32634.L27:
        D0=(4)  #0945                            * 327D2
        ST=1    6                                * 327D8
        A=DAT0  B                                * 327DB
        ?A#0    B                                * 327DE
        GOYES   SUB_32634.L28                    * 327E1
        ST=0    6                                * 327E3
SUB_32634.L28:
        GOSUB   SUB_328E3                        * 327E6
        GOSUB   SUB_32891                        * 327EA
        ?ST=0   4                                * 327EE
        GOYES   SUB_32634.L29                    * 327F1
        GOSUB   NoLF?                            * 327F3
        GOC     SUB_32634.L29                    * 327F7
        GOSUB   DblSpace?                        * 327FA
        GONC    SUB_32634.L29                    * 327FE
        GOSUB   PrtStatusD0                      * 32801
        ?CBIT=1 9                                * 32805
        GOYES   SUB_32634.L29                    * 3280A
        ?ST=0   8                                * 3280C
        GOYES   SUB_32634.L29                    * 3280F
        ST=0    8                                * 32811
        A=B     A                                * 32814
        GOSUB   SUB_32832                        * 32816
        GOTO    SUB_32634.loop2                  * 3281A
SUB_32634.L29:
        D0=(4)  #0924                            * 3281E
        C=ST                                     * 32824
        DAT0=C  B                                * 32826
        A=B     A                                * 32829

* refs (1): 32836
SUB_3282B:
        GOVLNG  SUB_65863.L2                     * 3282B

* refs (3): 327AD 327C2 32816
SUB_32832:
        C=B     A                                * 32832
        D=C     A                                * 32834
        GOSUB   SUB_3282B                        * 32836
        GOSUB   D0=IRAM~jump_2                   * 3283A
        C=D     A                                * 3283E
        B=C     A                                * 32840
        RTNCC                                    * 32842

* refs (2): 327B1 327FA
* D0 = #80000 page -> carry set when flag -37 is set: double-spaced printing
DblSpace?:
        D0=(4)  #084C                            * 32844
        C=DAT0  B                                * 3284A
        ?CBIT=1 0                                * 3284D
        RTNYES                                   * 32852
        RTNCC                                    * 32854

* refs (3): 327A0 327F3 32872
* D0 = #80000 page -> carry set when flag -38 is set: no linefeeds
NoLF?:
        D0=(4)  #084C                            * 32856
        C=DAT0  B                                * 3285C
        ?CBIT=1 1                                * 3285F
        RTNYES                                   * 32864
        RTNCC                                    * 32866

* refs (2): 325DD 32E6A
* -> A.A = 4, the HP 82240's line feed. With flag -38 set, carry set and C.A = 0
PrintLFCode:
        LC(2)   #04                              * 32868
        A=C     A                                * 3286C
        GOSUB   D0=IRAM~jump_2                   * 3286E
        GOSUB   NoLF?                            * 32872
        C=0     A                                * 32876
        RTNC                                     * 32878

* refs (6): 32153 3246B 32553 32B1E 32CAF 32ED1
* -> carry set when flag -34 is set: printing to the wire, D0 at #8084B
PrintWire?:
        GOSUB   D0=IRAM~jump_2                   * 3287B
        D0=(4)  #084B                            * 3287F
        C=DAT0  B                                * 32885
        ?CBIT=1 1                                * 32888
        RTNYES                                   * 3288D
        RTNCC                                    * 3288F

* refs (2): 327CA 327EA
SUB_32891:
        D0=(4)  #0928                            * 32891
        A=DAT0  B                                * 32897
        DAT0=C  B                                * 3289A
        D0=D0+  2                                * 3289D
        C=DAT0  B                                * 328A0
        C=C+A   B                                * 328A3
        DAT0=C  B                                * 328A6
        D0=(4)  #0937                            * 328A9
        C=DAT0  W                                * 328AF
        CSL     W                                * 328B3
        CSL     W                                * 328B6
        C=A     B                                * 328B9
        DAT0=C  W                                * 328BC
        RTNCC                                    * 328C0
SUB_32891.L1:
        ?ST=1   5                                * 328C2
        GOYES   SUB_32891.L2                     * 328C5
        C=RSTK                                   * 328C7
SUB_32891.L2:
        LC(5)   intrptderr                       * 328C9  "Interrupted"
        RTNSC                                    * 328D0
SUB_32891.L3:
        GOVLNG  GetTime++.L1                     * 328D2

* refs (4): 3260D 328F4 32E3F 32EA1
OnKeyDown?~jump:
        GOVLNG  OnKeyDown?                       * 328D9

* refs (3): 32325 32665 327B8
SUB_328E0:
        ST=1    6                                * 328E0

* refs (1): 327E6
SUB_328E3:
        CSL     A                                * 328E3
        CSL     A                                * 328E5
        C=B     B                                * 328E7
        RSTK=C                                   * 328EA
SUB_328E3.loop1:
        C=RSTK                                   * 328EC
        D=C     A                                * 328EE
        P=      0                                * 328F0
        C=0     A                                * 328F2
        GOSUB   OnKeyDown?~jump                  * 328F4
        GOC     SUB_32891.L1                     * 328F8
        GOSUB   PrintErrBeep                     * 328FB
        GOSUB   WaitONUp                         * 328FF
        CD1EX                                    * 32903
        D0=C                                     * 32906
        C=D     A                                * 32909
        RSTK=C                                   * 3290B
        GOSBVL  GetTimeRaw                       * 3290D
        GOC     SUB_32891.L3                     * 32914
        AD0EX                                    * 32917
        D1=A                                     * 3291A
        CSR     W                                * 3291D
        C=C+C   P                                * 32920
        CSR     W                                * 32923
        GONC    SUB_328E3.L2                     * 32926
        C=C+1   W                                * 32929
SUB_328E3.L2:
        A=C     W                                * 3292C
        D=C     W                                * 3292F
        GOSUB   D0=IRAM~jump_2                   * 32932
        D0=(4)  #092C                            * 32936
        C=0     W                                * 3293C
        C=DAT0  11                               * 3293F
        A=A-C   W                                * 32943
        GOC     SUB_328E3.L5                     * 32946
        D0=(4)  #091E                            * 32949
        C=0     W                                * 3294F
        C=DAT0  B                                * 32952
        ?C#0    B                                * 32955
        GOYES   SUB_328E3.L3                     * 32958
        LC(2)   #3A                              * 3295A
SUB_328E3.L3:
        GOSBVL  IntDivW                          * 3295E
        P=      10                               * 32965
        ?C#0    WP                               * 32967
        GOYES   SUB_328E3.L4                     * 3296A
        ?ST=0   6                                * 3296C
        GOYES   SUB_328E3.L4                     * 3296F
        GOTO    SUB_328E3.loop1                  * 32971
SUB_328E3.L4:
        CSRC                                     * 32975
        C=0     P                                * 32978
        ?C=0    WP                               * 3297B
        GOYES   SUB_328E3.L6                     * 3297E
        C=0     S                                * 32980
        C=C-1   S                                * 32983
SUB_328E3.L5:
        B=0     W                                * 32986
SUB_328E3.L6:
        DCEX    W                                * 32989
        C=C-B   W                                * 3298C
        D0=(4)  #092C                            * 3298F
        DAT0=C  11                               * 32995
        ?ST=1   5                                * 32999
        GOYES   SUB_328E3.L10                    * 3299C
        D0=D0-  2                                * 3299E
        A=DAT0  B                                * 329A1
        D0=(4)  #0947                            * 329A4
        P=      8                                * 329AA
        GONC    SUB_328E3.L8                     * 329AC
SUB_328E3.loop7:
        P=P-1                                    * 329AF
        GOC     SUB_328E3.L9                     * 329B1
        D0=D0-  2                                * 329B4
        C=DAT0  B                                * 329B7
        ?C=0    B                                * 329BA
        GOYES   SUB_328E3.loop7                  * 329BD
        A=A-C   B                                * 329BF
        C=0     A                                * 329C2
        DAT0=C  B                                * 329C4
SUB_328E3.L8:
        D=D-1   S                                * 329C7
        GONC    SUB_328E3.loop7                  * 329CA
SUB_328E3.L9:
        D0=(4)  #092A                            * 329CD
        DAT0=A  B                                * 329D3
SUB_328E3.L10:
        C=RSTK                                   * 329D6
        B=C     A                                * 329D8
        CSR     A                                * 329DA
        CSR     A                                * 329DC
        P=      0                                * 329DE
        RTNCC                                    * 329E0

* refs (8): 32145 32329 323E5 32508 3254C 32582 ...
AllowIntr~jump_2:
        GOVLNG  AllowIntr                        * 329E2

* refs (2): 328FB 32E46
* C.A = error number; if not zero, beeps unless flag -56 is set
PrintErrBeep:
        ?C=0    A                                * 329E9
        RTNYES                                   * 329EC
        GOSUB   D0=IRAM~jump_2                   * 329EE
        D0=(4)  #0850                            * 329F2
        C=DAT0  B                                * 329F8
        ?CBIT=1 3                                * 329FB
        RTNYES                                   * 32A00
        LC(2)   #D4                              * 32A02
        GOVLNG  RCKBp                            * 32A06

* refs (5): 328FF 32A16 32B04 32E4A 32EDE
* Waits until the ON key is released
WaitONUp:
        C=0     A                                * 32A0D
        GOSBVL  CINRTN                           * 32A0F
        ?C#0    A                                * 32A16
        GOYES   WaitONUp                         * 32A19
        RTNCC                                    * 32A1B

* refs (6): 3248C 324D0 32534 32A4D 32B52 32D27
* D0 = #80924, C.A = the printer's status word
PrtStatus@:
        GOSUB   D0=IRAM~jump_2                   * 32A1D

* refs (3): 3255A 32801 32B2F
* As PrtStatus@, with D0 already in the #80000 page
PrtStatusD0:
        D0=(4)  #0924                            * 32A21
        C=DAT0  A                                * 32A27
PrtStatusD0.L1:
        RTNCC                                    * 32A2A

* refs (1): 325B8
SUB_32A2C:
        GOSUB   D0=IRAM~jump_2                   * 32A2C

* refs (1): 32EDA
* ST = low flags from the printer's status word; the old ST stays in C
PrtStatusST:
        D0=(4)  #0924                            * 32A30
        C=ST                                     * 32A36
        C=DAT0  B                                * 32A38
        ST=C                                     * 32A3B
        RTN                                      * 32A3D

* refs (8): 32636 3283A 3286E 3287B 32932 329EE ...
D0=IRAM~jump_2:
        GOVLNG  D0=IRAM                          * 32A3F

* refs (3): 3261B 32A7D 32F3C
D1=IRAM~jump_4:
        GOVLNG  D1=IRAM                          * 32A46

* refs (1): 01041
SUB_32A4D:
        GOSUB   PrtStatus@                       * 32A4D
        ?CBIT=1 11                               * 32A51
        GOYES   PrtStatusD0.L1                   * 32A56
        P=      0                                * 32A58
        GOSUBL  SUB_3214B                        * 32A5A
        ST=0    10                               * 32A60

* refs (1): 31F1C
DOPRLCD~1:
        GOSUB   LCDRows                          * 32A63
        D1=(4)  #0692                            * 32A67
        A=0     A                                * 32A6D
        A=DAT1  X                                * 32A6F
        C=0     A                                * 32A73
        LC(2)   #22                              * 32A75
        A=A+C   A                                * 32A79
        B=A     A                                * 32A7B
        GOSUB   D1=IRAM~jump_4                   * 32A7D
        D1=(4)  #068D                            * 32A81
        GOSUB   SUB_32B60                        * 32A87
        D0=(5)  DISPIO                           * 32A8B
        C=R2                                     * 32A92
        CSLC                                     * 32A95
        C=DAT0  1                                * 32A98
        A=C     A                                * 32A9C
        ?ABIT=0 2                                * 32A9E
        GOYES   DOPRLCD~1.L1                     * 32AA3
        D1=D1+  1                                * 32AA5
        B=B+1   A                                * 32AA8
        B=B+1   A                                * 32AAA
DOPRLCD~1.L1:
        LC(1)   #3                               * 32AAC
        C=C&A   P                                * 32AAF
        CSRC                                     * 32AB3
        C=0     A                                * 32AB6
        P=      2                                * 32AB8
        LC(2)   #83                              * 32ABA
        P=      0                                * 32ABE
        R2=C                                     * 32AC0
        GOSUB   SUB_3246B                        * 32AC3
        GOSUB   SUB_32CF7                        * 32AC7
        GOC     DOPRLCD~1.L2                     * 32ACB
        GOSUB   LCDRows                          * 32ACE
        D1=(4)  #0695                            * 32AD2
        GOSUB   SUB_32B60                        * 32AD8
        C=0     S                                * 32ADC
        R2=C.F  S                                * 32ADF
        C=0     A                                * 32AE5
        LC(2)   #40                              * 32AE7
        D=C-D   A                                * 32AEB
        LC(2)   #22                              * 32AED
        B=C     A                                * 32AF1
        GOSUB   SUB_32CF7                        * 32AF3
        GONC    FixEIRU                          * 32AF7
DOPRLCD~1.L2:
        ?C#0    A                                * 32AFA
        GOYES   ErrFixEIRU                       * 32AFD
        ?ST=1   10                               * 32AFF
        GOYES   ErrFixEIRU                       * 32B02
        GOSUB   WaitONUp                         * 32B04

* refs (3): 323E9 32AFA 32AFF
ErrFixEIRU:
        D=C     A                                * 32B08
        GOSUB   FixEIRU                          * 32B0A
        CBIT=0  7                                * 32B0E
        DAT0=C  B                                * 32B13
        C=D     A                                * 32B16
        RTNSC                                    * 32B18

* refs (3): 323D7 32AF7 32B0A
FixEIRU:
        GOSUB   IOAnnClr                         * 32B1A
        GOSUB   PrintWire?                       * 32B1E
        GONC    FixEIRU.L1                       * 32B22
        GOSUBL  IOAnnOff                         * 32B25
        GOTO    FixEIRU.L3                       * 32B2B
FixEIRU.L1:
        GOSUB   PrtStatusD0                      * 32B2F
        D0=(5)  IRC                              * 32B33
        A=DAT0  B                                * 32B3A
        ABIT=0  2                                * 32B3D
        ?CBIT=0 10                               * 32B42
        GOYES   FixEIRU.L2                       * 32B47
        ABIT=1  2                                * 32B49
FixEIRU.L2:
        DAT0=A  1                                * 32B4E
FixEIRU.L3:
        GOSUB   PrtStatus@                       * 32B52
        CBIT=0  11                               * 32B56
        DAT0=C  A                                * 32B5B
        RTNCC                                    * 32B5E

* refs (2): 32A87 32AD8
SUB_32B60:
        A=DAT1  A                                * 32B60
        A=A-1   A                                * 32B63
        C=A     A                                * 32B65
        C=C+C   A                                * 32B67
        GONC    SUB_32B60.L1                     * 32B69
        D1=A                                     * 32B6C
SUB_32B60.L1:
        D1=AS                                    * 32B6F
        RTNCC                                    * 32B72
        RPL

* refs (2): 3193A 31D8D
PrintGrob:
        :: GetChkPRTPAR 3DROP BINT1              * 32B74
          CODE                                   * 32B88  275 nibbles
            GOSUB   SAVPTR~jump_15               * 32B92
            GOSUB   ChkGrHook                    * 32B96
            GOSUB   SUB_3246B                    * 32B9A
            D1=D1+  5                            * 32B9E
            A=DAT1  A                            * 32BA1
            D1=A                                 * 32BA4
            D1=D1+  10                           * 32BA7
            C=DAT1  A                            * 32BAA
            R3=C                                 * 32BAD
            D1=D1+  5                            * 32BB0
            A=DAT1  A                            * 32BB3
            R4=A                                 * 32BB6
            ?A#0    A                            * 32BB9
            GOYES   PrintGrob.L1                 * 32BBC
            ST=0    15                           * 32BBE
            GOSUB   PrintGrob~2                  * 32BC1
            GOC     PrintGrob.loop6              * 32BC5
            GONC    PrintGrob.loop3              * 32BC8
PrintGrob.L1:
            GOSBVL  w->W                         * 32BCB
            B=A     A                            * 32BD2
            D1=D1+  4                            * 32BD4
            ST=1    9                            * 32BD7
PrintGrob.loop2:
            C=R3                                 * 32BDA
            D=C     A                            * 32BDD
            A=R4                                 * 32BDF
            ?A#0    A                            * 32BE2
            GOYES   PrintGrob.L4                 * 32BE5
PrintGrob.loop3:
            GOTO    PrintGrob~1                  * 32BE7
PrintGrob.L4:
            C=0     W                            * 32BEB
            LC(2)   #A6                          * 32BEE
            A=A-C   A                            * 32BF2
            GONC    PrintGrob.L5                 * 32BF4
            C=C+A   A                            * 32BF7
            A=0     A                            * 32BF9
PrintGrob.L5:
            R4=A                                 * 32BFB
            CSL     A                            * 32BFE
            CSL     A                            * 32C00
            ?ST=1   9                            * 32C02
            GOYES   PrintGrob.L8                 * 32C05
            ST=1    9                            * 32C07
            C=C+1   S                            * 32C0A
            C=C+1   S                            * 32C0D
            GONC    PrintGrob.L9                 * 32C10
PrintGrob.loop6:
            LA(5)   intrptderr                   * 32C13  "Interrupted"
            ?C#A    A                            * 32C1D
            GOYES   PrintGrob.loop7              * 32C20
            C=0     A                            * 32C22
PrintGrob.loop7:
            GOSUB   AllowIntr~jump_2             * 32C24
            GOLONG  PSubErr                      * 32C28
PrintGrob.L8:
            ST=0    9                            * 32C2E
PrintGrob.L9:
            R2=C                                 * 32C31
            ST=0    15                           * 32C34
            GOSUB   SUB_32CF7                    * 32C37
            GOC     PrintGrob.loop7              * 32C3B
            C=R4                                 * 32C3E
            ?C=0    A                            * 32C41
            GOYES   PrintGrob.loop3              * 32C44
            C=B     A                            * 32C46
            RSTK=C                               * 32C48
            LC(2)   #18                          * 32C4A
PrintGrob.loop10:
            C=C-1   B                            * 32C4E
            GOC     PrintGrob.L11                * 32C51
            RSTK=C                               * 32C54
            LC(2)   #2D                          * 32C56
            GOSUB   PrintByte                    * 32C5A
            GOC     PrintGrob.loop6              * 32C5E
            C=RSTK                               * 32C61
            GOTO    PrintGrob.loop10             * 32C63
PrintGrob.L11:
            GOSUB   PrintGrob~2                  * 32C67
            GOC     PrintGrob.loop6              * 32C6B
            GOSUB   AllowIntr~jump_2             * 32C6E
            C=R3                                 * 32C72
            D=C     A                            * 32C75
            D=D-1   A                            * 32C77
            D=D+D   A                            * 32C79
            DSR     A                            * 32C7B
            C=RSTK                               * 32C7D
            RSTK=C                               * 32C7F
            GOSBVL  PUTCMPEL.L6                  * 32C81
            B=B+B   A                            * 32C88
            B=B+B   A                            * 32C8A
            B=B+B   A                            * 32C8C
            C=R1                                 * 32C8E
            C=C-B   A                            * 32C91
            ?ST=1   9                            * 32C93
            GOYES   PrintGrob.L12                * 32C96
            C=C-1   A                            * 32C98
PrintGrob.L12:
            D1=C                                 * 32C9A
            C=RSTK                               * 32C9D
            B=C     A                            * 32C9F
            GOTO    PrintGrob.loop2              * 32CA1
          ENDCODE                                * 32CA5
          DROP ;                                 * 32CA5
        ASSEMBLE

* refs (2): 31F0C 32B96
ChkGrHook:
        GOSUB   PrintWire?                       * 32CAF
        RTNNC                                    * 32CB3

adrGraphPrtH:
        D0=(5)  GraphPrtHook                     * 32CB6
        A=DAT0  A                                * 32CBD
        LC(5)   DOROMP                           * 32CC0
        ?C=A    A                                * 32CC7
        GOYES   adrGraphPrtH.L2                  * 32CCA
adrGraphPrtH.loop1:
        D0=(5)  GraphPrtHook                     * 32CCC
        A=0     W                                * 32CD3
        DAT0=A  11                               * 32CD6
        RTN                                      * 32CDA
adrGraphPrtH.L2:
        AD0EX                                    * 32CDC
        GOSBVL  ROMPTR>ADDR                      * 32CDF
        GOC     adrGraphPrtH.loop1               * 32CE6
        GOSBVL  GETPTR                           * 32CE9
        D0=D0+  5                                * 32CF0
        PC=(A)                                   * 32CF3

* refs (3): 32AC7 32AF3 32C37
SUB_32CF7:
        ?D#0    A                                * 32CF7
        GOYES   SUB_32CF7.L1                     * 32CFA
        GOTO    IOAnnClr                         * 32CFC
SUB_32CF7.L1:
        P=      0                                * 32D00
        ST=1    11                               * 32D02
        C=R2.F  S                                * 32D05
        C=C+C   S                                * 32D0B
        ?C=0    S                                * 32D0E
        GOYES   SUB_32CF7.L2                     * 32D11
        ST=0    11                               * 32D13
SUB_32CF7.L2:
        C=D     A                                * 32D16
        RSTK=C                                   * 32D18
        C=B     A                                * 32D1A
        RSTK=C                                   * 32D1C
        CD1EX                                    * 32D1E
        R1=C.F  A                                * 32D21
        GOSUB   PrtStatus@                       * 32D27
        CBIT=1  9                                * 32D2B
        DAT0=C  A                                * 32D30
        LC(2)   #1B                              * 32D33
        GOSUB   PrintByte                        * 32D37
        GOC     SUB_32CF7.L3                     * 32D3B
        C=R2                                     * 32D3E
        CSR     A                                * 32D41
        CSR     A                                * 32D43
        GOSUB   PrintByte                        * 32D45
        GOC     SUB_32CF7.L3                     * 32D49
        C=R2                                     * 32D4C
        D=C     A                                * 32D4F
        DSR     A                                * 32D51
        DSR     A                                * 32D53
        C=D     B                                * 32D55
        C=C-1   B                                * 32D58
        R2=C                                     * 32D5B
        C=RSTK                                   * 32D5E
        B=C     A                                * 32D60
        C=RSTK                                   * 32D62
        D=C     A                                * 32D64
        C=0     A                                * 32D66
        LC(1)   #8                               * 32D68
        D=D-C   A                                * 32D6B
        GOC     SUB_32CF7.L4                     * 32D6D
        P=      7                                * 32D70
        GOTO    SUB_32CF7.L5                     * 32D72
SUB_32CF7.L3:
        GOTO    SUB_32CF7.L20                    * 32D76
SUB_32CF7.L4:
        C=C+D   A                                * 32D7A
        C=C-1   A                                * 32D7C
        P=C     0                                * 32D7E
        D=0     A                                * 32D82
SUB_32CF7.L5:
        C=D     A                                * 32D84
        RSTK=C                                   * 32D86
SUB_32CF7.loop6:
        C=0     W                                * 32D88
        C=P     14                               * 32D8B
        R0=C                                     * 32D8F
        CSL     W                                * 32D92
        A=R1                                     * 32D95
SUB_32CF7.loop7:
        A=A+B   A                                * 32D98
        C=C-1   S                                * 32D9A
        GONC    SUB_32CF7.loop7                  * 32D9D
        A=A+1   A                                * 32DA0
        D1=A                                     * 32DA2
SUB_32CF7.loop8:
        AD1EX                                    * 32DA5
        A=A-B   A                                * 32DA8
        D1=A                                     * 32DAA
        C=DAT1  P                                * 32DAD
        P=P-1                                    * 32DB1
        GONC    SUB_32CF7.loop8                  * 32DB3
        P=      15                               * 32DB6
        LC(1)   #3                               * 32DB8
        A=0     W                                * 32DBB
SUB_32CF7.loop9:
        P=      7                                * 32DBE
SUB_32CF7.loop10:
        A=A+A   W                                * 32DC0
        C=C+C   P                                * 32DC3
        GONC    SUB_32CF7.L11                    * 32DC6
        A=A+1   B                                * 32DC9
SUB_32CF7.L11:
        P=P-1                                    * 32DCC
        GONC    SUB_32CF7.loop10                 * 32DCE
        C=C-1   S                                * 32DD1
        GONC    SUB_32CF7.loop9                  * 32DD4
        LC(1)   #3                               * 32DD7
        A=C     S                                * 32DDA
        P=      7                                * 32DDD
        ?ST=1   11                               * 32DDF
        GOYES   SUB_32CF7.L14                    * 32DE2
        C=R2.F  S                                * 32DE4
        A=A-C   S                                * 32DEA
        GONC    SUB_32CF7.L13                    * 32DED
SUB_32CF7.loop12:
        ASR     WP                               * 32DF0
        ASR     WP                               * 32DF3
SUB_32CF7.L13:
        C=C-1   S                                * 32DF6
        GONC    SUB_32CF7.loop12                 * 32DF9
SUB_32CF7.L14:
        C=B     A                                * 32DFC
        RSTK=C                                   * 32DFE
        CD1EX                                    * 32E00
        R1=C.F  A                                * 32E03
SUB_32CF7.loop15:
        R0=A.F  WP                               * 32E09
        R0=A.F  S                                * 32E0F
        GOSUBL  PrintByteA                       * 32E15
        GOC     SUB_32CF7.L20                    * 32E1B
        A=R2                                     * 32E1E
        A=A-1   B                                * 32E21
        GOC     SUB_32CF7.L17                    * 32E24
        R2=A                                     * 32E27
        A=R0                                     * 32E2A
        P=      7                                * 32E2D
        ASR     WP                               * 32E2F
        ASR     WP                               * 32E32
        A=A-1   S                                * 32E35
        GONC    SUB_32CF7.loop15                 * 32E38
        C=0     A                                * 32E3B
        P=      0                                * 32E3D
        GOSUB   OnKeyDown?~jump                  * 32E3F
        GOC     SUB_32CF7.L16                    * 32E43
        GOSUB   PrintErrBeep                     * 32E46
        GOSUB   WaitONUp                         * 32E4A
        ST=1    11                               * 32E4E
        C=RSTK                                   * 32E51
        B=C     A                                * 32E53
        C=R0                                     * 32E55
        P=C     14                               * 32E58
        GOTO    SUB_32CF7.loop6                  * 32E5C
SUB_32CF7.L16:
        LC(5)   intrptderr                       * 32E60  "Interrupted"
        GOC     SUB_32CF7.L20                    * 32E67
SUB_32CF7.L17:
        GOSUB   PrintLFCode                      * 32E6A
        GONC    SUB_32CF7.L19                    * 32E6E
        ?C#0    A                                * 32E71
        GOYES   SUB_32CF7.L18                    * 32E74
        GONC    SUB_32CF7.L20                    * 32E76
SUB_32CF7.L18:
        LC(2)   #0D                              * 32E79
        GOSUBL  PrintByte                        * 32E7D
        GOC     SUB_32CF7.L20                    * 32E83
        LC(2)   #0A                              * 32E86
        A=C     A                                * 32E8A
SUB_32CF7.L19:
        GOSUBL  PrintByteA                       * 32E8C
SUB_32CF7.L20:
        A=C     A                                * 32E92
        C=RSTK                                   * 32E94
        B=C     A                                * 32E96
        C=RSTK                                   * 32E98
        D=C     A                                * 32E9A
        C=A     A                                * 32E9C
        GOC     SUB_32EC1                        * 32E9E
        GOSUB   OnKeyDown?~jump                  * 32EA1
        GOC     SUB_32EC1.L1                     * 32EA5
        ?D#0    A                                * 32EA8
        GOYES   SUB_32EC1.L5                     * 32EAB

* refs (4): 32B1A 32CFC 32ED7 32F05
* Clears the I/O annunciator bit in ANNCTRL
IOAnnClr:
        D0=(5)  ANNCTRL                          * 32EAD
        A=DAT0  B                                * 32EB4
        ABIT=0  5                                * 32EB7
        DAT0=A  B                                * 32EBC
        RTN                                      * 32EBF

* refs (2): 323DF 32E9E
SUB_32EC1:
        A=C     A                                * 32EC1
        LC(5)   intrptderr                       * 32EC3  "Interrupted"
        ?C#A    A                                * 32ECA
        GOYES   SUB_32EC1.L2                     * 32ECD
SUB_32EC1.L1:
        A=0     A                                * 32ECF
        GOSUB   PrintWire?                       * 32ED1
SUB_32EC1.L2:
        C=A     A                                * 32ED5
        GOC     IOAnnClr                         * 32ED7
        GOSUB   PrtStatusST                      * 32EDA
SUB_32EC1.loop3:
        GOSUB   WaitONUp                         * 32EDE
SUB_32EC1.loop4:
        GOSUBL  SUB_32632                        * 32EE2
        GOC     SUB_32EC1.loop3                  * 32EE8
        ?ST=1   3                                * 32EEB
        GOYES   SUB_32EC1.loop4                  * 32EEE
        GOSUBL  SUB_32632                        * 32EF0
        LC(2)   #04                              * 32EF6
        GOSUBL  SUB_32634                        * 32EFA
        GOC     SUB_32EC1.loop3                  * 32F00
        C=0     A                                * 32F03
        ?ST=0   3                                * 32F05
        GOYES   IOAnnClr                         * 32F08
SUB_32EC1.L5:
        A=R1                                     * 32F0A
        C=B     A                                * 32F0D
        C=C+C   A                                * 32F0F
        C=C+C   A                                * 32F11
        C=C+C   A                                * 32F13
        A=A+C   A                                * 32F15
        C=R2                                     * 32F17
        P=C     15                               * 32F1A
        CSR     A                                * 32F1E
        CSR     A                                * 32F20
        C=C+1   A                                * 32F22
        C=C+1   A                                * 32F24
        C+P+1                                    * 32F26
        CSRB.F  A                                * 32F29
        CSRB.F  A                                * 32F2E
        A=A-C   A                                * 32F33
        D1=A                                     * 32F35
        GOTO    SUB_32CF7.L1                     * 32F38

* refs (2): 32A63 32ACE
* -> D.A = rows in the main display area: the line count at #8069A plus one
LCDRows:
        GOSUB   D1=IRAM~jump_4                   * 32F3C
        D1=(4)  #069A                            * 32F40
        A=DAT1  B                                * 32F46
        C=0     A                                * 32F49
        LC(2)   #3F                              * 32F4B
        C=C&A   B                                * 32F4F
        C=C+1   A                                * 32F53
        D=C     A                                * 32F55
        RTN                                      * 32F57
        ENDLENGTH                                * 32F59

        LENGTH                                   * 32F59  library object without its prolog (its place is the end of the link table before): length, to #354FF
        CON(2)  0                                * 32F5E  no title

* Library 00A: Numeric root finder behind ROOT and the solver. State is a local array of slots: x values at the start, f(x) values #70 nibbles on, 16 nibbles each
LIB00A:
        CON(3)  #00A                             * 32F60  library number
        CON(5)  0                                * 32F63  hash table
        REL(5)  LIB00A.message                   * 32F68  message table
        CON(5)  0                                * 32F6D  link table
        CON(5)  0                                * 32F72  config
        RPL

* refs (8): 1F17D 1F187 1F191 1F19B 1F1A5 1F1AF ...
root:
        :: OVER SAFE@_HERE IT dir?:DNA!          * 32F77
          TRUE 4UNROLL TRUE                      * 32F90

{'nohalt}_32F9F:
          { nohalt } BIND NUMSOLVE ABND ?SKIP    * 32F9F
          :: ERRORSTO CK0NOLASTWD ERRJMP ;       * 32FC2
          ATTN# #<> ?SEMI                        * 32FDB
          CK0NOLASTWD ABORT ;                    * 32FEA

* refs (5): 15630 48B3E 49BD7 9F15D B4BDC
SYMBNUMSOLVE:
        :: FALSE 4UNROLL NUMSOLVE ;              * 32FF9
