* HP 48GX ROM revision R, #42023-#4400B: Key input and the cursor
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: ?ATTNQUIT KEYINBUFFER? Cursor&Disp OnTheFirstCol? NoAttn?Semi LCursor ATTN? ToTheEndOfRow UCursor ->OnTheRow SetCursPos(s) dup2;spos(st,RC)
* Follows on from the previous file (at #42023 in the original ROM).
        RPL

* refs (1): 42000
OBJ_42023:
        ::                                       * 42023
          TakeOver                               * 42028
          TRUE                                   * 4202D
          1PUTLAM                                * 42032
        ;                                        * 42037

* -> ob
* refs (4): 385C5 38B1D 4205F 6B9DE
GetKeyOb:
        ::                                       * 4203C
          ?BlinkCursor                           * 42041
          GETKEY*                                * 42046
          NOBLINK                                * 4204B
          case                                   * 42050
          H/WKey>KeyOb                           * 42055
          NOTcase                                * 4205A
          GetKeyOb                               * 4205F
          CtlAlarm!                              * 42064
          '                                      * 42069
          DoCAlarmKey                            * 4206E
        ;                                        * 42073

* ->
* refs (1): 42041
?BlinkCursor:
        ::                                       * 42078
          EditLExists?                           * 4207D
          DA2bEdit?                              * 42082
          AND                                    * 42087
          ITE                                    * 4208C
          OBJ_538EA                              * 42091
          NOBLINK                                * 42096
        ;                                        * 4209B

* -> #kc T -> F F -> {Alrmlist} T F
* refs (1): 42046
GETKEY*:
        ::                                       * 420A0
          NoIgnoreAlm                            * 420A5
          GETKEY                                 * 420AA
          caseTRUE                               * 420AF
          ATTN?                                  * 420B4
          case                                   * 420B9
          ATTNxcp                                * 420BE
          ALARM?                                 * 420C3
          case                                   * 420C8
          ALARMxcp                               * 420CD
          TIMEOUT?                               * 420D2
          case                                   * 420D7
          SLEEPxcp                               * 420DC
          UART?                                  * 420E1
          case                                   * 420E6
          UARTxcp                                * 420EB
        ;                                        * 420F0

* refs (1): 420BE
ATTNxcp:
        ::                                       * 420F5
          ATTNFLGCLR                             * 420FA
          FLUSHKEYS                              * 420FF
          BINT45                                 * 42104
          OBJ_421D6                              * 42109
        ;                                        * 4210E

* refs (2): 2DB1C 420CD
ALARMxcp:
        ::                                       * 42113
          OBJ_42396                              * 42118
          FLUSHKEYS                              * 4211D
          OBJ_0DC3B                              * 42122
          FALSE                                  * 42127
        ;                                        * 4212C

* refs (1): 420DC
SLEEPxcp:
        ::                                       * 42131
          TurnOff                                * 42136
          FalseFalse                             * 4213B
        ;                                        * 42140

* refs (1): 420EB
UARTxcp:
        ::                                       * 42145
          FLUSHRSBUF                             * 4214A
          FalseFalse                             * 4214F
        ;                                        * 42154

* -> #kc flag
* refs (3): 17FC0 2D9CD 420AA
GETKEY:
        ::                                       * 42159
          ATTN?                                  * 4215E
          case                                   * 42163
          OBJ_421F4                              * 42168
          GETTOUCH                               * 4216D
          case                                   * 42172
          OBJ_421D6                              * 42177
          OBJ_423E4                              * 4217C
          OBJ_13E22                              * 42181
          OBJ_13CB0                              * 42186
          BEGIN                                  * 4218B
          OBJ_42208                              * 42190
          IT                                     * 42195
          ::                                     * 4219A
            2RDROP                               * 4219F
            OBJ_421F4                            * 421A4
          ;                                      * 421A9
          OBJ_13E53                              * 421AE
          ?SKIP                                  * 421B3
          OBJ_13CB0                              * 421B8
          OBJ_04890                              * 421BD
          GETTOUCH                               * 421C2
          UNTIL                                  * 421C7
          OBJ_421D6                              * 421CC
        ;                                        * 421D1

* refs (3): 42109 42177 421CC
OBJ_421D6:
        ::                                       * 421D6
          OBJ_4231A                              * 421DB
          OBJ_42396                              * 421E0
          ClrDouseAlm                            * 421E5
          TRUE                                   * 421EA
        ;                                        * 421EF

* refs (2): 42168 421A4
OBJ_421F4:
        ::                                       * 421F4
          OBJ_4231A                              * 421F9
          FALSE                                  * 421FE
        ;                                        * 42203

* refs (1): 42190
OBJ_42208:
        ::                                       * 42208
          ATTN?                                  * 4220D
          caseTRUE                               * 42212
          KEYINBUFFER?                           * 42217
          caseFALSE                              * 4221C
          UART?                                  * 42221
          caseTRUE                               * 42226
          TIMEOUT?                               * 4222B
          caseTRUE                               * 42230
          OBJ_53AC8                              * 42235
          caseFALSE                              * 4223A
          ALARM?                                 * 4223F
        ;                                        * 42244

* refs (3): 17FED 420E1 42221
UART?:
        ::                                       * 42249
          OBJ_422EB                              * 4224E
          OBJ_42309                              * 42253
          AND                                    * 42258
        ;                                        * 4225D

* -> flag
* refs (8): 17FCF 2DAEF 420B4 4215E 4220D 42461 ...
ATTN?:
        CON(5)  (*)+5                            * 42262  primitive code object
        ASSEMBLE
        AD0EX                                    * 42267

addrATTNFLG:
        D0=(5)  ATTNFLG                          * 4226A
        C=DAT0  A                                * 42271
        D0=A                                     * 42274
        ?C#0    A                                * 42277
        GOYES   L_4229A                          * 4227A
        GONC    L_4229A                          * 4227C

* refs (4): 17FDE 2DB3A 420D2 4222B
TIMEOUT?:
        CON(5)  (*)+5                            * 4227F  primitive code object

* refs (1): 4227F
adrTIMEOUTCLK:
        LC(5)   TIMEOUTCLK                       * 42284
        CD1EX                                    * 4228B
        C=DAT1  S                                * 4228E
        D1=C                                     * 42292
        ?C=0    S                                * 42295
        GOYES   L_4229A                          * 42298
L_4229A:
        GOVLNG  PushT/FLoop                      * 4229A

* -> flag
* refs (4): 041B1 2DB0D 420C3 4223F
ALARM?:
        CON(5)  (*)+5                            * 422A1  primitive code object
        CD0EX                                    * 422A6
        GOSUB   SUB_422B4                        * 422A9
        CD0EX                                    * 422AD
        GOTO    L_4229A                          * 422B0

* refs (1): 422A9
SUB_422B4:
        D0=(5)  ALARMSDUE                        * 422B4
        C=DAT0  S                                * 422BB
        ?C#0    S                                * 422BF
        RTNYES                                   * 422C2
        RTNCC                                    * 422C4

* refs (1): 386E2
OBJ_422C6:
        CON(5)  (*)+5                            * 422C6  primitive code object
        CD0EX                                    * 422CB
        GOSUB   SUB_422D9                        * 422CE
        CD0EX                                    * 422D2
        GOTO    L_4229A                          * 422D5

* refs (1): 422CE
SUB_422D9:
        D0=(5)  PASTDUE                          * 422D9
        C=DAT0  S                                * 422E0
        ?C#0    S                                * 422E4
        RTNYES                                   * 422E7
        RTNCC                                    * 422E9

* refs (1): 4224E
OBJ_422EB:
        CON(5)  (*)+5                            * 422EB  primitive code object
        AD1EX                                    * 422F0
        D1=(5)  uart_buf_end                     * 422F3
        C=DAT1  X                                * 422FA
        AD1EX                                    * 422FE
        ?C#0    X                                * 42301
        GOYES   L_4229A                          * 42304
        GONC    L_4229A                          * 42306

* refs (2): 42253 85605
OBJ_42309:
        CON(5)  (*)+5                            * 42309  primitive code object
        LC(3)   #202                             * 4230E
        GOVLNG  L_539E6                          * 42313

* refs (4): 041AC 041D9 421DB 421F9
OBJ_4231A:
        CON(5)  (*)+5                            * 4231A  primitive code object
        AD1EX                                    * 4231F
        GOSUB   L_42333                          * 42322
        AD1EX                                    * 42326
        A=DAT0  A                                * 42329
        D0=D0+  5                                * 4232C
        PC=(A)                                   * 4232F
L_42333:
        D1=(5)  ANNUNCIATORS                     * 42333
        C=DAT1  B                                * 4233A
        CBIT=1  7                                * 4233D
        DAT1=C  B                                * 42342
        D1=(5)  ANNCTRL                          * 42345
        C=DAT1  B                                * 4234C
        CBIT=1  4                                * 4234F
        DAT1=C  B                                * 42354
        RTN                                      * 42357

* refs (1): 0495D
SUB_42359:
        D1=(5)  ANNUNCIATORS                     * 42359
        C=DAT1  B                                * 42360
        CBIT=0  7                                * 42363
        DAT1=C  B                                * 42368
        D1=(5)  ANNCTRL                          * 4236B
        C=DAT1  B                                * 42372
        CBIT=0  4                                * 42375
        DAT1=C  B                                * 4237A
        RTN                                      * 4237D

* refs (1): 423F8
OBJ_4237F:
        CON(5)  (*)+5                            * 4237F  primitive code object
        GOSBVL  SAVPTR                           * 42384
        ST=0    15                               * 4238B
        GOSUB   settimeout                       * 4238E
        GOTO    L_423A9                          * 42392

* refs (3): 1800B 42118 421E0
OBJ_42396:
        CON(5)  (*)+5                            * 42396  primitive code object
        GOSBVL  SAVPTR                           * 4239B
        ST=0    15                               * 423A2
        GOSUB   clrtimeout                       * 423A5
L_423A9:
        GOSBVL  AllowIntr                        * 423A9
        P=      0                                * 423B0
        SETHEX                                   * 423B2
        GOVLNG  GETPTRLOOP                       * 423B4

* refs (1): 4238E
settimeout:
        GOSBVL  GetTimChk                        * 423BB
        A=C     W                                * 423C2
        GOSBVL  SUB_01797                        * 423C5
        A=A+C   W                                * 423CC
        GOTO    L_423D6                          * 423CF

* refs (1): 423A5
clrtimeout:
        A=0     W                                * 423D3
L_423D6:
        GOSBVL  SUB_01A96                        * 423D6
        GOVLNG  SUB_01485                        * 423DD
        RPL

* refs (1): 4217C
OBJ_423E4:
        ::                                       * 423E4
          NoEditLine?                            * 423E9
          ?SKIP                                  * 423EE
          OBJ_01F53                              * 423F3
          OBJ_4237F                              * 423F8
        ;                                        * 423FD

* -> flag
* refs (23): 19B2B 19CBD 395A1 39B8A 3A1CF 42217 ...
KEYINBUFFER?:
        ::                                       * 42402
          CHECKKEY                               * 42407
          NOTcaseFALSE                           * 4240C
          DROPTRUE                               * 42411
        ;                                        * 42416

* refs (13): 141A8 18E27 1A7BF 22F31 2308A 23153 ...
OBJ_4241B:
        ::                                       * 4241B
          NoAttn?Semi                            * 42420
          ATTNFLGCLR                             * 42425
          FLUSHKEYS                              * 4242A
          CK0NOLASTWD                            * 4242F
          ABORT                                  * 42434
        ;                                        * 42439

* ->
* refs (43): 02FB2 0CAA5 16A22 186A2 21015 2377C ...
?ATTNQUIT:
        ::                                       * 4243E
          NoAttn?Semi                            * 42443
          ATTNFLGCLR                             * 42448
          FLUSHKEYS                              * 4244D
          ABORT                                  * 42452
        ;                                        * 42457

* ->
* refs (10): 34153 3417B 341A3 341CB 341F3 3421B ...
NoAttn?Semi:
        ::                                       * 4245C
          ATTN?                                  * 42461
          ?SEMI                                  * 42466
          RDROP                                  * 4246B
        ;                                        * 42470

* refs (4): 2DB30 4206E 6BA29 6BA2E
DoCAlarmKey:
        ::                                       * 42475
          TakeOver                               * 4247A
          #CAlarmErr                             * 4247F
          ERROROUT                               * 42484
        ;                                        * 42489

* refs (2): 2DB2B 42064
CtlAlarm!:
        CON(5)  (*)+5                            * 4248E  primitive code object
        ASSEMBLE
        LC(5)   CtlAlarm                         * 42493
        GOVLNG  L_08D14                          * 4249A

* refs (1): 38962
CtlAlarm@:
        CON(5)  (*)+5                            * 424A1  primitive code object
        LC(5)   CtlAlarm                         * 424A6
        GOVLNG  SysPtr@                          * 424AD

* refs (1): 38953
OBJ_424B4:
        CON(5)  (*)+5                            * 424B4  primitive code object
        LC(5)   CtlAlarm                         * 424B9
        GOVLNG  L_08D35                          * 424C0

* refs (1): 3FF02
OBJ_424C7:
        CON(5)  (*)+5                            * 424C7  primitive code object
        LC(5)   CtlAlarm                         * 424CC
        GOVLNG  L_08D2F                          * 424D3
        RPL

* refs (2): 3B4D2 432B4
DCursor:
        ::                                       * 424DA
          LastERow?                              * 424DF
          ?SEMI                                  * 424E4
          OBJ_4285E                              * 424E9
          CURSOR@                                * 424EE
          OBJ_4482D                              * 424F3
          DROP                                   * 424F8
          #-                                     * 424FD
          #+                                     * 42502
          #1+                                    * 42507
          OBJ_13F69                              * 4250C
          OBJ_4482D                              * 42511
          OBJ_428F9                              * 42516
          OBJ_426C4                              * 4251B
        ;                                        * 42520

* refs (3): 3DED6 43291 4331D
ToTheLastRow:
        ::                                       * 42525
          OBJ_13FB0                              * 4252A
          SizeOfComLine                          * 4252F
          OBJ_4482D                              * 42534
          OBJ_42804                              * 42539
          SETCURSOR                              * 4253E
          EDITPARTS                              * 42543
          BINT3                                  * 42548
          2DUP#>                                 * 4254D
          NOTcase2DROP                           * 42552
          #-                                     * 42557
          OBJ_113E2                              * 4255C
          OBJ_426C4                              * 42561
        ;                                        * 42566

* refs (8): 3B482 3B654 3E4A2 3E67F 40724 40E15 ...
LCursor:
        ::                                       * 4256B
          OnTheFirstCol?                         * 42570
          ?SEMI                                  * 42575
          OBJ_13F11                              * 4257A
          CURSOR_OFF                             * 4257F
          BINT2                                  * 42584
          OVER#>                                 * 42589
          FIRSTC@                                * 4258E
          #0<>                                   * 42593
          AND                                    * 42598
          casedrop                               * 4259D
          OBJ_11452                              * 425A2
          #1-                                    * 425A7
          OBJ_13E9E                              * 425AC
        ;                                        * 425B1

* refs (1): 3DEA9
ToTheStartOfRow:
        ::                                       * 425B6
          OBJ_42741                              * 425BB
          SETCURSOR                              * 425C0
          CURSOR_OFF0                            * 425C5
          SETFIRSTC_0                            * 425CA
        ;                                        * 425CF

* refs (6): 3B527 3B64F 3E6CA 40765 432F5 4337C
->OnTheRow:
        ::                                       * 425D4
          CURSOR_END?                            * 425D9
          ?SEMI                                  * 425DE
          OBJ_42615                              * 425E3
        ;                                        * 425E8

* refs (7): 3DF03 3EE5B 3EE88 3EEBF 428B8 432D2 ...
ToTheEndOfRow:
        ::                                       * 425ED
          BEGIN                                  * 425F2
          CURSOR_END?                            * 425F7
          NOT                                    * 425FC
          WHILE                                  * 42601
          OBJ_42615                              * 42606
          REPEAT                                 * 4260B
        ;                                        * 42610

* refs (2): 425E3 42606
OBJ_42615:
        ::                                       * 42615
          CURSOR+                                * 4261A
          OBJ_4426D                              * 4261F
          CURSOR_OFF                             * 42624
          #-                                     * 42629
          DUP#0=csedrp                           * 4262E
          FIRSTC+                                * 42633
          BINT1                                  * 42638
          #>case                                 * 4263D
          CURSOR_OFF+                            * 42642
          CURSOR_END?                            * 42647
          case                                   * 4264C
          CURSOR_OFF+                            * 42651
          FIRSTC+                                * 42656
        ;                                        * 4265B

* refs (6): 3B3A5 3EE83 3EEB5 3EEBA 3EEE2 428B3
UCursor:
        ::                                       * 42660
          TopERow?                               * 42665
          ?SEMI                                  * 4266A
          OBJ_42886                              * 4266F
          OBJ_42741                              * 42674
          #1-                                    * 42679
          OBJ_13F7F                              * 4267E
          OBJ_4482D                              * 42683
          OBJ_42804                              * 42688
          SETCURSOR                              * 4268D
          OBJ_426C4                              * 42692
        ;                                        * 42697

* refs (1): 3DDED
ToTheFirstRow:
        ::                                       * 4269C
          OBJ_428E5                              * 426A1
          OBJ_13F9B                              * 426A6
          BINT0                                  * 426AB
          OBJ_4482D                              * 426B0
          OBJ_428F9                              * 426B5
          OBJ_426C4                              * 426BA
        ;                                        * 426BF

* refs (4): 4251B 42561 42692 426BA
OBJ_426C4:
        ::                                       * 426C4
          CURSOR_OFF                             * 426C9
          OBJ_4426D                              * 426CE
          #<>                                    * 426D3
          ?SEMI                                  * 426D8
          CURSOR_END?                            * 426DD
          ?SEMI                                  * 426E2
          LCursor                                * 426E7
        ;                                        * 426EC

* refs (3): 3B4AF 3DEC7 424DF
LastERow?:
        ::                                       * 426F1
          CurrentRow                             * 426F6
          EDITPARTS                              * 426FB
          #=                                     * 42700
        ;                                        * 42705

* refs (10): 3B44B 3B6E0 3DE9A 3E48E 3E670 3EEF1 ...
OnTheFirstCol?:
        ::                                       * 4270A
          FIRSTC@                                * 4270F
          #0=                                    * 42714
          CURSOR_OFF                             * 42719
          #0=                                    * 4271E
          AND                                    * 42723
        ;                                        * 42728

* refs (3): 3B382 3DDDE 42665
TopERow?:
        ::                                       * 4272D
          CurrentRow                             * 42732
          #1=                                    * 42737
        ;                                        * 4273C

* refs (2): 425BB 42674
OBJ_42741:
        ::                                       * 42741
          CURSOR@                                * 42746
          FIRSTC@                                * 4274B
          CURSOR_OFF                             * 42750
          #+                                     * 42755
          #-                                     * 4275A
        ;                                        * 4275F

* refs (4): 3B441 3B6DB 3E300 3E407
BegComLine?:(bip;q):
        ::                                       * 42764
          CURSOR@                                * 42769
          #0<>                                   * 4276E
          ?SEMI                                  * 42773
          RDROP                                  * 42778
          DoBadKey                               * 4277D
        ;                                        * 42782

* refs (4): 3B4F5 3B68B 3E382 3E4F0
EndComLine?:(bip;q):
        ::                                       * 42787
          NextChrInComLine                       * 4278C
          CHR_00                                 * 42791
          EQUALNOT                               * 42796
          ?SEMI                                  * 4279B
          RDROP                                  * 427A0
          DoBadKey                               * 427A5
        ;                                        * 427AA

* refs (12): 3B3A0 3B45A 3B47D 3B4CD 3B522 3DDE8 ...
Cursor&Disp:
        ::                                       * 427AF
          OBJ_113F2                              * 427B4
          FIRSTC@                                * 427B9
          'R                                     * 427BE
          EVAL                                   * 427C3
          FIRSTC@                                * 427C8
          #=                                     * 427CD
          SWAP                                   * 427D2
          OBJ_113F2                              * 427D7
          #=                                     * 427DC
          cursorblink-                           * 427E1
          AND                                    * 427E6
          ?SKIP                                  * 427EB
          DispEditLine                           * 427F0
          OBJ_42831                              * 427F5
          cursorblink+                           * 427FA
        ;                                        * 427FF

* refs (2): 42539 42688
OBJ_42804:
        ::                                       * 42804
          case                                   * 42809

3rolld;-(2s);+(2s):
          ::                                     * 4280E
            #-                                   * 42813
            #-                                   * 42818
          ;                                      * 4281D
          DROP                                   * 42822
          OBJ_13E9E                              * 42827
        ;                                        * 4282C

* refs (4): 3A0DA 427F5 42994 429BC
OBJ_42831:
        ::                                       * 42831
          LINESOFSTACK                           * 42836
          #1+                                    * 4283B
          CurrentRow                             * 42840
          OBJ_113F2                              * 42845
          #-                                     * 4284A
          #+                                     * 4284F
          OBJ_13B9C                              * 42854
        ;                                        * 42859

* refs (3): 424E9 428C7 42B7A
OBJ_4285E:
        ::                                       * 4285E
          OBJ_113F2                              * 42863
          #3+                                    * 42868
          CurrentRow                             * 4286D
          #<>                                    * 42872
          ?SEMI                                  * 42877
          OBJ_11402                              * 4287C
        ;                                        * 42881

* refs (2): 4266F 428AE
OBJ_42886:
        ::                                       * 42886
          OBJ_113F2                              * 4288B
          CurrentRow                             * 42890
          #<>                                    * 42895
          ?SEMI                                  * 4289A
          OBJ_11412                              * 4289F
        ;                                        * 428A4

* refs (3): 3B45F 3B6EF 3E67A
PrevLineIfStart:
        ::                                       * 428A9
          OBJ_42886                              * 428AE
          UCursor                                * 428B3
          ToTheEndOfRow                          * 428B8
        ;                                        * 428BD

* refs (3): 3E158 3E6C5 43377
ToNextRowIfEnd:
        ::                                       * 428C2
          OBJ_4285E                              * 428C7
          CURSOR+                                * 428CC
          OBJ_13F69                              * 428D1
          SETFIRSTC_0                            * 428D6
          CURSOR_OFF0                            * 428DB
        ;                                        * 428E0

* refs (1): 426A1
OBJ_428E5:
        ::                                       * 428E5
          BINT1                                  * 428EA
          OBJ_113E2                              * 428EF
        ;                                        * 428F4

* refs (2): 42516 426B5
OBJ_428F9:
        ::                                       * 428F9
          ITE                                    * 428FE
          SWAPDROP                               * 42903
          ::                                     * 42908
            DROPDUP                              * 4290D
            OBJ_13E9E                            * 42912
          ;                                      * 42917
          FIRSTC@                                * 4291C
          #+                                     * 42921
          #+                                     * 42926
          SETCURSOR                              * 4292B
        ;                                        * 42930

* refs (1): 3B712
OBJ_42935:
        ::                                       * 42935
          OnTheFirstCol?                         * 4293A
          ?SEMI                                  * 4293F
          cursorblink-                           * 42944
          CURSOR_END?                            * 42949
          CURSOR_OFF                             * 4294E
          #>1                                    * 42953
          AND                                    * 42958
          DUP                                    * 4295D
          IT                                     * 42962
          ::                                     * 42967
            CHR_Space                            * 4296C
            ROWNUM                               * 42971
            DISPCHAR+PC                          * 42976
          ;                                      * 4297B
          LCursor                                * 42980
          OBJ_429CB                              * 42985
          ?SKIP                                  * 4298A
          DispEditLine                           * 4298F
          OBJ_42831                              * 42994
          cursorblink+                           * 42999
        ;                                        * 4299E

* refs (1): 3B6BD
OBJ_429A3:
        ::                                       * 429A3
          CURSOR_END?                            * 429A8
          ?SEMI                                  * 429AD
          OBJ_429CB                              * 429B2
          DispEditLine                           * 429B7
          OBJ_42831                              * 429BC
          cursorblink+                           * 429C1
        ;                                        * 429C6

* refs (11): 3B69F 3B6F4 3E42F 3E45C 3E4A7 3E50E ...
OBJ_429CB:
        ::                                       * 429CB
          OBJ_42A07                              * 429D0
          NOT?SEMI                               * 429D5
          OBJ_113F2                              * 429DA
          DUP#1=                                 * 429DF
          caseDROP                               * 429E4
          #3+                                    * 429E9
          EDITPARTS                              * 429EE
          #>                                     * 429F3
          NOT?SEMI                               * 429F8
          OBJ_11412                              * 429FD
        ;                                        * 42A02

* refs (1): 429D0
OBJ_42A07:
        CON(5)  (*)+5                            * 42A07  primitive code object
        ASSEMBLE
        GOSBVL  SAVPTR                           * 42A0C
        GOSUB   SUB_42AC4                        * 42A13
        D0=C                                     * 42A17
        A=DAT0  B                                * 42A1A
        ?A#0    B                                * 42A1D
        GOYES   L_42A29                          * 42A20
        ST=0    3                                * 42A22
        GOTO    L_42AB8                          * 42A25
L_42A29:
        RSTK=C                                   * 42A29
        D0=(5)  EDITLINE                         * 42A2B
        C=DAT0  A                                * 42A32
        A=C     A                                * 42A35
        B=B-C   A                                * 42A37
        LC(5)   #00030                           * 42A39
        ?B<=C   A                                * 42A40
        GOYES   L_42A69                          * 42A43
        D1=(5)  DSKTOP                           * 42A45
        A=DAT1  A                                * 42A4C
        C=A     A                                * 42A4F
        C=C+1   A                                * 42A51
        C=C+1   A                                * 42A53
        DAT1=C  A                                * 42A55
        D1=(5)  EDITLINE                         * 42A58
        C=DAT1  A                                * 42A5F
        C=C+1   A                                * 42A62
        C=C+1   A                                * 42A64
        DAT1=C  A                                * 42A66
L_42A69:
        LC(2)   #0A                              * 42A69
        B=C     B                                * 42A6D
        C=RSTK                                   * 42A70
        D0=C                                     * 42A72
        D1=C                                     * 42A75
        D1=D1+  2                                * 42A78
        C=C-A   A                                * 42A7B
        A=DAT0  B                                * 42A7D
        ST=0    3                                * 42A80
        ?A#B    B                                * 42A83
        GOYES   L_42A8B                          * 42A86
        ST=1    3                                * 42A88
L_42A8B:
        GOSBVL  MOVEUP                           * 42A8B
        ?ST=0   3                                * 42A92
        GOYES   L_42AA9                          * 42A95
        D1=(5)  CR_COUNT                         * 42A97
        C=DAT1  A                                * 42A9E
        C=C-1   A                                * 42AA1
        DAT1=C  A                                * 42AA3
        GONC    L_42AB8                          * 42AA6
L_42AA9:
        GOSBVL  SUB_44772                        * 42AA9
        ?A#0    B                                * 42AB0
        GOYES   L_42AB8                          * 42AB3
        ST=1    3                                * 42AB5
L_42AB8:
        ?ST=1   3                                * 42AB8
        GOYES   L_42ABD                          * 42ABB
L_42ABD:
        GOVLNG  GPPushT/FLp                      * 42ABD

* refs (2): 13BBE 42A13
SUB_42AC4:
        D0=(5)  CURSOR                           * 42AC4
        A=0     A                                * 42ACB
        A=DAT0  A                                * 42ACD
        A=A+1   A                                * 42AD0
        A=A+A   A                                * 42AD2
        D0=(5)  TEMPENV                          * 42AD4
        C=DAT0  A                                * 42ADB
        B=C     A                                * 42ADE
        C=C-A   A                                * 42AE0
        RTN                                      * 42AE2
        RPL

* $/chr ->
* refs (4): 3B80F 3DB55 3F2BF 40477
EchoChrKey:
        ::                                       * 42AE4
          SetDA13NoCh                            * 42AE9
          ?SetEditRoll                           * 42AEE
          ?TogU/LCase                            * 42AF3
          OBJ_42B02                              * 42AF8
        ;                                        * 42AFD

* refs (2): 40DED 42AF8
OBJ_42B02:
        ::                                       * 42B02
          NoEditLine?                            * 42B07
          OVER                                   * 42B0C
          Char>Edit                              * 42B11
          caseDROP                               * 42B16
          CURSOR_OFF                             * 42B1B
          BINT20                                 * 42B20
          #<                                     * 42B25
          NOTcaseDROP                            * 42B2A
          INSERT?                                * 42B2F
          CURSOR_END?                            * 42B34
          NOTAND                                 * 42B39
          caseDROP                               * 42B3E
          cursorblink-                           * 42B43
          ROWNUM                                 * 42B48
          DISPCHAR+PC                            * 42B4D
          cursorblink+                           * 42B52
          SetDA2bNoCh                            * 42B57
        ;                                        * 42B5C

* refs (3): 3E11F 3EEFB 42CB5
OBJ_42B61:
        ::                                       * 42B61
          EDITPARTS                              * 42B66
          BINT4                                  * 42B6B
          #<                                     * 42B70
          ?SKIP                                  * 42B75
          OBJ_4285E                              * 42B7A
          CHR_Newline                            * 42B7F
          InsertEcho                             * 42B84
          CURSOR_OFF0                            * 42B89
          OBJ_13F69                              * 42B8E
          SETFIRSTC_0                            * 42B93
          OBJ_11422                              * 42B98
        ;                                        * 42B9D

* refs (1): 443D0
OBJ_42BA2:
        ::                                       * 42BA2
          ChkNoChr0!(st)                         * 42BA7
          Echo$NoChr00                           * 42BAC
        ;                                        * 42BB1

* $ ->
* refs (3): 42BAC 43ED1 D9B00
Echo$NoChr00:
        ::                                       * 42BB6
          dup;BeforeRC(st)?                      * 42BBB
          case2drop                              * 42BC0
          AddInComLine(st)                       * 42BC5
          OBJ_42C92                              * 42BCA
        ;                                        * 42BCF

* $/chr ->
* refs (2): 404C2 4062A
Echo$Key:
        ::                                       * 42BD4
          OBJ_42BFC                              * 42BD9
          dup;BeforeRC(st)?                      * 42BDE
          case2drop                              * 42BE3
          OBJ_42CE2                              * 42BE8
          SetDA3NoCh                             * 42BED
          OBJ_42C92                              * 42BF2
        ;                                        * 42BF7

* refs (1): 42BD9
OBJ_42BFC:
        ::                                       * 42BFC
          CkChr00                                * 42C01
          ?SEMIDROP                              * 42C06
          #_102                                  * 42C0B
          JstGetTHEMESG                          * 42C10
          DoWarning                              * 42C15
          RDROP                                  * 42C1A
        ;                                        * 42C1F

* refs (1): 42BA7
ChkNoChr0!(st):
        ::                                       * 42C24
          CkChr00                                * 42C29
          ?SEMI                                  * 42C2E
          NULLCHARERR                            * 42C33
        ;                                        * 42C38

* $ -> $ flag
* refs (3): 42C01 42C29 43E63
CkChr00:
        ::                                       * 42C3D
          DUP                                    * 42C42
          CHR_00                                 * 42C47
          ONEPOS$                                * 42C4C
          #0=                                    * 42C51
        ;                                        * 42C56

* refs (2): 42BBB 42BDE
dup;BeforeRC(st)?:
        ::                                       * 42C5B
          BINT1                                  * 42C60
          dup2;spos(st,RC)                       * 42C65
          DUP#0=                                 * 42C6A
        ;                                        * 42C6F

* refs (4): 3A071 3A4EC 42C65 42CC4
dup2;spos(st,RC):
        ::                                       * 42C74
          2DUP                                   * 42C79
          CHR_Newline                            * 42C7E
          SWAP                                   * 42C83
          POS$                                   * 42C88
        ;                                        * 42C8D

* refs (2): 42BCA 42BF2
OBJ_42C92:
        ::                                       * 42C92
          BEGIN                                  * 42C97
          BINT3                                  * 42C9C
          NDUP                                   * 42CA1
          #1-                                    * 42CA6
          SUB$                                   * 42CAB
          AddInComLine(st)                       * 42CB0
          OBJ_42B61                              * 42CB5
          SWAPDROP                               * 42CBA
          #1+                                    * 42CBF
          dup2;spos(st,RC)                       * 42CC4
          #0=UNTIL                               * 42CC9
          DROP                                   * 42CCE
          LAST$                                  * 42CD3
          AddInComLine(st)                       * 42CD8
        ;                                        * 42CDD

* refs (6): 3DFC9 404EA 405D5 40657 4070B 42BE8
OBJ_42CE2:
        ::                                       * 42CE2
          ?SetEditRoll                           * 42CE7
          SetDA3NoCh                             * 42CEC
          AddInComLine(st)                       * 42CF1
        ;                                        * 42CF6

* $ ->
* refs (3): 3B5E1 3B672 42B84
InsertEcho:
        ::                                       * 42CFB
          INSERT?                                * 42D00
          SWAP                                   * 42D05
          INSERT_MODE                            * 42D0A
          DUPTYPECHAR?                           * 42D0F
          ITE                                    * 42D14
          Char>Edit                              * 42D19
          AddInComLine(st)                       * 42D1E
          ?SEMI                                  * 42D23
          REPLACE_MODE                           * 42D28
        ;                                        * 42D2D

* ob -> ob'
* refs (2): 3ADE3 42E09
EditLevel1:
        ::                                       * 42D32
          OBJ_42D5A                              * 42D37
          CharEdit                               * 42D3C
        ;                                        * 42D41

* ob -> ob'
* refs (3): 3B49B 3D842 42E1D
ViewLevel1:
        ::                                       * 42D46
          OBJ_42D5A                              * 42D4B
          ObEdit                                 * 42D50
        ;                                        * 42D55

* refs (2): 42D37 42D4B
OBJ_42D5A:
        ::                                       * 42D5A
          CK1NOLASTWD                            * 42D5F
          DUP1LAMBIND                            * 42D64
          'REVAL                                 * 42D69
          ?SKIP                                  * 42D6E
          1GETLAM                                * 42D73
          ABND                                   * 42D78
        ;                                        * 42D7D

* refs (3): 42D3C 42DF5 42E68
CharEdit:
        ::                                       * 42D82
          AdjEdModes                             * 42D87
          EDITDECOMP$                            * 42D8C
          NULL$SWAP                              * 42D91
          BINT1                                  * 42D96
          BINT1                                  * 42D9B
          BINT0                                  * 42DA0
          BINT2                                  * 42DA5
          EditMenu                               * 42DAA
          BINT1                                  * 42DAF
          TRUE                                   * 42DB4
          BINT2                                  * 42DB9
          InputLine                              * 42DBE
        ;                                        * 42DC3

* ob -> ob' T -> F
* refs (2): 42D50 42E7C
ObEdit:
        ::                                       * 42DC8
          CK&DISPATCH0                           * 42DCD
          BINT9                                  * 42DD2
          OBJ_6B506                              * 42DD7
          BINT14                                 * 42DDC
          OBJ_6B506                              * 42DE1
          BINT4                                  * 42DE6
          DoOldMatrix                            * 42DEB
          BINT0                                  * 42DF0
          CharEdit                               * 42DF5
        ;                                        * 42DFA

* refs (2): 3AE85 43F3A
OBJ_42DFF:
        ::                                       * 42DFF
          PTR     Roll&Do:                       * 42E04
          EditLevel1                             * 42E09
        ;                                        * 42E0E

* refs (2): 3AE49 43EF4
BestEditLevel(r):
        ::                                       * 42E13
          PTR     Roll&Do:                       * 42E18
          ViewLevel1                             * 42E1D
        ;                                        * 42E22

* # ->
* refs (2): 42E04 42E18
Roll&Do::
        ::                                       * 42E27
          CKNNOLASTWD                            * 42E2C
          DUP1LAMBIND                            * 42E31
          ROLL                                   * 42E36
          'REVAL                                 * 42E3B
          AtUserStack                            * 42E40
          1GETABND                               * 42E45
          UNCOERCE                               * 42E4A
          CKNNOLASTWD                            * 42E4F
          UNROLL                                 * 42E54
        ;                                        * 42E59

* refs (4): 3ADCF 3ADD9 3AE8F 3AE99
Visit(nm):
        ::                                       * 42E5E
          PTR     Rcl&Do:                        * 42E63
          CharEdit                               * 42E68
        ;                                        * 42E6D

* refs (2): 3AE53 3AE5D
BestVisit(nm):
        ::                                       * 42E72
          PTR     Rcl&Do:                        * 42E77
          ObEdit                                 * 42E7C
        ;                                        * 42E81

* id ->
* refs (2): 42E63 42E77
Rcl&Do::
        ::                                       * 42E86
          DUP1LAMBIND                            * 42E8B
          SAFE@_HERE                             * 42E90
          NOTcase                                * 42E95
          SETNONEXTERR                           * 42E9A
          'REVAL                                 * 42E9F
          NOTcase                                * 42EA4
          ABND                                   * 42EA9
          AtUserStack                            * 42EAE
          1GETABND                               * 42EB3
          CK2NOLASTWD                            * 42EB8
          OBJ_2157E                              * 42EBD
        ;                                        * 42EC2

* refs (3): 42D87 43E95 D5EF7
AdjEdModes:
        ::                                       * 42EC7
          CK&DISPATCH0                           * 42ECC
          BINT3                                  * 42ED1
          OnlyPrgMo                              * 42ED6
          BINT5                                  * 42EDB
          OnlyPrgMo                              * 42EE0
          BINT8                                  * 42EE5
          OnlyPrgMo                              * 42EEA
          BINT13                                 * 42EEF
          OnlyPrgMo                              * 42EF4
          BINT4                                  * 42EF9
          ClrAlgEntry                            * 42EFE
          BINT11                                 * 42F03
          ClrAlgEntry                            * 42F08
          BINT10                                 * 42F0D
          SetAlgEntry                            * 42F12
          BINT14                                 * 42F17
          SetAlgEntry                            * 42F1C
          BINT0                                  * 42F21
          NOP                                    * 42F26
        ;                                        * 42F2B

* refs (4): 42ED6 42EE0 42EEA 42EF4
OnlyPrgMo:
        ::                                       * 42F30
          ClrAlgEntry                            * 42F35
          SetPrgmEntry                           * 42F3A
        ;                                        * 42F3F

* args -> $ T -> $ ob1..obn T -> ob1..obn T -> F args = $pr $line #pos #I/R #I/A #alph menu #row attn #parse
* refs (4): 42DBE 433B8 4347B 6B24B
InputLine:
        ::                                       * 42F44
          POLSaveUI                              * 42F49
          ERRSET                                 * 42F4E
          ::                                     * 42F53
            2SWAP                                * 42F58
            10UNROLL                             * 42F5D
            10UNROLL                             * 42F62
            7ROLL                                * 42F67
            InitEdLine                           * 42F6C
            EditString                           * 42F71
            6ROLL                                * 42F76
            SetCursor                            * 42F7B
            5ROLL                                * 42F80
            DUP#0<>                              * 42F85
            ITE                                  * 42F8A

=1(s)?:(Ins/Ovr)Cur:
            ::                                   * 42F8F
              #1=                                * 42F94
              ITE                                * 42F99
              INSERT_MODE                        * 42F9E
              REPLACE_MODE                       * 42FA3
            ;                                    * 42FA8
            DROP                                 * 42FAD
            SetPrgmEntry                         * 42FB2
            4ROLL                                * 42FB7
            DUP#0<>                              * 42FBC
            ITE                                  * 42FC1

=1(s)?:NoAlg/Alg:
            ::                                   * 42FC6
              #1=                                * 42FCB
              ITE                                * 42FD0
              ClrAlgEntry                        * 42FD5
              SetAlgEntry                        * 42FDA
            ;                                    * 42FDF
            DROP                                 * 42FE4
            ROT                                  * 42FE9
            DUP#0<>                              * 42FEE
            ITE                                  * 42FF3

=1(s)?:à/Noà:
            ::                                   * 42FF8
              #1=                                * 42FFD
              ITE                                * 43002
              LockAlpha                          * 43007
              UnLockAlpha                        * 4300C
            ;                                    * 43011
            DROP                                 * 43016
            FALSE                                * 4301B
            4NULLLAM{}                           * 43020
            BIND                                 * 43025
            '                                    * 4302A
            OBJ_43098                            * 4302F
            '                                    * 43034
            OBJ_43124                            * 43039
            TrueFalse                            * 4303E
            6ROLL                                * 43043
            6ROLL                                * 43048
            FALSE                                * 4304D
            '                                    * 43052
            1GETLAM                              * 43057
            'ERRJMP                              * 4305C
            POLSetUI                             * 43061
            ClrDAsOK                             * 43066
            POLKeyUI                             * 4306B
            ABND                                 * 43070
          ;                                      * 43075
          ERRTRAP                                * 4307A
          POLResUI&Err                           * 4307F
          POLRestoreUI                           * 43084
          InitEd&Modes                           * 43089
          ClrDAsOK                               * 4308E
        ;                                        * 43093

* refs (1): 4302F
OBJ_43098:
        ::                                       * 43098
          DA1OK?NOTIT                            * 4309D
          ?DispStatus                            * 430A2
          DA2aOK?NOTIT                           * 430A7
          DispILPrompt                           * 430AC
          DA2bOK?NOTIT                           * 430B1
          DispEditLine                           * 430B6
          DA3OK?NOTIT                            * 430BB
          ?DispMenu                              * 430C0
          ClrDAsOK                               * 430C5
        ;                                        * 430CA

* ->
* refs (1): 430AC
DispILPrompt:
        ::                                       * 430CF
          EDITPARTS                              * 430D4
          DUP                                    * 430D9
          BINT3                                  * 430DE
          #>                                     * 430E3
          casedrop                               * 430E8
          SetDA2aValid                           * 430ED
          TOADISP                                * 430F2
          BINT4                                  * 430F7
          SWAP#-                                 * 430FC
          BlankDA2a                              * 43101
          4GETLAM                                * 43106
          BINT3                                  * 4310B
          ROT                                    * 43110
          Disp5x7                                * 43115
          SetDA2aValid                           * 4311A
        ;                                        * 4311F

* refs (1): 43039
OBJ_43124:
        ::                                       * 43124
          DUP                                    * 43129
          BINT1                                  * 4312E
          #<>                                    * 43133
          SWAP                                   * 43138
          BINT4                                  * 4313D
          #<>                                    * 43142
          AND                                    * 43147
          casedrpfls                             * 4314C
          BINT25                                 * 43151
          ?CaseKeyDef                            * 43156
          InputLEnter                            * 4315B
          BINT45                                 * 43160
          ?CaseKeyDef                            * 43165
          InputLAttn                             * 4316A
          DROPFALSE                              * 4316F
        ;                                        * 43174

* refs (1): 4315B
InputLEnter:
        ::                                       * 43179
          TakeOver                               * 4317E
          EDITLINE$                              * 43183
          2GETLAM                                * 43188
          #0=case                                * 4318D

true;dup;1Lput:
          ::                                     * 43192
            TRUE                                 * 43197
            DUP                                  * 4319C
            1PUTLAM                              * 431A1
          ;                                      * 431A6
          Parse.1                                * 431AB
          NOTcase                                * 431B0
          ::                                     * 431B5
            5ROLLDROP                            * 431BA
            ParseFail                            * 431BF
          ;                                      * 431C4
          InitEdModes                            * 431C9
          TRUE                                   * 431CE
          1PUTLAM                                * 431D3
          2GETLAM                                * 431D8
          BINT1                                  * 431DD
          #=case                                 * 431E2
          TRUE                                   * 431E7
          SWAPDROP                               * 431EC
          EVAL                                   * 431F1
          TRUE                                   * 431F6
        ;                                        * 431FB

* refs (1): 4316A
InputLAttn:
        ::                                       * 43200
          TakeOver                               * 43205
          DAsBad?                                * 4320A
          ?SEMI                                  * 4320F
          OBJ_4478A                              * 43214
          NOT                                    * 43219
          3GETLAM                                * 4321E
          NOT                                    * 43223
          ANDcase                                * 43228
          OBJ_43241                              * 4322D
          FalseTrue                              * 43232
          1PUTLAM                                * 43237
        ;                                        * 4323C

* refs (1): 4322D
OBJ_43241:
        ::                                       * 43241
          InitEdLine                             * 43246
          NULL$                                  * 4324B
          EditString                             * 43250
        ;                                        * 43255

* # -> {# #'} ->
* refs (1): 42F7B
SetCursor:
        ::                                       * 4325A
          dLISTcase                              * 4325F
          SetCursPos(li)                         * 43264
          SetCursPos(s)                          * 43269
        ;                                        * 4326E

* refs (1): 43264
SetCursPos(li):
        ::                                       * 43273
          INNERCOMP                              * 43278
          DROPSWAP                               * 4327D
          DUP#0=ITE                              * 43282
          ::                                     * 43287
            DROP                                 * 4328C
            ToTheLastRow                         * 43291
          ;                                      * 43296
          ::                                     * 4329B
            DUPONE                               * 432A0
            #=                                   * 432A5
            caseDROP                             * 432AA
            ONE_DO                               * 432AF
            DCursor                              * 432B4
            LOOP                                 * 432B9
          ;                                      * 432BE
          DUP#0=ITE                              * 432C3
          ::                                     * 432C8
            DROP                                 * 432CD
            ToTheEndOfRow                        * 432D2
          ;                                      * 432D7
          ::                                     * 432DC
            DUPONE                               * 432E1
            #=                                   * 432E6
            caseDROP                             * 432EB
            ONE_DO                               * 432F0
            ->OnTheRow                           * 432F5
            LOOP                                 * 432FA
          ;                                      * 432FF
        ;                                        * 43304

* refs (5): 40B65 43269 D5F6F D62C8 D9BC9
SetCursPos(s):
        ::                                       * 43309
          DUP#0=ITE                              * 4330E
          ::                                     * 43313
            DROP                                 * 43318
            ToTheLastRow                         * 4331D
            ToTheEndOfRow                        * 43322
          ;                                      * 43327
          ::                                     * 4332C
            DUPONE                               * 43331
            #=                                   * 43336
            caseDROP                             * 4333B
            ONE_DO                               * 43340
            OBJ_44487                            * 43345
            ITE                                  * 4334A

drop;stop=0:
            ::                                   * 4334F
              DROP                               * 43354
              ExitAtLOOP                         * 43359
            ;                                    * 4335E
            ::                                   * 43363
              CHR_Newline                        * 43368
              EQUAL                              * 4336D
              ITE                                * 43372
              ToNextRowIfEnd                     * 43377
              ->OnTheRow                         * 4337C
            ;                                    * 43381
            LOOP                                 * 43386
          ;                                      * 4338B
        ;                                        * 43390

* refs (1): 224D9
input(2st):
        ::                                       * 43395
          BINT0                                  * 4339A
          ONEONE                                 * 4339F
          BINT3                                  * 433A4
          FALSE                                  * 433A9
          ZEROFALSE                              * 433AE
          BINT0                                  * 433B3
          InputLine                              * 433B8
          ?SEMI                                  * 433BD
          ABORT                                  * 433C2
        ;                                        * 433C7

* refs (1): 224E3
input(st,li):
        ::                                       * 433CC
          DUPNULL{}?                             * 433D1
          caseSIZEERR                            * 433D6
          {                                      * 433DB
            NULL$                                * 433E0
            BINT0                                * 433E5
            BINT1                                * 433EA
            BINT1                                * 433EF
            BINT2                                * 433F4
            BINT0                                * 433F9
          }                                      * 433FE
          SWAP                                   * 43403
          toLEN_DO                               * 43408
          DUPINDEX@                              * 4340D
          NTHCOMPDROP                            * 43412
          ::                                     * 43417
            CK&DISPATCH0                         * 4341C
            BINT3                                * 43421
            OBJ_434A3                            * 43426
            BINT1                                * 4342B
            OBJ_434B7                            * 43430
            BINT5                                * 43435
            OBJ_434D5                            * 4343A
            BINT6                                * 4343F
            OBJ_43534                            * 43444
            BINT7                                * 43449
            OBJ_43534                            * 4344E
          ;                                      * 43453
          LOOP                                   * 43458
          DROP                                   * 4345D
          INCOMPDROP                             * 43462
          FALSE                                  * 43467
          ZEROFALSE                              * 4346C
          4ROLL                                  * 43471
          DUP1LAMBIND                            * 43476
          InputLine                              * 4347B
          NOTcase                                * 43480
          ABORT                                  * 43485
          1GETABND                               * 4348A
          #1=                                    * 4348F
          IT                                     * 43494
          DROP                                   * 43499
        ;                                        * 4349E

* refs (1): 43426
OBJ_434A3:
        ::                                       * 434A3
          BINT1                                  * 434A8
          OBJ_43644                              * 434AD
        ;                                        * 434B2

* refs (1): 43430
OBJ_434B7:
        ::                                       * 434B7
          OBJ_43608                              * 434BC
          COERCE                                 * 434C1
          BINT2                                  * 434C6
          OBJ_43644                              * 434CB
        ;                                        * 434D0

* refs (1): 4343A
OBJ_434D5:
        ::                                       * 434D5
          INNERCOMP                              * 434DA
          BINT2                                  * 434DF
          #<>case                                * 434E4
          SETSIZEERR                             * 434E9
          DUPTYPEREAL?                           * 434EE
          3PICK                                  * 434F3
          TYPEREAL?                              * 434F8
          ANDNOTcase                             * 434FD
          SETSIZEERR                             * 43502
          4UNROLL                                * 43507
          OBJ_43608                              * 4350C
          COERCE                                 * 43511
          4ROLL                                  * 43516
          COERCE                                 * 4351B
          TWO{}N                                 * 43520
          BINT2                                  * 43525
          OBJ_43644                              * 4352A
        ;                                        * 4352F

* refs (2): 43444 4344E
OBJ_43534:
        ::                                       * 43534
          DUP'                                   * 43539

ALG:
          ID      ALG                            * 4353E
          EQUAL                                  * 4354B
          OVER'                                  * 43550

ΠALG:
          LAM     ALG                            * 43555
          EQUALOR                                * 43562
          casedrop                               * 43567
          ::                                     * 4356C
            BINT2                                * 43571
            BINT4                                * 43576
            OBJ_43644                            * 4357B
          ;                                      * 43580
          DUP'                                   * 43585

à:
          ID      α                              * 4358A
          EQUAL                                  * 43593
          OVER'                                  * 43598

Πà:
          LAM     α                              * 4359D
          EQUALOR                                * 435A6
          casedrop                               * 435AB
          ::                                     * 435B0
            BINT1                                * 435B5
            BINT5                                * 435BA
            OBJ_43644                            * 435BF
          ;                                      * 435C4
          DUP'                                   * 435C9

V:
          ID      V                              * 435CE
          EQUAL                                  * 435D7
          SWAP'                                  * 435DC

ΠV:
          LAM     V                              * 435E1
          EQUALOR                                * 435EA
          NcaseSIZEERR                           * 435EF
          BINT1                                  * 435F4
          BINT6                                  * 435F9
          OBJ_43644                              * 435FE
        ;                                        * 43603

* refs (2): 434BC 4350C
OBJ_43608:
        ::                                       * 43608
          DUP4UNROLL                             * 4360D
          %0_2A2B4                               * 43612
          %<                                     * 43617
          ITE                                    * 4361C
          BINT2                                  * 43621
          BINT1                                  * 43626
          BINT3                                  * 4362B
          OBJ_43644                              * 43630
          ROT                                    * 43635
          %ABS                                   * 4363A
        ;                                        * 4363F

* refs (7): 434AD 434CB 4352A 4357B 435BF 435FE ...
OBJ_43644:
        ::                                       * 43644
          4ROLL                                  * 43649
          PUTLIST                                * 4364E
          SWAP                                   * 43653
        ;                                        * 43658

* refs (7): 3B36E 3B37D 3DDD9 3E5E4 8EB84 D51AD ...
OBJ_4365D:
        ::                                       * 4365D
          TakeOver                               * 43662
          UStackDepth                            * 43667
          #0=case                                * 4366C

WarningC15:
          ::                                     * 43671
            MessageC15                           * 43676
            DoWarning                            * 4367B
            SetDA23NoCh                          * 43680
          ;                                      * 43685
          NoEditLine?                            * 4368A
          IT                                     * 4368F
          ::                                     * 43694
            CacheStack                           * 43699
            InitEdModes                          * 4369E
          ;                                      * 436A3
          POLSaveUI                              * 436A8
          ERRSET                                 * 436AD
          ::                                     * 436B2
            DEPTH                                * 436B7
            UStackDepth                          * 436BC
            #-                                   * 436C1
            BINT1                                * 436C6
            BINT4                                * 436CB
            FALSE                                * 436D0
            4NULLLAM{}                           * 436D5
            BIND                                 * 436DA
            '                                    * 436DF
            OBJ_43770                            * 436E4
            '                                    * 436E9
            OBJ_43842                            * 436EE
            TrueTrue                             * 436F3
            EditLExists?                         * 436F8
            4GETLAM                              * 436FD
            #0<>                                 * 43702
            OR                                   * 43707
            ITE                                  * 4370C
            {STACK\ECHO}_43E31                   * 43711

RclStackMenu:
            ::                                   * 43716
              '                                  * 4371B
              MenuSTACK                          * 43720
            ;                                    * 43725
            ONEFALSE                             * 4372A
            '                                    * 4372F
            1GETLAM                              * 43734
            'ERRJMP                              * 43739
            POLSetUI                             * 4373E
            ClrDAsOK                             * 43743
            POLKeyUI                             * 43748
            ABND                                 * 4374D
          ;                                      * 43752
          ERRTRAP                                * 43757
          POLResUI&Err                           * 4375C
          POLRestoreUI                           * 43761
          ClrDAsOK                               * 43766
        ;                                        * 4376B

* refs (1): 436E4
OBJ_43770:
        ::                                       * 43770
          DA2OK?                                 * 43775
          ?SKIP                                  * 4377A
          OBJ_437A2                              * 4377F
          DA1OK?NOTIT                            * 43784
          ?DispStatus                            * 43789
          DA3OK?NOTIT                            * 4378E
          ?DispMenu                              * 43793
          ClrDAsOK                               * 43798
        ;                                        * 4379D

* refs (1): 4377F
OBJ_437A2:
        ::                                       * 437A2
          KEYINBUFFER?                           * 437A7
          NOTcase                                * 437AC
          OBJ_437C5                              * 437B1
          SetDA2aBad                             * 437B6
          SetDA2bBad                             * 437BB
        ;                                        * 437C0

* refs (1): 437B1
OBJ_437C5:
        ::                                       * 437C5
          TOADISP                                * 437CA
          ClrAbbrevStk                           * 437CF
          3GETLAM                                * 437D4
          2GETLAM                                * 437D9
          #1-+                                   * 437DE
          BINT4                                  * 437E3
          ZERO_DO                                * 437E8
          ISTOP-INDEX                            * 437ED
          OVER                                   * 437F2
          OVER#-                                 * 437F7
          #1+DUP                                 * 437FC
          #3+                                    * 43801
          OBJ_4416A                              * 43806
          pick(s)?                               * 4380B
          OBJ_39DBF                              * 43810
          ISTOP-INDEX                            * 43815
          2GETLAM                                * 4381A
          #=                                     * 4381F
          IT                                     * 43824
          OBJ_441BF                              * 43829
          LOOP                                   * 4382E
          DROP                                   * 43833
          SetDA2Valid                            * 43838
        ;                                        * 4383D

* refs (1): 436EE
OBJ_43842:
        ::                                       * 43842
          BINT1                                  * 43847
          #=casedrop                             * 4384C
          OBJ_43883                              * 43851
          BINT2                                  * 43856
          #=casedrop                             * 4385B
          OBJ_43919                              * 43860
          BINT3                                  * 43865
          #=casedrop                             * 4386A
          OBJ_43982                              * 4386F
          2DROP                                  * 43874
          'DoBadKeyT                             * 43879
        ;                                        * 4387E

* refs (1): 43851
OBJ_43883:
        ::                                       * 43883
          DUP#<7                                 * 43888
          casedrpfls                             * 4388D
          BINT11                                 * 43892
          ?CaseKeyDef                            * 43897
          OBJ_439F5                              * 4389C
          BINT17                                 * 438A1
          ?CaseKeyDef                            * 438A6
          OBJ_43AD1                              * 438AB
          BINT26                                 * 438B0
          ?CaseKeyDef                            * 438B5
          OBJ_43F26                              * 438BA
          BINT29                                 * 438BF
          ?CaseKeyDef                            * 438C4
          OBJ_4407A                              * 438C9
          BINT25                                 * 438CE
          ?CaseKeyDef                            * 438D3
          OBJ_43CD4                              * 438D8
          BINT45                                 * 438DD
          ?CaseKeyDef                            * 438E2
          OBJ_43CE8                              * 438E7
          BINT12                                 * 438EC
          #=casedrpfls                           * 438F1
          BINT35                                 * 438F6
          #=casedrpfls                           * 438FB
          BINT40                                 * 43900
          #=casedrpfls                           * 43905
          DROP                                   * 4390A
          'DoBadKeyT                             * 4390F
        ;                                        * 43914

* refs (1): 43860
OBJ_43919:
        ::                                       * 43919
          DUP#<7                                 * 4391E
          casedrpfls                             * 43923
          BINT11                                 * 43928
          ?CaseKeyDef                            * 4392D
          OBJ_43B9E                              * 43932
          BINT17                                 * 43937
          ?CaseKeyDef                            * 4393C
          OBJ_43C16                              * 43941
          BINT26                                 * 43946
          ?CaseKeyDef                            * 4394B
          OBJ_43F26                              * 43950
          BINT12                                 * 43955
          #=casedrpfls                           * 4395A
          BINT35                                 * 4395F
          #=casedrpfls                           * 43964
          BINT40                                 * 43969
          #=casedrpfls                           * 4396E
          DROP                                   * 43973
          'DoBadKeyT                             * 43978
        ;                                        * 4397D

* refs (1): 4386F
OBJ_43982:
        ::                                       * 43982
          DUP#<7                                 * 43987
          casedrpfls                             * 4398C
          BINT45                                 * 43991
          #=casedrpfls                           * 43996
          BINT11                                 * 4399B
          ?CaseKeyDef                            * 439A0
          OBJ_43C89                              * 439A5
          BINT17                                 * 439AA
          ?CaseKeyDef                            * 439AF
          OBJ_43CAC                              * 439B4
          BINT26                                 * 439B9
          ?CaseKeyDef                            * 439BE
          OBJ_43F49                              * 439C3
          BINT35                                 * 439C8
          #=casedrpfls                           * 439CD
          BINT40                                 * 439D2
          #=casedrpfls                           * 439D7
          DROP                                   * 439DC
          'DoBadKeyT                             * 439E1
        ;                                        * 439E6
        BSS     10                               * 439EB

* refs (1): 4389C
OBJ_439F5:
        ::                                       * 439F5
          TakeOver                               * 439FA
          3GETLAM                                * 439FF
          OBJ_4417E                              * 43A04
          #1-                                    * 43A09
          #=case                                 * 43A0E
          DoBadKey                               * 43A13
          TOADISP                                * 43A18
          REPEATER                               * 43A1D
          BINT11                                 * 43A22
          OBJ_43A36                              * 43A27
          SetDA123NoCh                           * 43A2C
        ;                                        * 43A31

* refs (1): 43A27
OBJ_43A36:
        ::                                       * 43A36
          3GETLAM                                * 43A3B
          OBJ_4417E                              * 43A40
          #3-                                    * 43A45
          #=                                     * 43A4A
          ?SEMI                                  * 43A4F
          OBJ_441D3                              * 43A54
          3GETLAM                                * 43A59
          #1+                                    * 43A5E
          3PUTLAM                                * 43A63
          2GETLAM                                * 43A68
          BINT1                                  * 43A6D
          #=ITE                                  * 43A72
          ::                                     * 43A77
            BINT3                                * 43A7C
            ScreenDnN                            * 43A81
            BINT1                                * 43A86
            3GETLAM                              * 43A8B
            DUP                                  * 43A90
            #4+                                  * 43A95
            OBJ_4416A                            * 43A9A
            pick(s)?                             * 43A9F
            OBJ_39DBF                            * 43AA4
          ;                                      * 43AA9
          ::                                     * 43AAE
            2GETLAM                              * 43AB3
            #1-                                  * 43AB8
            2PUTLAM                              * 43ABD
          ;                                      * 43AC2
          OBJ_441BF                              * 43AC7
        ;                                        * 43ACC

* refs (1): 438AB
OBJ_43AD1:
        ::                                       * 43AD1
          TakeOver                               * 43AD6
          3GETLAM                                * 43ADB
          BINT1                                  * 43AE0
          #=case                                 * 43AE5
          DoBadKey                               * 43AEA
          TOADISP                                * 43AEF
          REPEATER                               * 43AF4
          BINT17                                 * 43AF9
          OBJ_43B0D                              * 43AFE
          SetDA123NoCh                           * 43B03
        ;                                        * 43B08

* refs (1): 43AFE
OBJ_43B0D:
        ::                                       * 43B0D
          3GETLAM                                * 43B12
          #1=                                    * 43B17
          ?SEMI                                  * 43B1C
          OBJ_441D3                              * 43B21
          3GETLAM                                * 43B26
          #1-                                    * 43B2B
          3PUTLAM                                * 43B30
          2GETLAM                                * 43B35
          BINT4                                  * 43B3A
          #=ITE                                  * 43B3F
          ::                                     * 43B44
            BINT3                                * 43B49
            ScreenUpN                            * 43B4E
            BINT4                                * 43B53
            3GETLAM                              * 43B58
            DUP                                  * 43B5D
            #4+                                  * 43B62
            OBJ_4416A                            * 43B67
            pick(s)?                             * 43B6C
            OBJ_39DBF                            * 43B71
          ;                                      * 43B76
          ::                                     * 43B7B
            2GETLAM                              * 43B80
            #1+                                  * 43B85
            2PUTLAM                              * 43B8A
          ;                                      * 43B8F
          OBJ_441BF                              * 43B94
        ;                                        * 43B99

* refs (1): 43932
OBJ_43B9E:
        ::                                       * 43B9E
          TakeOver                               * 43BA3
          OBJ_4417E                              * 43BA8
          3GETLAM                                * 43BAD
          2DUP#=                                 * 43BB2
          case2drop                              * 43BB7
          DoBadKey                               * 43BBC
          2DUPSWAP                               * 43BC1
          BINT4                                  * 43BC6
          #MAX                                   * 43BCB
          #4-                                    * 43BD0
          #>ITE                                  * 43BD5

drop;3Lput:
          ::                                     * 43BDA
            DROP                                 * 43BDF
            3PUTLAM                              * 43BE4
          ;                                      * 43BE9
          ::                                     * 43BEE
            #4+                                  * 43BF3
            3PUTLAM                              * 43BF8
            DROP                                 * 43BFD
          ;                                      * 43C02
          OBJ_44110                              * 43C07
          SetDA13NoCh                            * 43C0C
        ;                                        * 43C11

* refs (1): 43941
OBJ_43C16:
        ::                                       * 43C16
          TakeOver                               * 43C1B
          3GETLAM                                * 43C20
          DUP                                    * 43C25
          #1=                                    * 43C2A
          casedrop                               * 43C2F
          DoBadKey                               * 43C34
          DUP                                    * 43C39
          BINT5                                  * 43C3E
          #<ITE                                  * 43C43
          ::                                     * 43C48
            DROPONE                              * 43C4D
            3PUTLAM                              * 43C52
            BINT4                                * 43C57
            2PUTLAM                              * 43C5C
          ;                                      * 43C61
          ::                                     * 43C66
            #4-                                  * 43C6B
            3PUTLAM                              * 43C70
            OBJ_44110                            * 43C75
          ;                                      * 43C7A
          SetDA13NoCh                            * 43C7F
        ;                                        * 43C84

* refs (1): 439A5
OBJ_43C89:
        ::                                       * 43C89
          TakeOver                               * 43C8E
          OBJ_4417E                              * 43C93
          3PUTLAM                                * 43C98
          OBJ_44110                              * 43C9D
          SetDA13NoCh                            * 43CA2
        ;                                        * 43CA7

* refs (1): 439B4
OBJ_43CAC:
        ::                                       * 43CAC
          TakeOver                               * 43CB1
          BINT1                                  * 43CB6
          3PUTLAM                                * 43CBB
          BINT4                                  * 43CC0
          2PUTLAM                                * 43CC5
          SetDA13NoCh                            * 43CCA
        ;                                        * 43CCF

* refs (1): 438D8
OBJ_43CD4:
        ::                                       * 43CD4
          TakeOver                               * 43CD9
          OBJ_44259                              * 43CDE
        ;                                        * 43CE3

* refs (1): 438E7
OBJ_43CE8:
        ::                                       * 43CE8
          TakeOver                               * 43CED
          DAsBad?                                * 43CF2
          ?SEMI                                  * 43CF7
          OBJ_44259                              * 43CFC
        ;                                        * 43D01

* refs (1): 43720
MenuSTACK:
        ::                                       * 43D06
          NoExitAction                           * 43D0B

{MenuSTACK}:
          {                                      * 43D10

* refs (1): 43E36
{STACK\ECHO}:
            {                                    * 43D15
              $_ECHO                             * 43D1A
              \ECHO                              * 43D1F
            }                                    * 43D24

{STACK\VIEW}:
            {                                    * 43D29

_VIEW_:
              $       "VIEW"                     * 43D2E
              {                                  * 43D40
                \VIEW                            * 43D45
                DoBadKey                         * 43D4A
                \Ú>VIEW                          * 43D4F
              }                                  * 43D54
            }                                    * 43D59

{STACK\PICK}:
            {                                    * 43D5E
              xPICK                              * 43D63
              \PICK                              * 43D68
            }                                    * 43D6D

{STACK\ROLL}:
            {                                    * 43D72
              xROLL                              * 43D77
              \ROLL                              * 43D7C
            }                                    * 43D81

{STACK\ROLLD}:
            {                                    * 43D86
              xROLLD                             * 43D8B
              \ROLLD                             * 43D90
            }                                    * 43D95

{STACK\->LIST}:
            {                                    * 43D9A
              x>LIST                             * 43D9F
              \->LIST                            * 43DA4
            }                                    * 43DA9

{STACK\DUPN}:
            {                                    * 43DAE
              xDUPN                              * 43DB3
              \DUPN                              * 43DB8
            }                                    * 43DBD

{STACK\DRPN}:
            {                                    * 43DC2

_DRPN_:
              $       "DRPN"                     * 43DC7
              \DRPN                              * 43DD9
            }                                    * 43DDE

{STACK\KEEP}:
            {                                    * 43DE3

_KEEP_:
              $       "KEEP"                     * 43DE8
              \KEEP                              * 43DFA
            }                                    * 43DFF

{STACK\LEVEL}:
            {                                    * 43E04

_LEVEL_:
              $       "LEVEL"                    * 43E09
              \LEVEL                             * 43E1D
            }                                    * 43E22
          }                                      * 43E27
        ;                                        * 43E2C

* refs (2): 43711 43EAE
{STACK\ECHO}_43E31:
        {                                        * 43E31
          {STACK\ECHO}                           * 43E36
        }                                        * 43E3B

* refs (1): 43D1F
\ECHO:
        ::                                       * 43E40
          TakeOver                               * 43E45
          3GETLAM                                * 43E4A
          OBJ_4416A                              * 43E4F
          PICK                                   * 43E54
          DUP                                    * 43E59
          OBJ_408C3                              * 43E5E
          CkChr00                                * 43E63
          NOT                                    * 43E68
          case2drop                              * 43E6D
          ::                                     * 43E72
            #_102                                * 43E77
            JstGetTHEMESG                        * 43E7C
            DoWarning                            * 43E81
            SetDA23NoCh                          * 43E86
          ;                                      * 43E8B
          SWAP                                   * 43E90
          AdjEdModes                             * 43E95
          DROP                                   * 43E9A
          NoEditLine?                            * 43E9F
          ITE                                    * 43EA4
          ::                                     * 43EA9
            {STACK\ECHO}_43E31                   * 43EAE
            BINT1                                * 43EB3
            StartMenu                            * 43EB8
            SetDA2NoCh                           * 43EBD
          ;                                      * 43EC2
          SetDA23NoCh                            * 43EC7
          OBJ_4072E                              * 43ECC
          Echo$NoChr00                           * 43ED1
          OBJ_4072E                              * 43ED6
        ;                                        * 43EDB

* refs (1): 43D45
\VIEW:
        ::                                       * 43EE0
          TakeOver                               * 43EE5
          3GETLAM                                * 43EEA
          UNCOERCE                               * 43EEF
          BestEditLevel(r)                       * 43EF4
          OBJ_440CF                              * 43EF9
        ;                                        * 43EFE

* refs (1): 43D4F
\Ú>VIEW:
        ::                                       * 43F03
          TakeOver                               * 43F08
          3GETLAM                                * 43F0D
          PICK                                   * 43F12
          OBJ_3AE2B                              * 43F17
          OBJ_440CF                              * 43F1C
        ;                                        * 43F21

* refs (2): 438BA 43950
OBJ_43F26:
        ::                                       * 43F26
          ComLine?:(bip;q)                       * 43F2B
          3GETLAM                                * 43F30
          UNCOERCE                               * 43F35
          OBJ_42DFF                              * 43F3A
          OBJ_440CF                              * 43F3F
        ;                                        * 43F44

* refs (1): 439C3
OBJ_43F49:
        ::                                       * 43F49
          ComLine?:(bip;q)                       * 43F4E
          3GETLAM                                * 43F53
          PICK                                   * 43F58
          OBJ_3AE71                              * 43F5D
          OBJ_440CF                              * 43F62
        ;                                        * 43F67

* refs (1): 43D68
\PICK:
        ::                                       * 43F6C
          OBJ_4409D                              * 43F71
          PICK                                   * 43F76
          OBJ_440BB                              * 43F7B
        ;                                        * 43F80

* refs (1): 43D7C
\ROLL:
        ::                                       * 43F85
          OBJ_4409D                              * 43F8A
          ROLL                                   * 43F8F
          OBJ_440BB                              * 43F94
        ;                                        * 43F99

* refs (1): 43D90
\ROLLD:
        ::                                       * 43F9E
          OBJ_4409D                              * 43FA3
          UNROLL                                 * 43FA8
          OBJ_440BB                              * 43FAD
        ;                                        * 43FB2

* refs (1): 43E1D
\LEVEL:
        ::                                       * 43FB7
          TakeOver                               * 43FBC
          3GETLAM                                * 43FC1
          UNCOERCE                               * 43FC6
          OBJ_440BB                              * 43FCB
        ;                                        * 43FD0

* refs (1): 43DB8
\DUPN:
        ::                                       * 43FD5
          OBJ_4409D                              * 43FDA
          NDUP                                   * 43FDF
          OBJ_440BB                              * 43FE4
        ;                                        * 43FE9

* refs (1): 43DD9
\DRPN:
        ::                                       * 43FEE
          OBJ_4409D                              * 43FF3
          NDROP                                  * 43FF8
          OBJ_440CF                              * 43FFD
          SetDA13NoCh                            * 44002
        ;                                        * 44007
