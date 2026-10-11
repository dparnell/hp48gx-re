* HP 48GX ROM revision R, #99FE9-#9CFFC: Library part 0E3
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #99FE9 in the original ROM).
        ENDLENGTH                                * 99FE9

        CON(5)  DOLIB                            * 99FE9  library object
        LENGTH                                   * 99FEE  length, to #9DA13
        CON(2)  0                                * 99FF3  title length

LIB0E3:
        CON(3)  #0E3                             * 99FF5  library number
        REL(5)  LIB0E3.hash                      * 99FF8  hash table
        REL(5)  ROMP_0E3_06D                     * 99FFD  message table
        REL(5)  LIB0E3.link                      * 9A002  link table
        CON(5)  0                                * 9A007  config
        RPL

* ROMPTR 0E3 000
* refs (1): 99FF5
ROMP_0E3_000:
        ::                                       * 9A00C
          '                                      * 9A011
          LAM     'EL1                           * 9A016
          STO                                    * 9A025
        ;                                        * 9A02A

* ROMPTR 0E3 001
* refs (1): 99FF5
ROMP_0E3_001:
        ::                                       * 9A02F
          '                                      * 9A034
          LAM     'EL2                           * 9A039
          STO                                    * 9A048
        ;                                        * 9A04D

* ROMPTR 0E3 002
* refs (1): 99FF5
ROMP_0E3_002:
        ::                                       * 9A052
          '                                      * 9A057
          LAM     'EL3                           * 9A05C
          STO                                    * 9A06B
        ;                                        * 9A070

* ROMPTR 0E3 003
* refs (1): 99FF5
ROMP_0E3_003:
        ::                                       * 9A075
          '                                      * 9A07A
          LAM     'EL4                           * 9A07F
          STO                                    * 9A08E
        ;                                        * 9A093

* ROMPTR 0E3 004
* refs (1): 99FF5
ROMP_0E3_004:
        ::                                       * 9A098
          '                                      * 9A09D
          LAM     'EL5                           * 9A0A2
          STO                                    * 9A0B1
        ;                                        * 9A0B6

* ROMPTR 0E3 005
* refs (1): 99FF5
ROMP_0E3_005:
        ::                                       * 9A0BB
          '                                      * 9A0C0
          LAM     'EL6                           * 9A0C5
          STO                                    * 9A0D4
        ;                                        * 9A0D9

* ROMPTR 0E3 006
* refs (1): 99FF5
ROMP_0E3_006:
        ::                                       * 9A0DE
          '                                      * 9A0E3
          LAM     'EL7                           * 9A0E8
          STO                                    * 9A0F7
        ;                                        * 9A0FC

* ROMPTR 0E3 007
* refs (1): 99FF5
ROMP_0E3_007:
        ::                                       * 9A101
          '                                      * 9A106
          LAM     'EL8                           * 9A10B
          STO                                    * 9A11A
        ;                                        * 9A11F

* ROMPTR 0E3 008
* refs (1): 99FF5
ROMP_0E3_008:
        ::                                       * 9A124
          '                                      * 9A129
          LAM     'EL9                           * 9A12E
          STO                                    * 9A13D
        ;                                        * 9A142

* ROMPTR 0E3 009
* refs (1): 99FF5
ROMP_0E3_009:
        ::                                       * 9A147
          '                                      * 9A14C
          LAM     'EL10                          * 9A151
          STO                                    * 9A162
        ;                                        * 9A167

* ROMPTR 0E3 00A
* refs (1): 99FF5
ROMP_0E3_00A:
        ::                                       * 9A16C
          '                                      * 9A171
          LAM     'EL11                          * 9A176
          STO                                    * 9A187
        ;                                        * 9A18C

* ROMPTR 0E3 00B
* refs (1): 99FF5
ROMP_0E3_00B:
        ::                                       * 9A191
          '                                      * 9A196
          LAM     'EL12                          * 9A19B
          STO                                    * 9A1AC
        ;                                        * 9A1B1

* ROMPTR 0E3 00C
* refs (1): 99FF5
ROMP_0E3_00C:
        ::                                       * 9A1B6
          RECLAIMDISP                            * 9A1BB
          POLSaveUI                              * 9A1C0
          ERRSET                                 * 9A1C5
          ::                                     * 9A1CA
            FALSE                                * 9A1CF
            ZEROZERO                             * 9A1D4
            BINT0                                * 9A1D9
            ONEONE                               * 9A1DE
            ONEONE                               * 9A1E3
            ONEONE                               * 9A1E8
            ZEROZERO                             * 9A1ED
            {                                    * 9A1F2

* ROMPTR 0E3 00D
* refs (1): 99FF5
ROMP_0E3_00D:
              LAM     'EL1                       * 9A1F7

* ROMPTR 0E3 00E
* refs (1): 99FF5
ROMP_0E3_00E:
              LAM     'EL2                       * 9A206

* ROMPTR 0E3 00F
* refs (1): 99FF5
ROMP_0E3_00F:
              LAM     'EL3                       * 9A215

* ROMPTR 0E3 010
* refs (1): 99FF5
ROMP_0E3_010:
              LAM     'EL4                       * 9A224

* ROMPTR 0E3 011
* refs (1): 99FF5
ROMP_0E3_011:
              LAM     'EL5                       * 9A233

* ROMPTR 0E3 012
* refs (1): 99FF5
ROMP_0E3_012:
              LAM     'EL6                       * 9A242

* ROMPTR 0E3 013
* refs (1): 99FF5
ROMP_0E3_013:
              LAM     'EL7                       * 9A251

* ROMPTR 0E3 014
* refs (1): 99FF5
ROMP_0E3_014:
              LAM     'EL8                       * 9A260

* ROMPTR 0E3 015
* refs (1): 99FF5
ROMP_0E3_015:
              LAM     'EL9                       * 9A26F

* ROMPTR 0E3 016
* refs (1): 99FF5
ROMP_0E3_016:
              LAM     'EL10                      * 9A27E

* ROMPTR 0E3 017
* refs (1): 99FF5
ROMP_0E3_017:
              LAM     'EL11                      * 9A28F

* ROMPTR 0E3 018
* refs (1): 99FF5
ROMP_0E3_018:
              LAM     'EL12                      * 9A2A0
            }                                    * 9A2B1
            BIND                                 * 9A2B6
            ClrDA1IsStat                         * 9A2BB
            '                                    * 9A2C0
            ROMPTR  0E3 019                      * 9A2C5
            BEGIN                                * 9A2D0
            ROMPTR  0E3 00D                      * 9A2D5
            NOT                                  * 9A2E0
            WHILE                                * 9A2E5
            ::                                   * 9A2EA
              EVAL                               * 9A2EF
            ;                                    * 9A2F4
            REPEAT                               * 9A2F9
            ABND                                 * 9A2FE
            ClrDAsOK                             * 9A303
          ;                                      * 9A308
          ERRTRAP                                * 9A30D
          POLResUI&Err                           * 9A312
          POLRestoreUI                           * 9A317
          COLA_EVAL                              * 9A31C
        ;                                        * 9A321

* ROMPTR 0E3 019
* refs (1): 99FF5
ROMP_0E3_019:
        ::                                       * 9A326
          ROMPTR  0E3 01D                        * 9A32B
          ROMPTR  0E3 01E                        * 9A336
          ROMPTR  0E3 014                        * 9A341
          ROMPTR  0E3 013                        * 9A34C
          ROMPTR  0E2 000                        * 9A357
          '                                      * 9A362
          ROMPTR  0E2 003                        * 9A367
          rGETATELN                              * 9A372
          DROP                                   * 9A377
          TOTEMPOB                               * 9A37C
          ROMPTR  0E2 003                        * 9A381
          ROMPTR  0E2 001                        * 9A38C
          TWO{}N                                 * 9A397
          ROMPTR  0E3 049                        * 9A39C
        ;                                        * 9A3A7

* ROMPTR 0E3 01A
* refs (1): 99FF5
ROMP_0E3_01A:
        ::                                       * 9A3AC
          BINT0                                  * 9A3B1
          #=casedrop                             * 9A3B6
          ::                                     * 9A3BB
            BINT2                                * 9A3C0
            NTHCOMPDROP                          * 9A3C5
          ;                                      * 9A3CA
          SWAP                                   * 9A3CF
          CARCOMP                                * 9A3D4
          GETATELN                               * 9A3D9
          DROP                                   * 9A3DE
        ;                                        * 9A3E3

* ROMPTR 0E3 01B
* refs (1): 99FF5
ROMP_0E3_01B:
        ::                                       * 9A3E8
          DUP#0=ITE                              * 9A3ED
          ::                                     * 9A3F2
            DROP                                 * 9A3F7
            BINT4                                * 9A3FC
            NTHCOMPDROP                          * 9A401
          ;                                      * 9A406
          ::                                     * 9A40B
            MenuRow@                             * 9A410
            BINT1                                * 9A415
            #=                                   * 9A41A
            case                                 * 9A41F
            ::                                   * 9A424
              SWAP                               * 9A429
              INCOMPDROP                         * 9A42E
              DROP                               * 9A433
              DROP                               * 9A438
              4ROLLSWAP                          * 9A43D
              OVER                               * 9A442
              #1-+                               * 9A447
              SWAPROT                            * 9A44C
              ROMPTR  0E3 01C                    * 9A451
              ID>$                               * 9A45C
              $       ":\0A"                     * 9A461
              &$                                 * 9A46F
              SWAPROT                            * 9A474
              GETATELN                           * 9A479
              DROP                               * 9A47E
              &$                                 * 9A483
            ;                                    * 9A488
            BINT61                               * 9A48D
            UserITE                              * 9A492
            ::                                   * 9A497
              SWAP                               * 9A49C
              BINT2                              * 9A4A1
              NTHCOMPDROP                        * 9A4A6
              ROMPTR  0E3 01C                    * 9A4AB
              ID>$                               * 9A4B6
              $       ": -"                      * 9A4BB
              &$                                 * 9A4CB
            ;                                    * 9A4D0
            ::                                   * 9A4D5
              SWAP                               * 9A4DA
              INCOMPDROP                         * 9A4DF
              ROTROT2DROP                        * 9A4E4
              ROTDROP                            * 9A4E9
              3PICK                              * 9A4EE
              SUB$1#                             * 9A4F3
              BINT60                             * 9A4F8
              UserITE                            * 9A4FD
              ::                                 * 9A502
                ROMPTR  0E2 013                  * 9A507
                OVER                             * 9A512
                NTHCOMPDROP                      * 9A517
                TYPECHAR?                        * 9A51C
                ITE                              * 9A521
                ROMPTR  0E2 014                  * 9A526
                ROMPTR  0E2 013                  * 9A531
              ;                                  * 9A53C
              ROMPTR  0E2 014                    * 9A541
              SWAP                               * 9A54C
              NTHCOMPDROP                        * 9A551
              EDITDECOMP$                        * 9A556
              DUP                                * 9A55B
              $       "1"                        * 9A560
              EQUAL                              * 9A56C
              ITE                                * 9A571
              ::                                 * 9A576
                DROP                             * 9A57B
                $       "-"                      * 9A580
              ;                                  * 9A58C
              ::                                 * 9A591
                BINT4                            * 9A596
                OVERLEN$                         * 9A59B
                #1-                              * 9A5A0
                SUB$                             * 9A5A5
              ;                                  * 9A5AA
              3UNROLL                            * 9A5AF
              ROMPTR  0E3 01C                    * 9A5B4
              ID>$                               * 9A5BF
              $       ":\0A"                     * 9A5C4
              &$                                 * 9A5D2
              SWAP&$                             * 9A5D7
            ;                                    * 9A5DC
          ;                                      * 9A5E1
        ;                                        * 9A5E6

