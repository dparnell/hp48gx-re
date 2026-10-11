* HP 48GX ROM revision R, #A07E9-#A2436: Library part 0E1
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #A07E9 in the original ROM).
        ENDLENGTH                                * A07E9

        CON(5)  DOLIB                            * A07E9  library object
        LENGTH                                   * A07EE  length, to #A2430
        CON(2)  0                                * A07F3  title length

LIB0E1:
        CON(3)  #0E1                             * A07F5  library number
        REL(5)  LIB0E1.hash                      * A07F8  hash table
        REL(5)  ROMP_0E1_00B                     * A07FD  message table
        REL(5)  LIB0E1.link                      * A0802  link table
        CON(5)  0                                * A0807  config
        RPL

* ROMPTR 0E1 000
* refs (1): A07F5
ROMP_0E1_000:
        ::                                       * A080C
          RECLAIMDISP                            * A0811
          POLSaveUI                              * A0816
          ERRSET                                 * A081B
          ::                                     * A0820
            ClrDA1IsStat                         * A0825
            FALSE                                * A082A
            {                                    * A082F
              LAM     CLFlag                     * A0834
            }                                    * A0847
            BIND                                 * A084C
            ROMPTR  0E1 001                      * A0851
            #       E128                         * A085C  57640
            JstGetTHEMESG                        * A0866
            TOTEMPOB                             * A086B
            ROMPTR  0E1 002                      * A0870
            ONEONE                               * A087B
            ROMPTR  0E1 005                      * A0880
            RESOROMP                             * A088B
            ROMPTR  0E1 003                      * A0890
            NULL{}                               * A089B
            ROMPTR  0E0 010                      * A08A0  ~BRbrowse
            ABND                                 * A08AB
            ClrDAsOK                             * A08B0
          ;                                      * A08B5
          ERRTRAP                                * A08BA
          POLResUI&Err                           * A08BF
          POLRestoreUI                           * A08C4
        ;                                        * A08C9

