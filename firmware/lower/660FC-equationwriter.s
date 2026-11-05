* HP 48GX ROM revision R, #660FC-#69141: EquationWriter: root and sum handlers, size and placement of the box tree, drawing, bracket and bar grobs, RAM accessors, box record fields, work-stack frames, handler tables, start of the expression parser
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: EqwBoxCount EqwCurBox@ EqwBoxFirst@ EqwPOP#>Box EqwNewBox EqwCurBox! EqwBoxCount#2+ EqwBoxParent@ EqwBoxRefY@ EqwBoxCount#3+ EqwBoxNext@ EqwBoxLast!
* Follows on from the previous file (at #660FC in the original ROM).
        RPL

* refs (1): 68443
OBJ_660FC:
        :: OBJ_66C8B EqwBoxFirst@ EqwBoxH@ #9+ ; * 660FC

* refs (1): 68448
OBJ_6611A:
        :: OBJ_66C8B EqwDupBoxPrev@ EqwBoxFirst@ EqwBoxH@ #9+ OVER * 6611A
          EqwBoxFirst@ EqwDupBoxNext@ DUP EqwBoxRefY@ SWAP 4UNROLL ROTOVER * 6613D
          2DUP#< IT DROPDUP                      * 66160
          #- ROTOVER OBJ_65EC7 DUPUNROT #+ 4UNROLL SWAP EqwBoxH@ #+ EqwBoxH! ; * 6616F

* refs (1): 65EFE
OBJ_661A6:
        :: SKIP OBJ_66331 EqwIf2                 * 661A6
          :: EqwSmaller EqwCurBox@ EqwBlankCell OBJ_44DFE ; EqwIf4 OBJ_66255 * 661BA
          EqwIf6 OBJ_662B9 BINT8 #<>RDROP EqwLarger EqwFrm5@ EqwBoxSecond@ * 661E2
          EqwDupBoxFirst@ DUP EqwBoxCount#1+ EqwBoxNext! BINT0 3PICK BINT9 * 66205
          BINT7 OBJ_6DD2D EqwNewLeafBox EqwBoxCount EqwBoxLast! EqwBoxCount * 66228
          EqwCurBox! EqwRelayoutCur ;            * 66246

* refs (1): 661DD
OBJ_66255:
        :: EqwCurNext@ DUP tok= EqwTextGrob EqwBoxObj! DUPZERO OVER * 66255
          EqwBoxParent@ BINT5 EqwCellBox EqwBoxCount OVER EqwBoxParent@ OVER * 6627D
          EqwBoxLast! DUPUNROT EqwBoxNext! EqwCurBox! ; * 662A0

* refs (1): 661E7
OBJ_662B9:
        :: EqwFrm5@ EqwBoxFirst@ EqwBoxFirst@ DUPZERO EqwBox#18! Push3Zeros * 662B9
          4PICK #1+ EqwDupBoxParent@ BINT7 BINT6 OBJ_6DD2D EqwNewBox * 662DC
          EqwBoxCount SWAPDUP EqwBoxParent@ 3PICK EqwBoxFirst! #1+ OVER * 662FF
          EqwBoxPrev! EqwCurBox! ;               * 66322

* refs (1): 661B0
OBJ_66331:
        :: OBJ_65E13 EqwDupFrmN1@ #2+ BINT9 #=casedrop * 66331
          :: EqwFrmN5@ EqwBoxSecond@ EqwDupBoxFirst@ EqwNoNext EqwBoxLast! ; * 6634F
          BINT7 #=casedrop                       * 66372
          :: EqwFrmN5@ EqwBoxFirst@ DUP#1+ DUPUNROT EqwBoxFirst! DUP#1+ SWAP * 6637C
            EqwBoxPrev! ;                        * 663A4
          SWAPDROP #5= NOT?SEMI                  * 663AE
          EqwCurNext@ EqwNoNext EqwDupBoxParent@ OVER EqwBoxLast! * 663BD
          EqwFontHeight OBJ_65EC7 ;              * 663D6

* refs (1): 1B233
OBJ_663E5:
        :: SKIP OBJ_6656B EqwBoxCount#3+ EqwBoxCount#1+ OBJ_6CFB5 SWAPDROP * 663E5
          EqwFontW-1 #+ #6+ SWAP #2+ 2DUPHALF #1+ OBJ_6D8DC EqwBoxCount #5+ * 66408
          DUPZERO EqwBoxCount#2+ EqwCurBox@ EqwPlainArgs EqwFontW-1 * 6643A
          EqwFontH-1 2DUPHALF #3+ OBJ_6D990 EqwNewBox EqwBoxCount * 66453
          EqwBoxCount#2+ EqwCurBox@ BINT1 BINT4 BINT0 EqwFontH#2+ BINT4 * 66471
          OBJ_6DC51 4ROLL #1+ 4UNROLL EqwNewLeafBox EqwBoxCount#2+ DUP * 66494
          EqwBoxCount BINT0 EqwCurBox@ EqwPlainArgs EqwFontW#2+ EqwFontH#2+ * 664B7
          2DUPHALF #1+ OBJ_6D990 Push3Zeros BINT0 EqwBoxCount#1+ BINT0 * 664D5
          #THREE#FOUR BINT2 EqwFontW#2+ OBJ_6DC51 EqwSmaller ZEROZERO * 664F8
          ZEROZERO EqwBoxCount#1- EqwCellArgs3 EqwNew3 EqwCurNew ; * 66516

* refs (1): 68439
OBJ_66534:
        :: SWAPDROP ZEROSWAP OBJ_66C8B EqwDupBoxFirst@ SWAP EqwBoxLast@ * 66534
          EqwBoxRefY@ DUPUNROT EqwBoxRefY! ;     * 66557

* refs (1): 663EF
OBJ_6656B:
        :: SKIP                                  * 6656B
          :: OBJ_65E13 EqwFrmLast@ EqwDupBoxFirst@ EqwNoNext DUP * 66575
            EqwBlankCell EqwBoxObj! OVER EqwBoxPrev@ DUP EqwBlankCell * 66593
            EqwBoxObj! ZEROSWAP EqwBoxSizeH! EqwBoxLast! ; * 665B1
          BINT4 #<>RDROP EqwLarger EqwFrm5@ EqwBoxLast@ EqwDupBoxFirst@ * 665CA
          DUPZERO 4PICK BINT5 EqwCellBox 2DUP EqwBoxCount EqwBoxNext! * 665E8
          EqwBoxCount EqwBoxLast! BINT7 3PICK EqwBoxPrev@ EqwBoxSizeH! * 6660B
          EqwFontW#2+ EqwBarGrob EqwBoxObj! EqwDupBoxParent@ SWAP * 66629
          EqwBoxPrev@ OBJ_66660 2DROP EqwBoxCount EqwCurBox! ; * 66642

* refs (2): 66647 6841B
OBJ_66660:
        :: EqwDupBoxPrev@ OVER EqwBoxNext@ DUP EqwBoxRefY@ OVER * 66660

* refs (1): 666A6
OBJ_66683:
          :: EqwDupBoxH@ SWAP EqwBoxRefY@ #-Floor0 ; 4ROLL OBJ_66683 #MAX * 66683
          #+OVER EqwBoxH@ #MAX OBJ_44CD2 OBJ_44DB3 OBJ_44D9A ; * 666B0

* refs (5): 69DB1 6A159 6B115 6B7B3 6C4C4
* -> : place the whole tree (from box 1) and draw it into the display grob
EqwDrawAll:
        :: EqwPlaceAll BINT1 EqwDrawBox ;        * 666D3

* refs (1): 66769
* #first -> : draw a box and its following siblings
EqwDrawKids:
        :: BEGIN DUP EqwDrawBox EqwNextUntil ;   * 666EC

* refs (2): 666E2 666FB
* #b -> : draw a box. A leaf whose drawn bit (+01 bit 3) is clear gets the bit set and its grob put at x,y with XYGROBDISP; other boxes go on to their children
EqwDrawBox:
        CON(5)  (*)+5                            * 6670A  primitive code object
        ASSEMBLE
        ST=0    10                               * 6670F
EqwDrawBox.loop1:
        LC(5)   #00009                           * 66712
        D=D-C   A                                * 66719
        GONC    EqwDrawBox.L2                    * 6671B
        GOSBVL  EqwGC                            * 6671E
        GOC     EqwDrawBox.loop1                 * 66725
EqwDrawBox.L2:
        D=D+C   A                                * 66728
        GOSBVL  POP#                             * 6672A
        R1=A.F  A                                * 66731
        GOSBVL  EqwA>Box                         * 66737
        A=DAT0  S                                * 6673E
        ?A=0    S                                * 66742
        GOYES   EqwDrawBox.L3                    * 66745
        AD0EX                                    * 66747
        LC(5)   #00024                           * 6674A
        A=A+C   A                                * 66751
        D0=A                                     * 66753
        A=0     A                                * 66756
        A=DAT0  X                                * 66758
        GOSBVL  SUB_67918                        * 6675C
        C=R2                                     * 66763
        D0=C                                     * 66766
        LC(5)   EqwDrawKids                      * 66769
        A=C     A                                * 66770
        PC=(A)                                   * 66772
EqwDrawBox.L3:
        D0=D0+  1                                * 66776
        A=DAT0  S                                * 66779
        A=A+A   S                                * 6677D
        GONC    EqwDrawBox.L4                    * 66780
        GOVLNG  EqwBoxPlaceH!.L1                 * 66783
EqwDrawBox.L4:
        A=DAT0  S                                * 6678A
        P=      15                               * 6678E
        LC(1)   #8                               * 66790
        A=A!C   P                                * 66793
        P=      0                                * 66797
        DAT0=A  S                                * 66799
        D0=D0+  4                                * 6679D
        A=0     A                                * 667A0
        A=DAT0  X                                * 667A2
        GOSBVL  EqwPush#A                        * 667A6
        D0=D0-  3                                * 667AD
        A=0     A                                * 667B0
        A=DAT0  X                                * 667B2
        GOSBVL  SUB_67918                        * 667B6
        CD1EX                                    * 667BD
        RSTK=C                                   * 667C0
        D1=(5)  EDITLINE                         * 667C2
        C=DAT1  A                                * 667C9
        D1=(5)  PDCHXS                           * 667CC
        A=DAT1  A                                * 667D3
        C=C-A   A                                * 667D6
        D1=(5)  MENULEVEL                        * 667D8
        A=DAT1  A                                * 667DF
        CR1EX                                    * 667E2
        A=A-C   A                                * 667E5
        C=A     A                                * 667E7
        A=A+A   A                                * 667E9
        A=A+A   A                                * 667EB
        A=A+C   A                                * 667ED
        C=R1                                     * 667EF
        C=C+A   A                                * 667F2
        D1=C                                     * 667F4
        A=DAT1  A                                * 667F7
        C=RSTK                                   * 667FA
        D1=C                                     * 667FC
        D1=D1-  5                                * 667FF
        D=D-1   A                                * 66802
        DAT1=A  A                                * 66804
        C=R2                                     * 66807
        D0=C                                     * 6680A
        LC(5)   XYGROBDISP                       * 6680D
        A=C     A                                * 66814
        PC=(A)                                   * 66816
        RPL

* refs (8): 68E2C 68EE5 692F1 69A27 6A14F 6D546 ...
* #b -> : measure and lay out again from the box's parent up to the root, running the size handlers of each level and folding the children's sizes into the parent
EqwRelayout:
        :: BEGIN EqwBoxParent@ DUP#0= case drop;q_58A0C * 6681A
          :: EqwDupBoxFirst@ BEGIN EqwSizeBox    * 66838
EqwRelayout.L1:
            EqwNextUntil                         * 6684C
EqwRelayout.L2:
          ;                                      * 66851
          ZEROSWAP EqwDupBoxFirst@ ZEROZERO 4PICK EqwBoxType@ #1= ITE * 66856
          EqwSizeRow EqwSizeCol                  * 66879
          DUP ?SKIP SWAPDROP                     * 66883
          NOT_UNTIL ;                            * 66892

* refs (1): 66847
* #b -> #b: run the size handler of a box (table by +14), or walk down to the first child; leaves the caller's loop through RDROP when there is nothing below
EqwSizeBox:
        CON(5)  (*)+5                            * 6689C  primitive code object
        ASSEMBLE
        GOSBVL  EqwPOP#>Box                      * 668A1
        D1=D1-  5                                * 668A8
        D=D-1   A                                * 668AB
EqwSizeBox.loop1:
        A=DAT0  S                                * 668AD
        D0=D0+  10                               * 668B1
        D0=D0+  10                               * 668B4
        A=0     A                                * 668B7
        A=DAT0  B                                * 668B9
        ?A#0    S                                * 668BC
        GOYES   EqwSizeBox.L3                    * 668BF
        ?A=0    B                                * 668C1
        GOYES   EqwSizeBox.L3                    * 668C4
        A=A+1   B                                * 668C6
        GONC    EqwSizeBox.L2                    * 668C9
        GOVLNG  EqwBoxSizeH@~1.L5                * 668CC
EqwSizeBox.L2:
        A=A-1   B                                * 668D3
        GOSBVL  EqwSizeH>A                       * 668D6
        D0=(5)  EqwRelayout.L1                   * 668DD
        PC=(A)                                   * 668E4
EqwSizeBox.L3:
        D0=D0+  10                               * 668E8
        A=0     A                                * 668EB
        A=DAT0  X                                * 668ED
        ?A=0    A                                * 668F1
        GOYES   EqwSizeBox.L4                    * 668F4
        R3=A.F  A                                * 668F6
        D1=D1+  5                                * 668FC
        D=D+1   A                                * 668FF
        GOSBVL  SUB_67918                        * 66901
        A=R3.F  A                                * 66908
        GOSBVL  EqwA>BoxR2                       * 6690E
        GOTO    EqwSizeBox.loop1                 * 66915
EqwSizeBox.L4:
        D1=D1+  5                                * 66919
        D=D+1   A                                * 6691C
        D0=(5)  EqwRelayout.L2                   * 6691E
        LA(5)   RDROP                            * 66925
        PC=(A)                                   * 6692F
        RPL

* refs (1): 66879
* Fold the children of a row (type 1) into the parent's size
EqwSizeRow:
        :: BINT0 4ROLL EqwRowLoop OVER#+ EqwSizeRow~1 ; * 66933

* refs (1): 6687E
* Fold the children of a column into the parent's size: the widest child's width, the sum of the heights
EqwSizeCol:
        :: ROT BEGIN EqwDupBoxPlaceH@ #0=?SKIP   * 66956
          :: 5ROLLDROP EqwDupBoxPlaceH@ 5UNROLL ; EqwDupBoxW@ 4ROLL #MAX * 6696F
          3UNROLL EqwDupBoxH@ ROT#+ SWAP EqwNextUntil ZEROSWAP * 66997

* refs (1): 6694C
EqwSizeRow~1:
          :: EqwSizeCol~1 6UNROLL 4PICK 4ROLLROT EqwBoxWH! OVER 4ROLL * 669B5
            EqwRunPlaceH ROT DUP#0=ITE DROP SWAPDROP EqwSizeCol~2 SWAP ; * 669DD
        ;                                        * 66A05

* refs (1): 66942
* Walk the children of a row, keeping the largest ascent and depth and the summed width
EqwRowLoop:
        CON(5)  (*)+5                            * 66A0A  primitive code object
        ASSEMBLE
EqwRowLoop.loop1:
        GOSBVL  EqwPOP#>Box                      * 66A0F
        D1=D1+  15                               * 66A16
        D1=D1+  10                               * 66A19
        D0=D0+  10                               * 66A1C
        D0=D0+  12                               * 66A1F
        A=0     A                                * 66A22
        A=DAT0  B                                * 66A24
        ?A#0    B                                * 66A27
        GOYES   EqwRowLoop.L2                    * 66A2A
        D1=D1-  5                                * 66A2C
        D=D-1   A                                * 66A2F
        GONC    EqwRowLoop.L3                    * 66A31
EqwRowLoop.L2:
        GOSBVL  EqwPush#H                        * 66A34
EqwRowLoop.L3:
        C=0     A                                * 66A3B
        D0=D0-  5                                * 66A3D
        C=DAT0  X                                * 66A40
        R0=C                                     * 66A44
        D0=D0-  3                                * 66A47
        C=DAT0  X                                * 66A4A
        R3=C                                     * 66A4E
        D0=D0-  6                                * 66A51
        C=DAT0  X                                * 66A54
        R1=C                                     * 66A58
        D1=D1-  15                               * 66A5B
        D1=D1-  10                               * 66A5E
        D=D-1   A                                * 66A61
        GOSBVL  POP#                             * 66A63
        R4=A                                     * 66A6A
        GOSBVL  POP#                             * 66A6D
        AR3EX                                    * 66A74
        C=R1                                     * 66A77
        C=A-C   A                                * 66A7A
        GONC    EqwRowLoop.L4                    * 66A7C
        C=0     A                                * 66A7F
EqwRowLoop.L4:
        A=R3                                     * 66A81
        ?C<=A   A                                * 66A84
        GOYES   EqwRowLoop.L5                    * 66A87
        A=C     A                                * 66A89
EqwRowLoop.L5:
        R3=A                                     * 66A8B
        GOSBVL  POP#                             * 66A8E
        C=R1                                     * 66A95
        ?C>=A   A                                * 66A98
        GOYES   EqwRowLoop.L6                    * 66A9B
        C=A     A                                * 66A9D
EqwRowLoop.L6:
        R1=C                                     * 66A9F
        GOSBVL  POP#                             * 66AA2
        C=R0                                     * 66AA9
        C=C+A   A                                * 66AAC
        R0=C                                     * 66AAE
        D0=D0+  10                               * 66AB1
        D0=D0+  12                               * 66AB4
        C=0     A                                * 66AB7
        C=DAT0  X                                * 66AB9
        CR2EX                                    * 66ABD
        D0=C                                     * 66AC0
        GOSBVL  SAVPTR                           * 66AC3
        GOSBVL  PUSH2#                           * 66ACA
        GOSBVL  SAVPTR                           * 66AD1
        C=R3                                     * 66AD8
        R0=C                                     * 66ADB
        C=R4                                     * 66ADE
        R1=C                                     * 66AE1
        GOSBVL  PUSH2#                           * 66AE4
        D1=D1+  5                                * 66AEB
        D=D+1   A                                * 66AEE
        A=R2                                     * 66AF0
        ?A=0    A                                * 66AF3
        GOYES   EqwRowLoop.L7                    * 66AF6
        CD0EX                                    * 66AF8
        R2=C                                     * 66AFB
        GOSBVL  SUB_67918                        * 66AFE
        C=R2                                     * 66B05
        D0=C                                     * 66B08
        GOTO    EqwRowLoop.loop1                 * 66B0B
EqwRowLoop.L7:
        A=DAT0  A                                * 66B0F
        D0=D0+  5                                * 66B12
        PC=(A)                                   * 66B15

* refs (1): 669BA
* Probably: compare the new height and width with those in the box; FALSE when both are unchanged
EqwSizeCol~1:
        CON(5)  (*)+5                            * 66B19  primitive code object
        D1=D1+  15                               * 66B1E
        D1=D1+  5                                * 66B21
        A=DAT1  A                                * 66B24
        D1=D1-  10                               * 66B27
        LC(5)   BINT0                            * 66B2A
        ?C=A    A                                * 66B31
        GOYES   EqwSizeCol~1.L1                  * 66B34
        D1=D1-  10                               * 66B36
        GOTO    EqwSizeCol~1.L4                  * 66B39
EqwSizeCol~1.L1:
        A=DAT1  A                                * 66B3D
        AD0EX                                    * 66B40
        D0=D0+  5                                * 66B43
        C=DAT0  A                                * 66B46
        R1=C                                     * 66B49
        D1=D1-  10                               * 66B4C
        C=DAT1  A                                * 66B4F
        D0=C                                     * 66B52
        D0=D0+  5                                * 66B55
        C=DAT0  A                                * 66B58
        R3=C                                     * 66B5B
        D0=A                                     * 66B5E
        D1=D1+  15                               * 66B61
        GOSBVL  EqwPOP#>Box                      * 66B64
        D=D-1   A                                * 66B6B
        D1=D1-  10                               * 66B6D
        D1=D1-  10                               * 66B70
        D0=D0+  14                               * 66B73
        A=0     A                                * 66B76
        A=DAT0  X                                * 66B78
        C=R3                                     * 66B7C
        ?C#A    A                                * 66B7F
        GOYES   EqwSizeCol~1.L3                  * 66B82
        D0=D0+  3                                * 66B84
        A=DAT0  X                                * 66B87
        C=R2                                     * 66B8B
        D0=C                                     * 66B8E
        C=R1                                     * 66B91
        ?C#A    A                                * 66B94
        GOYES   EqwSizeCol~1.L3                  * 66B97
EqwSizeCol~1.L2:
        GOVLNG  PushFLoop                        * 66B99
EqwSizeCol~1.L3:
        C=R2                                     * 66BA0
        D0=C                                     * 66BA3
EqwSizeCol~1.L4:
        GOVLNG  PushTLoop                        * 66BA6

* refs (9): 49AAB 694AE 6A339 6A3ED 6EA23 6F77F ...
* #v -> flag: TRUE when bit 19 is set in a value of field +18, which marks the box of an operator
EqwIdxOp?:
        CON(5)  (*)+5                            * 66BAD  primitive code object
        GOSBVL  POP#                             * 66BB2
        A=A+A   A                                * 66BB9
        GOC     EqwSizeCol~1.L4                  * 66BBB
        GONC    EqwSizeCol~1.L2                  * 66BBE

* refs (1): 669F6
* Probably: store the reference point (+08, +0B) of a box, turning the flag below it to TRUE when the old value differed
EqwSizeCol~2:
        CON(5)  (*)+5                            * 66BC1  primitive code object
        D1=D1+  10                               * 66BC6
        GOSBVL  EqwPOP#>Box                      * 66BC9
        D1=D1-  15                               * 66BD0
        D0=D0+  8                                * 66BD3
        C=0     A                                * 66BD6
        C=DAT0  X                                * 66BD8
        GOSBVL  POP#                             * 66BDC
        DAT0=A  X                                * 66BE3
        GOSBVL  POP#                             * 66BE7
        D0=D0+  3                                * 66BEE
        DAT0=A  X                                * 66BF1
        CR2EX                                    * 66BF5
        D0=C                                     * 66BF8
        C=R2                                     * 66BFB
        D1=D1-  10                               * 66BFE
        A=DAT1  A                                * 66C01
        D1=D1+  10                               * 66C04
        D=D-1   A                                * 66C07
        ?C#A    A                                * 66C09
        GOYES   EqwSizeCol~2.L2                  * 66C0C
EqwSizeCol~2.loop1:
        A=DAT0  A                                * 66C0E
        D0=D0+  5                                * 66C11
        PC=(A)                                   * 66C14
EqwSizeCol~2.L2:
        LC(5)   TRUE                             * 66C18
        D1=D1+  5                                * 66C1F
        DAT1=C  A                                * 66C22
        D1=D1-  5                                * 66C25
        GOTO    EqwSizeCol~2.loop1               * 66C28
        RPL

* refs (1): 6842A
OBJ_66C2C:
        :: OBJ_66C8B EqwBoxFirst@ EqwBoxH@ #1+ ; * 66C2C

* refs (1): 6842F
OBJ_66C4A:
        :: EqwDupBoxFirst@ EqwBoxWH@ SWAP #2/ SWAPROT EqwBoxParent@ * 66C4A
          EqwBoxFirst@ EqwBoxRefY@ #+ #2- ;      * 66C6D

* refs (1): 68434
OBJ_66C86:
        ::                                       * 66C86

* refs (5): 66101 6611F 66543 66C31 66CBD
OBJ_66C8B:
          :: EqwDupBoxW@ #2/ SWAP ; EqwBoxLast@ EqwBoxRefY@ #2+ ; * 66C8B

* refs (1): 6843E
OBJ_66CB8:
        :: OBJ_66C8B EqwBoxPrev@ EqwBoxPrev@ EqwBoxRefY@ ; * 66CB8

* refs (2): 666D8 69BF1
* -> #1 ...: the root's reference goes at row 27 of the grob, or lower when the box is taller; then every box gets its x,y
EqwPlaceAll:
        :: BINT1 BINT27 OVER EqwBoxRefY@ 2DUP#> ITE * 66CD6
          :: DUPUNROT #- ;                       * 66CF9
          :: SWAPDROP BINT0 ;                    * 66D0D
          3PICKOVER                              * 66D21

* refs (1): 44DF4
* #b #y -> : put a box at x = 0 and this y
EqwBoxX0Y!:
          :: OVER BINT0 EqwBoxX! EqwBoxY! ; #+ BINT0 ROT EqwBoxFirst@ GOTO * 66D26
          EqwPlaceAll~1 ;                        * 66D5D

* refs (1): 66DDA
* #b -> : place the children of a row: each goes at y = reference - its +08, x grows by each width
EqwPlaceRow:
        :: EqwRowStart 3UNROLL                   * 66D67
EqwPlaceAll~1:
          BEGIN 3PICKOVER EqwBoxRefY@ #- OVERSWAP 4PICKSWAP EqwMoveBox * 66D76
          EqwDupBoxW@ EqwPlaceNext NOT_UNTIL 2DROP ; * 66D99

* refs (2): 66D9E 66E4D
* Recurse into a placed child (EqwPlaceRow for type 1, EqwPlaceCol otherwise), then step to its next sibling
EqwPlaceNext:
        :: ROT#+SWAP EqwBoxLeaf? ?SKIP           * 66DB2
          :: DUP EqwDupBoxType@ #1=case EqwPlaceRow * 66DC6
            EqwPlaceCol ;                        * 66DDF
          EqwNext? ;                             * 66DE9

* refs (1): 66DDF
* #b -> : place the children of a column: each goes at x = centre - its +0B, y grows by each height
EqwPlaceCol:
        :: DUP EqwBoxRefX@ OVER EqwBoxX@ #+SWAP EqwDupBoxFirst@ SWAP * 66DF3
          EqwBoxY@ SWAP BEGIN 3PICKOVER EqwBoxRefX@ #- OVERSWAP 4PICK * 66E1B
          EqwMoveBox EqwDupBoxH@ EqwPlaceNext NOT_UNTIL 2DROP ; * 66E43

* refs (2): 66D94 66E43
* #b #x #y: store a position with EqwBoxXY! and clear the box's drawn bit
EqwMoveBox:
        :: EqwBoxXY! 3PICK EqwBoxUndrawn EqwMoveBox~1 ; * 66E61

* refs (2): 6E0F3 6F44B
* Blank cell grob for the small size level
OBJ_66E7F:
        GROB    "images/66E7F.png"               * 66E7F  4 x 6
        BSS     6                                * 66E9F  zeros

* -> grob
* refs (1): 6C986
BigCursor:
        GROB    "images/66EA5-BigCursor.png"     * 66EA5  6 x 10

* -> grob
* refs (1): 6C995
MediumCursor:
        GROB    "images/66ECD-MediumCursor.png"  * 66ECD  6 x 8

* -> grob
* refs (1): 6C99A
SmallCursor:
        GROB    "images/66EF1-SmallCursor.png"   * 66EF1  4 x 6

* refs (1): 66011
OBJ_66F11:
        GROB    "images/66F11.png"               * 66F11  16 x 18

* refs (1): 6CB98
KeyAccent~4:
        GROB    "images/66F6D.png"               * 66F6D  3 x 8

* refs (1): 44C55
OBJ_66F91:
        GROB    "images/66F91.png"               * 66F91  6 x 6

* refs (2): 6E0FE 6F446
* Blank cell grob for the medium size level
OBJ_66FB1:
        GROB    "images/66FB1.png"               * 66FB1  6 x 8

* refs (1): 6FB22
EqwSelectBox~1:
        GROB    "images/66FD5.png"               * 66FD5  5 x 4

* refs (6): 44D31 6662E 6CE20 6CF38 6D828 6DA3F
* #w -> grob: 2 rows high, top row black: the fraction bar and the vinculum of a root
EqwBarGrob:
        :: BINT2 SWAP MAKEGROB                   * 66FF1

Code_67005:
          CODE                                   * 67005  34 nibbles
            ST=0    0                            * 6700F
            GOSUB   EqwBarGrob~1                 * 67012
            C=R1.F  A                            * 67016
            D=C     A                            * 6701C
            A=R0.F  A                            * 6701E
            D1=A                                 * 67024
            A=DAT0  A                            * 67027
            D0=D0+  5                            * 6702A
            PC=(A)                               * 6702D
          ENDCODE                                * 67031
        ;                                        * 67031
        ASSEMBLE

* refs (1): 67012
EqwBarGrob~1:
        A=DAT1  A                                * 67036
        AD1EX                                    * 67039
        R0=A.F  A                                * 6703C
        D1=D1+  10                               * 67042
        A=DAT1  A                                * 67045
        R2=A.F  A                                * 67048
        D1=D1+  5                                * 6704E
        A=DAT1  A                                * 67051
        D1=D1+  5                                * 67054
        LC(1)   #3                               * 67057
        C=C&A   P                                * 6705A
        CSRC                                     * 6705E
        C=A     A                                * 67061
        SB=0                                     * 67063
        CSRB.F  A                                * 67066
        CSRB.F  A                                * 6706B
        ?SB=0                                    * 67070
        GOYES   EqwBarGrob~1.L1                  * 67073
        C=C+1   A                                * 67075
EqwBarGrob~1.L1:
        ?C#0    S                                * 67077
        GOYES   EqwBarGrob~1.L2                  * 6707A
        C=C+1   A                                * 6707C
EqwBarGrob~1.L2:
        R4=C.F  A                                * 6707E
        DCEX    A                                * 67084
        R1=C.F  A                                * 67086
        GOSBVL  w->W                             * 6708C
        R3=A.F  A                                * 67093
        C=A     A                                * 67099
        AD1EX                                    * 6709B
        ?ST=0   0                                * 6709E
        GOYES   EqwBarGrob~1.L3                  * 670A1
        A=A+C   A                                * 670A3
EqwBarGrob~1.L3:
        D1=A                                     * 670A5
        D=D-1   A                                * 670A8
        RTNC                                     * 670AA
        LC(1)   #F                               * 670AD
        D=D-1   A                                * 670B0
        GOC     EqwBarGrob~1.L5                  * 670B2
EqwBarGrob~1.loop4:
        DAT1=C  1                                * 670B5
        D1=D1+  1                                * 670B9
        D=D-1   A                                * 670BC
        GONC    EqwBarGrob~1.loop4               * 670BE
EqwBarGrob~1.L5:
        C=C-1   S                                * 670C1
        GONC    EqwBarGrob~1.L6                  * 670C4
        D1=D1-  1                                * 670C7
        LC(1)   #7                               * 670CA
        DAT1=C  P                                * 670CD
        RTNCC                                    * 670D1
EqwBarGrob~1.L6:
        C=C-1   S                                * 670D3
        GOC     EqwBarGrob~1.L8                  * 670D6
        C=0     P                                * 670D9
EqwBarGrob~1.loop7:
        C=C+C   P                                * 670DC
        C=C+1   P                                * 670DF
        C=C-1   S                                * 670E2
        GONC    EqwBarGrob~1.loop7               * 670E5
        DAT1=C  1                                * 670E8
EqwBarGrob~1.L8:
        RTNCC                                    * 670EC

* refs (1): 44CAF
* grob -> grob: draw an integral sign down a blank grob
EqwIntegralGrob:
        CON(5)  (*)+5                            * 670EE  primitive code object
        GOSUB   SUB_67136                        * 670F3
        LC(2)   #08                              * 670F7
        DAT1=C  B                                * 670FB
        D1=D1+  2                                * 670FE
        LC(2)   #14                              * 67101
        DAT1=C  B                                * 67105
        D1=D1+  2                                * 67108
        LC(2)   #04                              * 6710B
        GOSUB   SUB_67129                        * 6710F
        LC(1)   #5                               * 67113
        DAT1=C  B                                * 67116
        D1=D1+  2                                * 67119
        LC(1)   #2                               * 6711C
        DAT1=C  B                                * 6711F
EqwIntegralGrob.L1:
        GOVLNG  GETPTRLOOP                       * 67122

* refs (4): 6710F 67131 67173 671A8
SUB_67129:
        DAT1=C  B                                * 67129
        D1=D1+  2                                * 6712C
        D=D-1   A                                * 6712F
        GONC    SUB_67129                        * 67131
        RTN                                      * 67134

* refs (3): 670F3 67162 67198
SUB_67136:
        GOSUB   SAVPTR~jump_21                   * 67136
        A=DAT1  A                                * 6713A
        D1=A                                     * 6713D
        D1=D1+  10                               * 67140
        C=DAT1  A                                * 67143
        C=C-CON A,5                              * 67146
        GOC     EqwIntegralGrob.L1               * 6714C
        D=C     A                                * 6714F
        D1=D1+  10                               * 67151
        RTN                                      * 67154

* refs (1): 67136
SAVPTR~jump_21:
        GOVLNG  SAVPTR                           * 67156

* refs (1): 44CE1
* grob -> grob: draw the left part of a radical sign down a blank grob
EqwRadicalGrob:
        CON(5)  (*)+5                            * 6715D  primitive code object
        GOSUB   SUB_67136                        * 67162
        LC(2)   #0C                              * 67166
        DAT1=C  B                                * 6716A
        D1=D1+  2                                * 6716D
        LC(1)   #4                               * 67170
        GOSUB   SUB_67129                        * 67173
        LC(1)   #5                               * 67177
        DAT1=C  B                                * 6717A
        D1=D1+  2                                * 6717D
        LC(1)   #6                               * 67180
        DAT1=C  B                                * 67183
        D1=D1+  2                                * 67186
        LC(1)   #4                               * 67189
        DAT1=C  B                                * 6718C
        GOTO    EqwIntegralGrob.L1               * 6718F

* refs (1): 44D8B
* grob -> grob: draw a vertical line down a blank grob
EqwVBarGrob:
        CON(5)  (*)+5                            * 67193  primitive code object
        GOSUB   SUB_67136                        * 67198
        LC(5)   #00004                           * 6719C
        D=D+C   A                                * 671A3
        LC(1)   #1                               * 671A5
        GOSUB   SUB_67129                        * 671A8
        GOTO    EqwIntegralGrob.L1               * 671AC

* refs (1): 6D4A1
* grob -> grob: draw a right parenthesis of the grob's height
EqwRParenGrob:
        CON(5)  (*)+5                            * 671B0  primitive code object
        ST=0    0                                * 671B5
        ST=0    3                                * 671B8
        GOTO    EqwLParenGrob.L1                 * 671BB

* refs (1): 44C64
* grob -> grob: draw a left parenthesis of the grob's height
EqwLParenGrob:
        CON(5)  (*)+5                            * 671BF  primitive code object
        ST=1    0                                * 671C4
        ST=0    3                                * 671C7
EqwLParenGrob.L1:
        GOSBVL  SAVPTR                           * 671CA
        A=DAT1  A                                * 671D1
        D1=A                                     * 671D4
        D1=D1+  10                               * 671D7
        C=DAT1  A                                * 671DA
        D=C     A                                * 671DD
        D1=D1+  5                                * 671DF
        A=DAT1  A                                * 671E2
        D1=D1+  5                                * 671E5
        AD1EX                                    * 671E8
        R0=A.F  A                                * 671EB
        AD1EX                                    * 671F1
        GOSBVL  w->W                             * 671F4
        B=A     A                                * 671FB
        ?ST=0   3                                * 671FD
        GOYES   EqwLParenGrob.L2                 * 67200
        LC(1)   #8                               * 67202
        DAT1=C  P                                * 67205
        GOSUB   EqwParenRow                      * 67209
        LC(1)   #4                               * 6720D
        DAT1=C  P                                * 67210
        D1=D1+  1                                * 67214
        P=      15                               * 67217
        LC(1)   #1                               * 67219
        P=      0                                * 6721C
        GOSUB   EqwParenDot                      * 6721E
        D1=D1-  1                                * 67222
        GONC    EqwLParenGrob.L5                 * 67225
EqwLParenGrob.L2:
        D=D-1   A                                * 67228
        P=      15                               * 6722A
        LC(1)   #1                               * 6722C
        ?ST=0   0                                * 6722F
        GOYES   EqwLParenGrob.L3                 * 67232
        LC(1)   #8                               * 67234
EqwLParenGrob.L3:
        P=      0                                * 67237
        GOSUB   EqwParenDot                      * 67239
        GOSUB   EqwParenRow                      * 6723D
        P=      15                               * 67241
        LC(1)   #2                               * 67243
        ?ST=0   0                                * 67246
        GOYES   EqwLParenGrob.L4                 * 67249
        LC(1)   #4                               * 6724B
EqwLParenGrob.L4:
        P=      0                                * 6724E
        GOSUB   EqwParenDot                      * 67250
EqwLParenGrob.L5:
        P=      15                               * 67254
        LC(1)   #2                               * 67256
        ?ST=1   0                                * 67259
        GOYES   EqwLParenGrob.L6                 * 6725C
        LC(1)   #4                               * 6725E
EqwLParenGrob.L6:
        P=      0                                * 67261
        C=0     A                                * 67263
        LC(1)   #5                               * 67265
        D=D-C   A                                * 67268
EqwLParenGrob.loop7:
        GOSUB   EqwParenRow                      * 6726A
        GOSUB   EqwParenDot                      * 6726E
        D=D-1   A                                * 67272
        GONC    EqwLParenGrob.loop7              * 67274
        P=      15                               * 67277
        ?ST=1   3                                * 67279
        GOYES   EqwLParenGrob.L10                * 6727C
        LC(1)   #2                               * 6727E
        ?ST=0   0                                * 67281
        GOYES   EqwLParenGrob.loop8              * 67284
        LC(1)   #4                               * 67286
EqwLParenGrob.loop8:
        P=      0                                * 67289
        GOSUB   EqwParenRow                      * 6728B
        GOSUB   EqwParenDot                      * 6728F
        GOSUB   EqwParenRow                      * 67293
        P=      15                               * 67297
        LC(1)   #1                               * 67299
        ?ST=0   0                                * 6729C
        GOYES   EqwLParenGrob.L9                 * 6729F
        LC(1)   #8                               * 672A1
EqwLParenGrob.L9:
        P=      0                                * 672A4
        GOSUB   EqwParenDot                      * 672A6
        GOTO    EqwIntegralGrob.L1               * 672AA
EqwLParenGrob.L10:
        LC(1)   #5                               * 672AE
        DAT1=C  P                                * 672B1
        GOSUB   EqwParenRow                      * 672B5
        LC(1)   #2                               * 672B9
        DAT1=C  P                                * 672BC
        GOTO    EqwLParenGrob.loop8              * 672C0

* refs (6): 6721E 67239 67250 6726E 6728F 672A6
* OR the nibble in C.S into the grob row at D1
EqwParenDot:
        A=DAT1  S                                * 672C4
        A=A!C   S                                * 672C8
        DAT1=A  S                                * 672CC
        RTN                                      * 672D0

* refs (6): 67209 6723D 6726A 6728B 67293 672B5
* D1 += B: next grob row
EqwParenRow:
        CD1EX                                    * 672D2
        C=C+B   A                                * 672D5
        D1=C                                     * 672D7
        RTN                                      * 672DA
        RPL

* refs (2): 2DFEB 2F8C1
OBJ_672DC:
        # C17                                    * 672DC  3095

* refs (11): 68909 69599 695E9 69950 699EB 69AF4 ...
* -> #n: frames on the work stack (KEYLIST - STACKNUM)
EqwFrames:
        CON(5)  (*)+5                            * 672E6  primitive code object
        ASSEMBLE
        LC(5)   KEYLIST                          * 672EB
        CD0EX                                    * 672F2
        RSTK=C                                   * 672F5
        A=DAT0  A                                * 672F7
        D0=(5)  STACKNUM                         * 672FA
        C=DAT0  A                                * 67301
        A=A-C   A                                * 67304
        C=RSTK                                   * 67306
        D0=C                                     * 67308
        GOTO    EqwBoxCount.L2                   * 6730B
        BSS     14                               * 6730F  zeros
        RPL

* refs (2): 6AC8F 6C3DE
OBJ_6731D:
        :: EqwKidsLevel EqwPastFrames EqwStkFree@ #+ ; * 6731D

* refs (14): 65C22 65DD7 65DE1 65F0D 6620F 663F9 ...
* -> #n+1: boxes in use + 1, the index the next new box gets
EqwBoxCount#1+:
        CON(5)  (*)+5                            * 6733B  primitive code object
        ASSEMBLE
        C=0     A                                * 67340
        C=C+1   A                                * 67342
        GOTO    EqwBoxCount.L1                   * 67344

* refs (21): 65AA1 65AE2 65B78 65BB9 65BF0 66093 ...
* -> #n+2
EqwBoxCount#2+:
        CON(5)  (*)+5                            * 67348  primitive code object
        C=0     A                                * 6734D
        LC(1)   #2                               * 6734F
        GOTO    EqwBoxCount.L1                   * 67352

* refs (18): 65AEC 65FDF 6602A 66061 660A7 663F4 ...
* -> #n+3
EqwBoxCount#3+:
        CON(5)  (*)+5                            * 67356  primitive code object
        C=0     A                                * 6735B
        LC(1)   #3                               * 6735D
        GOTO    EqwBoxCount.L1                   * 67360

* refs (11): 65AF1 65BF5 660D9 6651B 6A028 6CD49 ...
* -> #n-1
EqwBoxCount#1-:
        CON(5)  (*)+5                            * 67364  primitive code object
        C=0     A                                * 67369
        C=C-1   A                                * 6736B
        GOTO    EqwBoxCount.L1                   * 6736D

* refs (6): 6CE2F 6CE3E 6D50F 6D550 6DAD0 6DD5F
* -> #n-2
EqwBoxCount#2-:
        CON(5)  (*)+5                            * 67371  primitive code object
        LC(5)   #FFFFE                           * 67376
        GOTO    EqwBoxCount.L1                   * 6737D

* refs (62): 65AD8 65AE7 65B3C 65B46 65B6E 65BBE ...
* -> #n: EquationWriter layout: the number of boxes in use (also the newest box's index)
EqwBoxCount:
        CON(5)  (*)+5                            * 67381  primitive code object
        C=0     A                                * 67386
EqwBoxCount.L1:
        RSTK=C                                   * 67388
        LC(5)   MENULEVEL                        * 6738A
        CD0EX                                    * 67391
        A=DAT0  A                                * 67394
        CD0EX                                    * 67397
        C=RSTK                                   * 6739A
        A=A+C   A                                * 6739C
EqwBoxCount.L2:
        GOTO    EqwBoxParent@.L3                 * 6739E

* refs (4): 6867F 69FD8 6C096 6CDAD
* -> #n: free box records (SAVECROSS)
EqwBoxesFree@:
        CON(5)  (*)+5                            * 673A2  primitive code object
        LC(5)   SAVECROSS                        * 673A7
EqwBoxesFree@.L1:
        CD0EX                                    * 673AE
        A=DAT0  A                                * 673B1
        D0=C                                     * 673B4
        GOTO    EqwBoxParent@.L3                 * 673B7

* refs (5): 6C0A0 6C97C 6CB84 6CBA2 6F432
* -> #size: the current size level: 0 large, 1 medium, 2 and up small (AppCount)
EqwSize@:
        CON(5)  (*)+5                            * 673BB  primitive code object
        LC(5)   AppCount                         * 673C0
        CD0EX                                    * 673C7
        A=0     A                                * 673CA
        A=DAT0  B                                * 673CC
        D0=C                                     * 673CF
        GOTO    EqwBoxCount.L2                   * 673D2

* refs (7): 0C4ED 6732C 676D9 69192 6A037 6C1D1 ...
* -> #n: free slots of the object stack (EqPtr)
EqwStkFree@:
        CON(5)  (*)+5                            * 673D6  primitive code object
        LC(5)   EqPtr                            * 673DB
        GOTO    EqwBoxesFree@.L1                 * 673E2

* refs (4): 0C4E8 676F7 69FC9 6C1E0
* -> #n: slots of the object stack (VIEWLEVEL)
EqwStkSize@:
        CON(5)  (*)+5                            * 673E6  primitive code object
        LC(5)   VIEWLEVEL                        * 673EB
        GOTO    EqwBoxesFree@.L1                 * 673F2

* refs (2): 67537 69FDD
* -> #n: free frames (STACKNUM)
EqwFrmFree@:
        CON(5)  (*)+5                            * 673F6  primitive code object
        LC(5)   STACKNUM                         * 673FB
        GOTO    EqwBoxesFree@.L1                 * 67402

* refs (3): 675F8 67742 69FD3
* -> #n: frames allocated (KEYLIST)
EqwFrmSize@:
        CON(5)  (*)+5                            * 67406  primitive code object
        LC(5)   KEYLIST                          * 6740B
        GOTO    EqwBoxesFree@.L1                 * 67412

* refs (61): 4B8F0 65AA6 65B8C 65F99 660AC 661C4 ...
* -> #box: the current (cursor) box, kept in FONTHEIGHT
EqwCurBox@:
        CON(5)  (*)+5                            * 67416  primitive code object
        LC(5)   FONTHEIGHT                       * 6741B
        GOTO    EqwBoxesFree@.L1                 * 67422

* refs (4): 69D1F 6AAE6 6C8B4 6E8C5
* #size -> : set the size level
EqwSize!:
        CON(5)  (*)+5                            * 67426  primitive code object
        GOSBVL  POP#                             * 6742B
        LC(5)   AppCount                         * 67432
        CD0EX                                    * 67439
        DAT0=A  B                                * 6743C
        GOTO    EqwSlot!.L2                      * 6743F

* refs (2): 4B8FA 6E20D
* #box -> #box: DUP, then EqwCurBox!
EqwDupCurBox!:
        CON(5)  DupAndThen                       * 67443  code object: the address of its machine code

* refs (22): 65D00 65D9B 65E04 66246 662AF 66327 ...
* #box -> : make a box current
* The EquationWriter borrows RAM words of the outer loop: MENULEVEL boxes in use, SAVECROSS boxes free, FONTHEIGHT current box, AppCount size level, ITEM1STATE the box table (a hex string), PAINTTREE the undo list, EqPtr/VIEWLEVEL object stack free/size, STACKNUM/KEYLIST frames free/size, PDCHXS size in nibbles of the slot area on the data stack
EqwCurBox!:
        CON(5)  (*)+5                            * 67448  primitive code object
        LC(5)   FONTHEIGHT                       * 6744D
        GOTO    EqwBoxesFree!.L1                 * 67454

* refs (5): 6868E 6A0B9 6C578 6CDB7 6E8CF
* #n ->
EqwBoxesFree!:
        CON(5)  (*)+5                            * 67458  primitive code object
        LC(5)   SAVECROSS                        * 6745D
EqwBoxesFree!.L1:
        GOVLNG  PADCOUNT!.L3                     * 67464

* refs (5): 6A0C3 6A54B 6C596 6CDC1 6E8C0
* #n ->
EqwBoxCount!:
        CON(5)  (*)+5                            * 6746B  primitive code object
        LC(5)   MENULEVEL                        * 67470
        GOTO    EqwBoxesFree!.L1                 * 67477

* refs (5): 676F2 67733 6919C 6A0D2 6C5A0
* #n ->
EqwStkFree!:
        CON(5)  (*)+5                            * 6747B  primitive code object
        LC(5)   EqPtr                            * 67480
        GOTO    EqwBoxesFree!.L1                 * 67487

* refs (3): 67706 6A0CD 6C56E
* #n ->
EqwStkSize!:
        CON(5)  (*)+5                            * 6748B  primitive code object
        LC(5)   VIEWLEVEL                        * 67490
        GOTO    EqwBoxesFree!.L1                 * 67497

* refs (4): 6754B 675F3 6A0B4 6C587
* #n ->
EqwFrmFree!:
        CON(5)  (*)+5                            * 6749B  primitive code object
        LC(5)   STACKNUM                         * 674A0
        GOTO    EqwBoxesFree!.L1                 * 674A7

* refs (3): 67602 6A0BE 6C58C
* #n ->
EqwFrmSize!:
        CON(5)  (*)+5                            * 674AB  primitive code object
        LC(5)   KEYLIST                          * 674B0
        GOTO    EqwBoxesFree!.L1                 * 674B7

* refs (3): 6912E 69454 6EB9F
* -> : drop the top frame
EqwFrmPop:
        CON(5)  (*)+5                            * 674BB  primitive code object
        LC(5)   STACKNUM                         * 674C0
        CD0EX                                    * 674C7
        A=DAT0  A                                * 674CA
        A=A+1   A                                * 674CD
        DAT0=A  A                                * 674CF
        GOTO    EqwSlot!.L2                      * 674D2

* refs (3): 6CDC6 6D4E7 6E8A7
* -> #level: data stack level of slot 0. The slots lie at the bottom of the stack, from EDITLINE - PDCHXS upwards, and hold in order: the objects of the boxes (newest first), the frames, the object stack
EqwSlot0Level:
        CON(5)  (*)+5                            * 674D6  primitive code object
        GOSUB   EqwSlotDepth                     * 674DB
EqwSlot0Level.L1:
        GOSBVL  GETPTR                           * 674DF
        GOTO    EqwBoxParent@.L3                 * 674E6

* refs (2): 674DB 6751E
* -> A.A = stack level of slot 0 (SAVPTR done, D1 clobbered)
EqwSlotDepth:
        GOSBVL  SAVPTR                           * 674EA
        D0=(5)  EDITLINE                         * 674F1
        C=DAT0  A                                * 674F8
        AD1EX                                    * 674FB
        C=C-A   A                                * 674FE
        D0=(5)  PDCHXS                           * 67500
        A=DAT0  A                                * 67507
        C=C-A   A                                * 6750A
        GOSBVL  DIV5                             * 6750C
        A=C     A                                * 67513
        A=A+1   A                                * 67515
        RTN                                      * 67517

* refs (7): 67322 67607 6770B 67C71 68254 6A4E2 ...
* -> #level: stack level of the first slot after the box objects
EqwKidsLevel:
        CON(5)  (*)+5                            * 67519  primitive code object
        GOSUB   EqwSlotDepth                     * 6751E
        D0=(5)  MENULEVEL                        * 67522
        C=DAT0  A                                * 67529
        A=A+C   A                                * 6752C
        GOTO    EqwSlot0Level.L1                 * 6752E
        RPL

* refs (5): 68F62 6947C 6C82D 6EF55 6F02C
* ob5 ob4 ob3 ob2 ob1 -> : push a frame of five objects, growing the area if it is full. Item 1 is a state, 2 the precedence, 4 the operator, 5 the operator's box
EqwFrmPush:
        :: EqwFrmFree@ DUP#0=IT EqwFrmGrow DUP#1- EqwFrmFree! EqwFrmStore ; * 67532

* refs (1): 67550
* ob5..ob1 #free -> : store the five objects in the frame at that free count
EqwFrmStore:
        CON(5)  (*)+5                            * 6755A  primitive code object
        ASSEMBLE
        LC(5)   MENULEVEL                        * 6755F
        CD0EX                                    * 67566
        A=DAT0  A                                * 67569
        D0=C                                     * 6756C
        GOSUB   A*5                              * 6756F
        R0=A                                     * 67573
        GOSBVL  POP#                             * 67576
        A=A-1   A                                * 6757D
        GOSUB   A*5                              * 6757F
        GOSUB   A*5                              * 67583
        R1=A                                     * 67587
        GOSUB   EqwSlotAddr                      * 6758A
        A=R1                                     * 6758E
        C=C+A   A                                * 67591
        D0=C                                     * 67593
        C=DAT1  15                               * 67596
        DAT0=C  15                               * 6759A
        D1=D1+  15                               * 6759E
        D0=D0+  15                               * 675A1
        C=DAT1  10                               * 675A4
        DAT0=C  10                               * 675A8
        D1=D1+  10                               * 675AC
        LC(5)   #00005                           * 675AF
        D=D+C   A                                * 675B6
        GOLONG  EqwBoxPlaceH!.L1                 * 675B8

* refs (4): 6758A 67778 677AD 67F00
* R0 = offset of a slot in nibbles -> C.A = its address, R2 = D0
EqwSlotAddr:
        LC(5)   PDCHXS                           * 675BE
        CD0EX                                    * 675C5
        R2=C.F  A                                * 675C8
        C=DAT0  A                                * 675CE
        D0=(5)  EDITLINE                         * 675D1
        A=DAT0  A                                * 675D8
        A=A-C   A                                * 675DB
        C=R0                                     * 675DD
        C=C+A   A                                * 675E0
        RTN                                      * 675E2
        RPL

* refs (1): 67541
* #free -> #free+6: add six frames, 30 slots
EqwFrmGrow:
        :: #6+ DUP EqwFrmFree! EqwFrmSize@ #6+ EqwFrmSize! EqwKidsLevel #1+ * 675E4
          BINT30                                 * 67611

* refs (2): 6771F 6A4FB
* #level #n -> : insert n blank slots above that level
EqwSlotsInsert:
          :: EqwSlotArea+ ZERO_DO EqwBlank OVER UNROLL LOOP DROP ; ; * 67616

* refs (2): 6A06E 6C819
* #nibbles -> : set the size of the slot area (PDCHXS)
EqwSlotArea!:
        CON(5)  (*)+5                            * 67648  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 6764D
        LC(5)   PDCHXS                           * 67654
        CD0EX                                    * 6765B
        DAT0=A  A                                * 6765E
        GOTO    EqwSlot!.L2                      * 67661

* refs (1): 69FEC
* -> #nibbles
EqwSlotArea@:
        CON(5)  (*)+5                            * 67665  primitive code object
        GOSBVL  SAVPTR                           * 6766A
        D0=(5)  PDCHXS                           * 67671
        A=DAT0  A                                * 67678
        GOVLNG  PUSH#ALOOP                       * 6767B

* refs (3): 6761B 6A979 6C30C
* #n -> #n: add n slots to the size of the slot area
EqwSlotArea+:
        CON(5)  (*)+5                            * 67682  primitive code object
        LC(5)   PDCHXS                           * 67687
        CD1EX                                    * 6768E
        A=DAT1  A                                * 67691
        D1=C                                     * 67694
        R0=A                                     * 67697
        A=DAT1  A                                * 6769A
        AD1EX                                    * 6769D
        D1=D1+  5                                * 676A0
        C=DAT1  A                                * 676A3
        D1=A                                     * 676A6
        A=C     A                                * 676A9
        GOSUB   A*5                              * 676AB
        C=R0                                     * 676AF
        A=A+C   A                                * 676B2
        LC(5)   PDCHXS                           * 676B4
        CD0EX                                    * 676BB
        DAT0=A  A                                * 676BE
        GOTO    EqwSlot!.L2                      * 676C1

* refs (8): 6756F 6757F 67583 676AB 67771 677A6 ...
* A.A *= 5 (C.A = the old A)
A*5:
        C=A     A                                * 676C5
        A=A+A   A                                * 676C7
        A=A+A   A                                * 676C9
        A=A+C   A                                * 676CB
        RTN                                      * 676CD

* refs (3): 68ACB 691BA 69874
* ob -> ob: DUP, then EqwStkPush
EqwDupStkPush:
        CON(5)  DupAndThen                       * 676CF  code object: the address of its machine code
        RPL

* refs (4): 6894F 68E72 690F2 6910B
* ob -> : push onto the object stack, adding 15 slots when it is full
EqwStkPush:
        :: EqwStkFree@ DUP#0=IT                  * 676D4
          :: DROP BINT15 EqwStkFree! EqwStkSize@ BINT15 #+ EqwStkSize! * 676E3
            EqwKidsLevel #1+ EqwPastFrames BINT15 EqwSlotsInsert BINT15 ; * 6770B
          #1-DUP EqwStkFree! EqwBoxCount         * 6772E

* refs (5): 67327 67715 691A6 6A03C 6C1CC
* #i -> #i+5*frames: slot index past the frame area
EqwPastFrames:
          :: EqwFrmSize@ #5* #+ ; #+ EqwSlot! ;  * 6773D

* refs (1): 6775B
* ob #i -> : store a slot
EqwSlot!:
        CON(5)  (*)+5                            * 67765  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 6776A
        GOSUB   A*5                              * 67771
        R0=A                                     * 67775
        GOSUB   EqwSlotAddr                      * 67778
        D0=C                                     * 6777C
        C=DAT1  A                                * 6777F
        D1=D1+  5                                * 67782
        D=D+1   A                                * 67785
        DAT0=C  A                                * 67787
EqwSlot!.L1:
        C=R2                                     * 6778A
EqwSlot!.L2:
        D0=C                                     * 6778D
EqwSlot!.L3:
        A=DAT0  A                                * 67790
        D0=D0+  5                                * 67793
        PC=(A)                                   * 67796

* refs (1): 691B0
* #i -> ob: read a slot
EqwSlot@:
        CON(5)  (*)+5                            * 6779A  primitive code object
        GOSBVL  POP#                             * 6779F
        GOSUB   A*5                              * 677A6
        R0=A                                     * 677AA
        GOSUB   EqwSlotAddr                      * 677AD
        D0=C                                     * 677B1
        C=DAT0  A                                * 677B4
        D1=D1-  5                                * 677B7
        D=D-1   A                                * 677BA
        DAT1=C  A                                * 677BC
        GOTO    EqwSlot!.L1                      * 677BF

* refs (1): 69567
EqwSeparator~1:
        CON(5)  (*)+5                            * 677C3  primitive code object
        GOSUB   EqwTopFrame2                     * 677C8
        C=R2                                     * 677CC
        CD0EX                                    * 677CF
        CD1EX                                    * 677D2
        RSTK=C                                   * 677D5
        GOVLNG  OBJ_28318.L1                     * 677D7

* refs (5): 69CDE 69D57 69D6B 6AE4C 6C8DC
* -> : drop everything above the EquationWriter's stack marker, with the marker, and give the memory back
EqwDropToMark:
        CON(5)  (*)+5                            * 677DE  primitive code object
        ST=0    0                                * 677E3
        GOTO    EqwMarkDepth.L1                  * 677E6

* refs (11): 69D15 69D5C 6A960 6AE74 6AED3 6AF50 ...
* -> #n: level of the EquationWriter's stack marker (EqwMark), 0 when it is not on the stack
EqwMarkDepth:
        CON(5)  (*)+5                            * 677EA  primitive code object
        ST=1    0                                * 677EF
EqwMarkDepth.L1:
        GOSBVL  SAVPTR                           * 677F2
        D0=(5)  EDITLINE                         * 677F9
        C=DAT0  A                                * 67800
        D0=C                                     * 67803
        D0=D0-  5                                * 67806
        B=0     A                                * 67809
        LC(5)   EqwMark                          * 6780B
EqwMarkDepth.loop2:
        A=DAT1  A                                * 67812
        B=B+1   A                                * 67815
        ?C=A    A                                * 67817
        GOYES   EqwMarkDepth.L3                  * 6781A
        D1=D1+  5                                * 6781C
        AD1EX                                    * 6781F
        CD0EX                                    * 67822
        ?C>A    A                                * 67825
        GOYES   EqwMarkDepth.L4                  * 67828
        D1=A                                     * 6782A
        B=0     A                                * 6782D
EqwMarkDepth.L3:
        A=B     A                                * 6782F
        ?ST=0   0                                * 67831
        GOYES   EqwMarkDepth.L5                  * 67834
        GOVLNG  PUSH#ALOOP                       * 67836
EqwMarkDepth.L4:
        CD0EX                                    * 6783D
        D1=A                                     * 67840
        GOC     EqwMarkDepth.loop2               * 67843
EqwMarkDepth.L5:
        ?A#0    A                                * 67846
        GOYES   EqwMarkDepth.L6                  * 67849
        ST=1    0                                * 6784B
EqwMarkDepth.L6:
        D1=D1+  5                                * 6784E
        CD1EX                                    * 67851
        RSTK=C                                   * 67854
        GOSBVL  ADJMEM                           * 67856
        GOSBVL  GETPTR                           * 6785D
        ?ST=1   0                                * 67864
        GOYES   EqwMarkDepth.L7                  * 67867
        C=RSTK                                   * 67869
        D1=C                                     * 6786B
EqwMarkDepth.L7:
        A=DAT0  A                                * 6786E
        D0=D0+  5                                * 67871
        PC=(A)                                   * 67874

* refs (1): 69503
* #from #to -> #b: the box in that range with the largest non-negative field +18
EqwMaxIdxBox:
        CON(5)  (*)+5                            * 67878  primitive code object
        GOSBVL  POP2#                            * 6787D
        CAEX    A                                * 67884
        RSTK=C                                   * 67886
        C=0     A                                * 67888
        R1=C                                     * 6788A
        R3=C                                     * 6788D
EqwMaxIdxBox.loop1:
        R0=A                                     * 67890
        GOSUB   EqwA>Box                         * 67893
        D0=D0+  10                               * 67897
        D0=D0+  14                               * 6789A
        C=DAT0  X                                * 6789D
        A=C     X                                * 678A1
        A=A+A   X                                * 678A4
        GOC     EqwMaxIdxBox.L2                  * 678A7
        A=R1                                     * 678AA
        ?C<=A   X                                * 678AD
        GOYES   EqwMaxIdxBox.L2                  * 678B0
        R1=C                                     * 678B2
        C=R0                                     * 678B5
        R3=C                                     * 678B8
EqwMaxIdxBox.L2:
        A=R0                                     * 678BB
        A=A+1   A                                * 678BE
        C=R2                                     * 678C0
        D0=C                                     * 678C3
        C=RSTK                                   * 678C6
        RSTK=C                                   * 678C8
        ?C>=A   A                                * 678CA
        GOYES   EqwMaxIdxBox.loop1               * 678CD
        A=R3                                     * 678CF
        GOTO    EqwBoxParent@.L3                 * 678D2

* refs (13): 461B4 662E6 663C7 66638 6A190 6E28A ...
* #b -> #b #parent
EqwDupBoxParent@:
        CON(5)  DupAndThen                       * 678D6  code object: the address of its machine code

* refs (20): 6627D 66296 66309 66824 66C68 6945E ...
* #box -> #parent: the box's parent link (field #1B), 0 at the root
EqwBoxParent@:
        CON(5)  (*)+5                            * 678DB  primitive code object
        LC(2)   #1B                              * 678E0
EqwBoxParent@.L1:
        R1=C                                     * 678E4
        GOSUB   EqwPOP#>Box                      * 678E7
        AD0EX                                    * 678EB
        C=0     A                                * 678EE
        C=R1.F  B                                * 678F0
        A=A+C   A                                * 678F6
        D0=A                                     * 678F8
        A=0     A                                * 678FB
        A=DAT0  X                                * 678FD
EqwBoxParent@.L2:
        C=R2                                     * 67901
        D0=C                                     * 67904
* a branch also enters #67908, where the nibbles decode as LC(7) #7431A01
EqwBoxParent@.L3:
        CD0EX                                    * 67907
* the rest of LC(7) #7431A01 at #67908
* a branch also enters #6790A, where the nibbles decode as R2=C
* a branch also enters #6790D, where the nibbles decode as D0=C
* a branch also enters #67910, where the nibbles decode as GOSUB #67918
        NIBHEX  10A1347                          * 6790A  ..C
* the rest of GOSUB #67918 at #67910
        NIBHEX  400                              * 67911  .
        GOTO    EqwSlot!.L3                      * 67914

* refs (8): 6675C 667B6 66901 66AFE 67910 68112 ...
SUB_67918:
        D=D-1   A                                * 67918
        GONC    SUB_67918.L1                     * 6791A
        D=0     A                                * 6791D
        GOTO    SUB_67918.L2                     * 6791F
SUB_67918.L1:
        LC(5)   #0002C                           * 67923
        ?C<=A   A                                * 6792A
        GOYES   SUB_67918.L2                     * 6792D
        A=A+A   A                                * 6792F
        C=A     A                                * 67931
        A=A+A   A                                * 67933
        A=A+A   A                                * 67935
        A=A+C   A                                * 67937
        LC(5)   BINT0                            * 67939
        A=A+C   A                                * 67940
        D1=D1-  5                                * 67942
        DAT1=A  A                                * 67945
        RTNCC                                    * 67948
SUB_67918.L2:
        R0=A                                     * 6794A
        C=R2                                     * 6794D
        D0=C                                     * 67950
        GOSBVL  SAVPTR                           * 67953
        GOSBVL  PUSH#                            * 6795A
        CD0EX                                    * 67961
        R2=C                                     * 67964
        RTNSC                                    * 67967
        RPL

* refs (2): 66DE9 6FEE6
* #b -> #next TRUE, or FALSE at the last sibling
EqwNext?:
        :: EqwBoxNext@ DUP#0= casedrpfls TRUE    * 67969
        ;                                        * 67982

* refs (7): 44C91 44CFF 44D4F 65DCD 66142 6A19A ...
* #b -> #b #next
EqwDupBoxNext@:
        CON(5)  DupAndThen                       * 67987  code object: the address of its machine code

* refs (17): 65CD6 65CDB 65D1E 65D55 65EB3 65EB8 ...
* #b -> #next sibling (field #1E)
EqwBoxNext@:
        CON(5)  (*)+5                            * 6798C  primitive code object
        ASSEMBLE
        LC(2)   #1E                              * 67991
        ST=1    2                                * 67995
        GOTO    EqwBoxParent@.L1                 * 67998

* refs (5): 66124 66665 6A1A4 6CD58 6E12C
* #b -> #b #prev
EqwDupBoxPrev@:
        CON(5)  DupAndThen                       * 6799C  code object: the address of its machine code

* refs (15): 4B8FF 665A2 6661F 66642 66CC2 66CC7 ...
* #b -> #previous sibling (field #21)
EqwBoxPrev@:
        CON(5)  (*)+5                            * 679A1  primitive code object
        LC(2)   #21                              * 679A6
        GOTO    EqwBoxParent@.L1                 * 679AA

* refs (12): 65D28 66205 6635E 66548 66584 665E3 ...
* #b -> #b #first
EqwDupBoxFirst@:
        CON(5)  DupAndThen                       * 679AE  code object: the address of its machine code

* refs (23): 44D18 65D19 65DC8 66106 66129 6613D ...
* #b -> #first child (field #24)
EqwBoxFirst@:
        CON(5)  (*)+5                            * 679B3  primitive code object
        LC(2)   #24                              * 679B8
        GOTO    EqwBoxParent@.L1                 * 679BC

* refs (1): 6F342
* #b -> #b #last
EqwDupBoxLast@:
        CON(5)  DupAndThen                       * 679C0  code object: the address of its machine code

* refs (14): 44D72 65CCC 65DB9 66552 665DE 66CA4 ...
* #b -> #last child (field #27)
EqwBoxLast@:
        CON(5)  (*)+5                            * 679C5  primitive code object
        LC(2)   #27                              * 679CA
        GOTO    EqwBoxParent@.L1                 * 679CE

* refs (4): 66DD0 6F720 6FA3B 6FA5E
* #b -> #b #type
EqwDupBoxType@:
        CON(5)  DupAndThen                       * 679D2  code object: the address of its machine code

* refs (8): 461B9 6686A 6B7C7 6F5FE 6F630 6F6BC ...
* #b -> #type: 0 leaf, 1 row, otherwise a column (field +00)
EqwBoxType@:
        CON(5)  (*)+5                            * 679D7  primitive code object
        GOSUB   EqwPOP#>Box                      * 679DC
        A=0     A                                * 679E0
        A=DAT0  1                                * 679E2
        GOTO    EqwBoxParent@.L2                 * 679E6

* refs (10): 66DBC 68F80 68FCB 694C7 6E8E8 6E9BA ...
* #b -> #b flag: TRUE for a leaf (type 0)
EqwBoxLeaf?:
        CON(5)  (*)+5                            * 679EA  primitive code object
        GOSUB   EqwPOP#>Box                      * 679EF
        D1=D1-  5                                * 679F3
        D=D-1   A                                * 679F6
        A=DAT0  S                                * 679F8
        C=R2                                     * 679FC
        D0=C                                     * 679FF
        ?A=0    S                                * 67A02
        GOYES   EqwBoxLeaf?.L1                   * 67A05
        LC(5)   FALSE                            * 67A07
        GONC    EqwBoxLeaf?.L2                   * 67A0E
EqwBoxLeaf?.L1:
        LC(5)   TRUE                             * 67A11
EqwBoxLeaf?.L2:
        A=C     A                                * 67A18
        PC=(A)                                   * 67A1A

* refs (1): 6A005
* #b -> #size: the box's size level (low 3 bits of field +01)
EqwBoxSize@:
        CON(5)  (*)+5                            * 67A1E  primitive code object
        GOSUB   EqwPOP#>Box                      * 67A23
        D0=D0+  1                                * 67A27
        A=0     A                                * 67A2A
        A=DAT0  1                                * 67A2C
        LC(1)   #7                               * 67A30
        A=A&C   P                                * 67A33
        GOTO    EqwBoxParent@.L2                 * 67A37

* refs (5): 6A71D 6DF64 6DF85 6DFA4 6F0DF
* A.A = #b-1 -> D0 at box b's fields; D0 is first restored from R2
EqwA+1>Box:
        A=A+1   A                                * 67A3B

* refs (1): 6690E
* A.A = #b -> as EqwA>Box, D0 first restored from R2
EqwA>BoxR2:
        C=R2.F  A                                * 67A3D
        D0=C                                     * 67A43
        GOTO    EqwA>Box                         * 67A46

* refs (22): 668A1 66A0F 66B64 66BC9 678E7 679DC ...
* POP# -> D0 at box n's fields (table at ITEM1STATE, 42 nibbles a box); the RPL IP saved in R2
* EquationWriter box record, 42 nibbles, offsets from D0: +00 type; +01 size level (low 3 bits; bit 3 a flag); +02/+05 position y/x (low); +08 vertical reference (medium-low); +0B horizontal centre (medium); +0E height, +11 width (medium-high); +14/+16 size and placement handler indexes; +18 a 12-bit field (#800 marks a value from #8xxxx, FFF is -1); +1B parent; +1E next sibling, +21 previous sibling, +24 first child, +27 last child. Size handlers are called with the parent below the box
EqwPOP#>Box:
        GOSBVL  POP#                             * 67A4A

* refs (6): 66737 67893 67A46 68323 6B3B2 6DF47
* A.A = #b -> D0 at box b's fields, the old D0 in R2
EqwA>Box:
        A=A-1   A                                * 67A51
        A=A+A   A                                * 67A53
        C=A     A                                * 67A55
        ASL     A                                * 67A57
        A=A+C   A                                * 67A59
        C=C+C   A                                * 67A5B
        C=C+C   A                                * 67A5D
        A=A+C   A                                * 67A5F
        LC(5)   ITEM1STATE                       * 67A61
        CD0EX                                    * 67A68
        R2=C.F  A                                * 67A6B
        C=DAT0  A                                * 67A71
        C=C+A   A                                * 67A74
        D0=C                                     * 67A76
        D0=D0+  10                               * 67A79
        RTN                                      * 67A7C

* refs (2): 66E07 67AFE
* #b -> #x (field +05)
EqwBoxX@:
        CON(5)  (*)+5                            * 67A7E  primitive code object
        LC(2)   #05                              * 67A83
        GOTO    EqwBoxParent@.L1                 * 67A87

* refs (3): 66E1B 67B08 6FB18
* #b -> #y (field +02)
EqwBoxY@:
        CON(5)  (*)+5                            * 67A8B  primitive code object
        LC(2)   #02                              * 67A90
        GOTO    EqwBoxParent@.L1                 * 67A94

* refs (5): 66988 66C90 66D99 67AC1 6CD71
* #b -> #b #width
EqwDupBoxW@:
        CON(5)  DupAndThen                       * 67A98  code object: the address of its machine code

* refs (7): 44D0E 44D1D 44D54 6B826 6CE0C 6D334 ...
* #b -> #width (field +11)
EqwBoxW@:
        CON(5)  (*)+5                            * 67A9D  primitive code object
        LC(2)   #11                              * 67AA2
        GOTO    EqwBoxParent@.L1                 * 67AA6

* refs (7): 44C96 44D77 66688 6699C 66E48 6D24E ...
* #b -> #b #height
EqwDupBoxH@:
        CON(5)  DupAndThen                       * 67AAA  code object: the address of its machine code

* refs (10): 6610B 6612E 66192 666B5 66C3B 67ACB ...
* #b -> #height (field +0E)
EqwBoxH@:
        CON(5)  (*)+5                            * 67AAF  primitive code object
        LC(2)   #0E                              * 67AB4
        GOTO    EqwBoxParent@.L1                 * 67AB8
        RPL

* refs (5): 65A0B 66C54 6AD25 6CE4D 6FB45
* #b -> #w #h
EqwBoxWH@:
        :: EqwDupBoxW@ SWAP EqwBoxH@ ;           * 67ABC

* refs (5): 65D5A 66DFD 66E2F 6CD8A 6D3CA
* #b -> #x: the box's horizontal centre, from its left edge (field +0B)
EqwBoxRefX@:
        CON(5)  (*)+5                            * 67AD5  primitive code object
        ASSEMBLE
        LC(2)   #0B                              * 67ADA
        GOTO    EqwBoxParent@.L1                 * 67ADE

* refs (19): 44C73 44D9F 6614C 66557 66679 66692 ...
* #b -> #y: the box's vertical reference, from its top (field +08)
EqwBoxRefY@:
        CON(5)  (*)+5                            * 67AE2  primitive code object
        LC(2)   #08                              * 67AE7
        GOTO    EqwBoxParent@.L1                 * 67AEB

* refs (4): 44DC2 6AD16 6B7BD 6FAE6
* #b -> #b #x #y
EqwDupBoxXY@:
        CON(5)  DupAndThen                       * 67AEF  code object: the address of its machine code
        RPL

* refs (1): 6E7B2
* #b -> #x #y
EqwBoxXY@:
        :: DUP EqwBoxX@ SWAP EqwBoxY@ ;          * 67AF4

* refs (11): 694D6 69FA1 6A2B2 6A32A 6AD02 6EA1E ...
* #b -> #b #v
EqwDupBox#18@:
        CON(5)  DupAndThen                       * 67B12  code object: the address of its machine code

* refs (6): 694A9 6AC71 6EC80 6F667 6F8E7 6FE91
* #b -> #v: the box's place in the expression's object stream (field +18): 0 none, -1 belongs to the enclosing box, bit 19 set for an operator
EqwBox#18@:
        CON(5)  (*)+5                            * 67B17  primitive code object
        ASSEMBLE
        GOSUB   EqwPOP#>Box                      * 67B1C
        D0=D0+  12                               * 67B20
        D0=D0+  12                               * 67B23
        A=0     A                                * 67B26
        C=DAT0  X                                * 67B28
        A=C     X                                * 67B2C
        C=C+1   X                                * 67B2F
        GOC     EqwBox#18@.L2                    * 67B32
        C=A     X                                * 67B35
        C=C+C   X                                * 67B38
        GOC     EqwBox#18@.L3                    * 67B3B
EqwBox#18@.loop1:
        C=R2                                     * 67B3E
        D0=C                                     * 67B41
        GOTO    EqwBoxParent@.L3                 * 67B44
EqwBox#18@.L2:
        A=0     A                                * 67B48
        A=A-1   A                                * 67B4A
        GOC     EqwBox#18@.loop1                 * 67B4C
EqwBox#18@.L3:
        LC(3)   #7FF                             * 67B4F
        A=A&C   X                                * 67B54
        LC(5)   CMOS                             * 67B58
        A=A!C   A                                * 67B5F
        GOTO    EqwBox#18@.loop1                 * 67B63

* refs (1): 66D35
* #b #x ->
EqwBoxX!:
        CON(5)  (*)+5                            * 67B67  primitive code object
        LC(2)   #05                              * 67B6C
EqwBoxX!.L1:
        R1=C.F  B                                * 67B70
        GOSBVL  POP#                             * 67B76
EqwBoxX!.L2:
        C=A     A                                * 67B7D
        RSTK=C                                   * 67B7F
        GOSUB   EqwPOP#>Box                      * 67B81
        AD0EX                                    * 67B85
        C=0     A                                * 67B88
        C=R1.F  B                                * 67B8A
        A=A+C   A                                * 67B90
        D0=A                                     * 67B92
        C=RSTK                                   * 67B95
        DAT0=C  X                                * 67B97
        GOLONG  EqwBoxPlaceH!.L1                 * 67B9B

* refs (1): 66D3A
* #b #y ->
EqwBoxY!:
        CON(5)  (*)+5                            * 67BA1  primitive code object
        LC(2)   #02                              * 67BA6
        GOTO    EqwBoxX!.L1                      * 67BAA

* refs (4): 6CD80 6CE9D 6D348 6D657
* #b #w ->
EqwBoxW!:
        CON(5)  (*)+5                            * 67BAE  primitive code object
        LC(2)   #11                              * 67BB3
        GOTO    EqwBoxX!.L1                      * 67BB7

* refs (4): 6619C 6CE98 6D267 6D316
* #b #h ->
EqwBoxH!:
        CON(5)  (*)+5                            * 67BBB  primitive code object
        LC(2)   #0E                              * 67BC0
        GOTO    EqwBoxX!.L1                      * 67BC4

* refs (2): 6A640 6D541
* #b #parent ->
EqwBoxParent!:
        CON(5)  (*)+5                            * 67BC8  primitive code object
        LC(2)   #1B                              * 67BCD
        GOTO    EqwBoxX!.L1                      * 67BD1

* refs (7): 65D7D 65DDC 65E68 65E9F 66322 663A4 ...
* #b #prev -> : set the previous-sibling link
EqwBoxPrev!:
        CON(5)  (*)+5                            * 67BD5  primitive code object
        LC(2)   #21                              * 67BDA
        GOTO    EqwBoxX!.L1                      * 67BDE

* refs (15): 65DE6 65E95 66214 662AA 66606 6A60E ...
* #b #next -> : set the next-sibling link
EqwBoxNext!:
        CON(5)  (*)+5                            * 67BE2  primitive code object
        LC(2)   #1E                              * 67BE7
        GOTO    EqwBoxX!.L1                      * 67BEB

* refs (6): 65D6E 65E5E 66313 66395 6D230 6E9FB
* #b #first -> : set the first-child link
EqwBoxFirst!:
        CON(5)  (*)+5                            * 67BEF  primitive code object
        LC(2)   #24                              * 67BF4
        GOTO    EqwBoxX!.L1                      * 67BF8

* refs (17): 6623C 662A0 66368 663D1 665C0 66610 ...
* #b #last -> : set the last-child link
EqwBoxLast!:
        CON(5)  (*)+5                            * 67BFC  primitive code object
        LC(2)   #27                              * 67C01
        GOTO    EqwBoxX!.L1                      * 67C05

* refs (5): 44D40 65D5F 67C32 6CD9E 6D352
* #b #x ->
EqwBoxRefX!:
        CON(5)  (*)+5                            * 67C09  primitive code object
        LC(2)   #0B                              * 67C0E
        GOTO    EqwBoxX!.L1                      * 67C12

* refs (6): 44C7D 44DA4 66561 67C2D 6D280 6E163
* #b #y ->
EqwBoxRefY!:
        CON(5)  (*)+5                            * 67C16  primitive code object
        LC(2)   #08                              * 67C1B
        GOTO    EqwBoxX!.L1                      * 67C1F
        RPL

* refs (3): 44E17 6CE75 6DBBB
* #b #x #y -> : set both reference fields (+0B, +08)
EqwBoxRef!:
        :: 3PICKSWAP EqwBoxRefY! EqwBoxRefX! ;   * 67C23

* refs (11): 662D2 6953F 6A2E9 6A384 6CEBB 6D221 ...
* #b #v -> : set field +18 (12 bits; #800 marks a value from #8xxxx, FFF is -1)
EqwBox#18!:
        CON(5)  (*)+5                            * 67C3C  primitive code object
        ASSEMBLE
        GOSUB   EqwBox#18!~1                     * 67C41
        LC(2)   #18                              * 67C45
        R1=C.F  B                                * 67C49
        GOTO    EqwBoxX!.L2                      * 67C4F

* refs (1): 67C41
EqwBox#18!~1:
        GOSBVL  POP#                             * 67C53
        C=A     A                                * 67C5A
        C=C+C   A                                * 67C5C
        RTNNC                                    * 67C5E
        LC(3)   #800                             * 67C61
        A=A!C   X                                * 67C66
        RTN                                      * 67C6A
        RPL

* refs (3): 6B7DB 6FAF0 6FBFE
* #b -> obj: the object in the box's slot, for a leaf its grob
EqwBoxObj@:
        :: EqwKidsLevel #1-SWAP #-PICK ;         * 67C6C

* refs (2): 6CDFD 6D212
* #b #type ->
EqwBoxType!:
        CON(5)  (*)+5                            * 67C85  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 67C8A
        ASRC                                     * 67C91
        GOSUB   EqwPOP#>Box                      * 67C94
EqwBoxType!.L1:
        DAT0=A  S                                * 67C98
        GOLONG  EqwBoxPlaceH!.L1                 * 67C9C

* refs (2): 66E70 6824F
* #b -> : clear the drawn bit, +01 bit 3
EqwBoxUndrawn:
        CON(5)  (*)+5                            * 67CA2  primitive code object
        GOSUBL  EqwPOP#>Box                      * 67CA7
        D0=D0+  1                                * 67CAD
        A=DAT0  S                                * 67CB0
        A=A+A   S                                * 67CB4
        ASRB                                     * 67CB7
        GOTO    EqwBoxType!.L1                   * 67CBA

* refs (4): 69BF6 6B110 6B11A 6E767
* -> : clear the drawn bit of every box, so that the next draw paints them all
EqwAllUndrawn:
        CON(5)  (*)+5                            * 67CBE  primitive code object
        LC(5)   MENULEVEL                        * 67CC3
        CD0EX                                    * 67CCA
        RSTK=C                                   * 67CCD
        A=DAT0  A                                * 67CCF
        D0=(5)  ITEM1STATE                       * 67CD2
        C=DAT0  A                                * 67CD9
        D0=C                                     * 67CDC
        P=      15                               * 67CDF
        LC(1)   #7                               * 67CE1
        P=      0                                * 67CE4
        D0=D0+  11                               * 67CE6
EqwAllUndrawn.loop1:
        A=A-1   A                                * 67CE9
        GOC     EqwAllUndrawn.L2                 * 67CEB
        A=DAT0  S                                * 67CEE
        A=A&C   S                                * 67CF2
        DAT0=A  S                                * 67CF6
        D0=D0+  16                               * 67CFA
        D0=D0+  16                               * 67CFD
        D0=D0+  10                               * 67D00
        GOTO    EqwAllUndrawn.loop1              * 67D03
EqwAllUndrawn.L2:
        C=RSTK                                   * 67D07
        GOLONG  EqwSlot!.L2                      * 67D09

* refs (1): 6F9A5
* -> #b: the selectable leaf with the smallest x: a leaf with size handler 0 or 1 and a non-zero +18
EqwLeftmostLeaf:
        CON(5)  (*)+5                            * 67D0F  primitive code object
        ST=0    0                                * 67D14
        GOTO    EqwRightmostLeaf.L1              * 67D17

* refs (2): 6C438 6F9C3
* -> #b: the selectable leaf with the largest x
EqwRightmostLeaf:
        CON(5)  (*)+5                            * 67D1B  primitive code object
        ST=1    0                                * 67D20
EqwRightmostLeaf.L1:
        GOSBVL  SAVPTR                           * 67D23
        D0=(5)  MENULEVEL                        * 67D2A
        B=0     A                                * 67D31
        C=DAT0  A                                * 67D33
        C=C-1   A                                * 67D36
        RSTK=C                                   * 67D38
        D0=(5)  ITEM1STATE                       * 67D3A
        C=DAT0  A                                * 67D41
        D0=C                                     * 67D44
        D0=D0+  10                               * 67D47
        C=0     X                                * 67D4A
        ?ST=1   0                                * 67D4D
        GOYES   EqwRightmostLeaf.L2              * 67D50
        C=C-1   X                                * 67D52
EqwRightmostLeaf.L2:
        R2=C                                     * 67D55
EqwRightmostLeaf.loop3:
        B=B+1   A                                * 67D58
        A=DAT0  S                                * 67D5A
        D0=D0+  5                                * 67D5E
        ?A=0    S                                * 67D61
        GOYES   EqwRightmostLeaf.L4              * 67D64
        D0=D0+  15                               * 67D66
        D0=D0+  15                               * 67D69
        D0=D0+  7                                * 67D6C
        GOTO    EqwRightmostLeaf.L8              * 67D6F
EqwRightmostLeaf.L4:
        A=DAT0  X                                * 67D73
        D0=D0+  15                               * 67D77
        C=DAT0  B                                * 67D7A
        D=C     B                                * 67D7D
        D0=D0+  4                                * 67D80
        C=DAT0  X                                * 67D83
        D0=D0+  15                               * 67D87
        D0=D0+  3                                * 67D8A
        ?C=0    X                                * 67D8D
        GOYES   EqwRightmostLeaf.L8              * 67D90
        D=D-1   B                                * 67D92
        GOC     EqwRightmostLeaf.L5              * 67D95
        D=D-1   B                                * 67D98
        GOC     EqwRightmostLeaf.L8              * 67D9B
EqwRightmostLeaf.L5:
        C=R2                                     * 67D9E
        ?ST=1   0                                * 67DA1
        GOYES   EqwRightmostLeaf.L6              * 67DA4
        ?C<A    X                                * 67DA6
        GOYES   EqwRightmostLeaf.L8              * 67DA9
        GONC    EqwRightmostLeaf.L7              * 67DAB
EqwRightmostLeaf.L6:
        ?C>A    X                                * 67DAE
        GOYES   EqwRightmostLeaf.L8              * 67DB1
EqwRightmostLeaf.L7:
        R2=A                                     * 67DB3
        C=B     A                                * 67DB6
        R0=C                                     * 67DB8
EqwRightmostLeaf.L8:
        C=RSTK                                   * 67DBB
        C=C-1   A                                * 67DBD
        GOC     EqwRightmostLeaf.L9              * 67DBF
        RSTK=C                                   * 67DC2
        GOTO    EqwRightmostLeaf.loop3           * 67DC4
EqwRightmostLeaf.L9:
        GOVLNG  PUSH#LOOP                        * 67DC8

* refs (2): 68D4B 6E753
* -> ob: item 2 of the top frame, the operator's precedence
EqwFrm2@:
        CON(5)  (*)+5                            * 67DCF  primitive code object
        GOSUB   EqwTopFrame                      * 67DD4
        D0=D0+  5                                * 67DD8
        GOTO    EqwFrm5@.L1                      * 67DDB

* refs (13): 68891 688E1 68913 6904D 690CF 6943B ...
* -> ob: item 1 of the top frame, a state code: 0 for an open parenthesis, otherwise the argument the operator has reached
EqwFrm1@:
        CON(5)  (*)+5                            * 67DDF  primitive code object
        GOSUB   EqwTopFrame                      * 67DE4
        GOTO    EqwFrm5@.L1                      * 67DE8

* refs (6): 6893B 690DE 69982 699D2 6E375 6E96A
* -> ob: item 4 of the top frame, the operator
EqwFrm4@:
        CON(5)  (*)+5                            * 67DEC  primitive code object
        GOSUB   EqwTopFrame                      * 67DF1
        D0=D0+  15                               * 67DF5
        GOTO    EqwFrm5@.L1                      * 67DF8

* refs (2): 4B891 6E712
* -> ob: item 3 of the top frame
EqwFrm3@:
        CON(5)  (*)+5                            * 67DFC  primitive code object
        GOSUB   EqwTopFrame                      * 67E01
        D0=D0+  10                               * 67E05
        GOTO    EqwFrm5@.L1                      * 67E08

* refs (13): 4B8E1 65CC7 65D0F 65DB4 661FB 662BE ...
* -> #box: item 5 of the top frame, the box of the operator
EqwFrm5@:
        CON(5)  (*)+5                            * 67E0C  primitive code object
        GOSUB   EqwTopFrame                      * 67E11
        D0=D0+  15                               * 67E15
        D0=D0+  5                                * 67E18
EqwFrm5@.L1:
        A=DAT0  A                                * 67E1B
        C=R2                                     * 67E1E
        D0=C                                     * 67E21
        D1=D1-  5                                * 67E24
        DAT1=A  A                                * 67E27
        A=DAT0  A                                * 67E2A
        D0=D0+  5                                * 67E2D
        PC=(A)                                   * 67E30

* refs (7): 65E36 6633B 6959E 69955 69AF9 6C05F ...
* #n -> #n ob: item 1 of frame n
EqwDupFrmN1@:
        CON(5)  DupAndThen                       * 67E34  code object: the address of its machine code

* refs (1): 6AA91
* #n -> ob: item 1 of frame n, frame 1 being the oldest
EqwFrmN1@:
        CON(5)  (*)+5                            * 67E39  primitive code object
        GOSUB   EqwFrameN                        * 67E3E
        GONC    EqwFrm5@.L1                      * 67E42  always taken

* refs (1): 6C073
* #n -> ob
EqwFrmN3@:
        CON(5)  (*)+5                            * 67E45  primitive code object
        GOSUB   EqwFrameN                        * 67E4A
        D0=D0+  10                               * 67E4E
        GONC    EqwFrm5@.L1                      * 67E51  always taken

* refs (6): 6F13A 6F2A7 6F31F 6F3CE 6F55E 6FF36
* #n -> ob
EqwFrmN4@:
        CON(5)  (*)+5                            * 67E54  primitive code object
        GOSUB   EqwFrameN                        * 67E59
        D0=D0+  15                               * 67E5D
        GOTO    EqwFrm5@.L1                      * 67E60

* refs (12): 65E4A 66354 66381 6C069 6E253 6F180 ...
* #n -> #box
EqwFrmN5@:
        CON(5)  (*)+5                            * 67E64  primitive code object
        GOSUB   EqwFrameN                        * 67E69
        D0=D0+  10                               * 67E6D
        D0=D0+  10                               * 67E70
        GOTO    EqwFrm5@.L1                      * 67E73

* refs (5): 67DD4 67DE4 67DF1 67E01 67E11
* -> D0 at the top frame, one stack level reserved
EqwTopFrame:
        GOSUB   EqwNeed1                         * 67E77

* refs (3): 677C8 67F4A 69670
* -> D0 at the top frame, R2 = the RPL IP, R3 = frames in use
EqwTopFrame2:
        LC(5)   STACKNUM                         * 67E7B
        CD0EX                                    * 67E82
        RSTK=C                                   * 67E85
        C=DAT0  A                                * 67E87
        D0=(5)  KEYLIST                          * 67E8A
        A=DAT0  A                                * 67E91
        A=A-C   A                                * 67E94
        R3=A                                     * 67E96
        C=RSTK                                   * 67E99
        GONC    EqwFrameN2.L1                    * 67E9B

* refs (4): 67E77 67EB1 67EB4 680EE
* Make room for one more stack level (D.A), collecting garbage if needed
EqwNeed1:
        ST=0    10                               * 67E9E
        D=D-1   A                                * 67EA1
        RTNNC                                    * 67EA3
        C=0     A                                * 67EA6
        C=C+1   A                                * 67EA8
        GOSBVL  EqwGC                            * 67EAA
        GOC     EqwNeed1                         * 67EB1

* refs (4): 67E3E 67E4A 67E59 67E69
* Pop #n -> D0 at frame n, one stack level reserved
EqwFrameN:
        GOSUB   EqwNeed1                         * 67EB4

* refs (2): 67F14 67F3A
* Pop #n -> D0 at frame n
EqwFrameN2:
        GOSBVL  POP#                             * 67EB8
        R3=A                                     * 67EBF
        LC(5)   KEYLIST                          * 67EC2
        CD0EX                                    * 67EC9
EqwFrameN2.L1:
        A=DAT0  A                                * 67ECC
        R0=A                                     * 67ECF
        D0=(5)  MENULEVEL                        * 67ED2
        A=DAT0  A                                * 67ED9
        R1=A                                     * 67EDC
        D0=C                                     * 67EDF
        A=R3                                     * 67EE2
        C=R0                                     * 67EE5
        C=C-A   A                                * 67EE8
        A=C     A                                * 67EEA
        GOSUBL  A*5                              * 67EEC
        C=R1                                     * 67EF2
        A=A+C   A                                * 67EF5
        GOSUBL  A*5                              * 67EF7
        R0=A                                     * 67EFD
        GOSUBL  EqwSlotAddr                      * 67F00
        D0=C                                     * 67F06
        RTN                                      * 67F09

* refs (6): 695A8 6995F 69B03 6F17B 6F47D 6F518
* #n ob -> : set item 1 of frame n
EqwFrmN1!:
        CON(5)  (*)+5                            * 67F0B  primitive code object
        GOSUB   EqwPopR4                         * 67F10
        GOSUB   EqwFrameN2                       * 67F14
EqwFrmN1!.L1:
        C=R4                                     * 67F18
        DAT0=C  A                                * 67F1B
        GOLONG  EqwBoxPlaceH!.L1                 * 67F1E

* refs (2): 67F10 67F36
* Pop level 1 into R4
EqwPopR4:
        C=DAT1  A                                * 67F24
        R4=C                                     * 67F27
        D1=D1+  5                                * 67F2A
        D=D+1   A                                * 67F2D
        RTN                                      * 67F2F

* refs (5): 699F5 6F171 6F1FD 6F3E7 6F58B
* #n ob -> : set item 4 of frame n
EqwFrmN4!:
        CON(5)  (*)+5                            * 67F31  primitive code object
        GOSUB   EqwPopR4                         * 67F36
        GOSUB   EqwFrameN2                       * 67F3A
        D0=D0+  15                               * 67F3E
        GOTO    EqwFrmN1!.L1                     * 67F41

* refs (7): 688FF 68D64 68E36 690BB 695B7 6987E ...
OBJ_67F45:
        CON(5)  (*)+5                            * 67F45  primitive code object
        GOSUB   EqwTopFrame2                     * 67F4A
        D0=D0+  15                               * 67F4E
        A=DAT0  A                                * 67F51
        D0=A                                     * 67F54
        A=DAT0  A                                * 67F57
        LC(5)   DOLIST                           * 67F5A
        ?C=A    A                                * 67F61
        GOYES   OBJ_67F45.L2                     * 67F64
OBJ_67F45.loop1:
        GOTO    OBJ_67F45.L5                     * 67F66
OBJ_67F45.L2:
        D0=D0+  5                                * 67F6A
        A=DAT0  A                                * 67F6D
        LC(5)   SEMI                             * 67F70
        ?C=A    A                                * 67F77
        GOYES   OBJ_67F45.loop1                  * 67F7A
        AD0EX                                    * 67F7C
        R0=A                                     * 67F7F
        A=DAT0  A                                * 67F82
        LC(5)   DOBINT                           * 67F85
        ST=0    3                                * 67F8C
        ?C#A    A                                * 67F8F
        GOYES   OBJ_67F45.L3                     * 67F92
        ST=1    3                                * 67F94
OBJ_67F45.L3:
        A=R0                                     * 67F97
        D0=A                                     * 67F9A
        ?ST=1   3                                * 67F9D
        GOYES   OBJ_67F45.L4                     * 67FA0
        GOSBVL  SKIPOB                           * 67FA2
OBJ_67F45.L4:
        A=DAT0  A                                * 67FA9
        AD0EX                                    * 67FAC
        D0=D0+  5                                * 67FAF
        C=DAT0  A                                * 67FB2
        D0=A                                     * 67FB5
        A=C     A                                * 67FB8
        LC(5)   #0002C                           * 67FBA
        ?C<=A   A                                * 67FC1
        GOYES   OBJ_67FED.L1                     * 67FC4
        CD1EX                                    * 67FC6
        R1=C                                     * 67FC9
        LA(5)   OBJ_67FED                        * 67FCC
        AD0EX                                    * 67FD6
        D1=(5)  #1+                              * 67FD9
        AD1EX                                    * 67FE0
        PC=(A)                                   * 67FE3
OBJ_67F45.L5:
        GOLONG  EqwBoxPlaceH!.L1                 * 67FE7

* refs (1): 67FCC
OBJ_67FED:
        CON(5)  (*)+5                            * 67FED  primitive code object
        GOSUB   EqwParseStep~8.L1+4              * 67FF2
        GOTO    EqwBoxParent@.L3+1               * 67FF6
        NIBHEX  13569EF                          * 67FFA  1eé
OBJ_67FED.L1:
        C=R2                                     * 68001
        D0=C                                     * 68004
        LC(5)   #00106                           * 68007
        A=C     A                                * 6800E
        GOVLNG  Errjmp                           * 68010

* refs (1): 66E66
* #b #x #y: set a box's position, each coordinate only when it differs; when nothing changed it returns to the caller's caller with the arguments dropped
EqwBoxXY!:
        CON(5)  (*)+5                            * 68017  primitive code object
        D1=D1+  10                               * 6801C
        GOSUBL  EqwPOP#>Box                      * 6801F
        D1=D1-  15                               * 68025
        D0=D0+  2                                * 68028
        C=0     A                                * 6802B
        C=DAT0  X                                * 6802D
        ST=0    1                                * 68031
        ?C#0    A                                * 68034
        GOYES   EqwBoxXY!.L1                     * 68037
        ST=1    1                                * 68039
EqwBoxXY!.L1:
        RSTK=C                                   * 6803C
        GOSBVL  POP#                             * 6803E
        C=RSTK                                   * 68045
        CAEX    A                                * 68047
        R1=C                                     * 68049
        R4=A.F  A                                * 6804C
        GOSUB   EqwPush#A                        * 68052
        A=R4.F  A                                * 68056
        C=R1                                     * 6805C
        ST=0    2                                * 6805F
        ?C=A    A                                * 68062
        GOYES   EqwBoxXY!.L2                     * 68065
        DAT0=C  X                                * 68067
        ST=1    2                                * 6806B
EqwBoxXY!.L2:
        D0=D0+  3                                * 6806E
        D1=D1+  5                                * 68071
        C=0     A                                * 68074
        C=DAT0  X                                * 68076
        ?ST=0   1                                * 6807A
        GOYES   EqwBoxXY!.L3                     * 6807D
        ?C=0    A                                * 6807F
        GOYES   EqwBoxXY!.L3                     * 68082
        ST=0    1                                * 68084
EqwBoxXY!.L3:
        RSTK=C                                   * 68087
        GOSBVL  POP#                             * 68089
        C=RSTK                                   * 68090
        CAEX    A                                * 68092
        R1=C                                     * 68094
        R4=A.F  A                                * 68097
        GOSUB   EqwPush#A                        * 6809D
        A=R4.F  A                                * 680A1
        C=R1                                     * 680A7
        ?C#A    A                                * 680AA
        GOYES   drop;false;true_680B4.L1         * 680AD
        ?ST=1   2                                * 680AF
        GOYES   drop;false;true_680B4.L2         * 680B2

* refs (2): 680E6 680E9
drop;false;true_680B4:
        D1=D1+  10                               * 680B4
        D=D+1   A                                * 680B7
        D=D+1   A                                * 680B9
        LA(5)   SEMI                             * 680BB
        PC=(A)                                   * 680C5
drop;false;true_680B4.L1:
        DAT0=C  X                                * 680C9
drop;false;true_680B4.L2:
        D0=D0-  4                                * 680CD
        A=DAT0  S                                * 680D0
        A=A+A   S                                * 680D4
        GOC     drop;false;true_680B4.L4         * 680D7
        D0=D0-  1                                * 680DA
        A=DAT0  S                                * 680DD
        ?A=0    S                                * 680E1
        GOYES   drop;false;true_680B4.L3         * 680E4
        GONC    drop;false;true_680B4            * 680E6
drop;false;true_680B4.L3:
        ?ST=1   1                                * 680E9
        GOYES   drop;false;true_680B4            * 680EC
drop;false;true_680B4.L4:
        GOSUB   EqwNeed1                         * 680EE
        D1=D1-  5                                * 680F2
        GOLONG  EqwBoxPlaceH!.L1                 * 680F5

* refs (6): 667A6 68052 6809D 68140 68159 6DE76
* A.A -> pushed as a bint, D0 kept relative to the box table (a push may collect garbage and move the table)
EqwPush#A:
        R3=A                                     * 680FB
        LC(5)   ITEM1STATE                       * 680FE
        CD0EX                                    * 68105
        A=DAT0  A                                * 68108
        C=C-A   A                                * 6810B
        CR3EX                                    * 6810D
        A=C     A                                * 68110
        GOSUBL  SUB_67918                        * 68112
        D0=(5)  ITEM1STATE                       * 68118
        A=DAT0  A                                * 6811F
        C=R3                                     * 68122
        A=A+C   A                                * 68125
        D0=A                                     * 68127
        RTN                                      * 6812A

* refs (1): 66D6C
* #b -> #x #first #ref: where the children of a row start
EqwRowStart:
        CON(5)  (*)+5                            * 6812C  primitive code object
        GOSUBL  EqwPOP#>Box                      * 68131
        D0=D0+  5                                * 68137
        A=0     A                                * 6813A
        A=DAT0  X                                * 6813C
        GOSUB   EqwPush#A                        * 68140
        AD0EX                                    * 68144
        LC(5)   #0001F                           * 68147
        A=A+C   A                                * 6814E
        D0=A                                     * 68150
        A=0     A                                * 68153
        A=DAT0  X                                * 68155
        GOSUB   EqwPush#A                        * 68159
        LC(5)   #00022                           * 6815D
        AD0EX                                    * 68164
        A=A-C   A                                * 68167
        D0=A                                     * 68169
        A=0     A                                * 6816C
        A=DAT0  X                                * 6816E
        D0=D0+  6                                * 68172
        C=0     A                                * 68175
        C=DAT0  X                                * 68177
        A=A+C   A                                * 6817B
        GOLONG  EqwBoxParent@.L2                 * 6817D

* refs (4): 65A83 67747 6A57D 6C814
* #n -> #5n
#5*:
        CON(5)  (*)+5                            * 68183  primitive code object
        GOSBVL  POP#                             * 68188
        C=A     A                                * 6818F
        A=A+A   A                                * 68191
        A=A+A   A                                * 68193
#5*.L1:
        A=A+C   A                                * 68195
        GOLONG  EqwBoxParent@.L3                 * 68197

* refs (17): 19A57 65B9B 6604D 6C082 6D8C3 6DB3E ...
* #n -> #3n
#3*:
        CON(5)  (*)+5                            * 6819D  primitive code object
        GOSBVL  POP#                             * 681A2
        C=A     A                                * 681A9
        C=C+C   A                                * 681AB
        GOTO    #5*.L1                           * 681AD

* refs (5): 686B6 6A0AF 6A4AB 6C846 6C909
* hxs -> : store the box table, a hex string
EqwBoxTab!:
        CON(5)  (*)+5                            * 681B1  primitive code object
        LC(5)   ITEM1STATE                       * 681B6
EqwBoxTab!.L1:
        A=DAT1  A                                * 681BD
        D1=D1+  5                                * 681C0
        D=D+1   A                                * 681C3
        CD0EX                                    * 681C5
        DAT0=A  A                                * 681C8
EqwBoxTab!.L2:
        D0=C                                     * 681CB
        A=DAT0  A                                * 681CE
        D0=D0+  5                                * 681D1
        PC=(A)                                   * 681D4

* refs (4): 6B8DF 6C0DC 6C136 6C55F
* {} -> : store the undo list (PAINTTREE)
EqwUndo!:
        CON(5)  (*)+5                            * 681D8  primitive code object
        LC(5)   PAINTTREE                        * 681DD
        GOTO    EqwBoxTab!.L1                    * 681E4

* refs (4): 68693 69FE2 6A091 6A456
* -> hxs
EqwBoxTab@:
        CON(5)  (*)+5                            * 681E8  primitive code object
        LC(5)   ITEM1STATE                       * 681ED
EqwBoxTab@.L1:
        ST=0    10                               * 681F4
        R0=C                                     * 681F7
EqwBoxTab@.loop2:
        D=D-1   A                                * 681FA
        GONC    EqwBoxTab@.L3                    * 681FC
        GOSBVL  EqwGC                            * 681FF
        GOC     EqwBoxTab@.loop2                 * 68206
EqwBoxTab@.L3:
        D1=D1-  5                                * 68209
        C=R0                                     * 6820C
        CD0EX                                    * 6820F
        A=DAT0  A                                * 68212
        DAT1=A  A                                * 68215
        GOTO    EqwBoxTab!.L2                    * 68218

* refs (4): 6B8BC 6C046 6C12C 6E83E
* -> {}
EqwUndo@:
        CON(5)  (*)+5                            * 6821C  primitive code object
        LC(5)   PAINTTREE                        * 68221
        GOTO    EqwBoxTab@.L1                    * 68228
        RPL

* refs (4): 6CE34 6D648 6DEEB 6E9EC
* obj fields #b -> : refill the fields of an existing box from +00 to +14 and give it a new object
EqwBoxRefill:
        :: DUP BINT11 UNROLL EqwBoxFill14        * 6822C

* refs (11): 44E2B 4B90E 65CF6 65EEA 6626E 66598 ...
* #b obj -> : put obj into box b's slot on the data stack and clear the flag in +01
EqwBoxObj!:
          :: SWAPDUP EqwBoxUndrawn EqwKidsLevel SWAP#- dup;drop(s) #2- * 68245
            UNROLL ;                             * 68268
        ;                                        * 68272

* refs (1): 68240
* As EqwBoxFill, fields up to +14 only (ST 3 set)
EqwBoxFill14:
        CON(5)  (*)+5                            * 68277  primitive code object
        ASSEMBLE
        ST=1    3                                * 6827C
        GOTO    EqwBoxFill.L1                    * 6827F
        RPL

* refs (3): 65F76 6CF10 6D5AA
* Arguments of EqwNewBox, #b -> : refill all the fields of an existing box
EqwBoxRefillAll:
        :: DUP BINT18 UNROLL EqwBoxFill EqwBoxObj! ; * 68283

* refs (1): 68297
* Fill box #b from the arguments of EqwNewBox
EqwBoxFill:
        CON(5)  (*)+5                            * 682A6  primitive code object
        ASSEMBLE
        ST=0    3                                * 682AB
EqwBoxFill.L1:
        GOSUBL  EqwPOP#>Box                      * 682AE
        ST=0    4                                * 682B4
        GOSUB   EqwFillFields                    * 682B7
        GOTO    EqwBoxPlaceH!.L2                 * 682BB
EqwBoxFill.L2:
        D0=C                                     * 682BF
        D0=D0-  5                                * 682C2
        LC(5)   EqwBoxesGrow                     * 682C5
        A=C     A                                * 682CC
        PC=(A)                                   * 682CE

* refs (10): 65C81 66232 664A8 6CF56 6D0C8 6D2DF ...
* Like EqwNewBox, for a box without children (#24/#27 zero)
EqwNewLeafBox:
        CON(5)  (*)+5                            * 682D2  primitive code object
        ST=1    4                                * 682D7
        GOTO    EqwNewBox.L1                     * 682DA

* refs (22): 65AD3 65B32 65B69 65BAF 65BDC 65D46 ...
* #27 #24 #21 #1E #1B #18 #b16 #b14 obj #11 #0E #0B #08 #05 #02 #type -> obj: take a free box record and fill it (fields by offset; see EqwPOP#>Box)
EqwNewBox:
        CON(5)  (*)+5                            * 682DE  primitive code object
        ST=0    4                                * 682E3
EqwNewBox.L1:
        GOSUB   EqwTakeBox                       * 682E6
        LC(5)   EqwSlotAdd                       * 682EA
        A=C     A                                * 682F1
        PC=(A)                                   * 682F3

* refs (4): 682E6 6861D 6862C 6863B
* Take a free box record and fill it from the stack; grows the table with EqwBoxesGrow when none is free
EqwTakeBox:
        ST=0    3                                * 682F7
        LC(5)   SAVECROSS                        * 682FA
        CD0EX                                    * 68301
        A=DAT0  A                                * 68304
        ?A=0    A                                * 68307
        GOYES   EqwBoxFill.L2                    * 6830A
        A=A-1   A                                * 6830C
        DAT0=A  A                                * 6830E
        D0=(5)  MENULEVEL                        * 68311
        A=DAT0  A                                * 68318
        A=A+1   A                                * 6831B
        DAT0=A  A                                * 6831D
        D0=C                                     * 68320
        GOSUBL  EqwA>Box                         * 68323

* refs (1): 682B7
* Pop the fields from the stack into the record at D0: type, then six 3-nibble fields, the object, +14, +16 and the links. The size level comes from AppCount
EqwFillFields:
        GOSBVL  POP#                             * 68329
        DAT0=A  1                                * 68330
        D0=D0+  1                                * 68334
        LC(5)   AppCount                         * 68337
        CD0EX                                    * 6833E
        A=DAT0  B                                * 68341
        D0=C                                     * 68344
        LC(1)   #7                               * 68347
        ?C>=A   P                                * 6834A
        GOYES   EqwFillFields.L1                 * 6834D
        A=C     P                                * 6834F
EqwFillFields.L1:
        DAT0=A  1                                * 68352
        D0=D0+  1                                * 68356
        P=      5                                * 68359
        GOSUB   EqwPopFields                     * 6835B
        A=DAT1  A                                * 6835F
        D1=D1+  5                                * 68362
        D=D+1   A                                * 68365
        R3=A.F  A                                * 68367
        GOSBVL  POP#                             * 6836D
        DAT0=A  B                                * 68374
        D0=D0+  2                                * 68377
        ?ST=1   3                                * 6837A
        GOYES   EqwFillFields.L3                 * 6837D
        GOSBVL  POP#                             * 6837F
        D=D-1   A                                * 68386
        DAT0=A  B                                * 68388
        D0=D0+  2                                * 6838B
        P=      5                                * 6838E
        ?ST=0   4                                * 68390
        GOYES   EqwFillFields.L2                 * 68393
        P=      3                                * 68395
EqwFillFields.L2:
        GOSUB   EqwPopFields                     * 68397
        ?ST=0   4                                * 6839B
        GOYES   EqwFillFields.L3                 * 6839E
        C=0     W                                * 683A0
        DAT0=C  6                                * 683A3
EqwFillFields.L3:
        D1=D1-  5                                * 683A7
        A=R3.F  A                                * 683AA
        DAT1=A  A                                * 683B0
        C=R2                                     * 683B3
        D0=C                                     * 683B6
        RTN                                      * 683B9

* refs (3): 6835B 68397 683CB
* Pop P+1 bints into 3-nibble fields at D0
EqwPopFields:
        GOSBVL  POP#                             * 683BB
        DAT0=A  X                                * 683C2
        D0=D0+  3                                * 683C6
        P=P-1                                    * 683C9
        GONC    EqwPopFields                     * 683CB
        P=      0                                * 683CE
        RTN                                      * 683D0

* refs (2): 668D6 6847C
* A.A = index -> A.A = the size handler
EqwSizeH>A:
        LC(5)   EqwTable>A.L1                    * 683D2

* refs (1): 684F8
* A.A = index, C.A = table -> A.A = the word at that index
EqwTable>A:
        CD1EX                                    * 683D9
        RSTK=C                                   * 683DC
        C=A     A                                * 683DE
        C=C+C   A                                * 683E0
        C=C+C   A                                * 683E2
        A=A+C   A                                * 683E4
        CD1EX                                    * 683E6
        C=C+A   A                                * 683E9
        D1=C                                     * 683EB
        A=DAT1  A                                * 683EE
        C=RSTK                                   * 683F1
        D1=C                                     * 683F3
        RTN                                      * 683F6

* Size handlers, indexed by field +14; #FF runs OBJ_6FE73 instead
EqwTable>A.L1:
        CON(5)  OBJ_65A29                        * 683F8  address (the code jumps or points through it)

        CON(5)  OBJ_44C3C                        * 683FD  address (the code jumps or points through it)

        CON(5)  OBJ_65A38                        * 68402  address (the code jumps or points through it)

        CON(5)  OBJ_44CFA                        * 68407  address (the code jumps or points through it)

        CON(5)  OBJ_44D4A                        * 6840C  address (the code jumps or points through it)

        CON(5)  OBJ_44C87                        * 68411  address (the code jumps or points through it)

        CON(5)  OBJ_44CC8                        * 68416  address (the code jumps or points through it)

        CON(5)  OBJ_66660                        * 6841B  address (the code jumps or points through it)

        CON(5)  OBJ_44D68                        * 68420  address (the code jumps or points through it)

* Placement handlers, indexed by field +16; -1 runs EqwPlaceH-1
EqwTable>A.L2:
        CON(5)  OBJ_65A06                        * 68425  address (the code jumps or points through it)

        CON(5)  OBJ_66C2C                        * 6842A  address (the code jumps or points through it)

        CON(5)  OBJ_66C4A                        * 6842F  address (the code jumps or points through it)

        CON(5)  OBJ_66C86                        * 68434  address (the code jumps or points through it)

        CON(5)  OBJ_66534                        * 68439  address (the code jumps or points through it)

        CON(5)  OBJ_66CB8                        * 6843E  address (the code jumps or points through it)

        CON(5)  OBJ_660FC                        * 68443  address (the code jumps or points through it)

        CON(5)  OBJ_6611A                        * 68448  address (the code jumps or points through it)

        CON(5)  DupAndThen                       * 6844D  address (the code jumps or points through it)

* refs (2): 6AABE 6D1CC
* #b -> ob: push the box's size handler
EqwBoxSizeH@:
        CON(5)  (*)+5                            * 68452  primitive code object
        GOSUB   EqwBoxSizeH@~1                   * 68457
        GOTO    EqwBoxPlaceH!.L1                 * 6845B

* refs (1): 68457
EqwBoxSizeH@~1:
        GOSUBL  EqwPOP#>Box                      * 6845F
        D0=D0+  10                               * 68465
        D0=D0+  10                               * 68468
        C=DAT0  B                                * 6846B
        C=C+1   B                                * 6846E
        GOC     EqwBoxSizeH@~1.L1                * 68471
        C=C-1   B                                * 68474
        A=0     A                                * 68477
        A=C     B                                * 68479
        GOSUB   EqwSizeH>A                       * 6847C
        D1=D1-  5                                * 68480
        DAT1=A  A                                * 68483
        D=D-1   A                                * 68486
        RTN                                      * 68488
EqwBoxSizeH@~1.L1:
        C=R2                                     * 6848A
        D0=C                                     * 6848D
        LC(5)   #0002A                           * 68490
        BCEX    A                                * 68497
        RSTK=C                                   * 68499
        C=0     A                                * 6849B
EqwBoxSizeH@~1.loop2:
        A=A-B   A                                * 6849D
        GOC     EqwBoxSizeH@~1.L3                * 6849F
        C=C+1   A                                * 684A2
        GONC    EqwBoxSizeH@~1.loop2             * 684A4
EqwBoxSizeH@~1.L3:
        A=C     A                                * 684A7
        C=RSTK                                   * 684A9
        B=C     A                                * 684AB
        A=A+1   A                                * 684AD
        GOSBVL  SUB_67918                        * 684AF
        LC(5)   OBJ_6FE73                        * 684B6
EqwBoxSizeH@~1.loop4:
        A=C     A                                * 684BD
        PC=(A)                                   * 684BF
EqwBoxSizeH@~1.L5:
        C=R2                                     * 684C3
        D0=C                                     * 684C6
        LC(5)   OBJ_6FE69                        * 684C9
        GOTO    EqwBoxSizeH@~1.loop4             * 684D0

* refs (1): 669DD
* #index -> : run placement handler number index
EqwRunPlaceH:
        CON(5)  (*)+5                            * 684D4  primitive code object
        GOSBVL  POP#                             * 684D9
        C=A     A                                * 684E0
        C=C+1   A                                * 684E2
        GONC    EqwRunPlaceH.L1                  * 684E4
        LC(5)   EqwPlaceH-1                      * 684E7
        GOC     EqwBoxSizeH@~1.loop4             * 684EE
EqwRunPlaceH.L1:
        LC(5)   EqwTable>A.L2                    * 684F1
        GOSUB   EqwTable>A                       * 684F8
        PC=(A)                                   * 684FC
        RPL

* refs (1): 684E7
* Placement handler -1: the reference comes from the object of the first child that has one
EqwPlaceH-1:
        :: EqwDupBoxFirst@ EqwPlaceH-1~1 CmdField ?SKIP * 68500
          :: DROPDUP EqwBoxSecond@ EqwPlaceH-1~1 CmdField DROP ; * 68519
          BINT6 NTHCOMPDROP EVAL ;               * 6853C

* refs (3): 66965 66979 6A186
* #b -> #b #index: the placement handler, -1 for FF
EqwDupBoxPlaceH@:
        CON(5)  DupAndThen                       * 68550  code object: the address of its machine code

        CON(5)  (*)+5                            * 68555  primitive code object
        ASSEMBLE
        GOSUBL  EqwPOP#>Box                      * 6855A
        D0=D0+  10                               * 68560
        D0=D0+  12                               * 68563
        A=0     A                                * 68566
        A=DAT0  B                                * 68568
        GOSUB   EqwPush#H                        * 6856B
        GOTO    EqwBoxPlaceH!.L1                 * 6856F

* refs (2): 66A34 6856B
* A.B -> pushed as a bint, FF as -1
EqwPush#H:
        A=A+1   B                                * 68573
        GONC    EqwPush#H.L1                     * 68576
        LC(5)   MINUSONE                         * 68579
        D1=D1-  5                                * 68580
        DAT1=C  A                                * 68583
        D=D-1   A                                * 68586
        RTN                                      * 68588
EqwPush#H.L1:
        A=A-1   B                                * 6858A
        GOLONG  SUB_67918                        * 6858D

* refs (6): 4B8EB 665BB 66624 6DBD4 6E154 6F45F
* #b #index -> : set the size handler (field +14)
EqwBoxSizeH!:
        CON(5)  (*)+5                            * 68593  primitive code object
        GOSUBL  EqwPOP#>Box                      * 68598
        GOSBVL  POP#                             * 6859E
        D0=D0+  10                               * 685A5
        D0=D0+  10                               * 685A8
        DAT0=A  B                                * 685AB
        GOTO    EqwBoxPlaceH!.L1                 * 685AE

* refs (2): 6A3B1 6CE43
* #b #index -> : set the placement handler (field +16)
EqwBoxPlaceH!:
        CON(5)  (*)+5                            * 685B2  primitive code object
        GOSUBL  EqwPOP#>Box                      * 685B7
        GOSBVL  POP#                             * 685BD
        D0=D0+  10                               * 685C4
        D0=D0+  12                               * 685C7
        DAT0=A  B                                * 685CA
EqwBoxPlaceH!.L1:
        C=R2                                     * 685CD
        D0=C                                     * 685D0
EqwBoxPlaceH!.L2:
        A=DAT0  A                                * 685D3
        D0=D0+  5                                * 685D6
        PC=(A)                                   * 685D9

* refs (1): 6D4D3
* -> : make sure three box records are free
EqwNeed3Boxes:
        CON(5)  (*)+5                            * 685DD  primitive code object
        LC(5)   SAVECROSS                        * 685E2
        CD0EX                                    * 685E9
        A=DAT0  A                                * 685EC
        D0=C                                     * 685EF
        A=A-CON A,3                              * 685F2
        GOC     EqwNeed3Boxes.L1                 * 685F8
        GOTO    EqwBoxPlaceH!.L2                 * 685FB
EqwNeed3Boxes.L1:
        LC(5)   EqwBoxesGrow                     * 685FF
        GOTO    EqwBoxSizeH@~1.loop4             * 68606

* refs (1): 6D4D8
* The stack holds the arguments of three EqwNewBox calls: take the three boxes in one go, stepping the stack pointer over each group
EqwNew3Boxes:
        CON(5)  (*)+5                            * 6860A  primitive code object
        ST=0    4                                * 6860F
        LC(5)   #000A0                           * 68612
        GOSUB   SUB_68670                        * 68619
        GOSUB   EqwTakeBox                       * 6861D
        LC(5)   #FFF65                           * 68621
        GOSUB   SUB_68670                        * 68628
        GOSUB   EqwTakeBox                       * 6862C
        LC(5)   #FFF65                           * 68630
        GOSUB   SUB_68670                        * 68637
        GOSUB   EqwTakeBox                       * 6863B
        C=DAT1  A                                * 6863F
        RSTK=C                                   * 68642
        LC(5)   #00050                           * 68644
        GOSUB   SUB_68670                        * 6864B
        C=DAT1  A                                * 6864F
        RSTK=C                                   * 68652
        LC(5)   #0004B                           * 68654
        GOSUB   SUB_68670                        * 6865B
        C=RSTK                                   * 6865F
        DAT1=C  A                                * 68661
        D1=D1-  5                                * 68664
        C=RSTK                                   * 68667
        DAT1=C  A                                * 68669
        GOTO    EqwBoxPlaceH!.L2                 * 6866C

* refs (5): 68619 68628 68637 6864B 6865B
SUB_68670:
        AD1EX                                    * 68670
        A=A+C   A                                * 68673
        D1=A                                     * 68675
        RTN                                      * 68678
        RPL

* refs (2): 682C5 685FF
* -> : add 20 records to the box table
EqwBoxesGrow:
        :: EqwBoxesFree@ BINT20 #+ EqwBoxesFree! EqwBoxTab@ BINT20 * 6867A

* refs (4): 6A0A0 6A46F 6A492 6C83C
* #n -> #42n: nibbles of n box records
Eqw#42*:
          :: BINT42 #* ; EXPAND EqwBoxTab! ;     * 6869D

* refs (4): 69237 6B88A 6BC0F 6C0EB
* -> : parse the text typed so far into boxes
EqwParseText:
        :: EqwParseText~1 18PUTLAM               * 686C0

* refs (1): 6892C
* Run EqwParseStep until it leaves through RDROP, then store the token state
EqwParseLoop:
          :: BEGIN ?ATTNQUIT EqwParseStep AGAIN ; DROP 5UNROLL PutGNTData ; * 686CF

* refs (1): 686DE
* Handle one token
EqwParseStep:
        :: OBJ_69A31 EqwParseStep~4 EqwParseStep~3 OBJ_688C3 8GETLAM * 68701
          nultrior                               * 6871F

* refs (1): 697B6
EqwParseStep~8:
          :: DROP 2RDROP 7GETLAM EqwParseStep~6 EQ case EqwParseEnd * 68724
            EqwParseStep~1 ;                     * 6874C
          TRUE 18PUTLAM tok' tok=casedrop EqwNextToken * 68756
          EqwToken casedrop                      * 6876F
          :: 2RDROP 5ROLL 6ROLL ;                * 68779
          ?SEMI                                  * 68792
          DROPZERO GetGNTData ParseReal case     * 68797
          :: case EqwParseStep~2                 * 687AB
            COLA OBJ_687FB                       * 687BA
          ;                                      * 687C4
          ngsizecase OBJ_687FB                   * 687C9
          Tok>Name !*trior EqwParseStep~2 SWAP COMPILEID ROT * 687D3
EqwParseStep~8.L1:
          ORNOT casedrop                         * 687F1

* refs (3): 687BF 687CE 68823
OBJ_687FB:
          :: 5ROLLDROP COLA EqwParseStep~5       * 687FB
          ;                                      * 6880F
          ?AlgUnary OBJ_6E026 NOTcasedrop OBJ_687FB * 68814
          FnInfo NOTcase                         * 68828
          :: PutTok 2DROP COLA EqwParseStep~2    * 68832
          ;                                      * 6884B
          8UNROLL 8UNROLL 8UNROLL 5DROP COLA EqwFunction * 68850
        ;                                        * 6886E

* refs (2): 68747 68B20
* Close every open frame at the end of the text
EqwParseEnd:
        :: EqwNoArg?case AlgFail                 * 68873
          EqwAfterArg ~BINT0;1PUTLAM BEGIN EqwFrm1@ #0= WHILE * 68882
          :: GetGNTData DROP tokrparen DUP EqwInsertToken PutGNTData * 688A0

* refs (3): 68715 68B0C 69057
OBJ_688C3:
            :: EqwCloseFrame ~BINT1;1PUTLAM ; ;  * 688C3
          REPEAT EqwFrm1@ #1=case                * 688DC

* refs (3): 6874C 6894A 68968
EqwParseStep~1:
          :: GetGNTData TrueTrue ;               * 688EB
          OBJ_67F45 OBJ_69941 EqwFrames #1= EqwFrm1@ BINT4 #= AND NOTcase * 688FF
          EqwParseLoop                           * 6892C
          EqwFrmArg-1 ~BINT1;1PUTLAM EqwFrm4@ OBJ_69188 EQcasedrop * 68931
          EqwParseStep~1                         * 6894A
          EqwStkPush EqwCurBox@ EqwBoxPrev@ EqwCurBox! EqwAfterArg * 6894F
          EqwParseStep~1 ;                       * 68968

* refs (2): 6C4BF 8D3F5
* ob -> : build the boxes of a symbolic: each object of its RPN stream goes through the parser as if typed. Used to edit an object and by a library that shows an expression
EqwLoadSymb:
        :: TRUE BINT33 PUTLAM FALSE SWAP Symb>Pieces ZERO_DO ?ATTNQUIT * 68972
          OBJ_68BE3                              * 6899F
          :: ' x= EQcasedrop                     * 689A4
            :: OBJ_698CE DUP NOT?SEMI            * 689B8
              6DROP SYNTAXERR ;                  * 689CC
            DUP EqwLoadSymb~6 caseDROP tokuscore * 689DB
            EQcasedrop EqwLoadSymb~3             * 689EF
            DUPTYPECSTR? case                    * 689F9
            :: EqwToken DROP ?SEMI               * 68A03
              $>ID EqwOperand ;                  * 68A17
            DUPTYPECHAR? case                    * 68A26
            :: CHR>$ OBJ_68BE3 &$ ISTOP-INDEX #1- UNROLL ; * 68A30
            DUPTYPECMP? case EqwLoadComplex      * 68A58
            DUPTYPEREAL? case                    * 68A67
            :: DUP %0< case EqwNegReal           * 68A71
              EqwOperand ;                       * 68A8A
            DUPTYPEIDNT? case EqwOperand         * 68A94
            ?AlgUnary FnInfo case EqwFunction    * 68AA3
            DUPTYPEROMP? NOTcase                 * 68AB7

* refs (4): 68A1C 68A8A 68A9E 68AE4
* ob -> : an operand from the object stream: state 1, push it and make its text box
EqwOperand:
            :: ~BINT1;1PUTLAM EqwDupStkPush EqwOperandText ; * 68AC1
            DUPROMPTR@ casedrop EqwOperand       * 68ADA
            BINT4 ERROROUT ;                     * 68AE9

* refs (2): 68BCF 68BFC
OBJ_68AF8:
          :: OBJ_69A31 EqwLoadSymb~2 EqwLoadSymb~1 OBJ_688C3 NOP ; LOOP * 68AF8
          EqwParseEnd 6DROP FALSE BINT33 PUTLAM ; * 68B20

* refs (2): 6876F 68A08
* $ -> flag flag: handle a separator token: ( ) ; = the list separator and the angle sign
EqwToken:
        :: TrueFalse ROT NoDecSep tok=casedrop EqwSeparator * 68B3E
          toklparen tok=casedrop EqwToken~1      * 68B5C
          tokrparen tok=casedrop EqwRParen       * 68B6B
          tok; tok=casedrop EqwSeparator         * 68B7A
          tok= tok=casedrop OBJ_698CE            * 68B89
          tokanglesign tok=casedrop EqwToken~2   * 68B98
          ROTROT2DROP FalseFalse ;               * 68BA7

* refs (1): 68B07
EqwLoadSymb~1:
        :: OBJ_68BE3 2DROP ISTOP#1- OBJ_69941 OBJ_68AF8 ; * 68BB6

* refs (1): 68B02
EqwLoadSymb~2:
        :: ISTOP#1-                              * 68BD9

* refs (4): 6899F 68A3A 68BBB 69106
OBJ_68BE3:
          :: ISTOP-INDEX ROLL ; EqwOperandBox OBJ_68AF8 ; * 68BE3

* refs (1): 68A85
* % -> : a negative real from the stream: load its absolute value, then NEG
EqwNegReal:
        :: %CHS EqwNegReal~1 ' xNEG              * 68C06

* refs (3): 68C51 68C60 68C79
EqwLoadComplex~1:
          :: ISTOP-INDEX #1+UNROLL ; ISTOP@ #2+ ISTOPSTO ; * 68C1F

* refs (1): 68A62
* C% -> : load a complex number as tokens: ( re , im ), with the angle sign in polar mode (flag -16)
EqwLoadComplex:
        :: toklparen EqwLoadComplex~1 v->(c) SWAP EqwLoadComplex~1 DPRADIX? * 68C47
          tok, tok; RPITE EqwLoadComplex~1       * 68C6A

* refs (2): 68C10 68C97
EqwNegReal~1:
          :: ISTOP-INDEX UNROLL ;                * 68C7E
          tokrparen EqwNegReal~1 ISTOP@ #5+ ISTOPSTO BINT16 TestSysFlag * 68C92  flag -16: coordinate system
          NOT?SEMI                               * 68CB5
          tokanglesign ISTOP-INDEX #3- UNROLL ISTOP@ #1+ ISTOPSTO ; * 68CBA

* refs (1): 689F4
EqwLoadSymb~3:
        :: ~';xFORMUNIT #72109h BINT2            * 68CE2

* refs (2): 68869 68AB2
* ob -> : a function or operator: look up precedence and argument count, close frames of higher precedence, open its frame
EqwFunction:
          :: EqwNoIdx? 6PUTLAM SWAP 5PUTLAM DUP4PUTLAM OBJ_26E61 DROP * 68CF6
            7PUTLAM 2PUTLAM NOTcase EqwLoadSymb~4 * 68D1E
            EqwNoArg?case                        * 68D32
            :: 2RDROP AlgFail ;                  * 68D37
EqwFunction.loop1:
            EqwFrm2@ 2GETLAM #< ?GOTO EqwFunction.L2 OBJ_67F45 EqwCloseFrame * 68D4B
            GOTO EqwFunction.loop1               * 68D6E
EqwFunction.L2:
            BINT2 5GETLAM EqwRunHook BINT3 3PUTLAM EqwAfterArg 5GETLAM * 68D78

* refs (1): 68EC2
* Make the box of an operator: the handler when it has one, else its text with spaces around it
EqwOperatorBox:
            :: BINT33 GETLAM NOTcase 8GETLAM     * 68D9B
              DUP ->StrExpr(_) ;                 * 68DB4
            DUPLEN$ #>1 IT                       * 68DC3
            :: SPACE$ DUPROT &$ SWAP&$ ;         * 68DD2
            EqwText>L22 DUP CmdField ITE EVAL    * 68DF0
            :: DROP EqwInfix ;                   * 68E09
            EqwRenumber EqwCurBox! DUP EqwRelayout EqwFrameOp OBJ_67F45 ; * 68E1D
        ;                                        * 68E40

* refs (3): 687B5 687DD 68846
EqwParseStep~2:
        :: EqwNoArg?case                         * 68E45
          :: ~BINT1;1PUTLAM EqwTokenRead 8GETLAM EqwText>L22 PutGNTData * 68E4F
            DROPDUP EqwStkPush EqwParseStep~7 ;  * 68E6D
          6DROP OBJ_691E7 ;                      * 68E81

* refs (1): 68D2D
EqwLoadSymb~4:
        :: EqwLoadSymb~7 NOTcase OBJ_691E7       * 68E90
          BINT2 3PUTLAM 5GETLAM BINT1 OVER EqwRunHook EqwOperatorBox * 68EA4
          EqwText>L22 CmdField ?SKIP EqwLoadSymb~5 * 68EC7
          EVAL OVER EqwRelayout EqwCurBox!       * 68EDB

* refs (2): 68E31 69319
* Push the frame of the operator held in lams 3-7 and read the next token
EqwFrameOp:
          :: 5GETLAM dup;#nm? NOT OVER TYPEROMP? OR ITE * 68EEF
            :: BINT0 ' xFCNAPPLY THREE{}N ;      * 68F17
            :: 6GETLAM NOT?SEMI                  * 68F35
              ZEROSWAP TWO{}N ;                  * 68F44
            4GETLAM 7GETLAM 3GETLAM EqwFrmPush EqwNextToken ~BINT0;1PUTLAM ; * 68F53
        ;                                        * 68F76

* refs (5): 68FDA 694FE 6A1B3 6EC58 6F392
* #b -> #lo #hi: the lowest and highest box numbers in the subtree of b
EqwTreeRange:
        :: EqwBoxLeaf? case DUP                  * 68F7B
          DUPDUP EqwLastLeaf #MAX OVER EqwFirstLeaf ROTOVER #= IT * 68F8F
          EqwBoxFirst@                           * 68FB7
          DUP BEGIN DUP EqwBoxLeaf? ITE DUP EqwTreeRange * 68FBC
          4ROLL #MIN SWAP4ROLL #MAX SWAPROT EqwNextUntil ; * 68FDF

* refs (1): 68B75
* Handle a right parenthesis
EqwRParen:
        :: OBJ_698D3 BINT5 OBJ_69659 OBJ_698FB OBJ_698FB * 69002

* refs (7): 6876A 68F67 6917E 6942C 69919 699E6 ...
* -> : read the next token into the parser's state (GetGNTData/PutGNTData)
EqwNextToken:
          :: GetGNTData DROP GetNextToken EqwTokenRead PutGNTData ; * 69020

* refs (1): 69061
OBJ_69043:
          :: RDROP EqwFrm1@ #0=case OBJ_688C3    * 69043
            EqwCloseArg OBJ_69043 OBJ_69941 OBJ_69553 2DROP BINT5 #=?SKIP * 6905C
            EqwFrmArg+1 EqwArgDone OBJ_69996 ;   * 6907F
        ;                                        * 69093

* refs (3): 6905C 6948B 69932
* Close the top frame if its operator has all its arguments
EqwCloseArg:
        :: 'R OBJ_69553 NOT?GOTO EqwCloseFrame SWAPDROP caseDROP OBJ_67F45 * 69098

* refs (3): 688C8 68D69 690AC
* Finish the top frame: run its hook and drop it
EqwCloseFrame:
          :: EqwArgDone EqwAfterArg EqwFrm1@ #0=?SKIP * 690C0
            :: EqwFrm4@                          * 690D9
              :: DUPTYPELIST? NOTcase EqwStkPush * 690E3
                INNERCOMP                        * 690F7

* refs (1): 6A109
EqwRuleKey0~9:
                :: ZERO_DO OBJ_68BE3 EqwStkPush LOOP ; ; * 690FC
            ;                                    * 6911F
            EqwFrm5@ EqwCurBox! EqwFrmPop ;      * 69124
          COLA_EVAL ;                            * 69138
