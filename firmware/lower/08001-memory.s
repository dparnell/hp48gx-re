* HP 48GX ROM revision R, #08001-#0A005: Directories, variables and memory management
* Addresses in the right-hand comments are those of the original ROM.
* Most referenced: CONTEXT@ CREATE CONTEXT! HOMEDIR SysPtr@ RAM-WORDNAME REPLACE MYRAMROMPAIR RclBkp(nm,adr)? PURGE InitEnab purge(_)
* Follows on from the previous file (at #08001 in the original ROM).
        GOSUBL  GETTEMP                          * 08001
        AD0EX                                    * 08007
        A=A+C   A                                * 0800A
        D1=A                                     * 0800C
        D1=D1-  5                                * 0800F
        LC(5)   SEMI                             * 08012
        DAT1=C  A                                * 08019
        A=R2                                     * 0801C
        D0=A                                     * 0801F
        C=DAT0  A                                * 08022
        D=C     X                                * 08025
        D0=D0+  3                                * 08028
        A=0     A                                * 0802B
L_0802D:
        D=D-1   X                                * 0802D
        GOC     L_08050                          * 08030
        A=DAT0  X                                * 08033
        D1=D1-  5                                * 08037
        DAT1=A  A                                * 0803A
        LC(5)   DOBINT                           * 0803D
        D1=D1-  5                                * 08044
        DAT1=C  A                                * 08047
        D0=D0+  13                               * 0804A
        GONC    L_0802D                          * 0804D
L_08050:
        D1=D1-  5                                * 08050
        LC(5)   DOLIST                           * 08053
        DAT1=C  A                                * 0805A
        AD1EX                                    * 0805D
L_08060:
        GOSUBL  GETPTR                           * 08060
L_08066:
        DAT1=A  A                                * 08066
        GOTO    L_07C2A                          * 08069
        RPL

* refs (1): 8573B
libs~1~1:
        :: OBJ_7028A ROMPART>ADDR ;              * 0806D

* #libnum -> #addr T -> F
* refs (1): 08077
ROMPART>ADDR:
        CON(5)  (*)+5                            * 08081  primitive code object
        ASSEMBLE
        CD1EX                                    * 08086
        R0=C.F  A                                * 08089
        CD1EX                                    * 0808F
        D1=D1+  5                                * 08092
        D=D+1   A                                * 08095
        GOSUB   SUB_07BF9                        * 08097
        C=R0.F  A                                * 0809B
        D1=C                                     * 080A1
        C=DAT1  A                                * 080A4
        D1=D1+  5                                * 080A7
        DAT1=C  A                                * 080AA
        GOSUB   SUB_0843A                        * 080AD
        GONC    L_080B8                          * 080B1
        GOTO    L_07EBE                          * 080B4
L_080B8:
        GOVLNG  L_71223                          * 080B8

* #libnum -> #nibbles-10 T -> F
ROMPARTSIZE:
        CON(5)  (*)+5                            * 080BF  primitive code object
        GOSUB   SUB_07BF9                        * 080C4
        GOSUB   SUB_0843A                        * 080C8
        GONC    L_080D3                          * 080CC
        GOTO    L_07EBE                          * 080CF
L_080D3:
        GOVLNG  L_712AE                          * 080D3

* #libnum -> #nextlibnum T -> F
* refs (1): 08E29
NEXTROMPID:
        CON(5)  (*)+5                            * 080DA  primitive code object
        GOSUB   SUB_07BF9                        * 080DF
        D0=(5)  ROMPTAB                          * 080E3
        C=DAT0  A                                * 080EA
        D=C     X                                * 080ED
        D0=D0+  3                                * 080F0
L_080F3:
        D=D-1   X                                * 080F3
        GOC     L_08107                          * 080F6
        C=DAT0  A                                * 080F9
        ?C>=A   X                                * 080FC
        GOYES   L_0810B                          * 080FF
        D0=D0+  16                               * 08101
        GONC    L_080F3                          * 08104
L_08107:
        GOTO    L_07EBE                          * 08107
L_0810B:
        A=C     X                                * 0810B
        GOTO    L_07FBD                          * 0810E

* #libnum -> hxs_table T -> F
* refs (1): 3F500
GETHASH:
        CON(5)  (*)+5                            * 08112  primitive code object
        ST=0    11                               * 08117
L_0811A:
        GOSUB   SUB_07BF9                        * 0811A
        GOSUB   SUB_0847C                        * 0811E
        GONC    L_08129                          * 08122
        GOTO    L_07EBE                          * 08125
L_08129:
        GOVLNG  L_71564                          * 08129

* #libnum -> [] T -> F
* refs (1): 04D91
GETMSG:
        CON(5)  (*)+5                            * 08130  primitive code object
        ST=1    11                               * 08135
        GOTO    L_0811A                          * 08138

* #libnum -> hxs_table T -> F
GETLINK:
        CON(5)  (*)+5                            * 0813C  primitive code object
        ST=0    11                               * 08141
L_08144:
        GOSUB   SUB_07BF9                        * 08144
        GOSUB   SUB_084F5                        * 08148
        GONC    L_08153                          * 0814C
        GOTO    L_07EBE                          * 0814F
L_08153:
        GOTO    L_08129                          * 08153

* #libnum -> ob T -> F
* refs (1): 02223
GETCONFIG:
        CON(5)  (*)+5                            * 08157  primitive code object
        ST=1    11                               * 0815C
        GOTO    L_08144                          * 0815F
AdrPort0~1:
        GOSBVL  SAVPTR                           * 08163
        D1=(5)  ROMPARTS                         * 0816A
        A=DAT1  A                                * 08171
        R0=A                                     * 08174
        GOVLNG  L_706A1                          * 08177
        NIBHEX  0                                * 0817E
L_0817F:
        GOSUB   SUB_07BF9                        * 0817F
        D1=D1+  5                                * 08183
        CD1EX                                    * 08186
        D0=C                                     * 08189
        GONC    L_081B4                          * 0818C
L_0818F:
        A=0     A                                * 0818F
        A=DAT0  X                                * 08191
        GOTO    L_07FBD                          * 08195

* #libnum -> id T -> F
* refs (1): 85763
ROMPARTNAME:
        CON(5)  (*)+5                            * 08199  primitive code object
        GOSUB   SUB_07BF9                        * 0819E
        GOSUB   SUB_0843A                        * 081A2
        GOC     L_081B0                          * 081A6
        GOVLNG  L_712C5                          * 081A9
L_081B0:
        GOTO    L_07EBE                          * 081B0
L_081B4:
        GOSUB   SUB_07BAF                        * 081B4
        GOTO    L_08066                          * 081B8
        NIBHEX  793A174                          * 081BC  ρ£q
L_081C3:
        CD1EX                                    * 081C3
        D0=C                                     * 081C6
        GOSUB   SUB_08400                        * 081C9
        GONC    L_0818F                          * 081CD
        RTNSXM                                   * 081D0
        BSS     7                                * 081D2

* bak -> id T
* refs (6): 15D5B 15D9C 215FC 219F9 853B9 85C4C
BAKNAME:
        CON(5)  BAKNAME~1                        * 081D9  code object: the address of its machine code

* lib -> #libnum T
* refs (4): 15D42 215ED 219E5 853B4
LIB>#:
        CON(5)  LIB>#~1                          * 081DE  code object: the address of its machine code

* ob -> id T -> F
* refs (1): 62B3D
PTR>ID:
        CON(5)  (*)+5                            * 081E3  primitive code object
        A=DAT1  A                                * 081E8
        GOSUBL  SAVPTR                           * 081EB
        D0=A                                     * 081F1
        D0=D0-  3                                * 081F4
        GOTO    L_0820F                          * 081F7

* ROMPTR -> id T -> F
* refs (6): 16176 28AAB 3A6C7 412B5 54B50 56EC3
ROMPTRDECOMP:
        CON(5)  (*)+5                            * 081FB  primitive code object
        A=DAT1  A                                * 08200
        GOSUBL  SAVPTR                           * 08203
        D0=A                                     * 08209
        D0=D0+  8                                * 0820C
L_0820F:
        A=0     A                                * 0820F
        A=DAT0  X                                * 08211
        B=A     A                                * 08215
        D0=D0-  3                                * 08217
        A=DAT0  X                                * 0821A
        GOSUBL  SUB_08479                        * 0821E
        ST=0    1                                * 08224
        GONC    L_0822E                          * 08227
        GOTO    L_07EBE                          * 0822A
L_0822E:
        A=DAT0  A                                * 0822E
        LC(5)   DOEXT1                           * 08231
        ?C#A    A                                * 08238
        GOYES   L_0825E                          * 0823B
        D0=D0+  5                                * 0823D
        A=DAT0  A                                * 08240
        D0=D0+  5                                * 08243
        C=DAT0  A                                * 08246
        ?C=0    A                                * 08249
        GOYES   L_0825B                          * 0824C
        ST=1    1                                * 0824E
        D1=C                                     * 08251
        GOSUB   SUB_07AB7                        * 08254
        CD1EX                                    * 08258
L_0825B:
        D0=A                                     * 0825B
L_0825E:
        RSTK=C                                   * 0825E
        D0=D0+  5                                * 08260
        C=DAT0  A                                * 08263
        D=C     A                                * 08266
        CD0EX                                    * 08268
        D=D+C   A                                * 0826B
        A=C     A                                * 0826D
        LC(5)   #00055                           * 0826F
        A=A+C   A                                * 08276
        D0=A                                     * 08278
        C=DAT0  A                                * 0827B
        C=C+A   A                                * 0827E
        A=B     A                                * 08280
        B=B+B   A                                * 08282
        B=B+B   A                                * 08284
        A=A+B   A                                * 08286
        C=C+A   A                                * 08288
        ?D<=C   A                                * 0828A
        GOYES   L_082D5                          * 0828D
        D0=C                                     * 0828F
        A=DAT0  A                                * 08292
        ?A=0    A                                * 08295
        GOYES   L_082D5                          * 08298
        C=C-A   A                                * 0829A
        D0=C                                     * 0829C
        ?ST=0   1                                * 0829F
        GOYES   L_082D1                          * 082A2
        R0=C.F  A                                * 082A4
        C=0     A                                * 082AA
        LC(2)   #22                              * 082AC
        A=C     A                                * 082B0
        LC(5)   IRAMBUFF                         * 082B2
        R1=C.F  A                                * 082B9
        C=RSTK                                   * 082BF
        P=      2                                * 082C1
        C=0     S                                * 082C3
        GOSUB   SUB_08471                        * 082C6
        D0=(5)  IRAMBUFF                         * 082CA
L_082D1:
        GOTO    L_081B4                          * 082D1
L_082D5:
        C=RSTK                                   * 082D5
        GOSUB   SUB_07B6A                        * 082D7
        GOTO    L_07EBE                          * 082DB
        NIBHEX  0000                             * 082DF  ..

* ob -> id
* refs (10): 09863 16CB6 184A5 186AC 21138 399A7 ...
RAM-WORDNAME:
        CON(5)  (*)+5                            * 082E3  primitive code object
        A=DAT1  A                                * 082E8
        GOSUBL  SAVPTR                           * 082EB
        D0=A                                     * 082F1
        GOSUB   SUB_0841E                        * 082F4
        GOSUB   SUB_07BAF                        * 082F8
        DAT1=A  A                                * 082FC
        A=DAT0  A                                * 082FF
        D0=D0+  5                                * 08302
        PC=(A)                                   * 08305

* rrp -> rrp' T -> F
* refs (9): 1815A 184B9 1A179 39A0B 3F3FC B96C1 ...
MYRAMROMPAIR:
        CON(5)  (*)+5                            * 08309  primitive code object
        A=DAT1  A                                * 0830E
        GOSUBL  SAVPTR                           * 08311
        GOSUB   GETRRP                           * 08317
        GONC    L_08322                          * 0831B
        GOTO    L_07EBE                          * 0831E
L_08322:
        GOTO    L_08060                          * 08322

* rrp -> ob T -> F
* refs (5): 09840 18626 21129 648D6 72A9B
LASTRAM-WORD:
        CON(5)  (*)+5                            * 08326  primitive code object
        A=DAT1  A                                * 0832B
        CD0EX                                    * 0832E
        R0=C                                     * 08331
        GOSUB   SUB_08503                        * 08334
        A=DAT0  A                                * 08338
        ?A#0    A                                * 0833B
        GOYES   L_0835A                          * 0833E
L_08340:
        A=R0                                     * 08340
        D0=A                                     * 08343
        LC(5)   FALSE                            * 08346
        DAT1=C  A                                * 0834D
        A=DAT0  A                                * 08350
        D0=D0+  5                                * 08353
        PC=(A)                                   * 08356
L_0835A:
        CD0EX                                    * 0835A
        C=C+A   A                                * 0835D
L_0835F:
        D0=C                                     * 0835F
        GOSUB   SUB_08400                        * 08362
        AD0EX                                    * 08366
        DAT1=A  A                                * 08369
        A=R0                                     * 0836C
        D0=A                                     * 0836F
        GOTO    L_07C2A                          * 08372

* ob -> ob' T -> F
* refs (2): 09881 1863F
PREVRAM-WORD:
        CON(5)  (*)+5                            * 08376  primitive code object
        A=DAT1  A                                * 0837B
        AD0EX                                    * 0837E
        R0=A                                     * 08381
        GOSUB   SUB_0841E                        * 08384
        D0=D0-  5                                * 08388
        A=DAT0  A                                * 0838B
        ?A=0    A                                * 0838E
        GOYES   L_08340                          * 08391
        CD0EX                                    * 08393
        C=C-A   A                                * 08396
        GONC    L_0835F                          * 08398

* refs (2): 083D1 0855F
SUB_0839B:
        D0=(5)  USEROB                           * 0839B
        C=DAT0  A                                * 083A2
        ?C=A    A                                * 083A5
        RTNYES                                   * 083A8
        D0=A                                     * 083AA
        GOSUB   SUB_0841E                        * 083AD
        AD0EX                                    * 083B1
        B=A     A                                * 083B4
L_083B6:
        D0=A                                     * 083B6
        D0=D0-  5                                * 083B9
        C=DAT0  A                                * 083BC
        ?C=0    A                                * 083BF
        GOYES   L_083CC                          * 083C2
        AD0EX                                    * 083C4
        A=A-C   A                                * 083C7
        GONC    L_083B6                          * 083C9
L_083CC:
        D0=D0-  5                                * 083CC
        RTNCC                                    * 083CF

* Returns the RRP in which the object at A.A lies. If ob is SysRRP, returns CS and leaves A.A unchanged; else CC and A.A->RRP B.A->RAM-WORD Uses A.A B.A C.A D.A D0
* refs (3): 078DE 08317 08A27
GETRRP:
        GOSUB   SUB_0839B                        * 083D1
        RTNC                                     * 083D5
        CD0EX                                    * 083D8
        D=C     A                                * 083DB
        D0=(5)  USEROB                           * 083DD
        A=DAT0  A                                * 083E4
        GOSUB   SUB_08503                        * 083E7
        CD0EX                                    * 083EB
        ?D=C    A                                * 083EE
        GOYES   L_083FE                          * 083F1
        C=D     A                                * 083F3
        D0=C                                     * 083F5
        D0=D0-  8                                * 083F8
        AD0EX                                    * 083FB
L_083FE:
        RTNCC                                    * 083FE

* refs (12): 078BD 081C9 08362 087C5 0947F 095B8 ...
SUB_08400:
        C=0     A                                * 08400
        C=DAT0  B                                * 08402
        ?C=0    A                                * 08405
        GOYES   L_08419                          * 08408
        C=C+C   A                                * 0840A
        AD0EX                                    * 0840C
        C=C+A   A                                * 0840F
        D0=C                                     * 08411
        D0=D0+  4                                * 08414
        RTNCC                                    * 08417
L_08419:
        D0=D0+  2                                * 08419
        RTNCC                                    * 0841C

* refs (7): 082F4 08384 083AD 18416 7127A 712DD ...
SUB_0841E:
        D0=D0-  2                                * 0841E
        C=0     A                                * 08421
        C=DAT0  B                                * 08423
        ?C=0    A                                * 08426
        GOYES   L_08438                          * 08429
        C=C+C   A                                * 0842B
        AD0EX                                    * 0842D
        C=A-C   A                                * 08430
        D0=C                                     * 08432
        D0=D0-  2                                * 08435
L_08438:
        RTNCC                                    * 08438

* refs (6): 080AD 080C8 081A2 084B2 084F5 71014
* Search ROMPTAB (RAM #809A3) by library number; used by ROMPART>ADDR
SUB_0843A:
        D0=(5)  ROMPTAB                          * 0843A
        C=DAT0  A                                * 08441
        D=C     X                                * 08444
        D0=D0+  3                                * 08447
L_0844A:
        D=D-1   X                                * 0844A
        RTNC                                     * 0844D
        C=DAT0  A                                * 08450
        ?C=A    X                                * 08453
        GOYES   L_08463                          * 08456
        ?C>A    X                                * 08458
        RTNYES                                   * 0845B
        D0=D0+  16                               * 0845D
        GONC    L_0844A                          * 08460
L_08463:
        D0=D0+  3                                * 08463
        C=DAT0  A                                * 08466
        D0=D0+  5                                * 08469
        CD0EX                                    * 0846C
        RTNCC                                    * 0846F

* refs (1): 082C6
SUB_08471:
        RSTK=C                                   * 08471
        RTN                                      * 08473
        NIBHEX  808E                             * 08475  .è

* refs (1): 0821E
SUB_08479:
        ST=0    11                               * 08479

* refs (1): 0811E
SUB_0847C:
        D0=(5)  USEROB                           * 0847C
        C=DAT0  A                                * 08483
        D0=C                                     * 08486
        D0=D0+  5                                * 08489
        C=DAT0  A                                * 0848C
        D=C     X                                * 0848F
        D0=D0+  3                                * 08492
L_08495:
        D=D-1   X                                * 08495
        GOC     SUB_084B2                        * 08498
        C=DAT0  A                                * 0849B
        ?C#A    X                                * 0849E
        GOYES   L_084A7                          * 084A1
        GOTO    L_084D4                          * 084A3
L_084A7:
        ?C>A    X                                * 084A7
        GOYES   SUB_084B2                        * 084AA
        D0=D0+  13                               * 084AC
        GONC    L_08495                          * 084AF

* refs (3): 07C58 08498 084A7
SUB_084B2:
        GOSUB   SUB_0843A                        * 084B2
        RTNC                                     * 084B6
        D0=D0+  3                                * 084B9
L_084BC:
        ?ST=0   11                               * 084BC
        GOYES   L_084C4                          * 084BF
        D0=D0+  5                                * 084C1
L_084C4:
        CD0EX                                    * 084C4
        A=DAT0  A                                * 084C7
        CD0EX                                    * 084CA
        GOVLNG  L_72D23                          * 084CD
L_084D4:
        D0=D0+  3                                * 084D4
        ?ST=0   11                               * 084D7
        GOYES   L_084DF                          * 084DA
        D0=D0+  5                                * 084DC
L_084DF:
        A=DAT0  A                                * 084DF
        ?A=0    A                                * 084E2
        RTNYES                                   * 084E5
        D0=A                                     * 084E7
        RTNCC                                    * 084EA
        BSS     9                                * 084EC

* refs (3): 07CEF 07EFD 08148
SUB_084F5:
        GOSUB   SUB_0843A                        * 084F5
        RTNC                                     * 084F9
        D0=D0+  13                               * 084FC
        GOTO    L_084BC                          * 084FF

* refs (9): 07891 07C82 08334 083E7 08550 087AB ...
SUB_08503:
        D0=(5)  USEROB                           * 08503
        C=DAT0  A                                * 0850A
        D0=A                                     * 0850D
        D0=D0+  5                                * 08510
        ?C#A    A                                * 08513
        GOYES   L_08527                          * 08516
        C=DAT0  A                                * 08518
L_0851B:
        C=C-1   X                                * 0851B
        GOC     L_08527                          * 0851E
        D0=D0+  13                               * 08521
        GONC    L_0851B                          * 08524
L_08527:
        D0=D0+  3                                * 08527
        RTNSC                                    * 0852A

* refs (6): 039F7 03A1C 087A4 08A3D 0A894 380DD
SUB_0852C:
        R0=C                                     * 0852C
        D=C     A                                * 0852F
        CD0EX                                    * 08531
        GOSUBL  SUB_03A64                        * 08534
        ?D=0    A                                * 0853A
        RTNYES                                   * 0853D
        D0=(5)  USEROB                           * 0853F
        A=DAT0  A                                * 08546
        ?C=A    A                                * 08549
        RTNYES                                   * 0854C
        B=C     A                                * 0854E
        GOSUB   SUB_08503                        * 08550
        A=B     A                                * 08554
        AD0EX                                    * 08556
        R1=A                                     * 08559
L_0855C:
        AD0EX                                    * 0855C
        GOSUB   SUB_0839B                        * 0855F
        A=DAT0  A                                * 08563
        CD0EX                                    * 08566
        D0=C                                     * 08569
        C=C+A   A                                * 0856C
        ?B#C    A                                * 0856E
        GOYES   L_0857B                          * 08571
        CD0EX                                    * 08573
        D=C     A                                * 08576
        GONC    L_085BF                          * 08578
L_0857B:
        D=C     A                                * 0857B
        C=R0                                     * 0857D
        ?ST=1   5                                * 08580
        GOYES   L_0858A                          * 08583
        A=A-C   A                                * 08585
        GONC    L_0858C                          * 08587
L_0858A:
        A=A+C   A                                * 0858A
L_0858C:
        DAT0=A  A                                * 0858C
        CD0EX                                    * 0858F
        DCEX    A                                * 08592
L_08594:
        D0=C                                     * 08594
        D0=D0-  5                                * 08597
        A=DAT0  A                                * 0859A
        CD0EX                                    * 0859D
        D0=C                                     * 085A0
        C=C-A   A                                * 085A3
        ?B#C    A                                * 085A5
        GOYES   L_08594                          * 085A8
        A=DAT0  A                                * 085AA
        C=R0                                     * 085AD
        ?ST=1   5                                * 085B0
        GOYES   L_085BA                          * 085B3
        A=A-C   A                                * 085B5
        GONC    L_085BC                          * 085B7
L_085BA:
        A=A+C   A                                * 085BA
L_085BC:
        DAT0=A  A                                * 085BC
L_085BF:
        C=R1                                     * 085BF
        ?D=C    A                                * 085C2
        RTNYES                                   * 085C5
        C=D     A                                * 085C7
        D0=C                                     * 085C9
        D0=D0-  8                                * 085CC
        GOTO    L_0855C                          * 085CF

* newob oldob -> newob
* refs (9): 08CA9 2092B 209E1 36250 36368 3647B ...
REPLACE:
        CON(5)  (*)+5                            * 085D3  primitive code object
        A=DAT1  A                                * 085D8
        R4=A                                     * 085DB
        D1=D1+  5                                * 085DE
        D=D+1   A                                * 085E1
        A=DAT1  A                                * 085E3
        GOSUBL  SAVPTR                           * 085E6
        B=A     A                                * 085EC
        D0=A                                     * 085EE
        GOSUBL  SKIPOB                           * 085F1
        CD0EX                                    * 085F7
        A=R4                                     * 085FA
        ?A=B    A                                * 085FD
        GOYES   L_08610                          * 08600
        ?A<B    A                                * 08602
        GOYES   L_08620                          * 08605
        ?C<=A   A                                * 08607
        GOYES   L_08620                          * 0860A
L_0860C:
        GOTO    L_086EE                          * 0860C
L_08610:
        GOSUBL  GETPTR                           * 08610
        A=DAT0  A                                * 08616
        D0=D0+  5                                * 08619
        PC=(A)                                   * 0861C
L_08620:
        C=C-B   A                                * 08620
        CR4EX                                    * 08622
        D0=C                                     * 08625
        BCEX    A                                * 08628
        D=C     A                                * 0862A
        GOSUBL  SKIPOB                           * 0862C
        CD0EX                                    * 08632
        ?D>=C   A                                * 08635
        GOYES   L_08643                          * 08638
        BCEX    A                                * 0863A
        ?D>C    A                                * 0863C
        GOYES   L_0860C                          * 0863F
        BCEX    A                                * 08641
L_08643:
        C=C-B   A                                * 08643
        A=R4                                     * 08645
        ?C#A    A                                * 08648
        GOYES   L_08657                          * 0864B
        GOSUBL  SUB_03A64                        * 0864D
        GOTO    L_08674                          * 08653
L_08657:
        ?C>A    A                                * 08657
        GOYES   L_08664                          * 0865A
        ST=1    5                                * 0865C
        C=A-C   A                                * 0865F
        GONC    L_08669                          * 08661
L_08664:
        ST=0    5                                * 08664
        C=C-A   A                                * 08667
L_08669:
        A=B     A                                * 08669
        D0=A                                     * 0866B
        GOSUBL  ECUSER                           * 0866E
L_08674:
        D0=(5)  DSKTOP                           * 08674
        A=DAT0  A                                * 0867B
        D0=A                                     * 0867E
        C=DAT0  A                                * 08681
        A=B     A                                * 08684
        DAT0=A  A                                * 08686
        D0=C                                     * 08689
        D1=A                                     * 0868C
        C=R4                                     * 0868F
        GOTO    L_08884                          * 08692

* ob id ->
* refs (15): 08CBD 08E0B 2105B 21088 4BC38 4C337 ...
CREATE:
        CON(5)  (*)+5                            * 08696  primitive code object
        GOSUBL  SAVPTR                           * 0869B
        ST=0    10                               * 086A1
        A=DAT1  A                                * 086A4
        D0=A                                     * 086A7
        D0=D0+  5                                * 086AA
        C=0     A                                * 086AD
        C=DAT0  B                                * 086AF
        C=C+C   A                                * 086B2
        P=      6                                * 086B4
        ?C=0    A                                * 086B6
        GOYES   L_086BD                          * 086B9
        P=      8                                * 086BB
L_086BD:
        C+P+1                                    * 086BD
        R4=C                                     * 086C0
        D1=D1+  5                                * 086C3
        A=DAT1  A                                * 086C6
        B=A     A                                * 086C9
        D0=A                                     * 086CB
        GOSUBL  SKIPOB                           * 086CE
        CD0EX                                    * 086D4
        D0=(5)  CONTEXT                          * 086D7
        A=DAT0  A                                * 086DE
        R2=A                                     * 086E1
        ?A<B    A                                * 086E4
        GOYES   L_086FA                          * 086E7
        ?C<=A   A                                * 086E9
        GOYES   L_086FA                          * 086EC
L_086EE:
        GOSUBL  GETPTR                           * 086EE
        GOLONG  L_04FC7                          * 086F4
L_086FA:
        C=C-B   A                                * 086FA
        R3=C                                     * 086FC
        A=R4                                     * 086FF
        C=C+A   A                                * 08702
L_08704:
        D=C     A                                * 08704
        GOSUBL  ROOM                             * 08706
        ST=0    8                                * 0870C
        ?D>C    A                                * 0870F
        GOYES   L_08718                          * 08712
        GOTO    L_08799                          * 08714
L_08718:
        ?ST=1   10                               * 08718
        GOYES   L_0874D                          * 0871B
        C=D     A                                * 0871D
        R1=C.F  A                                * 0871F
        GOSUBL  GARBAGECOL                       * 08725  inline data follows
        ST=1    10                               * 0872B
        D1=(5)  DSKTOP                           * 0872E
        C=DAT1  A                                * 08735
        D1=C                                     * 08738
        D1=D1+  5                                * 0873B
        C=DAT1  A                                * 0873E
        B=C     A                                * 08741
        C=R1.F  A                                * 08743
        GOTO    L_08704                          * 08749
L_0874D:
        A=R4                                     * 0874D
        ?C>=A   A                                * 08750
        GOYES   L_08761                          * 08753
L_08755:
        GOSUBL  GETPTR                           * 08755
        GOLONG  DOMEMERR                         * 0875B
L_08761:
        D0=(5)  TEMPOB                           * 08761
        C=DAT0  A                                * 08768
        ?B<C    A                                * 0876B
        GOYES   L_08755                          * 0876E
        D0=(5)  TEMPTOP                          * 08770
        C=DAT0  A                                * 08777
        ?B>=C   A                                * 0877A
        GOYES   L_08755                          * 0877D
        B=B-1   A                                * 0877F
L_08781:
        D0=C                                     * 08781
        D0=D0-  5                                * 08784
        A=DAT0  A                                * 08787
        ?A=0    A                                * 0878A
        GOYES   L_08755                          * 0878D
        C=C-A   A                                * 0878F
        ?B#C    A                                * 08791
        GOYES   L_08781                          * 08794
        ST=1    8                                * 08796
L_08799:
        A=R2                                     * 08799
        D0=A                                     * 0879C
        C=D     A                                * 0879F
        ST=1    5                                * 087A1
        GOSUB   SUB_0852C                        * 087A4
        A=R2                                     * 087A8
        GOSUB   SUB_08503                        * 087AB
        A=DAT0  A                                * 087AF
        ?A#0    A                                * 087B2
        GOYES   L_087BD                          * 087B5
        D0=D0+  5                                * 087B7
        GONC    L_087CF                          * 087BA
L_087BD:
        CD0EX                                    * 087BD
        C=C+A   A                                * 087C0
        D0=C                                     * 087C2
        GOSUB   SUB_08400                        * 087C5
        GOSUBL  SKIPOB                           * 087C9
L_087CF:
        AD0EX                                    * 087CF
        C=R0                                     * 087D2
        ?ST=0   8                                * 087D5
        GOYES   L_087DD                          * 087D8
        C=R4                                     * 087DA
L_087DD:
        GOSUBL  MOVEDSD                          * 087DD
        D0=(5)  CONTEXT                          * 087E3
        A=DAT0  A                                * 087EA
        GOSUB   SUB_08503                        * 087ED
        A=DAT0  A                                * 087F1
        C=B     A                                * 087F4
        D1=C                                     * 087F6
        AD0EX                                    * 087F9
        C=C-A   A                                * 087FC
        P=      4                                * 087FE
        C+P+1                                    * 08800
        P=      0                                * 08803
        AD0EX                                    * 08805
        DAT0=C  A                                * 08808
        CD0EX                                    * 0880B
        ?A=0    A                                * 0880E
        GOYES   L_08817                          * 08811
        A=A+C   A                                * 08813
        A=B-A   A                                * 08815
L_08817:
        DAT1=A  A                                * 08817
        D1=D1+  5                                * 0881A
        D0=(5)  DSKTOP                           * 0881D
        A=DAT0  A                                * 08824
        AD0EX                                    * 08827
        C=DAT0  A                                * 0882A
        B=C     A                                * 0882D
        D0=D0+  5                                * 0882F
        C=DAT0  A                                * 08832
        D0=D0+  5                                * 08835
        AD0EX                                    * 08838
        DAT0=A  A                                * 0883B
        D0=(5)  AVMEM                            * 0883E
        A=DAT0  A                                * 08845
        A=A+1   A                                * 08848
        A=A+1   A                                * 0884A
        DAT0=A  A                                * 0884C
        BCEX    A                                * 0884F
        D0=C                                     * 08851
        D0=D0+  5                                * 08854
        C=0     A                                * 08857
        C=DAT0  B                                * 08859
        D=C     B                                * 0885C
        C=C+1   A                                * 0885F
        C=C+C   A                                * 08861
        GOSUBL  MOVEDOWN                         * 08863
        ?D=0    B                                * 08869
        GOYES   L_08877                          * 0886C
        C=D     B                                * 0886E
        DAT1=C  B                                * 08871
        D1=D1+  2                                * 08874
L_08877:
        ?ST=1   8                                * 08877
        GOYES   L_088AD                          * 0887A
        A=B     A                                * 0887C
        D0=A                                     * 0887E
        C=R3                                     * 08881
L_08884:
        GOSUBL  MOVEDOWN                         * 08884
L_0888A:
        ?ST=0   2                                * 0888A
        GOYES   L_0889D                          * 0888D
        D0=(5)  INITEN                           * 0888F
        LC(1)   #F                               * 08896
        DAT0=C  1                                * 08899
L_0889D:
        GOSUBL  GETPTR                           * 0889D
        A=DAT0  A                                * 088A3
        D0=D0+  5                                * 088A6
        PC=(A)                                   * 088A9
L_088AD:
        CD1EX                                    * 088AD
        R1=C                                     * 088B0
        A=B     A                                * 088B3
        C=0     A                                * 088B5
        C=C+1   A                                * 088B7
        GOSUBL  MOVERSD                          * 088B9
        A=B     A                                * 088BF
        D0=A                                     * 088C1
        GOSUBL  SKIPOB                           * 088C4
        AD0EX                                    * 088CA
        R2=A                                     * 088CD
        LC(5)   #00005                           * 088D0
        A=A+C   A                                * 088D7
        GOSUBL  MOVERSD                          * 088D9
        C=R3                                     * 088DF
        D=C     A                                * 088E2
        C=R1                                     * 088E4
        B=C     A                                * 088E7
        A=R2                                     * 088E9
        C=C-A   A                                * 088EC
        D0=C                                     * 088EE
        R1=A                                     * 088F1
        C=D     A                                * 088F4
        A=A-C   A                                * 088F6
        R0=A                                     * 088F8
        A=A+C   A                                * 088FB
        C=-C    A                                * 088FD
        GOSUBL  SUB_0686E                        * 088FF
        A=B     A                                * 08905
        R1=A                                     * 08907
        C=D     A                                * 0890A
        C=-C    A                                * 0890C
        R0=C                                     * 0890E
        D1=(5)  RSKTOP                           * 08911
        A=DAT1  A                                * 08918
        A=A+C   A                                * 0891B
        DAT1=A  A                                * 0891D
        B=A     A                                * 08920
        D1=(5)  DSKTOP                           * 08922
        A=DAT1  A                                * 08929
        A=A+C   A                                * 0892C
        DAT1=A  A                                * 0892E
        A=A-B   A                                * 08931
        R4=A                                     * 08933
        ST=0    0                                * 08936
L_08939:
        C=R4                                     * 08939
        A=R3                                     * 0893C
        A=A-C   A                                * 0893F
        R3=A                                     * 08941
        GONC    L_08955                          * 08944
        C=C+A   A                                * 08947
        ?C#0    A                                * 08949
        GOYES   L_08952                          * 0894C
        GOTO    L_089D4                          * 0894E
L_08952:
        ST=1    0                                * 08952
L_08955:
        R0=C                                     * 08955
        D1=(5)  DSKTOP                           * 08958
        A=DAT1  A                                * 0895F
        D0=A                                     * 08962
        C=R0                                     * 08965
        A=A-C   A                                * 08968
        DAT1=A  A                                * 0896A
        D1=A                                     * 0896D
        A=R1                                     * 08970
        A=A-C   A                                * 08973
        R1=A                                     * 08975
        CD1EX                                    * 08978
        D1=C                                     * 0897B
        C=A-C   A                                * 0897E
        GOSUBL  MOVEDOWN                         * 08980
        A=R2                                     * 08986
        D0=A                                     * 08989
        C=R0                                     * 0898C
        A=R1                                     * 0898F
        A=A+C   A                                * 08992
        D1=A                                     * 08994
        GOSUBL  MOVEUP                           * 08997
        A=R2                                     * 0899D
        D0=A                                     * 089A0
        C=R0                                     * 089A3
        A=A-C   A                                * 089A6
        R2=A                                     * 089A8
        B=A     A                                * 089AB
        D1=(5)  RSKTOP                           * 089AD
        A=DAT1  A                                * 089B4
        A=A-C   A                                * 089B7
        DAT1=A  A                                * 089B9
        A=A-B   A                                * 089BC
        ABEX    A                                * 089BE
        D1=A                                     * 089C0
        C=B     A                                * 089C3
        GOSUBL  MOVEDOWN                         * 089C5
        ?ST=1   0                                * 089CB
        GOYES   L_089D4                          * 089CE
        GOTO    L_08939                          * 089D0
L_089D4:
        GOTO    L_0888A                          * 089D4

* refs (1): 08C5E
purge(_)~1:
        CON(5)  (*)+5                            * 089D8  primitive code object
        A=DAT1  A                                * 089DD
        D1=D1+  5                                * 089E0
        D=D+1   A                                * 089E3
        ST=0    7                                * 089E5
        LC(5)   FALSE                            * 089E8
        ?C=A    A                                * 089EF
        GOYES   L_08A02                          * 089F2
        ST=1    7                                * 089F4
        GONC    L_08A02                          * 089F7

        CON(5)  (*)+5                            * 089FA  primitive code object
        ST=0    7                                * 089FF
L_08A02:
        A=DAT1  A                                * 08A02
        D1=D1+  5                                * 08A05
        D=D+1   A                                * 08A08
        GOSUBL  SAVPTR                           * 08A0A
        R4=A                                     * 08A10
        D0=A                                     * 08A13
        GOSUBL  SKIPOB                           * 08A16
        D0=D0+  5                                * 08A1C
        CD0EX                                    * 08A1F
        RSTK=C                                   * 08A22
        A=R4                                     * 08A24
        GOSUB   GETRRP                           * 08A27
        D0=A                                     * 08A2B
        R3=C                                     * 08A2E
        A=B     A                                * 08A31
        R2=A                                     * 08A33
        C=RSTK                                   * 08A36
        C=C-A   A                                * 08A38
        ST=0    5                                * 08A3A
        GOSUB   SUB_0852C                        * 08A3D
        A=R3                                     * 08A41
        D0=A                                     * 08A44
        C=DAT0  A                                * 08A47
        C=C+A   A                                * 08A4A
        A=R2                                     * 08A4C
        D1=A                                     * 08A4F
        D1=D1-  5                                * 08A52
        ?C#A    A                                * 08A55
        GOYES   L_08A72                          * 08A58
        C=DAT1  A                                * 08A5A
        ?C=0    A                                * 08A5D
        GOYES   L_08A90                          * 08A60
        AD1EX                                    * 08A62
        D1=A                                     * 08A65
        C=A-C   A                                * 08A68
        A=R3                                     * 08A6A
        C=C-A   A                                * 08A6D
        GONC    L_08A90                          * 08A6F
L_08A72:
        A=DAT1  A                                * 08A72
        B=A     A                                * 08A75
        A=DAT0  A                                * 08A77
        C=R0                                     * 08A7A
        A=A-C   A                                * 08A7D
        DAT0=A  A                                * 08A7F
        A=R4                                     * 08A82
        D0=A                                     * 08A85
        GOSUBL  SKIPOB                           * 08A88
        C=B     A                                * 08A8E
L_08A90:
        DAT0=C  A                                * 08A90
        AD1EX                                    * 08A93
        ?ST=1   7                                * 08A96
        GOYES   L_08AA8                          * 08A99
L_08A9B:
        C=R0                                     * 08A9B
        GOSUBL  MOVEDSU                          * 08A9E
        GOTO    L_0888A                          * 08AA4
L_08AA8:
        C=R4                                     * 08AA8
        C=C-A   A                                * 08AAB
        AR0EX                                    * 08AAD
        A=A-C   A                                * 08AB0
        AR0EX                                    * 08AB2
        GOSUBL  MOVEDSU                          * 08AB5
        GOSUBL  GARBAGECOL                       * 08ABB  inline data follows
        C=R0                                     * 08AC1
        GOSUBL  CREATETEMP                       * 08AC4
        GOC     L_08AF2                          * 08ACA
        A=R4                                     * 08ACD
        C=R0                                     * 08AD0
        A=A+C   A                                * 08AD3
        D0=A                                     * 08AD5
        B=A     A                                * 08AD8
        GOSUBL  MOVEUP                           * 08ADA
        AD0EX                                    * 08AE0
        CD1EX                                    * 08AE3
        C=C-A   A                                * 08AE6
        GOSUBL  SUB_06863                        * 08AE8
        GOTO    L_08A9B                          * 08AEE
L_08AF2:
        D1=(5)  TEMPTOP                          * 08AF2
        C=DAT1  A                                * 08AF9
        D=C     A                                * 08AFC
        A=R4                                     * 08AFE
        R1=A                                     * 08B01
        C=C-A   A                                * 08B04
        DCEX    A                                * 08B06
        CR0EX                                    * 08B08
        D0=C                                     * 08B0B
        C=C+A   A                                * 08B0E
        B=C     A                                * 08B10
        C=D     A                                * 08B12
        GOSUBL  SUB_0686E                        * 08B14
        CD0EX                                    * 08B1A
        B=C     A                                * 08B1D
        R1=C                                     * 08B1F
        CR0EX                                    * 08B22
        D1=(5)  TEMPTOP                          * 08B25
        DAT1=C  A                                * 08B2C
        D1=(5)  RSKTOP                           * 08B2F
        A=DAT1  A                                * 08B36
        A=A-B   A                                * 08B39
        DAT1=A  A                                * 08B3B
        D1=(5)  DSKTOP                           * 08B3E
        A=DAT1  A                                * 08B45
        A=A-B   A                                * 08B48
        DAT1=A  A                                * 08B4A
        ST=0    0                                * 08B4D
        GOSUBL  ROOM                             * 08B50
        R3=C                                     * 08B56
L_08B59:
        C=R3                                     * 08B59
        A=R0                                     * 08B5C
        A=A-C   A                                * 08B5F
        R0=A                                     * 08B61
        GONC    L_08B71                          * 08B64
        C=C+A   A                                * 08B67
        ?C=0    A                                * 08B69
        GOYES   L_08BBC                          * 08B6C
        ST=1    0                                * 08B6E
L_08B71:
        R3=C                                     * 08B71
        GOSUB   SUB_08BF3                        * 08B74
        A=R4                                     * 08B78
        D0=A                                     * 08B7B
        C=R3                                     * 08B7E
        A=R2                                     * 08B81
        D1=A                                     * 08B84
        GOSUBL  MOVEDOWN                         * 08B87
        A=R4                                     * 08B8D
        D0=A                                     * 08B90
        C=R3                                     * 08B93
        B=C     A                                * 08B96
        A=A+C   A                                * 08B98
        R4=A                                     * 08B9A
        D1=(5)  DSKTOP                           * 08B9D
        C=DAT1  A                                * 08BA4
        C=C+B   A                                * 08BA7
        DAT1=C  A                                * 08BA9
        D1=A                                     * 08BAC
        C=A-C   A                                * 08BAF
        GOSUBL  MOVEUP                           * 08BB1
        ?ST=0   0                                * 08BB7
        GOYES   L_08B59                          * 08BBA
L_08BBC:
        LC(5)   #00005                           * 08BBC
        R3=C                                     * 08BC3
        GOSUB   SUB_08BF6                        * 08BC6
        A=R1                                     * 08BCA
        LC(5)   #00006                           * 08BCD
        A=A+C   A                                * 08BD4
        DAT0=A  A                                * 08BD6
        A=A-C   A                                * 08BD9
        CD0EX                                    * 08BDB
        C=C-A   A                                * 08BDE
        A=C     A                                * 08BE0
        LC(5)   #00001                           * 08BE2
        GOSUBL  MOVERSU                          * 08BE9
        GOTO    L_0888A                          * 08BEF

* refs (1): 08B74
SUB_08BF3:
        C=R3                                     * 08BF3

* refs (1): 08BC6
SUB_08BF6:
        B=C     A                                * 08BF6
        D1=(5)  RSKTOP                           * 08BF8
        A=DAT1  A                                * 08BFF
        D0=A                                     * 08C02
        A=A+C   A                                * 08C05
        DAT1=A  A                                * 08C07
        D1=(5)  TEMPTOP                          * 08C0A
        C=DAT1  A                                * 08C11
        R2=C                                     * 08C14
        C=C+B   A                                * 08C17
        DAT1=C  A                                * 08C19
        D1=A                                     * 08C1C
        C=A-C   A                                * 08C1F
        GOLONG  MOVEUP                           * 08C21
        RPL

* id ->
* refs (7): 1858B 21051 4BC24 64096 9C63C CF0F0 ...
PURGE:
        :: DRPExitAtLOOP ' purge(_) COLA RPIT    * 08C27
        ;                                        * 08C45

* refs (6): 08C36 097E3 1810A 1811E 210EB 72ABE
purge(_):
        :: OBJ_079D7 REFERENCED? COLA purge(_)~1 * 08C4A
        ;                                        * 08C63

* refs (1): 07D95
OBJ_08C68:
        :: DUP@ '                                * 08C68
          :: SWAPDROP OBJ_079D7 REFERENCED? '    * 08C77
            :: TOTEMPOBADJ SWAPDROP ; RPIT REPLACE * 08C90
            DROP ;                               * 08CAE
          ' CREATE COLARPITE ;                   * 08CB8

* ROMPTR -> #lib #cmd
* refs (2): 16194 4161F
ROMPTR>#:
        CON(5)  (*)+5                            * 08CCC  primitive code object
        ASSEMBLE
        A=DAT1  A                                * 08CD1
        D1=D1+  5                                * 08CD4
        D=D+1   A                                * 08CD7
        GOSUBL  SAVPTR                           * 08CD9
        D0=A                                     * 08CDF
        D0=D0+  5                                * 08CE2
        A=0     A                                * 08CE5
        A=DAT0  X                                * 08CE7
        R0=A                                     * 08CEB
        D0=D0+  3                                * 08CEE
        A=DAT0  X                                * 08CF1
        R1=A                                     * 08CF5
        GOSUBL  PUSH2#                           * 08CF8
        A=DAT0  A                                * 08CFE
        D0=D0+  5                                * 08D01
        PC=(A)                                   * 08D04

* rrp ->
* refs (15): 02FC9 18164 181E1 1A183 20C9E 2EA22 ...
CONTEXT!:
        CON(5)  (*)+5                            * 08D08  primitive code object
        LC(5)   CONTEXT                          * 08D0D
L_08D14:
        A=DAT1  A                                * 08D14
        D1=D1+  5                                * 08D17
        D=D+1   A                                * 08D1A
L_08D1C:
        CD0EX                                    * 08D1C
        DAT0=A  A                                * 08D1F
        D0=C                                     * 08D22
        A=DAT0  A                                * 08D25
        D0=D0+  5                                * 08D28
        PC=(A)                                   * 08D2B
L_08D2F:
        A=0     A                                * 08D2F
        GOTO    L_08D1C                          * 08D31
L_08D35:
        CD0EX                                    * 08D35
        A=DAT0  A                                * 08D38
        D0=C                                     * 08D3B
        ?A=0    A                                * 08D3E
        GOYES   L_08D43                          * 08D41
L_08D43:
        GOVLNG  PushT/FLoop                      * 08D43

* rrp ->
* refs (3): 185D6 640F0 6411D
STOPSIGN!:
        CON(5)  (*)+5                            * 08D4A  primitive code object
        LC(5)   STOPSIGN                         * 08D4F
        GOTO    L_08D14                          * 08D56

* -> rrp
* refs (27): 0975C 17E57 18141 18496 185D1 18689 ...
CONTEXT@:
        CON(5)  (*)+5                            * 08D5A  primitive code object
        LC(5)   CONTEXT                          * 08D5F

* refs (10): 08D8E 38CB7 40A8E 41A2B 41F4B 424AD ...
SysPtr@:
        CD0EX                                    * 08D66
        A=DAT0  A                                * 08D69
        D0=C                                     * 08D6C
        GOLONG  DOBINT                           * 08D6F

* refs (1): 41A32
PC=((C)):
        CD0EX                                    * 08D75
        A=DAT0  A                                * 08D78
        D0=C                                     * 08D7B
        PC=(A)                                   * 08D7E

* -> rrp
* refs (2): 09770 640AA
STOPSIGN@:
        CON(5)  (*)+5                            * 08D82  primitive code object
        LC(5)   STOPSIGN                         * 08D87
        GOTO    SysPtr@                          * 08D8E

* ->
* refs (11): 09766 17C1C 17C88 1A14A 20C8F 2EA04 ...
HOMEDIR:
        CON(5)  (*)+5                            * 08D92  primitive code object
        LC(5)   CONTEXT                          * 08D97
L_08D9E:
        AD0EX                                    * 08D9E
        R0=A                                     * 08DA1
        D0=(5)  USEROB                           * 08DA4
        A=DAT0  A                                * 08DAB
        CD0EX                                    * 08DAE
        DAT0=A  A                                * 08DB1
        A=R0                                     * 08DB4
        D0=A                                     * 08DB7
        A=DAT0  A                                * 08DBA
        D0=D0+  5                                * 08DBD
        PC=(A)                                   * 08DC0

* ->
* refs (5): 0977A 185EF 185FE 64104 72AE1
SYSSTOPSIGN:
        CON(5)  (*)+5                            * 08DC4  primitive code object
        LC(5)   STOPSIGN                         * 08DC9
        GOTO    L_08D9E                          * 08DD0

* rrp -> flag
* refs (5): 1814B 21110 21C7E 21CF4 B99B8
SYSRRP?:
        CON(5)  (*)+5                            * 08DD4  primitive code object
        AD0EX                                    * 08DD9
        D0=(5)  USEROB                           * 08DDC
        C=DAT0  A                                * 08DE3
        D0=A                                     * 08DE6
        A=DAT1  A                                * 08DE9
        GOLONG  L_03B01                          * 08DEC
        RPL

* id ->
* refs (1): 184F0
CREATERRP:
        :: # 7FF MAKERRP SWAP CREATE ;           * 08DF2

* refs (1): 021F1
RclKnownLibs:
        :: NULL{} BINT0 BEGIN NEXTROMPID WHILE   * 08E15
          :: DUPUNROT >TCOMP SWAP#1+ ; REPEAT ;  * 08E33

* refs (2): 08FF8 093E8
dup2;idem(nm,bk)?:
        CON(5)  dup2;idem(nm,bk)?~1              * 08E56  code object: the address of its machine code
        ASSEMBLE
L_08E5B:
        D1=A                                     * 08E5B
        A=DAT1  A                                * 08E5E
        D1=D1+  10                               * 08E61
        LC(5)   DOLIB                            * 08E64
        A=A-C   A                                * 08E6B
        C=0     A                                * 08E6D
        C=DAT1  B                                * 08E6F
        ?C=0    A                                * 08E72
        GOYES   L_08E79                          * 08E75
        C=C+1   A                                * 08E77
L_08E79:
        C=C+1   A                                * 08E79
        C=C+C   A                                * 08E7B
        ?A=0    A                                * 08E7D
        GOYES   L_08E89                          * 08E80
        GOVLNG  L_71843                          * 08E82
L_08E89:
        AD1EX                                    * 08E89
        A=A+C   A                                * 08E8C
        D1=A                                     * 08E8E
        A=0     A                                * 08E91
        A=DAT1  X                                * 08E93
        C=R3.F  A                                * 08E97
        P=      1                                * 08E9D
        GOSUB   SUB_09277                        * 08E9F
        GOSBVL  GETPTR                           * 08EA3
        GONC    L_08EB3                          * 08EAA
L_08EAD:
        A=0     A                                * 08EAD
        A=DAT1  X                                * 08EAF
L_08EB3:
        R0=A.F  A                                * 08EB3
        C=RSTK                                   * 08EB9
        RSTK=C                                   * 08EBB
        D1=C                                     * 08EBD
        D1=D1+  5                                * 08EC0
        A=DAT1  A                                * 08EC3
        D1=A                                     * 08EC6
        A=DAT1  A                                * 08EC9
        LC(5)   DOBINT                           * 08ECC
        ?C#A    A                                * 08ED3
        GOYES   L_08F29                          * 08ED6
        D1=D1+  5                                * 08ED8
        C=DAT1  A                                * 08EDB
        A=R0.F  A                                * 08EDE
        ?C#A    A                                * 08EE4
        GOYES   L_08F29                          * 08EE7
L_08EE9:
        LC(5)   TRUE                             * 08EE9
L_08EF0:
        A=C     A                                * 08EF0
        C=RSTK                                   * 08EF2
        D1=C                                     * 08EF4
        PC=(A)                                   * 08EF7
L_08EFB:
        A=DAT1  B                                * 08EFB
        R0=A.F  B                                * 08EFE
        C=RSTK                                   * 08F04
        RSTK=C                                   * 08F06
        CD1EX                                    * 08F08
        R1=C.F  A                                * 08F0B
        D1=D1+  5                                * 08F11
        A=DAT1  A                                * 08F14
        D1=A                                     * 08F17
        A=DAT1  A                                * 08F1A
        LC(5)   DOBINT                           * 08F1D
        ?C#A    A                                * 08F24
        GOYES   L_08F34                          * 08F27
L_08F29:
        LC(5)   FALSE                            * 08F29
        GOTO    L_08EF0                          * 08F30
L_08F34:
        D1=D1+  5                                * 08F34
        C=DAT1  B                                * 08F37
        A=R0.F  B                                * 08F3A
        ?C#A    B                                * 08F40
        GOYES   L_08F29                          * 08F43
        C=RSTK                                   * 08F45
        CD1EX                                    * 08F47
        RSTK=C                                   * 08F4A
        GOSBVL  SAVPTR                           * 08F4C
        C=RSTK                                   * 08F53
        D1=C                                     * 08F55
        A=R1.F  A                                * 08F58
        D0=A                                     * 08F5E
        GOSUBL  SUB_07831                        * 08F61
        A=0     B                                * 08F67
        GONC    L_08F70                          * 08F6A
        A=A+1   B                                * 08F6D
L_08F70:
        GOSBVL  GETPTR                           * 08F70
        CD1EX                                    * 08F77
        RSTK=C                                   * 08F7A
        ?A#0    B                                * 08F7C
        GOYES   L_08F29                          * 08F7F
        GOTO    L_08EE9                          * 08F81
        RPL

* refs (2): 215B5 21A85
sto12(bk,nm,s):
        :: ROT ?>ROMPTR 3UNROLL OVER dvarlsBIND DUP4UNROLL * 08F85

* refs (1): 09410
PurgeBkp12(nm,s)~1:
          :: PORTSTATUS 5UNROLL 5UNROLL NOTAND ANDNOTcase SETPORTNOTAV * 08FA8
            ROTOVER ;                            * 08FCB
          BEGIN DUP NEXTLIBBAK WHILE             * 08FD5
          :: ROTDROP 3UNROLL dup2;idem(nm,bk)? case SETOBINUSE * 08FE9
            DROPSWAP ;                           * 09007
          REPEAT sto12(bk,nm,s)~2 #5+ SWAP       * 09011
          :: DNOTBAKcase                         * 09025
            :: DNOTLIBcase                       * 0902F
              :: SWAP 1GETLAM OSIZE              * 09039

dup;=7(s)?:BAT!:
                :: BINT7 #=casedrop SETTYPEERR   * 0904D
                ;                                * 09061
                #+ BINT17 #+ ;                   * 09066
              SWAP ;                             * 0907A
            SWAP ;                               * 09084
          ROTOVER #<case SETNOROOM               * 0908E
          ROTSWAP 4ROLL 1GETABND 5UNROLL sto12(bk,nm,s)~1 ; * 0909D
        NIBHEX  000                              * 090BB  .

* refs (1): 090B1
sto12(bk,nm,s)~1:
        CON(5)  sto12(bk,nm,s)~1~1               * 090BE  code object: the address of its machine code
        ASSEMBLE
L_090C3:
        C=R3.F  A                                * 090C3
        C=C-CON A,5                              * 090C9
        GOSBVL  SUB_718E5                        * 090CF
        C=R2.F  A                                * 090D6
        ?C=0    A                                * 090DC
        GOYES   L_090E9                          * 090DF
        GOVLNG  L_7DFE4                          * 090E1
        NIBHEX  0                                * 090E8
L_090E9:
        DAT1=C  A                                * 090E9
L_090EC:
        A=R4.F  A                                * 090EC
        C=A     A                                * 090F2
        A=A+A   A                                * 090F4
        A=A+A   A                                * 090F6
        A=A+C   A                                * 090F8
        LC(5)   PORT0EOS                         * 090FA
        C=C+A   A                                * 09101
        CD1EX                                    * 09103
        DAT1=C  A                                * 09106
        GOVLNG  GETPTRLOOP                       * 09109
L_09110:
        CD1EX                                    * 09110
        R0=C.F  A                                * 09113
        GOSBVL  CSLW5                            * 09119
        C=R3.F  A                                * 09120
        R3=C                                     * 09126
        D1=(5)  IRAMBUFF                         * 09129
        LC(5)   DOBAK                            * 09130
        DAT1=C  A                                * 09137
        C=R3.F  A                                * 0913A
        C=C-CON A,10                             * 09140
        D1=D1+  5                                * 09146
        DAT1=C  A                                * 09149
        D1=D1+  5                                * 0914C
        C=C-CON A,15                             * 0914F
        B=C     A                                * 09155
        CD0EX                                    * 09157
        RSTK=C                                   * 0915A
        D0=(5)  DSKTOP                           * 0915C
        A=DAT0  A                                * 09163
        D0=A                                     * 09166
        D0=D0-  5                                * 09169
        A=DAT0  A                                * 0916C
        D0=A                                     * 0916F
        D0=D0+  5                                * 09172
        C=0     A                                * 09175
        C=DAT0  B                                * 09177
        DAT1=C  B                                * 0917A
        D=C     A                                * 0917D
        C=C+C   A                                * 0917F
        D0=D0+  2                                * 09181
        D1=D1+  2                                * 09184
        GOSBVL  MOVEDOWN                         * 09187
        C=D     A                                * 0918E
        DAT1=C  B                                * 09190
        D1=D1+  2                                * 09193
        C=C+1   A                                * 09196
        C=C+1   A                                * 09198
        C=C+C   A                                * 0919A
        A=B     A                                * 0919C
        C=A-C   A                                * 0919E
        R3=C.F  A                                * 091A0
        LC(5)   IRAMBUFF                         * 091A6
        D0=C                                     * 091AD
        AD1EX                                    * 091B0
        C=A-C   A                                * 091B3
        A=R2.F  A                                * 091B5
        ?A#0    A                                * 091BB
        GOYES   L_091D4                          * 091BE
        A=R0.F  A                                * 091C0
        D1=A                                     * 091C6
        GOSBVL  MOVEDOWN                         * 091C9
        GOTO    L_09201                          * 091D0
L_091D4:
        CAEX    A                                * 091D4
        AD0EX                                    * 091D6
        R1=A.F  A                                * 091D9
        AD0EX                                    * 091DF
        GOSUB   SUB_09277                        * 091E2
        P=      2                                * 091E6
        C=0     S                                * 091E8
        C=C+1   S                                * 091EB
        C=R2.F  A                                * 091EE
        GOSUB   SUB_09277                        * 091F4
        C=R0.F  A                                * 091F8
        D1=C                                     * 091FE
L_09201:
        C=RSTK                                   * 09201
        D0=C                                     * 09203
        C=R3.F  A                                * 09206
        GOSBVL  SUB_718E5                        * 0920C
        C=R2.F  A                                * 09213
        ?C=0    A                                * 09219
        GOYES   L_09222                          * 0921C
        GOSUB   SUB_09277                        * 0921E
L_09222:
        LC(5)   DOBINT                           * 09222
        DAT1=C  A                                * 09229
        D1=D1+  5                                * 0922C
        C=0     W                                * 0922F
        DAT1=C  10                               * 09232
        CD1EX                                    * 09236
        A=C     A                                * 09239
        CR3EX                                    * 0923B
        GOSBVL  CSRW5                            * 0923E
        D0=C                                     * 09245
        GOSBVL  CKLBCRC                          * 09248
        C=R3.F  A                                * 0924F
        D1=C                                     * 09255
        D1=D1+  1                                * 09258
        DAT1=A  4                                * 0925B
        D1=D1+  4                                * 0925F
L_09262:
        C=R2.F  A                                * 09262
        ?C=0    A                                * 09268
        GOYES   L_09273                          * 0926B
        P=      1                                * 0926D
        GOSUB   SUB_09277                        * 0926F
L_09273:
        GOTO    L_090EC                          * 09273

* refs (5): 08E9F 091E2 091F4 0921E 0926F
SUB_09277:
        RSTK=C                                   * 09277
        RTN                                      * 09279
        RPL

* refs (1): 215B0
sto0(bk,nm):
        :: RclBkp0(nm)? case SETOBINUSE          * 0927B
          sto0!(bk) ;                            * 0928F

* refs (3): 21A62 21B11 85810
RclBkp12(nm,s)?:
        :: PORTSTATUS 5UNROLL 5UNROLL NOT ROTAND NOTcase SETPORTNOTAV * 09299
          ROTDROP ROTDUP TYPEBINT? ROT NOTAND case SETPORTNOTAV * 092C1
          SWAPCOLA RclBkp(nm,adr)? ;             * 092E4

* refs (6): 09280 0945B 21AC1 21B0C 21B9D 85806
RclBkp0(nm)?:
        :: AdrPort0 RclBkp(nm,adr)? NOTcaseFALSE ?ACCPTR> * 092F3
          TRUE ;                                 * 0930C

* refs (4): 092F8 09334 17E6B 21936
AdrPort0:
        CON(5)  AdrPort0~1                       * 09316  code object: the address of its machine code

* refs (3): 858E2 859F8 85B1C
X@:
        :: DUP#0= ITE                            * 0931B
          :: DROP AdrPort0 TRUE ;                * 0932A
          :: PORTSTATUS SWAPDROP ROTDROP 3UNROLL NOTAND ; * 09343
          NOTcsdrpfls OVERSWAP OVER TYPELIST? NOTcase RclBkp(nm,adr)? * 09366
          SWAP CARCOMP SWAP RclBkp(nm,adr)? NOTcaseFALSE OVER * 09384
          LENCOMP #1= caseTRUE BAK>OB            * 093A2
          ?ROMPTR> DUPTYPERRP? NOTcsdrpfls OVER rcl(di,li)? ; * 093B6

* refs (7): 092E9 092FD 0937F 09393 09401 09415 ...
RclBkp(nm,adr)?:
        :: NEXTLIBBAK NOTcsdrpfls 3UNROLL dup2;idem(nm,bk)? case XYZ>ZTRUE * 093D4
          DROPSWAP COLA RclBkp(nm,adr)?          * 093F7
        ;                                        * 09406

* refs (1): 85AA7
PurgeBkp12(nm,s):
        :: PurgeBkp12(nm,s)~1 RclBkp(nm,adr)? NOTcase2DROP * 0940B

* refs (1): 09465
PurgeBkp0(nm)~1:
          :: PurgeBkp12(nm,s)~4 SWAP PurgeBkp12(nm,s)~3 ROT OR case * 0941F
            SETOBINUSE                           * 09442
          ;                                      * 09447
          PurgeBkp12(nm,s)~2 ;                   * 0944C

* refs (1): 85A9D
PurgeBkp0(nm):
        :: RclBkp0(nm)? NOT?SEMI                 * 09456
          PurgeBkp0(nm)~1 purge(bk,s) ;          * 09465
        ASSEMBLE

* refs (2): 09493 71AC0
SUB_09474:
        C=DAT1  A                                * 09474

* refs (1): 71AFF
SUB_09477:
        CD0EX                                    * 09477
        RSTK=C                                   * 0947A
        D0=D0+  10                               * 0947C
        GOSUBL  SUB_08400                        * 0947F
        C=RSTK                                   * 09485
        CD0EX                                    * 09487
        A=C     A                                * 0948A
        RTN                                      * 0948C

* bak -> ob
* refs (3): 093B1 85519 85537
BAK>OB:
        CON(5)  BAK>OB~1                         * 0948E  code object: the address of its machine code
L_09493:
        GOSUB   SUB_09474                        * 09493
        DAT1=A  A                                * 09497
        A=DAT0  A                                * 0949A
        D0=D0+  5                                * 0949D
        PC=(A)                                   * 094A0

* refs (3): 21A76 21AD0 855C9
HomeInBkp(nm):
        CON(5)  (*)+5                            * 094A4  primitive code object
        A=DAT1  A                                * 094A9
        AD1EX                                    * 094AC
        D1=D1+  5                                * 094AF
        C=0     A                                * 094B2
        C=DAT1  B                                * 094B4
        C=C+C   A                                * 094B7
        RSTK=C                                   * 094B9
        D1=A                                     * 094BB
        GOSBVL  SAVPTR                           * 094BE
        ST=0    1                                * 094C5
        GOSBVL  ROOM                             * 094C8
        A=C     A                                * 094CF
        LC(5)   #00036                           * 094D1
        A=A-C   A                                * 094D8
        GOC     L_094E6                          * 094DA
        C=RSTK                                   * 094DD
        RSTK=C                                   * 094DF
        A=A-C   A                                * 094E1
        GONC    L_09507                          * 094E3
L_094E6:
        ?ST=1   1                                * 094E6
        GOYES   L_094F9                          * 094E9
        GOSBVL  GARBAGECOL                       * 094EB  inline data follows
        NIBHEX  85162DF                          * 094F2  XaÒ
L_094F9:
        GOSBVL  GETPTR                           * 094F9
        GOVLNG  DOMEMERR                         * 09500
L_09507:
        C=0     B                                * 09507
        D1=(5)  INITEN                           * 0950A
        DAT1=C  1                                * 09511
        GOSUB   SUB_0966F                        * 09515
        LC(5)   #00022                           * 09519
        B=C     A                                * 09520
        C=RSTK                                   * 09522
        RSTK=C                                   * 09524
        C=C+B   A                                * 09526
        GOSBVL  MOVEDSD                          * 09528
        A=B     A                                * 0952F
        R0=A.F  A                                * 09531
        D1=A                                     * 09537
        D0=(5)  L_0964D                          * 0953A
        LC(5)   #00016                           * 09541
        GOSBVL  MOVEDOWN                         * 09548
        C=RSTK                                   * 0954F
        RSTK=C                                   * 09551
        CSRB.F  A                                * 09553
        DAT1=C  B                                * 09558
        D1=D1+  2                                * 0955B
        D0=(5)  DSKTOP                           * 0955E
        A=DAT0  A                                * 09565
        D0=A                                     * 09568
        A=DAT0  A                                * 0956B
        D0=A                                     * 0956E
        D0=D0+  7                                * 09571
        C=C+C   A                                * 09574
        GOSBVL  MOVEDOWN                         * 09576
        C=RSTK                                   * 0957D
        CSRB.F  A                                * 0957F
        DAT1=C  B                                * 09584
        D1=D1+  2                                * 09587
        D0=(5)  L_09667                          * 0958A
        LC(5)   #00008                           * 09591
        GOSBVL  MOVEDOWN                         * 09598
        C=DAT1  A                                * 0959F
        ?C#0    A                                * 095A2
        GOYES   L_095B0                          * 095A5
        D1=D1+  5                                * 095A7
        AD1EX                                    * 095AA
        GONC    L_095C8                          * 095AD
L_095B0:
        AD1EX                                    * 095B0
        A=A+C   A                                * 095B3
        D0=A                                     * 095B5
        GOSUBL  SUB_08400                        * 095B8
        GOSBVL  SKIPOB                           * 095BE
        AD0EX                                    * 095C5
L_095C8:
        LC(5)   portnotaverr                     * 095C8
        GOSBVL  MOVEDSD                          * 095CF
        A=B     A                                * 095D6
        R1=A.F  A                                * 095D8
        D1=A                                     * 095DE
        LC(5)   DOBINT                           * 095E1
        DAT1=C  A                                * 095E8
        C=0     A                                * 095EB
        D1=D1+  5                                * 095ED
        DAT1=C  A                                * 095F0
        D1=D1+  5                                * 095F3
        A=R0.F  A                                * 095F6
        LC(5)   #00007                           * 095FC
        A=A+C   A                                * 09603
        D0=A                                     * 09605
        CD1EX                                    * 09608
        C=C-A   A                                * 0960B
        DAT0=C  A                                * 0960D
        D0=A                                     * 09610
        D0=D0-  5                                * 09613
        GOSBVL  CKLBCRC                          * 09616
        CR1EX.F A                                * 0961D
        D0=C                                     * 09623
        D0=D0+  6                                * 09626
        DAT0=A  4                                * 09629
        GOSBVL  GETPTR                           * 0962D
        C=R1.F  A                                * 09634
        C=C-CON A,5                              * 0963A
        DAT1=C  A                                * 09640
        A=DAT0  A                                * 09643
        D0=D0+  5                                * 09646
        PC=(A)                                   * 09649

* HomeInBkp(nm) (ARCHIVE's backup of HOME): 22 nibbles copied with MOVEDOWN. The backup object starts at +12 (DOBAK); its length at +17 is filled in at the end through R0+7, R0 being the template's address before MOVEDSD moved the block down 10 nibbles. The backup then gets the name, the directory and a DOBINT holding its CRC. The first 12 nibbles precede the object and are not read here (probably temporary-object bookkeeping); the 4 nibbles after the template are never copied
L_0964D:
        CON(5)  #0000A                           * 0964D  entry 0
        CON(5)  #00000                           * 09652
        CON(2)  #00                              * 09657
        CON(5)  DOBAK                            * 09659
        CON(5)  #00000                           * 0965E
        NIBHEX  4040                             * 09663  ..

* HomeInBkp(nm): a directory with no libraries (DORRP, #7FF), copied after the name
L_09667:
        CON(5)  DORRP                            * 09667  entry 0
        CON(3)  #7FF                             * 0966C

* refs (2): 09515 096A5
SUB_0966F:
        D1=(5)  USEROB                           * 0966F
        C=DAT1  A                                * 09676
        D1=C                                     * 09679
        D1=D1+  5                                * 0967C
        C=0     A                                * 0967F
        C=DAT1  X                                * 09681
        A=C     A                                * 09685
        CSL     A                                * 09687
        C=C-A   A                                * 09689
        C=C-A   A                                * 0968B
        C=C-A   A                                * 0968D
        D1=D1+  3                                * 0968F
        AD1EX                                    * 09692
        A=A+C   A                                * 09695
        RTN                                      * 09697

* refs (6): 21A94 21AA8 21AE9 85573 855F6 8561E
OBJ_09699:
        CON(5)  (*)+5                            * 09699  primitive code object
        GOSBVL  SAVPTR                           * 0969E
        GOSUB   SUB_0966F                        * 096A5
        R0=A.F  A                                * 096A9
        D0=A                                     * 096AF
        D0=D0+  10                               * 096B2
        GOSUBL  SUB_08400                        * 096B5
        D0=D0+  5                                * 096BB
        C=DAT0  A                                * 096BE
        AD0EX                                    * 096C1
        C=C+A   A                                * 096C4
        D0=A                                     * 096C6
        R1=C.F  A                                * 096C9
        D0=D0+  5                                * 096CF
        GOSUBL  SUB_08400                        * 096D2
        D0=D0+  8                                * 096D8
        A=R0.F  A                                * 096DB
        CD0EX                                    * 096E1
        C=C-A   A                                * 096E4
        GOSBVL  MOVEDSU                          * 096E6
        A=R1.F  A                                * 096ED
        LC(5)   portnotaverr                     * 096F3
        A=A-C   A                                * 096FA
        GOSBVL  MOVEDSU                          * 096FC
        GOVLNG  GETPTRLOOP                       * 09703

* refs (7): 041C0 21A99 21AAD 21AEE 40BD3 85600 ...
InitEnab:
        CON(5)  (*)+5                            * 0970A  primitive code object
        C=0     S                                * 0970F
        C=C-1   S                                * 09712
        LC(5)   INITEN                           * 09715
        CD1EX                                    * 0971C
        DAT1=C  S                                * 0971F
L_09723:
        D1=C                                     * 09723
        A=DAT0  A                                * 09726
        D0=D0+  5                                * 09729
        PC=(A)                                   * 0972C

* refs (1): 85546
restore(nm,s)~1~1:
        CON(5)  (*)+5                            * 09730  primitive code object
        A=0     A                                * 09735
        LC(5)   UserKeys                         * 09737
        CD1EX                                    * 0973E
        DAT1=A  A                                * 09741
        D1=(5)  ALARMS                           * 09744
        DAT1=A  A                                * 0974B
        GOTO    L_09723                          * 0974E
        RPL

* refs (2): 185BD 72AB9
pgdir!(di):
        :: DUP CONTEXT@ EQIT HOMEDIR DUP STOPSIGN@ EQIT SYSSTOPSIGN PTRREFD? * 09752
          ITE                                    * 09784
          :: DUP TOTEMPOB FALSE ROT ;            * 09789

true;swap:
          :: TRUE SWAP ;                         * 097A7
          DUP OBJ_72A8C SWAP ?SKIP               * 097BB
          :: DOADJ1 SWAPDROP ;                   * 097CF
          purge(_) ;                             * 097E3
        NIBHEX  000                              * 097ED  .

* refs (3): 093CA 20C58 85862
rcl(di,li)?:
        :: INNERCOMP pullrev OVER #3+ ROLL BEGIN DUPTYPERRP? NOTcasedrop * 097F0
          drop;dropB;false                       * 0981D
          SWAPDROP SWAP get1 SWAP #1- SWAPROT LASTRAM-WORD NOTcase * 09822
          drop;dropB;false                       * 0984A
          DUP BEGIN DROP DUP RAM-WORDNAME 3PICK EQUAL ITE TrueTrue * 0984F
          :: PREVRAM-WORD DUP NOT ;              * 0987C
          UNTIL NOTcase drop;dropB;false         * 09895
          3PICK #0= UNTIL ROTROT2DROP TRUE ;     * 098A4

* refs (3): 0981D 0984A 0989F
drop;dropB;false:
        :: DROPRDROP NDROP FALSE ;               * 098C2
        ASSEMBLE

* refs (2): 02075 0421D
SUB_098DB:
        ST=0    3                                * 098DB
        ST=0    0                                * 098DE
        GOSUB   COMPCONFCRC                      * 098E1
        A=0     A                                * 098E5
        A=DAT0  4                                * 098E7
        ?C=A    A                                * 098EB
        GOYES   L_098F5                          * 098EE
        ST=1    3                                * 098F0
        RTN                                      * 098F3
L_098F5:
        LC(5)   #C0000                           * 098F5
        B=C     A                                * 098FC
        LC(5)   #7E000                           * 098FE
        A=C     A                                * 09905
        LC(5)   #7F000                           * 09907
        UNCNFG                                   * 0990E
        D0=D0+  5                                * 09911
        C=DAT0  S                                * 09914
        C=A     A                                * 09918
        ?C=0    S                                * 0991A
        GOYES   L_09921                          * 0991D
        C=B     A                                * 0991F
L_09921:
        UNCNFG                                   * 09921
        D0=D0+  2                                * 09924
        C=A     A                                * 09927
        C=DAT0  S                                * 09929
        ?C=0    S                                * 0992D
        GOYES   L_09934                          * 09930
        C=B     A                                * 09932
L_09934:
        UNCNFG                                   * 09934
        ST=1    4                                * 09937
        LA(3)   #005                             * 0993A
        LC(5)   #FF000                           * 09942
        GOSUB   SUB_099C0                        * 09949
        RTNC                                     * 0994D
        LA(3)   #0F6                             * 09950
        LC(5)   #7F000                           * 09958
        GOSUB   SUB_099C0                        * 0995F
        RTNC                                     * 09963
        LA(3)   #007                             * 09966
        LC(5)   #C0000                           * 0996E
        GOSUB   SUB_099C0                        * 09975
        RTNC                                     * 09979
        LA(3)   #0F8                             * 0997C
        LC(5)   #C0000                           * 09984
        GOSUB   SUB_099C0                        * 0998B
        RTNC                                     * 0998F
        LA(3)   #001                             * 09992
        LC(5)   #C0000                           * 0999A
        GOSUB   SUB_099C0                        * 099A1
        RTNC                                     * 099A5
        LA(3)   #0F2                             * 099A8
        LC(5)   #C0000                           * 099B0
        GOSUB   SUB_099C0                        * 099B7
        GONC    L_099D4                          * 099BB
        RTN                                      * 099BE

* refs (6): 09949 0995F 09975 0998B 099A1 099B7
SUB_099C0:
        B=C     A                                * 099C0
        C=0     X                                * 099C2
        C=ID                                     * 099C5
        ?C#A    X                                * 099C8
        RTNYES                                   * 099CB
        C=B     A                                * 099CD
        CONFIG                                   * 099CF
        RTNCC                                    * 099D2
L_099D4:
        ST=0    4                                * 099D4
        GOSUBL  SUB_09D50                        * 099D7
        D1=(5)  CONFRAM                          * 099DD
        D0=(5)  #0010F                           * 099E4
        C=DAT0  1                                * 099EB
        GOSUB   SUB_09B98                        * 099EF
        D1=D1+  2                                * 099F3
        LC(5)   #C0000                           * 099F6
        UNCNFG                                   * 099FD
        D0=(5)  #0010F                           * 09A00
        C=DAT0  1                                * 09A07
        C=C+C   P                                * 09A0B
        GOSUB   SUB_09B98                        * 09A0E
        D0=(5)  #8052F                           * 09A12
        D1=D1-  2                                * 09A19
        A=DAT0  B                                * 09A1C
        C=DAT1  B                                * 09A1F
        ?ABIT=0 1                                * 09A22
        GOYES   L_09A42                          * 09A27
        ABIT=0  1                                * 09A29
        ?C=A    B                                * 09A2E
        GOYES   L_09A45                          * 09A31
        LC(5)   #C0000                           * 09A33
        UNCNFG                                   * 09A3A
        ST=1    0                                * 09A3D
        RTNSC                                    * 09A40
L_09A42:
        DAT0=C  B                                * 09A42
L_09A45:
        GOVLNG  L_0CA3A                          * 09A45
L_09A4C:
        A=DAT0  A                                * 09A4C
        B=A     A                                * 09A4F
        D1=(5)  HRAMEND                          * 09A51
        C=0     A                                * 09A58
        P=      4                                * 09A5A
        C=DAT1  P                                * 09A5C
        P=      0                                * 09A60
        ?ABIT=0 1                                * 09A62
        GOYES   L_09A7E                          * 09A67
        LC(5)   #D0000                           * 09A69
        ?ABIT=0 5                                * 09A70
        GOYES   L_09A7E                          * 09A75
        LC(5)   #FFFFB                           * 09A77
L_09A7E:
        D1=(5)  RAMEND                           * 09A7E
        DAT1=C  A                                * 09A85
        A=C     A                                * 09A88
        C=B     A                                * 09A8A
        CPEX    1                                * 09A8C
        CPEX    15                               * 09A90
        A=C     S                                * 09A94
        CPEX    3                                * 09A97
        CPEX    15                               * 09A9B
        C=C+C   S                                * 09A9F
        C=C+C   S                                * 09AA2
        C=C+A   S                                * 09AA5
        P=      0                                * 09AA8
        ?C#0    S                                * 09AAA
        GOYES   L_09ABE                          * 09AAD
        LC(5)   #C0000                           * 09AAF
        ?C>A    A                                * 09AB6
        GOYES   L_09ABE                          * 09AB9
        C=C-1   S                                * 09ABB
L_09ABE:
        D0=D0+  6                                * 09ABE
        DAT0=C  S                                * 09AC1
        C=0     A                                * 09AC5
        ?C=0    S                                * 09AC7
        GOYES   L_09AD5                          * 09ACA
        C=C+1   S                                * 09ACC
        GOC     L_09AD5                          * 09ACF
        C=C+1   B                                * 09AD2
L_09AD5:
        GOSUB   L_09CFA                          * 09AD5
        C=0     S                                * 09AD9
        A=0     S                                * 09ADC
        A=B     A                                * 09ADF
        ?ABIT=1 13                               * 09AE1
        GOYES   L_09AF5                          * 09AE6
        ?ABIT=0 12                               * 09AE8
        GOYES   L_09AFB                          * 09AED
        C=C+1   S                                * 09AEF
        GONC    L_09AFB                          * 09AF2
L_09AF5:
        GOSUBL  SUB_09C05                        * 09AF5
L_09AFB:
        D0=(5)  #80533                           * 09AFB
        DAT0=C  S                                * 09B02
        D0=D0+  1                                * 09B06
        DAT0=A  S                                * 09B09
        GOSUB   COMPCONFCRC                      * 09B0D
        DAT0=C  4                                * 09B11
        LC(5)   #C0000                           * 09B15
        UNCNFG                                   * 09B1C
        D0=D0+  5                                * 09B1F
        GOSUB   SUB_09B26                        * 09B22

* refs (3): 09B22 0AD88 0AD8E
SUB_09B26:
        C=DAT0  S                                * 09B26
        C=C-1   S                                * 09B2A
        GOC     L_09B5A                          * 09B2D
        LC(5)   #C0000                           * 09B30
        A=C     A                                * 09B37
        LC(5)   #C0000                           * 09B39
        C=C-1   S                                * 09B40
        GONC    L_09B4D                          * 09B43
        LC(5)   #F0000                           * 09B46
L_09B4D:
        CONFIG                                   * 09B4D
        C=A     A                                * 09B50
        CONFIG                                   * 09B52
        D0=D0+  2                                * 09B55
        RTN                                      * 09B58
L_09B5A:
        LC(5)   #7E000                           * 09B5A
        A=C     A                                * 09B61
        LC(5)   #FF000                           * 09B63
        GOC     L_09B4D                          * 09B6A
        BSS     6                                * 09B6D

* refs (5): 04457 098E1 09B0D 09BFB 0B593
COMPCONFCRC:
        D1=(5)  #00104                           * 09B73
        C=0     A                                * 09B7A
        C=C-1   A                                * 09B7C
        DAT1=C  4                                * 09B7E
        D0=(5)  #8052F                           * 09B82
        C=DAT0  7                                * 09B89
        C=0     A                                * 09B8D
        C=DAT1  4                                * 09B8F
        D0=D0-  4                                * 09B93
        RTN                                      * 09B96

* refs (2): 099EF 09A0E
SUB_09B98:
        A=0     B                                * 09B98
        ?CBIT=0 1                                * 09B9B
        GOYES   L_09BE8                          * 09BA0
        ABIT=1  3                                * 09BA2
        ABIT=1  5                                * 09BA7
        ?CBIT=0 3                                * 09BAC
        GOYES   L_09BE8                          * 09BB1
        ABIT=1  2                                * 09BB3
        DAT1=A  B                                * 09BB8
        LC(5)   #C0000                           * 09BBB
        B=C     A                                * 09BC2
        GOSBVL  SUB_01DA1                        * 09BC4
        P=      0                                * 09BCB
        GOC     L_09BEB                          * 09BCD
        CD0EX                                    * 09BD0
        B=B-C   A                                * 09BD3
        LC(5)   #F0000                           * 09BD5
        ?B#C    A                                * 09BDC
        GOYES   L_09BEB                          * 09BDF
        LC(2)   #1C                              * 09BE1
        A=C     B                                * 09BE5
L_09BE8:
        DAT1=A  B                                * 09BE8
L_09BEB:
        RTN                                      * 09BEB

* refs (3): 02081 02093 020AA
SUB_09BED:
        D0=(5)  #8052F                           * 09BED
        C=0     W                                * 09BF4
        DAT0=C  7                                * 09BF7
        GOSUB   COMPCONFCRC                      * 09BFB
        DAT0=C  4                                * 09BFF
        RTN                                      * 09C03

* refs (1): 09AF5
SUB_09C05:
        ?ABIT=1 10                               * 09C05
        GOYES   L_09C73                          * 09C0A
        C=C+1   S                                * 09C0C
        GOSUB   SUB_09CE1                        * 09C0F
        D1=(5)  #C0000                           * 09C13
        D1=D1+  10                               * 09C1A
        P=      14                               * 09C1D
        C=DAT1  WP                               * 09C1F
        B=C     WP                               * 09C23
        D1=D1+  15                               * 09C26
        C=DAT1  WP                               * 09C29
        D=C     WP                               * 09C2D
        D1=D1-  15                               * 09C30
        P=      0                                * 09C33
L_09C35:
        C=C+1   S                                * 09C35
        GOSUB   SUB_09CE1                        * 09C38
        C=C-1   S                                * 09C3C
        P=      14                               * 09C3F
        C=DAT1  WP                               * 09C41
        ?B#C    WP                               * 09C45
        GOYES   L_09C5B                          * 09C48
        D1=D1+  15                               * 09C4A
        C=DAT1  WP                               * 09C4D
        D1=D1-  15                               * 09C51
        P=      0                                * 09C54
        ?D=C    WP                               * 09C56
        RTNYES                                   * 09C59
L_09C5B:
        P=      0                                * 09C5B
        ?A#0    S                                * 09C5D
        GOYES   L_09C6E                          * 09C60
        C=C+C   S                                * 09C62
        GONC    L_09C35                          * 09C65
        A=A+1   S                                * 09C68
        GONC    L_09C35                          * 09C6B
L_09C6E:
        A=A+1   S                                * 09C6E
        RTN                                      * 09C71
L_09C73:
        C=C+1   S                                * 09C73
        GOSUB   SUB_09CE1                        * 09C76
        D1=(5)  #C0000                           * 09C7A
        C=DAT1  A                                * 09C81
        D=C     A                                * 09C84
L_09C86:
        C=C+1   S                                * 09C86
        GOC     L_09CD1                          * 09C89
L_09C8C:
        GOSUB   SUB_09CE1                        * 09C8C
        A=DAT1  A                                * 09C90
        B=A     A                                * 09C93
        A=-A-1  A                                * 09C95
        DAT1=A  A                                * 09C97
        LC(2)   #01                              * 09C9A
        GOSUB   L_09CFA                          * 09C9E
        C=DAT1  A                                * 09CA2
        ?D#C    A                                * 09CA5
        GOYES   L_09CBD                          * 09CA8
        GOSUB   SUB_09CE1                        * 09CAA
        C=DAT1  A                                * 09CAE
        C=-C-1  A                                * 09CB1
        A=B     A                                * 09CB3
        DAT1=A  A                                * 09CB5
        ?C=A    A                                * 09CB8
        GOYES   L_09C86                          * 09CBB
L_09CBD:
        GOSUB   SUB_09CE1                        * 09CBD
        A=B     A                                * 09CC1
        DAT1=A  A                                * 09CC3
        C=C-1   S                                * 09CC6
        RTNNC                                    * 09CC9
        A=A-1   S                                * 09CCC
        RTN                                      * 09CCF
L_09CD1:
        ?A=0    S                                * 09CD1
        GOYES   L_09CDB                          * 09CD4
        A=A+1   S                                * 09CD6
        RTN                                      * 09CD9
L_09CDB:
        A=A+1   S                                * 09CDB
        GONC    L_09C8C                          * 09CDE

* refs (6): 09C0F 09C38 09C76 09C8C 09CAA 09CBD
SUB_09CE1:
        C=0     B                                * 09CE1
        P=C     15                               * 09CE4
        CPEX    0                                * 09CE8
        CAEX    S                                * 09CEC
        P=C     15                               * 09CEF
        CAEX    S                                * 09CF3
        CPEX    1                                * 09CF6
L_09CFA:
        A=0     A                                * 09CFA
        A=C     B                                * 09CFC
        D0=(5)  #7F000                           * 09CFF
        C=DAT0  B                                * 09D06
        D0=(5)  LINECOUNTg                       * 09D09
        C=DAT0  B                                * 09D10
        CBIT=0  7                                * 09D13
        ?A#0    A                                * 09D18
        GOYES   L_09D22                          * 09D1B
        CBIT=1  7                                * 09D1D
L_09D22:
        DAT0=C  B                                * 09D22
        D0=(5)  LINECOUNT                        * 09D25
        DAT0=C  B                                * 09D2C
        ?A=0    A                                * 09D2F
        RTNYES                                   * 09D32
        A=A-1   A                                * 09D34
        A=A+A   A                                * 09D36
        LC(5)   #7F040                           * 09D38
        C=C+A   A                                * 09D3F
        D0=C                                     * 09D41
        C=DAT0  B                                * 09D44
        RTN                                      * 09D47

* refs (3): 04209 7008F 70102
SUB_09D49:
        C=0     B                                * 09D49
        GOTO    L_09CFA                          * 09D4C

* refs (1): 099D7
SUB_09D50:
        D0=(5)  #0010F                           * 09D50
        C=DAT0  S                                * 09D57
        C=0     A                                * 09D5B
        ?C=0    S                                * 09D5D
        GOYES   L_09D64                          * 09D60
        C=C+1   A                                * 09D62
L_09D64:
        GOTO    L_09CFA                          * 09D64
LIB>#~1:
        GOSUBL  SAVPTR                           * 09D68
        C=DAT1  A                                * 09D6E
        D1=C                                     * 09D71
        A=DAT1  A                                * 09D74
        D1=D1+  10                               * 09D77
        LC(5)   DOEXT1                           * 09D7A
        ?C=A    A                                * 09D81
        GOYES   L_09D8D                          * 09D84
        GOVLNG  L_081C3                          * 09D86
L_09D8D:
        C=DAT1  A                                * 09D8D
        R3=C.F  A                                * 09D90
        D1=D1-  5                                * 09D96
        A=DAT1  A                                * 09D99
        D1=A                                     * 09D9C
        D1=D1+  10                               * 09D9F
        ?C=0    A                                * 09DA2
        GOYES   L_09DAB                          * 09DA5
        GOSUB   SUB_09DD6                        * 09DA7
L_09DAB:
        CD1EX                                    * 09DAB
        D0=C                                     * 09DAE
        GOSBVL  SUB_08400                        * 09DB1
        A=0     A                                * 09DB8
        A=DAT0  X                                * 09DBA
        C=R3.F  A                                * 09DBE
        ?C=0    A                                * 09DC4
        GOYES   L_09DCF                          * 09DC7
        P=      1                                * 09DC9
        GOSUB   SUB_09DD6                        * 09DCB
L_09DCF:
        GOVLNG  L_07FBD                          * 09DCF

* refs (2): 09DA7 09DCB
SUB_09DD6:
        PC=C                                     * 09DD6
        FILLTO  #09E1A                           * 09DDA  64 zero nibbles: the next entry stays at #09E1A

* refs (1): 0AB87
NEXTLIBBAK~1:
        CON(5)  (*)+5                            * 09E1A  primitive code object
        C=DAT1  A                                * 09E1F
        CD1EX                                    * 09E22
        A=DAT1  A                                * 09E25
        D1=C                                     * 09E28
        LC(5)   DOEXT1                           * 09E2B
        A=A-C   A                                * 09E32
        LC(5)   DUP                              * 09E34
        ?A=0    A                                * 09E3B
        GOYES   L_09E47                          * 09E3E
        LC(5)   OBJ_0BBA7                        * 09E40
L_09E47:
        A=C     A                                * 09E47
        PC=(A)                                   * 09E49

* refs (1): 0AB96
NEXTLIBBAK~2:
        CON(5)  (*)+5                            * 09E4D  primitive code object
        GOSBVL  SAVPTR                           * 09E52
        D1=D1+  5                                * 09E59
        GOSBVL  SUB_702A2                        * 09E5C
        R1=A.F  A                                * 09E63
        D0=(5)  PORT0EOS                         * 09E69
        C=R0.F  A                                * 09E70
        ?C=0    A                                * 09E76
        GOYES   L_09EAA                          * 09E79
        P=      4                                * 09E7B
        GOSUB   SUB_09F60                        * 09E7D
        C=C+1   A                                * 09E81
        C=C-1   A                                * 09E83
        GOC     L_09EBC                          * 09E85
        A=C     A                                * 09E88
        C=C+C   A                                * 09E8A
        C=C+C   A                                * 09E8C
        C=C+A   A                                * 09E8E
        D0=(5)  PORT0EOS                         * 09E90
        AD0EX                                    * 09E97
        A=A+C   A                                * 09E9A
        D0=A                                     * 09E9C
        A=R1.F  A                                * 09E9F
        P=      15                               * 09EA5
        GONC    L_09EAC                          * 09EA7
L_09EAA:
        P=      14                               * 09EAA
L_09EAC:
        C=DAT0  A                                * 09EAC
        ?C=A    A                                * 09EAF
        GOYES   L_09F1E                          * 09EB2
        D0=D0+  5                                * 09EB4
        P=P+1                                    * 09EB7
        GONC    L_09EAC                          * 09EB9
L_09EBC:
        GOSUB   SUB_09F51                        * 09EBC
        A=R1.F  A                                * 09EC0
        D0=A                                     * 09EC6
        A=DAT0  A                                * 09EC9
        LC(5)   DOLIB                            * 09ECC
        ?C=A    A                                * 09ED3
        GOYES   L_09EE4                          * 09ED6
        LC(5)   DOBAK                            * 09ED8
        ?C#A    A                                * 09EDF
        GOYES   L_09F3D                          * 09EE2
L_09EE4:
        C=R0.F  A                                * 09EE4
        ?C#0    A                                * 09EEA
        GOYES   L_09EF8                          * 09EED
        AD0EX                                    * 09EEF
        D0=A                                     * 09EF2
        DAT1=A  A                                * 09EF5
L_09EF8:
        GOSBVL  SKIPOB                           * 09EF8
        AD0EX                                    * 09EFF
        P=      1                                * 09F02
        GOSUB   SUB_09F51                        * 09F04
        D1=D1-  5                                * 09F08
        C=DAT1  A                                * 09F0B
        CD1EX                                    * 09F0E
        D1=D1+  5                                * 09F11
        DAT1=A  A                                * 09F14
        GOVLNG  GETPTRLOOP                       * 09F17
L_09F1E:
        P=      0                                * 09F1E
        GOSBVL  GETPTR                           * 09F20
        D1=D1+  15                               * 09F27
        D=D+CON A,3                              * 09F2A
        LC(5)   FALSE                            * 09F30
        A=C     A                                * 09F37
        PC=(A)                                   * 09F39
L_09F3D:
        P=      1                                * 09F3D
        GOSUB   SUB_09F51                        * 09F3F
        GOSBVL  GETPTR                           * 09F43
        GOVLNG  DoErrICD                         * 09F4A

* refs (3): 09EBC 09F04 09F3F
SUB_09F51:
        C=R0.F  A                                * 09F51
        ?C#0    A                                * 09F57
        GOYES   SUB_09F60                        * 09F5A
        P=      0                                * 09F5C
        RTN                                      * 09F5E

* refs (2): 09E7D 09F57
SUB_09F60:
        RSTK=C                                   * 09F60
        RTN                                      * 09F62
L_09F64:
        GOLONG  L_0AB11                          * 09F64

* refs (1): 0AAD5
PORTSTATUS~1:
        CON(5)  (*)+5                            * 09F6A  primitive code object
        GOSBVL  POP#                             * 09F6F
        GOSBVL  SAVPTR                           * 09F76
        A=A-1   A                                * 09F7D
        B=A     A                                * 09F7F
        D0=(5)  #8052F                           * 09F81
        ?A=0    A                                * 09F88
        GOYES   L_09F9D                          * 09F8B
        D0=D0+  4                                * 09F8D
        A=0     A                                * 09F90
        A=DAT0  B                                * 09F92
        D0=D0-  2                                * 09F95
        ?A<B    A                                * 09F98
        GOYES   L_09F64                          * 09F9B
L_09F9D:
        D1=D1+  5                                * 09F9D
        D1=D1+  15                               * 09FA0
        LC(5)   TRUE                             * 09FA3
        A=DAT0  1                                * 09FAA
        ?ABIT=0 3                                * 09FAE
        GOYES   L_09F64                          * 09FB3
        DAT1=C  A                                * 09FB5
        D1=D1-  5                                * 09FB8
        ?ABIT=0 2                                * 09FBB
        GOYES   L_09FC5                          * 09FC0
        DAT1=C  A                                * 09FC2
L_09FC5:
        D1=D1-  5                                * 09FC5
        ?ABIT=0 1                                * 09FC8
        GOYES   L_09FD2                          * 09FCD
        DAT1=C  A                                * 09FCF
L_09FD2:
        D1=D1-  5                                * 09FD2
        D0=D0+  1                                * 09FD5
        A=DAT0  1                                * 09FD8
        C=0     A                                * 09FDC
        P=      4                                * 09FDE
        ?ABIT=1 1                                * 09FE0
        GOYES   L_09FE9                          * 09FE5
        P=      1                                * 09FE7
L_09FE9:
        CPEX    4                                * 09FE9
        A=DAT1  A                                * 09FED
        AD1EX                                    * 09FF0
        D1=D1+  5                                * 09FF3
        DAT1=C  A                                * 09FF6
        D1=A                                     * 09FF9
        D1=D1-  5                                * 09FFC
        LC(5)   #C0000                           * 09FFF
