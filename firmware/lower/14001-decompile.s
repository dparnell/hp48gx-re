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
        ::                                       * 1404C
          ERRN                                   * 14051
          UNCOERCE                               * 14056
          %>#                                    * 1405B
        ;                                        * 14060

* -> $
* refs (1): 1A3AD
ERRM:
        ::                                       * 14065
          ERRN                                   * 1406A
          BINT0                                  * 1406F
          #=casedrop                             * 14074
          NULL$                                  * 14079
          GETTHEMESG                             * 1407E
        ;                                        * 14083

* $ -> $ ob -> $
* refs (12): 140B5 1CB15 26895 9F7A1 9F83B A0CAE ...
DO>STR:
        ::                                       * 14088
          BINT0                                  * 1408D
          !DcompWidth                            * 14092
          DUPTYPECSTR?                           * 14097
          ?SEMI                                  * 1409C
          editdecomp$w                           * 140A1
        ;                                        * 140A6

* ob %row ->
* refs (1): 1A593
DODISP:
        ::                                       * 140AB
          SWAP                                   * 140B0
          DO>STR                                 * 140B5
          SWAP                                   * 140BA
          COERCE                                 * 140BF
          DUP#0=IT                               * 140C4
          #1+                                    * 140C9
          BINT7                                  * 140CE
          DUPROT                                 * 140D3
          #MIN                                   * 140D8
          SWAPOVER#-                             * 140DD
          #1+                                    * 140E2
          Disp5x7                                * 140E7
        ;                                        * 140EC

* % -> $
* refs (1): 1CB75
DOCHR:
        ::                                       * 140F1
          COERCE                                 * 140F6
          #>CHR                                  * 140FB
          NULL$SWAP                              * 14100
          >T$                                    * 14105
        ;                                        * 1410A

* $ -> CHR
* refs (1): 1CB55
DONUM:
        ::                                       * 1410F
          DUPNULL$?                              * 14114
          ITE                                    * 14119
          DROPZERO                               * 1411E
          CAR$                                   * 14123
          CHR>#                                  * 14128
          UNCOERCE                               * 1412D
        ;                                        * 14132

* $ -> ?
* refs (3): 1CB35 1CF9E D14D2
DOSTR>:
        ::                                       * 14137
          palparse                               * 1413C
          case                                   * 14141
          EVAL                                   * 14146
          2DROP                                  * 1414B
          SYNTAXERR                              * 14150
        ;                                        * 14155

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
          COERCESWAP                             * 14199
          COERCE                                 * 1419E
          setbeep                                * 141A3
          OBJ_4241B                              * 141A8
        ;                                        * 141AD

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
        ::                                       * 142A6
          SWAP                                   * 142AB
          $>$?                                   * 142B0
        ;                                        * 142B5

* $ $' -> flag
* refs (1): 1EDBE
$>=$?:
        ::                                       * 142BA
          $<$?                                   * 142BF
L_142C4:
          %1                                     * 142C4
          %=                                     * 142C9
          case                                   * 142CE
          %0_2A2B4                               * 142D3
          %1                                     * 142D8
        ;                                        * 142DD

* $ $' -> flag
* refs (1): 1ED1F
$<=$?:
        ::                                       * 142E2
          $>$?                                   * 142E7
          GOTO                                   * 142EC
          L_142C4                                * 142F1
        ;                                        * 142F6

* % ->
* refs (1): 1A5B3
Ck&Freeze:
        ::                                       * 142FB
          COERCE                                 * 14300
          BINT7                                  * 14305
          #MIN                                   * 1430A
          DUP#0=IT                               * 1430F

drop;<7>:
          ::                                     * 14314
            DROP                                 * 14319
            BINT7                                * 1431E
          ;                                      * 14323
          DUPONE                                 * 14328
          #AND                                   * 1432D
          #0<>                                   * 14332
          IT                                     * 14337
          SetDA1Temp                             * 1433C
          DUPTWO                                 * 14341
          #AND                                   * 14346
          #0<>                                   * 1434B
          IT                                     * 14350
          SetDA2OKTemp                           * 14355
          BINT4                                  * 1435A
          #AND                                   * 1435F
          #0<>                                   * 14364
          IT                                     * 14369
          SetDA3Temp                             * 1436E
        ;                                        * 14373

* refs (3): 15124 23481 23851
halt:
        ::                                       * 14378
          CK0NOLASTWD                            * 1437D
          SuspendOK?                             * 14382
          NOTcase                                * 14387
          NOHALTERR                              * 1438C
L_14391:
          UNDO_ON?                               * 14391

