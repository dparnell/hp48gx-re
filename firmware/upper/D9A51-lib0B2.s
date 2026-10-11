* HP 48GX ROM revision R, #D9A51-#DCA81: Library part 0B2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #D9A51 in the original ROM).

LIB0B2:
        CON(3)  #0B2                             * D9A51  library number
        REL(5)  LIB0B2.hash                      * D9A54  hash table
        CON(5)  0                                * D9A59  message table
        REL(5)  LIB0B2.link                      * D9A5E  link table
        CON(5)  0                                * D9A63  config
        RPL

* ROMPTR 0B2 000
* refs (1): D9A51
ROMP_0B2_000:
        ::                                       * D9A68
          TakeOver                               * D9A6D
          '                                      * D9A72
          DROPFALSE                              * D9A77
          NULL$                                  * D9A7C
          BINT1                                  * D9A81
          OBJ_40CC3                              * D9A86
          BINT4                                  * D9A8B
          ZERO_DO                                * D9A90
          GetLastEdit                            * D9A95
          ?SKIP                                  * D9A9A
          NULL$                                  * D9A9F
          LOOP                                   * D9AA4
          BINT4                                  * D9AA9
          {}N                                    * D9AAE
          BINT1                                  * D9AB3
          ROMPTR  0B3 000                        * D9AB8  ~Choose
          NOTcase                                * D9AC3
          SetDA123NoCh                           * D9AC8
          InitEdLine                             * D9ACD
          EditString                             * D9AD2
          SetDA13NoCh                            * D9AD7
        ;                                        * D9ADC

* ROMPTR 0B2 001
* refs (1): D9A51
ROMP_0B2_001:
        ::                                       * D9AE1
          TakeOver                               * D9AE6
          ROMPTR  0B2 002                        * D9AEB
          DUPNULL$?                              * D9AF6
          caseDROP                               * D9AFB
          Echo$NoChr00                           * D9B00
        ;                                        * D9B05

* ROMPTR 0B2 002
* refs (1): D9A51
ROMP_0B2_002:
        ::                                       * D9B0A
          BINT128                                * D9B0F
          BINT0                                  * D9B14
          NULL$                                  * D9B19
          {                                      * D9B1E
            LAM     '1C                          * D9B23
            LAM     'CF                          * D9B30
            LAM     'EC                          * D9B3D
          }                                      * D9B4A
          BIND                                   * D9B4F
          EditLExists?                           * D9B54
          EDITLINE$                              * D9B59
          CURSOR@                                * D9B5E
          INSERT?                                * D9B63
          PrgmEntry?                             * D9B68
          AlgEntry?                              * D9B6D
          MinusMo                                * D9B72
          BINT7                                  * D9B77
          ROMPTR  0B0 0DB                        * D9B7C  ~nNullBind
          InitEd&Modes                           * D9B87
          ROMPTR  0B2 003                        * D9B8C
          DoInputForm                            * D9B97
          IT                                     * D9B9C
          DROP                                   * D9BA1
          8GETLAM                                * D9BA6
          IT                                     * D9BAB
          ::                                     * D9BB0
            7GETLAM                              * D9BB5
            EditString                           * D9BBA
            6GETLAM                              * D9BBF
            #1+                                  * D9BC4
            SetCursPos(s)                        * D9BC9
          ;                                      * D9BCE
          5GETLAM                                * D9BD3
          ?SKIP                                  * D9BD8
          REPLACE_MODE                           * D9BDD
          4GETLAM                                * D9BE2
          IT                                     * D9BE7
          SetPrgmEntry                           * D9BEC
          3GETLAM                                * D9BF1
          IT                                     * D9BF6
          SetAlgEntry                            * D9BFB
          2GETLAM                                * D9C00
          IT                                     * D9C05
          MinusMo_539A0                          * D9C0A
          ABND                                   * D9C0F
          LAM     'EC                            * D9C14
          ABND                                   * D9C21
        ;                                        * D9C26

* ROMPTR 0B2 003
* refs (1): D9A51
ROMP_0B2_003:
        ::                                       * D9C2B
          OBJ_38345                              * D9C30
          ROMPTR  0B2 006                        * D9C35
          BINT0                                  * D9C40
          BINT0                                  * D9C45
          BINT7                                  * D9C4A
          BINT9                                  * D9C4F
          BINT0                                  * D9C54
          MINUSONE                               * D9C59
          MINUSONE                               * D9C5E
          NULL$                                  * D9C63
          MINUSONE                               * D9C68
          MINUSONE                               * D9C6D
          MINUSONE                               * D9C72
          DUP                                    * D9C77
          BINT0                                  * D9C7C
          BINT1                                  * D9C81
          OBJ_38345                              * D9C86
          ROMPTR  0B2 004                        * D9C8B
          #       B998                           * D9C96  47512
        ;                                        * D9CA0

* ROMPTR 0B2 004
* refs (1): D9A51
ROMP_0B2_004:
        ::                                       * D9CA5
          {                                      * D9CAA
            BINT5                                * D9CAF
            ::                                   * D9CB4
              BINT39                             * D9CB9
              BINT131                            * D9CBE
              MAKEGROB                           * D9CC3
              TRUE                               * D9CC8
            ;                                    * D9CCD
            BINT15                               * D9CD2
            ::                                   * D9CD7
              '                                  * D9CDC
              ROMPTR  0B2 01A                    * D9CE1
            ;                                    * D9CEC
            BINT2                                * D9CF1
            ROMPTR  0B2 005                      * D9CF6
          }                                      * D9D01
          EQLookup                               * D9D06
          case                                   * D9D0B
          ::                                     * D9D10
            EVAL                                 * D9D15
            TRUE                                 * D9D1A
          ;                                      * D9D1F
          DROPFALSE                              * D9D24
        ;                                        * D9D29

* ROMPTR 0B2 005
* refs (1): D9A51
ROMP_0B2_005:
        ::                                       * D9D2E
          ROMPTR  0B0 0AE                        * D9D33
          LAM     '1C                            * D9D3E
          DUP                                    * D9D4B
          #>$                                    * D9D50
          CHR_-                                  * D9D55
          >T$                                    * D9D5A
          SWAP                                   * D9D5F
          BINT63                                 * D9D64
          #+                                     * D9D69
          #>$                                    * D9D6E
          &$                                     * D9D73
          &$                                     * D9D78
          ROMPTR  0B0 0A5                        * D9D7D
        ;                                        * D9D88

