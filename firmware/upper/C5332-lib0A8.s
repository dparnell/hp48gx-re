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
        { NULL$ DoBadKey }                       * C5349

* ROMPTR 0A8 001
* refs (1): C5332
ROMP_0A8_001:
        { CUREQ                                  * C535D
          { CUREQ xSTEQ xRCEQ } }                * C5367

* ROMPTR 0A8 002
* refs (1): C5332
ROMP_0A8_002:
        ID ΣPAR                                  * C5385

* ROMPTR 0A8 003
* refs (1): C5332
ROMP_0A8_003:
        { ID_SIGMADAT                            * C5394
          { ID_SIGMADAT xSTOSIGMA xRCLSIGMA } }  * C539E

* ROMPTR 0A8 004
* refs (1): C5332
ROMP_0A8_004:
        { $ "INFO"                               * C53BC
          :: TakeOver LocalReview ; }            * C53D3

* ROMPTR 0A8 005
* refs (1): C5332
ROMP_0A8_005:
        {                                        * C53EC
          :: PTR FStd/BoxLbl: $ "RECT" BINT16 ;  * C53F1
          :: EvalNextChkPRG ROMPTR 0AB 013 ; }   * C5417  RECT

* ROMPTR 0A8 006
* refs (1): C5332
ROMP_0A8_006:
        {                                        * C5436
          :: TakeOver $ "CYLIN" BINT15 TestSysFlag NOT BINT16 TestSysFlag * C543B
            AND Box/StdLabel ;                   * C5472
          :: EvalNextChkPRG ROMPTR 0AB 014 ; }   * C5481  CYLIN

* ROMPTR 0A8 007
* refs (1): C5332
ROMP_0A8_007:
        {                                        * C54A0
          :: TakeOver $ "SPHERE" BINT15 TestSysFlag BINT16 TestSysFlag AND * C54A5
            Box/StdLabel ;                       * C54DE
          :: EvalNextChkPRG ROMPTR 0AB 015 ; }   * C54E8  SPHERE

* ROMPTR 0A8 008
* refs (1): C5332
ROMP_0A8_008:
        {                                        * C5507
          :: PTR DirLabel: $ "MAKE" ;            * C550C
          :: MenuMaker ROMPTR 0A9 006 InitMenuNoExit ; } * C552D

* ROMPTR 0A8 009
* refs (1): C5332
ROMP_0A8_009:
        {                                        * C5551
          :: PTR DirLabel: $ "NORM" ;            * C5556
          :: MenuMaker ROMPTR 0A9 007 InitMenuNoExit ; } * C5577

* ROMPTR 0A8 00A
* refs (1): C5332
ROMP_0A8_00A:
        {                                        * C559B
          :: PTR DirLabel: $ "FACTR" ;           * C55A0
          :: MenuMaker ROMPTR 0A9 008 InitMenuNoExit ; } * C55C3

* ROMPTR 0A8 00B
* refs (1): C5332
ROMP_0A8_00B:
        {                                        * C55E7
          :: PTR DirLabel: $ "COL" ;             * C55EC
          :: MenuMaker ROMPTR 0A9 009 InitMenuNoExit ; } * C560B

* ROMPTR 0A8 00C
* refs (1): C5332
ROMP_0A8_00C:
        {                                        * C562F
          :: PTR DirLabel: $ "ROW" ;             * C5634
          :: MenuMaker ROMPTR 0A9 00A InitMenuNoExit ; } * C5653

* ROMPTR 0A8 00D
* refs (1): C5332
ROMP_0A8_00D:
        {                                        * C5677
          :: PTR DirLabel: $ "MATRX" ;           * C567C
          :: MenuMaker ROMPTR 0A9 005 InitMenuNoExit ; } * C569F

* ROMPTR 0A8 00E
* refs (1): C5332
ROMP_0A8_00E:
        {                                        * C56C3
          :: PTR BBox/StdLbl: $ "HEX" BINT16 ;   * C56C8
          :: EvalNextChkPRG xHEX ; }             * C56EC

* ROMPTR 0A8 00F
* refs (1): C5332
ROMP_0A8_00F:
        {                                        * C5705
          :: PTR BBox/StdLbl: $ "DEC" BINT10 ;   * C570A
          :: EvalNextChkPRG xDEC ; }             * C572E

* ROMPTR 0A8 010
* refs (1): C5332
ROMP_0A8_010:
        {                                        * C5747
          :: PTR BBox/StdLbl: $ "OCT" BINT8 ;    * C574C
          :: EvalNextChkPRG xOCT ; }             * C5770

