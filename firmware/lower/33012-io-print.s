* HP 48GX ROM revision R, #33012-#34005: I/O and printing
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: NUMSOLVE {<E>} Code_33E7F 7NULLLAM{}
* Follows on from the previous file (at #33012 in the original ROM).
        RPL

* refs (3): 3312F 33139 33143
OBJ_33012:
        :: 2DUP %<> case %MAXorder               * 33012
          DROPRDROP GOTO L_3335A ;               * 3302B

* refs (2): 32FB3 33008
NUMSOLVE:
        :: DEPTH #4-                             * 3303F

{<E>}:
          { BINT14 } %0_2A2B4 MAKEARRY FALSE     * 3304E

* -> {}
7NULLLAM{}:
          { NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM } BIND * 3306C
          4GETLAM DUPTYPELIST? ?SKIP ONE{}N      * 3309E
          DUPNULLCOMP? ?GOTO L_33CB5 DUPDUP OBJ_1DF30 2GETLAM 1ABNDSWAP * 330B2
          DUPTYPEEXT? ITE                        * 330D5
          :: 5GETLAM XEQSTOID ; DROP             * 330DF
          DUPLENCOMP OBJ_4D2EF ?GOTO L_33CB5 INNERCOMP DUP#1= IT OVERSWAP * 330F8
          #3= NOT?GOTO L_3335A OBJ_33012 ROT OBJ_33012 3UNROLL OBJ_33012 * 33120
          SWAP OBJ_346F8 OBJ_34708 OBJ_346E8 OBJ_33D05 BINT35 OBJ_3431F * 33148
          BINT53 OBJ_3431F OBJ_3414E OBJ_34957 BINT2 OBJ_3437C ?GOTO L_331A7 * 3316B
          BINT18 OBJ_3431F GOTO L_33387          * 33193
L_331A7:
          OBJ_33D05 OBJ_3414E OBJ_347AE BINT67 OBJ_3431F OBJ_346E8 OBJ_33D05 * 331A7
          OBJ_3414E OBJ_34394 ?GOTO L_331F2 BINT83 OBJ_3431F GOTO L_333E1 * 331CA
L_331F2:
          BINT4 OBJ_3437C ?GOTO L_3325B OBJ_347F7 OBJ_34807 OBJ_34A1A * 331F2
          NOT?GOTO L_334A4 BINT101 OBJ_3431F BINT83 OBJ_3431F BINT1 * 33215
          OBJ_3431F BINT18 OBJ_3431F BINT36 OBJ_3431F GOTO L_33B11 * 33238
L_3325B:
          OBJ_347F7 OBJ_34817 %<> ?GOTO L_33297 OBJ_34817 OBJ_34807 %<> * 3325B
          ?GOTO L_336AC GOTO L_334A4             * 33283
L_33297:
          OBJ_347F7 OBJ_34817 OBJ_34A1A ?GOTO L_33819 OBJ_347F7 %ABS * 33297
          OBJ_34817 %ABS %> ?GOTO L_336AC OBJ_34807 OBJ_34817 2DUP OBJ_34A1A * 332BA
          ?GOTO L_33800 %ABS SWAP %ABS %> ?GOTO L_3331E OBJ_3491B GOTO * 332E7
          L_335DA                                * 33319
L_3331E:
          OBJ_347F7 %ABS OBJ_34807 %ABS %>= ?GOTO L_335C6 OBJ_3491B GOTO * 3331E
          L_335DA DUP OBJ_349C6                  * 3334B
L_3335A:
          2DUP %= IT OBJ_349C6                   * 3335A
          %MAXorder SWAP OBJ_346F8 OBJ_346E8 OBJ_34957 * 3336E
L_33387:
          OBJ_33D05 BINT35 OBJ_3431F BINT52 OBJ_3431F OBJ_33D05 BINT67 * 33387
          OBJ_3431F OBJ_3414E BINT2 OBJ_3437C ?GOTO L_333E1 BINT4 OBJ_3437C * 333AA
          NOT?GOTO OBJ_33CBA OBJ_3491B           * 333D2
L_333E1:
          BINT4 OBJ_3437C ?GOTO L_334BD OBJ_34024 BINT84 OBJ_3431F BINT36 * 333E1
          OBJ_343D1 NOT?GOTO L_3343B OBJ_346E8 OBJ_33D05 OBJ_34176 BINT67 * 33409
          OBJ_3431F GOTO L_333E1                 * 3342C
L_3343B:
          DROP BINT101 OBJ_3431F BINT33 OBJ_34546 NOT?GOTO OBJ_33CBA * 3343B
          OBJ_346E8 OBJ_33D05 OBJ_34176 BINT66 OBJ_3431F BINT35 OBJ_3431F * 3345E
          OBJ_3491B OBJ_34394 ?GOTO L_334BD OBJ_34024 GOTO OBJ_33CBA * 33481
L_334A4:
          BINT67 OBJ_3431F OBJ_34389 IT OBJ_3491B * 334A4
L_334BD:
          OBJ_34817 OBJ_347F7 %<> ?GOTO L_33580 OBJ_34024 * 334BD
L_334DB:
          OBJ_347AE OBJ_3478E OBJ_34C21 BINT4 BINT5 OBJ_344C7 ?GOTO L_33549 * 334DB
          DROP                                   * 33503
L_33508:
          BINT69 OBJ_343D1 ?GOTO L_33549 DROP OBJ_34389 NOT?GOTO OBJ_33CCE * 33508
          BINT101 OBJ_3431F OBJ_3491B GOTO L_334DB * 33530
L_33549:
          OBJ_346E8 OBJ_33D05 OBJ_3419E OBJ_34394 ?GOTO L_334A4 BINT83 * 33549
          OBJ_3431F OBJ_34006 GOTO L_33508       * 3356C
L_33580:
          OBJ_34817 OBJ_347F7 OVER %ABS OVER %ABS %< ?SKIP OBJ_3491B * 33580
          OBJ_34A1A ?GOTO L_33819 GOTO L_335DA   * 335AD
L_335C6:
          BINT36 OBJ_3431F BINT67 OBJ_3431F      * 335C6
L_335DA:
          OBJ_34024 BINT7 4PUTLAM BINT18 OBJ_3431F OBJ_347AE OBJ_3478E * 335DA
          OBJ_347F7 OBJ_34817 OBJ_34BB5 BINT4 BINT5 OBJ_344C7 ?GOTO L_33648 * 335FD
          #5= ?GOTO L_33689 BINT69 OBJ_34546 NOT?GOTO OBJ_33C7E * 33625
L_33648:
          %0_2A2B4 BINT4 BINT5 OBJ_34CE2 OBJ_346E8 OBJ_33D05 OBJ_341C6 * 33648
L_3366B:
          OBJ_34394 ?GOTO L_336B6 BINT83 OBJ_3431F OBJ_34006 * 3366B
L_33689:
          BINT69 OBJ_343D1 ?GOTO L_33648 DROP GOTO OBJ_33C7E * 33689
L_336AC:
          BINT7 4PUTLAM                          * 336AC
L_336B6:
          OBJ_34807 OBJ_34817 2DUP OBJ_34A1A ?GOTO L_33800 %ABS SWAP %ABS * 336B6
          %>= ?GOTO L_335C6 4GETLAM #1- DUP#0= ?GOTO L_33C79 4PUTLAM BINT83 * 336E3
          OBJ_3431F OBJ_34006 OBJ_3491B OBJ_33F6B OBJ_3491B 3UNROLL 5ROLL * 33715
          SWAP OBJ_347AE %>%% 6UNROLL OBJ_34B2D BINT1 BINT5 OBJ_344C7 * 33738
          NOT?GOTO L_33C79 DUP OBJ_347AE %= ?GOTO L_337DD DUP OBJ_347AE * 33760
          1GETLAM ITE %< %>                      * 3378D
          ?GOTO L_337C4 BINT36 OBJ_3431F BINT69 OBJ_3431F OBJ_3491B * 337A1
L_337C4:
          OBJ_346E8 OBJ_33D05 OBJ_341EE GOTO L_3366B * 337C4
L_337DD:
          DROP BINT69 OBJ_34546 ?GOTO L_337C4 GOTO OBJ_33C7E * 337DD
L_33800:
          2DROP BINT36 OBJ_3431F BINT67 OBJ_3431F * 33800
L_33819:
          BINT1 OBJ_3431F BINT101 OBJ_3431F      * 33819
L_3382D:
          OBJ_34024 BINT36 OBJ_343D1 NOT?GOTO L_33C1F OBJ_34627 ?GOTO * 3382D
          L_33A62 BINT1 OBJ_3437C ?GOTO L_33891 DROP OBJ_347AE OBJ_3478E * 33850
          OBJ_347F7 OBJ_34817 OBJ_34B77 GOTO L_33A2B * 33878
L_33891:
          OBJ_33F6B OBJ_34817 OVER OBJ_34A08 ITE * 33891
          :: OVER 4PICK %%- 6ROLL %%+ OBJ_34817 %>%% OBJ_347AE ; * 338AA
          :: 5ROLL 3PICK %%- 4PICK %%+ OBJ_347F7 %>%% OBJ_3478E ; * 338DC
          %>%% 7PICK 5PICK 4ROLL 5ROLL OBJ_34A56 5UNROLL OBJ_347E7 OBJ_347F7 * 3390E
          2DUP %= ?GOTO L_33A1C %ABS SWAP %ABS %> ?SKIP OBJ_33EB2 * 3393B
          DUP %%0= ?GOTO L_33A21 OVER %%ABS 4PICK %%ABS %%< ITE * 3396D
          :: ROTDROP OBJ_3478E ;                 * 3399F
          :: SWAPDROP OBJ_347AE ;                * 339B3
          %>%% 4UNROLL %%/ %%* %%+ OBJ_34C49 3PICKOVER %>%%- %%ABS 3PICK * 339C7
          5ROLL %>%%- %%ABS %%>= NOT?SWAPDROP GOTO L_33A2B * 339F9
L_33A1C:
          2DROP                                  * 33A1C
L_33A21:
          4DROP SWAPDROP                         * 33A21
L_33A2B:
          BINT2 BINT4 OBJ_344C7 ?GOTO L_33A62 BINT2 #=ITE BINT36 BINT66 * 33A2B
          OBJ_34546 DROP                         * 33A58
L_33A62:
          %0_2A2B4 BINT2 BINT4 OBJ_34CE2 OBJ_346E8 OBJ_33D05 OBJ_34216 * 33A62
          OBJ_34394 NOT?GOTO L_33AD5 OBJ_34807 OBJ_34817 OBJ_34A1A ?SKIP * 33A85
          OBJ_3491B                              * 33AA8
          BINT1 OBJ_3431F BINT18 OBJ_3431F BINT35 OBJ_3431F GOTO L_3382D * 33AAD
L_33AD5:
          BINT101 OBJ_3431F BINT84 OBJ_3431F BINT67 OBJ_3431F BINT1 * 33AD5
          OBJ_3431F BINT18 OBJ_3431F BINT35 OBJ_3431F * 33AF8
L_33B11:
          FALSE 4PUTLAM                          * 33B11
L_33B1B:
          OBJ_34042 BINT69 OBJ_343D1 ?GOTO L_33B61 DROP 4GETLAM ?GOTO * 33B1B
          L_33C06 TRUE 4PUTLAM OBJ_3491B GOTO L_33B1B * 33B43
L_33B61:
          OBJ_346E8 OBJ_33D05 OBJ_3423E OBJ_34394 NOT?GOTO L_33BCA OBJ_34807 * 33B61
          OBJ_34827 OBJ_34A1A NOT?GOTO L_33BD9 BINT20 OBJ_3431F BINT35 * 33B84
          OBJ_3431F BINT69 OBJ_3431F BINT86 OBJ_3431F GOTO L_33819 * 33BA7
L_33BCA:
          BINT67 GOTO L_33BE8                    * 33BCA
L_33BD9:
          BINT101 OBJ_3431F BINT83               * 33BD9
L_33BE8:
          OBJ_3431F 4GETLAM ?SKIP OBJ_3491B      * 33BE8
          GOTO L_33B1B                           * 33BFC
L_33C06:
          OBJ_33C24 BINT1 BINT5 GOTO L_33C38     * 33C06
L_33C1F:
          DROP                                   * 33C1F

* refs (1): 33C06
OBJ_33C24:
          # A05 BINT2 BINT4                      * 33C24
L_33C38:
          OBJ_3425C DROP OBJ_34771               * 33C38
L_33C47:
          OBJ_33DAA OVER 4UNROLL XEQSTOID 7GETLAM ABND ?SKIP FLUSHKEYS * 33C47
          COLA TRUE                              * 33C6F
L_33C79:
          DROP                                   * 33C79

* refs (3): 33643 336A7 337FB
OBJ_33C7E:
          # A06 OBJ_347AE GOTO L_33C47           * 33C7E
L_33C97:
          RDROP # 12F GOTO L_33CE7 RDROP         * 33C97
L_33CB5:
          DROP                                   * 33CB5

* refs (3): 333D7 33459 3349F
OBJ_33CBA:
          # A01 GOTO L_33CD8                     * 33CBA

* refs (1): 3352B
OBJ_33CCE:
          # A02                                  * 33CCE  2562
L_33CD8:
          4GETLAM 5GETLAM XEQSTOID               * 33CD8
L_33CE7:
          7GETLAM ABND ?SKIP FLUSHKEYS           * 33CE7
          FALSE ;                                * 33CFB

* refs (12): 3315C 331A7 331C5 33387 333A0 3341D ...
OBJ_33D05:
        :: OBJ_3479E OBJ_33DAA XEQSTOID 6GETLAM ERRSET CRUNCH ERRTRAP * 33D05
          OBJ_33DDC 0LASTOWDOB! CK1NOLASTWD DUPTYPEREAL? ?GOTO L_33D73 DUP * 33D2D
          TYPECMP? ?GOTO L_33E52 DUPTYPEEXT? NOT?GOTO L_33C97 U>nbr * 33D50
L_33D73:
          DUP OBJ_3474E %0<> ?SEMI               * 33D73
          RDROP                                  * 33D87

* refs (2): 48B93 49C2C
OBJ_33D8C:
          # A04 OBJ_3479E GOTO L_33C47 ;         * 33D8C

* refs (3): 33C47 33D0F 342BB
OBJ_33DAA:
        :: 5GETLAM dup;RclInVars(gn)? NOT?SEMI   * 33DAA
          DUPTYPEEXT? NOTcaseDROP ROT            * 33DBE
          Unbr>U SWAP ;                          * 33DCD

* refs (1): 33D2D
OBJ_33DDC:
        :: RDROP 0LASTOWDOB!                     * 33DDC
          CODE                                   * 33DEB  93 nibbles
            CD0EX                                * 33DF5
            D0=(5)  ERROR                        * 33DF8
            A=DAT0  A                            * 33DFF
            ?A=0    A                            * 33E02
            GOYES   L_33E3D                      * 33E05
            RSTK=C                               * 33E07
            LC(5)   #00203                       * 33E09
            ?C=A    A                            * 33E10
            GOYES   L_33E36                      * 33E13
            LC(3)   #300                         * 33E15
            ?C=A    XS                           * 33E1A
            GOYES   L_33E36                      * 33E1D
            LC(3)   #B00                         * 33E1F
            ?C=A    XS                           * 33E24
            GOYES   L_33E36                      * 33E27
            LC(5)   ERRJMP                       * 33E29
            A=C     A                            * 33E30
            PC=(A)                               * 33E32
L_33E36:
            A=0     A                            * 33E36
            C=RSTK                               * 33E38
            GOC     L_33E46                      * 33E3A
L_33E3D:
            D0=(5)  ATTNFLG                      * 33E3D
            A=A+1   A                            * 33E44
L_33E46:
            DAT0=A  A                            * 33E46
            D0=C                                 * 33E49
            GOLONG  L_34744                      * 33E4C
          ENDCODE                                * 33E52
L_33E52:
          DEPTH 3GETLAM 2DUP#> ITE #- BINT2      * 33E52
          NDROP CK0NOLASTWD 2GETLAM              * 33E70

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
            GOTO    L_34375                      * 33EA9
          ENDCODE                                * 33EAD
        ;                                        * 33EAD

* refs (1): 33968
OBJ_33EB2:
        :: 4DROP OBJ_347E7 %>%%1/ OBJ_347F7 %>%%1/ OBJ_34817 %>%%1/ 2DUP %%- * 33EB2
          OBJ_3478E OBJ_347AE %>%%- DUP OBJ_3477E OBJ_347AE %>%%- %%/ OVER * 33EE4
          OBJ_3478E OBJ_3477E %>%%- %%/ 6ROLL 7PICK %%- %%* 6ROLL 6ROLL %%- * 33F11
          3PICK %%*ROT 3PICK 6ROLL %%- %%* ;     * 33F48

* refs (2): 33724 33891
OBJ_33F6B:
        :: OBJ_347F7 OBJ_34817 %>%%- OBJ_3478E OBJ_347AE %>%%- DUP OBJ_3477E * 33F6B
          OBJ_347AE %>%%- %%/ OVER OBJ_3478E OBJ_3477E %>%%- %%/ OBJ_347F7 * 33F98
          OBJ_347E7 %>%%- %%* OVER OBJ_347E7 OBJ_34817 %>%%- %%*ROT 3PICK * 33FC5
          6PICK %%- %%* ;                        * 33FF2
