* HP 48GX ROM revision R, #1A002-#1C016: User arithmetic commands (x+, x*, ...)
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: x* x+ x/ x^ x- xINV xNEG xi xLN x= xSQRT xSIN
* Follows on from the previous file (at #1A002 in the original ROM).
        RPL

* refs (11): B2733 B31D5 B3A23 BBC99 BC1AA BC7B5 ...
OBJ_1A002:
        :: DUPTYPEBINT? case JstGetTHEMESG       * 1A002
        ;                                        * 1A016

* refs (13): AA1D8 B31D0 BC1A5 BC3D1 D6B9E D7FB2 ...
OBJ_1A01B:
        :: SWAP ?ROMPTR@ SWAP NTHCOMPDROP ?ROMPTR@ ; * 1A01B

* refs (6): 19B26 B15FC B2E81 D6886 D8627 D8729
OBJ_1A03E:
        :: SetDA1Bad SetDA2aBad SetDA2bBad SetDA3Bad ; * 1A03E

* refs (1): 19EBC
DoInputForm~2~1~2:
        :: 2DUP Key>U/SKeyOb OBJ_4080F SWAPDROP case2drop 'DoBadKeyT * 1A05C
          5GETLAM DUP ROMPTR 0B0 088 casedrop OBJ_19F0F * 1A07F
          ROMPTR 0B0 08B NOTcase2drop 'DoBadKeyT * 1A09E
          ROMPTR 0B0 052 ;                       * 1A0B3
        FILLTO  #1A0FE                           * 1A0C3  59 zero nibbles: the next entry stays at #1A0FE

* name ->
* ROMPTR 002 020 CRDIR
* refs (1): 189EA
        CON(1)  8                                * 1A0FE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A0FF  library
        CON(3)  #020                             * 1A102  command
xCRDIR:
        :: CK1&Dispatch                          * 1A105
          BINT6 CREATEDIR                        * 1A10F  name
        ;                                        * 1A119

* -> {HOME dir1 .. dirn}
* ROMPTR 002 021 PATH
* refs (1): 189EA
        CON(1)  8                                * 1A11E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A11F  library
        CON(3)  #021                             * 1A122  command
xPATH:
        :: CK0 PATHDIR ;                         * 1A125

* ->
* ROMPTR 002 022 HOME
* refs (6): 184D2 189EA 20BCC 39A6F B9CEF D29F2
        CON(1)  8                                * 1A139  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A13A  library
        CON(3)  #022                             * 1A13D  command
xHOME:
        :: CK0 HOMEDIR ;                         * 1A140

* ->
* ROMPTR 002 023 UPDIR
* refs (2): 189EA B9D03
        CON(1)  8                                * 1A154  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A155  library
        CON(3)  #023                             * 1A158  command
xUPDIR:
        :: CK0 UPDIR ;                           * 1A15B

* ->
* refs (3): 1A165 D2BDF D2E0F
UPDIR:
        :: CONTEXT@ MYRAMROMPAIR NOT?SEMI        * 1A16F
          CONTEXT! ;                             * 1A183

* -> {}
* ROMPTR 002 024 VARS
* refs (1): 189EA
        CON(1)  8                                * 1A18D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A18E  library
        CON(3)  #024                             * 1A191  command
xVARS:
        :: CK0 DOVARS ;                          * 1A194

* ntype -> {} {n...} -> {}
* ROMPTR 002 025 TVARS
* refs (1): 189EA
        CON(1)  8                                * 1A1A8  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A1A9  library
        CON(3)  #025                             * 1A1AC  command
xTVARS:
        :: CK1&Dispatch                          * 1A1AF
          BINT1 DOTVARS%                         * 1A1B9  real
          BINT5 tvars(li)                        * 1A1C3  list
        ;                                        * 1A1CD

* obj -> chksum size
* ROMPTR 002 026 BYTES
* refs (1): 189EA
        CON(1)  8                                * 1A1D2  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A1D3  library
        CON(3)  #026                             * 1A1D6  command
xBYTES:
        :: CK1&Dispatch                          * 1A1D9
          BINT6 VARSIZE                          * 1A1E3  name
          BINT0 OCRC%                            * 1A1ED  any
        ;                                        * 1A1F7

* ob -> hxs %bytes
* refs (1): 1A1F2
OCRC%:
        :: INHARDROM? ITE                        * 1A1FC
          :: DROP                                * 1A20B

#0000h:
            HXS 0000                             * 1A215

%2.5:
            % 2.5E0 ;                            * 1A223

bytes!(_):
          :: OCRC SWAP UNCOERCE %2 %/ ;          * 1A23D
        ;                                        * 1A260

* id -> hxs %bytes
* refs (3): 1A1E8 2DC75 B9DB3
VARSIZE:
        :: DUP XEQRCL OCRC SWAPROT ID>$ LEN$ #2* #+ # 9 #+ UNCOERCE %2 %/ ; * 1A265

* ob -> ob
* ROMPTR 002 027 NEWOB
* refs (1): 189EA
        CON(1)  8                                * 1A2B5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A2B6  library
        CON(3)  #027                             * 1A2B9  command
xNEWOB:
        :: CK1 INHARDROM? ?SEMI                  * 1A2BC
          TOTEMPOB ;                             * 1A2D0

* ob -> ob flag
* refs (9): 1479E 14807 150C5 1A201 1A2C6 216B0 ...
INHARDROM?:
        CON(5)  (*)+5                            * 1A2DA  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 1A2DF
        LC(5)   CMOS                             * 1A2E2
        ?C>A    A                                * 1A2E9
        GOYES   L_1A2F5                          * 1A2EC
        GOVLNG  PushFLoop                        * 1A2EE
L_1A2F5:
        GOVLNG  PushTLoop                        * 1A2F5

* ->
* ROMPTR 002 028 KILL
* refs (2): 14785 189EA
        CON(1)  8                                * 1A2FC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A2FD  library
        CON(3)  #028                             * 1A300  command
        RPL
xKILL:
        :: CK0 kill ;                            * 1A303

* ->
* ROMPTR 002 029 OFF
* refs (1): 189EA
        CON(1)  8                                * 1A317  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A318  library
        CON(3)  #029                             * 1A31B  command
xOFF:
        :: CK0 TurnOff ;                         * 1A31E

* n -> #n -> $ -> 0 ->
* ROMPTR 002 02A DOERR
* refs (1): 189EA
        CON(1)  8                                * 1A332  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A333  library
        CON(3)  #02A                             * 1A336  command
xDOERR:
        :: CK1&Dispatch                          * 1A339
          BINT1 DO%EXIT                          * 1A343  real
          BINT3 DO$EXIT                          * 1A34D  string
          BINT11 DOHXSEXIT                       * 1A357  binary
        ;                                        * 1A361

* ->
* ROMPTR 002 02B ERR0
* refs (1): 189EA
        CON(1)  8                                * 1A366  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A367  library
        CON(3)  #02B                             * 1A36A  command
xERR0:
        :: CK0 ERR0 ;                            * 1A36D

* -> $nerr
* ROMPTR 002 02C ERRN
* refs (1): 189EA
        CON(1)  8                                * 1A381  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A382  library
        CON(3)  #02C                             * 1A385  command
xERRN:
        :: CK0 ERRN>HXS ;                        * 1A388

* -> $msg
* ROMPTR 002 02D ERRM
* refs (1): 189EA
        CON(1)  8                                * 1A39C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A39D  library
        CON(3)  #02D                             * 1A3A0  command
xERRM:
        :: CK0 ERRM ;                            * 1A3A3

* ob -> ?
* ROMPTR 002 02E EVAL
* refs (18): 158AF 158D2 158F5 189EA 1A4BC 1A509 ...
        CON(1)  8                                * 1A3B7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A3B8  library
        CON(3)  #02E                             * 1A3BB  command
xEVAL:
        :: CK1&Dispatch                          * 1A3BE
          BINT9 COMPEVAL                         * 1A3C8  algebraic
          BINT5 COMPEVAL                         * 1A3D2  list
          BINT13 eval(to)                        * 1A3DC  tagged
          BINT0 EVAL                             * 1A3E6  any
        ;                                        * 1A3F0

* slots of 002 02E (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #A3                              * 1A3F5  end of the slots: property byte (meaning not yet known)

* 0/1 objT objF -> ?
* ROMPTR 002 02F IFTE
* refs (9): 189EA 54649 54689 5BB27 85007 85DF4 ...
        CON(1)  1                                * 1A3F7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A3F8  library
        CON(3)  #02F                             * 1A3FB  command
xIFTE:
        :: CK3&Dispatch                          * 1A3FE
          REALOBOB %IFTE                         * 1A408  real any any
          SYMREALREAL ifte(ex,2_)                * 1A412  name|local|algebraic real real
          SYMREALCMP ifte(ex,2_)                 * 1A41C  name|local|algebraic real complex
          SYMCMPREAL ifte(ex,2_)                 * 1A426  name|local|algebraic complex real
          SYMCMPCMP ifte(ex,2_)                  * 1A430  name|local|algebraic complex complex
          SYMSYMREAL ifte(ex,2_)                 * 1A43A  name|local|algebraic name|local|algebraic real
          SYMSYMCMP ifte(ex,2_)                  * 1A444  name|local|algebraic name|local|algebraic complex
          SYMREALSYM ifte(ex,2_)                 * 1A44E  name|local|algebraic real name|local|algebraic
          SYMCMPSYM ifte(ex,2_)                  * 1A458  name|local|algebraic complex name|local|algebraic
          3SYM ifte(ex,2_)                       * 1A462  name|local|algebraic name|local|algebraic name|local|algebraic
        ;                                        * 1A46C

#0526260410h:
        HXS 0140626250                           * 1A471
        NIBHEX  28DD7                            * 1A485  ∇Ý

        ROMPTR 0F0 095                           * 1A48A

        CON(5)  nWHEREIFTE                       * 1A495  address (the code jumps or points through it)

        CON(5)  OBJ_5A257                        * 1A49A  address (the code jumps or points through it)
        NIBHEX  0000                             * 1A49F  ..

* % ob1 ob2 -> ?
* refs (1): 1A40D
%IFTE:
        :: ROT %0= ?SWAPDROP 'EvalNoCK:_sup xEVAL ; * 1A4A3

* 0/1 obj -> ?
* ROMPTR 002 030 IFT
* refs (2): 189EA 1A51D
        CON(1)  8                                * 1A4C6  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A4C7  library
        CON(3)  #030                             * 1A4CA  command
xIFT:
        :: CK2&Dispatch                          * 1A4CD
          BINT16 ift(r,_)                        * 1A4D7  real any
          SYMOB ift(ex,_)                        * 1A4E1  name|local|algebraic any
        ;                                        * 1A4EB

* refs (1): 1A4DC
ift(r,_):
        :: SWAP %0= caseDROP 'EvalNoCK:_sup      * 1A4F0
          xEVAL ;                                * 1A509

* refs (1): 1A4E6
ift(ex,_):
        :: SYMCRUNCH2 xIFT ;                     * 1A513

* # -> ?
* ROMPTR 002 031 SYSEVAL
* refs (1): 189EA
        CON(1)  8                                * 1A527  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A528  library
        CON(3)  #031                             * 1A52B  command
xSYSEVAL:
        :: CK1&Dispatch                          * 1A52E
          BINT11 syseval(b)                      * 1A538  binary
        ;                                        * 1A542

* refs (1): 1A53D
syseval(b):
        :: HXS># COLA                            * 1A547

syseval(s):
          CODE                                   * 1A556  24 nibbles
            C=DAT1  A                            * 1A560
            D1=D1+  5                            * 1A563
            D=D+1   A                            * 1A566
            CD1EX                                * 1A568
            D1=D1+  5                            * 1A56B
            A=DAT1  A                            * 1A56E
            D1=C                                 * 1A571
            PC=(A)                               * 1A574
          ENDCODE                                * 1A578
        ;                                        * 1A578

* obj n_line ->
* ROMPTR 002 032 DISP
* refs (1): 189EA
        CON(1)  8                                * 1A57D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A57E  library
        CON(3)  #032                             * 1A581  command
xDISP:
        :: CK2&Dispatch                          * 1A584
          BINT1 DODISP                           * 1A58E  real
        ;                                        * 1A598

* n ->
* ROMPTR 002 033 FREEZE
* refs (1): 189EA
        CON(1)  8                                * 1A59D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A59E  library
        CON(3)  #033                             * 1A5A1  command
xFREEZE:
        :: CK1&Dispatch                          * 1A5A4
          BINT1 Ck&Freeze                        * 1A5AE  real
        ;                                        * 1A5B8

* freq dur ->
* ROMPTR 002 034 BEEP
* refs (1): 189EA
        CON(1)  8                                * 1A5BD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A5BE  library
        CON(3)  #034                             * 1A5C1  command
xBEEP:
        :: CK2&Dispatch                          * 1A5C4
          BINT17 DOBEEP                          * 1A5CE  real real
        ;                                        * 1A5D8

* x -> x'
* ROMPTR 002 035 →NUM
* refs (2): 189EA 6BBB8
        CON(1)  8                                * 1A5DD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A5DE  library
        CON(3)  #035                             * 1A5E1  command
x>NUM:
        :: CK1 STRIPTAGS CRUNCH ;                * 1A5E4

* -> ob1 .. obn
* ROMPTR 002 036 LASTARG
* refs (1): 189EA
        CON(1)  8                                * 1A5FD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A5FE  library
        CON(3)  #036                             * 1A601  command
xLAST:
        :: CK0 BINT55 TestSysFlag NOTcase lastarg * 1A604
          Err#NoLstArg ERROROUT ;                * 1A622

* refs (1): 1A61D
lastarg:
        CON(5)  (*)+5                            * 1A631  primitive code object
        ASSEMBLE
        ST=0    10                               * 1A636
L_1A639:
        AD0EX                                    * 1A639
        D0=(5)  LASTARG5                         * 1A63C
        C=DAT0  A                                * 1A643
        ?C#0    A                                * 1A646
        GOYES   L_1A67B                          * 1A649
        D0=D0-  5                                * 1A64B
        C=DAT0  A                                * 1A64E
        ?C#0    A                                * 1A651
        GOYES   L_1A68C                          * 1A654
        D0=D0-  5                                * 1A656
        C=DAT0  A                                * 1A659
        ?C#0    A                                * 1A65C
        GOYES   L_1A6AD                          * 1A65F
        D0=D0-  5                                * 1A661
        C=DAT0  A                                * 1A664
        ?C#0    A                                * 1A667
        GOYES   L_1A6BE                          * 1A66A
        D0=D0-  5                                * 1A66C
        C=DAT0  A                                * 1A66F
        ?C#0    A                                * 1A672
        GOYES   L_1A6CF                          * 1A675
        GOTO    L_1A6E8                          * 1A677
L_1A67B:
        D=D-CON A,5                              * 1A67B
        GOC     L_1A6F7                          * 1A681
        D1=D1-  10                               * 1A684
        P=      9                                * 1A687
        GONC    L_1A69A                          * 1A689
L_1A68C:
        D=D-CON A,4                              * 1A68C
        GOC     L_1A6F7                          * 1A692
        D1=D1-  5                                * 1A695
        P=      4                                * 1A698
L_1A69A:
        D0=(5)  LASTARG4                         * 1A69A
        C=DAT0  WP                               * 1A6A1
        DAT1=C  WP                               * 1A6A5
        GOTO    L_1A6B6                          * 1A6A9
L_1A6AD:
        D=D-CON A,3                              * 1A6AD
        GOC     L_1A6F7                          * 1A6B3
L_1A6B6:
        D1=D1-  15                               * 1A6B6
        P=      14                               * 1A6B9
        GONC    L_1A6D9                          * 1A6BB
L_1A6BE:
        D=D-CON A,2                              * 1A6BE
        GOC     L_1A6F7                          * 1A6C4
        D1=D1-  10                               * 1A6C7
        P=      9                                * 1A6CA
        GONC    L_1A6D9                          * 1A6CC
L_1A6CF:
        D=D-1   A                                * 1A6CF
        GOC     L_1A6F7                          * 1A6D1
        D1=D1-  5                                * 1A6D4
        P=      4                                * 1A6D7
L_1A6D9:
        D0=(5)  LASTARG                          * 1A6D9
        C=DAT0  WP                               * 1A6E0
        DAT1=C  WP                               * 1A6E4
L_1A6E8:
        D0=A                                     * 1A6E8
        P=      0                                * 1A6EB
        A=DAT0  A                                * 1A6ED
        D0=D0+  5                                * 1A6F0
        PC=(A)                                   * 1A6F3
L_1A6F7:
        D=D+C   A                                * 1A6F7
        D0=A                                     * 1A6F9
        P=      0                                * 1A6FC
        GOSBVL  SUB_14ED6                        * 1A6FE
        ST=1    10                               * 1A705
        GOTO    L_1A639                          * 1A708
        BSS     12                               * 1A70C

* sec -> 0 -> rc.p
* ROMPTR 002 037 WAIT
* refs (1): 189EA
        CON(1)  8                                * 1A718  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A719  library
        CON(3)  #037                             * 1A71C  command
        RPL
xWAIT:
        :: CK1&Dispatch                          * 1A71F
          BINT1 Wait/GetKey                      * 1A729  real
        ;                                        * 1A733

* % -> ?
* refs (1): 1A72E
Wait/GetKey:
        :: DUP %0> case dowait/quit?             * 1A738
          %0<> IT DispMenu.1                     * 1A751
          WaitForKey InitEdModes OVER BINT45 #= OVER BINT1 #= 3PICK BINT4 #= * 1A760
          OR AND case2drop ABORT                 * 1A797
          CodePl>%rc.p ;                         * 1A7AB

* %secs ->
* refs (1): 1A74C
dowait/quit?:
        :: dowait OBJ_4241B ;                    * 1A7B5

* %secs ->
* refs (5): 1A7BA 2DC1B 2E0D1 2F031 C0BA9
dowait:
        ::                                       * 1A7C9

%8.192E3:
          % 8.192E3 %* %>#                       * 1A7CE

* hxs ->
wait:
          CODE                                   * 1A7ED  85 nibbles
            A=DAT1  A                            * 1A7F7
            D1=D1+  5                            * 1A7FA
            D=D+1   A                            * 1A7FD
            GOSBVL  SAVPTR                       * 1A7FF
            D1=A                                 * 1A806
            D1=D1+  10                           * 1A809
            C=DAT1  W                            * 1A80C
            R0=C                                 * 1A810
            GOSBVL  GetTime++                    * 1A813
            R1=C                                 * 1A81A
L_1A81D:
            D0=(5)  ATTNFLG                      * 1A81D
            A=DAT0  A                            * 1A824
            ?A#0    A                            * 1A827
            GOYES   L_1A843                      * 1A82A
            GOSBVL  GetTime++                    * 1A82C
            A=R1                                 * 1A833
            P=      12                           * 1A836
            C=C-A   WP                           * 1A838
            A=R0                                 * 1A83B
            ?C<=A   WP                           * 1A83E
            GOYES   L_1A81D                      * 1A841
L_1A843:
            P=      0                            * 1A843
            GOVLNG  GETPTRLOOP                   * 1A845
          ENDCODE                                * 1A84C
        ;                                        * 1A84C

* ->
* ROMPTR 002 038 CLLCD
* refs (3): 189EA C7162 C7171
        CON(1)  8                                * 1A851  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A852  library
        CON(3)  #038                             * 1A855  command
xCLLCD:
        :: CK0 DOCLLCD ;                         * 1A858

* -> rc 1 -> 0
* ROMPTR 002 039 KEY
* refs (1): 189EA
        CON(1)  8                                * 1A86C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A86D  library
        CON(3)  #039                             * 1A870  command
xKEY:
        :: CK0 GETTOUCH NOTcase %0_2A2B4         * 1A873
          H/W>KeyCode BINT63 #AND BINT1 CodePl>%rc.p %IP %1 ; * 1A88C

* ->
* ROMPTR 002 03A CONT
* refs (1): 189EA
        CON(1)  8                                * 1A8B4  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A8B5  library
        CON(3)  #03A                             * 1A8B8  command
xCONT:
        :: CK0 cont ;                            * 1A8BB

* slots of 002 03A (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #C8                              * 1A8CF  end of the slots: property byte (meaning not yet known)

* x y -> x=y
* ROMPTR 002 03B =
* refs (32): 15708 189EA 1CF3D 285D0 476CE 49D1C ...
        CON(1)  5                                * 1A8D1  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A8D2  library
        CON(3)  #03B                             * 1A8D5  command
x=:
        :: CK2&Dispatch                          * 1A8D8
          BINT17 x=~1                            * 1A8E2  real real
          BINT18 x=~1                            * 1A8EC  real complex
          BINT33 x=~1                            * 1A8F6  complex real
          BINT34 x=~1                            * 1A900  complex complex
          BINT26 x=~1                            * 1A90A  real name|local|algebraic
          BINT42 x=~1                            * 1A914  complex name|local|algebraic
          SYMREAL x=~1                           * 1A91E  name|local|algebraic real
          OBJ_64D7E x=~1                         * 1A928  name|local|algebraic complex
          SYMSYM x=~1                            * 1A932  name|local|algebraic name|local|algebraic
          2EXT x=~1                              * 1A93C  unit unit
          BINT30 x=~1                            * 1A946  real unit
          EXTREAL x=~1                           * 1A950  unit real
          SYMEXT x=~1                            * 1A95A  name|local|algebraic unit
          EXTSYM x=~1                            * 1A964  unit name|local|algebraic
        ;                                        * 1A96E

* slots of 002 03B (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6E50F                        * 1A973  slot 0
        CON(5)  #00700h                          * 1A978  slot 1
        CON(5)  D/D=                             * 1A97D  slot 2
        CON(5)  OBJ_57451                        * 1A982  slot 3
        CON(5)  MANMENUEQ                        * 1A987  slot 4
        CON(2)  #C8                              * 1A98C  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 03C NEG
* refs (44): 189EA 20389 203A2 274FE 3B59B 3B5B4 ...
        CON(1)  5                                * 1A98E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1A98F  library
        CON(3)  #03C                             * 1A992  command
xNEG:
        :: CK1&Dispatch                          * 1A995
          BINT1 %CHS                             * 1A99F  real
          BINT2 C%CHS                            * 1A9A9  complex
          BINT4 MATNEG                           * 1A9B3  array
          BINT10 SYMNEG                          * 1A9BD  name|local|algebraic
          BINT14 UMCHS                           * 1A9C7  unit
          BINT11 bitNEG                          * 1A9D1  binary
          BINT12 inv(go)                         * 1A9DB  grob
          BINT8 neg(PICT)                        * 1A9E5  program
        ;                                        * 1A9EF

* slots of 002 03C (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6D55F                        * 1A9F4  slot 0

* refs (1): 1ACFB
#8010h:
        HXS 0108                                 * 1A9F9  slot 1
        CON(5)  D/DCHS                           * 1AA07  slot 2
        CON(5)  OBJ_57488                        * 1AA0C  slot 3
        CON(5)  MANMENUCSIV                      * 1AA11  slot 4
        CON(2)  #80                              * 1AA16  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 03D ABS
* refs (4): 189EA 54F13 837B6 86123
        CON(1)  0                                * 1AA18  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AA19  library
        CON(3)  #03D                             * 1AA1C  command
xABS:
        :: CK1&Dispatch                          * 1AA1F
          BINT1 %ABS                             * 1AA29  real
          BINT2 C%ABS                            * 1AA33  complex
          BINT4 MATABS                           * 1AA3D  array
          BINT10 SYMABS                          * 1AA47  name|local|algebraic
          BINT14 UMABS                           * 1AA51  unit
        ;                                        * 1AA5B

* slots of 002 03D (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DABS                           * 1AA60  slot 0
        CON(2)  #C8                              * 1AA65  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 03E CONJ
* refs (12): 189EA 20408 20421 54F2C 55472 554EA ...
        CON(1)  0                                * 1AA67  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AA68  library
        CON(3)  #03E                             * 1AA6B  command
xCONJ:
        :: CK1&Dispatch                          * 1AA6E
          BINT1 NOP                              * 1AA78  real
          BINT2 C%CONJ                           * 1AA82  complex
          BINT4 MATCONJ                          * 1AA8C  array
          BINT10 SYMCONJ                         * 1AA96  name|local|algebraic
        ;                                        * 1AAA0

* slots of 002 03E (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DCONJ                          * 1AAA5  slot 0
        CON(5)  OBJ_575EE                        * 1AAAA  slot 1
        CON(5)  MANMENUCX                        * 1AAAF  slot 2
        CON(2)  #80                              * 1AAB4  end of the slots: property byte (meaning not yet known)

* -> pi
* ROMPTR 002 03F π
* refs (21): 189EA 3C0C1 54D4E 55454 554CC 56C31 ...
        CON(1)  0                                * 1AAB6  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AAB7  library
        CON(3)  #03F                             * 1AABA  command
xPI:
        :: CK0 pi ;                              * 1AABD

* slots of 002 03F (derivative, inverse, ...: used by the symbolic code)
        CON(5)  DROP%0b                          * 1AAD1  slot 0
        CON(2)  #80                              * 1AAD6  end of the slots: property byte (meaning not yet known)

* -> MAXR
* ROMPTR 002 040 MAXR
* refs (4): 189EA 3C0D5 54D2B 8C1F8
        CON(1)  0                                * 1AAD8  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AAD9  library
        CON(3)  #040                             * 1AADC  command
xMAXR:
        :: CK0 maxr ;                            * 1AADF

* slots of 002 040 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  DROP%0b                          * 1AAF3  slot 0
        CON(2)  #80                              * 1AAF8  end of the slots: property byte (meaning not yet known)

* -> MINR
* ROMPTR 002 041 MINR
* refs (3): 189EA 3C0CB 54D08
        CON(1)  0                                * 1AAFA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AAFB  library
        CON(3)  #041                             * 1AAFE  command
xMINR:
        :: CK0 xMINR~1 ;                         * 1AB01

* slots of 002 041 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  DROP%0b                          * 1AB15  slot 0
        CON(2)  #80                              * 1AB1A  end of the slots: property byte (meaning not yet known)

* -> e
* ROMPTR 002 042 e
* refs (3): 189EA 3C0AD 54D94
        CON(1)  0                                * 1AB1C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AB1D  library
        CON(3)  #042                             * 1AB20  command
xCONSTANTe:
        :: CK0 e ;                               * 1AB23

* slots of 002 042 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  DROP%0b                          * 1AB37  slot 0
        CON(2)  #80                              * 1AB3C  end of the slots: property byte (meaning not yet known)

* -> i
* ROMPTR 002 043 i
* refs (34): 189EA 281D8 3C0B7 54D71 553F5 55463 ...
        CON(1)  0                                * 1AB3E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AB3F  library
        CON(3)  #043                             * 1AB42  command
xi:
        :: CK0 i ;                               * 1AB45

* slots of 002 043 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  DROP%0b                          * 1AB59  slot 0
        CON(2)  #C8                              * 1AB5E  end of the slots: property byte (meaning not yet known)

* x y -> x+y
* ROMPTR 002 044 +
* refs (116): 189EA 204B4 204F0 281E2 48BF7 48C38 ...
        CON(1)  5                                * 1AB60  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AB61  library
        CON(3)  #044                             * 1AB64  command
x+:
        :: CK2&Dispatch                          * 1AB67
          BINT17 %+                              * 1AB71  real real
          BINT18 C%R+C                           * 1AB7B  real complex
          BINT33 C%C+R                           * 1AB85  complex real
          BINT34 C%C+C                           * 1AB8F  complex complex
          BINT27 bit%#+                          * 1AB99  real binary
          HXSREAL bit#%+                         * 1ABA3  binary real
          2HXS bit+                              * 1ABAD  binary binary
          2EXT UM+                               * 1ABB7  unit unit
          BINT30 UM+                             * 1ABC1  real unit
          EXTREAL UM+                            * 1ABCB  unit real
          SYMSYM SYM+                            * 1ABD5  name|local|algebraic name|local|algebraic
          BINT26 O+SYM                           * 1ABDF  real name|local|algebraic
          SYMREAL SYM+O                          * 1ABE9  name|local|algebraic real
          BINT42 O+SYM                           * 1ABF3  complex name|local|algebraic
          OBJ_64D7E SYM+O                        * 1ABFD  name|local|algebraic complex
          SYMEXT SYM+O                           * 1AC07  name|local|algebraic unit
          EXTSYM O+SYM                           * 1AC11  unit name|local|algebraic
          BINT68 MAT+                            * 1AC1B  array array
          2GROB +(2go)                           * 1AC25  grob grob
          BINT85 &COMP                           * 1AC2F  list list
          BINT51 &$                              * 1AC39  string string
          OBJ_64C34 >TCOMP                       * 1AC43  list any
          BINT5 SWAP>HCOMP                       * 1AC4D  list
          BINT48 +(st,_)                         * 1AC57  string any
          BINT3 +(_,st)                          * 1AC61  string
        ;                                        * 1AC6B

* slots of 002 044 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6CCCC                        * 1AC70  slot 0

* refs (1): 1ADD1
#70107h:
        HXS 70107                                * 1AC75  slot 1
        CON(5)  D/D+                             * 1AC84  slot 2
        CON(5)  OBJ_57446                        * 1AC89  slot 3
        CON(5)  MANMENU+-                        * 1AC8E  slot 4

* ob comp -> ob+comp
* refs (2): 1AC52 49B0A
SWAP>HCOMP:
        :: SWAP >HCOMP ;                         * 1AC93  slot 5

* refs (1): 1AC5C
+(st,_):
        :: DECOMP$ &$ ;                          * 1ACA7  slot 6

* refs (1): 1AC66
+(_,st):
        :: SWAP DECOMP$ SWAP&$ ;                 * 1ACBB  slot 7
        CON(2)  #00                              * 1ACD4  end of the slots: property byte (meaning not yet known)

* ->
* ROMPTR 002 045
* refs (3): 189EA 2751C 28002
        CON(1)  5                                * 1ACD6  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1ACD7  library
        CON(3)  #045                             * 1ACDA  command
xNEGNEG:
        :: CK1&Dispatch                          * 1ACDD
          BINT0 NOP                              * 1ACE7  any
        ;                                        * 1ACF1

* slots of 002 045 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6D55F                        * 1ACF6  slot 0
        CON(5)  #8010h                           * 1ACFB  slot 1
        CON(2)  #C8                              * 1AD00  end of the slots: property byte (meaning not yet known)

* x y -> x-y
* ROMPTR 002 046 -
* refs (70): 189EA 20597 205B5 498E4 5594A 55F85 ...
        CON(1)  5                                * 1AD02  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AD03  library
        CON(3)  #046                             * 1AD06  command
x-:
        :: CK2&Dispatch                          * 1AD09
          BINT17 %-                              * 1AD13  real real
          BINT18 C%R-C                           * 1AD1D  real complex
          BINT33 C%C-R                           * 1AD27  complex real
          BINT34 C%C-C                           * 1AD31  complex complex
          BINT27 bit%#-                          * 1AD3B  real binary
          HXSREAL bit#%-                         * 1AD45  binary real
          2HXS bit-                              * 1AD4F  binary binary
          BINT68 MAT-                            * 1AD59  array array
          BINT26 SYM-                            * 1AD63  real name|local|algebraic
          BINT42 SYM-                            * 1AD6D  complex name|local|algebraic
          SYMREAL SYM-O                          * 1AD77  name|local|algebraic real
          OBJ_64D7E SYM-O                        * 1AD81  name|local|algebraic complex
          SYMSYM -(2ex)                          * 1AD8B  name|local|algebraic name|local|algebraic
          2EXT UM-                               * 1AD95  unit unit
          BINT30 UM-                             * 1AD9F  real unit
          EXTREAL UM-                            * 1ADA9  unit real
          SYMEXT SYM-O                           * 1ADB3  name|local|algebraic unit
          EXTSYM SYM-                            * 1ADBD  unit name|local|algebraic
        ;                                        * 1ADC7

* slots of 002 046 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6CCCC                        * 1ADCC  slot 0
        CON(5)  #70107h                          * 1ADD1  slot 1
        CON(5)  D/D-                             * 1ADD6  slot 2
        CON(5)  OBJ_57451                        * 1ADDB  slot 3
        CON(5)  MANMENU+-                        * 1ADE0  slot 4
        CON(2)  #C8                              * 1ADE5  end of the slots: property byte (meaning not yet known)

* x y -> x*y
* ROMPTR 002 047 *
* refs (195): 189EA 1FB45 207DA 207F8 20820 20848 ...
        CON(1)  5                                * 1ADE7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1ADE8  library
        CON(3)  #047                             * 1ADEB  command
x*:
        :: CK2&Dispatch                          * 1ADEE
          BINT17 %*                              * 1ADF8  real real
          BINT18 C%R*C                           * 1AE02  real complex
          BINT33 C%C*R                           * 1AE0C  complex real
          BINT34 C%C*C_51D88                     * 1AE16  complex complex
          BINT27 bit%#*                          * 1AE20  real binary
          HXSREAL bit#%*                         * 1AE2A  binary real
          2HXS bit*                              * 1AE34  binary binary
          BINT20 MATFLOAT*                       * 1AE3E  real array
          BINT36 MATFLOAT*                       * 1AE48  complex array
          BINT65 MATFLOAT*                       * 1AE52  array real
          BINT66 MATFLOAT*                       * 1AE5C  array complex
          BINT68 MAT*                            * 1AE66  array array
          BINT26 O*SYM                           * 1AE70  real name|local|algebraic
          BINT42 O*SYM                           * 1AE7A  complex name|local|algebraic
          SYMREAL SYM*O                          * 1AE84  name|local|algebraic real
          OBJ_64D7E SYM*O                        * 1AE8E  name|local|algebraic complex
          SYMSYM SYM*                            * 1AE98  name|local|algebraic name|local|algebraic
          2EXT UM*                               * 1AEA2  unit unit
          BINT30 UM*                             * 1AEAC  real unit
          EXTREAL UM*                            * 1AEB6  unit real
          SYMEXT SYM*O                           * 1AEC0  name|local|algebraic unit
          EXTSYM O*SYM                           * 1AECA  unit name|local|algebraic
        ;                                        * 1AED4

* slots of 002 047 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6CCCC                        * 1AED9  slot 0

* refs (1): 1B004
#80108h:
        HXS 80108                                * 1AEDE  slot 1
        CON(5)  D/D*                             * 1AEED  slot 2
        CON(5)  OBJ_5745C                        * 1AEF2  slot 3
        CON(5)  MANMENU*/                        * 1AEF7  slot 4
        CON(2)  #C8                              * 1AEFC  end of the slots: property byte (meaning not yet known)

* x y -> x/y
* ROMPTR 002 048 /
* refs (90): 189EA 1FB6C 2067F 2069D 206C5 20706 ...
        CON(1)  5                                * 1AEFE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1AEFF  library
        CON(3)  #048                             * 1AF02  command
x/:
        :: CK2&Dispatch                          * 1AF05
          BINT17 %/                              * 1AF0F  real real
          BINT18 C%R/C                           * 1AF19  real complex
          BINT33 C%C/R                           * 1AF23  complex real
          BINT34 C%C/C                           * 1AF2D  complex complex
          BINT27 bit%#/                          * 1AF37  real binary
          HXSREAL bit#%/                         * 1AF41  binary real
          2HXS bit/                              * 1AF4B  binary binary
          BINT65 MATFLOAT/                       * 1AF55  array real
          BINT66 MATFLOAT/                       * 1AF5F  array complex
          BINT68 MAT/                            * 1AF69  array array
          BINT26 O/SYM                           * 1AF73  real name|local|algebraic
          BINT42 O/SYM                           * 1AF7D  complex name|local|algebraic
          SYMREAL SYM/O                          * 1AF87  name|local|algebraic real
          OBJ_64D7E SYM/O                        * 1AF91  name|local|algebraic complex
          SYMSYM SYM/                            * 1AF9B  name|local|algebraic name|local|algebraic
          2EXT UM/                               * 1AFA5  unit unit
          BINT30 UM/                             * 1AFAF  real unit
          EXTREAL UM/                            * 1AFB9  unit real
          SYMEXT SYM/O                           * 1AFC3  name|local|algebraic unit
          EXTSYM O/SYM                           * 1AFCD  unit name|local|algebraic
        ;                                        * 1AFD7

* slots of 002 048 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6CDDF                        * 1AFDC  slot 0
        CON(5)  OBJ_1AFF5                        * 1AFE1  slot 1
        CON(5)  D/D/                             * 1AFE6  slot 2
        CON(5)  OBJ_57467                        * 1AFEB  slot 3
        CON(5)  MANMENU*/                        * 1AFF0  slot 4

* refs (1): 1AFE1
OBJ_1AFF5:
        :: OBJ_6CC10 #0504108h #80108h RPITE ;   * 1AFF5  slot 5

* refs (1): 1AFFF
#0504108h:
        HXS 8014050                              * 1B013  slot 6
        CON(2)  #CC                              * 1B024  end of the slots: property byte (meaning not yet known)

* y x -> y^x
* ROMPTR 002 049 ^
* refs (85): 189EA 288F0 2903C 2906E 48C9C 55639 ...
        CON(1)  5                                * 1B026  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B027  library
        CON(3)  #049                             * 1B02A  command
x^:
        :: CK2&Dispatch                          * 1B02D
          BINT17 ^(2r)                           * 1B037  real real
          BINT18 C%R^C                           * 1B041  real complex
          BINT33 C%C^R                           * 1B04B  complex real
          BINT34 C%C^C                           * 1B055  complex complex
          BINT26 O^SYM                           * 1B05F  real name|local|algebraic
          BINT42 O^SYM                           * 1B069  complex name|local|algebraic
          SYMREAL SYM^O                          * 1B073  name|local|algebraic real
          OBJ_64D7E SYM^O                        * 1B07D  name|local|algebraic complex
          SYMSYM SYM^                            * 1B087  name|local|algebraic name|local|algebraic
          2EXT ^(2uo)                            * 1B091  unit unit
          BINT30 ^(2uo)                          * 1B09B  real unit
          EXTREAL ^(2uo)                         * 1B0A5  unit real
          SYMEXT SYM^O                           * 1B0AF  name|local|algebraic unit
          EXTSYM O^SYM                           * 1B0B9  unit name|local|algebraic
        ;                                        * 1B0C3

* slots of 002 049 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6D18B                        * 1B0C8  slot 0
        CON(5)  OBJ_1B0E6                        * 1B0CD  slot 1
        CON(5)  D/D^                             * 1B0D2  slot 2
        CON(5)  OBJ_57472                        * 1B0D7  slot 3
        CON(5)  MANMENU^                         * 1B0DC  slot 4
        CON(5)  OBJ_5B906                        * 1B0E1  slot 5

* refs (1): 1B0CD
OBJ_1B0E6:
        :: OBJ_6CC10 #0504109h #90109h RPITE ;   * 1B0E6  slot 6

* refs (1): 1B0F5
#90109h:
        HXS 90109                                * 1B104  slot 7

* refs (1): 1B0F0
#0504109h:
        HXS 9014050                              * 1B113  slot 8

* refs (1): 1B03C
^(2r):
        :: 2DUP ERRSET %^ ERRTRAP                * 1B124  slot 9
          :: ERROR@ # 304 #=?SKIP ERRJMP RDROP ERRORCLR Re>C% C%R^C ; * 1B13D
          ROTROT2DROP ;                          * 1B174

* ROMPTR 002 04A XROOT
* refs (3): 189EA 21DC8 5A2CF
        CON(1)  10                               * 1B17E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B17F  library
        CON(3)  #04A                             * 1B182  command
rpnXROOT:
        :: CK2&Dispatch                          * 1B185
          BINT5 rpnXROOT~1                       * 1B18F  list
          OBJ_64C34 rpnXROOT~1                   * 1B199  list any
          BINT0 rpnXROOT~any                     * 1B1A3  any
        ;                                        * 1B1AD

* slots of 002 04A (derivative, inverse, ...: used by the symbolic code)
        CON(5)  xXROOT                           * 1B1B2  slot 0
        CON(5)  0                                * 1B1B7  slot 1: none
        CON(5)  0                                * 1B1BC  slot 2: none
        CON(2)  #01                              * 1B1C1  end of the slots: property byte (meaning not yet known)

* y x -> Y'
* ROMPTR 002 04B
* refs (7): 189EA 19EFB 1B1B2 560B1 560CA 560E3 ...
        CON(1)  4                                * 1B1C3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B1C4  library
        CON(3)  #04B                             * 1B1C7  command
xXROOT:
        :: CK2&Dispatch                          * 1B1CA
          BINT17 xXROOT~real,real                * 1B1D4  real real
          BINT30 xXROOT~1                        * 1B1DE  real unit
          EXTREAL xXROOT~1                       * 1B1E8  unit real
          2EXT xXROOT~1                          * 1B1F2  unit unit
          BINT26 %SYMXROOT                       * 1B1FC  real name|local|algebraic
          SYMREAL SYM%XROOT                      * 1B206  name|local|algebraic real
          SYMSYM SYMXROOT                        * 1B210  name|local|algebraic name|local|algebraic
          SYMEXT SYM%XROOT                       * 1B21A  name|local|algebraic unit
          EXTSYM %SYMXROOT                       * 1B224  unit name|local|algebraic
        ;                                        * 1B22E

* slots of 002 04B (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_663E5                        * 1B233  slot 0
        CON(5)  OBJ_5A2AC                        * 1B238  slot 1

* refs (3): 1B1E3 1B1ED 1B1F7
xXROOT~1:
        :: SWAP UMXROOT ;                        * 1B23D  slot 2

* refs (1): 1B1D9
xXROOT~real,real:
        :: SWAP %NROOT ;                         * 1B251  slot 3
        CON(5)  NOP                              * 1B265  slot 4
        CON(5)  NOP                              * 1B26A  slot 5
        CON(2)  #CC                              * 1B26F  end of the slots: property byte (meaning not yet known)

* x -> 1/x [[]] -> [[]]'
* ROMPTR 002 04C INV
* refs (65): 189EA 2030A 20323 288D7 28968 54F45 ...
        CON(1)  0                                * 1B271  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B272  library
        CON(3)  #04C                             * 1B275  command
xINV:
        :: CK1&Dispatch                          * 1B278
          BINT1 %1/                              * 1B282  real
          BINT2 C%1/                             * 1B28C  complex
          BINT4 MATINV                           * 1B296  array
          BINT10 SYMINV                          * 1B2A0  name|local|algebraic
          BINT14 UMINV                           * 1B2AA  unit
        ;                                        * 1B2B4

* slots of 002 04C (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DINV                           * 1B2B9  slot 0
        CON(5)  OBJ_5749C                        * 1B2BE  slot 1
        CON(5)  MANMENUCSIV                      * 1B2C3  slot 2
        CON(5)  nINTGINV                         * 1B2C8  slot 3
        CON(5)  0                                * 1B2CD  slot 4: none
        CON(2)  #80                              * 1B2D2  end of the slots: property byte (meaning not yet known)

* c -> \Gh
* ROMPTR 002 04D ARG
* refs (2): 189EA 54F5E
        CON(1)  0                                * 1B2D4  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B2D5  library
        CON(3)  #04D                             * 1B2D8  command
xARG:
        :: CK1&Dispatch                          * 1B2DB
          BINT1 %ARG                             * 1B2E5  real
          BINT2 C%ARG                            * 1B2EF  complex
          BINT10 SYMARG                          * 1B2F9  name|local|algebraic
        ;                                        * 1B303

* slots of 002 04D (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DARG                           * 1B308  slot 0

* % %' -> %rem
* refs (1): 1B2EA
%ARG:
        :: %0_2A2B4 %ANGLE ;                     * 1B30D  slot 1
        CON(2)  #04                              * 1B321  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 04E SIGN
* refs (4): 189EA 54F77 7DC97 8378E
        CON(1)  0                                * 1B323  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B324  library
        CON(3)  #04E                             * 1B327  command
xSIGN:
        :: CK1&Dispatch                          * 1B32A
          BINT1 %SGN                             * 1B334  real
          BINT2 C%SGN                            * 1B33E  complex
          BINT10 SYMSIGN                         * 1B348  name|local|algebraic
          BINT14 UMSIGN                          * 1B352  unit
        ;                                        * 1B35C

* slots of 002 04E (derivative, inverse, ...: used by the symbolic code)
        CON(5)  nINTGSIGN                        * 1B361  slot 0
        CON(5)  0                                * 1B366  slot 1: none
        CON(2)  #C4                              * 1B36B  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 04F √
* refs (30): 189EA 2890E 54F90 555F3 564DF 57593 ...
        CON(1)  5                                * 1B36D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B36E  library
        CON(3)  #04F                             * 1B371  command
xSQRT:
        :: CK1&Dispatch                          * 1B374
          BINT1 CK%SQRT                          * 1B37E  real
          BINT2 C%SQRT                           * 1B388  complex
          BINT10 SYMSQRT                         * 1B392  name|local|algebraic
          BINT14 UMSQRT                          * 1B39C  unit
        ;                                        * 1B3A6

* slots of 002 04F (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6D729                        * 1B3AB  slot 0
        CON(5)  OBJ_1B3C9                        * 1B3B0  slot 1
        CON(5)  D/DSQRT                          * 1B3B5  slot 2
        CON(5)  OBJ_575A7                        * 1B3BA  slot 3
        CON(5)  nINTGSQRT                        * 1B3BF  slot 4
        CON(5)  0                                * 1B3C4  slot 5: none

* refs (1): 1B3B0
OBJ_1B3C9:
        :: OBJ_6CC10 #050410h #C010h RPITE ;     * 1B3C9  slot 6

* refs (1): 1B3D8
#C010h:
        HXS 010C                                 * 1B3E7  slot 7

* % -> SQRT%%
* refs (1): 1B383
CK%SQRT:
        :: DUP %0< NOTcase %SQRT                 * 1B3F5  slot 8
          Re>C% C%SQRT ;                         * 1B40E
        CON(2)  #C4                              * 1B41D  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 050 SQ
* refs (9): 189EA 2893B 54FA9 575B1 57AB1 5BE29 ...
        CON(1)  0                                * 1B41F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B420  library
        CON(3)  #050                             * 1B423  command
xSQ:
        :: CK1&Dispatch                          * 1B426
          BINT1 %SQ                              * 1B430  real
          BINT2 C%C*C                            * 1B43A  complex
          BINT4 MATSQ                            * 1B444  array
          BINT10 SYMSQ                           * 1B44E  name|local|algebraic
          BINT14 UMSQ                            * 1B458  unit
        ;                                        * 1B462

* slots of 002 050 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DSQ                            * 1B467  slot 0
        CON(5)  OBJ_57589                        * 1B46C  slot 1
        CON(5)  nINTGSQ                          * 1B471  slot 2
        CON(5)  0                                * 1B476  slot 3: none

* % -> %'
* refs (1): 1B435
%SQ:
        :: DUP %* ;                              * 1B47B  slot 4

* C% -> C%^2
* refs (1): 1B43F
C%C*C:
        :: DUP C%C*C_51D88 ;                     * 1B48F  slot 5
        CON(2)  #CC                              * 1B4A3  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 051 SIN
* refs (27): 189EA 2826E 54FC2 5751B 5BDBB 5BE38 ...
        CON(1)  0                                * 1B4A5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B4A6  library
        CON(3)  #051                             * 1B4A9  command
xSIN:
        :: CK1&Dispatch                          * 1B4AC
          BINT1 %SIN                             * 1B4B6  real
          BINT2 C%SIN                            * 1B4C0  complex
          BINT10 SYMSIN                          * 1B4CA  name|local|algebraic
          BINT14 UMSIN                           * 1B4D4  unit
        ;                                        * 1B4DE

* slots of 002 051 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DSIN                           * 1B4E3  slot 0
        CON(5)  OBJ_574CF                        * 1B4E8  slot 1
        CON(5)  MANMENUTRG                       * 1B4ED  slot 2
        CON(5)  nINTGSIN                         * 1B4F2  slot 3
        CON(5)  0                                * 1B4F7  slot 4: none
        CON(2)  #CC                              * 1B4FC  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 052 COS
* refs (23): 189EA 2825A 54FDB 5752F 5BDC0 5BE3D ...
        CON(1)  0                                * 1B4FE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B4FF  library
        CON(3)  #052                             * 1B502  command
xCOS:
        :: CK1&Dispatch                          * 1B505
          BINT1 %COS                             * 1B50F  real
          BINT2 C%COS                            * 1B519  complex
          BINT10 SYMCOS                          * 1B523  name|local|algebraic
          BINT14 UMCOS                           * 1B52D  unit
        ;                                        * 1B537

* slots of 002 052 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DCOS                           * 1B53C  slot 0
        CON(5)  OBJ_574DA                        * 1B541  slot 1
        CON(5)  MANMENUTRG                       * 1B546  slot 2
        CON(5)  nINTGCOS                         * 1B54B  slot 3
        CON(5)  0                                * 1B550  slot 4: none
        CON(2)  #CC                              * 1B555  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 053 TAN
* refs (17): 189EA 54FF4 57543 5BDC5 5BE42 82541 ...
        CON(1)  0                                * 1B557  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B558  library
        CON(3)  #053                             * 1B55B  command
xTAN:
        :: CK1&Dispatch                          * 1B55E
          BINT1 %TAN                             * 1B568  real
          BINT2 C%TAN                            * 1B572  complex
          BINT10 SYMTAN                          * 1B57C  name|local|algebraic
          BINT14 UMTAN                           * 1B586  unit
        ;                                        * 1B590

* slots of 002 053 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DTAN                           * 1B595  slot 0
        CON(5)  OBJ_574E5                        * 1B59A  slot 1
        CON(5)  MANMENUTRG                       * 1B59F  slot 2
        CON(5)  nINTGTAN                         * 1B5A4  slot 3
        CON(5)  0                                * 1B5A9  slot 4: none
        CON(2)  #CC                              * 1B5AE  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 054 SINH
* refs (19): 189EA 5500D 57557 5BDCA 5BE47 82B29 ...
        CON(1)  0                                * 1B5B0  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B5B1  library
        CON(3)  #054                             * 1B5B4  command
xSINH:
        :: CK1&Dispatch                          * 1B5B7
          BINT1 %SINH                            * 1B5C1  real
          BINT2 C%SINH                           * 1B5CB  complex
          BINT10 SYMSINH                         * 1B5D5  name|local|algebraic
        ;                                        * 1B5DF

* slots of 002 054 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DSINH                          * 1B5E4  slot 0
        CON(5)  OBJ_574F0                        * 1B5E9  slot 1
        CON(5)  MANMENUTRG                       * 1B5EE  slot 2
        CON(5)  nINTGSINH                        * 1B5F3  slot 3
        CON(5)  0                                * 1B5F8  slot 4: none
        CON(2)  #CC                              * 1B5FD  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 055 COSH
* refs (20): 189EA 55026 5756B 5BDCF 5BE4C 82B51 ...
        CON(1)  0                                * 1B5FF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B600  library
        CON(3)  #055                             * 1B603  command
xCOSH:
        :: CK1&Dispatch                          * 1B606
          BINT1 %COSH                            * 1B610  real
          BINT2 C%COSH                           * 1B61A  complex
          BINT10 SYMCOSH                         * 1B624  name|local|algebraic
        ;                                        * 1B62E

* slots of 002 055 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DCOSH                          * 1B633  slot 0
        CON(5)  OBJ_574FB                        * 1B638  slot 1
        CON(5)  MANMENUTRG                       * 1B63D  slot 2
        CON(5)  nINTGCOSH                        * 1B642  slot 3
        CON(5)  0                                * 1B647  slot 4: none
        CON(2)  #CC                              * 1B64C  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 056 TANH
* refs (14): 189EA 5503F 5757F 5BDD4 5BE51 82B83 ...
        CON(1)  0                                * 1B64E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B64F  library
        CON(3)  #056                             * 1B652  command
xTANH:
        :: CK1&Dispatch                          * 1B655
          BINT1 %TANH                            * 1B65F  real
          BINT2 C%TANH                           * 1B669  complex
          BINT10 SYMTANH                         * 1B673  name|local|algebraic
        ;                                        * 1B67D

* slots of 002 056 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DTANH                          * 1B682  slot 0
        CON(5)  OBJ_57506                        * 1B687  slot 1
        CON(5)  MANMENUTRG                       * 1B68C  slot 2
        CON(5)  nINTGTANH                        * 1B691  slot 3
        CON(5)  0                                * 1B696  slot 4: none
        CON(2)  #CC                              * 1B69B  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 057 ASIN
* refs (8): 189EA 55058 5536E 5BDD9 8293F 8296C ...
        CON(1)  0                                * 1B69D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B69E  library
        CON(3)  #057                             * 1B6A1  command
xASIN:
        :: CK1&Dispatch                          * 1B6A4
          BINT1 CK%ASIN                          * 1B6AE  real
          BINT2 C%ASIN                           * 1B6B8  complex
          BINT10 SYMASIN                         * 1B6C2  name|local|algebraic
        ;                                        * 1B6CC

* slots of 002 057 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DASIN                          * 1B6D1  slot 0
        CON(5)  OBJ_57511                        * 1B6D6  slot 1
        CON(5)  MANMENUATG                       * 1B6DB  slot 2
        CON(5)  nINTGASIN                        * 1B6E0  slot 3
        CON(5)  0                                * 1B6E5  slot 4: none

* % -> ASIN%
* refs (1): 1B6B3
CK%ASIN:
        ::                                       * 1B6EA  slot 5

* refs (2): 1B77A 1B8E3
dup;|r|ó1?:dq/sk:
          :: DUP %ABS %1 %> COLANOTcase ; %ASIN Re>C% C%ASIN ; * 1B6EF
        CON(2)  #CC                              * 1B726  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 058 ACOS
* refs (7): 189EA 55071 5539B 5BDDE 829DF 82A0C ...
        CON(1)  0                                * 1B728  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B729  library
        CON(3)  #058                             * 1B72C  command
xACOS:
        :: CK1&Dispatch                          * 1B72F
          BINT1 CK%ACOS                          * 1B739  real
          BINT2 C%ACOS                           * 1B743  complex
          BINT10 SYMACOS                         * 1B74D  name|local|algebraic
        ;                                        * 1B757

* slots of 002 058 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DACOS                          * 1B75C  slot 0
        CON(5)  OBJ_57525                        * 1B761  slot 1
        CON(5)  MANMENUATG                       * 1B766  slot 2
        CON(5)  nINTGACOS                        * 1B76B  slot 3
        CON(5)  0                                * 1B770  slot 4: none

* % -> ACOS%
* refs (1): 1B73E
CK%ACOS:
        :: dup;|r|ó1?:dq/sk %ACOS Re>C% C%ACOS ; * 1B775  slot 5
        CON(2)  #CC                              * 1B793  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 059 ATAN
* refs (8): 189EA 5508A 553C8 5BDE3 82A7F 82AAC ...
        CON(1)  0                                * 1B795  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B796  library
        CON(3)  #059                             * 1B799  command
xATAN:
        :: CK1&Dispatch                          * 1B79C
          BINT1 %ATAN                            * 1B7A6  real
          BINT2 C%ATAN                           * 1B7B0  complex
          BINT10 SYMATAN                         * 1B7BA  name|local|algebraic
        ;                                        * 1B7C4

* slots of 002 059 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DATAN                          * 1B7C9  slot 0
        CON(5)  OBJ_57539                        * 1B7CE  slot 1
        CON(5)  MANMENUATG                       * 1B7D3  slot 2
        CON(5)  nINTGATAN                        * 1B7D8  slot 3
        CON(5)  0                                * 1B7DD  slot 4: none
        CON(2)  #C8                              * 1B7E2  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 05A ASINH
* refs (6): 189EA 550A3 552A6 5BDE8 8354D 86F0B
        CON(1)  0                                * 1B7E4  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B7E5  library
        CON(3)  #05A                             * 1B7E8  command
xASINH:
        :: CK1&Dispatch                          * 1B7EB
          BINT1 %ASINH                           * 1B7F5  real
          BINT2 C%ASINH                          * 1B7FF  complex
          BINT10 SYMASINH                        * 1B809  name|local|algebraic
        ;                                        * 1B813

* slots of 002 05A (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DASINH                         * 1B818  slot 0
        CON(5)  OBJ_5754D                        * 1B81D  slot 1
        CON(5)  MANMENUATG                       * 1B822  slot 2
        CON(2)  #C8                              * 1B827  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 05B ACOSH
* refs (6): 189EA 550BC 552BA 5BDED 83616 86F2E
        CON(1)  0                                * 1B829  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B82A  library
        CON(3)  #05B                             * 1B82D  command
xACOSH:
        :: CK1&Dispatch                          * 1B830
          BINT1 CK%ACOSH                         * 1B83A  real
          BINT2 C%ACOSH                          * 1B844  complex
          BINT10 SYMACOSH                        * 1B84E  name|local|algebraic
        ;                                        * 1B858

* slots of 002 05B (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DACOSH                         * 1B85D  slot 0
        CON(5)  OBJ_57561                        * 1B862  slot 1
        CON(5)  MANMENUATG                       * 1B867  slot 2

* % -> ACOSH%
* refs (1): 1B83F
CK%ACOSH:
        :: DUP %1 %< NOTcase %ACOSH              * 1B86C  slot 3
          Re>C% C%ACOSH ;                        * 1B88A
        CON(2)  #C8                              * 1B899  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 05C ATANH
* refs (6): 189EA 550D5 552CE 5BDF2 833D6 86F56
        CON(1)  0                                * 1B89B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B89C  library
        CON(3)  #05C                             * 1B89F  command
xATANH:
        :: CK1&Dispatch                          * 1B8A2
          BINT1 CK%ATANH                         * 1B8AC  real
          BINT2 C%ATANH                          * 1B8B6  complex
          BINT10 SYMATANH                        * 1B8C0  name|local|algebraic
        ;                                        * 1B8CA

* slots of 002 05C (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DATANH                         * 1B8CF  slot 0
        CON(5)  OBJ_57575                        * 1B8D4  slot 1
        CON(5)  MANMENUATG                       * 1B8D9  slot 2

* % -> ATANH%
* refs (1): 1B8B1
CK%ATANH:
        :: dup;|r|ó1?:dq/sk %ATANH Re>C% C%ATANH ; * 1B8DE  slot 3
        CON(2)  #CC                              * 1B8FC  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 05D EXP
* refs (14): 189EA 48C74 550EE 574C5 5BB90 5BBB8 ...
        CON(1)  0                                * 1B8FE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B8FF  library
        CON(3)  #05D                             * 1B902  command
xEXP:
        :: CK1&Dispatch                          * 1B905
          BINT1 %EXP                             * 1B90F  real
          BINT2 C%EXP                            * 1B919  complex
          BINT10 SYMEXP                          * 1B923  name|local|algebraic
        ;                                        * 1B92D

* slots of 002 05D (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DEXP                           * 1B932  slot 0
        CON(5)  OBJ_574B0                        * 1B937  slot 1
        CON(5)  MANMENUEXP                       * 1B93C  slot 2
        CON(5)  OBJ_5BB6D                        * 1B941  slot 3
        CON(2)  #CC                              * 1B946  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 05E LN
* refs (32): 189EA 48C29 55107 552E2 5B9D8 5BACD ...
        CON(1)  0                                * 1B948  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B949  library
        CON(3)  #05E                             * 1B94C  command
xLN:
        :: CK1&Dispatch                          * 1B94F
          BINT1 CK%LN                            * 1B959  real
          BINT2 C%LN                             * 1B963  complex
          BINT10 SYMLN                           * 1B96D  name|local|algebraic
        ;                                        * 1B977

* slots of 002 05E (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DLN                            * 1B97C  slot 0
        CON(5)  OBJ_574BB                        * 1B981  slot 1
        CON(5)  MANMENULN                        * 1B986  slot 2
        CON(5)  nINTGLN                          * 1B98B  slot 3
        CON(5)  0                                * 1B990  slot 4: none

* % -> LN%
* refs (1): 1B95E
CK%LN:
        :: DUP %0< NOTcase %LN                   * 1B995  slot 5
          Re>C% C%LN ;                           * 1B9AE
        CON(2)  #CC                              * 1B9BD  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 05F LOG
* refs (6): 189EA 55120 552F6 5F812 83145 86F79
        CON(1)  0                                * 1B9BF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1B9C0  library
        CON(3)  #05F                             * 1B9C3  command
xLOG:
        :: CK1&Dispatch                          * 1B9C6
          BINT1 CK%LOG                           * 1B9D0  real
          BINT2 C%LOG                            * 1B9DA  complex
          BINT10 SYMLOG                          * 1B9E4  name|local|algebraic
        ;                                        * 1B9EE

* slots of 002 05F (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DLOG                           * 1B9F3  slot 0
        CON(5)  OBJ_575BB                        * 1B9F8  slot 1
        CON(5)  MANMENULN                        * 1B9FD  slot 2
        CON(5)  nINTGLOG                         * 1BA02  slot 3
        CON(5)  0                                * 1BA07  slot 4: none

* % -> LOG%
* refs (1): 1B9D5
CK%LOG:
        :: DUP %0< NOTcase %LOG                  * 1BA0C  slot 5
          Re>C% C%LOG ;                          * 1BA25
        CON(2)  #CC                              * 1BA34  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 060 ALOG
* refs (7): 189EA 55139 575C5 5F808 83031 8306E ...
        CON(1)  0                                * 1BA36  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BA37  library
        CON(3)  #060                             * 1BA3A  command
xALOG:
        :: CK1&Dispatch                          * 1BA3D
          BINT1 %ALOG                            * 1BA47  real
          BINT2 C%ALOG                           * 1BA51  complex
          BINT10 SYMALOG                         * 1BA5B  name|local|algebraic
        ;                                        * 1BA65

* slots of 002 060 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DALOG                          * 1BA6A  slot 0
        CON(5)  OBJ_575E3                        * 1BA6F  slot 1
        CON(5)  MANMENUEXP                       * 1BA74  slot 2
        CON(5)  nINTGALOG                        * 1BA79  slot 3
        CON(5)  0                                * 1BA7E  slot 4: none
        CON(2)  #C0                              * 1BA83  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 061 LNP1
* refs (4): 189EA 55152 5530A 86FBF
        CON(1)  0                                * 1BA85  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BA86  library
        CON(3)  #061                             * 1BA89  command
xLNP1:
        :: CK1&Dispatch                          * 1BA8C
          BINT1 %LNP1                            * 1BA96  real
          BINT10 SYMLNP1                         * 1BAA0  name|local|algebraic
        ;                                        * 1BAAA

* slots of 002 061 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DLNP1                          * 1BAAF  slot 0
        CON(5)  OBJ_575CF                        * 1BAB4  slot 1
        CON(2)  #C4                              * 1BAB9  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 062 EXPM
* refs (4): 189EA 5516B 575D9 82FB4
        CON(1)  0                                * 1BABB  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BABC  library
        CON(3)  #062                             * 1BABF  command
xEXPM:
        :: CK1&Dispatch                          * 1BAC2
          BINT1 %EXPM1                           * 1BACC  real
          BINT10 SYMEXPM                         * 1BAD6  name|local|algebraic
        ;                                        * 1BAE0

* slots of 002 062 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  D/DEXP                           * 1BAE5  slot 0
        CON(5)  OBJ_57602                        * 1BAEA  slot 1
        CON(5)  nINTGEXPM                        * 1BAEF  slot 2
        CON(5)  0                                * 1BAF4  slot 3: none
        CON(2)  #00                              * 1BAF9  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 063 !
* refs (2): 189EA 55184
        CON(1)  5                                * 1BAFB  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BAFC  library
        CON(3)  #063                             * 1BAFF  command
xFACT:
        :: CK1&Dispatch                          * 1BB02
          BINT1 %FACT                            * 1BB0C  real
          BINT10 SYMFACT                         * 1BB16  name|local|algebraic
        ;                                        * 1BB20

* slots of 002 063 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6CCBD                        * 1BB25  slot 0

#010Ah:
        HXS A010                                 * 1BB2A  slot 1
        CON(2)  #00                              * 1BB38  end of the slots: property byte (meaning not yet known)

* ROMPTR 002 064 FACT
* refs (1): 189EA
        CON(1)  0                                * 1BB3A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BB3B  library
        CON(3)  #064                             * 1BB3E  command
preFACT:
        :: CK1&Dispatch                          * 1BB41
          BINT1 %FACT                            * 1BB4B  real
          BINT10 SYMFACT                         * 1BB55  name|local|algebraic
        ;                                        * 1BB5F

* slots of 002 064 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BB64  end of the slots: property byte (meaning not yet known)

* x -> n
* ROMPTR 002 065 IP
* refs (6): 189EA 5519D 8AE14 8AF47 8AFF0 8B0A9
        CON(1)  0                                * 1BB66  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BB67  library
        CON(3)  #065                             * 1BB6A  command
xIP:
        :: CK1&Dispatch                          * 1BB6D
          BINT1 %IP                              * 1BB77  real
          BINT10 SYMIP                           * 1BB81  name|local|algebraic
          BINT14 UMIP                            * 1BB8B  unit
        ;                                        * 1BB95

* slots of 002 065 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BB9A  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 066 FP
* refs (4): 189EA 551B6 8AE5D 8B0F2
        CON(1)  0                                * 1BB9C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BB9D  library
        CON(3)  #066                             * 1BBA0  command
xFP:
        :: CK1&Dispatch                          * 1BBA3
          BINT1 %FP                              * 1BBAD  real
          BINT10 SYMFP                           * 1BBB7  name|local|algebraic
          BINT14 UMFP                            * 1BBC1  unit
        ;                                        * 1BBCB

* slots of 002 066 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BBD0  end of the slots: property byte (meaning not yet known)

* x -> n
* ROMPTR 002 067 FLOOR
* refs (3): 189EA 551CF D2F77
        CON(1)  0                                * 1BBD2  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BBD3  library
        CON(3)  #067                             * 1BBD6  command
xFLOOR:
        :: CK1&Dispatch                          * 1BBD9
          BINT1 %FLOOR                           * 1BBE3  real
          BINT10 SYMFLOOR                        * 1BBED  name|local|algebraic
          BINT14 UMFLOOR                         * 1BBF7  unit
        ;                                        * 1BC01

* slots of 002 067 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BC06  end of the slots: property byte (meaning not yet known)

* x -> n
* ROMPTR 002 068 CEIL
* refs (3): 189EA 551E8 D2F8F
        CON(1)  0                                * 1BC08  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BC09  library
        CON(3)  #068                             * 1BC0C  command
xCEIL:
        :: CK1&Dispatch                          * 1BC0F
          BINT1 %CEIL                            * 1BC19  real
          BINT10 SYMCEIL                         * 1BC23  name|local|algebraic
          BINT14 UMCEIL                          * 1BC2D  unit
        ;                                        * 1BC37

* slots of 002 068 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BC3C  end of the slots: property byte (meaning not yet known)

* % -> n symb -> XPON(symb)
* ROMPTR 002 069 XPON
* refs (2): 189EA 55201
        CON(1)  0                                * 1BC3E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BC3F  library
        CON(3)  #069                             * 1BC42  command
xXPON:
        :: CK1&Dispatch                          * 1BC45
          BINT1 %EXPONENT                        * 1BC4F  real
          BINT10 SYMEXPONENT                     * 1BC59  name|local|algebraic
        ;                                        * 1BC63

* slots of 002 069 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BC68  end of the slots: property byte (meaning not yet known)

* x y -> x'
* ROMPTR 002 06A MAX
* refs (4): 189EA 55E59 55E72 55E8B
        CON(1)  0                                * 1BC6A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BC6B  library
        CON(3)  #06A                             * 1BC6E  command
xMAX:
        :: CK2&Dispatch                          * 1BC71
          BINT17 %MAX                            * 1BC7B  real real
          BINT26 %SYMMAX                         * 1BC85  real name|local|algebraic
          SYMREAL SYM%MAX                        * 1BC8F  name|local|algebraic real
          SYMSYM SYMMAX                          * 1BC99  name|local|algebraic name|local|algebraic
          BINT30 UMMAX                           * 1BCA3  real unit
          EXTREAL UMMAX                          * 1BCAD  unit real
          2EXT UMMAX                             * 1BCB7  unit unit
          EXTSYM %SYMMAX                         * 1BCC1  unit name|local|algebraic
          SYMEXT SYM%MAX                         * 1BCCB  name|local|algebraic unit
        ;                                        * 1BCD5

* slots of 002 06A (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BCDA  end of the slots: property byte (meaning not yet known)

* x y -> x'
* ROMPTR 002 06B MIN
* refs (4): 189EA 55EA4 55EBD 55ED6
        CON(1)  0                                * 1BCDC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BCDD  library
        CON(3)  #06B                             * 1BCE0  command
xMIN:
        :: CK2&Dispatch                          * 1BCE3
          BINT17 %MIN                            * 1BCED  real real
          BINT26 %SYMMIN                         * 1BCF7  real name|local|algebraic
          SYMREAL SYM%MIN                        * 1BD01  name|local|algebraic real
          SYMSYM SYMMIN                          * 1BD0B  name|local|algebraic name|local|algebraic
          BINT30 UMMIN                           * 1BD15  real unit
          EXTREAL UMMIN                          * 1BD1F  unit real
          2EXT UMMIN                             * 1BD29  unit unit
          EXTSYM %SYMMIN                         * 1BD33  unit name|local|algebraic
          SYMEXT SYM%MIN                         * 1BD3D  name|local|algebraic unit
        ;                                        * 1BD47

* slots of 002 06B (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BD4C  end of the slots: property byte (meaning not yet known)

* x n -> x'
* ROMPTR 002 06C RND
* refs (4): 189EA 55DC3 55DDC 55DF5
        CON(1)  0                                * 1BD4E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BD4F  library
        CON(3)  #06C                             * 1BD52  command
xRND:
        :: CK2&Dispatch                          * 1BD55
          BINT17 RNDXY                           * 1BD5F  real real
          BINT26 SYMRND                          * 1BD69  real name|local|algebraic
          BINT33 trunc(c,r)                      * 1BD73  complex real
          BINT42 SYMRND                          * 1BD7D  complex name|local|algebraic
          BINT65 MATRND                          * 1BD87  array real
          SYMREAL SYM%RND                        * 1BD91  name|local|algebraic real
          SYMSYM RNDSYM                          * 1BD9B  name|local|algebraic name|local|algebraic
          EXTREAL UMRND                          * 1BDA5  unit real
          EXTSYM SYMRND                          * 1BDAF  unit name|local|algebraic
        ;                                        * 1BDB9

* slots of 002 06C (derivative, inverse, ...: used by the symbolic code)
        CON(5)  NOP                              * 1BDBE  slot 0
        CON(5)  NOP                              * 1BDC3  slot 1
        CON(2)  #00                              * 1BDC8  end of the slots: property byte (meaning not yet known)

* x n ->
* ROMPTR 002 06D TRNC
* refs (4): 189EA 55E0E 55E27 55E40
        CON(1)  0                                * 1BDCA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BDCB  library
        CON(3)  #06D                             * 1BDCE  command
xTRNC:
        :: CK2&Dispatch                          * 1BDD1
          BINT17 TRCXY                           * 1BDDB  real real
          BINT26 TRCNYM                          * 1BDE5  real name|local|algebraic
          BINT33 conj(ar)                        * 1BDEF  complex real
          BINT42 TRCNYM                          * 1BDF9  complex name|local|algebraic
          BINT65 MATTRNC                         * 1BE03  array real
          SYMREAL SYM%TRNC                       * 1BE0D  name|local|algebraic real
          SYMSYM SYMTRCN                         * 1BE17  name|local|algebraic name|local|algebraic
          EXTREAL UMTRC                          * 1BE21  unit real
          EXTSYM TRCNYM                          * 1BE2B  unit name|local|algebraic
        ;                                        * 1BE35

* slots of 002 06D (derivative, inverse, ...: used by the symbolic code)
        CON(5)  NOP                              * 1BE3A  slot 0
        CON(5)  NOP                              * 1BE3F  slot 1
        CON(2)  #00                              * 1BE44  end of the slots: property byte (meaning not yet known)

* x y -> x'
* ROMPTR 002 06E MOD
* refs (5): 189EA 56066 5607F 56098 D388A
        CON(1)  1                                * 1BE46  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BE47  library
        CON(3)  #06E                             * 1BE4A  command
xMOD:
        :: CK2&Dispatch                          * 1BE4D
          BINT17 %MOD                            * 1BE57  real real
          BINT26 %SYMMOD                         * 1BE61  real name|local|algebraic
          SYMREAL SYM%MOD                        * 1BE6B  name|local|algebraic real
          SYMSYM SYMMOD                          * 1BE75  name|local|algebraic name|local|algebraic
        ;                                        * 1BE7F

* slots of 002 06E (derivative, inverse, ...: used by the symbolic code)
#80108h_1BE84:
        HXS 80108                                * 1BE84  slot 0
        CON(2)  #00                              * 1BE93  end of the slots: property byte (meaning not yet known)

* x -> x'
* ROMPTR 002 06F MANT
* refs (2): 189EA 5521A
        CON(1)  0                                * 1BE95  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BE96  library
        CON(3)  #06F                             * 1BE99  command
xMANT:
        :: CK1&Dispatch                          * 1BE9C
          BINT1 %MANTISSA                        * 1BEA6  real
          BINT10 SYMMANT                         * 1BEB0  name|local|algebraic
        ;                                        * 1BEBA

* slots of 002 06F (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BEBF  end of the slots: property byte (meaning not yet known)

* x -> (pi/180)x
* ROMPTR 002 070 D→R
* refs (2): 189EA 55233
        CON(1)  0                                * 1BEC1  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BEC2  library
        CON(3)  #070                             * 1BEC5  command
xD>R:
        :: CK1&Dispatch                          * 1BEC8
          BINT1 %D>R                             * 1BED2  real
          BINT10 SYMD>R                          * 1BEDC  name|local|algebraic
        ;                                        * 1BEE6

* slots of 002 070 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1BEEB  end of the slots: property byte (meaning not yet known)

* x -> (180/pi)x
* ROMPTR 002 071 R→D
* refs (2): 189EA 5524C
        CON(1)  0                                * 1BEED  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BEEE  library
        CON(3)  #071                             * 1BEF1  command
xR>D:
        :: CK1&Dispatch                          * 1BEF4
          BINT1 %R>D                             * 1BEFE  real
          BINT10 SYMR>D                          * 1BF08  name|local|algebraic
        ;                                        * 1BF12

* x -> x'
* ROMPTR 002 072 →HMS
* refs (1): 189EA
        CON(1)  8                                * 1BF17  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BF18  library
        CON(3)  #072                             * 1BF1B  command
x>HMS:
        :: CK1&Dispatch                          * 1BF1E
          BINT1 %>HMS                            * 1BF28  real
        ;                                        * 1BF32

* x -> x'
* ROMPTR 002 073 HMS→
* refs (1): 189EA
        CON(1)  8                                * 1BF37  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BF38  library
        CON(3)  #073                             * 1BF3B  command
xHMS>:
        :: CK1&Dispatch                          * 1BF3E
          BINT1 %HMS>                            * 1BF48  real
        ;                                        * 1BF52

* hms1 hms2 -> hms3
* ROMPTR 002 074 HMS+
* refs (1): 189EA
        CON(1)  8                                * 1BF57  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BF58  library
        CON(3)  #074                             * 1BF5B  command
xHMS+:
        :: CK2&Dispatch                          * 1BF5E
          BINT17 %HMS+                           * 1BF68  real real
        ;                                        * 1BF72

* hms1 hms2 -> hms3
* ROMPTR 002 075 HMS-
* refs (1): 189EA
        CON(1)  8                                * 1BF77  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BF78  library
        CON(3)  #075                             * 1BF7B  command
xHMS-:
        :: CK2&Dispatch                          * 1BF7E
          BINT17 %HMS-                           * 1BF88  real real
        ;                                        * 1BF92

* [] -> x
* ROMPTR 002 076 RNRM
* refs (1): 189EA
        CON(1)  8                                * 1BF97  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BF98  library
        CON(3)  #076                             * 1BF9B  command
xRNRM:
        :: CK1&Dispatch                          * 1BF9E
          BINT4 MATRNRM                          * 1BFA8  array
        ;                                        * 1BFB2

* [] -> col_norm
* ROMPTR 002 077 CNRM
* refs (1): 189EA
        CON(1)  8                                * 1BFB7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BFB8  library
        CON(3)  #077                             * 1BFBB  command
xCNRM:
        :: CK1&Dispatch                          * 1BFBE
          BINT4 MATCNRM                          * 1BFC8  array
        ;                                        * 1BFD2

* [[]] -> x
* ROMPTR 002 078 DET
* refs (1): 189EA
        CON(1)  8                                * 1BFD7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BFD8  library
        CON(3)  #078                             * 1BFDB  command
xDET:
        :: CK1&Dispatch                          * 1BFDE
          BINT4 MATDET                           * 1BFE8  array
        ;                                        * 1BFF2

* [1] [2] -> x
* ROMPTR 002 079 DOT
* refs (1): 189EA
        CON(1)  8                                * 1BFF7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1BFF8  library
        CON(3)  #079                             * 1BFFB  command
xDOT:
        :: CK2&Dispatch                          * 1BFFE
          BINT68 MATDOT                          * 1C008  array array
        ;                                        * 1C012
