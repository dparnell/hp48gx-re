* HP 48GX ROM revision R, #86FE4-#8998D: Library part 0C0
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: Get2ABR0 Save2ABR0 D0Back2%% PUTAB0Back MulD0%% Get2ABR0b SubCDTestb SubCDTest HypotABR0
* Follows on from the previous file (at #86FE4 in the original ROM).

LIB0C0:
        CON(3)  #0C0                             * 86FE4  library number
        REL(5)  LIB0C0.hash                      * 86FE7  hash table
        REL(5)  LIB0C0.message                   * 86FEC  message table
        REL(5)  LIB0C0.link                      * 86FF1  link table
        CON(5)  0                                * 86FF6  config

LIB0C0.message:
        CON(5)  DOARRY                           * 86FFB  array 1
        LENGTH                                   * 87000  length, to #8703F
        CON(5)  DOCSTR                           * 87005  element type
        CON(5)  1                                * 8700A  dimensions
        CON(5)  1                                * 8700F
        $BODY   "Unable to find root"            * 87014  1
        ENDLENGTH                                * 8703F
        RPL

* ROMPTR 0C0 000
* refs (1): 86FE4
ROMP_0C0_000:
        :: # 54 #* # 272 #+ !MAKEHXS             * 8703F
          CODE                                   * 87067  4726 nibbles
            HST=0   3                            * 87071
            D1=D1+  10                           * 87074
            D=D+1   A                            * 87077
            D=D+1   A                            * 87079
            GOSBVL  SAVPTR                       * 8707B
            D1=D1-  10                           * 87082
            A=DAT1  A                            * 87085
            D0=A                                 * 87088
            D0=D0+  10                           * 8708B
            AD0EX                                * 8708E
            R4=A                                 * 87091
            D1=D1+  10                           * 87094
            A=DAT1  A                            * 87097
            D0=A                                 * 8709A
            D0=D0+  15                           * 8709D
            D0=D0+  5                            * 870A0
            A=DAT0  A                            * 870A3
            R1=A                                 * 870A6
            D0=D0+  5                            * 870A9
            AD0EX                                * 870AC
            R3=A                                 * 870AF
            D1=D1-  5                            * 870B2
            A=DAT1  A                            * 870B5
            D0=A                                 * 870B8
            D0=D0+  15                           * 870BB
            A=DAT0  A                            * 870BE
            D0=D0+  10                           * 870C1
            A=A-1   A                            * 870C4
            ?A=0    A                            * 870C6
            GOYES   L_870CE                      * 870C9
            D0=D0+  5                            * 870CB
L_870CE:
            AD0EX                                * 870CE
            R2=A                                 * 870D1
            A=R4                                 * 870D4
            D1=A                                 * 870D7
            A=R1                                 * 870DA
            DAT1=A  A                            * 870DD
            D1=D1+  5                            * 870E0
            DAT1=A  A                            * 870E3
            A=A+A   A                            * 870E6
            A=A+1   A                            * 870E8
            R1=A                                 * 870EA
            D1=D1+  7                            * 870ED
            A=R3                                 * 870F0
            DAT1=A  A                            * 870F3
            AD1EX                                * 870F6
            LC(5)   #00266                       * 870F9
            A=A+C   A                            * 87100
            D1=A                                 * 87102
            LC(5)   #90000                       * 87105
            CR2EX                                * 8710C
            D0=C                                 * 8710F
L_87112:
            A=DAT0  W                            * 87112
            D0=D0+  16                           * 87116
            GOSBVL  SPLITA                       * 87119
            GOSUBL  PutAB%1~jump                 * 87120
            C=R2                                 * 87126
            P=      4                            * 87129
            ?C=A    P                            * 8712B
            GOYES   L_87138                      * 8712E
            ?C#0    P                            * 87130
            GOYES   L_8713D                      * 87133
            GONC    L_87140                      * 87135
L_87138:
            ?C>=A   A                            * 87138
            GOYES   L_87140                      * 8713B
L_8713D:
            R2=A                                 * 8713D
L_87140:
            GOSBVL  CkATTNcode                   * 87140
            A=R1                                 * 87147
            A=A-1   A                            * 8714A
            R1=A                                 * 8714C
            GONC    L_87112                      * 8714F
            P=      0                            * 87152
            C=0     S                            * 87154
            GOSUBL  SUB_87A04                    * 87157
            C=0     S                            * 8715D
            GOSUBL  SUB_87A6E                    * 87160
            A=R2                                 * 87166
            LC(5)   #00480                       * 87169
            P=      4                            * 87170
            ?A#0    P                            * 87172
            GOYES   L_8717C                      * 87175
            ?C<=A   A                            * 87177
            GOYES   L_871DF                      * 8717A
L_8717C:
            SETDEC                               * 8717C
            C=C-A   A                            * 8717E
            GOTO    L_8718D                      * 87180
L_87184:
            P=      0                            * 87184
            LC(5)   #99988                       * 87186
L_8718D:
            R0=C                                 * 8718D
            GOSUB   SUB_8791E                    * 87190
            C=DAT1  A                            * 87194
            SETHEX                               * 87197
            C=C+C   A                            * 87199
            C=C+1   A                            * 8719B
            R1=C                                 * 8719D
            D1=A                                 * 871A0
L_871A3:
            GOSUBL  GETAB1~jump                  * 871A3
            ?B=0    W                            * 871A9
            GOYES   L_871C1                      * 871AC
            SETDEC                               * 871AE
            C=R0                                 * 871B0
            A=A+C   A                            * 871B3
            GOSUBL  SUB_87AAD                    * 871B5
            GOSUBL  SUB_87C09                    * 871BB
L_871C1:
            GOSBVL  CkATTNcode                   * 871C1
            C=R1                                 * 871C8
            C=C-1   A                            * 871CB
            R1=C                                 * 871CD
            GONC    L_871A3                      * 871D0
            C=0     S                            * 871D3
            C=C+1   S                            * 871D6
            GOSUBL  SUB_87A04                    * 871D9
L_871DF:
            C=0     S                            * 871DF
            C=C+1   S                            * 871E2
            GOSUBL  SUB_87A6E                    * 871E5
            C=R4                                 * 871EB
            D1=C                                 * 871EE
            C=DAT1  A                            * 871F1
            C=C-1   A                            * 871F4
            C=C-1   A                            * 871F6
            GOC     L_87220                      * 871F8
            C=C-1   A                            * 871FB
            GONC    L_87255                      * 871FD
            GOSUBL  SUB_87F14                    * 87200
            GOSUBL  SUB_8813B                    * 87206
            GOSUB   SUB_879A7                    * 8720C
            GOSUBL  SUB_87D15                    * 87210
            GOSUBL  SUB_87B4C                    * 87216
            GOTO    SUB_879A7                    * 8721C
L_87220:
            GOSUB   SUB_8791E                    * 87220
            D1=A                                 * 87224
            GOSUBL  SUB_87BC4                    * 87227
            GOSUBL  Get2ABR0                     * 8722D
            GOSUBL  Save2ABR0                    * 87233
            GOSUBL  SUB_87B95                    * 87239
            GOSUBL  Get2ABR0                     * 8723F
            GOSUBL  SUB_88207                    * 87245
            GOSUBL  SUB_87EA7                    * 8724B
            GOTO    SUB_879A7                    * 87251
L_87255:
            A=DAT1  A                            * 87255
            GOSBVL  SUB_7A0AA                    * 87258
            GOSUBL  SUB_87CF4                    * 8725F
            GOSUBL  SUB_87F14                    * 87265
            GOSUBL  SUB_8804A                    * 8726B
            GOSUBL  GETAB1~jump                  * 87271
            GOSUB   STAB2~jump_6                 * 87277
            C=0     A                            * 8727B
            GOSUBL  SUB_87DC6                    * 8727D
            GOSUBL  SUB_87B4C                    * 87283
            GOSUBL  Save2ABR0                    * 87289
            C=R4                                 * 8728F
            D1=C                                 * 87292
            C=DAT1  A                            * 87295
            GOSUBL  SUB_87DC6                    * 87298
            GOSUBL  SUB_87B4C                    * 8729E
            GOSUBL  SUB_87EA7                    * 872A4
            GOSUBL  HypotABR0                    * 872AA
            GOSUBL  STAB0~jump_6                 * 872B0
            GOSUBL  SUB_87D83                    * 872B6
            GOSUB   STAB2~jump_6                 * 872BC
            SETDEC                               * 872C0
            GOSUB   RCAB0~jump                   * 872C2
            GOSBVL  SUB_2B698                    * 872C6
            GOSUB   RCCD2~jump_6                 * 872CD
            GOSUB   DIVF~jump_3                  * 872D1
            GOSBVL  SUB_2B6AA                    * 872D5
            GOSUBL  SUB_88120                    * 872DC
            GOSUBL  SUB_87C23                    * 872E2
            C=0     W                            * 872E8
            D=0     W                            * 872EB
            P=      14                           * 872EE
            D=D+1   P                            * 872F0
            D=D+1   M                            * 872F3
            GOSUB   MULTF~jump_5                 * 872F6
            GOSUBL  SUB_87C09                    * 872FA
            GOSUBL  SUB_87C9C                    * 87300
            D0=C                                 * 87306
L_87309:
            GOSUB   SUB_8791E                    * 87309
            C=DAT1  A                            * 8730D
            C=C-1   A                            * 87310
            R3=C                                 * 87312
            D1=A                                 * 87315
            A=0     W                            * 87318
            B=0     W                            * 8731B
            GOSUBL  SUB_87C16                    * 8731E
            GOSUBL  Get2ABR0                     * 87324
            SETDEC                               * 8732A
            GOSUBL  HypotABR0                    * 8732C
            D0=D0-  16                           * 87332
            D0=D0-  5                            * 87335
            GOSUBL  SUB_87C16                    * 87338
L_8733E:
            GOSUBL  GETAB0~jump                  * 8733E
            SETDEC                               * 87344
            GOSUB   SUB_87982                    * 87346
            GOSUBL  SUB_87BE1                    * 8734A
            GOSUBL  GETCD0~jump                  * 87350
            GOSUB   L_87961                      * 87356
            GOSUBL  PUTAB0~jump_2                * 8735A
            GOSUB   Get2ABR0                     * 87360
            GOSUBL  HypotABR0                    * 87364
            CR3EX                                * 8736A
            ?C#0    A                            * 8736D
            GOYES   L_87375                      * 87370
            A=-A-1  S                            * 87372
L_87375:
            CR3EX                                * 87375
            GOSUBL  STAB0~jump_6                 * 87378
            GOSUBL  GETAB0~jump                  * 8737E
            GOSUBL  SUB_87BE1                    * 87384
            GOSUB   SUB_87982                    * 8738A
            GOSUB   RCCD0~jump_6                 * 8738E
            GOSUB   L_87961                      * 87392
            GOSUBL  SUB_87C16                    * 87396
            GOSBVL  CkATTNcode                   * 8739C
            C=R3                                 * 873A3
            C=C-1   A                            * 873A6
            R3=C                                 * 873A8
            GONC    L_8733E                      * 873AB
            SETDEC                               * 873AE
            GOSUBL  GETCD0~jump                  * 873B0
            GOSUB   DIVF~jump_3                  * 873B6
            A=-A-1  S                            * 873BA
            GOSUBL  GETCD0~jump                  * 873BD
            GOSBVL  STCD0                        * 873C3
            GOSUB   L_87961                      * 873CA
            GOSUBL  SUB_87C16                    * 873CE
            D0=D0-  16                           * 873D4
            D0=D0-  5                            * 873D7
            GOSUB   RCCD0~jump_6                 * 873DA
            GOSUB   SubCDTest                    * 873DE
            GOC     L_873E9                      * 873E2
            GOTO    L_87309                      * 873E5
L_873E9:
            GOSUB   RCAB0~jump                   * 873E9
            C=0     W                            * 873ED
            C=C-1   A                            * 873F0
            D=0     W                            * 873F2
            D=D-1   M                            * 873F5
            GOSUB   MULTF~jump_5                 * 873F8
            GOSUBL  SUB_87CFF                    * 873FC
            GOSUB   SUB_87BA1                    * 87402
            GOSUBL  GETAB1~jump                  * 87406
            SETDEC                               * 8740C
            GOSUB   SUB_87982                    * 8740E
            D=0     W                            * 87412
            C=0     W                            * 87415
            P=      11                           * 87418
            LC(4)   #1445                        * 8741A
            DCEX    W                            * 87420
            GOSUB   MULTF~jump_5                 * 87423
            GOSUBL  SUB_88120                    * 87427
            GOSUBL  SUB_87C23                    * 8742D
            GOSUBL  SUB_87CBD                    * 87433
            A=0     W                            * 87439
            B=0     W                            * 8743C
            GOSUB   PutAB%1~jump                 * 8743F
            GOSUB   PutAB%1~jump                 * 87443
            C=0     A                            * 87447
            GOSUBL  SUB_87DC6                    * 87449
            GOSUB   SUB_87B4C                    * 8744F
            SETDEC                               * 87453
            GOSUBL  HypotABR0                    * 87455
            GOSUBL  SUB_87CDE                    * 8745B
            C=R4                                 * 87461
            D1=C                                 * 87464
            D1=D1+  10                           * 87467
            C=0     B                            * 8746A
            DAT1=C  B                            * 8746D
L_87470:
            GOSUBL  SUB_87D4C                    * 87470
            GOSUBL  STAB0~jump_6                 * 87476
            GOSUB   SUB_87BB2                    * 8747C
            GOSUB   Get1%CD~jump                 * 87480
            GOSBVL  STCD2                        * 87484
            GOSUB   SubCDTest                    * 8748B
            GOC     L_87496                      * 8748F
            GOTO    L_87744                      * 87492
L_87496:
            GOSUB   RCAB0~jump                   * 87496
            GOSUB   SUB_879A0                    * 8749A
            GOSUBL  STAB0~jump_6                 * 8749E
            GOSUB   RCCD2~jump_6                 * 874A4
            GOSUB   SubCDTest                    * 874A8
            GOC     L_874F1                      * 874AC
            C=R4                                 * 874AF
            D1=C                                 * 874B2
            D1=D1+  10                           * 874B5
            C=DAT1  B                            * 874B8
            ?C#0    B                            * 874BB
            GOYES   L_874D5                      * 874BE
            GOSUBL  SUB_87D8E                    * 874C0
            GOSUB   SUB_87913                    * 874C6
            GOSUB   RCAB0~jump                   * 874CA
            GOSUB   SubCDTest                    * 874CE
            GONC    L_874F1                      * 874D2
L_874D5:
            GOSUB   RCAB0~jump                   * 874D5
            GOSUBL  SUB_87CE9                    * 874D9
            SETDEC                               * 874DF
            GOSUB   RCCD2~jump_6                 * 874E1
            GOSUB   DIVF~jump_3                  * 874E5
            GOSUB   SUB_87B95                    * 874E9
            GOSUB   L_87B63                      * 874ED
L_874F1:
            C=R4                                 * 874F1
            D1=C                                 * 874F4
            D1=D1+  10                           * 874F7
            C=0     S                            * 874FA
            C=C+1   S                            * 874FD
            DAT1=C  S                            * 87500
            P=      0                            * 87504
            LC(3)   #0A4                         * 87506
            GOSUBL  SUB_87DB0                    * 8750B
            D0=C                                 * 87511
            GOSUB   SUB_87BAC                    * 87514
            D1=D1+  16                           * 87518
            D1=D1+  5                            * 8751B
            LC(1)   #6                           * 8751E
L_87521:
            A=DAT1  A                            * 87521
            D1=D1+  5                            * 87524
            DAT0=A  A                            * 87527
            D0=D0+  5                            * 8752A
            A=DAT1  W                            * 8752D
            D1=D1+  16                           * 87531
            DAT0=A  W                            * 87534
            D0=D0+  16                           * 87538
            C=C-1   P                            * 8753B
            GONC    L_87521                      * 8753E
L_87541:
            GOSUB   SUB_87D2B                    * 87541
            GOSUB   SUB_87913                    * 87545
            GOSUB   GETAB1~jump                  * 87549
            GOSUB   STAB2~jump_6                 * 8754D
            GOSUB   Get2ABR0                     * 87551
            SETDEC                               * 87555
            GOSUB   L_87961                      * 87557
            GOSUB   EXAB0~jump_3                 * 8755B
            GOSUB   RCCD2~jump_6                 * 8755F
            GOSUB   L_87961                      * 87563
            GOSUB   EXAB0~jump_3                 * 87567
            GOSUB   SUB_87BBE                    * 8756B
            GOSUB   SUB_87B28                    * 8756F
L_87573:
            GOSUB   SUB_87D41                    * 87573
            SETDEC                               * 87577
            C=0     W                            * 87579
            C=C-1   A                            * 8757C
            D=0     W                            * 8757E
            P=      14                           * 87581
            D=D+1   P                            * 87583
            D=D+1   P                            * 87586
            GOSUB   MULTF~jump_5                 * 87589
            GOSUBL  STAB0~jump_6                 * 8758D
            D1=D1+  16                           * 87593
            D1=D1+  5                            * 87596
            GOSUB   Get1%CD~jump                 * 87599
            C=0     S                            * 8759D
            GOSUB   SubCDTest                    * 875A0
            GONC    L_875BB                      * 875A4
            A=0     W                            * 875A7
            B=0     W                            * 875AA
            GOSUB   SUB_87C09                    * 875AD
            D1=D1+  16                           * 875B1
            D1=D1+  5                            * 875B4
            GOTO    L_875D7                      * 875B7
L_875BB:
            GOSUB   RCAB0~jump                   * 875BB
            GOSUB   Get1%CD~jump                 * 875BF
            C=0     S                            * 875C3
            GOSUB   SubCDTest                    * 875C6
            GONC    L_875D7                      * 875CA
            A=0     W                            * 875CD
            B=0     W                            * 875D0
            GOSUB   SUB_87C09                    * 875D3
L_875D7:
            GOSUB   SUB_87BA1                    * 875D7
            GOSUB   Get2ABR0                     * 875DB
            GOSUB   SUB_87CA7                    * 875DF
            GOSUB   SUB_87B2C                    * 875E3
            GOSUB   SUB_87B89                    * 875E7
            A=0     W                            * 875EB
            B=0     W                            * 875EE
            GOSUB   PutAB%1~jump                 * 875F1
            GOSUB   PutAB%1~jump                 * 875F5
            CD1EX                                * 875F9
            D0=C                                 * 875FC
            GOSUB   SUB_8791E                    * 875FF
            C=DAT1  A                            * 87603
            C=C-1   A                            * 87606
            RSTK=C                               * 87608
            C=C+1   A                            * 8760A
            D1=A                                 * 8760C
            GOSUB   Get2ABR0                     * 8760F
            CD1EX                                * 87613
            RSTK=C                               * 87616
            CD1EX                                * 87618
            GOSUB   SUB_87AEE                    * 8761B
            GOSUB   SUB_87DF9                    * 8761F
            GOSUB   SUB_87B2C                    * 87623
            GOTO    L_876CC                      * 87627
L_8762B:
            RSTK=C                               * 8762B
            C=D     A                            * 8762D
            RSTK=C                               * 8762F
            CD1EX                                * 87631
            RSTK=C                               * 87634
            GOSUB   SUB_87D15                    * 87636
            GOSUB   SUB_87B4C                    * 8763A
            GOSUB   Save2ABR0                    * 8763E
            GOSUB   SUB_87BC4                    * 87642
            GOSUB   Get2ABR0                     * 87646
            GOSUBL  SUB_87E4C                    * 8764A
            GOSUB   Save2ABR0                    * 87650
            GOSUB   SUB_87B95                    * 87654
            GOSUB   Get2ABR0                     * 87658
            GOSUB   SUB_87E34                    * 8765C
            GOSUB   SUB_87B95                    * 87660
            GOSUB   SUB_87AAD                    * 87664
            GOC     L_876C4                      * 87668
            GOSUB   PutAB%1~jump                 * 8766B
            GOSUB   RCAB0~jump                   * 8766F
            GOSUB   SUB_87AAD                    * 87673
            GOC     L_876C4                      * 87677
            GOSUB   PutAB%1~jump                 * 8767A
            GOSUB   Get2ABR0                     * 8767E
            GOSUB   Save2ABR0                    * 87682
            GOSUB   Get2ABR0                     * 87686
            GOSUB   SUB_87E4C                    * 8768A
            GOSUB   Save2ABR0                    * 8768E
            GOSUB   SUB_87B95                    * 87692
            C=RSTK                               * 87696
            CD1EX                                * 87698
            RSTK=C                               * 8769B
            GOSUB   SUB_87BA1                    * 8769D
            GOSUB   Get2ABR0                     * 876A1
            GOSUB   SUB_87E34                    * 876A5
            C=RSTK                               * 876A9
            D0=C                                 * 876AB
            GOSUB   SUB_87AAD                    * 876AE
            GOC     L_876C4                      * 876B2
            GOSUB   PUTAB0~jump_2                * 876B5
            GOSUB   RCAB0~jump                   * 876B9
            GOSUB   SUB_87AAD                    * 876BD
            GONC    L_876C8                      * 876C1
L_876C4:
            GOTO    L_87184                      * 876C4
L_876C8:
            GOSUB   PUTAB0~jump_2                * 876C8
L_876CC:
            GOSUB   SUB_87B38                    * 876CC
            GOSUB   Save2ABR0                    * 876D0
            GOSUB   SUB_87BA1                    * 876D4
            GOSUB   Get2ABR0                     * 876D8
            GOSUB   SUB_87E4C                    * 876DC
            GOSUB   Save2ABR0                    * 876E0
            C=RSTK                               * 876E4
            D0=C                                 * 876E6
            GOSUB   SUB_87B38                    * 876E9
            CD0EX                                * 876ED
            RSTK=C                               * 876F0
            GOSUB   SUB_87E34                    * 876F2
            GOSUB   SUB_87AAD                    * 876F6
            GOC     L_876C4                      * 876FA
            GOSUB   PutAB%1~jump                 * 876FD
            GOSUB   EXAB0~jump_3                 * 87701
            GOSUB   SUB_87AAD                    * 87705
            GOC     L_876C4                      * 87709
            GOSUB   PutAB%1~jump                 * 8770C
            GOSUB   EXAB0~jump_3                 * 87710
            GOSBVL  CkATTNcode                   * 87714
            C=RSTK                               * 8771B
            D=C     A                            * 8771D
            C=RSTK                               * 8771F
            C=C-1   A                            * 87721
            GOC     L_8772A                      * 87723
            GOTO    L_8762B                      * 87726
L_8772A:
            GOSUB   SUB_87CA7                    * 8772A
            GOSUB   SUB_87B2C                    * 8772E
            SETDEC                               * 87732
            GOSUBL  HypotABR0                    * 87734
            GOSUB   SUB_87CDE                    * 8773A
            GOLONG  L_87F49                      * 8773E
L_87744:
            C=R4                                 * 87744
            D1=C                                 * 87747
            D1=D1+  10                           * 8774A
            C=DAT1  S                            * 8774D
            ?C#0    S                            * 87751
            GOYES   L_8775A                      * 87754
            GOTO    L_87807                      * 87756
L_8775A:
            SETDEC                               * 8775A
            A=0     W                            * 8775C
            A=A-1   A                            * 8775F
            B=0     W                            * 87761
            P=      14                           * 87764
            LC(1)   #5                           * 87766
            B=C     P                            * 87769
            P=      0                            * 8776C
            LC(3)   #0CE                         * 8776E
            GOSUB   SUB_87B5F                    * 87773
            D1=D1+  16                           * 87777
            D1=D1+  5                            * 8777A
            GOSUB   GETAB1~jump                  * 8777D
            GOSUB   SUB_87977                    * 87781
            GOSUB   SUB_87C09                    * 87785
            GOSUB   STAB2~jump_6                 * 87789
            D1=D1+  16                           * 8778D
            D1=D1+  5                            * 87790
            GOSUB   Get2ABR0                     * 87793
            GOSUBL  HypotABR0                    * 87797
            GOSUB   STAB0~jump_6                 * 8779D
            GOSUB   RCCD2~jump_6                 * 877A1
            GOSUB   L_87961                      * 877A5
            GOSUB   RCCD0~jump_6                 * 877A9
            GOSUB   SubCDTest                    * 877AD
            ?B=0    WP                           * 877B1
            GOYES   L_877BA                      * 877B4
            GOTO    L_87541                      * 877B6
L_877BA:
            GOSUB   SUB_87BC4                    * 877BA
            GOSUB   GETAB1~jump                  * 877BE
            GOSUB   STAB0~jump_6                 * 877C2
            GOSUB   SUB_87BC4                    * 877C6
            GOSUB   GETAB1~jump                  * 877CA
            GOSUB   SUB_8798A                    * 877CE
            GOSUB   STAB2~jump_6                 * 877D2
            GOSUB   SUB_87D0A                    * 877D6
            SETDEC                               * 877DA
            GOSUB   RCCD2~jump_6                 * 877DC
            GOSUB   MULTF~jump_5                 * 877E0
            GOSUB   RCCD0~jump_6                 * 877E4
            GOSUB   XYEX~jump_4                  * 877E8
            GOSUB   SubCDTest                    * 877EC
            GOC     L_877F7                      * 877F0
            GOTO    L_878BF                      * 877F3
L_877F7:
            P=      0                            * 877F7
            LC(5)   #0C001                       * 877F9
            GOVLNG  GPErrjmpC                    * 87800
L_87807:
            D1=D1+  1                            * 87807
            C=DAT1  S                            * 8780A
            ?C#0    S                            * 8780E
            GOYES   L_87866                      * 87811
            C=C+1   S                            * 87813
            DAT1=C  S                            * 87816
            GOSUB   SUB_87D83                    * 8781A
            SETDEC                               * 8781E
            GOSUB   SUB_8798A                    * 87820
            GOSUB   SUB_87913                    * 87824
            GOSUB   GETAB1~jump                  * 87828
            GOSUB   STAB2~jump_6                 * 8782C
            GOSUB   DIVF~jump_3                  * 87830
            GOSUB   SUB_87CB2                    * 87834
            GOSUB   SUB_87BBE                    * 87838
            GOSUB   Get2ABR0                     * 8783C
            GOSUB   SUB_87B95                    * 87840
            GOSUB   SUB_87B28                    * 87844
            GOSUB   SUB_87BBE                    * 87848
            GOSUB   Get1%CD~jump                 * 8784C
            SETDEC                               * 87850
            GOSUB   RCAB2~jump_3                 * 87852
            GOSUB   DIVF~jump_3                  * 87856
            GOSUB   SUB_87B89                    * 8785A
            GOSUB   L_87B63                      * 8785E
            GOTO    L_87573                      * 87862
L_87866:
            GOSUB   SUB_87D57                    * 87866
            GOSUB   SUB_87B4C                    * 8786A
            GOSUB   Save2ABR0                    * 8786E
            GOSUB   SUB_87BB2                    * 87872
            GOSUB   GETAB1~jump                  * 87876
            C=0     W                            * 8787A
            P=      12                           * 8787D
            LC(3)   #125                         * 8787F
            D=C     W                            * 87884
            C=0     M                            * 87887
            C=-C-1  S                            * 8788A
            GOSUB   XYEX~jump_4                  * 8788D
            GOSUB   DIVF~jump_3                  * 87891
            GOSUB   STAB0~jump_6                 * 87895
            A=0     W                            * 87899
            B=0     W                            * 8789C
            P=      14                           * 8789F
            B=B+1   P                            * 878A1
            GOSUB   EXAB0~jump_3                 * 878A4
            GOSUB   SUB_87E4C                    * 878A8
            GOSUB   SUB_87CC8                    * 878AC
            GOSUB   SUB_87B2C                    * 878B0
            GOSBVL  CkATTNcode                   * 878B4
            GOTO    L_87573                      * 878BB
L_878BF:
            GOSUB   SUB_87D57                    * 878BF
            GOSUB   SUB_87B4C                    * 878C3
            GOSUB   SUB_879A7                    * 878C7
            C=C-1   A                            * 878CB
            R0=C                                 * 878CD
            GOSUB   SUB_87DCE                    * 878D0
            D0=C                                 * 878D4
            C=R0                                 * 878D7
            GOSUB   SUB_87E09                    * 878DA
            C=R0                                 * 878DE
            C=C+1   A                            * 878E1
            C=C+C   A                            * 878E3
            C=C-1   A                            * 878E5
            B=C     A                            * 878E7
L_878E9:
            A=DAT1  A                            * 878E9
            D1=D1+  5                            * 878EC
            DAT0=A  A                            * 878EF
            D0=D0+  5                            * 878F2
            A=DAT1  W                            * 878F5
            D1=D1+  16                           * 878F9
            DAT0=A  W                            * 878FC
            D0=D0+  16                           * 87900
            GOSBVL  CkATTNcode                   * 87903
            B=B-1   A                            * 8790A
            GONC    L_878E9                      * 8790C
            GOTO    L_871DF                      * 8790F

* refs (6): 874C6 87545 87824 8798A 87FC7 88024
SUB_87913:
            C=B     W                            * 87913
            D=C     W                            * 87916
            C=A     W                            * 87919
            RTN                                  * 8791C

* refs (4): 87190 87220 87309 875FF
SUB_8791E:
            SETHEX                               * 8791E
            A=R4                                 * 87920
            D1=A                                 * 87923
            P=      0                            * 87926
            LC(5)   #00272                       * 87928
            A=A+C   A                            * 8792F
            RTN                                  * 87931

* refs (4): 877E8 8788D 87FF7 8825D
XYEX~jump_4:
            GOVLNG  XYEX                         * 87933

* refs (15): 87277 872BC 8754D 87789 877D2 8782C ...
STAB2~jump_6:
            GOVLNG  STAB2                        * 8793A

* refs (11): 872C2 873E9 87496 874CA 874D5 875BB ...
RCAB0~jump:
            GOVLNG  RCAB0                        * 87941

* refs (4): 87852 87EE1 88091 880A7
RCAB2~jump_3:
            GOVLNG  RCAB2                        * 87948

* refs (8): 8738E 873DA 877A9 877E4 8795D 87977 ...
RCCD0~jump_6:
            GOVLNG  RCCD0                        * 8794F

* refs (15): 872CD 874A4 874E1 8755F 877A1 877DC ...
RCCD2~jump_6:
            GOVLNG  RCCD2                        * 87956

* refs (2): 881B9 882E1
SUB_8795D:
            GOSUB   RCCD0~jump_6                 * 8795D
L_87961:
            CD0EX                                * 87961
            RSTK=C                               * 87964
            CD0EX                                * 87966
            GOSBVL  RADDF                        * 87969
            C=RSTK                               * 87970
            D0=C                                 * 87972
            RTN                                  * 87975

* refs (3): 87781 87B71 880AB
SUB_87977:
            GOSUB   RCCD0~jump_6                 * 87977

* refs (9): 872F6 873F8 87423 87589 877E0 87986 ...
MULTF~jump_5:
            GOVLNG  MULTF                        * 8797B

* refs (9): 87346 8738A 8740E 87E64 87E87 87E9B ...
SUB_87982:
            GOSUB   GETCD0~jump                  * 87982
            GOTO    MULTF~jump_5                 * 87986

* refs (6): 877CE 87820 882A0 882AA 882D1 882DB
SUB_8798A:
            GOSUB   SUB_87913                    * 8798A
            GOTO    MULTF~jump_5                 * 8798E

* refs (10): 872D1 873B6 874E5 87830 87856 87891 ...
DIVF~jump_3:
            GOVLNG  DIVF                         * 87992

* refs (2): 87FAC 8824D
SUB_87999:
            GOVLNG  L_2BBD9                      * 87999

* refs (3): 8749A 880AF 8823F
SUB_879A0:
            GOVLNG  L_2BBBC                      * 879A0

* refs (6): 8720C 8721C 87251 878C7 87A66 87AA6
SUB_879A7:
            SETDEC                               * 879A7
            GOSBVL  PACK                         * 879A9
            GOSUB   EXAB0~jump_3                 * 879B0
            GOSBVL  PACK                         * 879B4
            AR0EX                                * 879BB
            C=R4                                 * 879BE
            D1=C                                 * 879C1
            D1=D1+  12                           * 879C4
            C=DAT1  A                            * 879C7
            D0=C                                 * 879CA
            DAT0=A  W                            * 879CD
            D0=D0+  16                           * 879D1
            A=R0                                 * 879D4
            DAT0=A  W                            * 879D7
            D0=D0+  16                           * 879DB
            GOSBVL  CkATTNcode                   * 879DE
            CD0EX                                * 879E5
            DAT1=C  A                            * 879E8
            D1=D1-  12                           * 879EB
            C=DAT1  A                            * 879EE
            C=C-1   A                            * 879F1
            DAT1=C  A                            * 879F3
            ?C#0    A                            * 879F6
            RTNYES                               * 879F9
            P=      0                            * 879FB
            GOVLNG  GETPTRLOOP                   * 879FD

* refs (2): 87157 871D9
SUB_87A04:
            A=R4                                 * 87A04
            A=C     S                            * 87A07
            R4=A                                 * 87A0A
            D1=A                                 * 87A0D
            C=DAT1  A                            * 87A10
L_87A13:
            R0=C                                 * 87A13
            GOSUB   SUB_87DC6                    * 87A16
            ?B#0    W                            * 87A1A
            RTNYES                               * 87A1D
            GOSUB   GETAB1~jump                  * 87A1F
            ?B#0    W                            * 87A23
            RTNYES                               * 87A26
            CD1EX                                * 87A28
            D0=C                                 * 87A2B
            C=R0                                 * 87A2E
            GOSBVL  SUB_3769A                    * 87A31
            C=D     A                            * 87A38
            GOSBVL  MOVEDOWN                     * 87A3A
            A=0     W                            * 87A41
            C=R4                                 * 87A44
            ?C=0    S                            * 87A47
            GOYES   L_87A57                      * 87A4A
            A=A+1   M                            * 87A4C
            P=      14                           * 87A4F
            B=B+1   P                            * 87A51
            GONC    L_87A62                      * 87A54
L_87A57:
            SETDEC                               * 87A57
            GOSBVL  L_2A141                      * 87A59
            SETHEX                               * 87A60
L_87A62:
            GOSUB   STAB0~jump_6                 * 87A62
            GOSUB   SUB_879A7                    * 87A66
            GOTO    L_87A13                      * 87A6A

* refs (2): 87160 871E5
SUB_87A6E:
            A=R4                                 * 87A6E
            A=C     S                            * 87A71
            R4=A                                 * 87A74
L_87A77:
            C=0     A                            * 87A77
            GOSUB   SUB_87DC6                    * 87A79
            ?B#0    W                            * 87A7D
            RTNYES                               * 87A80
            GOSUB   GETAB1~jump                  * 87A82
            ?B#0    W                            * 87A86
            RTNYES                               * 87A89
            A=0     W                            * 87A8B
            C=R4                                 * 87A8E
            ?C=0    S                            * 87A91
            GOYES   L_87AA2                      * 87A94
            P=      14                           * 87A96
            B=B+1   P                            * 87A98
            SETDEC                               * 87A9B
            A=A-1   A                            * 87A9D
            A=0     X                            * 87A9F
L_87AA2:
            GOSUB   STAB0~jump_6                 * 87AA2
            GOSUB   SUB_879A7                    * 87AA6
            GOC     L_87A77                      * 87AAA

* refs (7): 871B5 87664 87673 876AE 876BD 876F6 ...
SUB_87AAD:
            SETDEC                               * 87AAD
            C=A     A                            * 87AAF
            C=C+C   A                            * 87AB1
            P=      0                            * 87AB3
            LC(5)   #05000                       * 87AB5
            GOC     L_87AC6                      * 87ABC
            ?C<=A   A                            * 87ABF
            RTNYES                               * 87AC2
            RTN                                  * 87AC4
L_87AC6:
            C=-C    A                            * 87AC6
            ?C>A    A                            * 87AC8
            GOYES   L_87ACF                      * 87ACB
            RTN                                  * 87ACD
L_87ACF:
            A=0     W                            * 87ACF
            B=0     W                            * 87AD2
            RTNCC                                * 87AD5

* refs (12): 873DE 8748B 874A8 874CE 875A0 875C6 ...
* A/B = A/B - C/D; carry set when the result is >= 0; decimal mode
SubCDTest:
            SETDEC                               * 87AD7
            C=-C-1  S                            * 87AD9
            GOSUB   L_87961                      * 87ADC
            P=      14                           * 87AE0
            ?B=0    WP                           * 87AE2
            RTNYES                               * 87AE5
            ?A=0    S                            * 87AE7
            RTNYES                               * 87AEA
            RTN                                  * 87AEC

* refs (3): 8761B 8816B 88195
SUB_87AEE:
            GOSUB   PUTAB0~jump_2                * 87AEE
L_87AF2:
            GOSUB   EXAB0~jump_3                 * 87AF2
            GOSUB   PUTAB0~jump_2                * 87AF6

* refs (23): 8755B 87567 87701 87710 878A4 879B0 ...
EXAB0~jump_3:
            GOVLNG  EXAB0                        * 87AFA

* refs (16): 87233 87289 8763E 87650 87682 8768E ...
* Store A/B, then R0/R1, as two %% at R4+#1F4 (R4: the library's workspace hex string); A/B and R0/R1 come back unchanged
Save2ABR0:
            GOSUB   SUB_87C4B                    * 87B01
            GOTO    L_87AF2                      * 87B05

* refs (1): 881F7
SUB_87B09:
            GOSUB   SUB_87C73                    * 87B09
            GOSUB   SUB_87C16                    * 87B0D
            GOSUB   GETAB0~jump                  * 87B11
            GOSUB   EXAB0~jump_3                 * 87B15
            GOSUB   SUB_87C16                    * 87B19
            A=C     W                            * 87B1D
            C=D     W                            * 87B20
            B=C     W                            * 87B23
            RTN                                  * 87B26

* refs (5): 8756F 87844 880EC 881EB 88203
SUB_87B28:
            GOSUB   PutAB%1~jump                 * 87B28

* refs (5): 875E3 87623 8772E 878B0 88062
SUB_87B2C:
            GOSUB   EXAB0~jump_3                 * 87B2C
            GOSUB   PutAB%1~jump                 * 87B30
            GOTO    EXAB0~jump_3                 * 87B34

* refs (4): 876CC 876E9 88183 881C6
SUB_87B38:
            GOSUB   GETAB0~jump                  * 87B38
            GOSUB   STAB0~jump_6                 * 87B3C
            GOSUB   GETAB0~jump                  * 87B40
            GOTO    EXAB0~jump_3                 * 87B44

* refs (25): 8722D 8723F 87324 87360 87551 875DB ...
* D1 -> two unsplit %%: first into A/B, second into R0/R1, D1 past both
Get2ABR0:
            GOSUB   GETAB1~jump                  * 87B48

* refs (10): 87216 87283 8729E 8744F 8763A 8786A ...
SUB_87B4C:
            GOSUB   STAB0~jump_6                 * 87B4C
            GOSUB   GETAB1~jump                  * 87B50
            GOTO    EXAB0~jump_3                 * 87B54

* refs (2): 8813F 88147
SUB_87B58:
            GOSUB   SUB_87B79                    * 87B58
            GONC    L_87B63                      * 87B5C

* refs (2): 87773 880A3
SUB_87B5F:
            GOSUB   SUB_87DB0                    * 87B5F
L_87B63:
            SETDEC                               * 87B63
            GOSUB   STAB0~jump_6                 * 87B65
            GOSUB   SUB_87B6D                    * 87B69

* refs (1): 87B69
SUB_87B6D:
            GOSUB   GETAB1~jump                  * 87B6D
            GOSUB   SUB_87977                    * 87B71
            GOTO    SUB_87C09                    * 87B75

* refs (2): 87B58 88077
SUB_87B79:
            A=0     W                            * 87B79
            B=0     W                            * 87B7C
            P=      14                           * 87B7F
            B=B+1   P                            * 87B81
            B=B+1   P                            * 87B84
            RTN                                  * 87B87

* refs (6): 875E7 8785A 88018 88089 880E8 8814B
SUB_87B89:
            D1=D1-  16                           * 87B89
            D1=D1-  5                            * 87B8C

* refs (1): 87F49
SUB_87B8F:
            D1=D1-  16                           * 87B8F
            D1=D1-  5                            * 87B92

* refs (9): 87239 874E9 87654 87660 87692 87840 ...
SUB_87B95:
            D1=D1-  16                           * 87B95
            D1=D1-  5                            * 87B98
            D1=D1-  16                           * 87B9B
            D1=D1-  5                            * 87B9E

* refs (8): 87402 875D7 8769D 876D4 8800C 88118 ...
SUB_87BA1:
            D1=D1-  16                           * 87BA1
            D1=D1-  16                           * 87BA4
            D1=D1-  10                           * 87BA7
            RTN                                  * 87BAA

* refs (1): 87514
SUB_87BAC:
            D1=D1+  16                           * 87BAC
            D1=D1+  5                            * 87BAF

* refs (2): 8747C 87872
SUB_87BB2:
            D1=D1+  16                           * 87BB2
            D1=D1+  5                            * 87BB5
            D1=D1+  16                           * 87BB8
            D1=D1+  5                            * 87BBB

* refs (4): 8756B 87838 87848 88066
SUB_87BBE:
            D1=D1+  16                           * 87BBE
            D1=D1+  5                            * 87BC1

* refs (7): 87227 87642 877BA 877C6 88143 88157 ...
SUB_87BC4:
            D1=D1+  16                           * 87BC4
            D1=D1+  16                           * 87BC7
            D1=D1+  10                           * 87BCA
            RTN                                  * 87BCD
            NIBHEX  18F18418F184                 * 87BCF  ā.Hā.H

* refs (1): 88167
SUB_87BDB:
            D0=D0-  16                           * 87BDB
            D0=D0-  5                            * 87BDE

* refs (2): 8734A 87384
SUB_87BE1:
            D0=D0-  16                           * 87BE1
            D0=D0-  5                            * 87BE4

* refs (5): 87E60 87E8F 87ED9 87EF1 881C2
SUB_87BE7:
            D0=D0-  16                           * 87BE7
            D0=D0-  16                           * 87BEA
            D0=D0-  10                           * 87BED
            RTN                                  * 87BF0

* refs (1): 87E97
SUB_87BF2:
            D0=D0+  16                           * 87BF2
            D0=D0+  5                            * 87BF5
            D0=D0+  16                           * 87BF8
            D0=D0+  5                            * 87BFB
            D0=D0+  16                           * 87BFE
            D0=D0+  16                           * 87C01
            D0=D0+  10                           * 87C04
            RTN                                  * 87C07

* refs (7): 871BB 872FA 875AD 875D3 87785 87B75 ...
SUB_87C09:
            D1=D1-  16                           * 87C09
            D1=D1-  5                            * 87C0C

* refs (15): 87120 8743F 87443 875F1 875F5 8766B ...
PutAB%1~jump:
            GOVLNG  PutAB%1                      * 87C0F

* refs (6): 8731E 87338 87396 873CE 87B0D 87B19
SUB_87C16:
            D0=D0-  16                           * 87C16
            D0=D0-  5                            * 87C19

* refs (7): 8735A 876B5 876C8 87AEE 87AF6 87C62 ...
PUTAB0~jump_2:
            GOVLNG  PUTAB0                       * 87C1C

* refs (2): 872E2 8742D
SUB_87C23:
            D1=D1-  16                           * 87C23
            D1=D1-  5                            * 87C26

* refs (19): 871A3 87271 87406 87549 8777D 877BE ...
GETAB1~jump:
            GOVLNG  GETAB1                       * 87C29

* refs (7): 8733E 8737E 87B11 87B38 87B40 87E93 ...
GETAB0~jump:
            GOVLNG  GETAB0                       * 87C30

* refs (5): 87480 87599 875BF 8784C 8806A
Get1%CD~jump:
            GOVLNG  Get1%CD                      * 87C37

* refs (2): 87E4C 87EA7
SUB_87C3E:
            P=      0                            * 87C3E
            LC(5)   #0025D                       * 87C40
            GOTO    L_87C54                      * 87C47

* refs (3): 87B01 87F57 8821F
SUB_87C4B:
            P=      0                            * 87C4B
            LC(5)   #001F4                       * 87C4D
L_87C54:
            D=C     A                            * 87C54
            C=R4                                 * 87C56
            SETHEX                               * 87C59
            C=C+D   A                            * 87C5B
            SETDEC                               * 87C5D
            D0=C                                 * 87C5F
            GOTO    PUTAB0~jump_2                * 87C62

* refs (1): 87E50
SUB_87C66:
            P=      0                            * 87C66
            LC(5)   #00209                       * 87C68
            GOTO    L_87C7C                      * 87C6F

* refs (2): 87B09 87E34
SUB_87C73:
            P=      0                            * 87C73
            LC(5)   #001F4                       * 87C75
L_87C7C:
            D=C     A                            * 87C7C
            C=R4                                 * 87C7E
            SETHEX                               * 87C81
            C=C+D   A                            * 87C83
            SETDEC                               * 87C85
            D0=C                                 * 87C87

* refs (7): 87350 873B0 873BD 87982 87E40 87EF5 ...
GETCD0~jump:
            GOVLNG  GETCD0                       * 87C8A

* refs (1): 87FBB
SUB_87C91:
            P=      0                            * 87C91
            LC(3)   #011                         * 87C93
            GOTO    L_87D99                      * 87C98

* refs (1): 87300
SUB_87C9C:
            P=      0                            * 87C9C
            LC(3)   #050                         * 87C9E
            GOTO    L_87D99                      * 87CA3

* refs (2): 875DF 8772A
SUB_87CA7:
            P=      0                            * 87CA7
            LC(3)   #07A                         * 87CA9
            GOTO    L_87D99                      * 87CAE

* refs (1): 87834
SUB_87CB2:
            P=      0                            * 87CB2
            LC(3)   #10D                         * 87CB4
            GOTO    L_87D99                      * 87CB9

* refs (1): 87433
SUB_87CBD:
            P=      0                            * 87CBD
            LC(3)   #122                         * 87CBF
            GOTO    L_87D99                      * 87CC4

* refs (1): 878AC
SUB_87CC8:
            P=      0                            * 87CC8
            LC(3)   #137                         * 87CCA
            GOTO    L_87D99                      * 87CCF

* refs (1): 8805E
SUB_87CD3:
            P=      0                            * 87CD3
            LC(3)   #161                         * 87CD5
            GOTO    L_87D99                      * 87CDA

* refs (2): 8745B 8773A
SUB_87CDE:
            P=      0                            * 87CDE
            LC(3)   #18B                         * 87CE0
            GOTO    L_87D99                      * 87CE5

* refs (1): 874D9
SUB_87CE9:
            P=      0                            * 87CE9
            LC(3)   #1A0                         * 87CEB
            GOTO    L_87D99                      * 87CF0

* refs (1): 8725F
SUB_87CF4:
            P=      0                            * 87CF4
            LC(3)   #1CA                         * 87CF6
            GOTO    L_87D99                      * 87CFB

* refs (1): 873FC
SUB_87CFF:
            P=      0                            * 87CFF
            LC(3)   #1DF                         * 87D01
            GOTO    L_87D99                      * 87D06

* refs (1): 877D6
SUB_87D0A:
            P=      0                            * 87D0A
            LC(3)   #011                         * 87D0C
            GOTO    L_87DA1                      * 87D11

* refs (2): 87210 87636
SUB_87D15:
            P=      0                            * 87D15
            LC(3)   #026                         * 87D17
            GOTO    L_87DA1                      * 87D1C

* refs (1): 8804A
SUB_87D20:
            P=      0                            * 87D20
            LC(3)   #050                         * 87D22
            GOTO    L_87DA1                      * 87D27

* refs (1): 87541
SUB_87D2B:
            P=      0                            * 87D2B
            LC(3)   #0A4                         * 87D2D
            GOTO    L_87DA1                      * 87D32

* refs (1): 87FEF
SUB_87D36:
            P=      0                            * 87D36
            LC(3)   #0F8                         * 87D38
            GOTO    L_87DA1                      * 87D3D

* refs (1): 87573
SUB_87D41:
            P=      0                            * 87D41
            LC(3)   #10D                         * 87D43
            GOTO    L_87DA1                      * 87D48

* refs (1): 87470
SUB_87D4C:
            P=      0                            * 87D4C
            LC(3)   #122                         * 87D4E
            GOTO    L_87DA1                      * 87D53

* refs (2): 87866 878BF
SUB_87D57:
            P=      0                            * 87D57
            LC(3)   #137                         * 87D59
            GOTO    L_87DA1                      * 87D5E

* refs (1): 880BF
SUB_87D62:
            P=      0                            * 87D62
            LC(3)   #161                         * 87D64
            GOTO    L_87DA1                      * 87D69

* refs (1): 87FC3
SUB_87D6D:
            P=      0                            * 87D6D
            LC(3)   #18B                         * 87D6F
            GOTO    L_87DA1                      * 87D74

* refs (1): 88124
SUB_87D78:
            P=      0                            * 87D78
            LC(3)   #1B5                         * 87D7A
            GOTO    L_87DA1                      * 87D7F

* refs (3): 872B6 8781A 880CF
SUB_87D83:
            P=      0                            * 87D83
            LC(3)   #1CA                         * 87D85
            GOTO    L_87DA1                      * 87D8A

* refs (1): 874C0
SUB_87D8E:
            P=      0                            * 87D8E
            LC(3)   #1DF                         * 87D90
            GOTO    L_87DA1                      * 87D95
L_87D99:
            GOSUB   SUB_87DB0                    * 87D99
            GOTO    PutAB%1~jump                 * 87D9D
L_87DA1:
            GOSUB   SUB_87DB0                    * 87DA1
            GOTO    GETAB1~jump                  * 87DA5

* refs (2): 87F14 8813B
SUB_87DA9:
            P=      0                            * 87DA9
            LC(3)   #026                         * 87DAB

* refs (4): 8750B 87B5F 87D99 87DA1
SUB_87DB0:
            SETHEX                               * 87DB0
            P=      3                            * 87DB2
            LC(2)   #00                          * 87DB4
            P=      0                            * 87DB8
            D=C     A                            * 87DBA
            C=R4                                 * 87DBC
            C=C+D   A                            * 87DBF
            D1=C                                 * 87DC1
            RTN                                  * 87DC4

* refs (5): 8727D 87298 87449 87A16 87A79
SUB_87DC6:
            GOSUB   SUB_87DCE                    * 87DC6
            GOTO    GETAB1~jump                  * 87DCA

* refs (3): 878D0 87DC6 87F20
SUB_87DCE:
            SETHEX                               * 87DCE
            D=C     A                            * 87DD0
            C=R4                                 * 87DD2
            D1=C                                 * 87DD5
            C=DAT1  A                            * 87DD8
            C=C-D   A                            * 87DDB
            GOSBVL  SUB_3769A                    * 87DDD
            P=      0                            * 87DE4
            LC(5)   #00272                       * 87DE6
L_87DED:
            D=D+C   A                            * 87DED
            CD1EX                                * 87DEF
            C=C+D   A                            * 87DF2
            D1=C                                 * 87DF4
            RTN                                  * 87DF7

* refs (1): 8761F
SUB_87DF9:
            GOSUB   SUB_87E09                    * 87DF9
            GOTO    PutAB%1~jump                 * 87DFD

* refs (1): 87F6C
SUB_87E01:
            GOSUB   SUB_87E09                    * 87E01
            GOTO    GETAB1~jump                  * 87E05

* refs (3): 878DA 87DF9 87E01
SUB_87E09:
            SETHEX                               * 87E09
            D=C     A                            * 87E0B
            C=R4                                 * 87E0D
            D1=C                                 * 87E10
            C=DAT1  A                            * 87E13
            D=C-D   A                            * 87E16
            D1=D1+  5                            * 87E18
            C=DAT1  A                            * 87E1B
            C=C+D   A                            * 87E1E
            GOSBVL  SUB_3769A                    * 87E20
            P=      0                            * 87E27
            LC(5)   #00297                       * 87E29
            GOTO    L_87DED                      * 87E30

* refs (5): 8765C 876A5 876F2 88187 881D3
SUB_87E34:
            GOSUB   SUB_87C73                    * 87E34
            GOSUB   L_87961                      * 87E38
            GOSUB   EXAB0~jump_3                 * 87E3C
            GOSUB   GETCD0~jump                  * 87E40
            GOSUB   L_87961                      * 87E44
            GOTO    EXAB0~jump_3                 * 87E48

* refs (7): 8764A 8768A 876DC 878A8 880C7 8815F ...
SUB_87E4C:
            GOSUB   SUB_87C3E                    * 87E4C

* refs (1): 87EED
SUB_87E50:
            GOSUB   SUB_87C66                    * 87E50
            GOSUB   MULTF~jump_5                 * 87E54
            GOSUB   STAB2~jump_6                 * 87E58
            GOSUB   RCAB0~jump                   * 87E5C
            GOSUB   SUB_87BE7                    * 87E60
            GOSUB   SUB_87982                    * 87E64
            GOSUB   RCCD2~jump_6                 * 87E68
            CD0EX                                * 87E6C
            RSTK=C                               * 87E6F
            CD0EX                                * 87E71
            GOSBVL  RADDF                        * 87E74
            C=RSTK                               * 87E7B
            D0=C                                 * 87E7D
            GOSUB   EXAB0~jump_3                 * 87E80
            A=-A-1  S                            * 87E84
            GOSUB   SUB_87982                    * 87E87
            GOSUB   STAB2~jump_6                 * 87E8B
            GOSUB   SUB_87BE7                    * 87E8F
            GOSUB   GETAB0~jump                  * 87E93
            GOSUB   SUB_87BF2                    * 87E97
            GOSUB   SUB_87982                    * 87E9B
            GOSUB   RCCD2~jump_6                 * 87E9F
            GOTO    L_87961                      * 87EA3

* refs (6): 8724B 872A4 8805A 880E4 881E3 881FB
SUB_87EA7:
            GOSUB   SUB_87C3E                    * 87EA7
            GOSUB   EXAB0~jump_3                 * 87EAB
            A=-A-1  S                            * 87EAF
            GOSUB   STAB2~jump_6                 * 87EB2
            GOSUB   SUB_882D1                    * 87EB6
            P=      14                           * 87EBA
            ?B#0    WP                           * 87EBC
            GOYES   L_87ED9                      * 87EBF
            B=0     S                            * 87EC1
            B=B+1   P                            * 87EC4
            C=0     W                            * 87EC7
            P=      3                            * 87ECA
            LC(1)   #5                           * 87ECC
            A=C     W                            * 87ECF

* refs (17): 872B0 87378 87476 8749E 8758D 8779D ...
STAB0~jump_6:
            GOVLNG  STAB0                        * 87ED2
L_87ED9:
            GOSUB   SUB_87BE7                    * 87ED9
            GOSUB   PUTAB0~jump_2                * 87EDD
            GOSUB   RCAB2~jump_3                 * 87EE1
            GOSUB   STAB0~jump_6                 * 87EE5
            GOSUB   GETAB0~jump                  * 87EE9
            GOSUB   SUB_87E50                    * 87EED
            GOSUB   SUB_87BE7                    * 87EF1
            GOSUB   GETCD0~jump                  * 87EF5
            GOSBVL  STCD2                        * 87EF9
            GOSUB   DIVF~jump_3                  * 87F00
            GOSUB   EXAB0~jump_3                 * 87F04
            GOSUB   RCCD2~jump_6                 * 87F08
            GOSUB   DIVF~jump_3                  * 87F0C
            GOTO    EXAB0~jump_3                 * 87F10

* refs (2): 87200 87265
SUB_87F14:
            GOSUB   SUB_87DA9                    * 87F14
            D0=C                                 * 87F18
            C=0     A                            * 87F1B
            LC(1)   #2                           * 87F1D
            GOSUB   SUB_87DCE                    * 87F20
            LC(1)   #5                           * 87F24
L_87F27:
            A=DAT1  A                            * 87F27
            D1=D1+  5                            * 87F2A
            DAT0=A  A                            * 87F2D
            D0=D0+  5                            * 87F30
            A=DAT1  W                            * 87F33
            D1=D1+  16                           * 87F37
            DAT0=A  W                            * 87F3A
            D0=D0+  16                           * 87F3E
            C=C-1   P                            * 87F41
            GONC    L_87F27                      * 87F44
            RTN                                  * 87F47
L_87F49:
            GOSUB   SUB_87B8F                    * 87F49
            GOSUB   Get2ABR0                     * 87F4D
            SETDEC                               * 87F51
            GOSUB   HypotABR0                    * 87F53
            GOSUB   SUB_87C4B                    * 87F57
            C=R4                                 * 87F5B
            D1=C                                 * 87F5E
            C=DAT1  A                            * 87F61
            SETHEX                               * 87F64
            C=C-1   A                            * 87F66
            RSTK=C                               * 87F68
            C=C+1   A                            * 87F6A
            GOSUB   SUB_87E01                    * 87F6C
            GOSUB   SUB_87B4C                    * 87F70
            SETDEC                               * 87F74
            GOSUB   HypotABR0                    * 87F76
L_87F7A:
            SETDEC                               * 87F7A
            D0=D0-  16                           * 87F7C
            D0=D0-  5                            * 87F7F
            GOSUB   SUB_87982                    * 87F82
            GOSUB   STAB2~jump_6                 * 87F86
            GOSUB   Get2ABR0                     * 87F8A
            GOSUB   HypotABR0                    * 87F8E
            GOSUB   RCCD2~jump_6                 * 87F92
            GOSUB   L_87961                      * 87F96
            GOSBVL  CkATTNcode                   * 87F9A
            C=RSTK                               * 87FA1
            C=C-1   A                            * 87FA3
            RSTK=C                               * 87FA5
            GONC    L_87F7A                      * 87FA7
            SETDEC                               * 87FAA
            GOSUB   SUB_87999                    * 87FAC
            P=      0                            * 87FB0
            LC(5)   #00013                       * 87FB2
            A=A-C   A                            * 87FB9
            GOSUB   SUB_87C91                    * 87FBB
            GOSUB   STAB2~jump_6                 * 87FBF
            GOSUB   SUB_87D6D                    * 87FC3
            GOSUB   SUB_87913                    * 87FC7
            GOSBVL  EXAB2                        * 87FCB
            GOSUB   SubCDTest                    * 87FD2
            GONC    L_87FDD                      * 87FD6
            GOTO    L_878BF                      * 87FD9
L_87FDD:
            C=R4                                 * 87FDD
            D1=C                                 * 87FE0
            D1=D1+  10                           * 87FE3
            C=DAT1  S                            * 87FE6
            ?C=0    S                            * 87FEA
            GOYES   L_88008                      * 87FED
            GOSUB   SUB_87D36                    * 87FEF
            GOSUB   RCCD2~jump_6                 * 87FF3
            GOSUB   XYEX~jump_4                  * 87FF7
            GOSUB   SubCDTest                    * 87FFB
            GONC    L_88008                      * 87FFF
            GOLONG  L_87744                      * 88002
L_88008:
            GOSUB   SUB_8804A                    * 88008
            GOSUB   SUB_87BA1                    * 8800C
            GOSUB   GETAB1~jump                  * 88010
            GOSUB   STAB2~jump_6                 * 88014
            GOSUB   SUB_87B89                    * 88018
            GOSUB   Get2ABR0                     * 8801C
            GOSUB   HypotABR0                    * 88020
            GOSUB   SUB_87913                    * 88024
            GOSBVL  EXAB2                        * 88028
            GOSUB   L_87961                      * 8802F
            GOSUB   RCCD2~jump_6                 * 88033
            GOSUB   SubCDTest                    * 88037
            ?B#0    WP                           * 8803B
            GOYES   L_88044                      * 8803E
            GOTO    L_878BF                      * 88040
L_88044:
            GOLONG  L_87470                      * 88044

* refs (2): 8726B 88008
SUB_8804A:
            GOSUB   SUB_87D20                    * 8804A
            GOSUB   SUB_87B4C                    * 8804E
            GOSUB   Save2ABR0                    * 88052
            GOSUB   Get2ABR0                     * 88056
            GOSUB   SUB_87EA7                    * 8805A
            GOSUB   SUB_87CD3                    * 8805E
            GOSUB   SUB_87B2C                    * 88062
            GOSUB   SUB_87BBE                    * 88066
            GOSUB   Get1%CD~jump                 * 8806A
            GOSBVL  STCD2                        * 8806E
            SETDEC                               * 88075
            GOSUB   SUB_87B79                    * 88077
            GOSUB   DIVF~jump_3                  * 8807B
            A=-A-1  S                            * 8807F
            GOSBVL  RADD1                        * 88082
            GOSUB   SUB_87B89                    * 88089
            GOSUB   L_87B63                      * 8808D
            GOSUB   RCAB2~jump_3                 * 88091
            GOSBVL  RSUB1                        * 88095
            P=      0                            * 8809C
            LC(3)   #050                         * 8809E
            GOSUB   SUB_87B5F                    * 880A3
            GOSUB   RCAB2~jump_3                 * 880A7
            GOSUB   SUB_87977                    * 880AB
            GOSUB   SUB_879A0                    * 880AF
            GOSUB   L_87B63                      * 880B3
            GOSUB   SUB_8813B                    * 880B7
            GOSUB   Save2ABR0                    * 880BB
            GOSUB   SUB_87D62                    * 880BF
            GOSUB   SUB_87B4C                    * 880C3
            GOSUB   SUB_87E4C                    * 880C7
            GOSUB   STAB2~jump_6                 * 880CB
            GOSUB   SUB_87D83                    * 880CF
            SETDEC                               * 880D3
            GOSBVL  RSUB1                        * 880D5
            GOSUB   RCCD2~jump_6                 * 880DC
            GOSUB   L_87961                      * 880E0
            GOSUB   SUB_87EA7                    * 880E4
            GOSUB   SUB_87B89                    * 880E8
            GOSUB   SUB_87B28                    * 880EC
            GOSUB   HypotABR0                    * 880F0
            D1=D1+  16                           * 880F4
            D1=D1+  5                            * 880F7
            GOSUB   PutAB%1~jump                 * 880FA
            GOSUB   STAB2~jump_6                 * 880FE
            D1=D1+  16                           * 88102
            D1=D1+  5                            * 88105
            GOSUB   GETAB1~jump                  * 88108
            GOSUB   SQRF~jump_2                  * 8810C
            GOSUB   RCCD2~jump_6                 * 88110
            GOSUB   MULTF~jump_5                 * 88114
            GOSUB   SUB_87BA1                    * 88118
            GOTO    PutAB%1~jump                 * 8811C

* refs (2): 872DC 87427
SUB_88120:
            GOSUB   STAB0~jump_6                 * 88120
            GOSUB   SUB_87D78                    * 88124
            GOSUB   RCCD0~jump_6                 * 88128
            GOSUB   SubCDTest                    * 8812C
            RTNNC                                * 88130
            GOSUB   RCAB0~jump                   * 88133
            GOTO    SUB_87C09                    * 88137

* refs (2): 87206 880B7
SUB_8813B:
            GOSUB   SUB_87DA9                    * 8813B
            GOSUB   SUB_87B58                    * 8813F
            GOSUB   SUB_87BC4                    * 88143
            GOSUB   SUB_87B58                    * 88147
            GOSUB   SUB_87B89                    * 8814B
            GOSUB   Get2ABR0                     * 8814F
            GOSUB   Save2ABR0                    * 88153
            GOSUB   SUB_87BC4                    * 88157
            GOSUB   Get2ABR0                     * 8815B
            GOSUB   SUB_87E4C                    * 8815F
            GOSUB   SUB_88207                    * 88163
            GOSUB   SUB_87BDB                    * 88167
            GOSUB   SUB_87AEE                    * 8816B
            GOSUB   SUB_87B95                    * 8816F
            GOSUB   Get2ABR0                     * 88173
            GOSUB   Save2ABR0                    * 88177
            GOSUB   SUB_87E4C                    * 8817B
            GOSUB   Save2ABR0                    * 8817F
            GOSUB   SUB_87B38                    * 88183
            GOSUB   SUB_87E34                    * 88187
            GOSUB   SUB_88215                    * 8818B
            D0=D0+  16                           * 8818F
            D0=D0+  5                            * 88192
            GOSUB   SUB_87AEE                    * 88195
            GOSUB   SUB_87BA1                    * 88199
            GOSUB   Get2ABR0                     * 8819D
            GOSUB   SUB_88207                    * 881A1
            GOSUB   Save2ABR0                    * 881A5
            GOSUBL  SUB_87982                    * 881A9
            GOSUB   EXAB0~jump_3                 * 881AF
            GOSUBL  SUB_87982                    * 881B3
            GOSUBL  SUB_8795D                    * 881B9
            C=A     S                            * 881BF
            GOSUB   SUB_87BE7                    * 881C2
            GOSUB   SUB_87B38                    * 881C6
            ?C=0    S                            * 881CA
            GOYES   L_881D3                      * 881CD
            GOSUB   SUB_88207                    * 881CF
L_881D3:
            GOSUB   SUB_87E34                    * 881D3
            GOSUB   Save2ABR0                    * 881D7
            GOSUB   SUB_87B95                    * 881DB
            GOSUB   Get2ABR0                     * 881DF
            GOSUB   SUB_87EA7                    * 881E3
            GOSUB   SUB_87BA1                    * 881E7
            GOSUB   SUB_87B28                    * 881EB
            GOSUB   SUB_87BC4                    * 881EF
            GOSUB   Get2ABR0                     * 881F3
            GOSUB   SUB_87B09                    * 881F7
            GOSUB   SUB_87EA7                    * 881FB
            GOSUB   SUB_87B95                    * 881FF
            GOTO    SUB_87B28                    * 88203

* refs (4): 87245 88163 881A1 881CF
SUB_88207:
            A=-A-1  S                            * 88207
            C=R0                                 * 8820A
            C=-C-1  S                            * 8820D
            R0=C                                 * 88210
            RTN                                  * 88213

* refs (1): 8818B
SUB_88215:
            GOSUBL  STAB2~jump_6                 * 88215
            GOSUB   EXAB0~jump_3                 * 8821B
            GOSUB   SUB_87C4B                    * 8821F
            GOSUB   HypotABR0                    * 88223
            ?B#0    W                            * 88227
            GOYES   L_88230                      * 8822A
            GOTO    STAB0~jump_6                 * 8822C
L_88230:
            GOSUBL  RCCD2~jump_6                 * 88230
            C=0     S                            * 88236
            GOSUBL  L_87961                      * 88239
            GOSUBL  SUB_879A0                    * 8823F
            GOSUB   SQRF~jump_2                  * 88245
            GOSUB   STAB0~jump_6                 * 88249
            GOSUBL  SUB_87999                    * 8824D
            D0=D0-  16                           * 88253
            D0=D0-  5                            * 88256
            GOSUB   GETCD0~jump                  * 88259
            GOSUBL  XYEX~jump_4                  * 8825D
            GOSUBL  DIVF~jump_3                  * 88263
            C=R2                                 * 88269
            ?C=0    S                            * 8826C
            GOYES   L_8827F                      * 8826F
            C=R0                                 * 88271
            C=A     S                            * 88274
            R0=C                                 * 88277
            A=0     S                            * 8827A
            RTN                                  * 8827D
L_8827F:
            GOTO    EXAB0~jump_3                 * 8827F

* refs (12): 872AA 8732C 87364 87455 87734 87797 ...
* A/B = sqrt(x^2+y^2) for x in A/B and y in R0/R1 (the modulus of a complex number held as two %%)
HypotABR0:
            P=      14                           * 88283
            C=R1                                 * 88285
            ?C#0    WP                           * 88288
            GOYES   L_88292                      * 8828B
L_8828D:
            A=0     S                            * 8828D
            RTN                                  * 88290
L_88292:
            ?B#0    WP                           * 88292
            GOYES   L_882A0                      * 88295
            GOSUBL  RCAB0~jump                   * 88297
            GONC    L_8828D                      * 8829D
L_882A0:
            GOSUBL  SUB_8798A                    * 882A0
            GOSUB   EXAB0~jump_3                 * 882A6
            GOSUBL  SUB_8798A                    * 882AA
            GOSUBL  RCCD0~jump_6                 * 882B0
            CD0EX                                * 882B6
            RSTK=C                               * 882B9
            CD0EX                                * 882BB
            GOSBVL  RADDF                        * 882BE
            C=RSTK                               * 882C5
            D0=C                                 * 882C7

* refs (2): 8810C 88245
SQRF~jump_2:
            GOVLNG  SQRF                         * 882CA

* refs (1): 87EB6
SUB_882D1:
            GOSUBL  SUB_8798A                    * 882D1
            GOSUB   EXAB0~jump_3                 * 882D7
            GOSUBL  SUB_8798A                    * 882DB
            GOLONG  SUB_8795D                    * 882E1
          ENDCODE                                * 882E7
        ;                                        * 882E7

* ROMPTR 0C0 001
* refs (1): 86FE4
ROMP_0C0_001:
        :: DUP ARSIZE DUPTWO #< casedrop doerr501 * 882EC
          DUP#1- ONE{}N C%0 MAKEARRY 3UNROLL OVER OBJ_7D7F9 ITE * 8830F
          ROMPTR 0C0 002 ROMPTR 0C0 000          * 88337
          DUP OBJ_7D7F9 case MATRE               * 8834D
        ;                                        * 88361

* ROMPTR 0C0 002
* refs (1): 86FE4
ROMP_0C0_002:
        :: # 2A #* # 272 #+ !MAKEHXS             * 88366
          CODE                                   * 8838E  5492 nibbles
            HST=0   3                            * 88398
            D1=D1+  10                           * 8839B
            D=D+1   A                            * 8839E
            D=D+1   A                            * 883A0
            GOSBVL  SAVPTR                       * 883A2
            D1=D1-  10                           * 883A9
            A=DAT1  A                            * 883AC
            D0=A                                 * 883AF
            D0=D0+  10                           * 883B2
            AD0EX                                * 883B5
            R4=A                                 * 883B8
            D1=D1+  10                           * 883BB
            A=DAT1  A                            * 883BE
            D0=A                                 * 883C1
            D0=D0+  15                           * 883C4
            D0=D0+  5                            * 883C7
            A=DAT0  A                            * 883CA
            R1=A                                 * 883CD
            D0=D0+  5                            * 883D0
            AD0EX                                * 883D3
            R3=A                                 * 883D6
            D1=D1-  5                            * 883D9
            A=DAT1  A                            * 883DC
            D0=A                                 * 883DF
            D0=D0+  10                           * 883E2
            A=DAT0  A                            * 883E5
            ST=0    0                            * 883E8
            LC(5)   DOREAL                       * 883EB
            ?C=A    A                            * 883F2
            GOYES   L_883FA                      * 883F5
            ST=1    0                            * 883F7
L_883FA:
            D0=D0+  5                            * 883FA
            A=DAT0  A                            * 883FD
            D0=D0+  10                           * 88400
            A=A-1   A                            * 88403
            ?A=0    A                            * 88405
            GOYES   L_8840D                      * 88408
            D0=D0+  5                            * 8840A
L_8840D:
            AD0EX                                * 8840D
            R2=A                                 * 88410
            A=R4                                 * 88413
            D1=A                                 * 88416
            A=R1                                 * 88419
            DAT1=A  A                            * 8841C
            D1=D1+  5                            * 8841F
            DAT1=A  A                            * 88422
            D1=D1+  7                            * 88425
            A=R3                                 * 88428
            DAT1=A  A                            * 8842B
            AD1EX                                * 8842E
            LC(5)   #00266                       * 88431
            A=A+C   A                            * 88438
            D1=A                                 * 8843A
            LC(5)   #90000                       * 8843D
            CR2EX                                * 88444
            D0=C                                 * 88447
L_8844A:
            A=DAT0  W                            * 8844A
            D0=D0+  16                           * 8844E
            ?ST=0   0                            * 88451
            GOYES   L_88459                      * 88454
            D0=D0+  16                           * 88456
L_88459:
            GOSBVL  SPLITA                       * 88459
            GOSUBL  PutAB%1~jump_2               * 88460
            C=R2                                 * 88466
            P=      4                            * 88469
            ?C=A    P                            * 8846B
            GOYES   L_88478                      * 8846E
            ?C#0    P                            * 88470
            GOYES   L_8847D                      * 88473
            GONC    L_88480                      * 88475
L_88478:
            ?C>=A   A                            * 88478
            GOYES   L_88480                      * 8847B
L_8847D:
            R2=A                                 * 8847D
L_88480:
            GOSBVL  CkATTNcode                   * 88480
            A=R1                                 * 88487
            A=A-1   A                            * 8848A
            R1=A                                 * 8848C
            GONC    L_8844A                      * 8848F
            P=      0                            * 88492
            C=0     S                            * 88494
            GOSUBL  SUB_8901B                    * 88497
            C=0     S                            * 8849D
            GOSUBL  SUB_8907E                    * 884A0
            A=R2                                 * 884A6
            LC(5)   #00480                       * 884A9
            P=      4                            * 884B0
            ?A#0    P                            * 884B2
            GOYES   L_884BC                      * 884B5
            ?C<=A   A                            * 884B7
            GOYES   L_8851B                      * 884BA
L_884BC:
            SETDEC                               * 884BC
            C=C-A   A                            * 884BE
            GOTO    L_884CD                      * 884C0
L_884C4:
            P=      0                            * 884C4
            LC(5)   #99988                       * 884C6
L_884CD:
            R0=C                                 * 884CD
            GOSUBL  SUB_88F35                    * 884D0
            C=DAT1  A                            * 884D6
            R1=C                                 * 884D9
            D1=A                                 * 884DC
L_884DF:
            GOSUBL  GETAB1~jump_2                * 884DF
            ?B=0    W                            * 884E5
            GOYES   L_884FD                      * 884E8
            SETDEC                               * 884EA
            C=R0                                 * 884EC
            A=A+C   A                            * 884EF
            GOSUBL  SUB_890B6                    * 884F1
            GOSUBL  SUB_89212                    * 884F7
L_884FD:
            GOSBVL  CkATTNcode                   * 884FD
            C=R1                                 * 88504
            C=C-1   A                            * 88507
            R1=C                                 * 88509
            GONC    L_884DF                      * 8850C
            C=0     S                            * 8850F
            C=C+1   S                            * 88512
            GOSUBL  SUB_8901B                    * 88515
L_8851B:
            C=0     S                            * 8851B
            C=C+1   S                            * 8851E
            GOSUBL  SUB_8907E                    * 88521
            C=R4                                 * 88527
            D1=C                                 * 8852A
            C=DAT1  A                            * 8852D
            C=C-1   A                            * 88530
            C=C-1   A                            * 88532
            GOC     L_88560                      * 88534
            C=C-1   A                            * 88537
            GONC    L_8858F                      * 88539
            GOSUBL  SUB_89549                    * 8853C
            GOSUBL  SUB_89760                    * 88542
            GOSUBL  SUB_88FBE                    * 88548
            GOSUBL  SUB_8933F                    * 8854E
            GOSUBL  SUB_89155                    * 88554
            GOLONG  SUB_88FBE                    * 8855A
L_88560:
            GOSUBL  SUB_88F35                    * 88560
            D1=A                                 * 88566
            GOSUBL  Get1%CD~jump_2               * 88569
            GOSUBL  GETAB1~jump_2                * 8856F
            SETDEC                               * 88575
            A=-A-1  S                            * 88577
            GOSUBL  DIVF~jump_4                  * 8857A
            C=0     W                            * 88580
            R0=C                                 * 88583
            R1=C                                 * 88586
            GOLONG  SUB_88FBE                    * 88589
L_8858F:
            A=DAT1  A                            * 8858F
            GOSBVL  SUB_7A0AA                    * 88592
            GOSUBL  SUB_89313                    * 88599
            GOSUBL  SUB_89549                    * 8859F
            GOSUBL  SUB_89667                    * 885A5
            GOSUBL  GETAB1~jump_2                * 885AB
            GOSUBL  STAB2~jump_7                 * 885B1
            C=R4                                 * 885B7
            D1=C                                 * 885BA
            C=DAT1  A                            * 885BD
            GOSUBL  SUB_893FB                    * 885C0
            GOSUBL  STAB0~jump_7                 * 885C6
            C=0     A                            * 885CC
            GOSUBL  SUB_893FB                    * 885CE
            SETDEC                               * 885D4
            GOSUBL  RCCD0~jump_7                 * 885D6
            GOSUBL  DIVF~jump_4                  * 885DC
            A=0     S                            * 885E2
            GOSBVL  SUB_2B698                    * 885E5
            GOSUBL  RCCD2~jump_7                 * 885EC
            GOSUBL  DIVF~jump_4                  * 885F2
            GOSBVL  SUB_2B6AA                    * 885F8
            GOSUBL  SUB_89743                    * 885FF
            GOSUBL  SUB_8922C                    * 88605
            C=0     W                            * 8860B
            D=0     W                            * 8860E
            P=      14                           * 88611
            D=D+1   P                            * 88613
            D=D+1   M                            * 88616
            GOSUBL  MULTF~jump_6                 * 88619
            GOSUBL  SUB_89212                    * 8861F
            GOSUBL  SUB_892B0                    * 88625
            D0=C                                 * 8862B
L_8862E:
            GOSUBL  SUB_88F35                    * 8862E
            C=DAT1  A                            * 88634
            C=C-1   A                            * 88637
            D1=A                                 * 88639
            A=0     W                            * 8863C
            B=0     W                            * 8863F
            GOSUBL  PUTAB0Back                   * 88642
            GOSUBL  GETAB1~jump_2                * 88648
            A=0     S                            * 8864E
            D0=D0-  16                           * 88651
            D0=D0-  5                            * 88654
            GOSUBL  PUTAB0Back                   * 88657
L_8865D:
            R3=C                                 * 8865D
            GOSUBL  GETAB0~jump_2                * 88660
            SETDEC                               * 88666
            GOSUBL  MulD0%%                      * 88668
            GOSUBL  SUB_891EA                    * 8866E
            GOSUBL  GETCD0~jump_2                * 88674
            GOSUBL  L_88F78                      * 8867A
            GOSUBL  PUTAB0~jump_3                * 88680
            GOSUBL  GETAB0~jump_2                * 88686
            GOSUBL  SUB_891EA                    * 8868C
            GOSUBL  MulD0%%                      * 88692
            GOSUBL  Get1%CD~jump_2               * 88698
            C=0     S                            * 8869E
            AR3EX                                * 886A1
            ?A#0    A                            * 886A4
            GOYES   L_886AC                      * 886A7
            C=-C-1  S                            * 886A9
L_886AC:
            AR3EX                                * 886AC
            GOSUBL  L_88F78                      * 886AF
            GOSUBL  PUTAB0Back                   * 886B5
            GOSBVL  CkATTNcode                   * 886BB
            C=R3                                 * 886C2
            C=C-1   A                            * 886C5
            GONC    L_8865D                      * 886C7
            SETDEC                               * 886CA
            GOSUBL  GETCD0~jump_2                * 886CC
            GOSUBL  DIVF~jump_4                  * 886D2
            A=-A-1  S                            * 886D8
            GOSUBL  GETCD0~jump_2                * 886DB
            GOSBVL  STCD0                        * 886E1
            GOSUBL  L_88F78                      * 886E8
            GOSUBL  PUTAB0Back                   * 886EE
            D0=D0-  16                           * 886F4
            D0=D0-  5                            * 886F7
            GOSUBL  RCCD0~jump_7                 * 886FA
            GOSUBL  SubCDTestb                   * 88700
            GOC     L_8870D                      * 88706
            GOTO    L_8862E                      * 88709
L_8870D:
            GOSUBL  RCAB0~jump_2                 * 8870D
            C=0     W                            * 88713
            C=C-1   A                            * 88716
            D=0     W                            * 88718
            D=D-1   M                            * 8871B
            GOSUBL  MULTF~jump_6                 * 8871E
            GOSUBL  SUB_8931E                    * 88724
            GOSUBL  SUB_891AA                    * 8872A
            GOSUBL  GETAB1~jump_2                * 88730
            SETDEC                               * 88736
            GOSUBL  MulD0%%                      * 88738
            D=0     W                            * 8873E
            C=0     W                            * 88741
            P=      11                           * 88744
            LC(4)   #1445                        * 88746
            DCEX    W                            * 8874C
            GOSUBL  MULTF~jump_6                 * 8874F
            GOSUBL  SUB_89743                    * 88755
            GOSUBL  SUB_8922C                    * 8875B
            GOSUBL  SUB_892D1                    * 88761
            A=0     W                            * 88767
            B=0     W                            * 8876A
            GOSUBL  PutAB%1~jump_2               * 8876D
            GOSUBL  PutAB%1~jump_2               * 88773
            C=0     A                            * 88779
            GOSUBL  SUB_893FB                    * 8877B
            A=0     S                            * 88781
            GOSUBL  SUB_892F2                    * 88784
            C=R4                                 * 8878A
            D1=C                                 * 8878D
            D1=D1+  10                           * 88790
            C=0     B                            * 88793
            DAT1=C  B                            * 88796
L_88799:
            GOSUBL  SUB_89376                    * 88799
            GOSUBL  STAB0~jump_7                 * 8879F
            GOSUBL  SUB_891BB                    * 887A5
            GOSUBL  Get1%CD~jump_2               * 887AB
            GOSBVL  STCD2                        * 887B1
            GOSUBL  SubCDTestb                   * 887B8
            GOC     L_887C5                      * 887BE
            GOTO    L_88D40                      * 887C1
L_887C5:
            GOSUB   RCAB0~jump_2                 * 887C5
            GOSUB   SUB_88FB7                    * 887C9
            GOSUBL  STAB0~jump_7                 * 887CD
            GOSUB   RCCD2~jump_7                 * 887D3
            GOSUBL  SubCDTestb                   * 887D7
            GOC     L_88828                      * 887DD
            C=R4                                 * 887E0
            D1=C                                 * 887E3
            D1=D1+  10                           * 887E6
            C=DAT1  B                            * 887E9
            ?C#0    B                            * 887EC
            GOYES   L_88808                      * 887EF
            GOSUBL  SUB_893C3                    * 887F1
            GOSUB   SUB_88F2A                    * 887F7
            GOSUB   RCAB0~jump_2                 * 887FB
            GOSUBL  SubCDTestb                   * 887FF
            GONC    L_88828                      * 88805
L_88808:
            GOSUB   RCAB0~jump_2                 * 88808
            GOSUBL  SUB_892FD                    * 8880C
            SETDEC                               * 88812
            GOSUB   RCCD2~jump_7                 * 88814
            GOSUB   DIVF~jump_4                  * 88818
            GOSUBL  SUB_8919E                    * 8881C
            GOSUBL  L_8916C                      * 88822
L_88828:
            C=R4                                 * 88828
            D1=C                                 * 8882B
            D1=D1+  10                           * 8882E
            C=0     S                            * 88831
            C=C+1   S                            * 88834
            DAT1=C  S                            * 88837
            P=      0                            * 8883B
            LC(3)   #0A4                         * 8883D
            GOSUBL  SUB_893E5                    * 88842
            D0=C                                 * 88848
            GOSUBL  SUB_891B5                    * 8884B
            D1=D1+  16                           * 88851
            D1=D1+  5                            * 88854
            LC(1)   #6                           * 88857
L_8885A:
            A=DAT1  A                            * 8885A
            D1=D1+  5                            * 8885D
            DAT0=A  A                            * 88860
            D0=D0+  5                            * 88863
            A=DAT1  W                            * 88866
            D1=D1+  16                           * 8886A
            DAT0=A  W                            * 8886D
            D0=D0+  16                           * 88871
            C=C-1   P                            * 88874
            GONC    L_8885A                      * 88877
L_8887A:
            GOSUBL  SUB_89355                    * 8887A
            GOSUB   SUB_88F2A                    * 88880
            GOSUBL  GETAB1~jump_2                * 88884
            GOSUB   STAB2~jump_7                 * 8888A
            GOSUBL  Get2ABR0b                    * 8888E
            SETDEC                               * 88894
            GOSUB   L_88F78                      * 88896
            GOSUBL  EXAB0~jump_4                 * 8889A
            GOSUB   RCCD2~jump_7                 * 888A0
            GOSUB   L_88F78                      * 888A4
            GOSUBL  EXAB0~jump_4                 * 888A8
            GOSUBL  SUB_891C7                    * 888AE
            GOSUBL  SUB_89131                    * 888B4
L_888BA:
            GOSUBL  SUB_8936B                    * 888BA
            SETDEC                               * 888C0
            C=0     W                            * 888C2
            C=C-1   A                            * 888C5
            D=0     W                            * 888C7
            P=      14                           * 888CA
            D=D+1   P                            * 888CC
            D=D+1   P                            * 888CF
            GOSUB   MULTF~jump_6                 * 888D2
            GOSUBL  STAB0~jump_7                 * 888D6
            GOSUBL  SUB_891CD                    * 888DC
            GOSUBL  Get1%CD~jump_2               * 888E2
            C=0     S                            * 888E8
            GOSUB   SubCDTestb                   * 888EB
            GOC     L_88922                      * 888EF
            GOSUB   RCAB0~jump_2                 * 888F2
            GOSUBL  SUB_891AA                    * 888F6
            GOSUBL  Get1%CD~jump_2               * 888FC
            C=0     S                            * 88902
            GOSUB   SubCDTestb                   * 88905
            GONC    L_88918                      * 88909
            A=0     W                            * 8890C
            B=0     W                            * 8890F
            GOSUBL  SUB_89212                    * 88912
L_88918:
            D1=D1+  16                           * 88918
            D1=D1+  5                            * 8891B
            GOTO    L_88A61                      * 8891E
L_88922:
            GOSUBL  SUB_891AA                    * 88922
            GOSUBL  GETAB1~jump_2                * 88928
            GOSUBL  STAB0~jump_7                 * 8892E
            A=0     W                            * 88934
            B=0     W                            * 88937
            GOSUBL  PutAB%1~jump_2               * 8893A
            GOSUBL  SUB_892A5                    * 88940
            D0=C                                 * 88946
            GOSUB   SUB_88F35                    * 88949
            C=DAT1  A                            * 8894D
            C=C-1   A                            * 88950
            R2=C                                 * 88952
            C=C+1   A                            * 88955
            D1=A                                 * 88957
            GOSUBL  GETAB1~jump_2                * 8895A
            CD1EX                                * 88960
            R3=C                                 * 88963
            CD1EX                                * 88966
            GOSUBL  PUTAB0Back                   * 88969
            GOSUBL  SUB_8942E                    * 8896F
            GOTO    L_889D3                      * 88975
L_88979:
            GOSUBL  GETAB0~jump_2                * 88979
            SETDEC                               * 8897F
            GOSUB   SUB_88F8E                    * 88981
            GOSUBL  D0Back2%%                    * 88985
            GOSUBL  GETCD0~jump_2                * 8898B
            GOSUB   L_88F78                      * 88991
            GOSUB   SUB_890B6                    * 88995
            GOC     L_889C9                      * 88999
            GOSUBL  PUTAB0~jump_3                * 8899C
            GOSUBL  D0Back2%%                    * 889A2
            GOSUBL  GETAB0~jump_2                * 889A8
            GOSUB   SUB_88F8E                    * 889AE
            D1=D1-  16                           * 889B2
            D1=D1-  5                            * 889B5
            GOSUBL  Get1%CD~jump_2               * 889B8
            GOSUB   L_88F78                      * 889BE
            GOSUB   SUB_890B6                    * 889C2
            GONC    L_889CD                      * 889C6
L_889C9:
            GOTO    L_884C4                      * 889C9
L_889CD:
            GOSUBL  PUTAB0Back                   * 889CD
L_889D3:
            GOSUBL  SUB_8922C                    * 889D3
            SETDEC                               * 889D9
            GOSUB   SUB_88F8E                    * 889DB
            AR3EX                                * 889DF
            AD1EX                                * 889E2
            GOSUBL  Get1%CD~jump_2               * 889E5
            AD1EX                                * 889EB
            AR3EX                                * 889EE
            GOSUB   L_88F78                      * 889F1
            GOSUB   SUB_890B6                    * 889F5
            GOC     L_889C9                      * 889F9
            GOSUBL  PutAB%1~jump_2               * 889FC
            GOSBVL  CkATTNcode                   * 88A02
            C=R2                                 * 88A09
            C=C-1   A                            * 88A0C
            R2=C                                 * 88A0E
            GOC     L_88A18                      * 88A11
            GOTO    L_88979                      * 88A14
L_88A18:
            C=0     W                            * 88A18
            R0=C                                 * 88A1B
            R1=C                                 * 88A1E
            GOSUB   STAB2~jump_7                 * 88A21
            GOSUBL  GETAB0~jump_2                * 88A25
            GOSUB   D0Back2%%                    * 88A2B
            GOSUBL  GETCD0~jump_2                * 88A2F
            D0=D0-  16                           * 88A35
            D0=D0-  5                            * 88A38
            GOSUB   SUB_890F7                    * 88A3B
            GOSUB   SUB_89126                    * 88A3F
            GOSUB   SUB_890F7                    * 88A43
            GOSUB   RCAB2~jump_4                 * 88A47
            GOSUB   SUB_890F7                    * 88A4B
            A=0     S                            * 88A4F
            GOSUBL  SUB_892F2                    * 88A52
            ST=0    0                            * 88A58
            GOLONG  L_89574                      * 88A5B
L_88A61:
            GOSUB   SUB_891AA                    * 88A61
            GOSUB   Get2ABR0b                    * 88A65
            GOSUB   STAB2~jump_7                 * 88A69
            GOSUBL  SUB_898F6                    * 88A6D
            GOSUBL  STAB0~jump_7                 * 88A73
            GOSUB   RCAB2~jump_4                 * 88A79
            GOSUB   SUB_88FB0                    * 88A7D
            GOSUBL  SUB_892BB                    * 88A81
            D0=C                                 * 88A87
            GOSUB   SUB_89135                    * 88A8A
            GOSUB   SUB_88F35                    * 88A8E
            C=DAT1  A                            * 88A92
            D1=A                                 * 88A95
            A=C     A                            * 88A98
            C=C-1   A                            * 88A9A
            R2=C                                 * 88A9C
            C=C-1   A                            * 88A9F
            RSTK=C                               * 88AA1
            C=A     A                            * 88AA3
            GOSUB   GETAB1~jump_2                * 88AA5
            AD1EX                                * 88AA9
            R3=A                                 * 88AAC
            AD1EX                                * 88AAF
            GOSUBL  SUB_8942E                    * 88AB2
            GOSUB   SUB_891E4                    * 88AB8
            C=0     W                            * 88ABC
            DAT0=C  W                            * 88ABF
            D0=D0+  16                           * 88AC3
            DAT0=C  W                            * 88AC6
            D0=D0+  16                           * 88ACA
            DAT0=C  W                            * 88ACD
            D0=D0+  10                           * 88AD1
            GOSUB   PUTAB0~jump_3                * 88AD4
            DAT0=C  W                            * 88AD8
            D0=D0+  16                           * 88ADC
            DAT0=C  A                            * 88ADF
            D0=D0+  5                            * 88AE2
            GOSUB   SUB_89207                    * 88AE5
L_88AE9:
            A=R2                                 * 88AE9
            ?A#0    A                            * 88AEC
            GOYES   L_88B0F                      * 88AEF
            CD1EX                                * 88AF1
            R0=C                                 * 88AF4
            GOSUBL  SUB_89381                    * 88AF7
            C=R0                                 * 88AFD
            D1=C                                 * 88B00
            GOSUB   D0Back2%%                    * 88B03
            GOSUB   PUTAB0~jump_3                * 88B07
            GOTO    L_88B2C                      * 88B0B
L_88B0F:
            C=RSTK                               * 88B0F
            RSTK=C                               * 88B11
            ?C>A    A                            * 88B13
            GOYES   L_88B26                      * 88B16
            GOSUB   D0Back2%%                    * 88B18
            D1=D1-  16                           * 88B1C
            D1=D1-  5                            * 88B1F
            GOTO    L_88BD2                      * 88B22
L_88B26:
            D0=D0-  16                           * 88B26
            D0=D0-  5                            * 88B29
L_88B2C:
            GOSUB   GETCD0~jump_2                * 88B2C
            GOSUB   SUB_891D8                    * 88B30
            GOSUB   SUB_89141                    * 88B34
            GOSUB   PUTAB0Back                   * 88B38
            SETDEC                               * 88B3C
            GOSUB   EXAB0~jump_4                 * 88B3E
            GOSUB   MULTF~jump_6                 * 88B42
            GOSUB   EXAB0~jump_4                 * 88B46
            GOSUB   SUB_89207                    * 88B4A
            GOSUB   MulD0%%                      * 88B4E
            A=-A-1  S                            * 88B52
            GOSUB   SUB_88F74                    * 88B55
            A=-A-1  S                            * 88B59
            GOSUB   D0Back2%%                    * 88B5C
            GOSUB   GETCD0~jump_2                * 88B60
            GOSUB   L_88F78                      * 88B64
            GOSUB   SUB_891E4                    * 88B68
            GOSUB   SUB_890B6                    * 88B6C
            GONC    L_88B77                      * 88B70
            GOTO    L_884C4                      * 88B73
L_88B77:
            GOSUB   PUTAB0~jump_3                * 88B77
            D0=D0+  16                           * 88B7B
            D0=D0+  5                            * 88B7E
            GOSUB   SUB_89141                    * 88B81
            GOSUB   PUTAB0Back                   * 88B85
            GOSUB   EXAB0~jump_4                 * 88B89
            D0=D0+  16                           * 88B8D
            D0=D0+  5                            * 88B90
            GOSUB   MulD0%%                      * 88B93
            GOSUB   EXAB0~jump_4                 * 88B97
            GOSUB   D0Back2%%                    * 88B9B
            GOSUB   MulD0%%                      * 88B9F
            A=-A-1  S                            * 88BA3
            GOSUB   SUB_88F74                    * 88BA6
            A=-A-1  S                            * 88BAA
            GOSUB   SUB_891AA                    * 88BAD
            GOSUB   Get1%CD~jump_2               * 88BB1
            GOSUB   L_88F78                      * 88BB5
            GOSUB   SUB_891EA                    * 88BB9
            GOSUB   SUB_890B6                    * 88BBD
            GONC    L_88BC8                      * 88BC1
            GOTO    L_884C4                      * 88BC4
L_88BC8:
            GOSUB   PUTAB0~jump_3                * 88BC8
            D0=D0+  16                           * 88BCC
            D0=D0+  5                            * 88BCF
L_88BD2:
            GOSUB   GETAB1~jump_2                * 88BD2
            SETDEC                               * 88BD6
            GOSUB   MulD0%%                      * 88BD8
            AR3EX                                * 88BDC
            AD1EX                                * 88BDF
            GOSUB   Get1%CD~jump_2               * 88BE2
            AD1EX                                * 88BE6
            AR3EX                                * 88BE9
            GOSUB   L_88F78                      * 88BEC
            GOSUB   GETCD0~jump_2                * 88BF0
            GOSBVL  STCD0                        * 88BF4
            C=RSTK                               * 88BFB
            RSTK=C                               * 88BFD
            D=C     A                            * 88BFF
            C=R2                                 * 88C01
            ?D<C    A                            * 88C04
            GOYES   L_88C26                      * 88C07
            GOSUB   EXAB0~jump_4                 * 88C09
            GOSUB   SUB_891AA                    * 88C0D
            GOSUB   Get1%CD~jump_2               * 88C11
            D1=D1+  16                           * 88C15
            D1=D1+  5                            * 88C18
            GOSUB   MULTF~jump_6                 * 88C1B
            A=-A-1  S                            * 88C1F
            GOSUB   SUB_88F74                    * 88C22
L_88C26:
            GOSUB   SUB_890B6                    * 88C26
            GONC    L_88C31                      * 88C2A
            GOTO    L_884C4                      * 88C2D
L_88C31:
            GOSUB   PutAB%1~jump_2               * 88C31
            GOSBVL  CkATTNcode                   * 88C35
            C=R2                                 * 88C3C
            C=C-1   A                            * 88C3F
            R2=C                                 * 88C41
            GOC     L_88C4B                      * 88C44
            GOTO    L_88AE9                      * 88C47
L_88C4B:
            C=RSTK                               * 88C4B
            GOSUB   D0Back2%%                    * 88C4D
            GOSUB   PUTAB0~jump_3                * 88C51
            GOSUB   SUB_891AA                    * 88C55
            GOSUB   GETAB1~jump_2                * 88C59
            GOSUBL  STAB0~jump_7                 * 88C5D
            GOSUB   SUB_8938C                    * 88C63
            GOSUB   STAB2~jump_7                 * 88C67
            GOSUB   SUB_89329                    * 88C6B
            GOSUB   SUB_89135                    * 88C6F
            SETDEC                               * 88C73
            GOSUB   SUB_88F8E                    * 88C75
            GOSUB   PUTAB0~jump_3                * 88C79
            GOSUB   RCAB2~jump_4                 * 88C7D
            GOSUB   SUB_88FA1                    * 88C81
            GOSUB   STAB2~jump_7                 * 88C85
            GOSUB   SUB_88FB0                    * 88C89
            GOSUB   SUB_88FB0                    * 88C8D
            A=-A-1  S                            * 88C91
            GOSUB   SUB_891D8                    * 88C94
            CD0EX                                * 88C98
            D0=C                                 * 88C9B
            D1=C                                 * 88C9E
            GOSUB   L_8916C                      * 88CA1
            GOSUB   GETAB1~jump_2                * 88CA5
            GOSUB   GETCD0~jump_2                * 88CA9
            GOSUB   L_88F78                      * 88CAD
            GOSUB   PUTAB0Back                   * 88CB1
            GOSUB   GETAB1~jump_2                * 88CB5
            C=0     W                            * 88CB9
            D=0     W                            * 88CBC
            P=      14                           * 88CBF
            LC(1)   #3                           * 88CC1
            DCEX    P                            * 88CC4
            GOSUB   MULTF~jump_6                 * 88CC7
            GOSUB   GETCD0~jump_2                * 88CCB
            GOSUB   L_88F78                      * 88CCF
            GOSUB   SUB_8927C                    * 88CD3
            GOSUB   MULTF~jump_6                 * 88CD7
            CD1EX                                * 88CDB
            CD0EX                                * 88CDE
            CD1EX                                * 88CE1
            GOSUB   D0Back2%%                    * 88CE4
            GOSUB   PUTAB0Back                   * 88CE8
            GOSUB   RCAB2~jump_4                 * 88CEC
            GOSUB   SUB_88FB0                    * 88CF0
            A=-A-1  S                            * 88CF4
            D0=D0+  16                           * 88CF7
            D0=D0+  5                            * 88CFA
            GOSUB   MulD0%%                      * 88CFD
            GOSUB   Get1%CD~jump_2               * 88D01
            GOSUB   L_88F78                      * 88D05
            GOSUB   D0Back2%%                    * 88D09
            GOSUB   GETCD0~jump_2                * 88D0D
            GOSUB   PUTAB0Back                   * 88D11
            GOSUB   SUB_891AA                    * 88D15
            GOSUB   GETAB1~jump_2                * 88D19
            GOSUB   MULTF~jump_6                 * 88D1D
            GOSUB   SUB_88FB0                    * 88D21
            GOSUB   PUTAB0~jump_3                * 88D25
            GOSUB   SUB_89141                    * 88D29
            GOSUBL  SUB_898A8                    * 88D2D
            GOSUB   SUB_892F2                    * 88D33
            ST=1    0                            * 88D37
            GOLONG  L_89574                      * 88D3A
L_88D40:
            C=R4                                 * 88D40
            D1=C                                 * 88D43
            D1=D1+  10                           * 88D46
            C=DAT1  S                            * 88D49
            ?C#0    S                            * 88D4D
            GOYES   L_88D56                      * 88D50
            GOTO    L_88E03                      * 88D52
L_88D56:
            SETDEC                               * 88D56
            A=0     W                            * 88D58
            A=A-1   A                            * 88D5B
            B=0     W                            * 88D5D
            P=      14                           * 88D60
            LC(1)   #5                           * 88D62
            B=C     P                            * 88D65
            P=      0                            * 88D68
            LC(3)   #0CE                         * 88D6A
            GOSUB   SUB_89168                    * 88D6F
            D1=D1+  16                           * 88D73
            D1=D1+  5                            * 88D76
            GOSUB   GETAB1~jump_2                * 88D79
            GOSUB   SUB_88F8E                    * 88D7D
            GOSUB   SUB_89212                    * 88D81
            GOSUB   STAB2~jump_7                 * 88D85
            D1=D1+  16                           * 88D89
            D1=D1+  5                            * 88D8C
            GOSUB   Get2ABR0b                    * 88D8F
            GOSUBL  SUB_898A8                    * 88D93
            GOSUB   STAB0~jump_7                 * 88D99
            GOSUB   RCCD2~jump_7                 * 88D9D
            GOSUB   L_88F78                      * 88DA1
            GOSUB   RCCD0~jump_7                 * 88DA5
            GOSUB   SubCDTestb                   * 88DA9
            ?B=0    WP                           * 88DAD
            GOYES   L_88DB6                      * 88DB0
            GOTO    L_8887A                      * 88DB2
L_88DB6:
            GOSUB   SUB_891CD                    * 88DB6
            GOSUB   GETAB1~jump_2                * 88DBA
            GOSUB   STAB0~jump_7                 * 88DBE
            GOSUB   SUB_891CD                    * 88DC2
            GOSUB   GETAB1~jump_2                * 88DC6
            GOSUB   SUB_88FA1                    * 88DCA
            GOSUB   STAB2~jump_7                 * 88DCE
            GOSUB   SUB_89334                    * 88DD2
            SETDEC                               * 88DD6
            GOSUB   RCCD2~jump_7                 * 88DD8
            GOSUB   MULTF~jump_6                 * 88DDC
            GOSUB   RCCD0~jump_7                 * 88DE0
            GOSUB   XYEX~jump_5                  * 88DE4
            GOSUB   SubCDTestb                   * 88DE8
            GOC     L_88DF3                      * 88DEC
            GOTO    L_88EBB                      * 88DEF
L_88DF3:
            P=      0                            * 88DF3
            LC(5)   #0C001                       * 88DF5
            GOVLNG  GPErrjmpC                    * 88DFC
L_88E03:
            D1=D1+  1                            * 88E03
            C=DAT1  S                            * 88E06
            ?C#0    S                            * 88E0A
            GOYES   L_88E62                      * 88E0D
            C=C+1   S                            * 88E0F
            DAT1=C  S                            * 88E12
            GOSUB   SUB_893B8                    * 88E16
            SETDEC                               * 88E1A
            GOSUB   SUB_88FA1                    * 88E1C
            GOSUB   SUB_88F2A                    * 88E20
            GOSUB   GETAB1~jump_2                * 88E24
            GOSUB   STAB2~jump_7                 * 88E28
            GOSUB   DIVF~jump_4                  * 88E2C
            GOSUB   SUB_892C6                    * 88E30
            GOSUB   SUB_891C7                    * 88E34
            GOSUB   Get2ABR0b                    * 88E38
            GOSUB   SUB_8919E                    * 88E3C
            GOSUB   SUB_89131                    * 88E40
            GOSUB   SUB_891C7                    * 88E44
            GOSUB   Get1%CD~jump_2               * 88E48
            SETDEC                               * 88E4C
            GOSUB   RCAB2~jump_4                 * 88E4E
            GOSUB   DIVF~jump_4                  * 88E52
            GOSUB   SUB_89192                    * 88E56
            GOSUB   L_8916C                      * 88E5A
            GOTO    L_888BA                      * 88E5E
L_88E62:
            GOSUB   SUB_89381                    * 88E62
            GOSUB   SUB_89155                    * 88E66
            GOSUB   SUB_8910A                    * 88E6A
            GOSUB   SUB_891BB                    * 88E6E
            GOSUB   GETAB1~jump_2                * 88E72
            C=0     W                            * 88E76
            P=      12                           * 88E79
            LC(3)   #125                         * 88E7B
            D=C     W                            * 88E80
            C=0     M                            * 88E83
            C=-C-1  S                            * 88E86
            GOSUB   XYEX~jump_5                  * 88E89
            GOSUB   DIVF~jump_4                  * 88E8D
            GOSUB   STAB0~jump_7                 * 88E91
            A=0     W                            * 88E95
            B=0     W                            * 88E98
            P=      14                           * 88E9B
            B=B+1   P                            * 88E9D
            GOSUB   EXAB0~jump_4                 * 88EA0
            GOSUB   SUB_89481                    * 88EA4
            GOSUB   SUB_892DC                    * 88EA8
            GOSUB   SUB_89135                    * 88EAC
            GOSBVL  CkATTNcode                   * 88EB0
            GOTO    L_888BA                      * 88EB7
L_88EBB:
            GOSUB   SUB_89381                    * 88EBB
            GOSUB   SUB_89155                    * 88EBF
            C=R1                                 * 88EC3
            ?C=0    W                            * 88EC6
            GOYES   L_88EE2                      * 88EC9
            C=R0                                 * 88ECB
            SETDEC                               * 88ECE
            C=-C-1  S                            * 88ED0
            R0=C                                 * 88ED3
            GOSUB   SUB_88FBE                    * 88ED6
            GOSUB   SUB_89381                    * 88EDA
            GOSUB   SUB_89155                    * 88EDE
L_88EE2:
            GOSUB   SUB_88FBE                    * 88EE2
            C=C-1   A                            * 88EE6
            R0=C                                 * 88EE8
            GOSUB   SUB_89403                    * 88EEB
            D0=C                                 * 88EEF
            C=R0                                 * 88EF2
            GOSUB   SUB_8943E                    * 88EF5
            C=R0                                 * 88EF9
            B=C     A                            * 88EFC
L_88EFE:
            A=DAT1  A                            * 88EFE
            D1=D1+  5                            * 88F01
            DAT0=A  A                            * 88F04
            D0=D0+  5                            * 88F07
            A=DAT1  W                            * 88F0A
            D1=D1+  16                           * 88F0E
            DAT0=A  W                            * 88F11
            D0=D0+  16                           * 88F15
            GOSBVL  CkATTNcode                   * 88F18
            B=B-1   A                            * 88F1F
            GONC    L_88EFE                      * 88F21
            GOLONG  L_8851B                      * 88F24

* refs (6): 887F7 88880 88E20 88FA1 895E4 89641
SUB_88F2A:
            C=B     W                            * 88F2A
            D=C     W                            * 88F2D
            C=A     W                            * 88F30
            RTN                                  * 88F33

* refs (5): 884D0 88560 8862E 88949 88A8E
SUB_88F35:
            SETHEX                               * 88F35
            A=R4                                 * 88F37
            D1=A                                 * 88F3A
            P=      0                            * 88F3D
            LC(5)   #00272                       * 88F3F
            A=A+C   A                            * 88F46
            RTN                                  * 88F48

* refs (4): 88DE4 88E89 89614 89882
XYEX~jump_5:
            GOVLNG  XYEX                         * 88F4A

* refs (17): 885B1 8888A 88A21 88A69 88C67 88C85 ...
STAB2~jump_7:
            GOVLNG  STAB2                        * 88F51

* refs (8): 8870D 887C5 887FB 88808 888F2 89491 ...
RCAB0~jump_2:
            GOVLNG  RCAB0                        * 88F58

* refs (8): 88A47 88A79 88C7D 88CEC 88E4E 89516 ...
RCAB2~jump_4:
            GOVLNG  RCAB2                        * 88F5F

* refs (8): 885D6 886FA 88DA5 88DE0 88F74 88F8E ...
RCCD0~jump_7:
            GOVLNG  RCCD0                        * 88F66

* refs (14): 885EC 887D3 88814 888A0 88D9D 88DD8 ...
RCCD2~jump_7:
            GOVLNG  RCCD2                        * 88F6D

* refs (5): 88B55 88BA6 88C22 897DE 89906
SUB_88F74:
            GOSUB   RCCD0~jump_7                 * 88F74
L_88F78:
            CD0EX                                * 88F78
            RSTK=C                               * 88F7B
            CD0EX                                * 88F7D
            GOSBVL  RADDF                        * 88F80
            C=RSTK                               * 88F87
            D0=C                                 * 88F89
            RTN                                  * 88F8C

* refs (8): 88981 889AE 889DB 88C75 88D7D 8917A ...
SUB_88F8E:
            GOSUB   RCCD0~jump_7                 * 88F8E

* refs (14): 88619 8871E 8874F 888D2 88B42 88C1B ...
MULTF~jump_6:
            GOVLNG  MULTF                        * 88F92

* refs (13): 88668 88692 88738 88B4E 88B93 88B9F ...
* A/B *= the %% at D0 (GETCD0, MULTF); D0 past it
MulD0%%:
            GOSUB   GETCD0~jump_2                * 88F99
            GOTO    MULTF~jump_6                 * 88F9D

* refs (7): 88C81 88DCA 88E1C 898C5 898CF 898F6 ...
SUB_88FA1:
            GOSUB   SUB_88F2A                    * 88FA1
            GOTO    MULTF~jump_6                 * 88FA5

* refs (12): 8857A 885DC 885F2 886D2 88818 88E2C ...
DIVF~jump_4:
            GOVLNG  DIVF                         * 88FA9

* refs (7): 88A7D 88C89 88C8D 88CF0 88D21 895C9 ...
SUB_88FB0:
            GOVLNG  L_2BBD9                      * 88FB0

* refs (3): 887C9 896CC 89864
SUB_88FB7:
            GOVLNG  L_2BBBC                      * 88FB7

* refs (7): 88548 8855A 88589 88ED6 88EE2 89076 ...
SUB_88FBE:
            SETDEC                               * 88FBE
            GOSBVL  PACK                         * 88FC0
            GOSUB   EXAB0~jump_4                 * 88FC7
            GOSBVL  PACK                         * 88FCB
            AR0EX                                * 88FD2
            C=R4                                 * 88FD5
            D1=C                                 * 88FD8
            D1=D1+  12                           * 88FDB
            C=DAT1  A                            * 88FDE
            D0=C                                 * 88FE1
            DAT0=A  W                            * 88FE4
            D0=D0+  16                           * 88FE8
            A=R0                                 * 88FEB
            DAT0=A  W                            * 88FEE
            D0=D0+  16                           * 88FF2
            GOSBVL  CkATTNcode                   * 88FF5
            CD0EX                                * 88FFC
            DAT1=C  A                            * 88FFF
            D1=D1-  12                           * 89002
            C=DAT1  A                            * 89005
            C=C-1   A                            * 89008
            DAT1=C  A                            * 8900A
            ?C#0    A                            * 8900D
            RTNYES                               * 89010
            P=      0                            * 89012
            GOVLNG  GETPTRLOOP                   * 89014

* refs (2): 88497 88515
SUB_8901B:
            A=R4                                 * 8901B
            A=C     S                            * 8901E
            R4=A                                 * 89021
            D1=A                                 * 89024
            C=DAT1  A                            * 89027
L_8902A:
            R0=C                                 * 8902A
            GOSUB   SUB_893FB                    * 8902D
            ?B#0    W                            * 89031
            RTNYES                               * 89034
            CD1EX                                * 89036
            D0=C                                 * 89039
            C=R0                                 * 8903C
            GOSBVL  SUB_3769C                    * 8903F
            C=D     A                            * 89046
            GOSBVL  MOVEDOWN                     * 89048
            A=0     W                            * 8904F
            R0=A                                 * 89052
            R1=A                                 * 89055
            C=R4                                 * 89058
            ?C=0    S                            * 8905B
            GOYES   L_8906B                      * 8905E
            A=A+1   M                            * 89060
            P=      14                           * 89063
            B=B+1   P                            * 89065
            GONC    L_89076                      * 89068
L_8906B:
            SETDEC                               * 8906B
            GOSBVL  L_2A141                      * 8906D
            SETHEX                               * 89074
L_89076:
            GOSUB   SUB_88FBE                    * 89076
            GOTO    L_8902A                      * 8907A

* refs (2): 884A0 88521
SUB_8907E:
            A=R4                                 * 8907E
            A=C     S                            * 89081
            R4=A                                 * 89084
L_89087:
            C=0     A                            * 89087
            GOSUB   SUB_893FB                    * 89089
            ?B#0    W                            * 8908D
            RTNYES                               * 89090
            A=0     W                            * 89092
            R0=A                                 * 89095
            R1=A                                 * 89098
            C=R4                                 * 8909B
            ?C=0    S                            * 8909E
            GOYES   L_890AF                      * 890A1
            P=      14                           * 890A3
            B=B+1   P                            * 890A5
            SETDEC                               * 890A8
            A=A-1   A                            * 890AA
            A=0     X                            * 890AC
L_890AF:
            GOSUB   SUB_88FBE                    * 890AF
            GOC     L_89087                      * 890B3

* refs (7): 884F1 88995 889C2 889F5 88B6C 88BBD ...
SUB_890B6:
            SETDEC                               * 890B6
            C=A     A                            * 890B8
            C=C+C   A                            * 890BA
            P=      0                            * 890BC
            LC(5)   #05000                       * 890BE
            GOC     L_890CF                      * 890C5
            ?C<=A   A                            * 890C8
            RTNYES                               * 890CB
            RTN                                  * 890CD
L_890CF:
            C=-C    A                            * 890CF
            ?C>A    A                            * 890D1
            GOYES   L_890D8                      * 890D4
            RTN                                  * 890D6
L_890D8:
            A=0     W                            * 890D8
            B=0     W                            * 890DB
            RTNCC                                * 890DE

* refs (12): 88700 887B8 887D7 887FF 888EB 88905 ...
* A copy of SubCDTest in the library's second code part
SubCDTestb:
            SETDEC                               * 890E0
            C=-C-1  S                            * 890E2
            GOSUB   L_88F78                      * 890E5
            P=      14                           * 890E9
            ?B=0    WP                           * 890EB
            RTNYES                               * 890EE
            ?A=0    S                            * 890F0
            RTNYES                               * 890F3
            RTN                                  * 890F5

* refs (6): 88A3B 88A43 88A4B 89569 89790 897BA
SUB_890F7:
            GOSUB   PUTAB0~jump_3                * 890F7
L_890FB:
            GOSUB   EXAB0~jump_4                 * 890FB
            GOSUB   PUTAB0~jump_3                * 890FF

* refs (26): 8889A 888A8 88B3E 88B46 88B89 88B97 ...
EXAB0~jump_4:
            GOVLNG  EXAB0                        * 89103

* refs (8): 88E6A 8966F 896D8 89778 8979C 897A4 ...
SUB_8910A:
            GOSUB   SUB_89254                    * 8910A
            GOTO    L_890FB                      * 8910E

* refs (1): 8981C
SUB_89112:
            GOSUB   SUB_8927C                    * 89112
            GOSUB   PUTAB0Back                   * 89116
            GOSUB   GETAB0~jump_2                * 8911A
            GOSUB   EXAB0~jump_4                 * 8911E
            GOSUB   PUTAB0Back                   * 89122

* refs (1): 88A3F
SUB_89126:
            A=C     W                            * 89126
            C=D     W                            * 89129
            B=C     W                            * 8912C
            RTN                                  * 8912F

* refs (5): 888B4 88E40 89709 89810 89828
SUB_89131:
            GOSUB   PutAB%1~jump_2               * 89131

* refs (4): 88A8A 88C6F 88EAC 8967F
SUB_89135:
            GOSUB   EXAB0~jump_4                 * 89135
            GOSUB   PutAB%1~jump_2               * 89139
            GOTO    EXAB0~jump_4                 * 8913D

* refs (5): 88B34 88B81 88D29 897A8 897EB
SUB_89141:
            GOSUB   GETAB0~jump_2                * 89141
            GOSUB   STAB0~jump_7                 * 89145
            GOSUB   GETAB0~jump_2                * 89149
            GOTO    EXAB0~jump_4                 * 8914D

* refs (13): 8888E 88A65 88D8F 88E38 89578 89639 ...
* A copy of Get2ABR0 in the library's second code part
Get2ABR0b:
            GOSUB   GETAB1~jump_2                * 89151

* refs (7): 88554 88E66 88EBF 88EDE 8966B 896E0 ...
SUB_89155:
            GOSUB   STAB0~jump_7                 * 89155
            GOSUB   GETAB1~jump_2                * 89159
            GOTO    EXAB0~jump_4                 * 8915D

* refs (2): 89764 8976C
SUB_89161:
            GOSUB   SUB_89182                    * 89161
            GONC    L_8916C                      * 89165

* refs (2): 88D6F 896C0
SUB_89168:
            GOSUB   SUB_893E5                    * 89168
L_8916C:
            SETDEC                               * 8916C
            GOSUB   STAB0~jump_7                 * 8916E
            GOSUB   SUB_89176                    * 89172

* refs (1): 89172
SUB_89176:
            GOSUB   GETAB1~jump_2                * 89176
            GOSUB   SUB_88F8E                    * 8917A
            GOTO    SUB_89212                    * 8917E

* refs (2): 89161 89694
SUB_89182:
            A=0     W                            * 89182
            B=0     W                            * 89185
            P=      14                           * 89188
            B=B+1   P                            * 8918A
            B=B+1   P                            * 8918D
            RTN                                  * 89190

* refs (5): 88E56 89635 896A6 89705 89770
SUB_89192:
            D1=D1-  16                           * 89192
            D1=D1-  5                            * 89195

* refs (1): 89574
SUB_89198:
            D1=D1-  16                           * 89198
            D1=D1-  5                            * 8919B

* refs (5): 8881C 88E3C 89794 89800 89824
SUB_8919E:
            D1=D1-  16                           * 8919E
            D1=D1-  5                            * 891A1
            D1=D1-  16                           * 891A4
            D1=D1-  5                            * 891A7

* refs (11): 8872A 888F6 88922 88A61 88BAD 88C0D ...
SUB_891AA:
            D1=D1-  16                           * 891AA
            D1=D1-  16                           * 891AD
            D1=D1-  10                           * 891B0
            RTN                                  * 891B3

* refs (1): 8884B
SUB_891B5:
            D1=D1+  16                           * 891B5
            D1=D1+  5                            * 891B8

* refs (2): 887A5 88E6E
SUB_891BB:
            D1=D1+  16                           * 891BB
            D1=D1+  5                            * 891BE
            D1=D1+  16                           * 891C1
            D1=D1+  5                            * 891C4

* refs (4): 888AE 88E34 88E44 89683
SUB_891C7:
            D1=D1+  16                           * 891C7
            D1=D1+  5                            * 891CA

* refs (6): 888DC 88DB6 88DC2 89768 8977C 89814
SUB_891CD:
            D1=D1+  16                           * 891CD
            D1=D1+  16                           * 891D0
            D1=D1+  10                           * 891D3
            RTN                                  * 891D6

* refs (2): 88B30 88C94
SUB_891D8:
            D0=D0-  16                           * 891D8
            D0=D0-  5                            * 891DB
            D0=D0-  16                           * 891DE
            D0=D0-  5                            * 891E1

* refs (3): 88AB8 88B68 8978C
SUB_891E4:
            D0=D0-  16                           * 891E4
            D0=D0-  5                            * 891E7

* refs (3): 8866E 8868C 88BB9
SUB_891EA:
            D0=D0-  16                           * 891EA
            D0=D0-  5                            * 891ED

* refs (15): 88985 889A2 88A2B 88B03 88B18 88B5C ...
* D0 -= 42: back two extended reals
D0Back2%%:
            D0=D0-  16                           * 891F0
            D0=D0-  16                           * 891F3
            D0=D0-  10                           * 891F6
            RTN                                  * 891F9

* refs (1): 894CC
SUB_891FB:
            D0=D0+  16                           * 891FB
            D0=D0+  5                            * 891FE
            D0=D0+  16                           * 89201
            D0=D0+  5                            * 89204

* refs (2): 88AE5 88B4A
SUB_89207:
            D0=D0+  16                           * 89207
            D0=D0+  16                           * 8920A
            D0=D0+  10                           * 8920D
            RTN                                  * 89210

* refs (6): 884F7 8861F 88912 88D81 8917E 8975C
SUB_89212:
            D1=D1-  16                           * 89212
            D1=D1-  5                            * 89215

* refs (11): 88460 8876D 88773 8893A 889FC 88C31 ...
PutAB%1~jump_2:
            GOVLNG  PutAB%1                      * 89218

* refs (13): 88642 88657 886B5 886EE 88969 889CD ...
* D0 -= 21, then PUTAB0: store A/B as the %% before D0, leaving D0 there
PUTAB0Back:
            D0=D0-  16                           * 8921F
            D0=D0-  5                            * 89222

* refs (13): 88680 8899C 88AD4 88B07 88B77 88BC8 ...
PUTAB0~jump_3:
            GOVLNG  PUTAB0                       * 89225

* refs (3): 88605 8875B 889D3
SUB_8922C:
            D1=D1-  16                           * 8922C
            D1=D1-  5                            * 8922F

* refs (28): 884DF 8856F 885AB 88648 88730 88884 ...
GETAB1~jump_2:
            GOVLNG  GETAB1                       * 89232

* refs (10): 88660 88686 88979 889A8 88A25 8911A ...
GETAB0~jump_2:
            GOVLNG  GETAB0                       * 89239

* refs (14): 88569 88698 887AB 888E2 888FC 889B8 ...
Get1%CD~jump_2:
            GOVLNG  Get1%CD                      * 89240

* refs (2): 89481 894DC
SUB_89247:
            P=      0                            * 89247
            LC(5)   #0025D                       * 89249
            GOTO    L_8925D                      * 89250

* refs (2): 8910A 89844
SUB_89254:
            P=      0                            * 89254
            LC(5)   #001F4                       * 89256
L_8925D:
            D=C     A                            * 8925D
            C=R4                                 * 8925F
            SETHEX                               * 89262
            C=C+D   A                            * 89264
            SETDEC                               * 89266
            D0=C                                 * 89268
            GOTO    PUTAB0~jump_3                * 8926B

* refs (1): 89485
SUB_8926F:
            P=      0                            * 8926F
            LC(5)   #00209                       * 89271
            GOTO    L_89285                      * 89278

* refs (3): 88CD3 89112 89469
SUB_8927C:
            P=      0                            * 8927C
            LC(5)   #001F4                       * 8927E
L_89285:
            D=C     A                            * 89285
            C=R4                                 * 89287
            SETHEX                               * 8928A
            C=C+D   A                            * 8928C
            SETDEC                               * 8928E
            D0=C                                 * 89290

* refs (15): 88674 886CC 886DB 8898B 88A2F 88B2C ...
GETCD0~jump_2:
            GOVLNG  GETCD0                       * 89293

* refs (1): 895D8
SUB_8929A:
            P=      0                            * 8929A
            LC(3)   #011                         * 8929C
            GOTO    L_893CE                      * 892A1

* refs (1): 88940
SUB_892A5:
            P=      0                            * 892A5
            LC(3)   #03B                         * 892A7
            GOTO    L_893CE                      * 892AC

* refs (1): 88625
SUB_892B0:
            P=      0                            * 892B0
            LC(3)   #050                         * 892B2
            GOTO    L_893CE                      * 892B7

* refs (1): 88A81
SUB_892BB:
            P=      0                            * 892BB
            LC(3)   #07A                         * 892BD
            GOTO    L_893CE                      * 892C2

* refs (1): 88E30
SUB_892C6:
            P=      0                            * 892C6
            LC(3)   #10D                         * 892C8
            GOTO    L_893CE                      * 892CD

* refs (1): 88761
SUB_892D1:
            P=      0                            * 892D1
            LC(3)   #122                         * 892D3
            GOTO    L_893CE                      * 892D8

* refs (1): 88EA8
SUB_892DC:
            P=      0                            * 892DC
            LC(3)   #137                         * 892DE
            GOTO    L_893CE                      * 892E3

* refs (1): 8967B
SUB_892E7:
            P=      0                            * 892E7
            LC(3)   #161                         * 892E9
            GOTO    L_893CE                      * 892EE

* refs (3): 88784 88A52 88D33
SUB_892F2:
            P=      0                            * 892F2
            LC(3)   #18B                         * 892F4
            GOTO    L_893CE                      * 892F9

* refs (1): 8880C
SUB_892FD:
            P=      0                            * 892FD
            LC(3)   #1A0                         * 892FF
            GOTO    L_893CE                      * 89304

* refs (1): 8972D
SUB_89308:
            P=      0                            * 89308
            LC(3)   #1B5                         * 8930A
            GOTO    L_893CE                      * 8930F

* refs (1): 88599
SUB_89313:
            P=      0                            * 89313
            LC(3)   #1CA                         * 89315
            GOTO    L_893CE                      * 8931A

* refs (1): 88724
SUB_8931E:
            P=      0                            * 8931E
            LC(3)   #1DF                         * 89320
            GOTO    L_893CE                      * 89325

* refs (1): 88C6B
SUB_89329:
            P=      0                            * 89329
            LC(3)   #1F4                         * 8932B
            GOTO    L_893CE                      * 89330

* refs (1): 88DD2
SUB_89334:
            P=      0                            * 89334
            LC(3)   #011                         * 89336
            GOTO    L_893D6                      * 8933B

* refs (1): 8854E
SUB_8933F:
            P=      0                            * 8933F
            LC(3)   #026                         * 89341
            GOTO    L_893D6                      * 89346

* refs (2): 89667 8971F
SUB_8934A:
            P=      0                            * 8934A
            LC(3)   #050                         * 8934C
            GOTO    L_893D6                      * 89351

* refs (1): 8887A
SUB_89355:
            P=      0                            * 89355
            LC(3)   #0A4                         * 89357
            GOTO    L_893D6                      * 8935C

* refs (1): 8960C
SUB_89360:
            P=      0                            * 89360
            LC(3)   #0F8                         * 89362
            GOTO    L_893D6                      * 89367

* refs (1): 888BA
SUB_8936B:
            P=      0                            * 8936B
            LC(3)   #10D                         * 8936D
            GOTO    L_893D6                      * 89372

* refs (1): 88799
SUB_89376:
            P=      0                            * 89376
            LC(3)   #122                         * 89378
            GOTO    L_893D6                      * 8937D

* refs (4): 88AF7 88E62 88EBB 88EDA
SUB_89381:
            P=      0                            * 89381
            LC(3)   #137                         * 89383
            GOTO    L_893D6                      * 89388

* refs (1): 88C63
SUB_8938C:
            P=      0                            * 8938C
            LC(3)   #14C                         * 8938E
            GOTO    L_893D6                      * 89393

* refs (1): 896DC
SUB_89397:
            P=      0                            * 89397
            LC(3)   #161                         * 89399
            GOTO    L_893D6                      * 8939E

* refs (1): 895E0
SUB_893A2:
            P=      0                            * 893A2
            LC(3)   #18B                         * 893A4
            GOTO    L_893D6                      * 893A9

* refs (1): 89747
SUB_893AD:
            P=      0                            * 893AD
            LC(3)   #1B5                         * 893AF
            GOTO    L_893D6                      * 893B4

* refs (2): 88E16 896EC
SUB_893B8:
            P=      0                            * 893B8
            LC(3)   #1CA                         * 893BA
            GOTO    L_893D6                      * 893BF

* refs (1): 887F1
SUB_893C3:
            P=      0                            * 893C3
            LC(3)   #1DF                         * 893C5
            GOTO    L_893D6                      * 893CA
L_893CE:
            GOSUB   SUB_893E5                    * 893CE
            GOTO    PutAB%1~jump_2               * 893D2
L_893D6:
            GOSUB   SUB_893E5                    * 893D6
            GOTO    GETAB1~jump_2                * 893DA

* refs (2): 89549 89760
SUB_893DE:
            P=      0                            * 893DE
            LC(3)   #026                         * 893E0

* refs (4): 88842 89168 893CE 893D6
SUB_893E5:
            SETHEX                               * 893E5
            P=      3                            * 893E7
            LC(2)   #00                          * 893E9
            P=      0                            * 893ED
            D=C     A                            * 893EF
            C=R4                                 * 893F1
            C=C+D   A                            * 893F4
            D1=C                                 * 893F6
            RTN                                  * 893F9

* refs (5): 885C0 885CE 8877B 8902D 89089
SUB_893FB:
            GOSUB   SUB_89403                    * 893FB
            GOTO    GETAB1~jump_2                * 893FF

* refs (3): 88EEB 893FB 89555
SUB_89403:
            SETHEX                               * 89403
            D=C     A                            * 89405
            C=R4                                 * 89407
            D1=C                                 * 8940A
            C=DAT1  A                            * 8940D
            C=C-D   A                            * 89410
            GOSBVL  SUB_3769C                    * 89412
            P=      0                            * 89419
            LC(5)   #00272                       * 8941B
L_89422:
            D=D+C   A                            * 89422
            CD1EX                                * 89424
            C=C+D   A                            * 89427
            D1=C                                 * 89429
            RTN                                  * 8942C

* refs (2): 8896F 88AB2
SUB_8942E:
            GOSUB   SUB_8943E                    * 8942E
            GOTO    PutAB%1~jump_2               * 89432

* refs (1): 89598
SUB_89436:
            GOSUB   SUB_8943E                    * 89436
            GOTO    GETAB1~jump_2                * 8943A

* refs (3): 88EF5 8942E 89436
SUB_8943E:
            SETHEX                               * 8943E
            D=C     A                            * 89440
            C=R4                                 * 89442
            D1=C                                 * 89445
            C=DAT1  A                            * 89448
            D=C-D   A                            * 8944B
            D1=D1+  5                            * 8944D
            C=DAT1  A                            * 89450
            C=C+D   A                            * 89453
            GOSBVL  SUB_3769C                    * 89455
            P=      0                            * 8945C
            LC(5)   #00282                       * 8945E
            GOTO    L_89422                      * 89465

* refs (2): 897AC 897F8
SUB_89469:
            GOSUB   SUB_8927C                    * 89469
            GOSUB   L_88F78                      * 8946D
            GOSUB   EXAB0~jump_4                 * 89471
            GOSUB   GETCD0~jump_2                * 89475
            GOSUB   L_88F78                      * 89479
            GOTO    EXAB0~jump_4                 * 8947D

* refs (4): 88EA4 896E4 89784 897A0
SUB_89481:
            GOSUB   SUB_89247                    * 89481

* refs (1): 89522
SUB_89485:
            GOSUB   SUB_8926F                    * 89485
            GOSUB   MULTF~jump_6                 * 89489
            GOSUB   STAB2~jump_7                 * 8948D
            GOSUB   RCAB0~jump_2                 * 89491
            GOSUB   D0Back2%%                    * 89495
            GOSUB   MulD0%%                      * 89499
            GOSUB   RCCD2~jump_7                 * 8949D
            CD0EX                                * 894A1
            RSTK=C                               * 894A4
            CD0EX                                * 894A6
            GOSBVL  RADDF                        * 894A9
            C=RSTK                               * 894B0
            D0=C                                 * 894B2
            GOSUB   EXAB0~jump_4                 * 894B5
            A=-A-1  S                            * 894B9
            GOSUB   MulD0%%                      * 894BC
            GOSUB   STAB2~jump_7                 * 894C0
            GOSUB   D0Back2%%                    * 894C4
            GOSUB   GETAB0~jump_2                * 894C8
            GOSUB   SUB_891FB                    * 894CC
            GOSUB   MulD0%%                      * 894D0
            GOSUB   RCCD2~jump_7                 * 894D4
            GOTO    L_88F78                      * 894D8

* refs (4): 89677 89701 89808 89820
SUB_894DC:
            GOSUB   SUB_89247                    * 894DC
            GOSUB   EXAB0~jump_4                 * 894E0
            A=-A-1  S                            * 894E4
            GOSUB   STAB2~jump_7                 * 894E7
            GOSUB   SUB_898F6                    * 894EB
            P=      14                           * 894EF
            ?B#0    WP                           * 894F1
            GOYES   L_8950E                      * 894F4
            B=0     S                            * 894F6
            B=B+1   P                            * 894F9
            C=0     W                            * 894FC
            P=      3                            * 894FF
            LC(1)   #5                           * 89501
            A=C     W                            * 89504

* refs (18): 885C6 8879F 887CD 888D6 8892E 88A73 ...
STAB0~jump_7:
            GOVLNG  STAB0                        * 89507
L_8950E:
            GOSUB   D0Back2%%                    * 8950E
            GOSUB   PUTAB0~jump_3                * 89512
            GOSUB   RCAB2~jump_4                 * 89516
            GOSUB   STAB0~jump_7                 * 8951A
            GOSUB   GETAB0~jump_2                * 8951E
            GOSUB   SUB_89485                    * 89522
            GOSUB   D0Back2%%                    * 89526
            GOSUB   GETCD0~jump_2                * 8952A
            GOSBVL  STCD2                        * 8952E
            GOSUB   DIVF~jump_4                  * 89535
            GOSUB   EXAB0~jump_4                 * 89539
            GOSUB   RCCD2~jump_7                 * 8953D
            GOSUB   DIVF~jump_4                  * 89541
            GOTO    EXAB0~jump_4                 * 89545

* refs (2): 8853C 8859F
SUB_89549:
            GOSUB   SUB_893DE                    * 89549
            D0=C                                 * 8954D
            C=0     A                            * 89550
            LC(1)   #2                           * 89552
            GOSUB   SUB_89403                    * 89555
            C=0     W                            * 89559
            R0=C                                 * 8955C
            R1=C                                 * 8955F
            LC(1)   #2                           * 89562
L_89565:
            GOSUB   GETAB1~jump_2                * 89565
            GOSUB   SUB_890F7                    * 89569
            C=C-1   A                            * 8956D
            GONC    L_89565                      * 8956F
            RTN                                  * 89572
L_89574:
            GOSUB   SUB_89198                    * 89574
            GOSUB   Get2ABR0b                    * 89578
            SETDEC                               * 8957C
            GOSUB   SUB_898A8                    * 8957E
            GOSUB   STAB0~jump_7                 * 89582
            C=R4                                 * 89586
            D1=C                                 * 89589
            C=DAT1  A                            * 8958C
            SETHEX                               * 8958F
            C=C-1   A                            * 89591
            R2=C                                 * 89593
            C=C+1   A                            * 89596
            GOSUB   SUB_89436                    * 89598
            A=0     S                            * 8959C
L_8959F:
            SETDEC                               * 8959F
            GOSUB   SUB_88F8E                    * 895A1
            GOSUB   Get1%CD~jump_2               * 895A5
            C=0     S                            * 895A9
            GOSUB   L_88F78                      * 895AC
            GOSBVL  CkATTNcode                   * 895B0
            C=R2                                 * 895B7
            C=C-1   A                            * 895BA
            R2=C                                 * 895BC
            GONC    L_8959F                      * 895BF
            SETDEC                               * 895C2
            ?ST=0   0                            * 895C4
            GOYES   L_895CD                      * 895C7
            GOSUB   SUB_88FB0                    * 895C9
L_895CD:
            P=      0                            * 895CD
            LC(5)   #00013                       * 895CF
            A=A-C   A                            * 895D6
            GOSUB   SUB_8929A                    * 895D8
            GOSUB   STAB2~jump_7                 * 895DC
            GOSUB   SUB_893A2                    * 895E0
            GOSUB   SUB_88F2A                    * 895E4
            GOSBVL  EXAB2                        * 895E8
            GOSUB   SubCDTestb                   * 895EF
            GONC    L_895FA                      * 895F3
            GOTO    L_88EBB                      * 895F6
L_895FA:
            C=R4                                 * 895FA
            D1=C                                 * 895FD
            D1=D1+  10                           * 89600
            C=DAT1  S                            * 89603
            ?C=0    S                            * 89607
            GOYES   L_89625                      * 8960A
            GOSUB   SUB_89360                    * 8960C
            GOSUB   RCCD2~jump_7                 * 89610
            GOSUB   XYEX~jump_5                  * 89614
            GOSUB   SubCDTestb                   * 89618
            GONC    L_89625                      * 8961C
            GOLONG  L_88D40                      * 8961F
L_89625:
            GOSUB   SUB_89667                    * 89625
            GOSUB   SUB_891AA                    * 89629
            GOSUB   GETAB1~jump_2                * 8962D
            GOSUB   STAB2~jump_7                 * 89631
            GOSUB   SUB_89192                    * 89635
            GOSUB   Get2ABR0b                    * 89639
            GOSUB   SUB_898A8                    * 8963D
            GOSUB   SUB_88F2A                    * 89641
            GOSBVL  EXAB2                        * 89645
            GOSUB   L_88F78                      * 8964C
            GOSUB   RCCD2~jump_7                 * 89650
            GOSUB   SubCDTestb                   * 89654
            ?B#0    WP                           * 89658
            GOYES   L_89661                      * 8965B
            GOTO    L_88EBB                      * 8965D
L_89661:
            GOLONG  L_88799                      * 89661

* refs (2): 885A5 89625
SUB_89667:
            GOSUB   SUB_8934A                    * 89667
            GOSUB   SUB_89155                    * 8966B
            GOSUB   SUB_8910A                    * 8966F
            GOSUB   Get2ABR0b                    * 89673
            GOSUB   SUB_894DC                    * 89677
            GOSUB   SUB_892E7                    * 8967B
            GOSUB   SUB_89135                    * 8967F
            GOSUB   SUB_891C7                    * 89683
            GOSUB   Get1%CD~jump_2               * 89687
            GOSBVL  STCD2                        * 8968B
            SETDEC                               * 89692
            GOSUB   SUB_89182                    * 89694
            GOSUB   DIVF~jump_4                  * 89698
            A=-A-1  S                            * 8969C
            GOSBVL  RADD1                        * 8969F
            GOSUB   SUB_89192                    * 896A6
            GOSUB   L_8916C                      * 896AA
            GOSUB   RCAB2~jump_4                 * 896AE
            GOSBVL  RSUB1                        * 896B2
            P=      0                            * 896B9
            LC(3)   #050                         * 896BB
            GOSUB   SUB_89168                    * 896C0
            GOSUB   RCAB2~jump_4                 * 896C4
            GOSUB   SUB_88F8E                    * 896C8
            GOSUB   SUB_88FB7                    * 896CC
            GOSUB   L_8916C                      * 896D0
            GOSUB   SUB_89760                    * 896D4
            GOSUB   SUB_8910A                    * 896D8
            GOSUB   SUB_89397                    * 896DC
            GOSUB   SUB_89155                    * 896E0
            GOSUB   SUB_89481                    * 896E4
            GOSUB   STAB2~jump_7                 * 896E8
            GOSUB   SUB_893B8                    * 896EC
            SETDEC                               * 896F0
            GOSBVL  RSUB1                        * 896F2
            GOSUB   RCCD2~jump_7                 * 896F9
            GOSUB   L_88F78                      * 896FD
            GOSUB   SUB_894DC                    * 89701
            GOSUB   SUB_89192                    * 89705
            GOSUB   SUB_89131                    * 89709
            GOSUB   SUB_898A8                    * 8970D
            D1=D1+  16                           * 89711
            D1=D1+  5                            * 89714
            GOSUB   PutAB%1~jump_2               * 89717
            GOSUB   STAB2~jump_7                 * 8971B
            GOSUB   SUB_8934A                    * 8971F
            GOSUB   SUB_89155                    * 89723
            SETDEC                               * 89727
            GOSUB   SUB_898A8                    * 89729
            GOSUB   SUB_89308                    * 8972D
            GOSUB   GETAB1~jump_2                * 89731
            SETDEC                               * 89735
            GOSUB   SQRF~jump_3                  * 89737
            GOSUB   RCCD2~jump_7                 * 8973B
            GOSUB   MULTF~jump_6                 * 8973F

* refs (2): 885FF 88755
SUB_89743:
            GOSUB   STAB0~jump_7                 * 89743
            GOSUB   SUB_893AD                    * 89747
            GOSUB   RCCD0~jump_7                 * 8974B
            GOSUB   SubCDTestb                   * 8974F
            RTNNC                                * 89753
            GOSUBL  RCAB0~jump_2                 * 89756
            GOTO    SUB_89212                    * 8975C

* refs (2): 88542 896D4
SUB_89760:
            GOSUB   SUB_893DE                    * 89760
            GOSUB   SUB_89161                    * 89764
            GOSUB   SUB_891CD                    * 89768
            GOSUB   SUB_89161                    * 8976C
            GOSUB   SUB_89192                    * 89770
            GOSUB   Get2ABR0b                    * 89774
            GOSUB   SUB_8910A                    * 89778
            GOSUB   SUB_891CD                    * 8977C
            GOSUB   Get2ABR0b                    * 89780
            GOSUB   SUB_89481                    * 89784
            GOSUB   SUB_8982C                    * 89788
            GOSUB   SUB_891E4                    * 8978C
            GOSUB   SUB_890F7                    * 89790
            GOSUB   SUB_8919E                    * 89794
            GOSUB   Get2ABR0b                    * 89798
            GOSUB   SUB_8910A                    * 8979C
            GOSUB   SUB_89481                    * 897A0
            GOSUB   SUB_8910A                    * 897A4
            GOSUB   SUB_89141                    * 897A8
            GOSUB   SUB_89469                    * 897AC
            GOSUB   SUB_8983A                    * 897B0
            D0=D0+  16                           * 897B4
            D0=D0+  5                            * 897B7
            GOSUB   SUB_890F7                    * 897BA
            GOSUB   SUB_891AA                    * 897BE
            GOSUB   Get2ABR0b                    * 897C2
            GOSUB   SUB_8982C                    * 897C6
            GOSUB   SUB_8910A                    * 897CA
            GOSUBL  MulD0%%                      * 897CE
            GOSUB   EXAB0~jump_4                 * 897D4
            GOSUBL  MulD0%%                      * 897D8
            GOSUBL  SUB_88F74                    * 897DE
            C=A     S                            * 897E4
            GOSUB   D0Back2%%                    * 897E7
            GOSUB   SUB_89141                    * 897EB
            ?C=0    S                            * 897EF
            GOYES   L_897F8                      * 897F2
            GOSUB   SUB_8982C                    * 897F4
L_897F8:
            GOSUB   SUB_89469                    * 897F8
            GOSUB   SUB_8910A                    * 897FC
            GOSUB   SUB_8919E                    * 89800
            GOSUB   Get2ABR0b                    * 89804
            GOSUB   SUB_894DC                    * 89808
            GOSUB   SUB_891AA                    * 8980C
            GOSUB   SUB_89131                    * 89810
            GOSUB   SUB_891CD                    * 89814
            GOSUB   Get2ABR0b                    * 89818
            GOSUB   SUB_89112                    * 8981C
            GOSUB   SUB_894DC                    * 89820
            GOSUB   SUB_8919E                    * 89824
            GOTO    SUB_89131                    * 89828

* refs (3): 89788 897C6 897F4
SUB_8982C:
            A=-A-1  S                            * 8982C
            C=R0                                 * 8982F
            C=-C-1  S                            * 89832
            R0=C                                 * 89835
            RTN                                  * 89838

* refs (1): 897B0
SUB_8983A:
            GOSUBL  STAB2~jump_7                 * 8983A
            GOSUB   EXAB0~jump_4                 * 89840
            GOSUB   SUB_89254                    * 89844
            GOSUB   SUB_898A8                    * 89848
            ?B#0    W                            * 8984C
            GOYES   L_89855                      * 8984F
            GOTO    STAB0~jump_7                 * 89851
L_89855:
            GOSUBL  RCCD2~jump_7                 * 89855
            C=0     S                            * 8985B
            GOSUBL  L_88F78                      * 8985E
            GOSUBL  SUB_88FB7                    * 89864
            GOSUB   SQRF~jump_3                  * 8986A
            GOSUB   STAB0~jump_7                 * 8986E
            GOSUBL  SUB_88FB0                    * 89872
            D0=D0-  16                           * 89878
            D0=D0-  5                            * 8987B
            GOSUB   GETCD0~jump_2                * 8987E
            GOSUBL  XYEX~jump_5                  * 89882
            GOSUBL  DIVF~jump_4                  * 89888
            C=R2                                 * 8988E
            ?C=0    S                            * 89891
            GOYES   L_898A4                      * 89894
            C=R0                                 * 89896
            C=A     S                            * 89899
            R0=C                                 * 8989C
            A=0     S                            * 8989F
            RTN                                  * 898A2
L_898A4:
            GOTO    EXAB0~jump_4                 * 898A4

* refs (7): 88D2D 88D93 8957E 8963D 8970D 89729 ...
SUB_898A8:
            P=      14                           * 898A8
            C=R1                                 * 898AA
            ?C#0    WP                           * 898AD
            GOYES   L_898B7                      * 898B0
L_898B2:
            A=0     S                            * 898B2
            RTN                                  * 898B5
L_898B7:
            ?B#0    WP                           * 898B7
            GOYES   L_898C5                      * 898BA
            GOSUBL  RCAB0~jump_2                 * 898BC
            GONC    L_898B2                      * 898C2
L_898C5:
            GOSUBL  SUB_88FA1                    * 898C5
            GOSUB   EXAB0~jump_4                 * 898CB
            GOSUBL  SUB_88FA1                    * 898CF
            GOSUBL  RCCD0~jump_7                 * 898D5
            CD0EX                                * 898DB
            RSTK=C                               * 898DE
            CD0EX                                * 898E0
            GOSBVL  RADDF                        * 898E3
            C=RSTK                               * 898EA
            D0=C                                 * 898EC

* refs (2): 89737 8986A
SQRF~jump_3:
            GOVLNG  SQRF                         * 898EF

* refs (2): 88A6D 894EB
SUB_898F6:
            GOSUBL  SUB_88FA1                    * 898F6
            GOSUB   EXAB0~jump_4                 * 898FC
            GOSUBL  SUB_88FA1                    * 89900
            GOLONG  SUB_88F74                    * 89906
          ENDCODE                                * 8990C
        ;                                        * 8990C

LIB0C0.hash:
        CON(5)  DOHSTR                           * 89911  hash table of library 0C0
        LENGTH                                   * 89916  length, to #89975
        CON(5)  0                                * 8991B  names of length 1
        CON(5)  0                                * 89920  names of length 2
        CON(5)  0                                * 89925  names of length 3
        CON(5)  0                                * 8992A  names of length 4
        CON(5)  0                                * 8992F  names of length 5
        CON(5)  0                                * 89934  names of length 6
        CON(5)  0                                * 89939  names of length 7
        CON(5)  0                                * 8993E  names of length 8
        CON(5)  0                                * 89943  names of length 9
        CON(5)  0                                * 89948  names of length 10
        CON(5)  0                                * 8994D  names of length 11
        CON(5)  0                                * 89952  names of length 12
        CON(5)  0                                * 89957  names of length 13
        CON(5)  0                                * 8995C  names of length 14
        CON(5)  0                                * 89961  names of length 15
        CON(5)  0                                * 89966  names of length 16
        REL(5)  L_89970                          * 8996B  end of the names
L_89970:
        CON(5)  0                                * 89970  command 000 has no name
        ENDLENGTH                                * 89975

LIB0C0.link:
        CON(5)  DOHSTR                           * 89975  link table of library 0C0
        LENGTH                                   * 8997A  length, to #8998E
        REL(5)  ROMP_0C0_000                     * 8997F  000 
        REL(5)  ROMP_0C0_001                     * 89984  001 
        REL(5)  ROMP_0C0_002                     * 89989  002 
