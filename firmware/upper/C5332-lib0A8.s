* HP 48GX ROM revision R, #C5332-#C78DA: Library part 0A8
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #C5332 in the original ROM).

LIB0A8:
        CON(3)  #0A8                             * C5332  library number
        REL(5)  LIB0A8.hash                      * C5335  hash table
        CON(5)  0                                * C533A  message table
        REL(5)  LIB0A8.link                      * C533F  link table
        CON(5)  0                                * C5344  config
        RPL

* ROMPTR 0A8 000
* refs (1): C5332
ROMP_0A8_000:
        {                                        * C5349
          NULL$                                  * C534E
          DoBadKey                               * C5353
        }                                        * C5358

* ROMPTR 0A8 001
* refs (1): C5332
ROMP_0A8_001:
        {                                        * C535D
          CUREQ                                  * C5362
          {                                      * C5367
            CUREQ                                * C536C
            xSTEQ                                * C5371
            xRCEQ                                * C5376
          }                                      * C537B
        }                                        * C5380

* ROMPTR 0A8 002
* refs (1): C5332
ROMP_0A8_002:
        ID      ΣPAR                             * C5385

* ROMPTR 0A8 003
* refs (1): C5332
ROMP_0A8_003:
        {                                        * C5394
          ID_SIGMADAT                            * C5399
          {                                      * C539E
            ID_SIGMADAT                          * C53A3
            xSTOSIGMA                            * C53A8
            xRCLSIGMA                            * C53AD
          }                                      * C53B2
        }                                        * C53B7

* ROMPTR 0A8 004
* refs (1): C5332
ROMP_0A8_004:
        {                                        * C53BC
          $       "INFO"                         * C53C1
          ::                                     * C53D3
            TakeOver                             * C53D8
            LocalReview                          * C53DD
          ;                                      * C53E2
        }                                        * C53E7

* ROMPTR 0A8 005
* refs (1): C5332
ROMP_0A8_005:
        {                                        * C53EC
          ::                                     * C53F1
            PTR     FStd/BoxLbl:                 * C53F6
            $       "RECT"                       * C53FB
            BINT16                               * C540D
          ;                                      * C5412
          ::                                     * C5417
            EvalNextChkPRG                       * C541C
            ROMPTR  0AB 013                      * C5421  RECT
          ;                                      * C542C
        }                                        * C5431

* ROMPTR 0A8 006
* refs (1): C5332
ROMP_0A8_006:
        {                                        * C5436
          ::                                     * C543B
            TakeOver                             * C5440
            $       "CYLIN"                      * C5445
            BINT15                               * C5459
            TestSysFlag                          * C545E
            NOT                                  * C5463
            BINT16                               * C5468
            TestSysFlag                          * C546D
            AND                                  * C5472
            Box/StdLabel                         * C5477
          ;                                      * C547C
          ::                                     * C5481
            EvalNextChkPRG                       * C5486
            ROMPTR  0AB 014                      * C548B  CYLIN
          ;                                      * C5496
        }                                        * C549B

* ROMPTR 0A8 007
* refs (1): C5332
ROMP_0A8_007:
        {                                        * C54A0
          ::                                     * C54A5
            TakeOver                             * C54AA
            $       "SPHERE"                     * C54AF
            BINT15                               * C54C5
            TestSysFlag                          * C54CA
            BINT16                               * C54CF
            TestSysFlag                          * C54D4
            AND                                  * C54D9
            Box/StdLabel                         * C54DE
          ;                                      * C54E3
          ::                                     * C54E8
            EvalNextChkPRG                       * C54ED
            ROMPTR  0AB 015                      * C54F2  SPHERE
          ;                                      * C54FD
        }                                        * C5502

* ROMPTR 0A8 008
* refs (1): C5332
ROMP_0A8_008:
        {                                        * C5507
          ::                                     * C550C
            PTR     DirLabel:                    * C5511
            $       "MAKE"                       * C5516
          ;                                      * C5528
          ::                                     * C552D
            MenuMaker                            * C5532
            ROMPTR  0A9 006                      * C5537
            OBJ_40184                            * C5542
          ;                                      * C5547
        }                                        * C554C

* ROMPTR 0A8 009
* refs (1): C5332
ROMP_0A8_009:
        {                                        * C5551
          ::                                     * C5556
            PTR     DirLabel:                    * C555B
            $       "NORM"                       * C5560
          ;                                      * C5572
          ::                                     * C5577
            MenuMaker                            * C557C
            ROMPTR  0A9 007                      * C5581
            OBJ_40184                            * C558C
          ;                                      * C5591
        }                                        * C5596

* ROMPTR 0A8 00A
* refs (1): C5332
ROMP_0A8_00A:
        {                                        * C559B
          ::                                     * C55A0
            PTR     DirLabel:                    * C55A5
            $       "FACTR"                      * C55AA
          ;                                      * C55BE
          ::                                     * C55C3
            MenuMaker                            * C55C8
            ROMPTR  0A9 008                      * C55CD
            OBJ_40184                            * C55D8
          ;                                      * C55DD
        }                                        * C55E2

* ROMPTR 0A8 00B
* refs (1): C5332
ROMP_0A8_00B:
        {                                        * C55E7
          ::                                     * C55EC
            PTR     DirLabel:                    * C55F1
            $       "COL"                        * C55F6
          ;                                      * C5606
          ::                                     * C560B
            MenuMaker                            * C5610
            ROMPTR  0A9 009                      * C5615
            OBJ_40184                            * C5620
          ;                                      * C5625
        }                                        * C562A

* ROMPTR 0A8 00C
* refs (1): C5332
ROMP_0A8_00C:
        {                                        * C562F
          ::                                     * C5634
            PTR     DirLabel:                    * C5639
            $       "ROW"                        * C563E
          ;                                      * C564E
          ::                                     * C5653
            MenuMaker                            * C5658
            ROMPTR  0A9 00A                      * C565D
            OBJ_40184                            * C5668
          ;                                      * C566D
        }                                        * C5672

* ROMPTR 0A8 00D
* refs (1): C5332
ROMP_0A8_00D:
        {                                        * C5677
          ::                                     * C567C
            PTR     DirLabel:                    * C5681
            $       "MATRX"                      * C5686
          ;                                      * C569A
          ::                                     * C569F
            MenuMaker                            * C56A4
            ROMPTR  0A9 005                      * C56A9
            OBJ_40184                            * C56B4
          ;                                      * C56B9
        }                                        * C56BE

* ROMPTR 0A8 00E
* refs (1): C5332
ROMP_0A8_00E:
        {                                        * C56C3
          ::                                     * C56C8
            PTR     BBox/StdLbl:                 * C56CD
            $       "HEX"                        * C56D2
            BINT16                               * C56E2
          ;                                      * C56E7
          ::                                     * C56EC
            EvalNextChkPRG                       * C56F1
            xHEX                                 * C56F6
          ;                                      * C56FB
        }                                        * C5700

* ROMPTR 0A8 00F
* refs (1): C5332
ROMP_0A8_00F:
        {                                        * C5705
          ::                                     * C570A
            PTR     BBox/StdLbl:                 * C570F
            $       "DEC"                        * C5714
            BINT10                               * C5724
          ;                                      * C5729
          ::                                     * C572E
            EvalNextChkPRG                       * C5733
            xDEC                                 * C5738
          ;                                      * C573D
        }                                        * C5742

* ROMPTR 0A8 010
* refs (1): C5332
ROMP_0A8_010:
        {                                        * C5747
          ::                                     * C574C
            PTR     BBox/StdLbl:                 * C5751
            $       "OCT"                        * C5756
            BINT8                                * C5766
          ;                                      * C576B
          ::                                     * C5770
            EvalNextChkPRG                       * C5775
            xOCT                                 * C577A
          ;                                      * C577F
        }                                        * C5784

* ROMPTR 0A8 011
* refs (1): C5332
ROMP_0A8_011:
        {                                        * C5789
          ::                                     * C578E
            PTR     BBox/StdLbl:                 * C5793
            $       "BIN"                        * C5798
            BINT2                                * C57A8
          ;                                      * C57AD
          ::                                     * C57B2
            EvalNextChkPRG                       * C57B7
            xBIN                                 * C57BC
          ;                                      * C57C1
        }                                        * C57C6

* ROMPTR 0A8 012
* refs (1): C5332
ROMP_0A8_012:
        {                                        * C57CB
          ::                                     * C57D0
            PTR     DirLabel:                    * C57D5
            $       "LOGIC"                      * C57DA
          ;                                      * C57EE
          ::                                     * C57F3
            MenuMaker                            * C57F8
            ROMPTR  0A9 010                      * C57FD
            OBJ_40184                            * C5808
          ;                                      * C580D
        }                                        * C5812