* ROMPTR 0E1 001
* refs (1): A07F5
ROMP_0E1_001:
        {                                        * A08CE
          {                                      * A08D3
            ::                                   * A08D8
              TakeOver                           * A08DD
              $       "SI"                       * A08E2
              BINT60                             * A08F0
              TestUserFlag                       * A08F5
              NOT                                * A08FA
              Box/StdLabel                       * A08FF
            ;                                    * A0904
            ::                                   * A0909
              TakeOver                           * A090E
              BINT60                             * A0913
              TestUserFlag                       * A0918
              case                               * A091D
              ::                                 * A0922
                BINT60                           * A0927
                ClrUserFlag                      * A092C
                LAM     CLFlag                   * A0931
                IT                               * A0944
                ::                               * A0949
                  ROMPTR  0E0 049                * A094E  BRinverse
                  ROMPTR  0E0 045                * A0959  BRDispItems
                  ROMPTR  0E0 049                * A0964  BRinverse
                ;                                * A096F
                DispMenu                         * A0974
              ;                                  * A0979
            ;                                    * A097E
          }                                      * A0983
          {                                      * A0988
            ::                                   * A098D
              TakeOver                           * A0992
              $       "ENGL"                     * A0997
              BINT60                             * A09A9
              TestUserFlag                       * A09AE
              Box/StdLabel                       * A09B3
            ;                                    * A09B8
            ::                                   * A09BD
              TakeOver                           * A09C2
              BINT60                             * A09C7
              TestUserFlag                       * A09CC
              NOTcase                            * A09D1
              ::                                 * A09D6
                BINT60                           * A09DB
                SetUserFlag                      * A09E0
                LAM     CLFlag                   * A09E5
                IT                               * A09F8
                ::                               * A09FD
                  ROMPTR  0E0 049                * A0A02  BRinverse
                  ROMPTR  0E0 045                * A0A0D  BRDispItems
                  ROMPTR  0E0 049                * A0A18  BRinverse
                ;                                * A0A23
                DispMenu                         * A0A28
              ;                                  * A0A2D
            ;                                    * A0A32
          }                                      * A0A37
          {                                      * A0A3C
            ::                                   * A0A41
              TakeOver                           * A0A46
              $       "UNITS"                    * A0A4B
              BINT61                             * A0A5F
              TestUserFlag                       * A0A64
              NOT                                * A0A69
              Box/StdLabel                       * A0A6E
            ;                                    * A0A73
            ::                                   * A0A78
              TakeOver                           * A0A7D
              BINT61                             * A0A82
              DUP                                * A0A87
              UserITE                            * A0A8C
              ClrUserFlag                        * A0A91
              SetUserFlag                        * A0A96
              LAM     CLFlag                     * A0A9B
              IT                                 * A0AAE
              ::                                 * A0AB3
                ROMPTR  0E0 049                  * A0AB8  BRinverse
                ROMPTR  0E0 045                  * A0AC3  BRDispItems
                ROMPTR  0E0 049                  * A0ACE  BRinverse
              ;                                  * A0AD9
              DispMenu                           * A0ADE
            ;                                    * A0AE3
          }                                      * A0AE8
          {                                      * A0AED
            ::                                   * A0AF2
              TakeOver                           * A0AF7
              $       "VALUE"                    * A0AFC
              LAM     CLFlag                     * A0B10
              Box/StdLabel                       * A0B23
            ;                                    * A0B28
            ::                                   * A0B2D
              TakeOver                           * A0B32
              LAM     CLFlag                     * A0B37
              ITE                                * A0B4A
              FALSE                              * A0B4F
              TRUE                               * A0B54
              '                                  * A0B59
              LAM     CLFlag                     * A0B5E
              STO                                * A0B71
              ROMPTR  0E0 049                    * A0B76  BRinverse
              ROMPTR  0E0 045                    * A0B81  BRDispItems
              ROMPTR  0E0 049                    * A0B8C  BRinverse
              DispMenu                           * A0B97
            ;                                    * A0B9C
          }                                      * A0BA1
          {                                      * A0BA6
            $       "→STK"                       * A0BAB
            ::                                   * A0BBD
              TakeOver                           * A0BC2
              ROMPTR  0E1 004                    * A0BC7
              AtUserStack                        * A0BD2
            ;                                    * A0BD7
          }                                      * A0BDC
          {                                      * A0BE1
            $       "QUIT"                       * A0BE6
            ::                                   * A0BF8
              TakeOver                           * A0BFD
              ROMPTR  0E0 013                    * A0C02  BRdone
            ;                                    * A0C0D
          }                                      * A0C12
        }                                        * A0C17

* ROMPTR 0E1 002
* refs (1): A07F5
ROMP_0E1_002:
        {                                        * A0C1C
          ROMPTR  0E0 052                        * A0C21  BRViewItem
          ROMPTR  0E0 013                        * A0C2C  BRdone
        }                                        * A0C37

* ROMPTR 0E1 003
* refs (1): A07F5
ROMP_0E1_003:
        ::                                       * A0C3C
          DUP#0=                                 * A0C41
          case2drop                              * A0C46
          #       27                             * A0C4B  39
          DUPUNROT                               * A0C55
          NTHCOMPDROP                            * A0C5A
          $       ": "                           * A0C5F
          &$                                     * A0C6D
          SWAP                                   * A0C72
          LAM     CLFlag                         * A0C77
          ITE                                    * A0C8A
          ::                                     * A0C8F
            ROMPTR  0E1 009                      * A0C94
            DUPTYPEEXT?                          * A0C9F
            ITE                                  * A0CA4
            ::                                   * A0CA9
              DO>STR                             * A0CAE
              BINT2                              * A0CB3
              OVERLEN$                           * A0CB8
              #1-                                * A0CBD
              SUB$                               * A0CC2
            ;                                    * A0CC7
            DO>STR                               * A0CCC
          ;                                      * A0CD1
          ::                                     * A0CD6
            #       E100                         * A0CDB  57600
            #+                                   * A0CE5
            JstGetTHEMESG                        * A0CEA
          ;                                      * A0CEF
          &$                                     * A0CF4
        ;                                        * A0CF9