* ROMPTR 0A8 011
* refs (1): C5332
ROMP_0A8_011:
        {                                        * C5789
          :: PTR BBox/StdLbl: $ "BIN" BINT2 ;    * C578E
          :: EvalNextChkPRG xBIN ; }             * C57B2

* ROMPTR 0A8 012
* refs (1): C5332
ROMP_0A8_012:
        {                                        * C57CB
          :: PTR DirLabel: $ "LOGIC" ;           * C57D0
          :: MenuMaker ROMPTR 0A9 010 InitMenuNoExit ; } * C57F3

* ROMPTR 0A8 013
* refs (1): C5332
ROMP_0A8_013:
        {                                        * C5817
          :: PTR DirLabel: $ "BIT" ;             * C581C
          :: MenuMaker ROMPTR 0A9 011 InitMenuNoExit ; } * C583B

* ROMPTR 0A8 014
* refs (1): C5332
ROMP_0A8_014:
        {                                        * C585F
          :: PTR DirLabel: $ "BYTE" ;            * C5864
          :: MenuMaker ROMPTR 0A9 012 InitMenuNoExit ; } * C5885

* ROMPTR 0A8 015
* refs (1): C5332
ROMP_0A8_015:
        {                                        * C58A9
          :: PTR DirLabel: $ "BASE" ;            * C58AE
          :: MenuMaker ROMPTR 0A9 00F NoExitAction BINT7 DoMenuPos(li,s) * C58CF
            SetDA12NoCh ;                        * C58F3
        }                                        * C58FD

* ROMPTR 0A8 016
* refs (1): C5332
ROMP_0A8_016:
        {                                        * C5902
          :: PTR DirLabel: $ "IF" ;              * C5907
          {                                      * C5924
            :: MenuMaker ROMPTR 0A9 018 InitMenuNoExit ; * C5929
            :: 3NextInCmdLine xIFEND xTHEN xIF ; * C5948
            :: 4NextInCmdLine xIFEND xELSE xTHEN xIF ; } * C5966
        }                                        * C598E

* ROMPTR 0A8 017
* refs (1): C5332
ROMP_0A8_017:
        {                                        * C5993
          :: PTR DirLabel: $ "CASE" ;            * C5998
          {                                      * C59B9
            :: MenuMaker ROMPTR 0A9 019 InitMenuNoExit ; * C59BE
            :: 4NextInCmdLine xIFEND xIFEND xTHENCASE xCASE ; * C59DD
            :: Echo2Macros xIFEND xTHENCASE ; }  * C5A00
        }                                        * C5A1E

* ROMPTR 0A8 018
* refs (1): C5332
ROMP_0A8_018:
        {                                        * C5A23
          :: PTR DirLabel: $ "START" ;           * C5A28
          {                                      * C5A4B
            :: MenuMaker ROMPTR 0A9 01A InitMenuNoExit ; * C5A50
            :: Echo2Macros xNEXT xSTART ;        * C5A6F
            :: Echo2Macros xSTEP xSTART ; }      * C5A88
        }                                        * C5AA6

* ROMPTR 0A8 019
* refs (1): C5332
ROMP_0A8_019:
        {                                        * C5AAB
          :: PTR DirLabel: $ "FOR" ;             * C5AB0
          {                                      * C5ACF
            :: MenuMaker ROMPTR 0A9 01B InitMenuNoExit ; * C5AD4
            :: Echo2Macros xNEXT xSTARTVAR ;     * C5AF3
            :: Echo2Macros xSTEP xSTARTVAR ; }   * C5B0C
        }                                        * C5B2A

* ROMPTR 0A8 01A
* refs (1): C5332
ROMP_0A8_01A:
        {                                        * C5B2F
          :: PTR DirLabel: $ "DO" ;              * C5B34
          {                                      * C5B51
            :: MenuMaker ROMPTR 0A9 01D InitMenuNoExit ; * C5B56
            :: 3NextInCmdLine xENDDO xUNTIL xDO ; } * C5B75
        }                                        * C5B98

* ROMPTR 0A8 01B
* refs (1): C5332
ROMP_0A8_01B:
        {                                        * C5B9D
          :: PTR DirLabel: $ "WHILE" ;           * C5BA2
          {                                      * C5BC5
            :: MenuMaker ROMPTR 0A9 01F InitMenuNoExit ; * C5BCA
            :: 3NextInCmdLine xWHILEEND xREPEAT xWHILE ; } * C5BE9
        }                                        * C5C0C

* ROMPTR 0A8 01C
* refs (1): C5332
ROMP_0A8_01C:
        {                                        * C5C11
          :: PTR DirLabel: $ "BRCH" ;            * C5C16
          :: MenuMaker ROMPTR 0A9 017 InitMenuNoExit ; } * C5C37

