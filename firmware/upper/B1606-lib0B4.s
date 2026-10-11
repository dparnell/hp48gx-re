* HP 48GX ROM revision R, #B1606-#B4B31: Library part 0B4
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #B1606 in the original ROM).
        RPL

* ROMPTR 0B4 1BC
* refs (1): A2437
ROMP_0B4_1BC:
        ::                                       * B1606
          {                                      * B160B
            BINT40                               * B1610
            ::                                   * B1615
              LAM     'RF                        * B161A
              ROMPTR  0B5 112                    * B1627
              DUPNULLCOMP?                       * B1632
              ITE                                * B1637
              BINT0                              * B163C
              BINT1                              * B1641
            ;                                    * B1646
            BINT43                               * B164B
            ::                                   * B1650
              ROMPTR  0B4 1BD                    * B1655
              TRUE                               * B1660
            ;                                    * B1665
          }                                      * B166A
          EQLookup                               * B166F
          case                                   * B1674
          ::                                     * B1679
            EVAL                                 * B167E
            TRUE                                 * B1683
          ;                                      * B1688
          DROPFALSE                              * B168D
        ;                                        * B1692

* ROMPTR 0B4 1BD
* refs (1): A2437
ROMP_0B4_1BD:
        {                                        * B1697
          $       "\\"                           * B169C
          NullMenuKey                            * B16A8
          NullMenuKey                            * B16AD
          NullMenuKey                            * B16B2
        }                                        * B16B7

* ROMPTR 0B4 1BE
* refs (1): A2437
ROMP_0B4_1BE:
        ::                                       * B16BC
          BINT7                                  * B16C1
          #=casedrop                             * B16C6
          ::                                     * B16CB
            ROMPTR  0B4 1A7                      * B16D0
            ROMPTR  0B4 1C0                      * B16DB
            NOT                                  * B16E6
            OR                                   * B16EB
          ;                                      * B16F0
          BINT55                                 * B16F5
          #<>case                                * B16FA
          FALSE                                  * B16FF
          ROMPTR  0B4 1A7                        * B1704
          NOT                                    * B170F
          ROMPTR  0B4 1C0                        * B1714
          AND                                    * B171F
          TRUE                                   * B1724
        ;                                        * B1729

* ROMPTR 0B4 1BF
* refs (1): A2437
ROMP_0B4_1BF:
        ::                                       * B172E
          BINT7                                  * B1733
          #=casedrop                             * B1738
          ::                                     * B173D
            ROMPTR  0B4 1C0                      * B1742
            NOT                                  * B174D
          ;                                      * B1752
          BINT55                                 * B1757
          #<>case                                * B175C
          FALSE                                  * B1761
          ROMPTR  0B4 1C0                        * B1766
          TRUE                                   * B1771
        ;                                        * B1776

* ROMPTR 0B4 1C0
* refs (1): A2437
ROMP_0B4_1C0:
        ::                                       * B177B
          BINT2                                  * B1780
          ROMPTR  0B0 0C5                        * B1785  ~gFldVal
          ROMPTR  0B0 099                        * B1790
        ;                                        * B179B

* ROMPTR 0B4 1C1
* refs (1): A2437
ROMP_0B4_1C1:
        ::                                       * B17A0
          ROMPTR  0B0 0AB                        * B17A5
          #       B917                           * B17B0  47383
          BINT1                                  * B17BA
          BINT10                                 * B17BF
          #       B918                           * B17C4  47384
          BINT1                                  * B17CE
          BINT19                                 * B17D3
          #       B919                           * B17D8  47385
          BINT1                                  * B17E2
          BINT28                                 * B17E7
          #       B91A                           * B17EC  47386
          BINT8                                  * B17F6
          BINT37                                 * B17FB
          #       B91B                           * B1800  47387
          BINT50                                 * B180A
          BINT37                                 * B180F
          #       B91C                           * B1814  47388
          #       5C                             * B181E  92
          BINT37                                 * B1828
          OBJ_38345                              * B182D
          ROMPTR  0B4 1C7                        * B1832
          BINT61                                 * B183D
          BINT8                                  * B1842
          BINT19                                 * B1847
          BINT9                                  * B184C
          BINT12                                 * B1851
          MINUSONE                               * B1856
          BINT33                                 * B185B
          #       B91D                           * B1860  47389
          ROMPTR  0B5 143                        * B186A
          BINT17                                 * B1875
          ROMPTR  0B5 144                        * B187A
          MINUSONE                               * B1885
          OBJ_38345                              * B188A
          ROMPTR  0B4 1C9                        * B188F
          BINT85                                 * B189A
          BINT8                                  * B189F
          BINT13                                 * B18A4
          BINT9                                  * B18A9
          BINT13                                 * B18AE
          {                                      * B18B3
            BINT0                                * B18B8
          }                                      * B18BD
          BINT4                                  * B18C2
          #       B91E                           * B18C7  47390
          ROMPTR  0B5 148                        * B18D1
          BINT4                                  * B18DC
          %0_2A2B4                               * B18E1
          MINUSONE                               * B18E6
          OBJ_38345                              * B18EB
          ROMPTR  0B4 1CA                        * B18F0
          BINT61                                 * B18FB
          BINT17                                 * B1900
          BINT43                                 * B1905
          BINT9                                  * B190A
          BINT12                                 * B190F
          MINUSONE                               * B1914
          BINT17                                 * B1919
          #       B91F                           * B191E  47391
          ROMPTR  0B5 149                        * B1928
          BINT17                                 * B1933
          ROMPTR  0B5 14A                        * B1938
          MINUSONE                               * B1943
          OBJ_38345                              * B1948
          ROMPTR  0B4 1CA                        * B194D
          BINT61                                 * B1958
          BINT26                                 * B195D
          BINT67                                 * B1962
          BINT9                                  * B1967
          BINT12                                 * B196C
          MINUSONE                               * B1971
          BINT17                                 * B1976
          #       B920                           * B197B  47392
          ROMPTR  0B5 14D                        * B1985
          BINT17                                 * B1990
          ROMPTR  0B5 14E                        * B1995
          MINUSONE                               * B19A0
          OBJ_38345                              * B19A5
          ROMPTR  0B4 1CA                        * B19AA
          BINT1                                  * B19B5
          BINT35                                 * B19BA
          BINT6                                  * B19BF
          BINT9                                  * B19C4
          BINT32                                 * B19C9
          MINUSONE                               * B19CE
          MINUSONE                               * B19D3
          #       B921                           * B19D8  47393
          MINUSONE                               * B19E2
          MINUSONE                               * B19E7
          TRUE                                   * B19EC
          MINUSONE                               * B19F1
          OBJ_38345                              * B19F6
          ROMPTR  0B4 1CA                        * B19FB
          BINT43                                 * B1A06
          BINT35                                 * B1A0B
          BINT6                                  * B1A10
          BINT9                                  * B1A15
          BINT32                                 * B1A1A
          MINUSONE                               * B1A1F
          MINUSONE                               * B1A24
          #       B922                           * B1A29  47394
          MINUSONE                               * B1A33
          MINUSONE                               * B1A38
          FALSE                                  * B1A3D
          MINUSONE                               * B1A42
          OBJ_38345                              * B1A47
          ROMPTR  0B4 1CA                        * B1A4C
          BINT85                                 * B1A57
          BINT35                                 * B1A5C
          BINT6                                  * B1A61
          BINT9                                  * B1A66
          BINT32                                 * B1A6B
          MINUSONE                               * B1A70
          MINUSONE                               * B1A75
          #       B923                           * B1A7A  47395
          MINUSONE                               * B1A84
          MINUSONE                               * B1A89
          FALSE                                  * B1A8E
          MINUSONE                               * B1A93
          BINT6                                  * B1A98
          BINT7                                  * B1A9D
          OBJ_38345                              * B1AA2
          ROMPTR  0B4 1C4                        * B1AA7
          #       B916                           * B1AB2  47382
          ROMPTR  0B4 1C2                        * B1ABC
          BINT7                                  * B1AC7
          ROMPTR  0B0 0AA                        * B1ACC
          DoInputForm                            * B1AD7
          NOT?SEMI                               * B1ADC
          ROMPTR  0B4 1C3                        * B1AE1
        ;                                        * B1AEC

* ROMPTR 0B4 1C2
* refs (1): A2437
ROMP_0B4_1C2:
        ::                                       * B1AF1
          ROMPTR  0B5 138                        * B1AF6
          ROMPTR  0B5 13A                        * B1B01
          ROMPTR  0B5 13B                        * B1B0C
          ROMPTR  0B5 13C                        * B1B17
          ROMPTR  0B5 13E                        * B1B22
          ROMPTR  0B5 140                        * B1B2D
        ;                                        * B1B38

* ROMPTR 0B4 1C3
* refs (1): A2437
ROMP_0B4_1C3:
        ::                                       * B1B3D
          ROMPTR  0B5 141                        * B1B42
          ROMPTR  0B5 13F                        * B1B4D
          ROMPTR  0B5 13D                        * B1B58
          ROMPTR  0B0 09C                        * B1B63
          ROMPTR  0B0 09D                        * B1B6E
          COERCE                                 * B1B79
          SWAP                                   * B1B7E
          ROMPTR  0B0 09D                        * B1B83
        ;                                        * B1B8E

* ROMPTR 0B4 1C4
* refs (1): A2437
ROMP_0B4_1C4:
        ::                                       * B1B93
          BINT16                                 * B1B98
          #<>case                                * B1B9D
          FALSE                                  * B1BA2
          ROMPTR  0B4 1C5                        * B1BA7
          TrueTrue                               * B1BB2
        ;                                        * B1BB7

* ROMPTR 0B4 1C5
* refs (1): A2437
ROMP_0B4_1C5:
        {                                        * B1BBC
          {                                      * B1BC1
            ::                                   * B1BC6
              PTR     DirLabel:                  * B1BCB
              $       "FLAG"                     * B1BD0
            ;                                    * B1BE2
            ROMPTR  0B4 1C6                      * B1BE7
          }                                      * B1BF2
          {                                      * B1BF7
            $       "(AN(L"                      * B1BFC
            ROMPTR  0B0 059                      * B1C10  DoKeyCancel
          }                                      * B1C1B
          {                                      * B1C20
            $       "OK"                         * B1C25
            ROMPTR  0B0 05A                      * B1C33  DoKeyOK
          }                                      * B1C3E
        }                                        * B1C43

* ROMPTR 0B4 1C6
* refs (1): A2437
ROMP_0B4_1C6:
        ::                                       * B1C48
          TakeOver                               * B1C4D
          ROMPTR  0B0 0C8                        * B1C52  GetFieldVals
          ROMPTR  0B4 1C3                        * B1C5D
          ROMPTR  0B4 1CF                        * B1C68
          NOTcase                                * B1C73
          SetDA123NoCh                           * B1C78
          ROMPTR  0B4 1C2                        * B1C7D
          ROMPTR  0B0 0D8                        * B1C88
          ::                                     * B1C93
            SetDA1NoCh                           * B1C98
            SetDA2bNoCh                          * B1C9D
            SetDA3NoCh                           * B1CA2
          ;                                      * B1CA7
        ;                                        * B1CAC

* ROMPTR 0B4 1C7
* refs (1): A2437
ROMP_0B4_1C7:
        ::                                       * B1CB1
          BINT47                                 * B1CB6
          OVER                                   * B1CBB
          #<>case                                * B1CC0
          ROMPTR  0B4 1CA                        * B1CC5
          DROP                                   * B1CD0
          ROMPTR  0B4 1C8                        * B1CD5
          TRUE                                   * B1CE0
        ;                                        * B1CE5

* ROMPTR 0B4 1C8
* refs (1): A2437
ROMP_0B4_1C8:
        ::                                       * B1CEA
          ROMPTR  0B4 1CE                        * B1CEF
          case                                   * B1CFA
          ::                                     * B1CFF
            HARDBUFF                             * B1D04
            BINT85                               * B1D09
            BINT8                                * B1D0E
            BINT97                               * B1D13
            BINT17                               * B1D18
            GROB!ZERO                            * B1D1D
            DROP                                 * B1D22
          ;                                      * B1D27
          HARDBUFF                               * B1D2C
          BINT2                                  * B1D31
          ROMPTR  0B0 012                        * B1D36
          DROP                                   * B1D41
          BINT2                                  * B1D46
          ROMPTR  0B0 0A2                        * B1D4B
        ;                                        * B1D56

* ROMPTR 0B4 1C9
* refs (1): A2437
ROMP_0B4_1C9:
        ::                                       * B1D5B
          BINT7                                  * B1D60
          #=casedrop                             * B1D65
          ROMPTR  0B4 1CE                        * B1D6A
          BINT55                                 * B1D75
          OVER                                   * B1D7A
          #<>case                                * B1D7F
          ROMPTR  0B4 1CA                        * B1D84
          DROP                                   * B1D8F
          ROMPTR  0B4 1CE                        * B1D94
          NOT                                    * B1D9F
          TRUE                                   * B1DA4
        ;                                        * B1DA9

* ROMPTR 0B4 1CA
* refs (1): A2437
ROMP_0B4_1CA:
        ::                                       * B1DAE
          BINT8                                  * B1DB3
          #<>case                                * B1DB8
          FALSE                                  * B1DBD
          ROMPTR  0B4 1CB                        * B1DC2
        ;                                        * B1DCD