* ROMPTR 0E1 004
* refs (1): A07F5
ROMP_0E1_004:
        ::                                       * A0CFE
          ROMPTR  0E0 017                        * A0D03  ~BRRclCurRow
          DUP                                    * A0D0E
          ROMPTR  0E1 009                        * A0D13
          ROMPTR  0E1 005                        * A0D1E
          ROT                                    * A0D29
          NTHCOMPDROP                            * A0D2E
          >TAG                                   * A0D33
        ;                                        * A0D38

* ROMPTR 0E1 005
* refs (1): A07F5
ROMP_0E1_005:
        {                                        * A0D3D
          $       "NA"                           * A0D42
          $       "k"                            * A0D50
          $       "Vm"                           * A0D5C
          $       "R"                            * A0D6A
          $       "StdT"                         * A0D76
          $       "StdP"                         * A0D88
          $       "σ"                            * A0D9A
          $       "c"                            * A0DA6
          $       "ε0"                           * A0DB2
          $       "µ0"                           * A0DC0
          $       "g"                            * A0DCE
          $       "G"                            * A0DDA
          $       "h"                            * A0DE6
          $       "hbar"                         * A0DF2
          $       "q"                            * A0E04
          $       "me"                           * A0E10
          $       "qme"                          * A0E1E
          $       "mp"                           * A0E2E
          $       "mpme"                         * A0E3C
          $       "α"                            * A0E4E
          $       "Ø"                            * A0E5A
          $       "F"                            * A0E66
          $       "R∞"                           * A0E72
          $       "a0"                           * A0E80
          $       "µB"                           * A0E8E
          $       "µN"                           * A0E9C
          $       "λ0"                           * A0EAA
          $       "f0"                           * A0EB8
          $       "λc"                           * A0EC6
          $       "rad"                          * A0ED4
          $       "twoπ"                         * A0EE4
          $       "angl"                         * A0EF6
          $       "c3"                           * A0F08
          $       "kq"                           * A0F16
          $       "ε0q"                          * A0F24
          $       "qε0"                          * A0F34
          $       "εsi"                          * A0F44
          $       "εox"                          * A0F54
          $       "I0"                           * A0F64
        }                                        * A0F72

