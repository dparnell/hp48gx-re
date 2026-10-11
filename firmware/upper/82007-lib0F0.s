* HP 48GX ROM revision R, #82007-#8501A: Library part 0F0
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #82007 in the original ROM).

LIB0F0:
        CON(3)  #0F0                             * 82007  library number
        REL(5)  LIB0F0.hash                      * 8200A  hash table
        CON(5)  0                                * 8200F  message table
        REL(5)  LIB0F0.link                      * 82014  link table
        CON(5)  0                                * 82019  config

LIB0F0.hash:
        CON(5)  DOHSTR                           * 8201E  hash table of library 0F0
        LENGTH                                   * 82023  length, to #82082
        CON(5)  0                                * 82028  names of length 1
        CON(5)  0                                * 8202D  names of length 2
        CON(5)  0                                * 82032  names of length 3
        CON(5)  0                                * 82037  names of length 4
        CON(5)  0                                * 8203C  names of length 5
        CON(5)  0                                * 82041  names of length 6
        CON(5)  0                                * 82046  names of length 7
        CON(5)  0                                * 8204B  names of length 8
        CON(5)  0                                * 82050  names of length 9
        CON(5)  0                                * 82055  names of length 10
        CON(5)  0                                * 8205A  names of length 11
        CON(5)  0                                * 8205F  names of length 12
        CON(5)  0                                * 82064  names of length 13
        CON(5)  0                                * 82069  names of length 14
        CON(5)  0                                * 8206E  names of length 15
        CON(5)  0                                * 82073  names of length 16
        REL(5)  L_8207D                          * 82078  end of the names
L_8207D:
        CON(5)  0                                * 8207D  command 000 has no name
        ENDLENGTH                                * 82082

LIB0F0.link:
        CON(5)  DOHSTR                           * 82082  link table of library 0F0
        LENGTH                                   * 82087  length, to #824BF
        REL(5)  ROMP_0F0_000                     * 8208C  000 
        REL(5)  ROMP_0F0_001                     * 82091  001 
        REL(5)  ROMP_0F0_002                     * 82096  002 
        REL(5)  ROMP_0F0_003                     * 8209B  003 
        REL(5)  ROMP_0F0_004                     * 820A0  004 
        REL(5)  ROMP_0F0_005                     * 820A5  005 
        REL(5)  ROMP_0F0_006                     * 820AA  006 
        REL(5)  ROMP_0F0_007                     * 820AF  007 
        REL(5)  ROMP_0F0_008                     * 820B4  008 
        REL(5)  ROMP_0F0_009                     * 820B9  009 
        REL(5)  ROMP_0F0_00A                     * 820BE  00A 
        REL(5)  ROMP_0F0_00B                     * 820C3  00B 
        REL(5)  ROMP_0F0_00C                     * 820C8  00C 
        REL(5)  ROMP_0F0_00D                     * 820CD  00D 
        REL(5)  ROMP_0F0_00E                     * 820D2  00E 
        REL(5)  ROMP_0F0_00F                     * 820D7  00F 
        REL(5)  ROMP_0F0_010                     * 820DC  010 
        REL(5)  ROMP_0F0_011                     * 820E1  011 
        REL(5)  ROMP_0F0_012                     * 820E6  012 
        REL(5)  ROMP_0F0_013                     * 820EB  013 
        REL(5)  ROMP_0F0_014                     * 820F0  014 
        REL(5)  ROMP_0F0_015                     * 820F5  015 
        REL(5)  ROMP_0F0_016                     * 820FA  016 
        REL(5)  ROMP_0F0_017                     * 820FF  017 
        REL(5)  ROMP_0F0_018                     * 82104  018 
        REL(5)  ROMP_0F0_019                     * 82109  019 
        REL(5)  ROMP_0F0_01A                     * 8210E  01A 
        REL(5)  ROMP_0F0_01B                     * 82113  01B 
        REL(5)  ROMP_0F0_01C                     * 82118  01C 
        REL(5)  ROMP_0F0_01D                     * 8211D  01D 
        REL(5)  ROMP_0F0_01E                     * 82122  01E 
        REL(5)  ROMP_0F0_01F                     * 82127  01F 
        REL(5)  ROMP_0F0_020                     * 8212C  020 
        REL(5)  ROMP_0F0_021                     * 82131  021 
        REL(5)  ROMP_0F0_022                     * 82136  022 
        REL(5)  ROMP_0F0_023                     * 8213B  023 
        REL(5)  ROMP_0F0_024                     * 82140  024 
        REL(5)  ROMP_0F0_025                     * 82145  025 
        REL(5)  ROMP_0F0_026                     * 8214A  026 
        REL(5)  ROMP_0F0_027                     * 8214F  027 
        REL(5)  ROMP_0F0_028                     * 82154  028 
        REL(5)  ROMP_0F0_029                     * 82159  029 
        REL(5)  ROMP_0F0_02A                     * 8215E  02A 
        REL(5)  ROMP_0F0_02C                     * 82163  02B 
        REL(5)  ROMP_0F0_02C                     * 82168  02C 
        REL(5)  ROMP_0F0_02E                     * 8216D  02D 
        REL(5)  ROMP_0F0_02E                     * 82172  02E 
        REL(5)  ROMP_0F0_02F                     * 82177  02F 
        REL(5)  ROMP_0F0_030                     * 8217C  030 
        REL(5)  ROMP_0F0_031                     * 82181  031 
        REL(5)  ROMP_0F0_032                     * 82186  032 
        REL(5)  ROMP_0F0_033                     * 8218B  033 
        REL(5)  ROMP_0F0_034                     * 82190  034 
        REL(5)  ROMP_0F0_036                     * 82195  035 
        REL(5)  ROMP_0F0_036                     * 8219A  036 
        REL(5)  ROMP_0F0_037                     * 8219F  037 
        REL(5)  ROMP_0F0_039                     * 821A4  038 
        REL(5)  ROMP_0F0_039                     * 821A9  039 
        REL(5)  ROMP_0F0_03A                     * 821AE  03A 
        REL(5)  ROMP_0F0_03B                     * 821B3  03B 
        REL(5)  ROMP_0F0_03D                     * 821B8  03C 
        REL(5)  ROMP_0F0_03D                     * 821BD  03D 
        REL(5)  ROMP_0F0_03E                     * 821C2  03E 
        REL(5)  ROMP_0F0_040                     * 821C7  03F 
        REL(5)  ROMP_0F0_040                     * 821CC  040 
        REL(5)  ROMP_0F0_041                     * 821D1  041 
        REL(5)  ROMP_0F0_042                     * 821D6  042 
        REL(5)  ROMP_0F0_043                     * 821DB  043 
        REL(5)  ROMP_0F0_044                     * 821E0  044 
        REL(5)  ROMP_0F0_045                     * 821E5  045 
        REL(5)  ROMP_0F0_046                     * 821EA  046 
        REL(5)  ROMP_0F0_047                     * 821EF  047 
        REL(5)  ROMP_0F0_048                     * 821F4  048 
        REL(5)  ROMP_0F0_04A                     * 821F9  049 
        REL(5)  ROMP_0F0_04A                     * 821FE  04A 
        REL(5)  ROMP_0F0_04B                     * 82203  04B 
        REL(5)  ROMP_0F0_04C                     * 82208  04C 
        REL(5)  ROMP_0F0_04D                     * 8220D  04D 
        REL(5)  ROMP_0F0_04E                     * 82212  04E 
        REL(5)  ROMP_0F0_04F                     * 82217  04F 
        REL(5)  ROMP_0F0_050                     * 8221C  050 
        REL(5)  ROMP_0F0_051                     * 82221  051 
        REL(5)  ROMP_0F0_052                     * 82226  052 
        REL(5)  ROMP_0F0_053                     * 8222B  053 
        REL(5)  ROMP_0F0_054                     * 82230  054 
        REL(5)  ROMP_0F0_055                     * 82235  055 
        REL(5)  ROMP_0F0_056                     * 8223A  056 
        REL(5)  ROMP_0F0_057                     * 8223F  057 
        REL(5)  ROMP_0F0_058                     * 82244  058 
        REL(5)  ROMP_0F0_059                     * 82249  059 
        REL(5)  ROMP_0F0_05A                     * 8224E  05A 
        REL(5)  ROMP_0F0_05B                     * 82253  05B 
        REL(5)  ROMP_0F0_05C                     * 82258  05C 
        REL(5)  ROMP_0F0_05D                     * 8225D  05D 
        REL(5)  ROMP_0F0_05E                     * 82262  05E 
        REL(5)  ROMP_0F0_061                     * 82267  05F 
        REL(5)  ROMP_0F0_061                     * 8226C  060 
        REL(5)  ROMP_0F0_061                     * 82271  061 
        REL(5)  ROMP_0F0_062                     * 82276  062 
        REL(5)  ROMP_0F0_063                     * 8227B  063 
        REL(5)  ROMP_0F0_064                     * 82280  064 
        REL(5)  ROMP_0F0_065                     * 82285  065 
        REL(5)  ROMP_0F0_066                     * 8228A  066 
        REL(5)  ROMP_0F0_067                     * 8228F  067 
        REL(5)  ROMP_0F0_068                     * 82294  068 
        REL(5)  ROMP_0F0_069                     * 82299  069 
        REL(5)  ROMP_0F0_06A                     * 8229E  06A 
        REL(5)  ROMP_0F0_06B                     * 822A3  06B 
        REL(5)  ROMP_0F0_06C                     * 822A8  06C 
        REL(5)  ROMP_0F0_06D                     * 822AD  06D 
        REL(5)  ROMP_0F0_06E                     * 822B2  06E 
        REL(5)  ROMP_0F0_06F                     * 822B7  06F 
        REL(5)  ROMP_0F0_070                     * 822BC  070 
        REL(5)  ROMP_0F0_071                     * 822C1  071 
        REL(5)  ROMP_0F0_072                     * 822C6  072 
        REL(5)  ROMP_0F0_073                     * 822CB  073 
        REL(5)  ROMP_0F0_074                     * 822D0  074 
        REL(5)  ROMP_0F0_075                     * 822D5  075 
        REL(5)  ROMP_0F0_076                     * 822DA  076 
        REL(5)  ROMP_0F0_077                     * 822DF  077 
        REL(5)  ROMP_0F0_078                     * 822E4  078 
        REL(5)  ROMP_0F0_079                     * 822E9  079 
        REL(5)  ROMP_0F0_07A                     * 822EE  07A 
        REL(5)  ROMP_0F0_07B                     * 822F3  07B 
        REL(5)  ROMP_0F0_07C                     * 822F8  07C 
        REL(5)  ROMP_0F0_07D                     * 822FD  07D 
        REL(5)  ROMP_0F0_07E                     * 82302  07E 
        REL(5)  ROMP_0F0_07F                     * 82307  07F 
        REL(5)  ROMP_0F0_080                     * 8230C  080 
        REL(5)  ROMP_0F0_081                     * 82311  081 
        REL(5)  ROMP_0F0_082                     * 82316  082 
        REL(5)  ROMP_0F0_083                     * 8231B  083 
        REL(5)  ROMP_0F0_084                     * 82320  084 
        REL(5)  ROMP_0F0_085                     * 82325  085 
        REL(5)  ROMP_0F0_086                     * 8232A  086 
        REL(5)  ROMP_0F0_087                     * 8232F  087 
        REL(5)  ROMP_0F0_088                     * 82334  088 
        REL(5)  ROMP_0F0_089                     * 82339  089 
        REL(5)  ROMP_0F0_08A                     * 8233E  08A 
        REL(5)  ROMP_0F0_08B                     * 82343  08B 
        REL(5)  ROMP_0F0_08C                     * 82348  08C 
        REL(5)  ROMP_0F0_08D                     * 8234D  08D 
        REL(5)  ROMP_0F0_08E                     * 82352  08E 
        REL(5)  ROMP_0F0_08F                     * 82357  08F 
        REL(5)  ROMP_0F0_090                     * 8235C  090 
        REL(5)  ROMP_0F0_091                     * 82361  091 
        REL(5)  ROMP_0F0_092                     * 82366  092 
        REL(5)  ROMP_0F0_093                     * 8236B  093 
        REL(5)  ROMP_0F0_094                     * 82370  094 
        REL(5)  ROMP_0F0_095                     * 82375  095 
        REL(5)  ROMP_0F0_096                     * 8237A  096 
        REL(5)  ROMP_0F0_097                     * 8237F  097 
        REL(5)  ROMP_0F0_098                     * 82384  098 
        REL(5)  ROMP_0F0_099                     * 82389  099 
        REL(5)  ROMP_0F0_09A                     * 8238E  09A 
        REL(5)  ROMP_0F0_09B                     * 82393  09B 
        REL(5)  ROMP_0F0_09D                     * 82398  09C 
        REL(5)  ROMP_0F0_09D                     * 8239D  09D 
        REL(5)  ROMP_0F0_09E                     * 823A2  09E 
        REL(5)  ROMP_0F0_09F                     * 823A7  09F 
        REL(5)  ROMP_0F0_0A0                     * 823AC  0A0 
        REL(5)  ROMP_0F0_0A1                     * 823B1  0A1 
        REL(5)  ROMP_0F0_0A2                     * 823B6  0A2 
        REL(5)  ROMP_0F0_0A3                     * 823BB  0A3 
        REL(5)  ROMP_0F0_0A4                     * 823C0  0A4 
        REL(5)  ROMP_0F0_0A5                     * 823C5  0A5 
        REL(5)  ROMP_0F0_0A6                     * 823CA  0A6 
        REL(5)  ROMP_0F0_0A7                     * 823CF  0A7 
        REL(5)  ROMP_0F0_0A8                     * 823D4  0A8 
        REL(5)  ROMP_0F0_0A9                     * 823D9  0A9 
        REL(5)  ROMP_0F0_0AA                     * 823DE  0AA 
        REL(5)  ROMP_0F0_0AB                     * 823E3  0AB 
        REL(5)  ROMP_0F0_0AC                     * 823E8  0AC 
        REL(5)  ROMP_0F0_0AD                     * 823ED  0AD 
        REL(5)  ROMP_0F0_0AE                     * 823F2  0AE 
        REL(5)  ROMP_0F0_0AF                     * 823F7  0AF 
        REL(5)  ROMP_0F0_0B0                     * 823FC  0B0 
        REL(5)  ROMP_0F0_0B1                     * 82401  0B1 
        REL(5)  ROMP_0F0_0B2                     * 82406  0B2 
        REL(5)  ROMP_0F0_0B3                     * 8240B  0B3 
        REL(5)  ROMP_0F0_0B4                     * 82410  0B4 
        REL(5)  ROMP_0F0_0B5                     * 82415  0B5 
        REL(5)  ROMP_0F0_0B6                     * 8241A  0B6 
        REL(5)  ROMP_0F0_0B7                     * 8241F  0B7 
        REL(5)  ROMP_0F0_0B8                     * 82424  0B8 
        REL(5)  ROMP_0F0_0B9                     * 82429  0B9 
        REL(5)  ROMP_0F0_0BA                     * 8242E  0BA 
        REL(5)  ROMP_0F0_0BB                     * 82433  0BB 
        REL(5)  ROMP_0F0_0BC                     * 82438  0BC 
        REL(5)  ROMP_0F0_0BD                     * 8243D  0BD 
        REL(5)  ROMP_0F0_0BE                     * 82442  0BE 
        REL(5)  ROMP_0F0_0BF                     * 82447  0BF 
        REL(5)  ROMP_0F0_0C0                     * 8244C  0C0 
        REL(5)  ROMP_0F0_0C1                     * 82451  0C1 
        REL(5)  ROMP_0F0_0C2                     * 82456  0C2 
        REL(5)  ROMP_0F0_0C3                     * 8245B  0C3 
        REL(5)  ROMP_0F0_0C4                     * 82460  0C4 
        REL(5)  ROMP_0F0_0C5                     * 82465  0C5 
        REL(5)  ROMP_0F0_0C6                     * 8246A  0C6 
        REL(5)  ROMP_0F0_0C7                     * 8246F  0C7 
        REL(5)  ROMP_0F0_0C9                     * 82474  0C8 
        REL(5)  ROMP_0F0_0C9                     * 82479  0C9 
        REL(5)  ROMP_0F0_0CA                     * 8247E  0CA 
        REL(5)  ROMP_0F0_0CB                     * 82483  0CB 
        REL(5)  ROMP_0F0_0CC                     * 82488  0CC 
        REL(5)  ROMP_0F0_0CD                     * 8248D  0CD 
        REL(5)  ROMP_0F0_0CE                     * 82492  0CE 
        REL(5)  ROMP_0F0_0CF                     * 82497  0CF 
        REL(5)  ROMP_0F0_0D0                     * 8249C  0D0 
        REL(5)  ROMP_0F0_0D1                     * 824A1  0D1 
        REL(5)  ROMP_0F0_0D2                     * 824A6  0D2 
        REL(5)  ROMP_0F0_0D3                     * 824AB  0D3 
        REL(5)  ROMP_0F0_0D4                     * 824B0  0D4 
        REL(5)  ROMP_0F0_0D5                     * 824B5  0D5 
        REL(5)  ROMP_0F0_0D6                     * 824BA  0D6 
        ENDLENGTH                                * 824BF
        RPL