* ROMPTR 0A8 01D
* refs (1): C5332
ROMP_0A8_01D:
        {                                        * C5C5B
          :: PTR DirLabel: $ "ELEM" ;            * C5C60
          :: MenuMaker ROMPTR 0A9 023 InitMenuNoExit ; } * C5C81

* ROMPTR 0A8 01E
* refs (1): C5332
ROMP_0A8_01E:
        {                                        * C5CA5
          :: PTR DirLabel: $ "PROC" ;            * C5CAA
          :: MenuMaker ROMPTR 0A9 024 InitMenuNoExit ; } * C5CCB

* ROMPTR 0A8 01F
* refs (1): C5332
ROMP_0A8_01F:
        {                                        * C5CEF
          :: PTR DirLabel: $ "LIST" ;            * C5CF4
          :: MenuMaker ROMPTR 0A9 022 InitMenuNoExit ; } * C5D15

* ROMPTR 0A8 020
* refs (1): C5332
ROMP_0A8_020:
        { $ "DBUG" xDBUG }                       * C5D39

* ROMPTR 0A8 021
* refs (1): C5332
ROMP_0A8_021:
        { $ "SST" sst }                          * C5D5A

* ROMPTR 0A8 022
* refs (1): C5332
ROMP_0A8_022:
        { $ "SST↓" sstdown }                     * C5D79

* ROMPTR 0A8 023
* refs (1): C5332
ROMP_0A8_023:
        { $ "NEXT" next }                        * C5D9A

* ROMPTR 0A8 024
* refs (1): C5332
ROMP_0A8_024:
        {                                        * C5DBB
          :: PTR DirLabel: $ "IFERR" ;           * C5DC0
          {                                      * C5DE3
            :: MenuMaker ROMPTR 0A9 03C InitMenuNoExit ; * C5DE8
            :: 3NextInCmdLine xIFEND xERRTHEN xIFERR ; * C5E07
            :: 4NextInCmdLine xIFEND xELSE xERRTHEN xIFERR ; } * C5E25
        }                                        * C5E4D

* ROMPTR 0A8 025
* refs (1): C5332
ROMP_0A8_025:
        {                                        * C5E52
          :: PTR DirLabel: $ "ERROR" ;           * C5E57
          :: MenuMaker ROMPTR 0A9 03D InitMenuNoExit ; } * C5E7A

* ROMPTR 0A8 026
* refs (1): C5332
ROMP_0A8_026:
        {                                        * C5E9E
          :: PTR DirLabel: $ "FMT" ;             * C5EA3
          :: MenuMaker ROMPTR 0A9 040 InitMenuNoExit ; } * C5EC2

* ROMPTR 0A8 027
* refs (1): C5332
ROMP_0A8_027:
        {                                        * C5EE6
          :: PTR DirLabel: $ "ANGLE" ;           * C5EEB
          :: MenuMaker ROMPTR 0A9 041 InitMenuNoExit ; } * C5F0E

* ROMPTR 0A8 028
* refs (1): C5332
ROMP_0A8_028:
        {                                        * C5F32
          :: PTR DirLabel: $ "FLAG" ;            * C5F37
          :: MenuMaker ROMPTR 0A9 042 InitMenuNoExit ; } * C5F58

* ROMPTR 0A8 029
* refs (1): C5332
ROMP_0A8_029:
        {                                        * C5F7C
          :: PTR DirLabel: $ "KEYS" ;            * C5F81
          :: MenuMaker ROMPTR 0A9 043 InitMenuNoExit ; } * C5FA2

* ROMPTR 0A8 02A
* refs (1): C5332
ROMP_0A8_02A:
        {                                        * C5FC6
          :: PTR DirLabel: $ "MENU" ;            * C5FCB
          :: MenuMaker ROMPTR 0A9 044 InitMenuNoExit ; } * C5FEC

* ROMPTR 0A8 02B
* refs (1): C5332
ROMP_0A8_02B:
        {                                        * C6010
          :: PTR DirLabel: $ "MISC" ;            * C6015
          :: MenuMaker ROMPTR 0A9 045 InitMenuNoExit ; } * C6036

* ROMPTR 0A8 02C
* refs (1): C5332
ROMP_0A8_02C:
        {                                        * C605A
          :: PTR DirLabel: $ "MODES" ;           * C605F
          :: MenuMaker ROMPTR 0A9 03F InitMenuNoExit ; } * C6082