* ROMPTR 0E1 006
* refs (1): A07F5
ROMP_0E1_006:
        {                                        * A0F77
          CHR_D                                  * A0F7C
          UNIT                                   * A0F81
            %       7.270063E-27                 * A0F86
            $       "Btu"                        * A0F9B
            $       "°R"                         * A0FAB
            um/                                  * A0FB9
            umEND                                * A0FBE
          ;                                      * A0FC3
          UNIT                                   * A0FC8
            %       3.590394E2                   * A0FCD
            $       "ft"                         * A0FE2
            %3                                   * A0FF0
            um^                                  * A0FF5
            $       "lbmol"                      * A0FFA
            um/                                  * A100E
            umEND                                * A1013
          ;                                      * A1018
          UNIT                                   * A101D
            %       1.073164E1                   * A1022
            $       "psi"                        * A1037
            $       "ft"                         * A1047
            %3                                   * A1055
            um^                                  * A105A
            um*                                  * A105F
            $       "lbmol"                      * A1064
            $       "°R"                         * A1078
            um*                                  * A1086
            um/                                  * A108B
            umEND                                * A1090
          ;                                      * A1095
          UNIT                                   * A109A
            %       4.9167E2                     * A109F
            $       "°R"                         * A10B4
            umEND                                * A10C2
          ;                                      * A10C7
          UNIT                                   * A10CC
            %       1.46959E1                    * A10D1
            $       "psi"                        * A10E6
            umEND                                * A10F6
          ;                                      * A10FB
          UNIT                                   * A1100
            %       1.71234E-9                   * A1105
            $       "Btu"                        * A111A
            $       "h"                          * A112A
            $       "ft"                         * A1136
            %2                                   * A1144
            um^                                  * A1149
            um*                                  * A114E
            $       "°R"                         * A1153
            %4                                   * A1161
            um^                                  * A1166
            um*                                  * A116B
            um/                                  * A1170
            umEND                                * A1175
          ;                                      * A117A
          UNIT                                   * A117F
            %       9.83571056E8                 * A1184
            $       "ft"                         * A1199
            tok_s                                * A11A7
            um/                                  * A11AC
            umEND                                * A11B1
          ;                                      * A11B6
          CHR_D                                  * A11BB
          CHR_D                                  * A11C0
          UNIT                                   * A11C5
            %       3.2174E1                     * A11CA
            $       "ft"                         * A11DF
            tok_s                                * A11ED
            %2                                   * A11F2
            um^                                  * A11F7
            um/                                  * A11FC
            umEND                                * A1201
          ;                                      * A1206
          UNIT                                   * A120B
            %       3.32208E-11                  * A1210
            $       "lbf"                        * A1225
            $       "ft"                         * A1235
            %2                                   * A1243
            um^                                  * A1248
            um*                                  * A124D
            $       "lb"                         * A1252
            %2                                   * A1260
            um^                                  * A1265
            um/                                  * A126A
            umEND                                * A126F
          ;                                      * A1274
          UNIT                                   * A1279
            %       1.7445299E-40                * A127E
            $       "Btu"                        * A1293
            $       "h"                          * A12A3
            um*                                  * A12AF
            umEND                                * A12B4
          ;                                      * A12B9
          UNIT                                   * A12BE
            %       2.77650562E-41               * A12C3
            $       "Btu"                        * A12D8
            $       "h"                          * A12E8
            um*                                  * A12F4
            umEND                                * A12F9
          ;                                      * A12FE
          CHR_D                                  * A1303
          CHR_D                                  * A1308
          CHR_D                                  * A130D
          CHR_D                                  * A1312
          CHR_D                                  * A1317
          CHR_D                                  * A131C
          CHR_D                                  * A1321
          CHR_D                                  * A1326
          CHR_D                                  * A132B
          CHR_D                                  * A1330
          CHR_D                                  * A1335
          CHR_D                                  * A133A
          UNIT                                   * A133F
            %       1.2398425E4                  * A1344
            $       "Å"                          * A1359
            umEND                                * A1365
          ;                                      * A136A
          CHR_D                                  * A136F
          UNIT                                   * A1374
            %       2.42631058E-2                * A1379
            $       "Å"                          * A138E
            umEND                                * A139A
          ;                                      * A139F
          CHR_D                                  * A13A4
          CHR_D                                  * A13A9
          CHR_D                                  * A13AE
          UNIT                                   * A13B3
            %       5.215961E3                   * A13B8
            $       "µ"                          * A13CD
            $       "°R"                         * A13D9
            um*                                  * A13E7
            umEND                                * A13EC
          ;                                      * A13F1
          CHR_D                                  * A13F6
          CHR_D                                  * A13FB
          CHR_D                                  * A1400
          CHR_D                                  * A1405
          CHR_D                                  * A140A
          CHR_D                                  * A140F
        }                                        * A1414