* ROMPTR 0B4 1CB
* refs (1): A2437
ROMP_0B4_1CB:
        ::                                       * B1DD2
          EditExstCase                           * B1DD7
          FALSE                                  * B1DDC
          2DUP                                   * B1DE1
          Key>U/SKeyOb                           * B1DE6
          {                                      * B1DEB
            ROMP_0A2_006                         * B1DF0
            ::                                   * B1DF5
              TakeOver                           * B1DFA
              BINT3                              * B1DFF
              ROMPTR  0B4 1CC                    * B1E04
            ;                                    * B1E0F
            ROMP_0A3_006                         * B1E14
            ::                                   * B1E19
              TakeOver                           * B1E1E
              BINT4                              * B1E23
              ROMPTR  0B4 1CD                    * B1E28
            ;                                    * B1E33
          }                                      * B1E38
          '                                      * B1E3D
          EQUAL                                  * B1E42
          SWAP                                   * B1E47
          Lookup                                 * B1E4C
          NOTcase                                * B1E51
          DROPFALSE                              * B1E56
          ROTROT2DROP                            * B1E5B
          TrueTrue                               * B1E60
        ;                                        * B1E65

* ROMPTR 0B4 1CC
* refs (1): A2437
ROMP_0B4_1CC:
        ::                                       * B1E6A
          DUP                                    * B1E6F
          ROMPTR  0B0 0C5                        * B1E74  ~gFldVal
          OBJ_72AFA                              * B1E7F
          '                                      * B1E84
          ROMPTR  0B5 14B                        * B1E89
          OBJ_72AFA                              * B1E94
          EQUAL                                  * B1E99
          ITE                                    * B1E9E
          ::                                     * B1EA3
            BINT18                               * B1EA8
            SysITE                               * B1EAD
            ::                                   * B1EB2
              '                                  * B1EB7
              ROMPTR  0B5 14C                    * B1EBC
            ;                                    * B1EC7
            ::                                   * B1ECC
              '                                  * B1ED1
              ROMPTR  0B5 14A                    * B1ED6
            ;                                    * B1EE1
          ;                                      * B1EE6
          ::                                     * B1EEB
            '                                    * B1EF0
            ROMPTR  0B5 14B                      * B1EF5
          ;                                      * B1F00
          OVER                                   * B1F05
          ROMPTR  0B0 0D5                        * B1F0A  ~sFldVal
          ROMPTR  0B0 0A2                        * B1F15
          SetDA123NoCh                           * B1F20
        ;                                        * B1F25

* ROMPTR 0B4 1CD
* refs (1): A2437
ROMP_0B4_1CD:
        ::                                       * B1F2A
          DUP                                    * B1F2F
          ROMPTR  0B0 0C5                        * B1F34  ~gFldVal
          OBJ_72AFA                              * B1F3F
          '                                      * B1F44
          ROMPTR  0B5 14E                        * B1F49
          OBJ_72AFA                              * B1F54
          EQUAL                                  * B1F59
          ITE                                    * B1F5E
          ::                                     * B1F63
            BINT15                               * B1F68
            SysITE                               * B1F6D
            ::                                   * B1F72
              '                                  * B1F77
              ROMPTR  0B5 150                    * B1F7C
            ;                                    * B1F87
            ::                                   * B1F8C
              '                                  * B1F91
              ROMPTR  0B5 14F                    * B1F96
            ;                                    * B1FA1
          ;                                      * B1FA6
          ::                                     * B1FAB
            '                                    * B1FB0
            ROMPTR  0B5 14E                      * B1FB5
          ;                                      * B1FC0
          OVER                                   * B1FC5
          ROMPTR  0B0 0D5                        * B1FCA  ~sFldVal
          ROMPTR  0B0 0A2                        * B1FD5
          SetDA123NoCh                           * B1FE0
        ;                                        * B1FE5

* ROMPTR 0B4 1CE
* refs (1): A2437
ROMP_0B4_1CE:
        ::                                       * B1FEA
          BINT1                                  * B1FEF
          ROMPTR  0B0 0C5                        * B1FF4  ~gFldVal
          OBJ_72AFA                              * B1FFF
          ROMPTR  0B5 144                        * B2004
          OBJ_72AFA                              * B200F
          EQUAL                                  * B2014
        ;                                        * B2019

* ROMPTR 0B4 1CF
* refs (1): A2437
ROMP_0B4_1CF:
        ::                                       * B201E
          TakeOver                               * B2023
          NULL{}                                 * B2028
          {                                      * B202D
            LAM     'F                           * B2032
          }                                      * B203D
          BIND                                   * B2042
          OBJ_38345                              * B2047
          ROMPTR  0B4 1D0                        * B204C
          #       B935                           * B2057  47413
          OBJ_38345                              * B2061
          ROMPTR  0B5 157                        * B2066
          NULL{}                                 * B2071
          BINT1                                  * B2076
          ROMPTR  0B3 000                        * B207B  ~Choose
          NOTcase                                * B2086
          ::                                     * B208B
            ABND                                 * B2090
            FALSE                                * B2095
          ;                                      * B209A
          DROP                                   * B209F
          LAM     'F                             * B20A4
          ABND                                   * B20AF
          DUPLENCOMP                             * B20B4
          #0=                                    * B20B9
          casedrop                               * B20BE
          FALSE                                  * B20C3
          INNERCOMP                              * B20C8
          #2/                                    * B20CD
          ZERO_DO                                * B20D2
          ISTOP-INDEX                            * B20D7
          #2*                                    * B20DC
          ROLL                                   * B20E1
          ISTOP-INDEX                            * B20E6
          #2*                                    * B20EB
          ROLL                                   * B20F0
          ITE                                    * B20F5
          SetSysFlag                             * B20FA
          ClrSysFlag                             * B20FF
          LOOP                                   * B2104
          TRUE                                   * B2109
        ;                                        * B210E

* ROMPTR 0B4 1D0
* refs (1): A2437
ROMP_0B4_1D0:
        ::                                       * B2113
          {                                      * B2118
            BINT60                               * B211D
            TRUE                                 * B2122
            BINT62                               * B2127
            ROMPTR  0B5 155                      * B212C
            OBJ_64C34                            * B2137
            ROMPTR  0B5 156                      * B213C
            BINT81                               * B2147
            ROMPTR  0B4 1D2                      * B214C
            BINT83                               * B2157
            ::                                   * B215C
              '                                  * B2161
              ROMPTR  0B4 1D3                    * B2166
            ;                                    * B2171
          }                                      * B2176
          EQLookup                               * B217B
          case                                   * B2180
          ::                                     * B2185
            EVAL                                 * B218A
            TRUE                                 * B218F
          ;                                      * B2194
          DROPFALSE                              * B2199
        ;                                        * B219E

* ROMPTR 0B4 1D2
* refs (2): A2437 A2437
ROMP_0B4_1D2:
        ::                                       * B21A3
          ROMPTR  0B5 156                        * B21A8
          DUP                                    * B21B3
          ROMPTR  0B4 1D5                        * B21B8
          SWAP                                   * B21C3
          KEYINBUFFER?                           * B21C8
          ITE                                    * B21CD
          ::                                     * B21D2
            DROPNULL$                            * B21D7
            _chr(31)_                            * B21DC
            SetDA2bBad                           * B21E1
          ;                                      * B21E6
          ::                                     * B21EB
            ROMPTR  0B5 157                      * B21F0
            DUP                                  * B21FB
            BINT1                                * B2200
            BINT2                                * B2205
            SUB$                                 * B220A
            SWAP                                 * B220F
            BINT4                                * B2214
            OVERLEN$                             * B2219
            SUB$                                 * B221E
          ;                                      * B2223
          $>GROB                                 * B2228
          SWAP                                   * B222D
          $>grob                                 * B2232
          7GETLAM                                * B2237
          8GETLAM                                * B223C
          MAKEGROB                               * B2241
          4ROLL                                  * B2246
          IT                                     * B224B
          ::                                     * B2250
            ROMPTR  0B0 07E                      * B2255
            OVER                                 * B2260
            ZEROZERO                             * B2265
            GROB!                                * B226A
          ;                                      * B226F
          DUPUNROT                               * B2274
          BINT7                                  * B2279
          BINT2                                  * B227E
          GROB!                                  * B2283
          DUPUNROT                               * B2288
          BINT20                                 * B228D
          BINT1                                  * B2292
          GROB!                                  * B2297
        ;                                        * B229C

* ROMPTR 0B4 1D3
* refs (1): A2437
ROMP_0B4_1D3:
        ::                                       * B22A1
          NoExitAction                           * B22A6
          {                                      * B22AB
            NullMenuKey                          * B22B0
            NullMenuKey                          * B22B5
            {                                    * B22BA
              ::                                 * B22BF
                TakeOver                         * B22C4
                ROMPTR  0B0 086                  * B22C9  ~grobCheckKey
              ;                                  * B22D4
              ROMPTR  0B4 1D4                    * B22D9
            }                                    * B22E4
            NullMenuKey                          * B22E9
            {                                    * B22EE
              $       "(AN(L"                    * B22F3
              ROMPTR  0B3 02D                    * B2307  DoCKeyCancel
            }                                    * B2312
            {                                    * B2317
              $       "OK"                       * B231C
              ROMPTR  0B3 02E                    * B232A  DoCKeyOK
            }                                    * B2335
          }                                      * B233A
        ;                                        * B233F

* ROMPTR 0B4 1D4
* refs (1): A2437
ROMP_0B4_1D4:
        ::                                       * B2344
          TakeOver                               * B2349
          18GETLAM                               * B234E
          ROMPTR  0B3 03F                        * B2353  ~BBGetN
          DUP                                    * B235E
          ROMPTR  0B4 1D5                        * B2363
          NOT                                    * B236E
          SWAP                                   * B2373
          ROMPTR  0B4 1D6                        * B2378
          18GETLAM                               * B2383
          6GETLAM                                * B2388
          ROMPTR  0B3 036                        * B238D  LEDispItem
          SetDA123NoCh                           * B2398
        ;                                        * B239D

* ROMPTR 0B4 1D5
* refs (1): A2437
ROMP_0B4_1D5:
        ::                                       * B23A2
          LAM     'F                             * B23A7
          OBJ_19FE4                              * B23B2
          ?SEMI                                  * B23B7
          TestSysFlag                            * B23BC
        ;                                        * B23C1

* ROMPTR 0B4 1D6
* refs (1): A2437
ROMP_0B4_1D6:
        ::                                       * B23C6
          LAM     'F                             * B23CB
          OVER                                   * B23D6
          '                                      * B23DB
          #=                                     * B23E0
          POSCOMP                                * B23E5
          DUP#0=                                 * B23EA
          casedrop                               * B23EF
          ::                                     * B23F4
            SWAP                                 * B23F9
            TWO{}N                               * B23FE
            LAM     'F                           * B2403
            SWAP                                 * B240E
            &COMP                                * B2413
            '                                    * B2418
            LAM     'F                           * B241D
            STO                                  * B2428
          ;                                      * B242D
          SWAPDROP                               * B2432
          #1+                                    * B2437
          LAM     'F                             * B243C
          PUTLIST                                * B2447
          '                                      * B244C
          LAM     'F                             * B2451
          STO                                    * B245C
        ;                                        * B2461

* ROMPTR 0B4 1D7
* refs (1): A2437
ROMP_0B4_1D7:
        ::                                       * B2466
          ROMPTR  0B0 0AB                        * B246B
          TRUE                                   * B2476
          #       B982                           * B247B  47490
          TRUE                                   * B2485
          MINUSONE                               * B248A
          TRUE                                   * B248F
          ROMPTR  0B4 1D8                        * B2494
          caseDROP                               * B249F
        ;                                        * B24A4

* ROMPTR 0B4 1D8
* refs (1): A2437
ROMP_0B4_1D8:
        ::                                       * B24A9
          SWAP                                   * B24AE
          DUPTYPELIST?                           * B24B3
          ?SKIP                                  * B24B8
          ONE{}N                                 * B24BD
          ZEROZERO                               * B24C2
          {                                      * B24C7
            LAM     'V                           * B24CC
            LAM     'P                           * B24D7
            LAM     'p                           * B24E2
            LAM     'R                           * B24ED
            LAM     'O                           * B24F8
            LAM     'B                           * B2503
            LAM     'E                           * B250E
          }                                      * B2519
          BIND                                   * B251E
          OBJ_38345                              * B2523
          ROMPTR  0B4 1D9                        * B2528
          SPACE$                                 * B2533
          OBJ_38345                              * B2538
          ROMPTR  0B5 15D                        * B253D
          NULL{}                                 * B2548
          BINT1                                  * B254D
          ROMPTR  0B3 000                        * B2552  ~Choose
          NOTcase                                * B255D
          ::                                     * B2562
            ABND                                 * B2567
            FALSE                                * B256C
          ;                                      * B2571
          LAM     'R                             * B2576
          ABND                                   * B2581
          NOTcase                                * B2586
          ::                                     * B258B
            DUPTYPELIST?                         * B2590
            NOTcaseTRUE                          * B2595
            DUPLENCOMP                           * B259A
            #1<>                                 * B259F
            caseTRUE                             * B25A4
            INCOMPDROP                           * B25A9
            TRUE                                 * B25AE
          ;                                      * B25B3
          DUPTYPELIST?                           * B25B8
          ?SKIP                                  * B25BD
          ONE{}N                                 * B25C2
          INNERCOMP                              * B25C7
          DUP                                    * B25CC
          1LAMBIND                               * B25D1
          ZERO_DO                                * B25D6
          ISTOP@                                 * B25DB
          ROLL                                   * B25E0
          XEQRCL                                 * B25E5
          LOOP                                   * B25EA
          1GETABND                               * B25EF
          DUP#1=                                 * B25F4
          ITE                                    * B25F9
          DROP                                   * B25FE
          {}N                                    * B2603
          TRUE                                   * B2608
        ;                                        * B260D

