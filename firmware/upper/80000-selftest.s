* HP 48GX ROM revision R, #80000-#82006: Self-test code (runs with RAM unconfigured)
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: KeyTestDiag KeyTestAll

        ORG     #80000
VersionStrings.L1:
        C=0     A                                * 80000
        R1=C                                     * 80002
        GOSBVL  ClrScrMn                         * 80005
        GOSUBL  SUB_8150C                        * 8000C
        GOSBVL  D0->Sft1.L1                      * 80012
        GOTO    VersionStrings.L3                * 80019
VersionStrings.loop2:
        C=0     A                                * 8001D
        GOSUBL  SUB_804B6                        * 8001F
        GOSUBL  SUB_814C5                        * 80025
VersionStrings.L3:
        GOSUBL  SUB_80215.L2                     * 8002B
        GOSBVL  SUB_00D3B                        * 80031
        GOSUBL  Flush~jump                       * 80038
        ?ST=1   6                                * 8003E
        GOYES   SUB_80081.L1                     * 80041
        RSI                                      * 80043
VersionStrings.loop4:
        GOSBVL  POPKEY                           * 80048
        GOC     VersionStrings.loop4             * 8004F
        B=C     A                                * 80052
        GOSUBL  ClrScrMn~jump                    * 80054
        C=0     A                                * 8005A
        LC(2)   #1C                              * 8005C
        ?B>C    A                                * 80060
        GOYES   VersionStrings.loop2             * 80063
        B=B-1   A                                * 80065
        A=B     A                                * 80067
        LC(5)   SUB_80215.L1                     * 80069
        GOSUB   SUB_80081                        * 80070
        LC(5)   VersionStrings.loop2             * 80074
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
SUB_80081.L1:
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
        GOYES   SUB_80081.L3                     * 800CA
        ?ST=0   7                                * 800CC
        GOYES   SUB_80081.L2                     * 800CF
        GOSUBL  SUB_80D8B                        * 800D1
        GOSUBL  SUB_8155D                        * 800D7
        GOTO    SUB_80081.L3                     * 800DD
SUB_80081.L2:
        GOSUBL  SUB_80D39                        * 800E1
        GOSUBL  SUB_8155D                        * 800E7
SUB_80081.L3:
        ?ST=0   8                                * 800ED
        GOYES   SUB_80081.L4                     * 800F0
        GOSUBL  SUB_810E6                        * 800F2
        GOSUBL  SUB_8155D                        * 800F8
SUB_80081.L4:
        GOSUB   SUB_802C8                        * 800FE
        GOSUB   SUB_802DF                        * 80102
        GOSUBL  SUB_8155D                        * 80106
        GOSUBL  SUB_815D3                        * 8010C
        GOSUBL  ClrScrMn~jump                    * 80112
        GOTO    VersionStrings.L3                * 80118
SUB_80081.L5:
        ST=0    8                                * 8011C
        ST=0    10                               * 8011F
        GOTO    SUB_80081.L11                    * 80122
SUB_80081.L6:
        ST=0    8                                * 80126
        ST=1    10                               * 80129
        ST=0    7                                * 8012C
        GOTO    SUB_80081.L11                    * 8012F
SUB_80081.L7:
        ST=0    8                                * 80133
        ST=1    10                               * 80136
        ST=1    7                                * 80139
        GOTO    SUB_80081.L11                    * 8013C
SUB_80081.L8:
        ST=1    8                                * 80140
        ST=0    10                               * 80143
        GOTO    SUB_80081.L11                    * 80146
SUB_80081.L9:
        ST=1    8                                * 8014A
        ST=1    10                               * 8014D
        ST=0    7                                * 80150
        GOTO    SUB_80081.L11                    * 80153
SUB_80081.L10:
        ST=1    8                                * 80157
        ST=1    10                               * 8015A
        ST=1    7                                * 8015D
SUB_80081.L11:
        GOVLNG  CINRTN.L2                        * 80160

* refs (2): 802AA 80CB1
SUB_80167:
        GOSBVL  SUB_012F9                        * 80167
        GONC    SUB_80167.L1                     * 8016E
        C=0     W                                * 80171
SUB_80167.L1:
        GOSUBL  SUB_80EBC                        * 80174
        D1=(4)  #0078                            * 8017A
        DAT1=C  13                               * 80180
        C=0     W                                * 80184
        C=-C-1  W                                * 80187
        D1=(4)  #0085                            * 8018A
        DAT1=C  13                               * 80190
        D0=(5)  SUB_817E9.L19                    * 80194
        GOSUBL  SUB_815FE                        * 8019B
        GOTO    SUB_80167.L6                     * 801A1
SUB_80167.L2:
        D0=(5)  SUB_817E9.L20                    * 801A5
        GOSUBL  SUB_8165A                        * 801AC
        D1=(4)  #0084                            * 801B2
        GOTO    SUB_80167.L4                     * 801B8
SUB_80167.L3:
        D0=(5)  SUB_817E9.L21                    * 801BC
        GOSUBL  SUB_8165A                        * 801C3
        D1=(4)  #0091                            * 801C9
SUB_80167.L4:
        CD1EX                                    * 801CF
        D1=C                                     * 801D2
        D0=C                                     * 801D5
        D0=(4)  #009E                            * 801D8
        P=      15                               * 801DE
        LC(1)   #C                               * 801E0
        P=      0                                * 801E3
SUB_80167.loop5:
        C=DAT1  1                                * 801E5
        GOSUB   SUB_80215                        * 801E9
        DAT0=C  B                                * 801ED
        D0=D0+  2                                * 801F0
        D1=D1-  1                                * 801F3
        C=C-1   S                                * 801F6
        GONC    SUB_80167.loop5                  * 801F9
        GOSUBL  SUB_815FE.L1                     * 801FC
SUB_80167.L6:
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
SUB_80215.L1:
        CON(5)  SUB_80329                        * 80232  entry 0
        CON(5)  SUB_80389                        * 80237  entry 1
        CON(5)  SUB_804C0                        * 8023C  entry 2
        CON(5)  SUB_8066D                        * 80241  entry 3
        CON(5)  SUB_8081A.L2                     * 80246  entry 4
        CON(5)  SUB_8081A.L1                     * 8024B  entry 5
        CON(5)  KeyTestDiag.L1                   * 80250  entry 6
        CON(5)  SUB_80D39                        * 80255  entry 7
        CON(5)  SUB_80EBC.L1                     * 8025A  entry 8
        CON(5)  POPUART~jump.L1                  * 8025F  entry 9
        CON(5)  SUB_810E6                        * 80264  entry 10
        CON(5)  SUB_80ABA.L7                     * 80269  entry 11
        CON(5)  SUB_80ABA.L8                     * 8026E  entry 12
        CON(5)  SUB_80C13.L1                     * 80273  entry 13
        CON(5)  SUB_80D8B                        * 80278  entry 14
        CON(5)  SUB_80EF3.L7                     * 8027D  entry 15
        CON(5)  VersionStrings.loop2             * 80282  entry 16
        CON(5)  VersionStrings.loop2             * 80287  entry 17
        CON(5)  SUB_80167.L2                     * 8028C  entry 18
        CON(5)  SUB_80167.L3                     * 80291  entry 19
        CON(5)  SUB_80081.L8                     * 80296  entry 20
        CON(5)  SUB_80081.L6                     * 8029B  entry 21
        CON(5)  SUB_80081.L9                     * 802A0  entry 22
        CON(5)  SUB_80081.L7                     * 802A5  entry 23
        CON(5)  SUB_80167                        * 802AA  entry 24
        CON(5)  SUB_80081.L5                     * 802AF  entry 25
        CON(5)  SUB_80081.L10                    * 802B4  entry 26
        CON(5)  SUB_802DF                        * 802B9  entry 27
SUB_80215.L2:
        P=      0                                * 802BE
        LC(2)   #E4                              * 802C0
        GOTO    SUB_802D2.L1                     * 802C4

* refs (2): 800FE 809F0
SUB_802C8:
        P=      0                                * 802C8
        LC(2)   #DA                              * 802CA
        GOTO    SUB_802D2.L1                     * 802CE

* refs (10): 80329 80389 804C0 8066D 80832 80B2D ...
SUB_802D2:
        P=      0                                * 802D2
        LC(2)   #F4                              * 802D4
SUB_802D2.L1:
        GOVLNG  RCKBp                            * 802D8