* ROMPTR 0F0 000
* refs (1): 82007
ROMP_0F0_000:
        ::                                       * 824BF
          DROP                                   * 824C4
          {                                      * 824C9
            OBJ_60E73                            * 824CE
            {                                    * 824D3
              SYMBOL                             * 824D8
                Π&1                              * 824DD
                xSIN                             * 824E2
              ;                                  * 824E7
              NULL{}                             * 824EC
              ::                                 * 824F1
                OBJ_5B3D9                        * 824F6
                Π&1                              * 824FB
                SYMBOL                           * 82500
                  Π&1                            * 82505
                  xCOS                           * 8250A
                  xNEG                           * 8250F
                ;                                * 82514
              ;                                  * 82519
              NULL{}                             * 8251E
            }                                    * 82523
            {                                    * 82528
              SYMBOL                             * 8252D
                Π&1                              * 82532
                xSIN                             * 82537
                Π&1                              * 8253C
                xTAN                             * 82541
                x*                               * 82546
                xINV                             * 8254B
              ;                                  * 82550
              NULL{}                             * 82555

* ROMPTR 0F0 001
* refs (1): 82007
ROMP_0F0_001:
              ::                                 * 8255A
                OBJ_5B3D9                        * 8255F
                Π&1                              * 82564
                SYMBOL                           * 82569
                  Π&1                            * 8256E
                  xSIN                           * 82573
                  xINV                           * 82578
                  xNEG                           * 8257D
                ;                                * 82582
              ;                                  * 82587
              NULL{}                             * 8258C
            }                                    * 82591
            {                                    * 82596
              SYMBOL                             * 8259B
                Π&1                              * 825A0
                xSIN                             * 825A5
                %2                               * 825AA
                x^                               * 825AF
                xINV                             * 825B4
              ;                                  * 825B9
              NULL{}                             * 825BE
              ::                                 * 825C3
                OBJ_5B3D9                        * 825C8
                Π&1                              * 825CD
                SYMBOL                           * 825D2
                  Π&1                            * 825D7
                  xTAN                           * 825DC
                  xINV                           * 825E1
                  xNEG                           * 825E6
                ;                                * 825EB
              ;                                  * 825F0
              NULL{}                             * 825F5
            }                                    * 825FA
            {                                    * 825FF
              SYMBOL                             * 82604
                Π&1                              * 82609
                xSIN                             * 8260E
                Π&1                              * 82613
                xCOS                             * 82618
                x*                               * 8261D
                xINV                             * 82622
              ;                                  * 82627
              NULL{}                             * 8262C
              ROMPTR  0F0 003                    * 82631
              NULL{}                             * 8263C
            }                                    * 82641
          }                                      * 82646
          OBJ_5B34D                              * 8264B
        ;                                        * 82650

* ROMPTR 0F0 002
* refs (1): 82007
ROMP_0F0_002:
        ::                                       * 82655
          DROP                                   * 8265A
          {                                      * 8265F
            OBJ_60E73                            * 82664
            {                                    * 82669
              SYMBOL                             * 8266E
                Π&1                              * 82673
                xCOS                             * 82678
              ;                                  * 8267D
              NULL{}                             * 82682
              ::                                 * 82687
                OBJ_5B3D9                        * 8268C
                Π&1                              * 82691
                SYMBOL                           * 82696
                  Π&1                            * 8269B
                  xSIN                           * 826A0
                ;                                * 826A5
              ;                                  * 826AA
              NULL{}                             * 826AF
            }                                    * 826B4
            {                                    * 826B9
              SYMBOL                             * 826BE
                Π&1                              * 826C3
                xCOS                             * 826C8
                Π&1                              * 826CD
                xSIN                             * 826D2
                x*                               * 826D7
                xINV                             * 826DC
              ;                                  * 826E1
              NULL{}                             * 826E6

* ROMPTR 0F0 003
* refs (1): 82007
ROMP_0F0_003:
              ::                                 * 826EB
                OBJ_5B3D9                        * 826F0
                Π&1                              * 826F5
                SYMBOL                           * 826FA
                  Π&1                            * 826FF
                  xTAN                           * 82704
                  xLN                            * 82709
                ;                                * 8270E
              ;                                  * 82713
              NULL{}                             * 82718
            }                                    * 8271D
          }                                      * 82722
          OBJ_5B34D                              * 82727
        ;                                        * 8272C

* ROMPTR 0F0 004
* refs (1): 82007
ROMP_0F0_004:
        ::                                       * 82731
          DROP                                   * 82736
          {                                      * 8273B
            OBJ_60E73                            * 82740
            {                                    * 82745
              SYMBOL                             * 8274A
                Π&1                              * 8274F
                xTAN                             * 82754
                %2                               * 82759
                x^                               * 8275E
              ;                                  * 82763
              NULL{}                             * 82768
              ::                                 * 8276D
                OBJ_5B3D9                        * 82772
                Π&1                              * 82777
                SYMBOL                           * 8277C
                  Π&1                            * 82781
                  xTAN                           * 82786
                  Π&1                            * 8278B
                  x-                             * 82790
                ;                                * 82795
              ;                                  * 8279A
              NULL{}                             * 8279F
            }                                    * 827A4
            {                                    * 827A9
              SYMBOL                             * 827AE
                Π&1                              * 827B3
                xTAN                             * 827B8
              ;                                  * 827BD
              NULL{}                             * 827C2
              ::                                 * 827C7
                OBJ_5B3D9                        * 827CC
                Π&1                              * 827D1
                SYMBOL                           * 827D6
                  Π&1                            * 827DB
                  xCOS                           * 827E0
                  xLN                            * 827E5
                  xNEG                           * 827EA
                ;                                * 827EF
              ;                                  * 827F4
              NULL{}                             * 827F9
            }                                    * 827FE
            {                                    * 82803
              SYMBOL                             * 82808
                Π&1                              * 8280D
                xTAN                             * 82812
                Π&1                              * 82817
                xSIN                             * 8281C
                x*                               * 82821
                xINV                             * 82826
              ;                                  * 8282B
              NULL{}                             * 82830
              ROMPTR  0F0 001                    * 82835
              NULL{}                             * 82840
            }                                    * 82845
            {                                    * 8284A
              SYMBOL                             * 8284F
                Π&1                              * 82854
                xTAN                             * 82859
                Π&1                              * 8285E
                xCOS                             * 82863
                xINV                             * 82868
                x*                               * 8286D
              ;                                  * 82872
              NULL{}                             * 82877
              ::                                 * 8287C
                OBJ_5B3D9                        * 82881
                Π&1                              * 82886
                SYMBOL                           * 8288B
                  Π&1                            * 82890
                  xCOS                           * 82895
                  xINV                           * 8289A
                ;                                * 8289F
              ;                                  * 828A4
              NULL{}                             * 828A9
            }                                    * 828AE
            {                                    * 828B3
              SYMBOL                             * 828B8
                Π&1                              * 828BD
                xTAN                             * 828C2
                xINV                             * 828C7
              ;                                  * 828CC
              NULL{}                             * 828D1
              ::                                 * 828D6
                OBJ_5B3D9                        * 828DB
                Π&1                              * 828E0
                SYMBOL                           * 828E5
                  Π&1                            * 828EA
                  xSIN                           * 828EF
                  xLN                            * 828F4
                ;                                * 828F9
              ;                                  * 828FE
              NULL{}                             * 82903
            }                                    * 82908
          }                                      * 8290D
          OBJ_5B34D                              * 82912
        ;                                        * 82917

* ROMPTR 0F0 005
* refs (1): 82007
ROMP_0F0_005:
        ::                                       * 8291C
          OBJ_5B32F                              * 82921
          {                                      * 82926
            OBJ_60E73                            * 8292B
            {                                    * 82930
              SYMBOL                             * 82935
                Π&1                              * 8293A
                xASIN                            * 8293F
              ;                                  * 82944
              NULL{}                             * 82949
              ::                                 * 8294E
                OBJ_5B433                        * 82953
                Π&1                              * 82958
                SYMBOL                           * 8295D
                  Π&1                            * 82962
                  Π&1                            * 82967
                  xASIN                          * 8296C
                  x*                             * 82971
                  %1                             * 82976
                  Π&1                            * 8297B
                  %2                             * 82980
                  x^                             * 82985
                  x-                             * 8298A
                  xSQRT                          * 8298F
                  x+                             * 82994
                ;                                * 82999
              ;                                  * 8299E
              NULL{}                             * 829A3
            }                                    * 829A8
          }                                      * 829AD
          OBJ_5B34D                              * 829B2
        ;                                        * 829B7