* ROMPTR 0B4 1D9
* refs (1): A2437
ROMP_0B4_1D9:
        ::                                       * B2612
          {                                      * B2617
            OBJ_64C34                            * B261C
            ROMPTR  0B4 1E4                      * B2621
            BINT70                               * B262C
            ROMPTR  0B4 1DA                      * B2631
            BINT62                               * B263C
            ::                                   * B2641
              LAM     'O                         * B2646
              ROMPTR  0B5 159                    * B2651
            ;                                    * B265C
            BINT60                               * B2661
            LAM     'V                           * B2666
            BINT61                               * B2671
            LAM     'p                           * B2676
            BINT83                               * B2681
            ::                                   * B2686
              14GETLAM                           * B268B
              ITE                                * B2690
              ::                                 * B2695
                '                                * B269A
                ROMPTR  0B4 1DD                  * B269F
              ;                                  * B26AA
              ::                                 * B26AF
                '                                * B26B4
                ROMPTR  0B4 1DC                  * B26B9
              ;                                  * B26C4
            ;                                    * B26C9
            BINT57                               * B26CE
            ::                                   * B26D3
              14GETLAM                           * B26D8
              ITE                                * B26DD
              BINT6                              * B26E2
              BINT5                              * B26E7
              #1-                                * B26EC
            ;                                    * B26F1
          }                                      * B26F6
          EQLookup                               * B26FB
          case                                   * B2700
          ::                                     * B2705
            EVAL                                 * B270A
            TRUE                                 * B270F
          ;                                      * B2714
          DROPFALSE                              * B2719
        ;                                        * B271E

* ROMPTR 0B4 1DA
* refs (1): A2437
ROMP_0B4_1DA:
        ::                                       * B2723
          LAM     'P                             * B2728
          OBJ_1A002                              * B2733
          PATHDIR                                * B2738
          ROMPTR  0B0 075                        * B273D
          8GETLAM                                * B2748
          ROMPTR  0B3 046                        * B274D
          3PICK                                  * B2758
          ROMPTR  0B0 071                        * B275D
          #-                                     * B2768
          BINT12                                 * B276D
          #-                                     * B2772
          14GETLAM                               * B2777
          ITE                                    * B277C
          BINT8                                  * B2781
          BINT0                                  * B2786
          #-                                     * B278B
          ROMPTR  0B0 070                        * B2790
          ITE                                    * B279B
          SPACE$                                 * B27A0
          $       " { "                          * B27A5
          SWAP&$                                 * B27B5
          &$                                     * B27BA
        ;                                        * B27BF

* ROMPTR 0B4 1DB
* refs (1): A2437
ROMP_0B4_1DB:
        ::                                       * B27C4
          2SWAP                                  * B27C9
          SWAP                                   * B27CE
          ZEROZERO                               * B27D3
          6UNROLL                                * B27D8
          3UNROLL                                * B27DD
          BINT6                                  * B27E2
          CONTEXT@                               * B27E7
          LastNonNull                            * B27EC
          NOTcase                                * B27F1
          ::                                     * B27F6
            7DROP                                * B27FB
            BINT0                                * B2800
          ;                                      * B2805
          BEGIN                                  * B280A
          ::                                     * B280F
            ?ATTNQUIT                            * B2814
            DUPUNROT                             * B2819
            RAM-WORDNAME                         * B281E
            5PICK                                * B2823
            EVAL                                 * B2828
            ITE                                  * B282D
            ::                                   * B2832
              6ROLL                              * B2837
              #1+                                * B283C
              6UNROLL                            * B2841
              6PICK                              * B2846
              BINT9                              * B284B
              PICK                               * B2850
              #<                                 * B2855
              caseDROP                           * B285A
              6PICK                              * B285F
              8PICK                              * B2864
              #>                                 * B2869
              NOTcase                            * B286E
              psh1&rev                           * B2873
              2DROP                              * B2878
              RDROP                              * B287D
              FALSE                              * B2882
            ;                                    * B2887
            DROP                                 * B288C
            SWAP                                 * B2891
            PrevNonNull                          * B2896
          ;                                      * B289B
          NOT_UNTIL                              * B28A0
          6DROP                                  * B28A5
        ;                                        * B28AA

* ROMPTR 0B4 1DC
* refs (1): A2437
ROMP_0B4_1DC:
        ::                                       * B28AF
          NoExitAction                           * B28B4
          {                                      * B28B9
            NullMenuKey                          * B28BE
            {                                    * B28C3
              $       "CHOOS"                    * B28C8
              ROMPTR  0B4 1E0                    * B28DC
            }                                    * B28E7
            {                                    * B28EC
              ::                                 * B28F1
                TakeOver                         * B28F6
                ROMPTR  0B3 05B                  * B28FB  ~BBEmpty?
                16GETLAM                         * B2906
                NOT                              * B290B
                OR                               * B2910
                ITE                              * B2915
                NULL$                            * B291A
                ROMPTR  0B0 086                  * B291F  ~grobCheckKey
              ;                                  * B292A
              {                                  * B292F
                ROMPTR  0B3 02A                  * B2934  DoCKeyCheck
                ROMPTR  0B3 02B                  * B293F  DoCKeyChAll
                ROMPTR  0B3 02C                  * B294A  DoCKeyUnChAll
              }                                  * B2955
            }                                    * B295A
            {                                    * B295F
              ::                                 * B2964
                PTR     DirLabel:                * B2969
                $       "NEW"                    * B296E
              ;                                  * B297E
              ROMPTR  0B4 1E5                    * B2983
            }                                    * B298E
            {                                    * B2993
              $       "(AN(L"                    * B2998
              ROMPTR  0B3 02D                    * B29AC  DoCKeyCancel
            }                                    * B29B7
            {                                    * B29BC
              $       "OK"                       * B29C1
              ROMPTR  0B3 02E                    * B29CF  DoCKeyOK
            }                                    * B29DA
          }                                      * B29DF
        ;                                        * B29E4

* ROMPTR 0B4 1DD
* refs (1): A2437
ROMP_0B4_1DD:
        ::                                       * B29E9
          NoExitAction                           * B29EE
          {                                      * B29F3
            {                                    * B29F8
              ::                                 * B29FD
                TakeOver                         * B2A02
                ROMPTR  0B3 05B                  * B2A07  ~BBEmpty?
                ITE                              * B2A12
                NULL$                            * B2A17
                ::                               * B2A1C
                  PTR     DirLabel:              * B2A21
                  $       "EDIT"                 * B2A26
                ;                                * B2A38
              ;                                  * B2A3D
              ROMPTR  0B4 1DE                    * B2A42
            }                                    * B2A4D
            {                                    * B2A52
              $       "CHOOS"                    * B2A57
              ROMPTR  0B4 1E0                    * B2A6B
            }                                    * B2A76
            {                                    * B2A7B
              ::                                 * B2A80
                TakeOver                         * B2A85
                ROMPTR  0B3 05B                  * B2A8A  ~BBEmpty?
                16GETLAM                         * B2A95
                NOT                              * B2A9A
                OR                               * B2A9F
                ITE                              * B2AA4
                NULL$                            * B2AA9
                ROMPTR  0B0 086                  * B2AAE  ~grobCheckKey
              ;                                  * B2AB9
              {                                  * B2ABE
                ROMPTR  0B3 02A                  * B2AC3  DoCKeyCheck
                ROMPTR  0B3 02B                  * B2ACE  DoCKeyChAll
                ROMPTR  0B3 02C                  * B2AD9  DoCKeyUnChAll
              }                                  * B2AE4
            }                                    * B2AE9
            {                                    * B2AEE
              ::                                 * B2AF3
                PTR     DirLabel:                * B2AF8
                $       "NEW"                    * B2AFD
              ;                                  * B2B0D
              ROMPTR  0B4 1E5                    * B2B12
            }                                    * B2B1D
            {                                    * B2B22
              ::                                 * B2B27
                TakeOver                         * B2B2C
                ROMPTR  0B3 05B                  * B2B31  ~BBEmpty?
                ITE                              * B2B3C
                NULL$                            * B2B41
                ::                               * B2B46
                  PTR     DirLabel:              * B2B4B
                  $       "COPY"                 * B2B50
                ;                                * B2B62
              ;                                  * B2B67
              ROMPTR  0B4 1EE                    * B2B6C
            }                                    * B2B77
            {                                    * B2B7C
              ::                                 * B2B81
                TakeOver                         * B2B86
                ROMPTR  0B3 05B                  * B2B8B  ~BBEmpty?
                ITE                              * B2B96
                NULL$                            * B2B9B
                ::                               * B2BA0
                  PTR     DirLabel:              * B2BA5
                  $       "MOVE"                 * B2BAA
                ;                                * B2BBC
              ;                                  * B2BC1
              ROMPTR  0B4 1F3                    * B2BC6
            }                                    * B2BD1
            {                                    * B2BD6
              ::                                 * B2BDB
                TakeOver                         * B2BE0
                ROMPTR  0B3 05B                  * B2BE5  ~BBEmpty?
                ITE                              * B2BF0
                NULL$                            * B2BF5
                $       "RCL"                    * B2BFA
              ;                                  * B2C0A
              ROMPTR  0B4 1ED                    * B2C0F
            }                                    * B2C1A
            {                                    * B2C1F
              ::                                 * B2C24
                TakeOver                         * B2C29
                ROMPTR  0B3 05B                  * B2C2E  ~BBEmpty?
                ITE                              * B2C39
                NULL$                            * B2C3E
                $       "PURG"                   * B2C43
              ;                                  * B2C55
              ROMPTR  0B4 1F6                    * B2C5A
            }                                    * B2C65
            {                                    * B2C6A
              $       "SIZE"                     * B2C6F
              ROMPTR  0B4 1F7                    * B2C81
            }                                    * B2C8C
            NullMenuKey                          * B2C91
            {                                    * B2C96
              $       "(AN(L"                    * B2C9B
              ROMPTR  0B3 02D                    * B2CAF  DoCKeyCancel
            }                                    * B2CBA
            {                                    * B2CBF
              $       "OK"                       * B2CC4
              ROMPTR  0B3 02E                    * B2CD2  DoCKeyOK
            }                                    * B2CDD
          }                                      * B2CE2
        ;                                        * B2CE7

* ROMPTR 0B4 1DE
* refs (1): A2437
ROMP_0B4_1DE:
        ::                                       * B2CEC
          TakeOver                               * B2CF1
          ROMPTR  0B3 05B                        * B2CF6  ~BBEmpty?
          case                                   * B2D01
          DoBadKey                               * B2D06
          18GETLAM                               * B2D0B
          ROMPTR  0B3 03F                        * B2D10  ~BBGetN
          ROMPTR  0B4 1DF                        * B2D1B
          DROP                                   * B2D26
        ;                                        * B2D2B

* ROMPTR 0B4 1DF
* refs (1): A2437
ROMP_0B4_1DF:
        ::                                       * B2D30
          1LAMBIND                               * B2D35
          #       B984                           * B2D3A  47492
          BINT1                                  * B2D44
          BINT19                                 * B2D49
          'DROPFALSE                             * B2D4E
          BINT31                                 * B2D53
          BINT17                                 * B2D58
          BINT97                                 * B2D5D
          BINT9                                  * B2D62
          BINT21                                 * B2D67
          MINUSONE                               * B2D6C
          BINT4                                  * B2D71
          #       B985                           * B2D76  47493
          #       B986                           * B2D80  47494
          MINUSONE                               * B2D8A
          1GETLAM                                * B2D8F
          XEQRCL                                 * B2D94
          DUP                                    * B2D99
          ONEONE                                 * B2D9E
          'DROPFALSE                             * B2DA3
          #       B983                           * B2DA8  47491
          DoInputForm                            * B2DB2
          NOTcase                                * B2DB7
          ::                                     * B2DBC
            ABND                                 * B2DC1
            FALSE                                * B2DC6
          ;                                      * B2DCB
          1GETABND                               * B2DD0
          ROMPTR  0B5 15C                        * B2DD5
          TRUE                                   * B2DE0
        ;                                        * B2DE5

* ROMPTR 0B4 1E0
* refs (1): A2437
ROMP_0B4_1E0:
        ::                                       * B2DEA
          TakeOver                               * B2DEF
          ROMPTR  0B4 1E1                        * B2DF4
          NOT?SEMI                               * B2DFF
          COMPEVAL                               * B2E04
          0LASTOWDOB!                            * B2E09
          ZEROZERO                               * B2E0E
          '                                      * B2E13
          LAM     'B                             * B2E18
          STOLAM                                 * B2E23
          '                                      * B2E28
          LAM     'E                             * B2E2D
          STOLAM                                 * B2E38
          ROMPTR  0B3 03E                        * B2E3D  ~BBReReadNElems
          ROMPTR  0B3 026                        * B2E48  ~BBReReadWidth
          BINT1                                  * B2E53
          12GETLAM                               * B2E58
          #MIN                                   * B2E5D
          18PUTLAM                               * B2E62
          FALSE                                  * B2E67
          ROMPTR  0B3 019                        * B2E6C  ~BBRecalOff&Disp
          NULL{}                                 * B2E77
          15PUTLAM                               * B2E7C
          OBJ_1A03E                              * B2E81
        ;                                        * B2E86

* ROMPTR 0B4 1E1
* refs (1): A2437
ROMP_0B4_1E1:
        ::                                       * B2E8B
          OBJ_38345                              * B2E90
          ROMPTR  0B4 1E2                        * B2E95
          #       B987                           * B2EA0  47495
          OBJ_38345                              * B2EAA
          ROMPTR  0B5 163                        * B2EAF
          NULL{}                                 * B2EBA
          ROMPTR  0B5 15E                        * B2EBF
          OVER                                   * B2ECA
          4UNROLL                                * B2ECF
          {                                      * B2ED4
            LAM     'TD                          * B2ED9
            LAM     'TN                          * B2EE6
            LAM     'DC                          * B2EF3
          }                                      * B2F00
          BIND                                   * B2F05
          ROMPTR  0B3 000                        * B2F0A  ~Choose
          ABND                                   * B2F15
          SetDA123NoCh                           * B2F1A
          NOTcaseFALSE                           * B2F1F
          NULL{}                                 * B2F24
          SWAP                                   * B2F29
          ::                                     * B2F2E
            GOTO                                 * B2F33
            L_1849B                              * B2F38
          ;                                      * B2F3D
          TRUE                                   * B2F42
        ;                                        * B2F47