* refs (2): 80102 802B9
SUB_802DF:
        GOSUBL  ClrScrMn~jump                    * 802DF
        C=R1                                     * 802E5
        ?C#0    A                                * 802E8
        GOYES   SUB_802DF.L1                     * 802EB
        D0=(5)  SUB_817E9.L14                    * 802ED
        GOSUBL  SUB_8165A                        * 802F4
        C=0     A                                * 802FA
        GOTO    SUB_802DF.L2                     * 802FC
SUB_802DF.L1:
        D0=(5)  SUB_817E9.L15                    * 80300
        GOSUBL  SUB_8165A                        * 80307
        C=R1                                     * 8030D
        D0=C                                     * 80310
        GOSUBL  SUB_816AD                        * 80313
        LC(2)   #FA                              * 80319
SUB_802DF.L2:
        GOSUBL  SUB_804B6                        * 8031D
        GOLONG  SUB_81736.L2                     * 80323

* refs (2): 80097 80232
SUB_80329:
        GOSUBL  SUB_802D2                        * 80329
        D0=(5)  SUB_817E9.L4                     * 8032F
        GOSUBL  SUB_815FE                        * 80336
        GOSUB   SUB_80360                        * 8033C
        ASL     W                                * 80340
        GOSBVL  SUB_657B9                        * 80343
        GOSUBL  SUB_80EBC                        * 8034A
        D1=(4)  #009A                            * 80350
        DAT1=C  14                               * 80356
        GOLONG  SUB_81736.L2                     * 8035A

* refs (1): 8033C
SUB_80360:
        GOSBVL  DisableIntr                      * 80360
        GOSBVL  DispOff                          * 80367
        GOSBVL  clkspd                           * 8036E
        GOSBVL  SUB_7017C                        * 80375
        GOSBVL  DispOn                           * 8037C
        GOLONG  SUB_80ABA.L6                     * 80383

* refs (2): 800A3 80237
SUB_80389:
        GOSUBL  SUB_802D2                        * 80389
        C=0     A                                * 8038F
        GOSUB   SUB_804B6                        * 80391
        GOSUB   ClrScrMn~jump                    * 80395
        D0=(5)  SUB_817E9.L5                     * 80399
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
        GOTO    SUB_8044F.L1                     * 8043B

* refs (2): 80421 80431
SUB_8043F:
        D=C     A                                * 8043F
        C=B     W                                * 80441
SUB_8043F.loop1:
        GOSUB   SUB_8049F                        * 80444
        D=D-1   A                                * 80448
        GONC    SUB_8043F.loop1                  * 8044A
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
SUB_8044F.L1:
        GOLONG  SUB_8155D                        * 80477

* refs (2): 80463 80473
SUB_8047D:
        D=C     A                                * 8047D
SUB_8047D.loop1:
        C=0     W                                * 8047F
        A=A+A   S                                * 80482
        GONC    SUB_8047D.L2                     * 80485
        A=0     S                                * 80488
        A=A+1   S                                * 8048B
        A=A+1   S                                * 8048E
        C=-C-1  W                                * 80491
SUB_8047D.L2:
        GOSUB   SUB_8049F                        * 80494
        D=D-1   A                                * 80498
        GONC    SUB_8047D.loop1                  * 8049A
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
        D0=(5)  SUB_817E9.L6                     * 804C6
        GOSUBL  SUB_815FE                        * 804CD
        D0=(5)  #00000                           * 804D3
        LC(5)   #03FFF                           * 804DA
        B=C     A                                * 804E1
        LC(5)   #00000                           * 804E3
        D=C     A                                * 804EA
        LC(5)   #40000                           * 804EC
        AD0EX                                    * 804F3
        GOSUB   SUB_8054D                        * 804F6
        GONC    SUB_804C0.L2                     * 804FA
        D0=(5)  VersionStrings.L1                * 804FD
        LC(5)   #03FFF                           * 80504
        B=C     A                                * 8050B
        LC(5)   #00000                           * 8050D
        D=C     A                                * 80514
        LC(5)   #40000                           * 80516
        AD0EX                                    * 8051D
        GOSUB   SUB_8054D                        * 80520
        GONC    SUB_804C0.L1                     * 80524
        GOLONG  SUB_816E5.L2                     * 80527
SUB_804C0.L1:
        P=      15                               * 8052D
        CPEX    4                                * 8052F
SUB_804C0.L2:
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
SUB_8054D.loop1:
        D0=A                                     * 80565
        RSTK=C                                   * 80568
        CAEX    A                                * 8056A
        RSTK=C                                   * 8056C
        C=C+A   A                                * 8056E
        D1=C                                     * 80570
        C=B     A                                * 80573
SUB_8054D.loop2:
        A=DAT0  W                                * 80575
        D0=D0+  16                               * 80579
        A=DAT1  W                                * 8057C
        D1=D1+  16                               * 80580
        C=C-1   A                                * 80583
        GONC    SUB_8054D.loop2                  * 80585
        C=RSTK                                   * 80588
        A=C     A                                * 8058A
        C=RSTK                                   * 8058C
        A=A+C   A                                * 8058E
        A=A+C   A                                * 80590
        D=D-1   A                                * 80592
        GONC    SUB_8054D.loop1                  * 80594
        GOSUB   SUB_805FE                        * 80597
        D0=(5)  #00104                           * 8059B
        C=0     A                                * 805A2
        C=DAT0  4                                * 805A4
        A=C     A                                * 805A8
        P=      4                                * 805AA
        A=A-1   P                                * 805AC
        A=A+1   A                                * 805AF
        P=      0                                * 805B1
        GOTO    SUB_80ABA.L6                     * 805B3

* refs (1): 8055F
SUB_805B7:
        P=      0                                * 805B7
        ?A#0    A                                * 805B9
        GOYES   SUB_805B7.L1                     * 805BC
        LC(5)   #00100                           * 805BE
        UNCNFG                                   * 805C5
        LC(5)   #B0000                           * 805C8
        CONFIG                                   * 805CF
        RTN                                      * 805D2
SUB_805B7.L1:
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
        GOYES   SUB_805FE.L1                     * 80603
        LC(5)   #B0000                           * 80605
        UNCNFG                                   * 8060C
        LC(5)   #00100                           * 8060F
        CONFIG                                   * 80616
        RTN                                      * 80619
SUB_805FE.L1:
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
        D0=(5)  SUB_817E9.L7                     * 80677
        GOSUBL  SUB_8165A                        * 8067E
        ST=0    15                               * 80684
        GOSUBL  SUB_81349                        * 80687
        B=C     A                                * 8068D
        GOSBVL  SUB_01DA1                        * 8068F
        GONC    SUB_8066D.L1                     * 80696
        D0=(5)  #00001                           * 80699
        GOTO    SUB_8066D.L2                     * 806A0
SUB_8066D.L1:
        GOSUBL  SUB_8148B                        * 806A4
        GOSUBL  SUB_81211                        * 806AA
        GOC     SUB_8066D.L2                     * 806B0
        GOSUBL  SUB_8120A                        * 806B3
        GOLONG  SUB_816E5.L2                     * 806B9
SUB_8066D.L2:
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
SUB_806DE.loop1:
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
        GOYES   SUB_806DE.L2                     * 80753
        D0=D0+  15                               * 80755
        C=DAT0  15                               * 80758
        ?C#A    WP                               * 8075C
        GOYES   SUB_806DE.L2                     * 8075F
        D0=D0+  15                               * 80761
        C=DAT0  15                               * 80764
        ?C#A    WP                               * 80768
        GOYES   SUB_806DE.L2                     * 8076B
        D0=D0+  15                               * 8076D
        C=DAT0  15                               * 80770
        ?C#A    WP                               * 80774
        GOYES   SUB_806DE.L2                     * 80777
        D0=D0+  15                               * 80779
        P=      3                                * 8077C
        C=DAT0  4                                * 8077E
        ?C#A    WP                               * 80782
        GOYES   SUB_806DE.L2                     * 80785
        ASL     W                                * 80787
        C=A     S                                * 8078A
        P=C     15                               * 8078D
        C=P     0                                * 80791
        P=      0                                * 80795
        A=C     P                                * 80797
        C=D     A                                * 8079A
        B=B-1   S                                * 8079C
        GOC     SUB_806DE.L3                     * 8079F
        GOTO    SUB_806DE.loop1                  * 807A2
