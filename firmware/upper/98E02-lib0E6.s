* HP 48GX ROM revision R, #98E02-#99FE8: Library part 0E6
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #98E02 in the original ROM).

LIB0E6:
        CON(3)  #0E6                             * 98E02  library number
        REL(5)  LIB0E6.hash                      * 98E05  hash table
        REL(5)  ROMP_0E6_000                     * 98E0A  message table
        REL(5)  LIB0E6.link                      * 98E0F  link table
        CON(5)  0                                * 98E14  config

* ROMPTR 0E6 000
* refs (1): 98E02
ROMP_0E6_000:
        CON(5)  DOARRY                           * 98E19  array 13
        LENGTH                                   * 98E1E  length, to #98FB3
        CON(5)  DOCSTR                           * 98E23  element type
        CON(5)  1                                * 98E28  dimensions
        CON(5)  13                               * 98E2D
        $BODY   "No Solution"                    * 98E32  1
        $BODY   "Many or No Solutions"           * 98E4D  2
        $BODY   "I%YR/PYR ≤ -100"                * 98E7A  3
        $BODY   "Invalid N"                      * 98E9D  4
        $BODY   "Invalid PYR"                    * 98EB4  5
        $BODY   "Invalid #Periods"               * 98ECF  6
        $BODY   "Undefined TVM Variable"         * 98EF4  7
        $BODY   "END mode"                       * 98F25  8
        $BODY   "BEGIN mode"                     * 98F3A  9
        $BODY   " payments/year"                 * 98F53  10
        $BODY   "Principal"                      * 98F74  11
        $BODY   "Interest"                       * 98F8B  12
        $BODY   "Balance"                        * 98FA0  13
        ENDLENGTH                                * 98FB3
        RPL

* ROMPTR 0E6 001
* refs (1): 98E02
TVM~1:
        :: ' ROMPTR 0A9 050 InitMenu ;           * 98FB3

* ROMPTR 0E6 002
* refs (1): 98E02
ROMP_0E6_002:
        :: dIDNTNcase StdMenuKeyLS               * 98FD2
          DUP ROMPTR 0E6 00C SWAP 2DUP XEQSTOID ID>TAG ; * 98FE1

* ROMPTR 0E6 003
* refs (1): 98E02
ROMP_0E6_003:
        :: ROMPTR 0AB 059 # E60D OBJ_15909 ROT # E60B OBJ_15909 ROT # E60C * 9900A  AMORT
          OBJ_15909 ROT ;                        * 9904C

* ROMPTR 0E6 004
* refs (1): 98E02
ROMP_0E6_004:
        :: %0_2A2B4 SWAP ROMPTR 0E6 008 I%YR ROMPTR 0E6 008 PV * 9905B
          ROMPTR 0E6 008 PMT 4ROLL ROMPTR 0E6 008 PYR BINT14 SysITE %1 * 9908A
          %0_2A2B4 ROMPTR 0E6 00E ;              * 990BE

* ROMPTR 0E6 005
* refs (1): 98E02
ROMP_0E6_005:
        :: BINT14 SetSysFlag ;                   * 990D3

* ROMPTR 0E6 006
* refs (1): 98E02
ROMP_0E6_006:
        :: BINT14 ClrSysFlag ;                   * 990E7

* ROMPTR 0E6 007
* refs (1): 98E02
ROMP_0E6_007:
        :: ROMPTR 0E6 008 N ROMPTR 0E6 008 I%YR ROMPTR 0E6 008 PV * 990FB
          ROMPTR 0E6 008 PMT ROMPTR 0E6 008 FV ROMPTR 0E6 008 PYR BINT14 * 99130
          SysITE %1 %0_2A2B4 ;                   * 99165

* ROMPTR 0E6 008
* refs (1): 98E02
ROMP_0E6_008:
        :: 'R SAFE@ ?SKIP %0_2A2B4               * 99179
          DUPTYPEREAL? ?SEMI                     * 99192
          DROP %0_2A2B4 ;                        * 9919C

* ROMPTR 0E6 009
* refs (1): 98E02
ROMP_0E6_009:
        :: 'R XEQSTOID ;                         * 991AB

* ROMPTR 0E6 00A
* refs (1): 98E02
ROMP_0E6_00A:
        :: BINT14 SysITE # E609 # E608 JstGetTHEMESG ROMPTR 0E6 008 PYR %ABS * 991BF
          %IP DUP %0> ?SKIP                      * 991FC
          :: DROP %12 ;                          * 99210
          DUP ROMPTR 0E6 009 PYR EDITDECOMP$ # E60A JstGetTHEMESG !append$ * 99224
          APPprompt2 ;                           * 99252

* ROMPTR 0E6 00B
* refs (1): 98E02
TVMROOT~1:
        :: INNERCOMP #1<> case ROMPTR 0E7 006    * 9925C
          DUPTYPEIDNT? NOTcase ROMPTR 0E7 006    * 9927B
          ROMPTR 0E6 00C ;                       * 99290

* ROMPTR 0E6 00C
* refs (1): 98E02
ROMP_0E6_00C:
        :: OBJ_7D966 NTHOF DUP#0=csedrp          * 992A0
          :: # E607 ERROROUT ; ROMPTR 0E6 00D SWAP NTHCOMPDROP * 992B4
          ROMPTR 0E6 007 8ROLL EVAL ;            * 992E2

* ROMPTR 0E6 00D
* refs (1): 98E02
ROMP_0E6_00D:
        { ROMPTR 0E6 00F ROMPTR 0E6 010 ROMPTR 0E6 011 ROMPTR 0E6 012 * 992FC
          ROMPTR 0E6 013 }                       * 9932D

