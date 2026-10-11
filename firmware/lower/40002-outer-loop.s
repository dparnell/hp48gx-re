* HP 48GX ROM revision R, #40002-#42022: Parameterized outer loop and menus
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: TakeOver MenuMaker AtUserStack InitMenu DoMenuKey %100 REPEATER MenuKey DoKeyOb Modifier MenuRow@ NoEdit?case
* Follows on from the previous file (at #40002 in the original ROM).
        RPL

* refs (1): 41012
OBJ_40002:
        ::                                       * 40002
          OVER'                                  * 40007
          ROMPTR  0A9 000                        * 4000C
          EQUAL                                  * 40017
          IT                                     * 4001C
          ::                                     * 40021
            2DROP                                * 40026
            LastMenuDef@                         * 4002B
            LastMenuRow@                         * 40030
          ;                                      * 40035
          OBJ_419D4                              * 4003A
        ;                                        * 4003F

* refs (1): 401CA
OBJ_40044:
        ::                                       * 40044
          DUPTYPEBINT?                           * 40049
          NOTcase                                * 4004E
          DoKeyOb                                * 40053
          TogSysFlag                             * 40058
          SetDA2bNoCh                            * 4005D
          ChkDelLastArg                          * 40062
        ;                                        * 40067

* refs (1): 40215
OBJ_4006C:
        ::                                       * 4006C
          DUPTYPEBINT?                           * 40071
          NOTcase                                * 40076
          DropBadKey                             * 4007B
          UNCOERCE                               * 40080
          %CHS                                   * 40085
          OBJ_4015C                              * 4008A
          xSF                                    * 4008F
        ;                                        * 40094

* refs (1): 40260
OBJ_40099:
        ::                                       * 40099
          DUPTYPEBINT?                           * 4009E

RightShift3:
          NOTcase                                * 400A3
          DropBadKey                             * 400A8
          UNCOERCE                               * 400AD
          %CHS                                   * 400B2
          OBJ_4015C                              * 400B7
          xCF                                    * 400BC
        ;                                        * 400C1

* refs (1): 401C0
OBJ_400C6:
        ::                                       * 400C6
          OBJ_4013E                              * 400CB
          NOTcasedrop                            * 400D0
          DoKeyOb                                * 400D5
          PrgmEntry?                             * 400DA
          case                                   * 400DF
          DoKeyOb                                * 400E4
          OBJ_4015C                              * 400E9
          xEVAL                                  * 400EE
        ;                                        * 400F3

* refs (1): 4020B
OBJ_400F8:
        ::                                       * 400F8
          OBJ_4013E                              * 400FD
          NOTcasedrop                            * 40102
          DoBadKey                               * 40107
          OBJ_4015C                              * 4010C
          xSTO                                   * 40111
        ;                                        * 40116

* refs (1): 40256
OBJ_4011B:
        ::                                       * 4011B
          OBJ_4013E                              * 40120
          NOTcasedrop                            * 40125
          DoBadKey                               * 4012A
          OBJ_4015C                              * 4012F
          xRCL                                   * 40134
        ;                                        * 40139

* refs (3): 400CB 400FD 40120
OBJ_4013E:
        ::                                       * 4013E
          DUP                                    * 40143
          TAG>                                   * 40148
          SWAPDROP                               * 4014D
          OBJ_3F0CA                              * 40152
        ;                                        * 40157

* refs (8): 4008A 400B7 400E9 4010C 4012F 40300 ...
OBJ_4015C:
        ::                                       * 4015C
          'R                                     * 40161
          2Ob>Seco                               * 40166
          PrgmEntry?                             * 4016B
          NOTcase                                * 40170
          OBJ_408F0                              * 40175
          PutInComLine!!(_)                      * 4017A
        ;                                        * 4017F

* refs (70): 3EFFA C5542 C558C C55D8 C5620 C5668 ...
OBJ_40184:
        ::                                       * 40184
          NoExitAction                           * 40189
          InitMenu                               * 4018E
          SetDA12NoCh                            * 40193
        ;                                        * 40198

* ob-NS -> ? {ob-NS ob-LS ob-RS} -> ?
* refs (10): 154E1 3EF2D 41058 4A226 9E4E1 9E539 ...
StdMenuKeyNS:
        ::                                       * 4019D
          CK&DISPATCH0                           * 401A2
          BINT5                                  * 401A7
          OBJ_40292                              * 401AC
          BINT14                                 * 401B1
          OBJ_402EC                              * 401B6
          BINT13                                 * 401BB
          OBJ_400C6                              * 401C0
          BINT0                                  * 401C5
          OBJ_40044                              * 401CA
        ;                                        * 401CF

* {ob-NS ob-LS ob-RS} -> ?
* refs (5): 155C7 3EF50 41067 4A23A 98FDC
StdMenuKeyLS:
        ::                                       * 401D4
          CK&DISPATCH0                           * 401D9
          BINT5                                  * 401DE
          OBJ_402A6                              * 401E3
          BINT6                                  * 401E8
          OBJ_403DC                              * 401ED
          BINT7                                  * 401F2
          OBJ_403DC                              * 401F7
          BINT14                                 * 401FC
          OBJ_4030F                              * 40201
          BINT13                                 * 40206
          OBJ_400F8                              * 4020B
          BINT0                                  * 40210
          OBJ_4006C                              * 40215
        ;                                        * 4021A

* refs (4): 155A4 3EF73 41076 4A24E
StdRightShift:
        ::                                       * 4021F
          CK&DISPATCH0                           * 40224
          BINT5                                  * 40229
          OBJ_402BA                              * 4022E
          BINT6                                  * 40233
          DoNameKeyRS                            * 40238
          BINT7                                  * 4023D
          DoNameKeyRS                            * 40242
          BINT14                                 * 40247
          OBJ_40323                              * 4024C
          BINT13                                 * 40251
          OBJ_4011B                              * 40256
          BINT0                                  * 4025B
          OBJ_40099                              * 40260
        ;                                        * 40265
        FILLTO  #40292                           * 4026A  40 zero nibbles: the next entry stays at #40292

* refs (1): 401AC
OBJ_40292:
        ::                                       * 40292
          BINT1                                  * 40297
          OBJ_402CE                              * 4029C
        ;                                        * 402A1

* refs (1): 401E3
OBJ_402A6:
        ::                                       * 402A6
          BINT2                                  * 402AB
          OBJ_402CE                              * 402B0
        ;                                        * 402B5

* refs (1): 4022E
OBJ_402BA:
        ::                                       * 402BA
          BINT3                                  * 402BF
          OBJ_402CE                              * 402C4
        ;                                        * 402C9

* refs (3): 4029C 402B0 402C4
OBJ_402CE:
        ::                                       * 402CE
          NTHELCOMP                              * 402D3
          ITE                                    * 402D8
          DoKeyOb                                * 402DD
          DoBadKey                               * 402E2
        ;                                        * 402E7

* refs (1): 401B6
OBJ_402EC:
        ::                                       * 402EC
          ImmedEntry?                            * 402F1
          NOTcase                                * 402F6
          DoKeyOb                                * 402FB
          OBJ_4015C                              * 40300
          x*                                     * 40305
        ;                                        * 4030A

* refs (1): 40201
OBJ_4030F:
        ::                                       * 4030F
          OBJ_4015C                              * 40314
          xCONVERT                               * 40319
        ;                                        * 4031E

* refs (1): 4024C
OBJ_40323:
        ::                                       * 40323
          OBJ_4015C                              * 40328
          x/                                     * 4032D
        ;                                        * 40332

* refs (4): 155A9 40238 40242 9E7C9
DoNameKeyRS:
        ::                                       * 40337
          OBJ_4040E                              * 4033C
          xRCL                                   * 40341
        ;                                        * 40346
        NIBHEX  00000                            * 4034B  ..

* refs (3): 154F0 155D6 9E55D
DoNameKeyLRS:
        ::                                       * 40350
          PrgmEntry?                             * 40355
          case                                   * 4035A
          2DropBadKey                            * 4035F
          '                                      * 40364
          '                                      * 40369
          3UNROLL                                * 4036E
          BINT3                                  * 40373
          ::N                                    * 40378
          DoKeyOb                                * 4037D
        ;                                        * 40382
        FILLTO  #403DC                           * 40387  85 zero nibbles: the next entry stays at #403DC

* refs (2): 401ED 401F7
OBJ_403DC:
        ::                                       * 403DC
          PrgmEntry?                             * 403E1
          NOTcase                                * 403E6
          ::                                     * 403EB
            OBJ_4040E                            * 403F0
            ROMP_0A1_00D                         * 403F5
          ;                                      * 403FA
          OBJ_4040E                              * 403FF
          xSTO                                   * 40404
        ;                                        * 40409

* refs (3): 4033C 403F0 403FF
OBJ_4040E:
        ::                                       * 4040E
          '                                      * 40413
          x'                                     * 40418
          SWAP                                   * 4041D
          '                                      * 40422
          xENDTIC                                * 40427
          'R                                     * 4042C
          BINT4                                  * 40431
          ::N                                    * 40436
          PrgmEntry?                             * 4043B
          NOTcase                                * 40440
          OBJ_408F0                              * 40445
          PutInComLine!!(_)                      * 4044A
        ;                                        * 4044F

* ob ->
* refs (18): 385CF 38B27 3AE67 3B5B9 3D551 3EDDE ...
DoKeyOb:
        ::                                       * 40454
          DUP                                    * 40459
          OBJ_729F8                              * 4045E
          case                                   * 40463
          OBJ_4053F                              * 40468
          CK&DISPATCH0                           * 4046D
          BINT111                                * 40472
          EchoChrKey                             * 40477
          BINT3                                  * 4047C
          OBJ_404BD                              * 40481
          BINT14                                 * 40486
          OBJ_404D1                              * 4048B
          BINT8                                  * 40490
          OBJ_404F9                              * 40495
          BINT15                                 * 4049A
          OBJ_40521                              * 4049F
          BINT9                                  * 404A4
          OBJ_405AD                              * 404A9
          BINT0                                  * 404AE
          OBJ_405E4                              * 404B3
        ;                                        * 404B8

* refs (1): 40481
OBJ_404BD:
        ::                                       * 404BD
          Echo$Key                               * 404C2
          SetDA1NoCh                             * 404C7
        ;                                        * 404CC

* refs (1): 4048B
OBJ_404D1:
        ::                                       * 404D1
          ImmedEntry?                            * 404D6
          case                                   * 404DB
          OBJ_408F0                              * 404E0
          ->StrUnit(uo)                          * 404E5
          OBJ_42CE2                              * 404EA
          SetDA1NoCh                             * 404EF
        ;                                        * 404F4

* refs (1): 40495
OBJ_404F9:
        ::                                       * 404F9
          SystemLevel?                           * 404FE
          case                                   * 40503
          EVAL                                   * 40508
          PrgmEntry?                             * 4050D
          caseDrpBadKy                           * 40512
          OBJ_408F0                              * 40517
        ;                                        * 4051C

* refs (1): 4049F
OBJ_40521:
        ::                                       * 40521
          ROMPTR@                                * 40526
          ?SKIP                                  * 4052B
          SETROMPERR                             * 40530
          DoKeyOb                                * 40535
        ;                                        * 4053A

* refs (1): 40468
OBJ_4053F:
        ::                                       * 4053F
          DUP                                    * 40544
          OBJ_2699F                              * 40549
          case                                   * 4054E
          PutInComLine!!(_)                      * 40553
          AlgEntry?                              * 40558
          case                                   * 4055D
          OBJ_40571                              * 40562
          OBJ_4058F                              * 40567
        ;                                        * 4056C

* refs (1): 40562
OBJ_40571:
        ::                                       * 40571
          ?OKINALG                               * 40576
          case                                   * 4057B
          OBJ_40639                              * 40580
          OBJ_4058F                              * 40585
        ;                                        * 4058A

* refs (2): 40567 40585
OBJ_4058F:
        ::                                       * 4058F
          PrgmEntry?                             * 40594
          case                                   * 40599
          PutInComLine!!(_)                      * 4059E
          OBJ_408F0                              * 405A3
        ;                                        * 405A8

* refs (1): 404A9
OBJ_405AD:
        ::                                       * 405AD
          AlgEntry?                              * 405B2
          NOTcase                                * 405B7
          OBJ_405E4                              * 405BC
          OBJ_408C3                              * 405C1
          BINT2                                  * 405C6
          OVERLEN$                               * 405CB
          #1-SUB$                                * 405D0
          OBJ_42CE2                              * 405D5
          SetDA1NoCh                             * 405DA
        ;                                        * 405DF

* refs (2): 404B3 405BC
OBJ_405E4:
        ::                                       * 405E4
          ?OKINALG                               * 405E9
          AlgEntry?                              * 405EE
          ANDcase                                * 405F3
          OBJ_40639                              * 405F8
          PrgmEntry?                             * 405FD
          NOTcase                                * 40602
          OBJ_408F0                              * 40607
          PutInComLine!!(_)                      * 4060C
        ;                                        * 40611

* refs (5): 4017A 4044A 40553 4059E 4060C
PutInComLine!!(_):
        ::                                       * 40616
          ?ClrAlg                                * 4061B
          OBJ_4072E                              * 40620
          OBJ_408C3                              * 40625
          Echo$Key                               * 4062A
          OBJ_4072E                              * 4062F
        ;                                        * 40634

* refs (2): 40580 405F8
OBJ_40639:
        ::                                       * 40639
          SetDA1NoCh                             * 4063E
          OBJ_26BED                              * 40643
          NOTcase                                * 40648
          ::                                     * 4064D
            OBJ_408C3                            * 40652
            OBJ_42CE2                            * 40657
          ;                                      * 4065C
          DROP                                   * 40661
          OBJ_26E61                              * 40666
          5UNROLL                                * 4066B
          3DROP                                  * 40670
          ->StrOp(_)                             * 40675
          OVER                                   * 4067A
          IT                                     * 4067F

_()_;+(2st):
          ::                                     * 40684
            $_LRParens                           * 40689
            &$                                   * 4068E
          ;                                      * 40693
          ::                                     * 40698
            OnTheFirstCol?                       * 4069D
            ?SEMI                                * 406A2
            PrevChrInComLine                     * 406A7
            CHR>$                                * 406AC
            2DUPSWAP                             * 406B1
            OBJ_3516C                            * 406B6
            4UNROLL3DROP                         * 406BB
            NOT?SEMI                             * 406C0
            CHR_Space                            * 406C5
            >H$                                  * 406CA
          ;                                      * 406CF
          ::                                     * 406D4
            OVER                                 * 406D9
            ?SEMI                                * 406DE
            DUPDUP                               * 406E3
            $_XYZ                                * 406E8
            OBJ_3516C                            * 406ED
            4UNROLL3DROP                         * 406F2
            NOT?SEMI                             * 406F7
            CHR_Space                            * 406FC
            >T$                                  * 40701
          ;                                      * 40706
          OBJ_42CE2                              * 4070B
          NextChrInComLine=space?                * 40710
          IT                                     * 40715
          OBJ_429CB                              * 4071A
          NOT?SEMI                               * 4071F
          LCursor                                * 40724
        ;                                        * 40729

* refs (4): 40620 4062F 43ECC 43ED6
OBJ_4072E:
        ::                                       * 4072E
          INSERT?                                * 40733
          NOT?SEMI                               * 40738
          OnTheFirstCol?                         * 4073D
          ?SEMI                                  * 40742
          PrevChrInComLine                       * 40747
          CHR_Space                              * 4074C
          EQUAL                                  * 40751
          ?SEMI                                  * 40756
          NextChrInComLine=space?                * 4075B
          case                                   * 40760
          ->OnTheRow                             * 40765
          CHR_Space                              * 4076A
          Char>Edit                              * 4076F
        ;                                        * 40774
        BSS     15                               * 40779

* ->
* refs (407): 0C82F 144B1 3AB76 3B5FF 3B7CC 3B7F6 ...
TakeOver:
        ::                                       * 40788
        ;                                        * 4078D

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
        ::                                       * 407FB
          TakeOver                               * 40800
          'R                                     * 40805
        ;                                        * 4080A

* refs (8): 1A06B 4A25D 6BF2E D6F93 D70E7 D71C9 ...
OBJ_4080F:
        ::                                       * 4080F
          '                                      * 40814
          MenuMaker                              * 40819
          CkSecoType                             * 4081E
        ;                                        * 40823

* ->
* refs (19): 3B257 3B270 3B289 3B2A2 3B2BB 3B2D4 ...
MenuKey:
        ::                                       * 40828
          TakeOver                               * 4082D
          'R                                     * 40832
          GETPROC                                * 40837
        ;                                        * 4083C

* refs (1): 6BE48
OBJ_40841:
        ::                                       * 40841
          '                                      * 40846
          MenuKey                                * 4084B
          CkSecoType                             * 40850
        ;                                        * 40855

* ->
* refs (16): 3A9D3 3AA0F 3AC20 3AF9D 3AFEB 3B020 ...
Modifier:
        ::                                       * 4085A
          TakeOver                               * 4085F
        ;                                        * 40864

* refs (1): 6BF4C
OBJ_40869:
        ::                                       * 40869
          '                                      * 4086E
          Modifier                               * 40873
          CkSecoType                             * 40878
        ;                                        * 4087D

* refs (4): 4081E 40850 40878 6BF1F
CkSecoType:
        ::                                       * 40882
          OVER                                   * 40887
          TYPECOL?                               * 4088C
          NOTcsdrpfls                            * 40891
          OVER                                   * 40896
          CARCOMP                                * 4089B
          EQ                                     * 408A0
        ;                                        * 408A5

* -> flag
* refs (9): 154D7 155BD 402F1 404D6 9E4D7 9E52F ...
ImmedEntry?:
        ::                                       * 408AA
          PrgmEntry?                             * 408AF
          AlgEntry?                              * 408B4
          ORNOT                                  * 408B9
        ;                                        * 408BE

* refs (5): 3EF00 405C1 40625 40652 43E5E
OBJ_408C3:
        ::                                       * 408C3
          CK&DISPATCH0                           * 408C8
          BINT6                                  * 408CD
          DECOMP$                                * 408D2
          BINT7                                  * 408D7
          DECOMP$                                * 408DC
          BINT0                                  * 408E1
          EDITDECOMP$                            * 408E6
        ;                                        * 408EB

* refs (7): 40175 40445 404E0 40517 405A3 40607 ...
OBJ_408F0:
        ::                                       * 408F0
          KeyOb!                                 * 408F5
          CacheStack                             * 408FA
          EditLExists?                           * 408FF
          case                                   * 40904
          OBJ_4091D                              * 40909
          InitEdModes                            * 4090E
          OBJ_409B2                              * 40913
        ;                                        * 40918

* refs (1): 40909
OBJ_4091D:
        ::                                       * 4091D
          cursorblink-                           * 40922
          OBJ_40A4C                              * 40927
          NOTcase                                * 4092C
          OBJ_4098A                              * 40931
          '                                      * 40936

àENTER:
          ID      αENTER                         * 4093B
          DRPExitAtLOOP                          * 4094E
          NOTcase                                * 40953
          OBJ_4098A                              * 40958
          EDITLINE$                              * 4095D
          DUP                                    * 40962
          SaveLastEdit                           * 40967
          InitEd&Modes                           * 4096C
          SWAP                                   * 40971
          OBJ_23439                              * 40976
          AtUserStack                            * 4097B
          OBJ_409B2                              * 40980
        ;                                        * 40985

* refs (2): 40931 40958
OBJ_4098A:
        ::                                       * 4098A
          OBJ_40ABB                              * 4098F
          NOTcase                                * 40994
          KeyOb0                                 * 40999
          OBJ_23439                              * 4099E
          AtUserStack                            * 409A3
          OBJ_409B2                              * 409A8
        ;                                        * 409AD

* refs (3): 40913 40980 409A8
OBJ_409B2:
        ::                                       * 409B2
          KeyOb@                                 * 409B7
          EVAL                                   * 409BC
          AtUserStack                            * 409C1
          KeyOb@                                 * 409C6
          KeyOb0                                 * 409CB
          OBJ_40A4C                              * 409D0
          NOTcaseDROP                            * 409D5
          '                                      * 409DA

áENTER:
          ID      ßENTER                         * 409DF
          DRPExitAtLOOP                          * 409F2
          NOTcaseDROP                            * 409F7
          SWAP                                   * 409FC
          PALPTRDCMP                             * 40A01
          ?SKIP                                  * 40A06
          ::                                     * 40A0B
            CK&DISPATCH0                         * 40A10
            BINT7                                * 40A15
            ID>$                                 * 40A1A
            BINT6                                * 40A1F
            ID>$                                 * 40A24
            BINT0                                * 40A29
            DROPNULL$                            * 40A2E
          ;                                      * 40A33
          SWAP                                   * 40A38
          EVAL                                   * 40A3D
          AtUserStack                            * 40A42
        ;                                        * 40A47

* refs (2): 40927 409D0
OBJ_40A4C:
        ::                                       * 40A4C
          BINT63                                 * 40A51
          TestSysFlag                            * 40A56
          BINT62                                 * 40A5B
          TestSysFlag                            * 40A60
          AND                                    * 40A65
        ;                                        * 40A6A

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
        ::                                       * 40ABB
          Parse.1                                * 40AC0
          caseTRUE                               * 40AC5
          ParseFail                              * 40ACA
          FALSE                                  * 40ACF
        ;                                        * 40AD4

* refs (3): 40AC0 431AB D68D8
Parse.1:
        ::                                       * 40AD9
          EDITLINE$                              * 40ADE
          DUP                                    * 40AE3
          InitEdLine                             * 40AE8
          ERRSET                                 * 40AED
          palparse                               * 40AF2
          ERRTRAP                                * 40AF7
          ::                                     * 40AFC
            SaveLastEdit                         * 40B01
            ERRJMP                               * 40B06
          ;                                      * 40B0B
          NOTcaseFALSE                           * 40B10
          SWAP                                   * 40B15
          SaveLastEdit                           * 40B1A
          InitEdModes                            * 40B1F
          TRUE                                   * 40B24
        ;                                        * 40B29

* ob $parsed #pos $' ->
* refs (2): 40ACA 431BF
ParseFail:
        ::                                       * 40B2E
          DispBadToken                           * 40B33
          #SyntaxErr                             * 40B38
          JstGetTHEMESG                          * 40B3D
          DoWarning                              * 40B42
          SetDA2aNoCh                            * 40B47
          SetDA3NoCh                             * 40B4C
        ;                                        * 40B51

* ob $parsed #pos $' ->
* refs (2): 40B33 D69C4
DispBadToken:
        ::                                       * 40B56
          SWAPROT                                * 40B5B
          EditString                             * 40B60
          SetCursPos(s)                          * 40B65
          TOADISP                                * 40B6A
          OBJ_3A030                              * 40B6F
          LEN$                                   * 40B74
          OBJ_4426D                              * 40B79
          #MIN                                   * 40B7E
          ROWNUM                                 * 40B83
          SWAP                                   * 40B88
          CURSOR_OFF                             * 40B8D
          OVER                                   * 40B92
          #-SWAP                                 * 40B97
          OBJ_139E7                              * 40B9C
          DROP                                   * 40BA1
          SetDA2bTemp                            * 40BA6
          SetDA2bEdit                            * 40BAB
        ;                                        * 40BB0

* refs (1): 3B587
EnterComLine:
        ::                                       * 40BB5
          'NOP                                   * 40BBA
          OBJ_408F0                              * 40BBF
        ;                                        * 40BC4

* ->
* refs (48): 15039 1505C 15882 2230C 2232A 22348 ...
AtUserStack:
        ::                                       * 40BC9
          OBJ_46378                              * 40BCE
          InitEnab                               * 40BD3
        ;                                        * 40BD8

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
        ::                                       * 40C76
          HISTON?                                * 40C7B
          case                                   * 40C80
          CMDSTO                                 * 40C85
          DROP                                   * 40C8A
        ;                                        * 40C8F

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
        ::                                       * 40CE9
          UNDO_ON?                               * 40CEE
          NOT?SEMI                               * 40CF3
          SuspendOK?                             * 40CF8
          NOT?SEMI                               * 40CFD
          OBJ_14E6D                              * 40D02
          IT                                     * 40D07
          ABND                                   * 40D0C
          SAVESTACK                              * 40D11
          ERRSET                                 * 40D16
          ERRSET                                 * 40D1B
        ;                                        * 40D20

* ->
* refs (4): 3AA28 3AFC0 43007 D7403
LockAlpha:
        ::                                       * 40D25
          SetLock                                * 40D2A
          àShiftOnly                             * 40D2F
        ;                                        * 40D34

* ->
* refs (6): 3AFBB 4300C 443BC CDC93 CF5F3 D0807
UnLockAlpha:
        ::                                       * 40D39
          ClrLock                                * 40D3E
          SetKeysNS                              * 40D43
        ;                                        * 40D48

* refs (1): 3D95B
InvUserMo:
        ::                                       * 40D4D
          BINT62                                 * 40D52
          TogSysFlag                             * 40D57
        ;                                        * 40D5C

* refs (1): 3D96A
SetUserMo:
        ::                                       * 40D61
          BINT62                                 * 40D66
          SetSysFlag                             * 40D6B
          OBJ_3FFB9                              * 40D70
        ;                                        * 40D75

* refs (1): 3FCA0
QuitUserMo:
        ::                                       * 40D7A
          BINT62                                 * 40D7F
          ClrSysFlag                             * 40D84
          OBJ_3FFCA                              * 40D89
        ;                                        * 40D8E

* -> :: <ob1> <rest> ; -> :: <rest> ;
* refs (12): 3B369 3B437 3B496 3B4EB 3B57D 3B596 ...
NoEdit?case:
        ::                                       * 40D93
          TakeOver                               * 40D98
          'R                                     * 40D9D
          EditLExists?                           * 40DA2
          caseDROP                               * 40DA7
          RDROP                                  * 40DAC
          InitEdModes                            * 40DB1
          DoKeyOb                                * 40DB6
        ;                                        * 40DBB

* menu ->
* refs (23): 3AE02 3AE21 3B2FD 3B31C 3B33B 3B35A ...
DoMenuKey:
        ::                                       * 40DC0
          InitMenu                               * 40DC5
          SetDA12NoCh                            * 40DCA
        ;                                        * 40DCF

* ->
* refs (2): 3E02B 3E084
DoDelim:
        ::                                       * 40DD4
          TakeOver                               * 40DD9
          ?SetEditRoll                           * 40DDE
          SetDA3NoCh                             * 40DE3
          'R                                     * 40DE8
          OBJ_42B02                              * 40DED
        ;                                        * 40DF2

* ->
* refs (8): 3AA3C 3B3D7 3BB3C 3D9EF 3DA7E 3DB6F ...
DoDelims:
        ::                                       * 40DF7
          TakeOver                               * 40DFC
          ?SetEditRoll                           * 40E01
          SetDA3NoCh                             * 40E06
          'R                                     * 40E0B
          AddInComLine(st)                       * 40E10
          LCursor                                * 40E15
        ;                                        * 40E1A

* refs (2): 3B3E1 3E08E
OBJ_40E1F:
        ::                                       * 40E1F
          AlgEntry?                              * 40E24
          case                                   * 40E29
          SetDA1NoCh                             * 40E2E
          SetAlgEntry                            * 40E33
        ;                                        * 40E38

* ->
* refs (4): 3DA88 3E035 3E0E7 4061B
?ClrAlg:
        ::                                       * 40E3D
          AlgEntry?                              * 40E42
          case                                   * 40E47
          ClrAlgEntry                            * 40E4C
          SetDA1NoCh                             * 40E51
        ;                                        * 40E56

* ->
* refs (5): 3AA46 3BB46 3DB79 3E144 3EECE
?ClrAlgSetPr:
        ::                                       * 40E5B
          AlgEntry?                              * 40E60
          NOT                                    * 40E65
          PrgmEntry?                             * 40E6A
          ANDcase                                * 40E6F
          SetDA1NoCh                             * 40E74
          ClrAlgEntry                            * 40E79
          SetPrgmEntry                           * 40E7E
        ;                                        * 40E83

* ->
* refs (20): 3B38C 3B469 3B4B9 3B50E 3B6AE 3B703 ...
REPEATER:
        ::                                       * 40E88
          'R'R                                   * 40E8D
          DUP                                    * 40E92
          EVAL                                   * 40E97
          OVER                                   * 40E9C
          REPKEY?                                * 40EA1
          NOTcase2DROP                           * 40EA6
          VERYSLOW                               * 40EAB
          BEGIN                                  * 40EB0
          2DUPSWAP                               * 40EB5
          REPKEY?                                * 40EBA
          WHILE                                  * 40EBF

eval;wait!:
          ::                                     * 40EC4
            EVAL                                 * 40EC9
            SLOW                                 * 40ECE
          ;                                      * 40ED3
          REPEAT                                 * 40ED8
          3DROP                                  * 40EDD
        ;                                        * 40EE2

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
        ::                                       * 40F22
          2DUP                                   * 40F27
          EQUALcase                              * 40F2C
          SETCIRCERR                             * 40F31
          dup;RclInVars(gn)?                     * 40F36
          NOTcase                                * 40F3B
          xSTO                                   * 40F40
          OVER                                   * 40F45
          2SWAP                                  * 40F4A
          OBJ_2157E                              * 40F4F
          xDROP2                                 * 40F54
        ;                                        * 40F59

* refs (1): 3D90D
OBJ_40F5E:
        ::                                       * 40F5E
          dup;RclInVars(gn)?                     * 40F63
          NOTcase                                * 40F68
          xDROP                                  * 40F6D
          SWAPDUP                                * 40F72
          OBJ_2181B                              * 40F77
          xDROP2                                 * 40F7C
        ;                                        * 40F81

* menu ->
* refs (29): 0C915 0C9D6 15357 21180 211D0 3BE6D ...
InitMenu:
        ::                                       * 40F86
          BINT1                                  * 40F8B
          DoMenuPos(li,s)                        * 40F90
        ;                                        * 40F95

* refs (5): 40F90 4170A C58EE C6983 C73DE
DoMenuPos(li,s):
        ::                                       * 40F9A
          MenuDef@                               * 40F9F
          MenuRow@                               * 40FA4
          LastMenuDef@                           * 40FA9
          LastMenuRow@                           * 40FAE
          4NULLLAM{}                             * 40FB3
          BIND                                   * 40FB8
          ERRSET                                 * 40FBD
          StartMenu                              * 40FC2
          ERRTRAP                                * 40FC7
          ::                                     * 40FCC
            4GETLAM                              * 40FD1
            3GETLAM                              * 40FD6
            StartMenu                            * 40FDB
            2GETLAM                              * 40FE0
            LastMenuDef!                         * 40FE5
            1GETABND                             * 40FEA
            LastMenuRow!                         * 40FEF
            ERRJMP                               * 40FF4
          ;                                      * 40FF9
          ABND                                   * 40FFE
        ;                                        * 41003

* menu #n ->
* refs (9): 387EB 38A96 38BB8 40FC2 40FDB 4138C ...
StartMenu:
        ::                                       * 41008
          OBJ_41826                              * 4100D
          OBJ_40002                              * 41012
          MenuRow!                               * 41017
          DUP                                    * 4101C
          OBJ_41894                              * 41021
          OBJ_417E2                              * 41026
          OBJ_417AF                              * 4102B
          NoClock                                * 41030
          '                                      * 41035
          SetDA12NoCh                            * 4103A
          MenuRowAct!                            * 4103F
          '                                      * 41044
          >MENU                                  * 41049
          LabelDef!                              * 4104E
          '                                      * 41053
          StdMenuKeyNS                           * 41058
          MenuKeyNS!                             * 4105D
          '                                      * 41062
          StdMenuKeyLS                           * 41067
          MenuKeyLS!                             * 4106C
          '                                      * 41071
          StdRightShift                          * 41076
          MenuKeyRS!                             * 4107B
          '                                      * 41080
          review                                 * 41085
          ReviewKey!                             * 4108A
          'NOP                                   * 4108F
          OBJ_419A4                              * 41094
          '                                      * 41099
          SaveLastMenu                           * 4109E
          MenuExitAct!                           * 410A3
          BINT0                                  * 410A8
          OBJ_41A04                              * 410AD
          OBJ_3A5CD                              * 410B2
          OBJ_418B4                              * 410B7
          SetThisRow                             * 410BC
        ;                                        * 410C1

* ->
* refs (7): 17C26 38697 3A9FB 3B225 410BC D8DC3 ...
SetThisRow:
        ::                                       * 410C6
          OBJ_41826                              * 410CB
          OBJ_418C4                              * 410D0
          INNERCOMP                              * 410D5
          OBJ_410E9                              * 410DA
          LoadTouchTbl                           * 410DF
        ;                                        * 410E4

* refs (4): 3F438 3F660 3F6F6 410DA
OBJ_410E9:
        ::                                       * 410E9
          DUP#0=                                 * 410EE
          ?SEMI                                  * 410F3
          CheckMenuRow                           * 410F8
          DUP                                    * 410FD
          #5+                                    * 41102
          SubMetaOb                              * 41107
        ;                                        * 4110C

* # -> # #'
* refs (3): 3F593 3F81D 410F8
CheckMenuRow:
        ::                                       * 41111
          MenuRow@                               * 41116
          2DUP#<                                 * 4111B
          NOT?SEMI                               * 41120
          #       FFFFB                          * 41125  1048571
          #<>                                    * 4112F
          ITE                                    * 41134
          BINT1                                  * 41139
          ::                                     * 4113E
            DUP#1-                               * 41143
            BINT6                                * 41148
            #/                                   * 4114D
            SWAPDROP                             * 41152
            #6*                                  * 41157
            #1+                                  * 4115C
          ;                                      * 41161
          DUP                                    * 41166
          MenuRow!                               * 4116B
        ;                                        * 41170

* MenuKey1 .. MenuKeyN #n ->
* refs (7): 3F43D 3F5E8 3F665 3F700 3F737 3F7AA ...
LoadTouchTbl:
        ::                                       * 41175
          NullMenuKey                            * 4117A
          NullMenuKey                            * 4117F
          2DUP                                   * 41184
          2DUP                                   * 41189
          7ROLL                                  * 4118E
          NDROP                                  * 41193
          OBJ_41826                              * 41198
          BINT7                                  * 4119D
          ONE_DO                                 * 411A2
          OBJ_3A6AE                              * 411A7
          BINT7                                  * 411AC
          INDEX@#-                               * 411B1
          DUPUNROT                               * 411B6
          OBJ_04A4C                              * 411BB
          OBJ_04A57                              * 411C0
          LOOP                                   * 411C5
          OBJ_41815                              * 411CA
        ;                                        * 411CF

* refs (2): 3A6BD 3A6EB
OBJ_411D4:
        ::                                       * 411D4
          DUP                                    * 411D9
          DUPTYPELIST?                           * 411DE
          NOTcase                                * 411E3
          OBJ_4121F                              * 411E8
          BINT2                                  * 411ED
          NTHELCOMP                              * 411F2
          ?SKIP                                  * 411F7
          'DoBadKey                              * 411FC
          SWAPONE                                * 41201
          NTHELCOMP                              * 41206
          case                                   * 4120B
          OBJ_4121F                              * 41210
          NULL$                                  * 41215
        ;                                        * 4121A

* refs (3): 411E8 41210 412DD
OBJ_4121F:
        ::                                       * 4121F
          CK&DISPATCH0                           * 41224
          BINT6                                  * 41229
          NOP                                    * 4122E
          BINT3                                  * 41233
          NOP                                    * 41238
          BINT31                                 * 4123D
          NOP                                    * 41242
          BINT111                                * 41247
          CHR>$                                  * 4124C
          BINT8                                  * 41251
          OBJ_41292                              * 41256
          BINT15                                 * 4125B
          OBJ_412AB                              * 41260
          BINT12                                 * 41265
          OBJ_412EC                              * 4126A
          BINT14                                 * 4126F
          ->StrUnit(uo)                          * 41274
          BINT13                                 * 41279
          OBJ_3F0A7                              * 4127E
          BINT0                                  * 41283
          OBJ_41355                              * 41288
        ;                                        * 4128D

* refs (1): 41256
OBJ_41292:
        ::                                       * 41292
          SystemLevel?                           * 41297
          ?SEMI                                  * 4129C
          OBJ_41355                              * 412A1
        ;                                        * 412A6

* refs (1): 41260
OBJ_412AB:
        ::                                       * 412AB
          DUP                                    * 412B0
          ROMPTRDECOMP                           * 412B5
          case                                   * 412BA
          ::                                     * 412BF
            ID>$                                 * 412C4
            SWAPDROP                             * 412C9
          ;                                      * 412CE
          ROMPTR@                                * 412D3
          case                                   * 412D8
          OBJ_4121F                              * 412DD
          NULL$                                  * 412E2
        ;                                        * 412E7

* refs (1): 4126A
OBJ_412EC:
        ::                                       * 412EC
          DUP                                    * 412F1
          GROBDIM                                * 412F6
          NullMenuLbl                            * 412FB
          GROBDIM                                * 41300
          ROT                                    * 41305
          #=                                     * 4130A
          3UNROLL                                * 4130F
          #=                                     * 41314
          AND                                    * 41319
          ?SEMI                                  * 4131E
          ->str1(go)                             * 41323
        ;                                        * 41328

* refs (2): 404E5 41274
->StrUnit(uo):
        ::                                       * 4132D
          UNIT>$                                 * 41332
          DUP                                    * 41337
          CHR_UndScore                           * 4133C
          BINT1                                  * 41341
          POS$                                   * 41346
          #1+LAST$                               * 4134B
        ;                                        * 41350

* refs (3): 3F0BB 41288 412A1
OBJ_41355:
        ::                                       * 41355
          DUPTYPEREAL?                           * 4135A
          case                                   * 4135F
          OBJ_35264                              * 41364
          DECOMP$                                * 41369
        ;                                        * 4136E

* refs (4): 17BD1 38606 3880E 3886D
DoMenuMTH:
        ::                                       * 41373
          NoExitAction                           * 41378
          '                                      * 4137D
          OBJ_3B2F2                              * 41382
          BINT1                                  * 41387
          StartMenu                              * 4138C
          SaveLastMenu                           * 41391
        ;                                        * 41396

* ->
* refs (3): 3BCF6 4109E 41391
SaveLastMenu:
        ::                                       * 4139B
          MenuRow@                               * 413A0
          LastMenuRow!                           * 413A5
          MenuDef@                               * 413AA
          LastMenuDef!                           * 413AF
        ;                                        * 413B4

* refs (1): 3C402
OBJ_413B9:
        ::                                       * 413B9
          '                                      * 413BE
          OBJ_4A5EF                              * 413C3
          ReviewKey!                             * 413C8
        ;                                        * 413CD

* refs (1): 41085
review:
        ::                                       * 413D2
          BINT7                                  * 413D7
          ONE_DO                                 * 413DC
          INDEX@                                 * 413E1
          DUP                                    * 413E6
          GETPROC                                * 413EB
          >Review$                               * 413F0
          INDEX@                                 * 413F5
          DISPN                                  * 413FA
          LOOP                                   * 413FF
          NULL$                                  * 41404
          BINT7                                  * 41409
          DISPN                                  * 4140E
          SetDA12Temp                            * 41413
          SetDA3NoCh                             * 41418
        ;                                        * 4141D

* id -> $
* refs (3): 413F0 41548 9E462
>Review$:
        ::                                       * 41422
          CK&DISPATCH1                           * 41427
          BINT3                                  * 4142C
          SWAPDROP                               * 41431
          BINT6                                  * 41436
          OBJ_41495                              * 4143B
          BINT7                                  * 41440
          OBJ_41495                              * 41445
          BINT8                                  * 4144A
          OBJ_414DA                              * 4144F
          BINT5                                  * 41454
          OBJ_41520                              * 41459
          BINT14                                 * 4145E
          ::                                     * 41463
            SWAPDROP                             * 41468
            ->StkStr22!                          * 4146D
          ;                                      * 41472
          BINT0                                  * 41477
          ::                                     * 4147C
            DROP                                 * 41481
            OBJ_41552                            * 41486
          ;                                      * 4148B
        ;                                        * 41490

* refs (3): 3FBA1 4143B 41445
OBJ_41495:
        ::                                       * 41495
          SWAPDROP                               * 4149A
          DUPSAFE@                               * 4149F
          ITE                                    * 414A4
          ->StkStr22!                            * 414A9
          $_Undefined                            * 414AE
          SWAP                                   * 414B3
          ID>$                                   * 414B8

* ":"
$_::
          $       ": "                           * 414BD
          &$                                     * 414CB
          SWAP&$                                 * 414D0
        ;                                        * 414D5

* refs (1): 4144F
OBJ_414DA:
        ::                                       * 414DA
          DUPROM-WORD?                           * 414DF
          case                                   * 414E4
          OBJ_415A2                              * 414E9
          SystemLevel?                           * 414EE
          NOTcasedrop                            * 414F3
          OBJ_41552                              * 414F8
          '                                      * 414FD
          ROM-WORD?                              * 41502
          Find1stTrue                            * 41507
          case                                   * 4150C
          OBJ_415A2                              * 41511
          OBJ_41552                              * 41516
        ;                                        * 4151B

* refs (1): 41459
OBJ_41520:
        ::                                       * 41520
          OBJ_3EFC8                              * 41525
          casedrop                               * 4152A
          OBJ_41552                              * 4152F
          CARCOMP                                * 41534
          DUPTYPELIST?                           * 41539
          casedrop                               * 4153E
          OBJ_41552                              * 41543
          >Review$                               * 41548
        ;                                        * 4154D

* refs (5): 41486 414F8 41516 4152F 41543
OBJ_41552:
        ::                                       * 41552
          GETDF                                  * 41557
          DUPTYPECSTR?                           * 4155C
          ?SEMI                                  * 41561
          DUPTYPEIDNT?                           * 41566
          case                                   * 4156B
          ID>$                                   * 41570
          DUPTYPECOL?                            * 41575
          NOTcasedrop                            * 4157A
          NULL$                                  * 4157F
          '                                      * 41584
          TYPECSTR?                              * 41589
          Find1stTrue                            * 4158E
          NOTcase                                * 41593
          NULL$                                  * 41598
        ;                                        * 4159D

* refs (2): 414E9 41511
OBJ_415A2:
        ::                                       * 415A2
          SWAPDROP                               * 415A7
          ->StkStr22!                            * 415AC
        ;                                        * 415B1
        BSS     19                               * 415B6

* -> %
* refs (1): 211EB
GetMenu%:
        ::                                       * 415C9
          OBJ_3BE22                              * 415CE
          MenuRow@                               * 415D3
          #       6                              * 415D8  6
          #/                                     * 415E2
          #+                                     * 415E7
          UNCOERCE                               * 415EC

* 100
* refs (21): 4167E B6D26 B6D44 B6E55 B6F18 B6F31 ...
%100:
          %       1E2                            * 415F1
          %/                                     * 41606
          %FP                                    * 4160B
          %+                                     * 41610
        ;                                        * 41615

* refs (1): 3BE36
NumCurMenu:
        ::                                       * 4161A
          ROMPTR>#                               * 4161F
          SWAP                                   * 41624
          SYMSYMB                                * 41629
          #=case                                 * 4162E
          UNCOERCE                               * 41633
          OBJ_56B87                              * 41638
        ;                                        * 4163D

* refs (1): 3BE40
OBJ_41642:
        ::                                       * 41642
          DUPTWO                                 * 41647
          NTHELCOMP                              * 4164C
          NOTcasedrop                            * 41651
          %0_2A2B4                               * 41656
          PTR     EQ:                            * 4165B
          OBJ_3F4C4                              * 41660
          NOTcasedrop                            * 41665
          %0_2A2B4                               * 4166A
          CARCOMP                                * 4166F
        ;                                        * 41674

* %mnu.pg   -> %0        ->
* refs (3): 2116C 211AA 9DEEF
InitMenu%:
        ::                                       * 41679
          %100                                   * 4167E
          %*                                     * 41683
          COERCE                                 * 41688
          BINT100                                * 4168D
          #/                                     * 41692
          BINT255d                               * 41697
          OVER#<                                 * 4169C
          ITE                                    * 416A1
          ::                                     * 416A6
            UNCOERCE                             * 416AB
            '                                    * 416B0
            OBJ_3F4C4                            * 416B5
            2Ob>Seco                             * 416BA
          ;                                      * 416BF
          ::                                     * 416C4
            SYMSYMB                              * 416C9
            SWAP                                 * 416CE
            #>ROMPTR                             * 416D3
          ;                                      * 416D8
          SWAP                                   * 416DD
          DUP#0=ITE                              * 416E2
          DROPONE                                * 416E7
          ::                                     * 416EC
            #1-                                  * 416F1
            #6*                                  * 416F6
            #1+                                  * 416FB
          ;                                      * 41700
          ERRSET                                 * 41705
          DoMenuPos(li,s)                        * 4170A
          ERRTRAP                                * 4170F
          ::                                     * 41714
            ERROR@                               * 41719
            BINT4                                * 4171E
            #=case                               * 41723
            SETSIZEERR                           * 41728
            ERRJMP                               * 4172D
          ;                                      * 41732
        ;                                        * 41737
        NIBHEX  00000                            * 4173C  ..

* ->
* refs (4): 15205 3BE9A 3BEE0 3C338
InitTrack::
        ::                                       * 41741
          'R                                     * 41746
          OBJ_419A4                              * 4174B
          CONTEXT@                               * 41750
          OBJ_41A04                              * 41755
          OBJ_417C0                              * 4175A
        ;                                        * 4175F

* refs (2): 1857C 185B8
OBJ_41764:
        ::                                       * 41764
          OBJ_41A14                              * 41769
          Embedded?                              * 4176E
          NOT?SEMI                               * 41773
          BINT0                                  * 41778
          OBJ_41A04                              * 4177D
        ;                                        * 41782

* refs (1): 38688
OBJ_41787:
        ::                                       * 41787
          CONTEXT@                               * 4178C
          OBJ_41A14                              * 41791
          EQcase                                 * 41796
          DROP                                   * 4179B
          OBJ_41A04                              * 417A0
          OBJ_419B4                              * 417A5
        ;                                        * 417AA

* refs (1): 4102B
OBJ_417AF:
        CON(5)  (*)+5                            * 417AF  primitive code object
        ASSEMBLE
        LC(3)   #402                             * 417B4
        GOVLNG  L_539F1                          * 417B9

* refs (1): 4175A
OBJ_417C0:
        CON(5)  (*)+5                            * 417C0  primitive code object
        LC(3)   #402                             * 417C5
        GOVLNG  SetISysFlag                      * 417CA

* refs (1): 3867E
OBJ_417D1:
        CON(5)  (*)+5                            * 417D1  primitive code object
        LC(3)   #402                             * 417D6
        GOVLNG  L_539E6                          * 417DB

* refs (1): 41026
OBJ_417E2:
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
OBJ_41804:
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
OBJ_41894:
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
OBJ_418B4:
        CON(5)  (*)+5                            * 418B4  primitive code object
        LC(5)   MenuData                         * 418B9
        GOTO    L_41A24                          * 418C0

* refs (1): 410D0
OBJ_418C4:
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
OBJ_419B4:
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
OBJ_419D4:
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
        ::                                       * 41A39
          '                                      * 41A3E

* ID UserKeys
ID_UserKeys:
          ID      UserKeys                       * 41A43
        ;                                        * 41A5A

* -> id
* refs (2): 1108B 41E4B
'idUserKeys.:
        ::                                       * 41A5F
          '                                      * 41A64

* ID UserKeys.CRC
ID_UserKeys.:
          ID      UserKeys.CRC                   * 41A69
        ;                                        * 41A88

* -> flag
* refs (3): 397C0 3D960 3FA7F
UserKeys?:
        ::                                       * 41A8D
          BINT62                                 * 41A92
          TestSysFlag                            * 41A97
        ;                                        * 41A9C

* {} ->
* refs (1): 22523
Ck&AsnUKeys:
        ::                                       * 41AA1
          INNERCOMP                              * 41AA6
          DUP#0=csDROP                           * 41AAB
          BINT2                                  * 41AB0
          #/                                     * 41AB5
          SWAP                                   * 41ABA
          #0<>                                   * 41ABF
          IT                                     * 41AC4
          ::                                     * 41AC9
            DUP                                  * 41ACE
            #2*                                  * 41AD3
            #2+ROLL                              * 41AD8
            StoKeys(nm)                          * 41ADD
          ;                                      * 41AE2
          DUP#0=csDROP                           * 41AE7
          ZERO_DO                                * 41AEC
          ISTOP@                                 * 41AF1
          #2*                                    * 41AF6
          INDEX@                                 * 41AFB
          #2*                                    * 41B00
          #-                                     * 41B05
          DUP#1+                                 * 41B0A
          ROLLSWAP                               * 41B0F
          ROLL                                   * 41B14
          XEQAsnKey                              * 41B19
          LOOP                                   * 41B1E
        ;                                        * 41B23

* ob %rc.p ->
* refs (2): 22503 41B19
XEQAsnKey:
        ::                                       * 41B28
          Ck&DecKeyLoc                           * 41B2D
          StoUserKeypatch                        * 41B32
        ;                                        * 41B37

* {} ->
* refs (1): 22561
XEQDelKeys:
        ::                                       * 41B3C
          INNERCOMP                              * 41B41
          DUP#0=csDROP                           * 41B46
          ZERO_DO                                * 41B4B
          ISTOP-INDEX                            * 41B50
          ROLL                                   * 41B55
          Ck&ClrUKey                             * 41B5A
          LOOP                                   * 41B5F
        ;                                        * 41B64

* 0 -> %rc.p ->
* refs (2): 22557 41B5A
Ck&ClrUKey:
        ::                                       * 41B69
          DUP%0=                                 * 41B6E
          casedrop                               * 41B73
          ClrUserKeys                            * 41B78
          Ck&DecKeyLoc                           * 41B7D
          DelKey                                 * 41B82
        ;                                        * 41B87

* #kc #plane ->
* refs (1): 41B82
DelKey:
        ::                                       * 41B8C
          NULL{}                                 * 41B91
          3UNROLL                                * 41B96
          StoUserKeypatch                        * 41B9B
        ;                                        * 41BA0

* refs (3): 2252D 22537 41ADD
StoKeys(nm):
        ::                                       * 41BA5
          ChkName'S'                             * 41BAA
          SetNUsrKeyOK                           * 41BAF
        ;                                        * 41BB4

* refs (2): 2256B 22575
DelKeys(nm):
        ::                                       * 41BB9
          ChkName'S'                             * 41BBE
          ClrNUsrKeyOK                           * 41BC3
        ;                                        * 41BC8

* refs (2): 41BAA 41BBE
ChkName'S':
        ::                                       * 41BCD
          DUP'                                   * 41BD2

S:
          ID      S                              * 41BD7
          EQUAL                                  * 41BE0
          SWAP'                                  * 41BE5

ΠS:
          LAM     S                              * 41BEA
          EQUALOR                                * 41BF3
          NcaseSIZEERR                           * 41BF8
        ;                                        * 41BFD

* -> {}
* refs (1): 22590
XEQRclKeys:
        ::                                       * 41C02
          GetUserKeys                            * 41C07
          DUPNULLCOMP?                           * 41C0C
          casedrop                               * 41C11
          NULL{}                                 * 41C16
          NULL{}                                 * 41C1B
          SWAP                                   * 41C20
          toLEN_DO                               * 41C25
          DUPINDEX@                              * 41C2A
          NTHCOMPDROP                            * 41C2F
          DUPNULLCOMP?                           * 41C34
          ?SKIP                                  * 41C39
          ::                                     * 41C3E
            toLEN_DO                             * 41C43
            DUPINDEX@                            * 41C48
            NTHCOMPDROP                          * 41C4D
            DUPNULLCOMP?                         * 41C52
            ITE_DROP                             * 41C57
            ::                                   * 41C5C
              4ROLLSWAP                          * 41C61
              >TCOMP                             * 41C66
              JINDEX@                            * 41C6B
              INDEX@                             * 41C70
              CodePl>%rc.p                       * 41C75
              >TCOMP                             * 41C7A
              3UNROLL                            * 41C7F
            ;                                    * 41C84
            LOOP                                 * 41C89
          ;                                      * 41C8E
          DROPLOOP                               * 41C93
          DROP                                   * 41C98
        ;                                        * 41C9D

* %rc.p -> #kc #p
* refs (2): 41B2D 41B7D
Ck&DecKeyLoc:
        ::                                       * 41CA2
          CKREAL                                 * 41CA7
          DUP                                    * 41CAC
          %IP>#                                  * 41CB1
          BINT10                                 * 41CB6
          #/                                     * 41CBB
          OVER#0=                                * 41CC0
          caseSIZEERR                            * 41CC5
          DUP#0=                                 * 41CCA
          caseSIZEERR                            * 41CCF
          2DUP                                   * 41CD4
          BINT9                                  * 41CD9
          #>                                     * 41CDE
          caseSIZEERR                            * 41CE3
          BINT6                                  * 41CE8
          #>                                     * 41CED
          caseSIZEERR                            * 41CF2
          DUP                                    * 41CF7
          BINT4                                  * 41CFC
          #>                                     * 41D01
          3PICK                                  * 41D06
          BINT5                                  * 41D0B
          #>                                     * 41D10
          AND                                    * 41D15
          caseSIZEERR                            * 41D1A
          DUP                                    * 41D1F
          #6*                                    * 41D24
          #6-                                    * 41D29
          SWAPDUP                                * 41D2E
          BINT5                                  * 41D33
          #<ITE                                  * 41D38
          DROP                                   * 41D3D

-(2s);5+(s):
          ::                                     * 41D42
            #-                                   * 41D47
            #5+                                  * 41D4C
          ;                                      * 41D51
          #+                                     * 41D56
          SWAP                                   * 41D5B
          %FP                                    * 41D60
          %10*                                   * 41D65
          %ABSCOERCE                             * 41D6A
          DUP                                    * 41D6F
          BINT6                                  * 41D74
          #>                                     * 41D79
          caseSIZEERR                            * 41D7E
          DUP#0=IT                               * 41D83
          #1+                                    * 41D88
        ;                                        * 41D8D

* #kc #p -> %rc.p
* refs (3): 1A7AB 1A8A0 41C75
CodePl>%rc.p:
        ::                                       * 41D92
          UNCOERCE                               * 41D97
          %10                                    * 41D9C
          %/                                     * 41DA1
          SWAPDUP                                * 41DA6
          BINT25                                 * 41DAB
          #<ITE                                  * 41DB0
          ::                                     * 41DB5
            BINT0                                * 41DBA
            BINT6                                * 41DBF
          ;                                      * 41DC4
          ::                                     * 41DC9
            BINT24                               * 41DCE
            #-                                   * 41DD3
            BINT4                                * 41DD8
            BINT5                                * 41DDD
          ;                                      * 41DE2
          ROTOVER                                * 41DE7
          #/                                     * 41DEC
          OVER                                   * 41DF1
          #0=ITE                                 * 41DF6
          SWAPDROP                               * 41DFB

1+(s);drop(3):
          ::                                     * 41E00
            #1+                                  * 41E05
            ROTDROP                              * 41E0A
          ;                                      * 41E0F
          ROT#+                                  * 41E14
          UNCOERCE2                              * 41E19
          %10*                                   * 41E1E
          %+                                     * 41E23
          %+                                     * 41E28
        ;                                        * 41E2D

* {} ->
* refs (3): 110E5 41F09 41F1D
StoUserKeys:
        ::                                       * 41E32
          PgUserKeys                             * 41E37
          DUP                                    * 41E3C
          OCRC                                   * 41E41
          SWAPDROP                               * 41E46
          'idUserKeys.                           * 41E4B
          StoHiddenVar                           * 41E50
          'idUserKeys                            * 41E55
          StoHiddenVar                           * 41E5A
          'idUserKeys                            * 41E5F
          RclHiddenVar                           * 41E64
          DROP                                   * 41E69
          UserKeys!                              * 41E6E
        ;                                        * 41E73

* ob #kc #p ->
* refs (2): 41B32 41B9B
StoUserKeypatch:
        ::                                       * 41E78
          GetUserKeys                            * 41E7D
          DUPNULLCOMP?                           * 41E82
          IT                                     * 41E87
          ::                                     * 41E8C
            BINT48                               * 41E91
            ZERO_DO                              * 41E96
            DUP                                  * 41E9B
            LOOP                                 * 41EA0
            BINT49                               * 41EA5
            {}N                                  * 41EAA
          ;                                      * 41EAF
          DUP                                    * 41EB4
          4PICK                                  * 41EB9
          NTHCOMPDROP                            * 41EBE
          DUPNULLCOMP?                           * 41EC3
          IT                                     * 41EC8
          ::                                     * 41ECD
            DUPDUP                               * 41ED2
            DUPDUP                               * 41ED7
            DUP                                  * 41EDC
            BINT6                                * 41EE1
            {}N                                  * 41EE6
          ;                                      * 41EEB
          5ROLL                                  * 41EF0
          4ROLLROT                               * 41EF5
          PUTLIST                                * 41EFA
          3UNROLL                                * 41EFF
          PUTLIST                                * 41F04
          StoUserKeys                            * 41F09
        ;                                        * 41F0E

* ->
* refs (2): 17DFD 41B78
ClrUserKeys:
        ::                                       * 41F13
          NULL{}                                 * 41F18
          StoUserKeys                            * 41F1D
          SetNUsrKeyOK                           * 41F22
        ;                                        * 41F27

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
        ::                                       * 41F65
          POLSaveUI                              * 41F6A
          ERRSET                                 * 41F6F
          ::                                     * 41F74
            FALSE                                * 41F79
            1NULLLAM{}                           * 41F7E
            BIND                                 * 41F83
            '                                    * 41F88
            ClrDAsOK                             * 41F8D
            '                                    * 41F92
            OBJ_41FE7                            * 41F97
            TrueTrue                             * 41F9C
            FALSE                                * 41FA1
            BINT0                                * 41FA6
            FALSE                                * 41FAB
            '                                    * 41FB0
            1GETLAM                              * 41FB5
            'ERRJMP                              * 41FBA
            POLSetUI                             * 41FBF
            POLKeyUI                             * 41FC4
            ABND                                 * 41FC9
          ;                                      * 41FCE
          ERRTRAP                                * 41FD3
          POLResUI&Err                           * 41FD8
          POLRestoreUI                           * 41FDD
        ;                                        * 41FE2

* refs (1): 41F97
OBJ_41FE7:
        ::                                       * 41FE7
          2DUP                                   * 41FEC
          ModifierKey?                           * 41FF1
          case2drpfls                            * 41FF6
          '                                      * 41FFB
          OBJ_42023                              * 42000
          ROT                                    * 42005
          >TCOMP                                 * 4200A
          SWAP                                   * 4200F
          >TCOMP                                 * 42014
          TRUE                                   * 42019
        ;                                        * 4201E
