* HP 48GX ROM revision R, #4400C-#46006: Command line editor
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: EDITPARTS InitEd&Modes NoEditLine? CURSOR_END? EditString InitEdLine RowElt# InitEdModes GetElt EDITLINE$ AddInComLine(st) NextChrInComLine
* Follows on from the previous file (at #4400C in the original ROM).
        RPL

* refs (1): 43DFA
\KEEP:
        ::                                       * 4400C
          TakeOver                               * 44011
          DEPTH                                  * 44016
          UNCOERCE                               * 4401B
          CKNNOLASTWD                            * 44020
          DROP                                   * 44025
          3GETLAM                                * 4402A
          DEPTH                                  * 4402F
          #1-                                    * 44034
          OVER#-                                 * 44039
          OVER#2+UNROL                           * 4403E
          psh                                    * 44043
          #1+NDROP                               * 44048
          OBJ_440CF                              * 4404D
          SetDA13NoCh                            * 44052
        ;                                        * 44057

* refs (1): 43DA4
\->LIST:
        ::                                       * 4405C
          OBJ_4409D                              * 44061
          {}N                                    * 44066
          OBJ_440CF                              * 4406B
          SetDA13NoCh                            * 44070
        ;                                        * 44075

* refs (1): 438C9
OBJ_4407A:
        ::                                       * 4407A
          ComLine?:(bip;q)                       * 4407F
          OBJ_4409D                              * 44084
          ROLLDROP                               * 44089
          OBJ_440CF                              * 4408E
          SetDA13NoCh                            * 44093
        ;                                        * 44098

* refs (7): 43F71 43F8A 43FA3 43FDA 43FF3 44061 ...
OBJ_4409D:
        ::                                       * 4409D
          TakeOver                               * 440A2
          3GETLAM                                * 440A7
          UNCOERCE                               * 440AC
          CKNNOLASTWD                            * 440B1
        ;                                        * 440B6

* refs (5): 43F7B 43F94 43FAD 43FCB 43FE4
OBJ_440BB:
        ::                                       * 440BB
          AtUserStack                            * 440C0
          SetDA13NoCh                            * 440C5
        ;                                        * 440CA

* refs (8): 43EF9 43F1C 43F3F 43F62 43FFD 4404D ...
OBJ_440CF:
        ::                                       * 440CF
          AtUserStack                            * 440D4
          DEPTH                                  * 440D9
          BINT0                                  * 440DE
          #=casedrop                             * 440E3
          OBJ_44259                              * 440E8
          DUP                                    * 440ED
          3GETLAM                                * 440F2
          #<ITE                                  * 440F7
          3PUTLAM                                * 440FC
          DROP                                   * 44101
          OBJ_44110                              * 44106
        ;                                        * 4410B

* refs (4): 43C07 43C75 43C9D 44106
OBJ_44110:
        ::                                       * 44110
          OBJ_4417E                              * 44115
          3GETLAM                                * 4411A
          #-                                     * 4411F
          BINT3                                  * 44124
          #MIN                                   * 44129
          #1+                                    * 4412E
          BINT5                                  * 44133
          3GETLAM                                * 44138
          BINT4                                  * 4413D
          #MIN                                   * 44142
          #-                                     * 44147
          2GETLAM                                * 4414C
          ROT                                    * 44151
          #MIN                                   * 44156
          #MAX                                   * 4415B
          2PUTLAM                                * 44160
        ;                                        * 44165

* refs (4): 43806 43A9A 43B67 43E4F
OBJ_4416A:
        ::                                       * 4416A
          4GETLAM                                * 4416F
          #+                                     * 44174
        ;                                        * 44179

* refs (5): 43A04 43A40 43BA8 43C93 44115
OBJ_4417E:
        ::                                       * 4417E
          DEPTH                                  * 44183
          4GETLAM                                * 44188
          #-                                     * 4418D
        ;                                        * 44192

* refs (4): 39C43 4380B 43A9F 43B6C
pick(s)?:
        ::                                       * 44197
          DEPTH                                  * 4419C
          #1-                                    * 441A1
          OVER#<                                 * 441A6
          casedrpfls                             * 441AB
          PICK                                   * 441B0
          TRUE                                   * 441B5
        ;                                        * 441BA

* refs (3): 43829 43AC7 43B94
OBJ_441BF:
        ::                                       * 441BF
          OBJ_44223                              * 441C4
          OBJ_441E7                              * 441C9
        ;                                        * 441CE

* refs (2): 43A54 43B21
OBJ_441D3:
        ::                                       * 441D3
          OBJ_4423E                              * 441D8
          OBJ_441E7                              * 441DD
        ;                                        * 441E2

* refs (2): 441C9 441DD
OBJ_441E7:
        ::                                       * 441E7
          HARDBUFF                               * 441EC
          3GETLAM                                * 441F1
          #>$                                    * 441F6
          LEN$                                   * 441FB
          #6*                                    * 44200
          BINT6                                  * 44205
          2GETLAM                                * 4420A
          #10*                                   * 4420F
          #+                                     * 44214
          GROB!                                  * 44219
        ;                                        * 4421E

* refs (1): 441C4
OBJ_44223:
        ::                                       * 44223

_chr(134)_:
          $       "▶"                            * 44228
          $>BIGGROB                              * 44234
        ;                                        * 44239

* refs (1): 441D8
OBJ_4423E:
        ::                                       * 4423E

_:__44243:
          $       ":"                            * 44243
          $>BIGGROB                              * 4424F
        ;                                        * 44254

* refs (3): 43CDE 43CFC 440E8
OBJ_44259:
        ::                                       * 44259
          TRUE                                   * 4425E
          1PUTLAM                                * 44263
        ;                                        * 44268

* refs (3): 40B79 4261F 426CE
OBJ_4426D:
        #       15                               * 4426D  21

* ->
* refs (17): 17CAB 19B6C 3860B 38845 3B7DB 4096C ...
InitEd&Modes:
        ::                                       * 44277
          InitEdLine                             * 4427C
          InitEdModes                            * 44281
        ;                                        * 44286

* ->
* refs (9): 40AE8 42F6C 43246 4427C D5F60 D62AF ...
InitEdLine:
        ::                                       * 4428B
          OBJ_442A4                              * 44290
          OBJ_4434F                              * 44295
          OBJ_53A66                              * 4429A
        ;                                        * 4429F

* refs (1): 44290
OBJ_442A4:
        CON(5)  (*)+5                            * 442A4  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 442A9
        LC(5)   #00000                           * 442B0
        D0=(5)  CR_COUNT                         * 442B7
        DAT0=C  A                                * 442BE
        D0=(5)  DSKTOP                           * 442C1
        A=DAT0  A                                * 442C8
        B=A     A                                * 442CB
        D1=(5)  TEMPENV                          * 442CD
        A=DAT1  A                                * 442D4
        LC(5)   #00030                           * 442D7
        A=A-C   A                                * 442DE
        D0=(5)  EDITLINE                         * 442E0
        C=DAT0  A                                * 442E7
        DAT0=A  A                                * 442EA
        ?C>A    A                                * 442ED
        GOYES   L_44308                          * 442F0
        D1=A                                     * 442F2
        D0=C                                     * 442F5
        C=C-B   A                                * 442F8
        GOSBVL  MOVEUP                           * 442FA
        AD1EX                                    * 44301
        GOTO    L_44323                          * 44304
L_44308:
        C=C-A   A                                * 44308
        BCEX    A                                * 4430A
        D0=C                                     * 4430C
        C=C-B   A                                * 4430F
        D1=C                                     * 44311
        RSTK=C                                   * 44314
        C=B     A                                * 44316
        GOSBVL  MOVEDOWN                         * 44318
        C=RSTK                                   * 4431F
        A=C     A                                * 44321
L_44323:
        D0=(5)  DSKTOP                           * 44323
        DAT0=A  A                                * 4432A
        D0=(5)  EDITLINE                         * 4432D
        A=DAT0  A                                * 44334
        D1=A                                     * 44337
        LC(5)   #00030                           * 4433A
        GOSBVL  WIPEOUT                          * 44341
        GOVLNG  GETPTRLOOP                       * 44348

* refs (2): 44295 443D5
OBJ_4434F:
        CON(5)  (*)+5                            * 4434F  primitive code object
        AD0EX                                    * 44354
        C=0     A                                * 44357
        D0=(5)  FIRSTCHAR                        * 44359
        DAT0=C  A                                * 44360
        D0=(5)  CURSOR                           * 44363
        DAT0=C  A                                * 4436A
        D0=(5)  CURSOROFFSET                     * 4436D
        DAT0=C  B                                * 44374
        C=C+1   A                                * 44377
        D0=(5)  CURSORPART                       * 44379
        DAT0=C  A                                * 44380
        D0=(5)  TOPLINE                          * 44383
        DAT0=C  A                                * 4438A
        GOVLNG  D0=ALoop                         * 4438D
        RPL

* ->
* refs (8): 1A765 4090E 40B1F 40DB1 431C9 4369E ...
InitEdModes:
        ::                                       * 44394
          OBJ_443A8                              * 44399
          OBJ_40CC3                              * 4439E
        ;                                        * 443A3

* refs (1): 44399
OBJ_443A8:
        ::                                       * 443A8
          ClrAlgEntry                            * 443AD
          ClrPrgmEntry                           * 443B2
          MajusMo                                * 443B7
          UnLockAlpha                            * 443BC
          INSERT_MODE                            * 443C1
        ;                                        * 443C6

* $ ->
* refs (10): 40B60 42F71 43250 8F0F5 D5F6A D62B4 ...
EditString:
        ::                                       * 443CB
          OBJ_42BA2                              * 443D0
          OBJ_4434F                              * 443D5
        ;                                        * 443DA

* refs (6): 3E68E 3E6A2 3F288 4278C 44473 4448C
NextChrInComLine:
        ::                                       * 443DF
          BINT2                                  * 443E4
          ChrInComLine(s)                        * 443E9
        ;                                        * 443EE

* refs (3): 3E643 406A7 40747
PrevChrInComLine:
        ::                                       * 443F3
          BINT0                                  * 443F8
          ChrInComLine(s)                        * 443FD
        ;                                        * 44402

* refs (2): 443E9 443FD
ChrInComLine(s):
        CON(5)  (*)+5                            * 44407  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 4440C
        D0=(5)  TEMPENV                          * 44413
        A=DAT0  A                                * 4441A
        D0=(5)  CURSOR                           * 4441D
        C=DAT0  A                                * 44424
        C=C+C   A                                * 44427
        A=A-C   A                                * 44429
        C=DAT1  A                                * 4442B
        D1=C                                     * 4442E
        D1=D1+  5                                * 44431
        C=DAT1  A                                * 44434
        A=A-C   A                                * 44437
        D1=A                                     * 44439
        C=DAT1  B                                * 4443C
        RSTK=C                                   * 4443F
        LC(5)   #00007                           * 44441
        GOSBVL  GETTEMP                          * 44448
        AD0EX                                    * 4444F
        D0=A                                     * 44452
        LC(5)   DOCHAR                           * 44455
        DAT0=C  A                                * 4445C
        D0=D0+  5                                * 4445F
        C=RSTK                                   * 44462
        DAT0=C  B                                * 44464
        GOVLNG  GPOverWrALp                      * 44467
        RPL

* refs (3): 3E69D 40710 4075B
NextChrInComLine=space?:
        ::                                       * 4446E
          NextChrInComLine                       * 44473
          CHR_Space                              * 44478
          EQUAL                                  * 4447D
        ;                                        * 44482

* refs (2): 43345 444AA
OBJ_44487:
        ::                                       * 44487
          NextChrInComLine                       * 4448C
          DUP                                    * 44491
          CHR_00                                 * 44496
          EQUAL                                  * 4449B
        ;                                        * 444A0

* -> flag
* refs (13): 3B4FF 3B690 3DEF4 3E559 3E6BB 3F27E ...
CURSOR_END?:
        ::                                       * 444A5
          OBJ_44487                              * 444AA
          SWAP                                   * 444AF
          CHR_Newline                            * 444B4
          EQUALOR                                * 444B9
        ;                                        * 444BE

* refs (7): 3EF0A 40E10 42BC5 42CB0 42CD8 42CF1 ...
AddInComLine(st):
        CON(5)  (*)+5                            * 444C3  primitive code object
        ASSEMBLE
        ST=0    1                                * 444C8
        ST=0    10                               * 444CB
L_444CE:
        GOSBVL  SAVPTR                           * 444CE
        A=DAT1  A                                * 444D5
        D1=A                                     * 444D8
        D1=D1+  5                                * 444DB
        A=DAT1  A                                * 444DE
        LC(5)   #00005                           * 444E1
        A=A-C   A                                * 444E8
        GOTO    L_4450F                          * 444EA

* refs (3): 4076F 42B11 42D19
Char>Edit:
        CON(5)  (*)+5                            * 444EE  primitive code object
        ST=1    1                                * 444F3
        ST=0    10                               * 444F6
L_444F9:
        GOSBVL  SAVPTR                           * 444F9
        A=DAT1  A                                * 44500
        D1=A                                     * 44503
        LC(5)   #00002                           * 44506
        A=C     A                                * 4450D
L_4450F:
        D1=D1+  5                                * 4450F
        B=A     A                                * 44512
        GOSBVL  ROOM                             * 44514
        ?B<C    A                                * 4451B
        GOYES   L_4452F                          * 4451E
        GOSBVL  SUB_12D68                        * 44520
        ?ST=0   1                                * 44527
        GOYES   L_444CE                          * 4452A
        GONC    L_444F9                          * 4452C
L_4452F:
        BSRB.F  A                                * 4452F
        C=B     A                                * 44534
        D=C     A                                * 44536
        D0=(5)  CURSOR                           * 44538
        A=DAT0  A                                * 4453F
        ST=0    2                                * 44542
        LC(5)   #00016                           * 44545
        ?C<A    A                                * 4454C
        GOYES   L_44554                          * 4454F
        ST=1    2                                * 44551
L_44554:
        C=A     A                                * 44554
        A=A+B   A                                * 44556
        DAT0=A  A                                * 44558
        D0=(5)  TEMPENV                          * 4455B
        A=DAT0  A                                * 44562
        C=C+C   A                                * 44565
        C=A-C   A                                * 44567
        D0=C                                     * 44569
        D0=D0-  2                                * 4456C
        LC(3)   #203                             * 4456F
        GOSBVL  L_53AF2                          * 44574
        GOC     L_44590                          * 4457B
        LC(2)   #0A                              * 4457E
L_44582:
        GOSUB   SUB_44616                        * 44582
        GOC     L_44590                          * 44586
        GOSUB   SUB_44603                        * 44589
        GONC    L_44582                          * 4458D
L_44590:
        ?ST=0   1                                * 44590
        GOYES   L_445A9                          * 44593
        ?ST=0   2                                * 44595
        GOYES   L_445A9                          * 44598
        A=DAT0  B                                * 4459A
        ?A#0    B                                * 4459D
        GOYES   L_445A9                          * 445A0
        GOSUB   SUB_44603                        * 445A2
        GONC    L_44625                          * 445A6
L_445A9:
        A=B     A                                * 445A9
        A=A+A   A                                * 445AB
        CD1EX                                    * 445AD
        RSTK=C                                   * 445B0
        D1=(5)  EDITLINE                         * 445B2
        C=DAT1  A                                * 445B9
        C=C-A   A                                * 445BC
        DAT1=C  A                                * 445BE
        CD0EX                                    * 445C1
        RSTK=C                                   * 445C4
        D1=(5)  DSKTOP                           * 445C6
        C=DAT1  A                                * 445CD
        RSTK=C                                   * 445D0
        D0=C                                     * 445D2
        C=C-A   A                                * 445D5
        DAT1=C  A                                * 445D7
        D1=C                                     * 445DA
        C=RSTK                                   * 445DD
        A=C     A                                * 445DF
        C=RSTK                                   * 445E1
        RSTK=C                                   * 445E3
        C=C+1   A                                * 445E5
        C=C+1   A                                * 445E7
        C=C-A   A                                * 445E9
        GOSBVL  MOVEDOWN                         * 445EB
        C=RSTK                                   * 445F2
        CD0EX                                    * 445F4
        C=RSTK                                   * 445F7
        CD1EX                                    * 445F9
L_445FC:
        GOSUB   SUB_44603                        * 445FC
        GONC    L_445FC                          * 44600

* refs (3): 44589 445A2 445FC
SUB_44603:
        B=B-1   A                                * 44603
        GOC     L_44625                          * 44605
        A=DAT1  B                                * 44608
        D1=D1+  2                                * 4460B
        DAT0=A  B                                * 4460E
        D0=D0-  2                                * 44611
        RTN                                      * 44614

* refs (2): 44582 44631
SUB_44616:
        A=DAT0  B                                * 44616
        ?C=A    B                                * 44619
        RTNYES                                   * 4461C
        ?A=0    B                                * 4461E
        RTNYES                                   * 44621
        RTN                                      * 44623
L_44625:
        C=0     A                                * 44625
        LC(2)   #15                              * 44627
        B=C     A                                * 4462B
        LC(2)   #0A                              * 4462D
        GOSUB   SUB_44616                        * 44631
        GOC     L_4463A                          * 44635
        B=B-1   A                                * 44638
L_4463A:
        D0=(5)  CURSOROFFSET                     * 4463A
        C=0     A                                * 44641
        C=DAT0  B                                * 44643
        C=C+D   A                                * 44646
        ?B>=C   A                                * 44648
        GOYES   L_44666                          * 4464B
        A=B     A                                * 4464D
        DAT0=A  B                                * 4464F
        C=C-A   A                                * 44652
        D0=(5)  FIRSTCHAR                        * 44654
        A=DAT0  A                                * 4465B
        A=A+C   A                                * 4465E
        DAT0=A  A                                * 44660
        GONC    L_44669                          * 44663
L_44666:
        DAT0=C  B                                * 44666
L_44669:
        LC(3)   #10A                             * 44669
        GOSBVL  setflag                          * 4466E
        GOSBVL  ADJMEM                           * 44675
        GOVLNG  L_30DB4                          * 4467C

* -> $
* refs (7): 38836 3A03F 4095D 40ADE 43183 D73CC ...
EDITLINE$:
        CON(5)  (*)+5                            * 44683  primitive code object
        GOSBVL  SAVPTR                           * 44688
L_4468F:
        GOSUB   SUB_446E7                        * 4468F
        R1=A                                     * 44693
        R2=C                                     * 44696
        GOSBVL  MAKE$N                           * 44699
        C=R1                                     * 446A0
        D1=C                                     * 446A3
        A=R2                                     * 446A6
        ASRB.F  A                                * 446A9
        GOTO    L_446BB                          * 446AE
L_446B2:
        C=DAT1  B                                * 446B2
        DAT0=C  B                                * 446B5
        D0=D0+  2                                * 446B8
L_446BB:
        D1=D1-  2                                * 446BB
        A=A-1   A                                * 446BE
        GONC    L_446B2                          * 446C0
        GOSBVL  GETPTR                           * 446C3
        D=D-1   A                                * 446CA
        GOC     L_446DC                          * 446CC
        D1=D1-  5                                * 446CF
        A=R0                                     * 446D2
        GOVLNG  L_03678                          * 446D5
L_446DC:
        GOSBVL  SUB_12D68                        * 446DC
        GOTO    L_4468F                          * 446E3

* refs (2): 4468F 4471D
SUB_446E7:
        D0=(5)  TEMPENV                          * 446E7
        A=DAT0  A                                * 446EE
        D0=A                                     * 446F1
L_446F4:
        D0=D0-  2                                * 446F4
        C=DAT0  B                                * 446F7
        ?C#0    B                                * 446FA
        GOYES   L_446F4                          * 446FD
        D0=D0+  2                                * 446FF
        LC(6)   #000000                          * 44702
        CD0EX                                    * 4470A
        C=A-C   A                                * 4470D
        RTN                                      * 4470F

* refs (1): 4252F
SizeOfComLine:
        CON(5)  (*)+5                            * 44711  primitive code object
        GOSBVL  SAVPTR                           * 44716
        GOSUB   SUB_446E7                        * 4471D
        CSRB.F  A                                * 44721
        R0=C                                     * 44726
L_44729:
        GOVLNG  PUSH#LOOP                        * 44729

* refs (25): 3A058 3A5A0 3B373 3B4A0 3E40C 3E4F5 ...
EDITPARTS:
        CON(5)  (*)+5                            * 44730  primitive code object
        GOSBVL  SAVPTR                           * 44735
        GOSUB   SUB_44747                        * 4473C
        R0=A                                     * 44740
        GOTO    L_44729                          * 44743

* refs (2): 39F93 4473C
SUB_44747:
        D0=(5)  SysNib10                         * 44747
        A=0     A                                * 4474E
        A=DAT0  1                                * 44750
        LC(1)   #1                               * 44754
        A=A&C   B                                * 44757
        ?A=0    B                                * 4475B
        RTNYES                                   * 4475E
        GOSUB   SUB_44772                        * 44760
        D0=(5)  CR_COUNT                         * 44764
        A=DAT0  A                                * 4476B
        A=A+1   A                                * 4476E
        RTN                                      * 44770

* refs (3): 42AA9 44760 44794
SUB_44772:
        D0=(5)  TEMPENV                          * 44772
        C=DAT0  A                                * 44779
        C=C-1   A                                * 4477C
        C=C-1   A                                * 4477E
        D0=C                                     * 44780
        A=0     A                                * 44783
        A=DAT0  B                                * 44785
        RTN                                      * 44788

* refs (1): 43214
OBJ_4478A:
        CON(5)  (*)+5                            * 4478A  primitive code object
        CD0EX                                    * 4478F
        RSTK=C                                   * 44792
        GOSUB   SUB_44772                        * 44794
        C=RSTK                                   * 44798
        D0=C                                     * 4479A
        ?A=0    B                                * 4479D
        GOYES   L_447A2                          * 447A0
L_447A2:
        GOVLNG  PushT/FLoop                      * 447A2

* refs (1): 44842
SUB_447A9:
        GOSBVL  SAVPTR                           * 447A9
        B=A     A                                * 447B0
        D0=(5)  TEMPENV                          * 447B2
        A=DAT0  A                                * 447B9
        D0=A                                     * 447BC
        B=B-1   A                                * 447BF
        B=B-1   A                                * 447C1
        GOC     L_447DA                          * 447C3
        LC(2)   #0A                              * 447C6
L_447CA:
        D0=D0-  2                                * 447CA
        A=DAT0  B                                * 447CD
        ?C#A    B                                * 447D0
        GOYES   L_447CA                          * 447D3
        B=B-1   A                                * 447D5
        GONC    L_447CA                          * 447D7
L_447DA:
        CD0EX                                    * 447DA
        RSTK=C                                   * 447DD
        D0=C                                     * 447DF
        LC(2)   #0A                              * 447E2
L_447E6:
        D0=D0-  2                                * 447E6
        A=DAT0  B                                * 447E9
        ?A=0    B                                * 447EC
        GOYES   L_447F6                          * 447EF
        ?C#A    B                                * 447F1
        GOYES   L_447E6                          * 447F4
L_447F6:
        C=0     W                                * 447F6
        C=RSTK                                   * 447F9
        B=C     A                                * 447FB
        D0=D0+  2                                * 447FD
        AD0EX                                    * 44800
        C=C-A   A                                * 44803
        D0=(5)  FIRSTCHAR                        * 44805
        A=DAT0  A                                * 4480C
        A=A+A   A                                * 4480F
        ST=0    2                                * 44811
        ?C<=A   A                                * 44814
        GOYES   L_44824                          * 44817
        C=C-A   A                                * 44819
        B=B-A   A                                * 4481B
        A=B     A                                * 4481D
        R0=A                                     * 4481F
        RTN                                      * 44822
L_44824:
        A=C     A                                * 44824
        C=0     A                                * 44826
        ST=1    2                                * 44828
        RTN                                      * 4482B

* refs (5): 424F3 42511 42534 42683 426B0
OBJ_4482D:
        CON(5)  (*)+5                            * 4482D  primitive code object
        LC(5)   CURSORPART                       * 44832
        CD0EX                                    * 44839
        A=DAT0  A                                * 4483C
        D0=C                                     * 4483F
        GOSUB   SUB_447A9                        * 44842
        CSRB.F  A                                * 44846
        ?ST=0   2                                * 4484B
        GOYES   L_4485A                          * 4484E
        DAT0=C  A                                * 44850
        C=A     A                                * 44853
        CSRB.F  A                                * 44855
L_4485A:
        R0=C                                     * 4485A
        D0=(5)  CURSOROFFSET                     * 4485D
        A=0     A                                * 44864
        A=DAT0  B                                * 44866
        R1=A                                     * 44869
        ST=0    1                                * 4486C
        ?C>A    A                                * 4486F
        GOYES   L_44877                          * 44872
        ST=1    1                                * 44874
L_44877:
        GOSBVL  PUSH2#                           * 44877
        ?ST=0   1                                * 4487E
        GOYES   L_44883                          * 44881
L_44883:
        GOVLNG  PushT/FLoop                      * 44883
        RPL

* -> flag
* refs (13): 17C8D 19B9A 3908B 3A035 3DE6D 3F26F ...
NoEditLine?:
        ::                                       * 4488A
          EditLExists?                           * 4488F
          NOT                                    * 44894
        ;                                        * 44899

* refs (3): 40B83 42971 42B48
ROWNUM:
        ::                                       * 4489E
          LINESOFSTACK                           * 448A3
          CurrentRow                             * 448A8
          OBJ_113F2                              * 448AD
          #1--                                   * 448B2
          #+                                     * 448B7
        ;                                        * 448BC

* chr -> chr'
* refs (2): 42AF3 6BE84
?TogU/LCase:
        ::                                       * 448C1
          MinusMo                                * 448C6
          NOT?SEMI                               * 448CB
          DUP                                    * 448D0
          CHR>#                                  * 448D5
          BINT65                                 * 448DA
          OVER#>                                 * 448DF
          caseDROP                               * 448E4
          BINT122                                * 448E9
          OVER#<                                 * 448EE
          caseDROP                               * 448F3
          BINT91                                 * 448F8
          OVER#>                                 * 448FD
          OVER                                   * 44902
          BINT96                                 * 44907
          #>                                     * 4490C
          OVER                                   * 44911
          OR                                     * 44916
          NOTcase2DROP                           * 4491B
          ROTDROP                                * 44920
          BINT32                                 * 44925
          SWAP                                   * 4492A
          ITE                                    * 4492F
          #+                                     * 44934
          #-                                     * 44939
          #>CHR                                  * 4493E
        ;                                        * 44943

* refs (1): 8D363
OBJ_44948:
        ::                                       * 44948
          BINT1                                  * 4494D
          #=casedrop                             * 44952
          OBJ_44999                              * 44957
          BINT2                                  * 4495C
          #=casedrop                             * 44961
          OBJ_44AAC                              * 44966
          BINT3                                  * 4496B
          #=casedrop                             * 44970
          OBJ_44AD0                              * 44975
          BINT4                                  * 4497A
          #=casedrop                             * 4497F
          ROMPTR  0EA 007                        * 44984
          2DROPFALSE                             * 4498F
        ;                                        * 44994

* refs (1): 44957
OBJ_44999:
        ::                                       * 44999
          EditExstCase                           * 4499E
          ::                                     * 449A3
            BINT25                               * 449A8
            ?CaseKeyDef                          * 449AD
            ROMPTR  0EA 028                      * 449B2
            BINT45                               * 449BD
            ?CaseKeyDef                          * 449C2
            ROMPTR  0EA 000                      * 449C7
            BINT13                               * 449D2
            ?CaseKeyDef                          * 449D7
            ROMPTR  0EA 063                      * 449DC
            DROPFALSE                            * 449E7
          ;                                      * 449EC
          BINT11                                 * 449F1
          ?CaseKeyDef                            * 449F6
          ROMPTR  0EA 055                        * 449FB
          BINT16                                 * 44A06
          ?CaseKeyDef                            * 44A0B
          ROMPTR  0EA 037                        * 44A10
          BINT17                                 * 44A1B
          ?CaseKeyDef                            * 44A20
          ROMPTR  0EA 026                        * 44A25
          BINT18                                 * 44A30
          ?CaseKeyDef                            * 44A35
          ROMPTR  0EA 01D                        * 44A3A
          BINT25                                 * 44A45
          ?CaseKeyDef                            * 44A4A
          ROMPTR  0EA 033                        * 44A4F
          BINT29                                 * 44A5A
          ?CaseKeyDef                            * 44A5F
          DoBadKey                               * 44A64
          BINT45                                 * 44A69
          ?CaseKeyDef                            * 44A6E
          ROMPTR  0EA 002                        * 44A73
          BINT13                                 * 44A7E
          ?CaseKeyDef                            * 44A83
          ROMPTR  0EA 063                        * 44A88
          BINT26                                 * 44A93
          ?CaseKeyDef                            * 44A98
          DoBadKey                               * 44A9D
          DROPFALSE                              * 44AA2
        ;                                        * 44AA7

* refs (1): 44966
OBJ_44AAC:
        ::                                       * 44AAC
          BINT26                                 * 44AB1
          ?CaseKeyDef                            * 44AB6
          ROMPTR  0EA 066                        * 44ABB
          DROPFALSE                              * 44AC6
        ;                                        * 44ACB

* refs (1): 44975
OBJ_44AD0:
        ::                                       * 44AD0
          EditExstCase                           * 44AD5
          ::                                     * 44ADA
            BINT25                               * 44ADF
            ?CaseKeyDef                          * 44AE4
            ROMPTR  0EA 065                      * 44AE9
            BINT39                               * 44AF4
            ?CaseKeyDef                          * 44AF9
            ROMPTR  0EA 064                      * 44AFE
            OBJ_463B4                            * 44B09
          ;                                      * 44B0E
          BINT11                                 * 44B13
          ?CaseKeyDef                            * 44B18
          ROMPTR  0EA 019                        * 44B1D
          BINT16                                 * 44B28
          ?CaseKeyDef                            * 44B2D
          ROMPTR  0EA 01B                        * 44B32
          BINT17                                 * 44B3D
          ?CaseKeyDef                            * 44B42
          ROMPTR  0EA 01A                        * 44B47
          BINT18                                 * 44B52
          ?CaseKeyDef                            * 44B57
          ROMPTR  0EA 01C                        * 44B5C
          BINT25                                 * 44B67
          ?CaseKeyDef                            * 44B6C
          ROMPTR  0EA 065                        * 44B71
          BINT39                                 * 44B7C
          ?CaseKeyDef                            * 44B81
          ROMPTR  0EA 064                        * 44B86
          OBJ_463B4                              * 44B91
        ;                                        * 44B96

* refs (7): 8DA69 8DB7F 8DF3D 8E730 8ED7A 8F1D1 ...
OBJ_44B9B:
        CON(5)  (*)+5                            * 44B9B  primitive code object
        ASSEMBLE
        LC(5)   COLWIDTH                         * 44BA0
        GOTO    L_44BF9                          * 44BA7

* refs (3): 8ED8E 8F218 8F560
OBJ_44BAB:
        CON(5)  (*)+5                            * 44BAB  primitive code object
        LC(5)   COLWIDTH                         * 44BB0
        GOTO    L_44BDB                          * 44BB7

* refs (12): 8E28B 8E314 8E681 8E6A9 8E77B 8E790 ...
OBJ_44BBB:
        CON(5)  (*)+5                            * 44BBB  primitive code object
        LC(5)   ENTRWISE                         * 44BC0
        GOTO    L_44BF9                          * 44BC7

* refs (2): 8EC7D 8ECB5
OBJ_44BCB:
        CON(5)  (*)+5                            * 44BCB  primitive code object
        LC(5)   ENTRWISE                         * 44BD0
        NOP4                                     * 44BD7
L_44BDB:
        RSTK=C                                   * 44BDB
        GOSBVL  POP#                             * 44BDD
        C=RSTK                                   * 44BE4
        CD1EX                                    * 44BE6
        DAT1=A  B                                * 44BE9
        D1=C                                     * 44BEC
        A=DAT0  A                                * 44BEF
        D0=D0+  5                                * 44BF2
        PC=(A)                                   * 44BF5
L_44BF9:
        CD1EX                                    * 44BF9
        A=0     A                                * 44BFC
        A=DAT1  B                                * 44BFE
        D1=C                                     * 44C01
        GOVLNG  L_67907                          * 44C04
        FILLTO  #44C31                           * 44C0B  38 zero nibbles: the next entry stays at #44C31
        RPL

* -> []/[[]]
* refs (3): 3DF63 B4DA0 D75DD
DoNewMatrix:
        ROMPTR  0EA 006                          * 44C31

* refs (2): 683FD 6AAC8
OBJ_44C3C:
        ::                                       * 44C3C
          OBJ_44C8C                              * 44C41
          #2+                                    * 44C46

* refs (2): 4B909 6D05A
OBJ_44C4B:
          ::                                     * 44C4B
            OBJ_6FDC6                            * 44C50
            OBJ_66F91                            * 44C55
            BINT6                                * 44C5A
            MAKEGROB                             * 44C5F
            OBJ_671BF                            * 44C64
          ;                                      * 44C69
          OBJ_44DB3                              * 44C6E
          OBJ_67AE2                              * 44C73
          #1+                                    * 44C78
          OBJ_67C16                              * 44C7D
        ;                                        * 44C82

* refs (1): 68411
OBJ_44C87:
        ::                                       * 44C87

* refs (2): 44C41 44CCD
OBJ_44C8C:
          ::                                     * 44C8C
            OBJ_67987                            * 44C91
            OBJ_67AAA                            * 44C96
          ;                                      * 44C9B

* refs (1): 65ABF
OBJ_44CA0:
          ::                                     * 44CA0
            BINT6                                * 44CA5
            MAKEGROB                             * 44CAA
            OBJ_670EE                            * 44CAF
          ;                                      * 44CB4
          GOTO                                   * 44CB9
          L_44CEB                                * 44CBE
        ;                                        * 44CC3

* refs (1): 68416
OBJ_44CC8:
        ::                                       * 44CC8
          OBJ_44C8C                              * 44CCD

* refs (2): 666BF 6D792
OBJ_44CD2:
          ::                                     * 44CD2
            BINT4                                * 44CD7
            MAKEGROB                             * 44CDC
            OBJ_6715D                            * 44CE1
          ;                                      * 44CE6
L_44CEB:
          OBJ_44DB3                              * 44CEB
          OBJ_44D9A                              * 44CF0
        ;                                        * 44CF5

* refs (1): 68407
OBJ_44CFA:
        ::                                       * 44CFA
          OBJ_67987                              * 44CFF
          DUP#0=                                 * 44D04
          ?SKIP                                  * 44D09
          OBJ_67A9D                              * 44D0E
          3PICK                                  * 44D13
          OBJ_679B3                              * 44D18
          OBJ_67A9D                              * 44D1D
          #MAX                                   * 44D22
L_44D27:
          #2+                                    * 44D27
          DUP                                    * 44D2C
          OBJ_66FF1                              * 44D31
          OBJ_44DB3                              * 44D36
          #2/                                    * 44D3B
          OBJ_67C09                              * 44D40
        ;                                        * 44D45

* refs (1): 6840C
OBJ_44D4A:
        ::                                       * 44D4A
          OBJ_67987                              * 44D4F
          OBJ_67A9D                              * 44D54
          GOTO                                   * 44D59
          L_44D27                                * 44D5E
        ;                                        * 44D63

* refs (1): 68420
OBJ_44D68:
        ::                                       * 44D68
          OVER                                   * 44D6D
          OBJ_679C5                              * 44D72
          OBJ_67AAA                              * 44D77

* refs (1): 6DB8E
OBJ_44D7C:
          ::                                     * 44D7C
            BINT2                                * 44D81
            MAKEGROB                             * 44D86
            OBJ_67193                            * 44D8B
          ;                                      * 44D90
          OBJ_44DB3                              * 44D95

* refs (4): 44CF0 666C9 6D325 6DB57
OBJ_44D9A:
          ::                                     * 44D9A
            OBJ_67AE2                            * 44D9F
            OBJ_67C16                            * 44DA4
          ;                                      * 44DA9
        ;                                        * 44DAE

* refs (5): 44C6E 44CEB 44D36 44D95 666C4
OBJ_44DB3:
        ::                                       * 44DB3
          3PICKSWAP                              * 44DB8
          OVERDUP                                * 44DBD
          OBJ_67AEF                              * 44DC2
          2DUP#+                                 * 44DC7
          #0=ITE                                 * 44DCC
          3DROP                                  * 44DD1

* refs (1): 66E75
OBJ_44DD6:
          ::                                     * 44DD6
            OBJ_6AD1B                            * 44DDB
            GROB!ZERO                            * 44DE0
            3DROP                                * 44DE5
          ;                                      * 44DEA
          DUPZERO                                * 44DEF
          OBJ_66D26                              * 44DF4
          SWAP                                   * 44DF9

* refs (8): 65D91 65ED6 661CE 69A22 6D203 6E145 ...
OBJ_44DFE:
          ::                                     * 44DFE
            OBJ_6CF3D                            * 44E03
            OBJ_6C873                            * 44E08
            6PICK                                * 44E0D
            3UNROLL                              * 44E12
            OBJ_67C23                            * 44E17
            4PICK                                * 44E1C
            3UNROLL                              * 44E21
            OBJ_6CE8E                            * 44E26
            OBJ_68245                            * 44E2B
          ;                                      * 44E30
          SWAP                                   * 44E35
        ;                                        * 44E3A

* refs (2): 6D1FE 6FAF5
OBJ_44E3F:
        CON(5)  DOGROB                           * 44E3F  DOGROB
        LENGTH                                   * 44E44  length, to #44E53
        BSS     10                               * 44E49
        ENDLENGTH                                * 44E53
        FILLTO  #44F42                           * 44E53  239 zero nibbles: the next entry stays at #44F42

* refs (1): 8D344
BindMatVars:
        ROMPTR  0EA 00D                          * 44F42

* refs (1): 5711C
OBJ_44F4D:
        ::                                       * 44F4D
          OBJ_57216                              * 44F52
          FALSE                                  * 44F57
          ROMPTR  0F1 00E                        * 44F5C
        ;                                        * 44F67

* refs (1): 5713F
OBJ_44F6C:
        ::                                       * 44F6C
          ROMPTR  0F1 011                        * 44F71
          DOSTOE                                 * 44F7C
          OBJ_57216                              * 44F81
          TRUE                                   * 44F86
          ROMPTR  0F1 00E                        * 44F8B
        ;                                        * 44F96

* refs (1): 45C4E
OBJ_44F9B:
        ::                                       * 44F9B
          ROMPTR  0F1 01A                        * 44FA0

* refs (1): 458DF
OBJ_44FAB:
          ::                                     * 44FAB
            ROMPTR  0F1 003                      * 44FB0
            BIND                                 * 44FBB
            ROMPTR  0F1 01C                      * 44FC0
            ROMPTR  0F1 01D                      * 44FCB
          ;                                      * 44FD6
        ;                                        * 44FDB
        BSS     7                                * 44FE0

* [] -> []'
* refs (2): 42DEB B4D9B
DoOldMatrix:
        ROMPTR  0EA 00F                          * 44FE7

* refs (2): C0602 C06F6
OBJ_44FF2:
        ::                                       * 44FF2
          OBJ_459E8                              * 44FF7
          OBJ_45A63                              * 44FFC
        ;                                        * 45001

* refs (1): C0326
OBJ_45006:
        ::                                       * 45006
          OBJ_459E8                              * 4500B
          OBJ_45A25                              * 45010
        ;                                        * 45015
        BSS     9                                * 4501A

* refs (1): 8D84E
InitOldMat:
        ROMPTR  0EA 010                          * 45023

* refs (4): 4B053 B6026 B60B2 B6286
OBJ_4502E:
        ::                                       * 4502E
          INNERCOMP                              * 45033
          ::                                     * 45038
            BINT1                                * 4503D
            #=casedrop                           * 45042
            ::                                   * 45047
              DUPTYPECMP?                        * 4504C
              case                               * 45051
              ::                                 * 45056
                BINT5                            * 4505B
                PPAR(s);dup;li?                  * 45060
                NOTcaseDROP                      * 45065
                CDRCOMP                          * 4506A
                SWAP                             * 4506F
                >HCOMP                           * 45074
              ;                                  * 45079
              DUP                                * 4507E
              OBJ_4C64D                          * 45083
              NcaseTYPEERR                       * 45088
              BINT5                              * 4508D
              PPAR(s);dup;li?                    * 45092
              NOTcase                            * 45097
              ::                                 * 4509C
                SWAP                             * 450A1
                TWO{}N                           * 450A6
              ;                                  * 450AB
              ZEROSWAP                           * 450B0
              INNERCOMP                          * 450B5
              DUP                                * 450BA
              ZERO_DO                            * 450BF
              ::                                 * 450C4
                #1-SWAP                          * 450C9
                DUPTYPECMP?                      * 450CE
                case                             * 450D3
                psh1&rev                         * 450D8
                DUPTYPECSTR?                     * 450DD
                case                             * 450E2
                psh1&rev                         * 450E7
                DROP                             * 450EC
              ;                                  * 450F1
              LOOP                               * 450F6
              DROP                               * 450FB
              DUP                                * 45100
              #2+                                * 45105
              ROLL                               * 4510A
              3UNROLL                            * 4510F
              #1+                                * 45114
              reversym                           * 45119
              {}N                                * 4511E
            ;                                    * 45123
            BINT2                                * 45128
            #=casedrop                           * 4512D
            OBJ_46527                            * 45132
            BINT3                                * 45137
            #=casedrop                           * 4513C
            ::                                   * 45141
              DUPTYPECSTR?                       * 45146
              NcaseTYPEERR                       * 4514B
              OVER                               * 45150
              TYPECSTR?                          * 45155
              NcaseTYPEERR                       * 4515A
              3PICK                              * 4515F
              TYPECMP?                           * 45164
              NcaseTYPEERR                       * 45169
              BINT3                              * 4516E
              {}N                                * 45173
            ;                                    * 45178
            BINT4                                * 4517D
            #=                                   * 45182
            NcaseTYPEERR                         * 45187
            DUPTYPECSTR?                         * 4518C
            NcaseTYPEERR                         * 45191
            OVER                                 * 45196
            TYPECSTR?                            * 4519B
            NcaseTYPEERR                         * 451A0
            3PICK                                * 451A5
            OBJ_4C64D                            * 451AA
            NcaseTYPEERR                         * 451AF
            4PICK                                * 451B4
            TYPECMP?                             * 451B9
            NcaseTYPEERR                         * 451BE
            BINT4                                * 451C3
            {}N                                  * 451C8
          ;                                      * 451CD
          BINT3                                  * 451D2
          PutBackPPAR(_,s)                       * 451D7
        ;                                        * 451DC

* refs (1): 4C643
OBJ_451E1:
        ::                                       * 451E1
          2DUP                                   * 451E6
          5PICK                                  * 451EB
          DUPTYPELIST?                           * 451F0
          IT                                     * 451F5
          CARCOMP                                * 451FA
          C%>%                                   * 451FF
          DUP                                    * 45204
          8UNROLL                                * 45209
          OVER                                   * 4520E
          9rolld                                 * 45213
          OBJ_4FE08                              * 45218
          DUP                                    * 4521D
          %0>=                                   * 45222
          OVER                                   * 45227
          6PICK                                  * 4522C
          #1-                                    * 45231
          UNCOERCE                               * 45236
          %<=                                    * 4523B
          AND                                    * 45240
          IT                                     * 45245
          ::                                     * 4524A
            SWAP                                 * 4524F
            4UNROLLDUP                           * 45254
            COERCE                               * 45259
            BINT0                                * 4525E
            OVER5PICK                            * 45263
            #1-                                  * 45268
            OVER                                 * 4526D
            DRAWLINE#3                           * 45272
            6PICK                                * 45277
            OBJ_46789                            * 4527C
            DROP                                 * 45281
            DUPTYPEREAL?                         * 45286
            ITE                                  * 4528B
            ::                                   * 45290
              DUP%0=                             * 45295
              case2drop                          * 4529A
              4ROLLSWAP                          * 4529F
              6ROLL                              * 452A4
              4UNROLL                            * 452A9
              DUP                                * 452AE
              %>%%                               * 452B3
              10GETLAM                           * 452B8
              %%*                                * 452BD
              BINT10                             * 452C2
              PICK                               * 452C7
              GETXMIN                            * 452CC
              %-                                 * 452D1
              ROT                                * 452D6
              %MOD                               * 452DB
              GETXMIN                            * 452E0
              %+                                 * 452E5
              %>%%                               * 452EA
              10GETLAM                           * 452EF
              %%*                                * 452F4
              6GETLAM                            * 452F9
              %%+                                * 452FE
              GETXMAX                            * 45303
              %>%%                               * 45308
              10GETLAM                           * 4530D
              %%*                                * 45312
              6GETLAM                            * 45317
              %%+                                * 4531C
              SWAP                               * 45321
              BEGIN                              * 45326
              2DUP                               * 4532B
              %%>=                               * 45330
              OBJ_45641                          * 45335
              WHILE                              * 4533A
              ::                                 * 4533F
                8PICK                            * 45344
                OVER                             * 45349
                %%>%                             * 4534E
                #       2A01                     * 45353  10753
                OBJ_2B551                        * 4535D
                COERCE                           * 45362
                6PICK                            * 45367
                OBJ_4C742                        * 4536C
                3PICK                            * 45371
                %%+                              * 45376
              ;                                  * 4537B
              REPEAT                             * 45380
              4DROP                              * 45385
            ;                                    * 4538A
            ::                                   * 4538F
              DUP#0=                             * 45394
              case2drop                          * 45399
              4ROLLSWAP                          * 4539E
              4PICK                              * 453A3
              2DUP                               * 453A8
              #>                                 * 453AD
              case                               * 453B2
              ::                                 * 453B7
                3DROP                            * 453BC
                4ROLLSWAP                        * 453C1
              ;                                  * 453C6
              7PICK                              * 453CB
              DUP                                * 453D0
              %0<                                * 453D5
              DUPUNROT                           * 453DA
              IT                                 * 453DF
              %CHS                               * 453E4
              COERCE                             * 453E9
              4PICK                              * 453EE
              #/                                 * 453F3
              DROP                               * 453F8
              4PICK                              * 453FD
              SWAP                               * 45402
              ROT                                * 45407
              ITE                                * 4540C
              #-                                 * 45411
              SWAPDROP                           * 45416
              DO                                 * 4541B
              5PICK                              * 45420
              INDEX@                             * 45425
              4PICK                              * 4542A
              OBJ_4C742                          * 4542F
              DUP                                * 45434
              +LOOP                              * 45439
              2DROP                              * 4543E
              4ROLLSWAP                          * 45443
            ;                                    * 45448
          ;                                      * 4544D
          SWAPDUP                                * 45452
          %0>=                                   * 45457
          OVER5PICK                              * 4545C
          #1-                                    * 45461
          UNCOERCE                               * 45466
          %<=                                    * 4546B
          AND                                    * 45470
          NOTcase                                * 45475
          7DROP                                  * 4547A
          SWAP                                   * 4547F
          4UNROLL                                * 45484
          COERCEDUP                              * 45489
          ZEROOVER                               * 4548E
          6PICK                                  * 45493
          #1-                                    * 45498
          DRAWLINE#3                             * 4549D
          5ROLL                                  * 454A2
          OBJ_46789                              * 454A7
          SWAPDROP                               * 454AC
          DUPTYPEREAL?                           * 454B1
          case                                   * 454B6
          ::                                     * 454BB
            DUP%0=                               * 454C0
            case                                 * 454C5
            7DROP                                * 454CA
            DUP                                  * 454CF
            %>%%                                 * 454D4
            9GETLAM                              * 454D9
            %%*                                  * 454DE
            7PICK                                * 454E3
            GETYMIN                              * 454E8
            %-                                   * 454ED
            ROT                                  * 454F2
            %MOD                                 * 454F7
            GETYMIN                              * 454FC
            %+                                   * 45501
            %>%%                                 * 45506
            9GETLAM                              * 4550B
            %%*                                  * 45510
            5GETLAM                              * 45515
            SWAP                                 * 4551A
            %%-                                  * 4551F
            BEGIN                                * 45524
            DUP                                  * 45529
            %%0>=                                * 4552E
            OBJ_45641                            * 45533
            WHILE                                * 45538
            ::                                   * 4553D
              4PICK                              * 45542
              4PICK                              * 45547
              3PICK                              * 4554C
              %%>%                               * 45551
              #       2A01                       * 45556  10753
              OBJ_2B551                          * 45560
              COERCE                             * 45565
              OBJ_4C783                          * 4556A
              DROP                               * 4556F
              OVER                               * 45574
              %%-                                * 45579
            ;                                    * 4557E
            REPEAT                               * 45583
            BINT8                                * 45588
            NDROP                                * 4558D
          ;                                      * 45592
          DUP#0=case                             * 45597
          7DROP                                  * 4559C
          DUP                                    * 455A1
          5PICK                                  * 455A6
          #>                                     * 455AB
          case                                   * 455B0
          7DROP                                  * 455B5
          5UNROLL                                * 455BA
          SWAP                                   * 455BF
          4ROLL                                  * 455C4
          DUP                                    * 455C9
          %0<                                    * 455CE
          DUPUNROT                               * 455D3
          IT                                     * 455D8
          %CHS                                   * 455DD
          COERCE                                 * 455E2
          6PICK                                  * 455E7
          #/                                     * 455EC
          DROP                                   * 455F1
          6PICK                                  * 455F6
          SWAP                                   * 455FB
          ROT                                    * 45600
          ITE                                    * 45605
          #-                                     * 4560A
          SWAPDROP                               * 4560F
          4ROLL                                  * 45614
          SWAP                                   * 45619
          DO                                     * 4561E
          OVERINDEX@                             * 45623
          OBJ_4C783                              * 45628
          3PICK                                  * 4562D
          +LOOP                                  * 45632
          5DROP                                  * 45637
        ;                                        * 4563C

* refs (2): 45335 45533
OBJ_45641:
        ::                                       * 45641
          NoAttn?Semi                            * 45646
          ATTNFLGCLR                             * 4564B
          FLUSHKEYS                              * 45650
          DROPFALSE                              * 45655
        ;                                        * 4565A
        BSS     23                               * 4565F

* #len -> $
* refs (4): 8E767 AE482 B99F7 D09FD
Blank$:
        ROMPTR  0EA 027                          * 45676

* refs (2): 46B01 4D8B2
OBJ_45681:
        ::                                       * 45681
          TakeOver                               * 45686
          OBJ_4E6C7                              * 4568B
          GBUFF                                  * 45690
          TOTEMPOB                               * 45695
          CK0NOLASTWD                            * 4569A
          Π'SAVEDDEPTH                           * 4569F
          #1+                                    * 456A4
          '                                      * 456A9
          Π'SAVEDDEPTH                           * 456AE
          STO                                    * 456B3
          CROSSMARKON                            * 456B8
        ;                                        * 456BD

* refs (6): 0C95B 0C960 0C965 0C96A 46B40 47FE0
OBJ_456C2:
        {                                        * 456C2
          NULL$                                  * 456C7
          ::                                     * 456CC
            CHECKMENU                            * 456D1
            DoBadKey                             * 456D6
          ;                                      * 456DB
        }                                        * 456E0

* refs (6): 45BC0 4EC26 4EEA6 735D0 737D8 7381E
OBJ_456E5:
        ::                                       * 456E5
          BINT23                                 * 456EA
          GETLAM                                 * 456EF
        ;                                        * 456F4

* refs (1): 3E7AB
OBJ_456F9:
        ::                                       * 456F9
          CHECKMENU                              * 456FE
          OBJ_4579E                              * 45703
          OBJ_4E6C7                              * 45708
          OBJ_517B2                              * 4570D
          ORDERXY#                               * 45712
          #1+                                    * 45717
          SWAP#1+SWAP                            * 4571C
          GBUFF                                  * 45721
          5UNROLL                                * 45726
          SUBGROB                                * 4572B
          CK0NOLASTWD                            * 45730
          Π'SAVEDDEPTH                           * 45735
          #1+                                    * 4573A
          '                                      * 4573F
          Π'SAVEDDEPTH                           * 45744
          STO                                    * 45749
          CROSSMARKON                            * 4574E
        ;                                        * 45753

* refs (1): 3E7CA
OBJ_45758:
        ::                                       * 45758
          CHECKMENU                              * 4575D
          OBJ_4EBD1                              * 45762
        ;                                        * 45767

* refs (2): 46AA4 4D80D
OBJ_4576C:
        ::                                       * 4576C
          TakeOver                               * 45771
          OBJ_4E6C7                              * 45776
          GBUFF                                  * 4577B
          ZEROZERO                               * 45780
          GBUFFGROBDIM                           * 45785
          SWAP                                   * 4578A
          GROB!ZERODRP                           * 4578F
          CROSSMARKON                            * 45794
        ;                                        * 45799

* refs (9): 45703 477E5 4E3ED 4E564 4E5F0 4E63B ...
OBJ_4579E:
        ::                                       * 4579E
          CURRENTMARK?                           * 457A3
          ?SEMI                                  * 457A8
          RDROP                                  * 457AD
          NEWMARK                                * 457B2
        ;                                        * 457B7

* refs (1): C01A7
OBJ_457BC:
        ::                                       * 457BC
          15GETLAM                               * 457C1
          DUP                                    * 457C6
          21GETLAM                               * 457CB

Π'dependvar:
          LAM     'dependvar                     * 457D0
          '                                      * 457EB

Π'u:
          LAM     'u                             * 457F0

Π'Ystp:
          LAM     'Ystp                          * 457FB
          7ROLL                                  * 4580C
          ::                                     * 45811
            OBJ_45BE8                            * 45816
            ::                                   * 4581B
              4DROP                              * 45820
              RDROP                              * 45825
            ;                                    * 4582A
            ::                                   * 4582F
              4ROLL                              * 45834
              %CHS                               * 45839
              4UNROLL                            * 4583E
            ;                                    * 45843
            ::                                   * 45848
              3DROP                              * 4584D
              %-                                 * 45852
              RDROP                              * 45857
            ;                                    * 4585C
            %CHS                                 * 45861
            DUP                                  * 45866
            ROT                                  * 4586B
            'EvalNoCK:_sup                       * 45870
            xSTO+                                * 45875
            'EvalNoCK:_sup                       * 4587A
            xSTO+                                * 4587F
            DROP                                 * 45884
          ;                                      * 45889

* refs (2): 4597C 462BC
OBJ_4588E:
          ::                                     * 4588E
            OBJ_46955                            * 45893
            ?SKIP                                * 45898
            OBJ_46C7A                            * 4589D
            DUPTYPECMP?                          * 458A2
            NOTcasedrop                          * 458A7
            OBJ_46C7A                            * 458AC
            DUP                                  * 458B1
            OBJ_468F1                            * 458B6
            C%>%                                 * 458BB
            OBJ_46C43                            * 458C0
          ;                                      * 458C5
        ;                                        * 458CA

* refs (1): 57162
OBJ_458CF:
        ::                                       * 458CF
          ROMPTR  0F1 021                        * 458D4
          OBJ_44FAB                              * 458DF
        ;                                        * 458E4

* refs (1): 45C71
OBJ_458E9:
        ::                                       * 458E9
          OBJ_57216                              * 458EE
          ROMPTR  0F1 014                        * 458F3
          ROMPTR  0F1 016                        * 458FE
        ;                                        * 45909

* refs (2): C029B C038F
OBJ_4590E:
        ::                                       * 4590E
          15GETLAM                               * 45913
          DUP                                    * 45918
          21GETLAM                               * 4591D
          4ROLL                                  * 45922
          ::                                     * 45927
            OBJ_45BE8                            * 4592C
            ::                                   * 45931
              DROP                               * 45936
              RDROP                              * 4593B
            ;                                    * 45940
            %CHS                                 * 45945
            ::                                   * 4594A
              %-                                 * 4594F
              RDROP                              * 45954
            ;                                    * 45959
            %CHS                                 * 4595E
            ::                                   * 45963
              %-                                 * 45968
              RDROP                              * 4596D
            ;                                    * 45972
          ;                                      * 45977
          OBJ_4588E                              * 4597C
        ;                                        * 45981

* refs (1): C0415
OBJ_45986:
        ::                                       * 45986
          OBJ_45AF0                              * 4598B

* refs (1): 45A11
OBJ_45990:
          ::                                     * 45990

* refs (3): 45A2A 45A68 45C8F
OBJ_45995:
            ::                                   * 45995
              '                                  * 4599A

Π'PPAR:
              LAM     'PPAR                      * 4599F
              undo                               * 459B0
              casedrop                           * 459B5
              NOP                                * 459BA
              RDROP                              * 459BF
            ;                                    * 459C4
            ROMPTR  0F1 00F                      * 459C9
          ;                                      * 459D4
          ABND                                   * 459D9
        ;                                        * 459DE

* refs (1): C041A
OBJ_459E3:
        ::                                       * 459E3

* refs (3): 44FF7 4500B 45CB3
OBJ_459E8:
          ::                                     * 459E8
            ERRSET                               * 459ED
            ROMPTR  0F1 03F                      * 459F2
            ERRTRAP                              * 459FD
            COLA                                 * 45A02
            OBJ_472B8                            * 45A07
          ;                                      * 45A0C
          OBJ_45990                              * 45A11
        ;                                        * 45A16

* refs (1): C0321
OBJ_45A1B:
        ::                                       * 45A1B
          OBJ_45AF0                              * 45A20

* refs (1): 45010
OBJ_45A25:
          ::                                     * 45A25
            OBJ_45995                            * 45A2A
            ROMPTR  0F1 00F                      * 45A2F
            ROMPTR  0F1 012                      * 45A3A
          ;                                      * 45A45
          ABND                                   * 45A4A
          ABND                                   * 45A4F
        ;                                        * 45A54

* refs (2): C05FD C06F1
OBJ_45A59:
        ::                                       * 45A59
          OBJ_45AF0                              * 45A5E

* refs (1): 44FFC
OBJ_45A63:
          ::                                     * 45A63
            OBJ_45995                            * 45A68
            ROMPTR  0F1 01E                      * 45A6D
            ROMPTR  0F1 01F                      * 45A78
          ;                                      * 45A83
          ABND                                   * 45A88
          ABND                                   * 45A8D
        ;                                        * 45A92
        FILLTO  #45AE0                           * 45A97  73 zero nibbles: the next entry stays at #45AE0

* refs (3): 8D308 8D3C8 8E463
GetMat/Vec:
        ROMPTR  0EA 034                          * 45AE0

* refs (1): C022D
OBJ_45AEB:
        ::                                       * 45AEB

* refs (4): 4598B 45A20 45A5E 45C85
OBJ_45AF0:
          ::                                     * 45AF0
            GraphicExit                          * 45AF5
            DUP                                  * 45AFA
            NOTcase                              * 45AFF
            ::                                   * 45B04
              RDROP                              * 45B09
            ;                                    * 45B0E
            ROMPTR  0F1 040                      * 45B13
            '                                    * 45B1E

'Nx:
            LAM     'Nx                          * 45B23
            undo                                 * 45B30
            caseDROP                             * 45B35
            RDROP                                * 45B3A
          ;                                      * 45B3F

* refs (1): 45BA7
OBJ_45B44:
          ::                                     * 45B44
            '                                    * 45B49

'Ystp:
            LAM     'Ystp                        * 45B4E
            undo                                 * 45B5F
            NOT?SEMI                             * 45B64
            DROP                                 * 45B69
            ROMPTR  0F1 007                      * 45B6E
          ;                                      * 45B79
          ABND                                   * 45B7E
          ABND                                   * 45B83
        ;                                        * 45B88

* refs (1): C0232
OBJ_45B8D:
        ::                                       * 45B8D
          ERRSET                                 * 45B92
          ROMPTR  0F1 03F                        * 45B97
          ERRTRAP                                * 45BA2
          OBJ_45B44                              * 45BA7
          ERRJMP                                 * 45BAC
        ;                                        * 45BB1

* refs (6): C01AC C02A0 C0394 C0488 C057C C0670
OBJ_45BB6:
        ::                                       * 45BB6
          DROP                                   * 45BBB
          OBJ_456E5                              * 45BC0
          BINT4                                  * 45BC5
          NTHCOMPDROP                            * 45BCA
          BINT26                                 * 45BCF
          PUTLAM                                 * 45BD4
          OBJ_47268                              * 45BD9
          TRUE                                   * 45BDE
        ;                                        * 45BE3

* refs (3): 45816 4592C 46258
OBJ_45BE8:
        CON(5)  (*)+5                            * 45BE8  primitive code object
        ASSEMBLE
        A=B     A                                * 45BED
        R0=A.F  A                                * 45BEF
        GOSBVL  POP#                             * 45BF5
        B=A     A                                * 45BFC
        B=B-1   A                                * 45BFE
        GOC     L_45C0F                          * 45C00
L_45C03:
        GOSBVL  SKIPOB                           * 45C03
        B=B-1   A                                * 45C0A
        GONC    L_45C03                          * 45C0C
L_45C0F:
        A=R0.F  A                                * 45C0F
        B=A     A                                * 45C15
        A=DAT0  A                                * 45C17
        D0=D0+  5                                * 45C1A
        PC=(A)                                   * 45C1D
        BSS     14                               * 45C21
        RPL

* refs (8): 8E374 8E6F9 8EEF6 8F044 8F14F 8F18B ...
RowElt#:
        ROMPTR  0EA 038                          * 45C2F

* refs (1): C05F8
OBJ_45C3A:
        ::                                       * 45C3A
          OBJ_73230                              * 45C3F
          ::                                     * 45C44
            OBJ_57171                            * 45C49
            OBJ_44F9B                            * 45C4E
          ;                                      * 45C53
        ;                                        * 45C58

* refs (1): C0504
OBJ_45C5D:
        ::                                       * 45C5D
          OBJ_73230                              * 45C62
          ::                                     * 45C67
            OBJ_57171                            * 45C6C
            OBJ_458E9                            * 45C71
          ;                                      * 45C76
        ;                                        * 45C7B

* refs (1): C0509
OBJ_45C80:
        ::                                       * 45C80
          OBJ_45AF0                              * 45C85

* refs (1): 45CB8
OBJ_45C8A:
          ::                                     * 45C8A
            OBJ_45995                            * 45C8F
            ROMPTR  0F1 015                      * 45C94
          ;                                      * 45C9F
          ABND                                   * 45CA4
        ;                                        * 45CA9

* refs (1): C050E
OBJ_45CAE:
        ::                                       * 45CAE
          OBJ_459E8                              * 45CB3
          OBJ_45C8A                              * 45CB8
        ;                                        * 45CBD

* refs (1): 462D0
OBJ_45CC2:
        ::                                       * 45CC2
          BINT3                                  * 45CC7
          #<                                     * 45CCC
        ;                                        * 45CD1
        FILLTO  #45D1F                           * 45CD6  73 zero nibbles: the next entry stays at #45D1F

* refs (7): 8DD84 8DDAE 8E71C 8EEE2 8F02B 8F140 ...
GetElt:
        ROMPTR  0EA 03D                          * 45D1F

* refs (1): 4612A
OBJ_45D2A:
        ::                                       * 45D2A
          OVER                                   * 45D2F
          %0=                                    * 45D34
          case2drop                              * 45D39
          tok0                                   * 45D3E
          2DUPSWAP                               * 45D43
          %0<                                    * 45D48
          IT                                     * 45D4D
          #1-                                    * 45D52
          3PICK                                  * 45D57
          %EXPONENT                              * 45D5C
          DUPUNROT                               * 45D61
          %ABSCOERCE                             * 45D66
          DUPUNROT                               * 45D6B
          OVER#<                                 * 45D70
          case                                   * 45D75
          OBJ_45DF2                              * 45D7A
          #3-                                    * 45D7F
          ROT                                    * 45D84
          %0<                                    * 45D89
          IT                                     * 45D8E
          #1-                                    * 45D93
          SWAP                                   * 45D98
          OBJ_45E33                              * 45D9D
          #-                                     * 45DA2
          SWAPDROP                               * 45DA7
          BINT12                                 * 45DAC
          OVER#<                                 * 45DB1
          IT                                     * 45DB6
          DROPZERO                               * 45DBB
          savefmt1                               * 45DC0
          ERRSET                                 * 45DC5
          ::                                     * 45DCA
            DOSCI                                * 45DCF
            ->StkStr22!                          * 45DD4
          ;                                      * 45DD9
          ERRTRAP                                * 45DDE
          ederr                                  * 45DE3
          rstfmt1                                * 45DE8
        ;                                        * 45DED

* refs (1): 45D7A
OBJ_45DF2:
        ::                                       * 45DF2
          3DROP                                  * 45DF7
          SWAP                                   * 45DFC
          EDITDECOMP$                            * 45E01
          DUPLEN$                                * 45E06
          3PICK                                  * 45E0B
          #>                                     * 45E10
          NOTcase                                * 45E15
          SWAPDROP                               * 45E1A
          BINT1                                  * 45E1F
          ROT                                    * 45E24
          SUB$                                   * 45E29
        ;                                        * 45E2E

* refs (1): 45D9D
OBJ_45E33:
        ::                                       * 45E33
          BINT10                                 * 45E38
          OVER#>                                 * 45E3D
          casedrop                               * 45E42
          BINT1                                  * 45E47
          BINT100                                * 45E4C
          OVER#>                                 * 45E51
          casedrop                               * 45E56
          BINT2                                  * 45E5B
          DROP                                   * 45E60
          BINT3                                  * 45E65
        ;                                        * 45E6A

* refs (1): 46134
OBJ_45E6F:
        ::                                       * 45E6F
          OVER                                   * 45E74
          LEN$                                   * 45E79
          2DUP#>                                 * 45E7E
          NOTcase2DROP                           * 45E83
          #-                                     * 45E88
          14SPACES$                              * 45E8D
          BINT1                                  * 45E92
          ROT                                    * 45E97
          SUB$                                   * 45E9C
          SWAP                                   * 45EA1
          !!append$                              * 45EA6
        ;                                        * 45EAB

* refs (15): 45F3B 45F62 45FF3 46148 4A3DD 4A4D1 ...
OBJ_45EB0:
        ::                                       * 45EB0
          EDITDECOMP$                            * 45EB5
          &$                                     * 45EBA
        ;                                        * 45EBF

* refs (2): B6349 C6A04
OBJ_45EC4:
        ::                                       * 45EC4
          AtUserStack                            * 45EC9
          ERRSET                                 * 45ECE
          GETPTYPE                               * 45ED3
          ERRTRAP                                * 45ED8
          ::                                     * 45EDD
            ERRORCLR                             * 45EE2
            DropSysObs                           * 45EE7
            'IDFUNCTION                          * 45EEC
          ;                                      * 45EF1
          MAKEPVARS                              * 45EF6
          DROP                                   * 45EFB
          PUTPTYPE                               * 45F00
          ZEROZERO                               * 45F05
          MAKEPICT#                              * 45F0A
        ;                                        * 45F0F

* refs (1): 3C491
OBJ_45F14:
        ::                                       * 45F14
          Chk&BreakPPAR                          * 45F19
          $       "Indep: "                      * 45F1E
          6ROLL                                  * 45F36
          OBJ_45EB0                              * 45F3B
          DISPROW3                               * 45F40
          $       "Depnd: "                      * 45F45
          SWAP                                   * 45F5D
          OBJ_45EB0                              * 45F62
          DISPROW4                               * 45F67
          2DROP                                  * 45F6C
          3UNROLL                                * 45F71
          DUPTYPECMP?                            * 45F76
          OBJ_514C3                              * 45F7B
          C%>%                                   * 45F80
          ROT                                    * 45F85
          DUPTYPECMP?                            * 45F8A
          OBJ_514C3                              * 45F8F
          C%>%                                   * 45F94
          4ROLLROT                               * 45F99

_Xrng:_:
          $       "Xrng:"                        * 45F9E
          OBJ_4A834                              * 45FB2
          DISPROW5                               * 45FB7

_Yrng:_:
          $       "Yrng:"                        * 45FBC
          OBJ_4A834                              * 45FD0
          DISPROW6                               * 45FD5
          $       "Res: "                        * 45FDA
          SWAP                                   * 45FEE
          OBJ_45EB0                              * 45FF3
          DISPROW7                               * 45FF8
          SetDA2OKTemp                           * 45FFD
        ;                                        * 46002
