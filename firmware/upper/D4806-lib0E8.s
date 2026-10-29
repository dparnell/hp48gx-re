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
        REL(5)  SEQ~1                            * D4874  000 
        REL(5)  DOSUBS~1                         * D4879  001 
        REL(5)  DOSUBS~2                         * D487E  002 
        REL(5)  ROMP_0E8_003                     * D4883  003 
        REL(5)  DOLIST~1                         * D4888  004 
        REL(5)  DOSUBS~3                         * D488D  005 
        REL(5)  ROMP_0E8_006                     * D4892  006 
        REL(5)  ROMP_0E8_007                     * D4897  007 
        REL(5)  DOLIST~2                         * D489C  008 
        REL(5)  ROMP_0E8_009                     * D48A1  009 
        REL(5)  DOLIST~3                         * D48A6  00A 
        REL(5)  DOLIST~4                         * D48AB  00B 
        REL(5)  ROMP_0E8_00C                     * D48B0  00C 
        REL(5)  ROMP_0E8_00D                     * D48B5  00D 
        REL(5)  ROMP_0E8_00E                     * D48BA  00E 
        REL(5)  ROMP_0E8_00F                     * D48BF  00F 
        REL(5)  ROMP_0E8_010                     * D48C4  010 
        REL(5)  ROMP_0E8_011                     * D48C9  011 
        REL(5)  ROMP_0E8_012                     * D48CE  012 
        REL(5)  ROMP_0E8_013                     * D48D3  013 
        REL(5)  ROMP_0E8_014                     * D48D8  014 
        REL(5)  ADD~1                            * D48DD  015 
        REL(5)  SORT~1                           * D48E2  016 
        REL(5)  SORT~1~1                         * D48E7  017 
        REL(5)  SORT~1~1~1                       * D48EC  018 
        REL(5)  SORT~1~2                         * D48F1  019 
        REL(5)  SORT~1~2~1                       * D48F6  01A 
        REL(5)  ROMP_0E8_01B                     * D48FB  01B 
        REL(5)  ROMP_0E8_01C                     * D4900  01C 
        REL(5)  ROMP_0E8_01D                     * D4905  01D 
        REL(5)  ~INTEMPOB?                       * D490A  01E ~INTEMPOB?
        REL(5)  xSUB~1                           * D490F  01F 
        REL(5)  xREPL~1                          * D4914  020 
        REL(5)  xREPL~1~1                        * D4919  021 
        REL(5)  xREPL~1~2                        * D491E  022 
        REL(5)  ROMP_0E8_023                     * D4923  023 
        REL(5)  xSUB~1~1                         * D4928  024 
        REL(5)  xSUB~1~2                         * D492D  025 
        REL(5)  xSUB~1~3                         * D4932  026 
        REL(5)  ROMP_0E8_027                     * D4937  027 
        REL(5)  xSUB~1~4                         * D493C  028 
        REL(5)  ROMP_0E8_029                     * D4941  029 
        REL(5)  ROMP_0E8_02A                     * D4946  02A 
        REL(5)  ROMP_0E8_02B                     * D494B  02B 
        REL(5)  ROMP_0E8_02C                     * D4950  02C 
        REL(5)  TEACH~1                          * D4955  02D 
        REL(5)  TEACH~1~1                        * D495A  02E 
        REL(5)  TEACH~1~2                        * D495F  02F 
        REL(5)  TEACH~1~3                        * D4964  030 
        REL(5)  TEACH~1~4                        * D4969  031 
        REL(5)  TEACH~1~5                        * D496E  032 
        REL(5)  TEACH~1~6                        * D4973  033 
        REL(5)  TEACH~1~7                        * D4978  034 
        REL(5)  TEACH~1~8                        * D497D  035 
        REL(5)  TEACH~1~9                        * D4982  036 
        REL(5)  TEACH~1~10                       * D4987  037 
        REL(5)  TEACH~1~11                       * D498C  038 
        REL(5)  TEACH~1~12                       * D4991  039 
        REL(5)  TEACH~1~13                       * D4996  03A 
        REL(5)  TEACH~1~14                       * D499B  03B 
        REL(5)  TEACH~1~15                       * D49A0  03C 
        REL(5)  TEACH~1~16                       * D49A5  03D 
        REL(5)  TEACH~1~17                       * D49AA  03E 
        REL(5)  ATICK~1                          * D49AF  03F 
        REL(5)  XSEND~1                          * D49B4  040 
        REL(5)  XRECV~1                          * D49B9  041 
        REL(5)  ROMP_0E8_042                     * D49BE  042 
        ENDLENGTH                                * D49C3
        BSS     4                                * D49C3
        ENDLENGTH                                * D49C7
        NIBHEX  3805000                          * D49C7  √P.
