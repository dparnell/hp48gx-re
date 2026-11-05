* HP 48GX ROM revision R, #82007-#8501A: Library 0F0: integral pattern tables per function, and the bodies of the rewrite rules (RULES menu)
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: Rule->()Cx RuleD->/ RuleA->* Rule<-M Rule1/()^ Rule->()NEG Rule->()INV Rule-()* RuleTRG*TANH RuleTRG*TAN RuleTRG*SINH RuleTRG*SIN
* Follows on from the previous file (at #82007 in the original ROM).

* Library 0F0: Symbolic algebra support: integral tables, the rules of the RULES menu, derivative rules, ISOL inverses, WHERE, and the port forms of STO, RCL, EVAL, PURGE, FREE and LIBS
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
        REL(5)  LIB0F0.hash.L1                   * 82078  end of the names
LIB0F0.hash.L1:
        CON(5)  0                                * 8207D  command 000 has no name
        ENDLENGTH                                * 82082

LIB0F0.link:
        CON(5)  DOHSTR                           * 82082  link table of library 0F0
        LENGTH                                   * 82087  length, to #824BF
        REL(5)  nINTGSIN~1                       * 8208C  000 
        REL(5)  IntgRes-INVSIN                   * 82091  001 
        REL(5)  nINTGCOS~1                       * 82096  002 
        REL(5)  IntgResLNTAN                     * 8209B  003 
        REL(5)  nINTGTAN~1                       * 820A0  004 
        REL(5)  nINTGASIN~1                      * 820A5  005 
        REL(5)  nINTGACOS~1                      * 820AA  006 
        REL(5)  nINTGATAN~1                      * 820AF  007 
        REL(5)  nINTGSINH~1                      * 820B4  008 
        REL(5)  IntgRes-INVSINH                  * 820B9  009 
        REL(5)  IntgResLNTANH                    * 820BE  00A 
        REL(5)  nINTGCOSH~1                      * 820C3  00B 
        REL(5)  IntgResTANH                      * 820C8  00C 
        REL(5)  nINTGTANH~1                      * 820CD  00D 
        REL(5)  nINTGEXPM~1                      * 820D2  00E 
        REL(5)  nINTGALOG~1                      * 820D7  00F 
        REL(5)  nINTGLN~1                        * 820DC  010 
        REL(5)  nINTGLOG~1                       * 820E1  011 
        REL(5)  nINTGINV~1                       * 820E6  012 
        REL(5)  IntgResATAN                      * 820EB  013 
        REL(5)  nINTGSQ~1                        * 820F0  014 
        REL(5)  nINTGSQRT~1                      * 820F5  015 
        REL(5)  IntgResASINH                     * 820FA  016 
        REL(5)  IntgResACOSH                     * 820FF  017 
        REL(5)  nINTGSIGN~1                      * 82104  018 
        REL(5)  ROMP_0F0_019                     * 82109  019 
        REL(5)  RuleT->=                         * 8210E  01A 
        REL(5)  Rule<-T=                         * 82113  01B 
        REL(5)  RuleAF                           * 82118  01C 
        REL(5)  RuleAF2                          * 8211D  01D 
        REL(5)  RuleAFarg                        * 82122  01E 
        REL(5)  Rule<-->+                        * 82127  01F 
        REL(5)  Rule<-->-                        * 8212C  020 
        REL(5)  Rule<-->*                        * 82131  021 
        REL(5)  Rule<-->/                        * 82136  022 
        REL(5)  Rule<-A-+                        * 8213B  023 
        REL(5)  Rule<-A--                        * 82140  024 
        REL(5)  Rule<-A/*                        * 82145  025 
        REL(5)  Rule<-A//                        * 8214A  026 
        REL(5)  Rule<-A^*                        * 8214F  027 
        REL(5)  RuleA->+-                        * 82154  028 
        REL(5)  RuleA->--                        * 82159  029 
        REL(5)  RuleA->*/                        * 8215E  02A 
        REL(5)  RuleA->*                         * 82163  02B 
        REL(5)  RuleA->*                         * 82168  02C 
        REL(5)  RuleD->/                         * 8216D  02D 
        REL(5)  RuleD->/                         * 82172  02E 
        REL(5)  RuleD->^+                        * 82177  02F 
        REL(5)  RuleD->^-                        * 8217C  030 
        REL(5)  RuleD->EXP+                      * 82181  031 
        REL(5)  RuleD->EXP-                      * 82186  032 
        REL(5)  RuleD->LN*                       * 8218B  033 
        REL(5)  RuleD->LN/                       * 82190  034 
        REL(5)  Rule->()NEG                      * 82195  035 
        REL(5)  Rule->()NEG                      * 8219A  036 
        REL(5)  Rule->()LN                       * 8219F  037 
        REL(5)  Rule->()INV                      * 821A4  038 
        REL(5)  Rule->()INV                      * 821A9  039 
        REL(5)  Rule1/()*                        * 821AE  03A 
        REL(5)  Rule1/()/                        * 821B3  03B 
        REL(5)  Rule1/()^                        * 821B8  03C 
        REL(5)  Rule1/()^                        * 821BD  03D 
        REL(5)  Rule-()LN                        * 821C2  03E 
        REL(5)  Rule-()*                         * 821C7  03F 
        REL(5)  Rule-()*                         * 821CC  040 
        REL(5)  Rule-()+                         * 821D1  041 
        REL(5)  Rule-()-                         * 821D6  042 
        REL(5)  RuleE^*                          * 821DB  043 
        REL(5)  RuleE^/                          * 821E0  044 
        REL(5)  RuleE()                          * 821E5  045 
        REL(5)  RuleL*                           * 821EA  046 
        REL(5)  RuleL()*                         * 821EF  047 
        REL(5)  RuleL()/                         * 821F4  048 
        REL(5)  Rule<-M                          * 821F9  049 
        REL(5)  Rule<-M                          * 821FE  04A 
        REL(5)  RuleMTerm                        * 82203  04B 
        REL(5)  RuleMSign                        * 82208  04C 
        REL(5)  RuleMQuot                        * 8220D  04D 
        REL(5)  Rule<-M^*                        * 82212  04E 
        REL(5)  Rule<-M^/                        * 82217  04F 
        REL(5)  Rule<-MEXP*                      * 8221C  050 
        REL(5)  Rule<-MEXP/                      * 82221  051 
        REL(5)  Rule<-MLN+                       * 82226  052 
        REL(5)  Rule<-MLN-                       * 8222B  053 
        REL(5)  RuleM->                          * 82230  054 
        REL(5)  ROMP_0F0_055                     * 82235  055 
        REL(5)  ROMP_0F0_056                     * 8223A  056 
        REL(5)  Rule<-T+                         * 8223F  057 
        REL(5)  Rule<-T*                         * 82244  058 
        REL(5)  Rule(<-+                         * 82249  059 
        REL(5)  Rule(<-*                         * 8224E  05A 
        REL(5)  Rule->)+                         * 82253  05B 
        REL(5)  Rule->)*                         * 82258  05C 
        REL(5)  Rule(())+                        * 8225D  05D 
        REL(5)  Rule(())*                        * 82262  05E 
        REL(5)  Rule->()Cx                       * 82267  05F 
        REL(5)  Rule->()Cx                       * 8226C  060 
        REL(5)  Rule->()Cx                       * 82271  061 
        REL(5)  ROMP_0F0_062                     * 82276  062 
        REL(5)  Rule->TRG                        * 8227B  063 
        REL(5)  Rule->DEFSIN                     * 82280  064 
        REL(5)  Rule->DEFCOS                     * 82285  065 
        REL(5)  Rule->DEFTAN                     * 8228A  066 
        REL(5)  Rule->DEFASIN                    * 8228F  067 
        REL(5)  Rule->DEFACOS                    * 82294  068 
        REL(5)  Rule->DEFATAN                    * 82299  069 
        REL(5)  Rule->DEFSINH                    * 8229E  06A 
        REL(5)  Rule->DEFCOSH                    * 822A3  06B 
        REL(5)  Rule->DEFTANH                    * 822A8  06C 
        REL(5)  Rule->DEFASINH                   * 822AD  06D 
        REL(5)  Rule->DEFACOSH                   * 822B2  06E 
        REL(5)  Rule->DEFATANH                   * 822B7  06F 
        REL(5)  RuleTRG*SIN                      * 822BC  070 
        REL(5)  RuleTRG*COS                      * 822C1  071 
        REL(5)  RuleTRG*TAN                      * 822C6  072 
        REL(5)  RuleTRG*SINH                     * 822CB  073 
        REL(5)  RuleTRG*COSH                     * 822D0  074 
        REL(5)  RuleTRG*TANH                     * 822D5  075 
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
        REL(5)  PortTagParse                     * 82311  081 
        REL(5)  PortTagArg                       * 82316  082 
        REL(5)  PortLookupDone                   * 8231B  083 
        REL(5)  restore(nm,s)~1                  * 82320  084 
        REL(5)  XEQIOBACKUP~1                    * 82325  085 
        REL(5)  free(li,r)~1                     * 8232A  086 
        REL(5)  libs~1                           * 8232F  087 
        REL(5)  PortLookup                       * 82334  088 
        REL(5)  PortLookupName                   * 82339  089 
        REL(5)  PortLookupPath                   * 8233E  08A 
        REL(5)  PortLookupAny                    * 82343  08B 
        REL(5)  PortEval                         * 82348  08C 
        REL(5)  PortEvalAny                      * 8234D  08D 
        REL(5)  PortPurge                        * 82352  08E 
        REL(5)  PortPurgeAny                     * 82357  08F 
        REL(5)  libs~2                           * 8235C  090 
        REL(5)  PortRcl                          * 82361  091 
        REL(5)  SymbDER                          * 82366  092 
        REL(5)  SymbINTEGRAL                     * 8236B  093 
        REL(5)  SymbSUM                          * 82370  094 
        REL(5)  SymbIFTE                         * 82375  095 
        REL(5)  nCOLCTQUOTE~1                    * 8237A  096 
        REL(5)  SymbAPPLY                        * 8237F  097 
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
        REL(5)  Isol+                            * 8246F  0C7 
        REL(5)  Isol-                            * 82474  0C8 
        REL(5)  Isol-                            * 82479  0C9 
        REL(5)  Isol*                            * 8247E  0CA 
        REL(5)  Isol/                            * 82483  0CB 
        REL(5)  Isol^                            * 82488  0CC 
        REL(5)  Isol^Base                        * 8248D  0CD 
        REL(5)  IsolEXP                          * 82492  0CE 
        REL(5)  IsolSIN                          * 82497  0CF 
        REL(5)  IsolCOS                          * 8249C  0D0 
        REL(5)  IsolTAN                          * 824A1  0D1 
        REL(5)  IsolSINH                         * 824A6  0D2 
        REL(5)  IsolCOSH                         * 824AB  0D3 
        REL(5)  IsolTANH                         * 824B0  0D4 
        REL(5)  IsolALOG                         * 824B5  0D5 
        REL(5)  IsolEXPM                         * 824BA  0D6 
        ENDLENGTH                                * 824BF
        RPL

* ROMPTR 0F0 000
* refs (1): 82007
* meta -> : integrals that start with SIN, as {vars {pattern result guard}...}. The other nINTGxxx tables have the same layout, and each result is run with the linear-argument check. OBJ_5B34D walks the table
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
* -> : result -1/SIN(u), the integral of 1/(SIN(u)*TAN(u)). Shared by the SIN and TAN tables
IntgRes-INVSIN:
              :: OBJ_5B3D9 Π&1                   * 8255A
                SYMBOL Π&1 xSIN xINV xNEG ; ;    * 82569
              NULL{} }                           * 8258C
            {                                    * 82596
              SYMBOL Π&1 xSIN %2 x^ xINV ; NULL{} * 8259B
              :: OBJ_5B3D9 Π&1                   * 825C3
                SYMBOL Π&1 xTAN xINV xNEG ; ;    * 825D2
              NULL{} }                           * 825F5
            {                                    * 825FF
              SYMBOL Π&1 xSIN Π&1 xCOS x* xINV ; NULL{} XLIB IntgResLNTAN * 82604
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
* -> : result LN(TAN(u)), the integral of 1/(COS(u)*SIN(u)). Shared by the SIN and COS tables
IntgResLNTAN:
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
              SYMBOL Π&1 xTAN Π&1 xSIN x* xINV ; NULL{} XLIB IntgRes-INVSIN * 82808
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
              :: intgLinArg Π&1                  * 82B38
                SYMBOL Π&1 xCOSH ; ;             * 82B47
              NULL{} }                           * 82B60
            {                                    * 82B6A
              SYMBOL Π&1 xSINH Π&1 xTANH x* xINV ; NULL{} * 82B6F

* ROMPTR 0F0 009
* refs (1): 82007
* -> : result -1/SINH(u), the integral of 1/(SINH(u)*TANH(u)). Shared by the SINH and TANH tables
IntgRes-INVSINH:
              :: intgLinArg Π&1                  * 82B9C
                SYMBOL Π&1 xSINH xINV xNEG ; ;   * 82BAB
              NULL{} }                           * 82BCE
            {                                    * 82BD8
              SYMBOL Π&1 xSINH %2 x^ xINV ; NULL{} * 82BDD
              :: intgLinArg Π&1                  * 82C05
                SYMBOL Π&1 xTANH xINV xNEG ; ;   * 82C14
              NULL{} }                           * 82C37
            {                                    * 82C41
              SYMBOL Π&1 xSINH Π&1 xCOSH x* xINV ; NULL{} * 82C46

* ROMPTR 0F0 00A
* refs (1): 82007
* -> : result LN(TANH(u)), the integral of 1/(COSH(u)*SINH(u)). Shared by the SINH and COSH tables
IntgResLNTANH:
              :: intgLinArg Π&1                  * 82C73
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
              :: intgLinArg Π&1                  * 82CEB
                SYMBOL Π&1 xSINH ; ;             * 82CFA
              NULL{} }                           * 82D13
            {                                    * 82D1D
              SYMBOL Π&1 xCOSH %2 x^ xINV ; NULL{} * 82D22

* ROMPTR 0F0 00C
* refs (1): 82007
* -> : result TANH(u), the integral of 1/COSH(u)^2
IntgResTANH:
              :: intgLinArg Π&1                  * 82D4A
                SYMBOL Π&1 xTANH ; ;             * 82D59
              NULL{} }                           * 82D72
            {                                    * 82D7C
              SYMBOL Π&1 xCOSH %-2 x^ ; NULL{} XLIB IntgResTANH NULL{} } * 82D81
            {                                    * 82DB9
              SYMBOL Π&1 xCOSH Π&1 xSINH x* xINV ; NULL{} XLIB IntgResLNTANH * 82DBE
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
              :: intgLinArg Π&1                  * 82E41
                SYMBOL Π&1 xCOSH xLN ; ;         * 82E50
              NULL{} }                           * 82E6E
            {                                    * 82E78
              SYMBOL Π&1 xTANH Π&1 xSINH x* xINV ; NULL{} * 82E7D
              XLIB IntgRes-INVSINH NULL{} }      * 82EAA
            {                                    * 82EBF
              SYMBOL Π&1 xTANH Π&1 xCOSH xINV x* ; NULL{} * 82EC4
              :: intgLinArg Π&1                  * 82EF1
                SYMBOL Π&1 xCOSH xINV ; ;        * 82F00
              NULL{} }                           * 82F1E
            {                                    * 82F28
              SYMBOL Π&1 xTANH xINV ; NULL{}     * 82F2D
              :: intgLinArg Π&1                  * 82F4B
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
              :: intgLinArg Π&1                  * 82FC3
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
              :: intgLinArg Π&1                  * 83040
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
              :: intgLinArg Π&1                  * 830CD
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
              :: intgLinArg Π&1                  * 83154
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
              :: intgLinArg Π&1                  * 831F5
                SYMBOL Π&1 xLN ; ;               * 83204
              NULL{} }                           * 8321D
            {                                    * 83227
              SYMBOL Π&1 %2 x^ xINV ; NULL{}     * 8322C
              :: intgLinArg Π&1                  * 8324F
                SYMBOL Π&1 xINV xNEG ; ;         * 8325E
              NULL{} }                           * 8327C
            {                                    * 83286
              SYMBOL Π&1 xSQ xINV ; NULL{}       * 8328B
              :: intgLinArg Π&1                  * 832A9
                SYMBOL Π&1 xINV xNEG ; ;         * 832B8
              NULL{} }                           * 832D6
            {                                    * 832E0
              SYMBOL %1 Π&1 %2 x^ x+ xINV ; NULL{} * 832E5

* ROMPTR 0F0 013
* refs (1): 82007
* -> : result ATAN(u), the integral of 1/(1+u^2) and of 1/(u^2+1)
IntgResATAN:
              :: intgLinArg Π&1                  * 83312
                SYMBOL Π&1 xATAN ; ;             * 83321
              NULL{} }                           * 8333A
            {                                    * 83344
              SYMBOL Π&1 %2 x^ %1 x+ xINV ; NULL{} XLIB IntgResATAN NULL{} } * 83349
            {                                    * 8338B
              SYMBOL %1 Π&1 %2 x^ x- xINV ; NULL{} * 83390
              :: intgLinArg Π&1                  * 833BD
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
              :: intgLinArg Π&1                  * 83430
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
              :: intgLinArg Π&1                  * 834CB
                SYMBOL Π&1 xASIN ; ;             * 834DA
              NULL{} }                           * 834F3
            {                                    * 834FD
              SYMBOL %1 Π&1 %2 x^ x+ xSQRT xINV ; NULL{} * 83502

* ROMPTR 0F0 016
* refs (1): 82007
* -> : result ASINH(u), the integral of 1/SQRT(1+u^2) and of 1/SQRT(u^2+1)
IntgResASINH:
              :: intgLinArg Π&1                  * 83534
                SYMBOL Π&1 xASINH ; ;            * 83543
              NULL{} }                           * 8355C
            {                                    * 83566
              SYMBOL Π&1 %2 x^ %1 x+ xSQRT xINV ; NULL{} XLIB IntgResASINH * 8356B
              NULL{} }                           * 835A8
            {                                    * 835B2
              SYMBOL %1 Π&1 x+ xSQRT xINV %-1 Π&1 x+ xSQRT xINV x* ; NULL{} * 835B7

* ROMPTR 0F0 017
* refs (1): 82007
* -> : result ACOSH(u), the integral of 1/(SQRT(u-1)*SQRT(u+1)) in both spellings
IntgResACOSH:
              :: intgLinArg Π&1                  * 835FD
                SYMBOL Π&1 xACOSH ; ;            * 8360C
              NULL{} }                           * 83625
            {                                    * 8362F
              SYMBOL Π&1 %1 x- xSQRT Π&1 %1 x+ xSQRT x* xINV ; NULL{} * 83634
              XLIB IntgResACOSH NULL{} }         * 83675
            {                                    * 8368A
              SYMBOL Π&1 xSQRT ; NULL{}          * 8368F
              :: intgLinArg Π&1                  * 836A8
                SYMBOL %2 Π&1 %3 %2 x/ x^ x* %3 x/ ; ; * 836B7
              NULL{} }                           * 836F3
            {                                    * 836FD
              SYMBOL Π&1 xSQRT xINV ; NULL{}     * 83702
              :: intgLinArg Π&1                  * 83720
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
              :: intgLinArg Π&1                  * 8379D
                SYMBOL Π&1 xABS ; ;              * 837AC
              NULL{} }                           * 837C5
          }                                      * 837CF
          OBJ_5B34D ;                            * 837D4

