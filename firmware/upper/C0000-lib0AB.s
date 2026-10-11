* HP 48GX ROM revision R, #C0000-#C31BD: Library part 0AB
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: →ROW →DIAG →COL ΣLIST ΠLIST ΔLIST rpm lbmol gmol dB ZVOL ZFACTOR

        ORG     #C0000
        NIBHEX  EB13000                          * C0000  ¾1.

LIB0AB:
        CON(3)  #0AB                             * C0007  library number
        REL(5)  LIB0AB.hash                      * C000A  hash table
        CON(5)  0                                * C000F  message table
        REL(5)  LIB0AB.link                      * C0014  link table
        REL(5)  LIB0AB.config                    * C0019  config

* ROMPTR 0AB 000
* refs (1): C0007
        CON(1)  8                                * C001E  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C001F  library
        CON(3)  #000                             * C0022  command
        RPL
XVOL:
        ::                                       * C0025
          CK2&Dispatch                           * C002A
          BINT17                                 * C002F
          ROMPTR  0B5 081                        * C0034
        ;                                        * C003F

* ROMPTR 0AB 001
* refs (1): C0007
        CON(1)  8                                * C0044  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0045  library
        CON(3)  #001                             * C0048  command
YVOL:
        ::                                       * C004B
          CK2&Dispatch                           * C0050
          BINT17                                 * C0055
          ROMPTR  0B5 083                        * C005A
        ;                                        * C0065

* ROMPTR 0AB 002
* refs (1): C0007
        CON(1)  8                                * C006A  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C006B  library
        CON(3)  #002                             * C006E  command
ZVOL:
        ::                                       * C0071
          CK2&Dispatch                           * C0076
          BINT17                                 * C007B
          ROMPTR  0B5 085                        * C0080
        ;                                        * C008B

* ROMPTR 0AB 003
* refs (1): C0007
        CON(1)  8                                * C0090  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0091  library
        CON(3)  #003                             * C0094  command
XXRNG:
        ::                                       * C0097
          CK2&Dispatch                           * C009C
          BINT17                                 * C00A1
          ROMPTR  0B5 089                        * C00A6
        ;                                        * C00B1

* ROMPTR 0AB 004
* refs (1): C0007
        CON(1)  8                                * C00B6  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C00B7  library
        CON(3)  #004                             * C00BA  command
YYRNG:
        ::                                       * C00BD
          CK2&Dispatch                           * C00C2
          BINT17                                 * C00C7
          ROMPTR  0B5 08B                        * C00CC
        ;                                        * C00D7

* ROMPTR 0AB 005
* refs (1): C0007
        CON(1)  8                                * C00DC  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C00DD  library
        CON(3)  #005                             * C00E0  command
EYEPT:
        ::                                       * C00E3
          CK3&Dispatch                           * C00E8
          #       111                            * C00ED  273
          ROMPTR  0B5 087                        * C00F7
        ;                                        * C0102

* ROMPTR 0AB 006
* refs (1): C0007
        CON(1)  8                                * C0107  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0108  library
        CON(3)  #006                             * C010B  command
NUMX:
        ::                                       * C010E
          CK1&Dispatch                           * C0113
          BINT1                                  * C0118
          ROMPTR  0B5 07D                        * C011D
        ;                                        * C0128

* ROMPTR 0AB 007
* refs (1): C0007
        CON(1)  8                                * C012D  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C012E  library
        CON(3)  #007                             * C0131  command
NUMY:
        ::                                       * C0134
          CK1&Dispatch                           * C0139
          BINT1                                  * C013E
          ROMPTR  0B5 07F                        * C0143
        ;                                        * C014E

* ROMPTR 0AB 008
* refs (1): C0007
        CON(1)  12                               * C0153  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0154  library
        CON(3)  #008                             * C0157  command
WIREFRAME:
        ::                                       * C015A
          CK0                                    * C015F
          '                                      * C0164
          ROMPTR  0AB 008                        * C0169  WIREFRAME
          PUTPTYPE                               * C0174
        ;                                        * C0179

        {                                        * C017E
          TRUE                                   * C0183
          ROMPTR  0F1 002                        * C0188
          NOP                                    * C0193
          FALSE                                  * C0198
          {                                      * C019D
            OBJ_47209                            * C01A2
            OBJ_457BC                            * C01A7
            OBJ_45BB6                            * C01AC
            {                                    * C01B1
              ::                                 * C01B6
                ROMPTR  0F1 028                  * C01BB
                ROMPTR  0F1 02D                  * C01C6
              ;                                  * C01D1
              NOP                                * C01D6
            }                                    * C01DB
            ::                                   * C01E0
              ROMPTR  0F1 02C                    * C01E5
              ROMPTR  0F1 02D                    * C01F0
            ;                                    * C01FB
          }                                      * C0200
          FALSE                                  * C0205
          NOP                                    * C020A
          NOP                                    * C020F
          %1                                     * C0214
          FALSE                                  * C0219
          FALSE                                  * C021E
          FALSE                                  * C0223
          OBJ_570E5                              * C0228
          OBJ_45AEB                              * C022D
          OBJ_45B8D                              * C0232
          ROMPTR  0F1 026                        * C0237
        }                                        * C0242

* ROMPTR 0AB 009
* refs (1): C0007
        CON(1)  12                               * C0247  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0248  library
        CON(3)  #009                             * C024B  command
PARSURFACE:
        ::                                       * C024E
          CK0                                    * C0253
          '                                      * C0258
          ROMPTR  0AB 009                        * C025D  PARSURFACE
          PUTPTYPE                               * C0268
        ;                                        * C026D

        {                                        * C0272
          TRUE                                   * C0277
          ROMPTR  0F1 010                        * C027C
          NOP                                    * C0287
          FALSE                                  * C028C
          {                                      * C0291
            OBJ_47209                            * C0296
            OBJ_4590E                            * C029B
            OBJ_45BB6                            * C02A0
            {                                    * C02A5
              ::                                 * C02AA
                ROMPTR  0F1 028                  * C02AF
                ROMPTR  0F1 031                  * C02BA
              ;                                  * C02C5
              NOP                                * C02CA
            }                                    * C02CF
            ::                                   * C02D4
              ROMPTR  0F1 02C                    * C02D9
              ROMPTR  0F1 031                    * C02E4
            ;                                    * C02EF
          }                                      * C02F4
          FALSE                                  * C02F9
          NOP                                    * C02FE
          NOP                                    * C0303
          %1                                     * C0308
          FALSE                                  * C030D
          FALSE                                  * C0312
          FALSE                                  * C0317
          OBJ_5712B                              * C031C
          OBJ_45A1B                              * C0321
          OBJ_45006                              * C0326
          ROMPTR  0F1 026                        * C032B
        }                                        * C0336

* ROMPTR 0AB 00A
* refs (1): C0007
        CON(1)  12                               * C033B  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C033C  library
        CON(3)  #00A                             * C033F  command
GRIDMAP:
        ::                                       * C0342
          CK0                                    * C0347
          '                                      * C034C
          ROMPTR  0AB 00A                        * C0351  GRIDMAP
          PUTPTYPE                               * C035C
        ;                                        * C0361

        {                                        * C0366
          TRUE                                   * C036B
          ROMPTR  0F1 00C                        * C0370
          NOP                                    * C037B
          FALSE                                  * C0380
          {                                      * C0385
            OBJ_47209                            * C038A
            OBJ_4590E                            * C038F
            OBJ_45BB6                            * C0394
            {                                    * C0399
              ::                                 * C039E
                ROMPTR  0F1 028                  * C03A3
                ROMPTR  0F1 02E                  * C03AE
              ;                                  * C03B9
              NOP                                * C03BE
            }                                    * C03C3
            ::                                   * C03C8
              ROMPTR  0F1 02C                    * C03CD
              ROMPTR  0F1 02E                    * C03D8
            ;                                    * C03E3
          }                                      * C03E8
          FALSE                                  * C03ED
          NOP                                    * C03F2
          NOP                                    * C03F7
          %1                                     * C03FC
          FALSE                                  * C0401
          FALSE                                  * C0406
          FALSE                                  * C040B
          OBJ_57108                              * C0410
          OBJ_45986                              * C0415
          OBJ_459E3                              * C041A
          ROMPTR  0F1 026                        * C041F
        }                                        * C042A

* ROMPTR 0AB 00B
* refs (1): C0007
        CON(1)  12                               * C042F  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0430  library
        CON(3)  #00B                             * C0433  command
YSLICE:
        ::                                       * C0436
          CK0                                    * C043B
          '                                      * C0440
          ROMPTR  0AB 00B                        * C0445  YSLICE
          PUTPTYPE                               * C0450
        ;                                        * C0455

        {                                        * C045A
          TRUE                                   * C045F
          ROMPTR  0F1 013                        * C0464
          NOP                                    * C046F
          FALSE                                  * C0474
          {                                      * C0479
            OBJ_47209                            * C047E
            OBJ_462C6                            * C0483
            OBJ_45BB6                            * C0488
            {                                    * C048D
              ::                                 * C0492
                ROMPTR  0F1 028                  * C0497
                ROMPTR  0F1 02F                  * C04A2
              ;                                  * C04AD
              NOP                                * C04B2
            }                                    * C04B7
            ::                                   * C04BC
              ROMPTR  0F1 02C                    * C04C1
              ROMPTR  0F1 02F                    * C04CC
            ;                                    * C04D7
          }                                      * C04DC
          FALSE                                  * C04E1
          NOP                                    * C04E6
          NOP                                    * C04EB
          %1                                     * C04F0
          FALSE                                  * C04F5
          FALSE                                  * C04FA
          FALSE                                  * C04FF
          OBJ_45C5D                              * C0504
          OBJ_45C80                              * C0509
          OBJ_45CAE                              * C050E
          ROMPTR  0F1 026                        * C0513
        }                                        * C051E

* ROMPTR 0AB 00C
* refs (1): C0007
        CON(1)  12                               * C0523  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0524  library
        CON(3)  #00C                             * C0527  command
SLOPEFIELD:
        ::                                       * C052A
          CK0                                    * C052F
          '                                      * C0534
          ROMPTR  0AB 00C                        * C0539  SLOPEFIELD
          PUTPTYPE                               * C0544
        ;                                        * C0549

        {                                        * C054E
          TRUE                                   * C0553
          ROMPTR  0F1 019                        * C0558
          NOP                                    * C0563
          TRUE                                   * C0568
          {                                      * C056D
            OBJ_47209                            * C0572
            OBJ_4620E                            * C0577
            OBJ_45BB6                            * C057C
            {                                    * C0581
              ::                                 * C0586
                ROMPTR  0F1 028                  * C058B
                ROMPTR  0F1 030                  * C0596
              ;                                  * C05A1
              NOP                                * C05A6
            }                                    * C05AB
            ::                                   * C05B0
              ROMPTR  0F1 02C                    * C05B5
              ROMPTR  0F1 030                    * C05C0
            ;                                    * C05CB
          }                                      * C05D0
          FALSE                                  * C05D5
          NOP                                    * C05DA
          NOP                                    * C05DF
          %1                                     * C05E4
          FALSE                                  * C05E9
          FALSE                                  * C05EE
          FALSE                                  * C05F3
          OBJ_45C3A                              * C05F8
          OBJ_45A59                              * C05FD
          OBJ_44FF2                              * C0602
          ROMPTR  0F1 026                        * C0607
        }                                        * C0612

* ROMPTR 0AB 00D
* refs (1): C0007
        CON(1)  12                               * C0617  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0618  library
        CON(3)  #00D                             * C061B  command
PCONTOUR:
        ::                                       * C061E
          CK0                                    * C0623
          '                                      * C0628
          ROMPTR  0AB 00D                        * C062D  PCONTOUR
          PUTPTYPE                               * C0638
        ;                                        * C063D

        {                                        * C0642
          TRUE                                   * C0647
          ROMPTR  0F1 020                        * C064C
          NOP                                    * C0657
          TRUE                                   * C065C
          {                                      * C0661
            OBJ_47209                            * C0666
            OBJ_4620E                            * C066B
            OBJ_45BB6                            * C0670
            {                                    * C0675
              ::                                 * C067A
                ROMPTR  0F1 028                  * C067F
                ROMPTR  0F1 032                  * C068A
              ;                                  * C0695
              NOP                                * C069A
            }                                    * C069F
            ::                                   * C06A4
              ROMPTR  0F1 02C                    * C06A9
              ROMPTR  0F1 032                    * C06B4
            ;                                    * C06BF
          }                                      * C06C4
          FALSE                                  * C06C9
          NOP                                    * C06CE
          NOP                                    * C06D3
          %1                                     * C06D8
          FALSE                                  * C06DD
          FALSE                                  * C06E2
          FALSE                                  * C06E7
          OBJ_5714E                              * C06EC
          OBJ_45A59                              * C06F1
          OBJ_44FF2                              * C06F6
          ROMPTR  0F1 026                        * C06FB
        }                                        * C0706

* ROMPTR 0AB 00E
* refs (1): C0007
        CON(1)  12                               * C070B  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C070C  library
        CON(3)  #00E                             * C070F  command
DIFFEQ:
        ::                                       * C0712
          CK0                                    * C0717
          '                                      * C071C
          ROMPTR  0AB 00E                        * C0721  DIFFEQ
          PUTPTYPE                               * C072C
        ;                                        * C0731

        {                                        * C0736
          TRUE                                   * C073B
          ROMPTR  0B5 07A                        * C0740
          NOP                                    * C074B
          TRUE                                   * C0750
          NULL{}                                 * C0755
          FALSE                                  * C075A
          OBJ_4B6C5                              * C075F
          ::                                     * C0764
            BINT31                               * C0769
            TestSysFlag                          * C076E
            ITE                                  * C0773
            ::                                   * C0778
              '                                  * C077D
              OBJ_4CE0B                          * C0782
            ;                                    * C0787
            ::                                   * C078C
              '                                  * C0791
              OBJ_4C34B                          * C0796
            ;                                    * C079B
          ;                                      * C07A0
          %0_2A2B4                               * C07A5
          FALSE                                  * C07AA
          FALSE                                  * C07AF
          FALSE                                  * C07B4
          OBJ_73211                              * C07B9
          OBJ_73270                              * C07BE
          ROMPTR  0F1 03F                        * C07C3
          OBJ_73594                              * C07CE
          NOP                                    * C07D3
        }                                        * C07D8