SUB_806DE.L2:
        C=RSTK                                   * 807A6
        DCEX    A                                * 807A8
        BUSCC                                    * 807AA
        P=      0                                * 807AD
        GOSUB   SUB_806DE.L3                     * 807AF
        RSTK=C                                   * 807B3
        RTNSC                                    * 807B5
SUB_806DE.L3:
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
SUB_8081A.L1:
        ST=1    11                               * 80821
        GOTO    SUB_8081A.L3                     * 80824
SUB_8081A.L2:
        ST=0    11                               * 80828
SUB_8081A.L3:
        ST=0    9                                * 8082B
        GOSUB   SUB_80916                        * 8082E
        GOSUBL  SUB_802D2                        * 80832
        GOSBVL  SUB_00E0B                        * 80838
        INTON                                    * 8083F
        GOSUBL  Flush~jump                       * 80843
        D0=(5)  KeyTestAll                       * 80849
        ?ST=0   11                               * 80850
        GOYES   SUB_8081A.loop4                  * 80853
        D0=(5)  KeyTestDiag                      * 80855
SUB_8081A.loop4:
        C=DAT0  B                                * 8085C
        D=C     A                                * 8085F
        D0=D0+  2                                * 80861
        ?C#0    B                                * 80864
        GOYES   SUB_8081A.L6                     * 80867
        ?ST=0   9                                * 80869
        GOYES   SUB_8081A.L5                     * 8086C
        C=R1.F  A                                * 8086E
        CBIT=1  3                                * 80874
        R1=C.F  A                                * 80879
        GOSUB   SUB_80916                        * 8087F
        GOLONG  SUB_816E5.L3                     * 80883
SUB_8081A.L5:
        GOLONG  SUB_816E5.L2                     * 80889
SUB_8081A.L6:
        GOSUB   SUB_80EBC                        * 8088F
        D1=(4)  #07F7                            * 80893
        A=0     A                                * 80899
        DAT1=A  A                                * 8089B
SUB_8081A.loop7:
        RSI                                      * 8089E
        D1=(4)  #07F7                            * 808A3
        C=DAT1  A                                * 808A9
        ?C=0    A                                * 808AC
        GOYES   SUB_8081A.L8                     * 808AF
        C=0     A                                * 808B1
        LC(2)   #2D                              * 808B3
        GONC    SUB_8081A.L9                     * 808B7
SUB_8081A.L8:
        GOSBVL  POPKEY                           * 808BA
        GONC    SUB_8081A.L9                     * 808C1
        SHUTDN                                   * 808C4
        GOTO    SUB_8081A.loop7                  * 808C7
SUB_8081A.L9:
        ?D=C    B                                * 808CB
        GOYES   SUB_8081A.L10                    * 808CE
        ST=1    9                                * 808D0
        AD0EX                                    * 808D3
        R4=A.F  A                                * 808D6
        CSL     A                                * 808DC
        CSL     A                                * 808DE
        C=D     B                                * 808E0
        RSTK=C                                   * 808E3
        LC(2)   #F4                              * 808E5
        GOSUBL  SUB_802D2.L1                     * 808E9
        C=RSTK                                   * 808EF
        D0=C                                     * 808F1
        GOSUBL  SUB_81736                        * 808F4
        A=R4                                     * 808FA
        D0=A                                     * 808FD
        GOTO    SUB_8081A.loop4                  * 80900
SUB_8081A.L10:
        LC(2)   #94                              * 80904
        GOSUBL  SUB_802D2.L1                     * 80908
        GOSUB   SUB_80916                        * 8090E
        GOTO    SUB_8081A.loop4                  * 80912

* refs (3): 8082E 8087F 8090E
SUB_80916:
        AD0EX                                    * 80916
        R4=A.F  A                                * 80919
        GOSUBL  ClrScrMn~jump                    * 8091F
        D0=(5)  SUB_817E9.L8                     * 80925
        ?ST=0   11                               * 8092C
        GOYES   SUB_80916.L1                     * 8092F
        D0=(5)  SUB_817E9.L9                     * 80931
SUB_80916.L1:
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
KeyTestDiag.L1:
        GOSUBL  ClrScrMn~jump                    * 809BE
        D0=(5)  SUB_817E9.L11                    * 809C4
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
KeyTestDiag.loop2:
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
        GOYES   KeyTestDiag.L4                   * 80A43
        GOSBVL  SUB_00E0B                        * 80A45
        GONC    KeyTestDiag.loop2                * 80A4C
        GOSUB   SUB_80ABA.L6                     * 80A4F
        D1=(5)  DA1BadMASK                       * 80A53
        LC(1)   #4                               * 80A5A
        DAT1=C  1                                * 80A5D
        GOSUBL  ClrScrMn~jump                    * 80A61
KeyTestDiag.loop3:
        GOSBVL  SUB_00E0B                        * 80A67
        GOC     KeyTestDiag.loop3                * 80A6E
        RTN                                      * 80A71
KeyTestDiag.L4:
        RSTK=C                                   * 80A73
        GOSUB   SUB_80ABA.L6                     * 80A75
        D1=(5)  DA1BadMASK                       * 80A79
        LC(1)   #4                               * 80A80
        DAT1=C  1                                * 80A83
        GOSUBL  ClrScrMn~jump                    * 80A87
        D0=(5)  SUB_817E9.L12                    * 80A8D
        GOSUBL  SUB_815FE                        * 80A94
        C=RSTK                                   * 80A9A
        D0=C                                     * 80A9C
        C=R1.F  A                                * 80A9F
        CBIT=1  4                                * 80AA5
        R1=C.F  A                                * 80AAA
        GOSUB   KeyTestDiag.loop3                * 80AB0
        GOLONG  SUB_81736                        * 80AB4

* refs (2): 80A29 80A35
SUB_80ABA:
        A=C     A                                * 80ABA
        LC(6)   #30C30C                          * 80ABC
        ?ABIT=1 3                                * 80AC4
        GOYES   SUB_80ABA.L1                     * 80AC9
        C=0     P                                * 80ACB
SUB_80ABA.L1:
        P=      2                                * 80ACE
        ?ABIT=1 2                                * 80AD0
        GOYES   SUB_80ABA.L2                     * 80AD5
        C=0     P                                * 80AD7
SUB_80ABA.L2:
        P=      3                                * 80ADA
        ?ABIT=1 1                                * 80ADC
        GOYES   SUB_80ABA.L3                     * 80AE1
        C=0     P                                * 80AE3
SUB_80ABA.L3:
        P=      5                                * 80AE6
        ?ABIT=1 0                                * 80AE8
        GOYES   SUB_80ABA.L4                     * 80AED
        C=0     P                                * 80AEF
SUB_80ABA.L4:
        P=      15                               * 80AF2
        LC(1)   #7                               * 80AF4
        B=C     W                                * 80AF7
        P=      0                                * 80AFA
SUB_80ABA.loop5:
        C=B     W                                * 80AFC
        DAT0=C  6                                * 80AFF
        AD0EX                                    * 80B03
        LC(5)   #00022                           * 80B06
        A=A+C   A                                * 80B0D
        D0=A                                     * 80B0F
        B=B-1   S                                * 80B12
        GONC    SUB_80ABA.loop5                  * 80B15
        LC(5)   #00110                           * 80B18
        A=A-C   A                                * 80B1F
        D0=A                                     * 80B21
        RTNCC                                    * 80B24
SUB_80ABA.L6:
        GOVLNG  AllowIntr                        * 80B26
SUB_80ABA.L7:
        GOSUBL  SUB_802D2                        * 80B2D
        GOSUBL  ClrScrMn~jump                    * 80B33
        GOSUBL  SUB_815D3                        * 80B39
        GOTO    KeyTestDiag.loop3                * 80B3F