* ROMPTR 0A8 02D
* refs (1): C5332
ROMP_0A8_02D:
        {                                        * C60A6
          :: PTR MBox/StdLbl: $ "STD" BINT0 ;    * C60AB
          :: EvalNextChkPRG xSTD ; }             * C60CF

* ROMPTR 0A8 02E
* refs (1): C5332
ROMP_0A8_02E:
        {                                        * C60E8
          :: PTR MBox/StdLbl: $ "FIX" BINT1 ; xFIX } * C60ED

* ROMPTR 0A8 02F
* refs (1): C5332
ROMP_0A8_02F:
        {                                        * C611B
          :: PTR MBox/StdLbl: $ "SCI" BINT2 ; xSCI } * C6120

* ROMPTR 0A8 030
* refs (1): C5332
ROMP_0A8_030:
        {                                        * C614E
          :: PTR MBox/StdLbl: $ "ENG" BINT3 ; xENG } * C6153

* ROMPTR 0A8 031
* refs (1): C5332
ROMP_0A8_031:
        {                                        * C6181
          :: PTR FBox/StdLbl: $ "FM," BINT51 ; BINT51 } * C6186

* ROMPTR 0A8 032
* refs (1): C5332
ROMP_0A8_032:
        {                                        * C61B4
          :: PTR FStd/BoxLbl: $ "ML" BINT52 ; BINT52 } * C61B9

* ROMPTR 0A8 033
* refs (1): C5332
ROMP_0A8_033:
        {                                        * C61E5
          :: PTR Box/StdLbl: $ "DEG" DEG? ;      * C61EA
          :: EvalNextChkPRG xDEG ; }             * C620E

* ROMPTR 0A8 034
* refs (1): C5332
ROMP_0A8_034:
        {                                        * C6227
          :: PTR Box/StdLbl: $_RAD RAD? ;        * C622C
          :: EvalNextChkPRG xRAD ; }             * C6245

* ROMPTR 0A8 035
* refs (1): C5332
ROMP_0A8_035:
        {                                        * C625E
          :: TakeOver $_GRAD rad?;fs?(-18)? NOT ORNOT Box/StdLabel ; * C6263
          :: EvalNextChkPRG xGRAD ; }            * C628B

* ROMPTR 0A8 036
* refs (1): C5332
ROMP_0A8_036:
        { $ "RESET"                              * C62A4
          :: TakeOver OBJ_3AA50 ; }              * C62BD

* ROMPTR 0A8 037
* refs (1): C5332
ROMP_0A8_037:
        ID CST                                   * C62D6

* ROMPTR 0A8 038
* refs (1): C5332
ROMP_0A8_038:
        {                                        * C62E3
          :: PTR FStd/BoxLbl: $ "BEEP" BINT56 ; BINT56 } * C62E8

* ROMPTR 0A8 039
* refs (1): C5332
ROMP_0A8_039:
        {                                        * C6318
          :: PTR FBox/StdLbl: $ "CLK" BINT40 ; BINT40 } * C631D

* ROMPTR 0A8 03A
* refs (1): C5332
ROMP_0A8_03A:
        {                                        * C634B
          :: PTR FStd/BoxLbl: $ "SYM" BINT3 ; BINT3 } * C6350

* ROMPTR 0A8 03B
* refs (1): C5332
ROMP_0A8_03B:
        {                                        * C637E
          :: PTR Box/StdLbl: $ "STK" UNDO_ON? ;  * C6383
          :: TakeOver SuspendOK? NOTcase DoBadKey * C63A7
            UNDO_ON? case                        * C63C0
            :: ABND ERRSET UNDO_OFF ;            * C63CA
            UNDO_ON SAVESTACK ERRSET ;           * C63E3
        }                                        * C63F7

* ROMPTR 0A8 03C
* refs (1): C5332
ROMP_0A8_03C:
        {                                        * C63FC
          :: PTR FStd/BoxLbl: $ "ARG" BINT55 ; BINT55 } * C6401

* ROMPTR 0A8 03D
* refs (1): C5332
ROMP_0A8_03D:
        {                                        * C642F
          :: PTR Box/StdLbl: $ "CMD" HISTON? ;   * C6434
          :: TakeOver HISTON? case DisLastCmd!   * C6458
            UnableLastCmd ;                      * C6471
        }                                        * C647B

* ROMPTR 0A8 03E
* refs (1): C5332
ROMP_0A8_03E:
        {                                        * C6480
          :: PTR FStd/BoxLbl: $ "INFO?" BINT58 ; BINT58 } * C6485

* ROMPTR 0A8 03F
* refs (1): C5332
ROMP_0A8_03F:
        {                                        * C64B7
          :: PTR DirLabel: $ "DIR" ;             * C64BC
          :: MenuMaker ROMPTR 0A9 047 InitMenuNoExit ; } * C64DB

