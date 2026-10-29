* HP 48GX ROM revision R, #49017-#4C081: Plotting
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: PUTPTYPE GETPTYPE RESETDEPTH CHECKPVARS GETPMIN&MAX pmin(c) pmax(c) RclDepnd GetEqN rceq! depnd(gn) ICMPDRPRTDRP
* Follows on from the previous file (at #49017 in the original ROM).
        RPL

* refs (2): 48DB5 48DD3
OBJ_49017:
        :: 'NOP ZEROZERO ZEROZERO rceq! ~DUP;ALGeq? IT GETRHS * 49017
          GETINDEP DUPTYPELIST? ITE              * 4903F
          :: INCOMPDROP %MAXorder SWAP ;         * 4904E
          :: GETPTYPE 'IDPOLAR jEQcase           * 49067
            :: %0_2A2B4 1REV ;                   * 4907B
            GETXMIN GETXMAX GETPTYPE 'IDPARAMETER EQ NOT?SEMI * 4908F
            2DUP TWO{}N PUTINDEPLIST ;           * 490AD
          SWAPDUP TOTEMPOB 4PICK dup;RclInVars(gn)? IT * 490C1
          :: GETPTYPE 'IDFUNCTION EQ NOTcaseDROP KeepUnit * 490DA
          ;                                      * 490F8
          OVERSWAP XEQSTOID 3UNROLL %-           * 490FD

%4E1:
          % 4E1 %/ SWAPDUP KeepUnit DROP SWAP EVAL SWAP 8NULLLAM{} BIND ; * 49111

* refs (3): 6B961 73968 739A4
~BINT27;GETLAM:
        :: BINT27 GETLAM ;                       * 49158
        NIBHEX  00000                            * 4916C  ..

* refs (1): 15415
EQReview~1:
        # 60E                                    * 49171  1550

        # 60F                                    * 4917B  1551

        # 610                                    * 49185  1552

* refs (1): 15608
SolvEQ(nm)~1:
        # 611                                    * 4918F  1553

        # 612                                    * 49199  1554

        # 613                                    * 491A3  1555

        # 614                                    * 491AD  1556

        # 615                                    * 491B7  1557

        # 616                                    * 491C1  1558

        # 617                                    * 491CB  1559

* ->
* refs (4): 1E1B5 20147 48152 B6399
AUTOSCALE:
        :: AUTOSCALE~1 ;                         * 491D5

* refs (2): 48DBA 48DE7
OBJ_491E4:
        :: BINT41 ZERO_DO 3GETLAM                * 491E4
          :: OBJ_495D3 8GETLAM EVAL 4GETLAM 5GETLAM ROT OBJ_494EC 5PUTLAM * 491F8
            4PUTLAM ;                            * 49225
          2GETLAM DUP 1GETLAM 'EvalNoCK:_sup x+ U>nbr OVER TYPEEXT? ITE * 4922F
          OBJ_4C0D4 NEWINDEP                     * 4925C
          LOOP 6GETLAM 7GETLAM 4GETLAM 5GETLAM ABND DUP TYPEBINT? case2DROP * 49266

* refs (2): 48E7D 48F40
OBJ_49293:
          :: OBJ_49478 OBJ_49587 ;               * 49293
        ;                                        * 492A7

* refs (1): 20A82
xRULES~1:
        :: CK0NOLASTWD RECLAIMDISP xRULES~8 xRULES~7 xRULES~6 xRULES~5 * 492AC
          xRULES~4 xRULES~3 xRULES~2 BINT8 ONE_DO INDEX@ DISPN LOOP * 492CF
          SetDAsTemp ;                           * 492F7

* refs (1): 492D9
xRULES~2:
        $ "            M G"                      * 49301

* refs (1): 492D4
xRULES~3:
        $ "      P   DIANA"                      * 49329

* refs (1): 492CF
xRULES~4:
        $ "    CHARLIE X B     D"                * 49351

* refs (1): 492CA
xRULES~5:
        $ " BILL U   N  TED    A"                * 49385

* refs (1): 492C5
xRULES~6:
        $ " O  A L   N    ALCUIN"                * 493B9

* refs (1): 492C0
xRULES~7:
        $ " B  I    JIM   V"                     * 493ED

* refs (1): 492BB
xRULES~8:
        $ "  RON     S    E"                     * 49417

* refs (1): 48887
~BINT24;GETLAM;TRUE:
        :: BINT24 GETLAM TRUE ;                  * 49441

* refs (1): 47989
~TOADISP;BlankDA1:
        :: TOADISP BlankDA1 ;                    * 4945A
        BSS     10                               * 4946E

* refs (4): 48DFB 48E69 48EAF 49298
OBJ_49478:
        :: 2DUP %= IT                            * 49478
          :: DUP%0= case2drop                    * 4948C

1;-1:
            :: %1 %-1 ;                          * 4949B
            DUP                                  * 494AF

* .1
* refs (2): C09E5 C0AFA
%.1:
            % 1E-1 %* ROTOVER %- 3UNROLL %+ ;    * 494B4
        ;                                        * 494E7

* refs (2): 48FA4 4921B
OBJ_494EC:
        :: DUPTYPEREAL? NOTcaseDROP %MAXREAL     * 494EC
          OVER %ABS %= caseDROP OVERDUP          * 49500
          TYPEBINT? case                         * 49519

drop(1,3-4);dup:
          :: DROPSWAPDROP SWAPDROPDUP ;          * 49523
          OVER %< case SWAPDROP                  * 49537
          3PICKOVER %> ITE ROTDROPSWAP DROP      * 4954B
        ;                                        * 49564

* refs (4): 48E64 48E78 48EAA 48EF5
MinMaxCol(ra,s):
        :: SWAP2DUP ColumnMIN 3UNROLL ColumnMAX ; * 49569

* refs (2): 48EC3 4929D
OBJ_49587:
        :: %MAXorder SWAP 2DUP yrng(2r) OVER %-  * 49587

* .15
* refs (1): 2E0CC
%.15:
          % 1.5E-1 %* %- PUTYMIN ;               * 495AA

* refs (1): 491FD
OBJ_495D3:
        :: ERRSET EVALCRUNCH ERRTRAP             * 495D3
          :: ERROR@ # 100 #/ SWAPDROP BINT3 #<>case ERRJMP * 495E7
            ERRORCLR 2RDROP ;                    * 49614
          CK1NoBlame U>nbr 2GETLAM OVER EQIT TOTEMPOB ; * 49623

->StackStr22!+:
        :: ->StkStr22! !append$ ;                * 49646

* refs (1): 47FD6
OBJ_4965A:
        :: CHECKMENU OBJ_496A0 NOTcase DoBadKey  * 4965A
          4UNROLL3DROP PPAR>ZPAR DUPNULL{}? casedrop DoBadKey * 49673
          'IDPAR STOAPPLDATA OBJ_4DAA3 ;         * 4968C

* refs (5): 47B3C 49664 4EEC4 B6295 B6326
OBJ_496A0:
        :: ' ID ZPAR RclPlotVar? NOTcaseFALSE DUPTYPELIST? * 496A0
          NOTcsdrpfls INNERDUP BINT4 #= NOTcase NDROPFALSE * 496C8
          DROPTRUE ;                             * 496E6

* refs (3): 6B97F 6CBCF 7380F
~BINT27;PUTLAM:
        :: BINT27 PUTLAM ;                       * 496F0
        NIBHEX  00000                            * 49704  ..

* id ob -> $
* refs (3): 15581 9E59F 9F21D
PromptIdUtil:
        :: ->StkStr22! SWAP ID>$ $ ": " !append$SWAP !append$ ; * 49709

* refs (1): 474F1
PlotScr*en~10:
        :: CHECKMENU OBJ_49B4B CkEQUtil PointDerivUt CRUNCHNoBlame * 4973A

_Slope__49758:
          $ "Slope" >TAG DUP OBJ_49D3A Π'SAVEDDEPTH #1+ ' Π'SAVEDDEPTH STO ; * 49758

* refs (1): 48D0F
PlotScr*en~11:
        :: OBJ_49B4B OBJ_48B39 FALSE             * 49799

_Root_:
          $ "Root" OBJ_49E75 Π'SAVEDDEPTH #1+ ' Π'SAVEDDEPTH STO ; * 497AD
        NIBHEX  00000                            * 497E2  ..

* refs (1): 47512
PlotScr*en~12:
        :: CHECKMENU OBJ_49B4B CkEQUtil CURRENTMARK? NOTcase * 497E7
          :: 3DROP NEWMARK ;                     * 49805
          DROP OBJ_4782B 4UNROLL 3UNROLL DUPUNROT SYMSHOW SWAP ' INTEG * 49819
          CRUNCHNoBlame                          * 49846

_Area_:
          $ "Area" >TAG DUP BINT39 !DcompWidth 1stkdecomp$w * 4984B
          ~DispCoord1;BINT2;16PUTLAM Π'SAVEDDEPTH #1+ ' Π'SAVEDDEPTH STO ; * 49876

* refs (1): 48D4B
PlotScr*en~13:
        :: OBJ_49B4B DORCLE EqList? ITE          * 49899
          :: ROT ' xEVAL BINT2 GetEqN NcaseSIZEERR OBJ_49B7D * 498B2
            OVER ' x- BINT5 ::N 3UNROLL ;        * 498DA
          :: rceq! dup;1stMember(_);gn? caseDROP 4ROLL * 498FD
            DROP 3UNROLL ;                       * 49916
          OBJ_48B39 TRUE                         * 49925

_I-sect_:
          $ "I-sect" OBJ_49E75 Π'SAVEDDEPTH #1+ ' Π'SAVEDDEPTH STO ; * 4992F

* refs (1): 48D78
PlotScr*en~14:
        :: OBJ_49B4B CkEQUtil PointDerivUt OBJ_48CBA OBJ_48B39 TRUE * 49968

_Extrm_:
          $ "Extrm" OBJ_49E75 Π'SAVEDDEPTH #1+ ' Π'SAVEDDEPTH STO ; * 4998B

* refs (1): 47577
PlotScr*en~15:
        :: CHECKMENU OBJ_49B4B 2DROP CRUNCHNoBlame * 499C2

_F(x)_:
          $ "F(x)" >TAG DUP OBJ_49D3A Π'SAVEDDEPTH #1+ ' Π'SAVEDDEPTH STO ; * 499DB

        # 622                                    * 49A1A  1570

        # 623                                    * 49A24  1571

        # 624                                    * 49A2E  1572

* refs (2): 22119 4A343
OBJ_49A38:
        # 628                                    * 49A38  1576

* refs (2): 22157 4A381
OBJ_49A42:
        # 629                                    * 49A42  1577

* refs (2): 221C2 4A3CE
OBJ_49A4C:
        # 62A                                    * 49A4C  1578

* refs (2): 221D6 4A3E7
OBJ_49A56:
        # 62B                                    * 49A56  1579

* refs (1): 222B7
IOSetup~2:
        # 62C                                    * 49A60  1580

* refs (1): 222CB
IOSetup~3:
        # 62D                                    * 49A6A  1581

* refs (2): 4EF00 B633A
OBJ_49A74:
        :: BINT4 {}N '                           * 49A74

ZPAR_49A88:
          ID ZPAR STOAPPLDATA ;                  * 49A88

* refs (2): 48AA3 48AFD
PlotScr*en~16:
        :: DUP OBJ_66BAD IT DROPZERO             * 49AA1
        ;                                        * 49ABA

* refs (1): 47594
PlotScr*en~17:
        :: CHECKMENU OBJ_49B4B CkEQUtil          * 49ABF

* refs (3): 47660 4974E 49977
PointDerivUt:
          :: DROP SymDer(ex,nm) ;                * 49AD3

* refs (1): 49CCC
NextInEQ~1:
          :: DORCLE DUP EqList? ; case           * 49AE7
          :: SWAP>HCOMP 'EQ STOAPPLDATA OBJ_4DAA3 ; * 49B05
          DROP 'EQ SAFE@ DROP TWO{}N DOSTOE OBJ_4DAA3 ; * 49B23

* refs (10): 47638 47656 49744 4979E 497F1 4989E ...
OBJ_49B4B:
        :: rceq! ~DUP;ALGeq? NOTcase OBJ_48CBA   * 49B4B
          DUP ChkEQ(eq) case OBJ_49C95           * 49B64
          2DROP                                  * 49B78

* refs (5): 498D5 7389B 8AB45 B6BB7 B6BDA
OBJ_49B7D:
          :: ~DUP;ALGeq? NOT?SEMI                * 49B7D
            1stArgRpn(ex) SYMBN ;                * 49B8C
          OBJ_48CBA ;                            * 49B9B

FcnUtilEnd:
        :: INDEPVAR ~RECORDX&YC%;C>Re% OVER OBJ_1552C OVER SWAP XEQSTOID ; * 49BA5

RootUtil:
        :: SYMBNUMSOLVE NOTcase                  * 49BD2
          :: 2RDROP JstGetTHEMESG DISPCOORD2 ;   * 49BE1
          ATTN# OVER #= case                     * 49BFA
          :: SWAPDROP 2RDROP GETTHEMESG DISPCOORD2 ; * 49C0E
          OBJ_33D8C OVER #= ITE DROPNULL$ GETTHEMESG * 49C2C
          SWAP ;                                 * 49C4A

* refs (5): 4765B 49749 497F6 49972 49ACE
CkEQUtil:
        :: 3PICK DUPTYPESYMB? OVER TYPEIDNT? OR OVER TYPEREAL? OR SWAP * 49C54
          TYPEEXT? OR NOTcase                    * 49C86

* refs (1): 49B73
OBJ_49C95:
          :: CkEQUtil~1 OBJ_6BC2D 3DROP RDROP ;  * 49C95
        ;                                        * 49CB3

* refs (1): 475E0
NextInEQ:
        ::                                       * 49CB8

* refs (1): 15348
NextInEQ!:
          :: TakeOver AtUserStack NextInEQ~1 ITE * 49CBD

* {} -> {}'
ROLL{}:
            :: INNERCOMP DUP#0=case NOEQERR      * 49CD6
              DUP#1+ ROLLSWAP {}N ;              * 49CEA
            :: dup;BreakEquation? NOT?SEMI       * 49CFE
              ROTDROP SWAP uncrunch x= ;         * 49D0D
            'EQ STOAPPLDATA ;                    * 49D26
          Trceq                                  * 49D35

* refs (3): 47731 49776 499F7
OBJ_49D3A:
          ::                                     * 49D3A
            :: NULL$ SWAP OBJ_49B4B SWAPDROPSWAP OBJ_49E3E U>nbr dREALNcase * 49D3F
              2DROP                              * 49D67
              PointMoveCur ;                     * 49D6C
            NextInEQ~2 ;                         * 49D76
        ;                                        * 49D80

* refs (1): 49907
dup;1stMember(_);gn?:
        :: DUP ALGeq? NOTcaseFALSE DUP           * 49D85
          1stArgb(ex) DUP#1= NOTcase             * 49D9E

dropB;false:
          :: NDROP FALSE ;                       * 49DAD
          DROP TYPEIDNT? ;                       * 49DC1

* refs (1): 49D03
dup;BreakEquation?:
        :: DUP ALGeq? NOTcaseFALSE DUP           * 49DD0
          1stArgb(ex) SYMBN OVER 1stArgRpn(ex) SYMBN TRUE ; * 49DE9

* refs (1): 49B69
ChkEQ(eq):
        :: DUP ~1stArgb(ex);::N SWAP GETRHS OVER ChkEQ(eq)~1 NOTcaseFALSE * 49E0C
          ChkEQ(eq)~2                            * 49E34
        ;                                        * 49E39

* refs (3): 4766F 49D58 49EA2
OBJ_49E3E:
        :: 4UNROLL 3NULLLAM{} BIND CRUNCHNoBlame 3GETLAM 2GETLAM 1GETLAM * 49E3E
          ABND 4ROLL ;                           * 49E66

* refs (3): 497BF 49945 4999F
OBJ_49E75:
        :: 15GETLAM 4ROLL NEWINDEP rceq! DUP ALGeq? IT GETRHS * 49E75
          OBJ_49E3E U>nbr INDEPVAR SAFE@_HERE NcaseSIZEERR SWAP * 49EA2
          4ROLL ITE                              * 49EC0
          :: 2DUPSWAP U>nbr SWAP dREALNcase DROP * 49ECA
            %>C% ;                               * 49EE8
          OVER                                   * 49EF2
          4ROLL >TAG 3UNROLL                     * 49EF7

* refs (1): 49D6C
PointMoveCur:
          :: dREALNcase 2DROP                    * 49F06
            SWAP U>nbr SWAP RIGHTCOL BOTROW RclMaxStdPict px->c(2rr,2s) C%>% * 49F15
            3PICK %> casedrop OBJ_4A02D          * 49F3D
            3PICK %< case OBJ_4A02D              * 49F51
            WINDOWCORNER SWAP RclMaxStdPict px->c(2rr,2s) C%>% 3PICK %< * 49F65
            casedrop OBJ_4A02D                   * 49F88
            3PICK %> case OBJ_4A02D              * 49F92
            %>C% RclMaxStdPict OBJ_4F1A1 NOT?SEMI * 49FA6
            CROSS_OFF TOTEMPSWAP TOTEMPOB 8PUTLAM 7PUTLAM CROSS_HAIRS ; * 49FBA
          DUPUNROT                               * 49FDD

* refs (1): 49D76
NextInEQ~2:
          :: SWAP DUPNULL$? ITE DROP             * 49FE2
            :: ~DispCoord1;BINT2;16PUTLAM SORTASLOW ; * 49FFB
            BINT39 !DcompWidth 1stkdecomp$w ~DispCoord1;BINT2;16PUTLAM ; * 4A00F
        ;                                        * 4A028

* refs (4): 49F4C 49F60 49F8D 49FA1
OBJ_4A02D:
        :: 2DROP SWAP OBJ_4794D JstGetTHEMESG !append$ SWAP ; * 4A02D

* $ ->
* refs (2): 49BF0 49C22
DISPCOORD2:
        :: DispCoord1 WaitForKey 2DROP DispMenu InitEdModes ; * 4A055

* refs (1): 49BAF
~RECORDX&YC%;C>Re%:
        :: RECORDX&YC% C>Re% ;                   * 4A078

* refs (8): 155E5 15887 4902B 49902 49B50 49E89 ...
rceq!:
        :: BINT1 GetEqN NOTcase NOEQERR          * 4A08C
        ;                                        * 4A0A5

* #n -> ob T -> NULL$ F
* refs (9): 4893B 4898B 498CB 4A096 4E252 4EE4C ...
GetEqN:
        :: EQUATION NOTcsdrpfls DUPUNROT EqList? ITE * 4A0AA
          :: NTHELCOMP NOTcase                   * 4A0C8

___4A0D7:
            :: NULL$ FALSE ;                     * 4A0D7
            OBJ_15389 TRUE ;                     * 4A0EB
          #1=                                    * 4A0FA
          NOTcsdrpfls DUPTYPELIST? NOTcaseTRUE CARCOMP * 4A0FF
          OBJ_15389 TRUE ;                       * 4A113

* refs (1): 20295
xBESTFIT~2:
        # 606                                    * 4A122  1542

* refs (1): 49C9A
CkEQUtil~1:
        # 607                                    * 4A12C  1543

        # 608                                    * 4A136  1544

        # 609                                    * 4A140  1545

        # 60A                                    * 4A14A  1546

        # 60B                                    * 4A154  1547

        # 60C                                    * 4A15E  1548

        # 60D                                    * 4A168  1549

* refs (1): 2026D
bestfit:
        ::                                       * 4A172

* refs (1): 2C7AB
ChkReakäPAR~2:
          { xLINFIT xLOGFIT xEXPFIT xPWRFIT } ' xLINFIT %0_2A2B4 BINT5 * 4A177
          ONE_DO 3PICK INDEX@ NTHCOMPDROP DUP StoModel STATCORR %ABS ROTSWAP * 4A1A9
          2DUP %>= ITE DROPSWAPDROP              * 4A1D6
          :: SWAPDROP ROTDROP ;                  * 4A1EA
          LOOP DROPSWAPDROP StoModel STATLR 2DROP ; * 4A1FE

* refs (1): 4A311
OBJ_4A21C:
        :: OBJ_4A258 StdMenuKeyNS ;              * 4A21C

* refs (1): 4A320
OBJ_4A230:
        :: OBJ_4A258 StdMenuKeyLS ;              * 4A230

* refs (1): 4A32F
OBJ_4A244:
        :: OBJ_4A258 StdRightShift ;             * 4A244

* refs (3): 4A221 4A235 4A249
OBJ_4A258:
        :: ~';MenuMaker;CkSecoType 'R SWAP case EVAL * 4A258
          EVAL OBJ_4A285 ;                       * 4A276

* refs (4): 3C407 4A27B 4A2DF 4A2F8
OBJ_4A285:
        :: EditLExists? ?SEMI                    * 4A285
          PrgmEntry? ?SEMI                       * 4A294
          AppMode? ?SEMI                         * 4A29E
          OBJ_6DE82 ?SEMI                        * 4A2A8
          KEYINBUFFER? ?SEMI                     * 4A2B2
          BINT58 TestSysFlag ?SEMI               * 4A2BC
          LocalReview ;                          * 4A2CB

* refs (1): 4A302
OBJ_4A2D5:
        :: SetDA12NoCh OBJ_4A285 ;               * 4A2D5

* refs (6): 3C48C 3C516 3C5A0 3C62A 3D3A1 3D3D9
OBJ_4A2E9:
        :: 'R ReviewKey! OBJ_4A285 ' OBJ_4A2D5 MenuRowAct! ' OBJ_4A21C * 4A2E9
          MenuKeyNS! ' OBJ_4A230 MenuKeyLS! ' OBJ_4A244 MenuKeyRS! ; * 4A316

* refs (1): 3D3A6
OBJ_4A33E:
        :: OBJ_49A38 JstGetTHEMESG BINT33 SysITE * 4A33E

_IR__4A357:
          $ "IR"                                 * 4A357

_wire__4A365:
          $ "wire" !append$ DISPROW3 OBJ_49A42 JstGetTHEMESG BINT35 SysITE * 4A365

_binary__4A395:
          $ "binary"                             * 4A395

_ASCII__4A3AB:
          $ "ASCII" !append$ DISPROW4 GetIOPAR OBJ_49A4C JstGetTHEMESG 7ROLL * 4A3AB
          DECOMP&$ DISPROW5 OBJ_49A56 JstGetTHEMESG 6ROLL * 4A3DD
          :: DUPTYPEREAL? NOTcasedrop            * 4A3F6

_invalid__4A405:
            $ "invalid"                          * 4A405
            {                                    * 4A41D

_none__4A422:
              $ "none "                          * 4A422

_odd__4A436:
              $ "odd "                           * 4A436

_even__4A448:
              $ "even "                          * 4A448

_mark__4A45C:
              $ "mark " }                        * 4A45C
            OVER %ABSCOERCE #1+ NTHELCOMP ?SKIP $ "spc " * 4A475
            swap;->EditStr;+(2st) ;              * 4A4A0
          &$ DISPROW6 $ "cksum: " ROT DECOMP&$ $ "  translate: " !!append$ * 4A4AA
          ~SWAP;DECOMP&$ DISPROW7 2DROP SetDA2OKTemp ; * 4A4FF

* refs (1): 3D3DE
OBJ_4A518:
        :: ChkPRTPAR #4- NDROP $ "Delay: " 5ROLL DECOMP&$ DISPROW3 * 4A518
          $ "Remap: " 4ROLL DECOMP&$ DISPROW4 $ "Line length: " ROT DECOMP&$ * 4A553
          DISPROW5 $ "End-of-line: " ~SWAP;DECOMP&$ DISPROW6 NULL$ DISPROW7 * 4A5A8
          SetDA2OKTemp ;                         * 4A5E5

* refs (1): 413C3
OBJ_4A5EF:
        :: $ "Eq: " EQUATION IT DECOMP&$         * 4A5EF
          DISPROW3 $ "Ptype: " Chk&BreakPPAR DROP 6UNROLL 5DROP DECOMP&$ * 4A615
          DISPROW4 NULL$ DISPROW5 NULL$ DISPROW6 NULL$ DISPROW7 SetDA2OKTemp ; * 4A64B

* refs (1): 4602A
OBJ_4A678:
        :: ROMPTR 0B5 08C $ "Xeye:  " 6ROLL DECOMP&$ DISPROW3 $ "Yeye:  " * 4A678
          5ROLL DECOMP&$ DISPROW4 $ "Zeye:  " 4ROLL DECOMP&$ DISPROW5 * 4A6C7
          $ "Xstep: " ROT DECOMP&$ DISPROW6 $ "Ystep: " ~SWAP;DECOMP&$ * 4A6FD
          DISPROW7 BINT10 NDROP SetDA2OKTemp ;   * 4A741

* refs (2): 3C5A5 3C62F
OBJ_4A75A:
        :: ChkReakäPAR 5ROLL $ "Xcol:  " swap;->EditStr;+(2st) DISPROW3 * 4A75A
          4ROLL $ "Ycol:  " swap;->EditStr;+(2st) DISPROW4 ROT * 4A78B
          $ "Intercept: " swap;->EditStr;+(2st) DISPROW5 SWAP $ "Slope: " * 4A7B7
          swap;->EditStr;+(2st) DISPROW6         * 4A7FE

_Mo:
          $ "Model: " swap;->EditStr;+(2st) DISPROW7 SetDA2OKTemp ; * 4A808

* refs (7): 45FB2 45FD0 46071 46099 460C1 460E9 ...
OBJ_4A834:
        :: SWAP OBJ_46120 &$ SPACE$ !!append$ SWAP OBJ_46120 !!append$ ; * 4A834
        BSS     14                               * 4A866

* refs (3): 4B783 4C495 70002
OBJ_4A874:
        :: %0_2A2B4 BINT27 NDUPN DROP OBJ_46B54 CHECKPVARS INCOMPDROP DROP * 4A874
          11PUTLAM OBJ_4C701 ROT 5PICK 5PICK OBJ_4A8F1 %MAXorder DUP * 4A8A1
          TOTEMPOB 15PUTLAM 17PUTLAM OBJ_51901 DEPTH #3- 18PUTLAM ; * 4A8C9

* refs (2): 47745 4A8BA
OBJ_4A8F1:
        :: ROT dLISTcase                         * 4A8F1
          :: ROTROT2DROP ICMPDRPRTDRP ;          * 4A900
          DROP 11GETLAM 'IDPOLAR jEQcase         * 4A914
          :: 2DROP %0_2A2B4 1REV ;               * 4A928
          C>Re% SWAP C>Re% SWAP ;                * 4A941

* comp -> obn...ob4 ob2 ob1
* refs (8): 4A90A 4B3BA B5417 B5435 B5458 B54DF ...
ICMPDRPRTDRP:
        :: INCOMPDROP ROTDROP ;                  * 4A95A

* refs (8): 4890E 4BBA2 4BD5A 4BDFA 4EDAC 8A58E ...
OBJ_4A96E:
        :: BINT1 OVER #1+ TWO{}N %-1 MAKEARRY TOTEMPOB DUP TOTEMPOB 20PUTLAM * 4A96E
          21PUTLAM ;                             * 4A9A5

* -> {}
* refs (18): 4A892 4B369 4B428 4FC6E 50F92 8AAB9 ...
CHECKPVARS:
        :: Chk&BreakPPAR ROMPTR 0F1 03D CHECKPVARS~1 DUPTYPELIST? IT * 4A9AF
          :: INNERCOMP BINT3 EQUALcasedrop OBJ_4C6E3 * 4A9D3
            BINT2 EQUALcasedrop OBJ_4EF0A        * 4A9EC
            CHECKPVARS~2 ;                       * 4A9FB
          TYPECMP? NOT?INVPPAR DUPTYPEREAL? SWAP TYPEHSTR? OR NOT?INVPPAR * 4AA05
          ChkIndep TYPECMP? NOT?INVPPAR TYPECMP? NOT?INVPPAR 'IDPAR * 4AA28
          RclPlotVar? DROP ;                     * 4AA46
        NIBHEX  0000                             * 4AA55  ..

* refs (1): 4AA28
ChkIndep:
        :: DUPTYPELIST? IT                       * 4AA59
          :: INNERCOMP BINT3 EQUAL NOT?INVPPAR TYPEREAL? NOT?INVPPAR * 4AA68
            TYPEREAL? NOT?INVPPAR ;              * 4AA8B
          TYPEIDNT? NOT?INVPPAR ;                * 4AA9A

* refs (5): 45F19 4A632 4A9B4 4B0DF 51044
Chk&BreakPPAR:
        :: 'IDPAR RclPlotVar? ?SKIP MAKEPVARS    * 4AAA9
          DUPTYPELIST? NOT?INVPPAR DUPLENCOMP BINT7 #= NOT?INVPPAR * 4AAC2
          INCOMPDROP ;                           * 4AAE0

* -> {}
* refs (4): 45EF6 481B6 4AABD 4EEFB
MAKEPVARS:
        :: BINT131 MakeRange(s) BINT64 MakeRange(s) ROTSWAP %>C% 3UNROLL * 4AAEA
          %>C% SWAP'                             * 4AB12

* ID X
* refs (1): 481A2
ID_X:
          ID X %0_2A2B4                          * 4AB1C

PvarsC%0:
          C% 0E0 0E0 'IDFUNCTION '               * 4AB2A

* ID Y
* refs (1): 481A7
ID_Y:
          ID Y StoInPPAR(7_) 'IDPAR RclPlotVar? DROP ; * 4AB59

* refs (4): 47C36 47C40 4AAF4 4AAFE
MakeRange(s):
        :: #1-DUP #2/ UNCOERCE %10 %/ %CHS SWAP UNCOERCE %10 %/ OVER %+ ; * 4AB7B

* refs (1): 4A9C4
CHECKPVARS~1:
        :: ?OKINALG casedrop                     * 4ABC1
          :: 'IDFUNCTION PUTPTYPE ;              * 4ABD0
          OBJ_2708E caseDROP DROP                * 4ABE4
          'IDFUNCTION PUTPTYPE ;                 * 4ABF3

* refs (1): 6BE16
OBJ_4AC02:
        :: DUPTYPESYMB? OVER TYPECMP? OR SWAP TYPEEXT? OR ; * 4AC02
        NIBHEX  00000                            * 4AC2F  ..

* refs (3): 4AE5F 4B567 4B5C1
RclCenter:
        :: RclMaxStdPict 2DUP #2/ 4UNROLL #2/ 3UNROLL px->c(2rr,2s) ; * 4AC34

* refs (6): 1E0F7 1E110 47C0E 4B5A3 4B602 4E767
centr(c):
        :: C%>% RclMaxStdPict 2DUP #1-SWAP #1-DUP 2/(s);s=>rr 3PICK * 4AC61
          2/(s);s=>rr 4PICK UNCOERCE%% %%/ 6UNROLL OVER UNCOERCE%% %%/ * 4AC89
          5UNROLL UNCOERCE2 %>%% 4ROLL 2/(s);s=>rr SWAP%%/ 3UNROLL %>%%SWAP * 4ACB1
          2/(s);s=>rr SWAP%%/ 3UNROLL GETPMIN&MAX SWAP2C%>% ROTSWAP %- %>%% * 4ACD9
          3UNROLL %- %>%% DUP 6ROLL %%* 8PICK %>%%SWAP %%- %%>% 8UNROLL * 4AD01
          5ROLL %%* 6ROLL %>%% %%+ %%>% 5UNROLL DUP 4ROLL %%* 4PICK %>%%SWAP * 4AD38
          %%- %%>% 5UNROLL %%*SWAP %>%% %%+ %%>% %>C% pmax(c) %>C% pmin(c) ; * 4AD74

* -> % %'
* refs (3): 47BDC 4800D 48E0F
GETSCALE:
        :: RclMaxStdPict #1-SWAP #1- UNCOERCE2 RclPmin C%>% RclPmax C%>% * 4ADB0
          3UNROLL 4ROLL %- %>%% 5ROLL %>%% %%/ %%10 %%* %%>% 4UNROLL %- * 4ADDD
          %>%%SWAP %>%% %%/ %%10 %%* %%>% ;      * 4AE19

* % %' ->
* refs (5): 1E1F0 47BE6 48017 4806C 48E1E
PUTSCALE:
        :: DUP %0> NcaseSIZEERR OVER             * 4AE3C
          %0> NcaseSIZEERR RclCenter             * 4AE55
          C%>% %>%%SWAP %>%% 4ROLL %>%% %%10 %%/ 4ROLL %>%% %%10 %%/ * 4AE64
          RclMaxStdPict 2DUP #1-SWAP #1- 2/(s);s=>rr 5PICK %%* 8PICK SWAP * 4AE9B
          %%- %%>% 8UNROLL 2/(s);s=>rr 5PICK %%* 6PICK SWAP %%- %%>% 8UNROLL * 4AEC8
          2/(s);s=>rr 4ROLL %%* 4ROLL %%+ %%>% 4UNROLL 2/(s);s=>rr %%* %%+ * 4AEFF
          %%>% %>C% pmax(c) %>C% pmin(c) ;       * 4AF31

* refs (8): 4AC7F 4AC89 4ACC5 4ACD9 4AEAF 4AED7 ...
2/(s);s=>rr:
        :: #2/ UNCOERCE%% ;                      * 4AF4F

* -> id -> {}
* refs (4): 4773B 4903F 510B2 B6402
GETINDEP:
        :: BINT3 GETPARAM ;                      * 4AF63

* ID ->
* refs (6): 1E059 481CA 48FE0 8B643 8BDAB B548A
PUTINDEP:
        :: BINT5 PutBackPPAR(_,s) ;              * 4AF77

* {} ->
* refs (6): 1E063 490B7 8A193 8B1C9 B5403 B5499
PUTINDEPLIST:
        :: BINT3 ChkPut('PPAR',li,s) ;           * 4AF8B

* refs (9): 4C562 4D970 A9B91 A9C60 B5CEE B5EF5 ...
RclDepnd:
        :: BINT7 GETPARAM ;                      * 4AF9F

* refs (8): 1E23A 481C5 8BDCB B552A B5D11 B5D3A ...
depnd(gn):
        :: BINT1 PutBackPPAR(_,s) ;              * 4AFB3

* refs (3): 1E244 B54C6 B5539
depnd(li):
        :: BINT7 ChkPut('PPAR',li,s) ;           * 4AFC7

* -> %
* refs (3): 4D1B9 8B7A9 B64D3
GETRES:
        :: BINT4 GETPARAM ;                      * 4AFDB

* refs (5): 1E135 8A36C 8B19C 8B68C 8BE5A
res(r):
        :: DUP %0< case SETSIZEERR               * 4AFEF
          PUTRES ;                               * 4B008

* % ->
* refs (6): 1E13F 48EDC 4B008 B55D4 B55E8 B55F7
PUTRES:
        :: BINT4 PutBackPPAR(_,s) ;              * 4B012

* refs (6): 4681F 4E906 A9E61 B6003 B6035 D4118
RclAx*s:
        :: BINT5 GETPARAM ;                      * 4B026

* refs (2): 1E0CD D41E0
ax*s(c):
        :: BINT3 PutBackPPAR(_,s) ;              * 4B03A

* refs (1): 1E0D7
ax*s(li):
        :: OBJ_4502E ;                           * 4B04E
        NIBHEX  00000                            * 4B05D  ..

* -> name
* refs (24): 0C7CB 45ED3 48184 48D97 48F4F 4906C ...
GETPTYPE:
        :: BINT6 GETPARAM ;                      * 4B062

* name ->
* refs (43): 20142 45F00 481C0 48FCC 4ABDA 4ABF8 ...
PUTPTYPE:
        :: BINT2 PutBackPPAR(_,s) ;              * 4B076

* refs (5): 4ADC9 4B111 4B125 4B16B 4B18E
RclPmin:
        :: BINT1 GETPARAM ;                      * 4B08A

* refs (10): 1E08D 47C59 4ADA6 4AF45 4B17F 4B1A2 ...
pmin(c):
        :: BINT7 PutBackPPAR(_,s) ;              * 4B09E

* refs (5): 4ADD3 4B13E 4B152 4B1B1 4B1D4
RclPmax:
        :: BINT2 GETPARAM ;                      * 4B0B2

* refs (10): 1E0AD 47C5E 4AD9C 4AF3B 4B1C5 4B1E8 ...
pmax(c):
        :: BINT6 PutBackPPAR(_,s) ;              * 4B0C6

* -> C% C%
* refs (15): 47740 4ACE8 4B256 4B56C 4B5C6 4C59E ...
GETPMIN&MAX:
        :: Chk&BreakPPAR 5DROP DUP TYPECMP? NOT?INVPPAR OVER TYPECMP? * 4B0DA
          NOT?INVPPAR ;                          * 4B102

* -> %
* refs (4): 452CC 452E0 4908F B54A8
GETXMIN:
        :: RclPmin C>Re% ;                       * 4B10C

* -> %
* refs (3): 454E8 454FC B5548
GETYMIN:
        :: RclPmin C%>% SWAPDROP ;               * 4B120

* -> %
* refs (4): 45303 49094 B5467 B54AD
GETXMAX:
        :: RclPmax C>Re% ;                       * 4B139

* -> %
* refs (1): B554D
GETYMAX:
        :: RclPmax C%>% SWAPDROP ;               * 4B14D

* % ->
* refs (1): 47A33
PUTXMIN:
        :: RclPmin C%>% SWAPDROP %>C% pmin(c) ;  * 4B166

* % ->
* refs (2): 47A5B 495C9
PUTYMIN:
        :: RclPmin C%>% DROPSWAP %>C% pmin(c) ;  * 4B189

* % ->
* refs (1): 47A38
PUTXMAX:
        :: RclPmax C%>% SWAPDROP %>C% pmax(c) ;  * 4B1AC

* % ->
* refs (1): 47A60
PUTYMAX:
        :: RclPmax C%>% DROPSWAP %>C% pmax(c) ;  * 4B1CF

RclPdim:
        :: GBUFF size(go) ;                      * 4B1F2

* refs (1): 1E210
pdim(2c):
        :: OBJ_46152 SWAP2C%>% ORDERXY% %>C% 3UNROLL %>C% SWAP 2DUP * 4B206
          swap;-(2c);c->r DUP %%0= 3PICK %%0= ORcase SETSIZEERR * 4B233
          GETPMIN&MAX swap;-(2c);c->r ROTSWAP %%/ 3UNROLL %%/ RclMaxStdPict * 4B256
          #1- UNCOERCE%% 4ROLL %%* %%>% COERCE #1+ 3UNROLL #1- UNCOERCE%% * 4B279
          %%* %%>% COERCE #1+ MAKEPICT# pmax(c) pmin(c) ; * 4B2AB

* refs (2): 4B233 4B25B
swap;-(2c);c->r:
        :: SWAP2C%>% ROTSWAP %- %>%% 3UNROLL %- %>%% ; * 4B2D3

* refs (1): 1E21A
pdim(2b):
        :: HXS># SWAP HXS># SWAP MAKEPICT# ;     * 4B300

* #w #h ->
* refs (3): 45F0A 4B2BF 4B319
MAKEPICT#:
        :: SWAP # 800 OVER #< case SETSIZEERR    * 4B323
          OBJ_5121F KILLGDISP MAKEGROB GROB>GDISP ; * 4B34B

* # -> ob
* refs (7): 4AF6D 4AFA9 4AFE5 4B030 4B06C 4B094 ...
GETPARAM:
        :: CHECKPVARS SWAP NTHCOMPDROP ;         * 4B364

* refs (2): 4AF95 4AFD1
ChkPut('PPAR',li,s):
        :: ROMPTR 0F1 03C ;                      * 4B37D

* refs (1): 8D02B
ChkPut('PPAR',li,s)~2:
        :: DROP DUPTYPEIDNT? NcaseTYPEERR OVER   * 4B392
          PPAR(s);dup;li? ITE                    * 4B3AB
          :: ICMPDRPRTDRP THREE{}N ; DROP        * 4B3B5
          BINT8 ROT#- PutBackPPAR(_,s) ;         * 4B3CE

* refs (1): 8D03A
ChkPut('PPAR',li,s)~3:
        :: DROP DUPTYPEREAL? 3PICK TYPEREAL? AND NcaseTYPEERR 3PICK * 4B3E2
          PPAR(s);dup;li? ?CARCOMP 3UNROLL ChkPut('PPAR',li,s)~4 ; * 4B40A

* refs (7): 45060 45092 4654F 4B3AB 4B40A B60C6 ...
PPAR(s);dup;li?:
        :: CHECKPVARS SWAP NTHCOMPDROP DUPTYPELIST? ; * 4B423

* refs (1): 4B419
ChkPut('PPAR',li,s)~4:
        :: THREE{}N BINT8 ROT#- PutBackPPAR(_,s) ; * 4B441

* refs (1): 4C58F
sort(2r):
        :: %MAXorder SWAP ;                      * 4B45F

* refs (1): 6B443
OBJ_4B473:
        :: TakeOver REPEATERCH BINT11 OBJ_0C758 ; * 4B473

* refs (1): 6B44A
OBJ_4B491:
        :: TakeOver REPEATERCH BINT16 OBJ_6F810 ; * 4B491

* refs (1): 6B451
OBJ_4B4AF:
        :: TakeOver REPEATERCH BINT17 OBJ_6F85B ; * 4B4AF

* refs (1): 6B458
OBJ_4B4CD:
        :: TakeOver REPEATERCH BINT18 OBJ_4618C ; * 4B4CD

* refs (3): 48A1C 4BB6B 4BE6D
OBJ_4B4EB:
        :: ERROR@ #0=case ExitAtLOOP             * 4B4EB
          18GETLAM ABND ABND RESETDEPTH INDEPVAR ?PURGE_HERE ERRJMP ; * 4B4FF

* refs (1): 4A9FB
CHECKPVARS~2:
        :: BINT4 EQUAL NOT?INVPPAR OBJ_4C6E3 OBJ_4EF0A ; * 4B527
        BSS     9                                * 4B54A

* refs (3): 1E15F 47B14 4812F
VSCALE:
        :: DUP %0> NcaseSIZEERR RclCenter        * 4B553
          GETPMIN&MAX C%>% 5PICK %* %>C% pmax(c) C%>% 4ROLL %* %>C% pmin(c) * 4B56C
          centr(c) ;                             * 4B5A3

* refs (3): 1E17F 47B23 48107
HSCALE:
        :: DUP %0> NcaseSIZEERR RclCenter        * 4B5AD
          GETPMIN&MAX C%>% SWAP 5PICK %* SWAP%>C% pmax(c) C%>% SWAP4ROLL %* * 4B5C6
          SWAP%>C% pmin(c) centr(c) ;            * 4B5F8

* ->
* refs (5): 1E269 20151 4DAB2 8B812 B6358
DOERASE:
        :: GBUFF ZEROZERO ~3PICK;GROBDIM SWAP GROB!ZERODRP ; * 4B60C

* refs (2): 4C62A 7387D
~1stArgb(ex);SYMBN:
        :: 1stArgb(ex) SYMBN ;                   * 4B62F

* refs (1): 041C5
~IT;ShowInvRomp:
        :: IT ShowInvRomp                        * 4B643
        ;                                        * 4B652
        NIBHEX  00000                            * 4B657  ..

* refs (3): 1E19A 20156 4C305
draw:
        :: GDISPCENTER TURNMENUOFF GETPTYPE DUP ~BINT1;PTYPE>PINFO IT * 4B65C
          :: EVAL NOT?SEMI                       * 4B67F
            ~BINT2;PTYPE>PINFO;DROP RDROP EVAL ; * 4B68E
          DROP PLOTPREP DROP draw~1 ABND ABND ;  * 4B6A2

* refs (9): 8C894 8C964 8CA93 8CBD7 8CCBB 8CD9F ...
~';PlotEval:
        :: ' PlotEval ;                          * 4B6C5

* refs (1): 4C535
PLOTERR:
        :: ERROR@ #0=case ExitAtLOOP             * 4B6D9
          18GETLAM ABND ABND RESETDEPTH PurgePlotVars ERRJMP ; * 4B6ED

* ob1..obn obn+1..obx #n -> ob1..obn
* refs (22): 48A30 4B50E 4B6FC 4BB84 4BE86 4C54E ...
RESETDEPTH:
        :: DEPTH #1-SWAP #-Floor0 NDROP CK0NOLASTWD ; * 4B710

* refs (2): 4C62F 73882
~1stArgRpn(ex);SYMBN:
        :: 1stArgRpn(ex) SYMBN ;                 * 4B733

* refs (2): 4BBC5 4EDCF
OBJ_4B747:
        :: OBJ_50D02 ~DUP;ALGeq? IT GETRHS       * 4B747
        ;                                        * 4B760

* refs (3): 488BE 4B6A7 8A4EB
PLOTPREP:
        :: StatPlotMo case                       * 4B765
          :: rclä! DROPONE OBJ_4A874 ;           * 4B774
          DORCLE DUP EqList? ITE LENCOMP DROPONE * 4B78D
          OBJ_6FFFD OVER TYPEREAL? NOT?SEMI      * 4B7AB
          OVER %0< case SETINVPPAR               * 4B7BF
        ;                                        * 4B7D3

* refs (5): 488EB 4B80A 4B9A4 4D1BE 8B7AE
GetRes:
        :: DUP TYPEHSTR? case                    * 4B7D8
          :: HXS># DUP#0= casedrop               * 4B7EC
            :: %0_2A2B4 GetRes ;                 * 4B800
            UNCOERCE%% %%1 10GETLAM %%/ %%* %%>% ; * 4B814
          DUP %0<> ?SEMIDROP                     * 4B837
          11GETLAM ~BINT9;PTYPE>PINFO case EVAL  * 4B846
          %%1 10GETLAM %%/>% ;                   * 4B85A

* refs (1): 6B489
~EXITFCNsto;ERRJMP:
        :: EXITFCNsto ERRJMP ;                   * 4B86E

* refs (1): 6D195
OBJ_4B882:
        :: SKIP 2DROP OBJ_67DFC LENHXS #5= ITE BINT3 BINT4 * 4B882
          #=case OBJ_6E00B                       * 4B8AF
        ;                                        * 4B8B9

* refs (1): 6D89B
OBJ_4B8BE:
        :: SKIP OBJ_6F40F BINT3 #=casedrop       * 4B8BE
          :: BINT1 OBJ_67E0C EqwBoxSecond@ OBJ_68593 EqwCurBox@ #1+ * 4B8D7
            OBJ_67443 EqwBoxPrev@ OBJ_6D779 OBJ_44C4B EqwBoxObj! ; * 4B8FA
          BINT5 OBJ_6E113 ;                      * 4B918

* refs (1): 3FE3A
H/WKey>KeyOb~1:
        :: EVAL BINT7 GETDF EQLookup DROP ;      * 4B927

* refs (1): 54698
~DOBIND;CK0NOLASTWD:
        :: DOBIND CK0NOLASTWD ;                  * 4B94A

* refs (1): 6CB93
OBJ_4B95E:
        GROB    "images/4B95E.png"               * 4B95E  3 x 6

* refs (1): 6D492
OBJ_4B97E:
        GROB    "images/4B97E.png"               * 4B97E  6 x 6
        NIBHEX  0                                * 4B99E

* refs (1): 4B6B1
draw~1:
        :: GetRes 4PUTLAM 11GETLAM ~BINT2;PTYPE>PINFO;DROP EVAL ; * 4B99F

* refs (5): 21092 4BC3D 4BD41 4C33C 4C5EE
rcl(nm)?;drop:
        :: DRPExitAtLOOP DROP ;                  * 4B9C2

* refs (3): 488F5 4BB07 5192E
OBJ_4B9D6:
        :: INDEPVAR SAFE@_HERE NOT?SEMI          * 4B9D6
          DUPTYPEEXT? NOTcaseDROP %1             * 4B9EA
          SWAP UM>U 19PUTLAM ;                   * 4B9F9

* refs (1): 8CA20
OBJ_4BA0D:
        :: BINT31 TestSysFlag ITE                * 4BA0D
          :: ' OBJ_4CDD9 ;                       * 4BA21
          :: ' OBJ_4C382 ;                       * 4BA35
          3PUTLAM COLA OBJ_4BAAD                 * 4BA49
        ;                                        * 4BA58

* refs (1): 8C821
OBJ_4BA5D:
        :: BINT31 TestSysFlag ITE                * 4BA5D
          :: ' OBJ_4CE0B ;                       * 4BA71
          :: ' PlotFcnPt ;                       * 4BA85
          3PUTLAM COLA OBJ_4BAAD                 * 4BA99
        ;                                        * 4BAA8

* refs (3): 4BA53 4BAA3 4BEE5
OBJ_4BAAD:
        :: DUP#1= IT                             * 4BAAD

* refs (2): 4692D 4BF94
OBJ_4BABC:
          :: rceq! ~DUP;ALGeq? NOTcaseDROP ~1stArgb(ex);::N * 4BABC
            DUPLENCOMP #1= NOTcase2drop BINT2    * 4BAD5
            INCOMPDROP TYPEIDNT? ?SEMI           * 4BAE9
            DROP BINT2 ;                         * 4BAF8
          OBJ_4B9D6 OBJ_4C314 ZERO_DO ERRSET     * 4BB07
          :: 15GETLAM 17GETLAM NEWINDEP OBJ_4ED70 19GETLAM TYPEEXT? ITE * 4BB1B
            OBJ_4BC06 OBJ_4C12A                  * 4BB43
            BINT28 TestSysFlag IT ExitAtLOOP     * 4BB4D
          ;                                      * 4BB61
          ERRTRAP OBJ_4B4EB ~ATTNFLG@;#0=?SEMI;ExitAtLOOP LOOP ATTNFLGCLR * 4BB66
          18GETLAM RESETDEPTH INDEPVAR ?PURGE_HERE ; * 4BB7F

* refs (1): 4EDA2
OBJ_4BB98:
        :: ISTOP@ OBJ_4A96E ZERO_DO ' ' OBJ_4BF71 ITE OBJ_4C616 OBJ_4B747 * 4BB98
          OBJ_4BEEF BINT6 ::N LOOP ISTOP@ #3+ ::N 2PUTLAM ; * 4BBCA
        BSS     15                               * 4BBF7

* refs (2): 48A08 4BB43
OBJ_4BC06:
        :: 15GETLAM TOTEMPOB 19GETLAM INDEPVAR DUP PURGE 3UNROLL UM>U OVER * 4BC06
          CREATE rcl(nm)?;drop 19PUTLAM BEGIN 2GETLAM EVAL NEXTSTEP * 4BC38
          OBJ_4C111 LASTPT? UNTIL PlotOneMore? NOT?SEMI * 4BC5B
          2GETLAM EVAL ;                         * 4BC74

* refs (1): 8C94B
OBJ_4BC83:
        :: OBJ_4C314 ZERO_DO ERRSET              * 4BC83
          :: uncrunch                            * 4BC97
            :: 15GETLAM 17GETLAM NEWINDEP OBJ_50D02 DUPTYPESYMB? NOTcase * 4BCA1
              doerr607                           * 4BCC4
              BINT31 TestSysFlag ITE             * 4BCC9
              :: ' OBJ_4C7D3 ;                   * 4BCD8
              :: ' OBJ_4C846 ;                   * 4BCEC
              3PUTLAM ~RclDepnd;1get(li)? INDEPVAR DUP 15PUTLAM OBJ_5956F * 4BD00
              15GETLAM STO OBJ_591E9 17GETLAM 15GETLAM XEQSTOID 15GETLAM * 4BD1E
              rcl(nm)?;drop 15PUTLAM ITE         * 4BD41
              :: BINT2 OBJ_4A96E DROP DUP OBJ_513D7 SWAP OBJ_513FF ' * 4BD50
                15GETLAM ' GETXPOS ' 1PUTLAM 4ROLL OBJ_4BEEF SWAPDROP * 4BD7D
                ONESWAP 4ROLLDROP BINT1 4UNROLL BINT9 ROLL OBJ_4BEEF * 4BDA5
                SWAPDROP BINT2 SWAP 4ROLLDROP BINT2 4UNROLL BINT13 ; * 4BDC8
              :: BINT1 OBJ_4A96E DROP ' 15GETLAM ' GETXPOS ' 1PUTLAM 4ROLL * 4BDF0
                OBJ_4BEEF SWAPDROP ONESWAP 4ROLLDROP BINT1 4UNROLL BINT8 ; * 4BE27
              ::N 2PUTLAM OBJ_4C12A ;            * 4BE4F
          ;                                      * 4BE63
          ERRTRAP OBJ_4B4EB ~ATTNFLG@;#0=?SEMI;ExitAtLOOP LOOP ATTNFLGCLR * 4BE68
          18GETLAM RESETDEPTH INDEPVAR ?PURGE_HERE ; * 4BE81
        NIBHEX  00000                            * 4BE9A  ..

* refs (1): 8CB64
OBJ_4BE9F:
        :: BINT31 TestSysFlag ITE                * 4BE9F
          :: ' OBJ_4C3B9 ;                       * 4BEB3
          :: ' OBJ_4C3E6 ;                       * 4BEC7
          3PUTLAM COLA OBJ_4BAAD                 * 4BEDB
        ;                                        * 4BEEA

* refs (4): 4BBCA 4BD9B 4BDC3 4BE27
OBJ_4BEEF:
        :: INDEX@ #1+ BINT31 TestSysFlag ITE     * 4BEEF
          :: '                                   * 4BF0D
            :: DROP COLA PlotEval                * 4BF17
            ;                                    * 4BF2B
          ;                                      * 4BF30
          :: ' OBJ_4EF73 ;                       * 4BF35
          INDEX@ #1+ 3GETLAM ;                   * 4BF49

* refs (2): 4D3B7 4D6D2
OBJ_4BF5D:
        :: IT OBJ_0C7F3                          * 4BF5D
        ;                                        * 4BF6C

* refs (3): 4BBB6 4EDC0 7384B
OBJ_4BF71:
        :: EQUATION NOTcase FALSE                * 4BF71
          TYPELIST? caseFALSE BINT1              * 4BF85
          OBJ_4BABC #1=case FALSE                * 4BF94
          TRUE ;                                 * 4BFA3
        NIBHEX  0                                * 4BFAD

* refs (3): 4BC56 4C13E 4C50D
NEXTSTEP:
        :: 15GETLAM DUP 4GETLAM %+ 2DUP %= IT    * 4BFAE
          :: DUP NEXTSTEP~1 DUP 4PUTLAM %+ ;     * 4BFD6
          NEWINDEP ;                             * 4BFF9

* refs (1): 4BFE0
NEXTSTEP~1:
        :: DUP%0= casedrop                       * 4C003
          :: %10                                 * 4C012

%4.99E2:
            % 4.99E2 %CHS %^ ;                   * 4C01C
          %EXPONENT %11 %-                       * 4C040

%4.99E2_4C04F:
          % 4.99E2 %CHS %MAX %10 SWAP %^ ;       * 4C04F
