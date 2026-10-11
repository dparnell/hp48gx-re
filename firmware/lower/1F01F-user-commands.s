* HP 48GX ROM revision R, #1F01F-#22004: User commands
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: xFCNAPPLY xWHERE XEQRCL xPURGE xSTEQ xDUP xDROP ChkExpr1Name xLINFIT xSWAP ä dup;r?:dq/sk
* Follows on from the previous file (at #1F01F in the original ROM).
        NIBHEX  0FDD7                            * 1F01F  ðÝ
        RPL

        ROMPTR  0F0 092                          * 1F024

        ROMPTR  0F0 019                          * 1F02F

        CON(5)  nWHEREDER                        * 1F03A  address (the code jumps or points through it)

        CON(5)  OBJ_5A1F8                        * 1F03F  address (the code jumps or points through it)
        NIBHEX  000                              * 1F044  .

* ob ob' -> %0
* refs (6): 1EFA1 1EFAB 1EFB5 1F122 4F4F8 4F50C
2DROP%0:
        ::                                       * 1F047
          2DROP                                  * 1F04C
          %0_2A2B4                               * 1F051
        ;                                        * 1F056

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
        ::                                       * 1F0F5
          SWAP                                   * 1F0FA
          ChkExpr1Name                           * 1F0FF
          SWAPCOLA                               * 1F104
          SYMDERSTEP                             * 1F109
        ;                                        * 1F10E

* QN %/C%/u -> symf
* refs (3): 1EFEB 1EFF5 1EFFF
XEQSYMDERCON:
        ::                                       * 1F113
          SWAP                                   * 1F118
          ChkExpr1Name                           * 1F11D
          2DROP%0                                * 1F122
        ;                                        * 1F127

* -> EQ
* ROMPTR 002 0F9 RCEQ
* refs (2): 189EA C5376
        CON(1)  8                                * 1F12C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F12D  library
        CON(3)  #0F9                             * 1F130  command
xRCEQ:
        ::                                       * 1F133
          CK0                                    * 1F138
          DORCLE                                 * 1F13D
        ;                                        * 1F142

* ob ->
* ROMPTR 002 0FA STEQ
* refs (14): 189EA C5371 D3054 D3135 D3288 D33FC ...
        CON(1)  8                                * 1F147  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F148  library
        CON(3)  #0FA                             * 1F14B  command
xSTEQ:
        ::                                       * 1F14E
          CK1                                    * 1F153
          STRIPTAGS                              * 1F158
          DOSTOE                                 * 1F15D
        ;                                        * 1F162

* prog/s var guess -> x prog/s var {guesses} -> x
* ROMPTR 002 0FB ROOT
* refs (2): 189EA 3C279
        CON(1)  8                                * 1F167  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F168  library
        CON(3)  #0FB                             * 1F16B  command
xROOT:
        ::                                       * 1F16E
          CK3&Dispatch                           * 1F173
          SYMIDREAL                              * 1F178
          root                                   * 1F17D
          SYMIDCMP                               * 1F182
          root                                   * 1F187
          SYMIDLIST                              * 1F18C
          root                                   * 1F191
          PROGIDREAL                             * 1F196
          root                                   * 1F19B
          PROGIDCMP                              * 1F1A0
          root                                   * 1F1A5
          PROGIDLIST                             * 1F1AA
          root                                   * 1F1AF
          SYMIDEXT                               * 1F1B4
          root                                   * 1F1B9
          PROGIDEXT                              * 1F1BE
          root                                   * 1F1C3
        ;                                        * 1F1C8

* ROMPTR 002 0FC ∫
* refs (3): 189EA 49841 5A50E
        CON(1)  14                               * 1F1CD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F1CE  library
        CON(3)  #0FC                             * 1F1D1  command
INTEG:
        ::                                       * 1F1D4
          CK4&Dispatch                           * 1F1D9
          BINT6                                  * 1F1DE
          XEQINTEGID                             * 1F1E3
          BINT7                                  * 1F1E8
          XEQINTEGID                             * 1F1ED
        ;                                        * 1F1F2

* slots of 002 0FC (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_65A51                        * 1F1F7  slot 0
        CON(5)  xINTEGRAL                        * 1F1FC  slot 1

* ob ob ob id/lam -> symf
* refs (4): 1F1E3 1F1ED B6A4D B6A70
XEQINTEGID:
        ::                                       * 1F201  slot 2
          symcomp                                * 1F206
          COLA                                   * 1F20B
          XEQINTEG                               * 1F210
        ;                                        * 1F215
        CON(2)  #A7                              * 1F21A  end of the slots: property byte (meaning not yet known)

* ROMPTR 002 0FD
* refs (7): 189EA 1F1FC 5693F 5AC2C 85197 85D4A ...
        CON(1)  5                                * 1F21C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F21D  library
        CON(3)  #0FD                             * 1F220  command
xINTEGRAL:
        ::                                       * 1F223
          CK4&Dispatch                           * 1F228
          BINT9                                  * 1F22D
          XEQINTEG                               * 1F232
        ;                                        * 1F237
        NIBHEX  15A56                            * 1F23C  QZ

#053626060410h:
        HXS     014060626350                     * 1F241
        NIBHEX  60ED7                            * 1F257  .Þ

        ROMPTR  0F0 093                          * 1F25C

        CON(5)  OBJ_5B875                        * 1F267  address (the code jumps or points through it)

        CON(5)  nWHEREINTG                       * 1F26C  address (the code jumps or points through it)

        CON(5)  OBJ_5A211                        * 1F271  address (the code jumps or points through it)
        NIBHEX  0000                             * 1F276  ..

* ob ob ob QN -> symf
* refs (2): 1F210 1F232
XEQINTEG:
        ::                                       * 1F27A
          ChkExpr1Name                           * 1F27F
          BINT2                                  * 1F284
          nmetasyms                              * 1F289
          2SWAP                                  * 1F28E
          NOTNUM?                                * 1F293
          NOTcase                                * 1F298
          NUMINTEG                               * 1F29D
          BINT2                                  * 1F2A2
          nmetasyms                              * 1F2A7
          2SWAP                                  * 1F2AC
          COLA                                   * 1F2B1
          SYMINTEG                               * 1F2B6
        ;                                        * 1F2BB
        NIBHEX  3A                               * 1F2C0  £

* ROMPTR 002 0FE Σ
* refs (8): 189EA 569FC 56ABF 5AE66 6F04A 8528C ...
        CON(1)  5                                * 1F2C2  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F2C3  library
        CON(3)  #0FE                             * 1F2C6  command
ä:
        ::                                       * 1F2C9
          CK4&Dispatch                           * 1F2CE
          #       A110                           * 1F2D3  41232
          %%SUM                                  * 1F2DD
          #       AA10                           * 1F2E2  43536
          SYM%SUM                                * 1F2EC
          #       A1A0                           * 1F2F1  41376
          %SYMSUM                                * 1F2FB
          #       AAA0                           * 1F300  43680
          SYMSUM                                 * 1F30A
        ;                                        * 1F30F
        NIBHEX  4FE56                            * 1F314  ô^

#052606073410h:
        HXS     014370606250                     * 1F319
        NIBHEX  11ED7                            * 1F32F  .Þ

        ROMPTR  0F0 094                          * 1F334

        CON(5)  nWHERESUM                        * 1F33F  address (the code jumps or points through it)

        CON(5)  OBJ_5A22A                        * 1F344  address (the code jumps or points through it)
        NIBHEX  0000                             * 1F349  ..

* ROMPTR 002 0FF |
* refs (4): 189EA 5A531 B6AFC B6B24
        CON(1)  14                               * 1F34D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F34E  library
        CON(3)  #0FF                             * 1F351  command
WHERE:
        ::                                       * 1F354
          CK2&Dispatch                           * 1F359
          SYMLIST                                * 1F35E
          SYMWHERE                               * 1F363
          BINT21                                 * 1F368
          DROP                                   * 1F36D
          BINT37                                 * 1F372
          DROP                                   * 1F377
        ;                                        * 1F37C

* slots of 002 0FF (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6DB0C                        * 1F381  slot 0
        CON(5)  xWHERE                           * 1F386  slot 1

* symf {} -> symf
* refs (1): 1F363
SYMWHERE:
        ::                                       * 1F38B  slot 2
          ZEROSWAP                               * 1F390
          INNERDUP                               * 1F395
          BINT2                                  * 1F39A
          #/                                     * 1F39F
          SWAP                                   * 1F3A4
          #0<>                                   * 1F3A9
          OVER#0=                                * 1F3AE
          ORcase                                 * 1F3B3
          SETSIZEERR                             * 1F3B8
          ZERO_DO                                * 1F3BD
          pullpsh1&                              * 1F3C2
          B2(n)<='B1(1)'                         * 1F3C7
          LOOP                                   * 1F3CC
          DROP                                   * 1F3D1
          #1+                                    * 1F3D6
          COLA                                   * 1F3DB
          XEQSYMWHERE                            * 1F3E0
        ;                                        * 1F3E5
        CON(2)  #A3                              * 1F3EA  end of the slots: property byte (meaning not yet known)

* ROMPTR 002 100
* refs (21): 189EA 1F386 1F425 5473D 548E6 5A171 ...
        CON(1)  5                                * 1F3EC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F3ED  library
        CON(3)  #100                             * 1F3F0  command
xWHERE:
        ::                                       * 1F3F3
          CKINFARGS                              * 1F3F8
          XEQSYMWHERE                            * 1F3FD
        ;                                        * 1F402

* slots of 002 100 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6DB0C                        * 1F407  slot 0

#5B0734122h:
        HXS     2214370B50                       * 1F40C  slot 1
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
          ::                                     * 1F43E
            pullrev                              * 1F443
            DUPUNROT                             * 1F448
            BINT1                                * 1F44D
            nmetasyms                            * 1F452
            DROPSWAP                             * 1F457
            symcomp                              * 1F45C
            pshm1                                * 1F461
            top&                                 * 1F466
            DUP                                  * 1F46B
            BINT3                                * 1F470
            #<case                               * 1F475
            SETSIZEERR                           * 1F47A
            pshzer                               * 1F47F
            DUP#1-                               * 1F484
            #2/                                  * 1F489
            ZERO_DO                              * 1F48E
            #1-SWAP                              * 1F493
            BINT1                                * 1F498
            nmetasyms                            * 1F49D
            psh1&                                * 1F4A2
            #1-SWAP                              * 1F4A7
            symcomp                              * 1F4AC
            ChkExpr1Name                         * 1F4B1
            psh1&                                * 1F4B6
            LOOP                                 * 1F4BB
            #1=case                              * 1F4C0

->expr1;pushB[n]:
            ::                                   * 1F4C5
              symcomp                            * 1F4CA
              psh1top&                           * 1F4CF
            ;                                    * 1F4D4
            SETSIZEERR                           * 1F4D9
          ;                                      * 1F4DE
          COLA                                   * 1F4E3
          SYMBWHERE                              * 1F4E8
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
        ::                                       * 1F500
          CK1&Dispatch                           * 1F505
          BINT9                                  * 1F50A
          quote(_)                               * 1F50F
          BINT0                                  * 1F514
          NOP                                    * 1F519
        ;                                        * 1F51E

* slots of 002 101 (derivative, inverse, ...: used by the symbolic code)
#052410h:
        HXS     014250                           * 1F523  slot 0
        CON(5)  nCOLCTQUOTE                      * 1F533  slot 1
        CON(5)  OBJ_5A26B                        * 1F538  slot 2
        CON(5)  0                                * 1F53D  slot 3: none

* refs (1): 1F50F
quote(_):
        ::                                       * 1F542  slot 4
          SINNER                                 * 1F547
          CKSYMBN                                * 1F54C
        ;                                        * 1F551

* ROMPTR 002 102
* refs (2): 189EA 5A554
        CON(1)  10                               * 1F556  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F557  library
        CON(3)  #102                             * 1F55A  command
APPLY:
        ::                                       * 1F55D
          CK2&Dispatch                           * 1F562
          BINT86                                 * 1F567
          apply(li,nm)                           * 1F56C
          BINT87                                 * 1F571
          apply(li,nm)                           * 1F576
        ;                                        * 1F57B

* slots of 002 102 (derivative, inverse, ...: used by the symbolic code)
        CON(5)  xAPPLY                           * 1F580  slot 0

* refs (2): 1F56C 1F576
apply(li,nm):
        ::                                       * 1F585  slot 1
          symcomp                                * 1F58A
          SWAP                                   * 1F58F
          INNERDUP                               * 1F594
          #0<>                                   * 1F599
          ?SKIP                                  * 1F59E
          SETSTACKERR                            * 1F5A3
          #1+                                    * 1F5A8
          COLA                                   * 1F5AD
          apply(_,s)                             * 1F5B2
        ;                                        * 1F5B7
        CON(2)  #81                              * 1F5BC  end of the slots: property byte (meaning not yet known)

* {symb1 .. symbn} f -> f(symb1...symbn)
* ROMPTR 002 103
* refs (4): 189EA 1F580 5A43C 6E384
        CON(1)  1                                * 1F5BE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F5BF  library
        CON(3)  #103                             * 1F5C2  command
xAPPLY:
        ::                                       * 1F5C5
          CKINFARGS                              * 1F5CA
          apply(_,s)                             * 1F5CF
        ;                                        * 1F5D4

* slots of 002 103 (derivative, inverse, ...: used by the symbolic code)
#059063410h:
        HXS     014360950                        * 1F5D9  slot 0
        CON(5)  D/DAPPLY                         * 1F5EC  slot 1
        CON(5)  OBJ_5A27F                        * 1F5F1  slot 2

* refs (2): 1F5B2 1F5CF
apply(_,s):
        ::                                       * 1F5F6  slot 3
          uncrunch                               * 1F5FB
          OBJ_1F960                              * 1F600
          DUP#1-                                 * 1F605
          dvarlsBIND                             * 1F60A
          pullrev                                * 1F60F
          symcomp                                * 1F614
          SWAPDROP                               * 1F619
          ChkExpr1Name                           * 1F61E
          CARCOMP                                * 1F623
          GOTO                                   * 1F628
          L_1F6EF                                * 1F62D
        ;                                        * 1F632
        CON(2)  #A2                              * 1F637  end of the slots: property byte (meaning not yet known)
        ASSEMBLE
        NOP3                                     * 1F639
        SETHEX                                   * 1F63C
        RTN                                      * 1F63E
        RPL

* ROMPTR 002 104
* refs (26): 189EA 1F73A 27A80 27C06 2850B 28B0F ...
xFCNAPPLY:
        ::                                       * 1F640
          {'dvar}                                * 1F645
          BIND                                   * 1F64A
          0LASTOWDOB!                            * 1F64F
          CARCOMP                                * 1F654
          CK1NOLASTWD                            * 1F659
          DEPTH                                  * 1F65E
          1GETLAM                                * 1F663
          #>?SKIP                                * 1F668
          SETSTACKERR                            * 1F66D
          DUP                                    * 1F672
          ROMPTR@NOT                             * 1F677
          case                                   * 1F67C
          OBJ_1F6E0                              * 1F681
          CK&DISPATCH0                           * 1F686
          ROMPANY                                * 1F68B
          OBJ_1F86B                              * 1F690
          BINT8                                  * 1F695
          OBJ_1F758                              * 1F69A
          BINT5                                  * 1F69F
          OBJ_1F776                              * 1F6A4
          BINT4                                  * 1F6A9
          OBJ_1F7C1                              * 1F6AE
          BINT0                                  * 1F6B3
          INVFUNCERR                             * 1F6B8
        ;                                        * 1F6BD

        CON(5)  OBJ_6D0D7                        * 1F6C2  address (the code jumps or points through it)

        CON(5)  OBJ_56D1F                        * 1F6C7  address (the code jumps or points through it)

        ROMPTR  0F0 097                          * 1F6CC
        NIBHEX  7DBD70000                        * 1F6D7  ×Û..

* refs (5): 1F681 1F7B7 1F811 85E71 85E7B
OBJ_1F6E0:
        ::                                       * 1F6E0
          DROP                                   * 1F6E5
          CK0NOLASTWD                            * 1F6EA
L_1F6EF:
          1GETLAM                                * 1F6EF
          #1+                                    * 1F6F4
          dup                                    * 1F6F9
          nmetasyms                              * 1F6FE
          1GETABND                               * 1F703
          #1+                                    * 1F708
          NDROP                                  * 1F70D
          #1-SWAP                                * 1F712
          symcomp                                * 1F717
          OVER                                   * 1F71C
          BINT2                                  * 1F721
          psh                                    * 1F726
          SINNERMETA                             * 1F72B
          pshtop&                                * 1F730
          Cr                                     * 1F735
          xFCNAPPLY                              * 1F73A
          CK1NOLASTWD                            * 1F73F
          NOTNUM?                                * 1F744
          ?SKIP                                  * 1F749
          SETNONEXTERR                           * 1F74E
        ;                                        * 1F753

* refs (1): 1F69A
OBJ_1F758:
        ::                                       * 1F758
          SWAPDROP                               * 1F75D
          OBJ_5DEB9                              * 1F762
          ABND                                   * 1F767
          COLA_EVAL                              * 1F76C
        ;                                        * 1F771

* refs (2): 1F6A4 1F7D5
OBJ_1F776:
        ::                                       * 1F776
          1GETLAM                                * 1F77B
          BINT1                                  * 1F780
          #<>case                                * 1F785
          ARGNUMERR                              * 1F78A
          NOTNUM?                                * 1F78F
          NOTcase                                * 1F794
          OBJ_1F81B                              * 1F799
          3PICK                                  * 1F79E
          REALcase                               * 1F7A3
          OBJ_1F81B                              * 1F7A8
          DROPDUP                                * 1F7AD
          COLA                                   * 1F7B2
          OBJ_1F6E0                              * 1F7B7
        ;                                        * 1F7BC

* refs (1): 1F6AE
OBJ_1F7C1:
        ::                                       * 1F7C1
          1GETLAM                                * 1F7C6
          BINT2                                  * 1F7CB
          #<>case                                * 1F7D0
          OBJ_1F776                              * 1F7D5
          NOTNUM?                                * 1F7DA
          NOTcase                                * 1F7DF
          OBJ_1F81B                              * 1F7E4
          4PICK                                  * 1F7E9
          TYPEREAL?                              * 1F7EE
          4PICK                                  * 1F7F3
          TYPEREAL?                              * 1F7F8
          ANDcase                                * 1F7FD
          OBJ_1F81B                              * 1F802
          DROPDUP                                * 1F807
          COLA                                   * 1F80C
          OBJ_1F6E0                              * 1F811
        ;                                        * 1F816

* refs (4): 1F799 1F7A8 1F7E4 1F802
OBJ_1F81B:
        ::                                       * 1F81B
          SWAPDROP                               * 1F820
          1GETLAM                                * 1F825
          BINT2                                  * 1F82A
          #=ITE                                  * 1F82F
          CK3NOLASTWD                            * 1F834
          CK2NOLASTWD                            * 1F839
          1GETSWAP                               * 1F83E
          1PUTLAM                                * 1F843
          {}N                                    * 1F848
          1ABNDSWAP                              * 1F84D
          CK2NOLASTWD                            * 1F852
          '                                      * 1F857
          xGET                                   * 1F85C
          EvalNoCK                               * 1F861
        ;                                        * 1F866

* refs (1): 1F690
OBJ_1F86B:
        ::                                       * 1F86B

* refs (1): 85E8A
OBJ_1F870:
          ::                                     * 1F870
            DROP                                 * 1F875
            ?OKINALG                             * 1F87A
            ?SKIP                                * 1F87F
            SETSIZEERR                           * 1F884
            OBJ_26BED                            * 1F889
            ?SKIP                                * 1F88E
            ARGNUMERR                            * 1F893
            SWAPDROPDUP                          * 1F898
            MINUSONE                             * 1F89D
            #=                                   * 1F8A2
            casedrop                             * 1F8A7
            1ABNDSWAP                            * 1F8AC
            1GETABND                             * 1F8B1
            #=?SKIP                              * 1F8B6
            ARGNUMERR                            * 1F8BB
          ;                                      * 1F8C0
          COLA_EVAL                              * 1F8C5
        ;                                        * 1F8CA

* refs (1): 20D22
StoLT(_,ex):
        ::                                       * 1F8CF
          SINNER                                 * 1F8D4
          M1stFNCcase                            * 1F8D9
          ::                                     * 1F8DE
            SWAPDROP#1-                          * 1F8E3
            #2-                                  * 1F8E8
            SWAPROT                              * 1F8ED
            CARCOMP                              * 1F8F2
            SWAP                                 * 1F8F7
            #>2case                              * 1F8FC
            ARGNUMERR                            * 1F901
            pshm1                                * 1F906
            pshzer                               * 1F90B
            BEGIN                                * 1F910
            larg                                 * 1F915
            CKSYMBN                              * 1F91A
            psh1&                                * 1F91F
            #0=UNTIL                             * 1F924
            DROP                                 * 1F929
            {}N                                  * 1F92E
            SWAPDROP                             * 1F933
            ROT                                  * 1F938
            CK3NOLASTWD                          * 1F93D
            '                                    * 1F942
            xPUT                                 * 1F947
            EvalNoCK                             * 1F94C
          ;                                      * 1F951
          SETTYPEERR                             * 1F956
        ;                                        * 1F95B

* refs (1): 1F600
OBJ_1F960:
        ::                                       * 1F960
          BINT3                                  * 1F965
          RROLL                                  * 1F96A
        ;                                        * 1F96F

        CON(5)  NOP                              * 1F974  address (the code jumps or points through it)

        CON(5)  NOP                              * 1F979  address (the code jumps or points through it)

* refs (1): 56B2D
Π'fcn:
        LAM     'fcn                             * 1F97E
        NIBHEX  00                               * 1F98D  .

* ROMPTR 002 105
* refs (7): 189EA 28011 28478 5AA4F 5F53F 5F58A ...
        CON(1)  0                                * 1F98F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F990  library
        CON(3)  #105                             * 1F993  command
ROMP_002_105:
        ::                                       * 1F996
          CK2&Dispatch                           * 1F99B
        ;                                        * 1F9A0

* slots of 002 105 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * 1F9A5  end of the slots: property byte (meaning not yet known)

* ROMPTR 002 106
* refs (5): 189EA 28020 28464 2967E 5F54B
        CON(1)  0                                * 1F9A7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1F9A8  library
        CON(3)  #106                             * 1F9AB  command
ROMP_002_106:
        ::                                       * 1F9AE
          CK2&Dispatch                           * 1F9B3
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
        ::                                       * 1F9C4
          CK1                                    * 1F9C9
          FALSE                                  * 1F9CE
          OBJ_1FA07                              * 1F9D3
          ABND                                   * 1F9D8
        ;                                        * 1F9DD
        ASSEMBLE
        HST=0   0                                * 1F9E2
        CLRST                                    * 1F9E5
        RTN                                      * 1F9E7
        RPL

* x -> symb
* ROMPTR 002 108 →Qπ
* refs (1): 189EA
x->QPI:
        ::                                       * 1F9E9
          CK1                                    * 1F9EE
          TRUE                                   * 1F9F3
          OBJ_1FA07                              * 1F9F8
          ABND                                   * 1F9FD
        ;                                        * 1FA02

* refs (3): 1F9D3 1F9F8 72F51
* slots of 002 108 (derivative, inverse, ...: used by the symbolic code)
OBJ_1FA07:
        ::                                       * 1FA07  slot 0
          {'piflag}                              * 1FA0C
          BIND                                   * 1FA11
          STRIPTAGS                              * 1FA16
          CK&DISPATCH1                           * 1FA1B
          BINT1                                  * 1FA20
          OBJ_5A9F5                              * 1FA25
          BINT2                                  * 1FA2A
          OBJ_5AA13                              * 1FA2F
          BINT9                                  * 1FA34
          OBJ_5AA5E                              * 1FA39
          BINT0                                  * 1FA3E
          OBJ_72F1F                              * 1FA43
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
        ::                                       * 1FA59
          CK2&Dispatch                           * 1FA5E
          BINT21                                 * 1FA63
          match^(ex,li)                          * 1FA68
          BINT37                                 * 1FA6D
          match^(ex,li)                          * 1FA72
          SYMLIST                                * 1FA77
          match^(ex,li)                          * 1FA7C
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
        ::                                       * 1FA8D
          CK2&Dispatch                           * 1FA92
          BINT21                                 * 1FA97
          matchv(ex,li)                          * 1FA9C
          BINT37                                 * 1FAA1
          matchv(ex,li)                          * 1FAA6
          SYMLIST                                * 1FAAB
          matchv(ex,li)                          * 1FAB0
        ;                                        * 1FAB5

* refs (3): 1FA68 1FA72 1FA7C
* slots of 002 10A (derivative, inverse, ...: used by the symbolic code)
match^(ex,li):
        ::                                       * 1FABA  slot 0
          match'(ex,li)                          * 1FABF
          TRUE                                   * 1FAC4
        ;                                        * 1FAC9

* refs (3): 1FA9C 1FAA6 1FAB0
matchv(ex,li):
        ::                                       * 1FACE  slot 1
          match'(ex,li)                          * 1FAD3
          FALSE                                  * 1FAD8
        ;                                        * 1FADD
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
        ::                                       * 1FAEB
          CK2&Dispatch                           * 1FAF0
          BINT1                                  * 1FAF5
          OBJ_1FB31                              * 1FAFA
          BINT14                                 * 1FAFF
          OBJ_1FB31                              * 1FB04
          BINT10                                 * 1FB09
          OBJ_28A38                              * 1FB0E
        ;                                        * 1FB13

* slots of 002 10B (derivative, inverse, ...: used by the symbolic code)
        CON(5)  OBJ_6CCCC                        * 1FB18  slot 0

* refs (2): 28E4D 68CEC
#72109h:
        HXS     90127                            * 1FB1D  slot 1
        CON(5)  OBJ_5A298                        * 1FB2C  slot 2

* refs (2): 1FAFA 1FB04
OBJ_1FB31:
        ::                                       * 1FB31  slot 3
          BINT2                                  * 1FB36
          nmetasyms                              * 1FB3B
          '                                      * 1FB40
          x*                                     * 1FB45
          EvalNoCK                               * 1FB4A
        ;                                        * 1FB4F
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
        ::                                       * 1FB5D
          CK2&Dispatch                           * 1FB62
          BINT0                                  * 1FB67
          x/                                     * 1FB6C
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
        ::                                       * 1FB87
          CK1                                    * 1FB8C
          DUP                                    * 1FB91
        ;                                        * 1FB96

* 1 2 -> 1 2 1 2
* ROMPTR 002 10E DUP2
* refs (3): 189EA D32F7 D32FC
        CON(1)  8                                * 1FB9B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FB9C  library
        CON(3)  #10E                             * 1FB9F  command
xDUP2:
        ::                                       * 1FBA2
          CK2                                    * 1FBA7
          2DUP                                   * 1FBAC
        ;                                        * 1FBB1

* ob1 ob2 -> ob2 ob1
* ROMPTR 002 10F SWAP
* refs (9): 189EA 3B4F0 593D2 59454 D2F0E D2F81 ...
        CON(1)  8                                * 1FBB6  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FBB7  library
        CON(3)  #10F                             * 1FBBA  command
xSWAP:
        ::                                       * 1FBBD
          CK2                                    * 1FBC2
          SWAP                                   * 1FBC7
        ;                                        * 1FBCC

* ob ->
* ROMPTR 002 110 DROP
* refs (12): 189EA 3B6D6 40F6D D364C D3D01 D3DA3 ...
        CON(1)  8                                * 1FBD1  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FBD2  library
        CON(3)  #110                             * 1FBD5  command
xDROP:
        ::                                       * 1FBD8
          CK1                                    * 1FBDD
          DROP                                   * 1FBE2
        ;                                        * 1FBE7

* ob1 ob2 ->
* ROMPTR 002 111 DROP2
* refs (4): 189EA 40F54 40F7C D3DC6
        CON(1)  8                                * 1FBEC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FBED  library
        CON(3)  #111                             * 1FBF0  command
xDROP2:
        ::                                       * 1FBF3
          CK2                                    * 1FBF8
          2DROP                                  * 1FBFD
        ;                                        * 1FC02

* 1 2 3 -> 2 3 1
* ROMPTR 002 112 ROT
* refs (4): 189EA D2F32 D3683 D3FD9
        CON(1)  8                                * 1FC07  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FC08  library
        CON(3)  #112                             * 1FC0B  command
xROT:
        ::                                       * 1FC0E
          CK3                                    * 1FC13
          ROT                                    * 1FC18
        ;                                        * 1FC1D

* 1 2 -> 1 2 1
* ROMPTR 002 113 OVER
* refs (3): 189EA D3BC4 D3DFC
        CON(1)  8                                * 1FC22  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FC23  library
        CON(3)  #113                             * 1FC26  command
xOVER:
        ::                                       * 1FC29
          CK2                                    * 1FC2E
          OVER                                   * 1FC33
        ;                                        * 1FC38

* -> n
* ROMPTR 002 114 DEPTH
* refs (1): 189EA
        CON(1)  8                                * 1FC3D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FC3E  library
        CON(3)  #114                             * 1FC41  command
xDEPTH:
        ::                                       * 1FC44
          CK0                                    * 1FC49
          DEPTH                                  * 1FC4E
          UNCOERCE                               * 1FC53
        ;                                        * 1FC58

* ob1...obn n ->
* ROMPTR 002 115 DROPN
* refs (2): 189EA C65AA
        CON(1)  8                                * 1FC5D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FC5E  library
        CON(3)  #115                             * 1FC61  command
xDROPN:
        ::                                       * 1FC64
          CKN                                    * 1FC69
          NDROP                                  * 1FC6E
        ;                                        * 1FC73

* 1...n n -> 1...n 1...n
* ROMPTR 002 116 DUPN
* refs (3): 189EA 43DB3 D3306
        CON(1)  8                                * 1FC78  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FC79  library
        CON(3)  #116                             * 1FC7C  command
xDUPN:
        ::                                       * 1FC7F
          CKN                                    * 1FC84
          NDUP                                   * 1FC89
        ;                                        * 1FC8E

* 1...n n -> 1..n 1
* ROMPTR 002 117 PICK
* refs (2): 189EA 43D63
        CON(1)  8                                * 1FC93  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FC94  library
        CON(3)  #117                             * 1FC97  command
xPICK:
        ::                                       * 1FC9A
          CKN                                    * 1FC9F
          PICK                                   * 1FCA4
        ;                                        * 1FCA9

* 1...n n -> 2...n 1
* ROMPTR 002 118 ROLL
* refs (4): 189EA 43D77 D3DB2 D3E3D
        CON(1)  8                                * 1FCAE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FCAF  library
        CON(3)  #118                             * 1FCB2  command
xROLL:
        ::                                       * 1FCB5
          CKN                                    * 1FCBA
          ROLL                                   * 1FCBF
        ;                                        * 1FCC4

* n ... 1 n -> 1 n...2
* ROMPTR 002 119 ROLLD
* refs (6): 189EA 43D8B D3C46 D3E0B D3F3D D40CF
        CON(1)  8                                * 1FCC9  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FCCA  library
        CON(3)  #119                             * 1FCCD  command
xROLLD:
        ::                                       * 1FCD0
          CKN                                    * 1FCD5
          UNROLL                                 * 1FCDA
        ;                                        * 1FCDF

* ob1 .. obn ->
* ROMPTR 002 11A CLEAR
* refs (2): 189EA 3B686
        CON(1)  8                                * 1FCE4  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FCE5  library
        CON(3)  #11A                             * 1FCE8  command
xCLEAR:
        ::                                       * 1FCEB
          CK0                                    * 1FCF0
          DEPTH                                  * 1FCF5
          NDROP                                  * 1FCFA
        ;                                        * 1FCFF

* ob ->
* ROMPTR 002 11B STOΣ
* refs (3): 189EA C53A8 D40F0
        CON(1)  8                                * 1FD04  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FD05  library
        CON(3)  #11B                             * 1FD08  command
xSTOSIGMA:
        ::                                       * 1FD0B
          CK1                                    * 1FD10
          STRIPTAGS                              * 1FD15
          STATSTO                                * 1FD1A
        ;                                        * 1FD1F

* ->
* ROMPTR 002 11C CLΣ
* refs (1): 189EA
        CON(1)  8                                * 1FD24  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FD25  library
        CON(3)  #11C                             * 1FD28  command
xCLSIGMA:
        ::                                       * 1FD2B
          CK0                                    * 1FD30
          STATCLST                               * 1FD35
        ;                                        * 1FD3A

* -> [[]]
* ROMPTR 002 11D RCLΣ
* refs (3): 189EA C53AD D400B
        CON(1)  8                                * 1FD3F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FD40  library
        CON(3)  #11D                             * 1FD43  command
xRCLSIGMA:
        ::                                       * 1FD46
          CK0                                    * 1FD4B
          rclä!                                  * 1FD50
        ;                                        * 1FD55

* x -> x1...xn -> []/[[]] ->
* ROMPTR 002 11E Σ+
* refs (2): 189EA 2C324
        CON(1)  8                                * 1FD5A  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FD5B  library
        CON(3)  #11E                             * 1FD5E  command
xSIGMA+:
        ::                                       * 1FD61
          CK1&Dispatch                           * 1FD66
          BINT1                                  * 1FD6B
          ä+(r)                                  * 1FD70
          BINT4                                  * 1FD75
          å-                                     * 1FD7A
        ;                                        * 1FD7F

* -> x -> []
* ROMPTR 002 11F Σ-
* refs (2): 189EA D4083
        CON(1)  8                                * 1FD84  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FD85  library
        CON(3)  #11F                             * 1FD88  command
xSIGMA-:
        ::                                       * 1FD8B
          CK0                                    * 1FD90
          OBJ_2C423                              * 1FD95
        ;                                        * 1FD9A

* -> nrows
* ROMPTR 002 120 NΣ
* refs (1): 189EA
        CON(1)  8                                * 1FD9F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FDA0  library
        CON(3)  #120                             * 1FDA3  command
xNSIGMA:
        ::                                       * 1FDA6
          CK0                                    * 1FDAB
          STATN                                  * 1FDB0
        ;                                        * 1FDB5

* -> x_correlation
* ROMPTR 002 121 CORR
* refs (1): 189EA
        CON(1)  8                                * 1FDBA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FDBB  library
        CON(3)  #121                             * 1FDBE  command
xCORR:
        ::                                       * 1FDC1
          CK0                                    * 1FDC6
          STATCORR                               * 1FDCB
        ;                                        * 1FDD0

* -> x_covariance
* ROMPTR 002 122 COV
* refs (1): 189EA
        CON(1)  8                                * 1FDD5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FDD6  library
        CON(3)  #122                             * 1FDD9  command
xCOV:
        ::                                       * 1FDDC
          CK0                                    * 1FDE1
          STATCOV                                * 1FDE6
        ;                                        * 1FDEB

* ROMPTR 002 123 ΣX
* refs (1): 189EA
        CON(1)  8                                * 1FDF0  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FDF1  library
        CON(3)  #123                             * 1FDF4  command
äX:
        ::                                       * 1FDF7
          CK0                                    * 1FDFC
          STATX                                  * 1FE01
        ;                                        * 1FE06

* -> xsum
* ROMPTR 002 124 ΣY
* refs (1): 189EA
        CON(1)  8                                * 1FE0B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FE0C  library
        CON(3)  #124                             * 1FE0F  command
xSUMY:
        ::                                       * 1FE12
          CK0                                    * 1FE17
          STATY                                  * 1FE1C
        ;                                        * 1FE21

* -> xsum
* ROMPTR 002 125 ΣX^2
* refs (1): 189EA
        CON(1)  8                                * 1FE26  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FE27  library
        CON(3)  #125                             * 1FE2A  command
xSUMX2:
        ::                                       * 1FE2D
          CK0                                    * 1FE32
          STATXX                                 * 1FE37
        ;                                        * 1FE3C

* -> xsum
* ROMPTR 002 126 ΣY^2
* refs (1): 189EA
        CON(1)  8                                * 1FE41  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FE42  library
        CON(3)  #126                             * 1FE45  command
xSUMY2:
        ::                                       * 1FE48
          CK0                                    * 1FE4D
          STATYY                                 * 1FE52
        ;                                        * 1FE57

* -> xsum
* ROMPTR 002 127 ΣX*Y
* refs (1): 189EA
        CON(1)  8                                * 1FE5C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FE5D  library
        CON(3)  #127                             * 1FE60  command
xSUMXY:
        ::                                       * 1FE63
          CK0                                    * 1FE68
          STATXY                                 * 1FE6D
        ;                                        * 1FE72

* -> xmax -> [x1...xn]
* ROMPTR 002 128 MAXΣ
* refs (1): 189EA
        CON(1)  8                                * 1FE77  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FE78  library
        CON(3)  #128                             * 1FE7B  command
xMAXSIGMA:
        ::                                       * 1FE7E
          CK0                                    * 1FE83
          STATSMAX                               * 1FE88
        ;                                        * 1FE8D

* -> xmean -> [x1...xn]
* ROMPTR 002 129 MEAN
* refs (1): 189EA
        CON(1)  8                                * 1FE92  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FE93  library
        CON(3)  #129                             * 1FE96  command
xMEAN:
        ::                                       * 1FE99
          CK0                                    * 1FE9E
          STATMEAN                               * 1FEA3
        ;                                        * 1FEA8

* -> xmin -> [x1...xn]
* ROMPTR 002 12A MINΣ
* refs (1): 189EA
        CON(1)  8                                * 1FEAD  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FEAE  library
        CON(3)  #12A                             * 1FEB1  command
xMINSIGMA:
        ::                                       * 1FEB4
          CK0                                    * 1FEB9
          STATSMIN                               * 1FEBE
        ;                                        * 1FEC3

* -> xsdev -> [x1...xn]
* ROMPTR 002 12B SDEV
* refs (1): 189EA
        CON(1)  8                                * 1FEC8  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FEC9  library
        CON(3)  #12B                             * 1FECC  command
xSDEV:
        ::                                       * 1FECF
          CK0                                    * 1FED4
          STATSTDEV                              * 1FED9
        ;                                        * 1FEDE

* -> xsum -> {x1...xn}
* ROMPTR 002 12C TOT
* refs (1): 189EA
        CON(1)  8                                * 1FEE3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FEE4  library
        CON(3)  #12C                             * 1FEE7  command
xTOT:
        ::                                       * 1FEEA
          CK0                                    * 1FEEF
          STATTOT                                * 1FEF4
        ;                                        * 1FEF9

* -> x -> [x1...xn]
* ROMPTR 002 12D VAR
* refs (1): 189EA
        CON(1)  8                                * 1FEFE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FEFF  library
        CON(3)  #12D                             * 1FF02  command
xVAR:
        ::                                       * 1FF05
          CK0                                    * 1FF0A
          STATVAR                                * 1FF0F
        ;                                        * 1FF14

* -> Intercept Slope
* ROMPTR 002 12E LR
* refs (1): 189EA
        CON(1)  8                                * 1FF19  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FF1A  library
        CON(3)  #12E                             * 1FF1D  command
xLR:
        ::                                       * 1FF20
          CK0                                    * 1FF25
          STATLR                                 * 1FF2A
          {                                      * 1FF2F

_Intercept_:
            $       "Intercept"                  * 1FF34

_Slope_:
            $       "Slope"                      * 1FF50
          }                                      * 1FF64
          TAGOBS                                 * 1FF69
        ;                                        * 1FF6E

* x -> y
* ROMPTR 002 12F PREDV
* refs (1): 189EA
        CON(1)  8                                * 1FF73  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FF74  library
        CON(3)  #12F                             * 1FF77  command
xPREDV:
        ::                                       * 1FF7A
          CK1&Dispatch                           * 1FF7F
          BINT1                                  * 1FF84
          STATPREDY                              * 1FF89
        ;                                        * 1FF8E

* x -> y
* ROMPTR 002 130 PREDY
* refs (1): 189EA
        CON(1)  8                                * 1FF93  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FF94  library
        CON(3)  #130                             * 1FF97  command
xPREDY:
        ::                                       * 1FF9A
          CK1&Dispatch                           * 1FF9F
          BINT1                                  * 1FFA4
          STATPREDY                              * 1FFA9
        ;                                        * 1FFAE

* y -> x
* ROMPTR 002 131 PREDX
* refs (1): 189EA
        CON(1)  8                                * 1FFB3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FFB4  library
        CON(3)  #131                             * 1FFB7  command
xPREDX:
        ::                                       * 1FFBA
          CK1&Dispatch                           * 1FFBF
          BINT1                                  * 1FFC4
          STATPREDX                              * 1FFC9
        ;                                        * 1FFCE

* n ->
* ROMPTR 002 132 XCOL
* refs (1): 189EA
        CON(1)  8                                * 1FFD3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 1FFD4  library
        CON(3)  #132                             * 1FFD7  command
xXCOL:
        ::                                       * 1FFDA
          CK1&Dispatch                           * 1FFDF
          BINT1                                  * 1FFE4
          STATXCOL                               * 1FFE9
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
          BINT1                                  * 20004
          STATYCOL                               * 20009
        ;                                        * 2000E

* n x -> x'
* ROMPTR 002 134 UTPC
* refs (1): 189EA
        CON(1)  8                                * 20013  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20014  library
        CON(3)  #134                             * 20017  command
xUTPC:
        ::                                       * 2001A
          CK2&Dispatch                           * 2001F
          BINT17                                 * 20024
          utpn(2r)                               * 20029
        ;                                        * 2002E

* n v x -> x'
* ROMPTR 002 135 UTPN
* refs (1): 189EA
        CON(1)  8                                * 20033  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20034  library
        CON(3)  #135                             * 20037  command
xUTPN:
        ::                                       * 2003A
          CK3&Dispatch                           * 2003F
          3REAL                                  * 20044
          utpn(3r)                               * 20049
        ;                                        * 2004E

* n1 n2 x -> x'
* ROMPTR 002 136 UTPF
* refs (1): 189EA
        CON(1)  8                                * 20053  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20054  library
        CON(3)  #136                             * 20057  command
xUTPF:
        ::                                       * 2005A
          CK3&Dispatch                           * 2005F
          3REAL                                  * 20064
          utpf(3r)                               * 20069
        ;                                        * 2006E

* n x -> x'
* ROMPTR 002 137 UTPT
* refs (1): 189EA
        CON(1)  8                                * 20073  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20074  library
        CON(3)  #137                             * 20077  command
xUTPT:
        ::                                       * 2007A
          CK2&Dispatch                           * 2007F
          BINT17                                 * 20084
          utpt(2r)                               * 20089
        ;                                        * 2008E

* x_col y_col ->
* ROMPTR 002 138 COLΣ
* refs (1): 189EA
        CON(1)  8                                * 20093  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20094  library
        CON(3)  #138                             * 20097  command
xSIGMACOL:
        ::                                       * 2009A
          CK2&Dispatch                           * 2009F
          BINT17                                 * 200A4
          STATCOL                                * 200A9
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
        ::                                       * 200C4
          CK0                                    * 200C9
          rclä                                   * 200CE
          ChkReakäPAR                            * 200D3
          3DROP                                  * 200D8
          COERCE2                                * 200DD
          OBJ_48E4B                              * 200E2
        ;                                        * 200E7

* -> symb
* ROMPTR 002 13A ΣLINE
* refs (1): 189EA
        CON(1)  8                                * 200EC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 200ED  library
        CON(3)  #13A                             * 200F0  command
xSIGMALINE:
        ::                                       * 200F3
          CK0                                    * 200F8
          OBJ_48BBB                              * 200FD
        ;                                        * 20102

* min width n -> [[]] []
* ROMPTR 002 13B BINS
* refs (1): 189EA
        CON(1)  8                                * 20107  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20108  library
        CON(3)  #13B                             * 2010B  command
xBINS:
        ::                                       * 2010E
          CK3&Dispatch                           * 20113
          #       111                            * 20118  273
          bins(3r)                               * 20122
        ;                                        * 20127

* ->
* ROMPTR 002 13C BARPLOT
* refs (3): 189EA C70C2 C70D1
        CON(1)  8                                * 2012C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 2012D  library
        CON(3)  #13C                             * 20130  command
xBARPLOT:
        ::                                       * 20133
          CK0                                    * 20138
          'IDBAR                                 * 2013D
L_20142:
          PUTPTYPE                               * 20142
          AUTOSCALE                              * 20147
          BlankDA12                              * 2014C
          DOERASE                                * 20151
          draw                                   * 20156
        ;                                        * 2015B

* ->
* ROMPTR 002 13D HISTPLOT
* refs (3): 189EA C70EA C70F9
        CON(1)  8                                * 20160  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20161  library
        CON(3)  #13D                             * 20164  command
xHISTPLOT:
        ::                                       * 20167
          CK0                                    * 2016C
          'IDHISTOGRAM                           * 20171
          GOTO                                   * 20176
          L_20142                                * 2017B
        ;                                        * 20180

* ->
* ROMPTR 002 13E SCATRPLOT
* refs (3): 189EA C7112 C7121
        CON(1)  8                                * 20185  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20186  library
        CON(3)  #13E                             * 20189  command
xSCATRPLOT:
        ::                                       * 2018C
          CK0                                    * 20191
          'IDSCATTER                             * 20196
          GOTO                                   * 2019B
          L_20142                                * 201A0
        ;                                        * 201A5

* ->
* ROMPTR 002 13F LINFIT
* refs (10): 189EA 201C0 202B8 2C760 48BD9 4A17C ...
        CON(1)  8                                * 201AA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 201AB  library
        CON(3)  #13F                             * 201AE  command
xLINFIT:
        ::                                       * 201B1
          CK0                                    * 201B6
          '                                      * 201BB
          xLINFIT                                * 201C0
          StoModel                               * 201C5
        ;                                        * 201CA

* ->
* ROMPTR 002 140 LOGFIT
* refs (7): 189EA 201E5 2CC7E 48C10 4A181 B7D9D ...
        CON(1)  8                                * 201CF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 201D0  library
        CON(3)  #140                             * 201D3  command
xLOGFIT:
        ::                                       * 201D6
          CK0                                    * 201DB
          '                                      * 201E0
          xLOGFIT                                * 201E5
          StoModel                               * 201EA
        ;                                        * 201EF

* ->
* ROMPTR 002 141 EXPFIT
* refs (7): 189EA 2020A 2CC38 48C51 4A186 B7DAD ...
        CON(1)  8                                * 201F4  command header: flags (meaning not yet known)
        CON(3)  #002                             * 201F5  library
        CON(3)  #141                             * 201F8  command
xEXPFIT:
        ::                                       * 201FB
          CK0                                    * 20200
          '                                      * 20205
          xEXPFIT                                * 2020A
          StoModel                               * 2020F
        ;                                        * 20214

* ROMPTR 002 142 PWRFIT
* refs (7): 189EA 2022F 2CC24 2CC6A 4A18B B7DBD ...
        CON(1)  8                                * 20219  command header: flags (meaning not yet known)
        CON(3)  #002                             * 2021A  library
        CON(3)  #142                             * 2021D  command
xPWRFIT:
        ::                                       * 20220
          CK0                                    * 20225
          '                                      * 2022A
          xPWRFIT                                * 2022F

* refs (5): 201C5 201EA 2020F 4A1C2 4A208
StoModel:
          ::                                     * 20234
            ChkReakäPAR                          * 20239
            DROP                                 * 2023E
            5ROLL                                * 20243
            StoäPAR(5_)                          * 20248
          ;                                      * 2024D
        ;                                        * 20252

* ->
* ROMPTR 002 143 BESTFIT
* refs (3): 189EA B7DCD B8078
        CON(1)  8                                * 20257  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20258  library
        CON(3)  #143                             * 2025B  command
xBESTFIT:
        ::                                       * 2025E
          CK0                                    * 20263
          ERRSET                                 * 20268
          bestfit                                * 2026D
          ERRTRAP                                * 20272
          ::                                     * 20277
            ERROR@                               * 2027C
            OBJ_4796B                            * 20281
            OVER                                 * 20286
            #=                                   * 2028B
            SWAP                                 * 20290
            OBJ_4A122                            * 20295
            #=                                   * 2029A
            OR                                   * 2029F
            NOTcase                              * 202A4
            ERRJMP                               * 202A9
            ERRORCLR                             * 202AE
            DropSysObs                           * 202B3
            xLINFIT                              * 202B8
          ;                                      * 202BD
        ;                                        * 202C2

* name ->
* ROMPTR 002 144 SINV
* refs (1): 189EA
        CON(1)  8                                * 202C7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 202C8  library
        CON(3)  #144                             * 202CB  command
xSINV:
        ::                                       * 202CE
          CK1&Dispatch                           * 202D3
          BINT6                                  * 202D8
          sinv(gn)                               * 202DD
          BINT7                                  * 202E2
          sinv(ln)                               * 202E7
        ;                                        * 202EC

* refs (1): 202DD
sinv(gn):
        ::                                       * 202F1
          dup;RclInVars(nm)                      * 202F6
          dARRYcase                              * 202FB
          OBJ_2032D                              * 20300
          OBJ_204FF                              * 20305
          xINV                                   * 2030A
        ;                                        * 2030F

* refs (1): 202E7
sinv(ln):
        ::                                       * 20314
          dup;RclInVars(nm)                      * 20319
          OBJ_204FF                              * 2031E
          xINV                                   * 20323
        ;                                        * 20328

* refs (1): 20300
OBJ_2032D:
        ::                                       * 2032D
          SWAPDROP                               * 20332
          @inv(ar)                               * 20337
          DROP                                   * 2033C
        ;                                        * 20341

* name ->
* ROMPTR 002 145 SNEG
* refs (1): 189EA
        CON(1)  8                                * 20346  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20347  library
        CON(3)  #145                             * 2034A  command
xSNEG:
        ::                                       * 2034D
          CK1&Dispatch                           * 20352
          BINT6                                  * 20357
          sneg(gn)                               * 2035C
          BINT7                                  * 20361
          sneg(ln)                               * 20366
        ;                                        * 2036B

* refs (1): 2035C
sneg(gn):
        ::                                       * 20370
          dup;RclInVars(nm)                      * 20375
          dARRYcase                              * 2037A
          OBJ_203AC                              * 2037F
          OBJ_204FF                              * 20384
          xNEG                                   * 20389
        ;                                        * 2038E

* refs (1): 20366
sneg(ln):
        ::                                       * 20393
          dup;RclInVars(nm)                      * 20398
          OBJ_204FF                              * 2039D
          xNEG                                   * 203A2
        ;                                        * 203A7

* refs (1): 2037F
OBJ_203AC:
        ::                                       * 203AC
          SWAPDROP                               * 203B1
          @neg(ar)                               * 203B6
          DROP                                   * 203BB
        ;                                        * 203C0

* name ->
* ROMPTR 002 146 SCONJ
* refs (1): 189EA
        CON(1)  8                                * 203C5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 203C6  library
        CON(3)  #146                             * 203C9  command
xSCONJ:
        ::                                       * 203CC
          CK1&Dispatch                           * 203D1
          BINT6                                  * 203D6
          sconj(gn)                              * 203DB
          BINT7                                  * 203E0
          sconj(ln)                              * 203E5
        ;                                        * 203EA

* refs (1): 203DB
sconj(gn):
        ::                                       * 203EF
          dup;RclInVars(nm)                      * 203F4
          dARRYcase                              * 203F9
          OBJ_2042B                              * 203FE
          OBJ_204FF                              * 20403
          xCONJ                                  * 20408
        ;                                        * 2040D

* refs (1): 203E5
sconj(ln):
        ::                                       * 20412
          dup;RclInVars(nm)                      * 20417
          OBJ_204FF                              * 2041C
          xCONJ                                  * 20421
        ;                                        * 20426

* refs (1): 203FE
OBJ_2042B:
        ::                                       * 2042B
          SWAPDROP                               * 20430
          @conj!(ar)                             * 20435
          DROP                                   * 2043A
        ;                                        * 2043F

* ob name -> name ob ->
* ROMPTR 002 147 STO+
* refs (7): 189EA 45875 4587F 4632F 8A5DD 8A608 ...
        CON(1)  8                                * 20444  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20445  library
        CON(3)  #147                             * 20448  command
xSTO+:
        ::                                       * 2044B
          CK2&Dispatch                           * 20450
          BINT6                                  * 20455
          sto+(_,nm)                             * 2045A
          BINT7                                  * 2045F
          sto+(_,nm)                             * 20464
          BINT96                                 * 20469
          sto+(nm,_)                             * 2046E
          BINT112                                * 20473
          sto+(nm,_)                             * 20478
        ;                                        * 2047D

* refs (2): 2045A 20464
sto+(_,nm):
        ::                                       * 20482
          dup;RclInVars(nm)                      * 20487
          ROTSWAP                                * 2048C
          CK&DISPATCH1                           * 20491

* refs (1): 204D2
OBJ_20496:
          #       644                            * 20496  1604
          OBJ_20518                              * 204A0
          BINT0                                  * 204A5
          ::                                     * 204AA
            OBJ_204FF                            * 204AF
            x+                                   * 204B4
          ;                                      * 204B9
        ;                                        * 204BE

* refs (2): 2046E 20478
sto+(nm,_):
        ::                                       * 204C3
          over;RclInVars(nm)                     * 204C8
          CK&DISPATCH1                           * 204CD
          OBJ_20496                              * 204D2
          OBJ_20518                              * 204D7
          BINT0                                  * 204DC
          ::                                     * 204E1
            SWAP                                 * 204E6
            OBJ_204FF                            * 204EB
            x+                                   * 204F0
          ;                                      * 204F5
        ;                                        * 204FA

* refs (20): 20305 2031E 20384 2039D 20403 2041C ...
OBJ_204FF:
        ::                                       * 204FF
          'R                                     * 20504
          EvalNoCK                               * 20509
          sto(nm,_)                              * 2050E
        ;                                        * 20513

* refs (2): 204A0 204D7
OBJ_20518:
        ::                                       * 20518
          ROTDROP                                * 2051D
          1@+(2ar)                               * 20522
          DROP                                   * 20527
        ;                                        * 2052C

* ob name -> name ob ->
* ROMPTR 002 148 STO-
* refs (3): 189EA 462B2 8C08C
        CON(1)  8                                * 20531  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20532  library
        CON(3)  #148                             * 20535  command
xSTO-:
        ::                                       * 20538
          CK2&Dispatch                           * 2053D
          BINT70                                 * 20542
          sto-(ar,gn)                            * 20547
          BINT6                                  * 2054C
          sto-(_,nm)                             * 20551
          BINT7                                  * 20556
          sto-(_,nm)                             * 2055B
          BINT100                                * 20560
          sto-(gn,ar)                            * 20565
          BINT96                                 * 2056A
          sto-(nm,_)                             * 2056F
          BINT112                                * 20574
          sto-(nm,_)                             * 20579
        ;                                        * 2057E

* refs (2): 20551 2055B
sto-(_,nm):
        ::                                       * 20583
          dup;RclInVars(nm)                      * 20588
          ROTSWAP                                * 2058D
          OBJ_204FF                              * 20592
          x-                                     * 20597
        ;                                        * 2059C

* refs (2): 2056F 20579
sto-(nm,_):
        ::                                       * 205A1
          over;RclInVars(nm)                     * 205A6
          SWAP                                   * 205AB
          OBJ_204FF                              * 205B0
          x-                                     * 205B5
        ;                                        * 205BA

* refs (1): 20547
sto-(ar,gn):
        ::                                       * 205BF
          dup;RclInVars(nm)                      * 205C4
          dup;ar?#BAT!                           * 205C9
          SWAPDROP                               * 205CE
          1@-(2ar)                               * 205D3
          DROP                                   * 205D8
        ;                                        * 205DD

* refs (1): 20565
sto-(gn,ar):
        ::                                       * 205E2
          over;RclInVars(nm)                     * 205E7
          dup;ar?#BAT!                           * 205EC
          ROTDROPSWAP                            * 205F1
          2@-(2ar)                               * 205F6
          DROP                                   * 205FB
        ;                                        * 20600

* ob name -> name ob ->
* ROMPTR 002 149 STO/
* refs (1): 189EA
        CON(1)  8                                * 20605  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20606  library
        CON(3)  #149                             * 20609  command
xSTO/:
        ::                                       * 2060C
          CK2&Dispatch                           * 20611
          BINT97                                 * 20616
          sto/(gn,nb)                            * 2061B
          BINT98                                 * 20620
          sto/(gn,nb)                            * 20625
          BINT70                                 * 2062A
          OBJ_206E8                              * 2062F
          BINT6                                  * 20634
          sto/(_,nm)                             * 20639
          BINT7                                  * 2063E
          sto/(_,nm)                             * 20643
          BINT100                                * 20648
          sto/(gn,ar)                            * 2064D
          BINT96                                 * 20652
          sto/(nm,_)                             * 20657
          BINT112                                * 2065C
          sto/(nm,_)                             * 20661
        ;                                        * 20666

* refs (2): 20639 20643
sto/(_,nm):
        ::                                       * 2066B
          dup;RclInVars(nm)                      * 20670
          ROTSWAP                                * 20675
          OBJ_204FF                              * 2067A
          x/                                     * 2067F
        ;                                        * 20684

* refs (2): 20657 20661
sto/(nm,_):
        ::                                       * 20689
          over;RclInVars(nm)                     * 2068E
          SWAP                                   * 20693
          OBJ_204FF                              * 20698
          x/                                     * 2069D
        ;                                        * 206A2

* refs (2): 2061B 20625
sto/(gn,nb):
        ::                                       * 206A7
          over;RclInVars(nm)                     * 206AC
          dARRYcase                              * 206B1
          OBJ_206CF                              * 206B6
          SWAP                                   * 206BB
          OBJ_204FF                              * 206C0
          x/                                     * 206C5
        ;                                        * 206CA

* refs (1): 206B6
OBJ_206CF:
        ::                                       * 206CF
          ROTDROPSWAP                            * 206D4
          1@/(ar,nb)                             * 206D9
          DROP                                   * 206DE
        ;                                        * 206E3

* refs (1): 2062F
OBJ_206E8:
        ::                                       * 206E8
          dup;RclInVars(nm)                      * 206ED
          ROTSWAP                                * 206F2
          dARRYcase                              * 206F7
          OBJ_20710                              * 206FC
          OBJ_204FF                              * 20701
          x/                                     * 20706
        ;                                        * 2070B

* refs (1): 206FC
OBJ_20710:
        ::                                       * 20710
          ROTDROP                                * 20715
          1@/(2ar)                               * 2071A
          DROP                                   * 2071F
        ;                                        * 20724

* refs (1): 2064D
sto/(gn,ar):
        ::                                       * 20729
          over;RclInVars(nm)                     * 2072E
          dup;ar?#BAT!                           * 20733
          ROTDROPSWAP                            * 20738
          2@/(2ar)                               * 2073D
          DROP                                   * 20742
        ;                                        * 20747

* ob name -> name ob ->
* ROMPTR 002 14A STO*
* refs (1): 189EA
        CON(1)  8                                * 2074C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 2074D  library
        CON(3)  #14A                             * 20750  command
xSTO*:
        ::                                       * 20753
          CK2&Dispatch                           * 20758
          BINT22                                 * 2075D
          sto*(nb,gn)                            * 20762
          BINT38                                 * 20767
          sto*(nb,gn)                            * 2076C
          BINT97                                 * 20771
          sto*(gn,nb)                            * 20776
          BINT98                                 * 2077B
          sto*(gn,nb)                            * 20780
          BINT70                                 * 20785
          sto*(ar,nm)                            * 2078A
          BINT6                                  * 2078F
          sto*(_,nm)                             * 20794
          BINT7                                  * 20799
          sto*(_,nm)                             * 2079E
          BINT100                                * 207A3
          sto*(nm,ar)                            * 207A8
          BINT96                                 * 207AD
          sto*(nm,_)                             * 207B2
          BINT112                                * 207B7
          sto*(nm,_)                             * 207BC
        ;                                        * 207C1

* refs (2): 20794 2079E
sto*(_,nm):
        ::                                       * 207C6
          dup;RclInVars(nm)                      * 207CB
          ROTSWAP                                * 207D0
          OBJ_204FF                              * 207D5
          x*                                     * 207DA
        ;                                        * 207DF

* refs (2): 207B2 207BC
sto*(nm,_):
        ::                                       * 207E4
          over;RclInVars(nm)                     * 207E9
          SWAP                                   * 207EE
          OBJ_204FF                              * 207F3
          x*                                     * 207F8
        ;                                        * 207FD

* refs (2): 20762 2076C
sto*(nb,gn):
        ::                                       * 20802
          dup;RclInVars(nm)                      * 20807
          ROTSWAP                                * 2080C
          dARRYcase                              * 20811
          OBJ_20852                              * 20816
          OBJ_204FF                              * 2081B
          x*                                     * 20820
        ;                                        * 20825

* refs (2): 20776 20780
sto*(gn,nb):
        ::                                       * 2082A
          over;RclInVars(nm)                     * 2082F
          dARRYcase                              * 20834
          OBJ_20852                              * 20839
          SWAP                                   * 2083E
          OBJ_204FF                              * 20843
          x*                                     * 20848
        ;                                        * 2084D

* refs (2): 20816 20839
OBJ_20852:
        ::                                       * 20852
          ROTDROP                                * 20857
          1@*(nb,ar)                             * 2085C
          DROP                                   * 20861
        ;                                        * 20866

* refs (1): 2078A
sto*(ar,nm):
        ::                                       * 2086B
          dup;RclInVars(nm)                      * 20870
          ROTSWAP                                * 20875
          dARRYcase                              * 2087A
          OBJ_20893                              * 2087F
          OBJ_204FF                              * 20884
          x*                                     * 20889
        ;                                        * 2088E

* refs (1): 2087F
OBJ_20893:
        ::                                       * 20893
          ROTDROP                                * 20898
          1@*(2ar)                               * 2089D
          DROP                                   * 208A2
        ;                                        * 208A7

* refs (1): 207A8
sto*(nm,ar):
        ::                                       * 208AC
          over;RclInVars(nm)                     * 208B1
          dARRYcase                              * 208B6
          OBJ_208D4                              * 208BB
          SWAP                                   * 208C0
          OBJ_204FF                              * 208C5
          x*                                     * 208CA
        ;                                        * 208CF

* refs (1): 208BB
OBJ_208D4:
        ::                                       * 208D4
          ROTDROPSWAP                            * 208D9
          2@*(2ar)                               * 208DE
          DROP                                   * 208E3
        ;                                        * 208E8

* name -> x
* ROMPTR 002 14B INCR
* refs (1): 189EA
        CON(1)  8                                * 208ED  command header: flags (meaning not yet known)
        CON(3)  #002                             * 208EE  library
        CON(3)  #14B                             * 208F1  command
xINCR:
        ::                                       * 208F4
          CK1&Dispatch                           * 208F9
          BINT6                                  * 208FE
          incr(gn)                               * 20903
          BINT7                                  * 20908
          incr(ln)                               * 2090D
        ;                                        * 20912

* refs (1): 20903
incr(gn):
        ::                                       * 20917
          OBJ_20935                              * 2091C
          %+                                     * 20921
          SWAP                                   * 20926
          REPLACE                                * 2092B
        ;                                        * 20930

* refs (2): 2091C 209D2
OBJ_20935:
        ::                                       * 20935
          RclRealInVars(nm)                      * 2093A
          REFERENCED?                            * 2093F
          ITE                                    * 20944
          TOTEMPOBADJ                            * 20949
          DUP                                    * 2094E
          SWAP                                   * 20953
          %1                                     * 20958
        ;                                        * 2095D

* refs (3): 2093A 2098A 209F5
RclRealInVars(nm):
        ::                                       * 20962
          SAFE@_HERE                             * 20967
          NOTcase                                * 2096C
          SETNONEXTERR                           * 20971
          CKREAL                                 * 20976
        ;                                        * 2097B

* refs (1): 2090D
incr(ln):
        ::                                       * 20980
          DUP                                    * 20985
          RclRealInVars(nm)                      * 2098A
          %1+                                    * 2098F
          DUPROT                                 * 20994
          STO                                    * 20999
        ;                                        * 2099E

* name -> x_new
* ROMPTR 002 14C DECR
* refs (1): 189EA
        CON(1)  8                                * 209A3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 209A4  library
        CON(3)  #14C                             * 209A7  command
xDECR:
        ::                                       * 209AA
          CK1&Dispatch                           * 209AF
          BINT6                                  * 209B4
          decr(gn)                               * 209B9
          BINT7                                  * 209BE
          decr(ln)                               * 209C3
        ;                                        * 209C8

* refs (1): 209B9
decr(gn):
        ::                                       * 209CD
          OBJ_20935                              * 209D2
          %-                                     * 209D7
          SWAP                                   * 209DC
          REPLACE                                * 209E1
        ;                                        * 209E6

* refs (1): 209C3
decr(ln):
        ::                                       * 209EB
          DUP                                    * 209F0
          RclRealInVars(nm)                      * 209F5
          %1-                                    * 209FA
          DUPROT                                 * 209FF
          STO                                    * 20A04
        ;                                        * 20A09

* symb -> symb'
* ROMPTR 002 14D COLCT
* refs (1): 189EA
        CON(1)  8                                * 20A0E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20A0F  library
        CON(3)  #14D                             * 20A12  command
xCOLCT:
        ::                                       * 20A15
          CK1&Dispatch                           * 20A1A
          BINT1                                  * 20A1F
          SYMCOLCT                               * 20A24
          BINT2                                  * 20A29
          SYMCOLCT                               * 20A2E
          BINT10                                 * 20A33
          SYMCOLCT                               * 20A38
        ;                                        * 20A3D

* symb1 -> symb2
* ROMPTR 002 14E EXPAN
* refs (1): 189EA
        CON(1)  8                                * 20A42  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20A43  library
        CON(3)  #14E                             * 20A46  command
xEXPAN:
        ::                                       * 20A49
          CK1&Dispatch                           * 20A4E
          BINT1                                  * 20A53
          SYMEXPAN                               * 20A58
          BINT2                                  * 20A5D
          SYMEXPAN                               * 20A62
          BINT10                                 * 20A67
          SYMEXPAN                               * 20A6C
        ;                                        * 20A71

* ROMPTR 002 14F RULES
* refs (1): 189EA
        CON(1)  8                                * 20A76  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20A77  library
        CON(3)  #14F                             * 20A7A  command
xRULES:
        ::                                       * 20A7D
          OBJ_492AC                              * 20A82
        ;                                        * 20A87

* symb var -> symb'
* ROMPTR 002 150 ISOL
* refs (1): 189EA
        CON(1)  8                                * 20A8C  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20A8D  library
        CON(3)  #150                             * 20A90  command
xISOL:
        ::                                       * 20A93
          CK2&Dispatch                           * 20A98
          SYMID                                  * 20A9D
          SYMISOL                                * 20AA2
        ;                                        * 20AA7

* symb var -> symb'
* ROMPTR 002 151 QUAD
* refs (1): 189EA
        CON(1)  8                                * 20AAC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20AAD  library
        CON(3)  #151                             * 20AB0  command
xQUAD:
        ::                                       * 20AB3
          CK2&Dispatch                           * 20AB8
          SYMID                                  * 20ABD
          SYMQUAD                                * 20AC2
        ;                                        * 20AC7

* symb name -> symb' symb {names} -> symb'
* ROMPTR 002 152 SHOW
* refs (1): 189EA
        CON(1)  8                                * 20ACC  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20ACD  library
        CON(3)  #152                             * 20AD0  command
xSHOW:
        ::                                       * 20AD3
          CK2&Dispatch                           * 20AD8
          SYMID                                  * 20ADD
          SYMSHOW                                * 20AE2
          SYMLAM                                 * 20AE7
          SYMSHOW                                * 20AEC
          SYMLIST                                * 20AF1
          XEQSHOWLS                              * 20AF6
        ;                                        * 20AFB

* sym {} -> symf
* refs (2): 20AF6 9F0DE
XEQSHOWLS:
        ::                                       * 20B00
          dup;ListOfNames?:dq/sk                 * 20B05
          SHOWLS                                 * 20B0A
          SETTYPEERR                             * 20B0F
        ;                                        * 20B14

* symb var n -> symb'
* ROMPTR 002 153 TAYLR
* refs (1): 189EA
        CON(1)  8                                * 20B19  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20B1A  library
        CON(3)  #153                             * 20B1D  command
xTAYLR:
        ::                                       * 20B20
          CK3&Dispatch                           * 20B25
          SYMIDREAL                              * 20B2A
          SYMTAYLR                               * 20B2F
        ;                                        * 20B34

* var -> x :port:nlib -> lib :port:name -> ob :port:{path} -> ob
* ROMPTR 002 154 RCL
* refs (5): 189EA 21781 40134 40341 85945
        CON(1)  8                                * 20B39  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20B3A  library
        CON(3)  #154                             * 20B3D  command
xRCL:
        ::                                       * 20B40
          CK1&Dispatch                           * 20B45
          BINT13                                 * 20B4A
          rcl(to)                                * 20B4F
          BINT6                                  * 20B54
          XEQRCL                                 * 20B59
          BINT7                                  * 20B5E
          XEQRCL                                 * 20B63
          BINT8                                  * 20B68
          PICTRCL                                * 20B6D
          BINT5                                  * 20B72
          rcl(li)                                * 20B77
        ;                                        * 20B7C

* id -> ob
* refs (18): 1A26F 20B59 20B63 20C21 20C3A 22F77 ...
XEQRCL:
        ::                                       * 20B81
          SAFE@                                  * 20B86
          NOTcase                                * 20B8B
          SETNONEXTERR                           * 20B90
        ;                                        * 20B95

* refs (1): 20B77
rcl(li):
        ::                                       * 20B9A
          DUPTYPELIST?                           * 20B9F
          NOTcase                                * 20BA4
          SETTYPEERR                             * 20BA9
          DUP                                    * 20BAE
          BINT1                                  * 20BB3
          NTHELCOMP                              * 20BB8
          NOTcase                                * 20BBD
          SETTYPEERR                             * 20BC2
          '                                      * 20BC7
          xHOME                                  * 20BCC
          EQ                                     * 20BD1
          case                                   * 20BD6
          RclFromHome(li)                        * 20BDB

* refs (1): 20C80
dup;ListOfNames?#:BAT!:
          ::                                     * 20BE0
            ::                                   * 20BE5
              dup;ListOfNames?:dq/sk             * 20BEA
              SKIP                               * 20BEF
            ;                                    * 20BF4
            SETTYPEERR                           * 20BF9
          ;                                      * 20BFE
          DUP                                    * 20C03
          CARCOMP                                * 20C08
          SWAPDUP                                * 20C0D
          LENCOMP                                * 20C12
          #1=                                    * 20C17
          casedrop                               * 20C1C
          XEQRCL                                 * 20C21
          SWAP                                   * 20C26
          DUPTYPEIDNT?                           * 20C2B
          NOTcase                                * 20C30
          SETTYPEERR                             * 20C35
          XEQRCL                                 * 20C3A
          DUPTYPERRP?                            * 20C3F
          NOTcase                                * 20C44
          SETTYPEERR                             * 20C49

* refs (1): 20CA3
rcl(li,di):
          ::                                     * 20C4E
            SWAP                                 * 20C53
            rcl(di,li)?                          * 20C58
            NOTcase                              * 20C5D
            SETNONEXTERR                         * 20C62
          ;                                      * 20C67
        ;                                        * 20C6C

* refs (1): 20BDB
RclFromHome(li):
        ::                                       * 20C71
          DUP                                    * 20C76
          CDRCOMP                                * 20C7B
          dup;ListOfNames?#:BAT!                 * 20C80
          CONTEXT@                               * 20C85
          SWAPDROP                               * 20C8A
          HOMEDIR                                * 20C8F
          CONTEXT@                               * 20C94
          SWAP                                   * 20C99
          CONTEXT!                               * 20C9E
          rcl(li,di)                             * 20CA3
        ;                                        * 20CA8

* xPICT -> grob
* refs (1): 20B6D
PICTRCL:
        ::                                       * 20CAD
          CKPICT                                 * 20CB2
          GBUFF                                  * 20CB7
          TOTEMPOB                               * 20CBC
        ;                                        * 20CC1

* ob name -> ob :port:name -> lib port -> bup port -> ob 'name(i)' ->
* ROMPTR 002 155 STO
* refs (7): 189EA 21588 3B3F5 3B41D 40111 40404 ...
        CON(1)  8                                * 20CC6  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20CC7  library
        CON(3)  #155                             * 20CCA  command
xSTO:
        ::                                       * 20CCD
          CK2&Dispatch                           * 20CD2
          BINT13                                 * 20CD7
          sto(_,to)                              * 20CDC
          BINT6                                  * 20CE1

sto(_,gn):
          ::                                     * 20CE6
            STRIPTAGSl2                          * 20CEB
            XEQSTOID                             * 20CF0
          ;                                      * 20CF5
          BINT7                                  * 20CFA

sto(_,ln):
          ::                                     * 20CFF
            STRIPTAGSl2                          * 20D04
            STO                                  * 20D09
          ;                                      * 20D0E
          BINT9                                  * 20D13

sto(_,ex):
          ::                                     * 20D18
            STRIPTAGSl2                          * 20D1D
            StoLT(_,ex)                          * 20D22
          ;                                      * 20D27
          #       C8                             * 20D2C  200
          sto(go,PICT)                           * 20D36
          #       9F1                            * 20D3B  2545
          sto(bk,r)                              * 20D45
          #       8F1                            * 20D4A  2289
          sto(bk,r)                              * 20D54
        ;                                        * 20D59

* 'name=expr' -> 'name(name1...)=expr(name1...) ->
* ROMPTR 002 156 DEFINE
* refs (1): 189EA
        CON(1)  8                                * 20D5E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20D5F  library
        CON(3)  #156                             * 20D62  command
xDEFINE:
        ::                                       * 20D65
          CK1&Dispatch                           * 20D6A
          BINT9                                  * 20D6F
          define(eq)                             * 20D74
        ;                                        * 20D79

* refs (1): 20D74
define(eq):
        ::                                       * 20D7E
          SPLITEQ                                * 20D83
          SWAP                                   * 20D88
          CK&DISPATCH0                           * 20D8D
          BINT6                                  * 20D92
          define(_,nm)                           * 20D97
          BINT7                                  * 20D9C
          define(_,nm)                           * 20DA1
          BINT9                                  * 20DA6
          define(_,ex)                           * 20DAB
          BINT0                                  * 20DB0
          INVDEFERR                              * 20DB5
        ;                                        * 20DBA

* refs (2): 20D97 20DA1
define(_,nm):
        ::                                       * 20DBF
          NOTNUM?                                * 20DC4
          ?SKIP                                  * 20DC9
          ::                                     * 20DCE
            SWAP                                 * 20DD3
            CK0NOLASTWD                          * 20DD8
            EVAL                                 * 20DDD
            ->num(ex)                            * 20DE2
            0LASTOWDOB!                          * 20DE7
            CK2NOLASTWD                          * 20DEC
            SWAP                                 * 20DF1
            dup;nm?#:_IDEF_                      * 20DF6
          ;                                      * 20DFB
          XEQSTOID                               * 20E00
        ;                                        * 20E05

* refs (1): 20DAB
define(_,ex):
        ::                                       * 20E0A
          INNERCOMP                              * 20E0F
          M1stFNCcase                            * 20E14
          ::                                     * 20E19
            2DROP                                * 20E1E
            DUPUNROT                             * 20E23
            #3+                                  * 20E28
            UNROLL                               * 20E2D
            tok<<                                * 20E32
            tok->                                * 20E37
            &$                                   * 20E3C
            SWAP                                 * 20E41
            #1+_ONE_DO                           * 20E46
            $       " "                          * 20E4B
            &$                                   * 20E57
            ISTOP@                               * 20E5C
            INDEX@#-                             * 20E61
            #1+ROLL                              * 20E66
            dup;nm?#:_IDEF_                      * 20E6B
            ID>$                                 * 20E70
            &$                                   * 20E75
            LOOP                                 * 20E7A
            SWAP                                 * 20E7F
            symcomp                              * 20E84
            EDITDECOMP$                          * 20E89
            &$                                   * 20E8E
            palparse                             * 20E93
            NOTcase                              * 20E98
            ERRJMP                               * 20E9D
            EVAL                                 * 20EA2
            SWAP                                 * 20EA7
            CARCOMP                              * 20EAC
            dup;nm?#:_IDEF_                      * 20EB1
            XEQSTOID                             * 20EB6
          ;                                      * 20EBB
          INVDEFERR                              * 20EC0
        ;                                        * 20EC5

* refs (3): 20DF6 20E6B 20EB1
dup;nm?#:_IDEF_:
        ::                                       * 20ECA
          CK&DISPATCH0                           * 20ECF
          BINT6                                  * 20ED4
          NOP                                    * 20ED9
          BINT7                                  * 20EDE
          NOP                                    * 20EE3
          BINT0                                  * 20EE8
          INVDEFERR                              * 20EED
        ;                                        * 20EF2

* name -> {names} -> PICT -> :port:name -> :port:nlib ->
* ROMPTR 002 157 PURGE
* refs (17): 189EA 20F80 21811 21825 85B7F D2FF3 ...
        CON(1)  8                                * 20EF7  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20EF8  library
        CON(3)  #157                             * 20EFB  command
xPURGE:
        ::                                       * 20EFE
          CK1&Dispatch                           * 20F03
          BINT13                                 * 20F08
          purge(to)                              * 20F0D
          BINT6                                  * 20F12
          ?PURGE_HERE                            * 20F17
          BINT5                                  * 20F1C
          purge(li)                              * 20F21
          BINT8                                  * 20F26
          XEQPURGEPICT                           * 20F2B
        ;                                        * 20F30

* refs (2): 20F21 B9D7C
purge(li):
        ::                                       * 20F35
          DUPNULLCOMP?                           * 20F3A
          caseDROP                               * 20F3F

* refs (1): 1EF2D
OBJ_20F44:
          ::                                     * 20F44
            'R                                   * 20F49
            1LAMBIND                             * 20F4E
            toLEN_DO                             * 20F53
            DUPINDEX@                            * 20F58
            NTHCOMPDROP                          * 20F5D
            1GETLAM                              * 20F62
            EvalNoCK                             * 20F67
            LOOP                                 * 20F6C
            DROP                                 * 20F71
            ABND                                 * 20F76
          ;                                      * 20F7B
          xPURGE                                 * 20F80
        ;                                        * 20F85

* xPICT ->
* refs (1): 20F2B
XEQPURGEPICT:
        ::                                       * 20F8A
          CKPICT                                 * 20F8F
          OBJ_46152                              * 20F94
          KILLGDISP                              * 20F99
        ;                                        * 20F9E

* -> x
* ROMPTR 002 158 MEM
* refs (3): 189EA 21866 268A4
        CON(1)  8                                * 20FA3  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20FA4  library
        CON(3)  #158                             * 20FA7  command
xMEM:
        ::                                       * 20FAA
          CK0                                    * 20FAF
          GARBAGE                                * 20FB4
          MEM                                    * 20FB9
          UNCOERCE                               * 20FBE
          %2                                     * 20FC3
          %/                                     * 20FC8
        ;                                        * 20FCD

* {names} ->
* ROMPTR 002 159 ORDER
* refs (1): 189EA
        CON(1)  8                                * 20FD2  command header: flags (meaning not yet known)
        CON(3)  #002                             * 20FD3  library
        CON(3)  #159                             * 20FD6  command
xORDER:
        ::                                       * 20FD9
          CK1&Dispatch                           * 20FDE
          BINT5                                  * 20FE3
          XEQORDER                               * 20FE8
        ;                                        * 20FED

* {id1 id2..} ->
* refs (1): 20FE8
XEQORDER:
        ::                                       * 20FF2
          TYPEIDNT                               * 20FF7
          ChkType(li,s)                          * 20FFC
          PTR     DoHere:                        * 21001

order!(li):
          ::                                     * 21006
            INNERCOMP                            * 2100B
            ZERO_DO                              * 21010
            ?ATTNQUIT                            * 21015
            DUP@                                 * 2101A
            ?SKIP                                * 2101F
            SETNONEXTERR                         * 21024
            DUPTYPERRP?                          * 21029
            SWAP                                 * 2102E
            REFERENCED?                          * 21033
            ROTAND                               * 21038
            ITE                                  * 2103D
            OBJ_21074                            * 21042

PurgeSto(nm,_):
            ::                                   * 21047
              OVER                               * 2104C
              PURGE                              * 21051
              SWAP                               * 21056
              CREATE                             * 2105B
            ;                                    * 21060
            LOOP                                 * 21065
          ;                                      * 2106A
        ;                                        * 2106F

* refs (1): 21042
OBJ_21074:
        ::                                       * 21074
          DUP                                    * 21079
          TOTEMPOB                               * 2107E
          3PICK                                  * 21083
          CREATE                                 * 21088
          SWAP                                   * 2108D
          rcl(nm)?;drop                          * 21092
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
            BSS     8                            * 210E3
          ENDCODE                                * 210EB
          purge(_)                               * 210EB
        ;                                        * 210F0

* ->
* ROMPTR 002 15A CLVAR
* refs (1): 189EA
        CON(1)  8                                * 210F5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 210F6  library
        CON(3)  #15A                             * 210F9  command
xCLUSR:
        ::                                       * 210FC
          CK0                                    * 21101
          CONTEXT@                               * 21106
          DUP                                    * 2110B
          SYSRRP?                                * 21110
          BEGIN                                  * 21115
          2DUP                                   * 2111A
          ITE                                    * 2111F
          LastNonNull                            * 21124
          LASTRAM-WORD                           * 21129
          WHILE                                  * 2112E

PurgeNameOf(_):
          ::                                     * 21133
            RAM-WORDNAME                         * 21138
            ?PURGE_HERE                          * 2113D
          ;                                      * 21142
          REPEAT                                 * 21147
          2DROP                                  * 2114C
        ;                                        * 21151

* %  -> [InitMenu%] {} -> name -> Ob -> [@LIST InitMenu]
* ROMPTR 002 15B TMENU
* refs (1): 189EA
        CON(1)  8                                * 21156  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21157  library
        CON(3)  #15B                             * 2115A  command
xTMENU:
        ::                                       * 2115D
          CK1&Dispatch                           * 21162
          BINT1                                  * 21167
          InitMenu%                              * 2116C
          BINT0                                  * 21171

tmenu(#r):
          ::                                     * 21176
            ChkForMenu(_)                        * 2117B
            InitMenu                             * 21180
          ;                                      * 21185
        ;                                        * 2118A

* % -> menu ->
* ROMPTR 002 15C MENU
* refs (1): 189EA
        CON(1)  8                                * 2118F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21190  library
        CON(3)  #15C                             * 21193  command
xMENU:
        ::                                       * 21196
          CK1                                    * 2119B
          DUPTYPEREAL?                           * 211A0
          case                                   * 211A5
          InitMenu%                              * 211AA
          '                                      * 211AF

* ID CST
* refs (1): 3BEBD
ID_CST:
          ID      CST                            * 211B4
          OBJ_2157E                              * 211C1
          '                                      * 211C6
          nCustomMenu                            * 211CB
          InitMenu                               * 211D0
        ;                                        * 211D5

* -> x
* ROMPTR 002 15D RCLMENU
* refs (1): 189EA
        CON(1)  8                                * 211DA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 211DB  library
        CON(3)  #15D                             * 211DE  command
xRCLMENU:
        ::                                       * 211E1
          CK0                                    * 211E6
          GetMenu%                               * 211EB
        ;                                        * 211F0

* nport -> {} mem
* ROMPTR 002 15E PVARS
* refs (1): 189EA
        CON(1)  8                                * 211F5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 211F6  library
        CON(3)  #15E                             * 211F9  command
xPVARS:
        ::                                       * 211FC
          CK1&Dispatch                           * 21201
          BINT1                                  * 21206

pvars(r):
          ::                                     * 2120B
            COERCE                               * 21210
            DUP                                  * 21215
            OBJ_72A73                            * 2121A
            SETPORTNOTAV                         * 2121F
            pvars(s)                             * 21224
          ;                                      * 21229
        ;                                        * 2122E

* name ->
* ROMPTR 002 15F PGDIR
* refs (2): 189EA D2A18
        CON(1)  8                                * 21233  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21234  library
        CON(3)  #15F                             * 21237  command
xPGDIR:
        ::                                       * 2123A
          CK1&Dispatch                           * 2123F
          BINT6                                  * 21244
          XEQPGDIR                               * 21249
        ;                                        * 2124E

* :port:name -> :IO:name ->
* ROMPTR 002 160 ARCHIVE
* refs (1): 189EA
        CON(1)  8                                * 21253  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21254  library
        CON(3)  #160                             * 21257  command
xARCHIVE:
        ::                                       * 2125A
          CK1&Dispatch                           * 2125F
          BINT13                                 * 21264
          OBJ_21273                              * 21269
        ;                                        * 2126E

* refs (1): 21269
OBJ_21273:
        ::                                       * 21273
          TAG>                                   * 21278

_IO_:
          $       "IO"                           * 2127D
          OVER                                   * 2128B
          EQUALNOTcase                           * 21290
          archive(nm,st)                         * 21295
          DROP                                   * 2129A
          CK&DISPATCH1                           * 2129F
          BINT3                                  * 212A4
          XEQIOBACKUP                            * 212A9
          BINT6                                  * 212AE
          XEQIOBACKUP                            * 212B3
          BINT7                                  * 212B8
          XEQIOBACKUP                            * 212BD
        ;                                        * 212C2

* refs (1): 21295
archive(nm,st):
        ::                                       * 212C7

* refs (1): 21355
OBJ_212CC:
          ::                                     * 212CC

ChkName2:
            ::                                   * 212D1
              SWAP                               * 212D6
              idntlamcase                        * 212DB
              SWAP                               * 212E0
              SETTYPEERR                         * 212E5
            ;                                    * 212EA
            palparse                             * 212EF
            NOTcase                              * 212F4
            SETTYPEERR                           * 212F9
            DUPTYPEREAL?                         * 212FE
            NOTcase                              * 21303
            SETTYPEERR                           * 21308
            COERCEDUP                            * 2130D
            BINT33                               * 21312
            #>case                               * 21317
            SETPORTNOTAV                         * 2131C
          ;                                      * 21321
          COLA                                   * 21326
          archive(nm,s)                          * 2132B
        ;                                        * 21330

* :port:name -> ob ->
* ROMPTR 002 161 RESTORE
* refs (1): 189EA
        CON(1)  8                                * 21335  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21336  library
        CON(3)  #161                             * 21339  command
xRESTORE:
        ::                                       * 2133C
          CK1&Dispatch                           * 21341
          BINT13                                 * 21346

restore(to):
          ::                                     * 2134B
            TAG>                                 * 21350
            OBJ_212CC                            * 21355
            restore(nm,s)                        * 2135A
          ;                                      * 2135F
          #       9F                             * 21364  159
          restore(bk)                            * 2136E
        ;                                        * 21373

* 1 ->
* ROMPTR 002 162 MERGE
* refs (1): 189EA
        CON(1)  8                                * 21378  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21379  library
        CON(3)  #162                             * 2137C  command
xMERGE:
        ::                                       * 2137F
          CK1&Dispatch                           * 21384
          BINT1                                  * 21389
          merge(r)                               * 2138E
        ;                                        * 21393

* refs (1): 2138E
merge(r):
        ::                                       * 21398
          COERCE                                 * 2139D
          DUP#0=case                             * 213A2
          SETPORTNOTAV                           * 213A7
          DUP                                    * 213AC
          #>2case                                * 213B1
          SETPORTNOTAV                           * 213B6
          COLA                                   * 213BB
          OBJ_0B40C                              * 213C0
        ;                                        * 213C5

* ROMPTR 002 163 FREE
* refs (1): 189EA
        CON(1)  8                                * 213CA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 213CB  library
        CON(3)  #163                             * 213CE  command
xFREE:
        ::                                       * 213D1
          CK2&Dispatch                           * 213D6
          BINT81                                 * 213DB
          free(li,r)                             * 213E0
          BINT97                                 * 213E5
          free(2r)                               * 213EA
          BINT113                                * 213EF
          free(2r)                               * 213F4
          BINT17                                 * 213F9
          free(2r)                               * 213FE
        ;                                        * 21403

* refs (6): 213EA 213F4 213FE C097A C0993 C09AC
free(2r):
        ::                                       * 21408
          SWAP                                   * 2140D
          ONE{}N                                 * 21412
          SWAPCOLA                               * 21417
          free(li,r)                             * 2141C
        ;                                        * 21421

* -> {title nlib nport ...}
* ROMPTR 002 164 LIBS
* refs (1): 189EA
        CON(1)  8                                * 21426  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21427  library
        CON(3)  #164                             * 2142A  command
xLIBS:
        ::                                       * 2142D
          CK0                                    * 21432
          libs                                   * 21437
        ;                                        * 2143C

* n -> :nport:n ->
* ROMPTR 002 165 ATTACH
* refs (1): 189EA
        CON(1)  8                                * 21441  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21442  library
        CON(3)  #165                             * 21445  command
xATTACH:
        ::                                       * 21448
          CK1&Dispatch                           * 2144D
          BINT1                                  * 21452
          attach(r)                              * 21457
        ;                                        * 2145C

* refs (1): 21457
attach(r):
        ::                                       * 21461
          ChkNøLib(r)                            * 21466
          XEQSETLIB                              * 2146B
        ;                                        * 21470

* n -> :port:n ->
* ROMPTR 002 166 DETACH
* refs (1): 189EA
        CON(1)  8                                * 21475  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21476  library
        CON(3)  #166                             * 21479  command
xDETACH:
        ::                                       * 2147C
          CK1&Dispatch                           * 21481
          BINT1                                  * 21486
          detach(r)                              * 2148B
        ;                                        * 21490

* refs (1): 2148B
detach(r):
        ::                                       * 21495
          ChkNøLib(r)                            * 2149A
          detach(s)                              * 2149F
        ;                                        * 214A4

* refs (2): 21466 2149A
ChkNøLib(r):
        ::                                       * 214A9
          COERCEDUP                              * 214AE
          REALOBOB                               * 214B3
          #<case                                 * 214B8
          SETSIZEERR                             * 214BD
          DUP                                    * 214C2
          FSTMACROROM#                           * 214C7
          #<                                     * 214CC
          ?SEMI                                  * 214D1
          DUP                                    * 214D6
          FSTMACROROM#                           * 214DB
          #>                                     * 214E0
          ?SEMI                                  * 214E5
          SETSIZEERR                             * 214EA
        ;                                        * 214EF
        BSS     7                                * 214F4

* refs (1): 22638
OBJ_214FB:
        ::                                       * 214FB
          CK1                                    * 21500
          STRIPTAGS                              * 21505
        ;                                        * 2150A

* refs (2): 20CDC 8FCEB
sto(_,to):
        ::                                       * 2150F
          TAG>                                   * 21514
          palparse                               * 21519
          ITE                                    * 2151E
          ::                                     * 21523
            DUPTYPEREAL?                         * 21528
            NOTcaseDROP                          * 2152D
            COERCE                               * 21532
            DUP                                  * 21537
            BINT34                               * 2153C
            #<                                   * 21541
            NOTcaseDROP                          * 21546
            '                                    * 2154B
            ROMPTR  0F0 07E                      * 21550
            SWAP                                 * 2155B
            BINT2                                * 21560
            ::N                                  * 21565
            RDROPCOLA                            * 2156A
            EVAL                                 * 2156F
          ;                                      * 21574
          3DROP                                  * 21579

* refs (7): 211C1 2F696 40F4F 42EBD 852CE D45B5 ...
OBJ_2157E:
          ::                                     * 2157E
            '                                    * 21583
            xSTO                                 * 21588
            COLA                                 * 2158D
            EvalNoCK                             * 21592
          ;                                      * 21597
        ;                                        * 2159C

* refs (2): 852BF 853CD
sto(bk,nm,s):
        ::                                       * 215A1
          BINT0                                  * 215A6
          #=casedrop                             * 215AB
          sto0(bk,nm)                            * 215B0
          sto12(bk,nm,s)                         * 215B5
        ;                                        * 215BA

* refs (2): 20D45 20D54
sto(bk,r):
        ::                                       * 215BF
          COLA                                   * 215C4
          ROMPTR  0F0 080                        * 215C9
        ;                                        * 215D4

* refs (1): 21615
dup;BkpName(bk):
        ::                                       * 215D9
          DUP                                    * 215DE
          DNOTBAKcase                            * 215E3

SlibNum(lb):
          ::                                     * 215E8
            LIB>#                                * 215ED
            DROP                                 * 215F2
          ;                                      * 215F7
          BAKNAME                                * 215FC
          DROP                                   * 21601
        ;                                        * 21606

* refs (3): 852F6 85300 8536E
OBJ_2160B:
        ::                                       * 2160B
          SWAPDROP                               * 21610
          dup;BkpName(bk)                        * 21615
          TRUE                                   * 2161A
        ;                                        * 2161F

* refs (1): 85337
DoBkpName(_);true:
        ::                                       * 21624
          >BAK                                   * 21629
          TRUE                                   * 2162E
        ;                                        * 21633

* refs (8): 0F1E6 0F268 0FDEA 31994 31CDB 37D1E ...
dup;r?:dq/sk:
        ::                                       * 21638
          DUPTYPEREAL?                           * 2163D
          COLAcase                               * 21642
        ;                                        * 21647

* refs (4): 314DB 3500B 85378 85382
swap;false:
        ::                                       * 2164C
          SWAP                                   * 21651
          FALSE                                  * 21656
        ;                                        * 2165B

* ob1 ob2 -> ob2 T
* refs (5): 0F209 239D9 26AFA 27101 271FC
SWAPDROPTRUE:
        ::                                       * 21660
          SWAPDROP                               * 21665
          TRUE                                   * 2166A
        ;                                        * 2166F

* id ob -> bak
* refs (1): 21629
>BAK:
        ::                                       * 21674
          SWAP                                   * 21679
          ID>$                                   * 2167E
          DUP                                    * 21683
          NULL$?                                 * 21688
          case                                   * 2168D
          SETTYPEERR                             * 21692
          SPACE$                                 * 21697
          &$                                     * 2169C
          $>ID                                   * 216A1
          SWAP                                   * 216A6
          ?>ROMPTR                               * 216AB
          INHARDROM?                             * 216B0
          IT                                     * 216B5
          TOTEMPOB                               * 216BA
          TRUE                                   * 216BF
          BINT3                                  * 216C4
          P{}N                                   * 216C9
          OB>BAKcode                             * 216CE
        ;                                        * 216D3

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
        ::                                       * 21761
          TRUE                                   * 21766
          ROMPTR  0F0 081                        * 2176B
          ROMPTR  0F0 091                        * 21776
          xRCL                                   * 21781
        ;                                        * 21786

* refs (2): 85483 854F1
OBJ_2178B:
        ::                                       * 2178B
          RSKIP                                  * 21790
          'RRDROP                                * 21795
          COLA                                   * 2179A
          EvalNoCK                               * 2179F
        ;                                        * 217A4

* refs (3): 854B5 854C9 854E2
OBJ_217A9:
        ::                                       * 217A9
          'RRDROP                                * 217AE
          'R                                     * 217B3
          RSKIP                                  * 217B8
          COLA_EVAL                              * 217BD
        ;                                        * 217C2

* refs (1): 1A3E1
eval(to):
        ::                                       * 217C7
          TRUE                                   * 217CC
          ROMPTR  0F0 081                        * 217D1
          ROMPTR  0F0 08C                        * 217DC
          xEVAL                                  * 217E7
        ;                                        * 217EC

* refs (2): 20F0D 8FCF0
purge(to):
        ::                                       * 217F1
          FALSE                                  * 217F6
          ROMPTR  0F0 081                        * 217FB
          ROMPTR  0F0 08E                        * 21806
          xPURGE                                 * 21811
        ;                                        * 21816

* refs (1): 40F77
OBJ_2181B:
        ::                                       * 2181B
          '                                      * 21820
          xPURGE                                 * 21825
          COLA                                   * 2182A
          EvalNoCK                               * 2182F
        ;                                        * 21834

* refs (1): 21224
pvars(s):
        ::                                       * 21839
          DUP                                    * 2183E
          pvars->s                               * 21843
          {}N                                    * 21848
          SWAP                                   * 2184D
          BINT0                                  * 21852
          #=casedrop                             * 21857
          ::                                     * 2185C
            'EvalNoCK:_sup                       * 21861
            xMEM                                 * 21866
          ;                                      * 2186B
          DUP                                    * 21870
          PORTSTATUS                             * 21875
          5ROLL                                  * 2187A
          NOTcase                                * 2187F
          SETPORTNOTAV                           * 21884
          4ROLL                                  * 21889
          NOTcase                                * 2188E

4dropn;_ROM_:
          ::                                     * 21893
            4DROP                                * 21898

_ROM_:
            $       "ROM"                        * 2189D
          ;                                      * 218AD
          ROT                                    * 218B2
          case                                   * 218B7

3dropn;_SYSRAM_:
          ::                                     * 218BC
            3DROP                                * 218C1

_SYSRAM_:
            $       "SYSRAM"                     * 218C6
          ;                                      * 218DC
          ROT                                    * 218E1
          PORTEND                                * 218E6
          SWAP                                   * 218EB
          #-                                     * 218F0
          #-                                     * 218F5
          UNCOERCE                               * 218FA
          %2                                     * 218FF
          %/                                     * 21904
        ;                                        * 21909

* refs (1): 21843
pvars->s:
        ::                                       * 2190E
          GetBVars                               * 21913
          pvars(s,B)                             * 21918
        ;                                        * 2191D

* refs (2): 21913 3F6F1
GetBVars:
        ::                                       * 21922
          DUP                                    * 21927
          DUP#0=csedrp                           * 2192C

RclPort0:
          ::                                     * 21931
            AdrPort0                             * 21936
            RclPortFrom(adr)                     * 2193B
          ;                                      * 21940
          PORTSTATUS                             * 21945
          SWAPDROP                               * 2194A
          4UNROLL                                * 2194F
          SWAPDROP                               * 21954
          NOTAND                                 * 21959
          NOTcasedrop                            * 2195E
          BINT0                                  * 21963
          RclPortFrom(adr)                       * 21968
        ;                                        * 2196D

* refs (2): 2193B 21968
RclPortFrom(adr):
        ::                                       * 21972
          ZEROSWAP                               * 21977
          BEGIN                                  * 2197C
          NEXTLIBBAK                             * 21981
          WHILE                                  * 21986

rot;1+(s);swap:
          ::                                     * 2198B
            ROT#1+                               * 21990
            SWAP                                 * 21995
          ;                                      * 2199A
          REPEAT                                 * 2199F
        ;                                        * 219A4

* refs (2): 21918 3F6FB
pvars(s,B):
        ::                                       * 219A9
          DUP#2+                                 * 219AE
          ROLL                                   * 219B3
          OVER#0=                                * 219B8
          caseDROP                               * 219BD
          #>$                                    * 219C2
          OVER                                   * 219C7
          ZERO_DO                                * 219CC
          ROT                                    * 219D1
          ::                                     * 219D6
            OBJ_71BB6                            * 219DB

LibNum(lb):
            ::                                   * 219E0
              LIB>#                              * 219E5
              DROP                               * 219EA
              UNCOERCE                           * 219EF
            ;                                    * 219F4
            BAKNAME                              * 219F9
            DROP                                 * 219FE
          ;                                      * 21A03
          OVER                                   * 21A08
          >TAG                                   * 21A0D
          3pick;2+(s)                            * 21A12
          UNROLL                                 * 21A17
          LOOP                                   * 21A1C
          DROP                                   * 21A21
        ;                                        * 21A26
        BSS     30                               * 21A2B

* refs (1): 2132B
archive(nm,s):
        ::                                       * 21A49
          BINT0                                  * 21A4E
          #=casedrop                             * 21A53
          archive0(s)                            * 21A58
          2DUP                                   * 21A5D
          RclBkp12(nm,s)?                        * 21A62
          case                                   * 21A67
          SETOBINUSE                             * 21A6C
          OVER                                   * 21A71
          HomeInBkp(nm)                          * 21A76
          3UNROLL                                * 21A7B
          ERRSET                                 * 21A80
          sto12(bk,nm,s)                         * 21A85
          ERRTRAP                                * 21A8A

* refs (1): 21AE4
OBJ_21A8F:
          ::                                     * 21A8F
            OBJ_09699                            * 21A94
            InitEnab                             * 21A99
            ERRJMP                               * 21A9E
          ;                                      * 21AA3
          OBJ_09699                              * 21AA8
          InitEnab                               * 21AAD
        ;                                        * 21AB2

* refs (1): 21A58
archive0(s):
        ::                                       * 21AB7
          DUP                                    * 21ABC
          RclBkp0(nm)?                           * 21AC1
          case                                   * 21AC6
          SETOBINUSE                             * 21ACB
          HomeInBkp(nm)                          * 21AD0
          ERRSET                                 * 21AD5
          sto0!(bk)                              * 21ADA
          ERRTRAP                                * 21ADF
          OBJ_21A8F                              * 21AE4
          OBJ_09699                              * 21AE9
          InitEnab                               * 21AEE
        ;                                        * 21AF3

* refs (1): 2135A
restore(nm,s):
        ::                                       * 21AF8

RclBkp(nm,s)?:
          ::                                     * 21AFD
            BINT0                                * 21B02
            #=casedrop                           * 21B07
            RclBkp0(nm)?                         * 21B0C
            RclBkp12(nm,s)?                      * 21B11
          ;                                      * 21B16
          NOTcase                                * 21B1B
          SETNONEXTERR                           * 21B20
          OBJ_71BB6                              * 21B25
          SETTYPEERR                             * 21B2A

* refs (1): 2136E
restore(bk):
          ::                                     * 21B2F
            COLA                                 * 21B34
            ROMPTR  0F0 084                      * 21B39
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
        ::                                       * 21B5A
          COLA                                   * 21B5F
          ROMPTR  0F0 085                        * 21B64
        ;                                        * 21B6F

* refs (3): 213E0 2141C C0961
free(li,r):
        ::                                       * 21B74
          COLA                                   * 21B79
          ROMPTR  0F0 086                        * 21B7E
        ;                                        * 21B89

* refs (1): 856D7
OBJ_21B8E:
        ::                                       * 21B8E
          #1-SWAP                                * 21B93
          DUP                                    * 21B98
          RclBkp0(nm)?                           * 21B9D
          NOTcase                                * 21BA2
          SETNONEXTERR                           * 21BA7
          SWAP                                   * 21BAC
          dvarlsBIND                             * 21BB1
          pshm1                                  * 21BB6
          DUP#0=                                 * 21BBB
          case                                   * 21BC0
          ABND                                   * 21BC5
          pshzer                                 * 21BCA
          BEGIN                                  * 21BCF
          #1-SWAP                                * 21BD4
          1GETLAM                                * 21BD9
          OVER                                   * 21BDE
          EQUAL                                  * 21BE3
          ITE                                    * 21BE8
          ::                                     * 21BED
            DROP                                 * 21BF2
            rot                                  * 21BF7
            OVER                                 * 21BFC
            MEMSKIP                              * 21C01
            1GETLAM                              * 21C06
            SWAP                                 * 21C0B
            RclBkp(nm,adr)?                      * 21C10
            NOTcase                              * 21C15
            SETNONEXTERR                         * 21C1A
            SWAP#1+                              * 21C1F
            unrot                                * 21C24
          ;                                      * 21C29
          psh1&                                  * 21C2E
          #0=UNTIL                               * 21C33
          DROP                                   * 21C38
          ABND                                   * 21C3D
        ;                                        * 21C42

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
        ::                                       * 21C6F
          CONTEXT@                               * 21C74
          DUP                                    * 21C79
          SYSRRP?                                * 21C7E
          casedrop                               * 21C83

HomeAttach(s):
          ::                                     * 21C88
            DUP                                  * 21C8D
            ONSRRP?                              * 21C92
            ITE                                  * 21C97
            DROP                                 * 21C9C
            TOSRRP                               * 21CA1
          ;                                      * 21CA6
          SWAP                                   * 21CAB
          SETROMPART                             * 21CB0
        ;                                        * 21CB5

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
        ::                                       * 21CE5
          CONTEXT@                               * 21CEA
          DUP                                    * 21CEF
          SYSRRP?                                * 21CF4
          casedrop                               * 21CF9
          OFFSRRP                                * 21CFE
          DUP                                    * 21D03
          ROMPART                                * 21D08
          NOTcase2DROP                           * 21D0D
          ROT                                    * 21D12
          #<>                                    * 21D17
          caseDROP                               * 21D1C
          DetachLib(di)                          * 21D21
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
        ::                                       * 21D54
          CONTEXT@                               * 21D59

* refs (2): 3F3ED 3F41A
GetLibs(di):
          ::                                     * 21D5E
            COLA                                 * 21D63
            ROMPTR  0F0 087                      * 21D68
          ;                                      * 21D73
          BINT0                                  * 21D78
          #=casedrop                             * 21D7D
          NULL{}                                 * 21D82
          ROMPTR  0F0 090                        * 21D87
          {}N                                    * 21D92
        ;                                        * 21D97
        FILLTO  #21DBE                           * 21D9C  34 zero nibbles: the next entry stays at #21DBE

* refs (2): 1B194 1B19E
OBJ_21DBE:
        ::                                       * 21DBE
          '                                      * 21DC3
          rpnXROOT                               * 21DC8
          BINT2                                  * 21DCD
          TRUE                                   * 21DD2
          ROMPTR  0E8 00F                        * 21DD7
        ;                                        * 21DE2

        #       80000                            * 21DE7  524288

* refs (3): 20B05 20BEA 854A1
dup;ListOfNames?:dq/sk:
        ::                                       * 21DF1
          DUPTYPELIST?                           * 21DF6
          NOTcase                                * 21DFB
          SKIP                                   * 21E00
          DUPNULLCOMP?                           * 21E05
          case                                   * 21E0A
          SKIP                                   * 21E0F
          BINT5                                  * 21E14
          NEXTCOMPOB                             * 21E19
          DROP                                   * 21E1E
          BEGIN                                  * 21E23
          DUPTYPEIDNT?                           * 21E28
          SWAP                                   * 21E2D
          TYPELAM?                               * 21E32
          OR                                     * 21E37
          NOTcase                                * 21E3C
          ::                                     * 21E41
            DROPRDROP                            * 21E46
            COLASKIP                             * 21E4B
          ;                                      * 21E50
          NEXTCOMPOB                             * 21E55
          NOT                                    * 21E5A
          UNTIL                                  * 21E5F
          COLACOLA                               * 21E64
        ;                                        * 21E69

* $ -> 1 -> $rest 0
* ROMPTR 002 167 XMIT
* refs (1): 189EA
        CON(1)  8                                * 21E6E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21E6F  library
        CON(3)  #167                             * 21E72  command
xXMIT:
        ::                                       * 21E75
          CK1&Dispatch                           * 21E7A
          BINT3                                  * 21E7F
          DOXMIT                                 * 21E84
        ;                                        * 21E89

* n -> $ 0/1
* ROMPTR 002 168 SRECV
* refs (1): 189EA
        CON(1)  8                                * 21E8E  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21E8F  library
        CON(3)  #168                             * 21E92  command
xSRECV:
        ::                                       * 21E95
          CK1&Dispatch                           * 21E9A
          BINT1                                  * 21E9F
          DOSRECV                                * 21EA4
        ;                                        * 21EA9

* ->
* ROMPTR 002 169 OPENIO
* refs (1): 189EA
        CON(1)  8                                * 21EAE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21EAF  library
        CON(3)  #169                             * 21EB2  command
xOPENIO:
        ::                                       * 21EB5
          CK0                                    * 21EBA
          DOOPENIO                               * 21EBF
          OpenIO_324C8                           * 21EC4
        ;                                        * 21EC9

* ->
* ROMPTR 002 16A CLOSEIO
* refs (1): 189EA
        CON(1)  8                                * 21ECE  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21ECF  library
        CON(3)  #16A                             * 21ED2  command
xCLOSEIO:
        ::                                       * 21ED5
          CK0                                    * 21EDA
          CLOSEUART                              * 21EDF
        ;                                        * 21EE4

* name -> {names} -> {{old new}...} ->
* ROMPTR 002 16B SEND
* refs (1): 189EA
        CON(1)  8                                * 21EE9  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21EEA  library
        CON(3)  #16B                             * 21EED  command
xSEND:
        ::                                       * 21EF0
          CK1&Dispatch                           * 21EF5
          BINT6                                  * 21EFA
          SENDNAME                               * 21EFF
          BINT7                                  * 21F04
          SENDNAME                               * 21F09
          BINT5                                  * 21F0E
          SENDLIST                               * 21F13
        ;                                        * 21F18

* name -> "name" -> {names} -> {{old new}...} ->
* ROMPTR 002 16C KGET
* refs (1): 189EA
        CON(1)  8                                * 21F1D  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21F1E  library
        CON(3)  #16C                             * 21F21  command
xKGET:
        ::                                       * 21F24
          CK1&Dispatch                           * 21F29
          BINT6                                  * 21F2E
          GETNAME                                * 21F33
          BINT7                                  * 21F38
          GETNAME                                * 21F3D
          BINT3                                  * 21F42
          GETNAME                                * 21F47
          BINT5                                  * 21F4C
          kget(li)                               * 21F51
        ;                                        * 21F56

* name -> $name ->
* ROMPTR 002 16D RECN
* refs (1): 189EA
        CON(1)  8                                * 21F5B  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21F5C  library
        CON(3)  #16D                             * 21F5F  command
xRECN:
        ::                                       * 21F62
          CK1&Dispatch                           * 21F67
          BINT6                                  * 21F6C
          DORECN                                 * 21F71
          BINT7                                  * 21F76
          DORECN                                 * 21F7B
          BINT3                                  * 21F80
          DORECN                                 * 21F85
        ;                                        * 21F8A

* ->
* ROMPTR 002 16E RECV
* refs (1): 189EA
        CON(1)  8                                * 21F8F  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21F90  library
        CON(3)  #16E                             * 21F93  command
xRECV:
        ::                                       * 21F96
          CK0                                    * 21F9B
          NULL$TEMP                              * 21FA0
          DORECN                                 * 21FA5
        ;                                        * 21FAA

* ->
* ROMPTR 002 16F FINISH
* refs (1): 189EA
        CON(1)  8                                * 21FAF  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21FB0  library
        CON(3)  #16F                             * 21FB3  command
xFINISH:
        ::                                       * 21FB6
          CK0                                    * 21FBB
          DOFINISH                               * 21FC0
        ;                                        * 21FC5

* ->
* ROMPTR 002 170 SERVER
* refs (2): 189EA 3DEEF
        CON(1)  8                                * 21FCA  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21FCB  library
        CON(3)  #170                             * 21FCE  command
xSERVER:
        ::                                       * 21FD1
          CK0                                    * 21FD6
          DOSERVER                               * 21FDB
        ;                                        * 21FE0

* n_type ->
* ROMPTR 002 171 CKSM
* refs (1): 189EA
        CON(1)  8                                * 21FE5  command header: flags (meaning not yet known)
        CON(3)  #002                             * 21FE6  library
        CON(3)  #171                             * 21FE9  command
xCKSM:
        ::                                       * 21FEC
          CK1&Dispatch                           * 21FF1
          BINT1                                  * 21FF6
          DOCKSM                                 * 21FFB
        ;                                        * 22000
