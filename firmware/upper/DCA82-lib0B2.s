* HP 48GX ROM revision R, #DCA82-#DCB82: Hash and link tables of library 0B2
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #DCA82 in the original ROM).
        ENDLENGTH                                * DCA82

LIB0B2.link:
        CON(5)  DOHSTR                           * DCA82  link table of library 0B2
        LENGTH                                   * DCA87  length, to #DCB7C
        REL(5)  DoCMD                            * DCA8C  000 
        REL(5)  DoCHARS                          * DCA91  001 
        REL(5)  CharMap                          * DCA96  002 
        REL(5)  CharMapForm                      * DCA9B  003 
        REL(5)  CharMapMsg                       * DCAA0  004 
        REL(5)  CharMapTitle                     * DCAA5  005 
        REL(5)  CharMapKeys                      * DCAAA  006 
        REL(5)  CharMapPage                      * DCAAF  007 
        REL(5)  CharMapInfo                      * DCAB4  008 
        REL(5)  CharKey>Grob                     * DCAB9  009 
        REL(5)  CharMapKeyTbl                    * DCABE  00A 
        REL(5)  CharMapPlain                     * DCAC3  00B 
        REL(5)  CharMapLS                        * DCAC8  00C 
        REL(5)  CharMapRS                        * DCACD  00D 
        REL(5)  CharDownKey                      * DCAD2  00E 
        REL(5)  CharDown                         * DCAD7  00F 
        REL(5)  CharBottom                       * DCADC  010 
        REL(5)  CharUpKey                        * DCAE1  011 
        REL(5)  CharUp                           * DCAE6  012 
        REL(5)  CharTop                          * DCAEB  013 
        REL(5)  CharRightKey                     * DCAF0  014 
        REL(5)  CharRight                        * DCAF5  015 
        REL(5)  CharRowEnd                       * DCAFA  016 
        REL(5)  CharLeftKey                      * DCAFF  017 
        REL(5)  CharLeft                         * DCB04  018 
        REL(5)  CharRowStart                     * DCB09  019 
        REL(5)  CharMapMenu                      * DCB0E  01A 
        REL(5)  CharPgDown                       * DCB13  01B 
        REL(5)  CharPgFirst                      * DCB18  01C 
        REL(5)  CharPgUp                         * DCB1D  01D 
        REL(5)  CharPgLast                       * DCB22  01E 
        REL(5)  CharEcho                         * DCB27  01F 
        REL(5)  CharCursor                       * DCB2C  020 
        REL(5)  CharCursor                       * DCB31  021 
        REL(5)  CharIcons                        * DCB36  022 
        REL(5)  CharKey>Grob~1                   * DCB3B  023 
        REL(5)  CharKey>Grob~2                   * DCB40  024 
        REL(5)  CharKey>Grob~3                   * DCB45  025 
        REL(5)  CharKey>Grob~4                   * DCB4A  026 
        REL(5)  CharKey>Grob~5                   * DCB4F  027 
        REL(5)  CharKey>Grob~6                   * DCB54  028 
        REL(5)  CharKey>Grob~7                   * DCB59  029 
        REL(5)  CharKey>Grob~8                   * DCB5E  02A 
        REL(5)  CharPage0                        * DCB63  02B 
        REL(5)  CharPage1                        * DCB68  02C 
        REL(5)  CharPage2                        * DCB6D  02D 
        REL(5)  CharPage3                        * DCB72  02E 
        REL(5)  CharKeyTbl                       * DCB77  02F 
        ENDLENGTH                                * DCB7C
        ENDLENGTH                                * DCB7C

        LENGTH                                   * DCB7C  library object without its prolog (its place is the end of the link table before): length, to #DE45F
        CON(2)  0                                * DCB81  no title
