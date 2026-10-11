* HP 48GX ROM revision R, #D49CE-#D79FC: Library part 0B0
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~IFMenuRow2 ~IFMenuRow1 IFEDispField DoKeyOK DoKeyEdit DoKeyCancel
* Follows on from the previous file (at #D49CE in the original ROM).

LIB0B0:
        CON(3)  #0B0                             * D49CE  library number
        REL(5)  LIB0B0.hash                      * D49D1  hash table
        CON(5)  0                                * D49D6  message table
        REL(5)  LIB0B0.link                      * D49DB  link table
        CON(5)  0                                * D49E0  config
        RPL

* ROMPTR 0B0 000
* refs (1): D49CE
ROMP_0B0_000:
        ::                                       * D49E5
          OBJ_387BE                              * D49EA
          ERROR@                                 * D49EF
          BINT0                                  * D49F4
          #=casedrop                             * D49F9
          OBJ_3881D                              * D49FE
          #CAlarmErr                             * D4A03
          #=case                                 * D4A08
          ERRJMP                                 * D4A0D
          OBJ_18802                              * D4A12
          ERROR@                                 * D4A17
          OBJ_3881D                              * D4A1C
          MakeMessage(proc,s)                    * D4A21
          CHR_Newline                            * D4A26
          >T$                                    * D4A2B
          SWAP&$                                 * D4A30
          TOADISP                                * D4A35
          REDISPHBUFF                            * D4A3A
          ROMPTR  0B0 091                        * D4A3F  DoAlert
        ;                                        * D4A4A

* ROMPTR 0B0 001
* refs (1): D49CE
ROMP_0B0_001:
        ::                                       * D4A4F
          KEYINBUFFER?                           * D4A54
          case                                   * D4A59
          SetDA1Bad                              * D4A5E
          TOADISP                                * D4A63
          ROMPTR  0B0 00F                        * D4A68
          SetDA1Valid                            * D4A73
        ;                                        * D4A78

* ROMPTR 0B0 002
* refs (1): D49CE
ROMP_0B0_002:
        ::                                       * D4A7D
          KEYINBUFFER?                           * D4A82
          case                                   * D4A87
          SetDA2aBad                             * D4A8C
          TOADISP                                * D4A91
          ROMPTR  0B0 00C                        * D4A96
          SetDA2aValid                           * D4AA1
        ;                                        * D4AA6

* ROMPTR 0B0 003
* refs (1): D49CE
ROMP_0B0_003:
        ::                                       * D4AAB
          KEYINBUFFER?                           * D4AB0
          ?SEMI                                  * D4AB5
          EDITPARTS                              * D4ABA
          BINT1                                  * D4ABF
          #>                                     * D4AC4
          ?SEMI                                  * D4AC9
          9GETLAM                                * D4ACE
          14GETLAM                               * D4AD3
          #1+_ONE_DO                             * D4AD8
          ::                                     * D4ADD
            ATTN?                                * D4AE2
            ?SEMI                                * D4AE7
            KEYINBUFFER?                         * D4AEC
            ?SEMI                                * D4AF1
            DUP                                  * D4AF6
            INDEX@                               * D4AFB
            #1+                                  * D4B00
            NTHCOMPDROP                          * D4B05
            ?SKIP                                * D4B0A
            ::                                   * D4B0F
              INDEX@                             * D4B14
              ROMPTR  0B0 013                    * D4B19  IFEDispField
            ;                                    * D4B24
          ;                                      * D4B29
          LOOP                                   * D4B2E
          DROP                                   * D4B33
        ;                                        * D4B38

* ROMPTR 0B0 004
* refs (1): D49CE
ROMP_0B0_004:
        ::                                       * D4B3D
          NoExitAction                           * D4B42
          {                                      * D4B47
            {                                    * D4B4C
              ::                                 * D4B51
                TakeOver                         * D4B56
                5GETLAM                          * D4B5B
                ROMPTR  0B0 088                  * D4B60
                ITE                              * D4B6B
                $       "EDIT"                   * D4B70
                NULL$                            * D4B82
              ;                                  * D4B87
              ::                                 * D4B8C
                TakeOver                         * D4B91
                ROMPTR  0B0 056                  * D4B96  DoKeyEdit
              ;                                  * D4BA1
            }                                    * D4BA6
            {                                    * D4BAB
              ::                                 * D4BB0
                TakeOver                         * D4BB5
                5GETLAM                          * D4BBA
                ROMPTR  0B0 08A                  * D4BBF
                ITE                              * D4BCA
                $       "CHOOS"                  * D4BCF
                NULL$                            * D4BE3
              ;                                  * D4BE8
              ::                                 * D4BED
                TakeOver                         * D4BF2
                ROMPTR  0B0 057                  * D4BF7
              ;                                  * D4C02
            }                                    * D4C07
            {                                    * D4C0C
              ::                                 * D4C11
                TakeOver                         * D4C16
                5GETLAM                          * D4C1B
                ROMPTR  0B0 08D                  * D4C20
                ITE                              * D4C2B
                ROMPTR  0B0 086                  * D4C30  ~grobCheckKey
                NULL$                            * D4C3B
              ;                                  * D4C40
              ::                                 * D4C45
                TakeOver                         * D4C4A
                ROMPTR  0B0 058                  * D4C4F
              ;                                  * D4C5A
            }                                    * D4C5F
            NullMenuKey                          * D4C64
            {                                    * D4C69
              $       "(AN(L"                    * D4C6E
              ::                                 * D4C82
                TakeOver                         * D4C87
                ROMPTR  0B0 059                  * D4C8C  DoKeyCancel
              ;                                  * D4C97
            }                                    * D4C9C
            {                                    * D4CA1
              $       "OK"                       * D4CA6
              ::                                 * D4CB4
                TakeOver                         * D4CB9
                ROMPTR  0B0 05A                  * D4CBE  DoKeyOK
              ;                                  * D4CC9
            }                                    * D4CCE
            {                                    * D4CD3
              $       "RESET"                    * D4CD8
              ::                                 * D4CEC
                TakeOver                         * D4CF1
                ROMPTR  0B0 05B                  * D4CF6
              ;                                  * D4D01
            }                                    * D4D06
            {                                    * D4D0B
              ::                                 * D4D10
                TakeOver                         * D4D15
                5GETLAM                          * D4D1A
                ROMPTR  0B0 088                  * D4D1F
                ITE                              * D4D2A
                $       "CALC"                   * D4D2F
                NULL$                            * D4D41
              ;                                  * D4D46
              ::                                 * D4D4B
                TakeOver                         * D4D50
                ROMPTR  0B0 05C                  * D4D55
              ;                                  * D4D60
            }                                    * D4D65
            {                                    * D4D6A
              ::                                 * D4D6F
                TakeOver                         * D4D74
                5GETLAM                          * D4D79
                ROMPTR  0B0 088                  * D4D7E
                ITE                              * D4D89
                $       "TYPES"                  * D4D8E
                NULL$                            * D4DA2
              ;                                  * D4DA7
              ::                                 * D4DAC
                TakeOver                         * D4DB1
                ROMPTR  0B0 05D                  * D4DB6
              ;                                  * D4DC1
            }                                    * D4DC6
            NullMenuKey                          * D4DCB
            {                                    * D4DD0
              $       "(AN(L"                    * D4DD5
              ::                                 * D4DE9
                TakeOver                         * D4DEE
                ROMPTR  0B0 059                  * D4DF3  DoKeyCancel
              ;                                  * D4DFE
            }                                    * D4E03
            {                                    * D4E08
              $       "OK"                       * D4E0D
              ::                                 * D4E1B
                TakeOver                         * D4E20
                ROMPTR  0B0 05A                  * D4E25  DoKeyOK
              ;                                  * D4E30
            }                                    * D4E35
          }                                      * D4E3A
        ;                                        * D4E3F

* ROMPTR 0B0 005
* refs (1): D49CE
~IFMenuRow1:
        {                                        * D4E44
          {                                      * D4E49
            ::                                   * D4E4E
              TakeOver                           * D4E53
              5GETLAM                            * D4E58
              ROMPTR  0B0 088                    * D4E5D
              ITE                                * D4E68
              $       "EDIT"                     * D4E6D
              NULL$                              * D4E7F
            ;                                    * D4E84
            ::                                   * D4E89
              TakeOver                           * D4E8E
              ROMPTR  0B0 056                    * D4E93  DoKeyEdit
            ;                                    * D4E9E
          }                                      * D4EA3
          {                                      * D4EA8
            ::                                   * D4EAD
              TakeOver                           * D4EB2
              5GETLAM                            * D4EB7
              ROMPTR  0B0 08A                    * D4EBC
              ITE                                * D4EC7
              $       "CHOOS"                    * D4ECC
              NULL$                              * D4EE0
            ;                                    * D4EE5
            ::                                   * D4EEA
              TakeOver                           * D4EEF
              ROMPTR  0B0 057                    * D4EF4
            ;                                    * D4EFF
          }                                      * D4F04
          {                                      * D4F09
            ::                                   * D4F0E
              TakeOver                           * D4F13
              5GETLAM                            * D4F18
              ROMPTR  0B0 08D                    * D4F1D
              ITE                                * D4F28
              ROMPTR  0B0 086                    * D4F2D  ~grobCheckKey
              NULL$                              * D4F38
            ;                                    * D4F3D
            ::                                   * D4F42
              TakeOver                           * D4F47
              ROMPTR  0B0 058                    * D4F4C
            ;                                    * D4F57
          }                                      * D4F5C
        }                                        * D4F61

* ROMPTR 0B0 006
* refs (1): D49CE
~IFMenuRow2:
        {                                        * D4F66
          {                                      * D4F6B
            $       "RESET"                      * D4F70
            ::                                   * D4F84
              TakeOver                           * D4F89
              ROMPTR  0B0 05B                    * D4F8E
            ;                                    * D4F99
          }                                      * D4F9E
          {                                      * D4FA3
            ::                                   * D4FA8
              TakeOver                           * D4FAD
              5GETLAM                            * D4FB2
              ROMPTR  0B0 088                    * D4FB7
              ITE                                * D4FC2
              $       "CALC"                     * D4FC7
              NULL$                              * D4FD9
            ;                                    * D4FDE
            ::                                   * D4FE3
              TakeOver                           * D4FE8
              ROMPTR  0B0 05C                    * D4FED
            ;                                    * D4FF8
          }                                      * D4FFD
          {                                      * D5002
            ::                                   * D5007
              TakeOver                           * D500C
              5GETLAM                            * D5011
              ROMPTR  0B0 088                    * D5016
              ITE                                * D5021
              $       "TYPES"                    * D5026
              NULL$                              * D503A
            ;                                    * D503F
            ::                                   * D5044
              TakeOver                           * D5049
              ROMPTR  0B0 05D                    * D504E
            ;                                    * D5059
          }                                      * D505E
          NullMenuKey                            * D5063
          {                                      * D5068
            $       "(AN(L"                      * D506D
            ::                                   * D5081
              TakeOver                           * D5086
              ROMPTR  0B0 059                    * D508B  DoKeyCancel
            ;                                    * D5096
          }                                      * D509B
          {                                      * D50A0
            $       "OK"                         * D50A5
            ::                                   * D50B3
              TakeOver                           * D50B8
              ROMPTR  0B0 05A                    * D50BD  DoKeyOK
            ;                                    * D50C8
          }                                      * D50CD
        }                                        * D50D2

* ROMPTR 0B0 007
* refs (1): D49CE
ROMP_0B0_007:
        ::                                       * D50D7
          NoExitAction                           * D50DC
          {                                      * D50E1
            NullMenuKey                          * D50E6
            NullMenuKey                          * D50EB
            NullMenuKey                          * D50F0
            NullMenuKey                          * D50F5
            {                                    * D50FA
              $       "(AN(L"                    * D50FF
              ::                                 * D5113
                TakeOver                         * D5118
                ROMPTR  0B0 059                  * D511D  DoKeyCancel
              ;                                  * D5128
            }                                    * D512D
            {                                    * D5132
              $       "OK"                       * D5137
              ::                                 * D5145
                TakeOver                         * D514A
                ROMPTR  0B0 05A                  * D514F  DoKeyOK
              ;                                  * D515A
            }                                    * D515F
            <SkipKey                             * D5164
            >SkipKey                             * D5169
            <DelKey                              * D516E
            >DelKey                              * D5173
            TogInsertKey                         * D5178
            {                                    * D517D
              $       "↑STK"                     * D5182
              ::                                 * D5194
                TakeOver                         * D5199
                UStackDepth                      * D519E
                #0=case                          * D51A3
                DoBadKey                         * D51A8
                OBJ_4365D                        * D51AD
              ;                                  * D51B2
            }                                    * D51B7
          }                                      * D51BC
        ;                                        * D51C1

* ROMPTR 0B0 008
* refs (1): D49CE
ROMP_0B0_008:
        {                                        * D51C6
          {                                      * D51CB
            $       "(AN(L"                      * D51D0
            ::                                   * D51E4
              TakeOver                           * D51E9
              ROMPTR  0B0 059                    * D51EE  DoKeyCancel
            ;                                    * D51F9
          }                                      * D51FE
          {                                      * D5203
            $       "OK"                         * D5208
            ::                                   * D5216
              TakeOver                           * D521B
              ROMPTR  0B0 05A                    * D5220  DoKeyOK
            ;                                    * D522B
          }                                      * D5230
          <SkipKey                               * D5235
          >SkipKey                               * D523A
          <DelKey                                * D523F
          >DelKey                                * D5244
          TogInsertKey                           * D5249
          {                                      * D524E
            $       "↑STK"                       * D5253
            ::                                   * D5265
              TakeOver                           * D526A
              UStackDepth                        * D526F
              #0=case                            * D5274
              DoBadKey                           * D5279
              OBJ_4365D                          * D527E
            ;                                    * D5283
          }                                      * D5288
        }                                        * D528D

* ROMPTR 0B0 009
* refs (1): D49CE
ROMP_0B0_009:
        ::                                       * D5292
          BINT15                                 * D5297
          OBJ_19FA7                              * D529C
          ?SEMI                                  * D52A1
          ROMPTR  0B0 00A                        * D52A6
          NOTcase                                * D52B1
          ::                                     * D52B6
            '                                    * D52BB
            ROMPTR  0B0 004                      * D52C0
          ;                                      * D52CB
          '                                      * D52D0
          NoExitAction                           * D52D5
          ROMPTR  0B0 005                        * D52DA  ~IFMenuRow1
          ROT                                    * D52E5
          &COMP                                  * D52EA
          ROMPTR  0B0 006                        * D52EF  ~IFMenuRow2
          &COMP                                  * D52FA
          BINT2                                  * D52FF
          ::N                                    * D5304
        ;                                        * D5309

* ROMPTR 0B0 00A
* refs (1): D49CE
ROMP_0B0_00A:
        ::                                       * D530E
          BINT16                                 * D5313
          OBJ_19FA7                              * D5318
          ?SEMI                                  * D531D
          FALSE                                  * D5322
        ;                                        * D5327

* ROMPTR 0B0 00B
* refs (1): D49CE
ROMP_0B0_00B:
        ::                                       * D532C
          BINT17                                 * D5331
          OBJ_19FA7                              * D5336
          DROP                                   * D533B
        ;                                        * D5340

* ROMPTR 0B0 00C
* refs (1): D49CE
ROMP_0B0_00C:
        ::                                       * D5345
          BINT4                                  * D534A
          OBJ_19FA7                              * D534F
          ?SEMI                                  * D5354
          EDITPARTS                              * D5359
          BINT1                                  * D535E
          #>                                     * D5363
          case                                   * D5368
          ROMPTR  0B0 00D                        * D536D
          ROMPTR  0B0 097                        * D5378
          HARDBUFF                               * D5383
          BINT0                                  * D5388
          BINT7                                  * D538D
          GROB!                                  * D5392
          14GETLAM                               * D5397
          #1+_ONE_DO                             * D539C
          INDEX@                                 * D53A1
          KEYINBUFFER?                           * D53A6
          ATTN?                                  * D53AB
          OR                                     * D53B0
          ITE                                    * D53B5
          ROMPTR  0B0 0A2                        * D53BA
          ROMPTR  0B0 013                        * D53C5  IFEDispField
          LOOP                                   * D53D0
        ;                                        * D53D5

* ROMPTR 0B0 00D
* refs (1): D49CE
ROMP_0B0_00D:
        ::                                       * D53DA
          FALSE                                  * D53DF
          5GETLAM                                * D53E4
          ROMPTR  0B0 017                        * D53E9
        ;                                        * D53F4

* ROMPTR 0B0 00E
* refs (1): D49CE
ROMP_0B0_00E:
        ::                                       * D53F9
          BINT5                                  * D53FE
          OBJ_19FA7                              * D5403
          ?SEMI                                  * D5408
          BINT39                                 * D540D
          BINT131                                * D5412
          MAKEGROB                               * D5417
          15GETLAM                               * D541C
          #1+_ONE_DO                             * D5421
          INDEX@                                 * D5426
          ROMPTR  0B0 012                        * D542B
          LOOP                                   * D5436
          TRUE                                   * D543B
        ;                                        * D5440

* ROMPTR 0B0 00F
* refs (1): D49CE
ROMP_0B0_00F:
        ::                                       * D5445
          BINT1                                  * D544A
          OBJ_19FA7                              * D544F
          ?SEMI                                  * D5454
          ROMPTR  0B0 010                        * D5459
          HARDBUFF                               * D5464
          ZEROZERO                               * D5469
          GROB!                                  * D546E
        ;                                        * D5473

* ROMPTR 0B0 010
* refs (1): D49CE
ROMP_0B0_010:
        ::                                       * D5478
          BINT2                                  * D547D
          OBJ_19FA7                              * D5482
          ?SEMI                                  * D5487
          ROMPTR  0B0 011                        * D548C
          ROMPTR  0B0 0A5                        * D5497
        ;                                        * D54A2

* ROMPTR 0B0 011
* refs (1): D49CE
ROMP_0B0_011:
        ::                                       * D54A7
          BINT3                                  * D54AC
          OBJ_19FA7                              * D54B1
          ?SEMI                                  * D54B6
          ROMPTR  0B0 0AE                        * D54BB
        ;                                        * D54C6

* ROMPTR 0B0 012
* refs (1): D49CE
ROMP_0B0_012:
        ::                                       * D54CB
          BINT6                                  * D54D0
          OBJ_19FA7                              * D54D5
          ?SEMI                                  * D54DA
          DUP                                    * D54DF
          ROMPTR  0B0 0B0                        * D54E4
          $>grob                                 * D54EF
          3PICK                                  * D54F4
          ROT                                    * D54F9
          ROMPTR  0B0 0B3                        * D54FE
          3PICK                                  * D5509
          HARDBUFF                               * D550E
          EQUAL                                  * D5513
          ?SKIP                                  * D5518
          ::                                     * D551D
            BINT7                                * D5522
            #-                                   * D5527
          ;                                      * D552C
          GROB!                                  * D5531
        ;                                        * D5536

* ROMPTR 0B0 013
* refs (1): D49CE
IFEDispField:
        ::                                       * D553B
          BINT7                                  * D5540
          OBJ_19FBB                              * D5545
          ?SEMI                                  * D554A
          4GETLAM                                * D554F
          DUP                                    * D5554
          ROMPTR  0B0 044                        * D5559
          OVER                                   * D5564
          5GETLAM                                * D5569
          #=                                     * D556E
          IT                                     * D5573
          INVGROB                                * D5578
          HARDBUFF                               * D557D
          ROT                                    * D5582
          ROMPTR  0B0 0C6                        * D5587
          GROB!                                  * D5592
        ;                                        * D5597

* ROMPTR 0B0 014
* refs (1): D49CE
ROMP_0B0_014:
        ::                                       * D559C
          DA2aBad?                               * D55A1
          caseDROP                               * D55A6
          BINT21                                 * D55AB
          OBJ_19FBB                              * D55B0
          ?SEMI                                  * D55B5
          4GETLAM                                * D55BA
          ROMPTR  0B0 016                        * D55BF
        ;                                        * D55CA

* ROMPTR 0B0 015
* refs (1): D49CE
ROMP_0B0_015:
        ::                                       * D55CF
          DA2aBad?                               * D55D4
          caseDROP                               * D55D9
          BINT22                                 * D55DE
          OBJ_19FBB                              * D55E3
          ?SEMI                                  * D55E8
          4GETLAM                                * D55ED
          ROMPTR  0B0 016                        * D55F2
        ;                                        * D55FD

* ROMPTR 0B0 016
* refs (1): D49CE
ROMP_0B0_016:
        ::                                       * D5602
          DUP                                    * D5607
          ROMPTR  0B0 0C6                        * D560C
          2DUP                                   * D5617
          2DUP                                   * D561C
          7ROLL                                  * D5621
          ROMPTR  0B0 0C7                        * D5626
          ROT                                    * D5631
          #+                                     * D5636
          3UNROLL                                * D563B
          #+                                     * D5640
          SWAP                                   * D5645
          HARDBUFF                               * D564A
          5UNROLL                                * D564F
          SUBGROB                                * D5654
          INVGROB                                * D5659
          HARDBUFF                               * D565E
          4ROLL                                  * D5663
          4ROLL                                  * D5668
          GROB!                                  * D566D
        ;                                        * D5672

* ROMPTR 0B0 017
* refs (1): D49CE
ROMP_0B0_017:
        ::                                       * D5677
          BINT11                                 * D567C
          OBJ_19FBB                              * D5681
          ?SEMI                                  * D5686
          4GETLAM                                * D568B
          ROMPTR  0B0 018                        * D5690
          HARDBUFF                               * D569B
          BINT1                                  * D56A0
          4ROLL                                  * D56A5
          ITE                                    * D56AA
          ::                                     * D56AF
            BINT50                               * D56B4
            ROMPTR  0B0 094                      * D56B9
          ;                                      * D56C4
          ::                                     * D56C9
            BINT8                                * D56CE
            ROMPTR  0B0 093                      * D56D3
          ;                                      * D56DE
          GROB!                                  * D56E3
        ;                                        * D56E8

* ROMPTR 0B0 018
* refs (1): D49CE
ROMP_0B0_018:
        ::                                       * D56ED
          BINT12                                 * D56F2
          OBJ_19FBB                              * D56F7
          ?SEMI                                  * D56FC
          4GETLAM                                * D5701
          ROMPTR  0B0 019                        * D5706
          $>grob                                 * D5711
        ;                                        * D5716

* ROMPTR 0B0 019
* refs (1): D49CE
ROMP_0B0_019:
        ::                                       * D571B
          BINT13                                 * D5720
          OBJ_19FBB                              * D5725
          ?SEMI                                  * D572A
          4GETLAM                                * D572F
          ROMPTR  0B0 0C1                        * D5734
        ;                                        * D573F

* ROMPTR 0B0 01A
* refs (1): D49CE
ROMP_0B0_01A:
        ::                                       * D5744
          BINT31                                 * D5749
          OBJ_19FBB                              * D574E
          ?SEMI                                  * D5753
          NULL$                                  * D5758
          4GETLAM                                * D575D
          ROMPTR  0B0 01B                        * D5762
          ROMPTR  0B3 066                        * D576D  ~ChooseSimple
          NOTcase                                * D5778
          SetDA123NoCh                           * D577D
          EVAL                                   * D5782
        ;                                        * D5787

* ROMPTR 0B0 01B
* refs (1): D49CE
ROMP_0B0_01B:
        ::                                       * D578C
          BINT32                                 * D5791
          OBJ_19FBB                              * D5796
          ?SEMI                                  * D579B
          4GETLAM                                * D57A0
          ROMPTR  0B0 07D                        * D57A5
          ITE                                    * D57B0
          ::                                     * D57B5
            DROP                                 * D57BA
            {                                    * D57BF
              #       B903                       * D57C4  47363
              ROMPTR  0B0 01C                    * D57CE
            }                                    * D57D9
          ;                                      * D57DE
          {                                      * D57E3
            #       B904                         * D57E8  47364
            ROMPTR  0B0 01C                      * D57F2
          }                                      * D57FD
          {                                      * D5802
            #       B905                         * D5807  47365
            ROMPTR  0B0 01D                      * D5811
          }                                      * D581C
          TWO{}N                                 * D5821
        ;                                        * D5826

* ROMPTR 0B0 01C
* refs (1): D49CE
ROMP_0B0_01C:
        ::                                       * D582B
          5GETLAM                                * D5830
          DUP                                    * D5835
          ROMPTR  0B0 01F                        * D583A
          ROMPTR  0B0 013                        * D5845  IFEDispField
          SetDA123NoCh                           * D5850
        ;                                        * D5855

* ROMPTR 0B0 01D
* refs (1): D49CE
ROMP_0B0_01D:
        ::                                       * D585A
          ROMPTR  0B0 01E                        * D585F
          ::                                     * D586A
            SetDA1NoCh                           * D586F
            SetDA3NoCh                           * D5874
          ;                                      * D5879
        ;                                        * D587E

* ROMPTR 0B0 01E
* refs (1): D49CE
ROMP_0B0_01E:
        ::                                       * D5883
          BINT34                                 * D5888
          OBJ_19FA7                              * D588D
          ?SEMI                                  * D5892
          14GETLAM                               * D5897
          #1+_ONE_DO                             * D589C
          INDEX@                                 * D58A1
          ROMPTR  0B0 01F                        * D58A6
          LOOP                                   * D58B1
          5GETLAM                                * D58B6
          ROMPTR  0B0 023                        * D58BB
          ?SEMI                                  * D58C6
          ROMPTR  0B0 020                        * D58CB
          ROMPTR  0B0 06B                        * D58D6
        ;                                        * D58E1

* ROMPTR 0B0 01F
* refs (1): D49CE
ROMP_0B0_01F:
        ::                                       * D58E6
          BINT33                                 * D58EB
          OBJ_19FBB                              * D58F0
          ?SEMI                                  * D58F5
          4GETLAM                                * D58FA
          DUP                                    * D58FF
          DUP                                    * D5904
          ROMPTR  0B0 0C4                        * D5909
          SWAP                                   * D5914
          ROMPTR  0B0 0D5                        * D5919  ~sFldVal
          ROMPTR  0B0 041                        * D5924
        ;                                        * D592F

* ROMPTR 0B0 020
* refs (1): D49CE
ROMP_0B0_020:
        ::                                       * D5934
          BINT14                                 * D5939
          OBJ_19FA7                              * D593E
          ?SEMI                                  * D5943
          BINT1                                  * D5948
        ;                                        * D594D

* ROMPTR 0B0 021
* refs (1): D49CE
ROMP_0B0_021:
        ::                                       * D5952
          DUP                                    * D5957
          MINUSONE                               * D595C
          #=case                                 * D5961
          DROP                                   * D5966
          BINT19                                 * D596B
          OBJ_19FBB                              * D5970
          DROP                                   * D5975
        ;                                        * D597A

* ROMPTR 0B0 022
* refs (1): D49CE
ROMP_0B0_022:
        ::                                       * D597F
          BINT20                                 * D5984
          OBJ_19FBB                              * D5989
          DROP                                   * D598E
        ;                                        * D5993

* ROMPTR 0B0 023
* refs (1): D49CE
ROMP_0B0_023:
        ::                                       * D5998
          BINT55                                 * D599D
          OBJ_19FBB                              * D59A2
          ?SEMI                                  * D59A7
          TRUE                                   * D59AC
        ;                                        * D59B1

* ROMPTR 0B0 024
* refs (1): D49CE
ROMP_0B0_024:
        ::                                       * D59B6
          BINT54                                 * D59BB
          OBJ_19FBB                              * D59C0
          ?SEMI                                  * D59C5
          4GETLAM                                * D59CA
          ROMPTR  0B0 025                        * D59CF
        ;                                        * D59DA

* ROMPTR 0B0 025
* refs (1): D49CE
ROMP_0B0_025:
        ::                                       * D59DF
          BINT52                                 * D59E4
          OBJ_19FBB                              * D59E9
          ?SEMI                                  * D59EE
          4GETLAM                                * D59F3
          BEGIN                                  * D59F8
          ROMPTR  0B0 072                        * D59FD
          ?SKIP                                  * D5A08
          BINT1                                  * D5A0D
          DUP                                    * D5A12
          ROMPTR  0B0 023                        * D5A17
          UNTIL                                  * D5A22
        ;                                        * D5A27

* ROMPTR 0B0 026
* refs (1): D49CE
ROMP_0B0_026:
        ::                                       * D5A2C
          BINT53                                 * D5A31
          OBJ_19FBB                              * D5A36
          ?SEMI                                  * D5A3B
          4GETLAM                                * D5A40
          BEGIN                                  * D5A45
          ROMPTR  0B0 073                        * D5A4A
          ?SKIP                                  * D5A55
          14GETLAM                               * D5A5A
          DUP                                    * D5A5F
          ROMPTR  0B0 023                        * D5A64
          UNTIL                                  * D5A6F
        ;                                        * D5A74

* ROMPTR 0B0 027
* refs (1): D49CE
ROMP_0B0_027:
        ::                                       * D5A79
          BINT48                                 * D5A7E
          OBJ_19FBB                              * D5A83
          ?SEMI                                  * D5A88
          4GETLAM                                * D5A8D
          DUP                                    * D5A92
          ROMPTR  0B0 0C6                        * D5A97
          SWAP                                   * D5AA2
          3UNROLL                                * D5AA7
          OVER                                   * D5AAC
          BEGIN                                  * D5AB1
          ::                                     * D5AB6
            BEGIN                                * D5ABB
            ROMPTR  0B0 072                      * D5AC0
            ?SKIP                                * D5ACB
            BINT1                                * D5AD0
            DUP                                  * D5AD5
            ROMPTR  0B0 023                      * D5ADA
            UNTIL                                * D5AE5
            DUP                                  * D5AEA
            4PICK                                * D5AEF
            #=case                               * D5AF4
            FalseTrue                            * D5AF9
            DUP                                  * D5AFE
            ROMPTR  0B0 0C6                      * D5B03
            SWAPDROP                             * D5B0E
            3PICK                                * D5B13
            #<>                                  * D5B18
            case                                 * D5B1D
            TrueTrue                             * D5B22
            FALSE                                * D5B27
          ;                                      * D5B2C
          UNTIL                                  * D5B31
          ROTDROP                                * D5B36
          ROTDROP                                * D5B3B
          NOTcase                                * D5B40
          SWAPDROP                               * D5B45
          DUP                                    * D5B4A
          ROMPTR  0B0 0C6                        * D5B4F
          SWAPDROPSWAP                           * D5B5A
          DUP                                    * D5B5F
          BEGIN                                  * D5B64
          ::                                     * D5B69
            DUP                                  * D5B6E
            ROMPTR  0B0 0C6                      * D5B73
            5PICK                                * D5B7E
            #<>                                  * D5B83
            case2drop                            * D5B88
            TRUE                                 * D5B8D
            ROTDROP                              * D5B92
            OVER                                 * D5B97
            ROMPTR  0B0 0C7                      * D5B9C
            DROP                                 * D5BA7
            #1-+                                 * D5BAC
            4PICK                                * D5BB1
            #<                                   * D5BB6
            NOT                                  * D5BBB
          ;                                      * D5BC0
          NOT                                    * D5BC5
          WHILE                                  * D5BCA
          ::                                     * D5BCF
            DUP                                  * D5BD4
            BEGIN                                * D5BD9
            ROMPTR  0B0 072                      * D5BDE
            ?SKIP                                * D5BE9
            BINT1                                * D5BEE
            DUP                                  * D5BF3
            ROMPTR  0B0 023                      * D5BF8
            UNTIL                                * D5C03
          ;                                      * D5C08
          REPEAT                                 * D5C0D
          ROTROT2DROP                            * D5C12
        ;                                        * D5C17

* ROMPTR 0B0 028
* refs (1): D49CE
ROMP_0B0_028:
        ::                                       * D5C1C
          BINT49                                 * D5C21
          OBJ_19FBB                              * D5C26
          ?SEMI                                  * D5C2B
          4GETLAM                                * D5C30
          DUP                                    * D5C35
          ROMPTR  0B0 0C6                        * D5C3A
          SWAP                                   * D5C45
          3UNROLL                                * D5C4A
          OVER                                   * D5C4F
          BEGIN                                  * D5C54
          ::                                     * D5C59
            BEGIN                                * D5C5E
            ROMPTR  0B0 073                      * D5C63
            ?SKIP                                * D5C6E
            14GETLAM                             * D5C73
            DUP                                  * D5C78
            ROMPTR  0B0 023                      * D5C7D
            UNTIL                                * D5C88
            DUP                                  * D5C8D
            4PICK                                * D5C92
            #=case                               * D5C97
            FalseTrue                            * D5C9C
            DUP                                  * D5CA1
            ROMPTR  0B0 0C6                      * D5CA6
            SWAPDROP                             * D5CB1
            3PICK                                * D5CB6
            #<>                                  * D5CBB
            case                                 * D5CC0
            TrueTrue                             * D5CC5
            FALSE                                * D5CCA
          ;                                      * D5CCF
          UNTIL                                  * D5CD4
          ROTDROP                                * D5CD9
          ROTDROP                                * D5CDE
          NOTcase                                * D5CE3
          SWAPDROP                               * D5CE8
          DUP                                    * D5CED
          ROMPTR  0B0 0C6                        * D5CF2
          SWAPDROPSWAP                           * D5CFD
          DUP                                    * D5D02
          BEGIN                                  * D5D07
          ::                                     * D5D0C
            DUP                                  * D5D11
            ROMPTR  0B0 0C6                      * D5D16
            5PICK                                * D5D21
            #<>                                  * D5D26
            case2drop                            * D5D2B
            TRUE                                 * D5D30
            ROTDROP                              * D5D35
            4PICK                                * D5D3A
            #>                                   * D5D3F
            NOT                                  * D5D44
          ;                                      * D5D49
          NOT                                    * D5D4E
          WHILE                                  * D5D53
          ::                                     * D5D58
            DUP                                  * D5D5D
            BEGIN                                * D5D62
            ROMPTR  0B0 073                      * D5D67
            ?SKIP                                * D5D72
            14GETLAM                             * D5D77
            DUP                                  * D5D7C
            ROMPTR  0B0 023                      * D5D81
            UNTIL                                * D5D8C
          ;                                      * D5D91
          REPEAT                                 * D5D96
          ROTROT2DROP                            * D5D9B
        ;                                        * D5DA0

* ROMPTR 0B0 029
* refs (1): D49CE
ROMP_0B0_029:
        ::                                       * D5DA5
          BINT50                                 * D5DAA
          OBJ_19FBB                              * D5DAF
          ?SEMI                                  * D5DB4
          14GETLAM                               * D5DB9
          BEGIN                                  * D5DBE
          DUP                                    * D5DC3
          ROMPTR  0B0 023                        * D5DC8
          NOT                                    * D5DD3
          WHILE                                  * D5DD8
          ::                                     * D5DDD
            ROMPTR  0B0 073                      * D5DE2
            DROP                                 * D5DED
          ;                                      * D5DF2
          REPEAT                                 * D5DF7
        ;                                        * D5DFC

* ROMPTR 0B0 02A
* refs (1): D49CE
ROMP_0B0_02A:
        ::                                       * D5E01
          BINT51                                 * D5E06
          OBJ_19FBB                              * D5E0B
          ?SEMI                                  * D5E10
          BINT1                                  * D5E15
          BEGIN                                  * D5E1A
          DUP                                    * D5E1F
          ROMPTR  0B0 023                        * D5E24
          NOT                                    * D5E2F
          WHILE                                  * D5E34
          ::                                     * D5E39
            ROMPTR  0B0 072                      * D5E3E
            DROP                                 * D5E49
          ;                                      * D5E4E
          REPEAT                                 * D5E53
        ;                                        * D5E58

* ROMPTR 0B0 02B
* refs (1): D49CE
ROMP_0B0_02B:
        ::                                       * D5E5D
          BINT40                                 * D5E62
          OBJ_19FBB                              * D5E67
          ?SEMI                                  * D5E6C
          4GETLAM                                * D5E71
          DUP                                    * D5E76
          ROMPTR  0B0 08B                        * D5E7B
          NOTcasedrop                            * D5E86
          ::                                     * D5E8B
            NULL{}                               * D5E90
            BINT0                                * D5E95
          ;                                      * D5E9A
          DUP                                    * D5E9F
          ROMPTR  0B0 07B                        * D5EA4
          ROMPTR  0B0 06D                        * D5EAF
        ;                                        * D5EBA

* ROMPTR 0B0 02C
* refs (1): D49CE
ROMP_0B0_02C:
        ::                                       * D5EBF
          BINT23                                 * D5EC4
          OBJ_19FBB                              * D5EC9
          ?SEMI                                  * D5ECE
          4GETLAM                                * D5ED3
          DUP                                    * D5ED8
          ROMPTR  0B0 046                        * D5EDD
          ITE                                    * D5EE8
          ::                                     * D5EED
            SWAPDROP                             * D5EF2
            AdjEdModes                           * D5EF7
            EDITDECOMP$                          * D5EFC
            BINT1                                * D5F01
          ;                                      * D5F06
          ::                                     * D5F0B
            ROMPTR  0B0 089                      * D5F10
            ITE                                  * D5F1B
            ::                                   * D5F20
              SetAlgEntry                        * D5F25
              $       "''"                       * D5F2A
              BINT2                              * D5F38
            ;                                    * D5F3D
            ::                                   * D5F42
              ClrAlgEntry                        * D5F47
              NULL$                              * D5F4C
              BINT1                              * D5F51
            ;                                    * D5F56
          ;                                      * D5F5B
          InitEdLine                             * D5F60
          SWAP                                   * D5F65
          EditString                             * D5F6A
          SetCursPos(s)                          * D5F6F
          EDITPARTS                              * D5F74
          BINT1                                  * D5F79
          #>                                     * D5F7E
          ITE                                    * D5F83
          SetDA1NoCh                             * D5F88
          ::                                     * D5F8D
            SetDA1NoCh                           * D5F92
            SetDA2aNoCh                          * D5F97
          ;                                      * D5F9C
        ;                                        * D5FA1

* ROMPTR 0B0 02D
* refs (1): D49CE
ROMP_0B0_02D:
        ::                                       * D5FA6
          BINT42                                 * D5FAB
          OBJ_19FBB                              * D5FB0
          ?SEMI                                  * D5FB5
          4GETLAM                                * D5FBA
          ROMPTR  0B0 02E                        * D5FBF
          NOTcase                                * D5FCA
          ::                                     * D5FCF
            '                                    * D5FD4
            ROMPTR  0B0 007                      * D5FD9
          ;                                      * D5FE4
          '                                      * D5FE9
          NoExitAction                           * D5FEE
          SWAP                                   * D5FF3
          ROMPTR  0B0 008                        * D5FF8
          &COMP                                  * D6003
          BINT2                                  * D6008
          ::N                                    * D600D
        ;                                        * D6012

* ROMPTR 0B0 02E
* refs (1): D49CE
ROMP_0B0_02E:
        ::                                       * D6017
          BINT43                                 * D601C
          OBJ_19FBB                              * D6021
          ?SEMI                                  * D6026
          FALSE                                  * D602B
        ;                                        * D6030

* ROMPTR 0B0 02F
* refs (1): D49CE
ROMP_0B0_02F:
        ::                                       * D6035
          BINT26                                 * D603A
          OBJ_19FBB                              * D603F
          ?SEMI                                  * D6044
          4GETLAM                                * D6049
          ROMPTR  0B0 030                        * D604E
          NOT?SEMI                               * D6059
          4GETLAM                                * D605E
          DUPUNROT                               * D6063
          ROMPTR  0B0 0D5                        * D6068  ~sFldVal
          DUP                                    * D6073
          ROMPTR  0B0 041                        * D6078
          ROMPTR  0B0 013                        * D6083  IFEDispField
        ;                                        * D608E

* ROMPTR 0B0 030
* refs (1): D49CE
ROMP_0B0_030:
        ::                                       * D6093
          BINT37                                 * D6098
          OBJ_19FBB                              * D609D
          ?SEMI                                  * D60A2
          4GETLAM                                * D60A7
          DUP                                    * D60AC
          ROMPTR  0B0 08C                        * D60B1
          case                                   * D60BC
          ::                                     * D60C1
            FALSE                                * D60C6
            SWAP                                 * D60CB
            ROMPTR  0B0 077                      * D60D0
            ROMPTR  0B4 1D8                      * D60DB
            SetDA123NoCh                         * D60E6
          ;                                      * D60EB
          ROMPTR  0B0 02B                        * D60F0
          OVER                                   * D60FB
          NULL{}                                 * D6100
          EQUAL                                  * D6105
          case2drop                              * D610A
          ::                                     * D610F
            DoBadKey                             * D6114
            FALSE                                * D6119
          ;                                      * D611E
          DUP#0=                                 * D6123
          IT                                     * D6128
          DROPONE                                * D612D
          4GETLAM                                * D6132
          ROMPTR  0B0 0B9                        * D6137
          NULL$                                  * D6142
          4GETLAM                                * D6147
          ROMPTR  0B0 07C                        * D614C
          5ROLL                                  * D6157
          5ROLL                                  * D615C
          ROMPTR  0B3 000                        * D6161  ~Choose
          SetDA123NoCh                           * D616C
          NOTcase                                * D6171
          FALSE                                  * D6176
          TRUE                                   * D617B
        ;                                        * D6180

* ROMPTR 0B0 031
* refs (1): D49CE
ROMP_0B0_031:
        ::                                       * D6185
          BINT27                                 * D618A
          OBJ_19FBB                              * D618F
          ?SEMI                                  * D6194
          4GETLAM                                * D6199
          DUP                                    * D619E
          ROMPTR  0B0 0C5                        * D61A3  ~gFldVal
          NOT                                    * D61AE
          OVER                                   * D61B3
          ROMPTR  0B0 0D5                        * D61B8  ~sFldVal
          ROMPTR  0B0 041                        * D61C3
        ;                                        * D61CE

* ROMPTR 0B0 032
* refs (1): D49CE
ROMP_0B0_032:
        ::                                       * D61D3
          BINT35                                 * D61D8
          OBJ_19FBB                              * D61DD
          ?SEMI                                  * D61E2
          '                                      * D61E7
          ROMPTR  0B0 033                        * D61EC
          OBJ_72AFA                              * D61F7
          4GETLAM                                * D61FC
          ROMPTR  0B0 0B9                        * D6201
          >TCOMP                                 * D620C
          BINT17                                 * D6211
          4GETLAM                                * D6216
          ROMPTR  0B0 035                        * D621B
          DUPLENCOMP                             * D6226
          #1=                                    * D622B
          ITE                                    * D6230
          #       B907                           * D6235  47367
          #       B906                           * D623F  47366
          3UNROLL                                * D6249
          BINT1                                  * D624E
          ROMPTR  0B3 000                        * D6253  ~Choose
          DUP                                    * D625E
          BINT0                                  * D6263
          EQ                                     * D6268
          NOTcase                                * D626D
          ::                                     * D6272
            IT                                   * D6277
            DROP                                 * D627C
            SetDA123NoCh                         * D6281
          ;                                      * D6286
          DROP                                   * D628B
          EDITPARTS                              * D6290
          BINT1                                  * D6295
          #>                                     * D629A
          SWAP                                   * D629F
          ROMPTR  0B0 09C                        * D62A4
          InitEdLine                             * D62AF
          EditString                             * D62B4
          SetPrgmEntry                           * D62B9
          IT                                     * D62BE
          SetAlgEntry                            * D62C3
          SetCursPos(s)                          * D62C8
          SetDA2bBad                             * D62CD
          case                                   * D62D2
          ::                                     * D62D7
            SetDA1NoCh                           * D62DC
            SetDA3NoCh                           * D62E1
          ;                                      * D62E6
          ::                                     * D62EB
            SetDA1NoCh                           * D62F0
            SetDA2aNoCh                          * D62F5
            SetDA3NoCh                           * D62FA
          ;                                      * D62FF
        ;                                        * D6304

* ROMPTR 0B0 033
* refs (1): D49CE
ROMP_0B0_033:
        ::                                       * D6309
          {                                      * D630E
            BINT83                               * D6313
            ::                                   * D6318
              '                                  * D631D
              ROMPTR  0B0 034                    * D6322
            ;                                    * D632D
          }                                      * D6332
          EQLookup                               * D6337
          case                                   * D633C
          ::                                     * D6341
            EVAL                                 * D6346
            TRUE                                 * D634B
          ;                                      * D6350
        ;                                        * D6355

* ROMPTR 0B0 034
* refs (1): D49CE
ROMP_0B0_034:
        ::                                       * D635A
          NoExitAction                           * D635F
          {                                      * D6364
            {                                    * D6369
              $       "NEW"                      * D636E
              ::                                 * D637E
                TakeOver                         * D6383
                ROMPTR  0B3 02E                  * D6388  DoCKeyOK
                DROPZERO                         * D6393
              ;                                  * D6398
            }                                    * D639D
            NullMenuKey                          * D63A2
            NullMenuKey                          * D63A7
            NullMenuKey                          * D63AC
            NullMenuKey                          * D63B1
            {                                    * D63B6
              $       "OK"                       * D63BB
              ::                                 * D63C9
                TakeOver                         * D63CE
                ROMPTR  0B3 02E                  * D63D3  DoCKeyOK
              ;                                  * D63DE
            }                                    * D63E3
          }                                      * D63E8
        ;                                        * D63ED

* ROMPTR 0B0 035
* refs (1): D49CE
ROMP_0B0_035:
        ::                                       * D63F2
          BINT36                                 * D63F7
          OBJ_19FBB                              * D63FC
          ?SEMI                                  * D6401
          4GETLAM                                * D6406
          ROMPTR  0B0 07A                        * D640B
          ?SKIP                                  * D6416
          {                                      * D641B
            MINUSONE                             * D6420
          }                                      * D6425
          DUPNULLCOMP?                           * D642A
          casedrop                               * D642F
          NULL{}                                 * D6434
          DUPLENCOMP                             * D6439
          2NULLLAM{}                             * D643E
          BIND                                   * D6443
          1GETLAM                                * D6448
          #1+_ONE_DO                             * D644D
          2GETLAM                                * D6452
          INDEX@                                 * D6457
          NTHCOMPDROP                            * D645C
          {                                      * D6461
            MINUSONE                             * D6466
            {                                    * D646B
              #       B908                       * D6470  47368
              ::                                 * D647A
                BINT1                            * D647F
                FALSE                            * D6484
                NULL$                            * D6489
              ;                                  * D648E
            }                                    * D6493
            BINT0                                * D6498
            {                                    * D649D
              #       B909                       * D64A2  47369
              ::                                 * D64AC
                BINT1                            * D64B1
                FALSE                            * D64B6
                NULL$                            * D64BB
              ;                                  * D64C0
            }                                    * D64C5
            BINT1                                * D64CA
            {                                    * D64CF
              #       B90A                       * D64D4  47370
              ::                                 * D64DE
                BINT2                            * D64E3
                FALSE                            * D64E8
                $       "()"                     * D64ED
              ;                                  * D64FB
            }                                    * D6500
            BINT2                                * D6505
            {                                    * D650A
              #       B90B                       * D650F  47371
              ::                                 * D6519
                BINT2                            * D651E
                FALSE                            * D6523
                $       "\"\""                   * D6528
              ;                                  * D6536
            }                                    * D653B
            BINT3                                * D6540
            {                                    * D6545
              #       B90C                       * D654A  47372
              ::                                 * D6554
                BINT2                            * D6559
                FALSE                            * D655E
                $       "[]"                     * D6563
              ;                                  * D6571
            }                                    * D6576
            BINT4                                * D657B
            {                                    * D6580
              #       B90D                       * D6585  47373
              ::                                 * D658F
                BINT3                            * D6594
                FALSE                            * D6599
                $       "[()]"                   * D659E
              ;                                  * D65B0
            }                                    * D65B5
            BINT5                                * D65BA
            {                                    * D65BF
              #       B90E                       * D65C4  47374
              ::                                 * D65CE
                BINT2                            * D65D3
                FALSE                            * D65D8
                $       "{}"                     * D65DD
              ;                                  * D65EB
            }                                    * D65F0
            BINT6                                * D65F5
            {                                    * D65FA
              #       B90F                       * D65FF  47375
              ::                                 * D6609
                BINT1                            * D660E
                FALSE                            * D6613
                NULL$                            * D6618
              ;                                  * D661D
            }                                    * D6622
            BINT8                                * D6627
            {                                    * D662C
              #       B910                       * D6631  47376
              ::                                 * D663B
                BINT3                            * D6640
                FALSE                            * D6645
                $       "« »"                    * D664A
              ;                                  * D665A
            }                                    * D665F
            BINT9                                * D6664
            {                                    * D6669
              #       B911                       * D666E  47377
              ::                                 * D6678
                BINT2                            * D667D
                TRUE                             * D6682
                $       "''"                     * D6687
              ;                                  * D6695
            }                                    * D669A
            BINT10                               * D669F
            {                                    * D66A4
              #       B912                       * D66A9  47378
              ::                                 * D66B3
                BINT2                            * D66B8
                FALSE                            * D66BD
                $       "#"                      * D66C2
              ;                                  * D66CE
            }                                    * D66D3
            BINT13                               * D66D8
            {                                    * D66DD
              #       B913                       * D66E2  47379
              ::                                 * D66EC
                BINT1                            * D66F1
                FALSE                            * D66F6
                $       "_"                      * D66FB
              ;                                  * D6707
            }                                    * D670C
          }                                      * D6711
          EQLookup                               * D6716
          DROP                                   * D671B
          LOOP                                   * D6720
          1GETABND                               * D6725
          {}N                                    * D672A
        ;                                        * D672F

* ROMPTR 0B0 036
* refs (1): D49CE
ROMP_0B0_036:
        ::                                       * D6734
          BINT28                                 * D6739
          OBJ_19FA7                              * D673E
          ?SEMI                                  * D6743
          TRUE                                   * D6748
        ;                                        * D674D

* ROMPTR 0B0 037
* refs (1): D49CE
ROMP_0B0_037:
        ::                                       * D6752
          BINT29                                 * D6757
          OBJ_19FA7                              * D675C
          ?SEMI                                  * D6761
          TRUE                                   * D6766
        ;                                        * D676B

* ROMPTR 0B0 038
* refs (1): D49CE
ROMP_0B0_038:
        ::                                       * D6770
          BINT30                                 * D6775
          OBJ_19FBB                              * D677A
          ?SEMI                                  * D677F
          4GETLAM                                * D6784
          ROMPTR  0B0 046                        * D6789
          DROP                                   * D6794
          ROMPTR  0B0 010                        * D6799
          5GETLAM                                * D67A4
          ROMPTR  0B0 0C1                        * D67A9
          '                                      * D67B4
          ROMPTR  0B1 014                        * D67B9
          FALSE                                  * D67C4
          '                                      * D67C9
          LAM     'IF                            * D67CE
          STOLAM                                 * D67DB
          ROMPTR  0B1 00F                        * D67E0
          TRUE                                   * D67EB
          '                                      * D67F0
          LAM     'IF                            * D67F5
          STOLAM                                 * D6802
          NOTcase                                * D6807
          ::                                     * D680C
            DEPTH                                * D6811
            #0=case                              * D6816
            AtUserStack                          * D681B
            5GETLAM                              * D6820
            ROMPTR  0B0 046                      * D6825
            NOTcase                              * D6830
            AtUserStack                          * D6835
            OVER                                 * D683A
            EQUAL                                * D683F
            IT                                   * D6844
            DROP                                 * D6849
            AtUserStack                          * D684E
          ;                                      * D6853
          1LAMBIND                               * D6858
          AtUserStack                            * D685D
          1GETABND                               * D6862
          5GETLAM                                * D6867
          ROMPTR  0B0 096                        * D686C
          NOTcase                                * D6877
          ::                                     * D687C
            EVAL                                 * D6881
            OBJ_1A03E                            * D6886
          ;                                      * D688B
          5GETLAM                                * D6890
          ROMPTR  0B0 041                        * D6895
        ;                                        * D68A0

* ROMPTR 0B0 039
* refs (1): D49CE
ROMP_0B0_039:
        ::                                       * D68A5
          5GETLAM                                * D68AA
          BINT44                                 * D68AF
          OBJ_19FBB                              * D68B4
          ?SEMI                                  * D68B9
          EDITPARTS                              * D68BE
          #>1                                    * D68C3
          NOT                                    * D68C8
          ROMPTR  0B0 03F                        * D68CD
          Parse.1                                * D68D8
          NOTcase                                * D68DD
          ROMPTR  0B0 03A                        * D68E2
          PTR     NULL::                         * D68ED
          EQUALcasedrop                          * D68F2
          ROMPTR  0B0 03B                        * D68F7
          ROMPTR  0B0 040                        * D6902
          ROMPTR  0B0 03C                        * D690D
          5GETLAM                                * D6918
          ROMPTR  0B0 096                        * D691D
          NOTcase                                * D6928
          ::                                     * D692D
            SWAPDROP                             * D6932
            EVAL                                 * D6937
          ;                                      * D693C
          5GETLAM                                * D6941
          ROMPTR  0B0 041                        * D6946
          ROMPTR  0B0 0A7                        * D6951
          NOTcase                                * D695C
          ::                                     * D6961
            5GETLAM                              * D6966
            ROMPTR  0B0 024                      * D696B
            ROMPTR  0B0 06B                      * D6976
            SetDA1NoCh                           * D6981
          ;                                      * D6986
          5GETLAM                                * D698B
          ROMPTR  0B0 013                        * D6990  IFEDispField
          ROMPTR  0B0 06C                        * D699B
          ::                                     * D69A6
            SetDA1NoCh                           * D69AB
            SetDA2aNoCh                          * D69B0
          ;                                      * D69B5
        ;                                        * D69BA

* ROMPTR 0B0 03A
* refs (1): D49CE
ROMP_0B0_03A:
        ::                                       * D69BF
          DispBadToken                           * D69C4
          SetPrgmEntry                           * D69C9
          DROP                                   * D69CE
          #SyntaxErr                             * D69D3
          ClrDA2bEdit                            * D69D8
          ::                                     * D69DD
            SetDA1NoCh                           * D69E2
            SetDA2aNoCh                          * D69E7
            SetDA3NoCh                           * D69EC
          ;                                      * D69F1
          ROMPTR  0B0 091                        * D69F6  DoAlert
          SetDA2bTemp                            * D6A01
          SetDA2bEdit                            * D6A06
        ;                                        * D6A0B

* ROMPTR 0B0 03B
* refs (1): D49CE
ROMP_0B0_03B:
        ::                                       * D6A10
          5GETLAM                                * D6A15
          DUP                                    * D6A1A
          ROMPTR  0B0 01F                        * D6A1F
          ROMPTR  0B0 0A7                        * D6A2A
          SWAP                                   * D6A35
          NOTcasedrop                            * D6A3A
          SetDA1NoCh                             * D6A3F
          ROMPTR  0B0 013                        * D6A44  IFEDispField
          ::                                     * D6A4F
            SetDA1NoCh                           * D6A54
            SetDA2aNoCh                          * D6A59
          ;                                      * D6A5E
        ;                                        * D6A63

* ROMPTR 0B0 03C
* refs (1): D49CE
ROMP_0B0_03C:
        ::                                       * D6A68
          DUPTYPECOL?                            * D6A6D
          NOT?SEMI                               * D6A72
          DUP                                    * D6A77
          CARCOMP                                * D6A7C
          '                                      * D6A81
          x'                                     * D6A86
          EQUAL                                  * D6A8B
          case                                   * D6A90
          ::                                     * D6A95
            BINT2                                * D6A9A
            NTHCOMPDROP                          * D6A9F
          ;                                      * D6AA4
          DO>STR                                 * D6AA9
        ;                                        * D6AAE

* ROMPTR 0B0 03D
* refs (1): D49CE
ROMP_0B0_03D:
        ::                                       * D6AB3
          5GETLAM                                * D6AB8
          BINT38                                 * D6ABD
          OBJ_19FBB                              * D6AC2
          ?SEMI                                  * D6AC7
          SetDA123NoCh                           * D6ACC
          4GETLAM                                * D6AD1
          DUP                                    * D6AD6
          ROMPTR  0B0 02B                        * D6ADB
          OVER                                   * D6AE6
          NULL{}                                 * D6AEB
          EQUAL                                  * D6AF0
          case                                   * D6AF5
          3DROP                                  * D6AFA
          #1+                                    * D6AFF
          2DUP                                   * D6B04
          SWAP                                   * D6B09
          LENCOMP                                * D6B0E
          #>                                     * D6B13
          IT                                     * D6B18
          DROPONE                                * D6B1D
          NTHCOMPDROP                            * D6B22
          OVER                                   * D6B27
          ROMPTR  0B0 0D5                        * D6B2C  ~sFldVal
          DUP                                    * D6B37
          ROMPTR  0B0 041                        * D6B3C
          ROMPTR  0B0 013                        * D6B47  IFEDispField
        ;                                        * D6B52

* ROMPTR 0B0 03E
* refs (1): D49CE
ROMP_0B0_03E:
        ::                                       * D6B57
          5GETLAM                                * D6B5C
          BINT39                                 * D6B61
          OBJ_19FBB                              * D6B66
          ?SEMI                                  * D6B6B
          4GETLAM                                * D6B70
          DUP                                    * D6B75
          ROMPTR  0B0 02B                        * D6B7A
          OVER                                   * D6B85
          LENCOMP                                * D6B8A
          '                                      * D6B8F
          ::                                     * D6B94
            SWAP                                 * D6B99
            OBJ_1A01B                            * D6B9E
          ;                                      * D6BA3
          4ROLL                                  * D6BA8
          >HCOMP                                 * D6BAD
          DUP                                    * D6BB2
          4UNROLL                                * D6BB7
          SWAP                                   * D6BBC
          ROT                                    * D6BC1
          #1+                                    * D6BC6
          5PICK                                  * D6BCB
          ROMPTR  0B0 0C0                        * D6BD0
          SWAP                                   * D6BDB
          7ROLL                                  * D6BE0
          ROMPTR  0B0 09E                        * D6BE5
          NOTcase2drop                           * D6BF0
          DoBadKey                               * D6BF5
          SWAP                                   * D6BFA
          EVAL                                   * D6BFF
          OVER                                   * D6C04
          ROMPTR  0B0 0D5                        * D6C09  ~sFldVal
          DUP                                    * D6C14
          ROMPTR  0B0 041                        * D6C19
          ROMPTR  0B0 013                        * D6C24  IFEDispField
          SetDA123NoCh                           * D6C2F
        ;                                        * D6C34

* ROMPTR 0B0 03F
* refs (1): D49CE
ROMP_0B0_03F:
        ::                                       * D6C39
          5GETLAM                                * D6C3E
          BINT24                                 * D6C43
          OBJ_19FBB                              * D6C48
          DROP                                   * D6C4D
        ;                                        * D6C52

* ROMPTR 0B0 040
* refs (1): D49CE
ROMP_0B0_040:
        ::                                       * D6C57
          5GETLAM                                * D6C5C
          BINT25                                 * D6C61
          OBJ_19FBB                              * D6C66
          DROP                                   * D6C6B
        ;                                        * D6C70

* ROMPTR 0B0 041
* refs (1): D49CE
ROMP_0B0_041:
        ::                                       * D6C75
          BINT47                                 * D6C7A
          OBJ_19FBB                              * D6C7F
          DROP                                   * D6C84
        ;                                        * D6C89

* ROMPTR 0B0 042
* refs (1): D49CE
ROMP_0B0_042:
        ::                                       * D6C8E
          BINT45                                 * D6C93
          OBJ_19FBB                              * D6C98
          ?SEMI                                  * D6C9D
          4GETLAM                                * D6CA2
          ROMPTR  0B0 07A                        * D6CA7
          NOTcasedrop                            * D6CB2
          TRUE                                   * D6CB7
          SWAP                                   * D6CBC
          XEQTYPE                                * D6CC1
          COERCE                                 * D6CC6
          SWAPDROP                               * D6CCB
          EQUALPOSCOMP                           * D6CD0
          #0<>                                   * D6CD5
        ;                                        * D6CDA

* ROMPTR 0B0 043
* refs (1): D49CE
ROMP_0B0_043:
        ::                                       * D6CDF
          BINT46                                 * D6CE4
          OBJ_19FBB                              * D6CE9
          ?SEMI                                  * D6CEE
          DROP                                   * D6CF3
          TRUE                                   * D6CF8
        ;                                        * D6CFD

* ROMPTR 0B0 044
* refs (1): D49CE
ROMP_0B0_044:
        ::                                       * D6D02
          BINT9                                  * D6D07
          OBJ_19FBB                              * D6D0C
          ?SEMI                                  * D6D11
          4GETLAM                                * D6D16
          DUP                                    * D6D1B
          ROMPTR  0B0 08D                        * D6D20
          case                                   * D6D2B
          ::                                     * D6D30
            DUP                                  * D6D35
            ROMPTR  0B0 0A1                      * D6D3A
            ROMPTR  0B0 0C5                      * D6D45  ~gFldVal
            ITE                                  * D6D50
            ROMPTR  0B0 07F                      * D6D55
            ROMPTR  0B0 082                      * D6D60
            TOTEMPOB                             * D6D6B
          ;                                      * D6D70
          DUP                                    * D6D75
          ROMPTR  0B0 045                        * D6D7A
          SWAP                                   * D6D85
          ROMPTR  0B0 0C7                        * D6D8A
          ROTDUP                                 * D6D95
          LEN$                                   * D6D9A
          BINT6                                  * D6D9F
          #*                                     * D6DA4
          4PICK                                  * D6DA9
          DUPUNROT                               * D6DAE
          #<ITE                                  * D6DB3
          DROP                                   * D6DB8
          ::                                     * D6DBD
            BINT6                                * D6DC2
            #/                                   * D6DC7
            SWAPDROP                             * D6DCC
            1_#1-SUB$                            * D6DD1
            CHR_...                              * D6DD6
            >T$                                  * D6DDB
          ;                                      * D6DE0
          $>GROB                                 * D6DE5
          3UNROLL                                * D6DEA
          SWAP                                   * D6DEF
          MAKEGROB                               * D6DF4
          DUPUNROT                               * D6DF9
          ONEONE                                 * D6DFE
          GROB!                                  * D6E03
        ;                                        * D6E08

* ROMPTR 0B0 045
* refs (1): D49CE
ROMP_0B0_045:
        ::                                       * D6E0D
          KEYINBUFFER?                           * D6E12
          case                                   * D6E17
          ::                                     * D6E1C
            DUP                                  * D6E21
            ROMPTR  0B0 0A2                      * D6E26
            ROMPTR  0B0 079                      * D6E31
            ITE                                  * D6E3C
            NULL$                                * D6E41
            _chr(31)_                            * D6E46
          ;                                      * D6E4B
          DUP                                    * D6E50
          ROMPTR  0B0 0A1                        * D6E55
          BINT10                                 * D6E60
          OBJ_19FBB                              * D6E65
          ?SEMI                                  * D6E6A
          4GETLAM                                * D6E6F
          DUP                                    * D6E74
          ROMPTR  0B0 0C5                        * D6E79  ~gFldVal
          SWAP                                   * D6E84
          ROMPTR  0B0 0C0                        * D6E89
          ROMPTR  0B0 074                        * D6E94
        ;                                        * D6E9F

* ROMPTR 0B0 046
* refs (1): D49CE
ROMP_0B0_046:
        ::                                       * D6EA4
          BINT41                                 * D6EA9
          OBJ_19FBB                              * D6EAE
          ?SEMI                                  * D6EB3
          4GETLAM                                * D6EB8
          ROMPTR  0B0 078                        * D6EBD
        ;                                        * D6EC8

* ROMPTR 0B0 047
* refs (1): D49CE
ROMP_0B0_047:
        ::                                       * D6ECD
          {                                      * D6ED2
            BINT26                               * D6ED7
            ROMPTR  0B0 056                      * D6EDC  DoKeyEdit
            BINT7                                * D6EE7
            DoBadKey                             * D6EEC
          }                                      * D6EF1
          OBJ_19FE4                              * D6EF6
          caseTRUE                               * D6EFB
          EditExstCase                           * D6F00
          ROMPTR  0B0 04D                        * D6F05
          {                                      * D6F10
            BINT17                               * D6F15
            DoBadKey                             * D6F1A
            BINT25                               * D6F1F
            ROMPTR  0B0 054                      * D6F24
          }                                      * D6F2F
          OBJ_19FE4                              * D6F34
          caseTRUE                               * D6F39
          BINT2                                  * D6F3E
          OVER                                   * D6F43
          BINT7                                  * D6F48
          #<case                                 * D6F4D
          OBJ_19F93                              * D6F52
          {                                      * D6F57
            BINT12                               * D6F5C
            BINT35                               * D6F61
            BINT40                               * D6F66
          }                                      * D6F6B
          3PICK                                  * D6F70
          #=POSCOMP                              * D6F75
          #0<>                                   * D6F7A
          case                                   * D6F7F
          OBJ_19F93                              * D6F84
          2DUP                                   * D6F89
          Key>U/SKeyOb                           * D6F8E
          OBJ_4080F                              * D6F93
          SWAPDROP                               * D6F98
          case2drop                              * D6F9D
          'DoBadKeyT                             * D6FA2
          5GETLAM                                * D6FA7
          DUP                                    * D6FAC
          ROMPTR  0B0 088                        * D6FB1
          casedrop                               * D6FBC
          OBJ_19F0F                              * D6FC1
          ROMPTR  0B0 08B                        * D6FC6
          NOTcase2drop                           * D6FD1
          'DoBadKeyT                             * D6FD6
          ROMPTR  0B0 052                        * D6FDB
        ;                                        * D6FE6

* ROMPTR 0B0 048
* refs (1): D49CE
ROMP_0B0_048:
        ::                                       * D6FEB
          {                                      * D6FF0
            BINT7                                * D6FF5
            DoBadKey                             * D6FFA
          }                                      * D6FFF
          OBJ_19FE4                              * D7004
          caseTRUE                               * D7009
          EditExstCase                           * D700E
          ROMPTR  0B0 04E                        * D7013
          {                                      * D701E
            BINT11                               * D7023
            ROMPTR  0B0 060                      * D7028
            BINT17                               * D7033
            ROMPTR  0B0 061                      * D7038
            BINT16                               * D7043
            ROMPTR  0B0 062                      * D7048
            BINT18                               * D7053
            ROMPTR  0B0 063                      * D7058
            BINT25                               * D7063
            ROMPTR  0B0 055                      * D7068
            BINT26                               * D7073
            ROMPTR  0B0 057                      * D7078
          }                                      * D7083
          OBJ_19FE4                              * D7088
          caseTRUE                               * D708D
          BINT3                                  * D7092
          OVER                                   * D7097
          BINT7                                  * D709C
          #<case                                 * D70A1
          OBJ_19F93                              * D70A6
          {                                      * D70AB
            BINT45                               * D70B0
            BINT35                               * D70B5
            BINT40                               * D70BA
          }                                      * D70BF
          3PICK                                  * D70C4
          #=POSCOMP                              * D70C9
          #0<>                                   * D70CE
          case                                   * D70D3
          OBJ_19F93                              * D70D8
          2DUP                                   * D70DD
          Key>U/SKeyOb                           * D70E2
          OBJ_4080F                              * D70E7
          SWAPDROP                               * D70EC
          case2drop                              * D70F1
          'DoBadKeyT                             * D70F6
          5GETLAM                                * D70FB
          DUP                                    * D7100
          ROMPTR  0B0 088                        * D7105
          casedrop                               * D7110
          OBJ_19F0F                              * D7115
          ROMPTR  0B0 08B                        * D711A
          NOTcase2drop                           * D7125
          'DoBadKeyT                             * D712A
          ROMPTR  0B0 052                        * D712F
        ;                                        * D713A

* ROMPTR 0B0 049
* refs (1): D49CE
ROMP_0B0_049:
        ::                                       * D713F
          {                                      * D7144
            BINT25                               * D7149
            ROMPTR  0B0 05A                      * D714E  DoKeyOK
            BINT45                               * D7159
            ROMPTR  0B0 059                      * D715E  DoKeyCancel
          }                                      * D7169
          OBJ_19FE4                              * D716E
          caseTRUE                               * D7173
          EditExstCase                           * D7178
          ROMPTR  0B0 04F                        * D717D
          BINT4                                  * D7188
          {                                      * D718D
            BINT30                               * D7192
            BINT35                               * D7197
            BINT40                               * D719C
          }                                      * D71A1
          3PICK                                  * D71A6
          #=POSCOMP                              * D71AB
          #0<>                                   * D71B0
          case                                   * D71B5
          OBJ_19F93                              * D71BA
          2DUP                                   * D71BF
          Key>U/SKeyOb                           * D71C4
          OBJ_4080F                              * D71C9
          SWAPDROP                               * D71CE
          case2drop                              * D71D3
          'DoBadKeyT                             * D71D8
          5GETLAM                                * D71DD
          DUP                                    * D71E2
          ROMPTR  0B0 088                        * D71E7
          casedrop                               * D71F2
          OBJ_19F0F                              * D71F7
          ROMPTR  0B0 08B                        * D71FC
          NOTcase2drop                           * D7207
          'DoBadKeyT                             * D720C
          ROMPTR  0B0 052                        * D7211
        ;                                        * D721C

* ROMPTR 0B0 04A
* refs (1): D49CE
ROMP_0B0_04A:
        ::                                       * D7221
          EditExstCase                           * D7226
          ROMPTR  0B0 050                        * D722B
          BINT5                                  * D7236
          {                                      * D723B
            BINT30                               * D7240
            BINT35                               * D7245
            BINT40                               * D724A
          }                                      * D724F
          3PICK                                  * D7254
          #=POSCOMP                              * D7259
          #0<>                                   * D725E
          case                                   * D7263
          OBJ_19F93                              * D7268
          2DUP                                   * D726D
          Key>U/SKeyOb                           * D7272
          OBJ_4080F                              * D7277
          SWAPDROP                               * D727C
          case2drop                              * D7281
          'DoBadKeyT                             * D7286
          5GETLAM                                * D728B
          DUP                                    * D7290
          ROMPTR  0B0 088                        * D7295
          casedrop                               * D72A0
          OBJ_19F0F                              * D72A5
          ROMPTR  0B0 08B                        * D72AA
          NOTcase2drop                           * D72B5
          'DoBadKeyT                             * D72BA
          ROMPTR  0B0 052                        * D72BF
        ;                                        * D72CA

* ROMPTR 0B0 04B
* refs (1): D49CE
ROMP_0B0_04B:
        ::                                       * D72CF
          EditExstCase                           * D72D4
          ROMPTR  0B0 051                        * D72D9
          BINT6                                  * D72E4
          {                                      * D72E9
            BINT45                               * D72EE
            BINT35                               * D72F3
            BINT40                               * D72F8
          }                                      * D72FD
          3PICK                                  * D7302
          #=POSCOMP                              * D7307
          #0<>                                   * D730C
          case                                   * D7311
          OBJ_19F93                              * D7316
          2DUP                                   * D731B
          Key>U/SKeyOb                           * D7320
          OBJ_4080F                              * D7325
          SWAPDROP                               * D732A
          case2drop                              * D732F
          'DoBadKeyT                             * D7334
          5GETLAM                                * D7339
          DUP                                    * D733E
          ROMPTR  0B0 088                        * D7343
          casedrop                               * D734E
          OBJ_19F0F                              * D7353
          ROMPTR  0B0 08B                        * D7358
          NOTcase2drop                           * D7363
          'DoBadKeyT                             * D7368
          ROMPTR  0B0 052                        * D736D
        ;                                        * D7378

* ROMPTR 0B0 04C
* refs (1): D49CE
ROMP_0B0_04C:
        ::                                       * D737D
          TakeOver                               * D7382
          6GETLAM                                * D7387
          DoKeyOb                                * D738C
          NoEditLine?                            * D7391
          ?SEMI                                  * D7396
          6GETLAM                                * D739B
          DUP                                    * D73A0
          MINUSONE                               * D73A5
          #=                                     * D73AA
          caseDROP                               * D73AF
          $       "'#[«\"{:"                     * D73B4
          EDITLINE$                              * D73CC
          CAR$                                   * D73D1
          BINT1                                  * D73D6
          POS$                                   * D73DB
          #0<>                                   * D73E0
          caseDROP                               * D73E5
          Lock?                                  * D73EA
          InitEd&Modes                           * D73EF
          SetPrgmEntry                           * D73F4
          ROMP_0A1_00C                           * D73F9
          IT                                     * D73FE
          LockAlpha                              * D7403
          DoKeyOb                                * D7408
        ;                                        * D740D

* ROMPTR 0B0 04D
* refs (1): D49CE
ROMP_0B0_04D:
        ::                                       * D7412
          BINT2                                  * D7417
          COLA                                   * D741C
          OBJ_19F0F                              * D7421
        ;                                        * D7426

* ROMPTR 0B0 04E
* refs (1): D49CE
ROMP_0B0_04E:
        ::                                       * D742B
          BINT3                                  * D7430
          COLA                                   * D7435
          OBJ_19F0F                              * D743A
        ;                                        * D743F

* ROMPTR 0B0 04F
* refs (1): D49CE
ROMP_0B0_04F:
        ::                                       * D7444
          BINT4                                  * D7449
          COLA                                   * D744E
          OBJ_19F0F                              * D7453
        ;                                        * D7458

* ROMPTR 0B0 050
* refs (1): D49CE
ROMP_0B0_050:
        ::                                       * D745D
          BINT5                                  * D7462
          COLA                                   * D7467
          OBJ_19F0F                              * D746C
        ;                                        * D7471

* ROMPTR 0B0 051
* refs (1): D49CE
ROMP_0B0_051:
        ::                                       * D7476
          BINT6                                  * D747B
          COLA                                   * D7480
          OBJ_19F0F                              * D7485
        ;                                        * D748A

* ROMPTR 0B0 052
* refs (1): D49CE
ROMP_0B0_052:
        ::                                       * D748F
          Key>U/SKeyOb                           * D7494
          DUPTYPECHAR?                           * D7499
          case                                   * D749E
          ROMPTR  0B0 053                        * D74A3
          DUPTYPECSTR?                           * D74AE
          case                                   * D74B3
          ::                                     * D74B8
            ROMPTR  0B3 013                      * D74BD
            ROMPTR  0B0 053                      * D74C8
          ;                                      * D74D3
          DROP                                   * D74D8
          'DoBadKeyT                             * D74DD
        ;                                        * D74E2

* ROMPTR 0B0 053
* refs (1): D49CE
ROMP_0B0_053:
        ::                                       * D74E7
          '                                      * D74EC
          TakeOver                               * D74F1
          SWAP                                   * D74F6
          BINT2                                  * D74FB
          ::N                                    * D7500
          '                                      * D7505
          ROMPTR  0B0 03E                        * D750A
          >TCOMP                                 * D7515
          TRUE                                   * D751A
        ;                                        * D751F

* ROMPTR 0B0 054
* refs (1): D49CE
ROMP_0B0_054:
        ::                                       * D7524
          ComLine?:(bip;q)                       * D7529
          5GETLAM                                * D752E
          ROMPTR  0B0 088                        * D7533
          NOTcase                                * D753E
          DoBadKey                               * D7543
          NULL{}                                 * D7548
          InitMenu                               * D754D
          DEPTH                                  * D7552
          1LAMBIND                               * D7557
          OBJ_6B48E                              * D755C
          DEPTH                                  * D7561
          1GETABND                               * D7566
          ROMPTR  0B0 0A7                        * D756B
          #>                                     * D7576
          NOT?SEMI                               * D757B
          5GETLAM                                * D7580
          ROMPTR  0B0 096                        * D7585
          NOTcase                                * D7590
          EVAL                                   * D7595
          5GETLAM                                * D759A
          ROMPTR  0B0 041                        * D759F
        ;                                        * D75AA

* ROMPTR 0B0 055
* refs (1): D49CE
ROMP_0B0_055:
        ::                                       * D75AF
          ComLine?:(bip;q)                       * D75B4
          5GETLAM                                * D75B9
          ROMPTR  0B0 088                        * D75BE
          NOTcase                                * D75C9
          DoBadKey                               * D75CE
          DEPTH                                  * D75D3
          1LAMBIND                               * D75D8
          DoNewMatrix                            * D75DD
          DEPTH                                  * D75E2
          1GETABND                               * D75E7
          #>                                     * D75EC
          NOT?SEMI                               * D75F1
          5GETLAM                                * D75F6
          ROMPTR  0B0 096                        * D75FB
          NOTcase                                * D7606
          EVAL                                   * D760B
          5GETLAM                                * D7610
          ROMPTR  0B0 041                        * D7615
        ;                                        * D7620

* ROMPTR 0B0 056
* refs (1): D49CE
DoKeyEdit:
        ::                                       * D7625
          TakeOver                               * D762A
          EditExstCase                           * D762F
          ::                                     * D7634
            ROMPTR  0B0 0A8                      * D7639
            ::                                   * D7644
              SetDA1NoCh                         * D7649
              SetDA2aNoCh                        * D764E
              SetDA2bNoCh                        * D7653
            ;                                    * D7658
          ;                                      * D765D
          5GETLAM                                * D7662
          DUP                                    * D7667
          ROMPTR  0B0 088                        * D766C
          NOTcasedrop                            * D7677
          DoBadKey                               * D767C
          ROMPTR  0B0 02C                        * D7681
          MINUSONE                               * D768C
          6PUTLAM                                * D7691
        ;                                        * D7696

* ROMPTR 0B0 057
* refs (1): D49CE
ROMP_0B0_057:
        ::                                       * D769B
          ComLine?:(bip;q)                       * D76A0
          5GETLAM                                * D76A5
          DUP                                    * D76AA
          ROMPTR  0B0 08A                        * D76AF
          NOTcasedrop                            * D76BA
          DoBadKey                               * D76BF
          ROMPTR  0B0 02F                        * D76C4
        ;                                        * D76CF

* ROMPTR 0B0 058
* refs (1): D49CE
ROMP_0B0_058:
        ::                                       * D76D4
          ComLine?:(bip;q)                       * D76D9
          5GETLAM                                * D76DE
          DUP                                    * D76E3
          ROMPTR  0B0 08D                        * D76E8
          NOTcasedrop                            * D76F3
          DoBadKey                               * D76F8
          DUP                                    * D76FD
          ROMPTR  0B0 031                        * D7702
          DUP                                    * D770D
          ROMPTR  0B0 0C5                        * D7712  ~gFldVal
          ITE                                    * D771D
          ROMPTR  0B0 081                        * D7722
          ROMPTR  0B0 083                        * D772D
          HARDBUFF                               * D7738
          ROT                                    * D773D
          ROMPTR  0B0 0C6                        * D7742
          GROB!                                  * D774D
          SetDA123NoCh                           * D7752
        ;                                        * D7757

* ROMPTR 0B0 059
* refs (1): D49CE
DoKeyCancel:
        ::                                       * D775C
          TakeOver                               * D7761
          EditExstCase                           * D7766
          ::                                     * D776B
            EDITPARTS                            * D7770
            BINT1                                * D7775
            #>                                   * D777A
            ITE                                  * D777F
            SetDA1NoCh                           * D7784
            ::                                   * D7789
              SetDA1NoCh                         * D778E
              SetDA2aNoCh                        * D7793
            ;                                    * D7798
            ROMPTR  0B0 0A7                      * D779D
            ROMP_0A1_02C                         * D77A8
          ;                                      * D77AD
          DAsBad?                                * D77B2
          case                                   * D77B7
          SetDA123NoCh                           * D77BC
          ROMPTR  0B0 036                        * D77C1
          NOTcase                                * D77CC
          SetDA123NoCh                           * D77D1
          FALSE                                  * D77D6
          TRUE                                   * D77DB
          11PUTLAM                               * D77E0
        ;                                        * D77E5

* ROMPTR 0B0 05A
* refs (1): D49CE
DoKeyOK:
        ::                                       * D77EA
          TakeOver                               * D77EF
          EditExstCase                           * D77F4
          ROMPTR  0B0 039                        * D77F9
          ROMPTR  0B0 037                        * D7804
          NOTcase                                * D780F
          SetDA123NoCh                           * D7814
          ROMPTR  0B0 0C8                        * D7819  GetFieldVals
          TRUE                                   * D7824
          TRUE                                   * D7829
          11PUTLAM                               * D782E
          BINT56                                 * D7833
          OBJ_19FA7                              * D7838
          DROP                                   * D783D
        ;                                        * D7842

* ROMPTR 0B0 05B
* refs (1): D49CE
ROMP_0B0_05B:
        ::                                       * D7847
          ComLine?:(bip;q)                       * D784C
          5GETLAM                                * D7851
          ROMPTR  0B0 01A                        * D7856
        ;                                        * D7861

* ROMPTR 0B0 05C
* refs (1): D49CE
ROMP_0B0_05C:
        ::                                       * D7866
          ComLine?:(bip;q)                       * D786B
          5GETLAM                                * D7870
          DUP                                    * D7875
          ROMPTR  0B0 088                        * D787A
          NOTcasedrop                            * D7885
          DoBadKey                               * D788A
          ROMPTR  0B0 038                        * D788F
        ;                                        * D789A

* ROMPTR 0B0 05D
* refs (1): D49CE
ROMP_0B0_05D:
        ::                                       * D789F
          ComLine?:(bip;q)                       * D78A4
          5GETLAM                                * D78A9
          DUP                                    * D78AE
          ROMPTR  0B0 088                        * D78B3
          NOTcasedrop                            * D78BE
          DoBadKey                               * D78C3
          ROMPTR  0B0 032                        * D78C8
        ;                                        * D78D3

* ROMPTR 0B0 05E
* refs (1): D49CE
ROMP_0B0_05E:
        ::                                       * D78D8
          TakeOver                               * D78DD
          NoEditLine?                            * D78E2
          case                                   * D78E7
          ROMPTR  0B0 064                        * D78EC
          EDITPARTS                              * D78F7
          #1=case                                * D78FC
          DoBadKey                               * D7901
          ROMP_0A1_00A                           * D7906
        ;                                        * D790B

* ROMPTR 0B0 05F
* refs (1): D49CE
ROMP_0B0_05F:
        ::                                       * D7910
          TakeOver                               * D7915
          NoEditLine?                            * D791A
          case                                   * D791F
          ROMPTR  0B0 065                        * D7924
          EDITPARTS                              * D792F
          #1=case                                * D7934
          DoBadKey                               * D7939
          ROMP_0A1_010                           * D793E
        ;                                        * D7943

* ROMPTR 0B0 060
* refs (1): D49CE
ROMP_0B0_060:
        ::                                       * D7948
          TakeOver                               * D794D
          5GETLAM                                * D7952
          ROMPTR  0B0 02A                        * D7957
          ROMPTR  0B0 095                        * D7962
        ;                                        * D796D

* ROMPTR 0B0 061
* refs (1): D49CE
ROMP_0B0_061:
        ::                                       * D7972
          TakeOver                               * D7977
          5GETLAM                                * D797C
          ROMPTR  0B0 029                        * D7981
          ROMPTR  0B0 095                        * D798C
        ;                                        * D7997

* ROMPTR 0B0 062
* refs (1): D49CE
ROMP_0B0_062:
        ::                                       * D799C
          TakeOver                               * D79A1
          5GETLAM                                * D79A6
          DUP                                    * D79AB
          BEGIN                                  * D79B0
          ROMPTR  0B0 026                        * D79B5
          2DUP                                   * D79C0
          #>                                     * D79C5
          WHILE                                  * D79CA
          ::                                     * D79CF
            SWAPDROP                             * D79D4
            DUP                                  * D79D9
          ;                                      * D79DE
          REPEAT                                 * D79E3
          DROP                                   * D79E8
          ROMPTR  0B0 095                        * D79ED
        ;                                        * D79F8
