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
          DUPNULLCOMP? ?GOTO NUMSOLVE~47.L1 DUPDUP {}>%sBIND 2GETLAM * 330B2
          1ABNDSWAP DUPTYPEEXT? ITE              * 330D0
          :: 5GETLAM XEQSTOID ; DROP             * 330DF
          DUPLENCOMP NUMSOLVE~45 ?GOTO NUMSOLVE~47.L1 INNERCOMP DUP#1= IT * 330F8
          OVERSWAP                               * 3311B
          #3= NOT?GOTO NUMSOLVE~2 NUMSOLVE~1 ROT NUMSOLVE~1 3UNROLL * 33120
          NUMSOLVE~1 SWAP NUMSOLVE~28 NUMSOLVE~29 NUMSOLVE~27 NUMSOLVE~3 * 33143
          BINT35 NUMSOLVE~21 BINT53 NUMSOLVE~21 NUMSOLVE~12 NUMSOLVE~35 * 33161
          BINT2 OBJ_3437C ?GOTO 7NULLLAM{}.L1 BINT18 NUMSOLVE~21 GOTO * 3317F
          NUMSOLVE~2.L1                          * 331A2
7NULLLAM{}.L1:
          NUMSOLVE~3 NUMSOLVE~12 OBJ_347AE BINT67 NUMSOLVE~21 NUMSOLVE~27 * 331A7
          NUMSOLVE~3 NUMSOLVE~12 NUMSOLVE~23 ?GOTO 7NULLLAM{}.L2 BINT83 * 331C5
          NUMSOLVE~21 GOTO NUMSOLVE~2.loop2      * 331E3
7NULLLAM{}.L2:
          BINT4 OBJ_3437C ?GOTO 7NULLLAM{}.L3 OBJ_347F7 NUMSOLVE~32 * 331F2
          NUMSOLVE~38 NOT?GOTO NUMSOLVE~2.loop4 BINT101 NUMSOLVE~21 BINT83 * 33210
          NUMSOLVE~21 BINT1 NUMSOLVE~21 BINT18 NUMSOLVE~21 BINT36 * 3322E
          NUMSOLVE~21 GOTO NUMSOLVE~2.L28        * 3324C
7NULLLAM{}.L3:
          OBJ_347F7 OBJ_34817 %<> ?GOTO 7NULLLAM{}.L4 OBJ_34817 NUMSOLVE~32 * 3325B
          %<> ?GOTO NUMSOLVE~2.L15 GOTO NUMSOLVE~2.loop4 * 3327E
7NULLLAM{}.L4:
          OBJ_347F7 OBJ_34817 NUMSOLVE~38 ?GOTO NUMSOLVE~2.loop20 OBJ_347F7 * 33297
          %ABS OBJ_34817 %ABS %> ?GOTO NUMSOLVE~2.L15 NUMSOLVE~32 OBJ_34817 * 332B5
          2DUP NUMSOLVE~38 ?GOTO NUMSOLVE~2.L19 %ABS SWAP %ABS %> ?GOTO * 332DD
          7NULLLAM{}.L5 NUMSOLVE~34 GOTO NUMSOLVE~2.L11 * 3330A
7NULLLAM{}.L5:
          OBJ_347F7 %ABS NUMSOLVE~32 %ABS %>= ?GOTO NUMSOLVE~2.loop10 * 3331E
          NUMSOLVE~34 GOTO NUMSOLVE~2.L11 DUP NUMSOLVE~36 * 33341
NUMSOLVE~2:
          2DUP %= IT NUMSOLVE~36                 * 3335A
          %MAXorder SWAP NUMSOLVE~28 NUMSOLVE~27 NUMSOLVE~35 * 3336E
NUMSOLVE~2.L1:
          NUMSOLVE~3 BINT35 NUMSOLVE~21 BINT52 NUMSOLVE~21 NUMSOLVE~3 BINT67 * 33387
          NUMSOLVE~21 NUMSOLVE~12 BINT2 OBJ_3437C ?GOTO NUMSOLVE~2.loop2 * 333AA
          BINT4 OBJ_3437C NOT?GOTO OBJ_33CBA NUMSOLVE~34 * 333C8
NUMSOLVE~2.loop2:
          BINT4 OBJ_3437C ?GOTO NUMSOLVE~2.L5 NUMSOLVE~9 BINT84 NUMSOLVE~21 * 333E1
          BINT36 NUMSOLVE~24 NOT?GOTO NUMSOLVE~2.L3 NUMSOLVE~27 NUMSOLVE~3 * 33404
          NUMSOLVE~13 BINT67 NUMSOLVE~21 GOTO NUMSOLVE~2.loop2 * 33422
