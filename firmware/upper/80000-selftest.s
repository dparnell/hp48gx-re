* HP 48GX ROM revision R, #80000-#82006: Self-test (ON+D): a menu of hardware tests with their messages, run before RAM is set up; the screens of memory recovery
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ShowError TestPause ShowOK SetBaud SetAnnun MsgToBuffer BeepStart ShowMsg TestIntrOn ProbeRead D1=IRAMHigh TestTitle

        ORG     #80000

* refs (1): 80CBA
* Self-test entry (ON+D). R1 collects a bit for each failure: 1 IROM, 2 IRAM, 3 KBD, 4 ESD, 5 U_LB, 6 UART, 7 RAM1, 8 RAM2, 9 IRLB, 10 IRIO. TestSummary shows it at the end
SelfTest:
        C=0     A                                * 80000
        R1=C                                     * 80002
        GOSBVL  ClrScrMn                         * 80005
        GOSUBL  DrawGrid                         * 8000C
        GOSBVL  D0->Sft1.L1                      * 80012
        GOTO    SelfTestWait                     * 80019

* refs (4): 80060 80282 80287 815C0
* Back to the menu after a test: annunciators off and the grid redrawn
SelfTestMenu:
        C=0     A                                * 8001D
        GOSUBL  SetAnnun                         * 8001F
        GOSUBL  DrawGridMid                      * 80025

* refs (2): 80019 80118
* Beeps, then waits for a key: ST6 set means continuous mode, which goes to SelfTestAll instead
SelfTestWait:
        GOSUBL  BeepMenu                         * 8002B
        GOSBVL  ClrKeyState                      * 80031
        GOSUBL  Flush~jump                       * 80038
        ?ST=1   6                                * 8003E
        GOYES   SelfTestAll                      * 80041
        RSI                                      * 80043
* Waits for a key. Key numbers 1 to #1C pick an entry of TestTable, anything else redraws the menu
SelfTestWait.loop1:
        GOSBVL  POPKEY                           * 80048
        GOC     SelfTestWait.loop1               * 8004F
        B=C     A                                * 80052
        GOSUBL  ClrScrMn~jump                    * 80054
        C=0     A                                * 8005A
        LC(2)   #1C                              * 8005C
        ?B>C    A                                * 80060
        GOYES   SelfTestMenu                     * 80063
        B=B-1   A                                * 80065
        A=B     A                                * 80067
        LC(5)   TestTable                        * 80069
        GOSUB   Index5                           * 80070
        LC(5)   SelfTestMenu                     * 80074
        RSTK=C                                   * 8007B
        PC=(A)                                   * 8007D

* refs (1): 80070
* A.A = n C.A = base -> A.A = base+5*n
Index5:
        RSTK=C                                   * 80081
        C=A     A                                * 80083
        A=A+A   A                                * 80085
        A=A+A   A                                * 80087
        A=A+C   A                                * 80089
        C=RSTK                                   * 8008B
        A=A+C   A                                * 8008D
        RTN                                      * 8008F

* refs (1): 8003E
* Runs the tests in turn: speed, display, ROM, RAM, then the serial and card tests that ST7, ST8 and ST10 pick, then the summary
SelfTestAll:
        GOSUBL  ClrScrMn~jump                    * 80091
        GOSUBL  TestSpeed                        * 80097
        GOSUBL  TestPause                        * 8009D
        GOSUBL  TestDisplay                      * 800A3
        GOSUBL  TestPause                        * 800A9
        GOSUBL  TestIROM                         * 800AF
        GOSUBL  TestPause                        * 800B5
        GOSUBL  TestIRAM                         * 800BB
        GOSUBL  TestPause                        * 800C1
        ?ST=0   10                               * 800C7
        GOYES   SelfTestAll.L2                   * 800CA
        ?ST=0   7                                * 800CC
        GOYES   SelfTestAll.L1                   * 800CF
        GOSUBL  TestIRLB                         * 800D1
        GOSUBL  TestPause                        * 800D7
        GOTO    SelfTestAll.L2                   * 800DD
SelfTestAll.L1:
        GOSUBL  TestULB                          * 800E1
        GOSUBL  TestPause                        * 800E7
SelfTestAll.L2:
        ?ST=0   8                                * 800ED
        GOYES   SelfTestAll.L3                   * 800F0
        GOSUBL  TestRAM                          * 800F2
        GOSUBL  TestPause                        * 800F8
SelfTestAll.L3:
        GOSUB   BeepDone                         * 800FE
        GOSUB   TestSummary                      * 80102
        GOSUBL  TestPause                        * 80106
        GOSUBL  DelayLong                        * 8010C
        GOSUBL  ClrScrMn~jump                    * 80112
        GOTO    SelfTestWait                     * 80118

* refs (1): 802AF
* Picks no extra tests for SelfTestAll: ST8 and ST10 clear
TestSetNone:
        ST=0    8                                * 8011C
        ST=0    10                               * 8011F
        GOTO    TestSetEnd                       * 80122

* refs (1): 8029B
* Picks the UART loop-back test
TestSetULB:
        ST=0    8                                * 80126
        ST=1    10                               * 80129
        ST=0    7                                * 8012C
        GOTO    TestSetEnd                       * 8012F

* refs (1): 802A5
* Picks the IR loop-back test
TestSetIRLB:
        ST=0    8                                * 80133
        ST=1    10                               * 80136
        ST=1    7                                * 80139
        GOTO    TestSetEnd                       * 8013C

* refs (1): 80296
* Picks the card RAM test
TestSetRAM:
        ST=1    8                                * 80140
        ST=0    10                               * 80143
        GOTO    TestSetEnd                       * 80146

* refs (1): 802A0
* Picks the UART loop-back test and the card RAM test
TestSetULBRAM:
        ST=1    8                                * 8014A
        ST=1    10                               * 8014D
        ST=0    7                                * 80150
        GOTO    TestSetEnd                       * 80153

* refs (1): 802B4
* Picks the IR loop-back test and the card RAM test
TestSetIRLBRAM:
        ST=1    8                                * 80157
        ST=1    10                               * 8015A
        ST=1    7                                * 8015D

* refs (5): 80122 8012F 8013C 80146 80153
* Ends a TestSet entry: back through CINRTN.L2
TestSetEnd:
        GOVLNG  TestSetEnd~1                     * 80160

* refs (2): 802AA 80CB1
* Keeps the time now at IRAM #78 as the start time, sets the fail time at #85 to all ones, and shows "Time Init"
TestTimeInit:
        GOSBVL  GetTimeNoInt                     * 80167
        GONC    TestTimeInit.L1                  * 8016E
        C=0     W                                * 80171
TestTimeInit.L1:
        GOSUBL  D1=IRAMHigh                      * 80174
        D1=(4)  #0078                            * 8017A
        DAT1=C  13                               * 80180
        C=0     W                                * 80184
        C=-C-1  W                                * 80187
        D1=(4)  #0085                            * 8018A
        DAT1=C  13                               * 80190
        D0=(5)  MsgTimeInit                      * 80194
        GOSUBL  ShowMsg                          * 8019B
        GOTO    TestShowFail.L3                  * 801A1

* refs (1): 8028C
* Shows "Start:" with the time kept at IRAM #78
TestShowStart:
        D0=(5)  MsgStart                         * 801A5
        GOSUBL  MsgToBuffer                      * 801AC
        D1=(4)  #0084                            * 801B2
        GOTO    TestShowFail.L1                  * 801B8

* refs (1): 80291
* Shows "Fail :" with the time kept at IRAM #85
TestShowFail:
        D0=(5)  MsgFail                          * 801BC
        GOSUBL  MsgToBuffer                      * 801C3
        D1=(4)  #0091                            * 801C9
TestShowFail.L1:
        CD1EX                                    * 801CF
        D1=C                                     * 801D2
        D0=C                                     * 801D5
        D0=(4)  #009E                            * 801D8
        P=      15                               * 801DE
        LC(1)   #C                               * 801E0
        P=      0                                * 801E3
TestShowFail.loop2:
        C=DAT1  1                                * 801E5
        GOSUB   Nib>ASCII                        * 801E9
        DAT0=C  B                                * 801ED
        D0=D0+  2                                * 801F0
        D1=D1-  1                                * 801F3
        C=C-1   S                                * 801F6
        GONC    TestShowFail.loop2               * 801F9
        GOSUBL  ShowBuffer                       * 801FC
TestShowFail.L3:
        GOSUBL  PrintLine                        * 80202
        GOSUBL  TestPause                        * 80208
        GOVLNG  ClrScrMn                         * 8020E

* refs (1): 801E9
* C.P = nibble -> C.B = its hex digit in ASCII
Nib>ASCII:
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