* ROMPTR 0AB 00F
* refs (1): C0007
        CON(1)  8                                * C07DD  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C07DE  library
        CON(3)  #00F                             * C07E1  command
VERSION:
        ::                                       * C07E4
          CK0                                    * C07E9
          #       VersionStrings                 * C07EE  the version object, read by VERSION
          OBJ_7295C                              * C07F8
          TOTEMPOB                               * C07FD
          EVAL                                   * C0802
        ;                                        * C0807

* refs (1): C0007
LIB0AB.config:
        ::                                       * C080C
          #       AB                             * C0811  171
          TOSRRP                                 * C081B
        ;                                        * C0820

* ROMPTR 0AB 010
* refs (1): C0007
        CON(1)  8                                * C0825  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0826  library
        CON(3)  #010                             * C0829  command
ATICK:
        ::                                       * C082C
          CK1&Dispatch                           * C0831
          BINT1                                  * C0836
          ROMPTR  0E8 03F                        * C083B
          BINT11                                 * C0846
          ROMPTR  0E8 03F                        * C084B
          BINT5                                  * C0856
          ROMPTR  0E8 03F                        * C085B
        ;                                        * C0866

* ROMPTR 0AB 011
* refs (1): C0007
        CON(1)  8                                * C086B  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C086C  library
        CON(3)  #011                             * C086F  command
TEACH:
        ::                                       * C0872
          CK0                                    * C0877
          ROMPTR  0E8 02D                        * C087C
        ;                                        * C0887

* ROMPTR 0AB 012
* refs (1): C0007
        CON(1)  8                                * C088C  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C088D  library
        CON(3)  #012                             * C0890  command
CLTEACH:
        ::                                       * C0893
          CK0                                    * C0898
          ROMPTR  0E8 02C                        * C089D
        ;                                        * C08A8

* ROMPTR 0AB 013
* refs (1): C0007
        CON(1)  8                                * C08AD  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C08AE  library
        CON(3)  #013                             * C08B1  command
RECT:
        ::                                       * C08B4
          CK0                                    * C08B9
          BINT16                                 * C08BE
          ClrSysFlag                             * C08C3
        ;                                        * C08C8

* ROMPTR 0AB 014
* refs (1): C0007
        CON(1)  8                                * C08CD  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C08CE  library
        CON(3)  #014                             * C08D1  command
CYLIN:
        ::                                       * C08D4
          CK0                                    * C08D9
          BINT15                                 * C08DE
          ClrSysFlag                             * C08E3
          BINT16                                 * C08E8
          SetSysFlag                             * C08ED
        ;                                        * C08F2

* ROMPTR 0AB 015
* refs (1): C0007
        CON(1)  8                                * C08F7  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C08F8  library
        CON(3)  #015                             * C08FB  command
SPHERE:
        ::                                       * C08FE
          CK0                                    * C0903
          BINT15                                 * C0908
          SetSysFlag                             * C090D
          BINT16                                 * C0912
          SetSysFlag                             * C0917
        ;                                        * C091C

* ROMPTR 0AB 016
* refs (1): C0007
        CON(1)  8                                * C0921  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0922  library
        CON(3)  #016                             * C0925  command
MERGE1:
        ::                                       * C0928
          CK0                                    * C092D
          BINT1                                  * C0932
          OBJ_0B40C                              * C0937
        ;                                        * C093C

* ROMPTR 0AB 017
* refs (1): C0007
        CON(1)  8                                * C0941  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0942  library
        CON(3)  #017                             * C0945  command
FREE1:
        ::                                       * C0948
          CK1&Dispatch                           * C094D
          BINT5                                  * C0952
          ::                                     * C0957
            %1                                   * C095C
            free(li,r)                           * C0961
          ;                                      * C0966
          BINT6                                  * C096B
          ::                                     * C0970
            %1                                   * C0975
            free(2r)                             * C097A
          ;                                      * C097F
          BINT7                                  * C0984
          ::                                     * C0989
            %1                                   * C098E
            free(2r)                             * C0993
          ;                                      * C0998
          BINT1                                  * C099D
          ::                                     * C09A2
            %1                                   * C09A7
            free(2r)                             * C09AC
          ;                                      * C09B1
        ;                                        * C09B6

* ROMPTR 0AB 018
* refs (1): C0007
        CON(1)  8                                * C09BB  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C09BC  library
        CON(3)  #018                             * C09BF  command
ANIMATE:
        ::                                       * C09C2
          CK1&Dispatch                           * C09C7
          BINT1                                  * C09CC
          ::                                     * C09D1
            CKNNOLASTWD                          * C09D6
            MINUSONE                             * C09DB
            SWAP                                 * C09E0
            %.1                                  * C09E5
            ZEROZERO                             * C09EA
            FALSE                                * C09EF
            ROMPTR  0AB 019                      * C09F4
          ;                                      * C09FF
          BINT5                                  * C0A04
          ::                                     * C0A09
            INNERCOMP                            * C0A0E
            BINT4                                * C0A13
            #=                                   * C0A18
            ?SKIP                                * C0A1D
            ARGNUMERR                            * C0A22
            CKREAL                               * C0A27
            COERCE                               * C0A2C
            DUP#0=                               * C0A31
            IT                                   * C0A36
            #1-                                  * C0A3B
            4ROLL                                * C0A40
            CKREAL                               * C0A45
            COERCE                               * C0A4A
            DUP                                  * C0A4F
            DEPTH                                * C0A54
            #5-                                  * C0A59
            #>                                   * C0A5E
            IT                                   * C0A63
            SETSTACKERR                          * C0A68
            ROT                                  * C0A6D
            CKREAL                               * C0A72
            4ROLL                                * C0A77
            2HXSLIST?                            * C0A7C
            TRUE                                 * C0A81

* ROMPTR 0AB 019
* refs (1): C0007
ROMP_0AB_019:
            ::                                   * C0A86
              CHECKPICT                          * C0A8B
              TOGDISP                            * C0A90
              TURNMENUOFF                        * C0A95
              TRUE                               * C0A9A
              {                                  * C0A9F
                LAM     'SaveAnim                * C0AA4
              }                                  * C0ABD
              BIND                               * C0AC2
              ROMPTR  0AB 01B                    * C0AC7
              ABND                               * C0AD2
            ;                                    * C0AD7
          ;                                      * C0ADC
        ;                                        * C0AE1

* ROMPTR 0AB 01A
* refs (1): C0007
* slots of 0AB 018 (derivative, inverse, ...: used by the symbolic code)
ROMP_0AB_01A:
        ::                                       * C0AE6  slot 0
          MINUSONE                               * C0AEB
          SWAP                                   * C0AF0
          COERCE                                 * C0AF5
          %.1                                    * C0AFA
          ZEROZERO                               * C0AFF
          FALSE                                  * C0B04

* ROMPTR 0AB 01B
* refs (1): C0007
ROMP_0AB_01B:
          ::                                     * C0B09
            {                                    * C0B0E
              NULLLAM                            * C0B13
              NULLLAM                            * C0B18
              NULLLAM                            * C0B1D
              NULLLAM                            * C0B22
              NULLLAM                            * C0B27
              NULLLAM                            * C0B2C
            }                                    * C0B31
            BIND                                 * C0B36
            ERRSET                               * C0B3B
            ::                                   * C0B40
              6GETLAM                            * C0B45
              ZERO_DO                            * C0B4A
              5GETLAM                            * C0B4F
              ZERO_DO                            * C0B54
              GBUFF                              * C0B59
              5GETLAM                            * C0B5E
              INDEX@                             * C0B63
              #-                                 * C0B68
              #1+                                * C0B6D
              PICK                               * C0B72
              ROMPTR@NOT                         * C0B77
              DROP                               * C0B7C
              DUPTYPEGROB?                       * C0B81
              ?SKIP                              * C0B86
              SETTYPEERR                         * C0B8B
              3GETLAM                            * C0B90
              2GETLAM                            * C0B95
              ChkRepl(2go,2s)                    * C0B9A
              DROP                               * C0B9F
              4GETLAM                            * C0BA4
              dowait                             * C0BA9
              ?ATTNQUIT                          * C0BAE
              LOOP                               * C0BB3
              LOOP                               * C0BB8
            ;                                    * C0BBD
            ERRTRAP                              * C0BC2
            ::                                   * C0BC7
              ERROR@                             * C0BCC
              #0=                                * C0BD1
              ?SEMI                              * C0BD6
              ERRJMP                             * C0BDB
            ;                                    * C0BE0
            ::                                   * C0BE5
              5GETLAM                            * C0BEA
              '                                  * C0BEF
              LAM     'SaveAnim                  * C0BF4
              undo                               * C0C0D
              NOTcase                            * C0C12
              UNCOERCE                           * C0C17
              NOTcase                            * C0C1C
              NDROP                              * C0C21
              UNCOERCE                           * C0C26
              1GETLAM                            * C0C2B
              NOT?SEMI                           * C0C30
              3GETLAM                            * C0C35
              #>HXS                              * C0C3A
              2GETLAM                            * C0C3F
              #>HXS                              * C0C44
              TWO{}N                             * C0C49
              4GETLAM                            * C0C4E
              6GETLAM                            * C0C53
              DUP                                * C0C58
              MINUSONE                           * C0C5D
              #=                                 * C0C62
              IT                                 * C0C67
              DROPZERO                           * C0C6C
              UNCOERCE                           * C0C71
              BINT4                              * C0C76
              {}N                                * C0C7B
            ;                                    * C0C80
            ABND                                 * C0C85
          ;                                      * C0C8A
        ;                                        * C0C8F
        CON(2)  #01                              * C0C94  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 01C
* refs (1): C0007
        CON(1)  1                                * C0C96  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0C97  library
        CON(3)  #01C                             * C0C9A  command
LININ:
        ::                                       * C0C9D
          CK2&Dispatch                           * C0CA2
          SYMSYM                                 * C0CA7
          ROMPTR  0AB 01D                        * C0CAC
          BINT26                                 * C0CB7
          ::                                     * C0CBC
            DROP                                 * C0CC1
            %1                                   * C0CC6
          ;                                      * C0CCB
          BINT42                                 * C0CD0
          ::                                     * C0CD5
            DROP                                 * C0CDA
            %1                                   * C0CDF
          ;                                      * C0CE4
          EXTSYM                                 * C0CE9
          ::                                     * C0CEE
            DROP                                 * C0CF3
            %1                                   * C0CF8
          ;                                      * C0CFD
        ;                                        * C0D02

        HXS     01426350                         * C0D07

        {                                        * C0D19
          OBJ_5A333                              * C0D1E
          #2=                                    * C0D23
        }                                        * C0D28

* ROMPTR 0AB 01D
* refs (1): C0007
ROMP_0AB_01D:
        ::                                       * C0D2D
          symcomp                                * C0D32
          ChkExpr1Name                           * C0D37
          CARCOMP                                * C0D3C
          DUP                                    * C0D41
          {                                      * C0D46
            lam'dvar                             * C0D4B
            lam'dvar                             * C0D50
          }                                      * C0D55
          BIND                                   * C0D5A
          ZEROSWAP                               * C0D5F
          EXPLODE                                * C0D64
          >dvars                                 * C0D69
          dvars?                                 * C0D6E
          ABND                                   * C0D73
          NOTcase                                * C0D78
          ::                                     * C0D7D
            NDROP                                * C0D82
            %1                                   * C0D87
          ;                                      * C0D8C
          linear!                                * C0D91
          OVER#2+UNROL                           * C0D96
          NDROP                                  * C0D9B
          COERCEFLAG                             * C0DA0
        ;                                        * C0DA5

* ROMPTR 0AB 01E
* refs (1): C0007
        CON(1)  8                                * C0DAA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0DAB  library
        CON(3)  #01E                             * C0DAE  command
LIBEVAL:
        ::                                       * C0DB1
          CK1&Dispatch                           * C0DB6
          BINT11                                 * C0DBB
          ROMPTR  0AB 01F                        * C0DC0
        ;                                        * C0DCB

* ROMPTR 0AB 01F
* refs (1): C0007
ROMP_0AB_01F:
        ::                                       * C0DD0
          DUP                                    * C0DD5
          LENHXS                                 * C0DDA
          BINT6                                  * C0DDF
          #<case                                 * C0DE4
          ROMPTR  0E7 007                        * C0DE9
          DUP                                    * C0DF4
          BINT4                                  * C0DF9
          BINT6                                  * C0DFE
          SUBHXS                                 * C0E03
          HXS>#                                  * C0E08
          SWAP                                   * C0E0D
          BINT1                                  * C0E12
          BINT3                                  * C0E17
          SUBHXS                                 * C0E1C
          HXS>#                                  * C0E21
          #>ROMPTR                               * C0E26
          COLA_EVAL                              * C0E2B
        ;                                        * C0E30

* ROMPTR 0AB 020
* refs (1): C0007
        CON(1)  8                                * C0E35  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0E36  library
        CON(3)  #020                             * C0E39  command
CONLIB:
        ::                                       * C0E3C
          CK0                                    * C0E41
          ROMPTR  0E1 000                        * C0E46
        ;                                        * C0E51

* slots of 0AB 020 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #01                              * C0E56  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 021
* refs (1): C0007
        CON(1)  1                                * C0E58  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0E59  library
        CON(3)  #021                             * C0E5C  command
CONST:
        ::                                       * C0E5F
          CK1&Dispatch                           * C0E64
          BINT10                                 * C0E69
          ROMPTR  0E1 008                        * C0E6E
        ;                                        * C0E79

        HXS     014350                           * C0E7E

        ROMPTR  0E7 011                          * C0E8E  ~UTVUNS1Arg

* ROMPTR 0AB 022
* refs (1): C0007
        CON(1)  8                                * C0E99  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0E9A  library
        CON(3)  #022                             * C0E9D  command
EQNLIB:
        ::                                       * C0EA0
          CK0                                    * C0EA5
          ROMPTR  0E3 00C                        * C0EAA
        ;                                        * C0EB5

* ROMPTR 0AB 023
* refs (1): C0007
        CON(1)  8                                * C0EBA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0EBB  library
        CON(3)  #023                             * C0EBE  command
SOLVEQN:
        ::                                       * C0EC1
          CK3&Dispatch                           * C0EC6
          3REAL                                  * C0ECB
          ROMPTR  0E3 06C                        * C0ED0
        ;                                        * C0EDB