* ROMPTR 0E6 00E
* refs (1): 98E02
ROMP_0E6_00E:
        CODE                                     * 9933D  619 nibbles
          GOSBVL  SUB_7D9B8                      * 99347
          GOSUB   SUB_993B0                      * 9934E
          GONC    L_9935C                        * 99352
          GOVLNG  L_789C3                        * 99355
L_9935C:
          D1=(5)  #800F5                         * 9935C
          GOSUB   SUB_99394                      * 99363
          GOSUB   SUB_9938E                      * 99367
          R2=A                                   * 9936B
          GOSUB   SUB_9938E                      * 9936E
          R1=A                                   * 99372
          GOSUB   SUB_99394                      * 99375
          GOSUB   SUB_993A2                      * 99379
          A=R1                                   * 9937D
          GOSUB   SUB_993A2                      * 99380
          A=R2                                   * 99384
          GOVLNG  PUSH%LOOP                      * 99387

* refs (2): 99367 9936E
SUB_9938E:
          D1=D1+  16                             * 9938E
          D1=D1+  5                              * 99391

* refs (2): 99363 99375
SUB_99394:
          GOSBVL  GETAB1                         * 99394
          GOVLNG  PACK                           * 9939B

* refs (2): 99379 99380
SUB_993A2:
          GOSBVL  PUSH%                          * 993A2
          GOVLNG  SAVPTR                         * 993A9

* refs (1): 9934E
SUB_993B0:
          HST=0   3                              * 993B0
          GOSBVL  SUB_785CA                      * 993B3
          GOSBVL  STAB0                          * 993BA
          GOSUB   SUB_9950D                      * 993C1
          RTNC                                   * 993C5
          GOSBVL  L_785B2                        * 993C8
          GOSUB   SUB_9950D                      * 993CF
          RTNC                                   * 993D3
          P=      14                             * 993D6
          ?B=0    P                              * 993D8
          GOYES   L_993E0                        * 993DB
          ST=0    8                              * 993DD
L_993E0:
          GOSBVL  RCCD0                          * 993E0
          GOSBVL  RADDF                          * 993E7
          GOSBVL  SUB_78664                      * 993EE
          GOSBVL  SUB_7DA2B                      * 993F5
          RTNC                                   * 993FC
          GOSBVL  SUB_7866A                      * 993FF
          GOSBVL  SUB_785C4                      * 99406
          R4=A                                   * 9940D
          GOSUB   SUB_99534                      * 99410
          GOSBVL  SUB_78676                      * 99414
          GOSBVL  SUB_785BE                      * 9941B
          GOSUB   SUB_99534                      * 99422
          GOSBVL  SUB_78670                      * 99426
          A=0     W                              * 9942D
          B=0     W                              * 99430
          GOSBVL  SUB_7867C                      * 99433
          GOSBVL  PUTAB0                         * 9943A
          GOSBVL  RCAB0                          * 99441
L_99448:
          P=      14                             * 99448
          ?B#0    P                              * 9944A
          GOYES   L_99451                        * 9944D
          RTNCC                                  * 9944F
L_99451:
          GOSBVL  STAB0                          * 99451
          GOSBVL  SUB_785B8                      * 99458
          GOSBVL  GETCD0                         * 9945F
          GOSBVL  MULTF                          * 99466
          GOSUB   SUB_99534                      * 9946D
          ?ST=0   8                              * 99471
          GOYES   L_9947F                        * 99474
          A=0     W                              * 99476
          B=0     W                              * 99479
          ST=0    8                              * 9947C
L_9947F:
          GOSUB   SUB_99574                      * 9947F
          GOSBVL  STAB2                          * 99483
          C=R4                                   * 9948A
          A=C     S                              * 9948D
          GOSBVL  SUB_7861D                      * 99490
          GOSBVL  RADDF                          * 99497
          GOSBVL  SUB_7867C                      * 9949E
          GOSBVL  RCAB2                          * 994A5
          GOSBVL  SUB_78617                      * 994AC
          GOSBVL  RADDF                          * 994B3
          GOSBVL  STAB2                          * 994BA
          GOSBVL  SUB_78623                      * 994C1
          GOSBVL  RADDF                          * 994C8
          GOSBVL  SUB_78682                      * 994CF
          GOSBVL  SUB_78611                      * 994D6
          GOSBVL  RCAB2                          * 994DD
          GOSBVL  RADDF                          * 994E4
          GOSBVL  SUB_78670                      * 994EB
          GOSBVL  SUB_0CA81                      * 994F2
          SETDEC                                 * 994F9
          GOSBVL  RCAB0                          * 994FB
          GOSBVL  RSUB1                          * 99502
          GOTO    L_99448                        * 99509

* refs (2): 993C1 993CF
SUB_9950D:
          GOSUB   SUB_99521                      * 9950D
          GONC    L_99516                        * 99511
L_99514:
          RTNCC                                  * 99514
L_99516:
          P=      0                              * 99516
          LC(5)   #0E606                         * 99518
          RTNSC                                  * 9951F

* refs (1): 9950D
SUB_99521:
          ?A#0    S                              * 99521
          GOYES   L_99514                        * 99524
          C=A     A                              * 99526
          C=C+C   A                              * 99528
          GOC     L_99514                        * 9952A
          GOVLNG  CLRFRC                         * 9952D

* refs (3): 99410 99422 9946D
SUB_99534:
          GOSBVL  CCSB1                          * 99534
          P=      0                              * 9953B
          D0=(5)  #8084E                         * 9953D
          C=DAT0  1                              * 99544
          CSL     B                              * 99548
          D0=(5)  #8084F                         * 9954B
          C=DAT0  1                              * 99552
          CBIT=0  3                              * 99556
          CBIT=0  2                              * 9955B
          ST=0    1                              * 99560
          ST=1    2                              * 99563
          GOSBVL  RNDC[B]                        * 99566
          GOVLNG  CCSB1                          * 9956D

