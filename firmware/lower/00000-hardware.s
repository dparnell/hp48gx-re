* HP 48GX ROM revision R, #00000-#02001: Reset and interrupt entries, serial and keyboard service, ON-key combinations, timers and wake-ups, battery check, beeper, display and annunciator control
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: AllowIntr FLUSHKEYS DisableIntr ClrScrMn D0->Sft1 D0->Row1 KbdOutAll TryToRM? SetT2WakeClk GetTimeRaw GetTimChk WaitCardStat

        ORG     #00000

* refs (1): 81E80
* Reset entry: P=3, then on to RESET (#01FEA) and the boot code at #7018C
Reset:
        P=      3                                * 00000
        GOTO    Interrupt.L13                    * 00002
        CLRST                                    * 00006
        A=C     A                                * 00008
        DCEX    A                                * 0000A
        R0=A                                     * 0000C

* Interrupt handler entry
        PIN     #0000F                           * the CPU jumps here on an interrupt
Interrupt:
        ST=1    14                               * 0000F
        GOC     Interrupt.L3                     * 00012
        ?ST=0   15                               * 00015
        GOYES   Interrupt.L2                     * 00018
Interrupt.loop1:
        RSTK=C                                   * 0001A
        GOTO    Interrupt.L5                     * 0001C
Interrupt.L2:
        RTNCC                                    * 00020
Interrupt.L3:
        ?ST=1   15                               * 00022
        GOYES   Interrupt.loop1                  * 00025
        RTNSC                                    * 00027
        BSS     15                               * 00029  zeros
Interrupt.L4:
        P=      8                                * 00038
        GOTO    Interrupt.L13                    * 0003A
Interrupt.L5:
        CD1EX                                    * 0003E
        D1=(5)  =D1-low-nib_save                 * 00041
        DAT1=C  1                                * 00048
        D1=(5)  IRAM@                            * 0004C
        C=DAT1  1                                * 00053
        CPEX    0                                * 00057
        CPEX    4                                * 0005B
        D1=C                                     * 0005F
        D1=(4)  #05DB                            * 00062
        CPEX    4                                * 00068
        CPEX    0                                * 0006C
        DAT1=C  W                                * 00070
        C=0     A                                * 00074
        C=P     3                                * 00076
        P=      2                                * 0007A
        GOC     Interrupt.L6                     * 0007C
        C=C+1   P                                * 0007F
Interrupt.L6:
        P=      1                                * 00082
        C=-C-1  P                                * 00084
        SETHEX                                   * 00087
        P=      0                                * 00089
        ?SB=0                                    * 0008B
        GOYES   Interrupt.L7                     * 0008E
        C=C+1   P                                * 00090
Interrupt.L7:
        D1=D1+  16                               * 00093
        DAT1=C  A                                * 00096
        D1=D1+  5                                * 00099
        C=RSTK                                   * 0009C
        DAT1=C  A                                * 0009E
        D1=D1+  5                                * 000A1
        DAT1=A  W                                * 000A4
        D1=D1+  16                               * 000A8
        C=ST                                     * 000AB
        DAT1=C  A                                * 000AD
        D1=D1+  3                                * 000B0
        C=B     W                                * 000B3
        DAT1=C  W                                * 000B6
        D1=D1+  16                               * 000BA
        C=D     W                                * 000BD
        DAT1=C  W                                * 000C0
        D1=D1+  16                               * 000C4
        C=R0                                     * 000C7
        DAT1=C  W                                * 000CA
        D1=D1+  16                               * 000CE
        C=RSTK                                   * 000D1
        DAT1=C  A                                * 000D3
        D1=D1+  5                                * 000D6
        CD0EX                                    * 000D9
        DAT1=C  A                                * 000DC
        GOTO    Interrupt.L8                     * 000DF
        FILLTO  #00140                           * 000E3  93 zero nibbles: the next entry stays at #00140
Interrupt.L8:
        ST=1    13                               * 00140
        D0=(5)  TIMER2CTRL                       * 00143
        A=DAT0  1                                * 0014A
        ?ABIT=1 0                                * 0014E
        GOYES   Interrupt.L9                     * 00153
        GOLONG  GetTime++.L1                     * 00155
Interrupt.L9:
        D0=(5)  NOP1MASK14                       * 0015B
        A=DAT0  1                                * 00162
        LC(1)   #C                               * 00166
        DAT0=C  1                                * 00169
        ?MP=0                                    * 0016D
        GOYES   Interrupt.L11                    * 00170
        GOSUB   WaitMPClear                      * 00172
Interrupt.loop10:
        P=      11                               * 00176
        GOTO    Interrupt.L13                    * 00178
Interrupt.L11:
        D0=(2)  #09                              * 0017C
        LC(1)   #4                               * 00180
        DAT0=C  1                                * 00183
        D0=(2)  #08                              * 00187
        C=DAT0  1                                * 0018B
        ?CBIT=0 0                                * 0018F
        GOYES   Interrupt.L12                    * 00194
        ST=1    0                                * 00196
        GOSUB   BatSleep                         * 00199
        P=      1                                * 0019D
        GOTO    Interrupt.L13                    * 0019F
Interrupt.L12:
        D1=(4)  #0000                            * 001A3
        A=DAT1  A                                * 001A9
        P=      0                                * 001AC
        LC(5)   #A5C3F                           * 001AE
        ?C=A    A                                * 001B5
        GOYES   Interrupt.L14                    * 001B8
        P=      7                                * 001BA
Interrupt.L13:
        GOVLNG  Warmstart.L1                     * 001BC
Interrupt.L14:
        GOSUB   SrvcSerial                       * 001C3
        D0=(5)  #0011C                           * 001C7
        C=DAT0  1                                * 001CE
        ?CBIT=0 2                                * 001D2
        GOYES   Interrupt.L15                    * 001D7
        CBIT=0  2                                * 001D9
        DAT0=C  1                                * 001DE
Interrupt.L15:
        D0=(2)  #1A                              * 001E2
        C=DAT0  1                                * 001E6
        ?CBIT=0 1                                * 001EA
        GOYES   Interrupt.L16                    * 001EF
        CBIT=0  1                                * 001F1
        DAT0=C  1                                * 001F6
Interrupt.L16:
        D1=(4)  #00E1                            * 001FA
        C=DAT1  1                                * 00200
        D0=(5)  #0010F                           * 00204
        A=DAT0  1                                * 0020B
Interrupt.L17:
        ?C=A    P                                * 0020F
        GOYES   Interrupt.L18                    * 00212
        GOTO    Interrupt.loop10                 * 00214
Interrupt.L18:
        GOSBVL  srvc_timer2                      * 00218
        GOSUB   SrvcTimer1                       * 0021F
        GOSUB   CkLowBat                         * 00223
        GOSUBL  OnKeyDown?                       * 00227
        GONC    Interrupt.L19                    * 0022D
        GOLONG  OnKeyCombo                       * 00230
Interrupt.L19:
        GOSUB   WaitCardStat.L2                  * 00236
Interrupt.L20:
        GOSUB   D1=IRAM~jump                     * 0023A
        D1=(4)  #0608                            * 0023E
        C=DAT1  W                                * 00244
        B=C     W                                * 00248
        D1=D1+  16                               * 0024B
        C=DAT1  W                                * 0024E
        D=C     W                                * 00252
        D1=D1+  16                               * 00255
        C=DAT1  W                                * 00258
        R0=C                                     * 0025C
        D1=D1+  16                               * 0025F
        C=DAT1  A                                * 00262
        RSTK=C                                   * 00265
        D1=D1+  5                                * 00267
        C=DAT1  A                                * 0026A
        D0=C                                     * 0026D
        D1=(4)  #0642                            * 00270
        C=DAT1  X                                * 00276
        OUT=C                                    * 0027A
        GOSUBL  CINRTN                           * 0027D
        D1=(4)  #0605                            * 00283
        C=DAT1  A                                * 00289
        ST=C                                     * 0028C
        D1=D1-  16                               * 0028E
        A=DAT1  W                                * 00291
        D1=D1-  5                                * 00295
        C=DAT1  A                                * 00298
        RSTK=C                                   * 0029B
        D1=D1-  5                                * 0029D
        C=DAT1  A                                * 002A0
        SB=0                                     * 002A3
        CSR     A                                * 002A6
        P=      0                                * 002A8
        C=C+1   P                                * 002AA
        GOC     Interrupt.L21                    * 002AD
        SETDEC                                   * 002B0
Interrupt.L21:
        P=      1                                * 002B2
        C=C-1   P                                * 002B4
        P=C     2                                * 002B7
        D1=(4)  #05DB                            * 002BB
        C=DAT1  W                                * 002C1
        D1=(5)  =D1-low-nib_save                 * 002C5
        C=DAT1  1                                * 002CC
        D1=C                                     * 002D0
        C=RSTK                                   * 002D3
        ST=0    14                               * 002D5
        RTI                                      * 002D8

* refs (2): 00172 043E0
* -> : a card was pulled (MP set): keep writing #C to the card control register #0010E, after a short delay, until MP stays clear
WaitMPClear:
        P=      0                                * 002DA
        D0=(5)  NOP1MASK14                       * 002DC
WaitMPClear.loop1:
        MP=0                                     * 002E3
        C=0     A                                * 002E6
        C=C+1   XS                               * 002E8
WaitMPClear.loop2:
        C=C-1   A                                * 002EB
        GONC    WaitMPClear.loop2                * 002ED
        LC(1)   #C                               * 002F0
        DAT0=C  1                                * 002F3
        ?MP=0                                    * 002F7
        RTNYES                                   * 002FA
        GONC    WaitMPClear.loop1                * 002FC

* refs (2): 00199 01097
* ST0 = 1 when the very-low-battery bit caused this: go through the stub at #70250 (blanks the display, serial off), then SHUTDN in a loop until the battery is fine and the machine is woken
BatSleep:
        GOVLNG  BatSleep~1                       * 002FF
BatSleep.L1:
        D0=(2)  #2E                              * 00306
        C=DAT0  B                                * 0030A
        RSTK=C                                   * 0030D
        P=      0                                * 0030F
        C=0     A                                * 00311
        ?ST=0   0                                * 00313
        GOYES   BatSleep.L2                      * 00316
        LC(2)   #10                              * 00318
BatSleep.L2:
        DAT0=C  B                                * 0031C
        GOSUBL  KbdOut0                          * 0031F
        INTOFF                                   * 00325
        D0=(2)  #1C                              * 00329
        C=0     A                                * 0032D
        DAT0=C  1                                * 0032F
        D0=(2)  #0E                              * 00333
        LC(1)   #8                               * 00337
        DAT0=C  1                                * 0033A
BatSleep.loop3:
        C=0     A                                * 0033E
        D0=(2)  #09                              * 00340
        DAT0=C  1                                * 00344
        GOVLNG  ShutdnInRAM.L1                   * 00348
BatSleep.L4:
        D0=(2)  #09                              * 0034F
        LC(1)   #4                               * 00353
        DAT0=C  1                                * 00356
        D0=(2)  #2E                              * 0035A
        C=DAT0  B                                * 0035E
        RSTK=C                                   * 00361
        LC(2)   #10                              * 00363
        DAT0=C  B                                * 00367
        D0=(2)  #38                              * 0036A
        A=DAT0  1                                * 0036E
        LC(1)   #A                               * 00372
        A=A-C   P                                * 00375
BatSleep.loop5:
        C=DAT0  1                                * 00378
        ?C#A    P                                * 0037C
        GOYES   BatSleep.loop5                   * 0037F
        C=RSTK                                   * 00381
        D0=(2)  #2E                              * 00383
        DAT0=C  B                                * 00387
        GOSBVL  ScrOn+                           * 0038A
        GOSBVL  T1Nap                            * 00391
        D0=(2)  #08                              * 00398
        C=DAT0  1                                * 0039C
        ?CBIT=1 0                                * 003A0
        GOYES   BatSleep.loop3                   * 003A5
        D0=(2)  #0E                              * 003A7
        LC(1)   #C                               * 003AB
        DAT0=C  1                                * 003AE
        C=RSTK                                   * 003B2
        D0=(2)  #2E                              * 003B4
        DAT0=C  B                                * 003B8
        RTNCC                                    * 003BB
        BSS     3                                * 003BD  zeros

* refs (1): 001C3
* -> : interrupt service for the serial port: if it is on (IOC bit 3) and a byte waits, move received bytes into the ring buffer at #80319 (status at #80519), handling XON/XOFF, and wait out one character time before giving up
SrvcSerial:
        P=      0                                * 003C0
        D0=(5)  IOC                              * 003C2
        A=DAT0  1                                * 003C9
        ?ABIT=0 3                                * 003CD
        RTNYES                                   * 003D2
        ABIT=0  2                                * 003D4
        DAT0=A  1                                * 003D9
        ABIT=0  3                                * 003DD
        ?A=0    P                                * 003E2
        RTNYES                                   * 003E5
        D0=(2)  #11                              * 003E7
        A=DAT0  XS                               * 003EB
        ABIT=0  11                               * 003EF
        ?A=0    XS                               * 003F4
        RTNYES                                   * 003F7
        INTOFF                                   * 003F9
        D0=(2)  #0C                              * 003FD
        C=DAT0  1                                * 00401
        D1=(4)  #0654                            * 00405
        DAT1=C  1                                * 0040B
        CBIT=1  1                                * 0040F
        DAT0=C  1                                * 00414
SrvcSerial.loop1:
        GOSBVL  SUB_7011B                        * 00418
        GOC     SrvcSerial.L5                    * 0041F
        D0=(2)  #0D                              * 00422
        A=0     A                                * 00426
        A=DAT0  1                                * 00428
        ABIT=0  3                                * 0042C
        C=A     A                                * 00431
        A=A+A   A                                * 00433
        A=A+C   A                                * 00435
        LC(5)   SrvcSerial.L4                    * 00437  table of 3-nibble entries, indexed by 3*A
        C=C+A   A                                * 0043E
        D0=C                                     * 00440
        A=DAT0  X                                * 00443
        D0=(5)  TIMER2                           * 00447
        C=DAT0  X                                * 0044E
        C=C-A   X                                * 00452
SrvcSerial.loop2:
        D0=(2)  #38                              * 00455
        A=DAT0  X                                * 00459
        ?C=A    X                                * 0045D
        GOYES   SrvcSerial.L3                    * 00460
        GOSBVL  SUB_7011B                        * 00462
        GOC     SrvcSerial.L5                    * 00469
        GONC    SrvcSerial.loop2                 * 0046C
SrvcSerial.L3:
        D1=(4)  #0654                            * 0046F
        C=DAT1  1                                * 00475
        D0=(2)  #0C                              * 00479
        DAT0=C  1                                * 0047D
        INTON                                    * 00481
        RTNSC                                    * 00485

* Time-out in TIMER2 ticks for one character at each baud code
* Time-out ticks by baud code 0-7 (read at #00437)
SrvcSerial.L4:
        CON(3)  #12C                             * 00487  entry 0
        CON(3)  #0BC                             * 0048A  entry 1
        CON(3)  #096                             * 0048D  entry 2
        CON(3)  #05E                             * 00490  entry 3
        CON(3)  #04B                             * 00493  entry 4
        CON(3)  #02F                             * 00496  entry 5
        CON(3)  #026                             * 00499  entry 6
        CON(3)  #017                             * 0049C  entry 7
SrvcSerial.L5:
        ?ABIT=0 8                                * 0049F
        GOYES   SrvcSerial.L6                    * 004A4
        D0=(2)  #14                              * 004A6
        A=DAT0  B                                * 004AA
        B=A     A                                * 004AD
SrvcSerial.L6:
        D1=(4)  #0519                            * 004AF
        C=DAT1  7                                * 004B5
        ?ABIT=0 10                               * 004B9
        GOYES   SrvcSerial.L7                    * 004BE
        D0=(2)  #13                              * 004C0
        DAT0=A  1                                * 004C4
        CBIT=1  8                                * 004C8
        GONC    SrvcSerial.L10                   * 004CD
SrvcSerial.L7:
        P=      5                                * 004D0
        A=C     P                                * 004D2
        A=A+A   P                                * 004D5
        P=      0                                * 004D8
        GONC    SrvcSerial.L10                   * 004DA
        D=C     W                                * 004DD
        LA(2)   #13                              * 004E0
        GOSBVL  SUB_70134                        * 004E7
        C=D     W                                * 004EE
        ?A=B    B                                * 004F1
        GOYES   SrvcSerial.L8                    * 004F4
        LA(2)   #11                              * 004F6
        GOSBVL  SUB_70134                        * 004FD
        C=D     W                                * 00504
        ?A#B    B                                * 00507
        GOYES   SrvcSerial.L10                   * 0050A
        P=      5                                * 0050C
        A=C     P                                * 0050E
        LC(1)   #B                               * 00511
        C=C&A   P                                * 00514
        GONC    SrvcSerial.L9                    * 00518
SrvcSerial.L8:
        P=      5                                * 0051B
        A=C     P                                * 0051D
        LC(1)   #4                               * 00520
        C=C!A   P                                * 00523
SrvcSerial.L9:
        D1=(4)  #051E                            * 00527
        DAT1=C  P                                * 0052D
        P=      0                                * 00531
        GOTO    SrvcSerial.loop1                 * 00533
SrvcSerial.L10:
        ?C#0    XS                               * 00537
        GOYES   SrvcSerial.L11                   * 0053A
        C=C+1   B                                * 0053C
        GONC    SrvcSerial.L11                   * 0053F
        C=C-1   B                                * 00542
        CBIT=1  11                               * 00545
SrvcSerial.L11:
        D1=(4)  #0519                            * 0054A
        DAT1=C  7                                * 00550
        ?C#0    XS                               * 00554
        GOYES   SrvcSerial.L12                   * 00557
        A=C     A                                * 00559
        ASR     A                                * 0055B
        ASR     A                                * 0055D
        ASR     A                                * 0055F
        A=A+C   B                                * 00561
        A=A-1   B                                * 00564
        A=A+A   A                                * 00567
        D1=(4)  #0319                            * 00569
        CD1EX                                    * 0056F
        C=C+A   A                                * 00572
        CD1EX                                    * 00574
        A=B     A                                * 00577
        DAT1=A  B                                * 00579
SrvcSerial.L12:
        D1=(4)  #0519                            * 0057C
        A=DAT1  X                                * 00582
        LC(2)   #DF                              * 00586
        ?C<=A   B                                * 0058A
        GOYES   SrvcSerial.L13                   * 0058D
        ?A=0    XS                               * 0058F
        GOYES   SrvcSerial.L15                   * 00592
SrvcSerial.L13:
        D1=(4)  #051E                            * 00594
        A=DAT1  1                                * 0059A
        LC(1)   #3                               * 0059E
        A=A&C   P                                * 005A1
        LC(1)   #2                               * 005A5
        ?C#A    P                                * 005A8
        GOYES   SrvcSerial.L15                   * 005AB
        D0=(2)  #12                              * 005AD
        A=DAT0  1                                * 005B1
        ?ABIT=1 0                                * 005B5
        GOYES   SrvcSerial.L14                   * 005BA
        LA(2)   #13                              * 005BC
        GOSBVL  ByteParity                       * 005C3
        GOSBVL  SUB_7015D                        * 005CA
        GOTO    SrvcSerial.loop1                 * 005D1
SrvcSerial.L14:
        D1=D1+  1                                * 005D5
        A=DAT1  1                                * 005D8
        ABIT=1  3                                * 005DC
        DAT1=A  1                                * 005E1
SrvcSerial.L15:
        GOTO    SrvcSerial.loop1                 * 005E5
        BSS     3                                * 005E9  zeros

* refs (1): 0021F
* -> : TIMER1 interrupt: if TIMER1 went negative, count down the nibble at #808CC and re-arm the timer while a key is held or the bit at #80805 asks for it; otherwise stop TIMER1
SrvcTimer1:
        P=      0                                * 005EC
        SETHEX                                   * 005EE
        D0=(5)  TIMER1CTRL                       * 005F0
        A=DAT0  1                                * 005F7
        ?ABIT=1 3                                * 005FB
        GOYES   SrvcTimer1.L1                    * 00600
        RTNCC                                    * 00602
SrvcTimer1.L1:
        GOSUB   AD1=IRAM~jump                    * 00604
        D1=(4)  #08CC                            * 00608
        C=DAT1  1                                * 0060E
        C=C-1   P                                * 00612
        GOC     SrvcTimer1.L2                    * 00615
        DAT1=C  1                                * 00618
SrvcTimer1.L2:
        LA(4)   #0801                            * 0061C
        LC(3)   #205                             * 00625
        A=C     B                                * 0062A
        D1=A                                     * 0062D
        A=DAT1  XS                               * 00630
        A=A&C   XS                               * 00634
        ?A#0    XS                               * 00638
        GOYES   ArmKeyPoll                       * 0063B
        D1=(4)  #065C                            * 0063D
        C=0     W                                * 00643
        C=DAT1  13                               * 00646
        ?C#0    W                                * 0064A
        GOYES   ArmKeyPoll                       * 0064D
        DAT0=C  1                                * 0064F
        RTNSC                                    * 00653

* refs (5): 00638 0064A 008C9 01F5D 04214
* -> : TIMER1 = 0 with wake and interrupt enabled (control 6): it fires at the next 1/16 s tick, which is how a held key gets scanned again
ArmKeyPoll:
        D0=(5)  TIMER1CTRL                       * 00655
        P=      0                                * 0065C
        LC(1)   #6                               * 0065E
        DAT0=C  1                                * 00661
        D0=(2)  #37                              * 00665
        LC(1)   #0                               * 00669
        DAT0=C  1                                * 0066C
        RTNSC                                    * 00670

* refs (6): 00223 02141 041F9 043F8 04550 0E1C5
* -> : read the battery and card status, update the low-battery nibble #80840, set or clear the alert bit in the annunciator byte #80841, and refresh the annunciators
CkLowBat:
        GOSUB   WaitCardStat                     * 00672
        CSR     A                                * 00676
        CSR     A                                * 00678
        C=C+C   A                                * 0067A
        C=C+C   A                                * 0067C
        CBIT=1  1                                * 0067E
        GOSUB   ReadLowBat                       * 00683
        B=A     B                                * 00687
        BSR     A                                * 0068A
        GOSUB   D1=IRAM~jump                     * 0068C
        D1=(4)  #0840                            * 00690
        C=DAT1  1                                * 00696
        C=C&B   P                                * 0069A
        A=A!C   P                                * 0069E
        D1=(4)  #0833                            * 006A2
        A=DAT1  XS                               * 006A8
        D1=(4)  #0832                            * 006AC
        C=DAT1  XS                               * 006B2
        A=A!C   XS                               * 006B6
        ?A=0    XS                               * 006BA
        GOYES   CkLowBat.L1                      * 006BD
        A=A+1   A                                * 006BF
CkLowBat.L1:
        D1=(4)  #0840                            * 006C1
        DAT1=A  1                                * 006C7
        D1=(4)  #0841                            * 006CB
        C=DAT1  B                                * 006D1
        CBIT=0  3                                * 006D4
        ?A=0    P                                * 006D9
        GOYES   CkLowBat.L2                      * 006DC
        CBIT=1  3                                * 006DE
CkLowBat.L2:
        DAT1=C  B                                * 006E3
        GOVLNG  ShowHeldAnn.L1                   * 006E6

* refs (2): 00683 325B1
* C.A = mask of bits wanted -> A.B = bits of #00108, sampled six times with the detector enabled (#00109 = #C, then 4 again); carry set if bit 1 (main battery low) is on
ReadLowBat:
        B=C     A                                * 006ED
        D0=(5)  DA1BadMASK                       * 006EF
        LC(1)   #C                               * 006F6
        DAT0=C  1                                * 006F9
        D0=(2)  #08                              * 006FD
        LC(3)   #50F                             * 00701
        A=C     A                                * 00706
ReadLowBat.loop1:
        C=DAT0  1                                * 00708
        C=C&B   P                                * 0070C
        A=A&C   P                                * 00710
        CSL     B                                * 00714
        A=A!C   B                                * 00717
        C=C-1   XS                               * 0071B
        GONC    ReadLowBat.loop1                 * 0071E
        D0=(2)  #09                              * 00721
        LC(1)   #4                               * 00725
        DAT0=C  1                                * 00728
        ?ABIT=1 1                                * 0072C
        RTNYES                                   * 00731
        RTN                                      * 00733

* refs (6): 00672 0443A 81099 810A6 81102 81183
* -> C.XS = card status (#0010F), read after writing #C to #0010E and waiting for 5 ticks of TIMER2 so the lines settle
WaitCardStat:
        P=      0                                * 00735
        SETHEX                                   * 00737
        D0=(5)  NOP1MASK14                       * 00739
        LC(1)   #C                               * 00740
        DAT0=C  1                                * 00743
        D0=(2)  #38                              * 00747
        A=DAT0  1                                * 0074B
        LC(1)   #5                               * 0074F
        A=A-C   P                                * 00752
WaitCardStat.loop1:
        C=DAT0  1                                * 00755
        ?C#A    P                                * 00759
        GOYES   WaitCardStat.loop1               * 0075C
        D0=(2)  #0F                              * 0075E
        C=DAT0  XS                               * 00762
        RTNCC                                    * 00766
* Keyboard interrupt: nothing to do while #8065B says scanning is off; otherwise read the matrix (BITMAP), debounce, and hand changes to SrvcKbdAB
WaitCardStat.L2:
        GOSUB   D1=IRAM~jump                     * 00768
        D1=(4)  #065B                            * 0076C
        C=DAT1  S                                * 00772
        ?C=0    S                                * 00776
        GOYES   WaitCardStat.L3                  * 00779
        P=      0                                * 0077B
        RTNCC                                    * 0077D
WaitCardStat.L3:
        GOSUB   BITMAP                           * 0077F
        B=A     W                                * 00783
        ?A#0    W                                * 00786
        GOYES   WaitCardStat.L5                  * 00789
        D1=(4)  #065C                            * 0078B
        C=0     W                                * 00791
        C=DAT1  13                               * 00794
        ?C#0    W                                * 00798
        GOYES   WaitCardStat.L5                  * 0079B
WaitCardStat.L4:
        RSI                                      * 0079D
        P=      0                                * 007A2
        RTNCC                                    * 007A4
WaitCardStat.L5:
        GOSUB   Debounce                         * 007A6  inline data follows
        ?ABIT=0 0                                * 007AA
        GOYES   SrvcKbdAB                        * 007AF
        GOTO    SrvcKbdAB.L17                    * 007B1

* ( A.W -> ) Sets KEYSTATE and KEYBUFFER
* refs (2): 007AA 02818
SrvcKbdAB:
        GOSUB   D1=IRAM~jump                     * 007B5
        LC(1)   #3                               * 007B9
SrvcKbdAB.loop1:
        ?B=0    W                                * 007BC
        GOYES   SrvcKbdAB.L4                     * 007BF
SrvcKbdAB.loop2:
        ?B#0    P                                * 007C1
        GOYES   SrvcKbdAB.loop3                  * 007C4
        BSR     W                                * 007C6
        GONC    SrvcKbdAB.loop1                  * 007C9
SrvcKbdAB.loop3:
        B=B+B   P                                * 007CC
        GONC    SrvcKbdAB.loop3                  * 007CF
        C=C-1   P                                * 007D2
        GONC    SrvcKbdAB.loop2                  * 007D5
        GOTO    SrvcKbdAB.L18                    * 007D8
SrvcKbdAB.L4:
        GOSUB   KeyShiftBits                     * 007DC
        D=C     S                                * 007E0
        D1=(4)  #065C                            * 007E3
        C=0     W                                * 007E9
        C=DAT1  13                               * 007EC
        DAT1=A  13                               * 007F0
        ?A#0    W                                * 007F4
        GOYES   SrvcKbdAB.L5                     * 007F7
        GOTO    WaitCardStat.L4                  * 007F9
SrvcKbdAB.L5:
        ?C#A    W                                * 007FD
        GOYES   SrvcKbdAB.L6                     * 00800
        GOTO    SrvcKbdAB.L18                    * 00802
SrvcKbdAB.L6:
        P=      12                               * 00806
        C=-C-1  WP                               * 00808
        A=A&C   WP                               * 0080B
        ?A#0    W                                * 0080F
        GOYES   SrvcKbdAB.L7                     * 00812
        GOTO    SrvcKbdAB.L18                    * 00814
SrvcKbdAB.L7:
        GOSUB   KeyShiftBits                     * 00818
        B=C     S                                * 0081C
        LC(6)   #7DF7FF                          * 0081F
        P=      5                                * 00827
        A=A&C   WP                               * 00829
        P=      0                                * 0082D
        ASRB                                     * 0082F
        ?A#0    W                                * 00832
        GOYES   SrvcKbdAB.L9                     * 00835
        C=B     S                                * 00837
        GOSUB   ShiftBits>Plane                  * 0083A
        GONC    SrvcKbdAB.L8                     * 0083E
        GOTO    SrvcKbdAB.L16                    * 00841
SrvcKbdAB.L8:
        B=C     W                                * 00845
        GONC    SrvcKbdAB.loop14                 * 00848
SrvcKbdAB.L9:
        C=D     S                                * 0084B
        GOSUB   ShiftBits>Plane                  * 0084E
        D=C     A                                * 00852
        GOC     SrvcKbdAB.L16                    * 00854
        D0=(5)  SUB_00A37.L3+1                   * 00857
        B=0     W                                * 0085E
        GONC    SrvcKbdAB.L11                    * 00861
SrvcKbdAB.loop10:
        ASR     W                                * 00864
SrvcKbdAB.L11:
        D0=D0+  8                                * 00867
SrvcKbdAB.loop12:
        ?A=0    P                                * 0086A
        GOYES   SrvcKbdAB.loop10                 * 0086D
        SB=0                                     * 0086F
        ASRB                                     * 00872
        ?SB=0                                    * 00875
        GOYES   SrvcKbdAB.L13                    * 00878
        BSL     W                                * 0087A
        BSL     W                                * 0087D
        C=DAT0  B                                * 00880
        C=C!D   B                                * 00883
        B=C     B                                * 00887
SrvcKbdAB.L13:
        D0=D0+  2                                * 0088A
        ?A#0    W                                * 0088D
        GOYES   SrvcKbdAB.loop12                 * 00890
SrvcKbdAB.loop14:
        C=B     A                                * 00892
        GOSUB   KeyBufPut                        * 00894
        GOC     SrvcKbdAB.L15                    * 00898
        BSR     W                                * 0089B
        BSR     W                                * 0089E
        ?B#0    W                                * 008A1
        GOYES   SrvcKbdAB.loop14                 * 008A4
        GONC    SrvcKbdAB.L18                    * 008A6
SrvcKbdAB.L15:
        GOSBVL  getBPOFF                         * 008A9
        ?ST=1   4                                * 008B0
        GOYES   SrvcKbdAB.L16                    * 008B3
        LC(2)   #F9                              * 008B5
        GOSBVL  RCKBp                            * 008B9
SrvcKbdAB.L16:
        GOSUB   ClrKeyState                      * 008C0
SrvcKbdAB.L17:
        RSI                                      * 008C4
SrvcKbdAB.L18:
        GOSUB   ArmKeyPoll                       * 008C9
        GOSUB   SUB_00A37                        * 008CD
        RTNC                                     * 008D1
        GOTO    WaitCardStat.L2                  * 008D4

* refs (11): 0023A 0068C 00768 007B5 00D8E 00FF8 ...
D1=IRAM~jump:
        GOVLNG  D1=IRAM                          * 008D8

* refs (1): 00604
AD1=IRAM~jump:
        GOVLNG  AD1=IRAM                         * 008DF

* refs (4): 0077F 009C5 00E73 0ED47
BITMAP:
        P=      0                                * 008E6
        LC(3)   #001                             * 008E8
        CAEX    W                                * 008ED
        C=A     X                                * 008F0
        OUT=C                                    * 008F3
        C=IN                                     * 008F6
        CSRC                                     * 008F9
        SB=0                                     * 008FC
        CSRB                                     * 008FF
        ?SB=0                                    * 00902
        GOYES   BITMAP.loop1                     * 00905
        CPEX    15                               * 00907
        C=P     0                                * 0090B
        CBIT=1  3                                * 0090F
        P=C     0                                * 00914
        CPEX    15                               * 00918
BITMAP.loop1:
        ?ABIT=1 3                                * 0091C
        GOYES   BITMAP.loop2                     * 00921
        A=A+A   X                                * 00923
        C=A     X                                * 00926
        OUT=C                                    * 00929
        C=IN                                     * 0092C
        CSRC                                     * 0092F
        CSRC                                     * 00932
        C=C+C   W                                * 00935
        C=C+C   W                                * 00938
        GOTO    BITMAP.loop1                     * 0093B
BITMAP.loop2:
        ?ABIT=1 8                                * 0093F
        GOYES   BITMAP.L3                        * 00944
        A=A+A   X                                * 00946
        C=A     X                                * 00949
        OUT=C                                    * 0094C
        C=0     X                                * 0094F
        C=IN                                     * 00952
        CSRC                                     * 00955
        SB=0                                     * 00958
        CSRB                                     * 0095B
        ?SB=0                                    * 0095E
        GOYES   BITMAP.loop2                     * 00961
        CPEX    15                               * 00963
        C=P     0                                * 00967
        CBIT=1  3                                * 0096B
        P=C     0                                * 00970
        CPEX    15                               * 00974
        GONC    BITMAP.loop2                     * 00978
        BSS     1                                * 0097B  zeros
BITMAP.L3:
        LC(3)   #1FF                             * 0097C
        OUT=C                                    * 00981
        C=IN                                     * 00984
        CSR     W                                * 00987
        CSR     W                                * 0098A
        CSR     W                                * 0098D
        CSRB                                     * 00990
        CSRB                                     * 00993
        CSRB                                     * 00996
        CAEX    W                                * 00999
        ?ABIT=1 0                                * 0099C
        RTNYES                                   * 009A1
        RTNCC                                    * 009A3

* Scans keyboard until no more instabilities detected returns a map of the pressed keys in A.W Uses A.W B.W C.W D.A D0 P
* refs (2): 007A6 00C80
Debounce:
        C=RSTK                                   * 009A5
        D=C     A                                * 009A7
        D0=(5)  #00139                           * 009A9
Debounce.loop1:
        C=DAT0  S                                * 009B0
        P=      14                               * 009B4
        LC(1)   #5                               * 009B6
Debounce.loop2:
        A=DAT0  S                                * 009B9
        ?C=A    S                                * 009BD
        GOYES   Debounce.loop2                   * 009C0
        C=A     S                                * 009C2
        GOSUB   BITMAP                           * 009C5
        ABEX    W                                * 009C9
        ?A#B    W                                * 009CC
        GOYES   Debounce.loop1                   * 009CF
        P=      14                               * 009D1
        C=C-1   P                                * 009D3
        GONC    Debounce.loop2                   * 009D6
        P=      0                                * 009D9
        C=D     A                                * 009DB
        PC=C                                     * 009DD

* refs (2): 007DC 00818
* A.W = key map from BITMAP -> C.S = three bits: the alpha, left and right shift keys held (map bits 23, 17, 11)
KeyShiftBits:
        C=A     W                                * 009E1
        CSR     W                                * 009E4
        CSL     X                                * 009E7
        P=      3                                * 009EA
        C=C+C   P                                * 009EC
        C=C+C   P                                * 009EF
        P=      13                               * 009F2
KeyShiftBits.loop1:
        C=C+C   S                                * 009F4
        C=C+C   XS                               * 009F7
        GONC    KeyShiftBits.L2                  * 009FA
        C=C+1   S                                * 009FD
KeyShiftBits.L2:
        CSR     A                                * 00A00
        P=P+1                                    * 00A02
        GONC    KeyShiftBits.loop1               * 00A04
        RTNCC                                    * 00A07

* refs (2): 0083A 0084E
* C.S = held shift bits -> C.A = their keycode plane in the high nibble of a byte; carry set if the combination is not allowed
ShiftBits>Plane:
        D0=(5)  ShiftBits>Plane.L2               * 00A09
        P=C     15                               * 00A10
        C=0     W                                * 00A14
ShiftBits>Plane.loop1:
        C=DAT0  1                                * 00A17
        D0=D0+  1                                * 00A1B
        P=P-1                                    * 00A1E
        GONC    ShiftBits>Plane.loop1            * 00A20
        P=      0                                * 00A23
        C=C+1   P                                * 00A25
        C=C-1   P                                * 00A28
        CSL     A                                * 00A2B
        RTN                                      * 00A2D
* Plane nibble by value of C.S; F marks a combination that is refused
ShiftBits>Plane.L2:
        NIBHEX  084FCFFF                         * 00A2F  ∡ôüÿ

* refs (1): 008CD
* Probably: after a key scan, decides if the 1/16 s TIMER1 tick is close enough that a rescan is not needed (carry set); carry clear makes SrvcKbdAB scan again
SUB_00A37:
        D0=(5)  TIMER1CTRL                       * 00A37
        A=DAT0  1                                * 00A3E
        P=      0                                * 00A42
        LC(1)   #6                               * 00A44
        A=A&C   P                                * 00A47
        ?C=A    P                                * 00A4B
        GOYES   SUB_00A37.L1                     * 00A4E
        RTNCC                                    * 00A50
SUB_00A37.L1:
        D0=(2)  #37                              * 00A52
        C=0     A                                * 00A56
        C=DAT0  1                                * 00A58
        ?CBIT=1 3                                * 00A5C
        RTNYES                                   * 00A61
        ?C=0    A                                * 00A63
        GOYES   SUB_00A37.L2                     * 00A66
        RTNCC                                    * 00A68
SUB_00A37.L2:
        LC(3)   #1FF                             * 00A6A
        A=C     A                                * 00A6F
        D0=(2)  #38                              * 00A71
        C=DAT0  X                                * 00A75
        A=A&C   X                                * 00A79
        LC(3)   #137                             * 00A7D
SUB_00A37.L3:
        ?C>=A   X                                * 00A82
        RTNYES                                   * 00A85
        RTNCC                                    * 00A87

* Keycode for each bit of BITMAP's key map (bit 0 ON, then OUT0-OUT8 by IN line); read at #00880 from the table plus 2 (bit 0 is dropped)
KeyBitCodes:
        CON(2)  #2D                              * 00A89  entry 0
        CON(2)  #31                              * 00A8B  entry 1
        CON(2)  #30                              * 00A8D  entry 2
        CON(2)  #2F                              * 00A8F  entry 3
        CON(2)  #2E                              * 00A91  entry 4
        CON(2)  #0D                              * 00A93  entry 5
        CON(2)  #2C                              * 00A95  entry 6
        CON(2)  #2B                              * 00A97  entry 7
        CON(2)  #2A                              * 00A99  entry 8
        CON(2)  #29                              * 00A9B  entry 9
        CON(2)  #01                              * 00A9D  entry 10
        CON(2)  #C0                              * 00A9F  entry 11
        CON(2)  #27                              * 00AA1  entry 12
        CON(2)  #26                              * 00AA3  entry 13
        CON(2)  #25                              * 00AA5  entry 14
        CON(2)  #24                              * 00AA7  entry 15
        CON(2)  #07                              * 00AA9  entry 16
        CON(2)  #40                              * 00AAB  entry 17
        CON(2)  #22                              * 00AAD  entry 18
        CON(2)  #21                              * 00AAF  entry 19
        CON(2)  #20                              * 00AB1  entry 20
        CON(2)  #1F                              * 00AB3  entry 21
        CON(2)  #13                              * 00AB5  entry 22
        CON(2)  #80                              * 00AB7  entry 23
        CON(2)  #1D                              * 00AB9  entry 24
        CON(2)  #1C                              * 00ABB  entry 25
        CON(2)  #1B                              * 00ABD  entry 26
        CON(2)  #1A                              * 00ABF  entry 27
        CON(2)  #19                              * 00AC1  entry 28
        CON(2)  #18                              * 00AC3  entry 29
        CON(2)  #17                              * 00AC5  entry 30
        CON(2)  #16                              * 00AC7  entry 31
        CON(2)  #15                              * 00AC9  entry 32
        CON(2)  #14                              * 00ACB  entry 33
        CON(2)  #12                              * 00ACD  entry 34
        CON(2)  #11                              * 00ACF  entry 35
        CON(2)  #10                              * 00AD1  entry 36
        CON(2)  #0F                              * 00AD3  entry 37
        CON(2)  #0E                              * 00AD5  entry 38
        CON(2)  #0C                              * 00AD7  entry 39
        CON(2)  #0B                              * 00AD9  entry 40
        CON(2)  #0A                              * 00ADB  entry 41
        CON(2)  #09                              * 00ADD  entry 42
        CON(2)  #08                              * 00ADF  entry 43
        CON(2)  #06                              * 00AE1  entry 44
        CON(2)  #05                              * 00AE3  entry 45
KeyBitCodes.L1:
        CON(2)  #04                              * 00AE5  entry 46
        CON(2)  #03                              * 00AE7  entry 47
        CON(2)  #02                              * 00AE9  entry 48

* Key matrix by keycode 1-49: OUT mask and IN mask (read at #00CD3); key 45 (ON) is 0
        CON(3)  #002                             * 00AEB  entry 0
        CON(3)  #010                             * 00AEE
        CON(3)  #100                             * 00AF1  entry 1
        CON(3)  #010                             * 00AF4
        CON(3)  #100                             * 00AF7  entry 2
        CON(3)  #008                             * 00AFA
        CON(3)  #100                             * 00AFD  entry 3
        CON(3)  #004                             * 00B00
        CON(3)  #100                             * 00B03  entry 4
        CON(3)  #002                             * 00B06
        CON(3)  #100                             * 00B09  entry 5
        CON(3)  #001                             * 00B0C
        CON(3)  #004                             * 00B0F  entry 6
        CON(3)  #010                             * 00B12
        CON(3)  #080                             * 00B15  entry 7
        CON(3)  #010                             * 00B18
        CON(3)  #080                             * 00B1B  entry 8
        CON(3)  #008                             * 00B1E
        CON(3)  #080                             * 00B21  entry 9
        CON(3)  #004                             * 00B24
        CON(3)  #080                             * 00B27  entry 10
        CON(3)  #002                             * 00B2A
        CON(3)  #080                             * 00B2D  entry 11
        CON(3)  #001                             * 00B30
        CON(3)  #001                             * 00B33  entry 12
        CON(3)  #010                             * 00B36
        CON(3)  #040                             * 00B39  entry 13
        CON(3)  #010                             * 00B3C
        CON(3)  #040                             * 00B3F  entry 14
        CON(3)  #008                             * 00B42
        CON(3)  #040                             * 00B45  entry 15
        CON(3)  #004                             * 00B48
        CON(3)  #040                             * 00B4B  entry 16
        CON(3)  #002                             * 00B4E
        CON(3)  #040                             * 00B51  entry 17
        CON(3)  #001                             * 00B54
        CON(3)  #008                             * 00B57  entry 18
        CON(3)  #010                             * 00B5A
        CON(3)  #020                             * 00B5D  entry 19
        CON(3)  #010                             * 00B60
        CON(3)  #020                             * 00B63  entry 20
        CON(3)  #008                             * 00B66
        CON(3)  #020                             * 00B69  entry 21
        CON(3)  #004                             * 00B6C
        CON(3)  #020                             * 00B6F  entry 22
        CON(3)  #002                             * 00B72
        CON(3)  #020                             * 00B75  entry 23
        CON(3)  #001                             * 00B78
        CON(3)  #010                             * 00B7B  entry 24
        CON(3)  #010                             * 00B7E
        CON(3)  #010                             * 00B81  entry 25
        CON(3)  #008                             * 00B84
        CON(3)  #010                             * 00B87  entry 26
        CON(3)  #004                             * 00B8A
        CON(3)  #010                             * 00B8D  entry 27
        CON(3)  #002                             * 00B90
        CON(3)  #010                             * 00B93  entry 28
        CON(3)  #001                             * 00B96
        CON(3)  #008                             * 00B99  entry 29
        CON(3)  #020                             * 00B9C
        CON(3)  #008                             * 00B9F  entry 30
        CON(3)  #008                             * 00BA2
        CON(3)  #008                             * 00BA5  entry 31
        CON(3)  #004                             * 00BA8
        CON(3)  #008                             * 00BAB  entry 32
        CON(3)  #002                             * 00BAE
        CON(3)  #008                             * 00BB1  entry 33
        CON(3)  #001                             * 00BB4
        CON(3)  #004                             * 00BB7  entry 34
        CON(3)  #020                             * 00BBA
        CON(3)  #004                             * 00BBD  entry 35
        CON(3)  #008                             * 00BC0
        CON(3)  #004                             * 00BC3  entry 36
        CON(3)  #004                             * 00BC6
        CON(3)  #004                             * 00BC9  entry 37
        CON(3)  #002                             * 00BCC
        CON(3)  #004                             * 00BCF  entry 38
        CON(3)  #001                             * 00BD2
        CON(3)  #002                             * 00BD5  entry 39
        CON(3)  #020                             * 00BD8
        CON(3)  #002                             * 00BDB  entry 40
        CON(3)  #008                             * 00BDE
        CON(3)  #002                             * 00BE1  entry 41
        CON(3)  #004                             * 00BE4
        CON(3)  #002                             * 00BE7  entry 42
        CON(3)  #002                             * 00BEA
        CON(3)  #002                             * 00BED  entry 43
        CON(3)  #001                             * 00BF0
        CON(3)  #000                             * 00BF3  entry 44
        CON(3)  #000                             * 00BF6
        CON(3)  #001                             * 00BF9  entry 45
        CON(3)  #008                             * 00BFC
        CON(3)  #001                             * 00BFF  entry 46
KeyBitCodes.L2:
        CON(3)  #004                             * 00C02
        CON(3)  #001                             * 00C05  entry 47
        CON(3)  #002                             * 00C08
        CON(3)  #001                             * 00C0B  entry 48
        CON(3)  #001                             * 00C0E

* Keycodes in keyboard order without ON, shifts as #80/#40/#C0: nothing reads it (a copy of the self-test's list)
        CON(2)  #01                              * 00C11  entry 0
        CON(2)  #02                              * 00C13  entry 1
        CON(2)  #03                              * 00C15  entry 2
        CON(2)  #04                              * 00C17  entry 3
        CON(2)  #05                              * 00C19  entry 4
        CON(2)  #06                              * 00C1B  entry 5
        CON(2)  #07                              * 00C1D  entry 6
        CON(2)  #08                              * 00C1F  entry 7
        CON(2)  #09                              * 00C21  entry 8
        CON(2)  #0A                              * 00C23  entry 9
        CON(2)  #0B                              * 00C25  entry 10
        CON(2)  #0C                              * 00C27  entry 11
        CON(2)  #0D                              * 00C29  entry 12
        CON(2)  #0E                              * 00C2B  entry 13
        CON(2)  #0F                              * 00C2D  entry 14
        CON(2)  #10                              * 00C2F  entry 15
        CON(2)  #11                              * 00C31  entry 16
        CON(2)  #12                              * 00C33  entry 17
        CON(2)  #13                              * 00C35  entry 18
        CON(2)  #14                              * 00C37  entry 19
        CON(2)  #15                              * 00C39  entry 20
        CON(2)  #16                              * 00C3B  entry 21
        CON(2)  #17                              * 00C3D  entry 22
        CON(2)  #18                              * 00C3F  entry 23
        CON(2)  #19                              * 00C41  entry 24
        CON(2)  #1A                              * 00C43  entry 25
        CON(2)  #1B                              * 00C45  entry 26
        CON(2)  #1C                              * 00C47  entry 27
        CON(2)  #1D                              * 00C49  entry 28
        CON(2)  #80                              * 00C4B  entry 29
        CON(2)  #1F                              * 00C4D  entry 30
        CON(2)  #20                              * 00C4F  entry 31
        CON(2)  #21                              * 00C51  entry 32
        CON(2)  #22                              * 00C53  entry 33
        CON(2)  #40                              * 00C55  entry 34
        CON(2)  #24                              * 00C57  entry 35
        CON(2)  #25                              * 00C59  entry 36
        CON(2)  #26                              * 00C5B  entry 37
        CON(2)  #27                              * 00C5D  entry 38
        CON(2)  #C0                              * 00C5F  entry 39
        CON(2)  #29                              * 00C61  entry 40
        CON(2)  #2A                              * 00C63  entry 41
        CON(2)  #2B                              * 00C65  entry 42
        CON(2)  #2C                              * 00C67  entry 43
        CON(2)  #2E                              * 00C69  entry 44
        CON(2)  #2F                              * 00C6B  entry 45
        CON(2)  #30                              * 00C6D  entry 46
        CON(2)  #31                              * 00C6F  entry 47
        CON(2)  0                                * 00C71  end of table
        BSS     1                                * 00C73  zeros

* Carry if true
* refs (6): 00227 0441D 30F42 328D9 D448A D4518
OnKeyDown?:
        C=IN                                     * 00C74
        ?CBIT=1 15                               * 00C77
        RTNYES                                   * 00C7C
        RTN                                      * 00C7E

* Carry if true
* refs (2): 0280E 04382
OnKeyStable?:
        GOSUB   Debounce                         * 00C80  inline data follows
        ?ABIT=1 0                                * 00C84
        RTNYES                                   * 00C89
        RTN                                      * 00C8B

* refs (2): 04805 814BE
* A.B = keycode 1-49, or #80 for alpha, #40 for left shift -> carry set if that key is held now. ON (#2D) and bad codes return carry clear. The matrix table gives the OUT and IN masks
KeyDown?:
        P=      0                                * 00C8D
        LC(2)   #80                              * 00C8F
        ?C#A    B                                * 00C93
        GOYES   KeyDown?.L1                      * 00C96
        LC(2)   #1E                              * 00C98
        A=C     B                                * 00C9C
KeyDown?.L1:
        LC(2)   #40                              * 00C9F
        ?C#A    B                                * 00CA3
        GOYES   KeyDown?.L2                      * 00CA6
        LC(2)   #23                              * 00CA8
        A=C     B                                * 00CAC
KeyDown?.L2:
        LC(2)   #2D                              * 00CAF
        ?C=A    B                                * 00CB3
        GOYES   KeyDown?.L3                      * 00CB6
        ?A=0    B                                * 00CB8
        GOYES   KeyDown?.L3                      * 00CBB
        LC(2)   #31                              * 00CBD
        ?C<A    B                                * 00CC1
        GOYES   KeyDown?.L3                      * 00CC4
        C=0     A                                * 00CC6
        C=A     B                                * 00CC8
        C=C+C   A                                * 00CCB
        A=C     A                                * 00CCD
        C=C+C   A                                * 00CCF
        A=A+C   A                                * 00CD1
        LC(5)   KeyBitCodes.L1                   * 00CD3  table of 6-nibble entries, indexed by 6*B
        A=A+C   A                                * 00CDA
        D1=A                                     * 00CDC
        C=DAT1  X                                * 00CDF
        D1=D1+  3                                * 00CE3
        A=DAT1  X                                * 00CE6
        P=      4                                * 00CEA
        D1=(5)  IRAM@                            * 00CEC
        C=DAT1  P                                * 00CF3
        D1=C                                     * 00CF7
        P=      0                                * 00CFA
        GOSUB   KbdOutC                          * 00CFC
        A=A&C   X                                * 00D00
        LC(3)   #1FF                             * 00D04
        GOSUB   KbdOutC                          * 00D09
        ?A#0    X                                * 00D0D
        RTNYES                                   * 00D10
KeyDown?.L3:
        RTNCC                                    * 00D12

* refs (1): 01E95
* -> carry set if left shift is held (OUT bit 2, IN bit 5)
LShiftDown?:
        LC(3)   #004                             * 00D14
        GOTO    AlphaDown?.L1                    * 00D19

* refs (1): 01EA7
* -> carry set if right shift is held (OUT bit 1, IN bit 5)
RShiftDown?:
        LC(3)   #002                             * 00D1D
        GOTO    AlphaDown?.L1                    * 00D22

* refs (1): 01E83
* -> carry set if alpha is held (OUT bit 3, IN bit 5)
AlphaDown?:
        LC(3)   #008                             * 00D26
AlphaDown?.L1:
        OUT=C                                    * 00D2B
        GOSUB   CINRTN                           * 00D2E
        ?CBIT=1 5                                * 00D32
        RTNYES                                   * 00D37
        RTN                                      * 00D39

* refs (6): 008C0 04369 047AB 80031 80EFA 80FBA
* -> : clear the 13-nibble map at #8065C of keys already seen as down
ClrKeyState:
        D1=(5)  =IR_16Hz_Clock                   * 00D3B
        C=DAT1  A                                * 00D42
        D1=C                                     * 00D45

addrKEYSTATE:
        D1=(4)  #065C                            * 00D48
        C=0     W                                * 00D4E
        DAT1=C  13                               * 00D51
        RTN                                      * 00D55

* Flushes key buffer.
* refs (5): 00D7B 020C7 04362 8106F 81E19
Flush:
        D1=(5)  =IR_16Hz_Clock                   * 00D57
        C=DAT1  A                                * 00D5E
        D1=C                                     * 00D61
        D1=(4)  #0669                            * 00D64
        C=0     A                                * 00D6A
        DAT1=C  A                                * 00D6C
        RTNCC                                    * 00D6F

* ->
* refs (16): 0DD9E 2D9DC 2DD8D 2E054 2E081 33C6A ...
FLUSHKEYS:
        CON(5)  (*)+5                            * 00D71  primitive code object
        CD1EX                                    * 00D76
        RSTK=C                                   * 00D79
        GOSUB   Flush                            * 00D7B
        C=RSTK                                   * 00D7F
        D1=C                                     * 00D81
        A=DAT0  A                                * 00D84
        D0=D0+  5                                * 00D87
        PC=(A)                                   * 00D8A

* Flushes attn counter.
* refs (4): 02053 027BF 0442C 81061
FlushAttn:
        GOSUB   D1=IRAM~jump                     * 00D8E
        D1=(4)  #07F7                            * 00D92
        C=0     A                                * 00D98
        DAT1=C  A                                * 00D9A
        RTN                                      * 00D9D

* refs (1): 00894
* C.B = keycode -> carry set if the key buffer is full; otherwise append it. #80669 is the read index, #8066A the write index, entries of 2 nibbles follow
KeyBufPut:
        A=C     A                                * 00D9F
        D1=(5)  =IR_16Hz_Clock                   * 00DA1
        C=DAT1  A                                * 00DA8
        D1=C                                     * 00DAB
        C=A     B                                * 00DAE
        CSL     A                                * 00DB1
        D1=(4)  #0669                            * 00DB3
        A=DAT1  1                                * 00DB9
        D1=D1+  1                                * 00DBD
        C=DAT1  1                                * 00DC0
        P=      0                                * 00DC4
        A=A-C   P                                * 00DC6
        A=A-1   P                                * 00DC9
        ?A=0    P                                * 00DCC
        RTNYES                                   * 00DCF
        C=C+1   P                                * 00DD1
        DAT1=C  1                                * 00DD4
        P=C     0                                * 00DD8
        P=P-1                                    * 00DDC
        CSR     A                                * 00DDE
        A=C     B                                * 00DE0
        CD1EX                                    * 00DE3
        C+P+1                                    * 00DE6
        C+P+1                                    * 00DE9
        C=C-1   A                                * 00DEC
        CD1EX                                    * 00DEE
        P=      0                                * 00DF1
        DAT1=A  B                                * 00DF3
        RTNCC                                    * 00DF6

* refs (2): 0031F 0435B
* -> carry set if IN # 0: drive no OUT line (only ON can read), remembering it in #80642
KbdOut0:
        D1=(5)  =IR_16Hz_Clock                   * 00DF8
        C=DAT1  A                                * 00DFF
        D1=C                                     * 00E02
        C=0     A                                * 00E05
        GOTO    KbdOutC                          * 00E07

* refs (8): 019AF 04377 04929 80838 80A45 80A67 ...
* -> carry set if IN # 0: drive all nine OUT lines, remembering it in #80642
KbdOutAll:
        D1=(5)  =IR_16Hz_Clock                   * 00E0B
        C=DAT1  A                                * 00E12
        D1=C                                     * 00E15
        P=      0                                * 00E18
        C=0     A                                * 00E1A
        LC(3)   #1FF                             * 00E1C

* refs (3): 00CFC 00D09 00E07
* C.X = OUT lines -> carry set if IN # 0: store C.X in #80642 (the interrupt code restores OUT from there), set OUT and read IN
KbdOutC:
        D1=(4)  #0642                            * 00E21
        DAT1=C  X                                * 00E27
        OUT=C                                    * 00E2B
        C=IN                                     * 00E2E
        ?C#0    A                                * 00E31
        RTNYES                                   * 00E34
        RTN                                      * 00E36

* refs (1): 00230
* ON is down: match the keyboard map against OnKeyTable until all keys are released. The return address pushed here counts one ATTN in #807F7; a combination replaces it
OnKeyCombo:
        P=      0                                * 00E38
        LC(5)   OnKeyTable.L7                    * 00E3A  return address, pushed with RSTK=C
        RSTK=C                                   * 00E41
        D1=(4)  #065A                            * 00E43
        A=DAT1  S                                * 00E49
        B=A     S                                * 00E4D
OnKeyCombo.loop1:
        P=      0                                * 00E50
        LC(3)   #1FF                             * 00E52
        OUT=C                                    * 00E57
        LC(5)   #0004E                           * 00E5A
        A=0     A                                * 00E61
OnKeyCombo.loop2:
        GOSUB   AINRTN                           * 00E63
        ?A#0    A                                * 00E67
        GOYES   OnKeyCombo.L3                    * 00E6A
        C=C-1   A                                * 00E6C
        GONC    OnKeyCombo.loop2                 * 00E6E
        RTN                                      * 00E71
OnKeyCombo.L3:
        GOSBVL  BITMAP                           * 00E73
        D1=(5)  OnKeyTable                       * 00E7A
        P=      12                               * 00E81
OnKeyCombo.loop4:
        C=DAT1  S                                * 00E83
        C=C-1   S                                * 00E87
        GOC     OnKeyCombo.loop1                 * 00E8A
        D1=D1+  1                                * 00E8D
        C=DAT1  13                               * 00E90
        D1=D1+  13                               * 00E94
        ?C=A    WP                               * 00E97
        GOYES   OnKeyCombo.L5                    * 00E9A
        D1=D1+  5                                * 00E9C
        GONC    OnKeyCombo.loop4                 * 00E9F
OnKeyCombo.L5:
        P=      0                                * 00EA2
        C=C-1   S                                * 00EA4
        GONC    OnKeyCombo.L6                    * 00EA7
        C=RSTK                                   * 00EAA
        AD1EX                                    * 00EAC
        PC=(A)                                   * 00EAF
OnKeyCombo.L6:
        A=DAT1  A                                * 00EB3
        C=C-1   S                                * 00EB6
        GONC    OnKeyCombo.L7                    * 00EB9
        ?B#0    S                                * 00EBC
        GOYES   OnKeyCombo.L7                    * 00EBF
        LA(5)   Interrupt.L20                    * 00EC1  return address, pushed with RSTK=C
OnKeyCombo.L7:
        C=RSTK                                   * 00ECB
        C=A     A                                * 00ECD
OnKeyCombo.L8:
        RSTK=C                                   * 00ECF
        GOTO    OnKeyCombo.loop1                 * 00ED1

* Entries: kind (1 run now, 2 and 3 run on release), key map as BITMAP gives it, handler. Keys by map bit: 0 ON, 1 +, 2 SPC, 6 -, 9 1, 10 A, 15 4, 44 F, 45 E, 46 D, 47 C, 48 B
* ON-key combinations (read at #00E7A): kind (1 jump, 2 and 3 other actions), 13-nibble key bitmap, handler
OnKeyTable:
        CON(1)  1                                * 00ED5  entry 0
* ON + : contrast up. Next entry, ON - : contrast down
        CON(13) #0000000000003                   * 00ED6
        CON(5)  OnKeyTable.L1                    * 00EE3
        CON(1)  1                                * 00EE8  entry 1
        CON(13) #0000000000041                   * 00EE9
        CON(5)  OnKeyTable.L2                    * 00EF6
        CON(1)  3                                * 00EFB  entry 2
* ON B : no action, no ATTN counted
        CON(13) #1000000000001                   * 00EFC
        CON(5)  Interrupt.L20                    * 00F09
        CON(1)  3                                * 00F0E  entry 3
* ON A F : cold start
        CON(13) #0100000000401                   * 00F0F
        CON(5)  Coldstart                        * 00F1C
        CON(1)  3                                * 00F21  entry 4
* ON 1 : print the LCD
        CON(13) #0000000000201                   * 00F22
        CON(5)  OnPrintLCD                       * 00F2F
        CON(1)  3                                * 00F34  entry 5
* ON 4 : set DOUSEALARM (#80834), which stops a sounding alarm
        CON(13) #0000000008001                   * 00F35
        CON(5)  ClrWSLog.L2                      * 00F42
        CON(1)  2                                * 00F47  entry 6
* ON C : warm start. Then ON D : interactive self-test, ON E : continuous self-test, ON SPC : deep sleep
        CON(13) #0800000000001                   * 00F48
        CON(5)  Warmstart                        * 00F55
        CON(1)  2                                * 00F5A  entry 7
        CON(13) #0400000000001                   * 00F5B
        CON(5)  TestSetEnd~1.L1                  * 00F68
        CON(1)  2                                * 00F6D  entry 8
        CON(13) #0200000000001                   * 00F6E
        CON(5)  CINRTN.L1                        * 00F7B
        CON(1)  2                                * 00F80  entry 9
        CON(13) #0000000000005                   * 00F81
        CON(5)  OnDeepSleep                      * 00F8E
        CON(1)  0                                * 00F93  end of table
OnKeyTable.L1:
        P=      1                                * 00F94
        GOTO    OnKeyTable.L3                    * 00F96
OnKeyTable.L2:
        P=      0                                * 00F9A
* Contrast is 5 bits at #00101 and stays within #09..#18. P=0 here means down: P=P-1 then sets carry
OnKeyTable.L3:
        D1=(5)  CONTRAST                         * 00F9C
        A=DAT1  B                                * 00FA3
        P=P-1                                    * 00FA6
        P=      0                                * 00FA8
        LC(2)   #1F                              * 00FAA
        A=A&C   B                                * 00FAE
        GOC     OnKeyTable.L4                    * 00FB2
        A=A+1   B                                * 00FB5
        LC(2)   #18                              * 00FB8
        ?C<A    B                                * 00FBC
        GOYES   OnKeyTable.L6                    * 00FBF
        GONC    OnKeyTable.L5                    * 00FC1
OnKeyTable.L4:
        A=A-1   B                                * 00FC4
        GOC     OnKeyTable.L6                    * 00FC7
        LC(2)   #09                              * 00FCA
        ?C>A    B                                * 00FCE
        GOYES   OnKeyTable.L6                    * 00FD1
OnKeyTable.L5:
        C=DAT1  B                                * 00FD3
        C=0     P                                * 00FD6
        CBIT=0  4                                * 00FD9
        A=A!C   B                                * 00FDE
        DAT1=A  B                                * 00FE2
OnKeyTable.L6:
        GOSUB   ContrastWait                     * 00FE5
        GOSUB   ContrastWait                     * 00FE9
        LC(5)   Interrupt.L20                    * 00FED
        GOTO    OnKeyCombo.L8                    * 00FF4
* ON released on its own: count one ATTN, without letting the counter wrap
OnKeyTable.L7:
        GOSUB   D1=IRAM~jump                     * 00FF8
        D1=(4)  #07F7                            * 00FFC
        C=DAT1  A                                * 01002
        C=C+1   A                                * 01005
        GOC     OnKeyTable.L8                    * 01007
        DAT1=C  A                                * 0100A
OnKeyTable.L8:
        GOTO    OnPrintLCD.L3                    * 0100D

* refs (1): 00F2F
* Save the return stack, R1 and R2 in IRAM at #8069C, print the LCD, and restore them
OnPrintLCD:
        GOSUB   D1=IRAM~jump                     * 01011
        D1=(4)  #069C                            * 01015
        P=      10                               * 0101B
OnPrintLCD.loop1:
        C=RSTK                                   * 0101D
        DAT1=C  A                                * 0101F
        D1=D1+  5                                * 01022
        P=P+1                                    * 01025
        GONC    OnPrintLCD.loop1                 * 01027
        C=R2                                     * 0102A
        CSLC                                     * 0102D
        GOSBVL  CSLW5                            * 01030
        C=R1.F  A                                * 01037
        DAT1=C  11                               * 0103D
        GOSBVL  SUB_32A4D                        * 01041
        GOSUB   D1=IRAM~jump                     * 01048
        D1=(4)  #06BA                            * 0104C
        C=DAT1  11                               * 01052
        R1=C.F  A                                * 01056
        GOSBVL  CSRW5                            * 0105C
        CSRC                                     * 01063
        R2=C.F  S                                * 01066
        R2=C.F  A                                * 0106C
        P=      10                               * 01072
OnPrintLCD.loop2:
        D1=D1-  5                                * 01074
        C=DAT1  A                                * 01077
        RSTK=C                                   * 0107A
        P=P+1                                    * 0107C
        GONC    OnPrintLCD.loop2                 * 0107E
OnPrintLCD.L3:
        GOLONG  Interrupt.L20                    * 01081

* refs (1): 00F8E
* Beep, sleep (BatSleep with ST0 clear), clear #80010.. and restart with reset code 0
OnDeepSleep:
        P=      0                                * 01087
        LC(2)   #E4                              * 01089
        GOSBVL  RCKBp                            * 0108D
        ST=0    0                                * 01094
        GOSUBL  BatSleep                         * 01097
        GOSUB   ClrWSLog                         * 0109D
        P=      0                                * 010A1
        GOLONG  Interrupt.L13                    * 010A3

* refs (2): 0109D 80C9A
* -> : clear the warm-start log: four 18-nibble entries at #80010 (see LogWarmstart)
ClrWSLog:
        GOSUBL  D1=IRAM~jump                     * 010A9
        D1=(4)  #0010                            * 010AF
        C=0     W                                * 010B5
        P=      12                               * 010B8
ClrWSLog.loop1:
        DAT1=C  W                                * 010BA
        D1=D1+  16                               * 010BE
        DAT1=C  B                                * 010C1
        D1=D1+  2                                * 010C4
        P=P+1                                    * 010C7
        GONC    ClrWSLog.loop1                   * 010C9
        RTN                                      * 010CC
* ON 4 handler
ClrWSLog.L2:
        GOSUBL  D1=IRAM~jump                     * 010CE
        D1=(4)  #0834                            * 010D4
        LC(1)   #F                               * 010DA
        DAT1=C  1                                * 010DD
        GOTO    OnPrintLCD.L3                    * 010E1

* Allow interrupts.
* refs (34): 01199 01300 0173E 01E6E 02165 04557 ...
AllowIntr:
        ST=1    15                               * 010E5
        INTON                                    * 010E8
        GOC     AllowIntr.L2                     * 010EC
        ?ST=0   14                               * 010EF
        GOYES   AllowIntr.L1                     * 010F2
        RSI                                      * 010F4
AllowIntr.L1:
        ?ST=0   15                               * 010F9
        GOYES   AllowIntr.L3                     * 010FC
        GONC    AllowIntr.L3                     * 010FE
AllowIntr.L2:
        ?ST=0   14                               * 01101
        GOYES   AllowIntr.L3                     * 01104
        RSI                                      * 01106
        ?ST=1   15                               * 0110B
        GOYES   AllowIntr.L3                     * 0110E
AllowIntr.L3:
        ST=0    14                               * 01110
        RTI                                      * 01113

* Disable interrupts.
* refs (10): 0B42D 0B72A 0B7C1 0B8DA 2D190 2D1EF ...
DisableIntr:
        ST=0    15                               * 01115
        CD0EX                                    * 01118
        RSTK=C                                   * 0111B
        D0=(5)  NOP1MASK14                       * 0111D
        C=DAT0  1                                * 01124
        CBIT=1  0                                * 01128
        DAT0=C  1                                * 0112D
        CBIT=0  0                                * 01131
        DAT0=C  1                                * 01136
        C=RSTK                                   * 0113A
        D0=C                                     * 0113C
        INTOFF                                   * 0113F
        RTNCC                                    * 01143

* refs (2): 00FE5 00FE9
* -> : idle loop of #597F turns, so a held ON + or ON - steps the contrast slowly
ContrastWait:
        AD1EX                                    * 01145
        D1=(5)  #0597F                           * 01148  loop count, swapped into A
        AD1EX                                    * 0114F
ContrastWait.loop1:
        A=A-1   A                                * 01152
        GONC    ContrastWait.loop1               * 01154
        RTNCC                                    * 01157
        BSS     1                                * 01159  zeros

* A=IN see also <REF>CINRTN For hardware reasons (bug) A=IN must be at even addr
* refs (1): 00E63
AINRTN:
        A=IN                                     * 0115A
        RTN                                      * 0115D
        BSS     1                                * 0115F  zeros

* C=IN see also <REF>AINRTN For hardware reasons (bug) C=IN must be at even addr
* refs (5): 0027D 00D2E 01EEF 0479F 32A0F
CINRTN:
        C=IN                                     * 01160
        RTN                                      * 01163
CINRTN.L1:
        ST=0    8                                * 01165
        ST=0    10                               * 01168
TestSetEnd~1:
        GOSUB   RebootIO                         * 0116B
        ST=1    6                                * 0116F
        GOTO    TestSetEnd~1.L2                  * 01172
TestSetEnd~1.L1:
        GOSUB   RebootIO                         * 01176
        ST=0    6                                * 0117A
TestSetEnd~1.L2:
        GOSUBL  D1=IRAM~jump                     * 0117D
        D1=(4)  #065A                            * 01183
        LC(1)   #F                               * 01189
        DAT1=C  1                                * 0118C
        LC(5)   CMOS                             * 01190
        RSTK=C                                   * 01197
        GOTO    AllowIntr                        * 01199

* refs (2): 0116B 01176
* -> : reset the bus, reconfigure memory, clear the bit at #80805 and reinitialise the hardware. First step of the self-tests
RebootIO:
        GOSUB   ResetConfig                      * 0119D
        GOSUB   ClrPollBit                       * 011A1
        GOVLNG  InitIO                           * 011A5

* refs (3): 0119D 8120A 81EB1
* -> : RESET, then configure I/O, RAM and the ports again (ST15 clear: interrupts held off)
ResetConfig:
        ST=0    15                               * 011AC
        RESET                                    * 011AF
        MP=0                                     * 011B2
        GOSBVL  ConfigIO                         * 011B5
        GOSBVL  ConfigBootRAM                    * 011BC
        GOVLNG  SUB_7017C.L2                     * 011C3

* refs (1): 011A1
* -> : clear bit 1 of the nibble at #80805, the one that keeps TIMER1 polling in SrvcTimer1
ClrPollBit:
        P=      0                                * 011CA
        D1=(5)  =IR_16Hz_Clock                   * 011CC
        A=DAT1  A                                * 011D3
        LA(4)   #0801                            * 011D6
        LC(3)   #205                             * 011DF
        A=C     B                                * 011E4
        D1=A                                     * 011E7
        A=DAT1  XS                               * 011EA
        C=-C-1  XS                               * 011EE
        A=A&C   XS                               * 011F1
        DAT1=A  XS                               * 011F5
        RTNCC                                    * 011F9
        BSS     1                                * 011FB  zeros

* refs (7): 012EE 012FC 0133A 0148C 01A3E 0275A ...
* -> C.W = time in ticks of 1/8192 s since year 0 (the offset at #80058 minus TIMER2); carry set if the clock is not to be trusted: TIMER2 stopped, the CRC at #80065 is wrong, or the time is outside 1991-2090. A.W, B.W, D.W clobbered
GetTimeRaw:
        SETHEX                                   * 011FC
        D1=(5)  TIMER2CTRL                       * 011FE
        C=DAT1  1                                * 01205
        D=0     S                                * 01209
        ?CBIT=1 0                                * 0120C
        GOYES   GetTimeRaw.L1                    * 01211
        D=D+1   S                                * 01213
GetTimeRaw.L1:
        D1=(2)  #1B                              * 01216
        A=DAT1  A                                * 0121A
        D1=(2)  #04                              * 0121D
        C=0     A                                * 01221
        DAT1=C  4                                * 01223
        D1=A                                     * 01227
        D1=(4)  #0058                            * 0122A
        C=DAT1  13                               * 01230
        D1=(5)  #00104                           * 01234
        C=0     A                                * 0123B
        C=DAT1  4                                * 0123D
        D1=A                                     * 01241
        D1=(4)  #0065                            * 01244
        A=0     A                                * 0124A
        A=DAT1  4                                * 0124C
        ?C=A    A                                * 01250
        GOYES   GetTimeRaw.L2                    * 01253
        D=D+1   S                                * 01255
GetTimeRaw.L2:
        D1=(4)  #0058                            * 01258
        A=0     W                                * 0125E
        A=DAT1  13                               * 01261
        B=A     W                                * 01265
        D1=(5)  TIMER2                           * 01268
        C=0     W                                * 0126F
        P=      0                                * 01272
        ?D#0    S                                * 01274
        GOYES   GetTimeRaw.L4                    * 01277
        A=DAT1  1                                * 01279
GetTimeRaw.loop3:
        C=DAT1  1                                * 0127D
        ?C=A    P                                * 01281
        GOYES   GetTimeRaw.loop3                 * 01284
        C=DAT1  8                                * 01286
GetTimeRaw.L4:
        A=B     W                                * 0128A
        P=      7                                * 0128D
        B=C     P                                * 0128F
        B=B+B   P                                * 01292
        GONC    GetTimeRaw.L5                    * 01295
        C=-C    W                                * 01298
        C=-C    WP                               * 0129B
GetTimeRaw.L5:
        DCEX    W                                * 0129E
        P=C     15                               * 012A1
        C=A     W                                * 012A5
        C=C-D   W                                * 012A8
        ?P=     0                                * 012AB
        GOYES   GetTimeRaw.L6                    * 012AE
        P=      0                                * 012B0
        RTNSC                                    * 012B2
GetTimeRaw.L6:
        B=C     W                                * 012B4
        C=0     W                                * 012B7
        P=      5                                * 012BA
        LC(8)   #1D41E89A                        * 012BC
        P=      0                                * 012C6
        BCEX    W                                * 012C8
        ?B>C    W                                * 012CB
        RTNYES                                   * 012CE
        BCEX    W                                * 012D0
        C=0     W                                * 012D3
        P=      5                                * 012D6
        LC(8)   #1EBA1AC1                        * 012D8
        P=      0                                * 012E2
        BCEX    W                                * 012E4
        ?B<=C   W                                * 012E7
        RTNYES                                   * 012EA
        RTNCC                                    * 012EC

* refs (7): 027D3 0CD8E 0CDB8 0CDDC 0CE73 0E37A ...
GetTimChk:
        GOSUB   GetTimeRaw                       * 012EE
        RTNNC                                    * 012F2
        GOTO    GetTime++.L1                     * 012F5

* refs (5): 0130E 0D39E 0EF8E 80167 8173A
* -> C.W: GetTimeRaw with interrupts held off (ST15), then AllowIntr
GetTimeNoInt:
        ST=0    15                               * 012F9
        GOSUB   GetTimeRaw                       * 012FC
        GOVLNG  AllowIntr                        * 01300

* refs (2): 0D2E9 0EB95
SavPtrTime*:
        GOSBVL  SAVPTR                           * 01307

* refs (3): 1A813 1A82C 80B52
GetTime++:
        GOSUB   GetTimeNoInt                     * 0130E
        RTNNC                                    * 01312
GetTime++.L1:
        P=      4                                * 01315
        GOLONG  Interrupt.L13                    * 01317

* refs (2): 00218 043F2
srvc_timer2:
        P=      0                                * 0131D
        D1=(5)  TIMER2CTRL                       * 0131F
        A=DAT1  1                                * 01326
        ?ABIT=1 1                                * 0132A
        GOYES   srvc_timer2.L2                   * 0132F
srvc_timer2.loop1:
        RTNCC                                    * 01331
srvc_timer2.L2:
        ?ABIT=0 3                                * 01333
        GOYES   srvc_timer2.loop1                * 01338
        GOSBVL  GetTimeRaw                       * 0133A
        GONC    srvc_timer2.L3                   * 01341
        GOTO    SetT2WakeC.L1                    * 01344
srvc_timer2.L3:
        ST=0    2                                * 01348
        B=C     W                                * 0134B
        GOSUB   D1=IRAM~jump_2                   * 0134E
        D1=(4)  #0835                            * 01352
        C=DAT1  P                                * 01358
        ?C#0    P                                * 0135C
        GOYES   srvc_timer2.L5                   * 0135F
        D1=(4)  #065A                            * 01361
        C=DAT1  1                                * 01367
        ?C=0    P                                * 0136B
        GOYES   srvc_timer2.L4                   * 0136E
        D0=(5)  ALARMS                           * 01370
        A=DAT0  A                                * 01377
        ?A#0    A                                * 0137A
        GOYES   srvc_timer2.L6                   * 0137D
srvc_timer2.L4:
        ST=1    12                               * 0137F
srvc_timer2.L5:
        GOTO    srvc_timer2.L12                  * 01382
srvc_timer2.L6:
        C=RSTK                                   * 01386
        GOSBVL  CSLW5                            * 01388
        C=RSTK                                   * 0138F
        R0=C                                     * 01391
        D0=A                                     * 01394
        A=DAT0  A                                * 01397
        GOSBVL  ?D0#LIST                         * 0139A
        GOC     srvc_timer2.L9                   * 013A1
srvc_timer2.loop7:
        D0=D0+  5                                * 013A4
        GOSBVL  ?D0#SEMI                         * 013A7
        GONC    srvc_timer2.L10                  * 013AE
        GOSBVL  ?D0#LIST                         * 013B1
        GOC     srvc_timer2.L9                   * 013B8
        D0=D0+  5                                * 013BB
        GOSBVL  ?D0#HXS                          * 013BE
        GOC     srvc_timer2.L9                   * 013C5
        D0=D0+  5                                * 013C8
        GOSBVL  ?D0#1D                           * 013CB
        GOC     srvc_timer2.L9                   * 013D2
        D0=D0+  5                                * 013D5
        C=0     W                                * 013D8
        C=DAT0  13                               * 013DB
        D0=D0+  13                               * 013DF
        D0=D0+  10                               * 013E2
        ?B<C    W                                * 013E5
        GOYES   srvc_timer2.L10                  * 013E8
        C=DAT0  1                                * 013EA
        ?C#0    P                                * 013EE
        GOYES   srvc_timer2.L8                   * 013F1
        ST=1    2                                * 013F3
        LC(1)   #1                               * 013F6
        DAT0=C  1                                * 013F9
srvc_timer2.L8:
        D0=D0+  1                                * 013FD
        GOSBVL  SAFESKIPOB                       * 01400
        GONC    srvc_timer2.loop7                * 01407
srvc_timer2.L9:
        GOTO    TryToRM?                         * 0140A
srvc_timer2.L10:
        ?ST=0   2                                * 0140E
        GOYES   srvc_timer2.L11                  * 01411
        ST=1    12                               * 01413
        D1=(5)  ALARMSDUE                        * 01416
        LC(1)   #F                               * 0141D
        DAT1=C  1                                * 01420
        D1=(5)  ANNUNCIATORS                     * 01424
        A=DAT1  B                                * 0142B
        ABIT=1  3                                * 0142E
        DAT1=A  B                                * 01433
        C=B     A                                * 01436
        D=C     A                                * 01438
        GOSBVL  ShowHeldAnn.L1                   * 0143A  inline data follows
        NIBHEX  DBD5                             * 01441  ½]
srvc_timer2.L11:
        C=R0                                     * 01445
        RSTK=C                                   * 01448
        GOSBVL  CSRW5                            * 0144A
        RSTK=C                                   * 01451
srvc_timer2.L12:
        GOSUB   D1=IRAM~jump_2                   * 01453
        D1=(4)  #0069                            * 01457
        C=0     W                                * 0145D
        C=DAT1  13                               * 01460
        ?C=0    W                                * 01464
        GOYES   SetT2WakeClk                     * 01467
        ?B<C    W                                * 01469
        GOYES   SetT2WakeClk                     * 0146C
        C=0     W                                * 0146E
        D1=(4)  #0076                            * 01471
        DAT1=C  1                                * 01477
        D1=(4)  #0069                            * 0147B
        DAT1=C  13                               * 01481

* refs (7): 01464 01469 0173A 04411 046DF 0CF03 ...
* ST0 from ClkOn>ST0, then SetT2Wake
SetT2WakeClk:
        GOSBVL  ClkOn>ST0                        * 01485

* refs (1): 042F6
* Reprogram TIMER2 for the next event; a bad clock restarts through the memory-lost path
SetT2Wake:
        GOSBVL  GetTimeRaw                       * 0148C
        GOC     SetT2WakeC.L1                    * 01493

* refs (1): 0CEA0
* C.W = time now in ticks. Choose the next wake-up: at most 3 days ahead (1 hour if #80077 is set), the time at #80069 if earlier, a due alarm in the ALARMS list, or the next whole second while the clock shows (ST0); then wrap the clock into 1991-2090 and load TIMER2 (done at TryToRM?.L9)
SetT2WakeC:
        B=C     W                                * 01496
        D0=(5)  TIMER2CTRL                       * 01499
        C=DAT0  1                                * 014A0
        ?CBIT=1 0                                * 014A4
        GOYES   SetT2WakeC.L2                    * 014A9
SetT2WakeC.L1:
        GOVLNG  GetTime++.L1                     * 014AB
SetT2WakeC.L2:
        P=      0                                * 014B2
        C=0     W                                * 014B4
* Longest wait: #7E900000 ticks is 3 days
        LC(8)   #7E900000                        * 014B7
        A=C     W                                * 014C1
        A=A+B   W                                * 014C4
        GOSUB   D0=IRAM~jump                     * 014C7
        D0=(4)  #0077                            * 014CB
        C=DAT0  1                                * 014D1
        ?C=0    P                                * 014D5
        GOYES   SetT2WakeC.L3                    * 014D8
        C=0     W                                * 014DA
* #1C20000 ticks is 1 hour
        LC(7)   #1C20000                         * 014DD
        A=C     W                                * 014E6
        A=A+B   W                                * 014E9
SetT2WakeC.L3:
        D0=(4)  #0069                            * 014EC
        C=0     W                                * 014F2
        C=DAT0  13                               * 014F5
        ?C=0    W                                * 014F9
        GOYES   SetT2WakeC.L4                    * 014FC
        ?C>=A   W                                * 014FE
        GOYES   SetT2WakeC.L4                    * 01501
        A=C     W                                * 01503
        ?A>=B   W                                * 01506
        GOYES   SetT2WakeC.L4                    * 01509
        A=B     W                                * 0150B
SetT2WakeC.L4:
        D0=(4)  #0835                            * 0150E
        C=DAT0  1                                * 01514
        ?C#0    P                                * 01518
        GOYES   SetT2WakeC.L6                    * 0151B
        D0=(4)  #072A                            * 0151D
        C=DAT0  A                                * 01523
        ?C=0    A                                * 01526
        GOYES   SetT2WakeC.L5                    * 01529
        D0=(4)  #065A                            * 0152B
        C=DAT0  1                                * 01531
        ?C#0    P                                * 01535
        GOYES   SetT2WakeC.L7                    * 01538
SetT2WakeC.L5:
        C=0     W                                * 0153A
        LC(4)   #2000                            * 0153D
        C=C+B   W                                * 01543
        ?C>=A   W                                * 01546
        GOYES   SetT2WakeC.L6                    * 01549
        A=C     W                                * 0154B
SetT2WakeC.L6:
        GOTO    TryToRM?.L2                      * 0154E
SetT2WakeC.L7:
        C=RSTK                                   * 01552
        GOSBVL  CSLW5                            * 01554
        C=RSTK                                   * 0155B
        R0=C                                     * 0155D
        D0=(5)  ALARMS                           * 01560
        C=DAT0  A                                * 01567
        D0=C                                     * 0156A
        D1=A                                     * 0156D
        GOSBVL  ?D0#LIST                         * 01570
        GOC     TryToRM?                         * 01577
SetT2WakeC.loop8:
        D0=D0+  5                                * 0157A
        GOSBVL  ?D0#SEMI                         * 0157D
        GOC     SetT2WakeC.L9                    * 01584
        AD1EX                                    * 01587
        GONC    TryToRM?.L1                      * 0158A
SetT2WakeC.L9:
        GOSBVL  ?D0#LIST                         * 0158D
        GOC     TryToRM?                         * 01594
        D0=D0+  5                                * 01597
        GOSBVL  ?D0#HXS                          * 0159A
        GOC     TryToRM?                         * 015A1
        D0=D0+  5                                * 015A4
        GOSBVL  ?D0#1D                           * 015A7
        GOC     TryToRM?                         * 015AE
        D0=D0+  5                                * 015B1
        C=0     W                                * 015B4
        C=DAT0  13                               * 015B7
        AD1EX                                    * 015BB
        D1=A                                     * 015BE
        ?C>A    W                                * 015C1
        GOYES   TryToRM?.L1                      * 015C4
        D0=D0+  13                               * 015C6
        D0=D0+  10                               * 015C9
        C=DAT0  1                                * 015CC
        ?C#0    P                                * 015D0
        GOYES   SetT2WakeC.L10                   * 015D3
        A=C     W                                * 015D5
        ?A>=B   W                                * 015D8
        GOYES   TryToRM?.L1                      * 015DB
        A=B     W                                * 015DD
        GONC    TryToRM?.L1                      * 015E0
SetT2WakeC.L10:
        D0=D0+  1                                * 015E3
        GOSBVL  SAFESKIPOB                       * 015E6
        GONC    SetT2WakeC.loop8                 * 015ED

* refs (7): 0140A 01577 01594 015A1 015AE 0CBA7 ...
TryToRM?:
        P=      9                                * 015F0
        GOVLNG  Warmstart.L1                     * 015F2
TryToRM?.L1:
        C=R0                                     * 015F9
        RSTK=C                                   * 015FC
        GOSBVL  CSRW5                            * 015FE
        RSTK=C                                   * 01605
TryToRM?.L2:
        ?ST=0   0                                * 01607
        GOYES   TryToRM?.L3                      * 0160A
        ABEX    W                                * 0160C
        D0=A                                     * 0160F
        C=0     W                                * 01612
        P=      3                                * 01615
        LC(1)   #1                               * 01617
        A=A&C   P                                * 0161A
        C=C+C   A                                * 0161E
        C=C-A   WP                               * 01620
        AD0EX                                    * 01623
        C=C+A   W                                * 01626
        ABEX    W                                * 01629
        ?C>=A   W                                * 0162C
        GOYES   TryToRM?.L3                      * 0162F
        A=C     W                                * 01631
TryToRM?.L3:
        GOSUB   D0=IRAM~jump                     * 01634
        GOSUB   ClockMaxTicks                    * 01638
        ?C<A    W                                * 0163C
        GOYES   TryToRM?.L5                      * 0163F
        GOSUB   ClockMinTicks                    * 01641
        ?C>A    W                                * 01645
        GOYES   TryToRM?.L4                      * 01648
        ?B>=C   W                                * 0164A
        GOYES   TryToRM?.L9                      * 0164D
        B=C     W                                * 0164F
        GONC    TryToRM?.L9                      * 01652
TryToRM?.L4:
        GOSUB   Ticks100Years                    * 01655
        C=-C    W                                * 01659
        GOTO    TryToRM?.L7                      * 0165C
TryToRM?.L5:
        ?B>=C   W                                * 01660
        GOYES   TryToRM?.L6                      * 01663
        A=C     W                                * 01665
        GONC    TryToRM?.L9                      * 01668
TryToRM?.L6:
        GOSUB   Ticks100Years                    * 0166B
TryToRM?.L7:
        A=A-C   W                                * 0166F
        B=B-C   W                                * 01672
        R0=A                                     * 01675
        D0=(4)  #0069                            * 01678
        A=0     W                                * 0167E
        A=DAT0  13                               * 01681
        ?A=0    W                                * 01685
        GOYES   TryToRM?.L8                      * 01688
        A=A-C   W                                * 0168A
        DAT0=A  13                               * 0168D
TryToRM?.L8:
        A=R0                                     * 01691
        GOTO    SetT2WakeC.L2                    * 01694
TryToRM?.L9:
        GOSUB   SetClockOffs                     * 01698
        C=A     W                                * 0169C
        C=C-B   W                                * 0169F
        C=C-D   W                                * 016A2
        A=C     W                                * 016A5
        D0=(5)  TIMER2                           * 016A8
        P=      7                                * 016AF
        A=DAT0  S                                * 016B1
TryToRM?.loop10:
        C=DAT0  S                                * 016B5
        ?C=A    S                                * 016B9
        GOYES   TryToRM?.loop10                  * 016BC
        C=DAT0  8                                * 016BE
        C=C+A   WP                               * 016C2
        DAT0=C  8                                * 016C5
        D0=(2)  #2F                              * 016C9
        P=      0                                * 016CD
        LC(1)   #7                               * 016CF
        DAT0=C  1                                * 016D2
        C=B     W                                * 016D6
        RTNSC                                    * 016D9

* refs (2): 0134E 01453
D1=IRAM~jump_2:
        GOVLNG  D1=IRAM                          * 016DB

* refs (2): 014C7 01634
D0=IRAM~jump:
        GOVLNG  D0=IRAM                          * 016E2

* refs (3): 01698 01A82 027EA
* A.W = clock offset (the time at TIMER2 = 0) -> stored at #80058 with its CRC at #80065; D0 kept
SetClockOffs:
        D0=A                                     * 016E9
        D1=(5)  =IR_16Hz_Clock                   * 016EC
        A=DAT1  A                                * 016F3
        D1=A                                     * 016F6
        D1=(4)  #0058                            * 016F9
        AD0EX                                    * 016FF

* refs (1): 80BD5
* As SetClockOffs with D1 already at #80058: the CRC circuit computes the check while the 13 nibbles are read back
SetClockOffsD1:
        DAT1=A  13                               * 01702
        D0=(5)  #00104                           * 01706
        A=0     A                                * 0170D
        DAT0=A  4                                * 0170F
        A=DAT1  13                               * 01713
        A=DAT0  4                                * 01717
        D1=D1+  13                               * 0171B
        DAT1=A  4                                * 0171E
        D1=D1-  13                               * 01722
        A=DAT1  13                               * 01725
        RTN                                      * 01729

* refs (6): 0DCC7 0DD8F 0DE48 0E71A 0E760 0E7A1
* -> : code object: run SetT2Wake with interrupts held off, so that a new or changed alarm takes effect
SetT2WakeOb:
        CON(5)  (*)+5                            * 0172B  primitive code object
        GOSBVL  SAVPTR                           * 01730
        ST=0    15                               * 01737
        GOSUB   SetT2WakeClk                     * 0173A
        GOSBVL  AllowIntr                        * 0173E
        P=      0                                * 01745
        SETHEX                                   * 01747
        GOVLNG  GETPTRLOOP                       * 01749

* refs (1): 01638
* -> C.W = #1EBA1AC100000: ticks at the end of the clock's range (1 January 2091)
ClockMaxTicks:
        C=0     W                                * 01750
        P=      5                                * 01753
        LC(8)   #1EBA1AC1                        * 01755
        P=      0                                * 0175F
        RTN                                      * 01761

* refs (2): 01641 01A6E
* -> C.W = #1D41E89A00000: ticks at the start of the clock's range (1 January 1991)
ClockMinTicks:
        C=0     W                                * 01763
        P=      5                                * 01766
        LC(8)   #1D41E89A                        * 01768
        P=      0                                * 01772
        RTN                                      * 01774

* refs (2): 01655 0166B
* -> C.W = #178322700000: ticks in 100 years (36525 days). The clock wraps by this much at the end of its range
Ticks100Years:
        C=0     W                                * 01776
        P=      5                                * 01779
        LC(8)   #01783227                        * 0177B
        P=      0                                * 01785
        RTN                                      * 01787

* refs (2): 01A4B 01A78
* -> C.W = #78000: ticks in one minute
Ticks1Min:
        P=      0                                * 01789
        C=0     W                                * 0178B
        LC(5)   #78000                           * 0178E
        RTN                                      * 01795

* refs (2): 027E0 423C5
* -> C.W = #4B0000: ticks in 10 minutes
Ticks10Min:
        P=      0                                * 01797
        C=0     W                                * 01799
        LC(6)   #4B0000                          * 0179C
        RTN                                      * 017A4

* C = msec, D = Hz Checks BEEP flag.
* refs (2): 141D3 141FC
makebeep:
        D0=(5)  #80850                           * 017A6
        A=DAT0  B                                * 017AD
        ?ABIT=1 3                                * 017B0
        RTNYES                                   * 017B5
        ?D=0    A                                * 017B7
        RTNYES                                   * 017BA
        B=C     A                                * 017BC
        C=0     W                                * 017BE
        C=B     A                                * 017C1
        R1=C                                     * 017C3
        C=D     A                                * 017C6
        D0=(5)  CSPEED                           * 017C8
        A=0     W                                * 017CF
        A=DAT0  A                                * 017D2
        ASL     W                                * 017D5
        R2=A                                     * 017D8
        A=A+C   W                                * 017DB
        C=C+C   W                                * 017DE
        GOSBVL  IntDivW                          * 017E1
        C=0     W                                * 017E8
        P=      0                                * 017EB
        LC(2)   #7C                              * 017ED
        A=A-C   W                                * 017F1
        GONC    makebeep.L1                      * 017F4
        A=0     W                                * 017F7
makebeep.L1:
        LC(2)   #1A                              * 017FA
        GOSBVL  IntDivW                          * 017FE
        C=0     W                                * 01805
        C=C-1   X                                * 01808
        ?C>=A   W                                * 0180B
        GOYES   makebeep.L2                      * 0180E
        A=C     W                                * 01810
makebeep.L2:
        R3=A                                     * 01813
        A=R2                                     * 01816
        C=R1                                     * 01819
        GOSBVL  MPY                              * 0181C
        R0=A                                     * 01823
        A=R3                                     * 01826
        C=0     W                                * 01829
        LC(4)   #6590                            * 0182C
        GOSBVL  MPY                              * 01832
        C=0     W                                * 01839
        LC(5)   #21728                           * 0183C
        C=C+A   W                                * 01843
        D=C     W                                * 01846
        CSRB                                     * 01849
        A=R0                                     * 0184C
        A=A+C   W                                * 0184F
        C=D     W                                * 01852
        GOSBVL  IntDivW                          * 01855
        A=A-1   W                                * 0185C
        GONC    makebeep.L3                      * 0185F
        A=0     W                                * 01862
makebeep.L3:
        C=A     W                                * 01865
        D=C     W                                * 01868
        C=R3                                     * 0186B
        B=C     X                                * 0186E
        INTOFF                                   * 01871
        D1=(5)  TIMER1CTRL                       * 01875
        C=DAT1  S                                * 0187C
        C=0     A                                * 01880
        DAT1=C  1                                * 01882
        D0=(5)  ATTNFLG                          * 01886

addrORghost:
        D1=(5)  SAVE_OR                          * 0188D
        C=DAT1  X                                * 01894
        CBIT=1  11                               * 01898
        P=C     2                                * 0189D
        CBIT=0  11                               * 018A1
        NOP4                                     * 018A6
addrORghost.loop1:
        A=DAT0  A                                * 018AA
        ?A#0    A                                * 018AD
        GOYES   addrORghost.L3                   * 018B0
        OUT=C                                    * 018B2
        A=B     X                                * 018B5
addrORghost.loop2:
        A=A-1   X                                * 018B8
        GONC    addrORghost.loop2                * 018BB
        CPEX    2                                * 018BE
        D=D-1   W                                * 018C2
        GONC    addrORghost.loop1                * 018C5
addrORghost.L3:
        C=DAT1  X                                * 018C8
        OUT=C                                    * 018CC
        D1=(5)  TIMER1CTRL                       * 018CF
        DAT1=C  S                                * 018D6
        P=      0                                * 018DA
        INTON                                    * 018DC
        RTNCC                                    * 018E0

* Measure CPU clock speed Interrupts off on entry and exit -> A.A=spd/16 B.A=loops/16s Uses C.A D0 P CRY
* refs (2): 0212A 8036E
clkspd:
        SETHEX                                   * 018E2
        B=0     A                                * 018E4
        D0=(5)  #00139                           * 018E6
        A=DAT0  B                                * 018ED
clkspd.loop1:
        C=DAT0  B                                * 018F0
        ?C=A    P                                * 018F3
        GOYES   clkspd.loop1                     * 018F6
        P=      1                                * 018F8
        C=C-1   P                                * 018FA
        C=C-1   P                                * 018FD
clkspd.loop2:
        B=B+1   A                                * 01900
        A=DAT0  B                                * 01902
        ?C#A    B                                * 01905
        GOYES   clkspd.loop2                     * 01908
        A=0     A                                * 0190A
        P=      0                                * 0190C
        C=0     A                                * 0190E
        LC(2)   #35                              * 01910
clkspd.loop3:
        A=A+B   A                                * 01914
        C=C-1   A                                * 01916
        GONC    clkspd.loop3                     * 01918
        C=0     A                                * 0191B
        LC(1)   #9                               * 0191D
        A=A+C   A                                * 01920
        RTNCC                                    * 01922
        BSS     5                                * 01924  zeros

* refs (2): 011A5 02045
* -> : power-up: sane contrast (#09..#18, default #0E), annunciators on, restart the timers and clock, enable keyboard and interrupts, clear and show the display, then fall into T1Nap
InitIO:
        ST=0    15                               * 01929
        P=      0                                * 0192C
        SETHEX                                   * 0192E
        D0=(5)  CONTRAST                         * 01930
        A=DAT0  B                                * 01937
        LC(3)   #01F                             * 0193A
        A=A&C   X                                * 0193F
        LC(2)   #09                              * 01943
        ?C>A    B                                * 01947
        GOYES   InitIO.L1                        * 0194A
        LC(2)   #18                              * 0194C
        ?C>=A   B                                * 01950
        GOYES   InitIO.L2                        * 01953
InitIO.L1:
        LC(2)   #0E                              * 01955
        A=C     B                                * 01959
InitIO.L2:
        DAT0=A  X                                * 0195C
        D0=(2)  #09                              * 01960
        LC(1)   #4                               * 01964
        DAT0=C  1                                * 01967
        D0=(2)  #0B                              * 0196B
        LC(2)   #80                              * 0196F
        DAT0=C  B                                * 01973
        GOSBVL  UARTInit                         * 01976
        D0=(5)  #0011C                           * 0197D
        C=0     A                                * 01984
        DAT0=C  1                                * 01986
        GOSUB   D0->Sft1.L1                      * 0198A
        GOSUB   SUB_01CEC                        * 0198E
        D0=(5)  TIMER1CTRL                       * 01992
        LC(2)   #10                              * 01999
        DAT0=C  B                                * 0199D
        D0=(2)  #0E                              * 019A0
        LC(1)   #C                               * 019A4
        DAT0=C  1                                * 019A7
        GOSUB   InitClock                        * 019AB
        GOSBVL  KbdOutAll                        * 019AF
        INTON                                    * 019B6
        GOSBVL  D0=IRAM                          * 019BA
        D0=(4)  #065B                            * 019C1
        C=0     A                                * 019C7
        DAT0=C  1                                * 019C9
        GOSUBL  ClrScrMn                         * 019CD
        GOSBVL  ScrOn+                           * 019D3

* refs (2): 00391 01D4B
* -> : SHUTDN until TIMER1 has run down from 1 or the very-low-battery bit is set, then TIMER1 = 7; the timer control byte is kept
T1Nap:
        D0=(5)  TIMER1CTRL                       * 019DA
        C=DAT0  B                                * 019E1
        D=C     B                                * 019E4
        P=      0                                * 019E7
        LC(2)   #15                              * 019E9
        DAT0=C  B                                * 019ED
        D0=(2)  #37                              * 019F0
        LC(1)   #1                               * 019F4
        DAT0=C  1                                * 019F7
T1Nap.loop1:
        SHUTDN                                   * 019FB
        D0=(2)  #08                              * 019FE
        C=DAT0  1                                * 01A02
        ?CBIT=1 0                                * 01A06
        GOYES   T1Nap.L2                         * 01A0B
        D0=(2)  #37                              * 01A0D
        C=DAT0  1                                * 01A11
        ?CBIT=0 3                                * 01A15
        GOYES   T1Nap.loop1                      * 01A1A
T1Nap.L2:
        D0=(2)  #37                              * 01A1C
        LC(1)   #7                               * 01A20
        DAT0=C  1                                * 01A23
        D0=(2)  #2E                              * 01A27
        C=D     B                                * 01A2B
        DAT0=C  B                                * 01A2E
        RTNCC                                    * 01A31

* refs (1): 019AB
* -> : clear the next-alarm time, restart TIMER2 from the saved clock. A bad clock reports warm-start reason 4 and starts at 1 January 1991. TIMER2 is loaded so the first event comes within a minute
InitClock:
        A=0     W                                * 01A33
        GOSUB   SetNextAlarm                     * 01A36
        GOSUB   SetT2Awake                       * 01A3A
        GOSBVL  GetTimeRaw                       * 01A3E
        GOC     InitClock.L1                     * 01A45
        B=C     W                                * 01A48
        GOSBVL  Ticks1Min                        * 01A4B
        DCEX    W                                * 01A52
        C=-C    W                                * 01A55
        C=C+D   W                                * 01A58
        A=A+C   W                                * 01A5B
        C=D     W                                * 01A5E
        GOTO    InitClock.L2                     * 01A61
InitClock.L1:
        P=      4                                * 01A65
        GOSBVL  LogWarmstart                     * 01A67
        GOSBVL  ClockMinTicks                    * 01A6E
        A=C     W                                * 01A75
        GOSBVL  Ticks1Min                        * 01A78
        A=A+C   W                                * 01A7F
InitClock.L2:
        GOSBVL  SetClockOffs                     * 01A82
        D1=(5)  TIMER2                           * 01A89
        DAT1=C  8                                * 01A90
        RTN                                      * 01A94

* refs (3): 01A36 042E3 423D6
* A.W = time -> stored at #80069; #80076 is set to F
SetNextAlarm:
        D1=(5)  =IR_16Hz_Clock                   * 01A96
        C=DAT1  A                                * 01A9D
        D1=C                                     * 01AA0
        D1=(4)  #0069                            * 01AA3
        DAT1=A  13                               * 01AA9
        D1=(4)  #0076                            * 01AAD
        C=0     A                                * 01AB3
        C=C-1   A                                * 01AB5
        DAT1=C  1                                * 01AB7
        RTN                                      * 01ABB

* refs (3): 01A3A 042EF 0440B
* C.P = nibble -> stored at #80077: zero before turning off, F after waking; nonzero makes SetT2WakeC wake at least every hour
SetT2Awake:
        GOSBVL  AD1=IRAM                         * 01ABD
        D1=(4)  #0077                            * 01AC4
        DAT1=C  1                                * 01ACA
        RTN                                      * 01ACE

* refs (2): 01E63 01FAC
SAVPTR~jump:
        GOVLNG  SAVPTR                           * 01AD0

* refs (6): 008B9 0108D 0238E 0E88E 32A06 802D8
RCKBp:
        B=C     A                                * 01AD7
        GOSUB   KbdOutRestore                    * 01AD9
        INTOFF                                   * 01ADD
        AD1EX                                    * 01AE1
        D1=(5)  TIMER1CTRL                       * 01AE4
        CSL     A                                * 01AEB
        CSL     A                                * 01AED
        C=DAT1  B                                * 01AEF
        RSTK=C                                   * 01AF2
        C=0     B                                * 01AF4
        DAT1=C  1                                * 01AF7
        AD1EX                                    * 01AFB
        CSR     A                                * 01AFE
        CSR     A                                * 01B00
        BCEX    A                                * 01B02
        CSL     A                                * 01B04
        P=C     2                                * 01B06
        C=P     4                                * 01B0A
        BCEX    X                                * 01B0E
        NOP5                                     * 01B11
RCKBp.loop1:
        OUT=C                                    * 01B16
        P=C     4                                * 01B19
        ?CBIT=1 11                               * 01B1D
        GOYES   RCKBp.L2                         * 01B22
        CBIT=1  11                               * 01B24
        ?CBIT=1 11                               * 01B29
        GOYES   RCKBp.loop3                      * 01B2E
RCKBp.L2:
        CBIT=0  11                               * 01B30
        ?CBIT=1 11                               * 01B35
        GOYES   RCKBp.loop3                      * 01B3A
RCKBp.loop3:
        DSLC                                     * 01B3C
        DSRC                                     * 01B3F
        CSTEX                                    * 01B42
        CSTEX                                    * 01B44
        P=P-1                                    * 01B46
        GONC    RCKBp.loop3                      * 01B48
        B=B+1   B                                * 01B4B
        GONC    RCKBp.loop1                      * 01B4E
        P=      0                                * 01B51
        AD1EX                                    * 01B53
        D1=(5)  TIMER1CTRL                       * 01B56
        C=RSTK                                   * 01B5D
        DAT1=C  1                                * 01B5F
        AD1EX                                    * 01B63

* refs (1): 01AD9
* -> A.A = IN: set OUT back from #80642 and allow interrupts; D1 kept. Part of the beeper
KbdOutRestore:
        AD1EX                                    * 01B66
        D1=(5)  =IR_16Hz_Clock                   * 01B69
        C=DAT1  A                                * 01B70
        D1=C                                     * 01B73
        D1=(4)  #0642                            * 01B76
        C=DAT1  X                                * 01B7C
        OUT=C                                    * 01B80
        INTON                                    * 01B83
        D1=A                                     * 01B87
        A=IN                                     * 01B8A
        RTNCC                                    * 01B8D

* Turns display on <REF>Dispoff
* refs (2): 01BA5 8037C
DispOn:
        D0=(5)  DISPIO                           * 01B8F
        C=DAT0  1                                * 01B96
        CBIT=1  3                                * 01B9A
        DAT0=C  1                                * 01B9F
        RTN                                      * 01BA3

* refs (4): 0038A 019D3 04432 81E37
ScrOn+:
        GOSUB   DispOn                           * 01BA5
        D0=(5)  ANNCTRL                          * 01BA9
        C=DAT0  B                                * 01BB0
        CBIT=1  7                                * 01BB3
        DAT0=C  B                                * 01BB8
        RTN                                      * 01BBB

* Turns display off <REF>Dispon
* refs (3): 01BD3 01D4F 80367
DispOff:
        D0=(5)  DISPIO                           * 01BBD
        C=DAT0  1                                * 01BC4
        CBIT=0  3                                * 01BC8
        DAT0=C  1                                * 01BCD
        RTN                                      * 01BD1

* refs (1): 043B7
ScrOff+:
        GOSUB   DispOff                          * 01BD3
        D0=(5)  ANNCTRL                          * 01BD7
        C=DAT0  B                                * 01BDE
        CBIT=0  7                                * 01BE1
        DAT0=C  B                                * 01BE6
        RTN                                      * 01BE9

* refs (1): 0204C
* -> : light the BUSY annunciator in the hardware (ANNCTRL bit 4)
BusyAnnOn:
        D0=(5)  ANNCTRL                          * 01BEB
        C=DAT0  B                                * 01BF2
        CBIT=1  4                                * 01BF5
        DAT0=C  B                                * 01BFA
        RTN                                      * 01BFD

* refs (10): 019CD 01FB0 02395 80005 8020E 8040D ...
ClrScrMn:
        P=      0                                * 01BFF
        SETHEX                                   * 01C01
        GOSUB   D0->Row1                         * 01C03
        LC(5)   #00076                           * 01C07
        A=0     W                                * 01C0E
        GOSUB   FillD0W                          * 01C11

* refs (1): 81D37
ClrMenu:
        GOSUB   D0->Sft1                         * 01C15
        LC(5)   #00010                           * 01C19
        A=0     W                                * 01C20

* refs (2): 01C11 01C2C
* A.W = value, C.A = count-1, D0 -> : write count 16-nibble words, D0 past them
FillD0W:
        DAT0=A  W                                * 01C23
        D0=D0+  16                               * 01C27
        C=C-1   A                                * 01C2A
        GONC    FillD0W                          * 01C2C
        RTNCC                                    * 01C2F

* ( --> D0 ) Gets addr of current display
* refs (9): 01C03 01C7F 80414 80456 80A10 814C5 ...
D0->Row1:
        GOSBVL  AD0=IRAM                         * 01C31
        RSTK=C                                   * 01C38
        D0=(4)  #06DA                            * 01C3A
        A=DAT0  4                                * 01C40
        P=      0                                * 01C44
        LC(5)   #00014                           * 01C46
        SETHEX                                   * 01C4D
        A=A+C   A                                * 01C4F
        C=RSTK                                   * 01C51
        D0=A                                     * 01C53
        RTNCC                                    * 01C56

* ( --> D0 ) Gets address of menu grob
* refs (9): 01C15 01C96 12851 80425 80467 814D9 ...
D0->Sft1:
        GOSBVL  AD0=IRAM                         * 01C58
        RSTK=C                                   * 01C5F
        D0=(4)  #06D0                            * 01C61
        A=DAT0  4                                * 01C67
        P=      0                                * 01C6B
        LC(5)   #00014                           * 01C6D
        SETHEX                                   * 01C74
        A=A+C   A                                * 01C76
        C=RSTK                                   * 01C78
        D0=A                                     * 01C7A
        RTNCC                                    * 01C7D
D0->Sft1.L1:
        GOSUB   D0->Row1                         * 01C7F
        D1=(5)  DISPADDR                         * 01C83
        DAT1=A  A                                * 01C8A
        D0=(4)  #068D                            * 01C8D
        DAT0=A  A                                * 01C93
        GOSUB   D0->Sft1                         * 01C96
        D1=(2)  #30                              * 01C9A
        DAT1=A  A                                * 01C9E
        D0=(4)  #0695                            * 01CA1
        DAT0=A  A                                * 01CA7
        A=0     A                                * 01CAA
        D1=(2)  #25                              * 01CAC
        DAT1=A  X                                * 01CB0
        D0=(4)  #0692                            * 01CB4
        GOSBVL  SUB_7DFB6                        * 01CBA
        D0=(4)  #069A                            * 01CC1
        A=DAT0  B                                * 01CC7
        LC(2)   #B7                              * 01CCA
        ?ABIT=1 7                                * 01CCE
        GOYES   D0->Sft1.L2                      * 01CD3
        LC(2)   #37                              * 01CD5
D0->Sft1.L2:
        D1=(2)  #28                              * 01CD9
        DAT1=C  B                                * 01CDD
        DAT0=C  B                                * 01CE0
        GOVLNG  disprange                        * 01CE3
        BSS     2                                * 01CEA  zeros

* refs (1): 0198E
SUB_01CEC:
        GOSBVL  D0=IRAM                          * 01CEC
        C=0     A                                * 01CF3
        D0=(4)  #06C5                            * 01CF5
        DAT0=C  1                                * 01CFB
        D0=(4)  #06C8                            * 01CFF
        DAT0=C  X                                * 01D05
        D0=(4)  #06CB                            * 01D09
        DAT0=C  A                                * 01D0F
        D0=(4)  #069A                            * 01D12
        GOVLNG  EXPR>~1~romptr.L1                * 01D18
        FILLTO  #01D44                           * 01D1F  37 zero nibbles: the next entry stays at #01D44

* refs (1): 04315
* -> : wait, turn the display off, and restore DISPADDR, line offset and line count from the copies at #8068D, #80692 and #8069A
DispRestore:
        GOSBVL  DispPark                         * 01D44
        GOSUB   T1Nap                            * 01D4B
        GOSUB   DispOff                          * 01D4F
        GOSBVL  D0=IRAM                          * 01D53
        D0=(4)  #068D                            * 01D5A
        D1=(5)  DISPADDR                         * 01D60
        C=DAT0  A                                * 01D67
        DAT1=C  A                                * 01D6A
        D0=(4)  #0692                            * 01D6D
        C=DAT0  X                                * 01D73
        D1=(2)  #25                              * 01D77
        DAT1=C  X                                * 01D7B
        D1=(2)  #00                              * 01D7F
        CSLC                                     * 01D83
        CBIT=0  3                                * 01D86
        DAT1=C  1                                * 01D8B
        D0=(4)  #069A                            * 01D8F
        C=DAT0  B                                * 01D95
        D1=(2)  #28                              * 01D98
        DAT1=C  B                                * 01D9C
        RTN                                      * 01D9F

* refs (4): 09BC4 8068F 8112A 8199D
* B.A = RAM base -> carry clear with C = "128K" or " 32K" text, D0 past the word tested; carry set if offset #3FFFB does not hold data. Offsets that mirror each other mean 32K. Words touched are restored
RamSizeTest:
        P=      0                                * 01DA1
        LC(5)   #3FFFB                           * 01DA3
        GOSUB   SUB_01E2A                        * 01DAA
        GONC    RamSizeTest.L3                   * 01DAE
        GOSUB   SUB_01DFD                        * 01DB1
        R3=A                                     * 01DB5
        GOSUB   SUB_01E08                        * 01DB8
        R4=A                                     * 01DBC
        A=R3                                     * 01DBF
        A=-A-1  A                                * 01DC2
        GOSUB   SUB_01E19                        * 01DC4
        GOSUB   SUB_01DFD                        * 01DC8
        C=R3                                     * 01DCC
        DAT0=C  A                                * 01DCF
        ?C#A    A                                * 01DD2
        GOYES   RamSizeTest.L1                   * 01DD5
        A=R4                                     * 01DD7
        GOSUB   SUB_01E19                        * 01DDA
        LC(8)   #4B383231                        * 01DDE
        GOTO    RamSizeTest.L2                   * 01DE8
RamSizeTest.L1:
        LC(8)   #4B323320                        * 01DEC
RamSizeTest.L2:
        D0=D0+  5                                * 01DF6
        RTNCC                                    * 01DF9
RamSizeTest.L3:
        RTNSC                                    * 01DFB

* refs (2): 01DB1 01DC8
SUB_01DFD:
        LC(5)   #0FFFB                           * 01DFD
        GOTO    SUB_01E08.L1                     * 01E04

* refs (1): 01DB8
SUB_01E08:
        LC(5)   #3FFFB                           * 01E08
SUB_01E08.L1:
        C=C+B   A                                * 01E0F
        D0=C                                     * 01E11
        A=DAT0  A                                * 01E14
        RTN                                      * 01E17

* refs (2): 01DC4 01DDA
SUB_01E19:
        LC(5)   #3FFFB                           * 01E19
        C=C+B   A                                * 01E20
        D0=C                                     * 01E22
        DAT0=A  A                                * 01E25
        RTN                                      * 01E28

* refs (1): 01DAA
SUB_01E2A:
        C=C+B   A                                * 01E2A
        D0=C                                     * 01E2C
        C=DAT0  A                                * 01E2F
        RSTK=C                                   * 01E32
        C=0     A                                * 01E34
        C=C-1   A                                * 01E36
        DAT0=C  A                                * 01E38
        A=DAT0  A                                * 01E3B
        ?C#A    A                                * 01E3E
        GOYES   SUB_01E2A.L1                     * 01E41
        C=0     A                                * 01E43
        DAT0=C  A                                * 01E45
        A=DAT0  A                                * 01E48
        ?C#A    A                                * 01E4B
        GOYES   SUB_01E2A.L1                     * 01E4E
        C=RSTK                                   * 01E50
        DAT0=C  A                                * 01E52
        D0=D0+  5                                * 01E55
        RTNSC                                    * 01E58
SUB_01E2A.L1:
        C=RSTK                                   * 01E5A
        RTNCC                                    * 01E5C

* refs (3): 04895 113A3 17BA4
* -> : code object: read the alpha and shift keys and light the annunciator of the one held (none if two or more) on top of the byte at #80841. Machine code enters at the GOSUB target below
ShowHeldAnn:
        CON(5)  (*)+5                            * 01E5E  primitive code object
        GOSUB   SAVPTR~jump                      * 01E63
        ST=0    15                               * 01E67
        GOSUB   ShowHeldAnn.L1                   * 01E6A  inline data follows
        GOSBVL  AllowIntr                        * 01E6E
        GOTO    CLEARLCD.L1                      * 01E75
* Bits 6, 5, 4 of the annunciator byte are alpha, right and left shift; the XS nibble counts keys held
ShowHeldAnn.L1:
        C=RSTK                                   * 01E79
        B=C     A                                * 01E7B
        P=      0                                * 01E7D
        SETHEX                                   * 01E7F
        A=0     A                                * 01E81
        GOSBVL  AlphaDown?                       * 01E83
        GONC    ShowHeldAnn.L2                   * 01E8A
        ABIT=1  6                                * 01E8D
        A=A+1   XS                               * 01E92
ShowHeldAnn.L2:
        GOSBVL  LShiftDown?                      * 01E95
        GONC    ShowHeldAnn.L3                   * 01E9C
        ABIT=1  4                                * 01E9F
        A=A+1   XS                               * 01EA4
ShowHeldAnn.L3:
        GOSBVL  RShiftDown?                      * 01EA7
        GONC    ShowHeldAnn.L4                   * 01EAE
        ABIT=1  5                                * 01EB1
        A=A+1   XS                               * 01EB6
ShowHeldAnn.L4:
        ASRB.F  XS                               * 01EB9
        ?A=0    XS                               * 01EBE
        GOYES   ShowHeldAnn.L5                   * 01EC1
        A=0     A                                * 01EC3
ShowHeldAnn.L5:
        GOSUB   D1=IRAM~jump_3                   * 01EC5
        D1=(4)  #0841                            * 01EC9
        C=DAT1  B                                * 01ECF
        A=A!C   B                                * 01ED2
        GOSUB   AnnByte>HW                       * 01ED6
        C=B     A                                * 01EDA
        RSTK=C                                   * 01EDC
        GOSUB   D1=IRAM~jump_3                   * 01EDE
        D1=(4)  #0642                            * 01EE2
        C=DAT1  X                                * 01EE8

OUT=CC=in:
        OUT=C                                    * 01EEC
        GOVLNG  CINRTN                           * 01EEF

* refs (2): 01EC5 01EDE
D1=IRAM~jump_3:
        GOVLNG  D1=IRAM                          * 01EF6

* refs (2): 01ED6 804B9
* A.B = annunciator byte (#80841 layout) -> : map it through the table below and write it to ANNCTRL, keeping the two top bits; B.A kept
AnnByte>HW:
        D1=(5)  AnnByte>HW.L3                    * 01EFD
        C=B     A                                * 01F04
        RSTK=C                                   * 01F06
        B=0     A                                * 01F08
AnnByte>HW.loop1:
        D1=D1+  2                                * 01F0A
        A=A+A   B                                * 01F0D
        GONC    AnnByte>HW.L2                    * 01F10
        C=DAT1  B                                * 01F13
        B=B!C   B                                * 01F16
        GOC     AnnByte>HW.loop1                 * 01F1A
AnnByte>HW.L2:
        ?A#0    B                                * 01F1D
        GOYES   AnnByte>HW.loop1                 * 01F20
        D1=(5)  ANNCTRL                          * 01F22
        A=DAT1  B                                * 01F29
        P=      0                                * 01F2C
        LC(2)   #C0                              * 01F2E
        A=A&C   B                                * 01F32
        A=A!B   B                                * 01F36
        DAT1=A  B                                * 01F3A
        C=RSTK                                   * 01F3D
        B=C     A                                * 01F3F
AnnByte>HW.L3:
        RTNCC                                    * 01F41

* Annunciator bit for each bit of the annunciator byte (read at #01F13)
        CON(2)  #10                              * 01F43  entry 0
        CON(2)  #04                              * 01F45  entry 1
        CON(2)  #02                              * 01F47  entry 2
        CON(2)  #01                              * 01F49  entry 3
        CON(2)  #08                              * 01F4B  entry 4
        CON(2)  #00                              * 01F4D  entry 5
        CON(2)  #20                              * 01F4F  entry 6
        CON(2)  #00                              * 01F51  entry 7

* refs (1): 423F3
* -> : code object: ArmKeyPoll, D0 kept
ArmKeyPollOb:
        CON(5)  (*)+5                            * 01F53  primitive code object
        CD0EX                                    * 01F58
        RSTK=C                                   * 01F5B
        GOSBVL  ArmKeyPoll                       * 01F5D
        C=RSTK                                   * 01F64
        D0=C                                     * 01F66
        GOTO    CLCD10.L1                        * 01F69

* ->
* refs (4): 8D396 9CA6B 9D0D1 CF5EE
CLCD10:
        CON(5)  (*)+5                            * 01F6D  primitive code object
        CD1EX                                    * 01F72
        RSTK=C                                   * 01F75
        D1=(5)  VDISP                            * 01F77
        C=DAT1  A                                * 01F7E
        D1=C                                     * 01F81
        D1=D1+  10                               * 01F84
        D1=D1+  10                               * 01F87
        LC(5)   #00770                           * 01F8A
        GOSBVL  WIPEOUT                          * 01F91
        C=RSTK                                   * 01F98
        D1=C                                     * 01F9A
CLCD10.L1:
        A=DAT0  A                                * 01F9D
        D0=D0+  5                                * 01FA0
        PC=(A)                                   * 01FA3

* ->
* refs (2): 385ED 9C655
CLEARLCD:
        CON(5)  (*)+5                            * 01FA7  primitive code object
        GOSUB   SAVPTR~jump                      * 01FAC
        GOSUBL  ClrScrMn                         * 01FB0
CLEARLCD.L1:
        GOVLNG  GETPTRLOOP                       * 01FB6

* refs (4): 00F55 04244 131C1 21B53
Warmstart:
        ST=1    6                                * 01FBD
        GOTO    Warmstart.L2                     * 01FC0
        NIBHEX  2F                               * 01FC4  ò
Warmstart.L1:
        ST=0    6                                * 01FC6
Warmstart.L2:
        ST=0    2                                * 01FC9
        ST=1    7                                * 01FCC
        GOTO    norecCSseq.L2                    * 01FCF

* refs (3): 00F1C 0202F 020B1
Coldstart:
        ST=1    7                                * 01FD3
        GOTO    norecCSseq.L1                    * 01FD6

norecCSseq:
        ST=0    7                                * 01FDA
norecCSseq.L1:
        ST=1    2                                * 01FDD
        ST=1    6                                * 01FE0
norecCSseq.L2:
        C=P     15                               * 01FE3
        ST=0    15                               * 01FE7
        RESET                                    * 01FEA
        GOVLNG  SUB_7017C.L1                     * 01FED
norecCSseq.L3:
        ?ST=1   6                                * 01FF4
        GOYES   norecCSseq.L7                    * 01FF7
        P=C     15                               * 01FF9
        ?P=     3                                * 01FFD
        GOYES   norecCSseq.L4                    * 02000
