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
        REL(5)  nINTGSIN~1                       * 8208C  000 
        REL(5)  nINTGTAN~2                       * 82091  001 
        REL(5)  nINTGCOS~1                       * 82096  002 
        REL(5)  nINTGSIN~2                       * 8209B  003 
        REL(5)  nINTGTAN~1                       * 820A0  004 
        REL(5)  nINTGASIN~1                      * 820A5  005 
        REL(5)  nINTGACOS~1                      * 820AA  006 
        REL(5)  nINTGATAN~1                      * 820AF  007 
        REL(5)  nINTGSINH~1                      * 820B4  008 
        REL(5)  nINTGTANH~2                      * 820B9  009 
        REL(5)  nINTGCOSH~2                      * 820BE  00A 
        REL(5)  nINTGCOSH~1                      * 820C3  00B 
        REL(5)  ROMP_0F0_00C                     * 820C8  00C 
        REL(5)  nINTGTANH~1                      * 820CD  00D 
        REL(5)  nINTGEXPM~1                      * 820D2  00E 
        REL(5)  nINTGALOG~1                      * 820D7  00F 
        REL(5)  nINTGLN~1                        * 820DC  010 
        REL(5)  nINTGLOG~1                       * 820E1  011 
        REL(5)  nINTGINV~1                       * 820E6  012 
        REL(5)  ROMP_0F0_013                     * 820EB  013 
        REL(5)  nINTGSQ~1                        * 820F0  014 
        REL(5)  nINTGSQRT~1                      * 820F5  015 
        REL(5)  ROMP_0F0_016                     * 820FA  016 
        REL(5)  ROMP_0F0_017                     * 820FF  017 
        REL(5)  nINTGSIGN~1                      * 82104  018 
        REL(5)  ROMP_0F0_019                     * 82109  019 
        REL(5)  ROMP_0F0_01A                     * 8210E  01A 
        REL(5)  ROMP_0F0_01B                     * 82113  01B 
        REL(5)  ROMP_0F0_01C                     * 82118  01C 
        REL(5)  ROMP_0F0_01D                     * 8211D  01D 
        REL(5)  ROMP_0F0_01E                     * 82122  01E 
        REL(5)  ~drppargtop&;COLA;meta+          * 82127  01F 
        REL(5)  ROMP_0F0_020                     * 8212C  020 
        REL(5)  ~drppargtop&;COLA;meta*          * 82131  021 
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
        REL(5)  ~SWAPDROP#1-;metaneglft          * 82195  035 
        REL(5)  ~SWAPDROP#1-;metaneglft          * 8219A  036 
        REL(5)  ~SWAPDROP#1-;COLA;metainvlft     * 8219F  037 
        REL(5)  ROMP_0F0_039                     * 821A4  038 
        REL(5)  ROMP_0F0_039                     * 821A9  039 
        REL(5)  ~[f(X,Y)]=>[INV(X)/Y]!;addt:;xINV * 821AE  03A 
        REL(5)  ~[f(X,Y)]=>[INV(X)*Y]!;addt:;xINV * 821B3  03B 
        REL(5)  ROMP_0F0_03D                     * 821B8  03C 
        REL(5)  ROMP_0F0_03D                     * 821BD  03D 
        REL(5)  ~metainvlft;addtNEG              * 821C2  03E 
        REL(5)  ~metaneglft;addtNEG              * 821C7  03F 
        REL(5)  ~metaneglft;addtNEG              * 821CC  040 
        REL(5)  ~[f(X,Y)]=>[-X-Y]!;addtNEG       * 821D1  041 
        REL(5)  ~[f(X,Y)]=>[-X+Y]!;addtNEG       * 821D6  042 
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
        REL(5)  ~SWAPDROP#1-;metainv;addt*_2     * 8220D  04D 
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
        REL(5)  {RULES\COLCT}~1                  * 822DA  076 
        REL(5)  nWHEREFCNAPP~1                   * 822DF  077 
        REL(5)  nWHEREDER~1                      * 822E4  078 
        REL(5)  nWHEREIFTE~1                     * 822E9  079 
        REL(5)  nWHEREWHERE~1                    * 822EE  07A 
        REL(5)  SPLITWHERE~1                     * 822F3  07B 
        REL(5)  nWHEREINTG~1                     * 822F8  07C 
        REL(5)  nWHERESUM~1                      * 822FD  07D 
        REL(5)  sto(_,to)~1                      * 82302  07E 
        REL(5)  sto(_,to)~2                      * 82307  07F 
        REL(5)  sto(bk,r)~1                      * 8230C  080 
        REL(5)  ROMP_0F0_081                     * 82311  081 
        REL(5)  ROMP_0F0_082                     * 82316  082 
        REL(5)  ROMP_0F0_083                     * 8231B  083 
        REL(5)  restore(nm,s)~1                  * 82320  084 
        REL(5)  XEQIOBACKUP~1                    * 82325  085 
        REL(5)  free(li,r)~1                     * 8232A  086 
        REL(5)  libs~1                           * 8232F  087 
        REL(5)  ROMP_0F0_088                     * 82334  088 
        REL(5)  ROMP_0F0_089                     * 82339  089 
        REL(5)  ROMP_0F0_08A                     * 8233E  08A 
        REL(5)  ROMP_0F0_08B                     * 82343  08B 
        REL(5)  ROMP_0F0_08C                     * 82348  08C 
        REL(5)  ROMP_0F0_08D                     * 8234D  08D 
        REL(5)  ROMP_0F0_08E                     * 82352  08E 
        REL(5)  ROMP_0F0_08F                     * 82357  08F 
        REL(5)  libs~2                           * 8235C  090 
        REL(5)  ROMP_0F0_091                     * 82361  091 
        REL(5)  ROMP_0F0_092                     * 82366  092 
        REL(5)  ROMP_0F0_093                     * 8236B  093 
        REL(5)  ROMP_0F0_094                     * 82370  094 
        REL(5)  ROMP_0F0_095                     * 82375  095 
        REL(5)  nCOLCTQUOTE~1                    * 8237A  096 
        REL(5)  ROMP_0F0_097                     * 8237F  097 
        REL(5)  D/D*~1                           * 82384  098 
        REL(5)  D/D+~1                           * 82389  099 
        REL(5)  D/D-~1                           * 8238E  09A 
        REL(5)  D/D/~1                           * 82393  09B 
        REL(5)  D/D=~1                           * 82398  09C 
        REL(5)  D/D=~1                           * 8239D  09D 
        REL(5)  D/DABS~1                         * 823A2  09E 
        REL(5)  D/DACOS~1                        * 823A7  09F 
        REL(5)  D/DACOSH~1                       * 823AC  0A0 
        REL(5)  D/DALOG~1                        * 823B1  0A1 
        REL(5)  D/DARG~1                         * 823B6  0A2 
        REL(5)  D/DASIN~1                        * 823BB  0A3 
        REL(5)  D/DASINH~1                       * 823C0  0A4 
        REL(5)  D/DATAN~1                        * 823C5  0A5 
        REL(5)  D/DATANH~1                       * 823CA  0A6 
        REL(5)  D/DCOS~1                         * 823CF  0A7 
        REL(5)  D/DCOSH~1                        * 823D4  0A8 
        REL(5)  D/DEXP~1                         * 823D9  0A9 
        REL(5)  D/DINV~1                         * 823DE  0AA 
        REL(5)  D/DLN~1                          * 823E3  0AB 
        REL(5)  D/DLNP1~1                        * 823E8  0AC 
        REL(5)  D/DLOG~1                         * 823ED  0AD 
        REL(5)  D/DIFTE~1                        * 823F2  0AE 
        REL(5)  D/DSIN~1                         * 823F7  0AF 
        REL(5)  D/DSINH~1                        * 823FC  0B0 
        REL(5)  D/DSQ~1                          * 82401  0B1 
        REL(5)  D/DSQRT~1                        * 82406  0B2 
        REL(5)  D/DTAN~1                         * 8240B  0B3 
        REL(5)  D/DTANH~1                        * 82410  0B4 
        REL(5)  D/D^~1                           * 82415  0B5 
        REL(5)  D/D^X~1                          * 8241A  0B6 
        REL(5)  D/D^Y~1                          * 8241F  0B7 
        REL(5)  D/DDER~1                         * 82424  0B8 
        REL(5)  D/DWHERE~1                       * 82429  0B9 
        REL(5)  D/DINTEGRAL~1                    * 8242E  0BA 
        REL(5)  D/DSUM~1                         * 82433  0BB 
        REL(5)  D/DAPPLY~1                       * 82438  0BC 
        REL(5)  MANMENU+-~1                      * 8243D  0BD 
        REL(5)  MANMENU*/~1                      * 82442  0BE 
        REL(5)  MANMENU^~1                       * 82447  0BF 
        REL(5)  MANMENUEXP~1                     * 8244C  0C0 
        REL(5)  MANMENULN~1                      * 82451  0C1 
        REL(5)  MANMENUCSIV~1                    * 82456  0C2 
        REL(5)  MANMENUEQ~1                      * 8245B  0C3 
        REL(5)  MANMENUCX~1                      * 82460  0C4 
        REL(5)  MANMENUTRG~1                     * 82465  0C5 
        REL(5)  MANMENUATG~1                     * 8246A  0C6 
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
nINTGSIN~1:
        :: DROP                                  * 824BF
          { IntgPatVars                          * 824C9
            {                                    * 824D3
              SYMBOL Π&1 xSIN ; NULL{}           * 824D8
              :: OBJ_5B3D9 Π&1                   * 824F1
                SYMBOL Π&1 xCOS xNEG ; ;         * 82500
              NULL{} }                           * 8251E
            {                                    * 82528
              SYMBOL Π&1 xSIN Π&1 xTAN x* xINV ; NULL{} * 8252D

* ROMPTR 0F0 001
* refs (1): 82007
nINTGTAN~2:
              :: OBJ_5B3D9 Π&1                   * 8255A
                SYMBOL Π&1 xSIN xINV xNEG ; ;    * 82569
              NULL{} }                           * 8258C
            {                                    * 82596
              SYMBOL Π&1 xSIN %2 x^ xINV ; NULL{} * 8259B
              :: OBJ_5B3D9 Π&1                   * 825C3
                SYMBOL Π&1 xTAN xINV xNEG ; ;    * 825D2
              NULL{} }                           * 825F5
            {                                    * 825FF
              SYMBOL Π&1 xSIN Π&1 xCOS x* xINV ; NULL{} ROMPTR 0F0 003 * 82604
              NULL{} }                           * 8263C
          }                                      * 82646
          OBJ_5B34D ;                            * 8264B