* Addresses of the tests, by key number: SPD DISP IROM IRAM KBD1 KBD2 ESD U_LB UART PORT RAM, a delay, SEND RECV IRLB IRIO, two blanks, the time and test-set entries and TestSummary
* Self-test commands by key code - 1 (dispatched by PC=(A) at #8007D)
TestTable:
        CON(5)  TestSpeed                        * 80232  entry 0
        CON(5)  TestDisplay                      * 80237  entry 1
        CON(5)  TestIROM                         * 8023C  entry 2
        CON(5)  TestIRAM                         * 80241  entry 3
        CON(5)  TestKbd1                         * 80246  entry 4
        CON(5)  TestKbd2                         * 8024B  entry 5
        CON(5)  TestESD                          * 80250  entry 6
        CON(5)  TestULB                          * 80255  entry 7
        CON(5)  TestUART                         * 8025A  entry 8
        CON(5)  TestPort                         * 8025F  entry 9
        CON(5)  TestRAM                          * 80264  entry 10
        CON(5)  TestDelay                        * 80269  entry 11
        CON(5)  TestSend                         * 8026E  entry 12
        CON(5)  TestRecv                         * 80273  entry 13
        CON(5)  TestIRLB                         * 80278  entry 14
        CON(5)  TestIRIO                         * 8027D  entry 15
        CON(5)  SelfTestMenu                     * 80282  entry 16
        CON(5)  SelfTestMenu                     * 80287  entry 17
        CON(5)  TestShowStart                    * 8028C  entry 18
        CON(5)  TestShowFail                     * 80291  entry 19
        CON(5)  TestSetRAM                       * 80296  entry 20
        CON(5)  TestSetULB                       * 8029B  entry 21
        CON(5)  TestSetULBRAM                    * 802A0  entry 22
        CON(5)  TestSetIRLB                      * 802A5  entry 23
        CON(5)  TestTimeInit                     * 802AA  entry 24
        CON(5)  TestSetNone                      * 802AF  entry 25
        CON(5)  TestSetIRLBRAM                   * 802B4  entry 26
        CON(5)  TestSummary                      * 802B9  entry 27

* refs (2): 8002B 81E45
* Short beep, tone #E4
BeepMenu:
        P=      0                                * 802BE
        LC(2)   #E4                              * 802C0
        GOTO    BeepStart.L1                     * 802C4

* refs (2): 800FE 809F0
* Short beep, tone #DA
BeepDone:
        P=      0                                * 802C8
        LC(2)   #DA                              * 802CA
        GOTO    BeepStart.L1                     * 802CE

* refs (10): 80329 80389 804C0 8066D 80832 80B2D ...
* Short beep, tone #F4. .L1 beeps the tone in C.B
BeepStart:
        P=      0                                * 802D2
        LC(2)   #F4                              * 802D4
BeepStart.L1:
        GOVLNG  RCKBp                            * 802D8

* refs (2): 80102 802B9
* Shows "OK-48 " with no failures, or "FAIL" with R1 in hex and the annunciators lit
TestSummary:
        GOSUBL  ClrScrMn~jump                    * 802DF
        C=R1                                     * 802E5
        ?C#0    A                                * 802E8
        GOYES   TestSummary.L1                   * 802EB
        D0=(5)  MsgOK48                          * 802ED
        GOSUBL  MsgToBuffer                      * 802F4
        C=0     A                                * 802FA
        GOTO    TestSummary.L2                   * 802FC
TestSummary.L1:
        D0=(5)  MsgFAIL                          * 80300
        GOSUBL  MsgToBuffer                      * 80307
        C=R1                                     * 8030D
        D0=C                                     * 80310
        GOSUBL  PutHex                           * 80313
        LC(2)   #FA                              * 80319
TestSummary.L2:
        GOSUBL  SetAnnun                         * 8031D
        GOLONG  ShowLine                         * 80323

* refs (2): 80097 80232
* SPD: measures the CPU clock and shows it
TestSpeed:
        GOSUBL  BeepStart                        * 80329
        D0=(5)  MsgSPD                           * 8032F
        GOSUBL  ShowMsg                          * 80336
        GOSUB   ClockMeasure                     * 8033C
        ASL     W                                * 80340
        GOSBVL  SUB_657B9                        * 80343
        GOSUBL  D1=IRAMHigh                      * 8034A
        D1=(4)  #009A                            * 80350
        DAT1=C  14                               * 80356
        GOLONG  ShowLine                         * 8035A

* refs (1): 8033C
* -> A = CPU speed, from the clock and the display off, interrupts off
ClockMeasure:
        GOSBVL  DisableIntr                      * 80360
        GOSBVL  DispOff                          * 80367
        GOSBVL  clkspd                           * 8036E
        GOSBVL  SUB_7017C                        * 80375
        GOSBVL  DispOn                           * 8037C
        GOLONG  TestIntrOn                       * 80383

* refs (2): 800A3 80237
* DISP: shows bar patterns and annunciators in turn
TestDisplay:
        GOSUBL  BeepStart                        * 80389
        C=0     A                                * 8038F
        GOSUB   SetAnnun                         * 80391
        GOSUB   ClrScrMn~jump                    * 80395
        D0=(5)  MsgDISP                          * 80399
        GOSUBL  ShowMsg                          * 803A0
        GOSUBL  TestPause                        * 803A6
        LC(16)  #9249249249249249                * 803AC
        B=C     W                                * 803BE
        LC(2)   #12                              * 803C1
        GOSUB   SetAnnun                         * 803C5
        GOSUB   DisplayPatB                      * 803C9
        LC(2)   #A0                              * 803CD
        GOSUB   SetAnnun                         * 803D1
        GOSUB   DisplayPatB                      * 803D5
        LC(2)   #40                              * 803D9
        GOSUB   SetAnnun                         * 803DD
        GOSUB   DisplayPatB                      * 803E1
        LC(2)   #08                              * 803E5
        GOSUB   SetAnnun                         * 803E9
        P=      8                                * 803ED
        GOSUB   DisplayBars                      * 803EF
        LC(2)   #FA                              * 803F3
        GOSUB   SetAnnun                         * 803F7
        P=      4                                * 803FB
        GOSUB   DisplayBars                      * 803FD
        C=0     A                                * 80401
        GOSUB   SetAnnun                         * 80403
        P=      2                                * 80407
        GOSUB   DisplayBars                      * 80409

* refs (14): 80054 80091 80112 802DF 80395 80673 ...
ClrScrMn~jump:
        GOVLNG  ClrScrMn                         * 8040D

* refs (3): 803C9 803D5 803E1
* B = pattern -> : fills the display rows and the menu with it, then waits
DisplayPatB:
        GOSBVL  D0->Row1                         * 80414
        C=0     A                                * 8041B
        LC(2)   #37                              * 8041D
        GOSUB   FillRows                         * 80421
        GOSBVL  D0->Sft1                         * 80425
        C=0     A                                * 8042C
        LC(1)   #7                               * 8042E
        GOSUB   FillRows                         * 80431
        BSRB                                     * 80435
        BSRB                                     * 80438
        GOTO    DisplayBars.L1                   * 8043B

* refs (2): 80421 80431
* C.A = rows-1 B.W = pattern, D0 = first row -> : fills rows
FillRows:
        D=C     A                                * 8043F
        C=B     W                                * 80441
FillRows.loop1:
        GOSUB   FillRow                          * 80444
        D=D-1   A                                * 80448
        GONC    FillRows.loop1                   * 8044A
        RTN                                      * 8044D

* refs (3): 803EF 803FD 80409
* A.S = first level -> : fills the display with alternating full and empty rows, then waits
DisplayBars:
        C=P     15                               * 8044F
        A=C     S                                * 80453
        GOSBVL  D0->Row1                         * 80456
        C=0     A                                * 8045D
        LC(2)   #37                              * 8045F
        GOSUB   BarRows                          * 80463
        GOSBVL  D0->Sft1                         * 80467
        C=0     A                                * 8046E
        LC(1)   #7                               * 80470
        GOSUB   BarRows                          * 80473
DisplayBars.L1:
        GOLONG  TestPause                        * 80477

* refs (2): 80463 80473
* C.A = rows-1 A.S = phase, D0 = first row -> : fills rows with full or empty bits by the phase
BarRows:
        D=C     A                                * 8047D
BarRows.loop1:
        C=0     W                                * 8047F
        A=A+A   S                                * 80482
        GONC    BarRows.L2                       * 80485
        A=0     S                                * 80488
        A=A+1   S                                * 8048B
        A=A+1   S                                * 8048E
        C=-C-1  W                                * 80491
BarRows.L2:
        GOSUB   FillRow                          * 80494
        D=D-1   A                                * 80498
        GONC    BarRows.loop1                    * 8049A
        RTN                                      * 8049D

* refs (2): 80444 80494
* C = pattern, D0 = row -> D0 next row: writes the 34 nibbles of a row; carry clear
FillRow:
        DAT0=C  15                               * 8049F
        D0=D0+  15                               * 804A3
        DAT0=C  15                               * 804A6
        D0=D0+  15                               * 804AA
        DAT0=C  4                                * 804AD
        D0=D0+  4                                * 804B1
        RTNCC                                    * 804B4

* refs (10): 8001F 8031D 80391 803C5 803D1 803DD ...
* C.B = bits -> : turns the annunciators on or off by the bits
SetAnnun:
        A=C     B                                * 804B6
        GOVLNG  AnnByte>HW                       * 804B9

* refs (2): 800AF 8023C
* IROM: checks the CRC of both halves of the ROM. Sets bit 1 of R1 on a failure
TestIROM:
        GOSUBL  BeepStart                        * 804C0
        D0=(5)  MsgIROM                          * 804C6
        GOSUBL  ShowMsg                          * 804CD
        D0=(5)  #00000                           * 804D3
        LC(5)   #03FFF                           * 804DA
        B=C     A                                * 804E1
        LC(5)   #00000                           * 804E3
        D=C     A                                * 804EA
        LC(5)   #40000                           * 804EC
        AD0EX                                    * 804F3
        GOSUB   ROMHalfCRC                       * 804F6
        GONC    TestIROM.L2                      * 804FA
        D0=(5)  SelfTest                         * 804FD
        LC(5)   #03FFF                           * 80504
        B=C     A                                * 8050B
        LC(5)   #00000                           * 8050D
        D=C     A                                * 80514
        LC(5)   #40000                           * 80516
        AD0EX                                    * 8051D
        GOSUB   ROMHalfCRC                       * 80520
        GONC    TestIROM.L1                      * 80524
        GOLONG  ShowOK                           * 80527
TestIROM.L1:
        P=      15                               * 8052D
        CPEX    4                                * 8052F
TestIROM.L2:
        CD0EX                                    * 80533
        C=R1.F  A                                * 80536
        CBIT=1  1                                * 8053C
        R1=C.F  A                                * 80541
        GOLONG  ShowError                        * 80547

* refs (2): 804F6 80520
* A.A = base (0 or #80000) -> carry set if the CRC of that half comes to #FFFF: reads it in four interleaved quarters, as sasm.crc_fix expects
ROMHalfCRC:
        ST=0    15                               * 8054D
        RSTK=C                                   * 80550
        C=0     A                                * 80552
        D1=(5)  #00104                           * 80554
        DAT1=C  4                                * 8055B
        GOSUB   ROMMapIn                         * 8055F
        C=RSTK                                   * 80563
ROMHalfCRC.loop1:
        D0=A                                     * 80565
        RSTK=C                                   * 80568
        CAEX    A                                * 8056A
        RSTK=C                                   * 8056C
        C=C+A   A                                * 8056E
        D1=C                                     * 80570
        C=B     A                                * 80573
ROMHalfCRC.loop2:
        A=DAT0  W                                * 80575
        D0=D0+  16                               * 80579
        A=DAT1  W                                * 8057C
        D1=D1+  16                               * 80580
        C=C-1   A                                * 80583
        GONC    ROMHalfCRC.loop2                 * 80585
        C=RSTK                                   * 80588
        A=C     A                                * 8058A
        C=RSTK                                   * 8058C
        A=A+C   A                                * 8058E
        A=A+C   A                                * 80590
        D=D-1   A                                * 80592
        GONC    ROMHalfCRC.loop1                 * 80594
        GOSUB   ROMMapOut                        * 80597
        D0=(5)  #00104                           * 8059B
        C=0     A                                * 805A2
        C=DAT0  4                                * 805A4
        A=C     A                                * 805A8
        P=      4                                * 805AA
        A=A-1   P                                * 805AC
        A=A+1   A                                * 805AF
        P=      0                                * 805B1
        GOTO    TestIntrOn                       * 805B3

* refs (1): 8055F
* A.A = base -> : changes the configuration so that this half of the ROM can be read: for the upper half takes out all other modules
ROMMapIn:
        P=      0                                * 805B7
        ?A#0    A                                * 805B9
        GOYES   ROMMapIn.L1                      * 805BC
        LC(5)   #00100                           * 805BE
        UNCNFG                                   * 805C5
        LC(5)   #B0000                           * 805C8
        CONFIG                                   * 805CF
        RTN                                      * 805D2
ROMMapIn.L1:
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
* A.A = base -> : restores the configuration changed by ROMMapIn
ROMMapOut:
        P=      0                                * 805FE
        ?A=0    A                                * 80600
        GOYES   ROMMapOut.L1                     * 80603
        LC(5)   #B0000                           * 80605
        UNCNFG                                   * 8060C
        LC(5)   #00100                           * 8060F
        CONFIG                                   * 80616
        RTN                                      * 80619
ROMMapOut.L1:
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
* IRAM: tests the built-in RAM, saving and restoring its contents. Sets bit 2 of R1 on a failure
TestIRAM:
        GOSUBL  BeepStart                        * 8066D
        GOSUB   ClrScrMn~jump                    * 80673
        D0=(5)  MsgIRAM                          * 80677
        GOSUBL  MsgToBuffer                      * 8067E
        ST=0    15                               * 80684
        GOSUBL  CfgChip                          * 80687
        B=C     A                                * 8068D
        GOSBVL  RamSizeTest                      * 8068F
        GONC    TestIRAM.L1                      * 80696
        D0=(5)  #00001                           * 80699
        GOTO    TestIRAM.L2                      * 806A0
TestIRAM.L1:
        GOSUBL  ShowTail4                        * 806A4
        GOSUBL  CardTest                         * 806AA
        GOC     TestIRAM.L2                      * 806B0
        GOSUBL  ReconfigAll                      * 806B3
        GOLONG  ShowOK                           * 806B9
TestIRAM.L2:
        GOSUBL  ReconfigAll                      * 806BF
        GOSUBL  ShowError                        * 806C5
        C=R1.F  A                                * 806CB
        CBIT=1  2                                * 806D1
        R1=C.F  A                                * 806D6
        RTN                                      * 806DC

* refs (1): 81254
* D = address -> carry set on failure: saves 64 nibbles in R1 to R4, writes and reads back patterns in it, and restores them
RamTestBlock:
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
RamTestBlock.loop1:
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
        GOYES   RamTestBlock.L2                  * 80753
        D0=D0+  15                               * 80755
        C=DAT0  15                               * 80758
        ?C#A    WP                               * 8075C
        GOYES   RamTestBlock.L2                  * 8075F
        D0=D0+  15                               * 80761
        C=DAT0  15                               * 80764
        ?C#A    WP                               * 80768
        GOYES   RamTestBlock.L2                  * 8076B
        D0=D0+  15                               * 8076D
        C=DAT0  15                               * 80770
        ?C#A    WP                               * 80774
        GOYES   RamTestBlock.L2                  * 80777
        D0=D0+  15                               * 80779
        P=      3                                * 8077C
        C=DAT0  4                                * 8077E
        ?C#A    WP                               * 80782
        GOYES   RamTestBlock.L2                  * 80785
        ASL     W                                * 80787
        C=A     S                                * 8078A
        P=C     15                               * 8078D
        C=P     0                                * 80791
        P=      0                                * 80795
        A=C     P                                * 80797
        C=D     A                                * 8079A
        B=B-1   S                                * 8079C
        GOC     RamTestBlock.L3                  * 8079F
        GOTO    RamTestBlock.loop1               * 807A2
RamTestBlock.L2:
        C=RSTK                                   * 807A6
        DCEX    A                                * 807A8
        BUSCC                                    * 807AA
        P=      0                                * 807AD
        GOSUB   RamTestBlock.L3                  * 807AF
        RSTK=C                                   * 807B3
        RTNSC                                    * 807B5
RamTestBlock.L3:
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
* -> C = CRC of the built-in RAM, as a check on the test's own damage
IRAMCRC:
        P=      0                                * 807E9
        LC(5)   #0F000                           * 807EB
        B=C     A                                * 807F2
        GOSUB   D0=IRAM~jump_3                   * 807F4
        LC(4)   #1000                            * 807F8
        B=B+C   A                                * 807FE
        GOTO    MemCRC                           * 80800
        P=      0                                * 80804
        LC(5)   #10000                           * 80806
        B=C     A                                * 8080D
        GOSUB   D0=IRAM~jump_3                   * 8080F
        P=      3                                * 80813
        C=0     WP                               * 80815
        B=B+C   A                                * 80818

* refs (3): 80800 81225 81273
* D0 = address B.A = nibbles -> C = CRC
MemCRC:
        GOVLNG  CRCRange                         * 8081A

* refs (1): 8024B
* KBD2: a shorter key test, of the keys on the diagonal of the keyboard
TestKbd2:
        ST=1    11                               * 80821
        GOTO    TestKbd                          * 80824

* refs (1): 80246
* KBD1: tests all the keys, one at a time, in order
TestKbd1:
        ST=0    11                               * 80828

* refs (1): 80824
* ST11 picks the list of keys: KeyTestDiag or KeyTestAll. A wrong key is reported and the test goes on; a zero byte ends it. Sets bit 3 of R1 on a failure
TestKbd:
        ST=0    9                                * 8082B
        GOSUB   KbdTitle                         * 8082E
        GOSUBL  BeepStart                        * 80832
        GOSBVL  KbdOutAll                        * 80838
        INTON                                    * 8083F
        GOSUBL  Flush~jump                       * 80843
        D0=(5)  KeyTestAll                       * 80849
        ?ST=0   11                               * 80850
        GOYES   TestKbd.loop1                    * 80853
        D0=(5)  KeyTestDiag                      * 80855
TestKbd.loop1:
        C=DAT0  B                                * 8085C
        D=C     A                                * 8085F
        D0=D0+  2                                * 80861
        ?C#0    B                                * 80864
        GOYES   TestKbd.L3                       * 80867
        ?ST=0   9                                * 80869
        GOYES   TestKbd.L2                       * 8086C
        C=R1.F  A                                * 8086E
        CBIT=1  3                                * 80874
        R1=C.F  A                                * 80879
        GOSUB   KbdTitle                         * 8087F
        GOLONG  ShowFAIL                         * 80883
TestKbd.L2:
        GOLONG  ShowOK                           * 80889
TestKbd.L3:
        GOSUB   D1=IRAMHigh                      * 8088F
        D1=(4)  #07F7                            * 80893
        A=0     A                                * 80899
        DAT1=A  A                                * 8089B
TestKbd.loop4:
        RSI                                      * 8089E
        D1=(4)  #07F7                            * 808A3
        C=DAT1  A                                * 808A9
        ?C=0    A                                * 808AC
        GOYES   TestKbd.L5                       * 808AF
        C=0     A                                * 808B1
        LC(2)   #2D                              * 808B3
        GONC    TestKbd.L6                       * 808B7
TestKbd.L5:
        GOSBVL  POPKEY                           * 808BA
        GONC    TestKbd.L6                       * 808C1
        SHUTDN                                   * 808C4
        GOTO    TestKbd.loop4                    * 808C7
TestKbd.L6:
        ?D=C    B                                * 808CB
        GOYES   TestKbd.L7                       * 808CE
        ST=1    9                                * 808D0
        AD0EX                                    * 808D3
        R4=A.F  A                                * 808D6
        CSL     A                                * 808DC
        CSL     A                                * 808DE
        C=D     B                                * 808E0
        RSTK=C                                   * 808E3
        LC(2)   #F4                              * 808E5
        GOSUBL  BeepStart.L1                     * 808E9
        C=RSTK                                   * 808EF
        D0=C                                     * 808F1
        GOSUBL  ShowError                        * 808F4
        A=R4                                     * 808FA
        D0=A                                     * 808FD
        GOTO    TestKbd.loop1                    * 80900
TestKbd.L7:
        LC(2)   #94                              * 80904
        GOSUBL  BeepStart.L1                     * 80908
        GOSUB   KbdTitle                         * 8090E
        GOTO    TestKbd.loop1                    * 80912

* refs (3): 8082E 8087F 8090E
* Shows "KBD1" or "KBD2" by ST11, keeping D0
KbdTitle:
        AD0EX                                    * 80916
        R4=A.F  A                                * 80919
        GOSUBL  ClrScrMn~jump                    * 8091F
        D0=(5)  MsgKBD1                          * 80925
        ?ST=0   11                               * 8092C
        GOYES   KbdTitle.L1                      * 8092F
        D0=(5)  MsgKBD2                          * 80931
KbdTitle.L1:
        GOSUBL  ShowMsg                          * 80938
        A=R4                                     * 8093E
        D0=A                                     * 80941
        RTNCC                                    * 80944

* Key numbers in the order the test expects them
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

* Key numbers of the short test
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

* refs (1): 80250
* ESD: shows "ESD 210V  210V" and a running count, and compares the RAM's CRC after each pass. A change fails the test and sets bit 4 of R1
TestESD:
        GOSUBL  ClrScrMn~jump                    * 809BE
        D0=(5)  MsgESD210                        * 809C4
        GOSUBL  ShowMsg                          * 809CB
        ST=0    15                               * 809D1
        GOSUB   IRAMCRC                          * 809D4
        R2=C                                     * 809D8
        D0=(5)  DA1BadMASK                       * 809DB
        P=      0                                * 809E2
        LC(1)   #C                               * 809E4
        DAT0=C  1                                * 809E7
        C=0     A                                * 809EB
        R3=C                                     * 809ED
TestESD.loop1:
        GOSUBL  BeepDone                         * 809F0
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
        GOSUB   ESDDigit                         * 80A29
        D0=D0+  9                                * 80A2D
        C=R3                                     * 80A30
        CSR     A                                * 80A33
        GOSUB   ESDDigit                         * 80A35
        GOSUB   IRAMCRC                          * 80A39
        A=R2                                     * 80A3D
        ?C#A    A                                * 80A40
        GOYES   TestESD.L3                       * 80A43
        GOSBVL  KbdOutAll                        * 80A45
        GONC    TestESD.loop1                    * 80A4C
        GOSUB   TestIntrOn                       * 80A4F
        D1=(5)  DA1BadMASK                       * 80A53
        LC(1)   #4                               * 80A5A
        DAT1=C  1                                * 80A5D
        GOSUBL  ClrScrMn~jump                    * 80A61
TestESD.loop2:
        GOSBVL  KbdOutAll                        * 80A67
        GOC     TestESD.loop2                    * 80A6E
        RTN                                      * 80A71
TestESD.L3:
        RSTK=C                                   * 80A73
        GOSUB   TestIntrOn                       * 80A75
        D1=(5)  DA1BadMASK                       * 80A79
        LC(1)   #4                               * 80A80
        DAT1=C  1                                * 80A83
        GOSUBL  ClrScrMn~jump                    * 80A87
        D0=(5)  MsgESD                           * 80A8D
        GOSUBL  ShowMsg                          * 80A94
        C=RSTK                                   * 80A9A
        D0=C                                     * 80A9C
        C=R1.F  A                                * 80A9F
        CBIT=1  4                                * 80AA5
        R1=C.F  A                                * 80AAA
        GOSUB   TestESD.loop2                    * 80AB0
        GOLONG  ShowError                        * 80AB4

* refs (2): 80A29 80A35
* C.A = hex digit, D0 = position -> : draws a digit as four big blocks, one for each bit
ESDDigit:
        A=C     A                                * 80ABA
        LC(6)   #30C30C                          * 80ABC
        ?ABIT=1 3                                * 80AC4
        GOYES   ESDDigit.L1                      * 80AC9
        C=0     P                                * 80ACB
ESDDigit.L1:
        P=      2                                * 80ACE
        ?ABIT=1 2                                * 80AD0
        GOYES   ESDDigit.L2                      * 80AD5
        C=0     P                                * 80AD7
ESDDigit.L2:
        P=      3                                * 80ADA
        ?ABIT=1 1                                * 80ADC
        GOYES   ESDDigit.L3                      * 80AE1
        C=0     P                                * 80AE3
ESDDigit.L3:
        P=      5                                * 80AE6
        ?ABIT=1 0                                * 80AE8
        GOYES   ESDDigit.L4                      * 80AED
        C=0     P                                * 80AEF
ESDDigit.L4:
        P=      15                               * 80AF2
        LC(1)   #7                               * 80AF4
        B=C     W                                * 80AF7
        P=      0                                * 80AFA
ESDDigit.loop5:
        C=B     W                                * 80AFC
        DAT0=C  6                                * 80AFF
        AD0EX                                    * 80B03
        LC(5)   #00022                           * 80B06
        A=A+C   A                                * 80B0D
        D0=A                                     * 80B0F
        B=B-1   S                                * 80B12
        GONC    ESDDigit.loop5                   * 80B15
        LC(5)   #00110                           * 80B18
        A=A-C   A                                * 80B1F
        D0=A                                     * 80B21
        RTNCC                                    * 80B24

* refs (8): 80383 805B3 80A4F 80A75 80C78 80CAA ...
* Interrupts back on
TestIntrOn:
        GOVLNG  AllowIntr                        * 80B26

* refs (1): 80269
* Beeps, clears the display and waits for a long delay
TestDelay:
        GOSUBL  BeepStart                        * 80B2D
        GOSUBL  ClrScrMn~jump                    * 80B33
        GOSUBL  DelayLong                        * 80B39
        GOTO    TestESD.loop2                    * 80B3F

* refs (1): 8026E
* SEND: sends the clock's time over the serial port as hex digits and waits for an ACK, for setting up test equipment
TestSend:
        D0=(5)  MsgSEND                          * 80B43
        GOSUB   TestTitle                        * 80B4A
        GOSUB   IRLoopRateOn                     * 80B4E
        GOSBVL  GetTime++                        * 80B52
        A=C     W                                * 80B59
        GOSUB   ClockRead                        * 80B5C
        RSTK=C                                   * 80B60
        P=      12                               * 80B62
        GOSUB   SendHex                          * 80B64
        C=RSTK                                   * 80B68
        GOC     TestSend.L3                      * 80B6A
        A=C     A                                * 80B6D
        P=      3                                * 80B6F
        GOSUB   SendHex                          * 80B71
        GOC     TestSend.L3                      * 80B75
        GOSUB   DelayMid                         * 80B78
        GOSUB   IRLoopRate                       * 80B7C
        GOSUBL  DelayShort                       * 80B80
        GOSUB   POPUART~jump                     * 80B86
        C=0     A                                * 80B8A
        GOC     TestSend.L1                      * 80B8C
        LC(2)   #06                              * 80B8F
        ?C#A    B                                * 80B93
        GOYES   TestSend.L2                      * 80B96
        LC(2)   #94                              * 80B98
        GOSUBL  BeepStart.L1                     * 80B9C
        GOLONG  ShowOK                           * 80BA2
TestSend.L1:
        C=C+1   A                                * 80BA8
        GOTO    TestSend.L4                      * 80BAA
TestSend.L2:
        LC(1)   #2                               * 80BAE
        GOTO    TestSend.L4                      * 80BB1
TestSend.L3:
        C=A     A                                * 80BB5
TestSend.L4:
        RSTK=C                                   * 80BB7
        LC(1)   #6                               * 80BB9
        GOSUB   SetBaud                          * 80BBC
        C=RSTK                                   * 80BC0
        D0=C                                     * 80BC2
        GOLONG  ShowError                        * 80BC5

* refs (2): 80B5C 80C38
* A = time -> C.A: keeps the time at IRAM #69 through SetClockOffsD1 and gives the four-nibble word after it
ClockRead:
        GOSUB   D1=IRAM~jump_5                   * 80BCB
        D1=(4)  #0069                            * 80BCF
        GOSBVL  SetClockOffsD1                   * 80BD5
        D1=D1+  13                               * 80BDC
        C=0     A                                * 80BDF
        C=DAT1  4                                * 80BE1
        RTN                                      * 80BE5

* refs (2): 80B64 80B71
* A = value P = digits-1 -> : sends the digits over the serial port. Carry set on failure
SendHex:
        C=0     A                                * 80BE7
        CPEX    0                                * 80BE9
SendHex.loop1:
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
        GONC    SendHex.loop1                    * 80C0E
        RTNCC                                    * 80C11

* refs (2): 80B78 80C7C
* Delay: #ABD turns
DelayMid:
        LC(5)   #00ABD                           * 80C13
        GOLONG  DelayC                           * 80C1A

* refs (1): 80273
* RECV: reads the time from the serial port, checks it and sets the clock
TestRecv:
        D0=(5)  MsgRECV                          * 80C20
        GOSUB   TestTitle                        * 80C27
        GOSUB   IRLoopRate                       * 80C2B
        P=      3                                * 80C2F
        GOSUB   RecvHex                          * 80C31
        R3=A                                     * 80C35
        GOSUB   ClockRead                        * 80C38
        P=      12                               * 80C3C
        GOSUB   RecvHex                          * 80C3E
        GOSBVL  ASRW5                            * 80C42
        GOSBVL  AsrW4                            * 80C49
        ?C=A    A                                * 80C50
        GOYES   TestRecv.L1                      * 80C53
        GOTO    TestSend.L3                      * 80C55
TestRecv.L1:
        C=0     W                                * 80C59
        P=      0                                * 80C5C
        LC(8)   #7E900000                        * 80C5E
        A=R3                                     * 80C68
        A=A+C   W                                * 80C6B
        ST=0    15                               * 80C6E
        GOSBVL  InitClock.L2                     * 80C71
        GOSUB   TestIntrOn                       * 80C78
        GOSUB   DelayMid                         * 80C7C
        GOSUB   IRLoopRateOn                     * 80C80
        LC(2)   #06                              * 80C84
        A=C     A                                * 80C88
        GOSUB   OUTUART~jump                     * 80C8A
        GONC    TestRecv.L2                      * 80C8E
        A=C     A                                * 80C91
        GOTO    TestSend.L3                      * 80C93
TestRecv.L2:
        ST=0    15                               * 80C97
        GOSBVL  ClrWSLog                         * 80C9A
        P=      0                                * 80CA1
        GOSBVL  LogWarmstart                     * 80CA3
        GOSUB   TestIntrOn                       * 80CAA
        ST=1    6                                * 80CAE
        GOSUBL  TestTimeInit                     * 80CB1
        ST=0    6                                * 80CB7
        GOLONG  SelfTest                         * 80CBA

* refs (2): 80C31 80C3E
* P = digits-1 -> A = value: receives hex digits from the serial port
RecvHex:
        B=0     W                                * 80CC0
RecvHex.loop1:
        GOSUB   POPUART~jump                     * 80CC3
        GOC     RecvHex.loop1                    * 80CC7
        ASRC                                     * 80CCA
        B=A     S                                * 80CCD
        BSR     W                                * 80CD0
        P=P+1                                    * 80CD3
        GONC    RecvHex.loop1                    * 80CD5
        BSR     W                                * 80CD8
        BSR     W                                * 80CDB
        A=B     W                                * 80CDE
        RTN                                      * 80CE1

* refs (2): 80B7C 80C2B
* Sets 2400 baud (rate 2) and turns on the IR LED loop
IRLoopRate:
        P=      0                                * 80CE3
        LC(1)   #2                               * 80CE5
        GOSUB   SetBaud                          * 80CE8
        GOTO    IRLoopOn                         * 80CEC

* refs (2): 80B4E 80C80
* As IRLoopRate, also enabling the UART
IRLoopRateOn:
        P=      0                                * 80CF0
        LC(1)   #2                               * 80CF2
        GOSUB   SetBaud                          * 80CF5
        GOSUB   UARTOn                           * 80CF9

* refs (4): 80CEC 80DA7 80DC3 80FB2
* Sets bit 2 of the IRC register: IR transmit on
IRLoopOn:
        D1=(5)  IRC                              * 80CFD
        A=DAT1  1                                * 80D04
        ABIT=1  2                                * 80D08
        DAT1=A  1                                * 80D0D
        RTN                                      * 80D11

* refs (3): 80DCE 80DD8 80F88
* Clears bit 2 of the IRC register
IRLoopOff:
        D1=(5)  IRC                              * 80D13
        A=DAT1  1                                * 80D1A
        ABIT=0  2                                * 80D1E
        DAT1=A  1                                * 80D23
        RTN                                      * 80D27

* refs (6): 80B4A 80C27 80D40 80D92 80ECA 80F80
* D0 = message -> : flushes keys, beeps and shows the title
TestTitle:
        GOSUB   FlushAttn~jump                   * 80D29
        GOSUBL  BeepStart                        * 80D2D
        GOLONG  ShowMsg                          * 80D33

* refs (2): 800E1 80255
* U_LB: UART loop-back, at two rates. Sets bit 5 of R1 on a failure
TestULB:
        D0=(5)  MsgU_LB                          * 80D39
        GOSUB   TestTitle                        * 80D40
        LC(5)   #00E52                           * 80D44
        R2=C                                     * 80D4B
        LC(1)   #0                               * 80D4E
        GOSUB   SetBaud                          * 80D51
        GOSUB   LoopSend                         * 80D55
        GONC    TestULB.L1                       * 80D59
        LC(5)   #00225                           * 80D5C
        R2=C                                     * 80D63
        LC(1)   #6                               * 80D66
        GOSUB   SetBaud                          * 80D69
        GOSUB   LoopSend                         * 80D6D
        GONC    TestULB.L1                       * 80D71
        GOLONG  ShowOK                           * 80D74
TestULB.L1:
        A=R1                                     * 80D7A
        ABIT=1  5                                * 80D7D
        R1=A                                     * 80D82
        GOLONG  ShowError                        * 80D85

* refs (2): 800D1 80278
* IRLB: IR loop-back, at two rates. Sets bit 9 of R1 on a failure
TestIRLB:
        D0=(5)  MsgIRLB                          * 80D8B
        GOSUB   TestTitle                        * 80D92
        LC(5)   #00E52                           * 80D96
        R2=C                                     * 80D9D
        LC(1)   #0                               * 80DA0
        GOSUB   SetBaud                          * 80DA3
        GOSUB   IRLoopOn                         * 80DA7
        GOSUB   LoopSend                         * 80DAB
        GONC    TestIRLB.L1                      * 80DAF
        LC(5)   #00729                           * 80DB2
        R2=C                                     * 80DB9
        LC(1)   #2                               * 80DBC
        GOSUB   SetBaud                          * 80DBF
        GOSUB   IRLoopOn                         * 80DC3
        GOSUB   LoopSend                         * 80DC7
        GONC    TestIRLB.L1                      * 80DCB
        GOSUB   IRLoopOff                        * 80DCE
        GOLONG  ShowOK                           * 80DD2
TestIRLB.L1:
        GOSUB   IRLoopOff                        * 80DD8
        A=R1                                     * 80DDC
        ABIT=1  9                                * 80DDF
        R1=A                                     * 80DE4
        GOLONG  ShowError                        * 80DE7

* refs (10): 80BBC 80CE8 80CF5 80D51 80D69 80DA3 ...
* C.P = rate -> : sets the UART rate
SetBaud:
        GOVLNG  SetBaud~1                        * 80DED

* refs (4): 80D55 80D6D 80DAB 80DC7
* R2 = delay -> carry clear with an error code in D0 on a failure: sends "U_LB XMIT" and the EOT, byte by byte, and checks each comes back from the UART's own buffer
LoopSend:
        C=0     A                                * 80DF4
        D0=(5)  MsgXMIT                          * 80DF6
        C=DAT0  B                                * 80DFD
        D0=D0+  2                                * 80E00
LoopSend.loop1:
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
        GOC     LoopSend.L3                      * 80E1D
        C=R2                                     * 80E20
LoopSend.loop2:
        C=C-1   A                                * 80E23
        GONC    LoopSend.loop2                   * 80E25
        A=0     A                                * 80E28
        A=DAT0  B                                * 80E2A
        B=A     A                                * 80E2D
        GOSUB   D1=IRAM~jump_5                   * 80E2F
        D1=(4)  #0519                            * 80E33
        A=DAT1  B                                * 80E39
        ?A=0    B                                * 80E3C
        GOYES   LoopSend.L5                      * 80E3F
        LC(2)   #01                              * 80E41
        ?C#A    B                                * 80E45
        GOYES   LoopSend.L6                      * 80E48
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
        GOYES   LoopSend.L4                      * 80E68
        D1=(4)  #0519                            * 80E6A
        C=0     A                                * 80E70
        DAT1=C  B                                * 80E72
        D0=D0+  2                                * 80E75
        C=RSTK                                   * 80E78
        GOTO    LoopSend.loop1                   * 80E7A
LoopSend.L3:
        C=RSTK                                   * 80E7E
        C=A     A                                * 80E80
        D0=C                                     * 80E82
        RTNCC                                    * 80E85
LoopSend.L4:
        C=RSTK                                   * 80E87
        A=A+1   XS                               * 80E89
        ASL     A                                * 80E8C
        ASL     A                                * 80E8E
        A=B     B                                * 80E90
        D0=A                                     * 80E93
        RTNCC                                    * 80E96
LoopSend.L5:
        C=RSTK                                   * 80E98
        D0=(5)  #20000                           * 80E9A  an error code, not an address
        RTNCC                                    * 80EA1
LoopSend.L6:
        C=RSTK                                   * 80EA3
        D0=(5)  #30000                           * 80EA5  an error code, not an address
        RTNCC                                    * 80EAC

* refs (2): 807F4 8080F
D0=IRAM~jump_3:
        GOVLNG  D0=IRAM                          * 80EAE

* refs (9): 80BCB 80E2F 80F29 8100E 8148E 81620 ...
D1=IRAM~jump_5:
        GOVLNG  D1=IRAM                          * 80EB5

* refs (7): 80174 8034A 8088F 80FD2 810D2 81747 ...
* -> D1 = the base of the built-in RAM, from the pointer at =IR_16Hz_Clock; the caller sets the low four nibbles
D1=IRAMHigh:
        GOVLNG  AD1=IRAM                         * 80EBC

* refs (1): 8025A
* UART: echoes what the serial port receives, until an EOT. Sets bit 6 of R1 on a failure
TestUART:
        D0=(5)  MsgUART                          * 80EC3
        GOSUB   TestTitle                        * 80ECA
        LC(1)   #6                               * 80ECE
        GOSUB   SetBaud                          * 80ED1
        GOSUB   UARTEcho                         * 80ED5
        GOC     TestUART.L1                      * 80ED9
        GOLONG  ShowOK                           * 80EDC
TestUART.L1:
        A=R1                                     * 80EE2
        ABIT=1  6                                * 80EE5
        R1=A                                     * 80EEA
        GOLONG  ShowError                        * 80EED

* refs (1): 80ED5
* -> carry set with an error code in D0: echoes bytes until EOT (#04). Code 1 means a key was pressed, 2 a time-out
UARTEcho:
        ST=0    15                               * 80EF3
        GOSUB   Flush~jump                       * 80EF6
        GOSBVL  ClrKeyState                      * 80EFA
        GOSUB   FlushAttn~jump                   * 80F01
        GOSUB   TestIntrOn                       * 80F05
UARTEcho.loop1:
        P=      0                                * 80F09
        LC(5)   #0AA68                           * 80F0B
        R3=C                                     * 80F12
UARTEcho.loop2:
        P=      0                                * 80F15
        GOSUB   UARTOn                           * 80F17
        GOSUB   POPUART~jump                     * 80F1B
        LC(1)   #A                               * 80F1F
        DAT0=C  1                                * 80F22
        GONC    UARTEcho.L5                      * 80F26
        GOSUB   D1=IRAM~jump_5                   * 80F29
        D1=(4)  #07F7                            * 80F2D
        C=DAT1  A                                * 80F33
        ?C#0    A                                * 80F36
        GOYES   UARTEcho.L3                      * 80F39
        GOSBVL  POPKEY                           * 80F3B
        GOC     UARTEcho.L4                      * 80F42
UARTEcho.L3:
        D0=(5)  #00001                           * 80F45
        RTNSC                                    * 80F4C
UARTEcho.L4:
        A=R3                                     * 80F4E
        A=A-1   A                                * 80F51
        R3=A                                     * 80F53
        GONC    UARTEcho.loop2                   * 80F56
        D0=(5)  #00002                           * 80F59
        RTNSC                                    * 80F60
UARTEcho.L5:
        LC(2)   #04                              * 80F62
        ?C#A    B                                * 80F66
        GOYES   UARTEcho.L6                      * 80F69
        RTNCC                                    * 80F6B
UARTEcho.L6:
        GOSUB   OUTUART~jump                     * 80F6D
        GONC    UARTEcho.loop1                   * 80F71
        D0=C                                     * 80F74
        RTNSC                                    * 80F77

* refs (1): 8027D
* IRIO: echoes what the IR port receives. Sets bit 10 of R1 on a failure
TestIRIO:
        D0=(5)  MsgIRIO                          * 80F79
        GOSUB   TestTitle                        * 80F80
        GOSUB   IREcho                           * 80F84
        GOSUB   IRLoopOff                        * 80F88
        GOC     TestIRIO.L1                      * 80F8C
        GOLONG  ShowOK                           * 80F8F
TestIRIO.L1:
        A=R1                                     * 80F95
        ABIT=1  10                               * 80F98
        R1=A                                     * 80F9D
        GOLONG  ShowError                        * 80FA0

* refs (2): 80F84 8103A
* -> carry set with an error code in D0: waits for steady IR input, then echoes bytes
IREcho:
        ST=0    15                               * 80FA6
        P=      0                                * 80FA9
        LC(1)   #2                               * 80FAB
        GOSUB   SetBaud                          * 80FAE
        GOSUB   IRLoopOn                         * 80FB2
        GOSUB   Flush~jump                       * 80FB6
        GOSBVL  ClrKeyState                      * 80FBA
        GOSUB   FlushAttn~jump                   * 80FC1
        GOSUB   TestIntrOn                       * 80FC5
        P=      0                                * 80FC9
        LC(5)   #85225                           * 80FCB
        GOSUB   D1=IRAMHigh                      * 80FD2
        D1=(4)  #0519                            * 80FD6
        A=0     A                                * 80FDC
IREcho.loop1:
        A=DAT1  B                                * 80FDE
        ?A#0    B                                * 80FE1
        GOYES   IREcho.loop2                     * 80FE4
        C=C-1   A                                * 80FE6
        GONC    IREcho.loop1                     * 80FE8
        D0=(5)  #00002                           * 80FEB
        RTNSC                                    * 80FF2
IREcho.loop2:
        B=A     A                                * 80FF4
        LC(5)   #00656                           * 80FF6
IREcho.loop3:
        A=DAT1  B                                * 80FFD
        ?A#B    B                                * 81000
        GOYES   IREcho.loop2                     * 81003
        C=C-1   A                                * 81005
        GONC    IREcho.loop3                     * 81007
        GOSUB   UARTOn                           * 8100A
IREcho.loop4:
        GOSUB   D1=IRAM~jump_5                   * 8100E
        D1=(4)  #07F7                            * 81012
        C=DAT1  A                                * 81018
        ?C#0    A                                * 8101B
        GOYES   IREcho.L5                        * 8101E
        GOSBVL  POPKEY                           * 81020
        GOC     IREcho.L6                        * 81027
IREcho.L5:
        D0=(5)  #00001                           * 8102A
        RTNSC                                    * 81031
IREcho.L6:
        GOSUB   POPUART~jump                     * 81033
        GONC    IREcho.L7                        * 81037
        GOTO    IREcho                           * 8103A
IREcho.L7:
        GOSUB   OUTUART~jump                     * 8103E
        GONC    IREcho.loop4                     * 81042
        D0=C                                     * 81045
        RTNSC                                    * 81048
        BSS     7                                * 8104A  zeros

* refs (3): 80CF9 80F17 8100A
* Writes 8 to the IOC register: enables the UART
UARTOn:
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

* refs (1): 8025F
* PORT: reads the card-detect bits through WaitCardStat, exercises the card, and shows the state as four ASCII digits
TestPort:
        GOSUBL  BeepStart                        * 8107D
        GOSUBL  ClrScrMn~jump                    * 81083
        D0=(5)  MsgPORT                          * 81089
        GOSUBL  MsgToBuffer                      * 81090
        ST=0    15                               * 81096
        GOSBVL  WaitCardStat                     * 81099
        GOSUBL  SUB_81374                        * 810A0
        GOSBVL  WaitCardStat                     * 810A6
        B=C     A                                * 810AD
        LC(8)   #30303030                        * 810AF
        P=      14                               * 810B9
TestPort.loop1:
        ?B=0    XS                               * 810BB
        GOYES   TestPort.L2                      * 810BE
        P=P+1                                    * 810C0
        P=P+1                                    * 810C2
        B=B+B   XS                               * 810C4
        GONC    TestPort.loop1                   * 810C7
        C=C+1   P                                * 810CA
        GONC    TestPort.loop1                   * 810CD
TestPort.L2:
        P=      0                                * 810D0
        GOSUB   D1=IRAMHigh                      * 810D2
        D1=(4)  #009C                            * 810D6
        DAT1=C  8                                * 810DC
        GOLONG  ShowLine                         * 810E0

* refs (2): 800F2 80264
* RAM: "RAM1" tests the card in port 1 from ROM, "RAM2" tests the card in port 2 from a copy of the test in IRAM, since a card at #C0000 covers ROM. Sets bits 7 and 8 of R1 on a failure
* Each test: a read-only card or no card gives code 2, too little memory code 1
TestRAM:
        GOSUBL  BeepStart                        * 810E6
        GOSUBL  ClrScrMn~jump                    * 810EC
        D0=(5)  MsgRAM1                          * 810F2
        GOSUBL  MsgToBuffer                      * 810F9
        ST=0    15                               * 810FF
        GOSBVL  WaitCardStat                     * 81102
        A=C     A                                * 81109
        LC(3)   #A00                             * 8110B
        A=A&C   XS                               * 81110
        ?C=A    XS                               * 81114
        GOYES   TestRAM.L1                       * 81117
        D0=(5)  #00002                           * 81119
        GOTO    TestRAM.L3                       * 81120
TestRAM.L1:
        GOSUB   CfgCard1                         * 81124
        B=C     A                                * 81128
        GOSBVL  RamSizeTest                      * 8112A
        GONC    TestRAM.L2                       * 81131
        D0=(5)  #00001                           * 81134
        GOTO    TestRAM.L3                       * 8113B
TestRAM.L2:
        GOSUB   ShowTail4                        * 8113F
        GOSUB   CardTest                         * 81143
        GOC     TestRAM.L3                       * 81147
        GOSUB   ReconfigAll                      * 8114A
        GOSUBL  ShowOK                           * 8114E
        GOTO    TestRAM.L4                       * 81154
TestRAM.L3:
        GOSUB   ReconfigAll                      * 81158
        GOSUBL  ShowError                        * 8115C
        C=R1.F  A                                * 81162
        CBIT=1  7                                * 81168
        R1=C.F  A                                * 8116D
TestRAM.L4:
        D0=(5)  MsgRAM2                          * 81173
        GOSUBL  MsgToBuffer                      * 8117A
        ST=0    15                               * 81180
        GOSBVL  WaitCardStat                     * 81183
        A=C     A                                * 8118A
        LC(3)   #500                             * 8118C
        A=A&C   XS                               * 81191
        ?C=A    XS                               * 81195
        GOYES   TestRAM.L5                       * 81198
        D0=(5)  #00002                           * 8119A
        GOTO    TestRAM2Fail                     * 811A1
* Copies the rest of the test to IRAM at #409A3 and enters it after its header
TestRAM.L5:
        GOSUB   CfgCard2                         * 811A5
        LC(5)   ReplaceRAMScreen                 * 811A9
        D0=C                                     * 811B0
        A=C     A                                * 811B3
        LC(5)   Ram2Test                         * 811B5
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

* refs (1): 819D0
* End of RAM2 for the IRAM copy: shows OK
TestRAM2OK:
        GOSUB   ReconfigAll                      * 811E3
        GOLONG  ShowOK                           * 811E7

* refs (2): 811A1 819DB
* End of RAM2 for the IRAM copy: reports the failure and sets bit 8 of R1
TestRAM2Fail:
        GOSUB   ReconfigAll                      * 811ED
        GOSUBL  ShowError                        * 811F1
        C=R1.F  A                                * 811F7
        CBIT=1  8                                * 811FD
        R1=C.F  A                                * 81202
        RTN                                      * 81208

* refs (6): 806B3 806BF 8114A 81158 811E3 811ED
* Resets the configuration and sets it up as at boot
ReconfigAll:
        GOVLNG  ResetConfig                      * 8120A

* refs (2): 806AA 81143
* -> carry set on failure: finds the size, then tests each 64 nibbles of the card and compares its CRC before and after
CardTest:
        CD0EX                                    * 81211
        CR0EX.F A                                * 81214
        RSTK=C                                   * 8121A
        C=R0                                     * 8121C
        B=C     A                                * 8121F
        GOSUB   LCC0000                          * 81221
        GOSUBL  MemCRC                           * 81225
        RSTK=C                                   * 8122B
        GOSUB   CardSize                         * 8122D
        GOC     CardTest.L4                      * 81231
        GOSUB   LCC0000                          * 81234
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
CardTest.loop1:
        GOSUBL  RamTestBlock                     * 81254
        GOC     CardTest.L3                      * 8125A
        B=B-1   A                                * 8125D
        GONC    CardTest.loop1                   * 8125F
        C=RSTK                                   * 81262
        R1=C.F  A                                * 81264
        C=R0                                     * 8126A
        B=C     A                                * 8126D
        GOSUB   LCC0000                          * 8126F
        GOSUBL  MemCRC                           * 81273
        A=C     A                                * 81279
        C=RSTK                                   * 8127B
        B=C     A                                * 8127D
        C=RSTK                                   * 8127F
        R0=C.F  A                                * 81281
        ?A#B    A                                * 81287
        GOYES   CardTest.L2                      * 8128A
        RTNCC                                    * 8128C
CardTest.L2:
        D0=(5)  #00000                           * 8128E
        RTNSC                                    * 81295
CardTest.L3:
        C=RSTK                                   * 81297
        R1=C.F  A                                * 81299
CardTest.L4:
        C=RSTK                                   * 8129F
        C=RSTK                                   * 812A1
        R0=C.F  A                                * 812A3
        RTNSC                                    * 812A9

* refs (1): 81124
* Configures: IRAM at #40000, the card in port 1 at #C0000
CfgCard1:
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
* Configures: IRAM at #40000, the card in port 2 at #C0000
CfgCard2:
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
* Configures the module at #C0000
CfgChip:
        P=      0                                * 81349
        LC(5)   #C0000                           * 8134B
        UNCNFG                                   * 81352
        LC(5)   #C0000                           * 81355
        CONFIG                                   * 8135C
        LC(5)   #C0000                           * 8135F
        CONFIG                                   * 81366
        RTNCC                                    * 81369

* refs (3): 81221 81234 8126F
* -> C.A = #C0000
LCC0000:
        LC(5)   #C0000                           * 8136B
        RTN                                      * 81372

* refs (1): 810A0
* Probably: reads a card at addresses with one line set each, to exercise the address lines
SUB_81374:
        ?CBIT=1 8                                * 81374
        RTNYES                                   * 81379
        D0=(5)  #90002                           * 8137B
        GOSUB   ProbeRead                        * 81382
        D0=D0+  2                                * 81386
        GOSUB   ProbeRead                        * 81389
        C=DAT0  1                                * 8138D
        GOSUB   ProbeRead                        * 81391
        D0=D0+  4                                * 81395
        C=DAT0  1                                * 81398
        GOSUB   ProbeRead                        * 8139C
        D0=D0+  8                                * 813A0
        GOSUB   ProbeRead                        * 813A3
        D0=D0+  16                               * 813A7
        GOSUB   ProbeRead                        * 813AA
        D0=D0+  16                               * 813AE
        D0=D0+  16                               * 813B1
        GOSUB   ProbeRead                        * 813B4
        D0=(4)  #0000                            * 813B8

* refs (7): 81382 81389 81391 8139C 813A3 813AA ...
* Reads one nibble at D0, waits for key up and beeps
ProbeRead:
        C=DAT0  1                                * 813BE
        GOSUB   TestPause.loop1                  * 813C2
        GOLONG  BeepStart                        * 813C6

* refs (1): 8122D
* -> R0 = last address: writes marks at #C0000 and at powers of two above it to find where memory mirrors; carry set with D0 = address if a write does not stick
CardSize:
        P=      0                                * 813CC
        LC(5)   #C0000                           * 813CE
        R3=C                                     * 813D5
        C=0     W                                * 813D8
        C=C+1   A                                * 813DB
        R2=C                                     * 813DD
CardSize.loop1:
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
        GOYES   CardSize.L3                      * 8142A
        C=R3                                     * 8142C
        A=R2                                     * 8142F
        A=A+C   A                                * 81432
        D1=A                                     * 81434
        A=DAT1  1                                * 81437
        LC(1)   #2                               * 8143B
        ?C#A    P                                * 8143E
        GOYES   CardSize.L3                      * 81441
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
        GOC     CardSize.L2                      * 8146A
        C=R3                                     * 8146D
        A=A+C   A                                * 81470
        GOC     CardSize.L2                      * 81472
        C=R0                                     * 81475
        ?C<=A   A                                * 81478
        GOYES   CardSize.L2                      * 8147B
        GOTO    CardSize.loop1                   * 8147D
CardSize.L2:
        RTNCC                                    * 81481
CardSize.L3:
        AD1EX                                    * 81483
        D0=A                                     * 81486
        RTNSC                                    * 81489

* refs (3): 806A4 8113F 819BA
* C = four ASCII characters -> : puts them at the end of the text buffer and shows it, keeping D0
ShowTail4:
        B=C     W                                * 8148B
        GOSUB   D1=IRAM~jump_5                   * 8148E
        LC(4)   #00B6                            * 81492
        D1=C                                     * 81498
        C=B     W                                * 8149B
        DAT1=C  8                                * 8149E
        CD0EX                                    * 814A2
        RSTK=C                                   * 814A5
        GOSUB   ShowBuffer                       * 814A7
        C=RSTK                                   * 814AB
        D0=C                                     * 814AD
        RTN                                      * 814B0
        GOSBVL  KeyInBuff?                       * 814B2
        GONC    ShowTail4.L1                     * 814B9
        RTNCC                                    * 814BC
ShowTail4.L1:
        GOVLNG  KeyDown?                         * 814BE

* refs (1): 80025
* Draws a grid line down the middle of the display
DrawGridMid:
        GOSBVL  D0->Row1                         * 814C5
        D0=D0+  16                               * 814CC
        C=0     A                                * 814CF
        LC(2)   #37                              * 814D1
        GOSUB   GridColumn                       * 814D5
        GOSBVL  D0->Sft1                         * 814D9
        D0=D0+  16                               * 814E0
        C=0     A                                * 814E3
        LC(1)   #7                               * 814E5

* refs (1): 814D5
* C.A = rows-1, D0 = position -> : sets one bit in each row
GridColumn:
        D=C     A                                * 814E8
        LC(2)   #22                              * 814EA
        B=C     A                                * 814EE
GridColumn.loop1:
        C=DAT0  1                                * 814F0
        CBIT=1  1                                * 814F4
        DAT0=C  1                                * 814F9
        AD0EX                                    * 814FD
        A=A+B   A                                * 81500
        D0=A                                     * 81502
        D=D-1   A                                * 81505
        GONC    GridColumn.loop1                 * 81507
        RTNCC                                    * 8150A

* refs (1): 8000C
* Draws the self-test's three vertical lines on all rows
DrawGrid:
        GOSBVL  D0->Row1                         * 8150C
        C=0     A                                * 81513
        LC(2)   #37                              * 81515
        GOSUB   GridRows                         * 81519
        GOSBVL  D0->Sft1                         * 8151D
        C=0     A                                * 81524
        LC(1)   #7                               * 81526

* refs (1): 81519
* C.A = rows-1, D0 = first row -> : sets the three lines in each row
GridRows:
        D=C     A                                * 81529
        LC(2)   #22                              * 8152B
        B=C     A                                * 8152F
        CD0EX                                    * 81531
GridRows.loop1:
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
        GONC    GridRows.loop1                   * 81558
        RTNCC                                    * 8155B

* refs (11): 8009D 800A9 800B5 800C1 800D7 800E7 ...
* Waits for key up and a delay. In continuous mode a key press ends the run with a "KBD" fail report
TestPause:
        ?ST=1   6                                * 8155D
        GOYES   TestPause~1                      * 81560
TestPause.loop1:
        GOSBVL  KbdOutAll                        * 81562
        GONC    TestPause.loop1                  * 81569
TestPause.L2:
        LC(5)   #08F34                           * 8156C  delay count
        GOTO    DelayC                           * 81573
TestPause~1:
        GOSBVL  POPKEY                           * 81577
        GOC     TestPause.L2                     * 8157E
        RSTK=C                                   * 81581
        GOSUB   Flush~jump                       * 81583
        C=R1                                     * 81587
        CBIT=1  3                                * 8158A
        R1=C.F  A                                * 8158F
        LC(2)   #F4                              * 81595
        GOSUBL  BeepStart.L1                     * 81599
        GOSUBL  ClrScrMn~jump                    * 8159F
        D0=(5)  MsgKBD                           * 815A5
        GOSUBL  ShowMsg                          * 815AC
        C=RSTK                                   * 815B2
        D0=C                                     * 815B4
        ST=0    6                                * 815B7
        GOSUBL  ShowError                        * 815BA
        GOLONG  SelfTestMenu                     * 815C0

* refs (1): 80B80
* Delay: #0479A turns
DelayShort:
        P=      0                                * 815C6
        LC(5)   #0479A                           * 815C8
        GOTO    DelayC                           * 815CF

* refs (3): 8010C 80B39 81D16
* Delay: #59808 turns
DelayLong:
        P=      0                                * 815D3
        LC(5)   #59808                           * 815D5

* refs (4): 80C1A 81573 815CF 815DE
* C.A = turns -> : carry clear after counting down
DelayC:
        C=C-1   A                                * 815DC
        GONC    DelayC                           * 815DE
        RTNCC                                    * 815E1
        GOSUB   MsgToBuffer                      * 815E3

* refs (1): 81E12
* Shows the buffer in the second text row
ShowRow2:
        GOSBVL  D0->Row1                         * 815E7
        LC(5)   #00110                           * 815EE
        A=A+C   A                                * 815F5
        D0=A                                     * 815F7
        GOTO    ShowBuffer.L1                    * 815FA

* refs (9): 8019B 80336 803A0 804CD 80938 809CB ...
* D0 = counted string -> : shows it in the first text row
ShowMsg:
        GOSUB   MsgToBuffer                      * 815FE

* refs (4): 801FC 814A7 81765 81DF9
* Draws the 22-character text buffer at IRAM #0092, saving the return stack in registers because $5x7 uses it
ShowBuffer:
        GOSBVL  D0->Row1                         * 81602
ShowBuffer.L1:
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
* D0 = counted string -> : copies it to the text buffer
MsgToBuffer:
        A=0     A                                * 8165A
        A=DAT0  B                                * 8165C
        D0=D0+  2                                * 8165F

* refs (2): 81DF2 81E0B
* A.A = length, D0 = text -> : copies it to the text buffer and pads it with spaces
BufferFill:
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
        GOTO    BufferFill.L2                    * 81683
BufferFill.loop1:
        C=DAT0  B                                * 81687
        DAT1=C  B                                * 8168A
        D0=D0+  2                                * 8168D
        D1=D1+  2                                * 81690
BufferFill.L2:
        A=A-1   A                                * 81693
        GONC    BufferFill.loop1                 * 81695
        LC(2)   #20                              * 81698
        GOTO    BufferFill.L4                    * 8169C
BufferFill.loop3:
        DAT1=C  B                                * 816A0
        D1=D1+  2                                * 816A3
BufferFill.L4:
        B=B-1   A                                * 816A6
        GONC    BufferFill.loop3                 * 816A8
        RTNCC                                    * 816AB

* refs (2): 80313 81736
* D0 = value -> : writes a value as four hex digits at the end of the text buffer
PutHex:
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
        GOSUB   PutHexDigit                      * 816D5
        GOSUB   PutHexDigit                      * 816D9
        GOSUB   PutHexDigit                      * 816DD
        GOSUB   PutHexDigit                      * 816E1

* refs (4): 816D5 816D9 816DD 816E1
* Writes the next hex digit of B into the buffer at D1
PutHexDigit:
        BSLC                                     * 816E5
        LC(2)   #39                              * 816E8
        BCEX    P                                * 816EC
        ?B>=C   P                                * 816EF
        GOYES   PutHexDigit.L1                   * 816F2
        C=C+A   A                                * 816F4
PutHexDigit.L1:
        DAT1=C  B                                * 816F6
        D1=D1+  2                                * 816F9
        RTN                                      * 816FC

* refs (10): 80527 806B9 80889 80BA2 80D74 80DD2 ...
* Adds "OK" to the line and shows it
ShowOK:
        D0=(5)  MsgOK                            * 816FE
        GOTO    ShowFAIL.L1                      * 81705

* refs (1): 80883
* Adds "FAIL" to the line and shows it
ShowFAIL:
        D0=(5)  MsgFAIL                          * 81709
ShowFAIL.L1:
        C=DAT0  B                                * 81710
        D0=D0+  2                                * 81713
        C=C+C   A                                * 81716
        C=C-1   A                                * 81718
        P=C     0                                * 8171A
        GOSUBL  D1=IRAM~jump_5                   * 8171E
        D1=(4)  #009C                            * 81724
        C=DAT0  WP                               * 8172A
        DAT1=C  WP                               * 8172E
        GOTO    ShowLine                         * 81732

* refs (12): 80547 806C5 808F4 80AB4 80BC5 80D85 ...
* D0 = error value -> : adds it in hex to the line, shows it, and keeps the time of the first failure at IRAM #85
ShowError:
        GOSUB   PutHex                           * 81736
        GOSBVL  GetTimeNoInt                     * 8173A
        GONC    ShowError.L1                     * 81741
        C=0     W                                * 81744
ShowError.L1:
        GOSUBL  D1=IRAMHigh                      * 81747
        D1=(4)  #0085                            * 8174D
        A=DAT1  13                               * 81753
        P=      12                               * 81757
        A=A+1   WP                               * 81759
        P=      0                                * 8175C
        GONC    ShowLine                         * 8175E
        DAT1=C  13                               * 81761

* refs (5): 80323 8035A 810E0 81732 8175E
* Shows the buffer and prints it
ShowLine:
        GOSUB   ShowBuffer                       * 81765

* refs (1): 80202
* Sends the buffer to the IR printer and over the serial port at rate 6, with CR LF
PrintLine:
        P=      0                                * 81769
        C=0     A                                * 8176B
        LC(2)   #16                              * 8176D
        GOSUBL  D1=IRAMHigh                      * 81771
        D1=(4)  #0092                            * 81777
        GOSUB   IRSend                           * 8177D
        D1=(5)  LineFeedByte                     * 81781
        C=0     A                                * 81788
        C=C+1   A                                * 8178A
        GOSUB   IRSend                           * 8178C
        P=      0                                * 81790
        SETHEX                                   * 81792
        LC(1)   #6                               * 81794
        GOSUBL  SetBaud                          * 81797
        GOSUBL  D1=IRAM~jump_5                   * 8179D
        LC(4)   #0092                            * 817A3
        R3=C                                     * 817A9
        C=0     A                                * 817AC
        LC(2)   #15                              * 817AE
PrintLine.loop1:
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
        GONC    PrintLine.loop1                  * 817CC
        LC(2)   #0D                              * 817CF
        A=C     A                                * 817D3
        GOSUB   OUTUART~jump                     * 817D5
        LC(2)   #0A                              * 817D9
        A=C     A                                * 817DD
        GOSUB   OUTUART~jump                     * 817DF
        GOTO    IRSend~1.L1                      * 817E3

* The line-feed byte for the printer
LineFeedByte:
        NIBHEX  A0                               * 817E7  .

* refs (2): 8177D 8178C
* C.A = bytes, D1 = text -> : sends them to the IR printer
IRSend:
        GOTO    IRSend~1                         * 817E9
IRSend.L1:
        RSTK=C                                   * 817ED
        A=DAT1  B                                * 817EF
        D1=D1+  2                                * 817F2
        ST=0    15                               * 817F5
        GOSBVL  SUB_65863.L2                     * 817F8
        GOSBVL  AllowIntr                        * 817FF
        C=RSTK                                   * 81806
IRSend~1:
        C=C-1   A                                * 81808
        GONC    IRSend.L1                        * 8180A
IRSend~1.L1:
        D0=(5)  ANNCTRL                          * 8180D
        C=DAT0  B                                * 81814
        CBIT=0  5                                * 81817
        DAT0=C  B                                * 8181C
        P=      0                                * 8181F
        RTNCC                                    * 81821

* Counted string, shown by the self-test
* Self-test messages: counted strings (used as MsgSPD+n)
MsgSPD:
        CON(2)  4                                * 81823  entry 0
        NIBASC  "SPD "                           * 81825

* Counted string, shown by the self-test
MsgDISP:
        CON(2)  4                                * 8182D  entry 1
        NIBASC  "DISP"                           * 8182F

* Counted string, shown by the self-test
MsgIROM:
        CON(2)  4                                * 81837  entry 2
        NIBASC  "IROM"                           * 81839

* Counted string, shown by the self-test
MsgIRAM:
        CON(2)  4                                * 81841  entry 3
        NIBASC  "IRAM"                           * 81843

* Counted string, shown by the self-test
MsgKBD1:
        CON(2)  4                                * 8184B  entry 4
        NIBASC  "KBD1"                           * 8184D

* Counted string, shown by the self-test
MsgKBD2:
        CON(2)  4                                * 81855  entry 5
        NIBASC  "KBD2"                           * 81857

* Counted string, shown by the self-test
MsgKBD:
        CON(2)  3                                * 8185F  entry 6
        NIBASC  "KBD"                            * 81861

* Counted string, shown by the self-test
MsgESD210:
        CON(2)  14                               * 81867  entry 7
        NIBASC  "ESD 210V  210V"                 * 81869

* Counted string, shown by the self-test
MsgESD:
        CON(2)  3                                * 81885  entry 8
        NIBASC  "ESD"                            * 81887

* Counted string, shown by the self-test
MsgOK:
        CON(2)  2                                * 8188D  entry 9
        NIBASC  "OK"                             * 8188F

* Counted string, shown by the self-test
MsgOK48:
        CON(2)  6                                * 81893  entry 10
        NIBASC  "OK-48 "                         * 81895

* Counted string, shown by the self-test
MsgFAIL:
        CON(2)  4                                * 818A1  entry 11
        NIBASC  "FAIL"                           * 818A3

* Counted string, shown by the self-test
MsgU_LB:
        CON(2)  4                                * 818AB  entry 12
        NIBASC  "U_LB"                           * 818AD

* Counted string, shown by the self-test
MsgUART:
        CON(2)  4                                * 818B5  entry 13
        NIBASC  "UART"                           * 818B7

* The text sent in loop-back tests, with the EOT at its end
MsgXMIT:
        CON(2)  10                               * 818BF  entry 14
        NIBASC  "U_LB XMIT\04"                   * 818C1

* Counted string, shown by the self-test
MsgTimeInit:
        CON(2)  9                                * 818D5  entry 15
        NIBASC  "Time Init"                      * 818D7

* Counted string, shown by the self-test
MsgStart:
        CON(2)  6                                * 818E9  entry 16
        NIBASC  "Start:"                         * 818EB

* Counted string, shown by the self-test
MsgFail:
        CON(2)  6                                * 818F7  entry 17
        NIBASC  "Fail :"                         * 818F9

* Counted string, shown by the self-test
MsgPORT:
        CON(2)  4                                * 81905  entry 18
        NIBASC  "PORT"                           * 81907

* Counted string, shown by the self-test
MsgRAM1:
        CON(2)  4                                * 8190F  entry 19
        NIBASC  "RAM1"                           * 81911

* Counted string, shown by the self-test
MsgRAM2:
        CON(2)  4                                * 81919  entry 20
        NIBASC  "RAM2"                           * 8191B

* Counted string, shown by the self-test
MsgIRLB:
        CON(2)  4                                * 81923  entry 21
        NIBASC  "IRLB"                           * 81925

* Counted string, shown by the self-test
MsgIRIO:
        CON(2)  4                                * 8192D  entry 22
        NIBASC  "IRIO"                           * 8192F

* Counted string, shown by the self-test
MsgSEND:
        CON(2)  4                                * 81937  entry 23
        NIBASC  "SEND"                           * 81939

* Counted string, shown by the self-test
MsgRECV:
        CON(2)  4                                * 81941  entry 24
        NIBASC  "RECV"                           * 81943
        CON(2)  14                               * 8194B  entry 25
        NIBASC  "Version HP48-R"                 * 8194D
        CON(2)  17                               * 81969  entry 26
        NIBASC  "Copyright HP 1989"              * 8196B

* Copied to IRAM by TestRAM and run there: the RAM2 test
Ram2Test:
        BSS     3                                * 8198D  zeros
        GOSUB   SUB_81B6B                        * 81990
        LC(5)   #C0000                           * 81994
        B=C     A                                * 8199B
        GOSBVL  RamSizeTest                      * 8199D
        GONC    Ram2Test.L1                      * 819A4
        D0=(5)  #00001                           * 819A7
        GOTO    Ram2Test.L2                      * 819AE
Ram2Test.L1:
        B=C     A                                * 819B2
        GOSUB   SUB_81B3D                        * 819B4
        C=B     A                                * 819B8
        GOSBVL  ShowTail4                        * 819BA
        GOSUB   SUB_81B6B                        * 819C1
        GOSUB   Ram2CardTest                     * 819C5
        GOC     Ram2Test.L2                      * 819C9
        GOSUB   SUB_81B3D                        * 819CC
        GOVLNG  TestRAM2OK                       * 819D0
Ram2Test.L2:
        GOSUB   SUB_81B3D                        * 819D7
        GOVLNG  TestRAM2Fail                     * 819DB

* refs (1): 819C5
* Copy of CardTest for the IRAM copy
Ram2CardTest:
        CD0EX                                    * 819E2
        CR0EX.F A                                * 819E5
        RSTK=C                                   * 819EB
        C=R0                                     * 819ED
        B=C     A                                * 819F0
        GOSUB   Ram2Base                         * 819F2
        GOSBVL  CRCRange                         * 819F6
        RSTK=C                                   * 819FD
        GOSUB   Ram2CardSize                     * 819FF
        GOC     Ram2CardTest.L4                  * 81A03
        GOSUB   Ram2Base                         * 81A06
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
Ram2CardTest.loop1:
        GOSUBL  Ram2Block                        * 81A26
        GOC     Ram2CardTest.L3                  * 81A2C
        B=B-1   A                                * 81A2F
        GONC    Ram2CardTest.loop1               * 81A31
        C=RSTK                                   * 81A34
        R1=C.F  A                                * 81A36
        C=R0                                     * 81A3C
        B=C     A                                * 81A3F
        GOSUB   Ram2Base                         * 81A41
        GOSBVL  CRCRange                         * 81A45
        A=C     A                                * 81A4C
        C=RSTK                                   * 81A4E
        B=C     A                                * 81A50
        C=RSTK                                   * 81A52
        R0=C.F  A                                * 81A54
        ?A#B    A                                * 81A5A
        GOYES   Ram2CardTest.L2                  * 81A5D
        RTNCC                                    * 81A5F
Ram2CardTest.L2:
        D0=(5)  #00000                           * 81A61
        RTNSC                                    * 81A68
Ram2CardTest.L3:
        C=RSTK                                   * 81A6A
        R1=C.F  A                                * 81A6C
Ram2CardTest.L4:
        C=RSTK                                   * 81A72
        C=RSTK                                   * 81A74
        R0=C.F  A                                * 81A76
        RTNSC                                    * 81A7C

* refs (1): 819FF
* Copy of CardSize for the IRAM copy
Ram2CardSize:
        P=      0                                * 81A7E
        LC(5)   #C0000                           * 81A80
        R3=C                                     * 81A87
        C=0     W                                * 81A8A
        C=C+1   A                                * 81A8D
        R2=C                                     * 81A8F
Ram2CardSize.loop1:
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
        GOYES   Ram2CardSize.L3                  * 81ADC
        C=R3                                     * 81ADE
        A=R2                                     * 81AE1
        A=A+C   A                                * 81AE4
        D1=A                                     * 81AE6
        A=DAT1  1                                * 81AE9
        LC(1)   #2                               * 81AED
        ?C#A    P                                * 81AF0
        GOYES   Ram2CardSize.L3                  * 81AF3
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
        GOC     Ram2CardSize.L2                  * 81B1C
        C=R3                                     * 81B1F
        A=A+C   A                                * 81B22
        GOC     Ram2CardSize.L2                  * 81B24
        C=R0                                     * 81B27
        ?C<=A   A                                * 81B2A
        GOYES   Ram2CardSize.L2                  * 81B2D
        GOTO    Ram2CardSize.loop1               * 81B2F
Ram2CardSize.L2:
        RTNCC                                    * 81B33
Ram2CardSize.L3:
        AD1EX                                    * 81B35
        D0=A                                     * 81B38
        RTNSC                                    * 81B3B

* refs (3): 819B4 819CC 819D7
* Probably: ends the bank switching changes of Ram2Test: reads #90000 and sets bit 7 of the line count registers
SUB_81B3D:
        D1=(5)  #90000                           * 81B3D
        C=DAT1  B                                * 81B44
        D1=(5)  #40000                           * 81B47  not an address
        D1=(4)  #069A                            * 81B4E
        C=DAT1  B                                * 81B54
        CBIT=1  7                                * 81B57
        DAT1=C  B                                * 81B5C
        D1=(5)  LINECOUNT                        * 81B5F
        DAT1=C  B                                * 81B66
        RTN                                      * 81B69

* refs (2): 81990 819C1
* Probably: sets the bank switching for Ram2Test: clears bit 7 of the line count registers and reads #90040
SUB_81B6B:
        D1=(5)  Clr1USR.L1+37                    * 81B6B
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
* -> C.A = #C0000
Ram2Base:
        LC(5)   #C0000                           * 81B99
        RTN                                      * 81BA0

* refs (1): 81A26
* Copy of RamTestBlock for the IRAM copy
Ram2Block:
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
Ram2Block.loop1:
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
        GOYES   Ram2Block.L2                     * 81C17
        D0=D0+  15                               * 81C19
        C=DAT0  15                               * 81C1C
        ?C#A    WP                               * 81C20
        GOYES   Ram2Block.L2                     * 81C23
        D0=D0+  15                               * 81C25
        C=DAT0  15                               * 81C28
        ?C#A    WP                               * 81C2C
        GOYES   Ram2Block.L2                     * 81C2F
        D0=D0+  15                               * 81C31
        C=DAT0  15                               * 81C34
        ?C#A    WP                               * 81C38
        GOYES   Ram2Block.L2                     * 81C3B
        D0=D0+  15                               * 81C3D
        P=      3                                * 81C40
        C=DAT0  4                                * 81C42
        ?C#A    WP                               * 81C46
        GOYES   Ram2Block.L2                     * 81C49
        ASL     W                                * 81C4B
        C=A     S                                * 81C4E
        P=C     15                               * 81C51
        C=P     0                                * 81C55
        P=      0                                * 81C59
        A=C     P                                * 81C5B
        C=D     A                                * 81C5E
        B=B-1   S                                * 81C60
        GOC     Ram2Block.L3                     * 81C63
        GOTO    Ram2Block.loop1                  * 81C66
Ram2Block.L2:
        C=RSTK                                   * 81C6A
        DCEX    A                                * 81C6C
        BUSCC                                    * 81C6E
        P=      0                                * 81C71
        GOSUB   Ram2Block.L3                     * 81C73
        RSTK=C                                   * 81C77
        RTNSC                                    * 81C79
Ram2Block.L3:
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

* Shows "Replace RAM, Press ON"
ReplaceRAMScreen:
        GOSUB   BootScreen                       * 81CAD
        LC(5)   #0000F                           * 81CB1
        GOTO    BootMsg                          * 81CB8

* Shows "Recovering Memory", with the busy annunciator
RecoveringScreen:
        GOSBVL  ClrScrMn                         * 81CBC
        LC(5)   #0000D                           * 81CC3
        GOSUB   BootMsg                          * 81CCA
        D1=(5)  ANNCTRL                          * 81CCE
        C=DAT1  B                                * 81CD5
        CBIT=1  4                                * 81CD8
        DAT1=C  B                                * 81CDD
        RTN                                      * 81CE0

* Shows "Warning:" and "No Mem To Config All", for a moment
NoMemScreen:
        GOSUB   BootScreen                       * 81CE2
        LC(5)   #00007                           * 81CE6
        GOSUB   BootMsg                          * 81CED
        LC(5)   #00010                           * 81CF1
        GOTO    Warn2Row                         * 81CF8

* Shows "Warning:" and "Invalid Card Data", for a moment
BadCardScreen:
        GOSUB   BootScreen                       * 81CFC
        LC(5)   #00007                           * 81D00
        GOSUB   BootMsg                          * 81D07
        LC(5)   #00008                           * 81D0B

* refs (1): 81CF8
* C.A = message -> : shows it in the second row and waits, then clears
Warn2Row:
        GOSUB   BootMsg2                         * 81D12
        GOSBVL  DelayLong                        * 81D16
        GOVLNG  ClrScrMn                         * 81D1D

* Shows "Try To Recover Memory?" with YES and NO on the menu keys
TryRecoverScreen:
        GOSUB   BootKeysOff                      * 81D24
        LC(5)   #0000E                           * 81D28
        GOSUB   BootMsg                          * 81D2F

* Draws the YES label over key A and the NO label over key F
YesNoLabels:
        P=      0                                * 81D33
        SETHEX                                   * 81D35
        GOSBVL  ClrMenu                          * 81D37
        D1=(5)  LabelYES                         * 81D3E
        GOSBVL  D0->Sft1                         * 81D45
        AD0EX                                    * 81D4C
        C=0     A                                * 81D4F
        GOSUB   DrawLabel                        * 81D51
        D1=(5)  LabelNO                          * 81D55
        GOSBVL  D0->Sft1                         * 81D5C
        AD0EX                                    * 81D63
        C=0     A                                * 81D66
        LC(2)   #1B                              * 81D68
        A=A+C   A                                * 81D6C

* refs (1): 81D51
* D1 = rows, A = menu row -> : copies a seven-row, 24-pixel label to the menu (P counts 9 to 15)
DrawLabel:
        LC(2)   #22                              * 81D6E
        A=A+C   A                                * 81D72
        D0=A                                     * 81D74
        P=      9                                * 81D77
DrawLabel.loop1:
        A=DAT1  6                                * 81D79
        DAT0=A  6                                * 81D7D
        AD0EX                                    * 81D81
        A=A+C   A                                * 81D84
        D0=A                                     * 81D86
        D1=D1+  6                                * 81D89
        P=P+1                                    * 81D8C
        GONC    DrawLabel.loop1                  * 81D8E
        RTN                                      * 81D91

* Picture of the YES label: seven rows of 6 nibbles
* Self-test YES label: rows of 24 pixels (copied by DrawLabel)
LabelYES:
        CON(6)  #1FFFFF                          * 81D93  entry 0
        CON(6)  #1F315F                          * 81D99  entry 1
        CON(6)  #1FDD5F                          * 81D9F  entry 2
        CON(6)  #1FB1BF                          * 81DA5  entry 3
        CON(6)  #1F7DBF                          * 81DAB  entry 4
        CON(6)  #1F91BF                          * 81DB1  entry 5
        CON(6)  #1FFFFF                          * 81DB7  entry 6

* Picture of the NO label: seven rows of 6 nibbles
* Self-test NO label: rows of 24 pixels (copied by DrawLabel)
LabelNO:
        CON(6)  #3FFFFC                          * 81DBD  entry 0
        CON(6)  #3E2DFC                          * 81DC3  entry 1
        CON(6)  #3EA9FC                          * 81DC9  entry 2
        CON(6)  #3EA1FC                          * 81DCF  entry 3
        CON(6)  #3EA5FC                          * 81DD5  entry 4
        CON(6)  #3E2DFC                          * 81DDB  entry 5
        CON(6)  #3FFFFC                          * 81DE1  entry 6

* refs (5): 81CB8 81CCA 81CED 81D07 81D2F
* C.A = n -> : shows message n of MsgTab(0) in the first row
BootMsg:
        D0=(5)  MsgTab(0).L1                     * 81DE7
        GOSUB   MsgFind                          * 81DEE
        GOSBVL  BufferFill                       * 81DF2
        GOVLNG  ShowBuffer                       * 81DF9

* refs (1): 81D12
* C.A = n -> : shows message n of MsgTab(0) in the second row
BootMsg2:
        D0=(5)  MsgTab(0).L1                     * 81E00
        GOSUB   MsgFind                          * 81E07
        GOSBVL  BufferFill                       * 81E0B
        GOVLNG  ShowRow2                         * 81E12

* refs (1): 81D24
* Flushes keys, before TryRecoverScreen
BootKeysOff:
        GOSBVL  Flush                            * 81E19
        GOSBVL  WaitCardStat.L2                  * 81E20

* refs (3): 81CAD 81CE2 81CFC
* Clears the display, annunciators off, turns it on, and beeps
BootScreen:
        GOSBVL  ClrScrMn                         * 81E27
        C=0     A                                * 81E2E
        GOSBVL  SetAnnun                         * 81E30
        GOSBVL  ScrOn+                           * 81E37
        GOSBVL  KbdOutAll                        * 81E3E
        GOVLNG  BeepMenu                         * 81E45

* refs (2): 81DEE 81E07
* C.A = n, D0 = strings -> A.A = length, D0 = text of string n
MsgFind:
        SETHEX                                   * 81E4C
        C=C-1   A                                * 81E4E
MsgFind.loop1:
        A=DAT0  A                                * 81E50
        A=A-CON A,5                              * 81E53
        D0=D0+  5                                * 81E59
        C=C-1   A                                * 81E5C
        GOC     MsgFind.L2                       * 81E5E
        CD0EX                                    * 81E61
        C=C+A   A                                * 81E64
        CD0EX                                    * 81E66
        GOTO    MsgFind.loop1                    * 81E69
MsgFind.L2:
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
        GOSBVL  ResetConfig                      * 81EB1
        GOSBVL  AllowIntr                        * 81EB8
        C=RSTK                                   * 81EBF
        GOSBVL  ClrScrMn                         * 81EC1
        GOVLNG  TestESD.loop2                    * 81EC8
        FILLTO  #82000                           * 81ECF  305 zero nibbles: the next entry stays at #82000

        LENGTH                                   * 82000  library object without its prolog (its place is the end of the link table before): length, to #86FDD
        CON(2)  0                                * 82005  no title