* ROMPTR 0E3 01C
* refs (1): 99FF5
ROMP_0E3_01C:
        ::                                       * 9A5EB
          CODE                                   * 9A5F0  70 nibbles
            C=DAT1  A                            * 9A5FA
            D1=D1+  5                            * 9A5FD
            D=D+1   A                            * 9A600
            RSTK=C                               * 9A602
            GOSBVL  POP#                         * 9A604
            GOSBVL  SAVPTR                       * 9A60B
            A=A-1   A                            * 9A612
            C=RSTK                               * 9A614
            D1=C                                 * 9A616
            D1=D1+  8                            * 9A619
            LC(5)   #000EE                       * 9A61C
            D=C     B                            * 9A623
L_9A626:
            D1=D1+  2                            * 9A626
            C=DAT1  B                            * 9A629
            ?D=C    B                            * 9A62C
            GOYES   L_9A626                      * 9A62F
            A=A-1   A                            * 9A631
            GONC    L_9A626                      * 9A633
            R0=C                                 * 9A636
            GOVLNG  PUSH#LOOP                    * 9A639
          ENDCODE                                * 9A640
          '                                      * 9A640
          ROMPTR  0E2 029                        * 9A645
          rGETATELN                              * 9A650
          DROP                                   * 9A655
          TOTEMPOB                               * 9A65A
        ;                                        * 9A65F

* ROMPTR 0E3 01D
* refs (1): 99FF5
ROMP_0E3_01D:
        {                                        * 9A664
          {                                      * 9A669
            ::                                   * 9A66E
              TakeOver                           * 9A673
              $       "SI"                       * 9A678
              BINT60                             * 9A686
              TestUserFlag                       * 9A68B
              NOT                                * 9A690
              Box/StdLabel                       * 9A695
            ;                                    * 9A69A
            ::                                   * 9A69F
              TakeOver                           * 9A6A4
              BINT60                             * 9A6A9
              ClrUserFlag                        * 9A6AE
              DispMenu                           * 9A6B3
            ;                                    * 9A6B8
          }                                      * 9A6BD
          {                                      * 9A6C2
            ::                                   * 9A6C7
              TakeOver                           * 9A6CC
              $       "ENGL"                     * 9A6D1
              BINT60                             * 9A6E3
              TestUserFlag                       * 9A6E8
              Box/StdLabel                       * 9A6ED
            ;                                    * 9A6F2
            ::                                   * 9A6F7
              TakeOver                           * 9A6FC
              BINT60                             * 9A701
              SetUserFlag                        * 9A706
              DispMenu                           * 9A70B
            ;                                    * 9A710
          }                                      * 9A715
          {                                      * 9A71A
            ::                                   * 9A71F
              TakeOver                           * 9A724
              $       "UNITS"                    * 9A729
              BINT61                             * 9A73D
              TestUserFlag                       * 9A742
              NOT                                * 9A747
              Box/StdLabel                       * 9A74C
            ;                                    * 9A751
            ::                                   * 9A756
              TakeOver                           * 9A75B
              BINT61                             * 9A760
              DUP                                * 9A765
              UserITE                            * 9A76A
              ClrUserFlag                        * 9A76F
              SetUserFlag                        * 9A774
              DispMenu                           * 9A779
            ;                                    * 9A77E
          }                                      * 9A783
          NullMenuKey                            * 9A788
          NullMenuKey                            * 9A78D
          {                                      * 9A792
            $       "QUIT"                       * 9A797
            ::                                   * 9A7A9
              TakeOver                           * 9A7AE
              ROMPTR  0E3 01F                    * 9A7B3
            ;                                    * 9A7BE
          }                                      * 9A7C3
        }                                        * 9A7C8

* ROMPTR 0E3 01E
* refs (1): 99FF5
ROMP_0E3_01E:
        {                                        * 9A7CD
          ROMPTR  0E3 020                        * 9A7D2
          ROMPTR  0E3 01F                        * 9A7DD
        }                                        * 9A7E8

* ROMPTR 0E3 01F
* refs (1): 99FF5
ROMP_0E3_01F:
        ::                                       * 9A7ED
          ROMPTR  0E0 013                        * 9A7F2  BRdone
          ROMPTR  0E3 048                        * 9A7FD
          'NOP                                   * 9A808
        ;                                        * 9A80D

* ROMPTR 0E3 020
* refs (1): 99FF5
ROMP_0E3_020:
        ::                                       * 9A812
          ROMPTR  0E3 047                        * 9A817
          '                                      * 9A822
          ROMPTR  0E3 021                        * 9A827
        ;                                        * 9A832

* ROMPTR 0E3 021
* refs (1): 99FF5
ROMP_0E3_021:
        ::                                       * 9A837
          SWAP                                   * 9A83C
          ROMPTR  0E3 007                        * 9A841
          DUP                                    * 9A84C
          ROMPTR  0E3 006                        * 9A851
          ROMPTR  0E3 022                        * 9A85C
          ROMPTR  0E3 023                        * 9A867
          ONEONE                                 * 9A872
          5ROLL                                  * 9A877
          DUP                                    * 9A87C
          '                                      * 9A881
          ROMPTR  0E2 003                        * 9A886
          rGETATELN                              * 9A891
          DROP                                   * 9A896
          TOTEMPOB                               * 9A89B
          DUP                                    * 9A8A0
          ROMPTR  0E3 001                        * 9A8A5
          ROMPTR  0E2 015                        * 9A8B0
          ROT                                    * 9A8BB
          NTHCOMPDROP                            * 9A8C0
          EVAL                                   * 9A8C5
          DUP                                    * 9A8CA
          ROMPTR  0E3 002                        * 9A8CF
          DUPTWO                                 * 9A8DA
          NTHCOMPDROP                            * 9A8DF
          SWAP                                   * 9A8E4
          CARCOMP                                * 9A8E9
          EVAL                                   * 9A8EE
          SWAP                                   * 9A8F3
          TWO{}N                                 * 9A8F8
          ROMPTR  0E3 049                        * 9A8FD
        ;                                        * 9A908

* ROMPTR 0E3 022
* refs (1): 99FF5
ROMP_0E3_022:
        {                                        * 9A90D
          {                                      * 9A912
            $       "SOLV"                       * 9A917
            ::                                   * 9A929
              TakeOver                           * 9A92E
              ROMPTR  0E3 047                    * 9A933
              '                                  * 9A93E
              ROMPTR  0E3 026                    * 9A943
            ;                                    * 9A94E
          }                                      * 9A953
          {                                      * 9A958
            $       "EQN"                        * 9A95D
            ::                                   * 9A96D
              TakeOver                           * 9A972
              ROMPTR  0E3 047                    * 9A977
              '                                  * 9A982
              ROMPTR  0E3 02A                    * 9A987
            ;                                    * 9A992
          }                                      * 9A997
          {                                      * 9A99C
            $       "VARS"                       * 9A9A1
            ::                                   * 9A9B3
              TakeOver                           * 9A9B8
              ROMPTR  0E3 047                    * 9A9BD
              '                                  * 9A9C8
              ROMPTR  0E3 02C                    * 9A9CD
            ;                                    * 9A9D8
          }                                      * 9A9DD
          {                                      * 9A9E2
            $       "PIC"                        * 9A9E7
            ::                                   * 9A9F7
              TakeOver                           * 9A9FC
              ROMPTR  0E3 047                    * 9AA01
              '                                  * 9AA0C
              ROMPTR  0E3 02D                    * 9AA11
            ;                                    * 9AA1C
          }                                      * 9AA21
          {                                      * 9AA26
            $       "→STK"                       * 9AA2B
            ::                                   * 9AA3D
              TakeOver                           * 9AA42
              ROMPTR  0E3 025                    * 9AA47
            ;                                    * 9AA52
          }                                      * 9AA57
          {                                      * 9AA5C
            $       "EXIT"                       * 9AA61
            ::                                   * 9AA73
              TakeOver                           * 9AA78
              ROMPTR  0E0 013                    * 9AA7D  BRdone
              '                                  * 9AA88
              ROMPTR  0E3 019                    * 9AA8D
            ;                                    * 9AA98
          }                                      * 9AA9D
        }                                        * 9AAA2

* ROMPTR 0E3 023
* refs (1): 99FF5
ROMP_0E3_023:
        {                                        * 9AAA7
          ROMPTR  0E3 024                        * 9AAAC
          ROMPTR  0E3 01F                        * 9AAB7
        }                                        * 9AAC2

* ROMPTR 0E3 024
* refs (1): 99FF5
ROMP_0E3_024:
        ::                                       * 9AAC7
          ROMPTR  0E3 047                        * 9AACC
          '                                      * 9AAD7
          ROMPTR  0E3 029                        * 9AADC
        ;                                        * 9AAE7

* ROMPTR 0E3 025
* refs (1): 99FF5
ROMP_0E3_025:
        ::                                       * 9AAEC
          ROMPTR  0E0 017                        * 9AAF1  ~BRRclCurRow
          ROMPTR  0E3 00F                        * 9AAFC
          BINT3                                  * 9AB07
          NTHCOMPDROP                            * 9AB0C
          SWAP                                   * 9AB11
          NTHCOMDDUP                             * 9AB16
          CARCOMP                                * 9AB1B
          CARCOMP                                * 9AB20
          SWAP                                   * 9AB25
          ROMPTR  0E3 027                        * 9AB2A
          SWAP                                   * 9AB35
          #>1                                    * 9AB3A
          IT                                     * 9AB3F
          ::                                     * 9AB44
            DUPLENCOMP                           * 9AB49
            #1-1SWAP                             * 9AB4E
            SUBCOMP                              * 9AB53
          ;                                      * 9AB58
          AtUserStack                            * 9AB5D
        ;                                        * 9AB62

* ROMPTR 0E3 026
* refs (1): 99FF5
ROMP_0E3_026:
        ::                                       * 9AB67
          SWAPDROP                               * 9AB6C
          ROMPTR  0E3 00F                        * 9AB71
          DUP                                    * 9AB7C
          CARCOMP                                * 9AB81
          EVAL                                   * 9AB86
          3PICKSWAP                              * 9AB8B
          GETATELN                               * 9AB90
          DROP                                   * 9AB95
          3UNROLL                                * 9AB9A
          BINT3                                  * 9AB9F
          NTHCOMPDROP                            * 9ABA4
          SWAP                                   * 9ABA9
          NTHCOMPDROP                            * 9ABAE
          ROMPTR  0E3 048                        * 9ABB3
          ROMPTR  0E3 045                        * 9ABBE
        ;                                        * 9ABC9

