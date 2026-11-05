* HP 48GX ROM revision R, #98E02-#99FE8: Library 0E6: TVM messages, TVM variables and menu support, AMORT and the five TVM solvers in machine code
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: TVMDivChk AMORTRound TVMPvFvSign TVMLn TVMChkInt TVMVal TVMStoVal TVMSolvers TVMSolvePV TVMSolvePMT TVMSolveN TVMSolveKey
* Follows on from the previous file (at #98E02 in the original ROM).

* Library 0E6: Time value of money: the TVM menu's support, TVMROOT, AMORT, and the machine-code solvers for N, I%YR, PV, PMT and FV, with their messages
LIB0E6:
        CON(3)  #0E6                             * 98E02  library number
        REL(5)  LIB0E6.hash                      * 98E05  hash table
        REL(5)  TVMMessages                      * 98E0A  message table
        REL(5)  LIB0E6.link                      * 98E0F  link table
        CON(5)  0                                * 98E14  config

* ROMPTR 0E6 000
* refs (1): 98E02
* Message table of library 0E6: its 13 strings are errors and prompts of the TVM code
TVMMessages:
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
* TVM: shows the TVM menu
TVM~1:
        :: ' XLIB MnuTVMSOLVR InitMenu ;         * 98FB3

* ROMPTR 0E6 002
* refs (1): 98E02
* Menu key action: with a name, solves for that variable, stores the result and leaves it tagged with the name
TVMSolveKey:
        :: dIDNTNcase StdMenuKeyLS               * 98FD2
          DUP XLIB TVMSolve SWAP 2DUP XEQSTOID ID>TAG ; * 98FE1

* ROMPTR 0E6 003
* refs (1): 98E02
* %n -> :Principal: :Interest: :Balance:: AMORT's result, each value tagged
AMORTTagged:
        :: XLIB AMORT # E60D msg>TAG ROT # E60B msg>TAG ROT # E60C msg>TAG * 9900A  "Balance"  "Principal"  "Interest"
          ROT ;                                  * 99051

* ROMPTR 0E6 004
* refs (1): 98E02
* %n -> %principal %interest %balance: pushes the TVM values and runs AMORTCalc
AMORTArgs:
        :: %0_2A2B4 SWAP XLIB TVMVal I%YR XLIB TVMVal PV XLIB TVMVal PMT * 9905B
          4ROLL XLIB TVMVal PYR BINT14 SysITE %1 %0_2A2B4 XLIB AMORTCalc ; * 9909A  flag -14: Payment at end / Payment at begin

* ROMPTR 0E6 005
* refs (1): 98E02
* Sets payments at the start of the period
TVMBegin:
        :: BINT14 SetSysFlag ;                   * 990D3  flag -14: Payment at end / Payment at begin

* ROMPTR 0E6 006
* refs (1): 98E02
* Sets payments at the end of the period
TVMEnd:
        :: BINT14 ClrSysFlag ;                   * 990E7  flag -14: Payment at end / Payment at begin

* ROMPTR 0E6 007
* refs (1): 98E02
* -> %N %I%YR %PV %PMT %FV %PYR %begin: the arguments of a solver, each by TVMVal
TVMArgs:
        :: XLIB TVMVal N XLIB TVMVal I%YR XLIB TVMVal PV XLIB TVMVal PMT * 990FB
          XLIB TVMVal FV XLIB TVMVal PYR BINT14 SysITE %1 %0_2A2B4 ; * 99140  flag -14: Payment at end / Payment at begin

* ROMPTR 0E6 008
* refs (1): 98E02
* -> %: the variable named after this call in the runstream, or 0 if it does not exist or is not a real
TVMVal:
        :: 'R SAFE@ ?SKIP %0_2A2B4               * 99179
          DUPTYPEREAL? ?SEMI                     * 99192
          DROP %0_2A2B4 ;                        * 9919C

* ROMPTR 0E6 009
* refs (1): 98E02
* % -> : stores into the variable named after this call in the runstream
TVMStoVal:
        :: 'R XEQSTOID ;                         * 991AB

* ROMPTR 0E6 00A
* refs (1): 98E02
* Shows the TVM status line: "12 payments/year" and END or BEGIN mode. PYR below 1 shows as 12
TVMPrompt:
        :: BINT14 SysITE # E609 # E608 JstGetTHEMESG XLIB TVMVal PYR %ABS * 991BF  flag -14: Payment at end / Payment at begin  "BEGIN mode"  "END mode"
          %IP DUP %0> ?SKIP                      * 991FC
          :: DROP %12 ;                          * 99210
          DUP XLIB TVMStoVal PYR EDITDECOMP$ # E60A JstGetTHEMESG !append$ * 99224  " payments/year"
          APPprompt2 ;                           * 99252

* ROMPTR 0E6 00B
* refs (1): 98E02
* { name } -> %: TVMROOT: Bad Argument unless it holds one name
TVMROOT~1:
        :: INNERCOMP #1<> case XLIB BadTypeErr   * 9925C
          DUPTYPEIDNT? NOTcase XLIB BadTypeErr   * 9927B
          XLIB TVMSolve ;                        * 99290

* ROMPTR 0E6 00C
* refs (1): 98E02
* name -> %: solves for this variable; error "Undefined TVM Variable" for any other name
TVMSolve:
        :: TvmVars NTHOF DUP#0=csedrp            * 992A0
          :: # E607 ERROROUT ; XLIB TVMSolvers SWAP NTHCOMPDROP XLIB TVMArgs * 992B4  "Undefined TVM Variable"
          8ROLL EVAL ;                           * 992ED

* ROMPTR 0E6 00D
* refs (1): 98E02
* List of the five solvers, in the order of the variable names
TVMSolvers:
        { XLIB TVMSolveN XLIB TVMSolveI XLIB TVMSolvePV XLIB TVMSolvePMT * 992FC
          XLIB TVMSolveFV }                      * 9932D

* ROMPTR 0E6 00E
* refs (1): 98E02
* %n %I %PV %PMT %PYR %begin -> %principal %interest %balance: the code object behind AMORT. Each amount is rounded to the display format (flags -49..-52), as a real loan is
AMORTCalc:
        CODE                                     * 9933D  619 nibbles
          GOSBVL  TvmArgs                        * 99347
          GOSUB   AMORTLoop                      * 9934E
          GONC    AMORTCalc.L1                   * 99352
          GOVLNG  ErrC15                         * 99355
AMORTCalc.L1:
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
* Checks N, sets up the periodic rate and loops over the periods. Carry set with an error number in C on failure
AMORTLoop:
          HST=0   3                              * 993B0
          GOSBVL  RCLtmp4%%                      * 993B3
          GOSBVL  STAB0                          * 993BA
          GOSUB   TVMChkInt                      * 993C1
          RTNC                                   * 993C5
          GOSBVL  RCLtmp0%%                      * 993C8
          GOSUB   TVMChkInt                      * 993CF
          RTNC                                   * 993D3
          P=      14                             * 993D6
          ?B=0    P                              * 993D8
          GOYES   AMORTLoop.L1                   * 993DB
          ST=0    8                              * 993DD
AMORTLoop.L1:
          GOSBVL  RCCD0                          * 993E0
          GOSBVL  RADDF                          * 993E7
          GOSBVL  STOtmp0%%                      * 993EE
          GOSBVL  TvmI                           * 993F5
          RTNC                                   * 993FC
          GOSBVL  STOtmp1%%                      * 993FF
          GOSBVL  RCLtmp3%%                      * 99406
          R4=A                                   * 9940D
          GOSUB   AMORTRound                     * 99410
          GOSBVL  STOtmp3%%                      * 99414
          GOSBVL  RCLtmp2%%                      * 9941B
          GOSUB   AMORTRound                     * 99422
          GOSBVL  STOtmp2%%                      * 99426
          A=0     W                              * 9942D
          B=0     W                              * 99430
          GOSBVL  STOtmp4%%                      * 99433
          GOSBVL  PUTAB0                         * 9943A
          GOSBVL  RCAB0                          * 99441
AMORTLoop.loop2:
          P=      14                             * 99448
          ?B#0    P                              * 9944A
          GOYES   AMORTLoop.L3                   * 9944D
          RTNCC                                  * 9944F
AMORTLoop.L3:
          GOSBVL  STAB0                          * 99451
          GOSBVL  RCLtmp1%%                      * 99458
          GOSBVL  GETCD0                         * 9945F
          GOSBVL  MULTF                          * 99466
          GOSUB   AMORTRound                     * 9946D
          ?ST=0   8                              * 99471
          GOYES   AMORTLoop.L4                   * 99474
          A=0     W                              * 99476
          B=0     W                              * 99479
          ST=0    8                              * 9947C
AMORTLoop.L4:
          GOSUB   AMORTExpLimit                  * 9947F
          GOSBVL  STAB2                          * 99483
          C=R4                                   * 9948A
          A=C     S                              * 9948D
          GOSBVL  RCLCDtmp4%%                    * 99490
          GOSBVL  RADDF                          * 99497
          GOSBVL  STOtmp4%%                      * 9949E
          GOSBVL  RCAB2                          * 994A5
          GOSBVL  RCLCDtmp3%%                    * 994AC
          GOSBVL  RADDF                          * 994B3
          GOSBVL  STAB2                          * 994BA
          GOSBVL  RCLCDtmp5%%                    * 994C1
          GOSBVL  RADDF                          * 994C8
          GOSBVL  STOtmp5%%                      * 994CF
          GOSBVL  RCLCDtmp2%%                    * 994D6
          GOSBVL  RCAB2                          * 994DD
          GOSBVL  RADDF                          * 994E4
          GOSBVL  STOtmp2%%                      * 994EB
          GOSBVL  CkATTNcode                     * 994F2
          SETDEC                                 * 994F9
          GOSBVL  RCAB0                          * 994FB
          GOSBVL  RSUB1                          * 99502
          GOTO    AMORTLoop.loop2                * 99509

* refs (2): 993C1 993CF
* A = % -> carry and error #E606 ("Invalid #Periods") unless it is a non-negative integer
TVMChkInt:
          GOSUB   ?Whole%                        * 9950D
          GONC    TVMChkInt.L2                   * 99511
TVMChkInt.L1:
          RTNCC                                  * 99514
TVMChkInt.L2:
          P=      0                              * 99516
          LC(5)   #0E606                         * 99518
          RTNSC                                  * 9951F

* refs (1): 9950D
* A = % -> carry set if it is a non-negative integer
?Whole%:
          ?A#0    S                              * 99521
          GOYES   TVMChkInt.L1                   * 99524
          C=A     A                              * 99526
          C=C+C   A                              * 99528
          GOC     TVMChkInt.L1                   * 9952A
          GOVLNG  CLRFRC                         * 9952D

* refs (3): 99410 99422 9946D
* AB -> AB rounded to the display format in the system flags
AMORTRound:
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
* AB -> carry set if the exponent is beyond 2000 either way, replacing AB with a value of that size
AMORTExpLimit:
          P=      14                             * 99574
          ?B=0    P                              * 99576
          GOYES   AMORTExpLimit.L3               * 99579
          C=A     A                              * 9957B
          C=C+C   A                              * 9957D
          C=0     A                              * 9957F
          P=      4                              * 99581
          LC(1)   #2                             * 99583
          GOC     AMORTExpLimit.L1               * 99586
          ?C>A    A                              * 99589
          GOYES   AMORTExpLimit.L3               * 9958C
          B=0     W                              * 9958E
          P=      14                             * 99591
          B=-B-1  WP                             * 99593
          C=C-1   A                              * 99596
          GONC    AMORTExpLimit.L2               * 99598
AMORTExpLimit.L1:
          C=-C    A                              * 9959B
          ?C<A    A                              * 9959D
          GOYES   AMORTExpLimit.L3               * 995A0
          B=0     W                              * 995A2
          P=      14                             * 995A5
          B=B+1   P                              * 995A7
          C=C+1   A                              * 995AA
AMORTExpLimit.L2:
          A=C     A                              * 995AC
          RTNSC                                  * 995AE
AMORTExpLimit.L3:
          RTNCC                                  * 995B0
        ENDCODE                                  * 995B2

* ROMPTR 0E6 00F
* refs (1): 98E02
* %%args -> %N: solves for N with logarithms
TVMSolveN:
        CODE                                     * 995B2  342 nibbles
          GOSBVL  TvmArgs                        * 995BC
          GOSUB   TVMCalcN                       * 995C3
          GONC    TVMSolveN.L1                   * 995C7
          GOVLNG  ErrC15                         * 995CA
TVMSolveN.L1:
          GOSBVL  PACK                           * 995D1
          GOVLNG  PUSH%LOOP                      * 995D8

* refs (1): 995C3
* -> AB = N. Carry set with an error number: "No Solution" and "Invalid N" among them
TVMCalcN:
          HST=0   3                              * 995DF
          GOSBVL  RCLtmp4%%                      * 995E2
          GOSBVL  STAB0                          * 995E9
          GOSBVL  RCLCDtmp2%%                    * 995F0
          GOSBVL  RADDF                          * 995F7
          GOSBVL  STOtmp0%%                      * 995FE
          GOSBVL  TvmI                           * 99605
          RTNC                                   * 9960C
          GOSBVL  STAB2                          * 9960F
          GOSBVL  TvmBegin                       * 99616
          GOSBVL  EXAB0                          * 9961D
          GOSBVL  RCCD2                          * 99624
          GOSUB   MULTF~jump_7                   * 9962B
          GOSBVL  RCCD0                          * 9962F
          C=-C-1  S                              * 99636
          GOSBVL  RADDF                          * 99639
          GOSBVL  RCLCDtmp0%%                    * 99640
          GOSBVL  XYEX                           * 99647
          GOSBVL  TvmDiv                         * 9964E
          RTNC                                   * 99655
          P=      14                             * 99658
          ?B=0    P                              * 9965A
          GOYES   TVMCalcN.L1                    * 9965D
          GOSBVL  RCCD2                          * 9965F
          ?D#0    P                              * 99666
          GOYES   TVMCalcN.L2                    * 99669
TVMCalcN.L1:
          RTNCC                                  * 9966B
TVMCalcN.L2:
          GOSUB   MULTF~jump_7                   * 9966D
          ST=1    2                              * 99671
          ?A#0    S                              * 99674
          GOYES   TVMCalcN.L3                    * 99677
          ST=0    2                              * 99679
          GOSBVL  RCAB2                          * 9967C
          GOSBVL  RCLCDtmp2%%                    * 99683
          GOSUB   MULTF~jump_7                   * 9968A
          GOSBVL  RCCD0                          * 9968E
          GOSBVL  RADDF                          * 99695
          GOSBVL  RCLCDtmp0%%                    * 9969C
          GOSBVL  XYEX                           * 996A3
          GOSBVL  TvmDiv                         * 996AA
          RTNC                                   * 996B1
          GOSBVL  RCCD2                          * 996B4
          GOSUB   MULTF~jump_7                   * 996BB
TVMCalcN.L3:
          A=-A-1  S                              * 996BF
          GOSUB   TVMLn                          * 996C2
          GOC     TVMCalcN.L5                    * 996C6
          GOSBVL  EXAB2                          * 996C9
          GOSUB   TVMLn                          * 996D0
          GOC     TVMCalcN.L5                    * 996D4
          GOSBVL  RCCD2                          * 996D7
          GOSBVL  XYEX                           * 996DE
          GOSBVL  DIVF                           * 996E5
          ?ST=0   2                              * 996EC
          GOYES   TVMCalcN.L4                    * 996EF
          A=-A-1  S                              * 996F1
TVMCalcN.L4:
          RTNCC                                  * 996F4
TVMCalcN.L5:
          GOVLNG  TVMSolveI~2.L1                 * 996F6

* refs (2): 996C2 996D0
* AB -> AB = LN(AB), or carry when the argument is out of range
TVMLn:
          GOSBVL  LNP115                         * 996FD
          GOVLNG  TvmGrowth.L3                   * 99704

* refs (4): 9962B 9966D 9968A 996BB
MULTF~jump_7:
          GOVLNG  MULTF                          * 9970B
        ENDCODE                                  * 99712

* ROMPTR 0E6 010
* refs (1): 98E02
* %%args -> %I%YR: solves for the rate by Newton iteration
TVMSolveI:
        CODE                                     * 99712  1551 nibbles
          GOSBVL  TvmArgs                        * 9971C
          GOSUB   TVMCalcI                       * 99723
          GONC    TVMSolveI.L1                   * 99727
          GOVLNG  ErrC15                         * 9972A
TVMSolveI.L1:
          GOSBVL  PACK                           * 99731
          GOVLNG  PUSH%LOOP                      * 99738

* refs (1): 99723
* -> AB = I%YR. Carry set with an error number. Checks N, handles a zero rate, takes a starting value and iterates
TVMCalcI:
          HST=0   3                              * 9973F
          CSTEX                                  * 99742
          C=0     P                              * 99744
          CSTEX                                  * 99747
          GOSBVL  RCLCDtmp5%%                    * 99749
          GOSBVL  TvmCheckPyr                    * 99750
          RTNC                                   * 99757
          GOSBVL  RCLtmp2%%                      * 9975A
          GOSBVL  GETCD0                         * 99761
          GOSBVL  STCD2                          * 99768
          ?ST=0   8                              * 9976F
          GOYES   TVMCalcI.L1                    * 99772
          GOSUB   RADDF~jump_5                   * 99774
TVMCalcI.L1:
          GOSBVL  STOtmp2%%                      * 99778
          GOSBVL  RCLtmp4%%                      * 9977F
          ?ST=1   8                              * 99786
          GOYES   TVMCalcI.L2                    * 99789
          GOSUB   RCCD2~jump_8                   * 9978B
          GOSUB   RADDF~jump_5                   * 9978F
TVMCalcI.L2:
          GOSBVL  STOtmp4%%                      * 99793
          GOSBVL  RCLtmp0%%                      * 9979A
          P=      14                             * 997A1
          ?B=0    P                              * 997A3
          GOYES   TVMCalcI.loop3                 * 997A6
          ?A#0    S                              * 997A8
          GOYES   TVMCalcI.loop3                 * 997AB
          GOSUB   RCCD2~jump_8                   * 997AD
          ?D=0    P                              * 997B1
          GOYES   TVMCalcI.L6                    * 997B4
          C=0     W                              * 997B6
          P=      10                             * 997B9
          LC(5)   #99999                         * 997BB
          D=C     W                              * 997C2
          C=C-1   A                              * 997C5
          P=      3                              * 997C7
          GOSBVL  TST15                          * 997C9
          GONC    TVMCalcI.L4                    * 997D0
TVMCalcI.loop3:
          P=      0                              * 997D3
          LC(5)   #0E604                         * 997D5
          RTNSC                                  * 997DC
TVMCalcI.L4:
          ?C#A    A                              * 997DE
          GOYES   TVMCalcI.L5                    * 997E1
          A=0     W                              * 997E3
          B=0     W                              * 997E6
          P=      14                             * 997E9
          B=B+1   P                              * 997EB
TVMCalcI.L5:
          C=0     A                              * 997EE
          P=      1                              * 997F0
          C=C+1   P                              * 997F2
          ?C<=A   A                              * 997F5
          GOYES   TVMCalcI.loop3                 * 997F8
TVMCalcI.L6:
          GOSBVL  STOtmp0%%                      * 997FA
          GOSUB   STAB0~jump_8                   * 99801
          C=0     W                              * 99805
          D=0     W                              * 99808
          P=      14                             * 9980B
          D=D+1   P                              * 9980D
          P=      2                              * 99810
          GOSBVL  TST15                          * 99812
          GOC     TVMCalcI.L7                    * 99819
          GOSUB   RCAB2~jump_5                   * 9981C
          ?B#0    W                              * 99820
          GOYES   TVMCalcI.L10                   * 99823
TVMCalcI.L7:
          GOSUB   TVMPvFvSign                    * 99825
          GONC    TVMCalcI.L9                    * 99829
          ?B#0    P                              * 9982C
          GOYES   TVMCalcI.L8                    * 9982F
          ?D#0    P                              * 99831
          GOYES   TVMCalcI.L8                    * 99834
          GOVLNG  TVMSolveI~2                    * 99836
TVMCalcI.L8:
          GOVLNG  TVMSolveI~2.L1                 * 9983D
TVMCalcI.L9:
          GOSUB   DIVF~jump_5                    * 99844
          A=-A-1  S                              * 99848
          GOSBVL  EXAB0                          * 9984B
          GOSBVL  1/X15                          * 99852
          GOSUB   RCCD0~jump_8                   * 99859
          GOSUB   XYEX~jump_6                    * 9985D
          GOSBVL  TvmPow                         * 99861
          RTNC                                   * 99868
          GOTO    TVMDivChk.L1                   * 9986B
TVMCalcI.L10:
          GOSUB   TVMRateCases                   * 9986F
          RTNC                                   * 99873
          GOSUB   TVMRateStart                   * 99876
* The iteration: evaluates the TVM equation and its slope at the current rate
TVMCalcI.loop11:
          GOSBVL  CkATTNcode                     * 9987A
          SETDEC                                 * 99881
          GOSBVL  STOtmp1%%                      * 99883
          GOSUB   RADD1~jump_3                   * 9988A
          GOSBVL  STOtmp6%%                      * 9988E
          GOSBVL  RCLtmp0%%                      * 99895
          GOSUB   RSUB1~jump_2                   * 9989C
          GOSBVL  RCLCDtmp1%%                    * 998A0
          GOSUB   XYEX~jump_6                    * 998A7
          GOSBVL  TvmGrowth                      * 998AB
          RTNC                                   * 998B2
          GOSBVL  RCLCDtmp3%%                    * 998B5
          GOSUB   MULTF~jump_8                   * 998BC
          GOSBVL  EXAB0                          * 998C0
          GOSBVL  RCLCDtmp2%%                    * 998C7
          GOSUB   MULTF~jump_8                   * 998CE
          GOSUB   RCCD0~jump_8                   * 998D2
          GOSUB   RADDF~jump_5                   * 998D6
          GOSBVL  RCLCDtmp6%%                    * 998DA
          GOSUB   MULTF~jump_8                   * 998E1
          GOSBVL  STOtmp6%%                      * 998E5
          GOSBVL  RCLCDtmp0%%                    * 998EC
          GOSBVL  GETAB0                         * 998F3
          GOSBVL  TvmGrowth                      * 998FA
          RTNC                                   * 99901
          GOSBVL  RCLCDtmp0%%                    * 99904
          GOSUB   TVMDamp                        * 9990B
          GOSUB   STAB0~jump_8                   * 9990F
          GOSBVL  RCLCDtmp6%%                    * 99913
          GOSBVL  STCD2                          * 9991A
          GOSBVL  RCLtmp1%%                      * 99921
          GOSUB   RADD1~jump_3                   * 99928
          GOSBVL  STOtmp6%%                      * 9992C
          GOSUB   RCCD0~jump_8                   * 99933
          GOSUB   MULTF~jump_8                   * 99937
          GOSBVL  RCLCDtmp3%%                    * 9993B
          GOSUB   MULTF~jump_8                   * 99942
          GOSUB   STAB0~jump_8                   * 99946
          GOSUB   RCAB2~jump_5                   * 9994A
          GOSBVL  RCLCDtmp0%%                    * 9994E
          GOSUB   MULTF~jump_8                   * 99955
          GOSUB   RCCD0~jump_8                   * 99959
          GOSUB   RADDF~jump_5                   * 9995D
          GOSUB   RCCD2~jump_8                   * 99961
          GOSUB   XYEX~jump_6                    * 99965
          GOSUB   TVMDivChk                      * 99969
          RTNC                                   * 9996D
          GOSBVL  EXAB2                          * 99970
          GOSBVL  RCLCDtmp4%%                    * 99977
          GOSUB   XYEX~jump_6                    * 9997E
          A=-A-1  S                              * 99982
          GOSUB   TVMDivChk                      * 99985
          RTNC                                   * 99989
          GOSUB   TVMCompound                    * 9998C
          RTNC                                   * 99990
          GOSUB   TVMConverged                   * 99993
          GOC     TVMCalcI.L12                   * 99997
          GOTO    TVMCalcI.loop11                * 9999A
TVMCalcI.L12:
          ?ST=0   6                              * 9999E
          GOYES   TVMCalcI.L14                   * 999A1
          C=0     W                              * 999A3
          C=C-1   W                              * 999A6
          D=0     W                              * 999A9
          D=C     M                              * 999AC
          D=0     A                              * 999AF
          P=      3                              * 999B1
          GOSBVL  TST15                          * 999B3
          GONC    TVMCalcI.L13                   * 999BA
          GOVLNG  TVMSolveI~1                    * 999BD
TVMCalcI.L13:
          GOSUB   RADD1~jump_3                   * 999C4
          GOSUB   RCCD0~jump_8                   * 999C8
          GOSUB   XYEX~jump_6                    * 999CC
          GOSUB   TVMDivChk                      * 999D0
          RTNC                                   * 999D4
          A=-A-1  S                              * 999D7
TVMCalcI.L14:
          GOTO    TVMDivChk.L2                   * 999DA

* refs (3): 99969 99985 999D0
* AB / CD with an overflow check
TVMDivChk:
          XM=0                                   * 999DE
          GOSUB   DIVF~jump_5                    * 999E1
          GOVLNG  TvmGrowth.L3                   * 999E5
* Convert the periodic rate to I%YR: -1, times 100, times PYR
TVMDivChk.L1:
          GOSUB   RSUB1~jump_2                   * 999EC
TVMDivChk.L2:
          A=A+1   A                              * 999F0
          A=A+1   A                              * 999F2
          GOSBVL  RCLCDtmp5%%                    * 999F4
          GOSUB   MULTF~jump_8                   * 999FB
          RTNCC                                  * 999FF

* refs (1): 9986F
* Picks out the cases with no solution or with many from the signs of PV, PMT and FV. Carry set with an error number
TVMRateCases:
          GOSUB   TVMPvFvSign                    * 99A01
          GONC    TVMRateCases.L4                * 99A05
          ?B=0    P                              * 99A08
          GOYES   TVMRateCases.L2                * 99A0B
          ?D=0    P                              * 99A0D
          GOYES   TVMRateCases.L3                * 99A10
          GOSBVL  RCLCDtmp3%%                    * 99A12
          ?C=A    S                              * 99A19
          GOYES   TVMRateCases.loop1             * 99A1C
          GOVLNG  TVMSolveI~2                    * 99A1E
TVMRateCases.loop1:
          GOVLNG  TVMSolveI~2.L1                 * 99A25
TVMRateCases.L2:
          GOSUB   XYEX~jump_6                    * 99A2C
TVMRateCases.L3:
          GOSBVL  RCLCDtmp3%%                    * 99A30
          P=      14                             * 99A37
          ?B=0    P                              * 99A39
          GOYES   TVMRateCases.loop1             * 99A3C
          ?C=A    S                              * 99A3E
          GOYES   TVMRateCases.loop1             * 99A41
TVMRateCases.L4:
          RTNCC                                  * 99A43

* refs (2): 99825 99A01
* -> carry set if PV or FV is 0 or they have the same sign
TVMPvFvSign:
          GOSBVL  RCLtmp4%%                      * 99A45
          GOSBVL  RCLCDtmp2%%                    * 99A4C
          P=      14                             * 99A53
          ?D=0    P                              * 99A55
          RTNYES                                 * 99A58
          ?B=0    P                              * 99A5A
          RTNYES                                 * 99A5D
          ?C=A    S                              * 99A5F
          RTNYES                                 * 99A62
          RTN                                    * 99A64

* refs (1): 99876
* -> AB = a starting rate from the signs and sizes of PV, PMT and FV
TVMRateStart:
          ST=0    6                              * 99A66
          GOSBVL  RCLCDtmp2%%                    * 99A69
          GOSBVL  GETAB0                         * 99A70
          P=      14                             * 99A77
          ?D=0    P                              * 99A79
          GOYES   TVMRateStart.L1                * 99A7C
          ?C#A    S                              * 99A7E
          GOYES   TVMRateStart.L3                * 99A81
TVMRateStart.L1:
          GOSBVL  TvmI                           * 99A83
          GONC    TVMRateStart.L4                * 99A8A
TVMRateStart.loop2:
          A=0     W                              * 99A8D
          B=0     W                              * 99A90
          RTNCC                                  * 99A93
TVMRateStart.L3:
          ST=1    6                              * 99A95
          GOSUB   XYEX~jump_6                    * 99A98
          GOSBVL  RCLCDtmp4%%                    * 99A9C
          GOSBVL  STOtmp4%%                      * 99AA3
          GOSUB   XYEX~jump_6                    * 99AAA
          GOSBVL  STOtmp2%%                      * 99AAE
          GOSBVL  TvmI                           * 99AB5
          GOC     TVMRateStart.loop2             * 99ABC
          GOSBVL  STAB2                          * 99ABF
          GOSUB   RADD1~jump_3                   * 99AC6
          GOSUB   RCCD2~jump_8                   * 99ACA
          C=-C-1  S                              * 99ACE
          GOSUB   XYEX~jump_6                    * 99AD1
          GOSUB   DIVF~jump_5                    * 99AD5
TVMRateStart.L4:
          C=A     A                              * 99AD9
          C=C+C   A                              * 99ADB
          GONC    TVMRateStart.loop2             * 99ADD
          C=0     A                              * 99AE0
          P=      0                              * 99AE2
          LC(2)   #12                            * 99AE4
          C=C+A   A                              * 99AE8
          GONC    TVMRateStart.loop2             * 99AEA
          GOSBVL  RCLCDtmp0%%                    * 99AED
          D=C     A                              * 99AF4
          C=0     A                              * 99AF6
          P=      0                              * 99AF8
          LC(1)   #2                             * 99AFA
          ?D>C    A                              * 99AFD
          GOYES   TVMRateStart.loop2             * 99B00
          RTN                                    * 99B02

* refs (1): 9998C
* AB = rate -> the compounding factor (1+i)^N and (1+i)^N-1, kept accurate for small i with LNP1 and EXPM
TVMCompound:
          GOSUB   STAB0~jump_8                   * 99B04
          GOSBVL  RCLtmp1%%                      * 99B08
          GOSUB   RADD1~jump_3                   * 99B0F
          GOSBVL  STOtmp6%%                      * 99B13
          GOSUB   RCAB0~jump_3                   * 99B1A
          GOSUB   TVMLnp1                        * 99B1E
          RTNC                                   * 99B22
          GOSUB   RCCD2~jump_8                   * 99B25
          GOSUB   MULTF~jump_8                   * 99B29
          ST=1    11                             * 99B2D
          GOSBVL  Pow15.L8                       * 99B30
          GONC    TVMCompound.L1                 * 99B37
          GOVLNG  TvmPow.L1                      * 99B3A
TVMCompound.L1:
          GOSBVL  EXAB0                          * 99B41
          P=      14                             * 99B48
          ?B=0    P                              * 99B4A
          GOYES   TVMCompound.L2                 * 99B4D
          C=A     A                              * 99B4F
          C=C+1   A                              * 99B51
          C=C+C   A                              * 99B53
          GOC     TVMCompound.L2                 * 99B55
          GOSBVL  RCLCDtmp6%%                    * 99B58
          GOSUB   RCAB0~jump_3                   * 99B5F
          GOSUB   MULTF~jump_8                   * 99B63
          GOSUB   RSUB1~jump_2                   * 99B67
          RTNCC                                  * 99B6B
TVMCompound.L2:
          GOSBVL  RCLCDtmp6%%                    * 99B6D
          GOSUB   MULTF~jump_8                   * 99B74
          GOSBVL  RCLCDtmp1%%                    * 99B78
          GOSUB   RADDF~jump_5                   * 99B7F
          RTNCC                                  * 99B83

* refs (1): 99B1E
* AB -> AB = LNP1(AB), or carry
TVMLnp1:
          XM=0                                   * 99B85
          GOSBVL  LN15                           * 99B88
          GOVLNG  TvmGrowth.L3                   * 99B8F

* refs (1): 99993
* Carry set when the Newton step is small against the rate
TVMConverged:
          GOSUB   STAB0~jump_8                   * 99B96
          GOSBVL  RCLCDtmp1%%                    * 99B9A
          C=-C-1  S                              * 99BA1
          GOSUB   RADDF~jump_5                   * 99BA4
          P=      14                             * 99BA8
          ?B=0    P                              * 99BAA
          GOYES   TVMConverged.L2                * 99BAD
          GOSUB   RCCD0~jump_8                   * 99BAF
          ?D=0    P                              * 99BB3
          GOYES   TVMConverged.L1                * 99BB6
          GOSUB   DIVF~jump_5                    * 99BB8
          C=A     A                              * 99BBC
          C=C+C   A                              * 99BBE
          GONC    TVMConverged.L1                * 99BC0
          C=0     A                              * 99BC3
          P=      0                              * 99BC5
          LC(2)   #12                            * 99BC7
          C=C+A   A                              * 99BCB
          GONC    TVMConverged.L2                * 99BCD
          C=C-1   A                              * 99BD0
          GONC    TVMConverged.L1                * 99BD2
          CSTEX                                  * 99BD5
          SETHEX                                 * 99BD7
          C=C+1   P                              * 99BD9
          SETDEC                                 * 99BDC
          CSTEX                                  * 99BDE
          GOC     TVMConverged.L2                * 99BE0
TVMConverged.L1:
          GOSUB   RCAB0~jump_3                   * 99BE3
          RTNCC                                  * 99BE7
TVMConverged.L2:
          GOSUB   RCAB0~jump_3                   * 99BE9
          RTNSC                                  * 99BED

* refs (1): 9990B
* Limits or damps a Newton step
TVMDamp:
          GOSBVL  STCD2                          * 99BEF
          A=-A-1  S                              * 99BF6
          GOSUB   RADDF~jump_5                   * 99BF9
          GOSBVL  RCLCDtmp1%%                    * 99BFD
          GOSBVL  STCD0                          * 99C04
          P=      14                             * 99C0B
          ?B=0    P                              * 99C0D
          GOYES   TVMDamp.L2                     * 99C10
          C=R2                                   * 99C12
          C=A-C   A                              * 99C15
          D=C     A                              * 99C17
          C=0     A                              * 99C19
          P=      5                              * 99C1B
          CPEX    4                              * 99C1D
          ?D<C    A                              * 99C21
          GOYES   TVMDamp.L1                     * 99C24
          LC(5)   #99994                         * 99C26
          ?D>C    A                              * 99C2D
          GOYES   TVMDamp.L1                     * 99C30
          GONC    TVMDamp.L2                     * 99C32
TVMDamp.L1:
          GOSUB   RCCD0~jump_8                   * 99C35
          GOSUB   DIVF~jump_5                    * 99C39
          RTNCC                                  * 99C3D
TVMDamp.L2:
          GOSUB   RCAB2~jump_5                   * 99C3F
          C=0     W                              * 99C43
          P=      14                             * 99C46
          LC(1)   #3                             * 99C48
          R4=C                                   * 99C4B
          D=C     W                              * 99C4E
          C=-C-1  S                              * 99C51
          GOSUB   RADDF~jump_5                   * 99C54
          C=R4                                   * 99C58
          P=      14                             * 99C5B
          C=C+1   P                              * 99C5D
          D=C     W                              * 99C60
          GOSUB   DIVF~jump_5                    * 99C63
          GOSUB   RCCD0~jump_8                   * 99C67
          GOSUB   MULTF~jump_8                   * 99C6B
          GOSUB   RADD1~jump_3                   * 99C6F
          GOSUB   RCCD0~jump_8                   * 99C73
          GOSUB   MULTF~jump_8                   * 99C77
          GOSUB   STAB0~jump_8                   * 99C7B
          GOSUB   RCAB2~jump_5                   * 99C7F
          C=R4                                   * 99C83
          P=      14                             * 99C86
          C=C-1   P                              * 99C88
          D=C     W                              * 99C8B
          C=-C-1  S                              * 99C8E
          GOSUB   RADDF~jump_5                   * 99C91
          C=R4                                   * 99C95
          D=C     W                              * 99C98
          GOSUB   DIVF~jump_5                    * 99C9B
          GOSUB   RCCD0~jump_8                   * 99C9F
          GOSUB   MULTF~jump_8                   * 99CA3
          GOSUB   RADD1~jump_3                   * 99CA7
          GOSUB   STAB0~jump_8                   * 99CAB
          GOSUB   RCAB2~jump_5                   * 99CAF
          GOSUB   TVMHalfDiff                    * 99CB3
          A=-A-1  S                              * 99CB7
          GOSUB   RCCD0~jump_8                   * 99CBA
          GOSUB   MULTF~jump_8                   * 99CBE
          RTNCC                                  * 99CC2

* refs (1): 99CB3
* AB CD -> (AB-1)*CD/2
TVMHalfDiff:
          GOSBVL  STAB2                          * 99CC4
          GOSUB   RSUB1~jump_2                   * 99CCB
          GOSUB   RCCD2~jump_8                   * 99CCF
          GOSUB   MULTF~jump_8                   * 99CD3
          GOVLNG  DIV2                           * 99CD7

* refs (7): 99801 9990F 99946 99B04 99B96 99C7B ...
STAB0~jump_8:
          GOVLNG  STAB0                          * 99CDE

* refs (9): 9985D 998A7 99965 9997E 999CC 99A2C ...
XYEX~jump_6:
          GOVLNG  XYEX                           * 99CE5

* refs (4): 99B1A 99B5F 99BE3 99BE9
RCAB0~jump_3:
          GOVLNG  RCAB0                          * 99CEC

* refs (5): 9981C 9994A 99C3F 99C7F 99CAF
RCAB2~jump_5:
          GOVLNG  RCAB2                          * 99CF3

* refs (11): 99859 998D2 99933 99959 999C8 99BAF ...
RCCD0~jump_8:
          GOVLNG  RCCD0                          * 99CFA

* refs (6): 9978B 997AD 99961 99ACA 99B25 99CCF
RCCD2~jump_8:
          GOVLNG  RCCD2                          * 99D01

* refs (9): 99774 9978F 998D6 9995D 99B7F 99BA4 ...
RADDF~jump_5:
          GOVLNG  RADDF                          * 99D08

* refs (15): 998BC 998CE 998E1 99937 99942 99955 ...
MULTF~jump_8:
          GOVLNG  MULTF                          * 99D0F

* refs (7): 99844 999E1 99AD5 99BB8 99C39 99C63 ...
DIVF~jump_5:
          GOVLNG  DIVF                           * 99D16

* refs (7): 9988A 99928 999C4 99AC6 99B0F 99C6F ...
RADD1~jump_3:
          GOVLNG  RADD1                          * 99D1D

* refs (4): 9989C 999EC 99B67 99CCB
RSUB1~jump_2:
          GOVLNG  RSUB1                          * 99D24
        ENDCODE                                  * 99D2B

* ROMPTR 0E6 011
* refs (1): 98E02
* %%args -> %PV
TVMSolvePV:
        CODE                                     * 99D2B  147 nibbles
          GOSBVL  TvmArgs                        * 99D35
          GOSUB   TVMCalcPV                      * 99D3C
          GONC    TVMSolvePV.L1                  * 99D40
          GOVLNG  ErrC15                         * 99D43
TVMSolvePV.L1:
          GOSBVL  PACK                           * 99D4A
          GOVLNG  PUSH%LOOP                      * 99D51

* refs (1): 99D3C
* -> AB = PV, from the compounding factors
TVMCalcPV:
          HST=0   3                              * 99D58
          GOSBVL  TvmI%                          * 99D5B
          RTNC                                   * 99D62
          GOSBVL  STOtmp2%%                      * 99D65
          GOSBVL  SUB_7DADF                      * 99D6C
          RTNC                                   * 99D73
          GOSBVL  STAB2                          * 99D76
          GOSBVL  RCAB0                          * 99D7D
          GOSBVL  RCLCDtmp4%%                    * 99D84
          GOSBVL  MULTF                          * 99D8B
          GOSBVL  STAB0                          * 99D92
          GOSBVL  RCLtmp2%%                      * 99D99
          GOSBVL  TvmBegin                       * 99DA0
          GOSBVL  RCCD2                          * 99DA7
          GOSBVL  MULTF                          * 99DAE
          GOSBVL  RCCD0                          * 99DB5
          C=-C-1  S                              * 99DBC
          GOSBVL  RADDF                          * 99DBF
          RTNCC                                  * 99DC6
        ENDCODE                                  * 99DC8

* ROMPTR 0E6 012
* refs (1): 98E02
* %%args -> %PMT
TVMSolvePMT:
        CODE                                     * 99DC8  168 nibbles
          GOSBVL  TvmArgs                        * 99DD2
          GOSUB   TVMCalcPMT                     * 99DD9
          GONC    TVMSolvePMT.L1                 * 99DDD
          GOVLNG  ErrC15                         * 99DE0
TVMSolvePMT.L1:
          GOSBVL  PACK                           * 99DE7
          GOVLNG  PUSH%LOOP                      * 99DEE

* refs (1): 99DD9
* -> AB = PMT, from the compounding factors
TVMCalcPMT:
          HST=0   3                              * 99DF5
          GOSBVL  TvmI%                          * 99DF8
          RTNC                                   * 99DFF
          GOSBVL  STOtmp0%%                      * 99E02
          GOSBVL  SUB_7DADF                      * 99E09
          RTNC                                   * 99E10
          GOSBVL  STAB2                          * 99E13
          GOSBVL  RCLtmp0%%                      * 99E1A
          GOSBVL  RADD1                          * 99E21
          GOSBVL  RCCD2                          * 99E28
          GOSBVL  XYEX                           * 99E2F
          ?ST=0   8                              * 99E36
          GOYES   TVMCalcPMT.L1                  * 99E39
          GOSBVL  MULTF                          * 99E3B
TVMCalcPMT.L1:
          GOSBVL  STAB2                          * 99E42
          GOSBVL  RCLCDtmp4%%                    * 99E49
          GOSBVL  RCAB0                          * 99E50
          GOSBVL  MULTF                          * 99E57
          GOSBVL  RCLCDtmp2%%                    * 99E5E
          GOSBVL  RADDF                          * 99E65
          GOSBVL  RCCD2                          * 99E6C
          GOVLNG  TvmDiv                         * 99E73
        ENDCODE                                  * 99E7A

* ROMPTR 0E6 013
* refs (1): 98E02
* %%args -> %FV
TVMSolveFV:
        CODE                                     * 99E7A  147 nibbles
          GOSBVL  TvmArgs                        * 99E84
          GOSUB   TVMCalcFV                      * 99E8B
          GONC    TVMSolveFV.L1                  * 99E8F
          GOVLNG  ErrC15                         * 99E92
TVMSolveFV.L1:
          GOSBVL  PACK                           * 99E99
          GOVLNG  PUSH%LOOP                      * 99EA0

* refs (1): 99E8B
* -> AB = FV, from the compounding factors
TVMCalcFV:
          HST=0   3                              * 99EA7
          GOSBVL  TvmI%                          * 99EAA
          RTNC                                   * 99EB1
          GOSBVL  STOtmp0%%                      * 99EB4
          GOSBVL  TvmGrowth                      * 99EBB
          RTNC                                   * 99EC2
          GOSBVL  STAB2                          * 99EC5
          GOSBVL  RCAB0                          * 99ECC
          GOSBVL  RCLCDtmp2%%                    * 99ED3
          GOSBVL  MULTF                          * 99EDA
          GOSBVL  STAB0                          * 99EE1
          GOSBVL  RCLtmp0%%                      * 99EE8
          GOSBVL  TvmBegin                       * 99EEF
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
        REL(5)  LIB0E6.hash.L1                   * 99F71  end of the names
LIB0E6.hash.L1:
        CON(5)  0                                * 99F76  command 000 has no name
        ENDLENGTH                                * 99F7B

LIB0E6.link:
        CON(5)  DOHSTR                           * 99F7B  link table of library 0E6
        LENGTH                                   * 99F80  length, to #99FE9
        REL(5)  TVMMessages                      * 99F85  000 
        REL(5)  TVM~1                            * 99F8A  001 
        REL(5)  TVMSolveKey                      * 99F8F  002 
        REL(5)  AMORTTagged                      * 99F94  003 
        REL(5)  AMORTArgs                        * 99F99  004 
        REL(5)  TVMBegin                         * 99F9E  005 
        REL(5)  TVMEnd                           * 99FA3  006 
        REL(5)  TVMArgs                          * 99FA8  007 
        REL(5)  TVMVal                           * 99FAD  008 
        REL(5)  TVMStoVal                        * 99FB2  009 
        REL(5)  TVMPrompt                        * 99FB7  00A 
        REL(5)  TVMROOT~1                        * 99FBC  00B 
        REL(5)  TVMSolve                         * 99FC1  00C 
        REL(5)  TVMSolvers                       * 99FC6  00D 
        REL(5)  AMORTCalc                        * 99FCB  00E 
        REL(5)  TVMSolveN                        * 99FD0  00F 
        REL(5)  TVMSolveI                        * 99FD5  010 
        REL(5)  TVMSolvePV                       * 99FDA  011 
        REL(5)  TVMSolvePMT                      * 99FDF  012 
        REL(5)  TVMSolveFV                       * 99FE4  013 
