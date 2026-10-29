* HP 48GX ROM revision R, #740E1-#760C8: Message tables
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: MsgTab(6) MsgTab(5) MsgTab(3) MsgTab(2) MsgTab(13) MsgTab(12) MsgTab(11) MsgTab(10) MsgTab(1)
* Follows on from the previous file (at #740E1 in the original ROM).
        ENDLENGTH                                * 740E1

MsgTab(10):
        CON(5)  DOARRY                           * 740E1  array 9
        LENGTH                                   * 740E6  length, to #741B5
        CON(5)  DOCSTR                           * 740EB  element type
        CON(5)  1                                * 740F0  dimensions
        CON(5)  9                                * 740F5
        $BODY   "Bad Guess(es)"                  * 740FA  1
        $BODY   "Constant?"                      * 74119  2
        $BODY   "Interrupted"                    * 74130  3
        $BODY   "Zero"                           * 7414B  4
        $BODY   "Sign Reversal"                  * 74158  5
        $BODY   "Extremum"                       * 74177  6
        $BODY   "Left"                           * 7418C  7
        $BODY   "Right"                          * 74199  8
        $BODY   "Expr"                           * 741A8  9
        ENDLENGTH                                * 741B5

MsgTab(12):
        CON(5)  DOARRY                           * 741B5  array 23
        LENGTH                                   * 741BA  length, to #74493
        CON(5)  DOCSTR                           * 741BF  element type
        CON(5)  1                                * 741C4  dimensions
        CON(5)  23                               * 741C9
        $BODY   "Bad Packet Block Check"         * 741CE  1
        $BODY   "Timeout"                        * 741FF  2
        $BODY   "Receive Error"                  * 74212  3
        $BODY   "Receive Buffer Overrun"         * 74231  4
        $BODY   "Parity Error"                   * 74262  5
        $BODY   "Transfer Failed"                * 7427F  6
        $BODY   "Protocol Error"                 * 742A2  7
        $BODY   "Invalid Server Cmd."            * 742C3  8
        $BODY   "Port Closed"                    * 742EE  9
        $BODY   "Connecting"                     * 74309  10
        $BODY   "Retry #"                        * 74322  11
        $BODY   "Awaiting Server Cmd."           * 74335  12
        $BODY   "Sending "                       * 74362  13
        $BODY   "Receiving "                     * 74377  14
        $BODY   "Object Discarded"               * 74390  15
        $BODY   "Packet #"                       * 743B5  16
        $BODY   "Processing Command"             * 743CA  17
        $BODY   "Invalid IOPAR"                  * 743F3  18
        $BODY   "Invalid PRTPAR"                 * 74412  19
        $BODY   "Low Battery"                    * 74433  20
        $BODY   "Empty Stack"                    * 7444E  21
        $BODY   "Row "                           * 74469  22
        $BODY   "Invalid Name"                   * 74476  23
        ENDLENGTH                                * 74493

MsgTab(13):
        CON(5)  DOARRY                           * 74493  array 4
        LENGTH                                   * 74498  length, to #7452E
        CON(5)  DOCSTR                           * 7449D  element type
        CON(5)  1                                * 744A2  dimensions
        CON(5)  4                                * 744A7
        $BODY   "Invalid Date"                   * 744AC  1
        $BODY   "Invalid Time"                   * 744C9  2
        $BODY   "Invalid Repeat"                 * 744E6  3
        $BODY   "Nonexistent Alarm"              * 74507  4
        ENDLENGTH                                * 7452E

MsgTab(11):
        CON(5)  DOARRY                           * 7452E  array 2
        LENGTH                                   * 74533  length, to #7458D
        CON(5)  DOCSTR                           * 74538  element type
        CON(5)  1                                * 7453D  dimensions
        CON(5)  2                                * 74542
        $BODY   "Invalid Unit"                   * 74547  1
        $BODY   "Inconsistent Units"             * 74564  2
        ENDLENGTH                                * 7458D

MsgTab(1):
        CON(5)  DOARRY                           * 7458D  array 62
        LENGTH                                   * 74592  length, to #74C58
        CON(5)  DOCSTR                           * 74597  element type
        CON(5)  1                                * 7459C  dimensions
        CON(5)  62                               * 745A1
        $BODY   "No Room to Save Stack"          * 745A6  1
        $BODY   "Can't Edit Null Char."          * 745D5  2
        $BODY   "Invalid User Function"          * 74604  3
        $BODY   "No Current Equation"            * 74633  4
        $BODY   ""                               * 7465E  5
        $BODY   "Invalid Syntax"                 * 74663  6
        $BODY   "Real Number"                    * 74684  7
        $BODY   "Complex Number"                 * 7469F  8
        $BODY   "String"                         * 746C0  9
        $BODY   "Real Array"                     * 746D1  10
        $BODY   "Complex Array"                  * 746EA  11
        $BODY   "List"                           * 74709  12
        $BODY   "Global Name"                    * 74716  13
        $BODY   "Local Name"                     * 74731  14
        $BODY   "Program"                        * 7474A  15
        $BODY   "Algebraic"                      * 7475D  16
        $BODY   "Binary Integer"                 * 74774  17
        $BODY   "Graphic"                        * 74795  18
        $BODY   "Tagged"                         * 747A8  19
        $BODY   "Unit"                           * 747B9  20
        $BODY   "XLIB Name"                      * 747C6  21
        $BODY   "Directory"                      * 747DD  22
        $BODY   "Library"                        * 747F4  23
        $BODY   "Backup"                         * 74807  24
        $BODY   "Function"                       * 74818  25
        $BODY   "Command"                        * 7482D  26
        $BODY   "System Binary"                  * 74840  27
        $BODY   "Long Real"                      * 7485F  28
        $BODY   "Long Complex"                   * 74876  29
        $BODY   "Linked Array"                   * 74893  30
        $BODY   "Character"                      * 748B0  31
        $BODY   "Code"                           * 748C7  32
        $BODY   "Library Data"                   * 748D4  33
        $BODY   "External"                       * 748F1  34
        $BODY   ""                               * 74906  35
        $BODY   "LAST STACK Disabled"            * 7490B  36
        $BODY   "LAST CMD Disabled"              * 74936  37
        $BODY   "HALT Not Allowed"               * 7495D  38
        $BODY   "Array"                          * 74982  39
        $BODY   "Wrong Argument Count"           * 74991  40
        $BODY   "Circular Reference"             * 749BE  41
        $BODY   "Directory Not Allowed"          * 749E7  42
        $BODY   "Non-Empty Directory"            * 74A16  43
        $BODY   "Invalid Definition"             * 74A41  44
        $BODY   "Missing Library"                * 74A6A  45
        $BODY   "Invalid PPAR"                   * 74A8D  46
        $BODY   "Non-Real Result"                * 74AAA  47
        $BODY   "Unable to Isolate"              * 74ACD  48
        $BODY   "No Room to Show Stack"          * 74AF4  49
        $BODY   "Warning:\0A"                    * 74B23  50
        $BODY   "Error:"                         * 74B3A  51
        $BODY   "Purge?"                         * 74B4B  52
        $BODY   "Out of Memory"                  * 74B5C  53
        $BODY   "Stack"                          * 74B7B  54
        $BODY   "Last Stack"                     * 74B8A  55
        $BODY   "Last Commands"                  * 74BA3  56
        $BODY   "Key Assignments"                * 74BC2  57
        $BODY   "Alarms"                         * 74BE5  58
        $BODY   "Last Arguments"                 * 74BF6  59
        $BODY   "Name Conflict"                  * 74C17  60
        $BODY   "Command Line"                   * 74C36  61
        $BODY   ""                               * 74C53  62
        ENDLENGTH                                * 74C58

MsgTab(2):
        CON(5)  DOARRY                           * 74C58  array 8
        LENGTH                                   * 74C5D  length, to #74DA7
        CON(5)  DOCSTR                           * 74C62  element type
        CON(5)  1                                * 74C67  dimensions
        CON(5)  8                                * 74C6C
        $BODY   "Too Few Arguments"              * 74C71  1
        $BODY   "Bad Argument Type"              * 74C98  2
        $BODY   "Bad Argument Value"             * 74CBF  3
        $BODY   "Undefined Name"                 * 74CE8  4
        $BODY   "LASTARG Disabled"               * 74D09  5
        $BODY   "Incomplete\0ASubexpression"     * 74D2E  6
        $BODY   "Implicit () off"                * 74D63  7
        $BODY   "Implicit () on"                 * 74D86  8
        ENDLENGTH                                * 74DA7

MsgTab(3):
        CON(5)  DOARRY                           * 74DA7  array 5
        LENGTH                                   * 74DAC  length, to #74E6F
        CON(5)  DOCSTR                           * 74DB1  element type
        CON(5)  1                                * 74DB6  dimensions
        CON(5)  5                                * 74DBB
        $BODY   "Positive Underflow"             * 74DC0  1
        $BODY   "Negative Underflow"             * 74DE9  2
        $BODY   "Overflow"                       * 74E12  3
        $BODY   "Undefined Result"               * 74E27  4
        $BODY   "Infinite Result"                * 74E4C  5
        ENDLENGTH                                * 74E6F

MsgTab(6):
        CON(5)  DOARRY                           * 74E6F  array 46
        LENGTH                                   * 74E74  length, to #75582
        CON(5)  DOCSTR                           * 74E79  element type
        CON(5)  1                                * 74E7E  dimensions
        CON(5)  46                               * 74E83
        $BODY   "Invalid Σ Data"                 * 74E88  1
        $BODY   "Nonexistent ΣDAT"               * 74EA9  2
        $BODY   "Insufficient Σ Data"            * 74ECE  3
        $BODY   "Invalid ΣPAR"                   * 74EF9  4
        $BODY   "Invalid Σ Data LN(Neg)"         * 74F16  5
        $BODY   "Invalid Σ Data LN(0)"           * 74F47  6
        $BODY   "Invalid EQ"                     * 74F74  7
        $BODY   "Current equation:"              * 74F8D  8
        $BODY   "No current equation."           * 74FB4  9
        $BODY   "Enter eqn, press NEW"           * 74FE1  10
        $BODY   "Name the equation,\0Apress ENTER" * 7500E  11
        $BODY   "Select plot type"               * 7504F  12
        $BODY   "Empty catalog"                  * 75074  13
        $BODY   "undefined"                      * 75093  14
        $BODY   "No stat data to plot"           * 750AA  15
        $BODY   "Autoscaling"                    * 750D7  16
        $BODY   "Solving for "                   * 750F2  17
        $BODY   "No current data. Enter"         * 7510F  18
        $BODY   "data point, press Σ+"           * 75140  19
        $BODY   "Select a model"                 * 7516D  20
        $BODY   "No alarms pending."             * 7518E  21
        $BODY   "Press ALRM to create"           * 751B7  22
        $BODY   "Next alarm:"                    * 751E4  23
        $BODY   "Past due alarm:"                * 751FF  24
        $BODY   "Acknowledged"                   * 75222  25
        $BODY   "Enter alarm, press SET"         * 7523F  26
        $BODY   "Select repeat interval"         * 75270  27
        $BODY   "    I/O setup menu"             * 752A1  28
        $BODY   "Plot type: "                    * 752CA  29
        $BODY   "\"\""                           * 752E5  30
        $BODY   " (OFF SCREEN)"                  * 752EE  31
        $BODY   "Invalid PTYPE"                  * 7530D  32
        $BODY   "Name the stat data,\0Apress ENTER" * 7532C  33
        $BODY   "Enter value (zoom out\0Aif >1), press ENTER" * 7536F  34
        $BODY   "Copied to stack"                * 753C6  35
        $BODY   "x axis zoom w/AUTO.\0A"         * 753E9  36
        $BODY   "x axis zoom.\0A"                * 75416  37
        $BODY   "y axis zoom.\0A"                * 75435  38
        $BODY   "x and y axis zoom.\0A"          * 75454  39
        $BODY   "IR/wire:       "                * 7547F  40
        $BODY   "ASCII/binary:  "                * 754A2  41
        $BODY   "baud:          "                * 754C5  42
        $BODY   "parity:        "                * 754E8  43
        $BODY   "checksum type: "                * 7550B  44
        $BODY   "translate code:"                * 7552E  45
        $BODY   "Enter matrix, then NEW"         * 75551  46
        ENDLENGTH                                * 75582

MsgTab(5):
        CON(5)  DOARRY                           * 75582  array 6
        LENGTH                                   * 75587  length, to #75675
        CON(5)  DOCSTR                           * 7558C  element type
        CON(5)  1                                * 75591  dimensions
        CON(5)  6                                * 75596
        $BODY   "Invalid Dimension"              * 7559B  1
        $BODY   "Invalid Array Element"          * 755C2  2
        $BODY   "Deleting Row"                   * 755F1  3
        $BODY   "Deleting Column"                * 7560E  4
        $BODY   "Inserting Row"                  * 75631  5
        $BODY   "Inserting Column"               * 75650  6
        ENDLENGTH                                * 75675

        CON(5)  DOHSTR                           * 75675  units table
        LENGTH                                   * 7567A  length, to #760C9
L_7567F:
        CON(4)  U.m-(*)                          * 7567F  names of 1 character
        CON(4)  U.Hz-(*)                         * 75683  names of 2 characters
        CON(4)  U.dyn-(*)                        * 75687  names of 3 characters
        CON(4)  U.acre-(*)                       * 7568B  names of 4 characters
        CON(4)  U.galUK-(*)                      * 7568F  names of 5 characters
        CON(4)  U.arcmin-(*)                     * 75693  names of 6 characters
        CON(4)  0                                * 75697  names of 7 characters
        CON(4)  0                                * 7569B  names of 8 characters
        CON(2)  U.l-(*)                          * 7569F  next name of this length
U.m:
        NIBASC  "m"                              * 756A1
        UDIMS   m                                * 756A3
        CON(1)  0                                * 756A6  pointer follows
        CON(5)  %%1                              * 756A7  factor
        CON(2)  U.g-(*)                          * 756AC  next name of this length
U.l:
        NIBASC  "l"                              * 756AE
        UDIMS   m^3                              * 756B0
        UFACT   1E-3                             * 756B3
        CON(2)  U.s-(*)                          * 756B7  next name of this length
U.g:
        NIBASC  "g"                              * 756B9
        UDIMS   kg                               * 756BB
        UFACT   1E-3                             * 756BD
        CON(2)  U.N-(*)                          * 756C1  next name of this length
U.s:
        NIBASC  "s"                              * 756C3
        UDIMS   s                                * 756C5
        CON(1)  0                                * 756CA  pointer follows
        CON(5)  %%1                              * 756CB  factor
        CON(2)  U.J-(*)                          * 756D0  next name of this length
U.N:
        NIBASC  "N"                              * 756D2
        UDIMS   kg m s^-2                        * 756D4
        CON(1)  0                                * 756D9  pointer follows
        CON(5)  %%1                              * 756DA  factor
        CON(2)  U.W-(*)                          * 756DF  next name of this length
U.J:
        NIBASC  "J"                              * 756E1
        UDIMS   kg m^2 s^-2                      * 756E3
        CON(1)  0                                * 756E8  pointer follows
        CON(5)  %%1                              * 756E9  factor
        CON(2)  U.A-(*)                          * 756EE  next name of this length
U.W:
        NIBASC  "W"                              * 756F0
        UDIMS   kg m^2 s^-3                      * 756F2
        CON(1)  0                                * 756F7  pointer follows
        CON(5)  %%1                              * 756F8  factor
        CON(2)  U.C-(*)                          * 756FD  next name of this length
U.A:
        NIBASC  "A"                              * 756FF
        UDIMS   A                                * 75701
        CON(1)  0                                * 75705  pointer follows
        CON(5)  %%1                              * 75706  factor
        CON(2)  U.T-(*)                          * 7570B  next name of this length
U.C:
        NIBASC  "C"                              * 7570D
        UDIMS   A s                              * 7570F
        CON(1)  0                                * 75714  pointer follows
        CON(5)  %%1                              * 75715  factor
        CON(2)  U.H-(*)                          * 7571A  next name of this length
U.T:
        NIBASC  "T"                              * 7571C
        UDIMS   kg A^-1 s^-2                     * 7571E
        CON(1)  0                                * 75723  pointer follows
        CON(5)  %%1                              * 75724  factor
        CON(2)  U.V-(*)                          * 75729  next name of this length
U.H:
        NIBASC  "H"                              * 7572B
        UDIMS   kg m^2 A^-2 s^-2                 * 7572D
        CON(1)  0                                * 75732  pointer follows
        CON(5)  %%1                              * 75733  factor
        CON(2)  U.S-(*)                          * 75738  next name of this length
U.V:
        NIBASC  "V"                              * 7573A
        UDIMS   kg m^2 A^-1 s^-3                 * 7573C
        CON(1)  0                                * 75741  pointer follows
        CON(5)  %%1                              * 75742  factor
        CON(2)  U.F-(*)                          * 75747  next name of this length
U.S:
        NIBASC  "S"                              * 75749
        UDIMS   kg^-1 m^-2 A^2 s^3               * 7574B
        CON(1)  0                                * 75750  pointer follows
        CON(5)  %%1                              * 75751  factor
        CON(2)  U.r-(*)                          * 75756  next name of this length
U.F:
        NIBASC  "F"                              * 75758
        UDIMS   kg^-1 m^-2 A^2 s^4               * 7575A
        CON(1)  0                                * 7575F  pointer follows
        CON(5)  %%1                              * 75760  factor
        CON(2)  U.a-(*)                          * 75765  next name of this length
U.r:
        NIBASC  "r"                              * 75767
        CON(1)  0                                * 75769  pointer follows
        CON(5)  UMSIN~3                          * 7576A  dimensions
        UFACT   5.72957795130823E1               * 7576F
        CON(2)  U.°-(*)                          * 75781  next name of this length
U.a:
        NIBASC  "a"                              * 75783
        UDIMS   m^2                              * 75785
        UFACT   1E2                              * 75788
        CON(2)  U.P-(*)                          * 7578C  next name of this length
U.°:
        NIBASC  "°"                              * 7578E
        CON(1)  0                                * 75790  pointer follows
        CON(5)  UMSIN~3                          * 75791  dimensions
        CON(1)  0                                * 75796  pointer follows
        CON(5)  %%1                              * 75797  factor
        CON(2)  U.R-(*)                          * 7579C  next name of this length
U.P:
        NIBASC  "P"                              * 7579E
        UDIMS   kg m^-1 s^-1                     * 757A0
        UFACT   1E-1                             * 757A5
        CON(2)  U.1-(*)                          * 757A9  next name of this length
U.R:
        NIBASC  "R"                              * 757AB
        UDIMS   kg^-1 A s                        * 757AD
        UFACT   2.58E-4                          * 757B2
        CON(2)  U.?-(*)                          * 757B8  next name of this length
U.1:
        NIBASC  "1"                              * 757BA
        CON(1)  1                                * 757BC  1 digits
        NIBHEX  0                                * 757BD
        CON(1)  0                                * 757BE  pointer follows
        CON(5)  %%1                              * 757BF  factor
        CON(2)  U.h-(*)                          * 757C4  next name of this length
U.?:
        NIBASC  "?"                              * 757C6
        CON(1)  10                               * 757C8  10 digits
        NIBHEX  0000000001                       * 757C9
        CON(1)  0                                * 757D3  pointer follows
        CON(5)  %%1                              * 757D4  factor
        CON(2)  U.d-(*)                          * 757D9  next name of this length
U.h:
        NIBASC  "h"                              * 757DB
        UDIMS   s                                * 757DD
        UFACT   3.6E3                            * 757E2
        CON(2)  U.µ-(*)                          * 757E7  next name of this length
U.d:
        NIBASC  "d"                              * 757E9
        UDIMS   s                                * 757EB
        UFACT   8.64E4                           * 757F0
        CON(2)  U.b-(*)                          * 757F6  next name of this length
U.µ:
        NIBASC  "µ"                              * 757F8
        UDIMS   m                                * 757FA
        UFACT   1E-6                             * 757FD
        CON(2)  U.t-(*)                          * 75801  next name of this length
U.b:
        NIBASC  "b"                              * 75803
        UDIMS   m^2                              * 75805
        UFACT   1E-28                            * 75808
        CON(2)  U.u-(*)                          * 7580C  next name of this length
U.t:
        NIBASC  "t"                              * 7580E
        UDIMS   kg                               * 75810
        UFACT   1E3                              * 75812
        CON(2)  U.c-(*)                          * 75816  next name of this length
U.u:
        NIBASC  "u"                              * 75818
        UDIMS   kg                               * 7581A
        UFACT   1.6605402E-27                    * 7581C
        CON(2)  U.Ω-(*)                          * 75827  next name of this length
U.c:
        NIBASC  "c"                              * 75829
        UDIMS   m s^-1                           * 7582B
        UFACT   2.99792458E8                     * 75830
        CON(2)  U.K-(*)                          * 7583C  next name of this length
U.Ω:
        NIBASC  "Ω"                              * 7583E
        UDIMS   kg m^2 A^-2 s^-3                 * 75840
        CON(1)  0                                * 75845  pointer follows
        CON(5)  %%1                              * 75846  factor
        CON(2)  U.Å-(*)                          * 7584B  next name of this length
U.K:
        NIBASC  "K"                              * 7584D
        CON(1)  0                                * 7584F  pointer follows
        CON(5)  puretemp?~1                      * 75850  dimensions
        CON(1)  0                                * 75855  pointer follows
        CON(5)  %%1                              * 75856  factor
        CON(2)  0                                * 7585B  last of this length
U.Å:
        NIBASC  "Å"                              * 7585D
        UDIMS   m                                * 7585F
        UFACT   1E-10                            * 75862
        CON(2)  U.Pa-(*)                         * 75866  next name of this length
U.Hz:
        NIBASC  "Hz"                             * 75868
        UDIMS   s^-1                             * 7586C
        CON(1)  0                                * 75871  pointer follows
        CON(5)  %%1                              * 75872  factor
        CON(2)  U.Wb-(*)                         * 75877  next name of this length
U.Pa:
        NIBASC  "Pa"                             * 75879
        UDIMS   kg m^-1 s^-2                     * 7587D
        CON(1)  0                                * 75882  pointer follows
        CON(5)  %%1                              * 75883  factor
        CON(2)  U.lb-(*)                         * 75888  next name of this length
U.Wb:
        NIBASC  "Wb"                             * 7588A
        UDIMS   kg m^2 A^-1 s^-2                 * 7588E
        CON(1)  0                                * 75893  pointer follows
        CON(5)  %%1                              * 75894  factor
        CON(2)  U.in-(*)                         * 75899  next name of this length
U.lb:
        NIBASC  "lb"                             * 7589B
        UDIMS   kg                               * 7589F
        UFACT   4.5359237E-1                     * 758A1
        CON(2)  U.ft-(*)                         * 758AC  next name of this length
U.in:
        NIBASC  "in"                             * 758AE
        UDIMS   m                                * 758B2
        UFACT   2.54E-2                          * 758B5
        CON(2)  U.st-(*)                         * 758BB  next name of this length
U.ft:
        NIBASC  "ft"                             * 758BD
        UDIMS   m                                * 758C1
        UFACT   3.048E-1                         * 758C4
        CON(2)  U.Bq-(*)                         * 758CB  next name of this length
U.st:
        NIBASC  "st"                             * 758CD
        UDIMS   m^3                              * 758D1
        CON(1)  0                                * 758D4  pointer follows
        CON(5)  %%1                              * 758D5  factor
        CON(2)  U.Ci-(*)                         * 758DA  next name of this length
U.Bq:
        NIBASC  "Bq"                             * 758DC
        UDIMS   s^-1                             * 758E0
        CON(1)  0                                * 758E5  pointer follows
        CON(5)  %%1                              * 758E6  factor
        CON(2)  U.ga-(*)                         * 758EB  next name of this length
U.Ci:
        NIBASC  "Ci"                             * 758ED
        UDIMS   s^-1                             * 758F1
        UFACT   3.7E10                           * 758F6
        CON(2)  U.gf-(*)                         * 758FB  next name of this length
U.ga:
        NIBASC  "ga"                             * 758FD
        UDIMS   m s^-2                           * 75901
        UFACT   9.80665E0                        * 75906
        CON(2)  U.St-(*)                         * 7590F  next name of this length
U.gf:
        NIBASC  "gf"                             * 75911
        UDIMS   kg m s^-2                        * 75915
        UFACT   9.80665E-3                       * 7591A
        CON(2)  U.Gy-(*)                         * 75923  next name of this length
U.St:
        NIBASC  "St"                             * 75925
        UDIMS   m^2 s^-1                         * 75929
        UFACT   1E-4                             * 7592E
        CON(2)  U.Sv-(*)                         * 75932  next name of this length
U.Gy:
        NIBASC  "Gy"                             * 75934
        UDIMS   m^2 s^-2                         * 75938
        CON(1)  0                                * 7593D  pointer follows
        CON(5)  %%1                              * 7593E  factor
        CON(2)  U.eV-(*)                         * 75943  next name of this length
U.Sv:
        NIBASC  "Sv"                             * 75945
        UDIMS   m^2 s^-2                         * 75949
        CON(1)  0                                * 7594E  pointer follows
        CON(5)  %%1                              * 7594F  factor
        CON(2)  U.cd-(*)                         * 75954  next name of this length
U.eV:
        NIBASC  "eV"                             * 75956
        UDIMS   kg m^2 s^-2                      * 7595A
        UFACT   1.60217733E-19                   * 7595F
        CON(2)  U.sr-(*)                         * 7596B  next name of this length
U.cd:
        NIBASC  "cd"                             * 7596D
        UDIMS   cd                               * 75971
        CON(1)  0                                * 75978  pointer follows
        CON(5)  %%1                              * 75979  factor
        CON(2)  U.mi-(*)                         * 7597E  next name of this length
U.sr:
        NIBASC  "sr"                             * 75980
        UDIMS   sr                               * 75984
        CON(1)  0                                * 7598E  pointer follows
        CON(5)  %%1                              * 7598F  factor
        CON(2)  U.yr-(*)                         * 75994  next name of this length
U.mi:
        NIBASC  "mi"                             * 75996
        UDIMS   m                                * 7599A
        UFACT   1.609344E3                       * 7599D
        CON(2)  U.pc-(*)                         * 759A7  next name of this length
U.yr:
        NIBASC  "yr"                             * 759A9
        UDIMS   s                                * 759AD
        UFACT   3.15569259747E7                  * 759B2
        CON(2)  U.qt-(*)                         * 759C1  next name of this length
U.pc:
        NIBASC  "pc"                             * 759C3
        UDIMS   m                                * 759C7
        UFACT   3.08567818584725E16              * 759CA
        CON(2)  U.oz-(*)                         * 759DC  next name of this length
U.qt:
        NIBASC  "qt"                             * 759DE
        UDIMS   m^3                              * 759E2
        UFACT   9.46352946E-4                    * 759E5
        CON(2)  U.yd-(*)                         * 759F1  next name of this length
U.oz:
        NIBASC  "oz"                             * 759F3
        UDIMS   kg                               * 759F7
        UFACT   2.8349523125E-2                  * 759F9
        CON(2)  U.pt-(*)                         * 75A07  next name of this length
U.yd:
        NIBASC  "yd"                             * 75A09
        UDIMS   m                                * 75A0D
        UFACT   9.144E-1                         * 75A10
        CON(2)  U.°C-(*)                         * 75A17  next name of this length
U.pt:
        NIBASC  "pt"                             * 75A19
        UDIMS   m^3                              * 75A1D
        UFACT   4.73176473E-4                    * 75A20
        CON(2)  U.°F-(*)                         * 75A2C  next name of this length
U.°C:
        NIBASC  "°C"                             * 75A2E
        CON(1)  0                                * 75A32  pointer follows
        CON(5)  puretemp?~1                      * 75A33  dimensions
        CON(1)  0                                * 75A38  pointer follows
        CON(5)  cfC                              * 75A39  factor
        CON(2)  U.°R-(*)                         * 75A3E  next name of this length
U.°F:
        NIBASC  "°F"                             * 75A40
        CON(1)  0                                * 75A44  pointer follows
        CON(5)  puretemp?~1                      * 75A45  dimensions
        CON(1)  0                                * 75A4A  pointer follows
        CON(5)  cfF                              * 75A4B  factor
        CON(2)  U.lm-(*)                         * 75A50  next name of this length
U.°R:
        NIBASC  "°R"                             * 75A52
        CON(1)  0                                * 75A56  pointer follows
        CON(5)  puretemp?~1                      * 75A57  dimensions
        UFACT   5.55555555555556E-1              * 75A5C
        CON(2)  U.sb-(*)                         * 75A6E  next name of this length
U.lm:
        NIBASC  "lm"                             * 75A70
        UDIMS   cd sr                            * 75A74
        CON(1)  0                                * 75A7E  pointer follows
        CON(5)  %%1                              * 75A7F  factor
        CON(2)  U.cu-(*)                         * 75A84  next name of this length
U.sb:
        NIBASC  "sb"                             * 75A86
        UDIMS   m^-2 cd                          * 75A8A
        UFACT   1E4                              * 75A91
        CON(2)  U.rd-(*)                         * 75A95  next name of this length
U.cu:
        NIBASC  "cu"                             * 75A97
        UDIMS   m^3                              * 75A9B
        UFACT   2.365882365E-4                   * 75A9E
        CON(2)  U.lx-(*)                         * 75AAB  next name of this length
U.rd:
        NIBASC  "rd"                             * 75AAD
        UDIMS   m                                * 75AB1
        UFACT   5.02921005842012E0               * 75AB4
        CON(2)  U.ct-(*)                         * 75AC6  next name of this length
U.lx:
        NIBASC  "lx"                             * 75AC8
        UDIMS   m^-2 cd sr                       * 75ACC
        CON(1)  0                                * 75AD6  pointer follows
        CON(5)  %%1                              * 75AD7  factor
        CON(2)  U.bu-(*)                         * 75ADC  next name of this length
U.ct:
        NIBASC  "ct"                             * 75ADE
        UDIMS   kg                               * 75AE2
        UFACT   2E-4                             * 75AE4
        CON(2)  U.pk-(*)                         * 75AE8  next name of this length
U.bu:
        NIBASC  "bu"                             * 75AEA
        UDIMS   m^3                              * 75AEE
        UFACT   3.523907E-2                      * 75AF1
        CON(2)  U.hp-(*)                         * 75AFB  next name of this length
U.pk:
        NIBASC  "pk"                             * 75AFD
        UDIMS   m^3                              * 75B01
        UFACT   8.8097675E-3                     * 75B04
        CON(2)  U.ph-(*)                         * 75B0F  next name of this length
U.hp:
        NIBASC  "hp"                             * 75B11
        UDIMS   kg m^2 s^-3                      * 75B15
        UFACT   7.4569987158227E2                * 75B1A
        CON(2)  U.au-(*)                         * 75B2B  next name of this length
U.ph:
        NIBASC  "ph"                             * 75B2D
        UDIMS   m^-2 cd sr                       * 75B31
        UFACT   1E4                              * 75B3B
        CON(2)  U.fc-(*)                         * 75B3F  next name of this length
U.au:
        NIBASC  "au"                             * 75B41
        UDIMS   m                                * 75B45
        UFACT   1.495979E11                      * 75B48
        CON(2)  0                                * 75B52  last of this length
U.fc:
        NIBASC  "fc"                             * 75B54
        UDIMS   m^-2 cd sr                       * 75B58
        UFACT   1.07639104167097E1               * 75B62
        CON(2)  U.erg-(*)                        * 75B74  next name of this length
U.dyn:
        NIBASC  "dyn"                            * 75B76
        UDIMS   kg m s^-2                        * 75B7C
        UFACT   1E-5                             * 75B81
        CON(2)  U.bar-(*)                        * 75B85  next name of this length
U.erg:
        NIBASC  "erg"                            * 75B87
        UDIMS   kg m^2 s^-2                      * 75B8D
        UFACT   1E-7                             * 75B92
        CON(2)  U.mho-(*)                        * 75B96  next name of this length
U.bar:
        NIBASC  "bar"                            * 75B98
        UDIMS   kg m^-1 s^-2                     * 75B9E
        UFACT   1E5                              * 75BA3
        CON(2)  U.cal-(*)                        * 75BA7  next name of this length
U.mho:
        NIBASC  "mho"                            * 75BA9
        UDIMS   kg^-1 m^-2 A^2 s^3               * 75BAF
        CON(1)  0                                * 75BB4  pointer follows
        CON(5)  %%1                              * 75BB5  factor
        CON(2)  U.fbm-(*)                        * 75BBA  next name of this length
U.cal:
        NIBASC  "cal"                            * 75BBC
        UDIMS   kg m^2 s^-2                      * 75BC2
        UFACT   4.1868E0                         * 75BC7
        CON(2)  U.rad-(*)                        * 75BCF  next name of this length
U.fbm:
        NIBASC  "fbm"                            * 75BD1
        UDIMS   m^3                              * 75BD7
        UFACT   2.359737216E-3                   * 75BDA
        CON(2)  U.rem-(*)                        * 75BE7  next name of this length
U.rad:
        NIBASC  "rad"                            * 75BE9
        UDIMS   m^2 s^-2                         * 75BEF
        UFACT   1E-2                             * 75BF4
        CON(2)  U.Fdy-(*)                        * 75BF8  next name of this length
U.rem:
        NIBASC  "rem"                            * 75BFA
        UDIMS   m^2 s^-2                         * 75C00
        UFACT   1E-2                             * 75C05
        CON(2)  U.mol-(*)                        * 75C09  next name of this length
U.Fdy:
        NIBASC  "Fdy"                            * 75C0B
        UDIMS   A s                              * 75C11
        UFACT   9.6487E4                         * 75C16
        CON(2)  U.gal-(*)                        * 75C1E  next name of this length
U.mol:
        NIBASC  "mol"                            * 75C20
        UDIMS   mol                              * 75C26
        CON(1)  0                                * 75C2E  pointer follows
        CON(5)  %%1                              * 75C2F  factor
        CON(2)  U.tsp-(*)                        * 75C34  next name of this length
U.gal:
        NIBASC  "gal"                            * 75C36
        UDIMS   m^3                              * 75C3C
        UFACT   3.785411784E-3                   * 75C3F
        CON(2)  U.lbt-(*)                        * 75C4C  next name of this length
U.tsp:
        NIBASC  "tsp"                            * 75C4E
        UDIMS   m^3                              * 75C54
        UFACT   4.92892159375E-6                 * 75C57
        CON(2)  U.ozt-(*)                        * 75C66  next name of this length
U.lbt:
        NIBASC  "lbt"                            * 75C68
        UDIMS   kg                               * 75C6E
        UFACT   3.732417216E-1                   * 75C70
        CON(2)  U.min-(*)                        * 75C7D  next name of this length
U.ozt:
        NIBASC  "ozt"                            * 75C7F
        UDIMS   kg                               * 75C85
        UFACT   3.11034768E-2                    * 75C87
        CON(2)  U.mph-(*)                        * 75C93  next name of this length
U.min:
        NIBASC  "min"                            * 75C95
        UDIMS   s                                * 75C9B
        UFACT   6E1                              * 75CA0
        CON(2)  U.kph-(*)                        * 75CA4  next name of this length
U.mph:
        NIBASC  "mph"                            * 75CA6
        UDIMS   m s^-1                           * 75CAC
        UFACT   4.4704E-1                        * 75CB1
        CON(2)  U.atm-(*)                        * 75CB9  next name of this length
U.kph:
        NIBASC  "kph"                            * 75CBB
        UDIMS   m s^-1                           * 75CC1
        UFACT   2.77777777777778E-1              * 75CC6
        CON(2)  U.mil-(*)                        * 75CD8  next name of this length
U.atm:
        NIBASC  "atm"                            * 75CDA
        UDIMS   kg m^-1 s^-2                     * 75CE0
        UFACT   1.01325E5                        * 75CE5
        CON(2)  U.lyr-(*)                        * 75CEE  next name of this length
U.mil:
        NIBASC  "mil"                            * 75CF0
        UDIMS   m                                * 75CF6
        UFACT   2.54E-5                          * 75CF9
        CON(2)  U.nmi-(*)                        * 75CFF  next name of this length
U.lyr:
        NIBASC  "lyr"                            * 75D01
        UDIMS   m                                * 75D07
        UFACT   9.46052840487936E15              * 75D0A
        CON(2)  U.Btu-(*)                        * 75D1C  next name of this length
U.nmi:
        NIBASC  "nmi"                            * 75D1E
        UDIMS   m                                * 75D24
        UFACT   1.852E3                          * 75D27
        CON(2)  U.bbl-(*)                        * 75D2E  next name of this length
U.Btu:
        NIBASC  "Btu"                            * 75D30
        UDIMS   kg m^2 s^-2                      * 75D36
        UFACT   1.05505585262E3                  * 75D3B
        CON(2)  U.ton-(*)                        * 75D4A  next name of this length
U.bbl:
        NIBASC  "bbl"                            * 75D4C
        UDIMS   m^3                              * 75D52
        UFACT   1.58987294928E-1                 * 75D55
        CON(2)  U.lbf-(*)                        * 75D64  next name of this length
U.ton:
        NIBASC  "ton"                            * 75D66
        UDIMS   kg                               * 75D6C
        UFACT   9.0718474E2                      * 75D6E
        CON(2)  U.kip-(*)                        * 75D79  next name of this length
U.lbf:
        NIBASC  "lbf"                            * 75D7B
        UDIMS   kg m s^-2                        * 75D81
        UFACT   4.4482216152605E0                * 75D86
        CON(2)  U.pdl-(*)                        * 75D97  next name of this length
U.kip:
        NIBASC  "kip"                            * 75D99
        UDIMS   kg m s^-2                        * 75D9F
        UFACT   4.4482216152605E3                * 75DA4
        CON(2)  U.psi-(*)                        * 75DB5  next name of this length
U.pdl:
        NIBASC  "pdl"                            * 75DB7
        UDIMS   kg m s^-2                        * 75DBD
        UFACT   1.38254954376E-1                 * 75DC2
        CON(2)  U.lam-(*)                        * 75DD1  next name of this length
U.psi:
        NIBASC  "psi"                            * 75DD3
        UDIMS   kg m^-1 s^-2                     * 75DD9
        UFACT   6.89475729316836E3               * 75DDE
        CON(2)  0                                * 75DF0  last of this length
U.lam:
        NIBASC  "lam"                            * 75DF2
        UDIMS   m^-2 cd                          * 75DF8
        UFACT   3.18309886183791E3               * 75DFF
        CON(2)  U.ozfl-(*)                       * 75E11  next name of this length
U.acre:
        NIBASC  "acre"                           * 75E13
        UDIMS   m^2                              * 75E1B
        UFACT   4.04687260987425E3               * 75E1E
        CON(2)  U.tbsp-(*)                       * 75E30  next name of this length
U.ozfl:
        NIBASC  "ozfl"                           * 75E32
        UDIMS   m^3                              * 75E3A
        UFACT   2.95735295625E-5                 * 75E3D
        CON(2)  U.inHg-(*)                       * 75E4C  next name of this length
U.tbsp:
        NIBASC  "tbsp"                           * 75E4E
        UDIMS   m^3                              * 75E56
        UFACT   1.478676478125E-5                * 75E59
        CON(2)  U.mmHg-(*)                       * 75E69  next name of this length
U.inHg:
        NIBASC  "inHg"                           * 75E6B
        UDIMS   kg m^-1 s^-2                     * 75E73
        UFACT   3.38638815789474E3               * 75E78
        CON(2)  U.torr-(*)                       * 75E8A  next name of this length
U.mmHg:
        NIBASC  "mmHg"                           * 75E8C
        UDIMS   kg m^-1 s^-2                     * 75E94
        UFACT   1.33322368421053E2               * 75E99
        CON(2)  U.grad-(*)                       * 75EAB  next name of this length
U.torr:
        NIBASC  "torr"                           * 75EAD
        UDIMS   kg m^-1 s^-2                     * 75EB5
        UFACT   1.33322368421053E2               * 75EBA
        CON(2)  U.ftUS-(*)                       * 75ECC  next name of this length
U.grad:
        NIBASC  "grad"                           * 75ECE
        CON(1)  0                                * 75ED6  pointer follows
        CON(5)  UMSIN~3                          * 75ED7  dimensions
        UFACT   9E-1                             * 75EDC
        CON(2)  U.miUS-(*)                       * 75EE0  next name of this length
U.ftUS:
        NIBASC  "ftUS"                           * 75EE2
        UDIMS   m                                * 75EEA
        UFACT   3.04800609601219E-1              * 75EED
        CON(2)  U.fath-(*)                       * 75EFF  next name of this length
U.miUS:
        NIBASC  "miUS"                           * 75F01
        UDIMS   m                                * 75F09
        UFACT   1.60934721869444E3               * 75F0C
        CON(2)  U.ozUK-(*)                       * 75F1E  next name of this length
U.fath:
        NIBASC  "fath"                           * 75F20
        UDIMS   m                                * 75F28
        UFACT   1.82880365760731E0               * 75F2B
        CON(2)  U.knot-(*)                       * 75F3D  next name of this length
U.ozUK:
        NIBASC  "ozUK"                           * 75F3F
        UDIMS   m^3                              * 75F47
        UFACT   2.8413075E-5                     * 75F4A
        CON(2)  U.flam-(*)                       * 75F55  next name of this length
U.knot:
        NIBASC  "knot"                           * 75F57
        UDIMS   m s^-1                           * 75F5F
        UFACT   5.14444444444444E-1              * 75F64
        CON(2)  U.slug-(*)                       * 75F76  next name of this length
U.flam:
        NIBASC  "flam"                           * 75F78
        UDIMS   m^-2 cd                          * 75F80
        UFACT   3.42625909963539E0               * 75F87
        CON(2)  U.arcs-(*)                       * 75F99  next name of this length
U.slug:
        NIBASC  "slug"                           * 75F9B
        UDIMS   kg                               * 75FA3
        UFACT   1.45939029372064E1               * 75FA5
        CON(2)  U.galC-(*)                       * 75FB7  next name of this length
U.arcs:
        NIBASC  "arcs"                           * 75FB9
        CON(1)  0                                * 75FC1  pointer follows
        CON(5)  UMSIN~3                          * 75FC2  dimensions
        UFACT   2.77777777777778E-4              * 75FC7
        CON(2)  0                                * 75FD9  last of this length
U.galC:
        NIBASC  "galC"                           * 75FDB
        UDIMS   m^3                              * 75FE3
        UFACT   4.54609E-3                       * 75FE6
        CON(2)  U.tonUK-(*)                      * 75FEF  next name of this length
U.galUK:
        NIBASC  "galUK"                          * 75FF1
        UDIMS   m^3                              * 75FFB
        UFACT   4.546092E-3                      * 75FFE
        CON(2)  U.chain-(*)                      * 76008  next name of this length
U.tonUK:
        NIBASC  "tonUK"                          * 7600A
        UDIMS   kg                               * 76014
        UFACT   1.0160469088E3                   * 76016
        CON(2)  U.therm-(*)                      * 76024  next name of this length
U.chain:
        NIBASC  "chain"                          * 76026
        UDIMS   m                                * 76030
        UFACT   2.01168402336805E1               * 76033
        CON(2)  U.inH2O-(*)                      * 76045  next name of this length
U.therm:
        NIBASC  "therm"                          * 76047
        UDIMS   kg m^2 s^-2                      * 76051
        UFACT   1.05506E8                        * 76056
        CON(2)  U.fermi-(*)                      * 7605F  next name of this length
U.inH2O:
        NIBASC  "inH2O"                          * 76061
        UDIMS   kg m^-1 s^-2                     * 7606B
        UFACT   2.4884E2                         * 76070
        CON(2)  U.grain-(*)                      * 76078  next name of this length
U.fermi:
        NIBASC  "fermi"                          * 7607A
        UDIMS   m                                * 76084
        UFACT   1E-15                            * 76087
        CON(2)  0                                * 7608B  last of this length
U.grain:
        NIBASC  "grain"                          * 7608D
        UDIMS   kg                               * 76097
        UFACT   6.479891E-5                      * 76099
        CON(2)  0                                * 760A3  last of this length
U.arcmin:
        NIBASC  "arcmin"                         * 760A5
        CON(1)  0                                * 760B1  pointer follows
        CON(5)  UMSIN~3                          * 760B2  dimensions
        UFACT   1.66666666666667E-2              * 760B7
