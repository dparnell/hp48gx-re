* HP 48GX ROM revision R, #6F360-#70038: EquationWriter: stepping back over arguments, cursor movement in the selection environment, highlighting a subexpression, hook tests and key lookup tables; ends with a few plot helpers
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: EqwBlankCell EqwFrmLast@ EqwIf6 EqwIf4 EqwNextUntil EqwFindMove EqwSelectBox EqwBadMove EqwParent? EqwIf2 ByteTab>Ob EqwSelTop
* Follows on from the previous file (at #6F360 in the original ROM).
        RPL

* refs (2): 6E35C 6F29D
OBJ_6F360:
        :: OVER                                  * 6F360

* refs (8): 65E81 65EA9 6657F 6F1CB 6F2F2 6F338 ...
* #n -> #last: last child of the box of frame n
EqwFrmLast@:
          :: EqwFrmN5@ EqwBoxLast@ ; OBJ_6D1C7 3PICK * 6F36A
          :: EqwFrmN5@ EqwTreeRange DROP OBJ_6ECF8 NOT ; OVER NOTAND case * 6F388
          3DROP                                  * 6F3BA
          3PICK                                  * 6F3BF

* refs (3): 6F32E 6F50E 6F54F
OBJ_6F3C4:
          :: DUP EqwFrmN4@ INNERCOMP ROT #1-UNROT {}N EqwFrmN4! ; SWAPDROP * 6F3C4
          case OBJ_6F41E                         * 6F3F6
          GOTO OBJ_6F315.L1 ;                    * 6F400

* refs (1): 4B8C8
EqwDeriv~3:
        :: 7GETLAM casedrop                      * 6F40F

* refs (6): 6F130 6F162 6F1DA 6F306 6F3FB 6F496
OBJ_6F41E:
          :: EqwFrmLast@                         * 6F41E
OBJ_6F41E.L1:
            DUP                                  * 6F428

* refs (9): 65D87 65EE5 661C9 66593 665AC 6B7E0 ...
* -> grob: the blank cell for the current size level
EqwBlankCell:
            :: EqwSize@ DUP#0=csedrp EqwDeriv~4 #1=case OBJ_66FB1 * 6F42D
              OBJ_66E7F ;                        * 6F44B
            OBJ_44DFE ZEROSWAP EqwBoxSizeH! ;    * 6F455
          DUPUNROT                               * 6F469

* refs (4): 65E22 6F2C0 6F310 6F54A
OBJ_6F46E:
          :: OVERSWAP #2- EqwFrmN1! ; SWAP BINT4 #<>case OBJ_6F41E * 6F46E
          EqwFrmN5@ EqwBoxSecond@ GOTO OBJ_6F41E.L1 ; * 6F49B

* refs (1): 6E3ED
EqwWhere~6:
        :: OVER EqwFrmLast@ EqwBoxLast@ EqwCurBox@ BEGIN EqwDupBoxParent@ * 6F4B4
          3PICK OVER#= NOT_WHILE SWAPDROP REPEAT DROPSWAPDROP EqwDupBoxNext@ * 6F4D7
          OBJ_6ECF8 case                         * 6F4FA
          :: UNROTOVER OBJ_6F3C4 #2+ EqwFrmN1! EqwNoNext EqwDupBoxParent@ * 6F504
            SWAP EqwBoxLast! ;                   * 6F527
          DROP 7GETLAM NOTcase                   * 6F536
          :: OBJ_6F46E OBJ_6F3C4 ;               * 6F545
          DROPDUP EqwFrmN4@ INNERCOMP ROT DUPTWO #/ DROP #- 3UNROLL {}N * 6F559
          EqwFrmN4! ;                            * 6F58B

* refs (8): 0C75D 46191 6F815 6F860 6F905 6F923 ...
OBJ_6F595:
        :: TakeOver OBJ_461CD                    * 6F595

* refs (1): 69ECA
EqwRuleKey0~8:
          :: 'EL NOTcase                         * 6F5A4

* refs (1): 6ACDF
* -> : put back what the highlight covered ('NG)
EqwRestoreGrob:
            :: 'NG INCOMPDROP ROT XYGROBDISP ;   * 6F5B3
            Eqw'EL!F EqwHiliteExpr ;             * 6F5D1
          'LB                                    * 6F5E0

* refs (4): 6F838 6F955 6FA1D 6FA4F
* #b -> #b #parent flag: flag TRUE at the root
EqwParent?:
          :: EqwDupBoxParent@ DUP#0= ; NOTcase EqwBoxType@ * 6F5E5
          drop;q_58A0C                           * 6F603

* refs (5): 461AA 6F82E 6F842 6F879 6F946
* -> : put the highlight back and beep
EqwBadMove:
          :: ~'LB;EqwSelectBox DoBadKey ; ;      * 6F608

* refs (6): 461A0 6F6F3 6F824 6F86F 6F93C 6F96E
* Search the tree for the next selectable box in a direction
EqwFindMove:
        :: 3PICK EqwBoxParent@ EqwBoxType@ 4UNROLL ROTOVER 4PICK * 6F621
          EqwFindMove~2 NOTcase2drop 2DROPFALSE  * 6F644
          SWAPDROP BEGIN EqwBoxLeaf? OVER EqwBox#18@ #0<> AND NOT_WHILE * 6F653
          :: EqwBoxLeaf? ITE                     * 6F67B
            :: 2DUPSWAP ITE EqwBoxNext@ EqwBoxPrev@ * 6F68A
              DUP#0<> case SWAPDROP              * 6F6A3
              DROP EqwDupBoxParent@ EqwBoxType@ 5ROLL #=?SKIP * 6F6B2

rot;not(?);3rolld:
              :: ROT NOT 3UNROLL ; 3RDROP 3UNROLL COLA EqwFindMove * 6F6CB
            ;                                    * 6F6F8
            EqwFindMove~1                        * 6F6FD
          ;                                      * 6F702
          REPEAT 4UNROLL3DROP TRUE ;             * 6F707

* refs (1): 6F6FD
EqwFindMove~1:
        :: EqwDupBoxType@ 5PICK #= 4PICK ?SKIP NOT * 6F71B
          case                                   * 6F73E
          :: OVER case EqwBoxFirst@              * 6F743
            EqwBoxLast@ ;                        * 6F757
          ZEROSWAP EqwBoxFirst@ DUP BEGIN EqwDupBox#18@ DUP EqwIdxOp? ITE * 6F761
          :: DUP EqwNoIdx? casedrop BINT0        * 6F789
          ;                                      * 6F7A2
          DROPZERO                               * 6F7A7
          4PICKOVER #<ITE                        * 6F7AC
          :: 4ROLLDROP 3UNROLL SWAPDROPDUP ; DROP EqwNextUntil SWAP #0= * 6F7B6
          NOT?SEMI                               * 6F7E3
          BEGIN EqwBoxLeaf? WHILE                * 6F7E8
          :: EqwBoxNext@ ; REPEAT ;              * 6F7F7

* refs (1): 4B4A5
* Left arrow in the selection environment
EqwSelLeft:
        :: OBJ_6F595                             * 6F810
EqwSelLeft.loop1:
          #1= FALSE EqwFindMove NOTcase EqwBadMove * 6F81A
          OBJ_6F883 EqwParent? casedrop EqwBadMove * 6F833
          EqwBoxType@ GOTO EqwSelLeft.loop1 ;    * 6F847

* refs (1): 4B4C3
* Down arrow in the selection environment
EqwSelDown:
        :: OBJ_6F595 #1<> TRUE                   * 6F85B
EqwRepUp~2:
          EqwFindMove NOTcase EqwBadMove         * 6F86F

* refs (1): 6F98C
EqwSelTop~1:
          ::                                     * 6F87E

* refs (2): 461AF 6F833
OBJ_6F883:
            :: DUP EqwParens? NOT?GOTO EqwLoadSymb~6.L1 EqwDupBox#18@ * 6F883
              EqwIdxMask EqwIdxObj               * 6F8A1

* refs (1): 689E0
EqwLoadSymb~6:
              :: DUP 'CmpRectOp EQ SWAP 'CmpPolarOp EQOR ; NOT?SEMI * 6F8AB
EqwLoadSymb~6.L1:
              RDROP EqwSelectBox ;               * 6F8D8
            EqwBox#18@ EqwIdxBox EqwSelectBox ;  * 6F8E7
        ;                                        * 6F8FB

* refs (1): 6B407
* Left-shift down arrow in the selection environment
EqwSelBottom:
        :: OBJ_6F595 TRUE GOTO EqwSelBottom~1 ;  * 6F900

* refs (1): 6B3F9
* Left-shift up arrow in the selection environment
EqwSelTop:
        :: OBJ_6F595 FALSE                       * 6F91E
EqwSelBottom~1:
          3UNROLL #1<> 3PICK EqwFindMove NOTcasedrop EqwBadMove * 6F92D
          BEGIN DUP EqwParent? case2drpfls EqwBoxType@ * 6F94B
          #1<> 4PICK EqwFindMove DUP IT ROTDROP  * 6F964
          NOT_UNTIL SWAPDROP EqwSelTop~1 ;       * 6F982

* refs (1): 6B400
* Left-shift left arrow: the leftmost selectable leaf
EqwSelFarLeft:
        :: OBJ_6F595 2DROP EqwLeftmostLeaf EqwSelectBox ; * 6F996

* refs (1): 6B40E
* Left-shift right arrow: the rightmost selectable leaf
EqwSelFarRight:
        :: OBJ_6F595 2DROP EqwRightmostLeaf EqwSelectBox ; * 6F9B4

* refs (2): 6F644 6FAC2
EqwFindMove~2:
        :: DUP4UNROLL IT                         * 6F9D2
          :: 2DUP ITE EqwBoxNext@ EqwBoxPrev@    * 6F9E1
            DUP#0=csDROP SWAPDROP ROTDROP TRUE RDROP ; * 6F9FA
          SWAP EqwParent? casedrop               * 6FA18
          :: ROTROT2DROP FALSE ;                 * 6FA27
          EqwDupBoxType@ SWAP BEGIN              * 6FA3B
          :: EqwParent? case FalseTrue           * 6FA4A
            EqwDupBoxType@ 4PICK 8PICK ITE #= #<> * 6FA5E
            case TrueTrue                        * 6FA7C
            drop(2);false ;                      * 6FA86
          UNTIL SWAPDROP ROTDROP 5ROLLDROP 4ROLLSWAP NOTcase2drop FALSE * 6FA90
          ROTDROP TRUE COLA EqwFindMove~2        * 6FAB3
        ;                                        * 6FAC7

* refs (5): 25C2D 6F8DD 6F8F1 6F9AA 6F9C8
* #b -> : highlight a box and scroll it into view; what it covers goes to 'NG
EqwSelectBox:
        :: DUP XLIB ~'R;STO 'LB EqwDupBoxXY@ ROTDUP EqwBoxObj@ OBJ_44E3F * 6FACC
          EQITE                                  * 6FAFA
          :: SWAPDROPSWAP #3- SWAP EqwBoxPrev@ EqwBoxY@ #1- EqwSelectBox~1 * 6FAFF
            3UNROLL BINT4 BINT5 ;                * 6FB27
          :: DUP EqwBoxWH@ 2DUP #2= case         * 6FB3B
            :: 4UNROLL3DROP BINT3 SWAP2DUP MAKEGROB INVGROB BINT1 3PICK #2- * 6FB59
              OBJ_6FBD1 ROT #1-UNROT ;           * 6FB86
            #2= case                             * 6FB9A
            :: ROTROT2DROP BINT3 2DUP MAKEGROB INVGROB 3PICK #2- BINT1 * 6FBA4

* refs (1): 6FB86
OBJ_6FBD1:
              :: MAKEGROB OVER ONEONE GROB! 5UNROLL ; ; * 6FBD1
            SWAPROT EqwBoxObj@ TOTEMPOB INVGROB 5UNROLL ; * 6FBF9
          4PICK#+ SWAP 3PICK#+ 'LE 5PICK #>ITE   * 6FC17
          :: 4PICK XLIB ~'R;STO 'LE ;            * 6FC35
          :: 'LE BINT131 #+ 3PICKSWAP 2DUP#> NOTcase2DROP #- * 6FC54
            'LE #+ XLIB ~'R;STO 'LE ;            * 6FC7C
          'TE 4PICK #>ITE                        * 6FC9B
          :: 3PICK #1-DUP EqwIdxOp? IT DROPZERO  * 6FCAA
            XLIB ~'R;STO 'TE ;                   * 6FCC8
          :: DUP 'TE RclRowMenu #+ 2DUP#> NOTcase2DROP #- * 6FCDD
            #1- 'TE #+ XLIB ~'R;STO 'TE ;        * 6FD05
          'TE 'LE WINDOWXY 4PICK 4UNROLL 3PICK 5UNROLL HARDBUFF 5UNROLL * 6FD29
          SUBGROB 3PICK3PICK THREE{}N XLIB ~'R;STO 'NG ROT XYGROBDISP ; * 6FD56
        BSS     1                                * 6FD84  zeros

* refs (3): 65C9F 661B5 6E3F2
* #n -> #n: a hook's test: if n is 2 drop it and run the next object, else skip that object
EqwIf2:
        CON(5)  (*)+5                            * 6FD85  primitive code object
        ASSEMBLE
        LC(5)   BINT2                            * 6FD8A
EqwIf2.L1:
        A=DAT1  A                                * 6FD91
        ?C=A    A                                * 6FD94
        GOYES   EqwIf2.L3                        * 6FD97
        LC(5)   SKIP                             * 6FD99
EqwIf2.loop2:
        A=C     A                                * 6FDA0
        PC=(A)                                   * 6FDA2
EqwIf2.L3:
        D1=D1+  5                                * 6FDA6
        D=D+1   A                                * 6FDA9
        LC(5)   COLA                             * 6FDAB
        GOTO    EqwIf2.loop2                     * 6FDB2

* refs (7): 65CA9 661D8 6E17C 6E19A 6E393 6E3CA ...
* As EqwIf2, for 4
EqwIf4:
        CON(5)  (*)+5                            * 6FDB6  primitive code object
        LC(5)   BINT4                            * 6FDBB
        GOTO    EqwIf2.L1                        * 6FDC2

* refs (7): 44C50 65CB3 661E2 6D48D 6E1A4 6E39D ...
* As EqwIf2, for 6
EqwIf6:
        CON(5)  (*)+5                            * 6FDC6  primitive code object
        LC(5)   BINT6                            * 6FDCB
        GOTO    EqwIf2.L1                        * 6FDD2

* refs (3): 6A888 6A8A6 6A8B5
* #key -> ob TRUE: look #key up in the byte table named by the next runstream word; DoBadKey when it is missing
ByteTab>Ob:
        CON(5)  (*)+5                            * 6FDD6  primitive code object
        ST=1    0                                * 6FDDB
        GOTO    ByteTab>Ob?.L1                   * 6FDDE

* refs (1): 6E32A
* #key -> ob TRUE, or FALSE: as ByteTab>Ob, FALSE when missing
ByteTab>Ob?:
        CON(5)  (*)+5                            * 6FDE2  primitive code object
        ST=0    0                                * 6FDE7
ByteTab>Ob?.L1:
        C=DAT0  A                                * 6FDEA
        D0=D0+  5                                * 6FDED
        RSTK=C                                   * 6FDF0
        GOSBVL  POP#                             * 6FDF2
        GOSBVL  SAVPTR                           * 6FDF9
        B=A     B                                * 6FE00
        C=RSTK                                   * 6FE03
        D1=C                                     * 6FE05
        C=DAT1  B                                * 6FE08
        C=C-1   B                                * 6FE0B
        D1=D1+  2                                * 6FE0E
ByteTab>Ob?.loop2:
        A=DAT1  B                                * 6FE11
        ?A=B    B                                * 6FE14
        GOYES   ByteTab>Ob?.L4                   * 6FE17
        D1=D1+  7                                * 6FE19
        C=C-1   B                                * 6FE1C
        GONC    ByteTab>Ob?.loop2                * 6FE1F
        ?ST=1   0                                * 6FE22
        GOYES   ByteTab>Ob?.L3                   * 6FE25
        GOVLNG  GETPTRFALSE                      * 6FE27
ByteTab>Ob?.L3:
        LA(5)   DoBadKey                         * 6FE2E
        GOC     ByteTab>Ob?.L5                   * 6FE38
ByteTab>Ob?.L4:
        D1=D1+  2                                * 6FE3B
        A=DAT1  A                                * 6FE3E
ByteTab>Ob?.L5:
        GOSBVL  GETPTR                           * 6FE41
        D1=D1-  5                                * 6FE48
        DAT1=A  A                                * 6FE4B
        D=D-1   A                                * 6FE4E
        LC(5)   TRUE                             * 6FE50
        D1=D1-  5                                * 6FE57
        DAT1=C  A                                * 6FE5A
        D=D-1   A                                * 6FE5D
        A=DAT0  A                                * 6FE5F
        D0=D0+  5                                * 6FE62
        PC=(A)                                   * 6FE65
        RPL

* refs (1): 684C9
OBJ_6FE69:
        :: DUP                                   * 6FE69

* refs (1): 684B6
OBJ_6FE73:
          ::                                     * 6FE73

* refs (2): 6850A 68528
EqwPlaceH-1~1:
            :: EqwDupBox#18@ EqwIdxOp? case      * 6FE78

* refs (1): 6FED7
OBJ_6FE8C:
              :: EqwBox#18@ EqwIdxMask EqwIdxObj ; * 6FE8C
              EqwDupBoxParent@ EqwBoxFirst@ BEGIN EqwDupBox#18@ #1+ * 6FEA5
              EqwIdxOp? case                     * 6FEBE
              :: SWAPDROP RDROP OBJ_6FE8C ;      * 6FEC8

* refs (6): 66700 6684C 669AB 68FF8 6F7D4 6FF45
* #b -> : tail of a BEGIN in the caller: go on with the next sibling, leave the loop after the last
EqwNextUntil:
              :: EqwNext? COLA NOT_UNTIL         * 6FEE1
              ;                                  * 6FEF5
              EqwFrames DUP EqwFrmN5@ BEGIN EqwBoxFirst@ BEGIN 3PICK OVER#= * 6FEFA
              case                               * 6FF22
              :: 2RDROP DROPSWAPDROP EqwFrmN4@ EqwOpOf ; * 6FF27
              EqwNextUntil #1-DUP EqwFrmN5@ AGAIN ; * 6FF45
            CmdField DROP BINT4 NTHCOMPDROP ;    * 6FF5E
          EVAL ;                                 * 6FF77
        ASSEMBLE
EqwNextUntil.L1:
        A=A-1   S                                * 6FF81
        RTNC                                     * 6FF84
        A=A-1   S                                * 6FF87
        RTNC                                     * 6FF8A
        P=      15                               * 6FF8D
        LC(1)   #7                               * 6FF8F
        P=      0                                * 6FF92
        A=A-C   S                                * 6FF94
        GOC     EqwNextUntil.L3                  * 6FF97
        D1=(5)  #8084F                           * 6FF9A
        A=DAT1  1                                * 6FFA1
        ?ABIT=0 2                                * 6FFA5
        GOYES   EqwNextUntil.L2                  * 6FFAA
        A=A-1   S                                * 6FFAC
EqwNextUntil.L2:
        A=A-1   S                                * 6FFAF
        RTNC                                     * 6FFB2
EqwNextUntil.L3:
        RTNCC                                    * 6FFB5
        RPL

* refs (1): 4C5DF
TruthYRange~1:
        :: 9GETLAM                               * 6FFB7

* refs (1): 7001B
OBJ_6FFC1:
          :: %%1 SWAP %%/ DUP %%2 %%/ 2%%>% SWAP ; 19PUTLAM ; * 6FFC1

* refs (2): 4B7AB 4D1B4
OBJ_6FFFD:
        :: PlotBind 11GETLAM ~BINT12;PTYPE>PINFO;NOTcaseFALSE NOT?SEMI * 6FFFD
          10GETLAM OBJ_6FFC1 DROP 16GETLAM %+ 16PUTLAM ; * 70016
