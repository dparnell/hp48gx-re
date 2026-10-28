* HP 48GX ROM revision R, #14001-#15FFF: Decompiling and displaying objects
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: EDITDECOMP$ GsstFIN DOSTOE DECOMP$ sstDISP nohalt ->StkStr22! 'EQ DORCLE DO>STR CRUNCH RDUP
* Follows on from the previous file (at #14001 in the original ROM).
        D0=C                                     * 14001
L_14004:
        A=DAT0  A                                * 14004
        D0=D0+  5                                * 14007
        PC=(A)                                   * 1400A

* ->
* refs (1): 1A377
ERR0:
        CON(5)  (*)+5                            * 1400E  primitive code object
        LC(5)   LASTERROR                        * 14013
        CD0EX                                    * 1401A
        A=0     A                                * 1401D
        DAT0=A  A                                * 1401F
        CD0EX                                    * 14022
        LC(5)   EXITMSG                          * 14025
        CD0EX                                    * 1402C
        DAT0=A  A                                * 1402F
        CD0EX                                    * 14032
        GOTO    L_14004                          * 14035

* -> #
* refs (3): 14051 1406A 2DCED
ERRN:
        CON(5)  (*)+5                            * 14039  primitive code object
        LC(5)   LASTERROR                        * 1403E
        GOVLNG  L_114B3                          * 14045
        RPL

* -> hxs
* refs (1): 1A392
ERRN>HXS:
        :: ERRN UNCOERCE %># ;                   * 1404C

* -> $
* refs (1): 1A3AD
ERRM:
        :: ERRN BINT0 #=casedrop NULL$           * 14065
          GETTHEMESG ;                           * 1407E

* $ -> $ ob -> $
* refs (12): 140B5 1CB15 26895 9F7A1 9F83B A0CAE ...
DO>STR:
        :: BINT0 !DcompWidth DUPTYPECSTR? ?SEMI  * 14088
          editdecomp$w ;                         * 140A1

* ob %row ->
* refs (1): 1A593
DODISP:
        :: SWAP DO>STR SWAP COERCE DUP#0=IT #1+ BINT7 DUPROT #MIN SWAPOVER#- * 140AB
          #1+ Disp5x7 ;                          * 140E2

* % -> $
* refs (1): 1CB75
DOCHR:
        :: COERCE #>CHR NULL$SWAP >T$ ;          * 140F1

* $ -> CHR
* refs (1): 1CB55
DONUM:
        :: DUPNULL$? ITE DROPZERO CAR$           * 1410F
          CHR># UNCOERCE ;                       * 14128

* $ -> ?
* refs (3): 1CB35 1CF9E D14D2
DOSTR>:
        :: palparse case EVAL                    * 14137
          2DROP SYNTAXERR ;                      * 1414B

* %freq %dur ->
* refs (1): 1A5D3
DOBEEP:
        ::                                       * 1415A
          CODE                                   * 1415F  48 nibbles
            GOSBVL  POP1%                        * 14169
            LC(3)   #499                         * 14170
            ?C<A    X                            * 14175
            GOYES   L_1418A                      * 14178
            LC(1)   #6                           * 1417A
            ?C>=A   P                            * 1417D
            GOYES   L_14185                      * 14180
            CAEX    P                            * 14182
L_14185:
            ?A=0    M                            * 14185
            GOYES   L_14192                      * 14188
L_1418A:
            LC(3)   #003                         * 1418A
            A=A+C   X                            * 1418F
L_14192:
            GOVLNG  PUSH%LOOP                    * 14192
          ENDCODE                                * 14199
          COERCESWAP COERCE setbeep OBJ_4241B ;  * 14199

* #ms #Hz ->
* refs (3): 141A3 3FDE5 D0EBB
setbeep:
        CON(5)  (*)+5                            * 141B2  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 141B7
        C=A     A                                * 141BE
        RSTK=C                                   * 141C0
        GOSBVL  POP#                             * 141C2
        GOSUB   SUB_141DE                        * 141C9
        C=RSTK                                   * 141CD
        D=C     A                                * 141CF
        C=A     A                                * 141D1
        GOSBVL  makebeep                         * 141D3
        GOTO    L_14203                          * 141DA

* refs (3): 141C9 141EA 1420F
SUB_141DE:
        GOVLNG  SAVPTR                           * 141DE

* ->
* refs (9): 17BCC 1801A 2F022 38796 3890D 3892B ...
ERRBEEP:
        CON(5)  (*)+5                            * 141E5  primitive code object
        GOSUB   SUB_141DE                        * 141EA
        C=0     A                                * 141EE
        LC(3)   #578                             * 141F0
        D=C     A                                * 141F5
        LC(3)   #04A                             * 141F7
        GOSBVL  makebeep                         * 141FC
L_14203:
        GOVLNG  GETPTRLOOP                       * 14203

* $ $' -> flag
* refs (6): 142B0 142E7 1EC80 D1E96 D1EFA D1F27
$>$?:
        CON(5)  (*)+5                            * 1420A  primitive code object
        GOSUB   SUB_141DE                        * 1420F
        C=DAT1  A                                * 14213
        D0=C                                     * 14216
        D0=D0+  5                                * 14219
        D1=D1+  5                                * 1421C
        C=DAT1  A                                * 1421F
        D1=C                                     * 14222
        D1=D1+  5                                * 14225
        LC(5)   #00005                           * 14228
        A=DAT0  A                                * 1422F
        D0=D0+  5                                * 14232
        A=A-C   A                                * 14235
        A=0     M                                * 14237
        ASRB                                     * 1423A
        B=C     A                                * 1423D
        ABEX    A                                * 1423F
        C=DAT1  A                                * 14241
        D1=D1+  5                                * 14244
        C=C-A   A                                * 14247
        C=0     M                                * 14249
        CSRB                                     * 1424C
        D=C     A                                * 1424F
        D=D-1   A                                * 14251
        GOC     L_1427B                          * 14253
        B=B-1   A                                * 14256
        GOC     L_1429B                          * 14258
L_1425B:
        A=DAT0  B                                * 1425B
        C=DAT1  B                                * 1425E
        D0=D0+  2                                * 14261
        D1=D1+  2                                * 14264
        ?C>A    B                                * 14267
        GOYES   L_1429B                          * 1426A
        ?C<A    B                                * 1426C
        GOYES   L_1427B                          * 1426F
        B=B-1   A                                * 14271
        GOC     L_14296                          * 14273
        D=D-1   A                                * 14276
        GONC    L_1425B                          * 14278
L_1427B:
        LC(5)   %0_2A2B4                         * 1427B
L_14282:
        A=C     A                                * 14282
        GOSBVL  GETPTR                           * 14284
        D1=D1+  10                               * 1428B
        D=D+1   A                                * 1428E
        D=D+1   A                                * 14290
        PC=(A)                                   * 14292
L_14296:
        D=D-1   A                                * 14296
        GOC     L_1427B                          * 14298
L_1429B:
        LC(5)   %1                               * 1429B
        GOTO    L_14282                          * 142A2
        RPL

* $ $' -> flag
* refs (2): 142BF 1EBE1
$<$?:
        :: SWAP $>$? ;                           * 142A6

* $ $' -> flag
* refs (1): 1EDBE
$>=$?:
        :: $<$?                                  * 142BA
L_142C4:
          %1 %= case %0_2A2B4                    * 142C4
          %1 ;                                   * 142D8

* $ $' -> flag
* refs (1): 1ED1F
$<=$?:
        :: $>$? GOTO L_142C4 ;                   * 142E2

* % ->
* refs (1): 1A5B3
Ck&Freeze:
        :: COERCE BINT7 #MIN DUP#0=IT            * 142FB

drop;<7>:
          :: DROP BINT7 ; DUPONE #AND #0<> IT SetDA1Temp * 14314
          DUPTWO #AND #0<> IT SetDA2OKTemp       * 14341
          BINT4 #AND #0<> IT SetDA3Temp          * 1435A
        ;                                        * 14373

* refs (3): 15124 23481 23851
halt:
        :: CK0NOLASTWD SuspendOK? NOTcase NOHALTERR * 14378
L_14391:
          UNDO_ON?                               * 14391

{'halt}:
          {                                      * 14396

* refs (3): 1440B 14451 15075
Π'halt:
            LAM 'halt }                          * 1439B
          BIND ERRSET                            * 143B1
          :: UNDO_ON? IT SAVESTACK               * 143BB
            GOTO L_385B1 ;                       * 143CF
L_143DE:
          ERRTRAP OBJ_14E54 OBJ_1444C DropSysObs ERROR@ Err#Cont #= ?SEMI * 143DE
          ' Π'halt DRPExitAtLOOP casedrop ERRJMP * 14406
          ERROR@ Err#Kill #<>case ERRJMP         * 1441F
          OBJ_14EEC #0=case ABORT                * 14433
          ERRJMP ;                               * 14442

* refs (2): 143E8 14560
OBJ_1444C:
        :: Π'halt UNDO_ON ?SKIP UNDO_OFF         * 1444C
          ABND ;                                 * 14465

* -> flag
* refs (8): 14382 144B6 144E3 1450B 3DE4A 40CF8 ...
SuspendOK?:
        :: AppSuspOK? NOTcaseFALSE '             * 1446F

* -> ob
* refs (13): 1453D 155F4 15658 15662 15671 2DA27 ...
nohalt:
          LAM 'nohalt DRPExitAtLOOP NOTcaseTRUE DROPFALSE * 14483
        ;                                        * 144A7

* refs (1): C5DB1
next:
        :: TakeOver SuspendOK? NOTcase DoBadKey  * 144AC
          CK0NOLASTWD BINT2 COLA OBJ_14533       * 144C5
        ;                                        * 144D9

* refs (1): C5D90
sstdown:
        :: SuspendOK? NOTcase DoBadKey           * 144DE
          CK0NOLASTWD ONECOLA OBJ_14533 ;        * 144F2

* refs (1): C5D6F
sst:
        :: SuspendOK? NOTcase DoBadKey           * 14506
          CK0NOLASTWD BINT0 COLA OBJ_14533       * 1451A
        ;                                        * 1452E

* refs (3): 144D4 144FC 14529
OBJ_14533:
        :: ' nohalt DRPExitAtLOOP casedrop NOHALTERR * 14533
          Halted? NOTcaseDROP OBJ_14E54          * 14551
          OBJ_1444C                              * 14560
          CODE                                   * 14565  55 nibbles
            C=B     A                            * 1456F
            CD0EX                                * 14571
            B=C     A                            * 14574
            LC(5)   L_143DE                      * 14576
L_1457D:
            D0=D0-  5                            * 1457D
            D=D+1   A                            * 14580
            A=DAT0  A                            * 14582
            ?C#A    A                            * 14585
            GOYES   L_1457D                      * 14588
            D0=D0-  5                            * 1458A
            A=DAT0  A                            * 1458D
            D0=D0+  5                            * 14590
            DAT0=A  A                            * 14593
            D=D-1   A                            * 14596
            D0=D0+  5                            * 14598
            A=B     A                            * 1459B
            AD0EX                                * 1459D
            GOLONG  L_14F86                      * 145A0
          ENDCODE                                * 145A6
L_145A6:
          ticR case OBJ_14613                    * 145A6
          RDROP                                  * 145B5
          CODE                                   * 145BA  49 nibbles
            C=B     A                            * 145C4
            CD0EX                                * 145C6
            D0=D0-  5                            * 145C9
            A=DAT0  A                            * 145CC
            D0=C                                 * 145CF
            LC(5)   L_14E22                      * 145D2
            ?C#A    A                            * 145D9
            GOYES   L_145E8                      * 145DC
            LC(5)   FALSE                        * 145DE
            GONC    L_145EF                      * 145E5
L_145E8:
            LC(5)   TRUE                         * 145E8
L_145EF:
            A=C     A                            * 145EF
            PC=(A)                               * 145F1
          ENDCODE                                * 145F5
          caseDROP RDROP                         * 145F5
          RDUP GOTO L_145A6 ;                    * 145FF

* refs (1): 145B0
OBJ_14613:
        :: ' OBJ_14640 >R RSWAP ERRSET COLA OBJ_1470D * 14613
        ;                                        * 1463B

* refs (1): 1461D
OBJ_14640:
        ::                                       * 14640
L_14645:
          ERRTRAP OBJ_14654 ;                    * 14645

* refs (1): 1464A
OBJ_14654:
        :: DropSysObs RDROP ERROR@ BINT1 #= caseERRJMP ERROR@ * 14654
          #0=case ERRJMP                         * 1467C
          ERROR@ Err#Kill #= ?GOTO L_146AE SysErrorTrap GOTO L_14391 * 14686
L_146AE:
          OBJ_14EEC #0=?SKIP ERRJMP kill ;       * 146AE

L_146C7:
        CON(5)  OBJ_14EEC                        * 146C7  address (the code jumps or points through it)

        CON(5)  #1+                              * 146CC  address (the code jumps or points through it)

        CON(5)  RROLL                            * 146D1  address (the code jumps or points through it)

        CON(5)  RDROP                            * 146D6  address (the code jumps or points through it)

L_146DB:
        CON(5)  OBJ_14EEC                        * 146DB  address (the code jumps or points through it)

        CON(5)  DUP                              * 146E0  address (the code jumps or points through it)

        CON(5)  RROLL                            * 146E5  address (the code jumps or points through it)

        CON(5)  RROLL                            * 146EA  address (the code jumps or points through it)

        CON(5)  2RDROP                           * 146EF  address (the code jumps or points through it)

        CON(5)  ERRTRAP                          * 146F4  address (the code jumps or points through it)

        CON(5)  NOP                              * 146F9  address (the code jumps or points through it)

        CON(5)  GOTO                             * 146FE  address (the code jumps or points through it)

        CON(5)  L_14391                          * 14703  address (the code jumps or points through it)

        SEMI                                     * 14708

* refs (2): 14636 14C8F
OBJ_1470D:
        :: SWAP BINT0 #=casedrop OBJ_14762       * 1470D
          #1=case OBJ_147C1                      * 14726
          'R 2Ob>Seco ->StkStr22! OBJ_14D8C RDROP BINT2 OBJ_14F8C GOTO * 14730
          L_146DB ;                              * 14758

* refs (5): 14721 147D0 147DF 14802 14811
OBJ_14762:
        :: DUP OBJ_271C5 case EVAL               * 14762
          DROP REQcase xKILL                     * 1477B
          OBJ_1482A DUPTYPECOL? NOTcase OBJ_14DFA * 1478A
          INHARDROM? case OBJ_14DFA              * 1479E
          ZEROSWAP COLA OBJ_14DAA                * 147AD
        ;                                        * 147BC

* refs (1): 1472B
OBJ_147C1:
        :: DUPTYPEIDNT? NOTcase OBJ_14762        * 147C1
          DUPSAFE@ NOTcase OBJ_14762             * 147D5
          DUPTYPERRP? ITE DROPDUP SWAPDROPDUP    * 147E4
          TYPECOL? NOTcase OBJ_14762             * 147F8
          INHARDROM? case OBJ_14762              * 14807
          debug(rpl)! GsstFIN ;                  * 14816
        NIBHEX  E8E60                            * 14825  ←n

* refs (1): 1478A
OBJ_1482A:
        :: sstDISP kill ;                        * 1482A

* refs (1): 23434
OBJ_1483E:
        ::                                       * 1483E

* refs (2): 149C9 14B18
OBJ_14843:
          :: DUP PALPTRDCMP DROP ; OBJ_148C0 OBJ_148C0 OBJ_148C0 OBJ_148C0 * 14843
          BINT5 ' xIFEND 4PICK EQ ?GOTO L_148A7 DROP OBJ_148C0 OBJ_148C0 * 14870
          BINT7                                  * 148A2
L_148A7:
          SWAP OBJ_14D8C ::NEVAL GsstFIN ;       * 148A7

* refs (6): 1485C 14861 14866 1486B 14898 1489D
OBJ_148C0:
        :: RSWAP 'R RSWAP DUPUNROT OBJ_15156 SPACE$ !insert$ !append$ ; * 148C0

* refs (2): 23051 230E1
OBJ_148F2:
        :: sstDISP RDUP GsstFIN ;                * 148F2

* refs (1): 236DC
OBJ_1490B:
        :: sstDISP                               * 1490B
          :: xENDDO GOTO L_146C7 ; 2RDROP        * 14915
L_14933:
          OBJ_14EEC #1+ OBJ_14F8C GsstFIN ;      * 14933

* refs (1): 23080
OBJ_1494C:
        :: sstDISP xREPEAT GOTO L_146DB OBJ_14EEC #1+ RROLL RDROP OBJ_14EEC * 1494C
          OBJ_14F8C RSKIP RSKIP RSKIP GsstFIN ;  * 1497E

* refs (1): 236AD
OBJ_1499C:
        :: sstDISP OBJ_14EEC RDROP OBJ_14F8C GsstFIN ; * 1499C

* refs (1): 234FD
OBJ_149BF:
        ::                                       * 149BF

* refs (1): 14A5A
OBJ_149C4:
          :: OBJ_14843 ONESWAP ; GOTO L_14A0F    * 149C4
L_149E2:
          RSWAP RDROP 3UNROLL 3PICK ID>$ SPACE$ !insert$ !append$ * 149E2
          SWAP#1+SWAP                            * 14A0A
L_14A0F:
          RDUP ticR DROPDUP TYPELAM? ?GOTO L_149E2 RDROP DROP OBJ_14D8C * 14A0F
          ::NEVAL ERRSET OBJ_14FC3 GsstFIN ;     * 14A3C

* refs (1): 23027
OBJ_14A55:
        :: OBJ_149C4                             * 14A55
L_14A5F:
          SWAP#1+SWAP 'R 3UNROLL 3PICK DUP TYPELAM? NOT?GOTO L_14AA5 ID>$ * 14A5F
          SPACE$ !insert$ !append$ GOTO L_14A5F  * 14A8C
L_14AA5:
          ->StkStr22! CHR_Space >H$ CHR_Newline >H$ !append$ CHR_Space >H$ * 14AA5
          DISPSTATUS2 VERYSLOW ::NEVAL GsstFIN ; * 14ACD

* refs (1): 2313F
OBJ_14AE6:
        :: sstDISP xSTART RDROP ERRSET OBJ_14FC3 RDUP GsstFIN ; * 14AE6

* refs (1): 231DC
OBJ_14B13:
        :: OBJ_14843 SPACE$ &$ 'R DUPUNROT DUPTYPELIST? ITE ->StkStr22! ID>$ * 14B13
          !append$ OBJ_14D8C 2Ob>Seco EVAL ERRSET OBJ_14FC3 RDUP GsstFIN ; * 14B45

        :: DUP sstDISP                           * 14B72
          :: EVAL ERRSET GOTO L_146C7 ; 2RDROP GOTO L_14933 ; * 14B81

* refs (1): 2366D
OBJ_14BB3:
        :: 'R'R OVER DECOMP$ addtics OBJ_14D8C BINT3 ::NEVAL GsstFIN ; * 14BB3

* refs (1): 23490
OBJ_14BE5:
        :: sstDISP CK0NOLASTWD GsstFIN ;         * 14BE5

* refs (1): 23860
OBJ_14BFE:
        :: sstDISP Chk1&2Disp!(st)Fr GsstFIN ;   * 14BFE

* ob ->
* refs (13): 1482F 148F7 14910 14951 149A1 14AEB ...
sstDISP:
        :: PALPTRDCMP DROP OBJ_14D8C ;           * 14C17

* refs (1): 22F1D
OBJ_14C30:
        :: EVAL GOTO L_14C58 RSKIP 'R GOTO L_14C62 * 14C30
L_14C58:
          ' xTHEN                                * 14C58
L_14C62:
          sstDISP GsstFIN ;                      * 14C62

* refs (1): 22FC9
OBJ_14C71:
        :: DROP RSKIP 'R ZEROSWAP COLA OBJ_1470D * 14C71
        ;                                        * 14C94

* refs (1): 237D0
OBJ_14C99:
        :: sstDISP xTHENCASE                     * 14C99
          :: 'R'R RDROP 2Ob>Seco >R GsstFIN ; xIFEND RSKIP GsstFIN ; * 14CA8

* refs (1): 23612
OBJ_14CDF:
        :: ABND ERRSET sstDISP OBJ_14D1B GsstFIN ; * 14CDF

* refs (1): 23648
OBJ_14D02:
        :: sstDISP OBJ_14D1B GsstFIN ;           * 14D02

* refs (2): 14CF3 14D0C
OBJ_14D1B:
        CON(5)  (*)+5                            * 14D1B  primitive code object
        ASSEMBLE
        C=B     A                                * 14D20
        CD0EX                                    * 14D22
        D0=D0-  5                                * 14D25
        A=DAT0  A                                * 14D28
        D0=A                                     * 14D2B
        A=DAT0  A                                * 14D2E
        D0=C                                     * 14D31
        LC(5)   SEMI                             * 14D34
        ?C=A    A                                * 14D3B
        GOYES   L_14D44                          * 14D3E
L_14D40:
        GOTO    L_14F7C                          * 14D40
L_14D44:
        C=B     A                                * 14D44
        CD0EX                                    * 14D46
        D0=D0-  15                               * 14D49
        D0=D0-  5                                * 14D4C
        A=DAT0  A                                * 14D4F
        D0=C                                     * 14D52
        LC(5)   L_14E22                          * 14D55
        ?C=A    A                                * 14D5C
        GOYES   L_14D40                          * 14D5F
        LC(5)   OBJ_14D6E                        * 14D61
        A=C     A                                * 14D68
        PC=(A)                                   * 14D6A
        RPL

* refs (1): 14D61
OBJ_14D6E:
        :: RDROP 3RDROP ERRTRAP NOP ;            * 14D6E

* refs (8): 1473F 148AC 14A37 14B4A 14BCC 14C26 ...
OBJ_14D8C:
        :: CHR_Space >H$ DISPSTATUS2 SetDA1Temp ; * 14D8C

* refs (1): 147B7
OBJ_14DAA:
        :: ' ®nop¯ >R >R OBJ_14EEC DUP RROLL RROLL 2RDROP RDUP ERRTRAP NOP * 14DAA
          GOTO L_145A6 ;                         * 14DEB

* refs (2): 14799 147A8
OBJ_14DFA:
        :: DUP OBJ_15156 OBJ_14D8C EVAL GsstFIN ; * 14DFA

* refs (1): 14DB4
®nop¯:
        ::                                       * 14E1D
L_14E22:
          NOP ;                                  * 14E22

* refs (1): 234B5
OBJ_14E2C:
        :: DROP 'R DUP OBJ_15156 OBJ_14D8C GsstFIN ; * 14E2C

* refs (2): 143E3 1455B
OBJ_14E54:
        :: OBJ_14E6D case ABND                   * 14E54
        ;                                        * 14E68

* refs (2): 14E59 40D02
OBJ_14E6D:
        CON(5)  (*)+5                            * 14E6D  primitive code object
        ASSEMBLE
        CD0EX                                    * 14E72
        D0=(5)  TEMPENV                          * 14E75
        A=DAT0  A                                * 14E7C
        D0=A                                     * 14E7F
        D0=D0+  10                               * 14E82
        A=DAT0  A                                * 14E85
        D0=C                                     * 14E88
        LC(5)   SAVELAM                          * 14E8B
        ?C=A    A                                * 14E92
        GOYES   L_14E9E                          * 14E95
        GOVLNG  PushFLoop                        * 14E97
L_14E9E:
        GOVLNG  PushTLoop                        * 14E9E

* ->
* refs (10): 145FF 148FC 14A0F 14B04 14B63 14DDC ...
RDUP:
        CON(5)  (*)+5                            * 14EA5  primitive code object
        ST=0    10                               * 14EAA
L_14EAD:
        D=D-1   A                                * 14EAD
        GONC    L_14EB9                          * 14EAF
        GOSUB   SUB_14ED6                        * 14EB2
        GONC    L_14EAD                          * 14EB6
L_14EB9:
        C=B     A                                * 14EB9
        CD0EX                                    * 14EBB
        D0=D0-  5                                * 14EBE
        A=DAT0  A                                * 14EC1
        D0=D0+  5                                * 14EC4
        DAT0=A  A                                * 14EC7
        D0=D0+  5                                * 14ECA
        CD0EX                                    * 14ECD
        B=C     A                                * 14ED0
        GOTO    L_14F7C                          * 14ED2

* refs (2): 14EB2 1A6FE
SUB_14ED6:
        ?ST=1   10                               * 14ED6
        GOYES   L_14EE5                          * 14ED9
        ST=1    10                               * 14EDB
        GOVLNG  L_18382                          * 14EDE
L_14EE5:
        GOVLNG  DOMEMERR                         * 14EE5

* refs (9): 14433 146AE 146C7 146DB 14933 14965 ...
OBJ_14EEC:
        CON(5)  (*)+5                            * 14EEC  primitive code object
        GOSBVL  SAVPTR                           * 14EF1
        C=B     A                                * 14EF8
        D0=C                                     * 14EFA
        B=0     A                                * 14EFD
        LC(5)   L_14645                          * 14EFF
L_14F06:
        B=B+1   A                                * 14F06
        D0=D0-  5                                * 14F08
        A=DAT0  A                                * 14F0B
        ?A=0    A                                * 14F0E
        GOYES   L_14F1C                          * 14F11
        ?C#A    A                                * 14F13
        GOYES   L_14F06                          * 14F16
        B=B+1   A                                * 14F18
        A=B     A                                * 14F1A
L_14F1C:
        R0=A                                     * 14F1C
        GOSBVL  PUSH#                            * 14F1F
        GOTO    L_14F7C                          * 14F26

* #n ->
* refs (9): 146D1 146E5 146EA 1496F 14DCD 14DD2 ...
RROLL:
        CON(5)  (*)+5                            * 14F2A  primitive code object
        GOSBVL  POP#                             * 14F2F
        C=A     A                                * 14F36
        A=A+A   A                                * 14F38
        A=A+A   A                                * 14F3A
        A=A+C   A                                * 14F3C
        C=C-1   A                                * 14F3E
        GOC     L_14F7C                          * 14F40
        R0=C                                     * 14F43
        C=B     A                                * 14F46
        C=C-A   A                                * 14F48
        CD0EX                                    * 14F4A
        RSTK=C                                   * 14F4D
        C=DAT0  A                                * 14F4F
        RSTK=C                                   * 14F52
        D0=D0+  5                                * 14F54
        A=R0                                     * 14F57
L_14F5A:
        A=A-1   A                                * 14F5A
        GOC     L_14F6F                          * 14F5C
        C=DAT0  A                                * 14F5F
        D0=D0-  5                                * 14F62
        DAT0=C  A                                * 14F65
        D0=D0+  10                               * 14F68
        GOTO    L_14F5A                          * 14F6B
L_14F6F:
        D0=D0-  5                                * 14F6F
        C=RSTK                                   * 14F72
        DAT0=C  A                                * 14F74
        C=RSTK                                   * 14F77
        D0=C                                     * 14F79
L_14F7C:
        A=DAT0  A                                * 14F7C
        D0=D0+  5                                * 14F7F
        PC=(A)                                   * 14F82
L_14F86:
        B=A     A                                * 14F86
        GOTO    L_14F7C                          * 14F88

* refs (4): 1474E 1493D 1497E 149B0
OBJ_14F8C:
        CON(5)  (*)+5                            * 14F8C  primitive code object
        GOSBVL  POP#                             * 14F91
        C=A     A                                * 14F98
        A=A+A   A                                * 14F9A
        A=A+A   A                                * 14F9C
        A=A+C   A                                * 14F9E
        C=B     A                                * 14FA0
        C=C-A   A                                * 14FA2
        CD0EX                                    * 14FA4
        A=DAT0  A                                * 14FA7
        D0=C                                     * 14FAA
        C=B     A                                * 14FAD
        CD0EX                                    * 14FAF
        DAT0=A  A                                * 14FB2
        D=D-1   A                                * 14FB5
        D0=D0+  5                                * 14FB7
        CD0EX                                    * 14FBA
        B=C     A                                * 14FBD
        GOTO    L_14F7C                          * 14FBF

* refs (3): 14A46 14AFF 14B5E
OBJ_14FC3:
        CON(5)  (*)+5                            * 14FC3  primitive code object
        GOSBVL  SAVPTR                           * 14FC8
        D0=(5)  TEMPENV                          * 14FCF
        A=DAT0  A                                * 14FD6
        D0=A                                     * 14FD9
        C=DAT0  A                                * 14FDC
        A=A+C   A                                * 14FDF
        D0=A                                     * 14FE1
        C=DAT0  A                                * 14FE4
        ?C=0    A                                * 14FE7
        GOYES   L_14FFC                          * 14FEA
        D0=D0+  5                                * 14FEC
        C=DAT0  A                                * 14FEF
        ?C=0    A                                * 14FF2
        GOYES   L_14FFC                          * 14FF5
        C=C-1   A                                * 14FF7
        DAT0=C  A                                * 14FF9
L_14FFC:
        GOSBVL  GETPTR                           * 14FFC
        GOTO    L_14F7C                          * 15003
        RPL

* % ->
* refs (1): 1A348
DO%EXIT:
        :: COERCE DO#EXIT ;                      * 15007

* hxs ->
* refs (1): 1A35C
DOHXSEXIT:
        :: HXS># DO#EXIT ;                       * 1501B

* # ->
* refs (2): 15011 15025
DO#EXIT:
        :: ERRORSTO AtUserStack ERRJMP ;         * 1502F

* $ ->
* refs (2): 1A352 8E217
DO$EXIT:
        :: EXITMSGSTO #EXITERR ERRORSTO AtUserStack ERRJMP ; * 15048

* refs (3): 14551 38764 39713
Halted?:
        :: ' Π'halt DRPExitAtLOOP NOTcaseFALSE DROPTRUE * 1506B
        ;                                        * 15089

* prog -> name ->
* refs (1): C5D50
xDBUG:
        :: CK1NOLASTWD CK&DISPATCH1              * 1508E
          BINT8 debug(rpl)                       * 1509D  program
          BINT6 debug(nm)                        * 150A7  name
          BINT7 debug(nm)                        * 150B1  local
        ;                                        * 150BB

* refs (2): 150A2 1514C
debug(rpl):
        :: INHARDROM? case SETTYPEERR            * 150C0
          COLA debug(rpl)!                       * 150D4
        ;                                        * 150DE

* refs (2): 14816 150D9
debug(rpl)!:
        :: DUP >R CARCOMP ' x<< EQIT             * 150E3
          :: RSWAP RSKIP RSWAP ; COLA halt       * 15106
        ;                                        * 15129

* refs (2): 150AC 150B6
debug(nm):
        :: SAFE@ NOTcase SETNONEXTERR            * 1512E
          CK&DISPATCH1                           * 15142
          BINT8 debug(rpl)                       * 15147  program
        ;                                        * 15151

* refs (3): 148D9 14E04 14E40
OBJ_15156:
        ::                                       * 15156
          :: DUPTYPECOL? ?SEMI                   * 1515B
            Ob>Seco ;                            * 1516A

* refs (13): 1473A 14AA5 14B3B 1527D 153CF 1540B ...
->StkStr22!:
          :: setStdWid 1stkdecomp$w ; ;          * 15174

* refs (20): 1481B 148B6 14901 14942 14992 149B5 ...
GsstFIN:
        CON(5)  (*)+5                            * 1518D  primitive code object
        ASSEMBLE
        LC(5)   L_146DB                          * 15192
        D0=C                                     * 15199
        A=DAT0  A                                * 1519C
        D0=D0+  5                                * 1519F
        PC=(A)                                   * 151A2
        RPL

* ->
* refs (2): 1528C 3FB5F
SolvMenuInit:
        :: ' OBJ_154CD MenuKeyNS! ' OBJ_155B3 MenuKeyLS! ' OBJ_1559A * 151A6
          MenuKeyRS! ' PutStoLabel(s,_) LabelDef! ' EQReview ReviewKey! * 151D3
          OBJ_3BCE2 ;                            * 151F6

* refs (3): 15352 3BE68 3C329
OBJ_15200:
        :: PTR InitTrack: OBJ_3AE0C DORCLE DUP EqList? NOTcase * 15200

* refs (1): 1529B
OBJ_15223:
          :: DUPTYPELIST? ITE                    * 15223
            :: INNERCOMP #2= NcaseSIZEERR DUPTYPELIST? * 15232
              NcaseSIZEERR SWAPDROP              * 1524B
            ;                                    * 15255
            FINDVAR                              * 1525A
            {EXPR} >TCOMP OBJ_479D4 ?SKIP        * 1525F

1FrDispEQ:
            :: Trceq ->StkStr22! 1FrDisp(st) ;   * 15273
            SolvMenuInit ;                       * 1528C
          OBJ_15366 OBJ_15223 BINT6 OVER LENCOMP OVER #/ DROP #-DUP #1= ITE * 15296
          DROP                                   * 152CD

+NullEntries(li,s):
          :: ONE_DO NullMenuKey >TCOMP LOOP ;    * 152D2
          {NXEQ} >TCOMP ;                        * 152F0

* ob ->
* refs (10): 15219 47885 498A8 49AF6 4A0BE 4B797 ...
EqList?:
        :: DUPTYPELIST? NOTcsdrpfls BINT2 NTHELCOMP NOTcaseTRUE TYPELIST? * 152FF
          NOT ;                                  * 15322

* refs (1): 152F0
{NXEQ}:
        {                                        * 1532C

_NXEQ_:
          $ "NXEQ"                               * 15331

\NXEQ:
          :: NextInEQ! ' OBJ_15200 InitMenu ; }  * 15343

* refs (1): 15296
OBJ_15366:
        :: BINT1 NTHELCOMP NOTcase NOEQERR       * 15366
          OBJ_15389 ;                            * 1537F

* refs (3): 1537F 4A0EB 4A113
OBJ_15389:
        :: DUPTYPEIDNT? NOT?SEMI                 * 15389
          OBJ_473E6 OVER EQUAL ?SEMI             * 15398
          DUPSAFE@ NOT?SEMI                      * 153AC
          SWAPDROP ;                             * 153B6

* refs (1): 151EC
EQReview:
        :: BlankDA12 Trceq ->StkStr22! DISPSTATUS2 * 153C0
          :: BINT7 ONE_DO INDEX@ GETPROC DUPTYPEIDNT? ITE * 153D9

DispVarsUtil:
            :: DUPSAFE@ ITE ->StkStr22!          * 153FC

* refs (5): 46946 8C59A 8C871 8CA70 8CBB4
Message60E:
              :: OBJ_49171 JstGetTHEMESG ;       * 15410

DoSt:(nm,st):
              :: SWAP ID>$ BINT1 BINT8 SUB$ $ ": " !append$SWAP !append$ ; * 15424
              INDEX@ #1+ DISPN ;                 * 1545F
            DROP                                 * 15473
            LOOP SetDA12Temp ;                   * 15478
        ;                                        * 15487

* refs (1): 151DD
PutStoLabel(s,_):
        :: DUPTYPEIDNT? OVER NULL$ EQUALOR NOTcase >MENU * 1548C
          DUPTYPEIDNT? IT ID>$                   * 154AF
          MakeInvLabel Grob>Menu ;               * 154BE

* refs (1): 151B0
OBJ_154CD:
        :: DUPTYPEIDNT? ImmedEntry? ANDNOTcase StdMenuKeyNS * 154CD
          ' OBJ_154FA DoNameKeyLRS ;             * 154E6

* refs (1): 154EB
OBJ_154FA:
        :: CK2NOLASTWD STRIPTAGSl2 OVER FINDVAR OVERSWAP matchob? ITE * 154FA
          SETCIRCERR DROP                        * 15522

* refs (2): 49BB9 B4CC3
OBJ_1552C:
          :: dup;RclInVars(gn)? IT               * 1552C

* % ob ob' -> % ob % ob u -> u' ob
* refs (3): 490F3 49130 9E58B
KeepUnit:
            :: DUPTYPEEXT? 4PICK TYPEREAL? ANDNOTcase DROP * 1553B
              ROTSWAP UM>U SWAP ;                * 15559
          ;                                      * 1556D
          2DUP XEQStoKey SWAP PromptIdUtil APPprompt1! SetDA1Valid * 15572
          SetDA3NoCh ;                           * 15590

* refs (1): 151CE
OBJ_1559A:
        :: dIDNTNcase StdRightShift              * 1559A
          DoNameKeyRS ;                          * 155A9

* refs (1): 151BF
OBJ_155B3:
        :: DUPTYPEIDNT? ImmedEntry? ANDNOTcase StdMenuKeyLS * 155B3
          ' SolvEQ(nm) DoNameKeyLRS ;            * 155CC

* refs (1): 155D1
SolvEQ(nm):
        :: rceq! OVERDUP                         * 155E0

{'nohalt}:
          { nohalt } BIND ID>$ OBJ_4918F JstGetTHEMESG SWAP&$ APPprompt1! * 155EF
          SWAPDUP SAFE@ ?SKIP %0_2A2B4           * 1561C
          SYMBNUMSOLVE ?SKIP                     * 15630

Lpop;error(s):
          :: ABND ERRORSTO CK0NOLASTWD ERRJMP ;  * 1563A
          nohalt SWAP' nohalt STO ID>TAG nohalt ABND GETTHEMESG APPprompt1! * 15658
          SetDA1Temp ;                           * 15685

* refs (10): 15891 47862 4894F 4899F 49D8F 49DDA ...
ALGeq?:
        ::                                       * 1568F
          CODE                                   * 15694  71 nibbles
            C=DAT1  A                            * 1569E
            CD1EX                                * 156A1
            A=DAT1  A                            * 156A4
            D1=C                                 * 156A7
            LC(5)   DOLIST                       * 156AA
            ?C=A    A                            * 156B1
            GOYES   L_156CE                      * 156B4
            LC(5)   DOCOL                        * 156B6
            ?C=A    A                            * 156BD
            GOYES   L_156CE                      * 156C0
            LC(5)   DOSYMB                       * 156C2
            ?C#A    A                            * 156C9
            GOYES   L_156D8                      * 156CC
L_156CE:
            LC(5)   TRUE                         * 156CE
            GONC    L_156DF                      * 156D5
L_156D8:
            LC(5)   FALSE                        * 156D8
L_156DF:
            A=C     A                            * 156DF
            PC=(A)                               * 156E1
          ENDCODE                                * 156E5
          DUP NOTcase SWAPDROP                   * 156E5
          DROP DUPLENCOMP NTHCOMPDROP ' x= EQ ;  * 156F4

* ob ->
* refs (15): 1F15D 44F7C 48FC2 49B3C 8A315 8A6E8 ...
DOSTOE:
        :: 'EQ XEQSTOID ;                        * 15717

* -> ob
* refs (12): 1520F 1F13D 498A3 49AEC 4B78D 8AB2C ...
DORCLE:
        :: EQUATION ?SKIP NOEQERR                * 1572B
        ;                                        * 1573F

* -> ob T -> F
* refs (6): 15730 4690A 4A0AF 4A606 4BF76 50E1D
EQUATION:
        :: 'EQ OBJ_4735A ;                       * 15744

* refs (13): 1571C 15749 47391 47871 478A8 49B0F ...
'EQ:
        :: ' CUREQ ;                             * 15758

* ID EQ
* refs (3): 15762 C5362 C536C
CUREQ:
        ID EQ                                    * 1576C

* -> id
* refs (2): 399B1 8555A
NULLID:
        :: '                                     * 15777

'':
          ID "" ;                                * 15781

* ob -> %
* refs (11): 15850 1A5F3 1DF76 22F7C 33D23 36D9E ...
CRUNCH:
        :: NOTNUM? SETNUM ITE OBJ_157B0 OBJ_157E2 * 1578D
        ;                                        * 157AB

* refs (1): 157A1
OBJ_157B0:
        :: ERRSET                                * 157B0
          :: EVAL ->num(ex) ; ERRTRAP cf(-3);error CLRNUM ; * 157BA

* refs (1): 157A6
OBJ_157E2:
        :: ERRSET                                * 157E2
          :: EVAL ->num(ex) ; ERRTRAP sf(-3);error SETNUM ; * 157EC

* refs (4): 157D3 5A063 B6A57 D20C8
cf(-3);error:
        :: CLRNUM ERRJMP ;                       * 15814

* refs (4): 15805 5A081 B6A7A D20E6
sf(-3);error:
        :: SETNUM ERRJMP ;                       * 15828

* refs (6): 15946 4696E 495DD 4EF87 51369 8C581
EVALCRUNCH:
        :: EVAL DEPTH #0=?SKIP CRUNCH ;          * 1583C

* refs (1): 1525F
{EXPR}:
        {                                        * 1585A

_EXPR_:
          $ "EXPR=" Trceq! }                     * 1585F

* refs (1): 15873
Trceq!:
        :: AtUserStack rceq! DUP ALGeq? case     * 1587D

2tag(eq):
          :: SPLITEQ 1LAMBIND 'EvalNoCK:_sup xEVAL CK1NoBlame * 1589B

* refs (1): A306E
OBJ_158B9:
            # A07 OBJ_15909 1GETABND 'EvalNoCK:_sup xEVAL CK1NoBlame * 158B9

* refs (1): A307D
OBJ_158DC:
            # A08 OBJ_15909 ;                    * 158DC
          'EvalNoCK:_sup xEVAL CK1NoBlame        * 158F0

* refs (1): A3091
OBJ_158FF:
          # A09                                  * 158FF  2569

* refs (30): 158C3 158E6 99024 99038 9904C A3073 ...
OBJ_15909:
          :: JstGetTHEMESG >TAG ; ;              * 15909
        BSS     11                               * 15922

* ->
* refs (10): 158B4 158D7 158FA 1594B 1DF7B 49623 ...
CK1NoBlame:
        :: 0LASTOWDOB! CK1NOLASTWD ;             * 1592D

* refs (5): 47642 49753 49846 499D6 49E52
CRUNCHNoBlame:
        :: EVALCRUNCH CK1NoBlame ;               * 15941

* refs (1): 39DF1
DoSt:22(s,_):
        :: OBJ_16969 COLA DoSt:(s,_,s)           * 15955
        ;                                        * 15969

* refs (3): 15964 2D974 318D1
DoSt:(s,_,s):
        :: !DcompWidth                           * 1596E

* ob -> $
* refs (8): 1517E 31985 4689C 468D3 49871 4A019 ...
1stkdecomp$w:
          :: OBJ_53914 ERRSET stkdecomp$w ERRTRAP OBJ_159AF OBJ_159B4 ; SWAP * 15978
          stackitw ;                             * 159A5

* refs (3): 15991 16126 16252
OBJ_159AF:
        ::                                       * 159AF

* refs (4): 15996 15A13 15B18 161D5
OBJ_159B4:
          :: OBJ_53922 OBJ_539D8 ; ERRJMP ;      * 159B4

* refs (2): 4EBC2 8D6AC
OBJ_159D2:
        :: setStdWid COLA stkdecomp$w            * 159D2
        ;                                        * 159E6

* ob -> $
* refs (2): 15987 159E1
stkdecomp$w:
        CON(5)  (*)+5                            * 159EB  primitive code object
        ASSEMBLE
        ST=1    3                                * 159F0
        ST=0    4                                * 159F3
        GOTO    L_15B48                          * 159F6
        RPL

* ->
* refs (4): 15179 159D7 15A18 15B1D
setStdWid:
        :: OBJ_16969 !DcompWidth ;               * 159FA

* ob -> $
* refs (21): 20E89 222F8 2DC7A 2DCA2 31C7C 408E6 ...
EDITDECOMP$:
        :: OBJ_159B4 setStdWid savefmt1 ERRSET editdecomp$w ERRTRAP ederr * 15A0E
          rstfmt1 ;                              * 15A36

* ->
* refs (4): 15A31 2FCB8 45DE3 468E2
ederr:
        :: rstfmt1 ERRJMP ;                      * 15A40

* refs (3): 352A5 352B4 3530E
RclOldMode:
        CON(5)  (*)+5                            * 15A54  primitive code object
        ASSEMBLE
        ST=0    1                                * 15A59
        GOTO    L_15A68                          * 15A5C

* ->
* refs (7): 15A36 15A45 2FCBD 45DE8 468E7 D80F5 ...
rstfmt1:
        CON(5)  (*)+5                            * 15A60  primitive code object
        ST=1    1                                * 15A65
L_15A68:
        GOSUB   SUB_15AD5                        * 15A68
        A=DAT0  B                                * 15A6C
        DAT1=A  B                                * 15A6F
        D0=D0+  2                                * 15A72
        D1=(5)  #8084E                           * 15A75
        A=DAT0  B                                * 15A7C
        DAT1=A  B                                * 15A7F
        P=      0                                * 15A82
L_15A84:
        GOVLNG  GETPTRLOOP                       * 15A84

* ->
* refs (5): 15A1D 2FCA4 45DC0 468BA D80D6
savefmt1:
        CON(5)  (*)+5                            * 15A8B  primitive code object
        ST=1    1                                * 15A90
        GOTO    L_15A9F                          * 15A93

* refs (2): 3528C 352F5
TempStd:
        CON(5)  (*)+5                            * 15A97  primitive code object
        ST=0    1                                * 15A9C
L_15A9F:
        GOSUB   SUB_15AD5                        * 15A9F
        P=      0                                * 15AA3
        A=DAT1  B                                * 15AA5
        DAT0=A  B                                * 15AA8
        D0=D0+  2                                * 15AAB
        LC(2)   #3F                              * 15AAE
        A=A!C   B                                * 15AB2
        DAT1=A  B                                * 15AB6
        D1=(5)  #8084E                           * 15AB9
        A=DAT1  B                                * 15AC0
        DAT0=A  B                                * 15AC3
        LC(2)   #CF                              * 15AC6
        A=A&C   B                                * 15ACA
        DAT1=A  B                                * 15ACE
        GOTO    L_15A84                          * 15AD1

* refs (2): 15A68 15A9F
SUB_15AD5:
        GOSBVL  SAVPTR                           * 15AD5
        D0=(5)  leeway                           * 15ADC
        C=DAT0  A                                * 15AE3
        D0=C                                     * 15AE6
        D0=D0+  10                               * 15AE9
        D1=(5)  #80844                           * 15AEC
        ?ST=1   1                                * 15AF3
        RTNYES                                   * 15AF6
        D0=D0+  5                                * 15AF8
        RTN                                      * 15AFB

* refs (1): 16861
SUB_15AFD:
        AD0EX                                    * 15AFD
        D0=(5)  DcompWidth                       * 15B00
        LC(2)   #13                              * 15B07
        DAT0=C  B                                * 15B0B
        AD0EX                                    * 15B0E
        RTNCC                                    * 15B11
        RPL

* ob -> $
* refs (14): 14BC2 1ACAC 1ACC5 2261D 268A9 2F15D ...
DECOMP$:
        :: OBJ_159B4 setStdWid COLA OBJ_15B3D    * 15B13
        ;                                        * 15B2C

* ob -> $
* refs (2): 140A1 15A27
editdecomp$w:
        CON(5)  (*)+5                            * 15B31  primitive code object
        ASSEMBLE
        ST=1    4                                * 15B36
        GOTO    L_15B45                          * 15B39

* refs (2): 15B27 16FF2
OBJ_15B3D:
        CON(5)  (*)+5                            * 15B3D  primitive code object
        ST=0    4                                * 15B42
L_15B45:
        ST=0    3                                * 15B45
L_15B48:
        GOSUB   SUB_15C5F                        * 15B48

* Decompiler handlers by object type (walked by SUB_15C5F): prolog, handler when ST3 is set, handler when it is clear
        CON(5)  DOREAL                           * 15B4C  entry 0
        CON(5)  ->str1(r)                        * 15B51
        CON(5)  a%>$                             * 15B56
        CON(5)  DOIDNT                           * 15B5B  entry 1
        CON(5)  ->str1(nm)                       * 15B60
        CON(5)  ->str2(nm)                       * 15B65
        CON(5)  DOARRY                           * 15B6A  entry 2
        CON(5)  ->str1(ar)                       * 15B6F
        CON(5)  ->str2(ar)                       * 15B74
        CON(5)  DOLIST                           * 15B79  entry 3
        CON(5)  ->str1(ar)                       * 15B7E
        CON(5)  ->str2(ar)                       * 15B83
        CON(5)  DOCOL                            * 15B88  entry 4
        CON(5)  ->str1(ar)                       * 15B8D
        CON(5)  ->str2(ar)                       * 15B92

Ø^qρntáF¸*0ÐaÑæÑ`QN*:
        CON(5)  DOCSTR                           * 15B97  entry 5
        CON(5)  ->str1(st)                       * 15B9C
        CON(5)  ->str2(st)                       * 15BA1

(-0.22381746617E46>,-1.0266516:
        CON(5)  DOCMP                            * 15BA6  entry 6
        CON(5)  ->str(c)                         * 15BAB
        CON(5)  ->str(c)                         * 15BB0
        CON(5)  DOSYMB                           * 15BB5  entry 7
        CON(5)  ->str1(ex)                       * 15BBA
        CON(5)  ->str2(ar)                       * 15BBF
        CON(5)  DOLAM                            * 15BC4  entry 8
        CON(5)  ->str1(nm)                       * 15BC9
        CON(5)  ->str2(nm)                       * 15BCE
        CON(5)  DOHSTR                           * 15BD3  entry 9
        CON(5)  HXS>$                            * 15BD8
        CON(5)  ->str2(b)                        * 15BDD
        CON(5)  DOEXT                            * 15BE2  entry 10
        CON(5)  ->str1(ex)                       * 15BE7
        CON(5)  ->str2(ar)                       * 15BEC
        CON(5)  DOTAG                            * 15BF1  entry 11
        CON(5)  ->str1(ar)                       * 15BF6
        CON(5)  ->str2(ar)                       * 15BFB
        CON(5)  DORRP                            * 15C00  entry 12
        CON(5)  ->str1(ar)                       * 15C05
        CON(5)  ->str2(ar)                       * 15C0A
        CON(5)  DOLIB                            * 15C0F  entry 13
        CON(5)  ->str(lb)                        * 15C14
        CON(5)  ->str(lb)                        * 15C19
        CON(5)  DOBAK                            * 15C1E  entry 14
        CON(5)  ->Str(bk)                        * 15C23
        CON(5)  ->Str(bk)                        * 15C28
        CON(5)  DOGROB                           * 15C2D  entry 15
        CON(5)  ->str1(go)                       * 15C32
        CON(5)  ->str2(go)                       * 15C37
        CON(5)  DOROMP                           * 15C3C  entry 16
        CON(5)  ->str(xn)                        * 15C41
        CON(5)  ->str(xn)                        * 15C46
        CON(5)  DOBINT                           * 15C4B  entry 17
        CON(5)  ->str(s)                         * 15C50
        CON(5)  ->str(s)                         * 15C55
        CON(5)  0                                * 15C5A  end of table

* refs (1): 15B48
SUB_15C5F:
        GOSBVL  SAVPTR                           * 15C5F
        GOSBVL  Rom-Word?                        * 15C66
        GONC    L_15C84                          * 15C6D
        LC(5)   OBJ_16153                        * 15C70
L_15C77:
        A=C     A                                * 15C77
L_15C79:
        GOSBVL  GETPTR                           * 15C79
        PC=(A)                                   * 15C80
L_15C84:
        D1=A                                     * 15C84
        A=DAT1  A                                * 15C87
        C=RSTK                                   * 15C8A
        D0=C                                     * 15C8C
L_15C8F:
        C=DAT0  A                                * 15C8F
        ?C=A    A                                * 15C92
        GOYES   L_15CA9                          * 15C95
        D0=D0+  15                               * 15C97
        ?C#0    A                                * 15C9A
        GOYES   L_15C8F                          * 15C9D
        LC(5)   _type(_)_                        * 15C9F
        GONC    L_15C77                          * 15CA6
L_15CA9:
        D0=D0+  5                                * 15CA9
        ?ST=1   3                                * 15CAC
        GOYES   L_15CB4                          * 15CAF
        D0=D0+  5                                * 15CB1
L_15CB4:
        A=DAT0  A                                * 15CB4
        GOTO    L_15C79                          * 15CB7
        RPL

* refs (2): 15C9F 16162
_type(_)_:
        :: NULL$SWAP OBJ_15CCF ;                 * 15CBB

* refs (6): 15CC5 17077 17CCE 181A5 2DC8E 39E05
OBJ_15CCF:
        :: XEQTYPE SWAPDROP COERCE BINT27 #MIN BINT_263d #+ JstGetTHEMESG &$ ; * 15CCF

* refs (2): 15C50 15C55
->str(s):
        :: #>HXS HXS>$ BINT3 LAST$ CHR_< >H$ CHR_> >T$ ; * 15D06

* refs (2): 15C14 15C19
->str(lb):
        :: DUP LIB># DROP #:>$ APPEND_SPACE SWAP BAKNAME DROP ID>$ !!append$ * 15D38

* 279d 117h
BINT_117h:
          # 117                                  * 15D6F  279

* refs (2): 15DB5 15E15
AddMessage(st,s):
          :: GETTHEMESG APPEND_SPACE !!insert$ ; ; * 15D79

* refs (2): 15C23 15C28
->Str(bk):
        :: BAKNAME DROP ID>$ # 118 AddMessage(st,s) ; * 15D97

* refs (2): 15E06 15E3D
OBJ_15DBF:
        :: SWAP GROBDIM #>$ SWAP #>$ SWAPROT !!append$ !!insert$ ; * 15DBF

* refs (4): 15C32 15E2E 31A75 41323
->str1(go):
        ::                                       * 15DF1

_chr(215)_:
          $ " × " OBJ_15DBF # 112 AddMessage(st,s) ; * 15DF6

* refs (1): 15C37
->str2(go):
        :: OBJ_53930 case ->str1(go)             * 15E1F
          DUP SPACE$ OBJ_15DBF APPEND_SPACE $ "GROB " !!insert$ SWAP BINT11 * 15E33
          MINUSONE SUBHXS longhxs !!append$ ;    * 15E6A

* refs (2): 15E74 15FB0
longhxs:
        :: NULL$TEMP OVER LENHXS #2* EXPAND OBJ_15FCF ; * 15E83

* refs (2): 15F33 15FC5
OBJ_15EAB:
        :: OVERLEN$ #>$ APPEND_SPACE SWAP !!insert$ SWAP !!append$ ; * 15EAB

* refs (1): 15BA1
->str2(st):
        :: OBJ_53930 case ->str1(st)             * 15ED8
          DUP CHR_DblQuote                       * 15EEC

* $ $find/chr -> #pos -> #0
* refs (1): 42C4C
ONEPOS$:
          :: BINT1 POS$ ; #0=case add2_(st)      * 15EF6
          OBJ_5395A case add2_(st)               * 15F14
          $ "C$ " OBJ_15EAB ;                    * 15F23

* refs (2): 15B9C 15EE7
->str1(st):
        :: OBJ_53930 NOTcase add2_(st)           * 15F3D
          BINT1 DcompWidth@ DUP BINT255d #> ITE 2DROP SUB$ * 15F51
          add2_(st) ;                            * 15F79

* refs (1): 15BDD
->str2(b):
        :: OBJ_53930 case HXS>$                  * 15F83
          DUP LENHXS BINT17 #<case HXS>$         * 15F97
          longhxs $ "C# " OBJ_15EAB ;            * 15FB0

* refs (1): 15EA1
OBJ_15FCF:
        CON(5)  (*)+5                            * 15FCF  primitive code object
        ASSEMBLE
        D=D+1   A                                * 15FD4
        A=DAT1  A                                * 15FD6
        D1=D1+  5                                * 15FD9
        GOSBVL  SAVPTR                           * 15FDC
        D0=A                                     * 15FE3
        D0=D0+  10                               * 15FE6
        C=DAT1  A                                * 15FE9
        DAT1=A  A                                * 15FEC
        D1=C                                     * 15FEF
        D1=D1+  5                                * 15FF2
        A=DAT1  A                                * 15FF5
        B=A     A                                * 15FF8
        C=0     W                                * 15FFA
        LC(1)   #5                               * 15FFD
