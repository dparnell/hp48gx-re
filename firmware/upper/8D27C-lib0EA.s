* HP 48GX ROM revision R, #8D27C-#8FFFF: Library 0EA: the MatrixWriter: key handling, cell display, scrolling, the EDIT, GO, +ROW, -ROW, +COL, -COL and WID menu keys; then PINIT
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: MWInvertCursor MW#>$ MWWidthChanged MWWidForCols MWWID-> MWUp MWToggleVec MWToggleGoRight MWToggleGoDown MWStoreRedraw MWStoreItems MWStepRight
* Follows on from the previous file (at #8D27C in the original ROM).
        ENDLENGTH                                * 8D27C

        CON(5)  DOLIB                            * 8D27C  library object
        LENGTH                                   * 8D281  length, to #8FFB5
        CON(2)  0                                * 8D286  title length

* Library 0EA: The MatrixWriter, plus PINIT's port check
LIB0EA:
        CON(3)  #0EA                             * 8D288  library number
        REL(5)  LIB0EA.hash                      * 8D28B  hash table
        CON(5)  0                                * 8D290  message table
        REL(5)  LIB0EA.link                      * 8D295  link table
        CON(5)  0                                * 8D29A  config
        RPL

* ROMPTR 0EA 000
* refs (1): 8D288
* ON key while an edit line is open: abandons the line and goes back to the matrix
MWCancelLine:
        :: TakeOver DAsBad? ?SEMI                * 8D29F
          EDITPARTS #>1 ?SKIP                    * 8D2B3

* ROMPTR 0EA 001
* refs (1): 8D288
* Marks display areas 1 and 2a as unchanged
MWMarkDAs:
          :: SetDA1NoCh SetDA2aNoCh ;            * 8D2C2
          InitEd&Modes ClrHistLevel ;            * 8D2D6

* ROMPTR 0EA 002
* refs (1): 8D288
* ON key with no edit line: leaves the MatrixWriter
MWCancel:
        :: TakeOver DAsBad? ?SEMI                * 8D2E5
          17GETLAM #0=?SKIP                      * 8D2F9
          :: GetMat/Vec CK1NOLASTWD DROP ; 16GETLAM #0=?SKIP FALSE TRUE * 8D303
          3PUTLAM InitEd&Modes ;                 * 8D330

* ROMPTR 0EA 003
* refs (1): 8D288
* Runs the MatrixWriter's parameterised outer loop, with MWDisplay, its hard keys and MWMenu. Locals: 22 the matrix, 21 columns, 20 rows, 19 VEC mode, 18 shape fixed, 17 cells filled, 16 new or old matrix, 14 redraw after a store (0 nothing, 1 cell, 2 all), 13/11 first and last column shown, 12/10 first and last row shown, 9 and 8 current column and row, 7/5 and 6/4 cursor box in pixels
MWRun:
        :: BindMatVars AtUserStack ' XLIB MWDisplay ' MWKeyDef TrueFalse ' * 8D33F
          XLIB MWMenu ONEFALSE ' 3GETLAM 'ERRJMP POLSetUI CLCD10 ClrDAsOK * 8D372
          ERRSET POLKeyUI ERRTRAP                * 8D3A0

* ROMPTR 0EA 004
* refs (1): 8D288
* Error exit of the loop: leaves the matrix on the stack if any cell is filled, then passes the error on
MWErrExit:
          :: DropSysObs PushLastArgs 17GETLAM #0=?SKIP GetMat/Vec * 8D3AF
            AtUserStack TRUE 3PUTLAM ERRJMP ;    * 8D3CD
          ABND ;                                 * 8D3E6

* ROMPTR 0EA 005
* refs (1): 8D288
EqwRuleDone~1:
        :: EqwLoadSymb OBJ_6BBFE DROP ;          * 8D3F0

* ROMPTR 0EA 006
* refs (1): 8D288
* Starts the MatrixWriter on a new matrix, keeping the user interface state around it
DoNewMatrix~1:
        :: POLSaveUI ERRSET                      * 8D409
          :: XLIB DoNewMatrix~2 XLIB MWRun ; ERRTRAP POLResUI&Err * 8D418
          POLRestoreUI ClrDAsOK ;                * 8D442

* ROMPTR 0EA 007
* refs (1): 8D288
* #key -> flag: routes ENTER (key 25) and ON (key 45), with or without an edit line
MWKeyHook:
        :: EditExstCase                          * 8D451
          :: BINT25 ?CaseKeyDef XLIB MWEnter BINT45 ?CaseKeyDef * 8D45B
            XLIB MWCancelLine DROPFALSE ;        * 8D47F
          BINT25 ?CaseKeyDef XLIB MWEnterDone BINT45 ?CaseKeyDef * 8D494
          XLIB MWCancel DROPFALSE ;              * 8D4B3

* ROMPTR 0EA 008
* refs (1): 8D288
* The MatrixWriter's display routine: redraws whatever the display-area flags say is out of date
MWDisplay:
        :: SetPrgmEntry                          * 8D4C8

* ROMPTR 0EA 009
* refs (1): 8D288
* Makes columns fit the current width, when the width has changed
MWFixCols:
          :: XLIB MWColPixels 5GETLAM 7GETLAM #- #= ?SEMI * 8D4D2
            9GETLAM DUP 13PUTLAM XLIB MWColsOnScreen #+ 11PUTLAM * 8D4FB
            XLIB MWCursorX ;                     * 8D51F
          TOADISP RCLSYSF 15GETLAM EQUALNOT DA1OK? NOT DA2aOK? DA2aLess1OK? * 8D52F
          ClrNewEditL ORNOT OR OR IT             * 8D557
          :: EDITPARTS #>1 ITE                   * 8D570
            :: DispStatus BlankDA2a ;            * 8D584
            :: XLIB MWShowCorner XLIB MWDrawAllRows * 8D598

* ROMPTR 0EA 00A
* refs (1): 8D288
* Draws the column headers and cells of all columns on screen
MWShowAllCols:
              :: 13GETLAM XLIB MWColsOnScreen OVER#+ XLIB MWDrawCols ; * 8D5B3
              ROMPTR 0EA 011 XLIB MWClearRight ; * 8D5DD
            SetDA1Valid SetDA2aValid ;           * 8D5F8
          RCLSYSF 15GETLAM EQUAL DA2bOK? AND ?SKIP * 8D607
          :: EditLExists? case DispEditLine      * 8D625

* ROMPTR 0EA 00B
* refs (1): 8D288
* Writes the status line under the grid: row-col: value, cut to fit 22 characters
MWShowCurrent:
            :: TOADISP 8GETLAM ROMPTR 0EA 020 CHR "-" >T$ 9GETLAM XLIB MW#>$ * 8D639
              &$ PTR CHR_: >T$ APPEND_SPACE 22Lget 8GETLAM 9GETLAM * 8D66F
              XLIB MWCell DUPTYPECSTR? ?SKIP     * 8D692
              :: ~setStdWid;COLA;stkdecomp$w OVERLEN$ BINT22 SWAP#- 2DUPSWAP * 8D6A7
                LEN$ #<ITE                       * 8D6C5
                :: 1_#1-SUB$ CHR_... >T$ ; DROP ; * 8D6CF
              &$ BigDisp1(st) ;                  * 8D6F2
            SetDA2bValid ;                       * 8D701
          DA3OK? ?SKIP ?DispMenu                 * 8D70B
          RCLSYSF 15PUTLAM ClrDAsOK ;            * 8D71A

* ROMPTR 0EA 00C
* refs (1): 8D288
* ob1..ob21 -> : stores 21 stack objects straight into the bound locals, first local cleared; a code object, faster than 21 PUTLAMs
MWBindFast:
        CODE                                     * 8D72E  77 nibbles
          LC(5)   #80702                         * 8D738
          CD0EX                                  * 8D73F
          RSTK=C                                 * 8D742
          C=DAT0  A                              * 8D744
          D0=C                                   * 8D747
          D0=D0+  15                             * 8D74A
          LC(5)   BINT0                          * 8D74D
          DAT0=C  A                              * 8D754
          LC(2)   #14                            * 8D757
MWBindFast.loop1:
          D0=D0+  10                             * 8D75B
          A=DAT1  A                              * 8D75E
          D1=D1+  5                              * 8D761
          DAT0=A  A                              * 8D764
          C=C-1   B                              * 8D767
          GONC    MWBindFast.loop1               * 8D76A
          C=RSTK                                 * 8D76D
          D0=C                                   * 8D76F
          LC(5)   #00016                         * 8D772
          D=D+C   A                              * 8D779
          A=DAT0  A                              * 8D77B
          D0=D0+  5                              * 8D77E
          PC=(A)                                 * 8D781
        ENDCODE                                  * 8D785

* ROMPTR 0EA 00D
* refs (1): 8D288
BindMatVars~1:
        :: BINT21 ' NULLLAM CACHE BINT0 1PUTLAM ; * 8D785

* ROMPTR 0EA 00E
* refs (1): 8D288
* Draws the matrix size, rows·columns, in the top left corner
MWShowCorner:
        :: TOADISP 20GETLAM ROMPTR 0EA 020 XLIB MW$Tail3 CHR "·" >T$ * 8D7AD
          21GETLAM XLIB MW#>$ XLIB MW$Tail3 &$ $>grob BINT0 BINT0 2DUP * 8D7DE
          HARDBUFF 3UNROLL BINT22 BINT6 GROB!ZERO 3UNROLL GROB! ; * 8D812

* ROMPTR 0EA 00F
* refs (1): 8D288
* Starts the MatrixWriter on the matrix in level 1
DoOldMatrix~1:
        :: POLSaveUI ERRSET                      * 8D83A
          :: InitOldMat XLIB MWRun ; ERRTRAP POLResUI&Err POLRestoreUI * 8D849
          ClrDAsOK ;                             * 8D872

* ROMPTR 0EA 010
* refs (1): 8D288
* Sets the locals for an existing matrix. A vector is made one-row for editing, with VEC mode set
InitOldMat~1:
        :: XLIB InitOldMat~2 DUP DIMLIMITS INNER#1= ITE * 8D87C
          :: BINT1 2DUPSWAP 5ROLL 3UNROLL TWO{}N MATREDIM 3UNROLL BINT1 ; * 8D8A0
          :: SWAP BINT0 ;                        * 8D8D2
          BINT1 2OVER #* BINT1 XLIB InitOldMat~3 ; * 8D8E6

* ROMPTR 0EA 012
* refs (2): 8D288 8D288
* Inverts the cell box at the cursor
MWInvertCursor:
        :: TOADISP HARDBUFF 7GETLAM 6GETLAM 5GETLAM 4GETLAM SUBGROB INVGROB * 8D90A
          HARDBUFF 7GETLAM 6GETLAM GROB! ;       * 8D937

* ROMPTR 0EA 013
* refs (1): 8D288
* #first #last -> : draws the column numbers across the top
MWDrawColHeads:
        :: TOADISP XLIB MWColPixels 3UNROLL #1+SWAP DO DUPINDEX@ 13GETLAM #- * 8D950
          #* #12+ 2DUP#+ INDEX@ XLIB MW#>$ XLIB MW$Tail3 $>grob INVGROB * 8D983
          XLIB MWRightPad #1- BINT0 6ROLL INDEX@ 13GETLAM #= IT * 8D9B7
          :: BINT10 #+ ;                         * 8D9E5
          6ROLL OVER#- BINT6 SWAP MAKEGROB INVGROB HARDBUFF ROT BINT0 GROB! * 8D9F9
          GROB! LOOP DROP ;                      * 8DA2B

* ROMPTR 0EA 014
* refs (1): 8D288
* #first #last -> : draws column heads and cells for these columns
MWDrawCols:
        :: 2DUP XLIB MWDrawColHeads XLIB MWDrawCells ; * 8DA3F

* ROMPTR 0EA 015
* refs (1): 8D288
* -> #: width of a column in pixels: the set width in characters times 6
MWColPixels:
        :: COLWIDTH@ #6* ;                       * 8DA64

* ROMPTR 0EA 016
* refs (1): 8D288
* grob #width -> grob #x: gives the x offset to right-align the grob in the column
MWRightPad:
        :: HARDBUFF OVER GROBDIMw 4PICK SWAP#- ; * 8DA78

* ROMPTR 0EA 017
* refs (1): 8D288
* #first #last -> : draws the cell text for these columns, for the rows on screen
MWDrawCells:
        :: TOADISP XLIB MWColPixels 3UNROLL #1+SWAP DO DUPINDEX@ 13GETLAM #- * 8DA9B
          #* #12+ 2DUP#+ 10GETLAM #1+ 12GETLAM DO INDEX@ JINDEX@ * 8DACE
          XLIB MWCellText $>GROB XLIB MWRightPad INDEX@ 12GETLAM #- #8* #6+ * 8DAFB
          7PICK BINT8 SWAP MAKEGROB 7PICK HARDBUFF SWAP4PICK GROB! GROB! * 8DB2F
          LOOP 2DROP LOOP DROP ;                 * 8DB5C

* ROMPTR 0EA 018
* refs (1): 8D288
* -> #: number of columns that fit on screen, less 1
MWColsOnScreen:
        :: BINT20 COLWIDTH@ #/ SWAPDROP#1- ;     * 8DB75

* ROMPTR 0EA 019
* refs (1): 8D288
* Key: to row 1
MWKeyFirstRow:
        :: TakeOver 20GETLAM #0= caseDoBadKey BINT1 * 8DB93
          8PUTLAM 12GETLAM #1= NOTcase XLIB MWMoveCursor * 8DBB1
          XLIB MWInvertCursor XLIB MWCursorY XLIB MWShowCursor ; * 8DBD0

* ROMPTR 0EA 01A
* refs (1): 8D288
* Key: to the last row
MWKeyLastRow:
        :: TakeOver 20GETLAM DUP#0= caseDrpBadKy 8PUTLAM * 8DBF6
          20GETLAM 10GETLAM #>case XLIB MWMoveCursor * 8DC14
          XLIB MWInvertCursor XLIB MWCursorY XLIB MWShowCursor ; * 8DC2E

* ROMPTR 0EA 01B
* refs (1): 8D288
* Key: to column 1
MWKeyFirstCol:
        :: TakeOver 21GETLAM #0= caseDoBadKey BINT1 * 8DC54
          9PUTLAM 13GETLAM #1= NOTcase XLIB MWMoveCursor * 8DC72
          XLIB MWInvertCursor XLIB MWCursorX XLIB MWShowCursor ; * 8DC91

* ROMPTR 0EA 01C
* refs (1): 8D288
* Key: to the last column
MWKeyLastCol:
        :: TakeOver 21GETLAM DUP#0= caseDrpBadKy 9PUTLAM * 8DCB7
          21GETLAM 11GETLAM #>case XLIB MWMoveCursor * 8DCD5
          XLIB MWInvertCursor XLIB MWCursorX XLIB MWShowCursor ; * 8DCEF

* ROMPTR 0EA 01D
* refs (1): 8D288
* Right arrow, repeating
MWKeyRight:
        :: TakeOver SetDA3NoCh REPEATER BINT18 XLIB MWRight ; * 8DD15

* ROMPTR 0EA 01E
* refs (1): 8D288
* [] #row #col -> ob | "": the element, or an empty string outside the matrix or beyond the filled cells
MWCell:
        :: 2DUP 21GETLAM #> SWAP 20GETLAM #> ORcase * 8DD3E

* ROMPTR 0EA 01F
* refs (1): 8D288
* ob #r #c -> "": a cell that is not there
MWNoCell:
          :: 3DROP NULL$ ;                       * 8DD66
          18GETLAM #0=case GetElt                * 8DD7A
          2DUP XLIB MWCellNumber 17GETLAM #>ITE XLIB MWNoCell GetElt ; * 8DD89

* ROMPTR 0EA 021
* refs (2): 8D288 8D288
* # -> $: a binary integer in decimal
MW#>$:
        :: NULL$SWAP BEGIN BINT10 #/ SWAP BINT48 #+ #>CHR ROTSWAP >H$ * 8DDB8
          SWAPDUP #0= UNTIL DROP ;               * 8DDEF

* ROMPTR 0EA 022
* refs (1): 8D288
* $ -> $': keeps the last three characters of a longer string
MW$Tail3:
        :: DUPLEN$ DUP BINT4 #<case DROP         * 8DE08
          DUPTWO #-SWAP SUB$ ;                   * 8DE26

* ROMPTR 0EA 023
* refs (1): 8D288
* Draws row numbers for all rows on screen
MWDrawAllRows:
        :: 12GETLAM 10GETLAM XLIB MWDrawRowNums ; * 8DE3A

* ROMPTR 0EA 024
* refs (1): 8D288
* #first #last -> : draws these row numbers down the left side
MWDrawRowNums:
        :: TOADISP #1+SWAP DO INDEX@ ROMPTR 0EA 020 XLIB MW$Tail3 $>grob * 8DE59
          INVGROB HARDBUFF OVER GROBDIMw BINT12 SWAP#- INDEX@ 12GETLAM #- * 8DE8D
          #8* BINT8 #+ BINT8 BINT12 MAKEGROB INVGROB HARDBUFF BINT0 4PICK * 8DEBA
          BINT2 #- GROB! GROB! LOOP ;            * 8DEEC

* ROMPTR 0EA 025
* refs (1): 8D288
* #row #col -> $: the cell as text, cut with ... to fit the column
MWCellText:
        :: 22Lget 3UNROLL XLIB MWCell DUPTYPECSTR? ?SEMI * 8DF0A
          DECOMP$ CHR_Space >H$ COLWIDTH@ 2DUPSWAP LEN$ #<case * 8DF2E
          :: 1_#1-SUB$ CHR_... >T$ ;             * 8DF51
          DROP ;                                 * 8DF6A

* ROMPTR 0EA 026
* refs (1): 8D288
* Down arrow, repeating
MWKeyDown:
        :: TakeOver SetDA3NoCh REPEATER BINT17 XLIB MWDown ; * 8DF74

* ROMPTR 0EA 027
* refs (1): 8D288
Blank$~1:
        :: NULL$SWAP DUP#0=csDROP ZERO_DO CHR_Space >H$ LOOP ; * 8DF9D

* ROMPTR 0EA 028
* refs (1): 8D288
* ENTER with an edit line: parses the line, stores each object in turn into the cells, and refreshes
MWEnter:
        :: TakeOver DEPTH 1PUTLAM EDITPARTS #>1 ITE XLIB MWRedrawAll * 8DFC5

* ROMPTR 0EA 029
* refs (1): 8D288
* Sets the store's redraw level to none
MWNoRedraw:
          :: BINT0 14PUTLAM ;                    * 8DFF3
          XLIB MWStoreItems 2PUTLAM              * 8E007

* ROMPTR 0EA 02A
* refs (1): 8D288
* Parses the edit line; on success evaluates it to objects on the stack
MWParseLine:
          :: ParseOrFail NOT?SEMI                * 8E017
            InitEd&Modes EVAL AtUserStack ;      * 8E026

* ROMPTR 0EA 02B
* refs (1): 8D288
* Checks the new objects against the matrix type and stores them, then redraws by level
MWStoreItems:
          :: HARDBUFF OCRC SWAPDROP ; 2GETLAM EQUAL ?SKIP XLIB MWRedrawAll * 8E03A
          DEPTH 1GETLAM 2DUP#> NOTcase2DROP #-   * 8E06D
          22Lget TYPELIST? IT                    * 8E086
          :: DUP#1+PICK                          * 8E095
            { BINT1 BINT1 } SWAP TYPECMP? ITE C%0 %0_2A2B4 * 8E09F
            MAKEARRY 22PUTLAM ;                  * 8E0CC
          22Lget TYPERARRY? ITE XLIB MWChkReal XLIB MWChkCmplx * 8E0DB
          XLIB MWPutItems                        * 8E100

* ROMPTR 0EA 02C
* refs (1): 8D288
* Redraws what the stored objects changed: nothing, the cursor cell, or the columns and rows on screen
MWStoreRedraw:
          :: 14GETLAM XLIB MWNoRedraw BINT0 EQcasedrop NOP * 8E10B
            BINT1 EQcasedrop                     * 8E12F

* ROMPTR 0EA 02D
* refs (1): 8D288
* Redraws the cell at the cursor
MWDrawCell:
            :: TOADISP 8GETLAM 9GETLAM XLIB MWCellPadded $>GROB HARDBUFF * 8E139
              7GETLAM 6GETLAM GROB! ;            * 8E162
            BINT2 EQ case                        * 8E176
            :: XLIB MWScrollToCur XLIB MWDrawAllRows XLIB MWShowAllCols ; * 8E185
          ;                                      * 8E1B0
          XLIB MWShowCorner XLIB MWShowCurrent ROMPTR 0EA 011 SetDA12NoCh ; * 8E1B5

* ROMPTR 0EA 02E
* refs (1): 8D288
* ob1..obn #n -> same: all must be reals
MWChkReal:
        :: DUP#0_DO INDEX@ #2+PICK TYPEREAL? ?SKIP * 8E1E0

* ROMPTR 0EA 02F
* refs (1): 8D288
* Stops the command line with the message "Invalid Array Element"
MWBadElt:
          :: DROP # 502 JstGetTHEMESG DO$EXIT ;  * 8E1FE  "Invalid Array Element"
          LOOP ;                                 * 8E221

* ROMPTR 0EA 030
* refs (1): 8D288
* ob1..obn #n -> : stores objects in order, growing the matrix as needed: rows while going down, columns while going right
MWPutItems:
        :: XLIB MWInvertCursor ZERO_DO 8GETLAM 20GETLAM #> IT * 8E22B
          :: 22Lget 8GETLAM 21GETLAM DUP#0=IT DROPONE TWO{}N MATREDIM * 8E254
            22PUTLAM 8GETLAM 20PUTLAM ENTRWISE@ #0=?SEMI 21GETLAM #1= ?SEMI * 8E27C
            XLIB MWCountAll XLIB MWRedrawAll ;   * 8E2A4
          9GETLAM 21GETLAM #> IT                 * 8E2BF
          :: 22Lget MATTRN 9GETLAM 20GETLAM DUP#0=IT DROPONE TWO{}N MATREDIM * 8E2D3
            MATTRN 22PUTLAM 9GETLAM 21PUTLAM ENTRWISE@ #1= ?SEMI * 8E300
            20GETLAM #1= ?SEMI                   * 8E323

* ROMPTR 0EA 031
* refs (1): 8D288
* Marks all cells as filled
MWCountAll:
            :: 20GETLAM 21GETLAM #* 17PUTLAM ; XLIB MWRedrawAll ; * 8E332
          ISTOP-INDEX ROLL 8GETLAM 9GETLAM RowElt# 22Lget ERRSET BANGARRY * 8E360
          ERRTRAP                                * 8E388
          :: DropSysObs ISTOP-INDEX UNROLL ERRJMP ; 22PUTLAM AtUserStack * 8E38D

* ROMPTR 0EA 032
* refs (1): 8D288
* Sets redraw level 1 if nothing higher is set
MWRaiseStore:
          :: 14GETLAM #0= NOT?SEMI               * 8E3B5
            BINT1 14PUTLAM ;                     * 8E3C9
          8GETLAM 9GETLAM XLIB MWCellNumber 17GETLAM 2DUP #>ITE * 8E3D8
          :: #1+ OVER#= ?SKIP XLIB MWRedrawAll   * 8E3FC
            17PUTLAM ;                           * 8E41B
          2DROP XLIB MWStoreRedraw XLIB MWAdvance LOOP ; * 8E425

* ROMPTR 0EA 033
* refs (1): 8D288
* ENTER without an edit line: leaves the MatrixWriter with the matrix or vector; Bad key when empty
MWEnterDone:
        :: TakeOver 17GETLAM #0=case DoBadKey    * 8E44A
          GetMat/Vec 16GETLAM #0=?SKIP TRUE TRUE 3PUTLAM InitEd&Modes ; * 8E463

* ROMPTR 0EA 034
* refs (1): 8D288
* -> []: the matrix, or the vector when it has one row and VEC is on
GetMat/Vec~1:
        :: 20GETLAM #1= 19GETLAM #1= ANDITE      * 8E48B
          :: ERRSET                              * 8E4A9
            :: 22Lget DUP DIMLIMITS EqwHookOf ONE{}N MATREDIM ; ERRTRAP * 8E4B3
            :: DropSysObs 22Lget ; ;             * 8E4E0
          22Lget ;                               * 8E4F9

* ROMPTR 0EA 035
* refs (1): 8D288
* ob1..obn #n -> same: all must be reals or complex; reals become complex
MWChkCmplx:
        :: DUP#0_DO INDEX@ #2+PICK DUPTYPEREAL? ITE * 8E503
          :: Re>C% INDEX@ #3+ ROLLDROP INDEX@ #2+UNROLL ; * 8E521
          :: TYPECMP? ?SKIP XLIB MWBadElt        * 8E549
          ;                                      * 8E563
          LOOP ;                                 * 8E568

* ROMPTR 0EA 036
* refs (1): 8D288
* Moves right after a store; at the end of a row goes to the next row's first column if the shape is fixed
MWStepRight:
        :: 9GETLAM 21GETLAM #<>case XLIB MWRightStep * 8E572
          18GETLAM #0=case XLIB MWRightStep      * 8E591
          BINT1 9PUTLAM 8GETLAM #1+ 8PUTLAM XLIB MWRedrawAll ; * 8E5A6

* ROMPTR 0EA 037
* refs (1): 8D288
* Left arrow, repeating
MWKeyLeft:
        :: TakeOver SetDA3NoCh REPEATER BINT16 XLIB MWLeft ; * 8E5CF

* ROMPTR 0EA 038
* refs (1): 8D288
* #row #col -> #: element number in row-major order
RowElt#~1:
        :: SWAP#1- 21GETLAM #* #+ ;              * 8E5F8

* ROMPTR 0EA 039
* refs (1): 8D288
* Moves down after a store; at the end of a column goes to the next column's first row if the shape is fixed
MWStepDown:
        :: 8GETLAM 20GETLAM #<>case XLIB MWDownStep * 8E616
          18GETLAM #0=case XLIB MWDownStep       * 8E635
          BINT1 8PUTLAM 9GETLAM #1+ 9PUTLAM      * 8E64A

* ROMPTR 0EA 03A
* refs (1): 8D288
* Sets redraw level 2: everything
MWRedrawAll:
          :: BINT2 14PUTLAM ; ;                  * 8E663

* ROMPTR 0EA 03B
* refs (1): 8D288
* #row #col -> #: the count of cells filled up to this one, in the current GO direction
MWCellNumber:
        :: ENTRWISE@ #2= case2drop               * 8E67C
          :: 21GETLAM 20GETLAM #* ;              * 8E690
          ENTRWISE@ #0=ITE                       * 8E6A9
          :: SWAP 21GETLAM ; 20GETLAM SWAP#1- #* #+ ; * 8E6B3

* ROMPTR 0EA 03C
* refs (1): 8D288
~'R;STO:
        :: 'R STO ;                              * 8E6E0

* ROMPTR 0EA 03D
* refs (1): 8D288
~RowElt#;PULLEL;SWAPDROP:
        :: RowElt# PULLEL SWAPDROP ;             * 8E6F4

* ROMPTR 0EA 03E
* refs (1): 8D288
* #row #col -> $: the cell as text, padded or cut to the column width, for the cell redraw
MWCellPadded:
        :: 22Lget 3UNROLL GetElt DECOMP$ CHR_Space >H$ COLWIDTH@ OVERLEN$ * 8E70D
          2DUP #<case                            * 8E73A
          :: DROP 1_#1-SUB$ CHR_... >T$ ;        * 8E744
          #- Blank$ SWAP&$ ;                     * 8E762

* ROMPTR 0EA 03F
* refs (1): 8D288
* Moves to the next cell by GO mode: right, down, or stay
MWAdvance:
        :: ENTRWISE@ #0=case XLIB MWStepRight    * 8E776
          ENTRWISE@ #1=case XLIB MWStepDown      * 8E790
        ;                                        * 8E7A5

* ROMPTR 0EA 040
* refs (1): 8D288
* Removes the old cursor box and goes to MWScrollToCur
MWMoveCursor:
        :: XLIB MWInvertCursor                   * 8E7AA

* ROMPTR 0EA 041
* refs (1): 8D288
* Brings the current cell on screen and sets the cursor box
MWScrollToCur:
          ::                                     * 8E7BA

* ROMPTR 0EA 042
* refs (1): 8D288
* Scrolls the columns shown so that the current column is one of them
MWScrollCols:
            :: 9GETLAM DUP 13GETLAM #<case       * 8E7BF
              :: DUP 13PUTLAM XLIB MWColsOnScreen #+ 11PUTLAM ; * 8E7D8
              DUP 11GETLAM #>case                * 8E801
              :: DUP 11PUTLAM XLIB MWColsOnScreen #- 13PUTLAM ; * 8E810
              DROP ;                             * 8E839

* ROMPTR 0EA 043
* refs (1): 8D288
* Scrolls the four rows shown so that the current row is one of them
MWScrollRows:
            :: 8GETLAM DUP 12GETLAM #<case       * 8E843
              :: DUP 12PUTLAM #4+ 10PUTLAM ;     * 8E85C
              DUP 10GETLAM #>case                * 8E87A
              :: DUP 10PUTLAM #4- 12PUTLAM ;     * 8E889
              DROP ;                             * 8E8A7
            XLIB MWCursorX XLIB MWCursorY ;      * 8E8B1
          SetDA3NoCh ;                           * 8E8CC

* ROMPTR 0EA 044
* refs (1): 8D288
* Clears the display to the right of the last column
MWClearRight:
        :: HARDBUFF 11GETLAM 13GETLAM #1-- XLIB MWColPixels #* #12+ BINT0 * 8E8D6
          BINT131 BINT46 GROB!ZERODRP ;          * 8E909

* ROMPTR 0EA 045
* refs (1): 8D288
* Sets the cursor box's left and right pixels from the current column
MWCursorX:
        :: 9GETLAM 13GETLAM #- XLIB MWColPixels #* #12+ DUP 7PUTLAM * 8E91D
          XLIB MWColPixels #+ 5PUTLAM ;          * 8E950

* ROMPTR 0EA 046
* refs (1): 8D288
* Sets the cursor box's top and bottom pixels from the current row
MWCursorY:
        :: 8GETLAM 12GETLAM #- #8* BINT6 #+DUP 6PUTLAM #8+ 4PUTLAM ; * 8E96A

* ROMPTR 0EA 047
* refs (1): 8D288
* Draws the status line and cursor box, and marks display areas 1 to 3 as unchanged
MWShowCursor:
        :: XLIB MWShowCurrent ROMPTR 0EA 011 SetDA123NoCh ; * 8E9A1

* ROMPTR 0EA 048
* refs (1): 8D288
* -> {}: the MatrixWriter's menu: EDIT VEC ←WID WID→ GO→ GO↓ +ROW -ROW +COL -COL →STK ↑STK
MWMenu:
        :: NoExitAction                          * 8E9C6
          {                                      * 8E9D0
            { $ "EDIT" XLIB MWEDIT }             * 8E9D5
            { XLIB MWLabelVec XLIB MWToggleVec } * 8E9FC
            { $ "←WID" XLIB MW<-WID }            * 8EA1C
            { $ "WID→" XLIB MWWID-> }            * 8EA43
            { XLIB MWLabelGoRight XLIB MWToggleGoRight } * 8EA6A
            { XLIB MWLabelGoDown XLIB MWToggleGoDown } * 8EA8A
            { $ "+ROW" XLIB MW+ROW }             * 8EAAA
            { $ "-ROW" XLIB MW-ROW }             * 8EAD1
            { $ "+COL" XLIB MW+COL }             * 8EAF8
            { $ "-COL" XLIB MW-COL }             * 8EB1F
            { $ "→STK" XLIB MW->STK }            * 8EB46
            { $ "↑STK" IStack } }                * 8EB6D
        ;                                        * 8EB93

* ROMPTR 0EA 049
* refs (1): 8D288
* Menu key →STK: copies the current cell to the stack
MW->STK:
        :: ComLine?:(bip;q) 22Lget 8GETLAM 9GETLAM XLIB MWCell SetDA123NoCh * 8EB98
          DUPTYPECSTR? caseDrpBadKy AtUserStack  * 8EBC1
        ;                                        * 8EBD0

* ROMPTR 0EA 04A
* refs (1): 8D288
* Menu label GO→, with a box when that mode is on
MWLabelGoRight:
        :: TakeOver $ "GO→" ENTRWISE@ #0= Box/StdLabel ; * 8EBD5

* ROMPTR 0EA 04B
* refs (1): 8D288
* Menu label GO↓, with a box when that mode is on
MWLabelGoDown:
        :: TakeOver $ "GO↓" ENTRWISE@ #1= Box/StdLabel ; * 8EC03

* ROMPTR 0EA 04C
* refs (1): 8D288
* Menu label VEC, with a box when that mode is on
MWLabelVec:
        :: TakeOver $ "VEC" 19GETLAM #1= Box/StdLabel ; * 8EC31

* ROMPTR 0EA 04D
* refs (1): 8D288
* Menu key GO→: sets it, or sets no direction if it is on
MWToggleGoRight:
        :: TakeOver ENTRWISE@ #0=ITE BINT2 BINT0 ENTRWISE! XLIB MWGoChanged ; * 8EC5F

* ROMPTR 0EA 04E
* refs (1): 8D288
* Menu key GO↓: sets it, or sets no direction if it is on
MWToggleGoDown:
        :: TakeOver ENTRWISE@ #1= ITE BINT2 BINT1 * 8EC92
          ENTRWISE! XLIB MWGoChanged ;           * 8ECB5

* ROMPTR 0EA 04F
* refs (1): 8D288
* After changing GO: fixes the shape if the matrix has cells and lowers the filled count to its size
MWGoChanged:
        :: 20GETLAM 21GETLAM #* DUP#0= ?SKIP     * 8ECCA
          :: BINT1 18PUTLAM ;                    * 8ECE8
          17GETLAM OVER#< case                   * 8ECFC
          :: 17PUTLAM XLIB MWMoveCursor ;        * 8ED0B
          DROP SetDA12NoCh ;                     * 8ED25

* ROMPTR 0EA 050
* refs (1): 8D288
* Menu key VEC
MWToggleVec:
        :: TakeOver 19GETLAM #0=ITE BINT1 BINT0 19PUTLAM SetDA12NoCh ; * 8ED34

* ROMPTR 0EA 051
* refs (1): 8D288
* Deleting the last row or column: starts over with an empty matrix, keeping the modes
MWClearAll:
        :: 16GETLAM 19GETLAM                     * 8ED61

* ROMPTR 0EA 052
* refs (1): 8D288
DoNewMatrix~2:
          ::                                     * 8ED70

* ROMPTR 0EA 053
* refs (1): 8D288
InitOldMat~2:
            :: COLWIDTH@ #0= NOT?SEMI            * 8ED75
              BINT5 COLWIDTH! ;                  * 8ED89
            NULL{} OBJ_6D909 Push3Zeros          * 8ED98

* ROMPTR 0EA 054
* refs (1): 8D288
InitOldMat~3:
            :: RCLSYSF BINT0 ONEONE XLIB MWColsOnScreen 3PICK#+ BINT5 ONEONE * 8EDA7
              BINT12 BINT6 XLIB MWColPixels #12+ BINT14 FALSE BINT0 ; * 8EDD5
          ;                                      * 8EE03
          XLIB MWBindFast 19PUTLAM 16PUTLAM ;    * 8EE08

* ROMPTR 0EA 055
* refs (1): 8D288
* Up arrow, repeating
MWKeyUp:
        :: TakeOver SetDA3NoCh REPEATER BINT11 XLIB MWUp ; * 8EE22

* ROMPTR 0EA 056
* refs (1): 8D288
* Menu key -ROW: deletes the current row
MW-ROW:
        :: ComLine?:(bip;q) 8GETLAM 20GETLAM #>case DoBadKey * 8EE4B
          # 503 JstGetTHEMESG BigDisp1(st) 20GETLAM #1=case XLIB MWClearAll * 8EE69  "Deleting Row"
          22Lget 8GETLAM 20GETLAM #=?SKIP        * 8EE92

* ROMPTR 0EA 057
* refs (1): 8D288
* [] -> []': moves the rows below the current one up by one
CopyRowsUp~1:
          :: 20GETLAM #1+ 8GETLAM #1+ DO INDEX@ SWAP 21GETLAM #1+_ONE_DO * 8EEA6
            2DUPSWAP INDEX@ GetElt 3PICK #1- INDEX@ RowElt# ROT BANGARRY * 8EED8
            ?ATTNQUIT LOOP SWAPDROP LOOP ;       * 8EF05
          20GETLAM #1- 21GETLAM TWO{}N MATREDIM 22PUTLAM 20GETLAM #1- * 8EF1E
          20PUTLAM XLIB MWCountAll XLIB MWMoveCursor ; * 8EF46

* ROMPTR 0EA 058
* refs (1): 8D288
* Redraws after the column width changed
MWWidthChanged:
        :: XLIB MWInvertCursor 9GETLAM 13GETLAM #- XLIB MWColPixels #* #12+ * 8EF66
          DUP 7PUTLAM XLIB MWColPixels #+ 5PUTLAM XLIB MWShowAllCols * 8EF9A
          XLIB MWClearRight XLIB MWShowCorner XLIB MWShowCursor ; * 8EFC4

* ROMPTR 0EA 059
* refs (1): 8D288
* [] -> []': moves the columns right of the current one left by one
CopyColsLeft~1:
        :: 21GETLAM #1+ 9GETLAM #1+ DO INDEX@ SWAP 20GETLAM #1+_ONE_DO * 8EFEA
          2DUPSWAP INDEX@ SWAP GetElt 3PICK #1- INDEX@ SWAP RowElt# ROT * 8F01C
          BANGARRY ?ATTNQUIT LOOP SWAPDROP LOOP ; * 8F04E

* ROMPTR 0EA 05A
* refs (1): 8D288
* Menu key EDIT: edits the current cell's value on the command line
MWEDIT:
        :: ComLine?:(bip;q) 8GETLAM 9GETLAM XLIB MWCellNumber 17GETLAM #> * 8F06C
          8GETLAM 20GETLAM #> 9GETLAM 21GETLAM #> OR OR ITE NULL$ * 8F095
          :: 22Lget 8GETLAM 9GETLAM XLIB MWCell EDITDECOMP$ ; * 8F0C7
          InitEd&Modes EditString ;              * 8F0F0

* ROMPTR 0EA 05B
* refs (1): 8D288
* [] -> []': moves rows from the current one down by one and clears the current row
CopyRowsDown~1:
        :: 20GETLAM #1+ 8GETLAM #- ONE_DO 20GETLAM INDEX@ #-SWAP 21GETLAM * 8F0FF
          #1+_ONE_DO 2DUPSWAP INDEX@ GetElt 3pick;1+(s) INDEX@ RowElt# ROT * 8F131
          BANGARRY ?ATTNQUIT LOOP SWAPDROP LOOP 8GETLAM SWAP 21GETLAM * 8F159
          #1+_ONE_DO OVERINDEX@ RowElt# OVER TYPECARRY? ITE C%0 %0_2A2B4 * 8F181
          SWAPROT BANGARRY ?ATTNQUIT LOOP SWAPDROP ; * 8F1A9

* ROMPTR 0EA 05C
* refs (1): 8D288
* Menu key ←WID: narrower columns; Bad key at 5 columns on screen
MW<-WID:
        :: ComLine?:(bip;q) COLWIDTH@ BINT5 #<case DoBadKey * 8F1C7
          XLIB MWColsOnScreen DUP #2+            * 8F1E5

* ROMPTR 0EA 05D
* refs (1): 8D288
* #cols -> #width: the width that shows this many columns
MWWidForCols:
          :: BINT20 SWAP #/ SWAPDROP ; COLWIDTH! #1+ 11GETLAM SWAP#- * 8F1FA
          DUP#0=IT                               * 8F22C
          :: #1+ 11GETLAM #1+ 11PUTLAM ; 13PUTLAM XLIB MWWidthChanged ; * 8F231

* ROMPTR 0EA 05E
* refs (1): 8D288
* [] -> []': moves columns from the current one right by one and clears the current column
CopyColsRght~1:
        :: 21GETLAM #1+ 9GETLAM #- ONE_DO 21GETLAM INDEX@ #-SWAP 20GETLAM * 8F264
          #1+_ONE_DO 2DUPSWAP INDEX@ SWAP GetElt 3pick;1+(s) INDEX@ SWAP * 8F296
          RowElt# ROT BANGARRY ?ATTNQUIT LOOP SWAPDROP LOOP 9GETLAM SWAP * 8F2BE
          20GETLAM #1+_ONE_DO OVERINDEX@ SWAP RowElt# OVER TYPECARRY? ITE * 8F2EB
          C%0 %0_2A2B4                           * 8F313
          SWAPROT BANGARRY ?ATTNQUIT LOOP SWAPDROP ; * 8F31D

* ROMPTR 0EA 05F
* refs (1): 8D288
* Menu key -COL: deletes the current column
MW-COL:
        :: ComLine?:(bip;q) 9GETLAM 21GETLAM #>case DoBadKey * 8F33B
          # 504 JstGetTHEMESG BigDisp1(st) 21GETLAM #1=case XLIB MWClearAll * 8F359  "Deleting Column"
          22Lget 9GETLAM 21GETLAM #=?SKIP CopyColsLeft MATTRN 21GETLAM #1- * 8F382
          20GETLAM TWO{}N MATREDIM MATTRN 22PUTLAM 21GETLAM #1- 21PUTLAM * 8F3AA
          XLIB MWCountAll XLIB MWMoveCursor ;    * 8F3D2

* ROMPTR 0EA 060
* refs (1): 8D288
* Menu key +ROW: inserts a row of zeros at the current row
MW+ROW:
        :: ComLine?:(bip;q) 20GETLAM #0= caseDoBadKey BINT1 * 8F3ED
          18PUTLAM # 505 JstGetTHEMESG BigDisp1(st) 22Lget 20GETLAM #1+ * 8F40B  "Inserting Row"
          21GETLAM TWO{}N MATREDIM 20GETLAM #1+ 20PUTLAM 8GETLAM 20GETLAM * 8F433
          #=?SKIP CopyRowsDown 22PUTLAM XLIB MWCountAll XLIB MWMoveCursor ; * 8F45B

* ROMPTR 0EA 061
* refs (1): 8D288
* Menu key +COL: inserts a column of zeros at the current column
MW+COL:
        :: ComLine?:(bip;q) 21GETLAM #0= caseDoBadKey BINT1 * 8F485
          18PUTLAM # 506 JstGetTHEMESG BigDisp1(st) 22Lget MATTRN 21GETLAM * 8F4A3  "Inserting Column"
          #1+ 20GETLAM TWO{}N MATREDIM MATTRN 21GETLAM #1+ 21PUTLAM 9GETLAM * 8F4CB
          21GETLAM #=?SKIP CopyColsRght 22PUTLAM XLIB MWCountAll * 8F4F8
          XLIB MWMoveCursor ;                    * 8F517

* ROMPTR 0EA 062
* refs (1): 8D288
* Menu key WID→: wider columns, up to the limit of 19
MWWID->:
        :: ComLine?:(bip;q) COLWIDTH@ BINT19 #>case DoBadKey * 8F527
          XLIB MWColsOnScreen DUP XLIB MWWidForCols COLWIDTH! #1- 13GETLAM * 8F545
          #+ 9GETLAM OVER#> IT                   * 8F56F
          :: #1+ 13GETLAM #1+ 13PUTLAM ;         * 8F583
          11PUTLAM XLIB MWWidthChanged ;         * 8F5A1

* ROMPTR 0EA 063
* refs (1): 8D288
~TakeOver;KeyN_QUOTE;SetDA1NoCh:
        :: TakeOver KeyN_QUOTE SetDA1NoCh ;      * 8F5B6

* ROMPTR 0EA 064
* refs (1): 8D288
~TakeOver;KeyRS_MUL;SetDA1NoCh:
        :: TakeOver KeyRS_MUL SetDA1NoCh ;       * 8F5CF

* ROMPTR 0EA 065
* refs (1): 8D288
* Goes back to the first page of MWMenu
MWMenuFirst:
        :: TakeOver ' XLIB MWMenu InitMenu ;     * 8F5E8

* ROMPTR 0EA 066
* refs (1): 8D288
~TakeOver;ShowEditMenu:
        :: TakeOver ShowEditMenu ;               * 8F60C

* ROMPTR 0EA 067
* refs (1): 8D288
* Moves up one row, scrolling if needed
MWUp:
        :: 8GETLAM #1-DUP #0= caseDrpBadKy XLIB MWInvertCursor * 8F620
          DUP 8PUTLAM DUP 12GETLAM #<ITE         * 8F644
          :: 12PUTLAM 10GETLAM #1- 10PUTLAM HARDBUFF BINT0 BINT6 * 8F65D

* ROMPTR 0EA 068
* refs (1): 8D288
* ROMPTR 0EA 068 is this # 84 alone: the height of the area scrolled
MWRight~1:
            # 84 BINT38 SUBGROB HARDBUFF BINT0 BINT14 GROB! 12GETLAM DUP * 8F685
            XLIB MWDrawRowNums XLIB MWColPixels 11GETLAM #1+ 13GETLAM DO * 8F6B7
            DUPINDEX@ 13GETLAM #- #* #12+ 2DUP#+ 12GETLAM INDEX@ * 8F6E1
            XLIB MWCellText $>GROB XLIB MWRightPad BINT6 7PICK BINT8 SWAP * 8F709
            MAKEGROB 7PICK HARDBUFF SWAP BINT6 GROB! GROB! 2DROP LOOP DROP ; * 8F738
          :: DROP 6GETLAM DUP 4PUTLAM BINT8 #- 6PUTLAM ; XLIB MWShowCursor ; * 8F76F

* ROMPTR 0EA 069
* refs (1): 8D288
* Moves down one row, scrolling if needed; going down from a first row sets the shape
MWDown:
        :: 17GETLAM #0= 8GETLAM 20GETLAM #> OR caseDoBadKey ENTRWISE@ * 8F7AC
          #0= 18GETLAM #0= ANDcase               * 8F7D9
          :: ONEONE 20PUTLAM 9PUTLAM BINT2 8PUTLAM * 8F7ED

* ROMPTR 0EA 06A
* refs (1): 8D288
* Marks the shape as fixed and moves the cursor
MWFixShape:
            :: BINT1 18PUTLAM XLIB MWMoveCursor ; ; * 8F80B
          XLIB MWInvertCursor                    * 8F82F

* ROMPTR 0EA 06B
* refs (1): 8D288
* Moves down one row, scrolling if needed
MWDownStep:
          :: 8GETLAM #1+DUP 8PUTLAM DUP 10GETLAM #>case * 8F83A
            :: 10PUTLAM 12GETLAM #1+ 12PUTLAM HARDBUFF BINT0 BINT14 BINT131 * 8F85D
              BINT46 SUBGROB HARDBUFF BINT0 BINT6 GROB! 10GETLAM DUP * 8F88A
              XLIB MWDrawRowNums XLIB MWColPixels 11GETLAM #1+ 13GETLAM DO * 8F8B2
              DUPINDEX@ 13GETLAM #- #* #12+ 2DUP#+ 10GETLAM INDEX@ * 8F8DC
              XLIB MWCellText $>GROB XLIB MWRightPad BINT38 7PICK BINT8 SWAP * 8F904
              MAKEGROB 7PICK HARDBUFF SWAP # 26 GROB! GROB! 2DROP LOOP DROP ; * 8F933
            DROP 4GETLAM DUP 6PUTLAM #8+ 4PUTLAM ; * 8F96F
          XLIB MWShowCursor ;                    * 8F992

* ROMPTR 0EA 06C
* refs (1): 8D288
* Moves left one column, scrolling if needed
MWLeft:
        :: 9GETLAM #1-DUP #0=case DropBadKey     * 8F9A2
          XLIB MWInvertCursor DUP 9PUTLAM DUP 13GETLAM #<ITE * 8F9BB
          :: 13PUTLAM 11GETLAM #1- 11PUTLAM HARDBUFF BINT24 BINT0 11GETLAM * 8F9DF
            13GETLAM #- XLIB MWColPixels #* #12+ BINT6 SUBGROB HARDBUFF * 8FA0C
            XLIB MWColPixels BINT24 #+ BINT0 GROB! HARDBUFF BINT12 BINT6 * 8FA3A
            11GETLAM 13GETLAM #- XLIB MWColPixels #* #12+ BINT46 SUBGROB * 8FA68
            HARDBUFF XLIB MWColPixels #12+ BINT6 GROB! 13GETLAM DUP * 8FA96
            XLIB MWDrawCols ;                    * 8FABF
          :: DROP 7GETLAM DUP 5PUTLAM XLIB MWColPixels #- 7PUTLAM ; * 8FACF
          XLIB MWShowCursor ;                    * 8FB02

* ROMPTR 0EA 06D
* refs (1): 8D288
* Moves right one column, scrolling if needed; going right from a first column sets the shape
MWRight:
        :: 17GETLAM #0= 9GETLAM 21GETLAM #> OR caseDoBadKey ENTRWISE@ * 8FB12
          #1= 18GETLAM #0= ANDcase               * 8FB3F

* ROMPTR 0EA 06E
* refs (1): 8D288
* Going right from the first column of a column-wise entry: sets the shape
MWFixShapeCol:
          :: ONEONE 21PUTLAM 8PUTLAM BINT2 9PUTLAM XLIB MWFixShape ; * 8FB53
          XLIB MWInvertCursor                    * 8FB81

* ROMPTR 0EA 06F
* refs (1): 8D288
* Moves right one column, scrolling if needed
MWRightStep:
          :: 9GETLAM #1+DUP 9PUTLAM DUP 11GETLAM #>case * 8FB8C
            :: 11PUTLAM 13GETLAM #1+ 13PUTLAM HARDBUFF XLIB MWColPixels * 8FBAF
              BINT24 #+ BINT0 XLIB MWRight~1 BINT6 SUBGROB HARDBUFF BINT24 * 8FBD8
              BINT0 GROB! HARDBUFF XLIB MWColPixels #12+ BINT6 BINT131 * 8FC06
              BINT46 SUBGROB HARDBUFF BINT12 BINT6 GROB! 11GETLAM DUP * 8FC2F
              XLIB MWDrawCols ;                  * 8FC57
            DROP 5GETLAM DUP 7PUTLAM XLIB MWColPixels #+ 5PUTLAM ; * 8FC67
          XLIB MWShowCursor ;                    * 8FC95

* ROMPTR 0EA 070
* refs (1): 8D288
* PINIT: for each port 1..32, stores a real under a temporary tagged name and purges it, so that a card's port memory is set up
PINIT~1:
        :: BINT33 ONE_DO ?ATTNQUIT %0_2A2B4 ID 'tmp INDEX@ #>$ >TAG DUPUNROT * 8FCA5
          ERRSET                                 * 8FCE1
          :: sto(_,to) purge(to) ; ERRTRAP DropSysObs LOOP ; * 8FCE6

LIB0EA.hash:
        CON(5)  DOHSTR                           * 8FD0E  hash table of library 0EA
        LENGTH                                   * 8FD13  length, to #8FD72
        CON(5)  0                                * 8FD18  names of length 1
        CON(5)  0                                * 8FD1D  names of length 2
        CON(5)  0                                * 8FD22  names of length 3
        CON(5)  0                                * 8FD27  names of length 4
        CON(5)  0                                * 8FD2C  names of length 5
        CON(5)  0                                * 8FD31  names of length 6
        CON(5)  0                                * 8FD36  names of length 7
        CON(5)  0                                * 8FD3B  names of length 8
        CON(5)  0                                * 8FD40  names of length 9
        CON(5)  0                                * 8FD45  names of length 10
        CON(5)  0                                * 8FD4A  names of length 11
        CON(5)  0                                * 8FD4F  names of length 12
        CON(5)  0                                * 8FD54  names of length 13
        CON(5)  0                                * 8FD59  names of length 14
        CON(5)  0                                * 8FD5E  names of length 15
        CON(5)  0                                * 8FD63  names of length 16
        REL(5)  LIB0EA.hash.L1                   * 8FD68  end of the names
LIB0EA.hash.L1:
        CON(5)  0                                * 8FD6D  command 000 has no name
        ENDLENGTH                                * 8FD72

LIB0EA.link:
        CON(5)  DOHSTR                           * 8FD72  link table of library 0EA
        LENGTH                                   * 8FD77  length, to #8FFB1
        REL(5)  MWCancelLine                     * 8FD7C  000 
        REL(5)  MWMarkDAs                        * 8FD81  001 
        REL(5)  MWCancel                         * 8FD86  002 
        REL(5)  MWRun                            * 8FD8B  003 
        REL(5)  MWErrExit                        * 8FD90  004 
        REL(5)  EqwRuleDone~1                    * 8FD95  005 
        REL(5)  DoNewMatrix~1                    * 8FD9A  006 
        REL(5)  MWKeyHook                        * 8FD9F  007 
        REL(5)  MWDisplay                        * 8FDA4  008 
        REL(5)  MWFixCols                        * 8FDA9  009 
        REL(5)  MWShowAllCols                    * 8FDAE  00A 
        REL(5)  MWShowCurrent                    * 8FDB3  00B 
        REL(5)  MWBindFast                       * 8FDB8  00C 
        REL(5)  BindMatVars~1                    * 8FDBD  00D 
        REL(5)  MWShowCorner                     * 8FDC2  00E 
        REL(5)  DoOldMatrix~1                    * 8FDC7  00F 
        REL(5)  InitOldMat~1                     * 8FDCC  010 
        REL(5)  MWInvertCursor                   * 8FDD1  011 
        REL(5)  MWInvertCursor                   * 8FDD6  012 
        REL(5)  MWDrawColHeads                   * 8FDDB  013 
        REL(5)  MWDrawCols                       * 8FDE0  014 
        REL(5)  MWColPixels                      * 8FDE5  015 
        REL(5)  MWRightPad                       * 8FDEA  016 
        REL(5)  MWDrawCells                      * 8FDEF  017 
        REL(5)  MWColsOnScreen                   * 8FDF4  018 
        REL(5)  MWKeyFirstRow                    * 8FDF9  019 
        REL(5)  MWKeyLastRow                     * 8FDFE  01A 
        REL(5)  MWKeyFirstCol                    * 8FE03  01B 
        REL(5)  MWKeyLastCol                     * 8FE08  01C 
        REL(5)  MWKeyRight                       * 8FE0D  01D 
        REL(5)  MWCell                           * 8FE12  01E 
        REL(5)  MWNoCell                         * 8FE17  01F 
        REL(5)  MW#>$                            * 8FE1C  020 
        REL(5)  MW#>$                            * 8FE21  021 
        REL(5)  MW$Tail3                         * 8FE26  022 
        REL(5)  MWDrawAllRows                    * 8FE2B  023 
        REL(5)  MWDrawRowNums                    * 8FE30  024 
        REL(5)  MWCellText                       * 8FE35  025 
        REL(5)  MWKeyDown                        * 8FE3A  026 
        REL(5)  Blank$~1                         * 8FE3F  027 
        REL(5)  MWEnter                          * 8FE44  028 
        REL(5)  MWNoRedraw                       * 8FE49  029 
        REL(5)  MWParseLine                      * 8FE4E  02A 
        REL(5)  MWStoreItems                     * 8FE53  02B 
        REL(5)  MWStoreRedraw                    * 8FE58  02C 
        REL(5)  MWDrawCell                       * 8FE5D  02D 
        REL(5)  MWChkReal                        * 8FE62  02E 
        REL(5)  MWBadElt                         * 8FE67  02F 
        REL(5)  MWPutItems                       * 8FE6C  030 
        REL(5)  MWCountAll                       * 8FE71  031 
        REL(5)  MWRaiseStore                     * 8FE76  032 
        REL(5)  MWEnterDone                      * 8FE7B  033 
        REL(5)  GetMat/Vec~1                     * 8FE80  034 
        REL(5)  MWChkCmplx                       * 8FE85  035 
        REL(5)  MWStepRight                      * 8FE8A  036 
        REL(5)  MWKeyLeft                        * 8FE8F  037 
        REL(5)  RowElt#~1                        * 8FE94  038 
        REL(5)  MWStepDown                       * 8FE99  039 
        REL(5)  MWRedrawAll                      * 8FE9E  03A 
        REL(5)  MWCellNumber                     * 8FEA3  03B 
        REL(5)  ~'R;STO                          * 8FEA8  03C 
        REL(5)  ~RowElt#;PULLEL;SWAPDROP         * 8FEAD  03D 
        REL(5)  MWCellPadded                     * 8FEB2  03E 
        REL(5)  MWAdvance                        * 8FEB7  03F 
        REL(5)  MWMoveCursor                     * 8FEBC  040 
        REL(5)  MWScrollToCur                    * 8FEC1  041 
        REL(5)  MWScrollCols                     * 8FEC6  042 
        REL(5)  MWScrollRows                     * 8FECB  043 
        REL(5)  MWClearRight                     * 8FED0  044 
        REL(5)  MWCursorX                        * 8FED5  045 
        REL(5)  MWCursorY                        * 8FEDA  046 
        REL(5)  MWShowCursor                     * 8FEDF  047 
        REL(5)  MWMenu                           * 8FEE4  048 
        REL(5)  MW->STK                          * 8FEE9  049 
        REL(5)  MWLabelGoRight                   * 8FEEE  04A 
        REL(5)  MWLabelGoDown                    * 8FEF3  04B 
        REL(5)  MWLabelVec                       * 8FEF8  04C 
        REL(5)  MWToggleGoRight                  * 8FEFD  04D 
        REL(5)  MWToggleGoDown                   * 8FF02  04E 
        REL(5)  MWGoChanged                      * 8FF07  04F 
        REL(5)  MWToggleVec                      * 8FF0C  050 
        REL(5)  MWClearAll                       * 8FF11  051 
        REL(5)  DoNewMatrix~2                    * 8FF16  052 
        REL(5)  InitOldMat~2                     * 8FF1B  053 
        REL(5)  InitOldMat~3                     * 8FF20  054 
        REL(5)  MWKeyUp                          * 8FF25  055 
        REL(5)  MW-ROW                           * 8FF2A  056 
        REL(5)  CopyRowsUp~1                     * 8FF2F  057 
        REL(5)  MWWidthChanged                   * 8FF34  058 
        REL(5)  CopyColsLeft~1                   * 8FF39  059 
        REL(5)  MWEDIT                           * 8FF3E  05A 
        REL(5)  CopyRowsDown~1                   * 8FF43  05B 
        REL(5)  MW<-WID                          * 8FF48  05C 
        REL(5)  MWWidForCols                     * 8FF4D  05D 
        REL(5)  CopyColsRght~1                   * 8FF52  05E 
        REL(5)  MW-COL                           * 8FF57  05F 
        REL(5)  MW+ROW                           * 8FF5C  060 
        REL(5)  MW+COL                           * 8FF61  061 
        REL(5)  MWWID->                          * 8FF66  062 
        REL(5)  ~TakeOver;KeyN_QUOTE;SetDA1NoCh  * 8FF6B  063 
        REL(5)  ~TakeOver;KeyRS_MUL;SetDA1NoCh   * 8FF70  064 
        REL(5)  MWMenuFirst                      * 8FF75  065 
        REL(5)  ~TakeOver;ShowEditMenu           * 8FF7A  066 
        REL(5)  MWUp                             * 8FF7F  067 
        REL(5)  MWRight~1                        * 8FF84  068 
        REL(5)  MWDown                           * 8FF89  069 
        REL(5)  MWFixShape                       * 8FF8E  06A 
        REL(5)  MWDownStep                       * 8FF93  06B 
        REL(5)  MWLeft                           * 8FF98  06C 
        REL(5)  MWRight                          * 8FF9D  06D 
        REL(5)  MWFixShapeCol                    * 8FFA2  06E 
        REL(5)  MWRightStep                      * 8FFA7  06F 
        REL(5)  PINIT~1                          * 8FFAC  070 
        ENDLENGTH                                * 8FFB1
        BSS     4                                * 8FFB1  zeros
        ENDLENGTH                                * 8FFB5
        FILLTO  #90000                           * 8FFB5  75 zero nibbles: the next entry stays at #90000