* ROMPTR 0B4 1E2
* refs (1): A2437
ROMP_0B4_1E2:
        ::                                       * B2F4C
          {                                      * B2F51
            OBJ_64C34                            * B2F56
            ROMPTR  0B4 1E3                      * B2F5B
            BINT62                               * B2F66
            LAM     'DC                          * B2F6B
          }                                      * B2F78
          EQLookup                               * B2F7D
          case                                   * B2F82
          ::                                     * B2F87
            EVAL                                 * B2F8C
            TRUE                                 * B2F91
          ;                                      * B2F96
          DROPFALSE                              * B2F9B
        ;                                        * B2FA0

* ROMPTR 0B4 1E3
* refs (1): A2437
ROMP_0B4_1E3:
        ::                                       * B2FA5
          LAM     'TN                            * B2FAA
          #=casedrop                             * B2FB7
          ::                                     * B2FBC
            '                                    * B2FC1
            LAM     'TD                          * B2FC6
            undo                                 * B2FD3
            DROP                                 * B2FD8
          ;                                      * B2FDD
          DUP#1=                                 * B2FE2
          case                                   * B2FE7
          ::                                     * B2FEC
            '                                    * B2FF1
            LAM     'TN                          * B2FF6
            STOLAM                               * B3003
            BINT0                                * B3008
            ROMPTR  0B5 161                      * B300D
            DUP                                  * B3018
            '                                    * B301D
            LAM     'TD                          * B3022
            STOLAM                               * B302F
          ;                                      * B3034
          '                                      * B3039
          LAM     'TD                            * B303E
          undo                                   * B304B
          DROP                                   * B3050
          SWAP                                   * B3055
          LAM     'TN                            * B305A
          OVER                                   * B3067
          '                                      * B306C
          LAM     'TN                            * B3071
          STOLAM                                 * B307E
          2DUP                                   * B3083
          #>                                     * B3088
          ITE                                    * B308D
          ::                                     * B3092
            #-                                   * B3097
            ROMPTR  0B5 15F                      * B309C
          ;                                      * B30A7
          ::                                     * B30AC
            SWAP#-                               * B30B1
            ROMPTR  0B5 161                      * B30B6
          ;                                      * B30C1
          DUP                                    * B30C6
          '                                      * B30CB
          LAM     'TD                            * B30D0
          STOLAM                                 * B30DD
        ;                                        * B30E2

* ROMPTR 0B4 1E4
* refs (1): A2437
ROMP_0B4_1E4:
        ::                                       * B30E7
          DUP                                    * B30EC
          LAM     'B                             * B30F1
          #<                                     * B30FC
          OVER                                   * B3101
          LAM     'E                             * B3106
          #>                                     * B3111
          OR                                     * B3116
          IT                                     * B311B
          ::                                     * B3120
            DUPDUP                               * B3125
            11GETLAM                             * B312A
            #+                                   * B312F
            #1-                                  * B3134
            12GETLAM                             * B3139
            #MIN                                 * B313E
            2DUP                                 * B3143
            '                                    * B3148
            LAM     'E                           * B314D
            STOLAM                               * B3158
            '                                    * B315D
            LAM     'B                           * B3162
            STOLAM                               * B316D
            LAM     'O                           * B3172
            '                                    * B317D
            ROMPTR  0B5 15A                      * B3182
            4ROLL                                * B318D
            4ROLL                                * B3192
            ROMPTR  0B4 1DB                      * B3197
            {}N                                  * B31A2
            19PUTLAM                             * B31A7
          ;                                      * B31AC
          LAM     'B                             * B31B1
          #-                                     * B31BC
          #1+                                    * B31C1
          19GETLAM                               * B31C6
          SWAP                                   * B31CB
          OBJ_1A01B                              * B31D0
          OBJ_1A002                              * B31D5
        ;                                        * B31DA

* ROMPTR 0B4 1E5
* refs (1): A2437
ROMP_0B4_1E5:
        ::                                       * B31DF
          TakeOver                               * B31E4
          ROMPTR  0B4 1E6                        * B31E9
          NOT?SEMI                               * B31F4
          ZEROZERO                               * B31F9
          '                                      * B31FE
          LAM     'B                             * B3203
          STOLAM                                 * B320E
          '                                      * B3213
          LAM     'E                             * B3218
          STOLAM                                 * B3223
          ROMPTR  0B3 03E                        * B3228  ~BBReReadNElems
          ROMPTR  0B3 026                        * B3233  ~BBReReadWidth
          BINT1                                  * B323E
          18PUTLAM                               * B3243
          FALSE                                  * B3248
          ROMPTR  0B3 019                        * B324D  ~BBRecalOff&Disp
          NULL{}                                 * B3258
          15PUTLAM                               * B325D
        ;                                        * B3262

* ROMPTR 0B4 1E6
* refs (1): A2437
ROMP_0B4_1E6:
        ::                                       * B3267
          #       B984                           * B326C  47492
          BINT1                                  * B3276
          BINT10                                 * B327B
          #       B989                           * B3280  47497
          BINT1                                  * B328A
          BINT19                                 * B328F
          #       B98A                           * B3294  47498
          BINT8                                  * B329E
          BINT28                                 * B32A3
          OBJ_38345                              * B32A8
          ROMPTR  0B4 1E9                        * B32AD
          BINT31                                 * B32B8
          BINT8                                  * B32BD
          BINT97                                 * B32C2
          BINT9                                  * B32C7
          BINT21                                 * B32CC
          MINUSONE                               * B32D1
          BINT4                                  * B32D6
          #       B985                           * B32DB  47493
          #       B986                           * B32E5  47494
          MINUSONE                               * B32EF
          MINUSONE                               * B32F4
          MINUSONE                               * B32F9
          'DROPFALSE                             * B32FE
          BINT31                                 * B3303
          BINT17                                 * B3308
          BINT49                                 * B330D
          BINT9                                  * B3312
          BINT1                                  * B3317
          {                                      * B331C
            BINT6                                * B3321
          }                                      * B3326
          BINT4                                  * B332B
          #       B98B                           * B3330  47499
          MINUSONE                               * B333A
          MINUSONE                               * B333F
          MINUSONE                               * B3344
          MINUSONE                               * B3349
          OBJ_38345                              * B334E
          ROMPTR  0B4 1EA                        * B3353
          BINT1                                  * B335E
          BINT26                                 * B3363
          BINT6                                  * B3368
          BINT9                                  * B336D
          BINT32                                 * B3372
          MINUSONE                               * B3377
          MINUSONE                               * B337C
          #       B98C                           * B3381  47500
          MINUSONE                               * B338B
          MINUSONE                               * B3390
          FALSE                                  * B3395
          FALSE                                  * B339A
          BINT3                                  * B339F
          DUP                                    * B33A4
          OBJ_38345                              * B33A9
          ROMPTR  0B4 1E7                        * B33AE
          #       B988                           * B33B9  47496
          14GETLAM                               * B33C3
          ?SKIP                                  * B33C8
          ::                                     * B33CD
            HARDBUFF                             * B33D2
            TOTEMPOB                             * B33D7
            1LAMBIND                             * B33DC
          ;                                      * B33E1
          DoInputForm                            * B33E6
          14GETLAM                               * B33EB
          ?SKIP                                  * B33F0
          ::                                     * B33F5
            1GETABND                             * B33FA
            HARDBUFF                             * B33FF
            ZEROZERO                             * B3404
            GROB!                                * B3409
          ;                                      * B340E
          NOTcaseFALSE                           * B3413
          case                                   * B3418
          ::                                     * B341D
            SWAPDROP                             * B3422
            ROMPTR  0B5 162                      * B3427
            TRUE                                 * B3432
          ;                                      * B3437
          ROMPTR  0B5 15C                        * B343C
          TRUE                                   * B3447
        ;                                        * B344C

* ROMPTR 0B4 1E7
* refs (1): A2437
ROMP_0B4_1E7:
        ::                                       * B3451
          BINT5                                  * B3456
          #<>case                                * B345B
          FALSE                                  * B3460
          ROMPTR  0B4 1E8                        * B3465
          TRUE                                   * B3470
        ;                                        * B3475

* ROMPTR 0B4 1E8
* refs (1): A2437
ROMP_0B4_1E8:
        ::                                       * B347A
          BINT39                                 * B347F
          BINT131                                * B3484
          MAKEGROB                               * B3489
          ROMPTR  0B4 1EC                        * B348E
          ?SKIP                                  * B3499
          ::                                     * B349E
            BINT1                                * B34A3
            ROMPTR  0B0 012                      * B34A8
          ;                                      * B34B3
          BINT2                                  * B34B8
          ROMPTR  0B0 012                        * B34BD
          BINT1                                  * B34C8
          ROMPTR  0B0 079                        * B34CD
          IT                                     * B34D8
          ::                                     * B34DD
            BINT3                                * B34E2
            ROMPTR  0B0 012                      * B34E7
          ;                                      * B34F2
          FALSE                                  * B34F7
        ;                                        * B34FC

* ROMPTR 0B4 1E9
* refs (1): A2437
ROMP_0B4_1E9:
        ::                                       * B3501
          BINT7                                  * B3506
          #=casedrop                             * B350B
          ROMPTR  0B4 1EC                        * B3510
          {                                      * B351B
            BINT55                               * B3520
            ::                                   * B3525
              ROMPTR  0B4 1EC                    * B352A
              NOT                                * B3535
            ;                                    * B353A
            BINT47                               * B353F
            ROMPTR  0B4 1EB                      * B3544
          }                                      * B354F
          EQLookup                               * B3554
          case                                   * B3559
          ::                                     * B355E
            EVAL                                 * B3563
            TRUE                                 * B3568
          ;                                      * B356D
          DROPFALSE                              * B3572
        ;                                        * B3577

* ROMPTR 0B4 1EA
* refs (1): A2437
ROMP_0B4_1EA:
        ::                                       * B357C
          BINT7                                  * B3581
          #=casedrop                             * B3586
          ::                                     * B358B
            BINT1                                * B3590
            ROMPTR  0B0 079                      * B3595
            NOT                                  * B35A0
          ;                                      * B35A5
          {                                      * B35AA
            BINT55                               * B35AF
            ::                                   * B35B4
              BINT1                              * B35B9
              ROMPTR  0B0 079                    * B35BE
            ;                                    * B35C9
            BINT47                               * B35CE
            ROMPTR  0B4 1EB                      * B35D3
          }                                      * B35DE
          EQLookup                               * B35E3
          case                                   * B35E8
          ::                                     * B35ED
            EVAL                                 * B35F2
            TRUE                                 * B35F7
          ;                                      * B35FC
          DROPFALSE                              * B3601
        ;                                        * B3606

* ROMPTR 0B4 1EB
* refs (1): A2437
ROMP_0B4_1EB:
        ::                                       * B360B
          ROMPTR  0B4 1EC                        * B3610
          case                                   * B361B
          ::                                     * B3620
            BINT8                                * B3625
            BINT9                                * B362A
            BLANKIT                              * B362F
          ;                                      * B3634
          BINT1                                  * B3639
          ROMPTR  0B0 079                        * B363E
          NOTcase                                * B3649
          ::                                     * B364E
            BINT26                               * B3653
            BINT9                                * B3658
            BLANKIT                              * B365D
          ;                                      * B3662
          HARDBUFF                               * B3667
          BINT1                                  * B366C
          ROMPTR  0B0 012                        * B3671
          DROP                                   * B367C
          BINT1                                  * B3681
          ROMPTR  0B0 0A2                        * B3686
          HARDBUFF                               * B3691
          BINT3                                  * B3696
          ROMPTR  0B0 012                        * B369B
          DROP                                   * B36A6
          BINT3                                  * B36AB
          ROMPTR  0B0 0A2                        * B36B0
        ;                                        * B36BB

* ROMPTR 0B4 1EC
* refs (1): A2437
ROMP_0B4_1EC:
        ::                                       * B36C0
          BINT3                                  * B36C5
          ROMPTR  0B0 0C5                        * B36CA  ~gFldVal
        ;                                        * B36D5

* ROMPTR 0B4 1ED
* refs (1): A2437
ROMP_0B4_1ED:
        ::                                       * B36DA
          TakeOver                               * B36DF
          ROMPTR  0B3 05B                        * B36E4  ~BBEmpty?
          case                                   * B36EF
          DoBadKey                               * B36F4
          15GETLAM                               * B36F9
          DUPNULLCOMP?                           * B36FE
          IT                                     * B3703
          ::                                     * B3708
            DROP                                 * B370D
            18GETLAM                             * B3712
            ONE{}N                               * B3717
          ;                                      * B371C
          INNERCOMP                              * B3721
          ZERO_DO                                * B3726
          ISTOP@                                 * B372B
          ROLL                                   * B3730
          ROMPTR  0B3 03F                        * B3735  ~BBGetN
          XEQRCL                                 * B3740
          LOOP                                   * B3745
          SetDA123NoCh                           * B374A
        ;                                        * B374F

