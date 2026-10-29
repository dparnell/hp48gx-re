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
        :: CK2&Dispatch                          * C0025
          BINT17 ROMPTR 0B5 081                  * C002F  real real
        ;                                        * C003F

* ROMPTR 0AB 001
* refs (1): C0007
        CON(1)  8                                * C0044  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0045  library
        CON(3)  #001                             * C0048  command
YVOL:
        :: CK2&Dispatch                          * C004B
          BINT17 ROMPTR 0B5 083                  * C0055  real real
        ;                                        * C0065

* ROMPTR 0AB 002
* refs (1): C0007
        CON(1)  8                                * C006A  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C006B  library
        CON(3)  #002                             * C006E  command
ZVOL:
        :: CK2&Dispatch                          * C0071
          BINT17 ROMPTR 0B5 085                  * C007B  real real
        ;                                        * C008B

* ROMPTR 0AB 003
* refs (1): C0007
        CON(1)  8                                * C0090  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0091  library
        CON(3)  #003                             * C0094  command
XXRNG:
        :: CK2&Dispatch                          * C0097
          BINT17 ROMPTR 0B5 089                  * C00A1  real real
        ;                                        * C00B1

* ROMPTR 0AB 004
* refs (1): C0007
        CON(1)  8                                * C00B6  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C00B7  library
        CON(3)  #004                             * C00BA  command
YYRNG:
        :: CK2&Dispatch                          * C00BD
          BINT17 ROMPTR 0B5 08B                  * C00C7  real real
        ;                                        * C00D7

* ROMPTR 0AB 005
* refs (1): C0007
        CON(1)  8                                * C00DC  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C00DD  library
        CON(3)  #005                             * C00E0  command
EYEPT:
        :: CK3&Dispatch                          * C00E3
          # 111 ROMPTR 0B5 087                   * C00ED  real real real
        ;                                        * C0102

* ROMPTR 0AB 006
* refs (1): C0007
        CON(1)  8                                * C0107  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0108  library
        CON(3)  #006                             * C010B  command
NUMX:
        :: CK1&Dispatch                          * C010E
          BINT1 ROMPTR 0B5 07D                   * C0118  real
        ;                                        * C0128

* ROMPTR 0AB 007
* refs (1): C0007
        CON(1)  8                                * C012D  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C012E  library
        CON(3)  #007                             * C0131  command
NUMY:
        :: CK1&Dispatch                          * C0134
          BINT1 ROMPTR 0B5 07F                   * C013E  real
        ;                                        * C014E

* ROMPTR 0AB 008
* refs (1): C0007
        CON(1)  12                               * C0153  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0154  library
        CON(3)  #008                             * C0157  command
WIREFRAME:
        :: CK0 ' ROMPTR 0AB 008 PUTPTYPE ;       * C015A  WIREFRAME

        { TRUE ROMPTR 0F1 002 NOP FALSE          * C017E
          { OBJ_47209 OBJ_457BC OBJ_45BB6        * C019D
            {                                    * C01B1
              :: ROMPTR 0F1 028 ROMPTR 0F1 02D ; NOP } * C01B6
            :: ROMPTR 0F1 02C ROMPTR 0F1 02D ; } * C01E0
          FALSE NOP NOP %1 FALSE FALSE FALSE OBJ_570E5 OBJ_45AEB OBJ_45B8D * C0205
          ROMPTR 0F1 026 }                       * C0237

* ROMPTR 0AB 009
* refs (1): C0007
        CON(1)  12                               * C0247  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0248  library
        CON(3)  #009                             * C024B  command
PARSURFACE:
        :: CK0 ' ROMPTR 0AB 009 PUTPTYPE ;       * C024E  PARSURFACE

        { TRUE ROMPTR 0F1 010 NOP FALSE          * C0272
          { OBJ_47209 OBJ_4590E OBJ_45BB6        * C0291
            {                                    * C02A5
              :: ROMPTR 0F1 028 ROMPTR 0F1 031 ; NOP } * C02AA
            :: ROMPTR 0F1 02C ROMPTR 0F1 031 ; } * C02D4
          FALSE NOP NOP %1 FALSE FALSE FALSE OBJ_5712B OBJ_45A1B OBJ_45006 * C02F9
          ROMPTR 0F1 026 }                       * C032B

* ROMPTR 0AB 00A
* refs (1): C0007
        CON(1)  12                               * C033B  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C033C  library
        CON(3)  #00A                             * C033F  command
GRIDMAP:
        :: CK0 ' ROMPTR 0AB 00A PUTPTYPE ;       * C0342  GRIDMAP

        { TRUE ROMPTR 0F1 00C NOP FALSE          * C0366
          { OBJ_47209 OBJ_4590E OBJ_45BB6        * C0385
            {                                    * C0399
              :: ROMPTR 0F1 028 ROMPTR 0F1 02E ; NOP } * C039E
            :: ROMPTR 0F1 02C ROMPTR 0F1 02E ; } * C03C8
          FALSE NOP NOP %1 FALSE FALSE FALSE OBJ_57108 OBJ_45986 OBJ_459E3 * C03ED
          ROMPTR 0F1 026 }                       * C041F

* ROMPTR 0AB 00B
* refs (1): C0007
        CON(1)  12                               * C042F  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0430  library
        CON(3)  #00B                             * C0433  command
YSLICE:
        :: CK0 ' ROMPTR 0AB 00B PUTPTYPE ;       * C0436  YSLICE

        { TRUE ROMPTR 0F1 013 NOP FALSE          * C045A
          { OBJ_47209 OBJ_462C6 OBJ_45BB6        * C0479
            {                                    * C048D
              :: ROMPTR 0F1 028 ROMPTR 0F1 02F ; NOP } * C0492
            :: ROMPTR 0F1 02C ROMPTR 0F1 02F ; } * C04BC
          FALSE NOP NOP %1 FALSE FALSE FALSE OBJ_45C5D OBJ_45C80 OBJ_45CAE * C04E1
          ROMPTR 0F1 026 }                       * C0513

* ROMPTR 0AB 00C
* refs (1): C0007
        CON(1)  12                               * C0523  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0524  library
        CON(3)  #00C                             * C0527  command
SLOPEFIELD:
        :: CK0 ' ROMPTR 0AB 00C PUTPTYPE ;       * C052A  SLOPEFIELD

        { TRUE ROMPTR 0F1 019 NOP TRUE           * C054E
          { OBJ_47209 OBJ_4620E OBJ_45BB6        * C056D
            {                                    * C0581
              :: ROMPTR 0F1 028 ROMPTR 0F1 030 ; NOP } * C0586
            :: ROMPTR 0F1 02C ROMPTR 0F1 030 ; } * C05B0
          FALSE NOP NOP %1 FALSE FALSE FALSE OBJ_45C3A OBJ_45A59 OBJ_44FF2 * C05D5
          ROMPTR 0F1 026 }                       * C0607

* ROMPTR 0AB 00D
* refs (1): C0007
        CON(1)  12                               * C0617  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0618  library
        CON(3)  #00D                             * C061B  command
