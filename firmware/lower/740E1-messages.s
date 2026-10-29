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
        CON(1)  2                                * 756A3  2 digits
        NIBHEX  01                               * 756A4
        CON(1)  0                                * 756A6  pointer follows
        CON(5)  %%1                              * 756A7
        CON(2)  U.g-(*)                          * 756AC  next name of this length
U.l:
        NIBASC  "l"                              * 756AE
        CON(1)  2                                * 756B0  2 digits
        NIBHEX  03                               * 756B1
        CON(1)  1                                * 756B3  1 digits
        CON(2)  #97                              * 756B4  exponent -3
        NIBHEX  1                                * 756B6
        CON(2)  U.s-(*)                          * 756B7  next name of this length
U.g:
        NIBASC  "g"                              * 756B9
        CON(1)  1                                * 756BB  1 digits
        NIBHEX  1                                * 756BC
        CON(1)  1                                * 756BD  1 digits
        CON(2)  #97                              * 756BE  exponent -3
        NIBHEX  1                                * 756C0
        CON(2)  U.N-(*)                          * 756C1  next name of this length
U.s:
        NIBASC  "s"                              * 756C3
        CON(1)  4                                * 756C5  4 digits
        NIBHEX  0001                             * 756C6
        CON(1)  0                                * 756CA  pointer follows
        CON(5)  %%1                              * 756CB
        CON(2)  U.J-(*)                          * 756D0  next name of this length
U.N:
        NIBASC  "N"                              * 756D2
        CON(1)  4                                * 756D4  4 digits
        NIBHEX  110E                             * 756D5
        CON(1)  0                                * 756D9  pointer follows
        CON(5)  %%1                              * 756DA
        CON(2)  U.W-(*)                          * 756DF  next name of this length
U.J:
        NIBASC  "J"                              * 756E1
        CON(1)  4                                * 756E3  4 digits
        NIBHEX  120E                             * 756E4
        CON(1)  0                                * 756E8  pointer follows
        CON(5)  %%1                              * 756E9
        CON(2)  U.A-(*)                          * 756EE  next name of this length
U.W:
        NIBASC  "W"                              * 756F0
        CON(1)  4                                * 756F2  4 digits
        NIBHEX  120D                             * 756F3
        CON(1)  0                                * 756F7  pointer follows
        CON(5)  %%1                              * 756F8
        CON(2)  U.C-(*)                          * 756FD  next name of this length
U.A:
        NIBASC  "A"                              * 756FF
        CON(1)  3                                * 75701  3 digits
        NIBHEX  001                              * 75702
        CON(1)  0                                * 75705  pointer follows
        CON(5)  %%1                              * 75706
        CON(2)  U.T-(*)                          * 7570B  next name of this length
U.C:
        NIBASC  "C"                              * 7570D
        CON(1)  4                                * 7570F  4 digits
        NIBHEX  0011                             * 75710
        CON(1)  0                                * 75714  pointer follows
        CON(5)  %%1                              * 75715
        CON(2)  U.H-(*)                          * 7571A  next name of this length
U.T:
        NIBASC  "T"                              * 7571C
        CON(1)  4                                * 7571E  4 digits
        NIBHEX  10FE                             * 7571F
        CON(1)  0                                * 75723  pointer follows
        CON(5)  %%1                              * 75724
        CON(2)  U.V-(*)                          * 75729  next name of this length
U.H:
        NIBASC  "H"                              * 7572B
        CON(1)  4                                * 7572D  4 digits
        NIBHEX  12EE                             * 7572E
        CON(1)  0                                * 75732  pointer follows
        CON(5)  %%1                              * 75733
        CON(2)  U.S-(*)                          * 75738  next name of this length
U.V:
        NIBASC  "V"                              * 7573A
        CON(1)  4                                * 7573C  4 digits
        NIBHEX  12FD                             * 7573D
        CON(1)  0                                * 75741  pointer follows
        CON(5)  %%1                              * 75742
        CON(2)  U.F-(*)                          * 75747  next name of this length
U.S:
        NIBASC  "S"                              * 75749
        CON(1)  4                                * 7574B  4 digits
        NIBHEX  FE23                             * 7574C
        CON(1)  0                                * 75750  pointer follows
        CON(5)  %%1                              * 75751
        CON(2)  U.r-(*)                          * 75756  next name of this length
U.F:
        NIBASC  "F"                              * 75758
        CON(1)  4                                * 7575A  4 digits
        NIBHEX  FE24                             * 7575B
        CON(1)  0                                * 7575F  pointer follows
        CON(5)  %%1                              * 75760
        CON(2)  U.a-(*)                          * 75765  next name of this length
U.r:
        NIBASC  "r"                              * 75767
        CON(1)  0                                * 75769  pointer follows
        CON(5)  UMSIN~3                          * 7576A
        CON(1)  15                               * 7576F  15 digits
        CON(2)  #01                              * 75770  exponent 1
        NIBHEX  328031597759275                  * 75772
        CON(2)  U.°-(*)                          * 75781  next name of this length
U.a:
        NIBASC  "a"                              * 75783
        CON(1)  2                                * 75785  2 digits
        NIBHEX  02                               * 75786
        CON(1)  1                                * 75788  1 digits
        CON(2)  #02                              * 75789  exponent 2
        NIBHEX  1                                * 7578B
        CON(2)  U.P-(*)                          * 7578C  next name of this length
U.°:
        NIBASC  "°"                              * 7578E
        CON(1)  0                                * 75790  pointer follows
        CON(5)  UMSIN~3                          * 75791
        CON(1)  0                                * 75796  pointer follows
        CON(5)  %%1                              * 75797
        CON(2)  U.R-(*)                          * 7579C  next name of this length
