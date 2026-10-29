* HP 48GX ROM revision R, #46007-#49016: Plotting
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: Π'SAVEDDEPTH xrng(2r) yrng(2r) STOAPPLDATA 'IDX dup;Vector*­Rcl(nm)? APPprompt1! Trceq SORTASLOW indep(2r) PlotScr*en FastCat?
* Follows on from the previous file (at #46007 in the original ROM).
        RPL

* refs (1): 3C51B
OBJ_46007:
        :: MenuRow@ #1=case OBJ_46034            * 46007
          MenuRow@ BINT7 #=case OBJ_4A678        * 4601B
        ;                                        * 4602F

* refs (1): 46016
OBJ_46034:
        :: ROMPTR 0B5 08C 5DROP BINT9 ROLL BINT10 ROLL * 46034

_Xvol:_:
          $ "Xvol:" OBJ_4A834 DISPROW3 7ROLL 8ROLL * 4605D

_Yvol:_:
          $ "Yvol:" OBJ_4A834 DISPROW4 5ROLL 6ROLL * 46085

_Zvol:_:
          $ "Zvol:" OBJ_4A834 DISPROW5 ROT 4ROLL * 460AD

_Xrng:__460D5:
          $ "Xrng:" OBJ_4A834 DISPROW6 SWAP      * 460D5

_Yrng:__460F8:
          $ "Yrng:" OBJ_4A834 DISPROW7 SetDA2OKTemp ; * 460F8

* refs (2): 4A83E 4A857
OBJ_46120:
        :: BINT8 OBJ_45D2A BINT8 OBJ_45E6F ;     * 46120

* refs (3): 4A4FF 4A5D1 4A73C
OBJ_4613E:
        :: SWAP DECOMP&$ ;                       * 4613E

* refs (3): 20F94 4B20B 4F386
OBJ_46152:
        :: '                                     * 46152

Π'PlotEnv:
          LAM 'PlotEnv DRPExitAtLOOP NOT?SEMI    * 4615C
          BINT9 ERROROUT ;                       * 4617D

* refs (1): 4B4E1
OBJ_4618C:
        :: OBJ_6F595                             * 4618C
L_46196:
          #1= TRUE OBJ_6F621 NOTcase OBJ_6F608   * 46196
          OBJ_6F883 OBJ_678D6 OBJ_679D7 GOTO L_46196 ; * 461AF

* refs (2): 6B482 6F59F
OBJ_461CD:
        :: TakeOver                              * 461CD

* refs (1): 6C433
OBJ_461D7:
          :: ' OBJ_6A992 ; DUP MenuDef@ EQ caseDROP InitMenu * 461D7
          DispMenu ;                             * 46204

* refs (2): C0577 C066B
OBJ_4620E:
        :: 15GETLAM DUP 21GETLAM                 * 4620E

Π'dependvar_46222:
          LAM 'dependvar                         * 46222

Π'vstp:
          LAM 'vstp 6ROLL                        * 4623D
          :: OBJ_45BE8                           * 46253
            :: 3DROP RDROP ;                     * 4625D
            :: ROT %CHS 3UNROLL ;                * 46271
            :: 2DROP %- RDROP ; %CHS ROTDROP 'EvalNoCK:_sup xSTO- ; * 4628A
          OBJ_4588E ;                            * 462BC

* refs (1): C0483
OBJ_462C6:
        :: DUP OBJ_45CC2 ?SKIP                   * 462C6
          :: ROMPTR 0F1 018                      * 462DA

Π'dependvar_462EA:
            LAM 'dependvar                       * 462EA

Π'Ystp_46305:
            LAM 'Ystp ROT #3= IT %CHS            * 46305
            'EvalNoCK:_sup xSTO+ BINT0 ;         * 4632A
          OBJ_73C12 ;                            * 4633E
        FILLTO  #46378                           * 46348  48 zero nibbles: the next entry stays at #46378

* refs (1): 40BCE
AtUserStack~1:
        :: CK0NOLASTWD 0LASTOWDOB! ;             * 46378

* refs (1): 4D290
OBJ_4638C:
        :: BINT23 PUTLAM ;                       * 4638C

        :: BINT24 PUTLAM ;                       * 463A0

* refs (2): 44B09 44B91
OBJ_463B4:
        ::                                       * 463B4
          { BINT9 BINT10 BINT31 BINT32 BINT33 BINT36 BINT37 BINT41 BINT43 } * 463B9
          NTHOF #0=case FALSE                    * 463F0
          'DoBadKeyT ;                           * 463FF

CopyRowsUp:
        ROMPTR 0EA 057                           * 46409
        FILLTO  #4651C                           * 46414  264 zero nibbles: the next entry stays at #4651C

* refs (1): 8F396
CopyColsLeft:
        ROMPTR 0EA 059                           * 4651C

* refs (1): 45132
OBJ_46527:
        :: DUPTYPECSTR? case                     * 46527
          :: OVER TYPECSTR? NcaseTYPEERR BINT5   * 46536
            PPAR(s);dup;li? NOTcase              * 4654F
            :: 3UNROLL BINT3 {}N ;               * 46559
            ROTSWAP INNERCOMP pshzer DUP ZERO_DO #1-SWAP DUPTYPECSTR? ITE * 46572
            DROP psh1&rev                        * 4659A
            LOOP DROP #2+ reversym {}N ;         * 465A4
          OVER TYPECMP? NcaseTYPEERR DUP         * 465C2
          OBJ_4C64D NcaseTYPEERR BINT2           * 465D6
          {}N ;                                  * 465E5
        FILLTO  #46625                           * 465EF  54 zero nibbles: the next entry stays at #46625

* refs (1): 8F460
CopyRowsDown:
        ROMPTR 0EA 05B                           * 46625
        FILLTO  #4677E                           * 46630  334 zero nibbles: the next entry stays at #4677E

* refs (1): 8F502
CopyColsRght:
        ROMPTR 0EA 05E                           * 4677E

* refs (2): 4527C 454A7
drax~1~2:
        :: DUPTYPELIST? NOTcasedrop              * 46789
          :: BINT10 BINT10 ;                     * 46798
          CDRCOMP INNERCOMP #2= case2drop        * 467AC
          :: BINT10 BINT10 ;                     * 467C0
          DUPTYPECSTR? IT 2DROP                  * 467D4
          DUPTYPELIST? ITE INCOMPDROP DUP        * 467E3
          DUPTYPEREAL? ?SEMI                     * 467F7
          HXS># SWAP HXS># SWAP ;                * 46801

* refs (2): 4E898 B615C
OBJ_4681A:
        :: RclAx*s DUPTYPELIST? NOTcasedrop FALSE * 4681A
          INNERCOMP BINT2 #=casedrop 2DROPFALSE  * 46833
          BINT4 #= IT ROTDROP                    * 46847
          ROTDROP TRUE ;                         * 4685B

* refs (5): 73A53 73AA8 73DAC 73E1F 8C690
OBJ_4686A:
        :: OBJ_46888 SWAP RIGHT$3x6 SWAPDROP ;   * 4686A

* refs (1): 4686F
OBJ_46888:
        :: SWAPDUP BINT0 !DcompWidth 1stkdecomp$w DUPLEN$ 4ROLL #<case * 46888
          SWAPDROP                               * 468B0
          DROP savefmt1 ERRSET                   * 468B5
          :: BINT2 DOSCI 1stkdecomp$w ; ERRTRAP ederr rstfmt1 ; * 468C4

* refs (6): 0C6A4 0C717 458B6 46C25 46C89 73D20
OBJ_468F1:
        :: BINT25 PUTLAM ;                       * 468F1

* refs (2): 7396D 739C7
OBJ_46905:
        :: EQUATION NOTcase ERRJMP               * 46905
          DUPTYPELIST? NOTcasedrop               * 46919
          :: BINT1 OBJ_4BABC ;                   * 46923
          LENCOMP ;                              * 46937

* refs (2): 46C39 46C98
OBJ_46941:
        :: Message60E FlashMsg ;                 * 46941

* refs (6): 0C681 0C703 45893 47768 47795 73CFD
OBJ_46955:
        :: NEWINDEP BINT24 GETLAM ERRSET EVALCRUNCH ERRTRAP * 46955
          :: ERROR@ # 100 #/ SWAPDROP BINT3 #<>case ERRJMP * 46978
            ERRORCLR Π'SAVEDDEPTH DEPTH #1-SWAP OBJ_6C339 NDROP FALSE RDROP ; * 469A5
          0LASTOWDOB! CK1NOLASTWD U>nbr TRUE ;   * 469D2
        BSS     20                               * 469EB

* refs (1): 488A0
OBJ_469FF:
        :: Save16 SWAP DISPSTATUS2 SORTASLOW REPEATER BINT17 NOP REPEATER * 469FF
          BINT5 NOP Restore16 ;                  * 46A2C

* refs (1): 7347C
OBJ_46A40:
        :: NoExitAction                          * 46A40

{MenuGRAPH\EDIT}:
          { {GRAPH\DOT+} {GRAPH\DOT-} {GRAPH\LINE} {GRAPH\TLINE} {GRAPH\BOX} * 46A4A
            {GRAPH\CIRCLE} {GRAPH\MARK} {GRAPH\+/-} {GRAPH\LABEL} * 46A68
            {GRAPH\DEL}                          * 46A7C

{GRAPH\ERASE}:
            {                                    * 46A81

_ERASE_:
              $ "ERASE"                          * 46A86
              :: CHECKMENU OBJ_4576C ; }         * 46A9A

{GRAPH\MENU}:
            {                                    * 46AB3

_MENU_:
              $ "MENU" MENUOFF }                 * 46AB8
            {GRAPH\SUä} {GRAPH\REPL}             * 46AD4

{GRAPH\PICT->}:
            {                                    * 46ADE

_PICT->_:
              $ "PICT→"                          * 46AE3
              :: CHECKMENU OBJ_45681 ; }         * 46AF7

{GRAPH\X,Y->}:
            {                                    * 46B10

_X,Y->_:
              $ "X,Y→"                           * 46B15
              :: CHECKMENU OBJ_73AEE ; }         * 46B27
            OBJ_456C2 OBJ_47D0D }                * 46B40
        ;                                        * 46B4F

* refs (2): 4A88D 8D17F
OBJ_46B54:
        :: BINT8 BINT50 MAKEGROB                 * 46B54

{'PlotEnv}:
          {                                      * 46B68

Π'PlotEnv_46B6D:
            LAM 'PlotEnv }                       * 46B6D
          BIND BINT27 ' nohalt CACHE ;           * 46B89

* refs (2): 4CE8D 4D2D1
OBJ_46BA7:
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
OBJ_46C1B:
        :: PTR NULL:: OBJ_468F1 7GETLAM OBJ_5102B ?SEMI * 46C1B
          OBJ_46941 ;                            * 46C39

* refs (3): 0C6B3 0C73A 458C0
OBJ_46C43:
        :: OBJ_46D24 SWAP OBJ_46CCA CROSS_OFF TOTEMPSWAP TOTEMPSWAP 8PUTLAM * 46C43
          7PUTLAM CROSS_HAIRS ;                  * 46C6B

* refs (4): 0C721 0C730 4589D 458AC
OBJ_46C7A:
        :: RECORDX&YC% PTR NULL:: OBJ_468F1 OBJ_5102B ?SEMI * 46C7A
          OBJ_46941 ;                            * 46C98

* refs (1): 472AE
OBJ_46CA2:
        :: CROSS_HAIRS OBJ_4E68B OBJ_73657 ?SEMI * 46CA2
          CROSS_OFF OBJ_4703F ;                  * 46CBB

* refs (1): 46C52
OBJ_46CCA:
        :: 6GETLAM 10GETLAM getxpos SWAP #1=?SKIP DROPZERO LEFTCOL 2DUP#< IT * 46CCA
          SWAP                                   * 46CFC
          DROP RIGHTCOL 2DUP#> IT SWAP           * 46D01
          DROP ;                                 * 46D1A

* refs (2): 46C48 73D25
OBJ_46D24:
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
        NIBHEX  00000                            * 46DF1  ..

* refs (2): 736B6 736E3
OBJ_46DF6:
        :: OBJ_4DCC6 BINT2 OBJ_735CB ;           * 46DF6

* refs (2): 73701 7372E
OBJ_46E0F:
        :: OBJ_4DCC6 BINT1 OBJ_735CB ;           * 46E0F

* refs (12): 4D3CB 4D3EE 4D402 4D4F2 4D515 4D529 ...
OBJ_46E28:
        :: TakeOver 'R'R OBJ_5102B IT            * 46E28
          :: ROT BINT2 ::N ;                     * 46E41
          DUP EVAL OBJ_5102B IT                  * 46E5A
          :: ROT EVAL ;                          * 46E6E
          OVER REPKEY? NOTcase2DROP BEGIN        * 46E82
          2DUPSWAP REPKEY? WHILE                 * 46E96
          ::                                     * 46EA5
            :: OBJ_4DCC6 EVAL ; ;                * 46EAA
          REPEAT 3DROP ;                         * 46EC3

        :: TakeOver OBJ_5102B IT                 * 46ED2
          :: ROT BINT2 ::N ;                     * 46EE6
          DUP EVAL OBJ_5102B IT                  * 46EFF
          :: ROT EVAL ;                          * 46F13
          OVER REPKEY? NOTcase2DROP BEGIN        * 46F27
          2DUPSWAP REPKEY? WHILE                 * 46F3B
          ::                                     * 46F4A
            :: OBJ_4DCC6 EVAL ; ;                * 46F4F
          REPEAT 3DROP ;                         * 46F68

        :: TakeOver 'R'R OBJ_5102B IT            * 46F77
          :: ROT BINT2 ::N ;                     * 46F90
          DUP EVAL OBJ_5102B IT                  * 46FA9
          :: ROT EVAL ;                          * 46FBD
          OVER REPKEY? NOTcase2DROP BEGIN        * 46FD1
          2DUPSWAP REPKEY? WHILE                 * 46FE5
          ::                                     * 46FF4
            :: OBJ_4DCC6 EVAL ; ;                * 46FF9
          REPEAT 3DROP ;                         * 47012

* refs (2): 4D36C 4D687
OBJ_47021:
        :: OBJ_4DB45 OBJ_4E68B OBJ_73657 ?SEMI   * 47021
          CROSS_OFF                              * 4703A

* refs (5): 46CC0 470DF 4710C 4D42F 4D74F
OBJ_4703F:
          :: OBJ_73643 case OBJ_4DB8B            * 4703F
            OBJ_4DB63 ;                          * 47053
        ;                                        * 4705D

        :: ' OBJ_47236 TraceMode? ITE            * 47062
          :: '                                   * 4707B
            :: OBJ_47209 OBJ_47236 ; ;           * 47085
          :: ' OBJ_47209 ;                       * 4709E
        ;                                        * 470B2

* refs (4): 4D623 738B4 7390E 73940
OBJ_470B7:
        :: WINDOWRIGHT? IT WINDOWRIGHT           * 470B7
          CROSS_OFF 8GETLAM 14GETLAM !#1+IF<dim-1 OBJ_4703F ; * 470CB

* refs (4): 0C834 0C88E 0C8C0 4D533
OBJ_470E9:
        :: WINDOWLEFT? IT WINDOWLEFT             * 470E9
          CROSS_OFF 8GETLAM !#1-IF>0 OBJ_4703F ; * 470FD

* refs (2): 8C835 8CA34
OBJ_47116:
        :: BINT1 16PUTLAM OBJ_471B1 $>grob HARDBUFF2 BINT0 BINT2 GROB! * 47116
          $>grob HARDBUFF2 # 41 BINT2 GROB! OBJ_47209 OBJ_47236 ; * 47143

* refs (1): 8CB78
OBJ_47170:
        :: BINT1 16PUTLAM OBJ_471B1 $>grob HARDBUFF2 BINT0 BINT2 GROB! DROP * 47170
          OBJ_47209 OBJ_47236 ;                  * 471A2

* refs (2): 47125 4717F
OBJ_471B1:
        :: OBJ_4D96B ID>$ ONEONE SUB$ $ ": " &$ INDEPVAR ID>$ ONEONE SUB$ * 471B1
          $ ": " &$ ;                            * 471F1

* refs (18): 0C7FD 0C848 0C8C5 4708A 470A8 47161 ...
* Probably: PICTURE: redraw the X field of the coordinate readout
OBJ_47209:
        :: TraceMode? NOTcase OBJ_73DE8          * 47209
          BINT26 GETLAM CARCOMP EVAL ;           * 4721D

* refs (10): 0C807 0C84D 4706C 4708F 47166 471A7 ...
OBJ_47236:
        :: TraceMode? NOTcase OBJ_73A8F          * 47236
          BINT26 GETLAM BINT2 NTHCOMPDROP EVAL ; * 4724A

* refs (2): 45BD9 73837
OBJ_47268:
        :: BINT0 OBJ_735CB OBJ_5102B NOT?SEMI    * 47268
          OBJ_73B61 ;                            * 47281

* refs (2): 4D493 4D592
OBJ_4728B:
        :: TraceMode? case DoBadKey              * 4728B
          CROSS_OFF TOTEMPOB 8PUTLAM OBJ_46CA2 ; * 4729F

* refs (7): 45A07 8A68D 8B2F2 8B584 8B986 8C0DC ...
OBJ_472B8:
        :: 'R EVAL ERRJMP ;                      * 472B8

* refs (6): 4B61B 4F723 4F7EB 4FA16 4FBC9 50479
OBJ_472D1:
        :: 3PICK GROBDIM ;                       * 472D1
        FILLTO  #4735A                           * 472E5  117 zero nibbles: the next entry stays at #4735A

* refs (11): 1574E 2C2A2 473F0 47C86 496B9 4AA46 ...
OBJ_4735A:
        :: dup;Vector*­Rcl(nm)? DUP case ROTDROP * 4735A
          SWAPDROP ;                             * 47373

* refs (4): 2C257 4735F 4746C 47876
dup;Vector*­Rcl(nm)?:
        :: dup;RclInVars(gn)? NOTcaseFALSE OVER  * 4737D
          'EQ EQUALcase                          * 47391
          :: OBJ_473E6 OVER EQUALcase TRUE       * 4739B
            GOTO L_473C3 ;                       * 473B4
L_473C3:
          DUPTYPEIDNT? NOTcaseTRUE DUPSAFE@      * 473C3
          IT ROTDROP                             * 473D2
          TRUE ;                                 * 473DC

* refs (3): 15398 473A0 478D5
OBJ_473E6:
        :: 'IDPAR OBJ_4735A NOTcase 'IDX         * 473E6
          DUPTYPELIST? NOTcasedrop 'IDX          * 473FF
          BINT3 NTHELCOMP NOTcase 'IDX           * 4740E
          1get(li)? ;                            * 47422

* refs (1): 48553
OBJ_4742C:
        :: 7GETLAM #1+ OBJ_486D9 ;               * 4742C

* refs (3): 0DCD1 0DD99 0DE52
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
              $ "ROOT" PlotScr*en~3 }            * 47499

{FCN\ISECT}:
            {                                    * 474B5

_ISECT_:
              $ "ISECT" PlotScr*en~4 }           * 474BA

{FCN\SLOPE}:
            {                                    * 474D8

_SLOPE_:
              $ "SLOPE" PlotScr*en~6 }           * 474DD

{FCN\AREA}:
            {                                    * 474FB

_AREA__47500:
              $ "AREA" PlotScr*en~7 }            * 47500

{FCN\SHADE}:
            {                                    * 4751C

_SHADE_:
              $ "SHADE" PlotScr*en~2 }           * 47521

{FCN\EXTR}:
            {                                    * 4753F

_EXTR_:
              $ "EXTR" PlotScr*en~5 }            * 47544

{FCN\F(X)}:
            {                                    * 47560

_F(X)_:
              $ "F(X)" PlotScr*en~8 }            * 47565

{FCN\F'}:
            {                                    * 47581

_F'_:
              $ "F'" PlotScr*en~9 }              * 47586

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
              :: CHECKMENU OBJ_48873 ; }         * 47606
            OBJ_47D0D }                          * 4761F
        ;                                        * 47629

* refs (1): 475B5
PlotScr*en~1:
        :: CHECKMENU OBJ_49B4B 2DROP CRUNCHNoBlame DUPTYPEREAL? NOTcasedrop * 4762E
          ERRJMP                                 * 47651
          OBJ_49B4B CkEQUtil PointDerivUt ZEROZERO ROT OBJ_49E3E ROTROT2DROP * 47656
          OBJ_4D96B SWAP INDEPVAR 8GETLAM OBJ_4782B 3PICK %* 5ROLL SWAP %- ' * 47679
          x* SWAP BINT5 meta+ DROP ' x= BINT7 SYMBN DUP GETRHS BINT24 PUTLAM * 476B0

_TanLine_:
          $ "TanLine" >TAG Π'SAVEDDEPTH #1+ ' Π'SAVEDDEPTH STO AtUserStack * 476F1
          DUP OBJ_49D3A                          * 4772C

* refs (2): 47781 477A4
OBJ_47736:
          :: GETINDEP GETPMIN&MAX OBJ_4A8F1 %MAXorder SWAP ; DROP 15GETLAM * 47736
          SWAP OBJ_46955 NOTcase ERRJMP          * 47763
          BINT28 PUTLAM OBJ_47736 SWAPDROP 15GETLAM SWAP OBJ_46955 NOTcase * 47777
          ERRJMP                                 * 4779F
          OBJ_47736 ROT %>C% SWAP BINT28 GETLAM %>C% CROSSMARKOFF line(2c) * 477A4
          CROSSMARKON ;                          * 477D1

* refs (1): 47535
PlotScr*en~2:
        :: CHECKMENU OBJ_4579E 2DROP PlotScr*en~2~1 ' PlotScr*en~2~2 BINT3 * 477DB
          ::N ' ExitFcn STO ;                    * 47803

* refs (1): 477EF
PlotScr*en~2~1:
        :: OBJ_73DFC 1GETLAM                     * 4781C

* refs (4): 4768D 4981E 73C85 73E06
OBJ_4782B:
          :: UNCOERCE%% 6GETLAM %%- 10GETLAM %%/>% ; %MAXorder ; * 4782B

* refs (5): 49030 49B55 49B82 4B751 4BAC6
OBJ_47858:
        :: DUP ALGeq? ;                          * 47858

* refs (3): 15278 153CA 49D35
Trceq:
        :: 'EQ dup;Vector*­Rcl(nm)? NOT?SEMI     * 4786C
          DUP EqList? NOTcase                    * 47880

* refs (1): 478F3
OBJ_4788F:
          :: SWAP FastCat? NOTcase ID>TAG        * 4788F
            'EQ EQcase ID>TAG                    * 478A8
            SWAPDROP ;                           * 478B7
          SWAPDROP CARCOMP DUPTYPEIDNT? NOT?SEMI * 478C1
          OBJ_473E6 OVER EQUAL ?SEMI             * 478D5
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
OBJ_4794D:
        # 61F                                    * 4794D  1567

        # 620                                    * 47957  1568

        # 621                                    * 47961  1569

* refs (1): 20281
xBESTFIT~1:
        # 605                                    * 4796B  1541

* refs (1): 15282
1FrDisp(st):
        :: OBJ_479D4 caseDROP                    * 47975

* refs (4): 15586 15617 15680 9EF0A
APPprompt1!:
          :: 1FrDisp(st)~1 DISPROW1 DispStsBound ; * 47984
          SetDA1Valid ;                          * 4799D

* refs (1): 99252
APPprompt2:
        :: OBJ_479D4 case2DROP                   * 479A7

1&2FrDisp(st):
          :: DISPROW1 DISPROW2 SetDA1Valid ;     * 479B6
        ;                                        * 479CF

* refs (4): 15269 220FB 4797A 479AC
OBJ_479D4:
        :: PrgmEntry? AppMode? OR OBJ_6DE82 OR EditLExists? OR BINT58 * 479D4
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
        :: BINT59 TestSysFlag ;                  * 47AB0

* refs (1): 47E19
OBJ_47AC4:
        :: CHECKMENU PPAR>ZPAR TRUE OBJ_47B00 ;  * 47AC4

* refs (1): 47E3A
OBJ_47AE2:
        :: CHECKMENU FALSE PPAR>ZPAR OBJ_47B00 ; * 47AE2

* refs (2): 47AD8 47AF6
OBJ_47B00:
        :: OBJ_47C6D 3PICKSWAP OBJ_47B6E VSCALE DROP OBJ_47B6E HSCALE DROP * 47B00
          OBJ_47BF5 ;                            * 47B2D

* refs (1): 47BFA
OBJ_47B37:
        :: OBJ_496A0 NOTcaseFALSE DROP           * 47B37
          ROTROT2DROP DUPTYPEREAL? NOTcasedrop FALSE * 47B4B
          %1 %= ;                                * 47B5F

* refs (4): 47B0F 47B1E 48102 4812A
OBJ_47B6E:
        :: %ABS DUP %0= IT                       * 47B6E
          :: DROP %MINREAL ;                     * 47B87
          DUP %1 %> 3PICK XOR ?SEMI              * 47B9B
          %1 SWAP %/ ;                           * 47BB9

* refs (1): 47E5B
OBJ_47BCD:
        :: CHECKMENU PPAR>ZPAR GETSCALE DROPDUP PUTSCALE OBJ_47BF5 ; * 47BCD

* refs (8): 47B2D 47BEB 47C63 4801C 48071 48111 ...
OBJ_47BF5:
        :: OBJ_47B37 IT                          * 47BF5
          :: RECORDX&YC% centr(c) ;              * 47C04
          OBJ_4DAA3 ;                            * 47C18

        :: CHECKMENU PPAR>ZPAR BINT131 MakeRange(s) BINT64 MakeRange(s) * 47C22
          ROTSWAP %>C% 3UNROLL %>C% pmin(c) pmax(c) OBJ_47BF5 ; * 47C45

* refs (3): 47B05 480F8 48120
OBJ_47C6D:
        :: '                                     * 47C6D

ZPAR:
          ID ZPAR OBJ_4735A NOTcase              * 47C77

* refs (3): 47CAE 47CD6 47D03
OBJ_47C90:
          :: %4 %4 ;                             * 47C90
          DUPTYPELIST? NOTcasedrop OBJ_47C90     * 47CA4
          INNERCOMP DUP BINT4 #= NOTcase         * 47CB3
          :: NDROP OBJ_47C90 ;                   * 47CCC
          3DROP DUPTYPEREAL? 3PICK TYPEREAL? AND ?SEMI * 47CE0
          2DROP OBJ_47C90 ;                      * 47CFE

* refs (3): 46B45 4761F 47FE5
OBJ_47D0D:
        {                                        * 47D0D
          ::                                     * 47D12
* The Very Big List names this address {PICT\}, but it is a pointer inside an object; the name is not used
            PTR DirLabel:                        * 47D17

PICT:
            $ "PICT" ;                           * 47D1C
          :: CHECKMENU BINT22 GETLAM InitMenu DispMenu ; } * 47D33

* refs (1): 47DCA
OBJ_47D5B:
        :: CHECKMENU DOCLLCD TOADISP CROSS_OFF ROMPTR 0B4 0D1 TOGDISP * 47D5B
          CROSS_HAIRS DispMenu ;                 * 47D84

* refs (2): 0C910 7334C
OBJ_47D93:
        :: NoExitAction                          * 47D93
          {                                      * 47D9D
            {                                    * 47DA2

{MenuGRAPH\ZOOM}:
              ::                                 * 47DA7
* The Very Big List names this address {ZOOM\ZFACT}, but it is a pointer inside an object; the name is not used
                PTR DirLabel:                    * 47DAC

ZFACT:
                $ "ZFACT" ;                      * 47DB1
              OBJ_47D5B }                        * 47DCA
            {                                    * 47DD4
              ::                                 * 47DD9
* The Very Big List names this address {ZOOM\BOXZ}, but it is a pointer inside an object; the name is not used
                PTR DirLabel:                    * 47DDE

BOXZ:
                $ "BOXZ" ;                       * 47DE3
              OBJ_0C924 }                        * 47DFA
            {                                    * 47E04

ZIN:
              $ "ZIN" OBJ_47AC4 }                * 47E09
            {                                    * 47E23

ZOUT:
              $ "ZOUT" OBJ_47AE2 }               * 47E28
            {                                    * 47E44

ZSQR:
              $ "ZSQR" OBJ_47BCD }               * 47E49
            {                                    * 47E65

ZDFLT:
              $ "ZDFLT" OBJ_48161 }              * 47E6A
            {                                    * 47E88

HZIN:
              $ "HZIN" OBJ_4807B }               * 47E8D
            {                                    * 47EA9

HZOUT:
              $ "HZOUT" OBJ_48099 }              * 47EAE
            {                                    * 47ECC

VZIN:
              $ "VZIN" OBJ_480B7 }               * 47ED1
            {                                    * 47EED

VZOUT:
              $ "VZOUT" OBJ_480D5 }              * 47EF2
            { $ "CNTR" OBJ_4E753 }               * 47F10
            {                                    * 47F31

ZAUTO:
              $ "ZAUTO" OBJ_48143 }              * 47F36
            { $ "ZDECI" OBJ_47FF4 }              * 47F54
            { $ "ZINTG" OBJ_4802B }              * 47F77
            { $ "ZTRIG" OBJ_48049 }              * 47F9A
            { $ "ZLAST" OBJ_4965A } OBJ_456C2 OBJ_47D0D } * 47FBD
        ;                                        * 47FEF

* refs (1): 47F6D
OBJ_47FF4:
        :: CHECKMENU PPAR>ZPAR %1                * 47FF4

* refs (1): 4803F
OBJ_48008:
          :: GETSCALE SWAPDROP PUTSCALE OBJ_47BF5 ; ; * 48008

* refs (1): 47F90
OBJ_4802B:
        :: CHECKMENU PPAR>ZPAR %10 OBJ_48008 ;   * 4802B

* refs (1): 47FB3
OBJ_48049:
        :: CHECKMENU PPAR>ZPAR %%PI %%2 %%/>% %1 PUTSCALE OBJ_47BF5 ; * 48049

* refs (1): 47E9F
OBJ_4807B:
        :: CHECKMENU PPAR>ZPAR TRUE OBJ_480F3 ;  * 4807B

* refs (1): 47EC2
OBJ_48099:
        :: CHECKMENU PPAR>ZPAR FALSE OBJ_480F3 ; * 48099

* refs (1): 47EE3
OBJ_480B7:
        :: CHECKMENU PPAR>ZPAR TRUE OBJ_4811B ;  * 480B7

* refs (1): 47F06
OBJ_480D5:
        :: CHECKMENU PPAR>ZPAR FALSE OBJ_4811B ; * 480D5

* refs (2): 4808F 480AD
OBJ_480F3:
        :: OBJ_47C6D DROP OBJ_47B6E HSCALE DROP OBJ_47BF5 ; * 480F3

* refs (2): 480CB 480E9
OBJ_4811B:
        :: OBJ_47C6D SWAPDROP OBJ_47B6E VSCALE DROP OBJ_47BF5 ; * 4811B

* refs (1): 47F4A
OBJ_48143:
        :: CHECKMENU PPAR>ZPAR AUTOSCALE OBJ_47BF5 ; * 48143

* refs (1): 47E7E
OBJ_48161:
        :: CHECKMENU PPAR>ZPAR ERRSET            * 48161
          :: INDEPVAR OBJ_4D96B GETPTYPE ; ERRTRAP * 48175
          :: ERRORCLR DropSysObs ID_X ID_Y 'IDFUNCTION ; MAKEPVARS DROP * 48193
          PUTPTYPE depnd(gn) PUTINDEP OBJ_4DAA3 ; * 481C0

* refs (1): 4D6F0
OBJ_481D9:
        :: OBJ_4DCC6 WINDOWBOT? IT WINDOWDOWN    * 481D9
          OBJ_517B2 DUP 13GETLAM #= 3UNROLL OBJ_4E0BA 7GETLAM 13GETLAM * 481F2
          !#1+IF<dim-1 OBJ_48472 ?SKIP OBJ_48503 * 4821A
          OBJ_484BD ;                            * 4822E

* refs (1): 4D3D5
OBJ_48238:
        :: OBJ_4DCC6 WINDOWTOP? IT WINDOWUP      * 48238
          OBJ_517B2 DUP#0= 3UNROLL OBJ_4E0BA 7GETLAM !#1-IF>0 OBJ_48472 * 48251
          ?SKIP OBJ_4853F                        * 48274
          OBJ_484BD ;                            * 4827E

* refs (1): 0C938
OBJ_48288:
        :: EQCURSOR? case2drop                   * 48288
          :: 11GETLAM 4PUTLAM %0_2A2B4 TOTEMPOB 1PUTLAM CROSS_OFF * 48297
            CROSS_HAIRS ;                        * 482BA
          CROSS_OFF PREMARKON CROSS_HAIRS ;      * 482C4

* refs (1): 4830A
OBJ_482D8:
        :: 2GETLAM 8GETLAM #= 12GETLAM 7GETLAM #= OR ; * 482D8

* refs (2): 0C906 8D214
OBJ_48305:
        :: OBJ_482D8 case                        * 48305
          :: CROSS_OFF 2GETLAM 12GETLAM OBJ_517B2 TOGGLELINE#3 CROSS_HAIRS ; * 48314
          CROSS_OFF 2GETLAM 12GETLAM 8GETLAM DUP 4PICK #> ITE #1- #1+ * 4833C
          OVER TOGGLELINE#3 8GETLAM 12GETLAM OVER 7GETLAM 3PICKOVER #< ITE * 4836E
          #1- #1+                                * 4839B
          TOGGLELINE#3 OBJ_517B2 2GETLAM 3PICKOVER #< ITE #1- #1+ * 483A5
          OVER TOGGLELINE#3 2GETLAM 7GETLAM OVER 12GETLAM 3PICKOVER #< ITE * 483CD
          #1- #1+                                * 483FA
          TOGGLELINE#3 CROSS_HAIRS ;             * 48404

        :: #1=case OBJ_4842C                     * 48413
          OBJ_4881E ;                            * 48422

* refs (2): 4841D 4D5EC
OBJ_4842C:
        :: OBJ_4DCC6 WINDOWRIGHT? IT WINDOWRIGHT * 4842C
          OBJ_517B2 OVER 14GETLAM #= 3UNROLL OBJ_4E0BA 8GETLAM 14GETLAM * 48445
          !#1+IF<dim-1                           * 4846D

* refs (3): 4821F 4826F 4885A
OBJ_48472:
          :: OBJ_517B2 CROSSGROB OBJ_4DEB3 4GETLAM GBUFF BINT11 ROLL BINT11 * 48472
            ROLL GROB! 8ROLL ;                   * 4849F
          ?SKIP OBJ_4855D                        * 484B3

* refs (3): 4822E 4827E 48869
OBJ_484BD:
          :: GBUFF 5UNROLL SUBGROB DUP4PUTLAM TOTEMPOB 4ROLL OBJ_50F2E * 484BD
            OBJ_4DF67 GBUFF 2SWAP GROB! ;        * 484E5
        ;                                        * 484FE

* refs (1): 48229
OBJ_48503:
        :: 7GETLAM 12GETLAM #> OBJ_48521 ;       * 48503

* refs (1): 48517
OBJ_48521:
        :: 7GETLAM BINT1 OBJ_6C339 OBJ_486D9 ;   * 48521

* refs (1): 48279
OBJ_4853F:
        :: 7GETLAM 12GETLAM #< OBJ_4742C ;       * 4853F

* refs (1): 484B8
OBJ_4855D:
        :: 8GETLAM 2GETLAM #> OBJ_4857B ;        * 4855D

* refs (1): 48571
OBJ_4857B:
        :: 8GETLAM BINT1 OBJ_6C339 OBJ_485D0 ;   * 4857B

* refs (1): 48864
OBJ_48599:
        :: 8GETLAM 2GETLAM #< OBJ_485B7 ;        * 48599

* refs (1): 485AD
OBJ_485B7:
        :: 8GETLAM #1+ OBJ_485D0 ;               * 485B7

* refs (2): 4858F 485C6
OBJ_485D0:
        :: 12GETLAM 7GETLAM OBJ_487F6 NOT 5PICK AND ITE 3DROP * 485D0
          :: 4PICK IT                            * 485FD
            :: SWAP #1+ SWAP #1- ;               * 4860C
            3PICKSWAP OVER 2GETLAM #= case 4DROP * 4862A
            TOGGLELINE#3 ;                       * 48648
          12GETLAM 7GETLAM OBJ_487F6 NOT 4PICK NOT AND case 3DROP * 48652
          8GETLAM 3UNROLL 3PICKSWAP 5ROLL ?SKIP  * 4867F
          :: ROT #1+ 3UNROLL #1- ;               * 48698
          OVER 2GETLAM #= case 4DROP             * 486B6
          TOGGLELINE#3 ;                         * 486CF

* refs (2): 4743B 48535
OBJ_486D9:
        :: 2GETLAM 8GETLAM OBJ_487F6 NOT 5PICK AND ITE 3DROP * 486D9
          :: 4PICK IT                            * 48706
            :: SWAP #1+ SWAP #1- ;               * 48715
            3UNROLL SWAPROT OVER DUP 12GETLAM #= case 4DROP * 48733
            TOGGLELINE#3 ;                       * 4875B
          2GETLAM 8GETLAM OBJ_487F6 NOT 4PICK NOT AND case 3DROP * 48765
          7GETLAM 3UNROLL 3PICKSWAP 5ROLL ?SKIP  * 48792
          :: ROT #1+ 3UNROLL #1- ;               * 487AB
          SWAP4ROLL 3UNROLL DUP 12GETLAM #= case 4DROP * 487C9
          TOGGLELINE#3 ;                         * 487EC

* refs (4): 485DF 4865C 486E8 4876F
OBJ_487F6:
        :: 2DUP#> IT SWAP                        * 487F6
          2DUPSWAP #- #>1 ;                      * 4880A

* refs (2): 48422 4D4FC
OBJ_4881E:
        :: OBJ_4DCC6 WINDOWLEFT? IT WINDOWLEFT   * 4881E
          OBJ_517B2 OVER #0= 3UNROLL OBJ_4E0BA 8GETLAM !#1-IF>0 OBJ_48472 * 48837
          ?SKIP OBJ_48599                        * 4885F
          OBJ_484BD ;                            * 48869

* refs (2): 47610 4D69B
OBJ_48873:
        :: TakeOver TraceMode? ITE OBJ_49441 OBJ_4E248 * 48873
          NOTcase DoBadKey                       * 48891
          ->StkStr22! OBJ_469FF ;                * 4889B
        NIBHEX  00000                            * 488AA  ..

* refs (1): 477F9
PlotScr*en~2~2:
        :: GDISPCENTER TURNMENUOFF PLOTPREP 2DROP 3UNROLL DUP TOTEMPOB * 488AF
          15PUTLAM 17PUTLAM 16PUTLAM %0_2A2B4 GetRes 4PUTLAM OBJ_4B9D6 * 488D7
          OBJ_4C314 ERRSET                       * 488FA
          :: BINT2 OBJ_4A96E DROP ' 15GETLAM ' GETXPOS ' 1PUTLAM BINT1 * 48904
            GetEqN NOTcase ERRJMP                * 4893B
            DUP ALGeq? IT GETRHS                 * 4894A
            5ROLL #1= ITE                        * 4895E
            :: %0_2A2B4 SWAP ;                   * 4896D
            :: BINT2 GetEqN NOTcase ERRJMP       * 48981
              DUP ALGeq? IT GETRHS               * 4899A
            ;                                    * 489AE
            ' OBJ_5135F BINT1 ' PlotScr*en~2~2~1 4ROLL ' OBJ_5135F BINT2 ' * 489B3
            PlotScr*en~2~2~1 BINT11 ::N 2PUTLAM 19GETLAM TYPEEXT? ITE * 489E5
            OBJ_4BC06 OBJ_4C12A                  * 48A08
          ;                                      * 48A12
          ERRTRAP OBJ_4B4EB OBJ_4C082 ATTNFLGCLR 18GETLAM RESETDEPTH * 48A17
          INDEPVAR ?PURGE_HERE GDISPCENTER OBJ_4D1DC ; * 48A35

* refs (2): 489C7 489E5
PlotScr*en~2~2~1:
        :: SWAP DUPTYPEREAL? NOTcasedrop OBJ_4C22E * 48A4E
          GETYPOS 1GETLAM SWAP2DUP PIXON3 3PICK #2= NOTcase OBJ_4C440 * 48A67
          ROTDROP PlotScr*en~2~2~1~1 ;           * 48A8F

* refs (1): 48A94
PlotScr*en~2~2~1~1:
        :: PlotScr*en~2~2~1~1~1 20GETLAM BINT1 PULLREALEL SWAPDROP %-1=case * 48A9E
          :: DROP BINT2 3UNROLL OBJ_4C440 ;      * 48AC1
          COERCE 21GETLAM BINT1 PULLREALEL SWAPDROP COERCE * 48ADF
          PlotScr*en~2~2~1~1~1 4PICK 4PICK DRAWLINE#3 BINT2 3UNROLL * 48AFD
          OBJ_4C440 ;                            * 48B1B

* refs (7): 48D05 48D1E 48D2D 48D41 48D5A 48D6E ...
OBJ_48B25:
        :: OBJ_4C0E4 OBJ_4C314 ;                 * 48B25

* refs (3): 497A3 49925 49981
OBJ_48B39:
        :: SYMBNUMSOLVE NOTcase                  * 48B39
          :: 2RDROP JstGetTHEMESG OBJ_0C9FE ;    * 48B48
          ATTN# OVER #= case                     * 48B61
          :: SWAPDROP 2RDROP GETTHEMESG OBJ_0C9FE ; * 48B75
          OBJ_33D8C OVER                         * 48B93
* The Very Big List names this address äline, but it is a pointer inside an object; the name is not used
          #= ITE DROPNULL$ GETTHEMESG            * 48B9D
          SWAP ;                                 * 48BB1

* refs (3): 200FD 48FBD B7EE6
OBJ_48BBB:
        :: STATLR ChkReakäPAR 5UNROLL 4DROP ' xLINFIT EQcasedrop * 48BBB
          :: 'IDX 'x* ' x+ BINT5 SYMBN ;         * 48BE3
          ' xLOGFIT EQcasedrop                   * 48C0B
          :: 'IDX ' xLN 'x* ' x+ BINT6 SYMBN ;   * 48C1A
          ' xEXPFIT EQ case                      * 48C4C
          :: 'IDX 'x* ' xEXP 'x* BINT6 SYMBN ;   * 48C60
          'IDX SWAP ' x^ ' x* BINT5 SYMBN ;      * 48C8D

* refs (3): 4997C 49B5F 49B9B
OBJ_48CBA:
        :: INDEPVAR OBJ_73DFC TOTEMPOB 15GETLAM OVER NEWINDEP 19GETLAM * 48CBA
          DUPTYPEEXT? NOTcaseDROP UM>U           * 48CE2
        ;                                        * 48CF1
        NIBHEX  00000                            * 48CF6  ..

* refs (1): 474AB
PlotScr*en~3:
        :: CHECKMENU OBJ_48B25 ERRSET PlotScr*en~3~1 ERRTRAP * 48CFB

* refs (2): 48D55 48D82
OBJ_48D19:
          :: OBJ_48B25 ERRJMP ; OBJ_48B25 ;      * 48D19

* refs (1): 474CE
PlotScr*en~4:
        :: CHECKMENU OBJ_48B25 ERRSET PlotScr*en~4~1 ERRTRAP OBJ_48D19 * 48D37
          OBJ_48B25 ;                            * 48D5A

* refs (1): 47556
PlotScr*en~5:
        :: CHECKMENU OBJ_48B25 ERRSET PlotScr*en~5~1 ERRTRAP OBJ_48D19 * 48D64
          OBJ_48B25 ;                            * 48D87
        NIBHEX  0                                * 48D91

* refs (1): 491DA
AUTOSCALE~1:
        :: GETPTYPE BINT17 PTYPE>PINFO case EVAL * 48D92
          :: OBJ_49017 OBJ_491E4 2DROP ; ;       * 48DB0

* refs (2): 8CB30 8CC6E
OBJ_48DCE:
        :: OBJ_49017 ' OBJ_48F4A 8PUTLAM OBJ_491E4 DUP TYPEBINT? * 48DCE
* The Very Big List names this address ScaleY=ScaleX, but it is a pointer inside an object; the name is not used
          case2DROP OBJ_49478                    * 48DF6
          xrng(2r) ;                             * 48E00

* refs (1): 8C9EC
OBJ_48E0A:
        :: GETSCALE DROP DUP PUTSCALE ;          * 48E0A

* refs (1): 8CE27
OBJ_48E28:
        ::                                       * 48E28

* refs (2): 48E91 48ED2
OBJ_48E2D:
          :: rclä ChkReakäPAR 3DROP COERCE2 ;    * 48E2D

* refs (1): 200E2
xSCLSIGMA~1:
          :: ROT OBJ_2CF08 DUP 4ROLL MinMaxCol(ra,s) OBJ_49478 xrng(2r) SWAP * 48E4B
            MinMaxCol(ra,s) OBJ_49293 ;          * 48E78
        ;                                        * 48E87

* refs (1): 8CF15
OBJ_48E8C:
        :: OBJ_48E2D DROP DUPROT OBJ_2CF08 SWAPDROPSWAP MinMaxCol(ra,s) * 48E8C
          OBJ_49478 xrng(2r) %0_2A2B4 STATN OBJ_49587 ; * 48EAF

* refs (1): 8CFE5
OBJ_48ECD:
        :: OBJ_48E2D %0_2A2B4 PUTRES %0_2A2B4 STATN xrng(2r) DROP * 48ECD
          MinMaxCol(ra,s) 2DUP %= ITE DROP%0b    * 48EF5
          :: DUP %0< casedrop %0_2A2B4           * 48F0E
            SWAPDUP %0> NOT?SEMI                 * 48F27
            DROP%0b ;                            * 48F36
          OBJ_49293 ;                            * 48F40

* refs (1): 48DDD
OBJ_48F4A:
        :: GETPTYPE 'IDPARAMETER EQITE           * 48F4A
          :: DUP TYPECMP? case C%>%              * 48F5E
            %0_2A2B4 ;                           * 48F77
          :: 2GETLAM %POL>%REC ; 6GETLAM 7GETLAM 4ROLL OBJ_494EC 7PUTLAM * 48F81
          6PUTLAM ;                              * 48FAE

* refs (1): 0C7BC
OBJ_48FB8:
        :: OBJ_48BBB DOSTOE 'IDFUNCTION PUTPTYPE %1 'IDX DUP PUTINDEP * 48FB8
          XEQSTOID EXITFCNsto OBJ_4C2CE ;        * 48FE5

* ->
* refs (2): 46A13 4A005
SORTASLOW:
        :: BINT5 ONE_DO VERYSLOW LOOP ;          * 48FF9