* ROMPTR 0B2 006
* refs (1): D9A51
ROMP_0B2_006:
        ::                                       * D9D8D
          {                                      * D9D92
            BINT8                                * D9D97
            ::                                   * D9D9C
              2DUP                               * D9DA1
              ROMPTR  0B2 00A                    * D9DA6
              ITE                                * D9DB1
              ::                                 * D9DB6
                3UNROLL                          * D9DBB
                2DROP                            * D9DC0
                TrueTrue                         * D9DC5
              ;                                  * D9DCA
              FALSE                              * D9DCF
            ;                                    * D9DD4
          }                                      * D9DD9
          EQLookup                               * D9DDE
          case                                   * D9DE3
          EVAL                                   * D9DE8
          {                                      * D9DED
            BINT7                                * D9DF2
            ROMPTR  0B2 007                      * D9DF7
            BINT11                               * D9E02
            ::                                   * D9E07
              DROP                               * D9E0C
              ROMPTR  0B2 008                    * D9E11
            ;                                    * D9E1C
          }                                      * D9E21
          EQLookup                               * D9E26
          case                                   * D9E2B
          ::                                     * D9E30
            EVAL                                 * D9E35
            TRUE                                 * D9E3A
          ;                                      * D9E3F
          DROPFALSE                              * D9E44
        ;                                        * D9E49

* ROMPTR 0B2 007
* refs (1): D9A51
ROMP_0B2_007:
        ::                                       * D9E4E
          {                                      * D9E53
            ROMPTR  0B2 02B                      * D9E58
            ROMPTR  0B2 02C                      * D9E63
            ROMPTR  0B2 02D                      * D9E6E
            ROMPTR  0B2 02E                      * D9E79
          }                                      * D9E84
          LAM     '1C                            * D9E89
          BINT64                                 * D9E96
          #/                                     * D9E9B
          SWAPDROP                               * D9EA0
          #1+                                    * D9EA5
          OBJ_1A01B                              * D9EAA
          HARDBUFF                               * D9EAF
          BINT9                                  * D9EB4
          BINT8                                  * D9EB9
          BINT46                                 * D9EBE
          BINT2                                  * D9EC3
          BLANKIT                                * D9EC8
          GROB!                                  * D9ECD
          SetDA2aValid                           * D9ED2
          BINT1                                  * D9ED7
          ROMPTR  0B0 0A1                        * D9EDC
          LAM     'CF                            * D9EE7
          ROMPTR  0B2 020                        * D9EF4
        ;                                        * D9EFF

* ROMPTR 0B2 008
* refs (1): D9A51
ROMP_0B2_008:
        ::                                       * D9F04
          LAM     '1C                            * D9F09
          LAM     'CF                            * D9F16
          #+                                     * D9F23
          DUP                                    * D9F28
          #>$                                    * D9F2D
          $>grob                                 * D9F32
          SWAP                                   * D9F37
          #1+                                    * D9F3C
          ROMPTR  0B2 02F                        * D9F41
          GETATELN                               * D9F4C
          DROP                                   * D9F51
          ROMPTR  0B2 009                        * D9F56
          #       B99A                           * D9F61  47514
          JstGetTHEMESG                          * D9F6B
          $>grob                                 * D9F70
          #       B999                           * D9F75  47513
          JstGetTHEMESG                          * D9F7F
          $>grob                                 * D9F84
          BINT48                                 * D9F89
          BINT8                                  * D9F8E
          BLANKIT                                * D9F93
          HARDBUFF                               * D9F98
          BINT1                                  * D9F9D
          BINT50                                 * D9FA2
          GROB!                                  * D9FA7
          HARDBUFF                               * D9FAC
          #       63                             * D9FB1  99
          BINT50                                 * D9FBB
          GROB!                                  * D9FC0
          HARDBUFF                               * D9FC5
          BINT19                                 * D9FCA
          BINT50                                 * D9FCF
          GROB!                                  * D9FD4
          HARDBUFF                               * D9FD9
          #       77                             * D9FDE  119
          BINT50                                 * D9FE8
          GROB!                                  * D9FED
        ;                                        * D9FF2

* ROMPTR 0B2 009
* refs (1): D9A51
ROMP_0B2_009:
        ::                                       * D9FF7
          DUPNULL$?                              * D9FFC
          casedrop                               * DA001
          ::                                     * DA006
            #       B99B                         * DA00B  47515
            JstGetTHEMESG                        * DA015
            $>grob                               * DA01A
          ;                                      * DA01F
          BINT6                                  * DA024
          BINT40                                 * DA029
          MAKEGROB                               * DA02E
          BINT0                                  * DA033
          ROT                                    * DA038
          DUPLEN$                                * DA03D
          #1+_ONE_DO                             * DA042
          DUP                                    * DA047
          INDEX@                                 * DA04C
          DUP                                    * DA051
          SUB$                                   * DA056
          DUP                                    * DA05B
          CAR$                                   * DA060
          CHR>#                                  * DA065
          DUP                                    * DA06A
          BINT9                                  * DA06F
          #>                                     * DA074
          ITE                                    * DA079
          ::                                     * DA07E
            DROP                                 * DA083
            $>grob                               * DA088
          ;                                      * DA08D
          ::                                     * DA092
            SWAPDROP                             * DA097
            {                                    * DA09C
              ROMPTR  0B2 022                    * DA0A1
              ROMPTR  0B2 023                    * DA0AC
              ROMPTR  0B2 024                    * DA0B7
              ROMPTR  0B2 025                    * DA0C2
              ROMPTR  0B2 026                    * DA0CD
              ROMPTR  0B2 027                    * DA0D8
              ROMPTR  0B2 028                    * DA0E3
              ROMPTR  0B2 029                    * DA0EE
              ROMPTR  0B2 02A                    * DA0F9
            }                                    * DA104
            SWAP                                 * DA109
            OBJ_1A01B                            * DA10E
          ;                                      * DA113
          DUP                                    * DA118
          5PICK                                  * DA11D
          5PICK                                  * DA122
          BINT0                                  * DA127
          GROB!                                  * DA12C
          GROBDIMw                               * DA131
          ROT                                    * DA136
          #+                                     * DA13B
          SWAP                                   * DA140
          LOOP                                   * DA145
          2DROP                                  * DA14A
        ;                                        * DA14F

