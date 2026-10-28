* HP 48GX ROM revision R, #9CFFD-#9DA12: Library part 0E3
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~PCunpack
* Follows on from the previous file (at #9CFFD in the original ROM).
        RPL

* ROMPTR 0E3 05C
* refs (1): 99FF5
ROMP_0E3_05C:
        :: TakeOver ROMPTR 0E3 04F BINT2 NTHCOMPDROP COLA_EVAL ; * 9CFFD

* ROMPTR 0E3 05D
* refs (1): 99FF5
ROMP_0E3_05D:
        :: TakeOver ROMPTR 0E3 04F BINT3 NTHCOMPDROP COLA_EVAL ; * 9D026

* ROMPTR 0E3 05E
* refs (1): 99FF5
ROMP_0E3_05E:
        :: ' LAM 'PC1 STO ;                      * 9D04F

* ROMPTR 0E3 05F
* refs (1): 99FF5
ROMP_0E3_05F:
        :: ' LAM 'PC2 STO ;                      * 9D072

* ROMPTR 0E3 060
* refs (1): 99FF5
ROMP_0E3_060:
        :: SWAP FALSE                            * 9D095
          {                                      * 9D0A4

* ROMPTR 0E3 061
* refs (1): 99FF5
ROMP_0E3_061:
            LAM 'PC2                             * 9D0A9

* ROMPTR 0E3 062
* refs (1): 99FF5
ROMP_0E3_062:
            LAM 'PC1 }                           * 9D0B8
          BIND CLCD10 DUP ROMPTR 0E2 02A EQITE   * 9D0CC
          :: DROP BINT0 BINT36 # E304 JstGetTHEMESG $>GROB XYGROBDISP BINT0 * 9D0EB
            BINT21 ROMPTR 0E3 00F CARCOMP EVAL ROMPTR 0E3 011 SWAP GETATELN * 9D11D
            DROP PTR CHR_: >T$ $>GROB XYGROBDISP ; * 9D14C
          :: DUP LENCOMP DUP BINT3 #= ITE        * 9D16A
            :: DROP INCOMPDROP ROMPTR 0E3 063 XYGROBDISP ; * 9D18D  ~PCunpack
            :: SWAP BINT21 BINT1 DO OVER #1+ BINT1 DO DUP INDEX@ NTHCOMPDROP * 9D1B1
              EVAL INCOMPDROP ROMPTR 0E3 063 XYGROBDISP SLOW SLOW SLOW SLOW * 9D1ED  ~PCunpack
              LOOP LOOP 2DROP ;                  * 9D21B
          ;                                      * 9D22F
          ClrDAsOK ' ROMPTR 0E3 064 RESOROMP ROMPTR 0E3 066 TRUE TRUE 5ROLL * 9D234
          BINT1 FALSE ' LAM 'PC1 ' ERRJMP POLSetUI POLKeyUI ABND ClrDAsOK ; * 9D268

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
        :: DA3OK? ?SKIP                          * 9D3A4
          :: DispMenu SetDA3Valid ;              * 9D3B3
        ;                                        * 9D3C7

* ROMPTR 0E3 065
* refs (1): 99FF5
ROMP_0E3_065:
        :: TRUE ROMPTR 0E3 05E ;                 * 9D3CC

* ROMPTR 0E3 066
* refs (1): 99FF5
ROMP_0E3_066:
        :: BINT1 #=casedrop ROMPTR 0E3 067       * 9D3E6
          BINT3 #=casedrop ROMPTR 0E3 068        * 9D400
          2DROP 'DoBadKeyT ;                     * 9D415

* ROMPTR 0E3 067
* refs (1): 99FF5
ROMP_0E3_067:
        :: BINT25 ?CaseRomptr@ ROMPTR 0E3 069 BINT45 ?CaseRomptr@ * 9D424
          ROMPTR 0E3 06A BINT40 #=casedrop FALSE * 9D448
          BINT7 #<case FALSE                     * 9D462
          'DoBadKeyT ;                           * 9D471

* ROMPTR 0E3 068
* refs (1): 99FF5
ROMP_0E3_068:
        :: BINT40 #=casedrpfls BINT45            * 9D47B
          #=casedrpfls DROP                      * 9D48F
          'DoBadKeyT ;                           * 9D499

* ROMPTR 0E3 069
* refs (1): 99FF5
ROMP_0E3_069:
        :: TakeOver ROMPTR 0E3 061 CARCOMP COLA_EVAL ; * 9D4A3

* ROMPTR 0E3 06A
* refs (1): 99FF5
ROMP_0E3_06A:
        :: TakeOver ROMPTR 0E3 061 BINT2 NTHCOMPDROP COLA_EVAL ; * 9D4C7

* ROMPTR 0E3 06B
* refs (1): 99FF5
ROMP_0E3_06B:
        :: KILLGDISP # 40 # 83 MAKEGROB GROB>GDISP HARDBUFF TOTEMPOB GBUFF * 9D4F0
          ZEROZERO GROB! ;                       * 9D527

* ROMPTR 0E3 06C
* refs (1): 99FF5
ROMP_0E3_06C:
        :: 3UNROLL COERCESWAP COERCE ROMPTR 0E2 015 SWAP NTHELCOMP NOTcase * 9D536
          ROMPTR 0E7 007                         * 9D564
          EVAL INCOMPDROP 4PICK NTHELCOMP NOTcase ROMPTR 0E7 007 * 9D56F
          SWAPDROP DUP 4UNROLL 4UNROLL EVAL GETATELN DROP 4UNROLL ROT %0= * 9D593
          ITE DROP                               * 9D5C5
          :: KILLGDISP # 40 # 83 MAKEGROB GROB>GDISP BINT3 NTHCOMPDROP EVAL * 9D5CF
            DUP ROMPTR 0E2 02A EQITE             * 9D606
            :: # E304 JstGetTHEMESG $>GROB GBUFF BINT0 BINT36 GROB! DROP * 9D61B
              OVER PTR CHR_: >T$ $>GROB GBUFF BINT0 BINT21 ; * 9D64D
            :: DUPLENCOMP DUP #3= ITE_DROP       * 9D675
              :: NTHCOMPDROP EVAL ; INCOMPDROP ROMPTR 0E3 063 GBUFF 2SWAP ; * 9D68E  ~PCunpack
            GROB! ;                              * 9D6C1
          ROMPTR 0E3 046 COLA_EVAL ;             * 9D6CB

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