U.P:
        NIBASC  "P"                              * 7579E
        CON(1)  4                                * 757A0  4 digits
        NIBHEX  1F0F                             * 757A1
        CON(1)  1                                * 757A5  1 digits
        CON(2)  #99                              * 757A6  exponent -1
        NIBHEX  1                                * 757A8
        CON(2)  U.1-(*)                          * 757A9  next name of this length
U.R:
        NIBASC  "R"                              * 757AB
        CON(1)  4                                * 757AD  4 digits
        NIBHEX  F011                             * 757AE
        CON(1)  3                                * 757B2  3 digits
        CON(2)  #96                              * 757B3  exponent -4
        NIBHEX  852                              * 757B5
        CON(2)  U.?-(*)                          * 757B8  next name of this length
U.1:
        NIBASC  "1"                              * 757BA
        CON(1)  1                                * 757BC  1 digits
        NIBHEX  0                                * 757BD
        CON(1)  0                                * 757BE  pointer follows
        CON(5)  %%1                              * 757BF
        CON(2)  U.h-(*)                          * 757C4  next name of this length
U.?:
        NIBASC  "?"                              * 757C6
        CON(1)  10                               * 757C8  10 digits
        NIBHEX  0000000001                       * 757C9
        CON(1)  0                                * 757D3  pointer follows
        CON(5)  %%1                              * 757D4
        CON(2)  U.d-(*)                          * 757D9  next name of this length
U.h:
        NIBASC  "h"                              * 757DB
        CON(1)  4                                * 757DD  4 digits
        NIBHEX  0001                             * 757DE
        CON(1)  2                                * 757E2  2 digits
        CON(2)  #03                              * 757E3  exponent 3
        NIBHEX  63                               * 757E5
        CON(2)  U.µ-(*)                          * 757E7  next name of this length
U.d:
        NIBASC  "d"                              * 757E9
        CON(1)  4                                * 757EB  4 digits
        NIBHEX  0001                             * 757EC
        CON(1)  3                                * 757F0  3 digits
        CON(2)  #04                              * 757F1  exponent 4
        NIBHEX  468                              * 757F3
        CON(2)  U.b-(*)                          * 757F6  next name of this length
U.µ:
        NIBASC  "µ"                              * 757F8
        CON(1)  2                                * 757FA  2 digits
        NIBHEX  01                               * 757FB
        CON(1)  1                                * 757FD  1 digits
        CON(2)  #94                              * 757FE  exponent -6
        NIBHEX  1                                * 75800
        CON(2)  U.t-(*)                          * 75801  next name of this length
U.b:
        NIBASC  "b"                              * 75803
        CON(1)  2                                * 75805  2 digits
        NIBHEX  02                               * 75806
        CON(1)  1                                * 75808  1 digits
        CON(2)  #72                              * 75809  exponent -28
        NIBHEX  1                                * 7580B
        CON(2)  U.u-(*)                          * 7580C  next name of this length
U.t:
        NIBASC  "t"                              * 7580E
        CON(1)  1                                * 75810  1 digits
        NIBHEX  1                                * 75811
        CON(1)  1                                * 75812  1 digits
        CON(2)  #03                              * 75813  exponent 3
        NIBHEX  1                                * 75815
        CON(2)  U.c-(*)                          * 75816  next name of this length
U.u:
        NIBASC  "u"                              * 75818
        CON(1)  1                                * 7581A  1 digits
        NIBHEX  1                                * 7581B
        CON(1)  8                                * 7581C  8 digits
        CON(2)  #73                              * 7581D  exponent -27
        NIBHEX  20450661                         * 7581F
        CON(2)  U.Ω-(*)                          * 75827  next name of this length
U.c:
        NIBASC  "c"                              * 75829
        CON(1)  4                                * 7582B  4 digits
        NIBHEX  010F                             * 7582C
        CON(1)  9                                * 75830  9 digits
        CON(2)  #08                              * 75831  exponent 8
        NIBHEX  854297992                        * 75833
        CON(2)  U.K-(*)                          * 7583C  next name of this length
U.Ω:
        NIBASC  "Ω"                              * 7583E
        CON(1)  4                                * 75840  4 digits
        NIBHEX  12ED                             * 75841
        CON(1)  0                                * 75845  pointer follows
        CON(5)  %%1                              * 75846
        CON(2)  U.Å-(*)                          * 7584B  next name of this length
U.K:
        NIBASC  "K"                              * 7584D
        CON(1)  0                                * 7584F  pointer follows
        CON(5)  puretemp?~1                      * 75850
        CON(1)  0                                * 75855  pointer follows
        CON(5)  %%1                              * 75856
        CON(2)  0                                * 7585B  last of this length
U.Å:
        NIBASC  "Å"                              * 7585D
        CON(1)  2                                * 7585F  2 digits
        NIBHEX  01                               * 75860
        CON(1)  1                                * 75862  1 digits
        CON(2)  #90                              * 75863  exponent -10
        NIBHEX  1                                * 75865
        CON(2)  U.Pa-(*)                         * 75866  next name of this length
U.Hz:
        NIBASC  "Hz"                             * 75868
        CON(1)  4                                * 7586C  4 digits
        NIBHEX  000F                             * 7586D
        CON(1)  0                                * 75871  pointer follows
        CON(5)  %%1                              * 75872
        CON(2)  U.Wb-(*)                         * 75877  next name of this length
U.Pa:
        NIBASC  "Pa"                             * 75879
        CON(1)  4                                * 7587D  4 digits
        NIBHEX  1F0E                             * 7587E
        CON(1)  0                                * 75882  pointer follows
        CON(5)  %%1                              * 75883
        CON(2)  U.lb-(*)                         * 75888  next name of this length
U.Wb:
        NIBASC  "Wb"                             * 7588A
        CON(1)  4                                * 7588E  4 digits
        NIBHEX  12FE                             * 7588F
        CON(1)  0                                * 75893  pointer follows
        CON(5)  %%1                              * 75894
        CON(2)  U.in-(*)                         * 75899  next name of this length