* ROMPTR 0A8 013
* refs (1): C5332
ROMP_0A8_013:
        {                                        * C5817
          ::                                     * C581C
            PTR     DirLabel:                    * C5821
            $       "BIT"                        * C5826
          ;                                      * C5836
          ::                                     * C583B
            MenuMaker                            * C5840
            ROMPTR  0A9 011                      * C5845
            OBJ_40184                            * C5850
          ;                                      * C5855
        }                                        * C585A

* ROMPTR 0A8 014
* refs (1): C5332
ROMP_0A8_014:
        {                                        * C585F
          ::                                     * C5864
            PTR     DirLabel:                    * C5869
            $       "BYTE"                       * C586E
          ;                                      * C5880
          ::                                     * C5885
            MenuMaker                            * C588A
            ROMPTR  0A9 012                      * C588F
            OBJ_40184                            * C589A
          ;                                      * C589F
        }                                        * C58A4

* ROMPTR 0A8 015
* refs (1): C5332
ROMP_0A8_015:
        {                                        * C58A9
          ::                                     * C58AE
            PTR     DirLabel:                    * C58B3
            $       "BASE"                       * C58B8
          ;                                      * C58CA
          ::                                     * C58CF
            MenuMaker                            * C58D4
            ROMPTR  0A9 00F                      * C58D9
            NoExitAction                         * C58E4
            BINT7                                * C58E9
            DoMenuPos(li,s)                      * C58EE
            SetDA12NoCh                          * C58F3
          ;                                      * C58F8
        }                                        * C58FD

* ROMPTR 0A8 016
* refs (1): C5332
ROMP_0A8_016:
        {                                        * C5902
          ::                                     * C5907
            PTR     DirLabel:                    * C590C
            $       "IF"                         * C5911
          ;                                      * C591F
          {                                      * C5924
            ::                                   * C5929
              MenuMaker                          * C592E
              ROMPTR  0A9 018                    * C5933
              OBJ_40184                          * C593E
            ;                                    * C5943
            ::                                   * C5948
              3NextInCmdLine                     * C594D
              xIFEND                             * C5952
              xTHEN                              * C5957
              xIF                                * C595C
            ;                                    * C5961
            ::                                   * C5966
              4NextInCmdLine                     * C596B
              xIFEND                             * C5970
              xELSE                              * C5975
              xTHEN                              * C597A
              xIF                                * C597F
            ;                                    * C5984
          }                                      * C5989
        }                                        * C598E

* ROMPTR 0A8 017
* refs (1): C5332
ROMP_0A8_017:
        {                                        * C5993
          ::                                     * C5998
            PTR     DirLabel:                    * C599D
            $       "CASE"                       * C59A2
          ;                                      * C59B4
          {                                      * C59B9
            ::                                   * C59BE
              MenuMaker                          * C59C3
              ROMPTR  0A9 019                    * C59C8
              OBJ_40184                          * C59D3
            ;                                    * C59D8
            ::                                   * C59DD
              4NextInCmdLine                     * C59E2
              xIFEND                             * C59E7
              xIFEND                             * C59EC
              xTHENCASE                          * C59F1
              xCASE                              * C59F6
            ;                                    * C59FB
            ::                                   * C5A00
              Echo2Macros                        * C5A05
              xIFEND                             * C5A0A
              xTHENCASE                          * C5A0F
            ;                                    * C5A14
          }                                      * C5A19
        }                                        * C5A1E

* ROMPTR 0A8 018
* refs (1): C5332
ROMP_0A8_018:
        {                                        * C5A23
          ::                                     * C5A28
            PTR     DirLabel:                    * C5A2D
            $       "START"                      * C5A32
          ;                                      * C5A46
          {                                      * C5A4B
            ::                                   * C5A50
              MenuMaker                          * C5A55
              ROMPTR  0A9 01A                    * C5A5A
              OBJ_40184                          * C5A65
            ;                                    * C5A6A
            ::                                   * C5A6F
              Echo2Macros                        * C5A74
              xNEXT                              * C5A79
              xSTART                             * C5A7E
            ;                                    * C5A83
            ::                                   * C5A88
              Echo2Macros                        * C5A8D
              xSTEP                              * C5A92
              xSTART                             * C5A97
            ;                                    * C5A9C
          }                                      * C5AA1
        }                                        * C5AA6

* ROMPTR 0A8 019
* refs (1): C5332
ROMP_0A8_019:
        {                                        * C5AAB
          ::                                     * C5AB0
            PTR     DirLabel:                    * C5AB5
            $       "FOR"                        * C5ABA
          ;                                      * C5ACA
          {                                      * C5ACF
            ::                                   * C5AD4
              MenuMaker                          * C5AD9
              ROMPTR  0A9 01B                    * C5ADE
              OBJ_40184                          * C5AE9
            ;                                    * C5AEE
            ::                                   * C5AF3
              Echo2Macros                        * C5AF8
              xNEXT                              * C5AFD
              xSTARTVAR                          * C5B02
            ;                                    * C5B07
            ::                                   * C5B0C
              Echo2Macros                        * C5B11
              xSTEP                              * C5B16
              xSTARTVAR                          * C5B1B
            ;                                    * C5B20
          }                                      * C5B25
        }                                        * C5B2A

* ROMPTR 0A8 01A
* refs (1): C5332
ROMP_0A8_01A:
        {                                        * C5B2F
          ::                                     * C5B34
            PTR     DirLabel:                    * C5B39
            $       "DO"                         * C5B3E
          ;                                      * C5B4C
          {                                      * C5B51
            ::                                   * C5B56
              MenuMaker                          * C5B5B
              ROMPTR  0A9 01D                    * C5B60
              OBJ_40184                          * C5B6B
            ;                                    * C5B70
            ::                                   * C5B75
              3NextInCmdLine                     * C5B7A
              xENDDO                             * C5B7F
              xUNTIL                             * C5B84
              xDO                                * C5B89
            ;                                    * C5B8E
          }                                      * C5B93
        }                                        * C5B98

* ROMPTR 0A8 01B
* refs (1): C5332
ROMP_0A8_01B:
        {                                        * C5B9D
          ::                                     * C5BA2
            PTR     DirLabel:                    * C5BA7
            $       "WHILE"                      * C5BAC
          ;                                      * C5BC0
          {                                      * C5BC5
            ::                                   * C5BCA
              MenuMaker                          * C5BCF
              ROMPTR  0A9 01F                    * C5BD4
              OBJ_40184                          * C5BDF
            ;                                    * C5BE4
            ::                                   * C5BE9
              3NextInCmdLine                     * C5BEE
              xWHILEEND                          * C5BF3
              xREPEAT                            * C5BF8
              xWHILE                             * C5BFD
            ;                                    * C5C02
          }                                      * C5C07
        }                                        * C5C0C

* ROMPTR 0A8 01C
* refs (1): C5332
ROMP_0A8_01C:
        {                                        * C5C11
          ::                                     * C5C16
            PTR     DirLabel:                    * C5C1B
            $       "BRCH"                       * C5C20
          ;                                      * C5C32
          ::                                     * C5C37
            MenuMaker                            * C5C3C
            ROMPTR  0A9 017                      * C5C41
            OBJ_40184                            * C5C4C
          ;                                      * C5C51
        }                                        * C5C56

* ROMPTR 0A8 01D
* refs (1): C5332
ROMP_0A8_01D:
        {                                        * C5C5B
          ::                                     * C5C60
            PTR     DirLabel:                    * C5C65
            $       "ELEM"                       * C5C6A
          ;                                      * C5C7C
          ::                                     * C5C81
            MenuMaker                            * C5C86
            ROMPTR  0A9 023                      * C5C8B
            OBJ_40184                            * C5C96
          ;                                      * C5C9B
        }                                        * C5CA0

* ROMPTR 0A8 01E
* refs (1): C5332
ROMP_0A8_01E:
        {                                        * C5CA5
          ::                                     * C5CAA
            PTR     DirLabel:                    * C5CAF
            $       "PROC"                       * C5CB4
          ;                                      * C5CC6
          ::                                     * C5CCB
            MenuMaker                            * C5CD0
            ROMPTR  0A9 024                      * C5CD5
            OBJ_40184                            * C5CE0
          ;                                      * C5CE5
        }                                        * C5CEA

* ROMPTR 0A8 01F
* refs (1): C5332
ROMP_0A8_01F:
        {                                        * C5CEF
          ::                                     * C5CF4
            PTR     DirLabel:                    * C5CF9
            $       "LIST"                       * C5CFE
          ;                                      * C5D10
          ::                                     * C5D15
            MenuMaker                            * C5D1A
            ROMPTR  0A9 022                      * C5D1F
            OBJ_40184                            * C5D2A
          ;                                      * C5D2F
        }                                        * C5D34

* ROMPTR 0A8 020
* refs (1): C5332
ROMP_0A8_020:
        {                                        * C5D39
          $       "DBUG"                         * C5D3E
          xDBUG                                  * C5D50
        }                                        * C5D55

