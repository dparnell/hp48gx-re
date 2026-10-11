* HP 48GX ROM revision R, #E1A57-#E228A: Library part 0BA
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #E1A57 in the original ROM).
        ENDLENGTH                                * E1A57

        CON(5)  DOLIB                            * E1A57  library object
        LENGTH                                   * E1A5C  length, to #E228B
        CON(2)  0                                * E1A61  title length

LIB0BA:
        CON(3)  #0BA                             * E1A63  library number
        REL(5)  LIB0BA.hash                      * E1A66  hash table
        REL(5)  ROMP_0BA_000                     * E1A6B  message table
        REL(5)  LIB0BA.link                      * E1A70  link table
        CON(5)  0                                * E1A75  config

* ROMPTR 0BA 000
* refs (1): E1A63
ROMP_0BA_000:
        CON(5)  DOARRY                           * E1A7A  array 67
        LENGTH                                   * E1A7F  length, to #E2214
        CON(5)  DOCSTR                           * E1A84  element type
        CON(5)  1                                * E1A89  dimensions
        CON(5)  67                               * E1A8E
        $BODY   "Send to HP 48\1F"               * E1A93  1
        $BODY   "Get from HP 48"                 * E1AB4  2
        $BODY   "Print display"                  * E1AD5  3
        $BODY   "Print\1F"                       * E1AF4  4
        $BODY   "Transfer\1F"                    * E1B05  5
        $BODY   "Start Server"                   * E1B1C  6
        $BODY   "Enter names of vars to send"    * E1B39  7
        $BODY   "Vars in"                        * E1B74  8
        $BODY   "Send to HP 48"                  * E1B87  9
        $BODY   "Port:"                          * E1BA6  10
        $BODY   "Dbl-Space"                      * E1BB5  11
        $BODY   "Delay:"                         * E1BCC  12
        $BODY   "Xlat:"                          * E1BDD  13
        $BODY   "Linef"                          * E1BEC  14
        $BODY   "Baud:"                          * E1BFB  15
        $BODY   "Parity:"                        * E1C0A  16
        $BODY   "Len:"                           * E1C1D  17
        $BODY   "Choose print port"              * E1C2A  18
        $BODY   "Enter object(s) to print"       * E1C51  19
        $BODY   "Print extra space between lines?" * E1C86  20
        $BODY   "Enter delay between lines"      * E1CCB  21
        $BODY   "Choose character translations"  * E1D02  22
        $BODY   "Print linefeed between lines?"  * E1D41  23
        $BODY   "Choose baud rate"               * E1D80  24
        $BODY   "Choose parity"                  * E1DA5  25
        $BODY   "Enter printer line length"      * E1DC4  26
        $BODY   "Print"                          * E1DFB  27
        $BODY   "Type:"                          * E1E0A  28
        $BODY   "OvrW"                           * E1E19  29
        $BODY   "Fmt:"                           * E1E26  30
        $BODY   "Chk:"                           * E1E33  31
        $BODY   "Choose transfer port"           * E1E40  32
        $BODY   "Choose type of transfer"        * E1E6D  33
        $BODY   "Enter names of vars to transfer" * E1EA0  34
        $BODY   "Choose transfer format"         * E1EE3  35
        $BODY   "Choose checksum type"           * E1F14  36
        $BODY   "Overwrite existing variables?"  * E1F41  37
        $BODY   "Transfer"                       * E1F80  38
        $BODY   "Local vars"                     * E1F95  39
        $BODY   "Remote PC files"                * E1FAE  40
        $BODY   "Files in "                      * E1FD1  41
        $BODY   "Enter name of dir to change to" * E1FE8  42
        $BODY   "Choose Remote Directory"        * E2029  43
        $BODY   "Infrared"                       * E205C  44
        $BODY   "IR"                             * E2071  45
        $BODY   "Wire"                           * E207A  46
        $BODY   "Kermit"                         * E2087  47
        $BODY   "XModem"                         * E2098  48
        $BODY   "Odd"                            * E20A9  49
        $BODY   "Even"                           * E20B4  50
        $BODY   "Mark"                           * E20C1  51
        $BODY   "Space"                          * E20CE  52
        $BODY   "Spc"                            * E20DD  53
        $BODY   "ASCII"                          * E20E8  54
        $BODY   "ASC"                            * E20F7  55
        $BODY   "Binary"                         * E2102  56
        $BODY   "Bin"                            * E2113  57
        $BODY   "None"                           * E211E  58
        $BODY   "Newline (Ch 10)"                * E212B  59
        $BODY   "Newl"                           * E214E  60
        $BODY   "Chr 128-159"                    * E215B  61
        $BODY   "→159"                           * E2176  62
        $BODY   "→255"                           * E2183  63
        $BODY   "Chr 128-255"                    * E2190  64
        $BODY   "One-digit arith"                * E21AB  65
        $BODY   "Two-digit arith"                * E21CE  66
        $BODY   "Three-digit CRC"                * E21F1  67
        ENDLENGTH                                * E2214

LIB0BA.hash:
        CON(5)  DOHSTR                           * E2214  hash table of library 0BA
        LENGTH                                   * E2219  length, to #E2278
        CON(5)  0                                * E221E  names of length 1
        CON(5)  0                                * E2223  names of length 2
        CON(5)  0                                * E2228  names of length 3
        CON(5)  0                                * E222D  names of length 4
        CON(5)  0                                * E2232  names of length 5
        CON(5)  0                                * E2237  names of length 6
        CON(5)  0                                * E223C  names of length 7
        CON(5)  0                                * E2241  names of length 8
        CON(5)  0                                * E2246  names of length 9
        CON(5)  0                                * E224B  names of length 10
        CON(5)  0                                * E2250  names of length 11
        CON(5)  0                                * E2255  names of length 12
        CON(5)  0                                * E225A  names of length 13
        CON(5)  0                                * E225F  names of length 14
        CON(5)  0                                * E2264  names of length 15
        CON(5)  0                                * E2269  names of length 16
        REL(5)  L_E2273                          * E226E  end of the names
L_E2273:
        CON(5)  0                                * E2273  command 000 has no name
        ENDLENGTH                                * E2278

LIB0BA.link:
        CON(5)  DOHSTR                           * E2278  link table of library 0BA
        LENGTH                                   * E227D  length, to #E2287
        REL(5)  ROMP_0BA_000                     * E2282  000 
        ENDLENGTH                                * E2287
        NIBHEX  0000                             * E2287  ..