PCONTOUR:
        :: CK0 ' ROMPTR 0AB 00D PUTPTYPE ;       * C061E  PCONTOUR

        { TRUE ROMPTR 0F1 020 NOP TRUE           * C0642
          { OBJ_47209 OBJ_4620E OBJ_45BB6        * C0661
            {                                    * C0675
              :: ROMPTR 0F1 028 ROMPTR 0F1 032 ; NOP } * C067A
            :: ROMPTR 0F1 02C ROMPTR 0F1 032 ; } * C06A4
          FALSE NOP NOP %1 FALSE FALSE FALSE OBJ_5714E OBJ_45A59 OBJ_44FF2 * C06C9
          ROMPTR 0F1 026 }                       * C06FB

* ROMPTR 0AB 00E
* refs (1): C0007
        CON(1)  12                               * C070B  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C070C  library
        CON(3)  #00E                             * C070F  command
DIFFEQ:
        :: CK0 ' ROMPTR 0AB 00E PUTPTYPE ;       * C0712  DIFFEQ

        { TRUE ROMPTR 0B5 07A NOP TRUE NULL{} FALSE ~';PlotEval * C0736
          :: BINT31 TestSysFlag ITE              * C0764
            :: ' OBJ_4CE0B ;                     * C0778
            :: ' PlotFcnPt ;                     * C078C
          ;                                      * C07A0
          %0_2A2B4 FALSE FALSE FALSE OBJ_73211 OBJ_73270 ROMPTR 0F1 03F * C07A5
          OBJ_73594 NOP }                        * C07CE

* ROMPTR 0AB 00F
* refs (1): C0007
        CON(1)  8                                * C07DD  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C07DE  library
        CON(3)  #00F                             * C07E1  command
VERSION:
        :: CK0 # VersionStrings VERSION~1 TOTEMPOB EVAL ; * C07E4  the version object, read by VERSION

* refs (1): C0007
LIB0AB.config:
        :: # AB TOSRRP ;                         * C080C

* ROMPTR 0AB 010
* refs (1): C0007
        CON(1)  8                                * C0825  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0826  library
        CON(3)  #010                             * C0829  command
ATICK:
        :: CK1&Dispatch                          * C082C
          BINT1 ROMPTR 0E8 03F                   * C0836  real
          BINT11 ROMPTR 0E8 03F                  * C0846  binary
          BINT5 ROMPTR 0E8 03F                   * C0856  list
        ;                                        * C0866

* ROMPTR 0AB 011
* refs (1): C0007
        CON(1)  8                                * C086B  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C086C  library
        CON(3)  #011                             * C086F  command
TEACH:
        :: CK0 ROMPTR 0E8 02D ;                  * C0872

* ROMPTR 0AB 012
* refs (1): C0007
        CON(1)  8                                * C088C  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C088D  library
        CON(3)  #012                             * C0890  command
CLTEACH:
        :: CK0 ROMPTR 0E8 02C ;                  * C0893

* ROMPTR 0AB 013
* refs (1): C0007
        CON(1)  8                                * C08AD  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C08AE  library
        CON(3)  #013                             * C08B1  command
RECT:
        :: CK0 BINT16 ClrSysFlag ;               * C08B4

* ROMPTR 0AB 014
* refs (1): C0007
        CON(1)  8                                * C08CD  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C08CE  library
        CON(3)  #014                             * C08D1  command
CYLIN:
        :: CK0 BINT15 ClrSysFlag BINT16 SetSysFlag ; * C08D4

* ROMPTR 0AB 015
* refs (1): C0007
        CON(1)  8                                * C08F7  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C08F8  library
        CON(3)  #015                             * C08FB  command
SPHERE:
        :: CK0 BINT15 SetSysFlag BINT16 SetSysFlag ; * C08FE

* ROMPTR 0AB 016
* refs (1): C0007
        CON(1)  8                                * C0921  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0922  library
        CON(3)  #016                             * C0925  command
MERGE1:
        :: CK0 BINT1 OBJ_0B40C ;                 * C0928

* ROMPTR 0AB 017
* refs (1): C0007
        CON(1)  8                                * C0941  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0942  library
        CON(3)  #017                             * C0945  command
FREE1:
        :: CK1&Dispatch                          * C0948
          BINT5                                  * C0952  list
          :: %1 free(li,r) ;                     * C0957
          BINT6                                  * C096B  name
          :: %1 free(2r) ;                       * C0970
          BINT7                                  * C0984  local
          :: %1 free(2r) ;                       * C0989
          BINT1                                  * C099D  real
          :: %1 free(2r) ;                       * C09A2
        ;                                        * C09B6

* ROMPTR 0AB 018
* refs (1): C0007
        CON(1)  8                                * C09BB  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C09BC  library
        CON(3)  #018                             * C09BF  command
ANIMATE:
        :: CK1&Dispatch                          * C09C2
          BINT1                                  * C09CC  real
          :: CKNNOLASTWD MINUSONE SWAP %.1 ZEROZERO FALSE ROMPTR 0AB 019 ; * C09D1
          BINT5                                  * C0A04  list
          :: INNERCOMP BINT4 #= ?SKIP ARGNUMERR  * C0A09
            CKREAL COERCE DUP#0= IT #1-          * C0A27
            4ROLL CKREAL COERCE DUP DEPTH #5- #> IT SETSTACKERR * C0A40
            ROT CKREAL 4ROLL 2HXSLIST? TRUE      * C0A6D

