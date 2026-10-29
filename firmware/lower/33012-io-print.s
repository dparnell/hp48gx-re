* HP 48GX ROM revision R, #33012-#34005: I/O and printing
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: NUMSOLVE {<E>} Code_33E7F 7NULLLAM{}
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
          DUPNULLCOMP? ?GOTO L_33CB5 DUPDUP {}>%sBIND 2GETLAM 1ABNDSWAP * 330B2
          DUPTYPEEXT? ITE                        * 330D5
          :: 5GETLAM XEQSTOID ; DROP             * 330DF
          DUPLENCOMP NUMSOLVE~45 ?GOTO L_33CB5 INNERCOMP DUP#1= IT OVERSWAP * 330F8
          #3= NOT?GOTO NUMSOLVE~2 NUMSOLVE~1 ROT NUMSOLVE~1 3UNROLL * 33120
          NUMSOLVE~1 SWAP NUMSOLVE~28 NUMSOLVE~29 NUMSOLVE~27 NUMSOLVE~3 * 33143
          BINT35 NUMSOLVE~21 BINT53 NUMSOLVE~21 NUMSOLVE~12 NUMSOLVE~35 * 33161
          BINT2 OBJ_3437C ?GOTO L_331A7 BINT18 NUMSOLVE~21 GOTO L_33387 * 3317F
L_331A7:
          NUMSOLVE~3 NUMSOLVE~12 OBJ_347AE BINT67 NUMSOLVE~21 NUMSOLVE~27 * 331A7
          NUMSOLVE~3 NUMSOLVE~12 NUMSOLVE~23 ?GOTO L_331F2 BINT83 * 331C5
          NUMSOLVE~21 GOTO L_333E1               * 331E3
L_331F2:
          BINT4 OBJ_3437C ?GOTO L_3325B OBJ_347F7 NUMSOLVE~32 NUMSOLVE~38 * 331F2
          NOT?GOTO L_334A4 BINT101 NUMSOLVE~21 BINT83 NUMSOLVE~21 BINT1 * 33215
          NUMSOLVE~21 BINT18 NUMSOLVE~21 BINT36 NUMSOLVE~21 GOTO L_33B11 * 33238
L_3325B:
          OBJ_347F7 OBJ_34817 %<> ?GOTO L_33297 OBJ_34817 NUMSOLVE~32 %<> * 3325B
          ?GOTO L_336AC GOTO L_334A4             * 33283
L_33297:
          OBJ_347F7 OBJ_34817 NUMSOLVE~38 ?GOTO L_33819 OBJ_347F7 %ABS * 33297
          OBJ_34817 %ABS %> ?GOTO L_336AC NUMSOLVE~32 OBJ_34817 2DUP * 332BA
          NUMSOLVE~38 ?GOTO L_33800 %ABS SWAP %ABS %> ?GOTO L_3331E * 332E2
          NUMSOLVE~34 GOTO L_335DA               * 3330F
L_3331E:
          OBJ_347F7 %ABS NUMSOLVE~32 %ABS %>= ?GOTO L_335C6 NUMSOLVE~34 GOTO * 3331E
          L_335DA DUP NUMSOLVE~36                * 3334B
NUMSOLVE~2:
          2DUP %= IT NUMSOLVE~36                 * 3335A
          %MAXorder SWAP NUMSOLVE~28 NUMSOLVE~27 NUMSOLVE~35 * 3336E
L_33387:
          NUMSOLVE~3 BINT35 NUMSOLVE~21 BINT52 NUMSOLVE~21 NUMSOLVE~3 BINT67 * 33387
          NUMSOLVE~21 NUMSOLVE~12 BINT2 OBJ_3437C ?GOTO L_333E1 BINT4 * 333AA
          OBJ_3437C NOT?GOTO OBJ_33CBA NUMSOLVE~34 * 333CD