NUMSOLVE~2.L3:
          DROP BINT101 NUMSOLVE~21 BINT33 NUMSOLVE~25 NOT?GOTO OBJ_33CBA * 3343B
          NUMSOLVE~27 NUMSOLVE~3 NUMSOLVE~13 BINT66 NUMSOLVE~21 BINT35 * 3345E
          NUMSOLVE~21 NUMSOLVE~34 NUMSOLVE~23 ?GOTO NUMSOLVE~2.L5 NUMSOLVE~9 * 3347C
          GOTO OBJ_33CBA                         * 3349A
NUMSOLVE~2.loop4:
          BINT67 NUMSOLVE~21 NUMSOLVE~22 IT NUMSOLVE~34 * 334A4
NUMSOLVE~2.L5:
          OBJ_34817 OBJ_347F7 %<> ?GOTO NUMSOLVE~2.L9 NUMSOLVE~9 * 334BD
NUMSOLVE~2.loop6:
          OBJ_347AE OBJ_3478E NUMSOLVE~43 BINT4 BINT5 OBJ_344C7 ?GOTO * 334DB
          NUMSOLVE~2.L8 DROP                     * 334FE
NUMSOLVE~2.loop7:
          BINT69 NUMSOLVE~24 ?GOTO NUMSOLVE~2.L8 DROP NUMSOLVE~22 NOT?GOTO * 33508
          OBJ_33CCE BINT101 NUMSOLVE~21 NUMSOLVE~34 GOTO NUMSOLVE~2.loop6 * 3352B
NUMSOLVE~2.L8:
          NUMSOLVE~27 NUMSOLVE~3 NUMSOLVE~14 NUMSOLVE~23 ?GOTO * 33549
          NUMSOLVE~2.loop4 BINT83 NUMSOLVE~21 NUMSOLVE~8 GOTO * 33562
          NUMSOLVE~2.loop7                       * 3357B
NUMSOLVE~2.L9:
          OBJ_34817 OBJ_347F7 OVER %ABS OVER %ABS %< ?SKIP NUMSOLVE~34 * 33580
          NUMSOLVE~38 ?GOTO NUMSOLVE~2.loop20 GOTO NUMSOLVE~2.L11 * 335AD
NUMSOLVE~2.loop10:
          BINT36 NUMSOLVE~21 BINT67 NUMSOLVE~21  * 335C6
NUMSOLVE~2.L11:
          NUMSOLVE~9 BINT7 4PUTLAM BINT18 NUMSOLVE~21 OBJ_347AE OBJ_3478E * 335DA
          OBJ_347F7 OBJ_34817 NUMSOLVE~42 BINT4 BINT5 OBJ_344C7 ?GOTO * 335FD
          NUMSOLVE~2.loop12 #5= ?GOTO NUMSOLVE~2.L14 BINT69 NUMSOLVE~25 * 33620
          NOT?GOTO OBJ_33C7E                     * 3363E
NUMSOLVE~2.loop12:
          %0_2A2B4 BINT4 BINT5 NUMSOLVE~44 NUMSOLVE~27 NUMSOLVE~3 * 33648
          NUMSOLVE~15                            * 33666
NUMSOLVE~2.loop13:
          NUMSOLVE~23 ?GOTO NUMSOLVE~2.L16 BINT83 NUMSOLVE~21 NUMSOLVE~8 * 3366B
NUMSOLVE~2.L14:
          BINT69 NUMSOLVE~24 ?GOTO NUMSOLVE~2.loop12 DROP GOTO OBJ_33C7E * 33689
NUMSOLVE~2.L15:
          BINT7 4PUTLAM                          * 336AC
NUMSOLVE~2.L16:
          NUMSOLVE~32 OBJ_34817 2DUP NUMSOLVE~38 ?GOTO NUMSOLVE~2.L19 %ABS * 336B6
          SWAP %ABS %>= ?GOTO NUMSOLVE~2.loop10 4GETLAM #1- DUP#0= ?GOTO * 336D9
          NUMSOLVE~46.L1 4PUTLAM BINT83 NUMSOLVE~21 NUMSOLVE~8 NUMSOLVE~34 * 33706
          NUMSOLVE~7 NUMSOLVE~34 3UNROLL 5ROLL SWAP OBJ_347AE %>%% 6UNROLL * 33724
          NUMSOLVE~40 BINT1 BINT5 OBJ_344C7 NOT?GOTO NUMSOLVE~46.L1 DUP * 3374C
          OBJ_347AE %= ?GOTO NUMSOLVE~2.L18 DUP OBJ_347AE 1GETLAM ITE %< %> * 3376F
          ?GOTO NUMSOLVE~2.loop17 BINT36 NUMSOLVE~21 BINT69 NUMSOLVE~21 * 337A1
          NUMSOLVE~34                            * 337BF
