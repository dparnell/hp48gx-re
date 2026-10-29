* HP 48GX ROM revision R, #C4E26-#C5331: Library part 0AA
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #C4E26 in the original ROM).

LIB0AA:
        CON(3)  #0AA                             * C4E26  library number
        REL(5)  LIB0AA.hash                      * C4E29  hash table
        CON(5)  0                                * C4E2E  message table
        REL(5)  LIB0AA.link                      * C4E33  link table
        CON(5)  0                                * C4E38  config

* ROMPTR 0AA 000
* refs (1): C4E26
ROMP_0AA_000:
        CON(5)  DOARRY                           * C4E3D  array 12
        LENGTH                                   * C4E42  length, to #C4E9E
        CON(5)  DOROMP                           * C4E47  element type
        CON(5)  1                                * C4E4C  dimensions
        CON(5)  12                               * C4E51
        ROMPBODY 0A8 049                         * C4E56  key "PTYPE"
        ROMPBODY 0A8 04A                         * C4E5C  key "PPAR"
        ROMPBODY 0A8 001                         * C4E62
        ROMPBODY 002 0C5                         * C4E68  ERASE
        ROMPBODY 002 0C1                         * C4E6E  DRAX
        ROMPBODY 0A8 04B                         * C4E74
        ROMPBODY 0A8 04C                         * C4E7A  key "3D"
        ROMPBODY 0A8 04D                         * C4E80  key "STAT"
        ROMPBODY 0A8 04E                         * C4E86  key "FLAG"
        ROMPBODY 002 0C9                         * C4E8C  LABEL
        ROMPBODY 002 0C0                         * C4E92  AUTO
        ROMPBODY 0A8 004                         * C4E98  key "INFO"
        ENDLENGTH                                * C4E9E

* ROMPTR 0AA 001
* refs (1): C4E26
ROMP_0AA_001:
        CON(5)  DOARRY                           * C4E9E  array 12
        LENGTH                                   * C4EA3  length, to #C4EFF
        CON(5)  DOROMP                           * C4EA8  element type
        CON(5)  1                                * C4EAD  dimensions
        CON(5)  12                               * C4EB2
        ROMPBODY 002 0DC                         * C4EB7  FUNCTION
        ROMPBODY 002 0DD                         * C4EBD  CONIC
        ROMPBODY 002 0DE                         * C4EC3  POLAR
        ROMPBODY 002 0DF                         * C4EC9  PARAMETRIC
        ROMPBODY 002 0E0                         * C4ECF  TRUTH
        ROMPBODY 0AB 00E                         * C4ED5  DIFFEQ
        ROMPBODY 0A8 000                         * C4EDB
        ROMPBODY 0A8 000                         * C4EE1
        ROMPBODY 0A8 000                         * C4EE7
        ROMPBODY 0A8 000                         * C4EED
        ROMPBODY 0A8 000                         * C4EF3
        ROMPBODY 0A8 051                         * C4EF9  key "PLOT"
        ENDLENGTH                                * C4EFF

* ROMPTR 0AA 002
* refs (1): C4E26
ROMP_0AA_002:
        CON(5)  DOARRY                           * C4EFF  array 18
        LENGTH                                   * C4F04  length, to #C4F84
        CON(5)  DOROMP                           * C4F09  element type
        CON(5)  1                                * C4F0E  dimensions
        CON(5)  18                               * C4F13
        ROMPBODY 002 0B7                         * C4F18  INDEP
        ROMPBODY 002 0C4                         * C4F1E  DEPND
        ROMPBODY 002 0DA                         * C4F24  XRNG
        ROMPBODY 002 0DB                         * C4F2A  YRNG
        ROMPBODY 002 0BC                         * C4F30  RES
        ROMPBODY 0A8 052                         * C4F36  key "RESET"
        ROMPBODY 002 0BB                         * C4F3C  CENTR
        ROMPBODY 002 0C2                         * C4F42  SCALE
        ROMPBODY 002 0BE                         * C4F48  *W
        ROMPBODY 002 0BD                         * C4F4E  *H
        ROMPBODY 002 0BA                         * C4F54  AXES
        ROMPBODY 0AB 010                         * C4F5A  ATICK
        ROMPBODY 0A8 053                         * C4F60
        ROMPBODY 0A8 004                         * C4F66  key "INFO"
        ROMPBODY 0A8 000                         * C4F6C
        ROMPBODY 0A8 000                         * C4F72
        ROMPBODY 0A8 000                         * C4F78
        ROMPBODY 0A8 04F                         * C4F7E  key "PLOT"
        ENDLENGTH                                * C4F84