U.lb:
        NIBASC  "lb"                             * 7589B
        CON(1)  1                                * 7589F  1 digits
        NIBHEX  1                                * 758A0
        CON(1)  8                                * 758A1  8 digits
        CON(2)  #99                              * 758A2  exponent -1
        NIBHEX  73295354                         * 758A4
        CON(2)  U.ft-(*)                         * 758AC  next name of this length
U.in:
        NIBASC  "in"                             * 758AE
        CON(1)  2                                * 758B2  2 digits
        NIBHEX  01                               * 758B3
        CON(1)  3                                * 758B5  3 digits
        CON(2)  #98                              * 758B6  exponent -2
        NIBHEX  452                              * 758B8
        CON(2)  U.st-(*)                         * 758BB  next name of this length
U.ft:
        NIBASC  "ft"                             * 758BD
        CON(1)  2                                * 758C1  2 digits
        NIBHEX  01                               * 758C2
        CON(1)  4                                * 758C4  4 digits
        CON(2)  #99                              * 758C5  exponent -1
        NIBHEX  8403                             * 758C7
        CON(2)  U.Bq-(*)                         * 758CB  next name of this length
U.st:
        NIBASC  "st"                             * 758CD
        CON(1)  2                                * 758D1  2 digits
        NIBHEX  03                               * 758D2
        CON(1)  0                                * 758D4  pointer follows
        CON(5)  %%1                              * 758D5
        CON(2)  U.Ci-(*)                         * 758DA  next name of this length
U.Bq:
        NIBASC  "Bq"                             * 758DC
        CON(1)  4                                * 758E0  4 digits
        NIBHEX  000F                             * 758E1
        CON(1)  0                                * 758E5  pointer follows
        CON(5)  %%1                              * 758E6
        CON(2)  U.ga-(*)                         * 758EB  next name of this length
U.Ci:
        NIBASC  "Ci"                             * 758ED
        CON(1)  4                                * 758F1  4 digits
        NIBHEX  000F                             * 758F2
        CON(1)  2                                * 758F6  2 digits
        CON(2)  #10                              * 758F7  exponent 10
        NIBHEX  73                               * 758F9
        CON(2)  U.gf-(*)                         * 758FB  next name of this length
U.ga:
        NIBASC  "ga"                             * 758FD
        CON(1)  4                                * 75901  4 digits
        NIBHEX  010E                             * 75902
        CON(1)  6                                * 75906  6 digits
        CON(2)  #00                              * 75907  exponent 0
        NIBHEX  566089                           * 75909
        CON(2)  U.St-(*)                         * 7590F  next name of this length
U.gf:
        NIBASC  "gf"                             * 75911
        CON(1)  4                                * 75915  4 digits
        NIBHEX  110E                             * 75916
        CON(1)  6                                * 7591A  6 digits
        CON(2)  #97                              * 7591B  exponent -3
        NIBHEX  566089                           * 7591D
        CON(2)  U.Gy-(*)                         * 75923  next name of this length
U.St:
        NIBASC  "St"                             * 75925
        CON(1)  4                                * 75929  4 digits
        NIBHEX  020F                             * 7592A
        CON(1)  1                                * 7592E  1 digits
        CON(2)  #96                              * 7592F  exponent -4
        NIBHEX  1                                * 75931
        CON(2)  U.Sv-(*)                         * 75932  next name of this length
U.Gy:
        NIBASC  "Gy"                             * 75934
        CON(1)  4                                * 75938  4 digits
        NIBHEX  020E                             * 75939
        CON(1)  0                                * 7593D  pointer follows
        CON(5)  %%1                              * 7593E
        CON(2)  U.eV-(*)                         * 75943  next name of this length
U.Sv:
        NIBASC  "Sv"                             * 75945
        CON(1)  4                                * 75949  4 digits
        NIBHEX  020E                             * 7594A
        CON(1)  0                                * 7594E  pointer follows
        CON(5)  %%1                              * 7594F
        CON(2)  U.cd-(*)                         * 75954  next name of this length
U.eV:
        NIBASC  "eV"                             * 75956
        CON(1)  4                                * 7595A  4 digits
        NIBHEX  120E                             * 7595B
        CON(1)  9                                * 7595F  9 digits
        CON(2)  #81                              * 75960  exponent -19
        NIBHEX  337712061                        * 75962
        CON(2)  U.sr-(*)                         * 7596B  next name of this length
U.cd:
        NIBASC  "cd"                             * 7596D
        CON(1)  6                                * 75971  6 digits
        NIBHEX  000001                           * 75972
        CON(1)  0                                * 75978  pointer follows
        CON(5)  %%1                              * 75979
        CON(2)  U.mi-(*)                         * 7597E  next name of this length
U.sr:
        NIBASC  "sr"                             * 75980
        CON(1)  9                                * 75984  9 digits
        NIBHEX  000000001                        * 75985
        CON(1)  0                                * 7598E  pointer follows
        CON(5)  %%1                              * 7598F
        CON(2)  U.yr-(*)                         * 75994  next name of this length
U.mi:
        NIBASC  "mi"                             * 75996
        CON(1)  2                                * 7599A  2 digits
        NIBHEX  01                               * 7599B
        CON(1)  7                                * 7599D  7 digits
        CON(2)  #03                              * 7599E  exponent 3
        NIBHEX  4439061                          * 759A0
        CON(2)  U.pc-(*)                         * 759A7  next name of this length
U.yr:
        NIBASC  "yr"                             * 759A9
        CON(1)  4                                * 759AD  4 digits
        NIBHEX  0001                             * 759AE
        CON(1)  12                               * 759B2  12 digits
        CON(2)  #07                              * 759B3  exponent 7
        NIBHEX  747952965513                     * 759B5
        CON(2)  U.qt-(*)                         * 759C1  next name of this length