NUMSOLVE~2.loop17:
          NUMSOLVE~27 NUMSOLVE~3 NUMSOLVE~16 GOTO NUMSOLVE~2.loop13 * 337C4
NUMSOLVE~2.L18:
          DROP BINT69 NUMSOLVE~25 ?GOTO NUMSOLVE~2.loop17 GOTO OBJ_33C7E * 337DD
NUMSOLVE~2.L19:
          2DROP BINT36 NUMSOLVE~21 BINT67 NUMSOLVE~21 * 33800
NUMSOLVE~2.loop20:
          BINT1 NUMSOLVE~21 BINT101 NUMSOLVE~21  * 33819
NUMSOLVE~2.loop21:
          NUMSOLVE~9 BINT36 NUMSOLVE~24 NOT?GOTO NUMSOLVE~2.L35 NUMSOLVE~26 * 3382D
          ?GOTO NUMSOLVE~2.L26 BINT1 OBJ_3437C ?GOTO NUMSOLVE~2.L22 DROP * 3384B
          OBJ_347AE OBJ_3478E OBJ_347F7 OBJ_34817 NUMSOLVE~41 GOTO * 3386E
          NUMSOLVE~2.L25                         * 3388C
NUMSOLVE~2.L22:
          NUMSOLVE~7 OBJ_34817 OVER NUMSOLVE~37 ITE * 33891
          :: OVER 4PICK %%- 6ROLL %%+ OBJ_34817 %>%% OBJ_347AE ; * 338AA
          :: 5ROLL 3PICK %%- 4PICK %%+ OBJ_347F7 %>%% OBJ_3478E ; * 338DC
          %>%% 7PICK 5PICK 4ROLL 5ROLL NUMSOLVE~39 5UNROLL OBJ_347E7 * 3390E
          OBJ_347F7 2DUP %= ?GOTO NUMSOLVE~2.L23 %ABS SWAP %ABS %> ?SKIP * 33936
          NUMSOLVE~6                             * 33968
          DUP %%0= ?GOTO NUMSOLVE~2.L24 OVER %%ABS 4PICK %%ABS %%< ITE * 3396D
          :: ROTDROP OBJ_3478E ;                 * 3399F
          :: SWAPDROP OBJ_347AE ;                * 339B3
          %>%% 4UNROLL %%/ %%* %%+ OBJ_34C49 3PICKOVER %>%%- %%ABS 3PICK * 339C7
          5ROLL %>%%- %%ABS %%>= NOT?SWAPDROP GOTO NUMSOLVE~2.L25 * 339F9
NUMSOLVE~2.L23:
          2DROP                                  * 33A1C
NUMSOLVE~2.L24:
          4DROP SWAPDROP                         * 33A21
NUMSOLVE~2.L25:
          BINT2 BINT4 OBJ_344C7 ?GOTO NUMSOLVE~2.L26 BINT2 #=ITE BINT36 * 33A2B
          BINT66 NUMSOLVE~25 DROP                * 33A53
NUMSOLVE~2.L26:
          %0_2A2B4 BINT2 BINT4 NUMSOLVE~44 NUMSOLVE~27 NUMSOLVE~3 * 33A62
          NUMSOLVE~17 NUMSOLVE~23 NOT?GOTO NUMSOLVE~2.L27 NUMSOLVE~32 * 33A80
          OBJ_34817 NUMSOLVE~38 ?SKIP NUMSOLVE~34 * 33A99
          BINT1 NUMSOLVE~21 BINT18 NUMSOLVE~21 BINT35 NUMSOLVE~21 GOTO * 33AAD
          NUMSOLVE~2.loop21                      * 33AD0
NUMSOLVE~2.L27:
          BINT101 NUMSOLVE~21 BINT84 NUMSOLVE~21 BINT67 NUMSOLVE~21 BINT1 * 33AD5
          NUMSOLVE~21 BINT18 NUMSOLVE~21 BINT35 NUMSOLVE~21 * 33AF8
NUMSOLVE~2.L28:
          FALSE 4PUTLAM                          * 33B11
NUMSOLVE~2.loop29:
          NUMSOLVE~10 BINT69 NUMSOLVE~24 ?GOTO NUMSOLVE~2.L30 DROP 4GETLAM * 33B1B
          ?GOTO NUMSOLVE~2.L34 TRUE 4PUTLAM NUMSOLVE~34 GOTO * 33B3E
          NUMSOLVE~2.loop29                      * 33B5C
