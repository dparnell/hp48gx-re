* HP 48GX ROM revision R, #E228B-#E384A: Library part 0B9
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #E228B in the original ROM).
        ENDLENGTH                                * E228B

        CON(5)  DOLIB                            * E228B  library object
        LENGTH                                   * E2290  length, to #E384B
        CON(2)  0                                * E2295  title length

LIB0B9:
        CON(3)  #0B9                             * E2297  library number
        REL(5)  LIB0B9.hash                      * E229A  hash table
        REL(5)  ROMP_0B9_000                     * E229F  message table
        REL(5)  LIB0B9.link                      * E22A4  link table
        CON(5)  0                                * E22A9  config

* ROMPTR 0B9 000
* refs (1): E2297
ROMP_0B9_000:
        CON(5)  DOARRY                           * E22AE  array 155
        LENGTH                                   * E22B3  length, to #E37D4
        CON(5)  DOCSTR                           * E22B8  element type
        CON(5)  1                                * E22BD  dimensions
        CON(5)  155                              * E22C2
        $BODY   "Press [CONT] for menu"          * E22C7  1
        $BODY   "reset/delete this field"        * E22F6  2
        $BODY   "Reset value"                    * E2329  3
        $BODY   "Delete value"                   * E2344  4
        $BODY   "Reset all"                      * E2361  5
        $BODY   "Valid object types:"            * E2378  6
        $BODY   "Valid object type:"             * E23A3  7
        $BODY   "Any object"                     * E23CC  8
        $BODY   "Real number"                    * E23E5  9
        $BODY   "(Complex num)"                  * E2400  10
        $BODY   "\"String\""                     * E241F  11
        $BODY   "[ Real array ]"                 * E2434  12
        $BODY   "[(Cmpl array)]"                 * E2455  13
        $BODY   "{ List }"                       * E2476  14
        $BODY   "Name"                           * E248B  15
        $BODY   "« Program »"                    * E2498  16
        $BODY   "'Algebraic'"                    * E24B3  17
        $BODY   "# Binary int"                   * E24CE  18
        $BODY   "_Unit object"                   * E24EB  19
        $BODY   "Invalid object type"            * E2508  20
        $BODY   "Invalid object value"           * E2533  21
        $BODY   "Calculator Modes"               * E2560  22
        $BODY   "Number Format:"                 * E2585  23
        $BODY   "Angle Measure:"                 * E25A6  24
        $BODY   "Coord System:"                  * E25C7  25
        $BODY   "Beep"                           * E25E6  26
        $BODY   "Clock"                          * E25F3  27
        $BODY   "FM,"                            * E2602  28
        $BODY   "Choose number display format"   * E260D  29
        $BODY   "Enter decimal places to display" * E264A  30
        $BODY   "Choose angle measure"           * E268D  31
        $BODY   "Choose coordinate system"       * E26BA  32
        $BODY   "Enable standard beep?"          * E26EF  33
        $BODY   "Display ticking clock?"         * E271E  34
        $BODY   "Use comma as fraction mark?"    * E274F  35
        $BODY   "Standard"                       * E278A  36
        $BODY   "Std"                            * E279F  37
        $BODY   "Fixed"                          * E27AA  38
        $BODY   "Fix"                            * E27B9  39
        $BODY   "Scientific"                     * E27C4  40
        $BODY   "Sci"                            * E27DD  41
        $BODY   "Engineering"                    * E27E8  42
        $BODY   "Eng"                            * E2803  43
        $BODY   "Degrees"                        * E280E  44
        $BODY   "Deg"                            * E2821  45
        $BODY   "Radians"                        * E282C  46
        $BODY   "Rad"                            * E283F  47
        $BODY   "Grads"                          * E284A  48
        $BODY   "Grad"                           * E2859  49
        $BODY   "Rectangular"                    * E2866  50
        $BODY   "Polar"                          * E2881  51
        $BODY   "Spherical"                      * E2890  52
        $BODY   "System Flags"                   * E28A7  53
        $BODY   "01 General solutions"           * E28C4  54
        $BODY   "02 Constant → symb"             * E28F1  55
        $BODY   "03 Function → symb"             * E291A  56
        $BODY   "14 Payment at end"              * E2943  57
        $BODY   "19 →V2 → vector"                * E296A  58
        $BODY   "20 Underflow → 0"               * E298D  59
        $BODY   "21 Overflow → ±9E499"           * E29B2  60
        $BODY   "22 Infinite → error"            * E29DF  61
        $BODY   "27 'X+Y*i' → '(X,Y)'"           * E2A0A  62
        $BODY   "28 Sequential plot"             * E2A37  63
        $BODY   "29 Draw axes too"               * E2A60  64
        $BODY   "31 Connect points"              * E2A85  65
        $BODY   "32 Solid cursor"                * E2AAC  66
        $BODY   "33 Transfer via wire"           * E2ACF  67
        $BODY   "34 Print via IR"                * E2AFC  68
        $BODY   "35 ASCII transfer"              * E2B1F  69
        $BODY   "36 RECV renames"                * E2B46  70
        $BODY   "37 Single-space prnt"           * E2B69  71
        $BODY   "38 Add linefeeds"               * E2B96  72
        $BODY   "39 Show I/O messages"           * E2BBB  73
        $BODY   "40 Don't show clock"            * E2BE8  74
        $BODY   "41 12-hour clock"               * E2C13  75
        $BODY   "42 mm/dd/yy format"             * E2C38  76
        $BODY   "43 Reschedule alarm"            * E2C61  77
        $BODY   "44 Delete alarm"                * E2C8C  78
        $BODY   "51 Fraction mark: ."            * E2CAF  79
        $BODY   "52 Show many lines"             * E2CDA  80
        $BODY   "53 No extra parens"             * E2D03  81
        $BODY   "54 Tiny element → 0"            * E2D2C  82
        $BODY   "55 Save last args"              * E2D57  83
        $BODY   "56 Standard beep on"            * E2D7E  84
        $BODY   "57 Alarm beep on"               * E2DA9  85
        $BODY   "58 Show INFO"                   * E2DCE  86
