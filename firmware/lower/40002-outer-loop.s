* HP 48GX ROM revision R, #40002-#42022: Parameterized outer loop and menus
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: TakeOver MenuMaker AtUserStack InitMenu DoMenuKey %100 REPEATER MenuKey DoKeyOb Modifier MenuRow@ NoEdit?case
* Follows on from the previous file (at #40002 in the original ROM).
        RPL

* refs (1): 41012
StartMenu~2:
        :: OVER' ROMPTR 0A9 000 EQUAL IT         * 40002
          :: 2DROP LastMenuDef@ LastMenuRow@ ;   * 40021
          StartMenu~2~1 ;                        * 4003A

* refs (1): 401CA
StdMenuKeyNS~any:
        :: DUPTYPEBINT? NOTcase DoKeyOb          * 40044
          TogSysFlag SetDA2bNoCh ChkDelLastArg ; * 40058

* refs (1): 40215
StdMenuKeyLS~any:
        :: DUPTYPEBINT? NOTcase DropBadKey       * 4006C
          UNCOERCE %CHS OBJ_4015C xSF ;          * 40080

* refs (1): 40260
StdRightShift~any:
        :: DUPTYPEBINT?                          * 40099

RightShift3:
          NOTcase DropBadKey                     * 400A3
          UNCOERCE %CHS OBJ_4015C xCF ;          * 400AD

* refs (1): 401C0
StdMenuKeyNS~tagged:
        :: OBJ_4013E NOTcasedrop DoKeyOb         * 400C6
          PrgmEntry? case DoKeyOb                * 400DA
          OBJ_4015C xEVAL ;                      * 400E9

* refs (1): 4020B
StdMenuKeyLS~tagged:
        :: OBJ_4013E NOTcasedrop DoBadKey        * 400F8
          OBJ_4015C xSTO ;                       * 4010C

* refs (1): 40256
StdRightShift~tagged:
        :: OBJ_4013E NOTcasedrop DoBadKey        * 4011B
          OBJ_4015C xRCL ;                       * 4012F

* refs (3): 400CB 400FD 40120
OBJ_4013E:
        :: DUP TAG> SWAPDROP OBJ_3F0CA ;         * 4013E

* refs (8): 4008A 400B7 400E9 4010C 4012F 40300 ...
OBJ_4015C:
        :: 'R 2Ob>Seco PrgmEntry? NOTcase OBJ_408F0 * 4015C
          PutInComLine!!(_) ;                    * 4017A

* refs (70): 3EFFA C5542 C558C C55D8 C5620 C5668 ...
OBJ_40184:
        :: NoExitAction InitMenu SetDA12NoCh ;   * 40184

* ob-NS -> ? {ob-NS ob-LS ob-RS} -> ?
* refs (10): 154E1 3EF2D 41058 4A226 9E4E1 9E539 ...
StdMenuKeyNS:
        :: CK&DISPATCH0                          * 4019D
          BINT5 StdMenuKeyNS~list                * 401A7  list
          BINT14 StdMenuKeyNS~unit               * 401B1  unit
          BINT13 StdMenuKeyNS~tagged             * 401BB  tagged
          BINT0 StdMenuKeyNS~any                 * 401C5  any
        ;                                        * 401CF

* {ob-NS ob-LS ob-RS} -> ?
* refs (5): 155C7 3EF50 41067 4A23A 98FDC
StdMenuKeyLS:
        :: CK&DISPATCH0                          * 401D4
          BINT5 StdMenuKeyLS~list                * 401DE  list
          BINT6 StdMenuKeyLS~1                   * 401E8  name
          BINT7 StdMenuKeyLS~1                   * 401F2  local
          BINT14 StdMenuKeyLS~unit               * 401FC  unit
          BINT13 StdMenuKeyLS~tagged             * 40206  tagged
          BINT0 StdMenuKeyLS~any                 * 40210  any
        ;                                        * 4021A

* refs (4): 155A4 3EF73 41076 4A24E
StdRightShift:
        :: CK&DISPATCH0                          * 4021F
          BINT5 StdRightShift~list               * 40229  list
          BINT6 DoNameKeyRS                      * 40233  name
          BINT7 DoNameKeyRS                      * 4023D  local
          BINT14 StdRightShift~unit              * 40247  unit
          BINT13 StdRightShift~tagged            * 40251  tagged
          BINT0 StdRightShift~any                * 4025B  any
        ;                                        * 40265
        FILLTO  #40292                           * 4026A  40 zero nibbles: the next entry stays at #40292

* refs (1): 401AC
StdMenuKeyNS~list:
        :: BINT1 OBJ_402CE ;                     * 40292

* refs (1): 401E3
StdMenuKeyLS~list:
        :: BINT2 OBJ_402CE ;                     * 402A6

* refs (1): 4022E
StdRightShift~list:
        :: BINT3 OBJ_402CE ;                     * 402BA

* refs (3): 4029C 402B0 402C4
OBJ_402CE:
        :: NTHELCOMP ITE DoKeyOb DoBadKey        * 402CE
        ;                                        * 402E7

* refs (1): 401B6
StdMenuKeyNS~unit:
        :: ImmedEntry? NOTcase DoKeyOb           * 402EC
          OBJ_4015C x* ;                         * 40300

* refs (1): 40201
StdMenuKeyLS~unit:
        :: OBJ_4015C xCONVERT ;                  * 4030F

* refs (1): 4024C
StdRightShift~unit:
        :: OBJ_4015C x/ ;                        * 40323

* refs (4): 155A9 40238 40242 9E7C9
DoNameKeyRS:
        :: OBJ_4040E xRCL ;                      * 40337
        NIBHEX  00000                            * 4034B  ..

* refs (3): 154F0 155D6 9E55D
DoNameKeyLRS:
        :: PrgmEntry? case 2DropBadKey           * 40350
          ' ' 3UNROLL BINT3 ::N DoKeyOb ;        * 40364
        FILLTO  #403DC                           * 40387  85 zero nibbles: the next entry stays at #403DC

* refs (2): 401ED 401F7
StdMenuKeyLS~1:
        :: PrgmEntry? NOTcase                    * 403DC
          :: OBJ_4040E ROMP_0A1_00D ;            * 403EB
          OBJ_4040E xSTO ;                       * 403FF

* refs (3): 4033C 403F0 403FF
OBJ_4040E:
        :: ' x' SWAP ' xENDTIC 'R BINT4 ::N PrgmEntry? NOTcase OBJ_408F0 * 4040E
          PutInComLine!!(_) ;                    * 4044A

* ob ->
* refs (18): 385CF 38B27 3AE67 3B5B9 3D551 3EDDE ...
DoKeyOb:
        :: DUP OBJ_729F8 case DoKeyOb~1          * 40454
          CK&DISPATCH0                           * 4046D
          BINT111 EchoChrKey                     * 40472  char
          BINT3 DoKeyOb~string                   * 4047C  string
          BINT14 DoKeyOb~unit                    * 40486  unit
          BINT8 DoKeyOb~program                  * 40490  program
          BINT15 DoKeyOb~romptr                  * 4049A  romptr
          BINT9 DoKeyOb~algebraic                * 404A4  algebraic
          BINT0 OBJ_405E4                        * 404AE  any
        ;                                        * 404B8

* refs (1): 40481
DoKeyOb~string:
        :: Echo$Key SetDA1NoCh ;                 * 404BD

* refs (1): 4048B
DoKeyOb~unit:
        :: ImmedEntry? case OBJ_408F0            * 404D1
          ->StrUnit(uo) OBJ_42CE2 SetDA1NoCh ;   * 404E5

* refs (1): 40495
DoKeyOb~program:
        :: SystemLevel? case EVAL                * 404F9
          PrgmEntry? caseDrpBadKy OBJ_408F0      * 4050D
        ;                                        * 4051C

* refs (1): 4049F
DoKeyOb~romptr:
        :: ROMPTR@ ?SKIP SETROMPERR              * 40521
          DoKeyOb ;                              * 40535

* refs (1): 40468
DoKeyOb~1:
        :: DUP OBJ_2699F case PutInComLine!!(_)  * 4053F
          AlgEntry? case DoKeyOb~1~1             * 40558
          OBJ_4058F ;                            * 40567

* refs (1): 40562
DoKeyOb~1~1:
        :: ?OKINALG case OBJ_40639               * 40571
          OBJ_4058F ;                            * 40585

* refs (2): 40567 40585
OBJ_4058F:
        :: PrgmEntry? case PutInComLine!!(_)     * 4058F
          OBJ_408F0 ;                            * 405A3

* refs (1): 404A9
DoKeyOb~algebraic:
        :: AlgEntry? NOTcase OBJ_405E4           * 405AD
          OBJ_408C3 BINT2 OVERLEN$ #1-SUB$ OBJ_42CE2 SetDA1NoCh ; * 405C1

* refs (2): 404B3 405BC
OBJ_405E4:
        :: ?OKINALG AlgEntry? ANDcase OBJ_40639  * 405E4
          PrgmEntry? NOTcase OBJ_408F0           * 405FD
          PutInComLine!!(_) ;                    * 4060C

* refs (5): 4017A 4044A 40553 4059E 4060C
PutInComLine!!(_):
        :: ?ClrAlg OBJ_4072E OBJ_408C3 Echo$Key OBJ_4072E ; * 40616

* refs (2): 40580 405F8
OBJ_40639:
        :: SetDA1NoCh OBJ_26BED NOTcase          * 40639
          :: OBJ_408C3 OBJ_42CE2 ;               * 4064D
          DROP OBJ_26E61 5UNROLL 3DROP ->StrOp(_) OVER IT * 40661

_()_;+(2st):
          :: $_LRParens &$ ;                     * 40684
          :: OnTheFirstCol? ?SEMI                * 40698
            PrevChrInComLine CHR>$ 2DUPSWAP OBJ_3516C 4UNROLL3DROP NOT?SEMI * 406A7
            CHR_Space >H$ ;                      * 406C5
          :: OVER ?SEMI                          * 406D4
            DUPDUP $_XYZ OBJ_3516C 4UNROLL3DROP NOT?SEMI * 406E3
            CHR_Space >T$ ;                      * 406FC
          OBJ_42CE2 NextChrInComLine=space? IT OBJ_429CB * 4070B
          NOT?SEMI                               * 4071F
          LCursor ;                              * 40724

* refs (4): 40620 4062F 43ECC 43ED6
OBJ_4072E:
        :: INSERT? NOT?SEMI                      * 4072E
          OnTheFirstCol? ?SEMI                   * 4073D
          PrevChrInComLine CHR_Space EQUAL ?SEMI * 40747
          NextChrInComLine=space? case ->OnTheRow * 4075B
          CHR_Space Char>Edit ;                  * 4076A
        BSS     15                               * 40779

* ->
* refs (407): 0C82F 144B1 3AB76 3B5FF 3B7CC 3B7F6 ...
TakeOver:
        :: ;                                     * 40788

* refs (4): 3F07C 404FE 41297 414EE
SystemLevel?:
        CON(5)  (*)+5                            * 40792  primitive code object
        ASSEMBLE
        LA(5)   TakeOver                         * 40797
        C=DAT1  A                                * 407A1
        CD1EX                                    * 407A4
        RSTK=C                                   * 407A7
        D1=D1+  5                                * 407A9
        C=DAT1  A                                * 407AC
        ?C=A    A                                * 407AF
        GOYES   L_407EF                          * 407B2
        LA(5)   DOCOL                            * 407B4
        ?C=A    A                                * 407BE
        GOYES   L_407CE                          * 407C1
        D1=C                                     * 407C3
        C=DAT1  A                                * 407C6
        ?C#A    A                                * 407C9
        GOYES   L_407E3                          * 407CC
L_407CE:
        D1=D1+  5                                * 407CE
        C=DAT1  A                                * 407D1
        LA(5)   TakeOver                         * 407D4
        ?C=A    A                                * 407DE
        GOYES   L_407EF                          * 407E1
L_407E3:
        C=RSTK                                   * 407E3
        D1=C                                     * 407E5
        GOVLNG  PushFLoop                        * 407E8
L_407EF:
        C=RSTK                                   * 407EF
        D1=C                                     * 407F1
        GOVLNG  PushTLoop                        * 407F4
        RPL

* ->  ob
* refs (100): 3A721 3A73A 3ADF2 3AE11 3B216 3B2ED ...
MenuMaker:
        :: TakeOver 'R ;                         * 407FB

* refs (8): 1A06B 4A25D 6BF2E D6F93 D70E7 D71C9 ...
OBJ_4080F:
        :: ' MenuMaker CkSecoType ;              * 4080F

* ->
* refs (19): 3B257 3B270 3B289 3B2A2 3B2BB 3B2D4 ...
MenuKey:
        :: TakeOver 'R GETPROC ;                 * 40828

* refs (1): 6BE48
OBJ_40841:
        :: ' MenuKey CkSecoType ;                * 40841

* ->
* refs (16): 3A9D3 3AA0F 3AC20 3AF9D 3AFEB 3B020 ...
Modifier:
        :: TakeOver ;                            * 4085A

* refs (1): 6BF4C
OBJ_40869:
        :: ' Modifier CkSecoType ;               * 40869

* refs (4): 4081E 40850 40878 6BF1F
CkSecoType:
        :: OVER TYPECOL? NOTcsdrpfls OVER CARCOMP EQ ; * 40882

* -> flag
* refs (9): 154D7 155BD 402F1 404D6 9E4D7 9E52F ...
ImmedEntry?:
        :: PrgmEntry? AlgEntry? ORNOT ;          * 408AA

* refs (5): 3EF00 405C1 40625 40652 43E5E
OBJ_408C3:
        :: CK&DISPATCH0                          * 408C3
          BINT6 DECOMP$                          * 408CD  name
          BINT7 DECOMP$                          * 408D7  local
          BINT0 EDITDECOMP$                      * 408E1  any
        ;                                        * 408EB

* refs (7): 40175 40445 404E0 40517 405A3 40607 ...
OBJ_408F0:
        :: KeyOb! CacheStack EditLExists? case OBJ_4091D * 408F0
          InitEdModes OBJ_409B2 ;                * 4090E

* refs (1): 40909
OBJ_4091D:
        :: cursorblink- OBJ_40A4C NOTcase OBJ_4098A * 4091D
          '                                      * 40936

àENTER:
          ID αENTER DRPExitAtLOOP NOTcase OBJ_4098A * 4093B
          EDITLINE$ DUP SaveLastEdit InitEd&Modes SWAP OBJ_23439 AtUserStack * 4095D
          OBJ_409B2 ;                            * 40980

* refs (2): 40931 40958
OBJ_4098A:
        :: OBJ_40ABB NOTcase KeyOb0              * 4098A
          OBJ_23439 AtUserStack OBJ_409B2 ;      * 4099E

* refs (3): 40913 40980 409A8
OBJ_409B2:
        :: KeyOb@ EVAL AtUserStack KeyOb@ KeyOb0 OBJ_40A4C NOTcaseDROP ' * 409B2

áENTER:
          ID ßENTER DRPExitAtLOOP NOTcaseDROP SWAP * 409DF
          PALPTRDCMP ?SKIP                       * 40A01
          :: CK&DISPATCH0                        * 40A0B
            BINT7 ID>$                           * 40A15  local
            BINT6 ID>$                           * 40A1F  name
            BINT0 DROPNULL$                      * 40A29  any
          ;                                      * 40A33
          SWAP EVAL AtUserStack ;                * 40A38

* refs (2): 40927 409D0
OBJ_40A4C:
        :: BINT63 TestSysFlag BINT62 TestSysFlag AND ; * 40A4C

* ob ->
* refs (2): 23461 408F5
KeyOb!:
        CON(5)  (*)+5                            * 40A6F  primitive code object
        ASSEMBLE
        LC(5)   KeyOb                            * 40A74
        GOVLNG  L_08D14                          * 40A7B

* -> id/romptr
* refs (3): 2343E 409B7 409C6
KeyOb@:
        CON(5)  (*)+5                            * 40A82  primitive code object
        LC(5)   KeyOb                            * 40A87
        GOVLNG  SysPtr@                          * 40A8E

* ->
* refs (3): 3FEFD 40999 409CB
KeyOb0:
        CON(5)  (*)+5                            * 40A95  primitive code object
        LC(5)   KeyOb                            * 40A9A
        GOVLNG  L_08D2F                          * 40AA1

        CON(5)  (*)+5                            * 40AA8  primitive code object
        LC(5)   KeyOb                            * 40AAD
        GOVLNG  L_08D35                          * 40AB4
        RPL

* refs (2): 4098F 8E01C
OBJ_40ABB:
        :: Parse.1 caseTRUE ParseFail            * 40ABB
          FALSE ;                                * 40ACF

* refs (3): 40AC0 431AB D68D8
Parse.1:
        :: EDITLINE$ DUP InitEdLine ERRSET palparse ERRTRAP * 40AD9
          :: SaveLastEdit ERRJMP ; NOTcaseFALSE SWAP * 40AFC
          SaveLastEdit InitEdModes TRUE ;        * 40B1A

* ob $parsed #pos $' ->
* refs (2): 40ACA 431BF
ParseFail:
        :: DispBadToken #SyntaxErr JstGetTHEMESG DoWarning SetDA2aNoCh * 40B2E
          SetDA3NoCh ;                           * 40B4C

* ob $parsed #pos $' ->
* refs (2): 40B33 D69C4
DispBadToken:
        :: SWAPROT EditString SetCursPos(s) TOADISP OBJ_3A030 LEN$ OBJ_4426D * 40B56
          #MIN ROWNUM SWAP CURSOR_OFF OVER #-SWAP DispBadToken~1 DROP * 40B7E
          SetDA2bTemp SetDA2bEdit ;              * 40BA6

* refs (1): 3B587
EnterComLine:
        :: 'NOP OBJ_408F0 ;                      * 40BB5

* ->
* refs (48): 15039 1505C 15882 2230C 2232A 22348 ...
AtUserStack:
        :: AtUserStack~1 InitEnab ;              * 40BC9

* refs (1): D9A95
GetLastEdit:
        CON(5)  (*)+5                            * 40BDD  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 40BE2
        D0=(5)  HISTORYLEVEL                     * 40BE9
        D1=(5)  HISTORY1                         * 40BF0
        A=0     A                                * 40BF7
        A=DAT0  1                                * 40BF9
        B=A     P                                * 40BFD
        ?A=0    P                                * 40C00
        GOYES   L_40C26                          * 40C03
        C=A     A                                * 40C05
        C=C+C   P                                * 40C07
        C=C+C   P                                * 40C0A
        C=C+A   P                                * 40C0D
        AD1EX                                    * 40C10
        C=C+A   A                                * 40C13
        D1=C                                     * 40C15
        C=DAT1  A                                * 40C18
        ?C#0    A                                * 40C1B
        GOYES   L_40C35                          * 40C1E
        B=C     P                                * 40C20
        D1=A                                     * 40C23
L_40C26:
        C=DAT1  A                                * 40C26
        ?C#0    A                                * 40C29
        GOYES   L_40C35                          * 40C2C
        GOVLNG  L_0370A                          * 40C2E
L_40C35:
        B=B+1   P                                * 40C35
        LA(1)   #3                               * 40C38
        A=A&B   P                                * 40C3E
        DAT0=A  1                                * 40C42
        A=C     A                                * 40C46
        GOSBVL  GETPTR                           * 40C48
        ST=0    10                               * 40C4F
L_40C52:
        D=D-1   A                                * 40C52
        GOC     L_40C64                          * 40C54
        D1=D1-  5                                * 40C57
        DAT1=A  A                                * 40C5A
        GOVLNG  PushTLoop                        * 40C5D
L_40C64:
        GOSBVL  SUB_12D68                        * 40C64
        GOTO    L_40C52                          * 40C6B
        NIBHEX  8DAA560                          * 40C6F  Øªe
        RPL

* $ ->
* refs (4): 3883B 40967 40B01 40B1A
SaveLastEdit:
        :: HISTON? case CMDSTO                   * 40C76
          DROP ;                                 * 40C8A

* $ ->
* refs (1): 40C85
CMDSTO:
        CON(5)  (*)+5                            * 40C94  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 40C99
        LC(5)   HISTORY1                         * 40C9C
        CD0EX                                    * 40CA3
        RSTK=C                                   * 40CA6
        C=DAT0  15                               * 40CA8
        D0=D0+  5                                * 40CAC
        DAT0=C  15                               * 40CAF
        D0=D0-  5                                * 40CB3
        DAT0=A  A                                * 40CB6
        C=RSTK                                   * 40CB9
        D=D+1   A                                * 40CBB
        D1=D1+  5                                * 40CBD
        GONC    L_40CDC                          * 40CC0  always taken

* refs (3): 4439E 8D2DB D9A86
OBJ_40CC3:
        CON(5)  (*)+5                            * 40CC3  primitive code object
        LC(5)   HISTORYLEVEL                     * 40CC8
        CD0EX                                    * 40CCF
        LA(1)   #0                               * 40CD2
        DAT0=A  1                                * 40CD8
L_40CDC:
        D0=C                                     * 40CDC
        A=DAT0  A                                * 40CDF
        D0=D0+  5                                * 40CE2
        PC=(A)                                   * 40CE5
        RPL

* ->
* refs (2): 408FA 43699
CacheStack:
        :: UNDO_ON? NOT?SEMI                     * 40CE9
          SuspendOK? NOT?SEMI                    * 40CF8
          OBJ_14E6D IT ABND                      * 40D02
          SAVESTACK ERRSET ERRSET ;              * 40D11

* ->
* refs (4): 3AA28 3AFC0 43007 D7403
LockAlpha:
        :: SetLock àShiftOnly ;                  * 40D25

* ->
* refs (6): 3AFBB 4300C 443BC CDC93 CF5F3 D0807
UnLockAlpha:
        :: ClrLock SetKeysNS ;                   * 40D39

* refs (1): 3D95B
InvUserMo:
        :: BINT62 TogSysFlag ;                   * 40D4D

* refs (1): 3D96A
SetUserMo:
        :: BINT62 SetSysFlag SetUserMo~1 ;       * 40D61

* refs (1): 3FCA0
QuitUserMo:
        :: BINT62 ClrSysFlag OBJ_3FFCA ;         * 40D7A

* -> :: <ob1> <rest> ; -> :: <rest> ;
* refs (12): 3B369 3B437 3B496 3B4EB 3B57D 3B596 ...
NoEdit?case:
        :: TakeOver 'R EditLExists? caseDROP RDROP * 40D93
          InitEdModes DoKeyOb ;                  * 40DB1

* menu ->
* refs (23): 3AE02 3AE21 3B2FD 3B31C 3B33B 3B35A ...
DoMenuKey:
        :: InitMenu SetDA12NoCh ;                * 40DC0

* ->
* refs (2): 3E02B 3E084
DoDelim:
        :: TakeOver ?SetEditRoll SetDA3NoCh 'R OBJ_42B02 ; * 40DD4

* ->
* refs (8): 3AA3C 3B3D7 3BB3C 3D9EF 3DA7E 3DB6F ...
DoDelims:
        :: TakeOver ?SetEditRoll SetDA3NoCh 'R AddInComLine(st) LCursor ; * 40DF7

* refs (2): 3B3E1 3E08E
OBJ_40E1F:
        :: AlgEntry? case SetDA1NoCh             * 40E1F
          SetAlgEntry ;                          * 40E33

* ->
* refs (4): 3DA88 3E035 3E0E7 4061B
?ClrAlg:
        :: AlgEntry? case ClrAlgEntry            * 40E3D
          SetDA1NoCh ;                           * 40E51

* ->
* refs (5): 3AA46 3BB46 3DB79 3E144 3EECE
?ClrAlgSetPr:
        :: AlgEntry? NOT PrgmEntry? ANDcase SetDA1NoCh * 40E5B
          ClrAlgEntry SetPrgmEntry ;             * 40E79

* ->
* refs (20): 3B38C 3B469 3B4B9 3B50E 3B6AE 3B703 ...
REPEATER:
        :: 'R'R DUP EVAL OVER REPKEY? NOTcase2DROP VERYSLOW * 40E88
          BEGIN 2DUPSWAP REPKEY? WHILE           * 40EB0

eval;wait!:
          :: EVAL SLOW ; REPEAT 3DROP ;          * 40EC4

* ->
* refs (6): 12BA3 40ECE 9D207 9D20C 9D211 9D216
SLOW:
        CON(5)  (*)+5                            * 40EE7  primitive code object
        ASSEMBLE
        LC(5)   #00ABD                           * 40EEC
L_40EF3:
        C=C-1   A                                * 40EF3
        GONC    L_40EF3                          * 40EF5
        A=DAT0  A                                * 40EF8
        D0=D0+  5                                * 40EFB
        PC=(A)                                   * 40EFE

* ->
* refs (3): 14AD2 40EAB 49008
VERYSLOW:
        CON(5)  (*)+5                            * 40F02  primitive code object
        LC(5)   #0D6CE                           * 40F07
        GOTO    L_40EF3                          * 40F0E

* ->
* refs (1): 3893F
VERYVERYSLOW:
        CON(5)  (*)+5                            * 40F12  primitive code object
        LC(5)   #8640C                           * 40F17  delay count
        GOTO    L_40EF3                          * 40F1E
        RPL

* ob ID ->
* refs (4): 15577 3B409 3B413 9E595
XEQStoKey:
        :: 2DUP EQUALcase SETCIRCERR             * 40F22
          dup;RclInVars(gn)? NOTcase xSTO        * 40F36
          OVER 2SWAP OBJ_2157E xDROP2 ;          * 40F45

* refs (1): 3D90D
OBJ_40F5E:
        :: dup;RclInVars(gn)? NOTcase xDROP      * 40F5E
          SWAPDUP OBJ_2181B xDROP2 ;             * 40F72

* menu ->
* refs (29): 0C915 0C9D6 15357 21180 211D0 3BE6D ...
InitMenu:
        :: BINT1 DoMenuPos(li,s) ;               * 40F86

* refs (5): 40F90 4170A C58EE C6983 C73DE
DoMenuPos(li,s):
        :: MenuDef@ MenuRow@ LastMenuDef@ LastMenuRow@ 4NULLLAM{} BIND * 40F9A
          ERRSET StartMenu ERRTRAP               * 40FBD
          :: 4GETLAM 3GETLAM StartMenu 2GETLAM LastMenuDef! 1GETABND * 40FCC
            LastMenuRow! ERRJMP ;                * 40FEF
          ABND ;                                 * 40FFE

* menu #n ->
* refs (9): 387EB 38A96 38BB8 40FC2 40FDB 4138C ...
StartMenu:
        :: OBJ_41826 StartMenu~2 MenuRow! DUP StartMenu~5 StartMenu~4 * 41008
          StartMenu~3 NoClock ' SetDA12NoCh MenuRowAct! ' >MENU LabelDef! ' * 4102B
          StdMenuKeyNS MenuKeyNS! ' StdMenuKeyLS MenuKeyLS! ' StdRightShift * 41058
          MenuKeyRS! ' review ReviewKey! 'NOP OBJ_419A4 ' SaveLastMenu * 4107B
          MenuExitAct! BINT0 OBJ_41A04 StartMenu~1 StartMenu~6 SetThisRow ; * 410A3

* ->
* refs (7): 17C26 38697 3A9FB 3B225 410BC D8DC3 ...
SetThisRow:
        :: OBJ_41826 SetThisRow~1 INNERCOMP OBJ_410E9 LoadTouchTbl ; * 410C6

* refs (4): 3F438 3F660 3F6F6 410DA
OBJ_410E9:
        :: DUP#0= ?SEMI                          * 410E9
          CheckMenuRow DUP #5+ SubMetaOb ;       * 410F8

* # -> # #'
* refs (3): 3F593 3F81D 410F8
CheckMenuRow:
        :: MenuRow@ 2DUP#< NOT?SEMI              * 41111
          # FFFFB #<> ITE BINT1                  * 41125
          :: DUP#1- BINT6 #/ SWAPDROP #6* #1+ ;  * 4113E
          DUP MenuRow! ;                         * 41166

* MenuKey1 .. MenuKeyN #n ->
* refs (7): 3F43D 3F5E8 3F665 3F700 3F737 3F7AA ...
LoadTouchTbl:
        :: NullMenuKey NullMenuKey 2DUP 2DUP 7ROLL NDROP OBJ_41826 BINT7 * 41175
          ONE_DO OBJ_3A6AE BINT7 INDEX@#- DUPUNROT OBJ_04A4C OBJ_04A57 LOOP * 411A2
          OBJ_41815 ;                            * 411CA

* refs (2): 3A6BD 3A6EB
OBJ_411D4:
        :: DUP DUPTYPELIST? NOTcase OBJ_4121F    * 411D4
          BINT2 NTHELCOMP ?SKIP 'DoBadKey        * 411ED
          SWAPONE NTHELCOMP case OBJ_4121F       * 41201
          NULL$ ;                                * 41215

* refs (3): 411E8 41210 412DD
OBJ_4121F:
        :: CK&DISPATCH0                          * 4121F
          BINT6 NOP                              * 41229  name
          BINT3 NOP                              * 41233  string
          BINT31 NOP                             * 4123D  bint
          BINT111 CHR>$                          * 41247  char
          BINT8 OBJ_41292                        * 41251  program
          BINT15 OBJ_412AB                       * 4125B  romptr
          BINT12 OBJ_412EC                       * 41265  grob
          BINT14 ->StrUnit(uo)                   * 4126F  unit
          BINT13 OBJ_3F0A7                       * 41279  tagged
          BINT0 OBJ_41355                        * 41283  any
        ;                                        * 4128D

* refs (1): 41256
OBJ_41292:
        :: SystemLevel? ?SEMI                    * 41292
          OBJ_41355 ;                            * 412A1

* refs (1): 41260
OBJ_412AB:
        :: DUP ROMPTRDECOMP case                 * 412AB
          :: ID>$ SWAPDROP ;                     * 412BF
          ROMPTR@ case OBJ_4121F                 * 412D3
          NULL$ ;                                * 412E2

* refs (1): 4126A
OBJ_412EC:
        :: DUP GROBDIM NullMenuLbl GROBDIM ROT #= 3UNROLL #= AND ?SEMI * 412EC
          ->str1(go) ;                           * 41323

* refs (2): 404E5 41274
->StrUnit(uo):
        :: UNIT>$ DUP CHR_UndScore BINT1 POS$ #1+LAST$ ; * 4132D

* refs (3): 3F0BB 41288 412A1
OBJ_41355:
        :: DUPTYPEREAL? case OBJ_35264           * 41355
          DECOMP$ ;                              * 41369

* refs (4): 17BD1 38606 3880E 3886D
DoMenuMTH:
        :: NoExitAction ' DoMenuMTH~1 BINT1 StartMenu SaveLastMenu ; * 41373

* ->
* refs (3): 3BCF6 4109E 41391
SaveLastMenu:
        :: MenuRow@ LastMenuRow! MenuDef@ LastMenuDef! ; * 4139B

* refs (1): 3C402
OBJ_413B9:
        :: ' OBJ_4A5EF ReviewKey! ;              * 413B9

* refs (1): 41085
review:
        :: BINT7 ONE_DO INDEX@ DUP GETPROC >Review$ INDEX@ DISPN LOOP NULL$ * 413D2
          BINT7 DISPN SetDA12Temp SetDA3NoCh ;   * 41409

* id -> $
* refs (3): 413F0 41548 9E462
>Review$:
        :: CK&DISPATCH1                          * 41422
          BINT3 SWAPDROP                         * 4142C  string
          BINT6 OBJ_41495                        * 41436  name
          BINT7 OBJ_41495                        * 41440  local
          BINT8 >Review$~program                 * 4144A  program
          BINT5 >Review$~list                    * 41454  list
          BINT14                                 * 4145E  unit
          :: SWAPDROP ->StkStr22! ;              * 41463
          BINT0                                  * 41477  any
          :: DROP OBJ_41552 ;                    * 4147C
        ;                                        * 41490

* refs (3): 3FBA1 4143B 41445
OBJ_41495:
        :: SWAPDROP DUPSAFE@ ITE ->StkStr22! $_Undefined * 41495
          SWAP ID>$                              * 414B3

* ":"
$_::
          $ ": " &$ SWAP&$ ;                     * 414BD

* refs (1): 4144F
>Review$~program:
        :: DUPROM-WORD? case >Review$~program~1  * 414DA
          SystemLevel? NOTcasedrop OBJ_41552     * 414EE
          ' ROM-WORD? Find1stTrue case >Review$~program~1 * 414FD
          OBJ_41552 ;                            * 41516

* refs (1): 41459
>Review$~list:
        :: OBJ_3EFC8 casedrop OBJ_41552          * 41520
          CARCOMP DUPTYPELIST? casedrop OBJ_41552 * 41534
          >Review$ ;                             * 41548

* refs (5): 41486 414F8 41516 4152F 41543
OBJ_41552:
        :: GETDF DUPTYPECSTR? ?SEMI              * 41552
          DUPTYPEIDNT? case ID>$                 * 41566
          DUPTYPECOL? NOTcasedrop NULL$          * 41575
          ' TYPECSTR? Find1stTrue NOTcase NULL$  * 41584
        ;                                        * 4159D

* refs (2): 414E9 41511
>Review$~program~1:
        :: SWAPDROP ->StkStr22! ;                * 415A2
        BSS     19                               * 415B6

* -> %
* refs (1): 211EB
GetMenu%:
        :: GetMenu%~1 MenuRow@ # 6 #/ #+ UNCOERCE * 415C9

* 100
* refs (21): 4167E B6D26 B6D44 B6E55 B6F18 B6F31 ...
%100:
          % 1E2 %/ %FP %+ ;                      * 415F1

* refs (1): 3BE36
NumCurMenu:
        :: ROMPTR># SWAP SYMSYMB #=case UNCOERCE * 4161A
          OBJ_56B87 ;                            * 41638

* refs (1): 3BE40
GetMenu%~1~program:
        :: DUPTWO NTHELCOMP NOTcasedrop %0_2A2B4 * 41642
          PTR EQ: OBJ_3F4C4 NOTcasedrop %0_2A2B4 * 4165B
          CARCOMP ;                              * 4166F

* %mnu.pg   -> %0        ->
* refs (3): 2116C 211AA 9DEEF
InitMenu%:
        :: %100 %* COERCE BINT100 #/ BINT255d OVER#< ITE * 41679
          :: UNCOERCE ' OBJ_3F4C4 2Ob>Seco ;     * 416A6
          :: SYMSYMB SWAP #>ROMPTR ;             * 416C4
          SWAP DUP#0=ITE DROPONE                 * 416DD
          :: #1- #6* #1+ ; ERRSET DoMenuPos(li,s) ERRTRAP * 416EC
          :: ERROR@ BINT4 #=case SETSIZEERR      * 41714
            ERRJMP ;                             * 4172D
        ;                                        * 41737
        NIBHEX  00000                            * 4173C  ..

* ->
* refs (4): 15205 3BE9A 3BEE0 3C338
InitTrack::
        :: 'R OBJ_419A4 CONTEXT@ OBJ_41A04 InitTrack:~1 ; * 41741

* refs (2): 1857C 185B8
OBJ_41764:
        :: OBJ_41A14 Embedded? NOT?SEMI          * 41764
          BINT0 OBJ_41A04 ;                      * 41778

* refs (1): 38688
SysMenuCheck~1:
        :: CONTEXT@ OBJ_41A14 EQcase DROP        * 41787
          OBJ_41A04 SysMenuCheck~1~1 ;           * 417A0

* refs (1): 4102B
StartMenu~3:
        CON(5)  (*)+5                            * 417AF  primitive code object
        ASSEMBLE
        LC(3)   #402                             * 417B4
        GOVLNG  L_539F1                          * 417B9

* refs (1): 4175A
InitTrack:~1:
        CON(5)  (*)+5                            * 417C0  primitive code object
        LC(3)   #402                             * 417C5
        GOVLNG  SetISysFlag                      * 417CA

* refs (1): 3867E
SysMenuCheck~2:
        CON(5)  (*)+5                            * 417D1  primitive code object
        LC(3)   #402                             * 417D6
        GOVLNG  L_539E6                          * 417DB

* refs (1): 41026
StartMenu~4:
        CON(5)  (*)+5                            * 417E2  primitive code object
        LC(3)   #804                             * 417E7
        GOVLNG  L_539F1                          * 417EC

* ->
* refs (4): 3BEF9 3D411 3D44D 3F6B0
SetRebuild:
        CON(5)  (*)+5                            * 417F3  primitive code object
        LC(3)   #804                             * 417F8
        GOVLNG  SetISysFlag                      * 417FD

* refs (1): 3868D
SysMenuCheck~3:
        CON(5)  (*)+5                            * 41804  primitive code object
        LC(3)   #804                             * 41809
        GOVLNG  L_539E6                          * 4180E

* refs (2): 3A6A4 411CA
OBJ_41815:
        CON(5)  (*)+5                            * 41815  primitive code object
        LC(3)   #802                             * 4181A
        GOVLNG  L_539F1                          * 4181F

* refs (4): 3A659 4100D 410CB 41198
OBJ_41826:
        CON(5)  (*)+5                            * 41826  primitive code object
        LC(3)   #802                             * 4182B
        GOVLNG  SetISysFlag                      * 41830

* refs (2): 387C8 38B59
OBJ_41837:
        CON(5)  (*)+5                            * 41837  primitive code object
        LC(3)   #802                             * 4183C
        GOVLNG  L_539E6                          * 41841

* #n ->
* refs (7): 3A654 3A9F6 3B220 3BEEF 3F72D 41017 ...
MenuRow!:
        CON(5)  (*)+5                            * 41848  primitive code object
        LC(5)   MenuRow                          * 4184D
        GOVLNG  L_114C9                          * 41854

* -> #n
* refs (14): 389F3 38A25 3A64A 3A9EC 3F7B9 3F809 ...
MenuRow@:
        CON(5)  (*)+5                            * 4185B  primitive code object
        LC(5)   MenuRow                          * 41860
        GOVLNG  L_114B3                          * 41867

* #n ->
* refs (5): 387F0 38AD7 38BBD 40FEF 413A5
LastMenuRow!:
        CON(5)  (*)+5                            * 4186E  primitive code object
        LC(5)   LastMenuRow                      * 41873
        GOVLNG  L_114C9                          * 4187A

* -> #n
* refs (5): 387D7 389D5 38A1B 40030 40FAE
LastMenuRow@:
        CON(5)  (*)+5                            * 41881  primitive code object
        LC(5)   LastMenuRow                      * 41886
        GOVLNG  L_114B3                          * 4188D

* refs (1): 41021
StartMenu~5:
        CON(5)  (*)+5                            * 41894  primitive code object
        LC(5)   MenuDef                          * 41899
        GOTO    L_41A24                          * 418A0

* -> menu
* refs (10): 389EE 38A20 3A62C 3BE27 3BEA9 40F9F ...
MenuDef@:
        CON(5)  (*)+5                            * 418A4  primitive code object
        LC(5)   MenuDef                          * 418A9
        GOTO    L_41A2B                          * 418B0

* refs (1): 410B7
StartMenu~6:
        CON(5)  (*)+5                            * 418B4  primitive code object
        LC(5)   MenuData                         * 418B9
        GOTO    L_41A24                          * 418C0

* refs (1): 410D0
SetThisRow~1:
        CON(5)  (*)+5                            * 418C4  primitive code object
        LC(5)   MenuData                         * 418C9
        GOTO    L_41A32                          * 418D0

* ob ->
* refs (3): 3C380 4103F 4A307
MenuRowAct!:
        CON(5)  (*)+5                            * 418D4  primitive code object
        LC(5)   MenuRowAct                       * 418D9
        GOTO    L_41A24                          * 418E0

* refs (2): 3AA00 3B22A
OBJ_418E4:
        CON(5)  (*)+5                            * 418E4  primitive code object
        LC(5)   MenuRowAct                       * 418E9
        GOTO    L_41A32                          * 418F0

* ob ->
* refs (5): 151E2 3D45C 3F063 4104E 9DCEC
LabelDef!:
        CON(5)  (*)+5                            * 418F4  primitive code object
        LC(5)   LabelDef                         * 418F9
        GOTO    L_41A24                          * 41900

* #col ob ->
* refs (2): 3A24C 3A2D3
DoLabel:
        CON(5)  (*)+5                            * 41904  primitive code object
        LC(5)   LabelDef                         * 41909
        GOTO    L_41A32                          * 41910

* og -> ob
* refs (6): 151B5 3EF37 3F013 4105D 4A316 9DD01
MenuKeyNS!:
        CON(5)  (*)+5                            * 41914  primitive code object
        LC(5)   MenuKeyNS                        * 41919
        GOTO    L_41A24                          * 41920

* -> ob
* refs (1): 3EFCD
MenuKeyNS@:
        CON(5)  (*)+5                            * 41924  primitive code object
        LC(5)   MenuKeyNS                        * 41929
        GOTO    L_41A2B                          * 41930

* #n ->
* refs (7): 3B261 3B27A 3B293 3B2AC 3B2C5 3B2DE ...
DoMenuKeyNS:
        CON(5)  (*)+5                            * 41934  primitive code object
        LC(5)   MenuKeyNS                        * 41939
        GOTO    L_41A32                          * 41940

* ob -> ob
* refs (7): 151C4 3C395 3EF5A 3F027 4106C 4A325 ...
MenuKeyLS!:
        CON(5)  (*)+5                            * 41944  primitive code object
        LC(5)   MenuKeyLS                        * 41949
        GOTO    L_41A24                          * 41950

* refs (7): 3D6D7 3D6F0 3D709 3D722 3D73B 3D754 ...
OBJ_41954:
        CON(5)  (*)+5                            * 41954  primitive code object
        LC(5)   MenuKeyLS                        * 41959
        GOTO    L_41A32                          * 41960

* ob -> ob
* refs (6): 151D3 3EF7D 3F02C 4107B 4A334 9DD2B
MenuKeyRS!:
        CON(5)  (*)+5                            * 41964  primitive code object
        LC(5)   MenuKeyRS                        * 41969
        GOTO    L_41A24                          * 41970

* refs (8): 3DD13 3DD2C 3DD45 3DD5E 3DD77 3DD90 ...
OBJ_41974:
        CON(5)  (*)+5                            * 41974  primitive code object
        LC(5)   MenuKeyRS                        * 41979
        GOTO    L_41A32                          * 41980

* ob ->
* refs (7): 151F1 3FB6E 4108A 413C8 4A2F3 9DCD7 ...
ReviewKey!:
        CON(5)  (*)+5                            * 41984  primitive code object
        LC(5)   ReviewKey                        * 41989
        GOTO    L_41A24                          * 41990

* refs (3): 3DEC2 4A2CB C53DD
LocalReview:
        CON(5)  (*)+5                            * 41994  primitive code object
        LC(5)   ReviewKey                        * 41999
        GOTO    L_41A32                          * 419A0

* refs (2): 41094 4174B
OBJ_419A4:
        CON(5)  (*)+5                            * 419A4  primitive code object
        LC(5)   TrackAct                         * 419A9
        GOTO    L_41A24                          * 419B0

* refs (1): 417A5
SysMenuCheck~1~1:
        CON(5)  (*)+5                            * 419B4  primitive code object
        LC(5)   TrackAct                         * 419B9
        GOTO    L_41A32                          * 419C0

* ob ->
* refs (3): 3BD00 3EC8F 410A3
MenuExitAct!:
        CON(5)  (*)+5                            * 419C4  primitive code object
        LC(5)   MenuExitAct                      * 419C9
        GOTO    L_41A24                          * 419D0

* refs (1): 4003A
StartMenu~2~1:
        CON(5)  (*)+5                            * 419D4  primitive code object
        LC(5)   MenuExitAct                      * 419D9
        GOTO    L_41A32                          * 419E0

* menu ->
* refs (5): 387F5 38ADC 38BC2 40FE5 413AF
LastMenuDef!:
        CON(5)  (*)+5                            * 419E4  primitive code object
        LC(5)   LastMenuDef                      * 419E9
        GOTO    L_41A24                          * 419F0

* -> menu
* refs (5): 387D2 389D0 38A16 4002B 40FA9
LastMenuDef@:
        CON(5)  (*)+5                            * 419F4  primitive code object
        LC(5)   LastMenuDef                      * 419F9
        GOTO    L_41A2B                          * 41A00

* refs (4): 410AD 41755 4177D 417A0
OBJ_41A04:
        CON(5)  (*)+5                            * 41A04  primitive code object
        LC(5)   LastContext                      * 41A09
        GOTO    L_41A24                          * 41A10

* refs (2): 41769 41791
OBJ_41A14:
        CON(5)  (*)+5                            * 41A14  primitive code object
        LC(5)   LastContext                      * 41A19
        GOTO    L_41A2B                          * 41A20
L_41A24:
        GOVLNG  L_08D14                          * 41A24
L_41A2B:
        GOVLNG  SysPtr@                          * 41A2B
L_41A32:
        GOVLNG  PC=((C))                         * 41A32
        RPL

* -> id
* refs (3): 1109F 41E55 41E5F
'idUserKeys:
        :: '                                     * 41A39

* ID UserKeys
ID_UserKeys:
          ID UserKeys ;                          * 41A43

* -> id
* refs (2): 1108B 41E4B
'idUserKeys.:
        :: '                                     * 41A5F

* ID UserKeys.CRC
ID_UserKeys.:
          ID UserKeys.CRC ;                      * 41A69

* -> flag
* refs (3): 397C0 3D960 3FA7F
UserKeys?:
        :: BINT62 TestSysFlag ;                  * 41A8D

* {} ->
* refs (1): 22523
Ck&AsnUKeys:
        :: INNERCOMP DUP#0=csDROP BINT2 #/ SWAP #0<> IT * 41AA1
          :: DUP #2* #2+ROLL StoKeys(nm) ;       * 41AC9
          DUP#0=csDROP ZERO_DO ISTOP@ #2* INDEX@ #2* #- DUP#1+ ROLLSWAP ROLL * 41AE7
          XEQAsnKey LOOP ;                       * 41B19

* ob %rc.p ->
* refs (2): 22503 41B19
XEQAsnKey:
        :: Ck&DecKeyLoc StoUserKeypatch ;        * 41B28

* {} ->
* refs (1): 22561
XEQDelKeys:
        :: INNERCOMP DUP#0=csDROP ZERO_DO ISTOP-INDEX ROLL Ck&ClrUKey LOOP ; * 41B3C

* 0 -> %rc.p ->
* refs (2): 22557 41B5A
Ck&ClrUKey:
        :: DUP%0= casedrop ClrUserKeys           * 41B69
          Ck&DecKeyLoc DelKey ;                  * 41B7D

* #kc #plane ->
* refs (1): 41B82
DelKey:
        :: NULL{} 3UNROLL StoUserKeypatch ;      * 41B8C

* refs (3): 2252D 22537 41ADD
StoKeys(nm):
        :: ChkName'S' SetNUsrKeyOK ;             * 41BA5

* refs (2): 2256B 22575
DelKeys(nm):
        :: ChkName'S' ClrNUsrKeyOK ;             * 41BB9

* refs (2): 41BAA 41BBE
ChkName'S':
        :: DUP'                                  * 41BCD

S:
          ID S EQUAL SWAP'                       * 41BD7

ΠS:
          LAM S EQUALOR NcaseSIZEERR ;           * 41BEA

* -> {}
* refs (1): 22590
XEQRclKeys:
        :: GetUserKeys DUPNULLCOMP? casedrop NULL{} * 41C02
          NULL{} SWAP toLEN_DO DUPINDEX@ NTHCOMPDROP DUPNULLCOMP? ?SKIP * 41C1B
          :: toLEN_DO DUPINDEX@ NTHCOMPDROP DUPNULLCOMP? ITE_DROP * 41C3E
            :: 4ROLLSWAP >TCOMP JINDEX@ INDEX@ CodePl>%rc.p >TCOMP 3UNROLL ; * 41C5C
            LOOP ;                               * 41C89
          DROPLOOP DROP ;                        * 41C93

* %rc.p -> #kc #p
* refs (2): 41B2D 41B7D
Ck&DecKeyLoc:
        :: CKREAL DUP %IP># BINT10 #/ OVER#0= caseSIZEERR DUP#0= * 41CA2
          caseSIZEERR 2DUP                       * 41CCF
          BINT9 #> caseSIZEERR BINT6             * 41CD9
          #> caseSIZEERR DUP                     * 41CED
          BINT4 #> 3PICK BINT5 #> AND caseSIZEERR DUP * 41CFC
          #6* #6- SWAPDUP BINT5 #<ITE DROP       * 41D24

-(2s);5+(s):
          :: #- #5+ ; #+ SWAP %FP %10* %ABSCOERCE DUP BINT6 #> caseSIZEERR * 41D42
          DUP#0=IT                               * 41D83
          #1+ ;                                  * 41D88

* #kc #p -> %rc.p
* refs (3): 1A7AB 1A8A0 41C75
CodePl>%rc.p:
        :: UNCOERCE %10 %/ SWAPDUP BINT25 #<ITE  * 41D92
          :: BINT0 BINT6 ;                       * 41DB5
          :: BINT24 #- BINT4 BINT5 ; ROTOVER #/ OVER #0=ITE SWAPDROP * 41DC9

1+(s);drop(3):
          :: #1+ ROTDROP ; ROT#+ UNCOERCE2 %10* %+ %+ ; * 41E00

* {} ->
* refs (3): 110E5 41F09 41F1D
StoUserKeys:
        :: PgUserKeys DUP OCRC SWAPDROP 'idUserKeys. StoHiddenVar * 41E32
          'idUserKeys StoHiddenVar 'idUserKeys RclHiddenVar DROP UserKeys! ; * 41E55

* ob #kc #p ->
* refs (2): 41B32 41B9B
StoUserKeypatch:
        :: GetUserKeys DUPNULLCOMP? IT           * 41E78
          :: BINT48 ZERO_DO DUP LOOP BINT49 {}N ; * 41E8C
          DUP 4PICK NTHCOMPDROP DUPNULLCOMP? IT  * 41EB4
          :: DUPDUP DUPDUP DUP BINT6 {}N ;       * 41ECD
          5ROLL 4ROLLROT PUTLIST 3UNROLL PUTLIST StoUserKeys ; * 41EF0

* ->
* refs (2): 17DFD 41B78
ClrUserKeys:
        :: NULL{} StoUserKeys SetNUsrKeyOK ;     * 41F13

* {} ->
* refs (2): 110D1 41E6E
UserKeys!:
        CON(5)  (*)+5                            * 41F2C  primitive code object
        ASSEMBLE
        LC(5)   UserKeys                         * 41F31
        GOVLNG  L_08D14                          * 41F38

* -> {}
* refs (4): 17DD5 3FA93 41C07 41E7D
GetUserKeys:
        CON(5)  (*)+5                            * 41F3F  primitive code object
        LC(5)   UserKeys                         * 41F44
        GOVLNG  SysPtr@                          * 41F4B

* ->
* refs (1): 41E37
PgUserKeys:
        CON(5)  (*)+5                            * 41F52  primitive code object
        LC(5)   UserKeys                         * 41F57
        GOVLNG  L_08D2F                          * 41F5E
        RPL

* -> #kc #flag
* refs (3): 1A760 4A05F D102E
WaitForKey:
        :: POLSaveUI ERRSET                      * 41F65
          :: FALSE 1NULLLAM{} BIND ' ClrDAsOK ' WaitForKey~1 TrueTrue FALSE * 41F74
            BINT0 FALSE ' 1GETLAM 'ERRJMP POLSetUI POLKeyUI ABND ; * 41FA6
          ERRTRAP POLResUI&Err POLRestoreUI ;    * 41FD3

* refs (1): 41F97
WaitForKey~1:
        :: 2DUP ModifierKey? case2drpfls '       * 41FE7
          WaitForKey~1~1 ROT >TCOMP SWAP >TCOMP TRUE ; * 42000
