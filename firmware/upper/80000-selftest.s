* HP 48GX ROM revision R, #80000-#82006: Self-test code (runs with RAM unconfigured)
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: KeyTestDiag KeyTestAll

        ORG     #80000
L_80000:
        C=0     A                                * 80000
        R1=C                                     * 80002
        GOSBVL  ClrScrMn                         * 80005
        GOSUBL  SUB_8150C                        * 8000C
        GOSBVL  L_01C7F                          * 80012
        GOTO    L_8002B                          * 80019
L_8001D:
        C=0     A                                * 8001D
        GOSUBL  SUB_804B6                        * 8001F
        GOSUBL  SUB_814C5                        * 80025
L_8002B:
        GOSUBL  L_802BE                          * 8002B
        GOSBVL  SUB_00D3B                        * 80031
        GOSUBL  Flush~jump                       * 80038
        ?ST=1   6                                * 8003E
        GOYES   L_80091                          * 80041
        RSI                                      * 80043
L_80048:
        GOSBVL  POPKEY                           * 80048
        GOC     L_80048                          * 8004F
        B=C     A                                * 80052
        GOSUBL  ClrScrMn~jump                    * 80054
        C=0     A                                * 8005A
        LC(2)   #1C                              * 8005C
        ?B>C    A                                * 80060
        GOYES   L_8001D                          * 80063
        B=B-1   A                                * 80065
        A=B     A                                * 80067
        LC(5)   L_80232                          * 80069
        GOSUB   SUB_80081                        * 80070
        LC(5)   L_8001D                          * 80074
        RSTK=C                                   * 8007B
        PC=(A)                                   * 8007D

* refs (1): 80070
SUB_80081:
        RSTK=C                                   * 80081
        C=A     A                                * 80083
        A=A+A   A                                * 80085
        A=A+A   A                                * 80087
        A=A+C   A                                * 80089
        C=RSTK                                   * 8008B
        A=A+C   A                                * 8008D
        RTN                                      * 8008F
L_80091:
        GOSUBL  ClrScrMn~jump                    * 80091
        GOSUBL  SUB_80329                        * 80097
        GOSUBL  SUB_8155D                        * 8009D
        GOSUBL  SUB_80389                        * 800A3
        GOSUBL  SUB_8155D                        * 800A9
        GOSUBL  SUB_804C0                        * 800AF
        GOSUBL  SUB_8155D                        * 800B5
        GOSUBL  SUB_8066D                        * 800BB
        GOSUBL  SUB_8155D                        * 800C1
        ?ST=0   10                               * 800C7
        GOYES   L_800ED                          * 800CA
        ?ST=0   7                                * 800CC
        GOYES   L_800E1                          * 800CF
        GOSUBL  SUB_80D8B                        * 800D1
        GOSUBL  SUB_8155D                        * 800D7
        GOTO    L_800ED                          * 800DD
L_800E1:
        GOSUBL  SUB_80D39                        * 800E1
        GOSUBL  SUB_8155D                        * 800E7
L_800ED:
        ?ST=0   8                                * 800ED
        GOYES   L_800FE                          * 800F0
        GOSUBL  SUB_810E6                        * 800F2
        GOSUBL  SUB_8155D                        * 800F8
L_800FE:
        GOSUB   SUB_802C8                        * 800FE
        GOSUB   SUB_802DF                        * 80102
        GOSUBL  SUB_8155D                        * 80106
        GOSUBL  SUB_815D3                        * 8010C
        GOSUBL  ClrScrMn~jump                    * 80112
        GOTO    L_8002B                          * 80118
L_8011C:
        ST=0    8                                * 8011C
        ST=0    10                               * 8011F
        GOTO    L_80160                          * 80122
L_80126:
        ST=0    8                                * 80126
        ST=1    10                               * 80129
        ST=0    7                                * 8012C
        GOTO    L_80160                          * 8012F
L_80133:
        ST=0    8                                * 80133
        ST=1    10                               * 80136
        ST=1    7                                * 80139
        GOTO    L_80160                          * 8013C
L_80140:
        ST=1    8                                * 80140
        ST=0    10                               * 80143
        GOTO    L_80160                          * 80146
L_8014A:
        ST=1    8                                * 8014A
        ST=1    10                               * 8014D
        ST=0    7                                * 80150
        GOTO    L_80160                          * 80153
L_80157:
        ST=1    8                                * 80157
        ST=1    10                               * 8015A
        ST=1    7                                * 8015D
L_80160:
        GOVLNG  L_0116B                          * 80160

* refs (2): 802AA 80CB1
SUB_80167:
        GOSBVL  SUB_012F9                        * 80167
        GONC    L_80174                          * 8016E
        C=0     W                                * 80171
L_80174:
        GOSUBL  SUB_80EBC                        * 80174
        D1=(4)  #0078                            * 8017A
        DAT1=C  13                               * 80180
        C=0     W                                * 80184
        C=-C-1  W                                * 80187
        D1=(4)  #0085                            * 8018A
        DAT1=C  13                               * 80190
        D0=(5)  L_818D5                          * 80194
        GOSUBL  SUB_815FE                        * 8019B
        GOTO    L_80202                          * 801A1
L_801A5:
        D0=(5)  L_818E9                          * 801A5
        GOSUBL  SUB_8165A                        * 801AC
        D1=(4)  #0084                            * 801B2
        GOTO    L_801CF                          * 801B8
L_801BC:
        D0=(5)  L_818F7                          * 801BC
        GOSUBL  SUB_8165A                        * 801C3
        D1=(4)  #0091                            * 801C9
L_801CF:
        CD1EX                                    * 801CF
        D1=C                                     * 801D2
        D0=C                                     * 801D5
        D0=(4)  #009E                            * 801D8
        P=      15                               * 801DE
        LC(1)   #C                               * 801E0
        P=      0                                * 801E3
L_801E5:
        C=DAT1  1                                * 801E5
        GOSUB   SUB_80215                        * 801E9
        DAT0=C  B                                * 801ED
        D0=D0+  2                                * 801F0
        D1=D1-  1                                * 801F3
        C=C-1   S                                * 801F6
        GONC    L_801E5                          * 801F9
        GOSUBL  L_81602                          * 801FC
L_80202:
        GOSUBL  SUB_81769                        * 80202
        GOSUBL  SUB_8155D                        * 80208
        GOVLNG  ClrScrMn                         * 8020E

* refs (1): 801E9
SUB_80215:
        A=0     B                                * 80215
        A=C     P                                * 80218
        LC(2)   #39                              * 8021B
        CAEX    P                                * 8021F
        ?C<=A   P                                * 80222
        RTNYES                                   * 80225
        CAEX    P                                * 80227
        LC(1)   #7                               * 8022A
        C=C+A   B                                * 8022D
        RTN                                      * 80230

