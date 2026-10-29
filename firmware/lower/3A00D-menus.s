* HP 48GX ROM revision R, #3A00D-#3D00D: Menus and the built-in libraries 0A1-0A7
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: 'DROPFALSE DispMenu MakeStdLabel Grob>Menu DispEditLine ?DispMenu DispMenu.1 BlankDA12 SetSomeRow MakeLabel MakeDirLabel EditMenu
* Follows on from the previous file (at #3A00D in the original ROM).
        RPL

* ->
* refs (8): 19BB3 386BF 427F0 4298F 429B7 430B6 ...
DispEditLine:
        :: TOADISP SetDA2bValid SetDA2bEdit COLA OBJ_3A030 * 3A00D
        ;                                        * 3A02B

* refs (4): 3A026 40B6F D85F3 D8700
OBJ_3A030:
        :: NoEditLine? ?SEMI                     * 3A030
          EDITLINE$ BINT1 OBJ_3A0E4 OBJ_39FE3 OBJ_39FE3 EDITPARTS BINT4 #MIN * 3A03F
          #- DO dup2;spos(st,RC) DUP#0=IT        * 3A067
          :: DROP OVERLEN$ #1+ ; 3PICK ROT FIRSTC@ #+ 3PICKOVER 2DUP#< ITE * 3A07B
          OBJ_3A125 OBJ_3A139                    * 3A0B7
          INDEX@ BigDisp(st,s) #1+ LOOP 2DROP OBJ_42831 ; * 3A0C1

* refs (1): 3A049
OBJ_3A0E4:
        :: OBJ_113F2 DUP ONE_EQ caseDROP ONE_DO  * 3A0E4
          OVER CHR_Newline ROT POS$ #1+ LOOP ;   * 3A102

* refs (1): 3A0B7
OBJ_3A125:
        :: 4DROP _chr(31)_ ;                     * 3A125

* refs (1): 3A0BC
OBJ_3A139:
        :: #- begin<16>end 2DUP#> 5UNROLL 2DUP#= 3UNROLL #MIN SWAP ?SKIP #1- * 3A139
          OVER#+ FIRSTC@ #0<> DUP 5UNROLL IT SWAP#1+SWAP * 3A170
          SUB$SWAP IT                            * 3A193

+(_..._,st):
          :: CHR_... >H$ ;                       * 3A19D
          SWAP NOT?SEMI                          * 3A1B1
          CHR_... >T$ ;                          * 3A1BB

* ->
* refs (8): 19C1E 386C9 430C0 43793 8D715 BA760 ...
?DispMenu:
        :: KEYINBUFFER? NOTcase DispMenu         * 3A1CA
          SetDA3Bad ;                            * 3A1DE

* ->
* refs (45): 0C91A 3A1D9 46204 47D4C 47D89 4A069 ...
DispMenu:
        :: DispMenu.1 SetDA3Valid ;              * 3A1E8

* ->
* refs (6): 0C9DB 1A75B 3A1ED 4EE97 6CCB2 737C9
DispMenu.1:
        :: TURNMENUON DispMenu.1~1 # 6E # 58 # 42 BINT44 BINT22 BINT0 BINT7 * 3A1FC
          ONE_DO INDEX@ GETDF DoLabel LOOP DispMenu.1~2 ; * 3A23D

* #col grob -> #col $ -> #col id -> #col :: ->
* refs (2): 154AA 41049
>MENU:
        :: CK&DISPATCH0                          * 3A260
          BINT12 Grob>Menu                       * 3A26A  grob
          BINT3 Str>Menu                         * 3A274  string
          BINT8 Seco>Menu                        * 3A27E  program
          BINT6 Id>Menu                          * 3A288  name
        ;                                        * 3A292

* #col grob ->
* refs (8): 154C3 3A26F 3A2BF 3A31E 3F059 3F62E ...
Grob>Menu:
        :: HARDBUFF2 ROT BINT0 GROB! ;           * 3A297

* #col $ ->
* refs (1): 3A279
Str>Menu:
        :: MakeStdLabel Grob>Menu ;              * 3A2B5

* #col :: ->
* refs (1): 3A283
Seco>Menu:
        :: EVAL DoLabel ;                        * 3A2C9

* #col id ->
* refs (1): 3A28D
Id>Menu:
        :: DUP ID>$ SWAP DRPExitAtLOOP ITE       * 3A2DD

MakeLabel(st,di?):
          :: TYPERRP? ITE MakeDirLabel MakeStdLabel * 3A2FB
          ;                                      * 3A314
          MakeStdLabel                           * 3A319
          Grob>Menu ;                            * 3A31E

* $ -> grob
* refs (9): 3A2BA 3A30F 3A319 3ECA8 3ED16 3F04F ...
MakeStdLabel:
        :: BINT20 BINT11                         * 3A328

* 21x8 normal menu key
* refs (1): 412FB
NullMenuLbl:
          GROBW   "images/3A337-NullMenuLbl.png" 21 * 3A337  21 x 8; the padding (gray) is not zero
          MakeLabel INVGROB ;                    * 3A37B

* $ -> grob
* refs (3): 3ECA3 3ED1B 9DFBD
MakeBoxLabel:
        :: BINT16 BINT9                          * 3A38A

* 21x8 menu key with box
BoxLabelGrob:
          GROBW   "images/3A399-BoxLabelGrob.png" 21 * 3A399  21 x 8; the padding (gray) is not zero
          MakeLabel INVGROB ;                    * 3A3DD

* $ -> grob
* refs (5): 3A30A 3ED7A 3F054 3F624 9DF53
MakeDirLabel:
        :: BINT20 BINT11                         * 3A3EC

* 21x8 directory menu key
DirLabelGrob:
          GROBW   "images/3A3FB-DirLabelGrob.png" 21 * 3A3FB  21 x 8; the padding (gray) is not zero
          MakeLabel INVGROB ;                    * 3A43F

* $ -> grob
* refs (3): 154BE 9DF26 9E047
MakeInvLabel:
        :: BINT18 BINT11                         * 3A44E

* 21x8 inverse menu key
InvLabelGrob:
          GROBW   "images/3A45D-InvLabelGrob.png" 21 * 3A45D  21 x 8; the padding (gray) is not zero
          MakeLabel ;                            * 3A4A1

* $ #w #x grob -> grob'
* refs (5): 3A37B 3A3DD 3A43F 3A4A1 9E015
MakeLabel:
        :: TOTEMPSWAP 2SWAP BINT5 3UNROLL CENTER$3x5 ; * 3A4AB

* $ #start #max ->
* refs (4): 140E7 43115 9CC7F D101F
Disp5x7:
        :: BINT1 3UNROLL OVER#+ SWAP DO dup2;spos(st,RC) DUP#0=IT * 3A4CE
          :: DROP MINUSONE ExitAtLOOP ; DUP#1+ 3UNROLL 4PICK 3UNROLL #1- * 3A4F6
          SUB$ INDEX@ DISPN LOOP 2DROP ;         * 3A528

* ->
* refs (1): 49464
BlankDA1:
        :: BINT0 BINT16 BLANKIT ;                * 3A546

* ->
BlankDA2:
        :: BINT16 BINT40 BLANKIT ;               * 3A55F

* ->
* refs (6): 153C5 19B44 2014C 9E434 9EA36 BB9F4
BlankDA12:
        :: BINT0 BINT56 BLANKIT ;                * 3A578

* ->
* refs (2): 43101 8D58E
BlankDA2a:
        :: BINT16 BINT4 EDITPARTS BINT4 #MIN #- #10* DUP#0=case 2DROP * 3A591
          BLANKIT ;                              * 3A5C3

* refs (1): 410B2
StartMenu~1:
        :: CK&DISPATCH0                          * 3A5CD
          BINT5 NOP                              * 3A5D7  list
          BINT8 EVAL                             * 3A5E1  program
          BINT15 StartMenu~1~romptr              * 3A5EB  romptr
        ;                                        * 3A5F5

* refs (1): 3A5F0
StartMenu~1~romptr:
        :: DUP StartMenu~1~romptr~1 # DOARRY #<>case EVAL * 3A5FA  address
          DROP '                                 * 3A61D
          :: MenuDef@ OBJ_3A640 ; ;              * 3A627

* refs (13): 3A631 3C426 3C478 3C4B0 3C502 3C53A ...
OBJ_3A640:
        :: 2RDROP MenuRow@ OBJ_3A753 MenuRow! OBJ_41826 OBJ_3A939 OBJ_3A929 * 3A640
          OBJ_3A919 OBJ_3A909 OBJ_3A8F9 OBJ_3A8E9 BINT7 ONE_DO OBJ_3A6AE * 3A668
          INDEX@ DUPUNROT OBJ_04A4C OBJ_04A57 LOOP OBJ_41815 ; * 3A68B

* refs (2): 3A686 411A7
OBJ_3A6AE:
        :: DUPTYPEROMP? NOTcase OBJ_411D4        * 3A6AE
          DUP ROMPTRDECOMP case ID>$             * 3A6C2
          ROMPTR@ ?SKIP ROMPTR 0A8 000           * 3A6D6
          OBJ_411D4 ;                            * 3A6EB
        FILLTO  #3A71C                           * 3A6F5  39 zero nibbles: the next entry stays at #3A71C

* refs (2): 4D78B 6A81A
DoNextRow:
        :: MenuMaker BINT6 SetSomeRow ;          * 3A71C

* refs (3): 4D7AE 6A83D CFD28
DoPrevRow:
        :: MenuMaker # FFFFA SetSomeRow ;        * 3A735

* refs (1): 3A64F
OBJ_3A753:
        CON(5)  (*)+5                            * 3A753  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 3A758
        R4=A.F  A                                * 3A75F
        A=DAT1  A                                * 3A765
        D1=D1+  5                                * 3A768
        D=D+1   A                                * 3A76B
        GOSBVL  SAVPTR                           * 3A76D
        D0=(5)  KeyRomPtr1                       * 3A774
        LC(5)   DOROMP                           * 3A77B
        P=      5                                * 3A782
        LC(6)   #0000A8                          * 3A784
        P=      0                                * 3A78C
        DAT0=C  11                               * 3A78E
        D0=D0+  11                               * 3A792
        DAT0=C  11                               * 3A795
        D0=D0+  11                               * 3A799
        DAT0=C  11                               * 3A79C
        D0=D0+  11                               * 3A7A0
        DAT0=C  11                               * 3A7A3
        D0=D0+  11                               * 3A7A7
        DAT0=C  11                               * 3A7AA
        D0=D0+  11                               * 3A7AE
        DAT0=C  11                               * 3A7B1
        GOSBVL  SUB_07ED8                        * 3A7B5
        ?ST=1   1                                * 3A7BC
        GOYES   L_3A7D6                          * 3A7BF
        GOSUB   SUB_3A83B                        * 3A7C1
L_3A7C5:
        GOSUB   SUB_3A8B9                        * 3A7C5
        A=R4.F  A                                * 3A7C9
        GOVLNG  PUSH#ALOOP                       * 3A7CF
L_3A7D6:
        D0=(5)  #800FF                           * 3A7D6
        C=DAT0  A                                * 3A7DD
        R3=C.F  A                                * 3A7E0
        P=      0                                * 3A7E6
        GOSUB   SUB_3A837                        * 3A7E8
        GOSUB   SUB_3A83B                        * 3A7EC
        A=B     A                                * 3A7F0
        R2=A.F  A                                * 3A7F2
        C=0     S                                * 3A7F8
        R0=C.F  A                                * 3A7FB
        LC(5)   IRAMBUFF                         * 3A801
        R1=C.F  A                                * 3A808
        A=A+1   A                                * 3A80E
        C=A     A                                * 3A810
        C=C+C   A                                * 3A812
        A=A+C   A                                * 3A814
        A=A+A   A                                * 3A816
        P=      2                                * 3A818
        C=R3.F  A                                * 3A81A
        GOSUB   SUB_3A837                        * 3A820
        C=R2.F  A                                * 3A824
        B=C     A                                * 3A82A
        LC(5)   IRAMBUFF                         * 3A82C
        GOTO    L_3A7C5                          * 3A833

* refs (2): 3A7E8 3A820
SUB_3A837:
        RSTK=C                                   * 3A837
        RTN                                      * 3A839

* refs (2): 3A7C1 3A7EC
SUB_3A83B:
        D1=A                                     * 3A83B
        D1=D1+  10                               * 3A83E
        D1=D1+  10                               * 3A841
        C=DAT1  A                                * 3A844
        A=R4.F  A                                * 3A847
        ?C>=A   A                                * 3A84D
        GOYES   L_3A85F                          * 3A850
        GOSUB   SUB_3A883                        * 3A852
        R4=A.F  A                                * 3A856
        C=DAT1  A                                * 3A85C
L_3A85F:
        C=C-A   A                                * 3A85F
        B=C     A                                * 3A861
        C=0     A                                * 3A863
        LC(1)   #5                               * 3A865
        ?B<=C   A                                * 3A868
        GOYES   L_3A86F                          * 3A86B
        B=C     A                                * 3A86D
L_3A86F:
        D1=D1+  5                                * 3A86F
        A=A-1   A                                * 3A872
        C=A     A                                * 3A874
        C=C+C   A                                * 3A876
        A=A+C   A                                * 3A878
        A=A+A   A                                * 3A87A
        CD1EX                                    * 3A87C
        C=C+A   A                                * 3A87F
        RTN                                      * 3A881

* refs (1): 3A852
SUB_3A883:
        B=C     A                                * 3A883
        LC(5)   #FFFFB                           * 3A885
        ?C=A    A                                * 3A88C
        GOYES   L_3A897                          * 3A88F
        A=0     A                                * 3A891
        A=A+1   A                                * 3A893
        RTN                                      * 3A895
L_3A897:
        A=B     A                                * 3A897
        R0=A.F  A                                * 3A899
        A=A-1   A                                * 3A89F
        C=0     A                                * 3A8A1
        LC(1)   #6                               * 3A8A3
        GOSBVL  IntDiv                           * 3A8A6
        C=R0.F  A                                * 3A8AD
        C=C-A   A                                * 3A8B3
        A=C     A                                * 3A8B5
        RTN                                      * 3A8B7

* refs (1): 3A7C5
SUB_3A8B9:
        D0=C                                     * 3A8B9
        D1=(5)  #80961                           * 3A8BC
L_3A8C3:
        C=DAT0  6                                * 3A8C3
        DAT1=C  6                                * 3A8C7
        B=B-1   A                                * 3A8CB
        RTNC                                     * 3A8CD
        D0=D0+  6                                * 3A8D0
        D1=D1+  11                               * 3A8D3
        GONC    L_3A8C3                          * 3A8D6
        B=C-B   A                                * 3A8D9
        ?D=C    A                                * 3A8DB
        GOYES   L_3A91E+3                        * 3A8DE
        DAT1=A  1                                * 3A8E0
        ?ST=0   15                               * 3A8E4
        GOYES   OBJ_3A8E9+3                      * 3A8E7

* refs (1): 3A677
OBJ_3A8E9:
        CON(5)  (*)+5                            * 3A8E9  primitive code object
        LC(5)   KeyRomPtr1                       * 3A8EE
        GOTO    L_3A945                          * 3A8F5

* refs (1): 3A672
OBJ_3A8F9:
        CON(5)  (*)+5                            * 3A8F9  primitive code object
        LC(5)   KeyRomPtr2                       * 3A8FE
        GOTO    L_3A945                          * 3A905

* refs (1): 3A66D
OBJ_3A909:
        CON(5)  (*)+5                            * 3A909  primitive code object
        LC(5)   KeyRomPtr3                       * 3A90E
        GOTO    L_3A945                          * 3A915

* refs (1): 3A668
OBJ_3A919:
        CON(5)  (*)+5                            * 3A919  primitive code object
* a branch also enters #3A921, where the nibbles decode as GOSUB #3A12E
L_3A91E:
        LC(5)   KeyRomPtr4                       * 3A91E
        GOTO    L_3A945                          * 3A925

* refs (1): 3A663
OBJ_3A929:
        CON(5)  (*)+5                            * 3A929  primitive code object
        LC(5)   KeyRomPtr5                       * 3A92E
        GOTO    L_3A945                          * 3A935

* refs (1): 3A65E
OBJ_3A939:
        CON(5)  (*)+5                            * 3A939  primitive code object
        LC(5)   KeyRomPtr6                       * 3A93E
L_3A945:
        A=C     A                                * 3A945
        GOVLNG  DOBINT                           * 3A947

* refs (1): 3FB1F
Key>StdKeyOb~1:
        CON(5)  (*)+5                            * 3A94E  primitive code object
        GOSBVL  POP#                             * 3A953
        LC(5)   #000A0                           * 3A95A
        A=A+C   A                                * 3A961
        LC(5)   #80956                           * 3A963
        CD0EX                                    * 3A96A
        R0=C.F  A                                * 3A96D
        DAT0=A  3                                * 3A973
        C=DAT1  A                                * 3A977
        CD1EX                                    * 3A97A
        D1=D1+  5                                * 3A97D
        A=DAT1  A                                * 3A980
        A=A-1   A                                * 3A983
        D0=D0+  3                                * 3A985
        DAT0=A  3                                * 3A988
        LA(5)   DOROMP                           * 3A98C
        D0=D0-  8                                * 3A996
        DAT0=A  A                                * 3A999
        D1=C                                     * 3A99C
        CD0EX                                    * 3A99F
        DAT1=C  A                                * 3A9A2
        C=R0.F  A                                * 3A9A5
        D0=C                                     * 3A9AB
        A=DAT0  A                                * 3A9AE
        D0=D0+  5                                * 3A9B1
        PC=(A)                                   * 3A9B4

* -> DROPFALSE
* refs (82): A2DF6 A49EA A4A3A A4A8A A4AE5 A4BA0 ...
'DROPFALSE:
        CON(5)  (*)+5                            * 3A9B8  primitive code object
        LC(5)   DROPFALSE                        * 3A9BD
        A=C     A                                * 3A9C4
        GOVLNG  PUSHA                            * 3A9C6
        NIBHEX  0                                * 3A9CD
        RPL

* refs (3): 4D0AB 4D853 6B423
TurnOffKey:
        :: Modifier TurnOff SetDA123NoCh ;       * 3A9CE

* #n ->
* refs (5): 3A72B 3A749 3B3C8 3D802 CFCCF
SetSomeRow:
        :: MenuRow@ #+ MenuRow! SetThisRow OBJ_418E4 ; * 3A9E7

* ->
* refs (1): 3B72B
1A/LockA:
        :: Modifier SetDA123NoCh BINT60 TestSysFlag case LockAlpha * 3AA0A
          àShiftOnly ;                           * 3AA2D

        :: DoDelims $_<<>> ?ClrAlgSetPr ;        * 3AA37

* refs (1): C62C7
OBJ_3AA50:
        CON(5)  (*)+5                            * 3AA50  primitive code object
        ASSEMBLE
        AD0EX                                    * 3AA55
        D0=(5)  SystemFlags                      * 3AA58
        P=      8                                * 3AA5F
        LC(8)   #00000000                        * 3AA61
        P=      0                                * 3AA6B
        LC(8)   #000003F0                        * 3AA6D
        DAT0=C  W                                * 3AA77
        AD0EX                                    * 3AA7B
        A=DAT0  A                                * 3AA7E
        D0=D0+  5                                * 3AA81
        PC=(A)                                   * 3AA84
        CSL     A                                * 3AA88
        LC(1)   #0                               * 3AA8A
        RTNSXM                                   * 3AA8D

LIB0A6:
        CON(3)  #0A6                             * 3AA8F  library number
        REL(5)  LIB0A6.hash                      * 3AA92  hash table
        CON(5)  0                                * 3AA97  message table
        REL(5)  LIB0A6.link                      * 3AA9C  link table
        CON(5)  0                                * 3AAA1  config
        RPL

* ROMPTR 0A6 000
* refs (1): 3AA8F
K_140:
        CHR "α"                                  * 3AAA6

* ROMPTR 0A6 001
* refs (1): 3AA8F
K_223:
        CHR "ß"                                  * 3AAAD

* ROMPTR 0A6 002
* refs (1): 3AA8F
K_155:
        CHR "Δ"                                  * 3AAB4

* ROMPTR 0A6 003
* refs (1): 3AA8F
K_146:
        CHR "δ"                                  * 3AABB

* ROMPTR 0A6 004
* refs (1): 3AA8F
K_147:
        CHR "ε"                                  * 3AAC2

* ROMPTR 0A6 005
* refs (1): 3AA8F
K_149:
        CHR "θ"                                  * 3AAC9

* ROMPTR 0A6 006
* refs (1): 3AA8F
K_145:
        CHR "γ"                                  * 3AAD0

* ROMPTR 0A6 007
* refs (1): 3AA8F
K_148:
        CHR "η"                                  * 3AAD7

* ROMPTR 0A6 008
* refs (1): 3AA8F
K_159:
        CHR "∞"                                  * 3AADE

* ROMPTR 0A6 009
* refs (1): 3AA8F
K__!_:
        CHR "|"                                  * 3AAE5

* ROMPTR 0A6 00A
* refs (1): 3AA8F
K_144:
        CHR "↑"                                  * 3AAEC

* ROMPTR 0A6 00B
* refs (1): 3AA8F
K_150:
        CHR "λ"                                  * 3AAF3

* ROMPTR 0A6 00C
* refs (1): 3AA8F
K__'_:
        CHR "'"                                  * 3AAFA

* ROMPTR 0A6 00D
* refs (1): 3AA8F
K_181:
        CHR "µ"                                  * 3AB01

* ROMPTR 0A6 00E
* refs (1): 3AA8F
K_157:
        CHR "Ω"                                  * 3AB08

* ROMPTR 0A6 00F
* refs (1): 3AA8F
K_142:
        CHR "←"                                  * 3AB0F

* ROMPTR 0A6 010
* refs (1): 3AA8F
K_143:
        CHR "↓"                                  * 3AB16

* ROMPTR 0A6 011
* refs (1): 3AA8F
K_151:
        CHR "ρ"                                  * 3AB1D

* ROMPTR 0A6 012
* refs (1): 3AA8F
K_152:
        CHR "σ"                                  * 3AB24

* ROMPTR 0A6 013
* refs (1): 3AA8F
K_153:
        CHR "τ"                                  * 3AB2B

* ROMPTR 0A6 014
* refs (1): 3AA8F
K__%_:
        CHR "%"                                  * 3AB32

* ROMPTR 0A6 015
* refs (1): 3AA8F
K__~_:
        CHR "~"                                  * 3AB39

* ROMPTR 0A6 016
* refs (1): 3AA8F
K_154:
        CHR "ω"                                  * 3AB40

* ROMPTR 0A6 017
* refs (1): 3AA8F
K_129:
        CHR "ā"                                  * 3AB47

* ROMPTR 0A6 018
* refs (2): 3AA8F 6BD30
K__ë_:
        CHR "@"                                  * 3AB4E

* ROMPTR 0A6 019
* refs (1): 3AA8F
K_177:
        CHR "±"                                  * 3AB55

* ROMPTR 0A6 01A
* refs (1): 3AA8F
K_156:
        CHR "Π"                                  * 3AB5C

* ROMPTR 0A6 01B
* refs (1): 3AA8F
K_161:
        CHR "¡"                                  * 3AB63

* ROMPTR 0A6 01C
* refs (1): 3AA8F
K_191:
        CHR "¿"                                  * 3AB6A

* ROMPTR 0A6 01D
* refs (1): 3AA8F
ROMP_0A6_01D:
        :: TakeOver InvCursor SetDA12NoCh ;      * 3AB71

* ROMPTR 0A6 01E
* refs (1): 3AA8F
ROMP_0A6_01E:
        :: OBJ_3F247 BINT1 ;                     * 3AB8A

* ROMPTR 0A6 01F
* refs (1): 3AA8F
ROMP_0A6_01F:
        :: OBJ_3F247 BINT3 ;                     * 3AB9E

* ROMPTR 0A6 020
* refs (1): 3AA8F
ROMP_0A6_020:
        :: OBJ_3F247 BINT5 ;                     * 3ABB2

* ROMPTR 0A6 021
* refs (1): 3AA8F
K__#_:
        CHR "#"                                  * 3ABC6

* ROMPTR 0A6 022
* refs (1): 3AA8F
ROMP_0A6_022:
        ROMPTR 0A4 022                           * 3ABCD

* ROMPTR 0A6 023
* refs (1): 3AA8F
K_162:
        CHR "¢"                                  * 3ABD8

* ROMPTR 0A6 024
* refs (1): 3AA8F
K_165:
        CHR "¥"                                  * 3ABDF

* ROMPTR 0A6 025
* refs (1): 3AA8F
K_176:
        CHR "°"                                  * 3ABE6

* ROMPTR 0A6 026
* refs (1): 3AA8F
K____:
        CHR "_"                                  * 3ABED

* ROMPTR 0A6 027
* refs (1): 3AA8F
ROMP_0A6_027:
        ROMPTR 0A5 022                           * 3ABF4

* ROMPTR 0A6 028
* refs (1): 3AA8F
K_139:
        CHR "≠"                                  * 3ABFF

* ROMPTR 0A6 029
* refs (1): 3AA8F
K__>_:
        CHR ">"                                  * 3AC06

* ROMPTR 0A6 02A
* refs (1): 3AA8F
K_138:
        CHR "≥"                                  * 3AC0D

* ROMPTR 0A6 02B
* refs (1): 3AA8F
K_____3AC14:
        CHR "\""                                 * 3AC14

* ROMPTR 0A6 02C
* refs (1): 3AA8F
ROMP_0A6_02C:
        :: Modifier TurnOff SetDA123NoCh ;       * 3AC1B

* ROMPTR 0A6 02D
* refs (1): 3AA8F
K_141:
        CHR "→"                                  * 3AC34

* ROMPTR 0A6 02E
* refs (1): 3AA8F
ROMP_0A6_02E:
        ROMPTR 0A3 02E                           * 3AC3B

* ROMPTR 0A6 02F
* refs (1): 3AA8F
K_128:
        CHR "∡"                                  * 3AC46

* ROMPTR 0A6 030
* refs (1): 3AA8F
K__:_:
        CHR ":"                                  * 3AC4D

LIB0A6.hash:
        CON(5)  DOHSTR                           * 3AC54  hash table of library 0A6
        LENGTH                                   * 3AC59  length, to #3ACB8
        CON(5)  0                                * 3AC5E  names of length 1
        CON(5)  0                                * 3AC63  names of length 2
        CON(5)  0                                * 3AC68  names of length 3
        CON(5)  0                                * 3AC6D  names of length 4
        CON(5)  0                                * 3AC72  names of length 5
        CON(5)  0                                * 3AC77  names of length 6
        CON(5)  0                                * 3AC7C  names of length 7
        CON(5)  0                                * 3AC81  names of length 8
        CON(5)  0                                * 3AC86  names of length 9
        CON(5)  0                                * 3AC8B  names of length 10
        CON(5)  0                                * 3AC90  names of length 11
        CON(5)  0                                * 3AC95  names of length 12
        CON(5)  0                                * 3AC9A  names of length 13
        CON(5)  0                                * 3AC9F  names of length 14
        CON(5)  0                                * 3ACA4  names of length 15
        CON(5)  0                                * 3ACA9  names of length 16
        REL(5)  L_3ACB3                          * 3ACAE  end of the names
L_3ACB3:
        CON(5)  0                                * 3ACB3  command 000 has no name
        ENDLENGTH                                * 3ACB8

LIB0A6.link:
        CON(5)  DOHSTR                           * 3ACB8  link table of library 0A6
        LENGTH                                   * 3ACBD  length, to #3ADB7
        REL(5)  K_140                            * 3ACC2  000 
        REL(5)  K_223                            * 3ACC7  001 
        REL(5)  K_155                            * 3ACCC  002 
        REL(5)  K_146                            * 3ACD1  003 
        REL(5)  K_147                            * 3ACD6  004 
        REL(5)  K_149                            * 3ACDB  005 
        REL(5)  K_145                            * 3ACE0  006 
        REL(5)  K_148                            * 3ACE5  007 
        REL(5)  K_159                            * 3ACEA  008 
        REL(5)  K__!_                            * 3ACEF  009 
        REL(5)  K_144                            * 3ACF4  00A 
        REL(5)  K_150                            * 3ACF9  00B 
        REL(5)  K__'_                            * 3ACFE  00C 
        REL(5)  K_181                            * 3AD03  00D 
        REL(5)  K_157                            * 3AD08  00E 
        REL(5)  K_142                            * 3AD0D  00F 
        REL(5)  K_143                            * 3AD12  010 
        REL(5)  K_151                            * 3AD17  011 
        REL(5)  K_152                            * 3AD1C  012 
        REL(5)  K_153                            * 3AD21  013 
        REL(5)  K__%_                            * 3AD26  014 
        REL(5)  K__~_                            * 3AD2B  015 
        REL(5)  K_154                            * 3AD30  016 
        REL(5)  K_129                            * 3AD35  017 
        REL(5)  K__ë_                            * 3AD3A  018 
        REL(5)  K_177                            * 3AD3F  019 
        REL(5)  K_156                            * 3AD44  01A 
        REL(5)  K_161                            * 3AD49  01B 
        REL(5)  K_191                            * 3AD4E  01C 
        REL(5)  ROMP_0A6_01D                     * 3AD53  01D 
        REL(5)  ROMP_0A6_01E                     * 3AD58  01E 
        REL(5)  ROMP_0A6_01F                     * 3AD5D  01F 
        REL(5)  ROMP_0A6_020                     * 3AD62  020 
        REL(5)  K__#_                            * 3AD67  021 
        REL(5)  ROMP_0A6_022                     * 3AD6C  022 
        REL(5)  K_162                            * 3AD71  023 
        REL(5)  K_165                            * 3AD76  024 
        REL(5)  K_176                            * 3AD7B  025 
        REL(5)  K____                            * 3AD80  026 
        REL(5)  ROMP_0A6_027                     * 3AD85  027 
        REL(5)  K_139                            * 3AD8A  028 
        REL(5)  K__>_                            * 3AD8F  029 
        REL(5)  K_138                            * 3AD94  02A 
        REL(5)  K_____3AC14                      * 3AD99  02B 
        REL(5)  ROMP_0A6_02C                     * 3AD9E  02C 
        REL(5)  K_141                            * 3ADA3  02D 
        REL(5)  ROMP_0A6_02E                     * 3ADA8  02E 
        REL(5)  K_128                            * 3ADAD  02F 
        REL(5)  K__:_                            * 3ADB2  030 
        ENDLENGTH                                * 3ADB7
        NIBHEX  0000                             * 3ADB7  ..

* refs (1): 3D8DA
OBJ_3ADBB:
        :: CK1NOLASTWD CK&DISPATCH1              * 3ADBB
          BINT6 Visit(nm)                        * 3ADCA  name
          BINT7 Visit(nm)                        * 3ADD4  local
          BINT0 EditLevel1                       * 3ADDE  any
        ;                                        * 3ADE8

DoPlotMenu:
        :: MenuMaker ROMPTR 0A9 051 DoMenuKey ;  * 3ADED

* refs (1): 1520A
OBJ_3AE0C:
        :: MenuMaker ROMPTR 0A9 04A DoMenuKey ;  * 3AE0C

* refs (1): 43F17
\Ú>VIEW~1:
        :: '                                     * 3AE2B
          :: CK1NOLASTWD CK&DISPATCH1            * 3AE35
            BINT1 BestEditLevel(r)               * 3AE44  real
            BINT6 BestVisit(nm)                  * 3AE4E  name
            BINT7 BestVisit(nm)                  * 3AE58  local
          ;                                      * 3AE62
          DoKeyOb ;                              * 3AE67

* refs (1): 43F5D
OBJ_3AE71:
        :: CK1NOLASTWD CK&DISPATCH1              * 3AE71
          BINT1 OBJ_42DFF                        * 3AE80  real
          BINT6 Visit(nm)                        * 3AE8A  name
          BINT7 Visit(nm)                        * 3AE94  local
        ;                                        * 3AE9E
        NIBHEX  B330000                          * 3AEA3  ;..

LIB0A4:
        CON(3)  #0A4                             * 3AEAA  library number
        REL(5)  LIB0A4.hash                      * 3AEAD  hash table
        CON(5)  0                                * 3AEB2  message table
        REL(5)  LIB0A4.link                      * 3AEB7  link table
        CON(5)  0                                * 3AEBC  config

* ROMPTR 0A4 000
* refs (1): 3AEAA
ROMP_0A4_000:
        CHR "A"                                  * 3AEC1

* ROMPTR 0A4 001
* refs (1): 3AEAA
K__B_:
        CHR "B"                                  * 3AEC8

* ROMPTR 0A4 002
* refs (1): 3AEAA
K__C_:
        CHR "C"                                  * 3AECF

* ROMPTR 0A4 003
* refs (1): 3AEAA
K__D_:
        CHR "D"                                  * 3AED6

* ROMPTR 0A4 004
* refs (1): 3AEAA
K__E_:
        CHR "E"                                  * 3AEDD

* ROMPTR 0A4 005
* refs (1): 3AEAA
K__F_:
        CHR "F"                                  * 3AEE4

* ROMPTR 0A4 006
* refs (1): 3AEAA
K__G_:
        CHR "G"                                  * 3AEEB

* ROMPTR 0A4 007
* refs (1): 3AEAA
K__H_:
        CHR "H"                                  * 3AEF2

* ROMPTR 0A4 008
* refs (1): 3AEAA
K__I_:
        CHR "I"                                  * 3AEF9

* ROMPTR 0A4 009
* refs (1): 3AEAA
K__J_:
        CHR "J"                                  * 3AF00

* ROMPTR 0A4 00A
* refs (1): 3AEAA
K__K_:
        CHR "K"                                  * 3AF07

* ROMPTR 0A4 00B
* refs (1): 3AEAA
K__L_:
        CHR "L"                                  * 3AF0E

* ROMPTR 0A4 00C
* refs (1): 3AEAA
K__M_:
        CHR "M"                                  * 3AF15

* ROMPTR 0A4 00D
* refs (1): 3AEAA
K__N_:
        CHR "N"                                  * 3AF1C

* ROMPTR 0A4 00E
* refs (1): 3AEAA
K__O_:
        CHR "O"                                  * 3AF23

* ROMPTR 0A4 00F
* refs (1): 3AEAA
K__P_:
        CHR "P"                                  * 3AF2A

* ROMPTR 0A4 010
* refs (1): 3AEAA
K__Q_:
        CHR "Q"                                  * 3AF31

* ROMPTR 0A4 011
* refs (1): 3AEAA
K__R_:
        CHR "R"                                  * 3AF38

* ROMPTR 0A4 012
* refs (1): 3AEAA
K__S_:
        CHR "S"                                  * 3AF3F

* ROMPTR 0A4 013
* refs (1): 3AEAA
K__T_:
        CHR "T"                                  * 3AF46

* ROMPTR 0A4 014
* refs (1): 3AEAA
K__U_:
        CHR "U"                                  * 3AF4D

* ROMPTR 0A4 015
* refs (1): 3AEAA
K__V_:
        CHR "V"                                  * 3AF54

* ROMPTR 0A4 016
* refs (1): 3AEAA
K__W_:
        CHR "W"                                  * 3AF5B

* ROMPTR 0A4 017
* refs (1): 3AEAA
K__X_:
        CHR "X"                                  * 3AF62

* ROMPTR 0A4 018
* refs (1): 3AEAA
ROMP_0A4_018:
        ROMPTR 0A1 018                           * 3AF69

* ROMPTR 0A4 019
* refs (1): 3AEAA
K__Y_:
        CHR "Y"                                  * 3AF74

* ROMPTR 0A4 01A
* refs (1): 3AEAA
K__Z_:
        CHR "Z"                                  * 3AF7B

* ROMPTR 0A4 01B
* refs (1): 3AEAA
ROMP_0A4_01B:
        ROMPTR 0A1 01B                           * 3AF82

* ROMPTR 0A4 01C
* refs (1): 3AEAA
ROMP_0A4_01C:
        ROMPTR 0A1 01C                           * 3AF8D

* ROMPTR 0A4 01D
* refs (1): 3AEAA
ROMP_0A4_01D:
        :: Modifier SetDA123NoCh BINT60 TestSysFlag Lock? ORcase UnLockAlpha * 3AF98
          LockAlpha ;                            * 3AFC0

* ROMPTR 0A4 01E
* refs (1): 3AEAA
K__7_:
        CHR "7"                                  * 3AFCA

* ROMPTR 0A4 01F
* refs (1): 3AEAA
K__8_:
        CHR "8"                                  * 3AFD1

* ROMPTR 0A4 020
* refs (1): 3AEAA
K__9_:
        CHR "9"                                  * 3AFD8

* ROMPTR 0A4 021
* refs (1): 3AEAA
K__/_:
        CHR "/"                                  * 3AFDF

* ROMPTR 0A4 022
* refs (1): 3AEAA
ROMP_0A4_022:
        :: Modifier àLShiftOnly SetDA123NoCh ;   * 3AFE6

* ROMPTR 0A4 023
* refs (1): 3AEAA
K__4_:
        CHR "4"                                  * 3AFFF

* ROMPTR 0A4 024
* refs (1): 3AEAA
K__5_:
        CHR "5"                                  * 3B006

* ROMPTR 0A4 025
* refs (1): 3AEAA
ROMP_0A4_025:
        CHR "6"                                  * 3B00D

* ROMPTR 0A4 026
* refs (1): 3AEAA
K__*_:
        CHR "*"                                  * 3B014

* ROMPTR 0A4 027
* refs (1): 3AEAA
ROMP_0A4_027:
        :: Modifier àRShiftOnly SetDA123NoCh ;   * 3B01B

* ROMPTR 0A4 028
* refs (1): 3AEAA
K__1_:
        CHR "1"                                  * 3B034

* ROMPTR 0A4 029
* refs (1): 3AEAA
K__2_:
        CHR "2"                                  * 3B03B

* ROMPTR 0A4 02A
* refs (1): 3AEAA
K__3_:
        CHR "3"                                  * 3B042

* ROMPTR 0A4 02B
* refs (1): 3AEAA
K__~__3B049:
        CHR "-"                                  * 3B049

* ROMPTR 0A4 02C
* refs (1): 3AEAA
ROMP_0A4_02C:
        ROMPTR 0A1 02C                           * 3B050

* ROMPTR 0A4 02D
* refs (1): 3AEAA
K__0_:
        CHR "0"                                  * 3B05B

* ROMPTR 0A4 02E
* refs (2): 3AEAA 6BCD6
ROMP_0A4_02E:
        ROMPTR 0A1 02E                           * 3B062

* ROMPTR 0A4 02F
* refs (2): 3AEAA 6BD1C
ROMP_0A4_02F:
        CHR " "                                  * 3B06D

* ROMPTR 0A4 030
* refs (1): 3AEAA
K__+_:
        CHR "+"                                  * 3B074

LIB0A4.hash:
        CON(5)  DOHSTR                           * 3B07B  hash table of library 0A4
        LENGTH                                   * 3B080  length, to #3B0DF
        CON(5)  0                                * 3B085  names of length 1
        CON(5)  0                                * 3B08A  names of length 2
        CON(5)  0                                * 3B08F  names of length 3
        CON(5)  0                                * 3B094  names of length 4
        CON(5)  0                                * 3B099  names of length 5
        CON(5)  0                                * 3B09E  names of length 6
        CON(5)  0                                * 3B0A3  names of length 7
        CON(5)  0                                * 3B0A8  names of length 8
        CON(5)  0                                * 3B0AD  names of length 9
        CON(5)  0                                * 3B0B2  names of length 10
        CON(5)  0                                * 3B0B7  names of length 11
        CON(5)  0                                * 3B0BC  names of length 12
        CON(5)  0                                * 3B0C1  names of length 13
        CON(5)  0                                * 3B0C6  names of length 14
        CON(5)  0                                * 3B0CB  names of length 15
        CON(5)  0                                * 3B0D0  names of length 16
        REL(5)  L_3B0DA                          * 3B0D5  end of the names
L_3B0DA:
        CON(5)  0                                * 3B0DA  command 000 has no name
        ENDLENGTH                                * 3B0DF

LIB0A4.link:
        CON(5)  DOHSTR                           * 3B0DF  link table of library 0A4
        LENGTH                                   * 3B0E4  length, to #3B1DE
        REL(5)  ROMP_0A4_000                     * 3B0E9  000 
        REL(5)  K__B_                            * 3B0EE  001 
        REL(5)  K__C_                            * 3B0F3  002 
        REL(5)  K__D_                            * 3B0F8  003 
        REL(5)  K__E_                            * 3B0FD  004 
        REL(5)  K__F_                            * 3B102  005 
        REL(5)  K__G_                            * 3B107  006 
        REL(5)  K__H_                            * 3B10C  007 
        REL(5)  K__I_                            * 3B111  008 
        REL(5)  K__J_                            * 3B116  009 
        REL(5)  K__K_                            * 3B11B  00A 
        REL(5)  K__L_                            * 3B120  00B 
        REL(5)  K__M_                            * 3B125  00C 
        REL(5)  K__N_                            * 3B12A  00D 
        REL(5)  K__O_                            * 3B12F  00E 
        REL(5)  K__P_                            * 3B134  00F 
        REL(5)  K__Q_                            * 3B139  010 
        REL(5)  K__R_                            * 3B13E  011 
        REL(5)  K__S_                            * 3B143  012 
        REL(5)  K__T_                            * 3B148  013 
        REL(5)  K__U_                            * 3B14D  014 
        REL(5)  K__V_                            * 3B152  015 
        REL(5)  K__W_                            * 3B157  016 
        REL(5)  K__X_                            * 3B15C  017 
        REL(5)  ROMP_0A4_018                     * 3B161  018 
        REL(5)  K__Y_                            * 3B166  019 
        REL(5)  K__Z_                            * 3B16B  01A 
        REL(5)  ROMP_0A4_01B                     * 3B170  01B 
        REL(5)  ROMP_0A4_01C                     * 3B175  01C 
        REL(5)  ROMP_0A4_01D                     * 3B17A  01D 
        REL(5)  K__7_                            * 3B17F  01E 
        REL(5)  K__8_                            * 3B184  01F 
        REL(5)  K__9_                            * 3B189  020 
        REL(5)  K__/_                            * 3B18E  021 
        REL(5)  ROMP_0A4_022                     * 3B193  022 
        REL(5)  K__4_                            * 3B198  023 
        REL(5)  K__5_                            * 3B19D  024 
        REL(5)  ROMP_0A4_025                     * 3B1A2  025 
        REL(5)  K__*_                            * 3B1A7  026 
        REL(5)  ROMP_0A4_027                     * 3B1AC  027 
        REL(5)  K__1_                            * 3B1B1  028 
        REL(5)  K__2_                            * 3B1B6  029 
        REL(5)  K__3_                            * 3B1BB  02A 
        REL(5)  K__~__3B049                      * 3B1C0  02B 
        REL(5)  ROMP_0A4_02C                     * 3B1C5  02C 
        REL(5)  K__0_                            * 3B1CA  02D 
        REL(5)  ROMP_0A4_02E                     * 3B1CF  02E 
        REL(5)  ROMP_0A4_02F                     * 3B1D4  02F 
        REL(5)  K__+_                            * 3B1D9  030 
        ENDLENGTH                                * 3B1DE
        FILLTO  #3B211                           * 3B1DE  51 zero nibbles: the next entry stays at #3B211

* ->
* refs (2): 6A860 CFD81
DoFirstRow:
        :: MenuMaker BINT1 MenuRow! SetThisRow OBJ_418E4 ; * 3B211
        NIBHEX  A570000                          * 3B234  Z..

LIB0A1:
        CON(3)  #0A1                             * 3B23B  library number
        REL(5)  LIB0A1.hash                      * 3B23E  hash table
        CON(5)  0                                * 3B243  message table
        REL(5)  LIB0A1.link                      * 3B248  link table
        CON(5)  0                                * 3B24D  config

* ROMPTR 0A1 000
* refs (1): 3B23B
NoShift1:
        :: MenuKey BINT1 DoMenuKeyNS ;           * 3B252

* ROMPTR 0A1 001
* refs (1): 3B23B
NoShift2:
        :: MenuKey BINT2 DoMenuKeyNS ;           * 3B26B

* ROMPTR 0A1 002
* refs (1): 3B23B
NoShift3:
        :: MenuKey BINT3 DoMenuKeyNS ;           * 3B284

* ROMPTR 0A1 003
* refs (1): 3B23B
NoShift4:
        :: MenuKey BINT4 DoMenuKeyNS ;           * 3B29D

* ROMPTR 0A1 004
* refs (1): 3B23B
NoShift5:
        :: MenuKey BINT5 DoMenuKeyNS ;           * 3B2B6

* ROMPTR 0A1 005
* refs (1): 3B23B
NoShift6:
        :: MenuKey BINT6 DoMenuKeyNS ;           * 3B2CF

* ROMPTR 0A1 006
* refs (1): 3B23B
MenuMTH:
        :: MenuMaker                             * 3B2E8

* refs (1): 41382
DoMenuMTH~1:
          ROMPTR 0A9 003 DoMenuKey ;             * 3B2F2

* ROMPTR 0A1 007
* refs (1): 3B23B
MenuPr:
        :: MenuMaker ROMPTR 0A9 016 DoMenuKey ;  * 3B307

* ROMPTR 0A1 008
* refs (1): 3B23B
MenuCST:
        :: MenuMaker ROMPTR 0A9 001 DoMenuKey ;  * 3B326

* ROMPTR 0A1 009
* refs (1): 3B23B
ROMP_0A1_009:
        :: MenuMaker ROMPTR 0A9 002 DoMenuKey ;  * 3B345

* ROMPTR 0A1 00A
* refs (3): 3B23B 6BADD D7906
ROMP_0A1_00A:
        :: NoEdit?case OBJ_4365D                 * 3B364
          EDITPARTS #1=case OBJ_4365D            * 3B373
* The Very Big List names this address <0000Bh>, but it is a pointer inside an object; the name is not used
          TopERow? caseDoBadKey REPEATER         * 3B382
          # B                                    * 3B391  11
          :: Cursor&Disp UCursor ; SetDA123NoCh ; * 3B39B

* ROMPTR 0A1 00B
* refs (1): 3B23B
ROMP_0A1_00B:
        :: MenuMaker BINT6 SetSomeRow ;          * 3B3B9

* ROMPTR 0A1 00C
* refs (4): 3B23B 6BD53 8F5C0 D73F9
ROMP_0A1_00C:
        :: DoDelims $_'' OBJ_40E1F ;             * 3B3D2

* ROMPTR 0A1 00D
* refs (3): 3B23B 403F5 6BA01
ROMP_0A1_00D:
        :: PTR Do1st/2nd+: xSTO OBJ_4EC94 CK&DISPATCH0 * 3B3EB
          BINT6 XEQStoKey                        * 3B404  name
          BINT7 XEQStoKey                        * 3B40E  local
* The Very Big List names this address XLIB 2 46, but it is a pointer inside an object; the name is not used
          BINT0 xSTO                             * 3B418  any
        ;                                        * 3B422

* ROMPTR 0A1 00E
* refs (2): 3B23B 6BB8B
EVAL_3B427:
        ROMPTR 002 02E                           * 3B427  EVAL

* ROMPTR 0A1 00F
* refs (2): 3B23B 6BB09
ROMP_0A1_00F:
        :: NoEdit?case xGRAPH                    * 3B432
          BegComLine?:(bip;q) SetDA123NoCh OnTheFirstCol? case * 3B441
          :: Cursor&Disp                         * 3B455
* The Very Big List names this address <00010h>, but it is a pointer inside an object; the name is not used
            PrevLineIfStart ;                    * 3B45F
          REPEATER # 10                          * 3B469

* refs (1): 3F279
OBJ_3B478:
          :: Cursor&Disp LCursor ; ;             * 3B478

* ROMPTR 0A1 010
* refs (3): 3B23B 6BB13 D793E
ROMP_0A1_010:
        :: NoEdit?case ViewLevel1                * 3B491
          EDITPARTS #1=case OBJ_3D8C6            * 3B4A0
* The Very Big List names this address <00011h>, but it is a pointer inside an object; the name is not used
          LastERow? caseDoBadKey REPEATER        * 3B4AF
          # 11                                   * 3B4BE  17
          :: Cursor&Disp DCursor ; SetDA123NoCh ; * 3B4C8

* ROMPTR 0A1 011
* refs (2): 3B23B 6BB1D
ROMP_0A1_011:
        :: NoEdit?case xSWAP                     * 3B4E6
          EndComLine?:(bip;q) SetDA123NoCh CURSOR_END? case OBJ_3E14E * 3B4F5
          REPEATER # 12                          * 3B50E
          :: Cursor&Disp ->OnTheRow ; ;          * 3B51D

* ROMPTR 0A1 012
* refs (1): 3B23B
ROMP_0A1_012:
        ROMPTR 002 051                           * 3B536  SIN

* ROMPTR 0A1 013
* refs (1): 3B23B
ROMP_0A1_013:
        ROMPTR 002 052                           * 3B541  COS

* ROMPTR 0A1 014
* refs (1): 3B23B
ROMP_0A1_014:
        ROMPTR 002 053                           * 3B54C  TAN

* ROMPTR 0A1 015
* refs (1): 3B23B
ROMP_0A1_015:
        ROMPTR 002 04F                           * 3B557  √

* ROMPTR 0A1 016
* refs (1): 3B23B
ROMP_0A1_016:
        ROMPTR 002 049                           * 3B562  ^

* ROMPTR 0A1 017
* refs (1): 3B23B
ROMP_0A1_017:
        ROMPTR 002 04C                           * 3B56D  INV

* ROMPTR 0A1 018
* refs (3): 3B23B 6BB77 DD803
ROMP_0A1_018:
        :: NoEdit?case xDUP                      * 3B578
          EnterComLine ;                         * 3B587

* ROMPTR 0A1 019
* refs (2): 3B23B 6BD12
ROMP_0A1_019:
        :: NoEdit?case xNEG                      * 3B591
          OBJ_110EF NOTcase                      * 3B5A0
          :: ' xNEG DoKeyOb ;                    * 3B5AA
          case SetDA12a3NCh                      * 3B5C3
          CURSOR@ SWAP SETCURSOR CHR_- InsertEcho #1+ SETCURSOR SetDA12a3NCh ; * 3B5CD

* ROMPTR 0A1 01A
* refs (2): 3B23B 6BD08
ROMP_0A1_01A:
        :: TakeOver SetDA13NoCh ?SetEditRoll OBJ_1123F SWAP CURSOR@ 2DUP#> * 3B5FA
          DUP4UNROLL ?SKIPSWAP #- DUP#0=ITE 2DROP * 3B622
          :: ZERO_DO DUP ITE ->OnTheRow LCursor  * 3B63B
            LOOP DROP ;                          * 3B659
          DUPNULL$? caseDROP InsertEcho          * 3B668
        ;                                        * 3B677

* ROMPTR 0A1 01B
* refs (1): 3B23B
ROMP_0A1_01B:
        :: NoEdit?case xCLEAR                    * 3B67C
          EndComLine?:(bip;q) CURSOR_END? case   * 3B68B
          :: OBJ_429CB SetDA13NoCh ;             * 3B69A
          REPEATER # 1C OBJ_429A3 SetDA123NoCh ; * 3B6AE

* ROMPTR 0A1 01C
* refs (2): 3B23B 6BB45
ROMP_0A1_01C:
        :: NoEdit?case xDROP                     * 3B6CC
          BegComLine?:(bip;q) OnTheFirstCol? case * 3B6DB
          :: PrevLineIfStart OBJ_429CB SetDA13NoCh ; * 3B6EA
          REPEATER # 1D OBJ_42935 SetDA123NoCh ; * 3B703

* ROMPTR 0A1 01D
* refs (1): 3B23B
ROMP_0A1_01D:
        :: Modifier 1A/LockA ;                   * 3B721

* ROMPTR 0A1 01E
* refs (1): 3B23B
K__7__3B735:
        CHR "7"                                  * 3B735

* ROMPTR 0A1 01F
* refs (1): 3B23B
K__8__3B73C:
        CHR "8"                                  * 3B73C

* ROMPTR 0A1 020
* refs (1): 3B23B
K__9__3B743:
        CHR "9"                                  * 3B743

* ROMPTR 0A1 021
* refs (1): 3B23B
ROMP_0A1_021:
        ROMPTR 002 048                           * 3B74A  /

* ROMPTR 0A1 022
* refs (3): 3B23B 6B415 6B474
ROMP_0A1_022:
        :: Modifier RShiftOnly SetDA123NoCh ;    * 3B755

* ROMPTR 0A1 023
* refs (1): 3B23B
K__4__3B76E:
        CHR "4"                                  * 3B76E

* ROMPTR 0A1 024
* refs (1): 3B23B
K__5__3B775:
        CHR "5"                                  * 3B775

* ROMPTR 0A1 025
* refs (1): 3B23B
K__6_:
        CHR "6"                                  * 3B77C

* ROMPTR 0A1 026
* refs (1): 3B23B
ROMP_0A1_026:
        ROMPTR 002 047                           * 3B783  *

* ROMPTR 0A1 027
* refs (3): 3B23B 6B43A 6B47B
ROMP_0A1_027:
        :: Modifier LShiftOnly SetDA123NoCh ;    * 3B78E

* ROMPTR 0A1 028
* refs (1): 3B23B
K__1__3B7A7:
        CHR "1"                                  * 3B7A7

* ROMPTR 0A1 029
* refs (1): 3B23B
K__2__3B7AE:
        CHR "2"                                  * 3B7AE

* ROMPTR 0A1 02A
* refs (1): 3B23B
K__3__3B7B5:
        CHR "3"                                  * 3B7B5

* ROMPTR 0A1 02B
* refs (1): 3B23B
ROMP_0A1_02B:
        ROMPTR 002 046                           * 3B7BC  -

* ROMPTR 0A1 02C
* refs (4): 3B23B 6BA3D D77A8 DD7DB
ROMP_0A1_02C:
        :: TakeOver DAsBad? ?SEMI                * 3B7C7
          InitEd&Modes FLUSHKEYS ;               * 3B7DB

* ROMPTR 0A1 02D
* refs (1): 3B23B
K__0__3B7EA:
        CHR "0"                                  * 3B7EA

* ROMPTR 0A1 02E
* refs (2): 3B23B 6BCE0
ROMP_0A1_02E:
        :: TakeOver BINT51 SysITE CHR_, CHR_. EchoChrKey ; * 3B7F1

* ROMPTR 0A1 02F
* refs (2): 3B23B 6BD26
ROMP_0A1_02F:
        CHR " "                                  * 3B819

* ROMPTR 0A1 030
* refs (1): 3B23B
ROMP_0A1_030:
        ROMPTR 002 044                           * 3B820  +

LIB0A1.hash:
        CON(5)  DOHSTR                           * 3B82B  hash table of library 0A1
        LENGTH                                   * 3B830  length, to #3B88F
        CON(5)  0                                * 3B835  names of length 1
        CON(5)  0                                * 3B83A  names of length 2
        CON(5)  0                                * 3B83F  names of length 3
        CON(5)  0                                * 3B844  names of length 4
        CON(5)  0                                * 3B849  names of length 5
        CON(5)  0                                * 3B84E  names of length 6
        CON(5)  0                                * 3B853  names of length 7
        CON(5)  0                                * 3B858  names of length 8
        CON(5)  0                                * 3B85D  names of length 9
        CON(5)  0                                * 3B862  names of length 10
        CON(5)  0                                * 3B867  names of length 11
        CON(5)  0                                * 3B86C  names of length 12
        CON(5)  0                                * 3B871  names of length 13
        CON(5)  0                                * 3B876  names of length 14
        CON(5)  0                                * 3B87B  names of length 15
        CON(5)  0                                * 3B880  names of length 16
        REL(5)  L_3B88A                          * 3B885  end of the names
L_3B88A:
        CON(5)  0                                * 3B88A  command 000 has no name
        ENDLENGTH                                * 3B88F

LIB0A1.link:
        CON(5)  DOHSTR                           * 3B88F  link table of library 0A1
        LENGTH                                   * 3B894  length, to #3B98E
        REL(5)  NoShift1                         * 3B899  000 
        REL(5)  NoShift2                         * 3B89E  001 
        REL(5)  NoShift3                         * 3B8A3  002 
        REL(5)  NoShift4                         * 3B8A8  003 
        REL(5)  NoShift5                         * 3B8AD  004 
        REL(5)  NoShift6                         * 3B8B2  005 
        REL(5)  MenuMTH                          * 3B8B7  006 
        REL(5)  MenuPr                           * 3B8BC  007 
        REL(5)  MenuCST                          * 3B8C1  008 
        REL(5)  ROMP_0A1_009                     * 3B8C6  009 
        REL(5)  ROMP_0A1_00A                     * 3B8CB  00A 
        REL(5)  ROMP_0A1_00B                     * 3B8D0  00B 
        REL(5)  ROMP_0A1_00C                     * 3B8D5  00C 
        REL(5)  ROMP_0A1_00D                     * 3B8DA  00D 
        REL(5)  EVAL_3B427                       * 3B8DF  00E 
        REL(5)  ROMP_0A1_00F                     * 3B8E4  00F 
        REL(5)  ROMP_0A1_010                     * 3B8E9  010 
        REL(5)  ROMP_0A1_011                     * 3B8EE  011 
        REL(5)  ROMP_0A1_012                     * 3B8F3  012 
        REL(5)  ROMP_0A1_013                     * 3B8F8  013 
        REL(5)  ROMP_0A1_014                     * 3B8FD  014 
        REL(5)  ROMP_0A1_015                     * 3B902  015 
        REL(5)  ROMP_0A1_016                     * 3B907  016 
        REL(5)  ROMP_0A1_017                     * 3B90C  017 
        REL(5)  ROMP_0A1_018                     * 3B911  018 
        REL(5)  ROMP_0A1_019                     * 3B916  019 
        REL(5)  ROMP_0A1_01A                     * 3B91B  01A 
        REL(5)  ROMP_0A1_01B                     * 3B920  01B 
        REL(5)  ROMP_0A1_01C                     * 3B925  01C 
        REL(5)  ROMP_0A1_01D                     * 3B92A  01D 
        REL(5)  K__7__3B735                      * 3B92F  01E 
        REL(5)  K__8__3B73C                      * 3B934  01F 
        REL(5)  K__9__3B743                      * 3B939  020 
        REL(5)  ROMP_0A1_021                     * 3B93E  021 
        REL(5)  ROMP_0A1_022                     * 3B943  022 
        REL(5)  K__4__3B76E                      * 3B948  023 
        REL(5)  K__5__3B775                      * 3B94D  024 
        REL(5)  K__6_                            * 3B952  025 
        REL(5)  ROMP_0A1_026                     * 3B957  026 
        REL(5)  ROMP_0A1_027                     * 3B95C  027 
        REL(5)  K__1__3B7A7                      * 3B961  028 
        REL(5)  K__2__3B7AE                      * 3B966  029 
        REL(5)  K__3__3B7B5                      * 3B96B  02A 
        REL(5)  ROMP_0A1_02B                     * 3B970  02B 
        REL(5)  ROMP_0A1_02C                     * 3B975  02C 
        REL(5)  K__0__3B7EA                      * 3B97A  02D 
        REL(5)  ROMP_0A1_02E                     * 3B97F  02E 
        REL(5)  ROMP_0A1_02F                     * 3B984  02F 
        REL(5)  ROMP_0A1_030                     * 3B989  030 
        ENDLENGTH                                * 3B98E
        NIBHEX  4530000                          * 3B98E  T..

LIB0A5:
        CON(3)  #0A5                             * 3B995  library number
        REL(5)  LIB0A5.hash                      * 3B998  hash table
        CON(5)  0                                * 3B99D  message table
        REL(5)  LIB0A5.link                      * 3B9A2  link table
        CON(5)  0                                * 3B9A7  config

* ROMPTR 0A5 000
* refs (1): 3B995
K__a_:
        CHR "a"                                  * 3B9AC

* ROMPTR 0A5 001
* refs (1): 3B995
K__b_:
        CHR "b"                                  * 3B9B3

* ROMPTR 0A5 002
* refs (1): 3B995
K__c_:
        CHR "c"                                  * 3B9BA

* ROMPTR 0A5 003
* refs (1): 3B995
K__d_:
        CHR "d"                                  * 3B9C1

* ROMPTR 0A5 004
* refs (1): 3B995
K__e_:
        CHR "e"                                  * 3B9C8

* ROMPTR 0A5 005
* refs (1): 3B995
K__f_:
        CHR "f"                                  * 3B9CF

* ROMPTR 0A5 006
* refs (1): 3B995
K__g_:
        CHR "g"                                  * 3B9D6

* ROMPTR 0A5 007
* refs (1): 3B995
K__h_:
        CHR "h"                                  * 3B9DD

* ROMPTR 0A5 008
* refs (1): 3B995
K__i_:
        CHR "i"                                  * 3B9E4

* ROMPTR 0A5 009
* refs (1): 3B995
K__j_:
        CHR "j"                                  * 3B9EB

* ROMPTR 0A5 00A
* refs (1): 3B995
K__k__3B9F2:
        CHR "k"                                  * 3B9F2

* ROMPTR 0A5 00B
* refs (1): 3B995
K__l_:
        CHR "l"                                  * 3B9F9

* ROMPTR 0A5 00C
* refs (1): 3B995
K__m_:
        CHR "m"                                  * 3BA00

* ROMPTR 0A5 00D
* refs (1): 3B995
K__n_:
        CHR "n"                                  * 3BA07

* ROMPTR 0A5 00E
* refs (1): 3B995
K__o_:
        CHR "o"                                  * 3BA0E

* ROMPTR 0A5 00F
* refs (1): 3B995
K__p_:
        CHR "p"                                  * 3BA15

* ROMPTR 0A5 010
* refs (1): 3B995
K__q_:
        CHR "q"                                  * 3BA1C

* ROMPTR 0A5 011
* refs (1): 3B995
K__r_:
        CHR "r"                                  * 3BA23

* ROMPTR 0A5 012
* refs (1): 3B995
K__s_:
        CHR "s"                                  * 3BA2A

* ROMPTR 0A5 013
* refs (1): 3B995
K__t_:
        CHR "t"                                  * 3BA31

* ROMPTR 0A5 014
* refs (1): 3B995
K__u_:
        CHR "u"                                  * 3BA38

* ROMPTR 0A5 015
* refs (1): 3B995
K__v_:
        CHR "v"                                  * 3BA3F

* ROMPTR 0A5 016
* refs (1): 3B995
K__w_:
        CHR "w"                                  * 3BA46

* ROMPTR 0A5 017
* refs (1): 3B995
K__x_:
        CHR "x"                                  * 3BA4D

* ROMPTR 0A5 018
* refs (1): 3B995
K__&_:
        CHR "&"                                  * 3BA54

* ROMPTR 0A5 019
* refs (1): 3B995
K__y_:
        CHR "y"                                  * 3BA5B

* ROMPTR 0A5 01A
* refs (1): 3B995
K__z_:
        CHR "z"                                  * 3BA62

* ROMPTR 0A5 01B
* refs (1): 3B995
K__!__3BA69:
        CHR "!"                                  * 3BA69

* ROMPTR 0A5 01C
* refs (1): 3B995
K__?_:
        CHR "?"                                  * 3BA70

* ROMPTR 0A5 01D
* refs (1): 3B995
ROMP_0A5_01D:
        :: Modifier MinusMo_539A0 SetDA123NoCh ; * 3BA77

* ROMPTR 0A5 01E
* refs (1): 3B995
ROMP_0A5_01E:
        :: OBJ_3F247 BINT0 ;                     * 3BA90

* ROMPTR 0A5 01F
* refs (1): 3B995
ROMP_0A5_01F:
        :: OBJ_3F247 BINT2 ;                     * 3BAA4

* ROMPTR 0A5 020
* refs (1): 3B995
ROMP_0A5_020:
        :: OBJ_3F247 BINT4 ;                     * 3BAB8

* ROMPTR 0A5 021
* refs (2): 3B995 6BCEA
ROMP_0A5_021:
        ROMPTR 0A2 021                           * 3BACC

* ROMPTR 0A5 022
* refs (1): 3B995
ROMP_0A5_022:
        :: Modifier àShiftOnly SetDA123NoCh ;    * 3BAD7

* ROMPTR 0A5 023
* refs (1): 3B995
K__$_:
        CHR "$"                                  * 3BAF0

* ROMPTR 0A5 024
* refs (1): 3B995
K_163:
        CHR "£"                                  * 3BAF7

* ROMPTR 0A5 025
* refs (1): 3B995
K_164:
        CHR "¤"                                  * 3BAFE

* ROMPTR 0A5 026
* refs (1): 3B995
ROMP_0A5_026:
        ROMPTR 0A2 026                           * 3BB05

* ROMPTR 0A5 027
* refs (1): 3B995
ROMP_0A5_027:
        ROMPTR 0A4 027                           * 3BB10

* ROMPTR 0A5 028
* refs (1): 3B995
_==_:
        $ "=="                                   * 3BB1B

* ROMPTR 0A5 029
* refs (1): 3B995
K__<_:
        CHR "<"                                  * 3BB29

* ROMPTR 0A5 02A
* refs (1): 3B995
K_137:
        CHR "≤"                                  * 3BB30

* ROMPTR 0A5 02B
* refs (1): 3B995
ROMP_0A5_02B:
        :: DoDelims $_<<>> ?ClrAlgSetPr ;        * 3BB37

* ROMPTR 0A5 02C
* refs (1): 3B995
ROMP_0A5_02C:
        ROMPTR 002 03A                           * 3BB50  CONT

* ROMPTR 0A5 02D
* refs (1): 3B995
K__=_:
        CHR "="                                  * 3BB5B

* ROMPTR 0A5 02E
* refs (2): 3B995 6BCC2
ROMP_0A5_02E:
        ROMPTR 0A2 02E                           * 3BB62

* ROMPTR 0A5 02F
* refs (1): 3B995
K_135:
        CHR "π"                                  * 3BB6D

* ROMPTR 0A5 030
* refs (1): 3B995
ROMP_0A5_030:
        ROMPTR 0A2 030                           * 3BB74

LIB0A5.hash:
        CON(5)  DOHSTR                           * 3BB7F  hash table of library 0A5
        LENGTH                                   * 3BB84  length, to #3BBE3
        CON(5)  0                                * 3BB89  names of length 1
        CON(5)  0                                * 3BB8E  names of length 2
        CON(5)  0                                * 3BB93  names of length 3
        CON(5)  0                                * 3BB98  names of length 4
        CON(5)  0                                * 3BB9D  names of length 5
        CON(5)  0                                * 3BBA2  names of length 6
        CON(5)  0                                * 3BBA7  names of length 7
        CON(5)  0                                * 3BBAC  names of length 8
        CON(5)  0                                * 3BBB1  names of length 9
        CON(5)  0                                * 3BBB6  names of length 10
        CON(5)  0                                * 3BBBB  names of length 11
        CON(5)  0                                * 3BBC0  names of length 12
        CON(5)  0                                * 3BBC5  names of length 13
        CON(5)  0                                * 3BBCA  names of length 14
        CON(5)  0                                * 3BBCF  names of length 15
        CON(5)  0                                * 3BBD4  names of length 16
        REL(5)  L_3BBDE                          * 3BBD9  end of the names
L_3BBDE:
        CON(5)  0                                * 3BBDE  command 000 has no name
        ENDLENGTH                                * 3BBE3

LIB0A5.link:
        CON(5)  DOHSTR                           * 3BBE3  link table of library 0A5
        LENGTH                                   * 3BBE8  length, to #3BCE2
        REL(5)  K__a_                            * 3BBED  000 
        REL(5)  K__b_                            * 3BBF2  001 
        REL(5)  K__c_                            * 3BBF7  002 
        REL(5)  K__d_                            * 3BBFC  003 
        REL(5)  K__e_                            * 3BC01  004 
        REL(5)  K__f_                            * 3BC06  005 
        REL(5)  K__g_                            * 3BC0B  006 
        REL(5)  K__h_                            * 3BC10  007 
        REL(5)  K__i_                            * 3BC15  008 
        REL(5)  K__j_                            * 3BC1A  009 
        REL(5)  K__k__3B9F2                      * 3BC1F  00A 
        REL(5)  K__l_                            * 3BC24  00B 
        REL(5)  K__m_                            * 3BC29  00C 
        REL(5)  K__n_                            * 3BC2E  00D 
        REL(5)  K__o_                            * 3BC33  00E 
        REL(5)  K__p_                            * 3BC38  00F 
        REL(5)  K__q_                            * 3BC3D  010 
        REL(5)  K__r_                            * 3BC42  011 
        REL(5)  K__s_                            * 3BC47  012 
        REL(5)  K__t_                            * 3BC4C  013 
        REL(5)  K__u_                            * 3BC51  014 
        REL(5)  K__v_                            * 3BC56  015 
        REL(5)  K__w_                            * 3BC5B  016 
        REL(5)  K__x_                            * 3BC60  017 
        REL(5)  K__&_                            * 3BC65  018 
        REL(5)  K__y_                            * 3BC6A  019 
        REL(5)  K__z_                            * 3BC6F  01A 
        REL(5)  K__!__3BA69                      * 3BC74  01B 
        REL(5)  K__?_                            * 3BC79  01C 
        REL(5)  ROMP_0A5_01D                     * 3BC7E  01D 
        REL(5)  ROMP_0A5_01E                     * 3BC83  01E 
        REL(5)  ROMP_0A5_01F                     * 3BC88  01F 
        REL(5)  ROMP_0A5_020                     * 3BC8D  020 
        REL(5)  ROMP_0A5_021                     * 3BC92  021 
        REL(5)  ROMP_0A5_022                     * 3BC97  022 
        REL(5)  K__$_                            * 3BC9C  023 
        REL(5)  K_163                            * 3BCA1  024 
        REL(5)  K_164                            * 3BCA6  025 
        REL(5)  ROMP_0A5_026                     * 3BCAB  026 
        REL(5)  ROMP_0A5_027                     * 3BCB0  027 
        REL(5)  _==_                             * 3BCB5  028 
        REL(5)  K__<_                            * 3BCBA  029 
        REL(5)  K_137                            * 3BCBF  02A 
        REL(5)  ROMP_0A5_02B                     * 3BCC4  02B 
        REL(5)  ROMP_0A5_02C                     * 3BCC9  02C 
        REL(5)  K__=_                            * 3BCCE  02D 
        REL(5)  ROMP_0A5_02E                     * 3BCD3  02E 
        REL(5)  K_135                            * 3BCD8  02F 
        REL(5)  ROMP_0A5_030                     * 3BCDD  030 
        ENDLENGTH                                * 3BCE2

* refs (1): 151F6
SolvMenuInit~4:
        :: '                                     * 3BCE2
          :: SetDA1Bad SaveLastMenu ; MenuExitAct! ; * 3BCEC
        FILLTO  #3BDFA                           * 3BD0A  240 zero nibbles: the next entry stays at #3BDFA

* -> {}
* refs (4): 3D8CB 42DAA 6B237 C38E0
EditMenu:
        { <SkipKey >SkipKey <DelKey >DelKey TogInsertKey IStackKey } * 3BDFA

* refs (1): 415CE
GetMenu%~1:
        :: MenuDef@ CK&DISPATCH0                 * 3BE22
          BINT15 NumCurMenu                      * 3BE31  romptr
          BINT8 GetMenu%~1~program               * 3BE3B  program
          BINT0 DROP%0b                          * 3BE45  any
        ;                                        * 3BE4F

* ->
* refs (1): 9C6F0
DoSolvrMenu:
        :: PrgmEntry? caseDoBadKey '             * 3BE54
          OBJ_15200 InitMenu ;                   * 3BE68
        NIBHEX  3381000                          * 3BE77  3..

LIB0A7:
        CON(3)  #0A7                             * 3BE7E  library number
        REL(5)  LIB0A7.hash                      * 3BE81  hash table
        CON(5)  0                                * 3BE86  message table
        REL(5)  LIB0A7.link                      * 3BE8B  link table
        CON(5)  0                                * 3BE90  config

* ROMPTR 0A7 000
* refs (1): 3BE7E
ROMP_0A7_000:
        :: PTR InitTrack:                        * 3BE95
          :: NoExitAction MenuDef@ InitMenu ; ' ID_CST SAFE@ NOTcase NULL{} * 3BE9F
          ChkForMenu(_) ;                        * 3BED1

* ROMPTR 0A7 001
* refs (1): 3BE7E
ROMP_0A7_001:
        :: PTR InitTrack:                        * 3BEDB
          :: BINT1 MenuRow! ; SetRebuild ' OBJ_3F70A ; * 3BEE5

* ROMPTR 0A7 002
* refs (1): 3BE7E
MenuMTH~1~1:
        :: OBJ_3F036 OBJ_3EFE6 NoExitAction      * 3BF0D

{MEnuMTH}:
          {                                      * 3BF21
            {                                    * 3BF26

VECTR:
              $ "VECTR" ROMPTR 0A9 004 }         * 3BF2B

{MTH\MATRX}:
            {                                    * 3BF4F

_MATRX_:
              $ "MATRX" ROMPTR 0A9 005 }         * 3BF54

{MTH\LIST}:
            { _LIST_ ROMPTR 0A9 00B }            * 3BF78

{MTH\HYP}:
            {                                    * 3BF92

_HYP_:
              $ "HYP" ROMPTR 0A9 00C }           * 3BF97

{MTH\REAL}:
            {                                    * 3BFB7

_REAL_:
              $ "REAL" ROMPTR 0A9 00E }          * 3BFBC

{MTH\BASE}:
            {                                    * 3BFDE

_BASE_:
              $ "BASE" ROMPTR 0A9 00F }          * 3BFE3

{MTH\PROB}:
            {                                    * 3C005

_PROB_:
              $ "PROB" ROMPTR 0A9 00D }          * 3C00A

{MTH\HYP}_3C02C:
            { ROMPTR 0AB 025 ROMPTR 0A9 013 }    * 3C02C  FFT

{MTH\CMPLX}:
            {                                    * 3C04C

_CMPLX_:
              $ "CMPLX" ROMPTR 0A9 014 }         * 3C051

{MTH\CONST}:
            {                                    * 3C075

_CONST_:
              $ "CONST" ROMPTR 0A9 015 }         * 3C07A
          }                                      * 3C09E
        ;                                        * 3C0A3

* ROMPTR 0A7 003
* refs (1): 3BE7E
MenuMTH~1~1~8~1:
        { xCONSTANTe %e xi C%i xPI %PI xMINR %MINREAL xMAXR %MAXREAL } * 3C0A8

* ROMPTR 0A7 004
* refs (1): 3BE7E
MenuPr~1~1:
        :: OBJ_3F036 OBJ_3EFE6 NoExitAction      * 3C0E4
          {                                      * 3C0F8

{PRG\BRCH}:
            {                                    * 3C0FD

_BRCH_:
              $ "BRCH" ROMPTR 0A9 017 }          * 3C102

{PRG\TEST}:
            {                                    * 3C124

_TEST_:
              $ "TEST" ROMPTR 0A9 020 }          * 3C129

{PRG\TYPE}:
            { xTYPE ROMPTR 0A9 021 }             * 3C14B

{PRG\LIST}:
            { _LIST_ ROMPTR 0A9 022 }            * 3C165

{PRG\GROB}:
            {                                    * 3C17F

_GROB_:
              $ "GROB" ROMPTR 0A9 025 }          * 3C184

{PRG\PICT}:
            { xPICT ROMPTR 0A9 026 }             * 3C1A6

{PRG\IN}:
            {                                    * 3C1C0

_IN_:
              $ "IN" ROMPTR 0A9 027 }            * 3C1C5

{PRG\OUT}:
            {                                    * 3C1E3

_OUT_:
              $ "OUT" ROMPTR 0A9 028 }           * 3C1E8

{PRG\RUN}:
            {                                    * 3C208

_RUN_:
              $ "RUN" ROMPTR 0A9 029 }           * 3C20D

{PRG\ERROR}:
            {                                    * 3C22D

_ERROR_:
              $ "ERROR" ROMPTR 0A9 03D }         * 3C232
          }                                      * 3C256
        ;                                        * 3C25B

* ROMPTR 0A7 005
* refs (1): 3BE7E
ROMP_0A7_005:
        :: OBJ_3F036 OBJ_3EFE6                   * 3C260

{MenuSOLVE}:
          {                                      * 3C26F

{SOLVE\ROOT}:
            { xROOT ROMPTR 0A9 04B }             * 3C274

{SOLVE\DIFFE}:
            { ROMPTR 0AB 00E ROMPTR 0A9 04C }    * 3C28E  DIFFEQ

{SOLVE\POLY}:
            {                                    * 3C2AE

_POLY_:
              $ "POLY" ROMPTR 0A9 04D }          * 3C2B3

{SOLVE\SYS}:
            {                                    * 3C2D5

_SYS_:
              $ "SYS" ROMPTR 0A9 04E }           * 3C2DA

{SOLVE\TVM}:
            { ROMPTR 0AB 055 ROMPTR 0A9 04F } }  * 3C2FA  TVM
        ;                                        * 3C31F

* ROMPTR 0A7 006
* refs (1): 3BE7E
ROMP_0A7_006:
        :: OBJ_15200 ;                           * 3C324

* ROMPTR 0A7 007
* refs (1): 3BE7E
ROMP_0A7_007:
        :: PTR InitTrack:                        * 3C333
          :: ' ROMPTR 0A9 04F InitMenu ; OBJ_3FB5A ' * 3C33D
          :: ROMPTR 0E6 00A SetDA2NoCh ; MenuRowAct! ' ROMPTR 0E6 002 * 3C366
          MenuKeyLS! ROMPTR 0E6 00A              * 3C395
          { N I%YR                               * 3C3A5
* The Very Big List names this address {SOLVE\TVM\}, but it is a pointer inside an object; the name is not used
            PV PMT FV ROMPTR 0A8 046 ROMPTR 0A8 047 ROMPTR 0A8 048 } * 3C3B4
        ;                                        * 3C3E9
        BSS     15                               * 3C3EE

* ROMPTR 0A7 008
* refs (1): 3BE7E
ROMP_0A7_008:
        :: OBJ_413B9 OBJ_4A285 '                 * 3C3FD
          :: ' ROMPTR 0AA 000 OBJ_3A640 ; ;      * 3C411

* ROMPTR 0A7 009
* refs (1): 3BE7E
ROMP_0A7_009:
        :: '                                     * 3C435
          :: OBJ_3D54C ROMPTR 0A9 051 ; OnlyDefNoShift! ' * 3C43F
          :: ' ROMPTR 0AA 001 OBJ_3A640 ; ;      * 3C463

* ROMPTR 0A7 00A
* refs (1): 3BE7E
ROMP_0A7_00A:
        :: OBJ_4A2E9 OBJ_45F14 '                 * 3C487
          :: ' ROMPTR 0AA 002 OBJ_3A640 ; ;      * 3C49B

* ROMPTR 0A7 00B
* refs (1): 3BE7E
ROMP_0A7_00B:
        :: '                                     * 3C4BF
          :: OBJ_3D54C ROMPTR 0A9 054 ; OnlyDefNoShift! ' * 3C4C9
          :: ' ROMPTR 0AA 003 OBJ_3A640 ; ;      * 3C4ED

* ROMPTR 0A7 00C
* refs (1): 3BE7E
ROMP_0A7_00C:
        :: OBJ_4A2E9 OBJ_46007 '                 * 3C511
          :: ' ROMPTR 0AA 004 OBJ_3A640 ; ;      * 3C525

* ROMPTR 0A7 00D
* refs (1): 3BE7E
ROMP_0A7_00D:
        :: '                                     * 3C549
          :: OBJ_3D54C ROMPTR 0A9 057 ; OnlyDefNoShift! ' * 3C553
          :: ' ROMPTR 0AA 005 OBJ_3A640 ; ;      * 3C577

* ROMPTR 0A7 00E
* refs (1): 3BE7E
ROMP_0A7_00E:
        :: OBJ_4A2E9 OBJ_4A75A '                 * 3C59B
          :: ' ROMPTR 0AA 006 OBJ_3A640 ; ;      * 3C5AF

* ROMPTR 0A7 00F
* refs (1): 3BE7E
ROMP_0A7_00F:
        :: '                                     * 3C5D3
          :: OBJ_3D54C ROMPTR 0A9 059 ; OnlyDefNoShift! ' * 3C5DD
          :: ' ROMPTR 0AA 007 OBJ_3A640 ; ;      * 3C601

* ROMPTR 0A7 010
* refs (1): 3BE7E
ROMP_0A7_010:
        :: OBJ_4A2E9 OBJ_4A75A '                 * 3C625
          :: ' ROMPTR 0AA 008 OBJ_3A640 ; ;      * 3C639

* ROMPTR 0A7 011
* refs (1): 3BE7E
ROMP_0A7_011:
        :: '                                     * 3C65D
          :: OBJ_3D54C ROMPTR 0A9 062 ; OnlyDefNoShift! ' * 3C667
          :: ' ROMPTR 0AA 009 OBJ_3A640 ; ;      * 3C68B

* ROMPTR 0A7 012
* refs (1): 3BE7E
ROMP_0A7_012:
        :: OBJ_3F036 OBJ_3EFE6                   * 3C6AF

{MenuUnits}:
          {                                      * 3C6BE

{UNITS\LENG}:
            {                                    * 3C6C3

_LENG_:
              $ "LENG" ROMPTR 0A9 02B }          * 3C6C8

{UNITS\AREA}:
            {                                    * 3C6EA

_AREA_:
              $ "AREA" ROMPTR 0A9 02C }          * 3C6EF

{UNITS\VOL}:
            {                                    * 3C711

_VOL_:
              $ "VOL" ROMPTR 0A9 02D }           * 3C716

{UNITS\TIME}:
            {                                    * 3C736

_TIME_:
              $ "TIME" ROMPTR 0A9 02E }          * 3C73B

{UNITS\SPEED}:
            {                                    * 3C75D

_SPEED_:
              $ "SPEED" ROMPTR 0A9 02F }         * 3C762

{UNITS\MASS}:
            {                                    * 3C786

_MASS_:
              $ "MASS" ROMPTR 0A9 030 }          * 3C78B

{UNITS\FORCE}:
            {                                    * 3C7AD

_FORCE_:
              $ "FORCE" ROMPTR 0A9 031 }         * 3C7B2

{UNITS\ENRG}:
            {                                    * 3C7D6

_ENRG_:
              $ "ENRG" ROMPTR 0A9 032 }          * 3C7DB

{UNITS\POWR}:
            {                                    * 3C7FD

_POWR_:
              $ "POWR" ROMPTR 0A9 033 }          * 3C802

{UNITS\PRESS}:
            {                                    * 3C824

_PRESS_:
              $ "PRESS" ROMPTR 0A9 034 }         * 3C829

{UNITS\TEMP}:
            {                                    * 3C84D

_TEMP_:
              $ "TEMP" ROMPTR 0A9 035 }          * 3C852

{UNITS\ELEC}:
            {                                    * 3C874

_ELEC_:
              $ "ELEC" ROMPTR 0A9 036 }          * 3C879

{UNITS\ANGLE}:
            {                                    * 3C89B

_ANGLE_:
              $ "ANGL" ROMPTR 0A9 037 }          * 3C8A0

{UNITS\LIGHT}:
            {                                    * 3C8C2

_LIGHT_:
              $ "LIGHT" ROMPTR 0A9 038 }         * 3C8C7

{UNITS\RAD}:
            { $_RAD ROMPTR 0A9 039 }             * 3C8EB

{UNITS\VISC}:
            {                                    * 3C905

_VISC_:
              $ "VISC" ROMPTR 0A9 03A }          * 3C90A
          }                                      * 3C92C
        ;                                        * 3C931

* ROMPTR 0A7 013
* refs (1): 3BE7E
ROMP_0A7_013:
        :: OBJ_3EF14                             * 3C936

{Length-Units}:
          {                                      * 3C940

_m_:
            $ "m"                                * 3C945

_cm_:
            $ "cm"                               * 3C951

_mm_:
            $ "mm"                               * 3C95F

_yd_:
            $ "yd"                               * 3C96D

_ft_:
            $ "ft"                               * 3C97B

_in_:
            $ "in"                               * 3C989

_Mpc_:
            $ "Mpc"                              * 3C997

_pc_:
            $ "pc"                               * 3C9A7

_lyr_:
            $ "lyr"                              * 3C9B5

_au_:
            $ "au"                               * 3C9C5

_km_:
            $ "km"                               * 3C9D3

_mi_:
            $ "mi"                               * 3C9E1

_nmi_:
            $ "nmi"                              * 3C9EF

_miUS_:
            $ "miUS"                             * 3C9FF

_chain_:
            $ "chain"                            * 3CA11

_rad_:
            $ "rd"                               * 3CA25

_fath_:
            $ "fath"                             * 3CA33

_ftUS_:
            $ "ftUS"                             * 3CA45

_mil_:
            $ "mil"                              * 3CA57

_æ_:
            $ "µ"                                * 3CA67

_↓_:
            $ "Å"                                * 3CA73

_fermi_:
            $ "fermi" }                          * 3CA7F
        ;                                        * 3CA98

* ROMPTR 0A7 014
* refs (1): 3BE7E
ROMP_0A7_014:
        :: OBJ_3EF14                             * 3CA9D

{Area-Units}:
          {                                      * 3CAA7

_m^2_:
            $ "m^2"                              * 3CAAC

_cm^2_:
            $ "cm^2"                             * 3CABC

_b_:
            $ "b"                                * 3CACE

_yd^2_:
            $ "yd^2"                             * 3CADA

_ft^2_:
            $ "ft^2"                             * 3CAEC

_in^2_:
            $ "in^2"                             * 3CAFE

_km^2_:
            $ "km^2"                             * 3CB10

_ha_:
            $ "ha"                               * 3CB22

_a_:
            $ "a"                                * 3CB30

_mi^2_:
            $ "mi^2"                             * 3CB3C

_miUS^2_:
            $ "miUS^2"                           * 3CB4E

_acre_:
            $ "acre" }                           * 3CB64
        ;                                        * 3CB7B

* ROMPTR 0A7 015
* refs (1): 3BE7E
ROMP_0A7_015:
        :: OBJ_3EF14                             * 3CB80
          {                                      * 3CB8A

_m^3_:
            $ "m^3"                              * 3CB8F

_st_:
            $ "st"                               * 3CB9F

_cm^2__3CBAD:
            $ "cm^3"                             * 3CBAD

_yd^2__3CBBF:
            $ "yd^3"                             * 3CBBF

_ft^2__3CBD1:
            $ "ft^3"                             * 3CBD1

_in^2__3CBE3:
            $ "in^3"                             * 3CBE3

_l_:
            $ "l"                                * 3CBF5

_galUK_:
            $ "galUK"                            * 3CC01

_galC_:
            $ "galC"                             * 3CC15

_gal_:
            $ "gal"                              * 3CC27

_qt_:
            $ "qt"                               * 3CC37

_pt_:
            $ "pt"                               * 3CC45

_ml_:
            $ "ml"                               * 3CC53

_cu_:
            $ "cu"                               * 3CC61

_ozfl_:
            $ "ozfl"                             * 3CC6F

_ozUK_:
            $ "ozUK"                             * 3CC81

_tpsp_:
            $ "tbsp"                             * 3CC93

_tsp_:
            $ "tsp"                              * 3CCA5

_bbl_:
            $ "bbl"                              * 3CCB5

_bu_:
            $ "bu"                               * 3CCC5

_pk_:
            $ "pk"                               * 3CCD3

_fbm_:
            $ "fbm" }                            * 3CCE1
        ;                                        * 3CCF6

* ROMPTR 0A7 016
* refs (1): 3BE7E
ROMP_0A7_016:
        :: OBJ_3EF14                             * 3CCFB

{Time-Untis}:
          {                                      * 3CD05

_yr_:
            $ "yr"                               * 3CD0A

_d_:
            $ "d"                                * 3CD18

_h_:
            $ "h"                                * 3CD24

_min_:
            $ "min"                              * 3CD30

_s_:
            $ "s"                                * 3CD40

_Hz_:
            $ "Hz" }                             * 3CD4C
        ;                                        * 3CD5F

* ROMPTR 0A7 017
* refs (1): 3BE7E
ROMP_0A7_017:
        :: OBJ_3EF14                             * 3CD64
          {                                      * 3CD6E

_m/s:
            $ "m/s"                              * 3CD73

_cm/s_:
            $ "cm/s"                             * 3CD83

_ft/s_:
            $ "ft/s"                             * 3CD95

_kph_:
            $ "kph"                              * 3CDA7

_mph_:
            $ "mph"                              * 3CDB7

_knot_:
            $ "knot"                             * 3CDC7

_c_:
            $ "c"                                * 3CDD9

_ga_:
            $ "ga" }                             * 3CDE5
        ;                                        * 3CDF8

* ROMPTR 0A7 018
* refs (1): 3BE7E
ROMP_0A7_018:
        :: OBJ_3EF14                             * 3CDFD

{Mass-Units}:
          {                                      * 3CE07

_kg_:
            $ "kg"                               * 3CE0C

_g_:
            $ "g"                                * 3CE1A

_lb_:
            $ "lb"                               * 3CE26

_oz_:
            $ "oz"                               * 3CE34

_slug_:
            $ "slug"                             * 3CE42

_lbt_:
            $ "lbt"                              * 3CE54

_ton_:
            $ "ton"                              * 3CE64

_tonUK_:
            $ "tonUK"                            * 3CE74

_t_:
            $ "t"                                * 3CE88

_ozt_:
            $ "ozt"                              * 3CE94

_ct_:
            $ "ct"                               * 3CEA4

_grain_:
            $ "grain"                            * 3CEB2

_u_:
            $ "u"                                * 3CEC6

_mol__3CED2:
            $ "mol" }                            * 3CED2
        ;                                        * 3CEE7

* ROMPTR 0A7 019
* refs (1): 3BE7E
ROMP_0A7_019:
        :: OBJ_3EF14                             * 3CEEC

{Force-Units}:
          {                                      * 3CEF6

_N_:
            $ "N"                                * 3CEFB

_dyn_:
            $ "dyn"                              * 3CF07

_gf_:
            $ "gf"                               * 3CF17

_kip_:
            $ "kip"                              * 3CF25

_ldf_:
            $ "lbf"                              * 3CF35

_pdl_:
            $ "pdl" }                            * 3CF45
        ;                                        * 3CF5A

* ROMPTR 0A7 01A
* refs (1): 3BE7E
ROMP_0A7_01A:
        :: OBJ_3EF14                             * 3CF5F

{Enrg-Units}:
          {                                      * 3CF69

_J_:
            $ "J"                                * 3CF6E

_erg_:
            $ "erg"                              * 3CF7A

_Kcal_:
            $ "Kcal"                             * 3CF8A

cal:
            $ "cal"                              * 3CF9C

_Btu_:
            $ "Btu"                              * 3CFAC

_ft*lbf_:
            $ "ft*lbf"                           * 3CFBC

_therm_:
            $ "therm"                            * 3CFD2

_MeV_:
            $ "MeV"                              * 3CFE6

_eV_:
            $ "eV" }                             * 3CFF6
        ;                                        * 3D009
