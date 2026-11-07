* HP 48GX ROM revision R, #42023-#4400B: GETKEY, busy annunciator, cursor and edit-line echo, INPUT, the interactive stack
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ?ATTNQUIT KEYINBUFFER? ?ATTNQUIT0 Cursor&Disp DelCursChr OnTheFirstCol? NoAttn?Semi LCursor ATTN? ToTheEndOfRow IStack UCursor
* Follows on from the previous file (at #42023 in the original ROM).
        RPL

* refs (1): 42000
~TakeOver;TRUE;1PUTLAM:
        :: TakeOver TRUE 1PUTLAM ;               * 42023

* -> ob
* refs (4): 385C5 38B1D 4205F 6B9DE
GetKeyOb:
        :: ?BlinkCursor GETKEY* NOBLINK case H/WKey>KeyOb * 4203C
          NOTcase GetKeyOb                       * 4205A
          CtlAlarm! ' DoCAlarmKey ;              * 42064

* ->
* refs (1): 42041
?BlinkCursor:
        :: EditLExists? DA2bEdit? AND ITE ?BlinkCursor~1 NOBLINK * 42078
        ;                                        * 4209B

* -> #kc T -> F F -> {Alrmlist} T F
* refs (1): 42046
GETKEY*:
        :: NoIgnoreAlm GETKEY caseTRUE ATTN?     * 420A0
          case ATTNxcp                           * 420B9
          ALARM? case ALARMxcp                   * 420C3
          TIMEOUT? case SLEEPxcp                 * 420D2
          UART? case UARTxcp                     * 420E1
        ;                                        * 420F0

* refs (1): 420BE
ATTNxcp:
        :: ATTNFLGCLR FLUSHKEYS BINT45 GetKeyDone ; * 420F5

* refs (2): 2DB1C 420CD
ALARMxcp:
        :: ClrTimeout FLUSHKEYS ALARMxcp~1 FALSE ; * 42113

* refs (1): 420DC
SLEEPxcp:
        :: TurnOff FalseFalse ;                  * 42131

* refs (1): 420EB
UARTxcp:
        :: FLUSHRSBUF FalseFalse ;               * 42145

* -> #kc flag
* refs (3): 17FC0 2D9CD 420AA
GETKEY:
        :: ATTN? case ~BusyOn;FALSE              * 42159
          GETTOUCH case GetKeyDone               * 4216D
          GETKEY~3 CursorStateOn GETKEY~1 BEGIN GETKEY~2 IT * 4217C
          :: 2RDROP ~BusyOn;FALSE ;              * 4219A
          T1Count? ?SKIP GETKEY~1                * 421AE
          IdleSleep GETTOUCH UNTIL GetKeyDone ;  * 421BD

* refs (3): 42109 42177 421CC
* Busy back on and the timeout cleared. TRUE: a key has come
GetKeyDone:
        :: BusyOn ClrTimeout ClrDouseAlm TRUE ;  * 421D6

* refs (2): 42168 421A4
~BusyOn;FALSE:
        :: BusyOn FALSE ;                        * 421F4

* refs (1): 42190
GETKEY~2:
        :: ATTN? caseTRUE KEYINBUFFER?           * 42208
          caseFALSE UART?                        * 4221C
          caseTRUE TIMEOUT?                      * 42226
          caseTRUE GETKEY~4                      * 42230
          caseFALSE ALARM?                       * 4223A
        ;                                        * 42244

* refs (3): 17FED 420E1 42221
UART?:
        :: UART?~1 OBJ_42309 AND ;               * 42249

* -> flag
* refs (8): 17FCF 2DAEF 420B4 4215E 4220D 42461 ...
ATTN?:
        CON(5)  (*)+5                            * 42262  primitive code object
        ASSEMBLE
        AD0EX                                    * 42267

addrATTNFLG:
        D0=(5)  ATTNFLG                          * 4226A
        C=DAT0  A                                * 42271
        D0=A                                     * 42274
        ?C#0    A                                * 42277
        GOYES   adrTIMEOUTCLK.L1                 * 4227A
        GONC    adrTIMEOUTCLK.L1                 * 4227C

* refs (4): 17FDE 2DB3A 420D2 4222B
TIMEOUT?:
        CON(5)  (*)+5                            * 4227F  primitive code object

* refs (1): 4227F
adrTIMEOUTCLK:
        LC(5)   TIMEOUTCLK                       * 42284
        CD1EX                                    * 4228B
        C=DAT1  S                                * 4228E
        D1=C                                     * 42292
        ?C=0    S                                * 42295
        GOYES   adrTIMEOUTCLK.L1                 * 42298
adrTIMEOUTCLK.L1:
        GOVLNG  PushT/FLoop                      * 4229A

* -> flag
* refs (4): 041B1 2DB0D 420C3 4223F
ALARM?:
        CON(5)  (*)+5                            * 422A1  primitive code object
        CD0EX                                    * 422A6
        GOSUB   AlarmsDue?                       * 422A9
        CD0EX                                    * 422AD
        GOTO    adrTIMEOUTCLK.L1                 * 422B0

* refs (1): 422A9
* -> carry set when the nibble ALARMSDUE is not zero
AlarmsDue?:
        D0=(5)  ALARMSDUE                        * 422B4
        C=DAT0  S                                * 422BB
        ?C#0    S                                * 422BF
        RTNYES                                   * 422C2
        RTNCC                                    * 422C4

* refs (1): 386E2
?FlashAlert~1:
        CON(5)  (*)+5                            * 422C6  primitive code object
        CD0EX                                    * 422CB
        GOSUB   PastDue?                         * 422CE
        CD0EX                                    * 422D2
        GOTO    adrTIMEOUTCLK.L1                 * 422D5

* refs (1): 422CE
* -> carry set when the nibble PASTDUE is not zero
PastDue?:
        D0=(5)  PASTDUE                          * 422D9
        C=DAT0  S                                * 422E0
        ?C#0    S                                * 422E4
        RTNYES                                   * 422E7
        RTNCC                                    * 422E9

* refs (1): 4224E
UART?~1:
        CON(5)  (*)+5                            * 422EB  primitive code object
        AD1EX                                    * 422F0
        D1=(5)  uart_buf_end                     * 422F3
        C=DAT1  X                                * 422FA
        AD1EX                                    * 422FE
        ?C#0    X                                * 42301
        GOYES   adrTIMEOUTCLK.L1                 * 42304
        GONC    adrTIMEOUTCLK.L1                 * 42306

* refs (2): 42253 85605
OBJ_42309:
        CON(5)  (*)+5                            * 42309  primitive code object
        LC(3)   #202                             * 4230E
        GOVLNG  ClrISF20B.L1                     * 42313

* refs (4): 041AC 041D9 421DB 421F9
* Turns on the busy annunciator
BusyOn:
        CON(5)  (*)+5                            * 4231A  primitive code object
        AD1EX                                    * 4231F
        GOSUB   BusyOn.L1                        * 42322
        AD1EX                                    * 42326
        A=DAT0  A                                * 42329
        D0=D0+  5                                * 4232C
        PC=(A)                                   * 4232F
BusyOn.L1:
        D1=(5)  ANNUNCIATORS                     * 42333
        C=DAT1  B                                * 4233A
        CBIT=1  7                                * 4233D
        DAT1=C  B                                * 42342
        D1=(5)  ANNCTRL                          * 42345
        C=DAT1  B                                * 4234C
        CBIT=1  4                                * 4234F
        DAT1=C  B                                * 42354
        RTN                                      * 42357

* refs (1): 0495D
* Turns off the busy annunciator
BusyOff:
        D1=(5)  ANNUNCIATORS                     * 42359
        C=DAT1  B                                * 42360
        CBIT=0  7                                * 42363
        DAT1=C  B                                * 42368
        D1=(5)  ANNCTRL                          * 4236B
        C=DAT1  B                                * 42372
        CBIT=0  4                                * 42375
        DAT1=C  B                                * 4237A
        RTN                                      * 4237D

* refs (1): 423F8
* Starts the auto-off timeout, in RPL
SetTimeout:
        CON(5)  (*)+5                            * 4237F  primitive code object
        GOSBVL  SAVPTR                           * 42384
        ST=0    15                               * 4238B
        GOSUB   settimeout                       * 4238E
        GOTO    ClrTimeout.L1                    * 42392

* refs (3): 1800B 42118 421E0
* Stops the auto-off timeout, in RPL
ClrTimeout:
        CON(5)  (*)+5                            * 42396  primitive code object
        GOSBVL  SAVPTR                           * 4239B
        ST=0    15                               * 423A2
        GOSUB   clrtimeout                       * 423A5
ClrTimeout.L1:
        GOSBVL  AllowIntr                        * 423A9
        P=      0                                * 423B0
        SETHEX                                   * 423B2
        GOVLNG  GETPTRLOOP                       * 423B4

* refs (1): 4238E
settimeout:
        GOSBVL  GetTimChk                        * 423BB
        A=C     W                                * 423C2
        GOSBVL  Ticks10Min                       * 423C5
        A=A+C   W                                * 423CC
        GOTO    clrtimeout.L1                    * 423CF

* refs (1): 423A5
clrtimeout:
        A=0     W                                * 423D3
clrtimeout.L1:
        GOSBVL  SetNextAlarm                     * 423D6
        GOVLNG  SetT2WakeClk                     * 423DD
        RPL

* refs (1): 4217C
GETKEY~3:
        :: NoEditLine? ?SKIP ArmKeyPollOb        * 423E4
          SetTimeout ;                           * 423F8

* -> flag
* refs (23): 19B2B 19CBD 395A1 39B8A 3A1CF 42217 ...
KEYINBUFFER?:
        :: CHECKKEY NOTcaseFALSE DROPTRUE        * 42402
        ;                                        * 42416

* refs (13): 141A8 18E27 1A7BF 22F31 2308A 23153 ...
* -> : if ATTN was pressed, clear it, flush the keys, clear the command name and ABORT (?ATTNQUIT plus CK0NOLASTWD)
?ATTNQUIT0:
        :: NoAttn?Semi ATTNFLGCLR FLUSHKEYS CK0NOLASTWD ABORT ; * 4241B

* ->
* refs (43): 02FB2 0CAA5 16A22 186A2 21015 2377C ...
?ATTNQUIT:
        :: NoAttn?Semi ATTNFLGCLR FLUSHKEYS ABORT ; * 4243E

* ->
* refs (10): 34153 3417B 341A3 341CB 341F3 3421B ...
NoAttn?Semi:
        :: ATTN? ?SEMI                           * 4245C
          RDROP ;                                * 4246B

* refs (4): 2DB30 4206E 6BA29 6BA2E
DoCAlarmKey:
        :: TakeOver #CAlarmErr ERROROUT ;        * 42475

* refs (2): 2DB2B 42064
CtlAlarm!:
        CON(5)  (*)+5                            * 4248E  primitive code object
        ASSEMBLE
        LC(5)   CtlAlarm                         * 42493
        GOVLNG  CONTEXT!.L1                      * 4249A

* refs (1): 38962
CtlAlarm@:
        CON(5)  (*)+5                            * 424A1  primitive code object
        LC(5)   CtlAlarm                         * 424A6
        GOVLNG  SysPtr@                          * 424AD

* refs (1): 38953
SysErrorTrap~2:
        CON(5)  (*)+5                            * 424B4  primitive code object
        LC(5)   CtlAlarm                         * 424B9
        GOVLNG  CONTEXT!.L4                      * 424C0

* refs (1): 3FF02
ResetKeyState~1:
        CON(5)  (*)+5                            * 424C7  primitive code object
        LC(5)   CtlAlarm                         * 424CC
        GOVLNG  CONTEXT!.L3                      * 424D3
        RPL

* refs (2): 3B4D2 432B4
DCursor:
        :: LastERow? ?SEMI                       * 424DA
          OBJ_4285E CURSOR@ OBJ_4482D DROP #- #+ #1+ CURSORPART+1 OBJ_4482D * 424E9
          OBJ_428F9 OBJ_426C4 ;                  * 42516

* refs (3): 3DED6 43291 4331D
ToTheLastRow:
        :: CURSORPART=Last SizeOfComLine OBJ_4482D OBJ_42804 SETCURSOR * 42525
          EDITPARTS BINT3 2DUP#> NOTcase2DROP #- * 42543
          TOPLINE! OBJ_426C4 ;                   * 4255C

* refs (8): 3B482 3B654 3E4A2 3E67F 40724 40E15 ...
LCursor:
        :: OnTheFirstCol? ?SEMI                  * 4256B
          CURSOR-1 CURSOR_OFF BINT2 OVER#> FIRSTC@ #0<> AND casedrop * 4257A
          FIRSTCHAR-1                            * 425A2
          #1- CURSOROFFSET! ;                    * 425A7

* refs (1): 3DEA9
ToTheStartOfRow:
        :: EdRowStart# SETCURSOR CURSOR_OFF0 SETFIRSTC_0 ; * 425B6

* refs (6): 3B527 3B64F 3E6CA 40765 432F5 4337C
->OnTheRow:
        :: CURSOR_END? ?SEMI                     * 425D4
          OBJ_42615 ;                            * 425E3

* refs (7): 3DF03 3EE5B 3EE88 3EEBF 428B8 432D2 ...
ToTheEndOfRow:
        :: BEGIN CURSOR_END? NOT WHILE OBJ_42615 REPEAT ; * 425ED

* refs (2): 425E3 42606
OBJ_42615:
        :: CURSOR+ #EdLastCol CURSOR_OFF #- DUP#0=csedrp FIRSTC+ BINT1 * 42615
          #>case CURSOR_OFF+                     * 4263D
          CURSOR_END? case CURSOR_OFF+           * 42647
          FIRSTC+ ;                              * 42656

* refs (6): 3B3A5 3EE83 3EEB5 3EEBA 3EEE2 428B3
UCursor:
        :: TopERow? ?SEMI                        * 42660
          OBJ_42886 EdRowStart# #1- CURSORPART-1 OBJ_4482D OBJ_42804 * 4266F
          SETCURSOR OBJ_426C4 ;                  * 4268D

* refs (1): 3DDED
ToTheFirstRow:
        :: ~BINT1;TOPLINE! CURSORPART=1 BINT0 OBJ_4482D OBJ_428F9 OBJ_426C4 ; * 4269C

* refs (4): 4251B 42561 42692 426BA
OBJ_426C4:
        :: CURSOR_OFF #EdLastCol #<> ?SEMI       * 426C4
          CURSOR_END? ?SEMI                      * 426DD
          LCursor ;                              * 426E7

* refs (3): 3B4AF 3DEC7 424DF
LastERow?:
        :: CurrentRow EDITPARTS #= ;             * 426F1

* refs (10): 3B44B 3B6E0 3DE9A 3E48E 3E670 3EEF1 ...
OnTheFirstCol?:
        :: FIRSTC@ #0= CURSOR_OFF #0= AND ;      * 4270A

* refs (3): 3B382 3DDDE 42665
TopERow?:
        :: CurrentRow #1= ;                      * 4272D

* refs (2): 425BB 42674
* -> #: the cursor position, less the first column and offset on the row: where the row starts
EdRowStart#:
        :: CURSOR@ FIRSTC@ CURSOR_OFF #+ #- ;    * 42741

* refs (4): 3B441 3B6DB 3E300 3E407
BegComLine?:(bip;q):
        :: CURSOR@ #0<> ?SEMI                    * 42764
          RDROP DoBadKey ;                       * 42778

* refs (4): 3B4F5 3B68B 3E382 3E4F0
EndComLine?:(bip;q):
        :: NextChrInComLine CHR_00 EQUALNOT ?SEMI * 42787
          RDROP DoBadKey ;                       * 427A0

* refs (12): 3B3A0 3B45A 3B47D 3B4CD 3B522 3DDE8 ...
Cursor&Disp:
        :: TOPLINE@ FIRSTC@ 'R EVAL FIRSTC@ #= SWAP TOPLINE@ #= cursorblink- * 427AF
          AND ?SKIP DispEditLine                 * 427E6
          OBJ_42831 cursorblink+ ;               * 427F5

* refs (2): 42539 42688
OBJ_42804:
        :: case                                  * 42804

3rolld;-(2s);+(2s):
          :: #- #- ;                             * 4280E
          DROP CURSOROFFSET! ;                   * 42822

* refs (4): 3A0DA 427F5 42994 429BC
OBJ_42831:
        :: LINESOFSTACK #1+ CurrentRow TOPLINE@ #- #+ CursorShow ; * 42831

* refs (3): 424E9 428C7 42B7A
OBJ_4285E:
        :: TOPLINE@ #3+ CurrentRow #<> ?SEMI     * 4285E
          TOPLINE+1 ;                            * 4287C

* refs (2): 4266F 428AE
OBJ_42886:
        :: TOPLINE@ CurrentRow #<> ?SEMI         * 42886
          TOPLINE-1 ;                            * 4289F

* refs (3): 3B45F 3B6EF 3E67A
PrevLineIfStart:
        :: OBJ_42886 UCursor ToTheEndOfRow ;     * 428A9

* refs (3): 3E158 3E6C5 43377
ToNextRowIfEnd:
        :: OBJ_4285E CURSOR+ CURSORPART+1 SETFIRSTC_0 CURSOR_OFF0 ; * 428C2

* refs (1): 426A1
~BINT1;TOPLINE!:
        :: BINT1 TOPLINE! ;                      * 428E5

* refs (2): 42516 426B5
OBJ_428F9:
        :: ITE SWAPDROP                          * 428F9
          :: DROPDUP CURSOROFFSET! ;             * 42908
          FIRSTC@ #+ #+ SETCURSOR ;              * 4291C

* refs (1): 3B712
* Backspace in the edit line: deletes before the cursor and redraws
EdBackspace:
        :: OnTheFirstCol? ?SEMI                  * 42935
          cursorblink- CURSOR_END? CURSOR_OFF #>1 AND DUP IT * 42944
          :: CHR_Space ROWNUM HiDispChar ;       * 42967
          LCursor DelCursChr ?SKIP DispEditLine  * 42980
          OBJ_42831 cursorblink+ ;               * 42994

* refs (1): 3B6BD
* DEL in the edit line: deletes at the cursor and redraws
EdDelete:
        :: CURSOR_END? ?SEMI                     * 429A3
          DelCursChr DispEditLine OBJ_42831 cursorblink+ ; * 429B2

* refs (11): 3B69F 3B6F4 3E42F 3E45C 3E4A7 3E50E ...
* -> : delete the character at the edit-line cursor and redisplay (DEL)
DelCursChr:
        :: DelCursChr~1 NOT?SEMI                 * 429CB
          TOPLINE@ DUP#1= caseDROP #3+           * 429DA
          EDITPARTS #> NOT?SEMI                  * 429EE
          TOPLINE-1 ;                            * 429FD

* refs (1): 429D0
DelCursChr~1:
        CON(5)  (*)+5                            * 42A07  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 42A0C
        GOSUB   CursorAddr                       * 42A13
        D0=C                                     * 42A17
        A=DAT0  B                                * 42A1A
        ?A#0    B                                * 42A1D
        GOYES   DelCursChr~1.L1                  * 42A20
        ST=0    3                                * 42A22
        GOTO    DelCursChr~1.L5                  * 42A25
DelCursChr~1.L1:
        RSTK=C                                   * 42A29
        D0=(5)  EDITLINE                         * 42A2B
        C=DAT0  A                                * 42A32
        A=C     A                                * 42A35
        B=B-C   A                                * 42A37
        LC(5)   #00030                           * 42A39
        ?B<=C   A                                * 42A40
        GOYES   DelCursChr~1.L2                  * 42A43
        D1=(5)  DSKTOP                           * 42A45
        A=DAT1  A                                * 42A4C
        C=A     A                                * 42A4F
        C=C+1   A                                * 42A51
        C=C+1   A                                * 42A53
        DAT1=C  A                                * 42A55
        D1=(5)  EDITLINE                         * 42A58
        C=DAT1  A                                * 42A5F
        C=C+1   A                                * 42A62
        C=C+1   A                                * 42A64
        DAT1=C  A                                * 42A66
DelCursChr~1.L2:
        LC(2)   #0A                              * 42A69
        B=C     B                                * 42A6D
        C=RSTK                                   * 42A70
        D0=C                                     * 42A72
        D1=C                                     * 42A75
        D1=D1+  2                                * 42A78
        C=C-A   A                                * 42A7B
        A=DAT0  B                                * 42A7D
        ST=0    3                                * 42A80
        ?A#B    B                                * 42A83
        GOYES   DelCursChr~1.L3                  * 42A86
        ST=1    3                                * 42A88
DelCursChr~1.L3:
        GOSBVL  MOVEUP                           * 42A8B
        ?ST=0   3                                * 42A92
        GOYES   DelCursChr~1.L4                  * 42A95
        D1=(5)  CR_COUNT                         * 42A97
        C=DAT1  A                                * 42A9E
        C=C-1   A                                * 42AA1
        DAT1=C  A                                * 42AA3
        GONC    DelCursChr~1.L5                  * 42AA6
DelCursChr~1.L4:
        GOSBVL  EdFirstByte                      * 42AA9
        ?A#0    B                                * 42AB0
        GOYES   DelCursChr~1.L5                  * 42AB3
        ST=1    3                                * 42AB5
DelCursChr~1.L5:
        ?ST=1   3                                * 42AB8
        GOYES   DelCursChr~1.L6                  * 42ABB
DelCursChr~1.L6:
        GOVLNG  GPPushT/FLp                      * 42ABD

* refs (2): 13BBE 42A13
* -> C.A = address of the character at the cursor, B.A = TEMPENV. The edit line ends just below the temporary environments
CursorAddr:
        D0=(5)  CURSOR                           * 42AC4
        A=0     A                                * 42ACB
        A=DAT0  A                                * 42ACD
        A=A+1   A                                * 42AD0
        A=A+A   A                                * 42AD2
        D0=(5)  TEMPENV                          * 42AD4
        C=DAT0  A                                * 42ADB
        B=C     A                                * 42ADE
        C=C-A   A                                * 42AE0
        RTN                                      * 42AE2
        RPL

* $/chr ->
* refs (4): 3B80F 3DB55 3F2BF 40477
EchoChrKey:
        :: SetDA13NoCh ?SetEditRoll ?TogU/LCase Echo1Char ; * 42AE4

* refs (2): 40DED 42AF8
* $/chr ->: adds a character, drawing it directly when it goes at the end of the row
Echo1Char:
        :: NoEditLine? OVER Char>Edit caseDROP CURSOR_OFF * 42B02
          BINT20 #< NOTcaseDROP INSERT?          * 42B20
          CURSOR_END? NOTAND caseDROP cursorblink- * 42B34
          ROWNUM HiDispChar cursorblink+ SetDA2bNoCh ; * 42B48

* refs (3): 3E11F 3EEFB 42CB5
* Adds a newline to the command line
EchoNewline:
        :: EDITPARTS BINT4 #< ?SKIP OBJ_4285E    * 42B61
          CHR_Newline InsertEcho CURSOR_OFF0 CURSORPART+1 SETFIRSTC_0 * 42B7F
          CR_COUNT+1 ;                           * 42B98

* refs (1): 443D0
~ChkNoChr0!(st);Echo$NoChr00:
        :: ChkNoChr0!(st) Echo$NoChr00 ;         * 42BA2

* $ ->
* refs (3): 42BAC 43ED1 D9B00
Echo$NoChr00:
        :: dup;BeforeRC(st)? case2drop AddInComLine(st) * 42BB6
          EchoLines ;                            * 42BCA

* $/chr ->
* refs (2): 404C2 4062A
Echo$Key:
        :: Echo$Key~1 dup;BeforeRC(st)? case2drop AddInComLine! * 42BD4
          SetDA3NoCh EchoLines ;                 * 42BED

* refs (1): 42BD9
Echo$Key~1:
        :: CkChr00 ?SEMIDROP                     * 42BFC
          #_102 JstGetTHEMESG DoWarning RDROP ;  * 42C0B

* refs (1): 42BA7
ChkNoChr0!(st):
        :: CkChr00 ?SEMI                         * 42C24
          NULLCHARERR ;                          * 42C33

* $ -> $ flag
* refs (3): 42C01 42C29 43E63
CkChr00:
        :: DUP CHR_00 ONEPOS$ #0= ;              * 42C3D

* refs (2): 42BBB 42BDE
dup;BeforeRC(st)?:
        :: BINT1 dup2;spos(st,RC) DUP#0= ;       * 42C5B

* refs (4): 3A071 3A4EC 42C65 42CC4
dup2;spos(st,RC):
        :: 2DUP CHR_Newline SWAP POS$ ;          * 42C74

* refs (2): 42BCA 42BF2
* $ ...: adds a string row by row
EchoLines:
        :: BEGIN BINT3 NDUP #1- SUB$ AddInComLine(st) EchoNewline SWAPDROP * 42C92
          #1+ dup2;spos(st,RC) #0=UNTIL DROP LAST$ AddInComLine(st) ; * 42CBF

* refs (6): 3DFC9 404EA 405D5 40657 4070B 42BE8
* $ ->: adds text to the command line, and marks the menu
AddInComLine!:
        :: ?SetEditRoll SetDA3NoCh AddInComLine(st) ; * 42CE2

* $ ->
* refs (3): 3B5E1 3B672 42B84
InsertEcho:
        :: INSERT? SWAP INSERT_MODE DUPTYPECHAR? ITE Char>Edit * 42CFB
          AddInComLine(st)                       * 42D1E
          ?SEMI                                  * 42D23
          REPLACE_MODE ;                         * 42D28

* ob -> ob'
* refs (2): 3ADE3 42E09
EditLevel1:
        :: OBJ_42D5A CharEdit ;                  * 42D32

* ob -> ob'
* refs (3): 3B49B 3D842 42E1D
ViewLevel1:
        :: OBJ_42D5A ObEdit ;                    * 42D46

* refs (2): 42D37 42D4B
OBJ_42D5A:
        :: CK1NOLASTWD DUP1LAMBIND 'REVAL ?SKIP 1GETLAM * 42D5A
          ABND ;                                 * 42D78

* refs (3): 42D3C 42DF5 42E68
CharEdit:
        :: AdjEdModes EDITDECOMP$ NULL$SWAP BINT1 BINT1 BINT0 BINT2 EditMenu * 42D82
          BINT1 TRUE BINT2 InputLine ;           * 42DAF

* ob -> ob' T -> F
* refs (2): 42D50 42E7C
ObEdit:
        :: CK&DISPATCH0                          * 42DC8
          BINT9 ObEdit~1                         * 42DD2  algebraic
          BINT14 ObEdit~1                        * 42DDC  unit
          BINT4 DoOldMatrix                      * 42DE6  array
          BINT0 CharEdit                         * 42DF0  any
        ;                                        * 42DFA

* refs (2): 3AE85 43F3A
~Roll&Do:;EditLevel1:
        :: PTR Roll&Do: EditLevel1 ;             * 42DFF

* refs (2): 3AE49 43EF4
BestEditLevel(r):
        :: PTR Roll&Do: ViewLevel1 ;             * 42E13

* # ->
* refs (2): 42E04 42E18
Roll&Do::
        :: CKNNOLASTWD DUP1LAMBIND ROLL 'REVAL AtUserStack 1GETABND UNCOERCE * 42E27
          CKNNOLASTWD UNROLL ;                   * 42E4F

* refs (4): 3ADCF 3ADD9 3AE8F 3AE99
Visit(nm):
        :: PTR Rcl&Do: CharEdit ;                * 42E5E

* refs (2): 3AE53 3AE5D
BestVisit(nm):
        :: PTR Rcl&Do: ObEdit ;                  * 42E72

* id ->
* refs (2): 42E63 42E77
Rcl&Do::
        :: DUP1LAMBIND SAFE@_HERE NOTcase SETNONEXTERR * 42E86
          'REVAL NOTcase ABND                    * 42E9F
          AtUserStack 1GETABND CK2NOLASTWD xSTONoCK ; * 42EAE

* refs (3): 42D87 43E95 D5EF7
AdjEdModes:
        :: CK&DISPATCH0                          * 42EC7
          BINT3 OnlyPrgMo                        * 42ED1  string
          BINT5 OnlyPrgMo                        * 42EDB  list
          BINT8 OnlyPrgMo                        * 42EE5  program
          BINT13 OnlyPrgMo                       * 42EEF  tagged
          BINT4 ClrAlgEntry                      * 42EF9  array
          BINT11 ClrAlgEntry                     * 42F03  binary
          BINT10 SetAlgEntry                     * 42F0D  name|local|algebraic
          BINT14 SetAlgEntry                     * 42F17  unit
          BINT0 NOP                              * 42F21  any
        ;                                        * 42F2B

* refs (4): 42ED6 42EE0 42EEA 42EF4
OnlyPrgMo:
        :: ClrAlgEntry SetPrgmEntry ;            * 42F30

* args -> $ T -> $ ob1..obn T -> ob1..obn T -> F args = $pr $line #pos #I/R #I/A #alph menu #row attn #parse
* refs (4): 42DBE 433B8 4347B 6B24B
InputLine:
        :: POLSaveUI ERRSET                      * 42F44
          :: 2SWAP 10UNROLL 10UNROLL 7ROLL InitEdLine EditString 6ROLL * 42F53
            SetCursor 5ROLL DUP#0<> ITE          * 42F7B

=1(s)?:(Ins/Ovr)Cur:
            :: #1= ITE INSERT_MODE REPLACE_MODE  * 42F8F
            ;                                    * 42FA8
            DROP                                 * 42FAD
            SetPrgmEntry 4ROLL DUP#0<> ITE       * 42FB2

=1(s)?:NoAlg/Alg:
            :: #1= ITE ClrAlgEntry SetAlgEntry   * 42FC6
            ;                                    * 42FDF
            DROP                                 * 42FE4
            ROT DUP#0<> ITE                      * 42FE9

=1(s)?:à/Noà:
            :: #1= ITE LockAlpha UnLockAlpha     * 42FF8
            ;                                    * 43011
            DROP                                 * 43016
            FALSE 4NULLLAM{} BIND ' InputLine~1 ' InputLine~2 TrueFalse * 4301B
            6ROLL 6ROLL FALSE ' 1GETLAM 'ERRJMP POLSetUI ClrDAsOK POLKeyUI * 43043
            ABND ;                               * 43070
          ERRTRAP POLResUI&Err POLRestoreUI InitEd&Modes ClrDAsOK ; * 4307A

* refs (1): 4302F
InputLine~1:
        :: DA1OK?NOTIT ?DispStatus DA2aOK?NOTIT DispILPrompt DA2bOK?NOTIT * 43098
          DispEditLine DA3OK?NOTIT ?DispMenu ClrDAsOK ; * 430B6

* ->
* refs (1): 430AC
DispILPrompt:
        :: EDITPARTS DUP BINT3 #> casedrop SetDA2aValid * 430CF
          TOADISP BINT4 SWAP#- BlankDA2a 4GETLAM BINT3 ROT Disp5x7 * 430F2
          SetDA2aValid ;                         * 4311A

* refs (1): 43039
InputLine~2:
        :: DUP BINT1 #<> SWAP BINT4 #<> AND casedrpfls BINT25 * 43124
          ?CaseKeyDef InputLEnter BINT45 ?CaseKeyDef InputLAttn DROPFALSE ; * 43156

* refs (1): 4315B
InputLEnter:
        :: TakeOver EDITLINE$ 2GETLAM #0=case    * 43179

true;dup;1Lput:
          :: TRUE DUP 1PUTLAM ;                  * 43192
          Parse.1 NOTcase                        * 431AB
          :: 5ROLLDROP ParseFail ;               * 431B5
          InitEdModes TRUE 1PUTLAM 2GETLAM BINT1 #=case TRUE * 431C9
          SWAPDROP EVAL TRUE ;                   * 431EC

* refs (1): 4316A
InputLAttn:
        :: TakeOver DAsBad? ?SEMI                * 43200
          InputLAttn~1 NOT 3GETLAM NOT ANDcase ~InitEdLine;NULL$;EditString * 43214
          FalseTrue 1PUTLAM ;                    * 43232

* refs (1): 4322D
~InitEdLine;NULL$;EditString:
        :: InitEdLine NULL$ EditString ;         * 43241

* # -> {# #'} ->
* refs (1): 42F7B
SetCursor:
        :: dLISTcase SetCursPos(li)              * 4325A
          SetCursPos(s) ;                        * 43269

* refs (1): 43264
SetCursPos(li):
        :: INNERCOMP DROPSWAP DUP#0=ITE          * 43273
          :: DROP ToTheLastRow ;                 * 43287
          :: DUPONE #= caseDROP ONE_DO           * 4329B
            DCursor LOOP ;                       * 432B4
          DUP#0=ITE                              * 432C3
          :: DROP ToTheEndOfRow ;                * 432C8
          :: DUPONE #= caseDROP ONE_DO           * 432DC
            ->OnTheRow LOOP ;                    * 432F5
        ;                                        * 43304

* refs (5): 40B65 43269 D5F6F D62C8 D9BC9
SetCursPos(s):
        :: DUP#0=ITE                             * 43309
          :: DROP ToTheLastRow ToTheEndOfRow ;   * 43313
          :: DUPONE #= caseDROP ONE_DO           * 4332C
            NextChr=0? ITE                       * 43345

drop;stop=0:
            :: DROP ExitAtLOOP ;                 * 4334F
            :: CHR_Newline EQUAL ITE ToNextRowIfEnd ->OnTheRow * 43363
            ;                                    * 43381
            LOOP ;                               * 43386
        ;                                        * 43390

* refs (1): 224D9
input(2st):
        :: BINT0 ONEONE BINT3 FALSE ZEROFALSE BINT0 InputLine ?SEMI * 43395
          ABORT ;                                * 433C2

* refs (1): 224E3
input(st,li):
        :: DUPNULL{}? caseSIZEERR                * 433CC
          { NULL$ BINT0 BINT1 BINT1 BINT2 BINT0 } * 433DB
          SWAP toLEN_DO DUPINDEX@ NTHCOMPDROP    * 43403
          :: CK&DISPATCH0                        * 43417
            BINT3 input(st,li)~string            * 43421  string
            BINT1 input(st,li)~real              * 4342B  real
            BINT5 input(st,li)~list              * 43435  list
            BINT6 input(st,li)~1                 * 4343F  name
            BINT7 input(st,li)~1                 * 43449  local
          ;                                      * 43453
          LOOP DROP INCOMPDROP FALSE ZEROFALSE 4ROLL DUP1LAMBIND InputLine * 43458
          NOTcase ABORT                          * 43480
          1GETABND #1= IT DROP                   * 4348A
        ;                                        * 4349E

* refs (1): 43426
input(st,li)~string:
        :: BINT1 ~4ROLL;PUTLIST;SWAP ;           * 434A3

* refs (1): 43430
input(st,li)~real:
        :: InputCursPos COERCE BINT2 ~4ROLL;PUTLIST;SWAP ; * 434B7

* refs (1): 4343A
input(st,li)~list:
        :: INNERCOMP BINT2 #<>case SETSIZEERR    * 434D5
          DUPTYPEREAL? 3PICK TYPEREAL? ANDNOTcase SETSIZEERR * 434EE
          4UNROLL InputCursPos COERCE 4ROLL COERCE TWO{}N BINT2 * 43507
          ~4ROLL;PUTLIST;SWAP ;                  * 4352A

* refs (2): 43444 4344E
input(st,li)~1:
        :: DUP'                                  * 43534

ALG:
          ID ALG EQUAL OVER'                     * 4353E

ΠALG:
          LAM ALG EQUALOR casedrop               * 43555
          :: BINT2 BINT4 ~4ROLL;PUTLIST;SWAP ;   * 4356C
          DUP'                                   * 43585

à:
          ID α EQUAL OVER'                       * 4358A

Πà:
          LAM α EQUALOR casedrop                 * 4359D
          :: BINT1 BINT5 ~4ROLL;PUTLIST;SWAP ;   * 435B0
          DUP'                                   * 435C9

V:
          ID V EQUAL SWAP'                       * 435CE

ΠV:
          LAM V EQUALOR NcaseSIZEERR BINT1       * 435E1
          BINT6 ~4ROLL;PUTLIST;SWAP ;            * 435F9

* refs (2): 434BC 4350C
* Keeps the cursor position argument of INPUT: a negative one selects replace mode
InputCursPos:
        :: DUP4UNROLL %0_2A2B4 %< ITE BINT2 BINT1 * 43608
          BINT3 ~4ROLL;PUTLIST;SWAP ROT %ABS ;   * 4362B

* refs (7): 434AD 434CB 4352A 4357B 435BF 435FE ...
~4ROLL;PUTLIST;SWAP:
        :: 4ROLL PUTLIST SWAP ;                  * 43644

* refs (7): 3B36E 3B37D 3DDD9 3E5E4 8EB84 D51AD ...
* The interactive stack: a parameterized outer loop over the stack. Locals: 1 exit flag, 2 pointer row on the display (1-4), 3 stack level of the pointer, 4 depth when it started
IStack:
        :: TakeOver UStackDepth #0=case          * 4365D

WarningC15:
          :: MessageC15 DoWarning SetDA23NoCh ;  * 43671
          NoEditLine? IT                         * 4368A
          :: CacheStack InitEdModes ;            * 43694
          POLSaveUI ERRSET                       * 436A8
          :: DEPTH UStackDepth #- BINT1 BINT4 FALSE 4NULLLAM{} BIND ' * 436B2
            IStackDisp ' IStackKeys TrueTrue EditLExists? 4GETLAM #0<> OR * 436E4
            ITE {STACK\ECHO}_43E31               * 4370C

RclStackMenu:
            :: ' MenuSTACK ;                     * 43716
            ONEFALSE ' 1GETLAM 'ERRJMP POLSetUI ClrDAsOK POLKeyUI ABND ; * 4372A
          ERRTRAP POLResUI&Err POLRestoreUI ClrDAsOK ; * 43757

* refs (1): 436E4
* Display action of the interactive stack: status and menu areas, and the stack rows unless keys are waiting
IStackDisp:
        :: DA2OK? ?SKIP IStackDisp2              * 43770
          DA1OK?NOTIT ?DispStatus DA3OK?NOTIT ?DispMenu ClrDAsOK ; * 43784

* refs (1): 4377F
* Draws the stack rows unless a key is waiting
IStackDisp2:
        :: KEYINBUFFER? NOTcase IStackRows       * 437A2
          SetDA2aBad SetDA2bBad ;                * 437B6

* refs (1): 437B1
* Draws four stack levels around the pointer
IStackRows:
        :: TOADISP ClrAbbrevStk 3GETLAM 2GETLAM #1-+ BINT4 ZERO_DO * 437C5
          ISTOP-INDEX OVER OVER#- #1+DUP #3+ ~4GETLAM;#+ pick(s)? * 437ED
          DispLevel1Row ISTOP-INDEX 2GETLAM #= IT \ShowPointer * 43810
          LOOP DROP SetDA2Valid ;                * 4382E

* refs (1): 436EE
* #kc #pl -> ob TRUE / FALSE: key handler of the interactive stack, by plane
IStackKeys:
        :: BINT1 #=casedrop IStackKeyN           * 43842
          BINT2 #=casedrop IStackKeyLS           * 43856
          BINT3 #=casedrop IStackKeyRS           * 43865
          2DROP 'DoBadKeyT ;                     * 43874

* refs (1): 43851
* Unshifted keys
IStackKeyN:
        :: DUP#<7 casedrpfls BINT11              * 43883
          ?CaseKeyDef IStackUp BINT17 ?CaseKeyDef IStackDown BINT26 * 43897
          ?CaseKeyDef IStackEdit BINT29 ?CaseKeyDef \DROP BINT25 ?CaseKeyDef * 438B5
          IStackEnter BINT45 ?CaseKeyDef IStackOn BINT12 #=casedrpfls BINT35 * 438D8
          #=casedrpfls BINT40                    * 438FB
          #=casedrpfls DROP                      * 43905
          'DoBadKeyT ;                           * 4390F

* refs (1): 43860
* Left-shifted keys
IStackKeyLS:
        :: DUP#<7 casedrpfls BINT11              * 43919
          ?CaseKeyDef IStackPageUp BINT17 ?CaseKeyDef IStackPageDn BINT26 * 4392D
          ?CaseKeyDef IStackEdit BINT12 #=casedrpfls BINT35 * 4394B
          #=casedrpfls BINT40                    * 43964
          #=casedrpfls DROP                      * 4396E
          'DoBadKeyT ;                           * 43978

* refs (1): 4386F
* Right-shifted keys
IStackKeyRS:
        :: DUP#<7 casedrpfls BINT45              * 43982
          #=casedrpfls BINT11                    * 43996
          ?CaseKeyDef IStackTop BINT17 ?CaseKeyDef IStackBottom BINT26 * 439A0
          ?CaseKeyDef IStackVisit BINT35 #=casedrpfls BINT40 * 439BE
          #=casedrpfls DROP                      * 439D7
          'DoBadKeyT ;                           * 439E1
        BSS     10                               * 439EB  zeros

* refs (1): 4389C
* Up key: moves the pointer up a level
IStackUp:
        :: TakeOver 3GETLAM ~DEPTH;4GETLAM;#- #1- #=case DoBadKey * 439F5
          TOADISP REPEATER BINT11 IStackUpStep SetDA123NoCh ; * 43A18

* refs (1): 43A27
* One step up, scrolling when the pointer is on the top row
IStackUpStep:
        :: 3GETLAM ~DEPTH;4GETLAM;#- #3- #= ?SEMI * 43A36
          \ShowColon 3GETLAM #1+ 3PUTLAM 2GETLAM BINT1 #=ITE * 43A54
          :: BINT3 HiScreenDnN BINT1 3GETLAM DUP #4+ ~4GETLAM;#+ pick(s)? * 43A77
            DispLevel1Row ;                      * 43AA4
          :: 2GETLAM #1- 2PUTLAM ; \ShowPointer ; * 43AAE

* refs (1): 438AB
* Down key: moves the pointer down a level
IStackDown:
        :: TakeOver 3GETLAM BINT1 #=case DoBadKey * 43AD1
          TOADISP REPEATER BINT17 IStackDownStep SetDA123NoCh ; * 43AEF

* refs (1): 43AFE
* One step down, scrolling when the pointer is on the bottom row
IStackDownStep:
        :: 3GETLAM #1= ?SEMI                     * 43B0D
          \ShowColon 3GETLAM #1- 3PUTLAM 2GETLAM BINT4 #=ITE * 43B21
          :: BINT3 HiScreenUpN BINT4 3GETLAM DUP #4+ ~4GETLAM;#+ pick(s)? * 43B44
            DispLevel1Row ;                      * 43B71
          :: 2GETLAM #1+ 2PUTLAM ; \ShowPointer ; * 43B7B

* refs (1): 43932
* Left-shift up: four levels up
IStackPageUp:
        :: TakeOver ~DEPTH;4GETLAM;#- 3GETLAM 2DUP#= case2drop DoBadKey * 43B9E
          2DUPSWAP BINT4 #MAX #4- #>ITE          * 43BC1

drop;3Lput:
          :: DROP 3PUTLAM ;                      * 43BDA
          :: #4+ 3PUTLAM DROP ; \FixRow SetDA13NoCh ; * 43BEE

* refs (1): 43941
* Left-shift down: four levels down
IStackPageDn:
        :: TakeOver 3GETLAM DUP #1= casedrop DoBadKey * 43C16
          DUP BINT5 #<ITE                        * 43C39
          :: DROPONE 3PUTLAM BINT4 2PUTLAM ;     * 43C48
          :: #4- 3PUTLAM \FixRow ; SetDA13NoCh ; * 43C66

* refs (1): 439A5
* Right-shift up: to the highest level
IStackTop:
        :: TakeOver ~DEPTH;4GETLAM;#- 3PUTLAM \FixRow SetDA13NoCh ; * 43C89

* refs (1): 439B4
* Right-shift down: to level 1
IStackBottom:
        :: TakeOver BINT1 3PUTLAM BINT4 2PUTLAM SetDA13NoCh ; * 43CAC

* refs (1): 438D8
* ENTER: leaves the interactive stack
IStackEnter:
        :: TakeOver ~TRUE;1PUTLAM ;              * 43CD4

* refs (1): 438E7
* ON: leaves the interactive stack, once the display has settled
IStackOn:
        :: TakeOver DAsBad? ?SEMI                * 43CE8
          ~TRUE;1PUTLAM ;                        * 43CFC

* refs (1): 43720
MenuSTACK:
        :: NoExitAction                          * 43D06

{MenuSTACK}:
          {                                      * 43D10

* refs (1): 43E36
{STACK\ECHO}:
            { $_ECHO \ECHO }                     * 43D15

{STACK\VIEW}:
            {                                    * 43D29

_VIEW_:
              $ "VIEW"                           * 43D2E
              { \VIEW DoBadKey \Ú>VIEW } }       * 43D40

{STACK\PICK}:
            { xPICK \PICK }                      * 43D5E

{STACK\ROLL}:
            { xROLL \ROLL }                      * 43D72

{STACK\ROLLD}:
            { xROLLD \ROLLD }                    * 43D86

{STACK\->LIST}:
            { x>LIST \->LIST }                   * 43D9A

{STACK\DUPN}:
            { xDUPN \DUPN }                      * 43DAE

{STACK\DRPN}:
            {                                    * 43DC2

_DRPN_:
              $ "DRPN" \DRPN }                   * 43DC7

{STACK\KEEP}:
            {                                    * 43DE3

_KEEP_:
              $ "KEEP" \KEEP }                   * 43DE8

{STACK\LEVEL}:
            {                                    * 43E04

_LEVEL_:
              $ "LEVEL" \LEVEL }                 * 43E09
          }                                      * 43E27
        ;                                        * 43E2C

* refs (2): 43711 43EAE
{STACK\ECHO}_43E31:
        { {STACK\ECHO} }                         * 43E31

* refs (1): 43D1F
\ECHO:
        :: TakeOver 3GETLAM ~4GETLAM;#+ PICK DUP KeyOb>$ CkChr00 NOT * 43E40
          case2drop                              * 43E6D
          :: #_102 JstGetTHEMESG DoWarning SetDA23NoCh ; * 43E72
          SWAP AdjEdModes DROP NoEditLine? ITE   * 43E90
          :: {STACK\ECHO}_43E31 BINT1 StartMenu SetDA2NoCh ; SetDA23NoCh * 43EA9
          EchoSpaceSep Echo$NoChr00 EchoSpaceSep ; * 43ECC

* refs (1): 43D45
\VIEW:
        :: TakeOver 3GETLAM UNCOERCE BestEditLevel(r) \StkChanged ; * 43EE0

* refs (1): 43D4F
\Ú>VIEW:
        :: TakeOver 3GETLAM PICK \Ú>VIEW~1 \StkChanged ; * 43F03

* refs (2): 438BA 43950
* Edits the level the pointer is at
IStackEdit:
        :: ComLine?:(bip;q) 3GETLAM UNCOERCE ~Roll&Do:;EditLevel1 * 43F26
          \StkChanged ;                          * 43F3F

* refs (1): 439C3
* VISIT on the object at the pointer
IStackVisit:
        :: ComLine?:(bip;q) 3GETLAM PICK VisitKey \StkChanged ; * 43F49

* refs (1): 43D68
\PICK:
        :: \#LEVEL PICK ~AtUserStack;SetDA13NoCh ; * 43F6C

* refs (1): 43D7C
\ROLL:
        :: \#LEVEL ROLL ~AtUserStack;SetDA13NoCh ; * 43F85

* refs (1): 43D90
\ROLLD:
        :: \#LEVEL UNROLL ~AtUserStack;SetDA13NoCh ; * 43F9E

* refs (1): 43E1D
\LEVEL:
        :: TakeOver 3GETLAM UNCOERCE ~AtUserStack;SetDA13NoCh ; * 43FB7

* refs (1): 43DB8
\DUPN:
        :: \#LEVEL NDUP ~AtUserStack;SetDA13NoCh ; * 43FD5

* refs (1): 43DD9
\DRPN:
        :: \#LEVEL NDROP \StkChanged SetDA13NoCh ; * 43FEE