L_333E1:
          BINT4 OBJ_3437C ?GOTO L_334BD NUMSOLVE~9 BINT84 NUMSOLVE~21 BINT36 * 333E1
          NUMSOLVE~24 NOT?GOTO L_3343B NUMSOLVE~27 NUMSOLVE~3 NUMSOLVE~13 * 33409
          BINT67 NUMSOLVE~21 GOTO L_333E1        * 33427
L_3343B:
          DROP BINT101 NUMSOLVE~21 BINT33 NUMSOLVE~25 NOT?GOTO OBJ_33CBA * 3343B
          NUMSOLVE~27 NUMSOLVE~3 NUMSOLVE~13 BINT66 NUMSOLVE~21 BINT35 * 3345E
          NUMSOLVE~21 NUMSOLVE~34 NUMSOLVE~23 ?GOTO L_334BD NUMSOLVE~9 GOTO * 3347C
          OBJ_33CBA                              * 3349F
L_334A4:
          BINT67 NUMSOLVE~21 NUMSOLVE~22 IT NUMSOLVE~34 * 334A4
L_334BD:
          OBJ_34817 OBJ_347F7 %<> ?GOTO L_33580 NUMSOLVE~9 * 334BD
L_334DB:
          OBJ_347AE OBJ_3478E NUMSOLVE~43 BINT4 BINT5 OBJ_344C7 ?GOTO * 334DB
          L_33549 DROP                           * 334FE
L_33508:
          BINT69 NUMSOLVE~24 ?GOTO L_33549 DROP NUMSOLVE~22 NOT?GOTO * 33508
          OBJ_33CCE BINT101 NUMSOLVE~21 NUMSOLVE~34 GOTO L_334DB * 3352B
L_33549:
          NUMSOLVE~27 NUMSOLVE~3 NUMSOLVE~14 NUMSOLVE~23 ?GOTO L_334A4 * 33549
          BINT83 NUMSOLVE~21 NUMSOLVE~8 GOTO L_33508 * 33567
L_33580:
          OBJ_34817 OBJ_347F7 OVER %ABS OVER %ABS %< ?SKIP NUMSOLVE~34 * 33580
          NUMSOLVE~38 ?GOTO L_33819 GOTO L_335DA * 335AD
L_335C6:
          BINT36 NUMSOLVE~21 BINT67 NUMSOLVE~21  * 335C6
L_335DA:
          NUMSOLVE~9 BINT7 4PUTLAM BINT18 NUMSOLVE~21 OBJ_347AE OBJ_3478E * 335DA
          OBJ_347F7 OBJ_34817 NUMSOLVE~42 BINT4 BINT5 OBJ_344C7 ?GOTO * 335FD
          L_33648 #5= ?GOTO L_33689 BINT69 NUMSOLVE~25 NOT?GOTO OBJ_33C7E * 33620
L_33648:
          %0_2A2B4 BINT4 BINT5 NUMSOLVE~44 NUMSOLVE~27 NUMSOLVE~3 * 33648
          NUMSOLVE~15                            * 33666
L_3366B:
          NUMSOLVE~23 ?GOTO L_336B6 BINT83 NUMSOLVE~21 NUMSOLVE~8 * 3366B
L_33689:
          BINT69 NUMSOLVE~24 ?GOTO L_33648 DROP GOTO OBJ_33C7E * 33689
L_336AC:
          BINT7 4PUTLAM                          * 336AC
L_336B6:
          NUMSOLVE~32 OBJ_34817 2DUP NUMSOLVE~38 ?GOTO L_33800 %ABS SWAP * 336B6
          %ABS %>= ?GOTO L_335C6 4GETLAM #1- DUP#0= ?GOTO L_33C79 4PUTLAM * 336DE
          BINT83 NUMSOLVE~21 NUMSOLVE~8 NUMSOLVE~34 NUMSOLVE~7 NUMSOLVE~34 * 33710
          3UNROLL 5ROLL SWAP OBJ_347AE %>%% 6UNROLL NUMSOLVE~40 BINT1 BINT5 * 3372E
          OBJ_344C7 NOT?GOTO L_33C79 DUP OBJ_347AE %= ?GOTO L_337DD DUP * 3375B
          OBJ_347AE 1GETLAM ITE %< %>            * 33788
          ?GOTO L_337C4 BINT36 NUMSOLVE~21 BINT69 NUMSOLVE~21 NUMSOLVE~34 * 337A1
