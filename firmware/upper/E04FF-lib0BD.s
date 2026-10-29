* HP 48GX ROM revision R, #E04FF-#E0AFE: Library part 0BD
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #E04FF in the original ROM).
        ENDLENGTH                                * E04FF

        CON(5)  DOLIB                            * E04FF  library object
        LENGTH                                   * E0504  length, to #E0AFF
        CON(2)  0                                * E0509  title length

LIB0BD:
        CON(3)  #0BD                             * E050B  library number
        REL(5)  LIB0BD.hash                      * E050E  hash table
        REL(5)  ROMP_0BD_000                     * E0513  message table
        REL(5)  LIB0BD.link                      * E0518  link table
        CON(5)  0                                * E051D  config

* ROMPTR 0BD 000
* refs (1): E050B
ROMP_0BD_000:
        CON(5)  DOARRY                           * E0522  array 39
        LENGTH                                   * E0527  length, to #E0A88
        CON(5)  DOCSTR                           * E052C  element type
        CON(5)  1                                * E0531  dimensions
        CON(5)  39                               * E0536
        $BODY   "Integrate\1F"                   * E053B  1
        $BODY   "Differentiate\1F"               * E0554  2
        $BODY   "Taylor poly\1F"                 * E0575  3
        $BODY   "Isolate var\1F"                 * E0592  4
        $BODY   "Solve quad\1F"                  * E05AF  5
        $BODY   "Manip expr\1F"                  * E05CA  6
        $BODY   "Integrate"                      * E05E5  7
        $BODY   "Expr:"                          * E05FC  8
        $BODY   "Var:"                           * E060B  9
        $BODY   "Result:"                        * E0618  10
        $BODY   "Enter expression"               * E062B  11
        $BODY   "Enter variable name"            * E0650  12
        $BODY   "Enter lower limit"              * E067B  13
        $BODY   "Enter upper limit"              * E06A2  14
        $BODY   "Choose result type"             * E06C9  15
        $BODY   "Choose disp format for accuracy" * E06F2  16
        $BODY   "Differentiate"                  * E0735  17
        $BODY   "Value:"                         * E0754  18
        $BODY   "Enter variable value"           * E0765  19
        $BODY   "Expression"                     * E0792  20
        $BODY   "Taylor Polynomial"              * E07AB  21
        $BODY   "Order:"                         * E07D2  22
        $BODY   "Enter Taylor polynomial order"  * E07E3  23
        $BODY   "Isolate a Variable"             * E0822  24
        $BODY   "Principal"                      * E084B  25
        $BODY   "Get principal solution only?"   * E0862  26
        $BODY   "Solve Quadratic"                * E089F  27
        $BODY   "Manipulate Expression"          * E08C2  28
        $BODY   "Match Expression"               * E08F1  29
        $BODY   "Pattern:"                       * E0916  30
        $BODY   "Replacement:"                   * E092B  31
        $BODY   "Subexpr First"                  * E0948  32
        $BODY   "Cond:"                          * E0967  33
        $BODY   "Enter pattern to search for"    * E0976  34
        $BODY   "Enter replacement object"       * E09B1  35
        $BODY   "Search subexpressions first?"   * E09E6  36
        $BODY   "Enter conditional expression"   * E0A23  37
        $BODY   "Symbolic"                       * E0A60  38
        $BODY   "Numeric"                        * E0A75  39
        ENDLENGTH                                * E0A88

LIB0BD.hash:
        CON(5)  DOHSTR                           * E0A88  hash table of library 0BD
        LENGTH                                   * E0A8D  length, to #E0AEC
        CON(5)  0                                * E0A92  names of length 1
        CON(5)  0                                * E0A97  names of length 2
        CON(5)  0                                * E0A9C  names of length 3
        CON(5)  0                                * E0AA1  names of length 4
        CON(5)  0                                * E0AA6  names of length 5
        CON(5)  0                                * E0AAB  names of length 6
        CON(5)  0                                * E0AB0  names of length 7
        CON(5)  0                                * E0AB5  names of length 8
        CON(5)  0                                * E0ABA  names of length 9
        CON(5)  0                                * E0ABF  names of length 10
        CON(5)  0                                * E0AC4  names of length 11
        CON(5)  0                                * E0AC9  names of length 12
        CON(5)  0                                * E0ACE  names of length 13
        CON(5)  0                                * E0AD3  names of length 14
        CON(5)  0                                * E0AD8  names of length 15
        CON(5)  0                                * E0ADD  names of length 16
        REL(5)  L_E0AE7                          * E0AE2  end of the names
L_E0AE7:
        CON(5)  0                                * E0AE7  command 000 has no name
        ENDLENGTH                                * E0AEC

LIB0BD.link:
        CON(5)  DOHSTR                           * E0AEC  link table of library 0BD
        LENGTH                                   * E0AF1  length, to #E0AFB
        REL(5)  ROMP_0BD_000                     * E0AF6  000 
        ENDLENGTH                                * E0AFB
        BSS     4                                * E0AFB  zeros
