* HP 48GX ROM revision R, #5A01D-#5D01C: Symbolic algebra
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: meta+ meta* metaneg evalcase: addt* metainv meta/ addtNEG uncrunch meta- dvars? drpmeta/
* Follows on from the previous file (at #5A01D in the original ROM).
        RPL

* ob ob' -> ob'' ob'
* refs (10): 591EE 59605 5A126 5A301 5A379 5A446 ...
SWAPcompSWAP:
        ::                                       * 5A01D
          SWAP                                   * 5A022
          symcomp                                * 5A027
          SWAP                                   * 5A02C
        ;                                        * 5A031

* ->
* refs (14): 1F5FB 49D17 4BC9C 4DAE9 57315 57D95 ...
uncrunch:
        ::                                       * 5A036
          'R                                     * 5A03B
          NOTNUM?                                * 5A040
          CLRNUM                                 * 5A045
          ERRSET                                 * 5A04A
          ITE                                    * 5A04F
          ::                                     * 5A054
            EVAL                                 * 5A059
            ERRTRAP                              * 5A05E
            cf(-3);error                         * 5A063
            CLRNUM                               * 5A068
          ;                                      * 5A06D
          ::                                     * 5A072
            EVAL                                 * 5A077
            ERRTRAP                              * 5A07C
            sf(-3);error                         * 5A081
            SETNUM                               * 5A086
          ;                                      * 5A08B
        ;                                        * 5A090

* refs (2): 84EA9 84ECC
OBJ_5A095:
        ::                                       * 5A095
          DROP'                                  * 5A09A
          xFCNAPPLY                              * 5A09F
          pshm1                                  * 5A0A4
          pullpsh1&                              * 5A0A9
          pullpsh1&                              * 5A0AE
          COLA                                   * 5A0B3
          OBJ_548D2                              * 5A0B8
        ;                                        * 5A0BD

* refs (4): 8502F 850F2 851D8 8683F
OBJ_5A0C2:
        ::                                       * 5A0C2
          OVER                                   * 5A0C7
          pshm1                                  * 5A0CC
          #1-SWAP                                * 5A0D1
          ZERO_DO                                * 5A0D6
          larg                                   * 5A0DB
          CKSYMBN                                * 5A0E0
          symcomp                                * 5A0E5
          psh1&                                  * 5A0EA
          LOOP                                   * 5A0EF
          DROP                                   * 5A0F4
        ;                                        * 5A0F9

* refs (3): 85048 85183 85269
OBJ_5A0FE:
        ::                                       * 5A0FE
          CK2NOLASTWD                            * 5A103
          OVER                                   * 5A108
          BINT1                                  * 5A10D
          nmetasyms                              * 5A112
          TYPESYMB?                              * 5A117
          case                                   * 5A11C
          OBJ_5A14E                              * 5A121
          SWAPcompSWAP                           * 5A126
          COLA                                   * 5A12B

* refs (1): 5A199
OBJ_5A130:
          ::                                     * 5A130
            INCOMPDROP                           * 5A135
            COLA                                 * 5A13A
            XEQSYMWHERE                          * 5A13F
          ;                                      * 5A144
        ;                                        * 5A149

* refs (1): 5A121
OBJ_5A14E:
        ::                                       * 5A14E
          OVER                                   * 5A153
          INNERCOMP                              * 5A158
          #1-SWAP                                * 5A15D
          pshm1                                  * 5A162
          #1+NDROP                               * 5A167
          REQcasedrop                            * 5A16C
          xWHERE                                 * 5A171
          ::                                     * 5A176
            INNERCOMP                            * 5A17B
            #1+DUP                               * 5A180
            Cr                                   * 5A185
            xWHERE                               * 5A18A
          ;                                      * 5A18F
          drop;dq                                * 5A194
          OBJ_5A130                              * 5A199
        ;                                        * 5A19E

* refs (2): 8515B 85241
OBJ_5A1A3:
        ::                                       * 5A1A3
          #1-SWAP                                * 5A1A8
          dvarlsBIND                             * 5A1AD
          dup                                    * 5A1B2
          BEGIN                                  * 5A1B7
          #1-SWAP                                * 5A1BC
          EXPLODE                                * 5A1C1
          1GETLAM                                * 5A1C6
          CARCOMP                                * 5A1CB
          OBJ_57676                              * 5A1D0
          case                                   * 5A1D5
          IDCONFERR                              * 5A1DA
          DROPNDROP                              * 5A1DF
          #0=UNTIL                               * 5A1E4
          DROP                                   * 5A1E9
          1GETABND                               * 5A1EE
        ;                                        * 5A1F3

* refs (1): 1F03F
OBJ_5A1F8:
        {                                        * 5A1F8
          OBJ_5A2F7                              * 5A1FD
          =1(s)?                                 * 5A202
          OBJ_5A4E6                              * 5A207
        }                                        * 5A20C

* refs (1): 1F271
OBJ_5A211:
        {                                        * 5A211
          OBJ_5A333                              * 5A216
          =4(s)?                                 * 5A21B
          OBJ_5A504                              * 5A220
        }                                        * 5A225

* refs (1): 1F344
OBJ_5A22A:
        {                                        * 5A22A
          OBJ_5A365                              * 5A22F
          =1(s)?                                 * 5A234
        }                                        * 5A239

* refs (1): 1F42F
OBJ_5A23E:
        {                                        * 5A23E
          OBJ_5A397                              * 5A243
          OBJ_5A4B9                              * 5A248
          OBJ_5A518                              * 5A24D
        }                                        * 5A252

* refs (1): 1A49A
OBJ_5A257:
        {                                        * 5A257
          OBJ_5A3EC                              * 5A25C
          drop;false                             * 5A261
        }                                        * 5A266

* refs (1): 1F538
OBJ_5A26B:
        {                                        * 5A26B
          OBJ_5A419                              * 5A270
          drop;false                             * 5A275
        }                                        * 5A27A

* refs (1): 1F5F1
OBJ_5A27F:
        {                                        * 5A27F
          OBJ_5A432                              * 5A284
          drop;=1(s)?                            * 5A289
          OBJ_5A53B                              * 5A28E
        }                                        * 5A293

* refs (1): 1FB2C
OBJ_5A298:
        {                                        * 5A298
          OBJ_5A45A                              * 5A29D
          drop;false                             * 5A2A2
        }                                        * 5A2A7

* refs (1): 1B238
OBJ_5A2AC:
        {                                        * 5A2AC
          NOP                                    * 5A2B1
          DROPFALSE                              * 5A2B6
          ::                                     * 5A2BB
            DROP                                 * 5A2C0
            ROTSWAP                              * 5A2C5
            '                                    * 5A2CA
            rpnXROOT                             * 5A2CF
          ;                                      * 5A2D4
        }                                        * 5A2D9
        BSS     25                               * 5A2DE

* refs (1): 5A1FD
OBJ_5A2F7:
        ::                                       * 5A2F7
          pshzerpsharg                           * 5A2FC
          SWAPcompSWAP                           * 5A301
          psh                                    * 5A306
          ::                                     * 5A30B

* refs (8): 5A34C 5A388 5A3D8 5A3FB 5A40A 5A423 ...
symbn:
            ::                                   * 5A310
              CKSYMBN                            * 5A315
              symcomp                            * 5A31A
            ;                                    * 5A31F
            SWAP#1+                              * 5A324
          ;                                      * 5A329
        ;                                        * 5A32E

* refs (2): 5A216 C0D1E
OBJ_5A333:
        ::                                       * 5A333
          #1-SWAP                                * 5A338
          symcomp                                * 5A33D
          OVER#2+UNROL                           * 5A342
          larg                                   * 5A347
          symbn                                  * 5A34C
          SWAP#1+                                * 5A351
          get1                                   * 5A356
          SWAP#1+                                * 5A35B
        ;                                        * 5A360

* refs (1): 5A22F
OBJ_5A365:
        ::                                       * 5A365
          pshzerpsharg                           * 5A36A
          pshzerpsharg                           * 5A36F
          parg&                                  * 5A374
          SWAPcompSWAP                           * 5A379
          pshtop&                                * 5A37E
          psh                                    * 5A383
          symbn                                  * 5A388
          SWAP#1+                                * 5A38D
        ;                                        * 5A392

* refs (1): 5A243
OBJ_5A397:
        ::                                       * 5A397
          OVER                                   * 5A39C
          pshm1                                  * 5A3A1
          #1-SWAP                                * 5A3A6
          #1-                                    * 5A3AB
          ZERO_DO                                * 5A3B0
          parg&                                  * 5A3B5
          #1-SWAP                                * 5A3BA
          symcomp                                * 5A3BF
          psh1&                                  * 5A3C4
          BINT2                                  * 5A3C9
          +LOOP                                  * 5A3CE
          larg                                   * 5A3D3
          symbn                                  * 5A3D8
          psh1&                                  * 5A3DD
          pshtop&                                * 5A3E2
        ;                                        * 5A3E7

* refs (1): 5A25C
OBJ_5A3EC:
        ::                                       * 5A3EC
          pshzerpsharg                           * 5A3F1
          larg                                   * 5A3F6
          symbn                                  * 5A3FB
          SWAP#1+                                * 5A400
          psh                                    * 5A405
          symbn                                  * 5A40A
          SWAP#1+                                * 5A40F
        ;                                        * 5A414

* refs (1): 5A270
OBJ_5A419:
        ::                                       * 5A419
          larg                                   * 5A41E
          symbn                                  * 5A423
          SWAP#1+                                * 5A428
        ;                                        * 5A42D

* refs (1): 5A284
OBJ_5A432:
        ::                                       * 5A432
          PTR     addt:                          * 5A437
          xAPPLY                                 * 5A43C
          pargop                                 * 5A441
          SWAPcompSWAP                           * 5A446
          pshtop&                                * 5A44B
          SWAPDROP#1-                            * 5A450
        ;                                        * 5A455

* refs (1): 5A29D
OBJ_5A45A:
        ::                                       * 5A45A
          larg                                   * 5A45F
          symbn                                  * 5A464
          SWAP#1+                                * 5A469
        ;                                        * 5A46E

* refs (1): 5A21B
=4(s)?:
        ::                                       * 5A473
          BINT4                                  * 5A478
          #=                                     * 5A47D
        ;                                        * 5A482

* refs (2): 5A202 5A234
=1(s)?:
        ::                                       * 5A487
          #1=                                    * 5A48C
        ;                                        * 5A491

* refs (3): 5A261 5A275 5A2A2
drop;false:
        ::                                       * 5A496
          DROPFALSE                              * 5A49B
        ;                                        * 5A4A0

* refs (1): 5A289
drop;=1(s)?:
        ::                                       * 5A4A5
          DROP                                   * 5A4AA
          #1=                                    * 5A4AF
        ;                                        * 5A4B4

* refs (1): 5A248
OBJ_5A4B9:
        ::                                       * 5A4B9
          DROPONE                                * 5A4BE
          #=casedrpfls                           * 5A4C3
          #2-                                    * 5A4C8
          BINT2                                  * 5A4CD
          #/                                     * 5A4D2
          DROP                                   * 5A4D7
          #0=                                    * 5A4DC
        ;                                        * 5A4E1

* refs (1): 5A207
OBJ_5A4E6:
        ::                                       * 5A4E6
          DROP                                   * 5A4EB
          ROTSWAP                                * 5A4F0
          '                                      * 5A4F5
          DERIV                                  * 5A4FA
        ;                                        * 5A4FF

* refs (1): 5A220
OBJ_5A504:
        ::                                       * 5A504
          DROP'                                  * 5A509
          INTEG                                  * 5A50E
        ;                                        * 5A513

* refs (1): 5A24D
OBJ_5A518:
        ::                                       * 5A518
          DROP#1-                                * 5A51D
          {}N                                    * 5A522
          BINT2                                  * 5A527
          '                                      * 5A52C
          WHERE                                  * 5A531
        ;                                        * 5A536

* refs (1): 5A28E
OBJ_5A53B:
        ::                                       * 5A53B
          DROP#1-                                * 5A540
          {}N                                    * 5A545
          BINT2                                  * 5A54A
          '                                      * 5A54F
          APPLY                                  * 5A554
        ;                                        * 5A559

* refs (1): 5A748
OBJ_5A55E:
        CON(5)  (*)+5                            * 5A55E  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 5A563
        C=DAT1  A                                * 5A56A
        CD1EX                                    * 5A56D
        D1=D1+  5                                * 5A570
        A=DAT1  W                                * 5A573
        B=0     A                                * 5A577
        ?A=0    M                                * 5A579
        GOYES   L_5A5B6                          * 5A57C
        C=0     A                                * 5A57E
        C=A     X                                * 5A580
        A=0     X                                * 5A583
        P=      13                               * 5A586
        SETDEC                                   * 5A588
L_5A58A:
        ?A=0    WP                               * 5A58A
        GOYES   L_5A597                          * 5A58D
        P=P-1                                    * 5A58F
        B=B+1   X                                * 5A591
        GONC    L_5A58A                          * 5A594
L_5A597:
        ?C=0    X                                * 5A597
        GOYES   L_5A5B6                          * 5A59A
        A=C     X                                * 5A59C
        A=A+A   X                                * 5A59F
        GONC    L_5A5AB                          * 5A5A2
        P=      3                                * 5A5A5
        LC(2)   #99                              * 5A5A7
L_5A5AB:
        B=B-C   A                                * 5A5AB
        P=      4                                * 5A5AD
        ?B=0    P                                * 5A5AF
        GOYES   L_5A5B6                          * 5A5B2
        B=0     A                                * 5A5B4
L_5A5B6:
        P=      0                                * 5A5B6
        SETHEX                                   * 5A5B8
        A=B     A                                * 5A5BA
        R0=A.F  A                                * 5A5BC
        GOVLNG  PUSH#LOOP                        * 5A5C2
        RPL

* refs (1): 5A7DD
OBJ_5A5C9:
        ::                                       * 5A5C9
          BINT1                                  * 5A5CE
          #=casedrop                             * 5A5D3
          %1                                     * 5A5D8
          %1                                     * 5A5DD
          SWAP                                   * 5A5E2
          ONE_DO                                 * 5A5E7
          UNROTDUP                               * 5A5EC
          3UNROLL                                * 5A5F1
          %*                                     * 5A5F6
          ROT                                    * 5A5FB
          %+                                     * 5A600
          SWAPLOOP                               * 5A605
        ;                                        * 5A60A

* refs (1): 1FA0C
{'piflag}:
        {                                        * 5A60F

* refs (1): 5A69E
Π'piflag:
          LAM     'piflag                        * 5A614
        }                                        * 5A629

* refs (3): 5AA04 5AA31 5AA40
OBJ_5A62E:
        ::                                       * 5A62E
          BINT1                                  * 5A633
          M-1stcasechs                           * 5A638
          ::                                     * 5A63D
            OBJ_5A651                            * 5A642
            addtNEG                              * 5A647
          ;                                      * 5A64C

* refs (1): 5A642
OBJ_5A651:
          ::                                     * 5A651
            DROP                                 * 5A656
            2DUP                                 * 5A65B

{'d,'r}:
            {                                    * 5A660

Π'd:
              LAM     'd                         * 5A665

Π'r:
              LAM     'r                         * 5A670
            }                                    * 5A67B
            BIND                                 * 5A680
            OBJ_5A72A                            * 5A685
            DUP#1=                               * 5A68A
            case                                 * 5A68F
            ABND                                 * 5A694
            '                                    * 5A699
            Π'piflag                             * 5A69E
            DRPExitAtLOOP                        * 5A6A3
            NOTcase                              * 5A6A8
            ABND                                 * 5A6AD
            NOTcase                              * 5A6B2
            ABND                                 * 5A6B7
            2GETLAM                              * 5A6BC
            1GETABND                             * 5A6C1
            %PI                                  * 5A6C6
            %/                                   * 5A6CB
            OBJ_5A72A                            * 5A6D0
            DUP#1=                               * 5A6D5
            case                                 * 5A6DA
            OBJ_5A70C                            * 5A6DF
            7PICK                                * 5A6E4
            4PICK                                * 5A6E9
            %>                                   * 5A6EE
            case                                 * 5A6F3
            OBJ_5A70C                            * 5A6F8
            NDROP                                * 5A6FD
          ;                                      * 5A702
        ;                                        * 5A707

* refs (2): 5A6DF 5A6F8
OBJ_5A70C:
        ::                                       * 5A70C
          SWAPUnNDROP                            * 5A711
          PTR     addt2:                         * 5A716
          xPI                                    * 5A71B
          x*                                     * 5A720
        ;                                        * 5A725

* refs (2): 5A685 5A6D0
OBJ_5A72A:
        ::                                       * 5A72A
          %0=case                                * 5A72F

drop(2);<1>:
          ::                                     * 5A734
            SWAPDROP                             * 5A739
            BINT1                                * 5A73E
          ;                                      * 5A743
          OBJ_5A55E                              * 5A748
          OVER                                   * 5A74D
          %EXPONENT                              * 5A752
          BINT0                                  * 5A757
          {                                      * 5A75C

Π'D:
            LAM     'd                           * 5A761

Π'R:
            LAM     'R                           * 5A76C

* refs (1): 23448
Π'est:
            LAM     'est                         * 5A777

Π'X:
            LAM     'X                           * 5A786

Π'T:
            LAM     'T                           * 5A791
          }                                      * 5A79C
          BIND                                   * 5A7A1
          BINT0                                  * 5A7A6
          4GETLAM                                * 5A7AB
          BEGIN                                  * 5A7B0
          DUP                                    * 5A7B5
          %IP                                    * 5A7BA
          SWAP                                   * 5A7BF
          %FP                                    * 5A7C4
          ROT                                    * 5A7C9
          #1+SWAP                                * 5A7CE
          1PUTLAM                                * 5A7D3
          dup                                    * 5A7D8
          OBJ_5A5C9                              * 5A7DD
          ::                                     * 5A7E2
            1GETLAM                              * 5A7E7
            j%0=case                             * 5A7EC
            FALSE                                * 5A7F1
            3GETLAM                              * 5A7F6
            OBJ_5A8A5                            * 5A7FB
            FALSE                                * 5A800
            2DUP                                 * 5A805
            %/                                   * 5A80A
            4GETLAM                              * 5A80F
            %-                                   * 5A814
            DUP%0=                               * 5A819
            casedrpfls                           * 5A81E
            %EXPONENT                            * 5A823
            2GETLAM                              * 5A828
            SWAP                                 * 5A82D
            %-                                   * 5A832
            5GETLAM                              * 5A837
            OBJ_5A8E8                            * 5A83C
          ;                                      * 5A841
          WHILE                                  * 5A846
          ::                                     * 5A84B
            2DROP                                * 5A850
            1GETLAM                              * 5A855
            %1/                                  * 5A85A
          ;                                      * 5A85F
          REPEAT                                 * 5A864
          ABND                                   * 5A869
          BINT2                                  * 5A86E
          SWAPUnNDROP                            * 5A873
          DROPDUP                                * 5A878
          %1                                     * 5A87D
          %=                                     * 5A882
          casedrop                               * 5A887
          BINT1                                  * 5A88C
          '                                      * 5A891
          x/                                     * 5A896
          BINT3                                  * 5A89B
        ;                                        * 5A8A0

* refs (1): 5A7FB
OBJ_5A8A5:
        CON(5)  (*)+5                            * 5A8A5  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 5A8AA
        R0=A.F  A                                * 5A8B1
        C=DAT1  A                                * 5A8B7
        CD1EX                                    * 5A8BA
        D1=D1+  5                                * 5A8BD
        A=0     A                                * 5A8C0
        A=DAT1  X                                * 5A8C2
        D1=C                                     * 5A8C6
        C=R0.F  A                                * 5A8C9
        A=A-C   A                                * 5A8CF
        LC(5)   COLA                             * 5A8D1
        GONC    L_5A8E2                          * 5A8D8
        LC(5)   SKIP                             * 5A8DB
L_5A8E2:
        A=C     A                                * 5A8E2
        PC=(A)                                   * 5A8E4

* refs (1): 5A83C
OBJ_5A8E8:
        CON(5)  (*)+5                            * 5A8E8  primitive code object
        GOSBVL  POP#                             * 5A8ED
        R0=A.F  B                                * 5A8F4
        A=DAT1  A                                * 5A8FA
        D1=D1+  5                                * 5A8FD
        D=D+1   A                                * 5A900
        AD1EX                                    * 5A902
        D1=D1+  5                                * 5A905
        C=DAT1  W                                * 5A908
        D1=A                                     * 5A90C
        ?C#0    S                                * 5A90F
        GOYES   L_5A944                          * 5A912
        CAEX    X                                * 5A914
        LC(3)   #001                             * 5A917
        ?C<A    X                                * 5A91C
        GOYES   L_5A94B                          * 5A91F
        P=C     13                               * 5A921
        CPEX    0                                * 5A925
        P=C     14                               * 5A929
        CPEX    1                                * 5A92D
        ?A#0    X                                * 5A931
        GOYES   L_5A939                          * 5A934
        CSR     B                                * 5A936
L_5A939:
        A=R0.F  B                                * 5A939
        ?C>A    B                                * 5A93F
        GOYES   L_5A94B                          * 5A942
L_5A944:
        GOVLNG  PushTLoop                        * 5A944
L_5A94B:
        GOVLNG  PushFLoop                        * 5A94B

* refs (1): 56822
OBJ_5A952:
        CON(5)  (*)+5                            * 5A952  primitive code object
        GOSUB   SUB_5A999                        * 5A957
        C=A     B                                * 5A95B
        A=0     W                                * 5A95E
        A=C     B                                * 5A961
        SETDEC                                   * 5A964
        A=-A    X                                * 5A966
        SETHEX                                   * 5A969
        P=      14                               * 5A96B
        A=A+1   P                                * 5A96D
        P=      0                                * 5A970
        GOSBVL  PUSH%                            * 5A972
        A=DAT0  A                                * 5A979
        D0=D0+  5                                * 5A97C
        PC=(A)                                   * 5A97F

* refs (2): 5A9FA 5AA1D
RclAccuracy:
        CON(5)  (*)+5                            * 5A983  primitive code object
        GOSUB   SUB_5A999                        * 5A988
        R0=A.F  A                                * 5A98C
        GOVLNG  PUSH#LOOP                        * 5A992

* refs (2): 5A957 5A988
SUB_5A999:
        GOSBVL  SAVPTR                           * 5A999
        A=0     A                                * 5A9A0
        LC(2)   #11                              * 5A9A2
        D1=(5)  #8084F                           * 5A9A6
        A=DAT1  1                                * 5A9AD
        ?ABIT=1 0                                * 5A9B1
        GOYES   L_5A9C5                          * 5A9B6
        ?ABIT=1 1                                * 5A9B8
        GOYES   L_5A9C5                          * 5A9BD
        A=C     B                                * 5A9BF
        GONC    L_5A9F1                          * 5A9C2
L_5A9C5:
        D1=(5)  #8084E                           * 5A9C5
        A=DAT1  1                                * 5A9CC
        LC(1)   #A                               * 5A9D0
        C=A-C   P                                * 5A9D3
        GOC     L_5A9F1                          * 5A9D6
        A=C     P                                * 5A9D9
        P=      1                                * 5A9DC
        A=A+1   P                                * 5A9DE
        P=      0                                * 5A9E1
        LC(1)   #2                               * 5A9E3
        ?C>A    P                                * 5A9E6
        GOYES   L_5A9F1                          * 5A9E9
        A=0     P                                * 5A9EB
        A=A+1   P                                * 5A9EE
L_5A9F1:
        P=      0                                * 5A9F1
        RTN                                      * 5A9F3
        RPL

* refs (3): 1FA25 5AA86 72F98
OBJ_5A9F5:
        ::                                       * 5A9F5
          RclAccuracy                            * 5A9FA
          SWAP                                   * 5A9FF
          OBJ_5A62E                              * 5AA04
          CKSYMBN                                * 5AA09
        ;                                        * 5AA0E

* refs (2): 1FA2F 5AA90
OBJ_5AA13:
        ::                                       * 5AA13
          C%>%                                   * 5AA18
          RclAccuracy                            * 5AA1D
          DUPROT                                 * 5AA22
          BINT2                                  * 5AA27
          3UNROLL                                * 5AA2C
          OBJ_5A62E                              * 5AA31
          psh                                    * 5AA36
          DROPSWAP                               * 5AA3B
          OBJ_5A62E                              * 5AA40
          pshtop&                                * 5AA45
          PTR     addt:                          * 5AA4A
          ROMP_002_105                           * 5AA4F
          IMPLODE                                * 5AA54
        ;                                        * 5AA59

* refs (1): 1FA39
OBJ_5AA5E:
        ::                                       * 5AA5E
          ZEROSWAP                               * 5AA63
          EXPLODE                                * 5AA68
          BEGIN                                  * 5AA6D
          #1-SWAP                                * 5AA72
          ::                                     * 5AA77
            CK&DISPATCH0                         * 5AA7C
            BINT1                                * 5AA81
            OBJ_5A9F5                            * 5AA86
            BINT2                                * 5AA8B
            OBJ_5AA13                            * 5AA90
            BINT0                                * 5AA95
            OBJ_72FCA                            * 5AA9A
          ;                                      * 5AA9F
          SINNER                                 * 5AAA4
          unrot                                  * 5AAA9
          over&                                  * 5AAAE
          #0=UNTIL                               * 5AAB3
          DROP                                   * 5AAB8
          IMPLODE                                * 5AABD
        ;                                        * 5AAC2

* symf symf symf QN -> symf
* refs (2): 1F2B6 5B8D9
SYMINTEG:
        ::                                       * 5AAC7
          2SWAP                                  * 5AACC
          TWO{}N                                 * 5AAD1
          SWAP                                   * 5AAD6
          CARCOMP                                * 5AADB

{'bnds,'dvar}:
          {                                      * 5AAE0

* refs (2): 5AB4B 5AC0E
Π'bnds:
            LAM     'bnds                        * 5AAE5
            lam'dvar                             * 5AAF6
          }                                      * 5AAFB
          BIND                                   * 5AB00
          ZEROZERO                               * 5AB05
          BINT0                                  * 5AB0A
          4ROLL                                  * 5AB0F
          EXPLODE                                * 5AB14
          >dvars                                 * 5AB19
          intg                                   * 5AB1E
          psh                                    * 5AB23
          DUP#0=                                 * 5AB28
          ?SKIP                                  * 5AB2D
          ::                                     * 5AB32
            dvars>                               * 5AB37
            lam'dvar                             * 5AB3C
            SWAP#1+                              * 5AB41
            dup                                  * 5AB46
            Π'bnds                               * 5AB4B
            INNERtop&                            * 5AB50
            #1-SWAP                              * 5AB55
            EXPLODE                              * 5AB5A
            psh&                                 * 5AB5F
            #1-SWAP                              * 5AB64
            EXPLODE                              * 5AB69
            top&                                 * 5AB6E

{<3>,WHERE()}:
            {                                    * 5AB73
              BINT3                              * 5AB78
              xWHERE                             * 5AB7D
            }                                    * 5AB82
            INNERCOMP                            * 5AB87
            psh&                                 * 5AB8C

{<3>,WHERE()}_5AB91:
            {                                    * 5AB91
              BINT3                              * 5AB96
              xWHERE                             * 5AB9B
            }                                    * 5ABA0
            INNERtop&                            * 5ABA5
            top&                                 * 5ABAA
            meta-                                * 5ABAF
          ;                                      * 5ABB4
          psh                                    * 5ABB9
          DUP#0=                                 * 5ABBE
          ?SKIP                                  * 5ABC3

* refs (2): 5ABE6 5ABF0
OBJ_5ABC8:
          ::                                     * 5ABC8
            AEQ1stcase                           * 5ABCD
            x=                                   * 5ABD2
            ::                                   * 5ABD7
              SWAPDROP#1-                        * 5ABDC
              larg                               * 5ABE1
              OBJ_5ABC8                          * 5ABE6
              psh                                * 5ABEB
              OBJ_5ABC8                          * 5ABF0
              top&                               * 5ABF5
              PTR     addt:                      * 5ABFA
              x=                                 * 5ABFF
            ;                                    * 5AC04
            dvars>                               * 5AC09
            Π'bnds                               * 5AC0E
            INNERCOMP                            * 5AC13
            SINNERMETA                           * 5AC18
            pshtop&                              * 5AC1D
            lam'dvar                             * 5AC22
            '                                    * 5AC27
            xINTEGRAL                            * 5AC2C
            ROT                                  * 5AC31
            #2+                                  * 5AC36
          ;                                      * 5AC3B
          DUP#0=                                 * 5AC40
          OVER                                   * 5AC45
          #3+PICK                                * 5AC4A
          #0=                                    * 5AC4F
          OR                                     * 5AC54
          ?SKIP                                  * 5AC59
          meta+                                  * 5AC5E
          top&                                   * 5AC63
          ABND                                   * 5AC68
          pshzer                                 * 5AC6D
          colunfac                               * 5AC72
          IMPLODE                                * 5AC77
        ;                                        * 5AC7C
        NIBHEX  E8E60                            * 5AC81  ←n

* meta -> meta'
* refs (3): 5AB37 5AC09 5B898
dvars>:
        ::                                       * 5AC86
          pshzer                                 * 5AC8B
          BEGIN                                  * 5AC90
          #1-SWAP                                * 5AC95
          ::                                     * 5AC9A
            REQcasedrop                          * 5AC9F
            lam'dvar                             * 5ACA4
            1GETLAM                              * 5ACA9
          ;                                      * 5ACAE
          psh1&                                  * 5ACB3
          #0=UNTIL                               * 5ACB8
          DROP                                   * 5ACBD
        ;                                        * 5ACC2

* #0 #0 meta -> meta_ok meta_fail
* refs (1): 5AB1E
intg:
        ::                                       * 5ACC7
          BEGIN                                  * 5ACCC
          forceadd                               * 5ACD1

* meta&+ -> meta
M1st+?Drp:
          ::                                     * 5ACD6
            M1st+case                            * 5ACDB
            SWAPDROP#1-                          * 5ACE0
          ;                                      * 5ACE5
          larg                                   * 5ACEA
          forcemul?aga                           * 5ACEF
          intg1                                  * 5ACF4
          #0=UNTIL                               * 5ACF9
          DROP                                   * 5ACFE
        ;                                        * 5AD03

* meta -> meta flag
* refs (12): 5AECF 5AFB0 5B136 5B2A8 5B38E 5B447 ...
dvars?:
        ::                                       * 5AD08
          DUP#2+                                 * 5AD0D
          BEGIN                                  * 5AD12
          #1-                                    * 5AD17
          BINT1                                  * 5AD1C
          #=casedrop                             * 5AD21
          RDROPFALSE                             * 5AD26
          DUP#1+PICK                             * 5AD2B
          '                                      * 5AD30
          lam'dvar                               * 5AD35
          EQ                                     * 5AD3A
          UNTIL                                  * 5AD3F
          TRUE                                   * 5AD44
        ;                                        * 5AD49

* refs (2): 83856 83897
OBJ_5AD4E:
        ::                                       * 5AD4E
          REQcase                                * 5AD53
          lam'dvar                               * 5AD58
          SKIP                                   * 5AD5D
        ;                                        * 5AD62
        NIBHEX  E8E60                            * 5AD67  ←n

* meta #level -> meta' flag
* refs (5): 5AEDE 5B398 5B451 5B569 C0D91
linear!:
        ::                                       * 5AD6C
          linear                                 * 5AD71
          SWAPDROP                               * 5AD76
        ;                                        * 5AD7B

* meta #level -> meta' T meta #level -> meta' #loc F
* refs (3): 5AFBF 5AFE7 5B06E
linear?:
        ::                                       * 5AD80
          linear                                 * 5AD85
          DUP                                    * 5AD8A
          IT                                     * 5AD8F
          SWAPDROP                               * 5AD94
        ;                                        * 5AD99

* meta #level -> meta #loc flag
* refs (2): 5AD71 5AD85
linear:
        ::                                       * 5AD9E
          TRUE                                   * 5ADA3
          dvarlsBIND                             * 5ADA8
          BEGIN                                  * 5ADAD
          DUP                                    * 5ADB2
          #2=                                    * 5ADB7
          NOT                                    * 5ADBC
          1GETLAM                                * 5ADC1
          AND                                    * 5ADC6
          WHILE                                  * 5ADCB
          ::                                     * 5ADD0
            OBJ_5ADEE                            * 5ADD5
          ;                                      * 5ADDA
          REPEAT                                 * 5ADDF
          1GETABND                               * 5ADE4
        ;                                        * 5ADE9

* refs (1): 5ADD5
OBJ_5ADEE:
        ::                                       * 5ADEE
          BINT1                                  * 5ADF3
          splitdown                              * 5ADF8
          OVER                                   * 5ADFD
          #2+PICK                                * 5AE02
          REQcasedrop                            * 5AE07
          xNEG                                   * 5AE0C
          DROP                                   * 5AE11
          REQcasedrop                            * 5AE16
          x+                                     * 5AE1B
          OBJ_5AEA2                              * 5AE20
          REQcasedrop                            * 5AE25
          x-                                     * 5AE2A
          OBJ_5AEA2                              * 5AE2F
          REQcasedrop                            * 5AE34
          x*                                     * 5AE39
          OBJ_5AF01                              * 5AE3E
          REQcasedrop                            * 5AE43
          x/                                     * 5AE48
          OBJ_5AF42                              * 5AE4D
          REQcasedrop                            * 5AE52
          x^                                     * 5AE57
          OBJ_5AF6F                              * 5AE5C
          REQcasedrop                            * 5AE61
          ä                                      * 5AE66
          OBJ_5AE7F                              * 5AE6B
          2DROP                                  * 5AE70
          false;1Lput                            * 5AE75
        ;                                        * 5AE7A

* refs (1): 5AE6B
OBJ_5AE7F:
        ::                                       * 5AE7F
          BINT4                                  * 5AE84
          #=                                     * 5AE89
          ?SEMI                                  * 5AE8E
          FALSE                                  * 5AE93
          1PUTLAM                                * 5AE98
        ;                                        * 5AE9D

* refs (2): 5AE20 5AE2F
OBJ_5AEA2:
        ::                                       * 5AEA2
          #2=                                    * 5AEA7
          ?SEMI                                  * 5AEAC

* refs (1): 5AF10
OBJ_5AEB1:
          ::                                     * 5AEB1
            SWAP#1+                              * 5AEB6
            OVER                                 * 5AEBB
            #1+                                  * 5AEC0
            tailpsh                              * 5AEC5
            larg                                 * 5AECA
            dvars?                               * 5AECF
          ;                                      * 5AED4
          ITE                                    * 5AED9
          linear!                                * 5AEDE
          TRUE                                   * 5AEE3
          1PUTLAM                                * 5AEE8
          top&                                   * 5AEED
          pshtop&                                * 5AEF2
          #1-SWAP                                * 5AEF7
        ;                                        * 5AEFC

* refs (2): 5AE3E 5AF65
OBJ_5AF01:
        ::                                       * 5AF01
          #2=                                    * 5AF06
          ?SEMI                                  * 5AF0B
          OBJ_5AEB1                              * 5AF10
          NOT                                    * 5AF15
          DUP                                    * 5AF1A
          ?SKIP                                  * 5AF1F
          SWAPDROP                               * 5AF24
          1PUTLAM                                * 5AF29
          top&                                   * 5AF2E
          pshtop&                                * 5AF33
          #1-SWAP                                * 5AF38
        ;                                        * 5AF3D

* refs (1): 5AE4D
OBJ_5AF42:
        ::                                       * 5AF42
          BINT2                                  * 5AF47
          #=casedrop                             * 5AF4C

* refs (3): 5AE75 5AF7E 5AFA1
false;1Lput:
          ::                                     * 5AF51
            FALSE                                * 5AF56
            1PUTLAM                              * 5AF5B
          ;                                      * 5AF60
          OBJ_5AF01                              * 5AF65
        ;                                        * 5AF6A

* refs (1): 5AE5C
OBJ_5AF6F:
        ::                                       * 5AF6F
          BINT2                                  * 5AF74
          #=casedrop                             * 5AF79
          false;1Lput                            * 5AF7E
          #1+PICK                                * 5AF83
          num0=case                              * 5AF88
          DROP                                   * 5AF8D
          num1=case                              * 5AF92
          DROP                                   * 5AF97
          DROP                                   * 5AF9C
          false;1Lput                            * 5AFA1
        ;                                        * 5AFA6

* M_ok M_fail M_temp meta -> M_ok' M_fail' M_temp
* refs (1): 5ACF4
intg1:
        ::                                       * 5AFAB
          dvars?                                 * 5AFB0
          NOTcase                                * 5AFB5
          intgconst                              * 5AFBA
          linear?                                * 5AFBF
          case                                   * 5AFC4
          intglinear                             * 5AFC9
          DUPDUP                                 * 5AFCE
          DUP                                    * 5AFD3
          OBJ_56FD1                              * 5AFD8
          BIND                                   * 5AFDD
          BEGIN                                  * 5AFE2
          linear?                                * 5AFE7
          NOT_WHILE                              * 5AFEC
          ::                                     * 5AFF1
            DUP                                  * 5AFF6
            1PUTLAM                              * 5AFFB
          ;                                      * 5B000
          REPEAT                                 * 5B005
          1GETLAM                                * 5B00A
          2GETLAM                                * 5B00F
          OVER#-                                 * 5B014
          #2+                                    * 5B019
          2PUTLAM                                * 5B01E
          #1-                                    * 5B023
          tailpsh                                * 5B028
          larg                                   * 5B02D
          2GETLAM                                * 5B032
          BEGIN                                  * 5B037
          DUP                                    * 5B03C
          2PUTLAM                                * 5B041
          OBJ_5B195                              * 5B046
          ITE                                    * 5B04B
          ::                                     * 5B050
            OBJ_5B1F4                            * 5B055
            intg1ok                              * 5B05A
          ;                                      * 5B05F
          ::                                     * 5B064
            2GETLAM                              * 5B069
            linear?                              * 5B06E
            NOTcaseFALSE                         * 5B073
            top&                                 * 5B078
            pshtop&                              * 5B07D
            intg1fail                            * 5B082
          ;                                      * 5B087
          UNTIL                                  * 5B08C
          ABND                                   * 5B091
        ;                                        * 5B096

* M1 M2 M3 M4 -> M1 M2' M4 T
* refs (1): 5B082
intg1fail:
        ::                                       * 5B09B
          rotswap                                * 5B0A0
          DUP                                    * 5B0A5
          #2+PICK                                * 5B0AA
          #0=?SKIP                               * 5B0AF
          meta+                                  * 5B0B4
          top&                                   * 5B0B9
          psh                                    * 5B0BE
          TRUE                                   * 5B0C3
        ;                                        * 5B0C8

* M_ok M_fail M_temp meta -> M_ok' M_fail' M_temp
* refs (1): 5AFBA
intgconst:
        ::                                       * 5B0CD

* refs (2): 5B2B7 5B2E4
OBJ_5B0D2:
          ::                                     * 5B0D2
            PTR     addt:                        * 5B0D7
            lam'dvar                             * 5B0DC
            meta*                                * 5B0E1
          ;                                      * 5B0E6
          intg1ok                                * 5B0EB
          DROP                                   * 5B0F0
        ;                                        * 5B0F5

* M1 M2 M3 M4 -> M1' M2 M3 T
* refs (3): 5B05A 5B0EB 5B186
intg1ok:
        ::                                       * 5B0FA
          4roll                                  * 5B0FF
          psh                                    * 5B104
          DUP                                    * 5B109
          #2+PICK                                * 5B10E
          #0=?SKIP                               * 5B113
          meta+                                  * 5B118
          top&                                   * 5B11D
          unrot                                  * 5B122
          TRUE                                   * 5B127
        ;                                        * 5B12C

* M1 M2 M3 M4 -> M1' M2 M3
* refs (1): 5AFC9
intglinear:
        ::                                       * 5B131
          dvars?                                 * 5B136
          DROP                                   * 5B13B

* meta #loc -> meta'
* refs (1): 5B2B2
intgaddlin:
          ::                                     * 5B140
            #1-                                  * 5B145
            tailpsh                              * 5B14A
            #1-SWAP                              * 5B14F

{2,^,2,/}:
            {                                    * 5B154
              %2                                 * 5B159
              x^                                 * 5B15E
              %2                                 * 5B163
              x/                                 * 5B168
            }                                    * 5B16D
            INNERCOMP                            * 5B172
            #1+                                  * 5B177
            OBJ_5B1F4                            * 5B17C
          ;                                      * 5B181
          intg1ok                                * 5B186
          DROP                                   * 5B18B
        ;                                        * 5B190

* refs (1): 5B046
OBJ_5B195:
        ::                                       * 5B195
          DUP#1+PICK                             * 5B19A
          ::                                     * 5B19F
            REQcase                              * 5B1A4
            xFCNAPPLY                            * 5B1A9
            ::                                   * 5B1AE
              OVER                               * 5B1B3
              #4+PICK                            * 5B1B8
              NOTROMPcase                        * 5B1BD
              DROP                               * 5B1C2
              SWAPDROP                           * 5B1C7
            ;                                    * 5B1CC
          ;                                      * 5B1D1
          OBJ_26F5E                              * 5B1D6
          NOTcase                                * 5B1DB
          2DROPFALSE                             * 5B1E0
          EVAL                                   * 5B1E5
        ;                                        * 5B1EA
        NIBHEX  E8E60                            * 5B1EF  ←n

* refs (2): 5B055 5B17C
OBJ_5B1F4:
        ::                                       * 5B1F4
          rot                                    * 5B1F9
          BEGIN                                  * 5B1FE
          DUP#0<>WHILE                           * 5B203
          ::                                     * 5B208
            DUP                                  * 5B20D
            #2+                                  * 5B212
            BINT1                                * 5B217
            splitdown                            * 5B21C
            OVER                                 * 5B221
            #2+PICK                              * 5B226
            BINT1                                * 5B22B
            M1st+case                            * 5B230
            OBJ_5B28A                            * 5B235
            M1st-case                            * 5B23A
            OBJ_5B28A                            * 5B23F
            3DROP                                * 5B244
            #1-                                  * 5B249
            tailpsh                              * 5B24E
            psh&                                 * 5B253
            over&                                * 5B258
            psh                                  * 5B25D
            larg                                 * 5B262
            rot                                  * 5B267
          ;                                      * 5B26C
          REPEAT                                 * 5B271
          DROP                                   * 5B276
          get1                                   * 5B27B
          DROP                                   * 5B280
        ;                                        * 5B285

* refs (2): 5B235 5B23F
OBJ_5B28A:
        ::                                       * 5B28A
          2DROP                                  * 5B28F
          #2=                                    * 5B294
          case                                   * 5B299
          OBJ_5B2D0                              * 5B29E
          tailpsh                                * 5B2A3
          dvars?                                 * 5B2A8
          ITE                                    * 5B2AD
          intgaddlin                             * 5B2B2
          OBJ_5B0D2                              * 5B2B7
          psh&                                   * 5B2BC
          pullrev                                * 5B2C1
          psh1&rev                               * 5B2C6
        ;                                        * 5B2CB

* refs (1): 5B29E
OBJ_5B2D0:
        ::                                       * 5B2D0
          DROP                                   * 5B2D5
          rot                                    * 5B2DA
          larg                                   * 5B2DF
          OBJ_5B0D2                              * 5B2E4
          4roll                                  * 5B2E9
          top&                                   * 5B2EE
          rot                                    * 5B2F3
          pullrev                                * 5B2F8
          psh1&rev                               * 5B2FD
        ;                                        * 5B302

        CON(5)  NOP                              * 5B307  address (the code jumps or points through it)

        CON(5)  NOP                              * 5B30C  address (the code jumps or points through it)

        CON(5)  DOCOL                            * 5B311  address (the code jumps or points through it)

        CON(5)  'R                               * 5B316  address (the code jumps or points through it)

        CON(5)  OBJ_72AFA                        * 5B31B  address (the code jumps or points through it)

        CON(5)  EXPLODE                          * 5B320  address (the code jumps or points through it)

        CON(5)  OBJ_600A3                        * 5B325  address (the code jumps or points through it)

        CON(5)  SEMI                             * 5B32A  address (the code jumps or points through it)

* refs (11): 5B90B 5BB72 82921 829C1 82A61 82F96 ...
OBJ_5B32F:
        ::                                       * 5B32F
          #2=                                    * 5B334
          ?SEMI                                  * 5B339
          FALSE                                  * 5B33E
          RDROP                                  * 5B343
        ;                                        * 5B348

* refs (20): 5B9C4 5BA87 5BBD6 8264B 82727 82912 ...
OBJ_5B34D:
        ::                                       * 5B34D
          ::                                     * 5B352
            OBJ_60BCB                            * 5B357
            FALSE                                * 5B35C
            RDROP                                * 5B361
          ;                                      * 5B366
          TRUE                                   * 5B36B
        ;                                        * 5B370

* refs (26): 5BBA4 82B3D 82BA1 82C0A 82C78 82CF0 ...
OBJ_5B375:
        ::                                       * 5B375
          'R                                     * 5B37A
          BINT1                                  * 5B37F
          OBJ_600A3                              * 5B384

* refs (3): 5B3ED 5B5B4 5B6FE
OBJ_5B389:
          ::                                     * 5B389
            dvars?                               * 5B38E
            ITE                                  * 5B393
            linear!                              * 5B398
            FALSE                                * 5B39D
          ;                                      * 5B3A2
          pshm1                                  * 5B3A7
          #1+NDROP                               * 5B3AC
          'R                                     * 5B3B1
          SWAP                                   * 5B3B6
          NOTcsdrpfls                            * 5B3BB
          OBJ_72AFA                              * 5B3C0
          SINNER                                 * 5B3C5
          OBJ_5B4FB                              * 5B3CA
        ;                                        * 5B3CF
        NIBHEX  E8E60                            * 5B3D4  ←n

* refs (9): 824F6 8255F 825C8 8268C 826F0 82772 ...
OBJ_5B3D9:
        ::                                       * 5B3D9
          'R                                     * 5B3DE
          BINT1                                  * 5B3E3
          OBJ_600A3                              * 5B3E8
          OBJ_5B389                              * 5B3ED
          pshm1                                  * 5B3F2
          #1+NDROP                               * 5B3F7
          'R                                     * 5B3FC
          SWAP                                   * 5B401
          NOTcsdrpfls                            * 5B406
          OBJ_72AFA                              * 5B40B
          SINNER                                 * 5B410
          RAD?                                   * 5B415
          ?SKIP                                  * 5B41A
          OBJ_5B4A6                              * 5B41F
          OBJ_5B4FB                              * 5B424
        ;                                        * 5B429
        NIBHEX  E8E60                            * 5B42E  ←n

* refs (3): 82953 829F3 82A93
OBJ_5B433:
        ::                                       * 5B433
          'R                                     * 5B438
          BINT1                                  * 5B43D
          OBJ_600A3                              * 5B442
          dvars?                                 * 5B447
          DROP                                   * 5B44C
          linear!                                * 5B451
          pshm1                                  * 5B456
          #1+NDROP                               * 5B45B
          'R                                     * 5B460
          SWAP                                   * 5B465
          NOTcsdrpfls                            * 5B46A
          OBJ_72AFA                              * 5B46F
          SINNER                                 * 5B474
          RAD?                                   * 5B479
          ?SKIP                                  * 5B47E
          ::                                     * 5B483
            OBJ_5B4A6                            * 5B488
            6ROLL                                * 5B48D
            SWAP                                 * 5B492
          ;                                      * 5B497
          OBJ_5B4FB                              * 5B49C
        ;                                        * 5B4A1

* refs (2): 5B41F 5B488
OBJ_5B4A6:
        ::                                       * 5B4A6
          DEG?                                   * 5B4AB
          ITE                                    * 5B4B0

{180,PI,/,*}_5B4B5:
          {                                      * 5B4B5
            %180                                 * 5B4BA
            xPI                                  * 5B4BF
            x/                                   * 5B4C4
            x*                                   * 5B4C9
          }                                      * 5B4CE

{200,PI,/,*}_5B4D3:
          {                                      * 5B4D3
            %200                                 * 5B4D8
            xPI                                  * 5B4DD
            x/                                   * 5B4E2
            x*                                   * 5B4E7
          }                                      * 5B4EC
          INNERtop&                              * 5B4F1
        ;                                        * 5B4F6

* refs (3): 5B3CA 5B424 5B49C
OBJ_5B4FB:
        ::                                       * 5B4FB
          {                                      * 5B500
            lam'dvar                             * 5B505
            Π&1                                  * 5B50A
            xDER                                 * 5B50F
            x/                                   * 5B514
          }                                      * 5B519
          INNERtop&                              * 5B51E
          CKSYMBN                                * 5B523
          '                                      * 5B528
          Π'rhs                                  * 5B52D
          STOLAM                                 * 5B532
          TRUE                                   * 5B537
        ;                                        * 5B53C
        NIBHEX  E8E60                            * 5B541  ←n

* refs (1): 5BA96
OBJ_5B546:
        ::                                       * 5B546
          'R                                     * 5B54B
          BINT1                                  * 5B550
          OBJ_600A3                              * 5B555
          dvars?                                 * 5B55A
          NOTcase                                * 5B55F
          OBJ_5B596                              * 5B564
          linear!                                * 5B569
          case                                   * 5B56E
          OBJ_5B5F0                              * 5B573
          NDROP                                  * 5B578
          FALSE                                  * 5B57D
          RSKIP                                  * 5B582
          RSKIP                                  * 5B587
          RSKIP                                  * 5B58C
        ;                                        * 5B591

* refs (1): 5B564
OBJ_5B596:
        ::                                       * 5B596
          NDROP                                  * 5B59B
          'R                                     * 5B5A0
          BINT1                                  * 5B5A5
          RSKIP                                  * 5B5AA
          OBJ_600A3                              * 5B5AF
          OBJ_5B389                              * 5B5B4
          pshm1                                  * 5B5B9
          NDROP                                  * 5B5BE
          DROP                                   * 5B5C3
          DUP                                    * 5B5C8
          NOTcase                                * 5B5CD
          SKIP                                   * 5B5D2
          'R                                     * 5B5D7
          '                                      * 5B5DC
          Π'rhs                                  * 5B5E1
          STOLAM                                 * 5B5E6
        ;                                        * 5B5EB

* refs (1): 5B573
OBJ_5B5F0:
        ::                                       * 5B5F0
          NDROP                                  * 5B5F5
          'R                                     * 5B5FA
          BINT1                                  * 5B5FF
          OBJ_600A3                              * 5B604
          dvars?                                 * 5B609
          casedrop                               * 5B60E
          ::                                     * 5B613
            NDROP                                * 5B618
            RSKIP                                * 5B61D
            RSKIP                                * 5B622
            FALSE                                * 5B627
          ;                                      * 5B62C
          NDROP                                  * 5B631
          'R                                     * 5B636
          '                                      * 5B63B
          Π'rhs                                  * 5B640
          STOLAM                                 * 5B645
          TRUE                                   * 5B64A
          RSKIP                                  * 5B64F
        ;                                        * 5B654

* meta -> meta'
* refs (1): 5ACEF
forcemul?aga:
        ::                                       * 5B659
          ::                                     * 5B65E
            Meta<-D!                             * 5B663
            ::                                   * 5B668
              M1st*case                          * 5B66D
              MetaD->                            * 5B672
            ;                                    * 5B677
            forcemul                             * 5B67C
            RDROP                                * 5B681
          ;                                      * 5B686
          top&                                   * 5B68B
          COLA                                   * 5B690
          AGAIN                                  * 5B695
        ;                                        * 5B69A

* refs (1): 5B910
OBJ_5B69F:
        ::                                       * 5B69F
          ::                                     * 5B6A4
            M1stFNCcase                          * 5B6A9
            BINT5                                * 5B6AE
            OVER                                 * 5B6B3
            infarg?                              * 5B6B8
            casedrop                             * 5B6BD
            BINT4                                * 5B6C2
            DROP                                 * 5B6C7
            BINT3                                * 5B6CC
          ;                                      * 5B6D1
          PICK                                   * 5B6D6
          DUPTYPEREAL?                           * 5B6DB
          SWAP                                   * 5B6E0
          TYPECMP?                               * 5B6E5
          OR                                     * 5B6EA
        ;                                        * 5B6EF

* refs (1): 5B933
OBJ_5B6F4:
        ::                                       * 5B6F4
          pargop                                 * 5B6F9
          OBJ_5B389                              * 5B6FE
          psh1&rev                               * 5B703
          pshtop&                                * 5B708
          #1-SWAP                                * 5B70D
        ;                                        * 5B712

* meta -> meta'
* refs (1): 5B67C
forcemul:
        ::                                       * 5B717
          pshzer                                 * 5B71C
          BEGIN                                  * 5B721
          ::                                     * 5B726
            M1st/case                            * 5B72B
            OBJ_5B758                            * 5B730
            M1stINVcase                          * 5B735
            OBJ_5B771                            * 5B73A
          ;                                      * 5B73F
          pullpsh1&                              * 5B744
          #0=UNTIL                               * 5B749
          DROP                                   * 5B74E
        ;                                        * 5B753

* refs (2): 5B730 5B79E
OBJ_5B758:
        ::                                       * 5B758
          SWAPDROP#1-                            * 5B75D
          metainv                                * 5B762
          addt*                                  * 5B767
        ;                                        * 5B76C

* refs (2): 5B73A 5B7AD
OBJ_5B771:
        ::                                       * 5B771
          3PICK                                  * 5B776
          REQcasedrop                            * 5B77B
          xNEG                                   * 5B780
          ROTSWAP                                * 5B785
          REQcasedrop                            * 5B78A
          x/                                     * 5B78F
          ::                                     * 5B794
            SWAPDROP#1-                          * 5B799
            OBJ_5B758                            * 5B79E
            addtINV                              * 5B7A3
            COLA                                 * 5B7A8
            OBJ_5B771                            * 5B7AD
          ;                                      * 5B7B2
          'x*                                    * 5B7B7
          EQ                                     * 5B7BC
          NOT?SEMI                               * 5B7C1
          larg                                   * 5B7C6
          dvars?                                 * 5B7CB
          NOTcase                                * 5B7D0
          top&                                   * 5B7D5
          DROP                                   * 5B7DA
          SWAPDROP#1-                            * 5B7DF
          SWAPDROP#1-                            * 5B7E4
          larg                                   * 5B7E9
          dvars?                                 * 5B7EE
          NOTcase                                * 5B7F3
          OBJ_5B839                              * 5B7F8
          DROP                                   * 5B7FD
          psh                                    * 5B802
          dvars?                                 * 5B807
          NOTcase                                * 5B80C
          OBJ_5B839                              * 5B811
          DROP                                   * 5B816
          pshtop&                                * 5B81B
          PTR     addt2:                         * 5B820
          x*                                     * 5B825
          xINV                                   * 5B82A
          top&                                   * 5B82F
        ;                                        * 5B834

* refs (2): 5B7F8 5B811
OBJ_5B839:
        ::                                       * 5B839
          metainv                                * 5B83E
          addt*                                  * 5B843
          over&                                  * 5B848
          unrot                                  * 5B84D
          over&                                  * 5B852
          metainv                                * 5B857
        ;                                        * 5B85C

* meta1 meta2 meta3 -> meta2&meta3&meta1
top&pshtop&:
        ::                                       * 5B861
          top&                                   * 5B866
          pshtop&                                * 5B86B
        ;                                        * 5B870

* refs (1): 1F267
OBJ_5B875:
        ::                                       * 5B875
          #1-                                    * 5B87A
          tailpsh                                * 5B87F
          larg                                   * 5B884
          SWAPDROP#1-                            * 5B889
          lam'dvar                               * 5B88E
          dvarlsBIND                             * 5B893
          dvars>                                 * 5B898
          #1-SWAP                                * 5B89D
          symcomp                                * 5B8A2
          pshm1                                  * 5B8A7
          larg                                   * 5B8AC
          SYMBN                                  * 5B8B1
          psh1&                                  * 5B8B6
          larg                                   * 5B8BB
          CKSYMBN                                * 5B8C0
          psh1&                                  * 5B8C5
          CKSYMBN                                * 5B8CA
          SWAPDROP                               * 5B8CF
          4UNROLL                                * 5B8D4
          SYMINTEG                               * 5B8D9
          ZEROSWAP                               * 5B8DE
          EXPLODE                                * 5B8E3
          >dvars                                 * 5B8E8
          ABND                                   * 5B8ED
          top&                                   * 5B8F2
          pshtop&                                * 5B8F7
          FALSE                                  * 5B8FC
        ;                                        * 5B901

* refs (1): 1B0E1
OBJ_5B906:
        ::                                       * 5B906
          OBJ_5B32F                              * 5B90B
          OBJ_5B69F                              * 5B910
          '                                      * 5B915
          OBJ_5BA41                              * 5B91A
          SWAP                                   * 5B91F
          NOTcase                                * 5B924
          EVAL                                   * 5B929
          DROP                                   * 5B92E
          OBJ_5B6F4                              * 5B933
          NOTcaseFALSE                           * 5B938
          {                                      * 5B93D
            OBJ_60E73                            * 5B942
            {                                    * 5B947

'&1^-1':
              SYMBOL                             * 5B94C
                Π&1                              * 5B951
                %-1                              * 5B956
                x^                               * 5B95B
              ;                                  * 5B960
              OBJ_5B9CE                          * 5B965
            }                                    * 5B96A
            {                                    * 5B96F

'&1^(-1,0)':
              SYMBOL                             * 5B974
                Π&1                              * 5B979
                C%-1                             * 5B97E
                x^                               * 5B983
              ;                                  * 5B988
              OBJ_5B9CE                          * 5B98D
            }                                    * 5B992
            {                                    * 5B997

'&1^&2':
              SYMBOL                             * 5B99C
                Π&1                              * 5B9A1
                Π&2                              * 5B9A6
                x^                               * 5B9AB
              ;                                  * 5B9B0
              OBJ_5B9F6                          * 5B9B5
            }                                    * 5B9BA
          }                                      * 5B9BF
          OBJ_5B34D                              * 5B9C4
        ;                                        * 5B9C9

* refs (2): 5B965 5B98D
OBJ_5B9CE:
        SYMBOL                                   * 5B9CE
          Π&1                                    * 5B9D3
          xLN                                    * 5B9D8
          lam'dvar                               * 5B9DD
          Π&1                                    * 5B9E2
          xDER                                   * 5B9E7
          x/                                     * 5B9EC
        ;                                        * 5B9F1

* refs (1): 5B9B5
OBJ_5B9F6:
        SYMBOL                                   * 5B9F6
          Π&1                                    * 5B9FB
          Π&2                                    * 5BA00
          %1                                     * 5BA05
          x+                                     * 5BA0A
          x^                                     * 5BA0F
          Π&2                                    * 5BA14
          %1                                     * 5BA19
          x+                                     * 5BA1E
          lam'dvar                               * 5BA23
          Π&1                                    * 5BA28
          xDER                                   * 5BA2D
          x*                                     * 5BA32
          x/                                     * 5BA37
        ;                                        * 5BA3C

* refs (1): 5B91A
OBJ_5BA41:
        ::                                       * 5BA41
          {                                      * 5BA46
            OBJ_60E73                            * 5BA4B
            {                                    * 5BA50

'&1^&2'_5BA55:
              SYMBOL                             * 5BA55
                Π&1                              * 5BA5A
                Π&2                              * 5BA5F
                x^                               * 5BA64
              ;                                  * 5BA69
              NULL{}                             * 5BA6E
              OBJ_5BA91                          * 5BA73
              NULL{}                             * 5BA78
            }                                    * 5BA7D
          }                                      * 5BA82
          OBJ_5B34D                              * 5BA87
        ;                                        * 5BA8C

* refs (1): 5BA73
OBJ_5BA91:
        ::                                       * 5BA91
          OBJ_5B546                              * 5BA96
          Π&1                                    * 5BA9B
          Π&2                                    * 5BAA0
          OBJ_5BAB4                              * 5BAA5
          OBJ_5BB31                              * 5BAAA
        ;                                        * 5BAAF

* refs (1): 5BAA5
OBJ_5BAB4:
        SYMBOL                                   * 5BAB4
          Π&2                                    * 5BAB9
          %-1                                    * 5BABE
          x==                                    * 5BAC3
          Π&1                                    * 5BAC8
          xLN                                    * 5BACD
          lam'dvar                               * 5BAD2
          Π&1                                    * 5BAD7
          xDER                                   * 5BADC
          x/                                     * 5BAE1
          Π&1                                    * 5BAE6
          Π&2                                    * 5BAEB
          %1                                     * 5BAF0
          x+                                     * 5BAF5
          x^                                     * 5BAFA
          Π&2                                    * 5BAFF
          %1                                     * 5BB04
          x+                                     * 5BB09
          lam'dvar                               * 5BB0E
          Π&1                                    * 5BB13
          xDER                                   * 5BB18
          x*                                     * 5BB1D
          x/                                     * 5BB22
          xIFTE                                  * 5BB27
        ;                                        * 5BB2C

* refs (1): 5BAAA
OBJ_5BB31:
        SYMBOL                                   * 5BB31
          Π&1                                    * 5BB36
          Π&2                                    * 5BB3B
          x^                                     * 5BB40
          Π&1                                    * 5BB45
          xLN                                    * 5BB4A
          lam'dvar                               * 5BB4F
          Π&2                                    * 5BB54
          xDER                                   * 5BB59
          x*                                     * 5BB5E
          x/                                     * 5BB63
        ;                                        * 5BB68

* refs (1): 1B941
OBJ_5BB6D:
        ::                                       * 5BB6D
          OBJ_5B32F                              * 5BB72
          {                                      * 5BB77
            OBJ_60E73                            * 5BB7C
            {                                    * 5BB81

'EXP(&1)':
              SYMBOL                             * 5BB86
                Π&1                              * 5BB8B
                xEXP                             * 5BB90
              ;                                  * 5BB95
              NULL{}                             * 5BB9A
              ::                                 * 5BB9F
                OBJ_5B375                        * 5BBA4
                Π&1                              * 5BBA9

'EXP(&1)'_5BBAE:
                SYMBOL                           * 5BBAE
                  Π&1                            * 5BBB3
                  xEXP                           * 5BBB8
                ;                                * 5BBBD
              ;                                  * 5BBC2
              NULL{}                             * 5BBC7
            }                                    * 5BBCC
          }                                      * 5BBD1
          OBJ_5B34D                              * 5BBD6
        ;                                        * 5BBDB
        NIBHEX  E8E60                            * 5BBE0  ←n

* meta&NEG -> meta meta -> meta&NEG
* refs (19): 55350 5620A 56246 56372 563BD 565B6 ...
metaneg:
        ::                                       * 5BBE5
          M-1stcasechs                           * 5BBEA
          NOP                                    * 5BBEF
          PTR     addt:                          * 5BBF4
          xNEG                                   * 5BBF9
        ;                                        * 5BBFE

* meta -> meta'
* refs (4): 5CC35 5CC4E 83D4D 83E0B
metaneglft:
        ::                                       * 5BC03
          pargop                                 * 5BC08
          metaneg                                * 5BC0D
          COLA                                   * 5BC12
          pshtop&                                * 5BC17
        ;                                        * 5BC1C

* meta -> meta'
* refs (4): 5CC99 5CCB2 83D66 83DF7
metainvlft:
        ::                                       * 5BC21
          pargop                                 * 5BC26
          metainv                                * 5BC2B
          COLA                                   * 5BC30
          pshtop&                                * 5BC35
        ;                                        * 5BC3A

* meta&INV -> meta meta -> meta&INV
* refs (16): 564C1 57C26 5B762 5B83E 5B857 5BC2B ...
metainv:
        ::                                       * 5BC3F
          M1stINVcase                            * 5BC44
          SWAPDROP#1-                            * 5BC49
          PTR     addt:                          * 5BC4E
          xINV                                   * 5BC53
        ;                                        * 5BC58

* meta&NEG -> meta&-
* refs (28): 476BF 5616A 5784C 5787E 57CD5 5AC5E ...
meta+:
        ::                                       * 5BC5D
          M-1stcasechs                           * 5BC62

* meta -> meta&-
addt-:
          ::                                     * 5BC67
            PTR     addt:                        * 5BC6C
            x-                                   * 5BC71
          ;                                      * 5BC76
          PTR     addt:                          * 5BC7B
          x+                                     * 5BC80
        ;                                        * 5BC85

* meta&NEG -> meta&+
* refs (13): 561B0 5ABAF 5BD66 5DD0F 839D2 839FA ...
meta-:
        ::                                       * 5BC8A
          M-1stcasechs                           * 5BC8F

* meta -> meta&+
addt+:
          ::                                     * 5BC94
            PTR     addt:                        * 5BC99
            x+                                   * 5BC9E
          ;                                      * 5BCA3
          PTR     addt:                          * 5BCA8
          x-                                     * 5BCAD
        ;                                        * 5BCB2

* meta&INV -> meta&/
* refs (28): 561F1 56205 5770C 5774D 5786A 57C30 ...
meta*:
        ::                                       * 5BCB7
          M1stINVcase                            * 5BCBC

* meta&ob -> meta&/
repl/:
          ::                                     * 5BCC1
            PTR     repl:                        * 5BCC6
            x/                                   * 5BCCB
          ;                                      * 5BCD0
          PTR     addt:                          * 5BCD5
          x*                                     * 5BCDA
        ;                                        * 5BCDF

* meta&INV -> meta&*
* refs (15): 5622D 56241 56403 58AA2 58AD4 5BD98 ...
meta/:
        ::                                       * 5BCE4
          M1stINVcase                            * 5BCE9

* meta&ob -> meta&*
repl*:
          ::                                     * 5BCEE
            PTR     repl:                        * 5BCF3
            x*                                   * 5BCF8
          ;                                      * 5BCFD
          PTR     addt:                          * 5BD02
          x/                                     * 5BD07
        ;                                        * 5BD0C

* refs (4): 5DA93 5DB74 5DBBA 844A4
[X]=>[NEG(X)]!:
        ::                                       * 5BD11
          addtNEG                                * 5BD16
          Meta->()                               * 5BD1B
        ;                                        * 5BD20

* refs (4): 5DAF2 5DC28 5DC6E 8453F
[X]=>[INV(X)]!:
        ::                                       * 5BD25
          PTR     addt:                          * 5BD2A
          xINV                                   * 5BD2F
          Meta->()                               * 5BD34
        ;                                        * 5BD39

* meta&NEG&ob -> meta&- meta&ob -> meta&+
* refs (7): 5CC44 83BC2 83C3F 83D20 83FDB 84021 ...
drpmeta+:
        ::                                       * 5BD3E
          SWAPDROP#1-                            * 5BD43
          COLA                                   * 5BD48
          meta+                                  * 5BD4D
        ;                                        * 5BD52

* meta&NEG&ob -> meta&+ meta&ob -> meta&-
* refs (8): 59234 5CC2B 83BA9 83C26 83D39 83FFE ...
drpmeta-:
        ::                                       * 5BD57
          SWAPDROP#1-                            * 5BD5C
          COLA                                   * 5BD61
          meta-                                  * 5BD66
        ;                                        * 5BD6B

* meta&INV&ob -> meta&/ meta&ob -> meta&*
* refs (10): 5CCA8 83BF4 83C71 83C99 83CBC 83CEE ...
drpmeta*:
        ::                                       * 5BD70
          SWAPDROP#1-                            * 5BD75
          COLA                                   * 5BD7A
          meta*                                  * 5BD7F
        ;                                        * 5BD84

* meta&INV&ob -> meta&* meta&ob -> meta&/
* refs (11): 5CC8F 83BDB 83C58 83CD5 83D07 8400D ...
drpmeta/:
        ::                                       * 5BD89
          SWAPDROP#1-                            * 5BD8E
          COLA                                   * 5BD93
          meta/                                  * 5BD98
        ;                                        * 5BD9D

L_5BDA2:
        CON(5)  x+                               * 5BDA2  address (the code jumps or points through it)

        CON(5)  x-                               * 5BDA7  address (the code jumps or points through it)

        CON(5)  x*                               * 5BDAC  address (the code jumps or points through it)

        CON(5)  x/                               * 5BDB1  address (the code jumps or points through it)

        CON(5)  x=                               * 5BDB6  address (the code jumps or points through it)

L_5BDBB:
        CON(5)  xSIN                             * 5BDBB  address (the code jumps or points through it)

        CON(5)  xCOS                             * 5BDC0  address (the code jumps or points through it)

        CON(5)  xTAN                             * 5BDC5  address (the code jumps or points through it)

        CON(5)  xSINH                            * 5BDCA  address (the code jumps or points through it)

        CON(5)  xCOSH                            * 5BDCF  address (the code jumps or points through it)

        CON(5)  xTANH                            * 5BDD4  address (the code jumps or points through it)

        CON(5)  xASIN                            * 5BDD9  address (the code jumps or points through it)

        CON(5)  xACOS                            * 5BDDE  address (the code jumps or points through it)

        CON(5)  xATAN                            * 5BDE3  address (the code jumps or points through it)

        CON(5)  xASINH                           * 5BDE8  address (the code jumps or points through it)

        CON(5)  xACOSH                           * 5BDED  address (the code jumps or points through it)

        CON(5)  xATANH                           * 5BDF2  address (the code jumps or points through it)

L_5BDF7:
        CON(5)  xCONJ                            * 5BDF7  address (the code jumps or points through it)

        CON(5)  xRE                              * 5BDFC  address (the code jumps or points through it)

        CON(5)  xIM                              * 5BE01  address (the code jumps or points through it)

        CON(5)  x+                               * 5BE06  address (the code jumps or points through it)

        CON(5)  x-                               * 5BE0B  address (the code jumps or points through it)

        CON(5)  x*                               * 5BE10  address (the code jumps or points through it)

        CON(5)  x/                               * 5BE15  address (the code jumps or points through it)

        CON(5)  xNEG                             * 5BE1A  address (the code jumps or points through it)

        CON(5)  xINV                             * 5BE1F  address (the code jumps or points through it)

        CON(5)  xEXP                             * 5BE24  address (the code jumps or points through it)

        CON(5)  xSQ                              * 5BE29  address (the code jumps or points through it)

L_5BE2E:
        CON(5)  x+                               * 5BE2E  address (the code jumps or points through it)

        CON(5)  x-                               * 5BE33  address (the code jumps or points through it)

        CON(5)  xSIN                             * 5BE38  address (the code jumps or points through it)

        CON(5)  xCOS                             * 5BE3D  address (the code jumps or points through it)

        CON(5)  xTAN                             * 5BE42  address (the code jumps or points through it)

        CON(5)  xSINH                            * 5BE47  address (the code jumps or points through it)

        CON(5)  xCOSH                            * 5BE4C  address (the code jumps or points through it)

        CON(5)  xTANH                            * 5BE51  address (the code jumps or points through it)

* refs (1): 58BA8
MetaMulInv:
        CON(5)  (*)+5                            * 5BE56  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5BE5B  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  37070                            * 5BE62  pattern: op2 op6 arg op6
        CON(5)  colinv1                          * 5BE67  run if it matches
        NIBHEX  37000                            * 5BE6C  pattern: op2 op6
        CON(5)  colinv2                          * 5BE71  run if it matches
        NIBHEX  30700                            * 5BE76  pattern: op2 arg op6
        CON(5)  colinv3                          * 5BE7B  run if it matches
        NIBHEX  F                                * 5BE80  end of the rules

* commute terms
* refs (1): 5996D
Meta<-->:
        CON(5)  (*)+5                            * 5BE81  primitive code object
        GOSBVL  SUB_5F6F2                        * 5BE86  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10000                            * 5BE8D  pattern: op0
        RPL
        ROMPTR  0F0 01F                          * 5BE92  run if it matches
        NIBHEX  20000                            * 5BE9D  pattern: op1
        ROMPTR  0F0 020                          * 5BEA2  run if it matches
        NIBHEX  30000                            * 5BEAD  pattern: op2
        ROMPTR  0F0 021                          * 5BEB2  run if it matches
        NIBHEX  40000                            * 5BEBD  pattern: op3
        ROMPTR  0F0 022                          * 5BEC2  run if it matches
        NIBHEX  F                                * 5BECD  end of the rules

* associate left term
* refs (3): 5999E 5CE1F 5CE33
Meta<-A:
        CON(5)  (*)+5                            * 5BECE  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5BED3  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  11000                            * 5BEDA  pattern: op0 op0
        CON(5)  OBJ_5C9FB                        * 5BEDF  run if it matches
        NIBHEX  12000                            * 5BEE4  pattern: op0 op1
        CON(5)  OBJ_5C9FB                        * 5BEE9  run if it matches
        NIBHEX  21000                            * 5BEEE  pattern: op1 op0
        RPL
        ROMPTR  0F0 023                          * 5BEF3  run if it matches
        NIBHEX  22000                            * 5BEFE  pattern: op1 op1
        ROMPTR  0F0 024                          * 5BF03  run if it matches
        NIBHEX  33000                            * 5BF0E  pattern: op2 op2
        CON(5)  OBJ_5C9FB                        * 5BF13  run if it matches
        NIBHEX  34000                            * 5BF18  pattern: op2 op3
        CON(5)  OBJ_5C9FB                        * 5BF1D  run if it matches
        NIBHEX  43000                            * 5BF22  pattern: op3 op2
        ROMPTR  0F0 025                          * 5BF27  run if it matches
        NIBHEX  44000                            * 5BF32  pattern: op3 op3
        ROMPTR  0F0 026                          * 5BF37  run if it matches
        NIBHEX  53000                            * 5BF42  pattern: op4 op2
        ROMPTR  0F0 027                          * 5BF47  run if it matches
        NIBHEX  F                                * 5BF52  end of the rules

* associate right term
* refs (3): 599ED 5CE56 5CE6A
MetaA->:
        CON(5)  (*)+5                            * 5BF53  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5BF58  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10100                            * 5BF5F  pattern: op0 arg op0
        CON(5)  OBJ_5CA32                        * 5BF64  run if it matches
        NIBHEX  20100                            * 5BF69  pattern: op1 arg op0
        CON(5)  OBJ_5CA32                        * 5BF6E  run if it matches
        NIBHEX  10200                            * 5BF73  pattern: op0 arg op1
        RPL
        ROMPTR  0F0 028                          * 5BF78  run if it matches
        NIBHEX  20200                            * 5BF83  pattern: op1 arg op1
        ROMPTR  0F0 029                          * 5BF88  run if it matches
        NIBHEX  30300                            * 5BF93  pattern: op2 arg op2
        CON(5)  OBJ_5CA32                        * 5BF98  run if it matches
        NIBHEX  40300                            * 5BF9D  pattern: op3 arg op2
        CON(5)  OBJ_5CA32                        * 5BFA2  run if it matches
        NIBHEX  30400                            * 5BFA7  pattern: op2 arg op3
        ROMPTR  0F0 02A                          * 5BFAC  run if it matches
        NIBHEX  40400                            * 5BFB7  pattern: op3 arg op3
        ROMPTR  0F0 02B                          * 5BFBC  run if it matches
        NIBHEX  50500                            * 5BFC7  pattern: op4 arg op4
        ROMPTR  0F0 02C                          * 5BFCC  run if it matches
        NIBHEX  F                                * 5BFD7  end of the rules

* delete right term
* refs (5): 57AD4 59E24 5B672 5CEFB 5CF0A
MetaD->:
        CON(5)  (*)+5                            * 5BFD8  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5BFDD  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  31000                            * 5BFE4  pattern: op2 op0
        CON(5)  OBJ_5CA50                        * 5BFE9  run if it matches
        NIBHEX  32000                            * 5BFEE  pattern: op2 op1
        CON(5)  OBJ_5CA50                        * 5BFF3  run if it matches
        NIBHEX  41000                            * 5BFF8  pattern: op3 op0
        RPL
        ROMPTR  0F0 02D                          * 5BFFD  run if it matches
        NIBHEX  42000                            * 5C008  pattern: op3 op1
        ROMPTR  0F0 02E                          * 5C00D  run if it matches
        NIBHEX  51000                            * 5C018  pattern: op4 op0
        ROMPTR  0F0 02F                          * 5C01D  run if it matches
        NIBHEX  52000                            * 5C028  pattern: op4 op1
        ROMPTR  0F0 030                          * 5C02D  run if it matches
        NIBHEX  81000                            * 5C038  pattern: op7 op0
        ROMPTR  0F0 031                          * 5C03D  run if it matches
        NIBHEX  91000                            * 5C048  pattern: op8 op0
        ROMPTR  0F0 031                          * 5C04D  run if it matches
        NIBHEX  82000                            * 5C058  pattern: op7 op1
        ROMPTR  0F0 032                          * 5C05D  run if it matches
        NIBHEX  92000                            * 5C068  pattern: op8 op1
        ROMPTR  0F0 032                          * 5C06D  run if it matches
        NIBHEX  A3000                            * 5C078  pattern: op9 op2
        ROMPTR  0F0 033                          * 5C07D  run if it matches
        NIBHEX  B3000                            * 5C088  pattern: op10 op2
        ROMPTR  0F0 033                          * 5C08D  run if it matches
        NIBHEX  A4000                            * 5C098  pattern: op9 op3
        ROMPTR  0F0 034                          * 5C09D  run if it matches
        NIBHEX  B4000                            * 5C0A8  pattern: op10 op3
        ROMPTR  0F0 034                          * 5C0AD  run if it matches
        NIBHEX  F                                * 5C0B8  end of the rules

* delete left term
* refs (4): 57AD9 59DD5 5CDED 5CDFC
Meta<-D:
        CON(5)  (*)+5                            * 5C0B9  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5C0BE  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  30100                            * 5C0C5  pattern: op2 arg op0
        CON(5)  OBJ_5CAA5                        * 5C0CA  run if it matches
        NIBHEX  30200                            * 5C0CF  pattern: op2 arg op1
        CON(5)  OBJ_5CAA5                        * 5C0D4  run if it matches
        NIBHEX  40100                            * 5C0D9  pattern: op3 arg op0
        CON(5)  OBJ_5CAA5                        * 5C0DE  run if it matches
        NIBHEX  40200                            * 5C0E3  pattern: op3 arg op1
        CON(5)  OBJ_5CAA5                        * 5C0E8  run if it matches
        NIBHEX  50300                            * 5C0ED  pattern: op4 arg op2
        CON(5)  OBJ_5CAA5                        * 5C0F2  run if it matches
        NIBHEX  50400                            * 5C0F7  pattern: op4 arg op3
        CON(5)  OBJ_5CAA5                        * 5C0FC  run if it matches
        NIBHEX  F                                * 5C101  end of the rules

* delete left term
* refs (1): 5B663
Meta<-D!:
        CON(5)  (*)+5                            * 5C102  primitive code object
        GOSBVL  SUB_5F6F2                        * 5C107  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  30100                            * 5C10E  pattern: op2 arg op0
        CON(5)  OBJ_5CAA5                        * 5C113  run if it matches
        NIBHEX  30200                            * 5C118  pattern: op2 arg op1
        CON(5)  OBJ_5CAA5                        * 5C11D  run if it matches
        NIBHEX  40100                            * 5C122  pattern: op3 arg op0
        CON(5)  OBJ_5CAA5                        * 5C127  run if it matches
        NIBHEX  40200                            * 5C12C  pattern: op3 arg op1
        CON(5)  OBJ_5CAA5                        * 5C131  run if it matches
        NIBHEX  F                                * 5C136  end of the rules

* remove prefix
* refs (6): 57AED 59D86 5BD1B 5BD34 5CF9B 5CFAA
Meta->():
        CON(5)  (*)+5                            * 5C137  primitive code object
        GOSBVL  SUB_5F6F2                        * 5C13C  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  61000                            * 5C143  pattern: op5 op0
        CON(5)  OBJ_5CC58                        * 5C148  run if it matches
        NIBHEX  62000                            * 5C14D  pattern: op5 op1
        CON(5)  OBJ_5CC71                        * 5C152  run if it matches
        NIBHEX  63000                            * 5C157  pattern: op5 op2
        RPL
        ROMPTR  0F0 035                          * 5C15C  run if it matches
        NIBHEX  64000                            * 5C167  pattern: op5 op3
        ROMPTR  0F0 036                          * 5C16C  run if it matches
        NIBHEX  6A000                            * 5C177  pattern: op5 op9
        ROMPTR  0F0 037                          * 5C17C  run if it matches
        NIBHEX  6B000                            * 5C187  pattern: op5 op10
        ROMPTR  0F0 037                          * 5C18C  run if it matches
        NIBHEX  66000                            * 5C197  pattern: op5 op5
        CON(5)  2pull2DROP                       * 5C19C  run if it matches
        NIBHEX  67000                            * 5C1A1  pattern: op5 op6
        CON(5)  ROTSWAP                          * 5C1A6  run if it matches
        NIBHEX  75000                            * 5C1AB  pattern: op6 op4
        ROMPTR  0F0 038                          * 5C1B0  run if it matches
        NIBHEX  78000                            * 5C1BB  pattern: op6 op7
        ROMPTR  0F0 039                          * 5C1C0  run if it matches
        NIBHEX  79000                            * 5C1CB  pattern: op6 op8
        ROMPTR  0F0 039                          * 5C1D0  run if it matches
        NIBHEX  73000                            * 5C1DB  pattern: op6 op2
        CON(5)  OBJ_5CCBC                        * 5C1E0  run if it matches
        NIBHEX  74000                            * 5C1E5  pattern: op6 op3
        CON(5)  OBJ_5CCD5                        * 5C1EA  run if it matches
        NIBHEX  77000                            * 5C1EF  pattern: op6 op6
        CON(5)  2pull2DROP                       * 5C1F4  run if it matches
        NIBHEX  76000                            * 5C1F9  pattern: op6 op5
        CON(5)  ROTSWAP                          * 5C1FE  run if it matches
        NIBHEX  F                                * 5C203  end of the rules

* double invert & remove prefix
* refs (1): 59C9F
Meta1/():
        CON(5)  (*)+5                            * 5C204  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5C209  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  30000                            * 5C210  pattern: op2
        RPL
        ROMPTR  0F0 03A                          * 5C215  run if it matches
        NIBHEX  40000                            * 5C220  pattern: op3
        ROMPTR  0F0 03B                          * 5C225  run if it matches
        NIBHEX  50000                            * 5C230  pattern: op4
        ROMPTR  0F0 03C                          * 5C235  run if it matches
        NIBHEX  80000                            * 5C240  pattern: op7
        ROMPTR  0F0 03D                          * 5C245  run if it matches
        NIBHEX  90000                            * 5C250  pattern: op8
        ROMPTR  0F0 03D                          * 5C255  run if it matches
        NIBHEX  F                                * 5C260  end of the rules

* double negate & remove prefix
* refs (1): 59C6F
Meta-():
        CON(5)  (*)+5                            * 5C261  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5C266  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  A0000                            * 5C26D  pattern: op9
        RPL
        ROMPTR  0F0 03E                          * 5C272  run if it matches
        NIBHEX  B0000                            * 5C27D  pattern: op10
        ROMPTR  0F0 03E                          * 5C282  run if it matches
        NIBHEX  10000                            * 5C28D  pattern: op0
        ROMPTR  0F0 041                          * 5C292  run if it matches
        NIBHEX  20000                            * 5C29D  pattern: op1
        ROMPTR  0F0 042                          * 5C2A2  run if it matches
        NIBHEX  30000                            * 5C2AD  pattern: op2
        ROMPTR  0F0 03F                          * 5C2B2  run if it matches
        NIBHEX  40000                            * 5C2BD  pattern: op3
        ROMPTR  0F0 040                          * 5C2C2  run if it matches
        NIBHEX  F                                * 5C2CD  end of the rules

* EXP(a*b) -> EXP(a)^b
* refs (2): 57ADE 59D53
MetaE^:
        CON(5)  (*)+5                            * 5C2CE  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5C2D3  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  83000                            * 5C2DA  pattern: op7 op2
        RPL
        ROMPTR  0F0 043                          * 5C2DF  run if it matches
        NIBHEX  93000                            * 5C2EA  pattern: op8 op2
        ROMPTR  0F0 043                          * 5C2EF  run if it matches
        NIBHEX  84000                            * 5C2FA  pattern: op7 op3
        ROMPTR  0F0 044                          * 5C2FF  run if it matches
        NIBHEX  94000                            * 5C30A  pattern: op8 op3
        ROMPTR  0F0 044                          * 5C30F  run if it matches
        NIBHEX  F                                * 5C31A  end of the rules

* EXP(a)^b -> EXP(a*b)
* refs (1): 59CCD
MetaE():
        CON(5)  (*)+5                            * 5C31B  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5C320  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  50800                            * 5C327  pattern: op4 arg op7
        RPL
        ROMPTR  0F0 045                          * 5C32C  run if it matches
        NIBHEX  50900                            * 5C337  pattern: op4 arg op8
        ROMPTR  0F0 045                          * 5C33C  run if it matches
        NIBHEX  F                                * 5C347  end of the rules

* LN(a^b) -> b*LN(a)
* refs (2): 57AE3 59D27
MetaL*:
        CON(5)  (*)+5                            * 5C348  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5C34D  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  A5000                            * 5C354  pattern: op9 op4
        RPL
        ROMPTR  0F0 046                          * 5C359  run if it matches
        NIBHEX  B5000                            * 5C364  pattern: op10 op4
        ROMPTR  0F0 046                          * 5C369  run if it matches
        NIBHEX  F                                * 5C374  end of the rules

* b*LN(a) -> LN(a^b)
* refs (1): 59CFB
MetaL():
        CON(5)  (*)+5                            * 5C375  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5C37A  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  30A00                            * 5C381  pattern: op2 arg op9
        RPL
        ROMPTR  0F0 047                          * 5C386  run if it matches
        NIBHEX  30B00                            * 5C391  pattern: op2 arg op10
        ROMPTR  0F0 047                          * 5C396  run if it matches
        NIBHEX  40A00                            * 5C3A1  pattern: op3 arg op9
        ROMPTR  0F0 048                          * 5C3A6  run if it matches
        NIBHEX  40B00                            * 5C3B1  pattern: op3 arg op10
        ROMPTR  0F0 048                          * 5C3B6  run if it matches
        NIBHEX  F                                * 5C3C1  end of the rules

* merge common factor on left
* refs (2): 59BD4 5CFFF
Meta<-M:
        CON(5)  (*)+5                            * 5C3C2  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5C3C7  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  35005                            * 5C3CE  pattern: op2 op4 arg arg op4
        RPL
        ROMPTR  0F0 04E                          * 5C3D3  run if it matches
        NIBHEX  45005                            * 5C3DE  pattern: op3 op4 arg arg op4
        ROMPTR  0F0 04F                          * 5C3E3  run if it matches
        NIBHEX  38080                            * 5C3EE  pattern: op2 op7 arg op7
        ROMPTR  0F0 050                          * 5C3F3  run if it matches
        NIBHEX  39090                            * 5C3FE  pattern: op2 op8 arg op8
        ROMPTR  0F0 050                          * 5C403  run if it matches
        NIBHEX  48080                            * 5C40E  pattern: op3 op7 arg op7
        ROMPTR  0F0 051                          * 5C413  run if it matches
        NIBHEX  49090                            * 5C41E  pattern: op3 op8 arg op8
        ROMPTR  0F0 051                          * 5C423  run if it matches
        NIBHEX  1A0A0                            * 5C42E  pattern: op0 op9 arg op9
        ROMPTR  0F0 052                          * 5C433  run if it matches
        NIBHEX  1B0B0                            * 5C43E  pattern: op0 op10 arg op10
        ROMPTR  0F0 052                          * 5C443  run if it matches
        NIBHEX  2A0A0                            * 5C44E  pattern: op1 op9 arg op9
        ROMPTR  0F0 053                          * 5C453  run if it matches
        NIBHEX  2B0B0                            * 5C45E  pattern: op1 op10 arg op10
        ROMPTR  0F0 053                          * 5C463  run if it matches
        NIBHEX  13000                            * 5C46E  pattern: op0 op2
        ROMPTR  0F0 049                          * 5C473  run if it matches
        NIBHEX  23000                            * 5C47E  pattern: op1 op2
        ROMPTR  0F0 04A                          * 5C483  run if it matches
        NIBHEX  14000                            * 5C48E  pattern: op0 op3
        ROMPTR  0F0 049                          * 5C493  run if it matches
        NIBHEX  24000                            * 5C49E  pattern: op1 op3
        ROMPTR  0F0 04A                          * 5C4A3  run if it matches
        NIBHEX  10000                            * 5C4AE  pattern: op0
        ROMPTR  0F0 049                          * 5C4B3  run if it matches
        NIBHEX  20000                            * 5C4BE  pattern: op1
        ROMPTR  0F0 04A                          * 5C4C3  run if it matches
        NIBHEX  F                                * 5C4CE  end of the rules

* merge common factor on right
* refs (2): 59C23 5D013
MetaM->:
        CON(5)  (*)+5                            * 5C4CF  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5C4D4  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  13003                            * 5C4DB  pattern: op0 op2 arg arg op2
        RPL
        ROMPTR  0F0 054                          * 5C4E0  run if it matches
        NIBHEX  23003                            * 5C4EB  pattern: op1 op2 arg arg op2
        ROMPTR  0F0 054                          * 5C4F0  run if it matches
        NIBHEX  14004                            * 5C4FB  pattern: op0 op3 arg arg op3
        ROMPTR  0F0 054                          * 5C500  run if it matches
        NIBHEX  24004                            * 5C50B  pattern: op1 op3 arg arg op3
        ROMPTR  0F0 054                          * 5C510  run if it matches
        NIBHEX  35005                            * 5C51B  pattern: op2 op4 arg arg op4
        ROMPTR  0F0 054                          * 5C520  run if it matches
        NIBHEX  45005                            * 5C52B  pattern: op3 op4 arg arg op4
        ROMPTR  0F0 054                          * 5C530  run if it matches
        NIBHEX  F                                * 5C53B  end of the rules

* add fractions
* refs (1): 59BA3
MetaAF:
        CON(5)  (*)+5                            * 5C53C  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5C541  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  14000                            * 5C548  pattern: op0 op3
        RPL
        ROMPTR  0F0 01C                          * 5C54D  run if it matches
        NIBHEX  24000                            * 5C558  pattern: op1 op3
        ROMPTR  0F0 01C                          * 5C55D  run if it matches
        NIBHEX  10400                            * 5C568  pattern: op0 arg op3
        ROMPTR  0F0 01E                          * 5C56D  run if it matches
        NIBHEX  20400                            * 5C578  pattern: op1 arg op3
        ROMPTR  0F0 01E                          * 5C57D  run if it matches
        NIBHEX  F                                * 5C588  end of the rules

* include left term
* refs (3): 59ADA 5CEC4 5CED8
Meta(<-:
        CON(5)  (*)+5                            * 5C589  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5C58E  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10000                            * 5C595  pattern: op0
        RPL
        ROMPTR  0F0 059                          * 5C59A  run if it matches
        NIBHEX  20000                            * 5C5A5  pattern: op1
        ROMPTR  0F0 059                          * 5C5AA  run if it matches
        NIBHEX  30000                            * 5C5B5  pattern: op2
        ROMPTR  0F0 05A                          * 5C5BA  run if it matches
        NIBHEX  40000                            * 5C5C5  pattern: op3
        ROMPTR  0F0 05A                          * 5C5CA  run if it matches
        NIBHEX  F                                * 5C5D5  end of the rules

* include right term
* refs (3): 59B29 5CE8D 5CEA1
Meta->):
        CON(5)  (*)+5                            * 5C5D6  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5C5DB  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10000                            * 5C5E2  pattern: op0
        RPL
        ROMPTR  0F0 05B                          * 5C5E7  run if it matches
        NIBHEX  20000                            * 5C5F2  pattern: op1
        ROMPTR  0F0 05B                          * 5C5F7  run if it matches
        NIBHEX  30000                            * 5C602  pattern: op2
        ROMPTR  0F0 05C                          * 5C607  run if it matches
        NIBHEX  40000                            * 5C612  pattern: op3
        ROMPTR  0F0 05C                          * 5C617  run if it matches
        NIBHEX  F                                * 5C622  end of the rules

* parenthesise nearest term
* refs (1): 59B77
Meta(()):
        CON(5)  (*)+5                            * 5C623  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5C628  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10000                            * 5C62F  pattern: op0
        RPL
        ROMPTR  0F0 05D                          * 5C634  run if it matches
        NIBHEX  20000                            * 5C63F  pattern: op1
        ROMPTR  0F0 05D                          * 5C644  run if it matches
        NIBHEX  30000                            * 5C64F  pattern: op2
        ROMPTR  0F0 05E                          * 5C654  run if it matches
        NIBHEX  40000                            * 5C65F  pattern: op3
        ROMPTR  0F0 05E                          * 5C664  run if it matches
        NIBHEX  F                                * 5C66F  end of the rules

* change EXP to trig. fns.
* refs (1): 59E72
Meta->TRG:
        CON(5)  (*)+5                            * 5C670  primitive code object
        ASSEMBLE
        GOSBVL  SUB_5F6F2                        * 5C675  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  80000                            * 5C67C  pattern: op7
        RPL
        ROMPTR  0F0 063                          * 5C681  run if it matches
        NIBHEX  F                                * 5C68C  end of the rules

* move nearest left term to right
* refs (3): 59A8B 5CF2D 5CF41
MetaT->:
        CON(5)  (*)+5                            * 5C68D  primitive code object
        ASSEMBLE
        LC(5)   L_5BDA2                          * 5C692
        GOSBVL  SUB_5F6F9                        * 5C699  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10000                            * 5C6A0  pattern: op0
        CON(5)  OBJ_5D794                        * 5C6A5  run if it matches
        NIBHEX  20000                            * 5C6AA  pattern: op1
        CON(5)  OBJ_5D794                        * 5C6AF  run if it matches
        NIBHEX  30000                            * 5C6B4  pattern: op2
        CON(5)  OBJ_5D7EF                        * 5C6B9  run if it matches
        NIBHEX  40000                            * 5C6BE  pattern: op3
        CON(5)  OBJ_5D7EF                        * 5C6C3  run if it matches
        NIBHEX  50000                            * 5C6C8  pattern: op4
        RPL
        ROMPTR  0F0 01A                          * 5C6CD  run if it matches
        NIBHEX  F                                * 5C6D8  end of the rules

* move nearest right term to left
* refs (3): 59A3C 5CF64 5CF78
Meta<-T:
        CON(5)  (*)+5                            * 5C6D9  primitive code object
        ASSEMBLE
        LC(5)   L_5BDA2                          * 5C6DE
        GOSBVL  SUB_5F6F9                        * 5C6E5  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10000                            * 5C6EC  pattern: op0
        RPL
        ROMPTR  0F0 057                          * 5C6F1  run if it matches
        NIBHEX  20000                            * 5C6FC  pattern: op1
        ROMPTR  0F0 057                          * 5C701  run if it matches
        NIBHEX  30000                            * 5C70C  pattern: op2
        ROMPTR  0F0 058                          * 5C711  run if it matches
        NIBHEX  40000                            * 5C71C  pattern: op3
        ROMPTR  0F0 058                          * 5C721  run if it matches
        NIBHEX  50000                            * 5C72C  pattern: op4
        ROMPTR  0F0 01B                          * 5C731  run if it matches
        NIBHEX  F                                * 5C73C  end of the rules

* remove 1st RE,IM; CONJ
* refs (3): 59EA5 5CFCD 5CFDC
Meta->()C%:
        CON(5)  (*)+5                            * 5C73D  primitive code object
        ASSEMBLE
        LC(5)   L_5BDF7                          * 5C742
        GOSBVL  SUB_5F6F9                        * 5C749  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  14000                            * 5C750  pattern: op0 op3
        RPL
        ROMPTR  0F0 05F                          * 5C755  run if it matches
        NIBHEX  15000                            * 5C760  pattern: op0 op4
        ROMPTR  0F0 05F                          * 5C765  run if it matches
        NIBHEX  16000                            * 5C770  pattern: op0 op5
        ROMPTR  0F0 05F                          * 5C775  run if it matches
        NIBHEX  17000                            * 5C780  pattern: op0 op6
        ROMPTR  0F0 05F                          * 5C785  run if it matches
        NIBHEX  18000                            * 5C790  pattern: op0 op7
        ROMPTR  0F0 05F                          * 5C795  run if it matches
        NIBHEX  19000                            * 5C7A0  pattern: op0 op8
        ROMPTR  0F0 05F                          * 5C7A5  run if it matches
        NIBHEX  1A000                            * 5C7B0  pattern: op0 op9
        ROMPTR  0F0 05F                          * 5C7B5  run if it matches
        NIBHEX  1B000                            * 5C7C0  pattern: op0 op10
        ROMPTR  0F0 05F                          * 5C7C5  run if it matches
        NIBHEX  24000                            * 5C7D0  pattern: op1 op3
        ROMPTR  0F0 060                          * 5C7D5  run if it matches
        NIBHEX  25000                            * 5C7E0  pattern: op1 op4
        ROMPTR  0F0 060                          * 5C7E5  run if it matches
        NIBHEX  28000                            * 5C7F0  pattern: op1 op7
        ROMPTR  0F0 060                          * 5C7F5  run if it matches
        NIBHEX  34000                            * 5C800  pattern: op2 op3
        ROMPTR  0F0 061                          * 5C805  run if it matches
        NIBHEX  35000                            * 5C810  pattern: op2 op4
        ROMPTR  0F0 061                          * 5C815  run if it matches
        NIBHEX  38000                            * 5C820  pattern: op2 op7
        ROMPTR  0F0 061                          * 5C825  run if it matches
        NIBHEX  26000                            * 5C830  pattern: op1 op5
        CON(5)  OBJ_5DCEB                        * 5C835  run if it matches
        NIBHEX  36000                            * 5C83A  pattern: op2 op5
        CON(5)  OBJ_5DD19                        * 5C83F  run if it matches
        NIBHEX  F                                * 5C844  end of the rules

* define function
* refs (1): 59EF3
Meta->DEF:
        CON(5)  (*)+5                            * 5C845  primitive code object
        ASSEMBLE
        LC(5)   L_5BDBB                          * 5C84A
        GOSBVL  SUB_5F6F9                        * 5C851  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  10000                            * 5C858  pattern: op0
        RPL
        ROMPTR  0F0 064                          * 5C85D  run if it matches
        NIBHEX  20000                            * 5C868  pattern: op1
        ROMPTR  0F0 065                          * 5C86D  run if it matches
        NIBHEX  30000                            * 5C878  pattern: op2
        ROMPTR  0F0 066                          * 5C87D  run if it matches
        NIBHEX  40000                            * 5C888  pattern: op3
        ROMPTR  0F0 06A                          * 5C88D  run if it matches
        NIBHEX  50000                            * 5C898  pattern: op4
        ROMPTR  0F0 06B                          * 5C89D  run if it matches
        NIBHEX  60000                            * 5C8A8  pattern: op5
        ROMPTR  0F0 06C                          * 5C8AD  run if it matches
        NIBHEX  70000                            * 5C8B8  pattern: op6
        ROMPTR  0F0 067                          * 5C8BD  run if it matches
        NIBHEX  80000                            * 5C8C8  pattern: op7
        ROMPTR  0F0 068                          * 5C8CD  run if it matches
        NIBHEX  90000                            * 5C8D8  pattern: op8
        ROMPTR  0F0 069                          * 5C8DD  run if it matches
        NIBHEX  A0000                            * 5C8E8  pattern: op9
        ROMPTR  0F0 06D                          * 5C8ED  run if it matches
        NIBHEX  B0000                            * 5C8F8  pattern: op10
        ROMPTR  0F0 06E                          * 5C8FD  run if it matches
        NIBHEX  C0000                            * 5C908  pattern: op11
        ROMPTR  0F0 06F                          * 5C90D  run if it matches
        NIBHEX  F                                * 5C918  end of the rules
        NIBHEX  0000                             * 5C919  ..

* expand trig fns. of a sum
* refs (1): 59F23
MetaTRG*:
        CON(5)  (*)+5                            * 5C91D  primitive code object
        ASSEMBLE
        LC(5)   L_5BE2E                          * 5C922
        GOSBVL  SUB_5F6F9                        * 5C929  inline data follows

* rewrite rules, read by the interpreter called just before (SUB_5F6F2)
        NIBHEX  31000                            * 5C930  pattern: op2 op0
        RPL
        ROMPTR  0F0 070                          * 5C935  run if it matches
        NIBHEX  32000                            * 5C940  pattern: op2 op1
        ROMPTR  0F0 070                          * 5C945  run if it matches
        NIBHEX  41000                            * 5C950  pattern: op3 op0
        ROMPTR  0F0 071                          * 5C955  run if it matches
        NIBHEX  42000                            * 5C960  pattern: op3 op1
        ROMPTR  0F0 071                          * 5C965  run if it matches
        NIBHEX  61000                            * 5C970  pattern: op5 op0
        ROMPTR  0F0 073                          * 5C975  run if it matches
        NIBHEX  62000                            * 5C980  pattern: op5 op1
        ROMPTR  0F0 073                          * 5C985  run if it matches
        NIBHEX  71000                            * 5C990  pattern: op6 op0
        ROMPTR  0F0 074                          * 5C995  run if it matches
        NIBHEX  72000                            * 5C9A0  pattern: op6 op1
        ROMPTR  0F0 074                          * 5C9A5  run if it matches
        NIBHEX  81000                            * 5C9B0  pattern: op7 op0
        ROMPTR  0F0 075                          * 5C9B5  run if it matches
        NIBHEX  82000                            * 5C9C0  pattern: op7 op1
        ROMPTR  0F0 075                          * 5C9C5  run if it matches
        NIBHEX  51000                            * 5C9D0  pattern: op4 op0
        ROMPTR  0F0 072                          * 5C9D5  run if it matches
        NIBHEX  52000                            * 5C9E0  pattern: op4 op1
        ROMPTR  0F0 072                          * 5C9E5  run if it matches
        NIBHEX  F                                * 5C9F0  end of the rules

* refs (6): 5CA05 83BAE 83BC7 83BE0 83BF9 83C17
OBJ_5C9F1:
        ::                                       * 5C9F1
        ;                                        * 5C9F6

* refs (4): 5BEDF 5BEE9 5BF13 5BF1D
OBJ_5C9FB:
        ::                                       * 5C9FB
          OBJ_5CA0F                              * 5CA00
          OBJ_5C9F1                              * 5CA05
        ;                                        * 5CA0A

* refs (6): 5CA00 83BA4 83BBD 83BD6 83BEF 83C08
OBJ_5CA0F:
        ::                                       * 5CA0F
          #1-SWAP                                * 5CA14
          pshm1                                  * 5CA19
          pargop                                 * 5CA1E
          ROTUntop&                              * 5CA23
          pshtop&                                * 5CA28
        ;                                        * 5CA2D

* refs (8): 5BF64 5BF6E 5BF98 5BFA2 83C30 83C49 ...
OBJ_5CA32:
        ::                                       * 5CA32
          pargop                                 * 5CA37
          #1-SWAP                                * 5CA3C
          psh1&rev                               * 5CA41
          pshtop&                                * 5CA46
        ;                                        * 5CA4B

* refs (5): 5BFE9 5BFF3 83C9E 83CB2 83CCB
OBJ_5CA50:
        ::                                       * 5CA50
          #1-SWAP                                * 5CA55
          BINT1                                  * 5CA5A
          2DUP                                   * 5CA5F
          rot                                    * 5CA64
          #1-SWAP                                * 5CA69
          psh1&rev                               * 5CA6E
          pshzerpsharg                           * 5CA73
          dup                                    * 5CA78
          larg                                   * 5CA7D
          NDROP                                  * 5CA82
          ROTUntop&                              * 5CA87
          ROTUntop&                              * 5CA8C
          rotswap                                * 5CA91
          top&                                   * 5CA96
          top&                                   * 5CA9B
        ;                                        * 5CAA0

* refs (14): 5C0CA 5C0D4 5C0DE 5C0E8 5C0F2 5C0FC ...
OBJ_5CAA5:
        ::                                       * 5CAA5
          pargop                                 * 5CAAA
          #1-SWAP                                * 5CAAF
          pshm1                                  * 5CAB4
          metaROTDUP                             * 5CAB9
          over&                                  * 5CABE
          psh                                    * 5CAC3
          pshzerpsharg                           * 5CAC8
          ROTUntop&                              * 5CACD
          pshtop&                                * 5CAD2
          pshtop&                                * 5CAD7
        ;                                        * 5CADC

* refs (6): 83E47 83E60 83E8D 83E9C 83EC4 83EEC
OBJ_5CAE1:
        ::                                       * 5CAE1
          pargop                                 * 5CAE6
          pargop                                 * 5CAEB
          ROTUntop&                              * 5CAF0
          pshtop&                                * 5CAF5
        ;                                        * 5CAFA

* refs (3): 83F05 83FE0 84003
OBJ_5CAFF:
        ::                                       * 5CAFF
          #1-SWAP                                * 5CB04
          pshm1                                  * 5CB09
          pargop                                 * 5CB0E
          pshzerpsharg                           * 5CB13
          pargop                                 * 5CB18
          rotswap                                * 5CB1D
          MEQU?                                  * 5CB22
          case                                   * 5CB27
          OBJ_5CB4F                              * 5CB2C
          ROTUntop&                              * 5CB31
          pshtop&                                * 5CB36
          pshtop&                                * 5CB3B
          pshtop&                                * 5CB40
          FALSE                                  * 5CB45
        ;                                        * 5CB4A

* refs (1): 5CB2C
OBJ_5CB4F:
        ::                                       * 5CB4F
          NDROP                                  * 5CB54
          pshtop&                                * 5CB59
          SWAPDROP#1-                            * 5CB5E
          pshtop&                                * 5CB63
          pshtop&                                * 5CB68
          ROTSWAP                                * 5CB6D
          TRUE                                   * 5CB72
        ;                                        * 5CB77

* refs (5): 84026 8403F 84058 84071 84085
OBJ_5CB7C:
        ::                                       * 5CB7C
          #1-SWAP                                * 5CB81
          pshm1                                  * 5CB86
          pargop                                 * 5CB8B
          pshzerpsharg                           * 5CB90
          rotswap                                * 5CB95
          pargop                                 * 5CB9A
          unrot                                  * 5CB9F
          MEQU?                                  * 5CBA4
          case                                   * 5CBA9
          OBJ_5CBD6                              * 5CBAE
          rotswap                                * 5CBB3
          top&                                   * 5CBB8
          over&                                  * 5CBBD
          pshtop&                                * 5CBC2
          pshtop&                                * 5CBC7
          FALSE                                  * 5CBCC
        ;                                        * 5CBD1

* refs (1): 5CBAE
OBJ_5CBD6:
        ::                                       * 5CBD6
          NDROP                                  * 5CBDB
          overev&                                * 5CBE0
          overev&                                * 5CBE5
          top&                                   * 5CBEA
          TRUE                                   * 5CBEF
        ;                                        * 5CBF4

* meta&ob -> M_last&M_rest
* refs (2): 83B22 83B63
drppargtop&:
        ::                                       * 5CBF9
          plDRPpZparg                            * 5CBFE
          COLA                                   * 5CC03
          top&                                   * 5CC08
        ;                                        * 5CC0D

* meta&ob1&ob2 -> meta
* refs (3): 290CD 5C19C 5C1F4
2pull2DROP:
        ::                                       * 5CC12
          ROTROT2DROP                            * 5CC17
          #2-                                    * 5CC1C
        ;                                        * 5CC21

* refs (2): 5CC67 83E1F
[f(X,Y)]=>[-X-Y]!:
        ::                                       * 5CC26
          drpmeta-                               * 5CC2B
          COLA                                   * 5CC30
          metaneglft                             * 5CC35
        ;                                        * 5CC3A

* refs (2): 5CC80 83E33
[f(X,Y)]=>[-X+Y]!:
        ::                                       * 5CC3F
          drpmeta+                               * 5CC44
          COLA                                   * 5CC49
          metaneglft                             * 5CC4E
        ;                                        * 5CC53

* refs (3): 5C148 5D126 5D1F3
OBJ_5CC58:
        ::                                       * 5CC58
          SWAPDROP#1-                            * 5CC5D
          COLA                                   * 5CC62
          [f(X,Y)]=>[-X-Y]!                      * 5CC67
        ;                                        * 5CC6C

* refs (3): 5C152 5D149 5D216
OBJ_5CC71:
        ::                                       * 5CC71
          SWAPDROP#1-                            * 5CC76
          COLA                                   * 5CC7B
          [f(X,Y)]=>[-X+Y]!                      * 5CC80
        ;                                        * 5CC85

* refs (2): 5CCCB 83D9D
[f(X,Y)]=>[INV(X)/Y]!:
        ::                                       * 5CC8A
          drpmeta/                               * 5CC8F
          COLA                                   * 5CC94
          metainvlft                             * 5CC99
        ;                                        * 5CC9E

* refs (2): 5CCE4 83DB6
[f(X,Y)]=>[INV(X)*Y]!:
        ::                                       * 5CCA3
          drpmeta*                               * 5CCA8
          COLA                                   * 5CCAD
          metainvlft                             * 5CCB2
        ;                                        * 5CCB7

* refs (3): 5C1E0 5D39D 5D46A
OBJ_5CCBC:
        ::                                       * 5CCBC
          SWAPDROP#1-                            * 5CCC1
          COLA                                   * 5CCC6
          [f(X,Y)]=>[INV(X)/Y]!                  * 5CCCB
        ;                                        * 5CCD0

* refs (3): 5C1EA 5D3C0 5D48D
OBJ_5CCD5:
        ::                                       * 5CCD5
          SWAPDROP#1-                            * 5CCDA
          COLA                                   * 5CCDF
          [f(X,Y)]=>[INV(X)*Y]!                  * 5CCE4
        ;                                        * 5CCE9

* meta1 meta2 -> meta1&M_rest M_last
* refs (8): 5D91C 5D9F3 8390F 8393C 83964 839B4 ...
larg&:
        ::                                       * 5CCEE
          larg                                   * 5CCF3
          over&                                  * 5CCF8
        ;                                        * 5CCFD

* refs (6): 58B80 5D0F9 5D1A8 5D243 5D298 5D2B1
OBJ_5CD02:
        ::                                       * 5CD02
          PTR     addt:                          * 5CD07
          x+                                     * 5CD0C
        ;                                        * 5CD11

* meta -> meta&*
* refs (17): 58657 58BE4 5B767 5B843 5D370 5D41F ...
addt*:
        ::                                       * 5CD16
          PTR     addt:                          * 5CD1B
          x*                                     * 5CD20
        ;                                        * 5CD25

* meta -> meta&NEG
* refs (15): 553FA 55576 58813 588C7 588D1 588FE ...
addtNEG:
        ::                                       * 5CD2A
          PTR     addt:                          * 5CD2F
          xNEG                                   * 5CD34
        ;                                        * 5CD39

* meta -> meta&INV
* refs (2): 5B7A3 5DB29
addtINV:
        ::                                       * 5CD3E
          PTR     addt:                          * 5CD43
          xINV                                   * 5CD48
        ;                                        * 5CD4D

* meta -> ?
* refs (17): 5CDA2 5CDE8 5CE1A 5CE2E 5CE51 5CE65 ...
evalcase::
        ::                                       * 5CD52
          'R                                     * 5CD57
          ::                                     * 5CD5C
            EVAL                                 * 5CD61
            RDROPCOLA                            * 5CD66
            SKIP                                 * 5CD6B
          ;                                      * 5CD70
        ;                                        * 5CD75

* meta -> ?omeg
* refs (4): 5CDF7 5CF05 5CFA5 5CFD7
revalcase::
        ::                                       * 5CD7A
          'R                                     * 5CD7F
          dvarlsBIND                             * 5CD84

* refs (1): 5CDBB
OBJ_5CD89:
          ::                                     * 5CD89
            #1-SWAP                              * 5CD8E
            pshm1                                * 5CD93
            BEGIN                                * 5CD98
            larg                                 * 5CD9D
            PTR     evalcase:                    * 5CDA2
            ::                                   * 5CDA7
              1GETLAM                            * 5CDAC
              COLA_EVAL                          * 5CDB1
            ;                                    * 5CDB6
            OBJ_5CD89                            * 5CDBB
            unrot                                * 5CDC0
            over&                                * 5CDC5
            #0=UNTIL                             * 5CDCA
            DROP                                 * 5CDCF
          ;                                      * 5CDD4
          ABND                                   * 5CDD9
        ;                                        * 5CDDE

* refs (1): 59DEE
<-D[_]!:
        ::                                       * 5CDE3
          PTR     evalcase:                      * 5CDE8
          Meta<-D                                * 5CDED

Meta<-Dall:
          ::                                     * 5CDF2
            PTR     revalcase:                   * 5CDF7
            Meta<-D                              * 5CDFC
            COLA                                 * 5CE01
            RDROP                                * 5CE06
          ;                                      * 5CE0B
        ;                                        * 5CE10

* refs (1): 599B7
Meta<-Aall:
        ::                                       * 5CE15
          PTR     evalcase:                      * 5CE1A
          Meta<-A                                * 5CE1F
          ::                                     * 5CE24
            BEGIN                                * 5CE29
            PTR     evalcase:                    * 5CE2E
            Meta<-A                              * 5CE33
            AGAIN                                * 5CE38
            3RDROP                               * 5CE3D
          ;                                      * 5CE42
        ;                                        * 5CE47

* refs (1): 59A06
MetaA->all:
        ::                                       * 5CE4C
          PTR     evalcase:                      * 5CE51
          MetaA->                                * 5CE56
          ::                                     * 5CE5B
            BEGIN                                * 5CE60
            PTR     evalcase:                    * 5CE65
            MetaA->                              * 5CE6A
            AGAIN                                * 5CE6F
            3RDROP                               * 5CE74
          ;                                      * 5CE79
        ;                                        * 5CE7E

* refs (1): 59B42
Meta->)all:
        ::                                       * 5CE83
          PTR     evalcase:                      * 5CE88
          Meta->)                                * 5CE8D
          ::                                     * 5CE92
            BEGIN                                * 5CE97
            PTR     evalcase:                    * 5CE9C
            Meta->)                              * 5CEA1
            AGAIN                                * 5CEA6
            3RDROP                               * 5CEAB
          ;                                      * 5CEB0
        ;                                        * 5CEB5

