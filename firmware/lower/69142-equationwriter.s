* HP 48GX ROM revision R, #69142-#6C185: EquationWriter: expression parser (operators, separators, precedence), the subexpression selection environment and its menu (RULES EDIT EXPR SUB REPL EXIT), rule application, entry points and the main key loop
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: EqwRuleKey0 EqwRuleKey3 EqwAddText EqwNoArg? ListSepChr EqwUnderMark EqwFlash EqwAfterArg EqwRedraw EqwKeyLoop EqwEraseText EqNext?
* Follows on from the previous file (at #69142 in the original ROM).
        RPL

* refs (1): 68B66
EqwToken~1:
        ::                                       * 69142

* refs (4): 68878 68D32 68E4A 6B6B4
* If no operand has been read, run the next object and leave the caller (COLAcase)
EqwNoArg?case:
          :: EqwNoArg? COLAcase ;                * 69147
          :: EqwToken~3 EqwRelayoutCur EqwCurBox@ EqwBoxCount EqwCurBox! * 6915B
            EqwToken~4 EqwNextToken ;            * 69179

* refs (3): 68940 6D19A 6EA73
OBJ_69188:
          ::                                     * 69188

* refs (4): 692D8 6EE51 6EE7E 6EE9C
* -> ob: pop the object stack
EqwStkPop:
            :: EqwStkFree@ DUP#1+ EqwStkFree! EqwBoxCount EqwPastFrames #+ * 6918D
              EqwSlot@ ;                         * 691B0
            EqwDupStkPush ;                      * 691BA
          DUP 5PUTLAM DUPTYPEIDNT? SWAP TYPELAM? OR NOTcase * 691C4

* refs (2): 68E86 68E9F
OBJ_691E7:
          :: GetGNTData 3PICK LEN$ 3PICK #> NOTcase * 691E7
            :: 4UNROLL OBJ_6E645 DROP #1+ tok* PutGNTData tok* EqwAddText * 6920A
              EqwParseText EqwPushUndo DROPDUP EqwAddText DUP * 69237

NOT_69250:
              $ "NOT" EQUAL IT                   * 69250
              :: SPACE$ EqwAddText ;             * 6926A
              GetGNTData 2DROP DUPLEN$ #1+ 4ROLL PutGNTData ; * 6927E
            LEN$ #- DUP4UNROLL tok* DUP EqwInsertToken 2DROP ROT#1+ tok* * 692A1
            PutGNTData ;                         * 692CE
          EqwStkPop ID>$ EqwText>L22 EqwFcnApply OVER EqwRelayout EqwCurBox! * 692D8
          #0590410h 4PUTLAM BINT0 7PUTLAM BINT3 3PUTLAM EqwFrameOp ; * 692FB

* refs (1): 68710
EqwParseStep~3:
        :: GetGNTData 5ROLL SWAP nultrior        * 69323

* refs (1): 69404
OBJ_6933C:
          :: FALSE 18PUTLAM                      * 6933C

* refs (2): 688B9 692BA
* Insert a token into the text at the current position and read it
EqwInsertToken:
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
            :: EqwTokenRead ~BINT0;1PUTLAM PutGNTData OBJ_69941 ; ; * 693CD
          LEN$ ROTSWAP #-SWAP NULL$ OBJ_6933C ;  * 693F0

* refs (2): 68B57 68B84
* Handle a semicolon or the list separator
EqwSeparator:
        :: OBJ_698D3 BINT6 OBJ_69659 OBJ_698FB OBJ_698FB EqwNextToken * 6940E

* refs (1): 69490
OBJ_69431:
          :: RDROP EqwFrm1@ #0=case              * 69431
            :: EqwAfterArg EqwAddArg EqwFrmPop EqwBoxCount EqwBoxParent@ * 69445
              EqwBoxParent@ 'CmpRectOp #05060410h BINT0 BINT5 EqwFrmPush * 69463
              ~BINT0;1PUTLAM ;                   * 69481
            EqwCloseArg OBJ_69431                * 6948B

* refs (7): 68882 68963 68D91 690CA 6944A 69883 ...
* Note where the next object of the expression goes: set field +18 of the current box from the object count
EqwAfterArg:
            :: EqwCurLeaf? ITE                   * 69495
              :: EqwBox#18@ EqwIdxOp? NOTcase EqwCurBox@ * 694A4
                EqwFrm5@ EqwBoxLast@ EqwBoxLeaf? IT * 694BD
                :: EqwDupBox#18@ #0=case EqwBoxParent@ * 694D1
                  RDROP ;                        * 694E5
                OBJ_694F9 ;                      * 694EF

* refs (1): 694EF
OBJ_694F9:
              :: EqwTreeRange EqwMaxIdxBox ;     * 694F9
              DUP#0=csDROP ~EqwStkSize@;EqwStkFree@;#- BINT34 GETLAM OVER#< * 6950D
              NOTcase2DROP DUP                   * 69526
              BINT34 PUTLAM #80000+ EqwBox#18! ; * 69530
            OBJ_69941 EqwArgDone                 * 69549

* refs (3): 6906B 690A2 69A45
* Probably: compare the new token's precedence with the top frame's
OBJ_69553:
            :: FALSE BINT0 COLA EqwSeparator~1   * 69553
            ;                                    * 6956C
            2DROP BINT6 EQcasedrop OBJ_69996     * 69571
            BINT8 #- ZERO_DO                     * 69585

* refs (3): 68931 6E3AC 6E3B1
* -> : take one off item 1 of the top frame
EqwFrmArg-1:
            :: EqwFrames EqwDupFrmN1@ #1- EqwFrmN1! ; LOOP OBJ_67F45 * 69594
            ~BINT0;1PUTLAM ;                     * 695BC
        ;                                        * 695C6

* refs (3): 6BF83 6C0FF 6C163
OBJ_695CB:
        :: EqwNoArg? 18GETLAM NOT OR caseFALSE EqwFrames * 695CB
          #0= caseFALSE tok=                     * 695EE
          BINT7 OBJ_69620 tokrparen BINT5 OBJ_69620 NoDecSep BINT6 * 695FD

* refs (2): 69602 69611
OBJ_69620:
          :: OBJ_69659 NOTcaseDROP RDROP         * 69620
            caseTRUE DROPFALSE                   * 69634
          ;                                      * 6963E
          FALSE ;                                * 69643

* refs (1): 698F6
* As OBJ_69659, for the = check
OBJ_6964D:
        CON(5)  (*)+5                            * 6964D  primitive code object
        ASSEMBLE
        ST=1    2                                * 69652
        GOTO    OBJ_69659.L1                     * 69655

* refs (3): 69011 6941D 69625
* Probably: #n -> #n flag: may the top frame's operator take this separator
OBJ_69659:
        CON(5)  (*)+5                            * 69659  primitive code object
        ST=0    2                                * 6965E
OBJ_69659.L1:
        GOSBVL  POP#                             * 69661
        D1=D1-  5                                * 69668
        D=D-1   A                                * 6966B
        ASRC                                     * 6966D
        GOSBVL  EqwTopFrame2                     * 69670
        D0=D0+  10                               * 69677
OBJ_69659.loop2:
        D0=D0+  5                                * 6967A
        A=DAT0  A                                * 6967D
        D0=D0-  15                               * 69680
        LC(5)   x=                               * 69683
        ?C#A    A                                * 6968A
        GOYES   OBJ_69659.L4                     * 6968D
        ?ST=0   2                                * 6968F
        GOYES   OBJ_69659.L3                     * 69692
        GOTO    OBJ_69659.L13                    * 69694
OBJ_69659.L3:
        LC(5)   FALSE                            * 69698
        R0=C                                     * 6969F
        LA(5)   TRUE                             * 696A2
        GOTO    OBJ_69659.L11                    * 696AC
OBJ_69659.L4:
        C=DAT0  A                                * 696B0
        CD0EX                                    * 696B3
        D0=D0+  5                                * 696B6
        A=DAT0  A                                * 696B9
        D0=C                                     * 696BC
        ?A#0    A                                * 696BF
        GOYES   OBJ_69659.L5                     * 696C2
        GOTO    OBJ_69659.L12                    * 696C4
OBJ_69659.L5:
        D0=D0+  10                               * 696C8
        C=DAT0  A                                * 696CB
        CD0EX                                    * 696CE
        RSTK=C                                   * 696D1
        D0=D0+  5                                * 696D3
        C=DAT0  A                                * 696D6
        C=C-CON A,8                              * 696D9
        GONC    OBJ_69659.L7                     * 696DF
OBJ_69659.loop6:
        C=RSTK                                   * 696E2
        A=C     A                                * 696E4
        LC(5)   #00019                           * 696E6
        A=A+C   A                                * 696ED
        D0=A                                     * 696EF
        GOTO    OBJ_69659.loop2                  * 696F2
OBJ_69659.L7:
        C=C-A   A                                * 696F6
        GOC     OBJ_69659.loop6                  * 696F8
        D0=D0+  6                                * 696FB
        CD0EX                                    * 696FE
        C=C+A   A                                * 69701
        D0=C                                     * 69703
        C=DAT0  S                                * 69706
        ?C=A    S                                * 6970A
        GOYES   OBJ_69659.loop10                 * 6970D
        CPEX    15                               * 6970F
        ?P=     0                                * 69713
        GOYES   OBJ_69659.loop9                  * 69716
        ?P=     2                                * 69718
        GOYES   OBJ_69659.loop9                  * 6971B
        ?P=     3                                * 6971D
        GOYES   OBJ_69659.loop9                  * 69720
        CPEX    15                               * 69722
        CAEX    S                                * 69726
        P=      7                                * 69729
        CPEX    15                               * 6972B
        ?C<A    S                                * 6972F
        GOYES   OBJ_69659.L8                     * 69732
OBJ_69659.L8:
        CPEX    15                               * 69734
        CAEX    S                                * 69738
        P=      0                                * 6973B
        GOC     OBJ_69659.L12                    * 6973D
OBJ_69659.loop9:
        C=R2                                     * 69740
        D0=C                                     * 69743
        LC(5)   FALSE                            * 69746
        DAT1=C  A                                * 6974D
        A=DAT0  A                                * 69750
        D0=D0+  5                                * 69753
        PC=(A)                                   * 69756
OBJ_69659.loop10:
        LC(5)   TRUE                             * 6975A
        A=C     A                                * 69761
        R0=C                                     * 69763
OBJ_69659.L11:
        C=R2                                     * 69766
        D0=C                                     * 69769
        C=R0                                     * 6976C
        DAT1=C  A                                * 6976F
        PC=(A)                                   * 69772
OBJ_69659.L12:
        C=0     S                                * 69776
        P=      7                                * 69779
        CPEX    15                               * 6977B
        ?C=A    S                                * 6977F
        GOYES   OBJ_69659.loop9                  * 69782
        GONC    OBJ_69659.loop10                 * 69784
OBJ_69659.L13:
        C=DAT0  A                                * 69787
        CD0EX                                    * 6978A
        D0=D0+  5                                * 6978D
        A=DAT0  A                                * 69790
        A=A-1   A                                * 69793
        ?A=0    A                                * 69795
        GOYES   OBJ_69659.loop10                 * 69798
        GONC    OBJ_69659.loop9                  * 6979A
        RPL

* refs (1): 6870B
EqwParseStep~4:
        :: TRUE 18PUTLAM 8GETLAM nultrior EqwParseStep~8 DROP GetGNTData * 6979D
          ngsizecase                             * 697C5

* refs (3): 6880A 697E3 69810
EqwParseStep~5:
          :: failed 2RDROP ;                     * 697CA
          delimcase EqwParseStep~5               * 697DE
          DUP $>ID DUP undo ITE Id>Lam CompileId? * 697E8
          NOTcasedrop EqwParseStep~5             * 6980B
          5UNROLL DROP GetNextToken              * 69815

* refs (3): 68E59 69034 693D2
* -> : read one token, clamped at the end of the text
EqwTokenRead:
          :: nultrior NOP ?NumTok NOP 3PICK LEN$ 3PICKSWAP #> NOT?SEMI * 69824
            LEN$ #- NULL$ ;                      * 69856
          PutGNTData                             * 6986A

* refs (1): 68BF7
* ob -> : add an operand: push it, make its box, close finished operators
EqwOperandBox:
          :: EqwDupStkPush EqwOperandText OBJ_67F45 EqwAfterArg OBJ_69941 ; * 6986F
          :: OBJ_69A31 NOP NOP ; 8GETLAM DUPNULL$? case2DROP EQUAL * 69892
          ?SEMI                                  * 698BF
          EqwUndoClr ;                           * 698C4

* refs (2): 689BD 68B93
OBJ_698CE:
        ::                                       * 698CE

* refs (2): 69007 69413
OBJ_698D3:
          :: EqwNoArg? NOT?SEMI                  * 698D3
            RDROP AlgFail ;                      * 698E2
          BINT7 OBJ_6964D                        * 698F1

* refs (6): 69016 6901B 69422 69427 699CD 699E1
OBJ_698FB:
          :: ?SEMI                               * 698FB
            RDROP AlgFail ;                      * 69905
          DROP EqwNextToken OBJ_69928 ;          * 69914

* refs (2): 6991E 69937
OBJ_69928:
        :: RDROP EqwCloseArg OBJ_69928 EqwAfterArg * 69928

* refs (8): 68904 68BCA 69066 693E1 69549 69888 ...
OBJ_69941:
          :: EqwArgDone                          * 69941

* refs (2): 6907F 6999B
* -> : add one to item 1 of the top frame
EqwFrmArg+1:
            :: EqwFrames EqwDupFrmN1@ #1+ EqwFrmN1! ; ; * 6994B

* refs (4): 69084 690C5 6954E 69946
* -> : an argument is finished: run the hook of the top frame's operator; state 0 adds a right parenthesis instead
EqwArgDone:
          :: EqwFrm1@ DUP#0=csedrp EqwAddRParen EqwFrm4@ EqwOpOf EqwRunHook ; * 6996E

* refs (2): 69089 69580
OBJ_69996:
          :: EqwFrmArg+1 OBJ_67F45 ~BINT0;1PUTLAM ; ; * 69996

* refs (1): 68BA2
EqwToken~2:
        ::                                       * 699B4

* refs (8): 4EC8A 6914C 695D0 698D8 6E695 6E6A9 ...
* -> flag: TRUE when no operand has been read (lam 1 is 0)
EqwNoArg?:
          :: 1GETLAM #0= ; OBJ_698FB EqwFrm4@ 'CmpRectOp EQ OBJ_698FB * 699B9
          EqwNextToken EqwFrames 'CmpPolarOp EqwFrmN4! EqwBoxCount * 699E6
          EqwBoxPrev@ DUP ListSepChr CHR>$ tokanglesign &$ EqwTextGrob * 699FF
          OBJ_44DFE EqwRelayout ;                * 69A22

* refs (4): 68706 68AFD 69897 69B0D
OBJ_69A31:
        :: EqwFrm1@ #0=case 3SKIP                * 69A31
          OBJ_69553 NOTcase 2skipcola            * 69A45
          DROP OBJ_27D32 3SKIP COLA OBJ_27D9A    * 69A54
          :: toklparen COLAskipcola ;            * 69A6D
          :: tokrparen COLAskipcola ;            * 69A81
          :: NoDecSep COLAskipcola ;             * 69A95
          :: tok= COLAskipcola ; OBJ_69B17 8GETLAM AlgSep? ITE * 69AA9
          :: OBJ_69941 EqwNextToken ; BINT7      * 69AD1
          BINT8 #- EqwFrames EqwDupFrmN1@ ROT#- EqwFrmN1! COLA OBJ_69A31 * 69AEA
        ;                                        * 69B12

* refs (1): 69ABD
OBJ_69B17:
        :: OBJ_69941 COLA 3SKIP                  * 69B17
        ;                                        * 69B2B

* refs (2): 5D04F 5D054
~DUP#1+PICK;#+;#1+:
        :: DUP#1+PICK #+ #1+ ;                   * 69B30

* refs (4): 69DDE 69ED4 6A16D 6C43D
* -> : run the subexpression selection environment. Its lams: 'LB selected box, 'TE and 'LE top and left edge of the view, 'FOK display up to date, 'EL whole expression highlighted, 'NG what the highlight covers
EqwSelect:
        :: ERRORCLR ClrDA1IsStat XLIB ~'R;STO 'LB TOPROW XLIB ~'R;STO 'TE * 69B49
          LEFTCOL XLIB ~'R;STO 'LE FALSE' 'FOK STO FALSE' 'EL STO ' * 69B7D
          ::                                     * 69BB5

* refs (2): 69C32 6C8B9
* Display action of the selection environment: menu, then the highlight
EqwSelDisplay:
            :: DA3OK? ?SEMI                      * 69BBA
              DispMenu SetDA3NoCh ;              * 69BC9
            'FOK ?SEMI                           * 69BD8
            TRUE' 'FOK STO EqwPlaceAll EqwAllUndrawn ~'LB;EqwSelectBox ; * 69BE2
          ' EqwSelKey TrueTrue 5ROLL ONEFALSE' GraphicExit 'ERRJMP ClrDA3OK * 69C05
          ParOuterLoop EqwSelDisplay ExitFcn     * 69C2D

* refs (3): 6A900 6BBEF 6BC4B
* -> : leave the selection environment, then run the next object
EqwSelExit:
          :: EXITFCNsto NOP ; FALSE 19PUTLAM COLA_EVAL ; * 69C3C

* refs (24): 596CE 59718 59766 597B0 59836 59880 ...
* EquationWriter RULES key: take the next runstream object as the rule ('ManOp), 'ploc = 0, and apply it
EqwRuleKey0:
        :: TakeOver BINT0                        * 69C64

* refs (1): 69CC0
EqwRuleKey3~1:
          XLIB ~'R;STO 'ploc SetDA3NoCh 'R XLIB ~'R;STO 'ManOp EXITFCNsto * 69C73
          EqwRuleKey0~1 ;                        * 69CA2

* refs (19): 59999 599B2 599E8 59A01 59A37 59A50 ...
* As EqwRuleKey0, with 'ploc = 3 (the move rules)
EqwRuleKey3:
        :: TakeOver BINT3 GOTO EqwRuleKey3~1 ;   * 69CAC

* refs (3): 69E98 6ADF2 6B1F6
* obs #n -> : show the rule's result: rebuild the expression from the new objects
EqwRuleDone:
        :: OBJ_6B0E8 SYMBN 1PUTLAM EqwDropToMark EqwCurBox@ 1GETABND * 69CCA
          ZEROSWAP                               * 69CED

* refs (1): 6A014
EqwRuleKey0~10:
          :: CLEARVDISP REDISPHBUFF NULL$ TRUE EqwInit ERRSET EqwMarkDepth * 69CF2
            #2+PICK EqwSize! EqwMarkOb ERRSET XLIB EqwRuleDone~1 ERRTRAP * 69D1A
            :: OBJ_6AE6F OBJ_6AE6F OBJ_6AE6F 3DROP EqwDropToMark * 69D3E
              EqwMarkDepth #0=?SKIP ABND EqwDropToMark ERRJMP ; * 69D5C
          ;                                      * 69D7A
          OBJ_6AE6F EqwSlotsDrop1 OBJ_6AE6F DROP EqwSlotsDrop1 OBJ_6AE6F * 69D7F
          EqwSlotsDrop1 SWAP EqwDecomp 10PUTLAM EqwDrawAll * 69D9D
          ~EqwStkSize@;EqwStkFree@;#- SWAP#- #1+ EqwIdxBox DUP 18PUTLAM * 69DB6
          EqwSelOb SWAPCOLA EqwSelect ;          * 69DD4

* refs (1): 69CA2
EqwRuleKey0~1:
        :: OBJ_6AF46 DUP 4PUTLAM DUP#2+PICK 5PUTLAM * 69DE8
          ~EqwStkSize@;EqwStkFree@;#- #3+ NDUP EqwRuleArgs DUP 2PUTLAM DUP * 69E06
          4GETLAM #- 6PUTLAM DUP#2+PICK 7PUTLAM ~EqwStkSize@;EqwStkFree@;#- * 69E29
          #3+ NDROP                              * 69E47
          :: 'ManOp EVAL                         * 69E51
            :: 'NOP XLIB ~'R;STO 'ManOp DoBadKey ; ; * 69E60
          3GETLAM #0<> case EqwRuleDone          * 69E89
          'ManOp 'NOP EQ case                    * 69E9D
          :: OBJ_6B0E8 NDROP EqwSelOb 'LB EqwRuleKey0~8 COLA EqwSelect * 69EB1
          ;                                      * 69ED9

* refs (1): 69E15
* -> obs #n: the selected subexpression as a meta object, extended to the enclosing operator where needed
EqwRuleArgs:
          :: 'LB EqwSelIdx EqwIdxObj OBJ_6AEF1 IT EqwRuleKey0~11 * 69EDE
            EqwBoxParent@ #1= ?SEMI              * 69F01
            rot DUP#0=case unrot                 * 69F10
            DUP#2+ BINT1 splitdown DROP #1- 1PUTLAM top& top& 1GETLAM * 69F1F
            tailpsh pZpargSWAPUn ;               * 69F4C
          DUP#1+ NDUP 6GETLAM 5GETLAM 2GETLAM 7GETLAM #+ EqwIdxBox DUP * 69F5B
          7PUTLAM DUP                            * 69F88

* refs (2): 69EFC 6A3A2
EqwRuleKey0~11:
          :: BEGIN EqwBoxParent@ EqwDupBox#18@ EqwNoIdx? NOT_UNTIL ; DUP#1= * 69F92
          ITE DROP SWAPDROP                      * 69FBA
          EqwStkSize@ EqwBoxCount EqwFrmSize@ EqwBoxesFree@ EqwFrmFree@ * 69FC9
          EqwBoxTab@ 2GETLAM EqwSlotArea@ BINT11 {}N OVER#2+UNROL 7GETLAM * 69FE2
          EqwBoxSize@ OVER#2+UNROL SYMBN EqwRuleKey0~10 * 6A005
          ~EqwStkSize@;EqwStkFree@;#- 3PUTLAM DROP EqwBoxCount#1- {}N * 6A019
          SWAPDROP EqwStkFree@ EqwPastFrames DUPUNROT #2+UNROLL NDROP * 6A032
          1PUTLAM ~EqwStkSize@;EqwStkFree@;#- SYMBN 5PUTLAM 3DROP INCOMPDROP * 6A050
          EqwSlotArea! ~EqwStkSize@;EqwStkFree@;#- SWAP#- 8PUTLAM BINT1 * 6A06E
          EqwBoxFirst@ 11PUTLAM EqwBoxTab@ BINT43 EqwBoxCount Eqw#42* SUBHXS * 6A087
          12PUTLAM EqwBoxTab! EqwFrmFree! EqwBoxesFree! EqwFrmSize! * 6A0AA
          EqwBoxCount! DUP EqwStkSize! EqwStkFree! 4PUTLAM BINT27 PUTLAM * 6A0C3
          22PUTLAM NDROP DUP 7PUTLAM 5GETLAM INNERCOMP OBJ_6B0E8 * 6A0E6
          EqwRuleKey0~9 1GETLAM 4GETLAM EqwRuleKey0~2 BINT27 GETLAM 3GETLAM * 6A109
          22Lget #- #+ EqwIdxBox ABND DUP 18PUTLAM EqwRelayout CLEARVDISP * 6A12C
          EqwDrawAll EqwSelOb 'LB COLA EqwSelect * 6A159
        ;                                        * 6A172

* refs (1): 6A118
EqwRuleKey0~2:
        :: DUP 4PUTLAM EqwDupBoxPlaceH@ 15PUTLAM EqwDupBoxParent@ 9PUTLAM * 6A177
          EqwDupBoxNext@ 5PUTLAM EqwDupBoxPrev@ 6PUTLAM DUP EqwTreeRange ROT * 6A19A
          #MIN SWAPDUP 10PUTLAM #1+DUP 2PUTLAM SWAPDUP 1PUTLAM 11GETLAM * 6A1BD
          OVER#+ #2- 11PUTLAM 2DUP #- 4PICK LENCOMP DUP 14PUTLAM * 6A1E5
          EqwRuleKey0~3 2GETLAM 13GETLAM #+ DUP 2PUTLAM 1GETLAM DUP#2- * 6A212
          DUP#0=ITE                              * 6A23A
          :: ROTROT2DROP EqwRuleKey0~5 3GETLAM ; EqwRuleKey0~4 #80000+ OVER * 6A23F

* refs (3): 6953A 6A25D 6EA46
* #v -> #v + #80000: set the operator bit of a value of field +18
#80000+:
          :: # 80000 #+ ; 1GETLAM BINT2          * 6A267

* refs (1): 6A30C
OBJ_6A28A:
          :: 2DUP#= 8GETLAM #0= ORcase 2DROP     * 6A28A
            DO INDEX@ EqwDupBox#18@ DUP EqwNoIdx? IT #1+ * 6A2A8
            DUP 4PICK #>ITE                      * 6A2CB
            :: 8GETLAM #+ EqwBox#18! ; 2DROP LOOP ; * 6A2DA
          EqwBoxCount#1+ 2GETLAM OBJ_6A28A DROP 2GETLAM 1GETLAM DO INDEX@ * 6A302
          EqwDupBox#18@ DUP#0= OVER EqwIdxOp? NOT OR OVER EqwNoIdx? OR ?SKIP * 6A32A
          4PICK#+                                * 6A35C
          3PICK OVER#= IT                        * 6A361
          :: ROTDROP OVERSWAP ;                  * 6A370
          EqwBox#18! LOOP SWAPDROP DUP 14GETLAM #1=?SKIP EqwRuleKey0~11 * 6A384
          15GETLAM OVER EqwBoxPlaceH! '          * 6A3A7
          :: 4GETLAM BINT1 ; '                   * 6A3BB
          :: 10GETLAM BINT2 ; 13GETLAM EqwIdxOp? IT SWAP * 6A3D4
          ROTSWAP OBJ_6A40B SWAP                 * 6A3FC

* refs (1): 6A401
OBJ_6A40B:
          :: EVAL 3UNROLL 1GETLAM BINT1 EqwShiftLinks EqwBoxCount#1+ 2GETLAM * 6A40B
            EqwShiftLinks DROPSWAPDROP ;         * 6A433
          2DROP ;                                * 6A442

* refs (1): 6A212
EqwRuleKey0~3:
        :: 12GETLAM EqwBoxTab@ DUP BINT1 7ROLL #1- Eqw#42* SUBHXS ROT &HXS * 6A44C
          SWAP 5ROLL #1- Eqw#42* #1+ MINUSONE SUBHXS &HXS EqwBoxTab! 2DUP * 6A483
          SWAP#- 13PUTLAM 2DUP#= ITE 2DROP       * 6A4B5
          :: 2DUP#< casedrop                     * 6A4CE
            :: EqwKidsLevel 2GETLAM #1-- #+ 13GETLAM EqwSlotsInsert ; * 6A4DD
            #- EqwKidsLevel 2GETLAM #-SWAP ZERO_DO DUP#1+ ROLLDROP * 6A505
            EqwSlotsDrop1 LOOP DROP ;            * 6A528
          EqwBoxCount 13GETLAM #+ EqwBoxCount! EqwBoxCount 1GETLAM #1-- SWAP * 6A53C
          INNERCOMP DUP#2+ ROLL OVER#+ #1+ #5* EqwRuleKey0~7 NDROP ; * 6A564

* refs (1): 6A258
EqwRuleKey0~4:
        :: ZEROZERO ROT 5ROLL 5ROLL              * 6A591

* refs (3): 6A424 6A433 6EDDE
* Move the links of the boxes in a range by the number of boxes added (lam 13)
EqwShiftLinks:
          :: 2DUP#= case2DROP DO                 * 6A5AA
            INDEX@ 13GETLAM EqwRuleKey0~6 LOOP ; * 6A5BE
          3DROP                                  * 6A5D7

* refs (1): 6A249
EqwRuleKey0~5:
          :: 1GETLAM 11GETLAM DUP 6GETLAM OBJ_6A61D EqwBoxPrev! DUP 5GETLAM * 6A5DC
            OBJ_6A61D EqwBoxNext! DUP 9GETLAM    * 6A609

* refs (2): 6A5F5 6A609
OBJ_6A61D:
            :: 4PICKOVER #< NOT?SEMI             * 6A61D
              13GETLAM #+ ;                      * 6A631
            EqwBoxParent! 2DROP ;                * 6A640
          7GETLAM 3GETLAM OVER#+ ;               * 6A64F

* refs (1): 6A5C8
EqwRuleKey0~6:
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
EqwRuleKey0~6.loop1:
        GOSUB   SUB_6A6C0                        * 6A6A8
        P=P-1                                    * 6A6AC
        GONC    EqwRuleKey0~6.loop1              * 6A6AE
        P=      0                                * 6A6B1
        D=D-1   A                                * 6A6B3
        D=D-1   A                                * 6A6B5
        D=D-1   A                                * 6A6B7
        GOVLNG  EqwBoxPlaceH!.L1                 * 6A6B9

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
        GOC     SUB_6A6D4.L2                     * 6A6DA
        C=C-1   S                                * 6A6DD
        GOC     SUB_6A6D4.L3                     * 6A6E0
        ?C>=A   X                                * 6A6E3
        RTNYES                                   * 6A6E6
        C=R1                                     * 6A6E8
SUB_6A6D4.loop1:
        A=A+C   X                                * 6A6EB
        RTN                                      * 6A6EE
SUB_6A6D4.L2:
        ?A=0    X                                * 6A6F0
        RTNYES                                   * 6A6F3
        GONC    SUB_6A6D4.loop1                  * 6A6F5
SUB_6A6D4.L3:
        ?C#A    X                                * 6A6F8
        RTNYES                                   * 6A6FB
        A=R3.F  X                                * 6A6FD
        RTN                                      * 6A703

* refs (1): 68FA3
* #b -> #lo: follow first-child links down the numbering
EqwFirstLeaf:
        CON(5)  (*)+5                            * 6A705  primitive code object
        ST=1    1                                * 6A70A
EqwFirstLeaf.L1:
        GOSBVL  POP#                             * 6A70D
        CD0EX                                    * 6A714
        R2=C                                     * 6A717
EqwFirstLeaf.loop2:
        R3=A                                     * 6A71A
        GOSBVL  EqwA+1>Box                       * 6A71D
        D0=D0-  3                                * 6A724
        ?ST=0   1                                * 6A727
        GOYES   EqwFirstLeaf.L3                  * 6A72A
        D0=D0-  3                                * 6A72C
EqwFirstLeaf.L3:
        C=DAT0  X                                * 6A72F
        ?C=0    X                                * 6A733
        GOYES   EqwFirstLeaf.L5                  * 6A736
        A=R3                                     * 6A738
        ?ST=0   1                                * 6A73B
        GOYES   EqwFirstLeaf.L4                  * 6A73E
        ?C>A    X                                * 6A740
        GOYES   EqwFirstLeaf.L5                  * 6A743
EqwFirstLeaf.L4:
        ?C<A    X                                * 6A745
        GOYES   EqwFirstLeaf.L5                  * 6A748
        A=0     A                                * 6A74A
        A=C     X                                * 6A74C
        GOTO    EqwFirstLeaf.loop2               * 6A74F
EqwFirstLeaf.L5:
        A=R3                                     * 6A753
        GOVLNG  EqwBoxParent@.L2                 * 6A756

* refs (1): 68F94
* #b -> #hi: follow last-child links up the numbering
EqwLastLeaf:
        CON(5)  (*)+5                            * 6A75D  primitive code object
        ST=0    1                                * 6A762
        GOTO    EqwFirstLeaf.L1                  * 6A765

* refs (1): 6A582
EqwRuleKey0~7:
        CON(5)  (*)+5                            * 6A769  primitive code object
        GOSBVL  POP#                             * 6A76E
        R0=A                                     * 6A775
        GOSBVL  SAVPTR                           * 6A778
        GOSBVL  POP#                             * 6A77F
        A=A-1   A                                * 6A786
        GOC     EqwRuleKey0~7.L2                 * 6A788
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
EqwRuleKey0~7.loop1:
        A=DAT0  A                                * 6A7A8
        DAT1=A  A                                * 6A7AB
        D1=D1-  5                                * 6A7AE
        D0=D0-  5                                * 6A7B1
        B=B-1   A                                * 6A7B4
        GONC    EqwRuleKey0~7.loop1              * 6A7B6
EqwRuleKey0~7.L2:
        GOVLNG  GETPTRLOOP                       * 6A7B9
        RPL

* refs (1): 69C0A
* #key #plane -> ...: key handler of the selection environment; the key tables are at #6B3F5
EqwSelKey:
        :: BINT4 OVER#= case2drop 'DoBadKeyT     * 6A7C0
          OVER BINT7 #< case2drpfls OVER         * 6A7D9
          BINT12 #=case                          * 6A7F2
          :: SWAPDROP BINT1 ?CaseKeyDef          * 6A7FC
            :: TakeOver DoNextRow DispMenu ; BINT2 ?CaseKeyDef * 6A810
            :: TakeOver DoPrevRow DispMenu ; BINT3 ?CaseKeyDef * 6A833
            :: TakeOver DoFirstRow DispMenu ; DROPDEADTRUE ; * 6A856
          BINT3 #=casedrop                       * 6A879
          :: ByteTab>Ob EqwSelKey~1 ;            * 6A883
          BINT2 #=case                           * 6A897
          :: ByteTab>Ob EqwSelKey~2 ;            * 6A8A1
          ByteTab>Ob EqwSelKey~3 ;               * 6A8B5

* refs (1): 6B42C
* Right-shift left arrow: leave the menu off and scroll the picture
EqwSelView:
        :: TakeOver WINDOWCORNER PictScroll TURNMENUON WINDOWXY ; * 6A8C4

* refs (1): 6B466
* ENTER in the selection environment: leave it
EqwSelEnter:
        :: EXITFCNsto EqwSelEnter~1 ;            * 6A8E7

* refs (1): 6A8F1
EqwSelEnter~1:
        :: EqwSelExit RECLAIMDISP FALSE XLIB ~'R;STO 'KO 11GETLAM 10GETLAM * 6A8FB

* refs (1): 6AB31
EqwSelMenu~2:
          :: DUPLEN$ #1+ NULL$ ; ;               * 6A929

* refs (2): 6B45F 6BA1A
* -> : STO key: a copy of the display grob goes on the user's stack, below the marker
EqwGrobToStack:
        :: TakeOver HARDBUFF TOTEMPOB            * 6A947

* refs (7): 6ABAE 6ADA7 6AE24 6B129 6BAB5 6C4F1 ...
* ob -> : put an object just below the stack marker, on the user's stack
EqwUnderMark:
          :: EqwMarkDepth UNROLL ;               * 6A95B

* refs (3): 6AE29 6BAD3 6D4F6
* -> : count one more slot in the slot area
EqwSlotsAdd1:
          :: BINT1 EqwSlotArea+ DROP ; EqwGrobToStack~1 ; * 6A96F

* refs (1): 461E1
* Menu of the selection environment: RULES EDIT EXPR SUB REPL EXIT
EqwSelMenu:
        :: NoExitAction                          * 6A992
          {                                      * 6A99C
            {                                    * 6A9A1
              :: PTR DirLabel:                   * 6A9A6

RULES:
                $ "RULES" ;                      * 6A9B0
              EqwMenuRules }                     * 6A9C9
            {                                    * 6A9D3

EDIT:
              $ "EDIT" EqwMenuEdit }             * 6A9D8
            {                                    * 6A9F4

EXPR:
              $ "EXPR" EqwMenuExpr }             * 6A9F9
            {                                    * 6AA15

SUB:
              $ "SUB" EqwMenuSub }               * 6AA1A
            {                                    * 6AA34

REPL:
              $ "REPL" EqwMenuRepl }             * 6AA39
            { $_EXIT                             * 6AA55
              { EqwMenuExit EqwSelMenu~1 } }     * 6AA5F
          }                                      * 6AA78
        ;                                        * 6AA7D

* refs (1): 6AA69
EqwSelMenu~1:
        :: TakeOver BINT1 EqwFrmN1@ #1<> caseDoBadKey EqwFrm5@ * 6AA82
          EqwBoxLast@ DUP EqwCurBox! EqwBoxFirst@ * 6AAA5

* refs (2): 6EA32 6F88D
* #b -> flag: TRUE when the box's size handler is that of a parenthesised group (OBJ_44C3C)
EqwParens?:
          :: EqwBoxSizeH@ EqNext? OBJ_44C3C ; ?SKIP EqwAddParens * 6AAB9
          EqwUndoClr BINT0 EqwSize! CLEARVDISP EqwRedraw * 6AADC

* refs (1): 6AB72
EqwMenuExit~1:
          :: ClassTblAlg EqwCopyMeta SYMBN EqwDecomp ; EXITFCNsto * 6AAF5
          :: toklparen SWAP&$ tokrparen &$ EqwSelMenu~2 ~BINT1;1PUTLAM * 6AB18

* refs (1): 6ABC7
EqwMenuExit~2:
            :: ~EqwStkSize@;EqwStkFree@;#- BINT34 PUTLAM ; ; * 6AB3B
        ;                                        * 6AB59

* refs (1): 6AA64
* EXIT: back to typing, the expression as text in the input buffer
EqwMenuExit:
        :: TakeOver EXITFCNsto                   * 6AB5E
          :: EqwMenuExit~1 DUPLEN$ ~EqwStkSize@;EqwStkFree@;#- #1= ITE * 6AB6D
            :: DROP ONESWAP NULL$ 3UNROLL ; OBJ_6E645 * 6AB8B
            EqwUnderMark EqwMenuExit~3 DROPSWAPDROP 10PUTLAM EqwRestart * 6ABAE
            EqwMenuExit~2 FALSE BINT30 PUTLAM ERRSET * 6ABC7
            :: EqwKeyLoop ; ERRTRAP              * 6ABE0
            :: OBJ_6AE6F EqwSlotsDrop1 ERRJMP ; TRUE BINT30 PUTLAM OBJ_6AE6F * 6ABF4
            EqwSlotsDrop1 EqwAddText GetGNTData ; * 6AC21
        ;                                        * 6AC35

* refs (2): 6AA0B 6B46D
* EXPR: highlight the whole subexpression, or go back to the single box
EqwMenuExpr:
        :: TakeOver 'EL case                     * 6AC3A
          :: Eqw'EL!F EqwHiliteExpr ~'LB;EqwSelectBox ; * 6AC4E

* refs (3): 69EE8 6AEAB 6AFD2
* -> #i: the selected box's place in the object stream
EqwSelIdx:
          :: 'LB EqwBox#18@ EqwIdxMask ;         * 6AC67

* refs (4): 69EED 6AEB5 6F8A6 6FE9B
* #i -> ob: the object at place i; for FCNAPPLY the function
EqwIdxObj:
          :: ~EqwStkSize@;EqwStkFree@;#- SWAP#- OBJ_6731D #1-+ DUP#1+PICK * 6AC80
            DUP' xFCNAPPLY EQ NOTcase SWAPDROP   * 6AC9E
            SWAP #3+PICK DUPTYPEROMP? NOTcaseDROP SWAPDROP * 6ACB7
          ;                                      * 6ACD0
          OBJ_6AEF1 NOT?SEMI                     * 6ACD5
          EqwRestoreGrob TRUE' 'EL STO           * 6ACDF

* refs (2): 6AC58 6F5D6
* -> : highlight the selected box's whole expression
EqwHiliteExpr:
          :: 'LB EqwBoxParent@ EqwDupBox#18@ EqwNoIdx? IT EqwBoxParent@ * 6ACF3
            EqwDupBoxXY@                         * 6AD16

* refs (1): 44DDB
* #b -> : invert a box's rectangle on the display
EqwInvertBox:
            :: 2DUP5ROLL EqwBoxWH@ 4PICK ROT#+ 3PICK ROT#+ HARDBUFF 5UNROLL ; * 6AD1B
            SUBGROB INVGROB XYGROBDISP ;         * 6AD4D
        ;                                        * 6AD61

* refs (1): 6AA4B
* REPL: replace the selected subexpression by the object in level 1
EqwMenuRepl:
        :: TakeOver EqwCheckStack EqwMarkOb OBJ_6B28C NOTcasedrop * 6AD66

* refs (2): 6ADCF 6C2DF
* -> : flash message #202 (Bad Argument Type)
EqwBadArg:
          :: # 202 EqwFlash ;                    * 6AD84
          OBJ_6AE6F DROP EqwUnderMark OBJ_6AF46 EqwMenuRepl~1 case * 6AD9D
          :: NDROP NDROP NDROP EqwBadArg ;       * 6ADBB
          NDROP OBJ_6AE6F EqwMenuRepl~2 EXPLODE EXITFCNsto EqwRuleDone ; * 6ADD9

* refs (1): 6AA2A
* SUB: copy the selected subexpression to the stack
EqwMenuSub:
        :: TakeOver OBJ_6AF46 EqwMeta>Symb OVER#2+UNROL NDROP OVER#2+UNROL * 6ADFC
          NDROP EqwUnderMark EqwSlotsAdd1 DEPTHSAVE@ #5+ DEPTHSAVE! ; * 6AE1F

* refs (4): 6ABC2 6BB6D 6C258 6E861
* $ -> : start the writer again on the given text
EqwRestart:
        :: RECLAIMDISP EqwDropToMark BINT23 GETLAM 10GETLAM Lpop;true * 6AE42
          EqwInit ERRSET                         * 6AE65

* refs (14): 69D43 69D48 69D4D 69D7F 69D89 69D98 ...
* Probably: bring the object stored under the EquationWriter's stack marker up to level 1
* Bring the object stored just above the EquationWriter's stack marker up to level 1
OBJ_6AE6F:
          :: EqwMarkDepth #1+ROLL ; BINT23 PUTLAM EqwSlotsDrop1 * 6AE6F
          EqwParsePending ;                      * 6AE92

* refs (1): 6A9C9
* RULES: show the rules menu of the selected operator
EqwMenuRules:
        :: TakeOver                              * 6AE9C

* refs (3): 69DD4 69EC0 6A15E
* -> ob: the selected object
EqwSelOb:
          :: EqwSelIdx DUP EqwIdxObj DUP' xFCNAPPLY EQITE * 6AEA6
            :: DROP EqwMarkDepth SWAP#- #1+PICK ; SWAPDROP DUP * 6AEC9

* refs (4): 69EF2 6ACD5 6BEB1 6EBEA
OBJ_6AEF1:
            :: OBJ_6E026 NOTcsdrpfls FnInfo NOTcsdrpfls 3DROP TRUE ; * 6AEF1
            NOTcasedrop {MenuRules}              * 6AF19
            EqwMenuRules~1 ;                     * 6AF23
          InitMenu DispMenu ;                    * 6AF2D

* refs (1): 6A9EA
* EDIT: edit the selected subexpression on the command line
EqwMenuEdit:
        :: TakeOver                              * 6AF3C

* refs (3): 69DED 6ADAC 6AE06
OBJ_6AF46:
          ::                                     * 6AF46

* refs (1): 6AAFF
* -> obs #n: copy the objects of the expression
EqwCopyMeta:
            :: EqwMarkDepth ~EqwStkSize@;EqwStkFree@;#- ZERO_DO DUPPICK SWAP * 6AF4B
              LOOP DROP ~EqwStkSize@;EqwStkFree@;#- ; * 6AF69
            DUP#2+ BINT2 DO INDEX@ PICK ' xPREDIV EQIT * 6AF7D
            :: INDEX@ ROLL INDEX@ PreDiv>/ UNROLL ; LOOP DUP EqwSelIdx #1-- * 6AFA5
            tailpsh pZpargSWAPUn ;               * 6AFDC
          dup                                    * 6AFEB

* refs (4): 6AE0B 6B5A6 6C1F4 84E13
* obs #n -> symb: make a symbolic from a meta object
EqwMeta>Symb:
          :: DUP#0=csedrp NULLSYMB pshzer BEGIN pullrev psh1&rev psh AlgFold * 6AFF0
            psh DUP#0= UNTIL DROP IMPLODE ;      * 6B01D
          EqwImplicit()? EqwImplicitOff SWAP EDITDECOMP$ SWAP IT * 6B03B
          EqwImplicitOn                          * 6B059
          $StripTicks DUP XLIB ~'R;STO 'unbound EqwImplicit()? * 6B05E
          EqwImplicitOff SWAP EqwEditLine NOTcase OBJ_6B0A5 * 6B07D
          'unbound EQUAL casedrop                * 6B096

* refs (2): 6B091 6B192
OBJ_6B0A5:
          :: ZEROZERO XLIB ~'R;STO 'TE XLIB ~'R;STO 'LE * 6B0A5

* refs (2): 6AC53 6F5D1
* -> : clear 'EL
Eqw'EL!F:
            :: FALSE' 'EL STO ;                  * 6B0CF

* refs (3): 69CCF 69EB6 6A104
OBJ_6B0E8:
            :: top& psh DUP#1+ EqwCurBox! top& ; NDROP EqwAllUndrawn * 6B0E8
            EqwDrawAll EqwAllUndrawn ~'LB;EqwSelectBox ; * 6B115
          EqwUnderMark                           * 6B129

* refs (1): 6ADB1
EqwMenuRepl~1:
          :: DUP#2+PICK OVER#+ #3+ DUP#1+PICK DUP#0=csedrp DROPFALSE #+ #1+ * 6B12E
            OBJ_5F5AD NOTcaseFALSE EqwMarkOb     * 6B15B
            dup;#nm? SWAPDROP ;                  * 6B16A
          OBJ_6AE6F SWAP casedrop                * 6B179

* refs (1): 6B1EC
OBJ_6B188:
          :: DoBadKey OBJ_6B0A5 ;                * 6B188
          OVER#2+UNROL NDROP OVER#0= 4PICK #0= AND SWAP EXPLODE OVER EqNext? * 6B19C
          x= OVER #3+ ROLL NOTAND case OBJ_6B188 * 6B1CE
          EXITFCNsto EqwRuleDone ;               * 6B1F1

* refs (2): 6B087 6C20D
* flag $ -> ...: edit text between ticks with InputLine, turning implicit parentheses on again afterwards when the flag says so
EqwEditLine:
        :: tok' SWAP&$ tok' &$ RECLAIMDISP NULL$SWAP DUPLEN$ BINT0 BINT2 * 6B200
          BINT0 EditMenu BINT1 TRUE BINT1 InputLine DispMenu ClrDA1IsStat * 6B232
          DOCLLCD NOTcase                        * 6B25A
          :: IT EqwImplicitOn                    * 6B264
            FALSE ;                              * 6B273
          ROT IT EqwImplicitOn                   * 6B27D

* refs (2): 6AD7A 84E4A
OBJ_6B28C:
          :: DUPTYPECOL? IT                      * 6B28C
            :: DUP CARCOMP                       * 6B29B

* refs (5): 6AAC3 6B1C9 6C3F7 6D1D1 6E37F
* ob -> flag: EQ with the next object in the runstream, which is skipped
EqNext?:
              :: 'R EQ ; x' NOT?SEMI             * 6B2AA
              DUPTWO NTHELCOMP NOT?SEMI          * 6B2C8
              SWAPDROP ;                         * 6B2D7
            ?OKINALG NOTcaseFALSE FnInfo         * 6B2E1
            NOTcaseTRUE 2DROPFALSE               * 6B2F0
          ;                                      * 6B2FA
          NOTcase2drop                           * 6B2FF
          :: DoBadKey FALSE ;                    * 6B304
          SWAP                                   * 6B318

* refs (2): 6B05E 6C2CB
* $ -> $: drop the leading and trailing tick of a decompiled algebraic
$StripTicks:
          :: DUP CAR$ CHR_' EQUAL IT CDR$        * 6B31D
            DUP DUPLEN$ SUB$1# BINT39 #<>RDROP   * 6B340

* refs (3): 16DEA 6C244 6E5F0
* $ -> $: drop the last character
$DropLast:
            :: DUPLEN$ #1-1SWAP SUB$ ; ;         * 6B359
          TRUE ;                                 * 6B377

* refs (3): 6AC76 6F8A1 6FE96
* #v -> #i: clear the operator bit of a value of field +18
EqwIdxMask:
        CON(5)  (*)+5                            * 6B381  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 6B386
        LC(5)   #7FFFF                           * 6B38D
        A=A&C   A                                * 6B394
        GOVLNG  EqwBoxParent@.L3                 * 6B398

* refs (4): 69DC5 69F7E 6A13B 6F8EC
* #i -> #b: the box whose field +18 is the operator at place i
EqwIdxBox:
        CON(5)  (*)+5                            * 6B39F  primitive code object
        GOSBVL  POP#                             * 6B3A4
        R3=A                                     * 6B3AB
        A=0     A                                * 6B3AE
        A=A+1   A                                * 6B3B0
        GOSBVL  EqwA>Box                         * 6B3B2
        A=R3                                     * 6B3B9
        C=0     A                                * 6B3BC
        BCEX    A                                * 6B3BE
        RSTK=C                                   * 6B3C0
        C=0     W                                * 6B3C2
EqwIdxBox.loop1:
        B=B+1   A                                * 6B3C5
        D0=D0+  15                               * 6B3C7
        D0=D0+  9                                * 6B3CA
        C=DAT0  X                                * 6B3CD
        C=C+C   X                                * 6B3D1
        GONC    EqwIdxBox.L2                     * 6B3D4
        CSRB                                     * 6B3D7
        ?C=A    X                                * 6B3DA
        GOYES   EqwIdxBox.L3                     * 6B3DD
EqwIdxBox.L2:
        D0=D0+  15                               * 6B3DF
        D0=D0+  3                                * 6B3E2
        GONC    EqwIdxBox.loop1                  * 6B3E5
EqwIdxBox.L3:
        A=B     A                                * 6B3E8
        C=RSTK                                   * 6B3EA
        B=C     A                                * 6B3EC
        GOVLNG  EqwBoxParent@.L2                 * 6B3EE

* Keys of the selection environment, left-shift plane
* Key dispatch: keycode byte and object to run (read by ByteTab>Ob/ByteTab>Ob?)
EqwSelKey~1:
        CON(2)  #07                              * 6B3F5  entries
        CON(2)  #0B                              * 6B3F7  entry 0
        CON(5)  EqwSelTop                        * 6B3F9
        CON(2)  #10                              * 6B3FE  entry 1
        CON(5)  EqwSelFarLeft                    * 6B400
        CON(2)  #11                              * 6B405  entry 2
        CON(5)  EqwSelBottom                     * 6B407
        CON(2)  #12                              * 6B40C  entry 3
        CON(5)  EqwSelFarRight                   * 6B40E
        CON(2)  #23                              * 6B413  entry 4
        CON(5)  ~Modifier;RShiftOnly;SetDA123NoCh * 6B415
        CON(2)  #28                              * 6B41A  entry 5
        CON(5)  ~Modifier;SetKeysNS;SetDA123NoCh * 6B41C
        CON(2)  #2D                              * 6B421  entry 6
        CON(5)  TurnOffKey                       * 6B423

* Keys of the selection environment, right-shift plane
* Key dispatch: keycode byte and object to run
EqwSelKey~2:
        CON(2)  #03                              * 6B428  entries
        CON(2)  #10                              * 6B42A  entry 0
        CON(5)  EqwSelView                       * 6B42C
        CON(2)  #23                              * 6B431  entry 1
        CON(5)  ~Modifier;SetKeysNS;SetDA123NoCh * 6B433
        CON(2)  #28                              * 6B438  entry 2
        CON(5)  ~Modifier;LShiftOnly;SetDA123NoCh * 6B43A

* Keys of the selection environment, unshifted plane
* Key dispatch: keycode byte and object to run
EqwSelKey~3:
        CON(2)  #0B                              * 6B43F  entries
        CON(2)  #0B                              * 6B441  entry 0
        CON(5)  EqwRepUp                         * 6B443
        CON(2)  #10                              * 6B448  entry 1
        CON(5)  EqwRepLeft                       * 6B44A
        CON(2)  #11                              * 6B44F  entry 2
        CON(5)  EqwRepDown                       * 6B451
        CON(2)  #12                              * 6B456  entry 3
        CON(5)  EqwRepRight                      * 6B458
        CON(2)  #0E                              * 6B45D  entry 4
        CON(5)  EqwGrobToStack                   * 6B45F
        CON(2)  #19                              * 6B464  entry 5
        CON(5)  EqwSelEnter                      * 6B466
        CON(2)  #1A                              * 6B46B  entry 6
        CON(5)  EqwMenuExpr                      * 6B46D
        CON(2)  #23                              * 6B472  entry 7
        CON(5)  ~Modifier;RShiftOnly;SetDA123NoCh * 6B474
        CON(2)  #28                              * 6B479  entry 8
        CON(5)  ~Modifier;LShiftOnly;SetDA123NoCh * 6B47B
        CON(2)  #2C                              * 6B480  entry 9
        CON(5)  OBJ_461CD                        * 6B482
        CON(2)  #2D                              * 6B487  entry 10
        CON(5)  ~EXITFCNsto;ERRJMP               * 6B489
        RPL

* refs (2): 3D8AD D755C
* -> : EQUATION key: start the EquationWriter with an empty equation
EqwNew:
        :: CK0NOLASTWD POLSaveUI ERRSET          * 6B48E
          :: CLEARVDISP NULL$ TRUE EqwInit ERRSET * 6B4A2
            :: EqwImplicitOn REDISPHBUFF EqwKeyLoop ; ERRTRAP EqwNew~1 * 6B4C0
            EqwEnter DROP ;                      * 6B4E3
          ERRTRAP POLResUI&Err POLRestoreUI ;    * 6B4F2

* refs (2): 42DD7 42DE1
ObEdit~1:
        :: CK1NOLASTWD POLSaveUI ERRSET          * 6B506
          :: TRUE ObEdit~4 ERRSET                * 6B51A
            :: ObEdit~5 EqwSlotsDrop1 OBJ_6BBFE DROP PictScroll ObEdit~3 * 6B52E
              BINT30 GETLAM IT EqwKeyLoop        * 6B551
            ;                                    * 6B565
            ERRTRAP                              * 6B56A
            :: RDROP EqwCleanup ERROR@ #0= caseFALSE GOTO * 6B56F
              ObEdit~6 ;                         * 6B592

* refs (1): 6B4E3
* -> symb: leave with the expression built so far
EqwEnter:
            :: ObEdit~2 EqwMeta>Symb SWAP EqwCleanup ExitFcn EVAL TRUE ; ; * 6B59C
          ERRTRAP POLResUI&Err POLRestoreUI ;    * 6B5CE

* refs (6): 6ABE5 6B4CF 6B560 6B790 6B8AD 6B9E8
* Main loop: wait for a key, run it, again
EqwKeyLoop:
        :: RDROP ?ATTNQUIT EqwKeyLoop~3          * 6B5E2

* refs (1): 6C023
EqwKeyMap~10:
          :: GetGNTData DROP GetNextToken nultrior * 6B5F6
            :: 2DROP SWAPDROP DUPLEN$ #1+ FALSE ; ?NumTok * 6B60F
            :: 4ROLLDROP TRUE ; 4ROLLDROP 3PICK LEN$ 3PICKSWAP #> * 6B637
            NOTcaseTRUE LEN$                     * 6B664
            #- FALSE ;                           * 6B66E
          case EqwKeyLoop~1                      * 6B67D
          2DROP EqwAtEnd? case                   * 6B687
          :: EqwKeyWaiting? ?SKIP EqwCursorOn    * 6B696
            EqwKeyLoop~2 ;                       * 6B6AA
          EqwNoArg?case                          * 6B6B4
          :: OBJ_6CB39 EqwKeyLoop~2 ;            * 6B6B9
          BINT35 GETLAM                          * 6B6CD
          :: palparse NOTcase2drop DROPFALSE     * 6B6D7
            :: DUPTYPEREAL? SWAP TYPEIDNT? OR ; ; * 6B6EB
          5GETLAM                                * 6B70E

* refs (1): 6EFAF
EqwBackspace~9:
          :: ?OKINALG NOTcsdrpfls FnInfo NOTcsdrpfls SWAPDROP #1= * 6B713
            NOTcsdrpfls OBJ_6E2E9 ;              * 6B736
          NOTAND IT                              * 6B745

* refs (3): 6AE92 6BF79 6C271
* -> : lam 32 TRUE
EqwParsePending:
          :: TRUE BINT32 PUTLAM ;                * 6B74F
          tok* EqwRest$ &$ 10GETLAM 9GETLAM 1_#1-SUB$ SWAP&$ 10PUTLAM * 6B768
          EqwKeyLoop ;                           * 6B790

* refs (6): 6AAF0 6B989 6BFD8 6C3D4 6E76C 6E794
* -> : redraw the picture and work out where typed text goes (lams 12-15)
EqwRedraw:
        :: TRUE 17PUTLAM FALSE 19PUTLAM EqwDrawAll EqwCurBox@ EqwDupBoxXY@ * 6B79A
          3PICK EqwBoxType@ #0=ITE               * 6B7C2
          :: ROT EqwBoxObj@ EqwBlankCell EQcasedrop SWAP * 6B7D1
            GROBDIMw ROT#+ ;                     * 6B7EF
          :: 3PICK EqwBoxRefY@ #+ EqwFontHeight #2/ #- SWAPROT EqwBoxW@ #+ ; * 6B7FE
          2DUP 14PUTLAM 15PUTLAM 12PUTLAM 13PUTLAM ; * 6B835

* refs (1): 6B682
EqwKeyLoop~1:
        :: DUP BINT35 PUTLAM ROTDROP 8PUTLAM 9PUTLAM BINT32 GETLAM ?SKIP * 6B853
          EqwPushUndo                            * 6B885
          EqwParseText ITE                       * 6B88A

* refs (1): 6C1B8
EqwKeyMap~11:
          :: EqwEraseText OBJ_6BFAB ; EqwSyntaxErr * 6B894
          EqwKeyLoop ;                           * 6B8AD

* refs (3): 6B8A8 6BBF4 6C14F
* -> : undo the last step, then beep and flash Syntax Error with the text
EqwSyntaxErr:
        :: EqwUndo@ DUP CARCOMP EqwSnapshot EQUAL IT CDRCOMP * 6B8B7
          EqwUndo! 8GETLAM NEWLINE$&$ #SyntaxErr JstGetTHEMESG &$ DoBadKey * 6B8DF
          FlashMsg GetGNTData LEN$ #- DUPUNROT #1- ONESWAP SUB$SWAP NULL$ * 6B902
          PutGNTData                             * 6B92F

* refs (6): 6BA10 6BA51 6BAAB 6BC46 6C267 6C35C
OBJ_6B934:
          ::                                     * 6B934

* refs (5): 6B899 6BFA6 6BFF1 6C3CF 6E5FF
* -> : clear the text being typed from the display
EqwEraseText:
            :: EqwCursorOff HARDBUFF 14GETLAM 15GETLAM BINT28 GETLAM 3PICK#+ * 6B939
              ~BINT27;GETLAM 3PICK#+ GROB!ZERODRP ZEROZERO BINT28 PUTLAM * 6B961
              ~BINT27;PUTLAM ;                   * 6B97F
            EqwRedraw OBJ_6CB25 OBJ_6CB39 ;      * 6B989
        ;                                        * 6B99D

* refs (2): 6B6AA 6B6C3
EqwKeyLoop~2:
        :: RDROP BINT30 GETLAM NOT?SEMI          * 6B9A2

* refs (1): 6B5F1
EqwKeyLoop~3:
          :: 19GETLAM NOT?SEMI                   * 6B9BB
            EqwKeyWaiting? ?SEMI                 * 6B9CA
            OBJ_6BFAB ;                          * 6B9D4
          GetKeyOb EqwDoKey EqwKeyLoop ;         * 6B9DE

* refs (1): 6BF01
* Keys of the writer: pairs of a key and the object to run
EqwKeyMap:
        { KeyLS_LEFT EqwKeyMap~7 KeyN_STO        * 6B9F2
          :: TakeOver OBJ_6B934 EqwCursorOff EqwGrobToStack EqwCursorOn ; * 6BA06
          DoCAlarmKey DoCAlarmKey NOP NOP KeyN_ON ABORT * 6BA29
          ~DoDelims;$_{};?ClrAlgSetPr            * 6BA47
          :: OBJ_6B934 EqwImplicit()? ITE        * 6BA4C
            :: EqwImplicitOff # 207 ;            * 6BA60
            :: EqwImplicitOn # 208 ;             * 6BA79
            JstGetTHEMESG FlashMsg ;             * 6BA92
          ~DoDelims;$_2DQ;?ClrAlg                * 6BAA1
          :: OBJ_6B934 10GETLAM EqwUnderMark     * 6BAA6

* refs (1): 6A988
EqwGrobToStack~1:
            :: DEPTHSAVE@ #5+ DEPTHSAVE! ; EqwSlotsAdd1 ; * 6BABA
          KeyN_UP                                * 6BADD
          :: $ " RATIO " EqwAddText ; KeyN_LEFT EqwKeyMap~8 KeyN_DOWN * 6BAE2
          EqwKeyMap~2 KeyN_RIGHT EqwKeyMap~2 KeyRS_DOWN EqwKeyMap~3 * 6BB18
          KeyRS_RIGHT EqwKeyMap~3 KeyLS_NEG EqwKeyMap~5 KeyN_BKSP * 6BB31
          EqwBackspace KeyRS_STO EqwKeyMap~6 KeyLS_DEL * 6BB4A
          :: NULL$ 10PUTLAM EqwRestart ; ~NoEdit?case;xDUP;EnterComLine * 6BB5E
          :: EqwKeyMap~1 ;                       * 6BB7C
          EVAL_3B427                             * 6BB8B
          :: EXITFCNsto xEVAL EqwKeyMap~1 ; KeyLS_EVAL * 6BB90
          :: EXITFCNsto x>NUM EqwKeyMap~1 ; }    * 6BBAE

* refs (3): 6BB81 6BB9F 6BBBD
EqwKeyMap~1:
        :: RDROP                                 * 6BBCC

* refs (1): 6C1A4
EqwKeyMap~12:
          # 206                                  * 6BBD6  518
* The Very Big List names this address <00206h4A9 RPL ArF15h : CNTR, but it is a pointer inside an object; the name is not used
          EqwKeyMap~4 NOTcasedrop                * 6BBE0
          :: EqwSelExit EqwSyntaxErr ;           * 6BBEA

* refs (3): 6B53D 6C195 8D3FA
OBJ_6BBFE:
          ::                                     * 6BBFE

* refs (1): 68738
EqwParseStep~6:
            CHR "\08" 7PUTLAM EqwParseText BINT0 7PUTLAM ; * 6BC03
          case drop;q_58A0C                      * 6BC23

* refs (7): 49C9F 4ED07 4ED2F 50E3B 6AD93 6C1A9 ...
* #msg -> : beep and flash a message
EqwFlash:
          :: JstGetTHEMESG DoBadKey FlashMsg ; OBJ_6B934 EqwSelExit ; * 6BC2D

* refs (7): 69A09 6BCC7 6BCD1 6BD21 6BD2B 6BD6C ...
* -> chr: the list separator, ; or , by flag -51
ListSepChr:
        :: BINT51 SysITE CHR_; CHR_, ;           * 6BC55  flag -51: Fraction mark: . / Fraction mark: ,

* refs (2): 6BCDB 6BCE5
* -> chr: the fraction mark, , or . by flag -51
RadixChr:
        :: BINT51 SysITE CHR_, CHR_. ;           * 6BC73  flag -51: Fraction mark: . / Fraction mark: ,

* refs (2): 68CE7 6BD03
~';xFORMUNIT:
        :: ' xFORMUNIT ;                         * 6BC91

* refs (2): 6B32C 6BD44
* -> the character '
CHR_':
        CHR "'"                                  * 6BCA5

* refs (1): 6BD5D
* -> the character @
CHR_@:
        CHR "@"                                  * 6BCAC

* refs (1): 6BDF8
OBJ_6BCB3:
        { KeyRS_PRG OBJ_6CC43 KeyALS_DOT ListSepChr KeyLS_DOT ListSepChr * 6BCB3
          KeyA_DOT RadixChr KeyN_DOT RadixChr KeyALS_DIV toklparen * 6BCD6
          ~DoDelims;$_LRParens;SetDA1NoCh toklparen KeyRS_MUL ~';xFORMUNIT * 6BCF4
          KeyN_EEX CHR_E KeyN_NEG CHR_- KeyA_SPC ListSepChr KeyN_SPC * 6BD08
          ListSepChr K__ë_ BINT0 }               * 6BD2B

* refs (1): 6BE61
OBJ_6BD3F:
        { CHR_'                                  * 6BD3F
          :: ' KeyN_QUOTE ; CHR_@ BINT0 CHR_Space ListSepChr } * 6BD49

* refs (1): 6BE52
OBJ_6BD76:
        :: MenuHasKeyOb? case OBJ_6BF38          * 6BD76
          INCOMPDROP ROTDROPSWAP GETPROC DUPUNROT TYPELIST? NOTcasedrop * 6BD8A
          :: COLA EqwDoKey                       * 6BDA8
          ;                                      * 6BDB7
          :: REQcasedrop DoMenuKeyRS             * 6BDBC
            BINT3 REQcasedrop DoMenuKeyLS        * 6BDCB
            BINT2 DROPONE ;                      * 6BDDA
          NTHELCOMP case                         * 6BDE9

* refs (2): 6B9E3 6BDB2
* key -> : run a key: the table of special keys, text, a command name
EqwDoKey:
          :: OBJ_6BCB3 EQLookup IT EVAL          * 6BDF3
            OBJ_72FED OVER Symb/C/Unit? OR ITE   * 6BE0C
            :: EqwUndoClr TRUE ; FALSE           * 6BE25
            BINT32 PUTLAM ~';MenuKey;CkSecoType case OBJ_6BD76 * 6BE3E
            ' EQUAL OBJ_6BD3F Lookup IT EVAL     * 6BE57
            DUPTYPECHAR? ITE                     * 6BE75
            :: ?TogU/LCase CHR>$ ;               * 6BE7F
            :: OBJ_6E026 NOT?SEMI                * 6BE93
              DUP EqwDecomp SWAP OBJ_6AEF1 NOT?SEMI * 6BEA2
              OBJ_6C221 SPACE$ ROT OBJ_3516C ITE &$ SWAPDROP * 6BEBB
              SWAPDROP CHR_Space >T$ ;           * 6BEDE
            DUPTYPECSTR? case EqwAddText         * 6BEF2
            EqwKeyMap EQLookup case EVAL         * 6BF01
            ' KeyAccent CkSecoType case EVAL     * 6BF15
            ~';MenuMaker;CkSecoType case         * 6BF2E

* refs (1): 6BD85
OBJ_6BF38:
            :: EVAL DispMenu ;                   * 6BF38
            ~';Modifier;CkSecoType case EVAL     * 6BF4C
            ~DROP;DoBadKey ;                     * 6BF5B
          DoBadKey ;                             * 6BF65

* refs (2): 6BB18 6BB22
EqwKeyMap~2:
        :: OBJ_6BFF6 EqwParsePending OBJ_6CB25 OBJ_695CB case * 6BF6F

* refs (10): 69232 69246 69274 6AC26 6BAFF 6BEFC ...
* $ -> : add to the text being typed (lam 10)
EqwAddText:
          :: 10GETLAM SWAP&$ 10PUTLAM ;          * 6BF8D
          EqwEraseText                           * 6BFA6

* refs (3): 6B89E 6B9D4 6C16D
OBJ_6BFAB:
          :: TRUE EqwKeyWaiting?                 * 6BFAB

* refs (2): 6D1A4 6E974
OBJ_6BFBA:
            :: NOTcasedrop SKIP                  * 6BFBA
              COLA_EVAL ;                        * 6BFC9
            19PUTLAM EqwRedraw EqwCursorOn ;     * 6BFD3
        ;                                        * 6BFE7

* refs (2): 6BB2C 6BB36
EqwKeyMap~3:
        :: EqwEraseText                          * 6BFEC

* refs (4): 6BF74 6C17C 6C18B 6C3B1
OBJ_6BFF6:
          ::                                     * 6BFF6

* refs (1): 6BBE0
EqwKeyMap~4:
            ::                                   * 6BFFB
              :: EqwAtEnd? ?SKIP                 * 6C000
                :: SPACE$ EqwAddText ;           * 6C00F
                EqwKeyMap~10 NOTcase2DROP ROTDROPSWAP * 6C023
                9PUTLAM 8PUTLAM ;                * 6C032

* refs (3): 4EC76 6923C 6B885
* -> : take a snapshot of the state, the newest of up to 10 on the undo list
EqwPushUndo:
              :: EqwUndo@                        * 6C041

* refs (1): 6B8CB
* -> {}: the state to go back to: frame items, current box and leaf flag, object stack count, free boxes, parser state, size level, box count, lam 34, the text
EqwSnapshot:
                :: EqwFrames #1+_ONE_DO INDEX@ EqwDupFrmN1@ OVER EqwFrmN5@ * 6C04B
                  ROT EqwFrmN3@ LOOP EqwFrames #3* {}N EqwCurLeaf? * 6C06E
                  ~EqwStkSize@;EqwStkFree@;#- EqwBoxesFree@ 1GETLAM EqwSize@ * 6C091
                  EqwBoxCount BINT34 GETLAM 8GETLAM BINT10 {}N ; * 6C0A5
                >HCOMP BINT1 BINT10 SUBCOMP EqwUndo! ; * 6C0C8
              9GETLAM EqwParseText 9GETLAM ROT #= OBJ_695CB ITE DROPTRUE * 6C0E6
              FALSE                              * 6C10E
              NOTAND OVER AND IT                 * 6C113

* refs (1): 6E86B
* -> : drop the newest undo entry
EqwUndoDrop:
              :: EqwUndo@ CDRCOMP EqwUndo! ;     * 6C127
            ;                                    * 6C140
            ?SEMI                                * 6C145
            RDROP EqwSyntaxErr ;                 * 6C14A
          EqwUndoClr OBJ_6CB25 OBJ_695CB NOTcase OBJ_6BFAB * 6C159
          EqwAddText GOTO OBJ_6BFF6 ;            * 6C172
