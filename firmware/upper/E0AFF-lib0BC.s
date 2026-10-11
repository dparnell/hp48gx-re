* HP 48GX ROM revision R, #E0AFF-#E114A: Library part 0BC
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #E0AFF in the original ROM).
        ENDLENGTH                                * E0AFF

        CON(5)  DOLIB                            * E0AFF  library object
        LENGTH                                   * E0B04  length, to #E114B
        CON(2)  0                                * E0B09  title length

LIB0BC:
        CON(3)  #0BC                             * E0B0B  library number
        REL(5)  LIB0BC.hash                      * E0B0E  hash table
        REL(5)  ROMP_0BC_000                     * E0B13  message table
        REL(5)  LIB0BC.link                      * E0B18  link table
        CON(5)  0                                * E0B1D  config

* ROMPTR 0BC 000
* refs (1): E0B0B
ROMP_0BC_000:
        CON(5)  DOARRY                           * E0B22  array 59
        LENGTH                                   * E0B27  length, to #E10D4
        CON(5)  DOCSTR                           * E0B2C  element type
        CON(5)  1                                * E0B31  dimensions
        CON(5)  59                               * E0B36
        $BODY   "Browse alarms\1F"               * E0B3B  1
        $BODY   "Set alarm\1F"                   * E0B5C  2
        $BODY   "Set time, date\1F"              * E0B75  3
        $BODY   "Set Alarm"                      * E0B98  4
        $BODY   "Message:"                       * E0BAF  5
        $BODY   "Time:"                          * E0BC4  6
        $BODY   "Date:"                          * E0BD3  7
        $BODY   "Repeat:"                        * E0BE2  8
        $BODY   "Enter \"message\" or « action »" * E0BF5  9
        $BODY   "Enter hour"                     * E0C34  10
        $BODY   "Enter minute"                   * E0C4D  11
        $BODY   "Enter second"                   * E0C6A  12
        $BODY   "Choose AM, PM, or 24-hour time" * E0C87  13
        $BODY   "Enter month"                    * E0CC8  14
        $BODY   "Enter day"                      * E0CE3  15
        $BODY   "Enter year"                     * E0CFA  16
        $BODY   "Enter alarm repeat multiple"    * E0D13  17
        $BODY   "Enter alarm repeat unit"        * E0D4E  18
        $BODY   "Set Time and Date"              * E0D81  19
        $BODY   "Choose date display format"     * E0DA8  20
        $BODY   "Monday"                         * E0DE1  21
        $BODY   "Tuesday"                        * E0DF2  22
        $BODY   "Wednesday"                      * E0E05  23
        $BODY   "Thursday"                       * E0E1C  24
        $BODY   "Friday"                         * E0E31  25
        $BODY   "Saturday"                       * E0E42  26
        $BODY   "Sunday"                         * E0E57  27
        $BODY   "None"                           * E0E68  28
        $BODY   "AM"                             * E0E75  29
        $BODY   "PM"                             * E0E7E  30
        $BODY   "24-hour time"                   * E0E87  31
        $BODY   "24-hr"                          * E0EA4  32
        $BODY   " 1 January"                     * E0EB3  33
        $BODY   " 2 February"                    * E0ECC  34
        $BODY   " 3 March"                       * E0EE7  35
        $BODY   " 4 April"                       * E0EFC  36
        $BODY   " 5 May"                         * E0F11  37
        $BODY   " 6 June"                        * E0F22  38
        $BODY   " 7 July"                        * E0F35  39
        $BODY   " 8 August"                      * E0F48  40
        $BODY   " 9 September"                   * E0F5F  41
        $BODY   "10 October"                     * E0F7C  42
        $BODY   "11 November"                    * E0F95  43
        $BODY   "12 December"                    * E0FB0  44
        $BODY   "Week"                           * E0FCB  45
        $BODY   "Day"                            * E0FD8  46
        $BODY   "Hour"                           * E0FE3  47
        $BODY   "Minute"                         * E0FF0  48
        $BODY   "Second"                         * E1001  49
        $BODY   "Weeks"                          * E1012  50
        $BODY   "Days"                           * E1021  51
        $BODY   "Hours"                          * E102E  52
        $BODY   "Minutes"                        * E103D  53
        $BODY   "Seconds"                        * E1050  54
        $BODY   "Month/Day/Year"                 * E1063  55
        $BODY   "M/D/Y"                          * E1084  56
        $BODY   "Day.Month.Year"                 * E1093  57
        $BODY   "D.M.Y"                          * E10B4  58
        $BODY   "Alarms"                         * E10C3  59
        ENDLENGTH                                * E10D4

LIB0BC.hash:
        CON(5)  DOHSTR                           * E10D4  hash table of library 0BC
        LENGTH                                   * E10D9  length, to #E1138
        CON(5)  0                                * E10DE  names of length 1
        CON(5)  0                                * E10E3  names of length 2
        CON(5)  0                                * E10E8  names of length 3
        CON(5)  0                                * E10ED  names of length 4
        CON(5)  0                                * E10F2  names of length 5
        CON(5)  0                                * E10F7  names of length 6
        CON(5)  0                                * E10FC  names of length 7
        CON(5)  0                                * E1101  names of length 8
        CON(5)  0                                * E1106  names of length 9
        CON(5)  0                                * E110B  names of length 10
        CON(5)  0                                * E1110  names of length 11
        CON(5)  0                                * E1115  names of length 12
        CON(5)  0                                * E111A  names of length 13
        CON(5)  0                                * E111F  names of length 14
        CON(5)  0                                * E1124  names of length 15
        CON(5)  0                                * E1129  names of length 16
        REL(5)  L_E1133                          * E112E  end of the names
L_E1133:
        CON(5)  0                                * E1133  command 000 has no name
        ENDLENGTH                                * E1138

LIB0BC.link:
        CON(5)  DOHSTR                           * E1138  link table of library 0BC
        LENGTH                                   * E113D  length, to #E1147
        REL(5)  ROMP_0BC_000                     * E1142  000 
        ENDLENGTH                                * E1147
        NIBHEX  0000                             * E1147  ..