L_337C4:
          NUMSOLVE~27 NUMSOLVE~3 NUMSOLVE~16 GOTO L_3366B * 337C4
L_337DD:
          DROP BINT69 NUMSOLVE~25 ?GOTO L_337C4 GOTO OBJ_33C7E * 337DD
L_33800:
          2DROP BINT36 NUMSOLVE~21 BINT67 NUMSOLVE~21 * 33800
L_33819:
          BINT1 NUMSOLVE~21 BINT101 NUMSOLVE~21  * 33819
L_3382D:
          NUMSOLVE~9 BINT36 NUMSOLVE~24 NOT?GOTO L_33C1F NUMSOLVE~26 ?GOTO * 3382D
          L_33A62 BINT1 OBJ_3437C ?GOTO L_33891 DROP OBJ_347AE OBJ_3478E * 33850
          OBJ_347F7 OBJ_34817 NUMSOLVE~41 GOTO L_33A2B * 33878
L_33891:
          NUMSOLVE~7 OBJ_34817 OVER NUMSOLVE~37 ITE * 33891
          :: OVER 4PICK %%- 6ROLL %%+ OBJ_34817 %>%% OBJ_347AE ; * 338AA
          :: 5ROLL 3PICK %%- 4PICK %%+ OBJ_347F7 %>%% OBJ_3478E ; * 338DC
          %>%% 7PICK 5PICK 4ROLL 5ROLL NUMSOLVE~39 5UNROLL OBJ_347E7 * 3390E
          OBJ_347F7 2DUP %= ?GOTO L_33A1C %ABS SWAP %ABS %> ?SKIP NUMSOLVE~6 * 33936
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
          NUMSOLVE~25 DROP                       * 33A58
L_33A62:
          %0_2A2B4 BINT2 BINT4 NUMSOLVE~44 NUMSOLVE~27 NUMSOLVE~3 * 33A62
          NUMSOLVE~17 NUMSOLVE~23 NOT?GOTO L_33AD5 NUMSOLVE~32 OBJ_34817 * 33A80
          NUMSOLVE~38 ?SKIP NUMSOLVE~34          * 33A9E
          BINT1 NUMSOLVE~21 BINT18 NUMSOLVE~21 BINT35 NUMSOLVE~21 GOTO * 33AAD
          L_3382D                                * 33AD0
L_33AD5:
          BINT101 NUMSOLVE~21 BINT84 NUMSOLVE~21 BINT67 NUMSOLVE~21 BINT1 * 33AD5
          NUMSOLVE~21 BINT18 NUMSOLVE~21 BINT35 NUMSOLVE~21 * 33AF8
L_33B11:
          FALSE 4PUTLAM                          * 33B11
L_33B1B:
          NUMSOLVE~10 BINT69 NUMSOLVE~24 ?GOTO L_33B61 DROP 4GETLAM ?GOTO * 33B1B
          L_33C06 TRUE 4PUTLAM NUMSOLVE~34 GOTO L_33B1B * 33B43
L_33B61:
          NUMSOLVE~27 NUMSOLVE~3 NUMSOLVE~18 NUMSOLVE~23 NOT?GOTO L_33BCA * 33B61
          NUMSOLVE~32 NUMSOLVE~33 NUMSOLVE~38 NOT?GOTO L_33BD9 BINT20 * 33B7F
          NUMSOLVE~21 BINT35 NUMSOLVE~21 BINT69 NUMSOLVE~21 BINT86 * 33B9D
          NUMSOLVE~21 GOTO L_33819               * 33BBB