* ROMPTR 0AB 025
* refs (1): C0007
        CON(1)  8                                * C0EE0  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0EE1  library
        CON(3)  #025                             * C0EE4  command
FFT:
        ::                                       * C0EE7
          CK1&Dispatch                           * C0EEC
          BINT4                                  * C0EF1
          ROMPTR  0C4 000                        * C0EF6
        ;                                        * C0F01

* ROMPTR 0AB 026
* refs (1): C0007
        CON(1)  8                                * C0F06  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0F07  library
        CON(3)  #026                             * C0F0A  command
IFFT:
        ::                                       * C0F0D
          CK1&Dispatch                           * C0F12
          BINT4                                  * C0F17
          ROMPTR  0C4 002                        * C0F1C
        ;                                        * C0F27

* ROMPTR 0AB 027
* refs (1): C0007
        CON(1)  8                                * C0F2C  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0F2D  library
        CON(3)  #027                             * C0F30  command
NDIST:
        ::                                       * C0F33
          CK3&Dispatch                           * C0F38
          3REAL                                  * C0F3D
          ROMPTR  0C4 005                        * C0F42
        ;                                        * C0F4D

* ROMPTR 0AB 028
* refs (1): C0007
        CON(1)  8                                * C0F52  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0F53  library
        CON(3)  #028                             * C0F56  command
PSDEV:
        ::                                       * C0F59
          CK0                                    * C0F5E
          ROMPTR  0C4 006                        * C0F63
        ;                                        * C0F6E

* ROMPTR 0AB 029
* refs (1): C0007
        CON(1)  8                                * C0F73  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0F74  library
        CON(3)  #029                             * C0F77  command
PVAR:
        ::                                       * C0F7A
          CK0                                    * C0F7F
          ROMPTR  0C4 007                        * C0F84
        ;                                        * C0F8F

* ROMPTR 0AB 02A
* refs (1): C0007
        CON(1)  8                                * C0F94  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0F95  library
        CON(3)  #02A                             * C0F98  command
PCOV:
        ::                                       * C0F9B
          CK0                                    * C0FA0
          ROMPTR  0C4 008                        * C0FA5
        ;                                        * C0FB0

* ROMPTR 0AB 02B
* refs (1): C0007
        CON(1)  8                                * C0FB5  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0FB6  library
        CON(3)  #02B                             * C0FB9  command
RKF:
        ::                                       * C0FBC
          CK3&Dispatch                           * C0FC1
          #       511                            * C0FC6  1297
          ROMPTR  0C1 00E                        * C0FD0
          #       551                            * C0FDB  1361
          ROMPTR  0C1 00E                        * C0FE5
        ;                                        * C0FF0

* ROMPTR 0AB 02C
* refs (1): C0007
        CON(1)  8                                * C0FF5  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0FF6  library
        CON(3)  #02C                             * C0FF9  command
RKFSTEP:
        ::                                       * C0FFC
          CK3&Dispatch                           * C1001
          #       511                            * C1006  1297
          ROMPTR  0C1 00A                        * C1010
        ;                                        * C101B

* ROMPTR 0AB 02D
* refs (1): C0007
        CON(1)  8                                * C1020  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1021  library
        CON(3)  #02D                             * C1024  command
RKFERR:
        ::                                       * C1027
          CK2&Dispatch                           * C102C
          #       51                             * C1031  81
          ROMPTR  0C1 005                        * C103B
        ;                                        * C1046

* ROMPTR 0AB 02E
* refs (1): C0007
        CON(1)  8                                * C104B  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C104C  library
        CON(3)  #02E                             * C104F  command
RRK:
        ::                                       * C1052
          CK3&Dispatch                           * C1057
          #       511                            * C105C  1297
          ROMPTR  0C1 01D                        * C1066
          #       551                            * C1071  1361
          ROMPTR  0C1 01D                        * C107B
        ;                                        * C1086

* ROMPTR 0AB 02F
* refs (1): C0007
        CON(1)  8                                * C108B  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C108C  library
        CON(3)  #02F                             * C108F  command
RRKSTEP:
        ::                                       * C1092
          CK4&Dispatch                           * C1097
          #       5111                           * C109C  20753
          ROMPTR  0C1 018                        * C10A6
        ;                                        * C10B1

* ROMPTR 0AB 030
* refs (1): C0007
        CON(1)  8                                * C10B6  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C10B7  library
        CON(3)  #030                             * C10BA  command
RSBERR:
        ::                                       * C10BD
          CK2&Dispatch                           * C10C2
          #       51                             * C10C7  81
          ROMPTR  0C1 013                        * C10D1
        ;                                        * C10DC

* ROMPTR 0AB 031
* refs (1): C0007
        CON(1)  8                                * C10E1  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C10E2  library
        CON(3)  #031                             * C10E5  command
COND:
        ::                                       * C10E8
          CK1&Dispatch                           * C10ED
          BINT4                                  * C10F2
          ROMPTR  0C2 04D                        * C10F7
        ;                                        * C1102

* ROMPTR 0AB 032 TRACE
* refs (1): C0007
        CON(1)  8                                * C1107  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1108  library
        CON(3)  #032                             * C110B  command
TRACE_C110E:
        ::                                       * C110E
          CK1&Dispatch                           * C1113
          BINT4                                  * C1118
          ROMPTR  0C2 04C                        * C111D
        ;                                        * C1128

* ROMPTR 0AB 033
* refs (1): C0007
        CON(1)  8                                * C112D  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C112E  library
        CON(3)  #033                             * C1131  command
SRAD:
        ::                                       * C1134
          CK1&Dispatch                           * C1139
          BINT4                                  * C113E
          ROMPTR  0C2 000                        * C1143
        ;                                        * C114E

* ROMPTR 0AB 034
* refs (1): C0007
        CON(1)  8                                * C1153  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1154  library
        CON(3)  #034                             * C1157  command
SNRM:
        ::                                       * C115A
          CK1&Dispatch                           * C115F
          BINT4                                  * C1164
          ROMPTR  0C2 034                        * C1169
        ;                                        * C1174

* ROMPTR 0AB 035
* refs (1): C0007
        CON(1)  8                                * C1179  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C117A  library
        CON(3)  #035                             * C117D  command
RANK:
        ::                                       * C1180
          CK1&Dispatch                           * C1185
          BINT4                                  * C118A
          ROMPTR  0C2 036                        * C118F
        ;                                        * C119A

* ROMPTR 0AB 036
* refs (1): C0007
        CON(1)  8                                * C119F  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C11A0  library
        CON(3)  #036                             * C11A3  command
LSQ:
        ::                                       * C11A6
          CK2&Dispatch                           * C11AB
          #       44                             * C11B0  68
          ROMPTR  0C2 022                        * C11BA
        ;                                        * C11C5

* ROMPTR 0AB 037
* refs (1): C0007
        CON(1)  8                                * C11CA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C11CB  library
        CON(3)  #037                             * C11CE  command
EGV:
        ::                                       * C11D1
          CK1&Dispatch                           * C11D6
          BINT4                                  * C11DB
          ROMPTR  0C2 004                        * C11E0
        ;                                        * C11EB

* ROMPTR 0AB 038
* refs (1): C0007
        CON(1)  8                                * C11F0  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C11F1  library
        CON(3)  #038                             * C11F4  command
EGVL:
        ::                                       * C11F7
          CK1&Dispatch                           * C11FC
          BINT4                                  * C1201
          ROMPTR  0C2 002                        * C1206
        ;                                        * C1211

* ROMPTR 0AB 039
* refs (1): C0007
        CON(1)  8                                * C1216  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1217  library
        CON(3)  #039                             * C121A  command
SVD:
        ::                                       * C121D
          CK1&Dispatch                           * C1222
          BINT4                                  * C1227
          ROMPTR  0C2 038                        * C122C
        ;                                        * C1237

* ROMPTR 0AB 03A
* refs (1): C0007
        CON(1)  8                                * C123C  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C123D  library
        CON(3)  #03A                             * C1240  command
SVL:
        ::                                       * C1243
          CK1&Dispatch                           * C1248
          BINT4                                  * C124D
          ROMPTR  0C2 037                        * C1252
        ;                                        * C125D

* ROMPTR 0AB 03B
* refs (1): C0007
        CON(1)  8                                * C1262  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1263  library
        CON(3)  #03B                             * C1266  command
LU:
        ::                                       * C1269
          CK1&Dispatch                           * C126E
          BINT4                                  * C1273
          ROMPTR  0C2 050                        * C1278
        ;                                        * C1283

* ROMPTR 0AB 03C
* refs (1): C0007
        CON(1)  8                                * C1288  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1289  library
        CON(3)  #03C                             * C128C  command
QR:
        ::                                       * C128F
          CK1&Dispatch                           * C1294
          BINT4                                  * C1299
          ROMPTR  0C2 023                        * C129E
        ;                                        * C12A9

* ROMPTR 0AB 03D
* refs (1): C0007
        CON(1)  8                                * C12AE  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C12AF  library
        CON(3)  #03D                             * C12B2  command
LQ:
        ::                                       * C12B5
          CK1&Dispatch                           * C12BA
          BINT4                                  * C12BF
          ROMPTR  0C2 024                        * C12C4
        ;                                        * C12CF

* ROMPTR 0AB 03E
* refs (1): C0007
        CON(1)  8                                * C12D4  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C12D5  library
        CON(3)  #03E                             * C12D8  command
SCHUR:
        ::                                       * C12DB
          CK1&Dispatch                           * C12E0
          BINT4                                  * C12E5
          ROMPTR  0C2 005                        * C12EA
        ;                                        * C12F5

* ROMPTR 0AB 03F
* refs (1): C0007
        CON(1)  8                                * C12FA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C12FB  library
        CON(3)  #03F                             * C12FE  command
RREF:
        ::                                       * C1301
          CK1&Dispatch                           * C1306
          BINT4                                  * C130B
          ROMPTR  0C2 05B                        * C1310
        ;                                        * C131B

* ROMPTR 0AB 040
* refs (1): C0007
        CON(1)  8                                * C1320  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1321  library
        CON(3)  #040                             * C1324  command
RANM:
        ::                                       * C1327
          CK1&Dispatch                           * C132C
          BINT4                                  * C1331
          ROMPTR  0C3 000                        * C1336
          BINT5                                  * C1341
          ROMPTR  0AB 051                        * C1346
        ;                                        * C1351

* ROMPTR 0AB 041
* refs (1): C0007
        CON(1)  8                                * C1356  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1357  library
        CON(3)  #041                             * C135A  command
→ROW:
        ::                                       * C135D
          CK1&Dispatch                           * C1362
          BINT4                                  * C1367
          ROMPTR  0C3 012                        * C136C
        ;                                        * C1377

* ROMPTR 0AB 042
* refs (1): C0007
        CON(1)  8                                * C137C  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C137D  library
        CON(3)  #042                             * C1380  command
ROW→:
        ::                                       * C1383
          CKN                                    * C1388
          ROMPTR  0C3 015                        * C138D
        ;                                        * C1398

* ROMPTR 0AB 043
* refs (1): C0007
        CON(1)  8                                * C139D  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C139E  library
        CON(3)  #043                             * C13A1  command
→COL:
        ::                                       * C13A4
          CK1&Dispatch                           * C13A9
          BINT4                                  * C13AE
          ROMPTR  0C3 014                        * C13B3
        ;                                        * C13BE

* ROMPTR 0AB 044
* refs (1): C0007
        CON(1)  8                                * C13C3  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C13C4  library
        CON(3)  #044                             * C13C7  command
COL→:
        ::                                       * C13CA
          CKN                                    * C13CF
          ROMPTR  0C3 016                        * C13D4
        ;                                        * C13DF

* ROMPTR 0AB 045
* refs (1): C0007
        CON(1)  8                                * C13E4  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C13E5  library
        CON(3)  #045                             * C13E8  command
→DIAG:
        ::                                       * C13EB
          CK1&Dispatch                           * C13F0
          BINT4                                  * C13F5
          ROMPTR  0C3 017                        * C13FA
        ;                                        * C1405

* ROMPTR 0AB 046
* refs (1): C0007
        CON(1)  8                                * C140A  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C140B  library
        CON(3)  #046                             * C140E  command
DIAG→:
        ::                                       * C1411
          CK2&Dispatch                           * C1416
          BINT69                                 * C141B
          ROMPTR  0AB 04F                        * C1420
          BINT65                                 * C142B
          ROMPTR  0AB 050                        * C1430
        ;                                        * C143B

* ROMPTR 0AB 047
* refs (1): C0007
        CON(1)  8                                * C1440  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1441  library
        CON(3)  #047                             * C1444  command
ROW-:
        ::                                       * C1447
          CK2&Dispatch                           * C144C
          #       41                             * C1451  65
          ROMPTR  0C3 007                        * C145B
        ;                                        * C1466

* ROMPTR 0AB 048
* refs (1): C0007
        CON(1)  8                                * C146B  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C146C  library
        CON(3)  #048                             * C146F  command
ROW+:
        ::                                       * C1472
          CK3&Dispatch                           * C1477
          #       441                            * C147C  1089
          ROMPTR  0C3 00A                        * C1486
          #       411                            * C1491  1041
          ROMPTR  0C3 00F                        * C149B
          #       421                            * C14A6  1057
          ROMPTR  0C3 010                        * C14B0
        ;                                        * C14BB

* ROMPTR 0AB 049
* refs (1): C0007
        CON(1)  8                                * C14C0  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C14C1  library
        CON(3)  #049                             * C14C4  command
COL-:
        ::                                       * C14C7
          CK2&Dispatch                           * C14CC
          #       41                             * C14D1  65
          ROMPTR  0C3 009                        * C14DB
        ;                                        * C14E6

* ROMPTR 0AB 04A
* refs (1): C0007
        CON(1)  8                                * C14EB  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C14EC  library
        CON(3)  #04A                             * C14EF  command
COL+:
        ::                                       * C14F2
          CK3&Dispatch                           * C14F7
          #       441                            * C14FC  1089
          ROMPTR  0C3 00D                        * C1506
          #       411                            * C1511  1041
          ROMPTR  0C3 00F                        * C151B
          #       421                            * C1526  1057
          ROMPTR  0C3 010                        * C1530
        ;                                        * C153B