* ROMPTR 0F0 002
* refs (1): 82007
nINTGCOS~1:
        :: DROP                                  * 82655
          { IntgPatVars                          * 8265F
            {                                    * 82669
              SYMBOL Π&1 xCOS ; NULL{}           * 8266E
              :: OBJ_5B3D9 Π&1                   * 82687
                SYMBOL Π&1 xSIN ; ;              * 82696
              NULL{} }                           * 826AF
            {                                    * 826B9
              SYMBOL Π&1 xCOS Π&1 xSIN x* xINV ; NULL{} * 826BE

* ROMPTR 0F0 003
* refs (1): 82007
nINTGSIN~2:
              :: OBJ_5B3D9 Π&1                   * 826EB
                SYMBOL Π&1 xTAN xLN ; ;          * 826FA
              NULL{} }                           * 82718
          }                                      * 82722
          OBJ_5B34D ;                            * 82727

* ROMPTR 0F0 004
* refs (1): 82007
nINTGTAN~1:
        :: DROP                                  * 82731
          { IntgPatVars                          * 8273B
            {                                    * 82745
              SYMBOL Π&1 xTAN %2 x^ ; NULL{}     * 8274A
              :: OBJ_5B3D9 Π&1                   * 8276D
                SYMBOL Π&1 xTAN Π&1 x- ; ;       * 8277C
              NULL{} }                           * 8279F
            {                                    * 827A9
              SYMBOL Π&1 xTAN ; NULL{}           * 827AE
              :: OBJ_5B3D9 Π&1                   * 827C7
                SYMBOL Π&1 xCOS xLN xNEG ; ;     * 827D6
              NULL{} }                           * 827F9
            {                                    * 82803
              SYMBOL Π&1 xTAN Π&1 xSIN x* xINV ; NULL{} ROMPTR 0F0 001 * 82808
              NULL{} }                           * 82840
            {                                    * 8284A
              SYMBOL Π&1 xTAN Π&1 xCOS xINV x* ; NULL{} * 8284F
              :: OBJ_5B3D9 Π&1                   * 8287C
                SYMBOL Π&1 xCOS xINV ; ;         * 8288B
              NULL{} }                           * 828A9
            {                                    * 828B3
              SYMBOL Π&1 xTAN xINV ; NULL{}      * 828B8
              :: OBJ_5B3D9 Π&1                   * 828D6
                SYMBOL Π&1 xSIN xLN ; ;          * 828E5
              NULL{} }                           * 82903
          }                                      * 8290D
          OBJ_5B34D ;                            * 82912