* ROMPTR 0E3 027
* refs (1): 99FF5
ROMP_0E3_027:
        ::                                       * 9ABCE
          DUPTWO                                 * 9ABD3
          NTHCOMPDROP                            * 9ABD8
          EVAL                                   * 9ABDD
          CARCOMP                                * 9ABE2
          DUPLEN$                                * 9ABE7
          DUP                                    * 9ABEC
          #1+_ONE_DO                             * 9ABF1
          OVER                                   * 9ABF6
          INDEX@                                 * 9ABFB
          SUB$1#                                 * 9AC00
          '                                      * 9AC05
          ROMPTR  0E2 029                        * 9AC0A
          rGETATELN                              * 9AC15
          DROP                                   * 9AC1A
          TOTEMPOB                               * 9AC1F
          DUP                                    * 9AC24
          ID      z                              * 9AC29
          EQUAL                                  * 9AC32
          IT                                     * 9AC37
          ::                                     * 9AC3C
            DROP                                 * 9AC41
            NULL$                                * 9AC46
          ;                                      * 9AC4B
          3UNROLL                                * 9AC50
          LOOP                                   * 9AC55
          SWAPDROP                               * 9AC5A
          {}N                                    * 9AC5F
          SWAP                                   * 9AC64
          CARCOMP                                * 9AC69
          DUP                                    * 9AC6E
          CARCOMP                                * 9AC73
          DUPTWO                                 * 9AC78
          #<ITE                                  * 9AC7D
          ::                                     * 9AC82
            #2+                                  * 9AC87
            NTHCOMPDROP                          * 9AC8C
            ROMPTR  0E3 028                      * 9AC91
            SWAP                                 * 9AC9C
            TWO{}N                               * 9ACA1
          ;                                      * 9ACA6
          ::                                     * 9ACAB
            BINT2                                * 9ACB0
            #=ITE                                * 9ACB5
            ::                                   * 9ACBA
              BINT3                              * 9ACBF
              NTHCOMPDROP                        * 9ACC4
              NULL{}                             * 9ACC9
              SWAP                               * 9ACCE
            ;                                    * 9ACD3
            ::                                   * 9ACD8
              INNERCOMP                          * 9ACDD
              DROP                               * 9ACE2
              ROTDROP                            * 9ACE7
              ROTDROP                            * 9ACEC
            ;                                    * 9ACF1
            ZEROSWAP                             * 9ACF6
            INNERDUP                             * 9ACFB
            ZERO_DO                              * 9AD00
            #1-SWAP                              * 9AD05
            DUPTYPECHAR?                         * 9AD0A
            IT                                   * 9AD0F
            ::                                   * 9AD14
              DROP                               * 9AD19
              DUP                                * 9AD1E
              #2+PICK                            * 9AD23
              OVER                               * 9AD28
              #+                                 * 9AD2D
              #3+PICK                            * 9AD32
              OVER                               * 9AD37
              #1+                                * 9AD3C
              NTHCOMPDROP                        * 9AD41
            ;                                    * 9AD46
            ROMPTR  0E3 028                      * 9AD4B
            psh1&                                * 9AD56
            LOOP                                 * 9AD5B
            DROP                                 * 9AD60
            DUP#2+                               * 9AD65
            ROLLDROP                             * 9AD6A
            #1+                                  * 9AD6F
            DUP#1+                               * 9AD74
            ROLLSWAP                             * 9AD79
            {}N                                  * 9AD7E
          ;                                      * 9AD83
        ;                                        * 9AD88

* ROMPTR 0E3 028
* refs (1): 99FF5
ROMP_0E3_028:
        ::                                       * 9AD8D
          ROMPTR  0E3 04B                        * 9AD92
          palparse                               * 9AD9D
          ?SEMI                                  * 9ADA2
          3DROP                                  * 9ADA7
          ERROR@                                 * 9ADAC
          BINT1                                  * 9ADB1
          #=                                     * 9ADB6
          caseERRJMP                             * 9ADBB
          SYMBOL                                 * 9ADC0
            ID      Keyword                      * 9ADC5
            ID      Conflict                     * 9ADDA
            x-                                   * 9ADF1
          ;                                      * 9ADF6
          #       E303                           * 9ADFB  58115
          JstGetTHEMESG                          * 9AE05
          DISPROW1                               * 9AE0A
          NULL$                                  * 9AE0F
          DISPROW2                               * 9AE14
          ERRBEEP                                * 9AE19
        ;                                        * 9AE1E

* ROMPTR 0E3 029
* refs (1): 99FF5
ROMP_0E3_029:
        ::                                       * 9AE23
          ROMPTR  0E3 02B                        * 9AE28
          ROMPTR  0E3 02F                        * 9AE33
          ROMPTR  0E3 033                        * 9AE3E
          ROT                                    * 9AE49
          ROMPTR  0E3 052                        * 9AE4E
        ;                                        * 9AE59

* ROMPTR 0E3 02A
* refs (1): 99FF5
ROMP_0E3_02A:
        ::                                       * 9AE5E
          ROMPTR  0E3 02B                        * 9AE63
          ROMPTR  0E3 02E                        * 9AE6E
          ROMPTR  0E3 034                        * 9AE79
          ROT                                    * 9AE84
          ROMPTR  0E3 051                        * 9AE89
        ;                                        * 9AE94

* ROMPTR 0E3 02B
* refs (1): 99FF5
ROMP_0E3_02B:
        ::                                       * 9AE99
          ONEONE                                 * 9AE9E
          ROMPTR  0E3 009                        * 9AEA3
          ROMPTR  0E3 008                        * 9AEAE
          SWAP                                   * 9AEB9
          ROMPTR  0E3 005                        * 9AEBE
          DUP                                    * 9AEC9
          ROMPTR  0E3 004                        * 9AECE
          ROMPTR  0E3 00F                        * 9AED9
          BINT3                                  * 9AEE4
          NTHCOMPDROP                            * 9AEE9
          SWAP                                   * 9AEEE
          NTHCOMDDUP                             * 9AEF3
          ROMPTR  0E3 003                        * 9AEF8
          DUP                                    * 9AF03
          CARCOMP                                * 9AF08
          CARCOMP                                * 9AF0D
          ROMPTR  0E3 00B                        * 9AF12
          BINT1                                  * 9AF1D
          ROMPTR  0E3 00A                        * 9AF22
          CARCOMP                                * 9AF2D
        ;                                        * 9AF32

* ROMPTR 0E3 02C
* refs (1): 99FF5
ROMP_0E3_02C:
        ::                                       * 9AF37
          SWAP                                   * 9AF3C
          ROMPTR  0E3 005                        * 9AF41
          DUP                                    * 9AF4C
          ROMPTR  0E3 004                        * 9AF51
          ROMPTR  0E3 00F                        * 9AF5C
          DUP                                    * 9AF67
          CARCOMP                                * 9AF6C
          DUP4UNROLL                             * 9AF71
          3PICKSWAP                              * 9AF76
          EVAL                                   * 9AF7B
          GETATELN                               * 9AF80
          DROP                                   * 9AF85
          SWAP                                   * 9AF8A
          BINT3                                  * 9AF8F
          NTHCOMPDROP                            * 9AF94
          ROT                                    * 9AF99
          NTHCOMDDUP                             * 9AF9E
          ROMPTR  0E3 003                        * 9AFA3
          DUP                                    * 9AFAE
          CARCOMP                                * 9AFB3
          CARCOMP                                * 9AFB8
          ROMPTR  0E3 00B                        * 9AFBD
          BINT1                                  * 9AFC8
          ROMPTR  0E3 00A                        * 9AFCD
          BINT2                                  * 9AFD8
          NTHCOMPDROP                            * 9AFDD
          EVAL                                   * 9AFE2
          BINT1                                  * 9AFE7
          3UNROLL                                * 9AFEC
          BINT1                                  * 9AFF1
          4UNROLL                                * 9AFF6
          ROMPTR  0E3 035                        * 9AFFB
          5UNROLL                                * 9B006
          ROMPTR  0E3 036                        * 9B00B
          5UNROLL                                * 9B016
          7ROLL                                  * 9B01B
          EVAL                                   * 9B020
          SWAP                                   * 9B025
          INCOMPDROP                             * 9B02A
          BINT5                                  * 9B02F
          {}N                                    * 9B034
          ROMPTR  0E3 04A                        * 9B039
        ;                                        * 9B044

* ROMPTR 0E3 02D
* refs (1): 99FF5
ROMP_0E3_02D:
        ::                                       * 9B049
          ONEONE                                 * 9B04E
          ROMPTR  0E3 009                        * 9B053
          ROMPTR  0E3 008                        * 9B05E
          SWAP                                   * 9B069
          ROMPTR  0E3 005                        * 9B06E
          DUP                                    * 9B079
          ROMPTR  0E3 004                        * 9B07E
          ROMPTR  0E3 00F                        * 9B089
          BINT3                                  * 9B094
          NTHCOMPDROP                            * 9B099
          SWAP                                   * 9B09E
          NTHCOMDDUP                             * 9B0A3
          ROMPTR  0E3 003                        * 9B0A8
          DUP                                    * 9B0B3
          CARCOMP                                * 9B0B8
          CARCOMP                                * 9B0BD
          ROMPTR  0E3 00B                        * 9B0C2
          BINT1                                  * 9B0CD
          ROMPTR  0E3 00A                        * 9B0D2
          BINT3                                  * 9B0DD
          NTHCOMPDROP                            * 9B0E2
          EVAL                                   * 9B0E7
          ROMPTR  0E3 03A                        * 9B0EC
          ROMPTR  0E3 03B                        * 9B0F7
          ROT                                    * 9B102
          ROMPTR  0E3 060                        * 9B107
        ;                                        * 9B112