* ROMPTR 0F0 006
* refs (1): 82007
ROMP_0F0_006:
        ::                                       * 829BC
          OBJ_5B32F                              * 829C1
          {                                      * 829C6
            OBJ_60E73                            * 829CB
            {                                    * 829D0
              SYMBOL                             * 829D5
                Π&1                              * 829DA
                xACOS                            * 829DF
              ;                                  * 829E4
              NULL{}                             * 829E9
              ::                                 * 829EE
                OBJ_5B433                        * 829F3
                Π&1                              * 829F8
                SYMBOL                           * 829FD
                  Π&1                            * 82A02
                  Π&1                            * 82A07
                  xACOS                          * 82A0C
                  x*                             * 82A11
                  %1                             * 82A16
                  Π&1                            * 82A1B
                  %2                             * 82A20
                  x^                             * 82A25
                  x-                             * 82A2A
                  xSQRT                          * 82A2F
                  x-                             * 82A34
                ;                                * 82A39
              ;                                  * 82A3E
              NULL{}                             * 82A43
            }                                    * 82A48
          }                                      * 82A4D
          OBJ_5B34D                              * 82A52
        ;                                        * 82A57

* ROMPTR 0F0 007
* refs (1): 82007
ROMP_0F0_007:
        ::                                       * 82A5C
          OBJ_5B32F                              * 82A61
          {                                      * 82A66
            OBJ_60E73                            * 82A6B
            {                                    * 82A70
              SYMBOL                             * 82A75
                Π&1                              * 82A7A
                xATAN                            * 82A7F
              ;                                  * 82A84
              NULL{}                             * 82A89
              ::                                 * 82A8E
                OBJ_5B433                        * 82A93
                Π&1                              * 82A98
                SYMBOL                           * 82A9D
                  Π&1                            * 82AA2
                  Π&1                            * 82AA7
                  xATAN                          * 82AAC
                  x*                             * 82AB1
                  %1                             * 82AB6
                  Π&1                            * 82ABB
                  %2                             * 82AC0
                  x^                             * 82AC5
                  x+                             * 82ACA
                  xLN                            * 82ACF
                  %2                             * 82AD4
                  x/                             * 82AD9
                  x-                             * 82ADE
                ;                                * 82AE3
              ;                                  * 82AE8
              NULL{}                             * 82AED
            }                                    * 82AF2
          }                                      * 82AF7
          OBJ_5B34D                              * 82AFC
        ;                                        * 82B01

* ROMPTR 0F0 008
* refs (1): 82007
ROMP_0F0_008:
        ::                                       * 82B06
          DROP                                   * 82B0B
          {                                      * 82B10
            OBJ_60E73                            * 82B15
            {                                    * 82B1A
              SYMBOL                             * 82B1F
                Π&1                              * 82B24
                xSINH                            * 82B29
              ;                                  * 82B2E
              NULL{}                             * 82B33
              ::                                 * 82B38
                OBJ_5B375                        * 82B3D
                Π&1                              * 82B42
                SYMBOL                           * 82B47
                  Π&1                            * 82B4C
                  xCOSH                          * 82B51
                ;                                * 82B56
              ;                                  * 82B5B
              NULL{}                             * 82B60
            }                                    * 82B65
            {                                    * 82B6A
              SYMBOL                             * 82B6F
                Π&1                              * 82B74
                xSINH                            * 82B79
                Π&1                              * 82B7E
                xTANH                            * 82B83
                x*                               * 82B88
                xINV                             * 82B8D
              ;                                  * 82B92
              NULL{}                             * 82B97

* ROMPTR 0F0 009
* refs (1): 82007
ROMP_0F0_009:
              ::                                 * 82B9C
                OBJ_5B375                        * 82BA1
                Π&1                              * 82BA6
                SYMBOL                           * 82BAB
                  Π&1                            * 82BB0
                  xSINH                          * 82BB5
                  xINV                           * 82BBA
                  xNEG                           * 82BBF
                ;                                * 82BC4
              ;                                  * 82BC9
              NULL{}                             * 82BCE
            }                                    * 82BD3
            {                                    * 82BD8
              SYMBOL                             * 82BDD
                Π&1                              * 82BE2
                xSINH                            * 82BE7
                %2                               * 82BEC
                x^                               * 82BF1
                xINV                             * 82BF6
              ;                                  * 82BFB
              NULL{}                             * 82C00
              ::                                 * 82C05
                OBJ_5B375                        * 82C0A
                Π&1                              * 82C0F
                SYMBOL                           * 82C14
                  Π&1                            * 82C19
                  xTANH                          * 82C1E
                  xINV                           * 82C23
                  xNEG                           * 82C28
                ;                                * 82C2D
              ;                                  * 82C32
              NULL{}                             * 82C37
            }                                    * 82C3C
            {                                    * 82C41
              SYMBOL                             * 82C46
                Π&1                              * 82C4B
                xSINH                            * 82C50
                Π&1                              * 82C55
                xCOSH                            * 82C5A
                x*                               * 82C5F
                xINV                             * 82C64
              ;                                  * 82C69
              NULL{}                             * 82C6E

* ROMPTR 0F0 00A
* refs (1): 82007
ROMP_0F0_00A:
              ::                                 * 82C73
                OBJ_5B375                        * 82C78
                Π&1                              * 82C7D
                SYMBOL                           * 82C82
                  Π&1                            * 82C87
                  xTANH                          * 82C8C
                  xLN                            * 82C91
                ;                                * 82C96
              ;                                  * 82C9B
              NULL{}                             * 82CA0
            }                                    * 82CA5
          }                                      * 82CAA
          OBJ_5B34D                              * 82CAF
        ;                                        * 82CB4

* ROMPTR 0F0 00B
* refs (1): 82007
ROMP_0F0_00B:
        ::                                       * 82CB9
          DROP                                   * 82CBE
          {                                      * 82CC3
            OBJ_60E73                            * 82CC8
            {                                    * 82CCD
              SYMBOL                             * 82CD2
                Π&1                              * 82CD7
                xCOSH                            * 82CDC
              ;                                  * 82CE1
              NULL{}                             * 82CE6
              ::                                 * 82CEB
                OBJ_5B375                        * 82CF0
                Π&1                              * 82CF5
                SYMBOL                           * 82CFA
                  Π&1                            * 82CFF
                  xSINH                          * 82D04
                ;                                * 82D09
              ;                                  * 82D0E
              NULL{}                             * 82D13
            }                                    * 82D18
            {                                    * 82D1D
              SYMBOL                             * 82D22
                Π&1                              * 82D27
                xCOSH                            * 82D2C
                %2                               * 82D31
                x^                               * 82D36
                xINV                             * 82D3B
              ;                                  * 82D40
              NULL{}                             * 82D45

* ROMPTR 0F0 00C
* refs (1): 82007
ROMP_0F0_00C:
              ::                                 * 82D4A
                OBJ_5B375                        * 82D4F
                Π&1                              * 82D54
                SYMBOL                           * 82D59
                  Π&1                            * 82D5E
                  xTANH                          * 82D63
                ;                                * 82D68
              ;                                  * 82D6D
              NULL{}                             * 82D72
            }                                    * 82D77
            {                                    * 82D7C
              SYMBOL                             * 82D81
                Π&1                              * 82D86
                xCOSH                            * 82D8B
                %-2                              * 82D90
                x^                               * 82D95
              ;                                  * 82D9A
              NULL{}                             * 82D9F
              ROMPTR  0F0 00C                    * 82DA4
              NULL{}                             * 82DAF
            }                                    * 82DB4
            {                                    * 82DB9
              SYMBOL                             * 82DBE
                Π&1                              * 82DC3
                xCOSH                            * 82DC8
                Π&1                              * 82DCD
                xSINH                            * 82DD2
                x*                               * 82DD7
                xINV                             * 82DDC
              ;                                  * 82DE1
              NULL{}                             * 82DE6
              ROMPTR  0F0 00A                    * 82DEB
              NULL{}                             * 82DF6
            }                                    * 82DFB
          }                                      * 82E00
          OBJ_5B34D                              * 82E05
        ;                                        * 82E0A

* ROMPTR 0F0 00D
* refs (1): 82007
ROMP_0F0_00D:
        ::                                       * 82E0F
          DROP                                   * 82E14
          {                                      * 82E19
            OBJ_60E73                            * 82E1E
            {                                    * 82E23
              SYMBOL                             * 82E28
                Π&1                              * 82E2D
                xTANH                            * 82E32
              ;                                  * 82E37
              NULL{}                             * 82E3C
              ::                                 * 82E41
                OBJ_5B375                        * 82E46
                Π&1                              * 82E4B
                SYMBOL                           * 82E50
                  Π&1                            * 82E55
                  xCOSH                          * 82E5A
                  xLN                            * 82E5F
                ;                                * 82E64
              ;                                  * 82E69
              NULL{}                             * 82E6E
            }                                    * 82E73
            {                                    * 82E78
              SYMBOL                             * 82E7D
                Π&1                              * 82E82
                xTANH                            * 82E87
                Π&1                              * 82E8C
                xSINH                            * 82E91
                x*                               * 82E96
                xINV                             * 82E9B
              ;                                  * 82EA0
              NULL{}                             * 82EA5
              ROMPTR  0F0 009                    * 82EAA
              NULL{}                             * 82EB5
            }                                    * 82EBA
            {                                    * 82EBF
              SYMBOL                             * 82EC4
                Π&1                              * 82EC9
                xTANH                            * 82ECE
                Π&1                              * 82ED3
                xCOSH                            * 82ED8
                xINV                             * 82EDD
                x*                               * 82EE2
              ;                                  * 82EE7
              NULL{}                             * 82EEC
              ::                                 * 82EF1
                OBJ_5B375                        * 82EF6
                Π&1                              * 82EFB
                SYMBOL                           * 82F00
                  Π&1                            * 82F05
                  xCOSH                          * 82F0A
                  xINV                           * 82F0F
                ;                                * 82F14
              ;                                  * 82F19
              NULL{}                             * 82F1E
            }                                    * 82F23
            {                                    * 82F28
              SYMBOL                             * 82F2D
                Π&1                              * 82F32
                xTANH                            * 82F37
                xINV                             * 82F3C
              ;                                  * 82F41
              NULL{}                             * 82F46
              ::                                 * 82F4B
                OBJ_5B375                        * 82F50
                Π&1                              * 82F55
                SYMBOL                           * 82F5A
                  Π&1                            * 82F5F
                  xSINH                          * 82F64
                  xLN                            * 82F69
                ;                                * 82F6E
              ;                                  * 82F73
              NULL{}                             * 82F78
            }                                    * 82F7D
          }                                      * 82F82
          OBJ_5B34D                              * 82F87
        ;                                        * 82F8C

* ROMPTR 0F0 00E
* refs (1): 82007
ROMP_0F0_00E:
        ::                                       * 82F91
          OBJ_5B32F                              * 82F96
          {                                      * 82F9B
            OBJ_60E73                            * 82FA0
            {                                    * 82FA5
              SYMBOL                             * 82FAA
                Π&1                              * 82FAF
                xEXPM                            * 82FB4
              ;                                  * 82FB9
              NULL{}                             * 82FBE
              ::                                 * 82FC3
                OBJ_5B375                        * 82FC8
                Π&1                              * 82FCD
                SYMBOL                           * 82FD2
                  Π&1                            * 82FD7
                  xEXP                           * 82FDC
                  Π&1                            * 82FE1
                  x-                             * 82FE6
                ;                                * 82FEB
              ;                                  * 82FF0
              NULL{}                             * 82FF5
            }                                    * 82FFA
          }                                      * 82FFF
          OBJ_5B34D                              * 83004
        ;                                        * 83009