* ROMPTR 0E1 007
* refs (1): A07F5
ROMP_0E1_007:
        {                                        * A1419
          UNIT                                   * A141E
            %       6.0221367E23                 * A1423
            tok1                                 * A1438
            $       "gmol"                       * A143D
            um/                                  * A144F
            umEND                                * A1454
          ;                                      * A1459
          UNIT                                   * A145E
            %       1.380658E-23                 * A1463
            $       "J"                          * A1478
            $       "K"                          * A1484
            um/                                  * A1490
            umEND                                * A1495
          ;                                      * A149A
          UNIT                                   * A149F
            %       2.24141E1                    * A14A4
            $       "l"                          * A14B9
            $       "gmol"                       * A14C5
            um/                                  * A14D7
            umEND                                * A14DC
          ;                                      * A14E1
          UNIT                                   * A14E6
            %       8.31451E0                    * A14EB
            $       "J"                          * A1500
            $       "gmol"                       * A150C
            $       "K"                          * A151E
            um*                                  * A152A
            um/                                  * A152F
            umEND                                * A1534
          ;                                      * A1539
          UNIT                                   * A153E
            %       2.7315E2                     * A1543
            $       "K"                          * A1558
            umEND                                * A1564
          ;                                      * A1569
          UNIT                                   * A156E
            %       1.01325E2                    * A1573
            CHR_k                                * A1588
            $       "Pa"                         * A158D
            umP                                  * A159B
            umEND                                * A15A0
          ;                                      * A15A5
          UNIT                                   * A15AA
            %       5.67051E-8                   * A15AF
            $       "W"                          * A15C4
            tok_m                                * A15D0
            %2                                   * A15D5
            um^                                  * A15DA
            $       "K"                          * A15DF
            %4                                   * A15EB
            um^                                  * A15F0
            um*                                  * A15F5
            um/                                  * A15FA
            umEND                                * A15FF
          ;                                      * A1604
          UNIT                                   * A1609
            %       2.99792458E8                 * A160E
            tok_m                                * A1623
            tok_s                                * A1628
            um/                                  * A162D
            umEND                                * A1632
          ;                                      * A1637
          UNIT                                   * A163C
            %       8.85418781761E-12            * A1641
            $       "F"                          * A1656
            tok_m                                * A1662
            um/                                  * A1667
            umEND                                * A166C
          ;                                      * A1671
          UNIT                                   * A1676
            %       1.25663706144E-6             * A167B
            $       "H"                          * A1690
            tok_m                                * A169C
            um/                                  * A16A1
            umEND                                * A16A6
          ;                                      * A16AB
          UNIT                                   * A16B0
            %       9.80665E0                    * A16B5
            tok_m                                * A16CA
            tok_s                                * A16CF
            %2                                   * A16D4
            um^                                  * A16D9
            um/                                  * A16DE
            umEND                                * A16E3
          ;                                      * A16E8
          UNIT                                   * A16ED
            %       6.67259E-11                  * A16F2
            tok_m                                * A1707
            %3                                   * A170C
            um^                                  * A1711
            tok_s                                * A1716
            %2                                   * A171B
            um^                                  * A1720
            CHR_k                                * A1725
            tok_g                                * A172A
            umP                                  * A172F
            um*                                  * A1734
            um/                                  * A1739
            umEND                                * A173E
          ;                                      * A1743
          UNIT                                   * A1748
            %       6.6260755E-34                * A174D
            $       "J"                          * A1762
            tok_s                                * A176E
            um*                                  * A1773
            umEND                                * A1778
          ;                                      * A177D
          UNIT                                   * A1782
            %       1.05457266E-34               * A1787
            $       "J"                          * A179C
            tok_s                                * A17A8
            um*                                  * A17AD
            umEND                                * A17B2
          ;                                      * A17B7
          UNIT                                   * A17BC
            %       1.60217733E-19               * A17C1
            $       "C"                          * A17D6
            umEND                                * A17E2
          ;                                      * A17E7
          UNIT                                   * A17EC
            %       9.1093897E-31                * A17F1
            CHR_k                                * A1806
            tok_g                                * A180B
            umP                                  * A1810
            umEND                                * A1815
          ;                                      * A181A
          UNIT                                   * A181F
            %       1.75881962E11                * A1824
            $       "C"                          * A1839
            CHR_k                                * A1845
            tok_g                                * A184A
            umP                                  * A184F
            um/                                  * A1854
            umEND                                * A1859
          ;                                      * A185E
          UNIT                                   * A1863
            %       1.6726231E-27                * A1868
            CHR_k                                * A187D
            tok_g                                * A1882
            umP                                  * A1887
            umEND                                * A188C
          ;                                      * A1891
          %       1.836152701E3                  * A1896
          %       7.29735308E-3                  * A18AB
          UNIT                                   * A18C0
            %       2.06783461E-15               * A18C5
            $       "Wb"                         * A18DA
            umEND                                * A18E8
          ;                                      * A18ED
          UNIT                                   * A18F2
            %       9.6485309E4                  * A18F7
            $       "C"                          * A190C
            $       "gmol"                       * A1918
            um/                                  * A192A
            umEND                                * A192F
          ;                                      * A1934
          UNIT                                   * A1939
            %       1.0973731534E7               * A193E
            tok1                                 * A1953
            tok_m                                * A1958
            um/                                  * A195D
            umEND                                * A1962
          ;                                      * A1967
          UNIT                                   * A196C
            %       5.29177249E-2                * A1971
            CHR_n                                * A1986
            tok_m                                * A198B
            umP                                  * A1990
            umEND                                * A1995
          ;                                      * A199A
          UNIT                                   * A199F
            %       9.2740154E-24                * A19A4
            $       "J"                          * A19B9
            $       "T"                          * A19C5
            um/                                  * A19D1
            umEND                                * A19D6
          ;                                      * A19DB
          UNIT                                   * A19E0
            %       5.0507866E-27                * A19E5
            $       "J"                          * A19FA
            $       "T"                          * A1A06
            um/                                  * A1A12
            umEND                                * A1A17
          ;                                      * A1A1C
          UNIT                                   * A1A21
            %       1.2398425E3                  * A1A26
            CHR_n                                * A1A3B
            tok_m                                * A1A40
            umP                                  * A1A45
            umEND                                * A1A4A
          ;                                      * A1A4F
          UNIT                                   * A1A54
            %       2.4179883E14                 * A1A59
            $       "Hz"                         * A1A6E
            umEND                                * A1A7C
          ;                                      * A1A81
          UNIT                                   * A1A86
            %       2.42631058E-3                * A1A8B
            CHR_n                                * A1AA0
            tok_m                                * A1AA5
            umP                                  * A1AAA
            umEND                                * A1AAF
          ;                                      * A1AB4
          UNIT                                   * A1AB9
            %1                                   * A1ABE
            $       "r"                          * A1AC3
            umEND                                * A1ACF
          ;                                      * A1AD4
          UNIT                                   * A1AD9
            %       6.28318530718E0              * A1ADE
            $       "r"                          * A1AF3
            umEND                                * A1AFF
          ;                                      * A1B04
          UNIT                                   * A1B09
            %       1.8E2                        * A1B0E
            $       "°"                          * A1B23
            umEND                                * A1B2F
          ;                                      * A1B34
          UNIT                                   * A1B39
            %       2.897756E-3                  * A1B3E
            tok_m                                * A1B53
            $       "K"                          * A1B58
            um*                                  * A1B64
            umEND                                * A1B69
          ;                                      * A1B6E
          UNIT                                   * A1B73
            %       8.617386E-5                  * A1B78
            $       "J"                          * A1B8D
            $       "K"                          * A1B99
            $       "C"                          * A1BA5
            um*                                  * A1BB1
            um/                                  * A1BB6
            umEND                                * A1BBB
          ;                                      * A1BC0
          UNIT                                   * A1BC5
            %       5.52634696E7                 * A1BCA
            $       "F"                          * A1BDF
            tok_m                                * A1BEB
            $       "C"                          * A1BF0
            um*                                  * A1BFC
            um/                                  * A1C01
            umEND                                * A1C06
          ;                                      * A1C0B
          UNIT                                   * A1C10
            %       1.4185979E-30                * A1C15
            $       "F"                          * A1C2A
            $       "C"                          * A1C36
            um*                                  * A1C42
            tok_m                                * A1C47
            um/                                  * A1C4C
            umEND                                * A1C51
          ;                                      * A1C56
          %       1.19E1                         * A1C5B
          %       3.9E0                          * A1C70
          UNIT                                   * A1C85
            %       1E-12                        * A1C8A
            $       "W"                          * A1C9F
            tok_m                                * A1CAB
            %2                                   * A1CB0
            um^                                  * A1CB5
            um/                                  * A1CBA
            umEND                                * A1CBF
          ;                                      * A1CC4
        }                                        * A1CC9

