* HP 48GX ROM revision R, #9CFFD-#9DA12: Library part 0E3
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~PCunpack
* Follows on from the previous file (at #9CFFD in the original ROM).
        RPL

* ROMPTR 0E3 05C
* refs (1): 99FF5
ROMP_0E3_05C:
        ::                                       * 9CFFD
          TakeOver                               * 9D002
          ROMPTR  0E3 04F                        * 9D007
          BINT2                                  * 9D012
          NTHCOMPDROP                            * 9D017
          COLA_EVAL                              * 9D01C
        ;                                        * 9D021

* ROMPTR 0E3 05D
* refs (1): 99FF5
ROMP_0E3_05D:
        ::                                       * 9D026
          TakeOver                               * 9D02B
          ROMPTR  0E3 04F                        * 9D030
          BINT3                                  * 9D03B
          NTHCOMPDROP                            * 9D040
          COLA_EVAL                              * 9D045
        ;                                        * 9D04A

* ROMPTR 0E3 05E
* refs (1): 99FF5
ROMP_0E3_05E:
        ::                                       * 9D04F
          '                                      * 9D054
          LAM     'PC1                           * 9D059
          STO                                    * 9D068
        ;                                        * 9D06D

* ROMPTR 0E3 05F
* refs (1): 99FF5
ROMP_0E3_05F:
        ::                                       * 9D072
          '                                      * 9D077
          LAM     'PC2                           * 9D07C
          STO                                    * 9D08B
        ;                                        * 9D090

* ROMPTR 0E3 060
* refs (1): 99FF5
ROMP_0E3_060:
        ::                                       * 9D095
          SWAP                                   * 9D09A
          FALSE                                  * 9D09F
          {                                      * 9D0A4

* ROMPTR 0E3 061
* refs (1): 99FF5
ROMP_0E3_061:
            LAM     'PC2                         * 9D0A9

* ROMPTR 0E3 062
* refs (1): 99FF5
ROMP_0E3_062:
            LAM     'PC1                         * 9D0B8
          }                                      * 9D0C7
          BIND                                   * 9D0CC
          CLCD10                                 * 9D0D1
          DUP                                    * 9D0D6
          ROMPTR  0E2 02A                        * 9D0DB
          EQITE                                  * 9D0E6
          ::                                     * 9D0EB
            DROP                                 * 9D0F0
            BINT0                                * 9D0F5
            BINT36                               * 9D0FA
            #       E304                         * 9D0FF  58116
            JstGetTHEMESG                        * 9D109
            $>GROB                               * 9D10E
            XYGROBDISP                           * 9D113
            BINT0                                * 9D118
            BINT21                               * 9D11D
            ROMPTR  0E3 00F                      * 9D122
            CARCOMP                              * 9D12D
            EVAL                                 * 9D132
            ROMPTR  0E3 011                      * 9D137
            SWAP                                 * 9D142
            GETATELN                             * 9D147
            DROP                                 * 9D14C
            PTR     CHR_:                        * 9D151
            >T$                                  * 9D156
            $>GROB                               * 9D15B
            XYGROBDISP                           * 9D160
          ;                                      * 9D165
          ::                                     * 9D16A
            DUP                                  * 9D16F
            LENCOMP                              * 9D174
            DUP                                  * 9D179
            BINT3                                * 9D17E
            #=                                   * 9D183
            ITE                                  * 9D188
            ::                                   * 9D18D
              DROP                               * 9D192
              INCOMPDROP                         * 9D197
              ROMPTR  0E3 063                    * 9D19C  ~PCunpack
              XYGROBDISP                         * 9D1A7
            ;                                    * 9D1AC
            ::                                   * 9D1B1
              SWAP                               * 9D1B6
              BINT21                             * 9D1BB
              BINT1                              * 9D1C0
              DO                                 * 9D1C5
              OVER                               * 9D1CA
              #1+                                * 9D1CF
              BINT1                              * 9D1D4
              DO                                 * 9D1D9
              DUP                                * 9D1DE
              INDEX@                             * 9D1E3
              NTHCOMPDROP                        * 9D1E8
              EVAL                               * 9D1ED
              INCOMPDROP                         * 9D1F2
              ROMPTR  0E3 063                    * 9D1F7  ~PCunpack
              XYGROBDISP                         * 9D202
              SLOW                               * 9D207
              SLOW                               * 9D20C
              SLOW                               * 9D211
              SLOW                               * 9D216
              LOOP                               * 9D21B
              LOOP                               * 9D220
              2DROP                              * 9D225
            ;                                    * 9D22A
          ;                                      * 9D22F
          ClrDAsOK                               * 9D234
          '                                      * 9D239
          ROMPTR  0E3 064                        * 9D23E
          RESOROMP                               * 9D249
          ROMPTR  0E3 066                        * 9D24E
          TRUE                                   * 9D259
          TRUE                                   * 9D25E
          5ROLL                                  * 9D263
          BINT1                                  * 9D268
          FALSE                                  * 9D26D
          '                                      * 9D272
          LAM     'PC1                           * 9D277
          '                                      * 9D286
          ERRJMP                                 * 9D28B
          POLSetUI                               * 9D290
          POLKeyUI                               * 9D295
          ABND                                   * 9D29A
          ClrDAsOK                               * 9D29F
        ;                                        * 9D2A4

* ROMPTR 0E3 063
* refs (1): 99FF5
~PCunpack:
        CODE                                     * 9D2A9  241 nibbles
          GOSBVL  SAVPTR                         * 9D2B3
          A=DAT1  A                              * 9D2BA
          D1=A                                   * 9D2BD
          D1=D1+  5                              * 9D2C0
          A=DAT1  A                              * 9D2C3
          A=A-CON A,9                            * 9D2C6
          R2=A                                   * 9D2CC
          D1=D1+  5                              * 9D2CF
          C=0     A                              * 9D2D2
          C=DAT1  B                              * 9D2D4
          R1=C                                   * 9D2D7
          D1=D1+  2                              * 9D2DA
          A=0     A                              * 9D2DD
          A=DAT1  B                              * 9D2DF
          R0=A                                   * 9D2E2
          D1=D1+  2                              * 9D2E5
          CD1EX                                  * 9D2E8
          RSTK=C                                 * 9D2EB
          GOSBVL  makegrob                       * 9D2ED
          C=RSTK                                 * 9D2F4
          CD0EX                                  * 9D2F6
          D1=C                                   * 9D2F9
          C=C-CON A,15                           * 9D2FC
          C=C-CON A,5                            * 9D302
          R0=C                                   * 9D308
          A=R2                                   * 9D30B
          B=A     A                              * 9D30E
          A=0     A                              * 9D310
L_9D312:
          A=0     S                              * 9D312
L_9D315:
          B=B-1   A                              * 9D315
          GOC     L_9D36D                        * 9D317
          A=DAT0  B                              * 9D31A
          B=B-1   A                              * 9D31D
          B=B-1   A                              * 9D31F
          D0=D0+  2                              * 9D321
          ?ABIT=0 7                              * 9D324
          GOYES   L_9D376                        * 9D329
          ABIT=0  7                              * 9D32B
          C=DAT0  1                              * 9D330
          ?A=0    S                              * 9D334
          GOYES   L_9D345                        * 9D337
          DAT1=C  B                              * 9D339
          D1=D1+  2                              * 9D33C
          A=A-1   B                              * 9D33F
          GOC     L_9D312                        * 9D342
L_9D345:
          CSL     B                              * 9D345
          C=DAT0  1                              * 9D348
          D0=D0+  1                              * 9D34C
L_9D34F:
          A=A-1   B                              * 9D34F
          GOC     L_9D364                        * 9D352
          DAT1=C  B                              * 9D355
          D1=D1+  2                              * 9D358
          A=A-1   B                              * 9D35B
          GONC    L_9D34F                        * 9D35E
          GOC     L_9D312                        * 9D361
L_9D364:
          A=0     S                              * 9D364
          A=A-1   S                              * 9D367
          GOC     L_9D315                        * 9D36A
L_9D36D:
          P=      0                              * 9D36D
          GOVLNG  GPOverWrR0Lp                   * 9D36F
L_9D376:
          B=B-A   A                              * 9D376
          ?A#0    S                              * 9D378
          GOYES   L_9D38D                        * 9D37B
L_9D37D:
          C=DAT0  1                              * 9D37D
          D0=D0+  1                              * 9D381
          CSL     B                              * 9D384
          A=A-1   B                              * 9D387
          GOC     L_9D364                        * 9D38A
L_9D38D:
          C=DAT0  1                              * 9D38D
          D0=D0+  1                              * 9D391
          DAT1=C  B                              * 9D394
          D1=D1+  2                              * 9D397
          A=A-1   B                              * 9D39A
          GONC    L_9D37D                        * 9D39D
          GOTO    L_9D312                        * 9D3A0
        ENDCODE                                  * 9D3A4

* ROMPTR 0E3 064
* refs (1): 99FF5
ROMP_0E3_064:
        ::                                       * 9D3A4
          DA3OK?                                 * 9D3A9
          ?SKIP                                  * 9D3AE
          ::                                     * 9D3B3
            DispMenu                             * 9D3B8
            SetDA3Valid                          * 9D3BD
          ;                                      * 9D3C2
        ;                                        * 9D3C7

* ROMPTR 0E3 065
* refs (1): 99FF5
ROMP_0E3_065:
        ::                                       * 9D3CC
          TRUE                                   * 9D3D1
          ROMPTR  0E3 05E                        * 9D3D6
        ;                                        * 9D3E1

* ROMPTR 0E3 066
* refs (1): 99FF5
ROMP_0E3_066:
        ::                                       * 9D3E6
          BINT1                                  * 9D3EB
          #=casedrop                             * 9D3F0
          ROMPTR  0E3 067                        * 9D3F5
          BINT3                                  * 9D400
          #=casedrop                             * 9D405
          ROMPTR  0E3 068                        * 9D40A
          2DROP                                  * 9D415
          'DoBadKeyT                             * 9D41A
        ;                                        * 9D41F

* ROMPTR 0E3 067
* refs (1): 99FF5
ROMP_0E3_067:
        ::                                       * 9D424
          BINT25                                 * 9D429
          ?CaseRomptr@                           * 9D42E
          ROMPTR  0E3 069                        * 9D433
          BINT45                                 * 9D43E
          ?CaseRomptr@                           * 9D443
          ROMPTR  0E3 06A                        * 9D448
          BINT40                                 * 9D453
          #=casedrop                             * 9D458
          FALSE                                  * 9D45D
          BINT7                                  * 9D462
          #<case                                 * 9D467
          FALSE                                  * 9D46C
          'DoBadKeyT                             * 9D471
        ;                                        * 9D476

* ROMPTR 0E3 068
* refs (1): 99FF5
ROMP_0E3_068:
        ::                                       * 9D47B
          BINT40                                 * 9D480
          #=casedrpfls                           * 9D485
          BINT45                                 * 9D48A
          #=casedrpfls                           * 9D48F
          DROP                                   * 9D494
          'DoBadKeyT                             * 9D499
        ;                                        * 9D49E

* ROMPTR 0E3 069
* refs (1): 99FF5
ROMP_0E3_069:
        ::                                       * 9D4A3
          TakeOver                               * 9D4A8
          ROMPTR  0E3 061                        * 9D4AD
          CARCOMP                                * 9D4B8
          COLA_EVAL                              * 9D4BD
        ;                                        * 9D4C2

* ROMPTR 0E3 06A
* refs (1): 99FF5
ROMP_0E3_06A:
        ::                                       * 9D4C7
          TakeOver                               * 9D4CC
          ROMPTR  0E3 061                        * 9D4D1
          BINT2                                  * 9D4DC
          NTHCOMPDROP                            * 9D4E1
          COLA_EVAL                              * 9D4E6
        ;                                        * 9D4EB

* ROMPTR 0E3 06B
* refs (1): 99FF5
ROMP_0E3_06B:
        ::                                       * 9D4F0
          KILLGDISP                              * 9D4F5
          #       40                             * 9D4FA  64
          #       83                             * 9D504  131
          MAKEGROB                               * 9D50E
          GROB>GDISP                             * 9D513
          HARDBUFF                               * 9D518
          TOTEMPOB                               * 9D51D
          GBUFF                                  * 9D522
          ZEROZERO                               * 9D527
          GROB!                                  * 9D52C
        ;                                        * 9D531

* ROMPTR 0E3 06C
* refs (1): 99FF5
ROMP_0E3_06C:
        ::                                       * 9D536
          3UNROLL                                * 9D53B
          COERCESWAP                             * 9D540
          COERCE                                 * 9D545
          ROMPTR  0E2 015                        * 9D54A
          SWAP                                   * 9D555
          NTHELCOMP                              * 9D55A
          NOTcase                                * 9D55F
          ROMPTR  0E7 007                        * 9D564
          EVAL                                   * 9D56F
          INCOMPDROP                             * 9D574
          4PICK                                  * 9D579
          NTHELCOMP                              * 9D57E
          NOTcase                                * 9D583
          ROMPTR  0E7 007                        * 9D588
          SWAPDROP                               * 9D593
          DUP                                    * 9D598
          4UNROLL                                * 9D59D
          4UNROLL                                * 9D5A2
          EVAL                                   * 9D5A7
          GETATELN                               * 9D5AC
          DROP                                   * 9D5B1
          4UNROLL                                * 9D5B6
          ROT                                    * 9D5BB
          %0=                                    * 9D5C0
          ITE                                    * 9D5C5
          DROP                                   * 9D5CA
          ::                                     * 9D5CF
            KILLGDISP                            * 9D5D4
            #       40                           * 9D5D9  64
            #       83                           * 9D5E3  131
            MAKEGROB                             * 9D5ED
            GROB>GDISP                           * 9D5F2
            BINT3                                * 9D5F7
            NTHCOMPDROP                          * 9D5FC
            EVAL                                 * 9D601
            DUP                                  * 9D606
            ROMPTR  0E2 02A                      * 9D60B
            EQITE                                * 9D616
            ::                                   * 9D61B
              #       E304                       * 9D620  58116
              JstGetTHEMESG                      * 9D62A
              $>GROB                             * 9D62F
              GBUFF                              * 9D634
              BINT0                              * 9D639
              BINT36                             * 9D63E
              GROB!                              * 9D643
              DROP                               * 9D648
              OVER                               * 9D64D
              PTR     CHR_:                      * 9D652
              >T$                                * 9D657
              $>GROB                             * 9D65C
              GBUFF                              * 9D661
              BINT0                              * 9D666
              BINT21                             * 9D66B
            ;                                    * 9D670
            ::                                   * 9D675
              DUPLENCOMP                         * 9D67A
              DUP                                * 9D67F
              #3=                                * 9D684
              ITE_DROP                           * 9D689
              ::                                 * 9D68E
                NTHCOMPDROP                      * 9D693
                EVAL                             * 9D698
              ;                                  * 9D69D
              INCOMPDROP                         * 9D6A2
              ROMPTR  0E3 063                    * 9D6A7  ~PCunpack
              GBUFF                              * 9D6B2
              2SWAP                              * 9D6B7
            ;                                    * 9D6BC
            GROB!                                * 9D6C1
          ;                                      * 9D6C6
          ROMPTR  0E3 046                        * 9D6CB
          COLA_EVAL                              * 9D6D6
        ;                                        * 9D6DB

* ROMPTR 0E3 06D
* refs (1): 99FF5
ROMP_0E3_06D:
        CON(5)  DOARRY                           * 9D6E0  array 4
        LENGTH                                   * 9D6E5  length, to #9D77B
        CON(5)  DOCSTR                           * 9D6EA  element type
        CON(5)  1                                * 9D6EF  dimensions
        CON(5)  4                                * 9D6F4
        $BODY   "Starting Solver"                * 9D6F9  1
        $BODY   " OF "                           * 9D71C  2
        $BODY   "Keyword Conflict"               * 9D729  3
        $BODY   "No Picture Available"           * 9D74E  4
        ENDLENGTH                                * 9D77B

LIB0E3.hash:
        CON(5)  DOHSTR                           * 9D77B  hash table of library 0E3
        LENGTH                                   * 9D780  length, to #9D7DF
        CON(5)  0                                * 9D785  names of length 1
        CON(5)  0                                * 9D78A  names of length 2
        CON(5)  0                                * 9D78F  names of length 3
        CON(5)  0                                * 9D794  names of length 4
        CON(5)  0                                * 9D799  names of length 5
        CON(5)  0                                * 9D79E  names of length 6
        CON(5)  0                                * 9D7A3  names of length 7
        CON(5)  0                                * 9D7A8  names of length 8
        CON(5)  0                                * 9D7AD  names of length 9
        CON(5)  0                                * 9D7B2  names of length 10
        CON(5)  0                                * 9D7B7  names of length 11
        CON(5)  0                                * 9D7BC  names of length 12
        CON(5)  0                                * 9D7C1  names of length 13
        CON(5)  0                                * 9D7C6  names of length 14
        CON(5)  0                                * 9D7CB  names of length 15
        CON(5)  0                                * 9D7D0  names of length 16
        REL(5)  L_9D7DA                          * 9D7D5  end of the names
L_9D7DA:
        CON(5)  0                                * 9D7DA  command 000 has no name
        ENDLENGTH                                * 9D7DF

LIB0E3.link:
        CON(5)  DOHSTR                           * 9D7DF  link table of library 0E3
        LENGTH                                   * 9D7E4  length, to #9DA0F
        REL(5)  ROMP_0E3_000                     * 9D7E9  000 
        REL(5)  ROMP_0E3_001                     * 9D7EE  001 
        REL(5)  ROMP_0E3_002                     * 9D7F3  002 
        REL(5)  ROMP_0E3_003                     * 9D7F8  003 
        REL(5)  ROMP_0E3_004                     * 9D7FD  004 
        REL(5)  ROMP_0E3_005                     * 9D802  005 
        REL(5)  ROMP_0E3_006                     * 9D807  006 
        REL(5)  ROMP_0E3_007                     * 9D80C  007 
        REL(5)  ROMP_0E3_008                     * 9D811  008 
        REL(5)  ROMP_0E3_009                     * 9D816  009 
        REL(5)  ROMP_0E3_00A                     * 9D81B  00A 
        REL(5)  ROMP_0E3_00B                     * 9D820  00B 
        REL(5)  ROMP_0E3_00C                     * 9D825  00C 
        REL(5)  ROMP_0E3_00D                     * 9D82A  00D 
        REL(5)  ROMP_0E3_00E                     * 9D82F  00E 
        REL(5)  ROMP_0E3_00F                     * 9D834  00F 
        REL(5)  ROMP_0E3_010                     * 9D839  010 
        REL(5)  ROMP_0E3_011                     * 9D83E  011 
        REL(5)  ROMP_0E3_012                     * 9D843  012 
        REL(5)  ROMP_0E3_013                     * 9D848  013 
        REL(5)  ROMP_0E3_014                     * 9D84D  014 
        REL(5)  ROMP_0E3_015                     * 9D852  015 
        REL(5)  ROMP_0E3_016                     * 9D857  016 
        REL(5)  ROMP_0E3_017                     * 9D85C  017 
        REL(5)  ROMP_0E3_018                     * 9D861  018 
        REL(5)  ROMP_0E3_019                     * 9D866  019 
        REL(5)  ROMP_0E3_01A                     * 9D86B  01A 
        REL(5)  ROMP_0E3_01B                     * 9D870  01B 
        REL(5)  ROMP_0E3_01C                     * 9D875  01C 
        REL(5)  ROMP_0E3_01D                     * 9D87A  01D 
        REL(5)  ROMP_0E3_01E                     * 9D87F  01E 
        REL(5)  ROMP_0E3_01F                     * 9D884  01F 
        REL(5)  ROMP_0E3_020                     * 9D889  020 
        REL(5)  ROMP_0E3_021                     * 9D88E  021 
        REL(5)  ROMP_0E3_022                     * 9D893  022 
        REL(5)  ROMP_0E3_023                     * 9D898  023 
        REL(5)  ROMP_0E3_024                     * 9D89D  024 
        REL(5)  ROMP_0E3_025                     * 9D8A2  025 
        REL(5)  ROMP_0E3_026                     * 9D8A7  026 
        REL(5)  ROMP_0E3_027                     * 9D8AC  027 
        REL(5)  ROMP_0E3_028                     * 9D8B1  028 
        REL(5)  ROMP_0E3_029                     * 9D8B6  029 
        REL(5)  ROMP_0E3_02A                     * 9D8BB  02A 
        REL(5)  ROMP_0E3_02B                     * 9D8C0  02B 
        REL(5)  ROMP_0E3_02C                     * 9D8C5  02C 
        REL(5)  ROMP_0E3_02D                     * 9D8CA  02D 
        REL(5)  ROMP_0E3_02E                     * 9D8CF  02E 
        REL(5)  ROMP_0E3_02F                     * 9D8D4  02F 
        REL(5)  ROMP_0E3_030                     * 9D8D9  030 
        REL(5)  ROMP_0E3_031                     * 9D8DE  031 
        REL(5)  ROMP_0E3_032                     * 9D8E3  032 
        REL(5)  ROMP_0E3_033                     * 9D8E8  033 
        REL(5)  ROMP_0E3_034                     * 9D8ED  034 
        REL(5)  ROMP_0E3_035                     * 9D8F2  035 
        REL(5)  ROMP_0E3_036                     * 9D8F7  036 
        REL(5)  ROMP_0E3_037                     * 9D8FC  037 
        REL(5)  ROMP_0E3_038                     * 9D901  038 
        REL(5)  ROMP_0E3_039                     * 9D906  039 
        REL(5)  ROMP_0E3_03A                     * 9D90B  03A 
        REL(5)  ROMP_0E3_03B                     * 9D910  03B 
        REL(5)  ROMP_0E3_03C                     * 9D915  03C 
        REL(5)  ROMP_0E3_03D                     * 9D91A  03D 
        REL(5)  ROMP_0E3_03E                     * 9D91F  03E 
        REL(5)  ROMP_0E3_03F                     * 9D924  03F 
        REL(5)  ROMP_0E3_040                     * 9D929  040 
        REL(5)  ROMP_0E3_041                     * 9D92E  041 
        REL(5)  ROMP_0E3_042                     * 9D933  042 
        REL(5)  ROMP_0E3_043                     * 9D938  043 
        REL(5)  ROMP_0E3_044                     * 9D93D  044 
        REL(5)  ROMP_0E3_045                     * 9D942  045 
        REL(5)  ROMP_0E3_046                     * 9D947  046 
        REL(5)  ROMP_0E3_047                     * 9D94C  047 
        REL(5)  ROMP_0E3_048                     * 9D951  048 
        REL(5)  ROMP_0E3_049                     * 9D956  049 
        REL(5)  ROMP_0E3_04A                     * 9D95B  04A 
        REL(5)  ROMP_0E3_04B                     * 9D960  04B 
        REL(5)  ROMP_0E3_04C                     * 9D965  04C 
        REL(5)  ROMP_0E3_04D                     * 9D96A  04D 
        REL(5)  ROMP_0E3_04E                     * 9D96F  04E 
        REL(5)  ROMP_0E3_04F                     * 9D974  04F 
        REL(5)  ROMP_0E3_050                     * 9D979  050 
        REL(5)  ROMP_0E3_051                     * 9D97E  051 
        REL(5)  ROMP_0E3_052                     * 9D983  052 
        REL(5)  ROMP_0E3_053                     * 9D988  053 
        REL(5)  ROMP_0E3_054                     * 9D98D  054 
        REL(5)  ROMP_0E3_055                     * 9D992  055 
        REL(5)  ROMP_0E3_056                     * 9D997  056 
        REL(5)  ROMP_0E3_057                     * 9D99C  057 
        REL(5)  ROMP_0E3_058                     * 9D9A1  058 
        REL(5)  ROMP_0E3_059                     * 9D9A6  059 
        REL(5)  ROMP_0E3_05A                     * 9D9AB  05A 
        REL(5)  ROMP_0E3_05B                     * 9D9B0  05B 
        REL(5)  ROMP_0E3_05C                     * 9D9B5  05C 
        REL(5)  ROMP_0E3_05D                     * 9D9BA  05D 
        REL(5)  ROMP_0E3_05E                     * 9D9BF  05E 
        REL(5)  ROMP_0E3_05F                     * 9D9C4  05F 
        REL(5)  ROMP_0E3_060                     * 9D9C9  060 
        REL(5)  ROMP_0E3_061                     * 9D9CE  061 
        REL(5)  ROMP_0E3_062                     * 9D9D3  062 
        REL(5)  ~PCunpack                        * 9D9D8  063 ~PCunpack
        REL(5)  ROMP_0E3_064                     * 9D9DD  064 
        REL(5)  ROMP_0E3_065                     * 9D9E2  065 
        REL(5)  ROMP_0E3_066                     * 9D9E7  066 
        REL(5)  ROMP_0E3_067                     * 9D9EC  067 
        REL(5)  ROMP_0E3_068                     * 9D9F1  068 
        REL(5)  ROMP_0E3_069                     * 9D9F6  069 
        REL(5)  ROMP_0E3_06A                     * 9D9FB  06A 
        REL(5)  ROMP_0E3_06B                     * 9DA00  06B 
        REL(5)  ROMP_0E3_06C                     * 9DA05  06C 
        REL(5)  ROMP_0E3_06D                     * 9DA0A  06D 
        ENDLENGTH                                * 9DA0F
        NIBHEX  0000                             * 9DA0F  ..