* ROMPTR 0F0 00F
* refs (1): 82007
ROMP_0F0_00F:
        ::                                       * 8300E
          OBJ_5B32F                              * 83013
          {                                      * 83018
            OBJ_60E73                            * 8301D
            {                                    * 83022
              SYMBOL                             * 83027
                Π&1                              * 8302C
                xALOG                            * 83031
              ;                                  * 83036
              NULL{}                             * 8303B
              ::                                 * 83040
                OBJ_5B375                        * 83045
                Π&1                              * 8304A
                SYMBOL                           * 8304F
                  %       4.34294481904E-1       * 83054
                  Π&1                            * 83069
                  xALOG                          * 8306E
                  x*                             * 83073
                ;                                * 83078
              ;                                  * 8307D
              NULL{}                             * 83082
            }                                    * 83087
          }                                      * 8308C
          OBJ_5B34D                              * 83091
        ;                                        * 83096

* ROMPTR 0F0 010
* refs (1): 82007
ROMP_0F0_010:
        ::                                       * 8309B
          OBJ_5B32F                              * 830A0
          {                                      * 830A5
            OBJ_60E73                            * 830AA
            {                                    * 830AF
              SYMBOL                             * 830B4
                Π&1                              * 830B9
                xLN                              * 830BE
              ;                                  * 830C3
              NULL{}                             * 830C8
              ::                                 * 830CD
                OBJ_5B375                        * 830D2
                Π&1                              * 830D7
                SYMBOL                           * 830DC
                  Π&1                            * 830E1
                  Π&1                            * 830E6
                  xLN                            * 830EB
                  x*                             * 830F0
                  Π&1                            * 830F5
                  x-                             * 830FA
                ;                                * 830FF
              ;                                  * 83104
              NULL{}                             * 83109
            }                                    * 8310E
          }                                      * 83113
          OBJ_5B34D                              * 83118
        ;                                        * 8311D

* ROMPTR 0F0 011
* refs (1): 82007
ROMP_0F0_011:
        ::                                       * 83122
          OBJ_5B32F                              * 83127
          {                                      * 8312C
            OBJ_60E73                            * 83131
            {                                    * 83136
              SYMBOL                             * 8313B
                Π&1                              * 83140
                xLOG                             * 83145
              ;                                  * 8314A
              NULL{}                             * 8314F
              ::                                 * 83154
                OBJ_5B375                        * 83159
                Π&1                              * 8315E
                SYMBOL                           * 83163
                  %       4.34294481904E-1       * 83168
                  Π&1                            * 8317D
                  Π&1                            * 83182
                  xLN                            * 83187
                  x*                             * 8318C
                  Π&1                            * 83191
                  x-                             * 83196
                  x*                             * 8319B
                ;                                * 831A0
              ;                                  * 831A5
              NULL{}                             * 831AA
            }                                    * 831AF
          }                                      * 831B4
          OBJ_5B34D                              * 831B9
        ;                                        * 831BE

* ROMPTR 0F0 012
* refs (1): 82007
ROMP_0F0_012:
        ::                                       * 831C3
          OBJ_5B32F                              * 831C8
          {                                      * 831CD
            OBJ_60E73                            * 831D2
            {                                    * 831D7
              SYMBOL                             * 831DC
                Π&1                              * 831E1
                xINV                             * 831E6
              ;                                  * 831EB
              NULL{}                             * 831F0
              ::                                 * 831F5
                OBJ_5B375                        * 831FA
                Π&1                              * 831FF
                SYMBOL                           * 83204
                  Π&1                            * 83209
                  xLN                            * 8320E
                ;                                * 83213
              ;                                  * 83218
              NULL{}                             * 8321D
            }                                    * 83222
            {                                    * 83227
              SYMBOL                             * 8322C
                Π&1                              * 83231
                %2                               * 83236
                x^                               * 8323B
                xINV                             * 83240
              ;                                  * 83245
              NULL{}                             * 8324A
              ::                                 * 8324F
                OBJ_5B375                        * 83254
                Π&1                              * 83259
                SYMBOL                           * 8325E
                  Π&1                            * 83263
                  xINV                           * 83268
                  xNEG                           * 8326D
                ;                                * 83272
              ;                                  * 83277
              NULL{}                             * 8327C
            }                                    * 83281
            {                                    * 83286
              SYMBOL                             * 8328B
                Π&1                              * 83290
                xSQ                              * 83295
                xINV                             * 8329A
              ;                                  * 8329F
              NULL{}                             * 832A4
              ::                                 * 832A9
                OBJ_5B375                        * 832AE
                Π&1                              * 832B3
                SYMBOL                           * 832B8
                  Π&1                            * 832BD
                  xINV                           * 832C2
                  xNEG                           * 832C7
                ;                                * 832CC
              ;                                  * 832D1
              NULL{}                             * 832D6
            }                                    * 832DB
            {                                    * 832E0
              SYMBOL                             * 832E5
                %1                               * 832EA
                Π&1                              * 832EF
                %2                               * 832F4
                x^                               * 832F9
                x+                               * 832FE
                xINV                             * 83303
              ;                                  * 83308
              NULL{}                             * 8330D

* ROMPTR 0F0 013
* refs (1): 82007
ROMP_0F0_013:
              ::                                 * 83312
                OBJ_5B375                        * 83317
                Π&1                              * 8331C
                SYMBOL                           * 83321
                  Π&1                            * 83326
                  xATAN                          * 8332B
                ;                                * 83330
              ;                                  * 83335
              NULL{}                             * 8333A
            }                                    * 8333F
            {                                    * 83344
              SYMBOL                             * 83349
                Π&1                              * 8334E
                %2                               * 83353
                x^                               * 83358
                %1                               * 8335D
                x+                               * 83362
                xINV                             * 83367
              ;                                  * 8336C
              NULL{}                             * 83371
              ROMPTR  0F0 013                    * 83376
              NULL{}                             * 83381
            }                                    * 83386
            {                                    * 8338B
              SYMBOL                             * 83390
                %1                               * 83395
                Π&1                              * 8339A
                %2                               * 8339F
                x^                               * 833A4
                x-                               * 833A9
                xINV                             * 833AE
              ;                                  * 833B3
              NULL{}                             * 833B8
              ::                                 * 833BD
                OBJ_5B375                        * 833C2
                Π&1                              * 833C7
                SYMBOL                           * 833CC
                  Π&1                            * 833D1
                  xATANH                         * 833D6
                ;                                * 833DB
              ;                                  * 833E0
              NULL{}                             * 833E5
            }                                    * 833EA
          }                                      * 833EF
          OBJ_5B34D                              * 833F4
        ;                                        * 833F9

* ROMPTR 0F0 014
* refs (1): 82007
ROMP_0F0_014:
        ::                                       * 833FE
          DROP                                   * 83403
          {                                      * 83408
            OBJ_60E73                            * 8340D
            {                                    * 83412
              SYMBOL                             * 83417
                Π&1                              * 8341C
                xSQ                              * 83421
              ;                                  * 83426
              NULL{}                             * 8342B
              ::                                 * 83430
                OBJ_5B375                        * 83435
                Π&1                              * 8343A
                SYMBOL                           * 8343F
                  Π&1                            * 83444
                  %3                             * 83449
                  x^                             * 8344E
                  %3                             * 83453
                  x/                             * 83458
                ;                                * 8345D
              ;                                  * 83462
              NULL{}                             * 83467
            }                                    * 8346C
          }                                      * 83471
          OBJ_5B34D                              * 83476
        ;                                        * 8347B

* ROMPTR 0F0 015
* refs (1): 82007
ROMP_0F0_015:
        ::                                       * 83480
          DROP                                   * 83485
          {                                      * 8348A
            OBJ_60E73                            * 8348F
            {                                    * 83494
              SYMBOL                             * 83499
                %1                               * 8349E
                Π&1                              * 834A3
                %2                               * 834A8
                x^                               * 834AD
                x-                               * 834B2
                xSQRT                            * 834B7
                xINV                             * 834BC
              ;                                  * 834C1
              NULL{}                             * 834C6
              ::                                 * 834CB
                OBJ_5B375                        * 834D0
                Π&1                              * 834D5
                SYMBOL                           * 834DA
                  Π&1                            * 834DF
                  xASIN                          * 834E4
                ;                                * 834E9
              ;                                  * 834EE
              NULL{}                             * 834F3
            }                                    * 834F8
            {                                    * 834FD
              SYMBOL                             * 83502
                %1                               * 83507
                Π&1                              * 8350C
                %2                               * 83511
                x^                               * 83516
                x+                               * 8351B
                xSQRT                            * 83520
                xINV                             * 83525
              ;                                  * 8352A
              NULL{}                             * 8352F

* ROMPTR 0F0 016
* refs (1): 82007
ROMP_0F0_016:
              ::                                 * 83534
                OBJ_5B375                        * 83539
                Π&1                              * 8353E
                SYMBOL                           * 83543
                  Π&1                            * 83548
                  xASINH                         * 8354D
                ;                                * 83552
              ;                                  * 83557
              NULL{}                             * 8355C
            }                                    * 83561
            {                                    * 83566
              SYMBOL                             * 8356B
                Π&1                              * 83570
                %2                               * 83575
                x^                               * 8357A
                %1                               * 8357F
                x+                               * 83584
                xSQRT                            * 83589
                xINV                             * 8358E
              ;                                  * 83593
              NULL{}                             * 83598
              ROMPTR  0F0 016                    * 8359D
              NULL{}                             * 835A8
            }                                    * 835AD
            {                                    * 835B2
              SYMBOL                             * 835B7
                %1                               * 835BC
                Π&1                              * 835C1
                x+                               * 835C6
                xSQRT                            * 835CB
                xINV                             * 835D0
                %-1                              * 835D5
                Π&1                              * 835DA
                x+                               * 835DF
                xSQRT                            * 835E4
                xINV                             * 835E9
                x*                               * 835EE
              ;                                  * 835F3
              NULL{}                             * 835F8

* ROMPTR 0F0 017
* refs (1): 82007
ROMP_0F0_017:
              ::                                 * 835FD
                OBJ_5B375                        * 83602
                Π&1                              * 83607
                SYMBOL                           * 8360C
                  Π&1                            * 83611
                  xACOSH                         * 83616
                ;                                * 8361B
              ;                                  * 83620
              NULL{}                             * 83625
            }                                    * 8362A
            {                                    * 8362F
              SYMBOL                             * 83634
                Π&1                              * 83639
                %1                               * 8363E
                x-                               * 83643
                xSQRT                            * 83648
                Π&1                              * 8364D
                %1                               * 83652
                x+                               * 83657
                xSQRT                            * 8365C
                x*                               * 83661
                xINV                             * 83666
              ;                                  * 8366B
              NULL{}                             * 83670
              ROMPTR  0F0 017                    * 83675
              NULL{}                             * 83680
            }                                    * 83685
            {                                    * 8368A
              SYMBOL                             * 8368F
                Π&1                              * 83694
                xSQRT                            * 83699
              ;                                  * 8369E
              NULL{}                             * 836A3
              ::                                 * 836A8
                OBJ_5B375                        * 836AD
                Π&1                              * 836B2
                SYMBOL                           * 836B7
                  %2                             * 836BC
                  Π&1                            * 836C1
                  %3                             * 836C6
                  %2                             * 836CB
                  x/                             * 836D0
                  x^                             * 836D5
                  x*                             * 836DA
                  %3                             * 836DF
                  x/                             * 836E4
                ;                                * 836E9
              ;                                  * 836EE
              NULL{}                             * 836F3
            }                                    * 836F8
            {                                    * 836FD
              SYMBOL                             * 83702
                Π&1                              * 83707
                xSQRT                            * 8370C
                xINV                             * 83711
              ;                                  * 83716
              NULL{}                             * 8371B
              ::                                 * 83720
                OBJ_5B375                        * 83725
                Π&1                              * 8372A
                SYMBOL                           * 8372F
                  %2                             * 83734
                  Π&1                            * 83739
                  xSQRT                          * 8373E
                  x*                             * 83743
                ;                                * 83748
              ;                                  * 8374D
              NULL{}                             * 83752
            }                                    * 83757
          }                                      * 8375C
          OBJ_5B34D                              * 83761
        ;                                        * 83766

* ROMPTR 0F0 018
* refs (1): 82007
ROMP_0F0_018:
        ::                                       * 8376B
          OBJ_5B32F                              * 83770
          {                                      * 83775
            OBJ_60E73                            * 8377A
            {                                    * 8377F
              SYMBOL                             * 83784
                Π&1                              * 83789
                xSIGN                            * 8378E
              ;                                  * 83793
              NULL{}                             * 83798
              ::                                 * 8379D
                OBJ_5B375                        * 837A2
                Π&1                              * 837A7
                SYMBOL                           * 837AC
                  Π&1                            * 837B1
                  xABS                           * 837B6
                ;                                * 837BB
              ;                                  * 837C0
              NULL{}                             * 837C5
            }                                    * 837CA
          }                                      * 837CF
          OBJ_5B34D                              * 837D4
        ;                                        * 837D9