* ROMPTR 0E3 02E
* refs (1): 99FF5
ROMP_0E3_02E:
        ::                                       * 9B117
          ROMPTR  0E3 018                        * 9B11C
          BINT2                                  * 9B127
          #<ITE                                  * 9B12C
          {                                      * 9B131
            {                                    * 9B136
              $       "SOLV"                     * 9B13B
              ::                                 * 9B14D
                TakeOver                         * 9B152
                ROMPTR  0E3 055                  * 9B157
                '                                * 9B162
                ROMPTR  0E3 03D                  * 9B167
              ;                                  * 9B172
            }                                    * 9B177
            {                                    * 9B17C
              $       "EQN"                      * 9B181
              ::                                 * 9B191
                TakeOver                         * 9B196
                ROMPTR  0E3 055                  * 9B19B
                '                                * 9B1A6
                ROMPTR  0E3 03E                  * 9B1AB
              ;                                  * 9B1B6
            }                                    * 9B1BB
            {                                    * 9B1C0
              $       "VARS"                     * 9B1C5
              ::                                 * 9B1D7
                TakeOver                         * 9B1DC
                ROMPTR  0E3 055                  * 9B1E1
                '                                * 9B1EC
                ROMPTR  0E3 03F                  * 9B1F1
              ;                                  * 9B1FC
            }                                    * 9B201
            {                                    * 9B206
              $       "PIC"                      * 9B20B
              ::                                 * 9B21B
                TakeOver                         * 9B220
                ROMPTR  0E3 055                  * 9B225
                '                                * 9B230
                ROMPTR  0E3 041                  * 9B235
              ;                                  * 9B240
            }                                    * 9B245
            {                                    * 9B24A
              $       "→STK"                     * 9B24F
              ::                                 * 9B261
                TakeOver                         * 9B266
                ROMPTR  0E3 030                  * 9B26B
              ;                                  * 9B276
            }                                    * 9B27B
            {                                    * 9B280
              $       "EXIT"                     * 9B285
              ::                                 * 9B297
                TakeOver                         * 9B29C
                ROMPTR  0E3 055                  * 9B2A1
                '                                * 9B2AC
                ROMPTR  0E3 03C                  * 9B2B1
              ;                                  * 9B2BC
            }                                    * 9B2C1
          }                                      * 9B2C6
          {                                      * 9B2CB
            {                                    * 9B2D0
              $       "SOLV"                     * 9B2D5
              ::                                 * 9B2E7
                TakeOver                         * 9B2EC
                ROMPTR  0E3 055                  * 9B2F1
                '                                * 9B2FC
                ROMPTR  0E3 03D                  * 9B301
              ;                                  * 9B30C
            }                                    * 9B311
            {                                    * 9B316
              $       "NXEQ"                     * 9B31B
              ::                                 * 9B32D
                TakeOver                         * 9B332
                ROMPTR  0E3 055                  * 9B337
                ROMPTR  0E3 031                  * 9B342
                DROP'                            * 9B34D
                ROMPTR  0E3 03E                  * 9B352
              ;                                  * 9B35D
            }                                    * 9B362
            {                                    * 9B367
              $       "VARS"                     * 9B36C
              ::                                 * 9B37E
                TakeOver                         * 9B383
                ROMPTR  0E3 055                  * 9B388
                '                                * 9B393
                ROMPTR  0E3 03F                  * 9B398
              ;                                  * 9B3A3
            }                                    * 9B3A8
            {                                    * 9B3AD
              $       "PIC"                      * 9B3B2
              ::                                 * 9B3C2
                TakeOver                         * 9B3C7
                ROMPTR  0E3 055                  * 9B3CC
                '                                * 9B3D7
                ROMPTR  0E3 041                  * 9B3DC
              ;                                  * 9B3E7
            }                                    * 9B3EC
            {                                    * 9B3F1
              $       "→STK"                     * 9B3F6
              ::                                 * 9B408
                TakeOver                         * 9B40D
                ROMPTR  0E3 030                  * 9B412
              ;                                  * 9B41D
            }                                    * 9B422
            {                                    * 9B427
              $       "EXIT"                     * 9B42C
              ::                                 * 9B43E
                TakeOver                         * 9B443
                ROMPTR  0E3 055                  * 9B448
                '                                * 9B453
                ROMPTR  0E3 03C                  * 9B458
              ;                                  * 9B463
            }                                    * 9B468
          }                                      * 9B46D
        ;                                        * 9B472

* ROMPTR 0E3 02F
* refs (1): 99FF5
ROMP_0E3_02F:
        {                                        * 9B477
          {                                      * 9B47C
            $       "SOLV"                       * 9B481
            ::                                   * 9B493
              TakeOver                           * 9B498
              ROMPTR  0E3 055                    * 9B49D
              '                                  * 9B4A8
              ROMPTR  0E3 03D                    * 9B4AD
            ;                                    * 9B4B8
          }                                      * 9B4BD
          {                                      * 9B4C2
            $       "EQN"                        * 9B4C7
            ::                                   * 9B4D7
              TakeOver                           * 9B4DC
              ROMPTR  0E3 055                    * 9B4E1
              '                                  * 9B4EC
              ROMPTR  0E3 03E                    * 9B4F1
            ;                                    * 9B4FC
          }                                      * 9B501
          {                                      * 9B506
            $       "VARS"                       * 9B50B
            ::                                   * 9B51D
              TakeOver                           * 9B522
              ROMPTR  0E3 055                    * 9B527
              '                                  * 9B532
              ROMPTR  0E3 03F                    * 9B537
            ;                                    * 9B542
          }                                      * 9B547
          {                                      * 9B54C
            $       "PIC"                        * 9B551
            ::                                   * 9B561
              TakeOver                           * 9B566
              ROMPTR  0E3 055                    * 9B56B
              '                                  * 9B576
              ROMPTR  0E3 041                    * 9B57B
            ;                                    * 9B586
          }                                      * 9B58B
          {                                      * 9B590
            $       "→STK"                       * 9B595
            ::                                   * 9B5A7
              TakeOver                           * 9B5AC
              ROMPTR  0E3 030                    * 9B5B1
            ;                                    * 9B5BC
          }                                      * 9B5C1
          {                                      * 9B5C6
            $       "EXIT"                       * 9B5CB
            ::                                   * 9B5DD
              TakeOver                           * 9B5E2
              ROMPTR  0E3 055                    * 9B5E7
              '                                  * 9B5F2
              ROMPTR  0E3 03C                    * 9B5F7
            ;                                    * 9B602
          }                                      * 9B607
        }                                        * 9B60C

* ROMPTR 0E3 030
* refs (1): 99FF5
ROMP_0E3_030:
        ::                                       * 9B611
          ROMPTR  0E3 010                        * 9B616
          DUP                                    * 9B621
          CARCOMP                                * 9B626
          CARCOMP                                * 9B62B
          SWAP                                   * 9B630
          ROMPTR  0E3 027                        * 9B635
          SWAP                                   * 9B640
          #>1                                    * 9B645
          IT                                     * 9B64A
          ::                                     * 9B64F
            DUPLENCOMP                           * 9B654
            #1-                                  * 9B659
            ONESWAP                              * 9B65E
            SUBCOMP                              * 9B663
          ;                                      * 9B668
          AtUserStack                            * 9B66D
        ;                                        * 9B672

* ROMPTR 0E3 031
* refs (1): 99FF5
ROMP_0E3_031:
        ::                                       * 9B677
          ROMPTR  0E3 010                        * 9B67C
          CARCOMP                                * 9B687
          DUP                                    * 9B68C
          CARCOMP                                * 9B691
          #>1                                    * 9B696
          IT                                     * 9B69B
          ::                                     * 9B6A0
            DUPTWO                               * 9B6A5
            NTHCOMPDROP                          * 9B6AA
            ROMPTR  0E3 017                      * 9B6AF
            #1+SWAP                              * 9B6BA
            OVER#<                               * 9B6BF
            IT                                   * 9B6C4
            DROPONE                              * 9B6C9
            ROMPTR  0E3 00A                      * 9B6CE
          ;                                      * 9B6D9
        ;                                        * 9B6DE

* ROMPTR 0E3 032
* refs (1): 99FF5
ROMP_0E3_032:
        ::                                       * 9B6E3
          ROMPTR  0E3 010                        * 9B6E8
          CARCOMP                                * 9B6F3
          DUP                                    * 9B6F8
          CARCOMP                                * 9B6FD
          #>1                                    * 9B702
          IT                                     * 9B707
          ::                                     * 9B70C
            DUPTWO                               * 9B711
            NTHCOMPDROP                          * 9B716
            ROMPTR  0E3 017                      * 9B71B
            #1-                                  * 9B726
            DUP                                  * 9B72B
            #0=                                  * 9B730
            ITE                                  * 9B735
            DROP                                 * 9B73A
            SWAPDROP                             * 9B73F
            ROMPTR  0E3 00A                      * 9B744
          ;                                      * 9B74F
        ;                                        * 9B754

* ROMPTR 0E3 033
* refs (1): 99FF5
ROMP_0E3_033:
        {                                        * 9B759
          ::                                     * 9B75E
            ROMPTR  0E3 055                      * 9B763
            ROMPTR  0E3 02F                      * 9B76E
            ROMPTR  0E3 033                      * 9B779
            ROMPTR  0E3 031                      * 9B784
            '                                    * 9B78F
            ROMPTR  0E3 052                      * 9B794
          ;                                      * 9B79F
          ::                                     * 9B7A4
            ROMPTR  0E3 055                      * 9B7A9
            ROMPTR  0E3 048                      * 9B7B4
            'NOP                                 * 9B7BF
          ;                                      * 9B7C4
          ::                                     * 9B7C9
            ROMPTR  0E3 055                      * 9B7CE
            ROMPTR  0E3 02F                      * 9B7D9
            ROMPTR  0E3 033                      * 9B7E4
            ROMPTR  0E3 032                      * 9B7EF
            '                                    * 9B7FA
            ROMPTR  0E3 052                      * 9B7FF
          ;                                      * 9B80A
        }                                        * 9B80F

* ROMPTR 0E3 034
* refs (1): 99FF5
ROMP_0E3_034:
        {                                        * 9B814
          ::                                     * 9B819
            ROMPTR  0E3 055                      * 9B81E
            ROMPTR  0E3 02F                      * 9B829
            ROMPTR  0E3 033                      * 9B834
            ROMPTR  0E3 010                      * 9B83F
            CARCOMP                              * 9B84A
            '                                    * 9B84F
            ROMPTR  0E3 052                      * 9B854
          ;                                      * 9B85F
          ::                                     * 9B864
            ROMPTR  0E3 055                      * 9B869
            ROMPTR  0E3 048                      * 9B874
            'NOP                                 * 9B87F
          ;                                      * 9B884
        }                                        * 9B889