U.pc:
        NIBASC  "pc"                             * 759C3
        CON(1)  2                                * 759C7  2 digits
        NIBHEX  01                               * 759C8
        CON(1)  15                               * 759CA  15 digits
        CON(2)  #16                              * 759CB  exponent 16
        NIBHEX  527485818765803                  * 759CD
        CON(2)  U.oz-(*)                         * 759DC  next name of this length
U.qt:
        NIBASC  "qt"                             * 759DE
        CON(1)  2                                * 759E2  2 digits
        NIBHEX  03                               * 759E3
        CON(1)  9                                * 759E5  9 digits
        CON(2)  #96                              * 759E6  exponent -4
        NIBHEX  649253649                        * 759E8
        CON(2)  U.yd-(*)                         * 759F1  next name of this length
U.oz:
        NIBASC  "oz"                             * 759F3
        CON(1)  1                                * 759F7  1 digits
        NIBHEX  1                                * 759F8
        CON(1)  11                               * 759F9  11 digits
        CON(2)  #98                              * 759FA  exponent -2
        NIBHEX  52132594382                      * 759FC
        CON(2)  U.pt-(*)                         * 75A07  next name of this length
U.yd:
        NIBASC  "yd"                             * 75A09
        CON(1)  2                                * 75A0D  2 digits
        NIBHEX  01                               * 75A0E
        CON(1)  4                                * 75A10  4 digits
        CON(2)  #99                              * 75A11  exponent -1
        NIBHEX  4419                             * 75A13
        CON(2)  U.°C-(*)                         * 75A17  next name of this length
U.pt:
        NIBASC  "pt"                             * 75A19
        CON(1)  2                                * 75A1D  2 digits
        NIBHEX  03                               * 75A1E
        CON(1)  9                                * 75A20  9 digits
        CON(2)  #96                              * 75A21  exponent -4
        NIBHEX  374671374                        * 75A23
        CON(2)  U.°F-(*)                         * 75A2C  next name of this length
U.°C:
        NIBASC  "°C"                             * 75A2E
        CON(1)  0                                * 75A32  pointer follows
        CON(5)  puretemp?~1                      * 75A33
        CON(1)  0                                * 75A38  pointer follows
        CON(5)  cfC                              * 75A39
        CON(2)  U.°R-(*)                         * 75A3E  next name of this length
U.°F:
        NIBASC  "°F"                             * 75A40
        CON(1)  0                                * 75A44  pointer follows
        CON(5)  puretemp?~1                      * 75A45
        CON(1)  0                                * 75A4A  pointer follows
        CON(5)  cfF                              * 75A4B
        CON(2)  U.lm-(*)                         * 75A50  next name of this length
U.°R:
        NIBASC  "°R"                             * 75A52
        CON(1)  0                                * 75A56  pointer follows
        CON(5)  puretemp?~1                      * 75A57
        CON(1)  15                               * 75A5C  15 digits
        CON(2)  #99                              * 75A5D  exponent -1
        NIBHEX  655555555555555                  * 75A5F
        CON(2)  U.sb-(*)                         * 75A6E  next name of this length
U.lm:
        NIBASC  "lm"                             * 75A70
        CON(1)  9                                * 75A74  9 digits
        NIBHEX  000001001                        * 75A75
        CON(1)  0                                * 75A7E  pointer follows
        CON(5)  %%1                              * 75A7F
        CON(2)  U.cu-(*)                         * 75A84  next name of this length
U.sb:
        NIBASC  "sb"                             * 75A86
        CON(1)  6                                * 75A8A  6 digits
        NIBHEX  0E0001                           * 75A8B
        CON(1)  1                                * 75A91  1 digits
        CON(2)  #04                              * 75A92  exponent 4
        NIBHEX  1                                * 75A94
        CON(2)  U.rd-(*)                         * 75A95  next name of this length
U.cu:
        NIBASC  "cu"                             * 75A97
        CON(1)  2                                * 75A9B  2 digits
        NIBHEX  03                               * 75A9C
        CON(1)  10                               * 75A9E  10 digits
        CON(2)  #96                              * 75A9F  exponent -4
        NIBHEX  5632885632                       * 75AA1
        CON(2)  U.lx-(*)                         * 75AAB  next name of this length
U.rd:
        NIBASC  "rd"                             * 75AAD
        CON(1)  2                                * 75AB1  2 digits
        NIBHEX  01                               * 75AB2
        CON(1)  15                               * 75AB4  15 digits
        CON(2)  #00                              * 75AB5  exponent 0
        NIBHEX  210248500129205                  * 75AB7
        CON(2)  U.ct-(*)                         * 75AC6  next name of this length
U.lx:
        NIBASC  "lx"                             * 75AC8
        CON(1)  9                                * 75ACC  9 digits
        NIBHEX  0E0001001                        * 75ACD
        CON(1)  0                                * 75AD6  pointer follows
        CON(5)  %%1                              * 75AD7
        CON(2)  U.bu-(*)                         * 75ADC  next name of this length
U.ct:
        NIBASC  "ct"                             * 75ADE
        CON(1)  1                                * 75AE2  1 digits
        NIBHEX  1                                * 75AE3
        CON(1)  1                                * 75AE4  1 digits
        CON(2)  #96                              * 75AE5  exponent -4
        NIBHEX  2                                * 75AE7
        CON(2)  U.pk-(*)                         * 75AE8  next name of this length
U.bu:
        NIBASC  "bu"                             * 75AEA
        CON(1)  2                                * 75AEE  2 digits
        NIBHEX  03                               * 75AEF
        CON(1)  7                                * 75AF1  7 digits
        CON(2)  #98                              * 75AF2  exponent -2
        NIBHEX  7093253                          * 75AF4
        CON(2)  U.hp-(*)                         * 75AFB  next name of this length