* ROMPTR 0F0 019
* refs (1): 82007
ROMP_0F0_019:
        ::                                       * 837DE
          #1-                                    * 837E3
          DUP#1=                                 * 837E8
          dvarlsBIND                             * 837ED
          tailpsh                                * 837F2
          larg                                   * 837F7
          SWAPDROP#1-                            * 837FC
          DUP#1+PICK                             * 83801
          '                                      * 83806
          lam'dvar                               * 8380B
          EQ                                     * 83810
          1GETABND                               * 83815
          ANDcase                                * 8381A
          ::                                     * 8381F
            #1-                                  * 83824
            get1                                 * 83829
            DROP                                 * 8382E
            over&                                * 83833
            psh                                  * 83838
            NDROP                                * 8383D
            TRUE                                 * 83842
          ;                                      * 83847
          DUP#1+PICK                             * 8384C
          DUP                                    * 83851
          OBJ_5AD4E                              * 83856
          ID>LAM                                 * 8385B
          BINT1                                  * 83860
          DOBIND                                 * 83865
          pshzer                                 * 8386A
          >dvars                                 * 8386F
          #1-                                    * 83874
          IMPLODE                                * 83879
          SWAPcompSWAP                           * 8387E
          SYMDERSTEP                             * 83883
          EXPLODE                                * 83888
          1GETABND                               * 8388D
          DUP                                    * 83892
          OBJ_5AD4E                              * 83897
          ID>LAM                                 * 8389C
          SWAP                                   * 838A1
          BINT1                                  * 838A6
          DOBIND                                 * 838AB
          pshzer                                 * 838B0
          >dvars                                 * 838B5
          ABND                                   * 838BA
          top&                                   * 838BF
          pshtop&                                * 838C4
          FALSE                                  * 838C9
        ;                                        * 838CE

* ROMPTR 0F0 01A
* refs (1): 82007
ROMP_0F0_01A:
        ::                                       * 838D3
          rotswap                                * 838D8
          pullpsh1&                              * 838DD
          rotswap                                * 838E2
          pshzerpsharg                           * 838E7
          OBJ_5D339                              * 838EC
          M1st*case                              * 838F1
          ::                                     * 838F6
            SWAPDROP#1-                          * 838FB
            metainv                              * 83900
            pshtop&                              * 83905
            meta*                                * 8390A
            larg&                                * 8390F
          ;                                      * 83914
          forceadd                               * 83919
          M1st+case                              * 8391E
          ::                                     * 83923
            SWAPDROP#1-                          * 83928
            metaneg                              * 8392D
            pshtop&                              * 83932
            meta+                                * 83937
            larg&                                * 8393C
          ;                                      * 83941
          metaneg                                * 83946
          psh                                    * 8394B
          %0_2A2B4                               * 83950
          psh1&                                  * 83955
          top&                                   * 8395A
          meta+                                  * 8395F
          larg&                                  * 83964
        ;                                        * 83969

* ROMPTR 0F0 01B
* refs (1): 82007
ROMP_0F0_01B:
        ::                                       * 8396E
          rotswap                                * 83973
          pullpsh1&                              * 83978
          rotswap                                * 8397D
          larg                                   * 83982
          OBJ_5D429                              * 83987
          M1st*case                              * 8398C
          ::                                     * 83991
            plDRPpZparg                          * 83996
            meta/                                * 8399B
            psh&                                 * 839A0
            4roll                                * 839A5
            top&                                 * 839AA
            unrot                                * 839AF
            larg&                                * 839B4
          ;                                      * 839B9
          OBJ_5D1B2                              * 839BE
          M1st+case                              * 839C3
          ::                                     * 839C8
            plDRPpZparg                          * 839CD
            meta-                                * 839D2
            psh&                                 * 839D7
            4roll                                * 839DC
            top&                                 * 839E1
            unrot                                * 839E6
            larg&                                * 839EB
          ;                                      * 839F0
          top&                                   * 839F5
          meta-                                  * 839FA
          rotswap                                * 839FF
          %0_2A2B4                               * 83A04
          psh1&                                  * 83A09
          rotswap                                * 83A0E
          larg&                                  * 83A13
        ;                                        * 83A18

* ROMPTR 0F0 01C
* refs (1): 82007
ROMP_0F0_01C:
        ::                                       * 83A1D
          #1-SWAP                                * 83A22
          pshm1                                  * 83A27
          #1-SWAP                                * 83A2C
          DROP                                   * 83A31
          pshzerpsharg                           * 83A36
          pshzerpsharg                           * 83A3B
          M1st/case                              * 83A40
          ROMPTR  0F0 01D                        * 83A45
          metaROTDUP                             * 83A50
          roll2top&                              * 83A55
          meta*                                  * 83A5A
          ROTUntop&                              * 83A5F
          ROTUntop&                              * 83A64
          pshtop&                                * 83A69
          meta/                                  * 83A6E
        ;                                        * 83A73

* ROMPTR 0F0 01D
* refs (1): 82007
ROMP_0F0_01D:
        ::                                       * 83A78
          rotswap                                * 83A7D
          plDRPpZparg                            * 83A82
          metaROTDUP                             * 83A87
          roll2top&                              * 83A8C
          meta*                                  * 83A91
          psh                                    * 83A96
          metaROTDUP                             * 83A9B
          ROTUntop&                              * 83AA0
          meta*                                  * 83AA5
          over&                                  * 83AAA
          overev&                                * 83AAF
          'x*                                    * 83AB4
          psh1&rev                               * 83AB9
          overev&                                * 83ABE
          top&                                   * 83AC3
          meta/                                  * 83AC8
        ;                                        * 83ACD

* ROMPTR 0F0 01E
* refs (1): 82007
ROMP_0F0_01E:
        ::                                       * 83AD2
          #1-SWAP                                * 83AD7
          pshm1                                  * 83ADC
          pshzerpsharg                           * 83AE1
          SWAPDROP#1-                            * 83AE6
          larg                                   * 83AEB
          dup                                    * 83AF0
          over&                                  * 83AF5
          overev&                                * 83AFA
          'x*                                    * 83AFF
          psh1&rev                               * 83B04
          overev&                                * 83B09
          top&                                   * 83B0E
          meta/                                  * 83B13
        ;                                        * 83B18

* ROMPTR 0F0 01F
* refs (1): 82007
ROMP_0F0_01F:
        ::                                       * 83B1D
          drppargtop&                            * 83B22
          COLA                                   * 83B27
          meta+                                  * 83B2C
        ;                                        * 83B31

* ROMPTR 0F0 020
* refs (1): 82007
ROMP_0F0_020:
        ::                                       * 83B36
          SWAPDROP#1-                            * 83B3B
          metaneg                                * 83B40
          pshzerpsharg                           * 83B45
          top&                                   * 83B4A
          COLA                                   * 83B4F
          meta+                                  * 83B54
        ;                                        * 83B59

* ROMPTR 0F0 021
* refs (1): 82007
ROMP_0F0_021:
        ::                                       * 83B5E
          drppargtop&                            * 83B63
          COLA                                   * 83B68
          meta*                                  * 83B6D
        ;                                        * 83B72

* ROMPTR 0F0 022
* refs (1): 82007
ROMP_0F0_022:
        ::                                       * 83B77
          SWAPDROP#1-                            * 83B7C
          metainv                                * 83B81
          pshzerpsharg                           * 83B86
          top&                                   * 83B8B
          COLA                                   * 83B90
          meta*                                  * 83B95
        ;                                        * 83B9A

* ROMPTR 0F0 023
* refs (1): 82007
ROMP_0F0_023:
        ::                                       * 83B9F
          OBJ_5CA0F                              * 83BA4
          drpmeta-                               * 83BA9
          OBJ_5C9F1                              * 83BAE
        ;                                        * 83BB3

* ROMPTR 0F0 024
* refs (1): 82007
ROMP_0F0_024:
        ::                                       * 83BB8
          OBJ_5CA0F                              * 83BBD
          drpmeta+                               * 83BC2
          OBJ_5C9F1                              * 83BC7
        ;                                        * 83BCC

* ROMPTR 0F0 025
* refs (1): 82007
ROMP_0F0_025:
        ::                                       * 83BD1
          OBJ_5CA0F                              * 83BD6
          drpmeta/                               * 83BDB
          OBJ_5C9F1                              * 83BE0
        ;                                        * 83BE5

* ROMPTR 0F0 026
* refs (1): 82007
ROMP_0F0_026:
        ::                                       * 83BEA
          OBJ_5CA0F                              * 83BEF
          drpmeta*                               * 83BF4
          OBJ_5C9F1                              * 83BF9
        ;                                        * 83BFE

* ROMPTR 0F0 027
* refs (1): 82007
ROMP_0F0_027:
        ::                                       * 83C03
          OBJ_5CA0F                              * 83C08
          PTR     repl:                          * 83C0D
          x^                                     * 83C12
          OBJ_5C9F1                              * 83C17
        ;                                        * 83C1C

* ROMPTR 0F0 028
* refs (1): 82007
ROMP_0F0_028:
        ::                                       * 83C21
          drpmeta-                               * 83C26
          COLA                                   * 83C2B
          OBJ_5CA32                              * 83C30
        ;                                        * 83C35

* ROMPTR 0F0 029
* refs (1): 82007
ROMP_0F0_029:
        ::                                       * 83C3A
          drpmeta+                               * 83C3F
          COLA                                   * 83C44
          OBJ_5CA32                              * 83C49
        ;                                        * 83C4E

* ROMPTR 0F0 02A
* refs (1): 82007
ROMP_0F0_02A:
        ::                                       * 83C53
          drpmeta/                               * 83C58
          COLA                                   * 83C5D
          OBJ_5CA32                              * 83C62
        ;                                        * 83C67

* ROMPTR 0F0 02C
* refs (2): 82007 82007
ROMP_0F0_02C:
        ::                                       * 83C6C
          drpmeta*                               * 83C71
          COLA                                   * 83C76
          OBJ_5CA32                              * 83C7B
        ;                                        * 83C80

* ROMPTR 0F0 02E
* refs (2): 82007 82007
ROMP_0F0_02E:
        ::                                       * 83C85
          pargop                                 * 83C8A
          metainv                                * 83C8F
          pshtop&                                * 83C94
          drpmeta*                               * 83C99
          OBJ_5CA50                              * 83C9E
          metainv                                * 83CA3
        ;                                        * 83CA8

* ROMPTR 0F0 02F
* refs (1): 82007
ROMP_0F0_02F:
        ::                                       * 83CAD
          OBJ_5CA50                              * 83CB2
          COLA                                   * 83CB7
          drpmeta*                               * 83CBC
        ;                                        * 83CC1

* ROMPTR 0F0 030
* refs (1): 82007
ROMP_0F0_030:
        ::                                       * 83CC6
          OBJ_5CA50                              * 83CCB
          COLA                                   * 83CD0
          drpmeta/                               * 83CD5
        ;                                        * 83CDA

* ROMPTR 0F0 031
* refs (1): 82007
ROMP_0F0_031:
        ::                                       * 83CDF
          OBJ_5CAA5                              * 83CE4
          COLA                                   * 83CE9
          drpmeta*                               * 83CEE
        ;                                        * 83CF3

* ROMPTR 0F0 032
* refs (1): 82007
ROMP_0F0_032:
        ::                                       * 83CF8
          OBJ_5CAA5                              * 83CFD
          COLA                                   * 83D02
          drpmeta/                               * 83D07
        ;                                        * 83D0C

* ROMPTR 0F0 033
* refs (1): 82007
ROMP_0F0_033:
        ::                                       * 83D11
          OBJ_5CAA5                              * 83D16
          COLA                                   * 83D1B
          drpmeta+                               * 83D20
        ;                                        * 83D25

* ROMPTR 0F0 034
* refs (1): 82007
ROMP_0F0_034:
        ::                                       * 83D2A
          OBJ_5CAA5                              * 83D2F
          COLA                                   * 83D34
          drpmeta-                               * 83D39
        ;                                        * 83D3E

* ROMPTR 0F0 036
* refs (2): 82007 82007
ROMP_0F0_036:
        ::                                       * 83D43
          SWAPDROP#1-                            * 83D48
          metaneglft                             * 83D4D
        ;                                        * 83D52

* ROMPTR 0F0 037
* refs (1): 82007
ROMP_0F0_037:
        ::                                       * 83D57
          SWAPDROP#1-                            * 83D5C
          COLA                                   * 83D61
          metainvlft                             * 83D66
        ;                                        * 83D6B

* ROMPTR 0F0 039
* refs (2): 82007 82007
ROMP_0F0_039:
        ::                                       * 83D70
          SWAPDROP#1-                            * 83D75
          #1-SWAP                                * 83D7A
          pshm1                                  * 83D7F
          metaneg                                * 83D84
          COLA                                   * 83D89
          pshtop&                                * 83D8E
        ;                                        * 83D93