SUB_80ABA.L8:
        D0=(5)  SUB_817E9.L27                    * 80B43
        GOSUB   SUB_80D29                        * 80B4A
        GOSUB   SUB_80CF0                        * 80B4E
        GOSBVL  GetTime++                        * 80B52
        A=C     W                                * 80B59
        GOSUB   SUB_80BCB                        * 80B5C
        RSTK=C                                   * 80B60
        P=      12                               * 80B62
        GOSUB   SUB_80BE7                        * 80B64
        C=RSTK                                   * 80B68
        GOC     SUB_80ABA.L11                    * 80B6A
        A=C     A                                * 80B6D
        P=      3                                * 80B6F
        GOSUB   SUB_80BE7                        * 80B71
        GOC     SUB_80ABA.L11                    * 80B75
        GOSUB   SUB_80C13                        * 80B78
        GOSUB   SUB_80CE3                        * 80B7C
        GOSUBL  SUB_815C6                        * 80B80
        GOSUB   POPUART~jump                     * 80B86
        C=0     A                                * 80B8A
        GOC     SUB_80ABA.L9                     * 80B8C
        LC(2)   #06                              * 80B8F
        ?C#A    B                                * 80B93
        GOYES   SUB_80ABA.L10                    * 80B96
        LC(2)   #94                              * 80B98
        GOSUBL  SUB_802D2.L1                     * 80B9C
        GOLONG  SUB_816E5.L2                     * 80BA2
SUB_80ABA.L9:
        C=C+1   A                                * 80BA8
        GOTO    SUB_80ABA.L12                    * 80BAA
SUB_80ABA.L10:
        LC(1)   #2                               * 80BAE
        GOTO    SUB_80ABA.L12                    * 80BB1
SUB_80ABA.L11:
        C=A     A                                * 80BB5
SUB_80ABA.L12:
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
SUB_80BE7.loop1:
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
        GONC    SUB_80BE7.loop1                  * 80C0E
        RTNCC                                    * 80C11

* refs (2): 80B78 80C7C
SUB_80C13:
        LC(5)   #00ABD                           * 80C13
        GOLONG  SUB_815D3.loop1                  * 80C1A
SUB_80C13.L1:
        D0=(5)  SUB_817E9.L28                    * 80C20
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
        GOYES   SUB_80C13.L2                     * 80C53
        GOTO    SUB_80ABA.L11                    * 80C55
SUB_80C13.L2:
        C=0     W                                * 80C59
        P=      0                                * 80C5C
        LC(8)   #7E900000                        * 80C5E
        A=R3                                     * 80C68
        A=A+C   W                                * 80C6B
        ST=0    15                               * 80C6E
        GOSBVL  SUB_01A33.L2                     * 80C71
        GOSUB   SUB_80ABA.L6                     * 80C78
        GOSUB   SUB_80C13                        * 80C7C
        GOSUB   SUB_80CF0                        * 80C80
        LC(2)   #06                              * 80C84
        A=C     A                                * 80C88
        GOSUB   OUTUART~jump                     * 80C8A
        GONC    SUB_80C13.L3                     * 80C8E
        A=C     A                                * 80C91
        GOTO    SUB_80ABA.L11                    * 80C93
SUB_80C13.L3:
        ST=0    15                               * 80C97
        GOSBVL  SUB_010A9                        * 80C9A
        P=      0                                * 80CA1
        GOSBVL  SUB_02708                        * 80CA3
        GOSUB   SUB_80ABA.L6                     * 80CAA
        ST=1    6                                * 80CAE
        GOSUBL  SUB_80167                        * 80CB1
        ST=0    6                                * 80CB7
        GOLONG  VersionStrings.L1                * 80CBA

* refs (2): 80C31 80C3E
SUB_80CC0:
        B=0     W                                * 80CC0
SUB_80CC0.loop1:
        GOSUB   POPUART~jump                     * 80CC3
        GOC     SUB_80CC0.loop1                  * 80CC7
        ASRC                                     * 80CCA
        B=A     S                                * 80CCD
        BSR     W                                * 80CD0
        P=P+1                                    * 80CD3
        GONC    SUB_80CC0.loop1                  * 80CD5
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
        D0=(5)  SUB_817E9.L16                    * 80D39
        GOSUB   SUB_80D29                        * 80D40
        LC(5)   #00E52                           * 80D44
        R2=C                                     * 80D4B
        LC(1)   #0                               * 80D4E
        GOSUB   SUB_80DED                        * 80D51
        GOSUB   SUB_80DF4                        * 80D55
        GONC    SUB_80D39.L1                     * 80D59
        LC(5)   #00225                           * 80D5C
        R2=C                                     * 80D63
        LC(1)   #6                               * 80D66
        GOSUB   SUB_80DED                        * 80D69
        GOSUB   SUB_80DF4                        * 80D6D
        GONC    SUB_80D39.L1                     * 80D71
        GOLONG  SUB_816E5.L2                     * 80D74
SUB_80D39.L1:
        A=R1                                     * 80D7A
        ABIT=1  5                                * 80D7D
        R1=A                                     * 80D82
        GOLONG  SUB_81736                        * 80D85

* refs (2): 800D1 80278
SUB_80D8B:
        D0=(5)  SUB_817E9.L25                    * 80D8B
        GOSUB   SUB_80D29                        * 80D92
        LC(5)   #00E52                           * 80D96
        R2=C                                     * 80D9D
        LC(1)   #0                               * 80DA0
        GOSUB   SUB_80DED                        * 80DA3
        GOSUB   SUB_80CFD                        * 80DA7
        GOSUB   SUB_80DF4                        * 80DAB
        GONC    SUB_80D8B.L1                     * 80DAF
        LC(5)   #00729                           * 80DB2
        R2=C                                     * 80DB9
        LC(1)   #2                               * 80DBC
        GOSUB   SUB_80DED                        * 80DBF
        GOSUB   SUB_80CFD                        * 80DC3
        GOSUB   SUB_80DF4                        * 80DC7
        GONC    SUB_80D8B.L1                     * 80DCB
        GOSUB   SUB_80D13                        * 80DCE
        GOLONG  SUB_816E5.L2                     * 80DD2
SUB_80D8B.L1:
        GOSUB   SUB_80D13                        * 80DD8
        A=R1                                     * 80DDC
        ABIT=1  9                                * 80DDF
        R1=A                                     * 80DE4
        GOLONG  SUB_81736                        * 80DE7

* refs (10): 80BBC 80CE8 80CF5 80D51 80D69 80DA3 ...
SUB_80DED:
        GOVLNG  SUB_30E82.L1                     * 80DED

* refs (4): 80D55 80D6D 80DAB 80DC7
SUB_80DF4:
        C=0     A                                * 80DF4
        D0=(5)  SUB_817E9.L18                    * 80DF6
        C=DAT0  B                                * 80DFD
        D0=D0+  2                                * 80E00
SUB_80DF4.loop1:
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
        GOC     SUB_80DF4.L3                     * 80E1D
        C=R2                                     * 80E20
SUB_80DF4.loop2:
        C=C-1   A                                * 80E23
        GONC    SUB_80DF4.loop2                  * 80E25
        A=0     A                                * 80E28
        A=DAT0  B                                * 80E2A
        B=A     A                                * 80E2D
        GOSUB   D1=IRAM~jump_5                   * 80E2F
        D1=(4)  #0519                            * 80E33
        A=DAT1  B                                * 80E39
        ?A=0    B                                * 80E3C
        GOYES   SUB_80DF4.L5                     * 80E3F
        LC(2)   #01                              * 80E41
        ?C#A    B                                * 80E45
        GOYES   SUB_80DF4.L6                     * 80E48
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
        GOYES   SUB_80DF4.L4                     * 80E68
        D1=(4)  #0519                            * 80E6A
        C=0     A                                * 80E70
        DAT1=C  B                                * 80E72
        D0=D0+  2                                * 80E75
        C=RSTK                                   * 80E78
        GOTO    SUB_80DF4.loop1                  * 80E7A
SUB_80DF4.L3:
        C=RSTK                                   * 80E7E
        C=A     A                                * 80E80
        D0=C                                     * 80E82
        RTNCC                                    * 80E85
SUB_80DF4.L4:
        C=RSTK                                   * 80E87
        A=A+1   XS                               * 80E89
        ASL     A                                * 80E8C
        ASL     A                                * 80E8E
        A=B     B                                * 80E90
        D0=A                                     * 80E93
        RTNCC                                    * 80E96
SUB_80DF4.L5:
        C=RSTK                                   * 80E98
        D0=(5)  xYCOL.L1+1                       * 80E9A
        RTNCC                                    * 80EA1
SUB_80DF4.L6:
        C=RSTK                                   * 80EA3
        D0=(5)  SUB_2FFD0.L2                     * 80EA5
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
SUB_80EBC.L1:
        D0=(5)  SUB_817E9.L17                    * 80EC3
        GOSUB   SUB_80D29                        * 80ECA
        LC(1)   #6                               * 80ECE
        GOSUB   SUB_80DED                        * 80ED1
        GOSUB   SUB_80EF3                        * 80ED5
        GOC     SUB_80EBC.L2                     * 80ED9
        GOLONG  SUB_816E5.L2                     * 80EDC