U.pk:
        NIBASC  "pk"                             * 75AFD
        CON(1)  2                                * 75B01  2 digits
        NIBHEX  03                               * 75B02
        CON(1)  8                                * 75B04  8 digits
        CON(2)  #97                              * 75B05  exponent -3
        NIBHEX  57679088                         * 75B07
        CON(2)  U.ph-(*)                         * 75B0F  next name of this length
U.hp:
        NIBASC  "hp"                             * 75B11
        CON(1)  4                                * 75B15  4 digits
        NIBHEX  120D                             * 75B16
        CON(1)  14                               * 75B1A  14 digits
        CON(2)  #02                              * 75B1B  exponent 2
        NIBHEX  72285178996547                   * 75B1D
        CON(2)  U.au-(*)                         * 75B2B  next name of this length
U.ph:
        NIBASC  "ph"                             * 75B2D
        CON(1)  9                                * 75B31  9 digits
        NIBHEX  0E0001001                        * 75B32
        CON(1)  1                                * 75B3B  1 digits
        CON(2)  #04                              * 75B3C  exponent 4
        NIBHEX  1                                * 75B3E
        CON(2)  U.fc-(*)                         * 75B3F  next name of this length
U.au:
        NIBASC  "au"                             * 75B41
        CON(1)  2                                * 75B45  2 digits
        NIBHEX  01                               * 75B46
        CON(1)  7                                * 75B48  7 digits
        CON(2)  #11                              * 75B49  exponent 11
        NIBHEX  9795941                          * 75B4B
        CON(2)  0                                * 75B52  last of this length
U.fc:
        NIBASC  "fc"                             * 75B54
        CON(1)  9                                * 75B58  9 digits
        NIBHEX  0E0001001                        * 75B59
        CON(1)  15                               * 75B62  15 digits
        CON(2)  #01                              * 75B63  exponent 1
        NIBHEX  790761401936701                  * 75B65
        CON(2)  U.erg-(*)                        * 75B74  next name of this length
U.dyn:
        NIBASC  "dyn"                            * 75B76
        CON(1)  4                                * 75B7C  4 digits
        NIBHEX  110E                             * 75B7D
        CON(1)  1                                * 75B81  1 digits
        CON(2)  #95                              * 75B82  exponent -5
        NIBHEX  1                                * 75B84
        CON(2)  U.bar-(*)                        * 75B85  next name of this length
U.erg:
        NIBASC  "erg"                            * 75B87
        CON(1)  4                                * 75B8D  4 digits
        NIBHEX  120E                             * 75B8E
        CON(1)  1                                * 75B92  1 digits
        CON(2)  #93                              * 75B93  exponent -7
        NIBHEX  1                                * 75B95
        CON(2)  U.mho-(*)                        * 75B96  next name of this length
U.bar:
        NIBASC  "bar"                            * 75B98
        CON(1)  4                                * 75B9E  4 digits
        NIBHEX  1F0E                             * 75B9F
        CON(1)  1                                * 75BA3  1 digits
        CON(2)  #05                              * 75BA4  exponent 5
        NIBHEX  1                                * 75BA6
        CON(2)  U.cal-(*)                        * 75BA7  next name of this length
U.mho:
        NIBASC  "mho"                            * 75BA9
        CON(1)  4                                * 75BAF  4 digits
        NIBHEX  FE23                             * 75BB0
        CON(1)  0                                * 75BB4  pointer follows
        CON(5)  %%1                              * 75BB5
        CON(2)  U.fbm-(*)                        * 75BBA  next name of this length
U.cal:
        NIBASC  "cal"                            * 75BBC
        CON(1)  4                                * 75BC2  4 digits
        NIBHEX  120E                             * 75BC3
        CON(1)  5                                * 75BC7  5 digits
        CON(2)  #00                              * 75BC8  exponent 0
        NIBHEX  86814                            * 75BCA
        CON(2)  U.rad-(*)                        * 75BCF  next name of this length
U.fbm:
        NIBASC  "fbm"                            * 75BD1
        CON(1)  2                                * 75BD7  2 digits
        NIBHEX  03                               * 75BD8
        CON(1)  10                               * 75BDA  10 digits
        CON(2)  #97                              * 75BDB  exponent -3
        NIBHEX  6127379532                       * 75BDD
        CON(2)  U.rem-(*)                        * 75BE7  next name of this length
U.rad:
        NIBASC  "rad"                            * 75BE9
        CON(1)  4                                * 75BEF  4 digits
        NIBHEX  020E                             * 75BF0
        CON(1)  1                                * 75BF4  1 digits
        CON(2)  #98                              * 75BF5  exponent -2
        NIBHEX  1                                * 75BF7
        CON(2)  U.Fdy-(*)                        * 75BF8  next name of this length
U.rem:
        NIBASC  "rem"                            * 75BFA
        CON(1)  4                                * 75C00  4 digits
        NIBHEX  020E                             * 75C01
        CON(1)  1                                * 75C05  1 digits
        CON(2)  #98                              * 75C06  exponent -2
        NIBHEX  1                                * 75C08
        CON(2)  U.mol-(*)                        * 75C09  next name of this length
U.Fdy:
        NIBASC  "Fdy"                            * 75C0B
        CON(1)  4                                * 75C11  4 digits
        NIBHEX  0011                             * 75C12
        CON(1)  5                                * 75C16  5 digits
        CON(2)  #04                              * 75C17  exponent 4
        NIBHEX  78469                            * 75C19
        CON(2)  U.gal-(*)                        * 75C1E  next name of this length
U.mol:
        NIBASC  "mol"                            * 75C20
        CON(1)  7                                * 75C26  7 digits
        NIBHEX  0000001                          * 75C27
        CON(1)  0                                * 75C2E  pointer follows
        CON(5)  %%1                              * 75C2F
        CON(2)  U.tsp-(*)                        * 75C34  next name of this length
