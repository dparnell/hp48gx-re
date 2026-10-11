* HP 48GX ROM revision R, #3D00E-#3E004: Menus and the built-in libraries 0A1-0A7
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: RightShift6 RightShift5 RightShift4 RightShift2 RightShift1 LeftShift6 LeftShift5 LeftShift4 LeftShift3 LeftShift2 LeftShift1 ASIN
* Follows on from the previous file (at #3D00E in the original ROM).
        RPL

* ROMPTR 0A7 01B
* refs (1): 3BE7E
ROMP_0A7_01B:
        ::                                       * 3D00E
          OBJ_3EF14                              * 3D013

{Powr-Units}:
          {                                      * 3D018

_W_:
            $       "W"                          * 3D01D

_hp_:
            $       "hp"                         * 3D029
          }                                      * 3D037
        ;                                        * 3D03C

* ROMPTR 0A7 01C
* refs (1): 3BE7E
ROMP_0A7_01C:
        ::                                       * 3D041
          OBJ_3EF14                              * 3D046

{Press-Units}:
          {                                      * 3D04B

_Pa_:
            $       "Pa"                         * 3D050

_atm_:
            $       "atm"                        * 3D05E

_bar_:
            $       "bar"                        * 3D06E

_psi_:
            $       "psi"                        * 3D07E

_torr_:
            $       "torr"                       * 3D08E

_mmHg_:
            $       "mmHg"                       * 3D0A0

_inHg_:
            $       "inHg"                       * 3D0B2

_inH2O_:
            $       "inH2O"                      * 3D0C4
          }                                      * 3D0D8
        ;                                        * 3D0DD

* ROMPTR 0A7 01D
* refs (1): 3BE7E
ROMP_0A7_01D:
        ::                                       * 3D0E2
          OBJ_3EF14                              * 3D0E7

{Temp-Units}:
          {                                      * 3D0EC

_øC_:
            $       "°C"                         * 3D0F1

_øF_:
            $       "°F"                         * 3D0FF

_K__3D10D:
            $       "K"                          * 3D10D

_øR_:
            $       "°R"                         * 3D119
          }                                      * 3D127
        ;                                        * 3D12C

* ROMPTR 0A7 01E
* refs (1): 3BE7E
ROMP_0A7_01E:
        ::                                       * 3D131
          OBJ_3EF14                              * 3D136

{Elec-Units}:
          {                                      * 3D13B

_V_:
            $       "V"                          * 3D140

_A__3D14C:
            $       "A"                          * 3D14C

_C_:
            $       "C"                          * 3D158

_ê_:
            $       "Ω"                          * 3D164

_F__3D170:
            $       "F"                          * 3D170

_W__3D17C:
            $       "W"                          * 3D17C

_Fdyn_:
            $       "Fdy"                        * 3D188

_H_:
            $       "H"                          * 3D198

_mho_:
            $       "mho"                        * 3D1A4

_S_:
            $       "S"                          * 3D1B4

_T_:
            $       "T"                          * 3D1C0

_Wb_:
            $       "Wb"                         * 3D1CC
          }                                      * 3D1DA
        ;                                        * 3D1DF

* ROMPTR 0A7 01F
* refs (1): 3BE7E
ROMP_0A7_01F:
        ::                                       * 3D1E4
          OBJ_3EF14                              * 3D1E9

{Angl-Units}:
          {                                      * 3D1EE

_ø_:
            $       "°"                          * 3D1F3

_r_:
            $       "r"                          * 3D1FF

_grad_:
            $       "grad"                       * 3D20B

_arcmin_:
            $       "arcmin"                     * 3D21D

_arcs_:
            $       "arcs"                       * 3D233

_sr_:
            $       "sr"                         * 3D245
          }                                      * 3D253
        ;                                        * 3D258

* ROMPTR 0A7 020
* refs (1): 3BE7E
ROMP_0A7_020:
        ::                                       * 3D25D
          OBJ_3EF14                              * 3D262

{Light-Units}:
          {                                      * 3D267

_fc_:
            $       "fc"                         * 3D26C

_flam_:
            $       "flam"                       * 3D27A

_lx_:
            $       "lx"                         * 3D28C

_ph_:
            $       "ph"                         * 3D29A

_sb_:
            $       "sb"                         * 3D2A8

_lm_:
            $       "lm"                         * 3D2B6

_cd__3D2C4:
            $       "cd"                         * 3D2C4

_lam_:
            $       "lam"                        * 3D2D2
          }                                      * 3D2E2
        ;                                        * 3D2E7

* ROMPTR 0A7 021
* refs (1): 3BE7E
ROMP_0A7_021:
        ::                                       * 3D2EC
          OBJ_3EF14                              * 3D2F1

{Rad-Units}:
          {                                      * 3D2F6

_Gy_:
            $       "Gy"                         * 3D2FB

_rad__3D309:
            $       "rad"                        * 3D309

_rem_:
            $       "rem"                        * 3D319

_Sv_:
            $       "Sv"                         * 3D329

_Bq_:
            $       "Bq"                         * 3D337

_Ci_:
            $       "Ci"                         * 3D345

_R__3D353:
            $       "R"                          * 3D353
          }                                      * 3D35F
        ;                                        * 3D364

* ROMPTR 0A7 022
* refs (1): 3BE7E
ROMP_0A7_022:
        ::                                       * 3D369
          OBJ_3EF14                              * 3D36E

{Visc-Units}:
          {                                      * 3D373

_p_:
            $       "P"                          * 3D378

_st__3D384:
            $       "St"                         * 3D384
          }                                      * 3D392
        ;                                        * 3D397

* ROMPTR 0A7 023
* refs (1): 3BE7E
ROMP_0A7_023:
        ::                                       * 3D39C
          OBJ_4A2E9                              * 3D3A1
          OBJ_4A33E                              * 3D3A6
          '                                      * 3D3AB
          ::                                     * 3D3B0
            '                                    * 3D3B5
            ROMPTR  0AA 00A                      * 3D3BA
            OBJ_3A640                            * 3D3C5
          ;                                      * 3D3CA
        ;                                        * 3D3CF

* ROMPTR 0A7 024
* refs (1): 3BE7E
ROMP_0A7_024:
        ::                                       * 3D3D4
          OBJ_4A2E9                              * 3D3D9
          OBJ_4A518                              * 3D3DE
          '                                      * 3D3E3
          ::                                     * 3D3E8
            '                                    * 3D3ED
            ROMPTR  0AA 00B                      * 3D3F2
            OBJ_3A640                            * 3D3FD
          ;                                      * 3D402
        ;                                        * 3D407

* ROMPTR 0A7 025
* refs (1): 3BE7E
ROMP_0A7_025:
        ::                                       * 3D40C
          SetRebuild                             * 3D411
          OBJ_3F036                              * 3D416
          '                                      * 3D41B
          ::                                     * 3D420
            OBJ_3EFB4                            * 3D425
            OBJ_3F4A6                            * 3D42A
          ;                                      * 3D42F
          OnlyDefNoShift!                        * 3D434
          '                                      * 3D439
          OBJ_3F3DE                              * 3D43E
        ;                                        * 3D443

* ROMPTR 0A7 026
* refs (1): 3BE7E
ROMP_0A7_026:
        ::                                       * 3D448
          SetRebuild                             * 3D44D
          '                                      * 3D452
          OBJ_3F5F7                              * 3D457
          LabelDef!                              * 3D45C
          '                                      * 3D461
          ::                                     * 3D466
            OBJ_3EFB4                            * 3D46B
            OBJ_3F6A6                            * 3D470
          ;                                      * 3D475
          OnlyDefNoShift!                        * 3D47A
          '                                      * 3D47F
          OBJ_3F638                              * 3D484
        ;                                        * 3D489

* ROMPTR 0A7 027
* refs (1): 3BE7E
ROMP_0A7_027:
        ::                                       * 3D48E
          OBJ_3F036                              * 3D493
          OBJ_3EFE6                              * 3D498

{MenuEQωIä}:
          {                                      * 3D49D

{EQωIä\EQωIä}:
            {                                    * 3D4A2

_EQωIä_:
              $       "EQLIB"                    * 3D4A7
              ROMPTR  0A9 072                    * 3D4BB
            }                                    * 3D4C6

{EQωIä\COωIä}:
            {                                    * 3D4CB

_COωIä_:
              $       "COLIB"                    * 3D4D0
              ROMPTR  0A9 073                    * 3D4E4
            }                                    * 3D4EF

{EQωIä\MES}:
            {                                    * 3D4F4

_MES_:
              $       "MES"                      * 3D4F9
              ROMPTR  0A9 074                    * 3D509
            }                                    * 3D514

{EQωIä\UTILS}:
            {                                    * 3D519

_UTILS_:
              $       "UTILS"                    * 3D51E
              ROMPTR  0A9 075                    * 3D532
            }                                    * 3D53D
          }                                      * 3D542
        ;                                        * 3D547

* refs (5): 3C444 3C4CE 3C558 3C5E2 3C66C
OBJ_3D54C:
        ::                                       * 3D54C
          DoKeyOb                                * 3D551
          'R                                     * 3D556
          PrgmEntry?                             * 3D55B
          caseDROP                               * 3D560
          InitMenu                               * 3D565
          SetDA3Bad                              * 3D56A
        ;                                        * 3D56F

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
        REL(5)  L_3D5D3                          * 3D5CE  end of the names
L_3D5D3:
        CON(5)  0                                * 3D5D3  command 000 has no name
        ENDLENGTH                                * 3D5D8

LIB0A7.link:
        CON(5)  DOHSTR                           * 3D5D8  link table of library 0A7
        LENGTH                                   * 3D5DD  length, to #3D6AA
        REL(5)  ROMP_0A7_000                     * 3D5E2  000 
        REL(5)  ROMP_0A7_001                     * 3D5E7  001 
        REL(5)  ROMP_0A7_002                     * 3D5EC  002 
        REL(5)  ROMP_0A7_003                     * 3D5F1  003 
        REL(5)  ROMP_0A7_004                     * 3D5F6  004 
        REL(5)  ROMP_0A7_005                     * 3D5FB  005 
        REL(5)  ROMP_0A7_006                     * 3D600  006 
        REL(5)  ROMP_0A7_007                     * 3D605  007 
        REL(5)  ROMP_0A7_008                     * 3D60A  008 
        REL(5)  ROMP_0A7_009                     * 3D60F  009 
        REL(5)  ROMP_0A7_00A                     * 3D614  00A 
        REL(5)  ROMP_0A7_00B                     * 3D619  00B 
        REL(5)  ROMP_0A7_00C                     * 3D61E  00C 
        REL(5)  ROMP_0A7_00D                     * 3D623  00D 
        REL(5)  ROMP_0A7_00E                     * 3D628  00E 
        REL(5)  ROMP_0A7_00F                     * 3D62D  00F 
        REL(5)  ROMP_0A7_010                     * 3D632  010 
        REL(5)  ROMP_0A7_011                     * 3D637  011 
        REL(5)  ROMP_0A7_012                     * 3D63C  012 
        REL(5)  ROMP_0A7_013                     * 3D641  013 
        REL(5)  ROMP_0A7_014                     * 3D646  014 
        REL(5)  ROMP_0A7_015                     * 3D64B  015 
        REL(5)  ROMP_0A7_016                     * 3D650  016 
        REL(5)  ROMP_0A7_017                     * 3D655  017 
        REL(5)  ROMP_0A7_018                     * 3D65A  018 
        REL(5)  ROMP_0A7_019                     * 3D65F  019 
        REL(5)  ROMP_0A7_01A                     * 3D664  01A 
        REL(5)  ROMP_0A7_01B                     * 3D669  01B 
        REL(5)  ROMP_0A7_01C                     * 3D66E  01C 
        REL(5)  ROMP_0A7_01D                     * 3D673  01D 
        REL(5)  ROMP_0A7_01E                     * 3D678  01E 
        REL(5)  ROMP_0A7_01F                     * 3D67D  01F 
        REL(5)  ROMP_0A7_020                     * 3D682  020 
        REL(5)  ROMP_0A7_021                     * 3D687  021 
        REL(5)  ROMP_0A7_022                     * 3D68C  022 
        REL(5)  ROMP_0A7_023                     * 3D691  023 
        REL(5)  ROMP_0A7_024                     * 3D696  024 
        REL(5)  ROMP_0A7_025                     * 3D69B  025 
        REL(5)  ROMP_0A7_026                     * 3D6A0  026 
        REL(5)  ROMP_0A7_027                     * 3D6A5  027 
        ENDLENGTH                                * 3D6AA
        ASSEMBLE
        D=D+C   A                                * 3D6AA
* a branch also enters #3D6AD, where the nibbles decode as RTNSXM
L_3D6AC:
        GOTO    L_3D6AC+1                        * 3D6AC
        NIBHEX  0                                * 3D6B0

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
        ::                                       * 3D6C8
          MenuKey                                * 3D6CD
          BINT1                                  * 3D6D2
          OBJ_41954                              * 3D6D7
        ;                                        * 3D6DC

* ROMPTR 0A2 001
* refs (1): 3D6B1
LeftShift2:
        ::                                       * 3D6E1
          MenuKey                                * 3D6E6
          BINT2                                  * 3D6EB
          OBJ_41954                              * 3D6F0
        ;                                        * 3D6F5

* ROMPTR 0A2 002
* refs (1): 3D6B1
LeftShift3:
        ::                                       * 3D6FA
          MenuKey                                * 3D6FF
          BINT3                                  * 3D704
          OBJ_41954                              * 3D709
        ;                                        * 3D70E

* ROMPTR 0A2 003
* refs (1): 3D6B1
LeftShift4:
        ::                                       * 3D713
          MenuKey                                * 3D718
          BINT4                                  * 3D71D
          OBJ_41954                              * 3D722
        ;                                        * 3D727

* ROMPTR 0A2 004
* refs (1): 3D6B1
LeftShift5:
        ::                                       * 3D72C
          MenuKey                                * 3D731
          BINT5                                  * 3D736
          OBJ_41954                              * 3D73B
        ;                                        * 3D740

* ROMPTR 0A2 005
* refs (1): 3D6B1
LeftShift6:
        ::                                       * 3D745
          MenuKey                                * 3D74A
          BINT6                                  * 3D74F
          OBJ_41954                              * 3D754
        ;                                        * 3D759

* ROMPTR 0A2 006
* refs (3): 3D6B1 AA39B B1DF0
ROMP_0A2_006:
        ::                                       * 3D75E
          OBJ_3ED84                              * 3D763
          BINT17                                 * 3D768
        ;                                        * 3D76D

* ROMPTR 0A2 007
* refs (1): 3D6B1
ROMP_0A2_007:
        ::                                       * 3D772
          MenuMaker                              * 3D777
          ROMPTR  0A9 03E                        * 3D77C
          DoMenuKey                              * 3D787
        ;                                        * 3D78C

* ROMPTR 0A2 008
* refs (1): 3D6B1
ROMP_0A2_008:
        ::                                       * 3D791
          MenuMaker                              * 3D796
          ROMPTR  0A9 03F                        * 3D79B
          DoMenuKey                              * 3D7A6
        ;                                        * 3D7AB

* ROMPTR 0A2 009
* refs (1): 3D6B1
ROMP_0A2_009:
        ::                                       * 3D7B0
          MenuMaker                              * 3D7B5
          ROMPTR  0A9 046                        * 3D7BA
          DoMenuKey                              * 3D7C5
        ;                                        * 3D7CA

* ROMPTR 0A2 00A
* refs (1): 3D6B1
ROMP_0A2_00A:
        ::                                       * 3D7CF
          MenuMaker                              * 3D7D4
          ROMPTR  0A9 049                        * 3D7D9
          DoMenuKey                              * 3D7E4
        ;                                        * 3D7E9

* ROMPTR 0A2 00B
* refs (1): 3D6B1
ROMP_0A2_00B:
        ::                                       * 3D7EE
          MenuMaker                              * 3D7F3
          #       FFFFA                          * 3D7F8  1048570
          SetSomeRow                             * 3D802
        ;                                        * 3D807

* ROMPTR 0A2 00C
* refs (1): 3D6B1
ROMP_0A2_00C:
        ROMPTR  002 023                          * 3D80C  UPDIR

* ROMPTR 0A2 00D
* refs (1): 3D6B1
ROMP_0A2_00D:
        ROMPTR  002 156                          * 3D817  DEFINE

* ROMPTR 0A2 00E
* refs (2): 3D6B1 6BBA9
ROMP_0A2_00E:
        ROMPTR  002 035                          * 3D822  →NUM

* ROMPTR 0A2 00F
* refs (2): 3D6B1 6B9F7
ROMP_0A2_00F:
        ROMPTR  002 0C8                          * 3D82D  PICTURE

* ROMPTR 0A2 010
* refs (1): 3D6B1
ROMP_0A2_010:
        ::                                       * 3D838
          NoEdit?case                            * 3D83D
          ViewLevel1                             * 3D842
          DoBadKey                               * 3D847
        ;                                        * 3D84C

* ROMPTR 0A2 011
* refs (1): 3D6B1
ROMP_0A2_011:
        ROMPTR  002 10F                          * 3D851  SWAP

* ROMPTR 0A2 012
* refs (1): 3D6B1
ASIN:
        ROMPTR  002 057                          * 3D85C  ASIN

* ROMPTR 0A2 013
* refs (1): 3D6B1
ROMP_0A2_013:
        ROMPTR  002 058                          * 3D867  ACOS

* ROMPTR 0A2 014
* refs (1): 3D6B1
ROMP_0A2_014:
        ROMPTR  002 059                          * 3D872  ATAN

* ROMPTR 0A2 015
* refs (1): 3D6B1
ROMP_0A2_015:
        ROMPTR  002 050                          * 3D87D  SQ

* ROMPTR 0A2 016
* refs (1): 3D6B1
ROMP_0A2_016:
        ROMPTR  002 060                          * 3D888  ALOG

* ROMPTR 0A2 017
* refs (1): 3D6B1
ROMP_0A2_017:
        ROMPTR  002 05D                          * 3D893  EXP

* ROMPTR 0A2 018
* refs (1): 3D6B1
ROMP_0A2_018:
        ::                                       * 3D89E
          PTR     Do1st/2nd+:                    * 3D8A3
          xDUP                                   * 3D8A8
          OBJ_6B48E                              * 3D8AD
        ;                                        * 3D8B2

* ROMPTR 0A2 019
* refs (2): 3D6B1 6BB3B
ROMP_0A2_019:
        ::                                       * 3D8B7
          TakeOver                               * 3D8BC
          EditExstCase                           * 3D8C1

* refs (2): 3B4AA 8F616
OBJ_3D8C6:
          ::                                     * 3D8C6
            EditMenu                             * 3D8CB
            DoMenuKey                            * 3D8D0
          ;                                      * 3D8D5
          OBJ_3ADBB                              * 3D8DA
        ;                                        * 3D8DF

* ROMPTR 0A2 01A
* refs (1): 3D6B1
ROMP_0A2_01A:
        ::                                       * 3D8E4
          TakeOver                               * 3D8E9
          PTR     Do1st/2nd+:                    * 3D8EE
          ROMPTR  002 157                        * 3D8F3  PURGE
          CK1NOLASTWD                            * 3D8FE
          CK&DISPATCH1                           * 3D903
          BINT6                                  * 3D908
          OBJ_40F5E                              * 3D90D
          BINT0                                  * 3D912
          ROMPTR  002 157                        * 3D917  PURGE
        ;                                        * 3D922

* ROMPTR 0A2 01B
* refs (2): 3D6B1 6BB59
ROMP_0A2_01B:
        ROMPTR  002 11A                          * 3D927  CLEAR

* ROMPTR 0A2 01C
* refs (1): 3D6B1
ROMP_0A2_01C:
        ROMPTR  002 110                          * 3D932  DROP

* ROMPTR 0A2 01D
* refs (1): 3D6B1
ROMP_0A2_01D:
        ::                                       * 3D93D
          Modifier                               * 3D942
          SetDA23NoCh                            * 3D947
          BINT61                                 * 3D94C
          TestSysFlag                            * 3D951
          case                                   * 3D956
          InvUserMo                              * 3D95B
          UserKeys?                              * 3D960
          NOTcase                                * 3D965
          SetUserMo                              * 3D96A
          1USR?                                  * 3D96F
          case                                   * 3D974
          OBJ_3FFCA                              * 3D979
          BINT62                                 * 3D97E
          ClrSysFlag                             * 3D983
        ;                                        * 3D988

* ROMPTR 0A2 01E
* refs (1): 3D6B1
ROMP_0A2_01E:
        ::                                       * 3D98D
          MenuMaker                              * 3D992
          ROMPTR  0A9 04A                        * 3D997
          DoMenuKey                              * 3D9A2
        ;                                        * 3D9A7

* ROMPTR 0A2 01F
* refs (1): 3D6B1
ROMP_0A2_01F:
        ::                                       * 3D9AC
          MenuMaker                              * 3D9B1
          ROMPTR  0A9 051                        * 3D9B6
          DoMenuKey                              * 3D9C1
        ;                                        * 3D9C6

* ROMPTR 0A2 020
* refs (1): 3D6B1
ROMP_0A2_020:
        ::                                       * 3D9CB
          MenuMaker                              * 3D9D0
          ROMPTR  0A9 05D                        * 3D9D5
          DoMenuKey                              * 3D9E0
        ;                                        * 3D9E5

* ROMPTR 0A2 021
* refs (2): 3D6B1 6BCF4
ROMP_0A2_021:
        ::                                       * 3D9EA
          DoDelims                               * 3D9EF
          $_LRParens                             * 3D9F4
          SetDA1NoCh                             * 3D9F9
        ;                                        * 3D9FE

* ROMPTR 0A2 022
* refs (1): 3D6B1
ROMP_0A2_022:
        ::                                       * 3DA03
          Modifier                               * 3DA08
          SetKeysNS                              * 3DA0D
          SetDA123NoCh                           * 3DA12
        ;                                        * 3DA17

* ROMPTR 0A2 023
* refs (1): 3D6B1
ROMP_0A2_023:
        ::                                       * 3DA1C
          MenuMaker                              * 3DA21
          ROMPTR  0A9 05E                        * 3DA26
          DoMenuKey                              * 3DA31
        ;                                        * 3DA36

* ROMPTR 0A2 024
* refs (1): 3D6B1
ROMP_0A2_024:
        ::                                       * 3DA3B
          MenuMaker                              * 3DA40
          ROMPTR  0A9 060                        * 3DA45
          DoMenuKey                              * 3DA50
        ;                                        * 3DA55

* ROMPTR 0A2 025
* refs (1): 3D6B1
ROMP_0A2_025:
        ::                                       * 3DA5A
          MenuMaker                              * 3DA5F
          ROMPTR  0A9 03B                        * 3DA64
          DoMenuKey                              * 3DA6F
        ;                                        * 3DA74

* ROMPTR 0A2 026
* refs (1): 3D6B1
ROMP_0A2_026:
        ::                                       * 3DA79
          DoDelims                               * 3DA7E
          $_[]                                   * 3DA83
          ?ClrAlg                                * 3DA88
        ;                                        * 3DA8D

* ROMPTR 0A2 027
* refs (1): 3D6B1
ROMP_0A2_027:
        ::                                       * 3DA92
          Modifier                               * 3DA97
          LShiftOnly                             * 3DA9C
          SetDA123NoCh                           * 3DAA1
        ;                                        * 3DAA6

* ROMPTR 0A2 028
* refs (1): 3D6B1
ROMP_0A2_028:
        ::                                       * 3DAAB
          MenuMaker                              * 3DAB0
          ROMPTR  0A9 068                        * 3DAB5
          DoMenuKey                              * 3DAC0
        ;                                        * 3DAC5

* ROMPTR 0A2 029
* refs (1): 3D6B1
ROMP_0A2_029:
        ::                                       * 3DACA
          MenuMaker                              * 3DACF
          ROMPTR  0A9 06E                        * 3DAD4
          DoMenuKey                              * 3DADF
        ;                                        * 3DAE4

* ROMPTR 0A2 02A
* refs (1): 3D6B1
ROMP_0A2_02A:
        ::                                       * 3DAE9
          MenuMaker                              * 3DAEE
          ROMPTR  0A9 071                        * 3DAF3
          DoMenuKey                              * 3DAFE
        ;                                        * 3DB03

* ROMPTR 0A2 02B
* refs (1): 3D6B1
ROMP_0A2_02B:
        ::                                       * 3DB08
          Echo2Macros                            * 3DB0D
          x>>                                    * 3DB12
          x<<                                    * 3DB17
        ;                                        * 3DB1C

* ROMPTR 0A2 02C
* refs (1): 3D6B1
ROMP_0A2_02C:
        ROMPTR  002 03A                          * 3DB21  CONT

* ROMPTR 0A2 02D
* refs (1): 3D6B1
ROMP_0A2_02D:
        ROMPTR  002 03B                          * 3DB2C  =

* ROMPTR 0A2 02E
* refs (2): 3D6B1 6BCCC
ROMP_0A2_02E:
        ::                                       * 3DB37
          TakeOver                               * 3DB3C
          BINT51                                 * 3DB41
          SysITE                                 * 3DB46
          CHR_;                                  * 3DB4B
          CHR_,                                  * 3DB50
          EchoChrKey                             * 3DB55
        ;                                        * 3DB5A

* ROMPTR 0A2 02F
* refs (1): 3D6B1
ROMP_0A2_02F:
        ROMPTR  002 03F                          * 3DB5F  π

* ROMPTR 0A2 030
* refs (2): 3D6B1 6BA47
ROMP_0A2_030:
        ::                                       * 3DB6A
          DoDelims                               * 3DB6F
          $_{}                                   * 3DB74
          ?ClrAlgSetPr                           * 3DB79
        ;                                        * 3DB7E

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
        REL(5)  L_3DBE2                          * 3DBDD  end of the names
L_3DBE2:
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
        REL(5)  ROMP_0A2_006                     * 3DC0F  006 
        REL(5)  ROMP_0A2_007                     * 3DC14  007 
        REL(5)  ROMP_0A2_008                     * 3DC19  008 
        REL(5)  ROMP_0A2_009                     * 3DC1E  009 
        REL(5)  ROMP_0A2_00A                     * 3DC23  00A 
        REL(5)  ROMP_0A2_00B                     * 3DC28  00B 
        REL(5)  ROMP_0A2_00C                     * 3DC2D  00C 
        REL(5)  ROMP_0A2_00D                     * 3DC32  00D 
        REL(5)  ROMP_0A2_00E                     * 3DC37  00E 
        REL(5)  ROMP_0A2_00F                     * 3DC3C  00F 
        REL(5)  ROMP_0A2_010                     * 3DC41  010 
        REL(5)  ROMP_0A2_011                     * 3DC46  011 
        REL(5)  ASIN                             * 3DC4B  012 
        REL(5)  ROMP_0A2_013                     * 3DC50  013 
        REL(5)  ROMP_0A2_014                     * 3DC55  014 
        REL(5)  ROMP_0A2_015                     * 3DC5A  015 
        REL(5)  ROMP_0A2_016                     * 3DC5F  016 
        REL(5)  ROMP_0A2_017                     * 3DC64  017 
        REL(5)  ROMP_0A2_018                     * 3DC69  018 
        REL(5)  ROMP_0A2_019                     * 3DC6E  019 
        REL(5)  ROMP_0A2_01A                     * 3DC73  01A 
        REL(5)  ROMP_0A2_01B                     * 3DC78  01B 
        REL(5)  ROMP_0A2_01C                     * 3DC7D  01C 
        REL(5)  ROMP_0A2_01D                     * 3DC82  01D 
        REL(5)  ROMP_0A2_01E                     * 3DC87  01E 
        REL(5)  ROMP_0A2_01F                     * 3DC8C  01F 
        REL(5)  ROMP_0A2_020                     * 3DC91  020 
        REL(5)  ROMP_0A2_021                     * 3DC96  021 
        REL(5)  ROMP_0A2_022                     * 3DC9B  022 
        REL(5)  ROMP_0A2_023                     * 3DCA0  023 
        REL(5)  ROMP_0A2_024                     * 3DCA5  024 
        REL(5)  ROMP_0A2_025                     * 3DCAA  025 
        REL(5)  ROMP_0A2_026                     * 3DCAF  026 
        REL(5)  ROMP_0A2_027                     * 3DCB4  027 
        REL(5)  ROMP_0A2_028                     * 3DCB9  028 
        REL(5)  ROMP_0A2_029                     * 3DCBE  029 
        REL(5)  ROMP_0A2_02A                     * 3DCC3  02A 
        REL(5)  ROMP_0A2_02B                     * 3DCC8  02B 
        REL(5)  ROMP_0A2_02C                     * 3DCCD  02C 
        REL(5)  ROMP_0A2_02D                     * 3DCD2  02D 
        REL(5)  ROMP_0A2_02E                     * 3DCD7  02E 
        REL(5)  ROMP_0A2_02F                     * 3DCDC  02F 
        REL(5)  ROMP_0A2_030                     * 3DCE1  030 
        ENDLENGTH                                * 3DCE6
        NIBHEX  4E50000                          * 3DCE6  ä..

LIB0A3:
        CON(3)  #0A3                             * 3DCED  library number
        REL(5)  LIB0A3.hash                      * 3DCF0  hash table
        CON(5)  0                                * 3DCF5  message table
        REL(5)  LIB0A3.link                      * 3DCFA  link table
        CON(5)  0                                * 3DCFF  config

* ROMPTR 0A3 000
* refs (1): 3DCED
RightShift1:
        ::                                       * 3DD04
          MenuKey                                * 3DD09
          BINT1                                  * 3DD0E
          OBJ_41974                              * 3DD13
        ;                                        * 3DD18

* ROMPTR 0A3 001
* refs (1): 3DCED
RightShift2:
        ::                                       * 3DD1D
          MenuKey                                * 3DD22
          BINT2                                  * 3DD27
          OBJ_41974                              * 3DD2C
        ;                                        * 3DD31

* ROMPTR 0A3 002
* refs (1): 3DCED
ROMP_0A3_002:
        ::                                       * 3DD36
          MenuKey                                * 3DD3B
          BINT3                                  * 3DD40
          OBJ_41974                              * 3DD45
        ;                                        * 3DD4A

* ROMPTR 0A3 003
* refs (1): 3DCED
RightShift4:
        ::                                       * 3DD4F
          MenuKey                                * 3DD54
          BINT4                                  * 3DD59
          OBJ_41974                              * 3DD5E
        ;                                        * 3DD63

* ROMPTR 0A3 004
* refs (1): 3DCED
RightShift5:
        ::                                       * 3DD68
          MenuKey                                * 3DD6D
          BINT5                                  * 3DD72
          OBJ_41974                              * 3DD77
        ;                                        * 3DD7C

* ROMPTR 0A3 005
* refs (1): 3DCED
RightShift6:
        ::                                       * 3DD81
          MenuKey                                * 3DD86
          BINT6                                  * 3DD8B
          OBJ_41974                              * 3DD90
        ;                                        * 3DD95

* ROMPTR 0A3 006
* refs (2): 3DCED B1E14
ROMP_0A3_006:
        ::                                       * 3DD9A
          OBJ_3ED84                              * 3DD9F
          BINT16                                 * 3DDA4
        ;                                        * 3DDA9

* ROMPTR 0A3 007
* refs (2): 3DCED 6BCB8
ROMP_0A3_007:
        ROMPTR  0B2 001                          * 3DDAE

* ROMPTR 0A3 008
* refs (1): 3DCED
ROMP_0A3_008:
        ROMPTR  0B4 1C1                          * 3DDB9

* ROMPTR 0A3 009
* refs (1): 3DCED
ROMP_0A3_009:
        ROMPTR  0B4 1D7                          * 3DDC4

* ROMPTR 0A3 00A
* refs (1): 3DCED
ROMP_0A3_00A:
        ::                                       * 3DDCF
          NoEdit?case                            * 3DDD4
          OBJ_4365D                              * 3DDD9
          TopERow?                               * 3DDDE
          caseDoBadKey                           * 3DDE3
          Cursor&Disp                            * 3DDE8
          ToTheFirstRow                          * 3DDED
          SetDA123NoCh                           * 3DDF2
        ;                                        * 3DDF7

* ROMPTR 0A3 00B
* refs (1): 3DCED
ROMP_0A3_00B:
        ::                                       * 3DDFC
          MenuMaker                              * 3DE01
          ROMPTR  0A9 000                        * 3DE06
          DoMenuKey                              * 3DE11
        ;                                        * 3DE16

* ROMPTR 0A3 00C
* refs (1): 3DCED
ROMP_0A3_00C:
        ROMPTR  002 022                          * 3DE1B  HOME

* ROMPTR 0A3 00D
* refs (2): 3DCED 6BB4F
ROMP_0A3_00D:
        ROMPTR  002 154                          * 3DE26  RCL

* ROMPTR 0A3 00E
* refs (1): 3DCED
ROMP_0A3_00E:
        ::                                       * 3DE31
          TakeOver                               * 3DE36
          UNDO_ON?                               * 3DE3B
          case                                   * 3DE40
          ::                                     * 3DE45
            SuspendOK?                           * 3DE4A
            NOTcase                              * 3DE4F
            DoBadKey                             * 3DE54
            OBJ_61F8F                            * 3DE59
            SetDA13NoCh                          * 3DE5E
            SetDA2bNoCh                          * 3DE63
          ;                                      * 3DE68
          NoEditLine?                            * 3DE6D
          case                                   * 3DE72
          LASTSTKERR                             * 3DE77
          Err#NoLstStk                           * 3DE7C
          JstGetTHEMESG                          * 3DE81
          DoWarning                              * 3DE86
        ;                                        * 3DE8B

* ROMPTR 0A3 00F
* refs (1): 3DCED
ROMP_0A3_00F:
        ::                                       * 3DE90
          NoComLine?:(bip;q)                     * 3DE95
          OnTheFirstCol?                         * 3DE9A
          caseDoBadKey                           * 3DE9F
          Cursor&Disp                            * 3DEA4
          ToTheStartOfRow                        * 3DEA9
          SetDA123NoCh                           * 3DEAE
        ;                                        * 3DEB3

* ROMPTR 0A3 010
* refs (2): 3DCED 6BB27
ROMP_0A3_010:
        ::                                       * 3DEB8
          NoEdit?case                            * 3DEBD
          LocalReview                            * 3DEC2
          LastERow?                              * 3DEC7
          caseDoBadKey                           * 3DECC
          Cursor&Disp                            * 3DED1
          ToTheLastRow                           * 3DED6
          SetDA123NoCh                           * 3DEDB
        ;                                        * 3DEE0

* ROMPTR 0A3 011
* refs (2): 3DCED 6BB31
ROMP_0A3_011:
        ::                                       * 3DEE5
          NoEdit?case                            * 3DEEA
          xSERVER                                * 3DEEF
          CURSOR_END?                            * 3DEF4
          caseDoBadKey                           * 3DEF9
          Cursor&Disp                            * 3DEFE
          ToTheEndOfRow                          * 3DF03
          SetDA123NoCh                           * 3DF08
        ;                                        * 3DF0D

* ROMPTR 0A3 012
* refs (1): 3DCED
ROMP_0A3_012:
        ROMPTR  002 0F7                          * 3DF12  ∂

* ROMPTR 0A3 013
* refs (1): 3DCED
ROMP_0A3_013:
        ROMPTR  002 0FC                          * 3DF1D  ∫

* ROMPTR 0A3 014
* refs (1): 3DCED
ROMP_0A3_014:
        ROMPTR  002 0FE                          * 3DF28  Σ

* ROMPTR 0A3 015
* refs (1): 3DCED
ROMP_0A3_015:
        ROMPTR  002 04A                          * 3DF33  XROOT

* ROMPTR 0A3 016
* refs (1): 3DCED
ROMP_0A3_016:
        ROMPTR  002 05F                          * 3DF3E  LOG

* ROMPTR 0A3 017
* refs (1): 3DCED
ROMP_0A3_017:
        ROMPTR  002 05E                          * 3DF49  LN

* ROMPTR 0A3 018
* refs (1): 3DCED
ROMP_0A3_018:
        ::                                       * 3DF54
          PTR     Do1st/2nd+:                    * 3DF59
          xDUP                                   * 3DF5E
          DoNewMatrix                            * 3DF63
        ;                                        * 3DF68

* ROMPTR 0A3 019
* refs (1): 3DCED
ROMP_0A3_019:
        ROMPTR  0B2 000                          * 3DF6D

* ROMPTR 0A3 01A
* refs (1): 3DCED
ROMP_0A3_01A:
        ROMPTR  002 036                          * 3DF78  LASTARG

* ROMPTR 0A3 01B
* refs (1): 3DCED
ROMP_0A3_01B:
        ::                                       * 3DF83
          NoComLine?:(bip;q)                     * 3DF88
          OBJ_3E54A                              * 3DF8D
        ;                                        * 3DF92

* ROMPTR 0A3 01C
* refs (1): 3DCED
ROMP_0A3_01C:
        ::                                       * 3DF97
          NoComLine?:(bip;q)                     * 3DF9C
          OBJ_3E47F                              * 3DFA1
        ;                                        * 3DFA6

* ROMPTR 0A3 01D
* refs (1): 3DCED
ROMP_0A3_01D:
        ::                                       * 3DFAB
          TakeOver                               * 3DFB0
          EditLExists?                           * 3DFB5
          NOTcase                                * 3DFBA
          ::                                     * 3DFBF
            NULL$                                * 3DFC4
            OBJ_42CE2                            * 3DFC9
            SetPrgmEntry                         * 3DFCE
          ;                                      * 3DFD3
          SetDA23NoCh                            * 3DFD8
          PrgmEntry?                             * 3DFDD
          NOTcase                                * 3DFE2
          SetPrgmEntry                           * 3DFE7
          AlgEntry?                              * 3DFEC
          case                                   * 3DFF1
          ClrAlgEntry                            * 3DFF6
          SetAlgEntry                            * 3DFFB
        ;                                        * 3E000