L_E2DEB:
        $BODY   "59 Show variables"              * E2DEB  87
        $BODY   "60 [α][α] locks"                * E2E12  88
        $BODY   "61 [USR][USR] locks"            * E2E35  89
        $BODY   "62 User keys off"               * E2E60  90
        $BODY   "63 Custom ENTER off"            * E2E85  91
        $BODY   "01 Principal value"             * E2EB0  92
        $BODY   "02 Constant → num"              * E2ED9  93
        $BODY   "03 Function → num"              * E2F00  94
        $BODY   "14 Payment at begin"            * E2F27  95
        $BODY   "19 →V2 → complex"               * E2F52  96
        $BODY   "20 Underflow → error"           * E2F77  97
        $BODY   "21 Overflow → error"            * E2FA4  98
        $BODY   "22 Infinite → ±9E499"           * E2FCF  99
        $BODY   "27 'X+Y*i' → 'X+Y*i'"           * E2FFC  100
        $BODY   "28 Simultaneous plot"           * E3029  101
        $BODY   "29 Don't draw axes"             * E3056  102
        $BODY   "31 Plot points only"            * E307F  103
        $BODY   "32 Inverse cursor"              * E30AA  104
        $BODY   "33 Transfer via IR"             * E30D1  105
        $BODY   "34 Print via wire"              * E30FA  106
        $BODY   "35 Binary transfer"             * E3121  107
        $BODY   "36 RECV overwrites"             * E314A  108
        $BODY   "37 Double-space prnt"           * E3173  109
        $BODY   "38 No linefeeds"                * E31A0  110
        $BODY   "39 No I/O messages"             * E31C3  111
        $BODY   "40 Show clock"                  * E31EC  112
        $BODY   "41 24-hour clock"               * E320B  113
        $BODY   "42 dd.mm.yy format"             * E3230  114
        $BODY   "43 Don't reschedule"            * E3259  115
        $BODY   "44 Save alarm"                  * E3284  116
        $BODY   "51 Fraction mark: ,"            * E32A3  117
        $BODY   "52 Show one line"               * E32CE  118
        $BODY   "53 Show all parens"             * E32F3  119
        $BODY   "54 Use tiny element"            * E331C  120
        $BODY   "55 No last args"                * E3347  121
        $BODY   "56 Standard beep off"           * E336A  122
        $BODY   "57 Alarm beep off"              * E3397  123
        $BODY   "58 Don't show INFO"             * E33BE  124
        $BODY   "59 Show names only"             * E33E7  125
        $BODY   "60 [α] locks Alpha"             * E3410  126
        $BODY   "61 [USR] locks User"            * E3439  127
        $BODY   "62 User keys on"                * E3464  128
        $BODY   "63 Custom ENTER on"             * E3487  129
        $BODY   "Objects in"                     * E34B0  130
        $BODY   "Edit Variable"                  * E34C9  131
        $BODY   "Object:"                        * E34E8  132
        $BODY   "Enter new object"               * E34FB  133
        $BODY   "Obs in"                         * E3520  134
        $BODY   "Directories:"                   * E3531  135
        $BODY   "New Variable"                   * E354E  136
        $BODY   "Name:"                          * E356B  137
        $BODY   "Directory"                      * E357A  138
        $BODY   "Enter variable name"            * E3591  139
        $BODY   "Create a new directory?"        * E35BC  140
        $BODY   "Enter names of vars to copy"    * E35EF  141
        $BODY   "Copy To:"                       * E362A  142
        $BODY   "Copy Variable(s)"               * E363F  143
        $BODY   "Enter directory path"           * E3664  144
        $BODY   "Enter var name or directory path" * E3691  145
        $BODY   "Move To:"                       * E36D6  146
        $BODY   "Enter names of vars to move"    * E36EB  147
        $BODY   "Move Variable(s)"               * E3726  148
        $BODY   " Vars:"                         * E374B  149
        $BODY   "Mem Available:"                 * E375C  150
        $BODY   " bytes"                         * E377D  151
        $BODY   "Characters "                    * E378E  152
        $BODY   "Key:"                           * E37A9  153
        $BODY   "Num:"                           * E37B6  154
        $BODY   "(none)"                         * E37C3  155
        ENDLENGTH                                * E37D4