* ROMPTR 0B2 00A
* refs (1): D9A51
ROMP_0B2_00A:
        ::                                       * DA154
          BINT1                                  * DA159
          #=casedrop                             * DA15E
          ROMPTR  0B2 00B                        * DA163
          BINT2                                  * DA16E
          #=casedrop                             * DA173
          ROMPTR  0B2 00C                        * DA178
          BINT3                                  * DA183
          #=casedrop                             * DA188
          ROMPTR  0B2 00D                        * DA18D
          2DROP                                  * DA198
          'DoBadKeyT                             * DA19D
        ;                                        * DA1A2

* ROMPTR 0B2 00B
* refs (1): D9A51
ROMP_0B2_00B:
        ::                                       * DA1A7
          {                                      * DA1AC
            BINT17                               * DA1B1
            ROMPTR  0B2 00E                      * DA1B6
            BINT11                               * DA1C1
            ROMPTR  0B2 011                      * DA1C6
            BINT16                               * DA1D1
            ROMPTR  0B2 017                      * DA1D6
            BINT18                               * DA1E1
            ROMPTR  0B2 014                      * DA1E6
          }                                      * DA1F1
          OBJ_19FE4                              * DA1F6
          caseTRUE                               * DA1FB
          DUP#<7                                 * DA200
          casedrop                               * DA205
          FALSE                                  * DA20A
          {                                      * DA20F
            BINT25                               * DA214
            BINT45                               * DA219
            BINT12                               * DA21E
            BINT35                               * DA223
            BINT40                               * DA228
          }                                      * DA22D
          SWAP                                   * DA232
          #=POSCOMP                              * DA237
          #0<>                                   * DA23C
          caseFALSE                              * DA241
          'DoBadKeyT                             * DA246
        ;                                        * DA24B

* ROMPTR 0B2 00C
* refs (1): D9A51
ROMP_0B2_00C:
        ::                                       * DA250
          DUP#<7                                 * DA255
          casedrop                               * DA25A
          FALSE                                  * DA25F
          {                                      * DA264
            BINT12                               * DA269
            BINT35                               * DA26E
            BINT40                               * DA273
          }                                      * DA278
          SWAP                                   * DA27D
          #=POSCOMP                              * DA282
          #0<>                                   * DA287
          caseFALSE                              * DA28C
          'DoBadKeyT                             * DA291
        ;                                        * DA296

* ROMPTR 0B2 00D
* refs (1): D9A51
ROMP_0B2_00D:
        ::                                       * DA29B
          {                                      * DA2A0
            BINT17                               * DA2A5
            ROMPTR  0B2 010                      * DA2AA
            BINT11                               * DA2B5
            ROMPTR  0B2 013                      * DA2BA
            BINT16                               * DA2C5
            ROMPTR  0B2 019                      * DA2CA
            BINT18                               * DA2D5
            ROMPTR  0B2 016                      * DA2DA
          }                                      * DA2E5
          OBJ_19FE4                              * DA2EA
          caseTRUE                               * DA2EF
          DUP#<7                                 * DA2F4
          casedrop                               * DA2F9
          FALSE                                  * DA2FE
          {                                      * DA303
            BINT45                               * DA308
            BINT35                               * DA30D
            BINT40                               * DA312
          }                                      * DA317
          SWAP                                   * DA31C
          #=POSCOMP                              * DA321
          #0<>                                   * DA326
          caseFALSE                              * DA32B
          'DoBadKeyT                             * DA330
        ;                                        * DA335

* ROMPTR 0B2 00E
* refs (1): D9A51
ROMP_0B2_00E:
        ::                                       * DA33A
          TakeOver                               * DA33F
          REPEATERCH                             * DA344
          BINT17                                 * DA349
          ROMPTR  0B2 00F                        * DA34E
          ::                                     * DA359
            SetDA1NoCh                           * DA35E
            SetDA2aNoCh                          * DA363
            SetDA3NoCh                           * DA368
          ;                                      * DA36D
        ;                                        * DA372

* ROMPTR 0B2 00F
* refs (1): D9A51
ROMP_0B2_00F:
        ::                                       * DA377
          LAM     'CF                            * DA37C
          DUP                                    * DA389
          BINT16                                 * DA38E
          #/                                     * DA393
          #1+                                    * DA398
          DUP                                    * DA39D
          BINT3                                  * DA3A2
          #>                                     * DA3A7
          IT                                     * DA3AC
          ::                                     * DA3B1
            DROP                                 * DA3B6
            BINT0                                * DA3BB
          ;                                      * DA3C0
          BINT16                                 * DA3C5
          #*                                     * DA3CA
          #+                                     * DA3CF
          DUP                                    * DA3D4
          '                                      * DA3D9
          LAM     'CF                            * DA3DE
          STOLAM                                 * DA3EB
          SWAP                                   * DA3F0
          ROMPTR  0B2 021                        * DA3F5
          ROMPTR  0B2 020                        * DA400
        ;                                        * DA40B

* ROMPTR 0B2 010
* refs (1): D9A51
ROMP_0B2_010:
        ::                                       * DA410
          TakeOver                               * DA415
          LAM     'CF                            * DA41A
          DUP                                    * DA427
          BINT16                                 * DA42C
          #/                                     * DA431
          BINT3                                  * DA436
          #=                                     * DA43B
          case2drop                              * DA440
          SetDA123NoCh                           * DA445
          BINT48                                 * DA44A
          #+                                     * DA44F
          DUP                                    * DA454
          '                                      * DA459
          LAM     'CF                            * DA45E
          STOLAM                                 * DA46B
          SWAP                                   * DA470
          ROMPTR  0B2 021                        * DA475
          ROMPTR  0B2 020                        * DA480
          ::                                     * DA48B
            SetDA1NoCh                           * DA490
            SetDA2aNoCh                          * DA495
            SetDA3NoCh                           * DA49A
          ;                                      * DA49F
        ;                                        * DA4A4