* ROMPTR 0F0 019
* refs (1): 82007
* Probably: the slot of DER that does one derivative step on a meta: TRUE when the result is complete, FALSE otherwise. Runs SYMDERSTEP unless the variable is lam'dvar itself
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
* Rule T-> on A=B: moves the last term or factor of the left side over to the right side
RuleT->=:
        :: rotswap pullpsh1& rotswap pshzerpsharg forceprod M1st*case * 838D3
          :: SWAPDROP#1- metainv pshtop& meta* larg& ; * 838F6
          forceadd M1st+case                     * 83919
          :: SWAPDROP#1- metaneg pshtop& meta+ larg& ; * 83923
          metaneg psh %0_2A2B4 psh1& top& meta+ larg& ; * 83946

* ROMPTR 0F0 01B
* refs (1): 82007
* Rule <-T on A=B: moves the first term or factor of the right side over to the left side
Rule<-T=:
        :: rotswap pullpsh1& rotswap larg forceprodR M1st*case * 8396E
          :: plDRPpZparg meta/ psh& 4roll top& unrot larg& ; * 83991
          forcesumR M1st+case                    * 839BE
          :: plDRPpZparg meta- psh& 4roll top& unrot larg& ; * 839C8
          top& meta- rotswap %0_2A2B4 psh1& rotswap larg& ; * 839F5

