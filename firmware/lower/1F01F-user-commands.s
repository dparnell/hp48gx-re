* HP 48GX ROM revision R, #1F01F-#22004: User commands
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: xFCNAPPLY xWHERE 'REvalSto XEQRCL xPURGE xSTEQ xDUP xDROP ChkExpr1Name xLINFIT xSWAP ä
* Follows on from the previous file (at #1F01F in the original ROM).
        CON(5)  D/DDER                           * 1F01F  address
        RPL

        ROMPTR 0F0 092                           * 1F024

        ROMPTR 0F0 019                           * 1F02F

        CON(5)  nWHEREDER                        * 1F03A  address (the code jumps or points through it)

        CON(5)  OBJ_5A1F8                        * 1F03F  address (the code jumps or points through it)
        BSS     3                                * 1F044  zeros

* ob ob' -> %0
* refs (6): 1EFA1 1EFAB 1EFB5 1F122 4F4F8 4F50C
2DROP%0:
        :: 2DROP %0_2A2B4 ;                      * 1F047

* refs (11): 1F0FF 1F11D 1F27F 1F4B1 1F61E 5696C ...
ChkExpr1Name:
        CON(5)  (*)+5                            * 1F05B  primitive code object
        ASSEMBLE
        LC(5)   DOSYMB                           * 1F060
        A=C     A                                * 1F067
        C=DAT1  A                                * 1F069
        CD0EX                                    * 1F06C
        RSTK=C                                   * 1F06F
        C=DAT0  A                                * 1F071
        ?C#A    A                                * 1F074
        GOYES   L_1F0C9                          * 1F077
        D0=D0+  5                                * 1F079
        CD0EX                                    * 1F07C
        RSTK=C                                   * 1F07F
        D0=C                                     * 1F081
        GOSBVL  SKIPOB                           * 1F084
        A=DAT0  A                                * 1F08B
        C=RSTK                                   * 1F08E
        D0=C                                     * 1F090
        LC(5)   SEMI                             * 1F093
        ?C#A    A                                * 1F09A
        GOYES   L_1F0C9                          * 1F09D
        A=DAT0  A                                * 1F09F
        LC(5)   DOIDNT                           * 1F0A2
        ?C=A    A                                * 1F0A9
        GOYES   L_1F0BA                          * 1F0AC
        LC(5)   DOLAM                            * 1F0AE
        ?C#A    A                                * 1F0B5
        GOYES   L_1F0DB                          * 1F0B8
L_1F0BA:
        C=RSTK                                   * 1F0BA
        D0=C                                     * 1F0BC
        A=DAT0  A                                * 1F0BF
        D0=D0+  5                                * 1F0C2
        PC=(A)                                   * 1F0C5
L_1F0C9:
        C=RSTK                                   * 1F0C9
        D0=C                                     * 1F0CB
        LC(5)   SETTYPEERR                       * 1F0CE
        A=C     A                                * 1F0D5
        PC=(A)                                   * 1F0D7
L_1F0DB:
        AD0EX                                    * 1F0DB
        A=DAT0  A                                * 1F0DE
        ?C=A    A                                * 1F0E1
        GOYES   L_1F0BA                          * 1F0E4
        LC(5)   DOIDNT                           * 1F0E6
        ?C=A    A                                * 1F0ED
        GOYES   L_1F0BA                          * 1F0F0
        GONC    L_1F0C9                          * 1F0F2
        RPL

* QN sym -> symf
* refs (1): 1EFE1
XEQSYMDERSTEP:
        :: SWAP ChkExpr1Name SWAPCOLA SYMDERSTEP ; * 1F0F5

* QN %/C%/u -> symf
* refs (3): 1EFEB 1EFF5 1EFFF
XEQSYMDERCON:
        :: SWAP ChkExpr1Name 2DROP%0 ;           * 1F113

* -> EQ
* ROMPTR 002 0F9 RCEQ
* refs (2): 189EA C5376
        CON(1)  8                                * 1F12C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F12D  library
        CON(3)  #0F9                             * 1F130  command
xRCEQ:
        :: CK0 DORCLE ;                          * 1F133

* ob ->
* ROMPTR 002 0FA STEQ
* refs (14): 189EA C5371 D3054 D3135 D3288 D33FC ...
        CON(1)  8                                * 1F147  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F148  library
        CON(3)  #0FA                             * 1F14B  command
xSTEQ:
        :: CK1 STRIPTAGS DOSTOE ;                * 1F14E

* prog/s var guess -> x prog/s var {guesses} -> x
* ROMPTR 002 0FB ROOT
* refs (2): 189EA 3C279
        CON(1)  8                                * 1F167  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F168  library
        CON(3)  #0FB                             * 1F16B  command
xROOT:
        :: CK3&Dispatch                          * 1F16E
          SYMIDREAL root                         * 1F178  name|local|algebraic name real
          SYMIDCMP root                          * 1F182  name|local|algebraic name complex
          SYMIDLIST root                         * 1F18C  name|local|algebraic name list
          PROGIDREAL root                        * 1F196  program name real
          PROGIDCMP root                         * 1F1A0  program name complex
          PROGIDLIST root                        * 1F1AA  program name list
          SYMIDEXT root                          * 1F1B4  name|local|algebraic name unit
          PROGIDEXT root                         * 1F1BE  program name unit
        ;                                        * 1F1C8

* ROMPTR 002 0FC ∫
* refs (3): 189EA 49841 5A50E
        CON(1)  14                               * 1F1CD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F1CE  library
        CON(3)  #0FC                             * 1F1D1  command
INTEG:
        :: CK4&Dispatch                          * 1F1D4
          BINT6 XEQINTEGID                       * 1F1DE  name
          BINT7 XEQINTEGID                       * 1F1E8  local
        ;                                        * 1F1F2

* slots of 002 0FC (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_65A51                        * 1F1F7  slot 0
        CON(5)  xINTEGRAL                        * 1F1FC  slot 1

* ob ob ob id/lam -> symf
* refs (4): 1F1E3 1F1ED B6A4D B6A70
XEQINTEGID:
        :: symcomp COLA XEQINTEG                 * 1F201  slot 2
        ;                                        * 1F215
        CON(2)  #A7                              * 1F21A  end of the slots: property byte (meaning not yet known)

* ROMPTR 002 0FD
* refs (7): 189EA 1F1FC 5693F 5AC2C 85197 85D4A ...
        CON(1)  5                                * 1F21C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F21D  library
        CON(3)  #0FD                             * 1F220  command
xINTEGRAL:
        :: CK4&Dispatch                          * 1F223
          BINT9 XEQINTEG                         * 1F22D  algebraic
        ;                                        * 1F237
        CON(5)  OBJ_65A51                        * 1F23C  address

#053626060410h:
        HXS 014060626350                         * 1F241
        CON(5)  D/DINTEGRAL                      * 1F257  address

        ROMPTR 0F0 093                           * 1F25C

        CON(5)  OBJ_5B875                        * 1F267  address (the code jumps or points through it)

        CON(5)  nWHEREINTG                       * 1F26C  address (the code jumps or points through it)

        CON(5)  OBJ_5A211                        * 1F271  address (the code jumps or points through it)
        BSS     4                                * 1F276  zeros

* ob ob ob QN -> symf
* refs (2): 1F210 1F232
XEQINTEG:
        :: ChkExpr1Name BINT2 nmetasyms 2SWAP NOTNUM? NOTcase NUMINTEG * 1F27A
          BINT2 nmetasyms 2SWAP COLA SYMINTEG    * 1F2A2
        ;                                        * 1F2BB
        NIBHEX  3A                               * 1F2C0  £

* ROMPTR 002 0FE Σ
* refs (8): 189EA 569FC 56ABF 5AE66 6F04A 8528C ...
        CON(1)  5                                * 1F2C2  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F2C3  library
        CON(3)  #0FE                             * 1F2C6  command
ä:
        :: CK4&Dispatch                          * 1F2C9
          # A110 %%SUM                           * 1F2D3  name|local|algebraic real real any
          # AA10 SYM%SUM                         * 1F2E2  name|local|algebraic name|local|algebraic real any
          # A1A0 %SYMSUM                         * 1F2F1  name|local|algebraic real name|local|algebraic any
          # AAA0 SYMSUM                          * 1F300  name|local|algebraic name|local|algebraic name|local|algebraic any
        ;                                        * 1F30F
        CON(5)  OBJ_65EF4                        * 1F314  address

#052606073410h:
        HXS 014370606250                         * 1F319
        CON(5)  D/DSUM                           * 1F32F  address

        ROMPTR 0F0 094                           * 1F334

        CON(5)  nWHERESUM                        * 1F33F  address (the code jumps or points through it)

        CON(5)  OBJ_5A22A                        * 1F344  address (the code jumps or points through it)
        BSS     4                                * 1F349  zeros

* ROMPTR 002 0FF |
* refs (4): 189EA 5A531 B6AFC B6B24
        CON(1)  14                               * 1F34D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F34E  library
        CON(3)  #0FF                             * 1F351  command
WHERE:
        :: CK2&Dispatch                          * 1F354
          SYMLIST SYMWHERE                       * 1F35E  name|local|algebraic list
          BINT21 DROP                            * 1F368  real list
          BINT37 DROP                            * 1F372  complex list
        ;                                        * 1F37C

* slots of 002 0FF (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6DB0C                        * 1F381  slot 0
        CON(5)  xWHERE                           * 1F386  slot 1

* symf {} -> symf
* refs (1): 1F363
SYMWHERE:
        :: ZEROSWAP INNERDUP BINT2 #/ SWAP #0<> OVER#0= ORcase SETSIZEERR * 1F38B  slot 2
          ZERO_DO pullpsh1& B2(n)<='B1(1)' LOOP DROP #1+ COLA XEQSYMWHERE * 1F3BD
        ;                                        * 1F3E5
        CON(2)  #A3                              * 1F3EA  end of the slots: property byte (meaning not yet known)

* ROMPTR 002 100
* refs (21): 189EA 1F386 1F425 5473D 548E6 5A171 ...
        CON(1)  5                                * 1F3EC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F3ED  library
        CON(3)  #100                             * 1F3F0  command
xWHERE:
        :: CKINFARGS XEQSYMWHERE ;               * 1F3F3

* slots of 002 100 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6DB0C                        * 1F407  slot 0

#5B0734122h:
        HXS 2214370B50                           * 1F40C  slot 1
        CON(5)  D/DWHERE                         * 1F420  slot 2
        CON(5)  xWHERE                           * 1F425  slot 3
        CON(5)  nWHEREWHERE                      * 1F42A  slot 4
        CON(5)  OBJ_5A23E                        * 1F42F  slot 5
        CON(5)  0                                * 1F434  slot 6: none

* symf QN1 id1..QNn idn -> symf
* refs (3): 1F3E0 1F3FD 5A13F
XEQSYMWHERE:
        ::                                       * 1F439  slot 7

* checks pairs of quoted names
CKWHEREARGS:
          :: pullrev DUPUNROT BINT1 nmetasyms DROPSWAP symcomp pshm1 top& * 1F43E
            DUP BINT3 #<case SETSIZEERR          * 1F46B
            pshzer DUP#1- #2/ ZERO_DO #1-SWAP BINT1 nmetasyms psh1& #1-SWAP * 1F47F
            symcomp ChkExpr1Name psh1& LOOP #1=case * 1F4AC

->expr1;pushB[n]:
            :: symcomp psh1top& ;                * 1F4C5
            SETSIZEERR ;                         * 1F4D9
          COLA SYMBWHERE                         * 1F4E3
        ;                                        * 1F4ED
        CON(5)  0                                * 1F4F2  slot 8: none
        CON(2)  #21                              * 1F4F7  end of the slots: property byte (meaning not yet known)

* ob -> 'ob
* ROMPTR 002 101 QUOTE
* refs (2): 189EA 85E21
        CON(1)  1                                * 1F4F9  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F4FA  library
        CON(3)  #101                             * 1F4FD  command
xQUOTE:
        :: CK1&Dispatch                          * 1F500
          BINT9 quote(_)                         * 1F50A  algebraic
          BINT0 NOP                              * 1F514  any
        ;                                        * 1F51E

* slots of 002 101 (derivative, inverse, ...: used by the symbolic code)
#052410h:
        HXS 014250                               * 1F523  slot 0
        CON(5)  nCOLCTQUOTE                      * 1F533  slot 1
        CON(5)  OBJ_5A26B                        * 1F538  slot 2
        CON(5)  0                                * 1F53D  slot 3: none

* refs (1): 1F50F
quote(_):
        :: SINNER CKSYMBN ;                      * 1F542  slot 4

* ROMPTR 002 102
* refs (2): 189EA 5A554
        CON(1)  10                               * 1F556  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F557  library
        CON(3)  #102                             * 1F55A  command
APPLY:
        :: CK2&Dispatch                          * 1F55D
          BINT86 apply(li,nm)                    * 1F567  list name
          BINT87 apply(li,nm)                    * 1F571  list local
        ;                                        * 1F57B

* slots of 002 102 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  xAPPLY                           * 1F580  slot 0

* refs (2): 1F56C 1F576
apply(li,nm):
        :: symcomp SWAP INNERDUP #0<> ?SKIP SETSTACKERR * 1F585  slot 1
          #1+ COLA apply(_,s)                    * 1F5A8
        ;                                        * 1F5B7
        CON(2)  #81                              * 1F5BC  end of the slots: property byte (meaning not yet known)

* {symb1 .. symbn} f -> f(symb1...symbn)
* ROMPTR 002 103
* refs (4): 189EA 1F580 5A43C 6E384
        CON(1)  1                                * 1F5BE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F5BF  library
        CON(3)  #103                             * 1F5C2  command
xAPPLY:
        :: CKINFARGS apply(_,s) ;                * 1F5C5

* slots of 002 103 (derivative, inverse, ...: used by the symbolic code)
#059063410h:
        HXS 014360950                            * 1F5D9  slot 0
        CON(5)  D/DAPPLY                         * 1F5EC  slot 1
        CON(5)  OBJ_5A27F                        * 1F5F1  slot 2

* refs (2): 1F5B2 1F5CF
apply(_,s):
        :: uncrunch ~BINT3;RROLL DUP#1- dvarlsBIND pullrev symcomp SWAPDROP * 1F5F6  slot 3
          ChkExpr1Name CARCOMP GOTO L_1F6EF ;    * 1F61E
        CON(2)  #A2                              * 1F637  end of the slots: property byte (meaning not yet known)
        ASSEMBLE
        NOP3                                     * 1F639
        SETHEX                                   * 1F63C
        RTN                                      * 1F63E
        RPL

* ROMPTR 002 104
* refs (26): 189EA 1F73A 27A80 27C06 2850B 28B0F ...
xFCNAPPLY:
        :: {'dvar} BIND 0LASTOWDOB! CARCOMP CK1NOLASTWD DEPTH 1GETLAM * 1F640
          #>?SKIP SETSTACKERR DUP ROMPTR@NOT case OBJ_1F6E0 * 1F668
          CK&DISPATCH0                           * 1F686
          ROMPANY xFCNAPPLY~romptr,any           * 1F68B  romptr any
          BINT8 xFCNAPPLY~program                * 1F695  program
          BINT5 OBJ_1F776                        * 1F69F  list
          BINT4 xFCNAPPLY~array                  * 1F6A9  array
          BINT0 INVFUNCERR                       * 1F6B3  any
        ;                                        * 1F6BD

        CON(5)  OBJ_6D0D7                        * 1F6C2  address (the code jumps or points through it)

        CON(5)  OBJ_56D1F                        * 1F6C7  address (the code jumps or points through it)

        ROMPTR 0F0 097                           * 1F6CC
        NIBHEX  7DBD70000                        * 1F6D7  ×Û..

* refs (5): 1F681 1F7B7 1F811 85E71 85E7B
OBJ_1F6E0:
        :: DROP CK0NOLASTWD                      * 1F6E0
L_1F6EF:
          1GETLAM #1+ dup nmetasyms 1GETABND #1+ NDROP #1-SWAP symcomp OVER * 1F6EF
          BINT2 psh SINNERMETA pshtop& Cr xFCNAPPLY CK1NOLASTWD NOTNUM? * 1F721
          ?SKIP SETNONEXTERR                     * 1F749
        ;                                        * 1F753

* refs (1): 1F69A
xFCNAPPLY~program:
        :: SWAPDROP xFCNAPPLY~program~1 ABND COLA_EVAL ; * 1F758

* refs (2): 1F6A4 1F7D5
OBJ_1F776:
        :: 1GETLAM BINT1 #<>case ARGNUMERR       * 1F776
          NOTNUM? NOTcase OBJ_1F81B              * 1F78F
          3PICK REALcase OBJ_1F81B               * 1F79E
          DROPDUP COLA OBJ_1F6E0                 * 1F7AD
        ;                                        * 1F7BC

* refs (1): 1F6AE
xFCNAPPLY~array:
        :: 1GETLAM BINT2 #<>case OBJ_1F776       * 1F7C1
          NOTNUM? NOTcase OBJ_1F81B              * 1F7DA
          4PICK TYPEREAL? 4PICK TYPEREAL? ANDcase OBJ_1F81B * 1F7E9
          DROPDUP COLA OBJ_1F6E0                 * 1F807
        ;                                        * 1F816

* refs (4): 1F799 1F7A8 1F7E4 1F802
OBJ_1F81B:
        :: SWAPDROP 1GETLAM BINT2 #=ITE CK3NOLASTWD CK2NOLASTWD 1GETSWAP * 1F81B
          1PUTLAM {}N 1ABNDSWAP CK2NOLASTWD ' xGET EvalNoCK ; * 1F843

* refs (1): 1F690
xFCNAPPLY~romptr,any:
        ::                                       * 1F86B

* refs (1): 85E8A
OBJ_1F870:
          :: DROP ?OKINALG ?SKIP SETSIZEERR      * 1F870
            OBJ_26BED ?SKIP ARGNUMERR            * 1F889
            SWAPDROPDUP MINUSONE #= casedrop 1ABNDSWAP * 1F898
            1GETABND #=?SKIP ARGNUMERR ;         * 1F8B1
          COLA_EVAL ;                            * 1F8C5

* refs (1): 20D22
StoLT(_,ex):
        :: SINNER M1stFNCcase                    * 1F8CF
          :: SWAPDROP#1- #2- SWAPROT CARCOMP SWAP #>2case ARGNUMERR * 1F8DE
            pshm1 pshzer BEGIN larg CKSYMBN psh1& #0=UNTIL DROP {}N SWAPDROP * 1F906
            ROT CK3NOLASTWD ' xPUT EvalNoCK ;    * 1F938
          SETTYPEERR ;                           * 1F956

* refs (1): 1F600
~BINT3;RROLL:
        :: BINT3 RROLL ;                         * 1F960

        CON(5)  NOP                              * 1F974  address (the code jumps or points through it)

        CON(5)  NOP                              * 1F979  address (the code jumps or points through it)

* refs (1): 56B2D
Π'fcn:
        LAM 'fcn                                 * 1F97E
        BSS     2                                * 1F98D  zeros

* ROMPTR 002 105
* refs (7): 189EA 28011 28478 5AA4F 5F53F 5F58A ...
        CON(1)  0                                * 1F98F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F990  library
        CON(3)  #105                             * 1F993  command
~CK2&Dispatch:
        :: CK2&Dispatch                          * 1F996
        ;                                        * 1F9A0

* slots of 002 105 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1F9A5  end of the slots: property byte (meaning not yet known)

* ROMPTR 002 106
* refs (5): 189EA 28020 28464 2967E 5F54B
        CON(1)  0                                * 1F9A7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F9A8  library
        CON(3)  #106                             * 1F9AB  command
~CK2&Dispatch_2:
        :: CK2&Dispatch                          * 1F9AE
        ;                                        * 1F9B8
        ASSEMBLE
        HST=0   0                                * 1F9BD
        C=RSTK                                   * 1F9C0
        RTN                                      * 1F9C2
        RPL

* x -> a/b
* ROMPTR 002 107 →Q
* refs (1): 189EA
x->Q:
        :: CK1 FALSE OBJ_1FA07 ABND ;            * 1F9C4
        ASSEMBLE
        HST=0   0                                * 1F9E2
        CLRST                                    * 1F9E5
        RTN                                      * 1F9E7
        RPL

* x -> symb
* ROMPTR 002 108 →Qπ
* refs (1): 189EA
x->QPI:
        :: CK1 TRUE OBJ_1FA07 ABND ;             * 1F9E9

* refs (3): 1F9D3 1F9F8 72F51
* slots of 002 108 (derivative, inverse, ...: used by the symbolic code)
OBJ_1FA07:
        :: {'piflag} BIND STRIPTAGS CK&DISPATCH1 * 1FA07  slot 0
          BINT1 OBJ_5A9F5                        * 1FA20  real
          BINT2 OBJ_5AA13                        * 1FA2A  complex
          BINT9 OBJ_5AA5E                        * 1FA34  algebraic
          BINT0 OBJ_72F1F                        * 1FA3E  any
        ;                                        * 1FA48
        CON(5)  NOP                              * 1FA4D  slot 1
        ASSEMBLE
        HST=0   0                                * 1FA52
        C=ST                                     * 1FA55
        RTN                                      * 1FA57
        RPL

* symb {spat srepl} -> symb' 0/1 symb {spat srepl scond} -> symb' 0/1
* ROMPTR 002 109 ↑MATCH
* refs (2): 189EA B6C9D
xMATCHUP:
        :: CK2&Dispatch                          * 1FA59
          BINT21 match^(ex,li)                   * 1FA63  real list
          BINT37 match^(ex,li)                   * 1FA6D  complex list
          SYMLIST match^(ex,li)                  * 1FA77  name|local|algebraic list
        ;                                        * 1FA81
        ASSEMBLE
        HST=0   0                                * 1FA86
        ST=C                                     * 1FA89
        RTN                                      * 1FA8B
        RPL

* symb {spat srepl} -> symb' 0/1 symb {spat srepl scond} -> symb' 0/1
* ROMPTR 002 10A ↓MATCH
* refs (2): 189EA B6CA2
xMATCHDN:
        :: CK2&Dispatch                          * 1FA8D
          BINT21 matchv(ex,li)                   * 1FA97  real list
          BINT37 matchv(ex,li)                   * 1FAA1  complex list
          SYMLIST matchv(ex,li)                  * 1FAAB  name|local|algebraic list
        ;                                        * 1FAB5

* refs (3): 1FA68 1FA72 1FA7C
* slots of 002 10A (derivative, inverse, ...: used by the symbolic code)
match^(ex,li):
        :: match'(ex,li) TRUE ;                  * 1FABA  slot 0

* refs (3): 1FA9C 1FAA6 1FAB0
matchv(ex,li):
        :: match'(ex,li) FALSE ;                 * 1FACE  slot 1
        CON(2)  #01                              * 1FAE2  end of the slots: property byte (meaning not yet known)
        ASSEMBLE
        GONC    L_1FAE7                          * 1FAE4
L_1FAE7:
        CSTEX                                    * 1FAE7
        RTN                                      * 1FAE9
        RPL

* ROMPTR 002 10B _
* refs (3): 189EA 2802F 6BC9B
xFORMUNIT:
        :: CK2&Dispatch                          * 1FAEB
          BINT1 xFORMUNIT~1                      * 1FAF5  real
          BINT14 xFORMUNIT~1                     * 1FAFF  unit
          BINT10 xFORMUNIT~name|local|algebraic  * 1FB09  name|local|algebraic
        ;                                        * 1FB13

* slots of 002 10B (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6CCCC                        * 1FB18  slot 0

* refs (2): 28E4D 68CEC
#72109h:
        HXS 90127                                * 1FB1D  slot 1
        CON(5)  OBJ_5A298                        * 1FB2C  slot 2

* refs (2): 1FAFA 1FB04
xFORMUNIT~1:
        :: BINT2 nmetasyms ' x* EvalNoCK ;       * 1FB31  slot 3
        CON(2)  #00                              * 1FB54  end of the slots: property byte (meaning not yet known)
        ASSEMBLE
        GONC    L_1FB59                          * 1FB56
L_1FB59:
        P=P+1                                    * 1FB59
        RTN                                      * 1FB5B
        RPL

* x y -> x/y
* ROMPTR 002 10C RATIO
* refs (5): 189EA 2803E 6AF9B 6C3FC 6F07C
xPREDIV:
        :: CK2&Dispatch                          * 1FB5D
          BINT0 x/                               * 1FB67  any
        ;                                        * 1FB71

* slots of 002 10C (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6CEC5                        * 1FB76  slot 0
        CON(5)  #05060410h                       * 1FB7B  slot 1
        ASSEMBLE
        HST=0   0                                * 1FB80
        P=P-1                                    * 1FB83
        RTN                                      * 1FB85
        RPL

* ob -> ob ob
* ROMPTR 002 10D DUP
* refs (14): 189EA 3B582 3D8A8 3DF5E 59422 D2F1E ...
xDUP:
        :: CK1 DUP ;                             * 1FB87

* 1 2 -> 1 2 1 2
* ROMPTR 002 10E DUP2
* refs (3): 189EA D32F7 D32FC
        CON(1)  8                                * 1FB9B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FB9C  library
        CON(3)  #10E                             * 1FB9F  command
xDUP2:
        :: CK2 2DUP ;                            * 1FBA2

* ob1 ob2 -> ob2 ob1
* ROMPTR 002 10F SWAP
* refs (9): 189EA 3B4F0 593D2 59454 D2F0E D2F81 ...
        CON(1)  8                                * 1FBB6  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FBB7  library
        CON(3)  #10F                             * 1FBBA  command
xSWAP:
        :: CK2 SWAP ;                            * 1FBBD

* ob ->
* ROMPTR 002 110 DROP
* refs (12): 189EA 3B6D6 40F6D D364C D3D01 D3DA3 ...
        CON(1)  8                                * 1FBD1  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FBD2  library
        CON(3)  #110                             * 1FBD5  command
xDROP:
        :: CK1 DROP ;                            * 1FBD8

* ob1 ob2 ->
* ROMPTR 002 111 DROP2
* refs (4): 189EA 40F54 40F7C D3DC6
        CON(1)  8                                * 1FBEC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FBED  library
        CON(3)  #111                             * 1FBF0  command
xDROP2:
        :: CK2 2DROP ;                           * 1FBF3

* 1 2 3 -> 2 3 1
* ROMPTR 002 112 ROT
* refs (4): 189EA D2F32 D3683 D3FD9
        CON(1)  8                                * 1FC07  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FC08  library
        CON(3)  #112                             * 1FC0B  command
xROT:
        :: CK3 ROT ;                             * 1FC0E

* 1 2 -> 1 2 1
* ROMPTR 002 113 OVER
* refs (3): 189EA D3BC4 D3DFC
        CON(1)  8                                * 1FC22  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FC23  library
        CON(3)  #113                             * 1FC26  command
xOVER:
        :: CK2 OVER ;                            * 1FC29

* -> n
* ROMPTR 002 114 DEPTH
* refs (1): 189EA
        CON(1)  8                                * 1FC3D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FC3E  library
        CON(3)  #114                             * 1FC41  command
xDEPTH:
        :: CK0 DEPTH UNCOERCE ;                  * 1FC44

* ob1...obn n ->
* ROMPTR 002 115 DROPN
* refs (2): 189EA C65AA
        CON(1)  8                                * 1FC5D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FC5E  library
        CON(3)  #115                             * 1FC61  command
xDROPN:
        :: CKN NDROP ;                           * 1FC64

* 1...n n -> 1...n 1...n
* ROMPTR 002 116 DUPN
* refs (3): 189EA 43DB3 D3306
        CON(1)  8                                * 1FC78  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FC79  library
        CON(3)  #116                             * 1FC7C  command
xDUPN:
        :: CKN NDUP ;                            * 1FC7F

* 1...n n -> 1..n 1
* ROMPTR 002 117 PICK
* refs (2): 189EA 43D63
        CON(1)  8                                * 1FC93  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FC94  library
        CON(3)  #117                             * 1FC97  command
xPICK:
        :: CKN PICK ;                            * 1FC9A

* 1...n n -> 2...n 1
* ROMPTR 002 118 ROLL
* refs (4): 189EA 43D77 D3DB2 D3E3D
        CON(1)  8                                * 1FCAE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FCAF  library
        CON(3)  #118                             * 1FCB2  command
xROLL:
        :: CKN ROLL ;                            * 1FCB5

* n ... 1 n -> 1 n...2
* ROMPTR 002 119 ROLLD
* refs (6): 189EA 43D8B D3C46 D3E0B D3F3D D40CF
        CON(1)  8                                * 1FCC9  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FCCA  library
        CON(3)  #119                             * 1FCCD  command
xROLLD:
        :: CKN UNROLL ;                          * 1FCD0

* ob1 .. obn ->
* ROMPTR 002 11A CLEAR
* refs (2): 189EA 3B686
        CON(1)  8                                * 1FCE4  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FCE5  library
        CON(3)  #11A                             * 1FCE8  command
xCLEAR:
        :: CK0 DEPTH NDROP ;                     * 1FCEB

* ob ->
* ROMPTR 002 11B STOΣ
* refs (3): 189EA C53A8 D40F0
        CON(1)  8                                * 1FD04  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FD05  library
        CON(3)  #11B                             * 1FD08  command
xSTOSIGMA:
        :: CK1 STRIPTAGS STATSTO ;               * 1FD0B

* ->
* ROMPTR 002 11C CLΣ
* refs (1): 189EA
        CON(1)  8                                * 1FD24  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FD25  library
        CON(3)  #11C                             * 1FD28  command
xCLSIGMA:
        :: CK0 STATCLST ;                        * 1FD2B

* -> [[]]
* ROMPTR 002 11D RCLΣ
* refs (3): 189EA C53AD D400B
        CON(1)  8                                * 1FD3F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FD40  library
        CON(3)  #11D                             * 1FD43  command
xRCLSIGMA:
        :: CK0 rclä! ;                           * 1FD46

* x -> x1...xn -> []/[[]] ->
* ROMPTR 002 11E Σ+
* refs (2): 189EA 2C324
        CON(1)  8                                * 1FD5A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FD5B  library
        CON(3)  #11E                             * 1FD5E  command
xSIGMA+:
        :: CK1&Dispatch                          * 1FD61
          BINT1 ä+(r)                            * 1FD6B  real
          BINT4 å-                               * 1FD75  array
        ;                                        * 1FD7F

* -> x -> []
* ROMPTR 002 11F Σ-
* refs (2): 189EA D4083
        CON(1)  8                                * 1FD84  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FD85  library
        CON(3)  #11F                             * 1FD88  command
xSIGMA-:
        :: CK0 xSIGMA-~1 ;                       * 1FD8B

* -> nrows
* ROMPTR 002 120 NΣ
* refs (1): 189EA
        CON(1)  8                                * 1FD9F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FDA0  library
        CON(3)  #120                             * 1FDA3  command
xNSIGMA:
        :: CK0 STATN ;                           * 1FDA6

* -> x_correlation
* ROMPTR 002 121 CORR
* refs (1): 189EA
        CON(1)  8                                * 1FDBA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FDBB  library
        CON(3)  #121                             * 1FDBE  command
xCORR:
        :: CK0 STATCORR ;                        * 1FDC1

* -> x_covariance
* ROMPTR 002 122 COV
* refs (1): 189EA
        CON(1)  8                                * 1FDD5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FDD6  library
        CON(3)  #122                             * 1FDD9  command
xCOV:
        :: CK0 STATCOV ;                         * 1FDDC

* ROMPTR 002 123 ΣX
* refs (1): 189EA
        CON(1)  8                                * 1FDF0  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FDF1  library
        CON(3)  #123                             * 1FDF4  command
äX:
        :: CK0 STATX ;                           * 1FDF7

* -> xsum
* ROMPTR 002 124 ΣY
* refs (1): 189EA
        CON(1)  8                                * 1FE0B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FE0C  library
        CON(3)  #124                             * 1FE0F  command
xSUMY:
        :: CK0 STATY ;                           * 1FE12

* -> xsum
* ROMPTR 002 125 ΣX^2
* refs (1): 189EA
        CON(1)  8                                * 1FE26  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FE27  library
        CON(3)  #125                             * 1FE2A  command
xSUMX2:
        :: CK0 STATXX ;                          * 1FE2D

* -> xsum
* ROMPTR 002 126 ΣY^2
* refs (1): 189EA
        CON(1)  8                                * 1FE41  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FE42  library
        CON(3)  #126                             * 1FE45  command
xSUMY2:
        :: CK0 STATYY ;                          * 1FE48

* -> xsum
* ROMPTR 002 127 ΣX*Y
* refs (1): 189EA
        CON(1)  8                                * 1FE5C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FE5D  library
        CON(3)  #127                             * 1FE60  command
xSUMXY:
        :: CK0 STATXY ;                          * 1FE63

* -> xmax -> [x1...xn]
* ROMPTR 002 128 MAXΣ
* refs (1): 189EA
        CON(1)  8                                * 1FE77  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FE78  library
        CON(3)  #128                             * 1FE7B  command
xMAXSIGMA:
        :: CK0 STATSMAX ;                        * 1FE7E

* -> xmean -> [x1...xn]
* ROMPTR 002 129 MEAN
* refs (1): 189EA
        CON(1)  8                                * 1FE92  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FE93  library
        CON(3)  #129                             * 1FE96  command
xMEAN:
        :: CK0 STATMEAN ;                        * 1FE99

* -> xmin -> [x1...xn]
* ROMPTR 002 12A MINΣ
* refs (1): 189EA
        CON(1)  8                                * 1FEAD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FEAE  library
        CON(3)  #12A                             * 1FEB1  command
xMINSIGMA:
        :: CK0 STATSMIN ;                        * 1FEB4

* -> xsdev -> [x1...xn]
* ROMPTR 002 12B SDEV
* refs (1): 189EA
        CON(1)  8                                * 1FEC8  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FEC9  library
        CON(3)  #12B                             * 1FECC  command
xSDEV:
        :: CK0 STATSTDEV ;                       * 1FECF

* -> xsum -> {x1...xn}
* ROMPTR 002 12C TOT
* refs (1): 189EA
        CON(1)  8                                * 1FEE3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FEE4  library
        CON(3)  #12C                             * 1FEE7  command
xTOT:
        :: CK0 STATTOT ;                         * 1FEEA

* -> x -> [x1...xn]
* ROMPTR 002 12D VAR
* refs (1): 189EA
        CON(1)  8                                * 1FEFE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FEFF  library
        CON(3)  #12D                             * 1FF02  command
xVAR:
        :: CK0 STATVAR ;                         * 1FF05

* -> Intercept Slope
* ROMPTR 002 12E LR
* refs (1): 189EA
        CON(1)  8                                * 1FF19  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FF1A  library
        CON(3)  #12E                             * 1FF1D  command
xLR:
        :: CK0 STATLR                            * 1FF20
          {                                      * 1FF2F

_Intercept_:
            $ "Intercept"                        * 1FF34

_Slope_:
            $ "Slope" }                          * 1FF50
          TAGOBS ;                               * 1FF69

* x -> y
* ROMPTR 002 12F PREDV
* refs (1): 189EA
        CON(1)  8                                * 1FF73  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FF74  library
        CON(3)  #12F                             * 1FF77  command
xPREDV:
        :: CK1&Dispatch                          * 1FF7A
          BINT1 STATPREDY                        * 1FF84  real
        ;                                        * 1FF8E

* x -> y
* ROMPTR 002 130 PREDY
* refs (1): 189EA
        CON(1)  8                                * 1FF93  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FF94  library
        CON(3)  #130                             * 1FF97  command
xPREDY:
        :: CK1&Dispatch                          * 1FF9A
          BINT1 STATPREDY                        * 1FFA4  real
        ;                                        * 1FFAE

* y -> x
* ROMPTR 002 131 PREDX
* refs (1): 189EA
        CON(1)  8                                * 1FFB3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FFB4  library
        CON(3)  #131                             * 1FFB7  command
xPREDX:
        :: CK1&Dispatch                          * 1FFBA
          BINT1 STATPREDX                        * 1FFC4  real
        ;                                        * 1FFCE

* n ->
* ROMPTR 002 132 XCOL
* refs (1): 189EA
        CON(1)  8                                * 1FFD3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FFD4  library
        CON(3)  #132                             * 1FFD7  command
xXCOL:
        :: CK1&Dispatch                          * 1FFDA
          BINT1 STATXCOL                         * 1FFE4  real
        ;                                        * 1FFEE

* n ->
* ROMPTR 002 133 YCOL
* refs (1): 189EA
        CON(1)  8                                * 1FFF3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FFF4  library
        CON(3)  #133                             * 1FFF7  command
xYCOL:
        ::                                       * 1FFFA
L_1FFFF:
          CK1&Dispatch                           * 1FFFF
          BINT1 STATYCOL                         * 20004  real
        ;                                        * 2000E

* n x -> x'
* ROMPTR 002 134 UTPC
* refs (1): 189EA
        CON(1)  8                                * 20013  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20014  library
        CON(3)  #134                             * 20017  command
xUTPC:
        :: CK2&Dispatch                          * 2001A
          BINT17 utpn(2r)                        * 20024  real real
        ;                                        * 2002E

* n v x -> x'
* ROMPTR 002 135 UTPN
* refs (1): 189EA
        CON(1)  8                                * 20033  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20034  library
        CON(3)  #135                             * 20037  command
xUTPN:
        :: CK3&Dispatch                          * 2003A
          3REAL utpn(3r)                         * 20044  real real real
        ;                                        * 2004E

* n1 n2 x -> x'
* ROMPTR 002 136 UTPF
* refs (1): 189EA
        CON(1)  8                                * 20053  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20054  library
        CON(3)  #136                             * 20057  command
xUTPF:
        :: CK3&Dispatch                          * 2005A
          3REAL utpf(3r)                         * 20064  real real real
        ;                                        * 2006E

* n x -> x'
* ROMPTR 002 137 UTPT
* refs (1): 189EA
        CON(1)  8                                * 20073  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20074  library
        CON(3)  #137                             * 20077  command
xUTPT:
        :: CK2&Dispatch                          * 2007A
          BINT17 utpt(2r)                        * 20084  real real
        ;                                        * 2008E

* x_col y_col ->
* ROMPTR 002 138 COLΣ
* refs (1): 189EA
        CON(1)  8                                * 20093  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20094  library
        CON(3)  #138                             * 20097  command
xSIGMACOL:
        :: CK2&Dispatch                          * 2009A
          BINT17 STATCOL                         * 200A4  real real
        ;                                        * 200AE

* slots of 002 138 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  NOP                              * 200B3  slot 0
        CON(5)  NOP                              * 200B8  slot 1

* ->
* ROMPTR 002 139 SCLΣ
* refs (1): 189EA
        CON(1)  8                                * 200BD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 200BE  library
        CON(3)  #139                             * 200C1  command
xSCLSIGMA:
        :: CK0 rclä ChkReakäPAR 3DROP COERCE2 xSCLSIGMA~1 ; * 200C4

* -> symb
* ROMPTR 002 13A ΣLINE
* refs (1): 189EA
        CON(1)  8                                * 200EC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 200ED  library
        CON(3)  #13A                             * 200F0  command
xSIGMALINE:
        :: CK0 OBJ_48BBB ;                       * 200F3

* min width n -> [[]] []
* ROMPTR 002 13B BINS
* refs (1): 189EA
        CON(1)  8                                * 20107  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20108  library
        CON(3)  #13B                             * 2010B  command
xBINS:
        :: CK3&Dispatch                          * 2010E
          # 111 bins(3r)                         * 20118  real real real
        ;                                        * 20127

* ->
* ROMPTR 002 13C BARPLOT
* refs (3): 189EA C70C2 C70D1
        CON(1)  8                                * 2012C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 2012D  library
        CON(3)  #13C                             * 20130  command
xBARPLOT:
        :: CK0 'IDBAR                            * 20133
L_20142:
          PUTPTYPE AUTOSCALE BlankDA12 DOERASE draw ; * 20142

* ->
* ROMPTR 002 13D HISTPLOT
* refs (3): 189EA C70EA C70F9
        CON(1)  8                                * 20160  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20161  library
        CON(3)  #13D                             * 20164  command
xHISTPLOT:
        :: CK0 'IDHISTOGRAM GOTO L_20142 ;       * 20167

* ->
* ROMPTR 002 13E SCATRPLOT
* refs (3): 189EA C7112 C7121
        CON(1)  8                                * 20185  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20186  library
        CON(3)  #13E                             * 20189  command
xSCATRPLOT:
        :: CK0 'IDSCATTER GOTO L_20142 ;         * 2018C

* ->
* ROMPTR 002 13F LINFIT
* refs (10): 189EA 201C0 202B8 2C760 48BD9 4A17C ...
        CON(1)  8                                * 201AA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 201AB  library
        CON(3)  #13F                             * 201AE  command
xLINFIT:
        :: CK0 ' xLINFIT StoModel ;              * 201B1

* ->
* ROMPTR 002 140 LOGFIT
* refs (7): 189EA 201E5 2CC7E 48C10 4A181 B7D9D ...
        CON(1)  8                                * 201CF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 201D0  library
        CON(3)  #140                             * 201D3  command
xLOGFIT:
        :: CK0 ' xLOGFIT StoModel ;              * 201D6

* ->
* ROMPTR 002 141 EXPFIT
* refs (7): 189EA 2020A 2CC38 48C51 4A186 B7DAD ...
        CON(1)  8                                * 201F4  command header: flags (meaning not yet known)
        CON(3)  #002                             * 201F5  library
        CON(3)  #141                             * 201F8  command
xEXPFIT:
        :: CK0 ' xEXPFIT StoModel ;              * 201FB

* ROMPTR 002 142 PWRFIT
* refs (7): 189EA 2022F 2CC24 2CC6A 4A18B B7DBD ...
        CON(1)  8                                * 20219  command header: flags (meaning not yet known)
        CON(3)  #002                             * 2021A  library
        CON(3)  #142                             * 2021D  command
xPWRFIT:
        :: CK0 ' xPWRFIT                         * 20220

* refs (5): 201C5 201EA 2020F 4A1C2 4A208
StoModel:
          :: ChkReakäPAR DROP 5ROLL StoäPAR(5_) ; ; * 20234

* ->
* ROMPTR 002 143 BESTFIT
* refs (3): 189EA B7DCD B8078
        CON(1)  8                                * 20257  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20258  library
        CON(3)  #143                             * 2025B  command
xBESTFIT:
        :: CK0 ERRSET bestfit ERRTRAP            * 2025E
          :: ERROR@ xBESTFIT~1 OVER #= SWAP xBESTFIT~2 #= OR NOTcase ERRJMP * 20277
            ERRORCLR DropSysObs xLINFIT ;        * 202AE
        ;                                        * 202C2

* name ->
* ROMPTR 002 144 SINV
* refs (1): 189EA
        CON(1)  8                                * 202C7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 202C8  library
        CON(3)  #144                             * 202CB  command
xSINV:
        :: CK1&Dispatch                          * 202CE
          BINT6 sinv(gn)                         * 202D8  name
          BINT7 sinv(ln)                         * 202E2  local
        ;                                        * 202EC

* refs (1): 202DD
sinv(gn):
        :: dup;RclInVars(nm) dARRYcase ~SWAPDROP;@inv(ar);DROP * 202F1
          'REvalSto xINV ;                       * 20305

* refs (1): 202E7
sinv(ln):
        :: dup;RclInVars(nm) 'REvalSto xINV ;    * 20314

* refs (1): 20300
~SWAPDROP;@inv(ar);DROP:
        :: SWAPDROP @inv(ar) DROP ;              * 2032D

* name ->
* ROMPTR 002 145 SNEG
* refs (1): 189EA
        CON(1)  8                                * 20346  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20347  library
        CON(3)  #145                             * 2034A  command
xSNEG:
        :: CK1&Dispatch                          * 2034D
          BINT6 sneg(gn)                         * 20357  name
          BINT7 sneg(ln)                         * 20361  local
        ;                                        * 2036B

* refs (1): 2035C
sneg(gn):
        :: dup;RclInVars(nm) dARRYcase ~SWAPDROP;@neg(ar);DROP * 20370
          'REvalSto xNEG ;                       * 20384

* refs (1): 20366
sneg(ln):
        :: dup;RclInVars(nm) 'REvalSto xNEG ;    * 20393

* refs (1): 2037F
~SWAPDROP;@neg(ar);DROP:
        :: SWAPDROP @neg(ar) DROP ;              * 203AC

* name ->
* ROMPTR 002 146 SCONJ
* refs (1): 189EA
        CON(1)  8                                * 203C5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 203C6  library
        CON(3)  #146                             * 203C9  command
xSCONJ:
        :: CK1&Dispatch                          * 203CC
          BINT6 sconj(gn)                        * 203D6  name
          BINT7 sconj(ln)                        * 203E0  local
        ;                                        * 203EA

* refs (1): 203DB
sconj(gn):
        :: dup;RclInVars(nm) dARRYcase ~SWAPDROP;@conj!(ar);DROP * 203EF
          'REvalSto xCONJ ;                      * 20403

* refs (1): 203E5
sconj(ln):
        :: dup;RclInVars(nm) 'REvalSto xCONJ ;   * 20412

* refs (1): 203FE
~SWAPDROP;@conj!(ar);DROP:
        :: SWAPDROP @conj!(ar) DROP ;            * 2042B

* ob name -> name ob ->
* ROMPTR 002 147 STO+
* refs (7): 189EA 45875 4587F 4632F 8A5DD 8A608 ...
        CON(1)  8                                * 20444  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20445  library
        CON(3)  #147                             * 20448  command
xSTO+:
        :: CK2&Dispatch                          * 2044B
          BINT6 sto+(_,nm)                       * 20455  name
          BINT7 sto+(_,nm)                       * 2045F  local
          BINT96 sto+(nm,_)                      * 20469  name any
          BINT112 sto+(nm,_)                     * 20473  local any
        ;                                        * 2047D

* refs (2): 2045A 20464
sto+(_,nm):
        :: dup;RclInVars(nm) ROTSWAP CK&DISPATCH1 * 20482

* refs (1): 204D2
sto+(nm,_)~1:
          # 644 ~ROTDROP;1@+(2ar);DROP           * 20496  name array array
          BINT0                                  * 204A5  any
          :: 'REvalSto x+ ;                      * 204AA
        ;                                        * 204BE

* refs (2): 2046E 20478
sto+(nm,_):
        :: over;RclInVars(nm) CK&DISPATCH1       * 204C3
          sto+(nm,_)~1 ~ROTDROP;1@+(2ar);DROP    * 204D2  name array array
          BINT0                                  * 204DC  any
          :: SWAP 'REvalSto x+ ;                 * 204E1
        ;                                        * 204FA

* refs (20): 20305 2031E 20384 2039D 20403 2041C ...
* name args -> : evaluate the next runstream object on the arguments and store the result in name (STO+, SINV, ...)
'REvalSto:
        :: 'R EvalNoCK sto(nm,_) ;               * 204FF

* refs (2): 204A0 204D7
~ROTDROP;1@+(2ar);DROP:
        :: ROTDROP 1@+(2ar) DROP ;               * 20518

* ob name -> name ob ->
* ROMPTR 002 148 STO-
* refs (3): 189EA 462B2 8C08C
        CON(1)  8                                * 20531  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20532  library
        CON(3)  #148                             * 20535  command
xSTO-:
        :: CK2&Dispatch                          * 20538
          BINT70 sto-(ar,gn)                     * 20542  array name
          BINT6 sto-(_,nm)                       * 2054C  name
          BINT7 sto-(_,nm)                       * 20556  local
          BINT100 sto-(gn,ar)                    * 20560  name array
          BINT96 sto-(nm,_)                      * 2056A  name any
          BINT112 sto-(nm,_)                     * 20574  local any
        ;                                        * 2057E

* refs (2): 20551 2055B
sto-(_,nm):
        :: dup;RclInVars(nm) ROTSWAP 'REvalSto x- ; * 20583

* refs (2): 2056F 20579
sto-(nm,_):
        :: over;RclInVars(nm) SWAP 'REvalSto x- ; * 205A1

* refs (1): 20547
sto-(ar,gn):
        :: dup;RclInVars(nm) dup;ar?#BAT! SWAPDROP 1@-(2ar) DROP ; * 205BF

* refs (1): 20565
sto-(gn,ar):
        :: over;RclInVars(nm) dup;ar?#BAT! ROTDROPSWAP 2@-(2ar) DROP ; * 205E2

* ob name -> name ob ->
* ROMPTR 002 149 STO/
* refs (1): 189EA
        CON(1)  8                                * 20605  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20606  library
        CON(3)  #149                             * 20609  command
xSTO/:
        :: CK2&Dispatch                          * 2060C
          BINT97 sto/(gn,nb)                     * 20616  name real
          BINT98 sto/(gn,nb)                     * 20620  name complex
          BINT70 xSTO/~array,name                * 2062A  array name
          BINT6 sto/(_,nm)                       * 20634  name
          BINT7 sto/(_,nm)                       * 2063E  local
          BINT100 sto/(gn,ar)                    * 20648  name array
          BINT96 sto/(nm,_)                      * 20652  name any
          BINT112 sto/(nm,_)                     * 2065C  local any
        ;                                        * 20666

* refs (2): 20639 20643
sto/(_,nm):
        :: dup;RclInVars(nm) ROTSWAP 'REvalSto x/ ; * 2066B

* refs (2): 20657 20661
sto/(nm,_):
        :: over;RclInVars(nm) SWAP 'REvalSto x/ ; * 20689

* refs (2): 2061B 20625
sto/(gn,nb):
        :: over;RclInVars(nm) dARRYcase ~ROTDROPSWAP;1@/(ar,nb);DROP * 206A7
          SWAP 'REvalSto x/ ;                    * 206BB

* refs (1): 206B6
~ROTDROPSWAP;1@/(ar,nb);DROP:
        :: ROTDROPSWAP 1@/(ar,nb) DROP ;         * 206CF

* refs (1): 2062F
xSTO/~array,name:
        :: dup;RclInVars(nm) ROTSWAP dARRYcase ~ROTDROP;1@/(2ar);DROP * 206E8
          'REvalSto x/ ;                         * 20701

* refs (1): 206FC
~ROTDROP;1@/(2ar);DROP:
        :: ROTDROP 1@/(2ar) DROP ;               * 20710

* refs (1): 2064D
sto/(gn,ar):
        :: over;RclInVars(nm) dup;ar?#BAT! ROTDROPSWAP 2@/(2ar) DROP ; * 20729

* ob name -> name ob ->
* ROMPTR 002 14A STO*
* refs (1): 189EA
        CON(1)  8                                * 2074C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 2074D  library
        CON(3)  #14A                             * 20750  command
xSTO*:
        :: CK2&Dispatch                          * 20753
          BINT22 sto*(nb,gn)                     * 2075D  real name
          BINT38 sto*(nb,gn)                     * 20767  complex name
          BINT97 sto*(gn,nb)                     * 20771  name real
          BINT98 sto*(gn,nb)                     * 2077B  name complex
          BINT70 sto*(ar,nm)                     * 20785  array name
          BINT6 sto*(_,nm)                       * 2078F  name
          BINT7 sto*(_,nm)                       * 20799  local
          BINT100 sto*(nm,ar)                    * 207A3  name array
          BINT96 sto*(nm,_)                      * 207AD  name any
          BINT112 sto*(nm,_)                     * 207B7  local any
        ;                                        * 207C1

* refs (2): 20794 2079E
sto*(_,nm):
        :: dup;RclInVars(nm) ROTSWAP 'REvalSto x* ; * 207C6

* refs (2): 207B2 207BC
sto*(nm,_):
        :: over;RclInVars(nm) SWAP 'REvalSto x* ; * 207E4

* refs (2): 20762 2076C
sto*(nb,gn):
        :: dup;RclInVars(nm) ROTSWAP dARRYcase ~ROTDROP;1@*(nb,ar);DROP * 20802
          'REvalSto x* ;                         * 2081B

* refs (2): 20776 20780
sto*(gn,nb):
        :: over;RclInVars(nm) dARRYcase ~ROTDROP;1@*(nb,ar);DROP * 2082A
          SWAP 'REvalSto x* ;                    * 2083E

* refs (2): 20816 20839
~ROTDROP;1@*(nb,ar);DROP:
        :: ROTDROP 1@*(nb,ar) DROP ;             * 20852

* refs (1): 2078A
sto*(ar,nm):
        :: dup;RclInVars(nm) ROTSWAP dARRYcase ~ROTDROP;1@*(2ar);DROP * 2086B
          'REvalSto x* ;                         * 20884

* refs (1): 2087F
~ROTDROP;1@*(2ar);DROP:
        :: ROTDROP 1@*(2ar) DROP ;               * 20893

* refs (1): 207A8
sto*(nm,ar):
        :: over;RclInVars(nm) dARRYcase ~ROTDROPSWAP;2@*(2ar);DROP * 208AC
          SWAP 'REvalSto x* ;                    * 208C0

* refs (1): 208BB
~ROTDROPSWAP;2@*(2ar);DROP:
        :: ROTDROPSWAP 2@*(2ar) DROP ;           * 208D4

* name -> x
* ROMPTR 002 14B INCR
* refs (1): 189EA
        CON(1)  8                                * 208ED  command header: flags (meaning not yet known)
        CON(3)  #002                             * 208EE  library
        CON(3)  #14B                             * 208F1  command
xINCR:
        :: CK1&Dispatch                          * 208F4
          BINT6 incr(gn)                         * 208FE  name
          BINT7 incr(ln)                         * 20908  local
        ;                                        * 20912

* refs (1): 20903
incr(gn):
        :: OBJ_20935 %+ SWAP REPLACE ;           * 20917

* refs (2): 2091C 209D2
OBJ_20935:
        :: RclRealInVars(nm) REFERENCED? ITE TOTEMPOBADJ DUP * 20935
          SWAP %1 ;                              * 20953

* refs (3): 2093A 2098A 209F5
RclRealInVars(nm):
        :: SAFE@_HERE NOTcase SETNONEXTERR       * 20962
          CKREAL ;                               * 20976

* refs (1): 2090D
incr(ln):
        :: DUP RclRealInVars(nm) %1+ DUPROT STO ; * 20980

* name -> x_new
* ROMPTR 002 14C DECR
* refs (1): 189EA
        CON(1)  8                                * 209A3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 209A4  library
        CON(3)  #14C                             * 209A7  command
xDECR:
        :: CK1&Dispatch                          * 209AA
          BINT6 decr(gn)                         * 209B4  name
          BINT7 decr(ln)                         * 209BE  local
        ;                                        * 209C8

* refs (1): 209B9
decr(gn):
        :: OBJ_20935 %- SWAP REPLACE ;           * 209CD

* refs (1): 209C3
decr(ln):
        :: DUP RclRealInVars(nm) %1- DUPROT STO ; * 209EB

* symb -> symb'
* ROMPTR 002 14D COLCT
* refs (1): 189EA
        CON(1)  8                                * 20A0E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20A0F  library
        CON(3)  #14D                             * 20A12  command
xCOLCT:
        :: CK1&Dispatch                          * 20A15
          BINT1 SYMCOLCT                         * 20A1F  real
          BINT2 SYMCOLCT                         * 20A29  complex
          BINT10 SYMCOLCT                        * 20A33  name|local|algebraic
        ;                                        * 20A3D

* symb1 -> symb2
* ROMPTR 002 14E EXPAN
* refs (1): 189EA
        CON(1)  8                                * 20A42  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20A43  library
        CON(3)  #14E                             * 20A46  command
xEXPAN:
        :: CK1&Dispatch                          * 20A49
          BINT1 SYMEXPAN                         * 20A53  real
          BINT2 SYMEXPAN                         * 20A5D  complex
          BINT10 SYMEXPAN                        * 20A67  name|local|algebraic
        ;                                        * 20A71

* ROMPTR 002 14F RULES
* refs (1): 189EA
        CON(1)  8                                * 20A76  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20A77  library
        CON(3)  #14F                             * 20A7A  command
xRULES:
        :: xRULES~1 ;                            * 20A7D

* symb var -> symb'
* ROMPTR 002 150 ISOL
* refs (1): 189EA
        CON(1)  8                                * 20A8C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20A8D  library
        CON(3)  #150                             * 20A90  command
xISOL:
        :: CK2&Dispatch                          * 20A93
          SYMID SYMISOL                          * 20A9D  name|local|algebraic name
        ;                                        * 20AA7

* symb var -> symb'
* ROMPTR 002 151 QUAD
* refs (1): 189EA
        CON(1)  8                                * 20AAC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20AAD  library
        CON(3)  #151                             * 20AB0  command
xQUAD:
        :: CK2&Dispatch                          * 20AB3
          SYMID SYMQUAD                          * 20ABD  name|local|algebraic name
        ;                                        * 20AC7

* symb name -> symb' symb {names} -> symb'
* ROMPTR 002 152 SHOW
* refs (1): 189EA
        CON(1)  8                                * 20ACC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20ACD  library
        CON(3)  #152                             * 20AD0  command
xSHOW:
        :: CK2&Dispatch                          * 20AD3
          SYMID SYMSHOW                          * 20ADD  name|local|algebraic name
          SYMLAM SYMSHOW                         * 20AE7  name|local|algebraic local
          SYMLIST XEQSHOWLS                      * 20AF1  name|local|algebraic list
        ;                                        * 20AFB

* sym {} -> symf
* refs (2): 20AF6 9F0DE
XEQSHOWLS:
        :: dup;ListOfNames?:dq/sk SHOWLS SETTYPEERR ; * 20B00

* symb var n -> symb'
* ROMPTR 002 153 TAYLR
* refs (1): 189EA
        CON(1)  8                                * 20B19  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20B1A  library
        CON(3)  #153                             * 20B1D  command
xTAYLR:
        :: CK3&Dispatch                          * 20B20
          SYMIDREAL SYMTAYLR                     * 20B2A  name|local|algebraic name real
        ;                                        * 20B34

* var -> x :port:nlib -> lib :port:name -> ob :port:{path} -> ob
* ROMPTR 002 154 RCL
* refs (5): 189EA 21781 40134 40341 85945
        CON(1)  8                                * 20B39  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20B3A  library
        CON(3)  #154                             * 20B3D  command
xRCL:
        :: CK1&Dispatch                          * 20B40
          BINT13 rcl(to)                         * 20B4A  tagged
          BINT6 XEQRCL                           * 20B54  name
          BINT7 XEQRCL                           * 20B5E  local
          BINT8 PICTRCL                          * 20B68  program
          BINT5 rcl(li)                          * 20B72  list
        ;                                        * 20B7C

* id -> ob
* refs (18): 1A26F 20B59 20B63 20C21 20C3A 22F77 ...
XEQRCL:
        :: SAFE@ NOTcase SETNONEXTERR            * 20B81
        ;                                        * 20B95

* refs (1): 20B77
rcl(li):
        :: DUPTYPELIST? NOTcase SETTYPEERR       * 20B9A
          DUP BINT1 NTHELCOMP NOTcase SETTYPEERR * 20BAE
          ' xHOME EQ case RclFromHome(li)        * 20BC7

* refs (1): 20C80
dup;ListOfNames?#:BAT!:
          ::                                     * 20BE0
            :: dup;ListOfNames?:dq/sk SKIP ; SETTYPEERR ; * 20BE5
          DUP CARCOMP SWAPDUP LENCOMP #1= casedrop XEQRCL * 20C03
          SWAP DUPTYPEIDNT? NOTcase SETTYPEERR   * 20C26
          XEQRCL DUPTYPERRP? NOTcase SETTYPEERR  * 20C3A

* refs (1): 20CA3
rcl(li,di):
          :: SWAP rcl(di,li)? NOTcase SETNONEXTERR * 20C4E
          ;                                      * 20C67
        ;                                        * 20C6C

* refs (1): 20BDB
RclFromHome(li):
        :: DUP CDRCOMP dup;ListOfNames?#:BAT! CONTEXT@ SWAPDROP HOMEDIR * 20C71
          CONTEXT@ SWAP CONTEXT! rcl(li,di) ;    * 20C94

* xPICT -> grob
* refs (1): 20B6D
PICTRCL:
        :: CKPICT GBUFF TOTEMPOB ;               * 20CAD

* ob name -> ob :port:name -> lib port -> bup port -> ob 'name(i)' ->
* ROMPTR 002 155 STO
* refs (7): 189EA 21588 3B3F5 3B41D 40111 40404 ...
        CON(1)  8                                * 20CC6  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20CC7  library
        CON(3)  #155                             * 20CCA  command
xSTO:
        :: CK2&Dispatch                          * 20CCD
          BINT13 sto(_,to)                       * 20CD7  tagged
          BINT6                                  * 20CE1  name

sto(_,gn):
          :: STRIPTAGSl2 XEQSTOID ;              * 20CE6
          BINT7                                  * 20CFA  local

sto(_,ln):
          :: STRIPTAGSl2 STO ;                   * 20CFF
          BINT9                                  * 20D13  algebraic

sto(_,ex):
          :: STRIPTAGSl2 StoLT(_,ex) ;           * 20D18
          # C8 sto(go,PICT)                      * 20D2C  grob program
          # 9F1 sto(bk,r)                        * 20D3B  backup real
          # 8F1 sto(bk,r)                        * 20D4A  library real
        ;                                        * 20D59

* 'name=expr' -> 'name(name1...)=expr(name1...) ->
* ROMPTR 002 156 DEFINE
* refs (1): 189EA
        CON(1)  8                                * 20D5E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20D5F  library
        CON(3)  #156                             * 20D62  command
xDEFINE:
        :: CK1&Dispatch                          * 20D65
          BINT9 define(eq)                       * 20D6F  algebraic
        ;                                        * 20D79

* refs (1): 20D74
define(eq):
        :: SPLITEQ SWAP CK&DISPATCH0             * 20D7E
          BINT6 define(_,nm)                     * 20D92  name
          BINT7 define(_,nm)                     * 20D9C  local
          BINT9 define(_,ex)                     * 20DA6  algebraic
          BINT0 INVDEFERR                        * 20DB0  any
        ;                                        * 20DBA

* refs (2): 20D97 20DA1
define(_,nm):
        :: NOTNUM? ?SKIP                         * 20DBF
          :: SWAP CK0NOLASTWD EVAL ->num(ex) 0LASTOWDOB! CK2NOLASTWD SWAP * 20DCE
            dup;nm?#:_IDEF_ ;                    * 20DF6
          XEQSTOID ;                             * 20E00

* refs (1): 20DAB
define(_,ex):
        :: INNERCOMP M1stFNCcase                 * 20E0A
          :: 2DROP DUPUNROT #3+ UNROLL tok<< tok-> &$ SWAP #1+_ONE_DO $ " " * 20E19
            &$ ISTOP@ INDEX@#- #1+ROLL dup;nm?#:_IDEF_ ID>$ &$ LOOP SWAP * 20E57
            symcomp EDITDECOMP$ &$ palparse NOTcase ERRJMP * 20E84
            EVAL SWAP CARCOMP dup;nm?#:_IDEF_ XEQSTOID ; * 20EA2
          INVDEFERR ;                            * 20EC0

* refs (3): 20DF6 20E6B 20EB1
dup;nm?#:_IDEF_:
        :: CK&DISPATCH0                          * 20ECA
          BINT6 NOP                              * 20ED4  name
          BINT7 NOP                              * 20EDE  local
          BINT0 INVDEFERR                        * 20EE8  any
        ;                                        * 20EF2

* name -> {names} -> PICT -> :port:name -> :port:nlib ->
* ROMPTR 002 157 PURGE
* refs (17): 189EA 20F80 21811 21825 85B7F D2FF3 ...
        CON(1)  8                                * 20EF7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20EF8  library
        CON(3)  #157                             * 20EFB  command
xPURGE:
        :: CK1&Dispatch                          * 20EFE
          BINT13 purge(to)                       * 20F08  tagged
          BINT6 ?PURGE_HERE                      * 20F12  name
          BINT5 purge(li)                        * 20F1C  list
          BINT8 XEQPURGEPICT                     * 20F26  program
        ;                                        * 20F30

* refs (2): 20F21 B9D7C
purge(li):
        :: DUPNULLCOMP? caseDROP                 * 20F35

* refs (1): 1EF2D
prvar(li)~1:
          :: 'R 1LAMBIND toLEN_DO DUPINDEX@ NTHCOMPDROP 1GETLAM EvalNoCK * 20F44
            LOOP DROP ABND ;                     * 20F6C
          xPURGE ;                               * 20F80

* xPICT ->
* refs (1): 20F2B
XEQPURGEPICT:
        :: CKPICT OBJ_46152 KILLGDISP ;          * 20F8A

* -> x
* ROMPTR 002 158 MEM
* refs (3): 189EA 21866 268A4
        CON(1)  8                                * 20FA3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20FA4  library
        CON(3)  #158                             * 20FA7  command
xMEM:
        :: CK0 GARBAGE MEM UNCOERCE %2 %/ ;      * 20FAA

* {names} ->
* ROMPTR 002 159 ORDER
* refs (1): 189EA
        CON(1)  8                                * 20FD2  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20FD3  library
        CON(3)  #159                             * 20FD6  command
xORDER:
        :: CK1&Dispatch                          * 20FD9
          BINT5 XEQORDER                         * 20FE3  list
        ;                                        * 20FED

* {id1 id2..} ->
* refs (1): 20FE8
XEQORDER:
        :: TYPEIDNT ChkType(li,s) PTR DoHere:    * 20FF2

order!(li):
          :: INNERCOMP ZERO_DO ?ATTNQUIT DUP@ ?SKIP SETNONEXTERR * 21006
            DUPTYPERRP? SWAP REFERENCED? ROTAND ITE XEQORDER~1 * 21029

PurgeSto(nm,_):
            :: OVER PURGE SWAP CREATE ;          * 21047
            LOOP ;                               * 21065
        ;                                        * 2106F

* refs (1): 21042
XEQORDER~1:
        :: DUP TOTEMPOB 3PICK CREATE SWAP rcl(nm)?;drop * 21074
          CODE                                   * 21097  74 nibbles
            GOSBVL  PopASavptr                   * 210A1
            C=DAT1  A                            * 210A8
            RSTK=C                               * 210AB
            CAEX    A                            * 210AD
            C=C-A   A                            * 210AF
            D=C     A                            * 210B1
            D0=A                                 * 210B3
            B=A     A                            * 210B6
            GOSBVL  SKIPOB                       * 210B8
            AD0EX                                * 210BF
            ABEX    A                            * 210C2
            C=D     A                            * 210C4
            GOSBVL  SUB_06863                    * 210C6
            GOSBVL  GETPTR                       * 210CD
            C=RSTK                               * 210D4
            DAT1=C  A                            * 210D6
            A=DAT0  A                            * 210D9
            D0=D0+  5                            * 210DC
            PC=(A)                               * 210DF
            BSS     8                            * 210E3  zeros
          ENDCODE                                * 210EB
          purge(_) ;                             * 210EB

* ->
* ROMPTR 002 15A CLVAR
* refs (1): 189EA
        CON(1)  8                                * 210F5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 210F6  library
        CON(3)  #15A                             * 210F9  command
xCLUSR:
        :: CK0 CONTEXT@ DUP SYSRRP? BEGIN 2DUP ITE LastNonNull LASTRAM-WORD * 210FC
          WHILE                                  * 2112E

PurgeNameOf(_):
          :: RAM-WORDNAME ?PURGE_HERE ; REPEAT 2DROP ; * 21133

* %  -> [InitMenu%] {} -> name -> Ob -> [@LIST InitMenu]
* ROMPTR 002 15B TMENU
* refs (1): 189EA
        CON(1)  8                                * 21156  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21157  library
        CON(3)  #15B                             * 2115A  command
xTMENU:
        :: CK1&Dispatch                          * 2115D
          BINT1 InitMenu%                        * 21167  real
          BINT0                                  * 21171  any

tmenu(#r):
          :: ChkForMenu(_) InitMenu ;            * 21176
        ;                                        * 2118A

* % -> menu ->
* ROMPTR 002 15C MENU
* refs (1): 189EA
        CON(1)  8                                * 2118F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21190  library
        CON(3)  #15C                             * 21193  command
xMENU:
        :: CK1 DUPTYPEREAL? case InitMenu%       * 21196
          '                                      * 211AF

* ID CST
* refs (1): 3BEBD
ID_CST:
          ID CST OBJ_2157E ' nCustomMenu InitMenu ; * 211B4

* -> x
* ROMPTR 002 15D RCLMENU
* refs (1): 189EA
        CON(1)  8                                * 211DA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 211DB  library
        CON(3)  #15D                             * 211DE  command
xRCLMENU:
        :: CK0 GetMenu% ;                        * 211E1

* nport -> {} mem
* ROMPTR 002 15E PVARS
* refs (1): 189EA
        CON(1)  8                                * 211F5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 211F6  library
        CON(3)  #15E                             * 211F9  command
xPVARS:
        :: CK1&Dispatch                          * 211FC
          BINT1                                  * 21206  real

pvars(r):
          :: COERCE DUP ~BINT33;#>;COLAcase SETPORTNOTAV * 2120B
            pvars(s) ;                           * 21224
        ;                                        * 2122E

* name ->
* ROMPTR 002 15F PGDIR
* refs (2): 189EA D2A18
        CON(1)  8                                * 21233  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21234  library
        CON(3)  #15F                             * 21237  command
xPGDIR:
        :: CK1&Dispatch                          * 2123A
          BINT6 XEQPGDIR                         * 21244  name
        ;                                        * 2124E

* :port:name -> :IO:name ->
* ROMPTR 002 160 ARCHIVE
* refs (1): 189EA
        CON(1)  8                                * 21253  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21254  library
        CON(3)  #160                             * 21257  command
xARCHIVE:
        :: CK1&Dispatch                          * 2125A
          BINT13 xARCHIVE~tagged                 * 21264  tagged
        ;                                        * 2126E

* refs (1): 21269
xARCHIVE~tagged:
        :: TAG>                                  * 21273

_IO_:
          $ "IO" OVER EQUALNOTcase archive(nm,st) * 2127D
          DROP CK&DISPATCH1                      * 2129A
          BINT3 XEQIOBACKUP                      * 212A4  string
          BINT6 XEQIOBACKUP                      * 212AE  name
          BINT7 XEQIOBACKUP                      * 212B8  local
        ;                                        * 212C2

* refs (1): 21295
archive(nm,st):
        ::                                       * 212C7

* refs (1): 21355
xRESTORE~1:
          ::                                     * 212CC

ChkName2:
            :: SWAP idntlamcase SWAP             * 212D1
              SETTYPEERR ;                       * 212E5
            palparse NOTcase SETTYPEERR          * 212EF
            DUPTYPEREAL? NOTcase SETTYPEERR      * 212FE
            COERCEDUP BINT33 #>case SETPORTNOTAV * 2130D
          ;                                      * 21321
          COLA archive(nm,s)                     * 21326
        ;                                        * 21330

* :port:name -> ob ->
* ROMPTR 002 161 RESTORE
* refs (1): 189EA
        CON(1)  8                                * 21335  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21336  library
        CON(3)  #161                             * 21339  command
xRESTORE:
        :: CK1&Dispatch                          * 2133C
          BINT13                                 * 21346  tagged

restore(to):
          :: TAG> xRESTORE~1 restore(nm,s) ;     * 2134B
          # 9F restore(bk)                       * 21364  backup
        ;                                        * 21373

* 1 ->
* ROMPTR 002 162 MERGE
* refs (1): 189EA
        CON(1)  8                                * 21378  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21379  library
        CON(3)  #162                             * 2137C  command
xMERGE:
        :: CK1&Dispatch                          * 2137F
          BINT1 merge(r)                         * 21389  real
        ;                                        * 21393

* refs (1): 2138E
merge(r):
        :: COERCE DUP#0=case SETPORTNOTAV        * 21398
          DUP #>2case SETPORTNOTAV               * 213AC
          COLA OBJ_0B40C                         * 213BB
        ;                                        * 213C5

* ROMPTR 002 163 FREE
* refs (1): 189EA
        CON(1)  8                                * 213CA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 213CB  library
        CON(3)  #163                             * 213CE  command
xFREE:
        :: CK2&Dispatch                          * 213D1
          BINT81 free(li,r)                      * 213DB  list real
          BINT97 free(2r)                        * 213E5  name real
          BINT113 free(2r)                       * 213EF  local real
          BINT17 free(2r)                        * 213F9  real real
        ;                                        * 21403

* refs (6): 213EA 213F4 213FE C097A C0993 C09AC
free(2r):
        :: SWAP ONE{}N SWAPCOLA free(li,r) ;     * 21408

* -> {title nlib nport ...}
* ROMPTR 002 164 LIBS
* refs (1): 189EA
        CON(1)  8                                * 21426  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21427  library
        CON(3)  #164                             * 2142A  command
xLIBS:
        :: CK0 libs ;                            * 2142D

* n -> :nport:n ->
* ROMPTR 002 165 ATTACH
* refs (1): 189EA
        CON(1)  8                                * 21441  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21442  library
        CON(3)  #165                             * 21445  command
xATTACH:
        :: CK1&Dispatch                          * 21448
          BINT1 attach(r)                        * 21452  real
        ;                                        * 2145C

* refs (1): 21457
attach(r):
        :: ChkNøLib(r) XEQSETLIB ;               * 21461

* n -> :port:n ->
* ROMPTR 002 166 DETACH
* refs (1): 189EA
        CON(1)  8                                * 21475  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21476  library
        CON(3)  #166                             * 21479  command
xDETACH:
        :: CK1&Dispatch                          * 2147C
          BINT1 detach(r)                        * 21486  real
        ;                                        * 21490

* refs (1): 2148B
detach(r):
        :: ChkNøLib(r) detach(s) ;               * 21495

* refs (2): 21466 2149A
ChkNøLib(r):
        :: COERCEDUP REALOBOB #<case SETSIZEERR  * 214A9
          DUP FSTMACROROM# #< ?SEMI              * 214C2
          DUP FSTMACROROM# #> ?SEMI              * 214D6
          SETSIZEERR ;                           * 214EA
        BSS     7                                * 214F4  zeros

* refs (1): 22638
~CK1;STRIPTAGS:
        :: CK1 STRIPTAGS ;                       * 214FB

* refs (2): 20CDC 8FCEB
sto(_,to):
        :: TAG> palparse ITE                     * 2150F
          :: DUPTYPEREAL? NOTcaseDROP COERCE     * 21523
            DUP BINT34 #< NOTcaseDROP '          * 21537
            ROMPTR 0F0 07E SWAP BINT2 ::N RDROPCOLA EVAL ; * 21550
          3DROP                                  * 21579

* refs (7): 211C1 2F696 40F4F 42EBD 852CE D45B5 ...
OBJ_2157E:
          :: ' xSTO COLA EvalNoCK                * 2157E
          ;                                      * 21597
        ;                                        * 2159C

* refs (2): 852BF 853CD
sto(bk,nm,s):
        :: BINT0 #=casedrop sto0(bk,nm)          * 215A1
          sto12(bk,nm,s) ;                       * 215B5

* refs (2): 20D45 20D54
sto(bk,r):
        :: COLA ROMPTR 0F0 080                   * 215BF
        ;                                        * 215D4

* refs (1): 21615
dup;BkpName(bk):
        :: DUP DNOTBAKcase                       * 215D9

SlibNum(lb):
          :: LIB># DROP ;                        * 215E8
          BAKNAME DROP ;                         * 215FC

* refs (3): 852F6 85300 8536E
~SWAPDROP;dup;BkpName(bk);TRUE:
        :: SWAPDROP dup;BkpName(bk) TRUE ;       * 2160B

* refs (1): 85337
DoBkpName(_);true:
        :: >BAK TRUE ;                           * 21624

* refs (8): 0F1E6 0F268 0FDEA 31994 31CDB 37D1E ...
dup;r?:dq/sk:
        :: DUPTYPEREAL? COLAcase ;               * 21638

* refs (4): 314DB 3500B 85378 85382
swap;false:
        :: SWAP FALSE ;                          * 2164C

* ob1 ob2 -> ob2 T
* refs (5): 0F209 239D9 26AFA 27101 271FC
SWAPDROPTRUE:
        :: SWAPDROP TRUE ;                       * 21660

* id ob -> bak
* refs (1): 21629
>BAK:
        :: SWAP ID>$ DUP NULL$? case SETTYPEERR  * 21674
          SPACE$ &$ $>ID SWAP ?>ROMPTR INHARDROM? IT TOTEMPOB * 21697
          TRUE BINT3 P{}N OB>BAKcode ;           * 216BF

* refs (1): 216CE
OB>BAKcode:
        CON(5)  (*)+5                            * 216D8  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 216DD
        A=DAT1  A                                * 216E4
        B=A     A                                * 216E7
        D0=A                                     * 216E9
        GOSBVL  SKIPOB                           * 216EC
        D0=D0-  5                                * 216F3
        C=B     A                                * 216F6
        CD0EX                                    * 216F8
        D=C     A                                * 216FB
        C=C-B   A                                * 216FD
        D0=D0+  5                                * 216FF
        DAT0=C  A                                * 21702
        D0=D0+  5                                * 21705
        A=0     A                                * 21708
        A=DAT0  B                                * 2170A
        A=A-1   B                                * 2170D
        DAT0=A  B                                * 21710
        C=A     B                                * 21713
        A=A+1   B                                * 21716
        A=A+A   A                                * 21719
        CD0EX                                    * 2171B
        C=C+A   A                                * 2171E
        CD0EX                                    * 21720
        DAT0=C  B                                * 21723
        A=B     A                                * 21726
        D0=A                                     * 21728
        LC(5)   DOBAK                            * 2172B
        DAT0=C  A                                * 21732
        C=D     A                                * 21735
        D1=C                                     * 21737
        C=0     A                                * 2173A
        DAT1=C  A                                * 2173C
        D1=D1-  5                                * 2173F
        LC(5)   DOBINT                           * 21742
        DAT1=C  A                                * 21749
        D1=D1+  6                                * 2174C
        GOSBVL  CKLBCRC                          * 2174F
        DAT1=A  4                                * 21756
        GOVLNG  GETPTRLOOP                       * 2175A
        RPL

* refs (3): 1CE91 1EEF6 20B4F
rcl(to):
        :: TRUE ROMPTR 0F0 081 ROMPTR 0F0 091 xRCL ; * 21761

* refs (2): 85483 854F1
OBJ_2178B:
        :: RSKIP 'RRDROP COLA EvalNoCK           * 2178B
        ;                                        * 217A4

* refs (3): 854B5 854C9 854E2
OBJ_217A9:
        :: 'RRDROP 'R RSKIP COLA_EVAL ;          * 217A9

* refs (1): 1A3E1
eval(to):
        :: TRUE ROMPTR 0F0 081 ROMPTR 0F0 08C xEVAL ; * 217C7

* refs (2): 20F0D 8FCF0
purge(to):
        :: FALSE ROMPTR 0F0 081 ROMPTR 0F0 08E xPURGE ; * 217F1

* refs (1): 40F77
OBJ_2181B:
        :: ' xPURGE COLA EvalNoCK                * 2181B
        ;                                        * 21834

* refs (1): 21224
pvars(s):
        :: DUP pvars->s {}N SWAP BINT0 #=casedrop * 21839
          :: 'EvalNoCK:_sup xMEM ;               * 2185C
          DUP PORTSTATUS 5ROLL NOTcase SETPORTNOTAV * 21870
          4ROLL NOTcase                          * 21889

4dropn;_ROM_:
          :: 4DROP                               * 21893

_ROM_:
            $ "ROM" ;                            * 2189D
          ROT case                               * 218B2

3dropn;_SYSRAM_:
          :: 3DROP                               * 218BC

_SYSRAM_:
            $ "SYSRAM" ;                         * 218C6
          ROT PORTEND SWAP #- #- UNCOERCE %2 %/ ; * 218E1

* refs (1): 21843
pvars->s:
        :: GetBVars pvars(s,B) ;                 * 2190E

* refs (2): 21913 3F6F1
GetBVars:
        :: DUP DUP#0=csedrp                      * 21922

RclPort0:
          :: AdrPort0 RclPortFrom(adr) ; PORTSTATUS SWAPDROP 4UNROLL * 21931
          SWAPDROP NOTAND NOTcasedrop BINT0      * 21954
          RclPortFrom(adr) ;                     * 21968

* refs (2): 2193B 21968
RclPortFrom(adr):
        :: ZEROSWAP BEGIN NEXTLIBBAK WHILE       * 21972

rot;1+(s);swap:
          :: ROT#1+ SWAP ; REPEAT ;              * 2198B

* refs (2): 21918 3F6FB
pvars(s,B):
        :: DUP#2+ ROLL OVER#0= caseDROP #>$      * 219A9
          OVER ZERO_DO ROT                       * 219C7
          :: OBJ_71BB6                           * 219D6

LibNum(lb):
            :: LIB># DROP UNCOERCE ; BAKNAME DROP ; * 219E0
          OVER >TAG 3pick;2+(s) UNROLL LOOP DROP ; * 21A08
        BSS     30                               * 21A2B

* refs (1): 2132B
archive(nm,s):
        :: BINT0 #=casedrop archive0(s)          * 21A49
          2DUP RclBkp12(nm,s)? case SETOBINUSE   * 21A5D
          OVER HomeInBkp(nm) 3UNROLL ERRSET sto12(bk,nm,s) ERRTRAP * 21A71

* refs (1): 21AE4
archive0(s)~1:
          :: OBJ_09699 InitEnab ERRJMP ; OBJ_09699 InitEnab ; * 21A8F

* refs (1): 21A58
archive0(s):
        :: DUP RclBkp0(nm)? case SETOBINUSE      * 21AB7
          HomeInBkp(nm) ERRSET sto0!(bk) ERRTRAP archive0(s)~1 OBJ_09699 * 21AD0
          InitEnab ;                             * 21AEE

* refs (1): 2135A
restore(nm,s):
        ::                                       * 21AF8

RclBkp(nm,s)?:
          :: BINT0 #=casedrop RclBkp0(nm)?       * 21AFD
            RclBkp12(nm,s)? ;                    * 21B11
          NOTcase SETNONEXTERR                   * 21B1B
          OBJ_71BB6 SETTYPEERR                   * 21B25

* refs (1): 2136E
restore(bk):
          :: COLA ROMPTR 0F0 084                 * 21B2F
          ;                                      * 21B44
        ;                                        * 21B49

* ->
* refs (2): 8556E 85578
DOAPWL:
        CON(5)  (*)+5                            * 21B4E  primitive code object
        ASSEMBLE
        GOVLNG  Warmstart                        * 21B53
        RPL

* refs (3): 212A9 212B3 212BD
XEQIOBACKUP:
        :: COLA ROMPTR 0F0 085                   * 21B5A
        ;                                        * 21B6F

* refs (3): 213E0 2141C C0961
free(li,r):
        :: COLA ROMPTR 0F0 086                   * 21B74
        ;                                        * 21B89

* refs (1): 856D7
free(li,r)~8:
        :: #1-SWAP DUP RclBkp0(nm)? NOTcase SETNONEXTERR * 21B8E
          SWAP dvarlsBIND pshm1 DUP#0= case ABND * 21BAC
          pshzer BEGIN #1-SWAP 1GETLAM OVER EQUAL ITE * 21BCA
          :: DROP rot OVER MEMSKIP 1GETLAM SWAP RclBkp(nm,adr)? NOTcase * 21BED
            SETNONEXTERR                         * 21C1A
            SWAP#1+ unrot ;                      * 21C1F
          psh1&                                  * 21C2E
          #0=UNTIL DROP ABND ;                   * 21C33

* ob -> #nextaddress
* refs (1): 21C01
MEMSKIP:
        CON(5)  (*)+5                            * 21C47  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 21C4C
        D1=D1+  5                                * 21C4F
        D=D+1   A                                * 21C52
        GOSBVL  SAVPTR                           * 21C54
        D0=A                                     * 21C5B
        GOSBVL  SKIPOB                           * 21C5E
        AD0EX                                    * 21C65
        GOVLNG  PUSH#ALOOP                       * 21C68
        RPL

* % ->
* refs (1): 2146B
XEQSETLIB:
        :: CONTEXT@ DUP SYSRRP? casedrop         * 21C6F

HomeAttach(s):
          :: DUP ONSRRP? ITE DROP TOSRRP         * 21C88
          ;                                      * 21CA6
          SWAP SETROMPART ;                      * 21CAB

* refs (1): 21CB0
SETROMPART:
        CON(5)  (*)+5                            * 21CBA  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 21CBF
        C=DAT1  A                                * 21CC6
        D1=D1+  5                                * 21CC9
        D=D+1   A                                * 21CCC
        CD1EX                                    * 21CCE
        D1=D1+  5                                * 21CD1
        DAT1=A  X                                * 21CD4
        D1=C                                     * 21CD8
        A=DAT0  A                                * 21CDB
        D0=D0+  5                                * 21CDE
        PC=(A)                                   * 21CE1
        RPL

* refs (1): 2149F
detach(s):
        :: CONTEXT@ DUP SYSRRP? casedrop OFFSRRP * 21CE5
          DUP ROMPART NOTcase2DROP ROT           * 21D03
          #<> caseDROP DetachLib(di)             * 21D17
        ;                                        * 21D26

* refs (1): 21D21
DetachLib(di):
        CON(5)  (*)+5                            * 21D2B  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 21D30
        D1=D1+  5                                * 21D33
        D=D+1   A                                * 21D36
        AD1EX                                    * 21D38
        D1=D1+  5                                * 21D3B
        LC(3)   #7FF                             * 21D3E
        DAT1=C  X                                * 21D43
        D1=A                                     * 21D47
        A=DAT0  A                                * 21D4A
        D0=D0+  5                                * 21D4D
        PC=(A)                                   * 21D50
        RPL

* refs (1): 21437
libs:
        :: CONTEXT@                              * 21D54

* refs (2): 3F3ED 3F41A
GetLibs(di):
          :: COLA ROMPTR 0F0 087                 * 21D5E
          ;                                      * 21D73
          BINT0 #=casedrop NULL{}                * 21D78
          ROMPTR 0F0 090 {}N ;                   * 21D87
        FILLTO  #21DBE                           * 21D9C  34 zero nibbles: the next entry stays at #21DBE

* refs (2): 1B194 1B19E
rpnXROOT~1:
        :: ' rpnXROOT BINT2 TRUE ROMPTR 0E8 00F ; * 21DBE

        # 80000                                  * 21DE7  524288

* refs (3): 20B05 20BEA 854A1
dup;ListOfNames?:dq/sk:
        :: DUPTYPELIST? NOTcase SKIP             * 21DF1
          DUPNULLCOMP? case SKIP                 * 21E05
          BINT5 NEXTCOMPOB DROP BEGIN DUPTYPEIDNT? SWAP TYPELAM? OR NOTcase * 21E14
          :: DROPRDROP COLASKIP ;                * 21E41
          NEXTCOMPOB NOT UNTIL COLACOLA ;        * 21E55

* $ -> 1 -> $rest 0
* ROMPTR 002 167 XMIT
* refs (1): 189EA
        CON(1)  8                                * 21E6E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21E6F  library
        CON(3)  #167                             * 21E72  command
xXMIT:
        :: CK1&Dispatch                          * 21E75
          BINT3 DOXMIT                           * 21E7F  string
        ;                                        * 21E89

* n -> $ 0/1
* ROMPTR 002 168 SRECV
* refs (1): 189EA
        CON(1)  8                                * 21E8E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21E8F  library
        CON(3)  #168                             * 21E92  command
xSRECV:
        :: CK1&Dispatch                          * 21E95
          BINT1 DOSRECV                          * 21E9F  real
        ;                                        * 21EA9

* ->
* ROMPTR 002 169 OPENIO
* refs (1): 189EA
        CON(1)  8                                * 21EAE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21EAF  library
        CON(3)  #169                             * 21EB2  command
xOPENIO:
        :: CK0 DOOPENIO OpenIO_324C8 ;           * 21EB5

* ->
* ROMPTR 002 16A CLOSEIO
* refs (1): 189EA
        CON(1)  8                                * 21ECE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21ECF  library
        CON(3)  #16A                             * 21ED2  command
xCLOSEIO:
        :: CK0 CLOSEUART ;                       * 21ED5

* name -> {names} -> {{old new}...} ->
* ROMPTR 002 16B SEND
* refs (1): 189EA
        CON(1)  8                                * 21EE9  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21EEA  library
        CON(3)  #16B                             * 21EED  command
xSEND:
        :: CK1&Dispatch                          * 21EF0
          BINT6 SENDNAME                         * 21EFA  name
          BINT7 SENDNAME                         * 21F04  local
          BINT5 SENDLIST                         * 21F0E  list
        ;                                        * 21F18

* name -> "name" -> {names} -> {{old new}...} ->
* ROMPTR 002 16C KGET
* refs (1): 189EA
        CON(1)  8                                * 21F1D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21F1E  library
        CON(3)  #16C                             * 21F21  command
xKGET:
        :: CK1&Dispatch                          * 21F24
          BINT6 GETNAME                          * 21F2E  name
          BINT7 GETNAME                          * 21F38  local
          BINT3 GETNAME                          * 21F42  string
          BINT5 kget(li)                         * 21F4C  list
        ;                                        * 21F56

* name -> $name ->
* ROMPTR 002 16D RECN
* refs (1): 189EA
        CON(1)  8                                * 21F5B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21F5C  library
        CON(3)  #16D                             * 21F5F  command
xRECN:
        :: CK1&Dispatch                          * 21F62
          BINT6 DORECN                           * 21F6C  name
          BINT7 DORECN                           * 21F76  local
          BINT3 DORECN                           * 21F80  string
        ;                                        * 21F8A

* ->
* ROMPTR 002 16E RECV
* refs (1): 189EA
        CON(1)  8                                * 21F8F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21F90  library
        CON(3)  #16E                             * 21F93  command
xRECV:
        :: CK0 NULL$TEMP DORECN ;                * 21F96

* ->
* ROMPTR 002 16F FINISH
* refs (1): 189EA
        CON(1)  8                                * 21FAF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21FB0  library
        CON(3)  #16F                             * 21FB3  command
xFINISH:
        :: CK0 DOFINISH ;                        * 21FB6

* ->
* ROMPTR 002 170 SERVER
* refs (2): 189EA 3DEEF
        CON(1)  8                                * 21FCA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21FCB  library
        CON(3)  #170                             * 21FCE  command
xSERVER:
        :: CK0 DOSERVER ;                        * 21FD1

* n_type ->
* ROMPTR 002 171 CKSM
* refs (1): 189EA
        CON(1)  8                                * 21FE5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21FE6  library
        CON(3)  #171                             * 21FE9  command
xCKSM:
        :: CK1&Dispatch                          * 21FEC
          BINT1 DOCKSM                           * 21FF6  real
        ;                                        * 22000