* ROMPTR 0A8 021
* refs (1): C5332
ROMP_0A8_021:
        {                                        * C5D5A
          $       "SST"                          * C5D5F
          sst                                    * C5D6F
        }                                        * C5D74

* ROMPTR 0A8 022
* refs (1): C5332
ROMP_0A8_022:
        {                                        * C5D79
          $       "SST↓"                         * C5D7E
          sstdown                                * C5D90
        }                                        * C5D95

* ROMPTR 0A8 023
* refs (1): C5332
ROMP_0A8_023:
        {                                        * C5D9A
          $       "NEXT"                         * C5D9F
          next                                   * C5DB1
        }                                        * C5DB6

* ROMPTR 0A8 024
* refs (1): C5332
ROMP_0A8_024:
        {                                        * C5DBB
          ::                                     * C5DC0
            PTR     DirLabel:                    * C5DC5
            $       "IFERR"                      * C5DCA
          ;                                      * C5DDE
          {                                      * C5DE3
            ::                                   * C5DE8
              MenuMaker                          * C5DED
              ROMPTR  0A9 03C                    * C5DF2
              OBJ_40184                          * C5DFD
            ;                                    * C5E02
            ::                                   * C5E07
              3NextInCmdLine                     * C5E0C
              xIFEND                             * C5E11
              xERRTHEN                           * C5E16
              xIFERR                             * C5E1B
            ;                                    * C5E20
            ::                                   * C5E25
              4NextInCmdLine                     * C5E2A
              xIFEND                             * C5E2F
              xELSE                              * C5E34
              xERRTHEN                           * C5E39
              xIFERR                             * C5E3E
            ;                                    * C5E43
          }                                      * C5E48
        }                                        * C5E4D

* ROMPTR 0A8 025
* refs (1): C5332
ROMP_0A8_025:
        {                                        * C5E52
          ::                                     * C5E57
            PTR     DirLabel:                    * C5E5C
            $       "ERROR"                      * C5E61
          ;                                      * C5E75
          ::                                     * C5E7A
            MenuMaker                            * C5E7F
            ROMPTR  0A9 03D                      * C5E84
            OBJ_40184                            * C5E8F
          ;                                      * C5E94
        }                                        * C5E99

* ROMPTR 0A8 026
* refs (1): C5332
ROMP_0A8_026:
        {                                        * C5E9E
          ::                                     * C5EA3
            PTR     DirLabel:                    * C5EA8
            $       "FMT"                        * C5EAD
          ;                                      * C5EBD
          ::                                     * C5EC2
            MenuMaker                            * C5EC7
            ROMPTR  0A9 040                      * C5ECC
            OBJ_40184                            * C5ED7
          ;                                      * C5EDC
        }                                        * C5EE1

* ROMPTR 0A8 027
* refs (1): C5332
ROMP_0A8_027:
        {                                        * C5EE6
          ::                                     * C5EEB
            PTR     DirLabel:                    * C5EF0
            $       "ANGLE"                      * C5EF5
          ;                                      * C5F09
          ::                                     * C5F0E
            MenuMaker                            * C5F13
            ROMPTR  0A9 041                      * C5F18
            OBJ_40184                            * C5F23
          ;                                      * C5F28
        }                                        * C5F2D

* ROMPTR 0A8 028
* refs (1): C5332
ROMP_0A8_028:
        {                                        * C5F32
          ::                                     * C5F37
            PTR     DirLabel:                    * C5F3C
            $       "FLAG"                       * C5F41
          ;                                      * C5F53
          ::                                     * C5F58
            MenuMaker                            * C5F5D
            ROMPTR  0A9 042                      * C5F62
            OBJ_40184                            * C5F6D
          ;                                      * C5F72
        }                                        * C5F77

* ROMPTR 0A8 029
* refs (1): C5332
ROMP_0A8_029:
        {                                        * C5F7C
          ::                                     * C5F81
            PTR     DirLabel:                    * C5F86
            $       "KEYS"                       * C5F8B
          ;                                      * C5F9D
          ::                                     * C5FA2
            MenuMaker                            * C5FA7
            ROMPTR  0A9 043                      * C5FAC
            OBJ_40184                            * C5FB7
          ;                                      * C5FBC
        }                                        * C5FC1

* ROMPTR 0A8 02A
* refs (1): C5332
ROMP_0A8_02A:
        {                                        * C5FC6
          ::                                     * C5FCB
            PTR     DirLabel:                    * C5FD0
            $       "MENU"                       * C5FD5
          ;                                      * C5FE7
          ::                                     * C5FEC
            MenuMaker                            * C5FF1
            ROMPTR  0A9 044                      * C5FF6
            OBJ_40184                            * C6001
          ;                                      * C6006
        }                                        * C600B

* ROMPTR 0A8 02B
* refs (1): C5332
ROMP_0A8_02B:
        {                                        * C6010
          ::                                     * C6015
            PTR     DirLabel:                    * C601A
            $       "MISC"                       * C601F
          ;                                      * C6031
          ::                                     * C6036
            MenuMaker                            * C603B
            ROMPTR  0A9 045                      * C6040
            OBJ_40184                            * C604B
          ;                                      * C6050
        }                                        * C6055

* ROMPTR 0A8 02C
* refs (1): C5332
ROMP_0A8_02C:
        {                                        * C605A
          ::                                     * C605F
            PTR     DirLabel:                    * C6064
            $       "MODES"                      * C6069
          ;                                      * C607D
          ::                                     * C6082
            MenuMaker                            * C6087
            ROMPTR  0A9 03F                      * C608C
            OBJ_40184                            * C6097
          ;                                      * C609C
        }                                        * C60A1

* ROMPTR 0A8 02D
* refs (1): C5332
ROMP_0A8_02D:
        {                                        * C60A6
          ::                                     * C60AB
            PTR     MBox/StdLbl:                 * C60B0
            $       "STD"                        * C60B5
            BINT0                                * C60C5
          ;                                      * C60CA
          ::                                     * C60CF
            EvalNextChkPRG                       * C60D4
            xSTD                                 * C60D9
          ;                                      * C60DE
        }                                        * C60E3

* ROMPTR 0A8 02E
* refs (1): C5332
ROMP_0A8_02E:
        {                                        * C60E8
          ::                                     * C60ED
            PTR     MBox/StdLbl:                 * C60F2
            $       "FIX"                        * C60F7
            BINT1                                * C6107
          ;                                      * C610C
          xFIX                                   * C6111
        }                                        * C6116

* ROMPTR 0A8 02F
* refs (1): C5332
ROMP_0A8_02F:
        {                                        * C611B
          ::                                     * C6120
            PTR     MBox/StdLbl:                 * C6125
            $       "SCI"                        * C612A
            BINT2                                * C613A
          ;                                      * C613F
          xSCI                                   * C6144
        }                                        * C6149

* ROMPTR 0A8 030
* refs (1): C5332
ROMP_0A8_030:
        {                                        * C614E
          ::                                     * C6153
            PTR     MBox/StdLbl:                 * C6158
            $       "ENG"                        * C615D
            BINT3                                * C616D
          ;                                      * C6172
          xENG                                   * C6177
        }                                        * C617C

* ROMPTR 0A8 031
* refs (1): C5332
ROMP_0A8_031:
        {                                        * C6181
          ::                                     * C6186
            PTR     FBox/StdLbl:                 * C618B
            $       "FM,"                        * C6190
            BINT51                               * C61A0
          ;                                      * C61A5
          BINT51                                 * C61AA
        }                                        * C61AF

* ROMPTR 0A8 032
* refs (1): C5332
ROMP_0A8_032:
        {                                        * C61B4
          ::                                     * C61B9
            PTR     FStd/BoxLbl:                 * C61BE
            $       "ML"                         * C61C3
            BINT52                               * C61D1
          ;                                      * C61D6
          BINT52                                 * C61DB
        }                                        * C61E0

* ROMPTR 0A8 033
* refs (1): C5332
ROMP_0A8_033:
        {                                        * C61E5
          ::                                     * C61EA
            PTR     Box/StdLbl:                  * C61EF
            $       "DEG"                        * C61F4
            DEG?                                 * C6204
          ;                                      * C6209
          ::                                     * C620E
            EvalNextChkPRG                       * C6213
            xDEG                                 * C6218
          ;                                      * C621D
        }                                        * C6222

* ROMPTR 0A8 034
* refs (1): C5332
ROMP_0A8_034:
        {                                        * C6227
          ::                                     * C622C
            PTR     Box/StdLbl:                  * C6231
            $_RAD                                * C6236
            RAD?                                 * C623B
          ;                                      * C6240
          ::                                     * C6245
            EvalNextChkPRG                       * C624A
            xRAD                                 * C624F
          ;                                      * C6254
        }                                        * C6259

