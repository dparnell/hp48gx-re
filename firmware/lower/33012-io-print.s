* HP 48GX ROM revision R, #33012-#34005: Numeric root finder: the engine of ROOT and the solver (library 00A), bracket search and secant steps
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: RootEvalF RootVal>Var RootExtremum RootBadGuess RootZero RootExit NUMSOLVE RootSignRev RootEvalErr RootConstant {<E>} Code_33E7F
* Follows on from the previous file (at #33012 in the original ROM).
        RPL

* refs (3): 3312F 33139 33143
NUMSOLVE~1:
        :: 2DUP %<> case %MAXorder               * 33012
          DROPRDROP GOTO NUMSOLVE~2 ;            * 3302B

* refs (2): 32FB3 33008
NUMSOLVE:
        :: DEPTH #4-                             * 3303F

{<E>}:
          { BINT14 } %0_2A2B4 MAKEARRY FALSE     * 3304E

* -> {}
7NULLLAM{}:
          { NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM } BIND * 3306C
          4GETLAM DUPTYPELIST? ?SKIP ONE{}N      * 3309E
          DUPNULLCOMP? ?GOTO RootEvalF~1.L1 DUPDUP {}>%sBIND 2GETLAM * 330B2
          1ABNDSWAP DUPTYPEEXT? ITE              * 330D0
          :: 5GETLAM XEQSTOID ; DROP             * 330DF
          DUPLENCOMP NUMSOLVE~25 ?GOTO RootEvalF~1.L1 INNERCOMP DUP#1= IT * 330F8
          OVERSWAP                               * 3311B
          #3= NOT?GOTO NUMSOLVE~2 NUMSOLVE~1 ROT NUMSOLVE~1 3UNROLL * 33120
          NUMSOLVE~1 SWAP RootX4! RootX5! RootX3! RootEvalF BINT35 RootCopy * 33143
          BINT53 RootCopy NUMSOLVE~5 RootInitState BINT2 RootSlotSet? ?GOTO * 3316B
          7NULLLAM{}.L1 BINT18 RootCopy GOTO NUMSOLVE~2.L1 * 3318E
7NULLLAM{}.L1:
          RootEvalF NUMSOLVE~5 RootX4 BINT67 RootCopy RootX3! RootEvalF * 331A7
          NUMSOLVE~5 RootSet3? ?GOTO 7NULLLAM{}.L2 BINT83 RootCopy GOTO * 331CA
          NUMSOLVE~2.loop2                       * 331ED
7NULLLAM{}.L2:
          BINT4 RootSlotSet? ?GOTO 7NULLLAM{}.L3 RootF2 RootF3 NUMSOLVE~18 * 331F2
          NOT?GOTO NUMSOLVE~2.loop4 BINT101 RootCopy BINT83 RootCopy BINT1 * 33215
          RootCopy BINT18 RootCopy BINT36 RootCopy GOTO NUMSOLVE~2.L28 * 33238
7NULLLAM{}.L3:
          RootF2 RootF4 %<> ?GOTO 7NULLLAM{}.L4 RootF4 RootF3 %<> ?GOTO * 3325B
          NUMSOLVE~2.L15 GOTO NUMSOLVE~2.loop4   * 33288
7NULLLAM{}.L4:
          RootF2 RootF4 NUMSOLVE~18 ?GOTO NUMSOLVE~2.loop20 RootF2 %ABS * 33297
          RootF4 %ABS %> ?GOTO NUMSOLVE~2.L15 RootF3 RootF4 2DUP NUMSOLVE~18 * 332BA
          ?GOTO NUMSOLVE~2.L19 %ABS SWAP %ABS %> ?GOTO 7NULLLAM{}.L5 * 332E7
          RootFlipDir GOTO NUMSOLVE~2.L11        * 3330F
7NULLLAM{}.L5:
          RootF2 %ABS RootF3 %ABS %>= ?GOTO NUMSOLVE~2.loop10 RootFlipDir * 3331E
          GOTO NUMSOLVE~2.L11 DUP RootNudge      * 33346
NUMSOLVE~2:
          2DUP %= IT RootNudge                   * 3335A
          %MAXorder SWAP RootX4! RootX3! RootInitState * 3336E
NUMSOLVE~2.L1:
          RootEvalF BINT35 RootCopy BINT52 RootCopy RootEvalF BINT67 * 33387
          RootCopy NUMSOLVE~5 BINT2 RootSlotSet? ?GOTO NUMSOLVE~2.loop2 * 333AA
          BINT4 RootSlotSet? NOT?GOTO RootBadGuess RootFlipDir * 333C8
NUMSOLVE~2.loop2:
          BINT4 RootSlotSet? ?GOTO NUMSOLVE~2.L5 RootShow24 BINT84 RootCopy * 333E1
          BINT36 NUMSOLVE~14 NOT?GOTO NUMSOLVE~2.L3 RootX3! RootEvalF * 33404
          NUMSOLVE~6 BINT67 RootCopy GOTO NUMSOLVE~2.loop2 * 33422
NUMSOLVE~2.L3:
          DROP BINT101 RootCopy BINT33 NUMSOLVE~15 NOT?GOTO RootBadGuess * 3343B
          RootX3! RootEvalF NUMSOLVE~6 BINT66 RootCopy BINT35 RootCopy * 3345E
          RootFlipDir RootSet3? ?GOTO NUMSOLVE~2.L5 RootShow24 GOTO * 33481
          RootBadGuess                           * 3349F
NUMSOLVE~2.loop4:
          BINT67 RootCopy NUMSOLVE~13 IT RootFlipDir * 334A4
NUMSOLVE~2.L5:
          RootF4 RootF2 %<> ?GOTO NUMSOLVE~2.L9 RootShow24 * 334BD
NUMSOLVE~2.loop6:
          RootX4 RootX2 NUMSOLVE~23 BINT4 BINT5 OBJ_344C7 ?GOTO * 334DB
          NUMSOLVE~2.L8 DROP                     * 334FE
NUMSOLVE~2.loop7:
          BINT69 NUMSOLVE~14 ?GOTO NUMSOLVE~2.L8 DROP NUMSOLVE~13 NOT?GOTO * 33508
          RootConstant BINT101 RootCopy RootFlipDir GOTO NUMSOLVE~2.loop6 * 3352B
NUMSOLVE~2.L8:
          RootX3! RootEvalF NUMSOLVE~7 RootSet3? ?GOTO NUMSOLVE~2.loop4 * 33549
          BINT83 RootCopy RootShow25 GOTO NUMSOLVE~2.loop7 * 33567
NUMSOLVE~2.L9:
          RootF4 RootF2 OVER %ABS OVER %ABS %< ?SKIP RootFlipDir * 33580
          NUMSOLVE~18 ?GOTO NUMSOLVE~2.loop20 GOTO NUMSOLVE~2.L11 * 335AD
NUMSOLVE~2.loop10:
          BINT36 RootCopy BINT67 RootCopy        * 335C6
NUMSOLVE~2.L11:
          RootShow24 BINT7 4PUTLAM BINT18 RootCopy RootX4 RootX2 RootF2 * 335DA
          RootF4 NUMSOLVE~22 BINT4 BINT5 OBJ_344C7 ?GOTO NUMSOLVE~2.loop12 * 33602
          #5= ?GOTO NUMSOLVE~2.L14 BINT69 NUMSOLVE~15 NOT?GOTO RootExtremum * 33625
NUMSOLVE~2.loop12:
          %0_2A2B4 BINT4 BINT5 NUMSOLVE~24 RootX3! RootEvalF NUMSOLVE~8 * 33648
NUMSOLVE~2.loop13:
          RootSet3? ?GOTO NUMSOLVE~2.L16 BINT83 RootCopy RootShow25 * 3366B
NUMSOLVE~2.L14:
          BINT69 NUMSOLVE~14 ?GOTO NUMSOLVE~2.loop12 DROP GOTO RootExtremum * 33689
NUMSOLVE~2.L15:
          BINT7 4PUTLAM                          * 336AC
NUMSOLVE~2.L16:
          RootF3 RootF4 2DUP NUMSOLVE~18 ?GOTO NUMSOLVE~2.L19 %ABS SWAP %ABS * 336B6
          %>= ?GOTO NUMSOLVE~2.loop10 4GETLAM #1- DUP#0= ?GOTO RootExit.L1 * 336E3
          4PUTLAM BINT83 RootCopy RootShow25 RootFlipDir NUMSOLVE~4 * 3370B
          RootFlipDir 3UNROLL 5ROLL SWAP RootX4 %>%% 6UNROLL NUMSOLVE~20 * 33729
          BINT1 BINT5 OBJ_344C7 NOT?GOTO RootExit.L1 DUP RootX4 %= ?GOTO * 33751
          NUMSOLVE~2.L18 DUP RootX4 1GETLAM ITE %< %> * 3377E
          ?GOTO NUMSOLVE~2.loop17 BINT36 RootCopy BINT69 RootCopy * 337A1
          RootFlipDir                            * 337BF
NUMSOLVE~2.loop17:
          RootX3! RootEvalF NUMSOLVE~9 GOTO NUMSOLVE~2.loop13 * 337C4
NUMSOLVE~2.L18:
          DROP BINT69 NUMSOLVE~15 ?GOTO NUMSOLVE~2.loop17 GOTO RootExtremum * 337DD
NUMSOLVE~2.L19:
          2DROP BINT36 RootCopy BINT67 RootCopy  * 33800
NUMSOLVE~2.loop20:
          BINT1 RootCopy BINT101 RootCopy        * 33819
NUMSOLVE~2.loop21:
          RootShow24 BINT36 NUMSOLVE~14 NOT?GOTO NUMSOLVE~2.L35 NUMSOLVE~16 * 3382D
          ?GOTO NUMSOLVE~2.L26 BINT1 RootSlotSet? ?GOTO NUMSOLVE~2.L22 DROP * 3384B
          RootX4 RootX2 RootF2 RootF4 NUMSOLVE~21 GOTO NUMSOLVE~2.L25 * 3386E
NUMSOLVE~2.L22:
          NUMSOLVE~4 RootF4 OVER NUMSOLVE~17 ITE * 33891
          :: OVER 4PICK %%- 6ROLL %%+ RootF4 %>%% RootX4 ; * 338AA
          :: 5ROLL 3PICK %%- 4PICK %%+ RootF2 %>%% RootX2 ; * 338DC
          %>%% 7PICK 5PICK 4ROLL 5ROLL NUMSOLVE~19 5UNROLL RootF1 RootF2 * 3390E
          2DUP %= ?GOTO NUMSOLVE~2.L23 %ABS SWAP %ABS %> ?SKIP NUMSOLVE~3 * 3393B
          DUP %%0= ?GOTO NUMSOLVE~2.L24 OVER %%ABS 4PICK %%ABS %%< ITE * 3396D
          :: ROTDROP RootX2 ;                    * 3399F
          :: SWAPDROP RootX4 ;                   * 339B3
          %>%% 4UNROLL %%/ %%* %%+ OBJ_34C49 3PICKOVER %>%%- %%ABS 3PICK * 339C7
          5ROLL %>%%- %%ABS %%>= NOT?SWAPDROP GOTO NUMSOLVE~2.L25 * 339F9
NUMSOLVE~2.L23:
          2DROP                                  * 33A1C
NUMSOLVE~2.L24:
          4DROP SWAPDROP                         * 33A21
NUMSOLVE~2.L25:
          BINT2 BINT4 OBJ_344C7 ?GOTO NUMSOLVE~2.L26 BINT2 #=ITE BINT36 * 33A2B
          BINT66 NUMSOLVE~15 DROP                * 33A53
NUMSOLVE~2.L26:
          %0_2A2B4 BINT2 BINT4 NUMSOLVE~24 RootX3! RootEvalF NUMSOLVE~10 * 33A62
          RootSet3? NOT?GOTO NUMSOLVE~2.L27 RootF3 RootF4 NUMSOLVE~18 ?SKIP * 33A85
          RootFlipDir                            * 33AA8
          BINT1 RootCopy BINT18 RootCopy BINT35 RootCopy GOTO * 33AAD
          NUMSOLVE~2.loop21                      * 33AD0
NUMSOLVE~2.L27:
          BINT101 RootCopy BINT84 RootCopy BINT67 RootCopy BINT1 RootCopy * 33AD5
          BINT18 RootCopy BINT35 RootCopy        * 33AFD
NUMSOLVE~2.L28:
          FALSE 4PUTLAM                          * 33B11
NUMSOLVE~2.loop29:
          RootShow15 BINT69 NUMSOLVE~14 ?GOTO NUMSOLVE~2.L30 DROP 4GETLAM * 33B1B
          ?GOTO NUMSOLVE~2.L34 TRUE 4PUTLAM RootFlipDir GOTO * 33B3E
          NUMSOLVE~2.loop29                      * 33B5C
NUMSOLVE~2.L30:
          RootX3! RootEvalF NUMSOLVE~11 RootSet3? NOT?GOTO NUMSOLVE~2.L31 * 33B61
          RootF3 RootF5 NUMSOLVE~18 NOT?GOTO NUMSOLVE~2.L32 BINT20 RootCopy * 33B7F
          BINT35 RootCopy BINT69 RootCopy BINT86 RootCopy GOTO * 33BA2
          NUMSOLVE~2.loop20                      * 33BC5
NUMSOLVE~2.L31:
          BINT67 GOTO NUMSOLVE~2.L33             * 33BCA
NUMSOLVE~2.L32:
          BINT101 RootCopy BINT83                * 33BD9
NUMSOLVE~2.L33:
          RootCopy 4GETLAM ?SKIP RootFlipDir     * 33BE8
          GOTO NUMSOLVE~2.loop29                 * 33BFC
NUMSOLVE~2.L34:
          RootSignRev BINT1 BINT5 GOTO RootSignRev.L1 * 33C06
NUMSOLVE~2.L35:
          DROP                                   * 33C1F

* refs (1): 33C06
* Ends with "Sign Reversal": takes the slot of slots 2 and 4 with the smaller |f|
RootSignRev:
          # A05 BINT2 BINT4                      * 33C24
RootSignRev.L1:
          RootBetter DROP RootX#                 * 33C38

* refs (2): 33C92 33DA0
* Stores the answer in the unknown, leaves the locals, and returns TRUE with the message number
RootExit:
          RootVal>Var OVER 4UNROLL XEQSTOID 7GETLAM ABND ?SKIP FLUSHKEYS * 33C47
          COLA TRUE                              * 33C6F
RootExit.L1:
          DROP                                   * 33C79

* refs (3): 33643 336A7 337FB
* Ends with "Extremum" at x in slot 4
RootExtremum:
          # A06 RootX4 GOTO RootExit             * 33C7E
RootEvalF~1:
          RDROP # 12F GOTO RootConstant.L2 RDROP * 33C97
RootEvalF~1.L1:
          DROP                                   * 33CB5

* refs (3): 333D7 33459 3349F
* Ends with "Bad Guess(es)", restoring the variable's old value
RootBadGuess:
          # A01 GOTO RootConstant.L1             * 33CBA

* refs (1): 3352B
* Ends with "Constant?", restoring the variable's old value
RootConstant:
          # A02                                  * 33CCE  2562
RootConstant.L1:
          4GETLAM 5GETLAM XEQSTOID               * 33CD8
RootConstant.L2:
          7GETLAM ABND ?SKIP FLUSHKEYS           * 33CE7
          FALSE ;                                * 33CFB

* refs (12): 3315C 331A7 331C5 33387 333A0 3341D ...
* -> %: stores the x in slot 3 in the unknown and evaluates the function. An error, a complex result or a zero marks a bad point, handled by RootEvalErr and the caller
RootEvalF:
        :: RootX3 RootVal>Var XEQSTOID 6GETLAM ERRSET CRUNCH ERRTRAP * 33D05
          RootEvalErr 0LASTOWDOB! CK1NOLASTWD DUPTYPEREAL? ?GOTO * 33D2D
          RootEvalF.L1 DUP TYPECMP? ?GOTO RootEvalF~2 DUPTYPEEXT? NOT?GOTO * 33D46
          RootEvalF~1 U>nbr                      * 33D69
RootEvalF.L1:
          DUP RootF3! %0<> ?SEMI                 * 33D73
          RDROP                                  * 33D87

* refs (2): 48B93 49C2C
* Ends with "Zero" at x in slot 3. The plotter's ROOT also comes here
RootZero:
          # A04 RootX3 GOTO RootExit ;           * 33D8C

* refs (3): 33C47 33D0F 342BB
* % -> ob id: pairs a result with the unknown in 5GETLAM, giving it the units of the variable's old value
RootVal>Var:
        :: 5GETLAM dup;RclInVars(gn)? NOT?SEMI   * 33DAA
          DUPTYPEEXT? NOTcaseDROP ROT            * 33DBE
          Unbr>U SWAP ;                          * 33DCD

* refs (1): 33D2D
* Error trap of RootEvalF: "Undefined Name", the #3xx and #Bxx errors and ATTN only mean a bad point; others are raised again
RootEvalErr:
        :: RDROP 0LASTOWDOB!                     * 33DDC
          CODE                                   * 33DEB  93 nibbles
            CD0EX                                * 33DF5
            D0=(5)  ERROR                        * 33DF8
            A=DAT0  A                            * 33DFF
            ?A=0    A                            * 33E02
            GOYES   RootEvalErr.L2               * 33E05
            RSTK=C                               * 33E07
            LC(5)   #00203                       * 33E09
            ?C=A    A                            * 33E10
            GOYES   RootEvalErr.L1               * 33E13
            LC(3)   #300                         * 33E15
            ?C=A    XS                           * 33E1A
            GOYES   RootEvalErr.L1               * 33E1D
            LC(3)   #B00                         * 33E1F
            ?C=A    XS                           * 33E24
            GOYES   RootEvalErr.L1               * 33E27
            LC(5)   ERRJMP                       * 33E29
            A=C     A                            * 33E30
            PC=(A)                               * 33E32
RootEvalErr.L1:
            A=0     A                            * 33E36
            C=RSTK                               * 33E38
            GOC     RootEvalErr.L3               * 33E3A
RootEvalErr.L2:
            D0=(5)  ATTNFLG                      * 33E3D
            A=A+1   A                            * 33E44
RootEvalErr.L3:
            DAT0=A  A                            * 33E46
            D0=C                                 * 33E49
            GOLONG  RootX5!.L3                   * 33E4C
          ENDCODE                                * 33E52
RootEvalF~2:
          DEPTH 3GETLAM 2DUP#> ITE #- BINT2      * 33E52
          NDROP CK0NOLASTWD                      * 33E70
* The Very Big List names this address [code], but it is a pointer inside an object; the name is not used
          2GETLAM                                * 33E7A

Code_33E7F:
          CODE                                   * 33E7F  36 nibbles
            A=DAT1  A                            * 33E89
            D1=D1+  5                            * 33E8C
            D=D+1   A                            * 33E8F
            LC(5)   #000B9                       * 33E91
            A=A+C   A                            * 33E98
            AD1EX                                * 33E9A
            C=0     S                            * 33E9D
            LC(3)   #F00                         * 33EA0
            DAT1=C  W                            * 33EA5
            GOTO    RootCopy.L1                  * 33EA9
          ENDCODE                                * 33EAD
        ;                                        * 33EAD

* refs (1): 33968
NUMSOLVE~3:
        :: 4DROP RootF1 %>%%1/ RootF2 %>%%1/ RootF4 %>%%1/ 2DUP %%- RootX2 * 33EB2
          RootX4 %>%%- DUP RootX1 RootX4 %>%%- %%/ OVER RootX2 RootX1 %>%%- * 33EE9
          %%/ 6ROLL 7PICK %%- %%* 6ROLL 6ROLL %%- 3PICK %%*ROT 3PICK 6ROLL * 33F20
          %%- %%* ;                              * 33F5C

* refs (2): 33724 33891
NUMSOLVE~4:
        :: RootF2 RootF4 %>%%- RootX2 RootX4 %>%%- DUP RootX1 RootX4 %>%%- * 33F6B
          %%/ OVER RootX2 RootX1 %>%%- %%/ RootF2 RootF1 %>%%- %%* OVER * 33FA2
          RootF1 RootF4 %>%%- %%*ROT 3PICK 6PICK %%- %%* ; * 33FD9
