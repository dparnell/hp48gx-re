* HP 48GX ROM revision R, #69142-#6C185: not yet identified
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: SUB RULES REPL NOT_69250 EXPR EDIT
* Follows on from the previous file (at #69142 in the original ROM).
        RPL

* refs (1): 68B66
OBJ_69142:
        ::                                       * 69142

* refs (4): 68878 68D32 68E4A 6B6B4
OBJ_69147:
          ::                                     * 69147
            OBJ_699B9                            * 6914C
            COLAcase                             * 69151
          ;                                      * 69156
          ::                                     * 6915B
            OBJ_6D661                            * 69160
            OBJ_6E4F6                            * 69165
            OBJ_67416                            * 6916A
            OBJ_67381                            * 6916F
            OBJ_67448                            * 69174
            OBJ_6EF41                            * 69179
            OBJ_69020                            * 6917E
          ;                                      * 69183

* refs (3): 68940 6D19A 6EA73
OBJ_69188:
          ::                                     * 69188

* refs (4): 692D8 6EE51 6EE7E 6EE9C
OBJ_6918D:
            ::                                   * 6918D
              OBJ_673D6                          * 69192
              DUP#1+                             * 69197
              OBJ_6747B                          * 6919C
              OBJ_67381                          * 691A1
              OBJ_6773D                          * 691A6
              #+                                 * 691AB
              OBJ_6779A                          * 691B0
            ;                                    * 691B5
            OBJ_676CF                            * 691BA
          ;                                      * 691BF
          DUP                                    * 691C4
          5PUTLAM                                * 691C9
          DUPTYPEIDNT?                           * 691CE
          SWAP                                   * 691D3
          TYPELAM?                               * 691D8
          OR                                     * 691DD
          NOTcase                                * 691E2

* refs (2): 68E86 68E9F
OBJ_691E7:
          ::                                     * 691E7
            OBJ_283F1                            * 691EC
            3PICK                                * 691F1
            LEN$                                 * 691F6
            3PICK                                * 691FB
            #>                                   * 69200
            NOTcase                              * 69205
            ::                                   * 6920A
              4UNROLL                            * 6920F
              OBJ_6E645                          * 69214
              DROP                               * 69219
              #1+                                * 6921E
              tok*                               * 69223
              OBJ_2840F                          * 69228
              tok*                               * 6922D
              OBJ_6BF8D                          * 69232
              OBJ_686C0                          * 69237
              OBJ_6C041                          * 6923C
              DROPDUP                            * 69241
              OBJ_6BF8D                          * 69246
              DUP                                * 6924B

NOT_69250:
              $       "NOT"                      * 69250
              EQUAL                              * 69260
              IT                                 * 69265
              ::                                 * 6926A
                SPACE$                           * 6926F
                OBJ_6BF8D                        * 69274
              ;                                  * 69279
              OBJ_283F1                          * 6927E
              2DROP                              * 69283
              DUPLEN$                            * 69288
              #1+                                * 6928D
              4ROLL                              * 69292
              OBJ_2840F                          * 69297
            ;                                    * 6929C
            LEN$                                 * 692A1
            #-                                   * 692A6
            DUP4UNROLL                           * 692AB
            tok*                                 * 692B0
            DUP                                  * 692B5
            OBJ_6934B                            * 692BA
            2DROP                                * 692BF
            ROT#1+                               * 692C4
            tok*                                 * 692C9
            OBJ_2840F                            * 692CE
          ;                                      * 692D3
          OBJ_6918D                              * 692D8
          ID>$                                   * 692DD
          OBJ_6D62A                              * 692E2
          OBJ_6D0D7                              * 692E7
          OVER                                   * 692EC
          OBJ_6681A                              * 692F1
          OBJ_67448                              * 692F6
          #0590410h                              * 692FB
          4PUTLAM                                * 69300
          BINT0                                  * 69305
          7PUTLAM                                * 6930A
          BINT3                                  * 6930F
          3PUTLAM                                * 69314
          OBJ_68EEF                              * 69319
        ;                                        * 6931E

* refs (1): 68710
OBJ_69323:
        ::                                       * 69323
          OBJ_283F1                              * 69328
          5ROLL                                  * 6932D
          SWAP                                   * 69332
          nultrior                               * 69337

* refs (1): 69404
OBJ_6933C:
          ::                                     * 6933C
            FALSE                                * 69341
            18PUTLAM                             * 69346

* refs (2): 688B9 692BA
OBJ_6934B:
            ::                                   * 6934B
              DROPDUP                            * 69350
              LEN$                               * 69355
              4ROLL                              * 6935A
              4PICK                              * 6935F
              2DUP                               * 69364
              1_#1-SUB$                          * 69369
              3UNROLL                            * 6936E
              LAST$                              * 69373
              4ROLLSWAP                          * 69378
              &$                                 * 6937D
              &$                                 * 69382
              3UNROLL                            * 69387
              #+                                 * 6938C
              GetNextToken                       * 69391
            ;                                    * 69396
            OBJ_693CD                            * 6939B
          ;                                      * 693A0
          OVER                                   * 693A5
          tok=casedrop                           * 693AA
          OBJ_693BE                              * 693AF
          tok;                                   * 693B4
          tok=casedrop                           * 693B9

* refs (1): 693AF
OBJ_693BE:
          ::                                     * 693BE
            DROP                                 * 693C3
            GetNextToken                         * 693C8

* refs (1): 6939B
OBJ_693CD:
            ::                                   * 693CD
              OBJ_69824                          * 693D2
              OBJ_28602                          * 693D7
              OBJ_2840F                          * 693DC
              OBJ_69941                          * 693E1
            ;                                    * 693E6
          ;                                      * 693EB
          LEN$                                   * 693F0
          ROTSWAP                                * 693F5
          #-SWAP                                 * 693FA
          NULL$                                  * 693FF
          OBJ_6933C                              * 69404
        ;                                        * 69409

* refs (2): 68B57 68B84
OBJ_6940E:
        ::                                       * 6940E
          OBJ_698D3                              * 69413
          BINT6                                  * 69418
          OBJ_69659                              * 6941D
          OBJ_698FB                              * 69422
          OBJ_698FB                              * 69427
          OBJ_69020                              * 6942C

* refs (1): 69490
OBJ_69431:
          ::                                     * 69431
            RDROP                                * 69436
            OBJ_67DDF                            * 6943B
            #0=case                              * 69440
            ::                                   * 69445
              OBJ_69495                          * 6944A
              OBJ_6E1A9                          * 6944F
              OBJ_674BB                          * 69454
              OBJ_67381                          * 69459
              OBJ_678DB                          * 6945E
              OBJ_678DB                          * 69463
              OBJ_2846E                          * 69468
              #05060410h                         * 6946D
              BINT0                              * 69472
              BINT5                              * 69477
              OBJ_67532                          * 6947C
              OBJ_28602                          * 69481
            ;                                    * 69486
            OBJ_69098                            * 6948B
            OBJ_69431                            * 69490

* refs (7): 68882 68963 68D91 690CA 6944A 69883 ...
OBJ_69495:
            ::                                   * 69495
              OBJ_6E9B0                          * 6949A
              ITE                                * 6949F
              ::                                 * 694A4
                OBJ_67B17                        * 694A9
                OBJ_66BAD                        * 694AE
                NOTcase                          * 694B3
                OBJ_67416                        * 694B8
                OBJ_67E0C                        * 694BD
                OBJ_679C5                        * 694C2
                OBJ_679EA                        * 694C7
                IT                               * 694CC
                ::                               * 694D1
                  OBJ_67B12                      * 694D6
                  #0=case                        * 694DB
                  OBJ_678DB                      * 694E0
                  RDROP                          * 694E5
                ;                                * 694EA
                OBJ_694F9                        * 694EF
              ;                                  * 694F4

* refs (1): 694EF
OBJ_694F9:
              ::                                 * 694F9
                OBJ_68F7B                        * 694FE
                OBJ_67878                        * 69503
              ;                                  * 69508
              DUP#0=csDROP                       * 6950D
              OBJ_0C4E3                          * 69512
              BINT34                             * 69517
              GETLAM                             * 6951C
              OVER#<                             * 69521
              NOTcase2DROP                       * 69526
              DUP                                * 6952B
              BINT34                             * 69530
              PUTLAM                             * 69535
              OBJ_6A267                          * 6953A
              OBJ_67C3C                          * 6953F
            ;                                    * 69544
            OBJ_69941                            * 69549
            OBJ_6996E                            * 6954E

* refs (3): 6906B 690A2 69A45
OBJ_69553:
            ::                                   * 69553
              FALSE                              * 69558
              BINT0                              * 6955D
              COLA                               * 69562
              OBJ_677C3                          * 69567
            ;                                    * 6956C
            2DROP                                * 69571
            BINT6                                * 69576
            EQcasedrop                           * 6957B
            OBJ_69996                            * 69580
            BINT8                                * 69585
            #-                                   * 6958A
            ZERO_DO                              * 6958F

* refs (3): 68931 6E3AC 6E3B1
OBJ_69594:
            ::                                   * 69594
              OBJ_672E6                          * 69599
              OBJ_67E34                          * 6959E
              #1-                                * 695A3
              OBJ_67F0B                          * 695A8
            ;                                    * 695AD
            LOOP                                 * 695B2
            OBJ_67F45                            * 695B7
            OBJ_28602                            * 695BC
          ;                                      * 695C1
        ;                                        * 695C6

* refs (3): 6BF83 6C0FF 6C163
OBJ_695CB:
        ::                                       * 695CB
          OBJ_699B9                              * 695D0
          18GETLAM                               * 695D5
          NOT                                    * 695DA
          OR                                     * 695DF
          caseFALSE                              * 695E4
          OBJ_672E6                              * 695E9
          #0=                                    * 695EE
          caseFALSE                              * 695F3
          tok=                                   * 695F8
          BINT7                                  * 695FD
          OBJ_69620                              * 69602
          tokrparen                              * 69607
          BINT5                                  * 6960C
          OBJ_69620                              * 69611
          NoDecSep                               * 69616
          BINT6                                  * 6961B

* refs (2): 69602 69611
OBJ_69620:
          ::                                     * 69620
            OBJ_69659                            * 69625
            NOTcaseDROP                          * 6962A
            RDROP                                * 6962F
            caseTRUE                             * 69634
            DROPFALSE                            * 69639
          ;                                      * 6963E
          FALSE                                  * 69643
        ;                                        * 69648

* refs (1): 698F6
OBJ_6964D:
        CON(5)  (*)+5                            * 6964D  primitive code object
        ASSEMBLE
        ST=1    2                                * 69652
        GOTO    L_69661                          * 69655

* refs (3): 69011 6941D 69625
OBJ_69659:
        CON(5)  (*)+5                            * 69659  primitive code object
        ST=0    2                                * 6965E
L_69661:
        GOSBVL  POP#                             * 69661
        D1=D1-  5                                * 69668
        D=D-1   A                                * 6966B
        ASRC                                     * 6966D
        GOSBVL  SUB_67E7B                        * 69670
        D0=D0+  10                               * 69677
L_6967A:
        D0=D0+  5                                * 6967A
        A=DAT0  A                                * 6967D
        D0=D0-  15                               * 69680
        LC(5)   x=                               * 69683
        ?C#A    A                                * 6968A
        GOYES   L_696B0                          * 6968D
        ?ST=0   2                                * 6968F
        GOYES   L_69698                          * 69692
        GOTO    L_69787                          * 69694
L_69698:
        LC(5)   FALSE                            * 69698
        R0=C                                     * 6969F
        LA(5)   TRUE                             * 696A2
        GOTO    L_69766                          * 696AC
L_696B0:
        C=DAT0  A                                * 696B0
        CD0EX                                    * 696B3
        D0=D0+  5                                * 696B6
        A=DAT0  A                                * 696B9
        D0=C                                     * 696BC
        ?A#0    A                                * 696BF
        GOYES   L_696C8                          * 696C2
        GOTO    L_69776                          * 696C4
L_696C8:
        D0=D0+  10                               * 696C8
        C=DAT0  A                                * 696CB
        CD0EX                                    * 696CE
        RSTK=C                                   * 696D1
        D0=D0+  5                                * 696D3
        C=DAT0  A                                * 696D6
        C=C-CON A,8                              * 696D9
        GONC    L_696F6                          * 696DF
L_696E2:
        C=RSTK                                   * 696E2
        A=C     A                                * 696E4
        LC(5)   #00019                           * 696E6
        A=A+C   A                                * 696ED
        D0=A                                     * 696EF
        GOTO    L_6967A                          * 696F2
L_696F6:
        C=C-A   A                                * 696F6
        GOC     L_696E2                          * 696F8
        D0=D0+  6                                * 696FB
        CD0EX                                    * 696FE
        C=C+A   A                                * 69701
        D0=C                                     * 69703
        C=DAT0  S                                * 69706
        ?C=A    S                                * 6970A
        GOYES   L_6975A                          * 6970D
        CPEX    15                               * 6970F
        ?P=     0                                * 69713
        GOYES   L_69740                          * 69716
        ?P=     2                                * 69718
        GOYES   L_69740                          * 6971B
        ?P=     3                                * 6971D
        GOYES   L_69740                          * 69720
        CPEX    15                               * 69722
        CAEX    S                                * 69726
        P=      7                                * 69729
        CPEX    15                               * 6972B
        ?C<A    S                                * 6972F
        GOYES   L_69734                          * 69732
L_69734:
        CPEX    15                               * 69734
        CAEX    S                                * 69738
        P=      0                                * 6973B
        GOC     L_69776                          * 6973D  never taken
L_69740:
        C=R2                                     * 69740
        D0=C                                     * 69743
        LC(5)   FALSE                            * 69746
        DAT1=C  A                                * 6974D
        A=DAT0  A                                * 69750
        D0=D0+  5                                * 69753
        PC=(A)                                   * 69756
L_6975A:
        LC(5)   TRUE                             * 6975A
        A=C     A                                * 69761
        R0=C                                     * 69763
L_69766:
        C=R2                                     * 69766
        D0=C                                     * 69769
        C=R0                                     * 6976C
        DAT1=C  A                                * 6976F
        PC=(A)                                   * 69772
L_69776:
        C=0     S                                * 69776
        P=      7                                * 69779
        CPEX    15                               * 6977B
        ?C=A    S                                * 6977F
        GOYES   L_69740                          * 69782
        GONC    L_6975A                          * 69784
L_69787:
        C=DAT0  A                                * 69787
        CD0EX                                    * 6978A
        D0=D0+  5                                * 6978D
        A=DAT0  A                                * 69790
        A=A-1   A                                * 69793
        ?A=0    A                                * 69795
        GOYES   L_6975A                          * 69798
        GONC    L_69740                          * 6979A
        RPL

* refs (1): 6870B
OBJ_6979D:
        ::                                       * 6979D
          TRUE                                   * 697A2
          18PUTLAM                               * 697A7
          8GETLAM                                * 697AC
          nultrior                               * 697B1
          OBJ_68724                              * 697B6
          DROP                                   * 697BB
          OBJ_283F1                              * 697C0
          ngsizecase                             * 697C5

* refs (3): 6880A 697E3 69810
OBJ_697CA:
          ::                                     * 697CA
            failed                               * 697CF
            2RDROP                               * 697D4
          ;                                      * 697D9
          delimcase                              * 697DE
          OBJ_697CA                              * 697E3
          DUP                                    * 697E8
          $>ID                                   * 697ED
          DUP                                    * 697F2
          undo                                   * 697F7
          ITE                                    * 697FC
          OBJ_27F1C                              * 69801
          OBJ_27F35                              * 69806
          NOTcasedrop                            * 6980B
          OBJ_697CA                              * 69810
          5UNROLL                                * 69815
          DROP                                   * 6981A
          GetNextToken                           * 6981F

* refs (3): 68E59 69034 693D2
OBJ_69824:
          ::                                     * 69824
            nultrior                             * 69829
            NOP                                  * 6982E
            OBJ_250EF                            * 69833
            NOP                                  * 69838
            3PICK                                * 6983D
            LEN$                                 * 69842
            3PICKSWAP                            * 69847
            #>                                   * 6984C
            NOT?SEMI                             * 69851
            LEN$                                 * 69856
            #-                                   * 6985B
            NULL$                                * 69860
          ;                                      * 69865
          OBJ_2840F                              * 6986A

* refs (1): 68BF7
OBJ_6986F:
          ::                                     * 6986F
            OBJ_676CF                            * 69874
            OBJ_6DE96                            * 69879
            OBJ_67F45                            * 6987E
            OBJ_69495                            * 69883
            OBJ_69941                            * 69888
          ;                                      * 6988D
          ::                                     * 69892
            OBJ_69A31                            * 69897
            NOP                                  * 6989C
            NOP                                  * 698A1
          ;                                      * 698A6
          8GETLAM                                * 698AB
          DUPNULL$?                              * 698B0
          case2DROP                              * 698B5
          EQUAL                                  * 698BA
          ?SEMI                                  * 698BF
          OBJ_6C555                              * 698C4
        ;                                        * 698C9

* refs (2): 689BD 68B93
OBJ_698CE:
        ::                                       * 698CE

* refs (2): 69007 69413
OBJ_698D3:
          ::                                     * 698D3
            OBJ_699B9                            * 698D8
            NOT?SEMI                             * 698DD
            RDROP                                * 698E2
            OBJ_27797                            * 698E7
          ;                                      * 698EC
          BINT7                                  * 698F1
          OBJ_6964D                              * 698F6

* refs (6): 69016 6901B 69422 69427 699CD 699E1
OBJ_698FB:
          ::                                     * 698FB
            ?SEMI                                * 69900
            RDROP                                * 69905
            OBJ_27797                            * 6990A
          ;                                      * 6990F
          DROP                                   * 69914
          OBJ_69020                              * 69919
          OBJ_69928                              * 6991E
        ;                                        * 69923

* refs (2): 6991E 69937
OBJ_69928:
        ::                                       * 69928
          RDROP                                  * 6992D
          OBJ_69098                              * 69932
          OBJ_69928                              * 69937
          OBJ_69495                              * 6993C

* refs (8): 68904 68BCA 69066 693E1 69549 69888 ...
OBJ_69941:
          ::                                     * 69941
            OBJ_6996E                            * 69946

* refs (2): 6907F 6999B
OBJ_6994B:
            ::                                   * 6994B
              OBJ_672E6                          * 69950
              OBJ_67E34                          * 69955
              #1+                                * 6995A
              OBJ_67F0B                          * 6995F
            ;                                    * 69964
          ;                                      * 69969

* refs (4): 69084 690C5 6954E 69946
OBJ_6996E:
          ::                                     * 6996E
            OBJ_67DDF                            * 69973
            DUP#0=csedrp                         * 69978
            OBJ_6E11D                            * 6997D
            OBJ_67DEC                            * 69982
            OBJ_6EF6E                            * 69987
            OBJ_6E2D0                            * 6998C
          ;                                      * 69991

* refs (2): 69089 69580
OBJ_69996:
          ::                                     * 69996
            OBJ_6994B                            * 6999B
            OBJ_67F45                            * 699A0
            OBJ_28602                            * 699A5
          ;                                      * 699AA
        ;                                        * 699AF

* refs (1): 68BA2
OBJ_699B4:
        ::                                       * 699B4

* refs (8): 4EC8A 6914C 695D0 698D8 6E695 6E6A9 ...
OBJ_699B9:
          ::                                     * 699B9
            1GETLAM                              * 699BE
            #0=                                  * 699C3
          ;                                      * 699C8
          OBJ_698FB                              * 699CD
          OBJ_67DEC                              * 699D2
          OBJ_2846E                              * 699D7
          EQ                                     * 699DC
          OBJ_698FB                              * 699E1
          OBJ_69020                              * 699E6
          OBJ_672E6                              * 699EB
          OBJ_2845A                              * 699F0
          OBJ_67F31                              * 699F5
          OBJ_67381                              * 699FA
          OBJ_679A1                              * 699FF
          DUP                                    * 69A04
          OBJ_6BC55                              * 69A09
          CHR>$                                  * 69A0E
          tokanglesign                           * 69A13
          &$                                     * 69A18
          OBJ_6CB70                              * 69A1D
          OBJ_44DFE                              * 69A22
          OBJ_6681A                              * 69A27
        ;                                        * 69A2C

* refs (4): 68706 68AFD 69897 69B0D
OBJ_69A31:
        ::                                       * 69A31
          OBJ_67DDF                              * 69A36
          #0=case                                * 69A3B
          3SKIP                                  * 69A40
          OBJ_69553                              * 69A45
          NOTcase                                * 69A4A
          2skipcola                              * 69A4F
          DROP                                   * 69A54
          OBJ_27D32                              * 69A59
          3SKIP                                  * 69A5E
          COLA                                   * 69A63
          OBJ_27D9A                              * 69A68
          ::                                     * 69A6D
            toklparen                            * 69A72
            COLAskipcola                         * 69A77
          ;                                      * 69A7C
          ::                                     * 69A81
            tokrparen                            * 69A86
            COLAskipcola                         * 69A8B
          ;                                      * 69A90
          ::                                     * 69A95
            NoDecSep                             * 69A9A
            COLAskipcola                         * 69A9F
          ;                                      * 69AA4
          ::                                     * 69AA9
            tok=                                 * 69AAE
            COLAskipcola                         * 69AB3
          ;                                      * 69AB8
          OBJ_69B17                              * 69ABD
          8GETLAM                                * 69AC2
          OBJ_27E68                              * 69AC7
          ITE                                    * 69ACC
          ::                                     * 69AD1
            OBJ_69941                            * 69AD6
            OBJ_69020                            * 69ADB
          ;                                      * 69AE0
          BINT7                                  * 69AE5
          BINT8                                  * 69AEA
          #-                                     * 69AEF
          OBJ_672E6                              * 69AF4
          OBJ_67E34                              * 69AF9
          ROT#-                                  * 69AFE
          OBJ_67F0B                              * 69B03
          COLA                                   * 69B08
          OBJ_69A31                              * 69B0D
        ;                                        * 69B12

* refs (1): 69ABD
OBJ_69B17:
        ::                                       * 69B17
          OBJ_69941                              * 69B1C
          COLA                                   * 69B21
          3SKIP                                  * 69B26
        ;                                        * 69B2B

* refs (2): 5D04F 5D054
OBJ_69B30:
        ::                                       * 69B30
          DUP#1+PICK                             * 69B35
          #+                                     * 69B3A
          #1+                                    * 69B3F
        ;                                        * 69B44

* refs (4): 69DDE 69ED4 6A16D 6C43D
OBJ_69B49:
        ::                                       * 69B49
          ERRORCLR                               * 69B4E
          ClrDA1IsStat                           * 69B53
          ROMPTR  0EA 03C                        * 69B58
          'LB                                    * 69B63
          TOPROW                                 * 69B68
          ROMPTR  0EA 03C                        * 69B6D
          'TE                                    * 69B78
          LEFTCOL                                * 69B7D
          ROMPTR  0EA 03C                        * 69B82
          'LE                                    * 69B8D
          FALSE'                                 * 69B92
          'FOK                                   * 69B97
          STO                                    * 69B9C
          FALSE'                                 * 69BA1
          'EL                                    * 69BA6
          STO                                    * 69BAB
          '                                      * 69BB0
          ::                                     * 69BB5

* refs (2): 69C32 6C8B9
OBJ_69BBA:
            ::                                   * 69BBA
              DA3OK?                             * 69BBF
              ?SEMI                              * 69BC4
              DispMenu                           * 69BC9
              SetDA3NoCh                         * 69BCE
            ;                                    * 69BD3
            'FOK                                 * 69BD8
            ?SEMI                                * 69BDD
            TRUE'                                * 69BE2
            'FOK                                 * 69BE7
            STO                                  * 69BEC
            OBJ_66CD6                            * 69BF1
            OBJ_67CBE                            * 69BF6
            OBJ_25C23                            * 69BFB
          ;                                      * 69C00
          '                                      * 69C05
          OBJ_6A7C0                              * 69C0A
          TrueTrue                               * 69C0F
          5ROLL                                  * 69C14
          ONEFALSE'                              * 69C19
          GraphicExit                            * 69C1E
          'ERRJMP                                * 69C23
          ClrDA3OK                               * 69C28
          ParOuterLoop                           * 69C2D
          OBJ_69BBA                              * 69C32
          ExitFcn                                * 69C37

* refs (3): 6A900 6BBEF 6BC4B
OBJ_69C3C:
          ::                                     * 69C3C
            EXITFCNsto                           * 69C41
            NOP                                  * 69C46
          ;                                      * 69C4B
          FALSE                                  * 69C50
          19PUTLAM                               * 69C55
          COLA_EVAL                              * 69C5A
        ;                                        * 69C5F

* refs (24): 596CE 59718 59766 597B0 59836 59880 ...
OBJ_69C64:
        ::                                       * 69C64
          TakeOver                               * 69C69
          BINT0                                  * 69C6E

* refs (1): 69CC0
OBJ_69C73:
          ROMPTR  0EA 03C                        * 69C73
          'ploc                                  * 69C7E
          SetDA3NoCh                             * 69C83
          'R                                     * 69C88
          ROMPTR  0EA 03C                        * 69C8D
          'ManOp                                 * 69C98
          EXITFCNsto                             * 69C9D
          OBJ_69DE8                              * 69CA2
        ;                                        * 69CA7

* refs (19): 59999 599B2 599E8 59A01 59A37 59A50 ...
OBJ_69CAC:
        ::                                       * 69CAC
          TakeOver                               * 69CB1
          BINT3                                  * 69CB6
          GOTO                                   * 69CBB
          OBJ_69C73                              * 69CC0
        ;                                        * 69CC5

* refs (3): 69E98 6ADF2 6B1F6
OBJ_69CCA:
        ::                                       * 69CCA
          OBJ_6B0E8                              * 69CCF
          SYMBN                                  * 69CD4
          1PUTLAM                                * 69CD9
          OBJ_677DE                              * 69CDE
          OBJ_67416                              * 69CE3
          1GETABND                               * 69CE8
          ZEROSWAP                               * 69CED

* refs (1): 6A014
OBJ_69CF2:
          ::                                     * 69CF2
            CLEARVDISP                           * 69CF7
            REDISPHBUFF                          * 69CFC
            NULL$                                * 69D01
            TRUE                                 * 69D06
            OBJ_6C550                            * 69D0B
            ERRSET                               * 69D10
            OBJ_677EA                            * 69D15
            #2+PICK                              * 69D1A
            OBJ_67426                            * 69D1F
            OBJ_6C4A1                            * 69D24
            ERRSET                               * 69D29
            ROMPTR  0EA 005                      * 69D2E
            ERRTRAP                              * 69D39
            ::                                   * 69D3E
              OBJ_6AE6F                          * 69D43
              OBJ_6AE6F                          * 69D48
              OBJ_6AE6F                          * 69D4D
              3DROP                              * 69D52
              OBJ_677DE                          * 69D57
              OBJ_677EA                          * 69D5C
              #0=?SKIP                           * 69D61
              ABND                               * 69D66
              OBJ_677DE                          * 69D6B
              ERRJMP                             * 69D70
            ;                                    * 69D75
          ;                                      * 69D7A
          OBJ_6AE6F                              * 69D7F
          OBJ_6C302                              * 69D84
          OBJ_6AE6F                              * 69D89
          DROP                                   * 69D8E
          OBJ_6C302                              * 69D93
          OBJ_6AE6F                              * 69D98
          OBJ_6C302                              * 69D9D
          SWAP                                   * 69DA2
          OBJ_6C2C1                              * 69DA7
          10PUTLAM                               * 69DAC
          OBJ_666D3                              * 69DB1
          OBJ_0C4E3                              * 69DB6
          SWAP#-                                 * 69DBB
          #1+                                    * 69DC0
          OBJ_6B39F                              * 69DC5
          DUP                                    * 69DCA
          18PUTLAM                               * 69DCF
          OBJ_6AEA6                              * 69DD4
          SWAPCOLA                               * 69DD9
          OBJ_69B49                              * 69DDE
        ;                                        * 69DE3

* refs (1): 69CA2
OBJ_69DE8:
        ::                                       * 69DE8
          OBJ_6AF46                              * 69DED
          DUP                                    * 69DF2
          4PUTLAM                                * 69DF7
          DUP#2+PICK                             * 69DFC
          5PUTLAM                                * 69E01
          OBJ_0C4E3                              * 69E06
          #3+                                    * 69E0B
          NDUP                                   * 69E10
          OBJ_69EDE                              * 69E15
          DUP                                    * 69E1A
          2PUTLAM                                * 69E1F
          DUP                                    * 69E24
          4GETLAM                                * 69E29
          #-                                     * 69E2E
          6PUTLAM                                * 69E33
          DUP#2+PICK                             * 69E38
          7PUTLAM                                * 69E3D
          OBJ_0C4E3                              * 69E42
          #3+                                    * 69E47
          NDROP                                  * 69E4C
          ::                                     * 69E51
            'ManOp                               * 69E56
            EVAL                                 * 69E5B
            ::                                   * 69E60
              'NOP                               * 69E65
              ROMPTR  0EA 03C                    * 69E6A
              'ManOp                             * 69E75
              DoBadKey                           * 69E7A
            ;                                    * 69E7F
          ;                                      * 69E84
          3GETLAM                                * 69E89
          #0<>                                   * 69E8E
          case                                   * 69E93
          OBJ_69CCA                              * 69E98
          'ManOp                                 * 69E9D
          'NOP                                   * 69EA2
          EQ                                     * 69EA7
          case                                   * 69EAC
          ::                                     * 69EB1
            OBJ_6B0E8                            * 69EB6
            NDROP                                * 69EBB
            OBJ_6AEA6                            * 69EC0
            'LB                                  * 69EC5
            OBJ_6F5A4                            * 69ECA
            COLA                                 * 69ECF
            OBJ_69B49                            * 69ED4
          ;                                      * 69ED9

* refs (1): 69E15
OBJ_69EDE:
          ::                                     * 69EDE
            'LB                                  * 69EE3
            OBJ_6AC67                            * 69EE8
            OBJ_6AC80                            * 69EED
            OBJ_6AEF1                            * 69EF2
            IT                                   * 69EF7
            OBJ_69F92                            * 69EFC
            OBJ_678DB                            * 69F01
            #1=                                  * 69F06
            ?SEMI                                * 69F0B
            rot                                  * 69F10
            DUP#0=case                           * 69F15
            unrot                                * 69F1A
            DUP#2+                               * 69F1F
            BINT1                                * 69F24
            splitdown                            * 69F29
            DROP                                 * 69F2E
            #1-                                  * 69F33
            1PUTLAM                              * 69F38
            top&                                 * 69F3D
            top&                                 * 69F42
            1GETLAM                              * 69F47
            tailpsh                              * 69F4C
            pZpargSWAPUn                         * 69F51
          ;                                      * 69F56
          DUP#1+                                 * 69F5B
          NDUP                                   * 69F60
          6GETLAM                                * 69F65
          5GETLAM                                * 69F6A
          2GETLAM                                * 69F6F
          7GETLAM                                * 69F74
          #+                                     * 69F79
          OBJ_6B39F                              * 69F7E
          DUP                                    * 69F83
          7PUTLAM                                * 69F88
          DUP                                    * 69F8D

* refs (2): 69EFC 6A3A2
OBJ_69F92:
          ::                                     * 69F92
            BEGIN                                * 69F97
            OBJ_678DB                            * 69F9C
            OBJ_67B12                            * 69FA1
            OBJ_6EE65                            * 69FA6
            NOT_UNTIL                            * 69FAB
          ;                                      * 69FB0
          DUP#1=                                 * 69FB5
          ITE                                    * 69FBA
          DROP                                   * 69FBF
          SWAPDROP                               * 69FC4
          OBJ_673E6                              * 69FC9
          OBJ_67381                              * 69FCE
          OBJ_67406                              * 69FD3
          OBJ_673A2                              * 69FD8
          OBJ_673F6                              * 69FDD
          OBJ_681E8                              * 69FE2
          2GETLAM                                * 69FE7
          OBJ_67665                              * 69FEC
          BINT11                                 * 69FF1
          {}N                                    * 69FF6
          OVER#2+UNROL                           * 69FFB
          7GETLAM                                * 6A000
          OBJ_67A1E                              * 6A005
          OVER#2+UNROL                           * 6A00A
          SYMBN                                  * 6A00F
          OBJ_69CF2                              * 6A014
          OBJ_0C4E3                              * 6A019
          3PUTLAM                                * 6A01E
          DROP                                   * 6A023
          OBJ_67364                              * 6A028
          {}N                                    * 6A02D
          SWAPDROP                               * 6A032
          OBJ_673D6                              * 6A037
          OBJ_6773D                              * 6A03C
          DUPUNROT                               * 6A041
          #2+UNROLL                              * 6A046
          NDROP                                  * 6A04B
          1PUTLAM                                * 6A050
          OBJ_0C4E3                              * 6A055
          SYMBN                                  * 6A05A
          5PUTLAM                                * 6A05F
          3DROP                                  * 6A064
          INCOMPDROP                             * 6A069
          OBJ_67648                              * 6A06E
          OBJ_0C4E3                              * 6A073
          SWAP#-                                 * 6A078
          8PUTLAM                                * 6A07D
          BINT1                                  * 6A082
          OBJ_679B3                              * 6A087
          11PUTLAM                               * 6A08C
          OBJ_681E8                              * 6A091
          BINT43                                 * 6A096
          OBJ_67381                              * 6A09B
          OBJ_6869D                              * 6A0A0
          SUBHXS                                 * 6A0A5
          12PUTLAM                               * 6A0AA
          OBJ_681B1                              * 6A0AF
          OBJ_6749B                              * 6A0B4
          OBJ_67458                              * 6A0B9
          OBJ_674AB                              * 6A0BE
          OBJ_6746B                              * 6A0C3
          DUP                                    * 6A0C8
          OBJ_6748B                              * 6A0CD
          OBJ_6747B                              * 6A0D2
          4PUTLAM                                * 6A0D7
          BINT27                                 * 6A0DC
          PUTLAM                                 * 6A0E1
          22PUTLAM                               * 6A0E6
          NDROP                                  * 6A0EB
          DUP                                    * 6A0F0
          7PUTLAM                                * 6A0F5
          5GETLAM                                * 6A0FA
          INNERCOMP                              * 6A0FF
          OBJ_6B0E8                              * 6A104
          OBJ_690FC                              * 6A109
          1GETLAM                                * 6A10E
          4GETLAM                                * 6A113
          OBJ_6A177                              * 6A118
          BINT27                                 * 6A11D
          GETLAM                                 * 6A122
          3GETLAM                                * 6A127
          22Lget                                 * 6A12C
          #-                                     * 6A131
          #+                                     * 6A136
          OBJ_6B39F                              * 6A13B
          ABND                                   * 6A140
          DUP                                    * 6A145
          18PUTLAM                               * 6A14A
          OBJ_6681A                              * 6A14F
          CLEARVDISP                             * 6A154
          OBJ_666D3                              * 6A159
          OBJ_6AEA6                              * 6A15E
          'LB                                    * 6A163
          COLA                                   * 6A168
          OBJ_69B49                              * 6A16D
        ;                                        * 6A172

* refs (1): 6A118
OBJ_6A177:
        ::                                       * 6A177
          DUP                                    * 6A17C
          4PUTLAM                                * 6A181
          OBJ_68550                              * 6A186
          15PUTLAM                               * 6A18B
          OBJ_678D6                              * 6A190
          9PUTLAM                                * 6A195
          OBJ_67987                              * 6A19A
          5PUTLAM                                * 6A19F
          OBJ_6799C                              * 6A1A4
          6PUTLAM                                * 6A1A9
          DUP                                    * 6A1AE
          OBJ_68F7B                              * 6A1B3
          ROT                                    * 6A1B8
          #MIN                                   * 6A1BD
          SWAPDUP                                * 6A1C2
          10PUTLAM                               * 6A1C7
          #1+DUP                                 * 6A1CC
          2PUTLAM                                * 6A1D1
          SWAPDUP                                * 6A1D6
          1PUTLAM                                * 6A1DB
          11GETLAM                               * 6A1E0
          OVER#+                                 * 6A1E5
          #2-                                    * 6A1EA
          11PUTLAM                               * 6A1EF
          2DUP                                   * 6A1F4
          #-                                     * 6A1F9
          4PICK                                  * 6A1FE
          LENCOMP                                * 6A203
          DUP                                    * 6A208
          14PUTLAM                               * 6A20D
          OBJ_6A44C                              * 6A212
          2GETLAM                                * 6A217
          13GETLAM                               * 6A21C
          #+                                     * 6A221
          DUP                                    * 6A226
          2PUTLAM                                * 6A22B
          1GETLAM                                * 6A230
          OBJ_6D9AE                              * 6A235
          DUP#0=ITE                              * 6A23A
          ::                                     * 6A23F
            ROTROT2DROP                          * 6A244
            OBJ_6A5DC                            * 6A249
            3GETLAM                              * 6A24E
          ;                                      * 6A253
          OBJ_6A591                              * 6A258
          OBJ_6A267                              * 6A25D
          OVER                                   * 6A262

* refs (3): 6953A 6A25D 6EA46
OBJ_6A267:
          ::                                     * 6A267
            #       80000                        * 6A26C  524288
            #+                                   * 6A276
          ;                                      * 6A27B
          1GETLAM                                * 6A280
          BINT2                                  * 6A285

* refs (1): 6A30C
OBJ_6A28A:
          ::                                     * 6A28A
            2DUP#=                               * 6A28F
            8GETLAM                              * 6A294
            #0=                                  * 6A299
            ORcase                               * 6A29E
            2DROP                                * 6A2A3
            DO                                   * 6A2A8
            INDEX@                               * 6A2AD
            OBJ_67B12                            * 6A2B2
            DUP                                  * 6A2B7
            OBJ_6EE65                            * 6A2BC
            IT                                   * 6A2C1
            #1+                                  * 6A2C6
            DUP                                  * 6A2CB
            4PICK                                * 6A2D0
            #>ITE                                * 6A2D5
            ::                                   * 6A2DA
              8GETLAM                            * 6A2DF
              #+                                 * 6A2E4
              OBJ_67C3C                          * 6A2E9
            ;                                    * 6A2EE
            2DROP                                * 6A2F3
            LOOP                                 * 6A2F8
          ;                                      * 6A2FD
          OBJ_6733B                              * 6A302
          2GETLAM                                * 6A307
          OBJ_6A28A                              * 6A30C
          DROP                                   * 6A311
          2GETLAM                                * 6A316
          1GETLAM                                * 6A31B
          DO                                     * 6A320
          INDEX@                                 * 6A325
          OBJ_67B12                              * 6A32A
          DUP#0=                                 * 6A32F
          OVER                                   * 6A334
          OBJ_66BAD                              * 6A339
          NOT                                    * 6A33E
          OR                                     * 6A343
          OVER                                   * 6A348
          OBJ_6EE65                              * 6A34D
          OR                                     * 6A352
          ?SKIP                                  * 6A357
          4PICK#+                                * 6A35C
          3PICK                                  * 6A361
          OVER#=                                 * 6A366
          IT                                     * 6A36B
          ::                                     * 6A370
            ROTDROP                              * 6A375
            OVERSWAP                             * 6A37A
          ;                                      * 6A37F
          OBJ_67C3C                              * 6A384
          LOOP                                   * 6A389
          SWAPDROP                               * 6A38E
          DUP                                    * 6A393
          14GETLAM                               * 6A398
          #1=?SKIP                               * 6A39D
          OBJ_69F92                              * 6A3A2
          15GETLAM                               * 6A3A7
          OVER                                   * 6A3AC
          OBJ_685B2                              * 6A3B1
          '                                      * 6A3B6
          ::                                     * 6A3BB
            4GETLAM                              * 6A3C0
            BINT1                                * 6A3C5
          ;                                      * 6A3CA
          '                                      * 6A3CF
          ::                                     * 6A3D4
            10GETLAM                             * 6A3D9
            BINT2                                * 6A3DE
          ;                                      * 6A3E3
          13GETLAM                               * 6A3E8
          OBJ_66BAD                              * 6A3ED
          IT                                     * 6A3F2
          SWAP                                   * 6A3F7
          ROTSWAP                                * 6A3FC
          OBJ_6A40B                              * 6A401
          SWAP                                   * 6A406

* refs (1): 6A401
OBJ_6A40B:
          ::                                     * 6A40B
            EVAL                                 * 6A410
            3UNROLL                              * 6A415
            1GETLAM                              * 6A41A
            BINT1                                * 6A41F
            OBJ_6A5AA                            * 6A424
            OBJ_6733B                            * 6A429
            2GETLAM                              * 6A42E
            OBJ_6A5AA                            * 6A433
            DROPSWAPDROP                         * 6A438
          ;                                      * 6A43D
          2DROP                                  * 6A442
        ;                                        * 6A447

* refs (1): 6A212
OBJ_6A44C:
        ::                                       * 6A44C
          12GETLAM                               * 6A451
          OBJ_681E8                              * 6A456
          DUP                                    * 6A45B
          BINT1                                  * 6A460
          7ROLL                                  * 6A465
          #1-                                    * 6A46A
          OBJ_6869D                              * 6A46F
          SUBHXS                                 * 6A474
          ROT                                    * 6A479
          &HXS                                   * 6A47E
          SWAP                                   * 6A483
          5ROLL                                  * 6A488
          #1-                                    * 6A48D
          OBJ_6869D                              * 6A492
          #1+                                    * 6A497
          MINUSONE                               * 6A49C
          SUBHXS                                 * 6A4A1
          &HXS                                   * 6A4A6
          OBJ_681B1                              * 6A4AB
          2DUP                                   * 6A4B0
          SWAP#-                                 * 6A4B5
          13PUTLAM                               * 6A4BA
          2DUP#=                                 * 6A4BF
          ITE                                    * 6A4C4
          2DROP                                  * 6A4C9
          ::                                     * 6A4CE
            2DUP#<                               * 6A4D3
            casedrop                             * 6A4D8
            ::                                   * 6A4DD
              OBJ_67519                          * 6A4E2
              2GETLAM                            * 6A4E7
              #1--                               * 6A4EC
              #+                                 * 6A4F1
              13GETLAM                           * 6A4F6
              OBJ_67616                          * 6A4FB
            ;                                    * 6A500
            #-                                   * 6A505
            OBJ_67519                            * 6A50A
            2GETLAM                              * 6A50F
            #-SWAP                               * 6A514
            ZERO_DO                              * 6A519
            DUP#1+                               * 6A51E
            ROLLDROP                             * 6A523
            OBJ_6C302                            * 6A528
            LOOP                                 * 6A52D
            DROP                                 * 6A532
          ;                                      * 6A537
          OBJ_67381                              * 6A53C
          13GETLAM                               * 6A541
          #+                                     * 6A546
          OBJ_6746B                              * 6A54B
          OBJ_67381                              * 6A550
          1GETLAM                                * 6A555
          #1--                                   * 6A55A
          SWAP                                   * 6A55F
          INNERCOMP                              * 6A564
          DUP#2+                                 * 6A569
          ROLL                                   * 6A56E
          OVER#+                                 * 6A573
          #1+                                    * 6A578
          OBJ_68183                              * 6A57D
          OBJ_6A769                              * 6A582
          NDROP                                  * 6A587
        ;                                        * 6A58C

* refs (1): 6A258
OBJ_6A591:
        ::                                       * 6A591
          ZEROZERO                               * 6A596
          ROT                                    * 6A59B
          5ROLL                                  * 6A5A0
          5ROLL                                  * 6A5A5

* refs (3): 6A424 6A433 6EDDE
OBJ_6A5AA:
          ::                                     * 6A5AA
            2DUP#=                               * 6A5AF
            case2DROP                            * 6A5B4
            DO                                   * 6A5B9
            INDEX@                               * 6A5BE
            13GETLAM                             * 6A5C3
            OBJ_6A663                            * 6A5C8
            LOOP                                 * 6A5CD
          ;                                      * 6A5D2
          3DROP                                  * 6A5D7

* refs (1): 6A249
OBJ_6A5DC:
          ::                                     * 6A5DC
            1GETLAM                              * 6A5E1
            11GETLAM                             * 6A5E6
            DUP                                  * 6A5EB
            6GETLAM                              * 6A5F0
            OBJ_6A61D                            * 6A5F5
            OBJ_67BD5                            * 6A5FA
            DUP                                  * 6A5FF
            5GETLAM                              * 6A604
            OBJ_6A61D                            * 6A609
            OBJ_67BE2                            * 6A60E
            DUP                                  * 6A613
            9GETLAM                              * 6A618

* refs (2): 6A5F5 6A609
OBJ_6A61D:
            ::                                   * 6A61D
              4PICKOVER                          * 6A622
              #<                                 * 6A627
              NOT?SEMI                           * 6A62C
              13GETLAM                           * 6A631
              #+                                 * 6A636
            ;                                    * 6A63B
            OBJ_67BC8                            * 6A640
            2DROP                                * 6A645
          ;                                      * 6A64A
          7GETLAM                                * 6A64F
          3GETLAM                                * 6A654
          OVER#+                                 * 6A659
        ;                                        * 6A65E

* refs (1): 6A5C8
OBJ_6A663:
        CON(5)  (*)+5                            * 6A663  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 6A668
        R1=A                                     * 6A66F
        D1=D1+  5                                * 6A672
        GOSBVL  POP#                             * 6A675
        R4=A                                     * 6A67C
        GOSBVL  POP#                             * 6A67F
        R3=A                                     * 6A686
        GOSBVL  POP#                             * 6A689
        ASRC                                     * 6A690
        D1=D1-  15                               * 6A693
        D1=D1-  5                                * 6A696
        GOSBVL  SUB_67A4A                        * 6A699
        D0=D0+  15                               * 6A6A0
        D0=D0+  12                               * 6A6A3
        P=      4                                * 6A6A6
L_6A6A8:
        GOSUB   SUB_6A6C0                        * 6A6A8
        P=P-1                                    * 6A6AC
        GONC    L_6A6A8                          * 6A6AE
        P=      0                                * 6A6B1
        D=D-1   A                                * 6A6B3
        D=D-1   A                                * 6A6B5
        D=D-1   A                                * 6A6B7
        GOVLNG  L_685CD                          * 6A6B9

* refs (1): 6A6A8
SUB_6A6C0:
        A=DAT0  X                                * 6A6C0
        C=R4                                     * 6A6C4
        GOSUB   SUB_6A6D4                        * 6A6C7
        DAT0=A  X                                * 6A6CB
        D0=D0+  3                                * 6A6CF
        RTN                                      * 6A6D2

* refs (1): 6A6C7
SUB_6A6D4:
        C=A     S                                * 6A6D4
        C=C-1   S                                * 6A6D7
        GOC     L_6A6F0                          * 6A6DA
        C=C-1   S                                * 6A6DD
        GOC     L_6A6F8                          * 6A6E0
        ?C>=A   X                                * 6A6E3
        RTNYES                                   * 6A6E6
        C=R1                                     * 6A6E8
L_6A6EB:
        A=A+C   X                                * 6A6EB
        RTN                                      * 6A6EE
L_6A6F0:
        ?A=0    X                                * 6A6F0
        RTNYES                                   * 6A6F3
        GONC    L_6A6EB                          * 6A6F5
L_6A6F8:
        ?C#A    X                                * 6A6F8
        RTNYES                                   * 6A6FB
        A=R3.F  X                                * 6A6FD
        RTN                                      * 6A703

* refs (1): 68FA3
OBJ_6A705:
        CON(5)  (*)+5                            * 6A705  primitive code object
        ST=1    1                                * 6A70A
L_6A70D:
        GOSBVL  POP#                             * 6A70D
        CD0EX                                    * 6A714
        R2=C                                     * 6A717
L_6A71A:
        R3=A                                     * 6A71A
        GOSBVL  SUB_67A3B                        * 6A71D
        D0=D0-  3                                * 6A724
        ?ST=0   1                                * 6A727
        GOYES   L_6A72F                          * 6A72A
        D0=D0-  3                                * 6A72C
L_6A72F:
        C=DAT0  X                                * 6A72F
        ?C=0    X                                * 6A733
        GOYES   L_6A753                          * 6A736
        A=R3                                     * 6A738
        ?ST=0   1                                * 6A73B
        GOYES   L_6A745                          * 6A73E
        ?C>A    X                                * 6A740
        GOYES   L_6A753                          * 6A743
L_6A745:
        ?C<A    X                                * 6A745
        GOYES   L_6A753                          * 6A748
        A=0     A                                * 6A74A
        A=C     X                                * 6A74C
        GOTO    L_6A71A                          * 6A74F
L_6A753:
        A=R3                                     * 6A753
        GOVLNG  L_67901                          * 6A756

* refs (1): 68F94
OBJ_6A75D:
        CON(5)  (*)+5                            * 6A75D  primitive code object
        ST=0    1                                * 6A762
        GOTO    L_6A70D                          * 6A765

* refs (1): 6A582
OBJ_6A769:
        CON(5)  (*)+5                            * 6A769  primitive code object
        GOSBVL  POP#                             * 6A76E
        R0=A                                     * 6A775
        GOSBVL  SAVPTR                           * 6A778
        GOSBVL  POP#                             * 6A77F
        A=A-1   A                                * 6A786
        GOC     L_6A7B9                          * 6A788
        C=A     A                                * 6A78B
        B=C     A                                * 6A78D
        A=A+A   A                                * 6A78F
        A=A+A   A                                * 6A791
        C=C+A   A                                * 6A793
        AD1EX                                    * 6A795
        C=C+A   A                                * 6A798
        D0=C                                     * 6A79A
        C=R0                                     * 6A79D
        A=A+C   A                                * 6A7A0
        D1=A                                     * 6A7A2
        D1=D1-  5                                * 6A7A5
L_6A7A8:
        A=DAT0  A                                * 6A7A8
        DAT1=A  A                                * 6A7AB
        D1=D1-  5                                * 6A7AE
        D0=D0-  5                                * 6A7B1
        B=B-1   A                                * 6A7B4
        GONC    L_6A7A8                          * 6A7B6
L_6A7B9:
        GOVLNG  GETPTRLOOP                       * 6A7B9
        RPL

* refs (1): 69C0A
OBJ_6A7C0:
        ::                                       * 6A7C0
          BINT4                                  * 6A7C5
          OVER#=                                 * 6A7CA
          case2drop                              * 6A7CF
          'DoBadKeyT                             * 6A7D4
          OVER                                   * 6A7D9
          BINT7                                  * 6A7DE
          #<                                     * 6A7E3
          case2drpfls                            * 6A7E8
          OVER                                   * 6A7ED
          BINT12                                 * 6A7F2
          #=case                                 * 6A7F7
          ::                                     * 6A7FC
            SWAPDROP                             * 6A801
            BINT1                                * 6A806
            ?CaseKeyDef                          * 6A80B
            ::                                   * 6A810
              TakeOver                           * 6A815
              DoNextRow                          * 6A81A
              DispMenu                           * 6A81F
            ;                                    * 6A824
            BINT2                                * 6A829
            ?CaseKeyDef                          * 6A82E
            ::                                   * 6A833
              TakeOver                           * 6A838
              DoPrevRow                          * 6A83D
              DispMenu                           * 6A842
            ;                                    * 6A847
            BINT3                                * 6A84C
            ?CaseKeyDef                          * 6A851
            ::                                   * 6A856
              TakeOver                           * 6A85B
              DoFirstRow                         * 6A860
              DispMenu                           * 6A865
            ;                                    * 6A86A
            DROPDEADTRUE                         * 6A86F
          ;                                      * 6A874
          BINT3                                  * 6A879
          #=casedrop                             * 6A87E
          ::                                     * 6A883
            OBJ_6FDD6                            * 6A888
            L_6B3F5                              * 6A88D
          ;                                      * 6A892
          BINT2                                  * 6A897
          #=case                                 * 6A89C
          ::                                     * 6A8A1
            OBJ_6FDD6                            * 6A8A6
            L_6B428                              * 6A8AB
          ;                                      * 6A8B0
          OBJ_6FDD6                              * 6A8B5
          OBJ_6B43F                              * 6A8BA
        ;                                        * 6A8BF

        ::                                       * 6A8C4
          TakeOver                               * 6A8C9
          WINDOWCORNER                           * 6A8CE
          OBJ_4CE83                              * 6A8D3
          TURNMENUON                             * 6A8D8
          WINDOWXY                               * 6A8DD
        ;                                        * 6A8E2

        ::                                       * 6A8E7
          EXITFCNsto                             * 6A8EC
          OBJ_6A8FB                              * 6A8F1
        ;                                        * 6A8F6

* refs (1): 6A8F1
OBJ_6A8FB:
        ::                                       * 6A8FB
          OBJ_69C3C                              * 6A900
          RECLAIMDISP                            * 6A905
          FALSE                                  * 6A90A
          ROMPTR  0EA 03C                        * 6A90F
          'KO                                    * 6A91A
          11GETLAM                               * 6A91F
          10GETLAM                               * 6A924

* refs (1): 6AB31
OBJ_6A929:
          ::                                     * 6A929
            DUPLEN$                              * 6A92E
            #1+                                  * 6A933
            NULL$                                * 6A938
          ;                                      * 6A93D
        ;                                        * 6A942

* refs (1): 6BA1A
OBJ_6A947:
        ::                                       * 6A947
          TakeOver                               * 6A94C
          HARDBUFF                               * 6A951
          TOTEMPOB                               * 6A956

* refs (7): 6ABAE 6ADA7 6AE24 6B129 6BAB5 6C4F1 ...
OBJ_6A95B:
          ::                                     * 6A95B
            OBJ_677EA                            * 6A960
            UNROLL                               * 6A965
          ;                                      * 6A96A

* refs (3): 6AE29 6BAD3 6D4F6
OBJ_6A96F:
          ::                                     * 6A96F
            BINT1                                * 6A974
            OBJ_67682                            * 6A979
            DROP                                 * 6A97E
          ;                                      * 6A983
          OBJ_6BABA                              * 6A988
        ;                                        * 6A98D

* refs (1): 461E1
OBJ_6A992:
        ::                                       * 6A992
          NoExitAction                           * 6A997
          {                                      * 6A99C
            {                                    * 6A9A1
              ::                                 * 6A9A6
                PTR     DirLabel:                * 6A9AB

RULES:
                $       "RULES"                  * 6A9B0
              ;                                  * 6A9C4
              OBJ_6AE9C                          * 6A9C9
            }                                    * 6A9CE
            {                                    * 6A9D3

EDIT:
              $       "EDIT"                     * 6A9D8
              OBJ_6AF3C                          * 6A9EA
            }                                    * 6A9EF
            {                                    * 6A9F4

EXPR:
              $       "EXPR"                     * 6A9F9
              OBJ_6AC3A                          * 6AA0B
            }                                    * 6AA10
            {                                    * 6AA15

SUB:
              $       "SUB"                      * 6AA1A
              OBJ_6ADFC                          * 6AA2A
            }                                    * 6AA2F
            {                                    * 6AA34

REPL:
              $       "REPL"                     * 6AA39
              OBJ_6AD66                          * 6AA4B
            }                                    * 6AA50
            {                                    * 6AA55
              $_EXIT                             * 6AA5A
              {                                  * 6AA5F
                OBJ_6AB5E                        * 6AA64
                OBJ_6AA82                        * 6AA69
              }                                  * 6AA6E
            }                                    * 6AA73
          }                                      * 6AA78
        ;                                        * 6AA7D

* refs (1): 6AA69
OBJ_6AA82:
        ::                                       * 6AA82
          TakeOver                               * 6AA87
          BINT1                                  * 6AA8C
          OBJ_67E39                              * 6AA91
          #1<>                                   * 6AA96
          caseDoBadKey                           * 6AA9B
          OBJ_67E0C                              * 6AAA0
          OBJ_679C5                              * 6AAA5
          DUP                                    * 6AAAA
          OBJ_67448                              * 6AAAF
          OBJ_679B3                              * 6AAB4

* refs (2): 6EA32 6F88D
OBJ_6AAB9:
          ::                                     * 6AAB9
            OBJ_68452                            * 6AABE
            OBJ_6B2AA                            * 6AAC3
            OBJ_44C3C                            * 6AAC8
          ;                                      * 6AACD
          ?SKIP                                  * 6AAD2
          OBJ_6D37F                              * 6AAD7
          OBJ_6C555                              * 6AADC
          BINT0                                  * 6AAE1
          OBJ_67426                              * 6AAE6
          CLEARVDISP                             * 6AAEB
          OBJ_6B79A                              * 6AAF0

* refs (1): 6AB72
OBJ_6AAF5:
          ::                                     * 6AAF5
            OBJ_25F4E                            * 6AAFA
            OBJ_6AF4B                            * 6AAFF
            SYMBN                                * 6AB04
            OBJ_6C2C1                            * 6AB09
          ;                                      * 6AB0E
          EXITFCNsto                             * 6AB13
          ::                                     * 6AB18
            toklparen                            * 6AB1D
            SWAP&$                               * 6AB22
            tokrparen                            * 6AB27
            &$                                   * 6AB2C
            OBJ_6A929                            * 6AB31
            OBJ_285EE                            * 6AB36

* refs (1): 6ABC7
OBJ_6AB3B:
            ::                                   * 6AB3B
              OBJ_0C4E3                          * 6AB40
              BINT34                             * 6AB45
              PUTLAM                             * 6AB4A
            ;                                    * 6AB4F
          ;                                      * 6AB54
        ;                                        * 6AB59

* refs (1): 6AA64
OBJ_6AB5E:
        ::                                       * 6AB5E
          TakeOver                               * 6AB63
          EXITFCNsto                             * 6AB68
          ::                                     * 6AB6D
            OBJ_6AAF5                            * 6AB72
            DUPLEN$                              * 6AB77
            OBJ_0C4E3                            * 6AB7C
            #1=                                  * 6AB81
            ITE                                  * 6AB86
            ::                                   * 6AB8B
              DROP                               * 6AB90
              ONESWAP                            * 6AB95
              NULL$                              * 6AB9A
              3UNROLL                            * 6AB9F
            ;                                    * 6ABA4
            OBJ_6E645                            * 6ABA9
            OBJ_6A95B                            * 6ABAE
            OBJ_6E7CB                            * 6ABB3
            DROPSWAPDROP                         * 6ABB8
            10PUTLAM                             * 6ABBD
            OBJ_6AE42                            * 6ABC2
            OBJ_6AB3B                            * 6ABC7
            FALSE                                * 6ABCC
            BINT30                               * 6ABD1
            PUTLAM                               * 6ABD6
            ERRSET                               * 6ABDB
            ::                                   * 6ABE0
              OBJ_6B5E2                          * 6ABE5
            ;                                    * 6ABEA
            ERRTRAP                              * 6ABEF
            ::                                   * 6ABF4
              OBJ_6AE6F                          * 6ABF9
              OBJ_6C302                          * 6ABFE
              ERRJMP                             * 6AC03
            ;                                    * 6AC08
            TRUE                                 * 6AC0D
            BINT30                               * 6AC12
            PUTLAM                               * 6AC17
            OBJ_6AE6F                            * 6AC1C
            OBJ_6C302                            * 6AC21
            OBJ_6BF8D                            * 6AC26
            OBJ_283F1                            * 6AC2B
          ;                                      * 6AC30
        ;                                        * 6AC35

* refs (1): 6AA0B
OBJ_6AC3A:
        ::                                       * 6AC3A
          TakeOver                               * 6AC3F
          'EL                                    * 6AC44
          case                                   * 6AC49
          ::                                     * 6AC4E
            OBJ_6B0CF                            * 6AC53
            OBJ_6ACF3                            * 6AC58
            OBJ_25C23                            * 6AC5D
          ;                                      * 6AC62

* refs (3): 69EE8 6AEAB 6AFD2
OBJ_6AC67:
          ::                                     * 6AC67
            'LB                                  * 6AC6C
            OBJ_67B17                            * 6AC71
            OBJ_6B381                            * 6AC76
          ;                                      * 6AC7B

* refs (4): 69EED 6AEB5 6F8A6 6FE9B
OBJ_6AC80:
          ::                                     * 6AC80
            OBJ_0C4E3                            * 6AC85
            SWAP#-                               * 6AC8A
            OBJ_6731D                            * 6AC8F
            #1-+                                 * 6AC94
            DUP#1+PICK                           * 6AC99
            DUP'                                 * 6AC9E
            xFCNAPPLY                            * 6ACA3
            EQ                                   * 6ACA8
            NOTcase                              * 6ACAD
            SWAPDROP                             * 6ACB2
            SWAP                                 * 6ACB7
            #3+PICK                              * 6ACBC
            DUPTYPEROMP?                         * 6ACC1
            NOTcaseDROP                          * 6ACC6
            SWAPDROP                             * 6ACCB
          ;                                      * 6ACD0
          OBJ_6AEF1                              * 6ACD5
          NOT?SEMI                               * 6ACDA
          OBJ_6F5B3                              * 6ACDF
          TRUE'                                  * 6ACE4
          'EL                                    * 6ACE9
          STO                                    * 6ACEE

* refs (2): 6AC58 6F5D6
OBJ_6ACF3:
          ::                                     * 6ACF3
            'LB                                  * 6ACF8
            OBJ_678DB                            * 6ACFD
            OBJ_67B12                            * 6AD02
            OBJ_6EE65                            * 6AD07
            IT                                   * 6AD0C
            OBJ_678DB                            * 6AD11
            OBJ_67AEF                            * 6AD16

* refs (1): 44DDB
OBJ_6AD1B:
            ::                                   * 6AD1B
              2DUP5ROLL                          * 6AD20
              OBJ_67ABC                          * 6AD25
              4PICK                              * 6AD2A
              ROT#+                              * 6AD2F
              3PICK                              * 6AD34
              ROT#+                              * 6AD39
              HARDBUFF                           * 6AD3E
              5UNROLL                            * 6AD43
            ;                                    * 6AD48
            SUBGROB                              * 6AD4D
            INVGROB                              * 6AD52
            XYGROBDISP                           * 6AD57
          ;                                      * 6AD5C
        ;                                        * 6AD61

* refs (1): 6AA4B
OBJ_6AD66:
        ::                                       * 6AD66
          TakeOver                               * 6AD6B
          OBJ_6C276                              * 6AD70
          OBJ_6C4A1                              * 6AD75
          OBJ_6B28C                              * 6AD7A
          NOTcasedrop                            * 6AD7F

* refs (2): 6ADCF 6C2DF
OBJ_6AD84:
          ::                                     * 6AD84
            #       202                          * 6AD89  514
            OBJ_6BC2D                            * 6AD93
          ;                                      * 6AD98
          OBJ_6AE6F                              * 6AD9D
          DROP                                   * 6ADA2
          OBJ_6A95B                              * 6ADA7
          OBJ_6AF46                              * 6ADAC
          OBJ_6B12E                              * 6ADB1
          case                                   * 6ADB6
          ::                                     * 6ADBB
            NDROP                                * 6ADC0
            NDROP                                * 6ADC5
            NDROP                                * 6ADCA
            OBJ_6AD84                            * 6ADCF
          ;                                      * 6ADD4
          NDROP                                  * 6ADD9
          OBJ_6AE6F                              * 6ADDE
          OBJ_6C2EE                              * 6ADE3
          EXPLODE                                * 6ADE8
          EXITFCNsto                             * 6ADED
          OBJ_69CCA                              * 6ADF2
        ;                                        * 6ADF7

* refs (1): 6AA2A
OBJ_6ADFC:
        ::                                       * 6ADFC
          TakeOver                               * 6AE01
          OBJ_6AF46                              * 6AE06
          OBJ_6AFF0                              * 6AE0B
          OVER#2+UNROL                           * 6AE10
          NDROP                                  * 6AE15
          OVER#2+UNROL                           * 6AE1A
          NDROP                                  * 6AE1F
          OBJ_6A95B                              * 6AE24
          OBJ_6A96F                              * 6AE29
          OBJ_113C2                              * 6AE2E
          #5+                                    * 6AE33
          OBJ_113D2                              * 6AE38
        ;                                        * 6AE3D

* refs (4): 6ABC2 6BB6D 6C258 6E861
OBJ_6AE42:
        ::                                       * 6AE42
          RECLAIMDISP                            * 6AE47
          OBJ_677DE                              * 6AE4C
          BINT23                                 * 6AE51
          GETLAM                                 * 6AE56
          10GETLAM                               * 6AE5B
          Lpop;true                              * 6AE60
          OBJ_6C550                              * 6AE65
          ERRSET                                 * 6AE6A

* refs (14): 69D43 69D48 69D4D 69D7F 69D89 69D98 ...
OBJ_6AE6F:
          ::                                     * 6AE6F
            OBJ_677EA                            * 6AE74
            #1+ROLL                              * 6AE79
          ;                                      * 6AE7E
          BINT23                                 * 6AE83
          PUTLAM                                 * 6AE88
          OBJ_6C302                              * 6AE8D
          OBJ_6B74F                              * 6AE92
        ;                                        * 6AE97

* refs (1): 6A9C9
OBJ_6AE9C:
        ::                                       * 6AE9C
          TakeOver                               * 6AEA1

* refs (3): 69DD4 69EC0 6A15E
OBJ_6AEA6:
          ::                                     * 6AEA6
            OBJ_6AC67                            * 6AEAB
            DUP                                  * 6AEB0
            OBJ_6AC80                            * 6AEB5
            DUP'                                 * 6AEBA
            xFCNAPPLY                            * 6AEBF
            EQITE                                * 6AEC4
            ::                                   * 6AEC9
              DROP                               * 6AECE
              OBJ_677EA                          * 6AED3
              SWAP#-                             * 6AED8
              #1+PICK                            * 6AEDD
            ;                                    * 6AEE2
            SWAPDROP                             * 6AEE7
            DUP                                  * 6AEEC

* refs (4): 69EF2 6ACD5 6BEB1 6EBEA
OBJ_6AEF1:
            ::                                   * 6AEF1
              OBJ_6E026                          * 6AEF6
              NOTcsdrpfls                        * 6AEFB
              OBJ_26BED                          * 6AF00
              NOTcsdrpfls                        * 6AF05
              3DROP                              * 6AF0A
              TRUE                               * 6AF0F
            ;                                    * 6AF14
            NOTcasedrop                          * 6AF19
            {MenuRules}                          * 6AF1E
            OBJ_3F1E3                            * 6AF23
          ;                                      * 6AF28
          InitMenu                               * 6AF2D
          DispMenu                               * 6AF32
        ;                                        * 6AF37

* refs (1): 6A9EA
OBJ_6AF3C:
        ::                                       * 6AF3C
          TakeOver                               * 6AF41

* refs (3): 69DED 6ADAC 6AE06
OBJ_6AF46:
          ::                                     * 6AF46

* refs (1): 6AAFF
OBJ_6AF4B:
            ::                                   * 6AF4B
              OBJ_677EA                          * 6AF50
              OBJ_0C4E3                          * 6AF55
              ZERO_DO                            * 6AF5A
              DUPPICK                            * 6AF5F
              SWAP                               * 6AF64
              LOOP                               * 6AF69
              DROP                               * 6AF6E
              OBJ_0C4E3                          * 6AF73
            ;                                    * 6AF78
            DUP#2+                               * 6AF7D
            BINT2                                * 6AF82
            DO                                   * 6AF87
            INDEX@                               * 6AF8C
            PICK                                 * 6AF91
            '                                    * 6AF96
            xPREDIV                              * 6AF9B
            EQIT                                 * 6AFA0
            ::                                   * 6AFA5
              INDEX@                             * 6AFAA
              ROLL                               * 6AFAF
              INDEX@                             * 6AFB4
              OBJ_2804D                          * 6AFB9
              UNROLL                             * 6AFBE
            ;                                    * 6AFC3
            LOOP                                 * 6AFC8
            DUP                                  * 6AFCD
            OBJ_6AC67                            * 6AFD2
            #1--                                 * 6AFD7
            tailpsh                              * 6AFDC
            pZpargSWAPUn                         * 6AFE1
          ;                                      * 6AFE6
          dup                                    * 6AFEB

* refs (4): 6AE0B 6B5A6 6C1F4 84E13
OBJ_6AFF0:
          ::                                     * 6AFF0
            DUP#0=csedrp                         * 6AFF5
            NULLSYMB                             * 6AFFA
            pshzer                               * 6AFFF
            BEGIN                                * 6B004
            pullrev                              * 6B009
            psh1&rev                             * 6B00E
            psh                                  * 6B013
            OBJ_27FEE                            * 6B018
            psh                                  * 6B01D
            DUP#0=                               * 6B022
            UNTIL                                * 6B027
            DROP                                 * 6B02C
            IMPLODE                              * 6B031
          ;                                      * 6B036
          OBJ_6CC10                              * 6B03B
          OBJ_6CC32                              * 6B040
          SWAP                                   * 6B045
          EDITDECOMP$                            * 6B04A
          SWAP                                   * 6B04F
          IT                                     * 6B054
          OBJ_6CC21                              * 6B059
          OBJ_6B31D                              * 6B05E
          DUP                                    * 6B063
          ROMPTR  0EA 03C                        * 6B068
          'unbound                               * 6B073
          OBJ_6CC10                              * 6B078
          OBJ_6CC32                              * 6B07D
          SWAP                                   * 6B082
          OBJ_6B200                              * 6B087
          NOTcase                                * 6B08C
          OBJ_6B0A5                              * 6B091
          'unbound                               * 6B096
          EQUAL                                  * 6B09B
          casedrop                               * 6B0A0

* refs (2): 6B091 6B192
OBJ_6B0A5:
          ::                                     * 6B0A5
            ZEROZERO                             * 6B0AA
            ROMPTR  0EA 03C                      * 6B0AF
            'TE                                  * 6B0BA
            ROMPTR  0EA 03C                      * 6B0BF
            'LE                                  * 6B0CA

* refs (2): 6AC53 6F5D1
OBJ_6B0CF:
            ::                                   * 6B0CF
              FALSE'                             * 6B0D4
              'EL                                * 6B0D9
              STO                                * 6B0DE
            ;                                    * 6B0E3

* refs (3): 69CCF 69EB6 6A104
OBJ_6B0E8:
            ::                                   * 6B0E8
              top&                               * 6B0ED
              psh                                * 6B0F2
              DUP#1+                             * 6B0F7
              OBJ_67448                          * 6B0FC
              top&                               * 6B101
            ;                                    * 6B106
            NDROP                                * 6B10B
            OBJ_67CBE                            * 6B110
            OBJ_666D3                            * 6B115
            OBJ_67CBE                            * 6B11A
            OBJ_25C23                            * 6B11F
          ;                                      * 6B124
          OBJ_6A95B                              * 6B129

* refs (1): 6ADB1
OBJ_6B12E:
          ::                                     * 6B12E
            DUP#2+PICK                           * 6B133
            OVER#+                               * 6B138
            #3+                                  * 6B13D
            DUP#1+PICK                           * 6B142
            DUP#0=csedrp                         * 6B147
            DROPFALSE                            * 6B14C
            #+                                   * 6B151
            #1+                                  * 6B156
            OBJ_5F5AD                            * 6B15B
            NOTcaseFALSE                         * 6B160
            OBJ_6C4A1                            * 6B165
            dup;#nm?                             * 6B16A
            SWAPDROP                             * 6B16F
          ;                                      * 6B174
          OBJ_6AE6F                              * 6B179
          SWAP                                   * 6B17E
          casedrop                               * 6B183

* refs (1): 6B1EC
OBJ_6B188:
          ::                                     * 6B188
            DoBadKey                             * 6B18D
            OBJ_6B0A5                            * 6B192
          ;                                      * 6B197
          OVER#2+UNROL                           * 6B19C
          NDROP                                  * 6B1A1
          OVER#0=                                * 6B1A6
          4PICK                                  * 6B1AB
          #0=                                    * 6B1B0
          AND                                    * 6B1B5
          SWAP                                   * 6B1BA
          EXPLODE                                * 6B1BF
          OVER                                   * 6B1C4
          OBJ_6B2AA                              * 6B1C9
          x=                                     * 6B1CE
          OVER                                   * 6B1D3
          #3+                                    * 6B1D8
          ROLL                                   * 6B1DD
          NOTAND                                 * 6B1E2
          case                                   * 6B1E7
          OBJ_6B188                              * 6B1EC
          EXITFCNsto                             * 6B1F1
          OBJ_69CCA                              * 6B1F6
        ;                                        * 6B1FB

* refs (2): 6B087 6C20D
OBJ_6B200:
        ::                                       * 6B200
          tok'                                   * 6B205
          SWAP&$                                 * 6B20A
          tok'                                   * 6B20F
          &$                                     * 6B214
          RECLAIMDISP                            * 6B219
          NULL$SWAP                              * 6B21E
          DUPLEN$                                * 6B223
          BINT0                                  * 6B228
          BINT2                                  * 6B22D
          BINT0                                  * 6B232
          EditMenu                               * 6B237
          BINT1                                  * 6B23C
          TRUE                                   * 6B241
          BINT1                                  * 6B246
          InputLine                              * 6B24B
          DispMenu                               * 6B250
          ClrDA1IsStat                           * 6B255
          DOCLLCD                                * 6B25A
          NOTcase                                * 6B25F
          ::                                     * 6B264
            IT                                   * 6B269
            OBJ_6CC21                            * 6B26E
            FALSE                                * 6B273
          ;                                      * 6B278
          ROT                                    * 6B27D
          IT                                     * 6B282
          OBJ_6CC21                              * 6B287

* refs (2): 6AD7A 84E4A
OBJ_6B28C:
          ::                                     * 6B28C
            DUPTYPECOL?                          * 6B291
            IT                                   * 6B296
            ::                                   * 6B29B
              DUP                                * 6B2A0
              CARCOMP                            * 6B2A5

* refs (5): 6AAC3 6B1C9 6C3F7 6D1D1 6E37F
OBJ_6B2AA:
              ::                                 * 6B2AA
                'R                               * 6B2AF
                EQ                               * 6B2B4
              ;                                  * 6B2B9
              x'                                 * 6B2BE
              NOT?SEMI                           * 6B2C3
              DUPTWO                             * 6B2C8
              NTHELCOMP                          * 6B2CD
              NOT?SEMI                           * 6B2D2
              SWAPDROP                           * 6B2D7
            ;                                    * 6B2DC
            ?OKINALG                             * 6B2E1
            NOTcaseFALSE                         * 6B2E6
            OBJ_26BED                            * 6B2EB
            NOTcaseTRUE                          * 6B2F0
            2DROPFALSE                           * 6B2F5
          ;                                      * 6B2FA
          NOTcase2drop                           * 6B2FF
          ::                                     * 6B304
            DoBadKey                             * 6B309
            FALSE                                * 6B30E
          ;                                      * 6B313
          SWAP                                   * 6B318

* refs (2): 6B05E 6C2CB
OBJ_6B31D:
          ::                                     * 6B31D
            DUP                                  * 6B322
            CAR$                                 * 6B327
            OBJ_6BCA5                            * 6B32C
            EQUAL                                * 6B331
            IT                                   * 6B336
            CDR$                                 * 6B33B
            DUP                                  * 6B340
            DUPLEN$                              * 6B345
            SUB$1#                               * 6B34A
            BINT39                               * 6B34F
            OBJ_6E433                            * 6B354

* refs (3): 16DEA 6C244 6E5F0
OBJ_6B359:
            ::                                   * 6B359
              DUPLEN$                            * 6B35E
              #1-1SWAP                           * 6B363
              SUB$                               * 6B368
            ;                                    * 6B36D
          ;                                      * 6B372
          TRUE                                   * 6B377
        ;                                        * 6B37C

* refs (3): 6AC76 6F8A1 6FE96
OBJ_6B381:
        CON(5)  (*)+5                            * 6B381  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 6B386
        LC(5)   #7FFFF                           * 6B38D
        A=A&C   A                                * 6B394
        GOVLNG  L_67907                          * 6B398

* refs (4): 69DC5 69F7E 6A13B 6F8EC
OBJ_6B39F:
        CON(5)  (*)+5                            * 6B39F  primitive code object
        GOSBVL  POP#                             * 6B3A4
        R3=A                                     * 6B3AB
        A=0     A                                * 6B3AE
        A=A+1   A                                * 6B3B0
        GOSBVL  SUB_67A51                        * 6B3B2
        A=R3                                     * 6B3B9
        C=0     A                                * 6B3BC
        BCEX    A                                * 6B3BE
        RSTK=C                                   * 6B3C0
        C=0     W                                * 6B3C2
L_6B3C5:
        B=B+1   A                                * 6B3C5
        D0=D0+  15                               * 6B3C7
        D0=D0+  9                                * 6B3CA
        C=DAT0  X                                * 6B3CD
        C=C+C   X                                * 6B3D1
        GONC    L_6B3DF                          * 6B3D4
        CSRB                                     * 6B3D7
        ?C=A    X                                * 6B3DA
        GOYES   L_6B3E8                          * 6B3DD
L_6B3DF:
        D0=D0+  15                               * 6B3DF
        D0=D0+  3                                * 6B3E2
        GONC    L_6B3C5                          * 6B3E5
L_6B3E8:
        A=B     A                                * 6B3E8
        C=RSTK                                   * 6B3EA
        B=C     A                                * 6B3EC
        GOVLNG  L_67901                          * 6B3EE
L_6B3F5:
        NIBHEX  70B0E19F601699F611009F6214B9F632 * 6B3F5  ...ù.aτo..ù&AΔo#
        NIBHEX  557B38230AD3D2EC9A3              * 6B415  U·√2.=-Î©
L_6B428:
        NIBHEX  30014C8A63230AD382E87B3          * 6B428  ..Ä¨62.=(←·

* refs (1): 6A8BA
OBJ_6B43F:
        CON(5)  L_30B0B                          * 6B43F  code object: the address of its machine code
        NIBHEX  74B401194B411FA4B421DC4B4E0749A6 * 6B444  GK.γ´.ñJK.Í´äpηj
        NIBHEX  917E8A6A1A3CA632557B382E87B3C2DC * 6B464  .ç¨¦¡Ãj#U·√âx;,Í
        NIBHEX  164D2E68B4                       * 6B484  aÔâ▶K
        RPL

* refs (2): 3D8AD D755C
OBJ_6B48E:
        ::                                       * 6B48E
          CK0NOLASTWD                            * 6B493
          POLSaveUI                              * 6B498
          ERRSET                                 * 6B49D
          ::                                     * 6B4A2
            CLEARVDISP                           * 6B4A7
            NULL$                                * 6B4AC
            TRUE                                 * 6B4B1
            OBJ_6C550                            * 6B4B6
            ERRSET                               * 6B4BB
            ::                                   * 6B4C0
              OBJ_6CC21                          * 6B4C5
              REDISPHBUFF                        * 6B4CA
              OBJ_6B5E2                          * 6B4CF
            ;                                    * 6B4D4
            ERRTRAP                              * 6B4D9
            OBJ_6C8C3                            * 6B4DE
            OBJ_6B59C                            * 6B4E3
            DROP                                 * 6B4E8
          ;                                      * 6B4ED
          ERRTRAP                                * 6B4F2
          POLResUI&Err                           * 6B4F7
          POLRestoreUI                           * 6B4FC
        ;                                        * 6B501

* refs (2): 42DD7 42DE1
OBJ_6B506:
        ::                                       * 6B506
          CK1NOLASTWD                            * 6B50B
          POLSaveUI                              * 6B510
          ERRSET                                 * 6B515
          ::                                     * 6B51A
            TRUE                                 * 6B51F
            OBJ_6C483                            * 6B524
            ERRSET                               * 6B529
            ::                                   * 6B52E
              OBJ_6C4BA                          * 6B533
              OBJ_6C302                          * 6B538
              OBJ_6BBFE                          * 6B53D
              DROP                               * 6B542
              OBJ_4CE83                          * 6B547
              OBJ_6C3D9                          * 6B54C
              BINT30                             * 6B551
              GETLAM                             * 6B556
              IT                                 * 6B55B
              OBJ_6B5E2                          * 6B560
            ;                                    * 6B565
            ERRTRAP                              * 6B56A
            ::                                   * 6B56F
              RDROP                              * 6B574
              OBJ_6C8CD                          * 6B579
              ERROR@                             * 6B57E
              #0=                                * 6B583
              caseFALSE                          * 6B588
              GOTO                               * 6B58D
              L_6C927                            * 6B592
            ;                                    * 6B597

* refs (1): 6B4E3
OBJ_6B59C:
            ::                                   * 6B59C
              OBJ_6C1C2                          * 6B5A1
              OBJ_6AFF0                          * 6B5A6
              SWAP                               * 6B5AB
              OBJ_6C8CD                          * 6B5B0
              ExitFcn                            * 6B5B5
              EVAL                               * 6B5BA
              TRUE                               * 6B5BF
            ;                                    * 6B5C4
          ;                                      * 6B5C9
          ERRTRAP                                * 6B5CE
          POLResUI&Err                           * 6B5D3
          POLRestoreUI                           * 6B5D8
        ;                                        * 6B5DD

* refs (6): 6ABE5 6B4CF 6B560 6B790 6B8AD 6B9E8
OBJ_6B5E2:
        ::                                       * 6B5E2
          RDROP                                  * 6B5E7
          ?ATTNQUIT                              * 6B5EC
          OBJ_6B9BB                              * 6B5F1

* refs (1): 6C023
OBJ_6B5F6:
          ::                                     * 6B5F6
            OBJ_283F1                            * 6B5FB
            DROP                                 * 6B600
            GetNextToken                         * 6B605
            nultrior                             * 6B60A
            ::                                   * 6B60F
              2DROP                              * 6B614
              SWAPDROP                           * 6B619
              DUPLEN$                            * 6B61E
              #1+                                * 6B623
              FALSE                              * 6B628
            ;                                    * 6B62D
            OBJ_250EF                            * 6B632
            ::                                   * 6B637
              4ROLLDROP                          * 6B63C
              TRUE                               * 6B641
            ;                                    * 6B646
            4ROLLDROP                            * 6B64B
            3PICK                                * 6B650
            LEN$                                 * 6B655
            3PICKSWAP                            * 6B65A
            #>                                   * 6B65F
            NOTcaseTRUE                          * 6B664
            LEN$                                 * 6B669
            #-                                   * 6B66E
            FALSE                                * 6B673
          ;                                      * 6B678
          case                                   * 6B67D
          OBJ_6B853                              * 6B682
          2DROP                                  * 6B687
          OBJ_6CAA8                              * 6B68C
          case                                   * 6B691
          ::                                     * 6B696
            OBJ_6CB3E                            * 6B69B
            ?SKIP                                * 6B6A0
            OBJ_6C954                            * 6B6A5
            OBJ_6B9A2                            * 6B6AA
          ;                                      * 6B6AF
          OBJ_69147                              * 6B6B4
          ::                                     * 6B6B9
            OBJ_6CB39                            * 6B6BE
            OBJ_6B9A2                            * 6B6C3
          ;                                      * 6B6C8
          BINT35                                 * 6B6CD
          GETLAM                                 * 6B6D2
          ::                                     * 6B6D7
            palparse                             * 6B6DC
            NOTcase2drop                         * 6B6E1
            DROPFALSE                            * 6B6E6
            ::                                   * 6B6EB
              DUPTYPEREAL?                       * 6B6F0
              SWAP                               * 6B6F5
              TYPEIDNT?                          * 6B6FA
              OR                                 * 6B6FF
            ;                                    * 6B704
          ;                                      * 6B709
          5GETLAM                                * 6B70E

* refs (1): 6EFAF
OBJ_6B713:
          ::                                     * 6B713
            ?OKINALG                             * 6B718
            NOTcsdrpfls                          * 6B71D
            OBJ_26BED                            * 6B722
            NOTcsdrpfls                          * 6B727
            SWAPDROP                             * 6B72C
            #1=                                  * 6B731
            NOTcsdrpfls                          * 6B736
            OBJ_6E2E9                            * 6B73B
          ;                                      * 6B740
          NOTAND                                 * 6B745
          IT                                     * 6B74A

* refs (3): 6AE92 6BF79 6C271
OBJ_6B74F:
          ::                                     * 6B74F
            TRUE                                 * 6B754
            BINT32                               * 6B759
            PUTLAM                               * 6B75E
          ;                                      * 6B763
          tok*                                   * 6B768
          OBJ_6CAD0                              * 6B76D
          &$                                     * 6B772
          10GETLAM                               * 6B777
          9GETLAM                                * 6B77C
          1_#1-SUB$                              * 6B781
          SWAP&$                                 * 6B786
          10PUTLAM                               * 6B78B
          OBJ_6B5E2                              * 6B790
        ;                                        * 6B795

* refs (6): 6AAF0 6B989 6BFD8 6C3D4 6E76C 6E794
OBJ_6B79A:
        ::                                       * 6B79A
          TRUE                                   * 6B79F
          17PUTLAM                               * 6B7A4
          FALSE                                  * 6B7A9
          19PUTLAM                               * 6B7AE
          OBJ_666D3                              * 6B7B3
          OBJ_67416                              * 6B7B8
          OBJ_67AEF                              * 6B7BD
          3PICK                                  * 6B7C2
          OBJ_679D7                              * 6B7C7
          #0=ITE                                 * 6B7CC
          ::                                     * 6B7D1
            ROT                                  * 6B7D6
            OBJ_67C6C                            * 6B7DB
            OBJ_6F42D                            * 6B7E0
            EQcasedrop                           * 6B7E5
            SWAP                                 * 6B7EA
            GROBDIMw                             * 6B7EF
            ROT#+                                * 6B7F4
          ;                                      * 6B7F9
          ::                                     * 6B7FE
            3PICK                                * 6B803
            OBJ_67AE2                            * 6B808
            #+                                   * 6B80D
            OBJ_6E057                            * 6B812
            #2/                                  * 6B817
            #-                                   * 6B81C
            SWAPROT                              * 6B821
            OBJ_67A9D                            * 6B826
            #+                                   * 6B82B
          ;                                      * 6B830
          2DUP                                   * 6B835
          14PUTLAM                               * 6B83A
          15PUTLAM                               * 6B83F
          12PUTLAM                               * 6B844
          13PUTLAM                               * 6B849
        ;                                        * 6B84E

* refs (1): 6B682
OBJ_6B853:
        ::                                       * 6B853
          DUP                                    * 6B858
          BINT35                                 * 6B85D
          PUTLAM                                 * 6B862
          ROTDROP                                * 6B867
          8PUTLAM                                * 6B86C
          9PUTLAM                                * 6B871
          BINT32                                 * 6B876
          GETLAM                                 * 6B87B
          ?SKIP                                  * 6B880
          OBJ_6C041                              * 6B885
          OBJ_686C0                              * 6B88A
          ITE                                    * 6B88F

* refs (1): 6C1B8
OBJ_6B894:
          ::                                     * 6B894
            OBJ_6B939                            * 6B899
            OBJ_6BFAB                            * 6B89E
          ;                                      * 6B8A3
          OBJ_6B8B7                              * 6B8A8
          OBJ_6B5E2                              * 6B8AD
        ;                                        * 6B8B2

* refs (3): 6B8A8 6BBF4 6C14F
OBJ_6B8B7:
        ::                                       * 6B8B7
          OBJ_6821C                              * 6B8BC
          DUP                                    * 6B8C1
          CARCOMP                                * 6B8C6
          OBJ_6C04B                              * 6B8CB
          EQUAL                                  * 6B8D0
          IT                                     * 6B8D5
          CDRCOMP                                * 6B8DA
          OBJ_681D8                              * 6B8DF
          8GETLAM                                * 6B8E4
          NEWLINE$&$                             * 6B8E9
          #SyntaxErr                             * 6B8EE
          JstGetTHEMESG                          * 6B8F3
          &$                                     * 6B8F8
          DoBadKey                               * 6B8FD
          FlashMsg                               * 6B902
          OBJ_283F1                              * 6B907
          LEN$                                   * 6B90C
          #-                                     * 6B911
          DUPUNROT                               * 6B916
          #1-                                    * 6B91B
          ONESWAP                                * 6B920
          SUB$SWAP                               * 6B925
          NULL$                                  * 6B92A
          OBJ_2840F                              * 6B92F

* refs (6): 6BA10 6BA51 6BAAB 6BC46 6C267 6C35C
OBJ_6B934:
          ::                                     * 6B934

* refs (5): 6B899 6BFA6 6BFF1 6C3CF 6E5FF
OBJ_6B939:
            ::                                   * 6B939
              OBJ_6C361                          * 6B93E
              HARDBUFF                           * 6B943
              14GETLAM                           * 6B948
              15GETLAM                           * 6B94D
              BINT28                             * 6B952
              GETLAM                             * 6B957
              3PICK#+                            * 6B95C
              OBJ_49158                          * 6B961
              3PICK#+                            * 6B966
              GROB!ZERODRP                       * 6B96B
              ZEROZERO                           * 6B970
              BINT28                             * 6B975
              PUTLAM                             * 6B97A
              OBJ_496F0                          * 6B97F
            ;                                    * 6B984
            OBJ_6B79A                            * 6B989
            OBJ_6CB25                            * 6B98E
            OBJ_6CB39                            * 6B993
          ;                                      * 6B998
        ;                                        * 6B99D

* refs (2): 6B6AA 6B6C3
OBJ_6B9A2:
        ::                                       * 6B9A2
          RDROP                                  * 6B9A7
          BINT30                                 * 6B9AC
          GETLAM                                 * 6B9B1
          NOT?SEMI                               * 6B9B6

* refs (1): 6B5F1
OBJ_6B9BB:
          ::                                     * 6B9BB
            19GETLAM                             * 6B9C0
            NOT?SEMI                             * 6B9C5
            OBJ_6CB3E                            * 6B9CA
            ?SEMI                                * 6B9CF
            OBJ_6BFAB                            * 6B9D4
          ;                                      * 6B9D9
          GetKeyOb                               * 6B9DE
          OBJ_6BDF3                              * 6B9E3
          OBJ_6B5E2                              * 6B9E8
        ;                                        * 6B9ED

* refs (1): 6BF01
OBJ_6B9F2:
        {                                        * 6B9F2
          ROMP_0A2_00F                           * 6B9F7
          OBJ_6C32A                              * 6B9FC
          ROMP_0A1_00D                           * 6BA01
          ::                                     * 6BA06
            TakeOver                             * 6BA0B
            OBJ_6B934                            * 6BA10
            OBJ_6C361                            * 6BA15
            OBJ_6A947                            * 6BA1A
            OBJ_6C954                            * 6BA1F
          ;                                      * 6BA24
          DoCAlarmKey                            * 6BA29
          DoCAlarmKey                            * 6BA2E
          NOP                                    * 6BA33
          NOP                                    * 6BA38
          ROMP_0A1_02C                           * 6BA3D
          ABORT                                  * 6BA42
          ROMP_0A2_030                           * 6BA47
          ::                                     * 6BA4C
            OBJ_6B934                            * 6BA51
            OBJ_6CC10                            * 6BA56
            ITE                                  * 6BA5B
            ::                                   * 6BA60
              OBJ_6CC32                          * 6BA65
              #       207                        * 6BA6A  519
            ;                                    * 6BA74
            ::                                   * 6BA79
              OBJ_6CC21                          * 6BA7E
              #       208                        * 6BA83  520
            ;                                    * 6BA8D
            JstGetTHEMESG                        * 6BA92
            FlashMsg                             * 6BA97
          ;                                      * 6BA9C
          ROMP_0A3_02B                           * 6BAA1
          ::                                     * 6BAA6
            OBJ_6B934                            * 6BAAB
            10GETLAM                             * 6BAB0
            OBJ_6A95B                            * 6BAB5

* refs (1): 6A988
OBJ_6BABA:
            ::                                   * 6BABA
              OBJ_113C2                          * 6BABF
              #5+                                * 6BAC4
              OBJ_113D2                          * 6BAC9
            ;                                    * 6BACE
            OBJ_6A96F                            * 6BAD3
          ;                                      * 6BAD8
          ROMP_0A1_00A                           * 6BADD
          ::                                     * 6BAE2
            $       " RATIO "                    * 6BAE7
            OBJ_6BF8D                            * 6BAFF
          ;                                      * 6BB04
          ROMP_0A1_00F                           * 6BB09
          OBJ_6C3AC                              * 6BB0E
          ROMP_0A1_010                           * 6BB13
          OBJ_6BF6F                              * 6BB18
          ROMP_0A1_011                           * 6BB1D
          OBJ_6BF6F                              * 6BB22
          ROMP_0A3_010                           * 6BB27
          OBJ_6BFEC                              * 6BB2C
          ROMP_0A3_011                           * 6BB31
          OBJ_6BFEC                              * 6BB36
          ROMP_0A2_019                           * 6BB3B
          OBJ_6C186                              * 6BB40
          ROMP_0A1_01C                           * 6BB45
          OBJ_6E5D2                              * 6BB4A
          ROMP_0A3_00D                           * 6BB4F
          OBJ_6C262                              * 6BB54
          ROMP_0A2_01B                           * 6BB59
          ::                                     * 6BB5E
            NULL$                                * 6BB63
            10PUTLAM                             * 6BB68
            OBJ_6AE42                            * 6BB6D
          ;                                      * 6BB72
          ROMP_0A1_018                           * 6BB77
          ::                                     * 6BB7C
            OBJ_6BBCC                            * 6BB81
          ;                                      * 6BB86
          EVAL_3B427                             * 6BB8B
          ::                                     * 6BB90
            EXITFCNsto                           * 6BB95
            xEVAL                                * 6BB9A
            OBJ_6BBCC                            * 6BB9F
          ;                                      * 6BBA4
          ROMP_0A2_00E                           * 6BBA9
          ::                                     * 6BBAE
            EXITFCNsto                           * 6BBB3
            x>NUM                                * 6BBB8
            OBJ_6BBCC                            * 6BBBD
          ;                                      * 6BBC2
        }                                        * 6BBC7

* refs (3): 6BB81 6BB9F 6BBBD
OBJ_6BBCC:
        ::                                       * 6BBCC
          RDROP                                  * 6BBD1

* refs (1): 6C1A4
OBJ_6BBD6:
          #       206                            * 6BBD6  518
          OBJ_6BFFB                              * 6BBE0
          NOTcasedrop                            * 6BBE5
          ::                                     * 6BBEA
            OBJ_69C3C                            * 6BBEF
            OBJ_6B8B7                            * 6BBF4
          ;                                      * 6BBF9

* refs (3): 6B53D 6C195 8D3FA
OBJ_6BBFE:
          ::                                     * 6BBFE

* refs (1): 68738
OBJ_6BC03:
            CHR     "\08"                        * 6BC03
            7PUTLAM                              * 6BC0A
            OBJ_686C0                            * 6BC0F
            BINT0                                * 6BC14
            7PUTLAM                              * 6BC19
          ;                                      * 6BC1E
          case                                   * 6BC23
          drop;q_58A0C                           * 6BC28

* refs (7): 49C9F 4ED07 4ED2F 50E3B 6AD93 6C1A9 ...
OBJ_6BC2D:
          ::                                     * 6BC2D
            JstGetTHEMESG                        * 6BC32
            DoBadKey                             * 6BC37
            FlashMsg                             * 6BC3C
          ;                                      * 6BC41
          OBJ_6B934                              * 6BC46
          OBJ_69C3C                              * 6BC4B
        ;                                        * 6BC50

* refs (7): 69A09 6BCC7 6BCD1 6BD21 6BD2B 6BD6C ...
OBJ_6BC55:
        ::                                       * 6BC55
          BINT51                                 * 6BC5A
          SysITE                                 * 6BC5F
          CHR_;                                  * 6BC64
          CHR_,                                  * 6BC69
        ;                                        * 6BC6E

* refs (2): 6BCDB 6BCE5
OBJ_6BC73:
        ::                                       * 6BC73
          BINT51                                 * 6BC78
          SysITE                                 * 6BC7D
          CHR_,                                  * 6BC82
          CHR_.                                  * 6BC87
        ;                                        * 6BC8C

* refs (2): 68CE7 6BD03
OBJ_6BC91:
        ::                                       * 6BC91
          '                                      * 6BC96
          xFORMUNIT                              * 6BC9B
        ;                                        * 6BCA0

* refs (2): 6B32C 6BD44
OBJ_6BCA5:
        CHR     "'"                              * 6BCA5

* refs (1): 6BD5D
OBJ_6BCAC:
        CHR     "@"                              * 6BCAC

* refs (1): 6BDF8
OBJ_6BCB3:
        {                                        * 6BCB3
          ROMP_0A3_007                           * 6BCB8
          OBJ_6CC43                              * 6BCBD
          ROMP_0A5_02E                           * 6BCC2
          OBJ_6BC55                              * 6BCC7
          ROMP_0A2_02E                           * 6BCCC
          OBJ_6BC55                              * 6BCD1
          ROMP_0A4_02E                           * 6BCD6
          OBJ_6BC73                              * 6BCDB
          ROMP_0A1_02E                           * 6BCE0
          OBJ_6BC73                              * 6BCE5
          ROMP_0A5_021                           * 6BCEA
          toklparen                              * 6BCEF
          ROMP_0A2_021                           * 6BCF4
          toklparen                              * 6BCF9
          ROMP_0A3_026                           * 6BCFE
          OBJ_6BC91                              * 6BD03
          ROMP_0A1_01A                           * 6BD08
          CHR_E                                  * 6BD0D
          ROMP_0A1_019                           * 6BD12
          CHR_-                                  * 6BD17
          ROMP_0A4_02F                           * 6BD1C
          OBJ_6BC55                              * 6BD21
          ROMP_0A1_02F                           * 6BD26
          OBJ_6BC55                              * 6BD2B
          K__ë_                                  * 6BD30
          BINT0                                  * 6BD35
        }                                        * 6BD3A

* refs (1): 6BE61
OBJ_6BD3F:
        {                                        * 6BD3F
          OBJ_6BCA5                              * 6BD44
          ::                                     * 6BD49
            '                                    * 6BD4E
            ROMP_0A1_00C                         * 6BD53
          ;                                      * 6BD58
          OBJ_6BCAC                              * 6BD5D
          BINT0                                  * 6BD62
          CHR_Space                              * 6BD67
          OBJ_6BC55                              * 6BD6C
        }                                        * 6BD71

* refs (1): 6BE52
OBJ_6BD76:
        ::                                       * 6BD76
          OBJ_3EFC8                              * 6BD7B
          case                                   * 6BD80
          OBJ_6BF38                              * 6BD85
          INCOMPDROP                             * 6BD8A
          ROTDROPSWAP                            * 6BD8F
          GETPROC                                * 6BD94
          DUPUNROT                               * 6BD99
          TYPELIST?                              * 6BD9E
          NOTcasedrop                            * 6BDA3
          ::                                     * 6BDA8
            COLA                                 * 6BDAD
            OBJ_6BDF3                            * 6BDB2
          ;                                      * 6BDB7
          ::                                     * 6BDBC
            REQcasedrop                          * 6BDC1
            OBJ_41974                            * 6BDC6
            BINT3                                * 6BDCB
            REQcasedrop                          * 6BDD0
            OBJ_41954                            * 6BDD5
            BINT2                                * 6BDDA
            DROPONE                              * 6BDDF
          ;                                      * 6BDE4
          NTHELCOMP                              * 6BDE9
          case                                   * 6BDEE

* refs (2): 6B9E3 6BDB2
OBJ_6BDF3:
          ::                                     * 6BDF3
            OBJ_6BCB3                            * 6BDF8
            EQLookup                             * 6BDFD
            IT                                   * 6BE02
            EVAL                                 * 6BE07
            OBJ_72FED                            * 6BE0C
            OVER                                 * 6BE11
            OBJ_4AC02                            * 6BE16
            OR                                   * 6BE1B
            ITE                                  * 6BE20
            ::                                   * 6BE25
              OBJ_6C555                          * 6BE2A
              TRUE                               * 6BE2F
            ;                                    * 6BE34
            FALSE                                * 6BE39
            BINT32                               * 6BE3E
            PUTLAM                               * 6BE43
            OBJ_40841                            * 6BE48
            case                                 * 6BE4D
            OBJ_6BD76                            * 6BE52
            '                                    * 6BE57
            EQUAL                                * 6BE5C
            OBJ_6BD3F                            * 6BE61
            Lookup                               * 6BE66
            IT                                   * 6BE6B
            EVAL                                 * 6BE70
            DUPTYPECHAR?                         * 6BE75
            ITE                                  * 6BE7A
            ::                                   * 6BE7F
              ?TogU/LCase                        * 6BE84
              CHR>$                              * 6BE89
            ;                                    * 6BE8E
            ::                                   * 6BE93
              OBJ_6E026                          * 6BE98
              NOT?SEMI                           * 6BE9D
              DUP                                * 6BEA2
              OBJ_6C2C1                          * 6BEA7
              SWAP                               * 6BEAC
              OBJ_6AEF1                          * 6BEB1
              NOT?SEMI                           * 6BEB6
              OBJ_6C221                          * 6BEBB
              SPACE$                             * 6BEC0
              ROT                                * 6BEC5
              OBJ_3516C                          * 6BECA
              ITE                                * 6BECF
              &$                                 * 6BED4
              SWAPDROP                           * 6BED9
              SWAPDROP                           * 6BEDE
              CHR_Space                          * 6BEE3
              >T$                                * 6BEE8
            ;                                    * 6BEED
            DUPTYPECSTR?                         * 6BEF2
            case                                 * 6BEF7
            OBJ_6BF8D                            * 6BEFC
            OBJ_6B9F2                            * 6BF01
            EQLookup                             * 6BF06
            case                                 * 6BF0B
            EVAL                                 * 6BF10
            '                                    * 6BF15
            OBJ_3F247                            * 6BF1A
            CkSecoType                           * 6BF1F
            case                                 * 6BF24
            EVAL                                 * 6BF29
            OBJ_4080F                            * 6BF2E
            case                                 * 6BF33

* refs (1): 6BD85
OBJ_6BF38:
            ::                                   * 6BF38
              EVAL                               * 6BF3D
              DispMenu                           * 6BF42
            ;                                    * 6BF47
            OBJ_40869                            * 6BF4C
            case                                 * 6BF51
            EVAL                                 * 6BF56
            OBJ_5186B                            * 6BF5B
          ;                                      * 6BF60
          DoBadKey                               * 6BF65
        ;                                        * 6BF6A

* refs (2): 6BB18 6BB22
OBJ_6BF6F:
        ::                                       * 6BF6F
          OBJ_6BFF6                              * 6BF74
          OBJ_6B74F                              * 6BF79
          OBJ_6CB25                              * 6BF7E
          OBJ_695CB                              * 6BF83
          case                                   * 6BF88

* refs (10): 69232 69246 69274 6AC26 6BAFF 6BEFC ...
OBJ_6BF8D:
          ::                                     * 6BF8D
            10GETLAM                             * 6BF92
            SWAP&$                               * 6BF97
            10PUTLAM                             * 6BF9C
          ;                                      * 6BFA1
          OBJ_6B939                              * 6BFA6

* refs (3): 6B89E 6B9D4 6C16D
OBJ_6BFAB:
          ::                                     * 6BFAB
            TRUE                                 * 6BFB0
            OBJ_6CB3E                            * 6BFB5

* refs (2): 6D1A4 6E974
OBJ_6BFBA:
            ::                                   * 6BFBA
              NOTcasedrop                        * 6BFBF
              SKIP                               * 6BFC4
              COLA_EVAL                          * 6BFC9
            ;                                    * 6BFCE
            19PUTLAM                             * 6BFD3
            OBJ_6B79A                            * 6BFD8
            OBJ_6C954                            * 6BFDD
          ;                                      * 6BFE2
        ;                                        * 6BFE7

* refs (2): 6BB2C 6BB36
OBJ_6BFEC:
        ::                                       * 6BFEC
          OBJ_6B939                              * 6BFF1

* refs (4): 6BF74 6C17C 6C18B 6C3B1
OBJ_6BFF6:
          ::                                     * 6BFF6

* refs (1): 6BBE0
OBJ_6BFFB:
            ::                                   * 6BFFB
              ::                                 * 6C000
                OBJ_6CAA8                        * 6C005
                ?SKIP                            * 6C00A
                ::                               * 6C00F
                  SPACE$                         * 6C014
                  OBJ_6BF8D                      * 6C019
                ;                                * 6C01E
                OBJ_6B5F6                        * 6C023
                NOTcase2DROP                     * 6C028
                ROTDROPSWAP                      * 6C02D
                9PUTLAM                          * 6C032
                8PUTLAM                          * 6C037
              ;                                  * 6C03C

* refs (3): 4EC76 6923C 6B885
OBJ_6C041:
              ::                                 * 6C041
                OBJ_6821C                        * 6C046

* refs (1): 6B8CB
OBJ_6C04B:
                ::                               * 6C04B
                  OBJ_672E6                      * 6C050
                  #1+_ONE_DO                     * 6C055
                  INDEX@                         * 6C05A
                  OBJ_67E34                      * 6C05F
                  OVER                           * 6C064
                  OBJ_67E64                      * 6C069
                  ROT                            * 6C06E
                  OBJ_67E45                      * 6C073
                  LOOP                           * 6C078
                  OBJ_672E6                      * 6C07D
                  OBJ_6819D                      * 6C082
                  {}N                            * 6C087
                  OBJ_6E9B0                      * 6C08C
                  OBJ_0C4E3                      * 6C091
                  OBJ_673A2                      * 6C096
                  1GETLAM                        * 6C09B
                  OBJ_673BB                      * 6C0A0
                  OBJ_67381                      * 6C0A5
                  BINT34                         * 6C0AA
                  GETLAM                         * 6C0AF
                  8GETLAM                        * 6C0B4
                  BINT10                         * 6C0B9
                  {}N                            * 6C0BE
                ;                                * 6C0C3
                >HCOMP                           * 6C0C8
                BINT1                            * 6C0CD
                BINT10                           * 6C0D2
                SUBCOMP                          * 6C0D7
                OBJ_681D8                        * 6C0DC
              ;                                  * 6C0E1
              9GETLAM                            * 6C0E6
              OBJ_686C0                          * 6C0EB
              9GETLAM                            * 6C0F0
              ROT                                * 6C0F5
              #=                                 * 6C0FA
              OBJ_695CB                          * 6C0FF
              ITE                                * 6C104
              DROPTRUE                           * 6C109
              FALSE                              * 6C10E
              NOTAND                             * 6C113
              OVER                               * 6C118
              AND                                * 6C11D
              IT                                 * 6C122

* refs (1): 6E86B
OBJ_6C127:
              ::                                 * 6C127
                OBJ_6821C                        * 6C12C
                CDRCOMP                          * 6C131
                OBJ_681D8                        * 6C136
              ;                                  * 6C13B
            ;                                    * 6C140
            ?SEMI                                * 6C145
            RDROP                                * 6C14A
            OBJ_6B8B7                            * 6C14F
          ;                                      * 6C154
          OBJ_6C555                              * 6C159
          OBJ_6CB25                              * 6C15E
          OBJ_695CB                              * 6C163
          NOTcase                                * 6C168
          OBJ_6BFAB                              * 6C16D
          OBJ_6BF8D                              * 6C172
          GOTO                                   * 6C177
          OBJ_6BFF6                              * 6C17C
        ;                                        * 6C181