* ROMPTR 0A8 035
* refs (1): C5332
ROMP_0A8_035:
        {                                        * C625E
          ::                                     * C6263
            TakeOver                             * C6268
            $_GRAD                               * C626D
            rad?;fs?(-18)?                       * C6272
            NOT                                  * C6277
            ORNOT                                * C627C
            Box/StdLabel                         * C6281
          ;                                      * C6286
          ::                                     * C628B
            EvalNextChkPRG                       * C6290
            xGRAD                                * C6295
          ;                                      * C629A
        }                                        * C629F

* ROMPTR 0A8 036
* refs (1): C5332
ROMP_0A8_036:
        {                                        * C62A4
          $       "RESET"                        * C62A9
          ::                                     * C62BD
            TakeOver                             * C62C2
            OBJ_3AA50                            * C62C7
          ;                                      * C62CC
        }                                        * C62D1

* ROMPTR 0A8 037
* refs (1): C5332
ROMP_0A8_037:
        ID      CST                              * C62D6

* ROMPTR 0A8 038
* refs (1): C5332
ROMP_0A8_038:
        {                                        * C62E3
          ::                                     * C62E8
            PTR     FStd/BoxLbl:                 * C62ED
            $       "BEEP"                       * C62F2
            BINT56                               * C6304
          ;                                      * C6309
          BINT56                                 * C630E
        }                                        * C6313

* ROMPTR 0A8 039
* refs (1): C5332
ROMP_0A8_039:
        {                                        * C6318
          ::                                     * C631D
            PTR     FBox/StdLbl:                 * C6322
            $       "CLK"                        * C6327
            BINT40                               * C6337
          ;                                      * C633C
          BINT40                                 * C6341
        }                                        * C6346

* ROMPTR 0A8 03A
* refs (1): C5332
ROMP_0A8_03A:
        {                                        * C634B
          ::                                     * C6350
            PTR     FStd/BoxLbl:                 * C6355
            $       "SYM"                        * C635A
            BINT3                                * C636A
          ;                                      * C636F
          BINT3                                  * C6374
        }                                        * C6379

* ROMPTR 0A8 03B
* refs (1): C5332
ROMP_0A8_03B:
        {                                        * C637E
          ::                                     * C6383
            PTR     Box/StdLbl:                  * C6388
            $       "STK"                        * C638D
            UNDO_ON?                             * C639D
          ;                                      * C63A2
          ::                                     * C63A7
            TakeOver                             * C63AC
            SuspendOK?                           * C63B1
            NOTcase                              * C63B6
            DoBadKey                             * C63BB
            UNDO_ON?                             * C63C0
            case                                 * C63C5
            ::                                   * C63CA
              ABND                               * C63CF
              ERRSET                             * C63D4
              UNDO_OFF                           * C63D9
            ;                                    * C63DE
            UNDO_ON                              * C63E3
            SAVESTACK                            * C63E8
            ERRSET                               * C63ED
          ;                                      * C63F2
        }                                        * C63F7

* ROMPTR 0A8 03C
* refs (1): C5332
ROMP_0A8_03C:
        {                                        * C63FC
          ::                                     * C6401
            PTR     FStd/BoxLbl:                 * C6406
            $       "ARG"                        * C640B
            BINT55                               * C641B
          ;                                      * C6420
          BINT55                                 * C6425
        }                                        * C642A

* ROMPTR 0A8 03D
* refs (1): C5332
ROMP_0A8_03D:
        {                                        * C642F
          ::                                     * C6434
            PTR     Box/StdLbl:                  * C6439
            $       "CMD"                        * C643E
            HISTON?                              * C644E
          ;                                      * C6453
          ::                                     * C6458
            TakeOver                             * C645D
            HISTON?                              * C6462
            case                                 * C6467
            DisLastCmd!                          * C646C
            UnableLastCmd                        * C6471
          ;                                      * C6476
        }                                        * C647B

* ROMPTR 0A8 03E
* refs (1): C5332
ROMP_0A8_03E:
        {                                        * C6480
          ::                                     * C6485
            PTR     FStd/BoxLbl:                 * C648A
            $       "INFO?"                      * C648F
            BINT58                               * C64A3
          ;                                      * C64A8
          BINT58                                 * C64AD
        }                                        * C64B2

* ROMPTR 0A8 03F
* refs (1): C5332
ROMP_0A8_03F:
        {                                        * C64B7
          ::                                     * C64BC
            PTR     DirLabel:                    * C64C1
            $       "DIR"                        * C64C6
          ;                                      * C64D6
          ::                                     * C64DB
            MenuMaker                            * C64E0
            ROMPTR  0A9 047                      * C64E5
            OBJ_40184                            * C64F0
          ;                                      * C64F5
        }                                        * C64FA

* ROMPTR 0A8 040
* refs (1): C5332
ROMP_0A8_040:
        {                                        * C64FF
          ::                                     * C6504
            PTR     DirLabel:                    * C6509
            $       "ARITH"                      * C650E
          ;                                      * C6522
          ::                                     * C6527
            MenuMaker                            * C652C
            ROMPTR  0A9 048                      * C6531
            OBJ_40184                            * C653C
          ;                                      * C6541
        }                                        * C6546

* ROMPTR 0A8 041
* refs (1): C5332
ROMP_0A8_041:
        {                                        * C654B
          ::                                     * C6550
            PTR     DirLabel:                    * C6555
            $       "MEM"                        * C655A
          ;                                      * C656A
          ::                                     * C656F
            MenuMaker                            * C6574
            ROMPTR  0A9 046                      * C6579
            OBJ_40184                            * C6584
          ;                                      * C6589
        }                                        * C658E

* ROMPTR 0A8 042
* refs (1): C5332
ROMP_0A8_042:
        {                                        * C6593
          $       "DRPN"                         * C6598
          xDROPN                                 * C65AA
        }                                        * C65AF

* ROMPTR 0A8 043
* refs (1): C5332
ROMP_0A8_043:
        {                                        * C65B4
          ::                                     * C65B9
            PTR     DirLabel:                    * C65BE
            $       "SOLVE"                      * C65C3
          ;                                      * C65D7
          ::                                     * C65DC
            MenuMaker                            * C65E1
            ROMPTR  0A9 04A                      * C65E6
            OBJ_40184                            * C65F1
          ;                                      * C65F6
        }                                        * C65FB

* ROMPTR 0A8 044
* refs (1): C5332
ROMP_0A8_044:
        {                                        * C6600
          ::                                     * C6605
            PTR     DirLabel:                    * C660A
            $       "SOLVR"                      * C660F
          ;                                      * C6623
          ::                                     * C6628
            MenuMaker                            * C662D
            ROMPTR  0A9 01E                      * C6632
            OBJ_40184                            * C663D
          ;                                      * C6642
        }                                        * C6647

* ROMPTR 0A8 045
* refs (1): C5332
ROMP_0A8_045:
        {                                        * C664C
          ::                                     * C6651
            PTR     DirLabel:                    * C6656
            $       "SOLVR"                      * C665B
          ;                                      * C666F
          ::                                     * C6674
            MenuMaker                            * C6679
            ROMPTR  0A9 050                      * C667E
            OBJ_40184                            * C6689
          ;                                      * C668E
        }                                        * C6693

* ROMPTR 0A8 046
* refs (1): C5332
ROMP_0A8_046:
        {                                        * C6698
          $       "AMRT"                         * C669D
          ::                                     * C66AF
            PTR     Do1st/2nd+:                  * C66B4
            ROMPTR  0AB 059                      * C66B9  AMORT
            ROMPTR  0E6 003                      * C66C4
          ;                                      * C66CF
        }                                        * C66D4

* ROMPTR 0A8 047
* refs (1): C5332
ROMP_0A8_047:
        {                                        * C66D9
          PYR                                    * C66DE
          {                                      * C66E3
            ::                                   * C66E8
              '                                  * C66ED
              PYR                                * C66F2
              DoMenuKeyNS                        * C66F7
            ;                                    * C66FC
            DoBadKey                             * C6701
            ::                                   * C6706
              '                                  * C670B
              PYR                                * C6710
              OBJ_41974                          * C6715
            ;                                    * C671A
          }                                      * C671F
        }                                        * C6724

* ROMPTR 0A8 048
* refs (1): C5332
ROMP_0A8_048:
        {                                        * C6729
          ::                                     * C672E
            PTR     FBox/StdLbl:                 * C6733
            $       "BEG"                        * C6738
            BINT14                               * C6748
          ;                                      * C674D
          BINT14                                 * C6752
        }                                        * C6757

* ROMPTR 0A8 049
* refs (1): C5332
ROMP_0A8_049:
        {                                        * C675C
          ::                                     * C6761
            PTR     DirLabel:                    * C6766
            $       "PTYPE"                      * C676B
          ;                                      * C677F
          ::                                     * C6784
            MenuMaker                            * C6789
            ROMPTR  0A9 052                      * C678E
            OBJ_40184                            * C6799
          ;                                      * C679E
        }                                        * C67A3

