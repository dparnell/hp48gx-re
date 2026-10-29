* HP 48GX ROM revision R, #3E005-#40001: Key handling
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: DoBadKey DirLabel: ?CaseKeyDef NullMenuKey 'DoBadKeyT ?CaseRomptr@ NoExitAction Box/StdLabel ComLine?:(bip;q) Key>U/SKeyOb EvalNextChkPRG Box/StdLbl:
* Follows on from the previous file (at #3E005 in the original ROM).
        RPL

* ROMPTR 0A3 01E
* refs (1): 3DCED
ROMP_0A3_01E:
        ROMPTR 0B4 000                           * 3E005

* ROMPTR 0A3 01F
* refs (1): 3DCED
ROMP_0A3_01F:
        ROMPTR 0B4 045                           * 3E010

* ROMPTR 0A3 020
* refs (1): 3DCED
ROMP_0A3_020:
        ROMPTR 0B4 113                           * 3E01B

* ROMPTR 0A3 021
* refs (1): 3DCED
~DoDelim;CHR_#;?ClrAlg:
        :: DoDelim CHR_# ?ClrAlg ;               * 3E026

* ROMPTR 0A3 022
* refs (1): 3DCED
ROMP_0A3_022:
        ROMPTR 0A1 022                           * 3E03F

* ROMPTR 0A3 023
* refs (1): 3DCED
ROMP_0A3_023:
        ROMPTR 0B4 137                           * 3E04A

* ROMPTR 0A3 024
* refs (1): 3DCED
ROMP_0A3_024:
        ROMPTR 0B4 175                           * 3E055

* ROMPTR 0A3 025
* refs (1): 3DCED
ROMP_0A3_025:
        :: MenuMaker ROMPTR 0A9 02A DoMenuKey ;  * 3E060

* ROMPTR 0A3 026
* refs (3): 3DCED 6BCFE 8F5D9
ROMP_0A3_026:
        :: DoDelim CHR_UndScore OBJ_40E1F ;      * 3E07F

* ROMPTR 0A3 027
* refs (1): 3DCED
ROMP_0A3_027:
        ROMPTR 0A2 022                           * 3E098

* ROMPTR 0A3 028
* refs (1): 3DCED
ROMP_0A3_028:
        ROMPTR 0B4 192                           * 3E0A3

* ROMPTR 0A3 029
* refs (1): 3DCED
ROMP_0A3_029:
        :: MenuMaker ROMPTR 0A9 070 DoMenuKey ;  * 3E0AE

* ROMPTR 0A3 02A
* refs (1): 3DCED
ROMP_0A3_02A:
        ROMPTR 0AB 022                           * 3E0CD  EQNLIB

* ROMPTR 0A3 02B
* refs (2): 3DCED 6BAA1
~DoDelims;$_2DQ;?ClrAlg:
        :: DoDelims $_2DQ ?ClrAlg ;              * 3E0D8

* ROMPTR 0A3 02C
* refs (1): 3DCED
~Modifier;TurnOff;SetDA123NoCh_2:
        :: Modifier TurnOff SetDA123NoCh ;       * 3E0F1

* ROMPTR 0A3 02D
* refs (1): 3DCED
ROMP_0A3_02D:
        ROMPTR 700 004                           * 3E10A  →

* ROMPTR 0A3 02E
* refs (1): 3DCED
ROMP_0A3_02E:
        :: TakeOver OBJ_42B61 SetDA13NoCh ;      * 3E115

* ROMPTR 0A3 02F
* refs (1): 3DCED
K_128_3E12E:
        CHR "∡"                                  * 3E12E

* ROMPTR 0A3 030
* refs (1): 3DCED
~DoDelims;$_::;?ClrAlgSetPr:
        :: DoDelims PTR $_:: ?ClrAlgSetPr ;      * 3E135

* refs (1): 3B509
~Cursor&Disp;ToNextRowIfEnd:
        :: Cursor&Disp ToNextRowIfEnd ;          * 3E14E
        NIBHEX  00000                            * 3E162  ..

LIB0A3.hash:
        CON(5)  DOHSTR                           * 3E167  hash table of library 0A3
        LENGTH                                   * 3E16C  length, to #3E1CB
        CON(5)  0                                * 3E171  names of length 1
        CON(5)  0                                * 3E176  names of length 2
        CON(5)  0                                * 3E17B  names of length 3
        CON(5)  0                                * 3E180  names of length 4
        CON(5)  0                                * 3E185  names of length 5
        CON(5)  0                                * 3E18A  names of length 6
        CON(5)  0                                * 3E18F  names of length 7
        CON(5)  0                                * 3E194  names of length 8
        CON(5)  0                                * 3E199  names of length 9
        CON(5)  0                                * 3E19E  names of length 10
        CON(5)  0                                * 3E1A3  names of length 11
        CON(5)  0                                * 3E1A8  names of length 12
        CON(5)  0                                * 3E1AD  names of length 13
        CON(5)  0                                * 3E1B2  names of length 14
        CON(5)  0                                * 3E1B7  names of length 15
        CON(5)  0                                * 3E1BC  names of length 16
        REL(5)  L_3E1C6                          * 3E1C1  end of the names
L_3E1C6:
        CON(5)  0                                * 3E1C6  command 000 has no name
        ENDLENGTH                                * 3E1CB

LIB0A3.link:
        CON(5)  DOHSTR                           * 3E1CB  link table of library 0A3
        LENGTH                                   * 3E1D0  length, to #3E2CA
        REL(5)  RightShift1                      * 3E1D5  000 
        REL(5)  RightShift2                      * 3E1DA  001 
        REL(5)  ROMP_0A3_002                     * 3E1DF  002 
        REL(5)  RightShift4                      * 3E1E4  003 
        REL(5)  RightShift5                      * 3E1E9  004 
        REL(5)  RightShift6                      * 3E1EE  005 
        REL(5)  ROMP_0A3_006                     * 3E1F3  006 
        REL(5)  ROMP_0A3_007                     * 3E1F8  007 
        REL(5)  ROMP_0A3_008                     * 3E1FD  008 
        REL(5)  ROMP_0A3_009                     * 3E202  009 
        REL(5)  ROMP_0A3_00A                     * 3E207  00A 
        REL(5)  ROMP_0A3_00B                     * 3E20C  00B 
        REL(5)  ROMP_0A3_00C                     * 3E211  00C 
        REL(5)  ROMP_0A3_00D                     * 3E216  00D 
        REL(5)  ROMP_0A3_00E                     * 3E21B  00E 
        REL(5)  ROMP_0A3_00F                     * 3E220  00F 
        REL(5)  ROMP_0A3_010                     * 3E225  010 
        REL(5)  ROMP_0A3_011                     * 3E22A  011 
        REL(5)  ROMP_0A3_012                     * 3E22F  012 
        REL(5)  ROMP_0A3_013                     * 3E234  013 
        REL(5)  ROMP_0A3_014                     * 3E239  014 
        REL(5)  ROMP_0A3_015                     * 3E23E  015 
        REL(5)  ROMP_0A3_016                     * 3E243  016 
        REL(5)  ROMP_0A3_017                     * 3E248  017 
        REL(5)  ~Do1st/2nd+:;xDUP;DoNewMatrix    * 3E24D  018 
        REL(5)  ROMP_0A3_019                     * 3E252  019 
        REL(5)  ROMP_0A3_01A                     * 3E257  01A 
        REL(5)  ROMP_0A3_01B                     * 3E25C  01B 
        REL(5)  ROMP_0A3_01C                     * 3E261  01C 
        REL(5)  ROMP_0A3_01D                     * 3E266  01D 
        REL(5)  ROMP_0A3_01E                     * 3E26B  01E 
        REL(5)  ROMP_0A3_01F                     * 3E270  01F 
        REL(5)  ROMP_0A3_020                     * 3E275  020 
        REL(5)  ~DoDelim;CHR_#;?ClrAlg           * 3E27A  021 
        REL(5)  ROMP_0A3_022                     * 3E27F  022 
        REL(5)  ROMP_0A3_023                     * 3E284  023 
        REL(5)  ROMP_0A3_024                     * 3E289  024 
        REL(5)  ROMP_0A3_025                     * 3E28E  025 
        REL(5)  ROMP_0A3_026                     * 3E293  026 
        REL(5)  ROMP_0A3_027                     * 3E298  027 
        REL(5)  ROMP_0A3_028                     * 3E29D  028 
        REL(5)  ROMP_0A3_029                     * 3E2A2  029 
        REL(5)  ROMP_0A3_02A                     * 3E2A7  02A 
        REL(5)  ~DoDelims;$_2DQ;?ClrAlg          * 3E2AC  02B 
        REL(5)  ~Modifier;TurnOff;SetDA123NoCh_2 * 3E2B1  02C 
        REL(5)  ROMP_0A3_02D                     * 3E2B6  02D 
        REL(5)  ROMP_0A3_02E                     * 3E2BB  02E 
        REL(5)  K_128_3E12E                      * 3E2C0  02F 
        REL(5)  ~DoDelims;$_::;?ClrAlgSetPr      * 3E2C5  030 
        ENDLENGTH                                * 3E2CA
        BSS     19                               * 3E2CA

* -> {}
* refs (3): 3BDFF D5164 D5235
<SkipKey:
        {                                        * 3E2DD

_<-SKIP_:
          $ "←SKIP"                              * 3E2E2
          :: NoComLine?:(bip;q) BegComLine?:(bip;q) Cursor&Disp * 3E2F6
            :: BEGIN OBJ_3E634 AND WHILE <-Skip! REPEAT BEGIN OBJ_3E634 * 3E30A
              NOTAND WHILE <-Skip! REPEAT ;      * 3E337
            SetDA123NoCh ;                       * 3E350
        }                                        * 3E35A

* -> {}
* refs (3): 3BE04 D5169 D523A
>SkipKey:
        {                                        * 3E35F

_SKIP->_:
          $ "SKIP→"                              * 3E364
          :: NoComLine?:(bip;q) EndComLine?:(bip;q) Cursor&Disp * 3E378
            :: BEGIN ChkSkip-> NOTAND WHILE Skip->! REPEAT BEGIN ChkSkip-> * 3E38C
              AND WHILE Skip->! REPEAT ;         * 3E3B9
            SetDA123NoCh ;                       * 3E3D2
        }                                        * 3E3DC

* -> {}
* refs (3): 3BE09 D516E D523F
<DelKey:
        {                                        * 3E3E1

_<-DEL_:
          $ "←DEL"                               * 3E3E6
          {                                      * 3E3F8
            :: NoComLine?:(bip;q) BegComLine?:(bip;q) EDITPARTS BEGIN * 3E3FD
              OBJ_3E634 AND WHILE                * 3E416

<-del!:
              :: <-Skip! OBJ_429CB ; REPEAT BEGIN OBJ_3E634 NOTAND WHILE * 3E425
              :: <-Skip! OBJ_429CB ; REPEAT SetDA13NoCh OBJ_3E6D4 ; * 3E452
            DoBadKey                             * 3E47A

* refs (1): 3DFA1
OBJ_3E47F:
            :: NoComLine?:(bip;q) BEGIN OnTheFirstCol? NOT WHILE * 3E47F

DelLeftChr:
              :: LCursor OBJ_429CB ; REPEAT SetDA13NoCh ; * 3E49D
          }                                      * 3E4C0
        }                                        * 3E4C5

* -> {}
* refs (3): 3BE0E D5173 D5244
>DelKey:
        {                                        * 3E4CA

_DEL->_:
          $ "DEL→"                               * 3E4CF
          {                                      * 3E4E1
            :: NoComLine?:(bip;q) EndComLine?:(bip;q) EDITPARTS BEGIN * 3E4E6
              ChkSkip-> NOTAND WHILE OBJ_429CB REPEAT BEGIN ChkSkip-> AND * 3E4FF
              WHILE OBJ_429CB REPEAT SetDA13NoCh OBJ_3E6D4 ; * 3E527
            DoBadKey                             * 3E545

* refs (1): 3DF8D
OBJ_3E54A:
            :: NoComLine?:(bip;q) BEGIN CURSOR_END? NOT WHILE OBJ_429CB * 3E54A
              REPEAT SetDA13NoCh ;               * 3E56D
          }                                      * 3E57C
        }                                        * 3E581

* refs (3): 3BE13 D5178 D5249
TogInsertKey:
        {                                        * 3E586

INSLabel:
          :: PTR Box/StdLbl:                     * 3E58B

_INS_:
            $ "INS" INSERT? ;                    * 3E595

\INS:
          :: TakeOver InvCursor SetDA12NoCh ; }  * 3E5AF

* refs (1): 3BE18
IStackKey:
        {                                        * 3E5CD

_^STK_:
          $ "↑STK" OBJ_4365D }                   * 3E5D2

* refs (9): 3DE95 3DF88 3DF9C 3E2FB 3E37D 3E402 ...
NoComLine?:(bip;q):
        :: TakeOver EditLExists? ?SEMI           * 3E5EE
          DoBadKey RDROP ;                       * 3E602

* refs (18): 43F2B 43F4E 4407F 8EB9D 8EE50 8F071 ...
ComLine?:(bip;q):
        :: TakeOver EditLExists? NOT?SEMI        * 3E611
          DoBadKey RDROP ;                       * 3E625

* refs (4): 3E314 3E332 3E416 3E443
OBJ_3E634:
        :: CURSOR@ #0<> PrevChrInComLine DUP CHR_Space EQUAL SWAP * 3E634
          CHR_Newline EQUALOR ;                  * 3E65C

* refs (4): 3E323 3E341 3E42A 3E457
<-Skip!:
        :: OnTheFirstCol? case PrevLineIfStart   * 3E66B
          LCursor ;                              * 3E67F

* refs (4): 3E396 3E3B4 3E4FF 3E51D
ChkSkip->:
        :: NextChrInComLine CHR_00 EQUALNOT NextChrInComLine=space? * 3E689
          NextChrInComLine CHR_Newline EQUALOR ; * 3E6A2

* refs (2): 3E3A5 3E3C3
Skip->!:
        :: CURSOR_END? case ToNextRowIfEnd       * 3E6B6
          ->OnTheRow ;                           * 3E6CA

* refs (2): 3E470 3E53B
OBJ_3E6D4:
        :: EDITPARTS BINT3 OVER#< case2drop SetDA2aNoCh * 3E6D4
          #=case SetDA2aNoCh                     * 3E6F2
        ;                                        * 3E6FC

* refs (2): 2117B 3BED1
ChkForMenu(_):
        :: DUPTYPELIST? ?SEMI                    * 3E701
          dup;#nm? casedrop NULL{}               * 3E710
          SAFE@ NOTcase NULL{}                   * 3E71F
          DUPTYPELIST? NOTcasedrop NULL{}        * 3E72E
        ;                                        * 3E73D

* refs (1): 46A72
{GRAPH\+/-}:
        {                                        * 3E742
          :: PTR Box/StdLbl:                     * 3E747

_+/-_:
            $ "+/-" ~BINT32;TestSysFlag ;        * 3E751
          {GRAPH\+/-}~1 }                        * 3E76B

* refs (1): 46AD9
{GRAPH\REPL}:
        {                                        * 3E775

_REPL_:
          $ "REPL" \REPL }                       * 3E77A

* refs (1): 46AD4
{GRAPH\SUä}:
        {                                        * 3E796

_SUä_:
          $ "SUB" {GRAPH\SUä}~1 }                * 3E79B

* refs (1): 46A7C
{GRAPH\DEL}:
        {                                        * 3E7B5

_DEL_:
          $ "DEL" {GRAPH\DEL}~1 }                * 3E7BA

* refs (1): 46A77
{GRAPH\LABEL}:
        { xLABEL {GRAPH\LABEL}~1 }               * 3E7D4

{GRAPH\MENUU}:
        {                                        * 3E7E8

_Keys_:
          $ "Keys" MENUOFF }                     * 3E7ED

* refs (1): 46A6D
{GRAPH\MARK}:
        {                                        * 3E809

_MARK_:
          $ "MARK" \MARK }                       * 3E80E

* refs (1): 46A59
{GRAPH\LINE}:
        { xLINE \LINE }                          * 3E82A

* refs (1): 46A5E
{GRAPH\TLINE}:
        { xTLINE \TLINE }                        * 3E83E

* refs (1): 46A63
{GRAPH\BOX}:
        { xBOX \BOX }                            * 3E852

* refs (1): 46A68
{GRAPH\CIRCLE}:
        {                                        * 3E866

_CIRCLE_:
          $ "CIRCLE" \CIRCLE }                   * 3E86B

* refs (1): 46A4F
{GRAPH\DOT+}:
        {                                        * 3E88B
          :: PTR Box/StdLbl:                     * 3E890

_DOT+_:
            $ "DOT+" ~3GETLAM;#2= ;              * 3E89A
          {GRAPH\DOT+}~1 }                       * 3E8B6

* refs (1): 46A54
{GRAPH\DOT-}:
        {                                        * 3E8C0
          :: PTR Box/StdLbl:                     * 3E8C5

_DOT-_:
            $ "DOT-" ~3GETLAM;#1= ;              * 3E8CF
          {GRAPH\DOT-}~1 }                       * 3E8EB
        FILLTO  #3EC71                           * 3E8F5  892 zero nibbles: the next entry stays at #3EC71

* ->
* refs (83): 152DC 4117A 4117F 86B2D 9A788 9A78D ...
NullMenuKey:
        { NULL$ DoBadKey }                       * 3EC71

* ->
* refs (37): 3BEA4 3BF1C 3C0F3 3F20B 40189 41378 ...
NoExitAction:
        :: 'NOP MenuExitAct! ;                   * 3EC85

* $ flag -> grob
* refs (22): 3ECC6 3ED02 3ED3E 3ED61 8EBF9 8EC27 ...
Box/StdLabel:
        :: case MakeBoxLabel                     * 3EC99
          MakeStdLabel ;                         * 3ECA8

* -> grob
* refs (10): 3E590 3E74C 3E895 3E8CA 733A6 C61EF ...
Box/StdLbl::
        :: TakeOver 'R'R EVAL Box/StdLabel ;     * 3ECB2

* -> grob
* refs (9): C53F6 C61BE C62ED C6355 C6406 C648A ...
FStd/BoxLbl::
        :: TakeOver 'R'R TestSysFlag Std/BoxLabel ; * 3ECD0

* -> grob
* refs (5): C618B C6322 C6733 C6DFA C73FC
FBox/StdLbl::
        :: TakeOver 'R'R TestSysFlag Box/StdLabel ; * 3ECEE

* $ flag -> grob
* refs (1): 3ECE4
Std/BoxLabel:
        :: case MakeStdLabel                     * 3ED0C
          MakeBoxLabel ;                         * 3ED1B

* -> grob
* refs (4): C56CD C570F C5751 C5793
BBox/StdLbl::
        :: TakeOver 'R'R BASE EQ Box/StdLabel ;  * 3ED25

* -> grob
* refs (4): C60B0 C60F2 C6125 C6158
MBox/StdLbl::
        :: TakeOver 'R'R NumbMode EQ Box/StdLabel ; * 3ED48

* -> grob
* refs (95): 47D17 47DAC 47DDE 6A9AB 73312 733F1 ...
DirLabel::
        :: TakeOver 'R MakeDirLabel ;            * 3ED6B

* refs (2): 3D763 3DD9F
OBJ_3ED84:
        :: TakeOver 'R TogSysFlag SetDA2bNoCh ;  * 3ED84

* # ->
* refs (5): 22316 22334 3ED93 40058 40D57
TogSysFlag:
        :: DUP TestSysFlag case ClrSysFlag       * 3EDA2
          SetSysFlag ;                           * 3EDBB

* refs (11): C541C C5486 C54ED C56F1 C5733 C5775 ...
EvalNextChkPRG:
        :: TakeOver 'R PrgmEntry? case DoKeyOb   * 3EDC5
          EVAL AtUserStack ;                     * 3EDE3

* -> :: ob1 ; (PRG mode) -> :: ob1 <rest> (no PRG mode)
* refs (6): C6801 C70CC C70F4 C711C C7144 C716C
Do1st/1st+::
        :: TakeOver R> PrgmEntry? IT CARCOMP     * 3EDF2
          DoKeyOb ;                              * 3EE10

* -> :: <ob1> ; (PRG mode) -> :: <ob2> <rest> ; (no PRG mode)
* refs (5): 3B3F0 3D8A3 3D8EE 3DF59 C66B4
Do1st/2nd+::
        :: TakeOver 'R R> PrgmEntry? ?SKIPSWAP DROP DoKeyOb ; * 3EE1A

* refs (6): 3DB0D C5A05 C5A74 C5A8D C5AF8 C5B11
Echo2Macros:
        :: TakeOver 'R'R OBJ_3EEC9 ToTheEndOfRow ; * 3EE47

* refs (4): C594D C5B7A C5BEE C5E0C
3NextInCmdLine:
        :: TakeOver 'R'R 'R OBJ_3EEEC OBJ_3EEC9 UCursor ToTheEndOfRow ; * 3EE65

* refs (3): C596B C59E2 C5E2A
4NextInCmdLine:
        :: TakeOver 'R'R 'R'R OBJ_3EEEC OBJ_3EEEC OBJ_3EEC9 UCursor UCursor * 3EE92
          ToTheEndOfRow ;                        * 3EEBF

* refs (3): 3EE56 3EE7E 3EEB0
OBJ_3EEC9:
        :: ?ClrAlgSetPr SetDA3NoCh OBJ_3EEEC OBJ_3EEEC UCursor ; * 3EEC9

* refs (5): 3EE79 3EEA6 3EEAB 3EED8 3EEDD
OBJ_3EEEC:
        :: OnTheFirstCol? ?SKIP OBJ_42B61        * 3EEEC
          OBJ_408C3 APPEND_SPACE AddInComLine(st) ; * 3EF00

* refs (16): 3C93B 3CAA2 3CB85 3CD00 3CD69 3CE02 ...
* Probably: install the soft-key handlers of a UNITS menu
OBJ_3EF14:
        :: '                                     * 3EF14
          :: OBJ_3F06D OBJ_3EF87 StdMenuKeyNS ; MenuKeyNS! ' * 3EF1E
          :: OBJ_3F06D OBJ_3EF87 StdMenuKeyLS ; MenuKeyLS! ' * 3EF41
          :: OBJ_3F06D OBJ_3EF87 StdRightShift ; MenuKeyRS! ; * 3EF64

* refs (3): 3EF28 3EF4B 3EF6E
OBJ_3EF87:
        :: BINT0 OBJ_25F4E ROT BINT1 GetNextToken OBJ_28706 7DROP ; * 3EF87

* refs (4): 3D425 3D46B 3EFDC 3EFF5
OBJ_3EFB4:
        :: COLA OBJ_3F06D                        * 3EFB4
        ;                                        * 3EFC3

* refs (2): 41525 6BD7B
OBJ_3EFC8:
        :: MenuKeyNS@ CARCOMP PTR EQ: OBJ_3EFB4 ; * 3EFC8

* refs (5): 3BF17 3C0EE 3C26A 3C6B9 3D498
OBJ_3EFE6:
        :: '                                     * 3EFE6
          :: OBJ_3EFB4 InitMenuNoExit ; OnlyDefNoShift! ; * 3EFF0

* refs (8): 3C459 3C4E3 3C56D 3C5F7 3C681 3D434 ...
OnlyDefNoShift!:
        :: MenuKeyNS! ' DropBadKey DUP MenuKeyLS! MenuKeyRS! ; * 3F00E

* refs (6): 3BF12 3C0E9 3C265 3C6B4 3D416 3D493
OBJ_3F036:
        :: '                                     * 3F036
          :: DUPNULL$? ITE MakeStdLabel MakeDirLabel * 3F040
            Grob>Menu ;                          * 3F059
          LabelDef! ;                            * 3F063

* refs (4): 3EF23 3EF46 3EF69 3EFBE
OBJ_3F06D:
        :: DUPTYPECOL? NOT?SEMI                  * 3F06D
          SystemLevel? NOT?SEMI                  * 3F07C
          RDROP EVAL ;                           * 3F086

* refs (2): 3BF7D 3C16A
_LIST_:
        $ "LIST"                                 * 3F095

* refs (1): 4127E
OBJ_3F0A7:
        :: TAG> OBJ_3F0CA case OBJ_41355         * 3F0A7
          SWAPDROP ;                             * 3F0C0

* refs (2): 3F0B1 40152
OBJ_3F0CA:
        :: tok& tok=casedrop TRUE                * 3F0CA
          CODE                                   * 3F0DE  148 nibbles
            A=DAT1  A                            * 3F0E8
            CD1EX                                * 3F0EB
            R0=C                                 * 3F0EE
            D1=A                                 * 3F0F1
            D1=D1+  5                            * 3F0F4
            A=DAT1  A                            * 3F0F7
            A=A-CON A,6                          * 3F0FA
            GOC     L_3F111                      * 3F100
            A=A-1   A                            * 3F103
            A=A-1   A                            * 3F105
            GOC     L_3F11E                      * 3F107
            A=A-1   A                            * 3F10A
            A=A-1   A                            * 3F10C
            GOC     L_3F14D                      * 3F10E
L_3F111:
            C=R0                                 * 3F111
            D1=C                                 * 3F114
            GOVLNG  PushFLoop                    * 3F117
L_3F11E:
            D1=D1+  5                            * 3F11E
            GOSUB   SUB_3F13E                    * 3F121
            GOC     L_3F111                      * 3F125
            LC(2)   #09                          * 3F128
L_3F12C:
            ?C<A    A                            * 3F12C
            GOYES   L_3F111                      * 3F12F
            C=R0                                 * 3F131
            D1=C                                 * 3F134
            GOVLNG  OverWrTLoop                  * 3F137

* refs (3): 3F121 3F150 3F16F
SUB_3F13E:
            A=0     A                            * 3F13E
            A=DAT1  B                            * 3F140
            C=0     A                            * 3F143
            LC(2)   #30                          * 3F145
            A=A-C   A                            * 3F149
            RTN                                  * 3F14B
L_3F14D:
            D1=D1+  5                            * 3F14D
            GOSUB   SUB_3F13E                    * 3F150
            GOC     L_3F111                      * 3F154
            LC(2)   #03                          * 3F157
            ?C<A    A                            * 3F15B
            GOYES   L_3F111                      * 3F15E
            ?C=A    A                            * 3F160
            GOYES   L_3F169                      * 3F163
            LC(2)   #09                          * 3F165
L_3F169:
            R1=C                                 * 3F169
            D1=D1+  2                            * 3F16C
            GOSUB   SUB_3F13E                    * 3F16F
            GOC     L_3F111                      * 3F173
            C=R1                                 * 3F176
            GONC    L_3F12C                      * 3F179
          ENDCODE                                * 3F17C
        ;                                        * 3F17C
        FILLTO  #3F1E3                           * 3F181  98 zero nibbles: the next entry stays at #3F1E3

* refs (1): 6AF23
OBJ_3F1E3:
        :: OBJ_26F50 {MenuRules} SWAP ITE &COMP SWAPDROP * 3F1E3
          ' NoExitAction 2Ob>Seco ;              * 3F206

* refs (2): 3F1ED 6AF1E
{MenuRules}:
        { {RULES\DNEG} {RULES\DINV} {RULES\*1} {RULES\^1} {RULES\/1} * 3F21A
          {RULES\+1-1} {RULES\COLCT} }           * 3F238

* refs (7): 3AB8F 3ABA3 3ABB7 3BA95 3BAA9 3BABD ...
OBJ_3F247:
        :: TakeOver 'R ' 'FontGauge FIRST@LAM casedrop OBJ_6CAA3 * 3F247
          NoEditLine? caseDrpBadKy OBJ_3B478     * 3F26F
          CURSOR_END? caseDrpBadKy NextChrInComLine * 3F27E
          CHR># DUPUNROT OBJ_3F2D3 DUPUNROT #=case DropBadKey * 3F28D
          #>CHR INSERT? REPLACE_MODE SWAP EchoChrKey IT INSERT_MODE * 3F2AB
        ;                                        * 3F2CE

* refs (2): 3F297 6CAF8
OBJ_3F2D3:
        CON(5)  (*)+5                            * 3F2D3  primitive code object
        ASSEMBLE
        GOSBVL  POP2#                            * 3F2D8
        A=A+A   B                                * 3F2DF
        R0=A.F  A                                * 3F2E2
        A=C     A                                * 3F2E8
        GOSBVL  SAVPTR                           * 3F2EA
        LC(14)  #4E59554F494541                  * 3F2F1
        B=A     A                                * 3F301
        LA(2)   #20                              * 3F303
        D1=(5)  L_3F384                          * 3F30A
        P=      6                                * 3F311
L_3F313:
        ?B=C    B                                * 3F313
        GOYES   L_3F35B                          * 3F316
        C=C+A   B                                * 3F318
        ?B=C    B                                * 3F31B
        GOYES   L_3F35B                          * 3F31E
        CSRC                                     * 3F320
        CSRC                                     * 3F323
        D1=D1+  12                               * 3F326
        P=P-1                                    * 3F329
        GONC    L_3F313                          * 3F32B
        P=      0                                * 3F32E
        LC(6)   #435044                          * 3F330
        P=      2                                * 3F338
L_3F33A:
        ?B=C    B                                * 3F33A
        GOYES   L_3F37E                          * 3F33D
        C=C+A   B                                * 3F33F
        ?B=C    B                                * 3F342
        GOYES   L_3F37E                          * 3F345
        CSRC                                     * 3F347
        CSRC                                     * 3F34A
        D1=D1+  2                                * 3F34D
        P=P-1                                    * 3F350
        GONC    L_3F33A                          * 3F352
        C=0     A                                * 3F355
        GOTO    L_3F36C                          * 3F357
L_3F35B:
        AD1EX                                    * 3F35B
        C=R0.F  A                                * 3F35E
        A=A+C   A                                * 3F364
        D1=A                                     * 3F366
L_3F369:
        C=DAT1  B                                * 3F369
L_3F36C:
        C=C+B   B                                * 3F36C
        R0=C.F  A                                * 3F36F
        P=      0                                * 3F375
        GOVLNG  PUSH#LOOP                        * 3F377
L_3F37E:
        C=0     A                                * 3F37E
        GOTO    L_3F369                          * 3F380

* Accents: for A E I O U Y N, what to add to the letter for each accented form, 0 for none (read by OBJ_3F2D3)
L_3F384:
        CON(2)  #7F                              * 3F384  entry 0
        CON(2)  #80                              * 3F386
        CON(2)  #81                              * 3F388
        CON(2)  #82                              * 3F38A
        CON(2)  #83                              * 3F38C
        CON(2)  #84                              * 3F38E
        CON(2)  #83                              * 3F390  entry 1
        CON(2)  #84                              * 3F392
        CON(2)  #85                              * 3F394
        CON(2)  #00                              * 3F396
        CON(2)  #86                              * 3F398
        CON(2)  #81                              * 3F39A
        CON(2)  #83                              * 3F39C  entry 2
        CON(2)  #84                              * 3F39E
        CON(2)  #85                              * 3F3A0
        CON(2)  #00                              * 3F3A2
        CON(2)  #86                              * 3F3A4
        CON(2)  #00                              * 3F3A6
        CON(2)  #83                              * 3F3A8  entry 3
        CON(2)  #84                              * 3F3AA
        CON(2)  #85                              * 3F3AC
        CON(2)  #86                              * 3F3AE
        CON(2)  #87                              * 3F3B0
        CON(2)  #89                              * 3F3B2
        CON(2)  #84                              * 3F3B4  entry 4
        CON(2)  #85                              * 3F3B6
        CON(2)  #86                              * 3F3B8
        CON(2)  #00                              * 3F3BA
        CON(2)  #87                              * 3F3BC
        CON(2)  #00                              * 3F3BE
        CON(2)  #00                              * 3F3C0  entry 5
        CON(2)  #84                              * 3F3C2
        CON(2)  #00                              * 3F3C4
        CON(2)  #00                              * 3F3C6
        CON(2)  #86                              * 3F3C8
        CON(2)  #00                              * 3F3CA
        CON(2)  #00                              * 3F3CC  entry 6
        CON(2)  #00                              * 3F3CE
        CON(2)  #00                              * 3F3D0
        CON(2)  #83                              * 3F3D2
        CON(2)  #00                              * 3F3D4
        CON(2)  #00                              * 3F3D6

* Accents: the same for D, P and C
        CON(2)  #8C                              * 3F3D8  entry 0
        CON(2)  #8E                              * 3F3DA  entry 1
        CON(2)  #84                              * 3F3DC  entry 2
        RPL

* refs (1): 3D43E
OBJ_3F3DE:
        :: CONTEXT@ DUP GetLibs(di) BEGIN get1 MYRAMROMPAIR WHILE * 3F3DE
          :: 2DUPSWAP #3+ UNROLL GetLibs(di) top& ; REPEAT OBJ_3F447 RDROP * 3F406
          OBJ_410E9 LoadTouchTbl ;               * 3F438

* refs (1): 3F42E
OBJ_3F447:
        :: DUP#0= ?SEMI                          * 3F447
          pshzer BEGIN SWAPDROP#1- #2- UNROTOVER NULL$ EQUAL ITE 2DROP * 3F456
          :: TWO{}N psh1&rev ;                   * 3F483
          #0=UNTIL DROP ;                        * 3F497

* refs (1): 3D42A
OBJ_3F4A6:
        :: ' OBJ_3F4C4 2Ob>Seco InitMenu ;       * 3F4A6

* refs (3): 3F4B0 41660 416B5
OBJ_3F4C4:
        :: COERCEDUP NumEntryLin(s) DUP#0= case2drop NULL{} * 3F4C4
          ' OBJ_3F589 BINT3 ::N ;                * 3F4E2

* refs (1): 3F4CE
NumEntryLin(s):
        :: GETHASH NOTcase BINT0                 * 3F4FB
          NumEntryLin(b) ;                       * 3F50F

* refs (1): 3F50F
NumEntryLin(b):
        CON(5)  NumEntryLin(b)~1                 * 3F519  code object: the address of its machine code
        ASSEMBLE
L_3F51E:
        D0=D0+  5                                * 3F51E
        A=DAT0  A                                * 3F521
        CD0EX                                    * 3F524
        C=C+A   A                                * 3F527
        D=C     A                                * 3F529
        LA(5)   #0005A                           * 3F52B
        A=A+B   A                                * 3F535
        D1=A                                     * 3F537
        A=DAT1  A                                * 3F53A
        CD1EX                                    * 3F53D
        C=C+A   A                                * 3F540
        D1=C                                     * 3F542
        D=D-C   A                                * 3F545
        C=D     A                                * 3F547
        GOSBVL  DIV5                             * 3F549
        B=C     A                                * 3F550
L_3F552:
        A=DAT1  A                                * 3F552
        ?A=0    A                                * 3F555
        GOYES   L_3F565                          * 3F558
        B=B-1   A                                * 3F55A
        GOC     L_3F567                          * 3F55C
        D1=D1+  5                                * 3F55F
        GONC    L_3F552                          * 3F562
L_3F565:
        C=C-B   A                                * 3F565
L_3F567:
        R0=C.F  A                                * 3F567
        C=R2.F  A                                * 3F56D
        ?C=0    A                                * 3F573
        GOYES   L_3F57E                          * 3F576
        P=      1                                * 3F578
        GOSUB   SUB_3F585                        * 3F57A
L_3F57E:
        GOVLNG  PUSH#LOOP                        * 3F57E

* refs (1): 3F57A
SUB_3F585:
        RSTK=C                                   * 3F585
        RTN                                      * 3F587
        RPL

* refs (1): 3F4E7
OBJ_3F589:
        :: 2RDROP CheckMenuRow DUP #5+ ROT #MIN SWAP#1- BINT0 4UNROLL BINT1 * 3F589
          3UNROLL DO OVER INDEX@ #>ROMPTR psh1&rev LOOP 2DROP LoadTouchTbl ; * 3F5C0
        NIBHEX  00000                            * 3F5F2  ..

* refs (1): 3D457
OBJ_3F5F7:
        :: DUPTYPECSTR? ITE MakeStdLabel         * 3F5F7
          :: #:>$ _:__253B8 SWAP &$ MakeDirLabel ; * 3F60B
          Grob>Menu ;                            * 3F62E

* refs (1): 3D484
OBJ_3F638:
        :: BINT0 BINT1 BINT34 ONE_DO OBJ_3F66F LOOP RDROP OBJ_410E9 * 3F638
          LoadTouchTbl ;                         * 3F665

* refs (1): 3F651
OBJ_3F66F:
        :: INDEX@ DUP PORTSTATUS 2DROP case 3DROP * 3F66F
          DROP NOTcaseDROP SWAP#1+               * 3F692
        ;                                        * 3F6A1

* refs (1): 3D470
OBJ_3F6A6:
        :: ' SetRebuild ' ' ROT ' OBJ_3F6E7 2Ob>Seco BINT3 ::N InitMenu ; * 3F6A6

* refs (1): 3F6C9
OBJ_3F6E7:
        :: 2RDROP GetBVars OBJ_410E9 pvars(s,B) LoadTouchTbl ; * 3F6E7

* refs (1): 3BF03
OBJ_3F70A:
        :: RDROP CONTEXT@ LastNonNull NOTcase    * 3F70A
          :: BINT1 MenuRow! BINT0 LoadTouchTbl ; * 3F723
          OBJ_3F7B4 DUP RAM-WORDNAME BINT1 ROT BINT6 ONE_DO PrevNonNull ITE * 3F741
          :: DUP RAM-WORDNAME SWAPROT #1+SWAP ;  * 3F76E

* ob -> ob ob
DUPExitAtLOOP:
          :: DUP ExitAtLOOP ;                    * 3F78C
          LOOP DROP LoadTouchTbl ;               * 3F7A0

* refs (2): 3F741 3F827
OBJ_3F7B4:
        :: MenuRow@ DUP#1= caseDROP BINT1        * 3F7B4
          3PICK ROT ONE_DO PrevNonNull ITE SWAP#1+SWAP * 3F7CD

* ob -> ob ob
ExitAtLOOPDUP:
          :: ExitAtLOOP DUP ;                    * 3F7EB
          LOOP OVER MenuRow@ #=case ROTROT2DROP  * 3F7FF
          DROP CheckMenuRow 2DROP OBJ_3F7B4 ;    * 3F818

* refs (1): 3FCC8
RclKeyP1(s):
        :: OBJ_3F8FE BINT1 over;=1(s);?:3+(s) over;=2(s);?:1+(s) * 3F831
          over;=3(s);?:2+(s) OBJ_3F9DA ;         * 3F84A

* refs (1): 3FCF5
RclKeyP2(s):
        :: OBJ_3F8FE BINT2 over;=1(s);?:3+(s) over;=3(s);?:1+(s) OBJ_3F9DA ; * 3F859

* refs (1): 3FD22
RclKeyP3(s):
        :: OBJ_3F8FE BINT3 over;=1(s);?:3+(s) OBJ_3F99E OBJ_3F9DA ; * 3F87C

* refs (1): 3FD4F
RclKeyP4(s):
        :: OBJ_3F8FE BINT4 over;=2(s);?:1+(s) over;=3(s);?:2+(s) OBJ_3F9DA ; * 3F89F

* refs (1): 3FD7C
RclKeyP5(s):
        :: OBJ_3F8FE BINT5 over;=3(s);?:1+(s) OBJ_3F9DA ; * 3F8C2

* refs (1): 3FDA9
RclKeyP6(s):
        :: OBJ_3F8FE BINT6 OBJ_3F99E OBJ_3F9DA ; * 3F8E0

* refs (6): 3F836 3F85E 3F881 3F8A4 3F8C7 3F8E5
OBJ_3F8FE:
        :: BINT64 #/ DUP #0=?SEMI DUP#1= casedrop BINT2 * 3F8FE
          DUP #2= casedrop BINT1                 * 3F926
        ;                                        * 3F93A

* Unreferenced NOP between objects: padding
        CON(5)  NOP                              * 3F93F  entry 0

* refs (3): 3F840 3F868 3F88B
over;=1(s);?:3+(s):
        :: OVER #1= IT #3+                       * 3F944
        ;                                        * 3F95D

* refs (2): 3F845 3F8AE
over;=2(s);?:1+(s):
        :: OVER #2= IT #1+                       * 3F962
        ;                                        * 3F97B

* refs (2): 3F84A 3F8B3
over;=3(s);?:2+(s):
        :: OVER #3= IT #2+                       * 3F980
        ;                                        * 3F999

* refs (2): 3F890 3F8EF
OBJ_3F99E:
        :: OVER #2= IT #1-                       * 3F99E
        ;                                        * 3F9B7

* refs (2): 3F86D 3F8D1
over;=3(s);?:1+(s):
        :: OVER #3= IT #1+                       * 3F9BC
        ;                                        * 3F9D5

* refs (6): 3F84F 3F872 3F895 3F8B8 3F8D6 3F8F4
OBJ_3F9DA:
        :: SWAPDROP 2DUP OBJ_3F9FD 3UNROLL OBJ_3FC0F ; * 3F9DA

* refs (1): 3F9E9
OBJ_3F9FD:
        :: AppMode? NOTcase Key>U/SKeyOb         * 3F9FD
          2DUP AppKeys@ EVAL case ROTROT2DROP    * 3FA11
          NAppKeyOK? NOT case2drop 'DoBadKey     * 3FA2A
          DoStdKeys? case Key>StdKeyOb           * 3FA3E
          Key>U/SKeyOb ;                         * 3FA4D

* #kc #pl -> ob
* refs (15): 19F56 1A066 3FA0C 3FA4D A2C6F A3C63 ...
Key>U/SKeyOb:
        :: 2DUP ?Key>UKeyOb case ROTROT2DROP     * 3FA57
          Key>StdKeyOb ;                         * 3FA70

* refs (2): 3FA61 3FC82
?Key>UKeyOb:
        :: UserKeys? NOT case2drpfls 2DUP        * 3FA7A
          GetUserKeys ?Key>UKeyOb~2 case ?Key>UKeyOb~1 * 3FA93
          NonUsrKeyOK? case2drpfls ModifierKey?  * 3FAA7
          caseFALSE 'DoBadKeyT                   * 3FAB6
        ;                                        * 3FAC0

* refs (1): 3FAA2
?Key>UKeyOb~1:
        :: DUP'                                  * 3FAC5

* ID SKEY
ID_SKEY:
          ID SKEY EQUAL OVER'                    * 3FACF

* LAM SKEY
LAM_SKEY:
          LAM SKEY EQUALOR NOTcase XYZ>ZTRUE     * 3FAE8
          DROP Key>StdKeyOb TRUE ;               * 3FB06

* #kc #pl -> ob
* refs (5): 19F98 3FA48 3FA70 3FB0B CFC4F
Key>StdKeyOb:
        :: Key>StdKeyOb~1 ROMPTR@ ?SEMI          * 3FB1A
          'DoBadKey ;                            * 3FB2E
        FILLTO  #3FB5A                           * 3FB38  34 zero nibbles: the next entry stays at #3FB5A

* refs (1): 3C35C
OBJ_3FB5A:
        :: SolvMenuInit ' OBJ_3FB78 ReviewKey! ; * 3FB5A

* refs (1): 3FB69
OBJ_3FB78:
        :: ROMPTR 0E6 00A OBJ_7D966 INNERCOMP #1+ ONE_DO ONESWAP OBJ_41495 * 3FB78
          BINT8 INDEX@#- DISPN LOOP SetDA12Temp SetDA3NoCh ; * 3FBA6

* refs (1): 3FA98
?Key>UKeyOb~2:
        :: DUPNULL{}? casedrop 2DROPFALSE        * 3FBC9
          ROT NTHCOMPDROP DUPNULL{}? case2drpfls SWAP * 3FBDD
          NTHCOMPDROP DUPNULL{}? casedrpfls TRUE * 3FBF6
        ;                                        * 3FC0A

* refs (1): 3F9F3
OBJ_3FC0F:
        :: Lock? ITE àShiftOnly SetKeysNS        * 3FC0F
          1USR? NOTcase2DROP 2DUP                * 3FC28
          ModifierKey? case OBJ_3FC7D            * 3FC37
          OVER BINT30 #= OVER BINT2 #= ANDcase OBJ_3FC7D * 3FC46
          2DROP ~QuitUserMo;SetDA1Bad ;          * 3FC6E

* refs (2): 3FC41 3FC69
OBJ_3FC7D:
        :: ?Key>UKeyOb NOT?SEMI                  * 3FC7D
          DROP ~QuitUserMo;SetDA1Bad ;           * 3FC8C

* refs (2): 3FC73 3FC91
~QuitUserMo;SetDA1Bad:
        :: QuitUserMo SetDA1Bad ;                * 3FC9B

* ob ->
* refs (5): 3DA0D 3FC23 3FEF3 40D43 CF6C9
SetKeysNS:
        :: ClrAlphaAnn ClrLeftAnn ClrRightAnn ' RclKeyP1(s) BINT7 OBJ_04A57 ; * 3FCAF

* refs (1): 3B75F
RShiftOnly:
        :: ClrAlphaAnn SetLeftAnn ClrRightAnn ' RclKeyP2(s) BINT7 OBJ_04A57 ; * 3FCDC

* refs (2): 3B798 3DA9C
LShiftOnly:
        :: ClrAlphaAnn ClrLeftAnn SetRightAnn ' RclKeyP3(s) BINT7 OBJ_04A57 ; * 3FD09

* refs (4): 3AA2D 3BAE1 3FC1E 40D2F
àShiftOnly:
        :: SetAlphaAnn ClrLeftAnn ClrRightAnn ' RclKeyP4(s) BINT7 OBJ_04A57 ; * 3FD36

* refs (1): 3AFF0
àLShiftOnly:
        :: SetAlphaAnn SetLeftAnn ClrRightAnn ' RclKeyP5(s) BINT7 OBJ_04A57 ; * 3FD63

* refs (1): 3B025
àRShiftOnly:
        :: SetAlphaAnn SetRightAnn ClrLeftAnn ' RclKeyP6(s) BINT7 OBJ_04A57 ; * 3FD90

* ob ob' ->
* refs (1): 4035F
2DropBadKey:
        :: DROP                                  * 3FDBD

* ob ->
* refs (6): 3F01D 3F2A6 4007B 400A8 63BE1 8F9B6
DropBadKey:
          :: DROP                                * 3FDC7

* ->
* refs (149): 0C7B7 144C0 144ED 14515 18038 19E53 ...
DoBadKey:
            :: TakeOver BINT70 INTEGER337 setbeep SetDA123NoCh ; ; * 3FDD1
        ;                                        * 3FDF9

* -> DoBadKey
* refs (5): 3FA39 3FB2E 3FE17 411FC CFC8D
'DoBadKey:
        :: ' DoBadKey ;                          * 3FDFE

* -> DoBadKey T
* refs (44): 1A07A 1A0AE 3FABB 43879 4390F 43978 ...
'DoBadKeyT:
        :: 'DoBadKey TRUE ;                      * 3FE12

* refs (1): 42055
H/WKey>KeyOb:
        :: H/W>KeyCode BINT7 GETPROC H/WKey>KeyOb~1 ; * 3FE26

* # -> #'
* refs (2): 1A88C 3FE2B
H/W>KeyCode:
        :: BINT128 #=casedrop BINT30             * 3FE44
          BINT64 #=casedrop BINT35               * 3FE58
          BINTC0h #=casedrop BINT40              * 3FE67
        ;                                        * 3FE76

* #kc #pl -> flag
* refs (3): 3FAB1 3FC37 41FF1
ModifierKey?:
        :: OVER BINT35 #= case2drop TRUE         * 3FE7B
          OVER BINT40 #= case2drop TRUE          * 3FE99
          SWAP BINT30 #<> casedrpfls DUP         * 3FEB2
          BINT1 #= SWAP BINT4 #= OR ;            * 3FECB

* refs (2): 385F7 3887C
OBJ_3FEEE:
        :: SetKeysNS OBJ_3FFCA KeyOb0 OBJ_424C7 ; * 3FEEE

* Unreferenced NOPs between objects: padding
        CON(5)  NOP                              * 3FF0C  entry 0
        CON(5)  NOP                              * 3FF11
        NIBHEX  E8E60                            * 3FF16  ←n

* # #' -> :: ' ob1 T ; -> :: <ob2> <rest> ;
* refs (84): 43156 43165 43897 438A6 438B5 438C4 ...
?CaseKeyDef:
        :: OVER #<>case SKIP                     * 3FF1B
          DROP 'R TRUE RDROP ;                   * 3FF2F

* # #' -> ob T -> F -> :: <ob2> <rest> ;
* refs (40): 9CE7F 9CE94 9CEB3 9CEC8 9CF41 9CF56 ...
?CaseRomptr@:
        :: OVER #<>case SKIP                     * 3FF48
          DROP 'R ROMPTR@ RDROP ;                * 3FF5C

* -> flag
* refs (2): 22595 3FAA7
NonUsrKeyOK?:
        CON(5)  (*)+5                            * 3FF75  primitive code object
        ASSEMBLE
        LC(3)   #40A                             * 3FF7A
        GOVLNG  L_539E6                          * 3FF7F

* ->
* refs (2): 41BAF 41F22
SetNUsrKeyOK:
        CON(5)  (*)+5                            * 3FF86  primitive code object
        LC(3)   #40A                             * 3FF8B
        GOVLNG  SetISysFlag                      * 3FF90

* ->
* refs (1): 41BC3
ClrNUsrKeyOK:
        CON(5)  (*)+5                            * 3FF97  primitive code object
        LC(3)   #40A                             * 3FF9C
        GOVLNG  L_539F1                          * 3FFA1

* refs (3): 397CF 3D96F 3FC28
1USR?:
        CON(5)  (*)+5                            * 3FFA8  primitive code object
        LC(3)   #106                             * 3FFAD
        GOVLNG  L_539E6                          * 3FFB2

* refs (1): 40D70
SetUserMo~1:
        CON(5)  (*)+5                            * 3FFB9  primitive code object
        LC(3)   #106                             * 3FFBE
        GOVLNG  SetISysFlag                      * 3FFC3

* refs (3): 3D979 3FEF8 40D89
OBJ_3FFCA:
        CON(5)  (*)+5                            * 3FFCA  primitive code object
        LC(3)   #106                             * 3FFCF
        GOVLNG  L_539F1                          * 3FFD4
L_3FFDB:
        FILLTO  #40002                           * 3FFDB  39 zero nibbles: the next entry stays at #40002