* ROMPTR 0B2 011
* refs (1): D9A51
ROMP_0B2_011:
        ::                                       * DA4A9
          TakeOver                               * DA4AE
          REPEATERCH                             * DA4B3
          BINT11                                 * DA4B8
          ROMPTR  0B2 012                        * DA4BD
          ::                                     * DA4C8
            SetDA1NoCh                           * DA4CD
            SetDA2aNoCh                          * DA4D2
            SetDA3NoCh                           * DA4D7
          ;                                      * DA4DC
        ;                                        * DA4E1

* ROMPTR 0B2 012
* refs (1): D9A51
ROMP_0B2_012:
        ::                                       * DA4E6
          LAM     'CF                            * DA4EB
          DUP                                    * DA4F8
          BINT16                                 * DA4FD
          #/                                     * DA502
          DUP#0=                                 * DA507
          IT                                     * DA50C
          ::                                     * DA511
            DROP                                 * DA516
            BINT4                                * DA51B
          ;                                      * DA520
          #1-                                    * DA525
          BINT16                                 * DA52A
          #*                                     * DA52F
          #+                                     * DA534
          DUP                                    * DA539
          '                                      * DA53E
          LAM     'CF                            * DA543
          STOLAM                                 * DA550
          SWAP                                   * DA555
          ROMPTR  0B2 021                        * DA55A
          ROMPTR  0B2 020                        * DA565
        ;                                        * DA570

* ROMPTR 0B2 013
* refs (1): D9A51
ROMP_0B2_013:
        ::                                       * DA575
          TakeOver                               * DA57A
          LAM     'CF                            * DA57F
          DUP                                    * DA58C
          BINT16                                 * DA591
          #/                                     * DA596
          #0=                                    * DA59B
          case2drop                              * DA5A0
          SetDA123NoCh                           * DA5A5
          DUP                                    * DA5AA
          '                                      * DA5AF
          LAM     'CF                            * DA5B4
          STOLAM                                 * DA5C1
          SWAP                                   * DA5C6
          ROMPTR  0B2 021                        * DA5CB
          ROMPTR  0B2 020                        * DA5D6
          ::                                     * DA5E1
            SetDA1NoCh                           * DA5E6
            SetDA2aNoCh                          * DA5EB
            SetDA3NoCh                           * DA5F0
          ;                                      * DA5F5
        ;                                        * DA5FA

* ROMPTR 0B2 014
* refs (1): D9A51
ROMP_0B2_014:
        ::                                       * DA5FF
          TakeOver                               * DA604
          REPEATERCH                             * DA609
          BINT18                                 * DA60E
          ROMPTR  0B2 015                        * DA613
          ::                                     * DA61E
            SetDA1NoCh                           * DA623
            SetDA2aNoCh                          * DA628
            SetDA3NoCh                           * DA62D
          ;                                      * DA632
        ;                                        * DA637

* ROMPTR 0B2 015
* refs (1): D9A51
ROMP_0B2_015:
        ::                                       * DA63C
          LAM     'CF                            * DA641
          DUP                                    * DA64E
          #1+                                    * DA653
          DUP                                    * DA658
          BINT63                                 * DA65D
          #>                                     * DA662
          IT                                     * DA667
          DROPZERO                               * DA66C
          DUP                                    * DA671
          '                                      * DA676
          LAM     'CF                            * DA67B
          STOLAM                                 * DA688
          SWAP                                   * DA68D
          ROMPTR  0B2 021                        * DA692
          ROMPTR  0B2 020                        * DA69D
        ;                                        * DA6A8

* ROMPTR 0B2 016
* refs (1): D9A51
ROMP_0B2_016:
        ::                                       * DA6AD
          TakeOver                               * DA6B2
          LAM     'CF                            * DA6B7
          DUP                                    * DA6C4
          BINT16                                 * DA6C9
          #/                                     * DA6CE
          SWAP                                   * DA6D3
          BINT15                                 * DA6D8
          #=                                     * DA6DD
          case2drop                              * DA6E2
          SetDA123NoCh                           * DA6E7
          BINT16                                 * DA6EC
          #*                                     * DA6F1
          BINT15                                 * DA6F6
          #+                                     * DA6FB
          DUP                                    * DA700
          '                                      * DA705
          LAM     'CF                            * DA70A
          STOLAM                                 * DA717
          SWAP                                   * DA71C
          ROMPTR  0B2 021                        * DA721
          ROMPTR  0B2 020                        * DA72C
          ::                                     * DA737
            SetDA1NoCh                           * DA73C
            SetDA2aNoCh                          * DA741
            SetDA3NoCh                           * DA746
          ;                                      * DA74B
        ;                                        * DA750

* ROMPTR 0B2 017
* refs (1): D9A51
ROMP_0B2_017:
        ::                                       * DA755
          TakeOver                               * DA75A
          REPEATERCH                             * DA75F
          BINT16                                 * DA764
          ROMPTR  0B2 018                        * DA769
          ::                                     * DA774
            SetDA1NoCh                           * DA779
            SetDA2aNoCh                          * DA77E
            SetDA3NoCh                           * DA783
          ;                                      * DA788
        ;                                        * DA78D

* ROMPTR 0B2 018
* refs (1): D9A51
ROMP_0B2_018:
        ::                                       * DA792
          LAM     'CF                            * DA797
          DUP                                    * DA7A4
          DUP#0=                                 * DA7A9
          IT                                     * DA7AE
          ::                                     * DA7B3
            DROP                                 * DA7B8
            BINT64                               * DA7BD
          ;                                      * DA7C2
          #1-                                    * DA7C7
          DUP                                    * DA7CC
          '                                      * DA7D1
          LAM     'CF                            * DA7D6
          STOLAM                                 * DA7E3
          SWAP                                   * DA7E8
          ROMPTR  0B2 021                        * DA7ED
          ROMPTR  0B2 020                        * DA7F8
        ;                                        * DA803