SUB_80EBC.L2:
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
        GOSUB   SUB_80ABA.L6                     * 80F05
SUB_80EF3.loop1:
        P=      0                                * 80F09
        LC(5)   #0AA68                           * 80F0B
        R3=C                                     * 80F12
SUB_80EF3.loop2:
        P=      0                                * 80F15
        GOSUB   SUB_81051                        * 80F17
        GOSUB   POPUART~jump                     * 80F1B
        LC(1)   #A                               * 80F1F
        DAT0=C  1                                * 80F22
        GONC    SUB_80EF3.L5                     * 80F26
        GOSUB   D1=IRAM~jump_5                   * 80F29
        D1=(4)  #07F7                            * 80F2D
        C=DAT1  A                                * 80F33
        ?C#0    A                                * 80F36
        GOYES   SUB_80EF3.L3                     * 80F39
        GOSBVL  POPKEY                           * 80F3B
        GOC     SUB_80EF3.L4                     * 80F42
SUB_80EF3.L3:
        D0=(5)  #00001                           * 80F45
        RTNSC                                    * 80F4C
SUB_80EF3.L4:
        A=R3                                     * 80F4E
        A=A-1   A                                * 80F51
        R3=A                                     * 80F53
        GONC    SUB_80EF3.loop2                  * 80F56
        D0=(5)  #00002                           * 80F59
        RTNSC                                    * 80F60
SUB_80EF3.L5:
        LC(2)   #04                              * 80F62
        ?C#A    B                                * 80F66
        GOYES   SUB_80EF3.L6                     * 80F69
        RTNCC                                    * 80F6B
SUB_80EF3.L6:
        GOSUB   OUTUART~jump                     * 80F6D
        GONC    SUB_80EF3.loop1                  * 80F71
        D0=C                                     * 80F74
        RTNSC                                    * 80F77
SUB_80EF3.L7:
        D0=(5)  SUB_817E9.L26                    * 80F79
        GOSUB   SUB_80D29                        * 80F80
        GOSUB   SUB_80FA6                        * 80F84
        GOSUB   SUB_80D13                        * 80F88
        GOC     SUB_80EF3.L8                     * 80F8C
        GOLONG  SUB_816E5.L2                     * 80F8F
SUB_80EF3.L8:
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
        GOSUB   SUB_80ABA.L6                     * 80FC5
        P=      0                                * 80FC9
        LC(5)   #85225                           * 80FCB
        GOSUB   SUB_80EBC                        * 80FD2
        D1=(4)  #0519                            * 80FD6
        A=0     A                                * 80FDC
SUB_80FA6.loop1:
        A=DAT1  B                                * 80FDE
        ?A#0    B                                * 80FE1
        GOYES   SUB_80FA6.loop2                  * 80FE4
        C=C-1   A                                * 80FE6
        GONC    SUB_80FA6.loop1                  * 80FE8
        D0=(5)  #00002                           * 80FEB
        RTNSC                                    * 80FF2
SUB_80FA6.loop2:
        B=A     A                                * 80FF4
        LC(5)   #00656                           * 80FF6
SUB_80FA6.loop3:
        A=DAT1  B                                * 80FFD
        ?A#B    B                                * 81000
        GOYES   SUB_80FA6.loop2                  * 81003
        C=C-1   A                                * 81005
        GONC    SUB_80FA6.loop3                  * 81007
        GOSUB   SUB_81051                        * 8100A
SUB_80FA6.loop4:
        GOSUB   D1=IRAM~jump_5                   * 8100E
        D1=(4)  #07F7                            * 81012
        C=DAT1  A                                * 81018
        ?C#0    A                                * 8101B
        GOYES   SUB_80FA6.L5                     * 8101E
        GOSBVL  POPKEY                           * 81020
        GOC     SUB_80FA6.L6                     * 81027
SUB_80FA6.L5:
        D0=(5)  #00001                           * 8102A
        RTNSC                                    * 81031
SUB_80FA6.L6:
        GOSUB   POPUART~jump                     * 81033
        GONC    SUB_80FA6.L7                     * 81037
        GOTO    SUB_80FA6                        * 8103A
SUB_80FA6.L7:
        GOSUB   OUTUART~jump                     * 8103E
        GONC    SUB_80FA6.loop4                  * 81042
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
POPUART~jump.L1:
        GOSUBL  SUB_802D2                        * 8107D
        GOSUBL  ClrScrMn~jump                    * 81083
        D0=(5)  SUB_817E9.L22                    * 81089
        GOSUBL  SUB_8165A                        * 81090
        ST=0    15                               * 81096
        GOSBVL  SUB_00735                        * 81099
        GOSUBL  SUB_81374                        * 810A0
        GOSBVL  SUB_00735                        * 810A6
        B=C     A                                * 810AD
        LC(8)   #30303030                        * 810AF
        P=      14                               * 810B9
POPUART~jump.loop2:
        ?B=0    XS                               * 810BB
        GOYES   POPUART~jump.L3                  * 810BE
        P=P+1                                    * 810C0
        P=P+1                                    * 810C2
        B=B+B   XS                               * 810C4
        GONC    POPUART~jump.loop2               * 810C7
        C=C+1   P                                * 810CA
        GONC    POPUART~jump.loop2               * 810CD
POPUART~jump.L3:
        P=      0                                * 810D0
        GOSUB   SUB_80EBC                        * 810D2
        D1=(4)  #009C                            * 810D6
        DAT1=C  8                                * 810DC
        GOLONG  SUB_81736.L2                     * 810E0

* refs (2): 800F2 80264
SUB_810E6:
        GOSUBL  SUB_802D2                        * 810E6
        GOSUBL  ClrScrMn~jump                    * 810EC
        D0=(5)  SUB_817E9.L23                    * 810F2
        GOSUBL  SUB_8165A                        * 810F9
        ST=0    15                               * 810FF
        GOSBVL  SUB_00735                        * 81102
        A=C     A                                * 81109
        LC(3)   #A00                             * 8110B
        A=A&C   XS                               * 81110
        ?C=A    XS                               * 81114
        GOYES   SUB_810E6.L1                     * 81117
        D0=(5)  #00002                           * 81119
        GOTO    SUB_810E6.L3                     * 81120
SUB_810E6.L1:
        GOSUB   SUB_812AB                        * 81124
        B=C     A                                * 81128
        GOSBVL  SUB_01DA1                        * 8112A
        GONC    SUB_810E6.L2                     * 81131
        D0=(5)  #00001                           * 81134
        GOTO    SUB_810E6.L3                     * 8113B
SUB_810E6.L2:
        GOSUB   SUB_8148B                        * 8113F
        GOSUB   SUB_81211                        * 81143
        GOC     SUB_810E6.L3                     * 81147
        GOSUB   SUB_8120A                        * 8114A
        GOSUBL  SUB_816E5.L2                     * 8114E
        GOTO    SUB_810E6.L4                     * 81154
SUB_810E6.L3:
        GOSUB   SUB_8120A                        * 81158
        GOSUBL  SUB_81736                        * 8115C
        C=R1.F  A                                * 81162
        CBIT=1  7                                * 81168
        R1=C.F  A                                * 8116D
SUB_810E6.L4:
        D0=(5)  SUB_817E9.L24                    * 81173
        GOSUBL  SUB_8165A                        * 8117A
        ST=0    15                               * 81180
        GOSBVL  SUB_00735                        * 81183
        A=C     A                                * 8118A
        LC(3)   #500                             * 8118C
        A=A&C   XS                               * 81191
        ?C=A    XS                               * 81195
        GOYES   SUB_810E6.L5                     * 81198
        D0=(5)  #00002                           * 8119A
        GOTO    SUB_810E6.L7                     * 811A1
SUB_810E6.L5:
        GOSUB   SUB_812FA                        * 811A5
        LC(5)   SUB_81BA2.L4                     * 811A9
        D0=C                                     * 811B0
        A=C     A                                * 811B3
        LC(5)   SUB_817E9.L29                    * 811B5
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
SUB_810E6.L6:
        GOSUB   SUB_8120A                        * 811E3
        GOLONG  SUB_816E5.L2                     * 811E7