* ROMPTR 0F0 03A
* refs (1): 82007
ROMP_0F0_03A:
        ::                                       * 83D98
          [f(X,Y)]=>[INV(X)/Y]!                  * 83D9D
          PTR     addt:                          * 83DA2
          xINV                                   * 83DA7
        ;                                        * 83DAC

* ROMPTR 0F0 03B
* refs (1): 82007
ROMP_0F0_03B:
        ::                                       * 83DB1
          [f(X,Y)]=>[INV(X)*Y]!                  * 83DB6
          PTR     addt:                          * 83DBB
          xINV                                   * 83DC0
        ;                                        * 83DC5

* ROMPTR 0F0 03D
* refs (2): 82007 82007
ROMP_0F0_03D:
        ::                                       * 83DCA
          #1-SWAP                                * 83DCF
          pshm1                                  * 83DD4
          metaneg                                * 83DD9
          pshtop&                                * 83DDE
          PTR     addt:                          * 83DE3
          xINV                                   * 83DE8
        ;                                        * 83DED

* ROMPTR 0F0 03E
* refs (1): 82007
ROMP_0F0_03E:
        ::                                       * 83DF2
          metainvlft                             * 83DF7
          addtNEG                                * 83DFC
        ;                                        * 83E01

* ROMPTR 0F0 040
* refs (2): 82007 82007
ROMP_0F0_040:
        ::                                       * 83E06
          metaneglft                             * 83E0B
          addtNEG                                * 83E10
        ;                                        * 83E15

* ROMPTR 0F0 041
* refs (1): 82007
ROMP_0F0_041:
        ::                                       * 83E1A
          [f(X,Y)]=>[-X-Y]!                      * 83E1F
          addtNEG                                * 83E24
        ;                                        * 83E29

* ROMPTR 0F0 042
* refs (1): 82007
ROMP_0F0_042:
        ::                                       * 83E2E
          [f(X,Y)]=>[-X+Y]!                      * 83E33
          addtNEG                                * 83E38
        ;                                        * 83E3D

* ROMPTR 0F0 043
* refs (1): 82007
ROMP_0F0_043:
        ::                                       * 83E42
          OBJ_5CAE1                              * 83E47
          PTR     repl:                          * 83E4C
          x^                                     * 83E51
        ;                                        * 83E56

* ROMPTR 0F0 044
* refs (1): 82007
ROMP_0F0_044:
        ::                                       * 83E5B
          OBJ_5CAE1                              * 83E60
          SWAPDROP#1-                            * 83E65
          metainv                                * 83E6A
          PTR     addt:                          * 83E6F
          x^                                     * 83E74
        ;                                        * 83E79

* ROMPTR 0F0 045
* refs (1): 82007
ROMP_0F0_045:
        ::                                       * 83E7E
          drpmeta*                               * 83E83
          COLA                                   * 83E88
          OBJ_5CAE1                              * 83E8D
        ;                                        * 83E92

* ROMPTR 0F0 046
* refs (1): 82007
ROMP_0F0_046:
        ::                                       * 83E97
          OBJ_5CAE1                              * 83E9C
          COLA                                   * 83EA1
          drpmeta*                               * 83EA6
        ;                                        * 83EAB

* ROMPTR 0F0 047
* refs (1): 82007
ROMP_0F0_047:
        ::                                       * 83EB0
          PTR     repl:                          * 83EB5
          x^                                     * 83EBA
          COLA                                   * 83EBF
          OBJ_5CAE1                              * 83EC4
        ;                                        * 83EC9

* ROMPTR 0F0 048
* refs (1): 82007
ROMP_0F0_048:
        ::                                       * 83ECE
          SWAPDROP#1-                            * 83ED3
          metainv                                * 83ED8
          PTR     addt:                          * 83EDD
          x^                                     * 83EE2
          COLA                                   * 83EE7
          OBJ_5CAE1                              * 83EEC
        ;                                        * 83EF1

* ROMPTR 0F0 04A
* refs (2): 82007 82007
ROMP_0F0_04A:
        ::                                       * 83EF6
          dup                                    * 83EFB
          OBJ_5FC65                              * 83F00
          OBJ_5CAFF                              * 83F05
          ?SKIP                                  * 83F0A
          ::                                     * 83F0F
            psh                                  * 83F14
            DoBadKey                             * 83F19
          ;                                      * 83F1E
          psh                                    * 83F23
          NDROP                                  * 83F28
        ;                                        * 83F2D

* ROMPTR 0F0 04B
* refs (1): 82007
ROMP_0F0_04B:
        ::                                       * 83F32
          M1st*case                              * 83F37
          ROMPTR  0F0 04C                        * 83F3C
          M1st/case                              * 83F47
          ::                                     * 83F4C
            ROMPTR  0F0 04D                      * 83F51
            ROMPTR  0F0 04C                      * 83F5C
          ;                                      * 83F67
          PTR     addt2:                         * 83F6C
          %1                                     * 83F71
          x*                                     * 83F76
          ROMPTR  0F0 04C                        * 83F7B
        ;                                        * 83F86

* ROMPTR 0F0 04C
* refs (1): 82007
ROMP_0F0_04C:
        ::                                       * 83F8B
          pargop                                 * 83F90
          M-1stcasechs                           * 83F95
          ::                                     * 83F9A
            pshtop&                              * 83F9F
            addtNEG                              * 83FA4
            ROTSWAP                              * 83FA9
          ;                                      * 83FAE
          pshtop&                                * 83FB3
        ;                                        * 83FB8

* ROMPTR 0F0 04D
* refs (1): 82007
ROMP_0F0_04D:
        ::                                       * 83FBD
          SWAPDROP#1-                            * 83FC2
          metainv                                * 83FC7
          addt*                                  * 83FCC
        ;                                        * 83FD1

* ROMPTR 0F0 04E
* refs (1): 82007
ROMP_0F0_04E:
        ::                                       * 83FD6
          drpmeta+                               * 83FDB
          OBJ_5CAFF                              * 83FE0
          ?SEMI                                  * 83FE5
          drpmeta*                               * 83FEA
          DoBadKey                               * 83FEF
        ;                                        * 83FF4

* ROMPTR 0F0 04F
* refs (1): 82007
ROMP_0F0_04F:
        ::                                       * 83FF9
          drpmeta-                               * 83FFE
          OBJ_5CAFF                              * 84003
          ?SEMI                                  * 84008
          drpmeta/                               * 8400D
          DoBadKey                               * 84012
        ;                                        * 84017

* ROMPTR 0F0 050
* refs (1): 82007
ROMP_0F0_050:
        ::                                       * 8401C
          drpmeta+                               * 84021
          OBJ_5CB7C                              * 84026
          DROP                                   * 8402B
        ;                                        * 84030

* ROMPTR 0F0 051
* refs (1): 82007
ROMP_0F0_051:
        ::                                       * 84035
          drpmeta-                               * 8403A
          OBJ_5CB7C                              * 8403F
          DROP                                   * 84044
        ;                                        * 84049

* ROMPTR 0F0 052
* refs (1): 82007
ROMP_0F0_052:
        ::                                       * 8404E
          drpmeta*                               * 84053
          OBJ_5CB7C                              * 84058
          DROP                                   * 8405D
        ;                                        * 84062

* ROMPTR 0F0 053
* refs (1): 82007
ROMP_0F0_053:
        ::                                       * 84067
          drpmeta/                               * 8406C
          OBJ_5CB7C                              * 84071
          DROP                                   * 84076
        ;                                        * 8407B

* ROMPTR 0F0 054
* refs (1): 82007
ROMP_0F0_054:
        ::                                       * 84080
          OBJ_5CB7C                              * 84085
          ?SEMI                                  * 8408A
          DoBadKey                               * 8408F
        ;                                        * 84094

* ROMPTR 0F0 055
* refs (1): 82007
ROMP_0F0_055:
        ::                                       * 84099
          plDRPpZparg                            * 8409E
          forceadd                               * 840A3
          OBJ_5D2CB                              * 840A8
          4roll                                  * 840AD
          OBJ_5D1B2                              * 840B2
          OBJ_5D302                              * 840B7
          4roll                                  * 840BC
          psh                                    * 840C1
          5unroll                                * 840C6
          over&                                  * 840CB
          pshtop&                                * 840D0
          top&                                   * 840D5
          top&                                   * 840DA
          top&                                   * 840DF
          meta+                                  * 840E4
        ;                                        * 840E9

* ROMPTR 0F0 056
* refs (1): 82007
ROMP_0F0_056:
        ::                                       * 840EE
          plDRPpZparg                            * 840F3
          OBJ_5D339                              * 840F8
          OBJ_5D542                              * 840FD
          4roll                                  * 84102
          OBJ_5D429                              * 84107
          OBJ_5D579                              * 8410C
          4roll                                  * 84111
          psh                                    * 84116
          5unroll                                * 8411B
          over&                                  * 84120
          pshtop&                                * 84125
          top&                                   * 8412A
          top&                                   * 8412F
          top&                                   * 84134
          meta*                                  * 84139
        ;                                        * 8413E

* ROMPTR 0F0 057
* refs (1): 82007
ROMP_0F0_057:
        ::                                       * 84143
          OBJ_5D799                              * 84148
          rotswap                                * 8414D
          OBJ_5D721                              * 84152
          x+                                     * 84157
          x-                                     * 8415C
          OBJ_5D7CC                              * 84161
        ;                                        * 84166

* ROMPTR 0F0 058
* refs (1): 82007
ROMP_0F0_058:
        ::                                       * 8416B
          OBJ_5D7F4                              * 84170
          rotswap                                * 84175
          OBJ_5D721                              * 8417A
          x*                                     * 8417F
          x/                                     * 84184
          OBJ_5D7CC                              * 84189
        ;                                        * 8418E

* ROMPTR 0F0 059
* refs (1): 82007
ROMP_0F0_059:
        ::                                       * 84193
          OBJ_5D831                              * 84198
          x+                                     * 8419D
          x-                                     * 841A2
          NOTcase                                * 841A7
          OBJ_5DB33                              * 841AC
          AEQ1stcase                             * 841B1
          x=                                     * 841B6
          NOP                                    * 841BB
          #1-SWAP                                * 841C0
          dvarlsBIND                             * 841C5
          larg                                   * 841CA
          OBJ_5D8C7                              * 841CF
          x+                                     * 841D4
          x-                                     * 841D9
          rot                                    * 841DE
          forceadd                               * 841E3
          ::                                     * 841E8
            M1st+case                            * 841ED
            NOP                                  * 841F2
            RDROP                                * 841F7
            OBJ_5DA75                            * 841FC
            4roll                                * 84201
            top&                                 * 84206
            unrot                                * 8420B
          ;                                      * 84210
          SWAPDROP#1-                            * 84215
          4roll                                  * 8421A
          pshtop&                                * 8421F
          pshzerpsharg                           * 84224
          4unroll                                * 84229
          OBJ_5DA75                              * 8422E
          meta+                                  * 84233
          4roll                                  * 84238
          top&                                   * 8423D
          unrot                                  * 84242
        ;                                        * 84247

* ROMPTR 0F0 05A
* refs (1): 82007
ROMP_0F0_05A:
        ::                                       * 8424C
          OBJ_5D831                              * 84251
          x*                                     * 84256
          x/                                     * 8425B
          NOTcase                                * 84260
          OBJ_5DB33                              * 84265
          AEQ1stcase                             * 8426A
          x=                                     * 8426F
          NOP                                    * 84274
          #1-SWAP                                * 84279
          dvarlsBIND                             * 8427E
          larg                                   * 84283
          OBJ_5D8C7                              * 84288
          x*                                     * 8428D
          x/                                     * 84292
          rot                                    * 84297
          OBJ_5D339                              * 8429C
          ::                                     * 842A1
            M1st*case                            * 842A6
            NOP                                  * 842AB
            RDROP                                * 842B0
            OBJ_5DAD4                            * 842B5
            4roll                                * 842BA
            top&                                 * 842BF
            unrot                                * 842C4
          ;                                      * 842C9
          SWAPDROP#1-                            * 842CE
          4roll                                  * 842D3
          pshtop&                                * 842D8
          pshzerpsharg                           * 842DD
          4unroll                                * 842E2
          OBJ_5DAD4                              * 842E7
          meta*                                  * 842EC
          4roll                                  * 842F1
          top&                                   * 842F6
          unrot                                  * 842FB
        ;                                        * 84300