* ROMPTR 0B4 1EE
* refs (1): A2437
ROMP_0B4_1EE:
        ::                                       * B3754
          TakeOver                               * B3759
          ROMPTR  0B3 05B                        * B375E  ~BBEmpty?
          case                                   * B3769
          DoBadKey                               * B376E
          15GETLAM                               * B3773
          DUPNULLCOMP?                           * B3778
          IT                                     * B377D
          ::                                     * B3782
            DROP                                 * B3787
            18GETLAM                             * B378C
            ONE{}N                               * B3791
          ;                                      * B3796
          DUPLENCOMP                             * B379B
          #1=                                    * B37A0
          ITE                                    * B37A5
          ::                                     * B37AA
            INCOMPDROP                           * B37AF
            ROMPTR  0B3 03F                      * B37B4  ~BBGetN
          ;                                      * B37BF
          ::                                     * B37C4
            INNERCOMP                            * B37C9
            ZERO_DO                              * B37CE
            ISTOP@                               * B37D3
            ROLL                                 * B37D8
            ROMPTR  0B3 03F                      * B37DD  ~BBGetN
            LOOP                                 * B37E8
            15GETLAM                             * B37ED
            LENCOMP                              * B37F2
            {}N                                  * B37F7
          ;                                      * B37FC
          ROMPTR  0B4 1EF                        * B3801
          NOT?SEMI                               * B380C
          ZEROZERO                               * B3811
          '                                      * B3816
          LAM     'B                             * B381B
          STOLAM                                 * B3826
          '                                      * B382B
          LAM     'E                             * B3830
          STOLAM                                 * B383B
          ROMPTR  0B3 03E                        * B3840  ~BBReReadNElems
          ROMPTR  0B3 026                        * B384B  ~BBReReadWidth
          BINT1                                  * B3856
          18PUTLAM                               * B385B
          FALSE                                  * B3860
          ROMPTR  0B3 019                        * B3865  ~BBRecalOff&Disp
          NULL{}                                 * B3870
          15PUTLAM                               * B3875
        ;                                        * B387A

* ROMPTR 0B4 1EF
* refs (1): A2437
ROMP_0B4_1EF:
        ::                                       * B387F
          #       B989                           * B3884  47497
          BINT1                                  * B388E
          BINT19                                 * B3893
          #       B98E                           * B3898  47502
          BINT1                                  * B38A2
          BINT28                                 * B38A7
          'DROPFALSE                             * B38AC
          BINT37                                 * B38B1
          BINT17                                 * B38B6
          BINT91                                 * B38BB
          BINT9                                  * B38C0
          BINT1                                  * B38C5
          {                                      * B38CA
            BINT6                                * B38CF
            BINT5                                * B38D4
          }                                      * B38D9
          BINT4                                  * B38DE
          #       B98D                           * B38E3  47501
          MINUSONE                               * B38ED
          MINUSONE                               * B38F2
          MINUSONE                               * B38F7
          BINT19                                 * B38FC
          ROLL                                   * B3901

* ROMPTR 0B4 1F0
* refs (1): A2437
ROMP_0B4_1F0:
          ::                                     * B3906
            OBJ_38345                            * B390B
            ROMPTR  0B4 1F2                      * B3910
            BINT37                               * B391B
            BINT26                               * B3920
            BINT91                               * B3925
            BINT9                                * B392A
            BINT5                                * B392F
            {                                    * B3934
              BINT6                              * B3939
              BINT5                              * B393E
            }                                    * B3943
            BINT4                                * B3948
            MINUSONE                             * B394D
            MINUSONE                             * B3952
            MINUSONE                             * B3957
            MINUSONE                             * B395C
            MINUSONE                             * B3961
          ;                                      * B3966
          BINT2                                  * B396B
          DUP                                    * B3970
          OBJ_38345                              * B3975
          ROMPTR  0B4 1F1                        * B397A
          #       B98F                           * B3985  47503
          DoInputForm                            * B398F
          NOTcaseFALSE                           * B3994
          ROMPTR  0B5 164                        * B3999
          TRUE                                   * B39A4
        ;                                        * B39A9

* ROMPTR 0B4 1F1
* refs (1): A2437
ROMP_0B4_1F1:
        ::                                       * B39AE
          BINT14                                 * B39B3
          #<>case                                * B39B8
          FALSE                                  * B39BD
          BINT2                                  * B39C2
          TRUE                                   * B39C7
        ;                                        * B39CC

* ROMPTR 0B4 1F2
* refs (1): A2437
ROMP_0B4_1F2:
        ::                                       * B39D1
          {                                      * B39D6
            BINT37                               * B39DB
            ROMPTR  0B4 1E1                      * B39E0
            BINT13                               * B39EB
            ::                                   * B39F0
              BINT1                              * B39F5
              ROMPTR  0B0 0C5                    * B39FA  ~gFldVal
              TYPELIST?                          * B3A05
              ITE                                * B3A0A
              #       B990                       * B3A0F  47504
              #       B991                       * B3A19  47505
              OBJ_1A002                          * B3A23
            ;                                    * B3A28
          }                                      * B3A2D
          EQLookup                               * B3A32
          case                                   * B3A37
          ::                                     * B3A3C
            EVAL                                 * B3A41
            TRUE                                 * B3A46
          ;                                      * B3A4B
          DROPFALSE                              * B3A50
        ;                                        * B3A55

* ROMPTR 0B4 1F3
* refs (1): A2437
ROMP_0B4_1F3:
        ::                                       * B3A5A
          TakeOver                               * B3A5F
          ROMPTR  0B3 05B                        * B3A64  ~BBEmpty?
          case                                   * B3A6F
          DoBadKey                               * B3A74
          15GETLAM                               * B3A79
          DUPNULLCOMP?                           * B3A7E
          IT                                     * B3A83
          ::                                     * B3A88
            DROP                                 * B3A8D
            18GETLAM                             * B3A92
            ONE{}N                               * B3A97
          ;                                      * B3A9C
          DUPLENCOMP                             * B3AA1
          #1=                                    * B3AA6
          ITE                                    * B3AAB
          ::                                     * B3AB0
            INCOMPDROP                           * B3AB5
            ROMPTR  0B3 03F                      * B3ABA  ~BBGetN
          ;                                      * B3AC5
          ::                                     * B3ACA
            INNERCOMP                            * B3ACF
            ZERO_DO                              * B3AD4
            ISTOP@                               * B3AD9
            ROLL                                 * B3ADE
            ROMPTR  0B3 03F                      * B3AE3  ~BBGetN
            LOOP                                 * B3AEE
            15GETLAM                             * B3AF3
            LENCOMP                              * B3AF8
            {}N                                  * B3AFD
          ;                                      * B3B02
          ROMPTR  0B4 1F4                        * B3B07
          NOT?SEMI                               * B3B12
          ZEROZERO                               * B3B17
          '                                      * B3B1C
          LAM     'B                             * B3B21
          STOLAM                                 * B3B2C
          '                                      * B3B31
          LAM     'E                             * B3B36
          STOLAM                                 * B3B41
          ROMPTR  0B3 03E                        * B3B46  ~BBReReadNElems
          ROMPTR  0B3 026                        * B3B51  ~BBReReadWidth
          BINT1                                  * B3B5C
          18PUTLAM                               * B3B61
          FALSE                                  * B3B66
          ROMPTR  0B3 019                        * B3B6B  ~BBRecalOff&Disp
          NULL{}                                 * B3B76
          15PUTLAM                               * B3B7B
        ;                                        * B3B80

* ROMPTR 0B4 1F4
* refs (1): A2437
ROMP_0B4_1F4:
        ::                                       * B3B85
          #       B989                           * B3B8A  47497
          BINT1                                  * B3B94
          BINT19                                 * B3B99
          #       B992                           * B3B9E  47506
          BINT1                                  * B3BA8
          BINT28                                 * B3BAD
          'DROPFALSE                             * B3BB2
          BINT37                                 * B3BB7
          BINT17                                 * B3BBC
          BINT91                                 * B3BC1
          BINT9                                  * B3BC6
          BINT1                                  * B3BCB
          {                                      * B3BD0
            BINT6                                * B3BD5
            BINT5                                * B3BDA
          }                                      * B3BDF
          BINT4                                  * B3BE4
          #       B993                           * B3BE9  47507
          MINUSONE                               * B3BF3
          MINUSONE                               * B3BF8
          MINUSONE                               * B3BFD
          BINT19                                 * B3C02
          ROLL                                   * B3C07
          ROMPTR  0B4 1F0                        * B3C0C
          BINT2                                  * B3C17
          DUP                                    * B3C1C
          OBJ_38345                              * B3C21
          ROMPTR  0B4 1F5                        * B3C26
          #       B994                           * B3C31  47508
          DoInputForm                            * B3C3B
          NOTcaseFALSE                           * B3C40
          ROMPTR  0B5 167                        * B3C45
          TRUE                                   * B3C50
        ;                                        * B3C55

* ROMPTR 0B4 1F5
* refs (1): A2437
ROMP_0B4_1F5:
        ::                                       * B3C5A
          BINT14                                 * B3C5F
          #<>case                                * B3C64
          FALSE                                  * B3C69
          BINT2                                  * B3C6E
          TRUE                                   * B3C73
        ;                                        * B3C78

* ROMPTR 0B4 1F6
* refs (1): A2437
ROMP_0B4_1F6:
        ::                                       * B3C7D
          TakeOver                               * B3C82
          ROMPTR  0B3 05B                        * B3C87  ~BBEmpty?
          case                                   * B3C92
          DoBadKey                               * B3C97
          15GETLAM                               * B3C9C
          DUPNULLCOMP?                           * B3CA1
          IT                                     * B3CA6
          ::                                     * B3CAB
            DROP                                 * B3CB0
            18GETLAM                             * B3CB5
            ONE{}N                               * B3CBA
          ;                                      * B3CBF
          DUPLENCOMP                             * B3CC4
          #1=                                    * B3CC9
          ITE                                    * B3CCE
          ::                                     * B3CD3
            INCOMPDROP                           * B3CD8
            ROMPTR  0B3 03F                      * B3CDD  ~BBGetN
          ;                                      * B3CE8
          ::                                     * B3CED
            INNERCOMP                            * B3CF2
            ZERO_DO                              * B3CF7
            ISTOP@                               * B3CFC
            ROLL                                 * B3D01
            ROMPTR  0B3 03F                      * B3D06  ~BBGetN
            LOOP                                 * B3D11
            15GETLAM                             * B3D16
            LENCOMP                              * B3D1B
            {}N                                  * B3D20
          ;                                      * B3D25
          ROMPTR  0B5 168                        * B3D2A
          ZEROZERO                               * B3D35
          '                                      * B3D3A
          LAM     'B                             * B3D3F
          STOLAM                                 * B3D4A
          '                                      * B3D4F
          LAM     'E                             * B3D54
          STOLAM                                 * B3D5F
          ROMPTR  0B3 03E                        * B3D64  ~BBReReadNElems
          ROMPTR  0B3 026                        * B3D6F  ~BBReReadWidth
          18GETLAM                               * B3D7A
          12GETLAM                               * B3D7F
          #MIN                                   * B3D84
          18PUTLAM                               * B3D89
          FALSE                                  * B3D8E
          ROMPTR  0B3 019                        * B3D93  ~BBRecalOff&Disp
          NULL{}                                 * B3D9E
          15PUTLAM                               * B3DA3
        ;                                        * B3DA8

* ROMPTR 0B4 1F7
* refs (1): A2437
ROMP_0B4_1F7:
        ::                                       * B3DAD
          TakeOver                               * B3DB2
          ROMPTR  0B3 05B                        * B3DB7  ~BBEmpty?
          ITE                                    * B3DC2
          NULL$                                  * B3DC7
          ::                                     * B3DCC
            15GETLAM                             * B3DD1
            DUPNULLCOMP?                         * B3DD6
            IT                                   * B3DDB
            ::                                   * B3DE0
              DROP                               * B3DE5
              18GETLAM                           * B3DEA
              ONE{}N                             * B3DEF
            ;                                    * B3DF4
            DUPLENCOMP                           * B3DF9
            #1=                                  * B3DFE
            ITE                                  * B3E03
            ::                                   * B3E08
              INCOMPDROP                         * B3E0D
              ROMPTR  0B3 03F                    * B3E12  ~BBGetN
            ;                                    * B3E1D
            ::                                   * B3E22
              INNERCOMP                          * B3E27
              ZERO_DO                            * B3E2C
              ISTOP@                             * B3E31
              ROLL                               * B3E36
              ROMPTR  0B3 03F                    * B3E3B  ~BBGetN
              LOOP                               * B3E46
              15GETLAM                           * B3E4B
              LENCOMP                            * B3E50
              {}N                                * B3E55
            ;                                    * B3E5A
            DUPTYPELIST?                         * B3E5F
            ITE                                  * B3E64
            ::                                   * B3E69
              DUPLENCOMP                         * B3E6E
              #>$                                * B3E73
              #       B995                       * B3E78  47509
              JstGetTHEMESG                      * B3E82
              &$                                 * B3E87
            ;                                    * B3E8C
            ::                                   * B3E91
              DUP                                * B3E96
              ID>$                               * B3E9B
              PTR     CHR_:                      * B3EA0
              >T$                                * B3EA5
            ;                                    * B3EAA
            $       "\0A  "                      * B3EAF
            &$                                   * B3EBF
            SWAP                                 * B3EC4
            ROMPTR  0B5 169                      * B3EC9
            #>$                                  * B3ED4
            &$                                   * B3ED9
            #       B997                         * B3EDE  47511
            JstGetTHEMESG                        * B3EE8
            &$                                   * B3EED
            CHR_Newline                          * B3EF2
            >T$                                  * B3EF7
          ;                                      * B3EFC
          #       B996                           * B3F01  47510
          JstGetTHEMESG                          * B3F0B
          &$                                     * B3F10
          $       "\0A  "                        * B3F15
          &$                                     * B3F25
          ROMPTR  0B5 16A                        * B3F2A
          #>$                                    * B3F35
          &$                                     * B3F3A
          #       B997                           * B3F3F  47511
          JstGetTHEMESG                          * B3F49
          &$                                     * B3F4E
          BINT15                                 * B3F53
          BINT15                                 * B3F58
          MINUSONE                               * B3F5D
          '                                      * B3F62
          ROMPTR  0B1 002                        * B3F67  ~MsgBoxMenu
          ROMPTR  0B1 000                        * B3F72  ~DoMsgBox
          DROP                                   * B3F7D
          SetDA123NoCh                           * B3F82
        ;                                        * B3F87