* ROMPTR 0F0 01C
* refs (1): 82007
* Rule AF on A+B/C and A-B/C: adds the fractions over a common denominator; both fractions goes to RuleAF2
RuleAF:
        :: #1-SWAP pshm1 #1-SWAP DROP pshzerpsharg pshzerpsharg M1st/case * 83A1D
          XLIB RuleAF2                           * 83A45
          metaROTDUP roll2top& meta* ROTUntop& ROTUntop& pshtop& meta/ ; * 83A50

* ROMPTR 0F0 01D
* refs (1): 82007
* Rule AF when both terms are fractions: A/B+C/D -> (A*D+B*C)/(B*D)
RuleAF2:
        :: rotswap plDRPpZparg metaROTDUP roll2top& meta* psh metaROTDUP * 83A78
          ROTUntop& meta* over& overev& 'x* psh1&rev overev& top& meta/ ; * 83AA0

* ROMPTR 0F0 01E
* refs (1): 82007
* Rule AF on A/B+C and A/B-C: the fraction on the left
RuleAFarg:
        :: #1-SWAP pshm1 pshzerpsharg SWAPDROP#1- larg dup over& overev& 'x* * 83AD2
          psh1&rev overev& top& meta/ ;          * 83B04

* ROMPTR 0F0 01F
* refs (1): 82007
* Rule <--> on A+B: B+A
Rule<-->+:
        :: drppargtop& COLA meta+                * 83B1D
        ;                                        * 83B31