* ROMPTR 0AB 04B
* refs (1): C0007
        CON(1)  8                                * C1540  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1541  library
        CON(3)  #04B                             * C1544  command
RSWP:
        ::                                       * C1547
          CK3&Dispatch                           * C154C
          #       411                            * C1551  1041
          ROMPTR  0C3 002                        * C155B
        ;                                        * C1566

* ROMPTR 0AB 04C
* refs (1): C0007
        CON(1)  8                                * C156B  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C156C  library
        CON(3)  #04C                             * C156F  command
CSWP:
        ::                                       * C1572
          CK3&Dispatch                           * C1577
          #       411                            * C157C  1041
          ROMPTR  0C3 004                        * C1586
        ;                                        * C1591

* ROMPTR 0AB 04D
* refs (1): C0007
        CON(1)  8                                * C1596  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1597  library
        CON(3)  #04D                             * C159A  command
RCI:
        ::                                       * C159D
          CK3&Dispatch                           * C15A2
          #       411                            * C15A7  1041
          ROMPTR  0C3 005                        * C15B1
          #       421                            * C15BC  1057
          ROMPTR  0C3 005                        * C15C6
        ;                                        * C15D1

* ROMPTR 0AB 04E
* refs (1): C0007
        CON(1)  8                                * C15D6  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C15D7  library
        CON(3)  #04E                             * C15DA  command
RCIJ:
        ::                                       * C15DD
          CK4&Dispatch                           * C15E2
          #       4111                           * C15E7  16657
          ROMPTR  0C3 006                        * C15F1
          #       4211                           * C15FC  16913
          ROMPTR  0C3 006                        * C1606
        ;                                        * C1611

* ROMPTR 0AB 04F
* refs (1): C0007
ROMP_0AB_04F:
        ::                                       * C1616
          OBJ_1DFDF                              * C161B
          COERCE{}2                              * C1620
          ROMPTR  0C3 018                        * C1625
        ;                                        * C1630

* ROMPTR 0AB 050
* refs (1): C0007
ROMP_0AB_050:
        ::                                       * C1635
          COERCE                                 * C163A
          DUP#0<>                                * C163F
          ?SKIP                                  * C1644
          SETSIZEERR                             * C1649
          DUP                                    * C164E
          TWO{}N                                 * C1653
          ROMPTR  0C3 018                        * C1658
        ;                                        * C1663

* ROMPTR 0AB 051
* refs (1): C0007
ROMP_0AB_051:
        ::                                       * C1668
          %0_2A2B4                               * C166D
          %0_2A2B4                               * C1672
          OBJ_1DF30                              * C1677
          1GETLAM                                * C167C
          ABND                                   * C1681
          CK1NOLASTWD                            * C1686
          COERCE{}2                              * C168B
          %0_2A2B4                               * C1690
          MAKEARRY                               * C1695
          ROMPTR  0C3 000                        * C169A
        ;                                        * C16A5

* ROMPTR 0AB 052
* refs (1): C0007
        CON(1)  8                                * C16AA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C16AB  library
        CON(3)  #052                             * C16AE  command
PROOT:
        ::                                       * C16B1
          CK1&Dispatch                           * C16B6
          BINT4                                  * C16BB
          ROMPTR  0C0 001                        * C16C0
        ;                                        * C16CB

* ROMPTR 0AB 053
* refs (1): C0007
        CON(1)  8                                * C16D0  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C16D1  library
        CON(3)  #053                             * C16D4  command
PCOEF:
        ::                                       * C16D7
          CK1&Dispatch                           * C16DC
          BINT4                                  * C16E1
          ROMPTR  0C4 009                        * C16E6
        ;                                        * C16F1

* ROMPTR 0AB 054
* refs (1): C0007
        CON(1)  8                                * C16F6  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C16F7  library
        CON(3)  #054                             * C16FA  command
PEVAL:
        ::                                       * C16FD
          CK2&Dispatch                           * C1702
          #       41                             * C1707  65
          ROMPTR  0C4 00E                        * C1711
          #       42                             * C171C  66
          ROMPTR  0C4 00E                        * C1726
        ;                                        * C1731

* ROMPTR 0AB 055
* refs (1): C0007
        CON(1)  8                                * C1736  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1737  library
        CON(3)  #055                             * C173A  command
TVM:
        ::                                       * C173D
          CK0                                    * C1742
          ROMPTR  0E6 001                        * C1747
        ;                                        * C1752

* ROMPTR 0AB 056
* refs (1): C0007
        CON(1)  8                                * C1757  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1758  library
        CON(3)  #056                             * C175B  command
TVMBEG:
        ::                                       * C175E
          CK0                                    * C1763
          BINT14                                 * C1768
          SetSysFlag                             * C176D
        ;                                        * C1772

* ROMPTR 0AB 057
* refs (1): C0007
        CON(1)  8                                * C1777  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1778  library
        CON(3)  #057                             * C177B  command
TVMEND:
        ::                                       * C177E
          CK0                                    * C1783
          BINT14                                 * C1788
          ClrSysFlag                             * C178D
        ;                                        * C1792

* slots of 0AB 057 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #01                              * C1797  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 058
* refs (1): C0007
        CON(1)  1                                * C1799  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C179A  library
        CON(3)  #058                             * C179D  command
TVMROOT:
        ::                                       * C17A0
          CK1&Dispatch                           * C17A5
          BINT6                                  * C17AA
          ROMPTR  0E6 00C                        * C17AF
          BINT10                                 * C17BA
          ROMPTR  0E6 00B                        * C17BF
        ;                                        * C17CA

        HXS     014350                           * C17CF

        ROMPTR  0E7 011                          * C17DF  ~UTVUNS1Arg

* ROMPTR 0AB 059
* refs (1): C0007
        CON(1)  8                                * C17EA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C17EB  library
        CON(3)  #059                             * C17EE  command
AMORT:
        ::                                       * C17F1
          CK1&Dispatch                           * C17F6
          BINT1                                  * C17FB
          ROMPTR  0E6 004                        * C1800
        ;                                        * C180B

* ROMPTR 0AB 05A
* refs (1): C0007
        CON(1)  8                                * C1810  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1811  library
        CON(3)  #05A                             * C1814  command
INFORM:
        ::                                       * C1817
          CK5&Dispatch                           * C181C
          #       35555                          * C1821  218453
          ROMPTR  0B1 01C                        * C182B
          #       35155                          * C1836  217429
          ::                                     * C1840
            ROT                                  * C1845
            ONE{}N                               * C184A
            3UNROLL                              * C184F
            ROMPTR  0B1 01C                      * C1854
          ;                                      * C185F
        ;                                        * C1864

* ROMPTR 0AB 05B
* refs (1): C0007
        CON(1)  8                                * C1869  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C186A  library
        CON(3)  #05B                             * C186D  command
NOVAL:
        ::                                       * C1870
          CK0                                    * C1875
          '                                      * C187A
          ROMPTR  0AB 05B                        * C187F  ~xNOVAL
        ;                                        * C188A

* ROMPTR 0AB 05C
* refs (1): C0007
        CON(1)  8                                * C188F  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1890  library
        CON(3)  #05C                             * C1893  command
CHOOSE:
        ::                                       * C1896
          CK3&Dispatch                           * C189B
          #       351                            * C18A0  849
          ROMPTR  0B3 063                        * C18AA
        ;                                        * C18B5

* ROMPTR 0AB 05D
* refs (1): C0007
        CON(1)  8                                * C18BA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C18BB  library
        CON(3)  #05D                             * C18BE  command
MSGBOX:
        ::                                       * C18C1
          CK1&Dispatch                           * C18C6
          BINT3                                  * C18CB
          ROMPTR  0B1 00E                        * C18D0  Ck&DoMsgBox
        ;                                        * C18DB

* ROMPTR 0AB 05E
* refs (1): C0007
        CON(1)  8                                * C18E0  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C18E1  library
        CON(3)  #05E                             * C18E4  command
XSEND:
        ::                                       * C18E7
          CK1&Dispatch                           * C18EC
          BINT6                                  * C18F1
          ROMPTR  0E8 040                        * C18F6
          BINT7                                  * C1901
          ROMPTR  0E8 040                        * C1906
        ;                                        * C1911

* ROMPTR 0AB 05F
* refs (1): C0007
        CON(1)  8                                * C1916  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1917  library
        CON(3)  #05F                             * C191A  command
XRECV:
        ::                                       * C191D
          CK1&Dispatch                           * C1922
          BINT6                                  * C1927
          ROMPTR  0E8 041                        * C192C
          BINT7                                  * C1937
          ROMPTR  0E8 041                        * C193C
        ;                                        * C1947

* ROMPTR 0AB 060
* refs (1): C0007
        CON(1)  8                                * C194C  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C194D  library
        CON(3)  #060                             * C1950  command
HEAD:
        ::                                       * C1953
          CK1&Dispatch                           * C1958
          BINT5                                  * C195D
          ::                                     * C1962
            DUPLENCOMP                           * C1967
            #0=case                              * C196C
            doerr501                             * C1971
            CARCOMP                              * C1976
          ;                                      * C197B
          BINT3                                  * C1980
          ::                                     * C1985
            DUPLEN$                              * C198A
            #0=case                              * C198F
            doerr501                             * C1994
            CAR$                                 * C1999
            CHR>$                                * C199E
          ;                                      * C19A3
        ;                                        * C19A8

* ROMPTR 0AB 061
* refs (1): C0007
        CON(1)  8                                * C19AD  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C19AE  library
        CON(3)  #061                             * C19B1  command
TAIL:
        ::                                       * C19B4
          CK1&Dispatch                           * C19B9
          BINT5                                  * C19BE
          CDRCOMP                                * C19C3
          BINT3                                  * C19C8
          CDR$                                   * C19CD
        ;                                        * C19D2

* ROMPTR 0AB 062
* refs (1): C0007
        CON(1)  8                                * C19D7  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C19D8  library
        CON(3)  #062                             * C19DB  command
SEQ:
        ::                                       * C19DE
          CK5&Dispatch                           * C19E3
          #       6000                           * C19E8  24576
          ROMPTR  0E8 000                        * C19F2
          #       7000                           * C19FD  28672
          ROMPTR  0E8 000                        * C1A07
        ;                                        * C1A12

* ROMPTR 0AB 063
* refs (1): C0007
        CON(1)  8                                * C1A17  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1A18  library
        CON(3)  #063                             * C1A1B  command
DOSUBS:
        ::                                       * C1A1E
          CK2&Dispatch                           * C1A23
          #       18                             * C1A28  24
          ROMPTR  0E8 002                        * C1A32
          #       10F                            * C1A3D  271
          ROMPTR  0E8 002                        * C1A47
          #       58                             * C1A52  88
          ROMPTR  0E8 001                        * C1A5C
          #       50F                            * C1A67  1295
          ::                                     * C1A71
            ROMPTR  0E8 007                      * C1A76
            ROMPTR  0E8 003                      * C1A81
          ;                                      * C1A8C
          #       6                              * C1A91  6
          ::                                     * C1A9B
            '                                    * C1AA0
            ROMPTR  0AB 063                      * C1AA5  DOSUBS
            ROMPTR  0E8 005                      * C1AB0
          ;                                      * C1ABB
          #       7                              * C1AC0  7
          ::                                     * C1ACA
            '                                    * C1ACF
            ROMPTR  0AB 063                      * C1AD4  DOSUBS
            ROMPTR  0E8 005                      * C1ADF
          ;                                      * C1AEA
        ;                                        * C1AEF

* ROMPTR 0AB 064
* refs (1): C0007
        CON(1)  8                                * C1AF4  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1AF5  library
        CON(3)  #064                             * C1AF8  command
ΔLIST:
        ::                                       * C1AFB
          CK1&Dispatch                           * C1B00
          BINT5                                  * C1B05
          ::                                     * C1B0A
            '                                    * C1B0F
            ::                                   * C1B14
              SWAP                               * C1B19
              'EvalNoCK:_sup                     * C1B1E
              x-                                 * C1B23
            ;                                    * C1B28
            BINT2                                * C1B2D
            ROMPTR  0E8 003                      * C1B32
          ;                                      * C1B3D
        ;                                        * C1B42

* slots of 0AB 064 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C1B47  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 065
* refs (1): C0007
        CON(1)  0                                * C1B49  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1B4A  library
        CON(3)  #065                             * C1B4D  command
NSUB:
        ::                                       * C1B50
          CK0                                    * C1B55
          '                                      * C1B5A
          LAM     'ntup                          * C1B5F
          XEQRCL                                 * C1B70
          UNCOERCE                               * C1B75
        ;                                        * C1B7A

* slots of 0AB 065 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C1B7F  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 066
* refs (1): C0007
        CON(1)  0                                * C1B81  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1B82  library
        CON(3)  #066                             * C1B85  command
ENDSUB:
        ::                                       * C1B88
          CK0                                    * C1B8D
          '                                      * C1B92
          LAM     'mtup                          * C1B97
          XEQRCL                                 * C1BA8
          UNCOERCE                               * C1BAD
        ;                                        * C1BB2

* ROMPTR 0AB 067
* refs (1): C0007
        CON(1)  8                                * C1BB7  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1BB8  library
        CON(3)  #067                             * C1BBB  command
STREAM:
        ::                                       * C1BBE
          CK2&Dispatch                           * C1BC3
          #       50                             * C1BC8  80
          ::                                     * C1BD2
            1LAMBIND                             * C1BD7
            DUP                                  * C1BDC
            CARCOMP                              * C1BE1
            SWAP                                 * C1BE6
            CDRCOMP                              * C1BEB
            DUP                                  * C1BF0
            LENCOMP                              * C1BF5
            DUPUNROT                             * C1BFA
            #0=case                              * C1BFF
            doerr501                             * C1C04
            >R                                   * C1C09
            ZERO_DO                              * C1C0E
            ?ATTNQUIT                            * C1C13
            RSWAP                                * C1C18
            'R                                   * C1C1D
            RSWAP                                * C1C22
            1GETLAM                              * C1C27
            EVAL                                 * C1C2C
            LOOP                                 * C1C31
            RDROP                                * C1C36
            ABND                                 * C1C3B
          ;                                      * C1C40
        ;                                        * C1C45

* ROMPTR 0AB 068
* refs (1): C0007
        CON(1)  8                                * C1C4A  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1C4B  library
        CON(3)  #068                             * C1C4E  command
