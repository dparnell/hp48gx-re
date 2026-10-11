* HP 48GX ROM revision R, #CCA9F-#CF37F: Library part 0E7
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ~UTVUNS1Arg ~UTTYPEEXT0?
* Follows on from the previous file (at #CCA9F in the original ROM).
        ENDLENGTH                                * CCA9F

        CON(5)  DOLIB                            * CCA9F  library object
        LENGTH                                   * CCAA4  length, to #CF380
        CON(2)  0                                * CCAA9  title length

LIB0E7:
        CON(3)  #0E7                             * CCAAB  library number
        REL(5)  LIB0E7.hash                      * CCAAE  hash table
        REL(5)  ROMP_0E7_014                     * CCAB3  message table
        REL(5)  LIB0E7.link                      * CCAB8  link table
        CON(5)  0                                * CCABD  config
        RPL

* ROMPTR 0E7 000
* refs (1): CCAAB
ROMP_0E7_000:
        ::                                       * CCAC2
          SWAP                                   * CCAC7
          %1                                     * CCACC
          UMCONV                                 * CCAD1
          SWAP                                   * CCAD6
          %1                                     * CCADB
          UMCONV                                 * CCAE0
          ROMPTR  0E7 001                        * CCAE5
        ;                                        * CCAF0

* ROMPTR 0E7 001
* refs (1): CCAAB
ROMP_0E7_001:
        ::                                       * CCAF5
          OVER                                   * CCAFA
          %       1.05E0                         * CCAFF
          %<                                     * CCB14
          3PICK                                  * CCB19
          %3                                     * CCB1E
          %>=                                    * CCB23
          ORcase                                 * CCB28
          ROMPTR  0E7 002                        * CCB2D
          DUP                                    * CCB38
          %0>                                    * CCB3D
          NOT                                    * CCB42
          OVER                                   * CCB47
          %       3E1                            * CCB4C
          %>=                                    * CCB61
          ORcase                                 * CCB66
          ROMPTR  0E7 002                        * CCB6B
          %       6.4225133E-2                   * CCB76
          3PICK                                  * CCB8B
          %       5.3530771E-1                   * CCB90
          %*                                     * CCBA5
          %       6.1232032E-1                   * CCBAA
          %-                                     * CCBBF
          4PICK                                  * CCBC4
          DUP                                    * CCBC9
          %*                                     * CCBCE
          5PICK                                  * CCBD3
          %       3.1506237E-1                   * CCBD8
          %*                                     * CCBED
          %       1.0467099E0                    * CCBF2
          %-                                     * CCC07
          %       5.7832729E-1                   * CCC0C
          3PICK                                  * CCC21
          %/                                     * CCC26
          %-                                     * CCC2B
          %       6.8157001E-1                   * CCC30
          ROT                                    * CCC45
          %/                                     * CCC4A
          %       6.8446549E-1                   * CCC4F
          6PICK                                  * CCC64
          %       2.7E-1                         * CCC69
          %*                                     * CCC7E
          DUP                                    * CCC83
          BINT9                                  * CCC88
          PICK                                   * CCC8D
          %/                                     * CCC92
          {                                      * CCC97
            NULLLAM                              * CCC9C
            NULLLAM                              * CCCA1
            NULLLAM                              * CCCA6
            NULLLAM                              * CCCAB
            NULLLAM                              * CCCB0
            NULLLAM                              * CCCB5
            NULLLAM                              * CCCBA
            NULLLAM                              * CCCBF
            NULLLAM                              * CCCC4
          }                                      * CCCC9
          BIND                                   * CCCCE
          BEGIN                                  * CCCD3
          1GETLAM                                * CCCD8
          DUP                                    * CCCDD
          %*                                     * CCCE2
          DUP                                    * CCCE7
          3GETLAM                                * CCCEC
          %*                                     * CCCF1
          DUP                                    * CCCF6
          %CHS                                   * CCCFB
          %EXP                                   * CCD00
          OVER                                   * CCD05
          %1+                                    * CCD0A
          OVER                                   * CCD0F
          %*                                     * CCD14
          4GETLAM                                * CCD19
          %*                                     * CCD1E
          6GETLAM                                * CCD23
          %+                                     * CCD28
          1GETLAM                                * CCD2D
          %*                                     * CCD32
          5GETLAM                                * CCD37
          %+                                     * CCD3C
          4PICK                                  * CCD41
          DUP                                    * CCD46
          %*                                     * CCD4B
          7GETLAM                                * CCD50
          %*                                     * CCD55
          %+                                     * CCD5A
          1GETLAM                                * CCD5F
          %*                                     * CCD64
          9GETLAM                                * CCD69
          %+                                     * CCD6E
          1GETLAM                                * CCD73
          %*                                     * CCD78
          2GETLAM                                * CCD7D
          %-                                     * CCD82
          4UNROLL                                * CCD87
          %3                                     * CCD8C
          3PICK                                  * CCD91
          DUP                                    * CCD96
          %+                                     * CCD9B
          %-                                     * CCDA0
          ROT                                    * CCDA5
          %*                                     * CCDAA
          %3                                     * CCDAF
          %+                                     * CCDB4
          %*                                     * CCDB9
          4GETLAM                                * CCDBE
          %*                                     * CCDC3
          6GETLAM                                * CCDC8
          %3                                     * CCDCD
          %*                                     * CCDD2
          %+                                     * CCDD7
          %6                                     * CCDDC
          7GETLAM                                * CCDE1
          %*                                     * CCDE6
          ROT                                    * CCDEB
          %*                                     * CCDF0
          1GETLAM                                * CCDF5
          %*                                     * CCDFA
          %+                                     * CCDFF
          1GETLAM                                * CCE04
          %*                                     * CCE09
          5GETLAM                                * CCE0E
          DUP                                    * CCE13
          %+                                     * CCE18
          %+                                     * CCE1D
          1GETLAM                                * CCE22
          %*                                     * CCE27
          9GETLAM                                * CCE2C
          %+                                     * CCE31
          %/                                     * CCE36
          DUP                                    * CCE3B
          %ABS                                   * CCE40
          1GETLAM                                * CCE45
          %/                                     * CCE4A
          1GETLAM                                * CCE4F
          ROT                                    * CCE54
          %-                                     * CCE59
          1PUTLAM                                * CCE5E
          %       1E-10                          * CCE63
          %<=                                    * CCE78
          UNTIL                                  * CCE7D
          2GETLAM                                * CCE82
          9GETLAM                                * CCE87
          %/                                     * CCE8C
          1GETLAM                                * CCE91
          %/                                     * CCE96
          ABND                                   * CCE9B
        ;                                        * CCEA0

* ROMPTR 0E7 002
* refs (1): CCAAB
ROMP_0E7_002:
        ::                                       * CCEA5
          #       304                            * CCEAA  772
          ERRORSTO                               * CCEB4
          ERRJMP                                 * CCEB9
        ;                                        * CCEBE

* ROMPTR 0E7 003
* refs (1): CCAAB
ROMP_0E7_003:
        ::                                       * CCEC3
          SWAP                                   * CCEC8
          %1                                     * CCECD
          UMCONV                                 * CCED2
          SWAP                                   * CCED7
          %1                                     * CCEDC
          UMCONV                                 * CCEE1
          ROMPTR  0E7 004                        * CCEE6
        ;                                        * CCEF1

* ROMPTR 0E7 004
* refs (1): CCAAB
ROMP_0E7_004:
        ::                                       * CCEF6
          OVER                                   * CCEFB
          %0<                                    * CCF00
          case                                   * CCF05
          ROMPTR  0E7 002                        * CCF0A
          DUP                                    * CCF15
          %0<                                    * CCF1A
          case                                   * CCF1F
          ROMPTR  0E7 002                        * CCF24
          DUP                                    * CCF2F
          %       2.1E3                          * CCF34
          %<=                                    * CCF49
          ITE                                    * CCF4E
          ::                                     * CCF53
            SWAPDROP                             * CCF58
            %       1.6E1                        * CCF5D
            SWAP                                 * CCF72
            %/                                   * CCF77
          ;                                      * CCF7C
          ::                                     * CCF81
            SWAP                                 * CCF86
            %       3.7E0                        * CCF8B
            %/                                   * CCFA0
            %       1.2E1                        * CCFA5
            3PICK                                * CCFBA
            %/                                   * CCFBF
            OVER                                 * CCFC4
            %+                                   * CCFC9
            ROMPTR  0E7 005                      * CCFCE
            %       -5.02E0                      * CCFD9
            2DUP                                 * CCFEE
            %*                                   * CCFF3
            5PICK                                * CCFF8
            %/                                   * CCFFD
            4PICK                                * CD002
            %+                                   * CD007
            ROMPTR  0E7 005                      * CD00C
            DUPROT                               * CD017
            %*                                   * CD01C
            5ROLL                                * CD021
            %/                                   * CD026
            4ROLL                                * CD02B
            %+                                   * CD030
            ROMPTR  0E7 005                      * CD035
            OVER                                 * CD040
            4PICK                                * CD045
            %=                                   * CD04A
            ITE                                  * CD04F
            2DROP                                * CD054
            ::                                   * CD059
              3PICK                              * CD05E
              ROT2DUP                            * CD063
              SWAP                               * CD068
              %-                                 * CD06D
              DUP                                * CD072
              %*                                 * CD077
              4UNROLLDUP                         * CD07C
              %+                                 * CD081
              %-                                 * CD086
              %+                                 * CD08B
              %/                                 * CD090
              %-                                 * CD095
            ;                                    * CD09A
            %1/                                  * CD09F
            DUP                                  * CD0A4
            %*                                   * CD0A9
            %       1.6E1                        * CD0AE
            %/                                   * CD0C3
          ;                                      * CD0C8
        ;                                        * CD0CD

* ROMPTR 0E7 005
* refs (1): CCAAB
ROMP_0E7_005:
        ::                                       * CD0D2
          DUP                                    * CD0D7
          %0<                                    * CD0DC
          case                                   * CD0E1
          ROMPTR  0E7 002                        * CD0E6
          %LOG                                   * CD0F1
        ;                                        * CD0F6

* ROMPTR 0E7 006
* refs (1): CCAAB
ROMP_0E7_006:
        ::                                       * CD0FB
          #       202                            * CD100  514
          ERROROUT                               * CD10A
        ;                                        * CD10F

* ROMPTR 0E7 007
* refs (1): CCAAB
ROMP_0E7_007:
        ::                                       * CD114
          #       203                            * CD119  515
          ERROROUT                               * CD123
        ;                                        * CD128

* ROMPTR 0E7 008
* refs (1): CCAAB
ROMP_0E7_008:
        ::                                       * CD12D
          ROMPTR  0E7 003                        * CD132
          %4                                     * CD13D
          %*                                     * CD142
        ;                                        * CD147

* ROMPTR 0E7 009
* refs (1): CCAAB
ROMP_0E7_009:
        ::                                       * CD14C
          ROMPTR  0E7 004                        * CD151
          %4                                     * CD15C
          %*                                     * CD161
        ;                                        * CD166

* ROMPTR 0E7 00A
* refs (1): CCAAB
ROMP_0E7_00A:
        ::                                       * CD16B
          SWAP                                   * CD170
          UNIT                                   * CD175
            %1                                   * CD17A
            tok_m                                * CD17F
            umEND                                * CD184
          ;                                      * CD189
          UMCONV                                 * CD18E
          CARCOMP                                * CD193
          SWAP                                   * CD198
          UNIT                                   * CD19D
            %1                                   * CD1A2
            $       "K"                          * CD1A7
            umEND                                * CD1B3
          ;                                      * CD1B8
          UMCONV                                 * CD1BD
          CARCOMP                                * CD1C2
          ROMPTR  0E7 00B                        * CD1C7
        ;                                        * CD1D2

* ROMPTR 0E7 00B
* refs (1): CCAAB
ROMP_0E7_00B:
        ::                                       * CD1D7
          OVER                                   * CD1DC
          %0<                                    * CD1E1
          case                                   * CD1E6
          ROMPTR  0E7 002                        * CD1EB
          DUP                                    * CD1F6
          %0<                                    * CD1FB
          case                                   * CD200
          ROMPTR  0E7 002                        * CD205
          %*                                     * CD210
          DUP                                    * CD215
          %0=                                    * CD21A
          casedrop                               * CD21F
          %0_2A2B4                               * CD224
          %       1.438769E-2                    * CD229
          SWAP                                   * CD23E
          %/                                     * CD243
          DUP                                    * CD248
          %2                                     * CD24D
          %<                                     * CD252
          ITE                                    * CD257
          ::                                     * CD25C
            DUPDUP                               * CD261
            %*                                   * CD266
            2DUP                                 * CD26B
            DUP                                  * CD270
            %       -7.51563251563E-8            * CD275
            %*                                   * CD28A
            %       3.67430922986E-6             * CD28F
            %+                                   * CD2A4
            OVER                                 * CD2A9
            %*                                   * CD2AE
            %       -1.98412698413E-4            * CD2B3
            %+                                   * CD2C8
            OVER                                 * CD2CD
            %*                                   * CD2D2
            %       1.66666666667E-2             * CD2D7
            %+                                   * CD2EC
            %*                                   * CD2F1
            SWAP                                 * CD2F6
            %       -1.25E-1                     * CD2FB
            %*                                   * CD310
            %+                                   * CD315
            %       3.33333333333E-1             * CD31A
            %+                                   * CD32F
            3UNROLL                              * CD334
            %*                                   * CD339
            %*                                   * CD33E
            %       1.5398973382E-1              * CD343
            %*                                   * CD358
            %1                                   * CD35D
            SWAP                                 * CD362
            %-                                   * CD367
          ;                                      * CD36C
          ::                                     * CD371
            %0_2A2B4                             * CD376
            SWAP                                 * CD37B
            %0_2A2B4                             * CD380
            BEGIN                                * CD385
            %1+                                  * CD38A
            DUP                                  * CD38F
            3PICK                                * CD394
            %*                                   * CD399
            DUP                                  * CD39E
            %3                                   * CD3A3
            %+                                   * CD3A8
            OVER                                 * CD3AD
            %*                                   * CD3B2
            %6                                   * CD3B7
            %+                                   * CD3BC
            OVER                                 * CD3C1
            %*                                   * CD3C6
            %6                                   * CD3CB
            %+                                   * CD3D0
            SWAP                                 * CD3D5
            %CHS                                 * CD3DA
            %EXP                                 * CD3DF
            3PICK                                * CD3E4
            DUP                                  * CD3E9
            %*                                   * CD3EE
            DUP                                  * CD3F3
            %*                                   * CD3F8
            %/                                   * CD3FD
            %*                                   * CD402
            4PICK                                * CD407
            %+                                   * CD40C
            4ROLLOVER                            * CD411
            %<>                                  * CD416
            WHILE                                * CD41B
            ::                                   * CD420
              3UNROLL                            * CD425
            ;                                    * CD42A
            REPEAT                               * CD42F
            ROTROT2DROP                          * CD434
            %       1.5398973382E-1              * CD439
            %*                                   * CD44E
          ;                                      * CD453
        ;                                        * CD458

* ROMPTR 0E7 00C
* refs (1): CCAAB
ROMP_0E7_00C:
        ::                                       * CD45D
          DUP                                    * CD462
          %0_2A2B4                               * CD467
          %<=                                    * CD46C
          IT                                     * CD471
          ROMPTR  0E7 002                        * CD476
          DUP                                    * CD481
          %       1.685E3                        * CD486
          %>=                                    * CD49B
          IT                                     * CD4A0
          ROMPTR  0E7 002                        * CD4A5
          %       4.73E-4                        * CD4B0
          OVER                                   * CD4C5
          DUP                                    * CD4CA
          %*                                     * CD4CF
          %*                                     * CD4D4
          OVER                                   * CD4D9
          %       6.36E2                         * CD4DE
          %+                                     * CD4F3
          %/                                     * CD4F8
          %       1.17E0                         * CD4FD
          %-                                     * CD512
          %2                                     * CD517
          %/                                     * CD51C
          %       8.617386E-5                    * CD521
          %/                                     * CD536
          OVER                                   * CD53B
          %/                                     * CD540
          %EXP                                   * CD545
          %       7.2756517951E15                * CD54A
          %*                                     * CD55F
          SWAP                                   * CD564
          %       1.5E0                          * CD569
          %^                                     * CD57E
          %*                                     * CD583
        ;                                        * CD588

* ROMPTR 0E7 00D
* refs (1): CCAAB
ROMP_0E7_00D:
        ::                                       * CD58D
          UNIT                                   * CD592
            %1                                   * CD597
            $       "K"                          * CD59C
            umEND                                * CD5A8
          ;                                      * CD5AD
          UMCONV                                 * CD5B2
          CARCOMP                                * CD5B7
          ROMPTR  0E7 00C                        * CD5BC
          UNIT                                   * CD5C7
            %1                                   * CD5CC
            tok1                                 * CD5D1
            CHR_c                                * CD5D6
            tok_m                                * CD5DB
            umP                                  * CD5E0
            %3                                   * CD5E5
            um^                                  * CD5EA
            um/                                  * CD5EF
            umEND                                * CD5F4
          ;                                      * CD5F9
          SWAP                                   * CD5FE
          Unbr>U                                 * CD603
        ;                                        * CD608

* ROMPTR 0E7 00E
* refs (1): CCAAB
ROMP_0E7_00E:
        ::                                       * CD60D
          SWAP                                   * CD612
          DUPROT                                 * CD617
          U>NCQ                                  * CD61C
          4ROLL                                  * CD621
          U>NCQ                                  * CD626
          ROT                                    * CD62B
          6UNROLL                                * CD630
          ROT                                    * CD635
          puretemp?                              * CD63A
          NOTcase                                * CD63F
          ROMPTR  0E7 010                        * CD644
          TempConv                               * CD64F
          %%-                                    * CD654
          %%>%                                   * CD659
          Unbr>U                                 * CD65E
        ;                                        * CD663

* ROMPTR 0E7 00F
* refs (1): CCAAB
ROMP_0E7_00F:
        ::                                       * CD668
          SWAP                                   * CD66D
          DUPROT                                 * CD672
          U>NCQ                                  * CD677
          4ROLL                                  * CD67C
          U>NCQ                                  * CD681
          ROT                                    * CD686
          6UNROLL                                * CD68B
          ROT                                    * CD690
          puretemp?                              * CD695
          NOTcase                                * CD69A
          ROMPTR  0E7 010                        * CD69F
          2DROP                                  * CD6AA
          DUP                                    * CD6AF
          cfC                                    * CD6B4
          EQUAL                                  * CD6B9
          SWAP                                   * CD6BE
          %%1                                    * CD6C3
          EQUALOR                                * CD6C8
          ITE                                    * CD6CD
          ::                                     * CD6D2
            DUP                                  * CD6D7
            cfC                                  * CD6DC
            EQUAL                                * CD6E1
            SWAP                                 * CD6E6
            %%1                                  * CD6EB
            EQUALOR                              * CD6F0
            ?SKIP                                * CD6F5
            ::                                   * CD6FA
              cfF                                * CD6FF
              %%*                                * CD704
            ;                                    * CD709
          ;                                      * CD70E
          ::                                     * CD713
            DUP                                  * CD718
            cfC                                  * CD71D
            EQUAL                                * CD722
            SWAP                                 * CD727
            %%1                                  * CD72C
            EQUALOR                              * CD731
            IT                                   * CD736
            ::                                   * CD73B
              cfF                                * CD740
              %%/                                * CD745
            ;                                    * CD74A
          ;                                      * CD74F
          %%+                                    * CD754
          %%>%                                   * CD759
          Unbr>U                                 * CD75E
        ;                                        * CD763

* ROMPTR 0E7 010
* refs (1): CCAAB
ROMP_0E7_010:
        ::                                       * CD768
          #       B02                            * CD76D  2818
          ERROROUT                               * CD777
        ;                                        * CD77C

* ROMPTR 0E7 011
* refs (1): CCAAB
~UTVUNS1Arg:
        {                                        * CD781
          ROMPTR  0E7 012                        * CD786
          ROMPTR  0E7 013                        * CD791
        }                                        * CD79C

* ROMPTR 0E7 012
* refs (1): CCAAB
ROMP_0E7_012:
        ::                                       * CD7A1
          SWAPcompSWAP                           * CD7A6
        ;                                        * CD7AB

* ROMPTR 0E7 013
* refs (1): CCAAB
ROMP_0E7_013:
        ::                                       * CD7B0
          DROPTRUE                               * CD7B5
        ;                                        * CD7BA

* ROMPTR 0E7 014
* refs (1): CCAAB
ROMP_0E7_014:
        CON(5)  DOARRY                           * CD7BF  array 6
        LENGTH                                   * CD7C4  length, to #CD864
        CON(5)  DOCSTR                           * CD7C9  element type
        CON(5)  1                                * CD7CE  dimensions
        CON(5)  6                                * CD7D3
        $BODY   "NEAR "                          * CD7D8  1
        $BODY   " MINE  "                        * CD7E7  2
        $BODY   " MINES  "                       * CD7FA  3
        $BODY   "  SCORE: "                      * CD80F  4
        $BODY   "YOU MADE IT!!"                  * CD826  5
        $BODY   "YOU BLEW UP!!"                  * CD845  6
        ENDLENGTH                                * CD864

* ROMPTR 0E7 015
* refs (1): CCAAB
ROMP_0E7_015:
        ::                                       * CD864
          nscknum2                               * CD869
          ROMPTR  0E7 02A                        * CD86E
          ROMPTR  0AB 076                        * CD879  ZFACTOR
        ;                                        * CD884

* ROMPTR 0E7 016
* refs (1): CCAAB
ROMP_0E7_016:
        ::                                       * CD889
          sncknum2                               * CD88E
          ROMPTR  0E7 02B                        * CD893
          ROMPTR  0AB 076                        * CD89E  ZFACTOR
        ;                                        * CD8A9

* ROMPTR 0E7 017
* refs (1): CCAAB
ROMP_0E7_017:
        ::                                       * CD8AE
          sscknum2                               * CD8B3
          ROMPTR  0E7 02C                        * CD8B8
          ROMPTR  0AB 076                        * CD8C3  ZFACTOR
        ;                                        * CD8CE

* ROMPTR 0E7 018
* refs (1): CCAAB
ROMP_0E7_018:
        ::                                       * CD8D3
          nscknum2                               * CD8D8
          ROMPTR  0E7 02A                        * CD8DD
          ROMPTR  0AB 077                        * CD8E8  FANNING
        ;                                        * CD8F3

* ROMPTR 0E7 019
* refs (1): CCAAB
ROMP_0E7_019:
        ::                                       * CD8F8
          sncknum2                               * CD8FD
          ROMPTR  0E7 02B                        * CD902
          ROMPTR  0AB 077                        * CD90D  FANNING
        ;                                        * CD918

* ROMPTR 0E7 01A
* refs (1): CCAAB
ROMP_0E7_01A:
        ::                                       * CD91D
          sscknum2                               * CD922
          ROMPTR  0E7 02C                        * CD927
          ROMPTR  0AB 077                        * CD932  FANNING
        ;                                        * CD93D

* ROMPTR 0E7 01B
* refs (1): CCAAB
ROMP_0E7_01B:
        ::                                       * CD942
          nscknum2                               * CD947
          ROMPTR  0E7 02A                        * CD94C
          ROMPTR  0AB 078                        * CD957  DARCY
        ;                                        * CD962

* ROMPTR 0E7 01C
* refs (1): CCAAB
ROMP_0E7_01C:
        ::                                       * CD967
          sncknum2                               * CD96C
          ROMPTR  0E7 02B                        * CD971
          ROMPTR  0AB 078                        * CD97C  DARCY
        ;                                        * CD987

* ROMPTR 0E7 01D
* refs (1): CCAAB
ROMP_0E7_01D:
        ::                                       * CD98C
          sscknum2                               * CD991
          ROMPTR  0E7 02C                        * CD996
          ROMPTR  0AB 078                        * CD9A1  DARCY
        ;                                        * CD9AC

* ROMPTR 0E7 01E
* refs (1): CCAAB
ROMP_0E7_01E:
        ::                                       * CD9B1
          nscknum2                               * CD9B6
          ROMPTR  0E7 02A                        * CD9BB
          ROMPTR  0AB 079                        * CD9C6  F0λ
        ;                                        * CD9D1

* ROMPTR 0E7 01F
* refs (1): CCAAB
ROMP_0E7_01F:
        ::                                       * CD9D6
          sncknum2                               * CD9DB
          ROMPTR  0E7 02B                        * CD9E0
          ROMPTR  0AB 079                        * CD9EB  F0λ
        ;                                        * CD9F6

* ROMPTR 0E7 020
* refs (1): CCAAB
ROMP_0E7_020:
        ::                                       * CD9FB
          sscknum2                               * CDA00
          ROMPTR  0E7 02C                        * CDA05
          ROMPTR  0AB 079                        * CDA10  F0λ
        ;                                        * CDA1B

* ROMPTR 0E7 021
* refs (1): CCAAB
ROMP_0E7_021:
        ::                                       * CDA20
          nscknum2                               * CDA25
          ROMPTR  0E7 02A                        * CDA2A
          ROMPTR  0AB 07B                        * CDA35  TDELTA
        ;                                        * CDA40

* ROMPTR 0E7 022
* refs (1): CCAAB
ROMP_0E7_022:
        ::                                       * CDA45
          sncknum2                               * CDA4A
          ROMPTR  0E7 02B                        * CDA4F
          ROMPTR  0AB 07B                        * CDA5A  TDELTA
        ;                                        * CDA65

* ROMPTR 0E7 023
* refs (1): CCAAB
ROMP_0E7_023:
        ::                                       * CDA6A
          sscknum2                               * CDA6F
          ROMPTR  0E7 02C                        * CDA74
          ROMPTR  0AB 07B                        * CDA7F  TDELTA
        ;                                        * CDA8A

* ROMPTR 0E7 024
* refs (1): CCAAB
ROMP_0E7_024:
        ::                                       * CDA8F
          nscknum2                               * CDA94
          ROMPTR  0E7 02A                        * CDA99
          ROMPTR  0AB 07C                        * CDAA4  TINC
        ;                                        * CDAAF

* ROMPTR 0E7 025
* refs (1): CCAAB
ROMP_0E7_025:
        ::                                       * CDAB4
          sncknum2                               * CDAB9
          ROMPTR  0E7 02B                        * CDABE
          ROMPTR  0AB 07C                        * CDAC9  TINC
        ;                                        * CDAD4

* ROMPTR 0E7 026
* refs (1): CCAAB
ROMP_0E7_026:
        ::                                       * CDAD9
          sscknum2                               * CDADE
          ROMPTR  0E7 02C                        * CDAE3
          ROMPTR  0AB 07C                        * CDAEE  TINC
        ;                                        * CDAF9

* ROMPTR 0E7 027
* refs (1): CCAAB
ROMP_0E7_027:
        ::                                       * CDAFE
          cknumdsptch1                           * CDB03
          ROMPTR  0E7 028                        * CDB08
          ROMPTR  0AB 07A                        * CDB13  SIDENS
        ;                                        * CDB1E

* ROMPTR 0E7 029
* refs (2): CCAAB CCAAB
ROMP_0E7_029:
        ::                                       * CDB23
          1GETLAM                                * CDB28
          symcomp                                * CDB2D
          BINT1                                  * CDB32
          '                                      * CDB37
          xFCNAPPLY                              * CDB3C
          4ROLL                                  * CDB41
          #3+                                    * CDB46
        ;                                        * CDB4B

* ROMPTR 0E7 02A
* refs (1): CCAAB
ROMP_0E7_02A:
        ::                                       * CDB50
          3GETLAM                                * CDB55
          BINT1                                  * CDB5A
          pshtop&                                * CDB5F
          ROMPTR  0E7 02D                        * CDB64
        ;                                        * CDB6F

* ROMPTR 0E7 02B
* refs (1): CCAAB
ROMP_0E7_02B:
        ::                                       * CDB74
          3GETLAM                                * CDB79
          BINT1                                  * CDB7E
          top&                                   * CDB83
          ROMPTR  0E7 02D                        * CDB88
        ;                                        * CDB93

* ROMPTR 0E7 02C
* refs (1): CCAAB
ROMP_0E7_02C:
        ::                                       * CDB98
          top&                                   * CDB9D
          ROMPTR  0E7 02D                        * CDBA2
        ;                                        * CDBAD

* ROMPTR 0E7 02D
* refs (1): CCAAB
ROMP_0E7_02D:
        ::                                       * CDBB2
          1GETLAM                                * CDBB7
          symcomp                                * CDBBC
          BINT2                                  * CDBC1
          '                                      * CDBC6
          xFCNAPPLY                              * CDBCB
          4ROLL                                  * CDBD0
          #3+                                    * CDBD5
        ;                                        * CDBDA

* ROMPTR 0E7 02E
* refs (1): CCAAB
ROMP_0E7_02E:
        ::                                       * CDBDF
          '                                      * CDBE4
          LAM     'MF1                           * CDBE9
          STO                                    * CDBF8
        ;                                        * CDBFD

* ROMPTR 0E7 02F
* refs (1): CCAAB
ROMP_0E7_02F:
        ::                                       * CDC02
          '                                      * CDC07
          LAM     'MF2                           * CDC0C
          STO                                    * CDC1B
        ;                                        * CDC20

* ROMPTR 0E7 030
* refs (1): CCAAB
ROMP_0E7_030:
        ::                                       * CDC25
          '                                      * CDC2A
          LAM     'MF3                           * CDC2F
          STO                                    * CDC3E
        ;                                        * CDC43

* ROMPTR 0E7 031
* refs (1): CCAAB
ROMP_0E7_031:
        ::                                       * CDC48
          '                                      * CDC4D
          LAM     'MF4                           * CDC52
          STO                                    * CDC61
        ;                                        * CDC66

* ROMPTR 0E7 032
* refs (1): CCAAB
ROMP_0E7_032:
        ::                                       * CDC6B
          '                                      * CDC70
          LAM     'MF5                           * CDC75
          STO                                    * CDC84
        ;                                        * CDC89

* ROMPTR 0E7 033
* refs (1): CCAAB
ROMP_0E7_033:
        ::                                       * CDC8E
          UnLockAlpha                            * CDC93
          RECLAIMDISP                            * CDC98
          POLSaveUI                              * CDC9D
          ERRSET                                 * CDCA2
          ::                                     * CDCA7
            ClrDA1IsStat                         * CDCAC
            BINT0                                * CDCB1
            $       "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" * CDCB6
            TOTEMPOB                             * CDDC0
            ONEONE                               * CDDC5
            FALSE                                * CDDCA
            {                                    * CDDCF

* ROMPTR 0E7 034
* refs (1): CCAAB
ROMP_0E7_034:
              LAM     'MF5                       * CDDD4

* ROMPTR 0E7 035
* refs (1): CCAAB
ROMP_0E7_035:
              LAM     'MF4                       * CDDE3

* ROMPTR 0E7 036
* refs (1): CCAAB
ROMP_0E7_036:
              LAM     'MF3                       * CDDF2

* ROMPTR 0E7 037
* refs (1): CCAAB
ROMP_0E7_037:
              LAM     'MF2                       * CDE01

* ROMPTR 0E7 038
* refs (1): CCAAB
ROMP_0E7_038:
              LAM     'MF1                       * CDE10
            }                                    * CDE1F
            BIND                                 * CDE24
            ROMPTR  0E7 057                      * CDE29
            ITE                                  * CDE34
            ::                                   * CDE39
              INCOMPDROP                         * CDE3E
              ROMPTR  0E7 031                    * CDE43
              ROMPTR  0E7 032                    * CDE4E
              ROMPTR  0E7 030                    * CDE59
              ROMPTR  0E7 02F                    * CDE64
              HARDBUFF                           * CDE6F
              ZEROZERO                           * CDE74
              TURNMENUOFF                        * CDE79
              GROB!                              * CDE7E
            ;                                    * CDE83
            ::                                   * CDE88
              BINT0                              * CDE8D
              BINT1                              * CDE92

* ROMPTR 0E7 039
* refs (1): CCAAB
ROMP_0E7_039:
              CON(5)  DOHSTR                     * CDE97  DOHSTR
              LENGTH                             * CDE9C  length, to #CDF81
              NIBHEX  F30111D8013800FC000201FC59011440 * CDEA1  ?..→.√.Ï. .Ïθ.A.
              NIBHEX  06C005400440044580117C0010001000 * CDEC1  `.P.@.@T..Ç.....
              NIBHEX  10007C5801144004C005400640044580 * CDEE1  ..ÇΣ.A.@.P.`.@T.
              NIBHEX  117C0004003C0004007C580114400440 * CDF01  .Ç.@.Ã.@.ÇΣ.A.@.
              NIBHEX  07C00440044580114400440044004400 * CDF21  p.@.@T..D.D.D.D.
              NIBHEX  385801144004C005400640044580417C * CDF41  √Σ.A.@.P.`.@T..Ç
              NIBHEX  0010001000100010001E80707C00FE00 * CDF61  .........á..Ç.ï.
        ENDLENGTH                                * CDF81
              ROMPTR  0E3 063                    * CDF81  ~PCunpack
              XYGROBDISP                         * CDF8C
              #       78                         * CDF91  120
              BINT1                              * CDF9B

* ROMPTR 0E7 03A
* refs (1): CCAAB
ROMP_0E7_03A:
              CON(5)  DOHSTR                     * CDFA0  DOHSTR
              LENGTH                             * CDFA5  length, to #CE093
              NIBHEX  F30131DC00E000F8010402F801390F71 * CDFAA  ?..Í...↓.@ ↓.εð.
              NIBHEX  001B0015001100110010000F00140004 * CDFCA  .±.Q.......ð.A.@
              NIBHEX  0004000F001000010013001500190011 * CDFEA  .@.ð.....1.Q.γ..
              NIBHEX  0010000F0011000F0001000F00100001 * CE00A  ...ð...ð...ð....
              NIBHEX  0011001F001100110010000100110018 * CE02A  ...ñ...........ā
              NIBHEX  010011001E680C210013001500190011 * CE04A  ....á▶À..1.Q.γ..
              NIBHEX  0010000F00140004000400040004E807 * CE06A  ...ð.A.@.@.@.@←p
              NIBHEX  0F001F803                  * CE08A  ð.ñ.
        ENDLENGTH                                * CE093
              ROMPTR  0E3 063                    * CE093  ~PCunpack
              XYGROBDISP                         * CE09E
              TURNMENUOFF                        * CE0A3
              BINT10                             * CE0A8
              ONE_DO                             * CE0AD
              BINT9                              * CE0B2
              INDEX@                             * CE0B7
              BINT1                              * CE0BC
              #-                                 * CE0C1
              BINT7                              * CE0C6
              #*                                 * CE0CB
              BINT7                              * CE0D0
              #+                                 * CE0D5
              #       78                         * CE0DA  120
              OVER                               * CE0E4
              LINEON                             * CE0E9
              LOOP                               * CE0EE
              BINT18                             * CE0F3
              ONE_DO                             * CE0F8
              INDEX@                             * CE0FD
              #1-                                * CE102
              BINT7                              * CE107
              #*                                 * CE10C
              BINT9                              * CE111
              #+                                 * CE116
              BINT7                              * CE11B
              OVER                               * CE120
              BINT63                             * CE125
              LINEON                             * CE12A
              LOOP                               * CE12F
              ROMPTR  0E7 053                    * CE134
              HARDBUFF                           * CE13F
              BINT115                            * CE144
              BINT57                             * CE149
              GROB!                              * CE14E
              CLKTICKS                           * CE153
              HXS>#                              * CE158
              UNCOERCE                           * CE15D
              DORANDOMIZE                        * CE162
              ROMPTR  0E7 035                    * CE167
              '                                  * CE172
              ID      Nmines                     * CE177
              SAFE@                              * CE18A
              ITE                                * CE18F
              ::                                 * CE194
                DUPTYPEREAL?                     * CE199
                ITE                              * CE19E
                ::                               * CE1A3
                  %ABS                           * CE1A8
                  COERCE                         * CE1AD
                  DUP                            * CE1B2
                  #       40                     * CE1B7  64
                  #>                             * CE1C1
                  IT                             * CE1C6
                  ::                             * CE1CB
                    DROP                         * CE1D0
                    #       40                   * CE1D5  64
                  ;                              * CE1DF
                ;                                * CE1E4
                ::                               * CE1E9
                  DROP                           * CE1EE
                  BINT20                         * CE1F3
                ;                                * CE1F8
              ;                                  * CE1FD
              BINT20                             * CE202
              #1+_ONE_DO                         * CE207
              BEGIN                              * CE20C
              %RAN                               * CE211
              %       1.24E2                     * CE216
              %*                                 * CE22B
              COERCE                             * CE230
              #2+                                * CE235
              2DUP                               * CE23A
              SUB$1#                             * CE23F
              BINT48                             * CE244
              #<>                                * CE249
              WHILE                              * CE24E
              ::                                 * CE253
                DROP                             * CE258
              ;                                  * CE25D
              REPEAT                             * CE262
              BINT49                             * CE267
              ROMPTR  0E7 051                    * CE26C
              LOOP                               * CE277
              ROMPTR  0E7 031                    * CE27C
              '                                  * CE287
              ID      Nmines                     * CE28C
              SAFE@                              * CE29F
              NOT                                * CE2A4
              ?SEMI                              * CE2A9
              DUPTYPEREAL?                       * CE2AE
              ITE                                * CE2B3
              ::                                 * CE2B8
                %       0E0                      * CE2BD
                %<                               * CE2D2
                IT                               * CE2D7
                ROMPTR  0E7 03D                  * CE2DC
              ;                                  * CE2E7
              DROP                               * CE2EC
            ;                                    * CE2F1
            ROMPTR  0E7 041                      * CE2F6
            '                                    * CE301
            ROMPTR  0E7 03E                      * CE306
            RESOROMP                             * CE311
            ROMPTR  0E7 044                      * CE316
            TrueTrue                             * CE321
            FALSE                                * CE326
            ZEROFALSE                            * CE32B
            '                                    * CE330
            LAM     'MF1                         * CE335
            'ERRJMP                              * CE344
            POLSetUI                             * CE349
            POLKeyUI                             * CE34E
            ABND                                 * CE353
          ;                                      * CE358
          ERRTRAP                                * CE35D
          POLResUI&Err                           * CE362
          POLRestoreUI                           * CE367
        ;                                        * CE36C

* ROMPTR 0E7 03B
* refs (1): CCAAB
ROMP_0E7_03B:
        ::                                       * CE371
          #       E705                           * CE376  59141
          JstGetTHEMESG                          * CE380
          ROMPTR  0E7 043                        * CE385
          BINT16                                 * CE390
          BINT8                                  * CE395
          ROMPTR  0E7 03F                        * CE39A
          ROMPTR  0E7 055                        * CE3A5
          XYGROBDISP                             * CE3B0
          ROMPTR  0E7 03D                        * CE3B5
          SetDAsTemp                             * CE3C0
          ROMPTR  0E7 04E                        * CE3C5
        ;                                        * CE3D0

* ROMPTR 0E7 03C
* refs (1): CCAAB
ROMP_0E7_03C:
        ::                                       * CE3D5
          #       E706                           * CE3DA  59142
          JstGetTHEMESG                          * CE3E4
          ROMPTR  0E7 043                        * CE3E9
          ROMPTR  0E7 03F                        * CE3F4
          ROMPTR  0E7 054                        * CE3FF
          XYGROBDISP                             * CE40A
          ROMPTR  0E7 03D                        * CE40F
          SetDAsTemp                             * CE41A
          ROMPTR  0E7 04E                        * CE41F
        ;                                        * CE42A

* ROMPTR 0E7 03D
* refs (1): CCAAB
ROMP_0E7_03D:
        ::                                       * CE42F
          BINT9                                  * CE434
          ONE_DO                                 * CE439
          BINT17                                 * CE43E
          ONE_DO                                 * CE443
          INDEX@                                 * CE448
          JINDEX@                                * CE44D
          2DUP                                   * CE452
          ROMPTR  0E7 04F                        * CE457
          BINT49                                 * CE462
          #=ITE                                  * CE467
          ::                                     * CE46C
            HARDBUFF                             * CE471
            3UNROLL                              * CE476
            ROMPTR  0E7 052                      * CE47B
            4UNROLL                              * CE486
            ROMPTR  0E7 03F                      * CE48B
            GROB!                                * CE496
          ;                                      * CE49B
          2DROP                                  * CE4A0
          LOOP                                   * CE4A5
          LOOP                                   * CE4AA
        ;                                        * CE4AF

* ROMPTR 0E7 03E
* refs (1): CCAAB
ROMP_0E7_03E:
        ::                                       * CE4B4
          ROMPTR  0E7 037                        * CE4B9
          ROMPTR  0E7 036                        * CE4C4
          BINT0                                  * CE4CF
          3UNROLL                                * CE4D4
          DUPDUP                                 * CE4D9
          BINT8                                  * CE4DE
          #<>                                    * CE4E3
          IT                                     * CE4E8
          #1+                                    * CE4ED
          #1+                                    * CE4F2
          SWAPDUP                                * CE4F7
          #1<>                                   * CE4FC
          IT                                     * CE501
          #1-                                    * CE506
          ROTDUP                                 * CE50B
          DUP                                    * CE510
          BINT16                                 * CE515
          #<>                                    * CE51A
          IT                                     * CE51F
          #1+                                    * CE524
          #1+                                    * CE529
          SWAPDUP                                * CE52E
          #1<>                                   * CE533
          IT                                     * CE538
          #1-                                    * CE53D
          DO                                     * CE542
          ROT                                    * CE547
          3PICK3PICK                             * CE54C
          DO                                     * CE551
          JINDEX@                                * CE556
          INDEX@                                 * CE55B
          ROMPTR  0E7 04F                        * CE560
          BINT49                                 * CE56B
          #=                                     * CE570
          IT                                     * CE575
          #1+                                    * CE57A
          LOOP                                   * CE57F
          3UNROLL                                * CE584
          LOOP                                   * CE589
          2DROP                                  * CE58E
          #       E701                           * CE593  59137
          JstGetTHEMESG                          * CE59D
          SWAP                                   * CE5A2
          DUP                                    * CE5A7
          #1=                                    * CE5AC
          ITE                                    * CE5B1
          #       E702                           * CE5B6  59138
          #       E703                           * CE5C0  59139
          JstGetTHEMESG                          * CE5CA
          SWAP                                   * CE5CF
          #>$                                    * CE5D4
          SWAP                                   * CE5D9
          &$                                     * CE5DE
          &$                                     * CE5E3
          ROMPTR  0E7 043                        * CE5E8
        ;                                        * CE5F3

* ROMPTR 0E7 03F
* refs (1): CCAAB
ROMP_0E7_03F:
        ::                                       * CE5F8
          BINT1                                  * CE5FD
          #-                                     * CE602
          BINT7                                  * CE607
          #*                                     * CE60C
          #8+                                    * CE611
          SWAPONE                                * CE616
          #-                                     * CE61B
          BINT7                                  * CE620
          #*                                     * CE625
          #10+                                   * CE62A
          SWAP                                   * CE62F
        ;                                        * CE634

* ROMPTR 0E7 040
* refs (1): CCAAB
ROMP_0E7_040:
        ::                                       * CE639
          ROMPTR  0E7 037                        * CE63E
          ROMPTR  0E7 036                        * CE649
          ROMPTR  0E7 03F                        * CE654
          BINT6                                  * CE65F
          BINT6                                  * CE664
          MAKEGROB                               * CE669
          INVGROB                                * CE66E
          XYGROBDISP                             * CE673
        ;                                        * CE678

* ROMPTR 0E7 041
* refs (1): CCAAB
ROMP_0E7_041:
        ::                                       * CE67D
          ROMPTR  0E7 037                        * CE682
          ROMPTR  0E7 036                        * CE68D
          2DUP                                   * CE698
          ROMPTR  0E7 04F                        * CE69D
          DUP                                    * CE6A8
          BINT49                                 * CE6AD
          #=                                     * CE6B2
          casedrop                               * CE6B7
          ::                                     * CE6BC
            2DUP                                 * CE6C1
            BINT51                               * CE6C6
            ROMPTR  0E7 050                      * CE6CB
            ROMPTR  0E7 03C                      * CE6D6
          ;                                      * CE6E1
          BINT48                                 * CE6E6
          #=                                     * CE6EB
          IT                                     * CE6F0
          ::                                     * CE6F5
            ROMPTR  0E7 042                      * CE6FA
            2DUP                                 * CE705
            BINT50                               * CE70A
            ROMPTR  0E7 050                      * CE70F
          ;                                      * CE71A
          2DUP                                   * CE71F
          HARDBUFF                               * CE724
          3UNROLL                                * CE729
          ROMPTR  0E7 052                        * CE72E
          TOTEMPOB                               * CE739
          INVGROB                                * CE73E
          4UNROLL                                * CE743
          ROMPTR  0E7 03F                        * CE748
          GROB!                                  * CE753
          BINT8                                  * CE758
          #=                                     * CE75D
          SWAP                                   * CE762
          BINT16                                 * CE767
          #=                                     * CE76C
          ANDcase                                * CE771
          ROMPTR  0E7 03B                        * CE776
        ;                                        * CE781

* ROMPTR 0E7 042
* refs (1): CCAAB
ROMP_0E7_042:
        ::                                       * CE786
          ROMPTR  0E7 034                        * CE78B
          #1+                                    * CE796
          ROMPTR  0E7 032                        * CE79B
        ;                                        * CE7A6

* ROMPTR 0E7 043
* refs (1): CCAAB
ROMP_0E7_043:
        ::                                       * CE7AB
          #       E704                           * CE7B0  59140
          JstGetTHEMESG                          * CE7BA
          ROMPTR  0E7 034                        * CE7BF
          #>$                                    * CE7CA
          &$                                     * CE7CF
          &$                                     * CE7D4
          $>grob                                 * CE7D9
          DUPGROBDIM                             * CE7DE
          SWAPDROP                               * CE7E3
          DUP                                    * CE7E8
          #       6D                             * CE7ED  109
          #>                                     * CE7F7
          IT                                     * CE7FC
          ::                                     * CE801
            DROP                                 * CE806
            ZEROZERO                             * CE80B
            #       6D                           * CE810  109
            BINT6                                * CE81A
            SUBGROB                              * CE81F
            #       6D                           * CE824  109
          ;                                      * CE82E
          #       6D                             * CE833  109
          SWAP#-                                 * CE83D
          #2/                                    * CE842
          BINT11                                 * CE847
          #+                                     * CE84C
          BINT0                                  * CE851
          ROT                                    * CE856
          BINT6                                  * CE85B
          #       6D                             * CE860  109
          MAKEGROB                               * CE86A
          HARDBUFF                               * CE86F
          BINT11                                 * CE874
          BINT0                                  * CE879
          GROB!                                  * CE87E
          XYGROBDISP                             * CE883
        ;                                        * CE888

* ROMPTR 0E7 044
* refs (1): CCAAB
ROMP_0E7_044:
        ::                                       * CE88D
          BINT1                                  * CE892
          #=casedrop                             * CE897
          ::                                     * CE89C
            BINT11                               * CE8A1
            ?CaseRomptr@                         * CE8A6
            ROMPTR  0E7 046                      * CE8AB
            BINT32                               * CE8B6
            ?CaseRomptr@                         * CE8BB
            ROMPTR  0E7 046                      * CE8C0
            BINT16                               * CE8CB
            ?CaseRomptr@                         * CE8D0
            ROMPTR  0E7 047                      * CE8D5
            BINT36                               * CE8E0
            ?CaseRomptr@                         * CE8E5
            ROMPTR  0E7 047                      * CE8EA
            BINT17                               * CE8F5
            ?CaseRomptr@                         * CE8FA
            ROMPTR  0E7 048                      * CE8FF
            BINT42                               * CE90A
            ?CaseRomptr@                         * CE90F
            ROMPTR  0E7 048                      * CE914
            BINT18                               * CE91F
            ?CaseRomptr@                         * CE924
            ROMPTR  0E7 04D                      * CE929
            BINT38                               * CE934
            ?CaseRomptr@                         * CE939
            ROMPTR  0E7 04D                      * CE93E
            BINT31                               * CE949
            ?CaseRomptr@                         * CE94E
            ROMPTR  0E7 049                      * CE953
            BINT33                               * CE95E
            ?CaseRomptr@                         * CE963
            ROMPTR  0E7 04A                      * CE968
            BINT41                               * CE973
            ?CaseRomptr@                         * CE978
            ROMPTR  0E7 04B                      * CE97D
            BINT43                               * CE988
            ?CaseRomptr@                         * CE98D
            ROMPTR  0E7 04C                      * CE992
            BINT14                               * CE99D
            ?CaseRomptr@                         * CE9A2
            ROMPTR  0E7 056                      * CE9A7
            BINT35                               * CE9B2
            #=casedrpfls                         * CE9B7
            BINT40                               * CE9BC
            #=casedrpfls                         * CE9C1
            BINT45                               * CE9C6
            ?CaseRomptr@                         * CE9CB
            ROMPTR  0E7 045                      * CE9D0
            DROP                                 * CE9DB
            'DoBadKeyT                           * CE9E0
          ;                                      * CE9E5
          BINT3                                  * CE9EA
          #=casedrop                             * CE9EF
          ::                                     * CE9F4
            BINT45                               * CE9F9
            #=casedrpfls                         * CE9FE
            DROP                                 * CEA03
            'DoBadKeyT                           * CEA08
          ;                                      * CEA0D
          2DROP                                  * CEA12
          'DoBadKeyT                             * CEA17
        ;                                        * CEA1C

* ROMPTR 0E7 045
* refs (1): CCAAB
ROMP_0E7_045:
        ::                                       * CEA21
          TakeOver                               * CEA26
          ClrDAsOK                               * CEA2B
          ROMPTR  0E7 04E                        * CEA30
        ;                                        * CEA3B

* ROMPTR 0E7 046
* refs (1): CCAAB
ROMP_0E7_046:
        ::                                       * CEA40
          TakeOver                               * CEA45
          ROMPTR  0E7 040                        * CEA4A
          ROMPTR  0E7 036                        * CEA55
          #1-                                    * CEA60
          DUP#0=                                 * CEA65
          ITE                                    * CEA6A
          ::                                     * CEA6F
            DROP                                 * CEA74
            DoBadKey                             * CEA79
          ;                                      * CEA7E
          ROMPTR  0E7 030                        * CEA83
          ROMPTR  0E7 041                        * CEA8E
        ;                                        * CEA99

* ROMPTR 0E7 047
* refs (1): CCAAB
ROMP_0E7_047:
        ::                                       * CEA9E
          TakeOver                               * CEAA3
          ROMPTR  0E7 040                        * CEAA8
          ROMPTR  0E7 037                        * CEAB3
          #1-                                    * CEABE
          DUP#0=                                 * CEAC3
          ITE                                    * CEAC8
          ::                                     * CEACD
            DROP                                 * CEAD2
            DoBadKey                             * CEAD7
          ;                                      * CEADC
          ROMPTR  0E7 02F                        * CEAE1
          ROMPTR  0E7 041                        * CEAEC
        ;                                        * CEAF7

* ROMPTR 0E7 048
* refs (1): CCAAB
ROMP_0E7_048:
        ::                                       * CEAFC
          TakeOver                               * CEB01
          ROMPTR  0E7 040                        * CEB06
          ROMPTR  0E7 036                        * CEB11
          #1+DUP                                 * CEB1C
          BINT9                                  * CEB21
          #=ITE                                  * CEB26
          ::                                     * CEB2B
            DROP                                 * CEB30
            DoBadKey                             * CEB35
          ;                                      * CEB3A
          ROMPTR  0E7 030                        * CEB3F
          ROMPTR  0E7 041                        * CEB4A
        ;                                        * CEB55

* ROMPTR 0E7 049
* refs (1): CCAAB
ROMP_0E7_049:
        ::                                       * CEB5A
          TakeOver                               * CEB5F
          ROMPTR  0E7 037                        * CEB64
          DUP                                    * CEB6F
          #1=                                    * CEB74
          casedrop                               * CEB79
          DoBadKey                               * CEB7E
          ROMPTR  0E7 036                        * CEB83
          DUP                                    * CEB8E
          #1=                                    * CEB93
          case2drop                              * CEB98
          DoBadKey                               * CEB9D
          ROMPTR  0E7 040                        * CEBA2
          #1-                                    * CEBAD
          ROMPTR  0E7 030                        * CEBB2
          #1-                                    * CEBBD
          ROMPTR  0E7 02F                        * CEBC2
          ROMPTR  0E7 041                        * CEBCD
        ;                                        * CEBD8

* ROMPTR 0E7 04A
* refs (1): CCAAB
ROMP_0E7_04A:
        ::                                       * CEBDD
          TakeOver                               * CEBE2
          ROMPTR  0E7 037                        * CEBE7
          DUP                                    * CEBF2
          BINT16                                 * CEBF7
          #=                                     * CEBFC
          casedrop                               * CEC01
          DoBadKey                               * CEC06
          ROMPTR  0E7 036                        * CEC0B
          DUP                                    * CEC16
          #1=                                    * CEC1B
          case2drop                              * CEC20
          DoBadKey                               * CEC25
          ROMPTR  0E7 040                        * CEC2A
          #1-                                    * CEC35
          ROMPTR  0E7 030                        * CEC3A
          #1+                                    * CEC45
          ROMPTR  0E7 02F                        * CEC4A
          ROMPTR  0E7 041                        * CEC55
        ;                                        * CEC60

* ROMPTR 0E7 04B
* refs (1): CCAAB
ROMP_0E7_04B:
        ::                                       * CEC65
          TakeOver                               * CEC6A
          ROMPTR  0E7 037                        * CEC6F
          DUP                                    * CEC7A
          #1=                                    * CEC7F
          casedrop                               * CEC84
          DoBadKey                               * CEC89
          ROMPTR  0E7 036                        * CEC8E
          DUP                                    * CEC99
          BINT8                                  * CEC9E
          #=                                     * CECA3
          case2drop                              * CECA8
          DoBadKey                               * CECAD
          ROMPTR  0E7 040                        * CECB2
          #1+                                    * CECBD
          ROMPTR  0E7 030                        * CECC2
          #1-                                    * CECCD
          ROMPTR  0E7 02F                        * CECD2
          ROMPTR  0E7 041                        * CECDD
        ;                                        * CECE8

* ROMPTR 0E7 04C
* refs (1): CCAAB
ROMP_0E7_04C:
        ::                                       * CECED
          TakeOver                               * CECF2
          ROMPTR  0E7 037                        * CECF7
          DUP                                    * CED02
          BINT16                                 * CED07
          #=                                     * CED0C
          casedrop                               * CED11
          DoBadKey                               * CED16
          ROMPTR  0E7 036                        * CED1B
          DUP                                    * CED26
          BINT8                                  * CED2B
          #=                                     * CED30
          case2drop                              * CED35
          DoBadKey                               * CED3A
          ROMPTR  0E7 040                        * CED3F
          #1+                                    * CED4A
          ROMPTR  0E7 030                        * CED4F
          #1+                                    * CED5A
          ROMPTR  0E7 02F                        * CED5F
          ROMPTR  0E7 041                        * CED6A
        ;                                        * CED75

* ROMPTR 0E7 04D
* refs (1): CCAAB
ROMP_0E7_04D:
        ::                                       * CED7A
          TakeOver                               * CED7F
          ROMPTR  0E7 040                        * CED84
          ROMPTR  0E7 037                        * CED8F
          #1+                                    * CED9A
          DUP                                    * CED9F
          BINT17                                 * CEDA4
          #=ITE                                  * CEDA9
          ::                                     * CEDAE
            DROP                                 * CEDB3
            DoBadKey                             * CEDB8
          ;                                      * CEDBD
          ROMPTR  0E7 02F                        * CEDC2
          ROMPTR  0E7 041                        * CEDCD
        ;                                        * CEDD8

* ROMPTR 0E7 04E
* refs (1): CCAAB
ROMP_0E7_04E:
        ::                                       * CEDDD
          TakeOver                               * CEDE2
          TRUE                                   * CEDE7
          ROMPTR  0E7 02E                        * CEDEC
        ;                                        * CEDF7

* ROMPTR 0E7 04F
* refs (1): CCAAB
ROMP_0E7_04F:
        ::                                       * CEDFC
          #1-                                    * CEE01
          BINT16                                 * CEE06
          #*                                     * CEE0B
          #+                                     * CEE10
          ROMPTR  0E7 035                        * CEE15
          SWAP                                   * CEE20
          SUB$1#                                 * CEE25
        ;                                        * CEE2A

* ROMPTR 0E7 050
* refs (1): CCAAB
ROMP_0E7_050:
        ::                                       * CEE2F
          3UNROLL                                * CEE34
          #1-                                    * CEE39
          BINT16                                 * CEE3E
          #*                                     * CEE43
          #+                                     * CEE48
          ROMPTR  0E7 035                        * CEE4D
          SWAPROT                                * CEE58
          ROMPTR  0E7 051                        * CEE5D
          ROMPTR  0E7 031                        * CEE68
        ;                                        * CEE73

* ROMPTR 0E7 051
* refs (1): CCAAB
ROMP_0E7_051:
        CODE                                     * CEE78  72 nibbles
          GOSBVL  POP#                           * CEE82
          R0=A                                   * CEE89
          GOSBVL  POP#                           * CEE8C
          R1=A                                   * CEE93
          GOSBVL  SAVPTR                         * CEE96
          A=DAT1  A                              * CEE9D
          LC(5)   #00008                         * CEEA0
          A=A+C   A                              * CEEA7
          C=R1                                   * CEEA9
          A=A+C   A                              * CEEAC
          A=A+C   A                              * CEEAE
          D1=A                                   * CEEB0
          C=R0                                   * CEEB3
          DAT1=C  B                              * CEEB6
          GOSBVL  GETPTR                         * CEEB9
          A=DAT0  A                              * CEEC0
          D0=D0+  5                              * CEEC3
          PC=(A)                                 * CEEC6
        ENDCODE                                  * CEECA

* ROMPTR 0E7 052
* refs (1): CCAAB
ROMP_0E7_052:
        GROB    "images/CEECA.png"               * CEECA  6 x 6

* ROMPTR 0E7 053
* refs (1): CCAAB
ROMP_0E7_053:
        GROB    "images/CEEEA.png"               * CEEEA  6 x 6

* ROMPTR 0E7 054
* refs (1): CCAAB
ROMP_0E7_054:
        GROB    "images/CEF0A.png"               * CEF0A  6 x 6

* ROMPTR 0E7 055
* refs (1): CCAAB
ROMP_0E7_055:
        GROB    "images/CEF2A.png"               * CEF2A  6 x 6

* ROMPTR 0E7 056
* refs (1): CCAAB
ROMP_0E7_056:
        ::                                       * CEF4A
          HARDBUFF                               * CEF4F
          ROMPTR  0E7 037                        * CEF54
          ROMPTR  0E7 036                        * CEF5F
          ROMPTR  0E7 034                        * CEF6A
          ROMPTR  0E7 035                        * CEF75
          BINT5                                  * CEF80
          {}N                                    * CEF85
          #       E7                             * CEF8A  231
          SWAP                                   * CEF94
          TWO{}N                                 * CEF99
          DUP                                    * CEF9E
          OSIZE                                  * CEFA3
          CODE                                   * CEFA8  71 nibbles
            GOSBVL  POP#                         * CEFB2
            R1=A.F  A                            * CEFB9
            GOSBVL  SAVPTR                       * CEFBF
            A=DAT1  A                            * CEFC6
            D1=A                                 * CEFC9
            LC(5)   DOEXT0                       * CEFCC
            DAT1=C  A                            * CEFD3
            D1=D1+  5                            * CEFD6
            C=R1.F  A                            * CEFD9
            C=C-CON A,5                          * CEFDF
            DAT1=C  A                            * CEFE5
            GOSBVL  GETPTR                       * CEFE8
            A=DAT0  A                            * CEFEF
            D0=D0+  5                            * CEFF2
            PC=(A)                               * CEFF5
          ENDCODE                                * CEFF9
          '                                      * CEFF9
          ID      MHpar                          * CEFFE
          XEQSTOID                               * CF00F
          ROMPTR  0E7 04E                        * CF014
          ClrDAsOK                               * CF01F
        ;                                        * CF024

* ROMPTR 0E7 057
* refs (1): CCAAB
ROMP_0E7_057:
        ::                                       * CF029
          '                                      * CF02E
          ID      MHpar                          * CF033
          SAFE@                                  * CF044
          DUP                                    * CF049
          casedrop                               * CF04E
          ::                                     * CF053
            TOTEMPOB                             * CF058
            DUP                                  * CF05D
            ROMPTR  0E7 058                      * CF062  ~UTTYPEEXT0?
            NOTcasedrop                          * CF06D
            FALSE                                * CF072
            CODE                                 * CF077  64 nibbles
              C=DAT1  A                          * CF081
              CD1EX                              * CF084
              RSTK=C                             * CF087
              D1=D1+  10                         * CF089
              A=DAT1  A                          * CF08C
              LC(5)   #000E7                     * CF08F
              ?C#A    A                          * CF096
              GOYES   L_CF0B5                    * CF099
              D1=D1-  10                         * CF09B
              LC(5)   DOLIST                     * CF09E
              DAT1=C  A                          * CF0A5
              D1=D1+  5                          * CF0A8
              LC(5)   DOBINT                     * CF0AB
              DAT1=C  A                          * CF0B2
L_CF0B5:
              C=RSTK                             * CF0B5
              D1=C                               * CF0B7
              GOVLNG  PushF/TLoop                * CF0BA
            ENDCODE                              * CF0C1
            NOTcasedrop                          * CF0C1
            FALSE                                * CF0C6
            INCOMPDROP                           * CF0CB
            SWAPDROP                             * CF0D0
            TRUE                                 * CF0D5
            '                                    * CF0DA
            ID      MHpar                        * CF0DF
            PURGE                                * CF0F0
          ;                                      * CF0F5
        ;                                        * CF0FA

* ROMPTR 0E7 058
* refs (1): CCAAB
~UTTYPEEXT0?:
        CODE                                     * CF0FF  72 nibbles
          LC(5)   DOEXT0                         * CF109
          RSTK=C                                 * CF110
          C=DAT1  A                              * CF112
          CD1EX                                  * CF115
          A=DAT1  A                              * CF118
          D1=C                                   * CF11B
          C=RSTK                                 * CF11E
          ?C=A    A                              * CF120
          GOYES   L_CF13B                        * CF123
          P=      0                              * CF125
          LC(5)   FALSE                          * CF127
          DAT1=C  A                              * CF12E
          A=DAT0  A                              * CF131
          D0=D0+  5                              * CF134
          PC=(A)                                 * CF137
L_CF13B:
          P=      0                              * CF13B
          LC(5)   TRUE                           * CF13D
          DAT1=C  A                              * CF144
          A=DAT0  A                              * CF147
          D0=D0+  5                              * CF14A
          PC=(A)                                 * CF14D
        ENDCODE                                  * CF151

LIB0E7.hash:
        CON(5)  DOHSTR                           * CF151  hash table of library 0E7
        LENGTH                                   * CF156  length, to #CF1B5
        CON(5)  0                                * CF15B  names of length 1
        CON(5)  0                                * CF160  names of length 2
        CON(5)  0                                * CF165  names of length 3
        CON(5)  0                                * CF16A  names of length 4
        CON(5)  0                                * CF16F  names of length 5
        CON(5)  0                                * CF174  names of length 6
        CON(5)  0                                * CF179  names of length 7
        CON(5)  0                                * CF17E  names of length 8
        CON(5)  0                                * CF183  names of length 9
        CON(5)  0                                * CF188  names of length 10
        CON(5)  0                                * CF18D  names of length 11
        CON(5)  0                                * CF192  names of length 12
        CON(5)  0                                * CF197  names of length 13
        CON(5)  0                                * CF19C  names of length 14
        CON(5)  0                                * CF1A1  names of length 15
        CON(5)  0                                * CF1A6  names of length 16
        REL(5)  L_CF1B0                          * CF1AB  end of the names
L_CF1B0:
        CON(5)  0                                * CF1B0  command 000 has no name
        ENDLENGTH                                * CF1B5

LIB0E7.link:
        CON(5)  DOHSTR                           * CF1B5  link table of library 0E7
        LENGTH                                   * CF1BA  length, to #CF37C
        REL(5)  ROMP_0E7_000                     * CF1BF  000 
        REL(5)  ROMP_0E7_001                     * CF1C4  001 
        REL(5)  ROMP_0E7_002                     * CF1C9  002 
        REL(5)  ROMP_0E7_003                     * CF1CE  003 
        REL(5)  ROMP_0E7_004                     * CF1D3  004 
        REL(5)  ROMP_0E7_005                     * CF1D8  005 
        REL(5)  ROMP_0E7_006                     * CF1DD  006 
        REL(5)  ROMP_0E7_007                     * CF1E2  007 
        REL(5)  ROMP_0E7_008                     * CF1E7  008 
        REL(5)  ROMP_0E7_009                     * CF1EC  009 
        REL(5)  ROMP_0E7_00A                     * CF1F1  00A 
        REL(5)  ROMP_0E7_00B                     * CF1F6  00B 
        REL(5)  ROMP_0E7_00C                     * CF1FB  00C 
        REL(5)  ROMP_0E7_00D                     * CF200  00D 
        REL(5)  ROMP_0E7_00E                     * CF205  00E 
        REL(5)  ROMP_0E7_00F                     * CF20A  00F 
        REL(5)  ROMP_0E7_010                     * CF20F  010 
        REL(5)  ~UTVUNS1Arg                      * CF214  011 ~UTVUNS1Arg
        REL(5)  ROMP_0E7_012                     * CF219  012 
        REL(5)  ROMP_0E7_013                     * CF21E  013 
        REL(5)  ROMP_0E7_014                     * CF223  014 
        REL(5)  ROMP_0E7_015                     * CF228  015 
        REL(5)  ROMP_0E7_016                     * CF22D  016 
        REL(5)  ROMP_0E7_017                     * CF232  017 
        REL(5)  ROMP_0E7_018                     * CF237  018 
        REL(5)  ROMP_0E7_019                     * CF23C  019 
        REL(5)  ROMP_0E7_01A                     * CF241  01A 
        REL(5)  ROMP_0E7_01B                     * CF246  01B 
        REL(5)  ROMP_0E7_01C                     * CF24B  01C 
        REL(5)  ROMP_0E7_01D                     * CF250  01D 
        REL(5)  ROMP_0E7_01E                     * CF255  01E 
        REL(5)  ROMP_0E7_01F                     * CF25A  01F 
        REL(5)  ROMP_0E7_020                     * CF25F  020 
        REL(5)  ROMP_0E7_021                     * CF264  021 
        REL(5)  ROMP_0E7_022                     * CF269  022 
        REL(5)  ROMP_0E7_023                     * CF26E  023 
        REL(5)  ROMP_0E7_024                     * CF273  024 
        REL(5)  ROMP_0E7_025                     * CF278  025 
        REL(5)  ROMP_0E7_026                     * CF27D  026 
        REL(5)  ROMP_0E7_027                     * CF282  027 
        REL(5)  ROMP_0E7_029                     * CF287  028 
        REL(5)  ROMP_0E7_029                     * CF28C  029 
        REL(5)  ROMP_0E7_02A                     * CF291  02A 
        REL(5)  ROMP_0E7_02B                     * CF296  02B 
        REL(5)  ROMP_0E7_02C                     * CF29B  02C 
        REL(5)  ROMP_0E7_02D                     * CF2A0  02D 
        REL(5)  ROMP_0E7_02E                     * CF2A5  02E 
        REL(5)  ROMP_0E7_02F                     * CF2AA  02F 
        REL(5)  ROMP_0E7_030                     * CF2AF  030 
        REL(5)  ROMP_0E7_031                     * CF2B4  031 
        REL(5)  ROMP_0E7_032                     * CF2B9  032 
        REL(5)  ROMP_0E7_033                     * CF2BE  033 
        REL(5)  ROMP_0E7_034                     * CF2C3  034 
        REL(5)  ROMP_0E7_035                     * CF2C8  035 
        REL(5)  ROMP_0E7_036                     * CF2CD  036 
        REL(5)  ROMP_0E7_037                     * CF2D2  037 
        REL(5)  ROMP_0E7_038                     * CF2D7  038 
        REL(5)  ROMP_0E7_039                     * CF2DC  039 
        REL(5)  ROMP_0E7_03A                     * CF2E1  03A 
        REL(5)  ROMP_0E7_03B                     * CF2E6  03B 
        REL(5)  ROMP_0E7_03C                     * CF2EB  03C 
        REL(5)  ROMP_0E7_03D                     * CF2F0  03D 
        REL(5)  ROMP_0E7_03E                     * CF2F5  03E 
        REL(5)  ROMP_0E7_03F                     * CF2FA  03F 
        REL(5)  ROMP_0E7_040                     * CF2FF  040 
        REL(5)  ROMP_0E7_041                     * CF304  041 
        REL(5)  ROMP_0E7_042                     * CF309  042 
        REL(5)  ROMP_0E7_043                     * CF30E  043 
        REL(5)  ROMP_0E7_044                     * CF313  044 
        REL(5)  ROMP_0E7_045                     * CF318  045 
        REL(5)  ROMP_0E7_046                     * CF31D  046 
        REL(5)  ROMP_0E7_047                     * CF322  047 
        REL(5)  ROMP_0E7_048                     * CF327  048 
        REL(5)  ROMP_0E7_049                     * CF32C  049 
        REL(5)  ROMP_0E7_04A                     * CF331  04A 
        REL(5)  ROMP_0E7_04B                     * CF336  04B 
        REL(5)  ROMP_0E7_04C                     * CF33B  04C 
        REL(5)  ROMP_0E7_04D                     * CF340  04D 
        REL(5)  ROMP_0E7_04E                     * CF345  04E 
        REL(5)  ROMP_0E7_04F                     * CF34A  04F 
        REL(5)  ROMP_0E7_050                     * CF34F  050 
        REL(5)  ROMP_0E7_051                     * CF354  051 
        REL(5)  ROMP_0E7_052                     * CF359  052 
        REL(5)  ROMP_0E7_053                     * CF35E  053 
        REL(5)  ROMP_0E7_054                     * CF363  054 
        REL(5)  ROMP_0E7_055                     * CF368  055 
        REL(5)  ROMP_0E7_056                     * CF36D  056 
        REL(5)  ROMP_0E7_057                     * CF372  057 
        REL(5)  ~UTTYPEEXT0?                     * CF377  058 ~UTTYPEEXT0?
        ENDLENGTH                                * CF37C
        NIBHEX  0000                             * CF37C  ..
