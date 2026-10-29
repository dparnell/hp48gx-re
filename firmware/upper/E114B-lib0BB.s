* HP 48GX ROM revision R, #E114B-#E1A56: Library part 0BB
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #E114B in the original ROM).
        ENDLENGTH                                * E114B

        CON(5)  DOLIB                            * E114B  library object
        LENGTH                                   * E1150  length, to #E1A57
        CON(2)  0                                * E1155  title length

LIB0BB:
        CON(3)  #0BB                             * E1157  library number
        REL(5)  LIB0BB.hash                      * E115A  hash table
        REL(5)  ROMP_0BB_000                     * E115F  message table
        REL(5)  LIB0BB.link                      * E1164  link table
        CON(5)  0                                * E1169  config

* ROMPTR 0BB 000
* refs (1): E1157
ROMP_0BB_000:
        CON(5)  DOARRY                           * E116E  array 63
        LENGTH                                   * E1173  length, to #E19E0
        CON(5)  DOCSTR                           * E1178  element type
        CON(5)  1                                * E117D  dimensions
        CON(5)  63                               * E1182
        $BODY   "Single-var\1F"                  * E1187  1
        $BODY   "Frequencies\1F"                 * E11A2  2
        $BODY   "Fit data\1F"                    * E11BF  3
        $BODY   "Summary stats\1F"               * E11D6  4
        $BODY   "Single-Variable Statistics"     * E11F7  5
        $BODY   "ΣDAT:"                          * E1230  6
        $BODY   "Type:"                          * E123F  7
        $BODY   "Mean"                           * E124E  8
        $BODY   "Std Dev"                        * E125B  9
        $BODY   "Variance"                       * E126E  10
        $BODY   "Total"                          * E1283  11
        $BODY   "Maximum"                        * E1292  12
        $BODY   "Minimum"                        * E12A5  13
        $BODY   "Enter statistical data"         * E12B8  14
        $BODY   "Enter variable column"          * E12E9  15
        $BODY   "Choose statistics type"         * E1318  16
        $BODY   "Calculate mean?"                * E1349  17
        $BODY   "Calculate standard deviation?"  * E136C  18
        $BODY   "Calculate variance?"            * E13AB  19
        $BODY   "Calculate column total?"        * E13D6  20
        $BODY   "Calculate column maximum?"      * E1409  21
        $BODY   "Calculate column minimum?"      * E1440  22
        $BODY   "Sample"                         * E1477  23
        $BODY   "Population"                     * E1488  24
        $BODY   "Frequencies"                    * E14A1  25
        $BODY   "X-Min:"                         * E14BC  26
        $BODY   "Bin Count:"                     * E14CD  27
        $BODY   "Bin Width:"                     * E14E6  28
        $BODY   "Enter minimum first bin X value" * E14FF  29
        $BODY   "Enter number of bins"           * E1542  30
        $BODY   "Enter bin width"                * E156F  31
        $BODY   "Fit Data"                       * E1592  32
        $BODY   "X-Col:"                         * E15A7  33
        $BODY   "Y-Col:"                         * E15B8  34
        $BODY   "Model:"                         * E15C9  35
        $BODY   "Enter indep column number"      * E15DA  36
        $BODY   "Enter dependent column number"  * E1611  37
        $BODY   "Choose statistical model"       * E1650  38
        $BODY   "Correlation"                    * E1685  39
        $BODY   "Covariance"                     * E16A0  40
        $BODY   "Predict Values"                 * E16B9  41
        $BODY   "Y:"                             * E16DA  42
        $BODY   "Enter indep value or press PRED" * E16E3  43
        $BODY   "Enter dep value or press PRED"  * E1726  44
        $BODY   "Summary Statistics"             * E1765  45
        $BODY   "Calculate:"                     * E178E  46
        $BODY   "ΣX"                             * E17A7  47
        $BODY   "ΣY"                             * E17B0  48
        $BODY   "ΣX2"                            * E17B9  49
        $BODY   "ΣY2"                            * E17C4  50
        $BODY   "ΣXY"                            * E17CF  51
        $BODY   "NΣ"                             * E17DA  52
        $BODY   "Calculate sum of X column?"     * E17E3  53
        $BODY   "Calculate sum of Y column?"     * E181C  54
        $BODY   "Calculate sum of squares of X?" * E1855  55
        $BODY   "Calculate sum of squares of Y?" * E1896  56
        $BODY   "Calculate sum of products?"     * E18D7  57
        $BODY   "Calculate number of data points?" * E1910  58
        $BODY   "Linear Fit"                     * E1955  59
        $BODY   "Logarithmic Fit"                * E196E  60
        $BODY   "Exponential Fit"                * E1991  61
        $BODY   "Power Fit"                      * E19B4  62
        $BODY   "Best Fit"                       * E19CB  63
        ENDLENGTH                                * E19E0

LIB0BB.hash:
        CON(5)  DOHSTR                           * E19E0  hash table of library 0BB
        LENGTH                                   * E19E5  length, to #E1A44
        CON(5)  0                                * E19EA  names of length 1
        CON(5)  0                                * E19EF  names of length 2
        CON(5)  0                                * E19F4  names of length 3
        CON(5)  0                                * E19F9  names of length 4
        CON(5)  0                                * E19FE  names of length 5
        CON(5)  0                                * E1A03  names of length 6
        CON(5)  0                                * E1A08  names of length 7
        CON(5)  0                                * E1A0D  names of length 8
        CON(5)  0                                * E1A12  names of length 9
        CON(5)  0                                * E1A17  names of length 10
        CON(5)  0                                * E1A1C  names of length 11
        CON(5)  0                                * E1A21  names of length 12
        CON(5)  0                                * E1A26  names of length 13
        CON(5)  0                                * E1A2B  names of length 14
        CON(5)  0                                * E1A30  names of length 15
        CON(5)  0                                * E1A35  names of length 16
        REL(5)  L_E1A3F                          * E1A3A  end of the names
L_E1A3F:
        CON(5)  0                                * E1A3F  command 000 has no name
        ENDLENGTH                                * E1A44

LIB0BB.link:
        CON(5)  DOHSTR                           * E1A44  link table of library 0BB
        LENGTH                                   * E1A49  length, to #E1A53
        REL(5)  ROMP_0BB_000                     * E1A4E  000 
        ENDLENGTH                                * E1A53
        BSS     4                                * E1A53  zeros