* ROMPTR 0B2 019
* refs (1): D9A51
ROMP_0B2_019:
        ::                                       * DA808
          TakeOver                               * DA80D
          LAM     'CF                            * DA812
          DUP                                    * DA81F
          BINT16                                 * DA824
          #/                                     * DA829
          SWAP                                   * DA82E
          #0=                                    * DA833
          case2drop                              * DA838
          SetDA123NoCh                           * DA83D
          BINT16                                 * DA842
          #*                                     * DA847
          DUP                                    * DA84C
          '                                      * DA851
          LAM     'CF                            * DA856
          STOLAM                                 * DA863
          SWAP                                   * DA868
          ROMPTR  0B2 021                        * DA86D
          ROMPTR  0B2 020                        * DA878
          ::                                     * DA883
            SetDA1NoCh                           * DA888
            SetDA2aNoCh                          * DA88D
            SetDA3NoCh                           * DA892
          ;                                      * DA897
        ;                                        * DA89C

* ROMPTR 0B2 01A
* refs (1): D9A51
ROMP_0B2_01A:
        ::                                       * DA8A1
          NoExitAction                           * DA8A6
          {                                      * DA8AB
            NullMenuKey                          * DA8B0
            NullMenuKey                          * DA8B5
            NullMenuKey                          * DA8BA
            {                                    * DA8BF
              $       "-64"                      * DA8C4
              {                                  * DA8D4
                ROMPTR  0B2 01B                  * DA8D9
                DoBadKey                         * DA8E4
                ROMPTR  0B2 01C                  * DA8E9
              }                                  * DA8F4
            }                                    * DA8F9
            {                                    * DA8FE
              $       "+64"                      * DA903
              {                                  * DA913
                ROMPTR  0B2 01D                  * DA918
                DoBadKey                         * DA923
                ROMPTR  0B2 01E                  * DA928
              }                                  * DA933
            }                                    * DA938
            {                                    * DA93D
              $       "ECHO"                     * DA942
              ROMPTR  0B2 01F                    * DA954
            }                                    * DA95F
            NullMenuKey                          * DA964
            NullMenuKey                          * DA969
            NullMenuKey                          * DA96E
            NullMenuKey                          * DA973
            {                                    * DA978
              $       "(AN(L"                    * DA97D
              ROMPTR  0B0 059                    * DA991  DoKeyCancel
            }                                    * DA99C
            {                                    * DA9A1
              $       "OK"                       * DA9A6
              ROMPTR  0B0 05A                    * DA9B4  DoKeyOK
            }                                    * DA9BF
          }                                      * DA9C4
        ;                                        * DA9C9

* ROMPTR 0B2 01B
* refs (1): D9A51
ROMP_0B2_01B:
        ::                                       * DA9CE
          TakeOver                               * DA9D3
          LAM     '1C                            * DA9D8
          DUP#0=                                 * DA9E5
          IT                                     * DA9EA
          ::                                     * DA9EF
            DROP                                 * DA9F4
            REALOBOB                             * DA9F9
          ;                                      * DA9FE
          BINT64                                 * DAA03
          #-                                     * DAA08
          '                                      * DAA0D
          LAM     '1C                            * DAA12
          STOLAM                                 * DAA1F
          SetDA3NoCh                             * DAA24
        ;                                        * DAA29

* ROMPTR 0B2 01C
* refs (1): D9A51
ROMP_0B2_01C:
        ::                                       * DAA2E
          TakeOver                               * DAA33
          LAM     '1C                            * DAA38
          #0=case                                * DAA45
          SetDA123NoCh                           * DAA4A
          BINT0                                  * DAA4F
          '                                      * DAA54
          LAM     '1C                            * DAA59
          STOLAM                                 * DAA66
          SetDA3NoCh                             * DAA6B
        ;                                        * DAA70

* ROMPTR 0B2 01D
* refs (1): D9A51
ROMP_0B2_01D:
        ::                                       * DAA75
          TakeOver                               * DAA7A
          LAM     '1C                            * DAA7F
          BINT64                                 * DAA8C
          #+                                     * DAA91
          DUP                                    * DAA96
          REALOBOB                               * DAA9B
          #=                                     * DAAA0
          IT                                     * DAAA5
          DROPZERO                               * DAAAA
          '                                      * DAAAF
          LAM     '1C                            * DAAB4
          STOLAM                                 * DAAC1
          SetDA3NoCh                             * DAAC6
        ;                                        * DAACB

* ROMPTR 0B2 01E
* refs (1): D9A51
ROMP_0B2_01E:
        ::                                       * DAAD0
          TakeOver                               * DAAD5
          LAM     '1C                            * DAADA
          BINTC0h                                * DAAE7
          #=case                                 * DAAEC
          SetDA123NoCh                           * DAAF1
          BINTC0h                                * DAAF6
          '                                      * DAAFB
          LAM     '1C                            * DAB00
          STOLAM                                 * DAB0D
          SetDA3NoCh                             * DAB12
        ;                                        * DAB17

* ROMPTR 0B2 01F
* refs (1): D9A51
ROMP_0B2_01F:
        ::                                       * DAB1C
          TakeOver                               * DAB21
          SetDA123NoCh                           * DAB26
          LAM     'CF                            * DAB2B
          DUP                                    * DAB38
          ROMPTR  0B2 021                        * DAB3D
          LAM     'EC                            * DAB48
          OVER                                   * DAB55
          LAM     '1C                            * DAB5A
          #+                                     * DAB67
          DUP#0=                                 * DAB6C
          ITE                                    * DAB71
          ::                                     * DAB76
            2DROP                                * DAB7B
            #_102                                * DAB80
            ROMPTR  0B0 091                      * DAB85  DoAlert
          ;                                      * DAB90
          ::                                     * DAB95
            #>CHR                                * DAB9A
            >T$                                  * DAB9F
            '                                    * DABA4
            LAM     'EC                          * DABA9
            STOLAM                               * DABB6
          ;                                      * DABBB
          ROMPTR  0B2 020                        * DABC0
        ;                                        * DABCB