* ROMPTR 0A8 04A
* refs (1): C5332
ROMP_0A8_04A:
        {                                        * C67A8
          ::                                     * C67AD
            PTR     DirLabel:                    * C67B2
            $       "PPAR"                       * C67B7
          ;                                      * C67C9
          ::                                     * C67CE
            MenuMaker                            * C67D3
            ROMPTR  0A9 053                      * C67D8
            OBJ_40184                            * C67E3
          ;                                      * C67E8
        }                                        * C67ED

* ROMPTR 0A8 04B
* refs (1): C5332
ROMP_0A8_04B:
        {                                        * C67F2
          xDRAW                                  * C67F7
          ::                                     * C67FC
            PTR     Do1st/1st+:                  * C6801
            xDRAW                                * C6806
            xGRAPH                               * C680B
          ;                                      * C6810
        }                                        * C6815

* ROMPTR 0A8 04C
* refs (1): C5332
ROMP_0A8_04C:
        {                                        * C681A
          ::                                     * C681F
            PTR     DirLabel:                    * C6824
            $       "3D"                         * C6829
          ;                                      * C6837
          ::                                     * C683C
            MenuMaker                            * C6841
            ROMPTR  0A9 054                      * C6846
            OBJ_40184                            * C6851
          ;                                      * C6856
        }                                        * C685B

* ROMPTR 0A8 04D
* refs (1): C5332
ROMP_0A8_04D:
        {                                        * C6860
          ::                                     * C6865
            PTR     DirLabel:                    * C686A
            $       "STAT"                       * C686F
          ;                                      * C6881
          ::                                     * C6886
            MenuMaker                            * C688B
            ROMPTR  0A9 057                      * C6890
            OBJ_40184                            * C689B
          ;                                      * C68A0
        }                                        * C68A5

* ROMPTR 0A8 04E
* refs (1): C5332
ROMP_0A8_04E:
        {                                        * C68AA
          ::                                     * C68AF
            PTR     DirLabel:                    * C68B4
            $       "FLAG"                       * C68B9
          ;                                      * C68CB
          ::                                     * C68D0
            MenuMaker                            * C68D5
            ROMPTR  0A9 05C                      * C68DA
            OBJ_40184                            * C68E5
          ;                                      * C68EA
        }                                        * C68EF

* ROMPTR 0A8 04F
* refs (1): C5332
ROMP_0A8_04F:
        {                                        * C68F4
          ::                                     * C68F9
            PTR     DirLabel:                    * C68FE
            $       "PLOT"                       * C6903
          ;                                      * C6915
          ::                                     * C691A
            MenuMaker                            * C691F
            ROMPTR  0A9 051                      * C6924
            OBJ_40184                            * C692F
          ;                                      * C6934
        }                                        * C6939

* ROMPTR 0A8 050
* refs (1): C5332
ROMP_0A8_050:
        {                                        * C693E
          ::                                     * C6943
            PTR     DirLabel:                    * C6948
            $       "PLOT"                       * C694D
          ;                                      * C695F
          ::                                     * C6964
            MenuMaker                            * C6969
            ROMPTR  0A9 051                      * C696E
            NoExitAction                         * C6979
            BINT7                                * C697E
            DoMenuPos(li,s)                      * C6983
            SetDA12NoCh                          * C6988
          ;                                      * C698D
        }                                        * C6992

* ROMPTR 0A8 051
* refs (1): C5332
ROMP_0A8_051:
        {                                        * C6997
          ::                                     * C699C
            PTR     DirLabel:                    * C69A1
            $       "PLOT"                       * C69A6
          ;                                      * C69B8
          ::                                     * C69BD
            MenuMaker                            * C69C2
            ROMPTR  0A9 051                      * C69C7
            PrgmEntry?                           * C69D2
            NOTcaseDROP                          * C69D7
            OBJ_40184                            * C69DC
          ;                                      * C69E1
        }                                        * C69E6

* ROMPTR 0A8 052
* refs (1): C5332
ROMP_0A8_052:
        {                                        * C69EB
          $       "RESET"                        * C69F0
          OBJ_45EC4                              * C6A04
        }                                        * C6A09

* ROMPTR 0A8 053
* refs (1): C5332
ROMP_0A8_053:
        ID      PPAR                             * C6A0E

* ROMPTR 0A8 054
* refs (1): C5332
ROMP_0A8_054:
        {                                        * C6A1D
          ::                                     * C6A22
            PTR     DirLabel:                    * C6A27
            $       "PTYPE"                      * C6A2C
          ;                                      * C6A40
          ::                                     * C6A45
            MenuMaker                            * C6A4A
            ROMPTR  0A9 055                      * C6A4F
            OBJ_40184                            * C6A5A
          ;                                      * C6A5F
        }                                        * C6A64

* ROMPTR 0A8 055
* refs (1): C5332
ROMP_0A8_055:
        {                                        * C6A69
          ::                                     * C6A6E
            PTR     DirLabel:                    * C6A73
            $       "VPAR"                       * C6A78
          ;                                      * C6A8A
          ::                                     * C6A8F
            MenuMaker                            * C6A94
            ROMPTR  0A9 056                      * C6A99
            OBJ_40184                            * C6AA4
          ;                                      * C6AA9
        }                                        * C6AAE

* ROMPTR 0A8 056
* refs (1): C5332
ROMP_0A8_056:
        {                                        * C6AB3
          ::                                     * C6AB8
            PTR     DirLabel:                    * C6ABD
            $       "3D"                         * C6AC2
          ;                                      * C6AD0
          ::                                     * C6AD5
            MenuMaker                            * C6ADA
            ROMPTR  0A9 054                      * C6ADF
            PrgmEntry?                           * C6AEA
            NOTcaseDROP                          * C6AEF
            OBJ_40184                            * C6AF4
          ;                                      * C6AF9
        }                                        * C6AFE

* ROMPTR 0A8 057
* refs (1): C5332
ROMP_0A8_057:
        ID      VPAR                             * C6B03

* ROMPTR 0A8 058
* refs (1): C5332
ROMP_0A8_058:
        {                                        * C6B12
          $       "RESET"                        * C6B17
          ::                                     * C6B2B
            TakeOver                             * C6B30
            ROMPTR  0B5 08E                      * C6B35
            ROMPTR  0B5 091                      * C6B40
          ;                                      * C6B4B
        }                                        * C6B50

* ROMPTR 0A8 059
* refs (1): C5332
ROMP_0A8_059:
        {                                        * C6B55
          ::                                     * C6B5A
            PTR     DirLabel:                    * C6B5F
            $       "PTYPE"                      * C6B64
          ;                                      * C6B78
          ::                                     * C6B7D
            MenuMaker                            * C6B82
            ROMPTR  0A9 058                      * C6B87
            OBJ_40184                            * C6B92
          ;                                      * C6B97
        }                                        * C6B9C

* ROMPTR 0A8 05A
* refs (1): C5332
ROMP_0A8_05A:
        {                                        * C6BA1
          ::                                     * C6BA6
            PTR     DirLabel:                    * C6BAB
            $       "DATA"                       * C6BB0
          ;                                      * C6BC2
          ::                                     * C6BC7
            MenuMaker                            * C6BCC
            ROMPTR  0A9 05B                      * C6BD1
            OBJ_40184                            * C6BDC
          ;                                      * C6BE1
        }                                        * C6BE6

* ROMPTR 0A8 05B
* refs (1): C5332
ROMP_0A8_05B:
        {                                        * C6BEB
          ::                                     * C6BF0
            PTR     DirLabel:                    * C6BF5
            $       "ΣPAR"                       * C6BFA
          ;                                      * C6C0C
          ::                                     * C6C11
            MenuMaker                            * C6C16
            ROMPTR  0A9 059                      * C6C1B
            OBJ_40184                            * C6C26
          ;                                      * C6C2B
        }                                        * C6C30

* ROMPTR 0A8 05C
* refs (1): C5332
ROMP_0A8_05C:
        {                                        * C6C35
          ::                                     * C6C3A
            PTR     DirLabel:                    * C6C3F
            $       "STAT"                       * C6C44
          ;                                      * C6C56
          ::                                     * C6C5B
            MenuMaker                            * C6C60
            ROMPTR  0A9 057                      * C6C65
            PrgmEntry?                           * C6C70
            NOTcaseDROP                          * C6C75
            OBJ_40184                            * C6C7A
          ;                                      * C6C7F
        }                                        * C6C84

* ROMPTR 0A8 05D
* refs (1): C5332
ROMP_0A8_05D:
        {                                        * C6C89
          ::                                     * C6C8E
            PTR     DirLabel:                    * C6C93
            $       "MODL"                       * C6C98
          ;                                      * C6CAA
          ::                                     * C6CAF
            MenuMaker                            * C6CB4
            ROMPTR  0A9 05A                      * C6CB9
            OBJ_40184                            * C6CC4
          ;                                      * C6CC9
        }                                        * C6CCE