* ROMPTR 0AB 019
* refs (1): C0007
ROMP_0AB_019:
            :: CHECKPICT TOGDISP TURNMENUOFF TRUE * C0A86
              { LAM 'SaveAnim } BIND ROMPTR 0AB 01B ABND ; * C0A9F
          ;                                      * C0ADC
        ;                                        * C0AE1

* ROMPTR 0AB 01A
* refs (1): C0007
* slots of 0AB 018 (derivative, inverse, ...: used by the symbolic code)
ROMP_0AB_01A:
        :: MINUSONE SWAP COERCE %.1 ZEROZERO FALSE * C0AE6  slot 0

* ROMPTR 0AB 01B
* refs (1): C0007
ANIMATE~1:
          ::                                     * C0B09
            { NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM NULLLAM } BIND ERRSET * C0B0E
            :: 6GETLAM ZERO_DO 5GETLAM ZERO_DO GBUFF 5GETLAM INDEX@ #- #1+ * C0B40
              PICK ROMPTR@NOT DROP DUPTYPEGROB? ?SKIP SETTYPEERR * C0B72
              3GETLAM 2GETLAM ChkRepl(2go,2s) DROP 4GETLAM dowait ?ATTNQUIT * C0B90
              LOOP LOOP ;                        * C0BB3
            ERRTRAP                              * C0BC2
            :: ERROR@ #0= ?SEMI                  * C0BC7
              ERRJMP ;                           * C0BDB
            :: 5GETLAM ' LAM 'SaveAnim undo NOTcase UNCOERCE * C0BE5
              NOTcase NDROP                      * C0C1C
              UNCOERCE 1GETLAM NOT?SEMI          * C0C26
              3GETLAM #>HXS 2GETLAM #>HXS TWO{}N 4GETLAM 6GETLAM DUP * C0C35
              MINUSONE #= IT DROPZERO            * C0C5D
              UNCOERCE BINT4 {}N ;               * C0C71
            ABND ;                               * C0C85
        ;                                        * C0C8F
        CON(2)  #01                              * C0C94  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 01C
* refs (1): C0007
        CON(1)  1                                * C0C96  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0C97  library
        CON(3)  #01C                             * C0C9A  command
LININ:
        :: CK2&Dispatch                          * C0C9D
          SYMSYM ROMPTR 0AB 01D                  * C0CA7  name|local|algebraic name|local|algebraic
          BINT26                                 * C0CB7  real name|local|algebraic
          :: DROP %1 ;                           * C0CBC
          BINT42                                 * C0CD0  complex name|local|algebraic
          :: DROP %1 ;                           * C0CD5
          EXTSYM                                 * C0CE9  unit name|local|algebraic
          :: DROP %1 ;                           * C0CEE
        ;                                        * C0D02

        HXS 01426350                             * C0D07

        { OBJ_5A333 #2= }                        * C0D19

* ROMPTR 0AB 01D
* refs (1): C0007
LININ~1:
        :: symcomp ChkExpr1Name CARCOMP DUP      * C0D2D
          { lam'dvar lam'dvar } BIND ZEROSWAP EXPLODE >dvars dvars? ABND * C0D46
          NOTcase                                * C0D78
          :: NDROP %1 ;                          * C0D7D
          linear! OVER#2+UNROL NDROP COERCEFLAG ; * C0D91

* ROMPTR 0AB 01E
* refs (1): C0007
        CON(1)  8                                * C0DAA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0DAB  library
        CON(3)  #01E                             * C0DAE  command
LIBEVAL:
        :: CK1&Dispatch                          * C0DB1
          BINT11 ROMPTR 0AB 01F                  * C0DBB  binary
        ;                                        * C0DCB

* ROMPTR 0AB 01F
* refs (1): C0007
LIBEVAL~1:
        :: DUP LENHXS BINT6 #<case ROMPTR 0E7 007 * C0DD0
          DUP BINT4 BINT6 SUBHXS HXS># SWAP BINT1 BINT3 SUBHXS HXS># * C0DF4
          #>ROMPTR COLA_EVAL ;                   * C0E26

* ROMPTR 0AB 020
* refs (1): C0007
        CON(1)  8                                * C0E35  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0E36  library
        CON(3)  #020                             * C0E39  command
CONLIB:
        :: CK0 ROMPTR 0E1 000 ;                  * C0E3C

* slots of 0AB 020 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #01                              * C0E56  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 021
* refs (1): C0007
        CON(1)  1                                * C0E58  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0E59  library
        CON(3)  #021                             * C0E5C  command
CONST:
        :: CK1&Dispatch                          * C0E5F
          BINT10 ROMPTR 0E1 008                  * C0E69  name|local|algebraic
        ;                                        * C0E79

        HXS 014350                               * C0E7E

        ROMPTR 0E7 011                           * C0E8E  ~UTVUNS1Arg

* ROMPTR 0AB 022
* refs (1): C0007
        CON(1)  8                                * C0E99  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0E9A  library
        CON(3)  #022                             * C0E9D  command
EQNLIB:
        :: CK0 ROMPTR 0E3 00C ;                  * C0EA0

* ROMPTR 0AB 023
* refs (1): C0007
        CON(1)  8                                * C0EBA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0EBB  library
        CON(3)  #023                             * C0EBE  command
SOLVEQN:
        :: CK3&Dispatch                          * C0EC1
          3REAL ROMPTR 0E3 06C                   * C0ECB  real real real
        ;                                        * C0EDB

* ROMPTR 0AB 025
* refs (1): C0007
        CON(1)  8                                * C0EE0  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0EE1  library
        CON(3)  #025                             * C0EE4  command
FFT:
        :: CK1&Dispatch                          * C0EE7
          BINT4 ROMPTR 0C4 000                   * C0EF1  array
        ;                                        * C0F01

* ROMPTR 0AB 026
* refs (1): C0007
        CON(1)  8                                * C0F06  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0F07  library
        CON(3)  #026                             * C0F0A  command
IFFT:
        :: CK1&Dispatch                          * C0F0D
          BINT4 ROMPTR 0C4 002                   * C0F17  array
        ;                                        * C0F27

* ROMPTR 0AB 027
* refs (1): C0007
        CON(1)  8                                * C0F2C  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0F2D  library
        CON(3)  #027                             * C0F30  command
NDIST:
        :: CK3&Dispatch                          * C0F33
          3REAL ROMPTR 0C4 005                   * C0F3D  real real real
        ;                                        * C0F4D

* ROMPTR 0AB 028
* refs (1): C0007
        CON(1)  8                                * C0F52  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0F53  library
        CON(3)  #028                             * C0F56  command
PSDEV:
        :: CK0 ROMPTR 0C4 006 ;                  * C0F59

* ROMPTR 0AB 029
* refs (1): C0007
        CON(1)  8                                * C0F73  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0F74  library
        CON(3)  #029                             * C0F77  command
PVAR:
        :: CK0 ROMPTR 0C4 007 ;                  * C0F7A

* ROMPTR 0AB 02A
* refs (1): C0007
        CON(1)  8                                * C0F94  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0F95  library
        CON(3)  #02A                             * C0F98  command
PCOV:
        :: CK0 ROMPTR 0C4 008 ;                  * C0F9B

* ROMPTR 0AB 02B
* refs (1): C0007
        CON(1)  8                                * C0FB5  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0FB6  library
        CON(3)  #02B                             * C0FB9  command
RKF:
        :: CK3&Dispatch                          * C0FBC
          # 511 ROMPTR 0C1 00E                   * C0FC6  list real real
          # 551 ROMPTR 0C1 00E                   * C0FDB  list list real
        ;                                        * C0FF0

* ROMPTR 0AB 02C
* refs (1): C0007
        CON(1)  8                                * C0FF5  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C0FF6  library
        CON(3)  #02C                             * C0FF9  command
RKFSTEP:
        :: CK3&Dispatch                          * C0FFC
          # 511 ROMPTR 0C1 00A                   * C1006  list real real
        ;                                        * C101B

* ROMPTR 0AB 02D
* refs (1): C0007
        CON(1)  8                                * C1020  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1021  library
        CON(3)  #02D                             * C1024  command
RKFERR:
        :: CK2&Dispatch                          * C1027
          # 51 ROMPTR 0C1 005                    * C1031  list real
        ;                                        * C1046

* ROMPTR 0AB 02E
* refs (1): C0007
        CON(1)  8                                * C104B  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C104C  library
        CON(3)  #02E                             * C104F  command
RRK:
        :: CK3&Dispatch                          * C1052
          # 511 ROMPTR 0C1 01D                   * C105C  list real real
          # 551 ROMPTR 0C1 01D                   * C1071  list list real
        ;                                        * C1086

* ROMPTR 0AB 02F
* refs (1): C0007
        CON(1)  8                                * C108B  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C108C  library
        CON(3)  #02F                             * C108F  command
RRKSTEP:
        :: CK4&Dispatch                          * C1092
          # 5111 ROMPTR 0C1 018                  * C109C  list real real real
        ;                                        * C10B1

* ROMPTR 0AB 030
* refs (1): C0007
        CON(1)  8                                * C10B6  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C10B7  library
        CON(3)  #030                             * C10BA  command
RSBERR:
        :: CK2&Dispatch                          * C10BD
          # 51 ROMPTR 0C1 013                    * C10C7  list real
        ;                                        * C10DC

* ROMPTR 0AB 031
* refs (1): C0007
        CON(1)  8                                * C10E1  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C10E2  library
        CON(3)  #031                             * C10E5  command
COND:
        :: CK1&Dispatch                          * C10E8
          BINT4 ROMPTR 0C2 04D                   * C10F2  array
        ;                                        * C1102

* ROMPTR 0AB 032 TRACE
* refs (1): C0007
        CON(1)  8                                * C1107  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1108  library
        CON(3)  #032                             * C110B  command
TRACE_C110E:
        :: CK1&Dispatch                          * C110E
          BINT4 ROMPTR 0C2 04C                   * C1118  array
        ;                                        * C1128

* ROMPTR 0AB 033
* refs (1): C0007
        CON(1)  8                                * C112D  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C112E  library
        CON(3)  #033                             * C1131  command
SRAD:
        :: CK1&Dispatch                          * C1134
          BINT4 ROMPTR 0C2 000                   * C113E  array
        ;                                        * C114E

* ROMPTR 0AB 034
* refs (1): C0007
        CON(1)  8                                * C1153  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1154  library
        CON(3)  #034                             * C1157  command
SNRM:
        :: CK1&Dispatch                          * C115A
          BINT4 ROMPTR 0C2 034                   * C1164  array
        ;                                        * C1174

* ROMPTR 0AB 035
* refs (1): C0007
        CON(1)  8                                * C1179  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C117A  library
        CON(3)  #035                             * C117D  command
RANK:
        :: CK1&Dispatch                          * C1180
          BINT4 ROMPTR 0C2 036                   * C118A  array
        ;                                        * C119A

* ROMPTR 0AB 036
* refs (1): C0007
        CON(1)  8                                * C119F  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C11A0  library
        CON(3)  #036                             * C11A3  command
LSQ:
        :: CK2&Dispatch                          * C11A6
          # 44 ROMPTR 0C2 022                    * C11B0  array array
        ;                                        * C11C5

* ROMPTR 0AB 037
* refs (1): C0007
        CON(1)  8                                * C11CA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C11CB  library
        CON(3)  #037                             * C11CE  command
EGV:
        :: CK1&Dispatch                          * C11D1
          BINT4 ROMPTR 0C2 004                   * C11DB  array
        ;                                        * C11EB

* ROMPTR 0AB 038
* refs (1): C0007
        CON(1)  8                                * C11F0  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C11F1  library
        CON(3)  #038                             * C11F4  command
EGVL:
        :: CK1&Dispatch                          * C11F7
          BINT4 ROMPTR 0C2 002                   * C1201  array
        ;                                        * C1211

* ROMPTR 0AB 039
* refs (1): C0007
        CON(1)  8                                * C1216  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1217  library
        CON(3)  #039                             * C121A  command
SVD:
        :: CK1&Dispatch                          * C121D
          BINT4 ROMPTR 0C2 038                   * C1227  array
        ;                                        * C1237

* ROMPTR 0AB 03A
* refs (1): C0007
        CON(1)  8                                * C123C  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C123D  library
        CON(3)  #03A                             * C1240  command
SVL:
        :: CK1&Dispatch                          * C1243
          BINT4 ROMPTR 0C2 037                   * C124D  array
        ;                                        * C125D

* ROMPTR 0AB 03B
* refs (1): C0007
        CON(1)  8                                * C1262  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1263  library
        CON(3)  #03B                             * C1266  command
LU:
        :: CK1&Dispatch                          * C1269
          BINT4 ROMPTR 0C2 050                   * C1273  array
        ;                                        * C1283

* ROMPTR 0AB 03C
* refs (1): C0007
        CON(1)  8                                * C1288  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1289  library
        CON(3)  #03C                             * C128C  command
QR:
        :: CK1&Dispatch                          * C128F
          BINT4 ROMPTR 0C2 023                   * C1299  array
        ;                                        * C12A9

* ROMPTR 0AB 03D
* refs (1): C0007
        CON(1)  8                                * C12AE  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C12AF  library
        CON(3)  #03D                             * C12B2  command
LQ:
        :: CK1&Dispatch                          * C12B5
          BINT4 ROMPTR 0C2 024                   * C12BF  array
        ;                                        * C12CF

* ROMPTR 0AB 03E
* refs (1): C0007
        CON(1)  8                                * C12D4  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C12D5  library
        CON(3)  #03E                             * C12D8  command
SCHUR:
        :: CK1&Dispatch                          * C12DB
          BINT4 ROMPTR 0C2 005                   * C12E5  array
        ;                                        * C12F5

* ROMPTR 0AB 03F
* refs (1): C0007
        CON(1)  8                                * C12FA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C12FB  library
        CON(3)  #03F                             * C12FE  command
RREF:
        :: CK1&Dispatch                          * C1301
          BINT4 ROMPTR 0C2 05B                   * C130B  array
        ;                                        * C131B

* ROMPTR 0AB 040
* refs (1): C0007
        CON(1)  8                                * C1320  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1321  library
        CON(3)  #040                             * C1324  command
RANM:
        :: CK1&Dispatch                          * C1327
          BINT4 ROMPTR 0C3 000                   * C1331  array
          BINT5 ROMPTR 0AB 051                   * C1341  list
        ;                                        * C1351

* ROMPTR 0AB 041
* refs (1): C0007
        CON(1)  8                                * C1356  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1357  library
        CON(3)  #041                             * C135A  command
→ROW:
        :: CK1&Dispatch                          * C135D
          BINT4 ROMPTR 0C3 012                   * C1367  array
        ;                                        * C1377

* ROMPTR 0AB 042
* refs (1): C0007
        CON(1)  8                                * C137C  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C137D  library
        CON(3)  #042                             * C1380  command
ROW→:
        :: CKN ROMPTR 0C3 015 ;                  * C1383

* ROMPTR 0AB 043
* refs (1): C0007
        CON(1)  8                                * C139D  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C139E  library
        CON(3)  #043                             * C13A1  command
→COL:
        :: CK1&Dispatch                          * C13A4
          BINT4 ROMPTR 0C3 014                   * C13AE  array
        ;                                        * C13BE

* ROMPTR 0AB 044
* refs (1): C0007
        CON(1)  8                                * C13C3  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C13C4  library
        CON(3)  #044                             * C13C7  command
COL→:
        :: CKN ROMPTR 0C3 016 ;                  * C13CA

* ROMPTR 0AB 045
* refs (1): C0007
        CON(1)  8                                * C13E4  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C13E5  library
        CON(3)  #045                             * C13E8  command
→DIAG:
        :: CK1&Dispatch                          * C13EB
          BINT4 ROMPTR 0C3 017                   * C13F5  array
        ;                                        * C1405

* ROMPTR 0AB 046
* refs (1): C0007
        CON(1)  8                                * C140A  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C140B  library
        CON(3)  #046                             * C140E  command
DIAG→:
        :: CK2&Dispatch                          * C1411
          BINT69 ROMPTR 0AB 04F                  * C141B  array list
          BINT65 ROMPTR 0AB 050                  * C142B  array real
        ;                                        * C143B

* ROMPTR 0AB 047
* refs (1): C0007
        CON(1)  8                                * C1440  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1441  library
        CON(3)  #047                             * C1444  command
ROW-:
        :: CK2&Dispatch                          * C1447
          # 41 ROMPTR 0C3 007                    * C1451  array real
        ;                                        * C1466

* ROMPTR 0AB 048
* refs (1): C0007
        CON(1)  8                                * C146B  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C146C  library
        CON(3)  #048                             * C146F  command
ROW+:
        :: CK3&Dispatch                          * C1472
          # 441 ROMPTR 0C3 00A                   * C147C  array array real
          # 411 ROMPTR 0C3 00F                   * C1491  array real real
          # 421 ROMPTR 0C3 010                   * C14A6  array complex real
        ;                                        * C14BB

* ROMPTR 0AB 049
* refs (1): C0007
        CON(1)  8                                * C14C0  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C14C1  library
        CON(3)  #049                             * C14C4  command
COL-:
        :: CK2&Dispatch                          * C14C7
          # 41 ROMPTR 0C3 009                    * C14D1  array real
        ;                                        * C14E6

* ROMPTR 0AB 04A
* refs (1): C0007
        CON(1)  8                                * C14EB  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C14EC  library
        CON(3)  #04A                             * C14EF  command
COL+:
        :: CK3&Dispatch                          * C14F2
          # 441 ROMPTR 0C3 00D                   * C14FC  array array real
          # 411 ROMPTR 0C3 00F                   * C1511  array real real
          # 421 ROMPTR 0C3 010                   * C1526  array complex real
        ;                                        * C153B

* ROMPTR 0AB 04B
* refs (1): C0007
        CON(1)  8                                * C1540  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1541  library
        CON(3)  #04B                             * C1544  command
RSWP:
        :: CK3&Dispatch                          * C1547
          # 411 ROMPTR 0C3 002                   * C1551  array real real
        ;                                        * C1566

* ROMPTR 0AB 04C
* refs (1): C0007
        CON(1)  8                                * C156B  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C156C  library
        CON(3)  #04C                             * C156F  command
CSWP:
        :: CK3&Dispatch                          * C1572
          # 411 ROMPTR 0C3 004                   * C157C  array real real
        ;                                        * C1591

* ROMPTR 0AB 04D
* refs (1): C0007
        CON(1)  8                                * C1596  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1597  library
        CON(3)  #04D                             * C159A  command
RCI:
        :: CK3&Dispatch                          * C159D
          # 411 ROMPTR 0C3 005                   * C15A7  array real real
          # 421 ROMPTR 0C3 005                   * C15BC  array complex real
        ;                                        * C15D1

* ROMPTR 0AB 04E
* refs (1): C0007
        CON(1)  8                                * C15D6  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C15D7  library
        CON(3)  #04E                             * C15DA  command
RCIJ:
        :: CK4&Dispatch                          * C15DD
          # 4111 ROMPTR 0C3 006                  * C15E7  array real real real
          # 4211 ROMPTR 0C3 006                  * C15FC  array complex real real
        ;                                        * C1611

* ROMPTR 0AB 04F
* refs (1): C0007
DIAG→~1:
        :: OBJ_1DFDF COERCE{}2 ROMPTR 0C3 018 ;  * C1616

* ROMPTR 0AB 050
* refs (1): C0007
DIAG→~2:
        :: COERCE DUP#0<> ?SKIP SETSIZEERR       * C1635
          DUP TWO{}N ROMPTR 0C3 018 ;            * C164E

* ROMPTR 0AB 051
* refs (1): C0007
RANM~1:
        :: %0_2A2B4 %0_2A2B4 {}>%sBIND 1GETLAM ABND CK1NOLASTWD COERCE{}2 * C1668
          %0_2A2B4 MAKEARRY ROMPTR 0C3 000 ;     * C1690

* ROMPTR 0AB 052
* refs (1): C0007
        CON(1)  8                                * C16AA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C16AB  library
        CON(3)  #052                             * C16AE  command
PROOT:
        :: CK1&Dispatch                          * C16B1
          BINT4 ROMPTR 0C0 001                   * C16BB  array
        ;                                        * C16CB

* ROMPTR 0AB 053
* refs (1): C0007
        CON(1)  8                                * C16D0  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C16D1  library
        CON(3)  #053                             * C16D4  command
PCOEF:
        :: CK1&Dispatch                          * C16D7
          BINT4 ROMPTR 0C4 009                   * C16E1  array
        ;                                        * C16F1

* ROMPTR 0AB 054
* refs (1): C0007
        CON(1)  8                                * C16F6  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C16F7  library
        CON(3)  #054                             * C16FA  command
PEVAL:
        :: CK2&Dispatch                          * C16FD
          # 41 ROMPTR 0C4 00E                    * C1707  array real
          # 42 ROMPTR 0C4 00E                    * C171C  array complex
        ;                                        * C1731

* ROMPTR 0AB 055
* refs (1): C0007
        CON(1)  8                                * C1736  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1737  library
        CON(3)  #055                             * C173A  command
TVM:
        :: CK0 ROMPTR 0E6 001 ;                  * C173D

* ROMPTR 0AB 056
* refs (1): C0007
        CON(1)  8                                * C1757  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1758  library
        CON(3)  #056                             * C175B  command
TVMBEG:
        :: CK0 BINT14 SetSysFlag ;               * C175E

* ROMPTR 0AB 057
* refs (1): C0007
        CON(1)  8                                * C1777  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1778  library
        CON(3)  #057                             * C177B  command
TVMEND:
        :: CK0 BINT14 ClrSysFlag ;               * C177E

* slots of 0AB 057 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #01                              * C1797  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 058
* refs (1): C0007
        CON(1)  1                                * C1799  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C179A  library
        CON(3)  #058                             * C179D  command
TVMROOT:
        :: CK1&Dispatch                          * C17A0
          BINT6 ROMPTR 0E6 00C                   * C17AA  name
          BINT10 ROMPTR 0E6 00B                  * C17BA  name|local|algebraic
        ;                                        * C17CA

        HXS 014350                               * C17CF

        ROMPTR 0E7 011                           * C17DF  ~UTVUNS1Arg

* ROMPTR 0AB 059
* refs (1): C0007
        CON(1)  8                                * C17EA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C17EB  library
        CON(3)  #059                             * C17EE  command
AMORT:
        :: CK1&Dispatch                          * C17F1
          BINT1 ROMPTR 0E6 004                   * C17FB  real
        ;                                        * C180B

* ROMPTR 0AB 05A
* refs (1): C0007
        CON(1)  8                                * C1810  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1811  library
        CON(3)  #05A                             * C1814  command
INFORM:
        :: CK5&Dispatch                          * C1817
          # 35555 ROMPTR 0B1 01C                 * C1821  string list list list list
          # 35155                                * C1836  string list real list list
          :: ROT ONE{}N 3UNROLL ROMPTR 0B1 01C ; * C1840
        ;                                        * C1864

* ROMPTR 0AB 05B
* refs (1): C0007
        CON(1)  8                                * C1869  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C186A  library
        CON(3)  #05B                             * C186D  command
NOVAL:
        :: CK0 ' ROMPTR 0AB 05B ;                * C1870  ~xNOVAL

* ROMPTR 0AB 05C
* refs (1): C0007
        CON(1)  8                                * C188F  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1890  library
        CON(3)  #05C                             * C1893  command
CHOOSE:
        :: CK3&Dispatch                          * C1896
          # 351 ROMPTR 0B3 063                   * C18A0  string list real
        ;                                        * C18B5

* ROMPTR 0AB 05D
* refs (1): C0007
        CON(1)  8                                * C18BA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C18BB  library
        CON(3)  #05D                             * C18BE  command
MSGBOX:
        :: CK1&Dispatch                          * C18C1
          BINT3                                  * C18CB  string
          ROMPTR 0B1 00E                         * C18D0  Ck&DoMsgBox
        ;                                        * C18DB

* ROMPTR 0AB 05E
* refs (1): C0007
        CON(1)  8                                * C18E0  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C18E1  library
        CON(3)  #05E                             * C18E4  command
XSEND:
        :: CK1&Dispatch                          * C18E7
          BINT6 ROMPTR 0E8 040                   * C18F1  name
          BINT7 ROMPTR 0E8 040                   * C1901  local
        ;                                        * C1911

* ROMPTR 0AB 05F
* refs (1): C0007
        CON(1)  8                                * C1916  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1917  library
        CON(3)  #05F                             * C191A  command
XRECV:
        :: CK1&Dispatch                          * C191D
          BINT6 ROMPTR 0E8 041                   * C1927  name
          BINT7 ROMPTR 0E8 041                   * C1937  local
        ;                                        * C1947

* ROMPTR 0AB 060
* refs (1): C0007
        CON(1)  8                                * C194C  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C194D  library
        CON(3)  #060                             * C1950  command
HEAD:
        :: CK1&Dispatch                          * C1953
          BINT5                                  * C195D  list
          :: DUPLENCOMP #0=case doerr501         * C1962
            CARCOMP ;                            * C1976
          BINT3                                  * C1980  string
          :: DUPLEN$ #0=case doerr501            * C1985
            CAR$ CHR>$ ;                         * C1999
        ;                                        * C19A8

* ROMPTR 0AB 061
* refs (1): C0007
        CON(1)  8                                * C19AD  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C19AE  library
        CON(3)  #061                             * C19B1  command
TAIL:
        :: CK1&Dispatch                          * C19B4
          BINT5 CDRCOMP                          * C19BE  list
          BINT3 CDR$                             * C19C8  string
        ;                                        * C19D2

* ROMPTR 0AB 062
* refs (1): C0007
        CON(1)  8                                * C19D7  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C19D8  library
        CON(3)  #062                             * C19DB  command
SEQ:
        :: CK5&Dispatch                          * C19DE
          # 6000 ROMPTR 0E8 000                  * C19E8  name any any any
          # 7000 ROMPTR 0E8 000                  * C19FD  local any any any
        ;                                        * C1A12

* ROMPTR 0AB 063
* refs (1): C0007
        CON(1)  8                                * C1A17  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1A18  library
        CON(3)  #063                             * C1A1B  command
DOSUBS:
        :: CK2&Dispatch                          * C1A1E
          # 18 ROMPTR 0E8 002                    * C1A28  real program
          # 10F ROMPTR 0E8 002                   * C1A3D  real romptr
          # 58 ROMPTR 0E8 001                    * C1A52  list program
          # 50F                                  * C1A67  list romptr
          :: ROMPTR 0E8 007 ROMPTR 0E8 003 ;     * C1A71
          # 6                                    * C1A91  name
          :: ' ROMPTR 0AB 063 ROMPTR 0E8 005 ;   * C1A9B  DOSUBS
          # 7                                    * C1AC0  local
          :: ' ROMPTR 0AB 063 ROMPTR 0E8 005 ;   * C1ACA  DOSUBS
        ;                                        * C1AEF

* ROMPTR 0AB 064
* refs (1): C0007
        CON(1)  8                                * C1AF4  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1AF5  library
        CON(3)  #064                             * C1AF8  command
ΔLIST:
        :: CK1&Dispatch                          * C1AFB
          BINT5                                  * C1B05  list
          :: '                                   * C1B0A
            :: SWAP 'EvalNoCK:_sup x- ; BINT2 ROMPTR 0E8 003 ; * C1B14
        ;                                        * C1B42

* slots of 0AB 064 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C1B47  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 065
* refs (1): C0007
        CON(1)  0                                * C1B49  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1B4A  library
        CON(3)  #065                             * C1B4D  command
NSUB:
        :: CK0 ' LAM 'ntup XEQRCL UNCOERCE ;     * C1B50

* slots of 0AB 065 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C1B7F  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 066
* refs (1): C0007
        CON(1)  0                                * C1B81  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1B82  library
        CON(3)  #066                             * C1B85  command
ENDSUB:
        :: CK0 ' LAM 'mtup XEQRCL UNCOERCE ;     * C1B88

* ROMPTR 0AB 067
* refs (1): C0007
        CON(1)  8                                * C1BB7  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1BB8  library
        CON(3)  #067                             * C1BBB  command
STREAM:
        :: CK2&Dispatch                          * C1BBE
          # 50                                   * C1BC8  list any
          :: 1LAMBIND DUP CARCOMP SWAP CDRCOMP DUP LENCOMP DUPUNROT #0=case * C1BD2
            doerr501                             * C1C04
            >R ZERO_DO ?ATTNQUIT RSWAP 'R RSWAP 1GETLAM EVAL LOOP RDROP ABND ; * C1C09
        ;                                        * C1C45

* ROMPTR 0AB 068
* refs (1): C0007
        CON(1)  8                                * C1C4A  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1C4B  library
        CON(3)  #068                             * C1C4E  command
ΣLIST:
        :: CK1&Dispatch                          * C1C51
          BINT5                                  * C1C5B  list
          ::                                     * C1C60

* ROMPTR 0AB 069
* refs (1): C0007
ΠLIST~1:
            :: DUP CARCOMP SWAP CDRCOMP DUP LENCOMP DUPUNROT #0=case * C1C65
              doerr501                           * C1C92
            ;                                    * C1C97
            >R ZERO_DO ?ATTNQUIT RSWAP 'R RSWAP 'EvalNoCK:_sup x+ LOOP RDROP ; * C1C9C
        ;                                        * C1CD3

* ROMPTR 0AB 06A
* refs (1): C0007
        CON(1)  8                                * C1CD8  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1CD9  library
        CON(3)  #06A                             * C1CDC  command
ΠLIST:
        :: CK1&Dispatch                          * C1CDF
          BINT5                                  * C1CE9  list
          :: ROMPTR 0AB 069 >R ZERO_DO ?ATTNQUIT RSWAP 'R RSWAP * C1CEE
            'EvalNoCK:_sup x* LOOP RDROP ;       * C1D1C
        ;                                        * C1D35

* ROMPTR 0AB 06B DOLIST
* refs (1): C0007
        CON(1)  8                                * C1D3A  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1D3B  library
        CON(3)  #06B                             * C1D3E  command
DOLIST_C1D41:
        :: CK2&Dispatch                          * C1D41
          # 18 ROMPTR 0E8 00B                    * C1D4B  real program
          # 50F ROMPTR 0E8 00A                   * C1D60  list romptr
          # 10F ROMPTR 0E8 00B                   * C1D75  real romptr
          # 58 ROMPTR 0E8 008                    * C1D8A  list program
          # 6 ROMPTR 0E8 004                     * C1D9F  name
          # 7 ROMPTR 0E8 004                     * C1DB4  local
          BINT0 SETTYPEERR                       * C1DC9  any
        ;                                        * C1DD3

* slots of 0AB 06B (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C1DD8  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 06C
* refs (1): C0007
        CON(1)  1                                * C1DDA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1DDB  library
        CON(3)  #06C                             * C1DDE  command
ADD:
        :: CK2&Dispatch                          * C1DE1
          BINT85 ROMPTR 0E8 015                  * C1DEB  list list
          BINT80 ROMPTR 0E8 015                  * C1DFB  list any
          BINT5 ROMPTR 0E8 015                   * C1E0B  list
          BINT13                                 * C1E1B  tagged
          :: STRIPTAGS 'EvalNoCK:_sup ROMPTR 0AB 06C ; * C1E20  ADD
          BINT0                                  * C1E3F  any
          :: 'EvalNoCK:_sup x+ ;                 * C1E44
        ;                                        * C1E58

        HXS 70107                                * C1E5D

* ROMPTR 0AB 06D
* refs (1): C0007
        CON(1)  8                                * C1E6C  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1E6D  library
        CON(3)  #06D                             * C1E70  command
REVLIST:
        :: CK1&Dispatch                          * C1E73
          BINT5                                  * C1E7D  list
          :: ROMPTR 0E8 01C reversym ;           * C1E82
        ;                                        * C1E9C

* ROMPTR 0AB 06E
* refs (1): C0007
        CON(1)  8                                * C1EA1  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1EA2  library
        CON(3)  #06E                             * C1EA5  command
SORT:
        :: CK1&Dispatch                          * C1EA8
          BINT5 ROMPTR 0E8 016                   * C1EB2  list
        ;                                        * C1EC2

* ROMPTR 0AB 06F
* refs (2): C0007 C0007
        CON(1)  8                                * C1EC7  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1EC8  library
        CON(3)  #06F                             * C1ECB  command
ROMP_0AB_06F:
        :: CK0 ROMPTR 0E4 012 DROP' ROMPTR 0E4 00C InitMenu ; * C1ECE  ~MESRclEqn

* ROMPTR 0AB 070
* refs (1): C0007
        CON(1)  8                                * C1EFD  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1EFE  library
        CON(3)  #070                             * C1F01  command
MINIT:
        :: CK0 ROMPTR 0E4 04F ROMPTR 0E4 042 ;   * C1F04

* ROMPTR 0AB 071
* refs (1): C0007
        CON(1)  8                                * C1F29  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1F2A  library
        CON(3)  #071                             * C1F2D  command
MITM:
        :: CK2&Dispatch                          * C1F30
          BINT53                                 * C1F3A  string list
          :: ROMPTR 0E4 04F ROMPTR 0E4 043 ;     * C1F3F
        ;                                        * C1F5F

* ROMPTR 0AB 072
* refs (1): C0007
        CON(1)  8                                * C1F64  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1F65  library
        CON(3)  #072                             * C1F68  command
MUSER:
        :: CK1&Dispatch                          * C1F6B
          BINT6 ROMPTR 0E4 044                   * C1F75  name
          BINT5 ROMPTR 0E4 046                   * C1F85  list
          BINT3 ROMPTR 0E4 04A                   * C1F95  string
        ;                                        * C1FA5

* ROMPTR 0AB 073
* refs (1): C0007
        CON(1)  8                                * C1FAA  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1FAB  library
        CON(3)  #073                             * C1FAE  command
MCALC:
        :: CK1&Dispatch                          * C1FB1
          BINT6 ROMPTR 0E4 045                   * C1FBB  name
          BINT5 ROMPTR 0E4 047                   * C1FCB  list
          BINT3 ROMPTR 0E4 04B                   * C1FDB  string
        ;                                        * C1FEB

* ROMPTR 0AB 074
* refs (1): C0007
        CON(1)  8                                * C1FF0  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C1FF1  library
        CON(3)  #074                             * C1FF4  command
MROOT:
        :: CK1&Dispatch                          * C1FF7
          BINT6 ROMPTR 0E4 04D                   * C2001  name
          BINT3 ROMPTR 0E4 04E                   * C2011  string
        ;                                        * C2021

* ROMPTR 0AB 075
* refs (1): C0007
        CON(1)  8                                * C2026  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C2027  library
        CON(3)  #075                             * C202A  command
MINEHUNT:
        :: CK0 ROMPTR 0E7 033 ;                  * C202D

* slots of 0AB 075 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C2047  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 076
* refs (1): C0007
        CON(1)  0                                * C2049  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C204A  library
        CON(3)  #076                             * C204D  command
ZFACTOR:
        :: CK2&Dispatch                          * C2050
          BINT17 ROMPTR 0E7 001                  * C205A  real real
          BINT26 ROMPTR 0E7 015                  * C206A  real name|local|algebraic
          SYMREAL ROMPTR 0E7 016                 * C207A  name|local|algebraic real
          SYMSYM ROMPTR 0E7 017                  * C208A  name|local|algebraic name|local|algebraic
          2EXT ROMPTR 0E7 000                    * C209A  unit unit
          BINT30 ROMPTR 0E7 000                  * C20AA  real unit
          EXTREAL ROMPTR 0E7 000                 * C20BA  unit real
          EXTSYM ROMPTR 0E7 015                  * C20CA  unit name|local|algebraic
          SYMEXT ROMPTR 0E7 016                  * C20DA  name|local|algebraic unit
        ;                                        * C20EA

* slots of 0AB 076 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C20EF  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 077
* refs (1): C0007
        CON(1)  0                                * C20F1  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C20F2  library
        CON(3)  #077                             * C20F5  command
FANNING:
        :: CK2&Dispatch                          * C20F8
          BINT17 ROMPTR 0E7 004                  * C2102  real real
          BINT26 ROMPTR 0E7 018                  * C2112  real name|local|algebraic
          SYMREAL ROMPTR 0E7 019                 * C2122  name|local|algebraic real
          SYMSYM ROMPTR 0E7 01A                  * C2132  name|local|algebraic name|local|algebraic
          2EXT ROMPTR 0E7 003                    * C2142  unit unit
          BINT30 ROMPTR 0E7 003                  * C2152  real unit
          EXTREAL ROMPTR 0E7 003                 * C2162  unit real
          EXTSYM ROMPTR 0E7 018                  * C2172  unit name|local|algebraic
          SYMEXT ROMPTR 0E7 019                  * C2182  name|local|algebraic unit
        ;                                        * C2192

* slots of 0AB 077 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C2197  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 078
* refs (1): C0007
        CON(1)  0                                * C2199  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C219A  library
        CON(3)  #078                             * C219D  command
DARCY:
        :: CK2&Dispatch                          * C21A0
          BINT17 ROMPTR 0E7 009                  * C21AA  real real
          BINT26 ROMPTR 0E7 01B                  * C21BA  real name|local|algebraic
          SYMREAL ROMPTR 0E7 01C                 * C21CA  name|local|algebraic real
          SYMSYM ROMPTR 0E7 01D                  * C21DA  name|local|algebraic name|local|algebraic
          2EXT ROMPTR 0E7 008                    * C21EA  unit unit
          BINT30 ROMPTR 0E7 008                  * C21FA  real unit
          EXTREAL ROMPTR 0E7 008                 * C220A  unit real
          EXTSYM ROMPTR 0E7 01B                  * C221A  unit name|local|algebraic
          SYMEXT ROMPTR 0E7 01C                  * C222A  name|local|algebraic unit
        ;                                        * C223A

* slots of 0AB 078 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C223F  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 079
* refs (1): C0007
        CON(1)  0                                * C2241  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C2242  library
        CON(3)  #079                             * C2245  command
F0λ:
        :: CK2&Dispatch                          * C2248
          BINT17 ROMPTR 0E7 00B                  * C2252  real real
          BINT26 ROMPTR 0E7 01E                  * C2262  real name|local|algebraic
          SYMREAL ROMPTR 0E7 01F                 * C2272  name|local|algebraic real
          SYMSYM ROMPTR 0E7 020                  * C2282  name|local|algebraic name|local|algebraic
          2EXT ROMPTR 0E7 00A                    * C2292  unit unit
          BINT30 ROMPTR 0E7 00A                  * C22A2  real unit
          EXTREAL ROMPTR 0E7 00A                 * C22B2  unit real
          EXTSYM ROMPTR 0E7 01E                  * C22C2  unit name|local|algebraic
          SYMEXT ROMPTR 0E7 01F                  * C22D2  name|local|algebraic unit
        ;                                        * C22E2

* slots of 0AB 079 (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C22E7  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 07A
* refs (1): C0007
        CON(1)  0                                * C22E9  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C22EA  library
        CON(3)  #07A                             * C22ED  command
SIDENS:
        :: CK1&Dispatch                          * C22F0
          BINT1 ROMPTR 0E7 00C                   * C22FA  real
          BINT10 ROMPTR 0E7 027                  * C230A  name|local|algebraic
          BINT14 ROMPTR 0E7 00D                  * C231A  unit
        ;                                        * C232A

* slots of 0AB 07A (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C232F  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 07B
* refs (1): C0007
        CON(1)  0                                * C2331  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C2332  library
        CON(3)  #07B                             * C2335  command
TDELTA:
        :: CK2&Dispatch                          * C2338
          2EXT ROMPTR 0E7 00E                    * C2342  unit unit
          EXTSYM ROMPTR 0E7 021                  * C2352  unit name|local|algebraic
          SYMEXT ROMPTR 0E7 022                  * C2362  name|local|algebraic unit
          SYMSYM ROMPTR 0E7 023                  * C2372  name|local|algebraic name|local|algebraic
          BINT26 ROMPTR 0E7 021                  * C2382  real name|local|algebraic
          SYMREAL ROMPTR 0E7 022                 * C2392  name|local|algebraic real
          BINT17 %-                              * C23A2  real real
          BINT30 ROMPTR 0E7 010                  * C23AC  real unit
          EXTREAL ROMPTR 0E7 010                 * C23BC  unit real
        ;                                        * C23CC

* slots of 0AB 07B (derivative, inverse, ...: used by the symbolic code)
        CON(2)  #00                              * C23D1  end of the slots: property byte (meaning not yet known)

* ROMPTR 0AB 07C
* refs (1): C0007
        CON(1)  0                                * C23D3  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C23D4  library
        CON(3)  #07C                             * C23D7  command
TINC:
        :: CK2&Dispatch                          * C23DA
          2EXT ROMPTR 0E7 00F                    * C23E4  unit unit
          EXTSYM ROMPTR 0E7 024                  * C23F4  unit name|local|algebraic
          SYMSYM ROMPTR 0E7 026                  * C2404  name|local|algebraic name|local|algebraic
          BINT26 ROMPTR 0E7 024                  * C2414  real name|local|algebraic
          SYMREAL ROMPTR 0E7 025                 * C2424  name|local|algebraic real
          SYMEXT ROMPTR 0E7 025                  * C2434  name|local|algebraic unit
          BINT17 %+                              * C2444  real real
          BINT30 ROMPTR 0E7 010                  * C244E  real unit
          EXTREAL ROMPTR 0E7 010                 * C245E  unit real
        ;                                        * C246E
        NIBHEX  BA0D70                           * C2473  «Ð.

* ROMPTR 0AB 07D
* refs (1): C0007
gmol:
        UNIT %1 $ "mol" umEND ;                  * C2479
        NIBHEX  BA0E70                           * C249D  «à.

* ROMPTR 0AB 07E
* refs (1): C0007
lbmol:
        UNIT % 4.5359237E2 $ "gmol" umEND ;      * C24A3
        NIBHEX  BA0F70                           * C24D9  «ð.

* ROMPTR 0AB 07F
* refs (1): C0007
rpm:
        UNIT %1 tok1 $ "min" um/ umEND ;         * C24DF
        NIBHEX  BA0080                           * C250D  «..

* ROMPTR 0AB 080
* refs (1): C0007
dB:
        % 1E0                                    * C2513

* ROMPTR 0AB 081
* refs (1): C0007
        CON(1)  8                                * C2528  command header: flags (meaning not yet known)
        CON(3)  #0AB                             * C2529  library
        CON(3)  #081                             * C252C  command
PINIT:
        :: CK0 ROMPTR 0EA 070 ;                  * C252F

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
        REL(5)  ANIMATE~1                        * C2FBB  01B 
        REL(5)  LININ                            * C2FC0  01C LININ
        REL(5)  LININ~1                          * C2FC5  01D 
        REL(5)  LIBEVAL                          * C2FCA  01E LIBEVAL
        REL(5)  LIBEVAL~1                        * C2FCF  01F 
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
        REL(5)  DIAG→~1                          * C30BF  04F 
        REL(5)  DIAG→~2                          * C30C4  050 
        REL(5)  RANM~1                           * C30C9  051 
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
        REL(5)  ΠLIST~1                          * C3141  069 
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