L_33BCA:
          BINT67 GOTO L_33BE8                    * 33BCA
L_33BD9:
          BINT101 NUMSOLVE~21 BINT83             * 33BD9
L_33BE8:
          NUMSOLVE~21 4GETLAM ?SKIP NUMSOLVE~34  * 33BE8
          GOTO L_33B1B                           * 33BFC
L_33C06:
          OBJ_33C24 BINT1 BINT5 GOTO L_33C38     * 33C06
L_33C1F:
          DROP                                   * 33C1F

* refs (1): 33C06
OBJ_33C24:
          # A05 BINT2 BINT4                      * 33C24
L_33C38:
          NUMSOLVE~20 DROP OBJ_34771             * 33C38
NUMSOLVE~46:
          OBJ_33DAA OVER 4UNROLL XEQSTOID 7GETLAM ABND ?SKIP FLUSHKEYS * 33C47
          COLA TRUE                              * 33C6F
L_33C79:
          DROP                                   * 33C79

* refs (3): 33643 336A7 337FB
OBJ_33C7E:
          # A06 OBJ_347AE GOTO NUMSOLVE~46       * 33C7E
NUMSOLVE~47:
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
NUMSOLVE~3:
        :: NUMSOLVE~31 OBJ_33DAA XEQSTOID 6GETLAM ERRSET CRUNCH ERRTRAP * 33D05
          NUMSOLVE~4 0LASTOWDOB! CK1NOLASTWD DUPTYPEREAL? ?GOTO L_33D73 DUP * 33D2D
          TYPECMP? ?GOTO NUMSOLVE~5 DUPTYPEEXT? NOT?GOTO NUMSOLVE~47 U>nbr * 33D50
L_33D73:
          DUP NUMSOLVE~30 %0<> ?SEMI             * 33D73
          RDROP                                  * 33D87

* refs (2): 48B93 49C2C
OBJ_33D8C:
          # A04 NUMSOLVE~31 GOTO NUMSOLVE~46 ;   * 33D8C

* refs (3): 33C47 33D0F 342BB
OBJ_33DAA:
        :: 5GETLAM dup;RclInVars(gn)? NOT?SEMI   * 33DAA
          DUPTYPEEXT? NOTcaseDROP ROT            * 33DBE
          Unbr>U SWAP ;                          * 33DCD

* refs (1): 33D2D
NUMSOLVE~4:
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
NUMSOLVE~5:
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
            GOTO    L_34375                      * 33EA9
          ENDCODE                                * 33EAD
        ;                                        * 33EAD

* refs (1): 33968
NUMSOLVE~6:
        :: 4DROP OBJ_347E7 %>%%1/ OBJ_347F7 %>%%1/ OBJ_34817 %>%%1/ 2DUP %%- * 33EB2
          OBJ_3478E OBJ_347AE %>%%- DUP OBJ_3477E OBJ_347AE %>%%- %%/ OVER * 33EE4
          OBJ_3478E OBJ_3477E %>%%- %%/ 6ROLL 7PICK %%- %%* 6ROLL 6ROLL %%- * 33F11
          3PICK %%*ROT 3PICK 6ROLL %%- %%* ;     * 33F48

* refs (2): 33724 33891
NUMSOLVE~7:
        :: OBJ_347F7 OBJ_34817 %>%%- OBJ_3478E OBJ_347AE %>%%- DUP OBJ_3477E * 33F6B
          OBJ_347AE %>%%- %%/ OVER OBJ_3478E OBJ_3477E %>%%- %%/ OBJ_347F7 * 33F98
          OBJ_347E7 %>%%- %%* OVER OBJ_347E7 OBJ_34817 %>%%- %%*ROT 3PICK * 33FC5
          6PICK %%- %%* ;                        * 33FF2
