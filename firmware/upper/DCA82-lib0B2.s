* HP 48GX ROM revision R, #DCA82-#DCB82: Library part 0B2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #DCA82 in the original ROM).
        ENDLENGTH                                * DCA82

LIB0B2.link:
        CON(5)  DOHSTR                           * DCA82  link table of library 0B2
        LENGTH                                   * DCA87  length, to #DCB7C
        REL(5)  ROMP_0B2_000                     * DCA8C  000 
        REL(5)  ROMP_0B2_001                     * DCA91  001 
        REL(5)  ROMP_0B2_002                     * DCA96  002 
        REL(5)  ROMP_0B2_003                     * DCA9B  003 
        REL(5)  ROMP_0B2_004                     * DCAA0  004 
        REL(5)  ROMP_0B2_005                     * DCAA5  005 
        REL(5)  ROMP_0B2_006                     * DCAAA  006 
        REL(5)  ROMP_0B2_007                     * DCAAF  007 
        REL(5)  ROMP_0B2_008                     * DCAB4  008 
        REL(5)  ROMP_0B2_009                     * DCAB9  009 
        REL(5)  ROMP_0B2_00A                     * DCABE  00A 
        REL(5)  ROMP_0B2_00B                     * DCAC3  00B 
        REL(5)  ROMP_0B2_00C                     * DCAC8  00C 
        REL(5)  ROMP_0B2_00D                     * DCACD  00D 
        REL(5)  ROMP_0B2_00E                     * DCAD2  00E 
        REL(5)  ROMP_0B2_00F                     * DCAD7  00F 
        REL(5)  ROMP_0B2_010                     * DCADC  010 
        REL(5)  ROMP_0B2_011                     * DCAE1  011 
        REL(5)  ROMP_0B2_012                     * DCAE6  012 
        REL(5)  ROMP_0B2_013                     * DCAEB  013 
        REL(5)  ROMP_0B2_014                     * DCAF0  014 
        REL(5)  ROMP_0B2_015                     * DCAF5  015 
        REL(5)  ROMP_0B2_016                     * DCAFA  016 
        REL(5)  ROMP_0B2_017                     * DCAFF  017 
        REL(5)  ROMP_0B2_018                     * DCB04  018 
        REL(5)  ROMP_0B2_019                     * DCB09  019 
        REL(5)  ROMP_0B2_01A                     * DCB0E  01A 
        REL(5)  ROMP_0B2_01B                     * DCB13  01B 
        REL(5)  ROMP_0B2_01C                     * DCB18  01C 
        REL(5)  ROMP_0B2_01D                     * DCB1D  01D 
        REL(5)  ROMP_0B2_01E                     * DCB22  01E 
        REL(5)  ROMP_0B2_01F                     * DCB27  01F 
        REL(5)  ROMP_0B2_021                     * DCB2C  020 
        REL(5)  ROMP_0B2_021                     * DCB31  021 
        REL(5)  ROMP_0B2_022                     * DCB36  022 
        REL(5)  ROMP_0B2_023                     * DCB3B  023 
        REL(5)  ROMP_0B2_024                     * DCB40  024 
        REL(5)  ROMP_0B2_025                     * DCB45  025 
        REL(5)  ROMP_0B2_026                     * DCB4A  026 
        REL(5)  ROMP_0B2_027                     * DCB4F  027 
        REL(5)  ROMP_0B2_028                     * DCB54  028 
        REL(5)  ROMP_0B2_029                     * DCB59  029 
        REL(5)  ROMP_0B2_02A                     * DCB5E  02A 
        REL(5)  ROMP_0B2_02B                     * DCB63  02B 
        REL(5)  ROMP_0B2_02C                     * DCB68  02C 
        REL(5)  ROMP_0B2_02D                     * DCB6D  02D 
        REL(5)  ROMP_0B2_02E                     * DCB72  02E 
        REL(5)  ROMP_0B2_02F                     * DCB77  02F 
        ENDLENGTH                                * DCB7C
        ENDLENGTH                                * DCB7C

        LENGTH                                   * DCB7C  library object without its prolog (its place is the end of the link table before): length, to #DE45F
        CON(2)  0                                * DCB81  no title