* Self-test commands by key code - 1 (dispatched by PC=(A) at #8007D)
L_80232:
        CON(5)  SUB_80329                        * 80232  entry 0
        CON(5)  SUB_80389                        * 80237  entry 1
        CON(5)  SUB_804C0                        * 8023C  entry 2
        CON(5)  SUB_8066D                        * 80241  entry 3
        CON(5)  L_80828                          * 80246  entry 4
        CON(5)  L_80821                          * 8024B  entry 5
        CON(5)  L_809BE                          * 80250  entry 6
        CON(5)  SUB_80D39                        * 80255  entry 7
        CON(5)  L_80EC3                          * 8025A  entry 8
        CON(5)  L_8107D                          * 8025F  entry 9
        CON(5)  SUB_810E6                        * 80264  entry 10
        CON(5)  L_80B2D                          * 80269  entry 11
        CON(5)  L_80B43                          * 8026E  entry 12
        CON(5)  L_80C20                          * 80273  entry 13
        CON(5)  SUB_80D8B                        * 80278  entry 14
        CON(5)  L_80F79                          * 8027D  entry 15
        CON(5)  L_8001D                          * 80282  entry 16
        CON(5)  L_8001D                          * 80287  entry 17
        CON(5)  L_801A5                          * 8028C  entry 18
        CON(5)  L_801BC                          * 80291  entry 19
        CON(5)  L_80140                          * 80296  entry 20
        CON(5)  L_80126                          * 8029B  entry 21
        CON(5)  L_8014A                          * 802A0  entry 22
        CON(5)  L_80133                          * 802A5  entry 23
        CON(5)  SUB_80167                        * 802AA  entry 24
        CON(5)  L_8011C                          * 802AF  entry 25
        CON(5)  L_80157                          * 802B4  entry 26
        CON(5)  SUB_802DF                        * 802B9  entry 27
L_802BE:
        P=      0                                * 802BE
        LC(2)   #E4                              * 802C0
        GOTO    L_802D8                          * 802C4

* refs (2): 800FE 809F0
SUB_802C8:
        P=      0                                * 802C8
        LC(2)   #DA                              * 802CA
        GOTO    L_802D8                          * 802CE

* refs (10): 80329 80389 804C0 8066D 80832 80B2D ...
SUB_802D2:
        P=      0                                * 802D2
        LC(2)   #F4                              * 802D4
L_802D8:
        GOVLNG  RCKBp                            * 802D8

* refs (2): 80102 802B9
SUB_802DF:
        GOSUBL  ClrScrMn~jump                    * 802DF
        C=R1                                     * 802E5
        ?C#0    A                                * 802E8
        GOYES   L_80300                          * 802EB
        D0=(5)  L_81893                          * 802ED
        GOSUBL  SUB_8165A                        * 802F4
        C=0     A                                * 802FA
        GOTO    L_8031D                          * 802FC
L_80300:
        D0=(5)  L_818A1                          * 80300
        GOSUBL  SUB_8165A                        * 80307
        C=R1                                     * 8030D
        D0=C                                     * 80310
        GOSUBL  SUB_816AD                        * 80313
        LC(2)   #FA                              * 80319
L_8031D:
        GOSUBL  SUB_804B6                        * 8031D
        GOLONG  L_81765                          * 80323

* refs (2): 80097 80232
SUB_80329:
        GOSUBL  SUB_802D2                        * 80329
        D0=(5)  L_81823                          * 8032F
        GOSUBL  SUB_815FE                        * 80336
        GOSUB   SUB_80360                        * 8033C
        ASL     W                                * 80340
        GOSBVL  SUB_657B9                        * 80343
        GOSUBL  SUB_80EBC                        * 8034A
        D1=(4)  #009A                            * 80350
        DAT1=C  14                               * 80356
        GOLONG  L_81765                          * 8035A

* refs (1): 8033C
SUB_80360:
        GOSBVL  DisableIntr                      * 80360
        GOSBVL  DispOff                          * 80367
        GOSBVL  clkspd                           * 8036E
        GOSBVL  SUB_7017C                        * 80375
        GOSBVL  DispOn                           * 8037C
        GOLONG  L_80B26                          * 80383

* refs (2): 800A3 80237
SUB_80389:
        GOSUBL  SUB_802D2                        * 80389
        C=0     A                                * 8038F
        GOSUB   SUB_804B6                        * 80391
        GOSUB   ClrScrMn~jump                    * 80395
        D0=(5)  L_8182D                          * 80399
        GOSUBL  SUB_815FE                        * 803A0
        GOSUBL  SUB_8155D                        * 803A6
        LC(16)  #9249249249249249                * 803AC
        B=C     W                                * 803BE
        LC(2)   #12                              * 803C1
        GOSUB   SUB_804B6                        * 803C5
        GOSUB   SUB_80414                        * 803C9
        LC(2)   #A0                              * 803CD
        GOSUB   SUB_804B6                        * 803D1
        GOSUB   SUB_80414                        * 803D5
        LC(2)   #40                              * 803D9
        GOSUB   SUB_804B6                        * 803DD
        GOSUB   SUB_80414                        * 803E1
        LC(2)   #08                              * 803E5
        GOSUB   SUB_804B6                        * 803E9
        P=      8                                * 803ED
        GOSUB   SUB_8044F                        * 803EF
        LC(2)   #FA                              * 803F3
        GOSUB   SUB_804B6                        * 803F7
        P=      4                                * 803FB
        GOSUB   SUB_8044F                        * 803FD
        C=0     A                                * 80401
        GOSUB   SUB_804B6                        * 80403
        P=      2                                * 80407
        GOSUB   SUB_8044F                        * 80409

* refs (14): 80054 80091 80112 802DF 80395 80673 ...
ClrScrMn~jump:
        GOVLNG  ClrScrMn                         * 8040D

* refs (3): 803C9 803D5 803E1
SUB_80414:
        GOSBVL  D0->Row1                         * 80414
        C=0     A                                * 8041B
        LC(2)   #37                              * 8041D
        GOSUB   SUB_8043F                        * 80421
        GOSBVL  D0->Sft1                         * 80425
        C=0     A                                * 8042C
        LC(1)   #7                               * 8042E
        GOSUB   SUB_8043F                        * 80431
        BSRB                                     * 80435
        BSRB                                     * 80438
        GOTO    L_80477                          * 8043B

* refs (2): 80421 80431
SUB_8043F:
        D=C     A                                * 8043F
        C=B     W                                * 80441
L_80444:
        GOSUB   SUB_8049F                        * 80444
        D=D-1   A                                * 80448
        GONC    L_80444                          * 8044A
        RTN                                      * 8044D

* refs (3): 803EF 803FD 80409
SUB_8044F:
        C=P     15                               * 8044F
        A=C     S                                * 80453
        GOSBVL  D0->Row1                         * 80456
        C=0     A                                * 8045D
        LC(2)   #37                              * 8045F
        GOSUB   SUB_8047D                        * 80463
        GOSBVL  D0->Sft1                         * 80467
        C=0     A                                * 8046E
        LC(1)   #7                               * 80470
        GOSUB   SUB_8047D                        * 80473
L_80477:
        GOLONG  SUB_8155D                        * 80477

* refs (2): 80463 80473
SUB_8047D:
        D=C     A                                * 8047D
L_8047F:
        C=0     W                                * 8047F
        A=A+A   S                                * 80482
        GONC    L_80494                          * 80485
        A=0     S                                * 80488
        A=A+1   S                                * 8048B
        A=A+1   S                                * 8048E
        C=-C-1  W                                * 80491
L_80494:
        GOSUB   SUB_8049F                        * 80494
        D=D-1   A                                * 80498
        GONC    L_8047F                          * 8049A
        RTN                                      * 8049D

* refs (2): 80444 80494
SUB_8049F:
        DAT0=C  15                               * 8049F
        D0=D0+  15                               * 804A3
        DAT0=C  15                               * 804A6
        D0=D0+  15                               * 804AA
        DAT0=C  4                                * 804AD
        D0=D0+  4                                * 804B1
        RTNCC                                    * 804B4

* refs (10): 8001F 8031D 80391 803C5 803D1 803DD ...
SUB_804B6:
        A=C     B                                * 804B6
        GOVLNG  SUB_01EFD                        * 804B9

* refs (2): 800AF 8023C
SUB_804C0:
        GOSUBL  SUB_802D2                        * 804C0
        D0=(5)  L_81837                          * 804C6
        GOSUBL  SUB_815FE                        * 804CD
        D0=(5)  #00000                           * 804D3
        LC(5)   #03FFF                           * 804DA
        B=C     A                                * 804E1
        LC(5)   #00000                           * 804E3
        D=C     A                                * 804EA
        LC(5)   #40000                           * 804EC
        AD0EX                                    * 804F3
        GOSUB   SUB_8054D                        * 804F6
        GONC    L_80533                          * 804FA
        D0=(5)  L_80000                          * 804FD
        LC(5)   #03FFF                           * 80504
        B=C     A                                * 8050B
        LC(5)   #00000                           * 8050D
        D=C     A                                * 80514
        LC(5)   #40000                           * 80516
        AD0EX                                    * 8051D
        GOSUB   SUB_8054D                        * 80520
        GONC    L_8052D                          * 80524
        GOLONG  L_816FE                          * 80527
L_8052D:
        P=      15                               * 8052D
        CPEX    4                                * 8052F
L_80533:
        CD0EX                                    * 80533
        C=R1.F  A                                * 80536
        CBIT=1  1                                * 8053C
        R1=C.F  A                                * 80541
        GOLONG  SUB_81736                        * 80547

* refs (2): 804F6 80520
SUB_8054D:
        ST=0    15                               * 8054D
        RSTK=C                                   * 80550
        C=0     A                                * 80552
        D1=(5)  #00104                           * 80554
        DAT1=C  4                                * 8055B
        GOSUB   SUB_805B7                        * 8055F
        C=RSTK                                   * 80563
L_80565:
        D0=A                                     * 80565
        RSTK=C                                   * 80568
        CAEX    A                                * 8056A
        RSTK=C                                   * 8056C
        C=C+A   A                                * 8056E
        D1=C                                     * 80570
        C=B     A                                * 80573
L_80575:
        A=DAT0  W                                * 80575
        D0=D0+  16                               * 80579
        A=DAT1  W                                * 8057C
        D1=D1+  16                               * 80580
        C=C-1   A                                * 80583
        GONC    L_80575                          * 80585
        C=RSTK                                   * 80588
        A=C     A                                * 8058A
        C=RSTK                                   * 8058C
        A=A+C   A                                * 8058E
        A=A+C   A                                * 80590
        D=D-1   A                                * 80592
        GONC    L_80565                          * 80594
        GOSUB   SUB_805FE                        * 80597
        D0=(5)  #00104                           * 8059B
        C=0     A                                * 805A2
        C=DAT0  4                                * 805A4
        A=C     A                                * 805A8
        P=      4                                * 805AA
        A=A-1   P                                * 805AC
        A=A+1   A                                * 805AF
        P=      0                                * 805B1
        GOTO    L_80B26                          * 805B3

* refs (1): 8055F
SUB_805B7:
        P=      0                                * 805B7
        ?A#0    A                                * 805B9
        GOYES   L_805D4                          * 805BC
        LC(5)   #00100                           * 805BE
        UNCNFG                                   * 805C5
        LC(5)   #B0000                           * 805C8
        CONFIG                                   * 805CF
        RTN                                      * 805D2
L_805D4:
        LC(5)   #C0000                           * 805D4
        UNCNFG                                   * 805DB
        LC(5)   #A0000                           * 805DE
        UNCNFG                                   * 805E5
        LC(5)   #B0000                           * 805E8
        UNCNFG                                   * 805EF
        LC(5)   #90000                           * 805F2
        UNCNFG                                   * 805F9
        RTN                                      * 805FC

* refs (1): 80597
SUB_805FE:
        P=      0                                * 805FE
        ?A=0    A                                * 80600
        GOYES   L_8061B                          * 80603
        LC(5)   #B0000                           * 80605
        UNCNFG                                   * 8060C
        LC(5)   #00100                           * 8060F
        CONFIG                                   * 80616
        RTN                                      * 80619
L_8061B:
        LC(5)   #F0000                           * 8061B
        CONFIG                                   * 80622
        LC(5)   #C0000                           * 80625
        CONFIG                                   * 8062C
        LC(5)   #FF000                           * 8062F
        CONFIG                                   * 80636
        LC(5)   #90000                           * 80639
        CONFIG                                   * 80640
        LC(5)   #F0000                           * 80643
        CONFIG                                   * 8064A
        LC(5)   #A0000                           * 8064D
        CONFIG                                   * 80654
        LC(5)   #F0000                           * 80657
        CONFIG                                   * 8065E
        LC(5)   #B0000                           * 80661
        CONFIG                                   * 80668
        RTN                                      * 8066B

* refs (2): 800BB 80241
SUB_8066D:
        GOSUBL  SUB_802D2                        * 8066D
        GOSUB   ClrScrMn~jump                    * 80673
        D0=(5)  L_81841                          * 80677
        GOSUBL  SUB_8165A                        * 8067E
        ST=0    15                               * 80684
        GOSUBL  SUB_81349                        * 80687
        B=C     A                                * 8068D
        GOSBVL  SUB_01DA1                        * 8068F
        GONC    L_806A4                          * 80696
        D0=(5)  #00001                           * 80699
        GOTO    L_806BF                          * 806A0
L_806A4:
        GOSUBL  SUB_8148B                        * 806A4
        GOSUBL  SUB_81211                        * 806AA
        GOC     L_806BF                          * 806B0
        GOSUBL  SUB_8120A                        * 806B3
        GOLONG  L_816FE                          * 806B9
L_806BF:
        GOSUBL  SUB_8120A                        * 806BF
        GOSUBL  SUB_81736                        * 806C5
        C=R1.F  A                                * 806CB
        CBIT=1  2                                * 806D1
        R1=C.F  A                                * 806D6
        RTN                                      * 806DC

* refs (1): 81254
SUB_806DE:
        C=D     A                                * 806DE
        D0=C                                     * 806E0
        C=DAT0  W                                * 806E3
        R1=C                                     * 806E7
        D0=D0+  16                               * 806EA
        C=DAT0  W                                * 806ED
        R2=C                                     * 806F1
        D0=D0+  16                               * 806F4
        C=DAT0  W                                * 806F7
        R3=C                                     * 806FB
        D0=D0+  16                               * 806FE
        C=DAT0  W                                * 80701
        R4=C                                     * 80705
        P=      0                                * 80708
        LA(16)  #2942942942942942                * 8070A
        B=A     S                                * 8071F
        C=D     A                                * 80722
L_80724:
        D0=C                                     * 80724
        DAT0=A  15                               * 80727
        D0=D0+  15                               * 8072B
        DAT0=A  15                               * 8072E
        D0=D0+  15                               * 80732
        DAT0=A  15                               * 80735
        D0=D0+  15                               * 80739
        DAT0=A  15                               * 8073C
        D0=D0+  15                               * 80740
        DAT0=A  4                                * 80743
        D0=C                                     * 80747
        P=      14                               * 8074A
        C=DAT0  15                               * 8074C
        ?C#A    WP                               * 80750
        GOYES   L_807A6                          * 80753
        D0=D0+  15                               * 80755
        C=DAT0  15                               * 80758
        ?C#A    WP                               * 8075C
        GOYES   L_807A6                          * 8075F
        D0=D0+  15                               * 80761
        C=DAT0  15                               * 80764
        ?C#A    WP                               * 80768
        GOYES   L_807A6                          * 8076B
        D0=D0+  15                               * 8076D
        C=DAT0  15                               * 80770
        ?C#A    WP                               * 80774
        GOYES   L_807A6                          * 80777
        D0=D0+  15                               * 80779
        P=      3                                * 8077C
        C=DAT0  4                                * 8077E
        ?C#A    WP                               * 80782
        GOYES   L_807A6                          * 80785
        ASL     W                                * 80787
        C=A     S                                * 8078A
        P=C     15                               * 8078D
        C=P     0                                * 80791
        P=      0                                * 80795
        A=C     P                                * 80797
        C=D     A                                * 8079A
        B=B-1   S                                * 8079C
        GOC     L_807B7                          * 8079F
        GOTO    L_80724                          * 807A2
L_807A6:
        C=RSTK                                   * 807A6
        DCEX    A                                * 807A8
        BUSCC                                    * 807AA
        P=      0                                * 807AD
        GOSUB   L_807B7                          * 807AF
        RSTK=C                                   * 807B3
        RTNSC                                    * 807B5
L_807B7:
        CD0EX                                    * 807B7
        A=R1                                     * 807BA
        DAT0=A  W                                * 807BD
        D0=D0+  16                               * 807C1
        A=R2                                     * 807C4
        DAT0=A  W                                * 807C7
        D0=D0+  16                               * 807CB
        A=R3                                     * 807CE
        DAT0=A  W                                * 807D1
        D0=D0+  16                               * 807D5
        A=R4                                     * 807D8
        DAT0=A  W                                * 807DB
        D0=D0+  16                               * 807DF
        CD0EX                                    * 807E2
        DCEX    A                                * 807E5
        RTNCC                                    * 807E7

* refs (2): 809D4 80A39
SUB_807E9:
        P=      0                                * 807E9
        LC(5)   #0F000                           * 807EB
        B=C     A                                * 807F2
        GOSUB   D0=IRAM~jump_3                   * 807F4
        LC(4)   #1000                            * 807F8
        B=B+C   A                                * 807FE
        GOTO    SUB_8081A                        * 80800
        P=      0                                * 80804
        LC(5)   #10000                           * 80806
        B=C     A                                * 8080D
        GOSUB   D0=IRAM~jump_3                   * 8080F
        P=      3                                * 80813
        C=0     WP                               * 80815
        B=B+C   A                                * 80818

* refs (3): 80800 81225 81273
SUB_8081A:
        GOVLNG  SUB_044D4                        * 8081A
L_80821:
        ST=1    11                               * 80821
        GOTO    L_8082B                          * 80824
L_80828:
        ST=0    11                               * 80828
L_8082B:
        ST=0    9                                * 8082B
        GOSUB   SUB_80916                        * 8082E
        GOSUBL  SUB_802D2                        * 80832
        GOSBVL  SUB_00E0B                        * 80838
        INTON                                    * 8083F
        GOSUBL  Flush~jump                       * 80843
        D0=(5)  KeyTestAll                       * 80849
        ?ST=0   11                               * 80850
        GOYES   L_8085C                          * 80853
        D0=(5)  KeyTestDiag                      * 80855
L_8085C:
        C=DAT0  B                                * 8085C
        D=C     A                                * 8085F
        D0=D0+  2                                * 80861
        ?C#0    B                                * 80864
        GOYES   L_8088F                          * 80867
        ?ST=0   9                                * 80869
        GOYES   L_80889                          * 8086C
        C=R1.F  A                                * 8086E
        CBIT=1  3                                * 80874
        R1=C.F  A                                * 80879
        GOSUB   SUB_80916                        * 8087F
        GOLONG  L_81709                          * 80883
L_80889:
        GOLONG  L_816FE                          * 80889
L_8088F:
        GOSUB   SUB_80EBC                        * 8088F
        D1=(4)  #07F7                            * 80893
        A=0     A                                * 80899
        DAT1=A  A                                * 8089B
L_8089E:
        RSI                                      * 8089E
        D1=(4)  #07F7                            * 808A3
        C=DAT1  A                                * 808A9
        ?C=0    A                                * 808AC
        GOYES   L_808BA                          * 808AF
        C=0     A                                * 808B1
        LC(2)   #2D                              * 808B3
        GONC    L_808CB                          * 808B7
L_808BA:
        GOSBVL  POPKEY                           * 808BA
        GONC    L_808CB                          * 808C1
        SHUTDN                                   * 808C4
        GOTO    L_8089E                          * 808C7
L_808CB:
        ?D=C    B                                * 808CB
        GOYES   L_80904                          * 808CE
        ST=1    9                                * 808D0
        AD0EX                                    * 808D3
        R4=A.F  A                                * 808D6
        CSL     A                                * 808DC
        CSL     A                                * 808DE
        C=D     B                                * 808E0
        RSTK=C                                   * 808E3
        LC(2)   #F4                              * 808E5
        GOSUBL  L_802D8                          * 808E9
        C=RSTK                                   * 808EF
        D0=C                                     * 808F1
        GOSUBL  SUB_81736                        * 808F4
        A=R4                                     * 808FA
        D0=A                                     * 808FD
        GOTO    L_8085C                          * 80900
L_80904:
        LC(2)   #94                              * 80904
        GOSUBL  L_802D8                          * 80908
        GOSUB   SUB_80916                        * 8090E
        GOTO    L_8085C                          * 80912

* refs (3): 8082E 8087F 8090E
SUB_80916:
        AD0EX                                    * 80916
        R4=A.F  A                                * 80919
        GOSUBL  ClrScrMn~jump                    * 8091F
        D0=(5)  L_8184B                          * 80925
        ?ST=0   11                               * 8092C
        GOYES   L_80938                          * 8092F
        D0=(5)  L_81855                          * 80931
L_80938:
        GOSUBL  SUB_815FE                        * 80938
        A=R4                                     * 8093E
        D0=A                                     * 80941
        RTNCC                                    * 80944

* Self-test: keycodes to press for the full keyboard test, in order (read at #8085C)
KeyTestAll:
        CON(2)  #01                              * 80946  entry 0
        CON(2)  #02                              * 80948  entry 1
        CON(2)  #03                              * 8094A  entry 2
        CON(2)  #04                              * 8094C  entry 3
        CON(2)  #05                              * 8094E  entry 4
        CON(2)  #06                              * 80950  entry 5
        CON(2)  #07                              * 80952  entry 6
        CON(2)  #08                              * 80954  entry 7
        CON(2)  #09                              * 80956  entry 8
        CON(2)  #0A                              * 80958  entry 9
        CON(2)  #0B                              * 8095A  entry 10
        CON(2)  #0C                              * 8095C  entry 11
        CON(2)  #0D                              * 8095E  entry 12
        CON(2)  #0E                              * 80960  entry 13
        CON(2)  #0F                              * 80962  entry 14
        CON(2)  #10                              * 80964  entry 15
        CON(2)  #11                              * 80966  entry 16
        CON(2)  #12                              * 80968  entry 17
        CON(2)  #13                              * 8096A  entry 18
        CON(2)  #14                              * 8096C  entry 19
        CON(2)  #15                              * 8096E  entry 20
        CON(2)  #16                              * 80970  entry 21
        CON(2)  #17                              * 80972  entry 22
        CON(2)  #18                              * 80974  entry 23
        CON(2)  #19                              * 80976  entry 24
        CON(2)  #1A                              * 80978  entry 25
        CON(2)  #1B                              * 8097A  entry 26
        CON(2)  #1C                              * 8097C  entry 27
        CON(2)  #1D                              * 8097E  entry 28
        CON(2)  #80                              * 80980  entry 29
        CON(2)  #1F                              * 80982  entry 30
        CON(2)  #20                              * 80984  entry 31
        CON(2)  #21                              * 80986  entry 32
        CON(2)  #22                              * 80988  entry 33
        CON(2)  #40                              * 8098A  entry 34
        CON(2)  #24                              * 8098C  entry 35
        CON(2)  #25                              * 8098E  entry 36
        CON(2)  #26                              * 80990  entry 37
        CON(2)  #27                              * 80992  entry 38
        CON(2)  #C0                              * 80994  entry 39
        CON(2)  #29                              * 80996  entry 40
        CON(2)  #2A                              * 80998  entry 41
        CON(2)  #2B                              * 8099A  entry 42
        CON(2)  #2C                              * 8099C  entry 43
        CON(2)  #2D                              * 8099E  entry 44
        CON(2)  #2E                              * 809A0  entry 45
        CON(2)  #2F                              * 809A2  entry 46
        CON(2)  #30                              * 809A4  entry 47
        CON(2)  #31                              * 809A6  entry 48
        CON(2)  0                                * 809A8  end of table

* Self-test: keycodes for the short (diagonal) keyboard test, read at #8085C when ST11 is set
KeyTestDiag:
        CON(2)  #02                              * 809AA  entry 0
        CON(2)  #09                              * 809AC  entry 1
        CON(2)  #10                              * 809AE  entry 2
        CON(2)  #17                              * 809B0  entry 3
        CON(2)  #1D                              * 809B2  entry 4
        CON(2)  #80                              * 809B4  entry 5
        CON(2)  #24                              * 809B6  entry 6
        CON(2)  #2A                              * 809B8  entry 7
        CON(2)  #30                              * 809BA  entry 8
        CON(2)  0                                * 809BC  end of table
L_809BE:
        GOSUBL  ClrScrMn~jump                    * 809BE
        D0=(5)  L_81867                          * 809C4
        GOSUBL  SUB_815FE                        * 809CB
        ST=0    15                               * 809D1
        GOSUB   SUB_807E9                        * 809D4
        R2=C                                     * 809D8
        D0=(5)  DA1BadMASK                       * 809DB
        P=      0                                * 809E2
        LC(1)   #C                               * 809E4
        DAT0=C  1                                * 809E7
        C=0     A                                * 809EB
        R3=C                                     * 809ED
L_809F0:
        GOSUBL  SUB_802C8                        * 809F0
        D0=(5)  DA1NoChMASK                      * 809F6
        A=DAT0  1                                * 809FD
        C=R3                                     * 80A01
        C=A     P                                * 80A04
        ASL     A                                * 80A07
        C=C!A   B                                * 80A09
        R3=C                                     * 80A0D
        GOSBVL  D0->Row1                         * 80A10
        AD0EX                                    * 80A17
        LC(5)   #0015A                           * 80A1A
        C=C+A   A                                * 80A21
        D0=C                                     * 80A23
        C=R3                                     * 80A26
        GOSUB   SUB_80ABA                        * 80A29
        D0=D0+  9                                * 80A2D
        C=R3                                     * 80A30
        CSR     A                                * 80A33
        GOSUB   SUB_80ABA                        * 80A35
        GOSUB   SUB_807E9                        * 80A39
        A=R2                                     * 80A3D
        ?C#A    A                                * 80A40
        GOYES   L_80A73                          * 80A43
        GOSBVL  SUB_00E0B                        * 80A45
        GONC    L_809F0                          * 80A4C
        GOSUB   L_80B26                          * 80A4F
        D1=(5)  DA1BadMASK                       * 80A53
        LC(1)   #4                               * 80A5A
        DAT1=C  1                                * 80A5D
        GOSUBL  ClrScrMn~jump                    * 80A61
L_80A67:
        GOSBVL  SUB_00E0B                        * 80A67
        GOC     L_80A67                          * 80A6E
        RTN                                      * 80A71
L_80A73:
        RSTK=C                                   * 80A73
        GOSUB   L_80B26                          * 80A75
        D1=(5)  DA1BadMASK                       * 80A79
        LC(1)   #4                               * 80A80
        DAT1=C  1                                * 80A83
        GOSUBL  ClrScrMn~jump                    * 80A87
        D0=(5)  L_81885                          * 80A8D
        GOSUBL  SUB_815FE                        * 80A94
        C=RSTK                                   * 80A9A
        D0=C                                     * 80A9C
        C=R1.F  A                                * 80A9F
        CBIT=1  4                                * 80AA5
        R1=C.F  A                                * 80AAA
        GOSUB   L_80A67                          * 80AB0
        GOLONG  SUB_81736                        * 80AB4

* refs (2): 80A29 80A35
SUB_80ABA:
        A=C     A                                * 80ABA
        LC(6)   #30C30C                          * 80ABC
        ?ABIT=1 3                                * 80AC4
        GOYES   L_80ACE                          * 80AC9
        C=0     P                                * 80ACB
L_80ACE:
        P=      2                                * 80ACE
        ?ABIT=1 2                                * 80AD0
        GOYES   L_80ADA                          * 80AD5
        C=0     P                                * 80AD7
L_80ADA:
        P=      3                                * 80ADA
        ?ABIT=1 1                                * 80ADC
        GOYES   L_80AE6                          * 80AE1
        C=0     P                                * 80AE3
L_80AE6:
        P=      5                                * 80AE6
        ?ABIT=1 0                                * 80AE8
        GOYES   L_80AF2                          * 80AED
        C=0     P                                * 80AEF
L_80AF2:
        P=      15                               * 80AF2
        LC(1)   #7                               * 80AF4
        B=C     W                                * 80AF7
        P=      0                                * 80AFA
L_80AFC:
        C=B     W                                * 80AFC
        DAT0=C  6                                * 80AFF
        AD0EX                                    * 80B03
        LC(5)   #00022                           * 80B06
        A=A+C   A                                * 80B0D
        D0=A                                     * 80B0F
        B=B-1   S                                * 80B12
        GONC    L_80AFC                          * 80B15
        LC(5)   #00110                           * 80B18
        A=A-C   A                                * 80B1F
        D0=A                                     * 80B21
        RTNCC                                    * 80B24
L_80B26:
        GOVLNG  AllowIntr                        * 80B26
L_80B2D:
        GOSUBL  SUB_802D2                        * 80B2D
        GOSUBL  ClrScrMn~jump                    * 80B33
        GOSUBL  SUB_815D3                        * 80B39
        GOTO    L_80A67                          * 80B3F
L_80B43:
        D0=(5)  L_81937                          * 80B43
        GOSUB   SUB_80D29                        * 80B4A
        GOSUB   SUB_80CF0                        * 80B4E
        GOSBVL  GetTime++                        * 80B52
        A=C     W                                * 80B59
        GOSUB   SUB_80BCB                        * 80B5C
        RSTK=C                                   * 80B60
        P=      12                               * 80B62
        GOSUB   SUB_80BE7                        * 80B64
        C=RSTK                                   * 80B68
        GOC     L_80BB5                          * 80B6A
        A=C     A                                * 80B6D
        P=      3                                * 80B6F
        GOSUB   SUB_80BE7                        * 80B71
        GOC     L_80BB5                          * 80B75
        GOSUB   SUB_80C13                        * 80B78
        GOSUB   SUB_80CE3                        * 80B7C
        GOSUBL  SUB_815C6                        * 80B80
        GOSUB   POPUART~jump                     * 80B86
        C=0     A                                * 80B8A
        GOC     L_80BA8                          * 80B8C
        LC(2)   #06                              * 80B8F
        ?C#A    B                                * 80B93
        GOYES   L_80BAE                          * 80B96
        LC(2)   #94                              * 80B98
        GOSUBL  L_802D8                          * 80B9C
        GOLONG  L_816FE                          * 80BA2
L_80BA8:
        C=C+1   A                                * 80BA8
        GOTO    L_80BB7                          * 80BAA
L_80BAE:
        LC(1)   #2                               * 80BAE
        GOTO    L_80BB7                          * 80BB1
L_80BB5:
        C=A     A                                * 80BB5
L_80BB7:
        RSTK=C                                   * 80BB7
        LC(1)   #6                               * 80BB9
        GOSUB   SUB_80DED                        * 80BBC
        C=RSTK                                   * 80BC0
        D0=C                                     * 80BC2
        GOLONG  SUB_81736                        * 80BC5

* refs (2): 80B5C 80C38
SUB_80BCB:
        GOSUB   D1=IRAM~jump_5                   * 80BCB
        D1=(4)  #0069                            * 80BCF
        GOSBVL  SUB_01702                        * 80BD5
        D1=D1+  13                               * 80BDC
        C=0     A                                * 80BDF
        C=DAT1  4                                * 80BE1
        RTN                                      * 80BE5

* refs (2): 80B64 80B71
SUB_80BE7:
        C=0     A                                * 80BE7
        CPEX    0                                * 80BE9
L_80BED:
        RSTK=C                                   * 80BED
        LC(2)   #30                              * 80BEF
        C=A     P                                * 80BF3
        ASR     W                                * 80BF6
        R1=A                                     * 80BF9
        A=C     A                                * 80BFC
        GOSUB   OUTUART~jump                     * 80BFE
        A=C     A                                * 80C02
        C=RSTK                                   * 80C04
        RTNC                                     * 80C06
        A=R1                                     * 80C09
        C=C-1   A                                * 80C0C
        GONC    L_80BED                          * 80C0E
        RTNCC                                    * 80C11

* refs (2): 80B78 80C7C
SUB_80C13:
        LC(5)   #00ABD                           * 80C13
        GOLONG  L_815DC                          * 80C1A
L_80C20:
        D0=(5)  L_81941                          * 80C20
        GOSUB   SUB_80D29                        * 80C27
        GOSUB   SUB_80CE3                        * 80C2B
        P=      3                                * 80C2F
        GOSUB   SUB_80CC0                        * 80C31
        R3=A                                     * 80C35
        GOSUB   SUB_80BCB                        * 80C38
        P=      12                               * 80C3C
        GOSUB   SUB_80CC0                        * 80C3E
        GOSBVL  ASRW5                            * 80C42
        GOSBVL  AsrW4                            * 80C49
        ?C=A    A                                * 80C50
        GOYES   L_80C59                          * 80C53
        GOTO    L_80BB5                          * 80C55
L_80C59:
        C=0     W                                * 80C59
        P=      0                                * 80C5C
        LC(8)   #7E900000                        * 80C5E
        A=R3                                     * 80C68
        A=A+C   W                                * 80C6B
        ST=0    15                               * 80C6E
        GOSBVL  L_01A82                          * 80C71
        GOSUB   L_80B26                          * 80C78
        GOSUB   SUB_80C13                        * 80C7C
        GOSUB   SUB_80CF0                        * 80C80
        LC(2)   #06                              * 80C84
        A=C     A                                * 80C88
        GOSUB   OUTUART~jump                     * 80C8A
        GONC    L_80C97                          * 80C8E
        A=C     A                                * 80C91
        GOTO    L_80BB5                          * 80C93
L_80C97:
        ST=0    15                               * 80C97
        GOSBVL  SUB_010A9                        * 80C9A
        P=      0                                * 80CA1
        GOSBVL  SUB_02708                        * 80CA3
        GOSUB   L_80B26                          * 80CAA
        ST=1    6                                * 80CAE
        GOSUBL  SUB_80167                        * 80CB1
        ST=0    6                                * 80CB7
        GOLONG  L_80000                          * 80CBA

* refs (2): 80C31 80C3E
SUB_80CC0:
        B=0     W                                * 80CC0
L_80CC3:
        GOSUB   POPUART~jump                     * 80CC3
        GOC     L_80CC3                          * 80CC7
        ASRC                                     * 80CCA
        B=A     S                                * 80CCD
        BSR     W                                * 80CD0
        P=P+1                                    * 80CD3
        GONC    L_80CC3                          * 80CD5
        BSR     W                                * 80CD8
        BSR     W                                * 80CDB
        A=B     W                                * 80CDE
        RTN                                      * 80CE1

* refs (2): 80B7C 80C2B
SUB_80CE3:
        P=      0                                * 80CE3
        LC(1)   #2                               * 80CE5
        GOSUB   SUB_80DED                        * 80CE8
        GOTO    SUB_80CFD                        * 80CEC

* refs (2): 80B4E 80C80
SUB_80CF0:
        P=      0                                * 80CF0
        LC(1)   #2                               * 80CF2
        GOSUB   SUB_80DED                        * 80CF5
        GOSUB   SUB_81051                        * 80CF9

* refs (4): 80CEC 80DA7 80DC3 80FB2
SUB_80CFD:
        D1=(5)  IRC                              * 80CFD
        A=DAT1  1                                * 80D04
        ABIT=1  2                                * 80D08
        DAT1=A  1                                * 80D0D
        RTN                                      * 80D11

* refs (3): 80DCE 80DD8 80F88
SUB_80D13:
        D1=(5)  IRC                              * 80D13
        A=DAT1  1                                * 80D1A
        ABIT=0  2                                * 80D1E
        DAT1=A  1                                * 80D23
        RTN                                      * 80D27

* refs (6): 80B4A 80C27 80D40 80D92 80ECA 80F80
SUB_80D29:
        GOSUB   FlushAttn~jump                   * 80D29
        GOSUBL  SUB_802D2                        * 80D2D
        GOLONG  SUB_815FE                        * 80D33

* refs (2): 800E1 80255
SUB_80D39:
        D0=(5)  L_818AB                          * 80D39
        GOSUB   SUB_80D29                        * 80D40
        LC(5)   #00E52                           * 80D44
        R2=C                                     * 80D4B
        LC(1)   #0                               * 80D4E
        GOSUB   SUB_80DED                        * 80D51
        GOSUB   SUB_80DF4                        * 80D55
        GONC    L_80D7A                          * 80D59
        LC(5)   #00225                           * 80D5C
        R2=C                                     * 80D63
        LC(1)   #6                               * 80D66
        GOSUB   SUB_80DED                        * 80D69
        GOSUB   SUB_80DF4                        * 80D6D
        GONC    L_80D7A                          * 80D71
        GOLONG  L_816FE                          * 80D74
L_80D7A:
        A=R1                                     * 80D7A
        ABIT=1  5                                * 80D7D
        R1=A                                     * 80D82
        GOLONG  SUB_81736                        * 80D85

* refs (2): 800D1 80278
SUB_80D8B:
        D0=(5)  L_81923                          * 80D8B
        GOSUB   SUB_80D29                        * 80D92
        LC(5)   #00E52                           * 80D96
        R2=C                                     * 80D9D
        LC(1)   #0                               * 80DA0
        GOSUB   SUB_80DED                        * 80DA3
        GOSUB   SUB_80CFD                        * 80DA7
        GOSUB   SUB_80DF4                        * 80DAB
        GONC    L_80DD8                          * 80DAF
        LC(5)   #00729                           * 80DB2
        R2=C                                     * 80DB9
        LC(1)   #2                               * 80DBC
        GOSUB   SUB_80DED                        * 80DBF
        GOSUB   SUB_80CFD                        * 80DC3
        GOSUB   SUB_80DF4                        * 80DC7
        GONC    L_80DD8                          * 80DCB
        GOSUB   SUB_80D13                        * 80DCE
        GOLONG  L_816FE                          * 80DD2
L_80DD8:
        GOSUB   SUB_80D13                        * 80DD8
        A=R1                                     * 80DDC
        ABIT=1  9                                * 80DDF
        R1=A                                     * 80DE4
        GOLONG  SUB_81736                        * 80DE7

* refs (10): 80BBC 80CE8 80CF5 80D51 80D69 80DA3 ...
SUB_80DED:
        GOVLNG  L_30EBC                          * 80DED

* refs (4): 80D55 80D6D 80DAB 80DC7
SUB_80DF4:
        C=0     A                                * 80DF4
        D0=(5)  L_818BF                          * 80DF6
        C=DAT0  B                                * 80DFD
        D0=D0+  2                                * 80E00
L_80E03:
        C=C-1   A                                * 80E03
        RTNC                                     * 80E05
        RSTK=C                                   * 80E08
        A=DAT0  B                                * 80E0A
        CD0EX                                    * 80E0D
        RSTK=C                                   * 80E10
        GOSUB   OUTUART~jump                     * 80E12
        A=C     A                                * 80E16
        C=RSTK                                   * 80E18
        D0=C                                     * 80E1A
        GOC     L_80E7E                          * 80E1D
        C=R2                                     * 80E20
L_80E23:
        C=C-1   A                                * 80E23
        GONC    L_80E23                          * 80E25
        A=0     A                                * 80E28
        A=DAT0  B                                * 80E2A
        B=A     A                                * 80E2D
        GOSUB   D1=IRAM~jump_5                   * 80E2F
        D1=(4)  #0519                            * 80E33
        A=DAT1  B                                * 80E39
        ?A=0    B                                * 80E3C
        GOYES   L_80E98                          * 80E3F
        LC(2)   #01                              * 80E41
        ?C#A    B                                * 80E45
        GOYES   L_80EA3                          * 80E48
        D1=D1+  3                                * 80E4A
        A=DAT1  B                                * 80E4D
        A=A+A   A                                * 80E50
        D1=(4)  #0319                            * 80E52
        CD1EX                                    * 80E58
        C=C+A   A                                * 80E5B
        D1=C                                     * 80E5D
        A=0     A                                * 80E60
        A=DAT1  B                                * 80E62
        ?A#B    B                                * 80E65
        GOYES   L_80E87                          * 80E68
        D1=(4)  #0519                            * 80E6A
        C=0     A                                * 80E70
        DAT1=C  B                                * 80E72
        D0=D0+  2                                * 80E75
        C=RSTK                                   * 80E78
        GOTO    L_80E03                          * 80E7A
L_80E7E:
        C=RSTK                                   * 80E7E
        C=A     A                                * 80E80
        D0=C                                     * 80E82
        RTNCC                                    * 80E85
L_80E87:
        C=RSTK                                   * 80E87
        A=A+1   XS                               * 80E89
        ASL     A                                * 80E8C
        ASL     A                                * 80E8E
        A=B     B                                * 80E90
        D0=A                                     * 80E93
        RTNCC                                    * 80E96
L_80E98:
        C=RSTK                                   * 80E98
        D0=(5)  L_1FFFF+1                        * 80E9A
        RTNCC                                    * 80EA1
L_80EA3:
        C=RSTK                                   * 80EA3
        D0=(5)  L_30000                          * 80EA5
        RTNCC                                    * 80EAC

* refs (2): 807F4 8080F
D0=IRAM~jump_3:
        GOVLNG  D0=IRAM                          * 80EAE

* refs (9): 80BCB 80E2F 80F29 8100E 8148E 81620 ...
D1=IRAM~jump_5:
        GOVLNG  D1=IRAM                          * 80EB5

* refs (7): 80174 8034A 8088F 80FD2 810D2 81747 ...
SUB_80EBC:
        GOVLNG  SUB_0C1B6                        * 80EBC
L_80EC3:
        D0=(5)  L_818B5                          * 80EC3
        GOSUB   SUB_80D29                        * 80ECA
        LC(1)   #6                               * 80ECE
        GOSUB   SUB_80DED                        * 80ED1
        GOSUB   SUB_80EF3                        * 80ED5
        GOC     L_80EE2                          * 80ED9
        GOLONG  L_816FE                          * 80EDC
L_80EE2:
        A=R1                                     * 80EE2
        ABIT=1  6                                * 80EE5
        R1=A                                     * 80EEA
        GOLONG  SUB_81736                        * 80EED

* refs (1): 80ED5
SUB_80EF3:
        ST=0    15                               * 80EF3
        GOSUB   Flush~jump                       * 80EF6
        GOSBVL  SUB_00D3B                        * 80EFA
        GOSUB   FlushAttn~jump                   * 80F01
        GOSUB   L_80B26                          * 80F05
L_80F09:
        P=      0                                * 80F09
        LC(5)   #0AA68                           * 80F0B
        R3=C                                     * 80F12
L_80F15:
        P=      0                                * 80F15
        GOSUB   SUB_81051                        * 80F17
        GOSUB   POPUART~jump                     * 80F1B
        LC(1)   #A                               * 80F1F
        DAT0=C  1                                * 80F22
        GONC    L_80F62                          * 80F26
        GOSUB   D1=IRAM~jump_5                   * 80F29
        D1=(4)  #07F7                            * 80F2D
        C=DAT1  A                                * 80F33
        ?C#0    A                                * 80F36
        GOYES   L_80F45                          * 80F39
        GOSBVL  POPKEY                           * 80F3B
        GOC     L_80F4E                          * 80F42
L_80F45:
        D0=(5)  #00001                           * 80F45
        RTNSC                                    * 80F4C
L_80F4E:
        A=R3                                     * 80F4E
        A=A-1   A                                * 80F51
        R3=A                                     * 80F53
        GONC    L_80F15                          * 80F56
        D0=(5)  #00002                           * 80F59
        RTNSC                                    * 80F60
L_80F62:
        LC(2)   #04                              * 80F62
        ?C#A    B                                * 80F66
        GOYES   L_80F6D                          * 80F69
        RTNCC                                    * 80F6B
L_80F6D:
        GOSUB   OUTUART~jump                     * 80F6D
        GONC    L_80F09                          * 80F71
        D0=C                                     * 80F74
        RTNSC                                    * 80F77
L_80F79:
        D0=(5)  L_8192D                          * 80F79
        GOSUB   SUB_80D29                        * 80F80
        GOSUB   SUB_80FA6                        * 80F84
        GOSUB   SUB_80D13                        * 80F88
        GOC     L_80F95                          * 80F8C
        GOLONG  L_816FE                          * 80F8F
L_80F95:
        A=R1                                     * 80F95
        ABIT=1  10                               * 80F98
        R1=A                                     * 80F9D
        GOLONG  SUB_81736                        * 80FA0

* refs (2): 80F84 8103A
SUB_80FA6:
        ST=0    15                               * 80FA6
        P=      0                                * 80FA9
        LC(1)   #2                               * 80FAB
        GOSUB   SUB_80DED                        * 80FAE
        GOSUB   SUB_80CFD                        * 80FB2
        GOSUB   Flush~jump                       * 80FB6
        GOSBVL  SUB_00D3B                        * 80FBA
        GOSUB   FlushAttn~jump                   * 80FC1
        GOSUB   L_80B26                          * 80FC5
        P=      0                                * 80FC9
        LC(5)   #85225                           * 80FCB
        GOSUB   SUB_80EBC                        * 80FD2
        D1=(4)  #0519                            * 80FD6
        A=0     A                                * 80FDC
L_80FDE:
        A=DAT1  B                                * 80FDE
        ?A#0    B                                * 80FE1
        GOYES   L_80FF4                          * 80FE4
        C=C-1   A                                * 80FE6
        GONC    L_80FDE                          * 80FE8
        D0=(5)  #00002                           * 80FEB
        RTNSC                                    * 80FF2
L_80FF4:
        B=A     A                                * 80FF4
        LC(5)   #00656                           * 80FF6
L_80FFD:
        A=DAT1  B                                * 80FFD
        ?A#B    B                                * 81000
        GOYES   L_80FF4                          * 81003
        C=C-1   A                                * 81005
        GONC    L_80FFD                          * 81007
        GOSUB   SUB_81051                        * 8100A
L_8100E:
        GOSUB   D1=IRAM~jump_5                   * 8100E
        D1=(4)  #07F7                            * 81012
        C=DAT1  A                                * 81018
        ?C#0    A                                * 8101B
        GOYES   L_8102A                          * 8101E
        GOSBVL  POPKEY                           * 81020
        GOC     L_81033                          * 81027
L_8102A:
        D0=(5)  #00001                           * 8102A
        RTNSC                                    * 81031
L_81033:
        GOSUB   POPUART~jump                     * 81033
        GONC    L_8103E                          * 81037
        GOTO    SUB_80FA6                        * 8103A
L_8103E:
        GOSUB   OUTUART~jump                     * 8103E
        GONC    L_8100E                          * 81042
        D0=C                                     * 81045
        RTNSC                                    * 81048
        BSS     7                                * 8104A  zeros

* refs (3): 80CF9 80F17 8100A
SUB_81051:
        LC(1)   #8                               * 81051
        D0=(5)  IOC                              * 81054
        DAT0=C  1                                * 8105B
        RTN                                      * 8105F

* refs (3): 80D29 80F01 80FC1
FlushAttn~jump:
        GOVLNG  FlushAttn                        * 81061

* refs (8): 80BFE 80C8A 80E12 80F6D 8103E 817C4 ...
OUTUART~jump:
        GOVLNG  OUTUART                          * 81068

* refs (5): 80038 80843 80EF6 80FB6 81583
Flush~jump:
        GOVLNG  Flush                            * 8106F

* refs (4): 80B86 80CC3 80F1B 81033
POPUART~jump:
        GOVLNG  POPUART                          * 81076
L_8107D:
        GOSUBL  SUB_802D2                        * 8107D
        GOSUBL  ClrScrMn~jump                    * 81083
        D0=(5)  L_81905                          * 81089
        GOSUBL  SUB_8165A                        * 81090
        ST=0    15                               * 81096
        GOSBVL  SUB_00735                        * 81099
        GOSUBL  SUB_81374                        * 810A0
        GOSBVL  SUB_00735                        * 810A6
        B=C     A                                * 810AD
        LC(8)   #30303030                        * 810AF
        P=      14                               * 810B9
L_810BB:
        ?B=0    XS                               * 810BB
        GOYES   L_810D0                          * 810BE
        P=P+1                                    * 810C0
        P=P+1                                    * 810C2
        B=B+B   XS                               * 810C4
        GONC    L_810BB                          * 810C7
        C=C+1   P                                * 810CA
        GONC    L_810BB                          * 810CD
L_810D0:
        P=      0                                * 810D0
        GOSUB   SUB_80EBC                        * 810D2
        D1=(4)  #009C                            * 810D6
        DAT1=C  8                                * 810DC
        GOLONG  L_81765                          * 810E0

* refs (2): 800F2 80264
SUB_810E6:
        GOSUBL  SUB_802D2                        * 810E6
        GOSUBL  ClrScrMn~jump                    * 810EC
        D0=(5)  L_8190F                          * 810F2
        GOSUBL  SUB_8165A                        * 810F9
        ST=0    15                               * 810FF
        GOSBVL  SUB_00735                        * 81102
        A=C     A                                * 81109
        LC(3)   #A00                             * 8110B
        A=A&C   XS                               * 81110
        ?C=A    XS                               * 81114
        GOYES   L_81124                          * 81117
        D0=(5)  #00002                           * 81119
        GOTO    L_81158                          * 81120
L_81124:
        GOSUB   SUB_812AB                        * 81124
        B=C     A                                * 81128
        GOSBVL  SUB_01DA1                        * 8112A
        GONC    L_8113F                          * 81131
        D0=(5)  #00001                           * 81134
        GOTO    L_81158                          * 8113B
L_8113F:
        GOSUB   SUB_8148B                        * 8113F
        GOSUB   SUB_81211                        * 81143
        GOC     L_81158                          * 81147
        GOSUB   SUB_8120A                        * 8114A
        GOSUBL  L_816FE                          * 8114E
        GOTO    L_81173                          * 81154
L_81158:
        GOSUB   SUB_8120A                        * 81158
        GOSUBL  SUB_81736                        * 8115C
        C=R1.F  A                                * 81162
        CBIT=1  7                                * 81168
        R1=C.F  A                                * 8116D
L_81173:
        D0=(5)  L_81919                          * 81173
        GOSUBL  SUB_8165A                        * 8117A
        ST=0    15                               * 81180
        GOSBVL  SUB_00735                        * 81183
        A=C     A                                * 8118A
        LC(3)   #500                             * 8118C
        A=A&C   XS                               * 81191
        ?C=A    XS                               * 81195
        GOYES   L_811A5                          * 81198
        D0=(5)  #00002                           * 8119A
        GOTO    L_811ED                          * 811A1
L_811A5:
        GOSUB   SUB_812FA                        * 811A5
        LC(5)   L_81CAD                          * 811A9
        D0=C                                     * 811B0
        A=C     A                                * 811B3
        LC(5)   L_8198D                          * 811B5
        A=A-C   A                                * 811BC
        LC(5)   #40000                           * 811BE
        LC(4)   #09A3                            * 811C5
        C=C+A   A                                * 811CB
        D1=C                                     * 811CD
        C=A     A                                * 811D0
        GOSBVL  MOVEUP                           * 811D2
        D1=D1+  3                                * 811D9
        CD1EX                                    * 811DC
        RSTK=C                                   * 811DF
        RTN                                      * 811E1
L_811E3:
        GOSUB   SUB_8120A                        * 811E3
        GOLONG  L_816FE                          * 811E7
L_811ED:
        GOSUB   SUB_8120A                        * 811ED
        GOSUBL  SUB_81736                        * 811F1
        C=R1.F  A                                * 811F7
        CBIT=1  8                                * 811FD
        R1=C.F  A                                * 81202
        RTN                                      * 81208

* refs (6): 806B3 806BF 8114A 81158 811E3 811ED
SUB_8120A:
        GOVLNG  SUB_011AC                        * 8120A

* refs (2): 806AA 81143
SUB_81211:
        CD0EX                                    * 81211
        CR0EX.F A                                * 81214
        RSTK=C                                   * 8121A
        C=R0                                     * 8121C
        B=C     A                                * 8121F
        GOSUB   SUB_8136B                        * 81221
        GOSUBL  SUB_8081A                        * 81225
        RSTK=C                                   * 8122B
        GOSUB   SUB_813CC                        * 8122D
        GOC     L_8129F                          * 81231
        GOSUB   SUB_8136B                        * 81234
        D=C     A                                * 81238
        C=R1                                     * 8123A
        RSTK=C                                   * 8123D
        C=R0                                     * 8123F
        C=C-D   A                                * 81242
        CSR     A                                * 81244
        CSRB.F  A                                * 81246
        CSRB.F  A                                * 8124B
        C=C-1   A                                * 81250
        B=C     A                                * 81252
L_81254:
        GOSUBL  SUB_806DE                        * 81254
        GOC     L_81297                          * 8125A
        B=B-1   A                                * 8125D
        GONC    L_81254                          * 8125F
        C=RSTK                                   * 81262
        R1=C.F  A                                * 81264
        C=R0                                     * 8126A
        B=C     A                                * 8126D
        GOSUB   SUB_8136B                        * 8126F
        GOSUBL  SUB_8081A                        * 81273
        A=C     A                                * 81279
        C=RSTK                                   * 8127B
        B=C     A                                * 8127D
        C=RSTK                                   * 8127F
        R0=C.F  A                                * 81281
        ?A#B    A                                * 81287
        GOYES   L_8128E                          * 8128A
        RTNCC                                    * 8128C
L_8128E:
        D0=(5)  #00000                           * 8128E
        RTNSC                                    * 81295
L_81297:
        C=RSTK                                   * 81297
        R1=C.F  A                                * 81299
L_8129F:
        C=RSTK                                   * 8129F
        C=RSTK                                   * 812A1
        R0=C.F  A                                * 812A3
        RTNSC                                    * 812A9

* refs (1): 81124
SUB_812AB:
        P=      0                                * 812AB
        LC(5)   #C0000                           * 812AD
        UNCNFG                                   * 812B4
        LC(5)   #F0000                           * 812B7
        CONFIG                                   * 812BE
        LC(5)   #40000                           * 812C1
        CONFIG                                   * 812C8
        D0=(5)  IRAM@                            * 812CB
        P=      4                                * 812D2
        DAT0=C  P                                * 812D4
        P=      0                                * 812D8
        LC(5)   #A0000                           * 812DA
        UNCNFG                                   * 812E1
        LC(5)   #C0000                           * 812E4
        CONFIG                                   * 812EB
        LC(5)   #C0000                           * 812EE
        CONFIG                                   * 812F5
        RTNCC                                    * 812F8

* refs (1): 811A5
SUB_812FA:
        P=      0                                * 812FA
        LC(5)   #C0000                           * 812FC
        UNCNFG                                   * 81303
        LC(5)   #F0000                           * 81306
        CONFIG                                   * 8130D
        LC(5)   #40000                           * 81310
        CONFIG                                   * 81317
        D0=(5)  IRAM@                            * 8131A
        P=      4                                * 81321
        DAT0=C  P                                * 81323
        P=      0                                * 81327
        LC(5)   #B0000                           * 81329
        UNCNFG                                   * 81330
        LC(5)   #C0000                           * 81333
        CONFIG                                   * 8133A
        LC(5)   #C0000                           * 8133D
        CONFIG                                   * 81344
        RTNCC                                    * 81347

* refs (1): 80687
SUB_81349:
        P=      0                                * 81349
        LC(5)   #C0000                           * 8134B
        UNCNFG                                   * 81352
        LC(5)   #C0000                           * 81355
        CONFIG                                   * 8135C
        LC(5)   #C0000                           * 8135F
        CONFIG                                   * 81366
        RTNCC                                    * 81369

* refs (3): 81221 81234 8126F
SUB_8136B:
        LC(5)   #C0000                           * 8136B
        RTN                                      * 81372

* refs (1): 810A0
SUB_81374:
        ?CBIT=1 8                                * 81374
        RTNYES                                   * 81379
        D0=(5)  #90002                           * 8137B
        GOSUB   SUB_813BE                        * 81382
        D0=D0+  2                                * 81386
        GOSUB   SUB_813BE                        * 81389
        C=DAT0  1                                * 8138D
        GOSUB   SUB_813BE                        * 81391
        D0=D0+  4                                * 81395
        C=DAT0  1                                * 81398
        GOSUB   SUB_813BE                        * 8139C
        D0=D0+  8                                * 813A0
        GOSUB   SUB_813BE                        * 813A3
        D0=D0+  16                               * 813A7
        GOSUB   SUB_813BE                        * 813AA
        D0=D0+  16                               * 813AE
        D0=D0+  16                               * 813B1
        GOSUB   SUB_813BE                        * 813B4
        D0=(4)  #0000                            * 813B8

* refs (7): 81382 81389 81391 8139C 813A3 813AA ...
SUB_813BE:
        C=DAT0  1                                * 813BE
        GOSUB   L_81562                          * 813C2
        GOLONG  SUB_802D2                        * 813C6

* refs (1): 8122D
SUB_813CC:
        P=      0                                * 813CC
        LC(5)   #C0000                           * 813CE
        R3=C                                     * 813D5
        C=0     W                                * 813D8
        C=C+1   A                                * 813DB
        R2=C                                     * 813DD
L_813E0:
        C=R3                                     * 813E0
        D1=C                                     * 813E3
        A=DAT1  1                                * 813E6
        B=A     P                                * 813EA
        BSL     A                                * 813ED
        A=R2                                     * 813EF
        A=A+C   A                                * 813F2
        D1=A                                     * 813F4
        A=DAT1  1                                * 813F7
        B=A     P                                * 813FB
        D1=C                                     * 813FE
        LC(1)   #1                               * 81401
        DAT1=C  1                                * 81404
        C=R3                                     * 81408
        A=R2                                     * 8140B
        A=A+C   A                                * 8140E
        D1=A                                     * 81410
        LC(1)   #2                               * 81413
        DAT1=C  1                                * 81416
        C=R3                                     * 8141A
        D1=C                                     * 8141D
        A=DAT1  1                                * 81420
        LC(1)   #1                               * 81424
        ?C#A    P                                * 81427
        GOYES   L_81483                          * 8142A
        C=R3                                     * 8142C
        A=R2                                     * 8142F
        A=A+C   A                                * 81432
        D1=A                                     * 81434
        A=DAT1  1                                * 81437
        LC(1)   #2                               * 8143B
        ?C#A    P                                * 8143E
        GOYES   L_81483                          * 81441
        C=R3                                     * 81443
        D1=C                                     * 81446
        C=B     A                                * 81449
        CSR     A                                * 8144B
        DAT1=C  1                                * 8144D
        C=R3                                     * 81451
        A=R2                                     * 81454
        A=A+C   A                                * 81457
        D1=A                                     * 81459
        C=B     A                                * 8145C
        DAT1=C  1                                * 8145E
        A=R2                                     * 81462
        A=A+A   A                                * 81465
        R2=A                                     * 81467
        GOC     L_81481                          * 8146A
        C=R3                                     * 8146D
        A=A+C   A                                * 81470
        GOC     L_81481                          * 81472
        C=R0                                     * 81475
        ?C<=A   A                                * 81478
        GOYES   L_81481                          * 8147B
        GOTO    L_813E0                          * 8147D
L_81481:
        RTNCC                                    * 81481
L_81483:
        AD1EX                                    * 81483
        D0=A                                     * 81486
        RTNSC                                    * 81489

* refs (3): 806A4 8113F 819BA
SUB_8148B:
        B=C     W                                * 8148B
        GOSUB   D1=IRAM~jump_5                   * 8148E
        LC(4)   #00B6                            * 81492
        D1=C                                     * 81498
        C=B     W                                * 8149B
        DAT1=C  8                                * 8149E
        CD0EX                                    * 814A2
        RSTK=C                                   * 814A5
        GOSUB   L_81602                          * 814A7
        C=RSTK                                   * 814AB
        D0=C                                     * 814AD
        RTN                                      * 814B0
        GOSBVL  KeyInBuff?                       * 814B2
        GONC    L_814BE                          * 814B9
        RTNCC                                    * 814BC
L_814BE:
        GOVLNG  SUB_00C8D                        * 814BE

* refs (1): 80025
SUB_814C5:
        GOSBVL  D0->Row1                         * 814C5
        D0=D0+  16                               * 814CC
        C=0     A                                * 814CF
        LC(2)   #37                              * 814D1
        GOSUB   SUB_814E8                        * 814D5
        GOSBVL  D0->Sft1                         * 814D9
        D0=D0+  16                               * 814E0
        C=0     A                                * 814E3
        LC(1)   #7                               * 814E5

* refs (1): 814D5
SUB_814E8:
        D=C     A                                * 814E8
        LC(2)   #22                              * 814EA
        B=C     A                                * 814EE
L_814F0:
        C=DAT0  1                                * 814F0
        CBIT=1  1                                * 814F4
        DAT0=C  1                                * 814F9
        AD0EX                                    * 814FD
        A=A+B   A                                * 81500
        D0=A                                     * 81502
        D=D-1   A                                * 81505
        GONC    L_814F0                          * 81507
        RTNCC                                    * 8150A

* refs (1): 8000C
SUB_8150C:
        GOSBVL  D0->Row1                         * 8150C
        C=0     A                                * 81513
        LC(2)   #37                              * 81515
        GOSUB   SUB_81529                        * 81519
        GOSBVL  D0->Sft1                         * 8151D
        C=0     A                                * 81524
        LC(1)   #7                               * 81526

* refs (1): 81519
SUB_81529:
        D=C     A                                * 81529
        LC(2)   #22                              * 8152B
        B=C     A                                * 8152F
        CD0EX                                    * 81531
L_81534:
        D0=C                                     * 81534
        A=0     A                                * 81537
        A=A+1   A                                * 81539
        DAT0=A  1                                * 8153B
        D0=D0+  16                               * 8153F
        A=A+1   A                                * 81542
        DAT0=A  1                                * 81544
        D0=D0+  16                               * 81548
        A=A+A   A                                * 8154B
        DAT0=A  1                                * 8154D
        D0=D0+  1                                * 81551
        C=C+B   A                                * 81554
        D=D-1   A                                * 81556
        GONC    L_81534                          * 81558
        RTNCC                                    * 8155B

* refs (11): 8009D 800A9 800B5 800C1 800D7 800E7 ...
SUB_8155D:
        ?ST=1   6                                * 8155D
        GOYES   L_81577                          * 81560
L_81562:
        GOSBVL  SUB_00E0B                        * 81562
        GONC    L_81562                          * 81569
L_8156C:
        LC(5)   L_08F34                          * 8156C
        GOTO    L_815DC                          * 81573
L_81577:
        GOSBVL  POPKEY                           * 81577
        GOC     L_8156C                          * 8157E
        RSTK=C                                   * 81581
        GOSUB   Flush~jump                       * 81583
        C=R1                                     * 81587
        CBIT=1  3                                * 8158A
        R1=C.F  A                                * 8158F
        LC(2)   #F4                              * 81595
        GOSUBL  L_802D8                          * 81599
        GOSUBL  ClrScrMn~jump                    * 8159F
        D0=(5)  L_8185F                          * 815A5
        GOSUBL  SUB_815FE                        * 815AC
        C=RSTK                                   * 815B2
        D0=C                                     * 815B4
        ST=0    6                                * 815B7
        GOSUBL  SUB_81736                        * 815BA
        GOLONG  L_8001D                          * 815C0

* refs (1): 80B80
SUB_815C6:
        P=      0                                * 815C6
        LC(5)   #0479A                           * 815C8
        GOTO    L_815DC                          * 815CF

* refs (3): 8010C 80B39 81D16
SUB_815D3:
        P=      0                                * 815D3
        LC(5)   #59808                           * 815D5
L_815DC:
        C=C-1   A                                * 815DC
        GONC    L_815DC                          * 815DE
        RTNCC                                    * 815E1
        GOSUB   SUB_8165A                        * 815E3
L_815E7:
        GOSBVL  D0->Row1                         * 815E7
        LC(5)   #00110                           * 815EE
        A=A+C   A                                * 815F5
        D0=A                                     * 815F7
        GOTO    L_81609                          * 815FA

* refs (9): 8019B 80336 803A0 804CD 80938 809CB ...
SUB_815FE:
        GOSUB   SUB_8165A                        * 815FE
L_81602:
        GOSBVL  D0->Row1                         * 81602
L_81609:
        C=RSTK                                   * 81609
        GOSBVL  CSLW5                            * 8160B
        C=RSTK                                   * 81612
        GOSBVL  CSLW5                            * 81614
        C=RSTK                                   * 8161B
        R0=C                                     * 8161D
        GOSUB   D1=IRAM~jump_5                   * 81620
        D1=(4)  #0092                            * 81624
        P=      0                                * 8162A
        C=0     A                                * 8162C
        LC(2)   #22                              * 8162E
        D=C     A                                * 81632
        LC(2)   #16                              * 81634
        B=0     A                                * 81638
        GOSBVL  $5x7                             * 8163A
        C=R0                                     * 81641
        RSTK=C                                   * 81644
        GOSBVL  CSRW5                            * 81646
        RSTK=C                                   * 8164D
        GOSBVL  CSRW5                            * 8164F
        PC=C                                     * 81656

* refs (10): 801AC 801C3 802F4 80307 8067E 81090 ...
SUB_8165A:
        A=0     A                                * 8165A
        A=DAT0  B                                * 8165C
        D0=D0+  2                                * 8165F

* refs (2): 81DF2 81E0B
SUB_81662:
        P=      0                                * 81662
        C=0     A                                * 81664
        LC(2)   #16                              * 81666
        SETHEX                                   * 8166A
        C=C-A   A                                * 8166C
        B=C     A                                * 8166E
        D1=(5)  =IR_16Hz_Clock                   * 81670
        C=DAT1  A                                * 81677
        D1=C                                     * 8167A
        D1=(4)  #0092                            * 8167D
        GOTO    L_81693                          * 81683
L_81687:
        C=DAT0  B                                * 81687
        DAT1=C  B                                * 8168A
        D0=D0+  2                                * 8168D
        D1=D1+  2                                * 81690
L_81693:
        A=A-1   A                                * 81693
        GONC    L_81687                          * 81695
        LC(2)   #20                              * 81698
        GOTO    L_816A6                          * 8169C
L_816A0:
        DAT1=C  B                                * 816A0
        D1=D1+  2                                * 816A3
L_816A6:
        B=B-1   A                                * 816A6
        GONC    L_816A0                          * 816A8
        RTNCC                                    * 816AB

* refs (2): 80313 81736
SUB_816AD:
        GOSUBL  D1=IRAM~jump_5                   * 816AD
        D1=(4)  #009C                            * 816B3
        AD0EX                                    * 816B9
        DAT1=A  A                                * 816BC
        D1=D1-  11                               * 816BF
        A=DAT1  W                                * 816C2
        D1=D1+  11                               * 816C6
        B=A     W                                * 816C9
        P=      0                                * 816CC
        C=0     A                                * 816CE
        LC(1)   #7                               * 816D0
        A=C     A                                * 816D3
        GOSUB   SUB_816E5                        * 816D5
        GOSUB   SUB_816E5                        * 816D9
        GOSUB   SUB_816E5                        * 816DD
        GOSUB   SUB_816E5                        * 816E1

* refs (4): 816D5 816D9 816DD 816E1
SUB_816E5:
        BSLC                                     * 816E5
        LC(2)   #39                              * 816E8
        BCEX    P                                * 816EC
        ?B>=C   P                                * 816EF
        GOYES   L_816F6                          * 816F2
        C=C+A   A                                * 816F4
L_816F6:
        DAT1=C  B                                * 816F6
        D1=D1+  2                                * 816F9
        RTN                                      * 816FC
L_816FE:
        D0=(5)  L_8188D                          * 816FE
        GOTO    L_81710                          * 81705
L_81709:
        D0=(5)  L_818A1                          * 81709
L_81710:
        C=DAT0  B                                * 81710
        D0=D0+  2                                * 81713
        C=C+C   A                                * 81716
        C=C-1   A                                * 81718
        P=C     0                                * 8171A
        GOSUBL  D1=IRAM~jump_5                   * 8171E
        D1=(4)  #009C                            * 81724
        C=DAT0  WP                               * 8172A
        DAT1=C  WP                               * 8172E
        GOTO    L_81765                          * 81732

* refs (12): 80547 806C5 808F4 80AB4 80BC5 80D85 ...
* Probably: self-test: report a failure (message at D0, the hex value at RAM #0091) on the display and the serial port
SUB_81736:
        GOSUB   SUB_816AD                        * 81736
        GOSBVL  SUB_012F9                        * 8173A
        GONC    L_81747                          * 81741
        C=0     W                                * 81744
L_81747:
        GOSUBL  SUB_80EBC                        * 81747
        D1=(4)  #0085                            * 8174D
        A=DAT1  13                               * 81753
        P=      12                               * 81757
        A=A+1   WP                               * 81759
        P=      0                                * 8175C
        GONC    L_81765                          * 8175E
        DAT1=C  13                               * 81761
L_81765:
        GOSUB   L_81602                          * 81765

* refs (1): 80202
SUB_81769:
        P=      0                                * 81769
        C=0     A                                * 8176B
        LC(2)   #16                              * 8176D
        GOSUBL  SUB_80EBC                        * 81771
        D1=(4)  #0092                            * 81777
        GOSUB   SUB_817E9                        * 8177D
        D1=(5)  L_817E7                          * 81781
        C=0     A                                * 81788
        C=C+1   A                                * 8178A
        GOSUB   SUB_817E9                        * 8178C
        P=      0                                * 81790
        SETHEX                                   * 81792
        LC(1)   #6                               * 81794
        GOSUBL  SUB_80DED                        * 81797
        GOSUBL  D1=IRAM~jump_5                   * 8179D
        LC(4)   #0092                            * 817A3
        R3=C                                     * 817A9
        C=0     A                                * 817AC
        LC(2)   #15                              * 817AE
L_817B2:
        RSTK=C                                   * 817B2
        C=R3                                     * 817B4
        D1=C                                     * 817B7
        A=DAT1  B                                * 817BA
        C=C+1   A                                * 817BD
        C=C+1   A                                * 817BF
        R3=C                                     * 817C1
        GOSUB   OUTUART~jump                     * 817C4
        C=RSTK                                   * 817C8
        C=C-1   A                                * 817CA
        GONC    L_817B2                          * 817CC
        LC(2)   #0D                              * 817CF
        A=C     A                                * 817D3
        GOSUB   OUTUART~jump                     * 817D5
        LC(2)   #0A                              * 817D9
        A=C     A                                * 817DD
        GOSUB   OUTUART~jump                     * 817DF
        GOTO    L_8180D                          * 817E3
L_817E7:
        NIBHEX  A0                               * 817E7  .

* refs (2): 8177D 8178C
SUB_817E9:
        GOTO    L_81808                          * 817E9
L_817ED:
        RSTK=C                                   * 817ED
        A=DAT1  B                                * 817EF
        D1=D1+  2                                * 817F2
        ST=0    15                               * 817F5
        GOSBVL  L_65886                          * 817F8
        GOSBVL  AllowIntr                        * 817FF
        C=RSTK                                   * 81806
L_81808:
        C=C-1   A                                * 81808
        GONC    L_817ED                          * 8180A
L_8180D:
        D0=(5)  ANNCTRL                          * 8180D
        C=DAT0  B                                * 81814
        CBIT=0  5                                * 81817
        DAT0=C  B                                * 8181C
        P=      0                                * 8181F
        RTNCC                                    * 81821

* Self-test messages: counted strings (used as L_81823+n)
L_81823:
        CON(2)  4                                * 81823  entry 0
        NIBASC  "SPD "                           * 81825
L_8182D:
        CON(2)  4                                * 8182D  entry 1
        NIBASC  "DISP"                           * 8182F
L_81837:
        CON(2)  4                                * 81837  entry 2
        NIBASC  "IROM"                           * 81839
L_81841:
        CON(2)  4                                * 81841  entry 3
        NIBASC  "IRAM"                           * 81843
L_8184B:
        CON(2)  4                                * 8184B  entry 4
        NIBASC  "KBD1"                           * 8184D
L_81855:
        CON(2)  4                                * 81855  entry 5
        NIBASC  "KBD2"                           * 81857
L_8185F:
        CON(2)  3                                * 8185F  entry 6
        NIBASC  "KBD"                            * 81861
L_81867:
        CON(2)  14                               * 81867  entry 7
        NIBASC  "ESD 210V  210V"                 * 81869
L_81885:
        CON(2)  3                                * 81885  entry 8
        NIBASC  "ESD"                            * 81887
L_8188D:
        CON(2)  2                                * 8188D  entry 9
        NIBASC  "OK"                             * 8188F
L_81893:
        CON(2)  6                                * 81893  entry 10
        NIBASC  "OK-48 "                         * 81895
L_818A1:
        CON(2)  4                                * 818A1  entry 11
        NIBASC  "FAIL"                           * 818A3
L_818AB:
        CON(2)  4                                * 818AB  entry 12
        NIBASC  "U_LB"                           * 818AD
L_818B5:
        CON(2)  4                                * 818B5  entry 13
        NIBASC  "UART"                           * 818B7
L_818BF:
        CON(2)  10                               * 818BF  entry 14
        NIBASC  "U_LB XMIT\04"                   * 818C1
L_818D5:
        CON(2)  9                                * 818D5  entry 15
        NIBASC  "Time Init"                      * 818D7
L_818E9:
        CON(2)  6                                * 818E9  entry 16
        NIBASC  "Start:"                         * 818EB
L_818F7:
        CON(2)  6                                * 818F7  entry 17
        NIBASC  "Fail :"                         * 818F9
L_81905:
        CON(2)  4                                * 81905  entry 18
        NIBASC  "PORT"                           * 81907
L_8190F:
        CON(2)  4                                * 8190F  entry 19
        NIBASC  "RAM1"                           * 81911
L_81919:
        CON(2)  4                                * 81919  entry 20
        NIBASC  "RAM2"                           * 8191B
L_81923:
        CON(2)  4                                * 81923  entry 21
        NIBASC  "IRLB"                           * 81925
L_8192D:
        CON(2)  4                                * 8192D  entry 22
        NIBASC  "IRIO"                           * 8192F
L_81937:
        CON(2)  4                                * 81937  entry 23
        NIBASC  "SEND"                           * 81939
L_81941:
        CON(2)  4                                * 81941  entry 24
        NIBASC  "RECV"                           * 81943
        CON(2)  14                               * 8194B  entry 25
        NIBASC  "Version HP48-R"                 * 8194D
        CON(2)  17                               * 81969  entry 26
        NIBASC  "Copyright HP 1989"              * 8196B
L_8198D:
        BSS     3                                * 8198D  zeros
        GOSUB   SUB_81B6B                        * 81990
        LC(5)   #C0000                           * 81994
        B=C     A                                * 8199B
        GOSBVL  SUB_01DA1                        * 8199D
        GONC    L_819B2                          * 819A4
        D0=(5)  #00001                           * 819A7
        GOTO    L_819D7                          * 819AE
L_819B2:
        B=C     A                                * 819B2
        GOSUB   SUB_81B3D                        * 819B4
        C=B     A                                * 819B8
        GOSBVL  SUB_8148B                        * 819BA
        GOSUB   SUB_81B6B                        * 819C1
        GOSUB   SUB_819E2                        * 819C5
        GOC     L_819D7                          * 819C9
        GOSUB   SUB_81B3D                        * 819CC
        GOVLNG  L_811E3                          * 819D0
L_819D7:
        GOSUB   SUB_81B3D                        * 819D7
        GOVLNG  L_811ED                          * 819DB

* refs (1): 819C5
SUB_819E2:
        CD0EX                                    * 819E2
        CR0EX.F A                                * 819E5
        RSTK=C                                   * 819EB
        C=R0                                     * 819ED
        B=C     A                                * 819F0
        GOSUB   SUB_81B99                        * 819F2
        GOSBVL  SUB_044D4                        * 819F6
        RSTK=C                                   * 819FD
        GOSUB   SUB_81A7E                        * 819FF
        GOC     L_81A72                          * 81A03
        GOSUB   SUB_81B99                        * 81A06
        D=C     A                                * 81A0A
        C=R1                                     * 81A0C
        RSTK=C                                   * 81A0F
        C=R0                                     * 81A11
        C=C-D   A                                * 81A14
        CSR     A                                * 81A16
        CSRB.F  A                                * 81A18
        CSRB.F  A                                * 81A1D
        C=C-1   A                                * 81A22
        B=C     A                                * 81A24
L_81A26:
        GOSUBL  SUB_81BA2                        * 81A26
        GOC     L_81A6A                          * 81A2C
        B=B-1   A                                * 81A2F
        GONC    L_81A26                          * 81A31
        C=RSTK                                   * 81A34
        R1=C.F  A                                * 81A36
        C=R0                                     * 81A3C
        B=C     A                                * 81A3F
        GOSUB   SUB_81B99                        * 81A41
        GOSBVL  SUB_044D4                        * 81A45
        A=C     A                                * 81A4C
        C=RSTK                                   * 81A4E
        B=C     A                                * 81A50
        C=RSTK                                   * 81A52
        R0=C.F  A                                * 81A54
        ?A#B    A                                * 81A5A
        GOYES   L_81A61                          * 81A5D
        RTNCC                                    * 81A5F
L_81A61:
        D0=(5)  #00000                           * 81A61
        RTNSC                                    * 81A68
L_81A6A:
        C=RSTK                                   * 81A6A
        R1=C.F  A                                * 81A6C
L_81A72:
        C=RSTK                                   * 81A72
        C=RSTK                                   * 81A74
        R0=C.F  A                                * 81A76
        RTNSC                                    * 81A7C

* refs (1): 819FF
SUB_81A7E:
        P=      0                                * 81A7E
        LC(5)   #C0000                           * 81A80
        R3=C                                     * 81A87
        C=0     W                                * 81A8A
        C=C+1   A                                * 81A8D
        R2=C                                     * 81A8F
L_81A92:
        C=R3                                     * 81A92
        D1=C                                     * 81A95
        A=DAT1  1                                * 81A98
        B=A     P                                * 81A9C
        BSL     A                                * 81A9F
        A=R2                                     * 81AA1
        A=A+C   A                                * 81AA4
        D1=A                                     * 81AA6
        A=DAT1  1                                * 81AA9
        B=A     P                                * 81AAD
        D1=C                                     * 81AB0
        LC(1)   #1                               * 81AB3
        DAT1=C  1                                * 81AB6
        C=R3                                     * 81ABA
        A=R2                                     * 81ABD
        A=A+C   A                                * 81AC0
        D1=A                                     * 81AC2
        LC(1)   #2                               * 81AC5
        DAT1=C  1                                * 81AC8
        C=R3                                     * 81ACC
        D1=C                                     * 81ACF
        A=DAT1  1                                * 81AD2
        LC(1)   #1                               * 81AD6
        ?C#A    P                                * 81AD9
        GOYES   L_81B35                          * 81ADC
        C=R3                                     * 81ADE
        A=R2                                     * 81AE1
        A=A+C   A                                * 81AE4
        D1=A                                     * 81AE6
        A=DAT1  1                                * 81AE9
        LC(1)   #2                               * 81AED
        ?C#A    P                                * 81AF0
        GOYES   L_81B35                          * 81AF3
        C=R3                                     * 81AF5
        D1=C                                     * 81AF8
        C=B     A                                * 81AFB
        CSR     A                                * 81AFD
        DAT1=C  1                                * 81AFF
        C=R3                                     * 81B03
        A=R2                                     * 81B06
        A=A+C   A                                * 81B09
        D1=A                                     * 81B0B
        C=B     A                                * 81B0E
        DAT1=C  1                                * 81B10
        A=R2                                     * 81B14
        A=A+A   A                                * 81B17
        R2=A                                     * 81B19
        GOC     L_81B33                          * 81B1C
        C=R3                                     * 81B1F
        A=A+C   A                                * 81B22
        GOC     L_81B33                          * 81B24
        C=R0                                     * 81B27
        ?C<=A   A                                * 81B2A
        GOYES   L_81B33                          * 81B2D
        GOTO    L_81A92                          * 81B2F
L_81B33:
        RTNCC                                    * 81B33
L_81B35:
        AD1EX                                    * 81B35
        D0=A                                     * 81B38
        RTNSC                                    * 81B3B

* refs (3): 819B4 819CC 819D7
SUB_81B3D:
        D1=(5)  #90000                           * 81B3D
        C=DAT1  B                                * 81B44
        D1=(5)  L_3FFDB+37                       * 81B47
        D1=(4)  #069A                            * 81B4E
        C=DAT1  B                                * 81B54
        CBIT=1  7                                * 81B57
        DAT1=C  B                                * 81B5C
        D1=(5)  LINECOUNT                        * 81B5F
        DAT1=C  B                                * 81B66
        RTN                                      * 81B69

* refs (2): 81990 819C1
SUB_81B6B:
        D1=(5)  L_3FFDB+37                       * 81B6B
        D1=(4)  #069A                            * 81B72
        C=DAT1  B                                * 81B78
        CBIT=0  7                                * 81B7B
        DAT1=C  B                                * 81B80
        D1=(5)  LINECOUNT                        * 81B83
        DAT1=C  B                                * 81B8A
        D1=(5)  #90040                           * 81B8D
        C=DAT1  B                                * 81B94
        RTN                                      * 81B97

* refs (3): 819F2 81A06 81A41
SUB_81B99:
        LC(5)   #C0000                           * 81B99
        RTN                                      * 81BA0

* refs (1): 81A26
SUB_81BA2:
        C=D     A                                * 81BA2
        D0=C                                     * 81BA4
        C=DAT0  W                                * 81BA7
        R1=C                                     * 81BAB
        D0=D0+  16                               * 81BAE
        C=DAT0  W                                * 81BB1
        R2=C                                     * 81BB5
        D0=D0+  16                               * 81BB8
        C=DAT0  W                                * 81BBB
        R3=C                                     * 81BBF
        D0=D0+  16                               * 81BC2
        C=DAT0  W                                * 81BC5
        R4=C                                     * 81BC9
        P=      0                                * 81BCC
        LA(16)  #2942942942942942                * 81BCE
        B=A     S                                * 81BE3
        C=D     A                                * 81BE6
L_81BE8:
        D0=C                                     * 81BE8
        DAT0=A  15                               * 81BEB
        D0=D0+  15                               * 81BEF
        DAT0=A  15                               * 81BF2
        D0=D0+  15                               * 81BF6
        DAT0=A  15                               * 81BF9
        D0=D0+  15                               * 81BFD
        DAT0=A  15                               * 81C00
        D0=D0+  15                               * 81C04
        DAT0=A  4                                * 81C07
        D0=C                                     * 81C0B
        P=      14                               * 81C0E
        C=DAT0  15                               * 81C10
        ?C#A    WP                               * 81C14
        GOYES   L_81C6A                          * 81C17
        D0=D0+  15                               * 81C19
        C=DAT0  15                               * 81C1C
        ?C#A    WP                               * 81C20
        GOYES   L_81C6A                          * 81C23
        D0=D0+  15                               * 81C25
        C=DAT0  15                               * 81C28
        ?C#A    WP                               * 81C2C
        GOYES   L_81C6A                          * 81C2F
        D0=D0+  15                               * 81C31
        C=DAT0  15                               * 81C34
        ?C#A    WP                               * 81C38
        GOYES   L_81C6A                          * 81C3B
        D0=D0+  15                               * 81C3D
        P=      3                                * 81C40
        C=DAT0  4                                * 81C42
        ?C#A    WP                               * 81C46
        GOYES   L_81C6A                          * 81C49
        ASL     W                                * 81C4B
        C=A     S                                * 81C4E
        P=C     15                               * 81C51
        C=P     0                                * 81C55
        P=      0                                * 81C59
        A=C     P                                * 81C5B
        C=D     A                                * 81C5E
        B=B-1   S                                * 81C60
        GOC     L_81C7B                          * 81C63
        GOTO    L_81BE8                          * 81C66
L_81C6A:
        C=RSTK                                   * 81C6A
        DCEX    A                                * 81C6C
        BUSCC                                    * 81C6E
        P=      0                                * 81C71
        GOSUB   L_81C7B                          * 81C73
        RSTK=C                                   * 81C77
        RTNSC                                    * 81C79
L_81C7B:
        CD0EX                                    * 81C7B
        A=R1                                     * 81C7E
        DAT0=A  W                                * 81C81
        D0=D0+  16                               * 81C85
        A=R2                                     * 81C88
        DAT0=A  W                                * 81C8B
        D0=D0+  16                               * 81C8F
        A=R3                                     * 81C92
        DAT0=A  W                                * 81C95
        D0=D0+  16                               * 81C99
        A=R4                                     * 81C9C
        DAT0=A  W                                * 81C9F
        D0=D0+  16                               * 81CA3
        CD0EX                                    * 81CA6
        DCEX    A                                * 81CA9
        RTNCC                                    * 81CAB
L_81CAD:
        GOSUB   SUB_81E27                        * 81CAD
        LC(5)   #0000F                           * 81CB1
        GOTO    SUB_81DE7                        * 81CB8
L_81CBC:
        GOSBVL  ClrScrMn                         * 81CBC
        LC(5)   #0000D                           * 81CC3
        GOSUB   SUB_81DE7                        * 81CCA
        D1=(5)  ANNCTRL                          * 81CCE
        C=DAT1  B                                * 81CD5
        CBIT=1  4                                * 81CD8
        DAT1=C  B                                * 81CDD
        RTN                                      * 81CE0
L_81CE2:
        GOSUB   SUB_81E27                        * 81CE2
        LC(5)   #00007                           * 81CE6
        GOSUB   SUB_81DE7                        * 81CED
        LC(5)   #00010                           * 81CF1
        GOTO    L_81D12                          * 81CF8
L_81CFC:
        GOSUB   SUB_81E27                        * 81CFC
        LC(5)   #00007                           * 81D00
        GOSUB   SUB_81DE7                        * 81D07
        LC(5)   #00008                           * 81D0B
L_81D12:
        GOSUB   SUB_81E00                        * 81D12
        GOSBVL  SUB_815D3                        * 81D16
        GOVLNG  ClrScrMn                         * 81D1D
L_81D24:
        GOSUB   SUB_81E19                        * 81D24
        LC(5)   #0000E                           * 81D28
        GOSUB   SUB_81DE7                        * 81D2F
L_81D33:
        P=      0                                * 81D33
        SETHEX                                   * 81D35
        GOSBVL  ClrMenu                          * 81D37
        D1=(5)  L_81D93                          * 81D3E
        GOSBVL  D0->Sft1                         * 81D45
        AD0EX                                    * 81D4C
        C=0     A                                * 81D4F
        GOSUB   SUB_81D6E                        * 81D51
        D1=(5)  L_81DBD                          * 81D55
        GOSBVL  D0->Sft1                         * 81D5C
        AD0EX                                    * 81D63
        C=0     A                                * 81D66
        LC(2)   #1B                              * 81D68
        A=A+C   A                                * 81D6C

* refs (1): 81D51
SUB_81D6E:
        LC(2)   #22                              * 81D6E
        A=A+C   A                                * 81D72
        D0=A                                     * 81D74
        P=      9                                * 81D77
L_81D79:
        A=DAT1  6                                * 81D79
        DAT0=A  6                                * 81D7D
        AD0EX                                    * 81D81
        A=A+C   A                                * 81D84
        D0=A                                     * 81D86
        D1=D1+  6                                * 81D89
        P=P+1                                    * 81D8C
        GONC    L_81D79                          * 81D8E
        RTN                                      * 81D91

L_81D93:
        CON(5)  L_FFFFC+3                        * 81D93  address (the code jumps or points through it)
        NIBHEX  1                                * 81D98

        CON(5)  L_F310E+81                       * 81D99  address (the code jumps or points through it)
        NIBHEX  1                                * 81D9E

        CON(5)  L_FDD3B+36                       * 81D9F  address (the code jumps or points through it)
        NIBHEX  1                                * 81DA4

        CON(5)  L_FB0EE+209                      * 81DA5  address (the code jumps or points through it)
        NIBHEX  1                                * 81DAA

        CON(5)  L_F7C51+366                      * 81DAB  address (the code jumps or points through it)
        NIBHEX  1                                * 81DB0

        CON(5)  L_F91A2+29                       * 81DB1  address (the code jumps or points through it)
        NIBHEX  1                                * 81DB6

        CON(5)  L_FFFFC+3                        * 81DB7  address (the code jumps or points through it)
        NIBHEX  1                                * 81DBC

L_81DBD:
        CON(5)  L_FFFFC                          * 81DBD  address (the code jumps or points through it)
        NIBHEX  3                                * 81DC2

        CON(5)  L_E2DEB+17                       * 81DC3  address (the code jumps or points through it)
        NIBHEX  3                                * 81DC8

        CON(5)  L_EA9FA+2                        * 81DC9  address (the code jumps or points through it)
        NIBHEX  3                                * 81DCE

        CON(5)  L_EA1F3+9                        * 81DCF  address (the code jumps or points through it)
        NIBHEX  3                                * 81DD4

        CON(5)  L_EA5F3+9                        * 81DD5  address (the code jumps or points through it)
        NIBHEX  3                                * 81DDA

        CON(5)  L_E2DEB+17                       * 81DDB  address (the code jumps or points through it)
        NIBHEX  3                                * 81DE0

        CON(5)  L_FFFFC                          * 81DE1  address (the code jumps or points through it)
        NIBHEX  3                                * 81DE6

* refs (5): 81CB8 81CCA 81CED 81D07 81D2F
SUB_81DE7:
        D0=(5)  L_73E79                          * 81DE7
        GOSUB   SUB_81E4C                        * 81DEE
        GOSBVL  SUB_81662                        * 81DF2
        GOVLNG  L_81602                          * 81DF9

* refs (1): 81D12
SUB_81E00:
        D0=(5)  L_73E79                          * 81E00
        GOSUB   SUB_81E4C                        * 81E07
        GOSBVL  SUB_81662                        * 81E0B
        GOVLNG  L_815E7                          * 81E12

* refs (1): 81D24
SUB_81E19:
        GOSBVL  Flush                            * 81E19
        GOSBVL  L_00768                          * 81E20

* refs (3): 81CAD 81CE2 81CFC
SUB_81E27:
        GOSBVL  ClrScrMn                         * 81E27
        C=0     A                                * 81E2E
        GOSBVL  SUB_804B6                        * 81E30
        GOSBVL  ScrOn+                           * 81E37
        GOSBVL  SUB_00E0B                        * 81E3E
        GOVLNG  L_802BE                          * 81E45

* refs (2): 81DEE 81E07
SUB_81E4C:
        SETHEX                                   * 81E4C
        C=C-1   A                                * 81E4E
L_81E50:
        A=DAT0  A                                * 81E50
        A=A-CON A,5                              * 81E53
        D0=D0+  5                                * 81E59
        C=C-1   A                                * 81E5C
        GOC     L_81E6D                          * 81E5E
        CD0EX                                    * 81E61
        C=C+A   A                                * 81E64
        CD0EX                                    * 81E66
        GOTO    L_81E50                          * 81E69
L_81E6D:
        ASRB.F  A                                * 81E6D
        RTN                                      * 81E72
        P=      0                                * 81E74
        LC(5)   #00000                           * 81E76
        R4=C                                     * 81E7D
        GOSBVL  Reset                            * 81E80
        ST=0    15                               * 81E87
        P=      0                                * 81E8A
        LC(5)   #A0000                           * 81E8C
        UNCNFG                                   * 81E93
        LC(5)   #C0000                           * 81E96
        CONFIG                                   * 81E9D
        LC(5)   #A0000                           * 81EA0
        CONFIG                                   * 81EA7
        GOVLNG  AllowIntr                        * 81EAA
        GOSBVL  SUB_011AC                        * 81EB1
        GOSBVL  AllowIntr                        * 81EB8
        C=RSTK                                   * 81EBF
        GOSBVL  ClrScrMn                         * 81EC1
        GOVLNG  L_80A67                          * 81EC8
        FILLTO  #82000                           * 81ECF  305 zero nibbles: the next entry stays at #82000

        LENGTH                                   * 82000  library object without its prolog (its place is the end of the link table before): length, to #86FDD
        CON(2)  0                                * 82005  no title