* ROMPTR 0E3 035
* refs (1): 99FF5
ROMP_0E3_035:
        {                                        * 9B88E
          {                                      * 9B893
            $       "SOLV"                       * 9B898
            ::                                   * 9B8AA
              TakeOver                           * 9B8AF
              ROMPTR  0E0 013                    * 9B8B4  BRdone
              '                                  * 9B8BF
              ROMPTR  0E3 03D                    * 9B8C4
            ;                                    * 9B8CF
          }                                      * 9B8D4
          {                                      * 9B8D9
            $       "EQN"                        * 9B8DE
            ::                                   * 9B8EE
              TakeOver                           * 9B8F3
              ROMPTR  0E3 047                    * 9B8F8
              '                                  * 9B903
              ROMPTR  0E3 037                    * 9B908
            ;                                    * 9B913
          }                                      * 9B918
          {                                      * 9B91D
            $       "VARS"                       * 9B922
            ::                                   * 9B934
              TakeOver                           * 9B939
              ROMPTR  0E0 013                    * 9B93E  BRdone
              '                                  * 9B949
              ROMPTR  0E3 038                    * 9B94E
            ;                                    * 9B959
          }                                      * 9B95E
          {                                      * 9B963
            $       "PIC"                        * 9B968
            ::                                   * 9B978
              TakeOver                           * 9B97D
              ROMPTR  0E3 047                    * 9B982
              '                                  * 9B98D
              ROMPTR  0E3 039                    * 9B992
            ;                                    * 9B99D
          }                                      * 9B9A2
          {                                      * 9B9A7
            $       "→STK"                       * 9B9AC
            ::                                   * 9B9BE
              TakeOver                           * 9B9C3
              ROMPTR  0E3 030                    * 9B9C8
            ;                                    * 9B9D3
          }                                      * 9B9D8
          {                                      * 9B9DD
            $       "EXIT"                       * 9B9E2
            ::                                   * 9B9F4
              TakeOver                           * 9B9F9
              ROMPTR  0E0 013                    * 9B9FE  BRdone
              '                                  * 9BA09
              ROMPTR  0E3 03C                    * 9BA0E
            ;                                    * 9BA19
          }                                      * 9BA1E
          {                                      * 9BA23
            ::                                   * 9BA28
              TakeOver                           * 9BA2D
              $       "SI"                       * 9BA32
              BINT60                             * 9BA40
              TestUserFlag                       * 9BA45
              NOT                                * 9BA4A
              Box/StdLabel                       * 9BA4F
            ;                                    * 9BA54
            ::                                   * 9BA59
              TakeOver                           * 9BA5E
              BINT60                             * 9BA63
              TestUserFlag                       * 9BA68
              case                               * 9BA6D
              ::                                 * 9BA72
                BINT60                           * 9BA77
                ClrUserFlag                      * 9BA7C
                ROMPTR  0E0 049                  * 9BA81  BRinverse
                ROMPTR  0E0 045                  * 9BA8C  BRDispItems
                ROMPTR  0E0 049                  * 9BA97  BRinverse
                DispMenu                         * 9BAA2
              ;                                  * 9BAA7
            ;                                    * 9BAAC
          }                                      * 9BAB1
          {                                      * 9BAB6
            ::                                   * 9BABB
              TakeOver                           * 9BAC0
              $       "ENGL"                     * 9BAC5
              BINT60                             * 9BAD7
              TestUserFlag                       * 9BADC
              Box/StdLabel                       * 9BAE1
            ;                                    * 9BAE6
            ::                                   * 9BAEB
              TakeOver                           * 9BAF0
              BINT60                             * 9BAF5
              TestUserFlag                       * 9BAFA
              NOTcase                            * 9BAFF
              ::                                 * 9BB04
                BINT60                           * 9BB09
                SetUserFlag                      * 9BB0E
                ROMPTR  0E0 049                  * 9BB13  BRinverse
                ROMPTR  0E0 045                  * 9BB1E  BRDispItems
                ROMPTR  0E0 049                  * 9BB29  BRinverse
                DispMenu                         * 9BB34
              ;                                  * 9BB39
            ;                                    * 9BB3E
          }                                      * 9BB43
          {                                      * 9BB48
            ::                                   * 9BB4D
              TakeOver                           * 9BB52
              $       "UNITS"                    * 9BB57
              BINT61                             * 9BB6B
              TestUserFlag                       * 9BB70
              NOT                                * 9BB75
              Box/StdLabel                       * 9BB7A
            ;                                    * 9BB7F
            ::                                   * 9BB84
              TakeOver                           * 9BB89
              BINT61                             * 9BB8E
              DUP                                * 9BB93
              UserITE                            * 9BB98
              ClrUserFlag                        * 9BB9D
              SetUserFlag                        * 9BBA2
              ROMPTR  0E0 049                    * 9BBA7  BRinverse
              ROMPTR  0E0 045                    * 9BBB2  BRDispItems
              ROMPTR  0E0 049                    * 9BBBD  BRinverse
              DispMenu                           * 9BBC8
            ;                                    * 9BBCD
          }                                      * 9BBD2
          {                                      * 9BBD7
            $       "→VARS"                      * 9BBDC
            ::                                   * 9BBF0
              TakeOver                           * 9BBF5
              ROMPTR  0E3 010                    * 9BBFA
              ROMPTR  0E3 042                    * 9BC05
            ;                                    * 9BC10
          }                                      * 9BC15
          {                                      * 9BC1A
            $       "PURG"                       * 9BC1F
            ::                                   * 9BC31
              TakeOver                           * 9BC36
              ROMPTR  0E3 010                    * 9BC3B
              ROMPTR  0E3 044                    * 9BC46
            ;                                    * 9BC51
          }                                      * 9BC56
          {                                      * 9BC5B
            $       "EXIT"                       * 9BC60
            ::                                   * 9BC72
              TakeOver                           * 9BC77
              ROMPTR  0E0 013                    * 9BC7C  BRdone
              '                                  * 9BC87
              ROMPTR  0E3 03C                    * 9BC8C
            ;                                    * 9BC97
          }                                      * 9BC9C
        }                                        * 9BCA1

* ROMPTR 0E3 036
* refs (1): 99FF5
ROMP_0E3_036:
        {                                        * 9BCA6
          ::                                     * 9BCAB
            ROMPTR  0E0 013                      * 9BCB0  BRdone
            ROMPTR  0E3 02F                      * 9BCBB
            ROMPTR  0E3 033                      * 9BCC6
            ROMPTR  0E3 010                      * 9BCD1
            CARCOMP                              * 9BCDC
            '                                    * 9BCE1
            ROMPTR  0E3 052                      * 9BCE6
          ;                                      * 9BCF1
          ROMPTR  0E3 01F                        * 9BCF6
        }                                        * 9BD01

* ROMPTR 0E3 037
* refs (1): 99FF5
ROMP_0E3_037:
        ::                                       * 9BD06
          ROMPTR  0E3 008                        * 9BD0B
          ROMPTR  0E3 009                        * 9BD16
          ROMPTR  0E3 03E                        * 9BD21
        ;                                        * 9BD2C

* ROMPTR 0E3 038
* refs (1): 99FF5
ROMP_0E3_038:
        ::                                       * 9BD31
          ROMPTR  0E3 035                        * 9BD36
          ROMPTR  0E3 036                        * 9BD41
          ONEONE                                 * 9BD4C
          ROMPTR  0E3 040                        * 9BD51
        ;                                        * 9BD5C

* ROMPTR 0E3 039
* refs (1): 99FF5
ROMP_0E3_039:
        ::                                       * 9BD61
          ROMPTR  0E3 008                        * 9BD66
          ROMPTR  0E3 009                        * 9BD71
          ROMPTR  0E3 041                        * 9BD7C
        ;                                        * 9BD87

* ROMPTR 0E3 03A
* refs (1): 99FF5
ROMP_0E3_03A:
        {                                        * 9BD8C
          {                                      * 9BD91
            $       "SOLV"                       * 9BD96
            ::                                   * 9BDA8
              TakeOver                           * 9BDAD
              ROMPTR  0E3 065                    * 9BDB2
              '                                  * 9BDBD
              ROMPTR  0E3 03D                    * 9BDC2
            ;                                    * 9BDCD
          }                                      * 9BDD2
          {                                      * 9BDD7
            $       "EQN"                        * 9BDDC
            ::                                   * 9BDEC
              TakeOver                           * 9BDF1
              ROMPTR  0E3 065                    * 9BDF6
              '                                  * 9BE01
              ROMPTR  0E3 03E                    * 9BE06
            ;                                    * 9BE11
          }                                      * 9BE16
          {                                      * 9BE1B
            $       "VARS"                       * 9BE20
            ::                                   * 9BE32
              TakeOver                           * 9BE37
              ROMPTR  0E3 065                    * 9BE3C
              '                                  * 9BE47
              ROMPTR  0E3 03F                    * 9BE4C
            ;                                    * 9BE57
          }                                      * 9BE5C
          {                                      * 9BE61
            $       "PIC"                        * 9BE66
            ::                                   * 9BE76
              TakeOver                           * 9BE7B
              ROMPTR  0E3 065                    * 9BE80
              '                                  * 9BE8B
              ROMPTR  0E3 041                    * 9BE90
            ;                                    * 9BE9B
          }                                      * 9BEA0
          {                                      * 9BEA5
            $       "→PICT"                      * 9BEAA
            ::                                   * 9BEBE
              TakeOver                           * 9BEC3
              ROMPTR  0E3 06B                    * 9BEC8
            ;                                    * 9BED3
          }                                      * 9BED8
          {                                      * 9BEDD
            $       "EXIT"                       * 9BEE2
            ::                                   * 9BEF4
              TakeOver                           * 9BEF9
              ROMPTR  0E3 065                    * 9BEFE
              '                                  * 9BF09
              ROMPTR  0E3 03C                    * 9BF0E
            ;                                    * 9BF19
          }                                      * 9BF1E
        }                                        * 9BF23

* ROMPTR 0E3 03B
* refs (1): 99FF5
ROMP_0E3_03B:
        {                                        * 9BF28
          ::                                     * 9BF2D
            ROMPTR  0E3 065                      * 9BF32
            ROMPTR  0E3 02F                      * 9BF3D
            ROMPTR  0E3 033                      * 9BF48
            ROMPTR  0E3 010                      * 9BF53
            CARCOMP                              * 9BF5E
            '                                    * 9BF63
            ROMPTR  0E3 052                      * 9BF68
          ;                                      * 9BF73
          ::                                     * 9BF78
            ROMPTR  0E3 065                      * 9BF7D
            ROMPTR  0E3 048                      * 9BF88
            'NOP                                 * 9BF93
          ;                                      * 9BF98
        }                                        * 9BF9D

* ROMPTR 0E3 03C
* refs (1): 99FF5
ROMP_0E3_03C:
        ::                                       * 9BFA2
          ROMPTR  0E3 022                        * 9BFA7
          ROMPTR  0E3 023                        * 9BFB2
          ROMPTR  0E3 012                        * 9BFBD
          ROMPTR  0E3 011                        * 9BFC8
          ROMPTR  0E3 00E                        * 9BFD3
          ROMPTR  0E3 00F                        * 9BFDE
          DUPTWO                                 * 9BFE9
          NTHCOMPDROP                            * 9BFEE
          SWAP                                   * 9BFF3
          CARCOMP                                * 9BFF8
          EVAL                                   * 9BFFD
          SWAP                                   * 9C002
          TWO{}N                                 * 9C007
          ROMPTR  0E3 049                        * 9C00C
        ;                                        * 9C017

* ROMPTR 0E3 03D
* refs (1): 99FF5
ROMP_0E3_03D:
        ::                                       * 9C01C
          ROMPTR  0E3 010                        * 9C021
          ROMPTR  0E3 011                        * 9C02C
          ROMPTR  0E3 00F                        * 9C037
          CARCOMP                                * 9C042
          EVAL                                   * 9C047
          GETATELN                               * 9C04C
          DROPSWAP                               * 9C051
          ROMPTR  0E3 048                        * 9C056
          ROMPTR  0E3 045                        * 9C061
        ;                                        * 9C06C

* ROMPTR 0E3 03E
* refs (1): 99FF5
ROMP_0E3_03E:
        ::                                       * 9C071
          ROMPTR  0E3 02E                        * 9C076
          ROMPTR  0E3 034                        * 9C081
          ROMPTR  0E3 010                        * 9C08C
          CARCOMP                                * 9C097
          ROMPTR  0E3 051                        * 9C09C
        ;                                        * 9C0A7