* ROMPTR 0F0 020
* refs (1): 82007
* Rule <--> on A-B: -B+A
Rule<-->-:
        :: SWAPDROP#1- metaneg pshzerpsharg top& COLA meta+ * 83B36
        ;                                        * 83B59

* ROMPTR 0F0 021
* refs (1): 82007
* Rule <--> on A*B: B*A
Rule<-->*:
        :: drppargtop& COLA meta*                * 83B5E
        ;                                        * 83B72

* ROMPTR 0F0 022
* refs (1): 82007
* Rule <--> on A/B: INV(B)*A
Rule<-->/:
        :: SWAPDROP#1- metainv pshzerpsharg top& COLA meta* * 83B77
        ;                                        * 83B9A

* ROMPTR 0F0 023
* refs (1): 82007
* Rule <-A on A-(B+C): (A-B)-C
Rule<-A-+:
        :: OBJ_5CA0F drpmeta- OBJ_5C9F1 ;        * 83B9F

* ROMPTR 0F0 024
* refs (1): 82007
* Rule <-A on A-(B-C): (A-B)+C
Rule<-A--:
        :: OBJ_5CA0F drpmeta+ OBJ_5C9F1 ;        * 83BB8

* ROMPTR 0F0 025
* refs (1): 82007
* Rule <-A on A/(B*C): (A/B)/C
Rule<-A/*:
        :: OBJ_5CA0F drpmeta/ OBJ_5C9F1 ;        * 83BD1

* ROMPTR 0F0 026
* refs (1): 82007
* Rule <-A on A/(B/C): (A/B)*C
Rule<-A//:
        :: OBJ_5CA0F drpmeta* OBJ_5C9F1 ;        * 83BEA

* ROMPTR 0F0 027
* refs (1): 82007
* Rule <-A on A^(B*C): (A^B)^C
Rule<-A^*:
        :: OBJ_5CA0F PTR repl: x^ OBJ_5C9F1 ;    * 83C03

* ROMPTR 0F0 028
* refs (1): 82007
* Rule A-> on (A-B)+C: A-(B-C)
RuleA->+-:
        :: drpmeta- COLA OBJ_5CA32               * 83C21
        ;                                        * 83C35

* ROMPTR 0F0 029
* refs (1): 82007
* Rule A-> on (A-B)-C: A-(B+C)
RuleA->--:
        :: drpmeta+ COLA OBJ_5CA32               * 83C3A
        ;                                        * 83C4E

* ROMPTR 0F0 02A
* refs (1): 82007
* Rule A-> on (A/B)*C: A/(B/C)
RuleA->*/:
        :: drpmeta/ COLA OBJ_5CA32               * 83C53
        ;                                        * 83C67

* ROMPTR 0F0 02C
* refs (2): 82007 82007
* Rule A-> on (A/B)/C and (A^B)^C: A/(B*C) and A^(B*C)
RuleA->*:
        :: drpmeta* COLA OBJ_5CA32               * 83C6C
        ;                                        * 83C80