* ROMPTR 0F0 005
* refs (1): 82007
nINTGASIN~1:
        :: OBJ_5B32F                             * 8291C
          { IntgPatVars                          * 82926
            {                                    * 82930
              SYMBOL Π&1 xASIN ; NULL{}          * 82935
              :: OBJ_5B433 Π&1                   * 8294E
                SYMBOL Π&1 Π&1 xASIN x* %1 Π&1 %2 x^ x- xSQRT x+ ; ; * 8295D
              NULL{} }                           * 829A3
          }                                      * 829AD
          OBJ_5B34D ;                            * 829B2

* ROMPTR 0F0 006
* refs (1): 82007
nINTGACOS~1:
        :: OBJ_5B32F                             * 829BC
          { IntgPatVars                          * 829C6
            {                                    * 829D0
              SYMBOL Π&1 xACOS ; NULL{}          * 829D5
              :: OBJ_5B433 Π&1                   * 829EE
                SYMBOL Π&1 Π&1 xACOS x* %1 Π&1 %2 x^ x- xSQRT x- ; ; * 829FD
              NULL{} }                           * 82A43
          }                                      * 82A4D
          OBJ_5B34D ;                            * 82A52

* ROMPTR 0F0 007
* refs (1): 82007
nINTGATAN~1:
        :: OBJ_5B32F                             * 82A5C
          { IntgPatVars                          * 82A66
            {                                    * 82A70
              SYMBOL Π&1 xATAN ; NULL{}          * 82A75
              :: OBJ_5B433 Π&1                   * 82A8E
                SYMBOL Π&1 Π&1 xATAN x* %1 Π&1 %2 x^ x+ xLN %2 x/ x- ; ; * 82A9D
              NULL{} }                           * 82AED
          }                                      * 82AF7
          OBJ_5B34D ;                            * 82AFC

* ROMPTR 0F0 008
* refs (1): 82007
nINTGSINH~1:
        :: DROP                                  * 82B06
          { IntgPatVars                          * 82B10
            {                                    * 82B1A
              SYMBOL Π&1 xSINH ; NULL{}          * 82B1F
              :: OBJ_5B375 Π&1                   * 82B38
                SYMBOL Π&1 xCOSH ; ;             * 82B47
              NULL{} }                           * 82B60
            {                                    * 82B6A
              SYMBOL Π&1 xSINH Π&1 xTANH x* xINV ; NULL{} * 82B6F

* ROMPTR 0F0 009
* refs (1): 82007
nINTGTANH~2:
              :: OBJ_5B375 Π&1                   * 82B9C
                SYMBOL Π&1 xSINH xINV xNEG ; ;   * 82BAB
              NULL{} }                           * 82BCE
            {                                    * 82BD8
              SYMBOL Π&1 xSINH %2 x^ xINV ; NULL{} * 82BDD
              :: OBJ_5B375 Π&1                   * 82C05
                SYMBOL Π&1 xTANH xINV xNEG ; ;   * 82C14
              NULL{} }                           * 82C37
            {                                    * 82C41
              SYMBOL Π&1 xSINH Π&1 xCOSH x* xINV ; NULL{} * 82C46

* ROMPTR 0F0 00A
* refs (1): 82007
nINTGCOSH~2:
              :: OBJ_5B375 Π&1                   * 82C73
                SYMBOL Π&1 xTANH xLN ; ;         * 82C82
              NULL{} }                           * 82CA0
          }                                      * 82CAA
          OBJ_5B34D ;                            * 82CAF

* ROMPTR 0F0 00B
* refs (1): 82007
nINTGCOSH~1:
        :: DROP                                  * 82CB9
          { IntgPatVars                          * 82CC3
            {                                    * 82CCD
              SYMBOL Π&1 xCOSH ; NULL{}          * 82CD2
              :: OBJ_5B375 Π&1                   * 82CEB
                SYMBOL Π&1 xSINH ; ;             * 82CFA
              NULL{} }                           * 82D13
            {                                    * 82D1D
              SYMBOL Π&1 xCOSH %2 x^ xINV ; NULL{} * 82D22

* ROMPTR 0F0 00C
* refs (1): 82007
ROMP_0F0_00C:
              :: OBJ_5B375 Π&1                   * 82D4A
                SYMBOL Π&1 xTANH ; ;             * 82D59
              NULL{} }                           * 82D72
            {                                    * 82D7C
              SYMBOL Π&1 xCOSH %-2 x^ ; NULL{} ROMPTR 0F0 00C NULL{} } * 82D81
            {                                    * 82DB9
              SYMBOL Π&1 xCOSH Π&1 xSINH x* xINV ; NULL{} ROMPTR 0F0 00A * 82DBE
              NULL{} }                           * 82DF6
          }                                      * 82E00
          OBJ_5B34D ;                            * 82E05

* ROMPTR 0F0 00D
* refs (1): 82007
nINTGTANH~1:
        :: DROP                                  * 82E0F
          { IntgPatVars                          * 82E19
            {                                    * 82E23
              SYMBOL Π&1 xTANH ; NULL{}          * 82E28
              :: OBJ_5B375 Π&1                   * 82E41
                SYMBOL Π&1 xCOSH xLN ; ;         * 82E50
              NULL{} }                           * 82E6E
            {                                    * 82E78
              SYMBOL Π&1 xTANH Π&1 xSINH x* xINV ; NULL{} ROMPTR 0F0 009 * 82E7D
              NULL{} }                           * 82EB5
            {                                    * 82EBF
              SYMBOL Π&1 xTANH Π&1 xCOSH xINV x* ; NULL{} * 82EC4
              :: OBJ_5B375 Π&1                   * 82EF1
                SYMBOL Π&1 xCOSH xINV ; ;        * 82F00
              NULL{} }                           * 82F1E
            {                                    * 82F28
              SYMBOL Π&1 xTANH xINV ; NULL{}     * 82F2D
              :: OBJ_5B375 Π&1                   * 82F4B
                SYMBOL Π&1 xSINH xLN ; ;         * 82F5A
              NULL{} }                           * 82F78
          }                                      * 82F82
          OBJ_5B34D ;                            * 82F87

* ROMPTR 0F0 00E
* refs (1): 82007
nINTGEXPM~1:
        :: OBJ_5B32F                             * 82F91
          { IntgPatVars                          * 82F9B
            {                                    * 82FA5
              SYMBOL Π&1 xEXPM ; NULL{}          * 82FAA
              :: OBJ_5B375 Π&1                   * 82FC3
                SYMBOL Π&1 xEXP Π&1 x- ; ;       * 82FD2
              NULL{} }                           * 82FF5
          }                                      * 82FFF
          OBJ_5B34D ;                            * 83004

