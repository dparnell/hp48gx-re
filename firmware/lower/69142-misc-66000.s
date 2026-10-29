* HP 48GX ROM revision R, #69142-#6C185: not yet identified
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: EqwRuleKey0 EqwRuleKey3 SUB RULES REPL NOT_69250 EXPR EDIT
* Follows on from the previous file (at #69142 in the original ROM).
        RPL

* refs (1): 68B66
OBJ_69142:
        ::                                       * 69142

* refs (4): 68878 68D32 68E4A 6B6B4
OBJ_69147:
          :: OBJ_699B9 COLAcase ;                * 69147
          :: OBJ_6D661 OBJ_6E4F6 OBJ_67416 EqwBoxCount OBJ_67448 OBJ_6EF41 * 6915B
            OBJ_69020 ;                          * 6917E

* refs (3): 68940 6D19A 6EA73
OBJ_69188:
          ::                                     * 69188

* refs (4): 692D8 6EE51 6EE7E 6EE9C
OBJ_6918D:
            :: OBJ_673D6 DUP#1+ OBJ_6747B EqwBoxCount OBJ_6773D #+ OBJ_6779A ; * 6918D
            OBJ_676CF ;                          * 691BA
          DUP 5PUTLAM DUPTYPEIDNT? SWAP TYPELAM? OR NOTcase * 691C4

* refs (2): 68E86 68E9F
OBJ_691E7:
          :: GetGNTData 3PICK LEN$ 3PICK #> NOTcase * 691E7
            :: 4UNROLL OBJ_6E645 DROP #1+ tok* PutGNTData tok* OBJ_6BF8D * 6920A
              OBJ_686C0 OBJ_6C041 DROPDUP OBJ_6BF8D DUP * 69237

NOT_69250:
              $ "NOT" EQUAL IT                   * 69250
              :: SPACE$ OBJ_6BF8D ;              * 6926A
              GetGNTData 2DROP DUPLEN$ #1+ 4ROLL PutGNTData ; * 6927E
            LEN$ #- DUP4UNROLL tok* DUP OBJ_6934B 2DROP ROT#1+ tok* * 692A1
            PutGNTData ;                         * 692CE
          OBJ_6918D ID>$ OBJ_6D62A OBJ_6D0D7 OVER OBJ_6681A OBJ_67448 * 692D8
          #0590410h 4PUTLAM BINT0 7PUTLAM BINT3 3PUTLAM OBJ_68EEF ; * 692FB

* refs (1): 68710
OBJ_69323:
        :: GetGNTData 5ROLL SWAP nultrior        * 69323

* refs (1): 69404
OBJ_6933C:
          :: FALSE 18PUTLAM                      * 6933C

* refs (2): 688B9 692BA
OBJ_6934B:
            :: DROPDUP LEN$ 4ROLL 4PICK 2DUP 1_#1-SUB$ 3UNROLL LAST$ * 6934B
              4ROLLSWAP &$ &$ 3UNROLL #+ GetNextToken ; * 69378
            OBJ_693CD ;                          * 6939B
          OVER tok=casedrop OBJ_693BE            * 693A5
          tok; tok=casedrop                      * 693B4

* refs (1): 693AF
OBJ_693BE:
          :: DROP GetNextToken                   * 693BE

* refs (1): 6939B
OBJ_693CD:
            :: OBJ_69824 OBJ_28602 PutGNTData OBJ_69941 ; ; * 693CD
          LEN$ ROTSWAP #-SWAP NULL$ OBJ_6933C ;  * 693F0

* refs (2): 68B57 68B84
OBJ_6940E:
        :: OBJ_698D3 BINT6 OBJ_69659 OBJ_698FB OBJ_698FB OBJ_69020 * 6940E

* refs (1): 69490
OBJ_69431:
          :: RDROP OBJ_67DDF #0=case             * 69431
            :: OBJ_69495 OBJ_6E1A9 OBJ_674BB EqwBoxCount EqwBoxParent@ * 69445
              EqwBoxParent@ OBJ_2846E #05060410h BINT0 BINT5 OBJ_67532 * 69463
              OBJ_28602 ;                        * 69481
            OBJ_69098 OBJ_69431                  * 6948B

* refs (7): 68882 68963 68D91 690CA 6944A 69883 ...
OBJ_69495:
            :: OBJ_6E9B0 ITE                     * 69495
              :: OBJ_67B17 OBJ_66BAD NOTcase OBJ_67416 * 694A4
                OBJ_67E0C OBJ_679C5 OBJ_679EA IT * 694BD
                :: OBJ_67B12 #0=case EqwBoxParent@ * 694D1
                  RDROP ;                        * 694E5
                OBJ_694F9 ;                      * 694EF

* refs (1): 694EF
OBJ_694F9:
              :: OBJ_68F7B OBJ_67878 ;           * 694F9
              DUP#0=csDROP OBJ_0C4E3 BINT34 GETLAM OVER#< NOTcase2DROP DUP * 6950D
              BINT34 PUTLAM OBJ_6A267 OBJ_67C3C ; * 69530
            OBJ_69941 OBJ_6996E                  * 69549

* refs (3): 6906B 690A2 69A45
OBJ_69553:
            :: FALSE BINT0 COLA OBJ_677C3        * 69553
            ;                                    * 6956C
            2DROP BINT6 EQcasedrop OBJ_69996     * 69571
            BINT8 #- ZERO_DO                     * 69585

* refs (3): 68931 6E3AC 6E3B1
OBJ_69594:
            :: OBJ_672E6 OBJ_67E34 #1- OBJ_67F0B ; LOOP OBJ_67F45 OBJ_28602 ; * 69594
        ;                                        * 695C6

* refs (3): 6BF83 6C0FF 6C163
OBJ_695CB:
        :: OBJ_699B9 18GETLAM NOT OR caseFALSE OBJ_672E6 * 695CB
          #0= caseFALSE tok=                     * 695EE
          BINT7 OBJ_69620 tokrparen BINT5 OBJ_69620 NoDecSep BINT6 * 695FD

* refs (2): 69602 69611
OBJ_69620:
          :: OBJ_69659 NOTcaseDROP RDROP         * 69620
            caseTRUE DROPFALSE                   * 69634
          ;                                      * 6963E
          FALSE ;                                * 69643

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
        :: TRUE 18PUTLAM 8GETLAM nultrior OBJ_68724 DROP GetGNTData * 6979D
          ngsizecase                             * 697C5

* refs (3): 6880A 697E3 69810
OBJ_697CA:
          :: failed 2RDROP ;                     * 697CA
          delimcase OBJ_697CA                    * 697DE
          DUP $>ID DUP undo ITE OBJ_27F1C OBJ_27F35 * 697E8
          NOTcasedrop OBJ_697CA                  * 6980B
          5UNROLL DROP GetNextToken              * 69815

* refs (3): 68E59 69034 693D2
OBJ_69824:
          :: nultrior NOP OBJ_250EF NOP 3PICK LEN$ 3PICKSWAP #> NOT?SEMI * 69824
            LEN$ #- NULL$ ;                      * 69856
          PutGNTData                             * 6986A

* refs (1): 68BF7
OBJ_6986F:
          :: OBJ_676CF OBJ_6DE96 OBJ_67F45 OBJ_69495 OBJ_69941 ; * 6986F
          :: OBJ_69A31 NOP NOP ; 8GETLAM DUPNULL$? case2DROP EQUAL * 69892
          ?SEMI                                  * 698BF
          OBJ_6C555 ;                            * 698C4

* refs (2): 689BD 68B93
OBJ_698CE:
        ::                                       * 698CE

* refs (2): 69007 69413
OBJ_698D3:
          :: OBJ_699B9 NOT?SEMI                  * 698D3
            RDROP OBJ_27797 ;                    * 698E2
          BINT7 OBJ_6964D                        * 698F1

* refs (6): 69016 6901B 69422 69427 699CD 699E1
OBJ_698FB:
          :: ?SEMI                               * 698FB
            RDROP OBJ_27797 ;                    * 69905
          DROP OBJ_69020 OBJ_69928 ;             * 69914

* refs (2): 6991E 69937
OBJ_69928:
        :: RDROP OBJ_69098 OBJ_69928 OBJ_69495   * 69928

* refs (8): 68904 68BCA 69066 693E1 69549 69888 ...
OBJ_69941:
          :: OBJ_6996E                           * 69941

* refs (2): 6907F 6999B
OBJ_6994B:
            :: OBJ_672E6 OBJ_67E34 #1+ OBJ_67F0B ; ; * 6994B

* refs (4): 69084 690C5 6954E 69946
OBJ_6996E:
          :: OBJ_67DDF DUP#0=csedrp OBJ_6E11D OBJ_67DEC OBJ_6EF6E OBJ_6E2D0 ; * 6996E

* refs (2): 69089 69580
OBJ_69996:
          :: OBJ_6994B OBJ_67F45 OBJ_28602 ; ;   * 69996

* refs (1): 68BA2
OBJ_699B4:
        ::                                       * 699B4

* refs (8): 4EC8A 6914C 695D0 698D8 6E695 6E6A9 ...
OBJ_699B9:
          :: 1GETLAM #0= ; OBJ_698FB OBJ_67DEC OBJ_2846E EQ OBJ_698FB * 699B9
          OBJ_69020 OBJ_672E6 OBJ_2845A OBJ_67F31 EqwBoxCount OBJ_679A1 DUP * 699E6
          OBJ_6BC55 CHR>$ tokanglesign &$ OBJ_6CB70 OBJ_44DFE OBJ_6681A ; * 69A09

* refs (4): 68706 68AFD 69897 69B0D
OBJ_69A31:
        :: OBJ_67DDF #0=case 3SKIP               * 69A31
          OBJ_69553 NOTcase 2skipcola            * 69A45
          DROP OBJ_27D32 3SKIP COLA OBJ_27D9A    * 69A54
          :: toklparen COLAskipcola ;            * 69A6D
          :: tokrparen COLAskipcola ;            * 69A81
          :: NoDecSep COLAskipcola ;             * 69A95
          :: tok= COLAskipcola ; OBJ_69B17 8GETLAM OBJ_27E68 ITE * 69AA9
          :: OBJ_69941 OBJ_69020 ; BINT7         * 69AD1
          BINT8 #- OBJ_672E6 OBJ_67E34 ROT#- OBJ_67F0B COLA OBJ_69A31 * 69AEA
        ;                                        * 69B12

* refs (1): 69ABD
OBJ_69B17:
        :: OBJ_69941 COLA 3SKIP                  * 69B17
        ;                                        * 69B2B

* refs (2): 5D04F 5D054
OBJ_69B30:
        :: DUP#1+PICK #+ #1+ ;                   * 69B30

* refs (4): 69DDE 69ED4 6A16D 6C43D
OBJ_69B49:
        :: ERRORCLR ClrDA1IsStat ROMPTR 0EA 03C 'LB TOPROW ROMPTR 0EA 03C * 69B49
          'TE LEFTCOL ROMPTR 0EA 03C 'LE FALSE' 'FOK STO FALSE' 'EL STO ' * 69B78
          ::                                     * 69BB5

* refs (2): 69C32 6C8B9
OBJ_69BBA:
            :: DA3OK? ?SEMI                      * 69BBA
              DispMenu SetDA3NoCh ;              * 69BC9
            'FOK ?SEMI                           * 69BD8
            TRUE' 'FOK STO OBJ_66CD6 OBJ_67CBE OBJ_25C23 ; * 69BE2
          ' OBJ_6A7C0 TrueTrue 5ROLL ONEFALSE' GraphicExit 'ERRJMP ClrDA3OK * 69C05
          ParOuterLoop OBJ_69BBA ExitFcn         * 69C2D

* refs (3): 6A900 6BBEF 6BC4B
OBJ_69C3C:
          :: EXITFCNsto NOP ; FALSE 19PUTLAM COLA_EVAL ; * 69C3C

* refs (24): 596CE 59718 59766 597B0 59836 59880 ...
* EquationWriter RULES key: take the next runstream object as the rule ('ManOp), 'ploc = 0, and apply it
EqwRuleKey0:
        :: TakeOver BINT0                        * 69C64

* refs (1): 69CC0
EqwRuleKey3~1:
          ROMPTR 0EA 03C 'ploc SetDA3NoCh 'R ROMPTR 0EA 03C 'ManOp * 69C73
          EXITFCNsto EqwRuleKey0~1 ;             * 69C9D

* refs (19): 59999 599B2 599E8 59A01 59A37 59A50 ...
* As EqwRuleKey0, with 'ploc = 3 (the move rules)
EqwRuleKey3:
        :: TakeOver BINT3 GOTO EqwRuleKey3~1 ;   * 69CAC

* refs (3): 69E98 6ADF2 6B1F6
OBJ_69CCA:
        :: OBJ_6B0E8 SYMBN 1PUTLAM OBJ_677DE OBJ_67416 1GETABND ZEROSWAP * 69CCA

* refs (1): 6A014
EqwRuleKey0~1~6:
          :: CLEARVDISP REDISPHBUFF NULL$ TRUE OBJ_6C550 ERRSET OBJ_677EA * 69CF2
            #2+PICK OBJ_67426 OBJ_6C4A1 ERRSET ROMPTR 0EA 005 ERRTRAP * 69D1A
            :: OBJ_6AE6F OBJ_6AE6F OBJ_6AE6F 3DROP OBJ_677DE OBJ_677EA * 69D3E
              #0=?SKIP ABND OBJ_677DE ERRJMP ;   * 69D61
          ;                                      * 69D7A
          OBJ_6AE6F OBJ_6C302 OBJ_6AE6F DROP OBJ_6C302 OBJ_6AE6F OBJ_6C302 * 69D7F
          SWAP OBJ_6C2C1 10PUTLAM OBJ_666D3 OBJ_0C4E3 SWAP#- #1+ OBJ_6B39F * 69DA2
          DUP 18PUTLAM OBJ_6AEA6 SWAPCOLA OBJ_69B49 ; * 69DCA

* refs (1): 69CA2
EqwRuleKey0~1:
        :: OBJ_6AF46 DUP 4PUTLAM DUP#2+PICK 5PUTLAM OBJ_0C4E3 #3+ NDUP * 69DE8
          OBJ_69EDE DUP 2PUTLAM DUP 4GETLAM #- 6PUTLAM DUP#2+PICK 7PUTLAM * 69E15
          OBJ_0C4E3 #3+ NDROP                    * 69E42
          :: 'ManOp EVAL                         * 69E51
            :: 'NOP ROMPTR 0EA 03C 'ManOp DoBadKey ; ; * 69E60
          3GETLAM #0<> case OBJ_69CCA            * 69E89
          'ManOp 'NOP EQ case                    * 69E9D
          :: OBJ_6B0E8 NDROP OBJ_6AEA6 'LB EqwRuleKey0~1~2 COLA OBJ_69B49 * 69EB1
          ;                                      * 69ED9

* refs (1): 69E15
OBJ_69EDE:
          :: 'LB OBJ_6AC67 OBJ_6AC80 OBJ_6AEF1 IT EqwRuleKey0~1~1~4 * 69EDE
            EqwBoxParent@ #1= ?SEMI              * 69F01
            rot DUP#0=case unrot                 * 69F10
            DUP#2+ BINT1 splitdown DROP #1- 1PUTLAM top& top& 1GETLAM * 69F1F
            tailpsh pZpargSWAPUn ;               * 69F4C
          DUP#1+ NDUP 6GETLAM 5GETLAM 2GETLAM 7GETLAM #+ OBJ_6B39F DUP * 69F5B
          7PUTLAM DUP                            * 69F88

* refs (2): 69EFC 6A3A2
EqwRuleKey0~1~1~4:
          :: BEGIN EqwBoxParent@ OBJ_67B12 OBJ_6EE65 NOT_UNTIL ; DUP#1= ITE * 69F92
          DROP SWAPDROP                          * 69FBF
          OBJ_673E6 EqwBoxCount OBJ_67406 OBJ_673A2 OBJ_673F6 OBJ_681E8 * 69FC9
          2GETLAM EqwRuleKey0~1~3 BINT11 {}N OVER#2+UNROL 7GETLAM * 69FE7
          EqwRuleKey0~1~4 OVER#2+UNROL SYMBN EqwRuleKey0~1~6 OBJ_0C4E3 * 6A005
          3PUTLAM DROP OBJ_67364 {}N SWAPDROP OBJ_673D6 OBJ_6773D DUPUNROT * 6A01E
          #2+UNROLL NDROP 1PUTLAM OBJ_0C4E3 SYMBN 5PUTLAM 3DROP INCOMPDROP * 6A046
          OBJ_67648 OBJ_0C4E3 SWAP#- 8PUTLAM BINT1 OBJ_679B3 11PUTLAM * 6A06E
          OBJ_681E8 BINT43 EqwBoxCount OBJ_6869D SUBHXS 12PUTLAM OBJ_681B1 * 6A091
          OBJ_6749B OBJ_67458 OBJ_674AB OBJ_6746B DUP OBJ_6748B OBJ_6747B * 6A0B4
          4PUTLAM BINT27 PUTLAM 22PUTLAM NDROP DUP 7PUTLAM 5GETLAM INNERCOMP * 6A0D7
          OBJ_6B0E8 EqwRuleKey0~1~5 1GETLAM 4GETLAM EqwRuleKey0~1~1 BINT27 * 6A104
          GETLAM 3GETLAM 22Lget #- #+ OBJ_6B39F ABND DUP 18PUTLAM OBJ_6681A * 6A122
          CLEARVDISP OBJ_666D3 OBJ_6AEA6 'LB COLA OBJ_69B49 * 6A154
        ;                                        * 6A172

* refs (1): 6A118
EqwRuleKey0~1~1:
        :: DUP 4PUTLAM OBJ_68550 15PUTLAM OBJ_678D6 9PUTLAM OBJ_67987 * 6A177
          5PUTLAM OBJ_6799C 6PUTLAM DUP OBJ_68F7B ROT #MIN SWAPDUP 10PUTLAM * 6A19F
          #1+DUP 2PUTLAM SWAPDUP 1PUTLAM 11GETLAM OVER#+ #2- 11PUTLAM 2DUP * 6A1CC
          #- 4PICK LENCOMP DUP 14PUTLAM EqwRuleKey0~1~1~1 2GETLAM 13GETLAM * 6A1F9
          #+ DUP 2PUTLAM 1GETLAM DUP#2- DUP#0=ITE * 6A221
          :: ROTROT2DROP EqwRuleKey0~1~1~3 3GETLAM ; EqwRuleKey0~1~1~2 * 6A23F
          OBJ_6A267 OVER                         * 6A25D

* refs (3): 6953A 6A25D 6EA46
OBJ_6A267:
          :: # 80000 #+ ; 1GETLAM BINT2          * 6A267

* refs (1): 6A30C
OBJ_6A28A:
          :: 2DUP#= 8GETLAM #0= ORcase 2DROP     * 6A28A
            DO INDEX@ OBJ_67B12 DUP OBJ_6EE65 IT #1+ * 6A2A8
            DUP 4PICK #>ITE                      * 6A2CB
            :: 8GETLAM #+ OBJ_67C3C ; 2DROP LOOP ; * 6A2DA
          EqwBoxCount#1+ 2GETLAM OBJ_6A28A DROP 2GETLAM 1GETLAM DO INDEX@ * 6A302
          OBJ_67B12 DUP#0= OVER OBJ_66BAD NOT OR OVER OBJ_6EE65 OR ?SKIP * 6A32A
          4PICK#+                                * 6A35C
          3PICK OVER#= IT                        * 6A361
          :: ROTDROP OVERSWAP ;                  * 6A370
          OBJ_67C3C LOOP SWAPDROP DUP 14GETLAM #1=?SKIP EqwRuleKey0~1~1~4 * 6A384
          15GETLAM OVER OBJ_685B2 '              * 6A3A7
          :: 4GETLAM BINT1 ; '                   * 6A3BB
          :: 10GETLAM BINT2 ; 13GETLAM OBJ_66BAD IT SWAP * 6A3D4
          ROTSWAP OBJ_6A40B SWAP                 * 6A3FC

* refs (1): 6A401
OBJ_6A40B:
          :: EVAL 3UNROLL 1GETLAM BINT1 OBJ_6A5AA EqwBoxCount#1+ 2GETLAM * 6A40B
            OBJ_6A5AA DROPSWAPDROP ;             * 6A433
          2DROP ;                                * 6A442

* refs (1): 6A212
EqwRuleKey0~1~1~1:
        :: 12GETLAM OBJ_681E8 DUP BINT1 7ROLL #1- OBJ_6869D SUBHXS ROT &HXS * 6A44C
          SWAP 5ROLL #1- OBJ_6869D #1+ MINUSONE SUBHXS &HXS OBJ_681B1 2DUP * 6A483
          SWAP#- 13PUTLAM 2DUP#= ITE 2DROP       * 6A4B5
          :: 2DUP#< casedrop                     * 6A4CE
            :: OBJ_67519 2GETLAM #1-- #+ 13GETLAM OBJ_67616 ; * 6A4DD
            #- OBJ_67519 2GETLAM #-SWAP ZERO_DO DUP#1+ ROLLDROP OBJ_6C302 * 6A505
            LOOP DROP ;                          * 6A52D
          EqwBoxCount 13GETLAM #+ OBJ_6746B EqwBoxCount 1GETLAM #1-- SWAP * 6A53C
          INNERCOMP DUP#2+ ROLL OVER#+ #1+ OBJ_68183 EqwRuleKey0~1~1~1~1 * 6A564
          NDROP ;                                * 6A587

* refs (1): 6A258
EqwRuleKey0~1~1~2:
        :: ZEROZERO ROT 5ROLL 5ROLL              * 6A591

* refs (3): 6A424 6A433 6EDDE
OBJ_6A5AA:
          :: 2DUP#= case2DROP DO                 * 6A5AA
            INDEX@ 13GETLAM EqwRuleKey0~1~1~2~1 LOOP ; * 6A5BE
          3DROP                                  * 6A5D7

* refs (1): 6A249
EqwRuleKey0~1~1~3:
          :: 1GETLAM 11GETLAM DUP 6GETLAM OBJ_6A61D OBJ_67BD5 DUP 5GETLAM * 6A5DC
            OBJ_6A61D OBJ_67BE2 DUP 9GETLAM      * 6A609

* refs (2): 6A5F5 6A609
OBJ_6A61D:
            :: 4PICKOVER #< NOT?SEMI             * 6A61D
              13GETLAM #+ ;                      * 6A631
            OBJ_67BC8 2DROP ;                    * 6A640
          7GETLAM 3GETLAM OVER#+ ;               * 6A64F

* refs (1): 6A5C8
EqwRuleKey0~1~1~2~1:
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
        GOSBVL  EqwPOP#>Box                      * 6A699
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
EqwRuleKey0~1~1~1~1:
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
        :: BINT4 OVER#= case2drop 'DoBadKeyT     * 6A7C0
          OVER BINT7 #< case2drpfls OVER         * 6A7D9
          BINT12 #=case                          * 6A7F2
          :: SWAPDROP BINT1 ?CaseKeyDef          * 6A7FC
            :: TakeOver DoNextRow DispMenu ; BINT2 ?CaseKeyDef * 6A810
            :: TakeOver DoPrevRow DispMenu ; BINT3 ?CaseKeyDef * 6A833
            :: TakeOver DoFirstRow DispMenu ; DROPDEADTRUE ; * 6A856
          BINT3 #=casedrop                       * 6A879
          :: OBJ_6FDD6 L_6B3F5 ;                 * 6A883
          BINT2 #=case                           * 6A897
          :: OBJ_6FDD6 L_6B428 ;                 * 6A8A1
          OBJ_6FDD6 OBJ_6B43F ;                  * 6A8B5

        :: TakeOver WINDOWCORNER OBJ_4CE83 TURNMENUON WINDOWXY ; * 6A8C4

        :: EXITFCNsto OBJ_6A8FB ;                * 6A8E7

* refs (1): 6A8F1
OBJ_6A8FB:
        :: OBJ_69C3C RECLAIMDISP FALSE ROMPTR 0EA 03C 'KO 11GETLAM 10GETLAM * 6A8FB

* refs (1): 6AB31
OBJ_6A929:
          :: DUPLEN$ #1+ NULL$ ; ;               * 6A929

* refs (1): 6BA1A
OBJ_6A947:
        :: TakeOver HARDBUFF TOTEMPOB            * 6A947

* refs (7): 6ABAE 6ADA7 6AE24 6B129 6BAB5 6C4F1 ...
OBJ_6A95B:
          :: OBJ_677EA UNROLL ;                  * 6A95B

* refs (3): 6AE29 6BAD3 6D4F6
OBJ_6A96F:
          :: BINT1 OBJ_67682 DROP ; OBJ_6BABA ;  * 6A96F

* refs (1): 461E1
OBJ_6A992:
        :: NoExitAction                          * 6A992
          {                                      * 6A99C
            {                                    * 6A9A1
              :: PTR DirLabel:                   * 6A9A6

RULES:
                $ "RULES" ;                      * 6A9B0
              OBJ_6AE9C }                        * 6A9C9
            {                                    * 6A9D3

EDIT:
              $ "EDIT" OBJ_6AF3C }               * 6A9D8
            {                                    * 6A9F4

EXPR:
              $ "EXPR" OBJ_6AC3A }               * 6A9F9
            {                                    * 6AA15

SUB:
              $ "SUB" OBJ_6ADFC }                * 6AA1A
            {                                    * 6AA34

REPL:
              $ "REPL" OBJ_6AD66 }               * 6AA39
            { $_EXIT                             * 6AA55
              { OBJ_6AB5E OBJ_6AA82 } }          * 6AA5F
          }                                      * 6AA78
        ;                                        * 6AA7D

* refs (1): 6AA69
OBJ_6AA82:
        :: TakeOver BINT1 OBJ_67E39 #1<> caseDoBadKey OBJ_67E0C * 6AA82
          OBJ_679C5 DUP OBJ_67448 OBJ_679B3      * 6AAA5

* refs (2): 6EA32 6F88D
OBJ_6AAB9:
          :: OBJ_68452 OBJ_6B2AA OBJ_44C3C ; ?SKIP OBJ_6D37F * 6AAB9
          OBJ_6C555 BINT0 OBJ_67426 CLEARVDISP OBJ_6B79A * 6AADC

* refs (1): 6AB72
OBJ_6AAF5:
          :: OBJ_25F4E OBJ_6AF4B SYMBN OBJ_6C2C1 ; EXITFCNsto * 6AAF5
          :: toklparen SWAP&$ tokrparen &$ OBJ_6A929 OBJ_285EE * 6AB18

* refs (1): 6ABC7
OBJ_6AB3B:
            :: OBJ_0C4E3 BINT34 PUTLAM ; ;       * 6AB3B
        ;                                        * 6AB59

* refs (1): 6AA64
OBJ_6AB5E:
        :: TakeOver EXITFCNsto                   * 6AB5E
          :: OBJ_6AAF5 DUPLEN$ OBJ_0C4E3 #1= ITE * 6AB6D
            :: DROP ONESWAP NULL$ 3UNROLL ; OBJ_6E645 * 6AB8B
            OBJ_6A95B OBJ_6E7CB DROPSWAPDROP 10PUTLAM OBJ_6AE42 OBJ_6AB3B * 6ABAE
            FALSE BINT30 PUTLAM ERRSET           * 6ABCC
            :: OBJ_6B5E2 ; ERRTRAP               * 6ABE0
            :: OBJ_6AE6F OBJ_6C302 ERRJMP ; TRUE BINT30 PUTLAM OBJ_6AE6F * 6ABF4
            OBJ_6C302 OBJ_6BF8D GetGNTData ;     * 6AC21
        ;                                        * 6AC35

* refs (1): 6AA0B
OBJ_6AC3A:
        :: TakeOver 'EL case                     * 6AC3A
          :: OBJ_6B0CF OBJ_6ACF3 OBJ_25C23 ;     * 6AC4E

* refs (3): 69EE8 6AEAB 6AFD2
OBJ_6AC67:
          :: 'LB OBJ_67B17 OBJ_6B381 ;           * 6AC67

* refs (4): 69EED 6AEB5 6F8A6 6FE9B
OBJ_6AC80:
          :: OBJ_0C4E3 SWAP#- OBJ_6731D #1-+ DUP#1+PICK DUP' xFCNAPPLY EQ * 6AC80
            NOTcase SWAPDROP                     * 6ACAD
            SWAP #3+PICK DUPTYPEROMP? NOTcaseDROP SWAPDROP * 6ACB7
          ;                                      * 6ACD0
          OBJ_6AEF1 NOT?SEMI                     * 6ACD5
          OBJ_6F5B3 TRUE' 'EL STO                * 6ACDF

* refs (2): 6AC58 6F5D6
OBJ_6ACF3:
          :: 'LB EqwBoxParent@ OBJ_67B12 OBJ_6EE65 IT EqwBoxParent@ * 6ACF3
            OBJ_67AEF                            * 6AD16

* refs (1): 44DDB
OBJ_6AD1B:
            :: 2DUP5ROLL OBJ_67ABC 4PICK ROT#+ 3PICK ROT#+ HARDBUFF 5UNROLL ; * 6AD1B
            SUBGROB INVGROB XYGROBDISP ;         * 6AD4D
        ;                                        * 6AD61

* refs (1): 6AA4B
OBJ_6AD66:
        :: TakeOver OBJ_6C276 OBJ_6C4A1 OBJ_6B28C NOTcasedrop * 6AD66

* refs (2): 6ADCF 6C2DF
OBJ_6AD84:
          :: # 202 OBJ_6BC2D ;                   * 6AD84
          OBJ_6AE6F DROP OBJ_6A95B OBJ_6AF46 OBJ_6B12E case * 6AD9D
          :: NDROP NDROP NDROP OBJ_6AD84 ;       * 6ADBB
          NDROP OBJ_6AE6F OBJ_6C2EE EXPLODE EXITFCNsto OBJ_69CCA ; * 6ADD9

* refs (1): 6AA2A
OBJ_6ADFC:
        :: TakeOver OBJ_6AF46 OBJ_6AFF0 OVER#2+UNROL NDROP OVER#2+UNROL * 6ADFC
          NDROP OBJ_6A95B OBJ_6A96F OBJ_113C2 #5+ OBJ_113D2 ; * 6AE1F

* refs (4): 6ABC2 6BB6D 6C258 6E861
OBJ_6AE42:
        :: RECLAIMDISP OBJ_677DE BINT23 GETLAM 10GETLAM Lpop;true OBJ_6C550 * 6AE42
          ERRSET                                 * 6AE6A

* refs (14): 69D43 69D48 69D4D 69D7F 69D89 69D98 ...
* Probably: bring the object stored under the EquationWriter's stack marker up to level 1
OBJ_6AE6F:
          :: OBJ_677EA #1+ROLL ; BINT23 PUTLAM OBJ_6C302 OBJ_6B74F ; * 6AE6F

* refs (1): 6A9C9
OBJ_6AE9C:
        :: TakeOver                              * 6AE9C

* refs (3): 69DD4 69EC0 6A15E
OBJ_6AEA6:
          :: OBJ_6AC67 DUP OBJ_6AC80 DUP' xFCNAPPLY EQITE * 6AEA6
            :: DROP OBJ_677EA SWAP#- #1+PICK ; SWAPDROP DUP * 6AEC9

* refs (4): 69EF2 6ACD5 6BEB1 6EBEA
OBJ_6AEF1:
            :: OBJ_6E026 NOTcsdrpfls OBJ_26BED NOTcsdrpfls 3DROP TRUE ; * 6AEF1
            NOTcasedrop {MenuRules}              * 6AF19
            OBJ_3F1E3 ;                          * 6AF23
          InitMenu DispMenu ;                    * 6AF2D

* refs (1): 6A9EA
OBJ_6AF3C:
        :: TakeOver                              * 6AF3C

* refs (3): 69DED 6ADAC 6AE06
OBJ_6AF46:
          ::                                     * 6AF46

* refs (1): 6AAFF
OBJ_6AF4B:
            :: OBJ_677EA OBJ_0C4E3 ZERO_DO DUPPICK SWAP LOOP DROP OBJ_0C4E3 ; * 6AF4B
            DUP#2+ BINT2 DO INDEX@ PICK ' xPREDIV EQIT * 6AF7D
            :: INDEX@ ROLL INDEX@ OBJ_2804D UNROLL ; LOOP DUP OBJ_6AC67 #1-- * 6AFA5
            tailpsh pZpargSWAPUn ;               * 6AFDC
          dup                                    * 6AFEB

* refs (4): 6AE0B 6B5A6 6C1F4 84E13
OBJ_6AFF0:
          :: DUP#0=csedrp NULLSYMB pshzer BEGIN pullrev psh1&rev psh * 6AFF0
            OBJ_27FEE psh DUP#0= UNTIL DROP IMPLODE ; * 6B018
          OBJ_6CC10 OBJ_6CC32 SWAP EDITDECOMP$ SWAP IT OBJ_6CC21 * 6B03B
          OBJ_6B31D DUP ROMPTR 0EA 03C 'unbound OBJ_6CC10 OBJ_6CC32 SWAP * 6B05E
          OBJ_6B200 NOTcase OBJ_6B0A5            * 6B087
          'unbound EQUAL casedrop                * 6B096

* refs (2): 6B091 6B192
OBJ_6B0A5:
          :: ZEROZERO ROMPTR 0EA 03C 'TE ROMPTR 0EA 03C 'LE * 6B0A5

* refs (2): 6AC53 6F5D1
OBJ_6B0CF:
            :: FALSE' 'EL STO ;                  * 6B0CF

* refs (3): 69CCF 69EB6 6A104
OBJ_6B0E8:
            :: top& psh DUP#1+ OBJ_67448 top& ; NDROP OBJ_67CBE OBJ_666D3 * 6B0E8
            OBJ_67CBE OBJ_25C23 ;                * 6B11A
          OBJ_6A95B                              * 6B129

* refs (1): 6ADB1
OBJ_6B12E:
          :: DUP#2+PICK OVER#+ #3+ DUP#1+PICK DUP#0=csedrp DROPFALSE #+ #1+ * 6B12E
            OBJ_5F5AD NOTcaseFALSE OBJ_6C4A1     * 6B15B
            dup;#nm? SWAPDROP ;                  * 6B16A
          OBJ_6AE6F SWAP casedrop                * 6B179

* refs (1): 6B1EC
OBJ_6B188:
          :: DoBadKey OBJ_6B0A5 ;                * 6B188
          OVER#2+UNROL NDROP OVER#0= 4PICK #0= AND SWAP EXPLODE OVER * 6B19C
          OBJ_6B2AA x= OVER #3+ ROLL NOTAND case OBJ_6B188 * 6B1C9
          EXITFCNsto OBJ_69CCA ;                 * 6B1F1

* refs (2): 6B087 6C20D
OBJ_6B200:
        :: tok' SWAP&$ tok' &$ RECLAIMDISP NULL$SWAP DUPLEN$ BINT0 BINT2 * 6B200
          BINT0 EditMenu BINT1 TRUE BINT1 InputLine DispMenu ClrDA1IsStat * 6B232
          DOCLLCD NOTcase                        * 6B25A
          :: IT OBJ_6CC21                        * 6B264
            FALSE ;                              * 6B273
          ROT IT OBJ_6CC21                       * 6B27D

* refs (2): 6AD7A 84E4A
OBJ_6B28C:
          :: DUPTYPECOL? IT                      * 6B28C
            :: DUP CARCOMP                       * 6B29B

* refs (5): 6AAC3 6B1C9 6C3F7 6D1D1 6E37F
OBJ_6B2AA:
              :: 'R EQ ; x' NOT?SEMI             * 6B2AA
              DUPTWO NTHELCOMP NOT?SEMI          * 6B2C8
              SWAPDROP ;                         * 6B2D7
            ?OKINALG NOTcaseFALSE OBJ_26BED      * 6B2E1
            NOTcaseTRUE 2DROPFALSE               * 6B2F0
          ;                                      * 6B2FA
          NOTcase2drop                           * 6B2FF
          :: DoBadKey FALSE ;                    * 6B304
          SWAP                                   * 6B318

* refs (2): 6B05E 6C2CB
OBJ_6B31D:
          :: DUP CAR$ OBJ_6BCA5 EQUAL IT CDR$    * 6B31D
            DUP DUPLEN$ SUB$1# BINT39 OBJ_6E433  * 6B340

* refs (3): 16DEA 6C244 6E5F0
OBJ_6B359:
            :: DUPLEN$ #1-1SWAP SUB$ ; ;         * 6B359
          TRUE ;                                 * 6B377

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
        :: CK0NOLASTWD POLSaveUI ERRSET          * 6B48E
          :: CLEARVDISP NULL$ TRUE OBJ_6C550 ERRSET * 6B4A2
            :: OBJ_6CC21 REDISPHBUFF OBJ_6B5E2 ; ERRTRAP OBJ_6C8C3 OBJ_6B59C * 6B4C0
            DROP ;                               * 6B4E8
          ERRTRAP POLResUI&Err POLRestoreUI ;    * 6B4F2

* refs (2): 42DD7 42DE1
ObEdit~1:
        :: CK1NOLASTWD POLSaveUI ERRSET          * 6B506
          :: TRUE ObEdit~1~3 ERRSET              * 6B51A
            :: ObEdit~1~4 OBJ_6C302 OBJ_6BBFE DROP OBJ_4CE83 ObEdit~1~2 * 6B52E
              BINT30 GETLAM IT OBJ_6B5E2         * 6B551
            ;                                    * 6B565
            ERRTRAP                              * 6B56A
            :: RDROP OBJ_6C8CD ERROR@ #0= caseFALSE GOTO * 6B56F
              ObEdit~1~5 ;                       * 6B592

* refs (1): 6B4E3
OBJ_6B59C:
            :: ObEdit~1~1 OBJ_6AFF0 SWAP OBJ_6C8CD ExitFcn EVAL TRUE ; ; * 6B59C
          ERRTRAP POLResUI&Err POLRestoreUI ;    * 6B5CE

* refs (6): 6ABE5 6B4CF 6B560 6B790 6B8AD 6B9E8
OBJ_6B5E2:
        :: RDROP ?ATTNQUIT OBJ_6B9BB             * 6B5E2

* refs (1): 6C023
OBJ_6B5F6:
          :: GetGNTData DROP GetNextToken nultrior * 6B5F6
            :: 2DROP SWAPDROP DUPLEN$ #1+ FALSE ; OBJ_250EF * 6B60F
            :: 4ROLLDROP TRUE ; 4ROLLDROP 3PICK LEN$ 3PICKSWAP #> * 6B637
            NOTcaseTRUE LEN$                     * 6B664
            #- FALSE ;                           * 6B66E
          case OBJ_6B853                         * 6B67D
          2DROP OBJ_6CAA8 case                   * 6B687
          :: OBJ_6CB3E ?SKIP OBJ_6C954           * 6B696
            OBJ_6B9A2 ;                          * 6B6AA
          OBJ_69147                              * 6B6B4
          :: OBJ_6CB39 OBJ_6B9A2 ; BINT35 GETLAM * 6B6B9
          :: palparse NOTcase2drop DROPFALSE     * 6B6D7
            :: DUPTYPEREAL? SWAP TYPEIDNT? OR ; ; * 6B6EB
          5GETLAM                                * 6B70E

* refs (1): 6EFAF
OBJ_6B713:
          :: ?OKINALG NOTcsdrpfls OBJ_26BED NOTcsdrpfls SWAPDROP #1= * 6B713
            NOTcsdrpfls OBJ_6E2E9 ;              * 6B736
          NOTAND IT                              * 6B745

* refs (3): 6AE92 6BF79 6C271
OBJ_6B74F:
          :: TRUE BINT32 PUTLAM ;                * 6B74F
          tok* OBJ_6CAD0 &$ 10GETLAM 9GETLAM 1_#1-SUB$ SWAP&$ 10PUTLAM * 6B768
          OBJ_6B5E2 ;                            * 6B790

* refs (6): 6AAF0 6B989 6BFD8 6C3D4 6E76C 6E794
OBJ_6B79A:
        :: TRUE 17PUTLAM FALSE 19PUTLAM OBJ_666D3 OBJ_67416 OBJ_67AEF 3PICK * 6B79A
          OBJ_679D7 #0=ITE                       * 6B7C7
          :: ROT OBJ_67C6C OBJ_6F42D EQcasedrop SWAP * 6B7D1
            GROBDIMw ROT#+ ;                     * 6B7EF
          :: 3PICK OBJ_67AE2 #+ EqwFontHeight #2/ #- SWAPROT OBJ_67A9D #+ ; * 6B7FE
          2DUP 14PUTLAM 15PUTLAM 12PUTLAM 13PUTLAM ; * 6B835

* refs (1): 6B682
OBJ_6B853:
        :: DUP BINT35 PUTLAM ROTDROP 8PUTLAM 9PUTLAM BINT32 GETLAM ?SKIP * 6B853
          OBJ_6C041                              * 6B885
          OBJ_686C0 ITE                          * 6B88A

* refs (1): 6C1B8
OBJ_6B894:
          :: OBJ_6B939 OBJ_6BFAB ; OBJ_6B8B7     * 6B894
          OBJ_6B5E2 ;                            * 6B8AD

* refs (3): 6B8A8 6BBF4 6C14F
OBJ_6B8B7:
        :: OBJ_6821C DUP CARCOMP OBJ_6C04B EQUAL IT CDRCOMP * 6B8B7
          OBJ_681D8 8GETLAM NEWLINE$&$ #SyntaxErr JstGetTHEMESG &$ DoBadKey * 6B8DF
          FlashMsg GetGNTData LEN$ #- DUPUNROT #1- ONESWAP SUB$SWAP NULL$ * 6B902
          PutGNTData                             * 6B92F

* refs (6): 6BA10 6BA51 6BAAB 6BC46 6C267 6C35C
OBJ_6B934:
          ::                                     * 6B934

* refs (5): 6B899 6BFA6 6BFF1 6C3CF 6E5FF
OBJ_6B939:
            :: OBJ_6C361 HARDBUFF 14GETLAM 15GETLAM BINT28 GETLAM 3PICK#+ * 6B939
              OBJ_49158 3PICK#+ GROB!ZERODRP ZEROZERO BINT28 PUTLAM * 6B961
              OBJ_496F0 ;                        * 6B97F
            OBJ_6B79A OBJ_6CB25 OBJ_6CB39 ;      * 6B989
        ;                                        * 6B99D

* refs (2): 6B6AA 6B6C3
OBJ_6B9A2:
        :: RDROP BINT30 GETLAM NOT?SEMI          * 6B9A2

* refs (1): 6B5F1
OBJ_6B9BB:
          :: 19GETLAM NOT?SEMI                   * 6B9BB
            OBJ_6CB3E ?SEMI                      * 6B9CA
            OBJ_6BFAB ;                          * 6B9D4
          GetKeyOb OBJ_6BDF3 OBJ_6B5E2 ;         * 6B9DE

* refs (1): 6BF01
OBJ_6B9F2:
        { ROMP_0A2_00F OBJ_6C32A ROMP_0A1_00D    * 6B9F2
          :: TakeOver OBJ_6B934 OBJ_6C361 OBJ_6A947 OBJ_6C954 ; DoCAlarmKey * 6BA06
          DoCAlarmKey NOP NOP ROMP_0A1_02C ABORT ROMP_0A2_030 * 6BA2E
          :: OBJ_6B934 OBJ_6CC10 ITE             * 6BA4C
            :: OBJ_6CC32 # 207 ;                 * 6BA60
            :: OBJ_6CC21 # 208 ;                 * 6BA79
            JstGetTHEMESG FlashMsg ;             * 6BA92
          ROMP_0A3_02B                           * 6BAA1
          :: OBJ_6B934 10GETLAM OBJ_6A95B        * 6BAA6

* refs (1): 6A988
OBJ_6BABA:
            :: OBJ_113C2 #5+ OBJ_113D2 ; OBJ_6A96F ; * 6BABA
          ROMP_0A1_00A                           * 6BADD
          :: $ " RATIO " OBJ_6BF8D ; ROMP_0A1_00F OBJ_6C3AC ROMP_0A1_010 * 6BAE2
          OBJ_6BF6F ROMP_0A1_011 OBJ_6BF6F ROMP_0A3_010 OBJ_6BFEC * 6BB18
          ROMP_0A3_011 OBJ_6BFEC ROMP_0A2_019 OBJ_6C186 ROMP_0A1_01C * 6BB31
          OBJ_6E5D2 ROMP_0A3_00D OBJ_6C262 ROMP_0A2_01B * 6BB4A
          :: NULL$ 10PUTLAM OBJ_6AE42 ; ROMP_0A1_018 * 6BB5E
          :: OBJ_6BBCC ; EVAL_3B427              * 6BB7C
          :: EXITFCNsto xEVAL OBJ_6BBCC ; ROMP_0A2_00E * 6BB90
          :: EXITFCNsto x>NUM OBJ_6BBCC ; }      * 6BBAE

* refs (3): 6BB81 6BB9F 6BBBD
OBJ_6BBCC:
        :: RDROP                                 * 6BBCC

* refs (1): 6C1A4
OBJ_6BBD6:
          # 206                                  * 6BBD6  518
* The Very Big List names this address <00206h4A9 RPL ArF15h : CNTR, but it is a pointer inside an object; the name is not used
          OBJ_6BFFB NOTcasedrop                  * 6BBE0
          :: OBJ_69C3C OBJ_6B8B7 ;               * 6BBEA

* refs (3): 6B53D 6C195 8D3FA
OBJ_6BBFE:
          ::                                     * 6BBFE

* refs (1): 68738
OBJ_6BC03:
            CHR "\08" 7PUTLAM OBJ_686C0 BINT0 7PUTLAM ; * 6BC03
          case drop;q_58A0C                      * 6BC23

* refs (7): 49C9F 4ED07 4ED2F 50E3B 6AD93 6C1A9 ...
OBJ_6BC2D:
          :: JstGetTHEMESG DoBadKey FlashMsg ; OBJ_6B934 OBJ_69C3C ; * 6BC2D

* refs (7): 69A09 6BCC7 6BCD1 6BD21 6BD2B 6BD6C ...
OBJ_6BC55:
        :: BINT51 SysITE CHR_; CHR_, ;           * 6BC55

* refs (2): 6BCDB 6BCE5
OBJ_6BC73:
        :: BINT51 SysITE CHR_, CHR_. ;           * 6BC73

* refs (2): 68CE7 6BD03
OBJ_6BC91:
        :: ' xFORMUNIT ;                         * 6BC91

* refs (2): 6B32C 6BD44
OBJ_6BCA5:
        CHR "'"                                  * 6BCA5

* refs (1): 6BD5D
OBJ_6BCAC:
        CHR "@"                                  * 6BCAC

* refs (1): 6BDF8
OBJ_6BCB3:
        { ROMP_0A3_007 OBJ_6CC43 ROMP_0A5_02E OBJ_6BC55 ROMP_0A2_02E * 6BCB3
          OBJ_6BC55 ROMP_0A4_02E OBJ_6BC73 ROMP_0A1_02E OBJ_6BC73 * 6BCD1
          ROMP_0A5_021 toklparen ROMP_0A2_021 toklparen ROMP_0A3_026 * 6BCEA
          OBJ_6BC91 ROMP_0A1_01A CHR_E ROMP_0A1_019 CHR_- ROMP_0A4_02F * 6BD03
          OBJ_6BC55 ROMP_0A1_02F OBJ_6BC55 K__ë_ BINT0 } * 6BD21

* refs (1): 6BE61
OBJ_6BD3F:
        { OBJ_6BCA5                              * 6BD3F
          :: ' ROMP_0A1_00C ; OBJ_6BCAC BINT0 CHR_Space OBJ_6BC55 } * 6BD49

* refs (1): 6BE52
OBJ_6BD76:
        :: OBJ_3EFC8 case OBJ_6BF38              * 6BD76
          INCOMPDROP ROTDROPSWAP GETPROC DUPUNROT TYPELIST? NOTcasedrop * 6BD8A
          :: COLA OBJ_6BDF3                      * 6BDA8
          ;                                      * 6BDB7
          :: REQcasedrop OBJ_41974               * 6BDBC
            BINT3 REQcasedrop OBJ_41954          * 6BDCB
            BINT2 DROPONE ;                      * 6BDDA
          NTHELCOMP case                         * 6BDE9

* refs (2): 6B9E3 6BDB2
OBJ_6BDF3:
          :: OBJ_6BCB3 EQLookup IT EVAL          * 6BDF3
            OBJ_72FED OVER OBJ_4AC02 OR ITE      * 6BE0C
            :: OBJ_6C555 TRUE ; FALSE            * 6BE25
            BINT32 PUTLAM OBJ_40841 case OBJ_6BD76 * 6BE3E
            ' EQUAL OBJ_6BD3F Lookup IT EVAL     * 6BE57
            DUPTYPECHAR? ITE                     * 6BE75
            :: ?TogU/LCase CHR>$ ;               * 6BE7F
            :: OBJ_6E026 NOT?SEMI                * 6BE93
              DUP OBJ_6C2C1 SWAP OBJ_6AEF1 NOT?SEMI * 6BEA2
              OBJ_6C221 SPACE$ ROT OBJ_3516C ITE &$ SWAPDROP * 6BEBB
              SWAPDROP CHR_Space >T$ ;           * 6BEDE
            DUPTYPECSTR? case OBJ_6BF8D          * 6BEF2
            OBJ_6B9F2 EQLookup case EVAL         * 6BF01
            ' OBJ_3F247 CkSecoType case EVAL     * 6BF15
            OBJ_4080F case                       * 6BF2E

* refs (1): 6BD85
OBJ_6BF38:
            :: EVAL DispMenu ;                   * 6BF38
            OBJ_40869 case EVAL                  * 6BF4C
            OBJ_5186B ;                          * 6BF5B
          DoBadKey ;                             * 6BF65

* refs (2): 6BB18 6BB22
OBJ_6BF6F:
        :: OBJ_6BFF6 OBJ_6B74F OBJ_6CB25 OBJ_695CB case * 6BF6F

* refs (10): 69232 69246 69274 6AC26 6BAFF 6BEFC ...
OBJ_6BF8D:
          :: 10GETLAM SWAP&$ 10PUTLAM ;          * 6BF8D
          OBJ_6B939                              * 6BFA6

* refs (3): 6B89E 6B9D4 6C16D
OBJ_6BFAB:
          :: TRUE OBJ_6CB3E                      * 6BFAB

* refs (2): 6D1A4 6E974
OBJ_6BFBA:
            :: NOTcasedrop SKIP                  * 6BFBA
              COLA_EVAL ;                        * 6BFC9
            19PUTLAM OBJ_6B79A OBJ_6C954 ;       * 6BFD3
        ;                                        * 6BFE7

* refs (2): 6BB2C 6BB36
OBJ_6BFEC:
        :: OBJ_6B939                             * 6BFEC

* refs (4): 6BF74 6C17C 6C18B 6C3B1
OBJ_6BFF6:
          ::                                     * 6BFF6

* refs (1): 6BBE0
OBJ_6BFFB:
            ::                                   * 6BFFB
              :: OBJ_6CAA8 ?SKIP                 * 6C000
                :: SPACE$ OBJ_6BF8D ;            * 6C00F
                OBJ_6B5F6 NOTcase2DROP ROTDROPSWAP * 6C023
                9PUTLAM 8PUTLAM ;                * 6C032

* refs (3): 4EC76 6923C 6B885
OBJ_6C041:
              :: OBJ_6821C                       * 6C041

* refs (1): 6B8CB
OBJ_6C04B:
                :: OBJ_672E6 #1+_ONE_DO INDEX@ OBJ_67E34 OVER OBJ_67E64 ROT * 6C04B
                  OBJ_67E45 LOOP OBJ_672E6 #3* {}N OBJ_6E9B0 OBJ_0C4E3 * 6C073
                  OBJ_673A2 1GETLAM OBJ_673BB EqwBoxCount BINT34 GETLAM * 6C096
                  8GETLAM BINT10 {}N ;           * 6C0B4
                >HCOMP BINT1 BINT10 SUBCOMP OBJ_681D8 ; * 6C0C8
              9GETLAM OBJ_686C0 9GETLAM ROT #= OBJ_695CB ITE DROPTRUE FALSE * 6C0E6
              NOTAND OVER AND IT                 * 6C113

* refs (1): 6E86B
OBJ_6C127:
              :: OBJ_6821C CDRCOMP OBJ_681D8 ;   * 6C127
            ;                                    * 6C140
            ?SEMI                                * 6C145
            RDROP OBJ_6B8B7 ;                    * 6C14A
          OBJ_6C555 OBJ_6CB25 OBJ_695CB NOTcase OBJ_6BFAB * 6C159
          OBJ_6BF8D GOTO OBJ_6BFF6 ;             * 6C172