LIB0B9.hash:
        CON(5)  DOHSTR                           * E37D4  hash table of library 0B9
        LENGTH                                   * E37D9  length, to #E3838
        CON(5)  0                                * E37DE  names of length 1
        CON(5)  0                                * E37E3  names of length 2
        CON(5)  0                                * E37E8  names of length 3
        CON(5)  0                                * E37ED  names of length 4
        CON(5)  0                                * E37F2  names of length 5
        CON(5)  0                                * E37F7  names of length 6
        CON(5)  0                                * E37FC  names of length 7
        CON(5)  0                                * E3801  names of length 8
        CON(5)  0                                * E3806  names of length 9
        CON(5)  0                                * E380B  names of length 10
        CON(5)  0                                * E3810  names of length 11
        CON(5)  0                                * E3815  names of length 12
        CON(5)  0                                * E381A  names of length 13
        CON(5)  0                                * E381F  names of length 14
        CON(5)  0                                * E3824  names of length 15
        CON(5)  0                                * E3829  names of length 16
        REL(5)  L_E3833                          * E382E  end of the names
L_E3833:
        CON(5)  0                                * E3833  command 000 has no name
        ENDLENGTH                                * E3838

LIB0B9.link:
        CON(5)  DOHSTR                           * E3838  link table of library 0B9
        LENGTH                                   * E383D  length, to #E3847
        REL(5)  ROMP_0B9_000                     * E3842  000 
        ENDLENGTH                                * E3847
        NIBHEX  0000                             * E3847  ..