* ROMPTR 0F0 00F
* refs (1): 82007
nINTGALOG~1:
        :: OBJ_5B32F                             * 8300E
          { IntgPatVars                          * 83018
            {                                    * 83022
              SYMBOL Π&1 xALOG ; NULL{}          * 83027
              :: OBJ_5B375 Π&1                   * 83040
                SYMBOL % 4.34294481904E-1 Π&1 xALOG x* ; ; * 8304F
              NULL{} }                           * 83082
          }                                      * 8308C
          OBJ_5B34D ;                            * 83091

* ROMPTR 0F0 010
* refs (1): 82007
nINTGLN~1:
        :: OBJ_5B32F                             * 8309B
          { IntgPatVars                          * 830A5
            {                                    * 830AF
              SYMBOL Π&1 xLN ; NULL{}            * 830B4
              :: OBJ_5B375 Π&1                   * 830CD
                SYMBOL Π&1 Π&1 xLN x* Π&1 x- ; ; * 830DC
              NULL{} }                           * 83109
          }                                      * 83113
          OBJ_5B34D ;                            * 83118

* ROMPTR 0F0 011
* refs (1): 82007
nINTGLOG~1:
        :: OBJ_5B32F                             * 83122
          { IntgPatVars                          * 8312C
            {                                    * 83136
              SYMBOL Π&1 xLOG ; NULL{}           * 8313B
              :: OBJ_5B375 Π&1                   * 83154
                SYMBOL % 4.34294481904E-1 Π&1 Π&1 xLN x* Π&1 x- x* ; ; * 83163
              NULL{} }                           * 831AA
          }                                      * 831B4
          OBJ_5B34D ;                            * 831B9

* ROMPTR 0F0 012
* refs (1): 82007
nINTGINV~1:
        :: OBJ_5B32F                             * 831C3
          { IntgPatVars                          * 831CD
            {                                    * 831D7
              SYMBOL Π&1 xINV ; NULL{}           * 831DC
              :: OBJ_5B375 Π&1                   * 831F5
                SYMBOL Π&1 xLN ; ;               * 83204
              NULL{} }                           * 8321D
            {                                    * 83227
              SYMBOL Π&1 %2 x^ xINV ; NULL{}     * 8322C
              :: OBJ_5B375 Π&1                   * 8324F
                SYMBOL Π&1 xINV xNEG ; ;         * 8325E
              NULL{} }                           * 8327C
            {                                    * 83286
              SYMBOL Π&1 xSQ xINV ; NULL{}       * 8328B
              :: OBJ_5B375 Π&1                   * 832A9
                SYMBOL Π&1 xINV xNEG ; ;         * 832B8
              NULL{} }                           * 832D6
            {                                    * 832E0
              SYMBOL %1 Π&1 %2 x^ x+ xINV ; NULL{} * 832E5

* ROMPTR 0F0 013
* refs (1): 82007
ROMP_0F0_013:
              :: OBJ_5B375 Π&1                   * 83312
                SYMBOL Π&1 xATAN ; ;             * 83321
              NULL{} }                           * 8333A
            {                                    * 83344
              SYMBOL Π&1 %2 x^ %1 x+ xINV ; NULL{} ROMPTR 0F0 013 NULL{} } * 83349
            {                                    * 8338B
              SYMBOL %1 Π&1 %2 x^ x- xINV ; NULL{} * 83390
              :: OBJ_5B375 Π&1                   * 833BD
                SYMBOL Π&1 xATANH ; ;            * 833CC
              NULL{} }                           * 833E5
          }                                      * 833EF
          OBJ_5B34D ;                            * 833F4

* ROMPTR 0F0 014
* refs (1): 82007
nINTGSQ~1:
        :: DROP                                  * 833FE
          { IntgPatVars                          * 83408
            {                                    * 83412
              SYMBOL Π&1 xSQ ; NULL{}            * 83417
              :: OBJ_5B375 Π&1                   * 83430
                SYMBOL Π&1 %3 x^ %3 x/ ; ;       * 8343F
              NULL{} }                           * 83467
          }                                      * 83471
          OBJ_5B34D ;                            * 83476

* ROMPTR 0F0 015
* refs (1): 82007
nINTGSQRT~1:
        :: DROP                                  * 83480
          { IntgPatVars                          * 8348A
            {                                    * 83494
              SYMBOL %1 Π&1 %2 x^ x- xSQRT xINV ; NULL{} * 83499
              :: OBJ_5B375 Π&1                   * 834CB
                SYMBOL Π&1 xASIN ; ;             * 834DA
              NULL{} }                           * 834F3
            {                                    * 834FD
              SYMBOL %1 Π&1 %2 x^ x+ xSQRT xINV ; NULL{} * 83502

* ROMPTR 0F0 016
* refs (1): 82007
ROMP_0F0_016:
              :: OBJ_5B375 Π&1                   * 83534
                SYMBOL Π&1 xASINH ; ;            * 83543
              NULL{} }                           * 8355C
            {                                    * 83566
              SYMBOL Π&1 %2 x^ %1 x+ xSQRT xINV ; NULL{} ROMPTR 0F0 016 * 8356B
              NULL{} }                           * 835A8
            {                                    * 835B2
              SYMBOL %1 Π&1 x+ xSQRT xINV %-1 Π&1 x+ xSQRT xINV x* ; NULL{} * 835B7

* ROMPTR 0F0 017
* refs (1): 82007
ROMP_0F0_017:
              :: OBJ_5B375 Π&1                   * 835FD
                SYMBOL Π&1 xACOSH ; ;            * 8360C
              NULL{} }                           * 83625
            {                                    * 8362F
              SYMBOL Π&1 %1 x- xSQRT Π&1 %1 x+ xSQRT x* xINV ; NULL{} * 83634
              ROMPTR 0F0 017 NULL{} }            * 83675
            {                                    * 8368A
              SYMBOL Π&1 xSQRT ; NULL{}          * 8368F
              :: OBJ_5B375 Π&1                   * 836A8
                SYMBOL %2 Π&1 %3 %2 x/ x^ x* %3 x/ ; ; * 836B7
              NULL{} }                           * 836F3
            {                                    * 836FD
              SYMBOL Π&1 xSQRT xINV ; NULL{}     * 83702
              :: OBJ_5B375 Π&1                   * 83720
                SYMBOL %2 Π&1 xSQRT x* ; ;       * 8372F
              NULL{} }                           * 83752
          }                                      * 8375C
          OBJ_5B34D ;                            * 83761

* ROMPTR 0F0 018
* refs (1): 82007
nINTGSIGN~1:
        :: OBJ_5B32F                             * 8376B
          { IntgPatVars                          * 83775
            {                                    * 8377F
              SYMBOL Π&1 xSIGN ; NULL{}          * 83784
              :: OBJ_5B375 Π&1                   * 8379D
                SYMBOL Π&1 xABS ; ;              * 837AC
              NULL{} }                           * 837C5
          }                                      * 837CF
          OBJ_5B34D ;                            * 837D4