* ROMPTR 0B2 021
* refs (2): D9A51 D9A51
ROMP_0B2_021:
        ::                                       * DABD0
          DA2aBad?                               * DABD5
          caseDROP                               * DABDA
          BINT16                                 * DABDF
          #/                                     * DABE4
          SWAP                                   * DABE9
          BINT7                                  * DABEE
          #*                                     * DABF3
          BINT10                                 * DABF8
          #+                                     * DABFD
          #1-                                    * DAC02
          SWAP                                   * DAC07
          BINT10                                 * DAC0C
          #*                                     * DAC11
          BINT8                                  * DAC16
          #+                                     * DAC1B
          2DUP                                   * DAC20
          2DUP                                   * DAC25
          SWAP                                   * DAC2A
          BINT7                                  * DAC2F
          #+                                     * DAC34
          SWAP                                   * DAC39
          BINT10                                 * DAC3E
          #+                                     * DAC43
          HARDBUFF                               * DAC48
          5UNROLL                                * DAC4D
          SUBGROB                                * DAC52
          INVGROB                                * DAC57
          HARDBUFF                               * DAC5C
          4ROLL                                  * DAC61
          4ROLL                                  * DAC66
          GROB!                                  * DAC6B
        ;                                        * DAC70

* ROMPTR 0B2 022
* refs (1): D9A51
ROMP_0B2_022:
        GROB    "images/DAC75.png"               * DAC75  7 x 6

* ROMPTR 0B2 023
* refs (1): D9A51
ROMP_0B2_023:
        GROB    "images/DAC95.png"               * DAC95  7 x 6

* ROMPTR 0B2 024
* refs (1): D9A51
ROMP_0B2_024:
        GROB    "images/DACB5.png"               * DACB5  8 x 5

* ROMPTR 0B2 025
* refs (1): D9A51
ROMP_0B2_025:
        GROB    "images/DACD3.png"               * DACD3  7 x 5

* ROMPTR 0B2 026
* refs (1): D9A51
ROMP_0B2_026:
        GROB    "images/DACF1.png"               * DACF1  8 x 5

* ROMPTR 0B2 027
* refs (1): D9A51
ROMP_0B2_027:
        GROB    "images/DAD0F.png"               * DAD0F  6 x 5

* ROMPTR 0B2 028
* refs (1): D9A51
ROMP_0B2_028:
        GROB    "images/DAD2D.png"               * DAD2D  6 x 5

* ROMPTR 0B2 029
* refs (1): D9A51
ROMP_0B2_029:
        GROB    "images/DAD4B.png"               * DAD4B  6 x 5

* ROMPTR 0B2 02A
* refs (1): D9A51
ROMP_0B2_02A:
        GROB    "images/DAD69.png"               * DAD69  6 x 5

* ROMPTR 0B2 02B
* refs (1): D9A51
ROMP_0B2_02B:
        GROB    "images/DAD87.png"               * DAD87  112 x 40

* ROMPTR 0B2 02C
* refs (1): D9A51
ROMP_0B2_02C:
        GROB    "images/DB1FB.png"               * DB1FB  112 x 40

* ROMPTR 0B2 02D
* refs (1): D9A51
ROMP_0B2_02D:
        GROB    "images/DB66F.png"               * DB66F  112 x 40

* ROMPTR 0B2 02E
* refs (1): D9A51
ROMP_0B2_02E:
        GROB    "images/DBAE3.png"               * DBAE3  112 x 40

