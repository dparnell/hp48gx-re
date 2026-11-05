* HP 48GX ROM revision R, #46007-#49016: Plotting: PICTURE environment, tracing and cursor keys, the GRAPH menus, ZOOM and box drawing
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: Π'SAVEDDEPTH ShowCoordX xrng(2r) yrng(2r) RepeatCursKey STOAPPLDATA RclPlotVar? 'IDX ShowCoordY ZoomRedraw PlotCleanup PlotEvalAt
* Follows on from the previous file (at #46007 in the original ROM).
        RPL

* refs (1): 3C51B
* -> : 3D plot menus review: the volume on menu row 1, the eye on menu row 7
Review3D:
        :: MenuRow@ #1=case ReviewVol            * 46007
          MenuRow@ BINT7 #=case ReviewEye        * 4601B
        ;                                        * 4602F

* refs (1): 46016
* -> : 3D plot review: the Xvol, Yvol, Zvol, Xrng and Yrng ranges on rows 3 to 7
ReviewVol:
        :: XLIB VparVals 5DROP BINT9 ROLL BINT10 ROLL * 46034

_Xvol:_:
          $ "Xvol:" Range$ DISPROW3 7ROLL 8ROLL  * 4605D

_Yvol:_:
          $ "Yvol:" Range$ DISPROW4 5ROLL 6ROLL  * 46085

_Zvol:_:
          $ "Zvol:" Range$ DISPROW5 ROT 4ROLL    * 460AD

_Xrng:__460D5:
          $ "Xrng:" Range$ DISPROW6 SWAP         * 460D5

_Yrng:__460F8:
          $ "Yrng:" Range$ DISPROW7 SetDA2OKTemp ; * 460F8

* refs (2): 4A83E 4A857
* % -> $: format a number right-aligned in 8 characters for a review screen
%>$8:
        :: BINT8 %>$Fit BINT8 PadLeft$ ;         * 46120

* refs (3): 4A4FF 4A5D1 4A73C
~SWAP;DECOMP&$:
        :: SWAP DECOMP&$ ;                       * 4613E

* refs (3): 20F94 4B20B 4F386
* -> : error "Object In Use" (#9) while a plot is being drawn, seen from the lam 'PlotEnv
CkNotPlotting:
        :: '                                     * 46152

Π'PlotEnv:
          LAM 'PlotEnv DRPExitAtLOOP NOT?SEMI    * 4615C
          BINT9 ERROROUT ;                       * 4617D

* refs (1): 4B4E1
EqwRepRight~1:
        :: OBJ_6F595                             * 4618C
EqwRepRight~1.loop1:
          #1= TRUE EqwFindMove NOTcase EqwBadMove * 46196
          OBJ_6F883 EqwDupBoxParent@ EqwBoxType@ GOTO EqwRepRight~1.loop1 ; * 461AF

* refs (2): 6B482 6F59F
OBJ_461CD:
        :: TakeOver                              * 461CD

* refs (1): 6C433
EqwKeyMap~9:
          :: ' EqwSelMenu ; DUP MenuDef@ EQ caseDROP InitMenu * 461D7
          DispMenu ;                             * 46204

* refs (2): C0577 C066B
OBJ_4620E:
        :: 15GETLAM DUP 21GETLAM                 * 4620E

Π'dependvar_46222:
          LAM 'dependvar                         * 46222

Π'vstp:
          LAM 'vstp 6ROLL                        * 4623D
          :: #SKIPOBS                            * 46253
            :: 3DROP RDROP ;                     * 4625D
            :: ROT %CHS 3UNROLL ;                * 46271
            :: 2DROP %- RDROP ; %CHS ROTDROP 'EvalNoCK:_sup xSTO- ; * 4628A
          TraceFcnTo ;                           * 462BC

* refs (1): C0483
OBJ_462C6:
        :: DUP ~BINT3;#< ?SKIP                   * 462C6
          :: XLIB YSliceShowY                    * 462DA

Π'dependvar_462EA:
            LAM 'dependvar                       * 462EA

Π'Ystp_46305:
            LAM 'Ystp ROT #3= IT %CHS            * 46305
            'EvalNoCK:_sup xSTO+ BINT0 ;         * 4632A
          OBJ_73C12 ;                            * 4633E
        FILLTO  #46378                           * 46348  48 zero nibbles: the next entry stays at #46378

* refs (1): 40BCE
~CK0NOLASTWD;0LASTOWDOB!:
        :: CK0NOLASTWD 0LASTOWDOB! ;             * 46378

* refs (1): 4D290
~BINT23;PUTLAM:
        :: BINT23 PUTLAM ;                       * 4638C

        :: BINT24 PUTLAM ;                       * 463A0

* refs (2): 44B09 44B91
* #key -> FALSE | ob TRUE: MatrixWriter: right-shifted keys that keep their normal meaning (CST, VAR and some on the keypad); any other is a bad key
MWRSKeyOK:
        ::                                       * 463B4
          { BINT9 BINT10 BINT31 BINT32 BINT33 BINT36 BINT37 BINT41 BINT43 } * 463B9
          NTHOF #0=case FALSE                    * 463F0
          'DoBadKeyT ;                           * 463FF

CopyRowsUp:
        XLIB CopyRowsUp~1                        * 46409
        FILLTO  #4651C                           * 46414  264 zero nibbles: the next entry stays at #4651C

* refs (1): 8F396
CopyColsLeft:
        XLIB CopyColsLeft~1                      * 4651C

* refs (1): 45132
AXES>List~1:
        :: DUPTYPECSTR? case                     * 46527
          :: OVER TYPECSTR? NcaseTYPEERR BINT5   * 46536
            PPAR(s);dup;li? NOTcase              * 4654F
            :: 3UNROLL BINT3 {}N ;               * 46559
            ROTSWAP INNERCOMP pshzer DUP ZERO_DO #1-SWAP DUPTYPECSTR? ITE * 46572
            DROP psh1&rev                        * 4659A
            LOOP DROP #2+ reversym {}N ;         * 465A4
          OVER TYPECMP? NcaseTYPEERR DUP         * 465C2
          AxTick? NcaseTYPEERR BINT2             * 465D6
          {}N ;                                  * 465E5
        FILLTO  #46625                           * 465EF  54 zero nibbles: the next entry stays at #46625

* refs (1): 8F460
CopyRowsDown:
        XLIB CopyRowsDown~1                      * 46625
        FILLTO  #4677E                           * 46630  334 zero nibbles: the next entry stays at #4677E

* refs (1): 8F502
CopyColsRght:
        XLIB CopyColsRght~1                      * 4677E

* refs (2): 4527C 454A7
drax~3:
        :: DUPTYPELIST? NOTcasedrop              * 46789
          :: BINT10 BINT10 ;                     * 46798
          CDRCOMP INNERCOMP #2= case2drop        * 467AC
          :: BINT10 BINT10 ;                     * 467C0
          DUPTYPECSTR? IT 2DROP                  * 467D4
          DUPTYPELIST? ITE INCOMPDROP DUP        * 467E3
          DUPTYPEREAL? ?SEMI                     * 467F7
          HXS># SWAP HXS># SWAP ;                * 46801

* refs (2): 4E898 B615C
* -> $x $y TRUE | FALSE: the axis labels in PPAR's axes field, if it has them
RclAxLabels:
        :: RclAx*s DUPTYPELIST? NOTcasedrop FALSE * 4681A
          INNERCOMP BINT2 #=casedrop 2DROPFALSE  * 46833
          BINT4 #= IT ROTDROP                    * 46847
          ROTDROP TRUE ;                         * 4685B

* refs (5): 73A53 73AA8 73DAC 73E1F 8C690
* #pixels % #max -> grob: a coordinate in the minifont, at most #max characters, in #pixels
%>CoordGrob:
        :: %>$Coord SWAP RIGHT$3x6 SWAPDROP ;    * 4686A

* refs (1): 4686F
* % #max -> $: the number in the current format, or with SCI 2 if that is longer than #max
%>$Coord:
        :: SWAPDUP BINT0 !DcompWidth 1stkdecomp$w DUPLEN$ 4ROLL #<case * 46888
          SWAPDROP                               * 468B0
          DROP savefmt1 ERRSET                   * 468B5
          :: BINT2 DOSCI 1stkdecomp$w ; ERRTRAP ederr rstfmt1 ; * 468C4

* refs (6): 0C6A4 0C717 458B6 46C25 46C89 73D20
~BINT25;PUTLAM:
        :: BINT25 PUTLAM ;                       * 468F1

* refs (2): 7396D 739C7
* -> #n: number of equations in a list in EQ, or the curves of a single equation; error if there is no EQ
EqCurveCount:
        :: EQUATION NOTcase ERRJMP               * 46905
          DUPTYPELIST? NOTcasedrop               * 46919
          :: BINT1 EqCurves ;                    * 46923
          LENCOMP ;                              * 46937

* refs (2): 46C39 46C98
~Message60E;FlashMsg:
        :: Message60E FlashMsg ;                 * 46941

* refs (6): 0C681 0C703 45893 47768 47795 73CFD
* % -> ob TRUE | FALSE: set the independent variable to % and evaluate the equation in lam 24. A math error (#3xx) gives FALSE and clears what it left on the stack
PlotEvalAt:
        :: NEWINDEP BINT24 GETLAM ERRSET EVALCRUNCH ERRTRAP * 46955
          :: ERROR@ # 100 #/ SWAPDROP BINT3 #<>case ERRJMP * 46978
            ERRORCLR Π'SAVEDDEPTH DEPTH #1-SWAP #-Floor0 NDROP FALSE RDROP ; * 469A5
          0LASTOWDOB! CK1NOLASTWD U>nbr TRUE ;   * 469D2
        BSS     20                               * 469EB

* refs (1): 488A0
* $ -> : show $ in the status area for a moment, keeping the display
ShowEqBriefly:
        :: Save16 SWAP DISPSTATUS2 SORTASLOW REPEATER BINT17 NOP REPEATER * 469FF
          BINT5 NOP Restore16 ;                  * 46A2C

* refs (1): 7347C
* -> menu: the PICTURE EDIT menu
GraphEditMenu:
        :: NoExitAction                          * 46A40

{MenuGRAPH\EDIT}:
          { {GRAPH\DOT+} {GRAPH\DOT-} {GRAPH\LINE} {GRAPH\TLINE} {GRAPH\BOX} * 46A4A
            {GRAPH\CIRCLE} {GRAPH\MARK} {GRAPH\+/-} {GRAPH\LABEL} * 46A68
            {GRAPH\DEL}                          * 46A7C

{GRAPH\ERASE}:
            {                                    * 46A81

_ERASE_:
              $ "ERASE"                          * 46A86
              :: CHECKMENU PictKeyERASE ; }      * 46A9A

{GRAPH\MENU}:
            {                                    * 46AB3

_MENU_:
              $ "MENU" MENUOFF }                 * 46AB8
            {GRAPH\SUä} {GRAPH\REPL}             * 46AD4

{GRAPH\PICT->}:
            {                                    * 46ADE

_PICT->_:
              $ "PICT→"                          * 46AE3
              :: CHECKMENU PictKeyPICT> ; }      * 46AF7

{GRAPH\X,Y->}:
            {                                    * 46B10

_X,Y->_:
              $ "X,Y→"                           * 46B15
              :: CHECKMENU OBJ_73AEE ; }         * 46B27
            {GRAPH\BLANK} {GRAPH\PICT} }         * 46B40
        ;                                        * 46B4F

* refs (2): 4A88D 8D17F
* -> : bind lam 'PlotEnv to a work grob, and cache 27 lams under the name nohalt for the plot loops
BindPlotEnv:
        :: BINT8 BINT50 MAKEGROB                 * 46B54

{'PlotEnv}:
          {                                      * 46B68

Π'PlotEnv_46B6D:
            LAM 'PlotEnv }                       * 46B6D
          BIND BINT27 ' nohalt CACHE ;           * 46B89

* refs (2): 4CE8D 4D2D1
* -> : bind the lams 'EnvOK, 'EXITFCN and 'SAVEDDEPTH for PICTURE
BindPictEnv:
        :: FALSE ZEROZERO                        * 46BA7
          {                                      * 46BB6

Π'EnvOK:
            LAM 'EnvOK                           * 46BBB

Π'EXITFCN:
            LAM 'EXITFCN                         * 46BCE

* refs (25): 4569F 456AE 45735 45744 469AA 4770E ...
Π'SAVEDDEPTH:
            LAM 'SAVEDDEPTH }                    * 46BE5
          BIND EXITFCNsto NOP ;                  * 46C07

* refs (4): 0C68B 0C69A 73D07 73D16
* -> : polar trace: the value is undefined: lam 25 NULL::, keep the cursor's coordinates (lam 7), flash "undefined" unless coordinates are shown
TraceUndefPolar:
        :: PTR NULL:: ~BINT25;PUTLAM 7GETLAM ~16GETLAM;#1= ?SEMI * 46C1B
          ~Message60E;FlashMsg ;                 * 46C39

* refs (3): 0C6B3 0C73A 458C0
* %x %y -> : trace: move the crosshair to the point, kept inside the window
TraceCursorTo:
        :: %>WinRow SWAP %>WinCol CROSS_OFF TOTEMPSWAP TOTEMPSWAP 8PUTLAM * 46C43
          7PUTLAM CROSS_HAIRS ;                  * 46C6B

* refs (4): 0C721 0C730 4589D 458AC
* -> : trace: the value is undefined: lam 25 NULL::, flash "undefined" unless coordinates are shown
TraceUndef:
        :: RECORDX&YC% PTR NULL:: ~BINT25;PUTLAM ~16GETLAM;#1= ?SEMI * 46C7A
          ~Message60E;FlashMsg ;                 * 46C98

* refs (1): 472AE
* -> : after moving the crosshair: show it, update coordinates, and in the DOT modes set the pixel
CursMoved:
        :: CROSS_HAIRS ?ShowCoords OBJ_73657 ?SEMI * 46CA2
          CROSS_OFF CursDot ;                    * 46CBB

* refs (1): 46C52
* %x -> #col: x as a column of PICT, kept within the window
%>WinCol:
        :: 6GETLAM 10GETLAM getxpos SWAP #1=?SKIP DROPZERO LEFTCOL 2DUP#< IT * 46CCA
          SWAP                                   * 46CFC
          DROP RIGHTCOL 2DUP#> IT SWAP           * 46D01
          DROP ;                                 * 46D1A

* refs (2): 46C48 73D25
* %y -> #row: y as a row of PICT, kept within the window
%>WinRow:
        :: 5GETLAM 9GETLAM getypos SWAP #1=?SKIP DROPZERO TOPROW 2DUP#< IT * 46D24
          SWAP                                   * 46D56
          DROP BOTROW 2DUP#> IT SWAP             * 46D5B
          DROP ;                                 * 46D74

        :: #>$                                   * 46D7E

Π'Ptype:
          LAM 'Ptype                             * 46D88
          { xFUNCTION                            * 46D9B

_F__46DA5:
            $ "F" POLAR                          * 46DA5

_R__46DB6:
            $ "R" xPARAMETRIC                    * 46DB6

_P_:
            $ "P" }                              * 46DC7
          EQLookup DROP SWAP&$ $>ID ;            * 46DD8
        BSS     5                                * 46DF1  zeros

* refs (2): 736B6 736E3
* -> : trace: left arrow
TraceStepLeft:
        :: OBJ_4DCC6 BINT2 OBJ_735CB ;           * 46DF6

* refs (2): 73701 7372E
* -> : trace: right arrow
TraceStepRight:
        :: OBJ_4DCC6 BINT1 OBJ_735CB ;           * 46E0F

* refs (12): 4D3CB 4D3EE 4D402 4D4F2 4D515 4D529 ...
* -> : PICTURE: takes #key and action from the runstream. Run the action, refresh coordinates if they are shown, and go on while the key is held
RepeatCursKey:
        :: TakeOver 'R'R ~16GETLAM;#1= IT        * 46E28
          :: ROT BINT2 ::N ;                     * 46E41
          DUP EVAL ~16GETLAM;#1= IT              * 46E5A
          :: ROT EVAL ;                          * 46E6E
          OVER REPKEY? NOTcase2DROP BEGIN        * 46E82
          2DUPSWAP REPKEY? WHILE                 * 46E96
          ::                                     * 46EA5
            :: OBJ_4DCC6 EVAL ; ;                * 46EAA
          REPEAT 3DROP ;                         * 46EC3

        :: TakeOver ~16GETLAM;#1= IT             * 46ED2
          :: ROT BINT2 ::N ;                     * 46EE6
          DUP EVAL ~16GETLAM;#1= IT              * 46EFF
          :: ROT EVAL ;                          * 46F13
          OVER REPKEY? NOTcase2DROP BEGIN        * 46F27
          2DUPSWAP REPKEY? WHILE                 * 46F3B
          ::                                     * 46F4A
            :: OBJ_4DCC6 EVAL ; ;                * 46F4F
          REPEAT 3DROP ;                         * 46F68

        :: TakeOver 'R'R ~16GETLAM;#1= IT        * 46F77
          :: ROT BINT2 ::N ;                     * 46F90
          DUP EVAL ~16GETLAM;#1= IT              * 46FA9
          :: ROT EVAL ;                          * 46FBD
          OVER REPKEY? NOTcase2DROP BEGIN        * 46FD1
          2DUPSWAP REPKEY? WHILE                 * 46FE5
          ::                                     * 46FF4
            :: OBJ_4DCC6 EVAL ; ;                * 46FF9
          REPEAT 3DROP ;                         * 47012

* refs (2): 4D36C 4D687
* #lam #pos -> : set the crosshair's row or column (lam 7 or 8) to #pos, update coordinates, and in the DOT modes draw
CursJumpTo:
        :: CursLam! ?ShowCoords OBJ_73657 ?SEMI  * 47021
          CROSS_OFF                              * 4703A

* refs (5): 46CC0 470DF 4710C 4D42F 4D74F
* -> : with the cursor in DOT- mode (lam 3 = 1) erase, otherwise draw, the pixel at the cursor
CursDot:
          :: ~3GETLAM;#1=_2 case DotOff          * 4703F
            DotOn ;                              * 47053
        ;                                        * 4705D

        :: ' ShowCoordY TraceMode? ITE           * 47062
          :: '                                   * 4707B
            :: ShowCoordX ShowCoordY ; ;         * 47085
          :: ' ShowCoordX ;                      * 4709E
        ;                                        * 470B2

* refs (4): 4D623 738B4 7390E 73940
* -> : move the crosshair one column right, scrolling at the window's edge
CursRight:
        :: WINDOWRIGHT? IT WINDOWRIGHT           * 470B7
          CROSS_OFF 8GETLAM 14GETLAM !#1+IF<dim-1 CursDot ; * 470CB

* refs (4): 0C834 0C88E 0C8C0 4D533
* -> : move the crosshair one column left, scrolling at the window's edge
CursLeft:
        :: WINDOWLEFT? IT WINDOWLEFT             * 470E9
          CROSS_OFF 8GETLAM !#1-IF>0 CursDot ;   * 470FD

* refs (2): 8C835 8CA34
* -> : coordinates on: lam 16 = 1, draw the two labels and the two values in the coordinate line
ShowCoordsXY:
        :: BINT1 16PUTLAM CoordLabels $>grob HARDBUFF2 BINT0 BINT2 GROB! * 47116
          $>grob HARDBUFF2 # 41 BINT2 GROB! ShowCoordX ShowCoordY ; * 47143

* refs (1): 8CB78
* -> : as ShowCoordsXY, with the first label only
ShowCoordsY:
        :: BINT1 16PUTLAM CoordLabels $>grob HARDBUFF2 BINT0 BINT2 GROB! * 47170
          DROP ShowCoordX ShowCoordY ;           * 4719D

* refs (2): 47125 4717F
* -> $y $x: "Y: " and "X: " from the first letters of the dependent and independent variables
CoordLabels:
        :: ~RclDepnd;1get(li)? ID>$ ONEONE SUB$ $ ": " &$ INDEPVAR ID>$ * 471B1
          ONEONE SUB$ $ ": " &$ ;                * 471E7

* refs (18): 0C7FD 0C848 0C8C5 4708A 470A8 47161 ...
* -> : show the first coordinate: when tracing, by the plot type's own routine (element 1 of lam 26)
ShowCoordX:
        :: TraceMode? NOTcase OBJ_73DE8          * 47209
          BINT26 GETLAM CARCOMP EVAL ;           * 4721D

* refs (10): 0C807 0C84D 4706C 4708F 47166 471A7 ...
* -> : show the second coordinate, as ShowCoordX with element 2 of lam 26
ShowCoordY:
        :: TraceMode? NOTcase OBJ_73A8F          * 47236
          BINT26 GETLAM BINT2 NTHCOMPDROP EVAL ; * 4724A

* refs (2): 45BD9 73837
OBJ_47268:
        :: BINT0 OBJ_735CB ~16GETLAM;#1= NOT?SEMI * 47268
          PictShowXY ;                           * 47281

* refs (2): 4D493 4D592
* #col -> : bad key while tracing, otherwise move the crosshair to the column
CursToCol:
        :: TraceMode? case DoBadKey              * 4728B
          CROSS_OFF TOTEMPOB 8PUTLAM CursMoved ; * 4729F

* refs (7): 45A07 8A68D 8B2F2 8B584 8B986 8C0DC ...
~'R;EVAL;ERRJMP:
        :: 'R EVAL ERRJMP ;                      * 472B8

* refs (6): 4B61B 4F723 4F7EB 4FA16 4FBC9 50479
~3PICK;GROBDIM:
        :: 3PICK GROBDIM ;                       * 472D1
        FILLTO  #4735A                           * 472E5  117 zero nibbles: the next entry stays at #4735A

* refs (11): 1574E 2C2A2 473F0 47C86 496B9 4AA46 ...
* id -> ob TRUE | FALSE: recall a plot variable (EQ, ΣDAT, PPAR, ZPAR)
RclPlotVar?:
        :: dup;Vector*­Rcl(nm)? DUP case ROTDROP * 4735A
          SWAPDROP ;                             * 47373

* refs (4): 2C257 4735F 4746C 47876
dup;Vector*­Rcl(nm)?:
        :: dup;RclInVars(gn)? NOTcaseFALSE OVER  * 4737D
          'EQ EQUALcase                          * 47391
          :: PPARIndep OVER EQUALcase TRUE       * 4739B
            GOTO dup;Vector*­Rcl(nm)?.L1 ;       * 473B4
dup;Vector*­Rcl(nm)?.L1:
          DUPTYPEIDNT? NOTcaseTRUE DUPSAFE@      * 473C3
          IT ROTDROP                             * 473D2
          TRUE ;                                 * 473DC

* refs (3): 15398 473A0 478D5
* -> id: the independent variable of PPAR, X when PPAR doesn't give one
PPARIndep:
        :: 'IDPAR RclPlotVar? NOTcase 'IDX       * 473E6
          DUPTYPELIST? NOTcasedrop 'IDX          * 473FF
          BINT3 NTHELCOMP NOTcase 'IDX           * 4740E
          1get(li)? ;                            * 47422

* refs (1): 48553
* -> : BOXZ: rubber band for the row after the cursor
BoxRowBelow:
        :: 7GETLAM #1+ BoxEdgeH ;                * 4742C

* refs (3): 0DCD1 0DD99 0DE52
* An empty secondary, used as a table entry
OBJ_47445:
        :: ;                                     * 47445

* -> id
* refs (11): 473FA 47409 4741D 48BE8 48C1F 48C65 ...
'IDX:
        :: '                                     * 4744F

X:
          ID X ;                                 * 47459

* refs (11): 2C225 49691 49A97 49B14 49D2B 51080 ...
STOAPPLDATA:
        :: dup;Vector*­Rcl(nm)? IT DROP          * 47467
          XEQSTOID ;                             * 4747B

* refs (1): 73429
PlotScr*en:
        :: NoExitAction                          * 47485

{MenuGRAPH\FCN}:
          {                                      * 4748F

{FCN\ROOT}:
            {                                    * 47494

_ROOT_:
              $ "ROOT" PlotScr*en~7 }            * 47499

{FCN\ISECT}:
            {                                    * 474B5

_ISECT_:
              $ "ISECT" PlotScr*en~8 }           * 474BA

{FCN\SLOPE}:
            {                                    * 474D8

_SLOPE_:
              $ "SLOPE" PlotScr*en~10 }          * 474DD

{FCN\AREA}:
            {                                    * 474FB

_AREA__47500:
              $ "AREA" PlotScr*en~12 }           * 47500

{FCN\SHADE}:
            {                                    * 4751C

_SHADE_:
              $ "SHADE" PlotScr*en~2 }           * 47521

{FCN\EXTR}:
            {                                    * 4753F

_EXTR_:
              $ "EXTR" PlotScr*en~9 }            * 47544

{FCN\F(X)}:
            {                                    * 47560

_F(X)_:
              $ "F(X)" PlotScr*en~15 }           * 47565

{FCN\F'}:
            {                                    * 47581

_F'_:
              $ "F'" PlotScr*en~17 }             * 47586

{FCN\TANL}:
            {                                    * 4759E

_TANL_:
              $ "TANL" PlotScr*en~1 }            * 475A3

{FCN\NXEQ}:
            {                                    * 475BF

_NXEQ__475C4:
              $ "NXEQ"                           * 475C4
              :: CHECKMENU NextInEQ ; }          * 475D6

{FCN\VIEW}:
            {                                    * 475EF

_VIEW__475F4:
              $ "VIEW"                           * 475F4
              :: CHECKMENU PictKeyEQ ; }         * 47606
            {GRAPH\PICT} }                       * 4761F
        ;                                        * 47629

* refs (1): 475B5
PlotScr*en~1:
        :: CHECKMENU FcnEqArgs 2DROP CRUNCHNoBlame DUPTYPEREAL? NOTcasedrop * 4762E
          ERRJMP                                 * 47651
          FcnEqArgs CkEQUtil PointDerivUt ZEROZERO ROT Crunch3Kept * 47656
          ROTROT2DROP ~RclDepnd;1get(li)? SWAP INDEPVAR 8GETLAM COL>%X 3PICK * 47674
          %* 5ROLL SWAP %- ' x* SWAP BINT5 meta+ DROP ' x= BINT7 SYMBN DUP * 47697
          GETRHS BINT24 PUTLAM                   * 476E2

_TanLine_:
          $ "TanLine" >TAG Π'SAVEDDEPTH #1+ ' Π'SAVEDDEPTH STO AtUserStack * 476F1
          DUP OBJ_49D3A                          * 4772C

* refs (2): 47781 477A4
* -> %min %max: the independent range of the plot
IndepLoHi:
          :: GETINDEP GETPMIN&MAX IndepRange %MAXorder SWAP ; DROP 15GETLAM * 47736
          SWAP PlotEvalAt NOTcase ERRJMP         * 47763
          BINT28 PUTLAM IndepLoHi SWAPDROP 15GETLAM SWAP PlotEvalAt NOTcase * 47777
          ERRJMP                                 * 4779F
          IndepLoHi ROT %>C% SWAP BINT28 GETLAM %>C% CROSSMARKOFF line(2c) * 477A4
          CROSSMARKON ;                          * 477D1

* refs (1): 47535
PlotScr*en~2:
        :: CHECKMENU ?NEWMARK 2DROP PlotScr*en~3 ' PlotScr*en~4 BINT3 ::N ' * 477DB
          ExitFcn STO ;                          * 4780D

* refs (1): 477EF
PlotScr*en~3:
        :: OBJ_73DFC 1GETLAM                     * 4781C

* refs (4): 4768D 4981E 73C85 73E06
* #col -> %x: column to user x, using the origin (lam 6) and scale (lam 10)
COL>%X:
          :: UNCOERCE%% 6GETLAM %%- 10GETLAM %%/>% ; %MAXorder ; * 4782B

* refs (5): 49030 49B55 49B82 4B751 4BAC6
~DUP;ALGeq?:
        :: DUP ALGeq? ;                          * 47858

* refs (3): 15278 153CA 49D35
Trceq:
        :: 'EQ dup;Vector*­Rcl(nm)? NOT?SEMI     * 4786C
          DUP EqList? NOTcase                    * 47880

* refs (1): 478F3
* Probably: ob id -> tagged: tag ob with the variable an EQ name stands for, following names that hold other names
OBJ_4788F:
          :: SWAP FastCat? NOTcase ID>TAG        * 4788F
            'EQ EQcase ID>TAG                    * 478A8
            SWAPDROP ;                           * 478B7
          SWAPDROP CARCOMP DUPTYPEIDNT? NOT?SEMI * 478C1
          PPARIndep OVER EQUAL ?SEMI             * 478D5
          dup;RclInVars(gn)? IT OBJ_4788F        * 478E9
        ;                                        * 478F8

        # 62E                                    * 478FD  1582

        # 618                                    * 47907  1560

        # 619                                    * 47911  1561

        # 61A                                    * 4791B  1562

        # 61B                                    * 47925  1563

* refs (1): 2210A
IOSetup~1:
        # 61C                                    * 4792F  1564

        # 61D                                    * 47939  1565

        # 61E                                    * 47943  1566

* refs (1): 4A03C
* # 61F: message number of " (OFF SCREEN)"
MSG(OFFSCREEN):
        # 61F                                    * 4794D  1567

        # 620                                    * 47957  1568

        # 621                                    * 47961  1569

* refs (1): 20281
xBESTFIT~1:
        # 605                                    * 4796B  1541

* refs (1): 15282
1FrDisp(st):
        :: NoInfo? caseDROP                      * 47975

* refs (4): 15586 15617 15680 9EF0A
APPprompt1!:
          :: ~TOADISP;BlankDA1 DISPROW1 DispStsBound ; * 47984
          SetDA1Valid ;                          * 4799D

* refs (1): 99252
APPprompt2:
        :: NoInfo? case2DROP                     * 479A7

1&2FrDisp(st):
          :: DISPROW1 DISPROW2 SetDA1Valid ;     * 479B6
        ;                                        * 479CF

* refs (4): 15269 220FB 4797A 479AC
* -> flag: TRUE when no INFO text should be shown: program or algebraic entry, an application, the EquationWriter, an edit line, flag -58, or a waiting key
NoInfo?:
        :: PrgmEntry? AppMode? OR EqwActive? OR EditLExists? OR BINT58 * 479D4
          TestSysFlag OR KEYINBUFFER? OR ;       * 47A01

* refs (16): 1E630 48E00 48E6E 48EB4 48EEB 8A134 ...
xrng(2r):
        :: %MAXorder 2DUP %= caseSIZEERR PUTXMIN * 47A1A
          PUTXMAX ;                              * 47A38

* refs (13): 1E650 4959B 8A15B 8AC4D 8B625 8BCFE ...
yrng(2r):
        :: %MAXorder 2DUP %= caseSIZEERR PUTYMIN * 47A42
          PUTYMAX ;                              * 47A60

* refs (1): 1E06D
indep(2r):
        :: CK2NOLASTWD BINT2 {}N COLA xINDEP     * 47A6A
        ;                                        * 47A88

* refs (1): 1E24E
xDEPND~real:
        :: CK2NOLASTWD BINT2 {}N COLA xDEPND     * 47A8D
        ;                                        * 47AAB

* refs (1): 47899
FastCat?:
        :: BINT59 TestSysFlag ;                  * 47AB0  flag -59: Show variables / Show names only

* refs (1): 47E19
* -> : ZOOM ZIN: both axes by the factors in ZPAR
ZoomIn:
        :: CHECKMENU PPAR>ZPAR TRUE ZoomHV ;     * 47AC4

* refs (1): 47E3A
* -> : ZOOM ZOUT: both axes
ZoomOut:
        :: CHECKMENU FALSE PPAR>ZPAR ZoomHV ;    * 47AE2

* refs (2): 47AD8 47AF6
* flag -> : zoom both axes by ZPAR's factors; TRUE zooms in
ZoomHV:
        :: ZPARFactors 3PICKSWAP ZFactor VSCALE DROP ZFactor HSCALE DROP * 47B00
          ZoomRedraw ;                           * 47B2D

* refs (1): 47BFA
* -> flag: TRUE if ZPAR says to recentre at the crosshairs
ZRecenter?:
        :: RclZPAR NOTcaseFALSE DROP             * 47B37
          ROTROT2DROP DUPTYPEREAL? NOTcasedrop FALSE * 47B4B
          %1 %= ;                                * 47B5F

* refs (4): 47B0F 47B1E 48102 4812A
* %f flag -> %': the factor to give HSCALE or VSCALE: |f| (not 0), taken as above 1 for TRUE and below 1 for FALSE
ZFactor:
        :: %ABS DUP %0= IT                       * 47B6E
          :: DROP %MINREAL ;                     * 47B87
          DUP %1 %> 3PICK XOR ?SEMI              * 47B9B
          %1 SWAP %/ ;                           * 47BB9

* refs (1): 47E5B
* -> : ZOOM ZSQR: make the y scale equal the x scale
ZoomSquare:
        :: CHECKMENU PPAR>ZPAR GETSCALE DROPDUP PUTSCALE ZoomRedraw ; * 47BCD

* refs (8): 47B2D 47BEB 47C63 4801C 48071 48111 ...
* -> : after a zoom: recentre if ZPAR asks for it, then erase and draw again
ZoomRedraw:
        :: ZRecenter? IT                         * 47BF5
          :: RECORDX&YC% centr(c) ;              * 47C04
          ERASE&DRAW ;                           * 47C18

        :: CHECKMENU PPAR>ZPAR BINT131 MakeRange(s) BINT64 MakeRange(s) * 47C22
          ROTSWAP %>C% 3UNROLL %>C% pmin(c) pmax(c) ZoomRedraw ; * 47C45

* refs (3): 47B05 480F8 48120
* -> %h %v: horizontal and vertical zoom factors from ZPAR, 4 and 4 by default
ZPARFactors:
        :: '                                     * 47C6D

ZPAR:
          ID ZPAR RclPlotVar? NOTcase            * 47C77

* refs (3): 47CAE 47CD6 47D03
* -> %4 %4
%4%4:
          :: %4 %4 ;                             * 47C90
          DUPTYPELIST? NOTcasedrop %4%4          * 47CA4
          INNERCOMP DUP BINT4 #= NOTcase         * 47CB3
          :: NDROP %4%4 ;                        * 47CCC
          3DROP DUPTYPEREAL? 3PICK TYPEREAL? AND ?SEMI * 47CE0
          2DROP %4%4 ;                           * 47CFE

* refs (3): 46B45 4761F 47FE5
* The PICT menu key: back to the PICTURE menu in lam 22
{GRAPH\PICT}:
        {                                        * 47D0D
          ::                                     * 47D12
* The Very Big List names this address {PICT\}, but it is a pointer inside an object; the name is not used
            PTR DirLabel:                        * 47D17

PICT:
            $ "PICT" ;                           * 47D1C
          :: CHECKMENU BINT22 GETLAM InitMenu DispMenu ; } * 47D33

* refs (1): 47DCA
* -> : ZOOM ZFACT: run the zoom factor input form
PictKeyZFACT:
        :: CHECKMENU DOCLLCD TOADISP CROSS_OFF XLIB PlotZoomForm TOGDISP * 47D5B
          CROSS_HAIRS DispMenu ;                 * 47D84

* refs (2): 0C910 7334C
* -> menu: the PICTURE ZOOM menu
GraphZoomMenu:
        :: NoExitAction                          * 47D93
          {                                      * 47D9D
            {                                    * 47DA2

{MenuGRAPH\ZOOM}:
              ::                                 * 47DA7
* The Very Big List names this address {ZOOM\ZFACT}, but it is a pointer inside an object; the name is not used
                PTR DirLabel:                    * 47DAC

ZFACT:
                $ "ZFACT" ;                      * 47DB1
              PictKeyZFACT }                     * 47DCA
            {                                    * 47DD4
              ::                                 * 47DD9
* The Very Big List names this address {ZOOM\BOXZ}, but it is a pointer inside an object; the name is not used
                PTR DirLabel:                    * 47DDE

BOXZ:
                $ "BOXZ" ;                       * 47DE3
              GraphZoomMenu~1 }                  * 47DFA
            {                                    * 47E04

ZIN:
              $ "ZIN" ZoomIn }                   * 47E09
            {                                    * 47E23

ZOUT:
              $ "ZOUT" ZoomOut }                 * 47E28
            {                                    * 47E44

ZSQR:
              $ "ZSQR" ZoomSquare }              * 47E49
            {                                    * 47E65

ZDFLT:
              $ "ZDFLT" ZoomDflt }               * 47E6A
            {                                    * 47E88

HZIN:
              $ "HZIN" ZoomHIn }                 * 47E8D
            {                                    * 47EA9

HZOUT:
              $ "HZOUT" ZoomHOut }               * 47EAE
            {                                    * 47ECC

VZIN:
              $ "VZIN" ZoomVIn }                 * 47ED1
            {                                    * 47EED

VZOUT:
              $ "VZOUT" ZoomVOut }               * 47EF2
            { $ "CNTR" PictKeyCNTR }             * 47F10
            {                                    * 47F31

ZAUTO:
              $ "ZAUTO" ZoomAuto }               * 47F36
            { $ "ZDECI" ZoomDeci }               * 47F54
            { $ "ZINTG" ZoomIntg }               * 47F77
            { $ "ZTRIG" ZoomTrig }               * 47F9A
            { $ "ZLAST" ZoomLast } {GRAPH\BLANK} {GRAPH\PICT} } * 47FBD
        ;                                        * 47FEF

* refs (1): 47F6D
* -> : ZOOM ZDECI: 0.1 per pixel on x
ZoomDeci:
        :: CHECKMENU PPAR>ZPAR %1                * 47FF4

* refs (1): 4803F
* % -> : set the x scale (units per 10 pixels), keep y, redraw
ZoomScaleX:
          :: GETSCALE SWAPDROP PUTSCALE ZoomRedraw ; ; * 48008

* refs (1): 47F90
* -> : ZOOM ZINTG: 1 per pixel on x
ZoomIntg:
        :: CHECKMENU PPAR>ZPAR %10 ZoomScaleX ;  * 4802B

* refs (1): 47FB3
* -> : ZOOM ZTRIG: x scale π/2 per 10 pixels, y scale 1
ZoomTrig:
        :: CHECKMENU PPAR>ZPAR %%PI %%2 %%/>% %1 PUTSCALE ZoomRedraw ; * 48049

* refs (1): 47E9F
* -> : ZOOM HZIN
ZoomHIn:
        :: CHECKMENU PPAR>ZPAR TRUE ZoomH ;      * 4807B

* refs (1): 47EC2
* -> : ZOOM HZOUT
ZoomHOut:
        :: CHECKMENU PPAR>ZPAR FALSE ZoomH ;     * 48099

* refs (1): 47EE3
* -> : ZOOM VZIN
ZoomVIn:
        :: CHECKMENU PPAR>ZPAR TRUE ZoomV ;      * 480B7

* refs (1): 47F06
* -> : ZOOM VZOUT
ZoomVOut:
        :: CHECKMENU PPAR>ZPAR FALSE ZoomV ;     * 480D5

* refs (2): 4808F 480AD
* flag -> : zoom the x axis by ZPAR's factor; TRUE zooms in
ZoomH:
        :: ZPARFactors DROP ZFactor HSCALE DROP ZoomRedraw ; * 480F3

* refs (2): 480CB 480E9
* flag -> : zoom the y axis by ZPAR's factor; TRUE zooms in
ZoomV:
        :: ZPARFactors SWAPDROP ZFactor VSCALE DROP ZoomRedraw ; * 4811B

* refs (1): 47F4A
* -> : ZOOM ZAUTO
ZoomAuto:
        :: CHECKMENU PPAR>ZPAR AUTOSCALE ZoomRedraw ; * 48143

* refs (1): 47E7E
* -> : ZOOM ZDFLT: back to the default PPAR, with the plot type and variables kept where they are good
ZoomDflt:
        :: CHECKMENU PPAR>ZPAR ERRSET            * 48161
          :: INDEPVAR ~RclDepnd;1get(li)? GETPTYPE ; ERRTRAP * 48175
          :: ERRORCLR DropSysObs ID_X ID_Y 'IDFUNCTION ; MAKEPVARS DROP * 48193
          PUTPTYPE depnd(gn) PUTINDEP ERASE&DRAW ; * 481C0

* refs (1): 4D6F0
* -> : BOXZ: cursor down, redrawing the rubber band
BoxCursDown:
        :: OBJ_4DCC6 WINDOWBOT? IT WINDOWDOWN    * 481D9
          ~8GETLAM;7GETLAM DUP 13GETLAM #= 3UNROLL CursCorner 7GETLAM * 481F2
          13GETLAM !#1+IF<dim-1 BoxCursOff ?SKIP BoxRowUp? * 48215
          BoxCursOn ;                            * 4822E

* refs (1): 4D3D5
* -> : BOXZ: cursor up, redrawing the rubber band
BoxCursUp:
        :: OBJ_4DCC6 WINDOWTOP? IT WINDOWUP      * 48238
          ~8GETLAM;7GETLAM DUP#0= 3UNROLL CursCorner 7GETLAM !#1-IF>0 * 48251
          BoxCursOff ?SKIP BoxRowDown?           * 4826F
          BoxCursOn ;                            * 4827E

* refs (1): 0C938
* #x #y -> : BOXZ: take down the present mark before the box starts
BoxClrMark:
        :: EQCURSOR? case2drop                   * 48288
          :: 11GETLAM 4PUTLAM %0_2A2B4 TOTEMPOB 1PUTLAM CROSS_OFF * 48297
            CROSS_HAIRS ;                        * 482BA
          CROSS_OFF PREMARKON CROSS_HAIRS ;      * 482C4

* refs (1): 4830A
* -> flag: TRUE if the box has no height or no width (cursor in line with the anchor, lams 2 and 12)
BoxFlat?:
        :: 2GETLAM 8GETLAM #= 12GETLAM 7GETLAM #= OR ; * 482D8

* refs (2): 0C906 8D214
* -> : BOXZ: invert the outline of the rubber band box (draw or erase) with the crosshair off
BoxToggle:
        :: BoxFlat? case                         * 48305
          :: CROSS_OFF 2GETLAM 12GETLAM ~8GETLAM;7GETLAM TOGGLELINE#3 * 48314
            CROSS_HAIRS ;                        * 48332
          CROSS_OFF 2GETLAM 12GETLAM 8GETLAM DUP 4PICK #> ITE #1- #1+ * 4833C
          OVER TOGGLELINE#3 8GETLAM 12GETLAM OVER 7GETLAM 3PICKOVER #< ITE * 4836E
          #1- #1+                                * 4839B
          TOGGLELINE#3 ~8GETLAM;7GETLAM 2GETLAM 3PICKOVER #< ITE #1- #1+ * 483A5
          OVER TOGGLELINE#3 2GETLAM 7GETLAM OVER 12GETLAM 3PICKOVER #< ITE * 483CD
          #1- #1+                                * 483FA
          TOGGLELINE#3 CROSS_HAIRS ;             * 48404

        :: #1=case BoxCursRight                  * 48413
          BoxCursLeft ;                          * 48422

* refs (2): 4841D 4D5EC
* -> : BOXZ: cursor right, redrawing the rubber band
BoxCursRight:
        :: OBJ_4DCC6 WINDOWRIGHT? IT WINDOWRIGHT * 4842C
          ~8GETLAM;7GETLAM OVER 14GETLAM #= 3UNROLL CursCorner 8GETLAM * 48445
          14GETLAM !#1+IF<dim-1                  * 48468

* refs (3): 4821F 4826F 4885A
* ... -> ...: BOXZ: restore what was under the crosshair before a move
BoxCursOff:
          :: ~8GETLAM;7GETLAM CROSSGROB OBJ_4DEB3 4GETLAM GBUFF BINT11 ROLL * 48472
            BINT11 ROLL GROB! 8ROLL ;            * 4849A
          ?SKIP BoxColLeft?                      * 484B3

* refs (3): 4822E 4827E 48869
* ... -> : BOXZ: save what is under the crosshair at its new place and draw it (flag -32 picks the colour)
BoxCursOn:
          :: GBUFF 5UNROLL SUBGROB DUP4PUTLAM TOTEMPOB 4ROLL * 484BD
            ~BINT32;TestSysFlag OBJ_4DF67 GBUFF 2SWAP GROB! ; * 484E0
        ;                                        * 484FE

* refs (1): 48229
* -> : BOXZ: the cursor moved down: if it is below the anchor, update the band for the row above
BoxRowUp?:
        :: 7GETLAM 12GETLAM #> BoxRowAbove ;     * 48503

* refs (1): 48517
* -> : BOXZ: rubber band for the row above the cursor
BoxRowAbove:
        :: 7GETLAM BINT1 #-Floor0 BoxEdgeH ;     * 48521

* refs (1): 48279
* -> : BOXZ: the cursor moved up: if it is above the anchor, update the band for the row below
BoxRowDown?:
        :: 7GETLAM 12GETLAM #< BoxRowBelow ;     * 4853F

* refs (1): 484B8
* -> : BOXZ: as BoxRowUp?, for columns
BoxColLeft?:
        :: 8GETLAM 2GETLAM #> BoxColLeft ;       * 4855D

* refs (1): 48571
* -> : BOXZ: rubber band for the column left of the cursor
BoxColLeft:
        :: 8GETLAM BINT1 #-Floor0 BoxEdgeV ;     * 4857B

* refs (1): 48864
* -> : BOXZ: as BoxRowDown?, for columns
BoxColRight?:
        :: 8GETLAM 2GETLAM #< BoxColRight ;      * 48599

* refs (1): 485AD
* -> : BOXZ: rubber band for the column right of the cursor
BoxColRight:
        :: 8GETLAM #1+ BoxEdgeV ;                * 485B7

* refs (2): 4858F 485C6
* flag #col -> : BOXZ: toggle the strokes that change when the box width changes by one column
BoxEdgeV:
        :: 12GETLAM 7GETLAM #Apart? NOT 5PICK AND ITE 3DROP * 485D0
          :: 4PICK IT                            * 485FD
            :: SWAP #1+ SWAP #1- ;               * 4860C
            3PICKSWAP OVER 2GETLAM #= case 4DROP * 4862A
            TOGGLELINE#3 ;                       * 48648
          12GETLAM 7GETLAM #Apart? NOT 4PICK NOT AND case 3DROP * 48652
          8GETLAM 3UNROLL 3PICKSWAP 5ROLL ?SKIP  * 4867F
          :: ROT #1+ 3UNROLL #1- ;               * 48698
          OVER 2GETLAM #= case 4DROP             * 486B6
          TOGGLELINE#3 ;                         * 486CF

* refs (2): 4743B 48535
* flag #row -> : BOXZ: toggle the strokes that change when the box height changes by one row
BoxEdgeH:
        :: 2GETLAM 8GETLAM #Apart? NOT 5PICK AND ITE 3DROP * 486D9
          :: 4PICK IT                            * 48706
            :: SWAP #1+ SWAP #1- ;               * 48715
            3UNROLL SWAPROT OVER DUP 12GETLAM #= case 4DROP * 48733
            TOGGLELINE#3 ;                       * 4875B
          2GETLAM 8GETLAM #Apart? NOT 4PICK NOT AND case 3DROP * 48765
          7GETLAM 3UNROLL 3PICKSWAP 5ROLL ?SKIP  * 48792
          :: ROT #1+ 3UNROLL #1- ;               * 487AB
          SWAP4ROLL 3UNROLL DUP 12GETLAM #= case 4DROP * 487C9
          TOGGLELINE#3 ;                         * 487EC

* refs (4): 485DF 4865C 486E8 4876F
* #a #b -> #lo #hi flag: put in order; TRUE if they differ by more than 1
#Apart?:
        :: 2DUP#> IT SWAP                        * 487F6
          2DUPSWAP #- #>1 ;                      * 4880A

* refs (2): 48422 4D4FC
* -> : BOXZ: cursor left, redrawing the rubber band
BoxCursLeft:
        :: OBJ_4DCC6 WINDOWLEFT? IT WINDOWLEFT   * 4881E
          ~8GETLAM;7GETLAM OVER #0= 3UNROLL CursCorner 8GETLAM !#1-IF>0 * 48837
          BoxCursOff ?SKIP BoxColRight?          * 4885A
          BoxCursOn ;                            * 48869

* refs (2): 47610 4D69B
* -> : show the current equation (lam 24 when tracing, else the first of EQ) for a moment
PictKeyEQ:
        :: TakeOver TraceMode? ITE ~BINT24;GETLAM;TRUE ~BINT1;GetEqN * 48873
          NOTcase DoBadKey                       * 48891
          ->StkStr22! ShowEqBriefly ;            * 4889B
        BSS     5                                * 488AA  zeros

* refs (1): 477F9
PlotScr*en~4:
        :: GDISPCENTER TURNMENUOFF PLOTPREP 2DROP 3UNROLL DUP TOTEMPOB * 488AF
          15PUTLAM 17PUTLAM 16PUTLAM %0_2A2B4 GetRes 4PUTLAM IndepUnit! * 488D7
          MakeIndep ERRSET                       * 488FA
          :: BINT2 LastPtArrays DROP ' 15GETLAM ' GETXPOS ' 1PUTLAM BINT1 * 48904
            GetEqN NOTcase ERRJMP                * 4893B
            DUP ALGeq? IT GETRHS                 * 4894A
            5ROLL #1= ITE                        * 4895E
            :: %0_2A2B4 SWAP ;                   * 4896D
            :: BINT2 GetEqN NOTcase ERRJMP       * 48981
              DUP ALGeq? IT GETRHS               * 4899A
            ;                                    * 489AE
            ' PlotEval BINT1 ' PlotScr*en~5 4ROLL ' PlotEval BINT2 ' * 489B3
            PlotScr*en~5 BINT11 ::N 2PUTLAM 19GETLAM TYPEEXT? ITE * 489E5
            PlotLoopUnit PlotLoop                * 48A08
          ;                                      * 48A12
          ERRTRAP PlotErrExit ~ATTNFLG@;#0=?SEMI;ExitAtLOOP ATTNFLGCLR * 48A17
          18GETLAM RESETDEPTH INDEPVAR ?PURGE_HERE GDISPCENTER GraphLoop ; * 48A2B

* refs (2): 489C7 489E5
PlotScr*en~5:
        :: SWAP DUPTYPEREAL? NOTcasedrop ClrLastPt * 48A4E
          GETYPOS 1GETLAM SWAP2DUP PIXON3 3PICK #2= NOTcase LastPt! * 48A67
          ROTDROP PlotScr*en~6 ;                 * 48A8F

* refs (1): 48A94
PlotScr*en~6:
        :: PlotScr*en~16 20GETLAM BINT1 PULLREALEL SWAPDROP %-1=case * 48A9E
          :: DROP BINT2 3UNROLL LastPt! ;        * 48AC1
          COERCE 21GETLAM BINT1 PULLREALEL SWAPDROP COERCE PlotScr*en~16 * 48ADF
          4PICK 4PICK DRAWLINE#3 BINT2 3UNROLL LastPt! ; * 48B02

* refs (7): 48D05 48D1E 48D2D 48D41 48D5A 48D6E ...
* -> : drop the temporary plot variables and make the independent variable again
PlotCleanup:
        :: PurgePlotVars MakeIndep ;             * 48B25

* refs (3): 497A3 49925 49981
* symb id guess -> %root ...: FCN: run the solver; on failure or ATTN show its message and leave the caller
FcnSolve:
        :: SYMBNUMSOLVE NOTcase                  * 48B39
          :: 2RDROP JstGetTHEMESG ~DispCoord1;BINT2;16PUTLAM ; * 48B48
          ATTN# OVER #= case                     * 48B61
          :: SWAPDROP 2RDROP GETTHEMESG ~DispCoord1;BINT2;16PUTLAM ; * 48B75
          RootZero OVER                          * 48B93
* The Very Big List names this address äline, but it is a pointer inside an object; the name is not used
          #= ITE DROPNULL$ GETTHEMESG            * 48B9D
          SWAP ;                                 * 48BB1

* refs (3): 200FD 48FBD B7EE6
* -> symb: the current regression model as an expression in X, with slope and intercept from STATLR
StatFitEq:
        :: STATLR ChkReakäPAR 5UNROLL 4DROP ' xLINFIT EQcasedrop * 48BBB
          :: 'IDX 'x* ' x+ BINT5 SYMBN ;         * 48BE3
          ' xLOGFIT EQcasedrop                   * 48C0B
          :: 'IDX ' xLN 'x* ' x+ BINT6 SYMBN ;   * 48C1A
          ' xEXPFIT EQ case                      * 48C4C
          :: 'IDX 'x* ' xEXP 'x* BINT6 SYMBN ;   * 48C60
          'IDX SWAP ' x^ ' x* BINT5 SYMBN ;      * 48C8D

* refs (3): 4997C 49B5F 49B9B
* -> id %x: FCN: independent variable and the cursor's x, with the variable's units, as a first guess
FcnGuess:
        :: INDEPVAR OBJ_73DFC TOTEMPOB 15GETLAM OVER NEWINDEP 19GETLAM * 48CBA
          DUPTYPEEXT? NOTcaseDROP UM>U           * 48CE2
        ;                                        * 48CF1
        BSS     5                                * 48CF6  zeros

* refs (1): 474AB
PlotScr*en~7:
        :: CHECKMENU PlotCleanup ERRSET PlotScr*en~11 ERRTRAP * 48CFB

* refs (2): 48D55 48D82
* FCN: the ERRTRAP arm: tidy up the plot variables and carry the error on
FcnErrArm:
          :: PlotCleanup ERRJMP ; PlotCleanup ;  * 48D19

* refs (1): 474CE
PlotScr*en~8:
        :: CHECKMENU PlotCleanup ERRSET PlotScr*en~13 ERRTRAP FcnErrArm * 48D37
          PlotCleanup ;                          * 48D5A

* refs (1): 47556
PlotScr*en~9:
        :: CHECKMENU PlotCleanup ERRSET PlotScr*en~14 ERRTRAP FcnErrArm * 48D64
          PlotCleanup ;                          * 48D87
        BSS     1                                * 48D91  zeros

* refs (1): 491DA
AUTOSCALE~1:
        :: GETPTYPE BINT17 PTYPE>PINFO case EVAL * 48D92
          :: AutoInit AutoSample 2DROP ; ;       * 48DB0

* refs (2): 8CB30 8CC6E
* -> : AUTOSCALE for POLAR and PARAMETRIC: sample the equation to get the x and y ranges
AutoScaleEq:
        :: AutoInit ' AutoPoint 8PUTLAM AutoSample DUP TYPEBINT? * 48DCE
* The Very Big List names this address ScaleY=ScaleX, but it is a pointer inside an object; the name is not used
          case2DROP AutoWiden                    * 48DF6
          xrng(2r) ;                             * 48E00

* refs (1): 8C9EC
* -> : AUTOSCALE for CONIC: make the scales equal
AutoScaleSq:
        :: GETSCALE DROP DUP PUTSCALE ;          * 48E0A

* refs (1): 8CE27
* -> : AUTOSCALE for SCATTER: the ranges of the two ΣDAT columns
AutoScaleScatter:
        ::                                       * 48E28

* refs (2): 48E91 48ED2
* -> [] #xcol #ycol: ΣDAT and its columns from ΣPAR
RclΣCols:
          :: rclä ChkReakäPAR 3DROP COERCE2 ;    * 48E2D

* refs (1): 200E2
xSCLSIGMA~1:
          :: ROT ChkStatCols DUP 4ROLL MinMaxCol(ra,s) AutoWiden xrng(2r) * 48E4B
            SWAP MinMaxCol(ra,s) AutoSetY ;      * 48E73
        ;                                        * 48E87

* refs (1): 8CF15
* -> : AUTOSCALE for HISTOGRAM: x from the data column, then y
AutoScaleHist:
        :: RclΣCols DROP DUPROT ChkStatCols SWAPDROPSWAP MinMaxCol(ra,s) * 48E8C
          AutoWiden xrng(2r) %0_2A2B4 STATN AutoMargin ; * 48EAF

* refs (1): 8CFE5
* -> : AUTOSCALE for BAR: y from the data, including 0
AutoScaleBar:
        :: RclΣCols %0_2A2B4 PUTRES %0_2A2B4 STATN xrng(2r) DROP * 48ECD
          MinMaxCol(ra,s) 2DUP %= ITE DROP%0b    * 48EF5
          :: DUP %0< casedrop %0_2A2B4           * 48F0E
            SWAPDUP %0> NOT?SEMI                 * 48F27
            DROP%0b ;                            * 48F36
          AutoSetY ;                             * 48F40

* refs (1): 48DDD
* ob -> : AUTOSCALE: fold one sample into the x range, by plot type (complex for parametric, polar otherwise)
AutoPoint:
        :: GETPTYPE 'IDPARAMETER EQITE           * 48F4A
          :: DUP TYPECMP? case C%>%              * 48F5E
            %0_2A2B4 ;                           * 48F77
          :: 2GETLAM %POL>%REC ; 6GETLAM 7GETLAM 4ROLL AutoMinMax 7PUTLAM * 48F81
          6PUTLAM ;                              * 48FAE

* refs (1): 0C7BC
* -> : ΣLINE drawing: make the fit equation the EQ, as a FUNCTION of X, and draw
PlotStatFit:
        :: StatFitEq DOSTOE 'IDFUNCTION PUTPTYPE %1 'IDX DUP PUTINDEP * 48FB8
          XEQSTOID EXITFCNsto AxesAndDraw ;      * 48FE5

* ->
* refs (2): 46A13 4A005
SORTASLOW:
        :: BINT5 ONE_DO VERYSLOW LOOP ;          * 48FF9