* ROMPTR 0E3 03F
* refs (1): 99FF5
ROMP_0E3_03F:
        ::                                       * 9C0AC
          ROMPTR  0E3 035                        * 9C0B1
          ROMPTR  0E3 036                        * 9C0BC
          ROMPTR  0E3 016                        * 9C0C7
          ROMPTR  0E3 015                        * 9C0D2
          ROMPTR  0E3 040                        * 9C0DD
        ;                                        * 9C0E8

* ROMPTR 0E3 040
* refs (1): 99FF5
ROMP_0E3_040:
        ::                                       * 9C0ED
          ROMPTR  0E3 011                        * 9C0F2
          ROMPTR  0E3 00F                        * 9C0FD
          CARCOMP                                * 9C108
          EVAL                                   * 9C10D
          DUP                                    * 9C112
          3UNROLL                                * 9C117
          GETATELN                               * 9C11C
          DROP                                   * 9C121
          SWAP                                   * 9C126
          ROMPTR  0E3 010                        * 9C12B
          BINT2                                  * 9C136
          NTHCOMPDROP                            * 9C13B
          EVAL                                   * 9C140
          INCOMPDROP                             * 9C145
          BINT5                                  * 9C14A
          {}N                                    * 9C14F
          ROMPTR  0E3 04A                        * 9C154
        ;                                        * 9C15F

* ROMPTR 0E3 041
* refs (1): 99FF5
ROMP_0E3_041:
        ::                                       * 9C164
          ROMPTR  0E3 03A                        * 9C169
          ROMPTR  0E3 03B                        * 9C174
          ROMPTR  0E3 010                        * 9C17F
          BINT3                                  * 9C18A
          NTHCOMPDROP                            * 9C18F
          EVAL                                   * 9C194
          ROMPTR  0E3 060                        * 9C199
        ;                                        * 9C1A4

* ROMPTR 0E3 042
* refs (1): 99FF5
ROMP_0E3_042:
        ::                                       * 9C1A9
          BINT2                                  * 9C1AE
          NTHCOMPDROP                            * 9C1B3
          EVAL                                   * 9C1B8
          INCOMPDROP                             * 9C1BD
          ROTROT2DROP                            * 9C1C2
          DUPLEN$                                * 9C1C7
          #1+                                    * 9C1CC
          ONE_DO                                 * 9C1D1
          INDEX@                                 * 9C1D6
          3PICK                                  * 9C1DB
          ROMPTR  0E3 01C                        * 9C1E0
          BINT61                                 * 9C1EB
          UserITE                                * 9C1F0
          ::                                     * 9C1F5
            DUPSAFE@                             * 9C1FA
            ITE                                  * 9C1FF
            ::                                   * 9C204
              DUPTYPEEXT?                        * 9C209
              case                               * 9C20E
              ::                                 * 9C213
                CARCOMP                          * 9C218
                SWAP                             * 9C21D
                XEQSTOID                         * 9C222
              ;                                  * 9C227
              2DROP                              * 9C22C
            ;                                    * 9C231
            ::                                   * 9C236
              %0_2A2B4                           * 9C23B
              SWAP                               * 9C240
              XEQSTOID                           * 9C245
            ;                                    * 9C24A
          ;                                      * 9C24F
          ::                                     * 9C254
            OVER                                 * 9C259
            INDEX@                               * 9C25E
            SUB$1#                               * 9C263
            BINT60                               * 9C268
            UserITE                              * 9C26D
            ::                                   * 9C272
              ROMPTR  0E2 013                    * 9C277
              OVER                               * 9C282
              NTHCOMPDROP                        * 9C287
              TYPECHAR?                          * 9C28C
              ITE                                * 9C291
              ROMPTR  0E2 014                    * 9C296
              ROMPTR  0E2 013                    * 9C2A1
            ;                                    * 9C2AC
            ROMPTR  0E2 014                      * 9C2B1
            SWAP                                 * 9C2BC
            NTHCOMPDROP                          * 9C2C1
            SWAPDUP                              * 9C2C6
            SAFE@                                * 9C2CB
            ITE                                  * 9C2D0
            ::                                   * 9C2D5
              DUPTYPEREAL?                       * 9C2DA
              DUP                                * 9C2DF
              3PICK                              * 9C2E4
              TYPEEXT?                           * 9C2E9
              OR                                 * 9C2EE
              NOTcase                            * 9C2F3
              ::                                 * 9C2F8
                2DROP                            * 9C2FD
                XEQSTOID                         * 9C302
              ;                                  * 9C307
              4PICK                              * 9C30C
              TYPEREAL?                          * 9C311
              ANDcase                            * 9C316
              3DROP                              * 9C31B
              DUPTYPEREAL?                       * 9C320
              case                               * 9C325
              ::                                 * 9C32A
                ROT                              * 9C32F
                UMU>                             * 9C334
                SWAPDROP                         * 9C339
                UM>U                             * 9C33E
                SWAP                             * 9C343
                XEQSTOID                         * 9C348
              ;                                  * 9C34D
              3PICK                              * 9C352
              TYPEREAL?                          * 9C357
              ITE                                * 9C35C
              ::                                 * 9C361
                ROTDROP                          * 9C366
                CARCOMP                          * 9C36B
                SWAP                             * 9C370
                XEQSTOID                         * 9C375
              ;                                  * 9C37A
              ::                                 * 9C37F
                CARCOMP                          * 9C384
                ROT                              * 9C389
                UM>U                             * 9C38E
                SWAP                             * 9C393
                XEQSTOID                         * 9C398
              ;                                  * 9C39D
            ;                                    * 9C3A2
            XEQSTOID                             * 9C3A7
          ;                                      * 9C3AC
          LOOP                                   * 9C3B1
          2DROP                                  * 9C3B6
        ;                                        * 9C3BB

* ROMPTR 0E3 043
* refs (1): 99FF5
ROMP_0E3_043:
        ::                                       * 9C3C0
          BINT2                                  * 9C3C5
          NTHCOMPDROP                            * 9C3CA
          EVAL                                   * 9C3CF
          INCOMPDROP                             * 9C3D4
          ROTROT2DROP                            * 9C3D9
          DUPLEN$                                * 9C3DE
          #1+                                    * 9C3E3
          ONE_DO                                 * 9C3E8
          INDEX@                                 * 9C3ED
          3PICK                                  * 9C3F2
          ROMPTR  0E3 01C                        * 9C3F7
          BINT61                                 * 9C402
          UserITE                                * 9C407
          ::                                     * 9C40C
            DUPSAFE@                             * 9C411
            ITE                                  * 9C416
            ::                                   * 9C41B
              DUPTYPEEXT?                        * 9C420
              case                               * 9C425
              ::                                 * 9C42A
                CARCOMP                          * 9C42F
                SWAP                             * 9C434
                XEQSTOID                         * 9C439
              ;                                  * 9C43E
              2DROP                              * 9C443
            ;                                    * 9C448
            ::                                   * 9C44D
              %0_2A2B4                           * 9C452
              SWAP                               * 9C457
              XEQSTOID                           * 9C45C
            ;                                    * 9C461
          ;                                      * 9C466
          ::                                     * 9C46B
            OVER                                 * 9C470
            INDEX@                               * 9C475
            SUB$1#                               * 9C47A
            BINT60                               * 9C47F
            UserITE                              * 9C484
            ::                                   * 9C489
              ROMPTR  0E2 013                    * 9C48E
              OVER                               * 9C499
              NTHCOMPDROP                        * 9C49E
              TYPECHAR?                          * 9C4A3
              ITE                                * 9C4A8
              ROMPTR  0E2 014                    * 9C4AD
              ROMPTR  0E2 013                    * 9C4B8
            ;                                    * 9C4C3
            ROMPTR  0E2 014                      * 9C4C8
            SWAP                                 * 9C4D3
            NTHCOMPDROP                          * 9C4D8
            SWAPDUP                              * 9C4DD
            SAFE@                                * 9C4E2
            ITE                                  * 9C4E7
            ::                                   * 9C4EC
              DUPTYPEREAL?                       * 9C4F1
              DUP                                * 9C4F6
              3PICK                              * 9C4FB
              TYPEEXT?                           * 9C500
              OR                                 * 9C505
              NOTcase                            * 9C50A
              4DROP                              * 9C50F
              4PICK                              * 9C514
              TYPEREAL?                          * 9C519
              ANDcase                            * 9C51E
              3DROP                              * 9C523
              DUPTYPEREAL?                       * 9C528
              case                               * 9C52D
              ::                                 * 9C532
                ROT                              * 9C537
                UMU>                             * 9C53C
                SWAPDROP                         * 9C541
                UM>U                             * 9C546
                SWAP                             * 9C54B
                XEQSTOID                         * 9C550
              ;                                  * 9C555
              3PICK                              * 9C55A
              TYPEREAL?                          * 9C55F
              ITE                                * 9C564
              ::                                 * 9C569
                ROTDROP                          * 9C56E
                CARCOMP                          * 9C573
                SWAP                             * 9C578
                XEQSTOID                         * 9C57D
              ;                                  * 9C582
              ::                                 * 9C587
                U>NCQ                            * 9C58C
                SWAPDROP                         * 9C591
                4PICK                            * 9C596
                U>NCQ                            * 9C59B
                ROTROT2DROP                      * 9C5A0
                EQUAL                            * 9C5A5
                ITE                              * 9C5AA
                3DROP                            * 9C5AF
                ::                               * 9C5B4
                  %%>%                           * 9C5B9
                  ROT                            * 9C5BE
                  UM>U                           * 9C5C3
                  SWAP                           * 9C5C8
                  XEQSTOID                       * 9C5CD
                ;                                * 9C5D2
              ;                                  * 9C5D7
            ;                                    * 9C5DC
            XEQSTOID                             * 9C5E1
          ;                                      * 9C5E6
          LOOP                                   * 9C5EB
          2DROP                                  * 9C5F0
        ;                                        * 9C5F5

* ROMPTR 0E3 044
* refs (1): 99FF5
ROMP_0E3_044:
        ::                                       * 9C5FA
          BINT2                                  * 9C5FF
          NTHCOMPDROP                            * 9C604
          EVAL                                   * 9C609
          INCOMPDROP                             * 9C60E
          ROTROT2DROP                            * 9C613
          DUPLEN$                                * 9C618
          #1+                                    * 9C61D
          ONE_DO                                 * 9C622
          INDEX@                                 * 9C627
          3PICK                                  * 9C62C
          ROMPTR  0E3 01C                        * 9C631
          PURGE                                  * 9C63C
          LOOP                                   * 9C641
          2DROP                                  * 9C646
        ;                                        * 9C64B

* ROMPTR 0E3 045
* refs (1): 99FF5
ROMP_0E3_045:
        ::                                       * 9C650
          CLEARLCD                               * 9C655
          #       E301                           * 9C65A  58113
          JstGetTHEMESG                          * 9C664
          DISPROW4                               * 9C669
          SetDA1Valid                            * 9C66E
          ROMPTR  0E3 046                        * 9C673
        ;                                        * 9C67E

