* HP 48GX ROM revision R, #04003-#05FFF: Power off and wake-up, card and config checks, the low-battery text, lite sleep, TOUCHTAB key assignments, error traps, built-in binary integers and stack words
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: BINT2 BINT4 BINT3 BINT9 BINT6 BINT5 BINT7 BINT17 BINT8 NULL{} BINT10 ERRSET
* Follows on from the previous file (at #04003 in the original ROM).
        RPL

* 2d 2h
* refs (515): 05158 05171 0CA08 0D2BC 0DF6B 0E557 ...
BINT2:
        # 2                                      * 04003  2

* 3d 3h
* refs (398): 0C627 0C6C2 0C93D 0D2B2 0E150 0E584 ...
BINT3:
        # 3                                      * 0400D  3

* 4d 4h
* refs (420): 0C636 0C6D1 0D2A8 0E20A 0E570 0E5B2 ...
BINT4:
        # 4                                      * 04017  4

* 5d 5h
* refs (250): 10329 14870 19912 1995C 19D57 1A1C3 ...
BINT5:
        # 5                                      * 04021  5

* 6d 6h
* refs (283): 10617 1062B 150A7 152A0 19D6C 1A10F ...
BINT6:
        # 6                                      * 0402B  6

* 7d 7h
* refs (224): 021E7 09052 10383 104A5 104DC 140CE ...
BINT7:
        # 7                                      * 04035  7

* 8d 8h
* refs (191): 04279 0E0E2 0E10F 1509D 15147 15438 ...
BINT8:
        # 8                                      * 0403F  8

* 9d 9h
* refs (346): 174F5 17630 1A3C8 1CBEA 1CEED 1CFB7 ...
BINT9:
        # 9                                      * 04049  9

* 10d  Ah
* refs (172): 0B610 0EDAA 19739 1978F 1A9BD 1AA47 ...
BINT10:
        # A                                      * 04053  10

* 11d  Bh
* refs (104): 15E65 19585 195A5 195C5 195E5 19605 ...
BINT11:
        # B                                      * 0405D  11

* 12d  Ch
* refs (80): 19E85 1A9DB 1C9EA 1CBFE 1E597 31935 ...
BINT12:
        # C                                      * 04067  12

* 13d  Dh
* refs (99): 0EDBE 19A43 19A4D 1A3DC 1CC18 1CE46 ...
BINT13:
        # D                                      * 04071  13

* 14d  Eh
* refs (83): 172E3 19725 1977B 19A89 1A9C7 1AA51 ...
BINT14:
        # E                                      * 0407B  14

* 15d  Fh
* refs (62): 17644 1CC4C 1DDB5 1DEF4 25B8D 26A41 ...
BINT15:
        # F                                      * 04085  15

* 16d 10h
* refs (124): 0C857 0C87A 0C8A7 0E0BA 13B83 175F9 ...
BINT16:
        # 10                                     * 0408F  16

* 17d 11h
* refs (210): 0906B 15FA1 19703 1999C 199BC 199DC ...
BINT17:
        # 11                                     * 04099  17

* 18d 12h
* refs (57): 19E0E 19F19 1A8EC 1AB7B 1AD1D 1AE02 ...
BINT18:
        # 12                                     * 040A3  18

* 19d 13h
* refs (79): 1DE98 6CD17 8BAA5 8BCEF 8F536 A2D66 ...
BINT19:
        # 13                                     * 040AD  19

* 20d 14h
* refs (20): 1AE3E 25BBA 33B98 396BE 396FF 3A32D ...
BINT20:
        # 14                                     * 040B7  20

* 21d 15h
* refs (27): 1278E 1F368 1FA63 1FA97 57185 57199 ...
BINT21:
        # 15                                     * 040C1  21

* 22d 16h
* refs (20): 1277A 2075D 396FA 3A003 3A22E 47D3D ...
BINT22:
        # 16                                     * 040CB  22

* 23d 17h
* refs (28): 456EA 46391 571C7 6AE51 6AE83 6C3BB ...
BINT23:
        # 17                                     * 040D5  23

* 24d 18h
* refs (25): 0EDD2 317FA 41DCE 463A5 4695F 476E7 ...
BINT24:
        # 18                                     * 040DF  24

* 25d 19h
* refs (113): 19DB0 41DAB 43151 438CE 449A8 44A45 ...
BINT25:
        # 19                                     * 040E9  25

* 26d 1Ah
* refs (131): 19E2E 1A90A 1ABDF 1AD63 1AE70 1AF73 ...
BINT26:
        # 1A                                     * 040F3  26

* 27d 1Bh
* refs (16): 15CE3 1AB99 1AD3B 1AE20 1AF37 46B8E ...
BINT27:
        # 1B                                     * 040FD  27

* 28d 1Ch
* refs (89): 19E3E 47777 477B8 4BB4D 4D2A9 4D7F4 ...
BINT28:
        # 1C                                     * 04107  28

* 29d 1Dh
* refs (12): 19E4E 438BF 44A5A 4C2E7 5709F AF97D ...
BINT29:
        # 1D                                     * 04111  29

* 30d 1Eh
* refs (51): 196EF 19759 197B9 19E8A 1A946 1ABC1 ...
BINT30:
        # 1E                                     * 0411B  30

* 31d 1Fh
* refs (62): 1CC66 4123D 463C8 4BA12 4BA62 4BCC9 ...
BINT31:
        # 1F                                     * 04125  31

* 32d 20h
* refs (69): 2E2C8 44925 463CD 4D218 4EC62 50EF2 ...
BINT32:
        # 20                                     * 0412F  32

* 33d 21h
* refs (49): 1A8F6 1AB85 1AD27 1AE0C 1AF23 1B04B ...
BINT33:
        # 21                                     * 04139  33

* 34d 22h
* refs (30): 1A900 1AB8F 1AD31 1AE16 1AF2D 1B055 ...
BINT34:
        # 22                                     * 04143  34

* 35d 23h
* refs (105): 19E8F 22161 22311 33161 3338C 33477 ...
BINT35:
        # 23                                     * 0414D  35

* 36d 24h
* refs (18): 1AE48 2FE39 33247 33404 335C6 337AB ...
BINT36:
        # 24                                     * 04157  36

* 37d 25h
* refs (79): 1F372 1FA6D 1FAA1 32292 322E7 39704 ...
BINT37:
        # 25                                     * 04161  37

* 38d 26h
* refs (13): 20767 3217F 32256 73D9D 8F68F 8F91F ...
BINT38:
        # 26                                     * 0416B  38

* 39d 27h
* refs (26): 2D735 2D753 2DA4F 2F07C 39734 44AF4 ...
BINT39:
        # 27                                     * 04175  39

* 40d 28h
* refs (66): 0D2DA 19E94 3A569 3FE71 3FE9E 43900 ...
BINT40:
        # 28                                     * 0417F  40

* 41d 29h
* refs (17): 463E1 491E9 A40E1 A788A A7A33 A83E9 ...
BINT41:
        # 29                                     * 04189  41

* 42d 2Ah
* refs (25): 1A914 1ABF3 1AD6D 1AE7A 1AF7D 1B069 ...
BINT42:
        # 2A                                     * 04193  42

* 43d 2Bh
* refs (22): 463E6 6A096 A3FE0 A505A A50BB A511C ...
BINT43:
        # 2B                                     * 0419D  43

* ->
* refs (6): 1A328 2DB49 3A9D8 3AC25 3E0FB 42136
TurnOff:
        :: BusyOn ALARM? ?SEMI                   * 041A7
          DEEPSLEEP InitEnab ~IT;ShowInvRomp ?FlashAlert ; * 041BB

* refs (1): 17FE8
off!:
        :: BusyOn DEEPSLEEP DROP ;               * 041D4

* -> flag
* refs (2): 041BB 041DE
DEEPSLEEP:
        CON(5)  (*)+5                            * 041ED  primitive code object
        ASSEMBLE
        GOSUB   SAVPTR~jump_2                    * 041F2
        ST=0    15                               * 041F6
        GOSBVL  CkLowBat                         * 041F9
        GOSUBL  AlarmDue?                        * 04200
        GOC     DEEPSLEEP.L4                     * 04206
        GOSBVL  BankNone                         * 04209
        GOSUB   DeepSleep                        * 04210
        GOSBVL  ArmKeyPoll                       * 04214
        P=      0                                * 0421B
        GOSBVL  ReconfigBus                      * 0421D
        ?ST=1   3                                * 04224
        GOYES   DEEPSLEEP.loop2                  * 04227
        ?ST=0   4                                * 04229
        GOYES   DEEPSLEEP.L1                     * 0422C
        GOVLNG  Interrupt.L4                     * 0422E
DEEPSLEEP.L1:
        ?ST=1   0                                * 04235
        GOYES   DEEPSLEEP.loop2                  * 04238
        GOSBVL  HomeOK?                          * 0423A
        GONC    DEEPSLEEP.L3                     * 04241
DEEPSLEEP.loop2:
        GOVLNG  Warmstart                        * 04244
DEEPSLEEP.L3:
        GOSBVL  SUB_70242                        * 0424B
        ?ST=1   1                                * 04252
        GOYES   DEEPSLEEP.loop2                  * 04255
        ?ST=1   5                                * 04257
        GOYES   DEEPSLEEP.L5                     * 0425A
DEEPSLEEP.L4:
        GOVLNG  GETPTRFALSE                      * 0425C
DEEPSLEEP.L5:
        GOVLNG  GETPTRTRUE                       * 04263
        RPL

* ->
* refs (1): 4B64D
ShowInvRomp:
        :: #132_64E8C JstGetTHEMESG BINT8 JstGetTHEMESG !append$ * 0426A
          FlashWarning ;                         * 04288
        ASSEMBLE

* Puts calc into "deep sleep" Low power mode, display off Wakeup on ON key or interrupt
* refs (3): 0283D 04210 042AE
DeepSleep:
        GOSUB   PushT1Ctl                        * 04292  inline data follows
        GOSUB   PreOff                           * 04296
        GOSUB   OffChecks                        * 0429A
        GOSUB   OffWait                          * 0429E
        GOSUB   PopT1Ctl                         * 042A2  inline data follows
        GOSUB   WakeChecks                       * 042A6
        GOSUB   WakeSort                         * 042AA
        GOC     DeepSleep                        * 042AE
        GOVLNG  BusyOn.L1                        * 042B1

* refs (1): 04292
* -> : push the timer control bytes on the return stack, under the return address
PushT1Ctl:
        C=RSTK                                   * 042B8
        A=C     A                                * 042BA
        D1=(5)  TIMER1CTRL                       * 042BC
        C=DAT1  B                                * 042C3
        RSTK=C                                   * 042C6
        PC=A                                     * 042C8

* refs (1): 042A2
* -> : restore the timer control bytes pushed by PushT1Ctl
PopT1Ctl:
        C=RSTK                                   * 042CC
        A=C     A                                * 042CE
        C=RSTK                                   * 042D0
        D1=(5)  TIMER1CTRL                       * 042D2
        DAT1=C  B                                * 042D9
        PC=A                                     * 042DC

* refs (1): 04296
* -> : before turning off: clear the next-alarm time and the awake mode, reprogram TIMER2, stop TIMER1 and the serial port, and restore the display registers
PreOff:
        A=0     W                                * 042E0
        GOSBVL  SetNextAlarm                     * 042E3
        ST=0    0                                * 042EA
        C=0     A                                * 042ED
        GOSBVL  SetT2Awake                       * 042EF
        GOSBVL  SetT2Wake                        * 042F6
        D1=(5)  TIMER1CTRL                       * 042FD
        LC(2)   #50                              * 04304
        DAT1=C  B                                * 04308
        D1=(2)  #10                              * 0430B
        C=0     A                                * 0430F
        DAT1=C  1                                * 04311
        GOVLNG  DispRestore                      * 04315
        BSS     1                                * 0431C  zeros

* refs (1): 043EE
* C.XS = TIMER2 control -> ST11 = its interrupt bit
T2Int>ST11:
        ST=0    11                               * 0431D
        C=C+C   XS                               * 04320
        RTNNC                                    * 04323
        ST=1    11                               * 04326
        RTN                                      * 04329

* refs (1): 0429A
* -> : before turning off: restart if the cards changed, check the config and port CRCs
OffChecks:
        GOSUB   CkCards                          * 0432B
        GOSUB   CkConfCRC                        * 0432F
        GOTO    CkPort1CRC                       * 04333

* refs (1): 0429E
* -> ST12 set if ON woke the machine: annunciators off, keyboard idle and buffer flushed, then SHUTDN until something wakes it
OffWait:
        D1=(5)  NOP1MASK14                       * 04337
        LC(1)   #8                               * 0433E
        DAT1=C  1                                * 04341
        D1=(2)  #0B                              * 04345
        A=DAT1  B                                * 04349
        LC(2)   #C8                              * 0434C
        A=A&C   B                                * 04350
        DAT1=A  B                                * 04354
        INTOFF                                   * 04357
        GOSBVL  KbdOut0                          * 0435B
        GOSBVL  Flush                            * 04362
        GOSBVL  ClrKeyState                      * 04369
        ST=0    12                               * 04370
        GOSUB   ShutdnInRAM                      * 04373
        GOSBVL  KbdOutAll                        * 04377
        INTON                                    * 0437E
        GOSBVL  OnKeyStable?                     * 04382
        RTNNC                                    * 04389
        ST=1    12                               * 0438C
        RTN                                      * 0438F

* refs (2): 04373 043BE
* -> : write SHUTDN and RTN into RAM at #80524 and run them there: the ROM may be powered down while the CPU sleeps
ShutdnInRAM:
        D1=(5)  =IR_16Hz_Clock                   * 04391
        C=DAT1  A                                * 04398
        D1=C                                     * 0439B
        D1=(4)  #0524                            * 0439E
        P=      0                                * 043A4
        LC(5)   #10708                           * 043A6
        DAT1=C  A                                * 043AD
        CD1EX                                    * 043B0
        PC=C                                     * 043B3
ShutdnInRAM.L1:
        GOSBVL  ScrOff+                          * 043B7
        GOSUB   ShutdnInRAM                      * 043BE
        GOVLNG  BatSleep.L4                      * 043C2

* refs (1): 042A6
* -> : after waking: check the cards and the CRCs; a failure restarts with reason 5
WakeChecks:
        GOSUB   CkCards                          * 043C9
        GOSUB   CkConfCRC                        * 043CD
        GOSUB   CkPort1CRC                       * 043D1
        RTNC                                     * 043D5
        P=      5                                * 043D8
        GOLONG  Warmstart.L1                     * 043DA

* refs (1): 042AA
* -> carry clear to carry on running; carry set to go back to sleep: after waking, service TIMER2 and the battery. Unless ON (ST12) or a timer interrupt (ST11) woke it, return; otherwise wait for ON to be released and show the display
WakeSort:
        GOSUBL  WaitMPClear                      * 043E0
        D0=(2)  #2F                              * 043E6
        C=DAT0  XS                               * 043EA
        GOSUB   T2Int>ST11                       * 043EE
        GOSUBL  srvc_timer2                      * 043F2
        GOSUBL  CkLowBat                         * 043F8
        ?ST=1   12                               * 043FE
        GOYES   WakeSort.L1                      * 04401
        ?ST=1   11                               * 04403
        RTNYES                                   * 04406
WakeSort.L1:
        LC(1)   #F                               * 04408
        GOSUBL  SetT2Awake                       * 0440B
        GOSUBL  SetT2WakeClk                     * 04411
WakeSort.loop2:
        LC(2)   #90                              * 04417
        A=C     A                                * 0441B
WakeSort.loop3:
        GOSUBL  OnKeyDown?                       * 0441D
        GOC     WakeSort.loop2                   * 04423
        A=A-1   B                                * 04426
        GONC    WakeSort.loop3                   * 04429
        GOSUBL  FlushAttn                        * 0442C
        GOSUBL  ScrOn+                           * 04432
        RTNCC                                    * 04438

* refs (2): 0432B 043C9
* -> : compare the card status with PortStat; a change restarts through the interrupt code's path
CkCards:
        GOSUBL  WaitCardStat                     * 0443A
        D0=(5)  PortStat                         * 04440
        A=DAT0  XS                               * 04447
        ?C=A    XS                               * 0444B
        RTNYES                                   * 0444E
        GOVLNG  Interrupt.loop10                 * 04450

* refs (2): 0432F 043CD
* -> : compare COMPCONFCRC with the stored word; a mismatch goes to DEEPSLEEP's restart
CkConfCRC:
        GOSBVL  COMPCONFCRC                      * 04457
        A=0     A                                * 0445E
        A=DAT0  4                                * 04460
        ?C=A    A                                * 04464
        RTNYES                                   * 04467
        GOTO    DEEPSLEEP.loop2                  * 04469

* refs (2): 04333 043D1
* -> carry set if nothing to do or the CRC is the same; carry clear if it changed: if the flags at #8052F say port 1 needs it, compute the CRC of its 128K or 32K and store it in Port1CRC. The test at #044BF only leaves its result in carry
CkPort1CRC:
        D0=(5)  #8052F                           * 0446D
        A=DAT0  B                                * 04474
        ?ABIT=0 3                                * 04477
        RTNYES                                   * 0447C
        C=RSTK                                   * 0447E
        GOSBVL  CSLW5                            * 04480
        C=RSTK                                   * 04487
        R0=C                                     * 04489
        LC(5)   #40000                           * 0448C
        ?ABIT=1 5                                * 04493
        GOYES   CkPort1CRC.L1                    * 04498
        LC(5)   #10000                           * 0449A
CkPort1CRC.L1:
        B=C     A                                * 044A1
        LC(5)   #C0000                           * 044A3
        GOSUB   CRCBlock                         * 044AA
        D0=(5)  Port1CRC                         * 044AE
        A=0     A                                * 044B5
        A=DAT0  4                                * 044B7
        DAT0=C  4                                * 044BB
        ?C=A    A                                * 044BF
        GOYES   CkPort1CRC.L2                    * 044C2
CkPort1CRC.L2:
        C=R0                                     * 044C4
        RSTK=C                                   * 044C7
        GOSBVL  CSRW5                            * 044C9
        PC=C                                     * 044D0

* refs (3): 8081A 819F6 81A45
* C.A = start, B.A = end: CRCBlock with the length made from B-C
CRCRange:
        B=B-C   A                                * 044D4

* refs (1): 044AA
* C.A = start, B.A = length in nibbles -> C.A = CRC. Reads the two halves of the block through the CRC circuit 16 nibbles at a time, as the self-test does. A.A = CRC with the top nibble adjusted
CRCBlock:
        P=      0                                * 044D6
        D0=C                                     * 044D8
        BSRB.F  A                                * 044DB
        C=B     A                                * 044E0
        BSR     A                                * 044E2
        B=B-1   A                                * 044E4
        D=0     A                                * 044E6
        D1=(5)  #00104                           * 044E8
        A=0     A                                * 044EF
        DAT1=A  4                                * 044F1
        AD0EX                                    * 044F5
CRCBlock.loop1:
        D0=A                                     * 044F8
        RSTK=C                                   * 044FB
        CAEX    A                                * 044FD
        RSTK=C                                   * 044FF
        C=C+A   A                                * 04501
        D1=C                                     * 04503
        C=B     A                                * 04506
CRCBlock.loop2:
        A=DAT0  W                                * 04508
        D0=D0+  16                               * 0450C
        A=DAT1  W                                * 0450F
        D1=D1+  16                               * 04513
        C=C-1   A                                * 04516
        GONC    CRCBlock.loop2                   * 04518
        C=RSTK                                   * 0451B
        A=C     A                                * 0451D
        C=RSTK                                   * 0451F
        A=A+C   A                                * 04521
        A=A+C   A                                * 04523
        D=D-1   A                                * 04525
        GONC    CRCBlock.loop1                   * 04527
        C=0     A                                * 0452A
        D0=(5)  #00104                           * 0452C
        C=DAT0  4                                * 04533
        A=C     A                                * 04537
        P=      4                                * 04539
        A=A-1   P                                * 0453B
        A=A+1   A                                * 0453E
        P=      0                                * 04540
        RTN                                      * 04542

* -> #
* refs (1): 386DD
AlertStatus:
        CON(5)  (*)+5                            * 04544  primitive code object
        GOSUB   SAVPTR~jump_2                    * 04549
        ST=0    15                               * 0454D
        GOSBVL  CkLowBat                         * 04550
        GOSBVL  AllowIntr                        * 04557
        D0=(5)  LPD_HIST                         * 0455E
        C=0     A                                * 04565
        C=DAT0  1                                * 04567
        R0=C                                     * 0456B
        GOVLNG  PUSH#LOOP                        * 0456E

* # -> $
* refs (1): 38714
Alert$:
        CON(5)  (*)+5                            * 04575  primitive code object
        GOSBVL  POP#                             * 0457A
        R1=A                                     * 04581
        GOSUB   SAVPTR~jump_2                    * 04584
        C=0     A                                * 04588
        LC(2)   #16                              * 0458A
        GOSBVL  MAKE$                            * 0458E
        GOSUB   LowBat$Fill                      * 04595
        GOVLNG  Ticks>wd$.L1                     * 04599

* refs (1): 04595
* D0 at a 22-character string body, R1.P = bits (0 alarm due, 1 system battery, 2 port 1, 3 port 2): write the line "LowBat(S,P1,P2) Alarm" with spaces after it
LowBat$Fill:
        P=      0                                * 045A0
        C=0     A                                * 045A2
        LC(2)   #16                              * 045A4
        D=C     A                                * 045A8
        A=R1                                     * 045AA
        ?A#0    P                                * 045AD
        GOYES   LowBat$Fill.L1                   * 045B0
        GOSUB   PadSpaces                        * 045B2
        RTNSC                                    * 045B6
LowBat$Fill.L1:
        B=A     P                                * 045B8
        LC(1)   #1                               * 045BB
        B=B&C   P                                * 045BE
        LC(1)   #E                               * 045C2
        A=A&C   P                                * 045C5
        ?A=0    P                                * 045C9
        GOYES   LowBat$Fill.L5                   * 045CC
        LC(14)  #28746142776F4C                  * 045CE
        DAT0=C  14                               * 045DE
        D0=D0+  14                               * 045E2
        D=D-CON A,7                              * 045E5
        ?ABIT=0 1                                * 045EB
        GOYES   LowBat$Fill.L2                   * 045F0
        ABIT=0  1                                * 045F2
        LC(2)   #53                              * 045F7
        GOSUB   PutChar                          * 045FB
        ?A=0    P                                * 045FF
        GOYES   LowBat$Fill.L4                   * 04602
        GOSUB   PutComma                         * 04604
LowBat$Fill.L2:
        ?ABIT=0 3                                * 04608
        GOYES   LowBat$Fill.L3                   * 0460D
        ABIT=0  3                                * 0460F
        LC(4)   #3150                            * 04614
        GOSUB   Put2Chars                        * 0461A
        ?A=0    P                                * 0461E
        GOYES   LowBat$Fill.L4                   * 04621
        GOSUB   PutComma                         * 04623
LowBat$Fill.L3:
        LC(4)   #3250                            * 04627
        GOSUB   Put2Chars                        * 0462D
LowBat$Fill.L4:
        LC(2)   #29                              * 04631
        GOSUB   PutChar                          * 04635
        ?B=0    P                                * 04639
        GOYES   PadSpaces                        * 0463C
        LC(4)   #203B                            * 0463E
        GOSUB   Put2Chars                        * 04644
LowBat$Fill.L5:
        LC(10)  #6D72616C41                      * 04648
        DAT0=C  10                               * 04654
        D0=D0+  10                               * 04658
        D=D-CON A,5                              * 0465B

* refs (2): 045B2 04639
* D0, D.A = characters left -> : pad with spaces
PadSpaces:
        LC(2)   #20                              * 04661
        GOTO    PadSpaces.L2                     * 04665
PadSpaces.loop1:
        DAT0=C  B                                * 04669
        D0=D0+  2                                * 0466C
PadSpaces.L2:
        D=D-1   A                                * 0466F
        GONC    PadSpaces.loop1                  * 04671
        RTNCC                                    * 04674

* refs (2): 04604 04623
* D0, D.A -> : append a comma
PutComma:
        LC(2)   #2C                              * 04676

* refs (2): 045FB 04635
* C.B = character, D0, D.A -> : append it and count it
PutChar:
        DAT0=C  B                                * 0467A
        D0=D0+  2                                * 0467D
        D=D-1   A                                * 04680
        RTN                                      * 04682

* refs (3): 0461A 0462D 04644
* C = two characters, D0, D.A -> : append them and count them
Put2Chars:
        DAT0=C  4                                * 04684
        D0=D0+  4                                * 04688
        D=D-1   A                                * 0468B
        D=D-1   A                                * 0468D
        RTN                                      * 0468F

* refs (4): 041F2 04549 04584 04763
SAVPTR~jump_2:
        GOVLNG  SAVPTR                           * 04691
* Restart point: reset the keyboard state and input stream, then run FIRSTPROC
RunFirstProc~1:
        P=      0                                * 04698
        LC(1)   #1                               * 0469A
        D1=(5)  DISABLE_KBD                      * 0469D
        DAT1=C  1                                * 046A4
        C=0     W                                * 046A8
        D0=(5)  KEYSTATE                         * 046AB
        DAT0=C  13                               * 046B2
        D0=(5)  INPUTSTREAM                      * 046B6
        DAT0=C  B                                * 046BD
        DAT1=C  1                                * 046C0
        C=C+1   P                                * 046C4
        D1=(5)  INITEN                           * 046C7
        DAT1=C  1                                * 046CE
        D1=(5)  NOALARMSRV                       * 046D2
        C=0     A                                * 046D9
        DAT1=C  1                                * 046DB
        GOSBVL  SetT2WakeClk                     * 046DF
        GOSUBL  GETPTR                           * 046E6
        D0=(5)  FIRSTPROC                        * 046EC
        C=DAT0  A                                * 046F3
        D0=C                                     * 046F6
        D0=D0+  5                                * 046F9
RunFirstProc~1.L1:
        A=DAT0  A                                * 046FC
        D0=D0+  5                                * 046FF
        PC=(A)                                   * 04702
        BSS     2                                * 04706  zeros

* -> #kc T -> F
* refs (2): 34051 42407
CHECKKEY:
        CON(5)  (*)+5                            * 04708  primitive code object
        ST=0    0                                * 0470D
        GOTO    GETTOUCH.L1                      * 04710

* -> #kc T -> F
* refs (3): 1A87D 4216D 421C2
GETTOUCH:
        CON(5)  (*)+5                            * 04714  primitive code object
        ST=1    0                                * 04719
GETTOUCH.L1:
        AD1EX                                    * 0471C
        GOSUB   KbdResume                        * 0471F
        D1=(5)  #8066A                           * 04723
        A=DAT1  S                                * 0472A
        D1=D1-  1                                * 0472E
        C=DAT1  S                                * 04731
        ?C=A    S                                * 04735
        GOYES   GETTOUCH.L3                      * 04738
        P=C     15                               * 0473A
        ?ST=0   0                                * 0473E
        GOYES   GETTOUCH.L2                      * 04741
        C=C+1   S                                * 04743
        DAT1=C  S                                * 04746
GETTOUCH.L2:
        CD1EX                                    * 0474A
        C+P+1                                    * 0474D
        C+P+1                                    * 04750
        P=      0                                * 04753
        D1=C                                     * 04755
        C=0     A                                * 04758
        C=DAT1  B                                * 0475A
        D1=A                                     * 0475D
        R0=C                                     * 04760
        GOSUB   SAVPTR~jump_2                    * 04763
        GOSUBL  PUSH#                            * 04767
        GOVLNG  PushTLoop                        * 0476D
GETTOUCH.L3:
        D1=A                                     * 04774
        GOVLNG  PushFLoop                        * 04777

* refs (2): 0471F 04813
* -> : drive all OUT lines with the keyboard scan held off, clear KEYSTATE if no key is down, then re-enable and raise a scan with RSI
KbdResume:
        LC(3)   #1FF                             * 0477E
        D1=(5)  SAVE_OR                          * 04783
        DAT1=C  3                                * 0478A
        OUT=C                                    * 0478E
        D1=(5)  DISABLE_KBD                      * 04791
        LC(1)   #1                               * 04798
        DAT1=C  1                                * 0479B
        GOSBVL  CINRTN                           * 0479F
        ?C#0    X                                * 047A6
        GOYES   KbdResume.L1                     * 047A9
        GOSBVL  ClrKeyState                      * 047AB
KbdResume.L1:
        C=0     P                                * 047B2
        D1=(5)  DISABLE_KBD                      * 047B5
        DAT1=C  1                                * 047BC
        RSI                                      * 047C0
        RTN                                      * 047C5

* #kc -> flag
* refs (20): 0C85C 0C87F 0C8AC 40EA1 40EBA 46E87 ...
REPKEY?:
        CON(5)  (*)+5                            * 047C7  primitive code object
        AD1EX                                    * 047CC

adrDISABLE_K:
        D1=(5)  DISABLE_KBD                      * 047CF
        LC(1)   #1                               * 047D6
        DAT1=C  1                                * 047D9

adrKEYBUFFER:
        D1=(5)  INPUTSTREAM                      * 047DD
        A=DAT1  S                                * 047E4
        D1=D1+  1                                * 047E8
        C=DAT1  S                                * 047EB
        ?C#A    S                                * 047EF
        GOYES   adrKEYBUFFER.L1                  * 047F2
        D1=A                                     * 047F4
        C=DAT1  A                                * 047F7
        CD1EX                                    * 047FA
        RSTK=C                                   * 047FD
        D1=D1+  5                                * 047FF
        A=DAT1  A                                * 04802
        GOSBVL  KeyDown?                         * 04805
        C=RSTK                                   * 0480C
        A=C     A                                * 0480E
        GOC     adrKEYBUFFER.L2                  * 04810
adrKEYBUFFER.L1:
        GOSUB   KbdResume                        * 04813
        LC(5)   FALSE                            * 04817
        GOTO    adrKEYBUFFER.L3                  * 0481E
adrKEYBUFFER.L2:
        D1=(5)  DISABLE_KBD                      * 04822
        C=0     A                                * 04829
        DAT1=C  1                                * 0482B
        LC(5)   TRUE                             * 0482F
adrKEYBUFFER.L3:
        D1=A                                     * 04836
        DAT1=C  A                                * 04839
        GOTO    RunFirstProc~1.L1                * 0483C

* ( -> C.A ) Sets carry if buffer is empty.Else returns key in C.B (and in @KEYSTORE) Uses: A.S C.S C.A D1 (sets P=0)
* refs (6): 02360 80048 808BA 80F3B 81020 81577
POPKEY:
        D1=(5)  =IR_16Hz_Clock                   * 04840
        C=DAT1  A                                * 04847
        D1=C                                     * 0484A
        P=      0                                * 0484D
        C=0     A                                * 0484F
        D1=(4)  #066A                            * 04851
        A=DAT1  S                                * 04857
        D1=D1-  1                                * 0485B
        C=DAT1  S                                * 0485E
        ?C=A    S                                * 04862
        RTNYES                                   * 04865
        P=C     15                               * 04867
        C=C+1   S                                * 0486B
        DAT1=C  S                                * 0486E
        CD1EX                                    * 04872
        C+P+1                                    * 04875
        C+P+1                                    * 04878
        D1=C                                     * 0487B
        C=0     A                                * 0487E
        C=DAT1  B                                * 04880
        D1=(4)  #068B                            * 04883
        DAT1=C  B                                * 04889
        P=      0                                * 0488C
        RTNCC                                    * 0488E
        RPL

* refs (1): 421BD
* -> : the idle step of key wait: show held shifts, keep the clock display up, and sleep lightly until something happens
IdleSleep:
        :: ShowHeldAnn IdleClock LiteSlp ;       * 04890

* refs (1): 0489A
* -> : update the clock in the status area if it is on, and drop it when the status area has gone
IdleClock:
        :: ClkOn? case                           * 048A9
          :: ~DispTimeReq?;DA1IsStat?;AND case ?HdrClock * 048B8
            ClkOff ;                             * 048CC
          ~DispTimeReq?;DA1IsStat?;AND case      * 048D6
          :: ClkOn ?HdrClock ;                   * 048E0
        ;                                        * 048F4

* refs (2): 048BD 048D6
~DispTimeReq?;DA1IsStat?;AND:
        :: DispTimeReq? DA1IsStat? AND ;         * 048F9

* ->
* refs (1): 0489F
LiteSlp:
        CON(5)  (*)+5                            * 04912  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 04917
        GOSUB   liteslp                          * 0491E
        GOVLNG  GETPTRLOOP                       * 04922

* Puts calc into "lite sleep" Low power mode with display on Wakeup on any key or interrupt
* refs (2): 02807 0491E
liteslp:
        GOSBVL  KbdOutAll                        * 04929
        ST=0    13                               * 04930
        GOSUB   Attn?                            * 04933
        GOC     liteslp.L1                       * 04937
        GOSUB   KeyInBuff?                       * 0493A
        GOC     liteslp.L1                       * 0493E
        GOSUB   AlarmDue?                        * 04941
        GOC     liteslp.L1                       * 04945
        GOSUB   TimedOut?                        * 04948
        GOC     liteslp.L1                       * 0494C
        GOSUB   UartPending?                     * 0494F
        GONC    liteslp.L2                       * 04953
liteslp.L1:
        GOVLNG  BusyOn.L1                        * 04956
liteslp.L2:
        GOSBVL  BusyOff                          * 0495D
        D1=(5)  NOP1MASK14                       * 04964
        LC(1)   #8                               * 0496B
        DAT1=C  1                                * 0496E
        RSI                                      * 04972
        ?ST=1   13                               * 04977
        GOYES   liteslp.L3                       * 0497A
        SHUTDN                                   * 0497C
liteslp.L3:
        LC(1)   #C                               * 0497F
        DAT1=C  1                                * 04982
        RTN                                      * 04986

* Sets carry when ATTNFLG <> 0.
* refs (1): 04933
Attn?:
        D1=(5)  ATTNFLG                          * 04988
        C=DAT1  A                                * 0498F
        ?C#0    A                                * 04992
        RTNYES                                   * 04995
        RTN                                      * 04997

* Carry if true
* refs (3): 0281F 0493A 814B2
KeyInBuff?:
        GOSBVL  D1=IRAM                          * 04999
        D1=(4)  #0669                            * 049A0
        A=DAT1  S                                * 049A6
        D1=D1+  1                                * 049AA
        C=DAT1  S                                * 049AD
        ?C#A    S                                * 049B1
        RTNYES                                   * 049B4
        RTN                                      * 049B6

* refs (2): 04200 04941
* -> carry set if an alarm is due and alarm servicing is not off (flag test at #801)
AlarmDue?:
        P=      0                                * 049B8
        LC(3)   #801                             * 049BA
        GOSBVL  NoIgnoreAlm.L1                   * 049BF
        GOC     AlarmDue?.L1                     * 049C6
        D1=(5)  ALARMSDUE                        * 049C9
        C=DAT1  S                                * 049D0
        ?C#0    S                                * 049D4
        RTNYES                                   * 049D7
AlarmDue?.L1:
        RTNCC                                    * 049D9

* refs (1): 04948
* -> carry set if the top nibble of TIMEOUTCLK is 0
TimedOut?:
        D1=(5)  TIMEOUTCLK                       * 049DB
        C=DAT1  S                                * 049E2
        ?C=0    S                                * 049E6
        RTNYES                                   * 049E9
        RTN                                      * 049EB

* refs (1): 0494F
* -> carry set if bytes wait in the serial buffer and the flag coded #202 is set
UartPending?:
        P=      0                                * 049ED
        D1=(5)  uart_buf_end                     * 049EF
        C=DAT1  X                                * 049F6
        ?C=0    X                                * 049FA
        GOYES   AlarmDue?.L1                     * 049FD
        LC(3)   #202                             * 049FF
        GOVLNG  NoIgnoreAlm.L1                   * 04A04

* #menukey -> ob
* refs (6): 153ED 3FE35 40837 413EB 6BD94 9E45D
GETPROC:
        CON(5)  (*)+5                            * 04A0B  primitive code object
        P=      4                                * 04A10
GETPROC.L1:
        GOSUBL  SAVPTR                           * 04A12
        GOSUBL  POP#                             * 04A18
        R0=A                                     * 04A1E
        GOSUB   TouchTab@                        * 04A21
        GOSUB   TouchEntry                       * 04A25
        A=DAT0  A                                * 04A29
        GOSUBL  GETPTR                           * 04A2C
        DAT1=A  A                                * 04A32
        P=      0                                * 04A35
        A=DAT0  A                                * 04A37
        D0=D0+  5                                * 04A3A
        PC=(A)                                   * 04A3D

* #menukey -> ob
* refs (5): 3A247 41557 4B936 9DED1 9DEFE
GETDF:
        CON(5)  (*)+5                            * 04A41  primitive code object
        P=      8                                * 04A46
        GOTO    GETPROC.L1                       * 04A48

* refs (3): 021EC 3A695 411BB
* ob #menukey -> : store ob as key #menukey's DF action in TOUCHTAB
SETDF:
        CON(5)  (*)+5                            * 04A4C  primitive code object
        P=      8                                * 04A51
        GOTO    SETPROC.L1                       * 04A53

* refs (8): 3A69A 3FCD2 3FCFF 3FD2C 3FD59 3FD86 ...
* ob #menukey -> : store ob as key #menukey's PROC action in TOUCHTAB, making or growing that table if needed
SETPROC:
        CON(5)  (*)+5                            * 04A57  primitive code object
        P=      4                                * 04A5C
SETPROC.L1:
        GOSUBL  POP#                             * 04A5E
        R0=A                                     * 04A64
        GOSUBL  SAVPTR                           * 04A67
SETPROC.loop2:
        GOSUB   TouchTab@                        * 04A6D
        C=R0                                     * 04A71
        GONC    SETPROC.L5                       * 04A74
        ?B<C    A                                * 04A77
        GOYES   SETPROC.L4                       * 04A7A
        ?P=     1                                * 04A7C
        GOYES   SETPROC.L3                       * 04A7F
        GOSUB   TouchEntry                       * 04A81
        R0=A                                     * 04A85
        GOSUBL  GETPTR                           * 04A88
        A=DAT1  A                                * 04A8E
        D1=D1+  5                                * 04A91
        D=D+1   A                                * 04A94
        C=R0                                     * 04A96
        CD0EX                                    * 04A99
        DAT0=A  A                                * 04A9C
        D0=C                                     * 04A9F
        P=      0                                * 04AA2
        A=DAT0  A                                * 04AA4
        D0=D0+  5                                * 04AA7
        PC=(A)                                   * 04AAA
SETPROC.L3:
        GOSUB   TouchEntry2                      * 04AAE
        A=R3                                     * 04AB2
        DAT0=A  A                                * 04AB5
        D0=D0+  5                                * 04AB8
        A=R4                                     * 04ABB
        DAT0=A  A                                * 04ABE
        GOSUBL  GETPTR                           * 04AC1
        P=      0                                * 04AC7
        A=DAT0  A                                * 04AC9
        D0=D0+  5                                * 04ACC
        PC=(A)                                   * 04ACF
SETPROC.L4:
        GOSUB   TouchGrowSize                    * 04AD3
        C=D     A                                * 04AD7
        GOSUB   RoomOrGCP                        * 04AD9
        GOSUB   TouchGrowAll                     * 04ADD
        GOTO    SETPROC.loop2                    * 04AE1
SETPROC.L5:
        ?B<C    A                                * 04AE5
        GOYES   SETPROC.L7                       * 04AE8
        GOSUB   TouchTabSize                     * 04AEA
        GOSUB   RoomOrGCP                        * 04AEE
SETPROC.loop6:
        GOSUB   TouchAddTab                      * 04AF2
        GOTO    SETPROC.loop2                    * 04AF6
SETPROC.L7:
        GOSUB   TouchGrowSize                    * 04AFA
        C=R0                                     * 04AFE
        B=C     A                                * 04B01
        GOSUB   TouchTabSize                     * 04B03
        C=C+D   A                                * 04B07
        GOSUB   RoomOrGCP                        * 04B09
        GOSUB   TouchGrowAll                     * 04B0D
        GOTO    SETPROC.loop6                    * 04B11

* refs (4): 04A21 04A6D 04C2C 04CAE
* P = table selector (8 DF, 4 PROC, 2, 1) -> D0 at the table in TOUCHTAB, B.A = entries per table, C.S top bit set if this table exists. TOUCHTAB starts with one nibble of table bits and a count byte
TouchTab@:
        D0=(5)  TOUCHTAB                         * 04B15
        C=DAT0  A                                * 04B1C
        D0=C                                     * 04B1F
        C=DAT0  S                                * 04B22
        D0=D0+  1                                * 04B26
        C=0     A                                * 04B29
        C=DAT0  B                                * 04B2B
        B=C     A                                * 04B2E
        C=C+C   A                                * 04B30
        C=C+C   A                                * 04B32
        C=C+B   A                                * 04B34
        D0=D0+  2                                * 04B36
        AD0EX                                    * 04B39
        ?P=     8                                * 04B3C
        GOYES   TouchTab@.L4                     * 04B3F
        C=C+C   S                                * 04B41
        GONC    TouchTab@.L1                     * 04B44
        A=A+C   A                                * 04B47
TouchTab@.L1:
        ?P=     4                                * 04B49
        GOYES   TouchTab@.L4                     * 04B4C
        C=C+C   S                                * 04B4E
        GONC    TouchTab@.L2                     * 04B51
        A=A+C   A                                * 04B54
TouchTab@.L2:
        ?P=     2                                * 04B56
        GOYES   TouchTab@.L4                     * 04B59
        C=C+C   S                                * 04B5B
        GONC    TouchTab@.L3                     * 04B5E
        A=A+C   A                                * 04B61
TouchTab@.L3:
        D0=A                                     * 04B63
        D0=D0+  5                                * 04B66
        AD0EX                                    * 04B69
        C=C+C   A                                * 04B6C
TouchTab@.L4:
        C=C+C   S                                * 04B6E
        D0=A                                     * 04B71
        RTN                                      * 04B74

* refs (2): 04A25 04A81
* A.A = table address, R0 = key -> D0 at that key's 5-nibble entry
TouchEntry:
        C=R0                                     * 04B76
        C=C-1   A                                * 04B79
TouchEntry.L1:
        D=C     A                                * 04B7B
        C=C+C   A                                * 04B7D
        C=C+C   A                                * 04B7F
        C=C+D   A                                * 04B81
        A=A+C   A                                * 04B83
        D0=A                                     * 04B85
        RTN                                      * 04B88

* refs (1): 04AAE
* As TouchEntry for the 10-nibble entries of table 1
TouchEntry2:
        C=R0                                     * 04B8A
        C=C-1   A                                * 04B8D
        C=C+C   A                                * 04B8F
        GONC    TouchEntry.L1                    * 04B91

* refs (2): 04AEA 04B03
* B.A = entries, P -> C.A = nibbles of one table (doubled for table 1)
TouchTabSize:
        C=B     A                                * 04B94
        C=C+C   A                                * 04B96
        C=C+C   A                                * 04B98
        C=C+B   A                                * 04B9A
        ?P#     1                                * 04B9C
        RTNYES                                   * 04B9F
        C=C+C   A                                * 04BA1
        RTN                                      * 04BA3

* refs (2): 04AD3 04AFA
* B.A = old count, R0 = new count -> R1 = nibbles added per plain table, D.A = total for all tables present
TouchGrowSize:
        C=R0                                     * 04BA5
        C=C-B   A                                * 04BA8
        D=C     A                                * 04BAA
        C=C+C   A                                * 04BAC
        C=C+C   A                                * 04BAE
        C=C+D   A                                * 04BB0
        D=0     A                                * 04BB2
        R1=C                                     * 04BB4
        D0=(5)  TOUCHTAB                         * 04BB7
        A=DAT0  A                                * 04BBE
        D0=A                                     * 04BC1
        A=DAT0  S                                * 04BC4
        A=A+A   S                                * 04BC8
        GONC    TouchGrowSize.L1                 * 04BCB
        D=D+C   A                                * 04BCE
TouchGrowSize.L1:
        A=A+A   S                                * 04BD0
        GONC    TouchGrowSize.L2                 * 04BD3
        D=D+C   A                                * 04BD6
TouchGrowSize.L2:
        A=A+A   S                                * 04BD8
        GONC    TouchGrowSize.L3                 * 04BDB
        D=D+C   A                                * 04BDE
TouchGrowSize.L3:
        A=A+A   S                                * 04BE0
        RTNNC                                    * 04BE3
        D=D+C   A                                * 04BE6
        D=D+C   A                                * 04BE8
        RTN                                      * 04BEA

* refs (3): 04AD9 04AEE 04B09
* C.A = nibbles needed -> : as RoomOrGC, keeping P and leaving D.A = the amount
RoomOrGCP:
        D=C     A                                * 04BEC
        GOSUBL  ROOM                             * 04BEE
        DCEX    A                                * 04BF4
        ?D>=C   A                                * 04BF6
        RTNYES                                   * 04BF9
        C=P     15                               * 04BFB
        R2=C                                     * 04BFF
        GOSUBL  GARBAGECOL                       * 04C02
        C=R2                                     * 04C08
        P=C     15                               * 04C0B
        D=C     A                                * 04C0F
        GOSUBL  ROOM                             * 04C11
        DCEX    A                                * 04C17
        ?D>=C   A                                * 04C19
        RTNYES                                   * 04C1C
RoomOrGCP.L1:
        GOSUBL  GETPTR                           * 04C1E
        P=      0                                * 04C24
        GOLONG  DOMEMERR                         * 04C26

* refs (1): 04AF2
* Insert the table selected by P, filled with F, and set its bit in TOUCHTAB
TouchAddTab:
        GOSUB   TouchTab@                        * 04C2C
        C=P     15                               * 04C30
        R2=C                                     * 04C34
        GOSUBL  MOVEDSD                          * 04C37
        A=B     A                                * 04C3D
        D1=A                                     * 04C3F
        C=R2                                     * 04C42
        A=0     W                                * 04C45
        A=-A-1  W                                * 04C48
        GOSUBL  WIPEOUT.L1                       * 04C4B
        P=C     15                               * 04C51
        D0=(5)  TOUCHTAB                         * 04C55
        A=DAT0  A                                * 04C5C
        D0=A                                     * 04C5F
        A=DAT0  S                                * 04C62
        A=A!C   S                                * 04C66
        DAT0=A  S                                * 04C6A
        RTN                                      * 04C6E

* refs (2): 04ADD 04B0D
* Grow all four tables to the count in R0 and store the count
TouchGrowAll:
        C=P     15                               * 04C70
        R2=C                                     * 04C74
        P=      1                                * 04C77
        GOSUB   TouchGrowTab                     * 04C79
        P=      2                                * 04C7D
        GOSUB   TouchGrowTab                     * 04C7F
        P=      4                                * 04C83
        GOSUB   TouchGrowTab                     * 04C85
        P=      8                                * 04C89
        GOSUB   TouchGrowTab                     * 04C8B
        D0=(5)  TOUCHTAB                         * 04C8F
        A=DAT0  A                                * 04C96
        D0=A                                     * 04C99
        D0=D0+  1                                * 04C9C
        A=R0                                     * 04C9F
        DAT0=A  B                                * 04CA2
        C=R2                                     * 04CA5
        P=C     15                               * 04CA8
        RTN                                      * 04CAC

* refs (4): 04C79 04C7F 04C85 04C8B
* Grow the table selected by P, if present, by the amount in R1
TouchGrowTab:
        GOSUB   TouchTab@                        * 04CAE
        RTNNC                                    * 04CB2
        A=A+C   A                                * 04CB5
        C=R1                                     * 04CB7
        ?P#     1                                * 04CBA
        GOYES   TouchGrowTab.L1                  * 04CBD
        C=C+C   A                                * 04CBF
TouchGrowTab.L1:
        RSTK=C                                   * 04CC1
        GOSUBL  MOVEDSD                          * 04CC3
        C=RSTK                                   * 04CC9
        A=B     A                                * 04CCB
        D1=A                                     * 04CCD
        A=0     W                                * 04CD0
        A=-A-1  W                                * 04CD3
        GOLONG  WIPEOUT.L1                       * 04CD6
        BSS     10                               * 04CDC  zeros

* -> #
* refs (40): 143F2 1441F 14663 14677 14686 17BA9 ...
ERROR@:
        CON(5)  (*)+5                            * 04CE6  primitive code object
        GOSUBL  SAVPTR                           * 04CEB
        D0=(5)  ERROR                            * 04CF1
        A=DAT0  A                                * 04CF8
        R0=A                                     * 04CFB
        GOSUBL  PUSH#                            * 04CFE
        A=DAT0  A                                * 04D04
        D0=D0+  5                                * 04D07
        PC=(A)                                   * 04D0A

* # ->
* refs (8): 15034 15057 15644 28AF1 32FC7 6383F ...
ERRORSTO:
        CON(5)  (*)+5                            * 04D0E  primitive code object
        GOSUBL  POP#                             * 04D13
ERRORSTO.L1:
        CD0EX                                    * 04D19
        D0=(5)  ERROR                            * 04D1C
        DAT0=A  A                                * 04D23
        D0=C                                     * 04D26
        A=DAT0  A                                * 04D29
        D0=D0+  5                                * 04D2C
        PC=(A)                                   * 04D2F

* ->
* refs (17): 04EA9 17BD6 1B160 1CEC3 202AE 25A01 ...
ERRORCLR:
        CON(5)  (*)+5                            * 04D33  primitive code object
        A=0     A                                * 04D38
        GOTO    ERRORSTO.L1                      * 04D3A

* ob -> NULL$
* refs (9): 04DC8 2F9C5 40A2E 48BA7 49C40 9CCB1 ...
DROPNULL$:
        CON(5)  (*)+5                            * 04D3E  primitive code object
DROPNULL$.L1:
        LC(5)   NULL$                            * 04D43
        DAT1=C  A                                * 04D4A
        A=DAT0  A                                * 04D4D
        D0=D0+  5                                * 04D50
        PC=(A)                                   * 04D53

* ob ob' -> NULL$
* refs (1): 2DD4C
TWODROPNULL$:
        CON(5)  (*)+5                            * 04D57  primitive code object
        D1=D1+  5                                * 04D5C
        D=D+1   A                                * 04D5F
        GONC    DROPNULL$.L1                     * 04D61  always taken
        RPL

* # -> $
* refs (13): 1407E 1567B 15D7E 2DD15 2E05E 2EFBE ...
GETTHEMESG:
        :: #EXITERR OVER#= ITE GETEXITMSG JstGetTHEMESG * 04D64
        ;                                        * 04D82

* # -> $
* refs (100): 04274 0427E 04D7D 1541A 1560D 1590E ...
JstGetTHEMESG:
        :: SPLITmsg GETMSG '                     * 04D87
          :: GETEL ' TOTEMPOB ' NULL$ RPITE ; ' DROPNULL$ RPITE ; * 04D9B

* #msg -> #error #libnum
* refs (1): 04D8C
SPLITmsg:
        CON(5)  (*)+5                            * 04DD7  primitive code object
        ASSEMBLE
        GOSUBL  POP#                             * 04DDC
        GOSUBL  SAVPTR                           * 04DE2
        C=0     A                                * 04DE8
        C=A     B                                * 04DEA
        R0=C                                     * 04DED
        ASR     A                                * 04DF0
        ASR     A                                * 04DF2
        R1=A                                     * 04DF4
        GOSUBL  PUSH2#                           * 04DF7
        A=DAT0  A                                * 04DFD
        D0=D0+  5                                * 04E00
        PC=(A)                                   * 04E03

* -> $
* refs (1): 04D78
GETEXITMSG:
        CON(5)  (*)+5                            * 04E07  primitive code object
        LC(5)   EXITMSG                          * 04E0C
        CD1EX                                    * 04E13
        A=DAT1  A                                * 04E16
        D1=C                                     * 04E19
        ?A#0    A                                * 04E1C
        GOYES   GETEXITMSG.L1                    * 04E1F
        LC(5)   NULL$                            * 04E21
        A=C     A                                * 04E28
GETEXITMSG.L1:
        DAT1=A  A                                * 04E2A
        A=DAT0  A                                * 04E2D
        D0=D0+  5                                * 04E30
        PC=(A)                                   * 04E33

* $ ->
* refs (2): 1504D 2D901
EXITMSGSTO:
        CON(5)  (*)+5                            * 04E37  primitive code object
        A=DAT1  A                                * 04E3C
        D1=D1+  5                                * 04E3F
        D=D+1   A                                * 04E42
        LC(5)   EXITMSG                          * 04E44
        CD1EX                                    * 04E4B
        DAT1=A  A                                * 04E4E
        D1=C                                     * 04E51
        A=DAT0  A                                * 04E54
        D0=D0+  5                                * 04E57
        PC=(A)                                   * 04E5A

* ->
* refs (163): 143B6 1462C 14A41 14AFA 14B59 14B8B ...
ERRSET:
        CON(5)  (*)+5                            * 04E5E  primitive code object
        AD0EX                                    * 04E63

addrTEMPENV:
        D0=(5)  TEMPENV                          * 04E66
        GOSUB   ProtectEnv                       * 04E6D
        D0=(5)  DOLPENV                          * 04E71
        GOSUB   ProtectEnv                       * 04E78
        D0=A                                     * 04E7C
        A=DAT0  A                                * 04E7F
        D0=D0+  5                                * 04E82
        PC=(A)                                   * 04E85

* refs (2): 04E6D 04E78
* D0 at TEMPENV or DOLPENV -> : count one more error trap in the protection word of the top environment
ProtectEnv:
        C=DAT0  A                                * 04E89
        D0=C                                     * 04E8C
        C=DAT0  A                                * 04E8F
        ?C=0    A                                * 04E92
        RTNYES                                   * 04E95
        D0=D0+  5                                * 04E97
        C=DAT0  A                                * 04E9A
        C=C+1   A                                * 04E9D
        DAT0=C  A                                * 04E9F
        RTN                                      * 04EA2
        RPL

* ->
* refs (9): 1443D 1A7A6 2E4B4 32FEF 42434 42452 ...
ABORT:
        :: ERRORCLR ERRJMP ;                     * 04EA4

* ->
* refs (158): 04EDA 143DE 14645 146F4 14D7D 14DE1 ...
ERRTRAP:
        CON(5)  (*)+5                            * 04EB8  primitive code object
        ASSEMBLE
        GOSUB   UnprotEnvs                       * 04EBD
        GOSUBL  SKIPOB                           * 04EC1
        A=DAT0  A                                * 04EC7
        D0=D0+  5                                * 04ECA
        PC=(A)                                   * 04ECD

* ->
* refs (105): 04EAE 05033 1441A 1442E 14442 14681 ...
ERRJMP:
        CON(5)  (*)+5                            * 04ED1  primitive code object
        GOSUB   UnprotEnvs                       * 04ED6
        LC(5)   ERRTRAP                          * 04EDA
        GONC    ERRJMP.L3                        * 04EE1
ERRJMP.loop1:
        A=B     A                                * 04EE4
        D0=A                                     * 04EE6
        D0=D0-  5                                * 04EE9
        A=DAT0  A                                * 04EEC
        D=D+1   A                                * 04EEF
        ?A#0    A                                * 04EF1
        GOYES   ERRJMP.L2                        * 04EF4
        P=      13                               * 04EF6
        GOVLNG  Warmstart.L1                     * 04EF8
ERRJMP.L2:
        AD0EX                                    * 04EFF
        B=A     A                                * 04F02
ERRJMP.L3:
        A=DAT0  A                                * 04F04
        ?C#A    A                                * 04F07
        GOYES   ERRJMP.loop1                     * 04F0A
        D0=D0+  5                                * 04F0C
        A=DAT0  A                                * 04F0F
        D0=D0+  5                                * 04F12
        PC=(A)                                   * 04F15

* refs (2): 04EBD 04ED6
* -> : error unwinding: drop temporary and DO-loop environments down to the newest with a nonzero protection word, and count that word down
UnprotEnvs:
        GOSUBL  SAVPTR                           * 04F19
        D0=(5)  TEMPENV                          * 04F1F
        C=DAT0  A                                * 04F26
UnprotEnvs.loop1:
        D1=C                                     * 04F29
        A=DAT1  A                                * 04F2C
        ?A=0    A                                * 04F2F
        GOYES   UnprotEnvs.L3                    * 04F32
        B=A     A                                * 04F34
        D1=D1+  5                                * 04F36
        A=DAT1  A                                * 04F39
        ?A#0    A                                * 04F3C
        GOYES   UnprotEnvs.L2                    * 04F3F
        C=C+B   A                                * 04F41
        GONC    UnprotEnvs.loop1                 * 04F43
UnprotEnvs.L2:
        A=A-1   A                                * 04F46
        DAT1=A  A                                * 04F48
UnprotEnvs.L3:
        A=DAT0  A                                * 04F4B
        DAT0=C  A                                * 04F4E
        C=C-A   A                                * 04F51
        ?C=0    A                                * 04F53
        GOYES   UnprotEnvs.L4                    * 04F56
        GOSUBL  MOVEDSU                          * 04F58
UnprotEnvs.L4:
        D0=(5)  DOLPENV                          * 04F5E
        C=DAT0  A                                * 04F65
        D0=C                                     * 04F68
        D1=C                                     * 04F6B
        D1=D1-  10                               * 04F6E
        C=DAT0  A                                * 04F71
UnprotEnvs.loop5:
        D1=D1+  15                               * 04F74
        C=C-1   A                                * 04F77
        GOC     UnprotEnvs.L6                    * 04F79
        A=DAT1  A                                * 04F7C
        ?A=0    A                                * 04F7F
        GOYES   UnprotEnvs.loop5                 * 04F82
        A=A-1   A                                * 04F84
        DAT1=A  A                                * 04F86
UnprotEnvs.L6:
        C=C+1   A                                * 04F89
        DAT0=C  A                                * 04F8B
        CD1EX                                    * 04F8E
        D0=D0+  5                                * 04F91
        AD0EX                                    * 04F94
        C=C-A   A                                * 04F97
        ?C=0    A                                * 04F99
        GOYES   UnprotEnvs.L7                    * 04F9C
        GOSUBL  MOVEDSU                          * 04F9E
UnprotEnvs.L7:
        GOLONG  GETPTR                           * 04FA4

* Error 006h
SETLBERR:
        CON(5)  (*)+5                            * 04FAA  primitive code object

* refs (1): 04FAA
doErrPL:
        LC(1)   #6                               * 04FAF
        GOTO    DoErrCp                          * 04FB2

* Error 001h
* refs (2): 0B08F 0B647
SETMEMERR:
        CON(5)  (*)+5                            * 04FB6  primitive code object

* Insufficient Memory error
* refs (27): 02D8D 0343C 039E9 03ABA 04C26 04FB6 ...
DOMEMERR:
        LC(1)   #1                               * 04FBB
        GOTO    DoErrCp                          * 04FBE

* Error 002h
SETDIRRECUR:
        CON(5)  (*)+5                            * 04FC2  primitive code object
SETDIRRECUR.L1:
        LC(1)   #2                               * 04FC7
        GOTO    DoErrCp                          * 04FCA

* Error 003h
* refs (1): 02FE5
SETLAMERR:
        CON(5)  (*)+5                            * 04FCE  primitive code object

* refs (3): 04FCE 07D89 8C50C
DoErrULN:
        LC(1)   #3                               * 04FD3
        GOTO    DoErrCp                          * 04FD6

* Error 008h
* refs (2): 72314 72332
SETCORPORT:
        CON(5)  (*)+5                            * 04FDA  primitive code object

* refs (2): 04FDA 09F4A
DoErrICD:
        LC(1)   #8                               * 04FDF
        GOTO    DoErrCp                          * 04FE2

* Error 009h
* refs (5): 09002 0928A 09442 21A6C 21ACB
SETOBINUSE:
        CON(5)  (*)+5                            * 04FE6  primitive code object

* refs (1): 04FE6
doerrOIU:
        LC(1)   #9                               * 04FEB
        GOTO    DoErrCp                          * 04FEE

* Error 00Ah
* refs (12): 08FC6 092BC 092DF 0B464 2121F 2131C ...
SETPORTNOTAV:
        CON(5)  (*)+5                            * 04FF2  primitive code object

* refs (1): 04FF2
DoerrPNA:
        LC(1)   #A                               * 04FF7
        GOTO    DoErrCp                          * 04FFA

* Error 00Bh
* refs (2): 09098 0B61F
SETNOROOM:
        CON(5)  (*)+5                            * 04FFE  primitive code object

* refs (1): 04FFE
DoErrNRP:
        LC(1)   #B                               * 05003
        GOTO    DoErrCp                          * 05006

* Error 00Ch
SETXNONEXT:
        CON(5)  (*)+5                            * 0500A  primitive code object

* refs (1): 0500A
DoErrONP:
        LC(1)   #C                               * 0500F
        GOTO    DoErrCp                          * 05012

* Error 004h
* refs (8): 02FFE 40530 5E9F0 5F429 5F69D 72BB4 ...
SETROMPERR:
        CON(5)  (*)+5                            * 05016  primitive code object

* refs (2): 05016 72E96
DoErrUXM:
        LC(1)   #4                               * 0501B

* refs (9): 04FB2 04FBE 04FCA 04FD6 04FE2 04FEE ...
DoErrCp:
        A=0     A                                * 0501E
        A=C     P                                * 05020

* Error exit A.A = error number
* refs (8): 0CBE8 10F08 10F4D 18CD0 29E1A 2D315 ...
Errjmp:
        CD0EX                                    * 05023
        D0=(5)  ERROR                            * 05026
        DAT0=A  A                                * 0502D
        D0=C                                     * 05030
        LC(5)   ERRJMP                           * 05033
        A=C     A                                * 0503A
        PC=(A)                                   * 0503C

* -> #
* refs (8): 4C087 4C21F 501B8 50D96 50DAA 57A52 ...
ATTNFLG@:
        CON(5)  (*)+5                            * 05040  primitive code object
        GOSUBL  SAVPTR                           * 05045
        D0=(5)  ATTNFLG                          * 0504B
        A=DAT0  A                                * 05052
        R0=A                                     * 05055
        GOSUBL  PUSH#                            * 05058
        A=DAT0  A                                * 0505E
        D0=D0+  5                                * 05061
        PC=(A)                                   * 05064

* ->
* refs (24): 18006 2DAFE 34310 420FA 42425 42448 ...
ATTNFLGCLR:
        CON(5)  (*)+5                            * 05068  primitive code object
        A=0     A                                * 0506D
        CD0EX                                    * 0506F
        D0=(5)  ATTNFLG                          * 05072
        DAT0=A  A                                * 05079
        D0=C                                     * 0507C
        A=DAT0  A                                * 0507F
        D0=D0+  5                                * 05082
        PC=(A)                                   * 05085

* comp -> ob_head comp_null -> comp_null
* refs (116): 09389 0F358 0FCEB 0FD54 0FD72 0FD95 ...
CARCOMP:
        CON(5)  (*)+5                            * 05089  primitive code object
        C=DAT1  A                                * 0508E
        CD1EX                                    * 05091
        RSTK=C                                   * 05094
        D1=D1+  5                                * 05096
        A=DAT1  A                                * 05099
        LC(5)   SEMI                             * 0509C
        ?C=A    A                                * 050A3
        GOYES   CARCOMP.L2                       * 050A6
        C=A     A                                * 050A8
        CD0EX                                    * 050AA
        RSTK=C                                   * 050AD
        A=DAT0  A                                * 050AF
        LC(5)   PRLG                             * 050B2
        ?C=A    A                                * 050B9
        GOYES   CARCOMP.L1                       * 050BC
        AD0EX                                    * 050BE
        D1=A                                     * 050C1
CARCOMP.L1:
        AD1EX                                    * 050C4
        C=RSTK                                   * 050C7
        D0=C                                     * 050C9
        C=RSTK                                   * 050CC
        D1=C                                     * 050CE
        DAT1=A  A                                * 050D1
        A=DAT0  A                                * 050D4
        D0=D0+  5                                * 050D7
        PC=(A)                                   * 050DA
CARCOMP.L2:
        C=RSTK                                   * 050DE
        D1=C                                     * 050E0
        A=DAT0  A                                * 050E3
        D0=D0+  5                                * 050E6
        PC=(A)                                   * 050E9

* $ -> chr -> ""
* refs (14): 0F098 0FF6B 14123 2DE9D 2E944 2FA88 ...
CAR$:
        CON(5)  (*)+5                            * 050ED  primitive code object
        GOSUBL  SAVPTR                           * 050F2
        A=DAT1  A                                * 050F8
        D1=A                                     * 050FB
        D1=D1+  5                                * 050FE
        A=DAT1  A                                * 05101
        LC(5)   #00005                           * 05104
        ?C=A    A                                * 0510B
        GOYES   GETPTRLOOP                       * 0510E
        D1=D1+  5                                * 05110
        C=DAT1  B                                * 05113
        RSTK=C                                   * 05116
        LC(5)   #00007                           * 05118
        GOSUBL  GETTEMP                          * 0511F
        LC(5)   DOCHAR                           * 05125
        DAT0=C  A                                * 0512C
        AD0EX                                    * 0512F
        D1=A                                     * 05132
        D1=D1+  5                                * 05135
        C=RSTK                                   * 05138
        DAT1=C  B                                * 0513A
        GOLONG  GPOverWrALp                      * 0513D

* <REF>GETPTR , Loop to RPL
* refs (59): 01749 01FB6 04922 0510B 06E87 074C9 ...
GETPTRLOOP:
        GOSUBL  GETPTR                           * 05143
GETPTRLOOP.L1:
        A=DAT0  A                                * 05149
        D0=D0+  5                                * 0514C
        PC=(A)                                   * 0514F
        RPL

* comp -> comp-ob_head comp_null -> comp_null
* refs (11): 184C8 20C7B 4506A 467AC 6B8DA 6C131 ...
CDRCOMP:
        :: BINT2 CDRCOMP~1 SUBCOMP ;             * 05153

* $ -> $'
* refs (6): 0F0B1 0FF89 6B33B 9F7BA 9F8F2 C19CD
CDR$:
        :: BINT2                                 * 0516C

* refs (1): 0515D
CDRCOMP~1:
          # FFFFF SUB$ ;                         * 05176

* hxs hxs' -> hxs''
* refs (4): 4F90D 4F93A 6A47E 6A4A6
&HXS:
        CON(5)  (*)+5                            * 0518A  primitive code object
        ASSEMBLE
        GOTO    &HXS~1                           * 0518F

* $ $' -> $+$'
* refs (97): 0D32E 0F326 14B22 15CFC 18196 181AA ...
&$:
        CON(5)  (*)+5                            * 05193  primitive code object
&HXS~1:
        ST=0    10                               * 05198
        GOSUBL  SAVPTR                           * 0519B
        A=DAT1  A                                * 051A1
        D0=A                                     * 051A4
        C=DAT0  A                                * 051A7
        R4=C                                     * 051AA
        D1=D1+  5                                * 051AD
        A=DAT1  A                                * 051B0
        D1=A                                     * 051B3
        D0=D0+  5                                * 051B6
        D1=D1+  5                                * 051B9
        A=DAT0  A                                * 051BC
        C=DAT1  A                                * 051BF
        C=C+A   A                                * 051C2
        GONC    &HXS~1.L1                        * 051C4
        GOTO    DOGARBAGE.L1                     * 051C7
&HXS~1.L1:
        C=C-CON A,10                             * 051CB
        GOSUBL  MAKE$N                           * 051D1
        RSTK=C                                   * 051D7
        CD0EX                                    * 051D9
        D0=D0+  5                                * 051DC
        D1=C                                     * 051DF
        D1=D1-  10                               * 051E2
        C=R4                                     * 051E5
        DAT1=C  A                                * 051E8
        D1=D1+  10                               * 051EB
        GOSUB   CopyBody                         * 051EE
        C=RSTK                                   * 051F2
        D0=C                                     * 051F4
&HXS~1.L2:
        GOSUB   CopyBody                         * 051F7
        A=R0                                     * 051FB
        GOLONG  %%>C%%.L1                        * 051FE

* refs (2): 051EE 051F7
* D0 at a pointer to a string-like object, D1 -> : copy its body to D1 by MOVEDOWN, D1 past it
CopyBody:
        C=DAT0  A                                * 05204
        D0=C                                     * 05207
        D0=D0+  5                                * 0520A
        C=DAT0  A                                * 0520D
        D0=D0+  5                                * 05210
        C=C-CON A,5                              * 05213
        GOLONG  MOVEDOWN                         * 05219
        RPL

* comp comp' -> comp''
* refs (17): 1AC34 3F1FC 4FAA7 4FAE8 4FAED A0116 ...
&COMP:
        :: DUP TYPE SWAPROT INNERCOMP get1 INNERCOMP get1 #+ get1 COMPN ; * 0521F

* $ chr -> $'
* refs (20): 0F29A 14AAF 14AB9 14AC8 14D96 15D24 ...
>H$:
        CON(5)  (*)+5                            * 0525B  primitive code object
        ASSEMBLE
        ST=1    1                                * 05260
>H$.L1:
        ST=0    10                               * 05263
        GOSUBL  SAVPTR                           * 05266
        A=DAT1  A                                * 0526C
        D0=A                                     * 0526F
        D0=D0+  5                                * 05272
        C=DAT0  B                                * 05275
        R1=C                                     * 05278
        D1=D1+  5                                * 0527B
        A=DAT1  A                                * 0527E
        D0=A                                     * 05281
        D0=D0+  5                                * 05284
        C=DAT0  A                                * 05287
        C=C-CON A,3                              * 0528A
        GOSUBL  MAKE$N                           * 05290
        RSTK=C                                   * 05296
        CD0EX                                    * 05298
        D1=C                                     * 0529B
        C=C+A   A                                * 0529E
        D0=C                                     * 052A0
        C=R1                                     * 052A3
        ?ST=1   1                                * 052A6
        GOYES   >H$.L2                           * 052A9
        D0=D0-  7                                * 052AB
        DAT0=C  B                                * 052AE
        GONC    >H$.L3                           * 052B1
>H$.L2:
        DAT1=C  B                                * 052B4
        D1=D1+  2                                * 052B7
>H$.L3:
        C=RSTK                                   * 052BA
        D0=C                                     * 052BC
        D0=D0+  5                                * 052BF
        GOTO    &HXS~1.L2                        * 052C2
        RPL

* comp ob -> ob+comp
* refs (23): 1728E 184AF 184D7 1AC9D 225AD 45074 ...
>HCOMP:
        :: OVER INNERCOMP #1+ get1 TYPE COMPN ;  * 052C6

* $ chr -> $'
* refs (35): 0D31F 0D33A 1279D 14105 15D2E 170D1 ...
>T$:
        CON(5)  (*)+5                            * 052EE  primitive code object
        ASSEMBLE
        ST=0    1                                * 052F3
        GOTO    >H$.L1                           * 052F6
        RPL

* comp ob -> comp+ob
* refs (35): 08E3D 15264 152E1 152F5 186C0 1AC48 ...
>TCOMP:
        :: OVER TYPE SWAPROT INNERCOMP #1+DUP #1+ROLL SWAP get1 COMPN ; * 052FA

* obn..ob1 #n #prolog -> comp
* refs (7): 05251 052E4 05327 0544F 05463 05477 ...
COMPN:
        CON(5)  (*)+5                            * 05331  primitive code object
        ASSEMBLE
        GOSUBL  POP#                             * 05336
        R4=A                                     * 0533C
        GOSUBL  SAVPTR                           * 0533F
        GOSUBL  POP#                             * 05345
        LC(5)   portnotaverr                     * 0534B  "Port Not Available"
        D=C     A                                * 05352
        C=A     A                                * 05354
        R0=C                                     * 05356
COMPN.loop1:
        C=C-1   A                                * 05359
        GOC     COMPN.L6                         * 0535B
        RSTK=C                                   * 0535E
        A=DAT1  A                                * 05360
        LC(5)   CMOS                             * 05363
        ?C<=A   A                                * 0536A
        GOYES   COMPN.L2                         * 0536D
        LC(5)   #00005                           * 0536F
        GONC    COMPN.L3                         * 05376
COMPN.L2:
        D0=A                                     * 05379
        B=A     A                                * 0537C
        GOSUBL  SKIPOB                           * 0537E
        CD0EX                                    * 05384
        C=C-B   A                                * 05387
COMPN.L3:
        D=D+C   A                                * 05389
        GONC    COMPN.L4                         * 0538B
        GOTO    DOGARBAGE.L1                     * 0538E
COMPN.L4:
        D1=D1+  5                                * 05392
        C=RSTK                                   * 05395
        GONC    COMPN.loop1                      * 05397
COMPN.loop5:
        GOSUB   DOGARBAGE                        * 0539A
        C=R3                                     * 0539E
        GONC    COMPN.L7                         * 053A1
COMPN.L6:
        CD1EX                                    * 053A4
        RSTK=C                                   * 053A7
        C=D     A                                * 053A9
        R3=C                                     * 053AB
        ST=0    10                               * 053AE
COMPN.L7:
        GOSUBL  CREATETEMP                       * 053B1
        GOC     COMPN.loop5                      * 053B7
        CD0EX                                    * 053BA
        R1=C                                     * 053BD
        D1=C                                     * 053C0
        C=R4                                     * 053C3
        DAT1=C  A                                * 053C6
        D1=D1+  5                                * 053C9
        C=R0                                     * 053CC
        D=C     A                                * 053CF
COMPN.loop8:
        C=RSTK                                   * 053D1
        D=D-1   A                                * 053D3
        GOC     COMPN.L10                        * 053D5
        D0=C                                     * 053D8
        D0=D0-  5                                * 053DB
        A=DAT0  A                                * 053DE
        CD0EX                                    * 053E1
        RSTK=C                                   * 053E4
        LC(5)   CMOS                             * 053E6
        ?C<=A   A                                * 053ED
        GOYES   COMPN.L9                         * 053F0
        DAT1=A  A                                * 053F2
        D1=D1+  5                                * 053F5
        GONC    COMPN.loop8                      * 053F8
COMPN.L9:
        B=A     A                                * 053FB
        D0=A                                     * 053FD
        GOSUBL  SKIPOB                           * 05400
        C=B     A                                * 05406
        CD0EX                                    * 05408
        C=C-B   A                                * 0540B
        GOSUBL  MOVEDOWN                         * 0540D
        GONC    COMPN.loop8                      * 05413
COMPN.L10:
        LC(5)   SEMI                             * 05416
        DAT1=C  A                                * 0541D
        GOSUBL  GETPTR                           * 05420
        C=R0                                     * 05426
        D=D+C   A                                * 05429
        A=C     A                                * 0542B
        C=C+C   A                                * 0542D
        C=C+C   A                                * 0542F
        C=C+A   A                                * 05431
        AD1EX                                    * 05433
        A=A+C   A                                * 05436
        D1=A                                     * 05438
        C=R1                                     * 0543B
        DAT1=C  A                                * 0543E
        GOTO    GETPTRLOOP.L1                    * 05441
        RPL

* ob1..obn #n -> :: ob1..obn ;
* refs (42): 21565 3F4F1 3F6D8 40378 40436 46E50 ...
::N:
        :: TYPECOL COMPN ;                       * 05445

* obn..ob1 #n -> { obn..ob1 }
* refs (152): 0E20F 0E4CF 0E506 1C78D 1DC4B 1F848 ...
{}N:
        :: TYPELIST COMPN ;                      * 05459

* ob1..obn #n -> symb
* refs (45): 476D8 48C01 48C42 48C83 48CB0 49B91 ...
SYMBN:
        :: TYPESYMB COMPN ;                      * 0546D

* ob1..obn #n -> u
* refs (1): 100F6
EXTN:
        :: TYPEEXT COMPN ;                       * 05481
        ASSEMBLE
EXTN.L1:
        D0=(5)  DSKTOP                           * 05495
        A=DAT0  A                                * 0549C
        D1=A                                     * 0549F
        A=R1                                     * 054A2
        DAT1=A  A                                * 054A5
        GOSUB   DOGARBAGE                        * 054A8
        GONC    INNERCOMP.L1                     * 054AC  always taken

* comp -> obn..ob1 #n
* refs (132): 021F6 05233 0523D 052D0 0530E 074D5 ...
INNERCOMP:
        CON(5)  (*)+5                            * 054AF  primitive code object
        ST=0    10                               * 054B4
        GOSUBL  SAVPTR                           * 054B7
INNERCOMP.L1:
        A=DAT1  A                                * 054BD
        R1=A                                     * 054C0
        D0=A                                     * 054C3
        D1=D1+  5                                * 054C6
        D=D+1   A                                * 054C9
        D0=D0+  5                                * 054CB
        C=0     A                                * 054CE
        RSTK=C                                   * 054D0
INNERCOMP.loop2:
        A=DAT0  A                                * 054D2
        LC(5)   SEMI                             * 054D5
        ?C=A    A                                * 054DC
        GOYES   INNERCOMP.L4                     * 054DF
        CD0EX                                    * 054E1
        B=C     A                                * 054E4
        D1=D1-  5                                * 054E6
        D=D-1   A                                * 054E9
        GOC     EXTN.L1                          * 054EB
        C=RSTK                                   * 054EE
        C=C+1   A                                * 054F0
        RSTK=C                                   * 054F2
        D0=A                                     * 054F4
        A=DAT0  A                                * 054F7
        LC(5)   PRLG                             * 054FA
        ?C=A    A                                * 05501
        GOYES   INNERCOMP.L3                     * 05504
        CD0EX                                    * 05506
        DAT1=C  A                                * 05509
        C=B     A                                * 0550C
        D0=C                                     * 0550E
        D0=D0+  5                                * 05511
        GONC    INNERCOMP.loop2                  * 05514
INNERCOMP.L3:
        C=B     A                                * 05517
        DAT1=C  A                                * 05519
        D0=C                                     * 0551C
        GOSUBL  SKIPOB                           * 0551F
        GONC    INNERCOMP.loop2                  * 05525
INNERCOMP.L4:
        C=RSTK                                   * 05528
        R0=C                                     * 0552A
        D0=(5)  DSKTOP                           * 0552D
        CD1EX                                    * 05534
        DAT0=C  A                                * 05537
        D0=(5)  AVMEM                            * 0553A
        C=D     A                                * 05541
        DAT0=C  A                                * 05543
        GOLONG  PUSH#LOOP                        * 05546

* If ST=1 10 then <REF>GPMEMERR else <REF>GARBAGECOL and <REF>GETPTR
* refs (4): 0539A 054A8 05791 0585F
DOGARBAGE:
        ?ST=1   10                               * 0554C
        GOYES   DOGARBAGE.L1                     * 0554F
        GOSUBL  GARBAGECOL                       * 05551
        ST=1    10                               * 05557
        GOLONG  GETPTR                           * 0555A
DOGARBAGE.L1:
        GOLONG  GPMEMERR                         * 05560

* hxs -> flag
NULLHXS?:
        CON(5)  (*)+5                            * 05566  primitive code object
        GOTO    NULLHXS?~1                       * 0556B

* ob -> flag
* refs (11): 16C0B 16E94 176FD 17757 177DE 21688 ...
NULL$?:
        CON(5)  (*)+5                            * 0556F  primitive code object
NULLHXS?~1:
        C=DAT1  A                                * 05574
        CD1EX                                    * 05577
        D1=D1+  5                                * 0557A
        A=DAT1  A                                * 0557D
        D1=C                                     * 05580
        LC(5)   #00005                           * 05583
NULLHXS?~1.L1:
        ?C#A    A                                * 0558A
        GOYES   NULLHXS?~1.L2                    * 0558D
        LC(5)   TRUE                             * 0558F
        DAT1=C  A                                * 05596
        A=DAT0  A                                * 05599
        D0=D0+  5                                * 0559C
        PC=(A)                                   * 0559F
NULLHXS?~1.L2:
        LC(5)   FALSE                            * 055A3
        DAT1=C  A                                * 055AA
        A=DAT0  A                                * 055AD
        D0=D0+  5                                * 055B0
        PC=(A)                                   * 055B3

* comp -> flag
* refs (10): 0EBF8 16202 1627F 19466 1DF3A 2FCE0 ...
NULLCOMP?:
        CON(5)  (*)+5                            * 055B7  primitive code object
        C=DAT1  A                                * 055BC
        CD1EX                                    * 055BF
        D1=D1+  5                                * 055C2
        A=DAT1  A                                * 055C5
        D1=(5)  SEMI                             * 055C8
        CD1EX                                    * 055CF
        GONC    NULLHXS?~1.L1                    * 055D2  always taken

* HXS 0
* refs (9): 0EDE6 17F45 24D2A 27A17 298AF 6C832 ...
NULLHXS:
        CON(5)  DOHSTR                           * 055D5  DOHSTR
        LENGTH                                   * 055DA  length, to #055DF
        ENDLENGTH                                * 055DF
        RPL

* ""
* refs (145): 04D43 04DB4 04E21 0C78A 10248 112CE ...
NULL$:
        $ ""                                     * 055DF

* -> {}
* refs (189): 021E2 08E1A 0CB2A 0E792 110E0 161E4 ...
NULL{}:
        { }                                      * 055E9

* -> sym
* refs (2): 5E0C6 6AFFA
NULLSYMB:
        SYMBOL ;                                 * 055F3

* -> :: ;
* refs (8): 06F23 46C20 46C84 5E134 8C867 8CA66 ...
NULL:::
        :: '                                     * 055FD
          :: ; ;                                 * 05607

* hxs -> #nibs
* refs (5): 15E92 15F9C 4B896 4F953 C0DDA
LENHXS:
        CON(5)  (*)+5                            * 05616  primitive code object
        ASSEMBLE
        ST=0    1                                * 0561B
        GOTO    LEN$.L1                          * 0561E

* $ ob -> $ ob #len
* refs (25): 12806 15EB0 17833 17838 188B4 188B9 ...
OVERLEN$:
        CON(5)  (*)+5                            * 05622  primitive code object
        ST=1    1                                * 05627
        D1=D1+  5                                * 0562A
        A=DAT1  A                                * 0562D
        D1=D1-  5                                * 05630
        GONC    LEN$.L2                          * 05633  always taken

* $ -> #length
* refs (39): 127D4 1A283 1CA2B 2509F 254C0 25AE3 ...
LEN$:
        CON(5)  (*)+5                            * 05636  primitive code object
        ST=1    1                                * 0563B
LEN$.L1:
        A=DAT1  A                                * 0563E
        D1=D1+  5                                * 05641
        D=D+1   A                                * 05644
LEN$.L2:
        GOSUBL  SAVPTR                           * 05646
        D1=A                                     * 0564C
        D1=D1+  5                                * 0564F
        A=DAT1  A                                * 05652
        LC(5)   #00005                           * 05655
        A=A-C   A                                * 0565C
        ?ST=0   1                                * 0565E
        GOYES   LEN$.L3                          * 05661
        ASRB.F  A                                * 05663
LEN$.L3:
        R0=A                                     * 05668
        GOSUBL  PUSH#                            * 0566B
        A=DAT0  A                                * 05671
        D0=D0+  5                                * 05674
        PC=(A)                                   * 05677

* comp -> #n
* refs (61): 093A2 0E46B 0E747 0EBB7 152AA 1CA3F ...
LENCOMP:
        CON(5)  (*)+5                            * 0567B  primitive code object
        A=DAT1  A                                * 05680
        D1=D1+  5                                * 05683
        D=D+1   A                                * 05686
        GOSUBL  SAVPTR                           * 05688
        B=0     A                                * 0568E
        D0=A                                     * 05690
        D0=D0+  5                                * 05693
LENCOMP.loop1:
        A=DAT0  A                                * 05696
        LC(5)   SEMI                             * 05699
        ?C=A    A                                * 056A0
        GOYES   LENCOMP.L2                       * 056A3
        B=B+1   A                                * 056A5
        GOSUBL  SKIPOB                           * 056A7
        GONC    LENCOMP.loop1                    * 056AD
LENCOMP.L2:
        A=B     A                                * 056B0
        GOTO    LEN$.L3                          * 056B2

* comp #i -> ob T -> F
* refs (29): 0E411 15313 15370 1947F 20BB8 22260 ...
NTHELCOMP:
        CON(5)  (*)+5                            * 056B6  primitive code object
        GOSUBL  POP#                             * 056BB
        GOSUBL  SAVPTR                           * 056C1
        C=A     A                                * 056C7
        D=C     A                                * 056C9
        A=DAT1  A                                * 056CB
        D0=A                                     * 056CE
        D0=D0+  5                                * 056D1
        LC(5)   SEMI                             * 056D4
        B=C     A                                * 056DB
        D=D-1   A                                * 056DD
        GOC     NTHELCOMP.L5                     * 056DF
NTHELCOMP.loop1:
        A=DAT0  A                                * 056E2
        ?A=B    A                                * 056E5
        GOYES   NTHELCOMP.L5                     * 056E8
        D=D-1   A                                * 056EA
        GOC     NTHELCOMP.L2                     * 056EC
        GOSUBL  SKIPOB                           * 056EF
        GONC    NTHELCOMP.loop1                  * 056F5
NTHELCOMP.L2:
        D1=A                                     * 056F8
        A=DAT1  A                                * 056FB
        LC(5)   PRLG                             * 056FE
        ?C=A    A                                * 05705
        GOYES   NTHELCOMP.L4                     * 05708
        AD1EX                                    * 0570A
NTHELCOMP.loop3:
        GOSUBL  GETPTR                           * 0570D
        DAT1=A  A                                * 05713
        LC(5)   TRUE                             * 05716
        A=C     A                                * 0571D
        PC=(A)                                   * 0571F
NTHELCOMP.L4:
        AD0EX                                    * 05723
        GOC     NTHELCOMP.loop3                  * 05726
NTHELCOMP.L5:
        GOSUBL  GETPTR                           * 05729
        GOTO    NULLHXS?~1.L2                    * 0572F

* $ #start #end -> $'
* refs (56): 05180 12793 127F2 1543D 15F74 1794B ...
SUB$:
        CON(5)  (*)+5                            * 05733  primitive code object
        ST=0    1                                * 05738
SUB$.L1:
        ST=0    10                               * 0573B
        GOSUBL  POP#                             * 0573E
        R0=A                                     * 05744
        GOSUBL  POP#                             * 05747
        R1=A                                     * 0574D
        GOSUBL  SAVPTR                           * 05750
SUB$.loop2:
        A=DAT1  A                                * 05756
        D1=A                                     * 05759
        C=DAT1  A                                * 0575C
        RSTK=C                                   * 0575F
        D1=D1+  5                                * 05761
        A=0     M                                * 05764
        A=DAT1  A                                * 05767
        D1=D1+  5                                * 0576A
        LC(5)   #00005                           * 0576D
        A=A-C   A                                * 05774
        ?ST=1   1                                * 05776
        GOYES   SUB$.L3                          * 05779
        ASRB                                     * 0577B
SUB$.L3:
        C=R0                                     * 0577E
        B=C     A                                * 05781
        C=R1                                     * 05783
        ?B>=C   A                                * 05786
        GOYES   SUB$.L6                          * 05789
SUB$.loop4:
        B=0     A                                * 0578B
        GOTO    SUB$.L12                         * 0578D
SUB$.loop5:
        GOSUB   DOGARBAGE                        * 05791
        GONC    SUB$.loop2                       * 05795
SUB$.L6:
        ?B#0    A                                * 05798
        GOYES   SUB$.L7                          * 0579B
        B=B+1   A                                * 0579D
SUB$.L7:
        ?C#0    A                                * 0579F
        GOYES   SUB$.L8                          * 057A2
        C=C+1   A                                * 057A4
SUB$.L8:
        ?C>A    A                                * 057A6
        GOYES   SUB$.loop4                       * 057A9
        ?A>=B   A                                * 057AB
        GOYES   SUB$.L9                          * 057AE
        B=A     A                                * 057B0
SUB$.L9:
        B=B-C   A                                * 057B2
        B=B+1   A                                * 057B4
        ?ST=1   1                                * 057B6
        GOYES   SUB$.L10                         * 057B9
        B=B+B   A                                * 057BB
SUB$.L10:
        C=C-1   A                                * 057BD
        ?ST=1   1                                * 057BF
        GOYES   SUB$.L11                         * 057C2
        C=C+C   A                                * 057C4
SUB$.L11:
        AD1EX                                    * 057C6
        A=A+C   A                                * 057C9
        R2=A                                     * 057CB
SUB$.L12:
        LC(5)   portnotaverr                     * 057CE  "Port Not Available"
        C=C+B   A                                * 057D5
        GOSUBL  CREATETEMP                       * 057D7
        C=RSTK                                   * 057DD
        GOC     SUB$.loop5                       * 057DF
        A=R2                                     * 057E2
        AD0EX                                    * 057E5
        D1=A                                     * 057E8
        ABEX    A                                * 057EB
        DAT1=C  A                                * 057ED
        D1=D1+  5                                * 057F0
        LC(5)   #0000B                           * 057F3
        A=A-C   A                                * 057FA
        DAT1=A  A                                * 057FC
        D1=D1+  5                                * 057FF
        LC(1)   #5                               * 05802
SUB$.L13:
        C=A-C   A                                * 05805
        GOSUBL  MOVEDOWN                         * 05807
        A=B     A                                * 0580D
        GOLONG  GPOverWrALp                      * 0580F

* hxs #m #n -> hxs'
* refs (9): 15E6F 4F967 4F97B 4F98F 6A0A5 6A474 ...
SUBHXS:
        CON(5)  (*)+5                            * 05815  primitive code object
        ST=1    1                                * 0581A
        GOTO    SUB$.L1                          * 0581D

* comp #m #n -> comp'
* refs (15): 05162 1C8D9 4FAC0 4FADE 56E82 6C0D7 ...
SUBCOMP:
        CON(5)  (*)+5                            * 05821  primitive code object
        ST=0    10                               * 05826
        GOSUBL  POP#                             * 05829
        R0=A                                     * 0582F
        GOSUBL  POP#                             * 05832
        R1=A                                     * 05838
        GOSUBL  SAVPTR                           * 0583B
SUBCOMP.loop1:
        A=DAT1  A                                * 05841
        D0=A                                     * 05844
        C=DAT0  A                                * 05847
        RSTK=C                                   * 0584A
        C=R0                                     * 0584C
        B=C     A                                * 0584F
        C=R1                                     * 05851
        ?B>=C   A                                * 05854
        GOYES   SUBCOMP.L4                       * 05857
SUBCOMP.loop2:
        A=0     A                                * 05859
        GOTO    SUBCOMP.L11                      * 0585B
SUBCOMP.loop3:
        GOSUB   DOGARBAGE                        * 0585F
        GONC    SUBCOMP.loop1                    * 05863
SUBCOMP.L4:
        ?B#0    A                                * 05866
        GOYES   SUBCOMP.L5                       * 05869
        B=B+1   A                                * 0586B
SUBCOMP.L5:
        ?C#0    A                                * 0586D
        GOYES   SUBCOMP.L6                       * 05870
        C=C+1   A                                * 05872
SUBCOMP.L6:
        B=B-C   A                                * 05874
        D0=D0+  5                                * 05876
        D=C     A                                * 05879
        D=D-1   A                                * 0587B
SUBCOMP.loop7:
        A=DAT0  A                                * 0587D
        LC(5)   SEMI                             * 05880
        ?C=A    A                                * 05887
        GOYES   SUBCOMP.loop2                    * 0588A
        D=D-1   A                                * 0588C
        GOC     SUBCOMP.L8                       * 0588E
        GOSUBL  SKIPOB                           * 05891
        GONC    SUBCOMP.loop7                    * 05897
SUBCOMP.L8:
        CD0EX                                    * 0589A
        D0=C                                     * 0589D
        R2=C                                     * 058A0
SUBCOMP.loop9:
        A=DAT0  A                                * 058A3
        LC(5)   SEMI                             * 058A6
        ?C=A    A                                * 058AD
        GOYES   SUBCOMP.L10                      * 058B0
        GOSUBL  SKIPOB                           * 058B2
        B=B-1   A                                * 058B8
        GONC    SUBCOMP.loop9                    * 058BA
SUBCOMP.L10:
        C=R2                                     * 058BD
        AD0EX                                    * 058C0
        A=A-C   A                                * 058C3
SUBCOMP.L11:
        LC(5)   portnotaverr                     * 058C5  "Port Not Available"
        C=C+A   A                                * 058CC
        GOSUBL  CREATETEMP                       * 058CE
        C=RSTK                                   * 058D4
        GOC     SUBCOMP.loop3                    * 058D6
        DAT0=C  A                                * 058D9
        LC(5)   SEMI                             * 058DC
        D1=D1-  5                                * 058E3
        DAT1=C  A                                * 058E6
        A=R2                                     * 058E9
        AD0EX                                    * 058EC
        D1=A                                     * 058EF
        D1=D1+  5                                * 058F2
        ABEX    A                                * 058F5
        LC(5)   #00010                           * 058F7
        GOTO    SUB$.L13                         * 058FE

* ob -> #
* refs (5): 09048 0B679 72346 9E142 CEFA3
OSIZE:
        CON(5)  (*)+5                            * 05902  primitive code object
        GOSUB   PopNibs                          * 05907
        GOVLNG  PUSH#LOOP                        * 0590B

* refs (2): 05907 05949
PopNibs:
        A=DAT1  A                                * 05912
        D1=D1+  5                                * 05915
        D=D+1   A                                * 05918
        R1=A.F  A                                * 0591A
        GOSBVL  SAVPTR                           * 05920
        D0=A                                     * 05927
        GOSBVL  SKIPOB                           * 0592A
        C=R1.F  A                                * 05931
        AD0EX                                    * 05937
        A=A-C   A                                * 0593A
        R0=A.F  A                                * 0593C
        RTN                                      * 05942

* ob -> #nib hxs
* refs (11): 110B8 1A242 1A274 41E41 8E044 9DCA9 ...
OCRC:
        CON(5)  (*)+5                            * 05944  primitive code object
        GOSUB   PopNibs                          * 05949
        GOSUB   DoCRCc                           * 0594D
        R1=A.F  A                                * 05951
        GOSBVL  PUSH#                            * 05957
        GOSBVL  SAVPTR                           * 0595E
        A=R1.F  A                                * 05965
        P=      3                                * 0596B

* Push A.WP as hxs, Loop
* refs (2): 53E99 5441B
PUSHhxsLoop:
        GOSBVL  PUSHhxs                          * 0596D
        A=DAT0  A                                * 05974
        D0=D0+  5                                * 05977
        PC=(A)                                   * 0597A

* D0=C <REF>DoCRC
* refs (1): 0594D
DoCRCc:
        D0=C                                     * 0597E

* Calculates the CRC of A.A nibs at D0. Returns CRC in A.A Uses C.W P
DoCRC:
        C=0     A                                * 05981
        D1=(5)  #00104                           * 05983
        ST=0    15                               * 0598A
        DAT1=C  4                                * 0598D
        C=A     B                                * 05991
        P=C     0                                * 05994
        ASR     A                                * 05998
        P=P-1                                    * 0599A
        GOC     DoCRC.L1                         * 0599C
        C=DAT0  WP                               * 0599F
        CD0EX                                    * 059A3
        C+P+1                                    * 059A6
        D0=C                                     * 059A9
DoCRC.L1:
        P=      0                                * 059AC
        A=A-1   A                                * 059AE
        GOC     DoCRC.L3                         * 059B0
DoCRC.loop2:
        C=DAT0  W                                * 059B3
        D0=D0+  16                               * 059B7
        A=A-1   A                                * 059BA
        GONC    DoCRC.loop2                      * 059BC
DoCRC.L3:
        A=0     A                                * 059BF
        A=DAT1  4                                * 059C1
        GOVLNG  AllowIntr                        * 059C5

* # -> hxs
* refs (7): 15D0B 4F188 4F192 B55CF B55F2 C0C3A ...
#>HXS:
        CON(5)  (*)+5                            * 059CC  primitive code object
        GOSUBL  SAVPTR                           * 059D1
        GOSUBL  POP#                             * 059D7
        R1=A                                     * 059DD
        C=0     A                                * 059E0
        LC(1)   #5                               * 059E2
        GOSUB   MAKE$N                           * 059E5
        C=R1                                     * 059E9
        DAT0=C  A                                * 059EC
        LC(5)   DOHSTR                           * 059EF
        A=R0                                     * 059F6
        D1=A                                     * 059F9
        DAT1=C  A                                * 059FC
        GOTO    ID>$.L2                          * 059FF

* hxs -> #
* refs (17): 15020 1A54C 1C5E3 2B067 46801 4680B ...
HXS>#:
        CON(5)  (*)+5                            * 05A03  primitive code object
        A=DAT1  A                                * 05A08
        D1=D1+  5                                * 05A0B
        D=D+1   A                                * 05A0E
        GOSUBL  SAVPTR                           * 05A10
        D1=A                                     * 05A16
        D1=D1+  5                                * 05A19
        A=DAT1  A                                * 05A1C
        D1=D1+  5                                * 05A1F
        LC(5)   #00005                           * 05A22
        A=A-C   A                                * 05A29
        P=      4                                * 05A2B
        ?C<=A   A                                * 05A2D
        GOYES   HXS>#.L1                         * 05A30
        A=A-1   A                                * 05A32
        GOC     HXS>#.L3                         * 05A34
        CAEX    B                                * 05A37
        CPEX    0                                * 05A3A
        A=0     A                                * 05A3E
HXS>#.L1:
        A=DAT1  WP                               * 05A40
HXS>#.loop2:
        P=      0                                * 05A44
        GOLONG  PUSH#ALOOP                       * 05A46
HXS>#.L3:
        A=0     A                                * 05A4C
        GOC     HXS>#.loop2                      * 05A4E

* chr -> #
* refs (9): 14128 2FD17 3F28D 448D5 BADBB BAE93 ...
CHR>#:
        CON(5)  (*)+5                            * 05A51  primitive code object
        A=DAT1  A                                * 05A56
        D1=D1+  5                                * 05A59
        D=D+1   A                                * 05A5C
        GOSUBL  SAVPTR                           * 05A5E
        D1=A                                     * 05A64
        D1=D1+  5                                * 05A67
        A=0     A                                * 05A6A
        A=DAT1  B                                * 05A6C
        GOLONG  PUSH#ALOOP                       * 05A6F

* # -> chr
* refs (12): 140FB 2E473 2F4AC 30B76 3F2AB 4493E ...
#>CHR:
        CON(5)  (*)+5                            * 05A75  primitive code object
        GOSUBL  SAVPTR                           * 05A7A
        GOSUBL  POP#                             * 05A80
        R0=A                                     * 05A86
        LC(5)   #00007                           * 05A89
        GOSUBL  GETTEMP                          * 05A90
        AD0EX                                    * 05A96
        D1=A                                     * 05A99
        LC(5)   DOCHAR                           * 05A9C
        DAT1=C  A                                * 05AA3
        D1=D1+  5                                * 05AA6
        C=R0                                     * 05AA9
        DAT1=C  B                                * 05AAC
        GOTO    ID>$.L2                          * 05AAF
        RPL

* ob #prolog -> ob'
* refs (2): 05AF7 05B0B
CHANGETYPE:
        :: SWAP TOTEMPSWAP !CHANGETYPE ;         * 05AB3

* ob #prolog -> ob'
* refs (1): 05AC2
!CHANGETYPE:
        CON(5)  (*)+5                            * 05ACC  primitive code object
        ASSEMBLE
        GOSUBL  POP#                             * 05AD1
        C=DAT1  A                                * 05AD7
        CD1EX                                    * 05ADA
        DAT1=A  A                                * 05ADD
        D1=C                                     * 05AE0
        A=DAT0  A                                * 05AE3
        D0=D0+  5                                * 05AE6
        PC=(A)                                   * 05AE9
        RPL

* id -> lam
* refs (6): 23E6B 27F26 566E7 8385B 8389C D2082
ID>LAM:
        :: TYPELAM CHANGETYPE ;                  * 05AED

* lam -> id
* refs (2): 57013 D2013
LAM>ID:
        :: TYPEIDNT CHANGETYPE ;                 * 05B01

* $ -> ID
* refs (18): 05E86 0F1B4 0FF8E 216A1 246FE 24E56 ...
$>ID:
        CON(5)  (*)+5                            * 05B15  primitive code object
        ASSEMBLE
        GOSUBL  SAVPTR                           * 05B1A
        A=DAT1  A                                * 05B20
        D1=A                                     * 05B23
        D1=D1+  5                                * 05B26
        C=DAT1  A                                * 05B29
        C=C+1   A                                * 05B2C
        C=C+1   A                                * 05B2E
        GOSUBL  GETTEMP                          * 05B30
        D1=(5)  DSKTOP                           * 05B36
        A=DAT1  A                                * 05B3D
        D1=A                                     * 05B40
        A=DAT1  A                                * 05B43
        AD0EX                                    * 05B46
        D0=D0+  10                               * 05B49
        D1=A                                     * 05B4C
        R0=A                                     * 05B4F
        A=C     A                                * 05B52
        LC(5)   DOIDNT                           * 05B54
        DAT1=C  A                                * 05B5B
        D1=D1+  5                                * 05B5E
        LC(5)   #00007                           * 05B61
        A=A-C   A                                * 05B68
        C=A     A                                * 05B6A
        ASRB                                     * 05B6C
        DAT1=A  B                                * 05B6F
        D1=D1+  2                                * 05B72
        GOTO    ID>$.L1                          * 05B75

* Creates character string in tempob area Does SETHEX, C=C+C.A and then <REF>MAKE$N
* refs (15): 0458E 05C04 0CF1C 16092 16837 2E1B9 ...
MAKE$:
        GOSUB   MAKE$~1                          * 05B79

* Creates character string in tempob area If not enough mem even after GC then memerr C.A = nibbles -> A=nibbles+5, B=nibbles+16 C=D1=addr of stack D0 = addr of body of $ R0 = addr of $  Not used: R1-R4
* refs (5): 051D1 05290 059E5 2FF45 44699
MAKE$N:
        ST=0    10                               * 05B7D
        P=      4                                * 05B80
        C+P+1                                    * 05B82
        GOC     MAKE$N.L3                        * 05B85
        R0=C                                     * 05B88
MAKE$N.loop1:
        P=      0                                * 05B8B
        GOSBVL  ROOM                             * 05B8D
        A=C     A                                * 05B94
        C=R0                                     * 05B96
        C=C+CON A,16                             * 05B99
        GOC     MAKE$N.L3                        * 05B9F
        ?C<=A   A                                * 05BA2
        GOYES   MAKE$N.L2                        * 05BA5
        GOSBVL  St10Gb                           * 05BA7
        GOTO    MAKE$N.loop1                     * 05BAE
MAKE$N.L2:
        C=R0                                     * 05BB2
        C=C+CON A,5                              * 05BB5
        GOSBVL  CREATETEMP                       * 05BBB
        AD0EX                                    * 05BC2
        D0=A                                     * 05BC5
        AR0EX                                    * 05BC8
        LC(5)   DOCSTR                           * 05BCB
        DAT0=C  A                                * 05BD2
        D0=D0+  5                                * 05BD5
        DAT0=A  A                                * 05BD8
        D0=D0+  5                                * 05BDB
        GOTO    Get2Bodies.L1                    * 05BDE
MAKE$N.L3:
        GOVLNG  RoomOrGCP.L1                     * 05BE2

* id/lam -> $
* refs (65): 05EE2 05F33 149F6 14A87 14B40 1542E ...
ID>$:
        CON(5)  (*)+5                            * 05BE9  primitive code object
        GOSUBL  SAVPTR                           * 05BEE
        A=DAT1  A                                * 05BF4
        D1=A                                     * 05BF7
        D1=D1+  5                                * 05BFA
        C=0     A                                * 05BFD
        C=DAT1  B                                * 05BFF
        RSTK=C                                   * 05C02
        GOSUB   MAKE$                            * 05C04
        A=DAT1  A                                * 05C08
        AD0EX                                    * 05C0B
        D1=A                                     * 05C0E
        D0=D0+  7                                * 05C11
        C=RSTK                                   * 05C14
        C=C+C   A                                * 05C16
ID>$.L1:
        GOSUBL  MOVEDOWN                         * 05C18
        A=R0                                     * 05C1E
ID>$.L2:
        GOLONG  GPOverWrALp                      * 05C21

* %re %im -> C%
* refs (48): 1C7AD 1DEA7 1E10B 1EA80 1EBA1 24802 ...
%>C%:
        CON(5)  (*)+5                            * 05C27  primitive code object
        GOSUB   Get2Bodies                       * 05C2C
        D0=C                                     * 05C30
        D0=D0+  5                                * 05C33
        A=DAT0  W                                * 05C36
        R3=A                                     * 05C3A
        LC(5)   #00025                           * 05C3D
        GOSUBL  GETTEMP                          * 05C44
        LC(5)   DOCMP                            * 05C4A
        DAT0=C  A                                * 05C51
        AD0EX                                    * 05C54
        D1=A                                     * 05C57
        D1=D1+  5                                * 05C5A
        C=R3                                     * 05C5D
        DAT1=C  W                                * 05C60
        D1=D1+  16                               * 05C64
        C=R0                                     * 05C67
        DAT1=C  W                                * 05C6A
        GOTO    %%>C%%.L1                        * 05C6E

* %%re %%im -> C%%
* refs (19): 37982 37AB8 37D2D 51C61 51CCA 51DD8 ...
%%>C%%:
        CON(5)  (*)+5                            * 05C72  primitive code object
        GOSUB   Get2Bodies                       * 05C77
        D0=D0+  16                               * 05C7B
        A=DAT0  A                                * 05C7E
        R1=A                                     * 05C81
        D0=C                                     * 05C84
        D0=D0+  5                                * 05C87
        A=DAT0  W                                * 05C8A
        R2=A                                     * 05C8E
        D0=D0+  16                               * 05C91
        A=DAT0  A                                * 05C94
        R3=A                                     * 05C97
        LC(5)   #0002F                           * 05C9A
        GOSUBL  GETTEMP                          * 05CA1
        LC(5)   DOECMP                           * 05CA7
        DAT0=C  A                                * 05CAE
        AD0EX                                    * 05CB1
        D1=A                                     * 05CB4
        D1=D1+  5                                * 05CB7
        C=R2                                     * 05CBA
        DAT1=C  W                                * 05CBD
        C=R3                                     * 05CC1
        D1=D1+  16                               * 05CC4
        DAT1=C  A                                * 05CC7
        D1=D1+  5                                * 05CCA
        C=R0                                     * 05CCD
        DAT1=C  W                                * 05CD0
        D1=D1+  16                               * 05CD4
        C=R1                                     * 05CD7
        DAT1=C  A                                * 05CDA
%%>C%%.L1:
        GOSUBL  GETPTR                           * 05CDD
        D1=D1+  5                                * 05CE3
        D=D+1   A                                * 05CE6
%%>C%%.L2:
        DAT1=A  A                                * 05CE8
%%>C%%.L3:
        A=DAT0  A                                * 05CEB
        D0=D0+  5                                * 05CEE
        PC=(A)                                   * 05CF1

* refs (2): 05C2C 05C77
* -> A = first 16 nibbles of the body of level 1, also in R0, C.A = pointer to level 2, D0 at level 1's body, D1 on level 2. After SAVPTR
Get2Bodies:
        GOSUBL  SAVPTR                           * 05CF5
        C=DAT1  A                                * 05CFB
        D0=C                                     * 05CFE
        D0=D0+  5                                * 05D01
        A=DAT0  W                                * 05D04
        R0=A                                     * 05D08
        D1=D1+  5                                * 05D0B
        C=DAT1  A                                * 05D0E
        RTN                                      * 05D11
Get2Bodies.L1:
        D1=(5)  DSKTOP                           * 05D13
        C=DAT1  A                                * 05D1A
        D1=C                                     * 05D1D
        RTNCC                                    * 05D20
        BSS     3                                * 05D22  zeros
Get2Bodies.L2:
        GOSUB   SafGarbD-1                       * 05D25
        GONC    C%>%.L1                          * 05D29  always taken

* C% -> %re %im
* refs (69): 0C735 1C99D 1CF94 1DE1E 35EE5 360E3 ...
C%>%:
        CON(5)  (*)+5                            * 05D2C  primitive code object
        D=D-1   A                                * 05D31
        GOC     Get2Bodies.L2                    * 05D33
C%>%.L1:
        A=DAT1  A                                * 05D36
        D1=D1-  5                                * 05D39
        DAT1=A  A                                * 05D3C
        GOSUBL  SAVPTR                           * 05D3F
        D0=A                                     * 05D45
        D0=D0+  5                                * 05D48
        A=DAT0  W                                * 05D4B
        R0=A                                     * 05D4F
        D0=D0+  16                               * 05D52
        A=DAT0  W                                * 05D55
        R1=A                                     * 05D59
        LC(5)   #00030                           * 05D5C
        GOSUBL  GETTEMP                          * 05D63
        AD0EX                                    * 05D69
        D1=A                                     * 05D6C
        LC(5)   DOREAL                           * 05D6F
        DAT1=C  A                                * 05D76
        C=R0                                     * 05D79
        D1=D1+  5                                * 05D7C
        DAT1=C  W                                * 05D7F
        D1=D1+  16                               * 05D83
        LC(5)   #0001B                           * 05D86
        DAT1=C  A                                * 05D8D
        D1=D1+  6                                * 05D90
        LC(5)   DOREAL                           * 05D93
        DAT1=C  A                                * 05D9A
        D1=D1+  5                                * 05D9D
        C=R1                                     * 05DA0
        DAT1=C  W                                * 05DA3
        D1=D1+  16                               * 05DA7
        LC(5)   #0001B                           * 05DAA
        GOTO    C%%>%%.L2                        * 05DB1
C%>%.L2:
        GOSUB   SafGarbD-1                       * 05DB5
        GONC    C%%>%%.L1                        * 05DB9  always taken

* C%% -> %%re %%im
* refs (20): 35FD0 3601B 37A9A 37AF4 37D5A 37D78 ...
C%%>%%:
        CON(5)  (*)+5                            * 05DBC  primitive code object
        D=D-1   A                                * 05DC1
        GOC     C%>%.L2                          * 05DC3
C%%>%%.L1:
        A=DAT1  A                                * 05DC6
        D1=D1-  5                                * 05DC9
        DAT1=A  A                                * 05DCC
        GOSUBL  SAVPTR                           * 05DCF
        D0=A                                     * 05DD5
        D0=D0+  5                                * 05DD8
        A=DAT0  W                                * 05DDB
        R0=A                                     * 05DDF
        D0=D0+  16                               * 05DE2
        A=DAT0  A                                * 05DE5
        R1=A                                     * 05DE8
        D0=D0+  5                                * 05DEB
        A=DAT0  W                                * 05DEE
        R2=A                                     * 05DF2
        D0=D0+  16                               * 05DF5
        A=DAT0  A                                * 05DF8
        R3=A                                     * 05DFB
        LC(5)   #0003A                           * 05DFE
        GOSUBL  GETTEMP                          * 05E05
        AD0EX                                    * 05E0B
        D1=A                                     * 05E0E
        LC(5)   DOEREL                           * 05E11
        DAT1=C  A                                * 05E18
        C=R0                                     * 05E1B
        D1=D1+  5                                * 05E1E
        DAT1=C  W                                * 05E21
        D1=D1+  16                               * 05E25
        C=R1                                     * 05E28
        DAT1=C  A                                * 05E2B
        LC(5)   #00020                           * 05E2E
        D1=D1+  5                                * 05E35
        DAT1=C  A                                * 05E38
        D1=D1+  6                                * 05E3B
        LC(5)   DOEREL                           * 05E3E
        DAT1=C  A                                * 05E45
        D1=D1+  5                                * 05E48
        C=R2                                     * 05E4B
        DAT1=C  W                                * 05E4E
        D1=D1+  16                               * 05E52
        C=R3                                     * 05E55
        DAT1=C  A                                * 05E58
        LC(5)   #00020                           * 05E5B
        D1=D1+  5                                * 05E62
C%%>%%.L2:
        DAT1=C  A                                * 05E65
        RSTK=C                                   * 05E68
        GOSUBL  GETPTR                           * 05E6A
        D1=D1+  5                                * 05E70
        DAT1=A  A                                * 05E73
        D1=D1-  5                                * 05E76
        C=RSTK                                   * 05E79
        A=A+C   A                                * 05E7B
        GOTO    %%>C%%.L2                        * 05E7D
        RPL

* ob $tag -> tagged
* refs (17): 05F38 15913 21A0D 2260E 22622 244E2 ...
>TAG:
        :: $>ID SWAP TWO{}N {}>TAG ;             * 05E81

* { id ob } -> tagged
* refs (1): 05E95
{}>TAG:
        CON(5)  (*)+5                            * 05E9F  primitive code object
        ASSEMBLE
        LC(5)   DOTAG                            * 05EA4
        A=DAT1  A                                * 05EAB
        AD1EX                                    * 05EAE
        D1=D1+  5                                * 05EB1
        DAT1=C  A                                * 05EB4
        AD1EX                                    * 05EB7
        GOTO    %%>C%%.L2                        * 05EBA

* refs (1): 05B79
MAKE$~1:
        SETHEX                                   * 05EBE
        C=C+C   A                                * 05EC0
        RTNNC                                    * 05EC2
        GOTO    MAKE$N.L3                        * 05EC5
        RPL

* tagged -> ob $tag
* refs (9): 1742D 1CF8A 21278 21350 21514 3F0AC ...
TAG>:
        :: ONE{}N {:tag:_}=>{tag,_} INCOMPDROP SWAP ID>$ ; * 05EC9

* refs (1): 05ED3
{:tag:_}=>{tag,_}:
        CON(5)  (*)+5                            * 05EEC  primitive code object
        ASSEMBLE
        LC(5)   DOIDNT                           * 05EF1
        A=DAT1  A                                * 05EF8
        AD1EX                                    * 05EFB
        D1=D1+  5                                * 05EFE
        DAT1=C  A                                * 05F01
        AD1EX                                    * 05F04
        GOTO    %%>C%%.L3                        * 05F07
        BSS     4                                * 05F0B  zeros

* refs (5): 05D25 05DB5 613A8 641EB 64259
SafGarbD-1:
        GOSUBL  SAVPTR                           * 05F0F
        GOSUBL  GARBAGECOL                       * 05F15
        GOSUBL  GETPTR                           * 05F1B
        D=D-1   A                                * 05F21
        RTNNC                                    * 05F23

D=0ErrIM:
        D=0     A                                * 05F26
        GOLONG  DOMEMERR                         * 05F28
        RPL

* ob id/lam -> tagged
* refs (9): 1566C 225D7 225E1 478A3 478B2 99000 ...
ID>TAG:
        :: ID>$ >TAG ;                           * 05F2E

* ->
* refs (6): 0B067 0B629 0B6E7 20FB4 B9DD6 D4273
GARBAGE:
        CON(5)  (*)+5                            * 05F42  primitive code object
        ASSEMBLE

* refs (1): 05F42
SafGarb®:
        GOSUBL  SAVPTR                           * 05F47
        GOSUB   GARBAGECOL                       * 05F4D
        GOSUBL  GETPTR                           * 05F51
        A=DAT0  A                                * 05F57
        D0=D0+  5                                * 05F5A
        PC=(A)                                   * 05F5D

* -> #
* refs (5): 0B080 0B62E 20FB9 B9DDB D4278
MEM:
        CON(5)  (*)+5                            * 05F61  primitive code object
        GOSUBL  SAVPTR                           * 05F66
        LC(2)   #FF                              * 05F6C
        R0=C                                     * 05F70
        GOSUB   PUSH#                            * 05F73
        AD1EX                                    * 05F77
        C=A     A                                * 05F7A
        C=C-B   A                                * 05F7C
        D1=D1+  5                                * 05F7E
        DAT1=C  A                                * 05F81
        D1=A                                     * 05F84
        A=DAT0  A                                * 05F87
        D0=D0+  5                                * 05F8A
        PC=(A)                                   * 05F8D

* refs (1): 0661D
* B.A = low, D.A = high -> carry set if a pointer into [B,D) is on the data stack, return stack or at INTRPPTR; then D1 is at it. ST0 set
RefInRange?:
        ST=1    0                                * 05F91
        D1=(5)  DSKTOP                           * 05F94
        C=DAT1  A                                * 05F9B
        D1=C                                     * 05F9E
        GOTO    RefInRange?.L3                   * 05FA1
RefInRange?.loop1:
        ?B>C    A                                * 05FA5
        GOYES   RefInRange?.L2                   * 05FA8
        ?D>C    A                                * 05FAA
        RTNYES                                   * 05FAD
RefInRange?.L2:
        D1=D1+  5                                * 05FAF
RefInRange?.L3:
        C=DAT1  A                                * 05FB2
        ?C#0    A                                * 05FB5
        GOYES   RefInRange?.loop1                * 05FB8
        D1=(5)  RSKTOP                           * 05FBA
        C=DAT1  A                                * 05FC1
        D1=C                                     * 05FC4
        GONC    RefInRange?.L5                   * 05FC7
RefInRange?.loop4:
        ?B>C    A                                * 05FCA
        GOYES   RefInRange?.L5                   * 05FCD
        ?D>C    A                                * 05FCF
        RTNYES                                   * 05FD2
RefInRange?.L5:
        D1=D1-  5                                * 05FD4
        C=DAT1  A                                * 05FD7
        ?C#0    A                                * 05FDA
        GOYES   RefInRange?.loop4                * 05FDD
        D1=(5)  INTRPPTR                         * 05FDF
        LC(2)   #24                              * 05FE6
        A=C     B                                * 05FEA
RefInRange?.loop6:
        C=DAT1  A                                * 05FED
        ?B>C    A                                * 05FF0
        GOYES   RefInRange?.L7                   * 05FF3
        ?D>C    A                                * 05FF5
        RTNYES                                   * 05FF8
RefInRange?.L7:
        D1=D1+  5                                * 05FFA
        A=A-1   B                                * 05FFD
