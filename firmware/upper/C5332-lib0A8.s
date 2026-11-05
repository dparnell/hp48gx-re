* HP 48GX ROM revision R, #C5332-#C78DA: Soft-key definitions of the built-in menus
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: MKeyWHILE MKeyVPAR MKeyTOLCD MKeyTIME MKeySYM MKeySUMS MKeySTK MKeySTD MKeySTAT3 MKeySTAT2 MKeySTAT MKeySTART
* Follows on from the previous file (at #C5332 in the original ROM).

* Library 0A8: Soft-key definitions used in the menus of libraries 0A9 and 0AA: a label and an action, for submenu keys, mode toggles and reserved variables
LIB0A8:
        CON(3)  #0A8                             * C5332  library number
        REL(5)  LIB0A8.hash                      * C5335  hash table
        CON(5)  0                                * C533A  message table
        REL(5)  LIB0A8.link                      * C533F  link table
        CON(5)  0                                * C5344  config
        RPL

* ROMPTR 0A8 000
* refs (1): C5332
* Empty soft key: no label, action DoBadKey
MKeyBlank:
        { NULL$ DoBadKey }                       * C5349

* ROMPTR 0A8 001
* refs (1): C5332
* Soft key EQ: shows the current equation; stores or recalls EQ when shifted
MKeyEQ:
        { CUREQ                                  * C535D
          { CUREQ xSTEQ xRCEQ } }                * C5367

* ROMPTR 0A8 002
* refs (1): C5332
* The name ΣPAR, as a soft key
MKeyIDSIGPAR:
        ID ΣPAR                                  * C5385

* ROMPTR 0A8 003
* refs (1): C5332
* Soft key ΣDAT: recalls it; STOΣ and RCLΣ when shifted
MKeySIGDAT:
        { ID_SIGMADAT                            * C5394
          { ID_SIGMADAT xSTOSIGMA xRCLSIGMA } }  * C539E

* ROMPTR 0A8 004
* refs (1): C5332
* Soft key INFO: LocalReview
MKeyINFO:
        { $ "INFO"                               * C53BC
          :: TakeOver LocalReview ; }            * C53D3

* ROMPTR 0A8 005
* refs (1): C5332
* Soft key RECT: boxed when flag -16 is clear; runs the command
MKeyRECT:
        {                                        * C53EC
          :: PTR FStd/BoxLbl: $ "RECT" BINT16 ;  * C53F1
          :: EvalNextChkPRG XLIB RECT ; }        * C5417

* ROMPTR 0A8 006
* refs (1): C5332
* Soft key CYLIN
MKeyCYLIN:
        {                                        * C5436
          :: TakeOver $ "CYLIN" BINT15 TestSysFlag NOT BINT16 TestSysFlag * C543B  flag -15: coordinate system  flag -16: coordinate system
            AND Box/StdLabel ;                   * C5472
          :: EvalNextChkPRG XLIB CYLIN ; }       * C5481

* ROMPTR 0A8 007
* refs (1): C5332
* Soft key SPHERE
MKeySPHERE:
        {                                        * C54A0
          :: TakeOver $ "SPHERE" BINT15 TestSysFlag BINT16 TestSysFlag AND * C54A5  flag -15: coordinate system  flag -16: coordinate system
            Box/StdLabel ;                       * C54DE
          :: EvalNextChkPRG XLIB SPHERE ; }      * C54E8

* ROMPTR 0A8 008
* refs (1): C5332
* Soft key MAKE: opens menu 6
MKeyMAKE:
        {                                        * C5507
          :: PTR DirLabel: $ "MAKE" ;            * C550C
          :: MenuMaker XLIB MnuMATRXMAKE InitMenuNoExit ; } * C552D

* ROMPTR 0A8 009
* refs (1): C5332
* Soft key NORM: opens menu 7
MKeyNORM:
        {                                        * C5551
          :: PTR DirLabel: $ "NORM" ;            * C5556
          :: MenuMaker XLIB MnuMATRXNORM InitMenuNoExit ; } * C5577

* ROMPTR 0A8 00A
* refs (1): C5332
* Soft key FACTR: opens menu 8
MKeyFACTR:
        {                                        * C559B
          :: PTR DirLabel: $ "FACTR" ;           * C55A0
          :: MenuMaker XLIB MnuMATRXFACTR InitMenuNoExit ; } * C55C3

* ROMPTR 0A8 00B
* refs (1): C5332
* Soft key COL: opens menu 9
MKeyCOL:
        {                                        * C55E7
          :: PTR DirLabel: $ "COL" ;             * C55EC
          :: MenuMaker XLIB MnuMATRXCOL InitMenuNoExit ; } * C560B

* ROMPTR 0A8 00C
* refs (1): C5332
* Soft key ROW: opens menu 10
MKeyROW:
        {                                        * C562F
          :: PTR DirLabel: $ "ROW" ;             * C5634
          :: MenuMaker XLIB MnuMATRXROW InitMenuNoExit ; } * C5653

* ROMPTR 0A8 00D
* refs (1): C5332
* Soft key MATRX: opens menu 5
MKeyMATRX:
        {                                        * C5677
          :: PTR DirLabel: $ "MATRX" ;           * C567C
          :: MenuMaker XLIB MnuMTHMATRX InitMenuNoExit ; } * C569F

* ROMPTR 0A8 00E
* refs (1): C5332
* Soft key HEX: boxed when this is the base; sets it
MKeyHEX:
        {                                        * C56C3
          :: PTR BBox/StdLbl: $ "HEX" BINT16 ;   * C56C8
          :: EvalNextChkPRG xHEX ; }             * C56EC

* ROMPTR 0A8 00F
* refs (1): C5332
* Soft key DEC: boxed when this is the base; sets it
MKeyDEC:
        {                                        * C5705
          :: PTR BBox/StdLbl: $ "DEC" BINT10 ;   * C570A
          :: EvalNextChkPRG xDEC ; }             * C572E

* ROMPTR 0A8 010
* refs (1): C5332
* Soft key OCT: boxed when this is the base; sets it
MKeyOCT:
        {                                        * C5747
          :: PTR BBox/StdLbl: $ "OCT" BINT8 ;    * C574C
          :: EvalNextChkPRG xOCT ; }             * C5770

* ROMPTR 0A8 011
* refs (1): C5332
* Soft key BIN: boxed when this is the base; sets it
MKeyBIN:
        {                                        * C5789
          :: PTR BBox/StdLbl: $ "BIN" BINT2 ;    * C578E
          :: EvalNextChkPRG xBIN ; }             * C57B2

* ROMPTR 0A8 012
* refs (1): C5332
* Soft key LOGIC: opens menu 16
MKeyLOGIC:
        {                                        * C57CB
          :: PTR DirLabel: $ "LOGIC" ;           * C57D0
          :: MenuMaker XLIB MnuBASELOGIC InitMenuNoExit ; } * C57F3

* ROMPTR 0A8 013
* refs (1): C5332
* Soft key BIT: opens menu 17
MKeyBIT:
        {                                        * C5817
          :: PTR DirLabel: $ "BIT" ;             * C581C
          :: MenuMaker XLIB MnuBASEBIT InitMenuNoExit ; } * C583B

* ROMPTR 0A8 014
* refs (1): C5332
* Soft key BYTE: opens menu 18
MKeyBYTE:
        {                                        * C585F
          :: PTR DirLabel: $ "BYTE" ;            * C5864
          :: MenuMaker XLIB MnuBASEBYTE InitMenuNoExit ; } * C5885

* ROMPTR 0A8 015
* refs (1): C5332
* Soft key BASE: opens menu 15 at its second page
MKeyBASE:
        {                                        * C58A9
          :: PTR DirLabel: $ "BASE" ;            * C58AE
          :: MenuMaker XLIB MnuMTHBASE NoExitAction BINT7 DoMenuPos(li,s) * C58CF
            SetDA12NoCh ;                        * C58F3
        }                                        * C58FD

* ROMPTR 0A8 016
* refs (1): C5332
* Soft key IF: opens menu 24
MKeyIF:
        {                                        * C5902
          :: PTR DirLabel: $ "IF" ;              * C5907
          {                                      * C5924
            :: MenuMaker XLIB MnuBRCHIF InitMenuNoExit ; * C5929
            :: 3NextInCmdLine xIFEND xTHEN xIF ; * C5948
            :: 4NextInCmdLine xIFEND xELSE xTHEN xIF ; } * C5966
        }                                        * C598E

* ROMPTR 0A8 017
* refs (1): C5332
* Soft key CASE: opens menu 25
MKeyCASE:
        {                                        * C5993
          :: PTR DirLabel: $ "CASE" ;            * C5998
          {                                      * C59B9
            :: MenuMaker XLIB MnuBRCHCASE InitMenuNoExit ; * C59BE
            :: 4NextInCmdLine xIFEND xIFEND xTHENCASE xCASE ; * C59DD
            :: Echo2Macros xIFEND xTHENCASE ; }  * C5A00
        }                                        * C5A1E

* ROMPTR 0A8 018
* refs (1): C5332
* Soft key START: opens menu 26
MKeySTART:
        {                                        * C5A23
          :: PTR DirLabel: $ "START" ;           * C5A28
          {                                      * C5A4B
            :: MenuMaker XLIB MnuBRCHSTART InitMenuNoExit ; * C5A50
            :: Echo2Macros xNEXT xSTART ;        * C5A6F
            :: Echo2Macros xSTEP xSTART ; }      * C5A88
        }                                        * C5AA6

* ROMPTR 0A8 019
* refs (1): C5332
* Soft key FOR: opens menu 27
MKeyFOR:
        {                                        * C5AAB
          :: PTR DirLabel: $ "FOR" ;             * C5AB0
          {                                      * C5ACF
            :: MenuMaker XLIB MnuBRCHFOR InitMenuNoExit ; * C5AD4
            :: Echo2Macros xNEXT xSTARTVAR ;     * C5AF3
            :: Echo2Macros xSTEP xSTARTVAR ; }   * C5B0C
        }                                        * C5B2A

* ROMPTR 0A8 01A
* refs (1): C5332
* Soft key DO: opens menu 29
MKeyDO:
        {                                        * C5B2F
          :: PTR DirLabel: $ "DO" ;              * C5B34
          {                                      * C5B51
            :: MenuMaker XLIB MnuBRCHDO InitMenuNoExit ; * C5B56
            :: 3NextInCmdLine xENDDO xUNTIL xDO ; } * C5B75
        }                                        * C5B98

* ROMPTR 0A8 01B
* refs (1): C5332
* Soft key WHILE: opens menu 31
MKeyWHILE:
        {                                        * C5B9D
          :: PTR DirLabel: $ "WHILE" ;           * C5BA2
          {                                      * C5BC5
            :: MenuMaker XLIB MnuBRCHWHILE InitMenuNoExit ; * C5BCA
            :: 3NextInCmdLine xWHILEEND xREPEAT xWHILE ; } * C5BE9
        }                                        * C5C0C

* ROMPTR 0A8 01C
* refs (1): C5332
* Soft key BRCH: opens menu 23
MKeyBRCH:
        {                                        * C5C11
          :: PTR DirLabel: $ "BRCH" ;            * C5C16
          :: MenuMaker XLIB MnuPRGBRCH InitMenuNoExit ; } * C5C37

* ROMPTR 0A8 01D
* refs (1): C5332
* Soft key ELEM: opens menu 35
MKeyELEM:
        {                                        * C5C5B
          :: PTR DirLabel: $ "ELEM" ;            * C5C60
          :: MenuMaker XLIB MnuLISTELEM InitMenuNoExit ; } * C5C81

* ROMPTR 0A8 01E
* refs (1): C5332
* Soft key PROC: opens menu 36
MKeyPROC:
        {                                        * C5CA5
          :: PTR DirLabel: $ "PROC" ;            * C5CAA
          :: MenuMaker XLIB MnuLISTPROC InitMenuNoExit ; } * C5CCB

* ROMPTR 0A8 01F
* refs (1): C5332
* Soft key LIST: opens menu 34
MKeyLIST:
        {                                        * C5CEF
          :: PTR DirLabel: $ "LIST" ;            * C5CF4
          :: MenuMaker XLIB MnuPRGLIST InitMenuNoExit ; } * C5D15

* ROMPTR 0A8 020
* refs (1): C5332
* Soft key DBUG
MKeyDBUG:
        { $ "DBUG" xDBUG }                       * C5D39

* ROMPTR 0A8 021
* refs (1): C5332
* Soft key SST
MKeySST:
        { $ "SST" sst }                          * C5D5A

* ROMPTR 0A8 022
* refs (1): C5332
* Soft key SST↓
MKeySSTD:
        { $ "SST↓" sstdown }                     * C5D79

* ROMPTR 0A8 023
* refs (1): C5332
* Soft key NEXT
MKeyNEXT:
        { $ "NEXT" next }                        * C5D9A

* ROMPTR 0A8 024
* refs (1): C5332
* Soft key IFERR: opens menu 60
MKeyIFERR:
        {                                        * C5DBB
          :: PTR DirLabel: $ "IFERR" ;           * C5DC0
          {                                      * C5DE3
            :: MenuMaker XLIB MnuERRORIFERR InitMenuNoExit ; * C5DE8
            :: 3NextInCmdLine xIFEND xERRTHEN xIFERR ; * C5E07
            :: 4NextInCmdLine xIFEND xELSE xERRTHEN xIFERR ; } * C5E25
        }                                        * C5E4D

* ROMPTR 0A8 025
* refs (1): C5332
* Soft key ERROR: opens menu 61
MKeyERROR:
        {                                        * C5E52
          :: PTR DirLabel: $ "ERROR" ;           * C5E57
          :: MenuMaker XLIB MnuPRGERROR InitMenuNoExit ; } * C5E7A

* ROMPTR 0A8 026
* refs (1): C5332
* Soft key FMT: opens menu 64
MKeyFMT:
        {                                        * C5E9E
          :: PTR DirLabel: $ "FMT" ;             * C5EA3
          :: MenuMaker XLIB MnuMODESFMT InitMenuNoExit ; } * C5EC2

* ROMPTR 0A8 027
* refs (1): C5332
* Soft key ANGLE: opens menu 65
MKeyANGLE:
        {                                        * C5EE6
          :: PTR DirLabel: $ "ANGLE" ;           * C5EEB
          :: MenuMaker XLIB MnuMODESANGLE InitMenuNoExit ; } * C5F0E

* ROMPTR 0A8 028
* refs (1): C5332
* Soft key FLAG: opens menu 66
MKeyFLAG:
        {                                        * C5F32
          :: PTR DirLabel: $ "FLAG" ;            * C5F37
          :: MenuMaker XLIB MnuMODESFLAG InitMenuNoExit ; } * C5F58

* ROMPTR 0A8 029
* refs (1): C5332
* Soft key KEYS: opens menu 67
MKeyKEYS:
        {                                        * C5F7C
          :: PTR DirLabel: $ "KEYS" ;            * C5F81
          :: MenuMaker XLIB MnuMODESKEYS InitMenuNoExit ; } * C5FA2

* ROMPTR 0A8 02A
* refs (1): C5332
* Soft key MENU: opens menu 68
MKeyMENU:
        {                                        * C5FC6
          :: PTR DirLabel: $ "MENU" ;            * C5FCB
          :: MenuMaker XLIB MnuMODESMENU InitMenuNoExit ; } * C5FEC

* ROMPTR 0A8 02B
* refs (1): C5332
* Soft key MISC: opens menu 69
MKeyMISC:
        {                                        * C6010
          :: PTR DirLabel: $ "MISC" ;            * C6015
          :: MenuMaker XLIB MnuMODESMISC InitMenuNoExit ; } * C6036

* ROMPTR 0A8 02C
* refs (1): C5332
* Soft key MODES: opens menu 63
MKeyMODES:
        {                                        * C605A
          :: PTR DirLabel: $ "MODES" ;           * C605F
          :: MenuMaker XLIB MnuMODES InitMenuNoExit ; } * C6082

* ROMPTR 0A8 02D
* refs (1): C5332
* Soft key STD: boxed when this is the number format; sets it
MKeySTD:
        {                                        * C60A6
          :: PTR MBox/StdLbl: $ "STD" BINT0 ;    * C60AB
          :: EvalNextChkPRG xSTD ; }             * C60CF

* ROMPTR 0A8 02E
* refs (1): C5332
* Soft key FIX: boxed when this is the number format; sets it
MKeyFIX:
        {                                        * C60E8
          :: PTR MBox/StdLbl: $ "FIX" BINT1 ; xFIX } * C60ED

* ROMPTR 0A8 02F
* refs (1): C5332
* Soft key SCI: boxed when this is the number format; sets it
MKeySCI:
        {                                        * C611B
          :: PTR MBox/StdLbl: $ "SCI" BINT2 ; xSCI } * C6120

* ROMPTR 0A8 030
* refs (1): C5332
* Soft key ENG: boxed when this is the number format; sets it
MKeyENG:
        {                                        * C614E
          :: PTR MBox/StdLbl: $ "ENG" BINT3 ; xENG } * C6153

* ROMPTR 0A8 031
* refs (1): C5332
* Soft key FM,: boxed when flag -51 is set; toggles it
MKeyFM:
        {                                        * C6181
          :: PTR FBox/StdLbl: $ "FM," BINT51 ; BINT51 } * C6186

* ROMPTR 0A8 032
* refs (1): C5332
* Soft key ML: boxed when flag -52 is clear; toggles it
MKeyML:
        {                                        * C61B4
          :: PTR FStd/BoxLbl: $ "ML" BINT52 ; BINT52 } * C61B9

* ROMPTR 0A8 033
* refs (1): C5332
* Soft key DEG: boxed in degrees mode; sets it
MKeyDEG:
        {                                        * C61E5
          :: PTR Box/StdLbl: $ "DEG" DEG? ;      * C61EA
          :: EvalNextChkPRG xDEG ; }             * C620E

* ROMPTR 0A8 034
* refs (1): C5332
* Soft key RAD: boxed in radians mode; sets it
MKeyRAD:
        {                                        * C6227
          :: PTR Box/StdLbl: $_RAD RAD? ;        * C622C
          :: EvalNextChkPRG xRAD ; }             * C6245

* ROMPTR 0A8 035
* refs (1): C5332
* Soft key GRAD: boxed in grads mode; sets it
MKeyGRAD:
        {                                        * C625E
          :: TakeOver $_GRAD rad?;fs?(-18)? NOT ORNOT Box/StdLabel ; * C6263
          :: EvalNextChkPRG xGRAD ; }            * C628B

* ROMPTR 0A8 036
* refs (1): C5332
* Soft key RESET of the FLAGS menu
MKeyRESETFLAGS:
        { $ "RESET"                              * C62A4
          :: TakeOver DefaultSysFlags ; }        * C62BD

* ROMPTR 0A8 037
* refs (1): C5332
* The name CST, as a soft key
MKeyIDCST:
        ID CST                                   * C62D6

* ROMPTR 0A8 038
* refs (1): C5332
* Soft key BEEP: boxed when flag -56 is clear; toggles it
MKeyBEEP:
        {                                        * C62E3
          :: PTR FStd/BoxLbl: $ "BEEP" BINT56 ; BINT56 } * C62E8

* ROMPTR 0A8 039
* refs (1): C5332
* Soft key CLK: boxed when flag -40 is set; toggles it
MKeyCLK:
        {                                        * C6318
          :: PTR FBox/StdLbl: $ "CLK" BINT40 ; BINT40 } * C631D

* ROMPTR 0A8 03A
* refs (1): C5332
* Soft key SYM: boxed when flag -3 is clear; toggles it
MKeySYM:
        {                                        * C634B
          :: PTR FStd/BoxLbl: $ "SYM" BINT3 ; BINT3 } * C6350

* ROMPTR 0A8 03B
* refs (1): C5332
* Soft key STK: boxed while last-stack saving is on; toggles it
MKeySTK:
        {                                        * C637E
          :: PTR Box/StdLbl: $ "STK" UNDO_ON? ;  * C6383
          :: TakeOver SuspendOK? NOTcase DoBadKey * C63A7
            UNDO_ON? case                        * C63C0
            :: ABND ERRSET UNDO_OFF ;            * C63CA
            UNDO_ON SAVESTACK ERRSET ;           * C63E3
        }                                        * C63F7

* ROMPTR 0A8 03C
* refs (1): C5332
* Soft key ARG: boxed when flag -55 is clear; toggles it
MKeyARG:
        {                                        * C63FC
          :: PTR FStd/BoxLbl: $ "ARG" BINT55 ; BINT55 } * C6401

* ROMPTR 0A8 03D
* refs (1): C5332
* Soft key CMD: boxed while the command history is on; toggles it
MKeyCMD:
        {                                        * C642F
          :: PTR Box/StdLbl: $ "CMD" HISTON? ;   * C6434
          :: TakeOver HISTON? case DisLastCmd!   * C6458
            UnableLastCmd ;                      * C6471
        }                                        * C647B

* ROMPTR 0A8 03E
* refs (1): C5332
* Soft key INFO?: boxed when flag -58 is clear; toggles it
MKeyINFOQ:
        {                                        * C6480
          :: PTR FStd/BoxLbl: $ "INFO?" BINT58 ; BINT58 } * C6485

* ROMPTR 0A8 03F
* refs (1): C5332
* Soft key DIR: opens menu 71
MKeyDIR:
        {                                        * C64B7
          :: PTR DirLabel: $ "DIR" ;             * C64BC
          :: MenuMaker XLIB MnuMEMORYDIR InitMenuNoExit ; } * C64DB

* ROMPTR 0A8 040
* refs (1): C5332
* Soft key ARITH: opens menu 72
MKeyARITH:
        {                                        * C64FF
          :: PTR DirLabel: $ "ARITH" ;           * C6504
          :: MenuMaker XLIB MnuMEMORYARITH InitMenuNoExit ; } * C6527

* ROMPTR 0A8 041
* refs (1): C5332
* Soft key MEM: opens menu 70
MKeyMEM:
        {                                        * C654B
          :: PTR DirLabel: $ "MEM" ;             * C6550
          :: MenuMaker XLIB MnuMEMORY InitMenuNoExit ; } * C656F

* ROMPTR 0A8 042
* refs (1): C5332
* Soft key DRPN
MKeyDRPN:
        { $ "DRPN" xDROPN }                      * C6593

* ROMPTR 0A8 043
* refs (1): C5332
* Soft key SOLVE: opens menu 74
MKeySOLVE:
        {                                        * C65B4
          :: PTR DirLabel: $ "SOLVE" ;           * C65B9
          :: MenuMaker XLIB MnuSOLVE InitMenuNoExit ; } * C65DC

* ROMPTR 0A8 044
* refs (1): C5332
* Soft key SOLVR: opens menu 30
MKeySOLVR:
        {                                        * C6600
          :: PTR DirLabel: $ "SOLVR" ;           * C6605
          :: MenuMaker XLIB MnuSOLVR InitMenuNoExit ; } * C6628

* ROMPTR 0A8 045
* refs (1): C5332
* Soft key SOLVR: opens menu 80
MKeySOLVRtvm:
        {                                        * C664C
          :: PTR DirLabel: $ "SOLVR" ;           * C6651
          :: MenuMaker XLIB MnuTVMSOLVR InitMenuNoExit ; } * C6674

* ROMPTR 0A8 046
* refs (1): C5332
* Soft key AMRT: AMORT; shifted, the amortization display
MKeyAMRT:
        { $ "AMRT"                               * C6698
          :: PTR Do1st/2nd+: XLIB AMORT XLIB AMORTTagged ; } * C66AF

* ROMPTR 0A8 047
* refs (1): C5332
* Soft key P/YR of the TVM menu
MKeyPYR:
        { PYR                                    * C66D9
          {                                      * C66E3
            :: ' PYR DoMenuKeyNS ; DoBadKey      * C66E8
            :: ' PYR DoMenuKeyRS ; }             * C6706
        }                                        * C6724

* ROMPTR 0A8 048
* refs (1): C5332
* Soft key BEG: boxed when flag -14 is set; toggles it
MKeyBEG:
        {                                        * C6729
          :: PTR FBox/StdLbl: $ "BEG" BINT14 ; BINT14 } * C672E

* ROMPTR 0A8 049
* refs (1): C5332
* Soft key PTYPE: opens menu 82
MKeyPTYPE:
        {                                        * C675C
          :: PTR DirLabel: $ "PTYPE" ;           * C6761
          :: MenuMaker XLIB MnuPLOTPTYPE InitMenuNoExit ; } * C6784

* ROMPTR 0A8 04A
* refs (1): C5332
* Soft key PPAR: opens menu 83
MKeyPPAR:
        {                                        * C67A8
          :: PTR DirLabel: $ "PPAR" ;            * C67AD
          :: MenuMaker XLIB MnuPLOTPPAR InitMenuNoExit ; } * C67CE

* ROMPTR 0A8 04B
* refs (1): C5332
* Soft key DRAW; shifted, DRAW then GRAPH
MKeyDRAW:
        { xDRAW                                  * C67F2
          :: PTR Do1st/1st+: xDRAW xGRAPH ; }    * C67FC

* ROMPTR 0A8 04C
* refs (1): C5332
* Soft key 3D: opens menu 84
MKey3D:
        {                                        * C681A
          :: PTR DirLabel: $ "3D" ;              * C681F
          :: MenuMaker XLIB MnuPLOT3D InitMenuNoExit ; } * C683C

* ROMPTR 0A8 04D
* refs (1): C5332
* Soft key STAT: opens menu 87
MKeySTAT:
        {                                        * C6860
          :: PTR DirLabel: $ "STAT" ;            * C6865
          :: MenuMaker XLIB MnuPLOTSTAT InitMenuNoExit ; } * C6886

* ROMPTR 0A8 04E
* refs (1): C5332
* Soft key FLAG: opens menu 92
MKeyFLAG2:
        {                                        * C68AA
          :: PTR DirLabel: $ "FLAG" ;            * C68AF
          :: MenuMaker XLIB MnuPLOTFLAG InitMenuNoExit ; } * C68D0

* ROMPTR 0A8 04F
* refs (1): C5332
* Soft key PLOT: opens menu 81
MKeyPLOT:
        {                                        * C68F4
          :: PTR DirLabel: $ "PLOT" ;            * C68F9
          :: MenuMaker XLIB MnuPLOT InitMenuNoExit ; } * C691A

* ROMPTR 0A8 050
* refs (1): C5332
* Soft key PLOT: opens menu 81 at its second page
MKeyPLOT2:
        {                                        * C693E
          :: PTR DirLabel: $ "PLOT" ;            * C6943
          :: MenuMaker XLIB MnuPLOT NoExitAction BINT7 DoMenuPos(li,s) * C6964
            SetDA12NoCh ;                        * C6988
        }                                        * C6992

* ROMPTR 0A8 051
* refs (1): C5332
* Soft key PLOT: opens menu 81; not during program entry
MKeyPLOT3:
        {                                        * C6997
          :: PTR DirLabel: $ "PLOT" ;            * C699C
          :: MenuMaker XLIB MnuPLOT PrgmEntry? NOTcaseDROP InitMenuNoExit * C69BD
          ;                                      * C69E1
        }                                        * C69E6

* ROMPTR 0A8 052
* refs (1): C5332
* Soft key RESET of the PPAR menu
MKeyRESETPPAR:
        { $ "RESET" ResetPICT }                  * C69EB

* ROMPTR 0A8 053
* refs (1): C5332
* The name PPAR, as a soft key
MKeyIDPPAR:
        ID PPAR                                  * C6A0E

* ROMPTR 0A8 054
* refs (1): C5332
* Soft key PTYPE: opens menu 85
MKeyPTYPE2:
        {                                        * C6A1D
          :: PTR DirLabel: $ "PTYPE" ;           * C6A22
          :: MenuMaker XLIB Mnu3DPTYPE InitMenuNoExit ; } * C6A45

* ROMPTR 0A8 055
* refs (1): C5332
* Soft key VPAR: opens menu 86
MKeyVPAR:
        {                                        * C6A69
          :: PTR DirLabel: $ "VPAR" ;            * C6A6E
          :: MenuMaker XLIB Mnu3DVPAR InitMenuNoExit ; } * C6A8F

* ROMPTR 0A8 056
* refs (1): C5332
* Soft key 3D: opens menu 84; not during program entry
MKey3D2:
        {                                        * C6AB3
          :: PTR DirLabel: $ "3D" ;              * C6AB8
          :: MenuMaker XLIB MnuPLOT3D PrgmEntry? NOTcaseDROP InitMenuNoExit * C6AD5
          ;                                      * C6AF9
        }                                        * C6AFE

* ROMPTR 0A8 057
* refs (1): C5332
* The name VPAR, as a soft key
MKeyIDVPAR:
        ID VPAR                                  * C6B03

* ROMPTR 0A8 058
* refs (1): C5332
* Soft key RESET of the VPAR menu
MKeyRESETVPAR:
        { $ "RESET"                              * C6B12
          :: TakeOver XLIB VparDefaults XLIB VparSto ; } * C6B2B

* ROMPTR 0A8 059
* refs (1): C5332
* Soft key PTYPE: opens menu 88
MKeyPTYPE3:
        {                                        * C6B55
          :: PTR DirLabel: $ "PTYPE" ;           * C6B5A
          :: MenuMaker XLIB MnuSTATPTYPE InitMenuNoExit ; } * C6B7D

* ROMPTR 0A8 05A
* refs (1): C5332
* Soft key DATA: opens menu 91
MKeyDATA:
        {                                        * C6BA1
          :: PTR DirLabel: $ "DATA" ;            * C6BA6
          :: MenuMaker XLIB MnuSTATDATA InitMenuNoExit ; } * C6BC7

* ROMPTR 0A8 05B
* refs (1): C5332
* Soft key ΣPAR: opens menu 89
MKeySIGPAR:
        {                                        * C6BEB
          :: PTR DirLabel: $ "ΣPAR" ;            * C6BF0
          :: MenuMaker XLIB MnuSTATSIGPAR InitMenuNoExit ; } * C6C11

* ROMPTR 0A8 05C
* refs (1): C5332
* Soft key STAT: opens menu 87; not during program entry
MKeySTAT2:
        {                                        * C6C35
          :: PTR DirLabel: $ "STAT" ;            * C6C3A
          :: MenuMaker XLIB MnuPLOTSTAT PrgmEntry? NOTcaseDROP * C6C5B
            InitMenuNoExit                       * C6C7A
          ;                                      * C6C7F
        }                                        * C6C84

* ROMPTR 0A8 05D
* refs (1): C5332
* Soft key MODL: opens menu 90
MKeyMODL:
        {                                        * C6C89
          :: PTR DirLabel: $ "MODL" ;            * C6C8E
          :: MenuMaker XLIB MnuSIGPARMODL InitMenuNoExit ; } * C6CAF

* ROMPTR 0A8 05E
* refs (1): C5332
* Soft key RESET of the ΣPAR menu
MKeyRESETSIGPAR:
        { $ "RESET"                              * C6CD3
          :: TakeOver                            * C6CEC
            { %1 %2 %0_2A2B4 %0_2A2B4 xLINFIT } ' äPAR XEQSTOID ; * C6CF6
        }                                        * C6D2D

* ROMPTR 0A8 05F
* refs (1): C5332
* Soft key ΣPAR: opens menu 89; not during program entry
MKeySIGPAR2:
        {                                        * C6D32
          :: PTR DirLabel: $ "ΣPAR" ;            * C6D37
          :: MenuMaker XLIB MnuSTATSIGPAR PrgmEntry? NOTcaseDROP * C6D58
            InitMenuNoExit                       * C6D77
          ;                                      * C6D7C
        }                                        * C6D81

* ROMPTR 0A8 060
* refs (1): C5332
* Soft key AXES: boxed when flag -29 is clear; toggles it
MKeyAXES:
        {                                        * C6D86
          :: PTR FStd/BoxLbl: $ "AXES" BINT29 ; BINT29 } * C6D8B

* ROMPTR 0A8 061
* refs (1): C5332
* Soft key CNCT: boxed when flag -31 is clear; toggles it
MKeyCNCT:
        {                                        * C6DBB
          :: PTR FStd/BoxLbl: $ "CNCT" BINT31 ; BINT31 } * C6DC0

* ROMPTR 0A8 062
* refs (1): C5332
* Soft key SIMU: boxed when flag -28 is set; toggles it
MKeySIMU:
        {                                        * C6DF0
          :: PTR FBox/StdLbl: $ "SIMU" BINT28 ; BINT28 } * C6DF5

* ROMPTR 0A8 063
* refs (1): C5332
* Soft key ALRM: opens menu 95
MKeyALRM:
        {                                        * C6E25
          :: PTR DirLabel: $ "ALRM" ;            * C6E2A
          :: MenuMaker XLIB MnuTIMEALRM InitMenuNoExit ; } * C6E4B

* ROMPTR 0A8 064
* refs (1): C5332
* Soft key TIME: opens menu 94
MKeyTIME:
        {                                        * C6E6F
          :: PTR DirLabel: $ "TIME" ;            * C6E74
          :: MenuMaker XLIB MnuTIME InitMenuNoExit ; } * C6E95

* ROMPTR 0A8 065
* refs (1): C5332
* Soft key DATA: opens menu 97
MKeyDATA2:
        {                                        * C6EB9
          :: PTR DirLabel: $ "DATA" ;            * C6EBE
          :: MenuMaker XLIB MnuSTATDATA2 InitMenuNoExit ; } * C6EDF

* ROMPTR 0A8 066
* refs (1): C5332
* Soft key ΣPAR: opens menu 98
MKeySIGPAR3:
        {                                        * C6F03
          :: PTR DirLabel: $ "ΣPAR" ;            * C6F08
          :: MenuMaker XLIB MnuSTATSIGPAR2 InitMenuNoExit ; } * C6F29

* ROMPTR 0A8 067
* refs (1): C5332
* Soft key 1VAR: opens menu 100
MKey1VAR:
        {                                        * C6F4D
          :: PTR DirLabel: $ "1VAR" ;            * C6F52
          :: MenuMaker XLIB MnuSTAT1VAR InitMenuNoExit ; } * C6F73

* ROMPTR 0A8 068
* refs (1): C5332
* Soft key PLOT: opens menu 101
MKeyPLOT4:
        {                                        * C6F97
          :: PTR DirLabel: $ "PLOT" ;            * C6F9C
          :: MenuMaker XLIB MnuSTATPLOT InitMenuNoExit ; } * C6FBD

* ROMPTR 0A8 069
* refs (1): C5332
* Soft key FIT: opens menu 102
MKeyFIT:
        {                                        * C6FE1
          :: PTR DirLabel: $ "FIT" ;             * C6FE6
          :: MenuMaker XLIB MnuSTATFIT InitMenuNoExit ; } * C7005

* ROMPTR 0A8 06A
* refs (1): C5332
* Soft key SUMS: opens menu 103
MKeySUMS:
        {                                        * C7029
          :: PTR DirLabel: $ "SUMS" ;            * C702E
          :: MenuMaker XLIB MnuSTATSUMS InitMenuNoExit ; } * C704F

* ROMPTR 0A8 06B
* refs (1): C5332
* Soft key STAT: opens menu 96
MKeySTAT3:
        {                                        * C7073
          :: PTR DirLabel: $ "STAT" ;            * C7078
          :: MenuMaker XLIB MnuSTAT InitMenuNoExit ; } * C7099

* ROMPTR 0A8 06C
* refs (1): C5332
* Soft key BARPLOT; shifted, then GRAPH
MKeyBARPLOT:
        { xBARPLOT                               * C70BD
          :: PTR Do1st/1st+: xBARPLOT xGRAPH ; } * C70C7

* ROMPTR 0A8 06D
* refs (1): C5332
* Soft key HISTPLOT; shifted, then GRAPH
MKeyHISTPLOT:
        { xHISTPLOT                              * C70E5
          :: PTR Do1st/1st+: xHISTPLOT xGRAPH ; } * C70EF

* ROMPTR 0A8 06E
* refs (1): C5332
* Soft key SCATRPLOT; shifted, then GRAPH
MKeySCATRPLOT:
        { xSCATRPLOT                             * C710D
          :: PTR Do1st/1st+: xSCATRPLOT xGRAPH ; } * C7117

* ROMPTR 0A8 06F
* refs (1): C5332
* Soft key →LCD; shifted, keeps the display
MKeyTOLCD:
        { x>LCD                                  * C7135
          :: PTR Do1st/1st+: x>LCD SetDAsTemp ; } * C713F

* ROMPTR 0A8 070
* refs (1): C5332
* Soft key CLLCD; shifted, keeps the display
MKeyCLLCD:
        { xCLLCD                                 * C715D
          :: PTR Do1st/1st+: xCLLCD SetDAsTemp ; } * C7167

* ROMPTR 0A8 071
* refs (1): C5332
* Soft key MODL: opens menu 99
MKeyMODL2:
        {                                        * C7185
          :: PTR DirLabel: $ "MODL" ;            * C718A
          :: MenuMaker XLIB MnuSIGPARMODL2 InitMenuNoExit ; } * C71AB

* ROMPTR 0A8 072
* refs (1): C5332
* Soft key ΣPAR: opens menu 98; not during program entry
MKeySIGPAR4:
        {                                        * C71CF
          :: PTR DirLabel: $ "ΣPAR" ;            * C71D4
          :: MenuMaker XLIB MnuSTATSIGPAR2 PrgmEntry? NOTcaseDROP * C71F5
            InitMenuNoExit                       * C7214
          ;                                      * C7219
        }                                        * C721E

* ROMPTR 0A8 073
* refs (1): C5332
* Soft key SRVR: opens menu 105
MKeySRVR:
        {                                        * C7223
          :: PTR DirLabel: $ "SRVR" ;            * C7228
          :: MenuMaker XLIB MnuIOSRVR InitMenuNoExit ; } * C7249

* ROMPTR 0A8 074
* refs (1): C5332
* Soft key IOPAR: opens menu 106
MKeyIOPAR:
        {                                        * C726D
          :: PTR DirLabel: $ "IOPAR" ;           * C7272
          :: MenuMaker XLIB MnuIOIOPAR InitMenuNoExit ; } * C7295

* ROMPTR 0A8 075
* refs (1): C5332
* Soft key PRINT: opens menu 107
MKeyPRINT:
        {                                        * C72B9
          :: PTR DirLabel: $ "PRINT" ;           * C72BE
          :: MenuMaker XLIB MnuIOPRINT InitMenuNoExit ; } * C72E1

* ROMPTR 0A8 076
* refs (1): C5332
* Soft key SERIAL: opens menu 109
MKeySERIAL:
        {                                        * C7305
          :: PTR DirLabel: $ "SERIAL" ;          * C730A
          :: MenuMaker XLIB MnuIOSERIAL InitMenuNoExit ; } * C732F

* ROMPTR 0A8 077
* refs (1): C5332
* Soft key I/O: opens menu 104
MKeyIO:
        {                                        * C7353
          :: PTR DirLabel: $ "I/O" ;             * C7358
          :: MenuMaker XLIB MnuIO InitMenuNoExit ; } * C7377

* ROMPTR 0A8 078
* refs (1): C5332
* Soft key I/O: opens menu 104 at its second page
MKeyIO2:
        {                                        * C739B
          :: PTR DirLabel: $ "I/O" ;             * C73A0
          :: MenuMaker XLIB MnuIO NoExitAction BINT7 DoMenuPos(li,s) * C73BF
            SetDA12NoCh ;                        * C73E3
        }                                        * C73ED

* ROMPTR 0A8 079
* refs (1): C5332
* Soft key IR: boxed when flag -33 is set; toggles it
MKeyIR:
        {                                        * C73F2
          :: PTR FBox/StdLbl: $ "IR" BINT33 ; BINT33 } * C73F7

* ROMPTR 0A8 07A
* refs (1): C5332
* Soft key ASCII: boxed when flag -35 is clear; toggles it
MKeyASCII:
        {                                        * C7423
          :: PTR FStd/BoxLbl: $ "ASCII" BINT35 ; BINT35 } * C7428

* ROMPTR 0A8 07B
* refs (1): C5332
* The name IOPAR, as a soft key
MKeyIDIOPAR:
        ID IOPAR                                 * C745A

* ROMPTR 0A8 07C
* refs (1): C5332
* Soft key RESET of the IOPAR menu
MKeyRESETIOPAR:
        { $ "RESET"                              * C746B
          :: TakeOver StdIOPAR StoIOPAR SetDA12NoCh ; } * C7484

* ROMPTR 0A8 07D
* refs (1): C5332
* Soft key PRTPAR: opens menu 108
MKeyPRTPAR:
        {                                        * C74A7
          :: PTR DirLabel: $ "PRTPAR" ;          * C74AC
          :: MenuMaker XLIB MnuPRINTPRTPAR InitMenuNoExit ; } * C74D1

* ROMPTR 0A8 07E
* refs (1): C5332
* The name PRTPAR, as a soft key
MKeyIDPRTPAR:
        ID PRTPAR                                * C74F5

* ROMPTR 0A8 07F
* refs (1): C5332
* Soft key RESET of the PRTPAR menu
MKeyRESETPRTPAR:
        { $ "RESET"                              * C7508
          :: TakeOver StdPRTPAR StoPRTPAR SetDA12NoCh ; } * C7521

* ROMPTR 0A8 080
* refs (1): C5332
* Soft key PORTS: opens menu 111
MKeyPORTS:
        {                                        * C7544
          :: PTR DirLabel: $ "PORTS" ;           * C7549
          :: MenuMaker XLIB MnuLIBRARYPORTS InitMenuNoExit ; } * C756C

* ROMPTR 0A8 081
* refs (1): C5332
* Soft key EQLIB: opens menu 113
MKeyEQLIB:
        {                                        * C7590
          :: PTR DirLabel: $ "EQLIB" ;           * C7595
          :: MenuMaker XLIB MnuEQLIB InitMenuNoExit ; } * C75B8

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
        REL(5)  LIB0A8.hash.L1                   * C7636  end of the names
LIB0A8.hash.L1:
        CON(5)  0                                * C763B  command 000 has no name
        ENDLENGTH                                * C7640

LIB0A8.link:
        CON(5)  DOHSTR                           * C7640  link table of library 0A8
        LENGTH                                   * C7645  length, to #C78D4
        REL(5)  MKeyBlank                        * C764A  000 
        REL(5)  MKeyEQ                           * C764F  001 
        REL(5)  MKeyIDSIGPAR                     * C7654  002 
        REL(5)  MKeySIGDAT                       * C7659  003 
        REL(5)  MKeyINFO                         * C765E  004 
        REL(5)  MKeyRECT                         * C7663  005 
        REL(5)  MKeyCYLIN                        * C7668  006 
        REL(5)  MKeySPHERE                       * C766D  007 
        REL(5)  MKeyMAKE                         * C7672  008 
        REL(5)  MKeyNORM                         * C7677  009 
        REL(5)  MKeyFACTR                        * C767C  00A 
        REL(5)  MKeyCOL                          * C7681  00B 
        REL(5)  MKeyROW                          * C7686  00C 
        REL(5)  MKeyMATRX                        * C768B  00D 
        REL(5)  MKeyHEX                          * C7690  00E 
        REL(5)  MKeyDEC                          * C7695  00F 
        REL(5)  MKeyOCT                          * C769A  010 
        REL(5)  MKeyBIN                          * C769F  011 
        REL(5)  MKeyLOGIC                        * C76A4  012 
        REL(5)  MKeyBIT                          * C76A9  013 
        REL(5)  MKeyBYTE                         * C76AE  014 
        REL(5)  MKeyBASE                         * C76B3  015 
        REL(5)  MKeyIF                           * C76B8  016 
        REL(5)  MKeyCASE                         * C76BD  017 
        REL(5)  MKeySTART                        * C76C2  018 
        REL(5)  MKeyFOR                          * C76C7  019 
        REL(5)  MKeyDO                           * C76CC  01A 
        REL(5)  MKeyWHILE                        * C76D1  01B 
        REL(5)  MKeyBRCH                         * C76D6  01C 
        REL(5)  MKeyELEM                         * C76DB  01D 
        REL(5)  MKeyPROC                         * C76E0  01E 
        REL(5)  MKeyLIST                         * C76E5  01F 
        REL(5)  MKeyDBUG                         * C76EA  020 
        REL(5)  MKeySST                          * C76EF  021 
        REL(5)  MKeySSTD                         * C76F4  022 
        REL(5)  MKeyNEXT                         * C76F9  023 
        REL(5)  MKeyIFERR                        * C76FE  024 
        REL(5)  MKeyERROR                        * C7703  025 
        REL(5)  MKeyFMT                          * C7708  026 
        REL(5)  MKeyANGLE                        * C770D  027 
        REL(5)  MKeyFLAG                         * C7712  028 
        REL(5)  MKeyKEYS                         * C7717  029 
        REL(5)  MKeyMENU                         * C771C  02A 
        REL(5)  MKeyMISC                         * C7721  02B 
        REL(5)  MKeyMODES                        * C7726  02C 
        REL(5)  MKeySTD                          * C772B  02D 
        REL(5)  MKeyFIX                          * C7730  02E 
        REL(5)  MKeySCI                          * C7735  02F 
        REL(5)  MKeyENG                          * C773A  030 
        REL(5)  MKeyFM                           * C773F  031 
        REL(5)  MKeyML                           * C7744  032 
        REL(5)  MKeyDEG                          * C7749  033 
        REL(5)  MKeyRAD                          * C774E  034 
        REL(5)  MKeyGRAD                         * C7753  035 
        REL(5)  MKeyRESETFLAGS                   * C7758  036 
        REL(5)  MKeyIDCST                        * C775D  037 
        REL(5)  MKeyBEEP                         * C7762  038 
        REL(5)  MKeyCLK                          * C7767  039 
        REL(5)  MKeySYM                          * C776C  03A 
        REL(5)  MKeySTK                          * C7771  03B 
        REL(5)  MKeyARG                          * C7776  03C 
        REL(5)  MKeyCMD                          * C777B  03D 
        REL(5)  MKeyINFOQ                        * C7780  03E 
        REL(5)  MKeyDIR                          * C7785  03F 
        REL(5)  MKeyARITH                        * C778A  040 
        REL(5)  MKeyMEM                          * C778F  041 
        REL(5)  MKeyDRPN                         * C7794  042 
        REL(5)  MKeySOLVE                        * C7799  043 
        REL(5)  MKeySOLVR                        * C779E  044 
        REL(5)  MKeySOLVRtvm                     * C77A3  045 
        REL(5)  MKeyAMRT                         * C77A8  046 
        REL(5)  MKeyPYR                          * C77AD  047 
        REL(5)  MKeyBEG                          * C77B2  048 
        REL(5)  MKeyPTYPE                        * C77B7  049 
        REL(5)  MKeyPPAR                         * C77BC  04A 
        REL(5)  MKeyDRAW                         * C77C1  04B 
        REL(5)  MKey3D                           * C77C6  04C 
        REL(5)  MKeySTAT                         * C77CB  04D 
        REL(5)  MKeyFLAG2                        * C77D0  04E 
        REL(5)  MKeyPLOT                         * C77D5  04F 
        REL(5)  MKeyPLOT2                        * C77DA  050 
        REL(5)  MKeyPLOT3                        * C77DF  051 
        REL(5)  MKeyRESETPPAR                    * C77E4  052 
        REL(5)  MKeyIDPPAR                       * C77E9  053 
        REL(5)  MKeyPTYPE2                       * C77EE  054 
        REL(5)  MKeyVPAR                         * C77F3  055 
        REL(5)  MKey3D2                          * C77F8  056 
        REL(5)  MKeyIDVPAR                       * C77FD  057 
        REL(5)  MKeyRESETVPAR                    * C7802  058 
        REL(5)  MKeyPTYPE3                       * C7807  059 
        REL(5)  MKeyDATA                         * C780C  05A 
        REL(5)  MKeySIGPAR                       * C7811  05B 
        REL(5)  MKeySTAT2                        * C7816  05C 
        REL(5)  MKeyMODL                         * C781B  05D 
        REL(5)  MKeyRESETSIGPAR                  * C7820  05E 
        REL(5)  MKeySIGPAR2                      * C7825  05F 
        REL(5)  MKeyAXES                         * C782A  060 
        REL(5)  MKeyCNCT                         * C782F  061 
        REL(5)  MKeySIMU                         * C7834  062 
        REL(5)  MKeyALRM                         * C7839  063 
        REL(5)  MKeyTIME                         * C783E  064 
        REL(5)  MKeyDATA2                        * C7843  065 
        REL(5)  MKeySIGPAR3                      * C7848  066 
        REL(5)  MKey1VAR                         * C784D  067 
        REL(5)  MKeyPLOT4                        * C7852  068 
        REL(5)  MKeyFIT                          * C7857  069 
        REL(5)  MKeySUMS                         * C785C  06A 
        REL(5)  MKeySTAT3                        * C7861  06B 
        REL(5)  MKeyBARPLOT                      * C7866  06C 
        REL(5)  MKeyHISTPLOT                     * C786B  06D 
        REL(5)  MKeySCATRPLOT                    * C7870  06E 
        REL(5)  MKeyTOLCD                        * C7875  06F 
        REL(5)  MKeyCLLCD                        * C787A  070 
        REL(5)  MKeyMODL2                        * C787F  071 
        REL(5)  MKeySIGPAR4                      * C7884  072 
        REL(5)  MKeySRVR                         * C7889  073 
        REL(5)  MKeyIOPAR                        * C788E  074 
        REL(5)  MKeyPRINT                        * C7893  075 
        REL(5)  MKeySERIAL                       * C7898  076 
        REL(5)  MKeyIO                           * C789D  077 
        REL(5)  MKeyIO2                          * C78A2  078 
        REL(5)  MKeyIR                           * C78A7  079 
        REL(5)  MKeyASCII                        * C78AC  07A 
        REL(5)  MKeyIDIOPAR                      * C78B1  07B 
        REL(5)  MKeyRESETIOPAR                   * C78B6  07C 
        REL(5)  MKeyPRTPAR                       * C78BB  07D 
        REL(5)  MKeyIDPRTPAR                     * C78C0  07E 
        REL(5)  MKeyRESETPRTPAR                  * C78C5  07F 
        REL(5)  MKeyPORTS                        * C78CA  080 
        REL(5)  MKeyEQLIB                        * C78CF  081 
        ENDLENGTH                                * C78D4
        ENDLENGTH                                * C78D4

        LENGTH                                   * C78D4  library object without its prolog (its place is the end of the link table before): length, to #CADBD
        CON(2)  0                                * C78D9  no title
