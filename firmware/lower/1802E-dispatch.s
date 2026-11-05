* HP 48GX ROM revision R, #1802E-#1A001: Out-of-memory dialog (continued), last arguments, the argument-count checks, type dispatch, string logic operators, and the InputForm engine's outer loop
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: CK1&Dispatch CK0 COERCE CK2&Dispatch UNCOERCE SETSIZEERR XEQSTOID SETTYPEERR CK&DISPATCH0 IFECallFieldMH DoInputForm CK1NOLASTWD
* Follows on from the previous file (at #1802E in the original ROM).

* refs (1): 17FCA
* Code object: #key -> flag TRUE when key 1 (YES) or 6 (NO), FALSE for other keys
VLMYesNoKey:
        CON(5)  VLMYesNoKey~1                    * 1802E  code object: the address of its machine code

        CON(5)  caseFALSE                        * 18033  address (the code jumps or points through it)

        CON(5)  DoBadKey                         * 18038  address (the code jumps or points through it)

        CON(5)  GOTO                             * 1803D  address (the code jumps or points through it)

        CON(5)  VLMYesNo.loop1                   * 18042  address (the code jumps or points through it)
        RPL

        SEMI                                     * 18047

* refs (3): 17E66 1816E 181F0
* Walk the variables of the current directory, last to first, offering each one; descends into subdirectories
VLMAskVars:
        :: BEGIN DUP PrevNonNull DUP ITE ROT SWAP * 1804C
          DUP TYPERRP? DUP IT                    * 18074
          :: NOT OVER LastNonNull caseDROP SWAP  * 18088
            REFERENCED? ROTSWAP case NOT         * 180A6
          ;                                      * 180BA
          ITE DROP                               * 180BF
          :: VLMAskVar casedrop                  * 180C9
            :: IT DROP                           * 180D8
              2RDROP 2RDROP ;                    * 180E7
            NOTcaseDROP DUP                      * 180F6
            TYPERRP? NOTcase purge(_)            * 18100
            DUP LastNonNull NOTcase purge(_)     * 1810F
            DROP 2RDROP COLA VLMSubDir           * 18123
          ;                                      * 18137
          NOT_UNTIL CONTEXT@ DUP SYSRRP? caseDROP DUP * 1813C
          MYRAMROMPAIR DROP CONTEXT! COLA VLMAskVars * 1815A
        ;                                        * 18173

* refs (2): 17EB1 180CE
* ob -> flag: show ob's name and type and wait for an answer
VLMAskVar:
        :: DUP VLMName$ DISPROW5 SPACE$ toklparen &$ NULL$ 3PICK $+TypeName * 18178
          &$ tokrparen &$ DISPROW6 VLMYesNo ;    * 181AA

* refs (1): 18132
* Enter a subdirectory while offering variables
VLMSubDir:
        :: SWAP IT SWAPDROP                      * 181C8
          DUP CONTEXT! LastNonNull drop;dq VLMAskVars ; * 181DC
        ASSEMBLE
VLMYesNoKey~1:
        D=-D-1  A                                * 181FA
        D0=D0-  2                                * 181FC
        GOSBVL  POP#                             * 181FF
        LC(5)   #00001                           * 18206
        ?C=A    A                                * 1820D
        GOYES   VLMYesNoKey~1.L1                 * 18210
        LC(2)   #06                              * 18212
        ?C#A    A                                * 18216
        GOYES   VLMYesNoKey~1.L4                 * 18219
        LC(5)   FALSE                            * 1821B
        GONC    VLMYesNoKey~1.L2                 * 18222
VLMYesNoKey~1.L1:
        LC(5)   TRUE                             * 18225
VLMYesNoKey~1.L2:
        D1=D1-  5                                * 1822C
        D=D-1   A                                * 1822F
        DAT1=C  A                                * 18231
VLMYesNoKey~1.L3:
        GOVLNG  PushTLoop                        * 18234
VLMYesNoKey~1.L4:
        GOVLNG  PushFLoop                        * 1823B

* refs (1): 17D00
NoMemComLine?:
        CON(5)  (*)+5                            * 18242  primitive code object
        LC(5)   HISTORY1                         * 18247
        CD0EX                                    * 1824E
        A=DAT0  A                                * 18251
        D0=C                                     * 18254
        ?A#0    A                                * 18257
        GOYES   VLMYesNoKey~1.L4                 * 1825A
        GONC    VLMYesNoKey~1.L3                 * 1825C

* refs (1): 17D28
NoLastStack?:
        CON(5)  (*)+5                            * 1825F  primitive code object
        LC(5)   TEMPENV                          * 18264
        CD0EX                                    * 1826B
        A=DAT0  A                                * 1826E
        D0=A                                     * 18271
NoLastStack?.L1:
        A=DAT0  A                                * 18274
        D0=C                                     * 18277
        ?A=0    A                                * 1827A
        GOYES   VLMYesNoKey~1.L3                 * 1827D
        GONC    VLMYesNoKey~1.L4                 * 1827F

* refs (1): 17D73
NoLastArg?:
        CON(5)  (*)+5                            * 18282  primitive code object
        LC(5)   LASTARG                          * 18287
        CD0EX                                    * 1828E
        GOTO    NoLastStack?.L1                  * 18291

* refs (3): 387C3 6C927 8D3B9
* -> ob1..obn: cut the stack to the saved depth, then push the last arguments (LASTARG, count in LASTARGCOUNT)
PushLastArgs:
        CON(5)  (*)+5                            * 18295  primitive code object
        GOSUB   GCSavedDepth                     * 1829A
        LC(5)   LASTARGCOUNT                     * 1829E
        CD0EX                                    * 182A5
        RSTK=C                                   * 182A8
        C=0     A                                * 182AA
        C=DAT0  1                                * 182AC
        ?C=0    B                                * 182B0
        GOYES   PushLastArgs.L3                  * 182B3
        D=D-C   A                                * 182B5
        GONC    PushLastArgs.L1                  * 182B7
        C=RSTK                                   * 182BA
        D0=C                                     * 182BC
        GOVLNG  DOMEMERR                         * 182BF
PushLastArgs.L1:
        D0=(5)  LASTARG                          * 182C6
        P=C     0                                * 182CD
        A=C     A                                * 182D1
        A=A+A   A                                * 182D3
        A=A+A   A                                * 182D5
        C=C+A   A                                * 182D7
        AD1EX                                    * 182D9
        A=A-C   A                                * 182DC
        D1=A                                     * 182DE
        P=P-1                                    * 182E1
PushLastArgs.loop2:
        C=DAT0  A                                * 182E3
        DAT1=C  A                                * 182E6
        D0=D0+  5                                * 182E9
        D1=D1+  5                                * 182EC
        P=P-1                                    * 182EF
        GONC    PushLastArgs.loop2               * 182F1
        D1=A                                     * 182F4
PushLastArgs.L3:
        P=      0                                * 182F7
        C=RSTK                                   * 182F9
        D0=C                                     * 182FB
        A=DAT0  A                                * 182FE
        D0=D0+  5                                * 18301
        PC=(A)                                   * 18304

* refs (16): 143ED 14659 202B3 2DDC9 2DF33 2E09F ...
DropSysObs:
        CON(5)  (*)+5                            * 18308  primitive code object
DropSysObs.L1:
        GOSUB   GCSavedDepth                     * 1830D
DropSysObs.L2:
        A=DAT0  A                                * 18311
        D0=D0+  5                                * 18314
        PC=(A)                                   * 18317

* refs (2): 1829A 1830D
* Cut the stack to the saved depth (DEPTHSAVE) and garbage-collect
GCSavedDepth:
        D1=(5)  EDITLINE                         * 1831B
        A=DAT1  A                                * 18322
        D1=(5)  DEPTHSAVE                        * 18325
        C=DAT1  A                                * 1832C
        A=A-C   A                                * 1832F
        D1=A                                     * 18331
        GOTO    GCEmptyStack.L1                  * 18334

* refs (3): 17BB8 17F06 18010
* -> flag: after garbage collection, more than 80 stack words are free
VLMRoomOK?:
        CON(5)  (*)+5                            * 18338  primitive code object
        GOSUB   GCEmptyStack.L1                  * 1833D
        LC(5)   #00050                           * 18341
        ?D>C    A                                * 18348
        GOYES   VLMRoomOK?.L1                    * 1834B
        GOTO    VLMYesNoKey~1.L4                 * 1834D
VLMRoomOK?.L1:
        GOTO    VLMYesNoKey~1.L3                 * 18351

* refs (1): 17E4D
DelStack:
        CON(5)  (*)+5                            * 18355  primitive code object
        GOSUB   GCEmptyStack                     * 1835A
        GOTO    DropSysObs.L2                    * 1835E

* refs (2): 17C44 1835A
* Leave one word on the stack and garbage-collect; a label inside also serves as plain SAVPTR/GARBAGECOL/GETPTR
GCEmptyStack:
        D1=(5)  EDITLINE                         * 18362
        A=DAT1  A                                * 18369
        D1=(5)  DEPTHSAVE                        * 1836C
        LC(5)   #00005                           * 18373
        DAT1=C  A                                * 1837A
        A=A-C   A                                * 1837D
        D1=A                                     * 1837F
GCEmptyStack.L1:
        GOSBVL  SAVPTR                           * 18382
        GOSBVL  GARBAGECOL                       * 18389
        GOVLNG  GETPTR                           * 18390
        RPL

* refs (1): 18182
* ob -> $: the name of a library, backup or variable as the Out of Memory dialog shows it
VLMName$:
        :: CK&DISPATCH0                          * 18397
          #8F_64D2E Port0Name$                   * 183A1  library
          backup Port0Name$                      * 183AB  backup
          BINT0 VarName$                         * 183B5  any
        ;                                        * 183BF

* refs (2): 183A6 183B0
* ob -> $: "0:" and the name of ob in port 0
Port0Name$:
        :: $ "0:" SWAP BakName$ &$ ;             * 183C4

* refs (1): 183DC
* backup -> $: the name inside a backup object
BakName$:
        CON(5)  (*)+5                            * 183EB  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 183F0
        A=DAT1  A                                * 183F7
        D0=A                                     * 183FA
        D0=D0+  10                               * 183FD
        GOTO    VarName$.L1                      * 18400

* refs (1): 183BA
* ob -> $: the name of the variable holding ob, cut to 23 characters
VarName$:
        CON(5)  (*)+5                            * 18404  primitive code object
        A=DAT1  A                                * 18409
        GOSBVL  SAVPTR                           * 1840C
        D0=A                                     * 18413
        GOSBVL  Name>Start                       * 18416
VarName$.L1:
        A=0     A                                * 1841D
        A=DAT0  B                                * 1841F
        LC(2)   #17                              * 18422
        ?C>A    B                                * 18426
        GOYES   VarName$.L2                      * 18429
        A=C     B                                * 1842B
VarName$.L2:
        D0=D0+  2                                * 1842E
        CD0EX                                    * 18431
        R3=C                                     * 18434
        R2=A                                     * 18437
        LC(5)   #0000A                           * 1843A  the number 10, not message #00A
        A=A+A   A                                * 18441
        C=C+A   A                                * 18443
        R0=C                                     * 18445
        GOSBVL  Temp$AllocR0                     * 18448
        A=R2                                     * 1844F
        LC(5)   #00005                           * 18452
        A=A+A   A                                * 18459
        A=A+C   A                                * 1845B
        D0=D0-  5                                * 1845D
        DAT0=A  A                                * 18460
        D0=D0+  5                                * 18463
        C=R3                                     * 18466
        D1=C                                     * 18469
        C=R2                                     * 1846C
        GOTO    VarName$.L4                      * 1846F
VarName$.loop3:
        A=DAT1  B                                * 18473
        D1=D1+  2                                * 18476
        DAT0=A  B                                * 18479
        D0=D0+  2                                * 1847C
VarName$.L4:
        C=C-1   B                                * 1847F
        GONC    VarName$.loop3                   * 18482
        GOVLNG  GPOverWrR0Lp                     * 18485
        RPL

* -> {HOME dir1 dir2..}
* refs (3): 1A12F 26890 B2738
PATHDIR:
        :: NULL{} CONTEXT@                       * 1848C
BrowseCDChoose~1:
          BEGIN DUP RAM-WORDNAME ROTSWAP >HCOMP SWAP MYRAMROMPAIR NOT UNTIL * 1849B
          CDRCOMP ' xHOME >HCOMP ;               * 184C8

* id ->
* refs (7): 1A114 B9977 B9B7D D29D9 D2A8D D2BFF ...
CREATEDIR:
        :: DUP ?PURGE_HERE CREATERRP ;           * 184E1

* refs (2): 18522 32F8B
dir?:DNA!:
        :: TYPERRP? NOT?SEMI                     * 184FA
          DIRARGERR ;                            * 18509

* ob id/lam ->
* refs (67): 15721 20CF0 20E00 20EB6 2C20C 2C6AC ...
XEQSTOID:
        :: dup;RclInVars(gn)? IT dir?:DNA!       * 18513
          PTR DoHere: SAFESTO ;                  * 18527

* refs (15): 15531 18518 18554 19371 2FE25 33DB4 ...
dup;RclInVars(gn)?:
        CON(5)  DupAndThen                       * 18536  code object: the address of its machine code

* id -> ob F -> T
* refs (17): 1938F 193AD 20967 2C738 32F81 36DE4 ...
SAFE@_HERE:
        :: PTR DoHere: SAFE@ ;                   * 1853B

* id ->
* refs (22): 184EB 20F17 2113D 2C23E 2C266 48A3A ...
?PURGE_HERE:
        :: dup;RclInVars(gn)? NOTcaseDROP DUP    * 1854F
          TYPERRP? ITE                           * 18563

pgdir(gn):
          :: DUP LastObj#''(di)? OBJ_41764 ; DROP * 1856D
          PURGE ;                                * 1858B

* id ->
* refs (2): 21249 D2999
XEQPGDIR:
        :: PTR DoHere: DRPExitAtLOOP NOT?SEMI    * 18595
          DUPTYPERRP? NcaseSIZEERR DUP           * 185A9
          OBJ_41764 pgdir!(di) ;                 * 185B8

* ->
* refs (5): 18527 18540 1859A 21001 36EE8
DoHere::
        :: 'R CONTEXT@ STOPSIGN! ERRSET EVAL ERRTRAP * 185C7
          :: SYSSTOPSIGN ERRJMP ; SYSSTOPSIGN ;  * 185EA

* refs (1): 18577
LastObj#''(di)?:
        :: LastNonNull case EMPTYDIRERR          * 18608
        ;                                        * 1861C

* rrp -> ob T -> F
* refs (12): 17E5C 18097 18114 181E6 1860D 1868E ...
LastNonNull:
        :: LASTRAM-WORD NOTcaseFALSE CkNonNull   * 18621
        ;                                        * 18635

* ob -> ob' T -> F
* refs (9): 1805B 186CF 3F764 3F7DC B2896 B96D5 ...
PrevNonNull:
        :: PREVRAM-WORD NOTcaseFALSE CkNonNull   * 1863A
        ;                                        * 1864E

* ob -> ob T -> F
* refs (2): 18630 18649
CkNonNull:
        CON(5)  (*)+5                            * 18653  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 18658
        CD1EX                                    * 1865B
        D1=D1-  2                                * 1865E
        A=DAT1  B                                * 18661
        D1=C                                     * 18664
        ?A#0    B                                * 18667
        GOYES   CkNonNull.L1                     * 1866A
        D1=D1+  5                                * 1866C
        D=D+1   A                                * 1866F
        GOVLNG  PushFLoop                        * 18671
CkNonNull.L1:
        GOVLNG  PushTLoop                        * 18678
        RPL

* ob :: -> {}
* refs (3): 186FC 18738 18783
DODIRPRG:
        :: NULL{} CONTEXT@ LastNonNull NOTcase ROTROT2DROP * 1867F
          BEGIN ?ATTNQUIT DUPUNROT RAM-WORDNAME 4PICK EVAL ITE >TCOMP DROP * 1869D
          SWAP PrevNonNull NOT UNTIL ROTROT2DROP ; * 186CA

* % -> {}
* refs (1): 1A1BE
DOTVARS%:
        :: ONE{}N ' TVarsMatch? DODIRPRG ;       * 186E8

* refs (1): 1A1C8
tvars(li):
        :: DUPINCOMP DUP#0= caseDROP ZERO_DO     * 18706
          TYPEREAL? NcaseTYPEERR LOOP            * 1871F
          ' TVarsMatch? DODIRPRG ;               * 1872E

* refs (3): 186F7 18733 187A1
* ob id types -> ... flag: ob's type is in the TVARS list; the DODIRPRG filter of TVARS
TVarsMatch?:
        :: 3PICK ?ROMPTR> XEQTYPE SWAPDROP 6PICK SWAP' %= POSCOMP #0<> ; * 18742

* -> {id1 id2..}
* refs (2): 1A19E 2DC3E
DOVARS:
        :: TrueTrue DODIRPRG ;                   * 18779

        :: IdEndsEQ? ITE TRUE TVarsMatch?        * 1878D
        ;                                        * 187A6

* refs (1): 18792
* id -> id flag: the name has two or more characters and ends in EQ
IdEndsEQ?:
        CON(5)  (*)+5                            * 187AB  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 187B0
        CD1EX                                    * 187B3
        RSTK=C                                   * 187B6
        D1=D1+  5                                * 187B8
        A=0     A                                * 187BB
        A=DAT1  B                                * 187BD
        D1=D1+  2                                * 187C0
        LC(2)   #02                              * 187C3
        A=A-C   B                                * 187C7
        GOC     IdEndsEQ?.L1                     * 187CA
        A=A+A   B                                * 187CD
        CD1EX                                    * 187D0
        C=C+A   A                                * 187D3
        D1=C                                     * 187D5
        A=0     A                                * 187D8
        A=DAT1  4                                * 187DA
        LC(5)   #05145                           * 187DE
        ?C#A    A                                * 187E5
        GOYES   IdEndsEQ?.L1                     * 187E8
        C=RSTK                                   * 187EA
        D1=C                                     * 187EC
        GOVLNG  PushTLoop                        * 187EF
IdEndsEQ?.L1:
        C=RSTK                                   * 187F6
        D1=C                                     * 187F8
        GOVLNG  PushFLoop                        * 187FB

* refs (3): 38787 72EAA D4A12
* -> ob: push LASTROMWDOB
LastRomWd>:
        CON(5)  (*)+5                            * 18802  primitive code object
        D=D-1   A                                * 18807
        GONC    LastRomWd>.L1                    * 18809
        GOSUB   GCorStackErr                     * 1880C
        D=D-1   A                                * 18810
LastRomWd>.L1:
        LC(5)   LASTROMWDOB                      * 18812
        CD0EX                                    * 18819
        A=DAT0  A                                * 1881C
        D0=C                                     * 1881F
        D1=D1-  5                                * 18822
        DAT1=A  A                                * 18825
        GOTO    0LASTOWDOB!.L1                   * 18828

* refs (1): 1880C
* Garbage-collect; returns when the stack has a free word, otherwise Insufficient Memory
GCorStackErr:
        GOSBVL  SAVPTR                           * 1882C
        GOSBVL  GARBAGECOL                       * 18833
        GOSBVL  GETPTR                           * 1883A
        ?D#0    A                                * 18841
        RTNYES                                   * 18844
        GOVLNG  DOMEMERR                         * 18846

* ->
* refs (16): 15932 1F64F 20DE7 2DDB0 33D32 33DE6 ...
0LASTOWDOB!:
        CON(5)  (*)+5                            * 1884D  primitive code object
        AD0EX                                    * 18852
        LC(5)   BINT0                            * 18855
        D0=(5)  LASTROMWDOB                      * 1885C
        DAT0=C  A                                * 18863
        D0=A                                     * 18866
0LASTOWDOB!.L1:
        A=DAT0  A                                * 18869
        D0=D0+  5                                * 1886C
        PC=(A)                                   * 1886F
        RPL

* $1 $2 -> $'
* refs (1): 1E7C4
AND$:
        :: ChkSize(2st) !AND$ ;                  * 18873

* $ $' -> $''
* refs (1): 1E84A
OR$:
        :: ChkSize(2st) !OR$ ;                   * 18887

* $ $' -> $''
* refs (1): 1E937
XOR$:
        :: ChkSize(2st) !XOR$ ;                  * 1889B

* refs (3): 18878 1888C 188A0
ChkSize(2st):
        :: OVERLEN$ OVERLEN$ #<>case SETSIZEERR  * 188AF
          TOTEMPSWAP ;                           * 188C8

* $1 $2 -> $'
* refs (1): 1E8BC
NOT$:
        :: TOTEMPOB !NOT$ ;                      * 188D2

* $ $' -> $''   ???
* refs (1): 1887D
!AND$:
        CON(5)  (*)+5                            * 188E6  primitive code object
        ASSEMBLE
        ST=1    3                                * 188EB
        ST=0    4                                * 188EE
        GOTO    !XOR$.L1                         * 188F1

* $ $' -> $''   ???
* refs (3): 18891 4F908 4F930
!OR$:
        CON(5)  (*)+5                            * 188F5  primitive code object
        ST=0    3                                * 188FA
        ST=1    4                                * 188FD
        GOTO    !XOR$.L1                         * 18900

* $ $' -> $''   ???
* refs (2): 188A5 4F935
!XOR$:
        CON(5)  (*)+5                            * 18904  primitive code object
        ST=0    3                                * 18909
        ST=0    4                                * 1890C
!XOR$.L1:
        A=DAT1  A                                * 1890F
        D1=D1+  5                                * 18912
        D=D+1   A                                * 18915
        GOSUB   Str2Setup                        * 18917
!XOR$.loop2:
        D=D-1   A                                * 1891B
        GOC     !XOR$.L3                         * 1891D
        A=DAT0  W                                * 18920
        C=DAT1  W                                * 18924
        GOSUB   BitOp                            * 18928
        DAT1=A  W                                * 1892C
        D0=D0+  16                               * 18930
        D1=D1+  16                               * 18933
        GONC    !XOR$.loop2                      * 18936
!XOR$.L3:
        P=P-1                                    * 18939
        GOC     !XOR$.L4                         * 1893B
        A=DAT0  WP                               * 1893E
        C=DAT1  WP                               * 18942
        GOSUB   BitOp                            * 18946
        DAT1=A  WP                               * 1894A
!XOR$.L4:
        P=      0                                * 1894E
        GOSBVL  GETPTR                           * 18950
        A=DAT0  A                                * 18957
        D0=D0+  5                                * 1895A
        PC=(A)                                   * 1895D

* $ $' -> $''   ???
* refs (1): 188DC
!NOT$:
        CON(5)  (*)+5                            * 18961  primitive code object
        A=DAT1  A                                * 18966
        GOSUB   Str2Setup                        * 18969
!NOT$.loop1:
        D=D-1   A                                * 1896D
        GOC     !NOT$.L2                         * 1896F
        A=DAT0  W                                * 18972
        A=-A-1  W                                * 18976
        DAT0=A  W                                * 18979
        D0=D0+  16                               * 1897D
        GONC    !NOT$.loop1                      * 18980
!NOT$.L2:
        P=P-1                                    * 18983
        GOC     !NOT$.L3                         * 18985
        A=DAT0  WP                               * 18988
        A=-A-1  WP                               * 1898C
        DAT0=A  WP                               * 1898F
!NOT$.L3:
        GOTO    !XOR$.L4                         * 18993

* refs (2): 18917 18969
* A.A = first string -> D0 = its body, D1 = body of the string on the stack, D.A = whole 16-nibble words, P = nibbles left over
Str2Setup:
        GOSBVL  SAVPTR                           * 18997
        D0=A                                     * 1899E
        D0=D0+  5                                * 189A1
        A=DAT0  A                                * 189A4
        LC(5)   #00005                           * 189A7
        C=A-C   A                                * 189AE
        D=C     A                                * 189B0
        DSR     A                                * 189B2
        P=C     0                                * 189B4
        D0=D0+  5                                * 189B8
        A=DAT1  A                                * 189BB
        D1=A                                     * 189BE
        D1=D1+  10                               * 189C1
        RTN                                      * 189C4

* refs (2): 18928 18946
* A.W, C.W -> A.W = A AND C when ST3 set, A OR C when ST4 set, else A XOR C. Uses B.W
BitOp:
        B=A     W                                * 189C6
        A=A&C   W                                * 189C9
        ?ST=1   3                                * 189CD
        RTNYES                                   * 189D0
        ABEX    W                                * 189D2
        A=A!C   W                                * 189D5
        ?ST=1   4                                * 189D9
        RTNYES                                   * 189DC
        A=A-B   W                                * 189DE
        RTN                                      * 189E1
        ENDLENGTH                                * 189E3

        LENGTH                                   * 189E3  library object without its prolog (its place is the end of the link table before): length, to #22DE0
        CON(2)  0                                * 189E8  no title

LIB002:
        CON(3)  #002                             * 189EA  library number
        REL(5)  LIB002.hash                      * 189ED  hash table
        REL(5)  LIB002.message                   * 189F2  message table
        REL(5)  LIB002.link                      * 189F7  link table
        REL(5)  HomeAttach!(<2>)                 * 189FC  config
        RPL

* refs (1): 189EA
HomeAttach!(<2>):
        :: BINT2 TOSRRP ;                        * 18A01

* ->
* refs (31): 1437D 144C5 144F2 1451A 14BEF 15649 ...
CK0NOLASTWD:
        CON(5)  (*)+5                            * 18A15  primitive code object
        ASSEMBLE
        GOTO    CK0NOLASTWD~1                    * 18A1A

* ->
* refs (139): 197FC 19817 19832 1984D 19868 19883 ...
CK0:
        CON(5)  (*)+5                            * 18A1E  primitive code object
        GOSUB   SetLastRomWrd                    * 18A23
CK0NOLASTWD~1:
        CD1EX                                    * 18A27
        D1=(5)  EDITLINE                         * 18A2A
        A=DAT1  A                                * 18A31
        A=A-C   A                                * 18A34
        D1=(5)  DEPTHSAVE                        * 18A36
        DAT1=A  A                                * 18A3D
        D1=(5)  LASTARGCOUNT                     * 18A40
        A=0     S                                * 18A47
        DAT1=A  S                                * 18A4A
        D1=C                                     * 18A4E
CK0NOLASTWD~1.L1:
        A=DAT0  A                                * 18A51
        D0=D0+  5                                * 18A54
        PC=(A)                                   * 18A57

* ob1...ob3 -> ob1...ob3
* refs (1): 1FC13
CK3:
        CON(5)  (*)+5                            * 18A5B  primitive code object
        GOSUB   SetLastRomWrd                    * 18A60
        GOTO    CK3NOLASTWD.L1                   * 18A64

* ob1...ob3 -> ob1...ob3
* refs (4): 1E039 1F834 1F93D 85DB3
CK3NOLASTWD:
        CON(5)  (*)+5                            * 18A68  primitive code object
CK3NOLASTWD.L1:
        GOSUB   CK3Args                          * 18A6D
        GOTO    CK0NOLASTWD~1.L1                 * 18A71

* refs (2): 18A6D 18EF9
* Check for 3 arguments, as CK1Args
CK3Args:
        P=      15                               * 18A75
        LC(1)   #3                               * 18A77
        P=      14                               * 18A7A
        GOTO    CK1Args.L1                       * 18A7C

* ob1 ob2 -> ob1 ob2
* refs (5): 1E766 1FBA7 1FBC2 1FBF8 1FC2E
CK2:
        CON(5)  (*)+5                            * 18A80  primitive code object
        GOSUB   SetLastRomWrd                    * 18A85
        GOTO    CK2NOLASTWD.L1                   * 18A89

* ob1 ob2 -> ob1 ob2
* refs (17): 154FF 1D203 1E002 1F839 1F852 20DEC ...
CK2NOLASTWD:
        CON(5)  (*)+5                            * 18A8D  primitive code object
CK2NOLASTWD.L1:
        GOSUB   CK2Args                          * 18A92
        GOTO    CK0NOLASTWD~1.L1                 * 18A96

* refs (2): 18A92 18EE8
* Check for 2 arguments, as CK1Args
CK2Args:
        P=      15                               * 18A9A
        LC(1)   #2                               * 18A9C
        P=      9                                * 18A9F
        GOTO    CK1Args.L1                       * 18AA1

* ob -> ob
* refs (13): 1A2C1 1A5E9 1CB10 1CB8B 1F153 1F9C9 ...
CK1:
        CON(5)  (*)+5                            * 18AA5  primitive code object
        GOSUB   SetLastRomWrd                    * 18AAA
        GOTO    CK1NOLASTWD.L1                   * 18AAE

* ob -> ob
* refs (35): 15093 15937 18C4F 1F659 1F73F 22F90 ...
CK1NOLASTWD:
        CON(5)  (*)+5                            * 18AB2  primitive code object
CK1NOLASTWD.L1:
        GOSUB   CK1Args                          * 18AB7
        GOTO    CK0NOLASTWD~1.L1                 * 18ABB

* refs (2): 18AB7 18ED7
* Check that the stack holds 1 argument (else Too Few Arguments), set DEPTHSAVE, and save the argument in LASTARG unless flag -55 is set
CK1Args:
        P=      15                               * 18ABF
        LC(1)   #1                               * 18AC1
        P=      4                                * 18AC4
CK1Args.L1:
        A=0     W                                * 18AC6
        A=DAT1  WP                               * 18AC9
        R0=A                                     * 18ACD
        CD1EX                                    * 18AD0
        RSTK=C                                   * 18AD3
        D1=(5)  EDITLINE                         * 18AD5
        A=DAT1  A                                * 18ADC
        A=A-C   A                                * 18ADF
        P=P+1                                    * 18AE1
        C=0     A                                * 18AE3
        CPEX    0                                * 18AE5
        D1=(5)  DEPTHSAVE                        * 18AE9
        ?C>=A   A                                * 18AF0
        GOYES   CK1Args.L3                       * 18AF3
        A=A-C   A                                * 18AF5
        DAT1=A  A                                * 18AF7
        D1=(5)  #80850                           * 18AFA
        C=DAT1  B                                * 18B01
        ?CBIT=1 2                                * 18B04
        GOYES   CK1Args.loop2                    * 18B09
        D1=(5)  LASTARG                          * 18B0B
        A=R0                                     * 18B12
        DAT1=A  15                               * 18B15
        D1=(5)  LASTARGCOUNT                     * 18B19
        C=DAT1  B                                * 18B20
        ?CBIT=1 4                                * 18B23
        GOYES   CK1Args.L4                       * 18B28
        DAT1=C  S                                * 18B2A
CK1Args.loop2:
        C=RSTK                                   * 18B2E
        D1=C                                     * 18B30
        RTN                                      * 18B33
CK1Args.L3:
        DAT1=A  A                                * 18B35
        D1=(5)  LASTARGCOUNT                     * 18B38
        C=0     S                                * 18B3F
        DAT1=C  S                                * 18B42
        C=RSTK                                   * 18B46
        D1=C                                     * 18B48
        GOTO    DoErrTFA                         * 18B4B
CK1Args.L4:
        A=0     W                                * 18B4F
        CBIT=0  4                                * 18B52
CK1Args.L5:
        DAT1=C  B                                * 18B57
        DAT1=C  S                                * 18B5A
        D1=(5)  LASTARG4                         * 18B5E
        DAT1=A  10                               * 18B65
        GOTO    CK1Args.loop2                    * 18B69

* ob1...ob5 -> ob1...ob5
CK5:
        CON(5)  (*)+5                            * 18B6D  primitive code object
        GOSUB   SetLastRomWrd                    * 18B72
        GOTO    CK5NOLASTWD.L1                   * 18B76

* ob1...ob5 -> ob1...ob5
CK5NOLASTWD:
        CON(5)  (*)+5                            * 18B7A  primitive code object
CK5NOLASTWD.L1:
        GOSUB   CK5Args                          * 18B7F
        GOTO    CK0NOLASTWD~1.L1                 * 18B83

* refs (2): 18B7F 18F1B
* Check for 5 arguments, as CK1Args
CK5Args:
        P=      15                               * 18B87
        LC(1)   #5                               * 18B89
        P=      9                                * 18B8C
        GOTO    CK4Args.L1                       * 18B8E

* ob1...ob5 -> ob1...ob5
CK4:
        CON(5)  (*)+5                            * 18B92  primitive code object
        GOSUB   SetLastRomWrd                    * 18B97
        GOTO    CK4NOLASTWD.L1                   * 18B9B

* ob1...ob4 -> ob1...ob4
* refs (2): 85D0E 85D59
CK4NOLASTWD:
        CON(5)  (*)+5                            * 18B9F  primitive code object
CK4NOLASTWD.L1:
        GOSUB   CK4Args                          * 18BA4
        GOTO    CK0NOLASTWD~1.L1                 * 18BA8

* refs (2): 18BA4 18F0A
* Check for 4 arguments, as CK1Args
CK4Args:
        P=      15                               * 18BAC
        LC(1)   #4                               * 18BAE
        P=      4                                * 18BB1
CK4Args.L1:
        A=DAT1  15                               * 18BB3
        R0=A                                     * 18BB7
        CD1EX                                    * 18BBA
        D1=C                                     * 18BBD
        RSTK=C                                   * 18BC0
        D1=D1+  15                               * 18BC2
        A=0     W                                * 18BC5
        A=DAT1  WP                               * 18BC8
        R1=A                                     * 18BCC
        D1=(5)  EDITLINE                         * 18BCF
        A=DAT1  A                                * 18BD6
        A=A-C   A                                * 18BD9
        C=0     A                                * 18BDB
        C=P     0                                * 18BDD
        P=      15                               * 18BE1
        C+P+1                                    * 18BE3
        P=      0                                * 18BE6
        D1=(5)  DEPTHSAVE                        * 18BE8
        ?C>=A   A                                * 18BEF
        GOYES   CK4Args.L2                       * 18BF2
        A=A-C   A                                * 18BF4
        DAT1=A  A                                * 18BF6
        D1=(5)  #80850                           * 18BF9
        C=DAT1  XS                               * 18C00
        ?CBIT=1 10                               * 18C04
        GOYES   CK4Args.L3                       * 18C09
        D1=(5)  LASTARG                          * 18C0B
        A=R0                                     * 18C12
        DAT1=A  15                               * 18C15
        A=R1                                     * 18C19
        D1=(5)  LASTARGCOUNT                     * 18C1C
        CBIT=1  4                                * 18C23
        GOTO    CK1Args.L5                       * 18C28
CK4Args.L2:
        GOTO    CK1Args.L3                       * 18C2C
CK4Args.L3:
        GOTO    CK1Args.loop2                    * 18C30

* ob1...obn %n ->  ob1..obn #n
* refs (8): 1C788 1FC69 1FC84 1FC9F 1FCBA 1FCD5 ...
CKN:
        CON(5)  (*)+5                            * 18C34  primitive code object
        GOSUB   SetLastRomWrd                    * 18C39
        LC(5)   CKNNOLASTWD                      * 18C3D
        A=C     A                                * 18C44
        PC=(A)                                   * 18C46
        RPL

* ob1...obn %n ->  ob1..obn #n
* refs (6): 18C3D 42E2C 42E4F 44020 440B1 C09D6
CKNNOLASTWD:
        :: CK1NOLASTWD CKREAL COERCE DEPTH 2DUP#< caseDROP SETSTACKERR * 18C4A
        ;                                        * 18C72
        ASSEMBLE

* refs (12): 18A23 18A60 18A85 18AAA 18B72 18B97 ...
* LASTROMWDOB := the running command (D0-10), for error messages; called first by CK0-CK5 and CKN
SetLastRomWrd:
        AD0EX                                    * 18C77
        D0=A                                     * 18C7A
        D0=D0-  10                               * 18C7D
        CD0EX                                    * 18C80
        D0=(5)  LASTROMWDOB                      * 18C83
        DAT0=C  A                                * 18C8A
        D0=A                                     * 18C8D
        RTNCC                                    * 18C90

* Error 204h
* refs (19): 1513D 1937B 19399 193B7 1F74E 20971 ...
SETNONEXTERR:
        CON(5)  (*)+5                            * 18C92  primitive code object

* refs (1): 18C92
DoErrUN:
        LC(5)   #00204                           * 18C97
        GOTO    DoErrTFA.L1                      * 18C9E

* Error 203h
* refs (77): 0E566 0E57F 188C3 193E9 19411 19434 ...
SETSIZEERR:
        CON(5)  (*)+5                            * 18CA2  primitive code object

* Bad Argument Value error
* refs (3): 18CA2 2AE94 53807
DOSIZEERR:
        LC(5)   #00203                           * 18CA7
        GOTO    DoErrTFA.L1                      * 18CAE

* Error 202h
* refs (56): 0905C 150CF 193D0 19452 1949D 194CF ...
SETTYPEERR:
        CON(5)  (*)+5                            * 18CB2  primitive code object

* refs (3): 18CB2 18F51 19290
DoErrBAT:
        LC(5)   #00202                           * 18CB7
        GOTO    DoErrTFA.L1                      * 18CBE

* Error 201h
* refs (11): 18C6D 1F5A3 1F66D 23018 234EE 5949A ...
SETSTACKERR:
        CON(5)  (*)+5                            * 18CC2  primitive code object

* refs (3): 18B4B 18CC2 19285
DoErrTFA:
        LC(5)   #00201                           * 18CC7
DoErrTFA.L1:
        A=C     A                                * 18CCE
        GOVLNG  Errjmp                           * 18CD0

* % -> #
* refs (6): 1C2BA 2EC1B 2EDFF 41D6A 45D66 4A47A
%ABSCOERCE:
        CON(5)  (*)+5                            * 18CD7  primitive code object
        GOSBVL  POP1%                            * 18CDC
        A=0     S                                * 18CE3
        GOTO    COERCE.L1                        * 18CE6

* % -> #
* refs (116): 0E3E4 0E729 140BF 140F6 1419E 14300 ...
COERCE:
        CON(5)  (*)+5                            * 18CEA  primitive code object
        GOSBVL  POP1%                            * 18CEF
COERCE.L1:
        SETHEX                                   * 18CF6
        ?A=0    S                                * 18CF8
        GOYES   COERCE.L6                        * 18CFB
COERCE.loop2:
        A=0     A                                * 18CFD
        GOTO    COERCE.loop4                     * 18CFF
COERCE.loop3:
        A=0     A                                * 18D03
        A=A-1   A                                * 18D05
COERCE.loop4:
        R0=A                                     * 18D07
COERCE.loop5:
        GOSBVL  PUSH#                            * 18D0A
        A=DAT0  A                                * 18D11
        D0=D0+  5                                * 18D14
        PC=(A)                                   * 18D17
COERCE.L6:
        ?A=0    W                                * 18D1B
        GOYES   COERCE.loop4                     * 18D1E
        LC(3)   #500                             * 18D20
        ?C>A    X                                * 18D25
        GOYES   COERCE.L7                        * 18D28
        LC(3)   #999                             * 18D2A
        ?C#A    X                                * 18D2F
        GOYES   COERCE.loop2                     * 18D32
        P=      14                               * 18D34
        LC(1)   #4                               * 18D36
        C=C-A   P                                * 18D39
        P=      0                                * 18D3C
        GONC    COERCE.loop2                     * 18D3E
        A=0     A                                * 18D41
        A=A+1   A                                * 18D43
        GONC    COERCE.loop4                     * 18D45
COERCE.L7:
        LC(3)   #006                             * 18D48
        ?C<A    X                                * 18D4D
        GOYES   COERCE.loop3                     * 18D50
        B=A     X                                * 18D52
        C=A     X                                * 18D55
        P=      14                               * 18D58
COERCE.loop8:
        P=P-1                                    * 18D5A
        C=C-1   X                                * 18D5C
        GONC    COERCE.loop8                     * 18D5F
        SETDEC                                   * 18D62
        A=A+A   P                                * 18D64
        A=0     WP                               * 18D67
        GONC    COERCE.L9                        * 18D6A
        A=A-1   WP                               * 18D6D
        A=A+1   W                                * 18D70
        ?A=0    S                                * 18D73
        GOYES   COERCE.L9                        * 18D76
        ASR     W                                * 18D78
        B=B+1   X                                * 18D7B
COERCE.L9:
        C=0     W                                * 18D7E
        SETHEX                                   * 18D81
COERCE.loop10:
        C=C+C   W                                * 18D83
        D=C     W                                * 18D86
        C=C+C   W                                * 18D89
        C=C+C   W                                * 18D8C
        C=C+D   W                                * 18D8F
        ASL     W                                * 18D92
        ?A=0    S                                * 18D95
        GOYES   COERCE.L12                       * 18D98
COERCE.loop11:
        C=C+1   W                                * 18D9A
        A=A-1   S                                * 18D9D
        ?A#0    S                                * 18DA0
        GOYES   COERCE.loop11                    * 18DA3
COERCE.L12:
        B=B-1   X                                * 18DA5
        GONC    COERCE.loop10                    * 18DA8
        R0=C                                     * 18DAB
        P=      0                                * 18DAE
        C=0     A                                * 18DB0
        ?C=0    W                                * 18DB2
        GOYES   COERCE.L13                       * 18DB5
        GOTO    COERCE.loop3                     * 18DB7
COERCE.L13:
        GOTO    COERCE.loop5                     * 18DBB

* # -> %
* refs (97): 0DCC2 0E715 0EB0E 0EBCB 14056 1412D ...
UNCOERCE:
        CON(5)  (*)+5                            * 18DBF  primitive code object
        GOSBVL  POP#                             * 18DC4
        GOSBVL  SAVPTR                           * 18DCB
        LC(2)   #19                              * 18DD2
        B=0     W                                * 18DD6
UNCOERCE.loop1:
        B=B+B   W                                * 18DD9
        SETHEX                                   * 18DDC
        A=A+A   A                                * 18DDE
        SETDEC                                   * 18DE0
        GONC    UNCOERCE.L2                      * 18DE2
        B=B+1   W                                * 18DE5
UNCOERCE.L2:
        C=C-1   B                                * 18DE8
        GONC    UNCOERCE.loop1                   * 18DEB
        P=      5                                * 18DEE
        A=A-1   X                                * 18DF0
UNCOERCE.loop3:
        A=A+1   X                                * 18DF3
        BSRC                                     * 18DF6
        ?B#0    WP                               * 18DF9
        GOYES   UNCOERCE.loop3                   * 18DFC
        BSR     W                                * 18DFE
        A=B     M                                * 18E01
        A=0     S                                * 18E04
        GOSBVL  PUSH%                            * 18E07
        A=DAT0  A                                * 18E0E
        D0=D0+  5                                * 18E11
        PC=(A)                                   * 18E14
        RPL

* refs (6): 157C4 157F6 20DE2 545BE 5568E 556A7
->num(ex):
        :: DNOTSYMB?SEMI BEGIN ?ATTNQUIT0 ->num(ex)~1 WHILE COMPEVAL REPEAT ; * 18E18

* symb -> :: symb <ob1> <rest> ; ob -> :: ob ;
* refs (1): 18E1D
DNOTSYMB?SEMI:
        CON(5)  (*)+5                            * 18E45  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 18E4A
        ?A=0    A                                * 18E4D
        GOYES   DNOTSYMB?SEMI.L1                 * 18E50
        AD1EX                                    * 18E52
        C=DAT1  A                                * 18E55
        D1=(5)  DOSYMB                           * 18E58
        AD1EX                                    * 18E5F
        ?C=A    A                                * 18E62
        GOYES   DNOTSYMB?SEMI.L2                 * 18E65
DNOTSYMB?SEMI.L1:
        LC(5)   SEMI                             * 18E67
        A=C     A                                * 18E6E
        PC=(A)                                   * 18E70
DNOTSYMB?SEMI.L2:
        A=DAT0  A                                * 18E74
        D0=D0+  5                                * 18E77
        PC=(A)                                   * 18E7A

* refs (1): 18E2C
->num(ex)~1:
        CON(5)  (*)+5                            * 18E7E  primitive code object
        A=DAT1  A                                * 18E83
        ?A=0    A                                * 18E86
        GOYES   ->num(ex)~1.L1                   * 18E89
        AD1EX                                    * 18E8B
        C=DAT1  A                                * 18E8E
        D1=(5)  DOSYMB                           * 18E91
        AD1EX                                    * 18E98
        ?C=A    A                                * 18E9B
        GOYES   ->num(ex)~1.L2                   * 18E9E
->num(ex)~1.L1:
        LC(5)   FALSE                            * 18EA0
        A=C     A                                * 18EA7
        PC=(A)                                   * 18EA9
->num(ex)~1.L2:
        LC(5)   TRUE                             * 18EAD
        A=C     A                                * 18EB4
        PC=(A)                                   * 18EB6

* comp ->
* refs (14): 18E36 1A3CD 1A3D7 546A2 54918 54BDC ...
COMPEVAL:
        CON(5)  (*)+5                            * 18EBA  primitive code object
        A=DAT1  A                                * 18EBF
        D1=D1+  5                                * 18EC2
        D=D+1   A                                * 18EC5
        GOVLNG  DOCOL                            * 18EC7

* ->
* refs (209): 19580 195A0 195C0 195E0 19600 19620 ...
CK1&Dispatch:
        CON(5)  (*)+5                            * 18ECE  primitive code object
        GOSUB   SetLastRomWrd                    * 18ED3
        GOSUB   CK1Args                          * 18ED7
        GOTO    EvalNoCK.L4                      * 18EDB

* ->
* refs (111): 196E0 19754 197AA 19997 199B7 199D7 ...
CK2&Dispatch:
        CON(5)  (*)+5                            * 18EDF  primitive code object
        GOSUB   SetLastRomWrd                    * 18EE4
        GOSUB   CK2Args                          * 18EE8
        GOTO    EvalNoCK.L4                      * 18EEC

* ->
* refs (30): 1A403 1C043 1C861 1C8EF 1D40C 1D5E4 ...
CK3&Dispatch:
        CON(5)  (*)+5                            * 18EF0  primitive code object
        GOSUB   SetLastRomWrd                    * 18EF5
        GOSUB   CK3Args                          * 18EF9
        GOTO    EvalNoCK.L4                      * 18EFD

* ->
* refs (10): 1E5D7 1F1D9 1F228 1F2CE 26DA6 5E945 ...
CK4&Dispatch:
        CON(5)  (*)+5                            * 18F01  primitive code object
        GOSUB   SetLastRomWrd                    * 18F06
        GOSUB   CK4Args                          * 18F0A
        GOTO    EvalNoCK.L4                      * 18F0E

* ->
* refs (6): 26DA1 5F921 72E6A C181C C19E3 D1957
CK5&Dispatch:
        CON(5)  (*)+5                            * 18F12  primitive code object
        GOSUB   SetLastRomWrd                    * 18F17
        GOSUB   CK5Args                          * 18F1B
        GOTO    EvalNoCK.L4                      * 18F1F

* comp -> ?
* refs (22): 18F79 19F05 1EA62 1EB83 1F861 1F94C ...
EvalNoCK:
        CON(5)  EvalNoCK~1                       * 18F23  code object: the address of its machine code
        BSS     23                               * 18F28
EvalNoCK.L1:
        ?ST=0   5                                * 18F3F
        GOYES   EvalNoCK.L2                      * 18F42
        LC(5)   OBJ_72EA5                        * 18F44
        A=C     A                                * 18F4B
        PC=(A)                                   * 18F4D
EvalNoCK.L2:
        GOTO    DoErrBAT                         * 18F51
EvalNoCK.L3:
        ST=0    5                                * 18F55
        GOTO    CK&DISPATCH1.L1                  * 18F58
EvalNoCK.L4:
        ST=1    5                                * 18F5C
        GOTO    CK&DISPATCH1.L1                  * 18F5F
EvalNoCK.L5:
        ST=0    5                                * 18F63
        GOTO    CK&DISPATCH1.L2                  * 18F66
        RPL

* RS ob ->
* refs (34): 158AA 158CD 158F0 1A4B7 1A504 1D551 ...
'EvalNoCK:_sup:
        :: 'R COLA EvalNoCK                      * 18F6A
        ;                                        * 18F7E
        ASSEMBLE
'EvalNoCK:_sup.loop1:
        GOTO    EvalNoCK.L1                      * 18F83
'EvalNoCK:_sup.L2:
        ?ST=0   4                                * 18F87
        GOYES   'EvalNoCK:_sup.loop1             * 18F8A
        ST=1    2                                * 18F8C
        ST=0    4                                * 18F8F
        C=RSTK                                   * 18F92
        C=RSTK                                   * 18F94
        D0=C                                     * 18F96
        GOTO    CK&DISPATCH1.L3                  * 18F99

* ->
* refs (56): 16AD1 1839C 1C6BB 1CB95 1D498 1D579 ...
CK&DISPATCH0:
        CON(5)  (*)+5                            * 18F9D  primitive code object
        ST=0    4                                * 18FA2
        GOTO    EvalNoCK.L5                      * 18FA5

* ->
CK&DISPATCH2:
        CON(5)  (*)+5                            * 18FA9  primitive code object
        GOTO    EvalNoCK.L3                      * 18FAE

* ->
* refs (27): 15098 15142 1DF80 1FA1B 20491 204CD ...
CK&DISPATCH1:
        CON(5)  EvalNoCK.L3                      * 18FB2  code object: the address of its machine code
CK&DISPATCH1.L1:
        ST=1    4                                * 18FB7
        CD0EX                                    * 18FBA
        D0=C                                     * 18FBD
        RSTK=C                                   * 18FC0
CK&DISPATCH1.L2:
        ST=0    2                                * 18FC2
CK&DISPATCH1.L3:
        CD1EX                                    * 18FC5
CK&DISPATCH1.loop4:
        RSTK=C                                   * 18FC8
        D1=C                                     * 18FCA
        A=DAT0  A                                * 18FCD
        LC(5)   SEMI                             * 18FD0
        ?C=A    A                                * 18FD7
        GOYES   'EvalNoCK:_sup.L2                * 18FDA
        LC(5)   DOBINT                           * 18FDC
        ?C#A    A                                * 18FE3
        GOYES   CK&DISPATCH1.L5                  * 18FE6
        D0=D0+  5                                * 18FE8
        C=DAT0  A                                * 18FEB
        GONC    CK&DISPATCH1.L6                  * 18FEE
CK&DISPATCH1.L5:
        AD0EX                                    * 18FF1
        D0=D0+  5                                * 18FF4
        C=DAT0  A                                * 18FF7
        D0=A                                     * 18FFA
CK&DISPATCH1.L6:
        D0=D0+  5                                * 18FFD
CK&DISPATCH1.loop7:
        ?C#0    P                                * 19000
        GOYES   CK&DISPATCH1.L8                  * 19003
        GOTO    CK&DISPATCH1.L15                 * 19005
CK&DISPATCH1.L8:
        ST=0    3                                * 19009
        C=C+1   P                                * 1900C
        GONC    CK&DISPATCH1.loop9               * 1900F
        ST=1    3                                * 19012
        CSR     A                                * 19015
CK&DISPATCH1.loop9:
        RSTK=C                                   * 19017
        A=0     A                                * 19019
        A=C     P                                * 1901B
        C=A     A                                * 1901E
        A=A+A   A                                * 19020
        A=A+A   A                                * 19022
        A=A+C   A                                * 19024
        ?ST=1   3                                * 19026
        GOYES   CK&DISPATCH1.L10                 * 19029
        LC(5)   CK&DISPATCH1.L21+2               * 1902B
        GOTO    CK&DISPATCH1.L11                 * 19032
CK&DISPATCH1.L10:
        LC(5)   #1916E                           * 19036
CK&DISPATCH1.L11:
        A=A+C   A                                * 1903D
        AD1EX                                    * 1903F
        C=DAT1  A                                * 19042
        D1=A                                     * 19045
        RSTK=C                                   * 19048
        C=DAT1  A                                * 1904A
        CD1EX                                    * 1904D
        A=DAT1  A                                * 19050
        D1=C                                     * 19053
        C=RSTK                                   * 19056
        ?C=A    A                                * 19058
        GOYES   CK&DISPATCH1.loop14              * 1905B
        ?C=0    A                                * 1905D
        GOYES   CK&DISPATCH1.L17                 * 19060
CK&DISPATCH1.loop12:
        ?ST=1   2                                * 19062
        GOYES   CK&DISPATCH1.L18                 * 19065
CK&DISPATCH1.loop13:
        C=RSTK                                   * 19067
        GOSBVL  SKIPOB                           * 19069
        C=RSTK                                   * 19070
        GOTO    CK&DISPATCH1.loop4               * 19072
CK&DISPATCH1.loop14:
        C=RSTK                                   * 19076
CK&DISPATCH1.L15:
        D1=D1+  5                                * 19078
        CSR     A                                * 1907B
        ?C=0    A                                * 1907D
        GOYES   CK&DISPATCH1.L16                 * 19080
        GOTO    CK&DISPATCH1.loop7               * 19082
CK&DISPATCH1.L16:
        C=RSTK                                   * 19086
        D1=C                                     * 19088
        LC(5)   COLA                             * 1908B
        A=C     A                                * 19092
        PC=(A)                                   * 19094
CK&DISPATCH1.L17:
        LC(5)   DOSYMB                           * 19098
        ?C=A    A                                * 1909F
        GOYES   CK&DISPATCH1.loop14              * 190A2
        LC(5)   DOIDNT                           * 190A4
        ?C=A    A                                * 190AB
        GOYES   CK&DISPATCH1.loop14              * 190AE
        LC(5)   DOLAM                            * 190B0
        ?C=A    A                                * 190B7
        GOYES   CK&DISPATCH1.loop14              * 190BA
        GOTO    CK&DISPATCH1.loop12              * 190BC
CK&DISPATCH1.L18:
        LC(5)   DOTAG                            * 190C0
        ?C#A    A                                * 190C7
        GOYES   CK&DISPATCH1.loop13              * 190CA
        C=DAT1  A                                * 190CC
        CD1EX                                    * 190CF
        D1=D1+  5                                * 190D2
        A=0     A                                * 190D5
        A=DAT1  B                                * 190D7
        A=A+A   A                                * 190DA
        D1=D1+  2                                * 190DC
        CD1EX                                    * 190DF
        C=C+A   A                                * 190E2
        CD1EX                                    * 190E4
        RSTK=C                                   * 190E7
        C=DAT1  A                                * 190E9
        R0=C.F  A                                * 190EC
        CD1EX                                    * 190F2
        R1=C.F  A                                * 190F5
        A=DAT1  A                                * 190FB
        LC(5)   PRLG                             * 190FE
        ?C=A    A                                * 19105
        GOYES   CK&DISPATCH1.L19                 * 19108
        A=R0.F  A                                * 1910A
        GOTO    CK&DISPATCH1.L20                 * 19110
CK&DISPATCH1.L19:
        A=R1.F  A                                * 19114
CK&DISPATCH1.L20:
        C=RSTK                                   * 1911A
CK&DISPATCH1.L21:
        D1=C                                     * 1911C
        DAT1=A  A                                * 1911F
        C=RSTK                                   * 19122
        GOTO    CK&DISPATCH1.loop9               * 19124

* Argument dispatch: the prolog for each type digit 1-E (A, name or algebraic, is 0 and checked in code); read at #19017
        CON(5)  DOREAL                           * 19128  entry 0
        CON(5)  DOCMP                            * 1912D  entry 1
        CON(5)  DOCSTR                           * 19132  entry 2
        CON(5)  DOARRY                           * 19137  entry 3
        CON(5)  DOLIST                           * 1913C  entry 4
        CON(5)  DOIDNT                           * 19141  entry 5
        CON(5)  DOLAM                            * 19146  entry 6
        CON(5)  DOCOL                            * 1914B  entry 7
        CON(5)  DOSYMB                           * 19150  entry 8
        CON(5)  #00000                           * 19155  entry 9
        CON(5)  DOHSTR                           * 1915A  entry 10
        CON(5)  DOGROB                           * 1915F  entry 11
        CON(5)  DOTAG                            * 19164  entry 12
        CON(5)  DOEXT                            * 19169  entry 13

* Argument dispatch: the prolog for each extended type 0F-EF; read at #19017
        CON(5)  DOROMP                           * 1916E  entry 0
        CON(5)  DOBINT                           * 19173  entry 1
        CON(5)  DORRP                            * 19178  entry 2
        CON(5)  DOEREL                           * 1917D  entry 3
        CON(5)  DOECMP                           * 19182  entry 4
        CON(5)  DOLNKARRY                        * 19187  entry 5
        CON(5)  DOCHAR                           * 1918C  entry 6

Code_19191:
        CON(5)  DOCODE                           * 19191  entry 7
        CON(5)  DOLIB                            * 19196  entry 8
        CON(5)  DOBAK                            * 1919B  entry 9
        CON(5)  DOEXT0                           * 191A0  entry 10
        CON(5)  DOEXT1                           * 191A5  entry 11
        CON(5)  DOEXT2                           * 191AA  entry 12
        CON(5)  DOEXT3                           * 191AF  entry 13
        CON(5)  DOEXT4                           * 191B4  entry 14

* # #' -> #*#'
* refs (2): 1D068 37E64
#*OVF:
        CON(5)  (*)+5                            * 191B9  primitive code object
        GOSBVL  POP#                             * 191BE
        R0=A                                     * 191C5
        GOSBVL  POP#                             * 191C8
        GOSBVL  SAVPTR                           * 191CF
        B=0     A                                * 191D6
        D0=(5)  #00013                           * 191D8
        C=R0                                     * 191DF
#*OVF.loop1:
        B=B+B   A                                * 191E2
        GOC     #*OVF.L4                         * 191E4
        A=A+A   A                                * 191E7
        GONC    #*OVF.L2                         * 191E9
        B=B+C   A                                * 191EC
        GOC     #*OVF.L4                         * 191EE
#*OVF.L2:
        D0=D0-  1                                * 191F1
        GONC    #*OVF.loop1                      * 191F4
#*OVF.loop3:
        C=B     A                                * 191F7
        R0=C                                     * 191F9
        GOTO    COERCE.loop5                     * 191FC
#*OVF.L4:
        B=0     A                                * 19200
        B=B-1   A                                * 19202
        GOC     #*OVF.loop3                      * 19204  always taken

* ->
* refs (1): 1D06D
CKNFLOATS:
        CON(5)  (*)+5                            * 19207  primitive code object
        ST=0    0                                * 1920C
        GOSBVL  SAVPTR                           * 1920F
        A=DAT1  A                                * 19216
        AD1EX                                    * 19219
        D1=D1+  5                                * 1921C
        C=DAT1  A                                * 1921F
        B=C     A                                * 19222
        D1=A                                     * 19224
        D1=D1+  5                                * 19227
        GONC    CKNFLOATS.L2                     * 1922A
CKNFLOATS.loop1:
        A=DAT1  A                                * 1922D
        ?A=0    A                                * 19230
        GOYES   CKNFLOATS.L4                     * 19233
        D0=A                                     * 19235
        A=DAT0  A                                * 19238
        LC(5)   DOREAL                           * 1923B
        ?C=A    A                                * 19242
        GOYES   CKNFLOATS.L2                     * 19245
        LC(5)   DOCMP                            * 19247
        ?C#A    A                                * 1924E
        GOYES   CKNFLOATS.L5                     * 19251
        ST=1    0                                * 19253
CKNFLOATS.L2:
        D1=D1+  5                                * 19256
        B=B-1   A                                * 19259
        GONC    CKNFLOATS.loop1                  * 1925B
        GOSBVL  GETPTR                           * 1925E
        LC(5)   %0_2A2B4                         * 19265
        ?ST=0   0                                * 1926C
        GOYES   CKNFLOATS.L3                     * 1926F
        LC(5)   C%0                              * 19271
CKNFLOATS.L3:
        A=C     A                                * 19278
        PC=(A)                                   * 1927A
CKNFLOATS.L4:
        GOSBVL  GETPTR                           * 1927E
        GOTO    DoErrTFA                         * 19285
CKNFLOATS.L5:
        GOSBVL  GETPTR                           * 19289
        GOTO    DoErrBAT                         * 19290

* F%..F% #n [%F] -> [F%]'
* refs (1): 1D07C
>ARRY:
        CON(5)  (*)+5                            * 19294  primitive code object
        CD0EX                                    * 19299
        RSTK=C                                   * 1929C
        C=DAT1  A                                * 1929E
        RSTK=C                                   * 192A1
        D0=C                                     * 192A3
        D1=D1+  5                                * 192A6
        A=DAT1  A                                * 192A9
        AD1EX                                    * 192AC
        D1=D1+  5                                * 192AF
        C=DAT1  A                                * 192B2
        D1=A                                     * 192B5
        D=D+C   A                                * 192B8
        D=D+1   A                                * 192BA
        BCEX    A                                * 192BC
        RSTK=C                                   * 192BE
        D0=D0+  10                               * 192C0
        A=DAT0  A                                * 192C3
        ST=0    0                                * 192C6
        LC(5)   DOREAL                           * 192C9
        ?C=A    A                                * 192D0
        GOYES   >ARRY.L1                         * 192D3
        ST=1    0                                * 192D5
>ARRY.L1:
        D0=D0-  5                                * 192D8
        C=DAT0  A                                * 192DB
        AD0EX                                    * 192DE
        A=A+C   A                                * 192E1
        D0=A                                     * 192E3
        GONC    >ARRY.L6                         * 192E6
>ARRY.loop2:
        D1=D1+  5                                * 192E9
        C=DAT1  A                                * 192EC
        CD1EX                                    * 192EF
        RSTK=C                                   * 192F2
        A=DAT1  A                                * 192F4
        LC(5)   DOCMP                            * 192F7
        D1=D1+  5                                * 192FE
        ?C=A    A                                * 19301
        GOYES   >ARRY.L3                         * 19304
        A=DAT1  W                                * 19306
        ?ST=0   0                                * 1930A
        GOYES   >ARRY.L5                         * 1930D
        C=0     W                                * 1930F
        GONC    >ARRY.L4                         * 19312
>ARRY.L3:
        A=DAT1  W                                * 19315
        D1=D1+  16                               * 19319
        C=DAT1  W                                * 1931C
>ARRY.L4:
        D0=D0-  16                               * 19320
        DAT0=C  W                                * 19323
>ARRY.L5:
        D0=D0-  16                               * 19327
        DAT0=A  W                                * 1932A
        C=RSTK                                   * 1932E
        D1=C                                     * 19330
>ARRY.L6:
        B=B-1   A                                * 19333
        GONC    >ARRY.loop2                      * 19335
        C=RSTK                                   * 19338
        B=C     A                                * 1933A
        C=RSTK                                   * 1933C
        DAT1=C  A                                * 1933E
        C=RSTK                                   * 19341
        D0=C                                     * 19343
        A=DAT0  A                                * 19346
        D0=D0+  5                                * 19349
        PC=(A)                                   * 1934C

* ob -> ob flag
* refs (1): 24DB1
NOTINHARDROM?:
        CON(5)  (*)+5                            * 19350  primitive code object
        A=DAT1  A                                * 19355
        LC(5)   CMOS                             * 19358
        ?C>A    A                                * 1935F
        GOYES   NOTINHARDROM?.L1                 * 19362
        GOTO    ->num(ex)~1.L2                   * 19364
NOTINHARDROM?.L1:
        GOTO    ->num(ex)~1.L1                   * 19368
        RPL

* refs (18): 1D34F 1D372 1D3C4 1D3E7 202F6 20319 ...
dup;RclInVars(nm):
        :: dup;RclInVars(gn)? ?SEMI              * 1936C
          SETNONEXTERR ;                         * 1937B

* refs (17): 1D12F 1D15C 1D244 1D267 1D28F 1D2B2 ...
over;RclInVars(nm):
        :: OVER SAFE@_HERE ?SEMI                 * 19385
          SETNONEXTERR ;                         * 19399

* refs (4): 1D48E 1D56F 1D666 1D751
3pick;RclInVars(nm):
        :: 3PICK SAFE@_HERE ?SEMI                * 193A3
          SETNONEXTERR ;                         * 193B7

* refs (13): 1D134 1D161 1D249 1D26C 1D294 1D2B7 ...
dup;ar?#BAT!:
        :: DUPTYPEARRY? ?SEMI                    * 193C1
          SETTYPEERR ;                           * 193D0

* {%} -> {#}
* refs (8): 1D059 1D116 1D13E 1D16B 1D20D 1DC82 ...
COERCE{}2:
        :: DUPLENCOMP #>2case SETSIZEERR         * 193DA
          TYPEREAL ChkType(li,s) INNER#1= case   * 193EE

r+=>{s}:
          :: COERCE DUP#0=case SETSIZEERR        * 19402
            ONE{}N ;                             * 19416
          COERCE2 OVER#0= OVER#0= ORcase SETSIZEERR * 19420
          TWO{}N ;                               * 19439

dup;li?#BAT!:
        :: DUPTYPELIST? ?SEMI                    * 19443
          SETTYPEERR ;                           * 19452

* refs (2): 193F3 20FFC
ChkType(li,s):
        :: OVER NULLCOMP? caseSIZEERR BINT1      * 1945C
          BEGIN 3PICKOVER NTHELCOMP WHILE        * 19475
          :: TYPE 3PICK #<>case SETTYPEERR       * 19489
            #1+ ;                                * 194A2
          REPEAT 2DROP ;                         * 194AC

* refs (4): 1DD56 2C333 3603E 36048
dup;ra?#BAT!:
        :: DUP TYPERARRY? ?SEMI                  * 194BB
          SETTYPEERR ;                           * 194CF

* refs (4): 1D22B 1D271 1D2BC 360BB
dup;ca?#BAT!:
        :: DUP TYPECARRY? ?SEMI                  * 194D9
          SETTYPEERR ;                           * 194ED

* % %' -> # #'
* refs (16): 19420 1C8C0 1C8D4 200DD 2C7FB 48E41 ...
COERCE2:
        :: COERCESWAP COERCESWAP ;               * 194F7

* # # -> % %
* refs (13): 1954C 1CA6C 1DAD9 24AA6 2EDEB 41E19 ...
UNCOERCE2:
        :: UNCOERCE SWAP UNCOERCE SWAP ;         * 1950B

* {#} -> {%} {# #} -> {% %}
* refs (2): 1CA58 1D0CE
UNCOERCE{}2:
        :: INNER#1= case                         * 19529

s=>{r}:
          :: UNCOERCE ONE{}N ;                   * 19538
          UNCOERCE2 TWO{}N ;                     * 1954C

* refs (8): 1D175 1D2A3 1D2CB 1D381 1D3F6 1D55B ...
sto(nm,_):
        :: SWAP RDROP SAFESTO ;                  * 1955B

* # -> #'
* ROMPTR 002 000 ASR
* refs (1): 189EA
        CON(1)  8                                * 19574  command header: flags (meaning not yet known)
        CON(3)  #002                             * 19575  library
        CON(3)  #000                             * 19578  command
xASR:
        :: CK1&Dispatch                          * 1957B
          BINT11 bitASR                          * 19585  binary
        ;                                        * 1958F

* # -> #'
* ROMPTR 002 001 RL
* refs (1): 189EA
        CON(1)  8                                * 19594  command header: flags (meaning not yet known)
        CON(3)  #002                             * 19595  library
        CON(3)  #001                             * 19598  command
xRL:
        :: CK1&Dispatch                          * 1959B
          BINT11 bitRL                           * 195A5  binary
        ;                                        * 195AF

* # -> #'
* ROMPTR 002 002 RLB
* refs (1): 189EA
        CON(1)  8                                * 195B4  command header: flags (meaning not yet known)
        CON(3)  #002                             * 195B5  library
        CON(3)  #002                             * 195B8  command
xRLB:
        :: CK1&Dispatch                          * 195BB
          BINT11 bitRLB                          * 195C5  binary
        ;                                        * 195CF

* # -> x'
* ROMPTR 002 003 RR
* refs (1): 189EA
        CON(1)  8                                * 195D4  command header: flags (meaning not yet known)
        CON(3)  #002                             * 195D5  library
        CON(3)  #003                             * 195D8  command
xRR:
        :: CK1&Dispatch                          * 195DB
          BINT11 bitRR                           * 195E5  binary
        ;                                        * 195EF
        ASSEMBLE
        HST=0   0                                * 195F4
        SETHEX                                   * 195F7
        RTNSXM                                   * 195F9
        RPL

* # -> x'
* ROMPTR 002 004 RRB
* refs (1): 189EA
xRRB:
        :: CK1&Dispatch                          * 195FB
          BINT11 bitRRB                          * 19605  binary
        ;                                        * 1960F
        ASSEMBLE
        HST=0   0                                * 19614
        SETDEC                                   * 19617
        RTNSXM                                   * 19619
        RPL

* # -> #'
* ROMPTR 002 005 SL
* refs (1): 189EA
xSL:
        :: CK1&Dispatch                          * 1961B
          BINT11 bitSL                           * 19625  binary
        ;                                        * 1962F
        ASSEMBLE
        HST=0   0                                * 19634
        RSTK=C                                   * 19637
        RTNSXM                                   * 19639
        RPL

* # -> #'
* ROMPTR 002 006 SLB
* refs (1): 189EA
xSLB:
        :: CK1&Dispatch                          * 1963B
          BINT11 bitSLB                          * 19645  binary
        ;                                        * 1964F
        ASSEMBLE
        HST=0   0                                * 19654
        C=RSTK                                   * 19657
        RTNSXM                                   * 19659
        RPL

* # -> #'
* ROMPTR 002 007 SR
* refs (1): 189EA
xSR:
        :: CK1&Dispatch                          * 1965B
          BINT11 bitSR                           * 19665  binary
        ;                                        * 1966F
        ASSEMBLE
        HST=0   0                                * 19674
        CLRST                                    * 19677
        RTNSXM                                   * 19679
        RPL

* # -> #'
* ROMPTR 002 008 SRB
* refs (1): 189EA
xSRB:
        :: CK1&Dispatch                          * 1967B
          BINT11 bitSRB                          * 19685  binary
        ;                                        * 1968F
        ASSEMBLE
        HST=0   0                                * 19694
        C=ST                                     * 19697
        RTNSXM                                   * 19699
        RPL

* x -> #
* ROMPTR 002 009 R→B
* refs (1): 189EA
xR>B:
        :: CK1&Dispatch                          * 1969B
          BINT1 %>#                              * 196A5  real
        ;                                        * 196AF
        ASSEMBLE
        HST=0   0                                * 196B4
        ST=C                                     * 196B7
        RTNSXM                                   * 196B9
        RPL

* # -> R
* ROMPTR 002 00A B→R
* refs (1): 189EA
xB>R:
        :: CK1&Dispatch                          * 196BB
          BINT11 #>%                             * 196C5  binary
        ;                                        * 196CF
        ASSEMBLE
        HST=0   0                                * 196D4
        CSTEX                                    * 196D7
        RTNSXM                                   * 196D9
        RPL

* x1_u1 x2_u2 -> x3_u2
* ROMPTR 002 00B CONVERT
* refs (2): 189EA 40319
xCONVERT:
        :: CK2&Dispatch                          * 196DB
          2EXT UMCONV                            * 196E5  unit unit
          BINT30 UMCONV                          * 196EF  real unit
          EXTREAL UMCONV                         * 196F9  unit real
          BINT17 DROP                            * 19703  real real
        ;                                        * 1970D

* slots of 002 00B (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 19712  end of the slots: property byte (meaning not yet known)

* u -> x
* ROMPTR 002 00C UVAL
* refs (2): 189EA 5527E
        CON(1)  0                                * 19714  command header: flags (meaning not yet known)
        CON(3)  #002                             * 19715  library
        CON(3)  #00C                             * 19718  command
xUVAL:
        :: CK1&Dispatch                          * 1971B
          BINT14 CARCOMP                         * 19725  unit
          BINT1 NOP                              * 1972F  real
          BINT10 uval(ex)                        * 19739  name|local|algebraic
        ;                                        * 19743
        ASSEMBLE
        HST=0   0                                * 19748
        P=P-1                                    * 1974B
        RTNSXM                                   * 1974D
        RPL

* x u -> u'
* ROMPTR 002 00D →UNIT
* refs (1): 189EA
x>UNIT:
        :: CK2&Dispatch                          * 1974F
          BINT30 UM>U                            * 19759  real unit
        ;                                        * 19763

* slots of 002 00D (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 19768  end of the slots: property byte (meaning not yet known)

* u -> u'
* ROMPTR 002 00E UBASE
* refs (2): 189EA 55265
        CON(1)  0                                * 1976A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1976B  library
        CON(3)  #00E                             * 1976E  command
xUBASE:
        :: CK1&Dispatch                          * 19771
          BINT14 UMSI                            * 1977B  unit
          BINT1 NOP                              * 19785  real
          BINT10 SYMUBASE                        * 1978F  name|local|algebraic
        ;                                        * 19799

* u1 u2 -> u3
* ROMPTR 002 00F UFACT
* refs (1): 189EA
        CON(1)  8                                * 1979E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1979F  library
        CON(3)  #00F                             * 197A2  command
xUFACT:
        :: CK2&Dispatch                          * 197A5
          2EXT UMFACT                            * 197AF  unit unit
          BINT30 DROP                            * 197B9  real unit
        ;                                        * 197C3

* u1 u2 -> u
* refs (1): 197B4
UMFACT:
        :: UMU> SWAPDROPSWAP OVER UM/ UMSI UM* ; * 197C8

* -> time
* ROMPTR 002 010 TIME
* refs (1): 189EA
        CON(1)  8                                * 197F0  command header: flags (meaning not yet known)
        CON(3)  #002                             * 197F1  library
        CON(3)  #010                             * 197F4  command
xTIME:
        :: CK0 TOD ;                             * 197F7

* -> date
* ROMPTR 002 011 DATE
* refs (1): 189EA
        CON(1)  8                                * 1980B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1980C  library
        CON(3)  #011                             * 1980F  command
xDATE:
        :: CK0 DATE ;                            * 19812

* -> #
* ROMPTR 002 012 TICKS
* refs (1): 189EA
        CON(1)  8                                * 19826  command header: flags (meaning not yet known)
        CON(3)  #002                             * 19827  library
        CON(3)  #012                             * 1982A  command
xTICKS:
        :: CK0 CLKTICKS ;                        * 1982D

* -> $ $ $ $
* ROMPTR 002 013 WSLOG
* refs (1): 189EA
        CON(1)  8                                * 19841  command header: flags (meaning not yet known)
        CON(3)  #002                             * 19842  library
        CON(3)  #013                             * 19845  command
xWSLOG:
        :: CK0 WSLOG ;                           * 19848

* ->
* ROMPTR 002 014 ACKALL
* refs (1): 189EA
        CON(1)  8                                * 1985C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1985D  library
        CON(3)  #014                             * 19860  command
xACKALL:
        :: CK0 ACKALLALMS ;                      * 19863

* ->
* ROMPTR 002 015 ACK
* refs (1): 189EA
        CON(1)  8                                * 19877  command header: flags (meaning not yet known)
        CON(3)  #002                             * 19878  library
        CON(3)  #015                             * 1987B  command
xACK:
        :: CK0 ACKALM DROP ;                     * 1987E

* date ->
* ROMPTR 002 016 →DATE
* refs (1): 189EA
        CON(1)  8                                * 19897  command header: flags (meaning not yet known)
        CON(3)  #002                             * 19898  library
        CON(3)  #016                             * 1989B  command
xSETDATE:
        :: CK1&Dispatch                          * 1989E
          BINT1 >DATE                            * 198A8  real
        ;                                        * 198B2

* time ->
* ROMPTR 002 017 →TIME
* refs (1): 189EA
        CON(1)  8                                * 198B7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 198B8  library
        CON(3)  #017                             * 198BB  command
xSETTIME:
        :: CK1&Dispatch                          * 198BE
          BINT1 >TIME                            * 198C8  real
        ;                                        * 198D2

* ticks ->
* ROMPTR 002 018 CLKADJ
* refs (1): 189EA
        CON(1)  8                                * 198D7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 198D8  library
        CON(3)  #018                             * 198DB  command
xCLKADJ:
        :: CK1&Dispatch                          * 198DE
          BINT1 CLKADJ                           * 198E8  real
        ;                                        * 198F2

* time -> n {date time act rep} -> n
* ROMPTR 002 019 STOALARM
* refs (1): 189EA
        CON(1)  8                                * 198F7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 198F8  library
        CON(3)  #019                             * 198FB  command
xSTOALARM:
        :: CK1&Dispatch                          * 198FE
          BINT1 STOALARM%                        * 19908  real
          BINT5 STOALARMLS                       * 19912  list
        ;                                        * 1991C

* n -> {date time action rep}
* ROMPTR 002 01A RCLALARM
* refs (1): 189EA
        CON(1)  8                                * 19921  command header: flags (meaning not yet known)
        CON(3)  #002                             * 19922  library
        CON(3)  #01A                             * 19925  command
xRCLALARM:
        :: CK1&Dispatch                          * 19928
          BINT1 RCLALARM%                        * 19932  real
        ;                                        * 1993C

* date -> n {date time} -> n 0 -> n
* ROMPTR 002 01B FINDALARM
* refs (1): 189EA
        CON(1)  8                                * 19941  command header: flags (meaning not yet known)
        CON(3)  #002                             * 19942  library
        CON(3)  #01B                             * 19945  command
xFINDALARM:
        :: CK1&Dispatch                          * 19948
          BINT1 FINDALARM%                       * 19952  real
          BINT5 FINDALARMLS                      * 1995C  list
        ;                                        * 19966

* n ->
* ROMPTR 002 01C DELALARM
* refs (1): 189EA
        CON(1)  8                                * 1996B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1996C  library
        CON(3)  #01C                             * 1996F  command
xDELALARM:
        :: CK1&Dispatch                          * 19972
          BINT1 DELALARM                         * 1997C  real
        ;                                        * 19986

* date time -> $
* ROMPTR 002 01D TSTR
* refs (1): 189EA
        CON(1)  8                                * 1998B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1998C  library
        CON(3)  #01D                             * 1998F  command
xTSTR:
        :: CK2&Dispatch                          * 19992
          BINT17 TIMESTR                         * 1999C  real real
        ;                                        * 199A6

* date1 date2 -> days
* ROMPTR 002 01E DDAYS
* refs (1): 189EA
        CON(1)  8                                * 199AB  command header: flags (meaning not yet known)
        CON(3)  #002                             * 199AC  library
        CON(3)  #01E                             * 199AF  command
xDDAYS:
        :: CK2&Dispatch                          * 199B2
          BINT17 DDAYS                           * 199BC  real real
        ;                                        * 199C6

* date ndays -> date'
* ROMPTR 002 01F DATE+
* refs (1): 189EA
        CON(1)  8                                * 199CB  command header: flags (meaning not yet known)
        CON(3)  #002                             * 199CC  library
        CON(3)  #01F                             * 199CF  command
xDATE+:
        :: CK2&Dispatch                          * 199D2
          BINT17 DATE+DAYS                       * 199DC  real real
        ;                                        * 199E6

* l1..ln f1..fm #n #m msg $ -> ob1..obn T -> F\n l = $ #x #y f = msg #x #y #w #h #type legal dec $hlp ChDat ChDec res init
* refs (36): A2631 A2E2F A3AF6 A43B7 A477C A4C91 ...
DoInputForm:
        :: POLSaveUI ERRSET                      * 199EB
          :: TRUE                                * 199FA

{'IF}:
            {                                    * 19A04

Π'IF:
              LAM 'IF }                          * 19A09
            BIND FALSE MINUSONE BINT7 NDUPN DROP BINT11 PICK BINT13 #* * 19A1B
            BINT13 PICK #3* OVER #+ DUP BINT16 #+ ROT BINT16 #+ ROT BINT14 * 19A4D
            #+ XLIB ~nNullBind XLIB IFAllDone XLIB IFGetMenu 8PUTLAM * 19A8E
            MINUSONE 5PUTLAM XLIB IFFirstField# XLIB IFSetField XLIB IFMsg17 * 19AB9
            ' IFDisplay ' IFKey TrueFalse 8GETLAM ONEFALSE ' 11GETLAM ' * 19AE4
            XLIB IFErrHandler POLSetUI IFRedrawAll KEYINBUFFER? NOT DAsBad? * 19B16
            AND IT BlankDA12                     * 19B3A
            POLKeyUI ABND ABND ;                 * 19B49
          ERRTRAP POLResUI&Err POLRestoreUI InitEd&Modes ClrDAsOK ; * 19B5D

* refs (1): 19AE9
* Input form display: redraws what is out of date (title, fields, the edit line, the help line, the menu)
IFDisplay:
        :: DA1OK? ?SKIP XLIB IFDispDA1           * 19B7B
          :: NoEditLine? caseTRUE DA2bOK?        * 19B95
          ;                                      * 19BA9
          ?SKIP DispEditLine                     * 19BAE
          :: EditLExists? caseTRUE DA2bOK?       * 19BB8
          ;                                      * 19BCC
          ?SKIP IFDispEdit                       * 19BD1
          XLIB ~MenuDef@;8GETLAM;EQUAL EditLExists? AND IT * 19BDB
          :: XLIB IFStartEditMenu SetDA3Bad ;    * 19BF5
          DA3OK? ?SKIP                           * 19C0F
          :: ?DispMenu XLIB ~MenuDef@;8GETLAM;EQUAL ?SEMI * 19C19
            EditLExists? ?SEMI                   * 19C33
            DA2bTemp? ?SEMI                      * 19C3D
            IFDispEdit ;                         * 19C47
          :: DA2aOK? DA2aLess1OK? ClrNewEditL OR ; NOT IT XLIB IFDispDA2a * 19C51
          XLIB ~9GETLAM;CARCOMP;NOT IT XLIB IFDispPending * 19C84
          ClrDAsOK EditLExists? ?SEMI            * 19C9F
          SetPrgmEntry ;                         * 19CAE

* refs (2): 19BD6 19C47
* Show the current field or edit its text when no key is waiting
IFDispEdit:
        :: KEYINBUFFER? case SetDA2bBad          * 19CB8
          TOADISP TRUE 5GETLAM XLIB IFDispHelp SetDA2bValid ; * 19CCC

* refs (1): 19AF3
* #key #plane -> ... flag: the form's key handler. The field's message handler goes first, then the plane decides.
IFKey:
        :: 5GETLAM BINT8 IFECallFieldMH ?SEMI    * 19CF0
          BINT1 #=casedrop IFKeyPlane1           * 19D09
          BINT2 #=casedrop XLIB IFKeysLS         * 19D18
          BINT3 #=casedrop XLIB IFKeysRS         * 19D2D
          BINT4 #=casedrop XLIB IFKeysAlpha      * 19D42
          BINT5 #=casedrop XLIB IFKeysLSAlpha    * 19D57
          BINT6 #=casedrop XLIB IFKeysRSAlpha    * 19D6C
        ;                                        * 19D81

* refs (1): 19D13
* #key -> ... flag: unshifted keys. Arrows, OK and CANCEL by table, the rest start editing the field.
IFKeyPlane1:
        ::                                       * 19D86
          { BINT11 XLIB IFUpKey BINT17 XLIB IFDownKey BINT25 XLIB DoKeyOK * 19D8B
            BINT45 XLIB DoKeyCancel }            * 19DC0
          #=Lookup caseTRUE EditExstCase         * 19DD5
          IFKeyPlane1~1                          * 19DE4
          { BINT11 XLIB IFGoAbove BINT17 XLIB IFGoBelow BINT18 * 19DE9
            XLIB IFRightKey BINT16 XLIB IFLeftKey BINT26 XLIB IFPlusMinus * 19E13
            BINT28 XLIB IFKeyRESET BINT29 DoBadKey } * 19E3E
          #=Lookup caseTRUE BINT1                * 19E5D
          OVER BINT7                             * 19E6C
* The Very Big List names this address [liste], but it is a pointer inside an object; the name is not used
          #<case ~Key>StdKeyOb;TRUE              * 19E76
          { BINT12 BINT30 BINT35 BINT40 } 3PICK #=POSCOMP #0<> case * 19E80
          ~Key>StdKeyOb;TRUE                     * 19EB2
          COLA IFKeyOther                        * 19EB7
        ;                                        * 19EC1
        FILLTO  #19EEC                           * 19EC6  38 zero nibbles: the next entry stays at #19EEC

* refs (1): 1B1A8
rpnXROOT~any:
        :: SWAP ' xXROOT COLA EvalNoCK           * 19EEC
        ;                                        * 19F0A

* refs (12): 19F89 1A099 D6FC1 D7115 D71F7 D72A5 ...
* Probably: input forms: key handler that starts editing the current field
OBJ_19F0F:
        :: 5GETLAM BINT18 IFECallFieldMH ?SEMI   * 19F0F
          EditLExists? case2drop FALSE           * 19F28
          5GETLAM XLIB IFAlg? NOT case2drop FALSE * 19F37
          Key>U/SKeyOb 6PUTLAM ' XLIB IFTypeKey TRUE ; * 19F56

* refs (1): 19DE4
IFKeyPlane1~1:
        :: BINT1 COLA OBJ_19F0F                  * 19F7A
        ;                                        * 19F8E

* refs (9): 19E7B 19EB2 D6F52 D6F84 D70A6 D70D8 ...
~Key>StdKeyOb;TRUE:
        :: Key>StdKeyOb TRUE ;                   * 19F93

* refs (14): D529C D5318 D5336 D534F D5403 D544F ...
~13GETLAM;EVAL:
        :: 13GETLAM EVAL ;                       * 19FA7

* refs (42): 19CFF 19F1E D5545 D55B0 D55E3 D5681 ...
* #msg #field -> ... flag: input forms: make #field current and send #msg to its message handler
IFECallFieldMH:
        :: SWAP DUP 4PUTLAM XLIB IFFldMH@ EVAL ; * 19FBB

* refs (16): 19DD5 19E5D B23B2 BAAB0 BAB30 BABA6 ...
* # {#1 ob1 #2 ob2 ...} -> ob TRUE | # FALSE
#=Lookup:
        :: ' #= SWAP Lookup ;                    * 19FE4
