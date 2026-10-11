* HP 48GX ROM revision R, #D4806-#D49CD: Library part 0E8
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #D4806 in the original ROM).

LIB0E8.hash:
        CON(5)  DOHSTR                           * D4806  hash table of library 0E8
        LENGTH                                   * D480B  length, to #D486A
        CON(5)  0                                * D4810  names of length 1
        CON(5)  0                                * D4815  names of length 2
        CON(5)  0                                * D481A  names of length 3
        CON(5)  0                                * D481F  names of length 4
        CON(5)  0                                * D4824  names of length 5
        CON(5)  0                                * D4829  names of length 6
        CON(5)  0                                * D482E  names of length 7
        CON(5)  0                                * D4833  names of length 8
        CON(5)  0                                * D4838  names of length 9
        CON(5)  0                                * D483D  names of length 10
        CON(5)  0                                * D4842  names of length 11
        CON(5)  0                                * D4847  names of length 12
        CON(5)  0                                * D484C  names of length 13
        CON(5)  0                                * D4851  names of length 14
        CON(5)  0                                * D4856  names of length 15
        CON(5)  0                                * D485B  names of length 16
        REL(5)  L_D4865                          * D4860  end of the names
L_D4865:
        CON(5)  0                                * D4865  command 000 has no name
        ENDLENGTH                                * D486A

LIB0E8.link:
        CON(5)  DOHSTR                           * D486A  link table of library 0E8
        LENGTH                                   * D486F  length, to #D49C3
        REL(5)  ROMP_0E8_000                     * D4874  000 
        REL(5)  ROMP_0E8_001                     * D4879  001 
        REL(5)  ROMP_0E8_002                     * D487E  002 
        REL(5)  ROMP_0E8_003                     * D4883  003 
        REL(5)  ROMP_0E8_004                     * D4888  004 
        REL(5)  ROMP_0E8_005                     * D488D  005 
        REL(5)  ROMP_0E8_006                     * D4892  006 
        REL(5)  ROMP_0E8_007                     * D4897  007 
        REL(5)  ROMP_0E8_008                     * D489C  008 
        REL(5)  ROMP_0E8_009                     * D48A1  009 
        REL(5)  ROMP_0E8_00A                     * D48A6  00A 
        REL(5)  ROMP_0E8_00B                     * D48AB  00B 
        REL(5)  ROMP_0E8_00C                     * D48B0  00C 
        REL(5)  ROMP_0E8_00D                     * D48B5  00D 
        REL(5)  ROMP_0E8_00E                     * D48BA  00E 
        REL(5)  ROMP_0E8_00F                     * D48BF  00F 
        REL(5)  ROMP_0E8_010                     * D48C4  010 
        REL(5)  ROMP_0E8_011                     * D48C9  011 
        REL(5)  ROMP_0E8_012                     * D48CE  012 
        REL(5)  ROMP_0E8_013                     * D48D3  013 
        REL(5)  ROMP_0E8_014                     * D48D8  014 
        REL(5)  ROMP_0E8_015                     * D48DD  015 
        REL(5)  ROMP_0E8_016                     * D48E2  016 
        REL(5)  ROMP_0E8_017                     * D48E7  017 
        REL(5)  ROMP_0E8_018                     * D48EC  018 
        REL(5)  ROMP_0E8_019                     * D48F1  019 
        REL(5)  ROMP_0E8_01A                     * D48F6  01A 
        REL(5)  ROMP_0E8_01B                     * D48FB  01B 
        REL(5)  ROMP_0E8_01C                     * D4900  01C 
        REL(5)  ROMP_0E8_01D                     * D4905  01D 
        REL(5)  ~INTEMPOB?                       * D490A  01E ~INTEMPOB?
        REL(5)  ROMP_0E8_01F                     * D490F  01F 
        REL(5)  ROMP_0E8_020                     * D4914  020 
        REL(5)  ROMP_0E8_021                     * D4919  021 
        REL(5)  ROMP_0E8_022                     * D491E  022 
        REL(5)  ROMP_0E8_023                     * D4923  023 
        REL(5)  ROMP_0E8_024                     * D4928  024 
        REL(5)  ROMP_0E8_025                     * D492D  025 
        REL(5)  ROMP_0E8_026                     * D4932  026 
        REL(5)  ROMP_0E8_027                     * D4937  027 
        REL(5)  ROMP_0E8_028                     * D493C  028 
        REL(5)  ROMP_0E8_029                     * D4941  029 
        REL(5)  ROMP_0E8_02A                     * D4946  02A 
        REL(5)  ROMP_0E8_02B                     * D494B  02B 
        REL(5)  ROMP_0E8_02C                     * D4950  02C 
        REL(5)  ROMP_0E8_02D                     * D4955  02D 
        REL(5)  ROMP_0E8_02E                     * D495A  02E 
        REL(5)  ROMP_0E8_02F                     * D495F  02F 
        REL(5)  ROMP_0E8_030                     * D4964  030 
        REL(5)  ROMP_0E8_031                     * D4969  031 
        REL(5)  ROMP_0E8_032                     * D496E  032 
        REL(5)  ROMP_0E8_033                     * D4973  033 
        REL(5)  ROMP_0E8_034                     * D4978  034 
        REL(5)  ROMP_0E8_035                     * D497D  035 
        REL(5)  ROMP_0E8_036                     * D4982  036 
        REL(5)  ROMP_0E8_037                     * D4987  037 
        REL(5)  ROMP_0E8_038                     * D498C  038 
        REL(5)  ROMP_0E8_039                     * D4991  039 
        REL(5)  ROMP_0E8_03A                     * D4996  03A 
        REL(5)  ROMP_0E8_03B                     * D499B  03B 
        REL(5)  ROMP_0E8_03C                     * D49A0  03C 
        REL(5)  ROMP_0E8_03D                     * D49A5  03D 
        REL(5)  ROMP_0E8_03E                     * D49AA  03E 
        REL(5)  ROMP_0E8_03F                     * D49AF  03F 
        REL(5)  ROMP_0E8_040                     * D49B4  040 
        REL(5)  ROMP_0E8_041                     * D49B9  041 
        REL(5)  ROMP_0E8_042                     * D49BE  042 
        ENDLENGTH                                * D49C3
        BSS     4                                * D49C3
        ENDLENGTH                                * D49C7
        NIBHEX  3805000                          * D49C7  √P.