* ROMPTR 0B4 1F8
* refs (1): A2437
ROMP_0B4_1F8:
        ::                                       * B3F8C
          9rolld                                 * B3F91
          DROP                                   * B3F96
          ROMPTR  0B5 069                        * B3F9B
          DROP                                   * B3FA6
          ROMPTR  0B5 065                        * B3FAB
          ROMPTR  0B5 039                        * B3FB6
          ROMPTR  0B5 035                        * B3FC1
          ROMPTR  0B5 02F                        * B3FCC
          ITE                                    * B3FD7
          ::                                     * B3FDC
            ROMPTR  0B5 02D                      * B3FE1
            DROP                                 * B3FEC
          ;                                      * B3FF1
          ::                                     * B3FF6
            3DROP                                * B3FFB
            ROMPTR  0B5 029                      * B4000
          ;                                      * B400B
        ;                                        * B4010

* ROMPTR 0B4 1F9
* refs (1): A2437
ROMP_0B4_1F9:
        ::                                       * B4015
          BINT25                                 * B401A
          OVER                                   * B401F
          #<>case                                * B4024
          ROMPTR  0B4 008                        * B4029
          DROP                                   * B4034
          4GETLAM                                * B4039
          ROMPTR  0B0 0C5                        * B403E  ~gFldVal
          DUPTYPEEXT?                            * B4049
          3PICK                                  * B404E
          TYPEREAL?                              * B4053
          ANDNOTcase                             * B4058
          DROPTRUE                               * B405D
          UM>U                                   * B4062
          TRUE                                   * B4067
        ;                                        * B406C

* ROMPTR 0B4 1FA
* refs (1): A2437
ROMP_0B4_1FA:
        ::                                       * B4071
          TakeOver                               * B4076
          ROMPTR  0B5 149                        * B407B
          BINT2                                  * B4086
          ROMPTR  0B0 0C5                        * B408B  ~gFldVal
          '                                      * B4096
          ::                                     * B409B
            OBJ_72AFA                            * B40A0
            SWAP                                 * B40A5
            OBJ_72AFA                            * B40AA
            EQUAL                                * B40AF
          ;                                      * B40B4
          POSCOMP                                * B40B9
          #0=case                                * B40BE
          DoBadKey                               * B40C3
          BINT2                                  * B40C8
          ROMPTR  0B4 1CC                        * B40CD
        ;                                        * B40D8

LIB0B4.hash:
        CON(5)  DOHSTR                           * B40DD  hash table of library 0B4
        LENGTH                                   * B40E2  length, to #B4141
        CON(5)  0                                * B40E7  names of length 1
        CON(5)  0                                * B40EC  names of length 2
        CON(5)  0                                * B40F1  names of length 3
        CON(5)  0                                * B40F6  names of length 4
        CON(5)  0                                * B40FB  names of length 5
        CON(5)  0                                * B4100  names of length 6
        CON(5)  0                                * B4105  names of length 7
        CON(5)  0                                * B410A  names of length 8
        CON(5)  0                                * B410F  names of length 9
        CON(5)  0                                * B4114  names of length 10
        CON(5)  0                                * B4119  names of length 11
        CON(5)  0                                * B411E  names of length 12
        CON(5)  0                                * B4123  names of length 13
        CON(5)  0                                * B4128  names of length 14
        CON(5)  0                                * B412D  names of length 15
        CON(5)  0                                * B4132  names of length 16
        REL(5)  L_B413C                          * B4137  end of the names
L_B413C:
        CON(5)  0                                * B413C  command 000 has no name
        ENDLENGTH                                * B4141

