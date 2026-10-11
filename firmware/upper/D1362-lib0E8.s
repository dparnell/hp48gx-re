* HP 48GX ROM revision R, #D1362-#D4805: Library part 0E8
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~INTEMPOB?
* Follows on from the previous file (at #D1362 in the original ROM).
        ENDLENGTH                                * D1362

        CON(5)  DOLIB                            * D1362  library object
        LENGTH                                   * D1367  length, to #D49C7
        CON(2)  0                                * D136C  title length

LIB0E8:
        CON(3)  #0E8                             * D136E  library number
        REL(5)  LIB0E8.hash                      * D1371  hash table
        CON(5)  0                                * D1376  message table
        REL(5)  LIB0E8.link                      * D137B  link table
        CON(5)  0                                * D1380  config
        RPL

* ROMPTR 0E8 000
* refs (1): D136E
ROMP_0E8_000:
        ::                                       * D1385
          RCLSYSF                                * D138A
          DEPTH                                  * D138F
          #6-                                    * D1394
          2NULLLAM{}                             * D1399
          BIND                                   * D139E
          ERRSET                                 * D13A3
          ::                                     * D13A8
            DOSTD                                * D13AD
            %       6.4E1                        * D13B2
            XEQSTWS                              * D13C7
            ROT                                  * D13CC
            DO>STR                               * D13D1
            APPEND_SPACE                         * D13D6
            ROT                                  * D13DB
            DO>STR                               * D13E0
            &$                                   * D13E5
            $       " FOR "                      * D13EA
            &$                                   * D13FE
            ROT                                  * D1403
            ID>$                                 * D1408
            &$                                   * D140D
            APPEND_SPACE                         * D1412
            ROT                                  * D1417
            DO>STR                               * D141C
            &$                                   * D1421
            $       " EVAL "                     * D1426
            &$                                   * D143C
            SWAPDUP                              * D1441
            %1                                   * D1446
            EQUAL                                * D144B
            ITE                                  * D1450
            ::                                   * D1455
              DROP                               * D145A
              $       " NEXT"                    * D145F
            ;                                    * D1473
            ::                                   * D1478
              DO>STR                             * D147D
              &$                                 * D1482
              $       " STEP"                    * D1487
            ;                                    * D149B
            &$                                   * D14A0
          ;                                      * D14A5
          ERRTRAP                                * D14AA
          ::                                     * D14AF
            2GETLAM                              * D14B4
            STOSYSF                              * D14B9
            ERRJMP                               * D14BE
          ;                                      * D14C3
          2GETLAM                                * D14C8
          STOSYSF                                * D14CD
          DOSTR>                                 * D14D2
          DEPTH                                  * D14D7
          1GETLAM                                * D14DC
          2DUP                                   * D14E1
          #>ITE                                  * D14E6
          ::                                     * D14EB
            #-                                   * D14F0
            {}N                                  * D14F5
          ;                                      * D14FA
          2DROP                                  * D14FF
          ABND                                   * D1504
        ;                                        * D1509

* ROMPTR 0E8 001
* refs (1): D136E
ROMP_0E8_001:
        ::                                       * D150E
          ROMPTR  0E8 006                        * D1513
          ROMPTR  0E8 003                        * D151E
        ;                                        * D1529

* ROMPTR 0E8 002
* refs (1): D136E
ROMP_0E8_002:
        ::                                       * D152E
          SWAP                                   * D1533
          COERCE                                 * D1538
          DUP#0=case                             * D153D
          SETSIZEERR                             * D1542
          DEPTH                                  * D1547
          BINT3                                  * D154C
          #<case                                 * D1551
          SETSTACKERR                            * D1556
          ROT                                    * D155B
          STRIPTAGS                              * D1560
          DUPTYPELIST?                           * D1565
          NOTcase                                * D156A
          SETTYPEERR                             * D156F
          3UNROLL                                * D1574

* ROMPTR 0E8 003
* refs (1): D136E
ROMP_0E8_003:
          ::                                     * D1579
            3PICK                                * D157E
            LENCOMP                              * D1583
            2DUP                                 * D1588
            #>case                               * D158D
            doerr501                             * D1592
            OVER                                 * D1597
            #-                                   * D159C
            #1+                                  * D15A1
            3UNROLL                              * D15A6
            DEPTH                                * D15AB
            #4-                                  * D15B0
            BINT1                                * D15B5
            3NULLLAM{}                           * D15BA
            '                                    * D15BF
            LAM     'mtup                        * D15C4
            >HCOMP                               * D15D5
            '                                    * D15DA
            LAM     'ntup                        * D15DF
            >TCOMP                               * D15F0
            BIND                                 * D15F5
            >R                                   * D15FA
            5GETLAM                              * D15FF
            ZERO_DO                              * D1604
            ?ATTNQUIT                            * D1609
            RSWAP                                * D160E
            RDUP                                 * D1613
            3GETLAM                              * D1618
            ZERO_DO                              * D161D
            RSWAP                                * D1622
            'R                                   * D1627
            RSWAP                                * D162C
            LOOP                                 * D1631
            RDROP                                * D1636
            'R                                   * D163B
            DROP                                 * D1640
            RSWAP                                * D1645
            4GETLAM                              * D164A
            EVAL                                 * D164F
            1GETLAM                              * D1654
            #1+                                  * D1659
            1PUTLAM                              * D165E
            LOOP                                 * D1663
            RDROP                                * D1668
            DEPTH                                * D166D
            2GETLAM                              * D1672
            2DUP                                 * D1677
            #>ITE                                * D167C
            ::                                   * D1681
              #-                                 * D1686
              {}N                                * D168B
            ;                                    * D1690
            2DROP                                * D1695
            ABND                                 * D169A
          ;                                      * D169F
        ;                                        * D16A4

* ROMPTR 0E8 004
* refs (1): D136E
ROMP_0E8_004:
        ::                                       * D16A9
          '                                      * D16AE
          ROMPTR  0AB 06B                        * D16B3  DOLIST

* ROMPTR 0E8 005
* refs (1): D136E
ROMP_0E8_005:
          ::                                     * D16BE
            SWAP                                 * D16C3
            SAFE@                                * D16C8
            NOTcase                              * D16CD
            SETNONEXTERR                         * D16D2
            SWAP                                 * D16D7
            EVAL                                 * D16DC
          ;                                      * D16E1
        ;                                        * D16E6

* ROMPTR 0E8 006
* refs (1): D136E
ROMP_0E8_006:
        ::                                       * D16EB
          ROMPTR  0E8 00E                        * D16F0
          NOT?SEMI                               * D16FB
          DROP                                   * D1700
          DUP                                    * D1705
          CARCOMP                                * D170A
          '                                      * D170F
          x<<                                    * D1714
          EQ                                     * D1719
          NOTcase                                * D171E
          ARGNUMERR                              * D1723
          DUPLENCOMP                             * D1728
          BINT3                                  * D172D
          #<>case                                * D1732
          ROMPTR  0E8 009                        * D1737
          BINT2                                  * D1742
          NTHCOMPDROP                            * D1747
          DUPTYPEROMP?                           * D174C
          case                                   * D1751
          ROMPTR  0E8 007                        * D1756
          DUPTYPECOL?                            * D1761
          NOTcase                                * D1766
          ARGNUMERR                              * D176B
          ROMPTR  0E8 00E                        * D1770
          case                                   * D177B
          ARGNUMERR                              * D1780
        ;                                        * D1785

* ROMPTR 0E8 007
* refs (1): D136E
ROMP_0E8_007:
        ::                                       * D178A
          DUP                                    * D178F
          OBJ_2699F                              * D1794
          case                                   * D1799
          ARGNUMERR                              * D179E
          ROMPTR@                                * D17A3
          NOTcase                                * D17A8
          SETROMPERR                             * D17AD
          DUPTYPECOL?                            * D17B2
          NOTcase                                * D17B7
          ARGNUMERR                              * D17BC
          ROMPTR  0E8 00E                        * D17C1
          case                                   * D17CC
          ARGNUMERR                              * D17D1
        ;                                        * D17D6

* ROMPTR 0E8 008
* refs (1): D136E
ROMP_0E8_008:
        ::                                       * D17DB
          ROMPTR  0E8 006                        * D17E0
          ROMPTR  0E8 00C                        * D17EB
        ;                                        * D17F6

* ROMPTR 0E8 009
* refs (1): D136E
ROMP_0E8_009:
        ::                                       * D17FB
          DUP                                    * D1800
          DUPLENCOMP                             * D1805
          BINT3                                  * D180A
          #<case                                 * D180F
          INVFUNCERR                             * D1814
          >R                                     * D1819
          'R                                     * D181E
          '                                      * D1823
          x<<                                    * D1828
          EQ                                     * D182D
          NOTcase                                * D1832
          INVFUNCERR                             * D1837
          'R                                     * D183C
          DUP                                    * D1841
          '                                      * D1846
          xALG->                                 * D184B
          EQ                                     * D1850
          NOT                                    * D1855
          SWAP                                   * D185A
          '                                      * D185F
          xRPN->                                 * D1864
          EQ                                     * D1869
          NOT                                    * D186E
          AND                                    * D1873
          case                                   * D1878
          INVFUNCERR                             * D187D
          BINT0                                  * D1882
          BEGIN                                  * D1887
          RSWAP                                  * D188C
          'R                                     * D1891
          RSWAP                                  * D1896
          TYPELAM?                               * D189B
          WHILE                                  * D18A0
          ::                                     * D18A5
            #1+                                  * D18AA
          ;                                      * D18AF
          REPEAT                                 * D18B4
          RDROP                                  * D18B9
        ;                                        * D18BE

* ROMPTR 0E8 00A
* refs (1): D136E
ROMP_0E8_00A:
        ::                                       * D18C3
          ROMPTR  0E8 007                        * D18C8
          ROMPTR  0E8 00C                        * D18D3
        ;                                        * D18DE

* ROMPTR 0E8 00B
* refs (1): D136E
ROMP_0E8_00B:
        ::                                       * D18E3
          SWAP                                   * D18E8
          COERCE                                 * D18ED
          DUP#0=case                             * D18F2
          ARGNUMERR                              * D18F7

* ROMPTR 0E8 00C
* refs (1): D136E
ROMP_0E8_00C:
          ::                                     * D18FC
            DEPTH                                * D1901
            #2-                                  * D1906
            OVER                                 * D190B
            #<case                               * D1910
            SETSTACKERR                          * D1915
            FALSE                                * D191A
            ROMPTR  0E8 00F                      * D191F
          ;                                      * D192A
        ;                                        * D192F

* ROMPTR 0E8 00D
* refs (1): D136E
ROMP_0E8_00D:
        ::                                       * D1934

* ROMPTR 0E8 00E
* refs (1): D136E
ROMP_0E8_00E:
          ::                                     * D1939
            {                                    * D193E
              CK1&Dispatch                       * D1943
              CK2&Dispatch                       * D1948
              CK3&Dispatch                       * D194D
              CK4&Dispatch                       * D1952
              CK5&Dispatch                       * D1957
            }                                    * D195C
            OVER                                 * D1961
            CARCOMP                              * D1966
            EQUALPOSCOMP                         * D196B
            DUP#0=                               * D1970
          ;                                      * D1975
          case                                   * D197A
          ARGNUMERR                              * D197F
          TRUE                                   * D1984
          ROMPTR  0E8 00F                        * D1989
        ;                                        * D1994

* ROMPTR 0E8 00F
* refs (1): D136E
ROMP_0E8_00F:
        ::                                       * D1999
          DUP                                    * D199E
          NOTcase                                * D19A3
          ROMPTR  0E8 010                        * D19A8
          OVER                                   * D19B3
          #2=                                    * D19B8
          NOTcase                                * D19BD
          ROMPTR  0E8 010                        * D19C2
          ROMPTR  0E8 011                        * D19CD
        ;                                        * D19D8

* ROMPTR 0E8 010
* refs (1): D136E
ROMP_0E8_010:
        ::                                       * D19DD
          4PICK                                  * D19E2
          STRIPTAGS                              * D19E7
          DUPTYPELIST?                           * D19EC
          NOTcase                                * D19F1
          SETTYPEERR                             * D19F6
          LENCOMP                                * D19FB
          DUP#0=case                             * D1A00
          doerr501                               * D1A05
          DEPTH                                  * D1A0A
          #4-                                    * D1A0F
          4PICK                                  * D1A14
          #-                                     * D1A19
          3NULLLAM{}                             * D1A1E
          2NULLLAM{}                             * D1A23
          &COMP                                  * D1A28
          BIND                                   * D1A2D
          4GETLAM                                * D1A32
          #1<>                                   * D1A37
          IT                                     * D1A3C
          ::                                     * D1A41
            4GETLAM                              * D1A46
            #1+                                  * D1A4B
            BINT2                                * D1A50
            DO                                   * D1A55
            INDEX@                               * D1A5A
            PICK                                 * D1A5F
            STRIPTAGS                            * D1A64
            DUPTYPELIST?                         * D1A69
            NOTcase                              * D1A6E
            SETTYPEERR                           * D1A73
            LENCOMP                              * D1A78
            2GETLAM                              * D1A7D
            #<>case                              * D1A82
            doerr501                             * D1A87
            LOOP                                 * D1A8C
            4GETLAM                              * D1A91
            ZERO_DO                              * D1A96
            STRIPTAGS                            * D1A9B
            4GETLAM                              * D1AA0
            ROLL                                 * D1AA5
            LOOP                                 * D1AAA
          ;                                      * D1AAF
          4GETLAM                                * D1AB4
          ZERO_DO                                * D1AB9
          4GETLAM                                * D1ABE
          INDEX@                                 * D1AC3
          #-                                     * D1AC8
          ROLL                                   * D1ACD
          >R                                     * D1AD2
          RSWAP                                  * D1AD7
          LOOP                                   * D1ADC
          2GETLAM                                * D1AE1
          ZERO_DO                                * D1AE6
          ?ATTNQUIT                              * D1AEB
          4GETLAM                                * D1AF0
          ZERO_DO                                * D1AF5
          4GETLAM                                * D1AFA
          #2+                                    * D1AFF
          RROLL                                  * D1B04
          'R                                     * D1B09
          RSWAP                                  * D1B0E
          LOOP                                   * D1B13
          4GETLAM                                * D1B18
          #1+                                    * D1B1D
          RROLL                                  * D1B22
          5GETLAM                                * D1B27
          3GETLAM                                * D1B2C
          ITE                                    * D1B31
          EvalNoCK                               * D1B36
          EVAL                                   * D1B3B
          LOOP                                   * D1B40
          4GETLAM                                * D1B45
          ZERO_DO                                * D1B4A
          RSWAP                                  * D1B4F
          RDROP                                  * D1B54
          LOOP                                   * D1B59
          DEPTH                                  * D1B5E
          1GETLAM                                * D1B63
          2DUP                                   * D1B68
          #>ITE                                  * D1B6D
          ::                                     * D1B72
            #-                                   * D1B77
            {}N                                  * D1B7C
          ;                                      * D1B81
          2DROP                                  * D1B86
          ABND                                   * D1B8B
        ;                                        * D1B90

* ROMPTR 0E8 011
* refs (1): D136E
ROMP_0E8_011:
        ::                                       * D1B95
          5ROLL                                  * D1B9A
          STRIPTAGS                              * D1B9F
          5ROLL                                  * D1BA4
          STRIPTAGS                              * D1BA9
          CK&DISPATCH0                           * D1BAE
          BINT85                                 * D1BB3
          ::                                     * D1BB8
            5UNROLL                              * D1BBD
            5UNROLL                              * D1BC2
            ROMPTR  0E8 010                      * D1BC7
          ;                                      * D1BD2
          OBJ_64C34                              * D1BD7
          ROMPTR  0E8 012                        * D1BDC
          BINT5                                  * D1BE7
          ROMPTR  0E8 013                        * D1BEC
        ;                                        * D1BF7

* ROMPTR 0E8 012
* refs (1): D136E
ROMP_0E8_012:
        ::                                       * D1BFC
          5UNROLL                                * D1C01
          5UNROLL                                * D1C06
          FALSE                                  * D1C0B
          ROMPTR  0E8 014                        * D1C10
        ;                                        * D1C1B

* ROMPTR 0E8 013
* refs (1): D136E
ROMP_0E8_013:
        ::                                       * D1C20
          5UNROLL                                * D1C25
          4UNROLL                                * D1C2A
          TRUE                                   * D1C2F
          ROMPTR  0E8 014                        * D1C34
        ;                                        * D1C3F

* ROMPTR 0E8 014
* refs (1): D136E
ROMP_0E8_014:
        ::                                       * D1C44
          ROTDROP                                * D1C49
          5PICK                                  * D1C4E
          LENCOMP                                * D1C53
          DUP#0=case                             * D1C58
          doerr501                               * D1C5D
          DEPTH                                  * D1C62
          #6-                                    * D1C67
          3NULLLAM{}                             * D1C6C
          3NULLLAM{}                             * D1C71
          &COMP                                  * D1C76
          BIND                                   * D1C7B
          >R                                     * D1C80
          2GETLAM                                * D1C85
          ZERO_DO                                * D1C8A
          ?ATTNQUIT                              * D1C8F
          RSWAP                                  * D1C94
          'R                                     * D1C99
          RSWAP                                  * D1C9E
          6GETLAM                                * D1CA3
          3GETLAM                                * D1CA8
          IT                                     * D1CAD
          SWAP                                   * D1CB2
          5GETLAM                                * D1CB7
          4GETLAM                                * D1CBC
          ITE                                    * D1CC1
          EvalNoCK                               * D1CC6
          EVAL                                   * D1CCB
          LOOP                                   * D1CD0
          RDROP                                  * D1CD5
          DEPTH                                  * D1CDA
          1GETLAM                                * D1CDF
          2DUP                                   * D1CE4
          #>ITE                                  * D1CE9
          ::                                     * D1CEE
            #-                                   * D1CF3
            {}N                                  * D1CF8
          ;                                      * D1CFD
          2DROP                                  * D1D02
          ABND                                   * D1D07
        ;                                        * D1D0C

* ROMPTR 0E8 015
* refs (1): D136E
ROMP_0E8_015:
        ::                                       * D1D11
          '                                      * D1D16
          x+                                     * D1D1B
          BINT2                                  * D1D20
          TRUE                                   * D1D25
          ROMPTR  0E8 00F                        * D1D2A
        ;                                        * D1D35

* ROMPTR 0E8 016
* refs (1): D136E
ROMP_0E8_016:
        ::                                       * D1D3A
          ::                                     * D1D3F
            ROMPTR  0E8 01C                      * D1D44
            ::                                   * D1D4F
              SWAP                               * D1D54
              dup;#nm?                           * D1D59
              ITE                                * D1D5E
              FalseFalse                         * D1D63
              TrueTrue                           * D1D68
              4ROLL                              * D1D6D
              3NULLLAM{}                         * D1D72
              BIND                               * D1D77
              2GETLAM                            * D1D7C
              IT                                 * D1D81
              ROMPTR  0E8 017                    * D1D86
              1GETLAM                            * D1D91
              #1+_ONE_DO                         * D1D96
              1GETLAM                            * D1D9B
              ROLL                               * D1DA0
              BINT0                              * D1DA5
              INDEX@                             * D1DAA
              BEGIN                              * D1DAF
              ?ATTNQUIT                          * D1DB4
              2DUP                               * D1DB9
              SWAP#-                             * D1DBE
              #2/                                * D1DC3
              DUP#0<>                            * D1DC8
              WHILE                              * D1DCD
              ::                                 * D1DD2
                OVERSWAP                         * D1DD7
                #-DUP                            * D1DDC
                #4+PICK                          * D1DE1
                5PICK                            * D1DE6
                CODE                             * D1DEB  20 nibbles
                  C=PC                           * D1DF5
                  LA(5)   #0006B                 * D1DF9
                  A=A+C   A                      * D1E03
                  PC=(A)                         * D1E05
                ENDCODE                          * D1E09
                %1                               * D1E09
                %=                               * D1E0E
                ITE                              * D1E13
                ROTDROPSWAP                      * D1E18
                SWAPDROP                         * D1E1D
              ;                                  * D1E22
              REPEAT                             * D1E27
              DROPSWAPDROP                       * D1E2C
              UNROLL                             * D1E31
              LOOP                               * D1E36
              2GETLAM                            * D1E3B
              IT                                 * D1E40
              ROMPTR  0E8 019                    * D1E45
              1GETABND                           * D1E50
            ;                                    * D1E55
            COLA                                 * D1E5A
          ;                                      * D1E5F
          ::                                     * D1E64
            CK&DISPATCH1                         * D1E69
            BINT17                               * D1E6E
            CODE                                 * D1E73  20 nibbles
              D0=D0+  5                          * D1E7D
              D0=D0+  5                          * D1E80
              LA(5)   %>                         * D1E83
              PC=(A)                             * D1E8D
            ENDCODE                              * D1E91
            BINT51                               * D1E91
            $>$?                                 * D1E96
            #       BB                           * D1E9B  187
            HXS>HXS                              * D1EA5
            #       EE                           * D1EAA  238
            UM>?                                 * D1EB4
            #       E1                           * D1EB9  225
            UM>?                                 * D1EC3
            #       1E                           * D1EC8  30
            UM>?                                 * D1ED2
            #       66                           * D1ED7  102
            ::                                   * D1EE1
              ID>$                               * D1EE6
              SWAP                               * D1EEB
              ID>$                               * D1EF0
              SWAP                               * D1EF5
              $>$?                               * D1EFA
            ;                                    * D1EFF
            #       77                           * D1F04  119
            ::                                   * D1F0E
              ID>$                               * D1F13
              SWAP                               * D1F18
              ID>$                               * D1F1D
              SWAP                               * D1F22
              $>$?                               * D1F27
            ;                                    * D1F2C
            BINT85                               * D1F31
            ::                                   * D1F36
              DUPLENCOMP                         * D1F3B
              #0=case                            * D1F40
              SETSIZEERR                         * D1F45
              CARCOMP                            * D1F4A
              SWAP                               * D1F4F
              DUPLENCOMP                         * D1F54
              #0=case                            * D1F59
              SETSIZEERR                         * D1F5E
              CARCOMP                            * D1F63
              SWAP                               * D1F68
              COLA                               * D1F6D
              CODE                               * D1F72  20 nibbles
                C=PC                             * D1F7C
                LA(5)   #FFEE4                   * D1F80
                A=A+C   A                        * D1F8A
                PC=(A)                           * D1F8C
              ENDCODE                            * D1F90
            ;                                    * D1F90
          ;                                      * D1F95
        ;                                        * D1F9A

* ROMPTR 0E8 017
* refs (1): D136E
ROMP_0E8_017:
        ::                                       * D1F9F
          DUPTYPELAM?                            * D1FA4
          case                                   * D1FA9
          ROMPTR  0E8 018                        * D1FAE
          1GETLAM                                * D1FB9
          ZERO_DO                                * D1FBE
          DUPTYPEIDNT?                           * D1FC3
          NOTcase                                * D1FC8
          SETTYPEERR                             * D1FCD
          ID>$                                   * D1FD2
          1GETLAM                                * D1FD7
          ROLL                                   * D1FDC
          LOOP                                   * D1FE1
        ;                                        * D1FE6

* ROMPTR 0E8 018
* refs (1): D136E
ROMP_0E8_018:
        ::                                       * D1FEB
          FALSE                                  * D1FF0
          3PUTLAM                                * D1FF5
          1GETLAM                                * D1FFA
          ZERO_DO                                * D1FFF
          DUPTYPELAM?                            * D2004
          NOTcase                                * D2009
          SETTYPEERR                             * D200E
          LAM>ID                                 * D2013
          ID>$                                   * D2018
          1GETLAM                                * D201D
          ROLL                                   * D2022
          LOOP                                   * D2027
        ;                                        * D202C

* ROMPTR 0E8 019
* refs (1): D136E
ROMP_0E8_019:
        ::                                       * D2031
          3GETLAM                                * D2036
          NOTcase                                * D203B
          ROMPTR  0E8 01A                        * D2040
          1GETLAM                                * D204B
          ZERO_DO                                * D2050
          $>ID                                   * D2055
          1GETLAM                                * D205A
          ROLL                                   * D205F
          LOOP                                   * D2064
        ;                                        * D2069

* ROMPTR 0E8 01A
* refs (1): D136E
ROMP_0E8_01A:
        ::                                       * D206E
          1GETLAM                                * D2073
          ZERO_DO                                * D2078
          $>ID                                   * D207D
          ID>LAM                                 * D2082
          1GETLAM                                * D2087
          ROLL                                   * D208C
          LOOP                                   * D2091
        ;                                        * D2096

* ROMPTR 0E8 01B
* refs (1): D136E
ROMP_0E8_01B:
        ::                                       * D209B
          'R                                     * D20A0
          NOTNUM?                                * D20A5
          SETNUM                                 * D20AA
          ERRSET                                 * D20AF
          ITE                                    * D20B4
          ::                                     * D20B9
            EVAL                                 * D20BE
            ERRTRAP                              * D20C3
            cf(-3);error                         * D20C8
            CLRNUM                               * D20CD
          ;                                      * D20D2
          ::                                     * D20D7
            EVAL                                 * D20DC
            ERRTRAP                              * D20E1
            sf(-3);error                         * D20E6
            SETNUM                               * D20EB
          ;                                      * D20F0
        ;                                        * D20F5

* ROMPTR 0E8 01C
* refs (1): D136E
ROMP_0E8_01C:
        ::                                       * D20FA
          ROMPTR  0E8 01E                        * D20FF  ~INTEMPOB?
          NOTcase                                * D210A
          ROMPTR  0E8 01D                        * D210F
          ID      '{}                            * D211A
          StoHiddenVar                           * D2127
          '                                      * D212C
          ID      '{}                            * D2131
          RclHiddenVar                           * D213E
          DROP                                   * D2143
          ERRSET                                 * D2148
          ::                                     * D214D
            INNERCOMP                            * D2152
            RSWAP                                * D2157
            'R                                   * D215C
            RSWAP                                * D2161
            EVAL                                 * D2166
          ;                                      * D216B
          ERRTRAP                                * D2170
          ::                                     * D2175
            '                                    * D217A
            ID      '{}                          * D217F
            PuHiddenVar                          * D218C
            ERRJMP                               * D2191
          ;                                      * D2196
          '                                      * D219B
          ID      '{}                            * D21A0
          PuHiddenVar                            * D21AD
          {}N                                    * D21B2
        ;                                        * D21B7

* ROMPTR 0E8 01D
* refs (1): D136E
ROMP_0E8_01D:
        ::                                       * D21BC
          INNERCOMP                              * D21C1
          'REVAL                                 * D21C6
          {}N                                    * D21CB
        ;                                        * D21D0

* ROMPTR 0E8 01E
* refs (1): D136E
~INTEMPOB?:
        CODE                                     * D21D5  62 nibbles
          A=DAT1  A                              * D21DF
          CD0EX                                  * D21E2
          RSTK=C                                 * D21E5
          D0=(5)  #806E9                         * D21E7
          C=DAT0  A                              * D21EE
          ?C>A    A                              * D21F1
          GOYES   L_D2205                        * D21F4
          D0=(5)  #806EE                         * D21F6
          C=DAT0  A                              * D21FD
          ?C>A    A                              * D2200
          GOYES   L_D2211                        * D2203
L_D2205:
          C=RSTK                                 * D2205
          D0=C                                   * D2207
          GOVLNG  PushFLoop                      * D220A
L_D2211:
          C=RSTK                                 * D2211
          D0=C                                   * D2213
          GOVLNG  PushTLoop                      * D2216
        ENDCODE                                  * D221D

* ROMPTR 0E8 01F
* refs (1): D136E
ROMP_0E8_01F:
        ::                                       * D221D
          CK&DISPATCH1                           * D2222
          #       455                            * D2227  1109
          ROMPTR  0E8 026                        * D2231
          #       411                            * D223C  1041
          ROMPTR  0E8 028                        * D2246
          #       415                            * D2251  1045
          ROMPTR  0E8 025                        * D225B
          #       451                            * D2266  1105
          ROMPTR  0E8 024                        * D2270
          #       855                            * D227B  2133
          sub(PICT,2c)                           * D2285
          #       822                            * D228A  2082
          sub(PICT,2c)                           * D2294
          TAGGEDANY                              * D2299
          ::                                     * D229E
            STRIPTAGSl2                          * D22A3
            STRIPTAGS                            * D22A8
            'EvalNoCK:_sup                       * D22AD
            xSUB                                 * D22B2
          ;                                      * D22B7
          BINT13                                 * D22BC
          ::                                     * D22C1
            STRIPTAGS                            * D22C6
            'EvalNoCK:_sup                       * D22CB
            xSUB                                 * D22D0
          ;                                      * D22D5
        ;                                        * D22DA

* ROMPTR 0E8 020
* refs (1): D136E
ROMP_0E8_020:
        ::                                       * D22DF
          CK&DISPATCH1                           * D22E4
          #       454                            * D22E9  1108
          ROMPTR  0E8 022                        * D22F3
          #       414                            * D22FE  1044
          ROMPTR  0E8 021                        * D2308
          #       85C                            * D2313  2140
          repl(PICT,c,go)                        * D231D
          #       82C                            * D2322  2092
          repl(PICT,c,go)                        * D232C
          TAGGEDANY                              * D2331
          ::                                     * D2336
            STRIPTAGSl2                          * D233B
            STRIPTAGS                            * D2340
            'EvalNoCK:_sup                       * D2345
            xREPL                                * D234A
          ;                                      * D234F
          BINT13                                 * D2354
          ::                                     * D2359
            STRIPTAGS                            * D235E
            'EvalNoCK:_sup                       * D2363
            xREPL                                * D2368
          ;                                      * D236D
        ;                                        * D2372

* ROMPTR 0E8 021
* refs (1): D136E
ROMP_0E8_021:
        ::                                       * D2377
          3UNROLL                                * D237C
          COERCE                                 * D2381
          OVER                                   * D2386
          ROMPTR  0E8 02B                        * D238B
          ROMPTR  0E8 023                        * D2396
        ;                                        * D23A1

* ROMPTR 0E8 022
* refs (1): D136E
ROMP_0E8_022:
        ::                                       * D23A6
          ROT                                    * D23AB
          OBJ_1DF30                              * D23B0
          4GETLAM                                * D23B5
          3GETLAM                                * D23BA
          1GETABND                               * D23BF
          INNERCOMP                              * D23C4
          BINT2                                  * D23C9
          #<>case                                * D23CE
          SETSIZEERR                             * D23D3
          COERCE2                                * D23D8
          ROMPTR  0E8 023                        * D23DD
        ;                                        * D23E8

* ROMPTR 0E8 023
* refs (1): D136E
ROMP_0E8_023:
        ::                                       * D23ED
          2DUP                                   * D23F2
          #*                                     * D23F7
          #0=case                                * D23FC
          SETSIZEERR                             * D2401
          ROT                                    * D2406
          TOTEMPOB                               * D240B
          3UNROLL                                * D2410
          3PICK                                  * D2415
          ROMPTR  0E8 02A                        * D241A
          8PICK                                  * D2425
          ROMPTR  0E8 02A                        * D242A
          ROT                                    * D2435
          7PICK                                  * D243A
          XOR                                    * D243F
          case                                   * D2444
          SETTYPEERR                             * D2449
          BINT9                                  * D244E
          PICK                                   * D2453
          3PICK                                  * D2458
          #+                                     * D245D
          #1-                                    * D2462
          6PICK                                  * D2467
          #>case                                 * D246C
          SETSIZEERR                             * D2471
          8PICK                                  * D2476
          OVER                                   * D247B
          #+                                     * D2480
          #1-                                    * D2485
          5PICK                                  * D248A
          #>case                                 * D248F
          SETSIZEERR                             * D2494
          4NULLLAM{}                             * D2499
          3NULLLAM{}                             * D249E
          2NULLLAM{}                             * D24A3
          &COMP                                  * D24A8
          &COMP                                  * D24AD
          BIND                                   * D24B2
          2GETLAM                                * D24B7
          3GETLAM                                * D24BC
          ITE                                    * D24C1
          BINT30                                 * D24C6
          BINT25                                 * D24CB
          9GETLAM                                * D24D0
          #1-                                    * D24D5
          4GETLAM                                * D24DA
          #*                                     * D24DF
          8GETLAM                                * D24E4
          #1-                                    * D24E9
          #+                                     * D24EE
          6GETLAM                                * D24F3
          #*                                     * D24F8
          7GETLAM                                * D24FD
          ITE                                    * D2502
          BINT30                                 * D2507
          BINT25                                 * D250C
          #+                                     * D2511
          4GETLAM                                * D2516
          1GETLAM                                * D251B
          #-                                     * D2520
          6GETLAM                                * D2525
          #*                                     * D252A
          1GETLAM                                * D252F
          6GETLAM                                * D2534
          #*                                     * D2539
          BINT0                                  * D253E
          ABND                                   * D2543
          ROMPTR  0E8 029                        * D2548
        ;                                        * D2553

* ROMPTR 0E8 024
* refs (1): D136E
ROMP_0E8_024:
        ::                                       * D2558
          SWAP                                   * D255D

* ROMPTR 0E8 025
* refs (1): D136E
ROMP_0E8_025:
          ::                                     * D2562
            3UNROLL                              * D2567
            OBJ_1DF30                            * D256C
            4GETLAM                              * D2571
            3GETLAM                              * D2576
            1GETABND                             * D257B
            INNERCOMP                            * D2580
            BINT2                                * D2585
            #<>case                              * D258A
            SETSIZEERR                           * D258F
            COERCE2                              * D2594
            ROT                                  * D2599
            COERCE                               * D259E
            4PICK                                * D25A3
            ROMPTR  0E8 02B                      * D25A8
            ROMPTR  0E8 027                      * D25B3
          ;                                      * D25BE
        ;                                        * D25C3

* ROMPTR 0E8 026
* refs (1): D136E
ROMP_0E8_026:
        ::                                       * D25C8
          ROT                                    * D25CD
          OBJ_1DF30                              * D25D2
          4GETLAM                                * D25D7
          3GETLAM                                * D25DC
          1GETABND                               * D25E1
          OBJ_1DF30                              * D25E6
          4GETLAM                                * D25EB
          3GETLAM                                * D25F0
          1GETABND                               * D25F5
          INNERCOMP                              * D25FA
          BINT2                                  * D25FF
          #<>case                                * D2604
          SETSIZEERR                             * D2609
          COERCE2                                * D260E
          ROT                                    * D2613
          INNERCOMP                              * D2618
          BINT2                                  * D261D
          #<>case                                * D2622
          SETSIZEERR                             * D2627
          COERCE2                                * D262C
          ROMPTR  0E8 027                        * D2631
        ;                                        * D263C

* ROMPTR 0E8 027
* refs (1): D136E
ROMP_0E8_027:
        ::                                       * D2641
          ROT                                    * D2646
          2DUP                                   * D264B
          #>                                     * D2650
          IT                                     * D2655
          SWAP                                   * D265A
          OVER                                   * D265F
          #0=case                                * D2664
          SETSIZEERR                             * D2669
          2SWAP                                  * D266E
          2DUP                                   * D2673
          #>                                     * D2678
          IT                                     * D267D
          SWAP                                   * D2682
          OVER                                   * D2687
          #0=case                                * D268C
          SETSIZEERR                             * D2691
          5PICK                                  * D2696
          ROMPTR  0E8 02A                        * D269B
          4NULLLAM{}                             * D26A6
          BIND                                   * D26AB
          2GETLAM                                * D26B0
          OVER                                   * D26B5
          #<case                                 * D26BA
          SETSIZEERR                             * D26BF
          1GETLAM                                * D26C4
          4PICK                                  * D26C9
          #<case                                 * D26CE
          SETSIZEERR                             * D26D3
          OVER                                   * D26D8
          #-                                     * D26DD
          #1+                                    * D26E2
          2SWAP                                  * D26E7
          OVER                                   * D26EC
          #-                                     * D26F1
          #1+                                    * D26F6
          4GETLAM                                * D26FB
          ITE                                    * D2700
          ::                                     * D2705
            3PICKOVER                            * D270A
            BINT2                                * D270F
          ;                                      * D2714
          DUPONE                                 * D2719
          {}N                                    * D271E
          6PICK                                  * D2723
          TYPERARRY?                             * D2728
          ITE                                    * D272D
          %0_2A2B4                               * D2732
          C%0                                    * D2737
          MAKEARRY                               * D273C
          5UNROLL                                * D2741
          4ROLL                                  * D2746
          #1-                                    * D274B
          1GETLAM                                * D2750
          #*                                     * D2755
          ROT                                    * D275A
          #+                                     * D275F
          #1-                                    * D2764
          3GETLAM                                * D2769
          #*                                     * D276E
          4GETLAM                                * D2773
          ITE                                    * D2778
          BINT30                                 * D277D
          BINT25                                 * D2782
          DUP                                    * D2787
          ROT#+                                  * D278C
          SWAP                                   * D2791
          1GETLAM                                * D2796
          3GETLAM                                * D279B
          #*                                     * D27A0
          BINT0                                  * D27A5
          5ROLL                                  * D27AA
          3GETLAM                                * D27AF
          #*                                     * D27B4
          ROT                                    * D27B9
          OVER                                   * D27BE
          #-                                     * D27C3
          ABND                                   * D27C8
          ROMPTR  0E8 029                        * D27CD
        ;                                        * D27D8

* ROMPTR 0E8 028
* refs (1): D136E
ROMP_0E8_028:
        ::                                       * D27DD
          COERCE2                                * D27E2
          3PICK                                  * D27E7
          ROMPTR  0E8 02B                        * D27EC
          ROT                                    * D27F7
          4PICK                                  * D27FC
          ROMPTR  0E8 02B                        * D2801
          ROMPTR  0E8 027                        * D280C
        ;                                        * D2817

* ROMPTR 0E8 029
* refs (1): D136E
ROMP_0E8_029:
        CODE                                     * D281C  168 nibbles
          GOSBVL  POP2#                          * D2826
          R4=A.F  A                              * D282D
          R3=C.F  A                              * D2833
          GOSBVL  POP2#                          * D2839
          R2=A.F  A                              * D2840
          R1=C.F  A                              * D2846
          GOSBVL  SAVPTR                         * D284C
          GOSBVL  POP2#                          * D2853
          B=A     A                              * D285A
          B=B-1   A                              * D285C
          D1=D1+  5                              * D285E
          A=DAT1  A                              * D2861
          A=A+C   A                              * D2864
          D0=A                                   * D2866
          D1=D1-  5                              * D2869
          A=DAT1  A                              * D286C
          C=R2.F  A                              * D286F
          A=A+C   A                              * D2875
          D1=A                                   * D2877
L_D287A:
          C=R4.F  A                              * D287A
          GOSBVL  MOVEDOWN                       * D2880
          B=B-1   A                              * D2887
          GOC     L_D28AB                        * D2889
          C=R3.F  A                              * D288C
          AD0EX                                  * D2892
          A=A+C   A                              * D2895
          D0=A                                   * D2897
          C=R1.F  A                              * D289A
          AD1EX                                  * D28A0
          A=A+C   A                              * D28A3
          D1=A                                   * D28A5
          GONC    L_D287A                        * D28A8
L_D28AB:
          GOSBVL  GETPTR                         * D28AB
          D1=D1+  10                             * D28B2
          C=DAT1  A                              * D28B5
          D1=D1+  5                              * D28B8
          DAT1=C  A                              * D28BB
          D=D+1   A                              * D28BE
          D=D+1   A                              * D28C0
          D=D+1   A                              * D28C2
          A=DAT0  A                              * D28C4
          D0=D0+  5                              * D28C7
          PC=(A)                                 * D28CA
        ENDCODE                                  * D28CE

* ROMPTR 0E8 02A
* refs (1): D136E
ROMP_0E8_02A:
        ::                                       * D28CE
          DUP                                    * D28D3
          TYPERARRY?                             * D28D8
          ITE                                    * D28DD
          BINT16                                 * D28E2
          BINT32                                 * D28E7
          SWAP                                   * D28EC
          MDIMS                                  * D28F1
          DUP                                    * D28F6
          ITE                                    * D28FB
          ROT                                    * D2900
          BINT1                                  * D2905
          3UNROLL                                * D290A
          4UNROLL                                * D290F
        ;                                        * D2914

* ROMPTR 0E8 02B
* refs (1): D136E
ROMP_0E8_02B:
        ::                                       * D2919
          MDIMS                                  * D291E
          NOTcasedrop                            * D2923
          ONESWAP                                * D2928
          SWAPDROP                               * D292D
          DUPUNROT                               * D2932
          #/                                     * D2937
          OVER#0=                                * D293C
          case                                   * D2941
          SWAPDROPSWAP                           * D2946
          #1+                                    * D294B
          ROTDROPSWAP                            * D2950
        ;                                        * D2955

* ROMPTR 0E8 02C
* refs (1): D136E
ROMP_0E8_02C:
        ::                                       * D295A
          HOMEDIR                                * D295F
          '                                      * D2964
          ID      EXAMPLES                       * D2969
          DUP                                    * D2980
          SAFE@                                  * D2985
          NOTcaseDROP                            * D298A
          TYPERRP?                               * D298F
          case                                   * D2994
          XEQPGDIR                               * D2999
          PURGE                                  * D299E
        ;                                        * D29A3

* ROMPTR 0E8 02D
* refs (1): D136E
ROMP_0E8_02D:
        ::                                       * D29A8
          ROMPTR  0E8 02C                        * D29AD
          '                                      * D29B8
          ID      EXAMPLES                       * D29BD
          DUP                                    * D29D4
          CREATEDIR                              * D29D9
          EVAL                                   * D29DE
          '                                      * D29E3
          ::                                     * D29E8
            x<<                                  * D29ED
            xHOME                                * D29F2
            x'                                   * D29F7
            ID      EXAMPLES                     * D29FC
            xENDTIC                              * D2A13
            xPGDIR                               * D2A18
            x>>                                  * D2A1D
          ;                                      * D2A22
          '                                      * D2A27
          ID      PURGEX                         * D2A2C
          XEQSTOID                               * D2A3F
          '                                      * D2A44
          ROMPTR  0E8 02E                        * D2A49
          OBJ_72AFA                              * D2A54
          '                                      * D2A59
          ID      %TILE                          * D2A5E
          XEQSTOID                               * D2A6F
          '                                      * D2A74
          ID      EQNS                           * D2A79
          DUP                                    * D2A88
          CREATEDIR                              * D2A8D
          EVAL                                   * D2A92
          $       "6\0Dx\0C-9)+4\0D6+x-x\0C)+2\0Dx\0C+5*x+6)" * D2A97
          ROMPTR  0E3 028                        * D2ADB
          '                                      * D2AE6
          ID      RATFUNC                        * D2AEB
          XEQSTOID                               * D2B00
          $       "4*\05X)"                      * D2B05
          ROMPTR  0E3 028                        * D2B19
          '                                      * D2B24
          ID      FOUR                           * D2B29
          XEQSTOID                               * D2B38
          $       "3*\05X)"                      * D2B3D
          ROMPTR  0E3 028                        * D2B51
          '                                      * D2B5C
          ID      THREE                          * D2B61
          XEQSTOID                               * D2B72
          $       "2*\05X)"                      * D2B77
          ROMPTR  0E3 028                        * D2B8B
          '                                      * D2B96
          ID      TWO                            * D2B9B
          XEQSTOID                               * D2BA8
          $       "\05X)"                        * D2BAD
          ROMPTR  0E3 028                        * D2BBD
          '                                      * D2BC8
          ID      ONE                            * D2BCD
          XEQSTOID                               * D2BDA
          UPDIR                                  * D2BDF
          '                                      * D2BE4
          ID      PLOTS                          * D2BE9
          DUP                                    * D2BFA
          CREATEDIR                              * D2BFF
          EVAL                                   * D2C04
          '                                      * D2C09
          ROMPTR  0E8 03A                        * D2C0E
          OBJ_72AFA                              * D2C19
          '                                      * D2C1E
          ID      XSIN                           * D2C23
          '                                      * D2C32
          ROMPTR  0E8 039                        * D2C37
          OBJ_72AFA                              * D2C42
          '                                      * D2C47
          ID      ELLIP                          * D2C4C
          '                                      * D2C5D
          ROMPTR  0E8 038                        * D2C62
          OBJ_72AFA                              * D2C6D
          '                                      * D2C72
          ID      LISSA                          * D2C77
          '                                      * D2C88
          ROMPTR  0E8 037                        * D2C8D
          OBJ_72AFA                              * D2C98
          '                                      * D2C9D
          ID      ROSE                           * D2CA2
          '                                      * D2CB1
          ROMPTR  0E8 036                        * D2CB6
          OBJ_72AFA                              * D2CC1
          '                                      * D2CC6
          ID      PTRN                           * D2CCB
          '                                      * D2CDA
          ROMPTR  0E8 035                        * D2CDF
          OBJ_72AFA                              * D2CEA
          '                                      * D2CEF
          ID      DEQ                            * D2CF4
          '                                      * D2D01
          ROMPTR  0E8 034                        * D2D06
          OBJ_72AFA                              * D2D11
          '                                      * D2D16
          ID      SPFLD                          * D2D1B
          '                                      * D2D2C
          ROMPTR  0E8 033                        * D2D31
          OBJ_72AFA                              * D2D3C
          '                                      * D2D41
          ID      PSCN                           * D2D46
          '                                      * D2D55
          ROMPTR  0E8 032                        * D2D5A
          OBJ_72AFA                              * D2D65
          '                                      * D2D6A
          ID      GRID                           * D2D6F
          '                                      * D2D7E
          ROMPTR  0E8 031                        * D2D83
          OBJ_72AFA                              * D2D8E
          '                                      * D2D93
          ID      PSUR                           * D2D98
          '                                      * D2DA7
          ROMPTR  0E8 030                        * D2DAC
          OBJ_72AFA                              * D2DB7
          '                                      * D2DBC
          ID      WIRE                           * D2DC1
          '                                      * D2DD0
          ROMPTR  0E8 02F                        * D2DD5
          OBJ_72AFA                              * D2DE0
          '                                      * D2DE5
          ID      SLICE                          * D2DEA
          BINT12                                 * D2DFB
          ZERO_DO                                * D2E00
          XEQSTOID                               * D2E05
          LOOP                                   * D2E0A
          UPDIR                                  * D2E0F
          '                                      * D2E14
          ID      PRGS                           * D2E19
          DUP                                    * D2E28
          CREATEDIR                              * D2E2D
          EVAL                                   * D2E32
          '                                      * D2E37
          ROMPTR  0E8 03B                        * D2E3C
          OBJ_72AFA                              * D2E47
          '                                      * D2E4C
          ID      →RPN                           * D2E51
          XEQSTOID                               * D2E60
          '                                      * D2E65
          ROMPTR  0E8 03C                        * D2E6A
          OBJ_72AFA                              * D2E75
          '                                      * D2E7A
          ID      APLY                           * D2E7F
          XEQSTOID                               * D2E8E
          '                                      * D2E93
          ROMPTR  0E8 03D                        * D2E98
          OBJ_72AFA                              * D2EA3
          '                                      * D2EA8
          ID      FIBON                          * D2EAD
          XEQSTOID                               * D2EBE
          '                                      * D2EC3
          ROMPTR  0E8 03E                        * D2EC8
          OBJ_72AFA                              * D2ED3
          '                                      * D2ED8
          ID      MEDIAN                         * D2EDD
          XEQSTOID                               * D2EF0
          HOMEDIR                                * D2EF5
          ClrDAsOK                               * D2EFA
        ;                                        * D2EFF

* ROMPTR 0E8 02E
* refs (1): D136E
ROMP_0E8_02E:
        ::                                       * D2F04
          x<<                                    * D2F09
          xSWAP                                  * D2F0E
          ROMPTR  0AB 06E                        * D2F13  SORT
          xDUP                                   * D2F1E
          xSIZE                                  * D2F23
          %1                                     * D2F28
          x+                                     * D2F2D
          xROT                                   * D2F32
          %       1E2                            * D2F37
          x/                                     * D2F4C
          x*                                     * D2F51
          xRPN->                                 * D2F56
          LAM     p                              * D2F5B
          x<<                                    * D2F64
          xDUP                                   * D2F69
          LAM     p                              * D2F6E
          xFLOOR                                 * D2F77
          xGET                                   * D2F7C
          xSWAP                                  * D2F81
          LAM     p                              * D2F86
          xCEIL                                  * D2F8F
          xGET                                   * D2F94
          x+                                     * D2F99
          %2                                     * D2F9E
          x/                                     * D2FA3
          x>>ABND                                * D2FA8
          x>>                                    * D2FAD
        ;                                        * D2FB2

* ROMPTR 0E8 02F
* refs (1): D136E
ROMP_0E8_02F:
        ::                                       * D2FB7
          x<<                                    * D2FBC
          xRAD                                   * D2FC1
          {                                      * D2FC6
            xPICT                                * D2FCB
            ID      PPAR                         * D2FD0
            ID      VPAR                         * D2FDF
          }                                      * D2FEE
          xPURGE                                 * D2FF3
          ROMPTR  0AB 00B                        * D2FF8  YSLICE
          SYMBOL                                 * D3003
            ID      X                            * D3008
            %3                                   * D3011
            x^                                   * D3016
            ID      Y                            * D301B
            x*                                   * D3024
            ID      X                            * D3029
            ID      Y                            * D3032
            %3                                   * D303B
            x^                                   * D3040
            x*                                   * D3045
            x-                                   * D304A
          ;                                      * D304F
          xSTEQ                                  * D3054
          %       -5E-1                          * D3059
          %       5E-1                           * D306E
          ROMPTR  0AB 002                        * D3083  ZVOL
          xDRAW                                  * D308E
          x>>                                    * D3093
        ;                                        * D3098

* ROMPTR 0E8 030
* refs (1): D136E
ROMP_0E8_030:
        ::                                       * D309D
          x<<                                    * D30A2
          {                                      * D30A7
            xPICT                                * D30AC
            ID      PPAR                         * D30B1
            ID      VPAR                         * D30C0
          }                                      * D30CF
          xPURGE                                 * D30D4
          ROMPTR  0AB 008                        * D30D9  WIREFRAME
          SYMBOL                                 * D30E4
            ID      X                            * D30E9
            %3                                   * D30F2
            x^                                   * D30F7
            ID      Y                            * D30FC
            x*                                   * D3105
            ID      X                            * D310A
            ID      Y                            * D3113
            %3                                   * D311C
            x^                                   * D3121
            x*                                   * D3126
            x-                                   * D312B
          ;                                      * D3130
          xSTEQ                                  * D3135
          %       1.2E1                          * D313A
          ROMPTR  0AB 006                        * D314F  NUMX
          %       1.2E1                          * D315A
          ROMPTR  0AB 007                        * D316F  NUMY
          %       -4E-1                          * D317A
          %       4E-1                           * D318F
          ROMPTR  0AB 002                        * D31A4  ZVOL
          %0_2A2B4                               * D31AF
          %-2                                    * D31B4
          %1                                     * D31B9
          ROMPTR  0AB 005                        * D31BE  EYEPT
          xDRAW                                  * D31C9
          xGRAPH                                 * D31CE
          x>>                                    * D31D3
        ;                                        * D31D8

* ROMPTR 0E8 031
* refs (1): D136E
ROMP_0E8_031:
        ::                                       * D31DD
          x<<                                    * D31E2
          xRAD                                   * D31E7
          {                                      * D31EC
            xPICT                                * D31F1
            ID      PPAR                         * D31F6
            ID      VPAR                         * D3205
          }                                      * D3214
          xPURGE                                 * D3219
          ROMPTR  0AB 009                        * D321E  PARSURFACE
          {                                      * D3229
            SYMBOL                               * D322E
              ID      X                          * D3233
              ID      Y                          * D323C
              xCOS                               * D3245
              x*                                 * D324A
            ;                                    * D324F
            SYMBOL                               * D3254
              ID      X                          * D3259
              ID      Y                          * D3262
              xSIN                               * D326B
              x*                                 * D3270
            ;                                    * D3275
            ID      X                            * D327A
          }                                      * D3283
          xSTEQ                                  * D3288
          %       1.6E1                          * D328D
          ROMPTR  0AB 006                        * D32A2  NUMX
          %       1.6E1                          * D32AD
          ROMPTR  0AB 007                        * D32C2  NUMY
          %       -3.14159E0                     * D32CD
          %       3.14159E0                      * D32E2
          xDUP2                                  * D32F7
          xDUP2                                  * D32FC
          %4                                     * D3301
          xDUPN                                  * D3306
          ROMPTR  0AB 000                        * D330B  XVOL
          ROMPTR  0AB 001                        * D3316  YVOL
          ROMPTR  0AB 002                        * D3321  ZVOL
          ROMPTR  0AB 003                        * D332C  XXRNG
          ROMPTR  0AB 004                        * D3337  YYRNG
          %0_2A2B4                               * D3342
          %       -4.2E0                         * D3347
          %0_2A2B4                               * D335C
          ROMPTR  0AB 005                        * D3361  EYEPT
          xDRAW                                  * D336C
          xGRAPH                                 * D3371
          x>>                                    * D3376
        ;                                        * D337B

* ROMPTR 0E8 032
* refs (1): D136E
ROMP_0E8_032:
        ::                                       * D3380
          x<<                                    * D3385
          xRAD                                   * D338A
          {                                      * D338F
            xPICT                                * D3394
            ID      PPAR                         * D3399
            ID      VPAR                         * D33A8
          }                                      * D33B7
          xPURGE                                 * D33BC
          ROMPTR  0AB 00A                        * D33C1  GRIDMAP
          SYMBOL                                 * D33CC
            ID      X                            * D33D1
            ID      Y                            * D33DA
            xi                                   * D33E3
            x*                                   * D33E8
            x+                                   * D33ED
            xSIN                                 * D33F2
          ;                                      * D33F7
          xSTEQ                                  * D33FC
          xDRAW                                  * D3401
          xGRAPH                                 * D3406
          x>>                                    * D340B
        ;                                        * D3410

* ROMPTR 0E8 033
* refs (1): D136E
ROMP_0E8_033:
        ::                                       * D3415
          x<<                                    * D341A
          xRAD                                   * D341F
          {                                      * D3424
            xPICT                                * D3429
            ID      PPAR                         * D342E
            ID      VPAR                         * D343D
          }                                      * D344C
          xPURGE                                 * D3451
          ROMPTR  0AB 00D                        * D3456  PCONTOUR
          SYMBOL                                 * D3461
            ID      X                            * D3466
            %2                                   * D346F
            x^                                   * D3474
            %1                                   * D3479
            x-                                   * D347E
            ID      Y                            * D3483
            %2                                   * D348C
            x^                                   * D3491
            %1                                   * D3496
            x-                                   * D349B
            x/                                   * D34A0
          ;                                      * D34A5
          xSTEQ                                  * D34AA
          %       1.6E1                          * D34AF
          ROMPTR  0AB 006                        * D34C4  NUMX
          %16                                    * D34CF
          ROMPTR  0AB 007                        * D34D4  NUMY
          %-2                                    * D34DF
          %2                                     * D34E4
          ROMPTR  0AB 000                        * D34E9  XVOL
          %-2                                    * D34F4
          %2                                     * D34F9
          ROMPTR  0AB 001                        * D34FE  YVOL
          xDRAW                                  * D3509
          xGRAPH                                 * D350E
          x>>                                    * D3513
        ;                                        * D3518

* ROMPTR 0E8 034
* refs (1): D136E
ROMP_0E8_034:
        ::                                       * D351D
          x<<                                    * D3522
          xRAD                                   * D3527
          {                                      * D352C
            xPICT                                * D3531
            ID      PPAR                         * D3536
            ID      VPAR                         * D3545
          }                                      * D3554
          xPURGE                                 * D3559
          ROMPTR  0AB 00C                        * D355E  SLOPEFIELD
          SYMBOL                                 * D3569
            ID      X                            * D356E
            %2                                   * D3577
            x^                                   * D357C
            %1                                   * D3581
            x-                                   * D3586
            ID      Y                            * D358B
            %2                                   * D3594
            x^                                   * D3599
            %1                                   * D359E
            x-                                   * D35A3
            x/                                   * D35A8
          ;                                      * D35AD
          xSTEQ                                  * D35B2
          %       1.6E1                          * D35B7
          ROMPTR  0AB 006                        * D35CC  NUMX
          %16                                    * D35D7
          ROMPTR  0AB 007                        * D35DC  NUMY
          %-2                                    * D35E7
          %2                                     * D35EC
          ROMPTR  0AB 000                        * D35F1  XVOL
          %-2                                    * D35FC
          %2                                     * D3601
          ROMPTR  0AB 001                        * D3606  YVOL
          xDRAW                                  * D3611
          xGRAPH                                 * D3616
          x>>                                    * D361B
        ;                                        * D3620

* ROMPTR 0E8 035
* refs (1): D136E
ROMP_0E8_035:
        ::                                       * D3625
          x<<                                    * D362A
          xSILENT'                               * D362F
          ::                                     * D3634
            x<<                                  * D3639
            ID      Y                            * D363E
            xOBJ>                                * D3647
            xDROP                                * D364C
            ID      T                            * D3651
            %5                                   * D365A
            x*                                   * D365F
            xCOS                                 * D3664
            %       1.2E1                        * D3669
            x*                                   * D367E
            xROT                                 * D3683
            %       4.9E1                        * D3688
            x*                                   * D369D
            x-                                   * D36A2
            %2                                   * D36A7
            x>ARRY                               * D36AC
            x>>                                  * D36B1
          ;                                      * D36B6
          xSTEQ                                  * D36BB
          xRAD                                   * D36C0
          {                                      * D36C5
            xPICT                                * D36CA
            ID      PPAR                         * D36CF
          }                                      * D36DE
          xPURGE                                 * D36E3
          ROMPTR  0AB 00E                        * D36E8  DIFFEQ
          %-2                                    * D36F3
          %2                                     * D36F8
          xXRNG                                  * D36FD
          %-8                                    * D3702
          %8                                     * D3707
          xYRNG                                  * D370C
          {                                      * D3711
            ID      T                            * D3716
            %0_2A2B4                             * D371F
            %PI                                  * D3724
          }                                      * D3729
          xINDEP                                 * D372E
          {                                      * D3733
            ID      Y                            * D3738
            CON(5)  DOARRY                       * D3741  array 2
            LENGTH                               * D3746  length, to #D377A
            CON(5)  DOREAL                       * D374B  element type
            CON(5)  1                            * D3750  dimensions
            CON(5)  2                            * D3755
            NIBHEX  0000000000000000             * D375A  0E0
            NIBHEX  0000000000000000             * D376A  0E0
        ENDLENGTH                                * D377A
            %       1E-3                         * D377A
          }                                      * D378F
          xDEPND                                 * D3794
          {                                      * D3799
            C%      0E0 0E0                      * D379E
            $       "1"                          * D37C3
            $       "2"                          * D37CF
          }                                      * D37DB
          xAXES                                  * D37E0
          %       5E-2                           * D37E5
          xRES                                   * D37FA
          xDRAX                                  * D37FF
          xDRAW                                  * D3804
          xGRAPH                                 * D3809
          x>>                                    * D380E
        ;                                        * D3813

* ROMPTR 0E8 036
* refs (1): D136E
ROMP_0E8_036:
        ::                                       * D3818
          x<<                                    * D381D
          xRAD                                   * D3822
          {                                      * D3827
            xPICT                                * D382C
            ID      PPAR                         * D3831
          }                                      * D3840
          xPURGE                                 * D3845
          ROMPTR  0F1 037                        * D384A  TRUTH
          SYMBOL                                 * D3855
            ID      X                            * D385A
            %2                                   * D3863
            x^                                   * D3868
            ID      Y                            * D386D
            %3                                   * D3876
            x^                                   * D387B
            x+                                   * D3880
            %4                                   * D3885
            xMOD                                 * D388A
            %2                                   * D388F
            x<                                   * D3894
          ;                                      * D3899
          xSTEQ                                  * D389E
          xDRAX                                  * D38A3
          xDRAW                                  * D38A8
          xGRAPH                                 * D38AD
          x>>                                    * D38B2
        ;                                        * D38B7

* ROMPTR 0E8 037
* refs (1): D136E
ROMP_0E8_037:
        ::                                       * D38BC
          x<<                                    * D38C1
          xRAD                                   * D38C6
          {                                      * D38CB
            xPICT                                * D38D0
            ID      PPAR                         * D38D5
          }                                      * D38E4
          xPURGE                                 * D38E9
          ROMPTR  0F1 035                        * D38EE  POLAR
          ID      θ                              * D38F9
          xINDEP                                 * D3902
          SYMBOL                                 * D3907
            %2                                   * D390C
            %4                                   * D3911
            ID      θ                            * D3916
            x*                                   * D391F
            xCOS                                 * D3924
            x*                                   * D3929
          ;                                      * D392E
          xSTEQ                                  * D3933
          xDRAX                                  * D3938
          xDRAW                                  * D393D
          xGRAPH                                 * D3942
          x>>                                    * D3947
        ;                                        * D394C

* ROMPTR 0E8 038
* refs (1): D136E
ROMP_0E8_038:
        ::                                       * D3951
          x<<                                    * D3956
          {                                      * D395B
            xPICT                                * D3960
            ID      PPAR                         * D3965
          }                                      * D3974
          xPURGE                                 * D3979
          xRAD                                   * D397E
          ROMPTR  0F1 036                        * D3983  PARAMETRIC
          {                                      * D398E
            ID      T                            * D3993
            %0_2A2B4                             * D399C
            %       6.5E0                        * D39A1
          }                                      * D39B6
          xINDEP                                 * D39BB
          SYMBOL                                 * D39C0
            %3                                   * D39C5
            %3                                   * D39CA
            ID      T                            * D39CF
            x*                                   * D39D8
            xSIN                                 * D39DD
            x*                                   * D39E2
            xi                                   * D39E7
            %2                                   * D39EC
            x*                                   * D39F1
            %4                                   * D39F6
            ID      T                            * D39FB
            x*                                   * D3A04
            xSIN                                 * D3A09
            x*                                   * D3A0E
            x+                                   * D3A13
          ;                                      * D3A18
          xSTEQ                                  * D3A1D
          xDRAX                                  * D3A22
          xDRAW                                  * D3A27
          xGRAPH                                 * D3A2C
          x>>                                    * D3A31
        ;                                        * D3A36

* ROMPTR 0E8 039
* refs (1): D136E
ROMP_0E8_039:
        ::                                       * D3A3B
          x<<                                    * D3A40
          {                                      * D3A45
            xPICT                                * D3A4A
            ID      PPAR                         * D3A4F
          }                                      * D3A5E
          xPURGE                                 * D3A63
          ROMPTR  0F1 034                        * D3A68  CONIC
          %       1E-2                           * D3A73
          xRES                                   * D3A88
          {                                      * D3A8D
            ID      X                            * D3A92
            %-2                                  * D3A9B
            %2                                   * D3AA0
          }                                      * D3AA5
          xINDEP                                 * D3AAA
          SYMBOL                                 * D3AAF
            %5                                   * D3AB4
            ID      X                            * D3AB9
            %2                                   * D3AC2
            x^                                   * D3AC7
            x*                                   * D3ACC
            %3                                   * D3AD1
            ID      Y                            * D3AD6
            %2                                   * D3ADF
            x^                                   * D3AE4
            x*                                   * D3AE9
            x+                                   * D3AEE
            %       1.8E1                        * D3AF3
            x-                                   * D3B08
          ;                                      * D3B0D
          xSTEQ                                  * D3B12
          xDRAX                                  * D3B17
          xDRAW                                  * D3B1C
          xGRAPH                                 * D3B21
          x>>                                    * D3B26
        ;                                        * D3B2B

* ROMPTR 0E8 03A
* refs (1): D136E
ROMP_0E8_03A:
        ::                                       * D3B30
          x<<                                    * D3B35
          xRAD                                   * D3B3A
          {                                      * D3B3F
            xPICT                                * D3B44
            ID      PPAR                         * D3B49
          }                                      * D3B58
          xPURGE                                 * D3B5D
          SYMBOL                                 * D3B62
            ID      X                            * D3B67
            %2                                   * D3B70
            ID      X                            * D3B75
            x*                                   * D3B7E
            xSIN                                 * D3B83
            x+                                   * D3B88
          ;                                      * D3B8D
          xSTEQ                                  * D3B92
          xDRAX                                  * D3B97
          xDRAW                                  * D3B9C
          xGRAPH                                 * D3BA1
          x>>                                    * D3BA6
        ;                                        * D3BAB

* ROMPTR 0E8 03B
* refs (1): D136E
ROMP_0E8_03B:
        ::                                       * D3BB0
          x<<                                    * D3BB5
          xOBJ>                                  * D3BBA
          xIF                                    * D3BBF
          xOVER                                  * D3BC4
          xTHEN                                  * D3BC9
          ::                                     * D3BCE
            xRPN->                               * D3BD3
            LAM     n                            * D3BD8
            LAM     f                            * D3BE1
            x<<                                  * D3BEA
            %1                                   * D3BEF
            LAM     n                            * D3BF4
            xSTARTVAR                            * D3BFD
            LAM     i                            * D3C02
            xIF                                  * D3C0B
            xDUP                                 * D3C10
            xTYPE                                * D3C15
            %9                                   * D3C1A
            xSAME                                * D3C1F
            xTHEN                                * D3C24
            ID      →RPN                         * D3C29
            xIFEND                               * D3C38
            LAM     n                            * D3C3D
            xROLLD                               * D3C46
            xNEXT                                * D3C4B
            xIF                                  * D3C50
            xDUP                                 * D3C55
            xTYPE                                * D3C5A
            %5                                   * D3C5F
            x#?                                  * D3C64
            xTHEN                                * D3C69
            ::                                   * D3C6E
              %1                                 * D3C73
              x>LIST                             * D3C78
            ;                                    * D3C7D
            xIFEND                               * D3C82
            xIF                                  * D3C87
            LAM     n                            * D3C8C
            %1                                   * D3C95
            x>                                   * D3C9A
            xTHEN                                * D3C9F
            ::                                   * D3CA4
              %2                                 * D3CA9
              LAM     n                          * D3CAE
              xSTART                             * D3CB7
              x+                                 * D3CBC
              xNEXT                              * D3CC1
            ;                                    * D3CC6
            xIFEND                               * D3CCB
            LAM     f                            * D3CD0
            x+                                   * D3CD9
            x>>ABND                              * D3CDE
          ;                                      * D3CE3
          xELSE                                  * D3CE8
          ::                                     * D3CED
            %1                                   * D3CF2
            x>LIST                               * D3CF7
            xSWAP                                * D3CFC
            xDROP                                * D3D01
          ;                                      * D3D06
          xIFEND                                 * D3D0B
          x>>                                    * D3D10
        ;                                        * D3D15

* ROMPTR 0E8 03C
* refs (1): D136E
ROMP_0E8_03C:
        ::                                       * D3D1A
          x<<                                    * D3D1F
          xRPN->                                 * D3D24
          LAM     a                              * D3D29
          LAM     p                              * D3D32
          x<<                                    * D3D3B
          %1                                     * D3D40
          xCF                                    * D3D45
          LAM     a                              * D3D4A
          xDUP                                   * D3D53
          xSIZE                                  * D3D58
          xDUP                                   * D3D5D
          xSIZE                                  * D3D62
          xIF                                    * D3D67
          %1                                     * D3D6C
          x==                                    * D3D71
          xTHEN                                  * D3D76
          ::                                     * D3D7B
            %1                                   * D3D80
            xSF                                  * D3D85
            %1                                   * D3D8A
            x+                                   * D3D8F
            xSWAP                                * D3D94
            xOBJ>                                * D3D99
            xOBJ>                                * D3D9E
            xDROP                                * D3DA3
            %1                                   * D3DA8
            x+                                   * D3DAD
            xROLL                                * D3DB2
          ;                                      * D3DB7
          xELSE                                  * D3DBC
          ::                                     * D3DC1
            xDROP2                               * D3DC6
            LAM     a                            * D3DCB
            xOBJ>                                * D3DD4
          ;                                      * D3DD9
          xIFEND                                 * D3DDE
          xDUP                                   * D3DE3
          xOBJ>                                  * D3DE8
          xDROP                                  * D3DED
          x*                                     * D3DF2
          xSWAP                                  * D3DF7
          xOVER                                  * D3DFC
          %2                                     * D3E01
          x+                                     * D3E06
          xROLLD                                 * D3E0B
          x>LIST                                 * D3E10
          %1                                     * D3E15
          LAM     p                              * D3E1A
          ROMPTR  0AB 063                        * D3E23  DOSUBS
          xOBJ>                                  * D3E2E
          %1                                     * D3E33
          x+                                     * D3E38
          xROLL                                  * D3E3D
          xIFERR                                 * D3E42
          ::                                     * D3E47
            xIF                                  * D3E4C
            %1                                   * D3E51
            xFS?                                 * D3E56
            xTHEN                                * D3E5B
            ::                                   * D3E60
              xOBJ>                              * D3E65
              xDROP                              * D3E6A
              x>LIST                             * D3E6F
            ;                                    * D3E74
            xIFEND                               * D3E79
            x>ARRY                               * D3E7E
          ;                                      * D3E83
          xERRTHEN                               * D3E88
          ::                                     * D3E8D
            xOBJ>                                * D3E92
            xIF                                  * D3E97
            %1                                   * D3E9C
            xFC?C                                * D3EA1
            xTHEN                                * D3EA6
            xDROP                                * D3EAB
            xIFEND                               * D3EB0
            xRPN->                               * D3EB5
            LAM     n                            * D3EBA
            LAM     m                            * D3EC3
            x<<                                  * D3ECC
            %1                                   * D3ED1
            LAM     n                            * D3ED6
            xSTARTVAR                            * D3EDF
            LAM     i                            * D3EE4
            LAM     m                            * D3EED
            x>LIST                               * D3EF6
            SYMBOL                               * D3EFB
              LAM     m                          * D3F00
              LAM     n                          * D3F09
              LAM     i                          * D3F12
              x-                                 * D3F1B
              x*                                 * D3F20
              LAM     i                          * D3F25
              x+                                 * D3F2E
            ;                                    * D3F33
            xEVAL                                * D3F38
            xROLLD                               * D3F3D
            xNEXT                                * D3F42
            LAM     n                            * D3F47
            x>LIST                               * D3F50
            x>>ABND                              * D3F55
          ;                                      * D3F5A
          xIFEND                                 * D3F5F
          %1                                     * D3F64
          xCF                                    * D3F69
          x>>ABND                                * D3F6E
          x>>                                    * D3F73
        ;                                        * D3F78

* ROMPTR 0E8 03D
* refs (1): D136E
ROMP_0E8_03D:
        ::                                       * D3F7D
          x<<                                    * D3F82
          xIF                                    * D3F87
          ID      n                              * D3F8C
          %1                                     * D3F95
          x<=?                                   * D3F9A
          xTHEN                                  * D3F9F
          ID      n                              * D3FA4
          xELSE                                  * D3FAD
          ::                                     * D3FB2
            %0_2A2B4                             * D3FB7
            %1                                   * D3FBC
            %2                                   * D3FC1
            ID      n                            * D3FC6
            xSTART                               * D3FCF
            xDUP                                 * D3FD4
            xROT                                 * D3FD9
            x+                                   * D3FDE
            xNEXT                                * D3FE3
            xDROP                                * D3FE8
          ;                                      * D3FED
          xIFEND                                 * D3FF2
          x>>                                    * D3FF7
        ;                                        * D3FFC

* ROMPTR 0E8 03E
* refs (1): D136E
ROMP_0E8_03E:
        ::                                       * D4001
          x<<                                    * D4006
          xRCLSIGMA                              * D400B
          xDUP                                   * D4010
          xSIZE                                  * D4015
          xOBJ>                                  * D401A
          xDROP                                  * D401F
          xRPN->                                 * D4024
          LAM     s                              * D4029
          LAM     n                              * D4032
          LAM     m                              * D403B
          x<<                                    * D4044
          x'                                     * D4049
          ID      ΣDAT                           * D404E
          xENDTIC                                * D405D
          xTRN                                   * D4062
          %1                                     * D4067
          LAM     m                              * D406C
          xSTARTVAR                              * D4075
          LAM     j                              * D407A
          xSIGMA-                                * D4083
          xOBJ>                                  * D4088
          xDROP                                  * D408D
          LAM     n                              * D4092
          x>LIST                                 * D409B
          %       5E1                            * D40A0
          ID      %TILE                          * D40B5
          LAM     j                              * D40C6
          xROLLD                                 * D40CF
          xNEXT                                  * D40D4
          LAM     m                              * D40D9
          x>ARRY                                 * D40E2
          LAM     s                              * D40E7
          xSTOSIGMA                              * D40F0
          x>>ABND                                * D40F5
          x>>                                    * D40FA
        ;                                        * D40FF

* ROMPTR 0E8 03F
* refs (1): D136E
ROMP_0E8_03F:
        ::                                       * D4104
          DUP                                    * D4109
          OBJ_4C64D                              * D410E
          NcaseTYPEERR                           * D4113
          RclAx*s                                * D4118
          ::                                     * D411D
            DUPTYPECMP?                          * D4122
            case                                 * D4127
            ::                                   * D412C
              SWAP                               * D4131
              TWO{}N                             * D4136
            ;                                    * D413B
            INNERCOMP                            * D4140
            DUP#1=                               * D4145
            casedrop                             * D414A
            ::                                   * D414F
              SWAP                               * D4154
              TWO{}N                             * D4159
            ;                                    * D415E
            DUP                                  * D4163
            #2=                                  * D4168
            casedrop                             * D416D
            ::                                   * D4172
              DUPTYPECSTR?                       * D4177
              case                               * D417C
              ::                                 * D4181
                C%0                              * D4186
                4UNROLL                          * D418B
                BINT4                            * D4190
                {}N                              * D4195
              ;                                  * D419A
              DROP                               * D419F
              SWAP                               * D41A4
              TWO{}N                             * D41A9
            ;                                    * D41AE
            BINT4                                * D41B3
            #=                                   * D41B8
            IT                                   * D41BD
            ROTDROP                              * D41C2
            4ROLL                                * D41C7
            3UNROLL                              * D41CC
            BINT4                                * D41D1
            {}N                                  * D41D6
          ;                                      * D41DB
          ax*s(c)                                * D41E0
        ;                                        * D41E5

* ROMPTR 0E8 040
* refs (1): D136E
ROMP_0E8_040:
        ::                                       * D41EA
          FALSE                                  * D41EF
          ROMPTR  0E8 042                        * D41F4
        ;                                        * D41FF

* ROMPTR 0E8 041
* refs (1): D136E
ROMP_0E8_041:
        ::                                       * D4204
          TRUE                                   * D4209
          ROMPTR  0E8 042                        * D420E
        ;                                        * D4219

* ROMPTR 0E8 042
* refs (1): D136E
ROMP_0E8_042:
        ::                                       * D421E
          DOOPENIO                               * D4223
          ITE                                    * D4228
          ::                                     * D422D
            dup;RclInVars(gn)?                   * D4232
            IT                                   * D4237
            ::                                   * D423C
              DROP                               * D4241
              BINT36                             * D4246
              TestSysFlag                        * D424B
              NOTcase                            * D4250
              ::                                 * D4255
                #       13C                      * D425A  316
                ERROROUT                         * D4264
              ;                                  * D4269
            ;                                    * D426E
            GARBAGE                              * D4273
            MEM                                  * D4278
            CODE                                 * D427D  794 nibbles
              GOSBVL  SAVPTR                     * D4287
              GOSBVL  POP#                       * D428E
              ASRB.F  A                          * D4295
              LC(5)   #007D0                     * D429A
              C=A-C   A                          * D42A1
              GONC    L_D42AD                    * D42A3
              GOVLNG  GPMEMERR                   * D42A6
L_D42AD:
              R1=C                               * D42AD
              GOSBVL  MAKE$                      * D42B0
              GOSBVL  DisableIntr                * D42B7
              LC(3)   #A01                       * D42BE
              R2=C                               * D42C3
              ST=0    8                          * D42C6
              ST=1    3                          * D42C9
              ST=1    6                          * D42CC
L_D42CF:
              A=R2                               * D42CF
              A=A-1   XS                         * D42D2
              GOC     L_D4328                    * D42D5
              R2=A                               * D42D8
              ?ST=1   8                          * D42DB
              GOYES   L_D4342                    * D42DE
              LC(2)   #15                        * D42E0
L_D42E4:
              GOSUB   SUB_D454E                  * D42E4
              CD0EX                              * D42E8
              D0=C                               * D42EB
              R3=C                               * D42EE
              ST=0    2                          * D42F1
L_D42F4:
              ST=0    1                          * D42F4
              LC(5)   #14000                     * D42F7
              GOSUB   SUB_D446F                  * D42FE
              GOC     L_D42CF                    * D4302
              C=0     A                          * D4305
              LC(2)   #7F                        * D4307
              D=C     A                          * D430B
              LC(2)   #01                        * D430D
              ?C=A    B                          * D4311
              GOYES   L_D4353                    * D4314
              LC(2)   #04                        * D4316
              ?C=A    B                          * D431A
              GOYES   L_D4333                    * D431D
              LC(2)   #18                        * D431F
              ?C#A    B                          * D4323
              GOYES   L_D42F4                    * D4326
L_D4328:
              LC(5)   xferfailerr                * D4328
L_D432F:
              GOTO    L_D4405                    * D432F
L_D4333:
              LC(2)   #06                        * D4333
              GOSUB   SUB_D454E                  * D4337
              ST=0    3                          * D433B
              GOTO    L_D440F                    * D433E
L_D4342:
              GOTO    L_D43FE                    * D4342
L_D4346:
              C=RSTK                             * D4346
L_D4348:
              GOSUB   SUB_D4468                  * D4348
              GONC    L_D4348                    * D434C
L_D434F:
              GOTO    L_D42CF                    * D434F
L_D4353:
              GOSUB   SUB_D4468                  * D4353
              GOC     L_D4348                    * D4357
              C=A     A                          * D435A
              A=R2                               * D435C
              ?C=A    B                          * D435F
              GOYES   L_D436E                    * D4362
              A=A-1   A                          * D4364
              ?C#A    B                          * D4366
              GOYES   L_D4348                    * D4369
              ST=1    2                          * D436B
L_D436E:
              RSTK=C                             * D436E
              GOSUB   SUB_D4468                  * D4370
              GOC     L_D4346                    * D4374
              A=-A-1  B                          * D4377
              C=RSTK                             * D437A
              ?C#A    B                          * D437C
              GOYES   L_D4348                    * D437F
              B=0     A                          * D4381
L_D4383:
              C=R1                               * D4383
              C=C-1   A                          * D4386
              R1=C                               * D4388
              C=0     A                          * D438B
              LC(1)   #1                         * D438D
              GOC     L_D432F                    * D4390
              GOSUB   SUB_D4468                  * D4393
              GOC     L_D43B8                    * D4397
              DAT0=A  B                          * D439A
              D0=D0+  2                          * D439D
              B=B+A   A                          * D43A0
              D=D-1   A                          * D43A2
              GONC    L_D4383                    * D43A4
              GOSUB   SUB_D4468                  * D43A7
              GOC     L_D43B8                    * D43AB
              ?ST=1   8                          * D43AE
              GOYES   L_D43FE                    * D43B1
              ?A=B    B                          * D43B3
              GOYES   L_D43BB                    * D43B6
L_D43B8:
              ST=1    1                          * D43B8
L_D43BB:
              ?ST=1   1                          * D43BB
              GOYES   L_D43C5                    * D43BE
              ?ST=0   2                          * D43C0
              GOYES   L_D43E6                    * D43C3
L_D43C5:
              C=R3                               * D43C5
              D0=C                               * D43C8
              A=R1                               * D43CB
              C=0     A                          * D43CE
              LC(2)   #7F                        * D43D0
              A=A+C   A                          * D43D4
              C=D     A                          * D43D6
              A=A-C   A                          * D43D8
              R1=A                               * D43DA
              ?ST=0   1                          * D43DD
              GOYES   L_D43F6                    * D43E0
              GOTO    L_D434F                    * D43E2
L_D43E6:
              C=R2                               * D43E6
              C=C+1   B                          * D43E9
              P=      2                          * D43EC
              LC(1)   #9                         * D43EE
              P=      0                          * D43F1
              R2=C                               * D43F3
L_D43F6:
              LC(2)   #06                        * D43F6
              GOTO    L_D42E4                    * D43FA
L_D43FE:
              LC(5)   intrptderr                 * D43FE
L_D4405:
              R4=C                               * D4405
              GOSUB   SUB_D4457                  * D4408
L_D440C:
              ST=1    3                          * D440C
L_D440F:
              GOSBVL  Shrink$                    * D440F
              D1=(5)  ANNCTRL2                   * D4416
              C=DAT1  1                          * D441D
              CBIT=0  1                          * D4421
              DAT1=C  1                          * D4426
              GOSBVL  AllowIntr                  * D442A
              GOSBVL  GETPTR                     * D4431
              A=R0                               * D4438
              DAT1=A  A                          * D443B
              C=R4                               * D443E
L_D4441:
              ?ST=1   3                          * D4441
              GOYES   L_D444D                    * D4444
              GOVLNG  PushTLoop                  * D4446
L_D444D:
              R0=C                               * D444D
              GOVLNG  Push#FLoop                 * D4450

* refs (2): D4408 D4782
SUB_D4457:
              LC(3)   #218                       * D4457
L_D445C:
              GOSUB   SUB_D44FB                  * D445C
              C=C-1   XS                         * D4460
              GONC    L_D445C                    * D4463
              RTN                                * D4466

* refs (5): D4348 D4353 D4370 D4393 D43A7
SUB_D4468:
              LC(5)   #02000                     * D4468

* refs (4): D42FE D449E D44E6 D4662
SUB_D446F:
              D1=(5)  TIMER2                     * D446F
              A=DAT1  A                          * D4476
              A=A-C   A                          * D4479
L_D447B:
              D1=(2)  #11                        * D447B
              C=DAT1  1                          * D447F
              ?CBIT=1 0                          * D4483
              GOYES   L_D44C2                    * D4488
              GOSBVL  OnKeyDown?                 * D448A
              GONC    L_D44A1                    * D4491
              ST=1    8                          * D4494
              LC(5)   #00800                     * D4497
              GOC     SUB_D446F                  * D449E
L_D44A1:
              D1=(2)  #38                        * D44A1
              C=DAT1  A                          * D44A5
              ?C#A    A                          * D44A8
              GOYES   L_D447B                    * D44AB
              LC(5)   timeouterr                 * D44AD
              ?ST=0   8                          * D44B4
              RTNYES                             * D44B7

* refs (1): D4786
SUB_D44B9:
              LC(5)   intrptderr                 * D44B9
              RTNSC                              * D44C0
L_D44C2:
              ?CBIT=0 2                          * D44C2
              GOYES   L_D44D4                    * D44C7
              ST=1    1                          * D44C9
              D1=(2)  #13                        * D44CC
              DAT1=A  1                          * D44D0
L_D44D4:
              D1=(2)  #14                        * D44D4
              A=0     A                          * D44D8
              A=DAT1  B                          * D44DA
              RTNCC                              * D44DD

* refs (2): D4735 D47A5
SUB_D44DF:
              LC(5)   #1E000                     * D44DF
              GOTO    SUB_D446F                  * D44E6

* refs (2): D467B D46C1
SUB_D44EA:
              LC(2)   #01                        * D44EA
              GOSUB   SUB_D44FB                  * D44EE
              C=R2                               * D44F2
              GOSUB   SUB_D44FB                  * D44F5
              C=-C-1  A                          * D44F9

* refs (7): D445C D44EE D44F5 D454E D468B D46EF ...
SUB_D44FB:
              RSTK=C                             * D44FB
              LC(5)   #09C40                     * D44FD
              A=C     A                          * D4504
              D1=(5)  NOP1MASK18                 * D4506
L_D450D:
              C=DAT1  1                          * D450D
              ?CBIT=0 0                          * D4511
              GOYES   L_D4543                    * D4516
              GOSBVL  OnKeyDown?                 * D4518
              GONC    L_D4525                    * D451F
              ST=1    8                          * D4522
L_D4525:
              A=A-1   A                          * D4525
              GONC    L_D450D                    * D4527
              C=RSTK                             * D452A
              ?ST=0   6                          * D452C
              GOYES   L_D453F                    * D452F
              LC(5)   xferfailerr                * D4531
              R4=C                               * D4538
              GOTO    L_D440C                    * D453B
L_D453F:
              GOTO    L_D47C6                    * D453F
L_D4543:
              D1=(2)  #16                        * D4543
              C=RSTK                             * D4547
              DAT1=C  B                          * D4549
              RTN                                * D454C

* refs (4): D42E4 D4337 D472C D479C
SUB_D454E:
              GOSUB   SUB_D44FB                  * D454E
              D1=(5)  ANNCTRL2                   * D4552
              C=DAT1  1                          * D4559
              A=C     A                          * D455D
              CBIT=0  1                          * D455F
              ?ABIT=1 1                          * D4564
              GOYES   L_D4570                    * D4569
              CBIT=1  1                          * D456B
L_D4570:
              DAT1=C  1                          * D4570
              D1=(5)  IRC                        * D4574
              C=DAT1  B                          * D457B
              ?CBIT=0 2                          * D457E
              RTNYES                             * D4583
              AD0EX                              * D4585
              GOSBVL  WaitTbz0                   * D4588
              D0=D0+  2                          * D458F
              C=DAT0  B                          * D4592
              D0=D0-  1                          * D4595
              DAT0=C  1                          * D4598
              D0=A                               * D459C
              RTN                                * D459F
            ENDCODE                              * D45A1
            ITE                                  * D45A1
            ::                                   * D45A6
              OBJ_30607                          * D45AB
              SWAP                               * D45B0
              OBJ_2157E                          * D45B5
            ;                                    * D45BA
            ::                                   * D45BF
              SWAPROT                            * D45C4
              OBJ_2157E                          * D45C9
              ERROROUT                           * D45CE
            ;                                    * D45D3
          ;                                      * D45D8
          ::                                     * D45DD
            SAFE@                                * D45E2
            NOTcase                              * D45E7
            SETNONEXTERR                         * D45EC
            CODE                                 * D45F1  503 nibbles
              GOSBVL  PopASavptr                 * D45FB
              D0=A                               * D4602
              R0=A                               * D4605
              GOSBVL  SAFESKIPOB                 * D4608
              LC(5)   #00203                     * D460F
              GOC     L_D4666                    * D4616
              CD0EX                              * D4619
              A=R0                               * D461C
              C=C-A   A                          * D461F
              C=C+1   A                          * D4621
              CSRB.F  A                          * D4623
              R1=C                               * D4628
              LC(3)   #901                       * D462B
              R2=C                               * D4630
              GOSBVL  SUB_72245                  * D4633
              C=DAT1  M                          * D463A
              CSL     W                          * D463E
              LC(4)   #5048                      * D4641
              R4=C                               * D4647
              GOSBVL  DisableIntr                * D464A
              C=0     A                          * D4651
              ST=C                               * D4653
              ST=1    3                          * D4655
              ST=1    7                          * D4658
L_D465B:
              LC(5)   #78000                     * D465B
              GOSUB   SUB_D446F                  * D4662
L_D4666:
              GOC     L_D46B4                    * D4666
              LC(2)   #18                        * D4669
              ?C=A    B                          * D466D
              GOYES   L_D46AD                    * D4670
              LC(2)   #15                        * D4672
              ?C#A    B                          * D4676
              GOYES   L_D465B                    * D4679
L_D467B:
              GOSUB   SUB_D44EA                  * D467B
              C=0     A                          * D467F
              LC(1)   #7                         * D4681
              D=C     A                          * D4684
              C=R4                               * D4686
              B=0     A                          * D4689
L_D468B:
              GOSUB   SUB_D44FB                  * D468B
              B=B+C   B                          * D468F
              CSR     W                          * D4692
              CSR     W                          * D4695
              D=D-1   A                          * D4698
              GONC    L_D468B                    * D469A
              A=R0                               * D469D
              D0=A                               * D46A0
              C=0     A                          * D46A3
              LC(2)   #78                        * D46A5
              GOTO    L_D46CD                    * D46A9
L_D46AD:
              LC(5)   intrptderr                 * D46AD
L_D46B4:
              ST=1    3                          * D46B4
              GOTO    L_D47CD                    * D46B7
L_D46BB:
              A=R0                               * D46BB
              D0=A                               * D46BE
              GOSUB   SUB_D44EA                  * D46C1
              B=0     A                          * D46C5
              C=0     A                          * D46C7
              LC(2)   #80                        * D46C9
L_D46CD:
              A=R1                               * D46CD
              A=A-C   A                          * D46D0
              GONC    L_D46DF                    * D46D2
              C=C+A   A                          * D46D5
              A=-A    A                          * D46D7
              ASL     A                          * D46D9
              ASL     A                          * D46DB
              C=C+A   A                          * D46DD
L_D46DF:
              R3=C                               * D46DF
              C=C-1   B                          * D46E2
              D=C     A                          * D46E5
L_D46E7:
              C=DAT0  B                          * D46E7
              D0=D0+  2                          * D46EA
              B=B+C   A                          * D46ED
              GOSUB   SUB_D44FB                  * D46EF
              D=D-1   B                          * D46F3
              GONC    L_D46E7                    * D46F6
              DSR     A                          * D46F9
              DSR     A                          * D46FB
              GOC     L_D4724                    * D46FD
L_D4700:
              C=R2                               * D4700
              C=C-1   XS                         * D4703
              R2=C                               * D4706
              GOC     L_D471A                    * D4709
              ?ST=1   8                          * D470C
              GOYES   L_D4782                    * D470F
              ?ST=0   7                          * D4711
              GOYES   L_D46BB                    * D4714
              GOTO    L_D467B                    * D4716
L_D471A:
              GOTO    L_D47C6                    * D471A
L_D471E:
              C=0     A                          * D471E
              GOSUB   SUB_D44FB                  * D4720
L_D4724:
              D=D-1   B                          * D4724
              GONC    L_D471E                    * D4727
              C=B     A                          * D472A
              GOSUB   SUB_D454E                  * D472C
              ?ST=1   8                          * D4730
              GOYES   L_D4782                    * D4733
              GOSUB   SUB_D44DF                  * D4735
L_D4739:
              GOC     L_D4700                    * D4739
              LC(2)   #18                        * D473C
              ?C=A    B                          * D4740
              GOYES   L_D471A                    * D4743
              LC(2)   #06                        * D4745
              ?C#A    B                          * D4749
              GOYES   L_D4739                    * D474C
              ST=0    7                          * D474E
              AD0EX                              * D4751
              R0=A                               * D4754
              D0=A                               * D4757
              C=R2                               * D475A
              C=C+1   A                          * D475D
              P=      2                          * D475F
              LC(1)   #9                         * D4761
              P=      0                          * D4764
              R2=C                               * D4766
              A=R1                               * D4769
              C=R3                               * D476C
              B=0     A                          * D476F
              B=C     B                          * D4771
              A=A-B   A                          * D4774
              R1=A                               * D4776
              ?A=0    A                          * D4779
              GOYES   L_D47E3                    * D477C
              GOTO    L_D46BB                    * D477E
L_D4782:
              GOSUB   SUB_D4457                  * D4782
              GOSUB   SUB_D44B9                  * D4786
              GOTO    L_D47CD                    * D478A
L_D478E:
              C=R2                               * D478E
              C=C-1   XS                         * D4791
              GOC     L_D47C6                    * D4794
L_D4797:
              R2=C                               * D4797
              C=D     A                          * D479A
              GOSUB   SUB_D454E                  * D479C
              ?ST=1   8                          * D47A0
              GOYES   L_D47C6                    * D47A3
              GOSUB   SUB_D44DF                  * D47A5
              GOC     L_D478E                    * D47A9
              LC(2)   #18                        * D47AC
              ?C=A    B                          * D47B0
              GOYES   L_D47C6                    * D47B3
              LC(2)   #06                        * D47B5
              ?C#A    B                          * D47B9
              GOYES   L_D478E                    * D47BC
              ?ST=1   8                          * D47BE
              GOYES   L_D47C6                    * D47C1
              ST=0    3                          * D47C3
L_D47C6:
              LC(5)   xferfailerr                * D47C6
L_D47CD:
              GOSBVL  AllowIntr                  * D47CD
              A=C     A                          * D47D4
              GOSBVL  GETPTR                     * D47D6
              C=A     A                          * D47DD
              GOTO    L_D4441                    * D47DF
L_D47E3:
              LC(2)   #04                        * D47E3
              D=C     A                          * D47E7
              LC(3)   #500                       * D47E9
              GOTO    L_D4797                    * D47EE
            ENDCODE                              * D47F2
            NOTcase                              * D47F2
            ERROROUT                             * D47F7
          ;                                      * D47FC
        ;                                        * D4801