SUB_810E6.L7:
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
        GOC     SUB_81211.L4                     * 81231
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
SUB_81211.loop1:
        GOSUBL  SUB_806DE                        * 81254
        GOC     SUB_81211.L3                     * 8125A
        B=B-1   A                                * 8125D
        GONC    SUB_81211.loop1                  * 8125F
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
        GOYES   SUB_81211.L2                     * 8128A
        RTNCC                                    * 8128C
SUB_81211.L2:
        D0=(5)  #00000                           * 8128E
        RTNSC                                    * 81295
SUB_81211.L3:
        C=RSTK                                   * 81297
        R1=C.F  A                                * 81299
SUB_81211.L4:
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
        GOSUB   SUB_8155D.loop1                  * 813C2
        GOLONG  SUB_802D2                        * 813C6

* refs (1): 8122D
SUB_813CC:
        P=      0                                * 813CC
        LC(5)   #C0000                           * 813CE
        R3=C                                     * 813D5
        C=0     W                                * 813D8
        C=C+1   A                                * 813DB
        R2=C                                     * 813DD
SUB_813CC.loop1:
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
        GOYES   SUB_813CC.L3                     * 8142A
        C=R3                                     * 8142C
        A=R2                                     * 8142F
        A=A+C   A                                * 81432
        D1=A                                     * 81434
        A=DAT1  1                                * 81437
        LC(1)   #2                               * 8143B
        ?C#A    P                                * 8143E
        GOYES   SUB_813CC.L3                     * 81441
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
        GOC     SUB_813CC.L2                     * 8146A
        C=R3                                     * 8146D
        A=A+C   A                                * 81470
        GOC     SUB_813CC.L2                     * 81472
        C=R0                                     * 81475
        ?C<=A   A                                * 81478
        GOYES   SUB_813CC.L2                     * 8147B
        GOTO    SUB_813CC.loop1                  * 8147D
SUB_813CC.L2:
        RTNCC                                    * 81481
SUB_813CC.L3:
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
        GOSUB   SUB_815FE.L1                     * 814A7
        C=RSTK                                   * 814AB
        D0=C                                     * 814AD
        RTN                                      * 814B0
        GOSBVL  KeyInBuff?                       * 814B2
        GONC    SUB_8148B.L1                     * 814B9
        RTNCC                                    * 814BC
SUB_8148B.L1:
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
SUB_814E8.loop1:
        C=DAT0  1                                * 814F0
        CBIT=1  1                                * 814F4
        DAT0=C  1                                * 814F9
        AD0EX                                    * 814FD
        A=A+B   A                                * 81500
        D0=A                                     * 81502
        D=D-1   A                                * 81505
        GONC    SUB_814E8.loop1                  * 81507
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
SUB_81529.loop1:
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
        GONC    SUB_81529.loop1                  * 81558
        RTNCC                                    * 8155B

* refs (11): 8009D 800A9 800B5 800C1 800D7 800E7 ...
SUB_8155D:
        ?ST=1   6                                * 8155D
        GOYES   SUB_8155D.L3                     * 81560
SUB_8155D.loop1:
        GOSBVL  SUB_00E0B                        * 81562
        GONC    SUB_8155D.loop1                  * 81569
SUB_8155D.loop2:
        LC(5)   dup2;idem(nm,bk)?.L10            * 8156C
        GOTO    SUB_815D3.loop1                  * 81573
SUB_8155D.L3:
        GOSBVL  POPKEY                           * 81577
        GOC     SUB_8155D.loop2                  * 8157E
        RSTK=C                                   * 81581
        GOSUB   Flush~jump                       * 81583
        C=R1                                     * 81587
        CBIT=1  3                                * 8158A
        R1=C.F  A                                * 8158F
        LC(2)   #F4                              * 81595
        GOSUBL  SUB_802D2.L1                     * 81599
        GOSUBL  ClrScrMn~jump                    * 8159F
        D0=(5)  SUB_817E9.L10                    * 815A5
        GOSUBL  SUB_815FE                        * 815AC
        C=RSTK                                   * 815B2
        D0=C                                     * 815B4
        ST=0    6                                * 815B7
        GOSUBL  SUB_81736                        * 815BA
        GOLONG  VersionStrings.loop2             * 815C0

* refs (1): 80B80
SUB_815C6:
        P=      0                                * 815C6
        LC(5)   #0479A                           * 815C8
        GOTO    SUB_815D3.loop1                  * 815CF

* refs (3): 8010C 80B39 81D16
SUB_815D3:
        P=      0                                * 815D3
        LC(5)   #59808                           * 815D5
SUB_815D3.loop1:
        C=C-1   A                                * 815DC
        GONC    SUB_815D3.loop1                  * 815DE
        RTNCC                                    * 815E1
        GOSUB   SUB_8165A                        * 815E3
SUB_815D3.L2:
        GOSBVL  D0->Row1                         * 815E7
        LC(5)   #00110                           * 815EE
        A=A+C   A                                * 815F5
        D0=A                                     * 815F7
        GOTO    SUB_815FE.L2                     * 815FA

* refs (9): 8019B 80336 803A0 804CD 80938 809CB ...
SUB_815FE:
        GOSUB   SUB_8165A                        * 815FE
SUB_815FE.L1:
        GOSBVL  D0->Row1                         * 81602
SUB_815FE.L2:
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
        GOTO    SUB_81662.L2                     * 81683
SUB_81662.loop1:
        C=DAT0  B                                * 81687
        DAT1=C  B                                * 8168A
        D0=D0+  2                                * 8168D
        D1=D1+  2                                * 81690
SUB_81662.L2:
        A=A-1   A                                * 81693
        GONC    SUB_81662.loop1                  * 81695
        LC(2)   #20                              * 81698
        GOTO    SUB_81662.L4                     * 8169C
SUB_81662.loop3:
        DAT1=C  B                                * 816A0
        D1=D1+  2                                * 816A3
SUB_81662.L4:
        B=B-1   A                                * 816A6
        GONC    SUB_81662.loop3                  * 816A8
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
        GOYES   SUB_816E5.L1                     * 816F2
        C=C+A   A                                * 816F4
SUB_816E5.L1:
        DAT1=C  B                                * 816F6
        D1=D1+  2                                * 816F9
        RTN                                      * 816FC
SUB_816E5.L2:
        D0=(5)  SUB_817E9.L13                    * 816FE
        GOTO    SUB_816E5.L4                     * 81705
SUB_816E5.L3:
        D0=(5)  SUB_817E9.L15                    * 81709
SUB_816E5.L4:
        C=DAT0  B                                * 81710
        D0=D0+  2                                * 81713
        C=C+C   A                                * 81716
        C=C-1   A                                * 81718
        P=C     0                                * 8171A
        GOSUBL  D1=IRAM~jump_5                   * 8171E
        D1=(4)  #009C                            * 81724
        C=DAT0  WP                               * 8172A
        DAT1=C  WP                               * 8172E
        GOTO    SUB_81736.L2                     * 81732