{'halt}:
          {                                      * 14396

* refs (3): 1440B 14451 15075
Π'halt:
            LAM     'halt                        * 1439B
          }                                      * 143AC
          BIND                                   * 143B1
          ERRSET                                 * 143B6
          ::                                     * 143BB
            UNDO_ON?                             * 143C0
            IT                                   * 143C5
            SAVESTACK                            * 143CA
            GOTO                                 * 143CF
            L_385B1                              * 143D4
          ;                                      * 143D9
L_143DE:
          ERRTRAP                                * 143DE
          OBJ_14E54                              * 143E3
          OBJ_1444C                              * 143E8
          DropSysObs                             * 143ED
          ERROR@                                 * 143F2
          Err#Cont                               * 143F7
          #=                                     * 143FC
          ?SEMI                                  * 14401
          '                                      * 14406
          Π'halt                                 * 1440B
          DRPExitAtLOOP                          * 14410
          casedrop                               * 14415
          ERRJMP                                 * 1441A
          ERROR@                                 * 1441F
          Err#Kill                               * 14424
          #<>case                                * 14429
          ERRJMP                                 * 1442E
          OBJ_14EEC                              * 14433
          #0=case                                * 14438
          ABORT                                  * 1443D
          ERRJMP                                 * 14442
        ;                                        * 14447

* refs (2): 143E8 14560
OBJ_1444C:
        ::                                       * 1444C
          Π'halt                                 * 14451
          UNDO_ON                                * 14456
          ?SKIP                                  * 1445B
          UNDO_OFF                               * 14460
          ABND                                   * 14465
        ;                                        * 1446A

* -> flag
* refs (8): 14382 144B6 144E3 1450B 3DE4A 40CF8 ...
SuspendOK?:
        ::                                       * 1446F
          AppSuspOK?                             * 14474
          NOTcaseFALSE                           * 14479
          '                                      * 1447E

* -> ob
* refs (13): 1453D 155F4 15658 15662 15671 2DA27 ...
nohalt:
          LAM     'nohalt                        * 14483
          DRPExitAtLOOP                          * 14498
          NOTcaseTRUE                            * 1449D
          DROPFALSE                              * 144A2
        ;                                        * 144A7

* refs (1): C5DB1
next:
        ::                                       * 144AC
          TakeOver                               * 144B1
          SuspendOK?                             * 144B6
          NOTcase                                * 144BB
          DoBadKey                               * 144C0
          CK0NOLASTWD                            * 144C5
          BINT2                                  * 144CA
          COLA                                   * 144CF
          OBJ_14533                              * 144D4
        ;                                        * 144D9

* refs (1): C5D90
sstdown:
        ::                                       * 144DE
          SuspendOK?                             * 144E3
          NOTcase                                * 144E8
          DoBadKey                               * 144ED
          CK0NOLASTWD                            * 144F2
          ONECOLA                                * 144F7
          OBJ_14533                              * 144FC
        ;                                        * 14501

* refs (1): C5D6F
sst:
        ::                                       * 14506
          SuspendOK?                             * 1450B
          NOTcase                                * 14510
          DoBadKey                               * 14515
          CK0NOLASTWD                            * 1451A
          BINT0                                  * 1451F
          COLA                                   * 14524
          OBJ_14533                              * 14529
        ;                                        * 1452E

* refs (3): 144D4 144FC 14529
OBJ_14533:
        ::                                       * 14533
          '                                      * 14538
          nohalt                                 * 1453D
          DRPExitAtLOOP                          * 14542
          casedrop                               * 14547
          NOHALTERR                              * 1454C
          Halted?                                * 14551
          NOTcaseDROP                            * 14556
          OBJ_14E54                              * 1455B
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
          ticR                                   * 145A6
          case                                   * 145AB
          OBJ_14613                              * 145B0
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
          caseDROP                               * 145F5
          RDROP                                  * 145FA
          RDUP                                   * 145FF
          GOTO                                   * 14604
          L_145A6                                * 14609
        ;                                        * 1460E

* refs (1): 145B0
OBJ_14613:
        ::                                       * 14613
          '                                      * 14618
          OBJ_14640                              * 1461D
          >R                                     * 14622
          RSWAP                                  * 14627
          ERRSET                                 * 1462C
          COLA                                   * 14631
          OBJ_1470D                              * 14636
        ;                                        * 1463B

* refs (1): 1461D
OBJ_14640:
        ::                                       * 14640
L_14645:
          ERRTRAP                                * 14645
          OBJ_14654                              * 1464A
        ;                                        * 1464F

* refs (1): 1464A
OBJ_14654:
        ::                                       * 14654
          DropSysObs                             * 14659
          RDROP                                  * 1465E
          ERROR@                                 * 14663
          BINT1                                  * 14668
          #=                                     * 1466D
          caseERRJMP                             * 14672
          ERROR@                                 * 14677
          #0=case                                * 1467C
          ERRJMP                                 * 14681
          ERROR@                                 * 14686
          Err#Kill                               * 1468B
          #=                                     * 14690
          ?GOTO                                  * 14695
          L_146AE                                * 1469A
          SysErrorTrap                           * 1469F
          GOTO                                   * 146A4
          L_14391                                * 146A9
L_146AE:
          OBJ_14EEC                              * 146AE
          #0=?SKIP                               * 146B3
          ERRJMP                                 * 146B8
          kill                                   * 146BD
        ;                                        * 146C2

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
        ::                                       * 1470D
          SWAP                                   * 14712
          BINT0                                  * 14717
          #=casedrop                             * 1471C
          OBJ_14762                              * 14721
          #1=case                                * 14726
          OBJ_147C1                              * 1472B
          'R                                     * 14730
          2Ob>Seco                               * 14735
          ->StkStr22!                            * 1473A
          OBJ_14D8C                              * 1473F
          RDROP                                  * 14744
          BINT2                                  * 14749
          OBJ_14F8C                              * 1474E
          GOTO                                   * 14753
          L_146DB                                * 14758
        ;                                        * 1475D

* refs (5): 14721 147D0 147DF 14802 14811
OBJ_14762:
        ::                                       * 14762
          DUP                                    * 14767
          OBJ_271C5                              * 1476C
          case                                   * 14771
          EVAL                                   * 14776
          DROP                                   * 1477B
          REQcase                                * 14780
          xKILL                                  * 14785
          OBJ_1482A                              * 1478A
          DUPTYPECOL?                            * 1478F
          NOTcase                                * 14794
          OBJ_14DFA                              * 14799
          INHARDROM?                             * 1479E
          case                                   * 147A3
          OBJ_14DFA                              * 147A8
          ZEROSWAP                               * 147AD
          COLA                                   * 147B2
          OBJ_14DAA                              * 147B7
        ;                                        * 147BC

* refs (1): 1472B
OBJ_147C1:
        ::                                       * 147C1
          DUPTYPEIDNT?                           * 147C6
          NOTcase                                * 147CB
          OBJ_14762                              * 147D0
          DUPSAFE@                               * 147D5
          NOTcase                                * 147DA
          OBJ_14762                              * 147DF
          DUPTYPERRP?                            * 147E4
          ITE                                    * 147E9
          DROPDUP                                * 147EE
          SWAPDROPDUP                            * 147F3
          TYPECOL?                               * 147F8
          NOTcase                                * 147FD
          OBJ_14762                              * 14802
          INHARDROM?                             * 14807
          case                                   * 1480C
          OBJ_14762                              * 14811
          debug(rpl)!                            * 14816
          GsstFIN                                * 1481B
        ;                                        * 14820
        NIBHEX  E8E60                            * 14825  ←n

* refs (1): 1478A
OBJ_1482A:
        ::                                       * 1482A
          sstDISP                                * 1482F
          kill                                   * 14834
        ;                                        * 14839

* refs (1): 23434
OBJ_1483E:
        ::                                       * 1483E

* refs (2): 149C9 14B18
OBJ_14843:
          ::                                     * 14843
            DUP                                  * 14848
            PALPTRDCMP                           * 1484D
            DROP                                 * 14852
          ;                                      * 14857
          OBJ_148C0                              * 1485C
          OBJ_148C0                              * 14861
          OBJ_148C0                              * 14866
          OBJ_148C0                              * 1486B
          BINT5                                  * 14870
          '                                      * 14875
          xIFEND                                 * 1487A
          4PICK                                  * 1487F
          EQ                                     * 14884
          ?GOTO                                  * 14889
          L_148A7                                * 1488E
          DROP                                   * 14893
          OBJ_148C0                              * 14898
          OBJ_148C0                              * 1489D
          BINT7                                  * 148A2
L_148A7:
          SWAP                                   * 148A7
          OBJ_14D8C                              * 148AC
          ::NEVAL                                * 148B1
          GsstFIN                                * 148B6
        ;                                        * 148BB

* refs (6): 1485C 14861 14866 1486B 14898 1489D
OBJ_148C0:
        ::                                       * 148C0
          RSWAP                                  * 148C5
          'R                                     * 148CA
          RSWAP                                  * 148CF
          DUPUNROT                               * 148D4
          OBJ_15156                              * 148D9
          SPACE$                                 * 148DE
          !insert$                               * 148E3
          !append$                               * 148E8
        ;                                        * 148ED

* refs (2): 23051 230E1
OBJ_148F2:
        ::                                       * 148F2
          sstDISP                                * 148F7
          RDUP                                   * 148FC
          GsstFIN                                * 14901
        ;                                        * 14906

* refs (1): 236DC
OBJ_1490B:
        ::                                       * 1490B
          sstDISP                                * 14910
          ::                                     * 14915
            xENDDO                               * 1491A
            GOTO                                 * 1491F
            L_146C7                              * 14924
          ;                                      * 14929
          2RDROP                                 * 1492E
L_14933:
          OBJ_14EEC                              * 14933
          #1+                                    * 14938
          OBJ_14F8C                              * 1493D
          GsstFIN                                * 14942
        ;                                        * 14947

* refs (1): 23080
OBJ_1494C:
        ::                                       * 1494C
          sstDISP                                * 14951
          xREPEAT                                * 14956
          GOTO                                   * 1495B
          L_146DB                                * 14960
          OBJ_14EEC                              * 14965
          #1+                                    * 1496A
          RROLL                                  * 1496F
          RDROP                                  * 14974
          OBJ_14EEC                              * 14979
          OBJ_14F8C                              * 1497E
          RSKIP                                  * 14983
          RSKIP                                  * 14988
          RSKIP                                  * 1498D
          GsstFIN                                * 14992
        ;                                        * 14997

* refs (1): 236AD
OBJ_1499C:
        ::                                       * 1499C
          sstDISP                                * 149A1
          OBJ_14EEC                              * 149A6
          RDROP                                  * 149AB
          OBJ_14F8C                              * 149B0
          GsstFIN                                * 149B5
        ;                                        * 149BA

* refs (1): 234FD
OBJ_149BF:
        ::                                       * 149BF

* refs (1): 14A5A
OBJ_149C4:
          ::                                     * 149C4
            OBJ_14843                            * 149C9
            ONESWAP                              * 149CE
          ;                                      * 149D3
          GOTO                                   * 149D8
          L_14A0F                                * 149DD
L_149E2:
          RSWAP                                  * 149E2
          RDROP                                  * 149E7
          3UNROLL                                * 149EC
          3PICK                                  * 149F1
          ID>$                                   * 149F6
          SPACE$                                 * 149FB
          !insert$                               * 14A00
          !append$                               * 14A05
          SWAP#1+SWAP                            * 14A0A
L_14A0F:
          RDUP                                   * 14A0F
          ticR                                   * 14A14
          DROPDUP                                * 14A19
          TYPELAM?                               * 14A1E
          ?GOTO                                  * 14A23
          L_149E2                                * 14A28
          RDROP                                  * 14A2D
          DROP                                   * 14A32
          OBJ_14D8C                              * 14A37
          ::NEVAL                                * 14A3C
          ERRSET                                 * 14A41
          OBJ_14FC3                              * 14A46
          GsstFIN                                * 14A4B
        ;                                        * 14A50

* refs (1): 23027
OBJ_14A55:
        ::                                       * 14A55
          OBJ_149C4                              * 14A5A
L_14A5F:
          SWAP#1+SWAP                            * 14A5F
          'R                                     * 14A64
          3UNROLL                                * 14A69
          3PICK                                  * 14A6E
          DUP                                    * 14A73
          TYPELAM?                               * 14A78
          NOT?GOTO                               * 14A7D
          L_14AA5                                * 14A82
          ID>$                                   * 14A87
          SPACE$                                 * 14A8C
          !insert$                               * 14A91
          !append$                               * 14A96
          GOTO                                   * 14A9B
          L_14A5F                                * 14AA0
L_14AA5:
          ->StkStr22!                            * 14AA5
          CHR_Space                              * 14AAA
          >H$                                    * 14AAF
          CHR_Newline                            * 14AB4
          >H$                                    * 14AB9
          !append$                               * 14ABE
          CHR_Space                              * 14AC3
          >H$                                    * 14AC8
          DISPSTATUS2                            * 14ACD
          VERYSLOW                               * 14AD2
          ::NEVAL                                * 14AD7
          GsstFIN                                * 14ADC
        ;                                        * 14AE1

* refs (1): 2313F
OBJ_14AE6:
        ::                                       * 14AE6
          sstDISP                                * 14AEB
          xSTART                                 * 14AF0
          RDROP                                  * 14AF5
          ERRSET                                 * 14AFA
          OBJ_14FC3                              * 14AFF
          RDUP                                   * 14B04
          GsstFIN                                * 14B09
        ;                                        * 14B0E

* refs (1): 231DC
OBJ_14B13:
        ::                                       * 14B13
          OBJ_14843                              * 14B18
          SPACE$                                 * 14B1D
          &$                                     * 14B22
          'R                                     * 14B27
          DUPUNROT                               * 14B2C
          DUPTYPELIST?                           * 14B31
          ITE                                    * 14B36
          ->StkStr22!                            * 14B3B
          ID>$                                   * 14B40
          !append$                               * 14B45
          OBJ_14D8C                              * 14B4A
          2Ob>Seco                               * 14B4F
          EVAL                                   * 14B54
          ERRSET                                 * 14B59
          OBJ_14FC3                              * 14B5E
          RDUP                                   * 14B63
          GsstFIN                                * 14B68
        ;                                        * 14B6D

        ::                                       * 14B72
          DUP                                    * 14B77
          sstDISP                                * 14B7C
          ::                                     * 14B81
            EVAL                                 * 14B86
            ERRSET                               * 14B8B
            GOTO                                 * 14B90
            L_146C7                              * 14B95
          ;                                      * 14B9A
          2RDROP                                 * 14B9F
          GOTO                                   * 14BA4
          L_14933                                * 14BA9
        ;                                        * 14BAE

* refs (1): 2366D
OBJ_14BB3:
        ::                                       * 14BB3
          'R'R                                   * 14BB8
          OVER                                   * 14BBD
          DECOMP$                                * 14BC2
          addtics                                * 14BC7
          OBJ_14D8C                              * 14BCC
          BINT3                                  * 14BD1
          ::NEVAL                                * 14BD6
          GsstFIN                                * 14BDB
        ;                                        * 14BE0

* refs (1): 23490
OBJ_14BE5:
        ::                                       * 14BE5
          sstDISP                                * 14BEA
          CK0NOLASTWD                            * 14BEF
          GsstFIN                                * 14BF4
        ;                                        * 14BF9

* refs (1): 23860
OBJ_14BFE:
        ::                                       * 14BFE
          sstDISP                                * 14C03
          Chk1&2Disp!(st)Fr                      * 14C08
          GsstFIN                                * 14C0D
        ;                                        * 14C12

* ob ->
* refs (13): 1482F 148F7 14910 14951 149A1 14AEB ...
sstDISP:
        ::                                       * 14C17
          PALPTRDCMP                             * 14C1C
          DROP                                   * 14C21
          OBJ_14D8C                              * 14C26
        ;                                        * 14C2B

* refs (1): 22F1D
OBJ_14C30:
        ::                                       * 14C30
          EVAL                                   * 14C35
          GOTO                                   * 14C3A
          L_14C58                                * 14C3F
          RSKIP                                  * 14C44
          'R                                     * 14C49
          GOTO                                   * 14C4E
          L_14C62                                * 14C53
L_14C58:
          '                                      * 14C58
          xTHEN                                  * 14C5D
L_14C62:
          sstDISP                                * 14C62
          GsstFIN                                * 14C67
        ;                                        * 14C6C

* refs (1): 22FC9
OBJ_14C71:
        ::                                       * 14C71
          DROP                                   * 14C76
          RSKIP                                  * 14C7B
          'R                                     * 14C80
          ZEROSWAP                               * 14C85
          COLA                                   * 14C8A
          OBJ_1470D                              * 14C8F
        ;                                        * 14C94

* refs (1): 237D0
OBJ_14C99:
        ::                                       * 14C99
          sstDISP                                * 14C9E
          xTHENCASE                              * 14CA3
          ::                                     * 14CA8
            'R'R                                 * 14CAD
            RDROP                                * 14CB2
            2Ob>Seco                             * 14CB7
            >R                                   * 14CBC
            GsstFIN                              * 14CC1
          ;                                      * 14CC6
          xIFEND                                 * 14CCB
          RSKIP                                  * 14CD0
          GsstFIN                                * 14CD5
        ;                                        * 14CDA

* refs (1): 23612
OBJ_14CDF:
        ::                                       * 14CDF
          ABND                                   * 14CE4
          ERRSET                                 * 14CE9
          sstDISP                                * 14CEE
          OBJ_14D1B                              * 14CF3
          GsstFIN                                * 14CF8
        ;                                        * 14CFD

* refs (1): 23648
OBJ_14D02:
        ::                                       * 14D02
          sstDISP                                * 14D07
          OBJ_14D1B                              * 14D0C
          GsstFIN                                * 14D11
        ;                                        * 14D16

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
        ::                                       * 14D6E
          RDROP                                  * 14D73
          3RDROP                                 * 14D78
          ERRTRAP                                * 14D7D
          NOP                                    * 14D82
        ;                                        * 14D87

* refs (8): 1473F 148AC 14A37 14B4A 14BCC 14C26 ...
OBJ_14D8C:
        ::                                       * 14D8C
          CHR_Space                              * 14D91
          >H$                                    * 14D96
          DISPSTATUS2                            * 14D9B
          SetDA1Temp                             * 14DA0
        ;                                        * 14DA5

* refs (1): 147B7
OBJ_14DAA:
        ::                                       * 14DAA
          '                                      * 14DAF
          ®nop¯                                  * 14DB4
          >R                                     * 14DB9
          >R                                     * 14DBE
          OBJ_14EEC                              * 14DC3
          DUP                                    * 14DC8
          RROLL                                  * 14DCD
          RROLL                                  * 14DD2
          2RDROP                                 * 14DD7
          RDUP                                   * 14DDC
          ERRTRAP                                * 14DE1
          NOP                                    * 14DE6
          GOTO                                   * 14DEB
          L_145A6                                * 14DF0
        ;                                        * 14DF5

* refs (2): 14799 147A8
OBJ_14DFA:
        ::                                       * 14DFA
          DUP                                    * 14DFF
          OBJ_15156                              * 14E04
          OBJ_14D8C                              * 14E09
          EVAL                                   * 14E0E
          GsstFIN                                * 14E13
        ;                                        * 14E18

* refs (1): 14DB4
®nop¯:
        ::                                       * 14E1D
L_14E22:
          NOP                                    * 14E22
        ;                                        * 14E27

* refs (1): 234B5
OBJ_14E2C:
        ::                                       * 14E2C
          DROP                                   * 14E31
          'R                                     * 14E36
          DUP                                    * 14E3B
          OBJ_15156                              * 14E40
          OBJ_14D8C                              * 14E45
          GsstFIN                                * 14E4A
        ;                                        * 14E4F

* refs (2): 143E3 1455B
OBJ_14E54:
        ::                                       * 14E54
          OBJ_14E6D                              * 14E59
          case                                   * 14E5E
          ABND                                   * 14E63
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
        ::                                       * 15007
          COERCE                                 * 1500C
          DO#EXIT                                * 15011
        ;                                        * 15016

* hxs ->
* refs (1): 1A35C
DOHXSEXIT:
        ::                                       * 1501B
          HXS>#                                  * 15020
          DO#EXIT                                * 15025
        ;                                        * 1502A

* # ->
* refs (2): 15011 15025
DO#EXIT:
        ::                                       * 1502F
          ERRORSTO                               * 15034
          AtUserStack                            * 15039
          ERRJMP                                 * 1503E
        ;                                        * 15043

* $ ->
* refs (2): 1A352 8E217
DO$EXIT:
        ::                                       * 15048
          EXITMSGSTO                             * 1504D
          #EXITERR                               * 15052
          ERRORSTO                               * 15057
          AtUserStack                            * 1505C
          ERRJMP                                 * 15061
        ;                                        * 15066

* refs (3): 14551 38764 39713
Halted?:
        ::                                       * 1506B
          '                                      * 15070
          Π'halt                                 * 15075
          DRPExitAtLOOP                          * 1507A
          NOTcaseFALSE                           * 1507F
          DROPTRUE                               * 15084
        ;                                        * 15089

* prog -> name ->
* refs (1): C5D50
xDBUG:
        ::                                       * 1508E
          CK1NOLASTWD                            * 15093
          CK&DISPATCH1                           * 15098
          BINT8                                  * 1509D
          debug(rpl)                             * 150A2
          BINT6                                  * 150A7
          debug(nm)                              * 150AC
          BINT7                                  * 150B1
          debug(nm)                              * 150B6
        ;                                        * 150BB

* refs (2): 150A2 1514C
debug(rpl):
        ::                                       * 150C0
          INHARDROM?                             * 150C5
          case                                   * 150CA
          SETTYPEERR                             * 150CF
          COLA                                   * 150D4
          debug(rpl)!                            * 150D9
        ;                                        * 150DE

* refs (2): 14816 150D9
debug(rpl)!:
        ::                                       * 150E3
          DUP                                    * 150E8
          >R                                     * 150ED
          CARCOMP                                * 150F2
          '                                      * 150F7
          x<<                                    * 150FC
          EQIT                                   * 15101
          ::                                     * 15106
            RSWAP                                * 1510B
            RSKIP                                * 15110
            RSWAP                                * 15115
          ;                                      * 1511A
          COLA                                   * 1511F
          halt                                   * 15124
        ;                                        * 15129

* refs (2): 150AC 150B6
debug(nm):
        ::                                       * 1512E
          SAFE@                                  * 15133
          NOTcase                                * 15138
          SETNONEXTERR                           * 1513D
          CK&DISPATCH1                           * 15142
          BINT8                                  * 15147
          debug(rpl)                             * 1514C
        ;                                        * 15151

* refs (3): 148D9 14E04 14E40
OBJ_15156:
        ::                                       * 15156
          ::                                     * 1515B
            DUPTYPECOL?                          * 15160
            ?SEMI                                * 15165
            Ob>Seco                              * 1516A
          ;                                      * 1516F

* refs (13): 1473A 14AA5 14B3B 1527D 153CF 1540B ...
->StkStr22!:
          ::                                     * 15174
            setStdWid                            * 15179
            1stkdecomp$w                         * 1517E
          ;                                      * 15183
        ;                                        * 15188

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
        ::                                       * 151A6
          '                                      * 151AB
          OBJ_154CD                              * 151B0
          MenuKeyNS!                             * 151B5
          '                                      * 151BA
          OBJ_155B3                              * 151BF
          MenuKeyLS!                             * 151C4
          '                                      * 151C9
          OBJ_1559A                              * 151CE
          MenuKeyRS!                             * 151D3
          '                                      * 151D8
          PutStoLabel(s,_)                       * 151DD
          LabelDef!                              * 151E2
          '                                      * 151E7
          EQReview                               * 151EC
          ReviewKey!                             * 151F1
          OBJ_3BCE2                              * 151F6
        ;                                        * 151FB

* refs (3): 15352 3BE68 3C329
OBJ_15200:
        ::                                       * 15200
          PTR     InitTrack:                     * 15205
          OBJ_3AE0C                              * 1520A
          DORCLE                                 * 1520F
          DUP                                    * 15214
          EqList?                                * 15219
          NOTcase                                * 1521E

* refs (1): 1529B
OBJ_15223:
          ::                                     * 15223
            DUPTYPELIST?                         * 15228
            ITE                                  * 1522D
            ::                                   * 15232
              INNERCOMP                          * 15237
              #2=                                * 1523C
              NcaseSIZEERR                       * 15241
              DUPTYPELIST?                       * 15246
              NcaseSIZEERR                       * 1524B
              SWAPDROP                           * 15250
            ;                                    * 15255
            FINDVAR                              * 1525A
            {EXPR}                               * 1525F
            >TCOMP                               * 15264
            OBJ_479D4                            * 15269
            ?SKIP                                * 1526E

1FrDispEQ:
            ::                                   * 15273
              Trceq                              * 15278
              ->StkStr22!                        * 1527D
              1FrDisp(st)                        * 15282
            ;                                    * 15287
            SolvMenuInit                         * 1528C
          ;                                      * 15291
          OBJ_15366                              * 15296
          OBJ_15223                              * 1529B
          BINT6                                  * 152A0
          OVER                                   * 152A5
          LENCOMP                                * 152AA
          OVER                                   * 152AF
          #/                                     * 152B4
          DROP                                   * 152B9
          #-DUP                                  * 152BE
          #1=                                    * 152C3
          ITE                                    * 152C8
          DROP                                   * 152CD

+NullEntries(li,s):
          ::                                     * 152D2
            ONE_DO                               * 152D7
            NullMenuKey                          * 152DC
            >TCOMP                               * 152E1
            LOOP                                 * 152E6
          ;                                      * 152EB
          {NXEQ}                                 * 152F0
          >TCOMP                                 * 152F5
        ;                                        * 152FA

* ob ->
* refs (10): 15219 47885 498A8 49AF6 4A0BE 4B797 ...
EqList?:
        ::                                       * 152FF
          DUPTYPELIST?                           * 15304
          NOTcsdrpfls                            * 15309
          BINT2                                  * 1530E
          NTHELCOMP                              * 15313
          NOTcaseTRUE                            * 15318
          TYPELIST?                              * 1531D
          NOT                                    * 15322
        ;                                        * 15327

* refs (1): 152F0
{NXEQ}:
        {                                        * 1532C

_NXEQ_:
          $       "NXEQ"                         * 15331

\NXEQ:
          ::                                     * 15343
            NextInEQ!                            * 15348
            '                                    * 1534D
            OBJ_15200                            * 15352
            InitMenu                             * 15357
          ;                                      * 1535C
        }                                        * 15361

* refs (1): 15296
OBJ_15366:
        ::                                       * 15366
          BINT1                                  * 1536B
          NTHELCOMP                              * 15370
          NOTcase                                * 15375
          NOEQERR                                * 1537A
          OBJ_15389                              * 1537F
        ;                                        * 15384

* refs (3): 1537F 4A0EB 4A113
OBJ_15389:
        ::                                       * 15389
          DUPTYPEIDNT?                           * 1538E
          NOT?SEMI                               * 15393
          OBJ_473E6                              * 15398
          OVER                                   * 1539D
          EQUAL                                  * 153A2
          ?SEMI                                  * 153A7
          DUPSAFE@                               * 153AC
          NOT?SEMI                               * 153B1
          SWAPDROP                               * 153B6
        ;                                        * 153BB

* refs (1): 151EC
EQReview:
        ::                                       * 153C0
          BlankDA12                              * 153C5
          Trceq                                  * 153CA
          ->StkStr22!                            * 153CF
          DISPSTATUS2                            * 153D4
          ::                                     * 153D9
            BINT7                                * 153DE
            ONE_DO                               * 153E3
            INDEX@                               * 153E8
            GETPROC                              * 153ED
            DUPTYPEIDNT?                         * 153F2
            ITE                                  * 153F7

DispVarsUtil:
            ::                                   * 153FC
              DUPSAFE@                           * 15401
              ITE                                * 15406
              ->StkStr22!                        * 1540B

* refs (5): 46946 8C59A 8C871 8CA70 8CBB4
Message60E:
              ::                                 * 15410
                OBJ_49171                        * 15415
                JstGetTHEMESG                    * 1541A
              ;                                  * 1541F

DoSt:(nm,st):
              ::                                 * 15424
                SWAP                             * 15429
                ID>$                             * 1542E
                BINT1                            * 15433
                BINT8                            * 15438
                SUB$                             * 1543D
                $       ": "                     * 15442
                !append$SWAP                     * 15450
                !append$                         * 15455
              ;                                  * 1545A
              INDEX@                             * 1545F
              #1+                                * 15464
              DISPN                              * 15469
            ;                                    * 1546E
            DROP                                 * 15473
            LOOP                                 * 15478
            SetDA12Temp                          * 1547D
          ;                                      * 15482
        ;                                        * 15487

* refs (1): 151DD
PutStoLabel(s,_):
        ::                                       * 1548C
          DUPTYPEIDNT?                           * 15491
          OVER                                   * 15496
          NULL$                                  * 1549B
          EQUALOR                                * 154A0
          NOTcase                                * 154A5
          >MENU                                  * 154AA
          DUPTYPEIDNT?                           * 154AF
          IT                                     * 154B4
          ID>$                                   * 154B9
          MakeInvLabel                           * 154BE
          Grob>Menu                              * 154C3
        ;                                        * 154C8

* refs (1): 151B0
OBJ_154CD:
        ::                                       * 154CD
          DUPTYPEIDNT?                           * 154D2
          ImmedEntry?                            * 154D7
          ANDNOTcase                             * 154DC
          StdMenuKeyNS                           * 154E1
          '                                      * 154E6
          OBJ_154FA                              * 154EB
          DoNameKeyLRS                           * 154F0
        ;                                        * 154F5

* refs (1): 154EB
OBJ_154FA:
        ::                                       * 154FA
          CK2NOLASTWD                            * 154FF
          STRIPTAGSl2                            * 15504
          OVER                                   * 15509
          FINDVAR                                * 1550E
          OVERSWAP                               * 15513
          matchob?                               * 15518
          ITE                                    * 1551D
          SETCIRCERR                             * 15522
          DROP                                   * 15527

* refs (2): 49BB9 B4CC3
OBJ_1552C:
          ::                                     * 1552C
            dup;RclInVars(gn)?                   * 15531
            IT                                   * 15536

* % ob ob' -> % ob % ob u -> u' ob
* refs (3): 490F3 49130 9E58B
KeepUnit:
            ::                                   * 1553B
              DUPTYPEEXT?                        * 15540
              4PICK                              * 15545
              TYPEREAL?                          * 1554A
              ANDNOTcase                         * 1554F
              DROP                               * 15554
              ROTSWAP                            * 15559
              UM>U                               * 1555E
              SWAP                               * 15563
            ;                                    * 15568
          ;                                      * 1556D
          2DUP                                   * 15572
          XEQStoKey                              * 15577
          SWAP                                   * 1557C
          PromptIdUtil                           * 15581
          APPprompt1!                            * 15586
          SetDA1Valid                            * 1558B
          SetDA3NoCh                             * 15590
        ;                                        * 15595

* refs (1): 151CE
OBJ_1559A:
        ::                                       * 1559A
          dIDNTNcase                             * 1559F
          StdRightShift                          * 155A4
          DoNameKeyRS                            * 155A9
        ;                                        * 155AE

* refs (1): 151BF
OBJ_155B3:
        ::                                       * 155B3
          DUPTYPEIDNT?                           * 155B8
          ImmedEntry?                            * 155BD
          ANDNOTcase                             * 155C2
          StdMenuKeyLS                           * 155C7
          '                                      * 155CC
          SolvEQ(nm)                             * 155D1
          DoNameKeyLRS                           * 155D6
        ;                                        * 155DB

* refs (1): 155D1
SolvEQ(nm):
        ::                                       * 155E0
          rceq!                                  * 155E5
          OVERDUP                                * 155EA

{'nohalt}:
          {                                      * 155EF
            nohalt                               * 155F4
          }                                      * 155F9
          BIND                                   * 155FE
          ID>$                                   * 15603
          OBJ_4918F                              * 15608
          JstGetTHEMESG                          * 1560D
          SWAP&$                                 * 15612
          APPprompt1!                            * 15617
          SWAPDUP                                * 1561C
          SAFE@                                  * 15621
          ?SKIP                                  * 15626
          %0_2A2B4                               * 1562B
          SYMBNUMSOLVE                           * 15630
          ?SKIP                                  * 15635

Lpop;error(s):
          ::                                     * 1563A
            ABND                                 * 1563F
            ERRORSTO                             * 15644
            CK0NOLASTWD                          * 15649
            ERRJMP                               * 1564E
          ;                                      * 15653
          nohalt                                 * 15658
          SWAP'                                  * 1565D
          nohalt                                 * 15662
          STO                                    * 15667
          ID>TAG                                 * 1566C
          nohalt                                 * 15671
          ABND                                   * 15676
          GETTHEMESG                             * 1567B
          APPprompt1!                            * 15680
          SetDA1Temp                             * 15685
        ;                                        * 1568A

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
          DUP                                    * 156E5
          NOTcase                                * 156EA
          SWAPDROP                               * 156EF
          DROP                                   * 156F4
          DUPLENCOMP                             * 156F9
          NTHCOMPDROP                            * 156FE
          '                                      * 15703
          x=                                     * 15708
          EQ                                     * 1570D
        ;                                        * 15712

* ob ->
* refs (15): 1F15D 44F7C 48FC2 49B3C 8A315 8A6E8 ...
DOSTOE:
        ::                                       * 15717
          'EQ                                    * 1571C
          XEQSTOID                               * 15721
        ;                                        * 15726

* -> ob
* refs (12): 1520F 1F13D 498A3 49AEC 4B78D 8AB2C ...
DORCLE:
        ::                                       * 1572B
          EQUATION                               * 15730
          ?SKIP                                  * 15735
          NOEQERR                                * 1573A
        ;                                        * 1573F

* -> ob T -> F
* refs (6): 15730 4690A 4A0AF 4A606 4BF76 50E1D
EQUATION:
        ::                                       * 15744
          'EQ                                    * 15749
          OBJ_4735A                              * 1574E
        ;                                        * 15753

* refs (13): 1571C 15749 47391 47871 478A8 49B0F ...
'EQ:
        ::                                       * 15758
          '                                      * 1575D
          CUREQ                                  * 15762
        ;                                        * 15767

* ID EQ
* refs (3): 15762 C5362 C536C
CUREQ:
        ID      EQ                               * 1576C

* -> id
* refs (2): 399B1 8555A
NULLID:
        ::                                       * 15777
          '                                      * 1577C

'':
          ID      ""                             * 15781
        ;                                        * 15788

* ob -> %
* refs (11): 15850 1A5F3 1DF76 22F7C 33D23 36D9E ...
CRUNCH:
        ::                                       * 1578D
          NOTNUM?                                * 15792
          SETNUM                                 * 15797
          ITE                                    * 1579C
          OBJ_157B0                              * 157A1
          OBJ_157E2                              * 157A6
        ;                                        * 157AB

* refs (1): 157A1
OBJ_157B0:
        ::                                       * 157B0
          ERRSET                                 * 157B5
          ::                                     * 157BA
            EVAL                                 * 157BF
            ->num(ex)                            * 157C4
          ;                                      * 157C9
          ERRTRAP                                * 157CE
          cf(-3);error                           * 157D3
          CLRNUM                                 * 157D8
        ;                                        * 157DD

* refs (1): 157A6
OBJ_157E2:
        ::                                       * 157E2
          ERRSET                                 * 157E7
          ::                                     * 157EC
            EVAL                                 * 157F1
            ->num(ex)                            * 157F6
          ;                                      * 157FB
          ERRTRAP                                * 15800
          sf(-3);error                           * 15805
          SETNUM                                 * 1580A
        ;                                        * 1580F

* refs (4): 157D3 5A063 B6A57 D20C8
cf(-3);error:
        ::                                       * 15814
          CLRNUM                                 * 15819
          ERRJMP                                 * 1581E
        ;                                        * 15823

* refs (4): 15805 5A081 B6A7A D20E6
sf(-3);error:
        ::                                       * 15828
          SETNUM                                 * 1582D
          ERRJMP                                 * 15832
        ;                                        * 15837

* refs (6): 15946 4696E 495DD 4EF87 51369 8C581
EVALCRUNCH:
        ::                                       * 1583C
          EVAL                                   * 15841
          DEPTH                                  * 15846
          #0=?SKIP                               * 1584B
          CRUNCH                                 * 15850
        ;                                        * 15855

* refs (1): 1525F
{EXPR}:
        {                                        * 1585A

_EXPR_:
          $       "EXPR="                        * 1585F
          Trceq!                                 * 15873
        }                                        * 15878

* refs (1): 15873
Trceq!:
        ::                                       * 1587D
          AtUserStack                            * 15882
          rceq!                                  * 15887
          DUP                                    * 1588C
          ALGeq?                                 * 15891
          case                                   * 15896

2tag(eq):
          ::                                     * 1589B
            SPLITEQ                              * 158A0
            1LAMBIND                             * 158A5
            'EvalNoCK:_sup                       * 158AA
            xEVAL                                * 158AF
            CK1NoBlame                           * 158B4

* refs (1): A306E
OBJ_158B9:
            #       A07                          * 158B9  2567
            OBJ_15909                            * 158C3
            1GETABND                             * 158C8
            'EvalNoCK:_sup                       * 158CD
            xEVAL                                * 158D2
            CK1NoBlame                           * 158D7

* refs (1): A307D
OBJ_158DC:
            #       A08                          * 158DC  2568
            OBJ_15909                            * 158E6
          ;                                      * 158EB
          'EvalNoCK:_sup                         * 158F0
          xEVAL                                  * 158F5
          CK1NoBlame                             * 158FA

* refs (1): A3091
OBJ_158FF:
          #       A09                            * 158FF  2569

* refs (30): 158C3 158E6 99024 99038 9904C A3073 ...
OBJ_15909:
          ::                                     * 15909
            JstGetTHEMESG                        * 1590E
            >TAG                                 * 15913
          ;                                      * 15918
        ;                                        * 1591D
        BSS     11                               * 15922

* ->
* refs (10): 158B4 158D7 158FA 1594B 1DF7B 49623 ...
CK1NoBlame:
        ::                                       * 1592D
          0LASTOWDOB!                            * 15932
          CK1NOLASTWD                            * 15937
        ;                                        * 1593C

* refs (5): 47642 49753 49846 499D6 49E52
CRUNCHNoBlame:
        ::                                       * 15941
          EVALCRUNCH                             * 15946
          CK1NoBlame                             * 1594B
        ;                                        * 15950

* refs (1): 39DF1
DoSt:22(s,_):
        ::                                       * 15955
          OBJ_16969                              * 1595A
          COLA                                   * 1595F
          DoSt:(s,_,s)                           * 15964
        ;                                        * 15969

* refs (3): 15964 2D974 318D1
DoSt:(s,_,s):
        ::                                       * 1596E
          !DcompWidth                            * 15973

* ob -> $
* refs (8): 1517E 31985 4689C 468D3 49871 4A019 ...
1stkdecomp$w:
          ::                                     * 15978
            OBJ_53914                            * 1597D
            ERRSET                               * 15982
            stkdecomp$w                          * 15987
            ERRTRAP                              * 1598C
            OBJ_159AF                            * 15991
            OBJ_159B4                            * 15996
          ;                                      * 1599B
          SWAP                                   * 159A0
          stackitw                               * 159A5
        ;                                        * 159AA

* refs (3): 15991 16126 16252
OBJ_159AF:
        ::                                       * 159AF

* refs (4): 15996 15A13 15B18 161D5
OBJ_159B4:
          ::                                     * 159B4
            OBJ_53922                            * 159B9
            OBJ_539D8                            * 159BE
          ;                                      * 159C3
          ERRJMP                                 * 159C8
        ;                                        * 159CD

* refs (2): 4EBC2 8D6AC
OBJ_159D2:
        ::                                       * 159D2
          setStdWid                              * 159D7
          COLA                                   * 159DC
          stkdecomp$w                            * 159E1
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
        ::                                       * 159FA
          OBJ_16969                              * 159FF
          !DcompWidth                            * 15A04
        ;                                        * 15A09

* ob -> $
* refs (21): 20E89 222F8 2DC7A 2DCA2 31C7C 408E6 ...
EDITDECOMP$:
        ::                                       * 15A0E
          OBJ_159B4                              * 15A13
          setStdWid                              * 15A18
          savefmt1                               * 15A1D
          ERRSET                                 * 15A22
          editdecomp$w                           * 15A27
          ERRTRAP                                * 15A2C
          ederr                                  * 15A31
          rstfmt1                                * 15A36
        ;                                        * 15A3B

* ->
* refs (4): 15A31 2FCB8 45DE3 468E2
ederr:
        ::                                       * 15A40
          rstfmt1                                * 15A45
          ERRJMP                                 * 15A4A
        ;                                        * 15A4F

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
        ::                                       * 15B13
          OBJ_159B4                              * 15B18
          setStdWid                              * 15B1D
          COLA                                   * 15B22
          OBJ_15B3D                              * 15B27
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
        ::                                       * 15CBB
          NULL$SWAP                              * 15CC0
          OBJ_15CCF                              * 15CC5
        ;                                        * 15CCA

* refs (6): 15CC5 17077 17CCE 181A5 2DC8E 39E05
OBJ_15CCF:
        ::                                       * 15CCF
          XEQTYPE                                * 15CD4
          SWAPDROP                               * 15CD9
          COERCE                                 * 15CDE
          BINT27                                 * 15CE3
          #MIN                                   * 15CE8
          BINT_263d                              * 15CED
          #+                                     * 15CF2
          JstGetTHEMESG                          * 15CF7
          &$                                     * 15CFC
        ;                                        * 15D01

* refs (2): 15C50 15C55
->str(s):
        ::                                       * 15D06
          #>HXS                                  * 15D0B
          HXS>$                                  * 15D10
          BINT3                                  * 15D15
          LAST$                                  * 15D1A
          CHR_<                                  * 15D1F
          >H$                                    * 15D24
          CHR_>                                  * 15D29
          >T$                                    * 15D2E
        ;                                        * 15D33

* refs (2): 15C14 15C19
->str(lb):
        ::                                       * 15D38
          DUP                                    * 15D3D
          LIB>#                                  * 15D42
          DROP                                   * 15D47
          #:>$                                   * 15D4C
          APPEND_SPACE                           * 15D51
          SWAP                                   * 15D56
          BAKNAME                                * 15D5B
          DROP                                   * 15D60
          ID>$                                   * 15D65
          !!append$                              * 15D6A

* 279d 117h
BINT_117h:
          #       117                            * 15D6F  279

* refs (2): 15DB5 15E15
AddMessage(st,s):
          ::                                     * 15D79
            GETTHEMESG                           * 15D7E
            APPEND_SPACE                         * 15D83
            !!insert$                            * 15D88
          ;                                      * 15D8D
        ;                                        * 15D92

* refs (2): 15C23 15C28
->Str(bk):
        ::                                       * 15D97
          BAKNAME                                * 15D9C
          DROP                                   * 15DA1
          ID>$                                   * 15DA6
          #       118                            * 15DAB  280
          AddMessage(st,s)                       * 15DB5
        ;                                        * 15DBA

* refs (2): 15E06 15E3D
OBJ_15DBF:
        ::                                       * 15DBF
          SWAP                                   * 15DC4
          GROBDIM                                * 15DC9
          #>$                                    * 15DCE
          SWAP                                   * 15DD3
          #>$                                    * 15DD8
          SWAPROT                                * 15DDD
          !!append$                              * 15DE2
          !!insert$                              * 15DE7
        ;                                        * 15DEC

* refs (4): 15C32 15E2E 31A75 41323
->str1(go):
        ::                                       * 15DF1

_chr(215)_:
          $       " × "                          * 15DF6
          OBJ_15DBF                              * 15E06
          #       112                            * 15E0B  274
          AddMessage(st,s)                       * 15E15
        ;                                        * 15E1A

* refs (1): 15C37
->str2(go):
        ::                                       * 15E1F
          OBJ_53930                              * 15E24
          case                                   * 15E29
          ->str1(go)                             * 15E2E
          DUP                                    * 15E33
          SPACE$                                 * 15E38
          OBJ_15DBF                              * 15E3D
          APPEND_SPACE                           * 15E42
          $       "GROB "                        * 15E47
          !!insert$                              * 15E5B
          SWAP                                   * 15E60
          BINT11                                 * 15E65
          MINUSONE                               * 15E6A
          SUBHXS                                 * 15E6F
          longhxs                                * 15E74
          !!append$                              * 15E79
        ;                                        * 15E7E

* refs (2): 15E74 15FB0
longhxs:
        ::                                       * 15E83
          NULL$TEMP                              * 15E88
          OVER                                   * 15E8D
          LENHXS                                 * 15E92
          #2*                                    * 15E97
          EXPAND                                 * 15E9C
          OBJ_15FCF                              * 15EA1
        ;                                        * 15EA6

* refs (2): 15F33 15FC5
OBJ_15EAB:
        ::                                       * 15EAB
          OVERLEN$                               * 15EB0
          #>$                                    * 15EB5
          APPEND_SPACE                           * 15EBA
          SWAP                                   * 15EBF
          !!insert$                              * 15EC4
          SWAP                                   * 15EC9
          !!append$                              * 15ECE
        ;                                        * 15ED3

* refs (1): 15BA1
->str2(st):
        ::                                       * 15ED8
          OBJ_53930                              * 15EDD
          case                                   * 15EE2
          ->str1(st)                             * 15EE7
          DUP                                    * 15EEC
          CHR_DblQuote                           * 15EF1

* $ $find/chr -> #pos -> #0
* refs (1): 42C4C
ONEPOS$:
          ::                                     * 15EF6
            BINT1                                * 15EFB
            POS$                                 * 15F00
          ;                                      * 15F05
          #0=case                                * 15F0A
          add2_(st)                              * 15F0F
          OBJ_5395A                              * 15F14
          case                                   * 15F19
          add2_(st)                              * 15F1E
          $       "C$ "                          * 15F23
          OBJ_15EAB                              * 15F33
        ;                                        * 15F38

* refs (2): 15B9C 15EE7
->str1(st):
        ::                                       * 15F3D
          OBJ_53930                              * 15F42
          NOTcase                                * 15F47
          add2_(st)                              * 15F4C
          BINT1                                  * 15F51
          DcompWidth@                            * 15F56
          DUP                                    * 15F5B
          BINT255d                               * 15F60
          #>                                     * 15F65
          ITE                                    * 15F6A
          2DROP                                  * 15F6F
          SUB$                                   * 15F74
          add2_(st)                              * 15F79
        ;                                        * 15F7E

* refs (1): 15BDD
->str2(b):
        ::                                       * 15F83
          OBJ_53930                              * 15F88
          case                                   * 15F8D
          HXS>$                                  * 15F92
          DUP                                    * 15F97
          LENHXS                                 * 15F9C
          BINT17                                 * 15FA1
          #<case                                 * 15FA6
          HXS>$                                  * 15FAB
          longhxs                                * 15FB0
          $       "C# "                          * 15FB5
          OBJ_15EAB                              * 15FC5
        ;                                        * 15FCA

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