U.gal:
        NIBASC  "gal"                            * 75C36
        CON(1)  2                                * 75C3C  2 digits
        NIBHEX  03                               * 75C3D
        CON(1)  10                               * 75C3F  10 digits
        CON(2)  #97                              * 75C40  exponent -3
        NIBHEX  4871145873                       * 75C42
        CON(2)  U.lbt-(*)                        * 75C4C  next name of this length
U.tsp:
        NIBASC  "tsp"                            * 75C4E
        CON(1)  2                                * 75C54  2 digits
        NIBHEX  03                               * 75C55
        CON(1)  12                               * 75C57  12 digits
        CON(2)  #94                              * 75C58  exponent -6
        NIBHEX  573951298294                     * 75C5A
        CON(2)  U.ozt-(*)                        * 75C66  next name of this length
U.lbt:
        NIBASC  "lbt"                            * 75C68
        CON(1)  1                                * 75C6E  1 digits
        NIBHEX  1                                * 75C6F
        CON(1)  10                               * 75C70  10 digits
        CON(2)  #99                              * 75C71  exponent -1
        NIBHEX  6127142373                       * 75C73
        CON(2)  U.min-(*)                        * 75C7D  next name of this length
U.ozt:
        NIBASC  "ozt"                            * 75C7F
        CON(1)  1                                * 75C85  1 digits
        NIBHEX  1                                * 75C86
        CON(1)  9                                * 75C87  9 digits
        CON(2)  #98                              * 75C88  exponent -2
        NIBHEX  867430113                        * 75C8A
        CON(2)  U.mph-(*)                        * 75C93  next name of this length
U.min:
        NIBASC  "min"                            * 75C95
        CON(1)  4                                * 75C9B  4 digits
        NIBHEX  0001                             * 75C9C
        CON(1)  1                                * 75CA0  1 digits
        CON(2)  #01                              * 75CA1  exponent 1
        NIBHEX  6                                * 75CA3
        CON(2)  U.kph-(*)                        * 75CA4  next name of this length
U.mph:
        NIBASC  "mph"                            * 75CA6
        CON(1)  4                                * 75CAC  4 digits
        NIBHEX  010F                             * 75CAD
        CON(1)  5                                * 75CB1  5 digits
        CON(2)  #99                              * 75CB2  exponent -1
        NIBHEX  40744                            * 75CB4
        CON(2)  U.atm-(*)                        * 75CB9  next name of this length
U.kph:
        NIBASC  "kph"                            * 75CBB
        CON(1)  4                                * 75CC1  4 digits
        NIBHEX  010F                             * 75CC2
        CON(1)  15                               * 75CC6  15 digits
        CON(2)  #99                              * 75CC7  exponent -1
        NIBHEX  877777777777772                  * 75CC9
        CON(2)  U.mil-(*)                        * 75CD8  next name of this length
U.atm:
        NIBASC  "atm"                            * 75CDA
        CON(1)  4                                * 75CE0  4 digits
        NIBHEX  1F0E                             * 75CE1
        CON(1)  6                                * 75CE5  6 digits
        CON(2)  #05                              * 75CE6  exponent 5
        NIBHEX  523101                           * 75CE8
        CON(2)  U.lyr-(*)                        * 75CEE  next name of this length
U.mil:
        NIBASC  "mil"                            * 75CF0
        CON(1)  2                                * 75CF6  2 digits
        NIBHEX  01                               * 75CF7
        CON(1)  3                                * 75CF9  3 digits
        CON(2)  #95                              * 75CFA  exponent -5
        NIBHEX  452                              * 75CFC
        CON(2)  U.nmi-(*)                        * 75CFF  next name of this length
U.lyr:
        NIBASC  "lyr"                            * 75D01
        CON(1)  2                                * 75D07  2 digits
        NIBHEX  01                               * 75D08
        CON(1)  15                               * 75D0A  15 digits
        CON(2)  #15                              * 75D0B  exponent 15
        NIBHEX  639784048250649                  * 75D0D
        CON(2)  U.Btu-(*)                        * 75D1C  next name of this length
U.nmi:
        NIBASC  "nmi"                            * 75D1E
        CON(1)  2                                * 75D24  2 digits
        NIBHEX  01                               * 75D25
        CON(1)  4                                * 75D27  4 digits
        CON(2)  #03                              * 75D28  exponent 3
        NIBHEX  2581                             * 75D2A
        CON(2)  U.bbl-(*)                        * 75D2E  next name of this length
U.Btu:
        NIBASC  "Btu"                            * 75D30
        CON(1)  4                                * 75D36  4 digits
        NIBHEX  120E                             * 75D37
        CON(1)  12                               * 75D3B  12 digits
        CON(2)  #03                              * 75D3C  exponent 3
        NIBHEX  262585505501                     * 75D3E
        CON(2)  U.ton-(*)                        * 75D4A  next name of this length
U.bbl:
        NIBASC  "bbl"                            * 75D4C
        CON(1)  2                                * 75D52  2 digits
        NIBHEX  03                               * 75D53
        CON(1)  12                               * 75D55  12 digits
        CON(2)  #99                              * 75D56  exponent -1
        NIBHEX  829492789851                     * 75D58
        CON(2)  U.lbf-(*)                        * 75D64  next name of this length
U.ton:
        NIBASC  "ton"                            * 75D66
        CON(1)  1                                * 75D6C  1 digits
        NIBHEX  1                                * 75D6D
        CON(1)  8                                * 75D6E  8 digits
        CON(2)  #02                              * 75D6F  exponent 2
        NIBHEX  47481709                         * 75D71
        CON(2)  U.kip-(*)                        * 75D79  next name of this length