* refs (12): 80547 806C5 808F4 80AB4 80BC5 80D85 ...
* Probably: self-test: report a failure (message at D0, the hex value at RAM #0091) on the display and the serial port
SUB_81736:
        GOSUB   SUB_816AD                        * 81736
        GOSBVL  SUB_012F9                        * 8173A
        GONC    SUB_81736.L1                     * 81741
        C=0     W                                * 81744
SUB_81736.L1:
        GOSUBL  SUB_80EBC                        * 81747
        D1=(4)  #0085                            * 8174D
        A=DAT1  13                               * 81753
        P=      12                               * 81757
        A=A+1   WP                               * 81759
        P=      0                                * 8175C
        GONC    SUB_81736.L2                     * 8175E
        DAT1=C  13                               * 81761
SUB_81736.L2:
        GOSUB   SUB_815FE.L1                     * 81765

* refs (1): 80202
SUB_81769:
        P=      0                                * 81769
        C=0     A                                * 8176B
        LC(2)   #16                              * 8176D
        GOSUBL  SUB_80EBC                        * 81771
        D1=(4)  #0092                            * 81777
        GOSUB   SUB_817E9                        * 8177D
        D1=(5)  SUB_81769.L2                     * 81781
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
SUB_81769.loop1:
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
        GONC    SUB_81769.loop1                  * 817CC
        LC(2)   #0D                              * 817CF
        A=C     A                                * 817D3
        GOSUB   OUTUART~jump                     * 817D5
        LC(2)   #0A                              * 817D9
        A=C     A                                * 817DD
        GOSUB   OUTUART~jump                     * 817DF
        GOTO    SUB_817E9.L3                     * 817E3
SUB_81769.L2:
        NIBHEX  A0                               * 817E7  .

* refs (2): 8177D 8178C
SUB_817E9:
        GOTO    SUB_817E9.L2                     * 817E9
SUB_817E9.loop1:
        RSTK=C                                   * 817ED
        A=DAT1  B                                * 817EF
        D1=D1+  2                                * 817F2
        ST=0    15                               * 817F5
        GOSBVL  SUB_65863.L2                     * 817F8
        GOSBVL  AllowIntr                        * 817FF
        C=RSTK                                   * 81806
SUB_817E9.L2:
        C=C-1   A                                * 81808
        GONC    SUB_817E9.loop1                  * 8180A
SUB_817E9.L3:
        D0=(5)  ANNCTRL                          * 8180D
        C=DAT0  B                                * 81814
        CBIT=0  5                                * 81817
        DAT0=C  B                                * 8181C
        P=      0                                * 8181F
        RTNCC                                    * 81821

* Self-test messages: counted strings (used as SUB_817E9.L4+n)
SUB_817E9.L4:
        CON(2)  4                                * 81823  entry 0
        NIBASC  "SPD "                           * 81825
SUB_817E9.L5:
        CON(2)  4                                * 8182D  entry 1
        NIBASC  "DISP"                           * 8182F
SUB_817E9.L6:
        CON(2)  4                                * 81837  entry 2
        NIBASC  "IROM"                           * 81839
SUB_817E9.L7:
        CON(2)  4                                * 81841  entry 3
        NIBASC  "IRAM"                           * 81843
SUB_817E9.L8:
        CON(2)  4                                * 8184B  entry 4
        NIBASC  "KBD1"                           * 8184D
SUB_817E9.L9:
        CON(2)  4                                * 81855  entry 5
        NIBASC  "KBD2"                           * 81857
SUB_817E9.L10:
        CON(2)  3                                * 8185F  entry 6
        NIBASC  "KBD"                            * 81861
SUB_817E9.L11:
        CON(2)  14                               * 81867  entry 7
        NIBASC  "ESD 210V  210V"                 * 81869
SUB_817E9.L12:
        CON(2)  3                                * 81885  entry 8
        NIBASC  "ESD"                            * 81887
SUB_817E9.L13:
        CON(2)  2                                * 8188D  entry 9
        NIBASC  "OK"                             * 8188F
SUB_817E9.L14:
        CON(2)  6                                * 81893  entry 10
        NIBASC  "OK-48 "                         * 81895
SUB_817E9.L15:
        CON(2)  4                                * 818A1  entry 11
        NIBASC  "FAIL"                           * 818A3
SUB_817E9.L16:
        CON(2)  4                                * 818AB  entry 12
        NIBASC  "U_LB"                           * 818AD
SUB_817E9.L17:
        CON(2)  4                                * 818B5  entry 13
        NIBASC  "UART"                           * 818B7
SUB_817E9.L18:
        CON(2)  10                               * 818BF  entry 14
        NIBASC  "U_LB XMIT\04"                   * 818C1
SUB_817E9.L19:
        CON(2)  9                                * 818D5  entry 15
        NIBASC  "Time Init"                      * 818D7
SUB_817E9.L20:
        CON(2)  6                                * 818E9  entry 16
        NIBASC  "Start:"                         * 818EB
SUB_817E9.L21:
        CON(2)  6                                * 818F7  entry 17
        NIBASC  "Fail :"                         * 818F9
SUB_817E9.L22:
        CON(2)  4                                * 81905  entry 18
        NIBASC  "PORT"                           * 81907
SUB_817E9.L23:
        CON(2)  4                                * 8190F  entry 19
        NIBASC  "RAM1"                           * 81911
SUB_817E9.L24:
        CON(2)  4                                * 81919  entry 20
        NIBASC  "RAM2"                           * 8191B
SUB_817E9.L25:
        CON(2)  4                                * 81923  entry 21
        NIBASC  "IRLB"                           * 81925
SUB_817E9.L26:
        CON(2)  4                                * 8192D  entry 22
        NIBASC  "IRIO"                           * 8192F
SUB_817E9.L27:
        CON(2)  4                                * 81937  entry 23
        NIBASC  "SEND"                           * 81939
SUB_817E9.L28:
        CON(2)  4                                * 81941  entry 24
        NIBASC  "RECV"                           * 81943
        CON(2)  14                               * 8194B  entry 25
        NIBASC  "Version HP48-R"                 * 8194D
        CON(2)  17                               * 81969  entry 26
        NIBASC  "Copyright HP 1989"              * 8196B
SUB_817E9.L29:
        BSS     3                                * 8198D  zeros
        GOSUB   SUB_81B6B                        * 81990
        LC(5)   #C0000                           * 81994
        B=C     A                                * 8199B
        GOSBVL  SUB_01DA1                        * 8199D
        GONC    SUB_817E9.L30                    * 819A4
        D0=(5)  #00001                           * 819A7
        GOTO    SUB_817E9.L31                    * 819AE
SUB_817E9.L30:
        B=C     A                                * 819B2
        GOSUB   SUB_81B3D                        * 819B4
        C=B     A                                * 819B8
        GOSBVL  SUB_8148B                        * 819BA
        GOSUB   SUB_81B6B                        * 819C1
        GOSUB   SUB_819E2                        * 819C5
        GOC     SUB_817E9.L31                    * 819C9
        GOSUB   SUB_81B3D                        * 819CC
        GOVLNG  SUB_810E6.L6                     * 819D0
SUB_817E9.L31:
        GOSUB   SUB_81B3D                        * 819D7
        GOVLNG  SUB_810E6.L7                     * 819DB

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
        GOC     SUB_819E2.L4                     * 81A03
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
SUB_819E2.loop1:
        GOSUBL  SUB_81BA2                        * 81A26
        GOC     SUB_819E2.L3                     * 81A2C
        B=B-1   A                                * 81A2F
        GONC    SUB_819E2.loop1                  * 81A31
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
        GOYES   SUB_819E2.L2                     * 81A5D
        RTNCC                                    * 81A5F
SUB_819E2.L2:
        D0=(5)  #00000                           * 81A61
        RTNSC                                    * 81A68
SUB_819E2.L3:
        C=RSTK                                   * 81A6A
        R1=C.F  A                                * 81A6C
SUB_819E2.L4:
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
SUB_81A7E.loop1:
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
        GOYES   SUB_81A7E.L3                     * 81ADC
        C=R3                                     * 81ADE
        A=R2                                     * 81AE1
        A=A+C   A                                * 81AE4
        D1=A                                     * 81AE6
        A=DAT1  1                                * 81AE9
        LC(1)   #2                               * 81AED
        ?C#A    P                                * 81AF0
        GOYES   SUB_81A7E.L3                     * 81AF3
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
        GOC     SUB_81A7E.L2                     * 81B1C
        C=R3                                     * 81B1F
        A=A+C   A                                * 81B22
        GOC     SUB_81A7E.L2                     * 81B24
        C=R0                                     * 81B27
        ?C<=A   A                                * 81B2A
        GOYES   SUB_81A7E.L2                     * 81B2D
        GOTO    SUB_81A7E.loop1                  * 81B2F
SUB_81A7E.L2:
        RTNCC                                    * 81B33
SUB_81A7E.L3:
        AD1EX                                    * 81B35
        D0=A                                     * 81B38
        RTNSC                                    * 81B3B

* refs (3): 819B4 819CC 819D7
SUB_81B3D:
        D1=(5)  #90000                           * 81B3D
        C=DAT1  B                                * 81B44
        D1=(5)  OBJ_3FFCA.L1+37                  * 81B47
        D1=(4)  #069A                            * 81B4E
        C=DAT1  B                                * 81B54
        CBIT=1  7                                * 81B57
        DAT1=C  B                                * 81B5C
        D1=(5)  LINECOUNT                        * 81B5F
        DAT1=C  B                                * 81B66
        RTN                                      * 81B69

* refs (2): 81990 819C1
SUB_81B6B:
        D1=(5)  OBJ_3FFCA.L1+37                  * 81B6B
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
SUB_81BA2.loop1:
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
        GOYES   SUB_81BA2.L2                     * 81C17
        D0=D0+  15                               * 81C19
        C=DAT0  15                               * 81C1C
        ?C#A    WP                               * 81C20
        GOYES   SUB_81BA2.L2                     * 81C23
        D0=D0+  15                               * 81C25
        C=DAT0  15                               * 81C28
        ?C#A    WP                               * 81C2C
        GOYES   SUB_81BA2.L2                     * 81C2F
        D0=D0+  15                               * 81C31
        C=DAT0  15                               * 81C34
        ?C#A    WP                               * 81C38
        GOYES   SUB_81BA2.L2                     * 81C3B
        D0=D0+  15                               * 81C3D
        P=      3                                * 81C40
        C=DAT0  4                                * 81C42
        ?C#A    WP                               * 81C46
        GOYES   SUB_81BA2.L2                     * 81C49
        ASL     W                                * 81C4B
        C=A     S                                * 81C4E
        P=C     15                               * 81C51
        C=P     0                                * 81C55
        P=      0                                * 81C59
        A=C     P                                * 81C5B
        C=D     A                                * 81C5E
        B=B-1   S                                * 81C60
        GOC     SUB_81BA2.L3                     * 81C63
        GOTO    SUB_81BA2.loop1                  * 81C66
SUB_81BA2.L2:
        C=RSTK                                   * 81C6A
        DCEX    A                                * 81C6C
        BUSCC                                    * 81C6E
        P=      0                                * 81C71
        GOSUB   SUB_81BA2.L3                     * 81C73
        RSTK=C                                   * 81C77
        RTNSC                                    * 81C79
SUB_81BA2.L3:
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
SUB_81BA2.L4:
        GOSUB   SUB_81E27                        * 81CAD
        LC(5)   #0000F                           * 81CB1
        GOTO    SUB_81DE7                        * 81CB8
SUB_81BA2.L5:
        GOSBVL  ClrScrMn                         * 81CBC
        LC(5)   #0000D                           * 81CC3
        GOSUB   SUB_81DE7                        * 81CCA
        D1=(5)  ANNCTRL                          * 81CCE
        C=DAT1  B                                * 81CD5
        CBIT=1  4                                * 81CD8
        DAT1=C  B                                * 81CDD
        RTN                                      * 81CE0
SUB_81BA2.L6:
        GOSUB   SUB_81E27                        * 81CE2
        LC(5)   #00007                           * 81CE6
        GOSUB   SUB_81DE7                        * 81CED
        LC(5)   #00010                           * 81CF1
        GOTO    SUB_81BA2.L8                     * 81CF8
SUB_81BA2.L7:
        GOSUB   SUB_81E27                        * 81CFC
        LC(5)   #00007                           * 81D00
        GOSUB   SUB_81DE7                        * 81D07
        LC(5)   #00008                           * 81D0B
SUB_81BA2.L8:
        GOSUB   SUB_81E00                        * 81D12
        GOSBVL  SUB_815D3                        * 81D16
        GOVLNG  ClrScrMn                         * 81D1D
SUB_81BA2.L9:
        GOSUB   SUB_81E19                        * 81D24
        LC(5)   #0000E                           * 81D28
        GOSUB   SUB_81DE7                        * 81D2F
SUB_81BA2.L10:
        P=      0                                * 81D33
        SETHEX                                   * 81D35
        GOSBVL  ClrMenu                          * 81D37
        D1=(5)  SUB_81D6E.L2                     * 81D3E
        GOSBVL  D0->Sft1                         * 81D45
        AD0EX                                    * 81D4C
        C=0     A                                * 81D4F
        GOSUB   SUB_81D6E                        * 81D51
        D1=(5)  SUB_81D6E.L3                     * 81D55
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
SUB_81D6E.loop1:
        A=DAT1  6                                * 81D79
        DAT0=A  6                                * 81D7D
        AD0EX                                    * 81D81
        A=A+C   A                                * 81D84
        D0=A                                     * 81D86
        D1=D1+  6                                * 81D89
        P=P+1                                    * 81D8C
        GONC    SUB_81D6E.loop1                  * 81D8E
        RTN                                      * 81D91

SUB_81D6E.L2:
        CON(5)  ROMP_0E2_069.L1+3                * 81D93  address (the code jumps or points through it)
        NIBHEX  1                                * 81D98

        CON(5)  ROMP_0E2_022.L1+81               * 81D99  address (the code jumps or points through it)
        NIBHEX  1                                * 81D9E

        CON(5)  ROMP_0E2_061.L1+36               * 81D9F  address (the code jumps or points through it)
        NIBHEX  1                                * 81DA4

        CON(5)  ROMP_0E2_050.L1+209              * 81DA5  address (the code jumps or points through it)
        NIBHEX  1                                * 81DAA

        CON(5)  ROMP_0E2_03C.L1+366              * 81DAB  address (the code jumps or points through it)
        NIBHEX  1                                * 81DB0

        CON(5)  ROMP_0E2_046.L1+29               * 81DB1  address (the code jumps or points through it)
        NIBHEX  1                                * 81DB6

        CON(5)  ROMP_0E2_069.L1+3                * 81DB7  address (the code jumps or points through it)
        NIBHEX  1                                * 81DBC

SUB_81D6E.L3:
        CON(5)  ROMP_0E2_069.L1                  * 81DBD  address (the code jumps or points through it)
        NIBHEX  3                                * 81DC2

        CON(5)  ROMP_0B9_000.L1+17               * 81DC3  address (the code jumps or points through it)
        NIBHEX  3                                * 81DC8

        CON(5)  ROMP_0E2_013.L3+2                * 81DC9  address (the code jumps or points through it)
        NIBHEX  3                                * 81DCE

        CON(5)  ROMP_0E2_013.L1+9                * 81DCF  address (the code jumps or points through it)
        NIBHEX  3                                * 81DD4

        CON(5)  ROMP_0E2_013.L2+9                * 81DD5  address (the code jumps or points through it)
        NIBHEX  3                                * 81DDA

        CON(5)  ROMP_0B9_000.L1+17               * 81DDB  address (the code jumps or points through it)
        NIBHEX  3                                * 81DE0

        CON(5)  ROMP_0E2_069.L1                  * 81DE1  address (the code jumps or points through it)
        NIBHEX  3                                * 81DE6

* refs (5): 81CB8 81CCA 81CED 81D07 81D2F
SUB_81DE7:
        D0=(5)  MsgTab(0).L1                     * 81DE7
        GOSUB   SUB_81E4C                        * 81DEE
        GOSBVL  SUB_81662                        * 81DF2
        GOVLNG  SUB_815FE.L1                     * 81DF9

* refs (1): 81D12
SUB_81E00:
        D0=(5)  MsgTab(0).L1                     * 81E00
        GOSUB   SUB_81E4C                        * 81E07
        GOSBVL  SUB_81662                        * 81E0B
        GOVLNG  SUB_815D3.L2                     * 81E12

* refs (1): 81D24
SUB_81E19:
        GOSBVL  Flush                            * 81E19
        GOSBVL  SUB_00735.L2                     * 81E20

* refs (3): 81CAD 81CE2 81CFC
SUB_81E27:
        GOSBVL  ClrScrMn                         * 81E27
        C=0     A                                * 81E2E
        GOSBVL  SUB_804B6                        * 81E30
        GOSBVL  ScrOn+                           * 81E37
        GOSBVL  SUB_00E0B                        * 81E3E
        GOVLNG  SUB_80215.L2                     * 81E45

* refs (2): 81DEE 81E07
SUB_81E4C:
        SETHEX                                   * 81E4C
        C=C-1   A                                * 81E4E
SUB_81E4C.loop1:
        A=DAT0  A                                * 81E50
        A=A-CON A,5                              * 81E53
        D0=D0+  5                                * 81E59
        C=C-1   A                                * 81E5C
        GOC     SUB_81E4C.L2                     * 81E5E
        CD0EX                                    * 81E61
        C=C+A   A                                * 81E64
        CD0EX                                    * 81E66
        GOTO    SUB_81E4C.loop1                  * 81E69
SUB_81E4C.L2:
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
        GOVLNG  KeyTestDiag.loop3                * 81EC8
        FILLTO  #82000                           * 81ECF  305 zero nibbles: the next entry stays at #82000

        LENGTH                                   * 82000  library object without its prolog (its place is the end of the link table before): length, to #86FDD
        CON(2)  0                                * 82005  no title