* refs (1): 9947F
SUB_99574:
          P=      14                             * 99574
          ?B=0    P                              * 99576
          GOYES   L_995B0                        * 99579
          C=A     A                              * 9957B
          C=C+C   A                              * 9957D
          C=0     A                              * 9957F
          P=      4                              * 99581
          LC(1)   #2                             * 99583
          GOC     L_9959B                        * 99586
          ?C>A    A                              * 99589
          GOYES   L_995B0                        * 9958C
          B=0     W                              * 9958E
          P=      14                             * 99591
          B=-B-1  WP                             * 99593
          C=C-1   A                              * 99596
          GONC    L_995AC                        * 99598
L_9959B:
          C=-C    A                              * 9959B
          ?C<A    A                              * 9959D
          GOYES   L_995B0                        * 995A0
          B=0     W                              * 995A2
          P=      14                             * 995A5
          B=B+1   P                              * 995A7
          C=C+1   A                              * 995AA
L_995AC:
          A=C     A                              * 995AC
          RTNSC                                  * 995AE
L_995B0:
          RTNCC                                  * 995B0
        ENDCODE                                  * 995B2

* ROMPTR 0E6 00F
* refs (1): 98E02
ROMP_0E6_00F:
        CODE                                     * 995B2  342 nibbles
          GOSBVL  SUB_7D9B8                      * 995BC
          GOSUB   SUB_995DF                      * 995C3
          GONC    L_995D1                        * 995C7
          GOVLNG  L_789C3                        * 995CA
L_995D1:
          GOSBVL  PACK                           * 995D1
          GOVLNG  PUSH%LOOP                      * 995D8

* refs (1): 995C3
SUB_995DF:
          HST=0   3                              * 995DF
          GOSBVL  SUB_785CA                      * 995E2
          GOSBVL  STAB0                          * 995E9
          GOSBVL  SUB_78611                      * 995F0
          GOSBVL  RADDF                          * 995F7
          GOSBVL  SUB_78664                      * 995FE
          GOSBVL  SUB_7DA2B                      * 99605
          RTNC                                   * 9960C
          GOSBVL  STAB2                          * 9960F
          GOSBVL  SUB_7DABE                      * 99616
          GOSBVL  EXAB0                          * 9961D
          GOSBVL  RCCD2                          * 99624
          GOSUB   SUB_9970B                      * 9962B
          GOSBVL  RCCD0                          * 9962F
          C=-C-1  S                              * 99636
          GOSBVL  RADDF                          * 99639
          GOSBVL  SUB_78605                      * 99640
          GOSBVL  XYEX                           * 99647
          GOSBVL  SUB_7DB73                      * 9964E
          RTNC                                   * 99655
          P=      14                             * 99658
          ?B=0    P                              * 9965A
          GOYES   L_9966B                        * 9965D
          GOSBVL  RCCD2                          * 9965F
          ?D#0    P                              * 99666
          GOYES   L_9966D                        * 99669
L_9966B:
          RTNCC                                  * 9966B
L_9966D:
          GOSUB   SUB_9970B                      * 9966D
          ST=1    2                              * 99671
          ?A#0    S                              * 99674
          GOYES   L_996BF                        * 99677
          ST=0    2                              * 99679
          GOSBVL  RCAB2                          * 9967C
          GOSBVL  SUB_78611                      * 99683
          GOSUB   SUB_9970B                      * 9968A
          GOSBVL  RCCD0                          * 9968E
          GOSBVL  RADDF                          * 99695
          GOSBVL  SUB_78605                      * 9969C
          GOSBVL  XYEX                           * 996A3
          GOSBVL  SUB_7DB73                      * 996AA
          RTNC                                   * 996B1
          GOSBVL  RCCD2                          * 996B4
          GOSUB   SUB_9970B                      * 996BB
L_996BF:
          A=-A-1  S                              * 996BF
          GOSUB   SUB_996FD                      * 996C2
          GOC     L_996F6                        * 996C6
          GOSBVL  EXAB2                          * 996C9
          GOSUB   SUB_996FD                      * 996D0
          GOC     L_996F6                        * 996D4
          GOSBVL  RCCD2                          * 996D7
          GOSBVL  XYEX                           * 996DE
          GOSBVL  DIVF                           * 996E5
          ?ST=0   2                              * 996EC
          GOYES   L_996F4                        * 996EF
          A=-A-1  S                              * 996F1
L_996F4:
          RTNCC                                  * 996F4
L_996F6:
          GOVLNG  L_7DB95                        * 996F6

* refs (2): 996C2 996D0
SUB_996FD:
          GOSBVL  L_78DBC                        * 996FD
          GOVLNG  L_7DB4E                        * 99704

* refs (4): 9962B 9966D 9968A 996BB
SUB_9970B:
          GOVLNG  MULTF                          * 9970B
        ENDCODE                                  * 99712

* ROMPTR 0E6 010
* refs (1): 98E02
ROMP_0E6_010:
        CODE                                     * 99712  1551 nibbles
          GOSBVL  SUB_7D9B8                      * 9971C
          GOSUB   SUB_9973F                      * 99723
          GONC    L_99731                        * 99727
          GOVLNG  L_789C3                        * 9972A
L_99731:
          GOSBVL  PACK                           * 99731
          GOVLNG  PUSH%LOOP                      * 99738