* ROMPTR 0E3 046
* refs (1): 99FF5
ROMP_0E3_046:
        ::                                       * 9C683
          DUP                                    * 9C688
          ROMPTR  0E3 043                        * 9C68D
          DUP                                    * 9C698
          ROMPTR  0E3 027                        * 9C69D
          SWAP                                   * 9C6A8
          CARCOMP                                * 9C6AD
          CARCOMP                                * 9C6B2
          BINT2                                  * 9C6B7
          #<                                     * 9C6BC
          NOTcase                                * 9C6C1
          ROMPTR  0E4 00B                        * 9C6C6
          '                                      * 9C6D1
          ID      EQ                             * 9C6D6
          XEQSTOID                               * 9C6E1
          DROP                                   * 9C6E6
          '                                      * 9C6EB
          DoSolvrMenu                            * 9C6F0
        ;                                        * 9C6F5

* ROMPTR 0E3 047
* refs (1): 99FF5
ROMP_0E3_047:
        ::                                       * 9C6FA
          ROMPTR  0E0 012                        * 9C6FF  ~BRoutput
          ROMPTR  0E0 013                        * 9C70A  BRdone
        ;                                        * 9C715

* ROMPTR 0E3 048
* refs (1): 99FF5
ROMP_0E3_048:
        ::                                       * 9C71A
          TRUE                                   * 9C71F
          ROMPTR  0E3 000                        * 9C724
        ;                                        * 9C72F

* ROMPTR 0E3 049
* refs (1): 99FF5
ROMP_0E3_049:
        ::                                       * 9C734
          SWAP                                   * 9C739
          5UNROLL                                * 9C73E
          RESOROMP                               * 9C743
          ROMPTR  0E3 01A                        * 9C748
          NULL{}                                 * 9C753
          ROMPTR  0E0 010                        * 9C758  ~BRbrowse
        ;                                        * 9C763

* ROMPTR 0E3 04A
* refs (1): 99FF5
ROMP_0E3_04A:
        ::                                       * 9C768
          SWAP                                   * 9C76D
          5UNROLL                                * 9C772
          RESOROMP                               * 9C777
          ROMPTR  0E3 01B                        * 9C77C
          NULL{}                                 * 9C787
          ROMPTR  0E0 010                        * 9C78C  ~BRbrowse
        ;                                        * 9C797

* ROMPTR 0E3 04B
* refs (1): 99FF5
ROMP_0E3_04B:
        CODE                                     * 9C79C  579 nibbles
          GOSBVL  SAVPTR                         * 9C7A6
          A=0     W                              * 9C7AD
          A=DAT1  A                              * 9C7B0
          LC(5)   #00005                         * 9C7B3
          A=A+C   A                              * 9C7BA
          D1=A                                   * 9C7BC
          A=DAT1  A                              * 9C7BF
          A=A-C   A                              * 9C7C2
          D1=D1+  5                              * 9C7C4
          ASRB                                   * 9C7C7
          C=A     A                              * 9C7CA
          C=C-1   A                              * 9C7CC
          R4=C                                   * 9C7CE
          D=C     A                              * 9C7D1
          LC(5)   #00002                         * 9C7D3
          B=C     A                              * 9C7DA
L_9C7DC:
          C=DAT1  B                              * 9C7DC
          LA(2)   #10                            * 9C7DF
          ?C>A    B                              * 9C7E6
          GOYES   L_9C80D                        * 9C7E9
          P=C     0                              * 9C7EB
          LC(16)  #5543322110111111              * 9C7EF
          P=C     0                              * 9C801
          C=0     A                              * 9C805
          CPEX    0                              * 9C807
          B=B+C   A                              * 9C80B
L_9C80D:
          B=B+1   A                              * 9C80D
          D1=D1+  2                              * 9C80F
          D=D-1   A                              * 9C812
          GONC    L_9C7DC                        * 9C814
          B=B+B   A                              * 9C817
          LC(5)   #00005                         * 9C819
          BCEX    A                              * 9C820
          C=C+B   A                              * 9C822
          R0=C                                   * 9C824
          C=C+B   A                              * 9C827
          GOSBVL  GETTEMP                        * 9C829
          AD0EX                                  * 9C830
          D0=A                                   * 9C833
          LC(5)   DOCSTR                         * 9C836
          DAT0=C  A                              * 9C83D
          D0=D0+  5                              * 9C840
          C=R0                                   * 9C843
          DAT0=C  A                              * 9C846
          GOSBVL  GETPTR                         * 9C849
          C=DAT1  A                              * 9C850
          D0=C                                   * 9C853
          D0=D0+  10                             * 9C856
          DAT1=A  A                              * 9C859
          D1=A                                   * 9C85C
          D1=D1+  10                             * 9C85F
          LC(2)   #27                            * 9C862
          DAT1=C  B                              * 9C866
          D1=D1+  2                              * 9C869
          C=R4                                   * 9C86C
          D=C     A                              * 9C86F
          LC(2)   #11                            * 9C871
          B=C     B                              * 9C875
L_9C878:
          A=DAT0  B                              * 9C878
          ?A<B    B                              * 9C87B
          GOYES   L_9C88A                        * 9C87E
          DAT1=A  B                              * 9C880
          D1=D1+  2                              * 9C883
          GOTO    L_9C9C5                        * 9C886
L_9C88A:
          A=A-1   B                              * 9C88A
          A=A-1   B                              * 9C88D
          GONC    L_9C8AC                        * 9C890
          LC(12)  #2854534E4F43                  * 9C893
L_9C8A1:
          DAT1=C  12                             * 9C8A1
          D1=D1+  12                             * 9C8A5
          GOTO    L_9C9C5                        * 9C8A8
L_9C8AC:
          A=A-1   B                              * 9C8AC
          GONC    L_9C8C3                        * 9C8AF
          LC(12)  #284553414255                  * 9C8B2
          GOC     L_9C8A1                        * 9C8C0
L_9C8C3:
          A=A-1   B                              * 9C8C3
          GONC    L_9C8E0                        * 9C8C6
          LC(10)  #2845544649                    * 9C8C9
          DAT1=C  10                             * 9C8D5
          D1=D1+  10                             * 9C8D9
          GOTO    L_9C9C5                        * 9C8DC
L_9C8E0:
          A=A-1   B                              * 9C8E0
          GONC    L_9C8FB                        * 9C8E3
          LC(8)   #28534F43                      * 9C8E6
L_9C8F0:
          DAT1=C  8                              * 9C8F0
          D1=D1+  8                              * 9C8F4
          GOTO    L_9C9C5                        * 9C8F7
L_9C8FB:
          A=A-1   B                              * 9C8FB
          GONC    L_9C90E                        * 9C8FE
          LC(8)   #284E4953                      * 9C901
          GOC     L_9C8F0                        * 9C90B
L_9C90E:
          A=A-1   B                              * 9C90E
          GONC    L_9C926                        * 9C911
          LC(6)   #646172                        * 9C914
L_9C91C:
          DAT1=C  6                              * 9C91C
          D1=D1+  6                              * 9C920
          GONC    L_9C98B                        * 9C923
L_9C926:
          A=A-1   B                              * 9C926
          GONC    L_9C937                        * 9C929
          LC(6)   #6F7774                        * 9C92C
          GOC     L_9C91C                        * 9C934
L_9C937:
          A=A-1   B                              * 9C937
          GONC    L_9C946                        * 9C93A
          LC(4)   #2A32                          * 9C93D
          GOC     L_9C984                        * 9C943
L_9C946:
          A=A-1   B                              * 9C946
          GONC    L_9C955                        * 9C949
          LC(4)   #2A29                          * 9C94C
          GOC     L_9C984                        * 9C952
L_9C955:
          A=A-1   B                              * 9C955
          GONC    L_9C969                        * 9C958
          LC(2)   #0A                            * 9C95B
          DAT1=C  B                              * 9C95F
          D1=D1+  2                              * 9C962
          GOTO    L_9C9C5                        * 9C965
L_9C969:
          A=A-1   B                              * 9C969
          GONC    L_9C978                        * 9C96C
          LC(4)   #2D32                          * 9C96F
          GOC     L_9C984                        * 9C975
L_9C978:
          A=A-1   B                              * 9C978
          GONC    L_9C98F                        * 9C97B
          LC(4)   #325E                          * 9C97E
L_9C984:
          DAT1=C  4                              * 9C984
          D1=D1+  4                              * 9C988
L_9C98B:
          GOTO    L_9C9C5                        * 9C98B
L_9C98F:
          A=A-1   B                              * 9C98F
          GONC    L_9C99E                        * 9C992
          LC(4)   #282F                          * 9C995
          GOC     L_9C984                        * 9C99B
L_9C99E:
          A=A-1   B                              * 9C99E
          GONC    L_9C9AD                        * 9C9A1
          LC(4)   #283D                          * 9C9A4
          GOC     L_9C984                        * 9C9AA
L_9C9AD:
          A=A-1   B                              * 9C9AD
          GONC    L_9C9BC                        * 9C9B0
          LC(4)   #2929                          * 9C9B3
          GOC     L_9C984                        * 9C9B9
L_9C9BC:
          LC(4)   #282A                          * 9C9BC
          GONC    L_9C984                        * 9C9C2
L_9C9C5:
          D0=D0+  2                              * 9C9C5
          D=D-1   A                              * 9C9C8
          GOC     L_9C9D1                        * 9C9CA
          GOTO    L_9C878                        * 9C9CD
L_9C9D1:
          LC(2)   #27                            * 9C9D1
          DAT1=C  B                              * 9C9D5
          GOSBVL  GETPTR                         * 9C9D8
          A=DAT0  A                              * 9C9DF
          D0=D0+  5                              * 9C9E2
          PC=(A)                                 * 9C9E5
        ENDCODE                                  * 9C9E9

* ROMPTR 0E3 04C
* refs (1): 99FF5
ROMP_0E3_04C:
        ::                                       * 9C9E9
          '                                      * 9C9EE
          LAM     'EN1                           * 9C9F3
          STO                                    * 9CA02
        ;                                        * 9CA07

* ROMPTR 0E3 04D
* refs (1): 99FF5
ROMP_0E3_04D:
        ::                                       * 9CA0C
          '                                      * 9CA11
          LAM     'EN2                           * 9CA16
          STO                                    * 9CA25
        ;                                        * 9CA2A

