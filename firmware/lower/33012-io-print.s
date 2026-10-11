* HP 48GX ROM revision R, #33012-#34005: I/O and printing
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: NUMSOLVE {<E>} Code_33E7F 7NULLLAM{}
* Follows on from the previous file (at #33012 in the original ROM).
        RPL

* refs (3): 3312F 33139 33143
OBJ_33012:
        ::                                       * 33012
          2DUP                                   * 33017
          %<>                                    * 3301C
          case                                   * 33021
          %MAXorder                              * 33026
          DROPRDROP                              * 3302B
          GOTO                                   * 33030
          L_3335A                                * 33035
        ;                                        * 3303A

* refs (2): 32FB3 33008
NUMSOLVE:
        ::                                       * 3303F
          DEPTH                                  * 33044
          #4-                                    * 33049

{<E>}:
          {                                      * 3304E
            BINT14                               * 33053
          }                                      * 33058
          %0_2A2B4                               * 3305D
          MAKEARRY                               * 33062
          FALSE                                  * 33067

* -> {}
7NULLLAM{}:
          {                                      * 3306C
            NULLLAM                              * 33071
            NULLLAM                              * 33076
            NULLLAM                              * 3307B
            NULLLAM                              * 33080
            NULLLAM                              * 33085
            NULLLAM                              * 3308A
            NULLLAM                              * 3308F
          }                                      * 33094
          BIND                                   * 33099
          4GETLAM                                * 3309E
          DUPTYPELIST?                           * 330A3
          ?SKIP                                  * 330A8
          ONE{}N                                 * 330AD
          DUPNULLCOMP?                           * 330B2
          ?GOTO                                  * 330B7
          L_33CB5                                * 330BC
          DUPDUP                                 * 330C1
          OBJ_1DF30                              * 330C6
          2GETLAM                                * 330CB
          1ABNDSWAP                              * 330D0
          DUPTYPEEXT?                            * 330D5
          ITE                                    * 330DA
          ::                                     * 330DF
            5GETLAM                              * 330E4
            XEQSTOID                             * 330E9
          ;                                      * 330EE
          DROP                                   * 330F3
          DUPLENCOMP                             * 330F8
          OBJ_4D2EF                              * 330FD
          ?GOTO                                  * 33102
          L_33CB5                                * 33107
          INNERCOMP                              * 3310C
          DUP#1=                                 * 33111
          IT                                     * 33116
          OVERSWAP                               * 3311B
          #3=                                    * 33120
          NOT?GOTO                               * 33125
          L_3335A                                * 3312A
          OBJ_33012                              * 3312F
          ROT                                    * 33134
          OBJ_33012                              * 33139
          3UNROLL                                * 3313E
          OBJ_33012                              * 33143
          SWAP                                   * 33148
          OBJ_346F8                              * 3314D
          OBJ_34708                              * 33152
          OBJ_346E8                              * 33157
          OBJ_33D05                              * 3315C
          BINT35                                 * 33161
          OBJ_3431F                              * 33166
          BINT53                                 * 3316B
          OBJ_3431F                              * 33170
          OBJ_3414E                              * 33175
          OBJ_34957                              * 3317A
          BINT2                                  * 3317F
          OBJ_3437C                              * 33184
          ?GOTO                                  * 33189
          L_331A7                                * 3318E
          BINT18                                 * 33193
          OBJ_3431F                              * 33198
          GOTO                                   * 3319D
          L_33387                                * 331A2
L_331A7:
          OBJ_33D05                              * 331A7
          OBJ_3414E                              * 331AC
          OBJ_347AE                              * 331B1
          BINT67                                 * 331B6
          OBJ_3431F                              * 331BB
          OBJ_346E8                              * 331C0
          OBJ_33D05                              * 331C5
          OBJ_3414E                              * 331CA
          OBJ_34394                              * 331CF
          ?GOTO                                  * 331D4
          L_331F2                                * 331D9
          BINT83                                 * 331DE
          OBJ_3431F                              * 331E3
          GOTO                                   * 331E8
          L_333E1                                * 331ED
L_331F2:
          BINT4                                  * 331F2
          OBJ_3437C                              * 331F7
          ?GOTO                                  * 331FC
          L_3325B                                * 33201
          OBJ_347F7                              * 33206
          OBJ_34807                              * 3320B
          OBJ_34A1A                              * 33210
          NOT?GOTO                               * 33215
          L_334A4                                * 3321A
          BINT101                                * 3321F
          OBJ_3431F                              * 33224
          BINT83                                 * 33229
          OBJ_3431F                              * 3322E
          BINT1                                  * 33233
          OBJ_3431F                              * 33238
          BINT18                                 * 3323D
          OBJ_3431F                              * 33242
          BINT36                                 * 33247
          OBJ_3431F                              * 3324C
          GOTO                                   * 33251
          L_33B11                                * 33256
L_3325B:
          OBJ_347F7                              * 3325B
          OBJ_34817                              * 33260
          %<>                                    * 33265
          ?GOTO                                  * 3326A
          L_33297                                * 3326F
          OBJ_34817                              * 33274
          OBJ_34807                              * 33279
          %<>                                    * 3327E
          ?GOTO                                  * 33283
          L_336AC                                * 33288
          GOTO                                   * 3328D
          L_334A4                                * 33292
L_33297:
          OBJ_347F7                              * 33297
          OBJ_34817                              * 3329C
          OBJ_34A1A                              * 332A1
          ?GOTO                                  * 332A6
          L_33819                                * 332AB
          OBJ_347F7                              * 332B0
          %ABS                                   * 332B5
          OBJ_34817                              * 332BA
          %ABS                                   * 332BF
          %>                                     * 332C4
          ?GOTO                                  * 332C9
          L_336AC                                * 332CE
          OBJ_34807                              * 332D3
          OBJ_34817                              * 332D8
          2DUP                                   * 332DD
          OBJ_34A1A                              * 332E2
          ?GOTO                                  * 332E7
          L_33800                                * 332EC
          %ABS                                   * 332F1
          SWAP                                   * 332F6
          %ABS                                   * 332FB
          %>                                     * 33300
          ?GOTO                                  * 33305
          L_3331E                                * 3330A
          OBJ_3491B                              * 3330F
          GOTO                                   * 33314
          L_335DA                                * 33319
L_3331E:
          OBJ_347F7                              * 3331E
          %ABS                                   * 33323
          OBJ_34807                              * 33328
          %ABS                                   * 3332D
          %>=                                    * 33332
          ?GOTO                                  * 33337
          L_335C6                                * 3333C
          OBJ_3491B                              * 33341
          GOTO                                   * 33346
          L_335DA                                * 3334B
          DUP                                    * 33350
          OBJ_349C6                              * 33355
L_3335A:
          2DUP                                   * 3335A
          %=                                     * 3335F
          IT                                     * 33364
          OBJ_349C6                              * 33369
          %MAXorder                              * 3336E
          SWAP                                   * 33373
          OBJ_346F8                              * 33378
          OBJ_346E8                              * 3337D
          OBJ_34957                              * 33382
L_33387:
          OBJ_33D05                              * 33387
          BINT35                                 * 3338C
          OBJ_3431F                              * 33391
          BINT52                                 * 33396
          OBJ_3431F                              * 3339B
          OBJ_33D05                              * 333A0
          BINT67                                 * 333A5
          OBJ_3431F                              * 333AA
          OBJ_3414E                              * 333AF
          BINT2                                  * 333B4
          OBJ_3437C                              * 333B9
          ?GOTO                                  * 333BE
          L_333E1                                * 333C3
          BINT4                                  * 333C8
          OBJ_3437C                              * 333CD
          NOT?GOTO                               * 333D2
          OBJ_33CBA                              * 333D7
          OBJ_3491B                              * 333DC
L_333E1:
          BINT4                                  * 333E1
          OBJ_3437C                              * 333E6
          ?GOTO                                  * 333EB
          L_334BD                                * 333F0
          OBJ_34024                              * 333F5
          BINT84                                 * 333FA
          OBJ_3431F                              * 333FF
          BINT36                                 * 33404
          OBJ_343D1                              * 33409
          NOT?GOTO                               * 3340E
          L_3343B                                * 33413
          OBJ_346E8                              * 33418
          OBJ_33D05                              * 3341D
          OBJ_34176                              * 33422
          BINT67                                 * 33427
          OBJ_3431F                              * 3342C
          GOTO                                   * 33431
          L_333E1                                * 33436
L_3343B:
          DROP                                   * 3343B
          BINT101                                * 33440
          OBJ_3431F                              * 33445
          BINT33                                 * 3344A
          OBJ_34546                              * 3344F
          NOT?GOTO                               * 33454
          OBJ_33CBA                              * 33459
          OBJ_346E8                              * 3345E
          OBJ_33D05                              * 33463
          OBJ_34176                              * 33468
          BINT66                                 * 3346D
          OBJ_3431F                              * 33472
          BINT35                                 * 33477
          OBJ_3431F                              * 3347C
          OBJ_3491B                              * 33481
          OBJ_34394                              * 33486
          ?GOTO                                  * 3348B
          L_334BD                                * 33490
          OBJ_34024                              * 33495
          GOTO                                   * 3349A
          OBJ_33CBA                              * 3349F
L_334A4:
          BINT67                                 * 334A4
          OBJ_3431F                              * 334A9
          OBJ_34389                              * 334AE
          IT                                     * 334B3
          OBJ_3491B                              * 334B8
L_334BD:
          OBJ_34817                              * 334BD
          OBJ_347F7                              * 334C2
          %<>                                    * 334C7
          ?GOTO                                  * 334CC
          L_33580                                * 334D1
          OBJ_34024                              * 334D6
L_334DB:
          OBJ_347AE                              * 334DB
          OBJ_3478E                              * 334E0
          OBJ_34C21                              * 334E5
          BINT4                                  * 334EA
          BINT5                                  * 334EF
          OBJ_344C7                              * 334F4
          ?GOTO                                  * 334F9
          L_33549                                * 334FE
          DROP                                   * 33503
L_33508:
          BINT69                                 * 33508
          OBJ_343D1                              * 3350D
          ?GOTO                                  * 33512
          L_33549                                * 33517
          DROP                                   * 3351C
          OBJ_34389                              * 33521
          NOT?GOTO                               * 33526
          OBJ_33CCE                              * 3352B
          BINT101                                * 33530
          OBJ_3431F                              * 33535
          OBJ_3491B                              * 3353A
          GOTO                                   * 3353F
          L_334DB                                * 33544
L_33549:
          OBJ_346E8                              * 33549
          OBJ_33D05                              * 3354E
          OBJ_3419E                              * 33553
          OBJ_34394                              * 33558
          ?GOTO                                  * 3355D
          L_334A4                                * 33562
          BINT83                                 * 33567
          OBJ_3431F                              * 3356C
          OBJ_34006                              * 33571
          GOTO                                   * 33576
          L_33508                                * 3357B
L_33580:
          OBJ_34817                              * 33580
          OBJ_347F7                              * 33585
          OVER                                   * 3358A
          %ABS                                   * 3358F
          OVER                                   * 33594
          %ABS                                   * 33599
          %<                                     * 3359E
          ?SKIP                                  * 335A3
          OBJ_3491B                              * 335A8
          OBJ_34A1A                              * 335AD
          ?GOTO                                  * 335B2
          L_33819                                * 335B7
          GOTO                                   * 335BC
          L_335DA                                * 335C1
L_335C6:
          BINT36                                 * 335C6
          OBJ_3431F                              * 335CB
          BINT67                                 * 335D0
          OBJ_3431F                              * 335D5
L_335DA:
          OBJ_34024                              * 335DA
          BINT7                                  * 335DF
          4PUTLAM                                * 335E4
          BINT18                                 * 335E9
          OBJ_3431F                              * 335EE
          OBJ_347AE                              * 335F3
          OBJ_3478E                              * 335F8
          OBJ_347F7                              * 335FD
          OBJ_34817                              * 33602
          OBJ_34BB5                              * 33607
          BINT4                                  * 3360C
          BINT5                                  * 33611
          OBJ_344C7                              * 33616
          ?GOTO                                  * 3361B
          L_33648                                * 33620
          #5=                                    * 33625
          ?GOTO                                  * 3362A
          L_33689                                * 3362F
          BINT69                                 * 33634
          OBJ_34546                              * 33639
          NOT?GOTO                               * 3363E
          OBJ_33C7E                              * 33643
L_33648:
          %0_2A2B4                               * 33648
          BINT4                                  * 3364D
          BINT5                                  * 33652
          OBJ_34CE2                              * 33657
          OBJ_346E8                              * 3365C
          OBJ_33D05                              * 33661
          OBJ_341C6                              * 33666
L_3366B:
          OBJ_34394                              * 3366B
          ?GOTO                                  * 33670
          L_336B6                                * 33675
          BINT83                                 * 3367A
          OBJ_3431F                              * 3367F
          OBJ_34006                              * 33684
L_33689:
          BINT69                                 * 33689
          OBJ_343D1                              * 3368E
          ?GOTO                                  * 33693
          L_33648                                * 33698
          DROP                                   * 3369D
          GOTO                                   * 336A2
          OBJ_33C7E                              * 336A7
L_336AC:
          BINT7                                  * 336AC
          4PUTLAM                                * 336B1
L_336B6:
          OBJ_34807                              * 336B6
          OBJ_34817                              * 336BB
          2DUP                                   * 336C0
          OBJ_34A1A                              * 336C5
          ?GOTO                                  * 336CA
          L_33800                                * 336CF
          %ABS                                   * 336D4
          SWAP                                   * 336D9
          %ABS                                   * 336DE
          %>=                                    * 336E3
          ?GOTO                                  * 336E8
          L_335C6                                * 336ED
          4GETLAM                                * 336F2
          #1-                                    * 336F7
          DUP#0=                                 * 336FC
          ?GOTO                                  * 33701
          L_33C79                                * 33706
          4PUTLAM                                * 3370B
          BINT83                                 * 33710
          OBJ_3431F                              * 33715
          OBJ_34006                              * 3371A
          OBJ_3491B                              * 3371F
          OBJ_33F6B                              * 33724
          OBJ_3491B                              * 33729
          3UNROLL                                * 3372E
          5ROLL                                  * 33733
          SWAP                                   * 33738
          OBJ_347AE                              * 3373D
          %>%%                                   * 33742
          6UNROLL                                * 33747
          OBJ_34B2D                              * 3374C
          BINT1                                  * 33751
          BINT5                                  * 33756
          OBJ_344C7                              * 3375B
          NOT?GOTO                               * 33760
          L_33C79                                * 33765
          DUP                                    * 3376A
          OBJ_347AE                              * 3376F
          %=                                     * 33774
          ?GOTO                                  * 33779
          L_337DD                                * 3377E
          DUP                                    * 33783
          OBJ_347AE                              * 33788
          1GETLAM                                * 3378D
          ITE                                    * 33792
          %<                                     * 33797
          %>                                     * 3379C
          ?GOTO                                  * 337A1
          L_337C4                                * 337A6
          BINT36                                 * 337AB
          OBJ_3431F                              * 337B0
          BINT69                                 * 337B5
          OBJ_3431F                              * 337BA
          OBJ_3491B                              * 337BF
L_337C4:
          OBJ_346E8                              * 337C4
          OBJ_33D05                              * 337C9
          OBJ_341EE                              * 337CE
          GOTO                                   * 337D3
          L_3366B                                * 337D8
L_337DD:
          DROP                                   * 337DD
          BINT69                                 * 337E2
          OBJ_34546                              * 337E7
          ?GOTO                                  * 337EC
          L_337C4                                * 337F1
          GOTO                                   * 337F6
          OBJ_33C7E                              * 337FB
L_33800:
          2DROP                                  * 33800
          BINT36                                 * 33805
          OBJ_3431F                              * 3380A
          BINT67                                 * 3380F
          OBJ_3431F                              * 33814
L_33819:
          BINT1                                  * 33819
          OBJ_3431F                              * 3381E
          BINT101                                * 33823
          OBJ_3431F                              * 33828
L_3382D:
          OBJ_34024                              * 3382D
          BINT36                                 * 33832
          OBJ_343D1                              * 33837
          NOT?GOTO                               * 3383C
          L_33C1F                                * 33841
          OBJ_34627                              * 33846
          ?GOTO                                  * 3384B
          L_33A62                                * 33850
          BINT1                                  * 33855
          OBJ_3437C                              * 3385A
          ?GOTO                                  * 3385F
          L_33891                                * 33864
          DROP                                   * 33869
          OBJ_347AE                              * 3386E
          OBJ_3478E                              * 33873
          OBJ_347F7                              * 33878
          OBJ_34817                              * 3387D
          OBJ_34B77                              * 33882
          GOTO                                   * 33887
          L_33A2B                                * 3388C
L_33891:
          OBJ_33F6B                              * 33891
          OBJ_34817                              * 33896
          OVER                                   * 3389B
          OBJ_34A08                              * 338A0
          ITE                                    * 338A5
          ::                                     * 338AA
            OVER                                 * 338AF
            4PICK                                * 338B4
            %%-                                  * 338B9
            6ROLL                                * 338BE
            %%+                                  * 338C3
            OBJ_34817                            * 338C8
            %>%%                                 * 338CD
            OBJ_347AE                            * 338D2
          ;                                      * 338D7
          ::                                     * 338DC
            5ROLL                                * 338E1
            3PICK                                * 338E6
            %%-                                  * 338EB
            4PICK                                * 338F0
            %%+                                  * 338F5
            OBJ_347F7                            * 338FA
            %>%%                                 * 338FF
            OBJ_3478E                            * 33904
          ;                                      * 33909
          %>%%                                   * 3390E
          7PICK                                  * 33913
          5PICK                                  * 33918
          4ROLL                                  * 3391D
          5ROLL                                  * 33922
          OBJ_34A56                              * 33927
          5UNROLL                                * 3392C
          OBJ_347E7                              * 33931
          OBJ_347F7                              * 33936
          2DUP                                   * 3393B
          %=                                     * 33940
          ?GOTO                                  * 33945
          L_33A1C                                * 3394A
          %ABS                                   * 3394F
          SWAP                                   * 33954
          %ABS                                   * 33959
          %>                                     * 3395E
          ?SKIP                                  * 33963
          OBJ_33EB2                              * 33968
          DUP                                    * 3396D
          %%0=                                   * 33972
          ?GOTO                                  * 33977
          L_33A21                                * 3397C
          OVER                                   * 33981
          %%ABS                                  * 33986
          4PICK                                  * 3398B
          %%ABS                                  * 33990
          %%<                                    * 33995
          ITE                                    * 3399A
          ::                                     * 3399F
            ROTDROP                              * 339A4
            OBJ_3478E                            * 339A9
          ;                                      * 339AE
          ::                                     * 339B3
            SWAPDROP                             * 339B8
            OBJ_347AE                            * 339BD
          ;                                      * 339C2
          %>%%                                   * 339C7
          4UNROLL                                * 339CC
          %%/                                    * 339D1
          %%*                                    * 339D6
          %%+                                    * 339DB
          OBJ_34C49                              * 339E0
          3PICKOVER                              * 339E5
          %>%%-                                  * 339EA
          %%ABS                                  * 339EF
          3PICK                                  * 339F4
          5ROLL                                  * 339F9
          %>%%-                                  * 339FE
          %%ABS                                  * 33A03
          %%>=                                   * 33A08
          NOT?SWAPDROP                           * 33A0D
          GOTO                                   * 33A12
          L_33A2B                                * 33A17
L_33A1C:
          2DROP                                  * 33A1C
L_33A21:
          4DROP                                  * 33A21
          SWAPDROP                               * 33A26
L_33A2B:
          BINT2                                  * 33A2B
          BINT4                                  * 33A30
          OBJ_344C7                              * 33A35
          ?GOTO                                  * 33A3A
          L_33A62                                * 33A3F
          BINT2                                  * 33A44
          #=ITE                                  * 33A49
          BINT36                                 * 33A4E
          BINT66                                 * 33A53
          OBJ_34546                              * 33A58
          DROP                                   * 33A5D
L_33A62:
          %0_2A2B4                               * 33A62
          BINT2                                  * 33A67
          BINT4                                  * 33A6C
          OBJ_34CE2                              * 33A71
          OBJ_346E8                              * 33A76
          OBJ_33D05                              * 33A7B
          OBJ_34216                              * 33A80
          OBJ_34394                              * 33A85
          NOT?GOTO                               * 33A8A
          L_33AD5                                * 33A8F
          OBJ_34807                              * 33A94
          OBJ_34817                              * 33A99
          OBJ_34A1A                              * 33A9E
          ?SKIP                                  * 33AA3
          OBJ_3491B                              * 33AA8
          BINT1                                  * 33AAD
          OBJ_3431F                              * 33AB2
          BINT18                                 * 33AB7
          OBJ_3431F                              * 33ABC
          BINT35                                 * 33AC1
          OBJ_3431F                              * 33AC6
          GOTO                                   * 33ACB
          L_3382D                                * 33AD0
L_33AD5:
          BINT101                                * 33AD5
          OBJ_3431F                              * 33ADA
          BINT84                                 * 33ADF
          OBJ_3431F                              * 33AE4
          BINT67                                 * 33AE9
          OBJ_3431F                              * 33AEE
          BINT1                                  * 33AF3
          OBJ_3431F                              * 33AF8
          BINT18                                 * 33AFD
          OBJ_3431F                              * 33B02
          BINT35                                 * 33B07
          OBJ_3431F                              * 33B0C
L_33B11:
          FALSE                                  * 33B11
          4PUTLAM                                * 33B16
L_33B1B:
          OBJ_34042                              * 33B1B
          BINT69                                 * 33B20
          OBJ_343D1                              * 33B25
          ?GOTO                                  * 33B2A
          L_33B61                                * 33B2F
          DROP                                   * 33B34
          4GETLAM                                * 33B39
          ?GOTO                                  * 33B3E
          L_33C06                                * 33B43
          TRUE                                   * 33B48
          4PUTLAM                                * 33B4D
          OBJ_3491B                              * 33B52
          GOTO                                   * 33B57
          L_33B1B                                * 33B5C
L_33B61:
          OBJ_346E8                              * 33B61
          OBJ_33D05                              * 33B66
          OBJ_3423E                              * 33B6B
          OBJ_34394                              * 33B70
          NOT?GOTO                               * 33B75
          L_33BCA                                * 33B7A
          OBJ_34807                              * 33B7F
          OBJ_34827                              * 33B84
          OBJ_34A1A                              * 33B89
          NOT?GOTO                               * 33B8E
          L_33BD9                                * 33B93
          BINT20                                 * 33B98
          OBJ_3431F                              * 33B9D
          BINT35                                 * 33BA2
          OBJ_3431F                              * 33BA7
          BINT69                                 * 33BAC
          OBJ_3431F                              * 33BB1
          BINT86                                 * 33BB6
          OBJ_3431F                              * 33BBB
          GOTO                                   * 33BC0
          L_33819                                * 33BC5
L_33BCA:
          BINT67                                 * 33BCA
          GOTO                                   * 33BCF
          L_33BE8                                * 33BD4
L_33BD9:
          BINT101                                * 33BD9
          OBJ_3431F                              * 33BDE
          BINT83                                 * 33BE3
L_33BE8:
          OBJ_3431F                              * 33BE8
          4GETLAM                                * 33BED
          ?SKIP                                  * 33BF2
          OBJ_3491B                              * 33BF7
          GOTO                                   * 33BFC
          L_33B1B                                * 33C01
L_33C06:
          OBJ_33C24                              * 33C06
          BINT1                                  * 33C0B
          BINT5                                  * 33C10
          GOTO                                   * 33C15
          L_33C38                                * 33C1A
L_33C1F:
          DROP                                   * 33C1F

* refs (1): 33C06
OBJ_33C24:
          #       A05                            * 33C24  2565
          BINT2                                  * 33C2E
          BINT4                                  * 33C33
L_33C38:
          OBJ_3425C                              * 33C38
          DROP                                   * 33C3D
          OBJ_34771                              * 33C42
L_33C47:
          OBJ_33DAA                              * 33C47
          OVER                                   * 33C4C
          4UNROLL                                * 33C51
          XEQSTOID                               * 33C56
          7GETLAM                                * 33C5B
          ABND                                   * 33C60
          ?SKIP                                  * 33C65
          FLUSHKEYS                              * 33C6A
          COLA                                   * 33C6F
          TRUE                                   * 33C74
L_33C79:
          DROP                                   * 33C79

* refs (3): 33643 336A7 337FB
OBJ_33C7E:
          #       A06                            * 33C7E  2566
          OBJ_347AE                              * 33C88
          GOTO                                   * 33C8D
          L_33C47                                * 33C92
L_33C97:
          RDROP                                  * 33C97
          #       12F                            * 33C9C  303
          GOTO                                   * 33CA6
          L_33CE7                                * 33CAB
          RDROP                                  * 33CB0
L_33CB5:
          DROP                                   * 33CB5

* refs (3): 333D7 33459 3349F
OBJ_33CBA:
          #       A01                            * 33CBA  2561
          GOTO                                   * 33CC4
          L_33CD8                                * 33CC9

* refs (1): 3352B
OBJ_33CCE:
          #       A02                            * 33CCE  2562
L_33CD8:
          4GETLAM                                * 33CD8
          5GETLAM                                * 33CDD
          XEQSTOID                               * 33CE2
L_33CE7:
          7GETLAM                                * 33CE7
          ABND                                   * 33CEC
          ?SKIP                                  * 33CF1
          FLUSHKEYS                              * 33CF6
          FALSE                                  * 33CFB
        ;                                        * 33D00

* refs (12): 3315C 331A7 331C5 33387 333A0 3341D ...
OBJ_33D05:
        ::                                       * 33D05
          OBJ_3479E                              * 33D0A
          OBJ_33DAA                              * 33D0F
          XEQSTOID                               * 33D14
          6GETLAM                                * 33D19
          ERRSET                                 * 33D1E
          CRUNCH                                 * 33D23
          ERRTRAP                                * 33D28
          OBJ_33DDC                              * 33D2D
          0LASTOWDOB!                            * 33D32
          CK1NOLASTWD                            * 33D37
          DUPTYPEREAL?                           * 33D3C
          ?GOTO                                  * 33D41
          L_33D73                                * 33D46
          DUP                                    * 33D4B
          TYPECMP?                               * 33D50
          ?GOTO                                  * 33D55
          L_33E52                                * 33D5A
          DUPTYPEEXT?                            * 33D5F
          NOT?GOTO                               * 33D64
          L_33C97                                * 33D69
          U>nbr                                  * 33D6E
L_33D73:
          DUP                                    * 33D73
          OBJ_3474E                              * 33D78
          %0<>                                   * 33D7D
          ?SEMI                                  * 33D82
          RDROP                                  * 33D87

* refs (2): 48B93 49C2C
OBJ_33D8C:
          #       A04                            * 33D8C  2564
          OBJ_3479E                              * 33D96
          GOTO                                   * 33D9B
          L_33C47                                * 33DA0
        ;                                        * 33DA5

* refs (3): 33C47 33D0F 342BB
OBJ_33DAA:
        ::                                       * 33DAA
          5GETLAM                                * 33DAF
          dup;RclInVars(gn)?                     * 33DB4
          NOT?SEMI                               * 33DB9
          DUPTYPEEXT?                            * 33DBE
          NOTcaseDROP                            * 33DC3
          ROT                                    * 33DC8
          Unbr>U                                 * 33DCD
          SWAP                                   * 33DD2
        ;                                        * 33DD7

* refs (1): 33D2D
OBJ_33DDC:
        ::                                       * 33DDC
          RDROP                                  * 33DE1
          0LASTOWDOB!                            * 33DE6
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
          DEPTH                                  * 33E52
          3GETLAM                                * 33E57
          2DUP#>                                 * 33E5C
          ITE                                    * 33E61
          #-                                     * 33E66
          BINT2                                  * 33E6B
          NDROP                                  * 33E70
          CK0NOLASTWD                            * 33E75
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
OBJ_33EB2:
        ::                                       * 33EB2
          4DROP                                  * 33EB7
          OBJ_347E7                              * 33EBC
          %>%%1/                                 * 33EC1
          OBJ_347F7                              * 33EC6
          %>%%1/                                 * 33ECB
          OBJ_34817                              * 33ED0
          %>%%1/                                 * 33ED5
          2DUP                                   * 33EDA
          %%-                                    * 33EDF
          OBJ_3478E                              * 33EE4
          OBJ_347AE                              * 33EE9
          %>%%-                                  * 33EEE
          DUP                                    * 33EF3
          OBJ_3477E                              * 33EF8
          OBJ_347AE                              * 33EFD
          %>%%-                                  * 33F02
          %%/                                    * 33F07
          OVER                                   * 33F0C
          OBJ_3478E                              * 33F11
          OBJ_3477E                              * 33F16
          %>%%-                                  * 33F1B
          %%/                                    * 33F20
          6ROLL                                  * 33F25
          7PICK                                  * 33F2A
          %%-                                    * 33F2F
          %%*                                    * 33F34
          6ROLL                                  * 33F39
          6ROLL                                  * 33F3E
          %%-                                    * 33F43
          3PICK                                  * 33F48
          %%*ROT                                 * 33F4D
          3PICK                                  * 33F52
          6ROLL                                  * 33F57
          %%-                                    * 33F5C
          %%*                                    * 33F61
        ;                                        * 33F66

* refs (2): 33724 33891
OBJ_33F6B:
        ::                                       * 33F6B
          OBJ_347F7                              * 33F70
          OBJ_34817                              * 33F75
          %>%%-                                  * 33F7A
          OBJ_3478E                              * 33F7F
          OBJ_347AE                              * 33F84
          %>%%-                                  * 33F89
          DUP                                    * 33F8E
          OBJ_3477E                              * 33F93
          OBJ_347AE                              * 33F98
          %>%%-                                  * 33F9D
          %%/                                    * 33FA2
          OVER                                   * 33FA7
          OBJ_3478E                              * 33FAC
          OBJ_3477E                              * 33FB1
          %>%%-                                  * 33FB6
          %%/                                    * 33FBB
          OBJ_347F7                              * 33FC0
          OBJ_347E7                              * 33FC5
          %>%%-                                  * 33FCA
          %%*                                    * 33FCF
          OVER                                   * 33FD4
          OBJ_347E7                              * 33FD9
          OBJ_34817                              * 33FDE
          %>%%-                                  * 33FE3
          %%*ROT                                 * 33FE8
          3PICK                                  * 33FED
          6PICK                                  * 33FF2
          %%-                                    * 33FF7
          %%*                                    * 33FFC
        ;                                        * 34001
