* HP 48GX ROM revision R, #4400C-#46006: Command line editor: end of the interactive stack, edit buffer access, MatrixWriter key table, EquationWriter glue, AXES arguments, DRAX, and the PICTURE keys of the 3D plots
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: EDITPARTS InitEd&Modes DECOMP&$ NoEditLine? CURSOR_END? ENTRWISE@ EditString InitEdLine ?NEWMARK \StkChanged RowElt# InitEdModes
* Follows on from the previous file (at #4400C in the original ROM).
        RPL

* refs (1): 43DFA
\KEEP:
        :: TakeOver DEPTH UNCOERCE CKNNOLASTWD DROP 3GETLAM DEPTH #1- OVER#- * 4400C
          OVER#2+UNROL psh #1+NDROP \StkChanged SetDA13NoCh ; * 4403E

* refs (1): 43DA4
\->LIST:
        :: \#LEVEL {}N \StkChanged SetDA13NoCh ; * 4405C

* refs (1): 438C9
* -> : interactive stack, the backspace key: remove the pointed level from the stack
\DROP:
        :: ComLine?:(bip;q) \#LEVEL ROLLDROP \StkChanged SetDA13NoCh ; * 4407A

* refs (7): 43F71 43F8A 43FA3 43FDA 43FF3 44061 ...
* -> ... #level: interactive stack: take over the key, save last arguments as for a command taking the pointed level (lam 3)
\#LEVEL:
        :: TakeOver 3GETLAM UNCOERCE CKNNOLASTWD ; * 4409D

* refs (5): 43F7B 43F94 43FAD 43FCB 43FE4
~AtUserStack;SetDA13NoCh:
        :: AtUserStack SetDA13NoCh ;             * 440BB

* refs (8): 43EF9 43F1C 43F3F 43F62 43FFD 4404D ...
* -> : interactive stack: after the stack changed, go back to the user stack; quit if it is empty (lam 1 TRUE); otherwise keep the pointer (lam 3) within the depth and fix the row
\StkChanged:
        :: AtUserStack DEPTH BINT0 #=casedrop ~TRUE;1PUTLAM * 440CF
          DUP 3GETLAM #<ITE 3PUTLAM DROP \FixRow ; * 440ED

* refs (4): 43C07 43C75 43C9D 44106
* -> : interactive stack: keep the pointer's screen row (lam 2, 1 to 4) possible for the pointed level and the levels above it
\FixRow:
        :: ~DEPTH;4GETLAM;#- 3GETLAM #- BINT3 #MIN #1+ BINT5 3GETLAM BINT4 * 44110
          #MIN #- 2GETLAM ROT #MIN #MAX 2PUTLAM ; * 44142

* refs (4): 43806 43A9A 43B67 43E4F
~4GETLAM;#+:
        :: 4GETLAM #+ ;                          * 4416A

* refs (5): 43A04 43A40 43BA8 43C93 44115
~DEPTH;4GETLAM;#-:
        :: DEPTH 4GETLAM #- ;                    * 4417E

* refs (4): 39C43 4380B 43A9F 43B6C
pick(s)?:
        :: DEPTH #1- OVER#< casedrpfls PICK      * 44197
          TRUE ;                                 * 441B5

* refs (3): 43829 43AC7 43B94
* -> : interactive stack: draw the pointer ▶ after the level number on the pointer's row
\ShowPointer:
        :: \PointerGrob \MarkRow ;               * 441BF

* refs (2): 43A54 43B21
* -> : interactive stack: put the plain : back on the pointer's row
\ShowColon:
        :: \ColonGrob \MarkRow ;                 * 441D3

* refs (2): 441C9 441DD
* grob -> : interactive stack: draw grob in HARDBUFF just after the level number (x = 6*digits) on row lam 2 (y = 6+10*row)
\MarkRow:
        :: HARDBUFF 3GETLAM #>$ LEN$ #6* BINT6 2GETLAM #10* #+ GROB! ; * 441E7

* refs (1): 441C4
* -> grob: the big-font ▶
\PointerGrob:
        ::                                       * 44223

_chr(134)_:
          $ "▶" $>BIGGROB ;                      * 44228

* refs (1): 441D8
* -> grob: the big-font :
\ColonGrob:
        ::                                       * 4423E

_:__44243:
          $ ":" $>BIGGROB ;                      * 44243

* refs (3): 43CDE 43CFC 440E8
~TRUE;1PUTLAM:
        :: TRUE 1PUTLAM ;                        * 44259

* refs (3): 40B79 4261F 426CE
* 21: the last character column of the command line (22 columns, counted from 0)
#EdLastCol:
        # 15                                     * 4426D  21

* ->
* refs (17): 17CAB 19B6C 3860B 38845 3B7DB 4096C ...
InitEd&Modes:
        :: InitEdLine InitEdModes ;              * 44277

* ->
* refs (9): 40AE8 42F6C 43246 4427C D5F60 D62AF ...
InitEdLine:
        :: InitEdLine~1 EdCursorHome InitEdLine~2 ; * 4428B

* refs (1): 44290
InitEdLine~1:
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
        GOYES   InitEdLine~1.L1                  * 442F0
        D1=A                                     * 442F2
        D0=C                                     * 442F5
        C=C-B   A                                * 442F8
        GOSBVL  MOVEUP                           * 442FA
        AD1EX                                    * 44301
        GOTO    InitEdLine~1.L2                  * 44304
InitEdLine~1.L1:
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
InitEdLine~1.L2:
        D0=(5)  DSKTOP                           * 44323
        DAT0=A  A                                * 4432A
        D0=(5)  EDITLINE                         * 4432D
        A=DAT0  A                                * 44334
        D1=A                                     * 44337
        LC(5)   #00030                           * 4433A
        GOSBVL  WIPEOUT                          * 44341
        GOVLNG  GETPTRLOOP                       * 44348

* refs (2): 44295 443D5
* -> : put the editor at the start of the line: FIRSTCHAR, CURSOR and CURSOROFFSET 0, CURSORPART and TOPLINE 1
EdCursorHome:
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
        :: InitEdModes~1 ClrHistLevel ;          * 44394

* refs (1): 44399
InitEdModes~1:
        :: ClrAlgEntry ClrPrgmEntry MajusMo UnLockAlpha INSERT_MODE ; * 443A8

* $ ->
* refs (10): 40B60 42F71 43250 8F0F5 D5F6A D62B4 ...
EditString:
        :: ~ChkNoChr0!(st);Echo$NoChr00 EdCursorHome ; * 443CB

* refs (6): 3E68E 3E6A2 3F288 4278C 44473 4448C
NextChrInComLine:
        :: BINT2 ChrInComLine(s) ;               * 443DF

* refs (3): 3E643 406A7 40747
PrevChrInComLine:
        :: BINT0 ChrInComLine(s) ;               * 443F3

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
        :: NextChrInComLine CHR_Space EQUAL ;    * 4446E

* refs (2): 43345 444AA
* -> chr flag: the next character of the command line; TRUE if it is the 0 that ends the line
NextChr=0?:
        :: NextChrInComLine DUP CHR_00 EQUAL ;   * 44487

* -> flag
* refs (13): 3B4FF 3B690 3DEF4 3E559 3E6BB 3F27E ...
CURSOR_END?:
        :: NextChr=0? SWAP CHR_Newline EQUALOR ; * 444A5

* refs (7): 3EF0A 40E10 42BC5 42CB0 42CD8 42CF1 ...
AddInComLine(st):
        CON(5)  (*)+5                            * 444C3  primitive code object
        ASSEMBLE
        ST=0    1                                * 444C8
        ST=0    10                               * 444CB
AddInComLine(st).L1:
        GOSBVL  SAVPTR                           * 444CE
        A=DAT1  A                                * 444D5
        D1=A                                     * 444D8
        D1=D1+  5                                * 444DB
        A=DAT1  A                                * 444DE
        LC(5)   #00005                           * 444E1
        A=A-C   A                                * 444E8
        GOTO    Char>Edit.L2                     * 444EA

* refs (3): 4076F 42B11 42D19
Char>Edit:
        CON(5)  (*)+5                            * 444EE  primitive code object
        ST=1    1                                * 444F3
        ST=0    10                               * 444F6
Char>Edit.loop1:
        GOSBVL  SAVPTR                           * 444F9
        A=DAT1  A                                * 44500
        D1=A                                     * 44503
        LC(5)   #00002                           * 44506
        A=C     A                                * 4450D
Char>Edit.L2:
        D1=D1+  5                                * 4450F
        B=A     A                                * 44512
        GOSBVL  ROOM                             * 44514
        ?B<C    A                                * 4451B
        GOYES   Char>Edit.L3                     * 4451E
        GOSBVL  GCorMemErr                       * 44520
        ?ST=0   1                                * 44527
        GOYES   AddInComLine(st).L1              * 4452A
        GONC    Char>Edit.loop1                  * 4452C
Char>Edit.L3:
        BSRB.F  A                                * 4452F
        C=B     A                                * 44534
        D=C     A                                * 44536
        D0=(5)  CURSOR                           * 44538
        A=DAT0  A                                * 4453F
        ST=0    2                                * 44542
        LC(5)   #00016                           * 44545
        ?C<A    A                                * 4454C
        GOYES   Char>Edit.L4                     * 4454F
        ST=1    2                                * 44551
Char>Edit.L4:
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
        GOSBVL  NoIgnoreAlm.L1                   * 44574
        GOC     Char>Edit.L6                     * 4457B
        LC(2)   #0A                              * 4457E
Char>Edit.loop5:
        GOSUB   EdChr=C?                         * 44582
        GOC     Char>Edit.L6                     * 44586
        GOSUB   EdMoveChr                        * 44589
        GONC    Char>Edit.loop5                  * 4458D
Char>Edit.L6:
        ?ST=0   1                                * 44590
        GOYES   Char>Edit.L7                     * 44593
        ?ST=0   2                                * 44595
        GOYES   Char>Edit.L7                     * 44598
        A=DAT0  B                                * 4459A
        ?A#0    B                                * 4459D
        GOYES   Char>Edit.L7                     * 445A0
        GOSUB   EdMoveChr                        * 445A2
        GONC    EdChr=C?.L1                      * 445A6
Char>Edit.L7:
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
Char>Edit.loop8:
        GOSUB   EdMoveChr                        * 445FC
        GONC    Char>Edit.loop8                  * 44600

* refs (3): 44589 445A2 445FC
* B.A = characters left, D1 -> source, D0 -> buffer: copy one character, going down the buffer (the edit line is held backwards under TEMPENV); carry set and leaves through the fixup when B runs out
EdMoveChr:
        B=B-1   A                                * 44603
        GOC     EdChr=C?.L1                      * 44605
        A=DAT1  B                                * 44608
        D1=D1+  2                                * 4460B
        DAT0=A  B                                * 4460E
        D0=D0-  2                                * 44611
        RTN                                      * 44614

* refs (2): 44582 44631
* C.B = character, D0 -> edit buffer: carry set if the byte there is C or the terminating 0. Falls through at .L1 to the end of Char>Edit: fix CURSOROFFSET and FIRSTCHAR, flag a redraw, adjust memory
EdChr=C?:
        A=DAT0  B                                * 44616
        ?C=A    B                                * 44619
        RTNYES                                   * 4461C
        ?A=0    B                                * 4461E
        RTNYES                                   * 44621
        RTN                                      * 44623
EdChr=C?.L1:
        C=0     A                                * 44625
        LC(2)   #15                              * 44627
        B=C     A                                * 4462B
        LC(2)   #0A                              * 4462D
        GOSUB   EdChr=C?                         * 44631
        GOC     EdChr=C?.L2                      * 44635
        B=B-1   A                                * 44638
EdChr=C?.L2:
        D0=(5)  CURSOROFFSET                     * 4463A
        C=0     A                                * 44641
        C=DAT0  B                                * 44643
        C=C+D   A                                * 44646
        ?B>=C   A                                * 44648
        GOYES   EdChr=C?.L3                      * 4464B
        A=B     A                                * 4464D
        DAT0=A  B                                * 4464F
        C=C-A   A                                * 44652
        D0=(5)  FIRSTCHAR                        * 44654
        A=DAT0  A                                * 4465B
        A=A+C   A                                * 4465E
        DAT0=A  A                                * 44660
        GONC    EdChr=C?.L4                      * 44663
EdChr=C?.L3:
        DAT0=C  B                                * 44666
EdChr=C?.L4:
        LC(3)   #10A                             * 44669
        GOSBVL  setflag                          * 4466E
        GOSBVL  ADJMEM                           * 44675
        GOVLNG  DECODE.L3                        * 4467C

* -> $
* refs (7): 38836 3A03F 4095D 40ADE 43183 D73CC ...
EDITLINE$:
        CON(5)  (*)+5                            * 44683  primitive code object
        GOSBVL  SAVPTR                           * 44688
EDITLINE$.loop1:
        GOSUB   EdLineSize                       * 4468F
        R1=A                                     * 44693
        R2=C                                     * 44696
        GOSBVL  MAKE$N                           * 44699
        C=R1                                     * 446A0
        D1=C                                     * 446A3
        A=R2                                     * 446A6
        ASRB.F  A                                * 446A9
        GOTO    EDITLINE$.L3                     * 446AE
EDITLINE$.loop2:
        C=DAT1  B                                * 446B2
        DAT0=C  B                                * 446B5
        D0=D0+  2                                * 446B8
EDITLINE$.L3:
        D1=D1-  2                                * 446BB
        A=A-1   A                                * 446BE
        GONC    EDITLINE$.loop2                  * 446C0
        GOSBVL  GETPTR                           * 446C3
        D=D-1   A                                * 446CA
        GOC     EDITLINE$.L4                     * 446CC
        D1=D1-  5                                * 446CF
        A=R0                                     * 446D2
        GOVLNG  GPOverWrALp.L1                   * 446D5
EDITLINE$.L4:
        GOSBVL  GCorMemErr                       * 446DC
        GOTO    EDITLINE$.loop1                  * 446E3

* refs (2): 4468F 4471D
* -> D0 at the first byte above the line's end 0, A.A = TEMPENV, C.A = nibbles in the edit line. The line is stored backwards below TEMPENV and starts with a 0 byte at its low end
EdLineSize:
        D0=(5)  TEMPENV                          * 446E7
        A=DAT0  A                                * 446EE
        D0=A                                     * 446F1
EdLineSize.loop1:
        D0=D0-  2                                * 446F4
        C=DAT0  B                                * 446F7
        ?C#0    B                                * 446FA
        GOYES   EdLineSize.loop1                 * 446FD
        D0=D0+  2                                * 446FF
        LC(6)   #000000                          * 44702
        CD0EX                                    * 4470A
        C=A-C   A                                * 4470D
        RTN                                      * 4470F

* refs (1): 4252F
SizeOfComLine:
        CON(5)  (*)+5                            * 44711  primitive code object
        GOSBVL  SAVPTR                           * 44716
        GOSUB   EdLineSize                       * 4471D
        CSRB.F  A                                * 44721
        R0=C                                     * 44726
SizeOfComLine.L1:
        GOVLNG  PUSH#LOOP                        * 44729

* refs (25): 3A058 3A5A0 3B373 3B4A0 3E40C 3E4F5 ...
EDITPARTS:
        CON(5)  (*)+5                            * 44730  primitive code object
        GOSBVL  SAVPTR                           * 44735
        GOSUB   EdParts                          * 4473C
        R0=A                                     * 44740
        GOTO    SizeOfComLine.L1                 * 44743

* refs (2): 39F93 4473C
* -> A.A = lines in the command line (CR_COUNT+1), 0 if there is no edit line (bit 0 of SysNib10 clear); carry set if none
EdParts:
        D0=(5)  SysNib10                         * 44747
        A=0     A                                * 4474E
        A=DAT0  1                                * 44750
        LC(1)   #1                               * 44754
        A=A&C   B                                * 44757
        ?A=0    B                                * 4475B
        RTNYES                                   * 4475E
        GOSUB   EdFirstByte                      * 44760
        D0=(5)  CR_COUNT                         * 44764
        A=DAT0  A                                * 4476B
        A=A+1   A                                * 4476E
        RTN                                      * 44770

* refs (3): 42AA9 44760 44794
* -> A.B = first character of the edit line (the byte just under TEMPENV); 0 when the line is empty. D0 points at it
EdFirstByte:
        D0=(5)  TEMPENV                          * 44772
        C=DAT0  A                                * 44779
        C=C-1   A                                * 4477C
        C=C-1   A                                * 4477E
        D0=C                                     * 44780
        A=0     A                                * 44783
        A=DAT0  B                                * 44785
        RTN                                      * 44788

* refs (1): 43214
InputLAttn~1:
        CON(5)  (*)+5                            * 4478A  primitive code object
        CD0EX                                    * 4478F
        RSTK=C                                   * 44792
        GOSUB   EdFirstByte                      * 44794
        C=RSTK                                   * 44798
        D0=C                                     * 4479A
        ?A=0    B                                * 4479D
        GOYES   InputLAttn~1.L1                  * 447A0
InputLAttn~1.L1:
        GOVLNG  PushT/FLoop                      * 447A2

* refs (1): 44842
* A.A = line number from 1 -> B.A, R0, C.A, A.A: scan the backwards edit buffer past the line feeds to line n and to its end, giving its start and length relative to the visible text; ST2 set if the line starts before FIRSTCHAR
EdFindLine:
        GOSBVL  SAVPTR                           * 447A9
        B=A     A                                * 447B0
        D0=(5)  TEMPENV                          * 447B2
        A=DAT0  A                                * 447B9
        D0=A                                     * 447BC
        B=B-1   A                                * 447BF
        B=B-1   A                                * 447C1
        GOC     EdFindLine.L2                    * 447C3
        LC(2)   #0A                              * 447C6
EdFindLine.loop1:
        D0=D0-  2                                * 447CA
        A=DAT0  B                                * 447CD
        ?C#A    B                                * 447D0
        GOYES   EdFindLine.loop1                 * 447D3
        B=B-1   A                                * 447D5
        GONC    EdFindLine.loop1                 * 447D7
EdFindLine.L2:
        CD0EX                                    * 447DA
        RSTK=C                                   * 447DD
        D0=C                                     * 447DF
        LC(2)   #0A                              * 447E2
EdFindLine.loop3:
        D0=D0-  2                                * 447E6
        A=DAT0  B                                * 447E9
        ?A=0    B                                * 447EC
        GOYES   EdFindLine.L4                    * 447EF
        ?C#A    B                                * 447F1
        GOYES   EdFindLine.loop3                 * 447F4
EdFindLine.L4:
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
        GOYES   EdFindLine.L5                    * 44817
        C=C-A   A                                * 44819
        B=B-A   A                                * 4481B
        A=B     A                                * 4481D
        R0=A                                     * 4481F
        RTN                                      * 44822
EdFindLine.L5:
        A=C     A                                * 44824
        C=0     A                                * 44826
        ST=1    2                                * 44828
        RTN                                      * 4482B

* refs (5): 424F3 42511 42534 42683 426B0
* Probably: #pos -> #start #len flag: the extent of the line holding the cursor (see EdFindLine)
OBJ_4482D:
        CON(5)  (*)+5                            * 4482D  primitive code object
        LC(5)   CURSORPART                       * 44832
        CD0EX                                    * 44839
        A=DAT0  A                                * 4483C
        D0=C                                     * 4483F
        GOSUB   EdFindLine                       * 44842
        CSRB.F  A                                * 44846
        ?ST=0   2                                * 4484B
        GOYES   OBJ_4482D.L1                     * 4484E
        DAT0=C  A                                * 44850
        C=A     A                                * 44853
        CSRB.F  A                                * 44855
OBJ_4482D.L1:
        R0=C                                     * 4485A
        D0=(5)  CURSOROFFSET                     * 4485D
        A=0     A                                * 44864
        A=DAT0  B                                * 44866
        R1=A                                     * 44869
        ST=0    1                                * 4486C
        ?C>A    A                                * 4486F
        GOYES   OBJ_4482D.L2                     * 44872
        ST=1    1                                * 44874
OBJ_4482D.L2:
        GOSBVL  PUSH2#                           * 44877
        ?ST=0   1                                * 4487E
        GOYES   OBJ_4482D.L3                     * 44881
OBJ_4482D.L3:
        GOVLNG  PushT/FLoop                      * 44883
        RPL

* -> flag
* refs (13): 17C8D 19B9A 3908B 3A035 3DE6D 3F26F ...
NoEditLine?:
        :: EditLExists? NOT ;                    * 4488A

* refs (3): 40B83 42971 42B48
ROWNUM:
        :: LINESOFSTACK CurrentRow TOPLINE@ #1-- #+ ; * 4489E

* chr -> chr'
* refs (2): 42AF3 6BE84
?TogU/LCase:
        :: MinusMo NOT?SEMI                      * 448C1
          DUP CHR># BINT65 OVER#> caseDROP BINT122 * 448D0
          OVER#< caseDROP BINT91                 * 448EE
          OVER#> OVER BINT96 #> OVER OR NOTcase2DROP ROTDROP * 448FD
          BINT32 SWAP ITE #+ #-                  * 44925
          #>CHR ;                                * 4493E

* refs (1): 8D363
* #key #plane -> ob TRUE | FALSE: MatrixWriter: the hard key handler (POLKeyUI); plane 1 plain, 2 left shift, 3 right shift, 4 alpha
MWKeyDef:
        :: BINT1 #=casedrop MWKeys               * 44948
          BINT2 #=casedrop MWLSKeys              * 4495C
          BINT3 #=casedrop MWRSKeys              * 4496B
          BINT4 #=casedrop XLIB MWKeyHook        * 4497A
          2DROPFALSE ;                           * 4498F

* refs (1): 44957
* #key -> ob TRUE | FALSE: MatrixWriter: unshifted keys, with a smaller set while the command line is open (EditExstCase)
MWKeys:
        :: EditExstCase                          * 44999
          :: BINT25 ?CaseKeyDef XLIB MWEnter BINT45 ?CaseKeyDef * 449A3
            XLIB MWCancelLine BINT13 ?CaseKeyDef * 449C7
            XLIB ~TakeOver;KeyN_QUOTE;SetDA1NoCh DROPFALSE ; * 449DC
          BINT11 ?CaseKeyDef XLIB MWKeyUp BINT16 ?CaseKeyDef XLIB MWKeyLeft * 449F1
          BINT17 ?CaseKeyDef XLIB MWKeyDown BINT18 ?CaseKeyDef * 44A1B
          XLIB MWKeyRight BINT25 ?CaseKeyDef XLIB MWEnterDone BINT29 * 44A3A
          ?CaseKeyDef DoBadKey BINT45 ?CaseKeyDef XLIB MWCancel BINT13 * 44A5F
          ?CaseKeyDef XLIB ~TakeOver;KeyN_QUOTE;SetDA1NoCh BINT26 * 44A83
          ?CaseKeyDef DoBadKey DROPFALSE ;       * 44A98

* refs (1): 44966
* #key -> ob TRUE | FALSE: MatrixWriter: left-shifted keys: only +/-
MWLSKeys:
        :: BINT26 ?CaseKeyDef XLIB ~TakeOver;ShowEditMenu DROPFALSE ; * 44AAC

* refs (1): 44975
* #key -> ob TRUE | FALSE: MatrixWriter: right-shifted keys, with a smaller set while the command line is open
MWRSKeys:
        :: EditExstCase                          * 44AD0
          :: BINT25 ?CaseKeyDef XLIB MWMenuFirst BINT39 ?CaseKeyDef * 44ADA
            XLIB ~TakeOver;KeyRS_MUL;SetDA1NoCh MWRSKeyOK ; * 44AFE
          BINT11 ?CaseKeyDef XLIB MWKeyFirstRow BINT16 ?CaseKeyDef * 44B13
          XLIB MWKeyFirstCol BINT17 ?CaseKeyDef XLIB MWKeyLastRow BINT18 * 44B32
          ?CaseKeyDef XLIB MWKeyLastCol BINT25 ?CaseKeyDef XLIB MWMenuFirst * 44B57
          BINT39 ?CaseKeyDef XLIB ~TakeOver;KeyRS_MUL;SetDA1NoCh MWRSKeyOK ; * 44B7C

* refs (7): 8DA69 8DB7F 8DF3D 8E730 8ED7A 8F1D1 ...
* -> #: the MatrixWriter's column width (COLWIDTH, one byte)
COLWIDTH@:
        CON(5)  (*)+5                            * 44B9B  primitive code object
        ASSEMBLE
        LC(5)   COLWIDTH                         * 44BA0
        GOTO    ENTRWISE!.L2                     * 44BA7

* refs (3): 8ED8E 8F218 8F560
* # -> : set the MatrixWriter's column width
COLWIDTH!:
        CON(5)  (*)+5                            * 44BAB  primitive code object
        LC(5)   COLWIDTH                         * 44BB0
        GOTO    ENTRWISE!.L1                     * 44BB7

* refs (12): 8E28B 8E314 8E681 8E6A9 8E77B 8E790 ...
* -> #: the MatrixWriter's entry direction (ENTRWISE, #80916)
ENTRWISE@:
        CON(5)  (*)+5                            * 44BBB  primitive code object
        LC(5)   ENTRWISE                         * 44BC0
        GOTO    ENTRWISE!.L2                     * 44BC7

* refs (2): 8EC7D 8ECB5
* # -> : set the MatrixWriter's entry direction
ENTRWISE!:
        CON(5)  (*)+5                            * 44BCB  primitive code object
        LC(5)   ENTRWISE                         * 44BD0
        NOP4                                     * 44BD7
ENTRWISE!.L1:
        RSTK=C                                   * 44BDB
        GOSBVL  POP#                             * 44BDD
        C=RSTK                                   * 44BE4
        CD1EX                                    * 44BE6
        DAT1=A  B                                * 44BE9
        D1=C                                     * 44BEC
        A=DAT0  A                                * 44BEF
        D0=D0+  5                                * 44BF2
        PC=(A)                                   * 44BF5
ENTRWISE!.L2:
        CD1EX                                    * 44BF9
        A=0     A                                * 44BFC
        A=DAT1  B                                * 44BFE
        D1=C                                     * 44C01
        GOVLNG  EqwBoxParent@.L3                 * 44C04
        FILLTO  #44C31                           * 44C0B  38 zero nibbles: the next entry stays at #44C31
        RPL

* -> []/[[]]
* refs (3): 3DF63 B4DA0 D75DD
DoNewMatrix:
        XLIB DoNewMatrix~1                       * 44C31

* refs (2): 683FD 6AAC8
OBJ_44C3C:
        :: OBJ_44C8C #2+                         * 44C3C

* refs (2): 4B909 6D05A
OBJ_44C4B:
          :: EqwIf6 OBJ_66F91 BINT6 MAKEGROB EqwLParenGrob ; OBJ_44DB3 * 44C4B
          EqwBoxRefY@ #1+ EqwBoxRefY! ;          * 44C73

* refs (1): 68411
OBJ_44C87:
        ::                                       * 44C87

* refs (2): 44C41 44CCD
OBJ_44C8C:
          :: EqwDupBoxNext@ EqwDupBoxH@ ;        * 44C8C

* refs (1): 65ABF
OBJ_44CA0:
          :: BINT6 MAKEGROB EqwIntegralGrob ; GOTO OBJ_44CD2.L1 ; * 44CA0

* refs (1): 68416
OBJ_44CC8:
        :: OBJ_44C8C                             * 44CC8

* refs (2): 666BF 6D792
OBJ_44CD2:
          :: BINT4 MAKEGROB EqwRadicalGrob ;     * 44CD2
OBJ_44CD2.L1:
          OBJ_44DB3 OBJ_44D9A ;                  * 44CEB

* refs (1): 68407
OBJ_44CFA:
        :: EqwDupBoxNext@ DUP#0= ?SKIP EqwBoxW@  * 44CFA
          3PICK EqwBoxFirst@ EqwBoxW@ #MAX       * 44D13
OBJ_44CFA.L1:
          #2+ DUP EqwBarGrob OBJ_44DB3 #2/ EqwBoxRefX! ; * 44D27

* refs (1): 6840C
OBJ_44D4A:
        :: EqwDupBoxNext@ EqwBoxW@ GOTO OBJ_44CFA.L1 ; * 44D4A

* refs (1): 68420
OBJ_44D68:
        :: OVER EqwBoxLast@ EqwDupBoxH@          * 44D68

* refs (1): 6DB8E
EqwWhere~1:
          :: BINT2 MAKEGROB EqwVBarGrob ; OBJ_44DB3 * 44D7C

* refs (4): 44CF0 666C9 6D325 6DB57
OBJ_44D9A:
          :: EqwBoxRefY@ EqwBoxRefY! ; ;         * 44D9A

* refs (5): 44C6E 44CEB 44D36 44D95 666C4
OBJ_44DB3:
        :: 3PICKSWAP OVERDUP EqwDupBoxXY@ 2DUP#+ #0=ITE 3DROP * 44DB3

* refs (1): 66E75
EqwMoveBox~1:
          :: EqwInvertBox GROB!ZERO 3DROP ; DUPZERO EqwBoxX0Y! SWAP * 44DD6

* refs (8): 65D91 65ED6 661CE 69A22 6D203 6E145 ...
OBJ_44DFE:
          :: EqwGrobWH 2DUPHALF 6PICK 3UNROLL EqwBoxRef! 4PICK 3UNROLL * 44DFE
            EqwBoxWH! EqwBoxObj! ;               * 44E26
          SWAP ;                                 * 44E35

* refs (2): 6D1FE 6FAF5
OBJ_44E3F:
        CON(5)  DOGROB                           * 44E3F  DOGROB
        LENGTH                                   * 44E44  length, to #44E53
        BSS     10                               * 44E49  zeros
        ENDLENGTH                                * 44E53
        FILLTO  #44F42                           * 44E53  239 zero nibbles: the next entry stays at #44F42

* refs (1): 8D344
BindMatVars:
        XLIB BindMatVars~1                       * 44F42

* refs (1): 5711C
GridPictStart~1:
        :: Plot3DBind FALSE XLIB GridSurfSetup ; * 44F4D

* refs (1): 5713F
ParsurfPictStart~1:
        :: XLIB ParSurfEq DOSTOE Plot3DBind TRUE XLIB GridSurfSetup ; * 44F6C

* refs (1): 45C4E
SlopePictStart~1:
        :: XLIB SlopeVPAR                        * 44F9B

* refs (1): 458DF
PcontourPictStart~2:
          :: XLIB Plot3DLams BIND XLIB SlopeSetup XLIB SlopeRun ; ; * 44FAB
        BSS     7                                * 44FE0  zeros

* [] -> []'
* refs (2): 42DEB B4D9B
DoOldMatrix:
        XLIB DoOldMatrix~1                       * 44FE7

* refs (2): C0602 C06F6
OBJ_44FF2:
        :: OBJ_459E8 OBJ_45A63 ;                 * 44FF2

* refs (1): C0326
OBJ_45006:
        :: OBJ_459E8 OBJ_45A25 ;                 * 45006
        BSS     9                                * 4501A  zeros

* refs (1): 8D84E
InitOldMat:
        XLIB InitOldMat~1                        * 45023

* refs (4): 4B053 B6026 B60B2 B6286
* arg -> {}: AXES: check the argument (a centre, or a list of centre, tick spacing and labels) and build PPAR's axes field, keeping the parts not given
AXES>List:
        :: INNERCOMP                             * 4502E
          :: BINT1 #=casedrop                    * 45038
            :: DUPTYPECMP? case                  * 45047
              :: BINT5 PPAR(s);dup;li? NOTcaseDROP CDRCOMP * 45056
                SWAP >HCOMP ;                    * 4506F
              DUP AxTick? NcaseTYPEERR BINT5     * 4507E
              PPAR(s);dup;li? NOTcase            * 45092
              :: SWAP TWO{}N ;                   * 4509C
              ZEROSWAP INNERCOMP DUP ZERO_DO     * 450B0
              :: #1-SWAP DUPTYPECMP? case psh1&rev * 450C4
                DUPTYPECSTR? case psh1&rev       * 450DD
                DROP ;                           * 450EC
              LOOP DROP DUP #2+ ROLL 3UNROLL #1+ reversym {}N ; * 450F6
            BINT2 #=casedrop AXES>List~1         * 45128
            BINT3 #=casedrop                     * 45137
            :: DUPTYPECSTR? NcaseTYPEERR OVER    * 45141
              TYPECSTR? NcaseTYPEERR 3PICK       * 45155
              TYPECMP? NcaseTYPEERR BINT3        * 45164
              {}N ;                              * 45173
            BINT4 #= NcaseTYPEERR DUPTYPECSTR?   * 4517D
            NcaseTYPEERR OVER                    * 45191
            TYPECSTR? NcaseTYPEERR 3PICK         * 4519B
            AxTick? NcaseTYPEERR 4PICK           * 451AA
            TYPECMP? NcaseTYPEERR BINT4          * 451B9
            {}N ;                                * 451C8
          BINT3 PutBackPPAR(_,s) ;               * 451D2

* refs (1): 4C643
drax~1:
        :: 2DUP 5PICK DUPTYPELIST? IT CARCOMP    * 451E1
          C%>% DUP 8UNROLL OVER 9rolld drax~6 DUP %0>= OVER 6PICK #1- * 451FF
          UNCOERCE %<= AND IT                    * 45236
          :: SWAP 4UNROLLDUP COERCE BINT0 OVER5PICK #1- OVER DRAWLINE#3 * 4524A
            6PICK drax~3 DROP DUPTYPEREAL? ITE   * 45277
            :: DUP%0= case2drop 4ROLLSWAP        * 45290
              6ROLL 4UNROLL DUP %>%% 10GETLAM %%* BINT10 PICK GETXMIN %- ROT * 452A4
              %MOD GETXMIN %+ %>%% 10GETLAM %%* 6GETLAM %%+ GETXMAX %>%% * 452DB
              10GETLAM %%* 6GETLAM %%+ SWAP BEGIN 2DUP %%>= drax~2 WHILE * 4530D
              :: 8PICK OVER %%>% # 2A01 %RND# COERCE 6PICK drax~4 3PICK %%+ ; * 4533F
              REPEAT 4DROP ;                     * 45380
            :: DUP#0= case2drop 4ROLLSWAP        * 4538F
              4PICK 2DUP #> case                 * 453A3
              :: 3DROP 4ROLLSWAP ;               * 453B7
              7PICK DUP %0< DUPUNROT IT %CHS     * 453CB
              COERCE 4PICK #/ DROP 4PICK SWAP ROT ITE #- SWAPDROP * 453E9
              DO 5PICK INDEX@ 4PICK drax~4 DUP +LOOP 2DROP 4ROLLSWAP ; * 4541B
          ;                                      * 4544D
          SWAPDUP %0>= OVER5PICK #1- UNCOERCE %<= AND NOTcase 7DROP * 45452
          SWAP 4UNROLL COERCEDUP ZEROOVER 6PICK #1- DRAWLINE#3 5ROLL drax~3 * 4547F
          SWAPDROP DUPTYPEREAL? case             * 454AC
          :: DUP%0= case 7DROP                   * 454BB
            DUP %>%% 9GETLAM %%* 7PICK GETYMIN %- ROT %MOD GETYMIN %+ %>%% * 454CF
            9GETLAM %%* 5GETLAM SWAP %%- BEGIN DUP %%0>= drax~2 WHILE * 4550B
            :: 4PICK 4PICK 3PICK %%>% # 2A01 %RND# COERCE drax~5 DROP OVER * 4553D
              %%- ;                              * 45579
            REPEAT BINT8 NDROP ;                 * 45583
          DUP#0=case 7DROP                       * 45597
          DUP 5PICK #> case 7DROP                * 455A1
          5UNROLL SWAP 4ROLL DUP %0< DUPUNROT IT %CHS * 455BA
          COERCE 6PICK #/ DROP 6PICK SWAP ROT ITE #- SWAPDROP * 455E2
          4ROLL SWAP DO OVERINDEX@ drax~5 3PICK +LOOP 5DROP ; * 45614

* refs (2): 45335 45533
drax~2:
        :: NoAttn?Semi ATTNFLGCLR FLUSHKEYS DROPFALSE ; * 45641
        BSS     23                               * 4565F

* #len -> $
* refs (4): 8E767 AE482 B99F7 D09FD
Blank$:
        XLIB Blank$~1                            * 45676

* refs (2): 46B01 4D8B2
* -> pict: PICTURE PICT→ key: copy PICT to the stack, and count one more object to leave behind (lam 'SAVEDDEPTH)
PictKeyPICT>:
        :: TakeOver CROSSMARKOFF GBUFF TOTEMPOB CK0NOLASTWD Π'SAVEDDEPTH #1+ * 45681
          ' Π'SAVEDDEPTH STO CROSSMARKON ;       * 456A9

* refs (6): 0C95B 0C960 0C965 0C96A 46B40 47FE0
* { "" bad key }: an empty menu key
{GRAPH\BLANK}:
        { NULL$                                  * 456C2
          :: CHECKMENU DoBadKey ; }              * 456CC

* refs (6): 45BC0 4EC26 4EEA6 735D0 737D8 7381E
~BINT23;GETLAM:
        :: BINT23 GETLAM ;                       * 456E5

* refs (1): 3E7AB
{GRAPH\SUä}~1:
        :: CHECKMENU ?NEWMARK CROSSMARKOFF ~8GETLAM;7GETLAM ORDERXY# #1+ * 456F9
          SWAP#1+SWAP GBUFF 5UNROLL SUBGROB CK0NOLASTWD Π'SAVEDDEPTH #1+ ' * 4571C
          Π'SAVEDDEPTH STO CROSSMARKON ;         * 45744

* refs (1): 3E7CA
~CHECKMENU;PictKeyDEL:
        :: CHECKMENU PictKeyDEL ;                * 45758

* refs (2): 46AA4 4D80D
* -> : PICTURE ERASE key: clear all of PICT
PictKeyERASE:
        :: TakeOver CROSSMARKOFF GBUFF ZEROZERO GBUFFGROBDIM SWAP * 4576C
          GROB!ZERODRP CROSSMARKON ;             * 4578F

* refs (9): 45703 477E5 4E3ED 4E564 4E5F0 4E63B ...
* -> : with no mark set, set one and leave the caller: commands that work between mark and cursor take the first press to set the mark
?NEWMARK:
        :: CURRENTMARK? ?SEMI                    * 4579E
          RDROP NEWMARK ;                        * 457AD

* refs (1): C01A7
OBJ_457BC:
        :: 15GETLAM DUP 21GETLAM                 * 457BC

Π'dependvar:
          LAM 'dependvar '                       * 457D0

Π'u:
          LAM 'u                                 * 457F0

Π'Ystp:
          LAM 'Ystp 7ROLL                        * 457FB
          :: #SKIPOBS                            * 45811
            :: 4DROP RDROP ;                     * 4581B
            :: 4ROLL %CHS 4UNROLL ;              * 4582F
            :: 3DROP %- RDROP ; %CHS DUP ROT 'EvalNoCK:_sup xSTO+ * 45848
            'EvalNoCK:_sup xSTO+ DROP ;          * 4587A

* refs (2): 4597C 462BC
* %x -> : trace: move the cursor to the point for x, or report "undefined" if EQ doesn't give a value there. The value is kept in lam 25
TraceFcnTo:
          :: PlotEvalAt ?SKIP TraceUndef         * 4588E
            DUPTYPECMP? NOTcasedrop TraceUndef   * 458A2
            DUP ~BINT25;PUTLAM C%>% TraceCursorTo ; * 458B1
        ;                                        * 458CA

* refs (1): 57162
PcontourPictStart~1:
        :: XLIB PContourEq PcontourPictStart~2 ; * 458CF

* refs (1): 45C71
YSlicePictStart~1:
        :: Plot3DBind XLIB YSliceSetup XLIB YSliceFrames ; * 458E9

* refs (2): C029B C038F
OBJ_4590E:
        :: 15GETLAM DUP 21GETLAM 4ROLL           * 4590E
          :: #SKIPOBS                            * 45927
            :: DROP RDROP ; %CHS                 * 45931
            :: %- RDROP ; %CHS                   * 4594A
            :: %- RDROP ; ;                      * 45963
          TraceFcnTo ;                           * 4597C

* refs (1): C0415
OBJ_45986:
        :: OBJ_45AF0                             * 45986

* refs (1): 45A11
OBJ_45990:
          ::                                     * 45990

* refs (3): 45A2A 45A68 45C8F
OBJ_45995:
            :: '                                 * 45995

Π'PPAR:
              LAM 'PPAR undo casedrop NOP        * 4599F
              RDROP ;                            * 459BF
            XLIB GridRestore ;                   * 459C9
          ABND ;                                 * 459D9

* refs (1): C041A
OBJ_459E3:
        ::                                       * 459E3

* refs (3): 44FF7 4500B 45CB3
OBJ_459E8:
          :: ERRSET XLIB PlotEnvAbort ERRTRAP COLA ~'R;EVAL;ERRJMP * 459E8
          ;                                      * 45A0C
          OBJ_45990 ;                            * 45A11

* refs (1): C0321
OBJ_45A1B:
        :: OBJ_45AF0                             * 45A1B

* refs (1): 45010
OBJ_45A25:
          :: OBJ_45995 XLIB GridRestore XLIB ParSurfRestore ; ABND ABND ; * 45A25

* refs (2): C05FD C06F1
OBJ_45A59:
        :: OBJ_45AF0                             * 45A59

* refs (1): 44FFC
OBJ_45A63:
          :: OBJ_45995 XLIB SlopePurge XLIB SlopeRestore ; ABND ABND ; * 45A63
        FILLTO  #45AE0                           * 45A97  73 zero nibbles: the next entry stays at #45AE0

* refs (3): 8D308 8D3C8 8E463
GetMat/Vec:
        XLIB GetMat/Vec~1                        * 45AE0

* refs (1): C022D
OBJ_45AEB:
        ::                                       * 45AEB

* refs (4): 4598B 45A20 45A5E 45C85
OBJ_45AF0:
          :: GraphicExit DUP NOTcase             * 45AF0
            :: RDROP ;                           * 45B04
            XLIB PlotEnvExit '                   * 45B13

'Nx:
            LAM 'Nx undo caseDROP RDROP          * 45B23
          ;                                      * 45B3F

* refs (1): 45BA7
OBJ_45B44:
          :: '                                   * 45B44

'Ystp:
            LAM 'Ystp undo NOT?SEMI              * 45B4E
            DROP XLIB Plot3DRestore ;            * 45B69
          ABND ABND ;                            * 45B7E

* refs (1): C0232
OBJ_45B8D:
        :: ERRSET XLIB PlotEnvAbort ERRTRAP OBJ_45B44 ERRJMP ; * 45B8D

* refs (6): C01AC C02A0 C0394 C0488 C057C C0670
OBJ_45BB6:
        :: DROP ~BINT23;GETLAM BINT4 NTHCOMPDROP BINT26 PUTLAM OBJ_47268 * 45BB6
          TRUE ;                                 * 45BDE

* refs (3): 45816 4592C 46258
* #n -> : skip n objects of the runstream (0 skips none). 3D-plot key handlers use it to pick the code for a key from the #n before them
#SKIPOBS:
        CON(5)  (*)+5                            * 45BE8  primitive code object
        ASSEMBLE
        A=B     A                                * 45BED
        R0=A.F  A                                * 45BEF
        GOSBVL  POP#                             * 45BF5
        B=A     A                                * 45BFC
        B=B-1   A                                * 45BFE
        GOC     #SKIPOBS.L2                      * 45C00
#SKIPOBS.loop1:
        GOSBVL  SKIPOB                           * 45C03
        B=B-1   A                                * 45C0A
        GONC    #SKIPOBS.loop1                   * 45C0C
#SKIPOBS.L2:
        A=R0.F  A                                * 45C0F
        B=A     A                                * 45C15
        A=DAT0  A                                * 45C17
        D0=D0+  5                                * 45C1A
        PC=(A)                                   * 45C1D
        BSS     14                               * 45C21  zeros
        RPL

* refs (8): 8E374 8E6F9 8EEF6 8F044 8F14F 8F18B ...
RowElt#:
        XLIB RowElt#~1                           * 45C2F

* refs (1): C05F8
* -> : SLOPEFIELD: element 13 of the plot info, run on entering PICTURE
SlopePictStart:
        :: OBJ_73230                             * 45C3A
          :: Pict3DPrep SlopePictStart~1 ; ;     * 45C44

* refs (1): C0504
* -> : YSLICE: element 13 of the plot info, run on entering PICTURE
YSlicePictStart:
        :: OBJ_73230                             * 45C5D
          :: Pict3DPrep YSlicePictStart~1 ; ;    * 45C67

* refs (1): C0509
OBJ_45C80:
        :: OBJ_45AF0                             * 45C80

* refs (1): 45CB8
OBJ_45C8A:
          :: OBJ_45995 XLIB YSliceRestore ; ABND ; * 45C8A

* refs (1): C050E
OBJ_45CAE:
        :: OBJ_459E8 OBJ_45C8A ;                 * 45CAE

* refs (1): 462D0
~BINT3;#<:
        :: BINT3 #< ;                            * 45CC2
        FILLTO  #45D1F                           * 45CD6  73 zero nibbles: the next entry stays at #45D1F

* refs (7): 8DD84 8DDAE 8E71C 8EEE2 8F02B 8F140 ...
GetElt:
        XLIB ~RowElt#;PULLEL;SWAPDROP            * 45D1F

* refs (1): 4612A
* % #width -> $: format a number in at most #width characters, using SCI with as many digits as fit if the plain form is too long
%>$Fit:
        :: OVER %0= case2drop tok0               * 45D2A
          2DUPSWAP %0< IT #1-                    * 45D43
          3PICK %EXPONENT DUPUNROT %ABSCOERCE DUPUNROT OVER#< case %>$Fit~1 * 45D57
          #3- ROT %0< IT #1-                     * 45D7F
          SWAP #Digits #- SWAPDROP BINT12 OVER#< IT DROPZERO * 45D98
          savefmt1 ERRSET                        * 45DC0
          :: DOSCI ->StkStr22! ; ERRTRAP ederr rstfmt1 ; * 45DCA

* refs (1): 45D7A
%>$Fit~1:
        :: 3DROP SWAP EDITDECOMP$ DUPLEN$ 3PICK #> NOTcase SWAPDROP * 45DF2
          BINT1 ROT SUB$ ;                       * 45E1F

* refs (1): 45D9D
* # -> #: decimal digits of a number below 1000: 1, 2 or 3
#Digits:
        :: BINT10 OVER#> casedrop BINT1          * 45E33
          BINT100 OVER#> casedrop BINT2          * 45E4C
          DROP BINT3 ;                           * 45E60

* refs (1): 46134
* $ #width -> $': pad with spaces on the left to #width
PadLeft$:
        :: OVER LEN$ 2DUP#> NOTcase2DROP #-      * 45E6F
          14SPACES$ BINT1 ROT SUB$ SWAP !!append$ ; * 45E8D

* refs (15): 45F3B 45F62 45FF3 46148 4A3DD 4A4D1 ...
* $ ob -> $': append ob, decompiled for editing
DECOMP&$:
        :: EDITDECOMP$ &$ ;                      * 45EB0

* refs (2): B6349 C6A04
* -> : make sure the plot parameters exist (rebuild them as FUNCTION if they are bad) and reset PICT to the default size
ResetPICT:
        :: AtUserStack ERRSET GETPTYPE ERRTRAP   * 45EC4
          :: ERRORCLR DropSysObs 'IDFUNCTION ; MAKEPVARS DROP PUTPTYPE * 45EDD
          ZEROZERO MAKEPICT# ;                   * 45F05

* refs (1): 3C491
* -> : PLOT menu review: Indep, Depnd, Xrng, Yrng and Res on rows 3 to 7
ReviewPlot:
        :: Chk&BreakPPAR $ "Indep: " 6ROLL DECOMP&$ DISPROW3 $ "Depnd: " * 45F14
          SWAP DECOMP&$ DISPROW4 2DROP 3UNROLL DUPTYPECMP? NOT?INVPPAR C%>% * 45F5D
          ROT DUPTYPECMP? NOT?INVPPAR C%>% 4ROLLROT * 45F85

_Xrng:_:
          $ "Xrng:" Range$ DISPROW5              * 45F9E

_Yrng:_:
          $ "Yrng:" Range$ DISPROW6 $ "Res: " SWAP DECOMP&$ DISPROW7 * 45FBC
          SetDA2OKTemp ;                         * 45FFD