* refs (1): 99723
SUB_9973F:
          HST=0   3                              * 9973F
          CSTEX                                  * 99742
          C=0     P                              * 99744
          CSTEX                                  * 99747
          GOSBVL  SUB_78623                      * 99749
          GOSBVL  SUB_7DA74                      * 99750
          RTNC                                   * 99757
          GOSBVL  SUB_785BE                      * 9975A
          GOSBVL  GETCD0                         * 99761
          GOSBVL  STCD2                          * 99768
          ?ST=0   8                              * 9976F
          GOYES   L_99778                        * 99772
          GOSUB   SUB_99D08                      * 99774
L_99778:
          GOSBVL  SUB_78670                      * 99778
          GOSBVL  SUB_785CA                      * 9977F
          ?ST=1   8                              * 99786
          GOYES   L_99793                        * 99789
          GOSUB   SUB_99D01                      * 9978B
          GOSUB   SUB_99D08                      * 9978F
L_99793:
          GOSBVL  SUB_7867C                      * 99793
          GOSBVL  L_785B2                        * 9979A
          P=      14                             * 997A1
          ?B=0    P                              * 997A3
          GOYES   L_997D3                        * 997A6
          ?A#0    S                              * 997A8
          GOYES   L_997D3                        * 997AB
          GOSUB   SUB_99D01                      * 997AD
          ?D=0    P                              * 997B1
          GOYES   L_997FA                        * 997B4
          C=0     W                              * 997B6
          P=      10                             * 997B9
          LC(5)   #99999                         * 997BB
          D=C     W                              * 997C2
          C=C-1   A                              * 997C5
          P=      3                              * 997C7
          GOSBVL  TST15                          * 997C9
          GONC    L_997DE                        * 997D0
L_997D3:
          P=      0                              * 997D3
          LC(5)   #0E604                         * 997D5
          RTNSC                                  * 997DC
L_997DE:
          ?C#A    A                              * 997DE
          GOYES   L_997EE                        * 997E1
          A=0     W                              * 997E3
          B=0     W                              * 997E6
          P=      14                             * 997E9
          B=B+1   P                              * 997EB
L_997EE:
          C=0     A                              * 997EE
          P=      1                              * 997F0
          C=C+1   P                              * 997F2
          ?C<=A   A                              * 997F5
          GOYES   L_997D3                        * 997F8
L_997FA:
          GOSBVL  SUB_78664                      * 997FA
          GOSUB   SUB_99CDE                      * 99801
          C=0     W                              * 99805
          D=0     W                              * 99808
          P=      14                             * 9980B
          D=D+1   P                              * 9980D
          P=      2                              * 99810
          GOSBVL  TST15                          * 99812
          GOC     L_99825                        * 99819
          GOSUB   SUB_99CF3                      * 9981C
          ?B#0    W                              * 99820
          GOYES   L_9986F                        * 99823
L_99825:
          GOSUB   SUB_99A45                      * 99825
          GONC    L_99844                        * 99829
          ?B#0    P                              * 9982C
          GOYES   L_9983D                        * 9982F
          ?D#0    P                              * 99831
          GOYES   L_9983D                        * 99834
          GOVLNG  L_7DB8A                        * 99836
L_9983D:
          GOVLNG  L_7DB95                        * 9983D
L_99844:
          GOSUB   SUB_99D16                      * 99844
          A=-A-1  S                              * 99848
          GOSBVL  EXAB0                          * 9984B
          GOSBVL  1/X15                          * 99852
          GOSUB   SUB_99CFA                      * 99859
          GOSUB   SUB_99CE5                      * 9985D
          GOSBVL  SUB_7DA8D                      * 99861
          RTNC                                   * 99868
          GOTO    L_999EC                        * 9986B
L_9986F:
          GOSUB   SUB_99A01                      * 9986F
          RTNC                                   * 99873
          GOSUB   SUB_99A66                      * 99876
L_9987A:
          GOSBVL  SUB_0CA81                      * 9987A
          SETDEC                                 * 99881
          GOSBVL  SUB_7866A                      * 99883
          GOSUB   SUB_99D1D                      * 9988A
          GOSBVL  SUB_78688                      * 9988E
          GOSBVL  L_785B2                        * 99895
          GOSUB   SUB_99D24                      * 9989C
          GOSBVL  SUB_7860B                      * 998A0
          GOSUB   SUB_99CE5                      * 998A7
          GOSBVL  SUB_7DAE2                      * 998AB
          RTNC                                   * 998B2
          GOSBVL  SUB_78617                      * 998B5
          GOSUB   SUB_99D0F                      * 998BC
          GOSBVL  EXAB0                          * 998C0
          GOSBVL  SUB_78611                      * 998C7
          GOSUB   SUB_99D0F                      * 998CE
          GOSUB   SUB_99CFA                      * 998D2
          GOSUB   SUB_99D08                      * 998D6
          GOSBVL  SUB_78629                      * 998DA
          GOSUB   SUB_99D0F                      * 998E1
          GOSBVL  SUB_78688                      * 998E5
          GOSBVL  SUB_78605                      * 998EC
          GOSBVL  GETAB0                         * 998F3
          GOSBVL  SUB_7DAE2                      * 998FA
          RTNC                                   * 99901
          GOSBVL  SUB_78605                      * 99904
          GOSUB   SUB_99BEF                      * 9990B
          GOSUB   SUB_99CDE                      * 9990F
          GOSBVL  SUB_78629                      * 99913
          GOSBVL  STCD2                          * 9991A
          GOSBVL  SUB_785B8                      * 99921
          GOSUB   SUB_99D1D                      * 99928
          GOSBVL  SUB_78688                      * 9992C
          GOSUB   SUB_99CFA                      * 99933
          GOSUB   SUB_99D0F                      * 99937
          GOSBVL  SUB_78617                      * 9993B
          GOSUB   SUB_99D0F                      * 99942
          GOSUB   SUB_99CDE                      * 99946
          GOSUB   SUB_99CF3                      * 9994A
          GOSBVL  SUB_78605                      * 9994E
          GOSUB   SUB_99D0F                      * 99955
          GOSUB   SUB_99CFA                      * 99959
          GOSUB   SUB_99D08                      * 9995D
          GOSUB   SUB_99D01                      * 99961
          GOSUB   SUB_99CE5                      * 99965
          GOSUB   SUB_999DE                      * 99969
          RTNC                                   * 9996D
          GOSBVL  EXAB2                          * 99970
          GOSBVL  SUB_7861D                      * 99977
          GOSUB   SUB_99CE5                      * 9997E
          A=-A-1  S                              * 99982
          GOSUB   SUB_999DE                      * 99985
          RTNC                                   * 99989
          GOSUB   SUB_99B04                      * 9998C
          RTNC                                   * 99990
          GOSUB   SUB_99B96                      * 99993
          GOC     L_9999E                        * 99997
          GOTO    L_9987A                        * 9999A