ΣLIST:
        ::                                       * C1C51
          CK1&Dispatch                           * C1C56
          BINT5                                  * C1C5B
          ::                                     * C1C60

* ROMPTR 0AB 069
* refs (1): C0007
ROMP_0AB_069:
            ::                                   * C1C65
              DUP                                * C1C6A
              CARCOMP                            * C1C6F
              SWAP                               * C1C74
              CDRCOMP                            * C1C79
              DUP                                * C1C7E
              LENCOMP                            * C1C83
              DUPUNROT                           * C1C88
              #0=case                            * C1C8D
              doerr501                           * C1C92
            ;                                    * C1C97
            >R                                   * C1C9C
            ZERO_DO                              * C1CA1
            ?ATTNQUIT                            * C1CA6
            RSWAP                                * C1CAB
            'R                                   * C1CB0
            RSWAP                                * C1CB5
            'EvalNoCK:_sup                       * C1CBA
            x+                                   * C1CBF
            LOOP                                 * C1CC4
            RDROP                                * C1CC9
          ;                                      * C1CCE
        ;                                        * C1CD3

* ROMPTR 0AB 06A
* refs (1): C0007
        CON(1)  8                                * C1CD8  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1CD9  library
        CON(3)  #06A                             * C1CDC  command
ΠLIST:
        ::                                       * C1CDF
          CK1&Dispatch                           * C1CE4
          BINT5                                  * C1CE9
          ::                                     * C1CEE
            ROMPTR  0AB 069                      * C1CF3
            >R                                   * C1CFE
            ZERO_DO                              * C1D03
            ?ATTNQUIT                            * C1D08
            RSWAP                                * C1D0D
            'R                                   * C1D12
            RSWAP                                * C1D17
            'EvalNoCK:_sup                       * C1D1C
            x*                                   * C1D21
            LOOP                                 * C1D26
            RDROP                                * C1D2B
          ;                                      * C1D30
        ;                                        * C1D35

* ROMPTR 0AB 06B DOLIST
* refs (1): C0007
        CON(1)  8                                * C1D3A  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1D3B  library
        CON(3)  #06B                             * C1D3E  command
DOLIST_C1D41:
        ::                                       * C1D41
          CK2&Dispatch                           * C1D46
          #       18                             * C1D4B  24
          ROMPTR  0E8 00B                        * C1D55
          #       50F                            * C1D60  1295
          ROMPTR  0E8 00A                        * C1D6A
          #       10F                            * C1D75  271
          ROMPTR  0E8 00B                        * C1D7F
          #       58                             * C1D8A  88
          ROMPTR  0E8 008                        * C1D94
          #       6                              * C1D9F  6
          ROMPTR  0E8 004                        * C1DA9
          #       7                              * C1DB4  7
          ROMPTR  0E8 004                        * C1DBE
          BINT0                                  * C1DC9
          SETTYPEERR                             * C1DCE
        ;                                        * C1DD3