* ROMPTR 0F0 02E
* refs (2): 82007 82007
* Rule D-> on A/(B+C) and A/(B-C): 1/(B/A+C/A) and 1/(B/A-C/A)
RuleD->/:
        :: pargop metainv pshtop& drpmeta* OBJ_5CA50 metainv ; * 83C85

* ROMPTR 0F0 02F
* refs (1): 82007
* Rule D-> on A^(B+C): A^B*A^C
RuleD->^+:
        :: OBJ_5CA50 COLA drpmeta*               * 83CAD
        ;                                        * 83CC1

* ROMPTR 0F0 030
* refs (1): 82007
* Rule D-> on A^(B-C): A^B/A^C
RuleD->^-:
        :: OBJ_5CA50 COLA drpmeta/               * 83CC6
        ;                                        * 83CDA

* ROMPTR 0F0 031
* refs (1): 82007
* Rule D-> on EXP(A+B) and ALOG(A+B): a product of two
RuleD->EXP+:
        :: OBJ_5CAA5 COLA drpmeta*               * 83CDF
        ;                                        * 83CF3

* ROMPTR 0F0 032
* refs (1): 82007
* Rule D-> on EXP(A-B) and ALOG(A-B): a quotient of two
RuleD->EXP-:
        :: OBJ_5CAA5 COLA drpmeta/               * 83CF8
        ;                                        * 83D0C

* ROMPTR 0F0 033
* refs (1): 82007
* Rule D-> on LN(A*B) and LOG(A*B): a sum of two
RuleD->LN*:
        :: OBJ_5CAA5 COLA drpmeta+               * 83D11
        ;                                        * 83D25

* ROMPTR 0F0 034
* refs (1): 82007
* Rule D-> on LN(A/B) and LOG(A/B): a difference of two
RuleD->LN/:
        :: OBJ_5CAA5 COLA drpmeta-               * 83D2A
        ;                                        * 83D3E

* ROMPTR 0F0 036
* refs (2): 82007 82007
* Rule ->() on -(A*B) and -(A/B): the negation moves onto A
Rule->()NEG:
        :: SWAPDROP#1- metaneglft ;              * 83D43

* ROMPTR 0F0 037
* refs (1): 82007
* Rule ->() on -LN(A) and -LOG(A): LN(1/A)
Rule->()LN:
        :: SWAPDROP#1- COLA metainvlft           * 83D57
        ;                                        * 83D6B

* ROMPTR 0F0 039
* refs (2): 82007 82007
* Rule ->() on 1/(A^B), 1/EXP(A) and 1/ALOG(A): the exponent is negated
Rule->()INV:
        :: SWAPDROP#1- #1-SWAP pshm1 metaneg COLA pshtop& * 83D70
        ;                                        * 83D93

* ROMPTR 0F0 03A
* refs (1): 82007
* Rule 1/() on A*B: INV(INV(A)/B)
Rule1/()*:
        :: [f(X,Y)]=>[INV(X)/Y]! PTR addt: xINV ; * 83D98

* ROMPTR 0F0 03B
* refs (1): 82007
* Rule 1/() on A/B: INV(INV(A)*B)
Rule1/()/:
        :: [f(X,Y)]=>[INV(X)*Y]! PTR addt: xINV ; * 83DB1

* ROMPTR 0F0 03D
* refs (2): 82007 82007
* Rule 1/() on A^B, EXP(A) and ALOG(A): INV of the same with the exponent negated
Rule1/()^:
        :: #1-SWAP pshm1 metaneg pshtop& PTR addt: xINV ; * 83DCA

* ROMPTR 0F0 03E
* refs (1): 82007
* Rule -() on LN(A) and LOG(A): -LN(1/A)
Rule-()LN:
        :: metainvlft addtNEG ;                  * 83DF2

* ROMPTR 0F0 040
* refs (2): 82007 82007
* Rule -() on A*B and A/B: -(-A*B) and -(-A/B)
Rule-()*:
        :: metaneglft addtNEG ;                  * 83E06

* ROMPTR 0F0 041
* refs (1): 82007
* Rule -() on A+B: -(-A-B)
Rule-()+:
        :: [f(X,Y)]=>[-X-Y]! addtNEG ;           * 83E1A

* ROMPTR 0F0 042
* refs (1): 82007
* Rule -() on A-B: -(-A+B)
Rule-()-:
        :: [f(X,Y)]=>[-X+Y]! addtNEG ;           * 83E2E

* ROMPTR 0F0 043
* refs (1): 82007
* Rule E^ on EXP(A*B) and ALOG(A*B): EXP(A)^B
RuleE^*:
        :: OBJ_5CAE1 PTR repl: x^ ;              * 83E42

* ROMPTR 0F0 044
* refs (1): 82007
* Rule E^ on EXP(A/B) and ALOG(A/B): EXP(A)^(1/B)
RuleE^/:
        :: OBJ_5CAE1 SWAPDROP#1- metainv PTR addt: x^ ; * 83E5B

* ROMPTR 0F0 045
* refs (1): 82007
* Rule E() on EXP(A)^B and ALOG(A)^B: EXP(A*B)
RuleE():
        :: drpmeta* COLA OBJ_5CAE1               * 83E7E
        ;                                        * 83E92

* ROMPTR 0F0 046
* refs (1): 82007
* Rule L* on LN(A^B) and LOG(A^B): LN(A)*B
RuleL*:
        :: OBJ_5CAE1 COLA drpmeta*               * 83E97
        ;                                        * 83EAB

* ROMPTR 0F0 047
* refs (1): 82007
* Rule L() on LN(A)*B and LOG(A)*B: LN(A^B)
RuleL()*:
        :: PTR repl: x^ COLA OBJ_5CAE1           * 83EB0
        ;                                        * 83EC9

* ROMPTR 0F0 048
* refs (1): 82007
* Rule L() on LN(A)/B and LOG(A)/B: LN(A^(1/B))
RuleL()/:
        :: SWAPDROP#1- metainv PTR addt: x^ COLA OBJ_5CAE1 * 83ECE
        ;                                        * 83EF1

* ROMPTR 0F0 04A
* refs (2): 82007 82007
* Rule <-M on sums and differences: merges common factors through OBJ_5CAFF, or gives the bad-key beep
Rule<-M:
        :: dup Rule<-M~1 OBJ_5CAFF ?SKIP         * 83EF6
          :: psh DoBadKey ;                      * 83F0F
          psh NDROP ;                            * 83F23