* ROMPTR 0A8 05E
* refs (1): C5332
ROMP_0A8_05E:
        {                                        * C6CD3
          $       "RESET"                        * C6CD8
          ::                                     * C6CEC
            TakeOver                             * C6CF1
            {                                    * C6CF6
              %1                                 * C6CFB
              %2                                 * C6D00
              %0_2A2B4                           * C6D05
              %0_2A2B4                           * C6D0A
              xLINFIT                            * C6D0F
            }                                    * C6D14
            '                                    * C6D19
            äPAR                                 * C6D1E
            XEQSTOID                             * C6D23
          ;                                      * C6D28
        }                                        * C6D2D

* ROMPTR 0A8 05F
* refs (1): C5332
ROMP_0A8_05F:
        {                                        * C6D32
          ::                                     * C6D37
            PTR     DirLabel:                    * C6D3C
            $       "ΣPAR"                       * C6D41
          ;                                      * C6D53
          ::                                     * C6D58
            MenuMaker                            * C6D5D
            ROMPTR  0A9 059                      * C6D62
            PrgmEntry?                           * C6D6D
            NOTcaseDROP                          * C6D72
            OBJ_40184                            * C6D77
          ;                                      * C6D7C
        }                                        * C6D81

* ROMPTR 0A8 060
* refs (1): C5332
ROMP_0A8_060:
        {                                        * C6D86
          ::                                     * C6D8B
            PTR     FStd/BoxLbl:                 * C6D90
            $       "AXES"                       * C6D95
            BINT29                               * C6DA7
          ;                                      * C6DAC
          BINT29                                 * C6DB1
        }                                        * C6DB6

* ROMPTR 0A8 061
* refs (1): C5332
ROMP_0A8_061:
        {                                        * C6DBB
          ::                                     * C6DC0
            PTR     FStd/BoxLbl:                 * C6DC5
            $       "CNCT"                       * C6DCA
            BINT31                               * C6DDC
          ;                                      * C6DE1
          BINT31                                 * C6DE6
        }                                        * C6DEB

* ROMPTR 0A8 062
* refs (1): C5332
ROMP_0A8_062:
        {                                        * C6DF0
          ::                                     * C6DF5
            PTR     FBox/StdLbl:                 * C6DFA
            $       "SIMU"                       * C6DFF
            BINT28                               * C6E11
          ;                                      * C6E16
          BINT28                                 * C6E1B
        }                                        * C6E20

* ROMPTR 0A8 063
* refs (1): C5332
ROMP_0A8_063:
        {                                        * C6E25
          ::                                     * C6E2A
            PTR     DirLabel:                    * C6E2F
            $       "ALRM"                       * C6E34
          ;                                      * C6E46
          ::                                     * C6E4B
            MenuMaker                            * C6E50
            ROMPTR  0A9 05F                      * C6E55
            OBJ_40184                            * C6E60
          ;                                      * C6E65
        }                                        * C6E6A

* ROMPTR 0A8 064
* refs (1): C5332
ROMP_0A8_064:
        {                                        * C6E6F
          ::                                     * C6E74
            PTR     DirLabel:                    * C6E79
            $       "TIME"                       * C6E7E
          ;                                      * C6E90
          ::                                     * C6E95
            MenuMaker                            * C6E9A
            ROMPTR  0A9 05E                      * C6E9F
            OBJ_40184                            * C6EAA
          ;                                      * C6EAF
        }                                        * C6EB4

* ROMPTR 0A8 065
* refs (1): C5332
ROMP_0A8_065:
        {                                        * C6EB9
          ::                                     * C6EBE
            PTR     DirLabel:                    * C6EC3
            $       "DATA"                       * C6EC8
          ;                                      * C6EDA
          ::                                     * C6EDF
            MenuMaker                            * C6EE4
            ROMPTR  0A9 061                      * C6EE9
            OBJ_40184                            * C6EF4
          ;                                      * C6EF9
        }                                        * C6EFE

* ROMPTR 0A8 066
* refs (1): C5332
ROMP_0A8_066:
        {                                        * C6F03
          ::                                     * C6F08
            PTR     DirLabel:                    * C6F0D
            $       "ΣPAR"                       * C6F12
          ;                                      * C6F24
          ::                                     * C6F29
            MenuMaker                            * C6F2E
            ROMPTR  0A9 062                      * C6F33
            OBJ_40184                            * C6F3E
          ;                                      * C6F43
        }                                        * C6F48

* ROMPTR 0A8 067
* refs (1): C5332
ROMP_0A8_067:
        {                                        * C6F4D
          ::                                     * C6F52
            PTR     DirLabel:                    * C6F57
            $       "1VAR"                       * C6F5C
          ;                                      * C6F6E
          ::                                     * C6F73
            MenuMaker                            * C6F78
            ROMPTR  0A9 064                      * C6F7D
            OBJ_40184                            * C6F88
          ;                                      * C6F8D
        }                                        * C6F92

* ROMPTR 0A8 068
* refs (1): C5332
ROMP_0A8_068:
        {                                        * C6F97
          ::                                     * C6F9C
            PTR     DirLabel:                    * C6FA1
            $       "PLOT"                       * C6FA6
          ;                                      * C6FB8
          ::                                     * C6FBD
            MenuMaker                            * C6FC2
            ROMPTR  0A9 065                      * C6FC7
            OBJ_40184                            * C6FD2
          ;                                      * C6FD7
        }                                        * C6FDC

* ROMPTR 0A8 069
* refs (1): C5332
ROMP_0A8_069:
        {                                        * C6FE1
          ::                                     * C6FE6
            PTR     DirLabel:                    * C6FEB
            $       "FIT"                        * C6FF0
          ;                                      * C7000
          ::                                     * C7005
            MenuMaker                            * C700A
            ROMPTR  0A9 066                      * C700F
            OBJ_40184                            * C701A
          ;                                      * C701F
        }                                        * C7024

* ROMPTR 0A8 06A
* refs (1): C5332
ROMP_0A8_06A:
        {                                        * C7029
          ::                                     * C702E
            PTR     DirLabel:                    * C7033
            $       "SUMS"                       * C7038
          ;                                      * C704A
          ::                                     * C704F
            MenuMaker                            * C7054
            ROMPTR  0A9 067                      * C7059
            OBJ_40184                            * C7064
          ;                                      * C7069
        }                                        * C706E

* ROMPTR 0A8 06B
* refs (1): C5332
ROMP_0A8_06B:
        {                                        * C7073
          ::                                     * C7078
            PTR     DirLabel:                    * C707D
            $       "STAT"                       * C7082
          ;                                      * C7094
          ::                                     * C7099
            MenuMaker                            * C709E
            ROMPTR  0A9 060                      * C70A3
            OBJ_40184                            * C70AE
          ;                                      * C70B3
        }                                        * C70B8

* ROMPTR 0A8 06C
* refs (1): C5332
ROMP_0A8_06C:
        {                                        * C70BD
          xBARPLOT                               * C70C2
          ::                                     * C70C7
            PTR     Do1st/1st+:                  * C70CC
            xBARPLOT                             * C70D1
            xGRAPH                               * C70D6
          ;                                      * C70DB
        }                                        * C70E0

* ROMPTR 0A8 06D
* refs (1): C5332
ROMP_0A8_06D:
        {                                        * C70E5
          xHISTPLOT                              * C70EA
          ::                                     * C70EF
            PTR     Do1st/1st+:                  * C70F4
            xHISTPLOT                            * C70F9
            xGRAPH                               * C70FE
          ;                                      * C7103
        }                                        * C7108

* ROMPTR 0A8 06E
* refs (1): C5332
ROMP_0A8_06E:
        {                                        * C710D
          xSCATRPLOT                             * C7112
          ::                                     * C7117
            PTR     Do1st/1st+:                  * C711C
            xSCATRPLOT                           * C7121
            xGRAPH                               * C7126
          ;                                      * C712B
        }                                        * C7130

* ROMPTR 0A8 06F
* refs (1): C5332
ROMP_0A8_06F:
        {                                        * C7135
          x>LCD                                  * C713A
          ::                                     * C713F
            PTR     Do1st/1st+:                  * C7144
            x>LCD                                * C7149
            SetDAsTemp                           * C714E
          ;                                      * C7153
        }                                        * C7158

* ROMPTR 0A8 070
* refs (1): C5332
ROMP_0A8_070:
        {                                        * C715D
          xCLLCD                                 * C7162
          ::                                     * C7167
            PTR     Do1st/1st+:                  * C716C
            xCLLCD                               * C7171
            SetDAsTemp                           * C7176
          ;                                      * C717B
        }                                        * C7180

