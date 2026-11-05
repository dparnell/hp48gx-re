* HP 48GX ROM revision R, #7C855-#7E000: Array primitives in machine code and RPL (inner products in 15 digits, LU decomposition and solving, conversion between real and extended arrays, norms), the TVM variable names and the TVM solver's numeric helpers, then pointers to the symbolic rules: derivatives (D/D...), integrals, WHERE, and the rule tables' ROMPTRs
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: PTYPE>PINFO Dot%%2Arr ExtArry> PYR Dot%%1Arr LUFactor Dot+1Elem PV PMT LUSolve I%YR DotNextC
* Follows on from the previous file (at #7C855 in the original ROM).

* refs (9): 7CFF4 7D076 90697 94BD5 94F5F 9814B ...
* arry and three bints -> %% or C%%: inner product in 15 digits of a row and a column of one array
Dot%%1Arr:
        CON(5)  (*)+5                            * 7C855  primitive code object
        ST=0    0                                * 7C85A
        GOTO    Dot%%2Arr.L1                     * 7C85D

* refs (11): 7D170 7D233 907A0 924D9 9256F 926FF ...
* As Dot%%1Arr, with two arrays on the stack
Dot%%2Arr:
        CON(5)  (*)+5                            * 7C861  primitive code object
        ST=1    0                                * 7C866
Dot%%2Arr.L1:
        GOSUB   DotArgs                          * 7C869
        D1=D1+  5                                * 7C86D
        A=A-1   A                                * 7C870
        GOSUB   A*21~jump                        * 7C872
        ST=0    1                                * 7C876
        LC(5)   DOEREL                           * 7C879
        ?D=C    A                                * 7C880
        GOYES   Dot%%2Arr.L2                     * 7C883
        ST=1    1                                * 7C885
        A=A+A   A                                * 7C888
Dot%%2Arr.L2:
        GOSUB   SUB_7CA36                        * 7C88A
        RSTK=C                                   * 7C88E
        CD0EX                                    * 7C890
        C=C+A   A                                * 7C893
        RSTK=C                                   * 7C895
        GOSUB   SUB_7CA87                        * 7C897
        ?ST=1   2                                * 7C89B
        GOYES   DotNext.L2                       * 7C89E
        ?ST=0   1                                * 7C8A0
        GOYES   Dot%%2Arr.L4                     * 7C8A3
        GOTO    DotNextC.L5                      * 7C8A5
Dot%%2Arr.loop3:
        C=RSTK                                   * 7C8A9
        D0=C                                     * 7C8AB
        A=C     A                                * 7C8AE
        C=RSTK                                   * 7C8B0
        RSTK=C                                   * 7C8B2
        C=C+A   A                                * 7C8B4
        RSTK=C                                   * 7C8B6
        GOSUB   GetAbs%%AB1~jump                 * 7C8B8
        GOSUB   MACCF0~jump                      * 7C8BC
        SETHEX                                   * 7C8C0
        D1=D1+  5                                * 7C8C2
        D1=D1+  16                               * 7C8C5
Dot%%2Arr.L4:
        GOSUB   DotNext                          * 7C8C8
        GONC    Dot%%2Arr.loop3                  * 7C8CC

* refs (3): 7C8C8 7CB2A 7CCFE
* Count down the terms of a real product; after the last, push the result
DotNext:
        C=R4                                     * 7C8CF
        C=C-1   A                                * 7C8D2
        R4=C                                     * 7C8D4
        RTNNC                                    * 7C8D7
DotNext.L1:
        GOSBVL  RCAB0                            * 7C8DA
        GOVLNG  PUSH%.L9                         * 7C8E1
DotNext.L2:
        ?ST=1   1                                * 7C8E8
        GOYES   DotNext.L3                       * 7C8EB
        GOTO    DotNextC.L3                      * 7C8ED
DotNext.L3:
        GOTO    DotNext.L5                       * 7C8F1
DotNext.loop4:
        GOSUB   GetAbs%%AB1~jump                 * 7C8F5
        C=RSTK                                   * 7C8F9
        RSTK=C                                   * 7C8FB
        D0=C                                     * 7C8FD
        GOSUB   MACCF0~jump                      * 7C900
        GOSUB   Dot+1Elem                        * 7C904
        A=-A-1  S                                * 7C908
        C=RSTK                                   * 7C90B
        RSTK=C                                   * 7C90D
        D0=C                                     * 7C90F
        D0=D0+  5                                * 7C912
        D0=D0+  16                               * 7C915
        GOSUB   MACCF0~jump                      * 7C918
        D1=D1-  5                                * 7C91C
        D1=D1-  16                               * 7C91F
        GOSUB   GetAbs%%AB1~jump                 * 7C922
        C=RSTK                                   * 7C926
        RSTK=C                                   * 7C928
        D0=C                                     * 7C92A
        D0=D0+  5                                * 7C92D
        D0=D0+  16                               * 7C930
        GOSUB   MACCF2~jump                      * 7C933
        GOSUB   Dot+1Elem                        * 7C937
        C=RSTK                                   * 7C93B
        RSTK=C                                   * 7C93D
        D0=C                                     * 7C93F
        GOSUB   MACCF2~jump                      * 7C942
        D1=D1+  5                                * 7C946
        D1=D1+  16                               * 7C949
        SETHEX                                   * 7C94C
        C=RSTK                                   * 7C94E
        A=C     A                                * 7C950
        C=RSTK                                   * 7C952
        RSTK=C                                   * 7C954
        C=C+A   A                                * 7C956
        RSTK=C                                   * 7C958
DotNext.L5:
        GOSUB   DotNextC                         * 7C95A
        GOTO    DotNext.loop4                    * 7C95E

* refs (7): 7C95A 7C9BA 7C9F3 7CBB5 7CC01 7CC4F ...
* Count down the terms of a complex product; after the last, push the result
DotNextC:
        C=R4                                     * 7C962
        C=C-1   A                                * 7C965
        R4=C                                     * 7C967
        RTNNC                                    * 7C96A
DotNextC.L1:
        GOSBVL  RCAB0                            * 7C96D
        GOSBVL  RCCD2                            * 7C974
        GOVLNG  C%%CHS.L2                        * 7C97B
DotNextC.loop2:
        GOSUB   GetAbs%%AB1~jump                 * 7C982
        C=RSTK                                   * 7C986
        RSTK=C                                   * 7C988
        D0=C                                     * 7C98A
        GOSUB   MACCF0~jump                      * 7C98D
        GOSUB   GetAbs%%AB1~jump                 * 7C991
        C=RSTK                                   * 7C995
        RSTK=C                                   * 7C997
        D0=C                                     * 7C999
        D0=D0+  5                                * 7C99C
        D0=D0+  16                               * 7C99F
        GOSUB   MACCF2~jump                      * 7C9A2
        D1=D1+  5                                * 7C9A6
        D1=D1+  16                               * 7C9A9
        SETHEX                                   * 7C9AC
        C=RSTK                                   * 7C9AE
        A=C     A                                * 7C9B0
        C=RSTK                                   * 7C9B2
        RSTK=C                                   * 7C9B4
        C=C+A   A                                * 7C9B6
        RSTK=C                                   * 7C9B8
DotNextC.L3:
        GOSUB   DotNextC                         * 7C9BA
        GONC    DotNextC.loop2                   * 7C9BE
DotNextC.loop4:
        GOSUB   GetAbs%%AB1~jump                 * 7C9C1
        C=RSTK                                   * 7C9C5
        RSTK=C                                   * 7C9C7
        D0=C                                     * 7C9C9
        GOSUB   MACCF0~jump                      * 7C9CC
        GOSUB   Dot+1Elem                        * 7C9D0
        C=RSTK                                   * 7C9D4
        RSTK=C                                   * 7C9D6
        D0=C                                     * 7C9D8
        GOSUB   MACCF2~jump                      * 7C9DB
        D1=D1+  5                                * 7C9DF
        D1=D1+  16                               * 7C9E2
        SETHEX                                   * 7C9E5
        C=RSTK                                   * 7C9E7
        A=C     A                                * 7C9E9
        C=RSTK                                   * 7C9EB
        RSTK=C                                   * 7C9ED
        C=C+A   A                                * 7C9EF
        RSTK=C                                   * 7C9F1
DotNextC.L5:
        GOSUB   DotNextC                         * 7C9F3
        GONC    DotNextC.loop4                   * 7C9F7

* refs (3): 7C869 7CAAC 7CC87
* Pop the three bints; D0 at the array, D1 at the other one (the same with ST 0 clear), D.A the element prolog
DotArgs:
        GOSBVL  POP2#                            * 7C9FA
        R4=C                                     * 7CA01
        R0=A                                     * 7CA04
        GOSBVL  POP#                             * 7CA07
        GOSBVL  SAVPTR                           * 7CA0E
        C=DAT1  A                                * 7CA15
        D0=C                                     * 7CA18
        ?ST=0   0                                * 7CA1B
        GOYES   DotArgs.L1                       * 7CA1E
        D1=D1+  5                                * 7CA20
        C=DAT1  A                                * 7CA23
DotArgs.L1:
        D1=C                                     * 7CA26
        D1=D1+  10                               * 7CA29
        C=DAT1  A                                * 7CA2C
        D=C     A                                * 7CA2F
        D1=D1+  15                               * 7CA31
        RTN                                      * 7CA34

* refs (2): 7C88A 7CADC
SUB_7CA36:
        CD1EX                                    * 7CA36
        C=C+A   A                                * 7CA39
        D1=C                                     * 7CA3B
        D0=D0+  10                               * 7CA3E
        C=DAT0  A                                * 7CA41
        D=C     A                                * 7CA44
        D0=D0+  5                                * 7CA46
        C=DAT0  A                                * 7CA49
        D0=D0+  10                               * 7CA4C
        B=C     A                                * 7CA4F
        C=C-1   A                                * 7CA51
        ?C=0    A                                * 7CA53
        GOYES   SUB_7CA36.L1                     * 7CA56
        C=DAT0  A                                * 7CA58
        B=C     A                                * 7CA5B
        D0=D0+  5                                * 7CA5D
SUB_7CA36.L1:
        A=R0                                     * 7CA60
        A=A-1   A                                * 7CA63
        GOSUB   A*21~jump                        * 7CA65
        GOSUB   B*21~jump                        * 7CA69
        ST=0    2                                * 7CA6D
        LC(5)   DOEREL                           * 7CA70
        ?D=C    A                                * 7CA77
        GOYES   SUB_7CA36.L2                     * 7CA7A
        ST=1    2                                * 7CA7C
        A=A+A   A                                * 7CA7F
        B=B+B   A                                * 7CA81
SUB_7CA36.L2:
        C=B     A                                * 7CA83
        RTN                                      * 7CA85

* refs (3): 7C897 7CAE9 7CCCA
SUB_7CA87:
        C=0     W                                * 7CA87
        R0=C                                     * 7CA8A
        R1=C                                     * 7CA8D
        R2=C                                     * 7CA90
        R3=C                                     * 7CA93
        RTN                                      * 7CA96

* refs (7): 905D4 90895 93CA5 93E7A 93F9C 940F6 ...
* As Dot%%1Arr with the stride taken from the stack as well
Dot%%1Stride:
        CON(5)  (*)+5                            * 7CA98  primitive code object
        ST=0    0                                * 7CA9D
        GOTO    Dot%%2Stride.L1                  * 7CAA0

* refs (3): 941CD 9842F 984C0
* As Dot%%2Arr with the stride taken from the stack as well
Dot%%2Stride:
        CON(5)  (*)+5                            * 7CAA4  primitive code object
        ST=1    0                                * 7CAA9
Dot%%2Stride.L1:
        GOSUB   DotArgs                          * 7CAAC
        C=DAT1  A                                * 7CAB0
        B=C     A                                * 7CAB3
        D1=D1+  5                                * 7CAB5
        A=A-1   A                                * 7CAB8
        GOSUB   A*21~jump                        * 7CABA
        GOSUB   B*21~jump                        * 7CABE
        ST=0    1                                * 7CAC2
        LC(5)   DOEREL                           * 7CAC5
        ?D=C    A                                * 7CACC
        GOYES   Dot%%2Stride.L2                  * 7CACF
        ST=1    1                                * 7CAD1
        A=A+A   A                                * 7CAD4
        B=B+B   A                                * 7CAD6
Dot%%2Stride.L2:
        C=B     A                                * 7CAD8
        RSTK=C                                   * 7CADA
        GOSUB   SUB_7CA36                        * 7CADC
        RSTK=C                                   * 7CAE0
        CD0EX                                    * 7CAE2
        C=C+A   A                                * 7CAE5
        RSTK=C                                   * 7CAE7
        GOSUB   SUB_7CA87                        * 7CAE9
        ?ST=1   2                                * 7CAED
        GOYES   Dot%%2Stride.L5                  * 7CAF0
        ?ST=0   1                                * 7CAF2
        GOYES   Dot%%2Stride.L4                  * 7CAF5
        GOTO    Dot%%2Stride.L12                 * 7CAF7
Dot%%2Stride.loop3:
        GOSUB   GetAbs%%AB1~jump                 * 7CAFB
        C=RSTK                                   * 7CAFF
        RSTK=C                                   * 7CB01
        D0=C                                     * 7CB03
        GOSUB   MACCF0~jump                      * 7CB06
        SETHEX                                   * 7CB0A
        C=RSTK                                   * 7CB0C
        A=C     A                                * 7CB0E
        C=RSTK                                   * 7CB10
        A=A+C   A                                * 7CB12
        B=C     A                                * 7CB14
        C=RSTK                                   * 7CB16
        RSTK=C                                   * 7CB18
        AD1EX                                    * 7CB1A
        A=A+C   A                                * 7CB1D
        AD1EX                                    * 7CB1F
        C=B     A                                * 7CB22
        RSTK=C                                   * 7CB24
        C=A     A                                * 7CB26
        RSTK=C                                   * 7CB28
Dot%%2Stride.L4:
        GOSUB   DotNext                          * 7CB2A
        GONC    Dot%%2Stride.loop3               * 7CB2E
Dot%%2Stride.L5:
        ?ST=1   1                                * 7CB31
        GOYES   Dot%%2Stride.L6                  * 7CB34
        GOTO    Dot%%2Stride.L10                 * 7CB36
Dot%%2Stride.L6:
        GOTO    Dot%%2Stride.L8                  * 7CB3A
Dot%%2Stride.loop7:
        GOSUB   GetAbs%%AB1~jump                 * 7CB3E
        C=RSTK                                   * 7CB42
        RSTK=C                                   * 7CB44
        D0=C                                     * 7CB46
        GOSUB   MACCF0~jump                      * 7CB49
        GOSUB   Dot+1Elem                        * 7CB4D
        C=RSTK                                   * 7CB51
        RSTK=C                                   * 7CB53
        D0=C                                     * 7CB55
        D0=D0+  5                                * 7CB58
        D0=D0+  16                               * 7CB5B
        GOSUB   MACCF0~jump                      * 7CB5E
        D1=D1-  5                                * 7CB62
        D1=D1-  16                               * 7CB65
        GOSUB   GetAbs%%AB1~jump                 * 7CB68
        C=RSTK                                   * 7CB6C
        RSTK=C                                   * 7CB6E
        D0=C                                     * 7CB70
        D0=D0+  5                                * 7CB73
        D0=D0+  16                               * 7CB76
        GOSUB   MACCF2~jump                      * 7CB79
        GOSUB   Dot+1Elem                        * 7CB7D
        A=-A-1  S                                * 7CB81
        D1=D1-  5                                * 7CB84
        D1=D1-  16                               * 7CB87
        C=RSTK                                   * 7CB8A
        RSTK=C                                   * 7CB8C
        D0=C                                     * 7CB8E
        GOSUB   MACCF2~jump                      * 7CB91
        SETHEX                                   * 7CB95
        C=RSTK                                   * 7CB97
        A=C     A                                * 7CB99
        C=RSTK                                   * 7CB9B
        A=A+C   A                                * 7CB9D
        B=C     A                                * 7CB9F
        C=RSTK                                   * 7CBA1
        RSTK=C                                   * 7CBA3
        AD1EX                                    * 7CBA5
        A=A+C   A                                * 7CBA8
        AD1EX                                    * 7CBAA
        C=B     A                                * 7CBAD
        RSTK=C                                   * 7CBAF
        C=A     A                                * 7CBB1
        RSTK=C                                   * 7CBB3
Dot%%2Stride.L8:
        GOSUB   DotNextC                         * 7CBB5
        GOTO    Dot%%2Stride.loop7               * 7CBB9
Dot%%2Stride.loop9:
        GOSUB   GetAbs%%AB1~jump                 * 7CBBD
        C=RSTK                                   * 7CBC1
        RSTK=C                                   * 7CBC3
        D0=C                                     * 7CBC5
        GOSUB   MACCF0~jump                      * 7CBC8
        GOSUB   GetAbs%%AB1~jump                 * 7CBCC
        C=RSTK                                   * 7CBD0
        RSTK=C                                   * 7CBD2
        D0=C                                     * 7CBD4
        D0=D0+  5                                * 7CBD7
        D0=D0+  16                               * 7CBDA
        GOSUB   MACCF2~jump                      * 7CBDD
        SETHEX                                   * 7CBE1
        C=RSTK                                   * 7CBE3
        A=C     A                                * 7CBE5
        C=RSTK                                   * 7CBE7
        A=A+C   A                                * 7CBE9
        B=C     A                                * 7CBEB
        C=RSTK                                   * 7CBED
        RSTK=C                                   * 7CBEF
        AD1EX                                    * 7CBF1
        A=A+C   A                                * 7CBF4
        AD1EX                                    * 7CBF6
        C=B     A                                * 7CBF9
        RSTK=C                                   * 7CBFB
        C=A     A                                * 7CBFD
        RSTK=C                                   * 7CBFF
Dot%%2Stride.L10:
        GOSUB   DotNextC                         * 7CC01
        GONC    Dot%%2Stride.loop9               * 7CC05
Dot%%2Stride.loop11:
        GOSUB   GetAbs%%AB1~jump                 * 7CC08
        C=RSTK                                   * 7CC0C
        RSTK=C                                   * 7CC0E
        D0=C                                     * 7CC10
        GOSUB   MACCF0~jump                      * 7CC13
        GOSUB   Dot+1Elem                        * 7CC17
        A=-A-1  S                                * 7CC1B
        D1=D1-  5                                * 7CC1E
        D1=D1-  16                               * 7CC21
        C=RSTK                                   * 7CC24
        RSTK=C                                   * 7CC26
        D0=C                                     * 7CC28
        GOSUB   MACCF2~jump                      * 7CC2B
        SETHEX                                   * 7CC2F
        C=RSTK                                   * 7CC31
        A=C     A                                * 7CC33
        C=RSTK                                   * 7CC35
        A=A+C   A                                * 7CC37
        B=C     A                                * 7CC39
        C=RSTK                                   * 7CC3B
        RSTK=C                                   * 7CC3D
        AD1EX                                    * 7CC3F
        A=A+C   A                                * 7CC42
        AD1EX                                    * 7CC44
        C=B     A                                * 7CC47
        RSTK=C                                   * 7CC49
        C=A     A                                * 7CC4B
        RSTK=C                                   * 7CC4D
Dot%%2Stride.L12:
        GOSUB   DotNextC                         * 7CC4F
        GONC    Dot%%2Stride.loop11              * 7CC53

* refs (13): 7C8BC 7C900 7C918 7C98D 7C9CC 7CB06 ...
MACCF0~jump:
        GOVLNG  MACCF0                           * 7CC56

* refs (10): 7C933 7C942 7C9A2 7C9DB 7CB79 7CB91 ...
MACCF2~jump:
        GOVLNG  MACCF2                           * 7CC5D

* refs (8): 7C904 7C937 7C9D0 7CB4D 7CB7D 7CC17 ...
* D1 past one element (21 nibbles)
Dot+1Elem:
        D1=D1+  5                                * 7CC64
        D1=D1+  16                               * 7CC67

* refs (15): 7C8B8 7C8F5 7C922 7C982 7C991 7C9C1 ...
GetAbs%%AB1~jump:
        GOVLNG  GetAbs%%AB1                      * 7CC6A

* refs (4): 7C872 7CA65 7CABA 7CC96
A*21~jump:
        GOVLNG  A*21                             * 7CC71

* refs (3): 7CA69 7CABE 7CCA1
B*21~jump:
        GOVLNG  B*21                             * 7CC78

* refs (4): 943B7 944ED 95A95 95CAC
* Inner product along a row and a column of one array
DotRowCol:
        CON(5)  (*)+5                            * 7CC7F  primitive code object
        ST=0    0                                * 7CC84
        GOSUB   DotArgs                          * 7CC87
        D1=D1+  5                                * 7CC8B
        D0=D0+  15                               * 7CC8E
        D0=D0+  15                               * 7CC91
        A=A-1   A                                * 7CC94
        GOSUB   A*21~jump                        * 7CC96
        C=R0                                     * 7CC9A
        B=C     A                                * 7CC9D
        B=B-1   A                                * 7CC9F
        GOSUB   B*21~jump                        * 7CCA1
        ST=0    1                                * 7CCA5
        LC(5)   DOEREL                           * 7CCA8
        ?D=C    A                                * 7CCAF
        GOYES   DotRowCol.L1                     * 7CCB2
        ST=1    1                                * 7CCB4
        A=A+A   A                                * 7CCB7
        B=B+B   A                                * 7CCB9
DotRowCol.L1:
        CD1EX                                    * 7CCBB
        C=C+A   A                                * 7CCBE
        D1=C                                     * 7CCC0
        CD0EX                                    * 7CCC3
        C=C+B   A                                * 7CCC6
        RSTK=C                                   * 7CCC8
        GOSUB   SUB_7CA87                        * 7CCCA
        ?ST=0   1                                * 7CCCE
        GOYES   DotRowCol.L3                     * 7CCD1
        GOTO    DotRowCol.L5                     * 7CCD3
DotRowCol.loop2:
        GOSUB   GetAbs%%AB1~jump                 * 7CCD7
        C=RSTK                                   * 7CCDB
        RSTK=C                                   * 7CCDD
        D0=C                                     * 7CCDF
        GOSUB   MACCF0~jump                      * 7CCE2
        D1=D1+  16                               * 7CCE6
        D1=D1+  5                                * 7CCE9
        C=RSTK                                   * 7CCEC
        D0=C                                     * 7CCEE
        D0=D0+  16                               * 7CCF1
        D0=D0+  5                                * 7CCF4
        CD0EX                                    * 7CCF7
        RSTK=C                                   * 7CCFA
        SETHEX                                   * 7CCFC
DotRowCol.L3:
        GOSUB   DotNext                          * 7CCFE
        GONC    DotRowCol.loop2                  * 7CD02
DotRowCol.loop4:
        GOSUB   GetAbs%%AB1~jump                 * 7CD05
        C=RSTK                                   * 7CD09
        RSTK=C                                   * 7CD0B
        D0=C                                     * 7CD0D
        GOSUB   MACCF0~jump                      * 7CD10
        GOSUB   Dot+1Elem                        * 7CD14
        C=RSTK                                   * 7CD18
        RSTK=C                                   * 7CD1A
        D0=C                                     * 7CD1C
        D0=D0+  5                                * 7CD1F
        D0=D0+  16                               * 7CD22
        GOSUB   MACCF0~jump                      * 7CD25
        D1=D1-  5                                * 7CD29
        D1=D1-  16                               * 7CD2C
        GOSUB   GetAbs%%AB1~jump                 * 7CD2F
        C=RSTK                                   * 7CD33
        RSTK=C                                   * 7CD35
        D0=C                                     * 7CD37
        D0=D0+  5                                * 7CD3A
        D0=D0+  16                               * 7CD3D
        GOSUB   MACCF2~jump                      * 7CD40
        GOSUB   Dot+1Elem                        * 7CD44
        A=-A-1  S                                * 7CD48
        D1=D1+  5                                * 7CD4B
        D1=D1+  16                               * 7CD4E
        C=RSTK                                   * 7CD51
        RSTK=C                                   * 7CD53
        D0=C                                     * 7CD55
        GOSUB   MACCF2~jump                      * 7CD58
        C=RSTK                                   * 7CD5C
        D0=C                                     * 7CD5E
        D0=D0+  16                               * 7CD61
        D0=D0+  16                               * 7CD64
        D0=D0+  10                               * 7CD67
        CD0EX                                    * 7CD6A
        RSTK=C                                   * 7CD6D
        SETHEX                                   * 7CD6F
DotRowCol.L5:
        GOSUB   DotNextC                         * 7CD71
        GOTO    DotRowCol.loop4                  * 7CD75
        RPL

* refs (15): 903DC 979D2 97EF3 97FF2 C8819 C8951 ...
* Probably: [array] -> [%%array]: convert a real or complex array to an extended one of the same dimensions
OBJ_7CD79:
        ::                                       * 7CD79

* refs (5): 93806 97D80 9802A 98086 98712
* arry -> arry %%arry: a new array of the same size, %% or C%%, filled from the first
Arry>Ext:
          :: DUP DIMLIMITS OVER TYPERARRY? ITE %%0 ((0,0)) * 7CD7E
            MAKEARRY ArryCopyExt ;               * 7CDA6
          SWAPDROP ;                             * 7CDB5

* refs (4): 7CDAB 93C6E 951E4 CAE2F
* arry %%arry -> %%arry: copy elements, real to extended
ArryCopyExt:
        :: OVERARSIZE ArryReal>Ext ;             * 7CDBF

* refs (4): C80B1 C80CA C96BC C96D5
OBJ_7CDD3:
        :: DUP%0CON SWAP                         * 7CDD3

* refs (10): 93947 93A73 93A92 95220 954EB 955ED ...
* %%arry arry -> arry: copy back, rounding to 12 digits
ExtArry>:
          :: OVERARSIZE ArryExt>Real DROP ; ;    * 7CDE2

* refs (4): C7A4B C7F53 C933F CAA8F
OBJ_7CE00:
        :: SWAP %>%%- 2DUP %%> case SWAPDROP     * 7CE00
          %%/2 ~2DUP;%%<;NOT?SWAPDROP ;          * 7CE23

* refs (4): C7A50 C7F58 C9344 CAA94
OBJ_7CE32:
        :: SWAP %>%%- 2DUP %%< case SWAPDROP     * 7CE32
          %%/2 %%MAX ;                           * 7CE55

* refs (3): 97AAC 97B66 97C80
COND~5:
        :: %%0 SWAP ONE_DO_ARRY INDEX@ PULL%%EL B%ABS ROT %%+ SWAP * 7CE64
          NextInArray SWAP ;                     * 7CE96

* refs (8): 9242A 92885 979DC 97D8A 97EFD 97FFC ...
* Crout LU decomposition with partial pivoting of an extended array; error 501 when bigger than #FFF
LUFactor:
        :: # FFF OVER#< case doerr501            * 7CEA5
          DUP #8* !MAKEHXS 2NULLLAM{} BIND DUP ArryLOne #ZERO#ONE 3NULLLAM{} * 7CEC3
          BIND 5GETLAM LUPivot CkATTNQUIT BEGIN 1GETLAM DUP PivotRow 5GETLAM * 7CEF0
          HXS3! 2DUP#= ?SKIP                     * 7CF1D
          :: SWAPCOLUMNS 3GETLAM DUPTYPEEREL? ITE %%CHS * 7CF2C
            :: C%%CHS C%%CONJ ;                  * 7CF4A
            3PUTLAM ;                            * 7CF5E
          DROP 5GETLAM FALSE OBJ_7D3CB 3GETLAM LUFactor~2 2GETLAM LUFactor~1 * 7CF68
          2PUTLAM 3PUTLAM 1GETLAM 6GETLAM #< WHILE * 7CF90
          :: 1GETLAM #1+ 1PUTLAM ONESWAP 1GETLAM ONE_DO OVER 1GETLAM 2DUP * 7CFAE
            #1-+ 4UNROLL INDEX@ #1- Dot%%1Arr SWAP3PICK PULL%%EL ROT L%- * 7CFE0
            SWAPINDEX@ 5GETLAM TRUE OBJ_7D3CB ROTSWAP L%/ ROT PUT%%EL * 7D00D
            6GETLAM ROT#+SWAP NextInArray 6GETLAM #1+ 1GETLAM DO OVER * 7D035
            1GETLAM 2DUP #1-+ 4UNROLL DUP#1- Dot%%1Arr SWAP3PICK PULL%%EL * 7D05D
            ROT L%- ROT PUT%%EL 6GETLAM ROT#+SWAP NextInArray SWAPDROP ; * 7D085
          REPEAT 3GETLAM 2GETLAM ABND ;          * 7D0B2

* refs (7): 92439 928EE 98039 C9E0F C9EF0 CA057 ...
* Solve with the factors of LUFactor: swap the rows, then forward and back substitution
LUSolve:
        :: 3UNROLL 2GETLAM ONE_DO INDEX@ 1GETLAM HXS3@ 2DUP#= ?SKIP * 7D0CB
          SWAPCOLUMNS                            * 7D0F8
          2DROP NextInArray ROT LUBackSub ROTROT2DROP ; * 7D0FD

* refs (4): 7D10C 97AA2 97B5C 97C76
* Forward and back substitution
LUBackSub:
        :: 3UNROLL ONEONE 2SWAP 2GETLAM #1+_ONE_DO SWAPINDEX@ 1GETLAM TRUE * 7D11B
          OBJ_7D3CB SWAPROT 6PICK #1+_ONE_DO 5PICK INDEX@ JINDEX@ #1- * 7D148
          Dot%%2Arr SWAP 5PICK PULL%%EL ROT L%- 4PICK L%/ 5PICK PUT%%EL * 7D170
          4ROLL #1+ 4UNROLL NextInArray ROTDROP 4ROLL 2GETLAM #+ 4UNROLL * 7D1A2
          LOOP ROTDROPROTDROP 2GETLAM DUP#1= caseDROP DUP#1- * 7D1CF
          OVER #* 4UNROLL DUP#1- 6PICK #* 4UNROLL ONE_DO 5PICK ZERO_DO 2OVER * 7D1ED
          7PICK #+ JINDEX@ Dot%%2Arr SWAP 4PICK PULL%%EL ROT L%- 4PICK * 7D224
          PUT%%EL ROT #1-UNROT NextInArray 4ROLL 2GETLAM #-#1- 4UNROLL LOOP * 7D256
          ROTDROPROTDROP ;                       * 7D283

* refs (2): 7CEFA 9871C
* Choose the pivot row in a column by magnitude
LUPivot:
        CON(5)  (*)+5                            * 7D28D  primitive code object
        ASSEMBLE
        GOSUB   SUB_7D6B0                        * 7D292
        B=A     A                                * 7D296
        C=DAT1  A                                * 7D298
        D1=C                                     * 7D29B
        D1=D1+  10                               * 7D29E
        C=DAT1  A                                * 7D2A1
        D=C     A                                * 7D2A4
        D1=D1+  10                               * 7D2A6
        C=DAT1  A                                * 7D2A9
        C=C-1   A                                * 7D2AC
        R4=C                                     * 7D2AE
        D1=D1+  5                                * 7D2B1
        C=DAT1  A                                * 7D2B4
        D1=D1+  5                                * 7D2B7
        AD1EX                                    * 7D2BA
        R3=A                                     * 7D2BD
        A=C     A                                * 7D2C0
        C=C-1   A                                * 7D2C2
        RSTK=C                                   * 7D2C4
        C=C+1   A                                * 7D2C6
        B=B+C   A                                * 7D2C8
        C=C+C   A                                * 7D2CA
        C=C+B   A                                * 7D2CC
        D0=C                                     * 7D2CE
        D0=D0+  10                               * 7D2D1
        GOSBVL  A*21                             * 7D2D4
        ST=0    0                                * 7D2DB
        LC(5)   DOEREL                           * 7D2DE
        ?D=C    A                                * 7D2E5
        GOYES   LUPivot.L1                       * 7D2E8
        ST=1    0                                * 7D2EA
        A=A+A   A                                * 7D2ED
LUPivot.L1:
        R2=A                                     * 7D2EF
LUPivot.loop2:
        C=R3                                     * 7D2F2
        D1=C                                     * 7D2F5
        LC(5)   #49500                           * 7D2F8
        A=C     A                                * 7D2FF
        LC(5)   #50000                           * 7D301
        B=C     A                                * 7D308
        C=R4                                     * 7D30A
        B=C     X                                * 7D30D
LUPivot.loop3:
        SETDEC                                   * 7D310
        ?ST=0   0                                * 7D312
        GOYES   LUPivot.L6                       * 7D315
        D1=D1+  16                               * 7D317
        D1=D1+  10                               * 7D31A
        C=DAT1  W                                * 7D31D
        D1=D1-  5                                * 7D321
        ?C=0    M                                * 7D324
        GOYES   LUPivot.L5                       * 7D327
        C=DAT1  A                                * 7D329
        P=      4                                * 7D32C
        C=C+B   P                                * 7D32E
        D=C     A                                * 7D331
        D1=D1-  16                               * 7D333
        C=DAT1  W                                * 7D336
        D1=D1-  5                                * 7D33A
        ?C=0    M                                * 7D33D
        GOYES   LUPivot.loop4                    * 7D340
        C=DAT1  A                                * 7D342
        C=C+B   P                                * 7D345
        ?D<=C   A                                * 7D348
        GOYES   LUPivot.L7                       * 7D34B
LUPivot.loop4:
        C=D     A                                * 7D34D
        GOTO    LUPivot.L7                       * 7D34F
LUPivot.L5:
        D1=D1-  16                               * 7D353
        D1=D1-  5                                * 7D356
LUPivot.L6:
        LC(5)   #49500                           * 7D359
        D=C     A                                * 7D360
        D1=D1+  5                                * 7D362
        C=DAT1  W                                * 7D365
        D1=D1-  5                                * 7D369
        ?C=0    M                                * 7D36C
        GOYES   LUPivot.loop4                    * 7D36F
        C=DAT1  A                                * 7D371
        P=      4                                * 7D374
        C=C+B   P                                * 7D376
LUPivot.L7:
        SETHEX                                   * 7D379
        P=      0                                * 7D37B
        ?C<=A   A                                * 7D37D
        GOYES   LUPivot.L8                       * 7D380
        A=C     A                                * 7D382
LUPivot.L8:
        CD1EX                                    * 7D384
        D=C     A                                * 7D387
        C=R2                                     * 7D389
        C=C+D   A                                * 7D38C
        D1=C                                     * 7D38E
        B=B-1   X                                * 7D391
        GOC     LUPivot.L9                       * 7D394
        GOTO    LUPivot.loop3                    * 7D397
LUPivot.L9:
        DAT0=A  A                                * 7D39B
        D0=D0+  5                                * 7D39E
        A=R3                                     * 7D3A1
        LC(5)   #00015                           * 7D3A4
        ?ST=0   0                                * 7D3AB
        GOYES   LUPivot.L10                      * 7D3AE
        C=C+C   A                                * 7D3B0
LUPivot.L10:
        A=A+C   A                                * 7D3B2
        R3=A                                     * 7D3B4
        C=RSTK                                   * 7D3B7
        C=C-1   A                                * 7D3B9
        RSTK=C                                   * 7D3BB
        GOC     LUPivot.L11                      * 7D3BD
        GOTO    LUPivot.loop2                    * 7D3C0
LUPivot.L11:
        GOVLNG  GETPTRLOOP                       * 7D3C4

* refs (5): 7CF77 7D01C 7D148 980F6 9849D
* Probably: pull an element from an array as a %% or C%%, with a flag for treating zero specially
OBJ_7D3CB:
        CON(5)  (*)+5                            * 7D3CB  primitive code object
        ST=1    1                                * 7D3D0
        GOSBVL  popflag                          * 7D3D3
        GOC     OBJ_7D3CB.L1                     * 7D3DA
        ST=0    1                                * 7D3DD
OBJ_7D3CB.L1:
        C=DAT1  A                                * 7D3E0
        D1=D1+  5                                * 7D3E3
        D=D+1   A                                * 7D3E6
        R0=C                                     * 7D3E8
        GOSUB   SUB_7D6B0                        * 7D3EB
        D0=A                                     * 7D3EF
        D0=D0+  5                                * 7D3F2
        C=DAT0  A                                * 7D3F5
        D=C     A                                * 7D3F8
        R1=C                                     * 7D3FA
        C=DAT1  A                                * 7D3FD
        D1=C                                     * 7D400
        D1=D1+  10                               * 7D403
        A=DAT1  A                                * 7D406
        LC(5)   DOEREL                           * 7D409
        ST=0    0                                * 7D410
        ?C=A    A                                * 7D413
        GOYES   OBJ_7D3CB.L2                     * 7D416
        ST=1    0                                * 7D418
OBJ_7D3CB.L2:
        D1=D1+  15                               * 7D41B
        C=DAT1  A                                * 7D41E
        R2=C                                     * 7D421
        A=C     A                                * 7D424
        D1=D1+  5                                * 7D426
        C=C+1   A                                * 7D429
        GOSBVL  PUTCMPEL.L6                      * 7D42B
        B=B-A   A                                * 7D432
        B=B-1   A                                * 7D434
        GOSBVL  B*21                             * 7D436
        ?ST=0   0                                * 7D43D
        GOYES   OBJ_7D3CB.L3                     * 7D440
        B=B+B   A                                * 7D442
OBJ_7D3CB.L3:
        CD1EX                                    * 7D444
        C=C+B   A                                * 7D447
        D1=C                                     * 7D449
        GOSBVL  GETAB1                           * 7D44C
        ?ST=1   0                                * 7D453
        GOYES   OBJ_7D3CB.L5                     * 7D456
        ?ST=0   1                                * 7D458
        GOYES   OBJ_7D3CB.loop4                  * 7D45B
        ?B=0    M                                * 7D45D
        GOYES   OBJ_7D3CB.L8                     * 7D460
OBJ_7D3CB.loop4:
        GOVLNG  PUSH%.L9                         * 7D462
OBJ_7D3CB.L5:
        GOSBVL  Get1%CD                          * 7D469
        ?ST=0   1                                * 7D470
        GOYES   OBJ_7D3CB.loop6                  * 7D473
        ?B=0    M                                * 7D475
        GOYES   OBJ_7D3CB.L7                     * 7D478
OBJ_7D3CB.loop6:
        GOVLNG  C%%CHS.L2                        * 7D47A
OBJ_7D3CB.L7:
        ?D#0    M                                * 7D481
        GOYES   OBJ_7D3CB.loop6                  * 7D484
OBJ_7D3CB.L8:
        A=R2                                     * 7D486
        B=A     A                                * 7D489
        A=A+A   A                                * 7D48B
        A=A+B   A                                * 7D48D
        C=R1                                     * 7D48F
        C=C-1   A                                * 7D492
        D=C     A                                * 7D494
        C=C+C   A                                * 7D496
        C=C+C   A                                * 7D498
        C=C+D   A                                * 7D49A
        C=C+A   A                                * 7D49C
        A=R0                                     * 7D49E
        C=C+A   A                                * 7D4A1
        D0=C                                     * 7D4A3
        D0=D0+  10                               * 7D4A6
        A=DAT0  A                                * 7D4A9
        LC(5)   #49986                           * 7D4AC
        SETDEC                                   * 7D4B3
        A=A+C   A                                * 7D4B5
        A=0     S                                * 7D4B7
        B=0     W                                * 7D4BA
        P=      14                               * 7D4BD
        B=B+1   P                                * 7D4BF
        GONC    OBJ_7D3CB.loop4                  * 7D4C2  always taken

* refs (2): 7CDC9 93914
* Copy the elements of the first array to the second, real to extended
ArryReal>Ext:
        CON(5)  (*)+5                            * 7D4C5  primitive code object
        GOSBVL  POP#                             * 7D4CA
        GOSUB   SAVPTR~jump_22                   * 7D4D1
        C=DAT1  A                                * 7D4D5
        D0=C                                     * 7D4D8
        D1=D1+  5                                * 7D4DB
        C=DAT1  A                                * 7D4DE
        D1=C                                     * 7D4E1
        D1=D1+  10                               * 7D4E4
        C=DAT1  A                                * 7D4E7
        D=C     A                                * 7D4EA
        D1=D1+  5                                * 7D4EC
        C=DAT1  A                                * 7D4EF
        D1=D1+  10                               * 7D4F2
        C=C-1   A                                * 7D4F5
        ?C=0    A                                * 7D4F7
        GOYES   ArryReal>Ext.L1                  * 7D4FA
        D1=D1+  5                                * 7D4FC
ArryReal>Ext.L1:
        ST=0    1                                * 7D4FF
        ST=1    0                                * 7D502
        ST=0    2                                * 7D505
        ST=0    3                                * 7D508
        LC(5)   DOREAL                           * 7D50B
        ?D=C    A                                * 7D512
        GOYES   ArryReal>Ext.L2                  * 7D515
        ST=0    0                                * 7D517
        LC(5)   DOEREL                           * 7D51A
        ?D=C    A                                * 7D521
        GOYES   ArryReal>Ext.L2                  * 7D524
        ST=1    1                                * 7D526
        A=A+A   A                                * 7D529
        LC(5)   DOECMP                           * 7D52B
        ?D=C    A                                * 7D532
        GOYES   ArryReal>Ext.L2                  * 7D535
        ST=1    0                                * 7D537
ArryReal>Ext.L2:
        D0=D0+  10                               * 7D53A
        C=DAT0  A                                * 7D53D
        D=C     A                                * 7D540
        D0=D0+  5                                * 7D542
        C=DAT0  A                                * 7D545
        D0=D0+  10                               * 7D548
        C=C-1   A                                * 7D54B
        ?C=0    A                                * 7D54D
        GOYES   ArryReal>Ext.L3                  * 7D550
        D0=D0+  5                                * 7D552
ArryReal>Ext.L3:
        LC(5)   DOEREL                           * 7D555
        ?D=C    A                                * 7D55C
        GOYES   ArryReal>Ext.L4                  * 7D55F
        ?ST=1   1                                * 7D561
        GOYES   ArryReal>Ext.L5                  * 7D564
        ST=1    2                                * 7D566
        GONC    ArryReal>Ext.L5                  * 7D569
ArryReal>Ext.L4:
        ?ST=0   1                                * 7D56C
        GOYES   ArryReal>Ext.L5                  * 7D56F
        ST=1    3                                * 7D571
ArryReal>Ext.L5:
        C=A     A                                * 7D574
ArryReal>Ext.loop6:
        C=C-1   A                                * 7D576
        GOC     ArryReal>Ext.L10                 * 7D578
        ?ST=1   0                                * 7D57B
        GOYES   ArryReal>Ext.L7                  * 7D57E
        GOSBVL  GETAB1                           * 7D580
        ?ST=0   3                                * 7D587
        GOYES   ArryReal>Ext.L9                  * 7D58A
        D1=D1+  5                                * 7D58C
        GONC    ArryReal>Ext.L8                  * 7D58F
ArryReal>Ext.L7:
        A=DAT1  W                                * 7D592
        D1=D1+  16                               * 7D596
        GOSBVL  SPLITA                           * 7D599
        SETHEX                                   * 7D5A0
        ?ST=0   3                                * 7D5A2
        GOYES   ArryReal>Ext.L9                  * 7D5A5
ArryReal>Ext.L8:
        D1=D1+  16                               * 7D5A7
        C=C-1   A                                * 7D5AA
ArryReal>Ext.L9:
        GOSBVL  PUTAB0                           * 7D5AC
        ?ST=0   2                                * 7D5B3
        GOYES   ArryReal>Ext.loop6               * 7D5B6
        A=0     W                                * 7D5B8
        DAT0=A  A                                * 7D5BB
        D0=D0+  5                                * 7D5BE
        DAT0=A  W                                * 7D5C1
        D0=D0+  16                               * 7D5C5
        GONC    ArryReal>Ext.loop6               * 7D5C8
ArryReal>Ext.L10:
        GOTO    LUPivot.L11                      * 7D5CB

* refs (1): 7CDEC
* Copy the elements of the first array to the second, extended to real
ArryExt>Real:
        CON(5)  (*)+5                            * 7D5CF  primitive code object
        ST=0    1                                * 7D5D4
        GOSBVL  POP#                             * 7D5D7
        GOSUB   SAVPTR~jump_22                   * 7D5DE
        C=DAT1  A                                * 7D5E2
        D0=C                                     * 7D5E5
        D1=D1+  5                                * 7D5E8
        C=DAT1  A                                * 7D5EB
        D1=C                                     * 7D5EE
        D1=D1+  10                               * 7D5F1
        C=DAT1  A                                * 7D5F4
        D=C     A                                * 7D5F7
        D1=D1+  5                                * 7D5F9
        C=DAT1  A                                * 7D5FC
        D1=D1+  10                               * 7D5FF
        C=C-1   A                                * 7D602
        ?C=0    A                                * 7D604
        GOYES   ArryExt>Real.L1                  * 7D607
        D1=D1+  5                                * 7D609
ArryExt>Real.L1:
        ST=0    2                                * 7D60C
        ST=0    3                                * 7D60F
        ST=0    0                                * 7D612
        LC(5)   DOREAL                           * 7D615
        ?D=C    A                                * 7D61C
        GOYES   ArryExt>Real.L2                  * 7D61F
        ST=1    0                                * 7D621
ArryExt>Real.L2:
        D0=D0+  10                               * 7D624
        C=DAT0  A                                * 7D627
        D=C     A                                * 7D62A
        D0=D0+  5                                * 7D62C
        C=DAT0  A                                * 7D62F
        D0=D0+  10                               * 7D632
        C=C-1   A                                * 7D635
        ?C=0    A                                * 7D637
        GOYES   ArryExt>Real.L3                  * 7D63A
        D0=D0+  5                                * 7D63C
ArryExt>Real.L3:
        LC(5)   DOEREL                           * 7D63F
        ?D=C    A                                * 7D646
        GOYES   ArryExt>Real.L4                  * 7D649
        A=A+A   A                                * 7D64B
        ?ST=1   0                                * 7D64D
        GOYES   ArryExt>Real.L5                  * 7D650
        ST=1    2                                * 7D652
        GONC    ArryExt>Real.L5                  * 7D655
ArryExt>Real.L4:
        ?ST=0   0                                * 7D658
        GOYES   ArryExt>Real.L5                  * 7D65B
        ST=1    3                                * 7D65D
ArryExt>Real.L5:
        C=A     A                                * 7D660
        D=C     A                                * 7D662
ArryExt>Real.loop6:
        D=D-1   A                                * 7D664
        GOC     ArryExt>Real.L8                  * 7D666
        GOSBVL  GETAB0                           * 7D669
        CD0EX                                    * 7D670
        RSTK=C                                   * 7D673
        SETDEC                                   * 7D675
        GOSUB   SUB_7D6BF                        * 7D677
        SETHEX                                   * 7D67B
        C=RSTK                                   * 7D67D
        D0=C                                     * 7D67F
        DAT1=A  W                                * 7D682
        D1=D1+  16                               * 7D686
        ?ST=1   3                                * 7D689
        GOYES   ArryExt>Real.L7                  * 7D68C
        ?ST=0   2                                * 7D68E
        GOYES   ArryExt>Real.loop6               * 7D691
        D0=D0+  16                               * 7D693
        D0=D0+  5                                * 7D696
        D=D-1   A                                * 7D699
        GONC    ArryExt>Real.loop6               * 7D69B
ArryExt>Real.L7:
        A=0     W                                * 7D69E
        DAT1=A  W                                * 7D6A1
        D1=D1+  16                               * 7D6A5
        GOTO    ArryExt>Real.loop6               * 7D6A8
ArryExt>Real.L8:
        GOTO    LUPivot.L11                      * 7D6AC

* refs (4): 7D292 7D3EB 7D70A 7D7AE
SUB_7D6B0:
        A=DAT1  A                                * 7D6B0
        D1=D1+  5                                * 7D6B3
        D=D+1   A                                * 7D6B6

* refs (3): 7D4D1 7D5DE 7D82F
SAVPTR~jump_22:
        GOVLNG  SAVPTR                           * 7D6B8

* refs (2): 7D677 7D74A
SUB_7D6BF:
        ?ST=1   1                                * 7D6BF
        GOYES   SUB_7D6BF.L1                     * 7D6C2
        GOVLNG  PACK                             * 7D6C4
SUB_7D6BF.L1:
        GOVLNG  PACKq                            * 7D6CB

* refs (1): 36D85
VarAdd~1:
        CON(5)  (*)+5                            * 7D6D2  primitive code object
        ST=0    1                                * 7D6D7
        GOTO    OBJ_7D6DE.L1                     * 7D6DA

* refs (7): C8922 C89F5 C8AEC C8C01 C8D20 C9E5B ...
OBJ_7D6DE:
        CON(5)  (*)+5                            * 7D6DE  primitive code object
        ST=1    1                                * 7D6E3
OBJ_7D6DE.L1:
        GOSUB   SUB_7D70A                        * 7D6E6
        RSTK=C                                   * 7D6EA
OBJ_7D6DE.loop2:
        C=RSTK                                   * 7D6EC
        D0=C                                     * 7D6EE
        GOSBVL  GETAB0                           * 7D6F1
        CD0EX                                    * 7D6F8
        RSTK=C                                   * 7D6FB
        GOSUB   SUB_7D733                        * 7D6FD
        GONC    OBJ_7D6DE.loop2                  * 7D701
OBJ_7D6DE.L3:
        P=      0                                * 7D704
        GOTO    LUPivot.L11                      * 7D706

* refs (2): 7D6E6 7D778
SUB_7D70A:
        GOSUB   SUB_7D6B0                        * 7D70A
        D0=A                                     * 7D70E
        D0=D0+  15                               * 7D711
        D0=D0+  10                               * 7D714
        CD0EX                                    * 7D717
        A=DAT1  A                                * 7D71A

* refs (1): 7D7B2
SUB_7D71D:
        D1=A                                     * 7D71D
        D1=D1+  15                               * 7D720
        D1=D1+  5                                * 7D723
        A=DAT1  A                                * 7D726
        A=A-1   A                                * 7D729
        R4=A                                     * 7D72B
        D1=D1+  5                                * 7D72E
        RTN                                      * 7D731

* refs (2): 7D6FD 7D79E
SUB_7D733:
        ?B=0    W                                * 7D733
        GOYES   SUB_7D733.L1                     * 7D736
        C=DAT1  W                                * 7D738
        GOSBVL  SPLITC                           * 7D73C
        GOSBVL  RADDF                            * 7D743
        GOSUB   SUB_7D6BF                        * 7D74A
        DAT1=A  W                                * 7D74E
SUB_7D733.L1:
        D1=D1+  16                               * 7D752

* refs (1): 7D7E5
SUB_7D755:
        SETHEX                                   * 7D755
        A=R4                                     * 7D757
        A=A-1   A                                * 7D75A
        R4=A                                     * 7D75C
        RTN                                      * 7D75F

* refs (1): 0F74C
OBJ_7D761:
        CON(5)  (*)+5                            * 7D761  primitive code object
        ST=0    0                                * 7D766
        GOTO    OBJ_7D76D.L1                     * 7D769

* refs (1): 0F765
OBJ_7D76D:
        CON(5)  (*)+5                            * 7D76D  primitive code object
        ST=1    0                                * 7D772
OBJ_7D76D.L1:
        ST=0    1                                * 7D775
        GOSUB   SUB_7D70A                        * 7D778
        RSTK=C                                   * 7D77C
OBJ_7D76D.loop2:
        C=RSTK                                   * 7D77E
        D0=C                                     * 7D780
        A=DAT0  W                                * 7D783
        GOSBVL  SPLITA                           * 7D787
        D0=D0+  16                               * 7D78E
        CD0EX                                    * 7D791
        RSTK=C                                   * 7D794
        ?ST=0   0                                * 7D796
        GOYES   OBJ_7D76D.L3                     * 7D799
        A=-A-1  S                                * 7D79B
OBJ_7D76D.L3:
        GOSUB   SUB_7D733                        * 7D79E
        GONC    OBJ_7D76D.loop2                  * 7D7A2
        GOTO    OBJ_7D6DE.L3                     * 7D7A5

* refs (1): 36F6A
* arry -> %%: the largest absolute value among the elements
ArryMaxAbs:
        CON(5)  (*)+5                            * 7D7A9  primitive code object
        GOSUB   SUB_7D6B0                        * 7D7AE
        GOSUB   SUB_7D71D                        * 7D7B2
        A=0     W                                * 7D7B6
        R2=A                                     * 7D7B9
        R3=A                                     * 7D7BC
ArryMaxAbs.loop1:
        SETDEC                                   * 7D7BF
        GOSBVL  GETAB1                           * 7D7C1
        A=0     S                                * 7D7C8
        GOSBVL  RCCD2                            * 7D7CB
        P=      3                                * 7D7D2
        GOSBVL  TST15                            * 7D7D4
        GOC     ArryMaxAbs.L2                    * 7D7DB
        GOSBVL  STAB2                            * 7D7DE
ArryMaxAbs.L2:
        GOSUB   SUB_7D755                        * 7D7E5
        GONC    ArryMaxAbs.loop1                 * 7D7E9
        GOSBVL  RCAB2                            * 7D7EC
        P=      0                                * 7D7F3
        GOTO    OBJ_7D3CB.loop4                  * 7D7F5

* refs (6): 8832D 88352 951CB 95202 954CD 955CF
* arry -> arry flag: TRUE when a complex array has no imaginary part
CArry0Im?:
        CON(5)  (*)+5                            * 7D7F9  primitive code object
        C=DAT1  A                                * 7D7FE
        CD1EX                                    * 7D801
        D1=D1+  10                               * 7D804
        A=DAT1  A                                * 7D807
        D1=C                                     * 7D80A
        ST=1    1                                * 7D80D
        LC(5)   DOCMP                            * 7D810
        ?C=A    A                                * 7D817
        GOYES   CArry0Im?.L1                     * 7D81A
        ST=0    1                                * 7D81C
        LC(5)   DOECMP                           * 7D81F
        ?C=A    A                                * 7D826
        GOYES   CArry0Im?.L1                     * 7D829
        GOTO    CArry0Im?.L5                     * 7D82B
CArry0Im?.L1:
        GOSUB   SAVPTR~jump_22                   * 7D82F
        C=DAT1  A                                * 7D833
        D1=C                                     * 7D836
        D1=D1+  15                               * 7D839
        A=DAT1  B                                * 7D83C
        D1=D1+  5                                * 7D83F
        C=DAT1  A                                * 7D842
        D1=D1+  5                                * 7D845
        A=A-1   B                                * 7D848
        ?A=0    B                                * 7D84B
        GOYES   CArry0Im?.L2                     * 7D84E
        D=C     A                                * 7D850
        C=DAT1  A                                * 7D852
        GOSBVL  PUTCMPEL.L6                      * 7D855
        C=B     A                                * 7D85C
        D1=D1+  5                                * 7D85E
CArry0Im?.L2:
        C=C-1   A                                * 7D861
CArry0Im?.loop3:
        ?ST=1   1                                * 7D863
        GOYES   CArry0Im?.L4                     * 7D866
        D1=D1+  10                               * 7D868
CArry0Im?.L4:
        D1=D1+  16                               * 7D86B
        A=DAT1  W                                * 7D86E
        ?A#0    M                                * 7D872
        GOYES   CArry0Im?.L6                     * 7D875
        D1=D1+  16                               * 7D877
        C=C-1   A                                * 7D87A
        GONC    CArry0Im?.loop3                  * 7D87C
        GOSBVL  GETPTR                           * 7D87F
CArry0Im?.L5:
        GOVLNG  NOT.L3                           * 7D886
CArry0Im?.L6:
        GOSBVL  GETPTR                           * 7D88D
        GOVLNG  NOT.L2                           * 7D894

* refs (2): 373E0 373FE
* Level: D0 at a %%: round for storing into an array; overflow and underflow set the flags or give errors as the flags say
%%>%Chk:
        GOSBVL  GETAB0                           * 7D89B
        SETDEC                                   * 7D8A2
        P=      0                                * 7D8A4
        ?B#0    M                                * 7D8A6
        GOYES   %%>%Chk.L2                       * 7D8A9
%%>%Chk.loop1:
        A=0     W                                * 7D8AB
        B=0     W                                * 7D8AE
        RTN                                      * 7D8B1
%%>%Chk.L2:
        C=A     A                                * 7D8B3
        C=C+C   A                                * 7D8B5
        GOC     %%>%Chk.L4                       * 7D8B7
        LC(5)   #20000                           * 7D8BA
        ?C>A    A                                * 7D8C1
        RTNYES                                   * 7D8C4
        D0=(5)  #80848                           * 7D8C6
        A=DAT0  B                                * 7D8CD
        ?ABIT=0 0                                * 7D8D0
        GOYES   %%>%Chk.L3                       * 7D8D5
        LC(5)   ofloerr                          * 7D8D7  "Overflow"
        GONC    %%>%Chk.L5                       * 7D8DE
%%>%Chk.L3:
        D0=(5)  #80849                           * 7D8E1
        A=DAT0  B                                * 7D8E8
        ABIT=1  0                                * 7D8EB
        DAT0=A  B                                * 7D8F0
        LC(5)   #19999                           * 7D8F3
        A=C     A                                * 7D8FA
        B=0     W                                * 7D8FC
        B=-B-1  W                                * 7D8FF
        B=0     S                                * 7D902
        RTN                                      * 7D905
%%>%Chk.L4:
        LC(5)   CMOS                             * 7D907
        ?C<A    A                                * 7D90E
        RTNYES                                   * 7D911
        D0=(5)  #80847                           * 7D913
        A=DAT0  B                                * 7D91A
        ?ABIT=0 3                                * 7D91D
        GOYES   %%>%Chk.L6                       * 7D922
        LC(5)   posunferr                        * 7D924  "Positive Underflow"
        ?A=0    S                                * 7D92B
        GOYES   %%>%Chk.L5                       * 7D92E
        C=C+1   A                                * 7D930
%%>%Chk.L5:
        GOVLNG  GPErrjmpC                        * 7D932
%%>%Chk.L6:
        ?A#0    S                                * 7D939
        GOYES   %%>%Chk.L7                       * 7D93C
        D0=(5)  #80848                           * 7D93E
        A=DAT0  B                                * 7D945
        ABIT=1  3                                * 7D948
        GONC    %%>%Chk.L8                       * 7D94D
%%>%Chk.L7:
        D0=(5)  #80848                           * 7D950
        A=DAT0  B                                * 7D957
        ABIT=1  2                                * 7D95A
%%>%Chk.L8:
        DAT0=A  B                                * 7D95F
        GOTO    %%>%Chk.loop1                    * 7D962
        RPL

* refs (2): 3FB88 992A5
* { N I%YR PV PMT FV }, the variables of the TVM solver
TvmVars:
        {                                        * 7D966

* refs (6): 3C3AA 9910B B4E3F B4E64 B5084 B50A4
N:
          ID N                                   * 7D96B

* refs (7): 3C3AF 99075 9911B B4EA1 B4EC6 B50B8 ...
I%YR:
          ID I%YR                                * 7D974

* refs (7): 3C3B4 99085 9912B B4EE0 B4F05 B50EC ...
PV:
          ID PV                                  * 7D983

* refs (7): 3C3B9 99095 9913B B4F1F B4F44 B5120 ...
PMT:
          ID PMT                                 * 7D98E

* refs (6): 3C3BE 9914B B4F5E B4F83 B5154 B5174
FV:
          ID FV }                                * 7D99B

* refs (9): 990AA 9915B 991F2 99234 B4F9D B5012 ...
PYR:
        ID PYR                                   * 7D9AB
        ASSEMBLE

* refs (6): 99347 995BC 9971C 99D35 99DD2 99E84
* Seven values on the stack -> the 15-digit temporaries: N I%YR PV PMT FV PYR and the payment-at-beginning flag. ST 8 set when that flag is not zero
TvmArgs:
        LC(5)   #00007                           * 7D9B8
        A=C     A                                * 7D9BF
        A=A+A   A                                * 7D9C1
        A=A+A   A                                * 7D9C3
        A=A+C   A                                * 7D9C5
        CD1EX                                    * 7D9C7
        C=C+A   A                                * 7D9CA
        CD1EX                                    * 7D9CC
        D=D+C   A                                * 7D9CF
        GOSBVL  SAVPTR                           * 7D9D1
        D0=(5)  IRAMBUFF                         * 7D9D8
        LC(5)   #00006                           * 7D9DF
        D=C     A                                * 7D9E6
        SETDEC                                   * 7D9E8
TvmArgs.loop1:
        D1=D1-  5                                * 7D9EA
        C=DAT1  A                                * 7D9ED
        CD1EX                                    * 7D9F0
        D1=D1+  5                                * 7D9F3
        A=DAT1  W                                * 7D9F6
        D1=C                                     * 7D9FA
        GOSBVL  SPLITA                           * 7D9FD
        GOSBVL  PUTAB0                           * 7DA04
        D=D-1   A                                * 7DA0B
        GONC    TvmArgs.loop1                    * 7DA0D
        ST=0    8                                * 7DA10
        ?B=0    M                                * 7DA13
        RTNYES                                   * 7DA16
        ST=1    8                                * 7DA18
        RTN                                      * 7DA1B

* refs (3): 99D5B 99DF8 99EAA
* -> A/B = i, C/D = temporary 0, N
TvmI%:
        GOSUB   TvmI                             * 7DA1D
        RTNC                                     * 7DA21
        GOVLNG  RCLCDtmp0%%                      * 7DA24

* refs (5): 7DA1D 993F5 99605 99A83 99AB5
* -> A/B = i = I%YR/PYR/100, PYR checked; error #E603 when i is -1 or below
TvmI:
        GOSBVL  RCLtmp1%%                        * 7DA2B
        GOSBVL  RCLCDtmp5%%                      * 7DA32
        GOSUB   TvmCheckPyr                      * 7DA39
        RTNC                                     * 7DA3D
        ?B=0    P                                * 7DA40
        GOYES   TvmI.L1                          * 7DA43
        GOSBVL  DIVF                             * 7DA45
TvmI.L1:
        P=      14                               * 7DA4C
        ?B#0    P                                * 7DA4E
        GOYES   TvmI.L2                          * 7DA51
        RTN                                      * 7DA53
TvmI.L2:
        A=A-1   A                                * 7DA55
        A=A-1   A                                * 7DA57
        ?A#0    S                                * 7DA59
        GOYES   TvmI.L3                          * 7DA5C
        RTN                                      * 7DA5E
TvmI.L3:
        P=      4                                * 7DA60
        ?A=0    P                                * 7DA62
        GOYES   TvmI.L4                          * 7DA65
        RTN                                      * 7DA67
TvmI.L4:
        P=      0                                * 7DA69
        LC(5)   #0E603                           * 7DA6B
        RTNSC                                    * 7DA72

* refs (2): 7DA39 99750
* C/D = PYR: error #E605 unless it is positive
TvmCheckPyr:
        ?C#0    S                                * 7DA74
        GOYES   TvmCheckPyr.L1                   * 7DA77
        P=      14                               * 7DA79
        ?D=0    P                                * 7DA7B
        GOYES   TvmCheckPyr.L1                   * 7DA7E
        RTNCC                                    * 7DA80
TvmCheckPyr.L1:
        P=      0                                * 7DA82
        LC(5)   #0E605                           * 7DA84
        RTNSC                                    * 7DA8B

* refs (1): 99861
* y^x, with errors for overflow and underflow as a TVM error code
TvmPow:
        GOSBVL  Pow15                            * 7DA8D
        RTNNC                                    * 7DA94
TvmPow.L1:
        ?ST=1   10                               * 7DA97
        GOYES   TVMSolveI~1.L1                   * 7DA9A
TVMSolveI~1:
        P=      0                                * 7DA9C
        LC(5)   ofloerr                          * 7DA9E  "Overflow"
        RTNSC                                    * 7DAA5
TVMSolveI~1.L1:
        P=      0                                * 7DAA7
        LC(5)   posunferr                        * 7DAA9  "Positive Underflow"
        ?A=0    S                                * 7DAB0
        RTNYES                                   * 7DAB3
        LC(5)   negunferr                        * 7DAB5  "Negative Underflow"
        RTNSC                                    * 7DABC

* refs (3): 99616 99DA0 99EEF
* A/B = i -> (1+i) * PMT in begin mode, PMT otherwise
TvmBegin:
        GOSBVL  RADD1                            * 7DABE
        GOSBVL  RCLCDtmp3%%                      * 7DAC5
        GOSBVL  XYEX                             * 7DACC
        ?ST=0   8                                * 7DAD3
        RTNYES                                   * 7DAD6
        GOVLNG  MULTF                            * 7DAD8

* refs (2): 99D6C 99E09
SUB_7DADF:
        C=-C-1  S                                * 7DADF

* refs (3): 998AB 998FA 99EBB
* A/B = i, C/D = n -> (1+i)^n by LNP115 and EXPM115, sparing the rounding at small i; n = 0 handled at the head
TvmGrowth:
        P=      14                               * 7DAE2
        ?B#0    P                                * 7DAE4
        GOYES   TvmGrowth.L1                     * 7DAE7
        GOSBVL  XYEX                             * 7DAE9
        C=0     W                                * 7DAF0
        D=0     W                                * 7DAF3
        D=D+1   P                                * 7DAF6
        GOSBVL  STCD0                            * 7DAF9
        RTNCC                                    * 7DB00
TvmGrowth.L1:
        GOSBVL  STAB2                            * 7DB02
        R1=C                                     * 7DB09
        C=D     W                                * 7DB0C
        R4=C                                     * 7DB0F
        GOSBVL  LNP115                           * 7DB12
        C=R4                                     * 7DB19
        D=C     W                                * 7DB1C
        C=R1                                     * 7DB1F
        GOSBVL  MULTF                            * 7DB22
        GOSBVL  EXPM115                          * 7DB29
        GONC    TvmGrowth.L2                     * 7DB30
        GOTO    TvmPow.L1                        * 7DB33
TvmGrowth.L2:
        GOSBVL  EXAB0                            * 7DB37
        GOSBVL  RCCD2                            * 7DB3E
        GOSBVL  DIVF                             * 7DB45
        RTNCC                                    * 7DB4C
TvmGrowth.L3:
        ?XM=0                                    * 7DB4E
        GOYES   TvmGrowth.L4                     * 7DB51
        XM=0                                     * 7DB53
        ?P=     3                                * 7DB56
        GOYES   TvmGrowth.L5                     * 7DB59
        P=      0                                * 7DB5B
        LC(5)   #00203                           * 7DB5D
        RTNSC                                    * 7DB64
TvmGrowth.L4:
        RTNCC                                    * 7DB66
TvmGrowth.L5:
        P=      0                                * 7DB68
        LC(5)   infreserr                        * 7DB6A  "Infinite Result"
        RTNSC                                    * 7DB71

* refs (3): 9964E 996AA 99E73
* DIVF with the TVM error #E601 or #E602 on a zero divide
TvmDiv:
        XM=0                                     * 7DB73
        GOSBVL  DIVF                             * 7DB76
        ?XM=0                                    * 7DB7D
        GOYES   TvmGrowth.L4                     * 7DB80
        XM=0                                     * 7DB82
        ?P=     3                                * 7DB85
        GOYES   TVMSolveI~2.L1                   * 7DB88
TVMSolveI~2:
        P=      0                                * 7DB8A
        LC(5)   #0E602                           * 7DB8C
        RTNSC                                    * 7DB93
TVMSolveI~2.L1:
        P=      0                                * 7DB95
        LC(5)   #0E601                           * 7DB97
        RTNSC                                    * 7DB9E
        RPL

* refs (1): 1A495
nWHEREIFTE:
        XLIB nWHEREIFTE~1                        * 7DBA0

* refs (1): 1F03A
nWHEREDER:
        XLIB nWHEREDER~1                         * 7DBAB

* refs (1): 1F26C
nWHEREINTG:
        XLIB nWHEREINTG~1                        * 7DBB6

* refs (1): 1F33F
nWHERESUM:
        XLIB nWHERESUM~1                         * 7DBC1

* refs (1): 1F42A
nWHEREWHERE:
        XLIB nWHEREWHERE~1                       * 7DBCC

nWHEREFCNAPP:
        XLIB nWHEREFCNAPP~1                      * 7DBD7

* refs (1): 1AEED
D/D*:
        XLIB D/D*~1                              * 7DBE2

* refs (1): 1AC84
D/D+:
        XLIB D/D+~1                              * 7DBED

* refs (1): 1ADD6
D/D-:
        XLIB D/D-~1                              * 7DBF8

* refs (1): 1AFE6
D/D/:
        XLIB D/D/~1                              * 7DC03

* refs (2): 85FFC 86056
derquot:
        :: psh dup MetaDER addt* pshtop&         * 7DC0E
          { %2 x^ x/ } INNERCOMP 2top& ;         * 7DC2C

* refs (4): 85EDF 85EFD 86024 86047
derprod1:
        :: psh MetaDER pshtop& addt* ;           * 7DC54

* refs (1): 1A97D
D/D=:
        XLIB D/D=~1                              * 7DC72

* refs (1): 1AA60
D/DABS:
        XLIB D/DABS~1                            * 7DC7D

* refs (1): 860B5
easyabs:
        :: DROP Cr xSIGN ;                       * 7DC88

* refs (1): 1B75C
D/DACOS:
        XLIB D/DACOS~1                           * 7DCA1

* refs (1): 1B85D
D/DACOSH:
        XLIB D/DACOSH~1                          * 7DCAC

* refs (1): 1BA6A
D/DALOG:
        XLIB D/DALOG~1                           * 7DCB7

* refs (1): 1B308
D/DARG:
        XLIB D/DARG~1                            * 7DCC2

* refs (1): 1B6D1
D/DASIN:
        XLIB D/DASIN~1                           * 7DCCD

* refs (1): 1B818
D/DASINH:
        XLIB D/DASINH~1                          * 7DCD8

* refs (1): 1B7C9
D/DATAN:
        XLIB D/DATAN~1                           * 7DCE3

* refs (1): 1B8CF
D/DATANH:
        XLIB D/DATANH~1                          * 7DCEE

* refs (1): 1AA07
D/DCHS:
        :: BindDv derargABND Cr xNEG ;           * 7DCF9

* refs (1): 1AAA5
D/DCONJ:
        :: BindDv derargABND Cr xCONJ ;          * 7DD17

* refs (1): 1B53C
D/DCOS:
        XLIB D/DCOS~1                            * 7DD35

* refs (1): 1B633
D/DCOSH:
        XLIB D/DCOSH~1                           * 7DD40

* refs (2): 1B932 1BAE5
D/DEXP:
        XLIB D/DEXP~1                            * 7DD4B

* refs (1): 1B2B9
D/DINV:
        XLIB D/DINV~1                            * 7DD56

* refs (1): 1B97C
D/DLN:
        XLIB D/DLN~1                             * 7DD61

* refs (1): 1BAAF
D/DLNP1:
        XLIB D/DLNP1~1                           * 7DD6C

* refs (1): 1B9F3
D/DLOG:
        XLIB D/DLOG~1                            * 7DD77

D/DIFTE:
        XLIB D/DIFTE~1                           * 7DD82

* refs (1): 1B4E3
D/DSIN:
        XLIB D/DSIN~1                            * 7DD8D

* refs (1): 1B5E4
D/DSINH:
        XLIB D/DSINH~1                           * 7DD98

* refs (1): 1B467
D/DSQ:
        XLIB D/DSQ~1                             * 7DDA3

* refs (1): 1B3B5
D/DSQRT:
        XLIB D/DSQRT~1                           * 7DDAE

* refs (1): 1B595
D/DTAN:
        XLIB D/DTAN~1                            * 7DDB9

* refs (1): 1B682
D/DTANH:
        XLIB D/DTANH~1                           * 7DDC4

* refs (1): 1B0D2
D/D^:
        XLIB D/D^~1                              * 7DDCF

* refs (2): 8672C 8674A
D/D^X:
        XLIB D/D^X~1                             * 7DDDA

* refs (2): 8670E 86754
D/D^Y:
        XLIB D/D^Y~1                             * 7DDE5

D/DDER:
        XLIB D/DDER~1                            * 7DDF0

* refs (1): 1F420
D/DWHERE:
        XLIB D/DWHERE~1                          * 7DDFB

D/DINTEGRAL:
        XLIB D/DINTEGRAL~1                       * 7DE06

D/DSUM:
        XLIB D/DSUM~1                            * 7DE11

* refs (1): 1F5EC
D/DAPPLY:
        XLIB D/DAPPLY~1                          * 7DE1C

* refs (1): 1B2C8
nINTGINV:
        XLIB nINTGINV~1                          * 7DE27

* refs (1): 1B361
nINTGSIGN:
        XLIB nINTGSIGN~1                         * 7DE32

* refs (1): 1B3BF
nINTGSQRT:
        XLIB nINTGSQRT~1                         * 7DE3D

* refs (1): 1B471
nINTGSQ:
        XLIB nINTGSQ~1                           * 7DE48

* refs (1): 1B4F2
nINTGSIN:
        XLIB nINTGSIN~1                          * 7DE53

* refs (1): 1B54B
nINTGCOS:
        XLIB nINTGCOS~1                          * 7DE5E

* refs (1): 1B5A4
nINTGTAN:
        XLIB nINTGTAN~1                          * 7DE69

* refs (1): 1B5F3
nINTGSINH:
        XLIB nINTGSINH~1                         * 7DE74

* refs (1): 1B642
nINTGCOSH:
        XLIB nINTGCOSH~1                         * 7DE7F

* refs (1): 1B691
nINTGTANH:
        XLIB nINTGTANH~1                         * 7DE8A

* refs (1): 1B6E0
nINTGASIN:
        XLIB nINTGASIN~1                         * 7DE95

* refs (1): 1B76B
nINTGACOS:
        XLIB nINTGACOS~1                         * 7DEA0

* refs (1): 1B7D8
nINTGATAN:
        XLIB nINTGATAN~1                         * 7DEAB

* refs (1): 1B98B
nINTGLN:
        XLIB nINTGLN~1                           * 7DEB6

* refs (1): 1BA02
nINTGLOG:
        XLIB nINTGLOG~1                          * 7DEC1

* refs (1): 1BA79
nINTGALOG:
        XLIB nINTGALOG~1                         * 7DECC

* refs (1): 1BAEF
nINTGEXPM:
        XLIB nINTGEXPM~1                         * 7DED7

* ->
* refs (1): 211CB
nCustomMenu:
        XLIB MnuCST                              * 7DEE2

* refs (1): 1F533
nCOLCTQUOTE:
        XLIB nCOLCTQUOTE~1                       * 7DEED

* refs (1): 56E8C
SPLITWHERE:
        XLIB SPLITWHERE~1                        * 7DEF8

* refs (2): 1AC8E 1ADE0
MANMENU+-:
        XLIB MANMENU+-~1                         * 7DF03

* refs (2): 1AEF7 1AFF0
MANMENU*/:
        XLIB MANMENU*/~1                         * 7DF0E

* refs (1): 1B0DC
MANMENU^:
        XLIB MANMENU^~1                          * 7DF19

* refs (2): 1B93C 1BA74
MANMENUEXP:
        XLIB MANMENUEXP~1                        * 7DF24

* refs (2): 1B986 1B9FD
MANMENULN:
        XLIB MANMENULN~1                         * 7DF2F

* refs (2): 1AA11 1B2C3
MANMENUCSIV:
        XLIB MANMENUCSIV~1                       * 7DF3A

* refs (1): 1A987
MANMENUEQ:
        XLIB MANMENUEQ~1                         * 7DF45

* refs (3): 1AAAF 1C80B 1C850
MANMENUCX:
        XLIB MANMENUCX~1                         * 7DF50

* refs (6): 1B4ED 1B546 1B59F 1B5EE 1B63D 1B68C
MANMENUTRG:
        XLIB MANMENUTRG~1                        * 7DF5B

* refs (6): 1B6DB 1B766 1B7D3 1B822 1B867 1B8D9
MANMENUATG:
        XLIB MANMENUATG~1                        * 7DF66

* refs (13): 48DA1 73135 73149 7315D 73176 7318F ...
PTYPE>PINFO:
        XLIB PTYPE>PINFO~1                       * 7DF71

MOVEVAR:
        XLIB MoveVars                            * 7DF7C

COPYVAR:
        XLIB CopyVars                            * 7DF87

* refs (1): 5FAC2
EXPR>~1~romptr:
        XLIB EXPR>~1~romptr~1                    * 7DF92
        ASSEMBLE
EXPR>~1~romptr.L1:
        C=DAT0  B                                * 7DF9D
        C=C+C   X                                * 7DFA0
        C=0     B                                * 7DFA3
        CSRB.F  X                                * 7DFA6
        D0=(4)  #06C6                            * 7DFAB
        DAT0=C  B                                * 7DFB1
        RTN                                      * 7DFB4

* refs (1): 01CBA
SUB_7DFB6:
        DAT0=A  X                                * 7DFB6
        D1=(2)  #00                              * 7DFBA
        A=DAT1  1                                * 7DFBE
        LC(1)   #8                               * 7DFC2
        A=A&C   P                                * 7DFC5
        DAT1=A  1                                * 7DFC9
        RTN                                      * 7DFCD
SUB_7DFB6.L1:
        C=0     S                                * 7DFCF
        D0=(5)  INITEN                           * 7DFD2
        DAT0=C  S                                * 7DFD9
        GOVLNG  CountPortLibs                    * 7DFDD
SUB_7DFB6.L2:
        P=      0                                * 7DFE4
        GOSUB   SUB_7DFF6                        * 7DFE6
        C=0     A                                * 7DFEA
        DAT1=C  A                                * 7DFEC
        GOVLNG  sto12(bk,nm,s)~1.L8              * 7DFEF

* refs (1): 7DFE6
SUB_7DFF6:
        PC=C                                     * 7DFF6
        BSS     5                                * 7DFFA  zeros

EndFreeROM:
        RTNSXM                                   * 7DFFF