* ROMPTR 0E1 008
* refs (1): A07F5
ROMP_0E1_008:
        ::                                       * A1CCE
          EDITDECOMP$                            * A1CD3
          BINT2                                  * A1CD8
          OVERLEN$                               * A1CDD
          #1-                                    * A1CE2
          SUB$                                   * A1CE7
          DUP                                    * A1CEC
          ROMPTR  0E1 005                        * A1CF1
          NTHOF                                  * A1CFC
          DUP                                    * A1D01
          #0=case                                * A1D06
          ROMPTR  0E1 00A                        * A1D0B
          SWAP                                   * A1D16
          $       "const"                        * A1D1B
          SWAP&$                                 * A1D2F
          $>ID                                   * A1D34
          SAFE@                                  * A1D39
          ITE                                    * A1D3E
          ::                                     * A1D43
            SWAPDROP                             * A1D48
            DUPTYPEEXT?                          * A1D4D
            BINT61                               * A1D52
            TestUserFlag                         * A1D57
            AND                                  * A1D5C
            ?CARCOMP                             * A1D61
          ;                                      * A1D66
          ROMPTR  0E1 009                        * A1D6B
        ;                                        * A1D76

* ROMPTR 0E1 009
* refs (1): A07F5
ROMP_0E1_009:
        ::                                       * A1D7B
          DUP                                    * A1D80
          BINT60                                 * A1D85
          UserITE                                * A1D8A
          ::                                     * A1D8F
            ROMPTR  0E1 006                      * A1D94
            OVER                                 * A1D9F
            NTHCOMPDROP                          * A1DA4
            DUPTYPECHAR?                         * A1DA9
            IT                                   * A1DAE
            ::                                   * A1DB3
              ROMPTR  0E1 007                    * A1DB8
              ROT                                * A1DC3
              NTHCOMPDROP                        * A1DC8
            ;                                    * A1DCD
            SWAPDROP                             * A1DD2
          ;                                      * A1DD7
          ::                                     * A1DDC
            ROMPTR  0E1 007                      * A1DE1
            SWAP                                 * A1DEC
            NTHCOMPDROP                          * A1DF1
          ;                                      * A1DF6
          BINT61                                 * A1DFB
          UserITE                                * A1E00
          ::                                     * A1E05
            DUPTYPEEXT?                          * A1E0A
            ?CARCOMP                             * A1E0F
            SWAP                                 * A1E14
            #       20                           * A1E19  32
            #=                                   * A1E23
            IT                                   * A1E28
            ::                                   * A1E2D
              BINT17                             * A1E32
              SysITE                             * A1E37
              ::                                 * A1E3C
                DROP                             * A1E41
                %PI                              * A1E46
              ;                                  * A1E4B
              ::                                 * A1E50
                BINT18                           * A1E55
                TestSysFlag                      * A1E5A
                IT                               * A1E5F
                ::                               * A1E64
                  DROP                           * A1E69
                  %       2E2                    * A1E6E
                ;                                * A1E83
              ;                                  * A1E88
            ;                                    * A1E8D
          ;                                      * A1E92
          SWAPDROP                               * A1E97
        ;                                        * A1E9C