* ROMPTR 0A8 071
* refs (1): C5332
ROMP_0A8_071:
        {                                        * C7185
          ::                                     * C718A
            PTR     DirLabel:                    * C718F
            $       "MODL"                       * C7194
          ;                                      * C71A6
          ::                                     * C71AB
            MenuMaker                            * C71B0
            ROMPTR  0A9 063                      * C71B5
            OBJ_40184                            * C71C0
          ;                                      * C71C5
        }                                        * C71CA

* ROMPTR 0A8 072
* refs (1): C5332
ROMP_0A8_072:
        {                                        * C71CF
          ::                                     * C71D4
            PTR     DirLabel:                    * C71D9
            $       "ΣPAR"                       * C71DE
          ;                                      * C71F0
          ::                                     * C71F5
            MenuMaker                            * C71FA
            ROMPTR  0A9 062                      * C71FF
            PrgmEntry?                           * C720A
            NOTcaseDROP                          * C720F
            OBJ_40184                            * C7214
          ;                                      * C7219
        }                                        * C721E

* ROMPTR 0A8 073
* refs (1): C5332
ROMP_0A8_073:
        {                                        * C7223
          ::                                     * C7228
            PTR     DirLabel:                    * C722D
            $       "SRVR"                       * C7232
          ;                                      * C7244
          ::                                     * C7249
            MenuMaker                            * C724E
            ROMPTR  0A9 069                      * C7253
            OBJ_40184                            * C725E
          ;                                      * C7263
        }                                        * C7268

* ROMPTR 0A8 074
* refs (1): C5332
ROMP_0A8_074:
        {                                        * C726D
          ::                                     * C7272
            PTR     DirLabel:                    * C7277
            $       "IOPAR"                      * C727C
          ;                                      * C7290
          ::                                     * C7295
            MenuMaker                            * C729A
            ROMPTR  0A9 06A                      * C729F
            OBJ_40184                            * C72AA
          ;                                      * C72AF
        }                                        * C72B4

* ROMPTR 0A8 075
* refs (1): C5332
ROMP_0A8_075:
        {                                        * C72B9
          ::                                     * C72BE
            PTR     DirLabel:                    * C72C3
            $       "PRINT"                      * C72C8
          ;                                      * C72DC
          ::                                     * C72E1
            MenuMaker                            * C72E6
            ROMPTR  0A9 06B                      * C72EB
            OBJ_40184                            * C72F6
          ;                                      * C72FB
        }                                        * C7300

* ROMPTR 0A8 076
* refs (1): C5332
ROMP_0A8_076:
        {                                        * C7305
          ::                                     * C730A
            PTR     DirLabel:                    * C730F
            $       "SERIAL"                     * C7314
          ;                                      * C732A
          ::                                     * C732F
            MenuMaker                            * C7334
            ROMPTR  0A9 06D                      * C7339
            OBJ_40184                            * C7344
          ;                                      * C7349
        }                                        * C734E

* ROMPTR 0A8 077
* refs (1): C5332
ROMP_0A8_077:
        {                                        * C7353
          ::                                     * C7358
            PTR     DirLabel:                    * C735D
            $       "I/O"                        * C7362
          ;                                      * C7372
          ::                                     * C7377
            MenuMaker                            * C737C
            ROMPTR  0A9 068                      * C7381
            OBJ_40184                            * C738C
          ;                                      * C7391
        }                                        * C7396

* ROMPTR 0A8 078
* refs (1): C5332
ROMP_0A8_078:
        {                                        * C739B
          ::                                     * C73A0
            PTR     DirLabel:                    * C73A5
            $       "I/O"                        * C73AA
          ;                                      * C73BA
          ::                                     * C73BF
            MenuMaker                            * C73C4
            ROMPTR  0A9 068                      * C73C9
            NoExitAction                         * C73D4
            BINT7                                * C73D9
            DoMenuPos(li,s)                      * C73DE
            SetDA12NoCh                          * C73E3
          ;                                      * C73E8
        }                                        * C73ED

* ROMPTR 0A8 079
* refs (1): C5332
ROMP_0A8_079:
        {                                        * C73F2
          ::                                     * C73F7
            PTR     FBox/StdLbl:                 * C73FC
            $       "IR"                         * C7401
            BINT33                               * C740F
          ;                                      * C7414
          BINT33                                 * C7419
        }                                        * C741E

* ROMPTR 0A8 07A
* refs (1): C5332
ROMP_0A8_07A:
        {                                        * C7423
          ::                                     * C7428
            PTR     FStd/BoxLbl:                 * C742D
            $       "ASCII"                      * C7432
            BINT35                               * C7446
          ;                                      * C744B
          BINT35                                 * C7450
        }                                        * C7455

* ROMPTR 0A8 07B
* refs (1): C5332
ROMP_0A8_07B:
        ID      IOPAR                            * C745A

* ROMPTR 0A8 07C
* refs (1): C5332
ROMP_0A8_07C:
        {                                        * C746B
          $       "RESET"                        * C7470
          ::                                     * C7484
            TakeOver                             * C7489
            StdIOPAR                             * C748E
            StoIOPAR                             * C7493
            SetDA12NoCh                          * C7498
          ;                                      * C749D
        }                                        * C74A2

* ROMPTR 0A8 07D
* refs (1): C5332
ROMP_0A8_07D:
        {                                        * C74A7
          ::                                     * C74AC
            PTR     DirLabel:                    * C74B1
            $       "PRTPAR"                     * C74B6
          ;                                      * C74CC
          ::                                     * C74D1
            MenuMaker                            * C74D6
            ROMPTR  0A9 06C                      * C74DB
            OBJ_40184                            * C74E6
          ;                                      * C74EB
        }                                        * C74F0

* ROMPTR 0A8 07E
* refs (1): C5332
ROMP_0A8_07E:
        ID      PRTPAR                           * C74F5

* ROMPTR 0A8 07F
* refs (1): C5332
ROMP_0A8_07F:
        {                                        * C7508
          $       "RESET"                        * C750D
          ::                                     * C7521
            TakeOver                             * C7526
            StdPRTPAR                            * C752B
            StoPRTPAR                            * C7530
            SetDA12NoCh                          * C7535
          ;                                      * C753A
        }                                        * C753F

* ROMPTR 0A8 080
* refs (1): C5332
ROMP_0A8_080:
        {                                        * C7544
          ::                                     * C7549
            PTR     DirLabel:                    * C754E
            $       "PORTS"                      * C7553
          ;                                      * C7567
          ::                                     * C756C
            MenuMaker                            * C7571
            ROMPTR  0A9 06F                      * C7576
            OBJ_40184                            * C7581
          ;                                      * C7586
        }                                        * C758B

* ROMPTR 0A8 081
* refs (1): C5332
ROMP_0A8_081:
        {                                        * C7590
          ::                                     * C7595
            PTR     DirLabel:                    * C759A
            $       "EQLIB"                      * C759F
          ;                                      * C75B3
          ::                                     * C75B8
            MenuMaker                            * C75BD
            ROMPTR  0A9 071                      * C75C2
            OBJ_40184                            * C75CD
          ;                                      * C75D2
        }                                        * C75D7

LIB0A8.hash:
        CON(5)  DOHSTR                           * C75DC  hash table of library 0A8
        LENGTH                                   * C75E1  length, to #C7640
        CON(5)  0                                * C75E6  names of length 1
        CON(5)  0                                * C75EB  names of length 2
        CON(5)  0                                * C75F0  names of length 3
        CON(5)  0                                * C75F5  names of length 4
        CON(5)  0                                * C75FA  names of length 5
        CON(5)  0                                * C75FF  names of length 6
        CON(5)  0                                * C7604  names of length 7
        CON(5)  0                                * C7609  names of length 8
        CON(5)  0                                * C760E  names of length 9
        CON(5)  0                                * C7613  names of length 10
        CON(5)  0                                * C7618  names of length 11
        CON(5)  0                                * C761D  names of length 12
        CON(5)  0                                * C7622  names of length 13
        CON(5)  0                                * C7627  names of length 14
        CON(5)  0                                * C762C  names of length 15
        CON(5)  0                                * C7631  names of length 16
        REL(5)  L_C763B                          * C7636  end of the names
L_C763B:
        CON(5)  0                                * C763B  command 000 has no name
        ENDLENGTH                                * C7640