* ROMPTR 0F0 05B
* refs (1): 82007
ROMP_0F0_05B:
        ::                                       * 84305
          OBJ_5D84A                              * 8430A
          x+                                     * 8430F
          x-                                     * 84314
          NOTcase                                * 84319
          OBJ_5DCBE                              * 8431E
          AEQ1stcase                             * 84323
          x=                                     * 84328
          NOP                                    * 8432D
          #1-SWAP                                * 84332
          dvarlsBIND                             * 84337
          pshzerpsharg                           * 8433C
          OBJ_5D999                              * 84341
          x+                                     * 84346
          x-                                     * 8434B
          rot                                    * 84350
          OBJ_5D1B2                              * 84355
          ::                                     * 8435A
            M1st+case                            * 8435F
            NOP                                  * 84364
            RDROP                                * 84369
            OBJ_5DB56                            * 8436E
          ;                                      * 84373
          pargop                                 * 84378
          psh                                    * 8437D
          1GETLAM                                * 84382
          '                                      * 84387
          x+                                     * 8438C
          EQ                                     * 84391
          ?SKIP                                  * 84396
          drpmeta-                               * 8439B
          BINT5                                  * 843A0
          N+1roll                                * 843A5
          top&                                   * 843AA
          5unroll                                * 843AF
          OBJ_5DB56                              * 843B4
        ;                                        * 843B9

* ROMPTR 0F0 05C
* refs (1): 82007
ROMP_0F0_05C:
        ::                                       * 843BE
          OBJ_5D84A                              * 843C3
          x*                                     * 843C8
          x/                                     * 843CD
          NOTcase                                * 843D2
          OBJ_5DCBE                              * 843D7
          AEQ1stcase                             * 843DC
          x=                                     * 843E1
          NOP                                    * 843E6
          #1-SWAP                                * 843EB
          dvarlsBIND                             * 843F0
          pshzerpsharg                           * 843F5
          OBJ_5D999                              * 843FA
          x*                                     * 843FF
          x/                                     * 84404
          rot                                    * 84409
          OBJ_5D429                              * 8440E
          ::                                     * 84413
            M1st*case                            * 84418
            NOP                                  * 8441D
            RDROP                                * 84422
            OBJ_5DC0A                            * 84427
          ;                                      * 8442C
          pargop                                 * 84431
          psh                                    * 84436
          1GETLAM                                * 8443B
          '                                      * 84440
          x*                                     * 84445
          EQ                                     * 8444A
          ?SKIP                                  * 8444F
          drpmeta/                               * 84454
          BINT5                                  * 84459
          N+1roll                                * 8445E
          top&                                   * 84463
          5unroll                                * 84468
          OBJ_5DC0A                              * 8446D
        ;                                        * 84472

* ROMPTR 0F0 05D
* refs (1): 82007
ROMP_0F0_05D:
        ::                                       * 84477
          #1-SWAP                                * 8447C
          dvarlsBIND                             * 84481
          larg                                   * 84486
          1GETABND                               * 8448B
          '                                      * 84490
          x+                                     * 84495
          EQ                                     * 8449A
          ?SKIP                                  * 8449F
          [X]=>[NEG(X)]!                         * 844A4
          OBJ_5D1B2                              * 844A9
          psh                                    * 844AE
          forceadd                               * 844B3
          OBJ_5D2CB                              * 844B8
          4roll                                  * 844BD
          OBJ_5D302                              * 844C2
          over&                                  * 844C7
          psh                                    * 844CC
          over&                                  * 844D1
          psh                                    * 844D6
          meta+                                  * 844DB
          rot                                    * 844E0
          top&                                   * 844E5
          psh                                    * 844EA
          over&                                  * 844EF
          over&                                  * 844F4
          rot                                    * 844F9
          top&                                   * 844FE
          psh                                    * 84503
          larg                                   * 84508
        ;                                        * 8450D

* ROMPTR 0F0 05E
* refs (1): 82007
ROMP_0F0_05E:
        ::                                       * 84512
          #1-SWAP                                * 84517
          dvarlsBIND                             * 8451C
          larg                                   * 84521
          1GETABND                               * 84526
          '                                      * 8452B
          x*                                     * 84530
          EQ                                     * 84535
          ?SKIP                                  * 8453A
          [X]=>[INV(X)]!                         * 8453F
          OBJ_5D429                              * 84544
          psh                                    * 84549
          OBJ_5D339                              * 8454E
          OBJ_5D542                              * 84553
          4roll                                  * 84558
          OBJ_5D579                              * 8455D
          over&                                  * 84562
          psh                                    * 84567
          over&                                  * 8456C
          psh                                    * 84571
          meta*                                  * 84576
          rot                                    * 8457B
          top&                                   * 84580
          psh                                    * 84585
          over&                                  * 8458A
          over&                                  * 8458F
          rot                                    * 84594
          top&                                   * 84599
          psh                                    * 8459E
          larg                                   * 845A3
        ;                                        * 845A8

* ROMPTR 0F0 061
* refs (3): 82007 82007 82007
ROMP_0F0_061:
        ::                                       * 845AD
          #1-SWAP                                * 845B2
          dvarlsBIND                             * 845B7
          #1-SWAP                                * 845BC
          pshm1                                  * 845C1
          larg                                   * 845C6
          1GETLAM                                * 845CB
          SWAP#1+                                * 845D0
          psh                                    * 845D5
          1GETABND                               * 845DA
          OVER                                   * 845DF
          #0=                                    * 845E4
          ITE                                    * 845E9
          DROP                                   * 845EE
          SWAP#1+                                * 845F3
          pshtop&                                * 845F8
          pshtop&                                * 845FD
        ;                                        * 84602

* ROMPTR 0F0 062
* refs (1): 82007
ROMP_0F0_062:
        ::                                       * 84607
          #2-                                    * 8460C
          ROTROT2DROP                            * 84611
          larg                                   * 84616
          dup                                    * 8461B
          PTR     addt:                          * 84620
          xRE                                    * 84625
          meta*                                  * 8462A
          psh                                    * 8462F
          PTR     addt:                          * 84634
          xIM                                    * 84639
          meta*                                  * 8463E
          rot                                    * 84643
          dup                                    * 84648
          PTR     addt:                          * 8464D
          xRE                                    * 84652
          psh                                    * 84657
          PTR     addt:                          * 8465C
          xIM                                    * 84661
        ;                                        * 84666

