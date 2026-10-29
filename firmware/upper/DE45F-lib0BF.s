* HP 48GX ROM revision R, #DE45F-#DF08B: Library part 0BF
* Addresses in the right-hand comments are those of the original ROM.
* Follows on from the previous file (at #DE45F in the original ROM).
        ENDLENGTH                                * DE45F
        ENDLENGTH                                * DE45F

        CON(5)  DOLIB                            * DE45F  library object
        LENGTH                                   * DE464  length, to #DF08C
        CON(2)  0                                * DE469  title length

LIB0BF:
        CON(3)  #0BF                             * DE46B  library number
        REL(5)  LIB0BF.hash                      * DE46E  hash table
        REL(5)  ROMP_0BF_000                     * DE473  message table
        REL(5)  LIB0BF.link                      * DE478  link table
        CON(5)  0                                * DE47D  config

* ROMPTR 0BF 000
* refs (1): DE46B
ROMP_0BF_000:
        CON(5)  DOARRY                           * DE482  array 86
        LENGTH                                   * DE487  length, to #DF015
        CON(5)  DOCSTR                           * DE48C  element type
        CON(5)  1                                * DE491  dimensions
        CON(5)  86                               * DE496
        $BODY   "Solve equation\1F"              * DE49B  1
        $BODY   "Solve diff eq\1F"               * DE4BE  2
        $BODY   "Solve poly\1F"                  * DE4DF  3
        $BODY   "Solve lin sys\1F"               * DE4FA  4
        $BODY   "Solve finance\1F"               * DE51B  5
        $BODY   "Solve Equation"                 * DE53C  6
        $BODY   "Enter value or press SOLVE"     * DE55D  7
        $BODY   "Eq:"                            * DE596  8
        $BODY   "Enter function to solve"        * DE5A1  9
        $BODY   "Funcs in"                       * DE5D4  10
        $BODY   "Solver Variable Order"          * DE5E9  11
        $BODY   "Variables:"                     * DE618  12
        $BODY   "Enter order of vars to display" * DE631  13
        $BODY   "Solve y'(t)=f(t,y)"             * DE672  14
        $BODY   "f:"                             * DE69B  15
        $BODY   "∂f∂y:"                          * DE6A4  16
        $BODY   "∂f∂t:"                          * DE6B3  17
        $BODY   "Indep:"                         * DE6C2  18
        $BODY   "Init:"                          * DE6D3  19
        $BODY   "Final:"                         * DE6E2  20
        $BODY   "Soln:"                          * DE6F3  21
        $BODY   "Tol:"                           * DE702  22
        $BODY   "Step:"                          * DE70F  23
        $BODY   "Stiff"                          * DE71E  24
        $BODY   "Enter function of INDEP and SOLN" * DE72D  25
        $BODY   "Enter derivative w.r.t. SOLN"   * DE772  26
        $BODY   "Enter derivative w.r.t. INDEP"  * DE7AF  27
        $BODY   "Enter independent var name"     * DE7EE  28
        $BODY   "Enter initial indep var value"  * DE827  29
        $BODY   "Enter final indep var value"    * DE866  30
        $BODY   "Enter solution var name"        * DE8A1  31
        $BODY   "Enter initial solution var value" * DE8D4  32
        $BODY   "Press SOLVE for final soln value" * DE919  33
        $BODY   "Enter absolute error tolerance" * DE95E  34
        $BODY   "Enter initial step size"        * DE99F  35
        $BODY   "Calculate stiff differential?"  * DE9D2  36
        $BODY   "f"                              * DEA11  37
        $BODY   "Tolerance"                      * DEA18  38
        $BODY   "Solution"                       * DEA2F  39
        $BODY   "Solve an·x^n+\1F+a1·x+a0"       * DEA44  40
        $BODY   "Coefficients [ an \1F a1 a0 ]:" * DEA75  41
        $BODY   "Roots:"                         * DEAB2  42
        $BODY   "Enter coefficients or press SOLVE" * DEAC3  43
        $BODY   "Enter roots or press SOLVE"     * DEB0A  44
        $BODY   "Coefficients"                   * DEB43  45
        $BODY   "Roots"                          * DEB60  46
        $BODY   "Solve System A·X=B"             * DEB6F  47
        $BODY   "A:"                             * DEB98  48
        $BODY   "B:"                             * DEBA1  49
        $BODY   "X:"                             * DEBAA  50
        $BODY   "Enter coefficients matrix A"    * DEBB3  51
        $BODY   "Enter constants or press SOLVE" * DEBEE  52
        $BODY   "Enter solutions or press SOLVE" * DEC2F  53
        $BODY   "Constants"                      * DEC70  54
        $BODY   "Solutions"                      * DEC87  55
        $BODY   "N:"                             * DEC9E  56
        $BODY   "I%YR:"                          * DECA7  57
        $BODY   "PV:"                            * DECB6  58
        $BODY   "PMT:"                           * DECC1  59
        $BODY   "P/YR:"                          * DECCE  60
        $BODY   "FV:"                            * DECDD  61
        $BODY   "Enter no. of payments or SOLVE" * DECE8  62
        $BODY   "Enter yearly int rate or SOLVE" * DED29  63
        $BODY   "Enter present value or SOLVE"   * DED6A  64
        $BODY   "Enter payment amount or SOLVE"  * DEDA7  65
        $BODY   "Enter no. of payments per year" * DEDE6  66
        $BODY   "Enter future value or SOLVE"    * DEE27  67
        $BODY   "Choose when payments are made"  * DEE62  68
        $BODY   "Time Value of Money"            * DEEA1  69
        $BODY   "N"                              * DEECC  70
        $BODY   "I%/YR"                          * DEED3  71
        $BODY   "PV"                             * DEEE2  72
        $BODY   "PMT"                            * DEEEB  73
        $BODY   "FV"                             * DEEF6  74
        $BODY   "End"                            * DEEFF  75
        $BODY   "Begin"                          * DEF0A  76
        $BODY   "Beg"                            * DEF19  77
        $BODY   "Amortize"                       * DEF24  78
        $BODY   "Payments:"                      * DEF39  79
        $BODY   "Principal:"                     * DEF50  80
        $BODY   "Interest:"                      * DEF69  81
        $BODY   "Balance:"                       * DEF80  82
        $BODY   "Enter no. of payments to amort" * DEF95  83
        $BODY   "Principal"                      * DEFD6  84
        $BODY   "Interest"                       * DEFED  85
        $BODY   "Balance"                        * DF002  86
        ENDLENGTH                                * DF015

LIB0BF.hash:
        CON(5)  DOHSTR                           * DF015  hash table of library 0BF
        LENGTH                                   * DF01A  length, to #DF079
        CON(5)  0                                * DF01F  names of length 1
        CON(5)  0                                * DF024  names of length 2
        CON(5)  0                                * DF029  names of length 3
        CON(5)  0                                * DF02E  names of length 4
        CON(5)  0                                * DF033  names of length 5
        CON(5)  0                                * DF038  names of length 6
        CON(5)  0                                * DF03D  names of length 7
        CON(5)  0                                * DF042  names of length 8
        CON(5)  0                                * DF047  names of length 9
        CON(5)  0                                * DF04C  names of length 10
        CON(5)  0                                * DF051  names of length 11
        CON(5)  0                                * DF056  names of length 12
        CON(5)  0                                * DF05B  names of length 13
        CON(5)  0                                * DF060  names of length 14
        CON(5)  0                                * DF065  names of length 15
        CON(5)  0                                * DF06A  names of length 16
        REL(5)  L_DF074                          * DF06F  end of the names
L_DF074:
        CON(5)  0                                * DF074  command 000 has no name
        ENDLENGTH                                * DF079

LIB0BF.link:
        CON(5)  DOHSTR                           * DF079  link table of library 0BF
        LENGTH                                   * DF07E  length, to #DF088
        REL(5)  ROMP_0BF_000                     * DF083  000 
        ENDLENGTH                                * DF088
        BSS     4                                * DF088  zeros
