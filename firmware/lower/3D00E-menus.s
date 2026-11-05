* HP 48GX ROM revision R, #3D00E-#3E004: Last of the unit menus, then the key-action libraries 0A2 (left-shift) and 0A3 (right-shift)
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: KeyThenMenu KeyLS_MTH ShowEditMenu KeyRS_STO KeyRS_RIGHT KeyRS_PRG KeyRS_MTH KeyRS_DOWN KeyLS_NEG KeyLS_LEFT KeyLS_EVAL KeyLS_DOT
* Follows on from the previous file (at #3D00E in the original ROM).
        RPL

* ROMPTR 0A7 01B
* refs (1): 3BE7E
* The power units menu
MenuUnitPower:
        :: UnitMenuKeys                          * 3D00E

{Powr-Units}:
          {                                      * 3D018

_W_:
            $ "W"                                * 3D01D

_hp_:
            $ "hp" }                             * 3D029
        ;                                        * 3D03C

* ROMPTR 0A7 01C
* refs (1): 3BE7E
* The pressure units menu
MenuUnitPress:
        :: UnitMenuKeys                          * 3D041

{Press-Units}:
          {                                      * 3D04B

_Pa_:
            $ "Pa"                               * 3D050

_atm_:
            $ "atm"                              * 3D05E

_bar_:
            $ "bar"                              * 3D06E

_psi_:
            $ "psi"                              * 3D07E

_torr_:
            $ "torr"                             * 3D08E

_mmHg_:
            $ "mmHg"                             * 3D0A0

_inHg_:
            $ "inHg"                             * 3D0B2

_inH2O_:
            $ "inH2O" }                          * 3D0C4
        ;                                        * 3D0DD

* ROMPTR 0A7 01D
* refs (1): 3BE7E
MnuUNITSTEMP~1:
        :: UnitMenuKeys                          * 3D0E2

{Temp-Units}:
          {                                      * 3D0EC

_øC_:
            $ "°C"                               * 3D0F1

_øF_:
            $ "°F"                               * 3D0FF

_K__3D10D:
            $ "K"                                * 3D10D

_øR_:
            $ "°R" }                             * 3D119
        ;                                        * 3D12C

* ROMPTR 0A7 01E
* refs (1): 3BE7E
MnuUNITSELEC~1:
        :: UnitMenuKeys                          * 3D131

{Elec-Units}:
          {                                      * 3D13B

_V_:
            $ "V"                                * 3D140

_A__3D14C:
            $ "A"                                * 3D14C

_C_:
            $ "C"                                * 3D158

_ê_:
            $ "Ω"                                * 3D164

_F__3D170:
            $ "F"                                * 3D170

_W__3D17C:
            $ "W"                                * 3D17C

_Fdyn_:
            $ "Fdy"                              * 3D188

_H_:
            $ "H"                                * 3D198

_mho_:
            $ "mho"                              * 3D1A4

_S_:
            $ "S"                                * 3D1B4

_T_:
            $ "T"                                * 3D1C0

_Wb_:
            $ "Wb" }                             * 3D1CC
        ;                                        * 3D1DF

* ROMPTR 0A7 01F
* refs (1): 3BE7E
MnuUNITSANGL~1:
        :: UnitMenuKeys                          * 3D1E4

{Angl-Units}:
          {                                      * 3D1EE

_ø_:
            $ "°"                                * 3D1F3

_r_:
            $ "r"                                * 3D1FF

_grad_:
            $ "grad"                             * 3D20B

_arcmin_:
            $ "arcmin"                           * 3D21D

_arcs_:
            $ "arcs"                             * 3D233

_sr_:
            $ "sr" }                             * 3D245
        ;                                        * 3D258

* ROMPTR 0A7 020
* refs (1): 3BE7E
MnuUNITSLIGHT~1:
        :: UnitMenuKeys                          * 3D25D

{Light-Units}:
          {                                      * 3D267

_fc_:
            $ "fc"                               * 3D26C

_flam_:
            $ "flam"                             * 3D27A

_lx_:
            $ "lx"                               * 3D28C

_ph_:
            $ "ph"                               * 3D29A

_sb_:
            $ "sb"                               * 3D2A8

_lm_:
            $ "lm"                               * 3D2B6

_cd__3D2C4:
            $ "cd"                               * 3D2C4

_lam_:
            $ "lam" }                            * 3D2D2
        ;                                        * 3D2E7

* ROMPTR 0A7 021
* refs (1): 3BE7E
MnuUNITSRAD~1:
        :: UnitMenuKeys                          * 3D2EC

{Rad-Units}:
          {                                      * 3D2F6

_Gy_:
            $ "Gy"                               * 3D2FB

_rad__3D309:
            $ "rad"                              * 3D309

_rem_:
            $ "rem"                              * 3D319

_Sv_:
            $ "Sv"                               * 3D329

_Bq_:
            $ "Bq"                               * 3D337

_Ci_:
            $ "Ci"                               * 3D345

_R__3D353:
            $ "R" }                              * 3D353
        ;                                        * 3D364

* ROMPTR 0A7 022
* refs (1): 3BE7E
MnuUNITSVISC~1:
        :: UnitMenuKeys                          * 3D369

{Visc-Units}:
          {                                      * 3D373

_p_:
            $ "P"                                * 3D378

_st__3D384:
            $ "St" }                             * 3D384
        ;                                        * 3D397

* ROMPTR 0A7 023
* refs (1): 3BE7E
MnuIOIOPAR~1:
        :: InfoMenuSetup ReviewIO '              * 3D39C
          :: ' XLIB MnuKeysIOPAR RomMenuRows ; ; * 3D3B0

* ROMPTR 0A7 024
* refs (1): 3BE7E
MnuPRINTPRTPAR~1:
        :: InfoMenuSetup ReviewPRTPAR '          * 3D3D4
          :: ' XLIB MnuKeysPRTPAR RomMenuRows ; ; * 3D3E8

* ROMPTR 0A7 025
* refs (1): 3BE7E
* The LIB menu: the libraries attached to the current directory, each opening its own commands
MenuLIB:
        :: SetRebuild DirLabelDef '              * 3D40C
          :: ?EvalKeyOb LibMenuOpen ; OnlyDefNoShift! ' LibMenuRows ; * 3D420

* ROMPTR 0A7 026
* refs (1): 3BE7E
* The PORTS menu: the ports that hold something
MenuPORTS:
        :: SetRebuild ' PortLabel LabelDef! '    * 3D448
          :: ?EvalKeyOb PortMenuOpen ; OnlyDefNoShift! ' PortMenuRows ; * 3D466

* ROMPTR 0A7 027
* refs (1): 3BE7E
MnuEQLIB~1:
        :: DirLabelDef SubMenuKeys               * 3D48E

{MenuEQωIä}:
          {                                      * 3D49D

{EQωIä\EQωIä}:
            {                                    * 3D4A2

_EQωIä_:
              $ "EQLIB" XLIB MnuEQLIBEQLIB }     * 3D4A7

{EQωIä\COωIä}:
            {                                    * 3D4CB

_COωIä_:
              $ "COLIB" XLIB MnuEQLIBCOLIB }     * 3D4D0

{EQωIä\MES}:
            {                                    * 3D4F4

_MES_:
              $ "MES" XLIB MnuEQLIBMES }         * 3D4F9

{EQωIä\UTILS}:
            {                                    * 3D519

_UTILS_:
              $ "UTILS" XLIB MnuEQLIBUTILS }     * 3D51E
          }                                      * 3D542
        ;                                        * 3D547

* refs (5): 3C444 3C4CE 3C558 3C5E2 3C66C
* ob ->: does what the key object does, then goes to the menu named by the next object, except in program entry
KeyThenMenu:
        :: DoKeyOb 'R PrgmEntry? caseDROP InitMenu * 3D54C
          SetDA3Bad ;                            * 3D56A

LIB0A7.hash:
        CON(5)  DOHSTR                           * 3D574  hash table of library 0A7
        LENGTH                                   * 3D579  length, to #3D5D8
        CON(5)  0                                * 3D57E  names of length 1
        CON(5)  0                                * 3D583  names of length 2
        CON(5)  0                                * 3D588  names of length 3
        CON(5)  0                                * 3D58D  names of length 4
        CON(5)  0                                * 3D592  names of length 5
        CON(5)  0                                * 3D597  names of length 6
        CON(5)  0                                * 3D59C  names of length 7
        CON(5)  0                                * 3D5A1  names of length 8
        CON(5)  0                                * 3D5A6  names of length 9
        CON(5)  0                                * 3D5AB  names of length 10
        CON(5)  0                                * 3D5B0  names of length 11
        CON(5)  0                                * 3D5B5  names of length 12
        CON(5)  0                                * 3D5BA  names of length 13
        CON(5)  0                                * 3D5BF  names of length 14
        CON(5)  0                                * 3D5C4  names of length 15
        CON(5)  0                                * 3D5C9  names of length 16
        REL(5)  LIB0A7.hash.L1                   * 3D5CE  end of the names
LIB0A7.hash.L1:
        CON(5)  0                                * 3D5D3  command 000 has no name
        ENDLENGTH                                * 3D5D8

LIB0A7.link:
        CON(5)  DOHSTR                           * 3D5D8  link table of library 0A7
        LENGTH                                   * 3D5DD  length, to #3D6AA
        REL(5)  MenuCSTDef                       * 3D5E2  000 
        REL(5)  MenuVAR                          * 3D5E7  001 
        REL(5)  MnuMTH~1                         * 3D5EC  002 
        REL(5)  MnuMTHCONST~1                    * 3D5F1  003 
        REL(5)  MnuPRG~1                         * 3D5F6  004 
        REL(5)  MnuSOLVE~1                       * 3D5FB  005 
        REL(5)  ~SolvrMenu                       * 3D600  006 
        REL(5)  MenuTVM                          * 3D605  007 
        REL(5)  MnuPLOT~1                        * 3D60A  008 
        REL(5)  MnuPLOTPTYPE~1                   * 3D60F  009 
        REL(5)  MnuPLOTPPAR~1                    * 3D614  00A 
        REL(5)  Mnu3DPTYPE~1                     * 3D619  00B 
        REL(5)  Mnu3DVPAR~1                      * 3D61E  00C 
        REL(5)  MnuSTATPTYPE~1                   * 3D623  00D 
        REL(5)  MnuSTATSIGPAR~1                  * 3D628  00E 
        REL(5)  MnuSIGPARMODL~1                  * 3D62D  00F 
        REL(5)  MnuSTATSIGPAR2~1                 * 3D632  010 
        REL(5)  MnuSIGPARMODL2~1                 * 3D637  011 
        REL(5)  MnuUNITS~1                       * 3D63C  012 
        REL(5)  MenuUnitLength                   * 3D641  013 
        REL(5)  MenuUnitArea                     * 3D646  014 
        REL(5)  MenuUnitVol                      * 3D64B  015 
        REL(5)  MenuUnitTime                     * 3D650  016 
        REL(5)  MenuUnitSpeed                    * 3D655  017 
        REL(5)  MenuUnitMass                     * 3D65A  018 
        REL(5)  MenuUnitForce                    * 3D65F  019 
        REL(5)  MenuUnitEnergy                   * 3D664  01A 
        REL(5)  MenuUnitPower                    * 3D669  01B 
        REL(5)  MenuUnitPress                    * 3D66E  01C 
        REL(5)  MnuUNITSTEMP~1                   * 3D673  01D 
        REL(5)  MnuUNITSELEC~1                   * 3D678  01E 
        REL(5)  MnuUNITSANGL~1                   * 3D67D  01F 
        REL(5)  MnuUNITSLIGHT~1                  * 3D682  020 
        REL(5)  MnuUNITSRAD~1                    * 3D687  021 
        REL(5)  MnuUNITSVISC~1                   * 3D68C  022 
        REL(5)  MnuIOIOPAR~1                     * 3D691  023 
        REL(5)  MnuPRINTPRTPAR~1                 * 3D696  024 
        REL(5)  MenuLIB                          * 3D69B  025 
        REL(5)  MenuPORTS                        * 3D6A0  026 
        REL(5)  MnuEQLIB~1                       * 3D6A5  027 
        ENDLENGTH                                * 3D6AA
        ENDLENGTH                                * 3D6AA
        ASSEMBLE
        D=D+C   A                                * 3D6AA
* a branch also enters #3D6AD, where the nibbles decode as RTNSXM
LIB0A7.link.L1:
        GOTO    LIB0A7.link.L1+1                 * 3D6AC
        BSS     1                                * 3D6B0  zeros

* Library 0A2: Key actions, left-shift plane. Command n is the action of key n+1
LIB0A2:
        CON(3)  #0A2                             * 3D6B1  library number
        REL(5)  LIB0A2.hash                      * 3D6B4  hash table
        CON(5)  0                                * 3D6B9  message table
        REL(5)  LIB0A2.link                      * 3D6BE  link table
        CON(5)  0                                * 3D6C3  config
        RPL

* ROMPTR 0A2 000
* refs (1): 3D6B1
LeftShift1:
        :: MenuKey BINT1 DoMenuKeyLS ;           * 3D6C8

* ROMPTR 0A2 001
* refs (1): 3D6B1
LeftShift2:
        :: MenuKey BINT2 DoMenuKeyLS ;           * 3D6E1

* ROMPTR 0A2 002
* refs (1): 3D6B1
LeftShift3:
        :: MenuKey BINT3 DoMenuKeyLS ;           * 3D6FA

* ROMPTR 0A2 003
* refs (1): 3D6B1
LeftShift4:
        :: MenuKey BINT4 DoMenuKeyLS ;           * 3D713

* ROMPTR 0A2 004
* refs (1): 3D6B1
LeftShift5:
        :: MenuKey BINT5 DoMenuKeyLS ;           * 3D72C

* ROMPTR 0A2 005
* refs (1): 3D6B1
LeftShift6:
        :: MenuKey BINT6 DoMenuKeyLS ;           * 3D745

* ROMPTR 0A2 006
* refs (3): 3D6B1 AA39B B1DF0
* The left-shift MTH key
KeyLS_MTH:
        :: KeyTogFlag BINT17 ;                   * 3D75E

* ROMPTR 0A2 007
* refs (1): 3D6B1
* The left-shift PRG key: opens the menu ROMPTR 0A9 03E
KeyLS_PRG:
        :: MenuMaker XLIB MnuCHARS DoMenuKey ;   * 3D772

* ROMPTR 0A2 008
* refs (1): 3D6B1
* The left-shift CST key: opens the menu ROMPTR 0A9 03F
KeyLS_CST:
        :: MenuMaker XLIB MnuMODES DoMenuKey ;   * 3D791

* ROMPTR 0A2 009
* refs (1): 3D6B1
* The left-shift VAR key: opens the menu ROMPTR 0A9 046
KeyLS_VAR:
        :: MenuMaker XLIB MnuMEMORY DoMenuKey ;  * 3D7B0

* ROMPTR 0A2 00A
* refs (1): 3D6B1
* The left-shift up key: opens the menu ROMPTR 0A9 049
KeyLS_UP:
        :: MenuMaker XLIB MnuSTACK DoMenuKey ;   * 3D7CF

* ROMPTR 0A2 00B
* refs (1): 3D6B1
* The left-shift NXT key
KeyLS_NXT:
        :: MenuMaker # FFFFA SetSomeRow ;        * 3D7EE

* ROMPTR 0A2 00C
* refs (1): 3D6B1
* The left-shift ' key: UPDIR
KeyLS_QUOTE:
        XLIB xUPDIR                              * 3D80C  UPDIR

* ROMPTR 0A2 00D
* refs (1): 3D6B1
* The left-shift STO key: DEFINE
KeyLS_STO:
        XLIB xDEFINE                             * 3D817  DEFINE

* ROMPTR 0A2 00E
* refs (2): 3D6B1 6BBA9
* The left-shift EVAL key: →NUM
KeyLS_EVAL:
        XLIB x>NUM                               * 3D822  →NUM

* ROMPTR 0A2 00F
* refs (2): 3D6B1 6B9F7
* The left-shift left key: PICTURE
KeyLS_LEFT:
        XLIB xGRAPH                              * 3D82D  PICTURE

* ROMPTR 0A2 010
* refs (1): 3D6B1
~NoEdit?case;ViewLevel1;DoBadKey:
        :: NoEdit?case ViewLevel1                * 3D838
          DoBadKey ;                             * 3D847

* ROMPTR 0A2 011
* refs (1): 3D6B1
* The left-shift right key: SWAP
KeyLS_RIGHT:
        XLIB xSWAP                               * 3D851  SWAP

* ROMPTR 0A2 012
* refs (1): 3D6B1
ASIN:
        XLIB xASIN                               * 3D85C  ASIN

* ROMPTR 0A2 013
* refs (1): 3D6B1
* The left-shift COS key: ACOS
KeyLS_COS:
        XLIB xACOS                               * 3D867  ACOS

* ROMPTR 0A2 014
* refs (1): 3D6B1
* The left-shift TAN key: ATAN
KeyLS_TAN:
        XLIB xATAN                               * 3D872  ATAN

* ROMPTR 0A2 015
* refs (1): 3D6B1
* The left-shift √ key: SQ
KeyLS_SQRT:
        XLIB xSQ                                 * 3D87D  SQ

* ROMPTR 0A2 016
* refs (1): 3D6B1
* The left-shift y^x key: ALOG
KeyLS_POW:
        XLIB xALOG                               * 3D888  ALOG

* ROMPTR 0A2 017
* refs (1): 3D6B1
* The left-shift 1/x key: EXP
KeyLS_INV:
        XLIB xEXP                                * 3D893  EXP

* ROMPTR 0A2 018
* refs (1): 3D6B1
* The left-shift ENTER key
KeyLS_ENTER:
        :: PTR Do1st/2nd+: xDUP EqwNew ;         * 3D89E

* ROMPTR 0A2 019
* refs (2): 3D6B1 6BB3B
* The left-shift +/- key
KeyLS_NEG:
        :: TakeOver EditExstCase                 * 3D8B7

* refs (2): 3B4AA 8F616
* Opens the EDIT menu
ShowEditMenu:
          :: EditMenu DoMenuKey ; EditOrVisit ;  * 3D8C6

* ROMPTR 0A2 01A
* refs (1): 3D6B1
* The left-shift EEX key: PURGE
KeyLS_EEX:
        :: TakeOver PTR Do1st/2nd+: XLIB xPURGE CK1NOLASTWD CK&DISPATCH1 * 3D8E4  PURGE
          BINT6 KeyLS_EEX~name                   * 3D908  name
          BINT0                                  * 3D912  any
          XLIB xPURGE                            * 3D917  PURGE
        ;                                        * 3D922

* ROMPTR 0A2 01B
* refs (2): 3D6B1 6BB59
* The left-shift DEL key: CLEAR
KeyLS_DEL:
        XLIB xCLEAR                              * 3D927  CLEAR

* ROMPTR 0A2 01C
* refs (1): 3D6B1
* The left-shift backspace key: DROP
KeyLS_BKSP:
        XLIB xDROP                               * 3D932  DROP

* ROMPTR 0A2 01D
* refs (1): 3D6B1
* The left-shift α key: flag -61: [USR][USR] locks / [USR] locks User
KeyLS_ALPHA:
        :: Modifier SetDA23NoCh BINT61 TestSysFlag case InvUserMo * 3D93D  flag -61: [USR][USR] locks / [USR] locks User
          UserKeys? NOTcase SetUserMo            * 3D960
          1USR? case Clr1USR                     * 3D96F
          BINT62 ClrSysFlag ;                    * 3D97E  flag -62: User keys off / User keys on

* ROMPTR 0A2 01E
* refs (1): 3D6B1
* The left-shift 7 key: opens the menu ROMPTR 0A9 04A
KeyLS_7:
        :: MenuMaker XLIB MnuSOLVE DoMenuKey ;   * 3D98D

* ROMPTR 0A2 01F
* refs (1): 3D6B1
* The left-shift 8 key: opens the menu ROMPTR 0A9 051
KeyLS_8:
        :: MenuMaker XLIB MnuPLOT DoMenuKey ;    * 3D9AC

* ROMPTR 0A2 020
* refs (1): 3D6B1
* The left-shift 9 key: opens the menu ROMPTR 0A9 05D
KeyLS_9:
        :: MenuMaker XLIB MnuSYMBOLIC DoMenuKey ; * 3D9CB

* ROMPTR 0A2 021
* refs (2): 3D6B1 6BCF4
~DoDelims;$_LRParens;SetDA1NoCh:
        :: DoDelims $_LRParens SetDA1NoCh ;      * 3D9EA

* ROMPTR 0A2 022
* refs (3): 3D6B1 6B41C 6B433
~Modifier;SetKeysNS;SetDA123NoCh:
        :: Modifier SetKeysNS SetDA123NoCh ;     * 3DA03

* ROMPTR 0A2 023
* refs (1): 3D6B1
* The left-shift 4 key: opens the menu ROMPTR 0A9 05E
KeyLS_4:
        :: MenuMaker XLIB MnuTIME DoMenuKey ;    * 3DA1C

* ROMPTR 0A2 024
* refs (1): 3D6B1
* The left-shift 5 key: opens the menu ROMPTR 0A9 060
KeyLS_5:
        :: MenuMaker XLIB MnuSTAT DoMenuKey ;    * 3DA3B

* ROMPTR 0A2 025
* refs (1): 3D6B1
* The left-shift 6 key: opens the menu ROMPTR 0A9 03B
KeyLS_6:
        :: MenuMaker XLIB MnuUNITScmds DoMenuKey ; * 3DA5A

* ROMPTR 0A2 026
* refs (1): 3D6B1
~DoDelims;$_[];?ClrAlg:
        :: DoDelims $_[] ?ClrAlg ;               * 3DA79

* ROMPTR 0A2 027
* refs (1): 3D6B1
~Modifier;LShiftOnly;SetDA123NoCh_2:
        :: Modifier LShiftOnly SetDA123NoCh ;    * 3DA92

* ROMPTR 0A2 028
* refs (1): 3D6B1
* The left-shift 1 key: opens the menu ROMPTR 0A9 068
KeyLS_1:
        :: MenuMaker XLIB MnuIO DoMenuKey ;      * 3DAAB

* ROMPTR 0A2 029
* refs (1): 3D6B1
* The left-shift 2 key: opens the menu ROMPTR 0A9 06E
KeyLS_2:
        :: MenuMaker XLIB MnuLIBRARY DoMenuKey ; * 3DACA

* ROMPTR 0A2 02A
* refs (1): 3D6B1
* The left-shift 3 key: opens the menu ROMPTR 0A9 071
KeyLS_3:
        :: MenuMaker XLIB MnuEQLIB DoMenuKey ;   * 3DAE9

* ROMPTR 0A2 02B
* refs (1): 3D6B1
~Echo2Macros;x>>;x<<:
        :: Echo2Macros x>> x<< ;                 * 3DB08

* ROMPTR 0A2 02C
* refs (1): 3D6B1
* The left-shift ON key: CONT
KeyLS_ON:
        XLIB xCONT                               * 3DB21  CONT

* ROMPTR 0A2 02D
* refs (1): 3D6B1
* The left-shift 0 key: =
KeyLS_0:
        XLIB x=                                  * 3DB2C  =

* ROMPTR 0A2 02E
* refs (2): 3D6B1 6BCCC
* The left-shift . key: flag -51: Fraction mark: . / Fraction mark: ,
KeyLS_DOT:
        :: TakeOver BINT51 SysITE CHR_; CHR_, EchoChrKey ; * 3DB37  flag -51: Fraction mark: . / Fraction mark: ,

* ROMPTR 0A2 02F
* refs (1): 3D6B1
* The left-shift SPC key: π
KeyLS_SPC:
        XLIB xPI                                 * 3DB5F  π

* ROMPTR 0A2 030
* refs (2): 3D6B1 6BA47
~DoDelims;$_{};?ClrAlgSetPr:
        :: DoDelims $_{} ?ClrAlgSetPr ;          * 3DB6A

LIB0A2.hash:
        CON(5)  DOHSTR                           * 3DB83  hash table of library 0A2
        LENGTH                                   * 3DB88  length, to #3DBE7
        CON(5)  0                                * 3DB8D  names of length 1
        CON(5)  0                                * 3DB92  names of length 2
        CON(5)  0                                * 3DB97  names of length 3
        CON(5)  0                                * 3DB9C  names of length 4
        CON(5)  0                                * 3DBA1  names of length 5
        CON(5)  0                                * 3DBA6  names of length 6
        CON(5)  0                                * 3DBAB  names of length 7
        CON(5)  0                                * 3DBB0  names of length 8
        CON(5)  0                                * 3DBB5  names of length 9
        CON(5)  0                                * 3DBBA  names of length 10
        CON(5)  0                                * 3DBBF  names of length 11
        CON(5)  0                                * 3DBC4  names of length 12
        CON(5)  0                                * 3DBC9  names of length 13
        CON(5)  0                                * 3DBCE  names of length 14
        CON(5)  0                                * 3DBD3  names of length 15
        CON(5)  0                                * 3DBD8  names of length 16
        REL(5)  LIB0A2.hash.L1                   * 3DBDD  end of the names
LIB0A2.hash.L1:
        CON(5)  0                                * 3DBE2  command 000 has no name
        ENDLENGTH                                * 3DBE7

LIB0A2.link:
        CON(5)  DOHSTR                           * 3DBE7  link table of library 0A2
        LENGTH                                   * 3DBEC  length, to #3DCE6
        REL(5)  LeftShift1                       * 3DBF1  000 
        REL(5)  LeftShift2                       * 3DBF6  001 
        REL(5)  LeftShift3                       * 3DBFB  002 
        REL(5)  LeftShift4                       * 3DC00  003 
        REL(5)  LeftShift5                       * 3DC05  004 
        REL(5)  LeftShift6                       * 3DC0A  005 
        REL(5)  KeyLS_MTH                        * 3DC0F  006 
        REL(5)  KeyLS_PRG                        * 3DC14  007 
        REL(5)  KeyLS_CST                        * 3DC19  008 
        REL(5)  KeyLS_VAR                        * 3DC1E  009 
        REL(5)  KeyLS_UP                         * 3DC23  00A 
        REL(5)  KeyLS_NXT                        * 3DC28  00B 
        REL(5)  KeyLS_QUOTE                      * 3DC2D  00C 
        REL(5)  KeyLS_STO                        * 3DC32  00D 
        REL(5)  KeyLS_EVAL                       * 3DC37  00E 
        REL(5)  KeyLS_LEFT                       * 3DC3C  00F 
        REL(5)  ~NoEdit?case;ViewLevel1;DoBadKey * 3DC41  010 
        REL(5)  KeyLS_RIGHT                      * 3DC46  011 
        REL(5)  ASIN                             * 3DC4B  012 
        REL(5)  KeyLS_COS                        * 3DC50  013 
        REL(5)  KeyLS_TAN                        * 3DC55  014 
        REL(5)  KeyLS_SQRT                       * 3DC5A  015 
        REL(5)  KeyLS_POW                        * 3DC5F  016 
        REL(5)  KeyLS_INV                        * 3DC64  017 
        REL(5)  KeyLS_ENTER                      * 3DC69  018 
        REL(5)  KeyLS_NEG                        * 3DC6E  019 
        REL(5)  KeyLS_EEX                        * 3DC73  01A 
        REL(5)  KeyLS_DEL                        * 3DC78  01B 
        REL(5)  KeyLS_BKSP                       * 3DC7D  01C 
        REL(5)  KeyLS_ALPHA                      * 3DC82  01D 
        REL(5)  KeyLS_7                          * 3DC87  01E 
        REL(5)  KeyLS_8                          * 3DC8C  01F 
        REL(5)  KeyLS_9                          * 3DC91  020 
        REL(5)  ~DoDelims;$_LRParens;SetDA1NoCh  * 3DC96  021 
        REL(5)  ~Modifier;SetKeysNS;SetDA123NoCh * 3DC9B  022 
        REL(5)  KeyLS_4                          * 3DCA0  023 
        REL(5)  KeyLS_5                          * 3DCA5  024 
        REL(5)  KeyLS_6                          * 3DCAA  025 
        REL(5)  ~DoDelims;$_[];?ClrAlg           * 3DCAF  026 
        REL(5)  ~Modifier;LShiftOnly;SetDA123NoCh_2 * 3DCB4  027 
        REL(5)  KeyLS_1                          * 3DCB9  028 
        REL(5)  KeyLS_2                          * 3DCBE  029 
        REL(5)  KeyLS_3                          * 3DCC3  02A 
        REL(5)  ~Echo2Macros;x>>;x<<             * 3DCC8  02B 
        REL(5)  KeyLS_ON                         * 3DCCD  02C 
        REL(5)  KeyLS_0                          * 3DCD2  02D 
        REL(5)  KeyLS_DOT                        * 3DCD7  02E 
        REL(5)  KeyLS_SPC                        * 3DCDC  02F 
        REL(5)  ~DoDelims;$_{};?ClrAlgSetPr      * 3DCE1  030 
        ENDLENGTH                                * 3DCE6

        LENGTH                                   * 3DCE6  library object without its prolog (its place is the end of the link table before): length, to #3E2CA
        CON(2)  0                                * 3DCEB  no title

* Library 0A3: Key actions, right-shift plane. Command n is the action of key n+1
LIB0A3:
        CON(3)  #0A3                             * 3DCED  library number
        REL(5)  LIB0A3.hash                      * 3DCF0  hash table
        CON(5)  0                                * 3DCF5  message table
        REL(5)  LIB0A3.link                      * 3DCFA  link table
        CON(5)  0                                * 3DCFF  config

* ROMPTR 0A3 000
* refs (1): 3DCED
RightShift1:
        :: MenuKey BINT1 DoMenuKeyRS ;           * 3DD04

* ROMPTR 0A3 001
* refs (1): 3DCED
RightShift2:
        :: MenuKey BINT2 DoMenuKeyRS ;           * 3DD1D

* ROMPTR 0A3 002
* refs (1): 3DCED
* The right-shift C key
KeyRS_C:
        :: MenuKey BINT3 DoMenuKeyRS ;           * 3DD36

* ROMPTR 0A3 003
* refs (1): 3DCED
RightShift4:
        :: MenuKey BINT4 DoMenuKeyRS ;           * 3DD4F

* ROMPTR 0A3 004
* refs (1): 3DCED
RightShift5:
        :: MenuKey BINT5 DoMenuKeyRS ;           * 3DD68

* ROMPTR 0A3 005
* refs (1): 3DCED
RightShift6:
        :: MenuKey BINT6 DoMenuKeyRS ;           * 3DD81

* ROMPTR 0A3 006
* refs (2): 3DCED B1E14
* The right-shift MTH key
KeyRS_MTH:
        :: KeyTogFlag BINT16 ;                   * 3DD9A

* ROMPTR 0A3 007
* refs (2): 3DCED 6BCB8
* The right-shift PRG key: runs ROMPTR 0B2 001
KeyRS_PRG:
        XLIB DoCHARS                             * 3DDAE

* ROMPTR 0A3 008
* refs (1): 3DCED
* The right-shift CST key: runs ROMPTR 0B4 1C1
KeyRS_CST:
        XLIB ModesApp                            * 3DDB9

* ROMPTR 0A3 009
* refs (1): 3DCED
* The right-shift VAR key: runs ROMPTR 0B4 1D7
KeyRS_VAR:
        XLIB MemApp                              * 3DDC4

* ROMPTR 0A3 00A
* refs (1): 3DCED
* The right-shift up key
KeyRS_UP:
        :: NoEdit?case IStack                    * 3DDCF
          TopERow? caseDoBadKey Cursor&Disp      * 3DDDE
          ToTheFirstRow SetDA123NoCh ;           * 3DDED

* ROMPTR 0A3 00B
* refs (1): 3DCED
* The right-shift NXT key: opens the menu ROMPTR 0A9 000
KeyRS_NXT:
        :: MenuMaker XLIB MnuLast DoMenuKey ;    * 3DDFC

* ROMPTR 0A3 00C
* refs (1): 3DCED
* The right-shift ' key: HOME
KeyRS_QUOTE:
        XLIB xHOME                               * 3DE1B  HOME

* ROMPTR 0A3 00D
* refs (2): 3DCED 6BB4F
* The right-shift STO key: RCL
KeyRS_STO:
        XLIB xRCL                                * 3DE26  RCL

* ROMPTR 0A3 00E
* refs (1): 3DCED
* The right-shift EVAL key
KeyRS_EVAL:
        :: TakeOver UNDO_ON? case                * 3DE31
          :: SuspendOK? NOTcase DoBadKey         * 3DE45
            KeyRS_EVAL~1 SetDA13NoCh SetDA2bNoCh ; * 3DE59
          NoEditLine? case LASTSTKERR            * 3DE6D
          Err#NoLstStk JstGetTHEMESG DoWarning ; * 3DE7C

* ROMPTR 0A3 00F
* refs (1): 3DCED
* The right-shift left key
KeyRS_LEFT:
        :: NoComLine?:(bip;q) OnTheFirstCol? caseDoBadKey Cursor&Disp * 3DE90
          ToTheStartOfRow SetDA123NoCh ;         * 3DEA9

* ROMPTR 0A3 010
* refs (2): 3DCED 6BB27
* The right-shift down key
KeyRS_DOWN:
        :: NoEdit?case LocalReview               * 3DEB8
          LastERow? caseDoBadKey Cursor&Disp     * 3DEC7
          ToTheLastRow SetDA123NoCh ;            * 3DED6

* ROMPTR 0A3 011
* refs (2): 3DCED 6BB31
* The right-shift right key
KeyRS_RIGHT:
        :: NoEdit?case xSERVER                   * 3DEE5
          CURSOR_END? caseDoBadKey Cursor&Disp   * 3DEF4
          ToTheEndOfRow SetDA123NoCh ;           * 3DF03

* ROMPTR 0A3 012
* refs (1): 3DCED
* The right-shift SIN key: ∂
KeyRS_SIN:
        XLIB DERIV                               * 3DF12  ∂

* ROMPTR 0A3 013
* refs (1): 3DCED
* The right-shift COS key: ∫
KeyRS_COS:
        XLIB INTEG                               * 3DF1D  ∫

* ROMPTR 0A3 014
* refs (1): 3DCED
* The right-shift TAN key: Σ
KeyRS_TAN:
        XLIB ä                                   * 3DF28  Σ

* ROMPTR 0A3 015
* refs (1): 3DCED
* The right-shift √ key: XROOT
KeyRS_SQRT:
        XLIB rpnXROOT                            * 3DF33  XROOT

* ROMPTR 0A3 016
* refs (1): 3DCED
* The right-shift y^x key: LOG
KeyRS_POW:
        XLIB xLOG                                * 3DF3E  LOG

* ROMPTR 0A3 017
* refs (1): 3DCED
* The right-shift 1/x key: LN
KeyRS_INV:
        XLIB xLN                                 * 3DF49  LN

* ROMPTR 0A3 018
* refs (1): 3DCED
~Do1st/2nd+:;xDUP;DoNewMatrix:
        :: PTR Do1st/2nd+: xDUP DoNewMatrix ;    * 3DF54

* ROMPTR 0A3 019
* refs (1): 3DCED
* The right-shift +/- key: runs ROMPTR 0B2 000
KeyRS_NEG:
        XLIB DoCMD                               * 3DF6D

* ROMPTR 0A3 01A
* refs (1): 3DCED
* The right-shift EEX key: LASTARG
KeyRS_EEX:
        XLIB xLAST                               * 3DF78  LASTARG

* ROMPTR 0A3 01B
* refs (1): 3DCED
* The right-shift DEL key
KeyRS_DEL:
        :: NoComLine?:(bip;q) EdDelToEnd ;       * 3DF83

* ROMPTR 0A3 01C
* refs (1): 3DCED
* The right-shift backspace key
KeyRS_BKSP:
        :: NoComLine?:(bip;q) EdDelToStart ;     * 3DF97

* ROMPTR 0A3 01D
* refs (1): 3DCED
* The right-shift α key
KeyRS_ALPHA:
        :: TakeOver EditLExists? NOTcase         * 3DFAB
          :: NULL$ AddInComLine! SetPrgmEntry ;  * 3DFBF
          SetDA23NoCh PrgmEntry? NOTcase SetPrgmEntry * 3DFD8
          AlgEntry? case ClrAlgEntry             * 3DFEC
          SetAlgEntry ;                          * 3DFFB