* ROMPTR 0B2 02F
* refs (1): D9A51
ROMP_0B2_02F:
        CON(5)  DOARRY                           * DBF57  array 256
        LENGTH                                   * DBF5C  length, to #DCA1E
        CON(5)  DOCSTR                           * DBF61  element type
        CON(5)  1                                * DBF66  dimensions
        CON(5)  256                              * DBF6B
        $BODY   ""                               * DBF70  1
        $BODY   ""                               * DBF75  2
        $BODY   ""                               * DBF7A  3
        $BODY   ""                               * DBF7F  4
        $BODY   ""                               * DBF84  5
        $BODY   ""                               * DBF89  6
        $BODY   ""                               * DBF8E  7
        $BODY   ""                               * DBF93  8
        $BODY   ""                               * DBF98  9
        $BODY   ""                               * DBF9D  10
        $BODY   "\02."                           * DBFA2  11
        $BODY   ""                               * DBFAB  12
        $BODY   ""                               * DBFB0  13
        $BODY   ""                               * DBFB5  14
        $BODY   ""                               * DBFBA  15
        $BODY   ""                               * DBFBF  16
        $BODY   ""                               * DBFC4  17
        $BODY   ""                               * DBFC9  18
        $BODY   ""                               * DBFCE  19
        $BODY   ""                               * DBFD3  20
        $BODY   ""                               * DBFD8  21
        $BODY   ""                               * DBFDD  22
        $BODY   ""                               * DBFE2  23
        $BODY   ""                               * DBFE7  24
        $BODY   ""                               * DBFEC  25
        $BODY   ""                               * DBFF1  26
        $BODY   ""                               * DBFF6  27
        $BODY   ""                               * DBFFB  28
        $BODY   ""                               * DC000  29
        $BODY   ""                               * DC005  30
        $BODY   ""                               * DC00A  31
        $BODY   ""                               * DC00F  32
        $BODY   "[SPC]"                          * DC014  33
        $BODY   "α\01[DEL]"                      * DC023  34
        $BODY   "α\02\08"                        * DC036  35
        $BODY   "\02\06"                         * DC041  36
        $BODY   "α\014"                          * DC04A  37
        $BODY   "α\02U"                          * DC055  38
        $BODY   "α\01[ENTER]"                    * DC060  39
        $BODY   "α\02'"                          * DC077  40
        $BODY   "\01\06"                         * DC082  41
        $BODY   "\01\06"                         * DC08B  42
        $BODY   "α\07"                           * DC094  43
        $BODY   "α\09"                           * DC09D  44
        $BODY   "\01. or ."                      * DC0A6  45
        $BODY   "α\08"                           * DC0B9  46
        $BODY   ". (FM.)"                        * DC0C2  47
        $BODY   "α\06"                           * DC0D5  48
        $BODY   "0"                              * DC0DE  49
        $BODY   "1"                              * DC0E5  50
        $BODY   "2"                              * DC0EC  51
        $BODY   "3"                              * DC0F3  52
        $BODY   "4"                              * DC0FA  53
        $BODY   "5"                              * DC101  54
        $BODY   "6"                              * DC108  55
        $BODY   "7"                              * DC10F  56
        $BODY   "8"                              * DC116  57
        $BODY   "9"                              * DC11D  58
        $BODY   "α\02\09"                        * DC124  59
        $BODY   "\01. (FM,)"                     * DC12F  60
        $BODY   "α\012"                          * DC144  61
        $BODY   "α\010"                          * DC14F  62
        $BODY   "α\022"                          * DC15A  63
        $BODY   "α\01\04"                        * DC165  64
        $BODY   "α\02[ENTER]"                    * DC170  65
        $BODY   "αA"                             * DC187  66
        $BODY   "αB"                             * DC190  67
        $BODY   "αC"                             * DC199  68
        $BODY   "αD"                             * DC1A2  69
        $BODY   "αE"                             * DC1AB  70
        $BODY   "αF"                             * DC1B4  71
        $BODY   "αG"                             * DC1BD  72
        $BODY   "αH"                             * DC1C6  73
        $BODY   "αI"                             * DC1CF  74
        $BODY   "αJ"                             * DC1D8  75
        $BODY   "αK"                             * DC1E1  76
        $BODY   "αL"                             * DC1EA  77
        $BODY   "αM"                             * DC1F3  78
        $BODY   "αN"                             * DC1FC  79
        $BODY   "αO"                             * DC205  80
        $BODY   "αP"                             * DC20E  81
        $BODY   "αQ"                             * DC217  82
        $BODY   "αR"                             * DC220  83
        $BODY   "αS"                             * DC229  84
        $BODY   "αT"                             * DC232  85
        $BODY   "αU"                             * DC23B  86
        $BODY   "αV"                             * DC244  87
        $BODY   "αW"                             * DC24D  88
        $BODY   "αX"                             * DC256  89
        $BODY   "αY"                             * DC25F  90
        $BODY   "αZ"                             * DC268  91
        $BODY   "\01\07"                         * DC271  92
        $BODY   ""                               * DC27A  93
        $BODY   "\01\07"                         * DC27F  94
        $BODY   "\05"                            * DC288  95
        $BODY   "\02\07"                         * DC28F  96
        $BODY   ""                               * DC298  97
        $BODY   "α\01A"                          * DC29D  98
        $BODY   "α\01B"                          * DC2A8  99
        $BODY   "α\01C"                          * DC2B3  100
        $BODY   "α\01D"                          * DC2BE  101
        $BODY   "α\01E"                          * DC2C9  102
        $BODY   "α\01F"                          * DC2D4  103
        $BODY   "α\01G"                          * DC2DF  104
        $BODY   "α\01H"                          * DC2EA  105
        $BODY   "α\01I"                          * DC2F5  106
        $BODY   "α\01J"                          * DC300  107
        $BODY   "α\01K"                          * DC30B  108
        $BODY   "α\01L"                          * DC316  109
        $BODY   "α\01M"                          * DC321  110
        $BODY   "α\01N"                          * DC32C  111
        $BODY   "α\01O"                          * DC337  112
        $BODY   "α\01P"                          * DC342  113
        $BODY   "α\01Q"                          * DC34D  114
        $BODY   "α\01R"                          * DC358  115
        $BODY   "α\01S"                          * DC363  116
        $BODY   "α\01T"                          * DC36E  117
        $BODY   "α\01U"                          * DC379  118
        $BODY   "α\01V"                          * DC384  119
        $BODY   "α\01W"                          * DC38F  120
        $BODY   "α\01X"                          * DC39A  121
        $BODY   "α\01Y"                          * DC3A5  122
        $BODY   "α\01Z"                          * DC3B0  123
        $BODY   "\01\09"                         * DC3BB  124
        $BODY   "α\02J"                          * DC3C4  125
        $BODY   "\01\09"                         * DC3CF  126
        $BODY   "α\02V"                          * DC3D8  127
        $BODY   ""                               * DC3E3  128
        $BODY   "\02[SPC]"                       * DC3E8  129
        $BODY   "α\02X"                          * DC3F9  130
        $BODY   ""                               * DC404  131
        $BODY   "\03"                            * DC409  132
        $BODY   "\02[COS]"                       * DC410  133
        $BODY   "\02[TAN]"                       * DC421  134
        $BODY   ""                               * DC432  135
        $BODY   "\01[SPC]"                       * DC437  136
        $BODY   "\02[SIN]"                       * DC448  137
        $BODY   "α\013"                          * DC459  138
        $BODY   "α\023"                          * DC464  139
        $BODY   "α\021"                          * DC46F  140
        $BODY   "α\02A"                          * DC47A  141
        $BODY   "\020"                           * DC485  142
        $BODY   "α\02P"                          * DC48E  143
        $BODY   "α\02Q"                          * DC499  144
        $BODY   "α\02K"                          * DC4A4  145
        $BODY   "α\02G"                          * DC4AF  146
        $BODY   "α\02D"                          * DC4BA  147
        $BODY   "α\02E"                          * DC4C5  148
        $BODY   "α\02H"                          * DC4D0  149
        $BODY   "α\02F"                          * DC4DB  150
        $BODY   "α\02L"                          * DC4E6  151
        $BODY   "α\02R"                          * DC4F1  152
        $BODY   "α\02S"                          * DC4FC  153
        $BODY   "α\02T"                          * DC507  154
        $BODY   "α\02W"                          * DC512  155
        $BODY   "α\02C"                          * DC51D  156
        $BODY   "α\02Z"                          * DC528  157
        $BODY   "α\02O"                          * DC533  158
        $BODY   ""                               * DC53E  159
        $BODY   "α\02I"                          * DC543  160
        $BODY   ""                               * DC54E  161
        $BODY   "α\02[DEL]"                      * DC553  162
        $BODY   "α\024"                          * DC566  163
        $BODY   "α\015"                          * DC571  164
        $BODY   "α\016"                          * DC57C  165
        $BODY   "α\025"                          * DC587  166
        $BODY   ""                               * DC592  167
        $BODY   ""                               * DC597  168
        $BODY   ""                               * DC59C  169
        $BODY   ""                               * DC5A1  170
        $BODY   ""                               * DC5A6  171
        $BODY   "α\01\08"                        * DC5AB  172
        $BODY   ""                               * DC5B6  173
        $BODY   ""                               * DC5BB  174
        $BODY   ""                               * DC5C0  175
        $BODY   ""                               * DC5C5  176
        $BODY   "α\026"                          * DC5CA  177
        $BODY   "α\02Y"                          * DC5D5  178
        $BODY   ""                               * DC5E0  179
        $BODY   ""                               * DC5E5  180
        $BODY   ""                               * DC5EA  181
        $BODY   "α\02N"                          * DC5EF  182
        $BODY   ""                               * DC5FA  183
        $BODY   ""                               * DC5FF  184
        $BODY   ""                               * DC604  185
        $BODY   ""                               * DC609  186
        $BODY   ""                               * DC60E  187
        $BODY   "α\01\08"                        * DC613  188
        $BODY   ""                               * DC61E  189
        $BODY   ""                               * DC623  190
        $BODY   ""                               * DC628  191
        $BODY   "α\02\04"                        * DC62D  192
        $BODY   "αAα\017"                        * DC638  193
        $BODY   "αAα\027"                        * DC647  194
        $BODY   "αAα\018"                        * DC656  195
        $BODY   "αAα\028"                        * DC665  196
        $BODY   "αAα\019"                        * DC674  197
        $BODY   "αAα\029"                        * DC683  198
        $BODY   "αEα\029"                        * DC692  199
        $BODY   "αCα\029"                        * DC6A1  200
        $BODY   "αEα\017"                        * DC6B0  201
        $BODY   "αEα\027"                        * DC6BF  202
        $BODY   "αEα\018"                        * DC6CE  203
        $BODY   "αEα\019"                        * DC6DD  204
        $BODY   "αIα\017"                        * DC6EC  205
        $BODY   "αIα\027"                        * DC6FB  206
        $BODY   "αIα\018"                        * DC70A  207
        $BODY   "αIα\019"                        * DC719  208
        $BODY   "αDα\029"                        * DC728  209
        $BODY   "αNα\028"                        * DC737  210
        $BODY   "αOα\017"                        * DC746  211
        $BODY   "αOα\027"                        * DC755  212
        $BODY   "αOα\018"                        * DC764  213
        $BODY   "αOα\028"                        * DC773  214
        $BODY   "αOα\019"                        * DC782  215
        $BODY   ""                               * DC791  216
        $BODY   "αOα\029"                        * DC796  217
        $BODY   "αUα\017"                        * DC7A5  218
        $BODY   "αUα\027"                        * DC7B4  219
        $BODY   "αUα\018"                        * DC7C3  220
        $BODY   "αUα\019"                        * DC7D2  221
        $BODY   "αYα\027"                        * DC7E1  222
        $BODY   "αPα\029"                        * DC7F0  223
        $BODY   "α\02B"                          * DC7FF  224
        $BODY   "α\01Aα\017"                     * DC80A  225
        $BODY   "α\01Aα\027"                     * DC81B  226
        $BODY   "α\01Aα\018"                     * DC82C  227
        $BODY   "α\01Aα\028"                     * DC83D  228
        $BODY   "α\01Aα\019"                     * DC84E  229
        $BODY   "α\01Aα\029"                     * DC85F  230
        $BODY   "α\01Eα\029"                     * DC870  231
        $BODY   "α\01Cα\029"                     * DC881  232
        $BODY   "α\01Eα\017"                     * DC892  233
        $BODY   "α\01Eα\027"                     * DC8A3  234
        $BODY   "α\01Eα\018"                     * DC8B4  235
        $BODY   "α\01Eα\019"                     * DC8C5  236
        $BODY   "α\01Iα\017"                     * DC8D6  237
        $BODY   "α\01Iα\027"                     * DC8E7  238
        $BODY   "α\01Iα\018"                     * DC8F8  239
        $BODY   "α\01Iα\019"                     * DC909  240
        $BODY   "α\01Dα\029"                     * DC91A  241
        $BODY   "α\01Nα\028"                     * DC92B  242
        $BODY   "α\01Oα\017"                     * DC93C  243
        $BODY   "α\01Oα\027"                     * DC94D  244
        $BODY   "α\01Oα\018"                     * DC95E  245
        $BODY   "α\01Oα\028"                     * DC96F  246
        $BODY   "α\01Oα\019"                     * DC980  247
        $BODY   ""                               * DC991  248
        $BODY   "α\01Oα\029"                     * DC996  249
        $BODY   "α\01Uα\017"                     * DC9A7  250
        $BODY   "α\01Uα\027"                     * DC9B8  251
        $BODY   "α\01Uα\018"                     * DC9C9  252
        $BODY   "α\01Uα\019"                     * DC9DA  253
        $BODY   "α\01Yα\027"                     * DC9EB  254
        $BODY   "α\01Pα\029"                     * DC9FC  255
        $BODY   "α\01Yα\019"                     * DCA0D  256
        ENDLENGTH                                * DCA1E

LIB0B2.hash:
        CON(5)  DOHSTR                           * DCA1E  hash table of library 0B2
        LENGTH                                   * DCA23  length, to #DCA82
        CON(5)  0                                * DCA28  names of length 1
        CON(5)  0                                * DCA2D  names of length 2
        CON(5)  0                                * DCA32  names of length 3
        CON(5)  0                                * DCA37  names of length 4
        CON(5)  0                                * DCA3C  names of length 5
        CON(5)  0                                * DCA41  names of length 6
        CON(5)  0                                * DCA46  names of length 7
        CON(5)  0                                * DCA4B  names of length 8
        CON(5)  0                                * DCA50  names of length 9
        CON(5)  0                                * DCA55  names of length 10
        CON(5)  0                                * DCA5A  names of length 11
        CON(5)  0                                * DCA5F  names of length 12
        CON(5)  0                                * DCA64  names of length 13
        CON(5)  0                                * DCA69  names of length 14
        CON(5)  0                                * DCA6E  names of length 15
        CON(5)  0                                * DCA73  names of length 16
        REL(5)  L_DCA7D                          * DCA78  end of the names
L_DCA7D:
        CON(5)  0                                * DCA7D  command 000 has no name