* ROMPTR 0F0 019
* refs (1): 82007
ROMP_0F0_019:
        :: #1- DUP#1= dvarlsBIND tailpsh larg SWAPDROP#1- DUP#1+PICK ' * 837DE
          lam'dvar EQ 1GETABND ANDcase           * 8380B
          :: #1- get1 DROP over& psh NDROP TRUE ; * 8381F
          DUP#1+PICK DUP ~REQcase;lam'dvar;SKIP ID>LAM * 8384C
          BINT1 DOBIND pshzer >dvars #1- IMPLODE SWAPcompSWAP SYMDERSTEP * 83860
          EXPLODE 1GETABND DUP ~REQcase;lam'dvar;SKIP ID>LAM * 83888
          SWAP BINT1 DOBIND pshzer >dvars ABND top& pshtop& FALSE ; * 838A1

* ROMPTR 0F0 01A
* refs (1): 82007
ROMP_0F0_01A:
        :: rotswap pullpsh1& rotswap pshzerpsharg OBJ_5D339 M1st*case * 838D3
          :: SWAPDROP#1- metainv pshtop& meta* larg& ; * 838F6
          forceadd M1st+case                     * 83919
          :: SWAPDROP#1- metaneg pshtop& meta+ larg& ; * 83923
          metaneg psh %0_2A2B4 psh1& top& meta+ larg& ; * 83946

* ROMPTR 0F0 01B
* refs (1): 82007
ROMP_0F0_01B:
        :: rotswap pullpsh1& rotswap larg OBJ_5D429 M1st*case * 8396E
          :: plDRPpZparg meta/ psh& 4roll top& unrot larg& ; * 83991
          OBJ_5D1B2 M1st+case                    * 839BE
          :: plDRPpZparg meta- psh& 4roll top& unrot larg& ; * 839C8
          top& meta- rotswap %0_2A2B4 psh1& rotswap larg& ; * 839F5

* ROMPTR 0F0 01C
* refs (1): 82007
ROMP_0F0_01C:
        :: #1-SWAP pshm1 #1-SWAP DROP pshzerpsharg pshzerpsharg M1st/case * 83A1D
          ROMPTR 0F0 01D                         * 83A45
          metaROTDUP roll2top& meta* ROTUntop& ROTUntop& pshtop& meta/ ; * 83A50

* ROMPTR 0F0 01D
* refs (1): 82007
ROMP_0F0_01D:
        :: rotswap plDRPpZparg metaROTDUP roll2top& meta* psh metaROTDUP * 83A78
          ROTUntop& meta* over& overev& 'x* psh1&rev overev& top& meta/ ; * 83AA0

* ROMPTR 0F0 01E
* refs (1): 82007
ROMP_0F0_01E:
        :: #1-SWAP pshm1 pshzerpsharg SWAPDROP#1- larg dup over& overev& 'x* * 83AD2
          psh1&rev overev& top& meta/ ;          * 83B04

* ROMPTR 0F0 01F
* refs (1): 82007
~drppargtop&;COLA;meta+:
        :: drppargtop& COLA meta+                * 83B1D
        ;                                        * 83B31

* ROMPTR 0F0 020
* refs (1): 82007
ROMP_0F0_020:
        :: SWAPDROP#1- metaneg pshzerpsharg top& COLA meta+ * 83B36
        ;                                        * 83B59

* ROMPTR 0F0 021
* refs (1): 82007
~drppargtop&;COLA;meta*:
        :: drppargtop& COLA meta*                * 83B5E
        ;                                        * 83B72

* ROMPTR 0F0 022
* refs (1): 82007
ROMP_0F0_022:
        :: SWAPDROP#1- metainv pshzerpsharg top& COLA meta* * 83B77
        ;                                        * 83B9A

* ROMPTR 0F0 023
* refs (1): 82007
ROMP_0F0_023:
        :: OBJ_5CA0F drpmeta- OBJ_5C9F1 ;        * 83B9F

* ROMPTR 0F0 024
* refs (1): 82007
ROMP_0F0_024:
        :: OBJ_5CA0F drpmeta+ OBJ_5C9F1 ;        * 83BB8

* ROMPTR 0F0 025
* refs (1): 82007
ROMP_0F0_025:
        :: OBJ_5CA0F drpmeta/ OBJ_5C9F1 ;        * 83BD1

* ROMPTR 0F0 026
* refs (1): 82007
ROMP_0F0_026:
        :: OBJ_5CA0F drpmeta* OBJ_5C9F1 ;        * 83BEA

* ROMPTR 0F0 027
* refs (1): 82007
ROMP_0F0_027:
        :: OBJ_5CA0F PTR repl: x^ OBJ_5C9F1 ;    * 83C03

* ROMPTR 0F0 028
* refs (1): 82007
ROMP_0F0_028:
        :: drpmeta- COLA OBJ_5CA32               * 83C21
        ;                                        * 83C35

* ROMPTR 0F0 029
* refs (1): 82007
ROMP_0F0_029:
        :: drpmeta+ COLA OBJ_5CA32               * 83C3A
        ;                                        * 83C4E

* ROMPTR 0F0 02A
* refs (1): 82007
ROMP_0F0_02A:
        :: drpmeta/ COLA OBJ_5CA32               * 83C53
        ;                                        * 83C67

* ROMPTR 0F0 02C
* refs (2): 82007 82007
ROMP_0F0_02C:
        :: drpmeta* COLA OBJ_5CA32               * 83C6C
        ;                                        * 83C80

* ROMPTR 0F0 02E
* refs (2): 82007 82007
ROMP_0F0_02E:
        :: pargop metainv pshtop& drpmeta* OBJ_5CA50 metainv ; * 83C85

* ROMPTR 0F0 02F
* refs (1): 82007
ROMP_0F0_02F:
        :: OBJ_5CA50 COLA drpmeta*               * 83CAD
        ;                                        * 83CC1

* ROMPTR 0F0 030
* refs (1): 82007
ROMP_0F0_030:
        :: OBJ_5CA50 COLA drpmeta/               * 83CC6
        ;                                        * 83CDA

* ROMPTR 0F0 031
* refs (1): 82007
ROMP_0F0_031:
        :: OBJ_5CAA5 COLA drpmeta*               * 83CDF
        ;                                        * 83CF3

* ROMPTR 0F0 032
* refs (1): 82007
ROMP_0F0_032:
        :: OBJ_5CAA5 COLA drpmeta/               * 83CF8
        ;                                        * 83D0C

* ROMPTR 0F0 033
* refs (1): 82007
ROMP_0F0_033:
        :: OBJ_5CAA5 COLA drpmeta+               * 83D11
        ;                                        * 83D25