L_9999E:
          ?ST=0   6                              * 9999E
          GOYES   L_999DA                        * 999A1
          C=0     W                              * 999A3
          C=C-1   W                              * 999A6
          D=0     W                              * 999A9
          D=C     M                              * 999AC
          D=0     A                              * 999AF
          P=      3                              * 999B1
          GOSBVL  TST15                          * 999B3
          GONC    L_999C4                        * 999BA
          GOVLNG  L_7DA9C                        * 999BD
L_999C4:
          GOSUB   SUB_99D1D                      * 999C4
          GOSUB   SUB_99CFA                      * 999C8
          GOSUB   SUB_99CE5                      * 999CC
          GOSUB   SUB_999DE                      * 999D0
          RTNC                                   * 999D4
          A=-A-1  S                              * 999D7
L_999DA:
          GOTO    L_999F0                        * 999DA

* refs (3): 99969 99985 999D0
SUB_999DE:
          XM=0                                   * 999DE
          GOSUB   SUB_99D16                      * 999E1
          GOVLNG  L_7DB4E                        * 999E5
L_999EC:
          GOSUB   SUB_99D24                      * 999EC
L_999F0:
          A=A+1   A                              * 999F0
          A=A+1   A                              * 999F2
          GOSBVL  SUB_78623                      * 999F4
          GOSUB   SUB_99D0F                      * 999FB
          RTNCC                                  * 999FF

* refs (1): 9986F
SUB_99A01:
          GOSUB   SUB_99A45                      * 99A01
          GONC    L_99A43                        * 99A05
          ?B=0    P                              * 99A08
          GOYES   L_99A2C                        * 99A0B
          ?D=0    P                              * 99A0D
          GOYES   L_99A30                        * 99A10
          GOSBVL  SUB_78617                      * 99A12
          ?C=A    S                              * 99A19
          GOYES   L_99A25                        * 99A1C
          GOVLNG  L_7DB8A                        * 99A1E
L_99A25:
          GOVLNG  L_7DB95                        * 99A25
L_99A2C:
          GOSUB   SUB_99CE5                      * 99A2C
L_99A30:
          GOSBVL  SUB_78617                      * 99A30
          P=      14                             * 99A37
          ?B=0    P                              * 99A39
          GOYES   L_99A25                        * 99A3C
          ?C=A    S                              * 99A3E
          GOYES   L_99A25                        * 99A41
L_99A43:
          RTNCC                                  * 99A43

* refs (2): 99825 99A01
SUB_99A45:
          GOSBVL  SUB_785CA                      * 99A45
          GOSBVL  SUB_78611                      * 99A4C
          P=      14                             * 99A53
          ?D=0    P                              * 99A55
          RTNYES                                 * 99A58
          ?B=0    P                              * 99A5A
          RTNYES                                 * 99A5D
          ?C=A    S                              * 99A5F
          RTNYES                                 * 99A62
          RTN                                    * 99A64

* refs (1): 99876
SUB_99A66:
          ST=0    6                              * 99A66
          GOSBVL  SUB_78611                      * 99A69
          GOSBVL  GETAB0                         * 99A70
          P=      14                             * 99A77
          ?D=0    P                              * 99A79
          GOYES   L_99A83                        * 99A7C
          ?C#A    S                              * 99A7E
          GOYES   L_99A95                        * 99A81
L_99A83:
          GOSBVL  SUB_7DA2B                      * 99A83
          GONC    L_99AD9                        * 99A8A
L_99A8D:
          A=0     W                              * 99A8D
          B=0     W                              * 99A90
          RTNCC                                  * 99A93
L_99A95:
          ST=1    6                              * 99A95
          GOSUB   SUB_99CE5                      * 99A98
          GOSBVL  SUB_7861D                      * 99A9C
          GOSBVL  SUB_7867C                      * 99AA3
          GOSUB   SUB_99CE5                      * 99AAA
          GOSBVL  SUB_78670                      * 99AAE
          GOSBVL  SUB_7DA2B                      * 99AB5
          GOC     L_99A8D                        * 99ABC
          GOSBVL  STAB2                          * 99ABF
          GOSUB   SUB_99D1D                      * 99AC6
          GOSUB   SUB_99D01                      * 99ACA
          C=-C-1  S                              * 99ACE
          GOSUB   SUB_99CE5                      * 99AD1
          GOSUB   SUB_99D16                      * 99AD5