U.lbf:
        NIBASC  "lbf"                            * 75D7B
        CON(1)  4                                * 75D81  4 digits
        NIBHEX  110E                             * 75D82
        CON(1)  14                               * 75D86  14 digits
        CON(2)  #00                              * 75D87  exponent 0
        NIBHEX  50625161228444                   * 75D89
        CON(2)  U.pdl-(*)                        * 75D97  next name of this length
U.kip:
        NIBASC  "kip"                            * 75D99
        CON(1)  4                                * 75D9F  4 digits
        NIBHEX  110E                             * 75DA0
        CON(1)  14                               * 75DA4  14 digits
        CON(2)  #03                              * 75DA5  exponent 3
        NIBHEX  50625161228444                   * 75DA7
        CON(2)  U.psi-(*)                        * 75DB5  next name of this length
U.pdl:
        NIBASC  "pdl"                            * 75DB7
        CON(1)  4                                * 75DBD  4 digits
        NIBHEX  110E                             * 75DBE
        CON(1)  12                               * 75DC2  12 digits
        CON(2)  #99                              * 75DC3  exponent -1
        NIBHEX  673459452831                     * 75DC5
        CON(2)  U.lam-(*)                        * 75DD1  next name of this length
U.psi:
        NIBASC  "psi"                            * 75DD3
        CON(1)  4                                * 75DD9  4 digits
        NIBHEX  1F0E                             * 75DDA
        CON(1)  15                               * 75DDE  15 digits
        CON(2)  #03                              * 75DDF  exponent 3
        NIBHEX  638613927574986                  * 75DE1
        CON(2)  0                                * 75DF0  last of this length
U.lam:
        NIBASC  "lam"                            * 75DF2
        CON(1)  6                                * 75DF8  6 digits
        NIBHEX  0E0001                           * 75DF9
        CON(1)  15                               * 75DFF  15 digits
        CON(2)  #03                              * 75E00  exponent 3
        NIBHEX  197381688903813                  * 75E02
        CON(2)  U.ozfl-(*)                       * 75E11  next name of this length
U.acre:
        NIBASC  "acre"                           * 75E13
        CON(1)  2                                * 75E1B  2 digits
        NIBHEX  02                               * 75E1C
        CON(1)  15                               * 75E1E  15 digits
        CON(2)  #03                              * 75E1F  exponent 3
        NIBHEX  524789062786404                  * 75E21
        CON(2)  U.tbsp-(*)                       * 75E30  next name of this length
U.ozfl:
        NIBASC  "ozfl"                           * 75E32
        CON(1)  2                                * 75E3A  2 digits
        NIBHEX  03                               * 75E3B
        CON(1)  12                               * 75E3D  12 digits
        CON(2)  #95                              * 75E3E  exponent -5
        NIBHEX  526592537592                     * 75E40
        CON(2)  U.inHg-(*)                       * 75E4C  next name of this length
U.tbsp:
        NIBASC  "tbsp"                           * 75E4E
        CON(1)  2                                * 75E56  2 digits
        NIBHEX  03                               * 75E57
        CON(1)  13                               * 75E59  13 digits
        CON(2)  #95                              * 75E5A  exponent -5
        NIBHEX  5218746768741                    * 75E5C
        CON(2)  U.mmHg-(*)                       * 75E69  next name of this length
U.inHg:
        NIBASC  "inHg"                           * 75E6B
        CON(1)  4                                * 75E73  4 digits
        NIBHEX  1F0E                             * 75E74
        CON(1)  15                               * 75E78  15 digits
        CON(2)  #03                              * 75E79  exponent 3
        NIBHEX  474987518836833                  * 75E7B
        CON(2)  U.torr-(*)                       * 75E8A  next name of this length
U.mmHg:
        NIBASC  "mmHg"                           * 75E8C
        CON(1)  4                                * 75E94  4 digits
        NIBHEX  1F0E                             * 75E95
        CON(1)  15                               * 75E99  15 digits
        CON(2)  #02                              * 75E9A  exponent 2
        NIBHEX  350124863223331                  * 75E9C
        CON(2)  U.grad-(*)                       * 75EAB  next name of this length
U.torr:
        NIBASC  "torr"                           * 75EAD
        CON(1)  4                                * 75EB5  4 digits
        NIBHEX  1F0E                             * 75EB6
        CON(1)  15                               * 75EBA  15 digits
        CON(2)  #02                              * 75EBB  exponent 2
        NIBHEX  350124863223331                  * 75EBD
        CON(2)  U.ftUS-(*)                       * 75ECC  next name of this length
U.grad:
        NIBASC  "grad"                           * 75ECE
        CON(1)  0                                * 75ED6  pointer follows
        CON(5)  UMSIN~3                          * 75ED7
        CON(1)  1                                * 75EDC  1 digits
        CON(2)  #99                              * 75EDD  exponent -1
        NIBHEX  9                                * 75EDF
        CON(2)  U.miUS-(*)                       * 75EE0  next name of this length
U.ftUS:
        NIBASC  "ftUS"                           * 75EE2
        CON(1)  2                                * 75EEA  2 digits
        NIBHEX  01                               * 75EEB
        CON(1)  15                               * 75EED  15 digits
        CON(2)  #99                              * 75EEE  exponent -1
        NIBHEX  912106906008403                  * 75EF0
        CON(2)  U.fath-(*)                       * 75EFF  next name of this length
U.miUS:
        NIBASC  "miUS"                           * 75F01
        CON(1)  2                                * 75F09  2 digits
        NIBHEX  01                               * 75F0A
        CON(1)  15                               * 75F0C  15 digits
        CON(2)  #03                              * 75F0D  exponent 3
        NIBHEX  444968127439061                  * 75F0F
        CON(2)  U.ozUK-(*)                       * 75F1E  next name of this length