* ROMPTR 0E3 04E
* refs (1): 99FF5
ROMP_0E3_04E:
        ::                                       * 9CA2F
          SWAP                                   * 9CA34
          FALSE                                  * 9CA39
          {                                      * 9CA3E

* ROMPTR 0E3 04F
* refs (1): 99FF5
ROMP_0E3_04F:
            LAM     'EN2                         * 9CA43

* ROMPTR 0E3 050
* refs (1): 99FF5
ROMP_0E3_050:
            LAM     'EN1                         * 9CA52
          }                                      * 9CA61
          BIND                                   * 9CA66
          CLCD10                                 * 9CA6B
          DUPDUP                                 * 9CA70
          CARCOMP                                * 9CA75
          BINT2                                  * 9CA7A
          #<ITE                                  * 9CA7F
          ::                                     * 9CA84
            BINT2                                * 9CA89
            NTHCOMPDROP                          * 9CA8E
            SWAPDROP                             * 9CA93
            BINT1                                * 9CA98
          ;                                      * 9CA9D
          ::                                     * 9CAA2
            BINT2                                * 9CAA7
            NTHCOMPDROP                          * 9CAAC
            SWAP                                 * 9CAB1
            BINT3                                * 9CAB6
            NTHCOMPDROP                          * 9CABB
            ROMPTR  0E3 017                      * 9CAC0
            NTHCOMPDROP                          * 9CACB
            SWAP                                 * 9CAD0
          ;                                      * 9CAD5
          DUP                                    * 9CADA
          5UNROLL                                * 9CADF
          ROMPTR  0E3 053                        * 9CAE4
          3UNROLL                                * 9CAEF
          ClrDAsOK                               * 9CAF4
          RESOROMP                               * 9CAF9
          ROMPTR  0E3 054                        * 9CAFE
          SWAP                                   * 9CB09
          TrueTrue                               * 9CB0E
          5ROLL                                  * 9CB13
          ONEFALSE'                              * 9CB18
          LAM     'EN1                           * 9CB1D
          '                                      * 9CB2C
          ERRJMP                                 * 9CB31
          POLSetUI                               * 9CB36
        ;                                        * 9CB3B

* ROMPTR 0E3 051
* refs (1): 99FF5
ROMP_0E3_051:
        ::                                       * 9CB40
          ERRSET                                 * 9CB45
          ::                                     * 9CB4A
            RESOROMP                             * 9CB4F
            ROMPTR  0E3 056                      * 9CB54
            3UNROLL                              * 9CB5F
            ROMPTR  0E3 04E                      * 9CB64
            ROMPTR  0E3 028                      * 9CB6F
            Symb>HBuff                           * 9CB7A
            ROMPTR  0E3 053                      * 9CB7F
            POLKeyUI                             * 9CB8A
            RECLAIMDISP                          * 9CB8F
            ClrDAsOK                             * 9CB94
          ;                                      * 9CB99
          ERRTRAP                                * 9CB9E
          ERRJMP                                 * 9CBA3
        ;                                        * 9CBA8

* ROMPTR 0E3 052
* refs (1): 99FF5
ROMP_0E3_052:
        ::                                       * 9CBAD
          ERRSET                                 * 9CBB2
          ::                                     * 9CBB7
            RESOROMP                             * 9CBBC
            ROMPTR  0E3 057                      * 9CBC1
            3UNROLL                              * 9CBCC
            ROMPTR  0E3 04E                      * 9CBD1
            SWAPDROP                             * 9CBDC
            ROMPTR  0E3 04B                      * 9CBE1
            ZEROOVER                             * 9CBEC
            BEGIN                                * 9CBF1
            DUP                                  * 9CBF6
            $       "\0A"                        * 9CBFB
            BINT1                                * 9CC07
            POS$                                 * 9CC0C
            DUP#0<>                              * 9CC11
            WHILE                                * 9CC16
            ::                                   * 9CC1B
              ROT#1+UNROT                        * 9CC20
              #1+                                * 9CC25
              OVERLEN$                           * 9CC2A
              SUB$                               * 9CC2F
            ;                                    * 9CC34
            REPEAT                               * 9CC39
            2DROP                                * 9CC3E
            #1+                                  * 9CC43
            {                                    * 9CC48
              BINT4                              * 9CC4D
              BINT4                              * 9CC52
              BINT3                              * 9CC57
              BINT3                              * 9CC5C
              BINT2                              * 9CC61
              BINT2                              * 9CC66
            }                                    * 9CC6B
            SWAP                                 * 9CC70
            NTHCOMPDROP                          * 9CC75
            BINT7                                * 9CC7A
            Disp5x7                              * 9CC7F
            POLKeyUI                             * 9CC84
            ClrDAsOK                             * 9CC89
          ;                                      * 9CC8E
          ERRTRAP                                * 9CC93
          ERRJMP                                 * 9CC98
        ;                                        * 9CC9D

* ROMPTR 0E3 053
* refs (1): 99FF5
ROMP_0E3_053:
        ::                                       * 9CCA2
          DUP#1=                                 * 9CCA7
          ITE                                    * 9CCAC
          DROPNULL$                              * 9CCB1
          ::                                     * 9CCB6
            UNCOERCE                             * 9CCBB
            ROMPTR  0E3 017                      * 9CCC0
            UNCOERCE                             * 9CCCB
            EDITDECOMP$                          * 9CCD0
            #       E302                         * 9CCD5  58114
            JstGetTHEMESG                        * 9CCDF
            &$SWAP                               * 9CCE4
            EDITDECOMP$                          * 9CCE9
            &$                                   * 9CCEE
          ;                                      * 9CCF3
          ROMPTR  0E3 018                        * 9CCF8
          DUP#1=                                 * 9CD03
          ITE                                    * 9CD08
          ::                                     * 9CD0D
            DROP                                 * 9CD12
            $       " *"                         * 9CD17
            &$                                   * 9CD25
          ;                                      * 9CD2A
          ::                                     * 9CD2F
            #3=                                  * 9CD34
            IT                                   * 9CD39
            ::                                   * 9CD3E
              ROMPTR  0E3 010                    * 9CD43
              CARCOMP                            * 9CD4E
              BINT4                              * 9CD53
              NTHCOMPDROP                        * 9CD58
              ROMPTR  0E3 017                    * 9CD5D
              NTHCOMPDROP                        * 9CD68
              TYPECHAR?                          * 9CD6D
              ?SKIP                              * 9CD72
              ::                                 * 9CD77
                $       " *"                     * 9CD7C
                &$                               * 9CD8A
              ;                                  * 9CD8F
            ;                                    * 9CD94
          ;                                      * 9CD99
          $>grob                                 * 9CD9E
          ZEROZERO                               * 9CDA3
          ROT                                    * 9CDA8
          XYGROBDISP                             * 9CDAD
        ;                                        * 9CDB2

* ROMPTR 0E3 054
* refs (1): 99FF5
ROMP_0E3_054:
        ::                                       * 9CDB7
          DA3OK?                                 * 9CDBC
          ?SKIP                                  * 9CDC1
          ::                                     * 9CDC6
            DispMenu                             * 9CDCB
            SetDA3Valid                          * 9CDD0
          ;                                      * 9CDD5
        ;                                        * 9CDDA

* ROMPTR 0E3 055
* refs (1): 99FF5
ROMP_0E3_055:
        ::                                       * 9CDDF
          TRUE                                   * 9CDE4
          ROMPTR  0E3 04C                        * 9CDE9
        ;                                        * 9CDF4

* ROMPTR 0E3 056
* refs (1): 99FF5
ROMP_0E3_056:
        ::                                       * 9CDF9
          BINT1                                  * 9CDFE
          #=casedrop                             * 9CE03
          ROMPTR  0E3 059                        * 9CE08
          BINT3                                  * 9CE13
          #=casedrop                             * 9CE18
          ROMPTR  0E3 05A                        * 9CE1D
          2DROP                                  * 9CE28
          'DoBadKeyT                             * 9CE2D
        ;                                        * 9CE32

* ROMPTR 0E3 057
* refs (1): 99FF5
ROMP_0E3_057:
        ::                                       * 9CE37
          BINT1                                  * 9CE3C
          #=casedrop                             * 9CE41
          ROMPTR  0E3 058                        * 9CE46
          BINT3                                  * 9CE51
          #=casedrop                             * 9CE56
          ROMPTR  0E3 05A                        * 9CE5B
          2DROP                                  * 9CE66
          'DoBadKeyT                             * 9CE6B
        ;                                        * 9CE70

* ROMPTR 0E3 058
* refs (1): 99FF5
ROMP_0E3_058:
        ::                                       * 9CE75
          BINT11                                 * 9CE7A
          ?CaseRomptr@                           * 9CE7F
          ROMPTR  0E3 05D                        * 9CE84
          BINT17                                 * 9CE8F
          ?CaseRomptr@                           * 9CE94
          ROMPTR  0E3 05B                        * 9CE99
          BINT40                                 * 9CEA4
          #=casedrpfls                           * 9CEA9
          BINT25                                 * 9CEAE
          ?CaseRomptr@                           * 9CEB3
          ROMPTR  0E3 05B                        * 9CEB8
          BINT45                                 * 9CEC3
          ?CaseRomptr@                           * 9CEC8
          ROMPTR  0E3 05C                        * 9CECD
          BINT7                                  * 9CED8
          #<case                                 * 9CEDD
          FALSE                                  * 9CEE2
          'DoBadKeyT                             * 9CEE7
        ;                                        * 9CEEC

* ROMPTR 0E3 059
* refs (1): 99FF5
ROMP_0E3_059:
        ::                                       * 9CEF1
          BINT11                                 * 9CEF6
          ?CaseKeyDef                            * 9CEFB
          SCROLLUP                               * 9CF00
          BINT17                                 * 9CF05
          ?CaseKeyDef                            * 9CF0A
          SCROLLDOWN                             * 9CF0F
          BINT16                                 * 9CF14
          ?CaseKeyDef                            * 9CF19
          SCROLLLEFT                             * 9CF1E
          BINT18                                 * 9CF23
          ?CaseKeyDef                            * 9CF28
          SCROLLRIGHT                            * 9CF2D
          BINT40                                 * 9CF32
          #=casedrpfls                           * 9CF37
          BINT25                                 * 9CF3C
          ?CaseRomptr@                           * 9CF41
          ROMPTR  0E3 05B                        * 9CF46
          BINT45                                 * 9CF51
          ?CaseRomptr@                           * 9CF56
          ROMPTR  0E3 05C                        * 9CF5B
          BINT7                                  * 9CF66
          #<case                                 * 9CF6B
          FALSE                                  * 9CF70
          'DoBadKeyT                             * 9CF75
        ;                                        * 9CF7A

* ROMPTR 0E3 05A
* refs (1): 99FF5
ROMP_0E3_05A:
        ::                                       * 9CF7F
          BINT11                                 * 9CF84
          ?CaseKeyDef                            * 9CF89
          JUMPTOP                                * 9CF8E
          BINT17                                 * 9CF93
          ?CaseKeyDef                            * 9CF98
          JUMPBOT                                * 9CF9D
          BINT16                                 * 9CFA2
          ?CaseKeyDef                            * 9CFA7
          JUMPLEFT                               * 9CFAC
          BINT18                                 * 9CFB1
          ?CaseKeyDef                            * 9CFB6
          JUMPRIGHT                              * 9CFBB
          BINT45                                 * 9CFC0
          #=casedrpfls                           * 9CFC5
          DROP                                   * 9CFCA
          'DoBadKeyT                             * 9CFCF
        ;                                        * 9CFD4

* ROMPTR 0E3 05B
* refs (1): 99FF5
ROMP_0E3_05B:
        ::                                       * 9CFD9
          TakeOver                               * 9CFDE
          ROMPTR  0E3 04F                        * 9CFE3
          CARCOMP                                * 9CFEE
          COLA_EVAL                              * 9CFF3
        ;                                        * 9CFF8