* ROMPTR 0A8 040
* refs (1): C5332
ROMP_0A8_040:
        {                                        * C64FF
          :: PTR DirLabel: $ "ARITH" ;           * C6504
          :: MenuMaker ROMPTR 0A9 048 InitMenuNoExit ; } * C6527

* ROMPTR 0A8 041
* refs (1): C5332
ROMP_0A8_041:
        {                                        * C654B
          :: PTR DirLabel: $ "MEM" ;             * C6550
          :: MenuMaker ROMPTR 0A9 046 InitMenuNoExit ; } * C656F

* ROMPTR 0A8 042
* refs (1): C5332
ROMP_0A8_042:
        { $ "DRPN" xDROPN }                      * C6593

* ROMPTR 0A8 043
* refs (1): C5332
ROMP_0A8_043:
        {                                        * C65B4
          :: PTR DirLabel: $ "SOLVE" ;           * C65B9
          :: MenuMaker ROMPTR 0A9 04A InitMenuNoExit ; } * C65DC

* ROMPTR 0A8 044
* refs (1): C5332
ROMP_0A8_044:
        {                                        * C6600
          :: PTR DirLabel: $ "SOLVR" ;           * C6605
          :: MenuMaker ROMPTR 0A9 01E InitMenuNoExit ; } * C6628

* ROMPTR 0A8 045
* refs (1): C5332
ROMP_0A8_045:
        {                                        * C664C
          :: PTR DirLabel: $ "SOLVR" ;           * C6651
          :: MenuMaker ROMPTR 0A9 050 InitMenuNoExit ; } * C6674

* ROMPTR 0A8 046
* refs (1): C5332
ROMP_0A8_046:
        { $ "AMRT"                               * C6698
          :: PTR Do1st/2nd+: ROMPTR 0AB 059 ROMPTR 0E6 003 ; } * C66AF  AMORT

