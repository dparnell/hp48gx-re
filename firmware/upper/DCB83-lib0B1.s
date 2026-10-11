* HP 48GX ROM revision R, #DCB83-#DE45E: Library part 0B1
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~MsgBoxMenu ~DoMsgBox DoMKeyOK Ck&DoMsgBox
* Follows on from the previous file (at #DCB83 in the original ROM).

LIB0B1:
        CON(3)  #0B1                             * DCB83  library number
        REL(5)  LIB0B1.hash                      * DCB86  hash table
        CON(5)  0                                * DCB8B  message table
        REL(5)  LIB0B1.link                      * DCB90  link table
        CON(5)  0                                * DCB95  config
        RPL

* ROMPTR 0B1 000
* refs (1): DCB83
~DoMsgBox:
        ::                                       * DCB9A
          POLSaveUI                              * DCB9F
          ERRSET                                 * DCBA4
          ::                                     * DCBA9
            MINUSONE                             * DCBAE
            MINUSONE                             * DCBB3
            MINUSONE                             * DCBB8
            MINUSONE                             * DCBBD
            ROMPTR  0B3 057                      * DCBC2
            FALSE                                * DCBCD
            BINT6                                * DCBD2
            ROMPTR  0B0 0DB                      * DCBD7  ~nNullBind
            5ROLL                                * DCBE2
            DUPTYPEGROB?                         * DCBE7
            ?SKIP                                * DCBEC
            OBJ_1A002                            * DCBF1
            5UNROLL                              * DCBF6
            5PICK                                * DCBFB
            5PICK                                * DCC00
            5PICK                                * DCC05
            ROMPTR  0B1 00B                      * DCC0A
            DUP                                  * DCC15
            7PUTLAM                              * DCC1A
            BINT28                               * DCC1F
            SWAP                                 * DCC24
            BINT9                                * DCC29
            #*                                   * DCC2E
            #7+                                  * DCC33
            #2/                                  * DCC38
            #-                                   * DCC3D
            6PUTLAM                              * DCC42
            ROMPTR  0B1 00C                      * DCC47
            '                                    * DCC52
            ROMPTR  0B1 001                      * DCC57
            '                                    * DCC62
            ROMPTR  0B1 003                      * DCC67
            TrueTrue                             * DCC72
            5ROLL                                * DCC77
            ONEFALSE                             * DCC7C
            '                                    * DCC81
            2GETLAM                              * DCC86
            'ERRJMP                              * DCC8B
            POLSetUI                             * DCC90
            ClrDA1IsStat                         * DCC95
            ClrDA2bEdit                          * DCC9A
            ROMPTR  0B1 008                      * DCC9F
            ClrDA3OK                             * DCCAA
            POLKeyUI                             * DCCAF
            ROMPTR  0B1 00D                      * DCCB4
            ClrDAsOK                             * DCCBF
            3GETLAM                              * DCCC4
            ROMPTR  0B3 058                      * DCCC9
            ABND                                 * DCCD4
          ;                                      * DCCD9
          ERRTRAP                                * DCCDE
          POLResUI&Err                           * DCCE3
          POLRestoreUI                           * DCCE8
        ;                                        * DCCED

* ROMPTR 0B1 001
* refs (1): DCB83
ROMP_0B1_001:
        ::                                       * DCCF2
          DA3OK?                                 * DCCF7
          ?SKIP                                  * DCCFC
          ?DispMenu                              * DCD01
          ClrDA3OK                               * DCD06
        ;                                        * DCD0B

* ROMPTR 0B1 002
* refs (1): DCB83
~MsgBoxMenu:
        ::                                       * DCD10
          NoExitAction                           * DCD15
          {                                      * DCD1A
            NullMenuKey                          * DCD1F
            NullMenuKey                          * DCD24
            NullMenuKey                          * DCD29
            NullMenuKey                          * DCD2E
            NullMenuKey                          * DCD33
            {                                    * DCD38
              $       "OK"                       * DCD3D
              ::                                 * DCD4B
                TakeOver                         * DCD50
                ROMPTR  0B1 009                  * DCD55  DoMKeyOK
              ;                                  * DCD60
            }                                    * DCD65
          }                                      * DCD6A
        ;                                        * DCD6F

* ROMPTR 0B1 003
* refs (1): DCB83
ROMP_0B1_003:
        ::                                       * DCD74
          BINT1                                  * DCD79
          #=casedrop                             * DCD7E
          ROMPTR  0B1 004                        * DCD83
          BINT2                                  * DCD8E
          #=casedrop                             * DCD93
          ROMPTR  0B1 005                        * DCD98
          BINT3                                  * DCDA3
          #=casedrop                             * DCDA8
          ROMPTR  0B1 006                        * DCDAD
          BINT4                                  * DCDB8
          #=casedrop                             * DCDBD
          ROMPTR  0B1 007                        * DCDC2
          2DROP                                  * DCDCD
          'DoBadKeyT                             * DCDD2
        ;                                        * DCDD7

* ROMPTR 0B1 004
* refs (1): DCB83
ROMP_0B1_004:
        ::                                       * DCDDC
          {                                      * DCDE1
            BINT25                               * DCDE6
            ::                                   * DCDEB
              TakeOver                           * DCDF0
              ROMPTR  0B1 009                    * DCDF5  DoMKeyOK
            ;                                    * DCE00
            BINT45                               * DCE05
            ::                                   * DCE0A
              TakeOver                           * DCE0F
              ROMPTR  0B1 009                    * DCE14  DoMKeyOK
            ;                                    * DCE1F
          }                                      * DCE24
          OBJ_19FE4                              * DCE29
          caseTRUE                               * DCE2E
          DUP#<7                                 * DCE33
          casedrpfls                             * DCE38
          BINT12                                 * DCE3D
          #=casedrpfls                           * DCE42
          BINT35                                 * DCE47
          #=casedrpfls                           * DCE4C
          BINT40                                 * DCE51
          #=casedrpfls                           * DCE56
          DROP                                   * DCE5B
          'DoBadKeyT                             * DCE60
        ;                                        * DCE65

* ROMPTR 0B1 005
* refs (1): DCB83
ROMP_0B1_005:
        ::                                       * DCE6A
          DUP#<7                                 * DCE6F
          casedrpfls                             * DCE74
          BINT12                                 * DCE79
          #=casedrpfls                           * DCE7E
          BINT35                                 * DCE83
          #=casedrpfls                           * DCE88
          DROP                                   * DCE8D
          'DoBadKeyT                             * DCE92
        ;                                        * DCE97

* ROMPTR 0B1 006
* refs (1): DCB83
ROMP_0B1_006:
        ::                                       * DCE9C
          BINT45                                 * DCEA1
          #=casedrpfls                           * DCEA6
          DUP#<7                                 * DCEAB
          casedrpfls                             * DCEB0
          BINT40                                 * DCEB5
          #=casedrpfls                           * DCEBA
          DROP                                   * DCEBF
          'DoBadKeyT                             * DCEC4
        ;                                        * DCEC9

* ROMPTR 0B1 007
* refs (1): DCB83
ROMP_0B1_007:
        ::                                       * DCECE
          {                                      * DCED3
            BINT25                               * DCED8
            ::                                   * DCEDD
              TakeOver                           * DCEE2
              ROMPTR  0B1 009                    * DCEE7  DoMKeyOK
            ;                                    * DCEF2
            BINT45                               * DCEF7
            ::                                   * DCEFC
              TakeOver                           * DCF01
              ROMPTR  0B1 009                    * DCF06  DoMKeyOK
            ;                                    * DCF11
          }                                      * DCF16
          OBJ_19FE4                              * DCF1B
          caseTRUE                               * DCF20
          BINT30                                 * DCF25
          #=casedrpfls                           * DCF2A
          DROP                                   * DCF2F
          'DoBadKeyT                             * DCF34
        ;                                        * DCF39

* ROMPTR 0B1 008
* refs (1): DCB83
ROMP_0B1_008:
        ::                                       * DCF3E
          {                                      * DCF43
            ROMPTR  0B3 05C                      * DCF48  ~BBGetDefltHeight
            ROMPTR  0B3 05D                      * DCF53
            ROMPTR  0B3 05E                      * DCF5E
            ROMPTR  0B3 05F                      * DCF69  ~$>grobOrGROB
          }                                      * DCF74
          7GETLAM                                * DCF79
          #1-                                    * DCF7E
          OBJ_1A01B                              * DCF83
          HARDBUFF                               * DCF88
          BINT16                                 * DCF8D
          6GETLAM                                * DCF92
          GROB!                                  * DCF97
          DUP                                    * DCF9C
          MINUSONE                               * DCFA1
          EQUAL                                  * DCFA6
          ITE                                    * DCFAB
          DROPZERO                               * DCFB0
          ::                                     * DCFB5
            DUP                                  * DCFBA
            HARDBUFF                             * DCFBF
            BINT19                               * DCFC4
            6GETLAM                              * DCFC9
            #3+                                  * DCFCE
            GROB!                                * DCFD3
            GROBDIMw                             * DCFD8
            #5+                                  * DCFDD
          ;                                      * DCFE2
          4UNROLL                                * DCFE7
          ROT                                    * DCFEC
          BINT1                                  * DCFF1
          BINT5                                  * DCFF6
          ZERO_DO                                * DCFFB
          BINT4                                  * DD000
          NDUP                                   * DD005
          ROMPTR  0B1 00A                        * DD00A
          ITE                                    * DD015
          ::                                     * DD01A
            3UNROLL                              * DD01F
            4PICK                                * DD024
            3UNROLL                              * DD029
            SUB$                                 * DD02E
            $>GROB                               * DD033
            HARDBUFF                             * DD038
            BINT19                               * DD03D
            BINT8                                * DD042
            PICK                                 * DD047
            #+                                   * DD04C
            6GETLAM                              * DD051
            INDEX@                               * DD056
            BINT9                                * DD05B
            #*                                   * DD060
            #+                                   * DD065
            #4+                                  * DD06A
            GROB!                                * DD06F
          ;                                      * DD074
          ExitAtLOOP                             * DD079
          LOOP                                   * DD07E
          5DROP                                  * DD083
        ;                                        * DD088

* ROMPTR 0B1 009
* refs (1): DCB83
DoMKeyOK:
        ::                                       * DD08D
          TRUE                                   * DD092
          TRUE                                   * DD097
          2PUTLAM                                * DD09C
        ;                                        * DD0A1

* ROMPTR 0B1 00A
* refs (1): DCB83
ROMP_0B1_00A:
        ::                                       * DD0A6
          OVER                                   * DD0AB
          LEN$                                   * DD0B0
          2DUP                                   * DD0B5
          #>                                     * DD0BA
          case                                   * DD0BF
          ::                                     * DD0C4
            5DROP                                * DD0C9
            FALSE                                * DD0CE
          ;                                      * DD0D3
          OVER                                   * DD0D8
          6ROLL                                  * DD0DD
          #+                                     * DD0E2
          #1-                                    * DD0E7
          OVER                                   * DD0EC
          #MIN                                   * DD0F1
          4ROLL                                  * DD0F6
          4ROLL                                  * DD0FB
          2DUP                                   * DD100
          CHR_Newline                            * DD105
          SWAP                                   * DD10A
          POS$                                   * DD10F
          DUP                                    * DD114
          5PICK                                  * DD119
          #1+                                    * DD11E
          #>                                     * DD123
          NOT                                    * DD128
          OVER                                   * DD12D
          #0<>                                   * DD132
          AND                                    * DD137
          case                                   * DD13C
          ::                                     * DD141
            6UNROLL                              * DD146
            5DROP                                * DD14B
            DUP                                  * DD150
            #1-                                  * DD155
            SWAP                                 * DD15A
            #1+                                  * DD15F
            TRUE                                 * DD164
          ;                                      * DD169
          DROP                                   * DD16E
          4PICK                                  * DD173
          4PICK                                  * DD178
          #>                                     * DD17D
          NOTcase                                * DD182
          ::                                     * DD187
            3DROP                                * DD18C
            SWAPDROP                             * DD191
            DUP                                  * DD196
            #1+                                  * DD19B
            TRUE                                 * DD1A0
          ;                                      * DD1A5
          SWAP                                   * DD1AA
          CHR_Space                              * DD1AF
          4PICK                                  * DD1B4
          #1+                                    * DD1B9
          POS$REV                                * DD1BE
          SWAP                                   * DD1C3
          5ROLL                                  * DD1C8
          #+                                     * DD1CD
          4ROLL                                  * DD1D2
          #MIN                                   * DD1D7
          OVER                                   * DD1DC
          #>                                     * DD1E1
          ITE                                    * DD1E6
          ::                                     * DD1EB
            DROP                                 * DD1F0
            DUP                                  * DD1F5
            #1+                                  * DD1FA
          ;                                      * DD1FF
          ::                                     * DD204
            SWAPDROP                             * DD209
            DUP                                  * DD20E
            #1-                                  * DD213
            SWAP                                 * DD218
            #1+                                  * DD21D
          ;                                      * DD222
          TRUE                                   * DD227
        ;                                        * DD22C

* ROMPTR 0B1 00B
* refs (1): DCB83
ROMP_0B1_00B:
        ::                                       * DD231
          3PICK                                  * DD236
          TYPEGROB?                              * DD23B
          case2drop                              * DD240
          ::                                     * DD245
            GROBDIM                              * DD24A
            DROP                                 * DD24F
            BINT9                                * DD254
            #/                                   * DD259
            SWAP                                 * DD25E
            #0<>                                 * DD263
            IT                                   * DD268
            #1+                                  * DD26D
          ;                                      * DD272
          BINT0                                  * DD277
          4UNROLL                                * DD27C
          ROT                                    * DD281
          BINT1                                  * DD286
          BINT5                                  * DD28B
          ZERO_DO                                * DD290
          BINT4                                  * DD295
          NDUP                                   * DD29A
          ROMPTR  0B1 00A                        * DD29F
          ITE                                    * DD2AA
          ::                                     * DD2AF
            3UNROLL                              * DD2B4
            2DROP                                * DD2B9
            5ROLL                                * DD2BE
            #1+                                  * DD2C3
            5UNROLL                              * DD2C8
          ;                                      * DD2CD
          ExitAtLOOP                             * DD2D2
          LOOP                                   * DD2D7
          4DROP                                  * DD2DC
          BINT2                                  * DD2E1
          #MAX                                   * DD2E6
        ;                                        * DD2EB

* ROMPTR 0B1 00C
* refs (1): DCB83
ROMP_0B1_00C:
        ::                                       * DD2F0
          HARDBUFF                               * DD2F5
          BINT16                                 * DD2FA
          6GETLAM                                * DD2FF
          #       76                             * DD304  118
          OVER                                   * DD30E
          7GETLAM                                * DD313
          BINT9                                  * DD318
          #*                                     * DD31D
          #+                                     * DD322
          #7+                                    * DD327
          SUBGROB                                * DD32C
          5PUTLAM                                * DD331
          HARDBUFF2                              * DD336
          TOTEMPOB                               * DD33B
          4PUTLAM                                * DD340
        ;                                        * DD345

* ROMPTR 0B1 00D
* refs (1): DCB83
ROMP_0B1_00D:
        ::                                       * DD34A
          5GETLAM                                * DD34F
          HARDBUFF                               * DD354
          BINT16                                 * DD359
          6GETLAM                                * DD35E
          GROB!                                  * DD363
          4GETLAM                                * DD368
          HARDBUFF2                              * DD36D
          ZEROZERO                               * DD372
          GROB!                                  * DD377
        ;                                        * DD37C

* ROMPTR 0B1 00E
* refs (1): DCB83
Ck&DoMsgBox:
        ::                                       * DD381
          BINT15                                 * DD386
          BINT10                                 * DD38B
          MINUSONE                               * DD390
          '                                      * DD395
          ROMPTR  0B1 002                        * DD39A  ~MsgBoxMenu
          ROMPTR  0B1 000                        * DD3A5  ~DoMsgBox
          DROP                                   * DD3B0
        ;                                        * DD3B5

* ROMPTR 0B1 00F
* refs (1): DCB83
ROMP_0B1_00F:
        ::                                       * DD3BA
          POLSaveUI                              * DD3BF
          ERRSET                                 * DD3C4
          ::                                     * DD3C9
            FALSE                                * DD3CE
            FALSE                                * DD3D3
            BINT5                                * DD3D8
            ROMPTR  0B0 0DB                      * DD3DD  ~nNullBind
            InitEd&Modes                         * DD3E8
            '                                    * DD3ED
            ROMPTR  0B1 010                      * DD3F2
            '                                    * DD3FD
            ROMPTR  0B1 015                      * DD402
            TrueFalse                            * DD40D
            4GETLAM                              * DD412
            ONEFALSE                             * DD417
            '                                    * DD41C
            2GETLAM                              * DD421
            '                                    * DD426
            ::                                   * DD42B
              SysErrorTrap                       * DD430
              AtUserStack                        * DD435
            ;                                    * DD43A
            POLSetUI                             * DD43F
            ClrDAsOK                             * DD444
            AtUserStack                          * DD449
            POLKeyUI                             * DD44E
            ABND                                 * DD453
          ;                                      * DD458
          ERRTRAP                                * DD45D
          POLResUI&Err                           * DD462
          POLRestoreUI                           * DD467
          ClrDAsOK                               * DD46C
        ;                                        * DD471

* ROMPTR 0B1 010
* refs (1): DCB83
ROMP_0B1_010:
        ::                                       * DD476
          DA2aOK?                                * DD47B
          DUP                                    * DD480
          ITE                                    * DD485
          SetDA2aTempF                           * DD48A
          ClrDA2aTempF                           * DD48F
          ?SKIP                                  * DD494
          ?DispStack                             * DD499
          DA2aTempF?                             * DD49E
          DA2bOK?NOTIT                           * DD4A3
          DispEditLine                           * DD4A8
          DA3OK?                                 * DD4AD
          DUPUNROT                               * DD4B2
          NOTAND                                 * DD4B7
          ROMPTR  0B1 013                        * DD4BC
          NOTAND                                 * DD4C7
          IT                                     * DD4CC
          SetDA1Bad                              * DD4D1
          ?SKIP                                  * DD4D6
          ?DispMenu                              * DD4DB
          DA1OK?                                 * DD4E0
          ?SKIP                                  * DD4E5
          ROMPTR  0B1 011                        * DD4EA
          ClrDAsOK                               * DD4F5
        ;                                        * DD4FA

* ROMPTR 0B1 011
* refs (1): DCB83
ROMP_0B1_011:
        ::                                       * DD4FF
          KEYINBUFFER?                           * DD504
          NOTcase                                * DD509
          ROMPTR  0B1 012                        * DD50E
          SetDA1Bad                              * DD519
        ;                                        * DD51E

* ROMPTR 0B1 012
* refs (1): DCB83
ROMP_0B1_012:
        ::                                       * DD523
          ROMPTR  0B1 013                        * DD528
          3GETLAM                                * DD533
          ANDcase                                * DD538
          DispStatus                             * DD53D
          TOADISP                                * DD542
          DispStsBound                           * DD547
          6GETLAM                                * DD54C
          EVAL                                   * DD551
          DUPTYPECSTR?                           * DD556
          IT                                     * DD55B
          ROMPTR  0B0 0A5                        * DD560
          HARDBUFF                               * DD56B
          ZEROZERO                               * DD570
          BINT0                                  * DD575
          BINT7                                  * DD57A
          BLANKIT                                * DD57F
          GROB!                                  * DD584
          ROMPTR  0B1 013                        * DD589
          ITE                                    * DD594
          ::                                     * DD599
            5GETLAM                              * DD59E
            EVAL                                 * DD5A3
          ;                                      * DD5A8
          ::                                     * DD5AD
            #       B901                         * DD5B2  47361
            JstGetTHEMESG                        * DD5BC
          ;                                      * DD5C1
          DUPTYPECSTR?                           * DD5C6
          ITE                                    * DD5CB
          ::                                     * DD5D0
            $>grob                               * DD5D5
            BINT1                                * DD5DA
            BINT8                                * DD5DF
          ;                                      * DD5E4
          ::                                     * DD5E9
            BINT1                                * DD5EE
            BINT7                                * DD5F3
          ;                                      * DD5F8
          HARDBUFF                               * DD5FD
          3UNROLL                                * DD602
          BINT7                                  * DD607
          BINT7                                  * DD60C
          BLANKIT                                * DD611
          GROB!                                  * DD616
          SetDA1Valid                            * DD61B
        ;                                        * DD620

* ROMPTR 0B1 013
* refs (1): DCB83
ROMP_0B1_013:
        ::                                       * DD625
          MenuDef@                               * DD62A
          4GETLAM                                * DD62F
          EQUAL                                  * DD634
        ;                                        * DD639

* ROMPTR 0B1 014
* refs (1): DCB83
ROMP_0B1_014:
        ::                                       * DD63E
          NoExitAction                           * DD643
          {                                      * DD648
            {                                    * DD64D
              ::                                 * DD652
                PTR     Box/StdLbl:              * DD657
                $       "STS"                    * DD65C
                3GETLAM                          * DD66C
              ;                                  * DD671
              ROMPTR  0B1 019                    * DD676
            }                                    * DD681
            NullMenuKey                          * DD686
            NullMenuKey                          * DD68B
            NullMenuKey                          * DD690
            {                                    * DD695
              $       "(AN(L"                    * DD69A
              ROMPTR  0B1 01A                    * DD6AE
            }                                    * DD6B9
            {                                    * DD6BE
              $       "OK"                       * DD6C3
              ROMPTR  0B1 01B                    * DD6D1
            }                                    * DD6DC
          }                                      * DD6E1
        ;                                        * DD6E6

* ROMPTR 0B1 015
* refs (1): DCB83
ROMP_0B1_015:
        ::                                       * DD6EB
          BINT1                                  * DD6F0
          #=casedrop                             * DD6F5
          ROMPTR  0B1 016                        * DD6FA
          BINT2                                  * DD705
          #=casedrop                             * DD70A
          ROMPTR  0B1 017                        * DD70F
          BINT4                                  * DD71A
          #=casedrop                             * DD71F
          ROMPTR  0B1 016                        * DD724
          2DROPFALSE                             * DD72F
        ;                                        * DD734

* ROMPTR 0B1 016
* refs (1): DCB83
ROMP_0B1_016:
        ::                                       * DD739
          BINT45                                 * DD73E
          ?CaseKeyDef                            * DD743
          ROMPTR  0B1 01A                        * DD748
          DROPFALSE                              * DD753
        ;                                        * DD758

* ROMPTR 0B1 017
* refs (1): DCB83
ROMP_0B1_017:
        ::                                       * DD75D
          BINT45                                 * DD762
          ?CaseKeyDef                            * DD767
          ROMPTR  0B1 018                        * DD76C
          DROPFALSE                              * DD777
        ;                                        * DD77C

* ROMPTR 0B1 018
* refs (1): DCB83
ROMP_0B1_018:
        ::                                       * DD781
          TakeOver                               * DD786
          4GETLAM                                * DD78B
          InitMenu                               * DD790
          SetDA2NoCh                             * DD795
        ;                                        * DD79A

* ROMPTR 0B1 019
* refs (1): DCB83
ROMP_0B1_019:
        ::                                       * DD79F
          TakeOver                               * DD7A4
          3GETLAM                                * DD7A9
          NOT                                    * DD7AE
          3PUTLAM                                * DD7B3
          SetDA2NoCh                             * DD7B8
        ;                                        * DD7BD

* ROMPTR 0B1 01A
* refs (1): DCB83
ROMP_0B1_01A:
        ::                                       * DD7C2
          TakeOver                               * DD7C7
          EditLExists?                           * DD7CC
          DAsBad?                                * DD7D1
          ORcase                                 * DD7D6
          ROMP_0A1_02C                           * DD7DB
          FALSE                                  * DD7E0
          TRUE                                   * DD7E5
          2PUTLAM                                * DD7EA
        ;                                        * DD7EF

* ROMPTR 0B1 01B
* refs (1): DCB83
ROMP_0B1_01B:
        ::                                       * DD7F4
          TakeOver                               * DD7F9
          EditExstCase                           * DD7FE
          ROMP_0A1_018                           * DD803
          DEPTH                                  * DD808
          #0<>                                   * DD80D
          TRUE                                   * DD812
          2PUTLAM                                * DD817
        ;                                        * DD81C

* ROMPTR 0B1 01C
* refs (1): DCB83
ROMP_0B1_01C:
        ::                                       * DD821
          SuspendOK?                             * DD826
          NOTcase                                * DD82B
          NOHALTERR                              * DD830
          4PICK                                  * DD835
          INNERCOMP                              * DD83A
          DUP#0=                                 * DD83F
          caseSIZEERR                            * DD844
          DUP                                    * DD849
          1LAMBIND                               * DD84E
          ZERO_DO                                * DD853
          ISTOP@                                 * DD858
          ROLL                                   * DD85D
          DUPTYPELIST?                           * DD862
          IT                                     * DD867
          ::                                     * DD86C
            DUPNULLCOMP?                         * DD871
            casedrop                             * DD876
            MINUSONE                             * DD87B
            CARCOMP                              * DD880
          ;                                      * DD885
          DUPTYPECSTR?                           * DD88A
          OVER                                   * DD88F
          MINUSONE                               * DD894
          EQUAL                                  * DD899
          OR                                     * DD89E
          NOTcase                                * DD8A3
          SETTYPEERR                             * DD8A8
          LOOP                                   * DD8AD
          1GETABND                               * DD8B2
          {}N                                    * DD8B7
          BINT1                                  * DD8BC
          5ROLL                                  * DD8C1
          INNERCOMP                              * DD8C6
          DUP                                    * DD8CB
          BINT2                                  * DD8D0
          #>                                     * DD8D5
          caseSIZEERR                            * DD8DA
          ::                                     * DD8DF
            BINT0                                * DD8E4
            #=casedrop                           * DD8E9
            ::                                   * DD8EE
              BINT1                              * DD8F3
              BINT3                              * DD8F8
            ;                                    * DD8FD
            #1=case                              * DD902
            ::                                   * DD907
              CKREAL                             * DD90C
              COERCE                             * DD911
              DUP#0=                             * DD916
              caseSIZEERR                        * DD91B
              BINT3                              * DD920
            ;                                    * DD925
            SWAP                                 * DD92A
            CKREAL                               * DD92F
            COERCE                               * DD934
            DUP#0=                               * DD939
            caseSIZEERR                          * DD93E
            SWAP                                 * DD943
            CKREAL                               * DD948
            COERCE                               * DD94D
          ;                                      * DD952
          SWAP                                   * DD957
          BINT10                                 * DD95C
          #MIN                                   * DD961
          SWAP                                   * DD966
          BINT20                                 * DD96B
          #MIN                                   * DD970
          ROMPTR  0B1 01E                        * DD975
          DUPNULLCOMP?                           * DD980
          caseSIZEERR                            * DD985
          5ROLL                                  * DD98A
          SWAP                                   * DD98F
          INNERCOMP                              * DD994
          BINT1                                  * DD999
          OVER                                   * DD99E
          2NULLLAM{}                             * DD9A3
          BIND                                   * DD9A8
          ZERO_DO                                * DD9AD
          ISTOP@                                 * DD9B2
          ROLL                                   * DD9B7
          'DROPFALSE                             * DD9BC
          >HCOMP                                 * DD9C1
          BINT1                                  * DD9C6
          BEGIN                                  * DD9CB
          ISTOP@                                 * DD9D0
          #2+                                    * DD9D5
          PICK                                   * DD9DA
          INDEX@                                 * DD9DF
          2GETLAM                                * DD9E4
          #+                                     * DD9E9
          NTHCOMPDROP                            * DD9EE
          DUPTYPELIST?                           * DD9F3
          ITE                                    * DD9F8
          DUPNULLCOMP?                           * DD9FD
          FALSE                                  * DDA02
          WHILE                                  * DDA07
          ::                                     * DDA0C
            DROP                                 * DDA11
            2GETLAM                              * DDA16
            #1+                                  * DDA1B
            2PUTLAM                              * DDA20
          ;                                      * DDA25
          REPEAT                                 * DDA2A
          ::                                     * DDA2F
            CK&DISPATCH0                         * DDA34
            BINT3                                * DDA39
            ::                                   * DDA3E
              DROP                               * DDA43
              MINUSONE                           * DDA48
              NULL$                              * DDA4D
            ;                                    * DDA52
            BINT5                                * DDA57
            ::                                   * DDA5C
              DUPLENCOMP                         * DDA61
              DUP                                * DDA66
              BINT2                              * DDA6B
              #<                                 * DDA70
              case2drop                          * DDA75
              ::                                 * DDA7A
                MINUSONE                         * DDA7F
                NULL$                            * DDA84
              ;                                  * DDA89
              OVER                               * DDA8E
              BINT2                              * DDA93
              NTHCOMPDROP                        * DDA98
              DUPTYPECSTR?                       * DDA9D
              NcaseTYPEERR                       * DDAA2
              3UNROLL                            * DDAA7
              DUP                                * DDAAC
              #2=                                * DDAB1
              case2drop                          * DDAB6
              ::                                 * DDABB
                MINUSONE                         * DDAC0
                SWAP                             * DDAC5
                BINT131                          * DDACA
                ROMPTR  0B0 06F                  * DDACF
                DROP                             * DDADA
              ;                                  * DDADF
              BINT3                              * DDAE4
              SWAP                               * DDAE9
              SUBCOMP                            * DDAEE
              ROMPTR  0B1 01D                    * DDAF3
              SWAP                               * DDAFE
              BINT131                            * DDB03
              ROMPTR  0B0 06F                    * DDB08
              DROP                               * DDB13
            ;                                    * DDB18
          ;                                      * DDB1D
          BINT4                                  * DDB22
          SWAP                                   * DDB27
          MINUSONE                               * DDB2C
          DUP                                    * DDB31
          BINT6                                  * DDB36
          {}N                                    * DDB3B
          &COMP                                  * DDB40
          LOOP                                   * DDB45
          1GETLAM                                * DDB4A
          {}N                                    * DDB4F
          SWAPDROP                               * DDB54
          'DROPFALSE                             * DDB59
          6ROLL                                  * DDB5E
          BINT131                                * DDB63
          #4-                                    * DDB68
          ROMPTR  0B0 06F                        * DDB6D
          DROP                                   * DDB78
          6ROLL                                  * DDB7D
          DUPNULLCOMP?                           * DDB82
          ITE                                    * DDB87
          ::                                     * DDB8C
            DROP                                 * DDB91
            MINUSONE                             * DDB96
          ;                                      * DDB9B
          ::                                     * DDBA0
            INNERCOMP                            * DDBA5
            1GETLAM                              * DDBAA
            OVER                                 * DDBAF
            #<>                                  * DDBB4
            caseSIZEERR                          * DDBB9
            ZERO_DO                              * DDBBE
            ISTOP@                               * DDBC3
            ROLL                                 * DDBC8
            DUP                                  * DDBCD
            '                                    * DDBD2
            ROMPTR  0AB 05B                      * DDBD7  ~xNOVAL
            EQUAL                                * DDBE2
            IT                                   * DDBE7
            ::                                   * DDBEC
              DROP                               * DDBF1
              MINUSONE                           * DDBF6
            ;                                    * DDBFB
            LOOP                                 * DDC00
            1GETLAM                              * DDC05
            {}N                                  * DDC0A
          ;                                      * DDC0F
          6ROLL                                  * DDC14
          DUPNULLCOMP?                           * DDC19
          ITE                                    * DDC1E
          ::                                     * DDC23
            DROP                                 * DDC28
            MINUSONE                             * DDC2D
          ;                                      * DDC32
          ::                                     * DDC37
            INNERCOMP                            * DDC3C
            1GETLAM                              * DDC41
            OVER                                 * DDC46
            #<>                                  * DDC4B
            caseSIZEERR                          * DDC50
            ZERO_DO                              * DDC55
            ISTOP@                               * DDC5A
            ROLL                                 * DDC5F
            DUP                                  * DDC64
            '                                    * DDC69
            ROMPTR  0AB 05B                      * DDC6E  ~xNOVAL
            EQUAL                                * DDC79
            IT                                   * DDC7E
            ::                                   * DDC83
              DROP                               * DDC88
              MINUSONE                           * DDC8D
            ;                                    * DDC92
            LOOP                                 * DDC97
            1GETLAM                              * DDC9C
            {}N                                  * DDCA1
          ;                                      * DDCA6
          ROMPTR  0B1 022                        * DDCAB
          DoInputForm                            * DDCB6
          NOTcase                                * DDCBB
          ::                                     * DDCC0
            ABND                                 * DDCC5
            %0_2A2B4                             * DDCCA
          ;                                      * DDCCF
          1GETLAM                                * DDCD4
          ZERO_DO                                * DDCD9
          ISTOP@                                 * DDCDE
          ROLL                                   * DDCE3
          DUP                                    * DDCE8
          MINUSONE                               * DDCED
          EQUAL                                  * DDCF2
          IT                                     * DDCF7
          ::                                     * DDCFC
            DROP                                 * DDD01
            '                                    * DDD06
            ROMPTR  0AB 05B                      * DDD0B  ~xNOVAL
          ;                                      * DDD16
          LOOP                                   * DDD1B
          1GETABND                               * DDD20
          {}N                                    * DDD25
          %1                                     * DDD2A
        ;                                        * DDD2F

* ROMPTR 0B1 01D
* refs (1): DCB83
ROMP_0B1_01D:
        ::                                       * DDD34
          INNERCOMP                              * DDD39
          DUP                                    * DDD3E
          1LAMBIND                               * DDD43
          ZERO_DO                                * DDD48
          ISTOP@                                 * DDD4D
          ROLL                                   * DDD52
          CKREAL                                 * DDD57
          COERCE                                 * DDD5C
          {                                      * DDD61
            BINT0                                * DDD66
            BINT1                                * DDD6B
            BINT2                                * DDD70
            BINT3                                * DDD75
            BINT4                                * DDD7A
            BINT5                                * DDD7F
            BINT6                                * DDD84
            BINT8                                * DDD89
            BINT9                                * DDD8E
            BINT10                               * DDD93
            BINT13                               * DDD98
          }                                      * DDD9D
          OVER                                   * DDDA2
          #=POSCOMP                              * DDDA7
          #0=                                    * DDDAC
          caseSIZEERR                            * DDDB1
          LOOP                                   * DDDB6
          1GETABND                               * DDDBB
          {}N                                    * DDDC0
        ;                                        * DDDC5

* ROMPTR 0B1 01E
* refs (1): DCB83
ROMP_0B1_01E:
        ::                                       * DDDCA
          BINT6                                  * DDDCF
          #*                                     * DDDD4
          3NULLLAM{}                             * DDDD9
          BIND                                   * DDDDE
          INNERCOMP                              * DDDE3
          NULL{}                                 * DDDE8
          DUP                                    * DDDED
          ROT                                    * DDDF2
          ZERO_DO                                * DDDF7
          ISTOP-INDEX                            * DDDFC
          #2+                                    * DDE01
          ROLL                                   * DDE06
          DUPTYPELIST?                           * DDE0B
          IT                                     * DDE10
          CARCOMP                                * DDE15
          DUP                                    * DDE1A
          MINUSONE                               * DDE1F
          EQUAL                                  * DDE24
          ITE                                    * DDE29
          ::                                     * DDE2E
            DROP                                 * DDE33
            DUPNULLCOMP?                         * DDE38
            ?SEMI                                * DDE3D
            DUPLENCOMP                           * DDE42
            2DUP                                 * DDE47
            NTHCOMPDROP                          * DDE4C
            DUP                                  * DDE51
            BINT2                                * DDE56
            NTHCOMPDROP                          * DDE5B
            {                                    * DDE60
              BINT8                              * DDE65
              BINT17                             * DDE6A
              BINT26                             * DDE6F
              BINT35                             * DDE74
            }                                    * DDE79
            3GETLAM                              * DDE7E
            INDEX@                               * DDE83
            2GETLAM                              * DDE88
            #/                                   * DDE8D
            SWAPDROP                             * DDE92
            #+                                   * DDE97
            NTHELCOMP                            * DDE9C
            ?SKIP                                * DDEA1
            MINUSONE                             * DDEA6
            #<>                                  * DDEAB
            case2DROP                            * DDEB0
            BINT131                              * DDEB5
            #2-                                  * DDEBA
            2GETLAM                              * DDEBF
            #/                                   * DDEC4
            SWAPDROP                             * DDEC9
            BINT6                                * DDECE
            #/                                   * DDED3
            SWAPDROP                             * DDED8
            BINT6                                * DDEDD
            #*                                   * DDEE2
            SWAP                                 * DDEE7
            INCOMPDROP                           * DDEEC
            SWAP                                 * DDEF1
            5ROLL                                * DDEF6
            #+                                   * DDEFB
            SWAP                                 * DDF00
            BINT4                                * DDF05
            {}N                                  * DDF0A
            SWAPROT                              * DDF0F
            PUTLIST                              * DDF14
          ;                                      * DDF19
          ::                                     * DDF1E
            BINT131                              * DDF23
            #2-                                  * DDF28
            2GETLAM                              * DDF2D
            #1-                                  * DDF32
            BINT5                                * DDF37
            #*                                   * DDF3C
            OBJ_6C339                            * DDF41
            2GETLAM                              * DDF46
            #/                                   * DDF4B
            SWAPDROP                             * DDF50
            DUP                                  * DDF55
            BINT5                                * DDF5A
            #+                                   * DDF5F
            INDEX@                               * DDF64
            2GETLAM                              * DDF69
            #/                                   * DDF6E
            DROP                                 * DDF73
            #*                                   * DDF78
            #1+                                  * DDF7D
            BINT131                              * DDF82
            #2-                                  * DDF87
            #MIN                                 * DDF8C
            2DUP                                 * DDF91
            #+                                   * DDF96
            BINT7                                * DDF9B
            OBJ_6C339                            * DDFA0
            BINT2                                * DDFA5
            OBJ_6C339                            * DDFAA
            1GETLAM                              * DDFAF
            DUP#0<>                              * DDFB4
            ITE                                  * DDFB9
            ::                                   * DDFBE
              3PICK                              * DDFC3
              ROT                                * DDFC8
              ROMPTR  0B1 020                    * DDFCD
            ;                                    * DDFD8
            DROP                                 * DDFDD
            OVER                                 * DDFE2
            5PICK                                * DDFE7
            ROMPTR  0B0 071                      * DDFEC
            #+                                   * DDFF7
            BINT2                                * DDFFC
            #+                                   * DE001
            1GETLAM                              * DE006
            DUP#0<>                              * DE00B
            ITE                                  * DE010
            ::                                   * DE015
              4PICK                              * DE01A
              ROT                                * DE01F
              ROMPTR  0B1 021                    * DE024
            ;                                    * DE02F
            DROP                                 * DE034
            #MIN                                 * DE039
            BINT131                              * DE03E
            #2-                                  * DE043
            #MIN                                 * DE048
            2DUP                                 * DE04D
            SWAP                                 * DE052
            OBJ_6C339                            * DE057
            BINT2                                * DE05C
            OBJ_6C339                            * DE061
            5ROLL                                * DE066
            SWAP                                 * DE06B
            ROMPTR  0B0 06F                      * DE070
            DROP                                 * DE07B
            4UNROLL                              * DE080
            ROT                                  * DE085
            3PICK                                * DE08A
            #1-+                                 * DE08F
            OVER                                 * DE094
            OBJ_6C339                            * DE099
            #1-                                  * DE09E
            BINT6                                * DE0A3
            #/                                   * DE0A8
            SWAPDROP                             * DE0AD
            BINT6                                * DE0B2
            #*                                   * DE0B7
            #1+                                  * DE0BC
            BINT9                                * DE0C1
            ROT                                  * DE0C6
            {                                    * DE0CB
              BINT8                              * DE0D0
              BINT17                             * DE0D5
              BINT26                             * DE0DA
              BINT35                             * DE0DF
            }                                    * DE0E4
            3GETLAM                              * DE0E9
            INDEX@                               * DE0EE
            2GETLAM                              * DE0F3
            #/                                   * DE0F8
            SWAPDROP                             * DE0FD
            #+                                   * DE102
            DUP                                  * DE107
            BINT4                                * DE10C
            #>                                   * DE111
            case                                 * DE116
            7DROP                                * DE11B
            NTHCOMPDROP                          * DE120
            2SWAP                                * DE125
            BINT4                                * DE12A
            {}N                                  * DE12F
            4ROLLSWAP                            * DE134
            >TCOMP                               * DE139
            3UNROLL                              * DE13E
            {                                    * DE143
              BINT10                             * DE148
              BINT19                             * DE14D
              BINT28                             * DE152
              BINT37                             * DE157
            }                                    * DE15C
            3GETLAM                              * DE161
            INDEX@                               * DE166
            2GETLAM                              * DE16B
            #/                                   * DE170
            SWAPDROP                             * DE175
            #+                                   * DE17A
            NTHCOMPDROP                          * DE17F
            BINT3                                * DE184
            {}N                                  * DE189
            ROTSWAP                              * DE18E
            >TCOMP                               * DE193
            SWAP                                 * DE198
          ;                                      * DE19D
          LOOP                                   * DE1A2
          ABND                                   * DE1A7
        ;                                        * DE1AC

* ROMPTR 0B1 020
* refs (2): DCB83 DCB83
ROMP_0B1_020:
        ::                                       * DE1B1
          OVER                                   * DE1B6
          #1--                                   * DE1BB
          3PICK                                  * DE1C0
          #/                                     * DE1C5
          SWAPDROP                               * DE1CA
          ROT                                    * DE1CF
          #*                                     * DE1D4
          #+                                     * DE1D9
        ;                                        * DE1DE

* ROMPTR 0B1 021
* refs (1): DCB83
ROMP_0B1_021:
        ::                                       * DE1E3
          OVER                                   * DE1E8
          #1--                                   * DE1ED
          3PICK                                  * DE1F2
          #/                                     * DE1F7
          SWAP                                   * DE1FC
          #0<>                                   * DE201
          IT                                     * DE206
          #1+                                    * DE20B
          ROT                                    * DE210
          #*                                     * DE215
          #+                                     * DE21A
        ;                                        * DE21F

* ROMPTR 0B1 022
* refs (1): DCB83
ROMP_0B1_022:
        ::                                       * DE224
          MINUSONE                               * DE229
          MINUSONE                               * DE22E
          BINT8                                  * DE233
          ROMPTR  0B0 0DB                        * DE238  ~nNullBind
          9GETLAM                                * DE243
          INNERCOMP                              * DE248
          DUP                                    * DE24D
          3PUTLAM                                * DE252
          ZERO_DO                                * DE257
          ISTOP-INDEX                            * DE25C
          INDEX@                                 * DE261
          OBJ_6819D                              * DE266
          #+                                     * DE26B
          ROLL                                   * DE270
          INCOMPDROP                             * DE275
          LOOP                                   * DE27A
          8GETLAM                                * DE27F
          INNERCOMP                              * DE284
          DUP                                    * DE289
          2PUTLAM                                * DE28E
          ZERO_DO                                * DE293
          ISTOP-INDEX                            * DE298
          INDEX@                                 * DE29D
          BINT13                                 * DE2A2
          #*                                     * DE2A7
          #+                                     * DE2AC
          ROLL                                   * DE2B1
          INCOMPDROP                             * DE2B6
          5GETLAM                                * DE2BB
          DUP                                    * DE2C0
          MINUSONE                               * DE2C5
          EQUAL                                  * DE2CA
          ?SKIP                                  * DE2CF
          ::                                     * DE2D4
            INDEX@                               * DE2D9
            #1+                                  * DE2DE
            NTHCOMPDROP                          * DE2E3
          ;                                      * DE2E8
          4GETLAM                                * DE2ED
          DUP                                    * DE2F2
          MINUSONE                               * DE2F7
          EQUAL                                  * DE2FC
          ?SKIP                                  * DE301
          ::                                     * DE306
            INDEX@                               * DE30B
            #1+                                  * DE310
            NTHCOMPDROP                          * DE315
          ;                                      * DE31A
          LOOP                                   * DE31F
          3GETLAM                                * DE324
          2GETLAM                                * DE329
          7GETLAM                                * DE32E
          6GETLAM                                * DE333
          ABND                                   * DE338
        ;                                        * DE33D

LIB0B1.hash:
        CON(5)  DOHSTR                           * DE342  hash table of library 0B1
        LENGTH                                   * DE347  length, to #DE3A6
        CON(5)  0                                * DE34C  names of length 1
        CON(5)  0                                * DE351  names of length 2
        CON(5)  0                                * DE356  names of length 3
        CON(5)  0                                * DE35B  names of length 4
        CON(5)  0                                * DE360  names of length 5
        CON(5)  0                                * DE365  names of length 6
        CON(5)  0                                * DE36A  names of length 7
        CON(5)  0                                * DE36F  names of length 8
        CON(5)  0                                * DE374  names of length 9
        CON(5)  0                                * DE379  names of length 10
        CON(5)  0                                * DE37E  names of length 11
        CON(5)  0                                * DE383  names of length 12
        CON(5)  0                                * DE388  names of length 13
        CON(5)  0                                * DE38D  names of length 14
        CON(5)  0                                * DE392  names of length 15
        CON(5)  0                                * DE397  names of length 16
        REL(5)  L_DE3A1                          * DE39C  end of the names
L_DE3A1:
        CON(5)  0                                * DE3A1  command 000 has no name
        ENDLENGTH                                * DE3A6

LIB0B1.link:
        CON(5)  DOHSTR                           * DE3A6  link table of library 0B1
        LENGTH                                   * DE3AB  length, to #DE45F
        REL(5)  ~DoMsgBox                        * DE3B0  000 ~DoMsgBox
        REL(5)  ROMP_0B1_001                     * DE3B5  001 
        REL(5)  ~MsgBoxMenu                      * DE3BA  002 ~MsgBoxMenu
        REL(5)  ROMP_0B1_003                     * DE3BF  003 
        REL(5)  ROMP_0B1_004                     * DE3C4  004 
        REL(5)  ROMP_0B1_005                     * DE3C9  005 
        REL(5)  ROMP_0B1_006                     * DE3CE  006 
        REL(5)  ROMP_0B1_007                     * DE3D3  007 
        REL(5)  ROMP_0B1_008                     * DE3D8  008 
        REL(5)  DoMKeyOK                         * DE3DD  009 DoMKeyOK
        REL(5)  ROMP_0B1_00A                     * DE3E2  00A 
        REL(5)  ROMP_0B1_00B                     * DE3E7  00B 
        REL(5)  ROMP_0B1_00C                     * DE3EC  00C 
        REL(5)  ROMP_0B1_00D                     * DE3F1  00D 
        REL(5)  Ck&DoMsgBox                      * DE3F6  00E Ck&DoMsgBox
        REL(5)  ROMP_0B1_00F                     * DE3FB  00F 
        REL(5)  ROMP_0B1_010                     * DE400  010 
        REL(5)  ROMP_0B1_011                     * DE405  011 
        REL(5)  ROMP_0B1_012                     * DE40A  012 
        REL(5)  ROMP_0B1_013                     * DE40F  013 
        REL(5)  ROMP_0B1_014                     * DE414  014 
        REL(5)  ROMP_0B1_015                     * DE419  015 
        REL(5)  ROMP_0B1_016                     * DE41E  016 
        REL(5)  ROMP_0B1_017                     * DE423  017 
        REL(5)  ROMP_0B1_018                     * DE428  018 
        REL(5)  ROMP_0B1_019                     * DE42D  019 
        REL(5)  ROMP_0B1_01A                     * DE432  01A 
        REL(5)  ROMP_0B1_01B                     * DE437  01B 
        REL(5)  ROMP_0B1_01C                     * DE43C  01C 
        REL(5)  ROMP_0B1_01D                     * DE441  01D 
        REL(5)  ROMP_0B1_01E                     * DE446  01E 
        REL(5)  ROMP_0B1_020                     * DE44B  01F 
        REL(5)  ROMP_0B1_020                     * DE450  020 
        REL(5)  ROMP_0B1_021                     * DE455  021 
        REL(5)  ROMP_0B1_022                     * DE45A  022 
