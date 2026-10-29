* HP 48GX ROM revision R, #7C855-#7E000: not yet identified
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: PTYPE>PINFO PYR PV PMT I%YR N MANMENUTRG MANMENUATG FV derprod1 MANMENUCX derquot
* Follows on from the previous file (at #7C855 in the original ROM).

* refs (9): 7CFF4 7D076 90697 94BD5 94F5F 9814B ...
OBJ_7C855:
        CON(5)  (*)+5                            * 7C855  primitive code object
        ST=0    0                                * 7C85A
        GOTO    L_7C869                          * 7C85D

* refs (11): 7D170 7D233 907A0 924D9 9256F 926FF ...
OBJ_7C861:
        CON(5)  (*)+5                            * 7C861  primitive code object
        ST=1    0                                * 7C866
L_7C869:
        GOSUB   SUB_7C9FA                        * 7C869
        D1=D1+  5                                * 7C86D
        A=A-1   A                                * 7C870
        GOSUB   SUB_7CC71                        * 7C872
        ST=0    1                                * 7C876
        LC(5)   DOEREL                           * 7C879
        ?D=C    A                                * 7C880
        GOYES   L_7C88A                          * 7C883
        ST=1    1                                * 7C885
        A=A+A   A                                * 7C888
L_7C88A:
        GOSUB   SUB_7CA36                        * 7C88A
        RSTK=C                                   * 7C88E
        CD0EX                                    * 7C890
        C=C+A   A                                * 7C893
        RSTK=C                                   * 7C895
        GOSUB   SUB_7CA87                        * 7C897
        ?ST=1   2                                * 7C89B
        GOYES   L_7C8E8                          * 7C89E
        ?ST=0   1                                * 7C8A0
        GOYES   L_7C8C8                          * 7C8A3
        GOTO    L_7C9F3                          * 7C8A5
L_7C8A9:
        C=RSTK                                   * 7C8A9
        D0=C                                     * 7C8AB
        A=C     A                                * 7C8AE
        C=RSTK                                   * 7C8B0
        RSTK=C                                   * 7C8B2
        C=C+A   A                                * 7C8B4
        RSTK=C                                   * 7C8B6
        GOSUB   SUB_7CC6A                        * 7C8B8
        GOSUB   SUB_7CC56                        * 7C8BC
        SETHEX                                   * 7C8C0
        D1=D1+  5                                * 7C8C2
        D1=D1+  16                               * 7C8C5
L_7C8C8:
        GOSUB   SUB_7C8CF                        * 7C8C8
        GONC    L_7C8A9                          * 7C8CC

* refs (3): 7C8C8 7CB2A 7CCFE
SUB_7C8CF:
        C=R4                                     * 7C8CF
        C=C-1   A                                * 7C8D2
        R4=C                                     * 7C8D4
        RTNNC                                    * 7C8D7
L_7C8DA:
        GOSBVL  RCAB0                            * 7C8DA
        GOVLNG  L_2A235                          * 7C8E1
L_7C8E8:
        ?ST=1   1                                * 7C8E8
        GOYES   L_7C8F1                          * 7C8EB
        GOTO    L_7C9BA                          * 7C8ED
L_7C8F1:
        GOTO    L_7C95A                          * 7C8F1
L_7C8F5:
        GOSUB   SUB_7CC6A                        * 7C8F5
        C=RSTK                                   * 7C8F9
        RSTK=C                                   * 7C8FB
        D0=C                                     * 7C8FD
        GOSUB   SUB_7CC56                        * 7C900
        GOSUB   SUB_7CC64                        * 7C904
        A=-A-1  S                                * 7C908
        C=RSTK                                   * 7C90B
        RSTK=C                                   * 7C90D
        D0=C                                     * 7C90F
        D0=D0+  5                                * 7C912
        D0=D0+  16                               * 7C915
        GOSUB   SUB_7CC56                        * 7C918
        D1=D1-  5                                * 7C91C
        D1=D1-  16                               * 7C91F
        GOSUB   SUB_7CC6A                        * 7C922
        C=RSTK                                   * 7C926
        RSTK=C                                   * 7C928
        D0=C                                     * 7C92A
        D0=D0+  5                                * 7C92D
        D0=D0+  16                               * 7C930
        GOSUB   SUB_7CC5D                        * 7C933
        GOSUB   SUB_7CC64                        * 7C937
        C=RSTK                                   * 7C93B
        RSTK=C                                   * 7C93D
        D0=C                                     * 7C93F
        GOSUB   SUB_7CC5D                        * 7C942
        D1=D1+  5                                * 7C946
        D1=D1+  16                               * 7C949
        SETHEX                                   * 7C94C
        C=RSTK                                   * 7C94E
        A=C     A                                * 7C950
        C=RSTK                                   * 7C952
        RSTK=C                                   * 7C954
        C=C+A   A                                * 7C956
        RSTK=C                                   * 7C958
L_7C95A:
        GOSUB   SUB_7C962                        * 7C95A
        GOTO    L_7C8F5                          * 7C95E

* refs (7): 7C95A 7C9BA 7C9F3 7CBB5 7CC01 7CC4F ...
SUB_7C962:
        C=R4                                     * 7C962
        C=C-1   A                                * 7C965
        R4=C                                     * 7C967
        RTNNC                                    * 7C96A
L_7C96D:
        GOSBVL  RCAB0                            * 7C96D
        GOSBVL  RCCD2                            * 7C974
        GOVLNG  L_51BA2                          * 7C97B
L_7C982:
        GOSUB   SUB_7CC6A                        * 7C982
        C=RSTK                                   * 7C986
        RSTK=C                                   * 7C988
        D0=C                                     * 7C98A
        GOSUB   SUB_7CC56                        * 7C98D
        GOSUB   SUB_7CC6A                        * 7C991
        C=RSTK                                   * 7C995
        RSTK=C                                   * 7C997
        D0=C                                     * 7C999
        D0=D0+  5                                * 7C99C
        D0=D0+  16                               * 7C99F
        GOSUB   SUB_7CC5D                        * 7C9A2
        D1=D1+  5                                * 7C9A6
        D1=D1+  16                               * 7C9A9
        SETHEX                                   * 7C9AC
        C=RSTK                                   * 7C9AE
        A=C     A                                * 7C9B0
        C=RSTK                                   * 7C9B2
        RSTK=C                                   * 7C9B4
        C=C+A   A                                * 7C9B6
        RSTK=C                                   * 7C9B8
L_7C9BA:
        GOSUB   SUB_7C962                        * 7C9BA
        GONC    L_7C982                          * 7C9BE
L_7C9C1:
        GOSUB   SUB_7CC6A                        * 7C9C1
        C=RSTK                                   * 7C9C5
        RSTK=C                                   * 7C9C7
        D0=C                                     * 7C9C9
        GOSUB   SUB_7CC56                        * 7C9CC
        GOSUB   SUB_7CC64                        * 7C9D0
        C=RSTK                                   * 7C9D4
        RSTK=C                                   * 7C9D6
        D0=C                                     * 7C9D8
        GOSUB   SUB_7CC5D                        * 7C9DB
        D1=D1+  5                                * 7C9DF
        D1=D1+  16                               * 7C9E2
        SETHEX                                   * 7C9E5
        C=RSTK                                   * 7C9E7
        A=C     A                                * 7C9E9
        C=RSTK                                   * 7C9EB
        RSTK=C                                   * 7C9ED
        C=C+A   A                                * 7C9EF
        RSTK=C                                   * 7C9F1
L_7C9F3:
        GOSUB   SUB_7C962                        * 7C9F3
        GONC    L_7C9C1                          * 7C9F7

* refs (3): 7C869 7CAAC 7CC87
SUB_7C9FA:
        GOSBVL  POP2#                            * 7C9FA
        R4=C                                     * 7CA01
        R0=A                                     * 7CA04
        GOSBVL  POP#                             * 7CA07
        GOSBVL  SAVPTR                           * 7CA0E
        C=DAT1  A                                * 7CA15
        D0=C                                     * 7CA18
        ?ST=0   0                                * 7CA1B
        GOYES   L_7CA26                          * 7CA1E
        D1=D1+  5                                * 7CA20
        C=DAT1  A                                * 7CA23
L_7CA26:
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
        GOYES   L_7CA60                          * 7CA56
        C=DAT0  A                                * 7CA58
        B=C     A                                * 7CA5B
        D0=D0+  5                                * 7CA5D
L_7CA60:
        A=R0                                     * 7CA60
        A=A-1   A                                * 7CA63
        GOSUB   SUB_7CC71                        * 7CA65
        GOSUB   SUB_7CC78                        * 7CA69
        ST=0    2                                * 7CA6D
        LC(5)   DOEREL                           * 7CA70
        ?D=C    A                                * 7CA77
        GOYES   L_7CA83                          * 7CA7A
        ST=1    2                                * 7CA7C
        A=A+A   A                                * 7CA7F
        B=B+B   A                                * 7CA81
L_7CA83:
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
OBJ_7CA98:
        CON(5)  (*)+5                            * 7CA98  primitive code object
        ST=0    0                                * 7CA9D
        GOTO    L_7CAAC                          * 7CAA0

* refs (3): 941CD 9842F 984C0
OBJ_7CAA4:
        CON(5)  (*)+5                            * 7CAA4  primitive code object
        ST=1    0                                * 7CAA9
L_7CAAC:
        GOSUB   SUB_7C9FA                        * 7CAAC
        C=DAT1  A                                * 7CAB0
        B=C     A                                * 7CAB3
        D1=D1+  5                                * 7CAB5
        A=A-1   A                                * 7CAB8
        GOSUB   SUB_7CC71                        * 7CABA
        GOSUB   SUB_7CC78                        * 7CABE
        ST=0    1                                * 7CAC2
        LC(5)   DOEREL                           * 7CAC5
        ?D=C    A                                * 7CACC
        GOYES   L_7CAD8                          * 7CACF
        ST=1    1                                * 7CAD1
        A=A+A   A                                * 7CAD4
        B=B+B   A                                * 7CAD6
L_7CAD8:
        C=B     A                                * 7CAD8
        RSTK=C                                   * 7CADA
        GOSUB   SUB_7CA36                        * 7CADC
        RSTK=C                                   * 7CAE0
        CD0EX                                    * 7CAE2
        C=C+A   A                                * 7CAE5
        RSTK=C                                   * 7CAE7
        GOSUB   SUB_7CA87                        * 7CAE9
        ?ST=1   2                                * 7CAED
        GOYES   L_7CB31                          * 7CAF0
        ?ST=0   1                                * 7CAF2
        GOYES   L_7CB2A                          * 7CAF5
        GOTO    L_7CC4F                          * 7CAF7
L_7CAFB:
        GOSUB   SUB_7CC6A                        * 7CAFB
        C=RSTK                                   * 7CAFF
        RSTK=C                                   * 7CB01
        D0=C                                     * 7CB03
        GOSUB   SUB_7CC56                        * 7CB06
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
L_7CB2A:
        GOSUB   SUB_7C8CF                        * 7CB2A
        GONC    L_7CAFB                          * 7CB2E
L_7CB31:
        ?ST=1   1                                * 7CB31
        GOYES   L_7CB3A                          * 7CB34
        GOTO    L_7CC01                          * 7CB36
L_7CB3A:
        GOTO    L_7CBB5                          * 7CB3A
L_7CB3E:
        GOSUB   SUB_7CC6A                        * 7CB3E
        C=RSTK                                   * 7CB42
        RSTK=C                                   * 7CB44
        D0=C                                     * 7CB46
        GOSUB   SUB_7CC56                        * 7CB49
        GOSUB   SUB_7CC64                        * 7CB4D
        C=RSTK                                   * 7CB51
        RSTK=C                                   * 7CB53
        D0=C                                     * 7CB55
        D0=D0+  5                                * 7CB58
        D0=D0+  16                               * 7CB5B
        GOSUB   SUB_7CC56                        * 7CB5E
        D1=D1-  5                                * 7CB62
        D1=D1-  16                               * 7CB65
        GOSUB   SUB_7CC6A                        * 7CB68
        C=RSTK                                   * 7CB6C
        RSTK=C                                   * 7CB6E
        D0=C                                     * 7CB70
        D0=D0+  5                                * 7CB73
        D0=D0+  16                               * 7CB76
        GOSUB   SUB_7CC5D                        * 7CB79
        GOSUB   SUB_7CC64                        * 7CB7D
        A=-A-1  S                                * 7CB81
        D1=D1-  5                                * 7CB84
        D1=D1-  16                               * 7CB87
        C=RSTK                                   * 7CB8A
        RSTK=C                                   * 7CB8C
        D0=C                                     * 7CB8E
        GOSUB   SUB_7CC5D                        * 7CB91
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
L_7CBB5:
        GOSUB   SUB_7C962                        * 7CBB5
        GOTO    L_7CB3E                          * 7CBB9
L_7CBBD:
        GOSUB   SUB_7CC6A                        * 7CBBD
        C=RSTK                                   * 7CBC1
        RSTK=C                                   * 7CBC3
        D0=C                                     * 7CBC5
        GOSUB   SUB_7CC56                        * 7CBC8
        GOSUB   SUB_7CC6A                        * 7CBCC
        C=RSTK                                   * 7CBD0
        RSTK=C                                   * 7CBD2
        D0=C                                     * 7CBD4
        D0=D0+  5                                * 7CBD7
        D0=D0+  16                               * 7CBDA
        GOSUB   SUB_7CC5D                        * 7CBDD
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
L_7CC01:
        GOSUB   SUB_7C962                        * 7CC01
        GONC    L_7CBBD                          * 7CC05
L_7CC08:
        GOSUB   SUB_7CC6A                        * 7CC08
        C=RSTK                                   * 7CC0C
        RSTK=C                                   * 7CC0E
        D0=C                                     * 7CC10
        GOSUB   SUB_7CC56                        * 7CC13
        GOSUB   SUB_7CC64                        * 7CC17
        A=-A-1  S                                * 7CC1B
        D1=D1-  5                                * 7CC1E
        D1=D1-  16                               * 7CC21
        C=RSTK                                   * 7CC24
        RSTK=C                                   * 7CC26
        D0=C                                     * 7CC28
        GOSUB   SUB_7CC5D                        * 7CC2B
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
L_7CC4F:
        GOSUB   SUB_7C962                        * 7CC4F
        GONC    L_7CC08                          * 7CC53

* refs (13): 7C8BC 7C900 7C918 7C98D 7C9CC 7CB06 ...
SUB_7CC56:
        GOVLNG  L_35A82                          * 7CC56

* refs (10): 7C933 7C942 7C9A2 7C9DB 7CB79 7CB91 ...
SUB_7CC5D:
        GOVLNG  L_35A95                          * 7CC5D

* refs (8): 7C904 7C937 7C9D0 7CB4D 7CB7D 7CC17 ...
SUB_7CC64:
        D1=D1+  5                                * 7CC64
        D1=D1+  16                               * 7CC67

* refs (15): 7C8B8 7C8F5 7C922 7C982 7C991 7C9C1 ...
SUB_7CC6A:
        GOVLNG  L_35AA8                          * 7CC6A

* refs (4): 7C872 7CA65 7CABA 7CC96
SUB_7CC71:
        GOVLNG  SUB_3768C                        * 7CC71

* refs (3): 7CA69 7CABE 7CCA1
SUB_7CC78:
        GOVLNG  SUB_3767E                        * 7CC78

* refs (4): 943B7 944ED 95A95 95CAC
OBJ_7CC7F:
        CON(5)  (*)+5                            * 7CC7F  primitive code object
        ST=0    0                                * 7CC84
        GOSUB   SUB_7C9FA                        * 7CC87
        D1=D1+  5                                * 7CC8B
        D0=D0+  15                               * 7CC8E
        D0=D0+  15                               * 7CC91
        A=A-1   A                                * 7CC94
        GOSUB   SUB_7CC71                        * 7CC96
        C=R0                                     * 7CC9A
        B=C     A                                * 7CC9D
        B=B-1   A                                * 7CC9F
        GOSUB   SUB_7CC78                        * 7CCA1
        ST=0    1                                * 7CCA5
        LC(5)   DOEREL                           * 7CCA8
        ?D=C    A                                * 7CCAF
        GOYES   L_7CCBB                          * 7CCB2
        ST=1    1                                * 7CCB4
        A=A+A   A                                * 7CCB7
        B=B+B   A                                * 7CCB9
L_7CCBB:
        CD1EX                                    * 7CCBB
        C=C+A   A                                * 7CCBE
        D1=C                                     * 7CCC0
        CD0EX                                    * 7CCC3
        C=C+B   A                                * 7CCC6
        RSTK=C                                   * 7CCC8
        GOSUB   SUB_7CA87                        * 7CCCA
        ?ST=0   1                                * 7CCCE
        GOYES   L_7CCFE                          * 7CCD1
        GOTO    L_7CD71                          * 7CCD3
L_7CCD7:
        GOSUB   SUB_7CC6A                        * 7CCD7
        C=RSTK                                   * 7CCDB
        RSTK=C                                   * 7CCDD
        D0=C                                     * 7CCDF
        GOSUB   SUB_7CC56                        * 7CCE2
        D1=D1+  16                               * 7CCE6
        D1=D1+  5                                * 7CCE9
        C=RSTK                                   * 7CCEC
        D0=C                                     * 7CCEE
        D0=D0+  16                               * 7CCF1
        D0=D0+  5                                * 7CCF4
        CD0EX                                    * 7CCF7
        RSTK=C                                   * 7CCFA
        SETHEX                                   * 7CCFC
L_7CCFE:
        GOSUB   SUB_7C8CF                        * 7CCFE
        GONC    L_7CCD7                          * 7CD02
L_7CD05:
        GOSUB   SUB_7CC6A                        * 7CD05
        C=RSTK                                   * 7CD09
        RSTK=C                                   * 7CD0B
        D0=C                                     * 7CD0D
        GOSUB   SUB_7CC56                        * 7CD10
        GOSUB   SUB_7CC64                        * 7CD14
        C=RSTK                                   * 7CD18
        RSTK=C                                   * 7CD1A
        D0=C                                     * 7CD1C
        D0=D0+  5                                * 7CD1F
        D0=D0+  16                               * 7CD22
        GOSUB   SUB_7CC56                        * 7CD25
        D1=D1-  5                                * 7CD29
        D1=D1-  16                               * 7CD2C
        GOSUB   SUB_7CC6A                        * 7CD2F
        C=RSTK                                   * 7CD33
        RSTK=C                                   * 7CD35
        D0=C                                     * 7CD37
        D0=D0+  5                                * 7CD3A
        D0=D0+  16                               * 7CD3D
        GOSUB   SUB_7CC5D                        * 7CD40
        GOSUB   SUB_7CC64                        * 7CD44
        A=-A-1  S                                * 7CD48
        D1=D1+  5                                * 7CD4B
        D1=D1+  16                               * 7CD4E
        C=RSTK                                   * 7CD51
        RSTK=C                                   * 7CD53
        D0=C                                     * 7CD55
        GOSUB   SUB_7CC5D                        * 7CD58
        C=RSTK                                   * 7CD5C
        D0=C                                     * 7CD5E
        D0=D0+  16                               * 7CD61
        D0=D0+  16                               * 7CD64
        D0=D0+  10                               * 7CD67
        CD0EX                                    * 7CD6A
        RSTK=C                                   * 7CD6D
        SETHEX                                   * 7CD6F
L_7CD71:
        GOSUB   SUB_7C962                        * 7CD71
        GOTO    L_7CD05                          * 7CD75
        RPL

* refs (15): 903DC 979D2 97EF3 97FF2 C8819 C8951 ...
OBJ_7CD79:
        ::                                       * 7CD79

* refs (5): 93806 97D80 9802A 98086 98712
OBJ_7CD7E:
          :: DUP DIMLIMITS OVER TYPERARRY? ITE %%0 ((0,0)) * 7CD7E
            MAKEARRY OBJ_7CDBF ;                 * 7CDA6
          SWAPDROP ;                             * 7CDB5

* refs (4): 7CDAB 93C6E 951E4 CAE2F
OBJ_7CDBF:
        :: OVERARSIZE OBJ_7D4C5 ;                * 7CDBF

* refs (4): C80B1 C80CA C96BC C96D5
OBJ_7CDD3:
        :: DUP%0CON SWAP                         * 7CDD3

* refs (10): 93947 93A73 93A92 95220 954EB 955ED ...
OBJ_7CDE2:
          :: OVERARSIZE OBJ_7D5CF DROP ; ;       * 7CDE2

* refs (4): C7A4B C7F53 C933F CAA8F
OBJ_7CE00:
        :: SWAP %>%%- 2DUP %%> case SWAPDROP     * 7CE00
          OBJ_37B30 OBJ_37DA0 ;                  * 7CE23

* refs (4): C7A50 C7F58 C9344 CAA94
OBJ_7CE32:
        :: SWAP %>%%- 2DUP %%< case SWAPDROP     * 7CE32
          OBJ_37B30 %%MAX ;                      * 7CE55

* refs (3): 97AAC 97B66 97C80
COND~1~3:
        :: %%0 SWAP ONE_DO_ARRY INDEX@ OBJ_372EF B%ABS ROT %%+ SWAP * 7CE64
          NextInArray SWAP ;                     * 7CE96

* refs (8): 9242A 92885 979DC 97D8A 97EFD 97FFC ...
OBJ_7CEA5:
        :: # FFF OVER#< case doerr501            * 7CEA5
          DUP #8* !MAKEHXS 2NULLLAM{} BIND DUP OBJ_37A4F #ZERO#ONE * 7CEC3
          3NULLLAM{} BIND 5GETLAM OBJ_7D28D OBJ_357F0 BEGIN 1GETLAM DUP * 7CEEB
          OBJ_376C1 5GETLAM OBJ_37013 2DUP#= ?SKIP * 7CF13
          :: SWAPCOLUMNS 3GETLAM OBJ_3798C ITE %%CHS * 7CF2C
            :: C%%CHS C%%CONJ ;                  * 7CF4A
            3PUTLAM ;                            * 7CF5E
          DROP 5GETLAM FALSE OBJ_7D3CB 3GETLAM OBJ_37941 2GETLAM OBJ_377DD * 7CF68
          2PUTLAM 3PUTLAM 1GETLAM 6GETLAM #< WHILE * 7CF90
          :: 1GETLAM #1+ 1PUTLAM ONESWAP 1GETLAM ONE_DO OVER 1GETLAM 2DUP * 7CFAE
            #1-+ 4UNROLL INDEX@ #1- OBJ_7C855 SWAP3PICK OBJ_372EF ROT L%- * 7CFE0
            SWAPINDEX@ 5GETLAM TRUE OBJ_7D3CB ROTSWAP L%/ ROT OBJ_37361 * 7D00D
            6GETLAM ROT#+SWAP NextInArray 6GETLAM #1+ 1GETLAM DO OVER * 7D035
            1GETLAM 2DUP #1-+ 4UNROLL DUP#1- OBJ_7C855 SWAP3PICK OBJ_372EF * 7D05D
            ROT L%- ROT OBJ_37361 6GETLAM ROT#+SWAP NextInArray SWAPDROP ; * 7D085
          REPEAT 3GETLAM 2GETLAM ABND ;          * 7D0B2

* refs (7): 92439 928EE 98039 C9E0F C9EF0 CA057 ...
OBJ_7D0CB:
        :: 3UNROLL 2GETLAM ONE_DO INDEX@ 1GETLAM OBJ_36FDB 2DUP#= ?SKIP * 7D0CB
          SWAPCOLUMNS                            * 7D0F8
          2DROP NextInArray ROT OBJ_7D11B ROTROT2DROP ; * 7D0FD

* refs (4): 7D10C 97AA2 97B5C 97C76
OBJ_7D11B:
        :: 3UNROLL ONEONE 2SWAP 2GETLAM #1+_ONE_DO SWAPINDEX@ 1GETLAM TRUE * 7D11B
          OBJ_7D3CB SWAPROT 6PICK #1+_ONE_DO 5PICK INDEX@ JINDEX@ #1- * 7D148
          OBJ_7C861 SWAP 5PICK OBJ_372EF ROT L%- 4PICK L%/ 5PICK OBJ_37361 * 7D170
          4ROLL #1+ 4UNROLL NextInArray ROTDROP 4ROLL 2GETLAM #+ 4UNROLL * 7D1A2
          LOOP OBJ_37B03 2GETLAM DUP#1= caseDROP DUP#1- * 7D1CF
          OVER #* 4UNROLL DUP#1- 6PICK #* 4UNROLL ONE_DO 5PICK ZERO_DO 2OVER * 7D1ED
          7PICK #+ JINDEX@ OBJ_7C861 SWAP 4PICK OBJ_372EF ROT L%- 4PICK * 7D224
          OBJ_37361 ROT #1-UNROT NextInArray 4ROLL 2GETLAM OBJ_36FC4 4UNROLL * 7D256
          LOOP OBJ_37B03 ;                       * 7D27E

* refs (2): 7CEFA 9871C
OBJ_7D28D:
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
        GOSBVL  SUB_3768C                        * 7D2D4
        ST=0    0                                * 7D2DB
        LC(5)   DOEREL                           * 7D2DE
        ?D=C    A                                * 7D2E5
        GOYES   L_7D2EF                          * 7D2E8
        ST=1    0                                * 7D2EA
        A=A+A   A                                * 7D2ED
L_7D2EF:
        R2=A                                     * 7D2EF
L_7D2F2:
        C=R3                                     * 7D2F2
        D1=C                                     * 7D2F5
        LC(5)   #49500                           * 7D2F8
        A=C     A                                * 7D2FF
        LC(5)   #50000                           * 7D301
        B=C     A                                * 7D308
        C=R4                                     * 7D30A
        B=C     X                                * 7D30D
L_7D310:
        SETDEC                                   * 7D310
        ?ST=0   0                                * 7D312
        GOYES   L_7D359                          * 7D315
        D1=D1+  16                               * 7D317
        D1=D1+  10                               * 7D31A
        C=DAT1  W                                * 7D31D
        D1=D1-  5                                * 7D321
        ?C=0    M                                * 7D324
        GOYES   L_7D353                          * 7D327
        C=DAT1  A                                * 7D329
        P=      4                                * 7D32C
        C=C+B   P                                * 7D32E
        D=C     A                                * 7D331
        D1=D1-  16                               * 7D333
        C=DAT1  W                                * 7D336
        D1=D1-  5                                * 7D33A
        ?C=0    M                                * 7D33D
        GOYES   L_7D34D                          * 7D340
        C=DAT1  A                                * 7D342
        C=C+B   P                                * 7D345
        ?D<=C   A                                * 7D348
        GOYES   L_7D379                          * 7D34B
L_7D34D:
        C=D     A                                * 7D34D
        GOTO    L_7D379                          * 7D34F
L_7D353:
        D1=D1-  16                               * 7D353
        D1=D1-  5                                * 7D356
L_7D359:
        LC(5)   #49500                           * 7D359
        D=C     A                                * 7D360
        D1=D1+  5                                * 7D362
        C=DAT1  W                                * 7D365
        D1=D1-  5                                * 7D369
        ?C=0    M                                * 7D36C
        GOYES   L_7D34D                          * 7D36F
        C=DAT1  A                                * 7D371
        P=      4                                * 7D374
        C=C+B   P                                * 7D376
L_7D379:
        SETHEX                                   * 7D379
        P=      0                                * 7D37B
        ?C<=A   A                                * 7D37D
        GOYES   L_7D384                          * 7D380
        A=C     A                                * 7D382
L_7D384:
        CD1EX                                    * 7D384
        D=C     A                                * 7D387
        C=R2                                     * 7D389
        C=C+D   A                                * 7D38C
        D1=C                                     * 7D38E
        B=B-1   X                                * 7D391
        GOC     L_7D39B                          * 7D394
        GOTO    L_7D310                          * 7D397
L_7D39B:
        DAT0=A  A                                * 7D39B
        D0=D0+  5                                * 7D39E
        A=R3                                     * 7D3A1
        LC(5)   #00015                           * 7D3A4
        ?ST=0   0                                * 7D3AB
        GOYES   L_7D3B2                          * 7D3AE
        C=C+C   A                                * 7D3B0
L_7D3B2:
        A=A+C   A                                * 7D3B2
        R3=A                                     * 7D3B4
        C=RSTK                                   * 7D3B7
        C=C-1   A                                * 7D3B9
        RSTK=C                                   * 7D3BB
        GOC     L_7D3C4                          * 7D3BD
        GOTO    L_7D2F2                          * 7D3C0
L_7D3C4:
        GOVLNG  GETPTRLOOP                       * 7D3C4

* refs (5): 7CF77 7D01C 7D148 980F6 9849D
OBJ_7D3CB:
        CON(5)  (*)+5                            * 7D3CB  primitive code object
        ST=1    1                                * 7D3D0
        GOSBVL  popflag                          * 7D3D3
        GOC     L_7D3E0                          * 7D3DA
        ST=0    1                                * 7D3DD
L_7D3E0:
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
        GOYES   L_7D41B                          * 7D416
        ST=1    0                                * 7D418
L_7D41B:
        D1=D1+  15                               * 7D41B
        C=DAT1  A                                * 7D41E
        R2=C                                     * 7D421
        A=C     A                                * 7D424
        D1=D1+  5                                * 7D426
        C=C+1   A                                * 7D429
        GOSBVL  L_35790                          * 7D42B
        B=B-A   A                                * 7D432
        B=B-1   A                                * 7D434
        GOSBVL  SUB_3767E                        * 7D436
        ?ST=0   0                                * 7D43D
        GOYES   L_7D444                          * 7D440
        B=B+B   A                                * 7D442
L_7D444:
        CD1EX                                    * 7D444
        C=C+B   A                                * 7D447
        D1=C                                     * 7D449
        GOSBVL  GETAB1                           * 7D44C
        ?ST=1   0                                * 7D453
        GOYES   L_7D469                          * 7D456
        ?ST=0   1                                * 7D458
        GOYES   L_7D462                          * 7D45B
        ?B=0    M                                * 7D45D
        GOYES   L_7D486                          * 7D460
L_7D462:
        GOVLNG  L_2A235                          * 7D462
L_7D469:
        GOSBVL  Get1%CD                          * 7D469
        ?ST=0   1                                * 7D470
        GOYES   L_7D47A                          * 7D473
        ?B=0    M                                * 7D475
        GOYES   L_7D481                          * 7D478
L_7D47A:
        GOVLNG  L_51BA2                          * 7D47A
L_7D481:
        ?D#0    M                                * 7D481
        GOYES   L_7D47A                          * 7D484
L_7D486:
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
        GONC    L_7D462                          * 7D4C2  always taken

* refs (2): 7CDC9 93914
OBJ_7D4C5:
        CON(5)  (*)+5                            * 7D4C5  primitive code object
        GOSBVL  POP#                             * 7D4CA
        GOSUB   SUB_7D6B8                        * 7D4D1
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
        GOYES   L_7D4FF                          * 7D4FA
        D1=D1+  5                                * 7D4FC
L_7D4FF:
        ST=0    1                                * 7D4FF
        ST=1    0                                * 7D502
        ST=0    2                                * 7D505
        ST=0    3                                * 7D508
        LC(5)   DOREAL                           * 7D50B
        ?D=C    A                                * 7D512
        GOYES   L_7D53A                          * 7D515
        ST=0    0                                * 7D517
        LC(5)   DOEREL                           * 7D51A
        ?D=C    A                                * 7D521
        GOYES   L_7D53A                          * 7D524
        ST=1    1                                * 7D526
        A=A+A   A                                * 7D529
        LC(5)   DOECMP                           * 7D52B
        ?D=C    A                                * 7D532
        GOYES   L_7D53A                          * 7D535
        ST=1    0                                * 7D537
L_7D53A:
        D0=D0+  10                               * 7D53A
        C=DAT0  A                                * 7D53D
        D=C     A                                * 7D540
        D0=D0+  5                                * 7D542
        C=DAT0  A                                * 7D545
        D0=D0+  10                               * 7D548
        C=C-1   A                                * 7D54B
        ?C=0    A                                * 7D54D
        GOYES   L_7D555                          * 7D550
        D0=D0+  5                                * 7D552
L_7D555:
        LC(5)   DOEREL                           * 7D555
        ?D=C    A                                * 7D55C
        GOYES   L_7D56C                          * 7D55F
        ?ST=1   1                                * 7D561
        GOYES   L_7D574                          * 7D564
        ST=1    2                                * 7D566
        GONC    L_7D574                          * 7D569
L_7D56C:
        ?ST=0   1                                * 7D56C
        GOYES   L_7D574                          * 7D56F
        ST=1    3                                * 7D571
L_7D574:
        C=A     A                                * 7D574
L_7D576:
        C=C-1   A                                * 7D576
        GOC     L_7D5CB                          * 7D578
        ?ST=1   0                                * 7D57B
        GOYES   L_7D592                          * 7D57E
        GOSBVL  GETAB1                           * 7D580
        ?ST=0   3                                * 7D587
        GOYES   L_7D5AC                          * 7D58A
        D1=D1+  5                                * 7D58C
        GONC    L_7D5A7                          * 7D58F
L_7D592:
        A=DAT1  W                                * 7D592
        D1=D1+  16                               * 7D596
        GOSBVL  SPLITA                           * 7D599
        SETHEX                                   * 7D5A0
        ?ST=0   3                                * 7D5A2
        GOYES   L_7D5AC                          * 7D5A5
L_7D5A7:
        D1=D1+  16                               * 7D5A7
        C=C-1   A                                * 7D5AA
L_7D5AC:
        GOSBVL  PUTAB0                           * 7D5AC
        ?ST=0   2                                * 7D5B3
        GOYES   L_7D576                          * 7D5B6
        A=0     W                                * 7D5B8
        DAT0=A  A                                * 7D5BB
        D0=D0+  5                                * 7D5BE
        DAT0=A  W                                * 7D5C1
        D0=D0+  16                               * 7D5C5
        GONC    L_7D576                          * 7D5C8
L_7D5CB:
        GOTO    L_7D3C4                          * 7D5CB

* refs (1): 7CDEC
OBJ_7D5CF:
        CON(5)  (*)+5                            * 7D5CF  primitive code object
        ST=0    1                                * 7D5D4
        GOSBVL  POP#                             * 7D5D7
        GOSUB   SUB_7D6B8                        * 7D5DE
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
        GOYES   L_7D60C                          * 7D607
        D1=D1+  5                                * 7D609
L_7D60C:
        ST=0    2                                * 7D60C
        ST=0    3                                * 7D60F
        ST=0    0                                * 7D612
        LC(5)   DOREAL                           * 7D615
        ?D=C    A                                * 7D61C
        GOYES   L_7D624                          * 7D61F
        ST=1    0                                * 7D621
L_7D624:
        D0=D0+  10                               * 7D624
        C=DAT0  A                                * 7D627
        D=C     A                                * 7D62A
        D0=D0+  5                                * 7D62C
        C=DAT0  A                                * 7D62F
        D0=D0+  10                               * 7D632
        C=C-1   A                                * 7D635
        ?C=0    A                                * 7D637
        GOYES   L_7D63F                          * 7D63A
        D0=D0+  5                                * 7D63C
L_7D63F:
        LC(5)   DOEREL                           * 7D63F
        ?D=C    A                                * 7D646
        GOYES   L_7D658                          * 7D649
        A=A+A   A                                * 7D64B
        ?ST=1   0                                * 7D64D
        GOYES   L_7D660                          * 7D650
        ST=1    2                                * 7D652
        GONC    L_7D660                          * 7D655
L_7D658:
        ?ST=0   0                                * 7D658
        GOYES   L_7D660                          * 7D65B
        ST=1    3                                * 7D65D
L_7D660:
        C=A     A                                * 7D660
        D=C     A                                * 7D662
L_7D664:
        D=D-1   A                                * 7D664
        GOC     L_7D6AC                          * 7D666
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
        GOYES   L_7D69E                          * 7D68C
        ?ST=0   2                                * 7D68E
        GOYES   L_7D664                          * 7D691
        D0=D0+  16                               * 7D693
        D0=D0+  5                                * 7D696
        D=D-1   A                                * 7D699
        GONC    L_7D664                          * 7D69B
L_7D69E:
        A=0     W                                * 7D69E
        DAT1=A  W                                * 7D6A1
        D1=D1+  16                               * 7D6A5
        GOTO    L_7D664                          * 7D6A8
L_7D6AC:
        GOTO    L_7D3C4                          * 7D6AC

* refs (4): 7D292 7D3EB 7D70A 7D7AE
SUB_7D6B0:
        A=DAT1  A                                * 7D6B0
        D1=D1+  5                                * 7D6B3
        D=D+1   A                                * 7D6B6

* refs (3): 7D4D1 7D5DE 7D82F
SUB_7D6B8:
        GOVLNG  SAVPTR                           * 7D6B8

* refs (2): 7D677 7D74A
SUB_7D6BF:
        ?ST=1   1                                * 7D6BF
        GOYES   L_7D6CB                          * 7D6C2
        GOVLNG  PACK                             * 7D6C4
L_7D6CB:
        GOVLNG  SUB_29F76                        * 7D6CB

* refs (1): 36D85
OBJ_7D6D2:
        CON(5)  (*)+5                            * 7D6D2  primitive code object
        ST=0    1                                * 7D6D7
        GOTO    L_7D6E6                          * 7D6DA

* refs (7): C8922 C89F5 C8AEC C8C01 C8D20 C9E5B ...
OBJ_7D6DE:
        CON(5)  (*)+5                            * 7D6DE  primitive code object
        ST=1    1                                * 7D6E3
L_7D6E6:
        GOSUB   SUB_7D70A                        * 7D6E6
        RSTK=C                                   * 7D6EA
L_7D6EC:
        C=RSTK                                   * 7D6EC
        D0=C                                     * 7D6EE
        GOSBVL  GETAB0                           * 7D6F1
        CD0EX                                    * 7D6F8
        RSTK=C                                   * 7D6FB
        GOSUB   SUB_7D733                        * 7D6FD
        GONC    L_7D6EC                          * 7D701
L_7D704:
        P=      0                                * 7D704
        GOTO    L_7D3C4                          * 7D706

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
        GOYES   L_7D752                          * 7D736
        C=DAT1  W                                * 7D738
        GOSBVL  SUB_2BCAC                        * 7D73C
        GOSBVL  RADDF                            * 7D743
        GOSUB   SUB_7D6BF                        * 7D74A
        DAT1=A  W                                * 7D74E
L_7D752:
        D1=D1+  16                               * 7D752

* refs (1): 7D7E5
SUB_7D755:
        SETHEX                                   * 7D755
        A=R4                                     * 7D757
        A=A-1   A                                * 7D75A
        R4=A                                     * 7D75C
        RTN                                      * 7D75F

* refs (1): 0F74C
U>NCQ~1~2~1~1:
        CON(5)  (*)+5                            * 7D761  primitive code object
        ST=0    0                                * 7D766
        GOTO    L_7D775                          * 7D769

* refs (1): 0F765
OBJ_7D76D:
        CON(5)  (*)+5                            * 7D76D  primitive code object
        ST=1    0                                * 7D772
L_7D775:
        ST=0    1                                * 7D775
        GOSUB   SUB_7D70A                        * 7D778
        RSTK=C                                   * 7D77C
L_7D77E:
        C=RSTK                                   * 7D77E
        D0=C                                     * 7D780
        A=DAT0  W                                * 7D783
        GOSBVL  SPLITA                           * 7D787
        D0=D0+  16                               * 7D78E
        CD0EX                                    * 7D791
        RSTK=C                                   * 7D794
        ?ST=0   0                                * 7D796
        GOYES   L_7D79E                          * 7D799
        A=-A-1  S                                * 7D79B
L_7D79E:
        GOSUB   SUB_7D733                        * 7D79E
        GONC    L_7D77E                          * 7D7A2
        GOTO    L_7D704                          * 7D7A5

* refs (1): 36F6A
OBJ_7D7A9:
        CON(5)  (*)+5                            * 7D7A9  primitive code object
        GOSUB   SUB_7D6B0                        * 7D7AE
        GOSUB   SUB_7D71D                        * 7D7B2
        A=0     W                                * 7D7B6
        R2=A                                     * 7D7B9
        R3=A                                     * 7D7BC
L_7D7BF:
        SETDEC                                   * 7D7BF
        GOSBVL  GETAB1                           * 7D7C1
        A=0     S                                * 7D7C8
        GOSBVL  RCCD2                            * 7D7CB
        P=      3                                * 7D7D2
        GOSBVL  TST15                            * 7D7D4
        GOC     L_7D7E5                          * 7D7DB
        GOSBVL  STAB2                            * 7D7DE
L_7D7E5:
        GOSUB   SUB_7D755                        * 7D7E5
        GONC    L_7D7BF                          * 7D7E9
        GOSBVL  RCAB2                            * 7D7EC
        P=      0                                * 7D7F3
        GOTO    L_7D462                          * 7D7F5

* refs (6): 8832D 88352 951CB 95202 954CD 955CF
OBJ_7D7F9:
        CON(5)  (*)+5                            * 7D7F9  primitive code object
        C=DAT1  A                                * 7D7FE
        CD1EX                                    * 7D801
        D1=D1+  10                               * 7D804
        A=DAT1  A                                * 7D807
        D1=C                                     * 7D80A
        ST=1    1                                * 7D80D
        LC(5)   DOCMP                            * 7D810
        ?C=A    A                                * 7D817
        GOYES   L_7D82F                          * 7D81A
        ST=0    1                                * 7D81C
        LC(5)   DOECMP                           * 7D81F
        ?C=A    A                                * 7D826
        GOYES   L_7D82F                          * 7D829
        GOTO    L_7D886                          * 7D82B
L_7D82F:
        GOSUB   SUB_7D6B8                        * 7D82F
        C=DAT1  A                                * 7D833
        D1=C                                     * 7D836
        D1=D1+  15                               * 7D839
        A=DAT1  B                                * 7D83C
        D1=D1+  5                                * 7D83F
        C=DAT1  A                                * 7D842
        D1=D1+  5                                * 7D845
        A=A-1   B                                * 7D848
        ?A=0    B                                * 7D84B
        GOYES   L_7D861                          * 7D84E
        D=C     A                                * 7D850
        C=DAT1  A                                * 7D852
        GOSBVL  L_35790                          * 7D855
        C=B     A                                * 7D85C
        D1=D1+  5                                * 7D85E
L_7D861:
        C=C-1   A                                * 7D861
L_7D863:
        ?ST=1   1                                * 7D863
        GOYES   L_7D86B                          * 7D866
        D1=D1+  10                               * 7D868
L_7D86B:
        D1=D1+  16                               * 7D86B
        A=DAT1  W                                * 7D86E
        ?A#0    M                                * 7D872
        GOYES   L_7D88D                          * 7D875
        D1=D1+  16                               * 7D877
        C=C-1   A                                * 7D87A
        GONC    L_7D863                          * 7D87C
        GOSBVL  GETPTR                           * 7D87F
L_7D886:
        GOVLNG  L_03B1A                          * 7D886
L_7D88D:
        GOSBVL  GETPTR                           * 7D88D
        GOVLNG  L_03B06                          * 7D894

* refs (2): 373E0 373FE
SUB_7D89B:
        GOSBVL  GETAB0                           * 7D89B
        SETDEC                                   * 7D8A2
        P=      0                                * 7D8A4
        ?B#0    M                                * 7D8A6
        GOYES   L_7D8B3                          * 7D8A9
L_7D8AB:
        A=0     W                                * 7D8AB
        B=0     W                                * 7D8AE
        RTN                                      * 7D8B1
L_7D8B3:
        C=A     A                                * 7D8B3
        C=C+C   A                                * 7D8B5
        GOC     L_7D907                          * 7D8B7
        LC(5)   #20000                           * 7D8BA
        ?C>A    A                                * 7D8C1
        RTNYES                                   * 7D8C4
        D0=(5)  #80848                           * 7D8C6
        A=DAT0  B                                * 7D8CD
        ?ABIT=0 0                                * 7D8D0
        GOYES   L_7D8E1                          * 7D8D5
        LC(5)   ofloerr                          * 7D8D7
        GONC    L_7D932                          * 7D8DE
L_7D8E1:
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
L_7D907:
        LC(5)   CMOS                             * 7D907
        ?C<A    A                                * 7D90E
        RTNYES                                   * 7D911
        D0=(5)  #80847                           * 7D913
        A=DAT0  B                                * 7D91A
        ?ABIT=0 3                                * 7D91D
        GOYES   L_7D939                          * 7D922
        LC(5)   posunferr                        * 7D924
        ?A=0    S                                * 7D92B
        GOYES   L_7D932                          * 7D92E
        C=C+1   A                                * 7D930
L_7D932:
        GOVLNG  GPErrjmpC                        * 7D932
L_7D939:
        ?A#0    S                                * 7D939
        GOYES   L_7D950                          * 7D93C
        D0=(5)  #80848                           * 7D93E
        A=DAT0  B                                * 7D945
        ABIT=1  3                                * 7D948
        GONC    L_7D95F                          * 7D94D
L_7D950:
        D0=(5)  #80848                           * 7D950
        A=DAT0  B                                * 7D957
        ABIT=1  2                                * 7D95A
L_7D95F:
        DAT0=A  B                                * 7D95F
        GOTO    L_7D8AB                          * 7D962
        RPL

* refs (2): 3FB88 992A5
OBJ_7D966:
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
SUB_7D9B8:
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
L_7D9EA:
        D1=D1-  5                                * 7D9EA
        C=DAT1  A                                * 7D9ED
        CD1EX                                    * 7D9F0
        D1=D1+  5                                * 7D9F3
        A=DAT1  W                                * 7D9F6
        D1=C                                     * 7D9FA
        GOSBVL  SPLITA                           * 7D9FD
        GOSBVL  PUTAB0                           * 7DA04
        D=D-1   A                                * 7DA0B
        GONC    L_7D9EA                          * 7DA0D
        ST=0    8                                * 7DA10
        ?B=0    M                                * 7DA13
        RTNYES                                   * 7DA16
        ST=1    8                                * 7DA18
        RTN                                      * 7DA1B

* refs (3): 99D5B 99DF8 99EAA
SUB_7DA1D:
        GOSUB   SUB_7DA2B                        * 7DA1D
        RTNC                                     * 7DA21
        GOVLNG  SUB_78605                        * 7DA24

* refs (5): 7DA1D 993F5 99605 99A83 99AB5
SUB_7DA2B:
        GOSBVL  SUB_785B8                        * 7DA2B
        GOSBVL  SUB_78623                        * 7DA32
        GOSUB   SUB_7DA74                        * 7DA39
        RTNC                                     * 7DA3D
        ?B=0    P                                * 7DA40
        GOYES   L_7DA4C                          * 7DA43
        GOSBVL  DIVF                             * 7DA45
L_7DA4C:
        P=      14                               * 7DA4C
        ?B#0    P                                * 7DA4E
        GOYES   L_7DA55                          * 7DA51
        RTN                                      * 7DA53
L_7DA55:
        A=A-1   A                                * 7DA55
        A=A-1   A                                * 7DA57
        ?A#0    S                                * 7DA59
        GOYES   L_7DA60                          * 7DA5C
        RTN                                      * 7DA5E
L_7DA60:
        P=      4                                * 7DA60
        ?A=0    P                                * 7DA62
        GOYES   L_7DA69                          * 7DA65
        RTN                                      * 7DA67
L_7DA69:
        P=      0                                * 7DA69
        LC(5)   #0E603                           * 7DA6B
        RTNSC                                    * 7DA72

* refs (2): 7DA39 99750
SUB_7DA74:
        ?C#0    S                                * 7DA74
        GOYES   L_7DA82                          * 7DA77
        P=      14                               * 7DA79
        ?D=0    P                                * 7DA7B
        GOYES   L_7DA82                          * 7DA7E
        RTNCC                                    * 7DA80
L_7DA82:
        P=      0                                * 7DA82
        LC(5)   #0E605                           * 7DA84
        RTNSC                                    * 7DA8B

* refs (1): 99861
SUB_7DA8D:
        GOSBVL  L_79303                          * 7DA8D
        RTNNC                                    * 7DA94
L_7DA97:
        ?ST=1   10                               * 7DA97
        GOYES   L_7DAA7                          * 7DA9A
L_7DA9C:
        P=      0                                * 7DA9C
        LC(5)   ofloerr                          * 7DA9E
        RTNSC                                    * 7DAA5
L_7DAA7:
        P=      0                                * 7DAA7
        LC(5)   posunferr                        * 7DAA9
        ?A=0    S                                * 7DAB0
        RTNYES                                   * 7DAB3
        LC(5)   negunferr                        * 7DAB5
        RTNSC                                    * 7DABC

* refs (3): 99616 99DA0 99EEF
SUB_7DABE:
        GOSBVL  RADD1                            * 7DABE
        GOSBVL  SUB_78617                        * 7DAC5
        GOSBVL  XYEX                             * 7DACC
        ?ST=0   8                                * 7DAD3
        RTNYES                                   * 7DAD6
        GOVLNG  MULTF                            * 7DAD8

* refs (2): 99D6C 99E09
SUB_7DADF:
        C=-C-1  S                                * 7DADF

* refs (3): 998AB 998FA 99EBB
SUB_7DAE2:
        P=      14                               * 7DAE2
        ?B#0    P                                * 7DAE4
        GOYES   L_7DB02                          * 7DAE7
        GOSBVL  XYEX                             * 7DAE9
        C=0     W                                * 7DAF0
        D=0     W                                * 7DAF3
        D=D+1   P                                * 7DAF6
        GOSBVL  STCD0                            * 7DAF9
        RTNCC                                    * 7DB00
L_7DB02:
        GOSBVL  STAB2                            * 7DB02
        R1=C                                     * 7DB09
        C=D     W                                * 7DB0C
        R4=C                                     * 7DB0F
        GOSBVL  L_78DBC                          * 7DB12
        C=R4                                     * 7DB19
        D=C     W                                * 7DB1C
        C=R1                                     * 7DB1F
        GOSBVL  MULTF                            * 7DB22
        GOSBVL  L_78FD5                          * 7DB29
        GONC    L_7DB37                          * 7DB30
        GOTO    L_7DA97                          * 7DB33
L_7DB37:
        GOSBVL  EXAB0                            * 7DB37
        GOSBVL  RCCD2                            * 7DB3E
        GOSBVL  DIVF                             * 7DB45
        RTNCC                                    * 7DB4C
L_7DB4E:
        ?XM=0                                    * 7DB4E
        GOYES   L_7DB66                          * 7DB51
        XM=0                                     * 7DB53
        ?P=     3                                * 7DB56
        GOYES   L_7DB68                          * 7DB59
        P=      0                                * 7DB5B
        LC(5)   #00203                           * 7DB5D
        RTNSC                                    * 7DB64
L_7DB66:
        RTNCC                                    * 7DB66
L_7DB68:
        P=      0                                * 7DB68
        LC(5)   infreserr                        * 7DB6A
        RTNSC                                    * 7DB71

* refs (3): 9964E 996AA 99E73
SUB_7DB73:
        XM=0                                     * 7DB73
        GOSBVL  DIVF                             * 7DB76
        ?XM=0                                    * 7DB7D
        GOYES   L_7DB66                          * 7DB80
        XM=0                                     * 7DB82
        ?P=     3                                * 7DB85
        GOYES   L_7DB95                          * 7DB88
L_7DB8A:
        P=      0                                * 7DB8A
        LC(5)   #0E602                           * 7DB8C
        RTNSC                                    * 7DB93
L_7DB95:
        P=      0                                * 7DB95
        LC(5)   #0E601                           * 7DB97
        RTNSC                                    * 7DB9E
        RPL

* refs (1): 1A495
nWHEREIFTE:
        ROMPTR 0F0 079                           * 7DBA0

* refs (1): 1F03A
nWHEREDER:
        ROMPTR 0F0 078                           * 7DBAB

* refs (1): 1F26C
nWHEREINTG:
        ROMPTR 0F0 07C                           * 7DBB6

* refs (1): 1F33F
nWHERESUM:
        ROMPTR 0F0 07D                           * 7DBC1

* refs (1): 1F42A
nWHEREWHERE:
        ROMPTR 0F0 07A                           * 7DBCC

nWHEREFCNAPP:
        ROMPTR 0F0 077                           * 7DBD7

* refs (1): 1AEED
D/D*:
        ROMPTR 0F0 098                           * 7DBE2

* refs (1): 1AC84
D/D+:
        ROMPTR 0F0 099                           * 7DBED

* refs (1): 1ADD6
D/D-:
        ROMPTR 0F0 09A                           * 7DBF8

* refs (1): 1AFE6
D/D/:
        ROMPTR 0F0 09B                           * 7DC03

* refs (2): 85FFC 86056
derquot:
        :: psh dup OBJ_56D01 addt* pshtop&       * 7DC0E
          { %2 x^ x/ } INNERCOMP 2top& ;         * 7DC2C

* refs (4): 85EDF 85EFD 86024 86047
derprod1:
        :: psh OBJ_56D01 pshtop& addt* ;         * 7DC54

* refs (1): 1A97D
D/D=:
        ROMPTR 0F0 09D                           * 7DC72

* refs (1): 1AA60
D/DABS:
        ROMPTR 0F0 09E                           * 7DC7D

* refs (1): 860B5
easyabs:
        :: DROP Cr xSIGN ;                       * 7DC88

* refs (1): 1B75C
D/DACOS:
        ROMPTR 0F0 09F                           * 7DCA1

* refs (1): 1B85D
D/DACOSH:
        ROMPTR 0F0 0A0                           * 7DCAC

* refs (1): 1BA6A
D/DALOG:
        ROMPTR 0F0 0A1                           * 7DCB7

* refs (1): 1B308
D/DARG:
        ROMPTR 0F0 0A2                           * 7DCC2

* refs (1): 1B6D1
D/DASIN:
        ROMPTR 0F0 0A3                           * 7DCCD

* refs (1): 1B818
D/DASINH:
        ROMPTR 0F0 0A4                           * 7DCD8

* refs (1): 1B7C9
D/DATAN:
        ROMPTR 0F0 0A5                           * 7DCE3

* refs (1): 1B8CF
D/DATANH:
        ROMPTR 0F0 0A6                           * 7DCEE

* refs (1): 1AA07
D/DCHS:
        :: OBJ_56CD1 OBJ_56BEB Cr xNEG ;         * 7DCF9

* refs (1): 1AAA5
D/DCONJ:
        :: OBJ_56CD1 OBJ_56BEB Cr xCONJ ;        * 7DD17

* refs (1): 1B53C
D/DCOS:
        ROMPTR 0F0 0A7                           * 7DD35

* refs (1): 1B633
D/DCOSH:
        ROMPTR 0F0 0A8                           * 7DD40

* refs (2): 1B932 1BAE5
D/DEXP:
        ROMPTR 0F0 0A9                           * 7DD4B

* refs (1): 1B2B9
D/DINV:
        ROMPTR 0F0 0AA                           * 7DD56

* refs (1): 1B97C
D/DLN:
        ROMPTR 0F0 0AB                           * 7DD61

* refs (1): 1BAAF
D/DLNP1:
        ROMPTR 0F0 0AC                           * 7DD6C

* refs (1): 1B9F3
D/DLOG:
        ROMPTR 0F0 0AD                           * 7DD77

D/DIFTE:
        ROMPTR 0F0 0AE                           * 7DD82

* refs (1): 1B4E3
D/DSIN:
        ROMPTR 0F0 0AF                           * 7DD8D

* refs (1): 1B5E4
D/DSINH:
        ROMPTR 0F0 0B0                           * 7DD98

* refs (1): 1B467
D/DSQ:
        ROMPTR 0F0 0B1                           * 7DDA3

* refs (1): 1B3B5
D/DSQRT:
        ROMPTR 0F0 0B2                           * 7DDAE

* refs (1): 1B595
D/DTAN:
        ROMPTR 0F0 0B3                           * 7DDB9

* refs (1): 1B682
D/DTANH:
        ROMPTR 0F0 0B4                           * 7DDC4

* refs (1): 1B0D2
D/D^:
        ROMPTR 0F0 0B5                           * 7DDCF

* refs (2): 8672C 8674A
D/D^X:
        ROMPTR 0F0 0B6                           * 7DDDA

* refs (2): 8670E 86754
D/D^Y:
        ROMPTR 0F0 0B7                           * 7DDE5

D/DDER:
        ROMPTR 0F0 0B8                           * 7DDF0

* refs (1): 1F420
D/DWHERE:
        ROMPTR 0F0 0B9                           * 7DDFB

D/DINTEGRAL:
        ROMPTR 0F0 0BA                           * 7DE06

D/DSUM:
        ROMPTR 0F0 0BB                           * 7DE11

* refs (1): 1F5EC
D/DAPPLY:
        ROMPTR 0F0 0BC                           * 7DE1C

* refs (1): 1B2C8
nINTGINV:
        ROMPTR 0F0 012                           * 7DE27

* refs (1): 1B361
nINTGSIGN:
        ROMPTR 0F0 018                           * 7DE32

* refs (1): 1B3BF
nINTGSQRT:
        ROMPTR 0F0 015                           * 7DE3D

* refs (1): 1B471
nINTGSQ:
        ROMPTR 0F0 014                           * 7DE48

* refs (1): 1B4F2
nINTGSIN:
        ROMPTR 0F0 000                           * 7DE53

* refs (1): 1B54B
nINTGCOS:
        ROMPTR 0F0 002                           * 7DE5E

* refs (1): 1B5A4
nINTGTAN:
        ROMPTR 0F0 004                           * 7DE69

* refs (1): 1B5F3
nINTGSINH:
        ROMPTR 0F0 008                           * 7DE74

* refs (1): 1B642
nINTGCOSH:
        ROMPTR 0F0 00B                           * 7DE7F

* refs (1): 1B691
nINTGTANH:
        ROMPTR 0F0 00D                           * 7DE8A

* refs (1): 1B6E0
nINTGASIN:
        ROMPTR 0F0 005                           * 7DE95

* refs (1): 1B76B
nINTGACOS:
        ROMPTR 0F0 006                           * 7DEA0

* refs (1): 1B7D8
nINTGATAN:
        ROMPTR 0F0 007                           * 7DEAB

* refs (1): 1B98B
nINTGLN:
        ROMPTR 0F0 010                           * 7DEB6

* refs (1): 1BA02
nINTGLOG:
        ROMPTR 0F0 011                           * 7DEC1

* refs (1): 1BA79
nINTGALOG:
        ROMPTR 0F0 00F                           * 7DECC

* refs (1): 1BAEF
nINTGEXPM:
        ROMPTR 0F0 00E                           * 7DED7

* ->
* refs (1): 211CB
nCustomMenu:
        ROMPTR 0A9 001                           * 7DEE2

* refs (1): 1F533
nCOLCTQUOTE:
        ROMPTR 0F0 096                           * 7DEED

* refs (1): 56E8C
SPLITWHERE:
        ROMPTR 0F0 07B                           * 7DEF8

* refs (2): 1AC8E 1ADE0
MANMENU+-:
        ROMPTR 0F0 0BD                           * 7DF03

* refs (2): 1AEF7 1AFF0
MANMENU*/:
        ROMPTR 0F0 0BE                           * 7DF0E

* refs (1): 1B0DC
MANMENU^:
        ROMPTR 0F0 0BF                           * 7DF19

* refs (2): 1B93C 1BA74
MANMENUEXP:
        ROMPTR 0F0 0C0                           * 7DF24

* refs (2): 1B986 1B9FD
MANMENULN:
        ROMPTR 0F0 0C1                           * 7DF2F

* refs (2): 1AA11 1B2C3
MANMENUCSIV:
        ROMPTR 0F0 0C2                           * 7DF3A

* refs (1): 1A987
MANMENUEQ:
        ROMPTR 0F0 0C3                           * 7DF45

* refs (3): 1AAAF 1C80B 1C850
MANMENUCX:
        ROMPTR 0F0 0C4                           * 7DF50

* refs (6): 1B4ED 1B546 1B59F 1B5EE 1B63D 1B68C
MANMENUTRG:
        ROMPTR 0F0 0C5                           * 7DF5B

* refs (6): 1B6DB 1B766 1B7D3 1B822 1B867 1B8D9
MANMENUATG:
        ROMPTR 0F0 0C6                           * 7DF66

* refs (13): 48DA1 73135 73149 7315D 73176 7318F ...
PTYPE>PINFO:
        ROMPTR 0F1 03B                           * 7DF71

MOVEVAR:
        ROMPTR 0B5 167                           * 7DF7C

COPYVAR:
        ROMPTR 0B5 164                           * 7DF87

* refs (1): 5FAC2
EXPR>~1~romptr:
        ROMPTR 0F1 041                           * 7DF92
        ASSEMBLE
L_7DF9D:
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
L_7DFCF:
        C=0     S                                * 7DFCF
        D0=(5)  INITEN                           * 7DFD2
        DAT0=C  S                                * 7DFD9
        GOVLNG  SUB_0ABA0                        * 7DFDD
L_7DFE4:
        P=      0                                * 7DFE4
        GOSUB   SUB_7DFF6                        * 7DFE6
        C=0     A                                * 7DFEA
        DAT1=C  A                                * 7DFEC
        GOVLNG  L_09262                          * 7DFEF

* refs (1): 7DFE6
SUB_7DFF6:
        PC=C                                     * 7DFF6
        NIBHEX  00000                            * 7DFFA  ..

EndFreeROM:
        RTNSXM                                   * 7DFFF