L_99AD9:
          C=A     A                              * 99AD9
          C=C+C   A                              * 99ADB
          GONC    L_99A8D                        * 99ADD
          C=0     A                              * 99AE0
          P=      0                              * 99AE2
          LC(2)   #12                            * 99AE4
          C=C+A   A                              * 99AE8
          GONC    L_99A8D                        * 99AEA
          GOSBVL  SUB_78605                      * 99AED
          D=C     A                              * 99AF4
          C=0     A                              * 99AF6
          P=      0                              * 99AF8
          LC(1)   #2                             * 99AFA
          ?D>C    A                              * 99AFD
          GOYES   L_99A8D                        * 99B00
          RTN                                    * 99B02

* refs (1): 9998C
SUB_99B04:
          GOSUB   SUB_99CDE                      * 99B04
          GOSBVL  SUB_785B8                      * 99B08
          GOSUB   SUB_99D1D                      * 99B0F
          GOSBVL  SUB_78688                      * 99B13
          GOSUB   SUB_99CEC                      * 99B1A
          GOSUB   SUB_99B85                      * 99B1E
          RTNC                                   * 99B22
          GOSUB   SUB_99D01                      * 99B25
          GOSUB   SUB_99D0F                      * 99B29
          ST=1    11                             * 99B2D
          GOSBVL  L_793AD                        * 99B30
          GONC    L_99B41                        * 99B37
          GOVLNG  L_7DA97                        * 99B3A
L_99B41:
          GOSBVL  EXAB0                          * 99B41
          P=      14                             * 99B48
          ?B=0    P                              * 99B4A
          GOYES   L_99B6D                        * 99B4D
          C=A     A                              * 99B4F
          C=C+1   A                              * 99B51
          C=C+C   A                              * 99B53
          GOC     L_99B6D                        * 99B55
          GOSBVL  SUB_78629                      * 99B58
          GOSUB   SUB_99CEC                      * 99B5F
          GOSUB   SUB_99D0F                      * 99B63
          GOSUB   SUB_99D24                      * 99B67
          RTNCC                                  * 99B6B
L_99B6D:
          GOSBVL  SUB_78629                      * 99B6D
          GOSUB   SUB_99D0F                      * 99B74
          GOSBVL  SUB_7860B                      * 99B78
          GOSUB   SUB_99D08                      * 99B7F
          RTNCC                                  * 99B83

* refs (1): 99B1E
SUB_99B85:
          XM=0                                   * 99B85
          GOSBVL  L_78E05                        * 99B88
          GOVLNG  L_7DB4E                        * 99B8F

* refs (1): 99993
SUB_99B96:
          GOSUB   SUB_99CDE                      * 99B96
          GOSBVL  SUB_7860B                      * 99B9A
          C=-C-1  S                              * 99BA1
          GOSUB   SUB_99D08                      * 99BA4
          P=      14                             * 99BA8
          ?B=0    P                              * 99BAA
          GOYES   L_99BE9                        * 99BAD
          GOSUB   SUB_99CFA                      * 99BAF
          ?D=0    P                              * 99BB3
          GOYES   L_99BE3                        * 99BB6
          GOSUB   SUB_99D16                      * 99BB8
          C=A     A                              * 99BBC
          C=C+C   A                              * 99BBE
          GONC    L_99BE3                        * 99BC0
          C=0     A                              * 99BC3
          P=      0                              * 99BC5
          LC(2)   #12                            * 99BC7
          C=C+A   A                              * 99BCB
          GONC    L_99BE9                        * 99BCD
          C=C-1   A                              * 99BD0
          GONC    L_99BE3                        * 99BD2
          CSTEX                                  * 99BD5
          SETHEX                                 * 99BD7
          C=C+1   P                              * 99BD9
          SETDEC                                 * 99BDC
          CSTEX                                  * 99BDE
          GOC     L_99BE9                        * 99BE0
L_99BE3:
          GOSUB   SUB_99CEC                      * 99BE3
          RTNCC                                  * 99BE7
L_99BE9:
          GOSUB   SUB_99CEC                      * 99BE9
          RTNSC                                  * 99BED

* refs (1): 9990B
SUB_99BEF:
          GOSBVL  STCD2                          * 99BEF
          A=-A-1  S                              * 99BF6
          GOSUB   SUB_99D08                      * 99BF9
          GOSBVL  SUB_7860B                      * 99BFD
          GOSBVL  STCD0                          * 99C04
          P=      14                             * 99C0B
          ?B=0    P                              * 99C0D
          GOYES   L_99C3F                        * 99C10
          C=R2                                   * 99C12
          C=A-C   A                              * 99C15
          D=C     A                              * 99C17
          C=0     A                              * 99C19
          P=      5                              * 99C1B
          CPEX    4                              * 99C1D
          ?D<C    A                              * 99C21
          GOYES   L_99C35                        * 99C24
          LC(5)   #99994                         * 99C26
          ?D>C    A                              * 99C2D
          GOYES   L_99C35                        * 99C30
          GONC    L_99C3F                        * 99C32
L_99C35:
          GOSUB   SUB_99CFA                      * 99C35
          GOSUB   SUB_99D16                      * 99C39
          RTNCC                                  * 99C3D