* ROMPTR 0F0 04B
* refs (1): 82007
* Splits a term for <-M into factors: A*B as it stands, A/B as A*INV(B), anything else as 1*term
RuleMTerm:
        :: M1st*case XLIB RuleMSign              * 83F32
          M1st/case                              * 83F47
          :: XLIB RuleMQuot XLIB RuleMSign ;     * 83F4C
          PTR addt2: %1 x* XLIB RuleMSign ;      * 83F6C

* ROMPTR 0F0 04C
* refs (1): 82007
* Used by RuleMTerm: takes the sign out of the term's first factor
RuleMSign:
        :: pargop M-1stcasechs                   * 83F8B
          :: pshtop& addtNEG ROTSWAP ;           * 83F9A
          pshtop& ;                              * 83FB3

* ROMPTR 0F0 04D
* refs (1): 82007
* A/B -> A*INV(B), for RuleMTerm
RuleMQuot:
        :: SWAPDROP#1- metainv addt* ;           * 83FBD

* ROMPTR 0F0 04E
* refs (1): 82007
* Rule <-M on A^B*A^C: A^(B+C)
Rule<-M^*:
        :: drpmeta+ OBJ_5CAFF ?SEMI              * 83FD6
          drpmeta* DoBadKey ;                    * 83FEA

* ROMPTR 0F0 04F
* refs (1): 82007
* Rule <-M on A^B/A^C: A^(B-C)
Rule<-M^/:
        :: drpmeta- OBJ_5CAFF ?SEMI              * 83FF9
          drpmeta/ DoBadKey ;                    * 8400D

* ROMPTR 0F0 050
* refs (1): 82007
* Rule <-M on EXP(A)*EXP(B): EXP(A+B); the same for ALOG
Rule<-MEXP*:
        :: drpmeta+ OBJ_5CB7C DROP ;             * 8401C

* ROMPTR 0F0 051
* refs (1): 82007
* Rule <-M on EXP(A)/EXP(B): EXP(A-B); the same for ALOG
Rule<-MEXP/:
        :: drpmeta- OBJ_5CB7C DROP ;             * 84035

* ROMPTR 0F0 052
* refs (1): 82007
* Rule <-M on LN(A)+LN(B): LN(A*B); the same for LOG
Rule<-MLN+:
        :: drpmeta* OBJ_5CB7C DROP ;             * 8404E

* ROMPTR 0F0 053
* refs (1): 82007
* Rule <-M on LN(A)-LN(B): LN(A/B); the same for LOG
Rule<-MLN-:
        :: drpmeta/ OBJ_5CB7C DROP ;             * 84067

* ROMPTR 0F0 054
* refs (1): 82007
* Rule M-> on all six of its forms: merges through OBJ_5CB7C, or gives the bad-key beep
RuleM->:
        :: OBJ_5CB7C ?SEMI                       * 84080
          DoBadKey ;                             * 8408F

* ROMPTR 0F0 055
* refs (1): 82007
* Probably: splits a nested sum for the term-moving rules (reached from OBJ_5D2A2 and Rule<-T+~1)
ROMP_0F0_055:
        :: plDRPpZparg forceadd Sum>Parts 4roll forcesumR Sum>PartsSw 4roll * 84099
          psh 5unroll over& pshtop& top& top& top& meta+ ; * 840C1

* ROMPTR 0F0 056
* refs (1): 82007
* Probably: splits a nested product for the term-moving rules (reached from forceprodR* and Rule<-T*~1)
ROMP_0F0_056:
        :: plDRPpZparg forceprod Prod>Parts 4roll forceprodR Prod>PartsSw * 840EE
          4roll psh 5unroll over& pshtop& top& top& top& meta* ; * 84111

* ROMPTR 0F0 057
* refs (1): 82007
* Rule <-T on A+B and A-B: moves a term left
Rule<-T+:
        :: Rule<-T+~1 rotswap OBJ_5D721 x+ x- OBJ_5D7CC ; * 84143

* ROMPTR 0F0 058
* refs (1): 82007
* Rule <-T on A*B and A/B: moves a factor left
Rule<-T*:
        :: Rule<-T*~1 rotswap OBJ_5D721 x* x/ OBJ_5D7CC ; * 8416B

* ROMPTR 0F0 059
* refs (1): 82007
* Rule (<- on A+B and A-B: expands the parentheses to the left
Rule(<-+:
        :: OBJ_5D831 x+ x- NOTcase OBJ_5DB33     * 84193
          AEQ1stcase x=                          * 841B1
          NOP #1-SWAP dvarlsBIND larg OBJ_5D8C7 x+ x- rot forceadd * 841BB
          :: M1st+case NOP                       * 841E8
            RDROP Rule(<-+~1 4roll top& unrot ;  * 841F7
          SWAPDROP#1- 4roll pshtop& pshzerpsharg 4unroll Rule(<-+~1 meta+ * 84215
          4roll top& unrot ;                     * 84238

* ROMPTR 0F0 05A
* refs (1): 82007
* Rule (<- on A*B and A/B: expands the parentheses to the left
Rule(<-*:
        :: OBJ_5D831 x* x/ NOTcase OBJ_5DB33     * 8424C
          AEQ1stcase x=                          * 8426A
          NOP #1-SWAP dvarlsBIND larg OBJ_5D8C7 x* x/ rot forceprod * 84274
          :: M1st*case NOP                       * 842A1
            RDROP Rule(<-*~1 4roll top& unrot ;  * 842B0
          SWAPDROP#1- 4roll pshtop& pshzerpsharg 4unroll Rule(<-*~1 meta* * 842CE
          4roll top& unrot ;                     * 842F1

* ROMPTR 0F0 05B
* refs (1): 82007
* Rule ->) on A+B and A-B: expands the parentheses to the right
Rule->)+:
        :: OBJ_5D84A x+ x- NOTcase OBJ_5DCBE     * 84305
          AEQ1stcase x=                          * 84323
          NOP #1-SWAP dvarlsBIND pshzerpsharg OBJ_5D999 x+ x- rot forcesumR * 8432D
          :: M1st+case NOP                       * 8435A
            RDROP Rule->)+~1 ;                   * 84369
          pargop psh 1GETLAM ' x+ EQ ?SKIP drpmeta- * 84378
          BINT5 N+1roll top& 5unroll Rule->)+~1 ; * 843A0

* ROMPTR 0F0 05C
* refs (1): 82007
* Rule ->) on A*B and A/B: expands the parentheses to the right
Rule->)*:
        :: OBJ_5D84A x* x/ NOTcase OBJ_5DCBE     * 843BE
          AEQ1stcase x=                          * 843DC
          NOP #1-SWAP dvarlsBIND pshzerpsharg OBJ_5D999 x* x/ rot forceprodR * 843E6
          :: M1st*case NOP                       * 84413
            RDROP Rule->)*~1 ;                   * 84422
          pargop psh 1GETLAM ' x* EQ ?SKIP drpmeta/ * 84431
          BINT5 N+1roll top& 5unroll Rule->)*~1 ; * 84459

