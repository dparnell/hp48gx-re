* HP 48GX ROM revision R, #4C082-#4F0AB: Plotting
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: CHECKMENU CROSS_OFF CROSS_HAIRS EXITFCNsto NEWINDEP CROSSMARKON TURNMENUOFF DROPDEADTRUE GDISPCENTER CURRENTMARK? PutOnPict(2s,go) ExitFcn
* Follows on from the previous file (at #4C082 in the original ROM).
        RPL

* refs (6): 48A21 4BB70 4BE72 4C53A 4C930 4CCE4
OBJ_4C082:
        ::                                       * 4C082
          ATTNFLG@                               * 4C087
          #0=?SEMI                               * 4C08C
          ExitAtLOOP                             * 4C091
        ;                                        * 4C096

* refs (15): 4695A 48CD8 49261 49E84 4BB2A 4BCB0 ...
NEWINDEP:
        CON(5)  (*)+5                            * 4C09B  primitive code object
        ASSEMBLE
        GOSUB   SUB_4C0BE                        * 4C0A0
L_4C0A4:
        DAT1=A  W                                * 4C0A4
        GOSBVL  GETPTR                           * 4C0A8
        D1=D1+  5                                * 4C0AF
        D=D+1   A                                * 4C0B2
        A=DAT0  A                                * 4C0B4
        D0=D0+  5                                * 4C0B7
        PC=(A)                                   * 4C0BA

* refs (2): 4C0A0 4C0D9
SUB_4C0BE:
        GOSBVL  POP1%                            * 4C0BE
        P=      0                                * 4C0C5
        SETHEX                                   * 4C0C7
        C=DAT1  A                                * 4C0C9
        D1=C                                     * 4C0CC
        D1=D1+  5                                * 4C0CF
        RTN                                      * 4C0D2

* refs (2): 4925C 4C120
OBJ_4C0D4:
        CON(5)  (*)+5                            * 4C0D4  primitive code object
        GOSUB   SUB_4C0BE                        * 4C0D9
        D1=D1+  5                                * 4C0DD
        GOTO    L_4C0A4                          * 4C0E0
        RPL

* refs (11): 48B2A 4B701 4C553 8A656 8A665 8B2C0 ...
OBJ_4C0E4:
        ::                                       * 4C0E4
          INDEPVAR                               * 4C0E9
          ?PURGE_HERE                            * 4C0EE
          GETPTYPE                               * 4C0F3
          OBJ_7316C                              * 4C0F8
          NOT?SEMI                               * 4C0FD
          OBJ_4D96B                              * 4C102
          ?PURGE_HERE                            * 4C107
        ;                                        * 4C10C

* refs (1): 4BC5B
OBJ_4C111:
        ::                                       * 4C111
          19GETLAM                               * 4C116
          15GETLAM                               * 4C11B
          OBJ_4C0D4                              * 4C120
        ;                                        * 4C125

* refs (8): 48A0D 4BB48 4BE59 8A598 8B224 8B29D ...
OBJ_4C12A:
        ::                                       * 4C12A
          BEGIN                                  * 4C12F
          2GETLAM                                * 4C134
          EVAL                                   * 4C139
          NEXTSTEP                               * 4C13E
          LASTPT?                                * 4C143
          UNTIL                                  * 4C148
          PlotOneMore?                           * 4C14D
          NOT?SEMI                               * 4C152
          2GETLAM                                * 4C157
          EVAL                                   * 4C15C
        ;                                        * 4C161

* refs (2): 4C508 4C526
OBJ_4C166:
        ::                                       * 4C166
          3GETLAM                                * 4C16B
          1GETLAM                                * 4C170
          NEWINDEP                               * 4C175
          BEGIN                                  * 4C17A
          2GETLAM                                * 4C17F
          ::                                     * 4C184
            OBJ_5135F                            * 4C189
            DUPTYPEREAL?                         * 4C18E
            IT                                   * 4C193
            ::                                   * 4C198
              %0=                                * 4C19D
              ?SEMI                              * 4C1A2
              15GETLAM                           * 4C1A7
              GETXPOS                            * 4C1AC
              3GETLAM                            * 4C1B1
              GETYPOS                            * 4C1B6
              PIXON3                             * 4C1BB
            ;                                    * 4C1C0
          ;                                      * 4C1C5
          3GETLAM                                * 4C1CA
          DUP                                    * 4C1CF
          19GETLAM                               * 4C1D4
          %-                                     * 4C1D9
          NEWINDEP                               * 4C1DE
          OBJ_4C1F2                              * 4C1E3
          UNTIL                                  * 4C1E8
        ;                                        * 4C1ED

* refs (1): 4C1E3
OBJ_4C1F2:
        ::                                       * 4C1F2
          1GETLAM                                * 4C1F7
          3GETLAM                                * 4C1FC
          %<                                     * 4C201
          caseTRUE                               * 4C206
          3GETLAM                                * 4C20B
          12GETLAM                               * 4C210
          %<                                     * 4C215
          caseTRUE                               * 4C21A
          ATTNFLG@                               * 4C21F
          #0<>                                   * 4C224
        ;                                        * 4C229

* refs (13): 48A62 4C25B 4C35F 4C396 4C3CD 4C3FF ...
OBJ_4C22E:
        ::                                       * 4C22E
          20GETLAM                               * 4C233
          %-1                                    * 4C238
          ROT                                    * 4C23D
          PUTEL                                  * 4C242
          DROP                                   * 4C247
        ;                                        * 4C24C

* refs (2): 513B4 8B298
OBJ_4C251:
        ::                                       * 4C251
          BINT1                                  * 4C256
          OBJ_4C22E                              * 4C25B
        ;                                        * 4C260

* refs (4): 4C378 4C3AF 4C413 4C8A5
OBJ_4C265:
        ::                                       * 4C265
          20GETLAM                               * 4C26A
          4PICK                                  * 4C26F
          PULLREALEL                             * 4C274
          SWAPDROP                               * 4C279
          %-1=case                               * 4C27E
          ::                                     * 4C283
            DROP                                 * 4C288
            OBJ_4C440                            * 4C28D
          ;                                      * 4C292
          COERCE                                 * 4C297
          21GETLAM                               * 4C29C
          5PICK                                  * 4C2A1
          PULLREALEL                             * 4C2A6
          SWAPDROP                               * 4C2AB
          COERCE                                 * 4C2B0
          4PICK                                  * 4C2B5
          4PICK                                  * 4C2BA
          DRAWLINE#3                             * 4C2BF
          OBJ_4C440                              * 4C2C4
        ;                                        * 4C2C9

* refs (3): 48FEF 4DAB7 B639E
OBJ_4C2CE:
        ::                                       * 4C2CE
          GDISPCENTER                            * 4C2D3
          TURNMENUOFF                            * 4C2D8
          GETPTYPE                               * 4C2DD
          OBJ_73185                              * 4C2E2
          BINT29                                 * 4C2E7
          TestSysFlag                            * 4C2EC
          NOT                                    * 4C2F1
          AND                                    * 4C2F6
          IT                                     * 4C2FB
          drax                                   * 4C300
          draw                                   * 4C305
          OBJ_4DA3F                              * 4C30A
        ;                                        * 4C30F

* refs (11): 488FA 48B2F 4BB0C 4BC88 4C4BD 57285 ...
OBJ_4C314:
        ::                                       * 4C314
          15GETLAM                               * 4C319
          17GETLAM                               * 4C31E
          NEWINDEP                               * 4C323
          INDEPVAR                               * 4C328
          15GETLAM                               * 4C32D
          OVER                                   * 4C332
          CREATE                                 * 4C337
          rcl(nm)?;drop                          * 4C33C
          15PUTLAM                               * 4C341
        ;                                        * 4C346

* refs (11): 4BA8F 8B794 8C8CB 8C99B 8CACA 8CC0E ...
OBJ_4C34B:
        ::                                       * 4C34B
          SWAP                                   * 4C350
          DUPTYPEREAL?                           * 4C355
          NOTcasedrop                            * 4C35A
          OBJ_4C22E                              * 4C35F
          GETYPOS                                * 4C364
          1GETLAM                                * 4C369
          SWAP2DUP                               * 4C36E
          PIXON3                                 * 4C373
          OBJ_4C265                              * 4C378
        ;                                        * 4C37D

* refs (1): 4BA3F
OBJ_4C382:
        ::                                       * 4C382
          SWAP                                   * 4C387
          DUPTYPEREAL?                           * 4C38C
          NOTcasedrop                            * 4C391
          OBJ_4C22E                              * 4C396
          15GETLAM                               * 4C39B
          PtoR                                   * 4C3A0
          2DUP                                   * 4C3A5
          PIXON3                                 * 4C3AA
          OBJ_4C265                              * 4C3AF
        ;                                        * 4C3B4

* refs (1): 4BEBD
OBJ_4C3B9:
        ::                                       * 4C3B9
          SWAPDUP                                * 4C3BE
          TYPECMP?                               * 4C3C3
          NOTcasedrop                            * 4C3C8
          OBJ_4C22E                              * 4C3CD
          OBJ_4C41D                              * 4C3D2
          PIXON3                                 * 4C3D7
          DROP                                   * 4C3DC
        ;                                        * 4C3E1

* refs (3): 4BED1 8A4D2 8B1E2
OBJ_4C3E6:
        ::                                       * 4C3E6
          SWAP                                   * 4C3EB
          DUP                                    * 4C3F0
          TYPECMP?                               * 4C3F5
          NOTcasedrop                            * 4C3FA
          OBJ_4C22E                              * 4C3FF
          OBJ_4C41D                              * 4C404
          2DUP                                   * 4C409
          PIXON3                                 * 4C40E
          OBJ_4C265                              * 4C413
        ;                                        * 4C418

* refs (2): 4C3D2 4C404
OBJ_4C41D:
        ::                                       * 4C41D
          C%>%                                   * 4C422
          SWAP                                   * 4C427
          GETXPOS                                * 4C42C
          SWAP                                   * 4C431
          GETYPOS                                * 4C436
        ;                                        * 4C43B

* refs (5): 48A8A 48AD5 48B1B 4C28D 4C2C4
OBJ_4C440:
        ::                                       * 4C440
          21GETLAM                               * 4C445
          SWAP                                   * 4C44A
          UNCOERCE                               * 4C44F
          4PICK                                  * 4C454
          PUTEL                                  * 4C459
          DROP                                   * 4C45E
          20GETLAM                               * 4C463
          SWAP                                   * 4C468
          UNCOERCE                               * 4C46D
          ROT                                    * 4C472
          PUTEL                                  * 4C477
          DROP                                   * 4C47C
        ;                                        * 4C481

* refs (2): 1E1D0 4C300
drax:
        ::                                       * 4C486
          CHECKPICT                              * 4C48B
          BINT0                                  * 4C490
          OBJ_4A874                              * 4C495
          ROTDROP                                * 4C49A
          drax_4C639                             * 4C49F
          DROP                                   * 4C4A4
          ABND                                   * 4C4A9
          ABND                                   * 4C4AE
        ;                                        * 4C4B3

* refs (1): 8CCA2
OBJ_4C4B8:
        ::                                       * 4C4B8
          OBJ_4C314                              * 4C4BD
          OBJ_4C55D                              * 4C4C2
          ZERO_DO                                * 4C4C7
          ERRSET                                 * 4C4CC
          ::                                     * 4C4D1
            15GETLAM                             * 4C4D6
            17GETLAM                             * 4C4DB
            NEWINDEP                             * 4C4E0
            OBJ_50D02                            * 4C4E5
            DUP                                  * 4C4EA
            ALGeq?                               * 4C4EF
            case                                 * 4C4F4
            doerr607                             * 4C4F9
            2PUTLAM                              * 4C4FE
            BEGIN                                * 4C503
            OBJ_4C166                            * 4C508
            NEXTSTEP                             * 4C50D
            LASTPT?                              * 4C512
            UNTIL                                * 4C517
            PlotOneMore?                         * 4C51C
            NOT?SEMI                             * 4C521
            OBJ_4C166                            * 4C526
          ;                                      * 4C52B
          ERRTRAP                                * 4C530
          PLOTERR                                * 4C535
          OBJ_4C082                              * 4C53A
          LOOP                                   * 4C53F
          ATTNFLGCLR                             * 4C544
          18GETLAM                               * 4C549
          RESETDEPTH                             * 4C54E
          OBJ_4C0E4                              * 4C553
        ;                                        * 4C558

* refs (1): 4C4C2
OBJ_4C55D:
        ::                                       * 4C55D
          RclDepnd                               * 4C562
          DUPTYPELIST?                           * 4C567
          ITE                                    * 4C56C
          ::                                     * 4C571
            INCOMPDROP                           * 4C576
            SWAP                                 * 4C57B
            DUPTYPEARRY?                         * 4C580
            IT                                   * 4C585
            OBJ_56B87                            * 4C58A
            sort(2r)                             * 4C58F
          ;                                      * 4C594

RclYminYmax:
          ::                                     * 4C599
            GETPMIN&MAX                          * 4C59E
            C%>%                                 * 4C5A3
            SWAPDROP                             * 4C5A8
            SWAP                                 * 4C5AD
            C%>%                                 * 4C5B2
            SWAPDROP                             * 4C5B7
            SWAP                                 * 4C5BC
          ;                                      * 4C5C1
          DUP                                    * 4C5C6
          1PUTLAM                                * 4C5CB
          TOTEMPOB                               * 4C5D0
          3PICK                                  * 4C5D5
          CREATE                                 * 4C5DA
          OBJ_6FFB7                              * 4C5DF
          %-                                     * 4C5E4
          12PUTLAM                               * 4C5E9
          rcl(nm)?;drop                          * 4C5EE
          3PUTLAM                                * 4C5F3
        ;                                        * 4C5F8

* refs (1): 6C87D
2/(s);swap;2/(s):
        ::                                       * 4C5FD
          #2/                                    * 4C602
          SWAP                                   * 4C607
          #2/                                    * 4C60C
        ;                                        * 4C611

* refs (2): 4BBC0 4EDCA
OBJ_4C616:
        ::                                       * 4C616
          rceq!                                  * 4C61B
          INDEX@                                 * 4C620
          #0=ITE                                 * 4C625
          OBJ_4B62F                              * 4C62A
          OBJ_4B733                              * 4C62F
        ;                                        * 4C634

* refs (1): 4C49F
drax_4C639:
        ::                                       * 4C639
          RclMaxStdPict                          * 4C63E
          OBJ_451E1                              * 4C643
        ;                                        * 4C648

* refs (5): 45083 451AA 465D6 4EF0F D410E
OBJ_4C64D:
        ::                                       * 4C64D
          DUPTYPEREAL?                           * 4C652
          OVER                                   * 4C657
          TYPEHSTR?                              * 4C65C
          OR                                     * 4C661
          OVER                                   * 4C666
          TYPELIST?                              * 4C66B
          OR                                     * 4C670
          NOTcasedrop                            * 4C675
          FALSE                                  * 4C67A
          DUPTYPELIST?                           * 4C67F
          NOTcasedrop                            * 4C684
          TRUE                                   * 4C689
          INNERCOMP                              * 4C68E
          DUP                                    * 4C693
          #2=                                    * 4C698
          NOTcase                                * 4C69D
          ::                                     * 4C6A2
            NDROP                                * 4C6A7
            FALSE                                * 4C6AC
          ;                                      * 4C6B1
          DROP                                   * 4C6B6
          DUPTYPEREAL?                           * 4C6BB
          casedrop                               * 4C6C0
          TYPEREAL?                              * 4C6C5
          TYPEHSTR?                              * 4C6CA
          SWAP                                   * 4C6CF
          TYPEHSTR?                              * 4C6D4
          AND                                    * 4C6D9
        ;                                        * 4C6DE

* refs (2): 4A9E7 4B53B
OBJ_4C6E3:
        ::                                       * 4C6E3
          TYPECSTR?                              * 4C6E8
          OBJ_514C3                              * 4C6ED
          TYPECSTR?                              * 4C6F2
          OBJ_514C3                              * 4C6F7
        ;                                        * 4C6FC

* refs (1): 4A8A6
OBJ_4C701:
        ::                                       * 4C701
          DUPTYPELIST?                           * 4C706
          NOT?SEMI                               * 4C70B
          INNERCOMP                              * 4C710
          BINT2                                  * 4C715
          EQcase                                 * 4C71A
          {}N                                    * 4C71F
          BINT3                                  * 4C724
          EQUAL                                  * 4C729
          case2DROP                              * 4C72E
          2DROP                                  * 4C733
          TWO{}N                                 * 4C738
        ;                                        * 4C73D

* refs (2): 4536C 4542F
OBJ_4C742:
        ::                                       * 4C742
          2DUP                                   * 4C747
          DUP                                    * 4C74C
          6ROLL                                  * 4C751
          #1-                                    * 4C756
          #=?SKIP                                * 4C75B
          #1+                                    * 4C760
          PIXON3                                 * 4C765
          DUP#0=                                 * 4C76A
          ?SKIP                                  * 4C76F
          #1-                                    * 4C774
          PIXON3                                 * 4C779
        ;                                        * 4C77E

* refs (2): 4556A 45628
OBJ_4C783:
        ::                                       * 4C783
          2DUP                                   * 4C788
          SWAPDUP                                * 4C78D
          6PICK                                  * 4C792
          #1-                                    * 4C797
          #=?SKIP                                * 4C79C
          #1+                                    * 4C7A1
          SWAP                                   * 4C7A6
          PIXON3                                 * 4C7AB
          SWAP                                   * 4C7B0
          DUP#0=                                 * 4C7B5
          ?SKIP                                  * 4C7BA
          #1-                                    * 4C7BF
          SWAP                                   * 4C7C4
          PIXON3                                 * 4C7C9
        ;                                        * 4C7CE

* refs (1): 4BCE2
OBJ_4C7D3:
        ::                                       * 4C7D3
          SWAPDUP                                * 4C7D8
          TYPECMP?                               * 4C7DD
          ITE                                    * 4C7E2
          ::                                     * 4C7E7
            C%>%                                 * 4C7EC
            %0=                                  * 4C7F1
          ;                                      * 4C7F6
          TRUE                                   * 4C7FB
          case                                   * 4C800
          ::                                     * 4C805
            DUPTYPEREAL?                         * 4C80A
            NOTcasedrop                          * 4C80F
            OBJ_4C22E                            * 4C814
            GETYPOS                              * 4C819
            1GETLAM                              * 4C81E
            SWAP                                 * 4C823
            PIXON3                               * 4C828
            DROP                                 * 4C82D
          ;                                      * 4C832
          DROP                                   * 4C837
          OBJ_4C22E                              * 4C83C
        ;                                        * 4C841

* refs (1): 4BCF6
OBJ_4C846:
        ::                                       * 4C846
          SWAP                                   * 4C84B
          DUP                                    * 4C850
          TYPECMP?                               * 4C855
          ITE                                    * 4C85A
          ::                                     * 4C85F
            C%>%                                 * 4C864
            %0=                                  * 4C869
          ;                                      * 4C86E
          TRUE                                   * 4C873
          case                                   * 4C878
          ::                                     * 4C87D
            DUPTYPEREAL?                         * 4C882
            NOTcasedrop                          * 4C887
            OBJ_4C22E                            * 4C88C
            GETYPOS                              * 4C891
            1GETLAM                              * 4C896
            SWAP2DUP                             * 4C89B
            PIXON3                               * 4C8A0
            OBJ_4C265                            * 4C8A5
          ;                                      * 4C8AA
          DROP                                   * 4C8AF
          OBJ_4C22E                              * 4C8B4
        ;                                        * 4C8B9

* refs (3): 4BCC4 4C4F9 B63EE
doerr607:
        CON(5)  (*)+5                            * 4C8BE  primitive code object
        ASSEMBLE
        LC(5)   #00607                           * 4C8C3
        GOVLNG  ErrjmpC                          * 4C8CA
        RPL

* refs (1): 8CD81
OBJ_4C8D1:
        ::                                       * 4C8D1
          RclXYCol&äDAT                          * 4C8D6
          DUP                                    * 4C8DB
          MDIMSDROP                              * 4C8E0
          5UNROLL                                * 4C8E5
          #1+_ONE_DO                             * 4C8EA
          OVER                                   * 4C8EF
          PULLREALEL                             * 4C8F4
          GETYPOS                                * 4C8F9
          SWAP4PICK                              * 4C8FE
          PULLREALEL                             * 4C903
          GETXPOS                                * 4C908
          ROT                                    * 4C90D
          PIXON3                                 * 4C912
          ROT                                    * 4C917
          4PICK#+                                * 4C91C
          ROT                                    * 4C921
          4PICK#+                                * 4C926
          ROT                                    * 4C92B
          OBJ_4C082                              * 4C930
          LOOP                                   * 4C935
          4DROP                                  * 4C93A
        ;                                        * 4C93F

* refs (3): 20122 4D9BB B7ED7
bins(3r):
        ::                                       * 4C944
          %CEIL                                  * 4C949
          COERCE                                 * 4C94E
          DUP                                    * 4C953
          #       FFFFD                          * 4C958  1048573
          #>                                     * 4C962
          case                                   * 4C967
          SETSIZEERR                             * 4C96C
          2DUP                                   * 4C971
          UNCOERCE                               * 4C976
          %*                                     * 4C97B
          4PICK                                  * 4C980
          %+                                     * 4C985
          OVER                                   * 4C98A

{'xmax,'N}:
          {                                      * 4C98F

Π'xmax:
            LAM     'xmax                        * 4C994

Π'N:
            LAM     'N                           * 4C9A5
          }                                      * 4C9B0
          BIND                                   * 4C9B5
          %0_2A2B4                               * 4C9BA
          SWAP                                   * 4C9BF
          #2+                                    * 4C9C4
          NDUPN                                  * 4C9C9
          #1-DUP                                 * 4C9CE
          #3+                                    * 4C9D3
          ROLL                                   * 4C9D8
          OVER                                   * 4C9DD
          #4+                                    * 4C9E2
          ROLL                                   * 4C9E7
          OBJ_4CA00                              * 4C9EC
          ABND                                   * 4C9F1
          OBJ_4CAD2                              * 4C9F6
        ;                                        * 4C9FB

* refs (1): 4C9EC
OBJ_4CA00:
        ::                                       * 4CA00
          STATGETXCOL                            * 4CA05
          rclä                                   * 4CA0A
          DUP                                    * 4CA0F
          MDIMS                                  * 4CA14
          ITE                                    * 4CA19
          ::                                     * 4CA1E
            DUP                                  * 4CA23
            UNCOERCE                             * 4CA28
            5PICK                                * 4CA2D
            %<                                   * 4CA32
            case                                 * 4CA37
            OBJ_2D2E7                            * 4CA3C
            4UNROLLROT                           * 4CA41
            COERCE                               * 4CA46
            3UNROLL                              * 4CA4B
          ;                                      * 4CA50
          ::                                     * 4CA55
            ROTDROP                              * 4CA5A
            BINT1                                * 4CA5F
            3UNROLL                              * 4CA64
            BINT1                                * 4CA69
            3UNROLL                              * 4CA6E
          ;                                      * 4CA73
          #1+_ONE_DO                             * 4CA78
          OVER                                   * 4CA7D
          PULLREALEL                             * 4CA82
          5PICK                                  * 4CA87
          7PICK                                  * 4CA8C
          OBJ_4EF1E                              * 4CA91
          6UNROLL                                * 4CA96
          SWAP3PICK                              * 4CA9B
          #+SWAP                                 * 4CAA0
          LOOP                                   * 4CAA5
          MDIMS                                  * 4CAAA
          IT                                     * 4CAAF
          DROP                                   * 4CAB4
          5UNROLL                                * 4CAB9
          4DROP                                  * 4CABE
        ;                                        * 4CAC3
        BSS     10                               * 4CAC8

* refs (1): 4C9F6
OBJ_4CAD2:
        ::                                       * 4CAD2
          ZERO_DO                                * 4CAD7
          ISTOP-INDEX                            * 4CADC
          DUP                                    * 4CAE1
          #2+PICK                                * 4CAE6
          ROT2DUP                                * 4CAEB
          #<ITE                                  * 4CAF0
          ::                                     * 4CAF5
            2DROP                                * 4CAFA
            BINT0                                * 4CAFF
          ;                                      * 4CB04
          #-                                     * 4CB09
          #+                                     * 4CB0E
          #1+DUP                                 * 4CB13
          #1+ROLL                                * 4CB18
          %1+                                    * 4CB1D
          SWAP                                   * 4CB22
          UNROLL                                 * 4CB27
          LOOP                                   * 4CB2C
          DUPUNROT                               * 4CB31
          #1+UNROLL                              * 4CB36
          #1-                                    * 4CB3B
          UNCOERCE                               * 4CB40
          %1                                     * 4CB45
          TWO{}N                                 * 4CB4A
          XEQ>ARRAY                              * 4CB4F
          3UNROLL                                * 4CB54
          %2                                     * 4CB59
          XEQ>VECTOR                             * 4CB5E
        ;                                        * 4CB63

* refs (2): 4D9C5 4D9F7
OBJ_4CB68:
        ::                                       * 4CB68
          15GETLAM                               * 4CB6D
          6GETLAM                                * 4CB72
          10GETLAM                               * 4CB77
          getxpos                                * 4CB7C
          SWAP                                   * 4CB81
          #0=                                    * 4CB86
          OVER                                   * 4CB8B
          #0<>                                   * 4CB90
          ANDcase                                * 4CB95
          ERRJMP                                 * 4CB9A
          4GETLAM                                * 4CB9F
          10GETLAM                               * 4CBA4
          %%>%                                   * 4CBA9
          %*                                     * 4CBAE
          ROT                                    * 4CBB3
          4ROLL                                  * 4CBB8
          DUP                                    * 4CBBD
          MDIMSDROP                              * 4CBC2
          4UNROLL                                * 4CBC7
          ZERO_DO                                * 4CBCC
          OVER                                   * 4CBD1
          PULLREALEL                             * 4CBD6
          DUP                                    * 4CBDB
          %0_2A2B4                               * 4CBE0
          %<                                     * 4CBE5
          3UNROLL                                * 4CBEA
          5GETLAM                                * 4CBEF
          9GETLAM                                * 4CBF4
          getypos                                * 4CBF9
          SWAP                                   * 4CBFE
          #0=                                    * 4CC03
          IT                                     * 4CC08
          DROPZERO                               * 4CC0D
          DUP                                    * 4CC12
          5GETLAM                                * 4CC17
          %%>%                                   * 4CC1C
          COERCE                                 * 4CC21
          2DUP#>                                 * 4CC26
          ?SKIPSWAP                              * 4CC2B
          #-                                     * 4CC30
          4ROLL                                  * 4CC35
          IT                                     * 4CC3A
          ::                                     * 4CC3F
            SWAPDROP                             * 4CC44
            5GETLAM                              * 4CC49
            %%>%                                 * 4CC4E
            COERCESWAP                           * 4CC53
          ;                                      * 4CC58
          INDEX@                                 * 4CC5D
          DUP#1+                                 * 4CC62
          UNCOERCE2                              * 4CC67

* refs (1): 4CC99
OBJ_4CC6C:
          ::                                     * 4CC6C
            8PICK                                * 4CC71
            %*                                   * 4CC76
            COERCE                               * 4CC7B
            BINT9                                * 4CC80
            PICK                                 * 4CC85
            #+                                   * 4CC8A
          ;                                      * 4CC8F
          SWAP                                   * 4CC94
          OBJ_4CC6C                              * 4CC99
          DUP                                    * 4CC9E
          5UNROLL                                * 4CCA3
          #-DUP                                  * 4CCA8
          #>1                                    * 4CCAD
          IT                                     * 4CCB2
          ::                                     * 4CCB7
            #1-                                  * 4CCBC
            4ROLL                                * 4CCC1
            #1+                                  * 4CCC6
            4UNROLL                              * 4CCCB
          ;                                      * 4CCD0
          OBJ_4CCF8                              * 4CCD5
          SWAP3PICK                              * 4CCDA
          #+SWAP                                 * 4CCDF
          OBJ_4C082                              * 4CCE4
          LOOP                                   * 4CCE9
          5DROP                                  * 4CCEE
        ;                                        * 4CCF3

* refs (1): 4CCD5
OBJ_4CCF8:
        ::                                       * 4CCF8
          OVER                                   * 4CCFD
          #0=case                                * 4CD02
          4DROP                                  * 4CD07
          GBUFFGROBDIM                           * 4CD0C
          6PICK                                  * 4CD11
          OVER#<                                 * 4CD16
          NOTcase                                * 4CD1B
          ::                                     * 4CD20
            6DROP                                * 4CD25
            ExitAtLOOP                           * 4CD2A
          ;                                      * 4CD2F
          5PICK                                  * 4CD34
          3PICK                                  * 4CD39
          #<                                     * 4CD3E
          NOTcase                                * 4CD43
          6DROP                                  * 4CD48
          OVER5PICK                              * 4CD4D
          7PICK                                  * 4CD52
          #+                                     * 4CD57
          #<                                     * 4CD5C
          IT                                     * 4CD61
          ::                                     * 4CD66
            4ROLLDROP                            * 4CD6B
            OVER5PICK                            * 4CD70
            #-                                   * 4CD75
            4UNROLL                              * 4CD7A
          ;                                      * 4CD7F
          DUP                                    * 4CD84
          4PICK                                  * 4CD89
          8PICK                                  * 4CD8E
          #+                                     * 4CD93
          #<ITE                                  * 4CD98
          ::                                     * 4CD9D
            ROTROT2DROP                          * 4CDA2
            4PICK                                * 4CDA7
            #-                                   * 4CDAC
          ;                                      * 4CDB1
          2DROP                                  * 4CDB6
          MAKEGROB                               * 4CDBB
          INVGROB                                * 4CDC0
          GBUFF                                  * 4CDC5
          2SWAP                                  * 4CDCA
          GROB!                                  * 4CDCF
        ;                                        * 4CDD4

* refs (1): 4BA2B
OBJ_4CDD9:
        ::                                       * 4CDD9
          SWAP                                   * 4CDDE
          DUPTYPEREAL?                           * 4CDE3
          NOTcasedrop                            * 4CDE8
          OBJ_4C22E                              * 4CDED
          15GETLAM                               * 4CDF2
          PtoR                                   * 4CDF7
          PIXON3                                 * 4CDFC
          DROP                                   * 4CE01
        ;                                        * 4CE06

* refs (10): 4BA7B 8C8B7 8C987 8CAB6 8CBFA 8CCDE ...
OBJ_4CE0B:
        ::                                       * 4CE0B
          SWAP                                   * 4CE10
          DUPTYPEREAL?                           * 4CE15
          NOTcasedrop                            * 4CE1A
          OBJ_4C22E                              * 4CE1F
          SWAPDROP                               * 4CE24
          GETYPOS                                * 4CE29
          1GETLAM                                * 4CE2E
          SWAP                                   * 4CE33
          PIXON3                                 * 4CE38
        ;                                        * 4CE3D
        BSS     10                               * 4CE42

* refs (16): 46C0C 48FEA 4B873 4D10F 4D4AC 4DA94 ...
EXITFCNsto:
        ::                                       * 4CE4C
          TakeOver                               * 4CE51
          'R                                     * 4CE56
          '                                      * 4CE5B
          ExitFcn                                * 4CE60
          STO                                    * 4CE65
        ;                                        * 4CE6A

* ->
* refs (1): 4F036
DOGRAPHIC:
        ::                                       * 4CE6F
          GDISPCENTER                            * 4CE74
          OBJ_4CE83                              * 4CE79
        ;                                        * 4CE7E

* refs (5): 4CE79 4D4B1 6A8D3 6B547 6C393
OBJ_4CE83:
        ::                                       * 4CE83
          TURNMENUOFF                            * 4CE88
          OBJ_46BA7                              * 4CE8D
          'NOP                                   * 4CE92
          '                                      * 4CE97
          OBJ_4CF8E                              * 4CE9C
          TrueTrue                               * 4CEA1
          NULL{}                                 * 4CEA6
          ONEFALSE'                              * 4CEAB
          GraphicExit                            * 4CEB0
          '                                      * 4CEB5
          ::                                     * 4CEBA
            ClrDAsOK                             * 4CEBF
            ERRJMP                               * 4CEC4
          ;                                      * 4CEC9
          ClrDA1IsStat                           * 4CECE
          ParOuterLoop                           * 4CED3
          COLA                                   * 4CED8
          OBJ_5108F                              * 4CEDD
        ;                                        * 4CEE2

* refs (4): 45AF5 4CEB0 69C1E 73275
GraphicExit:
        ::                                       * 4CEE7
          ExitFcn                                * 4CEEC
          'NOP                                   * 4CEF1
          EQ                                     * 4CEF6
          NOT                                    * 4CEFB
        ;                                        * 4CF00

* ->
* refs (7): 488B4 48A3F 4B661 4C2D3 4CE74 4DA44 ...
GDISPCENTER:
        ::                                       * 4CF05
          CHECKPICT                              * 4CF0A
          GBUFFGROBDIM                           * 4CF0F
          BINT131                                * 4CF14
          #-#2/                                  * 4CF19
          SWAP                                   * 4CF1E
          BINT64                                 * 4CF23
          #-#2/                                  * 4CF28
          SWAP                                   * 4CF2D
          TOGDISP                                * 4CF32
          WINDOWXY                               * 4CF37
        ;                                        * 4CF3C

SETLOOPENV:
        ::                                       * 4CF41
          FALSE                                  * 4CF46
          'NOP                                   * 4CF4B
          {                                      * 4CF50

Π'EnvOK_4CF55:
            LAM     'EnvOK                       * 4CF55

* refs (6): 4780D 4CE60 4CEEC 51099 69C37 6B5B5
ExitFcn:
            LAM     'EXITFCN                     * 4CF68
          }                                      * 4CF7F
          BIND                                   * 4CF84
        ;                                        * 4CF89

* refs (1): 4CE9C
OBJ_4CF8E:
        ::                                       * 4CF8E
          SWAP                                   * 4CF93
          BINT11                                 * 4CF98
          #=casedrop                             * 4CF9D
          ::                                     * 4CFA2
            BINT1                                * 4CFA7
            ?CaseKeyDef                          * 4CFAC
            SCROLLUP                             * 4CFB1
            BINT3                                * 4CFB6
            ?CaseKeyDef                          * 4CFBB
            JUMPTOP                              * 4CFC0
            DROPDEADTRUE                         * 4CFC5
          ;                                      * 4CFCA
          BINT16                                 * 4CFCF
          #=casedrop                             * 4CFD4
          ::                                     * 4CFD9
            BINT1                                * 4CFDE
            ?CaseKeyDef                          * 4CFE3
            SCROLLLEFT                           * 4CFE8
            BINT2                                * 4CFED
            ?CaseKeyDef                          * 4CFF2
            OBJ_4D0E7                            * 4CFF7
            BINT3                                * 4CFFC
            ?CaseKeyDef                          * 4D001
            JUMPLEFT                             * 4D006
            DROPDEADTRUE                         * 4D00B
          ;                                      * 4D010
          BINT17                                 * 4D015
          #=casedrop                             * 4D01A
          ::                                     * 4D01F
            BINT1                                * 4D024
            ?CaseKeyDef                          * 4D029
            SCROLLDOWN                           * 4D02E
            BINT3                                * 4D033
            ?CaseKeyDef                          * 4D038
            JUMPBOT                              * 4D03D
            DROPDEADTRUE                         * 4D042
          ;                                      * 4D047
          BINT18                                 * 4D04C
          #=casedrop                             * 4D051
          ::                                     * 4D056
            BINT1                                * 4D05B
            ?CaseKeyDef                          * 4D060
            SCROLLRIGHT                          * 4D065
            BINT3                                * 4D06A
            ?CaseKeyDef                          * 4D06F
            JUMPRIGHT                            * 4D074
            DROPDEADTRUE                         * 4D079
          ;                                      * 4D07E
          BINT45                                 * 4D083
          #=casedrop                             * 4D088
          ::                                     * 4D08D
            BINT1                                * 4D092
            ?CaseKeyDef                          * 4D097
            OBJ_4DA8F                            * 4D09C
            BINT3                                * 4D0A1
            ?CaseKeyDef                          * 4D0A6
            TurnOffKey                           * 4D0AB
            DROPDEADTRUE                         * 4D0B0
          ;                                      * 4D0B5
          SWAPDROP                               * 4D0BA
          BINT35                                 * 4D0BF
          #=casedrop                             * 4D0C4
          FALSE                                  * 4D0C9
          BINT40                                 * 4D0CE
          #=case                                 * 4D0D3
          FALSE                                  * 4D0D8
          'DoBadKeyT                             * 4D0DD
        ;                                        * 4D0E2

* refs (1): 4CFF7
OBJ_4D0E7:
        ::                                       * 4D0E7
          TakeOver                               * 4D0EC
          OBJ_6DE82                              * 4D0F1
          case                                   * 4D0F6
          ::                                     * 4D0FB
            ATTNFLGCLR                           * 4D100
            OBJ_4DA8F                            * 4D105
          ;                                      * 4D10A
          EXITFCNsto                             * 4D10F
          OBJ_4D1AA                              * 4D114
        ;                                        * 4D119

* ob -> DoBadKey T
* refs (11): 4CFC5 4D00B 4D042 4D079 4D0B0 4D7EA ...
DROPDEADTRUE:
        ::                                       * 4D11E
          DROP                                   * 4D123
          'DoBadKeyT                             * 4D128
        ;                                        * 4D12D

* ->
* refs (2): 4CFB1 9CF00
SCROLLUP:
        ::                                       * 4D132
          TakeOver                               * 4D137
          REPEATER                               * 4D13C
          BINT11                                 * 4D141
          WINDOWUP                               * 4D146
        ;                                        * 4D14B

* ->
* refs (2): 4CFE8 9CF1E
SCROLLLEFT:
        ::                                       * 4D150
          TakeOver                               * 4D155
          REPEATER                               * 4D15A
          BINT16                                 * 4D15F
          WINDOWLEFT                             * 4D164
        ;                                        * 4D169

* ->
* refs (2): 4D02E 9CF0F
SCROLLDOWN:
        ::                                       * 4D16E
          TakeOver                               * 4D173
          REPEATER                               * 4D178
          BINT17                                 * 4D17D
          WINDOWDOWN                             * 4D182
        ;                                        * 4D187

* ->
* refs (2): 4D065 9CF2D
SCROLLRIGHT:
        ::                                       * 4D18C
          TakeOver                               * 4D191
          REPEATER                               * 4D196
          BINT18                                 * 4D19B
          WINDOWRIGHT                            * 4D1A0
        ;                                        * 4D1A5

* refs (2): 4D114 4DA4E
OBJ_4D1AA:
        ::                                       * 4D1AA
          BINT0                                  * 4D1AF
          OBJ_6FFFD                              * 4D1B4
          GETRES                                 * 4D1B9
          GetRes                                 * 4D1BE
          4PUTLAM                                * 4D1C3
          3DROP                                  * 4D1C8
          COLA                                   * 4D1CD
          OBJ_4D1DC                              * 4D1D2
        ;                                        * 4D1D7

* refs (2): 48A44 4D1D2
OBJ_4D1DC:
        ::                                       * 4D1DC
          GBUFFGROBDIM                           * 4D1E1
          #1-                                    * 4D1E6
          14PUTLAM                               * 4D1EB
          #1-                                    * 4D1F0
          13PUTLAM                               * 4D1F5
          WINDOWCORNER                           * 4D1FA
          #       41                             * 4D1FF  65
          #+                                     * 4D209
          TOTEMPOB                               * 4D20E
          8PUTLAM                                * 4D213
          BINT32                                 * 4D218
          #+                                     * 4D21D
          TOTEMPOB                               * 4D222
          7PUTLAM                                * 4D227
          16GETLAM                               * 4D22C
          20PUTLAM                               * 4D231
          4GETLAM                                * 4D236
          21PUTLAM                               * 4D23B
          BINT1                                  * 4D240
          BINT27                                 * 4D245
          PUTLAM                                 * 4D24A
          BINT0                                  * 4D24F
          16PUTLAM                               * 4D254
          OBJ_73684                              * 4D259
          %0_2A2B4                               * 4D25E
          TOTEMPOB                               * 4D263
          1PUTLAM                                * 4D268
          BINT0                                  * 4D26D
          TOTEMPOB                               * 4D272
          4PUTLAM                                * 4D277
          GETPTYPE                               * 4D27C
          DUP                                    * 4D281
          OBJ_731B7                              * 4D286
          IT                                     * 4D28B
          OBJ_4638C                              * 4D290
          OBJ_732C2                              * 4D295
          22PUTLAM                               * 4D29A
          CROSS_HAIRS                            * 4D29F
          1GETLAM                                * 4D2A4
          BINT28                                 * 4D2A9
          ONE_DO                                 * 4D2AE
          ISTOP-INDEX                            * 4D2B3
          #1+                                    * 4D2B8
          GETLAM                                 * 4D2BD
          LOOP                                   * 4D2C2
          ABND                                   * 4D2C7
          ABND                                   * 4D2CC
          OBJ_46BA7                              * 4D2D1
          GETPTYPE                               * 4D2D6
          OBJ_731F8                              * 4D2DB
          '                                      * 4D2E0
          ::                                     * 4D2E5
            DUP                                  * 4D2EA

* refs (1): 330FD
OBJ_4D2EF:
            ::                                   * 4D2EF
              BINT3                              * 4D2F4
              #>                                 * 4D2F9
            ;                                    * 4D2FE
            case2drop                            * 4D303
            'DoBadKeyT                           * 4D308
            SWAP                                 * 4D30D
            DUP#<7                               * 4D312
            case2drpfls                          * 4D317
            BINT11                               * 4D31C
            #=casedrop                           * 4D321
            ::                                   * 4D326
              BINT3                              * 4D32B
              ?CaseKeyDef                        * 4D330
              ::                                 * 4D335
                TakeOver                         * 4D33A
                OBJ_73602                        * 4D33F
                caseDoBadKey                     * 4D344
                OBJ_735EE                        * 4D349
                caseDoBadKey                     * 4D34E
                WINDOWTOP?                       * 4D353
                IT                               * 4D358
                JUMPTOP                          * 4D35D
                BINT7                            * 4D362
                TOPROW                           * 4D367
                OBJ_47021                        * 4D36C
              ;                                  * 4D371
              BINT2                              * 4D376
              ?CaseKeyDef                        * 4D37B
              DoBadKey                           * 4D380
              DROP'                              * 4D385
              ::                                 * 4D38A
                TakeOver                         * 4D38F
                OBJ_73602                        * 4D394
                case                             * 4D399
                ::                               * 4D39E
                  BINT3                          * 4D3A3
                  OBJ_735CB                      * 4D3A8
                ;                                * 4D3AD
                OBJ_5102B                        * 4D3B2
                OBJ_4BF5D                        * 4D3B7
                OBJ_735EE                        * 4D3BC
                case                             * 4D3C1
                ::                               * 4D3C6
                  OBJ_46E28                      * 4D3CB
                  BINT11                         * 4D3D0
                  OBJ_48238                      * 4D3D5
                ;                                * 4D3DA
                OBJ_7361B                        * 4D3DF
                case                             * 4D3E4
                ::                               * 4D3E9
                  OBJ_46E28                      * 4D3EE
                  BINT11                         * 4D3F3
                  OBJ_4DCEC                      * 4D3F8
                ;                                * 4D3FD
                OBJ_46E28                        * 4D402
                BINT11                           * 4D407
                ::                               * 4D40C
                  WINDOWTOP?                     * 4D411
                  IT                             * 4D416
                  WINDOWUP                       * 4D41B
                  CROSS_OFF                      * 4D420
                  7GETLAM                        * 4D425
                  !#1-IF>0                       * 4D42A
                  OBJ_4703F                      * 4D42F
                ;                                * 4D434
              ;                                  * 4D439
              TRUE                               * 4D43E
            ;                                    * 4D443
            BINT16                               * 4D448
            #=casedrop                           * 4D44D
            ::                                   * 4D452
              BINT3                              * 4D457
              ?CaseKeyDef                        * 4D45C
              ::                                 * 4D461
                TakeOver                         * 4D466
                OBJ_73602                        * 4D46B
                caseDoBadKey                     * 4D470
                OBJ_735EE                        * 4D475
                caseDoBadKey                     * 4D47A
                WINDOWLEFT?                      * 4D47F
                IT                               * 4D484
                JUMPLEFT                         * 4D489
                LEFTCOL                          * 4D48E
                OBJ_4728B                        * 4D493
              ;                                  * 4D498
              BINT2                              * 4D49D
              ?CaseKeyDef                        * 4D4A2
              ::                                 * 4D4A7
                EXITFCNsto                       * 4D4AC
                OBJ_4CE83                        * 4D4B1
              ;                                  * 4D4B6
              DROP'                              * 4D4BB
              ::                                 * 4D4C0
                TakeOver                         * 4D4C5
                OBJ_73602                        * 4D4CA
                case                             * 4D4CF
                OBJ_736AC                        * 4D4D4
                OBJ_5102B                        * 4D4D9
                OBJ_0C811                        * 4D4DE
                OBJ_735EE                        * 4D4E3
                case                             * 4D4E8
                ::                               * 4D4ED
                  OBJ_46E28                      * 4D4F2
                  BINT16                         * 4D4F7
                  OBJ_4881E                      * 4D4FC
                ;                                * 4D501
                OBJ_7361B                        * 4D506
                case                             * 4D50B
                ::                               * 4D510
                  OBJ_46E28                      * 4D515
                  BINT16                         * 4D51A
                  OBJ_4DDAF                      * 4D51F
                ;                                * 4D524
                OBJ_46E28                        * 4D529
                BINT16                           * 4D52E
                OBJ_470E9                        * 4D533
              ;                                  * 4D538
              TRUE                               * 4D53D
            ;                                    * 4D542
            BINT18                               * 4D547
            #=casedrop                           * 4D54C
            ::                                   * 4D551
              BINT3                              * 4D556
              ?CaseKeyDef                        * 4D55B
              ::                                 * 4D560
                TakeOver                         * 4D565
                OBJ_73602                        * 4D56A
                caseDoBadKey                     * 4D56F
                OBJ_735EE                        * 4D574
                caseDoBadKey                     * 4D579
                WINDOWRIGHT?                     * 4D57E
                IT                               * 4D583
                JUMPRIGHT                        * 4D588
                RIGHTCOL                         * 4D58D
                OBJ_4728B                        * 4D592
              ;                                  * 4D597
              BINT2                              * 4D59C
              ?CaseKeyDef                        * 4D5A1
              DoBadKey                           * 4D5A6
              DROP'                              * 4D5AB
              ::                                 * 4D5B0
                TakeOver                         * 4D5B5
                OBJ_73602                        * 4D5BA
                case                             * 4D5BF
                OBJ_736F7                        * 4D5C4
                OBJ_5102B                        * 4D5C9
                OBJ_0C811                        * 4D5CE
                OBJ_735EE                        * 4D5D3
                case                             * 4D5D8
                ::                               * 4D5DD
                  OBJ_46E28                      * 4D5E2
                  BINT18                         * 4D5E7
                  OBJ_4842C                      * 4D5EC
                ;                                * 4D5F1
                OBJ_7361B                        * 4D5F6
                case                             * 4D5FB
                ::                               * 4D600
                  OBJ_46E28                      * 4D605
                  BINT18                         * 4D60A
                  OBJ_4DDE6                      * 4D60F
                ;                                * 4D614
                OBJ_46E28                        * 4D619
                BINT18                           * 4D61E
                OBJ_470B7                        * 4D623
              ;                                  * 4D628
              TRUE                               * 4D62D
            ;                                    * 4D632
            BINT17                               * 4D637
            #=casedrop                           * 4D63C
            ::                                   * 4D641
              BINT3                              * 4D646
              ?CaseKeyDef                        * 4D64B
              ::                                 * 4D650
                TakeOver                         * 4D655
                OBJ_73602                        * 4D65A
                caseDoBadKey                     * 4D65F
                OBJ_735EE                        * 4D664
                caseDoBadKey                     * 4D669
                WINDOWBOT?                       * 4D66E
                IT                               * 4D673
                JUMPBOT                          * 4D678
                BINT7                            * 4D67D
                BOTROW                           * 4D682
                OBJ_47021                        * 4D687
              ;                                  * 4D68C
              BINT2                              * 4D691
              ?CaseKeyDef                        * 4D696
              OBJ_48873                          * 4D69B
              DROP'                              * 4D6A0
              ::                                 * 4D6A5
                TakeOver                         * 4D6AA
                OBJ_73602                        * 4D6AF
                case                             * 4D6B4
                ::                               * 4D6B9
                  BINT4                          * 4D6BE
                  OBJ_735CB                      * 4D6C3
                ;                                * 4D6C8
                OBJ_5102B                        * 4D6CD
                OBJ_4BF5D                        * 4D6D2
                OBJ_735EE                        * 4D6D7
                case                             * 4D6DC
                ::                               * 4D6E1
                  OBJ_46E28                      * 4D6E6
                  BINT17                         * 4D6EB
                  OBJ_481D9                      * 4D6F0
                ;                                * 4D6F5
                OBJ_7361B                        * 4D6FA
                case                             * 4D6FF
                ::                               * 4D704
                  OBJ_46E28                      * 4D709
                  BINT17                         * 4D70E
                  OBJ_4DD73                      * 4D713
                ;                                * 4D718
                OBJ_46E28                        * 4D71D
                BINT17                           * 4D722
                ::                               * 4D727
                  WINDOWBOT?                     * 4D72C
                  IT                             * 4D731
                  WINDOWDOWN                     * 4D736
                  CROSS_OFF                      * 4D73B
                  7GETLAM                        * 4D740
                  13GETLAM                       * 4D745
                  !#1+IF<dim-1                   * 4D74A
                  OBJ_4703F                      * 4D74F
                ;                                * 4D754
              ;                                  * 4D759
              TRUE                               * 4D75E
            ;                                    * 4D763
            BINT12                               * 4D768
            #=casedrop                           * 4D76D
            ::                                   * 4D772
              BINT1                              * 4D777
              ?CaseKeyDef                        * 4D77C
              ::                                 * 4D781
                CHECKMENU                        * 4D786
                DoNextRow                        * 4D78B
                DispMenu                         * 4D790
              ;                                  * 4D795
              BINT2                              * 4D79A
              ?CaseKeyDef                        * 4D79F
              ::                                 * 4D7A4
                CHECKMENU                        * 4D7A9
                DoPrevRow                        * 4D7AE
                DispMenu                         * 4D7B3
              ;                                  * 4D7B8
              BINT3                              * 4D7BD
              ?CaseKeyDef                        * 4D7C2
              ::                                 * 4D7C7
                CHECKMENU                        * 4D7CC
                22Lget                           * 4D7D1
                EVAL                             * 4D7D6
                InitMenu                         * 4D7DB
                DispMenu                         * 4D7E0
              ;                                  * 4D7E5
              DROPDEADTRUE                       * 4D7EA
            ;                                    * 4D7EF
            BINT28                               * 4D7F4
            #=casedrop                           * 4D7F9
            ::                                   * 4D7FE
              BINT2                              * 4D803
              ?CaseKeyDef                        * 4D808
              OBJ_4576C                          * 4D80D
              BINT1                              * 4D812
              ?CaseKeyDef                        * 4D817
              OBJ_4EBD1                          * 4D81C
              DROPDEADTRUE                       * 4D821
            ;                                    * 4D826
            BINT45                               * 4D82B
            #=casedrop                           * 4D830
            ::                                   * 4D835
              BINT1                              * 4D83A
              ?CaseKeyDef                        * 4D83F
              OBJ_4DA8F                          * 4D844
              BINT3                              * 4D849
              ?CaseKeyDef                        * 4D84E
              TurnOffKey                         * 4D853
              DROPDEADTRUE                       * 4D858
            ;                                    * 4D85D
            BINT35                               * 4D862
            #=casedrop                           * 4D867
            DROPFALSE                            * 4D86C
            BINT40                               * 4D871
            #=casedrop                           * 4D876
            DROPFALSE                            * 4D87B
            SWAP                                 * 4D880
            BINT1                                * 4D885
            #<>                                  * 4D88A
            case                                 * 4D88F
            DROPDEADTRUE                         * 4D894
            BINT39                               * 4D899
            ?CaseKeyDef                          * 4D89E
            OBJ_4E3E3                            * 4D8A3
            BINT14                               * 4D8A8
            ?CaseKeyDef                          * 4D8AD
            OBJ_45681                            * 4D8B2
            BINT25                               * 4D8B7
            ?CaseKeyDef                          * 4D8BC
            OBJ_73AEE                            * 4D8C1
            BINT26                               * 4D8C6
            ?CaseKeyDef                          * 4D8CB
            OBJ_50EE3                            * 4D8D0
            BINT44                               * 4D8D5
            ?CaseKeyDef                          * 4D8DA
            MENUOFF                              * 4D8DF
            BINT49                               * 4D8E4
            ?CaseKeyDef                          * 4D8E9
            OBJ_73B20                            * 4D8EE
            DROPDEADTRUE                         * 4D8F3
          ;                                      * 4D8F8
          TrueTrue                               * 4D8FD
          BINT25                                 * 4D902
          PICK                                   * 4D907
          ONEFALSE                               * 4D90C
          GETPTYPE                               * 4D911
          DUP                                    * 4D916
          OBJ_73257                              * 4D91B
          SWAP                                   * 4D920
          OBJ_73299                              * 4D925
          ClrDA1IsStat                           * 4D92A
          ERRSET                                 * 4D92F
          ParOuterLoop                           * 4D934
          ERRTRAP                                * 4D939
          ::                                     * 4D93E
            Π'SAVEDDEPTH                         * 4D943
            RESETDEPTH                           * 4D948
            ERRJMP                               * 4D94D
          ;                                      * 4D952
          Π'SAVEDDEPTH                           * 4D957
          RESETDEPTH                             * 4D95C
          OBJ_5108F                              * 4D961
        ;                                        * 4D966

* refs (8): 471B6 47679 4817F 4BD05 4C102 4E8B1 ...
OBJ_4D96B:
        ::                                       * 4D96B
          RclDepnd                               * 4D970
          1get(li)?                              * 4D975
        ;                                        * 4D97A

* refs (2): 49E16 4BAD0
OBJ_4D97F:
        ::                                       * 4D97F
          1stArgb(ex)                            * 4D984
          ::N                                    * 4D989
        ;                                        * 4D98E

* refs (1): 8CE65
OBJ_4D993:
        ::                                       * 4D993
          15GETLAM                               * 4D998
          4GETLAM                                * 4D99D
          16GETLAM                               * 4D9A2
          3PICK                                  * 4D9A7
          %-                                     * 4D9AC
          OVER                                   * 4D9B1
          %/                                     * 4D9B6
          bins(3r)                               * 4D9BB
          DROPONE                                * 4D9C0
          OBJ_4CB68                              * 4D9C5
        ;                                        * 4D9CA

* refs (1): 8CF53
OBJ_4D9CF:
        ::                                       * 4D9CF
          rclä                                   * 4D9D4
          STATGETXCOL                            * 4D9D9
          COERCE                                 * 4D9DE
          BINT1                                  * 4D9E3
          3PICK                                  * 4D9E8
          OBJ_2CF08                              * 4D9ED
          2DROP                                  * 4D9F2
          OBJ_4CB68                              * 4D9F7
        ;                                        * 4D9FC
        BSS     12                               * 4DA01

* refs (22): 0C9F4 46C70 46CA7 47D84 482BA 482CE ...
CROSS_HAIRS:
        ::                                       * 4DA0D
          OBJ_517B2                              * 4DA12
          CROSSGROB                              * 4DA17
          OBJ_4DEAE                              * 4DA1C
          DUP4PUTLAM                             * 4DA21
          OBJ_4DB18                              * 4DA26
        ;                                        * 4DA2B
        BSS     15                               * 4DA30

* refs (3): 1E2C4 4C30A AA43D
OBJ_4DA3F:
        ::                                       * 4DA3F
          GDISPCENTER                            * 4DA44
          COLA                                   * 4DA49
          OBJ_4D1AA                              * 4DA4E
        ;                                        * 4DA53

* refs (1): 686C5
OBJ_4DA58:
        ::                                       * 4DA58
          FALSE'                                 * 4DA5D
          'EL                                    * 4DA62
          STO                                    * 4DA67
          TRUE                                   * 4DA6C
        ;                                        * 4DA71

* refs (22): 0C9E5 46C57 46CBB 4703A 470CB 470FD ...
CROSS_OFF:
        ::                                       * 4DA76
          BINT4                                  * 4DA7B
          OBJ_517B2                              * 4DA80
          OBJ_4E092                              * 4DA85
        ;                                        * 4DA8A

* refs (4): 4D09C 4D105 4D844 734B8
OBJ_4DA8F:
        ::                                       * 4DA8F
          EXITFCNsto                             * 4DA94
          TOADISP                                * 4DA99
        ;                                        * 4DA9E

* refs (7): 47C18 481CF 49696 49B19 49B41 4E76C ...
OBJ_4DAA3:
        ::                                       * 4DAA3
          EXITFCNsto                             * 4DAA8
          ::                                     * 4DAAD
            DOERASE                              * 4DAB2
            OBJ_4C2CE                            * 4DAB7
          ;                                      * 4DABC
        ;                                        * 4DAC1

        ::                                       * 4DAC6
          INDEPVAR                               * 4DACB
          ::                                     * 4DAD0
            OVER                                 * 4DAD5
            TYPESYMB?                            * 4DADA
            NOTcaseDROP                          * 4DADF
            ONE{}N                               * 4DAE4
            uncrunch                             * 4DAE9
            SHOWLS                               * 4DAEE
          ;                                      * 4DAF3
        ;                                        * 4DAF8
        ASSEMBLE

* refs (2): 65906 6591E
SUB_4DAFD:
        D0=(5)  #0011C                           * 4DAFD
        C=DAT0  XS                               * 4DB04
        C=C-1   B                                * 4DB08
        RTNNC                                    * 4DB0B
        P=      2                                * 4DB0E
        GOVLNG  L_01FC6                          * 4DB10
        NIBHEX  0                                * 4DB17
        RPL

* refs (3): 4DA26 4DD64 4ECD0
OBJ_4DB18:
        ::                                       * 4DB18
          TOTEMPOB                               * 4DB1D
          4ROLL                                  * 4DB22
          OBJ_50F2E                              * 4DB27
          OBJ_4DF67                              * 4DB2C
          GBUFF                                  * 4DB31
          2SWAP                                  * 4DB36
          GROB!                                  * 4DB3B
        ;                                        * 4DB40

* refs (1): 47026
OBJ_4DB45:
        ::                                       * 4DB45
          CROSS_OFF                              * 4DB4A
          TOTEMPSWAP                             * 4DB4F
          PUTLAM                                 * 4DB54
          CROSS_HAIRS                            * 4DB59
        ;                                        * 4DB5E

* refs (2): 47053 4DE54
OBJ_4DB63:
        ::                                       * 4DB63
          OBJ_4DC76                              * 4DB68
          IT                                     * 4DB6D
          OBJ_4DBB3                              * 4DB72
          OBJ_517B2                              * 4DB77
          PIXON3                                 * 4DB7C
          CROSS_HAIRS                            * 4DB81
        ;                                        * 4DB86

* refs (2): 4704E 4DE9A
OBJ_4DB8B:
        ::                                       * 4DB8B
          OBJ_4DC76                              * 4DB90
          IT                                     * 4DB95
          OBJ_4DBD1                              * 4DB9A
          OBJ_517B2                              * 4DB9F
          PIXOFF3                                * 4DBA4
          CROSS_HAIRS                            * 4DBA9
        ;                                        * 4DBAE

* refs (1): 4DB72
OBJ_4DBB3:
        ::                                       * 4DBB3
          OBJ_4DBEA                              * 4DBB8
          INVGROB                                * 4DBBD
          4UNROLL                                * 4DBC2
          GROB!                                  * 4DBC7
        ;                                        * 4DBCC

* refs (1): 4DB9A
OBJ_4DBD1:
        ::                                       * 4DBD1
          OBJ_4DBEA                              * 4DBD6
          4UNROLL                                * 4DBDB
          GROB!                                  * 4DBE0
        ;                                        * 4DBE5

* refs (2): 4DBB8 4DBD6
OBJ_4DBEA:
        ::                                       * 4DBEA
          CURRENTMARK?                           * 4DBEF
          DROP                                   * 4DBF4
          8GETLAM                                * 4DBF9
          ROT#-                                  * 4DBFE
          #2+                                    * 4DC03
          7GETLAM                                * 4DC08
          ROT#-                                  * 4DC0D
          #2+                                    * 4DC12
          11GETLAM                               * 4DC17
          DUP                                    * 4DC1C
          TYPEGROB?                              * 4DC21
          NOTcase                                * 4DC26

* refs (1): 4DC5D
OBJ_4DC2B:
          ::                                     * 4DC2B
            3DROP                                * 4DC30
            RDROP                                * 4DC35
          ;                                      * 4DC3A
          DUPGROBDIM                             * 4DC3F
          5PICK                                  * 4DC44
          #>                                     * 4DC49
          SWAP4PICK                              * 4DC4E
          #>                                     * 4DC53
          ANDNOTcase                             * 4DC58
          OBJ_4DC2B                              * 4DC5D
          3UNROLL                                * 4DC62
          ONEONE                                 * 4DC67
          MAKEGROB                               * 4DC6C
        ;                                        * 4DC71

* refs (2): 4DB68 4DB90
OBJ_4DC76:
        ::                                       * 4DC76
          CURRENTMARK?                           * 4DC7B
          NOTcaseFALSE                           * 4DC80
          7GETLAM                                * 4DC85
          2DUP#<                                 * 4DC8A
          ?SWAP                                  * 4DC8F
          #-                                     * 4DC94
          #<3                                    * 4DC99
          SWAP                                   * 4DC9E
          8GETLAM                                * 4DCA3
          2DUP#<                                 * 4DCA8
          ?SWAP                                  * 4DCAD
          #-                                     * 4DCB2
          #<3                                    * 4DCB7
          AND                                    * 4DCBC
        ;                                        * 4DCC1

* refs (14): 46DFB 46E14 46EAF 46F54 46FFE 481DE ...
OBJ_4DCC6:
        CON(5)  (*)+5                            * 4DCC6  primitive code object
        ASSEMBLE
        CD1EX                                    * 4DCCB
        D1=(5)  TIMER1                           * 4DCCE
        LA(1)   #4                               * 4DCD5
        DAT1=A  1                                * 4DCDB
        D1=C                                     * 4DCDF
        A=DAT0  A                                * 4DCE2
        D0=D0+  5                                * 4DCE5
        PC=(A)                                   * 4DCE8
        RPL

* refs (1): 4D3F8
OBJ_4DCEC:
        ::                                       * 4DCEC
          OBJ_4DCC6                              * 4DCF1
          WINDOWTOP?                             * 4DCF6
          IT                                     * 4DCFB
          WINDOWUP                               * 4DD00
          OBJ_517B2                              * 4DD05
          OBJ_4E0BA                              * 4DD0A
          7GETLAM                                * 4DD0F
          !#1-IF>0                               * 4DD14

* refs (3): 4DDA5 4DDDC 4DE18
OBJ_4DD19:
          ::                                     * 4DD19
            OBJ_517B2                            * 4DD1E
            CROSSGROB                            * 4DD23
            OBJ_4DEB3                            * 4DD28
            4GETLAM                              * 4DD2D
            GBUFF                                * 4DD32
            BINT11                               * 4DD37
            ROLL                                 * 4DD3C
            BINT11                               * 4DD41
            ROLL                                 * 4DD46
            GROB!                                * 4DD4B
            GBUFF                                * 4DD50
            5UNROLL                              * 4DD55
            SUBGROB                              * 4DD5A
            DUP4PUTLAM                           * 4DD5F
            OBJ_4DB18                            * 4DD64
          ;                                      * 4DD69
        ;                                        * 4DD6E

* refs (1): 4D713
OBJ_4DD73:
        ::                                       * 4DD73
          OBJ_4DCC6                              * 4DD78
          WINDOWBOT?                             * 4DD7D
          IT                                     * 4DD82
          WINDOWDOWN                             * 4DD87
          OBJ_517B2                              * 4DD8C
          OBJ_4E0BA                              * 4DD91
          7GETLAM                                * 4DD96
          13GETLAM                               * 4DD9B
          !#1+IF<dim-1                           * 4DDA0
          OBJ_4DD19                              * 4DDA5
        ;                                        * 4DDAA

* refs (2): 0C8ED 4D51F
OBJ_4DDAF:
        ::                                       * 4DDAF
          OBJ_4DCC6                              * 4DDB4
          WINDOWLEFT?                            * 4DDB9
          IT                                     * 4DDBE
          WINDOWLEFT                             * 4DDC3
          OBJ_517B2                              * 4DDC8
          OBJ_4E0BA                              * 4DDCD
          8GETLAM                                * 4DDD2
          !#1-IF>0                               * 4DDD7
          OBJ_4DD19                              * 4DDDC
        ;                                        * 4DDE1

* refs (2): 0C8E8 4D60F
OBJ_4DDE6:
        ::                                       * 4DDE6
          OBJ_4DCC6                              * 4DDEB
          WINDOWRIGHT?                           * 4DDF0
          IT                                     * 4DDF5
          WINDOWRIGHT                            * 4DDFA
          OBJ_517B2                              * 4DDFF
          OBJ_4E0BA                              * 4DE04
          8GETLAM                                * 4DE09
          14GETLAM                               * 4DE0E
          !#1+IF<dim-1                           * 4DE13
          OBJ_4DD19                              * 4DE18
        ;                                        * 4DE1D

* refs (1): 3E8B6
OBJ_4DE22:
        ::                                       * 4DE22
          CHECKMENU                              * 4DE27
          OBJ_7362F                              * 4DE2C
          ITE                                    * 4DE31
          OBJ_73684                              * 4DE36
          ::                                     * 4DE3B
            OBJ_4EE6F                            * 4DE40
            BINT2                                * 4DE45
            3PUTLAM                              * 4DE4A
            CROSS_OFF                            * 4DE4F
            OBJ_4DB63                            * 4DE54
          ;                                      * 4DE59
          DispMenu                               * 4DE5E
        ;                                        * 4DE63

* refs (1): 3E8EB
OBJ_4DE68:
        ::                                       * 4DE68
          CHECKMENU                              * 4DE6D
          OBJ_73643                              * 4DE72
          ITE                                    * 4DE77
          OBJ_73684                              * 4DE7C
          ::                                     * 4DE81
            OBJ_4EE6F                            * 4DE86
            BINT1                                * 4DE8B
            3PUTLAM                              * 4DE90
            CROSS_OFF                            * 4DE95
            OBJ_4DB8B                            * 4DE9A
          ;                                      * 4DE9F
          DispMenu                               * 4DEA4
        ;                                        * 4DEA9

* refs (2): 4DA1C 4ECCB
OBJ_4DEAE:
        ::                                       * 4DEAE

* refs (2): 48481 4DD28
OBJ_4DEB3:
          ::                                     * 4DEB3
            3UNROLL                              * 4DEB8
            14GETLAM                             * 4DEBD
            SWAP                                 * 4DEC2
            13GETLAM                             * 4DEC7
            OBJ_4DFFD                            * 4DECC
            ITE                                  * 4DED1
            ::                                   * 4DED6
              OBJ_4E10C                          * 4DEDB
              BINT9                              * 4DEE0
              ROLL                               * 4DEE5
              5UNROLL                            * 4DEEA
              SUBGROB                            * 4DEEF
              5UNROLL                            * 4DEF4
              4PICK                              * 4DEF9
              3UNROLL                            * 4DEFE
              4PICK                              * 4DF03
              3UNROLL                            * 4DF08
            ;                                    * 4DF0D
            ::                                   * 4DF12
              DROPSWAPDROP                       * 4DF17
              OVER                               * 4DF1C
              #2-                                * 4DF21
              OVER                               * 4DF26
              #2-                                * 4DF2B
              2DUP                               * 4DF30
              6ROLL                              * 4DF35
              #3+                                * 4DF3A
              6ROLL                              * 4DF3F
              #3+                                * 4DF44
            ;                                    * 4DF49
          ;                                      * 4DF4E
          GBUFF                                  * 4DF53
          5UNROLL                                * 4DF58
          SUBGROB                                * 4DF5D
        ;                                        * 4DF62

* refs (2): 484E5 4DB2C
OBJ_4DF67:
        CON(5)  (*)+5                            * 4DF67  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 4DF6C
        LC(5)   TRUE                             * 4DF6F
        D1=D1+  5                                * 4DF76
        D=D+1   A                                * 4DF79
        ST=1    1                                * 4DF7B
        ?C=A    A                                * 4DF7E
        GOYES   L_4DF86                          * 4DF81
        ST=0    1                                * 4DF83
L_4DF86:
        C=DAT1  A                                * 4DF86
        CD1EX                                    * 4DF89
        D1=D1+  10                               * 4DF8C
        A=DAT1  A                                * 4DF8F
        R0=A.F  A                                * 4DF92
        D1=D1+  10                               * 4DF98
        A=DAT1  W                                * 4DF9B
        R1=A                                     * 4DF9F
        D1=C                                     * 4DFA2
        D1=D1+  5                                * 4DFA5
        D=D+1   A                                * 4DFA8
        A=DAT1  A                                * 4DFAA
        GOSBVL  SAVPTR                           * 4DFAD
        D1=A                                     * 4DFB4
        D1=D1+  10                               * 4DFB7
        D1=D1+  10                               * 4DFBA
        A=DAT1  10                               * 4DFBD
        C=R1                                     * 4DFC1
        B=A     W                                * 4DFC4
        A=A!C   W                                * 4DFC7
        ?ST=0   1                                * 4DFCB
        GOYES   L_4DFDA                          * 4DFCE
        ABEX    W                                * 4DFD0
        A=A&C   W                                * 4DFD3
        A=B-A   W                                * 4DFD7
L_4DFDA:
        C=R0.F  A                                * 4DFDA
L_4DFE0:
        C=C-1   A                                * 4DFE0
        GOC     L_4DFF6                          * 4DFE2
        DAT1=A  2                                * 4DFE5
        ASR     W                                * 4DFE9
        ASR     W                                * 4DFEC
        D1=D1+  2                                * 4DFEF
        GOTO    L_4DFE0                          * 4DFF2
L_4DFF6:
        GOVLNG  GETPTRLOOP                       * 4DFF6

* refs (1): 4DECC
OBJ_4DFFD:
        CON(5)  (*)+5                            * 4DFFD  primitive code object
        CD1EX                                    * 4E002
        R0=C.F  A                                * 4E005
        CD1EX                                    * 4E00B
        GOSUB   SUB_4E06F                        * 4E00E
        A=C     A                                * 4E012
        C=R0.F  A                                * 4E014
        CD1EX                                    * 4E01A
        D1=D1+  5                                * 4E01D
        GOSUB   SUB_4E06F                        * 4E020
        GOSUB   SUB_4E07D                        * 4E024
        C=R0.F  A                                * 4E028
        CD1EX                                    * 4E02E
        D1=D1+  10                               * 4E031
        GOSUB   SUB_4E06F                        * 4E034
        A=C     A                                * 4E038
        C=R0.F  A                                * 4E03A
        CD1EX                                    * 4E040
        D1=D1+  15                               * 4E043
        GOSUB   SUB_4E06F                        * 4E046
        GOSUB   SUB_4E07D                        * 4E04A
        LC(5)   FALSE                            * 4E04E
        GOTO    L_4E060                          * 4E055
L_4E059:
        LC(5)   TRUE                             * 4E059
L_4E060:
        A=R0.F  A                                * 4E060
        AD1EX                                    * 4E066
        A=C     A                                * 4E069
        PC=(A)                                   * 4E06B

* refs (4): 4E00E 4E020 4E034 4E046
SUB_4E06F:
        C=DAT1  A                                * 4E06F
        CD1EX                                    * 4E072
        D1=D1+  5                                * 4E075
        C=DAT1  A                                * 4E078
        RTN                                      * 4E07B

* refs (2): 4E024 4E04A
SUB_4E07D:
        A=A-1   A                                * 4E07D
        A=A-1   A                                * 4E07F
        ?C>A    A                                * 4E081
        GOYES   L_4E059                          * 4E084
        C=C-1   A                                * 4E086
        GOC     L_4E059                          * 4E088
        C=C-1   A                                * 4E08B
        GOC     L_4E059                          * 4E08D
        RTN                                      * 4E090
        RPL

* refs (2): 4DA85 4E4A6
OBJ_4E092:
        ::                                       * 4E092
          OBJ_4E0BA                              * 4E097
          ROT                                    * 4E09C
          GETLAM                                 * 4E0A1
          GBUFF                                  * 4E0A6
          2SWAP                                  * 4E0AB
          GROB!                                  * 4E0B0
        ;                                        * 4E0B5

* refs (11): 4820B 48260 4845E 4884B 4DD0A 4DD91 ...
OBJ_4E0BA:
        CON(5)  (*)+5                            * 4E0BA  primitive code object
        ASSEMBLE
        GOSBVL  POP2#                            * 4E0BF
        R1=C.F  A                                * 4E0C6
        GOSBVL  SAVPTR                           * 4E0CC
        A=A-1   A                                * 4E0D3
        GOC     L_4E100                          * 4E0D5
        A=A-1   A                                * 4E0D8
        GOC     L_4E100                          * 4E0DA
L_4E0DD:
        R0=A.F  A                                * 4E0DD
        C=R1.F  A                                * 4E0E3
        C=C-1   A                                * 4E0E9
        GOC     L_4E106                          * 4E0EB
        C=C-1   A                                * 4E0EE
        GOC     L_4E106                          * 4E0F0
L_4E0F3:
        R1=C.F  A                                * 4E0F3
        GOVLNG  Push2#Loop                       * 4E0F9
L_4E100:
        A=0     A                                * 4E100
        GOTO    L_4E0DD                          * 4E102
L_4E106:
        C=0     A                                * 4E106
        GOTO    L_4E0F3                          * 4E108

* refs (1): 4DEDB
OBJ_4E10C:
        CON(5)  (*)+5                            * 4E10C  primitive code object
        GOSBVL  POP2#                            * 4E111
        R2=A.F  A                                * 4E118
        GOSUB   SUB_4E210                        * 4E11E
        CSRC                                     * 4E122
        R3=C.F  S                                * 4E125
        GOSBVL  POP2#                            * 4E12B
        R4=A.F  A                                * 4E132
        GOSUB   SUB_4E210                        * 4E138
        R3=C.F  P                                * 4E13C
        A=R4.F  A                                * 4E142
        GOSUB   SUB_4E227                        * 4E148
        R0=A.F  A                                * 4E14C
        A=R2.F  A                                * 4E152
        GOSUB   SUB_4E227                        * 4E158
        R1=A.F  A                                * 4E15C
        GOSBVL  SAVPTR                           * 4E162
        GOSBVL  PUSH2#                           * 4E169
        GOSBVL  SAVPTR                           * 4E170
        A=R4.F  A                                * 4E177
        C=0     A                                * 4E17D
        C=R3.F  P                                * 4E17F
        A=A+C   A                                * 4E185
        R0=A.F  A                                * 4E187
        A=R2.F  A                                * 4E18D
        C=0     A                                * 4E193
        C=R3.F  S                                * 4E195
        CSLC                                     * 4E19B
        A=A+C   A                                * 4E19E
        R1=A.F  A                                * 4E1A0
        GOSBVL  PUSH2#                           * 4E1A6
        GOSBVL  SAVPTR                           * 4E1AD
        C=R4.F  A                                * 4E1B4
        GOSUB   SUB_4E235                        * 4E1BA
        R0=A.F  A                                * 4E1BE
        C=R2.F  A                                * 4E1C4
        GOSUB   SUB_4E235                        * 4E1CA
        R1=A.F  A                                * 4E1CE
        GOSBVL  PUSH2#                           * 4E1D4
        GOSBVL  SAVPTR                           * 4E1DB
        A=0     A                                * 4E1E2
        A=R3.F  P                                * 4E1E4
        A=A+1   A                                * 4E1EA
        A=A+1   A                                * 4E1EC
        R0=A.F  A                                * 4E1EE
        A=0     A                                * 4E1F4
        A=R3.F  S                                * 4E1F6
        ASLC                                     * 4E1FC
        A=A+1   A                                * 4E1FF
        A=A+1   A                                * 4E201
        R1=A.F  A                                * 4E203
        GOVLNG  Push2#Loop                       * 4E209

* refs (2): 4E11E 4E138
SUB_4E210:
        A=A-1   A                                * 4E210
        C=C-A   A                                * 4E212
        LA(5)   #00003                           * 4E214
        ?C<=A   A                                * 4E21E
        RTNYES                                   * 4E221
        C=A     A                                * 4E223
        RTN                                      * 4E225

* refs (2): 4E148 4E158
SUB_4E227:
        A=A-1   A                                * 4E227
        GOC     L_4E231                          * 4E229
        A=A-1   A                                * 4E22C
        RTNNC                                    * 4E22E
L_4E231:
        A=0     A                                * 4E231
        RTN                                      * 4E233

* refs (2): 4E1BA 4E1CA
SUB_4E235:
        LA(5)   #00002                           * 4E235
        A=A-C   A                                * 4E23F
        RTNNC                                    * 4E241
        A=0     A                                * 4E244
        RTN                                      * 4E246
        RPL

* refs (1): 4888C
OBJ_4E248:
        ::                                       * 4E248
          BINT1                                  * 4E24D
          GetEqN                                 * 4E252
        ;                                        * 4E257
        BSS     10                               * 4E25C

* ->
* refs (61): 0C8FC 0C929 0C9AE 456D1 456FE 4575D ...
CHECKMENU:
        ::                                       * 4E266
          TakeOver                               * 4E26B
          MENUOFF?                               * 4E270
          case                                   * 4E275
          ::                                     * 4E27A
            RDROP                                * 4E27F
            TURNMENUON                           * 4E284
            DispMenu                             * 4E289
          ;                                      * 4E28E
          OBJ_0CA17                              * 4E293
          NOT?SEMI                               * 4E298
          RDROP                                  * 4E29D
          OBJ_4E6A9                              * 4E2A2
        ;                                        * 4E2A7

* ->
* refs (3): 3E7FF 46ACA 4D8DF
MENUOFF:
        ::                                       * 4E2AC
          CHECKMENU                              * 4E2B1
          GDISPON?                               * 4E2B6
          NOT?SEMI                               * 4E2BB
          CHECKPICT                              * 4E2C0
          TURNMENUOFF                            * 4E2C5
        ;                                        * 4E2CA

* ->
* refs (11): 488B9 4B666 4C2D8 4CE88 4E2C5 4F0A2 ...
TURNMENUOFF:
        ::                                       * 4E2CF
          HARDBUFF                               * 4E2D4
          HARDHEIGHT                             * 4E2D9
          CHECKHEIGHT                            * 4E2DE
          WINDOWCORNER                           * 4E2E3
          BINT64                                 * 4E2E8
          HARDBUFF                               * 4E2ED
          GROBDIM                                * 4E2F2
          DROP                                   * 4E2F7
          4PICK                                  * 4E2FC
          #-                                     * 4E301
          2DUP#>                                 * 4E306
          ITE                                    * 4E30B
          ::                                     * 4E310
            #-                                   * 4E315
            ROTSWAP                              * 4E31A
            #-SWAP                               * 4E31F
            WINDOWXY                             * 4E324
          ;                                      * 4E329
          4DROP                                  * 4E32E
          #       3F                             * 4E333  63
          LINECHANGE                             * 4E33D
        ;                                        * 4E342

* ->
* refs (5): 3A201 4E284 6A8D8 6C398 D10A3
TURNMENUON:
        ::                                       * 4E347
          #       37                             * 4E34C  55
          LINECHANGE                             * 4E356
        ;                                        * 4E35B

* -> flag
* refs (3): 4E270 50F10 73B2A
MENUOFF?:
        ::                                       * 4E360
          RclRowMenu                             * 4E365
          #       37                             * 4E36A  55
          #<>                                    * 4E374
        ;                                        * 4E379

* refs (2): 4E33D 4E356
LINECHANGE:
        CON(5)  (*)+5                            * 4E37E  primitive code object
        ASSEMBLE
        GOSBVL  POP#                             * 4E383
        GOSBVL  SAVPTR                           * 4E38A
        LC(2)   #3F                              * 4E391
        A=A&C   B                                * 4E395
        C=-C-1  A                                * 4E399
        B=C     A                                * 4E39B
        D0=(5)  LINECOUNTg                       * 4E39D
        C=DAT0  B                                * 4E3A4
        C=C&B   B                                * 4E3A7
        A=A!C   B                                * 4E3AB
        DAT0=A  B                                * 4E3AF
        D0=(5)  LINECOUNT                        * 4E3B2
        DAT0=A  B                                * 4E3B9
        GOSBVL  disprange                        * 4E3BC
        GOVLNG  GETPTRLOOP                       * 4E3C3
        RPL

* refs (2): 3E820 4E659
\MARK:
        ::                                       * 4E3CA
          CHECKMENU                              * 4E3CF
          COLA                                   * 4E3D4
          OBJ_4E3E3                              * 4E3D9
        ;                                        * 4E3DE

* refs (2): 4D8A3 4E3D9
OBJ_4E3E3:
        ::                                       * 4E3E3
          TakeOver                               * 4E3E8
          OBJ_4579E                              * 4E3ED
          EQCURSOR?                              * 4E3F2
          case2drop                              * 4E3F7
          ::                                     * 4E3FC
            11GETLAM                             * 4E401
            4PUTLAM                              * 4E406
            %0_2A2B4                             * 4E40B
            TOTEMPOB                             * 4E410
            1PUTLAM                              * 4E415
            CROSS_OFF                            * 4E41A
            CROSS_HAIRS                          * 4E41F
          ;                                      * 4E424
          CROSS_OFF                              * 4E429
          PREMARKON                              * 4E42E
          CROSS_HAIRS                            * 4E433
          NEWMARK                                * 4E438
        ;                                        * 4E43D

* refs (7): 0C92E 457A3 497FB 4DBEF 4DC7B 4E6D1 ...
CURRENTMARK?:
        ::                                       * 4E442
          1GETLAM                                * 4E447
          DUP                                    * 4E44C
          TYPEBINT?                              * 4E451
          NOTcsdrpfls                            * 4E456
          12GETLAM                               * 4E45B
          TRUE                                   * 4E460
        ;                                        * 4E465

* refs (3): 4828D 4E3F2 4E78A
EQCURSOR?:
        ::                                       * 4E46A
          2DUP                                   * 4E46F
          7GETLAM                                * 4E474
          #=                                     * 4E479
          SWAP                                   * 4E47E
          8GETLAM                                * 4E483
          #=                                     * 4E488
          AND                                    * 4E48D
        ;                                        * 4E492

* refs (3): 482C9 4E42E 4E6DB
PREMARKON:
        ::                                       * 4E497
          BINT11                                 * 4E49C
          3UNROLL                                * 4E4A1
          OBJ_4E092                              * 4E4A6
        ;                                        * 4E4AB

* refs (3): 457B2 4980F 4E438
NEWMARK:
        ::                                       * 4E4B0
          OBJ_517B2                              * 4E4B5
          2DUP                                   * 4E4BA
          TOTEMPOB                               * 4E4BF
          12PUTLAM                               * 4E4C4
          TOTEMPOB                               * 4E4C9
          1PUTLAM                                * 4E4CE
          OBJ_4E0BA                              * 4E4D3
          4GETLAM                                * 4E4D8
          DUP                                    * 4E4DD
          11PUTLAM                               * 4E4E2
          GROBDIM                                * 4E4E7
          4PICK#+SWAP                            * 4E4EC
          3PICK#+                                * 4E4F1
          HARDBUFF                               * 4E4F6
          5UNROLL                                * 4E4FB
          SUBGROB                                * 4E500
          4PUTLAM                                * 4E505
          OBJ_4E6C7                              * 4E50A
          CROSSMARKON                            * 4E50F
        ;                                        * 4E514

* refs (2): 4E64F 4ECC1
OBJ_4E519:
        ::                                       * 4E519
          1GETLAM                                * 4E51E
          12GETLAM                               * 4E523
          OBJ_4E0BA                              * 4E528
          11GETLAM                               * 4E52D
          GROBDIM                                * 4E532
          4PICK#+SWAP                            * 4E537
          3PICK#+                                * 4E53C
          HARDBUFF                               * 4E541
          5UNROLL                                * 4E546
          SUBGROB                                * 4E54B
          11PUTLAM                               * 4E550
        ;                                        * 4E555

* refs (1): 3E85C
\BOX:
        ::                                       * 4E55A
          CHECKMENU                              * 4E55F
          OBJ_4579E                              * 4E564
          OBJ_4E6C7                              * 4E569
          OBJ_517B2                              * 4E56E
          DRAWBOX#                               * 4E573
          CROSSMARKON                            * 4E578
        ;                                        * 4E57D

* #x1 #y1 #x2 #y2 ->
* refs (3): 4E573 4F67E 4F697
DRAWBOX#:
        ::                                       * 4E582
          ORDERXY#                               * 4E587
          4PICK                                  * 4E58C
          4PICK                                  * 4E591
          4PICKOVER                              * 4E596
          DRAWLINE#3                             * 4E59B
          OVER                                   * 4E5A0
          4PICKOVER                              * 4E5A5
          4PICK                                  * 4E5AA
          DRAWLINE#3                             * 4E5AF
          2DUP                                   * 4E5B4
          6PICK                                  * 4E5B9
          OVER                                   * 4E5BE
          DRAWLINE#3                             * 4E5C3
          4ROLL                                  * 4E5C8
          DUPUNROT                               * 4E5CD
          5ROLL                                  * 4E5D2
          DRAWLINE#3                             * 4E5D7
          DROP                                   * 4E5DC
        ;                                        * 4E5E1

* refs (1): 3E881
\CIRCLE:
        ::                                       * 4E5E6
          CHECKMENU                              * 4E5EB
          OBJ_4579E                              * 4E5F0
          OBJ_4E6C7                              * 4E5F5
          FALSE                                  * 4E5FA
          3UNROLL                                * 4E5FF
          UNCOERCE2                              * 4E604
          OBJ_517B2                              * 4E609
          UNCOERCE2                              * 4E60E
          2DUP                                   * 4E613
          6ROLL                                  * 4E618
          6ROLL                                  * 4E61D
          OBJ_4FE6C                              * 4E622
          CROSSMARKON                            * 4E627
        ;                                        * 4E62C

* refs (1): 3E834
\LINE:
        ::                                       * 4E631
          CHECKMENU                              * 4E636
          OBJ_4579E                              * 4E63B
          OBJ_4E6C7                              * 4E640
          OBJ_517B2                              * 4E645
          DRAWLINE#3                             * 4E64A
          OBJ_4E519                              * 4E64F
          CROSS_HAIRS                            * 4E654
          \MARK                                  * 4E659
        ;                                        * 4E65E

* refs (1): 3E848
\TLINE:
        ::                                       * 4E663
          CHECKMENU                              * 4E668
          OBJ_4579E                              * 4E66D
          OBJ_4E6C7                              * 4E672
          OBJ_517B2                              * 4E677
          TOGGLELINE#3                           * 4E67C
          CROSSMARKON                            * 4E681
        ;                                        * 4E686

* refs (2): 46CAC 4702B
OBJ_4E68B:
        ::                                       * 4E68B
          OBJ_5102B                              * 4E690
          NOT?SEMI                               * 4E695
          OBJ_47209                              * 4E69A
          OBJ_47236                              * 4E69F
        ;                                        * 4E6A4

* refs (1): 4E2A2
OBJ_4E6A9:
        ::                                       * 4E6A9
          DispMenu                               * 4E6AE
          BINT0                                  * 4E6B3
          16PUTLAM                               * 4E6B8
        ;                                        * 4E6BD
        NIBHEX  00000                            * 4E6C2  ..

* refs (15): 4568B 45708 45776 477C7 4E50A 4E569 ...
OBJ_4E6C7:
        ::                                       * 4E6C7
          CROSS_OFF                              * 4E6CC
          CURRENTMARK?                           * 4E6D1
          IT                                     * 4E6D6
          PREMARKON                              * 4E6DB
        ;                                        * 4E6E0

DispOnMenu(_):
        ::                                       * 4E6E5
          DECOMP$                                * 4E6EA

* $ ->
* refs (2): 0CA03 4A05A
DispCoord1:
          ::                                     * 4E6EF
            $>grob                               * 4E6F4
            DUPGROBDIM                           * 4E6F9
            SWAPDROP                             * 4E6FE
            BINT131                              * 4E703
            #<                                   * 4E708
            ?SKIP                                * 4E70D

sub(go,<0>,<0>,<83>,<8>):
            ::                                   * 4E712
              ZEROZERO                           * 4E717
              BINT131                            * 4E71C
              BINT8                              * 4E721
              SUBGROB                            * 4E726
            ;                                    * 4E72B
            CLEARMENU                            * 4E730
            HARDBUFF2                            * 4E735
            BINT0                                * 4E73A
            BINT2                                * 4E73F
            GROB!                                * 4E744
          ;                                      * 4E749
        ;                                        * 4E74E

* refs (1): 47F27
OBJ_4E753:
        ::                                       * 4E753
          CHECKMENU                              * 4E758
          OBJ_4EEBF                              * 4E75D
          RECORDX&YC%                            * 4E762
          centr(c)                               * 4E767
          OBJ_4DAA3                              * 4E76C
        ;                                        * 4E771

Z-BOX:
        ::                                       * 4E776
          CHECKMENU                              * 4E77B
          LookForEQ/äDAT                         * 4E780
          OBJ_4579E                              * 4E785
          EQCURSOR?                              * 4E78A
          case2drop                              * 4E78F
          DoBadKey                               * 4E794

* refs (1): 0C9C2
OBJ_4E799:
          ::                                     * 4E799
            GBUFFGROBDIM                         * 4E79E
            px->c(2rr,2s)                        * 4E7A3
            C%>%                                 * 4E7A8
            OBJ_517B2                            * 4E7AD
            GBUFFGROBDIM                         * 4E7B2
            px->c(2rr,2s)                        * 4E7B7
            C%>%                                 * 4E7BC
            ORDERXY%                             * 4E7C1
            DUP                                  * 4E7C6
            4PICK                                * 4E7CB
            %=                                   * 4E7D0
            IT                                   * 4E7D5
            ::                                   * 4E7DA
              DROPSWAPDROP                       * 4E7DF
              GETPMIN&MAX                        * 4E7E4
              SWAP2C%>%                          * 4E7E9
              SWAPDROP                           * 4E7EE
              ROTDROP                            * 4E7F3
              3UNROLL                            * 4E7F8
            ;                                    * 4E7FD
            OVER5PICK                            * 4E802
            %=                                   * 4E807
            IT                                   * 4E80C
            ::                                   * 4E811
              SWAPDROP                           * 4E816
              ROTDROP                            * 4E81B
              GETPMIN&MAX                        * 4E820
              SWAP2C%>%                          * 4E825
              DROPSWAPDROP                       * 4E82A
              4UNROLL                            * 4E82F
              SWAP                               * 4E834
            ;                                    * 4E839
            %>C%                                 * 4E83E
            pmax(c)                              * 4E843
            %>C%                                 * 4E848
            pmin(c)                              * 4E84D
            OBJ_4DAA3                            * 4E852
          ;                                      * 4E857
        ;                                        * 4E85C

* refs (1): 3E7DE
OBJ_4E861:
        ::                                       * 4E861
          CHECKMENU                              * 4E866
          OBJ_4E6C7                              * 4E86B
          label!                                 * 4E870
          CROSSMARKON                            * 4E875
        ;                                        * 4E87A
        BSS     10                               * 4E87F

* refs (1): 1E2DF
label:
        ::                                       * 4E889
          CHECKPICT                              * 4E88E

* refs (1): 4E870
label!:
          ::                                     * 4E893
            OBJ_4681A                            * 4E898
            ?SKIP                                * 4E89D
            ::                                   * 4E8A2
              INDEPVAR                           * 4E8A7
              ID>$                               * 4E8AC
              OBJ_4D96B                          * 4E8B1
              ID>$                               * 4E8B6
            ;                                    * 4E8BB
            $>grob                               * 4E8C0
            SWAP                                 * 4E8C5
            $>grob                               * 4E8CA
            GBUFFGROBDIM                         * 4E8CF
            OBJ_4E901                            * 4E8D4
            GETPMIN&MAX                          * 4E8D9
            SWAP2C%>%                            * 4E8DE
            ROT                                  * 4E8E3
            4ROLL                                * 4E8E8
            3UNROLL                              * 4E8ED
            OBJ_4EA82                            * 4E8F2
          ;                                      * 4E8F7
        ;                                        * 4E8FC

* refs (1): 4E8D4
OBJ_4E901:
        ::                                       * 4E901
          RclAx*s                                * 4E906
          1get(li)?                              * 4E90B
          3PICK3PICK                             * 4E910
          OBJ_4F20F                              * 4E915
          4UNROLLROT                             * 4E91A
          r=>rr;rot;*(2rr);+(2rr);r=>r           * 4E91F
          SWAP4ROLL                              * 4E924
          Chkr=>s(s,r)                           * 4E929
          DUPTYPEBINT?                           * 4E92E
          ITE                                    * 4E933
          OBJ_4E9BF                              * 4E938
          4ROLLDROP                              * 4E93D
          SWAP3PICK                              * 4E942
          Chkr=>s(s,r)                           * 4E947
          DUPTYPEBINT?                           * 4E94C
          NOTcase                                * 4E951

drop(3-4);swap:
          ::                                     * 4E956
            ROTDROP                              * 4E95B
            ROTDROPSWAP                          * 4E960
          ;                                      * 4E965
          ROTDROPSWAP                            * 4E96A
          OVER                                   * 4E96F
          #3+                                    * 4E974
          BINT3                                  * 4E979
          5ROLL                                  * 4E97E
          PutOnPict(2s,go)                       * 4E983
        ;                                        * 4E988

* refs (2): 4E929 4E947
Chkr=>s(s,r):
        ::                                       * 4E98D
          OVER                                   * 4E992
          (rò-0.5)=>s?                           * 4E997
          NOTcaseDROP                            * 4E99C
          2DUP                                   * 4E9A1
          #>                                     * 4E9A6
          case                                   * 4E9AB
          ROTROT2DROP                            * 4E9B0
          2DROP                                  * 4E9B5
        ;                                        * 4E9BA

* refs (1): 4E938
OBJ_4E9BF:
        ::                                       * 4E9BF
          3PICK                                  * 4E9C4
          #2-                                    * 4E9C9
          5PICK                                  * 4E9CE
          GROBDIMw                               * 4E9D3
          2DUPSWAP                               * 4E9D8
          #>                                     * 4E9DD
          ITE                                    * 4E9E2
          ::                                     * 4E9E7
            SWAP#-                               * 4E9EC
            5ROLL                                * 4E9F1
            SWAP                                 * 4E9F6
            BINT0                                * 4E9FB
            MINUSONE                             * 4EA00
            DUP                                  * 4EA05
            SUBGROB                              * 4EA0A
            4UNROLL                              * 4EA0F
            BINT0                                * 4EA14
          ;                                      * 4EA19
          #-                                     * 4EA1E
          OVER                                   * 4EA23
          BINT7                                  * 4EA28
          #-                                     * 4EA2D
          6ROLL                                  * 4EA32
          PutOnPict(2s,go)                       * 4EA37
        ;                                        * 4EA3C

* refs (6): 4E983 4EA37 4EABE 4EAF5 4EB59 4EBA9
PutOnPict(2s,go):
        ::                                       * 4EA41
          3UNROLL                                * 4EA46
          GBUFF                                  * 4EA4B
          InGrob(2s,go)?                         * 4EA50
          NOTcase                                * 4EA55
          3DROP                                  * 4EA5A
          GBUFF                                  * 4EA5F
          4UNROLL                                * 4EA64
          CKGROBFITS                             * 4EA69
          4ROLL                                  * 4EA6E
          3UNROLL                                * 4EA73
          GROB!                                  * 4EA78
        ;                                        * 4EA7D

* refs (1): 4E8F2
OBJ_4EA82:
        ::                                       * 4EA82
          OBJ_4EBBD                              * 4EA87
          6PICK                                  * 4EA8C
          DUPTYPEBINT?                           * 4EA91
          ITE                                    * 4EA96
          ::                                     * 4EA9B
            OVER                                 * 4EAA0
            GROBDIMw                             * 4EAA5
            #-                                   * 4EAAA
            #1-                                  * 4EAAF
            BINT3                                * 4EAB4
            ROT                                  * 4EAB9
            PutOnPict(2s,go)                     * 4EABE
          ;                                      * 4EAC3
          2DROP                                  * 4EAC8
          BINT3                                  * 4EACD
          5PICK                                  * 4EAD2
          DUPTYPEBINT?                           * 4EAD7
          ITE                                    * 4EADC
          ::                                     * 4EAE1
            #3+                                  * 4EAE6
            5ROLL                                * 4EAEB
            OBJ_4EBBD                            * 4EAF0
            PutOnPict(2s,go)                     * 4EAF5
          ;                                      * 4EAFA
          ::                                     * 4EAFF
            2DROP                                * 4EB04
            ROTDROP                              * 4EB09
          ;                                      * 4EB0E
          GBUFFGROBDIM                           * 4EB13
          #2-                                    * 4EB18
          4ROLL                                  * 4EB1D
          OBJ_4EBBD                              * 4EB22
          DUPGROBDIM                             * 4EB27
          SWAPDROP                               * 4EB2C
          ROTSWAP                                * 4EB31
          #-                                     * 4EB36
          5ROLL                                  * 4EB3B
          DUPTYPEBINT?                           * 4EB40
          ITE                                    * 4EB45
          ::                                     * 4EB4A
            #3+                                  * 4EB4F
            ROT                                  * 4EB54
            PutOnPict(2s,go)                     * 4EB59
          ;                                      * 4EB5E
          3DROP                                  * 4EB63
          SWAP                                   * 4EB68
          OBJ_4EBBD                              * 4EB6D
          DUPGROBDIM                             * 4EB72
          5ROLL                                  * 4EB77
          DUPTYPEBINT?                           * 4EB7C
          ITE                                    * 4EB81
          ::                                     * 4EB86
            SWAP#-                               * 4EB8B
            #1-                                  * 4EB90
            4ROLL                                * 4EB95
            #2-                                  * 4EB9A
            ROT#-                                * 4EB9F
            ROT                                  * 4EBA4
            PutOnPict(2s,go)                     * 4EBA9
          ;                                      * 4EBAE
          5DROP                                  * 4EBB3
        ;                                        * 4EBB8

* refs (4): 4EA87 4EAF0 4EB22 4EB6D
OBJ_4EBBD:
        ::                                       * 4EBBD
          OBJ_159D2                              * 4EBC2
          $>grob                                 * 4EBC7
        ;                                        * 4EBCC

* refs (2): 45762 4D81C
OBJ_4EBD1:
        ::                                       * 4EBD1
          TakeOver                               * 4EBD6
          OBJ_4579E                              * 4EBDB
          GBUFF                                  * 4EBE0
          3UNROLL                                * 4EBE5
          OBJ_4E6C7                              * 4EBEA
          OBJ_517B2                              * 4EBEF
          ORDERXY#                               * 4EBF4
          SWAP#1+SWAP                            * 4EBF9
          #1+                                    * 4EBFE
          GROB!ZERODRP                           * 4EC03
          CROSSMARKON                            * 4EC08
        ;                                        * 4EC0D

* refs (1): 73AF8
OBJ_4EC12:
        ::                                       * 4EC12
          OBJ_73602                              * 4EC17
          NOTcase                                * 4EC1C
          RECORDX&YC%                            * 4EC21
          OBJ_456E5                              * 4EC26
          BINT5                                  * 4EC2B
          NTHELCOMP                              * 4EC30
          case                                   * 4EC35
          EVAL                                   * 4EC3A
          RECORDX&YC%                            * 4EC3F
        ;                                        * 4EC44

* refs (1): 68E95
OBJ_4EC49:
        ::                                       * 4EC49
          'EL                                    * 4EC4E
          BINT33                                 * 4EC53
          GETLAM                                 * 4EC58
          NOTAND                                 * 4EC5D
          BINT32                                 * 4EC62
          GETLAM                                 * 4EC67
          NOTAND                                 * 4EC6C
          IT                                     * 4EC71
          OBJ_6C041                              * 4EC76
          TRUE'                                  * 4EC7B
          'EL                                    * 4EC80
          STO                                    * 4EC85
          OBJ_699B9                              * 4EC8A
        ;                                        * 4EC8F

* refs (1): 3B3FA
OBJ_4EC94:
        ::                                       * 4EC94
          0LASTOWDOB!                            * 4EC99
          CK2NOLASTWD                            * 4EC9E
        ;                                        * 4ECA3
        NIBHEX  00000                            * 4ECA8  ..

* refs (12): 456B8 4574E 45794 477D1 4E50F 4E578 ...
CROSSMARKON:
        ::                                       * 4ECAD
          CURRENTMARK?                           * 4ECB2
          IT                                     * 4ECB7
          ::                                     * 4ECBC
            OBJ_4E519                            * 4ECC1
            MARKGROB                             * 4ECC6
            OBJ_4DEAE                            * 4ECCB
            OBJ_4DB18                            * 4ECD0
          ;                                      * 4ECD5
          CROSS_HAIRS                            * 4ECDA
        ;                                        * 4ECDF

* refs (1): 3E78C
\REPL:
        ::                                       * 4ECE4
          CHECKMENU                              * 4ECE9
          DEPTH                                  * 4ECEE
          #0=case                                * 4ECF3

Warning201:
          ::                                     * 4ECF8
            #       201                          * 4ECFD  513
            OBJ_6BC2D                            * 4ED07
          ;                                      * 4ED0C
          DUP                                    * 4ED11
          TYPEGROB?                              * 4ED16
          NOTcase                                * 4ED1B

Warning202:
          ::                                     * 4ED20
            #       202                          * 4ED25  514
            OBJ_6BC2D                            * 4ED2F
          ;                                      * 4ED34
          CK1NOLASTWD                            * 4ED39
          OBJ_4E6C7                              * 4ED3E
          GBUFF                                  * 4ED43
          SWAP                                   * 4ED48
          OBJ_517B2                              * 4ED4D
          CKGROBFITS                             * 4ED52
          4ROLL                                  * 4ED57
          3UNROLL                                * 4ED5C
          GROB!                                  * 4ED61
          CROSSMARKON                            * 4ED66
        ;                                        * 4ED6B

* refs (1): 4BB2F
OBJ_4ED70:
        ::                                       * 4ED70
          '                                      * 4ED75
          15GETLAM                               * 4ED7A
          '                                      * 4ED7F
          GETXPOS                                * 4ED84
          '                                      * 4ED89
          1PUTLAM                                * 4ED8E
          BINT28                                 * 4ED93
          TestSysFlag                            * 4ED98
          case                                   * 4ED9D
          OBJ_4BB98                              * 4EDA2
          BINT1                                  * 4EDA7
          OBJ_4A96E                              * 4EDAC
          DROP                                   * 4EDB1
          '                                      * 4EDB6
          '                                      * 4EDBB
          OBJ_4BF71                              * 4EDC0
          ITE                                    * 4EDC5
          OBJ_4C616                              * 4EDCA
          OBJ_4B747                              * 4EDCF
          BINT1                                  * 4EDD4
          BINT31                                 * 4EDD9
          TestSysFlag                            * 4EDDE
          ITE                                    * 4EDE3
          ::                                     * 4EDE8
            '                                    * 4EDED
            ::                                   * 4EDF2
              DROP                               * 4EDF7
              COLA                               * 4EDFC
              OBJ_5135F                          * 4EE01
            ;                                    * 4EE06
          ;                                      * 4EE0B
          ::                                     * 4EE10
            '                                    * 4EE15
            OBJ_4EF73                            * 4EE1A
          ;                                      * 4EE1F
          BINT1                                  * 4EE24
          3GETLAM                                * 4EE29
          BINT9                                  * 4EE2E
          ::N                                    * 4EE33
          2PUTLAM                                * 4EE38
        ;                                        * 4EE3D

* refs (6): 57176 73303 73338 73397 733E2 73415
OBJ_4EE42:
        ::                                       * 4EE42
          BINT1                                  * 4EE47
          GetEqN                                 * 4EE4C
          NOTcaseFALSE                           * 4EE51
          DROPTRUE                               * 4EE56
        ;                                        * 4EE5B

* refs (2): 73433 737A6
OBJ_4EE60:
        ::                                       * 4EE60
          BINT0                                  * 4EE65
          3PUTLAM                                * 4EE6A

* refs (3): 0C9E0 4DE40 4DE86
OBJ_4EE6F:
          ::                                     * 4EE6F
            7GETLAM                              * 4EE74
            TOTEMPOB                             * 4EE79
            7PUTLAM                              * 4EE7E
            8GETLAM                              * 4EE83
            TOTEMPOB                             * 4EE88
            8PUTLAM                              * 4EE8D
          ;                                      * 4EE92
          DispMenu.1                             * 4EE97
        ;                                        * 4EE9C

* refs (1): 73B75
OBJ_4EEA1:
        ::                                       * 4EEA1
          OBJ_456E5                              * 4EEA6
          BINT1                                  * 4EEAB
          NTHCOMPDROP                            * 4EEB0
          EVAL                                   * 4EEB5
        ;                                        * 4EEBA

* refs (16): 0C9B3 47ACE 47AF1 47BD7 47C2C 47FFE ...
OBJ_4EEBF:
        ::                                       * 4EEBF
          OBJ_496A0                              * 4EEC4
          ITE                                    * 4EEC9
          DROP                                   * 4EECE
          ::                                     * 4EED3
            %4                                   * 4EED8
            %4                                   * 4EEDD
            %0_2A2B4                             * 4EEE2
          ;                                      * 4EEE7
          'IDPAR                                 * 4EEEC
          OBJ_4735A                              * 4EEF1
          ?SKIP                                  * 4EEF6
          MAKEPVARS                              * 4EEFB
          OBJ_49A74                              * 4EF00
        ;                                        * 4EF05

* refs (2): 4A9F6 4B540
OBJ_4EF0A:
        ::                                       * 4EF0A
          OBJ_4C64D                              * 4EF0F
          OBJ_514C3                              * 4EF14
        ;                                        * 4EF19

* refs (1): 4CA91
OBJ_4EF1E:
        ::                                       * 4EF1E
          3PICK                                  * 4EF23
          2GETLAM                                * 4EF28
          %=                                     * 4EF2D
          case                                   * 4EF32
          ::                                     * 4EF37
            3DROP                                * 4EF3C
            1GETLAM                              * 4EF41
          ;                                      * 4EF46
          3UNROLL                                * 4EF4B
          %-                                     * 4EF50
          SWAP                                   * 4EF55
          %/                                     * 4EF5A
          %1+                                    * 4EF5F
          %IP                                    * 4EF64
          COERCE                                 * 4EF69
        ;                                        * 4EF6E

* refs (2): 4BF3F 4EE1A
OBJ_4EF73:
        ::                                       * 4EF73
          BINT28                                 * 4EF78
          PUTLAM                                 * 4EF7D
          ERRSET                                 * 4EF82
          EVALCRUNCH                             * 4EF87
          ERRTRAP                                * 4EF8C
          ::                                     * 4EF91
            ERROR@                               * 4EF96
            #       100                          * 4EF9B  256
            #/                                   * 4EFA5
            SWAPDROP                             * 4EFAA
            BINT3                                * 4EFAF
            #<>case                              * 4EFB4
            ERRJMP                               * 4EFB9
            ERRORCLR                             * 4EFBE
            BINT31                               * 4EFC3
            TestSysFlag                          * 4EFC8
            ?SKIP                                * 4EFCD
            ::                                   * 4EFD2
              BINT28                             * 4EFD7
              GETLAM                             * 4EFDC
              OBJ_4C22E                          * 4EFE1
            ;                                    * 4EFE6
            2RDROP                               * 4EFEB
          ;                                      * 4EFF0
          0LASTOWDOB!                            * 4EFF5
          CK1NOLASTWD                            * 4EFFA
          U>nbr                                  * 4EFFF
        ;                                        * 4F004

* refs (1): 1E2FF
pview(c):
        ::                                       * 4F009
          GBUFFGROBDIM                           * 4F00E
          OBJ_4F1A1                              * 4F013
          NcaseSIZEERR                           * 4F018
          WINDOW#                                * 4F01D
        ;                                        * 4F022

* refs (1): 1E309
OBJ_4F027:
        ::                                       * 4F027
          NULL{}                                 * 4F02C
          EQUALcasedrop                          * 4F031
          DOGRAPHIC                              * 4F036
          2HXSLIST?                              * 4F03B
          WINDOW#                                * 4F040
        ;                                        * 4F045
        BSS     8                                * 4F04A

* #x #y  ->
* refs (2): 4F01D 4F040
WINDOW#:
        ::                                       * 4F052
          CHECKPICT                              * 4F057
          GBUFF                                  * 4F05C
          InGrob(2s,go)?#:BAV!                   * 4F061
          GBUFFGROBDIM                           * 4F066
          4PICK                                  * 4F06B
          BINT131                                * 4F070
          OBJ_50316                              * 4F075
          SWAP3PICK                              * 4F07A
          BINT64                                 * 4F07F
          OBJ_50316                              * 4F084
          ORcase                                 * 4F089
          SETSIZEERR                             * 4F08E
          TOGDISP                                * 4F093
          SWAP                                   * 4F098
          WINDOWXY                               * 4F09D
          TURNMENUOFF                            * 4F0A2
        ;                                        * 4F0A7
