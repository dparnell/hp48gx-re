* HP 48GX ROM revision R, #5D01D-#6001B: Symbolic algebra
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: psh top& pshtop& #1-SWAP SWAPDROP#1- pshm1 addt: NOTcaseFALSE rot dup unrot larg
* Follows on from the previous file (at #5D01D in the original ROM).
        RPL

* refs (2): 5CFFA 5D00E
OBJ_5D01D:
        :: 'R RDROP dvarlsBIND BEGIN             * 5D01D
          :: 1GETLAM EVAL ; BINT1 ~DUP#1+PICK;#+;#1+ ~DUP#1+PICK;#+;#1+ PICK * 5D036
          #0<> WHILE                             * 5D05E
          :: top& psh DUP #2+ BINT1 splitdown DROP #1- tailpsh rotswap top& * 5D068
            larg ;                               * 5D0A4
          REPEAT ABND RDROP ;                    * 5D0AE

* meta -> meta'
* refs (6): 5ACD1 5D176 83919 840A3 841E3 844B3
forceadd:
        :: M1st+case OBJ_5D167                   * 5D0C2
          M1st-case OBJ_5D0EA                    * 5D0D1
          M1stNEGcase forceadd~1                 * 5D0DB
        ;                                        * 5D0E5

* refs (2): 5D0D6 5D130
OBJ_5D0EA:
        :: SWAPDROP#1- metaneg ~addt:;x+ COLA OBJ_5D167 * 5D0EA
        ;                                        * 5D108

* refs (1): 5D0E0
forceadd~1:
        :: 3PICK REQcasedrop x+                  * 5D10D
          :: ~SWAPDROP#1-;COLA;[f(X,Y)]=>[-X-Y]! COLA OBJ_5D0EA * 5D121
          ;                                      * 5D135
          REQcasedrop x-                         * 5D13A
          :: ~SWAPDROP#1-;COLA;[f(X,Y)]=>[-X+Y]! COLA OBJ_5D167 * 5D144
          ;                                      * 5D158
          DROP ;                                 * 5D15D

* refs (3): 5D0CC 5D103 5D153
OBJ_5D167:
        :: SWAPDROP#1- larg forceadd OVER' x+ EQIT * 5D167
          :: plDRPpZparg meta+ pshtop& ; top& ~addt:;x+ ; * 5D18A

* refs (5): 5D261 839BE 840B2 84355 844A9
OBJ_5D1B2:
        :: M1st+case OBJ_5D257                   * 5D1B2
          M1st-case OBJ_5D234                    * 5D1C1
          M1stNEGcase OBJ_5D1DA                  * 5D1CB
        ;                                        * 5D1D5

* refs (1): 5D1D0
OBJ_5D1DA:
        :: 3PICK REQcasedrop x+                  * 5D1DA
          :: ~SWAPDROP#1-;COLA;[f(X,Y)]=>[-X-Y]! COLA OBJ_5D234 * 5D1EE
          ;                                      * 5D202
          REQcasedrop x-                         * 5D207
          :: ~SWAPDROP#1-;COLA;[f(X,Y)]=>[-X+Y]! COLA OBJ_5D257 * 5D211
          ;                                      * 5D225
          DROP ;                                 * 5D22A

* refs (2): 5D1C6 5D1FD
OBJ_5D234:
        :: SWAPDROP#1- metaneg ~addt:;x+ COLA OBJ_5D257 * 5D234
        ;                                        * 5D252

* refs (3): 5D1BC 5D220 5D24D
OBJ_5D257:
        :: plDRPpZparg OBJ_5D1B2 OVER' x+ EQIT   * 5D257
          :: SWAPDROP#1- pshtop& meta+ pshzer ; pshtop& ~addt:;x+ ; * 5D275

* refs (1): 5D7AE
OBJ_5D2A2:
        :: SWAPDROP#1- metaneg ~addt:;x+ COLA ROMPTR 0F0 055 * 5D2A2
        ;                                        * 5D2C6

* refs (2): 840A8 844B8
OBJ_5D2CB:
        :: M1st+case                             * 5D2CB
          :: #1-SWAP pshm1 pshzerpsharg unrot ;  * 5D2D5
          pshzer pshzer ;                        * 5D2F3

* refs (2): 840B7 844C2
OBJ_5D302:
        :: M1st+case                             * 5D302
          :: #1-SWAP pshm1 pshzerpsharg rotswap ; * 5D30C
          pshzer pshzer ;                        * 5D32A

* refs (5): 5D3ED 838EC 840F8 8429C 8454E
OBJ_5D339:
        :: M1st*case OBJ_5D3DE                   * 5D339
          M1st/case OBJ_5D361                    * 5D348
          M1stINVcase OBJ_5D384                  * 5D352
        ;                                        * 5D35C

* refs (2): 5D34D 5D3A7
OBJ_5D361:
        :: SWAPDROP#1- metainv addt* COLA OBJ_5D3DE * 5D361
        ;                                        * 5D37F

* refs (1): 5D357
OBJ_5D384:
        :: 3PICK REQcasedrop x*                  * 5D384
          :: ~SWAPDROP#1-;COLA;[f(X,Y)]=>[INV(X)/Y]! COLA OBJ_5D361 * 5D398
          ;                                      * 5D3AC
          REQcasedrop x/                         * 5D3B1
          :: ~SWAPDROP#1-;COLA;[f(X,Y)]=>[INV(X)*Y]! COLA OBJ_5D3DE * 5D3BB
          ;                                      * 5D3CF
          DROP ;                                 * 5D3D4

* refs (3): 5D343 5D37A 5D3CA
OBJ_5D3DE:
        :: SWAPDROP#1- larg OBJ_5D339 OVER' x* EQIT * 5D3DE
          :: plDRPpZparg meta* pshtop& ; top& addt* ; * 5D401

* refs (5): 5D4D8 83987 84107 8440E 84544
OBJ_5D429:
        :: M1st*case OBJ_5D4CE                   * 5D429
          M1st/case OBJ_5D4AB                    * 5D438
          M1stINVcase OBJ_5D451                  * 5D442
        ;                                        * 5D44C

* refs (1): 5D447
OBJ_5D451:
        :: 3PICK REQcasedrop x*                  * 5D451
          :: ~SWAPDROP#1-;COLA;[f(X,Y)]=>[INV(X)/Y]! COLA OBJ_5D4AB * 5D465
          ;                                      * 5D479
          REQcasedrop x/                         * 5D47E
          :: ~SWAPDROP#1-;COLA;[f(X,Y)]=>[INV(X)*Y]! COLA OBJ_5D4CE * 5D488
          ;                                      * 5D49C
          DROP ;                                 * 5D4A1

* refs (2): 5D43D 5D474
OBJ_5D4AB:
        :: SWAPDROP#1- metainv addt* COLA OBJ_5D4CE * 5D4AB
        ;                                        * 5D4C9

* refs (3): 5D433 5D497 5D4C4
OBJ_5D4CE:
        :: plDRPpZparg OBJ_5D429 OVER' x* EQIT   * 5D4CE
          :: SWAPDROP#1- pshtop& meta* pshzer ; pshtop& addt* ; * 5D4EC

* refs (1): 5D809
OBJ_5D519:
        :: SWAPDROP#1- metainv addt* COLA ROMPTR 0F0 056 * 5D519
        ;                                        * 5D53D

* refs (2): 840FD 84553
OBJ_5D542:
        :: M1st*case                             * 5D542
          :: #1-SWAP pshm1 pshzerpsharg unrot ;  * 5D54C
          pshzer pshzer ;                        * 5D56A

* refs (2): 8410C 8455D
OBJ_5D579:
        :: M1st*case                             * 5D579
          :: #1-SWAP pshm1 pshzerpsharg rotswap ; * 5D583
          pshzer pshzer ;                        * 5D5A1

* refs (3): 5D6EA 5D75D 5D877
OBJ_5D5B0:
        :: DUP#0=case FALSE                      * 5D5B0
          DUP#2+ BINT1 BEGIN splitdown OVER #2+PICK 1GETLAM EQcasedrop * 5D5BF
          OBJ_5D62D                              * 5D5E7
          2GETLAM EQcasedrop OBJ_5D62D           * 5D5EC
          REQcasedrop x=                         * 5D5FB
          OBJ_5D62D 2DROP BINT2 #=casedrop RDROPFALSE * 5D605
          BINT1 AGAIN ;                          * 5D61E

* refs (3): 5D5E7 5D5F6 5D605
OBJ_5D62D:
        :: 3GETLAM #=casedrop COLATRUE           * 5D62D
          DROP BINT2 #=casedrop RDROPFALSE       * 5D641
          BINT1 AGAIN ;                          * 5D655

* refs (2): 5D7BD 5D818
OBJ_5D664:
        :: BINT1 'R'R                            * 5D664

* refs (4): 5D730 5D86D 5D935 5DA0C
OBJ_5D673:
          ::                                     * 5D673
            {                                    * 5D678

Π'which:
              LAM 'which                         * 5D67D

Π'op1:
              LAM 'op1                           * 5D690

Π'op2:
              LAM 'op2 }                         * 5D69F
            BIND ;                               * 5D6B3
          3PICK 2GETLAM EQcasedrop pullpsh1&     * 5D6BD
          1GETLAM EQcasedrop pullpsh1&           * 5D6D1
          DROP psh OBJ_5D5B0 NOTcase             * 5D6E0

swapB;B2[n]=>B1[1]:
          :: psh pullpsh1& ;                     * 5D6F4
          #1- tailpsh rotswap top& ;             * 5D708

* refs (2): 84152 8417A
OBJ_5D721:
        :: BINT2 'R'R OBJ_5D673 pargop 2GETLAM MEQ1stcase overev& * 5D721
          1GETLAM MEQ1stcase overev&             * 5D749
          rot OBJ_5D5B0 NOTcase psh&             * 5D758
          SWAP#1+ overev& #1-SWAP #1- tailpsh rotswap top& ; * 5D76C

* refs (2): 5C6A5 5C6AF
OBJ_5D794:
        ::                                       * 5D794

* refs (1): 84148
OBJ_5D799:
          :: M1st+case ROMPTR 0F0 055            * 5D799
            OBJ_5D2A2 ;                          * 5D7AE
          rotswap OBJ_5D664 x+ x-                * 5D7B8

* refs (3): 5D827 84161 84189
OBJ_5D7CC:
          :: ABND rotswap top& larg ; ;          * 5D7CC

* refs (2): 5C6B9 5C6C3
OBJ_5D7EF:
        ::                                       * 5D7EF

* refs (1): 84170
OBJ_5D7F4:
          :: M1st*case ROMPTR 0F0 056            * 5D7F4
            OBJ_5D519 ;                          * 5D809
          rotswap OBJ_5D664 x* x/ OBJ_5D7CC ;    * 5D813

* refs (2): 84198 84251
OBJ_5D831:
        :: BINT2 COLA OBJ_5D863                  * 5D831
        ;                                        * 5D845

* refs (2): 8430A 843C3
OBJ_5D84A:
        :: BINT1 COLA OBJ_5D863                  * 5D84A
        ;                                        * 5D85E

* refs (2): 5D840 5D859
OBJ_5D863:
        :: 'R'R OBJ_5D673 rot OBJ_5D5B0 ABND NOTcase * 5D863
          :: unrot FALSE ;                       * 5D886
          #1- tailpsh psh over& over& psh larg TRUE ; * 5D89A

* refs (2): 841CF 84288
OBJ_5D8C7:
        :: RDUP 'R'R RDROP 4PICK EQ SWAP 4PICK EQ SWAP OR case OBJ_5D926 * 5D8C7
          RDROP 1GETABND SWAP#1+ top& larg& ;    * 5D908

* refs (1): 5D903
OBJ_5D926:
        :: BINT0 'R'R OBJ_5D673 pshzer pshzer BEGIN 1GETLAM 3PICK EQ 2GETLAM * 5D926
          4PICK EQ OR WHILE                      * 5D95D
          :: overev& pargop ; REPEAT pshtop& ABND ; * 5D971

* refs (2): 84341 843FA
OBJ_5D999:
        :: RDUP 'R'R RDROP 4PICK EQ SWAP 4PICK EQ SWAP OR case OBJ_5D9FD * 5D999
          psh RDROP 1GETABND SWAP#1+ top& larg& ; * 5D9DA

* refs (1): 5D9D5
OBJ_5D9FD:
        :: BINT0 'R'R OBJ_5D673 pshzer pshzer BEGIN 1GETLAM 3PICK EQ 2GETLAM * 5D9FD
          4PICK EQ OR WHILE                      * 5DA34
          :: overev& #1-SWAP pshm1 ; REPEAT pshtop& ABND ; * 5DA48

* refs (2): 841FC 8422E
OBJ_5DA75:
        :: 1GETLAM ' x+ EQ ?SKIP [X]=>[NEG(X)]!  * 5DA75
          pshtop& pargop meta+ overev& psh 1GETABND ' x+ EQ ?SKIP addtNEG * 5DA98
        ;                                        * 5DACF

* refs (2): 842B5 842E7
OBJ_5DAD4:
        :: 1GETLAM ' x* EQ ?SKIP [X]=>[INV(X)]!  * 5DAD4
          pshtop& pargop meta* overev& psh 1GETABND ' x* EQ ?SKIP addtINV * 5DAF7
        ;                                        * 5DB2E

* refs (2): 841AC 84265
OBJ_5DB33:
        :: pargop psh 4roll top& unrot ;         * 5DB33

* refs (2): 8436E 843B4
OBJ_5DB56:
        :: 1GETABND ' x+ EQ ?SKIP [X]=>[NEG(X)]! * 5DB56
          rot dup rotswap BEGIN DUP#0<>WHILE     * 5DB79
          :: OVER ' x- EQ IT                     * 5DB92
            :: psh [X]=>[NEG(X)]! psh ;          * 5DBB0
            SWAPDROP#1- ;                        * 5DBC9
          REPEAT DROP meta+ psh over& over& rot top& psh larg ; * 5DBD3

* refs (2): 84427 8446D
OBJ_5DC0A:
        :: 1GETABND ' x* EQ ?SKIP [X]=>[INV(X)]! * 5DC0A
          rot dup rotswap BEGIN DUP#0<>WHILE     * 5DC2D
          :: OVER ' x/ EQ IT                     * 5DC46
            :: psh [X]=>[INV(X)]! psh ;          * 5DC64
            SWAPDROP#1- ;                        * 5DC7D
          REPEAT DROP meta* psh over& over& rot top& psh larg ; * 5DC87

* refs (2): 8431E 843D7
OBJ_5DCBE:
        :: #1-SWAP BINT1 4roll top& unrot larg over& ; * 5DCBE

* refs (1): 5C835
OBJ_5DCEB:
        :: ROMPTR 0F0 062 rot top& overev& top& meta- ; * 5DCEB

* refs (1): 5C83F
OBJ_5DD19:
        :: ROMPTR 0F0 062 overev& top& pshtop& meta+ ; * 5DD19

* refs (3): 847F1 84869 84A99
{2,^,-,û,I}:
        { %2 x^ x- xSQRT xi }                    * 5DD42

* meta1 meta2 -> meta1&ob meta2&ob
* refs (2): 846CF 84724
2psh1&rev::
        :: 'R SWAP#1+ OVER psh1&rev ;            * 5DD65

* refs (3): 5DDA6 8467A 846A7
Addi*[_]:
        :: PTR addt2: xi x* ;                    * 5DD83

* refs (3): 846C0 84715 84760
Addã180/*i[_]:
        :: Addã180/*[_] Addi*[_] ;               * 5DD9C

* refs (1): 5DDA1
Addã180/*[_]:
        :: RAD? ?SEMI                            * 5DDB0
          PTR addt: xPI DEG? %180 %200 RPITE SWAP#1+ PTR addt2: * 5DDBF
          x/ x* ;                                * 5DDE7

* refs (7): 84675 84823 848A0 84936 8494A 8498B ...
Add180ã/*[_]:
        :: RAD? ?SEMI                            * 5DDF6
          DEG? %180 %200 RPITE SWAP#1+           * 5DE05

{PI,/,*}:
          { xPI x/ x* }                          * 5DE1E
          INNERtop& ;                            * 5DE37

* -> T
* refs (3): 5D63C 634ED B978E
COLATRUE:
        :: TRUE RDROP ;                          * 5DE41

* -> F
* refs (6): 2F646 5AD26 5D619 5D650 5FB53 635A6
RDROPFALSE:
        :: FALSE RDROP ;                         * 5DE55
        BSS     20                               * 5DE69

* 1..n #n -> n..1 #n
* refs (4): 45119 465B3 9FDBF C1E92
reversym:
        :: DUP#0= ?SEMI                          * 5DE7D
          pshzer DUP#0_DO pullrev1& LOOP DROP ;  * 5DE8C

* refs (1): 58F85
dup;ex?:
        :: DUPTYPESYMB? ;                        * 5DEAA

* refs (1): 1F762
xFCNAPPLY~program~1:
        :: OBJ_5DEEB ARGNUMERR INVFUNCERR ;      * 5DEB9

        :: OBJ_5DEF7 ARGNUMERR INVFUNCERR ;      * 5DED2

* refs (1): 5DEBE
OBJ_5DEEB:
        CON(5)  (*)+5                            * 5DEEB  primitive code object
        ASSEMBLE
        ST=1    2                                * 5DEF0
        GOTO    L_5DEFF                          * 5DEF3

* refs (3): 56DDD 58E90 5DED7
OBJ_5DEF7:
        CON(5)  (*)+5                            * 5DEF7  primitive code object
        ST=0    2                                * 5DEFC
L_5DEFF:
        C=DAT1  A                                * 5DEFF
        CD1EX                                    * 5DF02
        RSTK=C                                   * 5DF05
        A=DAT1  15                               * 5DF07
        P=      10                               * 5DF0B
        LC(5)   xALG->                           * 5DF0D
        P=      5                                * 5DF14
        LC(5)   x<<                              * 5DF16
        P=      0                                * 5DF1D
        LC(5)   DOCOL                            * 5DF1F
        P=      14                               * 5DF26
        ?C=A    WP                               * 5DF28
        GOYES   L_5DF4A                          * 5DF2B
        ?ST=1   2                                * 5DF2D
        GOYES   L_5DF36                          * 5DF30
        GOTO    L_5DFC9                          * 5DF32
L_5DF36:
        P=      10                               * 5DF36
        LC(5)   xRPN->                           * 5DF38
        P=      14                               * 5DF3F
        ?C=A    WP                               * 5DF41
        GOYES   L_5DF4A                          * 5DF44
        GOTO    L_5DFC9                          * 5DF46
L_5DF4A:
        P=      0                                * 5DF4A
        C=0     A                                * 5DF4C
        R0=C                                     * 5DF4E
        D1=D1+  15                               * 5DF51
L_5DF54:
        A=DAT1  A                                * 5DF54
        LC(5)   DOSYMB                           * 5DF57
        ?C=A    A                                * 5DF5E
        GOYES   L_5DFDD                          * 5DF61
        LC(5)   x<<                              * 5DF63
        ?C=A    A                                * 5DF6A
        GOYES   L_5DFDD                          * 5DF6D
        LC(5)   DOLAM                            * 5DF6F
        ?C#A    A                                * 5DF76
        GOYES   L_5DF9B                          * 5DF79
        A=R0                                     * 5DF7B
        A=A+1   A                                * 5DF7E
        R0=A                                     * 5DF80
        A=0     A                                * 5DF83
        D1=D1+  5                                * 5DF85
        A=DAT1  B                                * 5DF88
        A=A+A   A                                * 5DF8B
        D1=D1+  2                                * 5DF8D
        CD1EX                                    * 5DF90
        C=C+A   A                                * 5DF93
        D1=C                                     * 5DF95
        GONC    L_5DF54                          * 5DF98
L_5DF9B:
        D1=D1+  5                                * 5DF9B
        AD1EX                                    * 5DF9E
        C=DAT1  A                                * 5DFA1
        D1=(5)  DOSYMB                           * 5DFA4
        AD1EX                                    * 5DFAB
        ?C=A    A                                * 5DFAE
        GOYES   L_5DFFB                          * 5DFB1
        A=R0                                     * 5DFB3
        A=A+1   A                                * 5DFB6
        R0=A                                     * 5DFB8
        A=C     A                                * 5DFBB
        LC(5)   DOLAM                            * 5DFBD
        ?C=A    A                                * 5DFC4
        GOYES   L_5DF54                          * 5DFC7
L_5DFC9:
        C=RSTK                                   * 5DFC9
        D1=C                                     * 5DFCB
L_5DFCE:
        P=      0                                * 5DFCE
        LC(5)   skipcola                         * 5DFD0
        A=C     A                                * 5DFD7
        PC=(A)                                   * 5DFD9
L_5DFDD:
        ?ST=1   2                                * 5DFDD
        GOYES   L_5DFFB                          * 5DFE0
        CD0EX                                    * 5DFE2
        CD1EX                                    * 5DFE5
        CD0EX                                    * 5DFE8
        GOSBVL  SKIPOB                           * 5DFEB
        CD0EX                                    * 5DFF2
        CD1EX                                    * 5DFF5
        CD0EX                                    * 5DFF8
L_5DFFB:
        P=      0                                * 5DFFB
        A=DAT1  10                               * 5DFFD
        C=RSTK                                   * 5E001
        D1=C                                     * 5E003
        ?ST=1   2                                * 5E006
        GOYES   L_5E024                          * 5E009
        P=      5                                * 5E00B
        LC(5)   SEMI                             * 5E00D
        P=      0                                * 5E014
        LC(5)   x>>                              * 5E016
        P=      9                                * 5E01D
        ?C#A    WP                               * 5E01F
        GOYES   L_5DFCE                          * 5E022
L_5E024:
        P=      0                                * 5E024
        LC(5)   TEMPENV                          * 5E026
        CD1EX                                    * 5E02D
        A=DAT1  A                                * 5E030
        D1=A                                     * 5E033
        D1=D1+  15                               * 5E036
        A=DAT1  A                                * 5E039
        D1=A                                     * 5E03C
        D1=D1+  5                                * 5E03F
        A=DAT1  A                                * 5E042
        D1=C                                     * 5E045
        C=R0                                     * 5E048
        ?C#A    A                                * 5E04B
        GOYES   L_5E05A                          * 5E04E
        LC(5)   OBJ_22F3B                        * 5E050
        GONC    L_5E061                          * 5E057
L_5E05A:
        LC(5)   COLA                             * 5E05A
L_5E061:
        A=C     A                                * 5E061
        PC=(A)                                   * 5E063
        RPL

* sym -> meta ob -> ob #1
* refs (24): 1F547 1F8D4 2812E 547BF 54986 54E02 ...
SINNER:
        :: DUPTYPESYMB? ITE INNERCOMP BINT1      * 5E067
        ;                                        * 5E080

* meta -> ob
* refs (22): 1CF4C 1CF56 1CF65 1F54C 1F91A 27652 ...
CKSYMBN:
        :: BINT1 OVER#=case DROPSYM              * 5E085
          SYMBN ;                                * 5E099

* ob1..obn #n -> sym
* refs (3): 0F133 27657 282C3
PSYMBN:
        :: ERRSET SYMBN ERRTRAP ~NULLSYMB;COLA;prepend(_,s,cp) ; * 5E0A3

* refs (1): 5E0B7
~NULLSYMB;COLA;prepend(_,s,cp):
        :: NULLSYMB COLA prepend(_,s,cp)         * 5E0C1
        ;                                        * 5E0D5

* ob1..obn #n -> {}
* refs (7): 216C9 23EF7 24212 24AB0 24D5C 252FF ...
P{}N:
        :: ERRSET {}N ERRTRAP ~NULL{};COLA;prepend(_,s,cp) ; * 5E0DA

* refs (1): 5E0EE
~NULL{};COLA;prepend(_,s,cp):
        :: NULL{} COLA prepend(_,s,cp)           * 5E0F8
        ;                                        * 5E10C

* ob1..obn #n -> seco
* refs (3): 252A5 252BE 252E6
P::N:
        :: ERRSET ::N ERRTRAP ~NULL::;COLA;prepend(_,s,cp) ; * 5E111

* refs (1): 5E125
~NULL::;COLA;prepend(_,s,cp):
        :: PTR NULL:: COLA prepend(_,s,cp)       * 5E12F
        ;                                        * 5E143

* refs (3): 5E0D0 5E107 5E13E
prepend(_,s,cp):
        :: ERRORCLR OVER #0=case SWAPDROP        * 5E148
          TOTEMPSWAP ZERO_DO SWAP prepend(cp,_) LOOP ; * 5E161

* refs (1): 5E170
prepend(cp,_):
        :: FREEINTEMP? NOTcase prepend(cp,_)~1   * 5E17F
          >TOPTEMP SWAP >TOPTEMP SWAP OBJ_5E1E3 ; * 5E193

* refs (1): 5E18E
prepend(cp,_)~1:
        :: INHARDROM? case prepend(cp,_)~2       * 5E1B1
          TOTEMPOB SWAP >TOPTEMP SWAP OBJ_5E1E3 ; * 5E1C5

* refs (2): 5E1A7 5E1D9
OBJ_5E1E3:
        CON(5)  (*)+5                            * 5E1E3  primitive code object
        ASSEMBLE
        D1=D1+  5                                * 5E1E8
        D=D+1   A                                * 5E1EB
        GOSBVL  SAVPTR                           * 5E1ED
        A=DAT1  A                                * 5E1F4
        D0=A                                     * 5E1F7
        A=A+CON A,5                              * 5E1FA
        DAT1=A  A                                * 5E200
        A=DAT0  A                                * 5E203
        R0=A.F  A                                * 5E206
        D0=D0-  6                                * 5E20C
        A=DAT0  A                                * 5E20F
        A=A-CON A,6                              * 5E212
        R1=A.F  A                                * 5E218
        D0=D0+  6                                * 5E21E
        CD0EX                                    * 5E221
        D0=C                                     * 5E224
        R2=C.F  A                                * 5E227
        GOSBVL  SKIPOB                           * 5E22D
        A=DAT0  A                                * 5E234
        C=R1.F  A                                * 5E237
        A=A+C   A                                * 5E23D
        DAT0=A  A                                * 5E23F
        A=R2.F  A                                * 5E242
        A=A+CON A,5                              * 5E248
        LC(5)   #0000B                           * 5E24E
        GOSBVL  MOVERSD                          * 5E255
        A=R1.F  A                                * 5E25C
        ABEX    A                                * 5E262
        A=A-B   A                                * 5E264
        LC(5)   #00005                           * 5E266
        GOSBVL  MOVERSU                          * 5E26D
        A=B     A                                * 5E274
        D0=A                                     * 5E276
        C=R0.F  A                                * 5E279
        DAT0=C  A                                * 5E27F
        LC(5)   DSKTOP                           * 5E282
        CD0EX                                    * 5E289
        A=DAT0  A                                * 5E28C
        D0=A                                     * 5E28F
        DAT0=C  A                                * 5E292
        GOVLNG  GETPTRLOOP                       * 5E295

* refs (1): 5E1C0
prepend(cp,_)~2:
        CON(5)  (*)+5                            * 5E29C  primitive code object
        A=DAT1  A                                * 5E2A1
        R0=A.F  A                                * 5E2A4
        D1=D1+  5                                * 5E2AA
        D=D+1   A                                * 5E2AD
        GOSBVL  SAVPTR                           * 5E2AF
        A=DAT1  A                                * 5E2B6
        A=A+CON A,5                              * 5E2B9
        LC(5)   #00005                           * 5E2BF
        GOSBVL  MOVERSU                          * 5E2C6
        C=B     A                                * 5E2CD
        D0=C                                     * 5E2CF
        C=R0.F  A                                * 5E2D2
        DAT0=C  A                                * 5E2D8
        D0=D0-  5                                * 5E2DB
        GOSBVL  SKIPOB                           * 5E2DE
        C=DAT0  A                                * 5E2E5
        C=C+CON A,5                              * 5E2E8
        DAT0=C  A                                * 5E2EE
        GOVLNG  GETPTRLOOP                       * 5E2F1
        RPL

* ob1 ob2 -> meta
* refs (8): 85D3B 85D8B 8AE28 8AE80 8AF5B 8B004 ...
2SINNERtop&:
        :: 2SINNER top& ;                        * 5E2F8

* ob1 ob2 -> meta1 meta2
* refs (5): 55832 5595E 5E2FD 86957 869C5
2SINNER:
        :: SWAP SINNER get1 SINNER ;             * 5E30C

* meta -> meta'
* refs (4): 1F72B 5AC18 70077 72FB6
SINNERMETA:
        :: BINT0 DUPUNROT DO get1 SINNER psh top& LOOP ; * 5E32A

* meta -> meta meta
* refs (62): 1F6F9 28075 28250 558D2 56EFA 5704F ...
dup:
        :: DUP#1+ NDUP ;                         * 5E35C

* ob #n -> ob..ob #n ob #0 -> #0
* refs (18): 19A2F 272BE 28B64 4A883 4C9C9 58068 ...
NDUPN:
        :: DUP#0=case SWAPDROP                   * 5E370
          DUP #1- DUP#0=case DROP                * 5E37F
          ZERO_DO OVER SWAP LOOP ;               * 5E393

* meta1 meta2 meta3 -> meta1&meta3 meta2
* refs (20): 24BC9 29462 2947B 2948A 5AB5F 5AB8C ...
psh&:
        :: psh over& ;                           * 5E3AC

* meta1 meta2 meta3 -> meta1&meta2 meta3
* refs (42): 24B5C 27AA3 29700 547A1 57A84 57CC1 ...
over&:
        :: get1 2DUP#+ #3+ ROLL #+OVER #2+UNROLL ; * 5E3C0

* meta ob -> ob #1 meta
* refs (74): 0B697 1CF51 1F461 1F906 21BB6 24D52 ...
pshm1:
        :: OVER#2+UNROL BINT1 OVER#2+UNROL ;     * 5E3E8

* meta ob -> ob&meta
* refs (1): 1F4CF
psh1top&:
        :: OVER#2+UNROL #1+ ;                    * 5E401

* meta1 meta2 -> meta1&meta2
* refs (177): 1F466 24271 24D57 24DED 27C56 27C60 ...
top&:
        CON(5)  (*)+5                            * 5E415  primitive code object
        ASSEMBLE
        D1=D1+  10                               * 5E41A
        D=D+1   A                                * 5E41D
        D=D+1   A                                * 5E41F
        GOSBVL  SAVPTR                           * 5E421
        D1=D1-  10                               * 5E428
        C=DAT1  A                                * 5E42B
        CD1EX                                    * 5E42E
        D1=D1+  5                                * 5E431
        A=DAT1  A                                * 5E434
        D1=C                                     * 5E437
        R0=A                                     * 5E43A
        A=A+1   A                                * 5E43D
        C=A     A                                * 5E43F
        C=C+C   A                                * 5E441
        C=C+C   A                                * 5E443
        C=C+A   A                                * 5E445
        AD1EX                                    * 5E447
        A=A+C   A                                * 5E44A
        D1=A                                     * 5E44C
        D0=A                                     * 5E44F
        A=DAT0  A                                * 5E452
        AD0EX                                    * 5E455
        D0=D0+  5                                * 5E458
        A=DAT0  A                                * 5E45B
        R1=A                                     * 5E45E
        AD1EX                                    * 5E461
        D1=A                                     * 5E464
        D0=A                                     * 5E467
        D1=D1+  5                                * 5E46A
        GOSBVL  MOVEUP                           * 5E46D
        A=R0                                     * 5E474
        C=R1                                     * 5E477
        C=C+A   A                                * 5E47A
        R0=C                                     * 5E47C
        GOSBVL  PUSH#                            * 5E47F
        A=DAT0  A                                * 5E486
        D0=D0+  5                                * 5E489
        PC=(A)                                   * 5E48C
        RPL

* meta1 meta2 meta3 -> meta1&meta2&meta3
* refs (6): 582FA 7DC4A 85F11 8632B 863C6 86650
2top&:
        :: top& COLA top&                        * 5E490
        ;                                        * 5E4A4

* ob # -> #-1 ob
* refs (111): 0B6BA 105D6 1F493 1F4A7 1F712 21B93 ...
#1-SWAP:
        :: #1- SWAP ;                            * 5E4A9

* ob&meta -> meta ob
* refs (15): 0221E 097FA 0B6A1 1F443 1F60F 28DEE ...
pullrev:
        :: #1- get1 ;                            * 5E4BD

* meta1 meta2 -> meta2&meta1
* refs (124): 1F730 296F1 55986 56110 561EC 56200 ...
pshtop&:
        :: psh COLA top&                         * 5E4D1
        ;                                        * 5E4E5

* meta1 meta2&ob -> ob&meta1 meta2
* refs (24): 1F3C2 24DE8 29005 548B4 57C7B 58A52 ...
pullpsh1&:
        :: #1- SWAPCOLA psh1& ;                  * 5E4EA

* meta1 meta2&ob -> meta1&ob meta2
* refs (11): 27AF8 27F85 57E35 57E62 586ED 587F0 ...
pullrev1&:
        :: #1- SWAPCOLA psh1&rev ;               * 5E503

* meta -> meta&ob
* refs (74): 23ABF 23ACE 23EB1 28EBB 54644 548E1 ...
addt::
        :: 'R SWAP#1+ ;                          * 5E51C

* meta -> meta&ob1&ob2
* refs (42): 28255 28269 57838 57CE4 582FF 58A7F ...
addt2::
        :: 'R'R ROT #2+ ;                        * 5E530

* meta1 meta2 -> meta1&ob meta2
* refs (6): 58809 58831 5887C 588EF 58944 589A3
psh1&rev::
        :: 'R COLA psh1&rev                      * 5E549
        ;                                        * 5E55D

* meta1 meta2 -> meta1&ob1&ob2 meta2
* refs (1): 589F3
psh1&rev2::
        :: 'R psh1&rev 'R COLA psh1&rev          * 5E562
        ;                                        * 5E580

* obn..ob1 #n comp -> obm..ob1 #m
* refs (44): 281EC 56C68 56CC7 59084 59937 5AB50 ...
INNERtop&:
        :: INNERCOMP COLA top&                   * 5E585
        ;                                        * 5E599

* meta&ob -> meta&ob'
* refs (5): 5BCC6 5BCF3 83C0D 83E4C 83EB5
repl::
        :: SWAPDROP 'R SWAP ;                    * 5E59E

* ROMPTR -> ob F -> ROMPTR T ob -> ob T
* refs (7): 1F677 54AB5 56DA1 58E63 58F5D 59171 ...
ROMPTR@NOT:
        :: CK&DISPATCH0                          * 5E5B7
          BINT6 SAFE@NOT                         * 5E5C1  name
          BINT7 LISTRCL                          * 5E5CB  local
          BINT15 UnKnown(xn)?                    * 5E5D5  romptr
          BINT0 TRUE                             * 5E5DF  any
        ;                                        * 5E5E9

* id -> ob F -> T
* refs (1): 5E5C6
SAFE@NOT:
        :: OBJ_5E62A SAFE@ ;                     * 5E5EE

* {path id} -> ob -> lam T
* refs (1): 5E5D0
LISTRCL:
        :: OBJ_5E62A undo ;                      * 5E602

* refs (1): 5E5DA
UnKnown(xn)?:
        :: OBJ_5E62A ROMPTR@ ;                   * 5E616

* refs (3): 5E5F3 5E607 5E61B
OBJ_5E62A:
        :: DUP 'R EVAL NOTcaseTRUE SWAPDROP      * 5E62A
          FALSE ;                                * 5E648

* ob -> ob'
* refs (54): 1CFD5 1F206 1F45C 1F4AC 1F4CA 1F58A ...
symcomp:
        :: DUPTYPESYMB? ?SKIP                    * 5E652

* ob1..obn #n -> symb
* refs (1): 594EF
ONESYMBN:
          :: BINT1 SYMBN ;                       * 5E661
        ;                                        * 5E675

* meta -> #0 meta
* refs (45): 1F47F 1F90B 21BCA 245A0 27396 28FBA ...
pshzer:
        :: BINT0 OVER#2+UNROL ;                  * 5E67A

* meta -> M_last&op M_rest
* refs (25): 5A441 5B6F9 5BC08 5BC26 5CA1E 5CA37 ...
pargop:
        :: #1-SWAP pargop~1 ROT #1+SWAP DUP#0=case psh * 5E68E
          BINT1 #=casedrop                       * 5E6B1

* meta&ob -> ob #1 meta
pullpshm1:
          :: #1-SWAP pshm1 ;                     * 5E6BB
          #1- BINT3 SWAP splitup #1- tailpsh ;   * 5E6CF

* meta1 meta2 -> meta1&M_last M_rest
* refs (8): 28246 57031 57E8F 580E5 58675 586DE ...
parg&:
        :: pshzerpsharg overev& ;                * 5E6F2

* meta1 meta2 ob -> ob&meta1 meta2
* refs (47): 0B6A6 1F4A2 1F4B6 1F91F 21C2E 24258 ...
psh1&:
        CON(5)  (*)+5                            * 5E706  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 5E70B
        C=DAT1  A                                * 5E712
        RSTK=C                                   * 5E715
        CD1EX                                    * 5E717
        RSTK=C                                   * 5E71A
        D1=C                                     * 5E71C
        D1=D1+  5                                * 5E71F
        C=DAT1  A                                * 5E722
        CD1EX                                    * 5E725
        D1=D1+  5                                * 5E728
        D0=C                                     * 5E72B
        C=DAT1  A                                * 5E72E
        C=C+1   A                                * 5E731
        A=C     A                                * 5E733
        C=C+C   A                                * 5E735
        C=C+C   A                                * 5E737
        C=C+A   A                                * 5E739
        R1=C                                     * 5E73B
        AD0EX                                    * 5E73E
        D0=A                                     * 5E741
        C=C+A   A                                * 5E744
        D1=C                                     * 5E746
        C=DAT1  A                                * 5E749
        CD1EX                                    * 5E74C
        D1=D1+  5                                * 5E74F
        A=DAT1  A                                * 5E752
        D1=C                                     * 5E755
        A=A+1   A                                * 5E758
        R0=A                                     * 5E75A
        C=A     A                                * 5E75D
        A=A+A   A                                * 5E75F
        A=A+A   A                                * 5E761
        A=A+C   A                                * 5E763
        C=RSTK                                   * 5E765
        D1=C                                     * 5E767
        C=R1                                     * 5E76A
        C=C+A   A                                * 5E76D
        GOSBVL  MOVEDOWN                         * 5E76F
        C=RSTK                                   * 5E776
        DAT1=C  A                                * 5E778
        GOSBVL  PUSH#                            * 5E77B
        A=DAT1  A                                * 5E782
        D1=D1+  5                                * 5E785
        D=D+1   A                                * 5E788
        AD1EX                                    * 5E78A
        C=R1                                     * 5E78D
        C=C+A   A                                * 5E790
        CD1EX                                    * 5E792
        DAT1=C  A                                * 5E795
        D1=A                                     * 5E798
        A=DAT0  A                                * 5E79B
        D0=D0+  5                                * 5E79E
        PC=(A)                                   * 5E7A1

* meta1 meta2 ob -> ob&meta1 meta2
* refs (46): 294B7 29511 29570 3F48D 3F5D9 450D8 ...
psh1&rev:
        CON(5)  (*)+5                            * 5E7A5  primitive code object
        GOSBVL  SAVPTR                           * 5E7AA
        C=DAT1  A                                * 5E7B1
        RSTK=C                                   * 5E7B4
        CD1EX                                    * 5E7B6
        RSTK=C                                   * 5E7B9
        D1=C                                     * 5E7BB
        D1=D1+  5                                * 5E7BE
        C=DAT1  A                                * 5E7C1
        CD1EX                                    * 5E7C4
        D1=D1+  5                                * 5E7C7
        D0=C                                     * 5E7CA
        C=DAT1  A                                * 5E7CD
        C=C+1   A                                * 5E7D0
        A=C     A                                * 5E7D2
        C=C+C   A                                * 5E7D4
        C=C+C   A                                * 5E7D6
        C=C+A   A                                * 5E7D8
        R1=C                                     * 5E7DA
        AD0EX                                    * 5E7DD
        D0=A                                     * 5E7E0
        C=C+A   A                                * 5E7E3
        D1=C                                     * 5E7E5
        C=DAT1  A                                * 5E7E8
        CD1EX                                    * 5E7EB
        D1=D1+  5                                * 5E7EE
        A=DAT1  A                                * 5E7F1
        D1=C                                     * 5E7F4
        A=A+1   A                                * 5E7F7
        R0=A                                     * 5E7F9
        C=RSTK                                   * 5E7FC
        D1=C                                     * 5E7FE
        LC(5)   #00005                           * 5E801
        A=R1                                     * 5E808
        C=C+A   A                                * 5E80B
        GOSBVL  MOVEDOWN                         * 5E80D
        C=RSTK                                   * 5E814
        DAT1=C  A                                * 5E816
        GOSBVL  PUSH#                            * 5E819
        A=DAT1  A                                * 5E820
        D1=D1+  5                                * 5E823
        D=D+1   A                                * 5E826
        AD1EX                                    * 5E828
        C=R1                                     * 5E82B
        C=C+A   A                                * 5E82E
        CD1EX                                    * 5E830
        DAT1=C  A                                * 5E833
        D1=A                                     * 5E836
        A=DAT0  A                                * 5E839
        D0=D0+  5                                * 5E83C
        PC=(A)                                   * 5E83F
        RPL

* meta1 meta2 meta3 -> meta2&meta1 meta3
* refs (18): 5494A 57CC6 5CBE0 5CBE5 5D744 5D753 ...
overev&:
        :: rotswap over& ;                       * 5E843

* meta1 meta2 meta3 -> meta2 meta1 meta3
* refs (34): 27FD5 28995 58031 58269 586BB 58AC5 ...
rotswap:
        :: rot COLA psh                          * 5E857
        ;                                        * 5E86B

* meta1 meta2 meta3 meta4 -> meta2 meta1 meta3 meta4
4rollunrot:
        :: 4roll COLA unrot                      * 5E870
        ;                                        * 5E884

* refs (1): 5E698
pargop~1:
        :: nonopcase BINT0                       * 5E889
          REQcase xFCNAPPLY                      * 5E898

* refs (1): 21A12
3pick;2+(s):
          :: 3PICK #2+ ; infarg? case            * 5E8A2

* refs (3): 6D299 8F145 8F2AF
3pick;1+(s):
          :: 3PICK #1+ ;                         * 5E8C0
          argum ;                                * 5E8D4

* seco -> seco #args
* refs (3): 54B87 5E8D4 60071
argum:
        :: TRUE argum~1 ;                        * 5E8DE

* refs (1): 5E8E8
argum~1:
        CON(5)  (*)+5                            * 5E8F2  primitive code object
        ASSEMBLE
        D1=D1+  5                                * 5E8F7
        C=DAT1  A                                * 5E8FA
        CD1EX                                    * 5E8FD
        D1=D1+  5                                * 5E900
        A=DAT1  A                                * 5E903
        D1=C                                     * 5E906
        C=0     S                                * 5E909
        LC(5)   CK0                              * 5E90C
        ?C=A    A                                * 5E913
        GOYES   L_5E957                          * 5E916
        LC(5)   CK1&Dispatch                     * 5E918
        C=C+1   S                                * 5E91F
        ?C=A    A                                * 5E922
        GOYES   L_5E957                          * 5E925
        LC(5)   CK2&Dispatch                     * 5E927
        C=C+1   S                                * 5E92E
        ?C=A    A                                * 5E931
        GOYES   L_5E957                          * 5E934
        LC(5)   CK3&Dispatch                     * 5E936
        C=C+1   S                                * 5E93D
        ?C=A    A                                * 5E940
        GOYES   L_5E957                          * 5E943
        LC(5)   CK4&Dispatch                     * 5E945
        C=C+1   S                                * 5E94C
        ?C=A    A                                * 5E94F
        GOYES   L_5E957                          * 5E952
        C=C+1   S                                * 5E954
L_5E957:
        C=0     A                                * 5E957
        P=C     15                               * 5E959
        CPEX    0                                * 5E95D
        C=C+C   A                                * 5E961
        A=C     A                                * 5E963
        A=A+A   A                                * 5E965
        A=A+A   A                                * 5E967
        A=A+C   A                                * 5E969
        LC(5)   BINT0                            * 5E96B
        C=C+A   A                                * 5E972
        D1=D1-  5                                * 5E974
        DAT1=C  A                                * 5E977
        A=DAT0  A                                * 5E97A
        D0=D0+  5                                * 5E97D
        PC=(A)                                   * 5E980
        RPL

* seco -> :: seco <ob2> <rest> ; ob -> :: ob <ob1> ;
* refs (7): 5736A 58D3E 58DF5 59FD7 5E88E 5F334 ...
nonopcase:
        :: CK&DISPATCH0                          * 5E984
          BINT8 SKIP                             * 5E98E  program
          BINT0 COLA                             * 5E998  any
        ;                                        * 5E9A2

* seco -> seco flag
* refs (10): 548A0 54B5F 56D5B 59FE1 5B6B8 5E8B6 ...
infarg?:
        CON(5)  (*)+5                            * 5E9A7  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 5E9AC
        CD1EX                                    * 5E9AF
        D1=D1+  5                                * 5E9B2
        A=DAT1  A                                * 5E9B5
        D1=C                                     * 5E9B8
        LC(5)   CKINFARGS                        * 5E9BB
        ?C#A    A                                * 5E9C2
        GOYES   L_5E9D4                          * 5E9C5
        LC(5)   TRUE                             * 5E9C7
        A=C     A                                * 5E9CE
        PC=(A)                                   * 5E9D0
L_5E9D4:
        LC(5)   FALSE                            * 5E9D4
        A=C     A                                * 5E9DB
        PC=(A)                                   * 5E9DD
        RPL

* refs (3): 573D3 5F451 5F6D4
OBJ_5E9E1:
        :: OBJ_26BED NOTcase SETROMPERR          * 5E9E1
          ROTROT2DROP MINUSONE #= ;              * 5E9F5

* ->
* refs (5): 1F3F8 1F5CA 28526 5E9BB 5F850
CKINFARGS:
        :: 'RSAVEWORD                            * 5EA09
          :: DEPTH OVER #1+ #<case SETSTACKERR   * 5EA13
            CKINFARGS~1 ;                        * 5EA31
        ;                                        * 5EA3B

* refs (1): 5EA31
CKINFARGS~1:
        :: dup P{}N OVER #2+ UNROLL NDROP CK1NOLASTWD INNERCOMP ; * 5EA40

* refs (5): 54CE0 54D17 54D3A 54D5D 54D80
OBJ_5EA72:
        :: NOTCONST? NOTcase COLA                * 5EA72
          NOTNUM?                                * 5EA86
          case SKIP                              * 5EA8B
          COLACOLA ;                             * 5EA95

* meta -> M_last M_rest
* refs (49): 28241 54E34 562AA 57C80 57F55 586C0 ...
pshzerpsharg:
        :: BINT2 BINT1 splitup #1- tailpsh ;     * 5EA9F

* meta -> M_rest M_last
* refs (55): 1F915 28070 2808E 282BE 28990 54936 ...
larg:
        :: BINT2 BINT1 splitup #2- 2DUP #- ROTDROP OVER#2+UNROL ; * 5EAC2

* ob # -> #-1
* refs (110): 1011E 1F8E3 28007 28089 28192 281FB ...
SWAPDROP#1-:
        :: SWAPDROP #1- ;                        * 5EAF4

* refs (3): 57BCC 57C17 57C44
delB[1-2]:
        :: #2- ROTROT2DROP ;                     * 5EB08

* meta1 meta2 -> meta2 meta1
* refs (206): 0F7A6 0F7FB 0F832 0F85A 0F8C3 0F8DC ...
psh:
        CON(5)  (*)+5                            * 5EB1C  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 5EB21
        AD1EX                                    * 5EB28
        D0=A                                     * 5EB2B
        D1=A                                     * 5EB2E
        C=0     A                                * 5EB31
        GOSUB   SUB_5EC10                        * 5EB33
        CAEX    A                                * 5EB37
        D=C     A                                * 5EB39
        CAEX    A                                * 5EB3B
        GOSUB   SUB_5EC10                        * 5EB3D
        B=A     A                                * 5EB41
        GOSUB   SUB_5EC41                        * 5EB43
        GOSBVL  GETPTR                           * 5EB47
        A=DAT0  A                                * 5EB4E
        D0=D0+  5                                * 5EB51
        PC=(A)                                   * 5EB54

* meta1 meta2 meta3 -> meta2 meta3 meta1
* refs (62): 0F7F1 0F800 0F9F4 0FA03 0FA08 21BF7 ...
rot:
        CON(5)  (*)+5                            * 5EB58  primitive code object
        A=0     A                                * 5EB5D
        A=A+1   A                                * 5EB5F
        C=0     A                                * 5EB61
        NOP4                                     * 5EB63
L_5EB67:
        R0=A.F  A                                * 5EB67
        R1=C.F  A                                * 5EB6D
        GOSBVL  SAVPTR                           * 5EB73
        AD1EX                                    * 5EB7A
        D1=A                                     * 5EB7D
        D0=A                                     * 5EB80
        C=0     A                                * 5EB83
        B=0     A                                * 5EB85
        D=0     A                                * 5EB87
L_5EB89:
        GOSUB   SUB_5EC10                        * 5EB89
        CAEX    A                                * 5EB8D
        D=D+C   A                                * 5EB8F
        CAEX    A                                * 5EB91
        CR0EX.F A                                * 5EB93
        C=C-1   A                                * 5EB99
        CR0EX.F A                                * 5EB9B
        GONC    L_5EB89                          * 5EBA1
L_5EBA4:
        GOSUB   SUB_5EC10                        * 5EBA4
        B=B+A   A                                * 5EBA8
        CR1EX.F A                                * 5EBAA
        C=C-1   A                                * 5EBB0
        CR1EX.F A                                * 5EBB2
        GONC    L_5EBA4                          * 5EBB8
        GOSUB   SUB_5EC41                        * 5EBBB
        GOVLNG  GETPTRLOOP                       * 5EBBF

* meta1 meta2 meta3 meta4 -> meta2 meta3 meta4 meta1
* refs (21): 57FD2 5820A 5B0FF 5B2E9 5DB42 5DCCD ...
4roll:
        CON(5)  (*)+5                            * 5EBC6  primitive code object
        LA(5)   #00002                           * 5EBCB
        C=0     A                                * 5EBD5
        GOTO    L_5EB67                          * 5EBD7

* meta1 meta2 meta3 -> meta3 meta1 meta2
* refs (57): 21C24 2425D 296FB 548EB 558A0 562AF ...
unrot:
        CON(5)  (*)+5                            * 5EBDB  primitive code object
        A=0     A                                * 5EBE0
        C=0     A                                * 5EBE2
        C=C+1   A                                * 5EBE4
        GOTO    L_5EB67                          * 5EBE6

* meta1 meta2 meta3 meta4 -> meta4 meta1 meta2 meta3
* refs (7): 5492C 58009 5802C 58241 58264 84229 ...
4unroll:
        CON(5)  (*)+5                            * 5EBEA  primitive code object
        A=0     A                                * 5EBEF
        LC(5)   #00002                           * 5EBF1
        GOTO    L_5EB67                          * 5EBF8

* META1..METAn+1 #n -> META2..METAn+1 META1
* refs (4): 2943F 296B5 843A5 8445E
N+1roll:
        CON(5)  (*)+5                            * 5EBFC  primitive code object
        GOSBVL  POP#                             * 5EC01
        A=A-1   A                                * 5EC08
        C=0     A                                * 5EC0A
        GOTO    L_5EB67                          * 5EC0C

* refs (4): 5EB33 5EB3D 5EB89 5EBA4
SUB_5EC10:
        RSTK=C                                   * 5EC10
        A=DAT1  A                                * 5EC12
        AD1EX                                    * 5EC15
        D1=D1+  5                                * 5EC18
        C=DAT1  A                                * 5EC1B
        D1=A                                     * 5EC1E
        C=C+1   A                                * 5EC21
        A=C     A                                * 5EC23
        C=RSTK                                   * 5EC25
        C=C+A   A                                * 5EC27
        RSTK=C                                   * 5EC29
        C=A     A                                * 5EC2B
        C=C+C   A                                * 5EC2D
        C=C+C   A                                * 5EC2F
        C=C+A   A                                * 5EC31
        AD1EX                                    * 5EC33
        A=A+C   A                                * 5EC36
        AD1EX                                    * 5EC38
        A=C     A                                * 5EC3B
        C=RSTK                                   * 5EC3D
        RTN                                      * 5EC3F

* refs (2): 5EB43 5EBBB
SUB_5EC41:
        R0=C                                     * 5EC41
        CD1EX                                    * 5EC44
        R1=C                                     * 5EC47
        D1=(5)  leeway                           * 5EC4A
        A=DAT1  A                                * 5EC51
        D1=A                                     * 5EC54
        D1=D1+  5                                * 5EC57
        A=DAT1  A                                * 5EC5A
        D1=D1+  15                               * 5EC5D
        A=A-CON A,15                             * 5EC60
        C=D     A                                * 5EC66
        ?B>=C   A                                * 5EC68
        GOYES   L_5EC7F                          * 5EC6B
        ?A>=B   A                                * 5EC6D
        GOYES   L_5ECAB                          * 5EC70
L_5EC72:
        C=R1                                     * 5EC72
        D1=C                                     * 5EC75
        C=R0                                     * 5EC78
        GOTO    L_5ECDD                          * 5EC7B
L_5EC7F:
        ?C>A    A                                * 5EC7F
        GOYES   L_5EC72                          * 5EC82
        GOSUB   MOVEDOWN~jump                    * 5EC84
        CD0EX                                    * 5EC88
        D0=C                                     * 5EC8B
        C=C-D   A                                * 5EC8E
        CD1EX                                    * 5EC90
        RSTK=C                                   * 5EC93
        C=B     A                                * 5EC95
        GOSUB   MOVEDOWN~jump                    * 5EC97
        C=RSTK                                   * 5EC9B
        C=C-D   A                                * 5EC9D
        CD0EX                                    * 5EC9F
        C=D     A                                * 5ECA2

* refs (3): 5EC84 5EC97 5ECB5
MOVEDOWN~jump:
        GOVLNG  MOVEDOWN                         * 5ECA4
L_5ECAB:
        CD0EX                                    * 5ECAB
        C=C+D   A                                * 5ECAE
        D0=C                                     * 5ECB0
        C=B     A                                * 5ECB3
        GOSUB   MOVEDOWN~jump                    * 5ECB5
        CD1EX                                    * 5ECB9
        RSTK=C                                   * 5ECBC
        CD0EX                                    * 5ECBE
        D1=C                                     * 5ECC1
        C=C-B   A                                * 5ECC4
        D0=C                                     * 5ECC6
        C=D     A                                * 5ECC9
        GOSUB   MOVEUP~jump                      * 5ECCB
        C=RSTK                                   * 5ECCF
        CD0EX                                    * 5ECD1
        C=B     A                                * 5ECD4

* refs (1): 5ECCB
MOVEUP~jump:
        GOVLNG  MOVEUP                           * 5ECD6
L_5ECDD:
        C=C-1   A                                * 5ECDD
        RSTK=C                                   * 5ECDF
L_5ECE1:
        A=DAT0  A                                * 5ECE1
        C=0     A                                * 5ECE4
        DAT0=C  A                                * 5ECE6
L_5ECE9:
        AD0EX                                    * 5ECE9
        C=B     A                                * 5ECEC
        C=C+A   A                                * 5ECEE
        GOC     L_5ECFE                          * 5ECF0
        AD1EX                                    * 5ECF3
        ?C<A    A                                * 5ECF6
        GOYES   L_5ED21                          * 5ECF9
        AD1EX                                    * 5ECFB
L_5ECFE:
        C=D     A                                * 5ECFE
        A=A-C   A                                * 5ED00
        AD0EX                                    * 5ED02
        C=DAT0  A                                * 5ED05
        DAT0=A  A                                * 5ED08
        A=C     A                                * 5ED0B
        C=RSTK                                   * 5ED0D
        C=C-1   A                                * 5ED0F
        RTNC                                     * 5ED11
        RSTK=C                                   * 5ED14
        ?A#0    A                                * 5ED16
        GOYES   L_5ECE9                          * 5ED19
        D0=D0+  5                                * 5ED1B
        GONC    L_5ECE1                          * 5ED1E
L_5ED21:
        D1=A                                     * 5ED21
        A=C     A                                * 5ED24
        AD0EX                                    * 5ED26
        C=DAT0  A                                * 5ED29
        DAT0=A  A                                * 5ED2C
        A=C     A                                * 5ED2F
        C=RSTK                                   * 5ED31
        C=C-1   A                                * 5ED33
        RTNC                                     * 5ED35
        RSTK=C                                   * 5ED38
        ?A#0    A                                * 5ED3A
        GOYES   L_5ECE9                          * 5ED3D
        D0=D0+  5                                * 5ED3F
        GONC    L_5ECE1                          * 5ED42

* meta1..meta5 -> meta2..meta5 meta1
* refs (4): 57FFF 58022 58237 5825A
5roll:
        B=B-1   S                                * 5ED45
        B=B+1   A                                * 5ED48
        LA(5)   #00003                           * 5ED4A
        C=0     A                                * 5ED54
        GOTO    L_5EB67                          * 5ED56

* meta1..meta5 -> meta5 meta1..meta4
* refs (4): 840C6 8411B 843AF 84468
5unroll:
        CON(5)  (*)+5                            * 5ED5A  primitive code object
        A=0     A                                * 5ED5F
        LC(5)   #00003                           * 5ED61
        GOTO    L_5EB67                          * 5ED68

* META1..METAn+1 #n -> METAn+1 META1..METAn
N+1unroll:
        CON(5)  (*)+5                            * 5ED6C  primitive code object
        GOSBVL  POP#                             * 5ED71
        C=A     A                                * 5ED78
        A=0     A                                * 5ED7A
        C=C-1   A                                * 5ED7C
        GOTO    L_5EB67                          * 5ED7E
        RPL

* refs (2): 60545 6078E
OBJ_5ED82:
        :: 3PICK3PICK #+ #2+UNROLL #1- OVER#2+UNROL rot NDROP psh get1 2DROP ; * 5ED82
        ASSEMBLE

* refs (1): 5EE01
numb1stcase~1:
        C=DAT1  A                                * 5EDBE
        CD1EX                                    * 5EDC1
        A=DAT1  A                                * 5EDC4
        D1=C                                     * 5EDC7
        LC(5)   DOREAL                           * 5EDCA
        ?C=A    A                                * 5EDD1
        RTNYES                                   * 5EDD4
        LC(5)   DOCMP                            * 5EDD6
        ?C=A    A                                * 5EDDD
        RTNYES                                   * 5EDE0
        LC(5)   DOARRY                           * 5EDE2
        ?C=A    A                                * 5EDE9
        RTNYES                                   * 5EDEC
        LC(5)   DOLNKARRY                        * 5EDEE
        ?C=A    A                                * 5EDF5
        RTNYES                                   * 5EDF8
        RTNCC                                    * 5EDFA

* %/C%/[]/[L] -> :: <ob1> ; ob -> :: ob2 <rest> ;
numb1stcase:
        CON(5)  (*)+5                            * 5EDFC  primitive code object
        GOSUB   numb1stcase~1                    * 5EE01
        GOC     L_5EE0C                          * 5EE05
        GOTO    doskip                           * 5EE08
L_5EE0C:
        GOTO    docola                           * 5EE0C

* Meta&NEG -> Meta COLA Meta -> Meta SKIP Meta&(%<0) -> Meta&ABS(%) COLA
* refs (11): 55341 5537D 553AA 553D7 561C4 5621E ...
M-1stcasechs:
        CON(5)  (*)+5                            * 5EE10  primitive code object
        A=DAT1  A                                * 5EE15
        AD1EX                                    * 5EE18
        D1=D1+  5                                * 5EE1B
        C=DAT1  A                                * 5EE1E
        D1=A                                     * 5EE21
        ?C#0    A                                * 5EE24
        GOYES   L_5EE2D                          * 5EE27
        GOTO    L_5EED7                          * 5EE29
L_5EE2D:
        D1=D1+  5                                * 5EE2D
        A=DAT1  A                                * 5EE30
        LC(5)   xNEG                             * 5EE33
        ?C=A    A                                * 5EE3A
        GOYES   L_5EEA7                          * 5EE3D
        LC(5)   DOREAL                           * 5EE3F
        CD1EX                                    * 5EE46
        AD1EX                                    * 5EE49
        RSTK=C                                   * 5EE4C
        C=DAT1  A                                * 5EE4E
        ?C#A    A                                * 5EE51
        GOYES   L_5EE9C                          * 5EE54
        D1=D1+  5                                * 5EE56
        A=DAT1  W                                * 5EE59
        ?A=0    S                                * 5EE5D
        GOYES   L_5EE9C                          * 5EE60
        A=0     S                                * 5EE62
        C=RSTK                                   * 5EE65
        D1=C                                     * 5EE67
        D1=D1-  5                                * 5EE6A
        C=DAT1  A                                * 5EE6D
        D1=D1+  5                                * 5EE70
        DAT1=C  A                                * 5EE73
        D=D+1   A                                * 5EE76
        GOSBVL  SAVPTR                           * 5EE78
        GOSBVL  PUSH%                            * 5EE7F
        A=DAT1  A                                * 5EE86
        D1=D1+  5                                * 5EE89
        C=DAT1  A                                * 5EE8C
        DAT1=A  A                                * 5EE8F
        D1=D1-  5                                * 5EE92
        DAT1=C  A                                * 5EE95
        GOTO    docola                           * 5EE98
L_5EE9C:
        C=RSTK                                   * 5EE9C
        D1=C                                     * 5EE9E
        D1=D1-  5                                * 5EEA1
        GONC    L_5EED7                          * 5EEA4
L_5EEA7:
        D1=D1-  5                                * 5EEA7
        A=DAT1  A                                * 5EEAA
        AD1EX                                    * 5EEAD
        D1=D1+  5                                * 5EEB0
        C=DAT1  A                                * 5EEB3
        D1=A                                     * 5EEB6
        D1=D1+  10                               * 5EEB9
        D=D+1   A                                * 5EEBC
        D=D+1   A                                * 5EEBE
        C=C-1   A                                * 5EEC0
        R0=C                                     * 5EEC2
        GOSBVL  SAVPTR                           * 5EEC5
        GOSBVL  PUSH#                            * 5EECC
        GOTO    docola                           * 5EED3
L_5EED7:
        GOTO    doskip                           * 5EED7

* %<0 -> :: % <ob1> ; ob -> :: ob <ob2> <rest> ;
REALNEGcase:
        CON(5)  (*)+5                            * 5EEDB  primitive code object
        C=DAT1  A                                * 5EEE0
        CD1EX                                    * 5EEE3
        A=DAT1  A                                * 5EEE6
        CD1EX                                    * 5EEE9
        RSTK=C                                   * 5EEEC
        LC(5)   DOREAL                           * 5EEEE
        ?C#A    A                                * 5EEF5
        GOYES   L_5EED7                          * 5EEF8
        C=RSTK                                   * 5EEFA
        CD1EX                                    * 5EEFC
        D1=D1+  5                                * 5EEFF
        D1=D1+  15                               * 5EF02
        C=DAT1  S                                * 5EF05
        D1=C                                     * 5EF09
        ?C=0    S                                * 5EF0C
        GOYES   L_5EED7                          * 5EF0F
        GOTO    docola                           * 5EF11
        RPL

* meta&ob -> ob=nob ? case
* refs (40): 1CF38 27FFD 2800C 2801B 2802A 28039 ...
AEQ1stcase:
        :: 'R COLA MEQ1stcase                    * 5EF15
        ;                                        * 5EF29

* Meta&+ ? case
* refs (18): 27508 57C49 57E4E 5885E 58A3E 58B62 ...
M1st+case:
        CON(5)  (*)+5                            * 5EF2E  primitive code object
        ASSEMBLE
        LC(5)   x+                               * 5EF33
        D1=D1+  5                                * 5EF3A
        GOTO    L_5EFE6                          * 5EF3D

* Meta&- ? case
* refs (7): 274EA 57C53 587BE 58868 5B23A 5D0D1 ...
M1st-case:
        CON(5)  (*)+5                            * 5EF41  primitive code object
        LC(5)   x-                               * 5EF46
        D1=D1+  5                                * 5EF4D
        GOTO    L_5EFE6                          * 5EF50

* Meta&* ? case
* refs (17): 57E58 58643 5891C 58A48 58BC6 58BEE ...
M1st*case:
        CON(5)  (*)+5                            * 5EF54  primitive code object
        LC(5)   x*                               * 5EF59
        D1=D1+  5                                * 5EF60
        GOTO    L_5EFE6                          * 5EF63

* Meta&/ ? case
* refs (7): 587C8 58926 5B72B 5D348 5D438 83A40 ...
M1st/case:
        CON(5)  (*)+5                            * 5EF67  primitive code object
        LC(5)   x/                               * 5EF6C
        D1=D1+  5                                * 5EF73
        GOTO    L_5EFE6                          * 5EF76

* Meta&NEG ? case
* refs (6): 27FF3 555C6 587D2 58872 5D0DB 5D1CB
M1stNEGcase:
        CON(5)  (*)+5                            * 5EF7A  primitive code object
        LC(5)   xNEG                             * 5EF7F
        D1=D1+  5                                * 5EF86
        GOTO    L_5EFE6                          * 5EF89

* Meta&INV ? case
* refs (8): 587DC 58930 5B735 5BC44 5BCBC 5BCE9 ...
M1stINVcase:
        CON(5)  (*)+5                            * 5EF8D  primitive code object
        LC(5)   xINV                             * 5EF92
        D1=D1+  5                                * 5EF99
        GOTO    L_5EFE6                          * 5EF9C

* Meta&^ ? case
* refs (4): 5561B 57B68 58625 5893A
M1st^case:
        CON(5)  (*)+5                            * 5EFA0  primitive code object
        LC(5)   x^                               * 5EFA5
        D1=D1+  5                                * 5EFAC
        GOTO    L_5EFE6                          * 5EFAF

* Meta&SQ ? case
* refs (1): 587E6
M1stSQcase:
        CON(5)  (*)+5                            * 5EFB3  primitive code object
        LC(5)   xSQ                              * 5EFB8
        D1=D1+  5                                * 5EFBF
        GOTO    L_5EFE6                          * 5EFC2

* Meta&FNCAPPLY ? case
* refs (7): 1F8D9 20E14 57B06 58DD7 59FB4 5B6A9 ...
M1stFNCcase:
        CON(5)  (*)+5                            * 5EFC6  primitive code object
        LC(5)   xFCNAPPLY                        * 5EFCB
        D1=D1+  5                                * 5EFD2
        GOTO    L_5EFE6                          * 5EFD5

* meta&ob1 ob2 -> ob1=ob2 ? case
* refs (10): 55418 55436 554DB 5559E 555BC 583A9 ...
MEQ1stcase:
        CON(5)  (*)+5                            * 5EFD9  primitive code object
        D=D+1   A                                * 5EFDE
        C=DAT1  A                                * 5EFE0
        D1=D1+  10                               * 5EFE3
L_5EFE6:
        A=DAT1  A                                * 5EFE6
        D1=D1-  5                                * 5EFE9
        ?C=A    A                                * 5EFEC
        GOYES   L_5EFF5                          * 5EFEF
L_5EFF1:
        GOTO    doskip                           * 5EFF1
L_5EFF5:
        GOTO    docola                           * 5EFF5

* meta1&ob1 meta2&ob2 ob3 ->
* refs (1): 5F057
MEQopscase:
        CON(5)  (*)+5                            * 5EFF9  primitive code object
        A=DAT1  A                                * 5EFFE
        D1=D1+  10                               * 5F001
        D=D+1   A                                * 5F004
        C=DAT1  A                                * 5F006
        D1=D1-  5                                * 5F009
        ?C#A    A                                * 5F00C
        GOYES   L_5EFF1                          * 5F00F
        RSTK=C                                   * 5F011
        C=DAT1  A                                * 5F013
        CD1EX                                    * 5F016
        D1=D1+  5                                * 5F019
        A=DAT1  A                                * 5F01C
        A=A+1   A                                * 5F01F
        A=A+1   A                                * 5F021
        D1=A                                     * 5F023
        A=A+A   A                                * 5F026
        A=A+A   A                                * 5F028
        CD1EX                                    * 5F02A
        A=A+C   A                                * 5F02D
        CD1EX                                    * 5F02F
        A=A+C   A                                * 5F032
        D1=A                                     * 5F034
        A=DAT1  A                                * 5F037
        D1=C                                     * 5F03A
        C=RSTK                                   * 5F03D
        ?C=A    A                                * 5F03F
        GOYES   L_5EFF5                          * 5F042
        GOTO    L_5EFF1                          * 5F044
        RPL

* meta1&ob1 meta2&ob2
* refs (1): 561CE
AEQopscase:
        :: 'R COLA MEQopscase                    * 5F048
        ;                                        * 5F05C

* meta&ob -> ob is id lam ? case
* refs (1): 58DE1
Mid1stcase:
        CON(5)  (*)+5                            * 5F061  primitive code object
        ASSEMBLE
        D1=D1+  5                                * 5F066
        C=DAT1  A                                * 5F069
        CD1EX                                    * 5F06C
        A=DAT1  A                                * 5F06F
        CD1EX                                    * 5F072
        D1=D1-  5                                * 5F075
        LC(5)   DOIDNT                           * 5F078
        ?C=A    A                                * 5F07F
        GOYES   docola                           * 5F082
        LC(5)   DOLAM                            * 5F084
        ?C=A    A                                * 5F08B
        GOYES   docola                           * 5F08E

* Exit to rpl SKIP
* refs (7): 251AB 255A8 25624 58B10 5EE08 5EED7 ...
doskip:
        LC(5)   SKIP                             * 5F090
        A=C     A                                * 5F097
        PC=(A)                                   * 5F099

* Exit to rpl COLA
* refs (11): 251B4 255B6 2562B 58B07 5EE0C 5EE98 ...
docola:
        LC(5)   COLA                             * 5F09D
        A=C     A                                * 5F0A4
        PC=(A)                                   * 5F0A6
        RPL

* id -> :: id <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (1): 24E6A
idntcase:
        :: CK&DISPATCH0                          * 5F0AA
          BINT6 COLA                             * 5F0B4  name
          BINT0 SKIP                             * 5F0BE  any
        ;                                        * 5F0C8

* id/lam -> :: id <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (7): 212DB 58F6C 59043 6014D 60DCE 852DD ...
idntlamcase:
        :: CK&DISPATCH0                          * 5F0CD
          BINT6 COLA                             * 5F0D7  name
          BINT7 COLA                             * 5F0E1  local
          BINT0 SKIP                             * 5F0EB  any
        ;                                        * 5F0F5

* 0 -> :: 0 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (12): 5633B 56363 5639A 563E5 56435 56467 ...
num0=case:
        :: CK&DISPATCH0                          * 5F0FA
          BINT1 %0=case                          * 5F104  real
          BINT2 C%0=case                         * 5F10E  complex
          BINT0 SKIP                             * 5F118  any
        ;                                        * 5F122

* %0 -> :: %0 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (4): 0FE0D 51E69 5A72F 5F109
%0=case:
        :: DUP%0= COLAcase ;                     * 5F127

* C%0 -> :: C%0 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (4): 51E1E 51ECD 522C4 5F113
C%0=case:
        :: DUP C%0= COLAcase ;                   * 5F13B

* 1 -> :: 1 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (9): 56304 563A4 563EF 564A8 5659D 565D9 ...
num1=case:
        :: CK&DISPATCH0                          * 5F154
          BINT1 %1=case                          * 5F15E  real
          BINT2 C%1=case                         * 5F168  complex
          BINT0 SKIP                             * 5F172  any
        ;                                        * 5F17C

* %1 -> :: %1 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (2): 594B8 5F163
%1=case:
        :: DUP %1 %= COLAcase ;                  * 5F181

* C%1 -> :: C%1 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (1): 5F16D
C%1=case:
        :: DUP C%1 EQUAL COLAcase ;              * 5F19F

* 2 -> :: 2 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (3): 564CB 57BD6 86DBC
num2=case:
        :: CK&DISPATCH0                          * 5F1BD
          BINT1 %2=case                          * 5F1C7  real
          BINT2 C%2=case                         * 5F1D1  complex
          BINT0 SKIP                             * 5F1DB  any
        ;                                        * 5F1E5

* %2 -> :: %2 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (2): 594C2 5F1CC
%2=case:
        :: DUP %2 %= COLAcase ;                  * 5F1EA

* C%2 -> :: C%2 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (1): 5F1D6
C%2=case:
        :: DUP C%>% %0= SWAP %2 %= AND COLAcase ; * 5F208

* -1 -> :: -1 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (5): 563AE 5640D 564B2 565A7 565E3
num-1=case:
        :: CK&DISPATCH0                          * 5F23A
          BINT1 %-1=case                         * 5F244  real
          BINT2 C%-1=case                        * 5F24E  complex
          BINT0 SKIP                             * 5F258  any
        ;                                        * 5F262

* %-1 -> :: %-1 <ob1> ; ob -> :: ob <ob2> <rest> ;
* refs (3): 48ABC 4C27E 5F249
%-1=case:
        :: DUP %-1 %= COLAcase ;                 * 5F267

* C%-1 -> :: C%-1 <ob1> ; ob -> ob <ob2> <rest> ;
* refs (1): 5F253
C%-1=case:
        :: DUP C%-1 EQUAL COLAcase ;             * 5F285

* ob -> meta
* refs (33): 1CFDA 28098 280AC 546F2 56705 56B19 ...
EXPLODE:
        :: ZEROSWAP SINNER BEGIN DUP#0<>WHILE    * 5F2A3
          :: #1-SWAP DUPTYPESYMB? ITE INNERtop& psh1& * 5F2BC
          ;                                      * 5F2DA
          REPEAT DROP ;                          * 5F2DF

* meta -> ob
* refs (19): 2809D 280B1 28124 56755 57A20 57A34 ...
IMPLODE:
        :: BINT1 OVER#=case DROPSYM              * 5F2EE
          pshzer IMPLODE~1 DROP CKSYMBN ;        * 5F302

* refs (1): 5F307
IMPLODE~1:
        :: BEGIN pullrev IMPLODE~5 IMPLODE~6 nonopcase ~psh1&rev;#0=UNTIL * 5F31B
          DUP M1stFNCcase IMPLODE~2              * 5F33E
          OBJ_26F7A case IMPLODE~4               * 5F34D
          DROP psh1&rev #0=UNTIL ;               * 5F35C

* refs (1): 5F339
~psh1&rev;#0=UNTIL:
        :: psh1&rev #0=UNTIL ;                   * 5F370

* ob1 ob2 -> ob
* refs (3): 54819 5E094 5F2FD
DROPSYM:
        :: DROP CK&DISPATCH0                     * 5F384
          BINT6 NOP                              * 5F393  name
          BINT7 NOP                              * 5F39D  local
          BINT1 NOP                              * 5F3A7  real
          BINT2 NOP                              * 5F3B1  complex
          BINT14 NOP                             * 5F3BB  unit
          BINT0 symcomp                          * 5F3C5  any
        ;                                        * 5F3CF

* refs (1): 5F348
IMPLODE~2:
        :: 2DROP psh ROT symcomp DUP4UNROLL CARCOMP NOTROMPcase * 5F3D4

* refs (1): 5F43D
OBJ_5F3FC:
          :: DROP PTR addt: xFCNAPPLY psh #0=UNTIL ; * 5F3FC
          DUPROMPTR@ ?SKIP SETROMPERR            * 5F41F
          DROP OBJ_26F7A NOTcase OBJ_5F3FC       * 5F42E
          CARCOMP 4PICK CARCOMP OBJ_5E9E1 NOTcase IMPLODE~3 * 5F442
          4ROLLSWAP 4UNROLL psh1&rev #1-ROT EVAL #1+DUP #2+PICK 3UNROLL * 5F460
          PTR addt: xFCNAPPLY psh SWAPDROP#1- #0=UNTIL ; * 5F488

* refs (1): 5F45B
IMPLODE~3:
        :: SWAPROT psh1&rev #1-ROT psh1&rev #1-SWAP EVAL psh #1-SWAP * 5F4A6
          psh1&rev pullrev1& ' xFCNAPPLY psh1&rev #0=UNTIL ; * 5F4D3

* refs (1): 5F357
IMPLODE~4:
        :: ROT #1+SWAP psh1&rev psh #1-SWAP CARCOMP EVAL psh #1-SWAP * 5F4F6
          psh1&rev #0=UNTIL ;                    * 5F528

* refs (1): 5F32A
IMPLODE~5:
        CON(5)  (*)+5                            * 5F537  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 5F53C
        LC(5)   ~CK2&Dispatch                    * 5F53F
        ?C=A    A                                * 5F546
        GOYES   L_5F564                          * 5F549
        LC(5)   ~CK2&Dispatch_2                  * 5F54B
        ?C=A    A                                * 5F552
        GOYES   L_5F564                          * 5F555
L_5F557:
        LC(5)   SKIP                             * 5F557
        A=C     A                                * 5F55E
        PC=(A)                                   * 5F560
L_5F564:
        LC(5)   COLA                             * 5F564
        A=C     A                                * 5F56B
        PC=(A)                                   * 5F56D
        RPL

* refs (1): 5F32F
IMPLODE~6:
        :: psh1&rev psh OVER ' ~CK2&Dispatch EQITE OBJ_2818D OBJ_281F6 psh * 5F571
          #0=UNTIL ;                             * 5F5A3

* refs (5): 590E3 59F7D 60A27 60E19 6B15B
OBJ_5F5AD:
        :: BINT1 splitdown OVER #2+PICK REQcasedrop xFCNAPPLY * 5F5AD
          OBJ_5F63E DUP OBJ_26F7A NOTcase        * 5F5D0

* ob1..ob4 -> F
4DROPFALSE:
          :: 4DROP FALSE ;                       * 5F5E4
          BINT2 NTHCOMPDROP SWAP infarg? SWAPDROP IT * 5F5F8
          :: 3PICK #4+PICK SWAP ;                * 5F616
          EVAL SWAPDROP ;                        * 5F62F

* refs (1): 5F5D0
OBJ_5F63E:
        :: OVER #3+PICK 2DUP #>case              * 5F63E

* ob1 ob2 ob3 -> T
3DROPTRUE:
          :: 3DROP TRUE ;                        * 5F657
          3PICK #5+ PICK NOTROMPcase             * 5F66B

4dropn;false:
          :: 4DROP FALSE ;                       * 5F67F
          ?OKINALG NOTcase SETROMPERR            * 5F693
          DUP OBJ_26F7A NOTcase                  * 5F6A2

* ob1..ob5 -> F
* refs (1): 2FDF8
5DROPFALSE:
          :: 5DROP FALSE ;                       * 5F6B1
          BINT2 NTHCOMPDROP SWAP OBJ_5E9E1 ?SKIP SWAPDROP * 5F6C5
          EVAL SWAPDROP ;                        * 5F6E3
        ASSEMBLE

* refs (23): 54E84 57B51 5BE5B 5BE86 5BED3 5BF58 ...
* Rewrite rules with the default operator table: the inline pattern/action pairs after the call are matched against the meta (see SUB_5F6F9)
RuleMatch:
        LC(5)   L_5F7E0                          * 5F6F2

* refs (5): 5C699 5C6E5 5C749 5C851 5C929
SUB_5F6F9:
        R4=C.F  A                                * 5F6F9
        GOSBVL  SAVPTR                           * 5F6FF
        C=RSTK                                   * 5F706
        D0=C                                     * 5F708
        D1=D1+  5                                * 5F70B
        CD1EX                                    * 5F70E
        R2=C.F  A                                * 5F711
L_5F717:
        C=R2.F  A                                * 5F717
        D1=C                                     * 5F71D
        C=DAT0  A                                * 5F720
        D0=D0+  5                                * 5F723
        C=C+1   P                                * 5F726
        GOC     L_5F78E                          * 5F729
        C=C-1   P                                * 5F72C
L_5F72F:
        ?C#0    A                                * 5F72F
        GOYES   L_5F738                          * 5F732
        GOTO    L_5F7C2                          * 5F734
L_5F738:
        C=C-1   P                                * 5F738
        GOC     L_5F79F                          * 5F73B
        CPEX    0                                * 5F73E
        CSR     A                                * 5F742
        D=C     A                                * 5F744
        C=0     A                                * 5F746
        CPEX    0                                * 5F748
        A=C     A                                * 5F74C
        A=A+A   A                                * 5F74E
        A=A+A   A                                * 5F750
        A=A+C   A                                * 5F752
        C=R4.F  A                                * 5F754
        C=C+A   A                                * 5F75A
        CD0EX                                    * 5F75C
        A=DAT0  A                                * 5F75F
        CD0EX                                    * 5F762
        C=DAT1  A                                * 5F765
        ?C=A    A                                * 5F768
        GOYES   L_5F785                          * 5F76B
        A=DAT0  A                                * 5F76D
        D0=D0+  5                                * 5F770
        LC(5)   DOROMP                           * 5F773
        ?C#A    A                                * 5F77A
        GOYES   L_5F717                          * 5F77D
        D0=D0+  6                                * 5F77F
        GONC    L_5F717                          * 5F782
L_5F785:
        D1=D1+  5                                * 5F785
        C=D     A                                * 5F788
        GOTO    L_5F72F                          * 5F78A
L_5F78E:
        GOSBVL  GETPTR                           * 5F78E
        A=DAT0  A                                * 5F795
        D0=D0+  5                                * 5F798
        PC=(A)                                   * 5F79B
L_5F79F:
        A=0     A                                * 5F79F
L_5F7A1:
        A=A+1   A                                * 5F7A1
        CSR     A                                * 5F7A3
        ?C=0    P                                * 5F7A5
        GOYES   L_5F7A1                          * 5F7A8
        RSTK=C                                   * 5F7AA
        R1=A.F  A                                * 5F7AC
        R0=A.F  A                                * 5F7B2
        GOSUB   L_5F821                          * 5F7B8
        C=RSTK                                   * 5F7BC
        GOTO    L_5F72F                          * 5F7BE
L_5F7C2:
        CD0EX                                    * 5F7C2
        RSTK=C                                   * 5F7C5
        GOSBVL  GETPTR                           * 5F7C7
        C=RSTK                                   * 5F7CE
        D0=(5)  COLA                             * 5F7D0
        CD0EX                                    * 5F7D7
        A=C     A                                * 5F7DA
        PC=(A)                                   * 5F7DC

L_5F7E0:
        CON(5)  x+                               * 5F7E0  address (the code jumps or points through it)

        CON(5)  x-                               * 5F7E5  address (the code jumps or points through it)

        CON(5)  x*                               * 5F7EA  address (the code jumps or points through it)

        CON(5)  x/                               * 5F7EF  address (the code jumps or points through it)

        CON(5)  x^                               * 5F7F4  address (the code jumps or points through it)

        CON(5)  xNEG                             * 5F7F9  address (the code jumps or points through it)

        CON(5)  xINV                             * 5F7FE  address (the code jumps or points through it)

        CON(5)  xEXP                             * 5F803  address (the code jumps or points through it)

        CON(5)  xALOG                            * 5F808  address (the code jumps or points through it)

        CON(5)  xLN                              * 5F80D  address (the code jumps or points through it)

        CON(5)  xLOG                             * 5F812  address (the code jumps or points through it)

        CON(5)  xPI                              * 5F817  address (the code jumps or points through it)

        CON(5)  %2                               * 5F81C  address (the code jumps or points through it)
L_5F821:
        ST=1    4                                * 5F821
L_5F824:
        ST=0    5                                * 5F824
        A=DAT1  A                                * 5F827
        LC(5)   xFCNAPPLY                        * 5F82A
        ?C=A    A                                * 5F831
        GOYES   L_5F88E                          * 5F834
        AD1EX                                    * 5F836
        B=A     A                                * 5F839
        A=DAT1  A                                * 5F83B
        LC(5)   DOCOL                            * 5F83E
        ?C#A    A                                * 5F845
        GOYES   L_5F875                          * 5F848
        D1=D1+  5                                * 5F84A
        A=DAT1  A                                * 5F84D
        LC(5)   CKINFARGS                        * 5F850
        ?C=A    A                                * 5F857
        GOYES   L_5F886                          * 5F85A
        D1=(5)  L_5F908                          * 5F85C
        P=P-1                                    * 5F863
L_5F865:
        P=P+1                                    * 5F865
        C=DAT1  A                                * 5F867
        D1=D1+  5                                * 5F86A
        ?C#A    A                                * 5F86D
        GOYES   L_5F865                          * 5F870
        GONC    L_5F877                          * 5F872
L_5F875:
        P=      0                                * 5F875
L_5F877:
        C=0     A                                * 5F877
        CPEX    0                                * 5F879
        A=B     A                                * 5F87D
        D1=A                                     * 5F87F
        GOTO    L_5F8AC                          * 5F882
L_5F886:
        ST=1    5                                * 5F886
        A=B     A                                * 5F889
        D1=A                                     * 5F88B
L_5F88E:
        D1=D1+  5                                * 5F88E
        A=DAT1  A                                * 5F891
        AD1EX                                    * 5F894
        D1=D1+  5                                * 5F897
        C=DAT1  A                                * 5F89A
        D1=A                                     * 5F89D
        D1=D1-  5                                * 5F8A0
        C=C+1   A                                * 5F8A3
        ?ST=1   5                                * 5F8A5
        GOYES   L_5F8AC                          * 5F8A8
        C=C+1   A                                * 5F8AA
L_5F8AC:
        ?ST=0   4                                * 5F8AC
        GOYES   L_5F8DB                          * 5F8AF
        D1=D1+  5                                * 5F8B1
        A=R0.F  A                                * 5F8B4
        A=A+1   A                                * 5F8BA
        R0=A.F  A                                * 5F8BC
        A=R1.F  A                                * 5F8C2
        A=A+C   A                                * 5F8C8
        A=A-1   A                                * 5F8CA
        R1=A.F  A                                * 5F8CC
        ?A=0    A                                * 5F8D2
        RTNYES                                   * 5F8D5
        GOTO    L_5F821                          * 5F8D7
L_5F8DB:
        A=R1.F  A                                * 5F8DB
        ?C>=A   A                                * 5F8E1
        RTNYES                                   * 5F8E4
        A=A-C   A                                * 5F8E6
        A=A+1   A                                * 5F8E8
        R1=A.F  A                                * 5F8EA

* refs (1): 5F977
SUB_5F8F0:
        ST=0    4                                * 5F8F0
        A=R0.F  A                                * 5F8F3
        A=A-1   A                                * 5F8F9
        R0=A.F  A                                * 5F8FB
        D1=D1-  5                                * 5F901
        GOTO    L_5F824                          * 5F904

L_5F908:
        CON(5)  CK0                              * 5F908  address (the code jumps or points through it)

        CON(5)  CK1&Dispatch                     * 5F90D  address (the code jumps or points through it)

        CON(5)  CK2&Dispatch                     * 5F912  address (the code jumps or points through it)

        CON(5)  CK3&Dispatch                     * 5F917  address (the code jumps or points through it)

        CON(5)  CK4&Dispatch                     * 5F91C  address (the code jumps or points through it)

        CON(5)  CK5&Dispatch                     * 5F921  address (the code jumps or points through it)

* meta #n #m -> meta #level
* refs (4): 5905C 5E6DE 5EAAE 5EAD1
splitup:
        CON(5)  (*)+5                            * 5F926  primitive code object
        GOSUB   SUB_5F93A                        * 5F92B
        GOSUB   L_5F821                          * 5F92F
        GOVLNG  PUSH#LOOP                        * 5F933

* refs (2): 5F92B 5F973
SUB_5F93A:
        GOSBVL  POP2#                            * 5F93A
        R0=A.F  A                                * 5F941
        R1=C.F  A                                * 5F947
        GOSBVL  SAVPTR                           * 5F94D
        A=R0.F  A                                * 5F954
        A=A-1   A                                * 5F95A
        C=A     A                                * 5F95C
        A=A+A   A                                * 5F95E
        A=A+A   A                                * 5F960
        A=A+C   A                                * 5F962
        CD1EX                                    * 5F964
        C=C+A   A                                * 5F967
        D1=C                                     * 5F969
        RTN                                      * 5F96C

* meta #n #m -> meta #lowlevel #args+1
* refs (6): 5ADF8 5B21C 5D086 5D5CE 5F5B7 69F29
splitdown:
        CON(5)  (*)+5                            * 5F96E  primitive code object
        GOSUB   SUB_5F93A                        * 5F973
        GOSUB   SUB_5F8F0                        * 5F977
        C=C-A   A                                * 5F97B
        C=C+1   A                                * 5F97D
        R1=C.F  A                                * 5F97F
        GOSBVL  PUSH2#                           * 5F985
        A=DAT0  A                                * 5F98C
        D0=D0+  5                                * 5F98F
        PC=(A)                                   * 5F992
        RPL

* meta #n -> meta1 meta2
* refs (15): 5AEC5 5B028 5B14A 5B24E 5B2A3 5B87F ...
tailpsh:
        :: #1-DUP 3UNROLL #-OVER #2+UNROLL psh ; * 5F996

* refs (3): 35144 68DB9 6DEA0
->StrExpr(_):
        :: CK&DISPATCH1                          * 5F9B9
          BINT1 OBJ_35264                        * 5F9C3  real
          BINT2 ->StdStr(c)                      * 5F9CD  complex
          BINT6 ID>$                             * 5F9D7  name
          BINT7 ID>$                             * 5F9E1  local
          BINT14 UNIT>$                          * 5F9EB  unit
          BINT0 ->StrOp(_)                       * 5F9F5  any
        ;                                        * 5F9FF

* refs (2): 40675 5F9FA
->StrOp(_):
        :: REQcasedrop xNEG                      * 5FA04
          tok- PALPTRDCMP ?SEMIDROP              * 5FA13
          tokUNKNOWN ;                           * 5FA22

* refs (1): 1CFDF
EXPR>~1:
        :: #1-SWAP                               * 5FA2C
          :: REQcasedrop xFCNAPPLY               * 5FA36

* meta&ob1&ob2 -> meta ob1
pulldroppull:
            :: SWAPDROP#1- #1-SWAP ; infarg? case * 5FA45

* meta&ob1 ob2 -> meta ob2
revpulldrop:
            :: 3UNROLL SWAPDROP#1- SWAP ;        * 5FA63
          ;                                      * 5FA7C
          pshm1 BEGIN DUP#0<>WHILE               * 5FA81
          :: larg IMPLODE psh1& ; REPEAT DROP #1-SWAP CK&DISPATCH0 * 5FA90
          BINT15 EXPR>~1~romptr                  * 5FABD  romptr
          BINT8 OBJ_5FAE0                        * 5FAC7  program
          BINT0 TRUE                             * 5FAD1  any
        ;                                        * 5FADB

* refs (2): 5FACC 8D25A
OBJ_5FAE0:
        :: DUP OBJ_26F7A IT                      * 5FAE0
          :: BINT3 NTHELCOMP case                * 5FAF4

eval;tq:
            :: EVAL RDROP TRUE ;                 * 5FB08
            DUP ;                                * 5FB21
          DROP PALPTRDCMP NOTcaseFALSE $>ID      * 5FB2B
          COMPILEID ;                            * 5FB3F

* T -> :: <ob1> <rest> ; F -> F
* refs (71): 09302 09398 0C7DA 0C7E4 0DFE3 0F3F8 ...
NOTcaseFALSE:
        :: NOTcase RDROPFALSE                    * 5FB49
        ;                                        * 5FB58

* refs (5): 2453C 245E1 246C2 24E4C 27EDB
~;eval;q:
        :: 'R EVAL RDROP ;                       * 5FB5D

* # ob ob' -> #+1 ob ob'
* refs (19): 275E4 27760 278AA 27981 279D6 27F8F ...
ROT#1+UNROT:
        CON(5)  (*)+5                            * 5FB76  primitive code object
        ASSEMBLE
        D1=D1+  10                               * 5FB7B
        C=DAT1  A                                * 5FB7E
        CD1EX                                    * 5FB81
        D1=D1+  5                                * 5FB84
        A=DAT1  A                                * 5FB87
        D1=C                                     * 5FB8A
        A=A+1   A                                * 5FB8D
        LC(5)   #0002B                           * 5FB8F
        ?C<A    A                                * 5FB96
        GOYES   L_5FBBA                          * 5FB99
        GOSUB   SUB_5FBDC                        * 5FB9B
        A=A+A   A                                * 5FB9F
        LC(5)   BINT0                            * 5FBA1
        A=A+C   A                                * 5FBA8
L_5FBAA:
        DAT1=A  A                                * 5FBAA
        D1=D1-  10                               * 5FBAD
        A=DAT0  A                                * 5FBB0
        D0=D0+  5                                * 5FBB3
        PC=(A)                                   * 5FBB6
L_5FBBA:
        R0=A.F  A                                * 5FBBA
        D1=D1-  10                               * 5FBC0
        GOSBVL  SAVPTR                           * 5FBC3
        GOSBVL  PUSH#                            * 5FBCA
        A=DAT1  A                                * 5FBD1
        D=D+1   A                                * 5FBD4
        D1=D1+  15                               * 5FBD6
        GONC    L_5FBAA                          * 5FBD9

* refs (2): 5FB9B 5FBFC
SUB_5FBDC:
        C=A     A                                * 5FBDC
        A=A+A   A                                * 5FBDE
        A=A+A   A                                * 5FBE0
        A=A+C   A                                * 5FBE2
        RTN                                      * 5FBE4

* #0 M -> COLA ob M -> SKIP
* refs (4): 57F05 57F69 5815B 581A1
pick1#0=case:
        CON(5)  (*)+5                            * 5FBE6  primitive code object
        C=DAT1  A                                * 5FBEB
        CD1EX                                    * 5FBEE
        D1=D1+  5                                * 5FBF1
        A=DAT1  A                                * 5FBF4
        D1=C                                     * 5FBF7
        A=A+1   A                                * 5FBFA
        GOSUB   SUB_5FBDC                        * 5FBFC
        CD1EX                                    * 5FC00
        A=A+C   A                                * 5FC03
        D1=A                                     * 5FC05
        A=DAT1  A                                * 5FC08
        D1=A                                     * 5FC0B
        D1=D1+  5                                * 5FC0E
        A=DAT1  A                                * 5FC11
        D1=C                                     * 5FC14
        ?A=0    A                                * 5FC17
        GOYES   L_5FC20                          * 5FC1A
        GOTO    L_5F557                          * 5FC1C
L_5FC20:
        GOTO    L_5F564                          * 5FC20
        RPL

* n..1 #n -> n..1 #n n+1
* refs (9): 10AE0 572DE 59F50 605CC 6091E 60D07 ...
DUP#2+PICK:
        :: DUP #2+PICK ;                         * 5FC24

* meta -> %1 #1 meta
* refs (1): 86687
%1pshm1:
        :: %1 pshm1 ;                            * 5FC38

* refs (1): 1F3C7
B2(n)<='B1(1)':
        :: #1-SWAP symcomp psh1& ;               * 5FC4C

* refs (1): 83F00
OBJ_5FC65:
        :: pargop ROMPTR 0F0 04B psh #1-SWAP pshm1 ROMPTR 0F0 04B pshtop& * 5FC65
          top& ;                                 * 5FC99
        ASSEMBLE

* refs (1): 60219
SUB_5FCA3:
        C=C-1   A                                * 5FCA3
        R0=C.F  A                                * 5FCA5
L_5FCAB:
        A=DAT0  A                                * 5FCAB
        C=DAT1  A                                * 5FCAE
        ?C#A    A                                * 5FCB1
        GOYES   L_5FCBA                          * 5FCB4
        GOTO    L_5FD76                          * 5FCB6
L_5FCBA:
        AD0EX                                    * 5FCBA
        R1=A.F  A                                * 5FCBD
        CD1EX                                    * 5FCC3
        R2=C.F  A                                * 5FCC6
        A=DAT0  A                                * 5FCCC
        C=DAT1  A                                * 5FCCF
        ?C#A    A                                * 5FCD2
        GOYES   L_5FCFA                          * 5FCD5
        CD1EX                                    * 5FCD7
        R3=C.F  A                                * 5FCDA
        AD0EX                                    * 5FCE0
        GOSUB   SUB_5FCFC                        * 5FCE3
        B=A     A                                * 5FCE7
        CR3EX.F A                                * 5FCE9
        A=C     A                                * 5FCEF
        GOSUB   SUB_5FCFC                        * 5FCF1
        ?A=B    A                                * 5FCF5
        GOYES   L_5FD13                          * 5FCF8
L_5FCFA:
        RTNSC                                    * 5FCFA

* refs (2): 5FCE3 5FCF1
SUB_5FCFC:
        D0=A                                     * 5FCFC
        D1=A                                     * 5FCFF
        GOSBVL  SKIPOB                           * 5FD02
        AD0EX                                    * 5FD09
        CD1EX                                    * 5FD0C
        A=A-C   A                                * 5FD0F
        RTN                                      * 5FD11
L_5FD13:
        D1=C                                     * 5FD13
        A=R3.F  A                                * 5FD16
        D0=A                                     * 5FD1C
        C=B     A                                * 5FD1F
        P=C     0                                * 5FD21
        CSR     A                                * 5FD25
        B=C     A                                * 5FD27
        B=B-1   A                                * 5FD29
        GOC     L_5FD46                          * 5FD2B
L_5FD2E:
        A=DAT0  W                                * 5FD2E
        C=DAT1  W                                * 5FD32
        D0=D0+  16                               * 5FD36
        D1=D1+  16                               * 5FD39
        ?C#A    W                                * 5FD3C
        GOYES   L_5FD58                          * 5FD3F
        B=B-1   A                                * 5FD41
        GONC    L_5FD2E                          * 5FD43
L_5FD46:
        P=P-1                                    * 5FD46
        GOC     L_5FD5E                          * 5FD48
        A=DAT0  WP                               * 5FD4B
        C=DAT1  WP                               * 5FD4F
        ?C=A    WP                               * 5FD53
        GOYES   L_5FD5E                          * 5FD56
L_5FD58:
        P=      0                                * 5FD58
        GOTO    L_5FCFA                          * 5FD5A
L_5FD5E:
        P=      0                                * 5FD5E
        BSL     A                                * 5FD60
        AD0EX                                    * 5FD62
        A=A-B   A                                * 5FD65
        D0=A                                     * 5FD67
        CD1EX                                    * 5FD6A
        C=C-B   A                                * 5FD6D
        D1=C                                     * 5FD6F
        GOTO    L_5FD88                          * 5FD72
L_5FD76:
        AD0EX                                    * 5FD76
        R1=A.F  A                                * 5FD79
        CD1EX                                    * 5FD7F
        R2=C.F  A                                * 5FD82
L_5FD88:
        A=R0.F  A                                * 5FD88
        A=A-1   A                                * 5FD8E
        GOC     L_5FDB5                          * 5FD90
        R0=A.F  A                                * 5FD93
        A=R1.F  A                                * 5FD99
        D0=A                                     * 5FD9F
        D0=D0+  5                                * 5FDA2
        C=R2.F  A                                * 5FDA5
        D1=C                                     * 5FDAB
        D1=D1+  5                                * 5FDAE
        GOTO    L_5FCAB                          * 5FDB1
L_5FDB5:
        RTNCC                                    * 5FDB5
        RPL

* refs (2): 60437 606A3
OBJ_5FDB7:
        ::                                       * 5FDB7

{'ct,'pp,'ep}:
          {                                      * 5FDBC

* refs (4): 5FE33 5FF00 5FF0F 60080
Π'ct:
            LAM 'ct                              * 5FDC1

* refs (9): 5FDF7 5FE38 5FECE 5FEDD 5FF28 5FF37 ...
Π'pp:
            LAM 'pp                              * 5FDCE

* refs (13): 5FE0B 5FE3D 5FE83 5FEC4 5FF41 5FF50 ...
Π'ep:
            LAM 'ep }                            * 5FDDB
          BIND BEGIN Π'pp PICK OBJ_5FF5F OBJ_5FE56 Π'ep #1+PICK EQUALNOTcase * 5FDED
          OBJ_6007B                              * 5FE1A
          OBJ_5FF23 OBJ_5FEFB UNTIL              * 5FE1F

* refs (2): 5FEF1 60290
OBJ_5FE2E:
          :: Π'ct Π'pp Π'ep ABND TRUE ; ;        * 5FE2E

* refs (1): 5FE06
OBJ_5FE56:
        :: undo DROP REQcasedrop NULL{}          * 5FE56
          OBJ_600FD REQcasedrop {}_600F3         * 5FE6F
          OBJ_60139 Π'ep OBJ_6019D NOTcase       * 5FE7E
          :: 2DROP COLA OBJ_6007B                * 5FE92
          ;                                      * 5FEA6
          SWAP BINT2 NTHCOMPDROP #+ ' Π'ep STO Π'pp #1+ ' Π'pp STO OBJ_5FEFB * 5FEAB
          UNTIL OBJ_5FE2E ;                      * 5FEEC

* refs (3): 5FE24 5FEE7 60286
OBJ_5FEFB:
        :: Π'ct #1-DUP ' Π'ct STO #0= ;          * 5FEFB

* refs (1): 5FE1F
OBJ_5FF23:
        :: Π'pp #1+ ' Π'pp STO Π'ep #1+ ' Π'ep STO ; * 5FF23

* refs (1): 5FE01
OBJ_5FF5F:
        :: OBJ_5FF73 COLAcase ;                  * 5FF5F

* refs (5): 5FF64 600C1 60996 609C8 60BAD
OBJ_5FF73:
        CON(5)  (*)+5                            * 5FF73  primitive code object
        ASSEMBLE
        C=DAT1  A                                * 5FF78
        CD1EX                                    * 5FF7B
        RSTK=C                                   * 5FF7E
        A=DAT1  A                                * 5FF80
        LC(5)   DOIDNT                           * 5FF83
        ?C=A    A                                * 5FF8A
        GOYES   L_5FFAE                          * 5FF8D
        LC(5)   DOLAM                            * 5FF8F
        ?C=A    A                                * 5FF96
        GOYES   L_5FFAE                          * 5FF99
L_5FF9B:
        LA(5)   FALSE                            * 5FF9B
L_5FFA5:
        C=RSTK                                   * 5FFA5
        D1=C                                     * 5FFA7
        PC=(A)                                   * 5FFAA
L_5FFAE:
        D1=D1+  5                                * 5FFAE
        A=DAT1  B                                * 5FFB1
        A=A-1   B                                * 5FFB4
        GOC     L_5FF9B                          * 5FFB7
        D1=D1+  2                                * 5FFBA
        A=DAT1  B                                * 5FFBD
        LC(2)   #26                              * 5FFC0
        ?C#A    B                                * 5FFC4
        GOYES   L_5FF9B                          * 5FFC7
        LA(5)   TRUE                             * 5FFC9
        GONC    L_5FFA5                          * 5FFD3
        RPL

* refs (1): 60107
OBJ_5FFD6:
        :: BINT1 SWAP#1+ BEGIN DUP#1+PICK OBJ_6001C SWAPDROP ROT#+ #1- * 5FFD6
          SWAP#1+ OVER#0= UNTIL SWAPDROP#1- ;    * 60003