* refs (1): 59AF3
Meta(<-all:
        ::                                       * 5CEBA
          PTR     evalcase:                      * 5CEBF
          Meta(<-                                * 5CEC4
          ::                                     * 5CEC9
            BEGIN                                * 5CECE
            PTR     evalcase:                    * 5CED3
            Meta(<-                              * 5CED8
            AGAIN                                * 5CEDD
            3RDROP                               * 5CEE2
          ;                                      * 5CEE7
        ;                                        * 5CEEC

* refs (1): 59E3D
MetaD->all:
        ::                                       * 5CEF1
          PTR     evalcase:                      * 5CEF6
          MetaD->                                * 5CEFB
          ::                                     * 5CF00
            PTR     revalcase:                   * 5CF05
            MetaD->                              * 5CF0A
            COLA                                 * 5CF0F
            RDROP                                * 5CF14
          ;                                      * 5CF19
        ;                                        * 5CF1E

* refs (1): 59AA4
MetaT->all:
        ::                                       * 5CF23
          PTR     evalcase:                      * 5CF28
          MetaT->                                * 5CF2D
          ::                                     * 5CF32
            BEGIN                                * 5CF37
            PTR     evalcase:                    * 5CF3C
            MetaT->                              * 5CF41
            AGAIN                                * 5CF46
            3RDROP                               * 5CF4B
          ;                                      * 5CF50
        ;                                        * 5CF55

* refs (1): 59A55
Meta<-Tall:
        ::                                       * 5CF5A
          PTR     evalcase:                      * 5CF5F
          Meta<-T                                * 5CF64
          ::                                     * 5CF69
            BEGIN                                * 5CF6E
            PTR     evalcase:                    * 5CF73
            Meta<-T                              * 5CF78
            AGAIN                                * 5CF7D
            3RDROP                               * 5CF82
          ;                                      * 5CF87
        ;                                        * 5CF8C

* refs (1): 59D9F
Meta->()all:
        ::                                       * 5CF91
          PTR     evalcase:                      * 5CF96
          Meta->()                               * 5CF9B
          ::                                     * 5CFA0
            PTR     revalcase:                   * 5CFA5
            Meta->()                             * 5CFAA
            COLA                                 * 5CFAF
            RDROP                                * 5CFB4
          ;                                      * 5CFB9
        ;                                        * 5CFBE

* refs (1): 59EBE
Meta->()C%all:
        ::                                       * 5CFC3
          PTR     evalcase:                      * 5CFC8
          Meta->()C%                             * 5CFCD
          ::                                     * 5CFD2
            PTR     revalcase:                   * 5CFD7
            Meta->()C%                           * 5CFDC
            COLA                                 * 5CFE1
            RDROP                                * 5CFE6
          ;                                      * 5CFEB
        ;                                        * 5CFF0

* refs (1): 59BED
Meta<-Mall:
        ::                                       * 5CFF5
          OBJ_5D01D                              * 5CFFA
          Meta<-M                                * 5CFFF
        ;                                        * 5D004

* refs (1): 59C3C
MetaM->all:
        ::                                       * 5D009
          OBJ_5D01D                              * 5D00E
          MetaM->                                * 5D013
        ;                                        * 5D018