NUMSOLVE~2.L30:
          NUMSOLVE~27 NUMSOLVE~3 NUMSOLVE~18 NUMSOLVE~23 NOT?GOTO * 33B61
          NUMSOLVE~2.L31 NUMSOLVE~32 NUMSOLVE~33 NUMSOLVE~38 NOT?GOTO * 33B7A
          NUMSOLVE~2.L32 BINT20 NUMSOLVE~21 BINT35 NUMSOLVE~21 BINT69 * 33B93
          NUMSOLVE~21 BINT86 NUMSOLVE~21 GOTO NUMSOLVE~2.loop20 * 33BB1
NUMSOLVE~2.L31:
          BINT67 GOTO NUMSOLVE~2.L33             * 33BCA
NUMSOLVE~2.L32:
          BINT101 NUMSOLVE~21 BINT83             * 33BD9
NUMSOLVE~2.L33:
          NUMSOLVE~21 4GETLAM ?SKIP NUMSOLVE~34  * 33BE8
          GOTO NUMSOLVE~2.loop29                 * 33BFC
NUMSOLVE~2.L34:
          OBJ_33C24 BINT1 BINT5 GOTO OBJ_33C24.L1 * 33C06
NUMSOLVE~2.L35:
          DROP                                   * 33C1F

* refs (1): 33C06
OBJ_33C24:
          # A05 BINT2 BINT4                      * 33C24
OBJ_33C24.L1:
          NUMSOLVE~20 DROP OBJ_34771             * 33C38
NUMSOLVE~46:
          OBJ_33DAA OVER 4UNROLL XEQSTOID 7GETLAM ABND ?SKIP FLUSHKEYS * 33C47
          COLA TRUE                              * 33C6F
NUMSOLVE~46.L1:
          DROP                                   * 33C79

* refs (3): 33643 336A7 337FB
OBJ_33C7E:
          # A06 OBJ_347AE GOTO NUMSOLVE~46       * 33C7E
NUMSOLVE~47:
          RDROP # 12F GOTO OBJ_33CCE.L2 RDROP    * 33C97
NUMSOLVE~47.L1:
          DROP                                   * 33CB5

* refs (3): 333D7 33459 3349F
OBJ_33CBA:
          # A01 GOTO OBJ_33CCE.L1                * 33CBA

* refs (1): 3352B
OBJ_33CCE:
          # A02                                  * 33CCE  2562
OBJ_33CCE.L1:
          4GETLAM 5GETLAM XEQSTOID               * 33CD8
OBJ_33CCE.L2:
          7GETLAM ABND ?SKIP FLUSHKEYS           * 33CE7
          FALSE ;                                * 33CFB

* refs (12): 3315C 331A7 331C5 33387 333A0 3341D ...
NUMSOLVE~3:
        :: NUMSOLVE~31 OBJ_33DAA XEQSTOID 6GETLAM ERRSET CRUNCH ERRTRAP * 33D05
          NUMSOLVE~4 0LASTOWDOB! CK1NOLASTWD DUPTYPEREAL? ?GOTO * 33D2D
          NUMSOLVE~3.L1 DUP TYPECMP? ?GOTO NUMSOLVE~5 DUPTYPEEXT? NOT?GOTO * 33D46
          NUMSOLVE~47 U>nbr                      * 33D69
NUMSOLVE~3.L1:
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
            GOYES   NUMSOLVE~4.L2                * 33E05
            RSTK=C                               * 33E07
            LC(5)   #00203                       * 33E09
            ?C=A    A                            * 33E10
            GOYES   NUMSOLVE~4.L1                * 33E13
            LC(3)   #300                         * 33E15
            ?C=A    XS                           * 33E1A
            GOYES   NUMSOLVE~4.L1                * 33E1D
            LC(3)   #B00                         * 33E1F
            ?C=A    XS                           * 33E24
            GOYES   NUMSOLVE~4.L1                * 33E27
            LC(5)   ERRJMP                       * 33E29
            A=C     A                            * 33E30
            PC=(A)                               * 33E32
NUMSOLVE~4.L1:
            A=0     A                            * 33E36
            C=RSTK                               * 33E38
            GOC     NUMSOLVE~4.L3                * 33E3A
NUMSOLVE~4.L2:
            D0=(5)  ATTNFLG                      * 33E3D
            A=A+1   A                            * 33E44
NUMSOLVE~4.L3:
            DAT0=A  A                            * 33E46
            D0=C                                 * 33E49
            GOLONG  NUMSOLVE~29.L3               * 33E4C
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
            GOTO    NUMSOLVE~21.L1               * 33EA9
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