* ROMPTR 0F0 034
* refs (1): 82007
ROMP_0F0_034:
        :: OBJ_5CAA5 COLA drpmeta-               * 83D2A
        ;                                        * 83D3E

* ROMPTR 0F0 036
* refs (2): 82007 82007
~SWAPDROP#1-;metaneglft:
        :: SWAPDROP#1- metaneglft ;              * 83D43

* ROMPTR 0F0 037
* refs (1): 82007
~SWAPDROP#1-;COLA;metainvlft:
        :: SWAPDROP#1- COLA metainvlft           * 83D57
        ;                                        * 83D6B

* ROMPTR 0F0 039
* refs (2): 82007 82007
ROMP_0F0_039:
        :: SWAPDROP#1- #1-SWAP pshm1 metaneg COLA pshtop& * 83D70
        ;                                        * 83D93

* ROMPTR 0F0 03A
* refs (1): 82007
~[f(X,Y)]=>[INV(X)/Y]!;addt:;xINV:
        :: [f(X,Y)]=>[INV(X)/Y]! PTR addt: xINV ; * 83D98

* ROMPTR 0F0 03B
* refs (1): 82007
~[f(X,Y)]=>[INV(X)*Y]!;addt:;xINV:
        :: [f(X,Y)]=>[INV(X)*Y]! PTR addt: xINV ; * 83DB1

* ROMPTR 0F0 03D
* refs (2): 82007 82007
ROMP_0F0_03D:
        :: #1-SWAP pshm1 metaneg pshtop& PTR addt: xINV ; * 83DCA

* ROMPTR 0F0 03E
* refs (1): 82007
~metainvlft;addtNEG:
        :: metainvlft addtNEG ;                  * 83DF2

* ROMPTR 0F0 040
* refs (2): 82007 82007
~metaneglft;addtNEG:
        :: metaneglft addtNEG ;                  * 83E06

* ROMPTR 0F0 041
* refs (1): 82007
~[f(X,Y)]=>[-X-Y]!;addtNEG:
        :: [f(X,Y)]=>[-X-Y]! addtNEG ;           * 83E1A

* ROMPTR 0F0 042
* refs (1): 82007
~[f(X,Y)]=>[-X+Y]!;addtNEG:
        :: [f(X,Y)]=>[-X+Y]! addtNEG ;           * 83E2E

* ROMPTR 0F0 043
* refs (1): 82007
ROMP_0F0_043:
        :: OBJ_5CAE1 PTR repl: x^ ;              * 83E42

* ROMPTR 0F0 044
* refs (1): 82007
ROMP_0F0_044:
        :: OBJ_5CAE1 SWAPDROP#1- metainv PTR addt: x^ ; * 83E5B

* ROMPTR 0F0 045
* refs (1): 82007
ROMP_0F0_045:
        :: drpmeta* COLA OBJ_5CAE1               * 83E7E
        ;                                        * 83E92

* ROMPTR 0F0 046
* refs (1): 82007
ROMP_0F0_046:
        :: OBJ_5CAE1 COLA drpmeta*               * 83E97
        ;                                        * 83EAB

* ROMPTR 0F0 047
* refs (1): 82007
ROMP_0F0_047:
        :: PTR repl: x^ COLA OBJ_5CAE1           * 83EB0
        ;                                        * 83EC9

* ROMPTR 0F0 048
* refs (1): 82007
ROMP_0F0_048:
        :: SWAPDROP#1- metainv PTR addt: x^ COLA OBJ_5CAE1 * 83ECE
        ;                                        * 83EF1

* ROMPTR 0F0 04A
* refs (2): 82007 82007
ROMP_0F0_04A:
        :: dup OBJ_5FC65 OBJ_5CAFF ?SKIP         * 83EF6
          :: psh DoBadKey ;                      * 83F0F
          psh NDROP ;                            * 83F23

* ROMPTR 0F0 04B
* refs (1): 82007
ROMP_0F0_04B:
        :: M1st*case ROMPTR 0F0 04C              * 83F32
          M1st/case                              * 83F47
          :: ROMPTR 0F0 04D ROMPTR 0F0 04C ;     * 83F4C
          PTR addt2: %1 x* ROMPTR 0F0 04C ;      * 83F6C

* ROMPTR 0F0 04C
* refs (1): 82007
ROMP_0F0_04C:
        :: pargop M-1stcasechs                   * 83F8B
          :: pshtop& addtNEG ROTSWAP ;           * 83F9A
          pshtop& ;                              * 83FB3

* ROMPTR 0F0 04D
* refs (1): 82007
~SWAPDROP#1-;metainv;addt*_2:
        :: SWAPDROP#1- metainv addt* ;           * 83FBD

* ROMPTR 0F0 04E
* refs (1): 82007
ROMP_0F0_04E:
        :: drpmeta+ OBJ_5CAFF ?SEMI              * 83FD6
          drpmeta* DoBadKey ;                    * 83FEA

* ROMPTR 0F0 04F
* refs (1): 82007
ROMP_0F0_04F:
        :: drpmeta- OBJ_5CAFF ?SEMI              * 83FF9
          drpmeta/ DoBadKey ;                    * 8400D

* ROMPTR 0F0 050
* refs (1): 82007
ROMP_0F0_050:
        :: drpmeta+ OBJ_5CB7C DROP ;             * 8401C

* ROMPTR 0F0 051
* refs (1): 82007
ROMP_0F0_051:
        :: drpmeta- OBJ_5CB7C DROP ;             * 84035

* ROMPTR 0F0 052
* refs (1): 82007
ROMP_0F0_052:
        :: drpmeta* OBJ_5CB7C DROP ;             * 8404E

* ROMPTR 0F0 053
* refs (1): 82007
ROMP_0F0_053:
        :: drpmeta/ OBJ_5CB7C DROP ;             * 84067

* ROMPTR 0F0 054
* refs (1): 82007
ROMP_0F0_054:
        :: OBJ_5CB7C ?SEMI                       * 84080
          DoBadKey ;                             * 8408F

* ROMPTR 0F0 055
* refs (1): 82007
ROMP_0F0_055:
        :: plDRPpZparg forceadd OBJ_5D2CB 4roll OBJ_5D1B2 OBJ_5D302 4roll * 84099
          psh 5unroll over& pshtop& top& top& top& meta+ ; * 840C1

* ROMPTR 0F0 056
* refs (1): 82007
ROMP_0F0_056:
        :: plDRPpZparg OBJ_5D339 OBJ_5D542 4roll OBJ_5D429 OBJ_5D579 4roll * 840EE
          psh 5unroll over& pshtop& top& top& top& meta* ; * 84116