* slots of 0AB 06B (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C1DD8  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 06C
* refs (1): C0007
        CON(1)  1                                * C1DDA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1DDB  library
        CON(3)  #06C                             * C1DDE  command
ADD:
        ::                                       * C1DE1
          CK2&Dispatch                           * C1DE6
          BINT85                                 * C1DEB
          ROMPTR  0E8 015                        * C1DF0
          OBJ_64C34                              * C1DFB
          ROMPTR  0E8 015                        * C1E00
          BINT5                                  * C1E0B
          ROMPTR  0E8 015                        * C1E10
          BINT13                                 * C1E1B
          ::                                     * C1E20
            STRIPTAGS                            * C1E25
            'EvalNoCK:_sup                       * C1E2A
            ROMPTR  0AB 06C                      * C1E2F  ADD
          ;                                      * C1E3A
          BINT0                                  * C1E3F
          ::                                     * C1E44
            'EvalNoCK:_sup                       * C1E49
            x+                                   * C1E4E
          ;                                      * C1E53
        ;                                        * C1E58

        HXS     70107                            * C1E5D

* ROMPTR 0AB 06D
* refs (1): C0007
        CON(1)  8                                * C1E6C  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1E6D  library
        CON(3)  #06D                             * C1E70  command
REVLIST:
        ::                                       * C1E73
          CK1&Dispatch                           * C1E78
          BINT5                                  * C1E7D
          ::                                     * C1E82
            ROMPTR  0E8 01C                      * C1E87
            reversym                             * C1E92
          ;                                      * C1E97
        ;                                        * C1E9C

* ROMPTR 0AB 06E
* refs (1): C0007
        CON(1)  8                                * C1EA1  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1EA2  library
        CON(3)  #06E                             * C1EA5  command
SORT:
        ::                                       * C1EA8
          CK1&Dispatch                           * C1EAD
          BINT5                                  * C1EB2
          ROMPTR  0E8 016                        * C1EB7
        ;                                        * C1EC2

* ROMPTR 0AB 06F
* refs (2): C0007 C0007
        CON(1)  8                                * C1EC7  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1EC8  library
        CON(3)  #06F                             * C1ECB  command
ROMP_0AB_06F:
        ::                                       * C1ECE
          CK0                                    * C1ED3
          ROMPTR  0E4 012                        * C1ED8  ~MESRclEqn
          DROP'                                  * C1EE3
          ROMPTR  0E4 00C                        * C1EE8
          InitMenu                               * C1EF3
        ;                                        * C1EF8

* ROMPTR 0AB 070
* refs (1): C0007
        CON(1)  8                                * C1EFD  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1EFE  library
        CON(3)  #070                             * C1F01  command
MINIT:
        ::                                       * C1F04
          CK0                                    * C1F09
          ROMPTR  0E4 04F                        * C1F0E
          ROMPTR  0E4 042                        * C1F19
        ;                                        * C1F24

* ROMPTR 0AB 071
* refs (1): C0007
        CON(1)  8                                * C1F29  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1F2A  library
        CON(3)  #071                             * C1F2D  command
MITM:
        ::                                       * C1F30
          CK2&Dispatch                           * C1F35
          BINT53                                 * C1F3A
          ::                                     * C1F3F
            ROMPTR  0E4 04F                      * C1F44
            ROMPTR  0E4 043                      * C1F4F
          ;                                      * C1F5A
        ;                                        * C1F5F

* ROMPTR 0AB 072
* refs (1): C0007
        CON(1)  8                                * C1F64  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1F65  library
        CON(3)  #072                             * C1F68  command
MUSER:
        ::                                       * C1F6B
          CK1&Dispatch                           * C1F70
          BINT6                                  * C1F75
          ROMPTR  0E4 044                        * C1F7A
          BINT5                                  * C1F85
          ROMPTR  0E4 046                        * C1F8A
          BINT3                                  * C1F95
          ROMPTR  0E4 04A                        * C1F9A
        ;                                        * C1FA5

* ROMPTR 0AB 073
* refs (1): C0007
        CON(1)  8                                * C1FAA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1FAB  library
        CON(3)  #073                             * C1FAE  command
MCALC:
        ::                                       * C1FB1
          CK1&Dispatch                           * C1FB6
          BINT6                                  * C1FBB
          ROMPTR  0E4 045                        * C1FC0
          BINT5                                  * C1FCB
          ROMPTR  0E4 047                        * C1FD0
          BINT3                                  * C1FDB
          ROMPTR  0E4 04B                        * C1FE0
        ;                                        * C1FEB

* ROMPTR 0AB 074
* refs (1): C0007
        CON(1)  8                                * C1FF0  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1FF1  library
        CON(3)  #074                             * C1FF4  command
MROOT:
        ::                                       * C1FF7
          CK1&Dispatch                           * C1FFC
          BINT6                                  * C2001
          ROMPTR  0E4 04D                        * C2006
          BINT3                                  * C2011
          ROMPTR  0E4 04E                        * C2016
        ;                                        * C2021

* ROMPTR 0AB 075
* refs (1): C0007
        CON(1)  8                                * C2026  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C2027  library
        CON(3)  #075                             * C202A  command
MINEHUNT:
        ::                                       * C202D
          CK0                                    * C2032
          ROMPTR  0E7 033                        * C2037
        ;                                        * C2042

* slots of 0AB 075 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C2047  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 076
* refs (1): C0007
        CON(1)  0                                * C2049  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C204A  library
        CON(3)  #076                             * C204D  command
ZFACTOR:
        ::                                       * C2050
          CK2&Dispatch                           * C2055
          BINT17                                 * C205A
          ROMPTR  0E7 001                        * C205F
          BINT26                                 * C206A
          ROMPTR  0E7 015                        * C206F
          SYMREAL                                * C207A
          ROMPTR  0E7 016                        * C207F
          SYMSYM                                 * C208A
          ROMPTR  0E7 017                        * C208F
          2EXT                                   * C209A
          ROMPTR  0E7 000                        * C209F
          BINT30                                 * C20AA
          ROMPTR  0E7 000                        * C20AF
          EXTREAL                                * C20BA
          ROMPTR  0E7 000                        * C20BF
          EXTSYM                                 * C20CA
          ROMPTR  0E7 015                        * C20CF
          SYMEXT                                 * C20DA
          ROMPTR  0E7 016                        * C20DF
        ;                                        * C20EA

* slots of 0AB 076 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C20EF  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 077
* refs (1): C0007
        CON(1)  0                                * C20F1  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C20F2  library
        CON(3)  #077                             * C20F5  command
FANNING:
        ::                                       * C20F8
          CK2&Dispatch                           * C20FD
          BINT17                                 * C2102
          ROMPTR  0E7 004                        * C2107
          BINT26                                 * C2112
          ROMPTR  0E7 018                        * C2117
          SYMREAL                                * C2122
          ROMPTR  0E7 019                        * C2127
          SYMSYM                                 * C2132
          ROMPTR  0E7 01A                        * C2137
          2EXT                                   * C2142
          ROMPTR  0E7 003                        * C2147
          BINT30                                 * C2152
          ROMPTR  0E7 003                        * C2157
          EXTREAL                                * C2162
          ROMPTR  0E7 003                        * C2167
          EXTSYM                                 * C2172
          ROMPTR  0E7 018                        * C2177
          SYMEXT                                 * C2182
          ROMPTR  0E7 019                        * C2187
        ;                                        * C2192

* slots of 0AB 077 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C2197  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 078
* refs (1): C0007
        CON(1)  0                                * C2199  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C219A  library
        CON(3)  #078                             * C219D  command
DARCY:
        ::                                       * C21A0
          CK2&Dispatch                           * C21A5
          BINT17                                 * C21AA
          ROMPTR  0E7 009                        * C21AF
          BINT26                                 * C21BA
          ROMPTR  0E7 01B                        * C21BF
          SYMREAL                                * C21CA
          ROMPTR  0E7 01C                        * C21CF
          SYMSYM                                 * C21DA
          ROMPTR  0E7 01D                        * C21DF
          2EXT                                   * C21EA
          ROMPTR  0E7 008                        * C21EF
          BINT30                                 * C21FA
          ROMPTR  0E7 008                        * C21FF
          EXTREAL                                * C220A
          ROMPTR  0E7 008                        * C220F
          EXTSYM                                 * C221A
          ROMPTR  0E7 01B                        * C221F
          SYMEXT                                 * C222A
          ROMPTR  0E7 01C                        * C222F
        ;                                        * C223A

* slots of 0AB 078 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C223F  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 079
* refs (1): C0007
        CON(1)  0                                * C2241  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C2242  library
        CON(3)  #079                             * C2245  command
F0λ:
        ::                                       * C2248
          CK2&Dispatch                           * C224D
          BINT17                                 * C2252
          ROMPTR  0E7 00B                        * C2257
          BINT26                                 * C2262
          ROMPTR  0E7 01E                        * C2267
          SYMREAL                                * C2272
          ROMPTR  0E7 01F                        * C2277
          SYMSYM                                 * C2282
          ROMPTR  0E7 020                        * C2287
          2EXT                                   * C2292
          ROMPTR  0E7 00A                        * C2297
          BINT30                                 * C22A2
          ROMPTR  0E7 00A                        * C22A7
          EXTREAL                                * C22B2
          ROMPTR  0E7 00A                        * C22B7
          EXTSYM                                 * C22C2
          ROMPTR  0E7 01E                        * C22C7
          SYMEXT                                 * C22D2
          ROMPTR  0E7 01F                        * C22D7
        ;                                        * C22E2

* slots of 0AB 079 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C22E7  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 07A
* refs (1): C0007
        CON(1)  0                                * C22E9  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C22EA  library
        CON(3)  #07A                             * C22ED  command
SIDENS:
        ::                                       * C22F0
          CK1&Dispatch                           * C22F5
          BINT1                                  * C22FA
          ROMPTR  0E7 00C                        * C22FF
          BINT10                                 * C230A
          ROMPTR  0E7 027                        * C230F
          BINT14                                 * C231A
          ROMPTR  0E7 00D                        * C231F
        ;                                        * C232A

* slots of 0AB 07A (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C232F  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 07B
* refs (1): C0007
        CON(1)  0                                * C2331  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C2332  library
        CON(3)  #07B                             * C2335  command
TDELTA:
        ::                                       * C2338
          CK2&Dispatch                           * C233D
          2EXT                                   * C2342
          ROMPTR  0E7 00E                        * C2347
          EXTSYM                                 * C2352
          ROMPTR  0E7 021                        * C2357
          SYMEXT                                 * C2362
          ROMPTR  0E7 022                        * C2367
          SYMSYM                                 * C2372
          ROMPTR  0E7 023                        * C2377
          BINT26                                 * C2382
          ROMPTR  0E7 021                        * C2387
          SYMREAL                                * C2392
          ROMPTR  0E7 022                        * C2397
          BINT17                                 * C23A2
          %-                                     * C23A7
          BINT30                                 * C23AC
          ROMPTR  0E7 010                        * C23B1
          EXTREAL                                * C23BC
          ROMPTR  0E7 010                        * C23C1
        ;                                        * C23CC

* slots of 0AB 07B (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C23D1  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 07C
* refs (1): C0007
        CON(1)  0                                * C23D3  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C23D4  library
        CON(3)  #07C                             * C23D7  command
TINC:
        ::                                       * C23DA
          CK2&Dispatch                           * C23DF
          2EXT                                   * C23E4
          ROMPTR  0E7 00F                        * C23E9
          EXTSYM                                 * C23F4
          ROMPTR  0E7 024                        * C23F9
          SYMSYM                                 * C2404
          ROMPTR  0E7 026                        * C2409
          BINT26                                 * C2414
          ROMPTR  0E7 024                        * C2419
          SYMREAL                                * C2424
          ROMPTR  0E7 025                        * C2429
          SYMEXT                                 * C2434
          ROMPTR  0E7 025                        * C2439
          BINT17                                 * C2444
          %+                                     * C2449
          BINT30                                 * C244E
          ROMPTR  0E7 010                        * C2453
          EXTREAL                                * C245E
          ROMPTR  0E7 010                        * C2463
        ;                                        * C246E
        NIBHEX  BA0D70                           * C2473  «Ð.

* ROMPTR 0AB 07D
* refs (1): C0007
gmol:
        UNIT                                     * C2479
          %1                                     * C247E
          $       "mol"                          * C2483
          umEND                                  * C2493
        ;                                        * C2498
        NIBHEX  BA0E70                           * C249D  «à.

* ROMPTR 0AB 07E
* refs (1): C0007
lbmol:
        UNIT                                     * C24A3
          %       4.5359237E2                    * C24A8
          $       "gmol"                         * C24BD
          umEND                                  * C24CF
        ;                                        * C24D4
        NIBHEX  BA0F70                           * C24D9  «ð.

* ROMPTR 0AB 07F
* refs (1): C0007
rpm:
        UNIT                                     * C24DF
          %1                                     * C24E4
          tok1                                   * C24E9
          $       "min"                          * C24EE
          um/                                    * C24FE
          umEND                                  * C2503
        ;                                        * C2508
        NIBHEX  BA0080                           * C250D  «..

* ROMPTR 0AB 080
* refs (1): C0007
dB:
        %       1E0                              * C2513

* ROMPTR 0AB 081
* refs (1): C0007
        CON(1)  8                                * C2528  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C2529  library
        CON(3)  #081                             * C252C  command
PINIT:
        ::                                       * C252F
          CK0                                    * C2534
          ROMPTR  0EA 070                        * C2539
        ;                                        * C2544

LIB0AB.hash:
        CON(5)  DOHSTR                           * C2549  hash table of library 0AB
        LENGTH                                   * C254E  length, to #C2F2A
        CON(5)  0                                * C2553  names of length 1
        REL(5)  H0AB.LQ                          * C2558  names of length 2
        REL(5)  H0AB.ADD                         * C255D  names of length 3
        REL(5)  H0AB.COL+                        * C2562  names of length 4
        REL(5)  H0AB.AMORT                       * C2567  names of length 5
        REL(5)  H0AB.CHOOSE                      * C256C  names of length 6
        REL(5)  H0AB.ANIMATE                     * C2571  names of length 7
        REL(5)  H0AB.MINEHUNT                    * C2576  names of length 8
        REL(5)  H0AB.WIREFRAME                   * C257B  names of length 9
        REL(5)  H0AB.PARSURFACE                  * C2580  names of length 10
        CON(5)  0                                * C2585  names of length 11
        CON(5)  0                                * C258A  names of length 12
        CON(5)  0                                * C258F  names of length 13
        CON(5)  0                                * C2594  names of length 14
        CON(5)  0                                * C2599  names of length 15
        CON(5)  0                                * C259E  names of length 16
        REL(5)  L_C2CA0                          * C25A3  end of the names
H0AB.LQ:
        CON(2)  2                                * C25A8
        NIBASC  "LQ"                             * C25AA
        CON(3)  #03D                             * C25AE  command
H0AB.LU:
        CON(2)  2                                * C25B1
        NIBASC  "LU"                             * C25B3
        CON(3)  #03B                             * C25B7  command
H0AB.QR:
        CON(2)  2                                * C25BA
        NIBASC  "QR"                             * C25BC
        CON(3)  #03C                             * C25C0  command
H0AB.dB:
        CON(2)  2                                * C25C3
        NIBASC  "dB"                             * C25C5
        CON(3)  #080                             * C25C9  command
H0AB.ADD:
        CON(2)  3                                * C25CC
        NIBASC  "ADD"                            * C25CE
        CON(3)  #06C                             * C25D4  command
H0AB.EGV:
        CON(2)  3                                * C25D7
        NIBASC  "EGV"                            * C25D9
        CON(3)  #037                             * C25DF  command
H0AB.F0λ:
        CON(2)  3                                * C25E2
        NIBASC  "F0λ"                            * C25E4
        CON(3)  #079                             * C25EA  command
H0AB.FFT:
        CON(2)  3                                * C25ED
        NIBASC  "FFT"                            * C25EF
        CON(3)  #025                             * C25F5  command
H0AB.LSQ:
        CON(2)  3                                * C25F8
        NIBASC  "LSQ"                            * C25FA
        CON(3)  #036                             * C2600  command
H0AB.RCI:
        CON(2)  3                                * C2603
        NIBASC  "RCI"                            * C2605
        CON(3)  #04D                             * C260B  command
H0AB.RKF:
        CON(2)  3                                * C260E
        NIBASC  "RKF"                            * C2610
        CON(3)  #02B                             * C2616  command
H0AB.RRK:
        CON(2)  3                                * C2619
        NIBASC  "RRK"                            * C261B
        CON(3)  #02E                             * C2621  command
H0AB.SEQ:
        CON(2)  3                                * C2624
        NIBASC  "SEQ"                            * C2626
        CON(3)  #062                             * C262C  command
H0AB.SVD:
        CON(2)  3                                * C262F
        NIBASC  "SVD"                            * C2631
        CON(3)  #039                             * C2637  command
H0AB.SVL:
        CON(2)  3                                * C263A
        NIBASC  "SVL"                            * C263C
        CON(3)  #03A                             * C2642  command
H0AB.TVM:
        CON(2)  3                                * C2645
        NIBASC  "TVM"                            * C2647
        CON(3)  #055                             * C264D  command
H0AB.rpm:
        CON(2)  3                                * C2650
        NIBASC  "rpm"                            * C2652
        CON(3)  #07F                             * C2658  command
H0AB.COL+:
        CON(2)  4                                * C265B
        NIBASC  "COL+"                           * C265D
        CON(3)  #04A                             * C2665  command
H0AB.COL-:
        CON(2)  4                                * C2668
        NIBASC  "COL-"                           * C266A
        CON(3)  #049                             * C2672  command
H0AB.COL→:
        CON(2)  4                                * C2675
        NIBASC  "COL→"                           * C2677
        CON(3)  #044                             * C267F  command
H0AB.COND:
        CON(2)  4                                * C2682
        NIBASC  "COND"                           * C2684
        CON(3)  #031                             * C268C  command
H0AB.CSWP:
        CON(2)  4                                * C268F
        NIBASC  "CSWP"                           * C2691
        CON(3)  #04C                             * C2699  command
H0AB.EGVL:
        CON(2)  4                                * C269C
        NIBASC  "EGVL"                           * C269E
        CON(3)  #038                             * C26A6  command
H0AB.HEAD:
        CON(2)  4                                * C26A9
        NIBASC  "HEAD"                           * C26AB
        CON(3)  #060                             * C26B3  command
H0AB.IFFT:
        CON(2)  4                                * C26B6
        NIBASC  "IFFT"                           * C26B8
        CON(3)  #026                             * C26C0  command
H0AB.MITM:
        CON(2)  4                                * C26C3
        NIBASC  "MITM"                           * C26C5
        CON(3)  #071                             * C26CD  command
H0AB.NSUB:
        CON(2)  4                                * C26D0
        NIBASC  "NSUB"                           * C26D2
        CON(3)  #065                             * C26DA  command
H0AB.NUMX:
        CON(2)  4                                * C26DD
        NIBASC  "NUMX"                           * C26DF
        CON(3)  #006                             * C26E7  command
H0AB.NUMY:
        CON(2)  4                                * C26EA
        NIBASC  "NUMY"                           * C26EC
        CON(3)  #007                             * C26F4  command
H0AB.PCOV:
        CON(2)  4                                * C26F7
        NIBASC  "PCOV"                           * C26F9
        CON(3)  #02A                             * C2701  command
H0AB.PVAR:
        CON(2)  4                                * C2704
        NIBASC  "PVAR"                           * C2706
        CON(3)  #029                             * C270E  command
H0AB.RANK:
        CON(2)  4                                * C2711
        NIBASC  "RANK"                           * C2713
        CON(3)  #035                             * C271B  command
H0AB.RANM:
        CON(2)  4                                * C271E
        NIBASC  "RANM"                           * C2720
        CON(3)  #040                             * C2728  command
H0AB.RCIJ:
        CON(2)  4                                * C272B
        NIBASC  "RCIJ"                           * C272D
        CON(3)  #04E                             * C2735  command
H0AB.RECT:
        CON(2)  4                                * C2738
        NIBASC  "RECT"                           * C273A
        CON(3)  #013                             * C2742  command
H0AB.ROW+:
        CON(2)  4                                * C2745
        NIBASC  "ROW+"                           * C2747
        CON(3)  #048                             * C274F  command
H0AB.ROW-:
        CON(2)  4                                * C2752
        NIBASC  "ROW-"                           * C2754
        CON(3)  #047                             * C275C  command
H0AB.ROW→:
        CON(2)  4                                * C275F
        NIBASC  "ROW→"                           * C2761
        CON(3)  #042                             * C2769  command
H0AB.RREF:
        CON(2)  4                                * C276C
        NIBASC  "RREF"                           * C276E
        CON(3)  #03F                             * C2776  command
H0AB.RSWP:
        CON(2)  4                                * C2779
        NIBASC  "RSWP"                           * C277B
        CON(3)  #04B                             * C2783  command
H0AB.SNRM:
        CON(2)  4                                * C2786
        NIBASC  "SNRM"                           * C2788
        CON(3)  #034                             * C2790  command
H0AB.SORT:
        CON(2)  4                                * C2793
        NIBASC  "SORT"                           * C2795
        CON(3)  #06E                             * C279D  command
H0AB.SRAD:
        CON(2)  4                                * C27A0
        NIBASC  "SRAD"                           * C27A2
        CON(3)  #033                             * C27AA  command
H0AB.TAIL:
        CON(2)  4                                * C27AD
        NIBASC  "TAIL"                           * C27AF
        CON(3)  #061                             * C27B7  command
H0AB.TINC:
        CON(2)  4                                * C27BA
        NIBASC  "TINC"                           * C27BC
        CON(3)  #07C                             * C27C4  command
H0AB.XVOL:
        CON(2)  4                                * C27C7
        NIBASC  "XVOL"                           * C27C9
        CON(3)  #000                             * C27D1  command
H0AB.YVOL:
        CON(2)  4                                * C27D4
        NIBASC  "YVOL"                           * C27D6
        CON(3)  #001                             * C27DE  command
H0AB.ZVOL:
        CON(2)  4                                * C27E1
        NIBASC  "ZVOL"                           * C27E3
        CON(3)  #002                             * C27EB  command
H0AB.→COL:
        CON(2)  4                                * C27EE
        NIBASC  "→COL"                           * C27F0
        CON(3)  #043                             * C27F8  command
H0AB.→ROW:
        CON(2)  4                                * C27FB
        NIBASC  "→ROW"                           * C27FD
        CON(3)  #041                             * C2805  command
H0AB.gmol:
        CON(2)  4                                * C2808
        NIBASC  "gmol"                           * C280A
        CON(3)  #07D                             * C2812  command
H0AB.AMORT:
        CON(2)  5                                * C2815
        NIBASC  "AMORT"                          * C2817
        CON(3)  #059                             * C2821  command
H0AB.ATICK:
        CON(2)  5                                * C2824
        NIBASC  "ATICK"                          * C2826
        CON(3)  #010                             * C2830  command
H0AB.CONST:
        CON(2)  5                                * C2833
        NIBASC  "CONST"                          * C2835
        CON(3)  #021                             * C283F  command
H0AB.CYLIN:
        CON(2)  5                                * C2842
        NIBASC  "CYLIN"                          * C2844
        CON(3)  #014                             * C284E  command
H0AB.DARCY:
        CON(2)  5                                * C2851
        NIBASC  "DARCY"                          * C2853
        CON(3)  #078                             * C285D  command
H0AB.DIAG→:
        CON(2)  5                                * C2860
        NIBASC  "DIAG→"                          * C2862
        CON(3)  #046                             * C286C  command
H0AB.EYEPT:
        CON(2)  5                                * C286F
        NIBASC  "EYEPT"                          * C2871
        CON(3)  #005                             * C287B  command
H0AB.FREE1:
        CON(2)  5                                * C287E
        NIBASC  "FREE1"                          * C2880
        CON(3)  #017                             * C288A  command
H0AB.LININ:
        CON(2)  5                                * C288D
        NIBASC  "LININ"                          * C288F
        CON(3)  #01C                             * C2899  command
H0AB.MCALC:
        CON(2)  5                                * C289C
        NIBASC  "MCALC"                          * C289E
        CON(3)  #073                             * C28A8  command
H0AB.MINIT:
        CON(2)  5                                * C28AB
        NIBASC  "MINIT"                          * C28AD
        CON(3)  #070                             * C28B7  command
H0AB.MROOT:
        CON(2)  5                                * C28BA
        NIBASC  "MROOT"                          * C28BC
        CON(3)  #074                             * C28C6  command
H0AB.MUSER:
        CON(2)  5                                * C28C9
        NIBASC  "MUSER"                          * C28CB
        CON(3)  #072                             * C28D5  command
H0AB.NDIST:
        CON(2)  5                                * C28D8
        NIBASC  "NDIST"                          * C28DA
        CON(3)  #027                             * C28E4  command
H0AB.NOVAL:
        CON(2)  5                                * C28E7
        NIBASC  "NOVAL"                          * C28E9
        CON(3)  #05B                             * C28F3  command
H0AB.PCOEF:
        CON(2)  5                                * C28F6
        NIBASC  "PCOEF"                          * C28F8
        CON(3)  #053                             * C2902  command
H0AB.PEVAL:
        CON(2)  5                                * C2905
        NIBASC  "PEVAL"                          * C2907
        CON(3)  #054                             * C2911  command
H0AB.PINIT:
        CON(2)  5                                * C2914
        NIBASC  "PINIT"                          * C2916
        CON(3)  #081                             * C2920  command
H0AB.PROOT:
        CON(2)  5                                * C2923
        NIBASC  "PROOT"                          * C2925
        CON(3)  #052                             * C292F  command
H0AB.PSDEV:
        CON(2)  5                                * C2932
        NIBASC  "PSDEV"                          * C2934
        CON(3)  #028                             * C293E  command
H0AB.SCHUR:
        CON(2)  5                                * C2941
        NIBASC  "SCHUR"                          * C2943
        CON(3)  #03E                             * C294D  command
H0AB.TEACH:
        CON(2)  5                                * C2950
        NIBASC  "TEACH"                          * C2952
        CON(3)  #011                             * C295C  command
H0AB.TRACE:
        CON(2)  5                                * C295F
        NIBASC  "TRACE"                          * C2961
        CON(3)  #032                             * C296B  command
H0AB.XRECV:
        CON(2)  5                                * C296E
        NIBASC  "XRECV"                          * C2970
        CON(3)  #05F                             * C297A  command
H0AB.XSEND:
        CON(2)  5                                * C297D
        NIBASC  "XSEND"                          * C297F
        CON(3)  #05E                             * C2989  command
H0AB.XXRNG:
        CON(2)  5                                * C298C
        NIBASC  "XXRNG"                          * C298E
        CON(3)  #003                             * C2998  command
H0AB.YYRNG:
        CON(2)  5                                * C299B
        NIBASC  "YYRNG"                          * C299D
        CON(3)  #004                             * C29A7  command
H0AB.ΣLIST:
        CON(2)  5                                * C29AA
        NIBASC  "ΣLIST"                          * C29AC
        CON(3)  #068                             * C29B6  command
H0AB.→DIAG:
        CON(2)  5                                * C29B9
        NIBASC  "→DIAG"                          * C29BB
        CON(3)  #045                             * C29C5  command
H0AB.ΔLIST:
        CON(2)  5                                * C29C8
        NIBASC  "ΔLIST"                          * C29CA
        CON(3)  #064                             * C29D4  command
H0AB.ΠLIST:
        CON(2)  5                                * C29D7
        NIBASC  "ΠLIST"                          * C29D9
        CON(3)  #06A                             * C29E3  command
H0AB.lbmol:
        CON(2)  5                                * C29E6
        NIBASC  "lbmol"                          * C29E8
        CON(3)  #07E                             * C29F2  command
H0AB.CHOOSE:
        CON(2)  6                                * C29F5
        NIBASC  "CHOOSE"                         * C29F7
        CON(3)  #05C                             * C2A03  command
H0AB.CONLIB:
        CON(2)  6                                * C2A06
        NIBASC  "CONLIB"                         * C2A08
        CON(3)  #020                             * C2A14  command
H0AB.DIFFEQ:
        CON(2)  6                                * C2A17
        NIBASC  "DIFFEQ"                         * C2A19
        CON(3)  #00E                             * C2A25  command
H0AB.DOLIST:
        CON(2)  6                                * C2A28
        NIBASC  "DOLIST"                         * C2A2A
        CON(3)  #06B                             * C2A36  command
H0AB.DOSUBS:
        CON(2)  6                                * C2A39
        NIBASC  "DOSUBS"                         * C2A3B
        CON(3)  #063                             * C2A47  command
H0AB.ENDSUB:
        CON(2)  6                                * C2A4A
        NIBASC  "ENDSUB"                         * C2A4C
        CON(3)  #066                             * C2A58  command
H0AB.EQNLIB:
        CON(2)  6                                * C2A5B
        NIBASC  "EQNLIB"                         * C2A5D
        CON(3)  #022                             * C2A69  command
H0AB.INFORM:
        CON(2)  6                                * C2A6C
        NIBASC  "INFORM"                         * C2A6E
        CON(3)  #05A                             * C2A7A  command
H0AB.MERGE1:
        CON(2)  6                                * C2A7D
        NIBASC  "MERGE1"                         * C2A7F
        CON(3)  #016                             * C2A8B  command
H0AB.MSGBOX:
        CON(2)  6                                * C2A8E
        NIBASC  "MSGBOX"                         * C2A90
        CON(3)  #05D                             * C2A9C  command
H0AB.MSOLVR:
        CON(2)  6                                * C2A9F
        NIBASC  "MSOLVR"                         * C2AA1
        CON(3)  #024                             * C2AAD  command
H0AB.RKFERR:
        CON(2)  6                                * C2AB0
        NIBASC  "RKFERR"                         * C2AB2
        CON(3)  #02D                             * C2ABE  command
H0AB.RSBERR:
        CON(2)  6                                * C2AC1
        NIBASC  "RSBERR"                         * C2AC3
        CON(3)  #030                             * C2ACF  command
H0AB.SIDENS:
        CON(2)  6                                * C2AD2
        NIBASC  "SIDENS"                         * C2AD4
        CON(3)  #07A                             * C2AE0  command
H0AB.SPHERE:
        CON(2)  6                                * C2AE3
        NIBASC  "SPHERE"                         * C2AE5
        CON(3)  #015                             * C2AF1  command
H0AB.STREAM:
        CON(2)  6                                * C2AF4
        NIBASC  "STREAM"                         * C2AF6
        CON(3)  #067                             * C2B02  command
H0AB.TDELTA:
        CON(2)  6                                * C2B05
        NIBASC  "TDELTA"                         * C2B07
        CON(3)  #07B                             * C2B13  command
H0AB.TVMBEG:
        CON(2)  6                                * C2B16
        NIBASC  "TVMBEG"                         * C2B18
        CON(3)  #056                             * C2B24  command
H0AB.TVMEND:
        CON(2)  6                                * C2B27
        NIBASC  "TVMEND"                         * C2B29
        CON(3)  #057                             * C2B35  command
H0AB.YSLICE:
        CON(2)  6                                * C2B38
        NIBASC  "YSLICE"                         * C2B3A
        CON(3)  #00B                             * C2B46  command
H0AB.ANIMATE:
        CON(2)  7                                * C2B49
        NIBASC  "ANIMATE"                        * C2B4B
        CON(3)  #018                             * C2B59  command
H0AB.CLTEACH:
        CON(2)  7                                * C2B5C
        NIBASC  "CLTEACH"                        * C2B5E
        CON(3)  #012                             * C2B6C  command
H0AB.FANNING:
        CON(2)  7                                * C2B6F
        NIBASC  "FANNING"                        * C2B71
        CON(3)  #077                             * C2B7F  command
H0AB.GRIDMAP:
        CON(2)  7                                * C2B82
        NIBASC  "GRIDMAP"                        * C2B84
        CON(3)  #00A                             * C2B92  command
H0AB.LIBEVAL:
        CON(2)  7                                * C2B95
        NIBASC  "LIBEVAL"                        * C2B97
        CON(3)  #01E                             * C2BA5  command
H0AB.REVLIST:
        CON(2)  7                                * C2BA8
        NIBASC  "REVLIST"                        * C2BAA
        CON(3)  #06D                             * C2BB8  command
H0AB.RKFSTEP:
        CON(2)  7                                * C2BBB
        NIBASC  "RKFSTEP"                        * C2BBD
        CON(3)  #02C                             * C2BCB  command
H0AB.RRKSTEP:
        CON(2)  7                                * C2BCE
        NIBASC  "RRKSTEP"                        * C2BD0
        CON(3)  #02F                             * C2BDE  command
H0AB.SOLVEQN:
        CON(2)  7                                * C2BE1
        NIBASC  "SOLVEQN"                        * C2BE3
        CON(3)  #023                             * C2BF1  command
H0AB.TVMROOT:
        CON(2)  7                                * C2BF4
        NIBASC  "TVMROOT"                        * C2BF6
        CON(3)  #058                             * C2C04  command
H0AB.VERSION:
        CON(2)  7                                * C2C07
        NIBASC  "VERSION"                        * C2C09
        CON(3)  #00F                             * C2C17  command
H0AB.ZFACTOR:
        CON(2)  7                                * C2C1A
        NIBASC  "ZFACTOR"                        * C2C1C
        CON(3)  #076                             * C2C2A  command
H0AB.MINEHUNT:
        CON(2)  8                                * C2C2D
        NIBASC  "MINEHUNT"                       * C2C2F
        CON(3)  #075                             * C2C3F  command
H0AB.PCONTOUR:
        CON(2)  8                                * C2C42
        NIBASC  "PCONTOUR"                       * C2C44
        CON(3)  #00D                             * C2C54  command
H0AB.WIREFRAME:
        CON(2)  9                                * C2C57
        NIBASC  "WIREFRAME"                      * C2C59
        CON(3)  #008                             * C2C6B  command
H0AB.PARSURFACE:
        CON(2)  10                               * C2C6E
        NIBASC  "PARSURFACE"                     * C2C70
        CON(3)  #009                             * C2C84  command
H0AB.SLOPEFIELD:
        CON(2)  10                               * C2C87
        NIBASC  "SLOPEFIELD"                     * C2C89
        CON(3)  #00C                             * C2C9D  command
L_C2CA0:
        CON(5)  (*)-H0AB.XVOL                    * C2CA0  name of command 000
        CON(5)  (*)-H0AB.YVOL                    * C2CA5  name of command 001
        CON(5)  (*)-H0AB.ZVOL                    * C2CAA  name of command 002
        CON(5)  (*)-H0AB.XXRNG                   * C2CAF  name of command 003
        CON(5)  (*)-H0AB.YYRNG                   * C2CB4  name of command 004
        CON(5)  (*)-H0AB.EYEPT                   * C2CB9  name of command 005
        CON(5)  (*)-H0AB.NUMX                    * C2CBE  name of command 006
        CON(5)  (*)-H0AB.NUMY                    * C2CC3  name of command 007
        CON(5)  (*)-H0AB.WIREFRAME               * C2CC8  name of command 008
        CON(5)  (*)-H0AB.PARSURFACE              * C2CCD  name of command 009
        CON(5)  (*)-H0AB.GRIDMAP                 * C2CD2  name of command 00A
        CON(5)  (*)-H0AB.YSLICE                  * C2CD7  name of command 00B
        CON(5)  (*)-H0AB.SLOPEFIELD              * C2CDC  name of command 00C
        CON(5)  (*)-H0AB.PCONTOUR                * C2CE1  name of command 00D
        CON(5)  (*)-H0AB.DIFFEQ                  * C2CE6  name of command 00E
        CON(5)  (*)-H0AB.VERSION                 * C2CEB  name of command 00F
        CON(5)  (*)-H0AB.ATICK                   * C2CF0  name of command 010
        CON(5)  (*)-H0AB.TEACH                   * C2CF5  name of command 011
        CON(5)  (*)-H0AB.CLTEACH                 * C2CFA  name of command 012
        CON(5)  (*)-H0AB.RECT                    * C2CFF  name of command 013
        CON(5)  (*)-H0AB.CYLIN                   * C2D04  name of command 014
        CON(5)  (*)-H0AB.SPHERE                  * C2D09  name of command 015
        CON(5)  (*)-H0AB.MERGE1                  * C2D0E  name of command 016
        CON(5)  (*)-H0AB.FREE1                   * C2D13  name of command 017
        CON(5)  (*)-H0AB.ANIMATE                 * C2D18  name of command 018
        CON(5)  0                                * C2D1D  command 019 has no name
        CON(5)  0                                * C2D22  command 01A has no name
        CON(5)  0                                * C2D27  command 01B has no name
        CON(5)  (*)-H0AB.LININ                   * C2D2C  name of command 01C
        CON(5)  0                                * C2D31  command 01D has no name
        CON(5)  (*)-H0AB.LIBEVAL                 * C2D36  name of command 01E
        CON(5)  0                                * C2D3B  command 01F has no name
        CON(5)  (*)-H0AB.CONLIB                  * C2D40  name of command 020
        CON(5)  (*)-H0AB.CONST                   * C2D45  name of command 021
        CON(5)  (*)-H0AB.EQNLIB                  * C2D4A  name of command 022
        CON(5)  (*)-H0AB.SOLVEQN                 * C2D4F  name of command 023
        CON(5)  (*)-H0AB.MSOLVR                  * C2D54  name of command 024
        CON(5)  (*)-H0AB.FFT                     * C2D59  name of command 025
        CON(5)  (*)-H0AB.IFFT                    * C2D5E  name of command 026
        CON(5)  (*)-H0AB.NDIST                   * C2D63  name of command 027
        CON(5)  (*)-H0AB.PSDEV                   * C2D68  name of command 028
        CON(5)  (*)-H0AB.PVAR                    * C2D6D  name of command 029
        CON(5)  (*)-H0AB.PCOV                    * C2D72  name of command 02A
        CON(5)  (*)-H0AB.RKF                     * C2D77  name of command 02B
        CON(5)  (*)-H0AB.RKFSTEP                 * C2D7C  name of command 02C
        CON(5)  (*)-H0AB.RKFERR                  * C2D81  name of command 02D
        CON(5)  (*)-H0AB.RRK                     * C2D86  name of command 02E
        CON(5)  (*)-H0AB.RRKSTEP                 * C2D8B  name of command 02F
        CON(5)  (*)-H0AB.RSBERR                  * C2D90  name of command 030
        CON(5)  (*)-H0AB.COND                    * C2D95  name of command 031
        CON(5)  (*)-H0AB.TRACE                   * C2D9A  name of command 032
        CON(5)  (*)-H0AB.SRAD                    * C2D9F  name of command 033
        CON(5)  (*)-H0AB.SNRM                    * C2DA4  name of command 034
        CON(5)  (*)-H0AB.RANK                    * C2DA9  name of command 035
        CON(5)  (*)-H0AB.LSQ                     * C2DAE  name of command 036
        CON(5)  (*)-H0AB.EGV                     * C2DB3  name of command 037
        CON(5)  (*)-H0AB.EGVL                    * C2DB8  name of command 038
        CON(5)  (*)-H0AB.SVD                     * C2DBD  name of command 039
        CON(5)  (*)-H0AB.SVL                     * C2DC2  name of command 03A
        CON(5)  (*)-H0AB.LU                      * C2DC7  name of command 03B
        CON(5)  (*)-H0AB.QR                      * C2DCC  name of command 03C
        CON(5)  (*)-H0AB.LQ                      * C2DD1  name of command 03D
        CON(5)  (*)-H0AB.SCHUR                   * C2DD6  name of command 03E
        CON(5)  (*)-H0AB.RREF                    * C2DDB  name of command 03F
        CON(5)  (*)-H0AB.RANM                    * C2DE0  name of command 040
        CON(5)  (*)-H0AB.→ROW                    * C2DE5  name of command 041
        CON(5)  (*)-H0AB.ROW→                    * C2DEA  name of command 042
        CON(5)  (*)-H0AB.→COL                    * C2DEF  name of command 043
        CON(5)  (*)-H0AB.COL→                    * C2DF4  name of command 044
        CON(5)  (*)-H0AB.→DIAG                   * C2DF9  name of command 045
        CON(5)  (*)-H0AB.DIAG→                   * C2DFE  name of command 046
        CON(5)  (*)-H0AB.ROW-                    * C2E03  name of command 047
        CON(5)  (*)-H0AB.ROW+                    * C2E08  name of command 048
        CON(5)  (*)-H0AB.COL-                    * C2E0D  name of command 049
        CON(5)  (*)-H0AB.COL+                    * C2E12  name of command 04A
        CON(5)  (*)-H0AB.RSWP                    * C2E17  name of command 04B
        CON(5)  (*)-H0AB.CSWP                    * C2E1C  name of command 04C
        CON(5)  (*)-H0AB.RCI                     * C2E21  name of command 04D
        CON(5)  (*)-H0AB.RCIJ                    * C2E26  name of command 04E
        CON(5)  0                                * C2E2B  command 04F has no name
        CON(5)  0                                * C2E30  command 050 has no name
        CON(5)  0                                * C2E35  command 051 has no name
        CON(5)  (*)-H0AB.PROOT                   * C2E3A  name of command 052
        CON(5)  (*)-H0AB.PCOEF                   * C2E3F  name of command 053
        CON(5)  (*)-H0AB.PEVAL                   * C2E44  name of command 054
        CON(5)  (*)-H0AB.TVM                     * C2E49  name of command 055
        CON(5)  (*)-H0AB.TVMBEG                  * C2E4E  name of command 056
        CON(5)  (*)-H0AB.TVMEND                  * C2E53  name of command 057
        CON(5)  (*)-H0AB.TVMROOT                 * C2E58  name of command 058
        CON(5)  (*)-H0AB.AMORT                   * C2E5D  name of command 059
        CON(5)  (*)-H0AB.INFORM                  * C2E62  name of command 05A
        CON(5)  (*)-H0AB.NOVAL                   * C2E67  name of command 05B
        CON(5)  (*)-H0AB.CHOOSE                  * C2E6C  name of command 05C
        CON(5)  (*)-H0AB.MSGBOX                  * C2E71  name of command 05D
        CON(5)  (*)-H0AB.XSEND                   * C2E76  name of command 05E
        CON(5)  (*)-H0AB.XRECV                   * C2E7B  name of command 05F
        CON(5)  (*)-H0AB.HEAD                    * C2E80  name of command 060
        CON(5)  (*)-H0AB.TAIL                    * C2E85  name of command 061
        CON(5)  (*)-H0AB.SEQ                     * C2E8A  name of command 062
        CON(5)  (*)-H0AB.DOSUBS                  * C2E8F  name of command 063
        CON(5)  (*)-H0AB.ΔLIST                   * C2E94  name of command 064
        CON(5)  (*)-H0AB.NSUB                    * C2E99  name of command 065
        CON(5)  (*)-H0AB.ENDSUB                  * C2E9E  name of command 066
        CON(5)  (*)-H0AB.STREAM                  * C2EA3  name of command 067
        CON(5)  (*)-H0AB.ΣLIST                   * C2EA8  name of command 068
        CON(5)  0                                * C2EAD  command 069 has no name
        CON(5)  (*)-H0AB.ΠLIST                   * C2EB2  name of command 06A
        CON(5)  (*)-H0AB.DOLIST                  * C2EB7  name of command 06B
        CON(5)  (*)-H0AB.ADD                     * C2EBC  name of command 06C
        CON(5)  (*)-H0AB.REVLIST                 * C2EC1  name of command 06D
        CON(5)  (*)-H0AB.SORT                    * C2EC6  name of command 06E
        CON(5)  (*)-H0AB.MSOLVR                  * C2ECB  name of command 06F
        CON(5)  (*)-H0AB.MINIT                   * C2ED0  name of command 070
        CON(5)  (*)-H0AB.MITM                    * C2ED5  name of command 071
        CON(5)  (*)-H0AB.MUSER                   * C2EDA  name of command 072
        CON(5)  (*)-H0AB.MCALC                   * C2EDF  name of command 073
        CON(5)  (*)-H0AB.MROOT                   * C2EE4  name of command 074
        CON(5)  (*)-H0AB.MINEHUNT                * C2EE9  name of command 075
        CON(5)  (*)-H0AB.ZFACTOR                 * C2EEE  name of command 076
        CON(5)  (*)-H0AB.FANNING                 * C2EF3  name of command 077
        CON(5)  (*)-H0AB.DARCY                   * C2EF8  name of command 078
        CON(5)  (*)-H0AB.F0λ                     * C2EFD  name of command 079
        CON(5)  (*)-H0AB.SIDENS                  * C2F02  name of command 07A
        CON(5)  (*)-H0AB.TDELTA                  * C2F07  name of command 07B
        CON(5)  (*)-H0AB.TINC                    * C2F0C  name of command 07C
        CON(5)  (*)-H0AB.gmol                    * C2F11  name of command 07D
        CON(5)  (*)-H0AB.lbmol                   * C2F16  name of command 07E
        CON(5)  (*)-H0AB.rpm                     * C2F1B  name of command 07F
        CON(5)  (*)-H0AB.dB                      * C2F20  name of command 080
        CON(5)  (*)-H0AB.PINIT                   * C2F25  name of command 081
        ENDLENGTH                                * C2F2A

LIB0AB.link:
        CON(5)  DOHSTR                           * C2F2A  link table of library 0AB
        LENGTH                                   * C2F2F  length, to #C31BE
        REL(5)  XVOL                             * C2F34  000 XVOL
        REL(5)  YVOL                             * C2F39  001 YVOL
        REL(5)  ZVOL                             * C2F3E  002 ZVOL
        REL(5)  XXRNG                            * C2F43  003 XXRNG
        REL(5)  YYRNG                            * C2F48  004 YYRNG
        REL(5)  EYEPT                            * C2F4D  005 EYEPT
        REL(5)  NUMX                             * C2F52  006 NUMX
        REL(5)  NUMY                             * C2F57  007 NUMY
        REL(5)  WIREFRAME                        * C2F5C  008 WIREFRAME
        REL(5)  PARSURFACE                       * C2F61  009 PARSURFACE
        REL(5)  GRIDMAP                          * C2F66  00A GRIDMAP
        REL(5)  YSLICE                           * C2F6B  00B YSLICE
        REL(5)  SLOPEFIELD                       * C2F70  00C SLOPEFIELD
        REL(5)  PCONTOUR                         * C2F75  00D PCONTOUR
        REL(5)  DIFFEQ                           * C2F7A  00E DIFFEQ
        REL(5)  VERSION                          * C2F7F  00F VERSION
        REL(5)  ATICK                            * C2F84  010 ATICK
        REL(5)  TEACH                            * C2F89  011 TEACH
        REL(5)  CLTEACH                          * C2F8E  012 CLTEACH
        REL(5)  RECT                             * C2F93  013 RECT
        REL(5)  CYLIN                            * C2F98  014 CYLIN
        REL(5)  SPHERE                           * C2F9D  015 SPHERE
        REL(5)  MERGE1                           * C2FA2  016 MERGE1
        REL(5)  FREE1                            * C2FA7  017 FREE1
        REL(5)  ANIMATE                          * C2FAC  018 ANIMATE
        REL(5)  ROMP_0AB_019                     * C2FB1  019 
        REL(5)  ROMP_0AB_01A                     * C2FB6  01A 
        REL(5)  ROMP_0AB_01B                     * C2FBB  01B 
        REL(5)  LININ                            * C2FC0  01C LININ
        REL(5)  ROMP_0AB_01D                     * C2FC5  01D 
        REL(5)  LIBEVAL                          * C2FCA  01E LIBEVAL
        REL(5)  ROMP_0AB_01F                     * C2FCF  01F 
        REL(5)  CONLIB                           * C2FD4  020 CONLIB
        REL(5)  CONST                            * C2FD9  021 CONST
        REL(5)  EQNLIB                           * C2FDE  022 EQNLIB
        REL(5)  SOLVEQN                          * C2FE3  023 SOLVEQN
        REL(5)  ROMP_0AB_06F                     * C2FE8  024 
        REL(5)  FFT                              * C2FED  025 FFT
        REL(5)  IFFT                             * C2FF2  026 IFFT
        REL(5)  NDIST                            * C2FF7  027 NDIST
        REL(5)  PSDEV                            * C2FFC  028 PSDEV
        REL(5)  PVAR                             * C3001  029 PVAR
        REL(5)  PCOV                             * C3006  02A PCOV
        REL(5)  RKF                              * C300B  02B RKF
        REL(5)  RKFSTEP                          * C3010  02C RKFSTEP
        REL(5)  RKFERR                           * C3015  02D RKFERR
        REL(5)  RRK                              * C301A  02E RRK
        REL(5)  RRKSTEP                          * C301F  02F RRKSTEP
        REL(5)  RSBERR                           * C3024  030 RSBERR
        REL(5)  COND                             * C3029  031 COND
        REL(5)  TRACE_C110E                      * C302E  032 TRACE
        REL(5)  SRAD                             * C3033  033 SRAD
        REL(5)  SNRM                             * C3038  034 SNRM
        REL(5)  RANK                             * C303D  035 RANK
        REL(5)  LSQ                              * C3042  036 LSQ
        REL(5)  EGV                              * C3047  037 EGV
        REL(5)  EGVL                             * C304C  038 EGVL
        REL(5)  SVD                              * C3051  039 SVD
        REL(5)  SVL                              * C3056  03A SVL
        REL(5)  LU                               * C305B  03B LU
        REL(5)  QR                               * C3060  03C QR
        REL(5)  LQ                               * C3065  03D LQ
        REL(5)  SCHUR                            * C306A  03E SCHUR
        REL(5)  RREF                             * C306F  03F RREF
        REL(5)  RANM                             * C3074  040 RANM
        REL(5)  →ROW                             * C3079  041 →ROW
        REL(5)  ROW→                             * C307E  042 ROW→
        REL(5)  →COL                             * C3083  043 →COL
        REL(5)  COL→                             * C3088  044 COL→
        REL(5)  →DIAG                            * C308D  045 →DIAG
        REL(5)  DIAG→                            * C3092  046 DIAG→
        REL(5)  ROW-                             * C3097  047 ROW-
        REL(5)  ROW+                             * C309C  048 ROW+
        REL(5)  COL-                             * C30A1  049 COL-
        REL(5)  COL+                             * C30A6  04A COL+
        REL(5)  RSWP                             * C30AB  04B RSWP
        REL(5)  CSWP                             * C30B0  04C CSWP
        REL(5)  RCI                              * C30B5  04D RCI
        REL(5)  RCIJ                             * C30BA  04E RCIJ
        REL(5)  ROMP_0AB_04F                     * C30BF  04F 
        REL(5)  ROMP_0AB_050                     * C30C4  050 
        REL(5)  ROMP_0AB_051                     * C30C9  051 
        REL(5)  PROOT                            * C30CE  052 PROOT
        REL(5)  PCOEF                            * C30D3  053 PCOEF
        REL(5)  PEVAL                            * C30D8  054 PEVAL
        REL(5)  TVM                              * C30DD  055 TVM
        REL(5)  TVMBEG                           * C30E2  056 TVMBEG
        REL(5)  TVMEND                           * C30E7  057 TVMEND
        REL(5)  TVMROOT                          * C30EC  058 TVMROOT
        REL(5)  AMORT                            * C30F1  059 AMORT
        REL(5)  INFORM                           * C30F6  05A INFORM
        REL(5)  NOVAL                            * C30FB  05B NOVAL
        REL(5)  CHOOSE                           * C3100  05C CHOOSE
        REL(5)  MSGBOX                           * C3105  05D MSGBOX
        REL(5)  XSEND                            * C310A  05E XSEND
        REL(5)  XRECV                            * C310F  05F XRECV
        REL(5)  HEAD                             * C3114  060 HEAD
        REL(5)  TAIL                             * C3119  061 TAIL
        REL(5)  SEQ                              * C311E  062 SEQ
        REL(5)  DOSUBS                           * C3123  063 DOSUBS
        REL(5)  ΔLIST                            * C3128  064 ΔLIST
        REL(5)  NSUB                             * C312D  065 NSUB
        REL(5)  ENDSUB                           * C3132  066 ENDSUB
        REL(5)  STREAM                           * C3137  067 STREAM
        REL(5)  ΣLIST                            * C313C  068 ΣLIST
        REL(5)  ROMP_0AB_069                     * C3141  069 
        REL(5)  ΠLIST                            * C3146  06A ΠLIST
        REL(5)  DOLIST_C1D41                     * C314B  06B DOLIST
        REL(5)  ADD                              * C3150  06C ADD
        REL(5)  REVLIST                          * C3155  06D REVLIST
        REL(5)  SORT                             * C315A  06E SORT
        REL(5)  ROMP_0AB_06F                     * C315F  06F 
        REL(5)  MINIT                            * C3164  070 MINIT
        REL(5)  MITM                             * C3169  071 MITM
        REL(5)  MUSER                            * C316E  072 MUSER
        REL(5)  MCALC                            * C3173  073 MCALC
        REL(5)  MROOT                            * C3178  074 MROOT
        REL(5)  MINEHUNT                         * C317D  075 MINEHUNT
        REL(5)  ZFACTOR                          * C3182  076 ZFACTOR
        REL(5)  FANNING                          * C3187  077 FANNING
        REL(5)  DARCY                            * C318C  078 DARCY
        REL(5)  F0λ                              * C3191  079 F0λ
        REL(5)  SIDENS                           * C3196  07A SIDENS
        REL(5)  TDELTA                           * C319B  07B TDELTA
        REL(5)  TINC                             * C31A0  07C TINC
        REL(5)  gmol                             * C31A5  07D gmol
        REL(5)  lbmol                            * C31AA  07E lbmol
        REL(5)  rpm                              * C31AF  07F rpm
        REL(5)  dB                               * C31B4  080 dB
        REL(5)  PINIT                            * C31B9  081 PINIT