* ROMPTR 0E1 00A
* refs (1): A07F5
ROMP_0E1_00A:
        ::                                       * A1EA1
          #       E129                           * A1EA6  57641
          ERROROUT                               * A1EB0
        ;                                        * A1EB5

* ROMPTR 0E1 00B
* refs (1): A07F5
ROMP_0E1_00B:
        CON(5)  DOARRY                           * A1EBA  array 41
        LENGTH                                   * A1EBF  length, to #A2382
        CON(5)  DOCSTR                           * A1EC4  element type
        CON(5)  1                                * A1EC9  dimensions
        CON(5)  41                               * A1ECE
        $BODY   "Avogadro's number"              * A1ED3  1
        $BODY   "Boltzmann"                      * A1EFA  2
        $BODY   "molar volume"                   * A1F11  3
        $BODY   "universal gas"                  * A1F2E  4
        $BODY   "std temperature"                * A1F4D  5
        $BODY   "std pressure"                   * A1F70  6
        $BODY   "Stefan-Boltzmann"               * A1F8D  7
        $BODY   "speed of light"                 * A1FB2  8
        $BODY   "permittivity"                   * A1FD3  9
        $BODY   "permeability"                   * A1FF0  10
        $BODY   "accel of gravity"               * A200D  11
        $BODY   "gravitation"                    * A2032  12
        $BODY   "Planck's"                       * A204D  13
        $BODY   "Dirac's"                        * A2062  14
        $BODY   "electronic charge"              * A2075  15
        $BODY   "electron mass"                  * A209C  16
        $BODY   "q/me ratio"                     * A20BB  17
        $BODY   "proton mass"                    * A20D4  18
        $BODY   "mp/me ratio"                    * A20EF  19
        $BODY   "fine structure"                 * A210A  20
        $BODY   "mag flux quantum"               * A212B  21
        $BODY   "Faraday"                        * A2150  22
        $BODY   "Rydberg"                        * A2163  23
        $BODY   "Bohr radius"                    * A2176  24
        $BODY   "Bohr magneton"                  * A2191  25
        $BODY   "nuclear magneton"               * A21B0  26
        $BODY   "photon wavelength"              * A21D5  27
        $BODY   "photon frequency"               * A21FC  28
        $BODY   "Compton wavelen"                * A2221  29
        $BODY   "1 radian"                       * A2244  30
        $BODY   "2π radians"                     * A2259  31
        $BODY   "∡ in trig mode"                 * A2272  32
        $BODY   "Wien's"                         * A2293  33
        $BODY   "k/q"                            * A22A4  34
        $BODY   "ε0/q"                           * A22AF  35
        $BODY   "q*ε0"                           * A22BC  36
        $BODY   "dielectric const"               * A22C9  37
        $BODY   "SiO2 dielec cons"               * A22EE  38
        $BODY   "ref intensity"                  * A2313  39
        $BODY   "CONSTANTS LIBRARY"              * A2332  40
        $BODY   "Undefined Constant"             * A2359  41
        ENDLENGTH                                * A2382