LIB0B4.link:
        CON(5)  DOHSTR                           * B4141  link table of library 0B4
        LENGTH                                   * B4146  length, to #B4B32
        REL(5)  ROMP_0B4_000                     * B414B  000 
        REL(5)  ROMP_0B4_001                     * B4150  001 
        REL(5)  ROMP_0B4_002                     * B4155  002 
        REL(5)  ROMP_0B4_003                     * B415A  003 
        REL(5)  ROMP_0B4_004                     * B415F  004 
        REL(5)  ROMP_0B4_005                     * B4164  005 
        REL(5)  ROMP_0B4_006                     * B4169  006 
        REL(5)  ROMP_0B4_007                     * B416E  007 
        REL(5)  ROMP_0B4_008                     * B4173  008 
        REL(5)  ROMP_0B4_009                     * B4178  009 
        REL(5)  ROMP_0B4_00A                     * B417D  00A 
        REL(5)  ROMP_0B4_00B                     * B4182  00B 
        REL(5)  ROMP_0B4_00C                     * B4187  00C 
        REL(5)  ROMP_0B4_00D                     * B418C  00D 
        REL(5)  ROMP_0B4_00E                     * B4191  00E 
        REL(5)  ROMP_0B4_00F                     * B4196  00F 
        REL(5)  ROMP_0B4_010                     * B419B  010 
        REL(5)  ROMP_0B4_011                     * B41A0  011 
        REL(5)  ROMP_0B4_012                     * B41A5  012 
        REL(5)  ROMP_0B4_013                     * B41AA  013 
        REL(5)  ROMP_0B4_014                     * B41AF  014 
        REL(5)  ROMP_0B4_015                     * B41B4  015 
        REL(5)  ROMP_0B4_016                     * B41B9  016 
        REL(5)  ROMP_0B4_017                     * B41BE  017 
        REL(5)  ROMP_0B4_018                     * B41C3  018 
        REL(5)  ROMP_0B4_019                     * B41C8  019 
        REL(5)  ROMP_0B4_01A                     * B41CD  01A 
        REL(5)  ROMP_0B4_01B                     * B41D2  01B 
        REL(5)  ROMP_0B4_01C                     * B41D7  01C 
        REL(5)  ROMP_0B4_01D                     * B41DC  01D 
        REL(5)  ROMP_0B4_01E                     * B41E1  01E 
        REL(5)  ROMP_0B4_01F                     * B41E6  01F 
        REL(5)  ROMP_0B4_020                     * B41EB  020 
        REL(5)  ROMP_0B4_021                     * B41F0  021 
        REL(5)  ROMP_0B4_022                     * B41F5  022 
        REL(5)  ROMP_0B4_023                     * B41FA  023 
        REL(5)  ROMP_0B4_024                     * B41FF  024 
        REL(5)  ROMP_0B4_025                     * B4204  025 
        REL(5)  ROMP_0B4_026                     * B4209  026 
        REL(5)  ROMP_0B4_027                     * B420E  027 
        REL(5)  ROMP_0B4_028                     * B4213  028 
        REL(5)  ROMP_0B4_029                     * B4218  029 
        REL(5)  ROMP_0B4_02A                     * B421D  02A 
        REL(5)  ROMP_0B4_02B                     * B4222  02B 
        REL(5)  ROMP_0B4_02C                     * B4227  02C 
        REL(5)  ROMP_0B4_02D                     * B422C  02D 
        REL(5)  ROMP_0B4_02E                     * B4231  02E 
        REL(5)  ROMP_0B4_02F                     * B4236  02F 
        REL(5)  ROMP_0B4_030                     * B423B  030 
        REL(5)  ROMP_0B4_031                     * B4240  031 
        REL(5)  ROMP_0B4_032                     * B4245  032 
        REL(5)  ROMP_0B4_033                     * B424A  033 
        REL(5)  ROMP_0B4_034                     * B424F  034 
        REL(5)  ROMP_0B4_035                     * B4254  035 
        REL(5)  ROMP_0B4_036                     * B4259  036 
        REL(5)  ROMP_0B4_037                     * B425E  037 
        REL(5)  ROMP_0B4_038                     * B4263  038 
        REL(5)  ROMP_0B4_039                     * B4268  039 
        REL(5)  ROMP_0B4_03A                     * B426D  03A 
        REL(5)  ROMP_0B4_03B                     * B4272  03B 
        REL(5)  ROMP_0B4_03C                     * B4277  03C 
        REL(5)  ROMP_0B4_03D                     * B427C  03D 
        REL(5)  ROMP_0B4_03E                     * B4281  03E 
        REL(5)  ROMP_0B4_03F                     * B4286  03F 
        REL(5)  ROMP_0B4_040                     * B428B  040 
        REL(5)  ROMP_0B4_041                     * B4290  041 
        REL(5)  ROMP_0B4_042                     * B4295  042 
        REL(5)  ROMP_0B4_043                     * B429A  043 
        REL(5)  ROMP_0B4_044                     * B429F  044 
        REL(5)  ROMP_0B4_045                     * B42A4  045 
        REL(5)  ROMP_0B4_046                     * B42A9  046 
        REL(5)  ROMP_0B4_047                     * B42AE  047 
        REL(5)  ROMP_0B4_048                     * B42B3  048 
        REL(5)  ROMP_0B4_049                     * B42B8  049 
        REL(5)  ROMP_0B4_04A                     * B42BD  04A 
        REL(5)  ROMP_0B4_04B                     * B42C2  04B 
        REL(5)  ROMP_0B4_04C                     * B42C7  04C 
        REL(5)  ROMP_0B4_04D                     * B42CC  04D 
        REL(5)  ROMP_0B4_04E                     * B42D1  04E 
        REL(5)  ROMP_0B4_04F                     * B42D6  04F 
        REL(5)  ROMP_0B4_050                     * B42DB  050 
        REL(5)  ROMP_0B4_051                     * B42E0  051 
        REL(5)  ROMP_0B4_052                     * B42E5  052 
        REL(5)  ROMP_0B4_053                     * B42EA  053 
        REL(5)  ROMP_0B4_054                     * B42EF  054 
        REL(5)  ROMP_0B4_055                     * B42F4  055 
        REL(5)  ROMP_0B4_056                     * B42F9  056 
        REL(5)  ROMP_0B4_057                     * B42FE  057 
        REL(5)  ROMP_0B4_058                     * B4303  058 
        REL(5)  ROMP_0B4_059                     * B4308  059 
        REL(5)  ROMP_0B4_05A                     * B430D  05A 
        REL(5)  ROMP_0B4_05B                     * B4312  05B 
        REL(5)  ROMP_0B4_05C                     * B4317  05C 
        REL(5)  ROMP_0B4_05D                     * B431C  05D 
        REL(5)  ROMP_0B4_05E                     * B4321  05E 
        REL(5)  ROMP_0B4_05F                     * B4326  05F 
        REL(5)  ROMP_0B4_060                     * B432B  060 
        REL(5)  ROMP_0B4_061                     * B4330  061 
        REL(5)  ROMP_0B4_062                     * B4335  062 
        REL(5)  ROMP_0B4_063                     * B433A  063 
        REL(5)  ROMP_0B4_064                     * B433F  064 
        REL(5)  ROMP_0B4_065                     * B4344  065 
        REL(5)  ROMP_0B4_066                     * B4349  066 
        REL(5)  ROMP_0B4_067                     * B434E  067 
        REL(5)  ROMP_0B4_068                     * B4353  068 
        REL(5)  ROMP_0B4_069                     * B4358  069 
        REL(5)  ROMP_0B4_06A                     * B435D  06A 
        REL(5)  ROMP_0B4_06B                     * B4362  06B 
        REL(5)  ROMP_0B4_06C                     * B4367  06C 
        REL(5)  ROMP_0B4_06D                     * B436C  06D 
        REL(5)  ROMP_0B4_06F                     * B4371  06E 
        REL(5)  ROMP_0B4_06F                     * B4376  06F 
        REL(5)  ROMP_0B4_070                     * B437B  070 
        REL(5)  ROMP_0B4_071                     * B4380  071 
        REL(5)  ROMP_0B4_072                     * B4385  072 
        REL(5)  ROMP_0B4_073                     * B438A  073 
        REL(5)  ROMP_0B4_074                     * B438F  074 
        REL(5)  ROMP_0B4_075                     * B4394  075 
        REL(5)  ROMP_0B4_076                     * B4399  076 
        REL(5)  ROMP_0B4_077                     * B439E  077 
        REL(5)  ROMP_0B4_078                     * B43A3  078 
        REL(5)  ROMP_0B4_079                     * B43A8  079 
        REL(5)  ROMP_0B4_07A                     * B43AD  07A 
        REL(5)  ROMP_0B4_07B                     * B43B2  07B 
        REL(5)  ROMP_0B4_07C                     * B43B7  07C 
        REL(5)  ROMP_0B4_07D                     * B43BC  07D 
        REL(5)  ROMP_0B4_07E                     * B43C1  07E 
        REL(5)  ROMP_0B4_07F                     * B43C6  07F 
        REL(5)  ROMP_0B4_080                     * B43CB  080 
        REL(5)  ROMP_0B4_081                     * B43D0  081 
        REL(5)  ROMP_0B4_082                     * B43D5  082 
        REL(5)  ROMP_0B4_083                     * B43DA  083 
        REL(5)  ROMP_0B4_084                     * B43DF  084 
        REL(5)  ROMP_0B4_085                     * B43E4  085 
        REL(5)  ROMP_0B4_086                     * B43E9  086 
        REL(5)  ROMP_0B4_087                     * B43EE  087 
        REL(5)  ROMP_0B4_088                     * B43F3  088 
        REL(5)  ROMP_0B4_089                     * B43F8  089 
        REL(5)  ROMP_0B4_08A                     * B43FD  08A 
        REL(5)  ROMP_0B4_08B                     * B4402  08B 
        REL(5)  ROMP_0B4_08C                     * B4407  08C 
        REL(5)  ROMP_0B4_08D                     * B440C  08D 
        REL(5)  ROMP_0B4_08E                     * B4411  08E 
        REL(5)  ROMP_0B4_08F                     * B4416  08F 
        REL(5)  ROMP_0B4_090                     * B441B  090 
        REL(5)  ROMP_0B4_091                     * B4420  091 
        REL(5)  ROMP_0B4_092                     * B4425  092 
        REL(5)  ROMP_0B4_093                     * B442A  093 
        REL(5)  ROMP_0B4_094                     * B442F  094 
        REL(5)  ROMP_0B4_095                     * B4434  095 
        REL(5)  ROMP_0B4_096                     * B4439  096 
        REL(5)  ROMP_0B4_097                     * B443E  097 
        REL(5)  ROMP_0B4_098                     * B4443  098 
        REL(5)  ROMP_0B4_099                     * B4448  099 
        REL(5)  ROMP_0B4_09A                     * B444D  09A 
        REL(5)  ROMP_0B4_09B                     * B4452  09B 
        REL(5)  ROMP_0B4_09C                     * B4457  09C 
        REL(5)  ROMP_0B4_09D                     * B445C  09D 
        REL(5)  ROMP_0B4_09E                     * B4461  09E 
        REL(5)  ROMP_0B4_09F                     * B4466  09F 
        REL(5)  ROMP_0B4_0A0                     * B446B  0A0 
        REL(5)  ROMP_0B4_0A1                     * B4470  0A1 
        REL(5)  ROMP_0B4_0A2                     * B4475  0A2 
        REL(5)  ROMP_0B4_0A3                     * B447A  0A3 
        REL(5)  ROMP_0B4_0A4                     * B447F  0A4 
        REL(5)  ROMP_0B4_0A5                     * B4484  0A5 
        REL(5)  ROMP_0B4_0A6                     * B4489  0A6 
        REL(5)  ROMP_0B4_0A7                     * B448E  0A7 
        REL(5)  ROMP_0B4_0A8                     * B4493  0A8 
        REL(5)  ROMP_0B4_0A9                     * B4498  0A9 
        REL(5)  ROMP_0B4_0AA                     * B449D  0AA 
        REL(5)  ROMP_0B4_0AB                     * B44A2  0AB 
        REL(5)  ROMP_0B4_0AC                     * B44A7  0AC 
        REL(5)  ROMP_0B4_0AD                     * B44AC  0AD 
        REL(5)  ROMP_0B4_0AE                     * B44B1  0AE 
        REL(5)  ROMP_0B4_0AF                     * B44B6  0AF 
        REL(5)  ROMP_0B4_0B0                     * B44BB  0B0 
        REL(5)  ROMP_0B4_0B1                     * B44C0  0B1 
        REL(5)  ROMP_0B4_0B2                     * B44C5  0B2 
        REL(5)  ROMP_0B4_0B3                     * B44CA  0B3 
        REL(5)  ROMP_0B4_0B4                     * B44CF  0B4 
        REL(5)  ROMP_0B4_0B5                     * B44D4  0B5 
        REL(5)  ROMP_0B4_0B6                     * B44D9  0B6 
        REL(5)  ROMP_0B4_0B7                     * B44DE  0B7 
        REL(5)  ROMP_0B4_0B8                     * B44E3  0B8 
        REL(5)  ROMP_0B4_0B9                     * B44E8  0B9 
        REL(5)  ROMP_0B4_0BA                     * B44ED  0BA 
        REL(5)  ROMP_0B4_0BB                     * B44F2  0BB 
        REL(5)  ROMP_0B4_0BC                     * B44F7  0BC 
        REL(5)  ROMP_0B4_0BD                     * B44FC  0BD 
        REL(5)  ROMP_0B4_0BE                     * B4501  0BE 
        REL(5)  ROMP_0B4_0BF                     * B4506  0BF 
        REL(5)  ROMP_0B4_0C0                     * B450B  0C0 
        REL(5)  ROMP_0B4_0C1                     * B4510  0C1 
        REL(5)  ROMP_0B4_0C2                     * B4515  0C2 
        REL(5)  ROMP_0B4_0C3                     * B451A  0C3 
        REL(5)  ROMP_0B4_0C4                     * B451F  0C4 
        REL(5)  ROMP_0B4_0C5                     * B4524  0C5 
        REL(5)  ROMP_0B4_0C6                     * B4529  0C6 
        REL(5)  ROMP_0B4_0C7                     * B452E  0C7 
        REL(5)  ROMP_0B4_0C8                     * B4533  0C8 
        REL(5)  ROMP_0B4_0C9                     * B4538  0C9 
        REL(5)  ROMP_0B4_0CA                     * B453D  0CA 
        REL(5)  ROMP_0B4_0CB                     * B4542  0CB 
        REL(5)  ROMP_0B4_0CC                     * B4547  0CC 
        REL(5)  ROMP_0B4_0CD                     * B454C  0CD 
        REL(5)  ROMP_0B4_0CE                     * B4551  0CE 
        REL(5)  ROMP_0B4_0CF                     * B4556  0CF 
        REL(5)  ROMP_0B4_0D0                     * B455B  0D0 
        REL(5)  ROMP_0B4_0D1                     * B4560  0D1 
        REL(5)  ROMP_0B4_0D2                     * B4565  0D2 
        REL(5)  ROMP_0B4_0D3                     * B456A  0D3 
        REL(5)  ROMP_0B4_0D4                     * B456F  0D4 
        REL(5)  ROMP_0B4_0D5                     * B4574  0D5 
        REL(5)  ROMP_0B4_0D6                     * B4579  0D6 
        REL(5)  ROMP_0B4_0D7                     * B457E  0D7 
        REL(5)  ROMP_0B4_0D8                     * B4583  0D8 
        REL(5)  ROMP_0B4_0D9                     * B4588  0D9 
        REL(5)  ROMP_0B4_0DA                     * B458D  0DA 
        REL(5)  ROMP_0B4_0DB                     * B4592  0DB 
        REL(5)  ROMP_0B4_0DC                     * B4597  0DC 
        REL(5)  ROMP_0B4_0DD                     * B459C  0DD 
        REL(5)  ROMP_0B4_0DE                     * B45A1  0DE 
        REL(5)  ROMP_0B4_0DF                     * B45A6  0DF 
        REL(5)  ROMP_0B4_0E0                     * B45AB  0E0 
        REL(5)  ROMP_0B4_0E1                     * B45B0  0E1 
        REL(5)  ROMP_0B4_0E2                     * B45B5  0E2 
        REL(5)  ROMP_0B4_0E3                     * B45BA  0E3 
        REL(5)  ROMP_0B4_0E4                     * B45BF  0E4 
        REL(5)  ROMP_0B4_0E5                     * B45C4  0E5 
        REL(5)  ROMP_0B4_0E6                     * B45C9  0E6 
        REL(5)  ROMP_0B4_0E7                     * B45CE  0E7 
        REL(5)  ROMP_0B4_0E8                     * B45D3  0E8 
        REL(5)  ROMP_0B4_0E9                     * B45D8  0E9 
        REL(5)  ROMP_0B4_0EA                     * B45DD  0EA 
        REL(5)  ROMP_0B4_0EB                     * B45E2  0EB 
        REL(5)  ROMP_0B4_0EC                     * B45E7  0EC 
        REL(5)  ROMP_0B4_0ED                     * B45EC  0ED 
        REL(5)  ROMP_0B4_0EE                     * B45F1  0EE 
        REL(5)  ROMP_0B4_0EF                     * B45F6  0EF 
        REL(5)  ROMP_0B4_0F0                     * B45FB  0F0 
        REL(5)  ROMP_0B4_0F1                     * B4600  0F1 
        REL(5)  ROMP_0B4_0F2                     * B4605  0F2 
        REL(5)  ROMP_0B4_0F3                     * B460A  0F3 
        REL(5)  ROMP_0B4_0F4                     * B460F  0F4 
        REL(5)  ROMP_0B4_0F5                     * B4614  0F5 
        REL(5)  ROMP_0B4_0F6                     * B4619  0F6 
        REL(5)  ROMP_0B4_0F7                     * B461E  0F7 
        REL(5)  ROMP_0B4_0F8                     * B4623  0F8 
        REL(5)  ROMP_0B4_0F9                     * B4628  0F9 
        REL(5)  ROMP_0B4_0FA                     * B462D  0FA 
        REL(5)  ROMP_0B4_0FB                     * B4632  0FB 
        REL(5)  ROMP_0B4_0FC                     * B4637  0FC 
        REL(5)  ROMP_0B4_0FD                     * B463C  0FD 
        REL(5)  ROMP_0B4_0FE                     * B4641  0FE 
        REL(5)  ROMP_0B4_0FF                     * B4646  0FF 
        REL(5)  ROMP_0B4_100                     * B464B  100 
        REL(5)  ROMP_0B4_101                     * B4650  101 
        REL(5)  ROMP_0B4_102                     * B4655  102 
        REL(5)  ROMP_0B4_103                     * B465A  103 
        REL(5)  ROMP_0B4_104                     * B465F  104 
        REL(5)  ROMP_0B4_105                     * B4664  105 
        REL(5)  ROMP_0B4_106                     * B4669  106 
        REL(5)  ROMP_0B4_107                     * B466E  107 
        REL(5)  ROMP_0B4_108                     * B4673  108 
        REL(5)  ROMP_0B4_109                     * B4678  109 
        REL(5)  ROMP_0B4_10A                     * B467D  10A 
        REL(5)  ROMP_0B4_10B                     * B4682  10B 
        REL(5)  ROMP_0B4_10C                     * B4687  10C 
        REL(5)  ROMP_0B4_10D                     * B468C  10D 
        REL(5)  ROMP_0B4_10E                     * B4691  10E 
        REL(5)  ROMP_0B4_10F                     * B4696  10F 
        REL(5)  ROMP_0B4_110                     * B469B  110 
        REL(5)  ROMP_0B4_111                     * B46A0  111 
        REL(5)  ROMP_0B4_112                     * B46A5  112 
        REL(5)  ROMP_0B4_113                     * B46AA  113 
        REL(5)  ROMP_0B4_114                     * B46AF  114 
        REL(5)  ROMP_0B4_115                     * B46B4  115 
        REL(5)  ROMP_0B4_116                     * B46B9  116 
        REL(5)  ROMP_0B4_117                     * B46BE  117 
        REL(5)  ROMP_0B4_118                     * B46C3  118 
        REL(5)  ROMP_0B4_119                     * B46C8  119 
        REL(5)  ROMP_0B4_11A                     * B46CD  11A 
        REL(5)  ROMP_0B4_11B                     * B46D2  11B 
        REL(5)  ROMP_0B4_11C                     * B46D7  11C 
        REL(5)  ROMP_0B4_11D                     * B46DC  11D 
        REL(5)  ROMP_0B4_11E                     * B46E1  11E 
        REL(5)  ROMP_0B4_11F                     * B46E6  11F 
        REL(5)  ROMP_0B4_120                     * B46EB  120 
        REL(5)  ROMP_0B4_121                     * B46F0  121 
        REL(5)  ROMP_0B4_122                     * B46F5  122 
        REL(5)  ROMP_0B4_123                     * B46FA  123 
        REL(5)  ROMP_0B4_124                     * B46FF  124 
        REL(5)  ROMP_0B4_125                     * B4704  125 
        REL(5)  ROMP_0B4_126                     * B4709  126 
        REL(5)  ROMP_0B4_127                     * B470E  127 
        REL(5)  ROMP_0B4_128                     * B4713  128 
        REL(5)  ROMP_0B4_129                     * B4718  129 
        REL(5)  ROMP_0B4_12A                     * B471D  12A 
        REL(5)  ROMP_0B4_12B                     * B4722  12B 
        REL(5)  ROMP_0B4_12C                     * B4727  12C 
        REL(5)  ROMP_0B4_12D                     * B472C  12D 
        REL(5)  ROMP_0B4_12E                     * B4731  12E 
        REL(5)  ROMP_0B4_12F                     * B4736  12F 
        REL(5)  ROMP_0B4_130                     * B473B  130 
        REL(5)  ROMP_0B4_131                     * B4740  131 
        REL(5)  ROMP_0B4_132                     * B4745  132 
        REL(5)  ROMP_0B4_133                     * B474A  133 
        REL(5)  ROMP_0B4_134                     * B474F  134 
        REL(5)  ROMP_0B4_135                     * B4754  135 
        REL(5)  ROMP_0B4_136                     * B4759  136 
        REL(5)  ROMP_0B4_137                     * B475E  137 
        REL(5)  ROMP_0B4_138                     * B4763  138 
        REL(5)  ROMP_0B4_139                     * B4768  139 
        REL(5)  ROMP_0B4_13A                     * B476D  13A 
        REL(5)  ROMP_0B4_13B                     * B4772  13B 
        REL(5)  ROMP_0B4_13C                     * B4777  13C 
        REL(5)  ROMP_0B4_13D                     * B477C  13D 
        REL(5)  ROMP_0B4_13E                     * B4781  13E 
        REL(5)  ROMP_0B4_13F                     * B4786  13F 
        REL(5)  ROMP_0B4_140                     * B478B  140 
        REL(5)  ROMP_0B4_141                     * B4790  141 
        REL(5)  ROMP_0B4_142                     * B4795  142 
        REL(5)  ROMP_0B4_143                     * B479A  143 
        REL(5)  ROMP_0B4_144                     * B479F  144 
        REL(5)  ROMP_0B4_145                     * B47A4  145 
        REL(5)  ROMP_0B4_146                     * B47A9  146 
        REL(5)  ROMP_0B4_147                     * B47AE  147 
        REL(5)  ROMP_0B4_148                     * B47B3  148 
        REL(5)  ROMP_0B4_149                     * B47B8  149 
        REL(5)  ROMP_0B4_14A                     * B47BD  14A 
        REL(5)  ROMP_0B4_14B                     * B47C2  14B 
        REL(5)  ROMP_0B4_14C                     * B47C7  14C 
        REL(5)  ROMP_0B4_14D                     * B47CC  14D 
        REL(5)  ROMP_0B4_14E                     * B47D1  14E 
        REL(5)  ROMP_0B4_14F                     * B47D6  14F 
        REL(5)  ROMP_0B4_151                     * B47DB  150 
        REL(5)  ROMP_0B4_151                     * B47E0  151 
        REL(5)  ROMP_0B4_152                     * B47E5  152 
        REL(5)  ROMP_0B4_153                     * B47EA  153 
        REL(5)  ROMP_0B4_154                     * B47EF  154 
        REL(5)  ROMP_0B4_155                     * B47F4  155 
        REL(5)  ROMP_0B4_156                     * B47F9  156 
        REL(5)  ROMP_0B4_157                     * B47FE  157 
        REL(5)  ROMP_0B4_158                     * B4803  158 
        REL(5)  ROMP_0B4_159                     * B4808  159 
        REL(5)  ROMP_0B4_15A                     * B480D  15A 
        REL(5)  ROMP_0B4_15B                     * B4812  15B 
        REL(5)  ROMP_0B4_15C                     * B4817  15C 
        REL(5)  ROMP_0B4_15D                     * B481C  15D 
        REL(5)  ROMP_0B4_15E                     * B4821  15E 
        REL(5)  ROMP_0B4_15F                     * B4826  15F 
        REL(5)  ROMP_0B4_160                     * B482B  160 
        REL(5)  ROMP_0B4_161                     * B4830  161 
        REL(5)  ROMP_0B4_162                     * B4835  162 
        REL(5)  ROMP_0B4_163                     * B483A  163 
        REL(5)  ROMP_0B4_164                     * B483F  164 
        REL(5)  ROMP_0B4_165                     * B4844  165 
        REL(5)  ROMP_0B4_166                     * B4849  166 
        REL(5)  ROMP_0B4_168                     * B484E  167 
        REL(5)  ROMP_0B4_168                     * B4853  168 
        REL(5)  ROMP_0B4_16B                     * B4858  169 
        REL(5)  ROMP_0B4_16B                     * B485D  16A 
        REL(5)  ROMP_0B4_16B                     * B4862  16B 
        REL(5)  ROMP_0B4_16C                     * B4867  16C 
        REL(5)  ROMP_0B4_16D                     * B486C  16D 
        REL(5)  ROMP_0B4_16E                     * B4871  16E 
        REL(5)  ROMP_0B4_16F                     * B4876  16F 
        REL(5)  ROMP_0B4_170                     * B487B  170 
        REL(5)  ROMP_0B4_171                     * B4880  171 
        REL(5)  ROMP_0B4_172                     * B4885  172 
        REL(5)  ROMP_0B4_173                     * B488A  173 
        REL(5)  ROMP_0B4_174                     * B488F  174 
        REL(5)  ROMP_0B4_175                     * B4894  175 
        REL(5)  ROMP_0B4_176                     * B4899  176 
        REL(5)  ROMP_0B4_177                     * B489E  177 
        REL(5)  ROMP_0B4_178                     * B48A3  178 
        REL(5)  ROMP_0B4_179                     * B48A8  179 
        REL(5)  ROMP_0B4_17A                     * B48AD  17A 
        REL(5)  ROMP_0B4_17B                     * B48B2  17B 
        REL(5)  ROMP_0B4_17C                     * B48B7  17C 
        REL(5)  ROMP_0B4_17D                     * B48BC  17D 
        REL(5)  ROMP_0B4_17E                     * B48C1  17E 
        REL(5)  ROMP_0B4_17F                     * B48C6  17F 
        REL(5)  ROMP_0B4_180                     * B48CB  180 
        REL(5)  ROMP_0B4_181                     * B48D0  181 
        REL(5)  ROMP_0B4_182                     * B48D5  182 
        REL(5)  ROMP_0B4_183                     * B48DA  183 
        REL(5)  ROMP_0B4_184                     * B48DF  184 
        REL(5)  ROMP_0B4_185                     * B48E4  185 
        REL(5)  ROMP_0B4_186                     * B48E9  186 
        REL(5)  ROMP_0B4_187                     * B48EE  187 
        REL(5)  ROMP_0B4_188                     * B48F3  188 
        REL(5)  ROMP_0B4_189                     * B48F8  189 
        REL(5)  ROMP_0B4_18A                     * B48FD  18A 
        REL(5)  ROMP_0B4_18B                     * B4902  18B 
        REL(5)  ROMP_0B4_18C                     * B4907  18C 
        REL(5)  ROMP_0B4_18D                     * B490C  18D 
        REL(5)  ROMP_0B4_18E                     * B4911  18E 
        REL(5)  ROMP_0B4_18F                     * B4916  18F 
        REL(5)  ROMP_0B4_190                     * B491B  190 
        REL(5)  ROMP_0B4_191                     * B4920  191 
        REL(5)  ROMP_0B4_192                     * B4925  192 
        REL(5)  ROMP_0B4_193                     * B492A  193 
        REL(5)  ROMP_0B4_194                     * B492F  194 
        REL(5)  ROMP_0B4_195                     * B4934  195 
        REL(5)  ROMP_0B4_196                     * B4939  196 
        REL(5)  ROMP_0B4_197                     * B493E  197 
        REL(5)  ROMP_0B4_198                     * B4943  198 
        REL(5)  ROMP_0B4_199                     * B4948  199 
        REL(5)  ROMP_0B4_19A                     * B494D  19A 
        REL(5)  ROMP_0B4_19B                     * B4952  19B 
        REL(5)  ROMP_0B4_19C                     * B4957  19C 
        REL(5)  ROMP_0B4_19D                     * B495C  19D 
        REL(5)  ROMP_0B4_19E                     * B4961  19E 
        REL(5)  ROMP_0B4_19F                     * B4966  19F 
        REL(5)  ROMP_0B4_1A0                     * B496B  1A0 
        REL(5)  ROMP_0B4_1A1                     * B4970  1A1 
        REL(5)  ROMP_0B4_1A2                     * B4975  1A2 
        REL(5)  ROMP_0B4_1A3                     * B497A  1A3 
        REL(5)  ROMP_0B4_1A4                     * B497F  1A4 
        REL(5)  ROMP_0B4_1A5                     * B4984  1A5 
        REL(5)  ROMP_0B4_1A6                     * B4989  1A6 
        REL(5)  ROMP_0B4_1A7                     * B498E  1A7 
        REL(5)  ROMP_0B4_1A8                     * B4993  1A8 
        REL(5)  ROMP_0B4_1A9                     * B4998  1A9 
        REL(5)  ROMP_0B4_1AA                     * B499D  1AA 
        REL(5)  ROMP_0B4_1AB                     * B49A2  1AB 
        REL(5)  ROMP_0B4_1AC                     * B49A7  1AC 
        REL(5)  ROMP_0B4_1AD                     * B49AC  1AD 
        REL(5)  ROMP_0B4_1AE                     * B49B1  1AE 
        REL(5)  ROMP_0B4_1AF                     * B49B6  1AF 
        REL(5)  ROMP_0B4_1B0                     * B49BB  1B0 
        REL(5)  ROMP_0B4_1B1                     * B49C0  1B1 
        REL(5)  ROMP_0B4_1B2                     * B49C5  1B2 
        REL(5)  ROMP_0B4_1B3                     * B49CA  1B3 
        REL(5)  ROMP_0B4_1B4                     * B49CF  1B4 
        REL(5)  ROMP_0B4_1B5                     * B49D4  1B5 
        REL(5)  ROMP_0B4_1B6                     * B49D9  1B6 
        REL(5)  ROMP_0B4_1B7                     * B49DE  1B7 
        REL(5)  ROMP_0B4_1B8                     * B49E3  1B8 
        REL(5)  ROMP_0B4_1B9                     * B49E8  1B9 
        REL(5)  ROMP_0B4_1BA                     * B49ED  1BA 
        REL(5)  ROMP_0B4_1BB                     * B49F2  1BB 
        REL(5)  ROMP_0B4_1BC                     * B49F7  1BC 
        REL(5)  ROMP_0B4_1BD                     * B49FC  1BD 
        REL(5)  ROMP_0B4_1BE                     * B4A01  1BE 
        REL(5)  ROMP_0B4_1BF                     * B4A06  1BF 
        REL(5)  ROMP_0B4_1C0                     * B4A0B  1C0 
        REL(5)  ROMP_0B4_1C1                     * B4A10  1C1 
        REL(5)  ROMP_0B4_1C2                     * B4A15  1C2 
        REL(5)  ROMP_0B4_1C3                     * B4A1A  1C3 
        REL(5)  ROMP_0B4_1C4                     * B4A1F  1C4 
        REL(5)  ROMP_0B4_1C5                     * B4A24  1C5 
        REL(5)  ROMP_0B4_1C6                     * B4A29  1C6 
        REL(5)  ROMP_0B4_1C7                     * B4A2E  1C7 
        REL(5)  ROMP_0B4_1C8                     * B4A33  1C8 
        REL(5)  ROMP_0B4_1C9                     * B4A38  1C9 
        REL(5)  ROMP_0B4_1CA                     * B4A3D  1CA 
        REL(5)  ROMP_0B4_1CB                     * B4A42  1CB 
        REL(5)  ROMP_0B4_1CC                     * B4A47  1CC 
        REL(5)  ROMP_0B4_1CD                     * B4A4C  1CD 
        REL(5)  ROMP_0B4_1CE                     * B4A51  1CE 
        REL(5)  ROMP_0B4_1CF                     * B4A56  1CF 
        REL(5)  ROMP_0B4_1D0                     * B4A5B  1D0 
        REL(5)  ROMP_0B4_1D2                     * B4A60  1D1 
        REL(5)  ROMP_0B4_1D2                     * B4A65  1D2 
        REL(5)  ROMP_0B4_1D3                     * B4A6A  1D3 
        REL(5)  ROMP_0B4_1D4                     * B4A6F  1D4 
        REL(5)  ROMP_0B4_1D5                     * B4A74  1D5 
        REL(5)  ROMP_0B4_1D6                     * B4A79  1D6 
        REL(5)  ROMP_0B4_1D7                     * B4A7E  1D7 
        REL(5)  ROMP_0B4_1D8                     * B4A83  1D8 
        REL(5)  ROMP_0B4_1D9                     * B4A88  1D9 
        REL(5)  ROMP_0B4_1DA                     * B4A8D  1DA 
        REL(5)  ROMP_0B4_1DB                     * B4A92  1DB 
        REL(5)  ROMP_0B4_1DC                     * B4A97  1DC 
        REL(5)  ROMP_0B4_1DD                     * B4A9C  1DD 
        REL(5)  ROMP_0B4_1DE                     * B4AA1  1DE 
        REL(5)  ROMP_0B4_1DF                     * B4AA6  1DF 
        REL(5)  ROMP_0B4_1E0                     * B4AAB  1E0 
        REL(5)  ROMP_0B4_1E1                     * B4AB0  1E1 
        REL(5)  ROMP_0B4_1E2                     * B4AB5  1E2 
        REL(5)  ROMP_0B4_1E3                     * B4ABA  1E3 
        REL(5)  ROMP_0B4_1E4                     * B4ABF  1E4 
        REL(5)  ROMP_0B4_1E5                     * B4AC4  1E5 
        REL(5)  ROMP_0B4_1E6                     * B4AC9  1E6 
        REL(5)  ROMP_0B4_1E7                     * B4ACE  1E7 
        REL(5)  ROMP_0B4_1E8                     * B4AD3  1E8 
        REL(5)  ROMP_0B4_1E9                     * B4AD8  1E9 
        REL(5)  ROMP_0B4_1EA                     * B4ADD  1EA 
        REL(5)  ROMP_0B4_1EB                     * B4AE2  1EB 
        REL(5)  ROMP_0B4_1EC                     * B4AE7  1EC 
        REL(5)  ROMP_0B4_1ED                     * B4AEC  1ED 
        REL(5)  ROMP_0B4_1EE                     * B4AF1  1EE 
        REL(5)  ROMP_0B4_1EF                     * B4AF6  1EF 
        REL(5)  ROMP_0B4_1F0                     * B4AFB  1F0 
        REL(5)  ROMP_0B4_1F1                     * B4B00  1F1 
        REL(5)  ROMP_0B4_1F2                     * B4B05  1F2 
        REL(5)  ROMP_0B4_1F3                     * B4B0A  1F3 
        REL(5)  ROMP_0B4_1F4                     * B4B0F  1F4 
        REL(5)  ROMP_0B4_1F5                     * B4B14  1F5 
        REL(5)  ROMP_0B4_1F6                     * B4B19  1F6 
        REL(5)  ROMP_0B4_1F7                     * B4B1E  1F7 
        REL(5)  ROMP_0B4_1F8                     * B4B23  1F8 
        REL(5)  ROMP_0B4_1F9                     * B4B28  1F9 
        REL(5)  ROMP_0B4_1FA                     * B4B2D  1FA 
