* HP 48GX ROM revision R, #4C082-#4F0AB: Plotting
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: CHECKMENU CROSS_OFF CROSS_HAIRS PPAR>ZPAR EXITFCNsto NEWINDEP CROSSMARKOFF ClrLastPt CROSSMARKON TURNMENUOFF PurgePlotVars PlotFcnPt
* Follows on from the previous file (at #4C082 in the original ROM).
        RPL

* refs (6): 48A21 4BB70 4BE72 4C53A 4C930 4CCE4
~ATTNFLG@;#0=?SEMI;ExitAtLOOP:
        :: ATTNFLG@ #0=?SEMI ExitAtLOOP ;        * 4C082

* refs (15): 4695A 48CD8 49261 49E84 4BB2A 4BCB0 ...
NEWINDEP:
        CON(5)  (*)+5                            * 4C09B  primitive code object
        ASSEMBLE
        GOSUB   SUB_4C0BE                        * 4C0A0
L_4C0A4:
        DAT1=A  W                                * 4C0A4
        GOSBVL  GETPTR                           * 4C0A8
        D1=D1+  5                                * 4C0AF
        D=D+1   A                                * 4C0B2
        A=DAT0  A                                * 4C0B4
        D0=D0+  5                                * 4C0B7
        PC=(A)                                   * 4C0BA

* refs (2): 4C0A0 4C0D9
SUB_4C0BE:
        GOSBVL  POP1%                            * 4C0BE
        P=      0                                * 4C0C5
        SETHEX                                   * 4C0C7
        C=DAT1  A                                * 4C0C9
        D1=C                                     * 4C0CC
        D1=D1+  5                                * 4C0CF
        RTN                                      * 4C0D2

* refs (2): 4925C 4C120
OBJ_4C0D4:
        CON(5)  (*)+5                            * 4C0D4  primitive code object
        GOSUB   SUB_4C0BE                        * 4C0D9
        D1=D1+  5                                * 4C0DD
        GOTO    L_4C0A4                          * 4C0E0
        RPL

* refs (11): 48B2A 4B701 4C553 8A656 8A665 8B2C0 ...
* -> : after DRAW, purge the independent variable it created (and the dependent one for some plot types)
PurgePlotVars:
        :: INDEPVAR ?PURGE_HERE GETPTYPE ~BINT11;PTYPE>PINFO;NOTcaseFALSE * 4C0E4
          NOT?SEMI                               * 4C0FD
          ~RclDepnd;1get(li)? ?PURGE_HERE ;      * 4C102

* refs (1): 4BC5B
OBJ_4C111:
        :: 19GETLAM 15GETLAM OBJ_4C0D4 ;         * 4C111

* refs (8): 48A0D 4BB48 4BE59 8A598 8B224 8B29D ...
OBJ_4C12A:
        :: BEGIN 2GETLAM EVAL NEXTSTEP LASTPT? UNTIL PlotOneMore? NOT?SEMI * 4C12A
          2GETLAM EVAL ;                         * 4C157

* refs (2): 4C508 4C526
OBJ_4C166:
        :: 3GETLAM 1GETLAM NEWINDEP BEGIN 2GETLAM * 4C166
          :: PlotEval DUPTYPEREAL? IT            * 4C184
            :: %0= ?SEMI                         * 4C198
              15GETLAM GETXPOS 3GETLAM GETYPOS PIXON3 ; * 4C1A7
          ;                                      * 4C1C5
          3GETLAM DUP 19GETLAM %- NEWINDEP OBJ_4C1F2 UNTIL ; * 4C1CA

* refs (1): 4C1E3
OBJ_4C1F2:
        :: 1GETLAM 3GETLAM %< caseTRUE 3GETLAM   * 4C1F2
          12GETLAM %< caseTRUE ATTNFLG@          * 4C210
          #0<> ;                                 * 4C224

* refs (13): 48A62 4C25B 4C35F 4C396 4C3CD 4C3FF ...
* #i -> : break curve i (store -1 as its last point, so the next one is not joined)
ClrLastPt:
        :: 20GETLAM %-1 ROT PUTEL DROP ;         * 4C22E

* refs (2): 513B4 8B298
~BINT1;ClrLastPt:
        :: BINT1 ClrLastPt ;                     * 4C251

* refs (4): 4C378 4C3AF 4C413 4C8A5
OBJ_4C265:
        :: 20GETLAM 4PICK PULLREALEL SWAPDROP %-1=case * 4C265
          :: DROP OBJ_4C440 ;                    * 4C283
          COERCE 21GETLAM 5PICK PULLREALEL SWAPDROP COERCE 4PICK 4PICK * 4C297
          DRAWLINE#3 OBJ_4C440 ;                 * 4C2BF

* refs (3): 48FEF 4DAB7 B639E
OBJ_4C2CE:
        :: GDISPCENTER TURNMENUOFF GETPTYPE ~BINT4;PTYPE>PINFO;NOTcaseFALSE * 4C2CE
          BINT29                                 * 4C2E7
          TestSysFlag NOT AND IT drax            * 4C2EC
          draw OBJ_4DA3F ;                       * 4C305

* refs (11): 488FA 48B2F 4BB0C 4BC88 4C4BD 57285 ...
* Probably: create the independent variable for plotting in the current directory and point lam 15 at the stored copy
OBJ_4C314:
        :: 15GETLAM 17GETLAM NEWINDEP INDEPVAR 15GETLAM OVER CREATE * 4C314
          rcl(nm)?;drop 15PUTLAM ;               * 4C33C

* refs (11): 4BA8F 8B794 8C8CB 8C99B 8CACA 8CC0E ...
* %y #i -> : FUNCTION plot: plot y of curve i at the current x, joined to the last point; a non-real y breaks the curve
PlotFcnPt:
        :: SWAP DUPTYPEREAL? NOTcasedrop ClrLastPt * 4C34B
          GETYPOS 1GETLAM SWAP2DUP PIXON3 OBJ_4C265 ; * 4C364

* refs (1): 4BA3F
OBJ_4C382:
        :: SWAP DUPTYPEREAL? NOTcasedrop ClrLastPt * 4C382
          15GETLAM PtoR 2DUP PIXON3 OBJ_4C265 ;  * 4C39B

* refs (1): 4BEBD
OBJ_4C3B9:
        :: SWAPDUP TYPECMP? NOTcasedrop ClrLastPt * 4C3B9
          OBJ_4C41D PIXON3 DROP ;                * 4C3D2

* refs (3): 4BED1 8A4D2 8B1E2
OBJ_4C3E6:
        :: SWAP DUP TYPECMP? NOTcasedrop ClrLastPt * 4C3E6
          OBJ_4C41D 2DUP PIXON3 OBJ_4C265 ;      * 4C404

* refs (2): 4C3D2 4C404
OBJ_4C41D:
        :: C%>% SWAP GETXPOS SWAP GETYPOS ;      * 4C41D

* refs (5): 48A8A 48AD5 48B1B 4C28D 4C2C4
OBJ_4C440:
        :: 21GETLAM SWAP UNCOERCE 4PICK PUTEL DROP 20GETLAM SWAP UNCOERCE * 4C440
          ROT PUTEL DROP ;                       * 4C472

* refs (2): 1E1D0 4C300
drax:
        :: CHECKPICT BINT0 OBJ_4A874 ROTDROP drax_4C639 DROP ABND ABND ; * 4C486

* refs (1): 8CCA2
OBJ_4C4B8:
        :: OBJ_4C314 OBJ_4C55D ZERO_DO ERRSET    * 4C4B8
          :: 15GETLAM 17GETLAM NEWINDEP OBJ_50D02 DUP ALGeq? case doerr607 * 4C4D1
            2PUTLAM BEGIN OBJ_4C166 NEXTSTEP LASTPT? UNTIL PlotOneMore? * 4C4FE
            NOT?SEMI                             * 4C521
            OBJ_4C166 ;                          * 4C526
          ERRTRAP PLOTERR ~ATTNFLG@;#0=?SEMI;ExitAtLOOP LOOP ATTNFLGCLR * 4C530
          18GETLAM RESETDEPTH PurgePlotVars ;    * 4C549

* refs (1): 4C4C2
OBJ_4C55D:
        :: RclDepnd DUPTYPELIST? ITE             * 4C55D
          :: INCOMPDROP SWAP DUPTYPEARRY? IT DROP%0b * 4C571
            sort(2r) ;                           * 4C58F

RclYminYmax:
          :: GETPMIN&MAX C%>% SWAPDROP SWAP C%>% SWAPDROP SWAP ; * 4C599
          DUP 1PUTLAM TOTEMPOB 3PICK CREATE OBJ_6FFB7 %- 12PUTLAM * 4C5C6
          rcl(nm)?;drop 3PUTLAM ;                * 4C5EE

* refs (1): 6C87D
2/(s);swap;2/(s):
        :: #2/ SWAP #2/ ;                        * 4C5FD

* refs (2): 4BBC0 4EDCA
OBJ_4C616:
        :: rceq! INDEX@ #0=ITE ~1stArgb(ex);SYMBN ~1stArgRpn(ex);SYMBN ; * 4C616

* refs (1): 4C49F
drax_4C639:
        :: RclMaxStdPict drax~1 ;                * 4C639

* refs (5): 45083 451AA 465D6 4EF0F D410E
OBJ_4C64D:
        :: DUPTYPEREAL? OVER TYPEHSTR? OR OVER TYPELIST? OR NOTcasedrop * 4C64D
          FALSE                                  * 4C67A
          DUPTYPELIST? NOTcasedrop TRUE          * 4C67F
          INNERCOMP DUP #2= NOTcase              * 4C68E
          :: NDROP FALSE ;                       * 4C6A2
          DROP DUPTYPEREAL? casedrop TYPEREAL?   * 4C6B6
          TYPEHSTR? SWAP TYPEHSTR? AND ;         * 4C6CA

* refs (2): 4A9E7 4B53B
OBJ_4C6E3:
        :: TYPECSTR? NOT?INVPPAR TYPECSTR? NOT?INVPPAR ; * 4C6E3

* refs (1): 4A8A6
OBJ_4C701:
        :: DUPTYPELIST? NOT?SEMI                 * 4C701
          INNERCOMP BINT2 EQcase {}N             * 4C710
          BINT3 EQUAL case2DROP 2DROP            * 4C724
          TWO{}N ;                               * 4C738

* refs (2): 4536C 4542F
drax~4:
        :: 2DUP DUP 6ROLL #1- #=?SKIP #1+ PIXON3 DUP#0= ?SKIP #1- * 4C742
          PIXON3 ;                               * 4C779

* refs (2): 4556A 45628
drax~5:
        :: 2DUP SWAPDUP 6PICK #1- #=?SKIP #1+ SWAP PIXON3 SWAP DUP#0= ?SKIP * 4C783
          #1-                                    * 4C7BF
          SWAP PIXON3 ;                          * 4C7C4

* refs (1): 4BCE2
OBJ_4C7D3:
        :: SWAPDUP TYPECMP? ITE                  * 4C7D3
          :: C%>% %0= ; TRUE                     * 4C7E7
          case                                   * 4C800
          :: DUPTYPEREAL? NOTcasedrop ClrLastPt  * 4C805
            GETYPOS 1GETLAM SWAP PIXON3 DROP ;   * 4C819
          DROP ClrLastPt ;                       * 4C837

* refs (1): 4BCF6
OBJ_4C846:
        :: SWAP DUP TYPECMP? ITE                 * 4C846
          :: C%>% %0= ; TRUE                     * 4C85F
          case                                   * 4C878
          :: DUPTYPEREAL? NOTcasedrop ClrLastPt  * 4C87D
            GETYPOS 1GETLAM SWAP2DUP PIXON3 OBJ_4C265 ; * 4C891
          DROP ClrLastPt ;                       * 4C8AF

* refs (3): 4BCC4 4C4F9 B63EE
doerr607:
        CON(5)  (*)+5                            * 4C8BE  primitive code object
        ASSEMBLE
        LC(5)   #00607                           * 4C8C3
        GOVLNG  ErrjmpC                          * 4C8CA
        RPL

* refs (1): 8CD81
OBJ_4C8D1:
        :: RclXYCol&äDAT DUP MDIMSDROP 5UNROLL #1+_ONE_DO OVER PULLREALEL * 4C8D1
          GETYPOS SWAP4PICK PULLREALEL GETXPOS ROT PIXON3 ROT 4PICK#+ ROT * 4C8F9
          4PICK#+ ROT ~ATTNFLG@;#0=?SEMI;ExitAtLOOP LOOP 4DROP ; * 4C926

* refs (3): 20122 4D9BB B7ED7
bins(3r):
        :: %CEIL COERCE DUP # FFFFD #> case SETSIZEERR * 4C944
          2DUP UNCOERCE %* 4PICK %+ OVER         * 4C971

{'xmax,'N}:
          {                                      * 4C98F

Π'xmax:
            LAM 'xmax                            * 4C994

Π'N:
            LAM 'N }                             * 4C9A5
          BIND %0_2A2B4 SWAP #2+ NDUPN #1-DUP #3+ ROLL OVER #4+ ROLL * 4C9B5
          bins(3r)~1 ABND bins(3r)~2 ;           * 4C9EC

* refs (1): 4C9EC
bins(3r)~1:
        :: STATGETXCOL rclä DUP MDIMS ITE        * 4CA00
          :: DUP UNCOERCE 5PICK %< case OBJ_2D2E7 * 4CA1E
            4UNROLLROT COERCE 3UNROLL ;          * 4CA41
          :: ROTDROP BINT1 3UNROLL BINT1 3UNROLL ; * 4CA55
          #1+_ONE_DO OVER PULLREALEL 5PICK 7PICK bins(3r)~3 6UNROLL * 4CA78
          SWAP3PICK #+SWAP LOOP MDIMS IT DROP    * 4CA9B
          5UNROLL 4DROP ;                        * 4CAB9
        BSS     10                               * 4CAC8

* refs (1): 4C9F6
bins(3r)~2:
        :: ZERO_DO ISTOP-INDEX DUP #2+PICK ROT2DUP #<ITE * 4CAD2
          :: 2DROP BINT0 ; #- #+ #1+DUP #1+ROLL %1+ SWAP UNROLL LOOP * 4CAF5
          DUPUNROT #1+UNROLL #1- UNCOERCE %1 TWO{}N XEQ>ARRAY 3UNROLL %2 * 4CB31
          XEQ>VECTOR ;                           * 4CB5E

* refs (2): 4D9C5 4D9F7
OBJ_4CB68:
        :: 15GETLAM 6GETLAM 10GETLAM getxpos SWAP #0= OVER #0<> ANDcase * 4CB68
          ERRJMP                                 * 4CB9A
          4GETLAM 10GETLAM %%>% %* ROT 4ROLL DUP MDIMSDROP 4UNROLL ZERO_DO * 4CB9F
          OVER PULLREALEL DUP %0_2A2B4 %< 3UNROLL 5GETLAM 9GETLAM getypos * 4CBD1
          SWAP #0= IT DROPZERO                   * 4CBFE
          DUP 5GETLAM %%>% COERCE 2DUP#> ?SKIPSWAP #- 4ROLL IT * 4CC12
          :: SWAPDROP 5GETLAM %%>% COERCESWAP ;  * 4CC3F
          INDEX@ DUP#1+ UNCOERCE2                * 4CC5D

* refs (1): 4CC99
OBJ_4CC6C:
          :: 8PICK %* COERCE BINT9 PICK #+ ; SWAP OBJ_4CC6C DUP 5UNROLL * 4CC6C
          #-DUP #>1 IT                           * 4CCA8
          :: #1- 4ROLL #1+ 4UNROLL ;             * 4CCB7
          OBJ_4CCF8 SWAP3PICK #+SWAP ~ATTNFLG@;#0=?SEMI;ExitAtLOOP LOOP * 4CCD5
          5DROP ;                                * 4CCEE

* refs (1): 4CCD5
OBJ_4CCF8:
        :: OVER #0=case 4DROP                    * 4CCF8
          GBUFFGROBDIM 6PICK OVER#< NOTcase      * 4CD0C
          :: 6DROP ExitAtLOOP ;                  * 4CD20
          5PICK 3PICK #< NOTcase 6DROP           * 4CD34
          OVER5PICK 7PICK #+ #< IT               * 4CD4D
          :: 4ROLLDROP OVER5PICK #- 4UNROLL ;    * 4CD66
          DUP 4PICK 8PICK #+ #<ITE               * 4CD84
          :: ROTROT2DROP 4PICK #- ; 2DROP MAKEGROB INVGROB GBUFF 2SWAP GROB! ; * 4CD9D

* refs (1): 4BA2B
OBJ_4CDD9:
        :: SWAP DUPTYPEREAL? NOTcasedrop ClrLastPt * 4CDD9
          15GETLAM PtoR PIXON3 DROP ;            * 4CDF2

* refs (10): 4BA7B 8C8B7 8C987 8CAB6 8CBFA 8CCDE ...
OBJ_4CE0B:
        :: SWAP DUPTYPEREAL? NOTcasedrop ClrLastPt * 4CE0B
          SWAPDROP GETYPOS 1GETLAM SWAP PIXON3 ; * 4CE24
        BSS     10                               * 4CE42

* refs (16): 46C0C 48FEA 4B873 4D10F 4D4AC 4DA94 ...
EXITFCNsto:
        :: TakeOver 'R ' ExitFcn STO ;           * 4CE4C

* ->
* refs (1): 4F036
DOGRAPHIC:
        :: GDISPCENTER OBJ_4CE83 ;               * 4CE6F

* refs (5): 4CE79 4D4B1 6A8D3 6B547 6C393
OBJ_4CE83:
        :: TURNMENUOFF OBJ_46BA7 'NOP ' OBJ_4CF8E TrueTrue NULL{} ONEFALSE' * 4CE83
          GraphicExit '                          * 4CEB0
          :: ClrDAsOK ERRJMP ; ClrDA1IsStat ParOuterLoop COLA OBJ_5108F * 4CEBA
        ;                                        * 4CEE2

* refs (4): 45AF5 4CEB0 69C1E 73275
GraphicExit:
        :: ExitFcn 'NOP EQ NOT ;                 * 4CEE7

* ->
* refs (7): 488B4 48A3F 4B661 4C2D3 4CE74 4DA44 ...
GDISPCENTER:
        :: CHECKPICT GBUFFGROBDIM BINT131 #-#2/ SWAP BINT64 #-#2/ SWAP * 4CF05
          TOGDISP WINDOWXY ;                     * 4CF32

SETLOOPENV:
        :: FALSE 'NOP                            * 4CF41
          {                                      * 4CF50

Π'EnvOK_4CF55:
            LAM 'EnvOK                           * 4CF55

* refs (6): 4780D 4CE60 4CEEC 51099 69C37 6B5B5
ExitFcn:
            LAM 'EXITFCN }                       * 4CF68
          BIND ;                                 * 4CF84

* refs (1): 4CE9C
OBJ_4CF8E:
        :: SWAP BINT11 #=casedrop                * 4CF8E
          :: BINT1 ?CaseKeyDef SCROLLUP BINT3 ?CaseKeyDef JUMPTOP * 4CFA2
            DROPDEADTRUE ;                       * 4CFC5
          BINT16 #=casedrop                      * 4CFCF
          :: BINT1 ?CaseKeyDef SCROLLLEFT BINT2 ?CaseKeyDef OBJ_4D0E7 BINT3 * 4CFD9
            ?CaseKeyDef JUMPLEFT DROPDEADTRUE ;  * 4D001
          BINT17 #=casedrop                      * 4D015
          :: BINT1 ?CaseKeyDef SCROLLDOWN BINT3 ?CaseKeyDef JUMPBOT * 4D01F
            DROPDEADTRUE ;                       * 4D042
          BINT18 #=casedrop                      * 4D04C
          :: BINT1 ?CaseKeyDef SCROLLRIGHT BINT3 ?CaseKeyDef JUMPRIGHT * 4D056
            DROPDEADTRUE ;                       * 4D079
          BINT45 #=casedrop                      * 4D083
          :: BINT1 ?CaseKeyDef ~EXITFCNsto;TOADISP BINT3 ?CaseKeyDef * 4D08D
            TurnOffKey DROPDEADTRUE ;            * 4D0AB
          SWAPDROP BINT35 #=casedrop FALSE       * 4D0BA
          BINT40 #=case FALSE                    * 4D0CE
          'DoBadKeyT ;                           * 4D0DD

* refs (1): 4CFF7
OBJ_4D0E7:
        :: TakeOver OBJ_6DE82 case               * 4D0E7
          :: ATTNFLGCLR ~EXITFCNsto;TOADISP ;    * 4D0FB
          EXITFCNsto OBJ_4D1AA ;                 * 4D10F

* ob -> DoBadKey T
* refs (11): 4CFC5 4D00B 4D042 4D079 4D0B0 4D7EA ...
DROPDEADTRUE:
        :: DROP 'DoBadKeyT ;                     * 4D11E

* ->
* refs (2): 4CFB1 9CF00
SCROLLUP:
        :: TakeOver REPEATER BINT11 WINDOWUP ;   * 4D132

* ->
* refs (2): 4CFE8 9CF1E
SCROLLLEFT:
        :: TakeOver REPEATER BINT16 WINDOWLEFT ; * 4D150

* ->
* refs (2): 4D02E 9CF0F
SCROLLDOWN:
        :: TakeOver REPEATER BINT17 WINDOWDOWN ; * 4D16E

* ->
* refs (2): 4D065 9CF2D
SCROLLRIGHT:
        :: TakeOver REPEATER BINT18 WINDOWRIGHT ; * 4D18C

* refs (2): 4D114 4DA4E
OBJ_4D1AA:
        :: BINT0 OBJ_6FFFD GETRES GetRes 4PUTLAM 3DROP COLA OBJ_4D1DC * 4D1AA
        ;                                        * 4D1D7

* refs (2): 48A44 4D1D2
OBJ_4D1DC:
        :: GBUFFGROBDIM #1- 14PUTLAM #1- 13PUTLAM WINDOWCORNER # 41 #+ * 4D1DC
          TOTEMPOB 8PUTLAM BINT32 #+ TOTEMPOB 7PUTLAM 16GETLAM 20PUTLAM * 4D20E
          4GETLAM 21PUTLAM BINT1 BINT27 PUTLAM BINT0 16PUTLAM ~BINT0;3PUTLAM * 4D236
          %0_2A2B4 TOTEMPOB 1PUTLAM BINT0 TOTEMPOB 4PUTLAM GETPTYPE DUP * 4D25E
          OBJ_731B7 IT ~BINT23;PUTLAM            * 4D286
          OBJ_732C2 22PUTLAM CROSS_HAIRS 1GETLAM BINT28 ONE_DO ISTOP-INDEX * 4D295
          #1+ GETLAM LOOP ABND ABND OBJ_46BA7 GETPTYPE OBJ_731F8 ' * 4D2B8
          :: DUP                                 * 4D2E5

* refs (1): 330FD
NUMSOLVE~45:
            :: BINT3 #> ; case2drop 'DoBadKeyT   * 4D2EF
            SWAP DUP#<7 case2drpfls BINT11       * 4D30D
            #=casedrop                           * 4D321
            :: BINT3 ?CaseKeyDef                 * 4D326
              :: TakeOver TraceMode? caseDoBadKey ~3GETLAM;#3= * 4D335
                caseDoBadKey WINDOWTOP?          * 4D34E
                IT JUMPTOP                       * 4D358
                BINT7 TOPROW OBJ_47021 ;         * 4D362
              BINT2 ?CaseKeyDef DoBadKey DROP'   * 4D376
              :: TakeOver TraceMode? case        * 4D38A
                :: BINT3 OBJ_735CB ;             * 4D39E
                ~16GETLAM;#1= OBJ_4BF5D ~3GETLAM;#3= case * 4D3B2
                :: OBJ_46E28 BINT11 OBJ_48238 ;  * 4D3C6
                ~3GETLAM;#0= case                * 4D3DF
                :: OBJ_46E28 BINT11 OBJ_4DCEC ;  * 4D3E9
                OBJ_46E28 BINT11                 * 4D402
                :: WINDOWTOP? IT WINDOWUP        * 4D40C
                  CROSS_OFF 7GETLAM !#1-IF>0 OBJ_4703F ; * 4D420
              ;                                  * 4D439
              TRUE ;                             * 4D43E
            BINT16 #=casedrop                    * 4D448
            :: BINT3 ?CaseKeyDef                 * 4D452
              :: TakeOver TraceMode? caseDoBadKey ~3GETLAM;#3= * 4D461
                caseDoBadKey WINDOWLEFT?         * 4D47A
                IT JUMPLEFT                      * 4D484
                LEFTCOL OBJ_4728B ;              * 4D48E
              BINT2 ?CaseKeyDef                  * 4D49D
              :: EXITFCNsto OBJ_4CE83 ; DROP'    * 4D4A7
              :: TakeOver TraceMode? case OBJ_736AC * 4D4C0
                ~16GETLAM;#1= OBJ_0C811 ~3GETLAM;#3= case * 4D4D9
                :: OBJ_46E28 BINT16 OBJ_4881E ;  * 4D4ED
                ~3GETLAM;#0= case                * 4D506
                :: OBJ_46E28 BINT16 OBJ_4DDAF ;  * 4D510
                OBJ_46E28 BINT16 OBJ_470E9 ;     * 4D529
              TRUE ;                             * 4D53D
            BINT18 #=casedrop                    * 4D547
            :: BINT3 ?CaseKeyDef                 * 4D551
              :: TakeOver TraceMode? caseDoBadKey ~3GETLAM;#3= * 4D560
                caseDoBadKey WINDOWRIGHT?        * 4D579
                IT JUMPRIGHT                     * 4D583
                RIGHTCOL OBJ_4728B ;             * 4D58D
              BINT2 ?CaseKeyDef DoBadKey DROP'   * 4D59C
              :: TakeOver TraceMode? case OBJ_736F7 * 4D5B0
                ~16GETLAM;#1= OBJ_0C811 ~3GETLAM;#3= case * 4D5C9
                :: OBJ_46E28 BINT18 OBJ_4842C ;  * 4D5DD
                ~3GETLAM;#0= case                * 4D5F6
                :: OBJ_46E28 BINT18 OBJ_4DDE6 ;  * 4D600
                OBJ_46E28 BINT18 OBJ_470B7 ;     * 4D619
              TRUE ;                             * 4D62D
            BINT17 #=casedrop                    * 4D637
            :: BINT3 ?CaseKeyDef                 * 4D641
              :: TakeOver TraceMode? caseDoBadKey ~3GETLAM;#3= * 4D650
                caseDoBadKey WINDOWBOT?          * 4D669
                IT JUMPBOT                       * 4D673
                BINT7 BOTROW OBJ_47021 ;         * 4D67D
              BINT2 ?CaseKeyDef OBJ_48873 DROP'  * 4D691
              :: TakeOver TraceMode? case        * 4D6A5
                :: BINT4 OBJ_735CB ;             * 4D6B9
                ~16GETLAM;#1= OBJ_4BF5D ~3GETLAM;#3= case * 4D6CD
                :: OBJ_46E28 BINT17 OBJ_481D9 ;  * 4D6E1
                ~3GETLAM;#0= case                * 4D6FA
                :: OBJ_46E28 BINT17 OBJ_4DD73 ;  * 4D704
                OBJ_46E28 BINT17                 * 4D71D
                :: WINDOWBOT? IT WINDOWDOWN      * 4D727
                  CROSS_OFF 7GETLAM 13GETLAM !#1+IF<dim-1 OBJ_4703F ; * 4D73B
              ;                                  * 4D759
              TRUE ;                             * 4D75E
            BINT12 #=casedrop                    * 4D768
            :: BINT1 ?CaseKeyDef                 * 4D772
              :: CHECKMENU DoNextRow DispMenu ; BINT2 ?CaseKeyDef * 4D781
              :: CHECKMENU DoPrevRow DispMenu ; BINT3 ?CaseKeyDef * 4D7A4
              :: CHECKMENU 22Lget EVAL InitMenu DispMenu ; DROPDEADTRUE ; * 4D7C7
            BINT28 #=casedrop                    * 4D7F4
            :: BINT2 ?CaseKeyDef OBJ_4576C BINT1 ?CaseKeyDef OBJ_4EBD1 * 4D7FE
              DROPDEADTRUE ;                     * 4D821
            BINT45 #=casedrop                    * 4D82B
            :: BINT1 ?CaseKeyDef ~EXITFCNsto;TOADISP BINT3 ?CaseKeyDef * 4D835
              TurnOffKey DROPDEADTRUE ;          * 4D853
            BINT35 #=casedrop DROPFALSE          * 4D862
            BINT40 #=casedrop DROPFALSE          * 4D871
            SWAP BINT1 #<> case DROPDEADTRUE     * 4D880
            BINT39 ?CaseKeyDef OBJ_4E3E3 BINT14 ?CaseKeyDef OBJ_45681 BINT25 * 4D899
            ?CaseKeyDef OBJ_73AEE BINT26 ?CaseKeyDef OBJ_50EE3 BINT44 * 4D8BC
            ?CaseKeyDef MENUOFF BINT49 ?CaseKeyDef OBJ_73B20 DROPDEADTRUE ; * 4D8DA
          TrueTrue BINT25 PICK ONEFALSE GETPTYPE DUP OBJ_73257 SWAP * 4D8FD
          OBJ_73299 ClrDA1IsStat ERRSET ParOuterLoop ERRTRAP * 4D925
          :: Π'SAVEDDEPTH RESETDEPTH ERRJMP ; Π'SAVEDDEPTH RESETDEPTH * 4D93E
          OBJ_5108F ;                            * 4D961

* refs (8): 471B6 47679 4817F 4BD05 4C102 4E8B1 ...
~RclDepnd;1get(li)?:
        :: RclDepnd 1get(li)? ;                  * 4D96B

* refs (2): 49E16 4BAD0
~1stArgb(ex);::N:
        :: 1stArgb(ex) ::N ;                     * 4D97F

* refs (1): 8CE65
OBJ_4D993:
        :: 15GETLAM 4GETLAM 16GETLAM 3PICK %- OVER %/ bins(3r) DROPONE * 4D993
          OBJ_4CB68 ;                            * 4D9C5

* refs (1): 8CF53
OBJ_4D9CF:
        :: rclä STATGETXCOL COERCE BINT1 3PICK OBJ_2CF08 2DROP OBJ_4CB68 ; * 4D9CF
        BSS     12                               * 4DA01

* refs (22): 0C9F4 46C70 46CA7 47D84 482BA 482CE ...
CROSS_HAIRS:
        :: ~8GETLAM;7GETLAM CROSSGROB OBJ_4DEAE DUP4PUTLAM OBJ_4DB18 ; * 4DA0D
        BSS     15                               * 4DA30

* refs (3): 1E2C4 4C30A AA43D
OBJ_4DA3F:
        :: GDISPCENTER COLA OBJ_4D1AA            * 4DA3F
        ;                                        * 4DA53

* refs (1): 686C5
OBJ_4DA58:
        :: FALSE' 'EL STO TRUE ;                 * 4DA58

* refs (22): 0C9E5 46C57 46CBB 4703A 470CB 470FD ...
CROSS_OFF:
        :: BINT4 ~8GETLAM;7GETLAM OBJ_4E092 ;    * 4DA76

* refs (4): 4D09C 4D105 4D844 734B8
~EXITFCNsto;TOADISP:
        :: EXITFCNsto TOADISP ;                  * 4DA8F

* refs (7): 47C18 481CF 49696 49B19 49B41 4E76C ...
OBJ_4DAA3:
        :: EXITFCNsto                            * 4DAA3
          :: DOERASE OBJ_4C2CE ; ;               * 4DAAD

        :: INDEPVAR                              * 4DAC6
          :: OVER TYPESYMB? NOTcaseDROP ONE{}N   * 4DAD0
            uncrunch SHOWLS ;                    * 4DAE9
        ;                                        * 4DAF8
        ASSEMBLE

* refs (2): 65906 6591E
SUB_4DAFD:
        D0=(5)  #0011C                           * 4DAFD
        C=DAT0  XS                               * 4DB04
        C=C-1   B                                * 4DB08
        RTNNC                                    * 4DB0B
        P=      2                                * 4DB0E
        GOVLNG  L_01FC6                          * 4DB10
        NIBHEX  0                                * 4DB17
        RPL

* refs (3): 4DA26 4DD64 4ECD0
OBJ_4DB18:
        :: TOTEMPOB 4ROLL ~BINT32;TestSysFlag OBJ_4DF67 GBUFF 2SWAP GROB! ; * 4DB18

* refs (1): 47026
OBJ_4DB45:
        :: CROSS_OFF TOTEMPSWAP PUTLAM CROSS_HAIRS ; * 4DB45

* refs (2): 47053 4DE54
OBJ_4DB63:
        :: OBJ_4DC76 IT OBJ_4DBB3                * 4DB63
          ~8GETLAM;7GETLAM PIXON3 CROSS_HAIRS ;  * 4DB77

* refs (2): 4704E 4DE9A
OBJ_4DB8B:
        :: OBJ_4DC76 IT OBJ_4DBD1                * 4DB8B
          ~8GETLAM;7GETLAM PIXOFF3 CROSS_HAIRS ; * 4DB9F

* refs (1): 4DB72
OBJ_4DBB3:
        :: OBJ_4DBEA INVGROB 4UNROLL GROB! ;     * 4DBB3

* refs (1): 4DB9A
OBJ_4DBD1:
        :: OBJ_4DBEA 4UNROLL GROB! ;             * 4DBD1

* refs (2): 4DBB8 4DBD6
OBJ_4DBEA:
        :: CURRENTMARK? DROP 8GETLAM ROT#- #2+ 7GETLAM ROT#- #2+ 11GETLAM * 4DBEA
          DUP TYPEGROB? NOTcase                  * 4DC1C

* refs (1): 4DC5D
OBJ_4DC2B:
          :: 3DROP RDROP ;                       * 4DC2B
          DUPGROBDIM 5PICK #> SWAP4PICK #> ANDNOTcase OBJ_4DC2B * 4DC3F
          3UNROLL ONEONE MAKEGROB ;              * 4DC62

* refs (2): 4DB68 4DB90
OBJ_4DC76:
        :: CURRENTMARK? NOTcaseFALSE 7GETLAM     * 4DC76
          2DUP#< ?SWAP #- #<3 SWAP 8GETLAM 2DUP#< ?SWAP #- #<3 AND ; * 4DC8A

* refs (14): 46DFB 46E14 46EAF 46F54 46FFE 481DE ...
* Probably: write 4 to TIMER1, shortening the wait before the next key repeat
OBJ_4DCC6:
        CON(5)  (*)+5                            * 4DCC6  primitive code object
        ASSEMBLE
        CD1EX                                    * 4DCCB
        D1=(5)  TIMER1                           * 4DCCE
        LA(1)   #4                               * 4DCD5
        DAT1=A  1                                * 4DCDB
        D1=C                                     * 4DCDF
        A=DAT0  A                                * 4DCE2
        D0=D0+  5                                * 4DCE5
        PC=(A)                                   * 4DCE8
        RPL

* refs (1): 4D3F8
OBJ_4DCEC:
        :: OBJ_4DCC6 WINDOWTOP? IT WINDOWUP      * 4DCEC
          ~8GETLAM;7GETLAM CursCorner 7GETLAM !#1-IF>0 * 4DD05

* refs (3): 4DDA5 4DDDC 4DE18
OBJ_4DD19:
          :: ~8GETLAM;7GETLAM CROSSGROB OBJ_4DEB3 4GETLAM GBUFF BINT11 ROLL * 4DD19
            BINT11 ROLL GROB! GBUFF 5UNROLL SUBGROB DUP4PUTLAM OBJ_4DB18 ; * 4DD41
        ;                                        * 4DD6E

* refs (1): 4D713
OBJ_4DD73:
        :: OBJ_4DCC6 WINDOWBOT? IT WINDOWDOWN    * 4DD73
          ~8GETLAM;7GETLAM CursCorner 7GETLAM 13GETLAM !#1+IF<dim-1 * 4DD8C
          OBJ_4DD19 ;                            * 4DDA5

* refs (2): 0C8ED 4D51F
OBJ_4DDAF:
        :: OBJ_4DCC6 WINDOWLEFT? IT WINDOWLEFT   * 4DDAF
          ~8GETLAM;7GETLAM CursCorner 8GETLAM !#1-IF>0 OBJ_4DD19 ; * 4DDC8

* refs (2): 0C8E8 4D60F
OBJ_4DDE6:
        :: OBJ_4DCC6 WINDOWRIGHT? IT WINDOWRIGHT * 4DDE6
          ~8GETLAM;7GETLAM CursCorner 8GETLAM 14GETLAM !#1+IF<dim-1 * 4DDFF
          OBJ_4DD19 ;                            * 4DE18

* refs (1): 3E8B6
{GRAPH\DOT+}~1:
        :: CHECKMENU ~3GETLAM;#2= ITE ~BINT0;3PUTLAM * 4DE22
          :: OBJ_4EE6F BINT2 3PUTLAM CROSS_OFF OBJ_4DB63 ; * 4DE3B
          DispMenu ;                             * 4DE5E

* refs (1): 3E8EB
{GRAPH\DOT-}~1:
        :: CHECKMENU ~3GETLAM;#1=_2 ITE ~BINT0;3PUTLAM * 4DE68
          :: OBJ_4EE6F BINT1 3PUTLAM CROSS_OFF OBJ_4DB8B ; * 4DE81
          DispMenu ;                             * 4DEA4

* refs (2): 4DA1C 4ECCB
OBJ_4DEAE:
        ::                                       * 4DEAE

* refs (2): 48481 4DD28
OBJ_4DEB3:
          :: 3UNROLL 14GETLAM SWAP 13GETLAM OBJ_4DFFD ITE * 4DEB3
            :: OBJ_4E10C BINT9 ROLL 5UNROLL SUBGROB 5UNROLL 4PICK 3UNROLL * 4DED6
              4PICK 3UNROLL ;                    * 4DF03
            :: DROPSWAPDROP OVER #2- OVER #2- 2DUP 6ROLL #3+ 6ROLL #3+ ; * 4DF12
          ;                                      * 4DF4E
          GBUFF 5UNROLL SUBGROB ;                * 4DF53

* refs (2): 484E5 4DB2C
OBJ_4DF67:
        CON(5)  (*)+5                            * 4DF67  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 4DF6C
        LC(5)   TRUE                             * 4DF6F
        D1=D1+  5                                * 4DF76
        D=D+1   A                                * 4DF79
        ST=1    1                                * 4DF7B
        ?C=A    A                                * 4DF7E
        GOYES   L_4DF86                          * 4DF81
        ST=0    1                                * 4DF83
L_4DF86:
        C=DAT1  A                                * 4DF86
        CD1EX                                    * 4DF89
        D1=D1+  10                               * 4DF8C
        A=DAT1  A                                * 4DF8F
        R0=A.F  A                                * 4DF92
        D1=D1+  10                               * 4DF98
        A=DAT1  W                                * 4DF9B
        R1=A                                     * 4DF9F
        D1=C                                     * 4DFA2
        D1=D1+  5                                * 4DFA5
        D=D+1   A                                * 4DFA8
        A=DAT1  A                                * 4DFAA
        GOSBVL  SAVPTR                           * 4DFAD
        D1=A                                     * 4DFB4
        D1=D1+  10                               * 4DFB7
        D1=D1+  10                               * 4DFBA
        A=DAT1  10                               * 4DFBD
        C=R1                                     * 4DFC1
        B=A     W                                * 4DFC4
        A=A!C   W                                * 4DFC7
        ?ST=0   1                                * 4DFCB
        GOYES   L_4DFDA                          * 4DFCE
        ABEX    W                                * 4DFD0
        A=A&C   W                                * 4DFD3
        A=B-A   W                                * 4DFD7
L_4DFDA:
        C=R0.F  A                                * 4DFDA
L_4DFE0:
        C=C-1   A                                * 4DFE0
        GOC     L_4DFF6                          * 4DFE2
        DAT1=A  2                                * 4DFE5
        ASR     W                                * 4DFE9
        ASR     W                                * 4DFEC
        D1=D1+  2                                * 4DFEF
        GOTO    L_4DFE0                          * 4DFF2
L_4DFF6:
        GOVLNG  GETPTRLOOP                       * 4DFF6

* refs (1): 4DECC
OBJ_4DFFD:
        CON(5)  (*)+5                            * 4DFFD  primitive code object
        CD1EX                                    * 4E002
        R0=C.F  A                                * 4E005
        CD1EX                                    * 4E00B
        GOSUB   SUB_4E06F                        * 4E00E
        A=C     A                                * 4E012
        C=R0.F  A                                * 4E014
        CD1EX                                    * 4E01A
        D1=D1+  5                                * 4E01D
        GOSUB   SUB_4E06F                        * 4E020
        GOSUB   SUB_4E07D                        * 4E024
        C=R0.F  A                                * 4E028
        CD1EX                                    * 4E02E
        D1=D1+  10                               * 4E031
        GOSUB   SUB_4E06F                        * 4E034
        A=C     A                                * 4E038
        C=R0.F  A                                * 4E03A
        CD1EX                                    * 4E040
        D1=D1+  15                               * 4E043
        GOSUB   SUB_4E06F                        * 4E046
        GOSUB   SUB_4E07D                        * 4E04A
        LC(5)   FALSE                            * 4E04E
        GOTO    L_4E060                          * 4E055
L_4E059:
        LC(5)   TRUE                             * 4E059
L_4E060:
        A=R0.F  A                                * 4E060
        AD1EX                                    * 4E066
        A=C     A                                * 4E069
        PC=(A)                                   * 4E06B

* refs (4): 4E00E 4E020 4E034 4E046
SUB_4E06F:
        C=DAT1  A                                * 4E06F
        CD1EX                                    * 4E072
        D1=D1+  5                                * 4E075
        C=DAT1  A                                * 4E078
        RTN                                      * 4E07B

* refs (2): 4E024 4E04A
SUB_4E07D:
        A=A-1   A                                * 4E07D
        A=A-1   A                                * 4E07F
        ?C>A    A                                * 4E081
        GOYES   L_4E059                          * 4E084
        C=C-1   A                                * 4E086
        GOC     L_4E059                          * 4E088
        C=C-1   A                                * 4E08B
        GOC     L_4E059                          * 4E08D
        RTN                                      * 4E090
        RPL

* refs (2): 4DA85 4E4A6
OBJ_4E092:
        :: CursCorner ROT GETLAM GBUFF 2SWAP GROB! ; * 4E092

* refs (11): 4820B 48260 4845E 4884B 4DD0A 4DD91 ...
* #x #y -> #x-2 #y-2 (floored at 0): the corner of the 5x5 area under the PICTURE cursor
CursCorner:
        CON(5)  (*)+5                            * 4E0BA  primitive code object
        ASSEMBLE
        GOSBVL  POP2#                            * 4E0BF
        R1=C.F  A                                * 4E0C6
        GOSBVL  SAVPTR                           * 4E0CC
        A=A-1   A                                * 4E0D3
        GOC     L_4E100                          * 4E0D5
        A=A-1   A                                * 4E0D8
        GOC     L_4E100                          * 4E0DA
L_4E0DD:
        R0=A.F  A                                * 4E0DD
        C=R1.F  A                                * 4E0E3
        C=C-1   A                                * 4E0E9
        GOC     L_4E106                          * 4E0EB
        C=C-1   A                                * 4E0EE
        GOC     L_4E106                          * 4E0F0
L_4E0F3:
        R1=C.F  A                                * 4E0F3
        GOVLNG  Push2#Loop                       * 4E0F9
L_4E100:
        A=0     A                                * 4E100
        GOTO    L_4E0DD                          * 4E102
L_4E106:
        C=0     A                                * 4E106
        GOTO    L_4E0F3                          * 4E108

* refs (1): 4DEDB
OBJ_4E10C:
        CON(5)  (*)+5                            * 4E10C  primitive code object
        GOSBVL  POP2#                            * 4E111
        R2=A.F  A                                * 4E118
        GOSUB   SUB_4E210                        * 4E11E
        CSRC                                     * 4E122
        R3=C.F  S                                * 4E125
        GOSBVL  POP2#                            * 4E12B
        R4=A.F  A                                * 4E132
        GOSUB   SUB_4E210                        * 4E138
        R3=C.F  P                                * 4E13C
        A=R4.F  A                                * 4E142
        GOSUB   SUB_4E227                        * 4E148
        R0=A.F  A                                * 4E14C
        A=R2.F  A                                * 4E152
        GOSUB   SUB_4E227                        * 4E158
        R1=A.F  A                                * 4E15C
        GOSBVL  SAVPTR                           * 4E162
        GOSBVL  PUSH2#                           * 4E169
        GOSBVL  SAVPTR                           * 4E170
        A=R4.F  A                                * 4E177
        C=0     A                                * 4E17D
        C=R3.F  P                                * 4E17F
        A=A+C   A                                * 4E185
        R0=A.F  A                                * 4E187
        A=R2.F  A                                * 4E18D
        C=0     A                                * 4E193
        C=R3.F  S                                * 4E195
        CSLC                                     * 4E19B
        A=A+C   A                                * 4E19E
        R1=A.F  A                                * 4E1A0
        GOSBVL  PUSH2#                           * 4E1A6
        GOSBVL  SAVPTR                           * 4E1AD
        C=R4.F  A                                * 4E1B4
        GOSUB   SUB_4E235                        * 4E1BA
        R0=A.F  A                                * 4E1BE
        C=R2.F  A                                * 4E1C4
        GOSUB   SUB_4E235                        * 4E1CA
        R1=A.F  A                                * 4E1CE
        GOSBVL  PUSH2#                           * 4E1D4
        GOSBVL  SAVPTR                           * 4E1DB
        A=0     A                                * 4E1E2
        A=R3.F  P                                * 4E1E4
        A=A+1   A                                * 4E1EA
        A=A+1   A                                * 4E1EC
        R0=A.F  A                                * 4E1EE
        A=0     A                                * 4E1F4
        A=R3.F  S                                * 4E1F6
        ASLC                                     * 4E1FC
        A=A+1   A                                * 4E1FF
        A=A+1   A                                * 4E201
        R1=A.F  A                                * 4E203
        GOVLNG  Push2#Loop                       * 4E209

* refs (2): 4E11E 4E138
SUB_4E210:
        A=A-1   A                                * 4E210
        C=C-A   A                                * 4E212
        LA(5)   #00003                           * 4E214
        ?C<=A   A                                * 4E21E
        RTNYES                                   * 4E221
        C=A     A                                * 4E223
        RTN                                      * 4E225

* refs (2): 4E148 4E158
SUB_4E227:
        A=A-1   A                                * 4E227
        GOC     L_4E231                          * 4E229
        A=A-1   A                                * 4E22C
        RTNNC                                    * 4E22E
L_4E231:
        A=0     A                                * 4E231
        RTN                                      * 4E233

* refs (2): 4E1BA 4E1CA
SUB_4E235:
        LA(5)   #00002                           * 4E235
        A=A-C   A                                * 4E23F
        RTNNC                                    * 4E241
        A=0     A                                * 4E244
        RTN                                      * 4E246
        RPL

* refs (1): 4888C
~BINT1;GetEqN:
        :: BINT1 GetEqN ;                        * 4E248
        BSS     10                               * 4E25C

* ->
* refs (61): 0C8FC 0C929 0C9AE 456D1 456FE 4575D ...
CHECKMENU:
        :: TakeOver MENUOFF? case                * 4E266
          :: RDROP TURNMENUON DispMenu ;         * 4E27A
          ~16GETLAM;BINT0;#<> NOT?SEMI           * 4E293
          RDROP ~DispMenu;BINT0;16PUTLAM ;       * 4E29D

* ->
* refs (3): 3E7FF 46ACA 4D8DF
MENUOFF:
        :: CHECKMENU GDISPON? NOT?SEMI           * 4E2AC
          CHECKPICT TURNMENUOFF ;                * 4E2C0

* ->
* refs (11): 488B9 4B666 4C2D8 4CE88 4E2C5 4F0A2 ...
TURNMENUOFF:
        :: HARDBUFF HARDHEIGHT CHECKHEIGHT WINDOWCORNER BINT64 HARDBUFF * 4E2CF
          GROBDIM DROP 4PICK #- 2DUP#> ITE       * 4E2F2
          :: #- ROTSWAP #-SWAP WINDOWXY ; 4DROP  * 4E310
          # 3F LINECHANGE ;                      * 4E333

* ->
* refs (5): 3A201 4E284 6A8D8 6C398 D10A3
TURNMENUON:
        :: # 37 LINECHANGE ;                     * 4E347

* -> flag
* refs (3): 4E270 50F10 73B2A
MENUOFF?:
        :: RclRowMenu # 37 #<> ;                 * 4E360

* refs (2): 4E33D 4E356
LINECHANGE:
        CON(5)  (*)+5                            * 4E37E  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 4E383
        GOSBVL  SAVPTR                           * 4E38A
        LC(2)   #3F                              * 4E391
        A=A&C   B                                * 4E395
        C=-C-1  A                                * 4E399
        B=C     A                                * 4E39B
        D0=(5)  LINECOUNTg                       * 4E39D
        C=DAT0  B                                * 4E3A4
        C=C&B   B                                * 4E3A7
        A=A!C   B                                * 4E3AB
        DAT0=A  B                                * 4E3AF
        D0=(5)  LINECOUNT                        * 4E3B2
        DAT0=A  B                                * 4E3B9
        GOSBVL  disprange                        * 4E3BC
        GOVLNG  GETPTRLOOP                       * 4E3C3
        RPL

* refs (2): 3E820 4E659
\MARK:
        :: CHECKMENU COLA OBJ_4E3E3              * 4E3CA
        ;                                        * 4E3DE

* refs (2): 4D8A3 4E3D9
OBJ_4E3E3:
        :: TakeOver OBJ_4579E EQCURSOR? case2drop * 4E3E3
          :: 11GETLAM 4PUTLAM %0_2A2B4 TOTEMPOB 1PUTLAM CROSS_OFF * 4E3FC
            CROSS_HAIRS ;                        * 4E41F
          CROSS_OFF PREMARKON CROSS_HAIRS NEWMARK ; * 4E429

* refs (7): 0C92E 457A3 497FB 4DBEF 4DC7B 4E6D1 ...
CURRENTMARK?:
        :: 1GETLAM DUP TYPEBINT? NOTcsdrpfls 12GETLAM TRUE ; * 4E442

* refs (3): 4828D 4E3F2 4E78A
EQCURSOR?:
        :: 2DUP 7GETLAM #= SWAP 8GETLAM #= AND ; * 4E46A

* refs (3): 482C9 4E42E 4E6DB
PREMARKON:
        :: BINT11 3UNROLL OBJ_4E092 ;            * 4E497

* refs (3): 457B2 4980F 4E438
NEWMARK:
        :: ~8GETLAM;7GETLAM 2DUP TOTEMPOB 12PUTLAM TOTEMPOB 1PUTLAM * 4E4B0
          CursCorner 4GETLAM DUP 11PUTLAM GROBDIM 4PICK#+SWAP 3PICK#+ * 4E4D3
          HARDBUFF 5UNROLL SUBGROB 4PUTLAM CROSSMARKOFF CROSSMARKON ; * 4E4F6

* refs (2): 4E64F 4ECC1
OBJ_4E519:
        :: 1GETLAM 12GETLAM CursCorner 11GETLAM GROBDIM 4PICK#+SWAP 3PICK#+ * 4E519
          HARDBUFF 5UNROLL SUBGROB 11PUTLAM ;    * 4E541

* refs (1): 3E85C
\BOX:
        :: CHECKMENU OBJ_4579E CROSSMARKOFF ~8GETLAM;7GETLAM DRAWBOX# * 4E55A
          CROSSMARKON ;                          * 4E578

* #x1 #y1 #x2 #y2 ->
* refs (3): 4E573 4F67E 4F697
DRAWBOX#:
        :: ORDERXY# 4PICK 4PICK 4PICKOVER DRAWLINE#3 OVER 4PICKOVER 4PICK * 4E582
          DRAWLINE#3 2DUP 6PICK OVER DRAWLINE#3 4ROLL DUPUNROT 5ROLL * 4E5AF
          DRAWLINE#3 DROP ;                      * 4E5D7

* refs (1): 3E881
\CIRCLE:
        :: CHECKMENU OBJ_4579E CROSSMARKOFF FALSE 3UNROLL UNCOERCE2 * 4E5E6
          ~8GETLAM;7GETLAM UNCOERCE2 2DUP 6ROLL 6ROLL OBJ_4FE6C CROSSMARKON ; * 4E609

* refs (1): 3E834
\LINE:
        :: CHECKMENU OBJ_4579E CROSSMARKOFF ~8GETLAM;7GETLAM DRAWLINE#3 * 4E631
          OBJ_4E519 CROSS_HAIRS \MARK ;          * 4E64F

* refs (1): 3E848
\TLINE:
        :: CHECKMENU OBJ_4579E CROSSMARKOFF ~8GETLAM;7GETLAM TOGGLELINE#3 * 4E663
          CROSSMARKON ;                          * 4E681

* refs (2): 46CAC 4702B
OBJ_4E68B:
        :: ~16GETLAM;#1= NOT?SEMI                * 4E68B
          OBJ_47209 OBJ_47236 ;                  * 4E69A

* refs (1): 4E2A2
~DispMenu;BINT0;16PUTLAM:
        :: DispMenu BINT0 16PUTLAM ;             * 4E6A9
        NIBHEX  00000                            * 4E6C2  ..

* refs (15): 4568B 45708 45776 477C7 4E50A 4E569 ...
* -> : take the crosshair and the mark off PICT (the inverse of CROSSMARKON)
CROSSMARKOFF:
        :: CROSS_OFF CURRENTMARK? IT PREMARKON   * 4E6C7
        ;                                        * 4E6E0

DispOnMenu(_):
        :: DECOMP$                               * 4E6E5

* $ ->
* refs (2): 0CA03 4A05A
DispCoord1:
          :: $>grob DUPGROBDIM SWAPDROP BINT131 #< ?SKIP * 4E6EF

sub(go,<0>,<0>,<83>,<8>):
            :: ZEROZERO BINT131 BINT8 SUBGROB ;  * 4E712
            CLEARMENU HARDBUFF2 BINT0 BINT2 GROB! ; * 4E730
        ;                                        * 4E74E

* refs (1): 47F27
OBJ_4E753:
        :: CHECKMENU PPAR>ZPAR RECORDX&YC% centr(c) OBJ_4DAA3 ; * 4E753

Z-BOX:
        :: CHECKMENU LookForEQ/äDAT OBJ_4579E EQCURSOR? case2drop DoBadKey * 4E776

* refs (1): 0C9C2
OBJ_4E799:
          :: GBUFFGROBDIM px->c(2rr,2s) C%>% ~8GETLAM;7GETLAM GBUFFGROBDIM * 4E799
            px->c(2rr,2s) C%>% ORDERXY% DUP 4PICK %= IT * 4E7B7
            :: DROPSWAPDROP GETPMIN&MAX SWAP2C%>% SWAPDROP ROTDROP 3UNROLL ; * 4E7DA
            OVER5PICK %= IT                      * 4E802
            :: SWAPDROP ROTDROP GETPMIN&MAX SWAP2C%>% DROPSWAPDROP 4UNROLL * 4E811
              SWAP ;                             * 4E834
            %>C% pmax(c) %>C% pmin(c) OBJ_4DAA3 ; * 4E83E
        ;                                        * 4E85C

* refs (1): 3E7DE
{GRAPH\LABEL}~1:
        :: CHECKMENU CROSSMARKOFF label! CROSSMARKON ; * 4E861
        BSS     10                               * 4E87F

* refs (1): 1E2DF
label:
        :: CHECKPICT                             * 4E889

* refs (1): 4E870
label!:
          :: OBJ_4681A ?SKIP                     * 4E893
            :: INDEPVAR ID>$ ~RclDepnd;1get(li)? ID>$ ; * 4E8A2
            $>grob SWAP $>grob GBUFFGROBDIM label~1 GETPMIN&MAX SWAP2C%>% * 4E8C0
            ROT 4ROLL 3UNROLL label~3 ;          * 4E8E3
        ;                                        * 4E8FC

* refs (1): 4E8D4
label~1:
        :: RclAx*s 1get(li)? 3PICK3PICK OBJ_4F20F 4UNROLLROT * 4E901
          r=>rr;rot;*(2rr);+(2rr);r=>r SWAP4ROLL Chkr=>s(s,r) DUPTYPEBINT? * 4E91F
          ITE label~2 4ROLLDROP                  * 4E933
          SWAP3PICK Chkr=>s(s,r) DUPTYPEBINT? NOTcase * 4E942

drop(3-4);swap:
          :: ROTDROP ROTDROPSWAP ;               * 4E956
          ROTDROPSWAP OVER #3+ BINT3 5ROLL PutOnPict(2s,go) ; * 4E96A

* refs (2): 4E929 4E947
Chkr=>s(s,r):
        :: OVER (rò-0.5)=>s? NOTcaseDROP 2DUP    * 4E98D
          #> case ROTROT2DROP                    * 4E9A6
          2DROP ;                                * 4E9B5

* refs (1): 4E938
label~2:
        :: 3PICK #2- 5PICK GROBDIMw 2DUPSWAP #> ITE * 4E9BF
          :: SWAP#- 5ROLL SWAP BINT0 MINUSONE DUP SUBGROB 4UNROLL BINT0 ; #- * 4E9E7
          OVER BINT7 #- 6ROLL PutOnPict(2s,go) ; * 4EA23

* refs (6): 4E983 4EA37 4EABE 4EAF5 4EB59 4EBA9
PutOnPict(2s,go):
        :: 3UNROLL GBUFF InGrob(2s,go)? NOTcase 3DROP * 4EA41
          GBUFF 4UNROLL CKGROBFITS 4ROLL 3UNROLL GROB! ; * 4EA5F

* refs (1): 4E8F2
label~3:
        :: label~4 6PICK DUPTYPEBINT? ITE        * 4EA82
          :: OVER GROBDIMw #- #1- BINT3 ROT PutOnPict(2s,go) ; 2DROP * 4EA9B
          BINT3 5PICK DUPTYPEBINT? ITE           * 4EACD
          :: #3+ 5ROLL label~4 PutOnPict(2s,go) ; * 4EAE1
          :: 2DROP ROTDROP ;                     * 4EAFF
          GBUFFGROBDIM #2- 4ROLL label~4 DUPGROBDIM SWAPDROP ROTSWAP #- * 4EB13
          5ROLL DUPTYPEBINT? ITE                 * 4EB3B
          :: #3+ ROT PutOnPict(2s,go) ; 3DROP    * 4EB4A
          SWAP label~4 DUPGROBDIM 5ROLL DUPTYPEBINT? ITE * 4EB68
          :: SWAP#- #1- 4ROLL #2- ROT#- ROT PutOnPict(2s,go) ; 5DROP * 4EB86
        ;                                        * 4EBB8

* refs (4): 4EA87 4EAF0 4EB22 4EB6D
label~4:
        :: ~setStdWid;COLA;stkdecomp$w $>grob ;  * 4EBBD

* refs (2): 45762 4D81C
OBJ_4EBD1:
        :: TakeOver OBJ_4579E GBUFF 3UNROLL CROSSMARKOFF ~8GETLAM;7GETLAM * 4EBD1
          ORDERXY# SWAP#1+SWAP #1+ GROB!ZERODRP CROSSMARKON ; * 4EBF4

* refs (1): 73AF8
OBJ_4EC12:
        :: TraceMode? NOTcase RECORDX&YC%        * 4EC12
          ~BINT23;GETLAM BINT5 NTHELCOMP case EVAL * 4EC26
          RECORDX&YC% ;                          * 4EC3F

* refs (1): 68E95
OBJ_4EC49:
        :: 'EL BINT33 GETLAM NOTAND BINT32 GETLAM NOTAND IT OBJ_6C041 * 4EC49
          TRUE' 'EL STO OBJ_699B9 ;              * 4EC7B

* refs (1): 3B3FA
~0LASTOWDOB!;CK2NOLASTWD:
        :: 0LASTOWDOB! CK2NOLASTWD ;             * 4EC94
        NIBHEX  00000                            * 4ECA8  ..

* refs (12): 456B8 4574E 45794 477D1 4E50F 4E578 ...
CROSSMARKON:
        :: CURRENTMARK? IT                       * 4ECAD
          :: OBJ_4E519 MARKGROB OBJ_4DEAE OBJ_4DB18 ; * 4ECBC
          CROSS_HAIRS ;                          * 4ECDA

* refs (1): 3E78C
\REPL:
        :: CHECKMENU DEPTH #0=case               * 4ECE4

Warning201:
          :: # 201 OBJ_6BC2D ;                   * 4ECF8
          DUP TYPEGROB? NOTcase                  * 4ED11

Warning202:
          :: # 202 OBJ_6BC2D ;                   * 4ED20
          CK1NOLASTWD CROSSMARKOFF GBUFF SWAP ~8GETLAM;7GETLAM CKGROBFITS * 4ED39
          4ROLL 3UNROLL GROB! CROSSMARKON ;      * 4ED57

* refs (1): 4BB2F
OBJ_4ED70:
        :: ' 15GETLAM ' GETXPOS ' 1PUTLAM BINT28 TestSysFlag case OBJ_4BB98 * 4ED70
          BINT1 OBJ_4A96E DROP ' ' OBJ_4BF71 ITE OBJ_4C616 OBJ_4B747 * 4EDA7
          BINT1 BINT31 TestSysFlag ITE           * 4EDD4
          :: '                                   * 4EDE8
            :: DROP COLA PlotEval                * 4EDF2
            ;                                    * 4EE06
          ;                                      * 4EE0B
          :: ' OBJ_4EF73 ;                       * 4EE10
          BINT1 3GETLAM BINT9 ::N 2PUTLAM ;      * 4EE24

* refs (6): 57176 73303 73338 73397 733E2 73415
OBJ_4EE42:
        :: BINT1 GetEqN NOTcaseFALSE DROPTRUE    * 4EE42
        ;                                        * 4EE5B

* refs (2): 73433 737A6
OBJ_4EE60:
        :: BINT0 3PUTLAM                         * 4EE60

* refs (3): 0C9E0 4DE40 4DE86
OBJ_4EE6F:
          :: 7GETLAM TOTEMPOB 7PUTLAM 8GETLAM TOTEMPOB 8PUTLAM ; DispMenu.1 ; * 4EE6F

* refs (1): 73B75
OBJ_4EEA1:
        :: ~BINT23;GETLAM BINT1 NTHCOMPDROP EVAL ; * 4EEA1

* refs (16): 0C9B3 47ACE 47AF1 47BD7 47C2C 47FFE ...
* -> : save PPAR in ZPAR (with its zoom factors, or 4 4 0) so a zoom can be undone
PPAR>ZPAR:
        :: OBJ_496A0 ITE DROP                    * 4EEBF
          :: %4 %4 %0_2A2B4 ;                    * 4EED3
          'IDPAR RclPlotVar? ?SKIP MAKEPVARS     * 4EEEC
          OBJ_49A74 ;                            * 4EF00

* refs (2): 4A9F6 4B540
OBJ_4EF0A:
        :: OBJ_4C64D NOT?INVPPAR ;               * 4EF0A

* refs (1): 4CA91
bins(3r)~3:
        :: 3PICK 2GETLAM %= case                 * 4EF1E
          :: 3DROP 1GETLAM ;                     * 4EF37
          3UNROLL %- SWAP %/ %1+ %IP COERCE ;    * 4EF4B

* refs (2): 4BF3F 4EE1A
OBJ_4EF73:
        :: BINT28 PUTLAM ERRSET EVALCRUNCH ERRTRAP * 4EF73
          :: ERROR@ # 100 #/ SWAPDROP BINT3 #<>case ERRJMP * 4EF91
            ERRORCLR BINT31 TestSysFlag ?SKIP    * 4EFBE
            :: BINT28 GETLAM ClrLastPt ;         * 4EFD2
            2RDROP ;                             * 4EFEB
          0LASTOWDOB! CK1NOLASTWD U>nbr ;        * 4EFF5

* refs (1): 1E2FF
pview(c):
        :: GBUFFGROBDIM OBJ_4F1A1 NcaseSIZEERR WINDOW# * 4F009
        ;                                        * 4F022

* refs (1): 1E309
xPVIEW~list:
        :: NULL{} EQUALcasedrop DOGRAPHIC        * 4F027
          2HXSLIST? WINDOW# ;                    * 4F03B
        BSS     8                                * 4F04A

* #x #y  ->
* refs (2): 4F01D 4F040
WINDOW#:
        :: CHECKPICT GBUFF InGrob(2s,go)?#:BAV! GBUFFGROBDIM 4PICK BINT131 * 4F052
          ~#+;#< SWAP3PICK BINT64 ~#+;#< ORcase SETSIZEERR * 4F075
          TOGDISP SWAP WINDOWXY TURNMENUOFF ;    * 4F093