LIB0A8.link:
        CON(5)  DOHSTR                           * C7640  link table of library 0A8
        LENGTH                                   * C7645  length, to #C78D4
        REL(5)  ROMP_0A8_000                     * C764A  000 
        REL(5)  ROMP_0A8_001                     * C764F  001 
        REL(5)  ROMP_0A8_002                     * C7654  002 
        REL(5)  ROMP_0A8_003                     * C7659  003 
        REL(5)  ROMP_0A8_004                     * C765E  004 
        REL(5)  ROMP_0A8_005                     * C7663  005 
        REL(5)  ROMP_0A8_006                     * C7668  006 
        REL(5)  ROMP_0A8_007                     * C766D  007 
        REL(5)  ROMP_0A8_008                     * C7672  008 
        REL(5)  ROMP_0A8_009                     * C7677  009 
        REL(5)  ROMP_0A8_00A                     * C767C  00A 
        REL(5)  ROMP_0A8_00B                     * C7681  00B 
        REL(5)  ROMP_0A8_00C                     * C7686  00C 
        REL(5)  ROMP_0A8_00D                     * C768B  00D 
        REL(5)  ROMP_0A8_00E                     * C7690  00E 
        REL(5)  ROMP_0A8_00F                     * C7695  00F 
        REL(5)  ROMP_0A8_010                     * C769A  010 
        REL(5)  ROMP_0A8_011                     * C769F  011 
        REL(5)  ROMP_0A8_012                     * C76A4  012 
        REL(5)  ROMP_0A8_013                     * C76A9  013 
        REL(5)  ROMP_0A8_014                     * C76AE  014 
        REL(5)  ROMP_0A8_015                     * C76B3  015 
        REL(5)  ROMP_0A8_016                     * C76B8  016 
        REL(5)  ROMP_0A8_017                     * C76BD  017 
        REL(5)  ROMP_0A8_018                     * C76C2  018 
        REL(5)  ROMP_0A8_019                     * C76C7  019 
        REL(5)  ROMP_0A8_01A                     * C76CC  01A 
        REL(5)  ROMP_0A8_01B                     * C76D1  01B 
        REL(5)  ROMP_0A8_01C                     * C76D6  01C 
        REL(5)  ROMP_0A8_01D                     * C76DB  01D 
        REL(5)  ROMP_0A8_01E                     * C76E0  01E 
        REL(5)  ROMP_0A8_01F                     * C76E5  01F 
        REL(5)  ROMP_0A8_020                     * C76EA  020 
        REL(5)  ROMP_0A8_021                     * C76EF  021 
        REL(5)  ROMP_0A8_022                     * C76F4  022 
        REL(5)  ROMP_0A8_023                     * C76F9  023 
        REL(5)  ROMP_0A8_024                     * C76FE  024 
        REL(5)  ROMP_0A8_025                     * C7703  025 
        REL(5)  ROMP_0A8_026                     * C7708  026 
        REL(5)  ROMP_0A8_027                     * C770D  027 
        REL(5)  ROMP_0A8_028                     * C7712  028 
        REL(5)  ROMP_0A8_029                     * C7717  029 
        REL(5)  ROMP_0A8_02A                     * C771C  02A 
        REL(5)  ROMP_0A8_02B                     * C7721  02B 
        REL(5)  ROMP_0A8_02C                     * C7726  02C 
        REL(5)  ROMP_0A8_02D                     * C772B  02D 
        REL(5)  ROMP_0A8_02E                     * C7730  02E 
        REL(5)  ROMP_0A8_02F                     * C7735  02F 
        REL(5)  ROMP_0A8_030                     * C773A  030 
        REL(5)  ROMP_0A8_031                     * C773F  031 
        REL(5)  ROMP_0A8_032                     * C7744  032 
        REL(5)  ROMP_0A8_033                     * C7749  033 
        REL(5)  ROMP_0A8_034                     * C774E  034 
        REL(5)  ROMP_0A8_035                     * C7753  035 
        REL(5)  ROMP_0A8_036                     * C7758  036 
        REL(5)  ROMP_0A8_037                     * C775D  037 
        REL(5)  ROMP_0A8_038                     * C7762  038 
        REL(5)  ROMP_0A8_039                     * C7767  039 
        REL(5)  ROMP_0A8_03A                     * C776C  03A 
        REL(5)  ROMP_0A8_03B                     * C7771  03B 
        REL(5)  ROMP_0A8_03C                     * C7776  03C 
        REL(5)  ROMP_0A8_03D                     * C777B  03D 
        REL(5)  ROMP_0A8_03E                     * C7780  03E 
        REL(5)  ROMP_0A8_03F                     * C7785  03F 
        REL(5)  ROMP_0A8_040                     * C778A  040 
        REL(5)  ROMP_0A8_041                     * C778F  041 
        REL(5)  ROMP_0A8_042                     * C7794  042 
        REL(5)  ROMP_0A8_043                     * C7799  043 
        REL(5)  ROMP_0A8_044                     * C779E  044 
        REL(5)  ROMP_0A8_045                     * C77A3  045 
        REL(5)  ROMP_0A8_046                     * C77A8  046 
        REL(5)  ROMP_0A8_047                     * C77AD  047 
        REL(5)  ROMP_0A8_048                     * C77B2  048 
        REL(5)  ROMP_0A8_049                     * C77B7  049 
        REL(5)  ROMP_0A8_04A                     * C77BC  04A 
        REL(5)  ROMP_0A8_04B                     * C77C1  04B 
        REL(5)  ROMP_0A8_04C                     * C77C6  04C 
        REL(5)  ROMP_0A8_04D                     * C77CB  04D 
        REL(5)  ROMP_0A8_04E                     * C77D0  04E 
        REL(5)  ROMP_0A8_04F                     * C77D5  04F 
        REL(5)  ROMP_0A8_050                     * C77DA  050 
        REL(5)  ROMP_0A8_051                     * C77DF  051 
        REL(5)  ROMP_0A8_052                     * C77E4  052 
        REL(5)  ROMP_0A8_053                     * C77E9  053 
        REL(5)  ROMP_0A8_054                     * C77EE  054 
        REL(5)  ROMP_0A8_055                     * C77F3  055 
        REL(5)  ROMP_0A8_056                     * C77F8  056 
        REL(5)  ROMP_0A8_057                     * C77FD  057 
        REL(5)  ROMP_0A8_058                     * C7802  058 
        REL(5)  ROMP_0A8_059                     * C7807  059 
        REL(5)  ROMP_0A8_05A                     * C780C  05A 
        REL(5)  ROMP_0A8_05B                     * C7811  05B 
        REL(5)  ROMP_0A8_05C                     * C7816  05C 
        REL(5)  ROMP_0A8_05D                     * C781B  05D 
        REL(5)  ROMP_0A8_05E                     * C7820  05E 
        REL(5)  ROMP_0A8_05F                     * C7825  05F 
        REL(5)  ROMP_0A8_060                     * C782A  060 
        REL(5)  ROMP_0A8_061                     * C782F  061 
        REL(5)  ROMP_0A8_062                     * C7834  062 
        REL(5)  ROMP_0A8_063                     * C7839  063 
        REL(5)  ROMP_0A8_064                     * C783E  064 
        REL(5)  ROMP_0A8_065                     * C7843  065 
        REL(5)  ROMP_0A8_066                     * C7848  066 
        REL(5)  ROMP_0A8_067                     * C784D  067 
        REL(5)  ROMP_0A8_068                     * C7852  068 
        REL(5)  ROMP_0A8_069                     * C7857  069 
        REL(5)  ROMP_0A8_06A                     * C785C  06A 
        REL(5)  ROMP_0A8_06B                     * C7861  06B 
        REL(5)  ROMP_0A8_06C                     * C7866  06C 
        REL(5)  ROMP_0A8_06D                     * C786B  06D 
        REL(5)  ROMP_0A8_06E                     * C7870  06E 
        REL(5)  ROMP_0A8_06F                     * C7875  06F 
        REL(5)  ROMP_0A8_070                     * C787A  070 
        REL(5)  ROMP_0A8_071                     * C787F  071 
        REL(5)  ROMP_0A8_072                     * C7884  072 
        REL(5)  ROMP_0A8_073                     * C7889  073 
        REL(5)  ROMP_0A8_074                     * C788E  074 
        REL(5)  ROMP_0A8_075                     * C7893  075 
        REL(5)  ROMP_0A8_076                     * C7898  076 
        REL(5)  ROMP_0A8_077                     * C789D  077 
        REL(5)  ROMP_0A8_078                     * C78A2  078 
        REL(5)  ROMP_0A8_079                     * C78A7  079 
        REL(5)  ROMP_0A8_07A                     * C78AC  07A 
        REL(5)  ROMP_0A8_07B                     * C78B1  07B 
        REL(5)  ROMP_0A8_07C                     * C78B6  07C 
        REL(5)  ROMP_0A8_07D                     * C78BB  07D 
        REL(5)  ROMP_0A8_07E                     * C78C0  07E 
        REL(5)  ROMP_0A8_07F                     * C78C5  07F 
        REL(5)  ROMP_0A8_080                     * C78CA  080 
        REL(5)  ROMP_0A8_081                     * C78CF  081 
        ENDLENGTH                                * C78D4
        NIBHEX  9E43000                          * C78D4  é4.