LIB0E1.hash:
        CON(5)  DOHSTR                           * A2382  hash table of library 0E1
        LENGTH                                   * A2387  length, to #A23E6
        CON(5)  0                                * A238C  names of length 1
        CON(5)  0                                * A2391  names of length 2
        CON(5)  0                                * A2396  names of length 3
        CON(5)  0                                * A239B  names of length 4
        CON(5)  0                                * A23A0  names of length 5
        CON(5)  0                                * A23A5  names of length 6
        CON(5)  0                                * A23AA  names of length 7
        CON(5)  0                                * A23AF  names of length 8
        CON(5)  0                                * A23B4  names of length 9
        CON(5)  0                                * A23B9  names of length 10
        CON(5)  0                                * A23BE  names of length 11
        CON(5)  0                                * A23C3  names of length 12
        CON(5)  0                                * A23C8  names of length 13
        CON(5)  0                                * A23CD  names of length 14
        CON(5)  0                                * A23D2  names of length 15
        CON(5)  0                                * A23D7  names of length 16
        REL(5)  L_A23E1                          * A23DC  end of the names
L_A23E1:
        CON(5)  0                                * A23E1  command 000 has no name
        ENDLENGTH                                * A23E6

LIB0E1.link:
        CON(5)  DOHSTR                           * A23E6  link table of library 0E1
        LENGTH                                   * A23EB  length, to #A242C
        REL(5)  ROMP_0E1_000                     * A23F0  000 
        REL(5)  ROMP_0E1_001                     * A23F5  001 
        REL(5)  ROMP_0E1_002                     * A23FA  002 
        REL(5)  ROMP_0E1_003                     * A23FF  003 
        REL(5)  ROMP_0E1_004                     * A2404  004 
        REL(5)  ROMP_0E1_005                     * A2409  005 
        REL(5)  ROMP_0E1_006                     * A240E  006 
        REL(5)  ROMP_0E1_007                     * A2413  007 
        REL(5)  ROMP_0E1_008                     * A2418  008 
        REL(5)  ROMP_0E1_009                     * A241D  009 
        REL(5)  ROMP_0E1_00A                     * A2422  00A 
        REL(5)  ROMP_0E1_00B                     * A2427  00B 
        ENDLENGTH                                * A242C
        BSS     4                                * A242C
        ENDLENGTH                                * A2430
        NIBHEX  2072100                          * A2430  .'.