* ROMPTR 0F0 057
* refs (1): 82007
ROMP_0F0_057:
        :: OBJ_5D799 rotswap OBJ_5D721 x+ x- OBJ_5D7CC ; * 84143

* ROMPTR 0F0 058
* refs (1): 82007
ROMP_0F0_058:
        :: OBJ_5D7F4 rotswap OBJ_5D721 x* x/ OBJ_5D7CC ; * 8416B

* ROMPTR 0F0 059
* refs (1): 82007
ROMP_0F0_059:
        :: OBJ_5D831 x+ x- NOTcase OBJ_5DB33     * 84193
          AEQ1stcase x=                          * 841B1
          NOP #1-SWAP dvarlsBIND larg OBJ_5D8C7 x+ x- rot forceadd * 841BB
          :: M1st+case NOP                       * 841E8
            RDROP OBJ_5DA75 4roll top& unrot ;   * 841F7
          SWAPDROP#1- 4roll pshtop& pshzerpsharg 4unroll OBJ_5DA75 meta+ * 84215
          4roll top& unrot ;                     * 84238

* ROMPTR 0F0 05A
* refs (1): 82007
ROMP_0F0_05A:
        :: OBJ_5D831 x* x/ NOTcase OBJ_5DB33     * 8424C
          AEQ1stcase x=                          * 8426A
          NOP #1-SWAP dvarlsBIND larg OBJ_5D8C7 x* x/ rot OBJ_5D339 * 84274
          :: M1st*case NOP                       * 842A1
            RDROP OBJ_5DAD4 4roll top& unrot ;   * 842B0
          SWAPDROP#1- 4roll pshtop& pshzerpsharg 4unroll OBJ_5DAD4 meta* * 842CE
          4roll top& unrot ;                     * 842F1

* ROMPTR 0F0 05B
* refs (1): 82007
ROMP_0F0_05B:
        :: OBJ_5D84A x+ x- NOTcase OBJ_5DCBE     * 84305
          AEQ1stcase x=                          * 84323
          NOP #1-SWAP dvarlsBIND pshzerpsharg OBJ_5D999 x+ x- rot OBJ_5D1B2 * 8432D
          :: M1st+case NOP                       * 8435A
            RDROP OBJ_5DB56 ;                    * 84369
          pargop psh 1GETLAM ' x+ EQ ?SKIP drpmeta- * 84378
          BINT5 N+1roll top& 5unroll OBJ_5DB56 ; * 843A0

* ROMPTR 0F0 05C
* refs (1): 82007
ROMP_0F0_05C:
        :: OBJ_5D84A x* x/ NOTcase OBJ_5DCBE     * 843BE
          AEQ1stcase x=                          * 843DC
          NOP #1-SWAP dvarlsBIND pshzerpsharg OBJ_5D999 x* x/ rot OBJ_5D429 * 843E6
          :: M1st*case NOP                       * 84413
            RDROP OBJ_5DC0A ;                    * 84422
          pargop psh 1GETLAM ' x* EQ ?SKIP drpmeta/ * 84431
          BINT5 N+1roll top& 5unroll OBJ_5DC0A ; * 84459

* ROMPTR 0F0 05D
* refs (1): 82007
ROMP_0F0_05D:
        :: #1-SWAP dvarlsBIND larg 1GETABND ' x+ EQ ?SKIP [X]=>[NEG(X)]! * 84477
          OBJ_5D1B2 psh forceadd OBJ_5D2CB 4roll OBJ_5D302 over& psh over& * 844A9
          psh meta+ rot top& psh over& over& rot top& psh larg ; * 844D6

* ROMPTR 0F0 05E
* refs (1): 82007
ROMP_0F0_05E:
        :: #1-SWAP dvarlsBIND larg 1GETABND ' x* EQ ?SKIP [X]=>[INV(X)]! * 84512
          OBJ_5D429 psh OBJ_5D339 OBJ_5D542 4roll OBJ_5D579 over& psh over& * 84544
          psh meta* rot top& psh over& over& rot top& psh larg ; * 84571

* ROMPTR 0F0 061
* refs (3): 82007 82007 82007
ROMP_0F0_061:
        :: #1-SWAP dvarlsBIND #1-SWAP pshm1 larg 1GETLAM SWAP#1+ psh * 845AD
          1GETABND OVER #0= ITE DROP SWAP#1+     * 845DA
          pshtop& pshtop& ;                      * 845F8

* ROMPTR 0F0 062
* refs (1): 82007
ROMP_0F0_062:
        :: #2- ROTROT2DROP larg dup PTR addt: xRE meta* psh PTR addt: xIM * 84607
          meta* rot dup PTR addt: xRE psh PTR addt: xIM ; * 8463E

* ROMPTR 0F0 063
* refs (1): 82007
ROMP_0F0_063:
        :: SWAPDROP#1- Add180ã/*[_] Addi*[_] drpmeta/ dup PTR addt: xCOS psh * 8466B
          PTR addt: xSIN top& Addi*[_] meta+ ;   * 84698

* ROMPTR 0F0 064
* refs (1): 82007
ROMP_0F0_064:
        :: SWAPDROP#1- Addã180/*i[_] dup metaneg PTR 2psh1&rev: xEXP top& * 846B6
          { x- %2 xi x* x/ } INNERtop& ;         * 846DE

* ROMPTR 0F0 065
* refs (1): 82007
ROMP_0F0_065:
        :: SWAPDROP#1- Addã180/*i[_] dup metaneg PTR 2psh1&rev: xEXP top& * 8470B
          { x+ %2 x/ } INNERtop& ;               * 84733

* ROMPTR 0F0 066
* refs (1): 82007
ROMP_0F0_066:
        :: SWAPDROP#1- Addã180/*i[_]             * 84756
          { %2 x* xEXP %1 x- } INNERtop& dup drpmeta+ top& * 84765
          { xi x* x/ } INNERtop& ;               * 8479C