* ROMPTR 0F0 05D
* refs (1): 82007
* Rule (()) on A+B and A-B: adds a pair of parentheses around the term
Rule(())+:
        :: #1-SWAP dvarlsBIND larg 1GETABND ' x+ EQ ?SKIP [X]=>[NEG(X)]! * 84477
          forcesumR psh forceadd Sum>Parts 4roll Sum>PartsSw over& psh over& * 844A9
          psh meta+ rot top& psh over& over& rot top& psh larg ; * 844D6

* ROMPTR 0F0 05E
* refs (1): 82007
* Rule (()) on A*B and A/B: adds a pair of parentheses around the factor
Rule(())*:
        :: #1-SWAP dvarlsBIND larg 1GETABND ' x* EQ ?SKIP [X]=>[INV(X)]! * 84512
          forceprodR psh forceprod Prod>Parts 4roll Prod>PartsSw over& psh * 84544
          over& psh meta* rot top& psh over& over& rot top& psh larg ; * 8456C

* ROMPTR 0F0 061
* refs (3): 82007 82007 82007
* Rule ->() on CONJ, RE and IM of a sum, product and so on: distributes the prefix over the operands
Rule->()Cx:
        :: #1-SWAP dvarlsBIND #1-SWAP pshm1 larg 1GETLAM SWAP#1+ psh * 845AD
          1GETABND OVER #0= ITE DROP SWAP#1+     * 845DA
          pshtop& pshtop& ;                      * 845F8

* ROMPTR 0F0 062
* refs (1): 82007
* Probably: splits two operands into RE and IM parts, for the RE and IM of a product
ROMP_0F0_062:
        :: #2- ROTROT2DROP larg dup PTR addt: xRE meta* psh PTR addt: xIM * 84607
          meta* rot dup PTR addt: xRE psh PTR addt: xIM ; * 8463E

* ROMPTR 0F0 063
* refs (1): 82007
* Rule ->TRG on EXP(A): COS(A/i)+i*SIN(A/i), the argument converted for the angle mode
Rule->TRG:
        :: SWAPDROP#1- Add180ã/*[_] Addi*[_] drpmeta/ dup PTR addt: xCOS psh * 8466B
          PTR addt: xSIN top& Addi*[_] meta+ ;   * 84698

* ROMPTR 0F0 064
* refs (1): 82007
* Rule ->DEF on SIN(A): (EXP(i*A)-EXP(-i*A))/(2*i)
Rule->DEFSIN:
        :: SWAPDROP#1- Addã180/*i[_] dup metaneg PTR 2psh1&rev: xEXP top& * 846B6
          { x- %2 xi x* x/ } INNERtop& ;         * 846DE

* ROMPTR 0F0 065
* refs (1): 82007
* Rule ->DEF on COS(A): (EXP(i*A)+EXP(-i*A))/2
Rule->DEFCOS:
        :: SWAPDROP#1- Addã180/*i[_] dup metaneg PTR 2psh1&rev: xEXP top& * 8470B
          { x+ %2 x/ } INNERtop& ;               * 84733

* ROMPTR 0F0 066
* refs (1): 82007
* Rule ->DEF on TAN(A): (EXP(2*i*A)-1)/((EXP(2*i*A)+1)*i)
Rule->DEFTAN:
        :: SWAPDROP#1- Addã180/*i[_]             * 84756
          { %2 x* xEXP %1 x- } INNERtop& dup drpmeta+ top& * 84765
          { xi x* x/ } INNERtop& ;               * 8479C