* ROMPTR 0F0 063
* refs (1): 82007
ROMP_0F0_063:
        ::                                       * 8466B
          SWAPDROP#1-                            * 84670
          Add180ã/*[_]                           * 84675
          Addi*[_]                               * 8467A
          drpmeta/                               * 8467F
          dup                                    * 84684
          PTR     addt:                          * 84689
          xCOS                                   * 8468E
          psh                                    * 84693
          PTR     addt:                          * 84698
          xSIN                                   * 8469D
          top&                                   * 846A2
          Addi*[_]                               * 846A7
          meta+                                  * 846AC
        ;                                        * 846B1

* ROMPTR 0F0 064
* refs (1): 82007
ROMP_0F0_064:
        ::                                       * 846B6
          SWAPDROP#1-                            * 846BB
          Addã180/*i[_]                          * 846C0
          dup                                    * 846C5
          metaneg                                * 846CA
          PTR     2psh1&rev:                     * 846CF
          xEXP                                   * 846D4
          top&                                   * 846D9
          {                                      * 846DE
            x-                                   * 846E3
            %2                                   * 846E8
            xi                                   * 846ED
            x*                                   * 846F2
            x/                                   * 846F7
          }                                      * 846FC
          INNERtop&                              * 84701
        ;                                        * 84706

* ROMPTR 0F0 065
* refs (1): 82007
ROMP_0F0_065:
        ::                                       * 8470B
          SWAPDROP#1-                            * 84710
          Addã180/*i[_]                          * 84715
          dup                                    * 8471A
          metaneg                                * 8471F
          PTR     2psh1&rev:                     * 84724
          xEXP                                   * 84729
          top&                                   * 8472E
          {                                      * 84733
            x+                                   * 84738
            %2                                   * 8473D
            x/                                   * 84742
          }                                      * 84747
          INNERtop&                              * 8474C
        ;                                        * 84751

* ROMPTR 0F0 066
* refs (1): 82007
ROMP_0F0_066:
        ::                                       * 84756
          SWAPDROP#1-                            * 8475B
          Addã180/*i[_]                          * 84760
          {                                      * 84765
            %2                                   * 8476A
            x*                                   * 8476F
            xEXP                                 * 84774
            %1                                   * 84779
            x-                                   * 8477E
          }                                      * 84783
          INNERtop&                              * 84788
          dup                                    * 8478D
          drpmeta+                               * 84792
          top&                                   * 84797
          {                                      * 8479C
            xi                                   * 847A1
            x*                                   * 847A6
            x/                                   * 847AB
          }                                      * 847B0
          INNERtop&                              * 847B5
        ;                                        * 847BA

* ROMPTR 0F0 067
* refs (1): 82007
ROMP_0F0_067:
        ::                                       * 847BF
          SWAPDROP#1-                            * 847C4
          dup                                    * 847C9
          {                                      * 847CE
            xi                                   * 847D3
            xNEG                                 * 847D8
            %1                                   * 847DD
          }                                      * 847E2
          INNERCOMP                              * 847E7
          pshtop&                                * 847EC
          {2,^,-,û,I}                            * 847F1
          INNERtop&                              * 847F6
          pshtop&                                * 847FB
          {                                      * 84800
            x*                                   * 84805
            x+                                   * 8480A
            xLN                                  * 8480F
            x*                                   * 84814
          }                                      * 84819
          INNERtop&                              * 8481E
          Add180ã/*[_]                           * 84823
        ;                                        * 84828

* ROMPTR 0F0 068
* refs (1): 82007
ROMP_0F0_068:
        ::                                       * 8482D
          SWAPDROP#1-                            * 84832
          dup                                    * 84837
          {                                      * 8483C
            xPI                                  * 84841
            %2                                   * 84846
            x/                                   * 8484B
            xi                                   * 84850
            %1                                   * 84855
          }                                      * 8485A
          INNERCOMP                              * 8485F
          pshtop&                                * 84864
          {2,^,-,û,I}                            * 84869
          INNERtop&                              * 8486E
          pshtop&                                * 84873
          {                                      * 84878
            x*                                   * 8487D
            x+                                   * 84882
            xLN                                  * 84887
            x*                                   * 8488C
            x+                                   * 84891
          }                                      * 84896
          INNERtop&                              * 8489B
          Add180ã/*[_]                           * 848A0
        ;                                        * 848A5

* ROMPTR 0F0 069
* refs (1): 82007
ROMP_0F0_069:
        ::                                       * 848AA
          SWAPDROP#1-                            * 848AF
          dup                                    * 848B4
          {                                      * 848B9
            xi                                   * 848BE
            xNEG                                 * 848C3
            %1                                   * 848C8
            xi                                   * 848CD
          }                                      * 848D2
          INNERCOMP                              * 848D7
          pshtop&                                * 848DC
          {                                      * 848E1
            x*                                   * 848E6
            x+                                   * 848EB
            %1                                   * 848F0
          }                                      * 848F5
          INNERtop&                              * 848FA
          pshtop&                                * 848FF
          {                                      * 84904
            %2                                   * 84909
            x^                                   * 8490E
            x+                                   * 84913
            xSQRT                                * 84918
            x/                                   * 8491D
            xLN                                  * 84922
            x*                                   * 84927
          }                                      * 8492C
          INNERtop&                              * 84931
          Add180ã/*[_]                           * 84936
        ;                                        * 8493B

* ROMPTR 0F0 06A
* refs (1): 82007
ROMP_0F0_06A:
        ::                                       * 84940
          SWAPDROP#1-                            * 84945
          Add180ã/*[_]                           * 8494A
          {                                      * 8494F
            xi                                   * 84954
            x*                                   * 84959
            xSIN                                 * 8495E
            xi                                   * 84963
            x*                                   * 84968
            xNEG                                 * 8496D
          }                                      * 84972
          INNERtop&                              * 84977
        ;                                        * 8497C

* ROMPTR 0F0 06B
* refs (1): 82007
ROMP_0F0_06B:
        ::                                       * 84981
          SWAPDROP#1-                            * 84986
          Add180ã/*[_]                           * 8498B
          {                                      * 84990
            xi                                   * 84995
            x*                                   * 8499A
            xCOS                                 * 8499F
          }                                      * 849A4
          INNERtop&                              * 849A9
        ;                                        * 849AE

* ROMPTR 0F0 06C
* refs (1): 82007
ROMP_0F0_06C:
        ::                                       * 849B3
          SWAPDROP#1-                            * 849B8
          Add180ã/*[_]                           * 849BD
          {                                      * 849C2
            xi                                   * 849C7
            x*                                   * 849CC
            xTAN                                 * 849D1
            xi                                   * 849D6
            xNEG                                 * 849DB
            x*                                   * 849E0
          }                                      * 849E5
          INNERtop&                              * 849EA
        ;                                        * 849EF

* ROMPTR 0F0 06D
* refs (1): 82007
ROMP_0F0_06D:
        ::                                       * 849F4
          SWAPDROP#1-                            * 849F9
          dup                                    * 849FE
          %1                                     * 84A03
          psh1&                                  * 84A08
          {                                      * 84A0D
            %2                                   * 84A12
            x^                                   * 84A17
            x+                                   * 84A1C
            xSQRT                                * 84A21
          }                                      * 84A26
          INNERCOMP                              * 84A2B
          pshtop&                                * 84A30
          top&                                   * 84A35
          {                                      * 84A3A
            x-                                   * 84A3F
            xLN                                  * 84A44
            xNEG                                 * 84A49
          }                                      * 84A4E
          INNERtop&                              * 84A53
        ;                                        * 84A58

* ROMPTR 0F0 06E
* refs (1): 82007
ROMP_0F0_06E:
        ::                                       * 84A5D
          SWAPDROP#1-                            * 84A62
          dup                                    * 84A67
          {                                      * 84A6C
            xPI                                  * 84A71
            %2                                   * 84A76
            x/                                   * 84A7B
            xi                                   * 84A80
            %1                                   * 84A85
          }                                      * 84A8A
          INNERCOMP                              * 84A8F
          pshtop&                                * 84A94
          {2,^,-,û,I}                            * 84A99
          INNERtop&                              * 84A9E
          pshtop&                                * 84AA3
          {                                      * 84AA8
            x*                                   * 84AAD
            x+                                   * 84AB2
            xLN                                  * 84AB7
            x*                                   * 84ABC
            x+                                   * 84AC1
            %2                                   * 84AC6
            x^                                   * 84ACB
            xNEG                                 * 84AD0
            xSQRT                                * 84AD5
          }                                      * 84ADA
          INNERtop&                              * 84ADF
        ;                                        * 84AE4

* ROMPTR 0F0 06F
* refs (1): 82007
ROMP_0F0_06F:
        ::                                       * 84AE9
          SWAPDROP#1-                            * 84AEE
          %1                                     * 84AF3
          pshm1                                  * 84AF8
          top&                                   * 84AFD
          dup                                    * 84B02
          '                                      * 84B07
          x-                                     * 84B0C
          psh1&rev                               * 84B11
          top&                                   * 84B16
          {                                      * 84B1B
            %2                                   * 84B20
            x^                                   * 84B25
            x-                                   * 84B2A
            xSQRT                                * 84B2F
            x/                                   * 84B34
            xLN                                  * 84B39
            xNEG                                 * 84B3E
          }                                      * 84B43
          INNERtop&                              * 84B48
        ;                                        * 84B4D

* ROMPTR 0F0 070
* refs (1): 82007
ROMP_0F0_070:
        ::                                       * 84B52
          SWAPDROP#1-                            * 84B57
          #1-SWAP                                * 84B5C
          pshm1                                  * 84B61
          pshzerpsharg                           * 84B66
          dup                                    * 84B6B
          PTR     addt:                          * 84B70
          xSIN                                   * 84B75
          unrot                                  * 84B7A
          PTR     addt:                          * 84B7F
          xCOS                                   * 84B84
          psh                                    * 84B89
          dup                                    * 84B8E
          PTR     addt2:                         * 84B93
          xSIN                                   * 84B98
          x*                                     * 84B9D
          psh&                                   * 84BA2
          PTR     addt2:                         * 84BA7
          xCOS                                   * 84BAC
          x*                                     * 84BB1
          pshtop&                                * 84BB6
          top&                                   * 84BBB
          pshtop&                                * 84BC0
        ;                                        * 84BC5

* ROMPTR 0F0 071
* refs (1): 82007
ROMP_0F0_071:
        ::                                       * 84BCA
          SWAPDROP#1-                            * 84BCF
          #1-SWAP                                * 84BD4
          pshm1                                  * 84BD9
          pshzerpsharg                           * 84BDE
          dup                                    * 84BE3
          PTR     addt:                          * 84BE8
          xCOS                                   * 84BED
          unrot                                  * 84BF2
          PTR     addt:                          * 84BF7
          xSIN                                   * 84BFC
          psh                                    * 84C01
          dup                                    * 84C06
          PTR     addt2:                         * 84C0B
          xSIN                                   * 84C10
          x*                                     * 84C15
          psh&                                   * 84C1A
          PTR     addt2:                         * 84C1F
          xCOS                                   * 84C24
          x*                                     * 84C29
          pshtop&                                * 84C2E
          top&                                   * 84C33
          psh                                    * 84C38
          DROP                                   * 84C3D
          REQcasedrop                            * 84C42
          x+                                     * 84C47
          meta-                                  * 84C4C
          DROP                                   * 84C51
          meta+                                  * 84C56
        ;                                        * 84C5B

* ROMPTR 0F0 072
* refs (1): 82007
ROMP_0F0_072:
        ::                                       * 84C60
          ROTSWAP                                * 84C65
          pargop                                 * 84C6A
          PTR     addt:                          * 84C6F
          xTAN                                   * 84C74
          pshtop&                                * 84C79
          dup                                    * 84C7E
          %1                                     * 84C83
          psh1&rev                               * 84C88
          top&                                   * 84C8D
          PTR     addt:                          * 84C92
          x*                                     * 84C97
          ROTSWAP                                * 84C9C
          #1-SWAP                                * 84CA1
          ::                                     * 84CA6
            REQcasedrop                          * 84CAB
            x+                                   * 84CB0
            meta-                                * 84CB5
            DROP                                 * 84CBA
            meta+                                * 84CBF
          ;                                      * 84CC4
          meta/                                  * 84CC9
        ;                                        * 84CCE

* ROMPTR 0F0 073
* refs (1): 82007
ROMP_0F0_073:
        ::                                       * 84CD3
          SWAPDROP#1-                            * 84CD8
          #1-SWAP                                * 84CDD
          pshm1                                  * 84CE2
          pshzerpsharg                           * 84CE7
          dup                                    * 84CEC
          PTR     addt:                          * 84CF1
          xSINH                                  * 84CF6
          unrot                                  * 84CFB
          PTR     addt:                          * 84D00
          xCOSH                                  * 84D05
          psh                                    * 84D0A
          dup                                    * 84D0F
          PTR     addt2:                         * 84D14
          xSINH                                  * 84D19
          x*                                     * 84D1E
          psh&                                   * 84D23
          PTR     addt2:                         * 84D28
          xCOSH                                  * 84D2D
          x*                                     * 84D32
          pshtop&                                * 84D37
          top&                                   * 84D3C
          pshtop&                                * 84D41
        ;                                        * 84D46

* ROMPTR 0F0 074
* refs (1): 82007
ROMP_0F0_074:
        ::                                       * 84D4B
          SWAPDROP#1-                            * 84D50
          #1-SWAP                                * 84D55
          pshm1                                  * 84D5A
          pshzerpsharg                           * 84D5F
          dup                                    * 84D64
          PTR     addt:                          * 84D69
          xCOSH                                  * 84D6E
          unrot                                  * 84D73
          PTR     addt:                          * 84D78
          xSINH                                  * 84D7D
          psh                                    * 84D82
          dup                                    * 84D87
          PTR     addt2:                         * 84D8C
          xSINH                                  * 84D91
          x*                                     * 84D96
          psh&                                   * 84D9B
          PTR     addt2:                         * 84DA0
          xCOSH                                  * 84DA5
          x*                                     * 84DAA
          pshtop&                                * 84DAF
          top&                                   * 84DB4
          pshtop&                                * 84DB9
        ;                                        * 84DBE

* ROMPTR 0F0 075
* refs (1): 82007
ROMP_0F0_075:
        ::                                       * 84DC3
          ROTSWAP                                * 84DC8
          pargop                                 * 84DCD
          PTR     addt:                          * 84DD2
          xTANH                                  * 84DD7
          pshtop&                                * 84DDC
          dup                                    * 84DE1
          %1                                     * 84DE6
          psh1&rev                               * 84DEB
          top&                                   * 84DF0
          PTR     addt:                          * 84DF5
          x*                                     * 84DFA
          ROTSWAP                                * 84DFF
          meta/                                  * 84E04
        ;                                        * 84E09

* ROMPTR 0F0 076
* refs (1): 82007
ROMP_0F0_076:
        ::                                       * 84E0E
          OBJ_6AFF0                              * 84E13
          DUPTYPESYMB?                           * 84E18
          NOTcase                                * 84E1D
          EXPLODE                                * 84E22
          OBJ_6A95B                              * 84E27
          DEPTH                                  * 84E2C
          OBJ_677EA                              * 84E31
          '                                      * 84E36
          NULLLAM                                * 84E3B
          CACHE                                  * 84E40
          SYMCOLCT                               * 84E45
          OBJ_6B28C                              * 84E4A
          NOTcase                                * 84E4F
          INVDEFERR                              * 84E54
          '                                      * 84E59
          NULLLAM                                * 84E5E
          DUMP                                   * 84E63
          DROP                                   * 84E68
          ABND                                   * 84E6D
          DEPTH                                  * 84E72
          #1-                                    * 84E77
          #<>case                                * 84E7C
          ARGNUMERR                              * 84E81
          OBJ_6AE6F                              * 84E86
          EXPLODE                                * 84E8B
        ;                                        * 84E90

* ROMPTR 0F0 077
* refs (1): 82007
ROMP_0F0_077:
        ::                                       * 84E95
          3PICK                                  * 84E9A
          CARCOMP                                * 84E9F
          NOTROMPcase                            * 84EA4
          OBJ_5A095                              * 84EA9
          DUPROMPTR@                             * 84EAE
          ?SKIP                                  * 84EB3
          SETROMPERR                             * 84EB8
          SWAP                                   * 84EBD
          OBJ_26F6C                              * 84EC2
          NOTcasedrop                            * 84EC7
          OBJ_5A095                              * 84ECC
          SWAP                                   * 84ED1
          infarg?                                * 84ED6
          SWAPDROP                               * 84EDB
          ITE                                    * 84EE0
          ::                                     * 84EE5
            4ROLL                                * 84EEA
            DROPSWAP                             * 84EEF
            #1-                                  * 84EF4
          ;                                      * 84EF9
          ::                                     * 84EFE
            ROTDROP                              * 84F03
            ROTDROPSWAP                          * 84F08
            #2-                                  * 84F0D
          ;                                      * 84F12
          SWAP                                   * 84F17
          COLA_EVAL                              * 84F1C
        ;                                        * 84F21

* ROMPTR 0F0 078
* refs (1): 82007
ROMP_0F0_078:
        ::                                       * 84F26
          PTR     addt:                          * 84F2B
          xDER                                   * 84F30
          psh                                    * 84F35
          #1+DUP                                 * 84F3A
          top&                                   * 84F3F
          PTR     addt:                          * 84F44
          xWHERE                                 * 84F49
          ::N                                    * 84F4E
          COLA_EVAL                              * 84F53
        ;                                        * 84F58

* ROMPTR 0F0 079
* refs (1): 82007
ROMP_0F0_079:
        ::                                       * 84F5D
          psh                                    * 84F62
          dup                                    * 84F67
          unrot                                  * 84F6C
          psh                                    * 84F71
          #1-SWAP                                * 84F76
          symcomp                                * 84F7B
          psh1&                                  * 84F80
          psh                                    * 84F85
          DUP#1+                                 * 84F8A
          Cr                                     * 84F8F
          xWHERE                                 * 84F94
          pshm1                                  * 84F99
          metaROTDUP                             * 84F9E
          rot                                    * 84FA3
          #1-SWAP                                * 84FA8
          symcomp                                * 84FAD
          psh1&                                  * 84FB2
          psh                                    * 84FB7
          DUP#1+                                 * 84FBC
          Cr                                     * 84FC1
          xWHERE                                 * 84FC6
          BINT1                                  * 84FCB
          unrot                                  * 84FD0
          symbn                                  * 84FD5
          BINT1                                  * 84FDA
          psh                                    * 84FDF
          #1+DUP                                 * 84FE4
          top&                                   * 84FE9
          PTR     addt:                          * 84FEE
          xWHERE                                 * 84FF3
          pshtop&                                * 84FF8
          pshtop&                                * 84FFD
          Cr                                     * 85002
          xIFTE                                  * 85007
          COLA                                   * 8500C
          COMPEVAL                               * 85011
        ;                                        * 85016