* ROMPTR 0A8 047
* refs (1): C5332
ROMP_0A8_047:
        { PYR                                    * C66D9
          {                                      * C66E3
            :: ' PYR DoMenuKeyNS ; DoBadKey      * C66E8
            :: ' PYR OBJ_41974 ; }               * C6706
        }                                        * C6724

* ROMPTR 0A8 048
* refs (1): C5332
ROMP_0A8_048:
        {                                        * C6729
          :: PTR FBox/StdLbl: $ "BEG" BINT14 ; BINT14 } * C672E

* ROMPTR 0A8 049
* refs (1): C5332
ROMP_0A8_049:
        {                                        * C675C
          :: PTR DirLabel: $ "PTYPE" ;           * C6761
          :: MenuMaker ROMPTR 0A9 052 InitMenuNoExit ; } * C6784

* ROMPTR 0A8 04A
* refs (1): C5332
ROMP_0A8_04A:
        {                                        * C67A8
          :: PTR DirLabel: $ "PPAR" ;            * C67AD
          :: MenuMaker ROMPTR 0A9 053 InitMenuNoExit ; } * C67CE

* ROMPTR 0A8 04B
* refs (1): C5332
ROMP_0A8_04B:
        { xDRAW                                  * C67F2
          :: PTR Do1st/1st+: xDRAW xGRAPH ; }    * C67FC

* ROMPTR 0A8 04C
* refs (1): C5332
ROMP_0A8_04C:
        {                                        * C681A
          :: PTR DirLabel: $ "3D" ;              * C681F
          :: MenuMaker ROMPTR 0A9 054 InitMenuNoExit ; } * C683C

* ROMPTR 0A8 04D
* refs (1): C5332
ROMP_0A8_04D:
        {                                        * C6860
          :: PTR DirLabel: $ "STAT" ;            * C6865
          :: MenuMaker ROMPTR 0A9 057 InitMenuNoExit ; } * C6886

* ROMPTR 0A8 04E
* refs (1): C5332
ROMP_0A8_04E:
        {                                        * C68AA
          :: PTR DirLabel: $ "FLAG" ;            * C68AF
          :: MenuMaker ROMPTR 0A9 05C InitMenuNoExit ; } * C68D0

* ROMPTR 0A8 04F
* refs (1): C5332
ROMP_0A8_04F:
        {                                        * C68F4
          :: PTR DirLabel: $ "PLOT" ;            * C68F9
          :: MenuMaker ROMPTR 0A9 051 InitMenuNoExit ; } * C691A

* ROMPTR 0A8 050
* refs (1): C5332
ROMP_0A8_050:
        {                                        * C693E
          :: PTR DirLabel: $ "PLOT" ;            * C6943
          :: MenuMaker ROMPTR 0A9 051 NoExitAction BINT7 DoMenuPos(li,s) * C6964
            SetDA12NoCh ;                        * C6988
        }                                        * C6992

* ROMPTR 0A8 051
* refs (1): C5332
ROMP_0A8_051:
        {                                        * C6997
          :: PTR DirLabel: $ "PLOT" ;            * C699C
          :: MenuMaker ROMPTR 0A9 051 PrgmEntry? NOTcaseDROP InitMenuNoExit * C69BD
          ;                                      * C69E1
        }                                        * C69E6

* ROMPTR 0A8 052
* refs (1): C5332
ROMP_0A8_052:
        { $ "RESET" OBJ_45EC4 }                  * C69EB

* ROMPTR 0A8 053
* refs (1): C5332
ROMP_0A8_053:
        ID PPAR                                  * C6A0E

* ROMPTR 0A8 054
* refs (1): C5332
ROMP_0A8_054:
        {                                        * C6A1D
          :: PTR DirLabel: $ "PTYPE" ;           * C6A22
          :: MenuMaker ROMPTR 0A9 055 InitMenuNoExit ; } * C6A45

* ROMPTR 0A8 055
* refs (1): C5332
ROMP_0A8_055:
        {                                        * C6A69
          :: PTR DirLabel: $ "VPAR" ;            * C6A6E
          :: MenuMaker ROMPTR 0A9 056 InitMenuNoExit ; } * C6A8F

* ROMPTR 0A8 056
* refs (1): C5332
ROMP_0A8_056:
        {                                        * C6AB3
          :: PTR DirLabel: $ "3D" ;              * C6AB8
          :: MenuMaker ROMPTR 0A9 054 PrgmEntry? NOTcaseDROP InitMenuNoExit * C6AD5
          ;                                      * C6AF9
        }                                        * C6AFE

* ROMPTR 0A8 057
* refs (1): C5332
ROMP_0A8_057:
        ID VPAR                                  * C6B03

* ROMPTR 0A8 058
* refs (1): C5332
ROMP_0A8_058:
        { $ "RESET"                              * C6B12
          :: TakeOver ROMPTR 0B5 08E ROMPTR 0B5 091 ; } * C6B2B

* ROMPTR 0A8 059
* refs (1): C5332
ROMP_0A8_059:
        {                                        * C6B55
          :: PTR DirLabel: $ "PTYPE" ;           * C6B5A
          :: MenuMaker ROMPTR 0A9 058 InitMenuNoExit ; } * C6B7D

* ROMPTR 0A8 05A
* refs (1): C5332
ROMP_0A8_05A:
        {                                        * C6BA1
          :: PTR DirLabel: $ "DATA" ;            * C6BA6
          :: MenuMaker ROMPTR 0A9 05B InitMenuNoExit ; } * C6BC7

* ROMPTR 0A8 05B
* refs (1): C5332
ROMP_0A8_05B:
        {                                        * C6BEB
          :: PTR DirLabel: $ "ΣPAR" ;            * C6BF0
          :: MenuMaker ROMPTR 0A9 059 InitMenuNoExit ; } * C6C11

* ROMPTR 0A8 05C
* refs (1): C5332
ROMP_0A8_05C:
        {                                        * C6C35
          :: PTR DirLabel: $ "STAT" ;            * C6C3A
          :: MenuMaker ROMPTR 0A9 057 PrgmEntry? NOTcaseDROP InitMenuNoExit * C6C5B
          ;                                      * C6C7F
        }                                        * C6C84

* ROMPTR 0A8 05D
* refs (1): C5332
ROMP_0A8_05D:
        {                                        * C6C89
          :: PTR DirLabel: $ "MODL" ;            * C6C8E
          :: MenuMaker ROMPTR 0A9 05A InitMenuNoExit ; } * C6CAF

* ROMPTR 0A8 05E
* refs (1): C5332
ROMP_0A8_05E:
        { $ "RESET"                              * C6CD3
          :: TakeOver                            * C6CEC
            { %1 %2 %0_2A2B4 %0_2A2B4 xLINFIT } ' äPAR XEQSTOID ; * C6CF6
        }                                        * C6D2D

* ROMPTR 0A8 05F
* refs (1): C5332
ROMP_0A8_05F:
        {                                        * C6D32
          :: PTR DirLabel: $ "ΣPAR" ;            * C6D37
          :: MenuMaker ROMPTR 0A9 059 PrgmEntry? NOTcaseDROP InitMenuNoExit * C6D58
          ;                                      * C6D7C
        }                                        * C6D81

* ROMPTR 0A8 060
* refs (1): C5332
ROMP_0A8_060:
        {                                        * C6D86
          :: PTR FStd/BoxLbl: $ "AXES" BINT29 ; BINT29 } * C6D8B

* ROMPTR 0A8 061
* refs (1): C5332
ROMP_0A8_061:
        {                                        * C6DBB
          :: PTR FStd/BoxLbl: $ "CNCT" BINT31 ; BINT31 } * C6DC0

* ROMPTR 0A8 062
* refs (1): C5332
ROMP_0A8_062:
        {                                        * C6DF0
          :: PTR FBox/StdLbl: $ "SIMU" BINT28 ; BINT28 } * C6DF5

* ROMPTR 0A8 063
* refs (1): C5332
ROMP_0A8_063:
        {                                        * C6E25
          :: PTR DirLabel: $ "ALRM" ;            * C6E2A
          :: MenuMaker ROMPTR 0A9 05F InitMenuNoExit ; } * C6E4B

* ROMPTR 0A8 064
* refs (1): C5332
ROMP_0A8_064:
        {                                        * C6E6F
          :: PTR DirLabel: $ "TIME" ;            * C6E74
          :: MenuMaker ROMPTR 0A9 05E InitMenuNoExit ; } * C6E95

* ROMPTR 0A8 065
* refs (1): C5332
ROMP_0A8_065:
        {                                        * C6EB9
          :: PTR DirLabel: $ "DATA" ;            * C6EBE
          :: MenuMaker ROMPTR 0A9 061 InitMenuNoExit ; } * C6EDF

* ROMPTR 0A8 066
* refs (1): C5332
ROMP_0A8_066:
        {                                        * C6F03
          :: PTR DirLabel: $ "ΣPAR" ;            * C6F08
          :: MenuMaker ROMPTR 0A9 062 InitMenuNoExit ; } * C6F29

* ROMPTR 0A8 067
* refs (1): C5332
ROMP_0A8_067:
        {                                        * C6F4D
          :: PTR DirLabel: $ "1VAR" ;            * C6F52
          :: MenuMaker ROMPTR 0A9 064 InitMenuNoExit ; } * C6F73

* ROMPTR 0A8 068
* refs (1): C5332
ROMP_0A8_068:
        {                                        * C6F97
          :: PTR DirLabel: $ "PLOT" ;            * C6F9C
          :: MenuMaker ROMPTR 0A9 065 InitMenuNoExit ; } * C6FBD

* ROMPTR 0A8 069
* refs (1): C5332
ROMP_0A8_069:
        {                                        * C6FE1
          :: PTR DirLabel: $ "FIT" ;             * C6FE6
          :: MenuMaker ROMPTR 0A9 066 InitMenuNoExit ; } * C7005

* ROMPTR 0A8 06A
* refs (1): C5332
ROMP_0A8_06A:
        {                                        * C7029
          :: PTR DirLabel: $ "SUMS" ;            * C702E
          :: MenuMaker ROMPTR 0A9 067 InitMenuNoExit ; } * C704F

* ROMPTR 0A8 06B
* refs (1): C5332
ROMP_0A8_06B:
        {                                        * C7073
          :: PTR DirLabel: $ "STAT" ;            * C7078
          :: MenuMaker ROMPTR 0A9 060 InitMenuNoExit ; } * C7099

* ROMPTR 0A8 06C
* refs (1): C5332
ROMP_0A8_06C:
        { xBARPLOT                               * C70BD
          :: PTR Do1st/1st+: xBARPLOT xGRAPH ; } * C70C7

* ROMPTR 0A8 06D
* refs (1): C5332
ROMP_0A8_06D:
        { xHISTPLOT                              * C70E5
          :: PTR Do1st/1st+: xHISTPLOT xGRAPH ; } * C70EF

* ROMPTR 0A8 06E
* refs (1): C5332
ROMP_0A8_06E:
        { xSCATRPLOT                             * C710D
          :: PTR Do1st/1st+: xSCATRPLOT xGRAPH ; } * C7117

* ROMPTR 0A8 06F
* refs (1): C5332
ROMP_0A8_06F:
        { x>LCD                                  * C7135
          :: PTR Do1st/1st+: x>LCD SetDAsTemp ; } * C713F

* ROMPTR 0A8 070
* refs (1): C5332
ROMP_0A8_070:
        { xCLLCD                                 * C715D
          :: PTR Do1st/1st+: xCLLCD SetDAsTemp ; } * C7167

* ROMPTR 0A8 071
* refs (1): C5332
ROMP_0A8_071:
        {                                        * C7185
          :: PTR DirLabel: $ "MODL" ;            * C718A
          :: MenuMaker ROMPTR 0A9 063 InitMenuNoExit ; } * C71AB

* ROMPTR 0A8 072
* refs (1): C5332
ROMP_0A8_072:
        {                                        * C71CF
          :: PTR DirLabel: $ "ΣPAR" ;            * C71D4
          :: MenuMaker ROMPTR 0A9 062 PrgmEntry? NOTcaseDROP InitMenuNoExit * C71F5
          ;                                      * C7219
        }                                        * C721E

* ROMPTR 0A8 073
* refs (1): C5332
ROMP_0A8_073:
        {                                        * C7223
          :: PTR DirLabel: $ "SRVR" ;            * C7228
          :: MenuMaker ROMPTR 0A9 069 InitMenuNoExit ; } * C7249

* ROMPTR 0A8 074
* refs (1): C5332
ROMP_0A8_074:
        {                                        * C726D
          :: PTR DirLabel: $ "IOPAR" ;           * C7272
          :: MenuMaker ROMPTR 0A9 06A InitMenuNoExit ; } * C7295

* ROMPTR 0A8 075
* refs (1): C5332
ROMP_0A8_075:
        {                                        * C72B9
          :: PTR DirLabel: $ "PRINT" ;           * C72BE
          :: MenuMaker ROMPTR 0A9 06B InitMenuNoExit ; } * C72E1

* ROMPTR 0A8 076
* refs (1): C5332
ROMP_0A8_076:
        {                                        * C7305
          :: PTR DirLabel: $ "SERIAL" ;          * C730A
          :: MenuMaker ROMPTR 0A9 06D InitMenuNoExit ; } * C732F

* ROMPTR 0A8 077
* refs (1): C5332
ROMP_0A8_077:
        {                                        * C7353
          :: PTR DirLabel: $ "I/O" ;             * C7358
          :: MenuMaker ROMPTR 0A9 068 InitMenuNoExit ; } * C7377

* ROMPTR 0A8 078
* refs (1): C5332
ROMP_0A8_078:
        {                                        * C739B
          :: PTR DirLabel: $ "I/O" ;             * C73A0
          :: MenuMaker ROMPTR 0A9 068 NoExitAction BINT7 DoMenuPos(li,s) * C73BF
            SetDA12NoCh ;                        * C73E3
        }                                        * C73ED

* ROMPTR 0A8 079
* refs (1): C5332
ROMP_0A8_079:
        {                                        * C73F2
          :: PTR FBox/StdLbl: $ "IR" BINT33 ; BINT33 } * C73F7

* ROMPTR 0A8 07A
* refs (1): C5332
ROMP_0A8_07A:
        {                                        * C7423
          :: PTR FStd/BoxLbl: $ "ASCII" BINT35 ; BINT35 } * C7428

* ROMPTR 0A8 07B
* refs (1): C5332
ROMP_0A8_07B:
        ID IOPAR                                 * C745A

* ROMPTR 0A8 07C
* refs (1): C5332
ROMP_0A8_07C:
        { $ "RESET"                              * C746B
          :: TakeOver StdIOPAR StoIOPAR SetDA12NoCh ; } * C7484

* ROMPTR 0A8 07D
* refs (1): C5332
ROMP_0A8_07D:
        {                                        * C74A7
          :: PTR DirLabel: $ "PRTPAR" ;          * C74AC
          :: MenuMaker ROMPTR 0A9 06C InitMenuNoExit ; } * C74D1

* ROMPTR 0A8 07E
* refs (1): C5332
ROMP_0A8_07E:
        ID PRTPAR                                * C74F5

* ROMPTR 0A8 07F
* refs (1): C5332
ROMP_0A8_07F:
        { $ "RESET"                              * C7508
          :: TakeOver StdPRTPAR StoPRTPAR SetDA12NoCh ; } * C7521

* ROMPTR 0A8 080
* refs (1): C5332
ROMP_0A8_080:
        {                                        * C7544
          :: PTR DirLabel: $ "PORTS" ;           * C7549
          :: MenuMaker ROMPTR 0A9 06F InitMenuNoExit ; } * C756C

* ROMPTR 0A8 081
* refs (1): C5332
ROMP_0A8_081:
        {                                        * C7590
          :: PTR DirLabel: $ "EQLIB" ;           * C7595
          :: MenuMaker ROMPTR 0A9 071 InitMenuNoExit ; } * C75B8

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
        ENDLENGTH                                * C78D4

        LENGTH                                   * C78D4  library object without its prolog (its place is the end of the link table before): length, to #CADBD
        CON(2)  0                                * C78D9  no title