* ROMPTR 0AA 003
* refs (1): C4E26
ROMP_0AA_003:
        CON(5)  DOARRY                           * C4F84  array 12
        LENGTH                                   * C4F89  length, to #C4FE5
        CON(5)  DOROMP                           * C4F8E  element type
        CON(5)  1                                * C4F93  dimensions
        CON(5)  12                               * C4F98
        ROMPBODY 0AB 00C                         * C4F9D  SLOPEFIELD
        ROMPBODY 0AB 008                         * C4FA3  WIREFRAME
        ROMPBODY 0AB 00B                         * C4FA9  YSLICE
        ROMPBODY 0AB 00D                         * C4FAF  PCONTOUR
        ROMPBODY 0AB 00A                         * C4FB5  GRIDMAP
        ROMPBODY 0AB 009                         * C4FBB  PARSURFACE
        ROMPBODY 0A8 000                         * C4FC1
        ROMPBODY 0A8 000                         * C4FC7
        ROMPBODY 0A8 000                         * C4FCD
        ROMPBODY 0A8 000                         * C4FD3
        ROMPBODY 0A8 000                         * C4FD9
        ROMPBODY 0A8 056                         * C4FDF  key "3D"
        ENDLENGTH                                * C4FE5

* ROMPTR 0AA 004
* refs (1): C4E26
ROMP_0AA_004:
        CON(5)  DOARRY                           * C4FE5  array 18
        LENGTH                                   * C4FEA  length, to #C506A
        CON(5)  DOROMP                           * C4FEF  element type
        CON(5)  1                                * C4FF4  dimensions
        CON(5)  18                               * C4FF9
        ROMPBODY 0AB 000                         * C4FFE  XVOL
        ROMPBODY 0AB 001                         * C5004  YVOL
        ROMPBODY 0AB 002                         * C500A  ZVOL
        ROMPBODY 0AB 003                         * C5010  XXRNG
        ROMPBODY 0AB 004                         * C5016  YYRNG
        ROMPBODY 0A8 004                         * C501C  key "INFO"
        ROMPBODY 0AB 005                         * C5022  EYEPT
        ROMPBODY 0AB 006                         * C5028  NUMX
        ROMPBODY 0AB 007                         * C502E  NUMY
        ROMPBODY 0A8 057                         * C5034
        ROMPBODY 0A8 058                         * C503A  key "RESET"
        ROMPBODY 0A8 004                         * C5040  key "INFO"
        ROMPBODY 0A8 000                         * C5046
        ROMPBODY 0A8 000                         * C504C
        ROMPBODY 0A8 000                         * C5052
        ROMPBODY 0A8 000                         * C5058
        ROMPBODY 0A8 000                         * C505E
        ROMPBODY 0A8 04C                         * C5064  key "3D"
        ENDLENGTH                                * C506A

* ROMPTR 0AA 005
* refs (1): C4E26
ROMP_0AA_005:
        CON(5)  DOARRY                           * C506A  array 6
        LENGTH                                   * C506F  length, to #C50A7
        CON(5)  DOROMP                           * C5074  element type
        CON(5)  1                                * C5079  dimensions
        CON(5)  6                                * C507E
        ROMPBODY 002 0E3                         * C5083  BAR
        ROMPBODY 002 0E2                         * C5089  HISTOGRAM
        ROMPBODY 002 0E1                         * C508F  SCATTER
        ROMPBODY 0A8 000                         * C5095
        ROMPBODY 0A8 000                         * C509B
        ROMPBODY 0A8 05C                         * C50A1  key "STAT"
        ENDLENGTH                                * C50A7