* ROMPTR 0F0 067
* refs (1): 82007
ROMP_0F0_067:
        :: SWAPDROP#1- dup                       * 847BF
          { xi xNEG %1 } INNERCOMP pshtop& {2,^,-,û,I} INNERtop& pshtop& * 847CE
          { x* x+ xLN x* } INNERtop& Add180ã/*[_] ; * 84800

* ROMPTR 0F0 068
* refs (1): 82007
ROMP_0F0_068:
        :: SWAPDROP#1- dup                       * 8482D
          { xPI %2 x/ xi %1 } INNERCOMP pshtop& {2,^,-,û,I} INNERtop& * 8483C
          pshtop&                                * 84873
          { x* x+ xLN x* x+ } INNERtop& Add180ã/*[_] ; * 84878

* ROMPTR 0F0 069
* refs (1): 82007
ROMP_0F0_069:
        :: SWAPDROP#1- dup                       * 848AA
          { xi xNEG %1 xi } INNERCOMP pshtop&    * 848B9
          { x* x+ %1 } INNERtop& pshtop&         * 848E1
          { %2 x^ x+ xSQRT x/ xLN x* } INNERtop& Add180ã/*[_] ; * 84904

* ROMPTR 0F0 06A
* refs (1): 82007
ROMP_0F0_06A:
        :: SWAPDROP#1- Add180ã/*[_]              * 84940
          { xi x* xSIN xi x* xNEG } INNERtop& ;  * 8494F

* ROMPTR 0F0 06B
* refs (1): 82007
ROMP_0F0_06B:
        :: SWAPDROP#1- Add180ã/*[_]              * 84981
          { xi x* xCOS } INNERtop& ;             * 84990

* ROMPTR 0F0 06C
* refs (1): 82007
ROMP_0F0_06C:
        :: SWAPDROP#1- Add180ã/*[_]              * 849B3
          { xi x* xTAN xi xNEG x* } INNERtop& ;  * 849C2

* ROMPTR 0F0 06D
* refs (1): 82007
ROMP_0F0_06D:
        :: SWAPDROP#1- dup %1 psh1&              * 849F4
          { %2 x^ x+ xSQRT } INNERCOMP pshtop& top& * 84A0D
          { x- xLN xNEG } INNERtop& ;            * 84A3A

* ROMPTR 0F0 06E
* refs (1): 82007
ROMP_0F0_06E:
        :: SWAPDROP#1- dup                       * 84A5D
          { xPI %2 x/ xi %1 } INNERCOMP pshtop& {2,^,-,û,I} INNERtop& * 84A6C
          pshtop&                                * 84AA3
          { x* x+ xLN x* x+ %2 x^ xNEG xSQRT } INNERtop& ; * 84AA8

* ROMPTR 0F0 06F
* refs (1): 82007
ROMP_0F0_06F:
        :: SWAPDROP#1- %1 pshm1 top& dup ' x- psh1&rev top& * 84AE9
          { %2 x^ x- xSQRT x/ xLN xNEG } INNERtop& ; * 84B1B

* ROMPTR 0F0 070
* refs (1): 82007
ROMP_0F0_070:
        :: SWAPDROP#1- #1-SWAP pshm1 pshzerpsharg dup PTR addt: xSIN unrot * 84B52
          PTR addt: xCOS psh dup PTR addt2: xSIN x* psh& PTR addt2: xCOS x* * 84B7F
          pshtop& top& pshtop& ;                 * 84BB6

* ROMPTR 0F0 071
* refs (1): 82007
ROMP_0F0_071:
        :: SWAPDROP#1- #1-SWAP pshm1 pshzerpsharg dup PTR addt: xCOS unrot * 84BCA
          PTR addt: xSIN psh dup PTR addt2: xSIN x* psh& PTR addt2: xCOS x* * 84BF7
          pshtop& top& psh DROP REQcasedrop x+   * 84C2E
          meta- DROP meta+ ;                     * 84C4C

* ROMPTR 0F0 072
* refs (1): 82007
ROMP_0F0_072:
        :: ROTSWAP pargop PTR addt: xTAN pshtop& dup %1 psh1&rev top& * 84C60
          PTR addt: x* ROTSWAP #1-SWAP           * 84C92
          :: REQcasedrop x+                      * 84CA6
            meta- DROP meta+ ;                   * 84CB5
          meta/ ;                                * 84CC9

* ROMPTR 0F0 073
* refs (1): 82007
ROMP_0F0_073:
        :: SWAPDROP#1- #1-SWAP pshm1 pshzerpsharg dup PTR addt: xSINH unrot * 84CD3
          PTR addt: xCOSH psh dup PTR addt2: xSINH x* psh& PTR addt2: xCOSH * 84D00
          x* pshtop& top& pshtop& ;              * 84D32

* ROMPTR 0F0 074
* refs (1): 82007
ROMP_0F0_074:
        :: SWAPDROP#1- #1-SWAP pshm1 pshzerpsharg dup PTR addt: xCOSH unrot * 84D4B
          PTR addt: xSINH psh dup PTR addt2: xSINH x* psh& PTR addt2: xCOSH * 84D78
          x* pshtop& top& pshtop& ;              * 84DAA

* ROMPTR 0F0 075
* refs (1): 82007
ROMP_0F0_075:
        :: ROTSWAP pargop PTR addt: xTANH pshtop& dup %1 psh1&rev top& * 84DC3
          PTR addt: x* ROTSWAP meta/ ;           * 84DF5

* ROMPTR 0F0 076
* refs (1): 82007
{RULES\COLCT}~1:
        :: OBJ_6AFF0 DUPTYPESYMB? NOTcase EXPLODE * 84E0E
          OBJ_6A95B DEPTH OBJ_677EA ' NULLLAM CACHE SYMCOLCT OBJ_6B28C * 84E27
          NOTcase INVDEFERR                      * 84E4F
          ' NULLLAM DUMP DROP ABND DEPTH #1- #<>case ARGNUMERR * 84E59
          OBJ_6AE6F EXPLODE ;                    * 84E86

* ROMPTR 0F0 077
* refs (1): 82007
nWHEREFCNAPP~1:
        :: 3PICK CARCOMP NOTROMPcase nWHEREFCNAPP~2 * 84E95
          DUPROMPTR@ ?SKIP SETROMPERR            * 84EAE
          SWAP OBJ_26F6C NOTcasedrop nWHEREFCNAPP~2 * 84EBD
          SWAP infarg? SWAPDROP ITE              * 84ED1
          :: 4ROLL DROPSWAP #1- ;                * 84EE5
          :: ROTDROP ROTDROPSWAP #2- ;           * 84EFE
          SWAP COLA_EVAL ;                       * 84F17

* ROMPTR 0F0 078
* refs (1): 82007
nWHEREDER~1:
        :: PTR addt: xDER psh #1+DUP top& PTR addt: xWHERE ::N COLA_EVAL ; * 84F26

* ROMPTR 0F0 079
* refs (1): 82007
nWHEREIFTE~1:
        :: psh dup unrot psh #1-SWAP symcomp psh1& psh DUP#1+ Cr xWHERE * 84F5D
          pshm1 metaROTDUP rot #1-SWAP symcomp psh1& psh DUP#1+ Cr xWHERE * 84F99
          BINT1 unrot symbn BINT1 psh #1+DUP top& PTR addt: xWHERE pshtop& * 84FCB
          pshtop& Cr xIFTE COLA COMPEVAL         * 84FFD
        ;                                        * 85016
