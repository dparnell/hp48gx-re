* HP 48GX ROM revision R, #8998E-#8C9F5: Library part 0F1
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: FUNCTION CONIC
* Follows on from the previous file (at #8998E in the original ROM).
        ENDLENGTH                                * 8998E

        CON(5)  DOLIB                            * 8998E  library object
        LENGTH                                   * 89993  length, to #8D27C
        CON(2)  0                                * 89998  title length

LIB0F1:
        CON(3)  #0F1                             * 8999A  library number
        REL(5)  LIB0F1.hash                      * 8999D  hash table
        CON(5)  0                                * 899A2  message table
        REL(5)  LIB0F1.link                      * 899A7  link table
        CON(5)  0                                * 899AC  config

LIB0F1.hash:
        CON(5)  DOHSTR                           * 899B1  hash table of library 0F1
        LENGTH                                   * 899B6  length, to #89BC7
        CON(5)  0                                * 899BB  names of length 1
        CON(5)  0                                * 899C0  names of length 2
        REL(5)  H0F1.BAR                         * 899C5  names of length 3
        CON(5)  0                                * 899CA  names of length 4
        REL(5)  H0F1.CONIC                       * 899CF  names of length 5
        CON(5)  0                                * 899D4  names of length 6
        REL(5)  H0F1.SCATTER                     * 899D9  names of length 7
        REL(5)  H0F1.FUNCTION                    * 899DE  names of length 8
        REL(5)  H0F1.HISTOGRAM                   * 899E3  names of length 9
        REL(5)  H0F1.PARAMETRIC                  * 899E8  names of length 10
        CON(5)  0                                * 899ED  names of length 11
        CON(5)  0                                * 899F2  names of length 12
        CON(5)  0                                * 899F7  names of length 13
        CON(5)  0                                * 899FC  names of length 14
        CON(5)  0                                * 89A01  names of length 15
        CON(5)  0                                * 89A06  names of length 16
        REL(5)  L_89AA0                          * 89A0B  end of the names
H0F1.BAR:
        CON(2)  3                                * 89A10
        NIBASC  "BAR"                            * 89A12
        CON(3)  #03A                             * 89A18  command
H0F1.CONIC:
        CON(2)  5                                * 89A1B
        NIBASC  "CONIC"                          * 89A1D
        CON(3)  #034                             * 89A27  command
H0F1.POLAR:
        CON(2)  5                                * 89A2A
        NIBASC  "POLAR"                          * 89A2C
        CON(3)  #035                             * 89A36  command
H0F1.TRUTH:
        CON(2)  5                                * 89A39
        NIBASC  "TRUTH"                          * 89A3B
        CON(3)  #037                             * 89A45  command
H0F1.SCATTER:
        CON(2)  7                                * 89A48
        NIBASC  "SCATTER"                        * 89A4A
        CON(3)  #038                             * 89A58  command
H0F1.FUNCTION:
        CON(2)  8                                * 89A5B
        NIBASC  "FUNCTION"                       * 89A5D
        CON(3)  #033                             * 89A6D  command
H0F1.HISTOGRAM:
        CON(2)  9                                * 89A70
        NIBASC  "HISTOGRAM"                      * 89A72
        CON(3)  #039                             * 89A84  command
H0F1.PARAMETRIC:
        CON(2)  10                               * 89A87
        NIBASC  "PARAMETRIC"                     * 89A89
        CON(3)  #036                             * 89A9D  command
L_89AA0:
        CON(5)  0                                * 89AA0  command 000 has no name
        CON(5)  0                                * 89AA5  command 001 has no name
        CON(5)  0                                * 89AAA  command 002 has no name
        CON(5)  0                                * 89AAF  command 003 has no name
        CON(5)  0                                * 89AB4  command 004 has no name
        CON(5)  0                                * 89AB9  command 005 has no name
        CON(5)  0                                * 89ABE  command 006 has no name
        CON(5)  0                                * 89AC3  command 007 has no name
        CON(5)  0                                * 89AC8  command 008 has no name
        CON(5)  0                                * 89ACD  command 009 has no name
        CON(5)  0                                * 89AD2  command 00A has no name
        CON(5)  0                                * 89AD7  command 00B has no name
        CON(5)  0                                * 89ADC  command 00C has no name
        CON(5)  0                                * 89AE1  command 00D has no name
        CON(5)  0                                * 89AE6  command 00E has no name
        CON(5)  0                                * 89AEB  command 00F has no name
        CON(5)  0                                * 89AF0  command 010 has no name
        CON(5)  0                                * 89AF5  command 011 has no name
        CON(5)  0                                * 89AFA  command 012 has no name
        CON(5)  0                                * 89AFF  command 013 has no name
        CON(5)  0                                * 89B04  command 014 has no name
        CON(5)  0                                * 89B09  command 015 has no name
        CON(5)  0                                * 89B0E  command 016 has no name
        CON(5)  0                                * 89B13  command 017 has no name
        CON(5)  0                                * 89B18  command 018 has no name
        CON(5)  0                                * 89B1D  command 019 has no name
        CON(5)  0                                * 89B22  command 01A has no name
        CON(5)  0                                * 89B27  command 01B has no name
        CON(5)  0                                * 89B2C  command 01C has no name
        CON(5)  0                                * 89B31  command 01D has no name
        CON(5)  0                                * 89B36  command 01E has no name
        CON(5)  0                                * 89B3B  command 01F has no name
        CON(5)  0                                * 89B40  command 020 has no name
        CON(5)  0                                * 89B45  command 021 has no name
        CON(5)  0                                * 89B4A  command 022 has no name
        CON(5)  0                                * 89B4F  command 023 has no name
        CON(5)  0                                * 89B54  command 024 has no name
        CON(5)  0                                * 89B59  command 025 has no name
        CON(5)  0                                * 89B5E  command 026 has no name
        CON(5)  0                                * 89B63  command 027 has no name
        CON(5)  0                                * 89B68  command 028 has no name
        CON(5)  0                                * 89B6D  command 029 has no name
        CON(5)  0                                * 89B72  command 02A has no name
        CON(5)  0                                * 89B77  command 02B has no name
        CON(5)  0                                * 89B7C  command 02C has no name
        CON(5)  0                                * 89B81  command 02D has no name
        CON(5)  0                                * 89B86  command 02E has no name
        CON(5)  0                                * 89B8B  command 02F has no name
        CON(5)  0                                * 89B90  command 030 has no name
        CON(5)  0                                * 89B95  command 031 has no name
        CON(5)  0                                * 89B9A  command 032 has no name
        CON(5)  (*)-H0F1.FUNCTION                * 89B9F  name of command 033
        CON(5)  (*)-H0F1.CONIC                   * 89BA4  name of command 034
        CON(5)  (*)-H0F1.POLAR                   * 89BA9  name of command 035
        CON(5)  (*)-H0F1.PARAMETRIC              * 89BAE  name of command 036
        CON(5)  (*)-H0F1.TRUTH                   * 89BB3  name of command 037
        CON(5)  (*)-H0F1.SCATTER                 * 89BB8  name of command 038
        CON(5)  (*)-H0F1.HISTOGRAM               * 89BBD  name of command 039
        CON(5)  (*)-H0F1.BAR                     * 89BC2  name of command 03A
        ENDLENGTH                                * 89BC7

LIB0F1.link:
        CON(5)  DOHSTR                           * 89BC7  link table of library 0F1
        LENGTH                                   * 89BCC  length, to #89D1B
        REL(5)  ROMP_0F1_000                     * 89BD1  000 
        REL(5)  ROMP_0F1_001                     * 89BD6  001 
        REL(5)  ROMP_0F1_002                     * 89BDB  002 
        REL(5)  ROMP_0F1_003                     * 89BE0  003 
        REL(5)  ROMP_0F1_004                     * 89BE5  004 
        REL(5)  ROMP_0F1_005                     * 89BEA  005 
        REL(5)  ROMP_0F1_006                     * 89BEF  006 
        REL(5)  ROMP_0F1_007                     * 89BF4  007 
        REL(5)  ROMP_0F1_008                     * 89BF9  008 
        REL(5)  ROMP_0F1_009                     * 89BFE  009 
        REL(5)  ROMP_0F1_00A                     * 89C03  00A 
        REL(5)  ROMP_0F1_00B                     * 89C08  00B 
        REL(5)  ROMP_0F1_00C                     * 89C0D  00C 
        REL(5)  ROMP_0F1_00D                     * 89C12  00D 
        REL(5)  ROMP_0F1_00E                     * 89C17  00E 
        REL(5)  ROMP_0F1_00F                     * 89C1C  00F 
        REL(5)  ROMP_0F1_010                     * 89C21  010 
        REL(5)  ROMP_0F1_011                     * 89C26  011 
        REL(5)  ROMP_0F1_012                     * 89C2B  012 
        REL(5)  ROMP_0F1_013                     * 89C30  013 
        REL(5)  ROMP_0F1_014                     * 89C35  014 
        REL(5)  ROMP_0F1_015                     * 89C3A  015 
        REL(5)  ROMP_0F1_016                     * 89C3F  016 
        REL(5)  ROMP_0F1_017                     * 89C44  017 
        REL(5)  ROMP_0F1_018                     * 89C49  018 
        REL(5)  ROMP_0F1_019                     * 89C4E  019 
        REL(5)  ROMP_0F1_01A                     * 89C53  01A 
        REL(5)  ROMP_0F1_01B                     * 89C58  01B 
        REL(5)  ROMP_0F1_01C                     * 89C5D  01C 
        REL(5)  ROMP_0F1_01D                     * 89C62  01D 
        REL(5)  ROMP_0F1_01E                     * 89C67  01E 
        REL(5)  ROMP_0F1_01F                     * 89C6C  01F 
        REL(5)  ROMP_0F1_020                     * 89C71  020 
        REL(5)  ROMP_0F1_021                     * 89C76  021 
        REL(5)  ROMP_0F1_022                     * 89C7B  022 
        REL(5)  ROMP_0F1_023                     * 89C80  023 
        REL(5)  ROMP_0F1_024                     * 89C85  024 
        REL(5)  ROMP_0F1_025                     * 89C8A  025 
        REL(5)  ROMP_0F1_026                     * 89C8F  026 
        REL(5)  ROMP_0F1_027                     * 89C94  027 
        REL(5)  ROMP_0F1_028                     * 89C99  028 
        REL(5)  ROMP_0F1_029                     * 89C9E  029 
        REL(5)  ROMP_0F1_02A                     * 89CA3  02A 
        REL(5)  ROMP_0F1_02B                     * 89CA8  02B 
        REL(5)  ROMP_0F1_02C                     * 89CAD  02C 
        REL(5)  ROMP_0F1_030                     * 89CB2  02D 
        REL(5)  ROMP_0F1_030                     * 89CB7  02E 
        REL(5)  ROMP_0F1_030                     * 89CBC  02F 
        REL(5)  ROMP_0F1_030                     * 89CC1  030 
        REL(5)  ROMP_0F1_031                     * 89CC6  031 
        REL(5)  ROMP_0F1_032                     * 89CCB  032 
        REL(5)  FUNCTION                         * 89CD0  033 FUNCTION
        REL(5)  CONIC                            * 89CD5  034 CONIC
        REL(5)  POLAR_8C9FD                      * 89CDA  035 POLAR
        REL(5)  PARAMETRIC                       * 89CDF  036 PARAMETRIC
        REL(5)  TRUTH                            * 89CE4  037 TRUTH
        REL(5)  SCATTER                          * 89CE9  038 SCATTER
        REL(5)  HISTOGRAM                        * 89CEE  039 HISTOGRAM
        REL(5)  BAR                              * 89CF3  03A BAR
        REL(5)  ROMP_0F1_03B                     * 89CF8  03B 
        REL(5)  ROMP_0F1_03C                     * 89CFD  03C 
        REL(5)  ROMP_0F1_03D                     * 89D02  03D 
        REL(5)  ROMP_0F1_03E                     * 89D07  03E 
        REL(5)  ROMP_0F1_03F                     * 89D0C  03F 
        REL(5)  ROMP_0F1_040                     * 89D11  040 
        REL(5)  ROMP_0F1_041                     * 89D16  041 
        ENDLENGTH                                * 89D1B
        RPL

* ROMPTR 0F1 000
* refs (1): 8999A
ROMP_0F1_000:
        ::                                       * 89D1B
          SWAP                                   * 89D20
          LAM     'Ue                            * 89D25
          %-                                     * 89D32
          SWAP                                   * 89D37
          LAM     'Ye                            * 89D3C
          %-                                     * 89D49
          DUP                                    * 89D4E
          %0=                                    * 89D53
          ITE                                    * 89D58
          ::                                     * 89D5D
            DROP                                 * 89D62
            %SGN                                 * 89D67
            %MAXREAL                             * 89D6C
            %*                                   * 89D71
          ;                                      * 89D76
          ::                                     * 89D7B
            %/                                   * 89D80
            LAM     'Ue                          * 89D85
            %+                                   * 89D92
          ;                                      * 89D97
          SWAP                                   * 89D9C
          OVER                                   * 89DA1
          %MAX                                   * 89DA6
          ROT                                    * 89DAB
          ROT                                    * 89DB0
          %MIN                                   * 89DB5
          SWAP                                   * 89DBA
        ;                                        * 89DBF

* ROMPTR 0F1 001
* refs (1): 8999A
ROMP_0F1_001:
        ::                                       * 89DC4
          ROMPTR  0F1 00A                        * 89DC9
          BINT15                                 * 89DD4
          NDUP                                   * 89DD9
          5PICK                                  * 89DDE
          5PICK                                  * 89DE3
          '                                      * 89DE8
          NULLLAM                                * 89DED
          BINT15                                 * 89DF2
          NDUPN                                  * 89DF7
          '                                      * 89DFC
          LAM     'Ue                            * 89E01
          '                                      * 89E0E
          LAM     'Ye                            * 89E13
          ROT                                    * 89E20
          #2+                                    * 89E25
          {}N                                    * 89E2A
          BIND                                   * 89E2F
          %MAXREAL                               * 89E34
          DUP                                    * 89E39
          %CHS                                   * 89E3E
          17GETLAM                               * 89E43
          15GETLAM                               * 89E48
          ROMPTR  0F1 000                        * 89E4D
          17GETLAM                               * 89E58
          14GETLAM                               * 89E5D
          ROMPTR  0F1 000                        * 89E62
          16GETLAM                               * 89E6D
          15GETLAM                               * 89E72
          ROMPTR  0F1 000                        * 89E77
          16GETLAM                               * 89E82
          14GETLAM                               * 89E87
          ROMPTR  0F1 000                        * 89E8C
          5GETLAM                                * 89E97
          2PUTLAM                                * 89E9C
          %MAXREAL                               * 89EA1
          DUP                                    * 89EA6
          %CHS                                   * 89EAB
          13GETLAM                               * 89EB0
          15GETLAM                               * 89EB5
          ROMPTR  0F1 000                        * 89EBA
          13GETLAM                               * 89EC5
          14GETLAM                               * 89ECA
          ROMPTR  0F1 000                        * 89ECF
          12GETLAM                               * 89EDA
          15GETLAM                               * 89EDF
          ROMPTR  0F1 000                        * 89EE4
          12GETLAM                               * 89EEF
          14GETLAM                               * 89EF4
          ROMPTR  0F1 000                        * 89EF9
          ABND                                   * 89F04
        ;                                        * 89F09

* ROMPTR 0F1 002
* refs (1): 8999A
ROMP_0F1_002:
        ::                                       * 89F0E
          ROMPTR  0F1 001                        * 89F13
          ROMPTR  0F1 00B                        * 89F1E

* ROMPTR 0F1 003
* refs (1): 8999A
ROMP_0F1_003:
          {                                      * 89F29
            LAM     'Xleft                       * 89F2E
            LAM     'Xright                      * 89F41
            LAM     'Ynear                       * 89F56
            LAM     'Yfar                        * 89F69
            LAM     'Zlow                        * 89F7A
            LAM     'Zhigh                       * 89F8B
            LAM     'XXleft                      * 89F9E
            LAM     'XXright                     * 89FB3
            LAM     'YYlow                       * 89FCA
            LAM     'YYhigh                      * 89FDD
            LAM     'Xe                          * 89FF2
            LAM     'Ye                          * 89FFF
            LAM     'Ze                          * 8A00C
            LAM     'Nx                          * 8A019
            LAM     'Ny                          * 8A026
            LAM     'xmin                        * 8A033
            LAM     'xmax                        * 8A044
            LAM     'ymin                        * 8A055
            LAM     'ymax                        * 8A066
            LAM     'oldeq                       * 8A077
            LAM     'EQ                          * 8A08A
            LAM     'indepvar                    * 8A097
            LAM     'dependvar                   * 8A0B0
            LAM     'PPAR                        * 8A0CB
            LAM     'units                       * 8A0DC
          }                                      * 8A0EF
          BIND                                   * 8A0F4
          ERRSET                                 * 8A0F9
          ::                                     * 8A0FE

* ROMPTR 0F1 004
* refs (1): 8999A
ROMP_0F1_004:
            ::                                   * 8A103
              'IDPARAMETER                       * 8A108
              PUTPTYPE                           * 8A10D
              LAM     'xmin                      * 8A112
              LAM     'xmax                      * 8A123
              xrng(2r)                           * 8A134
              LAM     'ymin                      * 8A139
              LAM     'ymax                      * 8A14A
              yrng(2r)                           * 8A15B
              '                                  * 8A160
              ID      'XV                        * 8A165
              %0_2A2B4                           * 8A172
              LAM     'Nx                        * 8A177
              %1-                                * 8A184
              BINT3                              * 8A189
              {}N                                * 8A18E
              PUTINDEPLIST                       * 8A193
              LAM     'Xright                    * 8A198
              LAM     'Xleft                     * 8A1AD
              %-                                 * 8A1C0
              LAM     'Nx                        * 8A1C5
              %1-                                * 8A1D2
              %/                                 * 8A1D7
              '                                  * 8A1DC
              ID      'XV                        * 8A1E1
              '                                  * 8A1EE
              x*                                 * 8A1F3
              LAM     'Xleft                     * 8A1F8
              BINT4                              * 8A20B
              Cr                                 * 8A210
              x+                                 * 8A215
              LAM     'indepvar                  * 8A21A
              CREATE                             * 8A233
              LAM     'indepvar                  * 8A238
              LAM     'Xe                        * 8A251
              {                                  * 8A25E
                x-                               * 8A263
                LAM     'u                       * 8A268
                x/                               * 8A273
                x+                               * 8A278
              }                                  * 8A27D
              INNERCOMP                          * 8A282
              6PICK                              * 8A287
              3UNROLL                            * 8A28C
              #3+                                * 8A291
              LAM     'EQ                        * 8A296
              SINNER                             * 8A2A3
              top&                               * 8A2A8
              LAM     'Ze                        * 8A2AD
              {                                  * 8A2BA
                x-                               * 8A2BF
                LAM     'u                       * 8A2C4
                x/                               * 8A2CF
                x+                               * 8A2D4
              }                                  * 8A2D9
              INNERCOMP                          * 8A2DE
              6PICK                              * 8A2E3
              3UNROLL                            * 8A2E8
              #2+                                * 8A2ED
              top&                               * 8A2F2
              PTR     addt2:                     * 8A2F7
              C%i                                * 8A2FC
              x*                                 * 8A301
              Cr                                 * 8A306
              x+                                 * 8A30B
              DUP                                * 8A310
              DOSTOE                             * 8A315
            ;                                    * 8A31A
            SINNER                               * 8A31F
            RESOROMP                             * 8A324
            ROMPTR  0F1 008                      * 8A329
            SWAP#1+                              * 8A334
            SYMBN                                * 8A339
            RESOROMP                             * 8A33E
            ROMPTR  0F1 009                      * 8A343
            '                                    * 8A34E
            OBJ_5135F                            * 8A353
            BINT2                                * 8A358
            ::N                                  * 8A35D

* ROMPTR 0F1 005
* refs (1): 8999A
ROMP_0F1_005:
            ::                                   * 8A362
              %1                                 * 8A367
              res(r)                             * 8A36C
              LAM     'Yfar                      * 8A371
              LAM     'dependvar                 * 8A382
              CREATE                             * 8A39D
              LAM     'Yfar                      * 8A3A2
              LAM     'Ynear                     * 8A3B3
              OVER                               * 8A3C6
              %-                                 * 8A3CB
              LAM     'Ny                        * 8A3D0
              %1-                                * 8A3DD
              %/                                 * 8A3E2
              SWAP                               * 8A3E7
              LAM     'Ye                        * 8A3EC
              %-                                 * 8A3F9
              LAM     'Nx                        * 8A3FE
              COERCE                             * 8A40B
              DUP                                * 8A410
              BINT1                              * 8A415
              {}N                                * 8A41A
              C%0                                * 8A41F
              MAKEARRY                           * 8A424
              BINT1                              * 8A429
              TRUE                               * 8A42E
              BINT0                              * 8A433
              {                                  * 8A438
                LAM     'Ystp                    * 8A43D
                LAM     'u                       * 8A44E
                LAM     'cssz                    * 8A459
                LAM     'csbar                   * 8A46A
                LAM     'csindex                 * 8A47D
                LAM     'fscsbar                 * 8A494
                LAM     'oldpt                   * 8A4AB
              }                                  * 8A4BE
              BIND                               * 8A4C3
            ;                                    * 8A4C8
            '                                    * 8A4CD
            OBJ_4C3E6                            * 8A4D2
            %1                                   * 8A4D7

* ROMPTR 0F1 006
* refs (1): 8999A
ROMP_0F1_006:
            ::                                   * 8A4DC
              GDISPCENTER                        * 8A4E1
              TURNMENUOFF                        * 8A4E6
              PLOTPREP                           * 8A4EB
              18GETLAM                           * 8A4F0
              #4-                                * 8A4F5
              18PUTLAM                           * 8A4FA
              3DROP                              * 8A4FF
              4PUTLAM                            * 8A504
              3PUTLAM                            * 8A509
              '                                  * 8A50E
              15GETLAM                           * 8A513
              '                                  * 8A518
              GETXPOS                            * 8A51D
              '                                  * 8A522
              1PUTLAM                            * 8A527
              '                                  * 8A52C
              '                                  * 8A531
              6ROLL                              * 8A536
              6ROLL                              * 8A53B
              BINT1                              * 8A540
              3GETLAM                            * 8A545
              BINT8                              * 8A54A
              ::N                                * 8A54F
              2PUTLAM                            * 8A554
            ;                                    * 8A559
            OBJ_4C314                            * 8A55E
            ERRSET                               * 8A563
            ::                                   * 8A568
              LAM     'Ny                        * 8A56D
              COERCE                             * 8A57A
              BINT0                              * 8A57F
              DO                                 * 8A584
              BINT1                              * 8A589
              OBJ_4A96E                          * 8A58E
              DROP                               * 8A593
              OBJ_4C12A                          * 8A598
              15GETLAM                           * 8A59D
              17GETLAM                           * 8A5A2
              NEWINDEP                           * 8A5A7
              LAM     'Ystp                      * 8A5AC
              LAM     'dependvar                 * 8A5BD
              'EvalNoCK:_sup                     * 8A5D8
              xSTO+                              * 8A5DD
              LAM     'Ystp                      * 8A5E2
              '                                  * 8A5F3
              LAM     'u                         * 8A5F8
              'EvalNoCK:_sup                     * 8A603
              xSTO+                              * 8A608
              FALSE                              * 8A60D
              '                                  * 8A612
              LAM     'fscsbar                   * 8A617
              STO                                * 8A62E
              LOOP                               * 8A633
            ;                                    * 8A638
            ERRTRAP                              * 8A63D
            ::                                   * 8A642
              ERROR@                             * 8A647
              #0=                                * 8A64C
              ?SEMI                              * 8A651
              OBJ_4C0E4                          * 8A656
              ERRJMP                             * 8A65B
            ;                                    * 8A660
            OBJ_4C0E4                            * 8A665
            18GETLAM                             * 8A66A
            RESETDEPTH                           * 8A66F
            ABND                                 * 8A674
            ABND                                 * 8A679
            ABND                                 * 8A67E
          ;                                      * 8A683
          ERRTRAP                                * 8A688
          OBJ_472B8                              * 8A68D

* ROMPTR 0F1 007
* refs (1): 8999A
ROMP_0F1_007:
          ::                                     * 8A692
            LAM     'indepvar                    * 8A697
            ?PURGE_HERE                          * 8A6B0
            LAM     'dependvar                   * 8A6B5
            ?PURGE_HERE                          * 8A6D0
            LAM     'oldeq                       * 8A6D5
            DOSTOE                               * 8A6E8
            LAM     'PPAR                        * 8A6ED
            '                                    * 8A6FE
            ID      PPAR                         * 8A703
            STOAPPLDATA                          * 8A712
          ;                                      * 8A717
          ABND                                   * 8A71C
        ;                                        * 8A721

* ROMPTR 0F1 008
* refs (1): 8999A
ROMP_0F1_008:
        ::                                       * 8A726
          CK1NOLASTWD                            * 8A72B
          ::                                     * 8A730
            CK&DISPATCH0                         * 8A735
            BINT2                                * 8A73A
            NOP                                  * 8A73F
            BINT1                                * 8A744
            ::                                   * 8A749
              %0_2A2B4                           * 8A74E
              %>C%                               * 8A753
            ;                                    * 8A758
            BINT10                               * 8A75D
            ::                                   * 8A762
              RDROP                              * 8A767
              cknumdsptch1                       * 8A76C
              NOP                                * 8A771
              ROMPTR  0F1 008                    * 8A776
            ;                                    * 8A781
          ;                                      * 8A786
          LAM     'csindex                       * 8A78B
          LAM     'fscsbar                       * 8A7A2
          ?SKIP                                  * 8A7B9
          ::                                     * 8A7BE
            LAM     'oldpt                       * 8A7C3
            DUP                                  * 8A7D6
            CON(5)  DOCMP                        * 8A7DB  DOCMP
            NIBHEX  FFF0000000000000FFF0000000000000 * 8A7E0  ÿ.......ÿ.......
            EQUAL                                * 8A800
            caseDROP                             * 8A805
            3PICK                                * 8A80A
            line(2c)                             * 8A80F
          ;                                      * 8A814
          2DUP                                   * 8A819
          LAM     'csbar                         * 8A81E
          3UNROLL                                * 8A831
          PUTEL                                  * 8A836
          2DROP                                  * 8A83B
        ;                                        * 8A840

* ROMPTR 0F1 009
* refs (1): 8999A
ROMP_0F1_009:
        ::                                       * 8A845
          LAM     'csbar                         * 8A84A
          CON(5)  DOCMP                          * 8A85D  DOCMP
          NIBHEX  FFF0000000000000FFF0000000000000 * 8A862  ÿ.......ÿ.......
          LAM     'csindex                       * 8A882
          #1+                                    * 8A899
          LAM     'cssz                          * 8A89E
          2DUP                                   * 8A8AF
          #>                                     * 8A8B4
          ITE                                    * 8A8B9
          #-                                     * 8A8BE
          DROP                                   * 8A8C3
          DUP                                    * 8A8C8
          '                                      * 8A8CD
          LAM     'csindex                       * 8A8D2
          STOLAM                                 * 8A8E9
          DUP                                    * 8A8EE
          LAM     'csbar                         * 8A8F3
          GETATELN                               * 8A906
          DROP                                   * 8A90B
          '                                      * 8A910
          LAM     'oldpt                         * 8A915
          STOLAM                                 * 8A928
          PUTEL                                  * 8A92D
          DROP                                   * 8A932
        ;                                        * 8A937

* ROMPTR 0F1 00A
* refs (1): 8999A
ROMP_0F1_00A:
        ::                                       * 8A93C
          '                                      * 8A941
          ID      VPAR                           * 8A946
          OBJ_4735A                              * 8A955
          NOTcase                                * 8A95A
          ::                                     * 8A95F
            ROMPTR  0B5 08E                      * 8A964
            INCOMPDROP                           * 8A96F
          ;                                      * 8A974
          DUPTYPELIST?                           * 8A979
          NOTcase                                * 8A97E
          SETTYPEERR                             * 8A983
          INNERCOMP                              * 8A988
          BINT15                                 * 8A98D
          #=                                     * 8A992
          NOTcase                                * 8A997
          SETSIZEERR                             * 8A99C
          BINT15                                 * 8A9A1
          BINT0                                  * 8A9A6
          DO                                     * 8A9AB
          BINT15                                 * 8A9B0
          ROLL                                   * 8A9B5
          DUPTYPEREAL?                           * 8A9BA
          NOTcase                                * 8A9BF
          SETTYPEERR                             * 8A9C4
          LOOP                                   * 8A9C9
          BINT5                                  * 8A9CE
          BINT0                                  * 8A9D3
          DO                                     * 8A9D8
          BINT15                                 * 8A9DD
          ROLL                                   * 8A9E2
          BINT15                                 * 8A9E7
          ROLL                                   * 8A9EC
          2DUP                                   * 8A9F1
          %<                                     * 8A9F6
          ?SKIP                                  * 8A9FB
          SWAP                                   * 8AA00
          LOOP                                   * 8AA05
          BINT15                                 * 8AA0A
          ROLL                                   * 8AA0F
          BINT15                                 * 8AA14
          ROLL                                   * 8AA19
          BINT10                                 * 8AA1E
          PICK                                   * 8AA23
          2DUP                                   * 8AA28
          SWAP                                   * 8AA2D
          %-                                     * 8AA32
          %1                                     * 8AA37
          %<                                     * 8AA3C
          ITE                                    * 8AA41
          ::                                     * 8AA46
            SWAPDROP                             * 8AA4B
            %1-                                  * 8AA50
          ;                                      * 8AA55
          DROP                                   * 8AA5A
          BINT15                                 * 8AA5F
          ROLL                                   * 8AA64
          BINT2                                  * 8AA69
          BINT0                                  * 8AA6E
          DO                                     * 8AA73
          BINT15                                 * 8AA78
          ROLL                                   * 8AA7D
          DUP                                    * 8AA82
          %2                                     * 8AA87
          %<                                     * 8AA8C
          IT                                     * 8AA91
          ::                                     * 8AA96
            DROP                                 * 8AA9B
            %2                                   * 8AAA0
          ;                                      * 8AAA5
          LOOP                                   * 8AAAA
        ;                                        * 8AAAF

* ROMPTR 0F1 00B
* refs (1): 8999A
ROMP_0F1_00B:
        ::                                       * 8AAB4
          CHECKPVARS                             * 8AAB9
          DUP                                    * 8AABE
          BINT3                                  * 8AAC3
          NTHCOMPDROP                            * 8AAC8
          DUPTYPELIST?                           * 8AACD
          ?CARCOMP                               * 8AAD2
          OVER                                   * 8AAD7
          BINT7                                  * 8AADC
          NTHCOMPDROP                            * 8AAE1
          DUPTYPELIST?                           * 8AAE6
          ?CARCOMP                               * 8AAEB
          'EQ                                    * 8AAF0
          SAFE@_HERE                             * 8AAF5
          ?SKIP                                  * 8AAFA
          NOEQERR                                * 8AAFF
          2DUP                                   * 8AB04
          EQUAL                                  * 8AB09
          4PICK                                  * 8AB0E
          3PICK                                  * 8AB13
          EQUALOR                                * 8AB18
          ?SKIP                                  * 8AB1D
          ::                                     * 8AB22
            DROP                                 * 8AB27
            DORCLE                               * 8AB2C
          ;                                      * 8AB31
          DUPDUP                                 * 8AB36
          EqList?                                * 8AB3B
          ?CARCOMP                               * 8AB40
          OBJ_49B7D                              * 8AB45
          5UNROLL                                * 8AB4A
          5UNROLL                                * 8AB4F
          ROT                                    * 8AB54
          %1                                     * 8AB59
          4PICK                                  * 8AB5E
          SAFE@_HERE                             * 8AB63
          NOT?SEMI                               * 8AB68
          DUPTYPEEXT?                            * 8AB6D
          NOTcaseDROP                            * 8AB72
          UM>U                                   * 8AB77
        ;                                        * 8AB7C

* ROMPTR 0F1 00C
* refs (1): 8999A
ROMP_0F1_00C:
        ::                                       * 8AB81
          FALSE                                  * 8AB86

* ROMPTR 0F1 00D
* refs (1): 8999A
ROMP_0F1_00D:
          ::                                     * 8AB8B
            OBJ_57216                            * 8AB90
            ERRSET                               * 8AB95
            ::                                   * 8AB9A

* ROMPTR 0F1 00E
* refs (1): 8999A
ROMP_0F1_00E:
              ::                                 * 8AB9F
                ITE                              * 8ABA4
                ::                               * 8ABA9
                  LAM     'xmin                  * 8ABAE
                  LAM     'xmax                  * 8ABBF
                  LAM     'ymin                  * 8ABD0
                  LAM     'ymax                  * 8ABE1
                ;                                * 8ABF2
                ::                               * 8ABF7
                  LAM     'Xleft                 * 8ABFC
                  LAM     'Xright                * 8AC0F
                  LAM     'Ynear                 * 8AC24
                  LAM     'Yfar                  * 8AC37
                ;                                * 8AC48
                yrng(2r)                         * 8AC4D
                xrng(2r)                         * 8AC52
                'IDPARAMETER                     * 8AC57
                PUTPTYPE                         * 8AC5C
                LAM     'XXleft                  * 8AC61
                LAM     'XXright                 * 8AC76
                %-                               * 8AC8D
                LAM     'YYhigh                  * 8AC92
                LAM     'YYlow                   * 8ACA7
                %-                               * 8ACBA
                LAM     'Nx                      * 8ACBF
                LAM     'Ny                      * 8ACCC
                %*                               * 8ACD9
                DUP                              * 8ACDE
                %1/                              * 8ACE3
                %1                               * 8ACE8
                SWAP                             * 8ACED
                %-                               * 8ACF2
                DUP                              * 8ACF7
                '                                * 8ACFC
                ID      'TTT                     * 8AD01
                '                                * 8AD10
                x*                               * 8AD15
                %.5                              * 8AD1A
                6PICK                            * 8AD1F
                %/                               * 8AD24
                '                                * 8AD29
                x+                               * 8AD2E
                BINT5                            * 8AD33
                SYMBN                            * 8AD38
                {                                * 8AD3D
                  LAM     'dx                    * 8AD42
                  LAM     'dy                    * 8AD4F
                  LAM     'nxny                  * 8AD5C
                  LAM     'cc2                   * 8AD6D
                  LAM     'cc3                   * 8AD7C
                }                                * 8AD8B
                BIND                             * 8AD90
                LAM     'XXright                 * 8AD95
                LAM     'dx                      * 8ADAC
                %1                               * 8ADB9
                LAM     'Nx                      * 8ADBE
                %1-                              * 8ADCB
                %1/                              * 8ADD0
                %+                               * 8ADD5
                %*                               * 8ADDA
                %.5                              * 8ADDF
                %-1                              * 8ADE4
                LAM     'Ny                      * 8ADE9
                BINT5                            * 8ADF6
                LAM     'cc3                     * 8ADFB
                SYMBOL                           * 8AE0A
                  x*                             * 8AE0F
                  xIP                            * 8AE14
                  x^                             * 8AE19
                  %-.5                           * 8AE1E
                ;                                * 8AE23
                2SINNERtop&                      * 8AE28
                top&                             * 8AE2D
                LAM     'Ny                      * 8AE32
                SWAP#1+                          * 8AE3F
                LAM     'cc3                     * 8AE44
                SYMBOL                           * 8AE53
                  x*                             * 8AE58
                  xFP                            * 8AE5D
                  x+                             * 8AE62
                  x*                             * 8AE67
                  x+                             * 8AE6C
                  x*                             * 8AE71
                  x+                             * 8AE76
                ;                                * 8AE7B
                2SINNERtop&                      * 8AE80
                top&                             * 8AE85
                %.5                              * 8AE8A
                LAM     'dx                      * 8AE8F
                LAM     'Nx                      * 8AE9C
                %1-                              * 8AEA9
                %/                               * 8AEAE
                %*                               * 8AEB3
                SWAP#1+                          * 8AEB8
                Cr                               * 8AEBD
                x-                               * 8AEC2
                LAM     'indepvar                * 8AEC7
                CREATE                           * 8AEE0
                LAM     'YYlow                   * 8AEE5
                LAM     'dy                      * 8AEF8
                LAM     'Ny                      * 8AF05
                %1-                              * 8AF12
                %/                               * 8AF17
                LAM     'Ny                      * 8AF1C
                BINT3                            * 8AF29
                LAM     'cc3                     * 8AF2E
                SYMBOL                           * 8AF3D
                  x*                             * 8AF42
                  xIP                            * 8AF47
                  x*                             * 8AF4C
                  x+                             * 8AF51
                ;                                * 8AF56
                2SINNERtop&                      * 8AF5B
                top&                             * 8AF60
                SYMBN                            * 8AF65
                LAM     'dependvar               * 8AF6A
                CREATE                           * 8AF85
                LAM     'XXright                 * 8AF8A
                LAM     'dx                      * 8AFA1
                LAM     'Nx                      * 8AFAE
                %1-                              * 8AFBB
                %/                               * 8AFC0
                LAM     'Nx                      * 8AFC5
                BINT3                            * 8AFD2
                LAM     'cc3                     * 8AFD7
                SYMBOL                           * 8AFE6
                  x*                             * 8AFEB
                  xIP                            * 8AFF0
                  x*                             * 8AFF5
                  x+                             * 8AFFA
                ;                                * 8AFFF
                2SINNERtop&                      * 8B004
                top&                             * 8B009
                SYMBN                            * 8B00E
                '                                * 8B013
                LAM     'xmin                    * 8B018
                STO                              * 8B029
                LAM     'YYlow                   * 8B02E
                LAM     'dy                      * 8B041
                %1                               * 8B04E
                LAM     'Ny                      * 8B053
                %1-                              * 8B060
                %1/                              * 8B065
                %+                               * 8B06A
                %*                               * 8B06F
                %.5                              * 8B074
                %-1                              * 8B079
                LAM     'Nx                      * 8B07E
                BINT5                            * 8B08B
                LAM     'cc3                     * 8B090
                SYMBOL                           * 8B09F
                  x*                             * 8B0A4
                  xIP                            * 8B0A9
                  x^                             * 8B0AE
                  %-.5                           * 8B0B3
                ;                                * 8B0B8
                2SINNERtop&                      * 8B0BD
                top&                             * 8B0C2
                LAM     'Nx                      * 8B0C7
                SWAP#1+                          * 8B0D4
                LAM     'cc3                     * 8B0D9
                SYMBOL                           * 8B0E8
                  x*                             * 8B0ED
                  xFP                            * 8B0F2
                  x+                             * 8B0F7
                  x*                             * 8B0FC
                  x+                             * 8B101
                  x*                             * 8B106
                  x+                             * 8B10B
                ;                                * 8B110
                2SINNERtop&                      * 8B115
                top&                             * 8B11A
                %.5                              * 8B11F
                LAM     'dy                      * 8B124
                LAM     'Ny                      * 8B131
                %1-                              * 8B13E
                %/                               * 8B143
                %*                               * 8B148
                SWAP#1+                          * 8B14D
                Cr                               * 8B152
                x-                               * 8B157
                '                                * 8B15C
                LAM     'ymin                    * 8B161
                STO                              * 8B172
                LAM     'nxny                    * 8B177
                %1-                              * 8B188
                %1/                              * 8B18D
                ABND                             * 8B192
                DUP                              * 8B197
                res(r)                           * 8B19C
                '                                * 8B1A1
                ID      'TTT                     * 8B1A6
                %0_2A2B4                         * 8B1B5
                %1                               * 8B1BA
                BINT3                            * 8B1BF
                {}N                              * 8B1C4
                PUTINDEPLIST                     * 8B1C9
                DORCLE                           * 8B1CE
                '                                * 8B1D3
                OBJ_5135F                        * 8B1D8
                '                                * 8B1DD
                OBJ_4C3E6                        * 8B1E2
                4ROLL                            * 8B1E7
                ROMPTR  0F1 006                  * 8B1EC
                OBJ_4C314                        * 8B1F7
                DORCLE                           * 8B1FC
              ;                                  * 8B201
              DROP                               * 8B206
              ERRSET                             * 8B20B
              ::                                 * 8B210
                BINT1                            * 8B215
                OBJ_4A96E                        * 8B21A
                DROP                             * 8B21F
                OBJ_4C12A                        * 8B224
                15GETLAM                         * 8B229
                17GETLAM                         * 8B22E
                NEWINDEP                         * 8B233
                LAM     'xmin                    * 8B238
                LAM     'indepvar                * 8B249
                STO                              * 8B262
                LAM     'ymin                    * 8B267
                LAM     'dependvar               * 8B278
                STO                              * 8B293
                OBJ_4C251                        * 8B298
                OBJ_4C12A                        * 8B29D
              ;                                  * 8B2A2
              ERRTRAP                            * 8B2A7
              ::                                 * 8B2AC
                ERROR@                           * 8B2B1
                #0=                              * 8B2B6
                ?SEMI                            * 8B2BB
                OBJ_4C0E4                        * 8B2C0
                ERRJMP                           * 8B2C5
              ;                                  * 8B2CA
              OBJ_4C0E4                          * 8B2CF
              18GETLAM                           * 8B2D4
              RESETDEPTH                         * 8B2D9
              ABND                               * 8B2DE
              ABND                               * 8B2E3
            ;                                    * 8B2E8
            ERRTRAP                              * 8B2ED
            OBJ_472B8                            * 8B2F2

* ROMPTR 0F1 00F
* refs (1): 8999A
ROMP_0F1_00F:
            ::                                   * 8B2F7
              LAM     'indepvar                  * 8B2FC
              ?PURGE_HERE                        * 8B315
              LAM     'dependvar                 * 8B31A
              ?PURGE_HERE                        * 8B335
              LAM     'oldeq                     * 8B33A
              DOSTOE                             * 8B34D
              LAM     'PPAR                      * 8B352
              '                                  * 8B363
              ID      PPAR                       * 8B368
              STOAPPLDATA                        * 8B377
            ;                                    * 8B37C
            ABND                                 * 8B381
          ;                                      * 8B386
        ;                                        * 8B38B

* ROMPTR 0F1 010
* refs (1): 8999A
ROMP_0F1_010:
        ::                                       * 8B390

* ROMPTR 0F1 011
* refs (1): 8999A
ROMP_0F1_011:
          ::                                     * 8B395
            ROMPTR  0B5 086                      * 8B39A
            DORCLE                               * 8B3A5
            DUP                                  * 8B3AA
            TYPELIST?                            * 8B3AF
            ?SKIP                                * 8B3B4
            SETTYPEERR                           * 8B3B9
            DUP                                  * 8B3BE
            INNERCOMP                            * 8B3C3
            #3=                                  * 8B3C8
            ?SKIP                                * 8B3CD
            ARGNUMERR                            * 8B3D2
            BINT3                                * 8B3D7
            nmetasyms                            * 8B3DC
            {                                    * 8B3E1
              LAM     'xe                        * 8B3E6
              LAM     'ye                        * 8B3F3
              LAM     'ze                        * 8B400
              LAM     'eeq                       * 8B40D
              LAM     'xp                        * 8B41C
              LAM     'yp                        * 8B429
              LAM     'zp                        * 8B436
            }                                    * 8B443
            BIND                                 * 8B448
            LAM     'zp                          * 8B44D
            SINNER                               * 8B45A
            LAM     'ze                          * 8B45F
            SWAP#1+                              * 8B46C
            meta-                                * 8B471
            LAM     'yp                          * 8B476
            SINNER                               * 8B483
            top&                                 * 8B488
            LAM     'ye                          * 8B48D
            SWAP#1+                              * 8B49A
            meta-                                * 8B49F
            meta/                                * 8B4A4
            LAM     'ze                          * 8B4A9
            SWAP#1+                              * 8B4B6
            meta+                                * 8B4BB
            '                                    * 8B4C0
            xi                                   * 8B4C5
            SWAP#1+                              * 8B4CA
            meta*                                * 8B4CF
            LAM     'xp                          * 8B4D4
            SINNER                               * 8B4E1
            top&                                 * 8B4E6
            LAM     'xe                          * 8B4EB
            SWAP#1+                              * 8B4F8
            meta-                                * 8B4FD
            LAM     'yp                          * 8B502
            SINNER                               * 8B50F
            top&                                 * 8B514
            LAM     'ye                          * 8B519
            SWAP#1+                              * 8B526
            meta-                                * 8B52B
            meta/                                * 8B530
            LAM     'xe                          * 8B535
            SWAP#1+                              * 8B542
            meta+                                * 8B547
            Cr                                   * 8B54C
            x+                                   * 8B551
          ;                                      * 8B556
          ERRSET                                 * 8B55B
          ::                                     * 8B560
            DOSTOE                               * 8B565
            TRUE                                 * 8B56A
            ROMPTR  0F1 00D                      * 8B56F
          ;                                      * 8B57A
          ERRTRAP                                * 8B57F
          OBJ_472B8                              * 8B584

* ROMPTR 0F1 012
* refs (1): 8999A
ROMP_0F1_012:
          ::                                     * 8B589
            LAM     'eeq                         * 8B58E
            DOSTOE                               * 8B59D
          ;                                      * 8B5A2
          ABND                                   * 8B5A7
        ;                                        * 8B5AC

* ROMPTR 0F1 013
* refs (1): 8999A
ROMP_0F1_013:
        ::                                       * 8B5B1
          OBJ_57216                              * 8B5B6
          ERRSET                                 * 8B5BB
          ::                                     * 8B5C0

* ROMPTR 0F1 014
* refs (1): 8999A
ROMP_0F1_014:
            ::                                   * 8B5C5
              'IDFUNCTION                        * 8B5CA
              PUTPTYPE                           * 8B5CF
              LAM     'Xleft                     * 8B5D4
              LAM     'Xright                    * 8B5E7
              xrng(2r)                           * 8B5FC
              LAM     'Zlow                      * 8B601
              LAM     'Zhigh                     * 8B612
              yrng(2r)                           * 8B625
              LAM     'indepvar                  * 8B62A
              PUTINDEP                           * 8B643
              LAM     'Xright                    * 8B648
              LAM     'Xleft                     * 8B65D
              %-                                 * 8B670
              LAM     'Nx                        * 8B675
              %1-                                * 8B682
              %/                                 * 8B687
              res(r)                             * 8B68C
              LAM     'EQ                        * 8B691
              DUP                                * 8B69E
              DOSTOE                             * 8B6A3
              '                                  * 8B6A8
              OBJ_5135F                          * 8B6AD
              LAM     'Yfar                      * 8B6B2
              LAM     'Ynear                     * 8B6C3
              OVER                               * 8B6D6
              %-                                 * 8B6DB
              LAM     'Ny                        * 8B6E0
              %1-                                * 8B6ED
              %/                                 * 8B6F2
              SWAP                               * 8B6F7
              LAM     'dependvar                 * 8B6FC
              CREATE                             * 8B717
              LAM     'Ny                        * 8B71C
              COERCE                             * 8B729
              NULLHXS                            * 8B72E
              SWAP                               * 8B733
              NDUPN                              * 8B738
              get1                               * 8B73D
              '                                  * 8B742
              NULLLAM                            * 8B747
              3PICK                              * 8B74C
              NDUPN                              * 8B751
              '                                  * 8B756
              LAM     '#ny                       * 8B75B
              '                                  * 8B76A
              LAM     'Ystp                      * 8B76F
              ROT                                * 8B780
              #2+                                * 8B785
              DOBIND                             * 8B78A
              '                                  * 8B78F
              OBJ_4C34B                          * 8B794
              %0_2A2B4                           * 8B799
              ROMPTR  0F1 006                    * 8B79E
              GETRES                             * 8B7A9
              GetRes                             * 8B7AE
              4PUTLAM                            * 8B7B3
              OBJ_4C314                          * 8B7B8
              DORCLE                             * 8B7BD
            ;                                    * 8B7C2
            DROP                                 * 8B7C7
            ERRSET                               * 8B7CC
            ::                                   * 8B7D1
              LAM     '#ny                       * 8B7D6
              #2+                                * 8B7E5
              BINT1                              * 8B7EA
              '                                  * 8B7EF
              LAM     '#ny                       * 8B7F4
              STOLAM                             * 8B803
              BINT2                              * 8B808
              DO                                 * 8B80D
              DOERASE                            * 8B812
              BINT1                              * 8B817
              OBJ_4A96E                          * 8B81C
              DROP                               * 8B821
              OBJ_4C12A                          * 8B826
              GBUFF                              * 8B82B
              TOTEMPOB                           * 8B830
              INDEX@                             * 8B835
              '                                  * 8B83A
              LAM     'Ystp                      * 8B83F
              ROMPTR  0F1 025                    * 8B850
              INDEX@                             * 8B85B
              '                                  * 8B860
              LAM     '#ny                       * 8B865
              STOLAM                             * 8B874
              15GETLAM                           * 8B879
              17GETLAM                           * 8B87E
              NEWINDEP                           * 8B883
              LAM     'Ystp                      * 8B888
              LAM     'dependvar                 * 8B899
              'EvalNoCK:_sup                     * 8B8B4
              xSTO+                              * 8B8B9
              LOOP                               * 8B8BE
            ;                                    * 8B8C3
            ERRTRAP                              * 8B8C8
            ::                                   * 8B8CD
              ERROR@                             * 8B8D2
              BINT2                              * 8B8D7
              #<                                 * 8B8DC
              ?SEMI                              * 8B8E1
              OBJ_4C0E4                          * 8B8E6
              ERRJMP                             * 8B8EB
            ;                                    * 8B8F0
            OBJ_4C0E4                            * 8B8F5
            18GETLAM                             * 8B8FA
            RESETDEPTH                           * 8B8FF
            ABND                                 * 8B904
            ABND                                 * 8B909
            LAM     '#ny                         * 8B90E
            #1-                                  * 8B91D
            DUP                                  * 8B922
            #0=                                  * 8B927
            ?SKIP                                * 8B92C
            ::                                   * 8B931
              #3+                                * 8B936
              BINT3                              * 8B93B
              DO                                 * 8B940
              INDEX@                             * 8B945
              GETLAM                             * 8B94A
              LOOP                               * 8B94F
              LAM     '#ny                       * 8B954
              #1-                                * 8B963
            ;                                    * 8B968
            UNCOERCE                             * 8B96D
            CK0NOLASTWD                          * 8B972
            ABND                                 * 8B977
          ;                                      * 8B97C
          ERRTRAP                                * 8B981
          OBJ_472B8                              * 8B986

* ROMPTR 0F1 015
* refs (1): 8999A
ROMP_0F1_015:
          ::                                     * 8B98B
            LAM     'dependvar                   * 8B990
            ?PURGE_HERE                          * 8B9AB
            LAM     'oldeq                       * 8B9B0
            DOSTOE                               * 8B9C3
            LAM     'PPAR                        * 8B9C8
            '                                    * 8B9D9
            ID      PPAR                         * 8B9DE
            STOAPPLDATA                          * 8B9ED
          ;                                      * 8B9F2
          ABND                                   * 8B9F7
          ROMPTR  0AB 01A                        * 8B9FC
        ;                                        * 8BA07

* ROMPTR 0F1 016
* refs (1): 8999A
ROMP_0F1_016:
        ::                                       * 8BA0C
          BINT18                                 * 8BA11
          PICK                                   * 8BA16
          DUP                                    * 8BA1B
          dvarlsBIND                             * 8BA20
          #0=case                                * 8BA25
          ROMPTR  0F1 017                        * 8BA2A
          DEPTH                                  * 8BA35
          DUP                                    * 8BA3A
          1GETLAM                                * 8BA3F
          #<                                     * 8BA44
          casedrop                               * 8BA49
          ROMPTR  0F1 017                        * 8BA4E
          1GETLAM                                * 8BA59
          #-                                     * 8BA5E
          #1+                                    * 8BA63
          DUP                                    * 8BA68
          1PUTLAM                                * 8BA6D
          PICK                                   * 8BA72
          DUPTYPEREAL?                           * 8BA77
          NOTcasedrop                            * 8BA7C
          ROMPTR  0F1 017                        * 8BA81
          COERCE                                 * 8BA8C
          LAM     '#ny                           * 8BA91
          #MIN                                   * 8BAA0
          BINT19                                 * 8BAA5
          PICK                                   * 8BAAA
          #1-                                    * 8BAAF
          #MIN                                   * 8BAB4
          BINT0                                  * 8BAB9
          #=casedrop                             * 8BABE
          ROMPTR  0F1 017                        * 8BAC3
          DUP                                    * 8BACE
          '                                      * 8BAD3
          LAM     '#ny                           * 8BAD8
          STOLAM                                 * 8BAE7
          TRUE                                   * 8BAEC
          SWAP                                   * 8BAF1
          #2+                                    * 8BAF6
          BINT2                                  * 8BAFB
          DO                                     * 8BB00
          INDEX@                                 * 8BB05
          1GETLAM                                * 8BB0A
          #+PICK                                 * 8BB0F
          DUPTYPEGROB?                           * 8BB14
          ROTAND                                 * 8BB19
          SWAP                                   * 8BB1E
          INDEX@                                 * 8BB23
          '                                      * 8BB28
          LAM     'Ystp                          * 8BB2D
          ROMPTR  0F1 025                        * 8BB3E
          LOOP                                   * 8BB49
          ITE                                    * 8BB4E
          ::                                     * 8BB53
            GBUFF                                * 8BB58
            1GETABND                             * 8BB5D
            LAM     '#ny                         * 8BB62
            #+                                   * 8BB71
            #1+PICK                              * 8BB76
            ZEROZERO                             * 8BB7B
            ChkRepl(2go,2s)                      * 8BB80
            DROP                                 * 8BB85
            CROSS_HAIRS                          * 8BB8A
          ;                                      * 8BB8F

* ROMPTR 0F1 017
* refs (1): 8999A
ROMP_0F1_017:
          ::                                     * 8BB94
            BINT0                                * 8BB99
            '                                    * 8BB9E
            LAM     '#ny                         * 8BBA3
            STOLAM                               * 8BBB2
            ABND                                 * 8BBB7
          ;                                      * 8BBBC
        ;                                        * 8BBC1

* ROMPTR 0F1 018
* refs (1): 8999A
ROMP_0F1_018:
        ::                                       * 8BBC6
          LAM     'dependvar                     * 8BBCB
          DRPExitAtLOOP                          * 8BBE6
          NOT?SEMI                               * 8BBEB
          DUPTYPEREAL?                           * 8BBF0
          NOTcase                                * 8BBF5
          DROP                                   * 8BBFA
          LAM     'Ynear                         * 8BBFF
          %-                                     * 8BC12
          LAM     'Ystp                          * 8BC17
          %ABS                                   * 8BC28
          %/                                     * 8BC2D
          DUP                                    * 8BC32
          %0<                                    * 8BC37
          caseDROP                               * 8BC3C
          COERCE                                 * 8BC41
          #1+                                    * 8BC46
          OVER                                   * 8BC4B
          #3=                                    * 8BC50
          ITE                                    * 8BC55
          #1+                                    * 8BC5A
          #1-                                    * 8BC5F
          LAM     '#ny                           * 8BC64
          #MIN                                   * 8BC73
          DUP#0=                                 * 8BC78
          caseDROP                               * 8BC7D
          #1+                                    * 8BC82
          '                                      * 8BC87
          LAM     'Ystp                          * 8BC8C
          ROMPTR  0F1 024                        * 8BC9D
          DROP                                   * 8BCA8
          GBUFF                                  * 8BCAD
          SWAP                                   * 8BCB2
          ZEROZERO                               * 8BCB7
          ChkRepl(2go,2s)                        * 8BCBC
          DROP                                   * 8BCC1
          CROSS_HAIRS                            * 8BCC6
        ;                                        * 8BCCB

* ROMPTR 0F1 019
* refs (1): 8999A
ROMP_0F1_019:
        ::                                       * 8BCD0

* ROMPTR 0F1 01A
* refs (1): 8999A
ROMP_0F1_01A:
          ::                                     * 8BCD5
            ROMPTR  0F1 001                      * 8BCDA
            BINT4                                * 8BCE5
            ZERO_DO                              * 8BCEA
            BINT19                               * 8BCEF
            PICK                                 * 8BCF4
            LOOP                                 * 8BCF9
            yrng(2r)                             * 8BCFE
            xrng(2r)                             * 8BD03
            ROMPTR  0F1 00B                      * 8BD08
          ;                                      * 8BD13

* ROMPTR 0F1 01B
* refs (1): 8999A
ROMP_0F1_01B:
          ::                                     * 8BD18
            ROMPTR  0F1 003                      * 8BD1D
            BIND                                 * 8BD28
            ERRSET                               * 8BD2D
            ::                                   * 8BD32

* ROMPTR 0F1 01C
* refs (1): 8999A
ROMP_0F1_01C:
              ::                                 * 8BD37
                LAM     'Xleft                   * 8BD3C
                LAM     'Xright                  * 8BD4F
                xrng(2r)                         * 8BD64
                LAM     'Ynear                   * 8BD69
                LAM     'Yfar                    * 8BD7C
                yrng(2r)                         * 8BD8D
                LAM     'indepvar                * 8BD92
                PUTINDEP                         * 8BDAB
                LAM     'dependvar               * 8BDB0
                depnd(gn)                        * 8BDCB
                LAM     'EQ                      * 8BDD0
                DUP                              * 8BDDD
                DOSTOE                           * 8BDE2
                '                                * 8BDE7
                OBJ_5135F                        * 8BDEC
                RESOROMP                         * 8BDF1
                ROMPTR  0F1 023                  * 8BDF6
                %       4E-1                     * 8BE01
                LAM     'Xright                  * 8BE16
                LAM     'Xleft                   * 8BE2B
                %-                               * 8BE3E
                LAM     'Nx                      * 8BE43
                %/                               * 8BE50
                DUP                              * 8BE55
                res(r)                           * 8BE5A
                OVER                             * 8BE5F
                OVER                             * 8BE64
                %*                               * 8BE69
                LAM     'Yfar                    * 8BE6E
                LAM     'Ynear                   * 8BE7F
                %-                               * 8BE92
                LAM     'Ny                      * 8BE97
                %/                               * 8BEA4
                4ROLL                            * 8BEA9
                OVER                             * 8BEAE
                %*                               * 8BEB3
                {                                * 8BEB8
                  LAM     'hstp                  * 8BEBD
                  LAM     'hofs                  * 8BECE
                  LAM     'vstp                  * 8BEDF
                  LAM     'vofs                  * 8BEF0
                }                                * 8BF01
                BIND                             * 8BF06
                LAM     'hstp                    * 8BF0B
                ROMPTR  0F1 006                  * 8BF1C
                LAM     'Yfar                    * 8BF27
                LAM     'vstp                    * 8BF38
                %.5                              * 8BF49
                %*                               * 8BF4E
                %-                               * 8BF53
                LAM     'dependvar               * 8BF58
                CREATE                           * 8BF73
              ;                                  * 8BF78
              ERRSET                             * 8BF7D
              ::                                 * 8BF82

* ROMPTR 0F1 01D
* refs (1): 8999A
ROMP_0F1_01D:
                ::                               * 8BF87
                  17GETLAM                       * 8BF8C
                  LAM     'hstp                  * 8BF91
                  %.5                            * 8BFA2
                  %*                             * 8BFA7
                  %+                             * 8BFAC
                  17PUTLAM                       * 8BFB1
                  OBJ_4C314                      * 8BFB6
                  LAM     'indepvar              * 8BFBB
                  LAM     'dependvar             * 8BFD4
                  '                              * 8BFEF
                  xi                             * 8BFF4
                  '                              * 8BFF9
                  x*                             * 8BFFE
                  '                              * 8C003
                  x+                             * 8C008
                  BINT5                          * 8C00D
                  ::N                            * 8C012
                ;                                * 8C017
                DROP                             * 8C01C
                ERRSET                           * 8C021
                ::                               * 8C026
                  LAM     'Ny                    * 8C02B
                  COERCE                         * 8C038
                  BINT0                          * 8C03D
                  DO                             * 8C042
                  OBJ_4C12A                      * 8C047
                  15GETLAM                       * 8C04C
                  17GETLAM                       * 8C051
                  NEWINDEP                       * 8C056
                  LAM     'dependvar             * 8C05B
                  LAM     'vstp                  * 8C076
                  'EvalNoCK:_sup                 * 8C087
                  xSTO-                          * 8C08C
                  LOOP                           * 8C091
                ;                                * 8C096
                ERRTRAP                          * 8C09B
                ::                               * 8C0A0
                  ERROR@                         * 8C0A5
                  #0=                            * 8C0AA
                  ?SEMI                          * 8C0AF
                  OBJ_4C0E4                      * 8C0B4
                  ERRJMP                         * 8C0B9
                ;                                * 8C0BE
                OBJ_4C0E4                        * 8C0C3
                18GETLAM                         * 8C0C8
                RESETDEPTH                       * 8C0CD
              ;                                  * 8C0D2
              ERRTRAP                            * 8C0D7
              OBJ_472B8                          * 8C0DC

* ROMPTR 0F1 01E
* refs (1): 8999A
ROMP_0F1_01E:
              ::                                 * 8C0E1
                LAM     'dependvar               * 8C0E6
                ?PURGE_HERE                      * 8C101
              ;                                  * 8C106
              ABND                               * 8C10B
              ABND                               * 8C110
              ABND                               * 8C115
            ;                                    * 8C11A
            ERRTRAP                              * 8C11F
            OBJ_472B8                            * 8C124

* ROMPTR 0F1 01F
* refs (1): 8999A
ROMP_0F1_01F:
            ::                                   * 8C129
              LAM     'oldeq                     * 8C12E
              DOSTOE                             * 8C141
              LAM     'PPAR                      * 8C146
              '                                  * 8C157
              ID      PPAR                       * 8C15C
              STOAPPLDATA                        * 8C16B
            ;                                    * 8C170
            ABND                                 * 8C175
          ;                                      * 8C17A
        ;                                        * 8C17F

* ROMPTR 0F1 020
* refs (1): 8999A
ROMP_0F1_020:
        ::                                       * 8C184

* ROMPTR 0F1 021
* refs (1): 8999A
ROMP_0F1_021:
          ::                                     * 8C189
            ROMPTR  0F1 001                      * 8C18E
            ROMPTR  0F1 00B                      * 8C199
            {                                    * 8C1A4
              x<<                                * 8C1A9
              DERIV                              * 8C1AE
              DERIV                              * 8C1B3
              xALG->                             * 8C1B8
              LAM     'dx                        * 8C1BD
              LAM     'dy                        * 8C1CA
              SYMBOL                             * 8C1D7
                LAM     'dy                      * 8C1DC
                %0_2A2B4                         * 8C1E9
                x==                              * 8C1EE
                SYMBOL                           * 8C1F3
                  xMAXR                          * 8C1F8
                ;                                * 8C1FD
                SYMBOL                           * 8C202
                  LAM     'dx                    * 8C207
                  xNEG                           * 8C214
                  LAM     'dy                    * 8C219
                  x/                             * 8C226
                ;                                * 8C22B
                xIFTE                            * 8C230
              ;                                  * 8C235
              x>>                                * 8C23A
            }                                    * 8C23F
            INNERCOMP                            * 8C244
            BINT14                               * 8C249
            ROLL                                 * 8C24E
            DUP                                  * 8C253
            BINT10                               * 8C258
            UNROLL                               * 8C25D
            BINT8                                * 8C262
            UNROLL                               * 8C267
            BINT15                               * 8C26C
            PICK                                 * 8C271

* ROMPTR 0F1 022
* refs (1): 8999A
ROMP_0F1_022:
            ::                                   * 8C276
              '                                  * 8C27B
              x'                                 * 8C280
              SWAP                               * 8C285
              '                                  * 8C28A
              xENDTIC                            * 8C28F
              BINT3                              * 8C294
              ::N                                * 8C299
            ;                                    * 8C29E
            BINT10                               * 8C2A3
            UNROLL                               * 8C2A8
            BINT15                               * 8C2AD
            PICK                                 * 8C2B2
            ROMPTR  0F1 022                      * 8C2B7
            BINT8                                * 8C2C2
            UNROLL                               * 8C2C7
            #4+                                  * 8C2CC
            ::N                                  * 8C2D1
            BINT5                                * 8C2D6
            UNROLL                               * 8C2DB
          ;                                      * 8C2E0
          ROMPTR  0F1 01B                        * 8C2E5
        ;                                        * 8C2F0

* ROMPTR 0F1 023
* refs (1): 8999A
ROMP_0F1_023:
        ::                                       * 8C2F5
          DROP                                   * 8C2FA
          DUPTYPEREAL?                           * 8C2FF
          NOTcase                                * 8C304
          DROP                                   * 8C309
          DUP                                    * 8C30E
          LAM     'hofs                          * 8C313
          %*                                     * 8C324
          %ABS                                   * 8C329
          LAM     'vofs                          * 8C32E
          %>                                     * 8C33F
          ITE                                    * 8C344
          ::                                     * 8C349
            LAM     'vofs                        * 8C34E
            DUP                                  * 8C35F
            ROT                                  * 8C364
            %/                                   * 8C369
            SWAP                                 * 8C36E
          ;                                      * 8C373
          ::                                     * 8C378
            LAM     'hofs                        * 8C37D
            DUP                                  * 8C38E
            ROT                                  * 8C393
            %*                                   * 8C398
          ;                                      * 8C39D
          %>C%                                   * 8C3A2
          LAM     'indepvar                      * 8C3A7
          EVAL                                   * 8C3C0
          LAM     'dependvar                     * 8C3C5
          EVAL                                   * 8C3E0
          %>C%                                   * 8C3E5
          SWAP                                   * 8C3EA
          2DUP                                   * 8C3EF
          C%C-C                                  * 8C3F4
          3UNROLL                                * 8C3F9
          C%C+C                                  * 8C3FE
          line(2c)                               * 8C403
        ;                                        * 8C408

* ROMPTR 0F1 024
* refs (1): 8999A
ROMP_0F1_024:
        CODE                                     * 8C40D  148 nibbles
          GOSBVL  SAVPTR                         * 8C417
          C=DAT1  A                              * 8C41E
          D1=D1+  5                              * 8C421
          A=DAT1  A                              * 8C424
          D1=A                                   * 8C427
          D1=D1+  5                              * 8C42A
          A=DAT1  A                              * 8C42D
          R3=A.F  A                              * 8C430
          D1=C                                   * 8C436
          D1=D1+  5                              * 8C439
          CD1EX                                  * 8C43C
          R0=C.F  A                              * 8C43F
          GOSBVL  LrclR0A                        * 8C445
          GONC    L_8C46C                        * 8C44C
          GOSBVL  GETPTR                         * 8C44F
          D1=D1+  10                             * 8C456
          D=D+CON A,2                            * 8C459
          LC(5)   FALSE                          * 8C45F
          A=C     A                              * 8C466
          PC=(A)                                 * 8C468
L_8C46C:
          A=R3.F  A                              * 8C46C
          A=A+A   A                              * 8C472
          C=A     A                              * 8C474
          A=A+A   A                              * 8C476
          A=A+A   A                              * 8C478
          A=A+C   A                              * 8C47A
          CD0EX                                  * 8C47C
          C=C+A   A                              * 8C47F
          D0=C                                   * 8C481
          A=DAT0  A                              * 8C484
          GOSBVL  GETPTR                         * 8C487
          D1=D1+  5                              * 8C48E
          DAT1=A  A                              * 8C491
          D1=D1-  5                              * 8C494
          LC(5)   TRUE                           * 8C497
          DAT1=C  A                              * 8C49E
          A=DAT0  A                              * 8C4A1
          D0=D0+  5                              * 8C4A4
          PC=(A)                                 * 8C4A7
        ENDCODE                                  * 8C4AB

* ROMPTR 0F1 025
* refs (1): 8999A
ROMP_0F1_025:
        CODE                                     * 8C4AB  134 nibbles
          D1=D1+  15                             * 8C4B5
          D=D+CON A,3                            * 8C4B8
          GOSBVL  SAVPTR                         * 8C4BE
          D1=D1-  5                              * 8C4C5
          C=DAT1  A                              * 8C4C8
          R2=C.F  A                              * 8C4CB
          D1=D1-  10                             * 8C4D1
          C=DAT1  A                              * 8C4D4
          D1=D1+  5                              * 8C4D7
          A=DAT1  A                              * 8C4DA
          D1=A                                   * 8C4DD
          D1=D1+  5                              * 8C4E0
          A=DAT1  A                              * 8C4E3
          R3=A.F  A                              * 8C4E6
          D1=C                                   * 8C4EC
          D1=D1+  5                              * 8C4EF
          CD1EX                                  * 8C4F2
          R0=C.F  A                              * 8C4F5
          GOSBVL  LrclR0A                        * 8C4FB
          GONC    L_8C513                        * 8C502
          GOSBVL  GETPTR                         * 8C505
          GOVLNG  DoErrULN                       * 8C50C
L_8C513:
          A=R3.F  A                              * 8C513
          A=A+A   A                              * 8C519
          C=A     A                              * 8C51B
          A=A+A   A                              * 8C51D
          A=A+A   A                              * 8C51F
          A=A+C   A                              * 8C521
          CD0EX                                  * 8C523
          C=C+A   A                              * 8C526
          D0=C                                   * 8C528
          A=R2.F  A                              * 8C52B
          DAT0=A  A                              * 8C531
          GOVLNG  GETPTRLOOP                     * 8C534
        ENDCODE                                  * 8C53B

* ROMPTR 0F1 026
* refs (1): 8999A
ROMP_0F1_026:
        ::                                       * 8C53B
          NoExitAction                           * 8C540
          {                                      * 8C545
            OBJ_73503                            * 8C54A
            OBJ_73365                            * 8C54F
            OBJ_73388                            * 8C554
            OBJ_73503                            * 8C559
            OBJ_73447                            * 8C55E
            OBJ_73495                            * 8C563
          }                                      * 8C568
        ;                                        * 8C56D

* ROMPTR 0F1 027
* refs (1): 8999A
ROMP_0F1_027:
        ::                                       * 8C572
          DEPTH                                  * 8C577
          dvarlsBIND                             * 8C57C
          EVALCRUNCH                             * 8C581
          DEPTH                                  * 8C586
          1GETABND                               * 8C58B
          #<                                     * 8C590
          case                                   * 8C595
          Message60E                             * 8C59A
        ;                                        * 8C59F

* ROMPTR 0F1 028
* refs (1): 8999A
ROMP_0F1_028:
        ::                                       * 8C5A4
          'R                                     * 8C5A9
          16GETLAM                               * 8C5AE
          #1=                                    * 8C5B3
          ITE                                    * 8C5B8

* ROMPTR 0F1 029
* refs (1): 8999A
ROMP_0F1_029:
          ::                                     * 8C5BD
            EVAL                                 * 8C5C2
            $       "OUTPUT"                     * 8C5C7
            >TAG                                 * 8C5DD
          ;                                      * 8C5E2

* ROMPTR 0F1 02A
* refs (1): 8999A
ROMP_0F1_02A:
          ::                                     * 8C5E7
            BINT3                                * 8C5EC
            16PUTLAM                             * 8C5F1

* ROMPTR 0F1 02B
* refs (1): 8999A
ROMP_0F1_02B:
            ::                                   * 8C5F6
              DROP                               * 8C5FB
              LAM     'dependvar                 * 8C600
              ROMPTR  0F1 027                    * 8C61B
              dvarlsBIND                         * 8C626
              LAM     'indepvar                  * 8C62B
              ROMPTR  0F1 027                    * 8C644
              1GETABND                           * 8C64F
              BINT2                              * 8C654
              {}N                                * 8C659
              $       "INPUT"                    * 8C65E
              >TAG                               * 8C672
            ;                                    * 8C677
          ;                                      * 8C67C
          BINT130                                * 8C681
          SWAP                                   * 8C686
          BINT32                                 * 8C68B
          OBJ_4686A                              * 8C690
          CLEARMENU                              * 8C695
          HARDBUFF2                              * 8C69A
          BINT0                                  * 8C69F
          BINT2                                  * 8C6A4
          GROB!                                  * 8C6A9
          RDROP                                  * 8C6AE
        ;                                        * 8C6B3

* ROMPTR 0F1 02C
* refs (1): 8999A
ROMP_0F1_02C:
        ::                                       * 8C6B8
          'R                                     * 8C6BD
          16GETLAM                               * 8C6C2
          #1=                                    * 8C6C7
          ITE                                    * 8C6CC
          ROMPTR  0F1 029                        * 8C6D1
          ROMPTR  0F1 02B                        * 8C6DC
        ;                                        * 8C6E7

* ROMPTR 0F1 030
* refs (4): 8999A 8999A 8999A 8999A
ROMP_0F1_030:
        ::                                       * 8C6EC
          LAM     'EQ                            * 8C6F1
          ROMPTR  0F1 027                        * 8C6FE
        ;                                        * 8C709

* ROMPTR 0F1 031
* refs (1): 8999A
ROMP_0F1_031:
        ::                                       * 8C70E
          LAM     'eeq                           * 8C713
          BINT3                                  * 8C722
          NTHCOMPDROP                            * 8C727
          ROMPTR  0F1 027                        * 8C72C
          DUPDUP                                 * 8C737
          OBJ_56FD1                              * 8C73C
          BIND                                   * 8C741
          LAM     'eeq                           * 8C746
          BINT2                                  * 8C755
          NTHCOMPDROP                            * 8C75A
          ROMPTR  0F1 027                        * 8C75F
          2PUTLAM                                * 8C76A
          LAM     'eeq                           * 8C76F
          CARCOMP                                * 8C77E
          ROMPTR  0F1 027                        * 8C783
          2GETLAM                                * 8C78E
          1GETABND                               * 8C793
          BINT3                                  * 8C798
          {}N                                    * 8C79D
        ;                                        * 8C7A2

* ROMPTR 0F1 032
* refs (1): 8999A
ROMP_0F1_032:
        ::                                       * 8C7A7
          LAM     'oldeq                         * 8C7AC
          DUP                                    * 8C7BF
          EqList?                                * 8C7C4
          IT                                     * 8C7C9
          CARCOMP                                * 8C7CE
          DUP                                    * 8C7D3
          ALGeq?                                 * 8C7D8
          IT                                     * 8C7DD
          GETRHS                                 * 8C7E2
          ROMPTR  0F1 027                        * 8C7E7
        ;                                        * 8C7F2

* ROMPTR 0F1 033
* refs (1): 8999A
        CON(1)  12                               * 8C7F7  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8C7F8  library
        CON(3)  #033                             * 8C7FB  command
FUNCTION:
        ::                                       * 8C7FE
          CK0                                    * 8C803
          'IDFUNCTION                            * 8C808
          PUTPTYPE                               * 8C80D
        ;                                        * 8C812

        {                                        * 8C817
          FALSE                                  * 8C81C
          OBJ_4BA5D                              * 8C821
          NOP                                    * 8C826
          TRUE                                   * 8C82B
          {                                      * 8C830
            OBJ_47116                            * 8C835
            OBJ_73BEF                            * 8C83A
            OBJ_737F1                            * 8C83F
            {                                    * 8C844
              OBJ_73DE8                          * 8C849
              OBJ_73A8F                          * 8C84E
            }                                    * 8C853
            ::                                   * 8C858
              BINT25                             * 8C85D
              GETLAM                             * 8C862
              PTR     NULL::                     * 8C867
              EQUALcasedrop                      * 8C86C
              Message60E                         * 8C871
              15GETLAM                           * 8C876
              SWAP                               * 8C87B
              %>C%                               * 8C880
            ;                                    * 8C885
          }                                      * 8C88A
          TRUE                                   * 8C88F
          OBJ_4B6C5                              * 8C894
          ::                                     * 8C899
            BINT31                               * 8C89E
            TestSysFlag                          * 8C8A3
            ITE                                  * 8C8A8
            ::                                   * 8C8AD
              '                                  * 8C8B2
              OBJ_4CE0B                          * 8C8B7
            ;                                    * 8C8BC
            ::                                   * 8C8C1
              '                                  * 8C8C6
              OBJ_4C34B                          * 8C8CB
            ;                                    * 8C8D0
          ;                                      * 8C8D5
          ::                                     * 8C8DA
            %%1                                  * 8C8DF
            10GETLAM                             * 8C8E4
            %%/>%                                * 8C8E9
          ;                                      * 8C8EE
          FALSE                                  * 8C8F3
          FALSE                                  * 8C8F8
          TRUE                                   * 8C8FD
          OBJ_73211                              * 8C902
          OBJ_73270                              * 8C907
          ROMPTR  0F1 03F                        * 8C90C
          OBJ_732E5                              * 8C917
        }                                        * 8C91C

* ROMPTR 0F1 034
* refs (1): 8999A
        CON(1)  12                               * 8C921  command header: flags (meaning not yet known)
        CON(3)  #0F1                             * 8C922  library
        CON(3)  #034                             * 8C925  command
CONIC:
        ::                                       * 8C928
          CK0                                    * 8C92D
          'IDCONIC                               * 8C932
          PUTPTYPE                               * 8C937
        ;                                        * 8C93C

        {                                        * 8C941
          FALSE                                  * 8C946
          OBJ_4BC83                              * 8C94B
          NOP                                    * 8C950
          TRUE                                   * 8C955
          NULL{}                                 * 8C95A
          FALSE                                  * 8C95F
          OBJ_4B6C5                              * 8C964
          ::                                     * 8C969
            BINT31                               * 8C96E
            TestSysFlag                          * 8C973
            ITE                                  * 8C978
            ::                                   * 8C97D
              '                                  * 8C982
              OBJ_4CE0B                          * 8C987
            ;                                    * 8C98C
            ::                                   * 8C991
              '                                  * 8C996
              OBJ_4C34B                          * 8C99B
            ;                                    * 8C9A0
          ;                                      * 8C9A5
          ::                                     * 8C9AA
            %%1                                  * 8C9AF
            10GETLAM                             * 8C9B4
            %%/>%                                * 8C9B9
          ;                                      * 8C9BE
          FALSE                                  * 8C9C3
          FALSE                                  * 8C9C8
          TRUE                                   * 8C9CD
          OBJ_73211                              * 8C9D2
          OBJ_73270                              * 8C9D7
          ROMPTR  0F1 03F                        * 8C9DC
          OBJ_73594                              * 8C9E7
          OBJ_48E0A                              * 8C9EC
        }                                        * 8C9F1