* ROMPTR 0AA 006
* refs (1): C4E26
ROMP_0AA_006:
        CON(5)  DOARRY                           * C50A7  array 12
        LENGTH                                   * C50AC  length, to #C5108
        CON(5)  DOROMP                           * C50B1  element type
        CON(5)  1                                * C50B6  dimensions
        CON(5)  12                               * C50BB
        ROMPBODY 002 132                         * C50C0  XCOL
        ROMPBODY 002 133                         * C50C6  YCOL
        ROMPBODY 0A8 05D                         * C50CC  key "MODL"
        ROMPBODY 0A8 002                         * C50D2
        ROMPBODY 0A8 05E                         * C50D8  key "RESET"
        ROMPBODY 0A8 004                         * C50DE  key "INFO"
        ROMPBODY 0A8 000                         * C50E4
        ROMPBODY 0A8 000                         * C50EA
        ROMPBODY 0A8 000                         * C50F0
        ROMPBODY 0A8 000                         * C50F6
        ROMPBODY 0A8 000                         * C50FC
        ROMPBODY 0A8 04D                         * C5102  key "STAT"
        ENDLENGTH                                * C5108

* ROMPTR 0AA 007
* refs (1): C4E26
ROMP_0AA_007:
        CON(5)  DOARRY                           * C5108  array 6
        LENGTH                                   * C510D  length, to #C5145
        CON(5)  DOROMP                           * C5112  element type
        CON(5)  1                                * C5117  dimensions
        CON(5)  6                                * C511C
        ROMPBODY 002 13F                         * C5121  LINFIT
        ROMPBODY 002 140                         * C5127  LOGFIT
        ROMPBODY 002 141                         * C512D  EXPFIT
        ROMPBODY 002 142                         * C5133  PWRFIT
        ROMPBODY 002 143                         * C5139  BESTFIT
        ROMPBODY 0A8 05F                         * C513F  key "ΣPAR"
        ENDLENGTH                                * C5145

* ROMPTR 0AA 008
* refs (1): C4E26
ROMP_0AA_008:
        CON(5)  DOARRY                           * C5145  array 12
        LENGTH                                   * C514A  length, to #C51A6
        CON(5)  DOROMP                           * C514F  element type
        CON(5)  1                                * C5154  dimensions
        CON(5)  12                               * C5159
        ROMPBODY 002 132                         * C515E  XCOL
        ROMPBODY 002 133                         * C5164  YCOL
        ROMPBODY 0A8 071                         * C516A  key "MODL"
        ROMPBODY 0A8 002                         * C5170
        ROMPBODY 0A8 05E                         * C5176  key "RESET"
        ROMPBODY 0A8 004                         * C517C  key "INFO"
        ROMPBODY 0A8 000                         * C5182
        ROMPBODY 0A8 000                         * C5188
        ROMPBODY 0A8 000                         * C518E
        ROMPBODY 0A8 000                         * C5194
        ROMPBODY 0A8 000                         * C519A
        ROMPBODY 0A8 06B                         * C51A0  key "STAT"
        ENDLENGTH                                * C51A6

* ROMPTR 0AA 009
* refs (1): C4E26
ROMP_0AA_009:
        CON(5)  DOARRY                           * C51A6  array 6
        LENGTH                                   * C51AB  length, to #C51E3
        CON(5)  DOROMP                           * C51B0  element type
        CON(5)  1                                * C51B5  dimensions
        CON(5)  6                                * C51BA
        ROMPBODY 002 13F                         * C51BF  LINFIT
        ROMPBODY 002 140                         * C51C5  LOGFIT
        ROMPBODY 002 141                         * C51CB  EXPFIT
        ROMPBODY 002 142                         * C51D1  PWRFIT
        ROMPBODY 002 143                         * C51D7  BESTFIT
        ROMPBODY 0A8 072                         * C51DD  key "ΣPAR"
        ENDLENGTH                                * C51E3