L_99C3F:
          GOSUB   SUB_99CF3                      * 99C3F
          C=0     W                              * 99C43
          P=      14                             * 99C46
          LC(1)   #3                             * 99C48
          R4=C                                   * 99C4B
          D=C     W                              * 99C4E
          C=-C-1  S                              * 99C51
          GOSUB   SUB_99D08                      * 99C54
          C=R4                                   * 99C58
          P=      14                             * 99C5B
          C=C+1   P                              * 99C5D
          D=C     W                              * 99C60
          GOSUB   SUB_99D16                      * 99C63
          GOSUB   SUB_99CFA                      * 99C67
          GOSUB   SUB_99D0F                      * 99C6B
          GOSUB   SUB_99D1D                      * 99C6F
          GOSUB   SUB_99CFA                      * 99C73
          GOSUB   SUB_99D0F                      * 99C77
          GOSUB   SUB_99CDE                      * 99C7B
          GOSUB   SUB_99CF3                      * 99C7F
          C=R4                                   * 99C83
          P=      14                             * 99C86
          C=C-1   P                              * 99C88
          D=C     W                              * 99C8B
          C=-C-1  S                              * 99C8E
          GOSUB   SUB_99D08                      * 99C91
          C=R4                                   * 99C95
          D=C     W                              * 99C98
          GOSUB   SUB_99D16                      * 99C9B
          GOSUB   SUB_99CFA                      * 99C9F
          GOSUB   SUB_99D0F                      * 99CA3
          GOSUB   SUB_99D1D                      * 99CA7
          GOSUB   SUB_99CDE                      * 99CAB
          GOSUB   SUB_99CF3                      * 99CAF
          GOSUB   SUB_99CC4                      * 99CB3
          A=-A-1  S                              * 99CB7
          GOSUB   SUB_99CFA                      * 99CBA
          GOSUB   SUB_99D0F                      * 99CBE
          RTNCC                                  * 99CC2

* refs (1): 99CB3
SUB_99CC4:
          GOSBVL  STAB2                          * 99CC4
          GOSUB   SUB_99D24                      * 99CCB
          GOSUB   SUB_99D01                      * 99CCF
          GOSUB   SUB_99D0F                      * 99CD3
          GOVLNG  DIV2                           * 99CD7

* refs (7): 99801 9990F 99946 99B04 99B96 99C7B ...
SUB_99CDE:
          GOVLNG  STAB0                          * 99CDE

* refs (9): 9985D 998A7 99965 9997E 999CC 99A2C ...
SUB_99CE5:
          GOVLNG  XYEX                           * 99CE5

* refs (4): 99B1A 99B5F 99BE3 99BE9
SUB_99CEC:
          GOVLNG  RCAB0                          * 99CEC

* refs (5): 9981C 9994A 99C3F 99C7F 99CAF
SUB_99CF3:
          GOVLNG  RCAB2                          * 99CF3

* refs (11): 99859 998D2 99933 99959 999C8 99BAF ...
SUB_99CFA:
          GOVLNG  RCCD0                          * 99CFA

* refs (6): 9978B 997AD 99961 99ACA 99B25 99CCF
SUB_99D01:
          GOVLNG  RCCD2                          * 99D01

* refs (9): 99774 9978F 998D6 9995D 99B7F 99BA4 ...
SUB_99D08:
          GOVLNG  RADDF                          * 99D08

* refs (15): 998BC 998CE 998E1 99937 99942 99955 ...
SUB_99D0F:
          GOVLNG  MULTF                          * 99D0F

* refs (7): 99844 999E1 99AD5 99BB8 99C39 99C63 ...
SUB_99D16:
          GOVLNG  DIVF                           * 99D16

* refs (7): 9988A 99928 999C4 99AC6 99B0F 99C6F ...
SUB_99D1D:
          GOVLNG  RADD1                          * 99D1D

* refs (4): 9989C 999EC 99B67 99CCB
SUB_99D24:
          GOVLNG  RSUB1                          * 99D24
        ENDCODE                                  * 99D2B

* ROMPTR 0E6 011
* refs (1): 98E02
ROMP_0E6_011:
        CODE                                     * 99D2B  147 nibbles
          GOSBVL  SUB_7D9B8                      * 99D35
          GOSUB   SUB_99D58                      * 99D3C
          GONC    L_99D4A                        * 99D40
          GOVLNG  L_789C3                        * 99D43
L_99D4A:
          GOSBVL  PACK                           * 99D4A
          GOVLNG  PUSH%LOOP                      * 99D51

* refs (1): 99D3C
SUB_99D58:
          HST=0   3                              * 99D58
          GOSBVL  SUB_7DA1D                      * 99D5B
          RTNC                                   * 99D62
          GOSBVL  SUB_78670                      * 99D65
          GOSBVL  SUB_7DADF                      * 99D6C
          RTNC                                   * 99D73
          GOSBVL  STAB2                          * 99D76
          GOSBVL  RCAB0                          * 99D7D
          GOSBVL  SUB_7861D                      * 99D84
          GOSBVL  MULTF                          * 99D8B
          GOSBVL  STAB0                          * 99D92
          GOSBVL  SUB_785BE                      * 99D99
          GOSBVL  SUB_7DABE                      * 99DA0
          GOSBVL  RCCD2                          * 99DA7
          GOSBVL  MULTF                          * 99DAE
          GOSBVL  RCCD0                          * 99DB5
          C=-C-1  S                              * 99DBC
          GOSBVL  RADDF                          * 99DBF
          RTNCC                                  * 99DC6
        ENDCODE                                  * 99DC8

* ROMPTR 0E6 012
* refs (1): 98E02
ROMP_0E6_012:
        CODE                                     * 99DC8  168 nibbles
          GOSBVL  SUB_7D9B8                      * 99DD2
          GOSUB   SUB_99DF5                      * 99DD9
          GONC    L_99DE7                        * 99DDD
          GOVLNG  L_789C3                        * 99DE0
L_99DE7:
          GOSBVL  PACK                           * 99DE7
          GOVLNG  PUSH%LOOP                      * 99DEE