* ROMPTR 0F0 067
* refs (1): 82007
* Rule ->DEF on ASIN(A), as a logarithm
Rule->DEFASIN:
        :: SWAPDROP#1- dup                       * 847BF
          { xi xNEG %1 } INNERCOMP pshtop& {2,^,-,û,I} INNERtop& pshtop& * 847CE
          { x* x+ xLN x* } INNERtop& Add180ã/*[_] ; * 84800

* ROMPTR 0F0 068
* refs (1): 82007
* Rule ->DEF on ACOS(A), as a logarithm
Rule->DEFACOS:
        :: SWAPDROP#1- dup                       * 8482D
          { xPI %2 x/ xi %1 } INNERCOMP pshtop& {2,^,-,û,I} INNERtop& * 8483C
          pshtop&                                * 84873
          { x* x+ xLN x* x+ } INNERtop& Add180ã/*[_] ; * 84878

* ROMPTR 0F0 069
* refs (1): 82007
* Rule ->DEF on ATAN(A), as a logarithm
Rule->DEFATAN:
        :: SWAPDROP#1- dup                       * 848AA
          { xi xNEG %1 xi } INNERCOMP pshtop&    * 848B9
          { x* x+ %1 } INNERtop& pshtop&         * 848E1
          { %2 x^ x+ xSQRT x/ xLN x* } INNERtop& Add180ã/*[_] ; * 84904

* ROMPTR 0F0 06A
* refs (1): 82007
* Rule ->DEF on SINH(A): -(SIN(i*A)*i)
Rule->DEFSINH:
        :: SWAPDROP#1- Add180ã/*[_]              * 84940
          { xi x* xSIN xi x* xNEG } INNERtop& ;  * 8494F

* ROMPTR 0F0 06B
* refs (1): 82007
* Rule ->DEF on COSH(A): COS(i*A)
Rule->DEFCOSH:
        :: SWAPDROP#1- Add180ã/*[_]              * 84981
          { xi x* xCOS } INNERtop& ;             * 84990

* ROMPTR 0F0 06C
* refs (1): 82007
* Rule ->DEF on TANH(A): TAN(i*A)*-i
Rule->DEFTANH:
        :: SWAPDROP#1- Add180ã/*[_]              * 849B3
          { xi x* xTAN xi xNEG x* } INNERtop& ;  * 849C2

* ROMPTR 0F0 06D
* refs (1): 82007
* Rule ->DEF on ASINH(A): -LN(SQRT(1+A^2)-A)
Rule->DEFASINH:
        :: SWAPDROP#1- dup %1 psh1&              * 849F4
          { %2 x^ x+ xSQRT } INNERCOMP pshtop& top& * 84A0D
          { x- xLN xNEG } INNERtop& ;            * 84A3A

* ROMPTR 0F0 06E
* refs (1): 82007
* Rule ->DEF on ACOSH(A), as a logarithm
Rule->DEFACOSH:
        :: SWAPDROP#1- dup                       * 84A5D
          { xPI %2 x/ xi %1 } INNERCOMP pshtop& {2,^,-,û,I} INNERtop& * 84A6C
          pshtop&                                * 84AA3
          { x* x+ xLN x* x+ %2 x^ xNEG xSQRT } INNERtop& ; * 84AA8

* ROMPTR 0F0 06F
* refs (1): 82007
* Rule ->DEF on ATANH(A), as a logarithm
Rule->DEFATANH:
        :: SWAPDROP#1- %1 pshm1 top& dup ' x- psh1&rev top& * 84AE9
          { %2 x^ x- xSQRT x/ xLN xNEG } INNERtop& ; * 84B1B

* ROMPTR 0F0 070
* refs (1): 82007
* Rule TRG* on SIN(A+B) and SIN(A-B): the addition formula
RuleTRG*SIN:
        :: SWAPDROP#1- #1-SWAP pshm1 pshzerpsharg dup PTR addt: xSIN unrot * 84B52
          PTR addt: xCOS psh dup PTR addt2: xSIN x* psh& PTR addt2: xCOS x* * 84B7F
          pshtop& top& pshtop& ;                 * 84BB6

* ROMPTR 0F0 071
* refs (1): 82007
* Rule TRG* on COS(A+B) and COS(A-B): the addition formula, with the sign flipped
RuleTRG*COS:
        :: SWAPDROP#1- #1-SWAP pshm1 pshzerpsharg dup PTR addt: xCOS unrot * 84BCA
          PTR addt: xSIN psh dup PTR addt2: xSIN x* psh& PTR addt2: xCOS x* * 84BF7
          pshtop& top& psh DROP REQcasedrop x+   * 84C2E
          meta- DROP meta+ ;                     * 84C4C

* ROMPTR 0F0 072
* refs (1): 82007
* Rule TRG* on TAN(A+B) and TAN(A-B): the addition formula
RuleTRG*TAN:
        :: ROTSWAP pargop PTR addt: xTAN pshtop& dup %1 psh1&rev top& * 84C60
          PTR addt: x* ROTSWAP #1-SWAP           * 84C92
          :: REQcasedrop x+                      * 84CA6
            meta- DROP meta+ ;                   * 84CB5
          meta/ ;                                * 84CC9

* ROMPTR 0F0 073
* refs (1): 82007
* Rule TRG* on SINH(A+B) and SINH(A-B): the addition formula
RuleTRG*SINH:
        :: SWAPDROP#1- #1-SWAP pshm1 pshzerpsharg dup PTR addt: xSINH unrot * 84CD3
          PTR addt: xCOSH psh dup PTR addt2: xSINH x* psh& PTR addt2: xCOSH * 84D00
          x* pshtop& top& pshtop& ;              * 84D32

* ROMPTR 0F0 074
* refs (1): 82007
* Rule TRG* on COSH(A+B) and COSH(A-B): the addition formula
RuleTRG*COSH:
        :: SWAPDROP#1- #1-SWAP pshm1 pshzerpsharg dup PTR addt: xCOSH unrot * 84D4B
          PTR addt: xSINH psh dup PTR addt2: xSINH x* psh& PTR addt2: xCOSH * 84D78
          x* pshtop& top& pshtop& ;              * 84DAA

* ROMPTR 0F0 075
* refs (1): 82007
* Rule TRG* on TANH(A+B) and TANH(A-B): the addition formula
RuleTRG*TANH:
        :: ROTSWAP pargop PTR addt: xTANH pshtop& dup %1 psh1&rev top& * 84DC3
          PTR addt: x* ROTSWAP meta/ ;           * 84DF5

* ROMPTR 0F0 076
* refs (1): 82007
* meta -> meta': rule COLCT: runs SYMCOLCT on the subexpression
{RULES\COLCT}~1:
        :: EqwMeta>Symb DUPTYPESYMB? NOTcase EXPLODE * 84E0E
          EqwUnderMark DEPTH EqwMarkDepth ' NULLLAM CACHE SYMCOLCT OBJ_6B28C * 84E27
          NOTcase INVDEFERR                      * 84E4F
          ' NULLLAM DUMP DROP ABND DEPTH #1- #<>case ARGNUMERR * 84E59
          OBJ_6AE6F EXPLODE ;                    * 84E86

* ROMPTR 0F0 077
* refs (1): 82007
* WHERE through a user function applied in the expression: substitutes into its arguments
nWHEREFCNAPP~1:
        :: 3PICK CARCOMP NOTROMPcase nWHEREFCNAPP~2 * 84E95
          DUPROMPTR@ ?SKIP SETROMPERR            * 84EAE
          SWAP CmdFieldA NOTcasedrop nWHEREFCNAPP~2 * 84EBD
          SWAP infarg? SWAPDROP ITE              * 84ED1
          :: 4ROLL DROPSWAP #1- ;                * 84EE5
          :: ROTDROP ROTDROPSWAP #2- ;           * 84EFE
          SWAP COLA_EVAL ;                       * 84F17

* ROMPTR 0F0 078
* refs (1): 82007
* WHERE around DER: pushes the substitution inside
nWHEREDER~1:
        :: PTR addt: xDER psh #1+DUP top& PTR addt: xWHERE ::N COLA_EVAL ; * 84F26

* ROMPTR 0F0 079
* refs (1): 82007
* WHERE around IFTE: applies WHERE to each branch separately
nWHEREIFTE~1:
        :: psh dup unrot psh #1-SWAP symcomp psh1& psh DUP#1+ Cr xWHERE * 84F5D
          pshm1 metaROTDUP rot #1-SWAP symcomp psh1& psh DUP#1+ Cr xWHERE * 84F99
          BINT1 unrot symbn BINT1 psh #1+DUP top& PTR addt: xWHERE pshtop& * 84FCB
          pshtop& Cr xIFTE COLA COMPEVAL         * 84FFD
        ;                                        * 85016