* ROMPTR 0AA 00A
* refs (1): C4E26
ROMP_0AA_00A:
        CON(5)  DOARRY                           * C51E3  array 12
        LENGTH                                   * C51E8  length, to #C5244
        CON(5)  DOROMP                           * C51ED  element type
        CON(5)  1                                * C51F2  dimensions
        CON(5)  12                               * C51F7
        ROMPBODY 0A8 079                         * C51FC  key "IR"
        ROMPBODY 0A8 07A                         * C5202  key "ASCII"
        ROMPBODY 002 172                         * C5208  BAUD
        ROMPBODY 002 173                         * C520E  PARITY
        ROMPBODY 002 171                         * C5214  CKSM
        ROMPBODY 002 174                         * C521A  TRANSIO
        ROMPBODY 0A8 07B                         * C5220
        ROMPBODY 0A8 07C                         * C5226  key "RESET"
        ROMPBODY 0A8 004                         * C522C  key "INFO"
        ROMPBODY 0A8 000                         * C5232
        ROMPBODY 0A8 000                         * C5238
        ROMPBODY 0A8 077                         * C523E  key "I/O"
        ENDLENGTH                                * C5244

* ROMPTR 0AA 00B
* refs (1): C4E26
ROMP_0AA_00B:
        CON(5)  DOARRY                           * C5244  array 6
        LENGTH                                   * C5249  length, to #C5281
        CON(5)  DOROMP                           * C524E  element type
        CON(5)  1                                * C5253  dimensions
        CON(5)  6                                * C5258
        ROMPBODY 002 0F5                         * C525D  DELAY
        ROMPBODY 002 0EF                         * C5263  OLDPRT
        ROMPBODY 0A8 07E                         * C5269
        ROMPBODY 0A8 07F                         * C526F  key "RESET"
        ROMPBODY 0A8 004                         * C5275  key "INFO"
        ROMPBODY 0A8 075                         * C527B  key "PRINT"
        ENDLENGTH                                * C5281

LIB0AA.hash:
        CON(5)  DOHSTR                           * C5281  hash table of library 0AA
        LENGTH                                   * C5286  length, to #C52E5
        CON(5)  0                                * C528B  names of length 1
        CON(5)  0                                * C5290  names of length 2
        CON(5)  0                                * C5295  names of length 3
        CON(5)  0                                * C529A  names of length 4
        CON(5)  0                                * C529F  names of length 5
        CON(5)  0                                * C52A4  names of length 6
        CON(5)  0                                * C52A9  names of length 7
        CON(5)  0                                * C52AE  names of length 8
        CON(5)  0                                * C52B3  names of length 9
        CON(5)  0                                * C52B8  names of length 10
        CON(5)  0                                * C52BD  names of length 11
        CON(5)  0                                * C52C2  names of length 12
        CON(5)  0                                * C52C7  names of length 13
        CON(5)  0                                * C52CC  names of length 14
        CON(5)  0                                * C52D1  names of length 15
        CON(5)  0                                * C52D6  names of length 16
        REL(5)  L_C52E0                          * C52DB  end of the names
L_C52E0:
        CON(5)  0                                * C52E0  command 000 has no name
        ENDLENGTH                                * C52E5

LIB0AA.link:
        CON(5)  DOHSTR                           * C52E5  link table of library 0AA
        LENGTH                                   * C52EA  length, to #C532B
        REL(5)  ROMP_0AA_000                     * C52EF  000 
        REL(5)  ROMP_0AA_001                     * C52F4  001 
        REL(5)  ROMP_0AA_002                     * C52F9  002 
        REL(5)  ROMP_0AA_003                     * C52FE  003 
        REL(5)  ROMP_0AA_004                     * C5303  004 
        REL(5)  ROMP_0AA_005                     * C5308  005 
        REL(5)  ROMP_0AA_006                     * C530D  006 
        REL(5)  ROMP_0AA_007                     * C5312  007 
        REL(5)  ROMP_0AA_008                     * C5317  008 
        REL(5)  ROMP_0AA_009                     * C531C  009 
        REL(5)  ROMP_0AA_00A                     * C5321  00A 
        REL(5)  ROMP_0AA_00B                     * C5326  00B 
        ENDLENGTH                                * C532B
        NIBHEX  9A52000                          * C532B  ©%.