* refs (1): 99DD9
SUB_99DF5:
          HST=0   3                              * 99DF5
          GOSBVL  SUB_7DA1D                      * 99DF8
          RTNC                                   * 99DFF
          GOSBVL  SUB_78664                      * 99E02
          GOSBVL  SUB_7DADF                      * 99E09
          RTNC                                   * 99E10
          GOSBVL  STAB2                          * 99E13
          GOSBVL  L_785B2                        * 99E1A
          GOSBVL  RADD1                          * 99E21
          GOSBVL  RCCD2                          * 99E28
          GOSBVL  XYEX                           * 99E2F
          ?ST=0   8                              * 99E36
          GOYES   L_99E42                        * 99E39
          GOSBVL  MULTF                          * 99E3B
L_99E42:
          GOSBVL  STAB2                          * 99E42
          GOSBVL  SUB_7861D                      * 99E49
          GOSBVL  RCAB0                          * 99E50
          GOSBVL  MULTF                          * 99E57
          GOSBVL  SUB_78611                      * 99E5E
          GOSBVL  RADDF                          * 99E65
          GOSBVL  RCCD2                          * 99E6C
          GOVLNG  SUB_7DB73                      * 99E73
        ENDCODE                                  * 99E7A

* ROMPTR 0E6 013
* refs (1): 98E02
ROMP_0E6_013:
        CODE                                     * 99E7A  147 nibbles
          GOSBVL  SUB_7D9B8                      * 99E84
          GOSUB   SUB_99EA7                      * 99E8B
          GONC    L_99E99                        * 99E8F
          GOVLNG  L_789C3                        * 99E92
L_99E99:
          GOSBVL  PACK                           * 99E99
          GOVLNG  PUSH%LOOP                      * 99EA0

* refs (1): 99E8B
SUB_99EA7:
          HST=0   3                              * 99EA7
          GOSBVL  SUB_7DA1D                      * 99EAA
          RTNC                                   * 99EB1
          GOSBVL  SUB_78664                      * 99EB4
          GOSBVL  SUB_7DAE2                      * 99EBB
          RTNC                                   * 99EC2
          GOSBVL  STAB2                          * 99EC5
          GOSBVL  RCAB0                          * 99ECC
          GOSBVL  SUB_78611                      * 99ED3
          GOSBVL  MULTF                          * 99EDA
          GOSBVL  STAB0                          * 99EE1
          GOSBVL  L_785B2                        * 99EE8
          GOSBVL  SUB_7DABE                      * 99EEF
          GOSBVL  RCCD2                          * 99EF6
          GOSBVL  MULTF                          * 99EFD
          GOSBVL  RCCD0                          * 99F04
          GOSBVL  RADDF                          * 99F0B
          A=-A-1  S                              * 99F12
          RTNCC                                  * 99F15
        ENDCODE                                  * 99F17

LIB0E6.hash:
        CON(5)  DOHSTR                           * 99F17  hash table of library 0E6
        LENGTH                                   * 99F1C  length, to #99F7B
        CON(5)  0                                * 99F21  names of length 1
        CON(5)  0                                * 99F26  names of length 2
        CON(5)  0                                * 99F2B  names of length 3
        CON(5)  0                                * 99F30  names of length 4
        CON(5)  0                                * 99F35  names of length 5
        CON(5)  0                                * 99F3A  names of length 6
        CON(5)  0                                * 99F3F  names of length 7
        CON(5)  0                                * 99F44  names of length 8
        CON(5)  0                                * 99F49  names of length 9
        CON(5)  0                                * 99F4E  names of length 10
        CON(5)  0                                * 99F53  names of length 11
        CON(5)  0                                * 99F58  names of length 12
        CON(5)  0                                * 99F5D  names of length 13
        CON(5)  0                                * 99F62  names of length 14
        CON(5)  0                                * 99F67  names of length 15
        CON(5)  0                                * 99F6C  names of length 16
        REL(5)  L_99F76                          * 99F71  end of the names
L_99F76:
        CON(5)  0                                * 99F76  command 000 has no name
        ENDLENGTH                                * 99F7B

LIB0E6.link:
        CON(5)  DOHSTR                           * 99F7B  link table of library 0E6
        LENGTH                                   * 99F80  length, to #99FE9
        REL(5)  ROMP_0E6_000                     * 99F85  000 
        REL(5)  TVM~1                            * 99F8A  001 
        REL(5)  ROMP_0E6_002                     * 99F8F  002 
        REL(5)  ROMP_0E6_003                     * 99F94  003 
        REL(5)  ROMP_0E6_004                     * 99F99  004 
        REL(5)  ROMP_0E6_005                     * 99F9E  005 
        REL(5)  ROMP_0E6_006                     * 99FA3  006 
        REL(5)  ROMP_0E6_007                     * 99FA8  007 
        REL(5)  ROMP_0E6_008                     * 99FAD  008 
        REL(5)  ROMP_0E6_009                     * 99FB2  009 
        REL(5)  ROMP_0E6_00A                     * 99FB7  00A 
        REL(5)  TVMROOT~1                        * 99FBC  00B 
        REL(5)  ROMP_0E6_00C                     * 99FC1  00C 
        REL(5)  ROMP_0E6_00D                     * 99FC6  00D 
        REL(5)  ROMP_0E6_00E                     * 99FCB  00E 
        REL(5)  ROMP_0E6_00F                     * 99FD0  00F 
        REL(5)  ROMP_0E6_010                     * 99FD5  010 
        REL(5)  ROMP_0E6_011                     * 99FDA  011 
        REL(5)  ROMP_0E6_012                     * 99FDF  012 
        REL(5)  ROMP_0E6_013                     * 99FE4  013 