U.fath:
        NIBASC  "fath"                           * 75F20
        CON(1)  2                                * 75F28  2 digits
        NIBHEX  01                               * 75F29
        CON(1)  15                               * 75F2B  15 digits
        CON(2)  #00                              * 75F2C  exponent 0
        NIBHEX  137067563088281                  * 75F2E
        CON(2)  U.knot-(*)                       * 75F3D  next name of this length
U.ozUK:
        NIBASC  "ozUK"                           * 75F3F
        CON(1)  2                                * 75F47  2 digits
        NIBHEX  03                               * 75F48
        CON(1)  8                                * 75F4A  8 digits
        CON(2)  #95                              * 75F4B  exponent -5
        NIBHEX  57031482                         * 75F4D
        CON(2)  U.flam-(*)                       * 75F55  next name of this length
U.knot:
        NIBASC  "knot"                           * 75F57
        CON(1)  4                                * 75F5F  4 digits
        NIBHEX  010F                             * 75F60
        CON(1)  15                               * 75F64  15 digits
        CON(2)  #99                              * 75F65  exponent -1
        NIBHEX  444444444444415                  * 75F67
        CON(2)  U.slug-(*)                       * 75F76  next name of this length
U.flam:
        NIBASC  "flam"                           * 75F78
        CON(1)  6                                * 75F80  6 digits
        NIBHEX  0E0001                           * 75F81
        CON(1)  15                               * 75F87  15 digits
        CON(2)  #00                              * 75F88  exponent 0
        NIBHEX  935369909526243                  * 75F8A
        CON(2)  U.arcs-(*)                       * 75F99  next name of this length
U.slug:
        NIBASC  "slug"                           * 75F9B
        CON(1)  1                                * 75FA3  1 digits
        NIBHEX  1                                * 75FA4
        CON(1)  15                               * 75FA5  15 digits
        CON(2)  #01                              * 75FA6  exponent 1
        NIBHEX  460273920939541                  * 75FA8
        CON(2)  U.galC-(*)                       * 75FB7  next name of this length
U.arcs:
        NIBASC  "arcs"                           * 75FB9
        CON(1)  0                                * 75FC1  pointer follows
        CON(5)  UMSIN~3                          * 75FC2
        CON(1)  15                               * 75FC7  15 digits
        CON(2)  #96                              * 75FC8  exponent -4
        NIBHEX  877777777777772                  * 75FCA
        CON(2)  0                                * 75FD9  last of this length
U.galC:
        NIBASC  "galC"                           * 75FDB
        CON(1)  2                                * 75FE3  2 digits
        NIBHEX  03                               * 75FE4
        CON(1)  6                                * 75FE6  6 digits
        CON(2)  #97                              * 75FE7  exponent -3
        NIBHEX  906454                           * 75FE9
        CON(2)  U.tonUK-(*)                      * 75FEF  next name of this length
U.galUK:
        NIBASC  "galUK"                          * 75FF1
        CON(1)  2                                * 75FFB  2 digits
        NIBHEX  03                               * 75FFC
        CON(1)  7                                * 75FFE  7 digits
        CON(2)  #97                              * 75FFF  exponent -3
        NIBHEX  2906454                          * 76001
        CON(2)  U.chain-(*)                      * 76008  next name of this length
U.tonUK:
        NIBASC  "tonUK"                          * 7600A
        CON(1)  1                                * 76014  1 digits
        NIBHEX  1                                * 76015
        CON(1)  11                               * 76016  11 digits
        CON(2)  #03                              * 76017  exponent 3
        NIBHEX  88096406101                      * 76019
        CON(2)  U.therm-(*)                      * 76024  next name of this length
U.chain:
        NIBASC  "chain"                          * 76026
        CON(1)  2                                * 76030  2 digits
        NIBHEX  01                               * 76031
        CON(1)  15                               * 76033  15 digits
        CON(2)  #01                              * 76034  exponent 1
        NIBHEX  508633204861102                  * 76036
        CON(2)  U.inH2O-(*)                      * 76045  next name of this length
U.therm:
        NIBASC  "therm"                          * 76047
        CON(1)  4                                * 76051  4 digits
        NIBHEX  120E                             * 76052
        CON(1)  6                                * 76056  6 digits
        CON(2)  #08                              * 76057  exponent 8
        NIBHEX  605501                           * 76059
        CON(2)  U.fermi-(*)                      * 7605F  next name of this length
U.inH2O:
        NIBASC  "inH2O"                          * 76061
        CON(1)  4                                * 7606B  4 digits
        NIBHEX  1F0E                             * 7606C
        CON(1)  5                                * 76070  5 digits
        CON(2)  #02                              * 76071  exponent 2
        NIBHEX  48842                            * 76073
        CON(2)  U.grain-(*)                      * 76078  next name of this length
U.fermi:
        NIBASC  "fermi"                          * 7607A
        CON(1)  2                                * 76084  2 digits
        NIBHEX  01                               * 76085
        CON(1)  1                                * 76087  1 digits
        CON(2)  #85                              * 76088  exponent -15
        NIBHEX  1                                * 7608A
        CON(2)  0                                * 7608B  last of this length
U.grain:
        NIBASC  "grain"                          * 7608D
        CON(1)  1                                * 76097  1 digits
        NIBHEX  1                                * 76098
        CON(1)  7                                * 76099  7 digits
        CON(2)  #95                              * 7609A  exponent -5
        NIBHEX  1989746                          * 7609C
        CON(2)  0                                * 760A3  last of this length
U.arcmin:
        NIBASC  "arcmin"                         * 760A5
        CON(1)  0                                * 760B1  pointer follows
        CON(5)  UMSIN~3                          * 760B2
        CON(1)  15                               * 760B7  15 digits
        CON(2)  #98                              * 760B8  exponent -2
        NIBHEX  766666666666661                  * 760BA
