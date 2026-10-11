* HP 48GX ROM revision R, #73088-#740E0: Library table, access pointers, bank switching
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ZOOM Y: X: TRACE MsgTab(0) FCN EDIT_73456 (X,Y) (AN(L 'EnvOK
* Follows on from the previous file (at #73088 in the original ROM).

* refs (1): 7305B
OBJ_73088:
        CON(5)  (*)+5                            * 73088  primitive code object
        A=0     W                                * 7308D
        C=0     W                                * 73090
        C=B     A                                * 73093
        CD0EX                                    * 73095
        RSTK=C                                   * 73098
        D0=D0-  10                               * 7309A
        C=DAT0  A                                * 7309D
        CD0EX                                    * 730A0
        A=DAT0  15                               * 730A3
        D0=C                                     * 730A7
        LC(5)   xi                               * 730AA
        ?C=A    A                                * 730B1
        GOYES   L_730BD                          * 730B4
        GOVLNG  L_29AA8                          * 730B6
L_730BD:
        C=RSTK                                   * 730BD
        CD0EX                                    * 730BF
        R0=C.F  A                                * 730C2
        P=      10                               * 730C8
        LC(5)   x+                               * 730CA
        P=      5                                * 730D1
        LC(5)   x*                               * 730D3
        P=      0                                * 730DA
        LC(5)   xi                               * 730DC
        A=A-C   W                                * 730E3
        LC(5)   nextsym'R                        * 730E6
        ?A#0    W                                * 730ED
        GOYES   L_73111                          * 730F0
        A=R0.F  A                                * 730F2
        AD0EX                                    * 730F8
        C=DAT0  A                                * 730FB
        C=C+CON A,15                             * 730FE
        DAT0=C  A                                * 73104
        D0=A                                     * 73107
        LC(5)   OBJ_73117                        * 7310A
L_73111:
        A=C     A                                * 73111
        PC=(A)                                   * 73113
        RPL

* refs (1): 7310A
OBJ_73117:
        ::                                       * 73117
          '                                      * 7311C
          ROMP_002_105                           * 73121
        ;                                        * 73126

* refs (1): 4B675
OBJ_7312B:
        ::                                       * 7312B
          BINT1                                  * 73130
          PTYPE>PINFO                            * 73135
        ;                                        * 7313A

* refs (1): 4B84B
OBJ_7313F:
        ::                                       * 7313F
          BINT9                                  * 73144
          PTYPE>PINFO                            * 73149
        ;                                        * 7314E

* refs (2): 4B68E 4B9B3
OBJ_73153:
        ::                                       * 73153
          BINT2                                  * 73158
          PTYPE>PINFO                            * 7315D
          DROP                                   * 73162
        ;                                        * 73167

* refs (1): 4C0F8
OBJ_7316C:
        ::                                       * 7316C
          BINT11                                 * 73171
          PTYPE>PINFO                            * 73176
          NOTcaseFALSE                           * 7317B
        ;                                        * 73180

* refs (1): 4C2E2
OBJ_73185:
        ::                                       * 73185
          BINT4                                  * 7318A
          PTYPE>PINFO                            * 7318F
          NOTcaseFALSE                           * 73194
        ;                                        * 73199

        ::                                       * 7319E
          BINT6                                  * 731A3
          PTYPE>PINFO                            * 731A8
          NOTcaseFALSE                           * 731AD
        ;                                        * 731B2

* refs (1): 4D286
OBJ_731B7:
        ::                                       * 731B7
          BINT5                                  * 731BC
          PTYPE>PINFO                            * 731C1
          NOTcaseFALSE                           * 731C6
          DUPNULLCOMP?                           * 731CB
          casedrpfls                             * 731D0
          TRUE                                   * 731D5
        ;                                        * 731DA

* refs (1): 7000C
OBJ_731DF:
        ::                                       * 731DF
          BINT12                                 * 731E4
          PTYPE>PINFO                            * 731E9
          NOTcaseFALSE                           * 731EE
        ;                                        * 731F3

* refs (1): 4D2DB
OBJ_731F8:
        ::                                       * 731F8
          BINT13                                 * 731FD
          PTYPE>PINFO                            * 73202
          ?SEMI                                  * 73207
          '                                      * 7320C

* refs (9): 8C902 8C9D2 8CB16 8CC54 8CD29 8CE0D ...
OBJ_73211:
          ::                                     * 73211
            OBJ_73230                            * 73216
            ROMPTR  0F1 03E                      * 7321B
          ;                                      * 73226
        ;                                        * 7322B

* refs (8): 45C3F 45C62 570EA 5710D 57130 57153 ...
OBJ_73230:
        ::                                       * 73230

'EnvOK:
          LAM     'EnvOK                         * 73235
          COLA                                   * 73248
          NOTcase                                * 7324D
        ;                                        * 73252

* refs (1): 4D91B
OBJ_73257:
        ::                                       * 73257
          BINT14                                 * 7325C
          PTYPE>PINFO                            * 73261
          ?SEMI                                  * 73266
          '                                      * 7326B

* refs (9): 8C907 8C9D7 8CB1B 8CC59 8CD2E 8CE12 ...
OBJ_73270:
          ::                                     * 73270
            GraphicExit                          * 73275
            DUP                                  * 7327A
            NOT?SEMI                             * 7327F
            ROMPTR  0F1 040                      * 73284
          ;                                      * 7328F
        ;                                        * 73294

* refs (1): 4D925
OBJ_73299:
        ::                                       * 73299
          BINT15                                 * 7329E
          PTYPE>PINFO                            * 732A3
          ?SEMI                                  * 732A8
          '                                      * 732AD
          ROMPTR  0F1 03F                        * 732B2
        ;                                        * 732BD

* refs (1): 4D295
OBJ_732C2:
        ::                                       * 732C2
          BINT16                                 * 732C7
          PTYPE>PINFO                            * 732CC
          ?SEMI                                  * 732D1
          '                                      * 732D6
          OBJ_73594                              * 732DB
        ;                                        * 732E0

* refs (1): 8C917
OBJ_732E5:
        ::                                       * 732E5
          NoExitAction                           * 732EA
          {                                      * 732EF

* refs (3): 73535 7356C 735A3
OBJ_732F4:
            {                                    * 732F4
              ::                                 * 732F9
                TakeOver                         * 732FE
                OBJ_4EE42                        * 73303
                NOTcase                          * 73308
                NULL$                            * 7330D
                PTR     DirLabel:                * 73312

ZOOM:
                $       "ZOOM"                   * 73317
              ;                                  * 73329
              ::                                 * 7332E
                CHECKMENU                        * 73333
                OBJ_4EE42                        * 73338
                NOTcase                          * 7333D
                DoBadKey                         * 73342
                '                                * 73347
                OBJ_47D93                        * 7334C
                InitMenu                         * 73351
                DispMenu                         * 73356
              ;                                  * 7335B
            }                                    * 73360

* refs (4): 7353A 73571 735A8 8C54F
OBJ_73365:
            {                                    * 73365

(X,Y):
              $       "(X,Y)"                    * 7336A
              OBJ_73B20                          * 7337E
            }                                    * 73383

* refs (2): 7353F 8C554
OBJ_73388:
            {                                    * 73388
              ::                                 * 7338D
                TakeOver                         * 73392
                OBJ_4EE42                        * 73397
                NOTcase                          * 7339C
                NULL$                            * 733A1
                PTR     Box/StdLbl:              * 733A6

TRACE:
                $       "TRACE"                  * 733AB
                OBJ_73602                        * 733BF
              ;                                  * 733C4
              OBJ_73792                          * 733C9
            }                                    * 733CE
            {                                    * 733D3
              ::                                 * 733D8
                TakeOver                         * 733DD
                OBJ_4EE42                        * 733E2
                NOTcase                          * 733E7
                NULL$                            * 733EC
                PTR     DirLabel:                * 733F1

FCN:
                $       "FCN"                    * 733F6
              ;                                  * 73406
              ::                                 * 7340B
                CHECKMENU                        * 73410
                OBJ_4EE42                        * 73415
                NOTcase                          * 7341A
                DoBadKey                         * 7341F
                '                                * 73424
                PlotScr*en                       * 73429
                InitMenu                         * 7342E
                OBJ_4EE60                        * 73433
                DispMenu                         * 73438
              ;                                  * 7343D
            }                                    * 73442

* refs (4): 73549 73580 735B7 8C55E
OBJ_73447:
            {                                    * 73447
              ::                                 * 7344C
                PTR     DirLabel:                * 73451

EDIT_73456:
                $       "EDIT"                   * 73456
              ;                                  * 73468
              ::                                 * 7346D
                CHECKMENU                        * 73472
                '                                * 73477
                OBJ_46A40                        * 7347C
                InitMenu                         * 73481
                DispMenu                         * 73486
              ;                                  * 7348B
            }                                    * 73490

* refs (4): 7354E 73585 735BC 8C563
OBJ_73495:
            {                                    * 73495

(AN(L:
              $       "(AN(L"                    * 7349A
              ::                                 * 734AE
                CHECKMENU                        * 734B3
                OBJ_4DA8F                        * 734B8
              ;                                  * 734BD
            }                                    * 734C2
          }                                      * 734C7
        ;                                        * 734CC

* refs (1): 7357B
OBJ_734D1:
        {                                        * 734D1
          ::                                     * 734D6
            TakeOver                             * 734DB
            OBJ_0C77B                            * 734E0
          ;                                      * 734E5
          ::                                     * 734EA
            CHECKMENU                            * 734EF
            OBJ_0C7A8                            * 734F4
          ;                                      * 734F9
        }                                        * 734FE

* refs (6): 73544 73576 735AD 735B2 8C54A 8C559
OBJ_73503:
        {                                        * 73503
          NULL$                                  * 73508
          ::                                     * 7350D
            CHECKMENU                            * 73512
            DoBadKey                             * 73517
          ;                                      * 7351C
        }                                        * 73521

* refs (2): 8CB2B 8CC69
OBJ_73526:
        ::                                       * 73526
          NoExitAction                           * 7352B
          {                                      * 73530
            OBJ_732F4                            * 73535
            OBJ_73365                            * 7353A
            OBJ_73388                            * 7353F
            OBJ_73503                            * 73544
            OBJ_73447                            * 73549
            OBJ_73495                            * 7354E
          }                                      * 73553
        ;                                        * 73558

* refs (1): 8CE22
OBJ_7355D:
        ::                                       * 7355D
          NoExitAction                           * 73562
          {                                      * 73567
            OBJ_732F4                            * 7356C
            OBJ_73365                            * 73571
            OBJ_73503                            * 73576
            OBJ_734D1                            * 7357B
            OBJ_73447                            * 73580
            OBJ_73495                            * 73585
          }                                      * 7358A
        ;                                        * 7358F

* refs (7): 57194 732DB 8C9E7 8CD3E 8CF10 8CFE0 ...
OBJ_73594:
        ::                                       * 73594
          NoExitAction                           * 73599
          {                                      * 7359E
            OBJ_732F4                            * 735A3
            OBJ_73365                            * 735A8
            OBJ_73503                            * 735AD
            OBJ_73503                            * 735B2
            OBJ_73447                            * 735B7
            OBJ_73495                            * 735BC
          }                                      * 735C1
        ;                                        * 735C6

* refs (5): 46E05 46E1E 47272 4D3A8 4D6C3
OBJ_735CB:
        ::                                       * 735CB
          OBJ_456E5                              * 735D0
          BINT2                                  * 735D5
          NTHCOMPDROP                            * 735DA
          EVAL                                   * 735DF
          OBJ_73742                              * 735E4
        ;                                        * 735E9

* refs (9): 4D349 4D3BC 4D475 4D4E3 4D574 4D5D3 ...
OBJ_735EE:
        ::                                       * 735EE
          3GETLAM                                * 735F3
          #3=                                    * 735F8
        ;                                        * 735FD

* refs (20): 47071 4720E 4723B 47290 4887D 4D33F ...
OBJ_73602:
        ::                                       * 73602
          3GETLAM                                * 73607
          BINT4                                  * 7360C
          #=                                     * 73611
        ;                                        * 73616

* refs (4): 4D3DF 4D506 4D5F6 4D6FA
OBJ_7361B:
        ::                                       * 7361B
          3GETLAM                                * 73620
          #0=                                    * 73625
        ;                                        * 7362A

* refs (2): 3E8AC 4DE2C
OBJ_7362F:
        ::                                       * 7362F
          3GETLAM                                * 73634
          #2=                                    * 73639
        ;                                        * 7363E

* refs (2): 47044 4DE72
OBJ_73643:
        ::                                       * 73643
          3GETLAM                                * 73648
          #1=                                    * 7364D
        ;                                        * 73652

* refs (2): 46CB1 47030
OBJ_73657:
        ::                                       * 73657
          3GETLAM                                * 7365C
          DUP                                    * 73661
          #1=                                    * 73666
          SWAP                                   * 7366B
          #2=                                    * 73670
          OR                                     * 73675
          NOT                                    * 7367A
        ;                                        * 7367F

* refs (4): 0C901 4D259 4DE36 4DE7C
OBJ_73684:
        ::                                       * 73684
          BINT0                                  * 73689
          3PUTLAM                                * 7368E
        ;                                        * 73693

* refs (1): 737C4
OBJ_73698:
        ::                                       * 73698
          BINT4                                  * 7369D
          3PUTLAM                                * 736A2
        ;                                        * 736A7

* refs (1): 4D4D4
OBJ_736AC:
        ::                                       * 736AC
          TakeOver                               * 736B1
          OBJ_46DF6                              * 736B6
          BINT16                                 * 736BB
          REPKEY?                                * 736C0
          NOT?SEMI                               * 736C5
          BEGIN                                  * 736CA
          BINT16                                 * 736CF
          REPKEY?                                * 736D4
          WHILE                                  * 736D9
          ::                                     * 736DE
            OBJ_46DF6                            * 736E3
          ;                                      * 736E8
          REPEAT                                 * 736ED
        ;                                        * 736F2

* refs (1): 4D5C4
OBJ_736F7:
        ::                                       * 736F7
          TakeOver                               * 736FC
          OBJ_46E0F                              * 73701
          BINT18                                 * 73706
          REPKEY?                                * 7370B
          NOT?SEMI                               * 73710
          BEGIN                                  * 73715
          BINT18                                 * 7371A
          REPKEY?                                * 7371F
          WHILE                                  * 73724
          ::                                     * 73729
            OBJ_46E0F                            * 7372E
          ;                                      * 73733
          REPEAT                                 * 73738
        ;                                        * 7373D

* refs (1): 735E4
OBJ_73742:
        ::                                       * 73742
          OBJ_7376A                              * 73747
          IT                                     * 7374C
          ::                                     * 73751
            OBJ_47209                            * 73756
            OBJ_47236                            * 7375B
          ;                                      * 73760
        ;                                        * 73765

* refs (1): 73747
OBJ_7376A:
        ::                                       * 7376A
          16GETLAM                               * 7376F
          DUP                                    * 73774
          #1=                                    * 73779
          SWAP                                   * 7377E
          #3=                                    * 73783
          OR                                     * 73788
        ;                                        * 7378D

* refs (1): 733C9
OBJ_73792:
        ::                                       * 73792
          CHECKMENU                              * 73797
          OBJ_73602                              * 7379C
          case                                   * 737A1
          OBJ_4EE60                              * 737A6
          BINT27                                 * 737AB
          GETLAM                                 * 737B0
          OBJ_737D3                              * 737B5
          NOTcase                                * 737BA
          DoBadKey                               * 737BF
          OBJ_73698                              * 737C4
          DispMenu.1                             * 737C9
        ;                                        * 737CE

* refs (3): 737B5 73986 739D1
OBJ_737D3:
        ::                                       * 737D3
          OBJ_456E5                              * 737D8
          BINT3                                  * 737DD
          NTHCOMPDROP                            * 737E2
          EVAL                                   * 737E7
        ;                                        * 737EC

* refs (3): 8C83F 8CA3E 8CB82
OBJ_737F1:
        ::                                       * 737F1
          DUP                                    * 737F6
          OBJ_73846                              * 737FB
          NOTcasedrop                            * 73800
          FALSE                                  * 73805
          SWAP                                   * 7380A
          OBJ_496F0                              * 7380F
          BINT24                                 * 73814
          PUTLAM                                 * 73819
          OBJ_456E5                              * 7381E
          BINT4                                  * 73823
          NTHCOMPDROP                            * 73828
          BINT26                                 * 7382D
          PUTLAM                                 * 73832
          OBJ_47268                              * 73837
          TRUE                                   * 7383C
        ;                                        * 73841

* refs (1): 737FB
OBJ_73846:
        ::                                       * 73846
          OBJ_4BF71                              * 7384B
          case                                   * 73850
          ::                                     * 73855
            BINT1                                * 7385A
            GetEqN                               * 7385F
            NOTcasedrop                          * 73864
            FALSE                                * 73869
            SWAP                                 * 7386E
            #1=                                  * 73873
            ITE                                  * 73878
            OBJ_4B62F                            * 7387D
            OBJ_4B733                            * 73882
            TRUE                                 * 73887
          ;                                      * 7388C
          GetEqN                                 * 73891
          NOTcaseFALSE                           * 73896
          OBJ_49B7D                              * 7389B
          TRUE                                   * 738A0
        ;                                        * 738A5

        ::                                       * 738AA
          TakeOver                               * 738AF
          OBJ_470B7                              * 738B4
          OBJ_5102B                              * 738B9
          IT                                     * 738BE
          ::                                     * 738C3
            OBJ_47209                            * 738C8
            OBJ_47236                            * 738CD
          ;                                      * 738D2
          BINT18                                 * 738D7
          REPKEY?                                * 738DC
          NOT?SEMI                               * 738E1
          OBJ_5102B                              * 738E6
          NOTcase                                * 738EB
          ::                                     * 738F0
            BEGIN                                * 738F5
            BINT18                               * 738FA
            REPKEY?                              * 738FF
            WHILE                                * 73904
            ::                                   * 73909
              OBJ_470B7                          * 7390E
            ;                                    * 73913
            REPEAT                               * 73918
          ;                                      * 7391D
          BEGIN                                  * 73922
          BINT18                                 * 73927
          REPKEY?                                * 7392C
          WHILE                                  * 73931
          ::                                     * 73936
            ::                                   * 7393B
              OBJ_470B7                          * 73940
              OBJ_47209                          * 73945
            ;                                    * 7394A
          ;                                      * 7394F
          REPEAT                                 * 73954
        ;                                        * 73959

* refs (3): 0C631 0C6CC 73BFE
OBJ_7395E:
        ::                                       * 7395E
          TakeOver                               * 73963
          OBJ_49158                              * 73968
          OBJ_46905                              * 7396D
          OVER                                   * 73972
          #>ITE                                  * 73977
          #1+                                    * 7397C
          DROPONE                                * 73981
          OBJ_737D3                              * 73986
          NOTcase                                * 7398B
          DoBadKey                               * 73990
        ;                                        * 73995

* refs (3): 0C640 0C6DB 73C0D
OBJ_7399A:
        ::                                       * 7399A
          TakeOver                               * 7399F
          OBJ_49158                              * 739A4
          BINT1                                  * 739A9
          OVER                                   * 739AE
          #<ITE                                  * 739B3
          #1-                                    * 739B8
          ::                                     * 739BD
            DROP                                 * 739C2
            OBJ_46905                            * 739C7
          ;                                      * 739CC
          OBJ_737D3                              * 739D1
          NOTcase                                * 739D6
          DoBadKey                               * 739DB
        ;                                        * 739E0

* refs (2): 73A3A 73A94
OBJ_739E5:
        ::                                       * 739E5
          OBJ_73602                              * 739EA
          ITE                                    * 739EF
          ::                                     * 739F4
            BINT25                               * 739F9
            GETLAM                               * 739FE
          ;                                      * 73A03
          ::                                     * 73A08
            5GETLAM                              * 73A0D
            7GETLAM                              * 73A12
            UNCOERCE%%                           * 73A17
            %%-                                  * 73A1C
            9GETLAM                              * 73A21
            %%/>%                                * 73A26
          ;                                      * 73A2B
        ;                                        * 73A30

* refs (1): 8CB91
OBJ_73A35:
        ::                                       * 73A35
          OBJ_739E5                              * 73A3A
          #       52                             * 73A3F  82
          SWAP                                   * 73A49
          BINT20                                 * 73A4E
          OBJ_4686A                              * 73A53
          HARDBUFF2                              * 73A58
          BINT47                                 * 73A5D
          BINT2                                  * 73A62
          BINT131                                * 73A67
          BINT7                                  * 73A6C
          GROB!ZERODRP                           * 73A71
          HARDBUFF2                              * 73A76
          BINT47                                 * 73A7B
          BINT2                                  * 73A80
          GROB!                                  * 73A85
        ;                                        * 73A8A

* refs (3): 47245 8C84E 8CA4D
OBJ_73A8F:
        ::                                       * 73A8F
          OBJ_739E5                              * 73A94
          BINT54                                 * 73A99
          SWAP                                   * 73A9E
          BINT13                                 * 73AA3
          OBJ_4686A                              * 73AA8
          HARDBUFF2                              * 73AAD
          #       49                             * 73AB2  73
          BINT2                                  * 73ABC
          BINT131                                * 73AC1
          BINT7                                  * 73AC6
          GROB!ZERODRP                           * 73ACB
          HARDBUFF2                              * 73AD0
          #       49                             * 73AD5  73
          BINT2                                  * 73ADF
          GROB!                                  * 73AE4
        ;                                        * 73AE9

* refs (2): 46B31 4D8C1
OBJ_73AEE:
        ::                                       * 73AEE
          TakeOver                               * 73AF3
          OBJ_4EC12                              * 73AF8
          CK0NOLASTWD                            * 73AFD
          Π'SAVEDDEPTH                           * 73B02
          #1+                                    * 73B07
          '                                      * 73B0C
          Π'SAVEDDEPTH                           * 73B11
          STO                                    * 73B16
        ;                                        * 73B1B

* refs (2): 4D8EE 7337E
OBJ_73B20:
        ::                                       * 73B20
          TakeOver                               * 73B25
          MENUOFF?                               * 73B2A
          IT                                     * 73B2F
          CHECKMENU                              * 73B34
          16GETLAM                               * 73B39
          #3=                                    * 73B3E
          ITE                                    * 73B43
          ::                                     * 73B48
            BINT1                                * 73B4D
            16PUTLAM                             * 73B52
          ;                                      * 73B57
          CHECKMENU                              * 73B5C

* refs (1): 47281
OBJ_73B61:
          ::                                     * 73B61
            CLEARMENU                            * 73B66
            OBJ_73602                            * 73B6B
            case                                 * 73B70
            OBJ_4EEA1                            * 73B75
            BINT1                                * 73B7A
            16PUTLAM                             * 73B7F

Y::
            $       "Y: "                        * 73B84

X::
            $       "X: "                        * 73B94
            $>grob                               * 73BA4
            HARDBUFF2                            * 73BA9
            BINT0                                * 73BAE
            BINT2                                * 73BB3
            GROB!                                * 73BB8
            $>grob                               * 73BBD
            HARDBUFF2                            * 73BC2
            #       41                           * 73BC7  65
            BINT2                                * 73BD1
            GROB!                                * 73BD6
            OBJ_47209                            * 73BDB
            OBJ_47236                            * 73BE0
          ;                                      * 73BE5
        ;                                        * 73BEA

* refs (1): 8C83A
OBJ_73BEF:
        ::                                       * 73BEF
          BINT3                                  * 73BF4
          EQcasedrop                             * 73BF9
          OBJ_7395E                              * 73BFE
          BINT4                                  * 73C03
          EQcasedrop                             * 73C08
          OBJ_7399A                              * 73C0D

* refs (1): 4633E
OBJ_73C12:
          ::                                     * 73C12
            15GETLAM                             * 73C17
            8GETLAM                              * 73C1C
            DUP                                  * 73C21
            4PICK                                * 73C26
            DUP#0=ITE                            * 73C2B
            2DROP                                * 73C30
            ::                                   * 73C35
              #1=                                * 73C3A
              ITE                                * 73C3F
              ::                                 * 73C44
                RIGHTCOL                         * 73C49
                #<                               * 73C4E
                IT                               * 73C53
                #1+                              * 73C58
              ;                                  * 73C5D
              ::                                 * 73C62
                LEFTCOL                          * 73C67
                #>                               * 73C6C
                IT                               * 73C71
                #1-                              * 73C76
              ;                                  * 73C7B
            ;                                    * 73C80
            OBJ_4782B                            * 73C85
            ROT                                  * 73C8A
            BINT0                                * 73C8F
            #=casedrop                           * 73C94
            ::                                   * 73C99
              OBJ_73CF8                          * 73C9E
              OBJ_73D6B                          * 73CA3
              CROSS_HAIRS                        * 73CA8
            ;                                    * 73CAD
            #1=case                              * 73CB2
            ::                                   * 73CB7
              OBJ_73CF8                          * 73CBC
              OBJ_73D6B                          * 73CC1
              8GETLAM                            * 73CC6
              DUP                                * 73CCB
              RIGHTCOL                           * 73CD0
              #<                                 * 73CD5
              IT                                 * 73CDA
              #1+                                * 73CDF
              TOTEMPOB                           * 73CE4
              8PUTLAM                            * 73CE9
              CROSS_HAIRS                        * 73CEE
            ;                                    * 73CF3

* refs (2): 73C9E 73CBC
OBJ_73CF8:
            ::                                   * 73CF8
              OBJ_46955                          * 73CFD
              NOTcase                            * 73D02
              OBJ_46C1B                          * 73D07
              DUPTYPEREAL?                       * 73D0C
              NOTcasedrop                        * 73D11
              OBJ_46C1B                          * 73D16
              DUP                                * 73D1B
              OBJ_468F1                          * 73D20
              OBJ_46D24                          * 73D25
            ;                                    * 73D2A
            OBJ_73D6B                            * 73D2F
            8GETLAM                              * 73D34
            DUP                                  * 73D39
            LEFTCOL                              * 73D3E
            #>                                   * 73D43
            IT                                   * 73D48
            #1-                                  * 73D4D
            TOTEMPOB                             * 73D52
            8PUTLAM                              * 73D57
            CROSS_HAIRS                          * 73D5C
          ;                                      * 73D61
        ;                                        * 73D66

* refs (3): 73CA3 73CC1 73D2F
OBJ_73D6B:
        ::                                       * 73D6B
          TOTEMPOB                               * 73D70
          CROSS_OFF                              * 73D75
          7PUTLAM                                * 73D7A
        ;                                        * 73D7F

* refs (1): 8CB8C
OBJ_73D84:
        ::                                       * 73D84
          OBJ_73602                              * 73D89
          ITE                                    * 73D8E
          15GETLAM                               * 73D93
          OBJ_73DFC                              * 73D98
          BINT38                                 * 73D9D
          SWAP                                   * 73DA2
          BINT9                                  * 73DA7
          OBJ_4686A                              * 73DAC
          HARDBUFF2                              * 73DB1
          BINT8                                  * 73DB6
          BINT2                                  * 73DBB
          BINT47                                 * 73DC0
          BINT7                                  * 73DC5
          GROB!ZERODRP                           * 73DCA
          HARDBUFF2                              * 73DCF
          BINT8                                  * 73DD4
          BINT2                                  * 73DD9
          GROB!                                  * 73DDE
        ;                                        * 73DE3

* refs (3): 47218 8C849 8CA48
OBJ_73DE8:
        ::                                       * 73DE8
          OBJ_73602                              * 73DED
          ITE                                    * 73DF2
          15GETLAM                               * 73DF7

* refs (3): 47821 48CC4 73D98
OBJ_73DFC:
          ::                                     * 73DFC
            8GETLAM                              * 73E01
            OBJ_4782B                            * 73E06
          ;                                      * 73E0B
          BINT54                                 * 73E10
          SWAP                                   * 73E15
          BINT13                                 * 73E1A
          OBJ_4686A                              * 73E1F
          HARDBUFF2                              * 73E24
          BINT8                                  * 73E29
          BINT2                                  * 73E2E
          #       41                             * 73E33  65
          BINT7                                  * 73E3D
          GROB!ZERODRP                           * 73E42
          HARDBUFF2                              * 73E47
          BINT8                                  * 73E4C
          BINT2                                  * 73E51
          GROB!                                  * 73E56
        ;                                        * 73E5B

MsgTab(0):
        CON(5)  DOARRY                           * 73E60  array 16
        LENGTH                                   * 73E65  length, to #740E1
        CON(5)  DOCSTR                           * 73E6A  element type
        CON(5)  1                                * 73E6F  dimensions
        CON(5)  16                               * 73E74
L_73E79:
        $BODY   "Insufficient Memory"            * 73E79  1
        $BODY   "Directory Recursion"            * 73EA4  2
        $BODY   "Undefined Local Name"           * 73ECF  3
        $BODY   "Undefined XLIB Name"            * 73EFC  4
        $BODY   "Memory Clear"                   * 73F27  5
        $BODY   "Power Lost"                     * 73F44  6
        $BODY   "Warning:"                       * 73F5D  7
        $BODY   "Invalid Card Data"              * 73F72  8
        $BODY   "Object In Use"                  * 73F99  9
        $BODY   "Port Not Available"             * 73FB8  10
        $BODY   "No Room in Port"                * 73FE1  11
        $BODY   "Object Not in Port"             * 74004  12
        $BODY   "Recovering Memory"              * 7402D  13
        $BODY   "Try To Recover Memory?"         * 74054  14
        $BODY   "Replace RAM, Press ON"          * 74085  15
        $BODY   "No Mem To Config All"           * 740B4  16
